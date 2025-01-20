void sub_3FB4(id a1)
{
  qword_3D9A0 = ct_green_tea_logger_create();
}

void sub_3FDC(void *a1)
{
  id v1 = a1;
  if (qword_3D9A8[0] != -1) {
    dispatch_once(qword_3D9A8, &stru_39488);
  }
  if (qword_3D9A0)
  {
    v2 = getCTGreenTeaOsLogHandle();
    v3 = v2;
    if (v2 && os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v4 = +[NSBundle mainBundle];
      v5 = [v4 bundleIdentifier];
      int v6 = 138543618;
      v7 = v5;
      __int16 v8 = 2114;
      id v9 = v1;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "[%{public}@] %{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
}

void sub_4100()
{
  uint64_t v1 = sub_2EE40();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for AppsSettingsDestinationOption();
  __chkstk_darwin();
  int v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_4E60(v0, (uint64_t)v6);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_2FA90(2uLL);
      swift_bridgeObjectRetain();
      sub_2F5C0();
      swift_bridgeObjectRelease_n();
      break;
    case 2u:
      Swift::UInt v7 = 1;
      goto LABEL_5;
    case 3u:
      Swift::UInt v7 = 3;
LABEL_5:
      sub_2FA90(v7);
      break;
    default:
      (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v4, v6, v1);
      sub_2FA90(0);
      sub_4EC4(&qword_3CDA0, (void (*)(uint64_t))&type metadata accessor for PreferencesControllerRecipe);
      sub_2F570();
      (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
      break;
  }
}

Swift::Int sub_4320()
{
  return sub_2FAA0();
}

Swift::Int sub_4364()
{
  return sub_2FAA0();
}

uint64_t static ContentMessageType.__derived_enum_equals(_:_:)()
{
  return 1;
}

Swift::Int sub_43B0()
{
  return sub_2FAA0();
}

uint64_t sub_440C()
{
  swift_bridgeObjectRetain();
  sub_2F5C0();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_4464()
{
  return sub_2FAA0();
}

uint64_t sub_44BC(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_2FA30();
  }
}

Swift::Int sub_44EC()
{
  return sub_2FAA0();
}

Swift::Int sub_4524()
{
  return sub_2FAA0();
}

void sub_4558(void *a1@<X8>)
{
  *a1 = *v1;
}

void *sub_4564@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void type metadata accessor for HFHomeSettingsVisibilityState()
{
  if (!qword_3CCE0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_3CCE0);
    }
  }
}

void *initializeBufferWithCopyOfBuffer for InstalledApplicationSettings(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for InstalledApplicationSettings()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for InstalledApplicationSettings(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for InstalledApplicationSettings(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for InstalledApplicationSettings(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for InstalledApplicationSettings(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for InstalledApplicationSettings(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for InstalledApplicationSettings()
{
  return &type metadata for InstalledApplicationSettings;
}

uint64_t *sub_471C(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v6 = *(void *)(a3 - 8);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v10 = a2[1];
      *a1 = *a2;
      a1[1] = v10;
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v8 = sub_2EE40();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_483C(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 1)
  {
    return swift_bridgeObjectRelease();
  }
  else if (!result)
  {
    uint64_t v3 = sub_2EE40();
    v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    return v4(a1, v3);
  }
  return result;
}

void *sub_48DC(void *a1, void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v8 = a2[1];
    *a1 = *a2;
    a1[1] = v8;
    swift_bridgeObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v7 = sub_2EE40();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_49B8(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_4AAC((uint64_t)a1);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v7 = sub_2EE40();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_4AAC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AppsSettingsDestinationOption();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for AppsSettingsDestinationOption()
{
  uint64_t result = qword_3CD58;
  if (!qword_3CD58) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void *sub_4B54(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v6 = sub_2EE40();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_4C08(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_4AAC((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v6 = sub_2EE40();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_4CCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_4CF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_4D20()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_4D30()
{
  uint64_t result = sub_2EE40();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_4DC0()
{
  return sub_4EC4(&qword_3CD90, (void (*)(uint64_t))type metadata accessor for AppsSettingsDestinationOption);
}

unint64_t sub_4E0C()
{
  unint64_t result = qword_3CD98;
  if (!qword_3CD98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3CD98);
  }
  return result;
}

uint64_t sub_4E60(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AppsSettingsDestinationOption();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_4EC4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_4F0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2EE40();
  uint64_t v5 = *(void *)(v4 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for AppsSettingsDestinationOption();
  uint64_t v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v10 = (uint64_t *)((char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v8);
  v12 = (char *)&v25 - v11;
  uint64_t v13 = sub_5250(&qword_3CDA8);
  uint64_t v14 = __chkstk_darwin(v13 - 8);
  v16 = (char *)&v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = &v16[*(int *)(v14 + 56)];
  sub_4E60(a1, (uint64_t)v16);
  sub_4E60(a2, (uint64_t)v17);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_4E60((uint64_t)v16, (uint64_t)v10);
      uint64_t v19 = *v10;
      uint64_t v18 = v10[1];
      if (swift_getEnumCaseMultiPayload() != 1)
      {
        swift_bridgeObjectRelease();
        goto LABEL_16;
      }
      if (v19 == *(void *)v17 && v18 == *((void *)v17 + 1))
      {
        swift_bridgeObjectRelease_n();
        goto LABEL_20;
      }
      char v21 = sub_2FA30();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v21) {
        goto LABEL_20;
      }
      sub_4AAC((uint64_t)v16);
      goto LABEL_17;
    case 2u:
      if (swift_getEnumCaseMultiPayload() == 2) {
        goto LABEL_20;
      }
      goto LABEL_16;
    case 3u:
      if (swift_getEnumCaseMultiPayload() != 3) {
        goto LABEL_16;
      }
LABEL_20:
      sub_4AAC((uint64_t)v16);
      char v22 = 1;
      break;
    default:
      sub_4E60((uint64_t)v16, (uint64_t)v12);
      if (swift_getEnumCaseMultiPayload())
      {
        (*(void (**)(char *, uint64_t))(v5 + 8))(v12, v4);
LABEL_16:
        sub_5294((uint64_t)v16);
LABEL_17:
        char v22 = 0;
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v17, v4);
        char v22 = sub_2EE20();
        v23 = *(void (**)(char *, uint64_t))(v5 + 8);
        v23(v7, v4);
        v23(v12, v4);
        sub_4AAC((uint64_t)v16);
      }
      break;
  }
  return v22 & 1;
}

uint64_t sub_5250(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_5294(uint64_t a1)
{
  uint64_t v2 = sub_5250(&qword_3CDA8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

ValueMetadata *type metadata accessor for HiddenApplicationsSettings()
{
  return &type metadata for HiddenApplicationsSettings;
}

ValueMetadata *type metadata accessor for DefaultApplicationsSettings()
{
  return &type metadata for DefaultApplicationsSettings;
}

unint64_t sub_5318()
{
  unint64_t result = qword_3CDB0;
  if (!qword_3CDB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3CDB0);
  }
  return result;
}

unint64_t sub_5370()
{
  unint64_t result = qword_3CDB8;
  if (!qword_3CDB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3CDB8);
  }
  return result;
}

uint64_t sub_53D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v10 = sub_2F7A0();
  __chkstk_darwin(v10 - 8);
  uint64_t v11 = swift_allocObject();
  uint64_t v12 = v11;
  *(void *)(v11 + 16) = 0;
  switch(a4)
  {
    case 0uLL:
      sub_2F780();
      sub_2EE10();
      goto LABEL_11;
    case 1uLL:
      sub_6088(v11, a1, a2, a3, 1uLL);
      sub_2F780();
      goto LABEL_10;
    case 2uLL:
      if (qword_3CC50 != -1) {
        swift_once();
      }
      v13.super.isa = (Class)qword_3F080;
      v18._countAndFlagsBits = 0x80000000000318C0;
      v20._countAndFlagsBits = 0x70696C4320707041;
      v20._object = (void *)0xE900000000000073;
      v21.value._countAndFlagsBits = 0;
      v21.value._object = 0;
      v22._countAndFlagsBits = 0;
      v22._object = (void *)0xE000000000000000;
      sub_2ED00(v20, v21, v13, v22, v18);
      NSString v14 = sub_2F5A0();
      swift_bridgeObjectRelease();
      id v15 = [objc_allocWithZone((Class)PSSpecifier) initWithName:v14 target:0 set:0 get:0 detail:0 cell:1 edit:0];

      if (!v15)
      {
        __break(1u);
        JUMPOUT(0x5FF8);
      }
      sub_2F790();
LABEL_10:
      sub_2EE30();
LABEL_11:
      type metadata accessor for AppsSettingsDestinationOption();
      swift_storeEnumTagMultiPayload();
      return swift_release();
    case 3uLL:
      type metadata accessor for AppsSettingsDestinationOption();
      goto LABEL_13;
    default:
      sub_631C(a3, a4);
      sub_631C(a3, a4);
      if (sub_9FFC() != 32)
      {
        sub_6330(a3, a4);
        switch(v17)
        {
          case 14:
            sub_6344();
            sub_6088(v12, a1, a2, a3, a4);
            sub_2EE00();
            type metadata accessor for AppsSettingsDestinationOption();
            goto LABEL_13;
          default:
            sub_6088(v12, a1, a2, a3, a4);
            sub_2F780();
            goto LABEL_10;
        }
      }
      *a5 = a3;
      a5[1] = a4;
      type metadata accessor for AppsSettingsDestinationOption();
LABEL_13:
      swift_storeEnumTagMultiPayload();
      return swift_release();
  }
}

id sub_6088(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v6 = (void **)(a1 + 16);
  uint64_t v5 = *(void **)(a1 + 16);
  if (v5)
  {
    id v7 = *(id *)(a1 + 16);
  }
  else
  {
    id v8 = sub_6114(a2, a3, a4, a5);
    swift_beginAccess();
    uint64_t v9 = *v6;
    *uint64_t v6 = v8;
    id v7 = v8;

    uint64_t v5 = 0;
  }
  id v10 = v5;
  return v7;
}

id sub_6114(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  swift_bridgeObjectRetain();
  NSString v6 = sub_2F5A0();
  swift_bridgeObjectRelease();
  id v7 = [objc_allocWithZone((Class)PSSpecifier) initWithName:v6 target:0 set:0 get:0 detail:0 cell:1 edit:0];

  if (!v7)
  {
    sub_2F9C0();
    __break(1u);
    JUMPOUT(0x62D4);
  }
  sub_631C(a3, a4);
  NSString v8 = sub_2F5A0();
  swift_bridgeObjectRelease();
  [v7 setIdentifier:v8];

  return v7;
}

uint64_t sub_62E4()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_631C(uint64_t a1, unint64_t a2)
{
  if (a2 >= 4) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_6330(uint64_t a1, unint64_t a2)
{
  if (a2 >= 4) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_6344()
{
  unint64_t result = qword_3CE20;
  if (!qword_3CE20)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_3CE20);
  }
  return result;
}

uint64_t *sub_6384(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    sub_5250(&qword_3CE28);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_2EFE0();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = *(int *)(a3 + 20);
    id v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = sub_5250(&qword_3CE30);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
  }
  return a1;
}

uint64_t sub_64E0(uint64_t a1, uint64_t a2)
{
  sub_5250(&qword_3CE28);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_2EFE0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_5250(&qword_3CE30);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);

  return v7(v5, v6);
}

void *sub_65B8(void *a1, void *a2, uint64_t a3)
{
  sub_5250(&qword_3CE28);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_2EFE0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_5250(&qword_3CE30);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

void *sub_66C4(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_8218((uint64_t)a1, &qword_3CE28);
    sub_5250(&qword_3CE28);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_2EFE0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_5250(&qword_3CE30);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

char *sub_67E8(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_5250(&qword_3CE28);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_2EFE0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = sub_5250(&qword_3CE30);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  return a1;
}

char *sub_68FC(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_8218((uint64_t)a1, &qword_3CE28);
    uint64_t v6 = sub_5250(&qword_3CE28);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_2EFE0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = sub_5250(&qword_3CE30);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t sub_6A28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_6A3C);
}

uint64_t sub_6A3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_5250(&qword_3CE38);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = sub_5250(&qword_3CE30);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t sub_6B3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_6B50);
}

uint64_t sub_6B50(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_5250(&qword_3CE38);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = sub_5250(&qword_3CE30);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

uint64_t type metadata accessor for HiddenAppsSettingsList()
{
  uint64_t result = qword_3CE98;
  if (!qword_3CE98) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_6CA8()
{
  sub_6DD0(319, &qword_3CEA8, (uint64_t (*)(uint64_t))&type metadata accessor for DismissAction, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Environment.Content);
  if (v0 <= 0x3F)
  {
    sub_6DD0(319, (unint64_t *)&unk_3CEB0, (uint64_t (*)(uint64_t))type metadata accessor for HiddenAppsSettingsListViewModel, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Bindable);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_6DD0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_6E34()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_6E50@<X0>(uint64_t a1@<X8>)
{
  uint64_t v96 = a1;
  uint64_t v2 = type metadata accessor for HiddenAppsSettingsList();
  uint64_t v3 = v2 - 8;
  uint64_t v93 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v94 = v4;
  uint64_t v95 = (uint64_t)&v70 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = sub_2F160();
  uint64_t v84 = *(void *)(v86 - 8);
  __chkstk_darwin(v86);
  v82 = (char *)&v70 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = sub_5250(&qword_3CEE0);
  uint64_t v78 = *(void *)(v77 - 8);
  __chkstk_darwin(v77);
  uint64_t v7 = (char *)&v70 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = sub_5250(&qword_3CEE8);
  uint64_t v80 = *(void *)(v81 - 8);
  __chkstk_darwin(v81);
  uint64_t v9 = (char *)&v70 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v87 = sub_5250(&qword_3CEF0);
  uint64_t v85 = *(void *)(v87 - 8);
  __chkstk_darwin(v87);
  v83 = (char *)&v70 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_5250(&qword_3CEF8);
  __chkstk_darwin(v11);
  v79 = (char *)&v70 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_5250(&qword_3CF00);
  uint64_t v90 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  v89 = (char *)&v70 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_5250(&qword_3CF08);
  uint64_t v92 = *(void *)(v15 - 8);
  uint64_t v16 = __chkstk_darwin(v15);
  v88 = (char *)&v70 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  v91 = (char *)&v70 - v18;
  uint64_t v19 = sub_5250(&qword_3CF10);
  __chkstk_darwin(v19);
  Swift::String_optional v21 = (_OWORD *)((char *)&v70 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v22 = *(int *)(v3 + 28);
  uint64_t v97 = v1;
  uint64_t v23 = v1 + v22;
  uint64_t v75 = sub_5250(&qword_3CE30);
  uint64_t v76 = v23;
  sub_2F510();
  v24 = (char *)v102;
  swift_getKeyPath();
  *(void *)&long long v102 = v24;
  uint64_t v74 = sub_867C((unint64_t *)&qword_3D870, (void (*)(uint64_t))type metadata accessor for HiddenAppsSettingsListViewModel);
  sub_2EDA0();
  swift_release();
  uint64_t v25 = *(void *)&v24[OBJC_IVAR____TtC13InstalledApps31HiddenAppsSettingsListViewModel__hiddenApps];
  swift_bridgeObjectRetain();

  uint64_t v26 = *(void *)(v25 + 16);
  uint64_t v27 = swift_bridgeObjectRelease();
  if (v26)
  {
    uint64_t v70 = v19;
    uint64_t v71 = v11;
    uint64_t v72 = v13;
    uint64_t v73 = v15;
    __chkstk_darwin(v27);
    sub_5250(&qword_3CF18);
    sub_7FC4();
    sub_2F330();
    sub_2F1B0();
    v28 = v7;
    if (qword_3CC50 != -1) {
      swift_once();
    }
    id v29 = (id)qword_3F080;
    uint64_t v30 = sub_2F350();
    uint64_t v32 = v31;
    char v34 = v33 & 1;
    uint64_t v35 = sub_8580(&qword_3CF30, &qword_3CEE0);
    uint64_t v36 = v77;
    sub_2F3F0();
    sub_80D4(v30, v32, v34);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v78 + 8))(v28, v36);
    uint64_t v37 = v84;
    v38 = v82;
    uint64_t v39 = v86;
    (*(void (**)(char *, void, uint64_t))(v84 + 104))(v82, enum case for NavigationBarItem.TitleDisplayMode.inline(_:), v86);
    *(void *)&long long v102 = v36;
    *((void *)&v102 + 1) = v35;
    swift_getOpaqueTypeConformance2();
    v40 = v83;
    uint64_t v41 = v81;
    sub_2F450();
    (*(void (**)(char *, uint64_t))(v37 + 8))(v38, v39);
    (*(void (**)(char *, uint64_t))(v80 + 8))(v9, v41);
    uint64_t v42 = sub_2F540();
    sub_2F510();
    v43 = (char *)v102;
    swift_getKeyPath();
    *(void *)&long long v102 = v43;
    sub_2EDA0();
    swift_release();
    uint64_t v44 = *(void *)&v43[OBJC_IVAR____TtC13InstalledApps31HiddenAppsSettingsListViewModel__hiddenApps];
    swift_bridgeObjectRetain();

    uint64_t v45 = v85;
    uint64_t v46 = (uint64_t)v79;
    uint64_t v47 = v87;
    (*(void (**)(char *, char *, uint64_t))(v85 + 16))(v79, v40, v87);
    uint64_t v48 = v71;
    v49 = (uint64_t *)(v46 + *(int *)(v71 + 36));
    uint64_t *v49 = v42;
    v49[1] = v44;
    (*(void (**)(char *, uint64_t))(v45 + 8))(v40, v47);
    unint64_t v50 = sub_80E4();
    v51 = v89;
    sub_2F370();
    sub_8218(v46, &qword_3CEF8);
    swift_getKeyPath();
    uint64_t v52 = v95;
    sub_829C(v97, v95);
    unint64_t v53 = (*(unsigned __int8 *)(v93 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v93 + 80);
    uint64_t v54 = swift_allocObject();
    sub_8458(v52, v54 + v53);
    *(void *)&long long v102 = v48;
    *((void *)&v102 + 1) = v50;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    uint64_t v56 = sub_867C(&qword_3CF50, (void (*)(uint64_t))&type metadata accessor for ScenePhase);
    v57 = v88;
    uint64_t v58 = v72;
    sub_2F410();
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v90 + 8))(v51, v58);
    uint64_t v59 = v92;
    v60 = v91;
    uint64_t v61 = v73;
    (*(void (**)(char *, char *, uint64_t))(v92 + 32))(v91, v57, v73);
    (*(void (**)(_OWORD *, char *, uint64_t))(v59 + 16))(v21, v60, v61);
    swift_storeEnumTagMultiPayload();
    sub_852C();
    uint64_t v62 = sub_2EFA0();
    *(void *)&long long v102 = v58;
    *((void *)&v102 + 1) = v62;
    *(void *)&long long v103 = OpaqueTypeConformance2;
    *((void *)&v103 + 1) = v56;
    swift_getOpaqueTypeConformance2();
    sub_2F1D0();
    return (*(uint64_t (**)(char *, uint64_t))(v59 + 8))(v60, v61);
  }
  else
  {
    sub_FAD0((uint64_t)&v102);
    long long v64 = v105;
    v21[2] = v104;
    v21[3] = v64;
    v21[4] = v106;
    long long v65 = v103;
    *Swift::String_optional v21 = v102;
    v21[1] = v65;
    swift_storeEnumTagMultiPayload();
    sub_852C();
    uint64_t v66 = sub_2EFA0();
    unint64_t v67 = sub_80E4();
    uint64_t v98 = v11;
    unint64_t v99 = v67;
    uint64_t v68 = swift_getOpaqueTypeConformance2();
    uint64_t v69 = sub_867C(&qword_3CF50, (void (*)(uint64_t))&type metadata accessor for ScenePhase);
    uint64_t v98 = v13;
    unint64_t v99 = v66;
    uint64_t v100 = v68;
    uint64_t v101 = v69;
    swift_getOpaqueTypeConformance2();
    return sub_2F1D0();
  }
}

uint64_t sub_7A88()
{
  type metadata accessor for HiddenAppsSettingsList();
  sub_5250(&qword_3CE30);
  sub_2F510();
  swift_getKeyPath();
  sub_867C((unint64_t *)&qword_3D870, (void (*)(uint64_t))type metadata accessor for HiddenAppsSettingsListViewModel);
  sub_2EDA0();
  swift_release();
  swift_bridgeObjectRetain();

  sub_5250(&qword_3D860);
  sub_8580(&qword_3CF60, &qword_3D860);
  sub_8080();
  sub_85C4();
  return sub_2F4F0();
}

uint64_t sub_7BF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)a1;
  unint64_t v4 = *(void *)(a1 + 8);
  uint64_t v15 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = *(void *)(a1 + 24);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 56);
  uint64_t v14 = *(void *)(a1 + 64);
  char v13 = *(unsigned char *)(a1 + 72);
  type metadata accessor for AppsSettingsListViewModel();
  sub_631C(v3, v4);
  sub_8618(v5, v6, v7, v8, v9, v10, v14, v13);
  sub_867C((unint64_t *)&qword_3D710, (void (*)(uint64_t))type metadata accessor for AppsSettingsListViewModel);
  uint64_t result = sub_2EFC0();
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v12 & 1;
  *(void *)(a2 + 16) = v15;
  *(void *)(a2 + 24) = v4;
  *(void *)(a2 + 32) = v5;
  *(void *)(a2 + 40) = v6;
  *(void *)(a2 + 48) = v7;
  *(void *)(a2 + 56) = v8;
  *(void *)(a2 + 64) = v9;
  *(void *)(a2 + 72) = v10;
  *(void *)(a2 + 80) = v14;
  *(unsigned char *)(a2 + 88) = v13;
  return result;
}

uint64_t sub_7D18(uint64_t a1)
{
  uint64_t v2 = sub_2EFA0();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_2F080();
}

uint64_t sub_7DE0()
{
  uint64_t v0 = sub_2EFE0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_2EFA0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for ScenePhase.background(_:), v4);
  char v8 = sub_2EF90();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (v8)
  {
    sub_176AC((uint64_t)v3);
    sub_2EFD0();
    return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }
  return result;
}

uint64_t sub_7F94()
{
  return sub_2F3E0();
}

uint64_t sub_7FBC()
{
  return sub_7A88();
}

unint64_t sub_7FC4()
{
  unint64_t result = qword_3CF20;
  if (!qword_3CF20)
  {
    sub_8038(&qword_3CF18);
    sub_8080();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3CF20);
  }
  return result;
}

uint64_t sub_8038(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_8080()
{
  unint64_t result = qword_3CF28;
  if (!qword_3CF28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3CF28);
  }
  return result;
}

uint64_t sub_80D4(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

unint64_t sub_80E4()
{
  unint64_t result = qword_3CF38;
  if (!qword_3CF38)
  {
    sub_8038(&qword_3CEF8);
    sub_8038(&qword_3CEE8);
    sub_8038(&qword_3CEE0);
    sub_8580(&qword_3CF30, &qword_3CEE0);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_8580(&qword_3CF40, &qword_3CF48);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3CF38);
  }
  return result;
}

uint64_t sub_8218(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_5250(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_8274()
{
  return sub_2F070();
}

uint64_t sub_829C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for HiddenAppsSettingsList();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_8300()
{
  uint64_t v1 = type metadata accessor for HiddenAppsSettingsList();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  sub_5250(&qword_3CE28);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_2EFE0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  }
  else
  {
    swift_release();
  }
  uint64_t v6 = v0 + v3 + *(int *)(v1 + 20);
  uint64_t v7 = sub_5250(&qword_3CE30);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_8458(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for HiddenAppsSettingsList();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_84BC()
{
  type metadata accessor for HiddenAppsSettingsList();

  return sub_7DE0();
}

unint64_t sub_852C()
{
  unint64_t result = qword_3CF58;
  if (!qword_3CF58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3CF58);
  }
  return result;
}

uint64_t sub_8580(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_8038(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_85C4()
{
  unint64_t result = qword_3CF68;
  if (!qword_3CF68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3CF68);
  }
  return result;
}

uint64_t sub_8618(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  if (a8 < 0)
  {
    sub_8674();
    swift_bridgeObjectRetain();
  }
  else
  {
    sub_8674();
  }

  return swift_bridgeObjectRetain();
}

uint64_t sub_8674()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_867C(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_86C8()
{
  unint64_t result = qword_3CF70;
  if (!qword_3CF70)
  {
    sub_8038(&qword_3CF78);
    sub_852C();
    sub_8038(&qword_3CF00);
    sub_2EFA0();
    sub_8038(&qword_3CEF8);
    sub_80E4();
    swift_getOpaqueTypeConformance2();
    sub_867C(&qword_3CF50, (void (*)(uint64_t))&type metadata accessor for ScenePhase);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3CF70);
  }
  return result;
}

uint64_t sub_8804()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_8880(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + OBJC_IVAR____TtC13InstalledApps31HiddenAppsSettingsListViewModel__hiddenApps) = a2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

char *sub_88C4()
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = sub_5250(&qword_3D040);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_OWORD *)&v0[OBJC_IVAR____TtC13InstalledApps31HiddenAppsSettingsListViewModel__currentSelection] = xmmword_30620;
  *(void *)&v0[OBJC_IVAR____TtC13InstalledApps31HiddenAppsSettingsListViewModel__hiddenApps] = &_swiftEmptyArrayStorage;
  *(void *)&v0[OBJC_IVAR____TtC13InstalledApps31HiddenAppsSettingsListViewModel_subscription] = 0;
  sub_2EDB0();
  v15.receiver = v0;
  v15.super_class = ObjectType;
  id v5 = objc_msgSendSuper2(&v15, "init");
  sub_2F6F0();
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  id v7 = v5;
  id v8 = [ObjCClassFromMetadata subjectMonitorRegistry];
  uint64_t v9 = (char *)v7;
  id v10 = [v8 addMonitor:v9];
  swift_unknownObjectRelease();

  *(void *)&v9[OBJC_IVAR____TtC13InstalledApps31HiddenAppsSettingsListViewModel_subscription] = v10;
  swift_unknownObjectRelease();
  sub_2F650();
  uint64_t v11 = sub_2F670();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v4, 0, 1, v11);
  char v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = v9;
  char v13 = v9;
  sub_93C0((uint64_t)v4, (uint64_t)&unk_3D060, (uint64_t)v12);
  swift_release();
  sub_97E4((uint64_t)v4);

  return v13;
}

id sub_8AE8()
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC13InstalledApps31HiddenAppsSettingsListViewModel_subscription];
  if (v2) {
    [v2 invalidate];
  }
  v4.receiver = v0;
  v4.super_class = ObjectType;
  return objc_msgSendSuper2(&v4, "dealloc");
}

uint64_t sub_8C64()
{
  return type metadata accessor for HiddenAppsSettingsListViewModel();
}

uint64_t type metadata accessor for HiddenAppsSettingsListViewModel()
{
  uint64_t result = qword_3CFC8;
  if (!qword_3CFC8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_8CB8()
{
  uint64_t result = sub_2EDC0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_8D6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 56) = a4;
  return _swift_task_switch(sub_8DFC, 0, 0);
}

uint64_t sub_8DFC()
{
  uint64_t v37 = v0;
  id v1 = [self hiddenApplications];
  sub_2F6F0();
  unint64_t v2 = sub_2F600();

  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_2F9D0();
    swift_bridgeObjectRelease();
    uint64_t v31 = v0;
    if (v3) {
      goto LABEL_3;
    }
LABEL_17:
    id v5 = (char *)_swiftEmptyArrayStorage;
    goto LABEL_18;
  }
  uint64_t v3 = *(void *)((char *)&dword_10 + (v2 & 0xFFFFFFFFFFFFFF8));
  uint64_t v31 = v0;
  if (!v3) {
    goto LABEL_17;
  }
LABEL_3:
  if (v3 < 1) {
    __break(1u);
  }
  uint64_t v4 = 0;
  uint64_t v35 = (void **)(v0 + 2);
  id v5 = (char *)_swiftEmptyArrayStorage;
  unint64_t v33 = v2;
  unint64_t v34 = v2 & 0xC000000000000001;
  uint64_t v6 = &HiddenAppsSettingsListViewModel;
  uint64_t v32 = v3;
  do
  {
    if (v34) {
      id v8 = (id)sub_2F990();
    }
    else {
      id v8 = *(id *)(v2 + 8 * v4 + 32);
    }
    uint64_t v9 = v8;
    id v10 = [v8 (SEL)v6[277].count];
    sub_2F5B0();

    id v11 = objc_allocWithZone((Class)LSApplicationRecord);
    NSString v12 = sub_2F5A0();
    swift_bridgeObjectRelease();
    *uint64_t v35 = 0;
    id v13 = [v11 initWithBundleIdentifier:v12 allowPlaceholder:0 error:v35];

    uint64_t v14 = *v35;
    if (v13)
    {
      id v15 = v14;
      id v16 = [v13 localizedName];
      uint64_t v17 = v6;
      uint64_t v18 = sub_2F5B0();
      uint64_t v20 = v19;

      id v21 = [v9 (SEL)v17[277].count];
      uint64_t v22 = sub_2F5B0();
      uint64_t v24 = v23;

      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        id v5 = sub_28D88(0, *((void *)v5 + 2) + 1, 1, v5);
      }
      unint64_t v26 = *((void *)v5 + 2);
      unint64_t v25 = *((void *)v5 + 3);
      if (v26 >= v25 >> 1) {
        id v5 = sub_28D88((char *)(v25 > 1), v26 + 1, 1, v5);
      }
      *((void *)v5 + 2) = v26 + 1;
      uint64_t v27 = &v5[80 * v26];
      *((void *)v27 + 4) = v22;
      *((void *)v27 + 5) = v24;
      *((void *)v27 + 6) = v22;
      *((void *)v27 + 7) = v24;
      *((void *)v27 + 8) = 0;
      *((void *)v27 + 9) = v18;
      *((void *)v27 + 11) = 0;
      *((void *)v27 + 12) = 0;
      *((void *)v27 + 10) = v20;
      v27[104] = 0;

      uint64_t v3 = v32;
      unint64_t v2 = v33;
      uint64_t v6 = &HiddenAppsSettingsListViewModel;
    }
    else
    {
      id v7 = v14;
      sub_2ED10();

      swift_willThrow();
      swift_errorRelease();
    }
    ++v4;
  }
  while (v3 != v4);
LABEL_18:
  swift_bridgeObjectRelease();
  v31[8] = v5;
  uint64_t v36 = v5;
  swift_bridgeObjectRetain_n();
  sub_29844((uint64_t *)&v36);
  v31[9] = 0;
  swift_bridgeObjectRelease();
  v31[10] = v36;
  swift_unknownObjectWeakInit();
  sub_2F640();
  v31[11] = sub_2F630();
  uint64_t v29 = sub_2F620();
  return _swift_task_switch(sub_921C, v29, v28);
}

uint64_t sub_921C()
{
  swift_release();
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    unint64_t v2 = (void *)Strong;
    uint64_t v3 = v0[10];
    swift_getKeyPath();
    uint64_t v4 = swift_task_alloc();
    *(void *)(v4 + 16) = v2;
    *(void *)(v4 + 24) = v3;
    v0[6] = v2;
    sub_96DC();
    swift_bridgeObjectRetain();
    sub_2ED90();
    swift_bridgeObjectRelease();

    swift_release();
    swift_release_n();
    swift_task_dealloc();
  }
  else
  {
    swift_release();
    swift_bridgeObjectRelease();
  }
  swift_unknownObjectWeakDestroy();
  id v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_93C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_5250(&qword_3D040);
  __chkstk_darwin(v6 - 8);
  id v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_9844(a1, (uint64_t)v8);
  uint64_t v9 = sub_2F670();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_97E4((uint64_t)v8);
    if (*(void *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v11 = sub_2F620();
      uint64_t v13 = v12;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_2F660();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v9);
    if (*(void *)(a3 + 16)) {
      goto LABEL_3;
    }
  }
  uint64_t v11 = 0;
  uint64_t v13 = 0;
LABEL_6:
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a2;
  *(void *)(v14 + 24) = a3;
  if (v13 | v11)
  {
    v16[0] = 0;
    v16[1] = 0;
    v16[2] = v11;
    v16[3] = v13;
  }
  return swift_task_create();
}

unint64_t sub_96DC()
{
  unint64_t result = qword_3D870;
  if (!qword_3D870)
  {
    type metadata accessor for HiddenAppsSettingsListViewModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D870);
  }
  return result;
}

uint64_t sub_9738()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_9B1C;
  v3[7] = v2;
  return _swift_task_switch(sub_8DFC, 0, 0);
}

uint64_t sub_97E4(uint64_t a1)
{
  uint64_t v2 = sub_5250(&qword_3D040);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_9844(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_5250(&qword_3D040);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_98AC()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_98E4()
{
  *(void *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC13InstalledApps31HiddenAppsSettingsListViewModel__hiddenApps) = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_992C()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_996C()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_9A18;
  v3[7] = v2;
  return _swift_task_switch(sub_8DFC, 0, 0);
}

uint64_t sub_9A18()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_9B0C(uint64_t a1, unint64_t a2)
{
  if (a2 != 4) {
    return sub_6330(a1, a2);
  }
  return a1;
}

unint64_t sub_9B20(char a1)
{
  unint64_t result = 0xD000000000000014;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 2:
    case 4:
    case 8:
    case 14:
    case 18:
    case 29:
      unint64_t result = 0xD000000000000013;
      break;
    case 3:
      unint64_t result = 0xD000000000000015;
      break;
    case 5:
      unint64_t result = 0xD000000000000012;
      break;
    case 6:
      unint64_t result = 0xD000000000000014;
      break;
    case 7:
      unint64_t result = 0xD000000000000015;
      break;
    case 9:
      unint64_t result = 0xD000000000000012;
      break;
    case 10:
      unint64_t result = 0xD000000000000016;
      break;
    case 11:
    case 15:
    case 21:
    case 23:
    case 24:
      unint64_t result = 0x6C7070612E6D6F63;
      break;
    case 12:
      unint64_t result = 0xD000000000000010;
      break;
    case 13:
      unint64_t result = 0xD000000000000011;
      break;
    case 16:
      unint64_t result = 0xD000000000000011;
      break;
    case 17:
      unint64_t result = 0xD000000000000011;
      break;
    case 19:
      unint64_t result = 0xD000000000000010;
      break;
    case 20:
      unint64_t result = 0xD000000000000011;
      break;
    case 22:
      unint64_t result = 0xD000000000000011;
      break;
    case 25:
      unint64_t result = 0xD000000000000019;
      break;
    case 26:
      unint64_t result = 0xD000000000000010;
      break;
    case 27:
      unint64_t result = 0xD000000000000010;
      break;
    case 28:
      unint64_t result = 0xD000000000000012;
      break;
    case 30:
      unint64_t result = 0xD000000000000012;
      break;
    case 31:
      unint64_t result = 0xD000000000000012;
      break;
    default:
      return result;
  }
  return result;
}

Swift::Int sub_9DEC()
{
  char v1 = *v0;
  sub_2FA80();
  sub_9B20(v1);
  sub_2F5C0();
  swift_bridgeObjectRelease();
  return sub_2FAA0();
}

uint64_t sub_9E50()
{
  sub_9B20(*v0);
  sub_2F5C0();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_9EA4()
{
  char v1 = *v0;
  sub_2FA80();
  sub_9B20(v1);
  sub_2F5C0();
  swift_bridgeObjectRelease();
  return sub_2FAA0();
}

uint64_t sub_9F04@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_9FFC();
  *a1 = result;
  return result;
}

unint64_t sub_9F34@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_9B20(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_9F60(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = sub_9B20(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_9B20(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_2FA30();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

void sub_9FEC(void *a1@<X8>)
{
  *a1 = &off_398E0;
}

uint64_t sub_9FFC()
{
  unint64_t v0 = sub_2FA40();
  swift_bridgeObjectRelease();
  if (v0 >= 0x20) {
    return 32;
  }
  else {
    return v0;
  }
}

unsigned char *initializeBufferWithCopyOfBuffer for AppleSystemApplicationBundleIdentifiers(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AppleSystemApplicationBundleIdentifiers(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xE1) {
    goto LABEL_17;
  }
  if (a2 + 31 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 31) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 31;
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
      return (*a1 | (v4 << 8)) - 31;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 31;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x20;
  int v8 = v6 - 32;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for AppleSystemApplicationBundleIdentifiers(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 31 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 31) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xE1) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xE0)
  {
    unsigned int v6 = ((a2 - 225) >> 8) + 1;
    *unint64_t result = a2 + 31;
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
        JUMPOUT(0xA1BCLL);
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
          *unint64_t result = a2 + 31;
        break;
    }
  }
  return result;
}

uint64_t sub_A1E4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_A1EC(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AppleSystemApplicationBundleIdentifiers()
{
  return &type metadata for AppleSystemApplicationBundleIdentifiers;
}

unint64_t sub_A208()
{
  unint64_t result = qword_3D070;
  if (!qword_3D070)
  {
    sub_8038(&qword_3D078);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D070);
  }
  return result;
}

unint64_t sub_A268()
{
  unint64_t result = qword_3D080;
  if (!qword_3D080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D080);
  }
  return result;
}

unint64_t destroy for AppsSettingsListItemIdentifier(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 8);
  if (result >= 0xFFFFFFFF) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s13InstalledApps30AppsSettingsListItemIdentifierOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
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

void *assignWithCopy for AppsSettingsListItemIdentifier(void *a1, void *a2)
{
  unint64_t v4 = a2[1];
  if (a1[1] < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for AppsSettingsListItemIdentifier(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 8) < 0xFFFFFFFFuLL) {
    goto LABEL_5;
  }
  unint64_t v4 = *(void *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AppsSettingsListItemIdentifier(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFC && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483644);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 3;
  if (v4 >= 5) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for AppsSettingsListItemIdentifier(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFB)
  {
    *(void *)unint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483644;
    if (a3 >= 0x7FFFFFFC) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFC) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 3;
    }
  }
  return result;
}

uint64_t sub_A4DC(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_A4F4(void *result, int a2)
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

ValueMetadata *type metadata accessor for AppsSettingsListItemIdentifier()
{
  return &type metadata for AppsSettingsListItemIdentifier;
}

Swift::Int sub_A524()
{
  uint64_t v1 = *(void *)(v0 + 8);
  sub_2FA80();
  switch(v1)
  {
    case 0:
      Swift::UInt v2 = 0;
      goto LABEL_7;
    case 1:
      Swift::UInt v2 = 1;
      goto LABEL_7;
    case 2:
      Swift::UInt v2 = 3;
      goto LABEL_7;
    case 3:
      Swift::UInt v2 = 4;
LABEL_7:
      sub_2FA90(v2);
      break;
    default:
      sub_2FA90(2uLL);
      sub_2F5C0();
      break;
  }
  return sub_2FAA0();
}

void sub_A5F4()
{
  switch(*(void *)(v0 + 8))
  {
    case 0:
      Swift::UInt v1 = 0;
      goto LABEL_9;
    case 1:
      Swift::UInt v1 = 1;
      goto LABEL_9;
    case 2:
      Swift::UInt v1 = 3;
      goto LABEL_9;
    case 3:
      Swift::UInt v1 = 4;
LABEL_9:
      sub_2FA90(v1);
      break;
    default:
      sub_2FA90(2uLL);
      sub_2F5C0();
      break;
  }
}

Swift::Int sub_A6BC()
{
  uint64_t v1 = *(void *)(v0 + 8);
  sub_2FA80();
  switch(v1)
  {
    case 0:
      Swift::UInt v2 = 0;
      goto LABEL_7;
    case 1:
      Swift::UInt v2 = 1;
      goto LABEL_7;
    case 2:
      Swift::UInt v2 = 3;
      goto LABEL_7;
    case 3:
      Swift::UInt v2 = 4;
LABEL_7:
      sub_2FA90(v2);
      break;
    default:
      sub_2FA90(2uLL);
      sub_2F5C0();
      break;
  }
  return sub_2FAA0();
}

uint64_t sub_A788(uint64_t *a1, uint64_t a2)
{
  return sub_A958(*a1, a1[1], *(void *)a2, *(void *)(a2 + 8));
}

unint64_t sub_A7A0()
{
  unint64_t result = qword_3D088;
  if (!qword_3D088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D088);
  }
  return result;
}

uint64_t sub_A7F4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = *v1;
  unint64_t v3 = v1[1];
  *a1 = *v1;
  a1[1] = v3;
  return sub_631C(v2, v3);
}

uint64_t sub_A800(Swift::String a1)
{
  a1._countAndFlagsBits = 0xD000000000000023;
  switch((unint64_t)a1._object)
  {
    case 0uLL:
      return a1._countAndFlagsBits;
    case 1uLL:
      a1._countAndFlagsBits = 0xD000000000000027;
      break;
    case 2uLL:
      a1._countAndFlagsBits = 0xD000000000000020;
      break;
    case 3uLL:
      a1._countAndFlagsBits = 0xD00000000000001ELL;
      break;
    default:
      v4[4] = v1;
      v4[5] = v2;
      strcpy((char *)v4, "application: ");
      HIWORD(v4[1]) = -4864;
      sub_2F5D0(a1);
      a1._countAndFlagsBits = v4[0];
      break;
  }
  return a1._countAndFlagsBits;
}

uint64_t sub_A8F8()
{
  return sub_A800(*v0);
}

unint64_t sub_A904()
{
  unint64_t result = qword_3D090;
  if (!qword_3D090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D090);
  }
  return result;
}

uint64_t sub_A958(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  switch(a2)
  {
    case 0:
      if (a4) {
        goto LABEL_14;
      }
      uint64_t result = 1;
      break;
    case 1:
      if (a4 != 1) {
        goto LABEL_14;
      }
      uint64_t result = 1;
      break;
    case 2:
      if (a4 != 2) {
        goto LABEL_14;
      }
      uint64_t result = 1;
      break;
    case 3:
      if (a4 != 3) {
        goto LABEL_14;
      }
      uint64_t result = 1;
      break;
    default:
      if (a4 < 4)
      {
LABEL_14:
        uint64_t result = 0;
      }
      else if (a1 == a3 && a2 == a4)
      {
        uint64_t result = 1;
      }
      else
      {
        uint64_t result = sub_2FA30();
      }
      break;
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for AppsSettingsListLinkModel(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for AppsSettingsListItemModel(uint64_t a1)
{
  if (*(void *)(a1 + 8) >= 4uLL) {
    swift_bridgeObjectRelease();
  }
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void *)(a1 + 24);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 64);
  char v9 = *(unsigned char *)(a1 + 72);

  return sub_AA88(v2, v3, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_AA88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  if (a8 < 0)
  {
    sub_AAE0();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_AAE0();
  }

  return swift_bridgeObjectRelease();
}

uint64_t sub_AAE0()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AppsSettingsListItemModel(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void *)(a2 + 8);
  if (v4 >= 4)
  {
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v4;
    swift_bridgeObjectRetain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v11 = *(void *)(a2 + 64);
  char v12 = *(unsigned char *)(a2 + 72);
  sub_8618(v5, v6, v7, v8, v9, v10, v11, v12);
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  *(unsigned char *)(a1 + 72) = v12;
  return a1;
}

uint64_t assignWithCopy for AppsSettingsListItemModel(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void *)(a2 + 8);
  if (*(void *)(a1 + 8) >= 4uLL)
  {
    if (v4 >= 4)
    {
      *(void *)a1 = *(void *)a2;
      *(void *)(a1 + 8) = *(void *)(a2 + 8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_8;
    }
    sub_ACB4(a1);
    goto LABEL_6;
  }
  if (v4 < 4)
  {
LABEL_6:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_8;
  }
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
LABEL_8:
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v11 = *(void *)(a2 + 64);
  char v12 = *(unsigned char *)(a2 + 72);
  sub_8618(v5, v6, v7, v8, v9, v10, v11, v12);
  uint64_t v13 = *(void *)(a1 + 16);
  uint64_t v14 = *(void *)(a1 + 24);
  uint64_t v15 = *(void *)(a1 + 32);
  uint64_t v16 = *(void *)(a1 + 40);
  uint64_t v17 = *(void *)(a1 + 48);
  uint64_t v18 = *(void *)(a1 + 56);
  uint64_t v19 = *(void *)(a1 + 64);
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  char v20 = *(unsigned char *)(a1 + 72);
  *(unsigned char *)(a1 + 72) = v12;
  sub_AA88(v13, v14, v15, v16, v17, v18, v19, v20);
  return a1;
}

uint64_t sub_ACB4(uint64_t a1)
{
  uint64_t v2 = sub_5250(&qword_3D098);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

__n128 initializeWithTake for AppsSettingsListItemModel(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 57) = *(_OWORD *)(a2 + 57);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for AppsSettingsListItemModel(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 8) >= 4uLL)
  {
    unint64_t v4 = *(void *)(a2 + 8);
    if (v4 >= 4)
    {
      *(void *)a1 = *(void *)a2;
      *(void *)(a1 + 8) = v4;
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    sub_ACB4(a1);
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_6:
  uint64_t v5 = *(void *)(a2 + 64);
  char v6 = *(unsigned char *)(a2 + 72);
  uint64_t v7 = *(void *)(a1 + 16);
  uint64_t v8 = *(void *)(a1 + 24);
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 56);
  uint64_t v13 = *(void *)(a1 + 64);
  long long v14 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v14;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = v5;
  char v15 = *(unsigned char *)(a1 + 72);
  *(unsigned char *)(a1 + 72) = v6;
  sub_AA88(v7, v8, v9, v10, v11, v12, v13, v15);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppsSettingsListItemModel(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 73)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *(void *)(a1 + 32) >> 1;
  if (v2 > 0x80000000) {
    int v3 = ~v2;
  }
  else {
    int v3 = -1;
  }
  return (v3 + 1);
}

double storeEnumTagSinglePayload for AppsSettingsListItemModel(uint64_t a1, int a2, int a3)
{
  if (a2 < 0)
  {
    double result = 0.0;
    *(_OWORD *)(a1 + 56) = 0u;
    *(_OWORD *)(a1 + 40) = 0u;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_OWORD *)(a1 + 8) = 0u;
    *(unsigned char *)(a1 + 72) = 0;
    *(void *)a1 = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(a1 + 73) = 1;
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
      *(void *)(a1 + 16) = 0;
      *(void *)(a1 + 24) = 0;
      *(void *)(a1 + 32) = 2 * -a2;
      double result = 0.0;
      *(_OWORD *)(a1 + 40) = 0u;
      *(_OWORD *)(a1 + 56) = 0u;
      *(unsigned char *)(a1 + 72) = 0;
      return result;
    }
    *(unsigned char *)(a1 + 73) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppsSettingsListItemModel()
{
  return &type metadata for AppsSettingsListItemModel;
}

uint64_t sub_AE9C(long long *a1, long long *a2)
{
  sub_B43C(a1, v4);
  sub_B43C(a2, v5);
  return sub_B804(v4, v5) & 1;
}

uint64_t sub_AEE8(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[3];
  v7[2] = a1[2];
  v8[0] = v2;
  *(_OWORD *)((char *)v8 + 9) = *(_OWORD *)((char *)a1 + 57);
  long long v3 = a1[1];
  v7[0] = *a1;
  v7[1] = v3;
  long long v4 = a2[3];
  v9[2] = a2[2];
  v10[0] = v4;
  *(_OWORD *)((char *)v10 + 9) = *(_OWORD *)((char *)a2 + 57);
  long long v5 = a2[1];
  v9[0] = *a2;
  v9[1] = v5;
  return sub_B4B0((uint64_t)v7, (uint64_t)v9) & 1;
}

unint64_t sub_AF44()
{
  uint64_t v1 = *v0;
  long long v2 = (void *)v0[1];
  sub_631C(*v0, (unint64_t)v2);
  v4._countAndFlagsBits = v1;
  v4._object = v2;
  v5._countAndFlagsBits = sub_A800(v4);
  sub_2F5D0(v5);
  swift_bridgeObjectRelease();
  sub_6330(v1, (unint64_t)v2);
  return 0xD00000000000001ALL;
}

unint64_t sub_AFD0()
{
  unint64_t result = qword_3D0A0;
  if (!qword_3D0A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D0A0);
  }
  return result;
}

BOOL sub_B024(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[3];
  v7[2] = a1[2];
  v8[0] = v2;
  *(_OWORD *)((char *)v8 + 9) = *(_OWORD *)((char *)a1 + 57);
  long long v3 = a1[1];
  v7[0] = *a1;
  v7[1] = v3;
  long long v4 = a2[3];
  v9[2] = a2[2];
  v10[0] = v4;
  *(_OWORD *)((char *)v10 + 9) = *(_OWORD *)((char *)a2 + 57);
  long long v5 = a2[1];
  v9[0] = *a2;
  v9[1] = v5;
  return sub_BA20((uint64_t)v7, (uint64_t)v9);
}

BOOL sub_B080(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[3];
  v7[2] = a1[2];
  v8[0] = v2;
  *(_OWORD *)((char *)v8 + 9) = *(_OWORD *)((char *)a1 + 57);
  long long v3 = a1[1];
  v7[0] = *a1;
  v7[1] = v3;
  long long v4 = a2[3];
  v9[2] = a2[2];
  v10[0] = v4;
  *(_OWORD *)((char *)v10 + 9) = *(_OWORD *)((char *)a2 + 57);
  long long v5 = a2[1];
  v9[0] = *a2;
  v9[1] = v5;
  return sub_B0DC((uint64_t)v7, (uint64_t)v9);
}

BOOL sub_B0DC(uint64_t a1, uint64_t a2)
{
  sub_B43C((long long *)(a2 + 16), v6);
  sub_B43C((long long *)(a1 + 16), v5);
  sub_B43C(v6, &v7);
  if ((v8 & 0x80000000) == 0)
  {
    sub_B43C(v5, &v9);
    if (v10 < 0) {
      goto LABEL_5;
    }
LABEL_7:
    sub_B45C();
    BOOL v3 = sub_2F860() == -1;
    return !v3;
  }
  v8 &= ~0x80u;
  sub_B43C(v5, &v9);
  if (v10 < 0)
  {
    v10 &= ~0x80u;
    goto LABEL_7;
  }
LABEL_5:
  BOOL v3 = 0;
  return !v3;
}

BOOL sub_B1C0(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[3];
  v7[2] = a1[2];
  v8[0] = v2;
  *(_OWORD *)((char *)v8 + 9) = *(_OWORD *)((char *)a1 + 57);
  long long v3 = a1[1];
  v7[0] = *a1;
  v7[1] = v3;
  long long v4 = a2[3];
  v9[2] = a2[2];
  v10[0] = v4;
  *(_OWORD *)((char *)v10 + 9) = *(_OWORD *)((char *)a2 + 57);
  long long v5 = a2[1];
  v9[0] = *a2;
  v9[1] = v5;
  return sub_B21C((uint64_t)v7, (uint64_t)v9);
}

BOOL sub_B21C(uint64_t a1, uint64_t a2)
{
  sub_B43C((long long *)(a1 + 16), v6);
  sub_B43C((long long *)(a2 + 16), v5);
  sub_B43C(v6, &v7);
  if ((v8 & 0x80000000) == 0)
  {
    sub_B43C(v5, &v9);
    if (v10 < 0) {
      goto LABEL_5;
    }
LABEL_7:
    sub_B45C();
    BOOL v3 = sub_2F860() == -1;
    return !v3;
  }
  v8 &= ~0x80u;
  sub_B43C(v5, &v9);
  if (v10 < 0)
  {
    v10 &= ~0x80u;
    goto LABEL_7;
  }
LABEL_5:
  BOOL v3 = 0;
  return !v3;
}

BOOL sub_B300(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[3];
  v7[2] = a1[2];
  v8[0] = v2;
  *(_OWORD *)((char *)v8 + 9) = *(_OWORD *)((char *)a1 + 57);
  long long v3 = a1[1];
  v7[0] = *a1;
  v7[1] = v3;
  long long v4 = a2[3];
  v9[2] = a2[2];
  v10[0] = v4;
  *(_OWORD *)((char *)v10 + 9) = *(_OWORD *)((char *)a2 + 57);
  long long v5 = a2[1];
  v9[0] = *a2;
  v9[1] = v5;
  return sub_B35C((uint64_t)v7, (uint64_t)v9);
}

BOOL sub_B35C(uint64_t a1, uint64_t a2)
{
  sub_B43C((long long *)(a2 + 16), v5);
  sub_B43C((long long *)(a1 + 16), v4);
  sub_B43C(v5, &v6);
  if (v7 < 0)
  {
    v7 &= ~0x80u;
    sub_B43C(v4, &v8);
    if ((v9 & 0x80000000) == 0) {
      return 0;
    }
    v9 &= ~0x80u;
  }
  else
  {
    sub_B43C(v4, &v8);
    if (v9 < 0) {
      return 0;
    }
  }
  sub_B45C();
  return sub_2F860() == -1;
}

_OWORD *sub_B43C(long long *a1, _OWORD *a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  long long v4 = a1[2];
  *(_OWORD *)((char *)a2 + 41) = *(long long *)((char *)a1 + 41);
  a2[1] = v3;
  a2[2] = v4;
  *a2 = v2;
  return a2;
}

unint64_t sub_B45C()
{
  unint64_t result = qword_3D0A8;
  if (!qword_3D0A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D0A8);
  }
  return result;
}

uint64_t sub_B4B0(uint64_t a1, uint64_t a2)
{
  sub_BB00((__n128 *)a1, &v39);
  sub_BB00((__n128 *)a2, &v38);
  sub_BB00(&v39, &v40);
  unint64_t v4 = v40.n128_u64[1];
  switch(v40.n128_u64[1])
  {
    case 0uLL:
      sub_BB00(&v38, &v41);
      if (v41.n128_u64[1]) {
        return 0;
      }
      goto LABEL_13;
    case 1uLL:
      sub_BB00(&v38, &v41);
      if (v41.n128_u64[1] != 1) {
        return 0;
      }
      goto LABEL_13;
    case 2uLL:
      sub_BB00(&v38, &v41);
      if (v41.n128_u64[1] != 2) {
        return 0;
      }
      goto LABEL_13;
    case 3uLL:
      sub_BB00(&v38, &v41);
      if (v41.n128_u64[1] == 3) {
        goto LABEL_13;
      }
      return 0;
    default:
      unint64_t v5 = v40.n128_u64[0];
      sub_BB00(&v38, &v41);
      if (v41.n128_u64[1] < 4) {
        return 0;
      }
      if (__PAIR128__(v4, v5) != *(_OWORD *)&v41)
      {
        char v6 = sub_2FA30();
        uint64_t result = 0;
        if ((v6 & 1) == 0) {
          return result;
        }
      }
LABEL_13:
      sub_B43C((long long *)(a1 + 16), v37);
      sub_B43C((long long *)(a2 + 16), v36);
      sub_B43C(v37, &v42);
      int v8 = v48;
      if ((v48 & 0x80) != 0)
      {
        v48 &= ~0x80u;
        long long v17 = v42;
        char v18 = v43;
        uint64_t v19 = v44;
        uint64_t v20 = v45;
        uint64_t v21 = v46;
        uint64_t v22 = v47;
        sub_B43C(v36, &v49);
        int v23 = v55;
        if ((v55 & 0x80) != 0)
        {
          v55 &= ~0x80u;
          uint64_t v25 = v51;
          uint64_t v24 = v52;
          uint64_t v26 = v53;
          uint64_t v27 = v54;
          if (v18)
          {
            if ((v50 & 1) == 0) {
              return 0;
            }
          }
          else if (v50)
          {
            return 0;
          }
          if (v17 != v49)
          {
            uint64_t v28 = v53;
            uint64_t v29 = v54;
            uint64_t v30 = v52;
            char v31 = sub_2FA30();
            uint64_t v24 = v30;
            uint64_t v27 = v29;
            uint64_t v26 = v28;
            if ((v31 & 1) == 0) {
              return 0;
            }
          }
          if (v19 != v25 || v20 != v24)
          {
            uint64_t v32 = v26;
            uint64_t v33 = v27;
            char v34 = sub_2FA30();
            uint64_t v27 = v33;
            uint64_t v26 = v32;
            if ((v34 & 1) == 0) {
              return 0;
            }
          }
          if (v21 == v26 && v22 == v27)
          {
            if ((v8 ^ v23)) {
              return 0;
            }
          }
          else
          {
            char v35 = sub_2FA30();
            if (((v8 ^ v23) & 1) != 0 || (v35 & 1) == 0) {
              return 0;
            }
          }
          return 1;
        }
      }
      else
      {
        long long v9 = v42;
        char v10 = v43;
        uint64_t v11 = v44;
        uint64_t v12 = v45;
        int v13 = v46;
        sub_B43C(v36, &v49);
        if (((char)v55 & 0x80000000) == 0)
        {
          uint64_t v14 = v51;
          uint64_t v15 = v52;
          int v16 = v53;
          if (v10)
          {
            if ((v50 & 1) == 0) {
              return 0;
            }
            goto LABEL_23;
          }
          if ((v50 & 1) == 0)
          {
LABEL_23:
            if (v9 != v49 && (sub_2FA30() & 1) == 0) {
              return 0;
            }
            if (v11 == v14 && v12 == v15)
            {
              if (v13 != v16) {
                return 0;
              }
            }
            else if (sub_2FA30() & 1) == 0 || ((v13 ^ v16))
            {
              return 0;
            }
            return 1;
          }
        }
      }
      return 0;
  }
}

uint64_t sub_B804(long long *a1, long long *a2)
{
  sub_B43C(a1, &v39);
  int v3 = v45;
  if ((v45 & 0x80) != 0)
  {
    v45 &= ~0x80u;
    long long v12 = v39;
    char v13 = v40;
    uint64_t v14 = v41;
    uint64_t v15 = v42;
    uint64_t v16 = v43;
    uint64_t v17 = v44;
    sub_B43C(a2, &v32);
    int v18 = v38;
    if ((v38 & 0x80) != 0)
    {
      v38 &= ~0x80u;
      uint64_t v20 = v34;
      uint64_t v19 = v35;
      uint64_t v21 = v36;
      uint64_t v22 = v37;
      if (v13)
      {
        if ((v33 & 1) == 0) {
          return 0;
        }
      }
      else if (v33)
      {
        return 0;
      }
      if (v12 != v32)
      {
        uint64_t v23 = v36;
        uint64_t v24 = v37;
        uint64_t v25 = v35;
        char v26 = sub_2FA30();
        uint64_t v19 = v25;
        uint64_t v22 = v24;
        uint64_t v21 = v23;
        if ((v26 & 1) == 0) {
          return 0;
        }
      }
      if (v14 != v20 || v15 != v19)
      {
        uint64_t v27 = v21;
        uint64_t v28 = v22;
        char v29 = sub_2FA30();
        uint64_t v22 = v28;
        uint64_t v21 = v27;
        if ((v29 & 1) == 0) {
          return 0;
        }
      }
      if (v16 == v21 && v17 == v22)
      {
        if ((v3 ^ v18)) {
          return 0;
        }
      }
      else
      {
        char v30 = sub_2FA30();
        if (((v3 ^ v18) & 1) != 0 || (v30 & 1) == 0) {
          return 0;
        }
      }
      return 1;
    }
  }
  else
  {
    long long v4 = v39;
    char v5 = v40;
    uint64_t v6 = v41;
    uint64_t v7 = v42;
    int v8 = v43;
    sub_B43C(a2, &v32);
    if (((char)v38 & 0x80000000) == 0)
    {
      uint64_t v9 = v34;
      uint64_t v10 = v35;
      int v11 = v36;
      if (v5)
      {
        if ((v33 & 1) == 0) {
          return 0;
        }
        goto LABEL_11;
      }
      if ((v33 & 1) == 0)
      {
LABEL_11:
        if (v4 != v32 && (sub_2FA30() & 1) == 0) {
          return 0;
        }
        if (v6 == v9 && v7 == v10)
        {
          if (v8 != v11) {
            return 0;
          }
        }
        else if (sub_2FA30() & 1) == 0 || ((v8 ^ v11))
        {
          return 0;
        }
        return 1;
      }
    }
  }
  return 0;
}

BOOL sub_BA20(uint64_t a1, uint64_t a2)
{
  sub_B43C((long long *)(a1 + 16), v5);
  sub_B43C((long long *)(a2 + 16), v4);
  sub_B43C(v5, &v6);
  if (v7 < 0)
  {
    v7 &= ~0x80u;
    sub_B43C(v4, &v8);
    if ((v9 & 0x80000000) == 0) {
      return 0;
    }
    v9 &= ~0x80u;
  }
  else
  {
    sub_B43C(v4, &v8);
    if (v9 < 0) {
      return 0;
    }
  }
  sub_B45C();
  return sub_2F860() == -1;
}

__n128 *sub_BB00(__n128 *a1, __n128 *a2)
{
  return a2;
}

uint64_t destroy for AppsSettingsListItemViewType(uint64_t a1)
{
  return sub_AA88(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned char *)(a1 + 56));
}

uint64_t initializeWithCopy for AppsSettingsListItemViewType(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  char v10 = *(unsigned char *)(a2 + 56);
  sub_8618(*(void *)a2, v4, v5, v6, v7, v8, v9, v10);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(unsigned char *)(a1 + 56) = v10;
  return a1;
}

uint64_t assignWithCopy for AppsSettingsListItemViewType(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  char v10 = *(unsigned char *)(a2 + 56);
  sub_8618(*(void *)a2, v4, v5, v6, v7, v8, v9, v10);
  uint64_t v11 = *(void *)a1;
  uint64_t v12 = *(void *)(a1 + 8);
  uint64_t v13 = *(void *)(a1 + 16);
  uint64_t v14 = *(void *)(a1 + 24);
  uint64_t v15 = *(void *)(a1 + 32);
  uint64_t v16 = *(void *)(a1 + 40);
  uint64_t v17 = *(void *)(a1 + 48);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  char v18 = *(unsigned char *)(a1 + 56);
  *(unsigned char *)(a1 + 56) = v10;
  sub_AA88(v11, v12, v13, v14, v15, v16, v17, v18);
  return a1;
}

__n128 initializeWithTake for AppsSettingsListSubtitleLinkModel(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for AppsSettingsListItemViewType(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 48);
  char v4 = *(unsigned char *)(a2 + 56);
  uint64_t v5 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v8 = *(void *)(a1 + 24);
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 48);
  long long v12 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v12;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = v3;
  char v13 = *(unsigned char *)(a1 + 56);
  *(unsigned char *)(a1 + 56) = v4;
  sub_AA88(v5, v7, v6, v8, v9, v10, v11, v13);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppsSettingsListItemViewType(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 57)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *(void *)(a1 + 16) >> 1;
  if (v2 > 0x80000000) {
    int v3 = ~v2;
  }
  else {
    int v3 = -1;
  }
  return (v3 + 1);
}

double storeEnumTagSinglePayload for AppsSettingsListItemViewType(uint64_t a1, int a2, int a3)
{
  if (a2 < 0)
  {
    double result = 0.0;
    *(_OWORD *)(a1 + 40) = 0u;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_OWORD *)(a1 + 8) = 0u;
    *(unsigned char *)(a1 + 56) = 0;
    *(void *)a1 = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(a1 + 57) = 1;
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
      *(void *)a1 = 0;
      *(void *)(a1 + 8) = 0;
      *(void *)(a1 + 16) = 2 * -a2;
      double result = 0.0;
      *(_OWORD *)(a1 + 24) = 0u;
      *(_OWORD *)(a1 + 40) = 0u;
      *(unsigned char *)(a1 + 56) = 0;
      return result;
    }
    *(unsigned char *)(a1 + 57) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_BDE4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 56) >> 7;
}

uint64_t sub_BDF0(uint64_t result)
{
  *(unsigned char *)(result + 56) &= ~0x80u;
  return result;
}

uint64_t sub_BE00(uint64_t result, char a2)
{
  char v2 = *(unsigned char *)(result + 56) & 1 | (a2 << 7);
  *(void *)(result + 16) &= 1uLL;
  *(unsigned char *)(result + 56) = v2;
  return result;
}

ValueMetadata *type metadata accessor for AppsSettingsListItemViewType()
{
  return &type metadata for AppsSettingsListItemViewType;
}

unint64_t sub_BE38()
{
  unint64_t result = qword_3D0B0;
  if (!qword_3D0B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D0B0);
  }
  return result;
}

uint64_t sub_BE8C(uint64_t a1, char *a2, uint64_t a3, void *a4)
{
  if (!a2) {
    return 0x41746C7561666564;
  }
  if (a2 == (unsigned char *)&dword_0 + 1) {
    return 0x7370696C43707061;
  }
  if (a2 == (unsigned char *)&dword_0 + 2) {
    return 0x6E6564646968;
  }
  sub_2F970(18);
  swift_bridgeObjectRelease();
  strcpy((char *)v9, "applications.");
  v10._countAndFlagsBits = a1;
  v10._object = a2;
  sub_2F5D0(v10);
  v11._countAndFlagsBits = 46;
  v11._object = (void *)0xE100000000000000;
  sub_2F5D0(v11);
  v12._countAndFlagsBits = a3;
  v12._object = a4;
  sub_2F5D0(v12);
  return v9[0];
}

Swift::Int sub_BFA8()
{
  uint64_t v1 = *(void *)(v0 + 8);
  sub_2FA80();
  if (v1)
  {
    if (v1 == 1)
    {
      Swift::UInt v2 = 2;
    }
    else
    {
      if (v1 != 2)
      {
        sub_2FA90(1uLL);
        sub_2F5C0();
        sub_2F5C0();
        return sub_2FAA0();
      }
      Swift::UInt v2 = 3;
    }
  }
  else
  {
    Swift::UInt v2 = 0;
  }
  sub_2FA90(v2);
  return sub_2FAA0();
}

void sub_C054()
{
  uint64_t v1 = *(void *)(v0 + 8);
  switch(v1)
  {
    case 0:
      Swift::UInt v2 = 0;
      goto LABEL_7;
    case 1:
      Swift::UInt v2 = 2;
      goto LABEL_7;
    case 2:
      Swift::UInt v2 = 3;
LABEL_7:
      sub_2FA90(v2);
      return;
  }
  sub_2FA90(1uLL);
  sub_2F5C0();

  sub_2F5C0();
}

Swift::Int sub_C10C()
{
  uint64_t v1 = *(void *)(v0 + 8);
  sub_2FA80();
  if (v1)
  {
    if (v1 == 1)
    {
      Swift::UInt v2 = 2;
    }
    else
    {
      if (v1 != 2)
      {
        sub_2FA90(1uLL);
        sub_2F5C0();
        sub_2F5C0();
        return sub_2FAA0();
      }
      Swift::UInt v2 = 3;
    }
  }
  else
  {
    Swift::UInt v2 = 0;
  }
  sub_2FA90(v2);
  return sub_2FAA0();
}

uint64_t sub_C1B4()
{
  return sub_BE8C(*(void *)v0, *(char **)(v0 + 8), *(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_C1C0(uint64_t *a1, uint64_t a2)
{
  return sub_C1DC(*a1, a1[1], a1[2], a1[3], *(void *)a2, *(void *)(a2 + 8), *(void *)(a2 + 16), *(void *)(a2 + 24));
}

uint64_t sub_C1DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, uint64_t a8)
{
  switch(a2)
  {
    case 0:
      return !a6;
    case 1:
      return a6 == 1;
    case 2:
      return a6 == 2;
  }
  if (a6 < 3) {
    return 0;
  }
  if (a1 == a5 && a2 == a6 || (v13 = sub_2FA30(), uint64_t result = 0, (v13 & 1) != 0))
  {
    if (a3 == a7 && a4 == a8) {
      return 1;
    }
    return sub_2FA30();
  }
  return result;
}

unint64_t destroy for AppsSettingsListSectionIdentifier(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 8);
  if (result >= 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for AppsSettingsListSectionIdentifier(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    long long v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v5;
  }
  else
  {
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v3;
    uint64_t v4 = *(void *)(a2 + 24);
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
    *(void *)(a1 + 24) = v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

void *assignWithCopy for AppsSettingsListSectionIdentifier(void *a1, void *a2)
{
  unint64_t v4 = a2[1];
  if (a1[1] < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      a1[2] = a2[2];
      a1[3] = a2[3];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    long long v5 = *((_OWORD *)a2 + 1);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *((_OWORD *)a1 + 1) = v5;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
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

__n128 initializeWithTake for AppsSettingsListSectionIdentifier(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t assignWithTake for AppsSettingsListSectionIdentifier(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 8) < 0xFFFFFFFFuLL) {
    goto LABEL_5;
  }
  unint64_t v4 = *(void *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_5:
    long long v6 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v6;
    return a1;
  }
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AppsSettingsListSectionIdentifier(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFD && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 2147483645);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
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

uint64_t storeEnumTagSinglePayload for AppsSettingsListSectionIdentifier(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFD)
  {
    *(_OWORD *)__n128 result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)__n128 result = a2 - 2147483645;
    if (a3 >= 0x7FFFFFFD) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFD) {
      *(unsigned char *)(result + 32) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 2;
    }
  }
  return result;
}

void *sub_C594(void *result, int a2)
{
  if (a2 < 0)
  {
    result[2] = 0;
    result[3] = 0;
    *__n128 result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for AppsSettingsListSectionIdentifier()
{
  return &type metadata for AppsSettingsListSectionIdentifier;
}

uint64_t destroy for AppsSettingsListSectionModel(uint64_t a1)
{
  if (*(void *)(a1 + 8) >= 3uLL)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for AppsSettingsListSectionModel(void *a1, void *a2)
{
  unint64_t v4 = a2[1];
  if (v4 >= 3)
  {
    *a1 = *a2;
    a1[1] = v4;
    uint64_t v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v5 = *((_OWORD *)a2 + 1);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *((_OWORD *)a1 + 1) = v5;
  }
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for AppsSettingsListSectionModel(void *a1, void *a2)
{
  unint64_t v4 = a2[1];
  if (a1[1] >= 3uLL)
  {
    if (v4 >= 3)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      a1[2] = a2[2];
      a1[3] = a2[3];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_C778((uint64_t)a1);
      long long v6 = *((_OWORD *)a2 + 1);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *((_OWORD *)a1 + 1) = v6;
    }
  }
  else if (v4 >= 3)
  {
    *a1 = *a2;
    a1[1] = a2[1];
    a1[2] = a2[2];
    a1[3] = a2[3];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v5 = *((_OWORD *)a2 + 1);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *((_OWORD *)a1 + 1) = v5;
  }
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_C778(uint64_t a1)
{
  uint64_t v2 = sub_5250(&qword_3D0B8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

__n128 initializeWithTake for AppsSettingsListSectionModel(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

void *assignWithTake for AppsSettingsListSectionModel(void *a1, void *a2)
{
  if (a1[1] >= 3uLL)
  {
    unint64_t v4 = a2[1];
    if (v4 >= 3)
    {
      *a1 = *a2;
      a1[1] = v4;
      swift_bridgeObjectRelease();
      uint64_t v6 = a2[3];
      a1[2] = a2[2];
      a1[3] = v6;
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    sub_C778((uint64_t)a1);
  }
  long long v5 = *((_OWORD *)a2 + 1);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v5;
LABEL_6:
  a1[4] = a2[4];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AppsSettingsListSectionModel(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AppsSettingsListSectionModel(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
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
      *(void *)(result + 32) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppsSettingsListSectionModel()
{
  return &type metadata for AppsSettingsListSectionModel;
}

uint64_t sub_C90C(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a1 + 16);
  v5[0] = *(_OWORD *)a1;
  v5[1] = v2;
  uint64_t v6 = *(void *)(a1 + 32);
  long long v3 = *(_OWORD *)(a2 + 16);
  v7[0] = *(_OWORD *)a2;
  v7[1] = v3;
  uint64_t v8 = *(void *)(a2 + 32);
  return sub_CD94((uint64_t)v5, (uint64_t)v7) & 1;
}

uint64_t sub_C958@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = *v1;
  unint64_t v3 = v1[1];
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  *a1 = *v1;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  return sub_CF5C(v2, v3);
}

unint64_t sub_C96C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = (char *)v0[1];
  uint64_t v3 = v0[2];
  uint64_t v4 = (void *)v0[3];
  sub_CF5C(*v0, (unint64_t)v2);
  v6._countAndFlagsBits = sub_BE8C(v1, v2, v3, v4);
  sub_2F5D0(v6);
  swift_bridgeObjectRelease();
  sub_CFA4(v1, (unint64_t)v2);
  return 0xD00000000000001DLL;
}

unint64_t sub_CA1C()
{
  unint64_t result = qword_3D0C0;
  if (!qword_3D0C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D0C0);
  }
  return result;
}

uint64_t sub_CA70(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (v2 && a1 != a2)
  {
    uint64_t v3 = (uint64_t *)(a2 + 56);
    uint64_t v4 = (uint64_t *)(a1 + 56);
    do
    {
      uint64_t v5 = *(v4 - 2);
      uint64_t v6 = *(v4 - 1);
      uint64_t v7 = *v4;
      uint64_t v8 = v4[1];
      uint64_t v10 = v4[2];
      uint64_t v9 = v4[3];
      uint64_t v12 = v4[4];
      uint64_t v11 = v4[5];
      int v13 = *((unsigned __int8 *)v4 + 48);
      unint64_t v14 = *(v3 - 2);
      uint64_t v15 = *(v3 - 1);
      uint64_t v17 = *v3;
      uint64_t v16 = v3[1];
      uint64_t v19 = v3[2];
      uint64_t v18 = v3[3];
      uint64_t v52 = v3[4];
      uint64_t v20 = v3[5];
      int v21 = *((unsigned __int8 *)v3 + 48);
      switch(v5)
      {
        case 0:
          if (v14) {
            return 0;
          }
          break;
        case 1:
          if (v14 != 1) {
            return 0;
          }
          break;
        case 2:
          if (v14 != 2) {
            return 0;
          }
          break;
        case 3:
          if (v14 != 3) {
            return 0;
          }
          break;
        default:
          if (v14 < 4) {
            return 0;
          }
          if (*(v4 - 3) != *(v3 - 3) || v5 != v14)
          {
            uint64_t v48 = v4[5];
            uint64_t v50 = v4[3];
            uint64_t v46 = v3[3];
            uint64_t v47 = v4[2];
            uint64_t v45 = v3[2];
            int v44 = *((unsigned __int8 *)v4 + 48);
            uint64_t v42 = *v4;
            uint64_t v43 = v3[5];
            char v22 = sub_2FA30();
            uint64_t v7 = v42;
            uint64_t v20 = v43;
            uint64_t v10 = v47;
            uint64_t v11 = v48;
            int v13 = v44;
            uint64_t v19 = v45;
            uint64_t v18 = v46;
            uint64_t v9 = v50;
            if ((v22 & 1) == 0) {
              return 0;
            }
          }
          break;
      }
      if ((v13 & 0x80) != 0)
      {
        if ((v21 & 0x80) == 0) {
          return 0;
        }
        if (v8)
        {
          if ((v16 & 1) == 0) {
            return 0;
          }
        }
        else if (v16)
        {
          return 0;
        }
        if (v6 != v15 || v7 != v17)
        {
          uint64_t v49 = v11;
          uint64_t v51 = v9;
          uint64_t v30 = v10;
          uint64_t v31 = v18;
          uint64_t v32 = v19;
          int v33 = v13;
          uint64_t v34 = v20;
          char v35 = sub_2FA30();
          uint64_t v20 = v34;
          uint64_t v11 = v49;
          uint64_t v9 = v51;
          int v13 = v33;
          uint64_t v19 = v32;
          uint64_t v18 = v31;
          uint64_t v10 = v30;
          if ((v35 & 1) == 0) {
            return 0;
          }
        }
        if (v10 != v19 || v9 != v18)
        {
          int v36 = v13;
          uint64_t v37 = v11;
          uint64_t v38 = v20;
          char v39 = sub_2FA30();
          uint64_t v20 = v38;
          uint64_t v11 = v37;
          int v13 = v36;
          if ((v39 & 1) == 0) {
            return 0;
          }
        }
        if (v12 == v52 && v11 == v20)
        {
          if ((v13 ^ v21)) {
            return 0;
          }
        }
        else
        {
          int v40 = v13;
          char v41 = sub_2FA30();
          uint64_t result = 0;
          if (v41 & 1) == 0 || ((v40 ^ v21)) {
            return result;
          }
        }
      }
      else
      {
        if ((v21 & 0x80) != 0) {
          return 0;
        }
        if (v8)
        {
          if ((v16 & 1) == 0) {
            return 0;
          }
        }
        else if (v16)
        {
          return 0;
        }
        if (v6 != v15 || v7 != v17)
        {
          uint64_t v23 = v9;
          uint64_t v24 = v10;
          uint64_t v25 = v18;
          uint64_t v26 = v19;
          char v27 = sub_2FA30();
          uint64_t v19 = v26;
          uint64_t v18 = v25;
          uint64_t v10 = v24;
          uint64_t v9 = v23;
          if ((v27 & 1) == 0) {
            return 0;
          }
        }
        if (v10 == v19 && v9 == v18)
        {
          if ((v12 ^ v52)) {
            return 0;
          }
        }
        else
        {
          char v28 = sub_2FA30();
          uint64_t result = 0;
          if (v28 & 1) == 0 || ((v12 ^ v52)) {
            return result;
          }
        }
      }
      v3 += 10;
      v4 += 10;
      --v2;
    }
    while (v2);
  }
  return 1;
}

uint64_t sub_CD94(uint64_t a1, uint64_t a2)
{
  sub_CF00(a1, v15);
  sub_CF00(a2, v14);
  sub_CF00((uint64_t)v15, &v16);
  uint64_t v4 = *((void *)&v16 + 1);
  switch(*((void *)&v16 + 1))
  {
    case 2:
      sub_CF00((uint64_t)v14, &v19);
      if (*((void *)&v19 + 1) == 2) {
        goto LABEL_18;
      }
      goto LABEL_11;
    case 1:
      sub_CF00((uint64_t)v14, &v19);
      if (*((void *)&v19 + 1) == 1) {
        goto LABEL_18;
      }
      goto LABEL_11;
    case 0:
      sub_CF00((uint64_t)v14, &v19);
      if (!*((void *)&v19 + 1))
      {
LABEL_18:
        char v8 = sub_CA70(*(void *)(a1 + 32), *(void *)(a2 + 32));
        return v8 & 1;
      }
      goto LABEL_11;
  }
  uint64_t v5 = v16;
  uint64_t v6 = v17;
  uint64_t v7 = v18;
  sub_CF00((uint64_t)v14, &v19);
  if (*((void *)&v19 + 1) < 3uLL)
  {
LABEL_11:
    char v8 = 0;
    return v8 & 1;
  }
  uint64_t v9 = v20;
  uint64_t v10 = v21;
  if (v5 == (void)v19 && v4 == *((void *)&v19 + 1) || (v11 = sub_2FA30(), char v8 = 0, (v11 & 1) != 0))
  {
    if (v6 == v9 && v7 == v10) {
      goto LABEL_18;
    }
    char v12 = sub_2FA30();
    char v8 = 0;
    if (v12) {
      goto LABEL_18;
    }
  }
  return v8 & 1;
}

_OWORD *sub_CF00(uint64_t a1, _OWORD *a2)
{
  return a2;
}

uint64_t sub_CF5C(uint64_t a1, unint64_t a2)
{
  if (a2 >= 3)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_CFA4(uint64_t a1, unint64_t a2)
{
  if (a2 >= 3)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

id sub_CFEC()
{
  type metadata accessor for AppsSettingsListViewModel();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = [self bundleForClass:ObjCClassFromMetadata];
  qword_3F080 = (uint64_t)result;
  return result;
}

uint64_t sub_D044()
{
  uint64_t v0 = sub_2EEF0();
  sub_D0CC(v0, qword_3F088);
  sub_D130(v0, (uint64_t)qword_3F088);
  swift_bridgeObjectRetain();
  return sub_2EEE0();
}

uint64_t *sub_D0CC(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_D130(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

id sub_D168(uint64_t a1, uint64_t a2, char a3)
{
  NSString v5 = sub_2F5A0();
  swift_bridgeObjectRelease();
  id v10 = 0;
  id v6 = [v3 initWithBundleIdentifier:v5 allowPlaceholder:a3 & 1 error:&v10];

  if (v6)
  {
    id v7 = v10;
  }
  else
  {
    id v8 = v10;
    sub_2ED10();

    swift_willThrow();
  }
  return v6;
}

id sub_D244()
{
  NSString v1 = sub_2F5A0();
  swift_bridgeObjectRelease();
  id v6 = 0;
  id v2 = [v0 initWithBundleIdentifierOfSystemPlaceholder:v1 error:&v6];

  if (v2)
  {
    id v3 = v6;
  }
  else
  {
    id v4 = v6;
    sub_2ED10();

    swift_willThrow();
  }
  return v2;
}

uint64_t sub_D310(uint64_t a1, uint64_t a2)
{
  id v4 = objc_allocWithZone((Class)LSApplicationRecord);
  swift_bridgeObjectRetain();
  id v6 = sub_D168(a1, a2, 1);
  if (v6
    || (id v5 = objc_allocWithZone((Class)LSApplicationRecord),
        swift_bridgeObjectRetain(),
        (id v6 = sub_D244()) != 0))
  {
    id v7 = [v6 localizedName];
    a1 = sub_2F5B0();
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_D410(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

uint64_t destroy for AppsSettingsListLink(uint64_t a1)
{
  sub_D468(*(void *)a1, *(unsigned char *)(a1 + 8));
  sub_AAE0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_D468(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_release();
  }
  return result;
}

uint64_t initializeWithCopy for AppsSettingsListLink(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_D410(*(void *)a2, v5);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  char v8 = *(unsigned char *)(a2 + 32);
  sub_8674();
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(unsigned char *)(a1 + 32) = v8;
  uint64_t v9 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v9;
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AppsSettingsListLink(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_D410(*(void *)a2, v5);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_D468(v6, v7);
  uint64_t v8 = *(void *)(a2 + 16);
  uint64_t v9 = *(void *)(a2 + 24);
  char v10 = *(unsigned char *)(a2 + 32);
  sub_8674();
  *(void *)(a1 + 16) = v8;
  *(void *)(a1 + 24) = v9;
  *(unsigned char *)(a1 + 32) = v10;
  sub_AAE0();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  return a1;
}

uint64_t assignWithTake for AppsSettingsListLink(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  char v5 = *((unsigned char *)a2 + 8);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_D468(v6, v7);
  char v8 = *((unsigned char *)a2 + 32);
  *(_OWORD *)(a1 + 16) = *((_OWORD *)a2 + 1);
  *(unsigned char *)(a1 + 32) = v8;
  sub_AAE0();
  uint64_t v9 = a2[6];
  *(void *)(a1 + 40) = a2[5];
  *(void *)(a1 + 48) = v9;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 56) = *((unsigned char *)a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppsSettingsListLink(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 57)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 48);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AppsSettingsListLink(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 56) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 57) = 1;
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
      *(void *)(result + 48) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 57) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppsSettingsListLink()
{
  return &type metadata for AppsSettingsListLink;
}

uint64_t sub_D6D0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_D6EC@<X0>(uint64_t a1@<X8>)
{
  sub_B45C();
  swift_bridgeObjectRetain();
  uint64_t result = sub_2F360();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_D758@<X0>(uint64_t a1@<X8>)
{
  uint64_t v17 = a1;
  uint64_t v16 = sub_5250(&qword_3D0F8);
  __chkstk_darwin(v16);
  uint64_t v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_5250(&qword_3D0F0);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  char v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v8 = *(unsigned char *)(v1 + 32);
  id v9 = objc_allocWithZone((Class)ISIcon);
  swift_bridgeObjectRetain();
  NSString v10 = sub_2F5A0();
  sub_AAE0();
  if (v8) {
    objc_msgSend(v9, "initWithType:", v10, v16, v17);
  }
  else {
    objc_msgSend(v9, "initWithBundleIdentifier:", v10, v16, v17);
  }

  id v11 = [self imageDescriptorNamed:kISImageDescriptorTableUIName];
  uint64_t v12 = *(void *)v1;
  char v13 = *(unsigned char *)(v1 + 8);
  sub_D410(v12, v13);
  double v14 = sub_176EC(v12, v13);
  sub_D468(v12, v13);
  [v11 setScale:v14];
  [v11 setDrawBorder:1];
  sub_2EE90();
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v3, v7, v4);
  swift_storeEnumTagMultiPayload();
  sub_8580(&qword_3D0E8, &qword_3D0F0);
  sub_2F1D0();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_DAEC()
{
  return sub_2F490();
}

uint64_t sub_DB9C@<X0>(uint64_t a1@<X8>)
{
  return sub_D6EC(a1);
}

uint64_t sub_DBA4@<X0>(uint64_t a1@<X8>)
{
  return sub_D758(a1);
}

unint64_t sub_DBC8()
{
  unint64_t result = qword_3D0E0;
  if (!qword_3D0E0)
  {
    sub_8038(&qword_3D0D8);
    sub_8580(&qword_3D0E8, &qword_3D0F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D0E0);
  }
  return result;
}

uint64_t sub_DC60()
{
  return sub_8580(&qword_3D100, &qword_3D108);
}

unint64_t sub_DCA0()
{
  unint64_t result = qword_3D110;
  if (!qword_3D110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D110);
  }
  return result;
}

uint64_t sub_DCF4(long long *a1, long long *a2)
{
  long long v2 = a1[1];
  long long v5 = *a1;
  v6[0] = v2;
  *(_OWORD *)((char *)v6 + 9) = *(long long *)((char *)a1 + 25);
  long long v3 = a2[1];
  long long v7 = *a2;
  v8[0] = v3;
  *(_OWORD *)((char *)v8 + 9) = *(long long *)((char *)a2 + 25);
  return sub_DEC0((uint64_t)&v5, (uint64_t)&v7) & 1;
}

BOOL sub_DD40()
{
  return sub_2F860() == -1;
}

BOOL sub_DDA0()
{
  return sub_2F860() != -1;
}

BOOL sub_DE00()
{
  return sub_2F860() != -1;
}

BOOL sub_DE60()
{
  return sub_2F860() == -1;
}

uint64_t sub_DEC0(uint64_t a1, uint64_t a2)
{
  sub_DFB4(a1, (uint64_t)v11);
  sub_DFB4(a2, (uint64_t)v10);
  sub_DFB4((uint64_t)v11, (uint64_t)v12);
  uint64_t v4 = v12[0];
  uint64_t v5 = v12[1];
  if (v13)
  {
    sub_DFB4((uint64_t)v10, (uint64_t)v14);
    if (v15) {
      goto LABEL_3;
    }
LABEL_11:
    char v7 = 0;
    return v7 & 1;
  }
  sub_DFB4((uint64_t)v10, (uint64_t)v14);
  if (v15) {
    goto LABEL_11;
  }
LABEL_3:
  if (v4 == v14[0] && v5 == v14[1] || (char v6 = sub_2FA30(), v7 = 0, (v6 & 1) != 0))
  {
    if (*(void *)(a1 + 24) == *(void *)(a2 + 24) && *(void *)(a1 + 32) == *(void *)(a2 + 32)
      || (char v8 = sub_2FA30(), v7 = 0, (v8 & 1) != 0))
    {
      char v7 = ((*(unsigned char *)(a1 + 40) & 1) == 0) ^ *(unsigned char *)(a2 + 40);
    }
  }
  return v7 & 1;
}

uint64_t sub_DFB4(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t destroy for AppsSettingsListLinkModel()
{
  sub_AAE0();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AppsSettingsListLinkModel(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  char v6 = *((unsigned char *)a2 + 16);
  sub_8674();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  uint64_t v7 = a2[4];
  *(void *)(a1 + 24) = a2[3];
  *(void *)(a1 + 32) = v7;
  *(unsigned char *)(a1 + 40) = *((unsigned char *)a2 + 40);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AppsSettingsListLinkModel(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  char v6 = *((unsigned char *)a2 + 16);
  sub_8674();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  sub_AAE0();
  *(void *)(a1 + 24) = a2[3];
  *(void *)(a1 + 32) = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 40) = *((unsigned char *)a2 + 40);
  return a1;
}

__n128 initializeWithTake for AppsSettingsListLinkModel(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for AppsSettingsListLinkModel(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v4;
  sub_AAE0();
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppsSettingsListLinkModel(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 41)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AppsSettingsListLinkModel(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 24) = 0u;
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
      *(void *)(result + 32) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 41) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppsSettingsListLinkModel()
{
  return &type metadata for AppsSettingsListLinkModel;
}

uint64_t destroy for AppsSettingsListSubtitleLink(uint64_t a1)
{
  sub_D468(*(void *)a1, *(unsigned char *)(a1 + 8));
  sub_AAE0();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AppsSettingsListSubtitleLink(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_D410(*(void *)a2, v5);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  char v8 = *(unsigned char *)(a2 + 32);
  sub_8674();
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(unsigned char *)(a1 + 32) = v8;
  uint64_t v9 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v9;
  uint64_t v10 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v10;
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AppsSettingsListSubtitleLink(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_D410(*(void *)a2, v5);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_D468(v6, v7);
  uint64_t v8 = *(void *)(a2 + 16);
  uint64_t v9 = *(void *)(a2 + 24);
  char v10 = *(unsigned char *)(a2 + 32);
  sub_8674();
  *(void *)(a1 + 16) = v8;
  *(void *)(a1 + 24) = v9;
  *(unsigned char *)(a1 + 32) = v10;
  sub_AAE0();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  return a1;
}

uint64_t assignWithTake for AppsSettingsListSubtitleLink(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  char v5 = *((unsigned char *)a2 + 8);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_D468(v6, v7);
  char v8 = *((unsigned char *)a2 + 32);
  *(_OWORD *)(a1 + 16) = *((_OWORD *)a2 + 1);
  *(unsigned char *)(a1 + 32) = v8;
  sub_AAE0();
  uint64_t v9 = a2[6];
  *(void *)(a1 + 40) = a2[5];
  *(void *)(a1 + 48) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = a2[8];
  *(void *)(a1 + 56) = a2[7];
  *(void *)(a1 + 64) = v10;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 72) = *((unsigned char *)a2 + 72);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppsSettingsListSubtitleLink(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 73)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 48);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AppsSettingsListSubtitleLink(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 72) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 73) = 1;
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
      *(void *)(result + 48) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 73) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppsSettingsListSubtitleLink()
{
  return &type metadata for AppsSettingsListSubtitleLink;
}

uint64_t sub_E558()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_E574@<X0>(uint64_t a1@<X8>)
{
  sub_B45C();
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_2F360();
  uint64_t v20 = v3;
  uint64_t v21 = v2;
  uint64_t v22 = v4;
  char v19 = v5 & 1;
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_2F360();
  uint64_t v8 = v7;
  char v10 = v9 & 1;
  sub_2F310();
  uint64_t v11 = sub_2F340();
  uint64_t v13 = v12;
  char v15 = v14;
  uint64_t v17 = v16;
  swift_release();
  v15 &= 1u;
  sub_80D4(v6, v8, v10);
  swift_bridgeObjectRelease();
  *(void *)a1 = v21;
  *(void *)(a1 + 8) = v20;
  *(unsigned char *)(a1 + 16) = v19;
  *(void *)(a1 + 24) = v22;
  *(void *)(a1 + 32) = v11;
  *(void *)(a1 + 40) = v13;
  *(unsigned char *)(a1 + 48) = v15;
  *(void *)(a1 + 56) = v17;
  sub_EBAC(v21, v20, v19);
  swift_bridgeObjectRetain();
  sub_EBAC(v11, v13, v15);
  swift_bridgeObjectRetain();
  sub_80D4(v11, v13, v15);
  swift_bridgeObjectRelease();
  sub_80D4(v21, v20, v19);
  return swift_bridgeObjectRelease();
}

uint64_t sub_E700@<X0>(uint64_t a1@<X8>)
{
  uint64_t v17 = a1;
  uint64_t v16 = sub_5250(&qword_3D0F8);
  __chkstk_darwin(v16);
  uint64_t v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_5250(&qword_3D0F0);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v8 = *(unsigned char *)(v1 + 32);
  id v9 = objc_allocWithZone((Class)ISIcon);
  swift_bridgeObjectRetain();
  NSString v10 = sub_2F5A0();
  sub_AAE0();
  if (v8) {
    objc_msgSend(v9, "initWithType:", v10, v16, v17);
  }
  else {
    objc_msgSend(v9, "initWithBundleIdentifier:", v10, v16, v17);
  }

  id v11 = [self imageDescriptorNamed:kISImageDescriptorTableUIName];
  uint64_t v12 = *(void *)v1;
  char v13 = *(unsigned char *)(v1 + 8);
  sub_D410(v12, v13);
  double v14 = sub_176EC(v12, v13);
  sub_D468(v12, v13);
  [v11 setScale:v14];
  [v11 setDrawBorder:1];
  sub_2EE90();
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v3, v7, v4);
  swift_storeEnumTagMultiPayload();
  sub_8580(&qword_3D0E8, &qword_3D0F0);
  sub_2F1D0();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_EA94()
{
  return sub_2F490();
}

uint64_t sub_EB80@<X0>(uint64_t a1@<X8>)
{
  return sub_E574(a1);
}

uint64_t sub_EB88@<X0>(uint64_t a1@<X8>)
{
  return sub_E700(a1);
}

uint64_t sub_EBAC(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_EBBC()
{
  return sub_8580(&qword_3D128, &qword_3D130);
}

uint64_t sub_EBF8(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  v5[0] = *a1;
  v5[1] = v2;
  v6[0] = a1[2];
  *(_OWORD *)((char *)v6 + 9) = *(_OWORD *)((char *)a1 + 41);
  long long v3 = a2[1];
  v7[0] = *a2;
  v7[1] = v3;
  v8[0] = a2[2];
  *(_OWORD *)((char *)v8 + 9) = *(_OWORD *)((char *)a2 + 41);
  return sub_EC54((uint64_t)v5, (uint64_t)v7) & 1;
}

uint64_t sub_EC54(uint64_t a1, uint64_t a2)
{
  sub_DFB4(a1, (uint64_t)v12);
  sub_DFB4(a2, (uint64_t)v11);
  sub_DFB4((uint64_t)v12, (uint64_t)v13);
  uint64_t v4 = v13[0];
  uint64_t v5 = v13[1];
  if ((v14 & 1) == 0)
  {
    sub_DFB4((uint64_t)v11, (uint64_t)v15);
    if ((v16 & 1) == 0) {
      goto LABEL_3;
    }
LABEL_14:
    char v7 = 0;
    return v7 & 1;
  }
  sub_DFB4((uint64_t)v11, (uint64_t)v15);
  if ((v16 & 1) == 0) {
    goto LABEL_14;
  }
LABEL_3:
  if (v4 == v15[0] && v5 == v15[1] || (char v6 = sub_2FA30(), v7 = 0, (v6 & 1) != 0))
  {
    if (*(void *)(a1 + 24) == *(void *)(a2 + 24) && *(void *)(a1 + 32) == *(void *)(a2 + 32)
      || (char v8 = sub_2FA30(), v7 = 0, (v8 & 1) != 0))
    {
      if (*(void *)(a1 + 40) == *(void *)(a2 + 40) && *(void *)(a1 + 48) == *(void *)(a2 + 48)
        || (char v9 = sub_2FA30(), v7 = 0, (v9 & 1) != 0))
      {
        char v7 = ((*(unsigned char *)(a1 + 56) & 1) == 0) ^ *(unsigned char *)(a2 + 56);
      }
    }
  }
  return v7 & 1;
}

uint64_t destroy for AppsSettingsListSubtitleLinkModel()
{
  sub_AAE0();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AppsSettingsListSubtitleLinkModel(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  char v6 = *((unsigned char *)a2 + 16);
  sub_8674();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  uint64_t v7 = a2[4];
  *(void *)(a1 + 24) = a2[3];
  *(void *)(a1 + 32) = v7;
  uint64_t v8 = a2[6];
  *(void *)(a1 + 40) = a2[5];
  *(void *)(a1 + 48) = v8;
  *(unsigned char *)(a1 + 56) = *((unsigned char *)a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AppsSettingsListSubtitleLinkModel(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  char v6 = *((unsigned char *)a2 + 16);
  sub_8674();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  sub_AAE0();
  *(void *)(a1 + 24) = a2[3];
  *(void *)(a1 + 32) = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = a2[5];
  *(void *)(a1 + 48) = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 56) = *((unsigned char *)a2 + 56);
  return a1;
}

uint64_t assignWithTake for AppsSettingsListSubtitleLinkModel(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v4;
  sub_AAE0();
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppsSettingsListSubtitleLinkModel(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 57)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AppsSettingsListSubtitleLinkModel(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 56) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 57) = 1;
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
      *(void *)(result + 32) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 57) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppsSettingsListSubtitleLinkModel()
{
  return &type metadata for AppsSettingsListSubtitleLinkModel;
}

__n128 AppsSettingsListContentMessageView.init(with:)@<Q0>(uint64_t a1@<X8>)
{
  sub_FAD0((uint64_t)v4);
  long long v2 = v4[3];
  *(_OWORD *)(a1 + 32) = v4[2];
  *(_OWORD *)(a1 + 48) = v2;
  *(_OWORD *)(a1 + 64) = v4[4];
  __n128 result = (__n128)v4[1];
  *(_OWORD *)a1 = v4[0];
  *(__n128 *)(a1 + 16) = result;
  return result;
}

void ContentMessageType.hash(into:)()
{
}

Swift::Int ContentMessageType.hashValue.getter()
{
  return sub_2FAA0();
}

Swift::Int sub_F0B0()
{
  return sub_2FAA0();
}

uint64_t AppsSettingsListContentMessageView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_5250(&qword_3D138);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = v1;
  uint64_t v10 = v1;
  sub_5250(&qword_3D140);
  sub_8580(&qword_3D148, &qword_3D140);
  sub_2F240();
  sub_2F530();
  __n128 v7 = sub_F61C(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, a1, 0.0, 1, INFINITY, 0);
  return (*(uint64_t (**)(unsigned char *, uint64_t, __n128))(v4 + 8))(v6, v3, v7);
}

uint64_t sub_F2D4()
{
  return sub_2F490();
}

uint64_t sub_F368@<X0>(uint64_t a1@<X8>)
{
  sub_2F300();
  uint64_t v2 = sub_2F340();
  uint64_t v4 = v3;
  char v6 = v5;
  uint64_t v8 = v7;
  uint64_t result = swift_release();
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v6 & 1;
  *(void *)(a1 + 24) = v8;
  return result;
}

uint64_t sub_F3F0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_5250(&qword_3D188);
  uint64_t v3 = v2 - 8;
  __chkstk_darwin(v2);
  char v5 = (uint64_t *)((char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = sub_2F480();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  char v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_2F470();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for Image.Scale.large(_:), v6);
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))((char *)v5 + *(int *)(v3 + 36), v9, v6);
  uint64_t *v5 = KeyPath;
  uint64_t v12 = sub_5250(&qword_3D170);
  sub_103A8((uint64_t)v5, (uint64_t)a1 + *(int *)(v12 + 36));
  *a1 = v10;
  swift_retain();
  sub_10410((uint64_t)v5);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return swift_release();
}

uint64_t sub_F5C0@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  long long v3 = *(_OWORD *)(a1 + 48);
  long long v6 = *(_OWORD *)(a1 + 32);
  long long v7 = v3;
  sub_10214((uint64_t)&v6, (uint64_t)v9);
  uint64_t v8 = *((void *)&v7 + 1);
  long long v4 = v7;
  *a2 = v6;
  a2[1] = v4;
  sub_10270((uint64_t)v9);
  return sub_102A4((uint64_t)&v8);
}

__n128 sub_F61C@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_2F720();
    uint64_t v23 = (void *)sub_2F2B0();
    sub_2EEC0();
  }
  sub_2F040();
  uint64_t v24 = sub_5250(&qword_3D138);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 16))(a9, v13, v24);
  uint64_t v25 = (_OWORD *)(a9 + *(int *)(sub_5250(&qword_3D160) + 36));
  v25[4] = v31;
  v25[5] = v32;
  v25[6] = v33;
  *uint64_t v25 = v27;
  v25[1] = v28;
  __n128 result = v30;
  v25[2] = v29;
  v25[3] = v30;
  return result;
}

uint64_t sub_F808@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_5250(&qword_3D138);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  long long v6 = &v11[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  long long v7 = v1[3];
  void v14[2] = v1[2];
  v14[3] = v7;
  v14[4] = v1[4];
  long long v8 = v1[1];
  v14[0] = *v1;
  v14[1] = v8;
  uint64_t v13 = v14;
  uint64_t v12 = v14;
  sub_5250(&qword_3D140);
  sub_8580(&qword_3D148, &qword_3D140);
  sub_2F240();
  sub_2F530();
  __n128 v9 = sub_F61C(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, a1, 0.0, 1, INFINITY, 0);
  return (*(uint64_t (**)(unsigned char *, uint64_t, __n128))(v4 + 8))(v6, v3, v9);
}

uint64_t sub_FA08(uint64_t a1)
{
  uint64_t v2 = sub_2F480();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_2F060();
}

uint64_t sub_FAD0@<X0>(uint64_t a1@<X8>)
{
  sub_2F1B0();
  if (qword_3CC50 != -1) {
    swift_once();
  }
  id v2 = (id)qword_3F080;
  uint64_t v3 = sub_2F350();
  uint64_t v5 = v4;
  char v7 = v6;
  uint64_t v14 = v8;
  sub_2F1B0();
  id v9 = v2;
  uint64_t result = sub_2F350();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v7 & 1;
  *(void *)(a1 + 24) = v14;
  *(void *)(a1 + 32) = result;
  *(void *)(a1 + 40) = v11;
  *(unsigned char *)(a1 + 48) = v12 & 1;
  *(void *)(a1 + 56) = v13;
  *(void *)(a1 + 64) = 0xD00000000000001DLL;
  *(void *)(a1 + 72) = 0x8000000000031F30;
  return result;
}

uint64_t sub_FC80()
{
  return sub_F2D4();
}

uint64_t sub_FC88@<X0>(_OWORD *a1@<X8>)
{
  return sub_F5C0(*(void *)(v1 + 16), a1);
}

unint64_t sub_FC94()
{
  unint64_t result = qword_3D150;
  if (!qword_3D150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D150);
  }
  return result;
}

uint64_t sub_FCE8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t getEnumTagSinglePayload for ContentMessageType(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for ContentMessageType(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0xFDF4);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_FE1C()
{
  return 0;
}

ValueMetadata *type metadata accessor for ContentMessageType()
{
  return &type metadata for ContentMessageType;
}

uint64_t destroy for AppsSettingsListContentMessageView(uint64_t a1)
{
  sub_80D4(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
  swift_bridgeObjectRelease();
  sub_80D4(*(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned char *)(a1 + 48));
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AppsSettingsListContentMessageView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  char v6 = *(unsigned char *)(a2 + 16);
  sub_EBAC(*(void *)a2, v5, v6);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  uint64_t v7 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v8 = *(void *)(a2 + 40);
  char v9 = *(unsigned char *)(a2 + 48);
  swift_bridgeObjectRetain();
  sub_EBAC(v7, v8, v9);
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(unsigned char *)(a1 + 48) = v9;
  uint64_t v10 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v10;
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AppsSettingsListContentMessageView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  char v6 = *(unsigned char *)(a2 + 16);
  sub_EBAC(*(void *)a2, v5, v6);
  uint64_t v7 = *(void *)a1;
  uint64_t v8 = *(void *)(a1 + 8);
  char v9 = *(unsigned char *)(a1 + 16);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  sub_80D4(v7, v8, v9);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(a2 + 32);
  uint64_t v11 = *(void *)(a2 + 40);
  char v12 = *(unsigned char *)(a2 + 48);
  sub_EBAC(v10, v11, v12);
  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v14 = *(void *)(a1 + 40);
  char v15 = *(unsigned char *)(a1 + 48);
  *(void *)(a1 + 32) = v10;
  *(void *)(a1 + 40) = v11;
  *(unsigned char *)(a1 + 48) = v12;
  sub_80D4(v13, v14, v15);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for AppsSettingsListContentMessageView(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t assignWithTake for AppsSettingsListContentMessageView(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 16);
  uint64_t v5 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  char v7 = *(unsigned char *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v4;
  sub_80D4(v5, v6, v7);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  char v8 = *(unsigned char *)(a2 + 48);
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  char v11 = *(unsigned char *)(a1 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = v8;
  sub_80D4(v9, v10, v11);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v12;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AppsSettingsListContentMessageView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 80)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AppsSettingsListContentMessageView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 80) = 1;
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
    *(unsigned char *)(result + 80) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppsSettingsListContentMessageView()
{
  return &type metadata for AppsSettingsListContentMessageView;
}

unint64_t sub_10174()
{
  unint64_t result = qword_3D158;
  if (!qword_3D158)
  {
    sub_8038(&qword_3D160);
    sub_8580(&qword_3D168, &qword_3D138);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D158);
  }
  return result;
}

uint64_t sub_10214(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_10270(uint64_t a1)
{
  return a1;
}

uint64_t sub_102A4(uint64_t a1)
{
  return a1;
}

uint64_t sub_102D0@<X0>(uint64_t a1@<X8>)
{
  return sub_F368(a1);
}

uint64_t sub_102D8@<X0>(uint64_t *a1@<X8>)
{
  return sub_F3F0(a1);
}

unint64_t sub_102E0()
{
  unint64_t result = qword_3D178;
  if (!qword_3D178)
  {
    sub_8038(&qword_3D170);
    sub_8580(&qword_3D180, &qword_3D188);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D178);
  }
  return result;
}

uint64_t sub_10380()
{
  return sub_2F050();
}

uint64_t sub_103A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_5250(&qword_3D188);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10410(uint64_t a1)
{
  uint64_t v2 = sub_5250(&qword_3D188);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t destroy for AppsSettingsListIconType()
{
  return sub_AAE0();
}

uint64_t _s13InstalledApps24AppsSettingsListIconTypeOwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_8674();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for AppsSettingsListIconType(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_8674();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_AAE0();
  return a1;
}

__n128 initializeWithTake for AppsSettingsListIconType(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for AppsSettingsListIconType(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_AAE0();
  return a1;
}

uint64_t getEnumTagSinglePayload for AppsSettingsListIconType(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AppsSettingsListIconType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_10618(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_10620(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for AppsSettingsListIconType()
{
  return &type metadata for AppsSettingsListIconType;
}

uint64_t sub_1063C(uint64_t a1, uint64_t a2)
{
  return sub_10658(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16), *(void *)a2, *(void *)(a2 + 8), *(unsigned char *)(a2 + 16));
}

uint64_t sub_10658(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6)
{
  if (a3)
  {
    if ((a6 & 1) == 0) {
      return 0;
    }
  }
  else if (a6)
  {
    return 0;
  }
  if (a1 == a4 && a2 == a5) {
    return 1;
  }
  else {
    return sub_2FA30();
  }
}

id sub_1069C(id a1, char a2)
{
  if (a2) {
    return a1;
  }
  else {
    return (id)swift_retain();
  }
}

uint64_t destroy for AppsSettingsListItem(uint64_t a1)
{
  sub_10708(*(id *)a1, *(unsigned char *)(a1 + 8));
  if (*(void *)(a1 + 24) >= 4uLL) {
    swift_bridgeObjectRelease();
  }
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 72);
  uint64_t v8 = *(void *)(a1 + 80);
  char v9 = *(unsigned char *)(a1 + 88);

  return sub_AA88(v2, v3, v4, v5, v6, v7, v8, v9);
}

void sub_10708(id a1, char a2)
{
  if (a2) {

  }
  else {
    swift_release();
  }
}

uint64_t initializeWithCopy for AppsSettingsListItem(uint64_t a1, uint64_t a2)
{
  id v4 = *(id *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_1069C(*(id *)a2, v5);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  uint64_t v6 = (void *)(a2 + 16);
  unint64_t v7 = *(void *)(a2 + 24);
  if (v7 >= 4)
  {
    *(void *)(a1 + 16) = *v6;
    *(void *)(a1 + 24) = v7;
    swift_bridgeObjectRetain();
  }
  else
  {
    *(_OWORD *)(a1 + 16) = *(_OWORD *)v6;
  }
  uint64_t v8 = *(void *)(a2 + 32);
  uint64_t v9 = *(void *)(a2 + 40);
  uint64_t v10 = *(void *)(a2 + 48);
  uint64_t v11 = *(void *)(a2 + 56);
  uint64_t v12 = *(void *)(a2 + 64);
  uint64_t v13 = *(void *)(a2 + 72);
  uint64_t v14 = *(void *)(a2 + 80);
  char v15 = *(unsigned char *)(a2 + 88);
  sub_8618(v8, v9, v10, v11, v12, v13, v14, v15);
  *(void *)(a1 + 32) = v8;
  *(void *)(a1 + 40) = v9;
  *(void *)(a1 + 48) = v10;
  *(void *)(a1 + 56) = v11;
  *(void *)(a1 + 64) = v12;
  *(void *)(a1 + 72) = v13;
  *(void *)(a1 + 80) = v14;
  *(unsigned char *)(a1 + 88) = v15;
  return a1;
}

uint64_t assignWithCopy for AppsSettingsListItem(uint64_t a1, uint64_t a2)
{
  id v4 = *(id *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_1069C(*(id *)a2, v5);
  uint64_t v6 = *(void **)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_10708(v6, v7);
  unint64_t v8 = *(void *)(a2 + 24);
  if (*(void *)(a1 + 24) >= 4uLL)
  {
    if (v8 >= 4)
    {
      *(void *)(a1 + 16) = *(void *)(a2 + 16);
      *(void *)(a1 + 24) = *(void *)(a2 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_8;
    }
    sub_8218(a1 + 16, &qword_3D098);
    goto LABEL_6;
  }
  if (v8 < 4)
  {
LABEL_6:
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
    goto LABEL_8;
  }
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
LABEL_8:
  uint64_t v9 = *(void *)(a2 + 32);
  uint64_t v10 = *(void *)(a2 + 40);
  uint64_t v11 = *(void *)(a2 + 48);
  uint64_t v12 = *(void *)(a2 + 56);
  uint64_t v13 = *(void *)(a2 + 64);
  uint64_t v14 = *(void *)(a2 + 72);
  uint64_t v15 = *(void *)(a2 + 80);
  char v16 = *(unsigned char *)(a2 + 88);
  sub_8618(v9, v10, v11, v12, v13, v14, v15, v16);
  uint64_t v17 = *(void *)(a1 + 32);
  uint64_t v18 = *(void *)(a1 + 40);
  uint64_t v19 = *(void *)(a1 + 48);
  uint64_t v20 = *(void *)(a1 + 56);
  uint64_t v21 = *(void *)(a1 + 64);
  uint64_t v22 = *(void *)(a1 + 72);
  uint64_t v23 = *(void *)(a1 + 80);
  *(void *)(a1 + 32) = v9;
  *(void *)(a1 + 40) = v10;
  *(void *)(a1 + 48) = v11;
  *(void *)(a1 + 56) = v12;
  *(void *)(a1 + 64) = v13;
  *(void *)(a1 + 72) = v14;
  *(void *)(a1 + 80) = v15;
  char v24 = *(unsigned char *)(a1 + 88);
  *(unsigned char *)(a1 + 88) = v16;
  sub_AA88(v17, v18, v19, v20, v21, v22, v23, v24);
  return a1;
}

__n128 initializeWithTake for AppsSettingsListItem(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 73) = *(_OWORD *)(a2 + 73);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for AppsSettingsListItem(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  char v5 = *((unsigned char *)a2 + 8);
  uint64_t v6 = *(void **)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_10708(v6, v7);
  unint64_t v8 = a2 + 2;
  if (*(void *)(a1 + 24) >= 4uLL)
  {
    unint64_t v9 = a2[3];
    if (v9 >= 4)
    {
      *(void *)(a1 + 16) = *v8;
      *(void *)(a1 + 24) = v9;
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    sub_8218(a1 + 16, &qword_3D098);
  }
  *(_OWORD *)(a1 + 16) = *(_OWORD *)v8;
LABEL_6:
  uint64_t v10 = a2[10];
  char v11 = *((unsigned char *)a2 + 88);
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 48);
  uint64_t v15 = *(void *)(a1 + 56);
  uint64_t v16 = *(void *)(a1 + 64);
  uint64_t v17 = *(void *)(a1 + 72);
  uint64_t v18 = *(void *)(a1 + 80);
  long long v19 = *((_OWORD *)a2 + 3);
  *(_OWORD *)(a1 + 32) = *((_OWORD *)a2 + 2);
  *(_OWORD *)(a1 + 48) = v19;
  *(_OWORD *)(a1 + 64) = *((_OWORD *)a2 + 4);
  *(void *)(a1 + 80) = v10;
  char v20 = *(unsigned char *)(a1 + 88);
  *(unsigned char *)(a1 + 88) = v11;
  sub_AA88(v12, v13, v14, v15, v16, v17, v18, v20);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppsSettingsListItem(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 89)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *(void *)(a1 + 48) >> 1;
  if (v2 > 0x80000000) {
    int v3 = ~v2;
  }
  else {
    int v3 = -1;
  }
  return (v3 + 1);
}

double storeEnumTagSinglePayload for AppsSettingsListItem(uint64_t a1, int a2, int a3)
{
  if (a2 < 0)
  {
    double result = 0.0;
    *(_OWORD *)(a1 + 72) = 0u;
    *(_OWORD *)(a1 + 56) = 0u;
    *(_OWORD *)(a1 + 40) = 0u;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_OWORD *)(a1 + 8) = 0u;
    *(unsigned char *)(a1 + 88) = 0;
    *(void *)a1 = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(a1 + 89) = 1;
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
      *(void *)(a1 + 32) = 0;
      *(void *)(a1 + 40) = 0;
      *(void *)(a1 + 48) = 2 * -a2;
      double result = 0.0;
      *(_OWORD *)(a1 + 56) = 0u;
      *(_OWORD *)(a1 + 72) = 0u;
      *(unsigned char *)(a1 + 88) = 0;
      return result;
    }
    *(unsigned char *)(a1 + 89) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppsSettingsListItem()
{
  return &type metadata for AppsSettingsListItem;
}

uint64_t sub_10AFC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10B18@<X0>(uint64_t a1@<X8>)
{
  uint64_t v48 = a1;
  uint64_t v47 = sub_2F2A0();
  uint64_t v46 = *(void *)(v47 - 8);
  __chkstk_darwin(v47);
  uint64_t v45 = (char *)&v37 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_5250(&qword_3D190);
  uint64_t v4 = v3 - 8;
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_5250(&qword_3D198);
  __chkstk_darwin(v7 - 8);
  unint64_t v9 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_5250(&qword_3D1A0);
  uint64_t v11 = v10 - 8;
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = sub_5250(&qword_3D1A8);
  __chkstk_darwin(v39);
  uint64_t v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = sub_5250(&qword_3D1B0);
  __chkstk_darwin(v42);
  uint64_t v38 = (uint64_t)&v37 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = sub_5250(&qword_3D1B8);
  uint64_t v43 = *(void *)(v44 - 8);
  __chkstk_darwin(v44);
  char v41 = (char *)&v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_5250(&qword_3D1C0);
  __chkstk_darwin(v18 - 8);
  int v40 = (char *)&v37 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)unint64_t v9 = sub_2F1C0();
  *((void *)v9 + 1) = 0;
  unsigned char v9[16] = 1;
  uint64_t v20 = sub_5250(&qword_3D1C8);
  sub_111DC(v1, (uint64_t)&v9[*(int *)(v20 + 44)]);
  long long v21 = v1[2];
  long long v51 = v1[1];
  v52[0] = v21;
  long long v22 = v1[4];
  v52[1] = v1[3];
  v53[0] = v22;
  *(_OWORD *)((char *)v53 + 9) = *(_OWORD *)((char *)v1 + 73);
  long long v23 = v51;
  sub_12A1C((uint64_t)v9, (uint64_t)v6, &qword_3D198);
  *(_OWORD *)&v6[*(int *)(v4 + 44)] = v23;
  sub_12A1C((uint64_t)v6, (uint64_t)v13, &qword_3D190);
  *(_OWORD *)&v13[*(int *)(v11 + 44)] = v23;
  sub_631C(v23, *((unint64_t *)&v23 + 1));
  sub_631C(v23, *((unint64_t *)&v23 + 1));
  sub_8218((uint64_t)v6, &qword_3D190);
  sub_8218((uint64_t)v9, &qword_3D198);
  sub_B43C(v52, v54);
  sub_B43C(v54, &v55);
  char v24 = v57;
  if (v57 < 0)
  {
    v57 &= ~0x80u;
    char v25 = v24 & 1;
  }
  else
  {
    char v25 = v56;
  }
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v27 = swift_allocObject();
  *(unsigned char *)(v27 + 16) = v25;
  sub_12A1C((uint64_t)v13, (uint64_t)v15, &qword_3D1A0);
  long long v28 = (uint64_t *)&v15[*(int *)(v39 + 36)];
  uint64_t *v28 = KeyPath;
  v28[1] = (uint64_t)sub_12620;
  v28[2] = v27;
  sub_8218((uint64_t)v13, &qword_3D1A0);
  uint64_t v29 = v38;
  sub_12A1C((uint64_t)v15, v38, &qword_3D1A8);
  uint64_t v30 = v42;
  *(unsigned char *)(v29 + *(int *)(v42 + 36)) = *((void *)&v23 + 1) != 3;
  sub_8218((uint64_t)v15, &qword_3D1A8);
  long long v31 = v45;
  sub_2F290();
  unint64_t v32 = sub_12638();
  long long v33 = v41;
  sub_2F420();
  (*(void (**)(char *, uint64_t))(v46 + 8))(v31, v47);
  sub_8218(v29, &qword_3D1B0);
  sub_631C(v23, *((unint64_t *)&v23 + 1));
  uint64_t v49 = v30;
  unint64_t v50 = v32;
  swift_getOpaqueTypeConformance2();
  uint64_t v34 = (uint64_t)v40;
  uint64_t v35 = v44;
  sub_2F440();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v43 + 8))(v33, v35);
  return sub_128DC(v34, v48);
}

uint64_t sub_111DC@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v80 = a2;
  uint64_t v74 = sub_5250(&qword_3D238);
  uint64_t v67 = *(void *)(v74 - 8);
  __chkstk_darwin(v74);
  long long v65 = (char *)&v59 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = sub_5250(&qword_3D240);
  uint64_t v66 = *(void *)(v72 - 8);
  __chkstk_darwin(v72);
  long long v64 = (char *)&v59 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = sub_5250(&qword_3D248);
  uint64_t v69 = *(void *)(v79 - 8);
  uint64_t v5 = __chkstk_darwin(v79);
  v63 = (char *)&v59 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v68 = (char *)&v59 - v7;
  uint64_t v75 = sub_5250(&qword_3D250);
  __chkstk_darwin(v75);
  uint64_t v78 = (uint64_t)&v59 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = sub_5250(&qword_3D258);
  __chkstk_darwin(v70);
  uint64_t v71 = (char *)&v59 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = sub_5250(&qword_3D260);
  __chkstk_darwin(v76);
  uint64_t v77 = (char *)&v59 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_5250(&qword_3D268);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v59 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = sub_5250(&qword_3D270);
  uint64_t v62 = *(void *)(v73 - 8);
  __chkstk_darwin(v73);
  uint64_t v61 = (char *)&v59 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = sub_2EE40();
  uint64_t v15 = *(void *)(v60 - 8);
  __chkstk_darwin(v60);
  uint64_t v17 = (char *)&v59 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = type metadata accessor for AppsSettingsDestinationOption();
  __chkstk_darwin(v18);
  uint64_t v20 = (uint64_t *)((char *)&v59 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  long long v21 = a1[4];
  v86[1] = a1[3];
  *(_OWORD *)uint64_t v87 = v21;
  *(_OWORD *)&v87[9] = *(_OWORD *)((char *)a1 + 73);
  long long v22 = a1[1];
  v86[0] = a1[2];
  long long v85 = v22;
  sub_B43C(v86, &v88);
  sub_B43C(&v88, &v89);
  uint64_t v23 = v90;
  uint64_t v24 = v91;
  v92 &= ~0x80u;
  long long v25 = v85;
  swift_bridgeObjectRetain();
  sub_53D4(v23, v24, v25, *((unint64_t *)&v25 + 1), v20);
  swift_bridgeObjectRelease();
  uint64_t EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch((int)EnumCaseMultiPayload)
  {
    case 1:
      uint64_t v52 = v20[1];
      uint64_t v81 = *v20;
      uint64_t v82 = v52;
      __chkstk_darwin(EnumCaseMultiPayload);
      *(&v59 - 2) = (uint64_t)a1;
      sub_5250(&qword_3D278);
      sub_8580(&qword_3D280, &qword_3D278);
      sub_12BC8();
      uint64_t v53 = v61;
      sub_2F000();
      uint64_t v54 = v62;
      uint64_t v55 = v73;
      (*(void (**)(char *, char *, uint64_t))(v62 + 16))(v71, v53, v73);
      swift_storeEnumTagMultiPayload();
      sub_8580(&qword_3D298, &qword_3D270);
      uint64_t v56 = sub_8580(&qword_3D288, &qword_3D240);
      uint64_t v57 = sub_8580(&qword_3D290, &qword_3D238);
      uint64_t v81 = v72;
      uint64_t v82 = v74;
      uint64_t v83 = v56;
      uint64_t v84 = v57;
      swift_getOpaqueTypeConformance2();
      uint64_t v58 = (uint64_t)v77;
      sub_2F1D0();
      sub_12A1C(v58, v78, &qword_3D260);
      swift_storeEnumTagMultiPayload();
      sub_12A80();
      sub_2F1D0();
      sub_8218(v58, &qword_3D260);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v54 + 8))(v53, v55);
      break;
    case 2:
    case 3:
      uint64_t v38 = (_OWORD *)swift_allocObject();
      long long v39 = a1[3];
      v38[3] = a1[2];
      v38[4] = v39;
      v38[5] = a1[4];
      *(_OWORD *)((char *)v38 + 89) = *(_OWORD *)((char *)a1 + 73);
      long long v40 = a1[1];
      v38[1] = *a1;
      v38[2] = v40;
      __chkstk_darwin(v38);
      *(&v59 - 2) = (uint64_t)a1;
      sub_12978((uint64_t)a1);
      sub_5250(&qword_3D278);
      sub_8580(&qword_3D280, &qword_3D278);
      char v41 = v64;
      sub_2F4D0();
      uint64_t v42 = v65;
      sub_2F1E0();
      uint64_t v43 = sub_8580(&qword_3D288, &qword_3D240);
      uint64_t v44 = sub_8580(&qword_3D290, &qword_3D238);
      uint64_t v45 = v63;
      uint64_t v46 = v72;
      uint64_t v47 = v74;
      sub_2F3C0();
      (*(void (**)(char *, uint64_t))(v67 + 8))(v42, v47);
      (*(void (**)(char *, uint64_t))(v66 + 8))(v41, v46);
      uint64_t v48 = v69;
      uint64_t v49 = v68;
      uint64_t v50 = v79;
      (*(void (**)(char *, char *, uint64_t))(v69 + 32))(v68, v45, v79);
      (*(void (**)(char *, char *, uint64_t))(v48 + 16))(v71, v49, v50);
      swift_storeEnumTagMultiPayload();
      sub_8580(&qword_3D298, &qword_3D270);
      uint64_t v81 = v46;
      uint64_t v82 = v47;
      uint64_t v83 = v43;
      uint64_t v84 = v44;
      swift_getOpaqueTypeConformance2();
      uint64_t v51 = (uint64_t)v77;
      sub_2F1D0();
      sub_12A1C(v51, v78, &qword_3D260);
      swift_storeEnumTagMultiPayload();
      sub_12A80();
      sub_2F1D0();
      sub_8218(v51, &qword_3D260);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v48 + 8))(v49, v50);
      break;
    default:
      uint64_t v27 = v15;
      long long v28 = *(void (**)(char *, uint64_t *, uint64_t))(v15 + 32);
      uint64_t v29 = v60;
      v28(v17, v20, v60);
      (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v13, v17, v29);
      uint64_t v30 = (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(v27 + 56))(v13, 0, 1, v29);
      __chkstk_darwin(v30);
      *(&v59 - 2) = (uint64_t)a1;
      sub_5250(&qword_3D278);
      sub_8580(&qword_3D280, &qword_3D278);
      sub_12EB0(&qword_3CDA0, (void (*)(uint64_t))&type metadata accessor for PreferencesControllerRecipe);
      long long v31 = v61;
      sub_2F000();
      uint64_t v32 = v62;
      uint64_t v33 = v73;
      (*(void (**)(char *, char *, uint64_t))(v62 + 16))(v71, v31, v73);
      swift_storeEnumTagMultiPayload();
      sub_8580(&qword_3D298, &qword_3D270);
      uint64_t v34 = sub_8580(&qword_3D288, &qword_3D240);
      uint64_t v35 = sub_8580(&qword_3D290, &qword_3D238);
      uint64_t v81 = v72;
      uint64_t v82 = v74;
      uint64_t v83 = v34;
      uint64_t v84 = v35;
      swift_getOpaqueTypeConformance2();
      uint64_t v36 = (uint64_t)v77;
      sub_2F1D0();
      sub_12A1C(v36, v78, &qword_3D260);
      swift_storeEnumTagMultiPayload();
      sub_12A80();
      sub_2F1D0();
      sub_8218(v36, &qword_3D260);
      (*(void (**)(char *, uint64_t))(v32 + 8))(v31, v33);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v17, v29);
      break;
  }
  return result;
}

void sub_12388(uint64_t a1, void (*a2)(void))
{
  id v3 = *(id *)a1;
  char v4 = *(unsigned char *)(a1 + 8);
  sub_1069C(*(id *)a1, v4);
  id v5 = sub_178F8(v3, v4);
  sub_10708(v3, v4);
  a2();
}

double sub_12408@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (*(char *)(a1 + 88) < 0)
  {
    swift_getKeyPath();
    sub_8674();
    sub_12D24();
    sub_12D78();
    swift_bridgeObjectRetain();
  }
  else
  {
    swift_getKeyPath();
    sub_8674();
    sub_12D24();
    sub_12D78();
  }
  swift_bridgeObjectRetain();
  sub_2F1D0();
  double result = *(double *)&v4;
  *(_OWORD *)a2 = v4;
  *(_OWORD *)(a2 + 16) = v5;
  *(_OWORD *)(a2 + 32) = v6;
  *(_OWORD *)(a2 + 48) = v7;
  *(void *)(a2 + 64) = v8;
  *(unsigned char *)(a2 + 72) = v9;
  *(unsigned char *)(a2 + 73) = v10;
  return result;
}

uint64_t sub_1256C@<X0>(uint64_t a1@<X8>)
{
  return sub_10B18(a1);
}

uint64_t sub_125B8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2F120();
  *a1 = result & 1;
  return result;
}

uint64_t sub_125E8()
{
  return sub_2F130();
}

uint64_t sub_12610()
{
  return _swift_deallocObject(v0, 17, 7);
}

unsigned char *sub_12620(unsigned char *result)
{
  *result &= ~*(unsigned char *)(v1 + 16) & 1;
  return result;
}

unint64_t sub_12638()
{
  unint64_t result = qword_3D1D0;
  if (!qword_3D1D0)
  {
    sub_8038(&qword_3D1B0);
    sub_126D8();
    sub_8580(&qword_3D228, &qword_3D230);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D1D0);
  }
  return result;
}

unint64_t sub_126D8()
{
  unint64_t result = qword_3D1D8;
  if (!qword_3D1D8)
  {
    sub_8038(&qword_3D1A8);
    sub_12778();
    sub_8580(&qword_3D218, &qword_3D220);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D1D8);
  }
  return result;
}

unint64_t sub_12778()
{
  unint64_t result = qword_3D1E0;
  if (!qword_3D1E0)
  {
    sub_8038(&qword_3D1A0);
    sub_12818();
    sub_8580(&qword_3D208, &qword_3D210);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D1E0);
  }
  return result;
}

unint64_t sub_12818()
{
  unint64_t result = qword_3D1E8;
  if (!qword_3D1E8)
  {
    sub_8038(&qword_3D190);
    sub_8580(&qword_3D1F0, &qword_3D198);
    sub_8580(&qword_3D1F8, &qword_3D200);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D1E8);
  }
  return result;
}

uint64_t sub_128DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_5250(&qword_3D1C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_12948()
{
  sub_12388(v0 + 16, (void (*)(void))sub_1ABD8);
}

uint64_t sub_12978(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = *(void *)(a1 + 24);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v9 = *(void *)(a1 + 72);
  uint64_t v10 = *(void *)(a1 + 80);
  char v12 = *(unsigned char *)(a1 + 88);
  sub_1069C(*(id *)a1, *(unsigned char *)(a1 + 8));
  sub_631C(v2, v3);
  sub_8618(v4, v5, v6, v7, v8, v9, v10, v12);
  return a1;
}

uint64_t sub_12A1C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_5250(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_12A80()
{
  unint64_t result = qword_3D2A0;
  if (!qword_3D2A0)
  {
    sub_8038(&qword_3D260);
    sub_8580(&qword_3D298, &qword_3D270);
    sub_8038(&qword_3D240);
    sub_8038(&qword_3D238);
    sub_8580(&qword_3D288, &qword_3D240);
    sub_8580(&qword_3D290, &qword_3D238);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D2A0);
  }
  return result;
}

unint64_t sub_12BC8()
{
  unint64_t result = qword_3D720;
  if (!qword_3D720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D720);
  }
  return result;
}

uint64_t sub_12C20()
{
  sub_10708(*(id *)(v0 + 16), *(unsigned char *)(v0 + 24));
  if (*(void *)(v0 + 40) >= 4uLL) {
    swift_bridgeObjectRelease();
  }
  sub_AA88(*(void *)(v0 + 48), *(void *)(v0 + 56), *(void *)(v0 + 64), *(void *)(v0 + 72), *(void *)(v0 + 80), *(void *)(v0 + 88), *(void *)(v0 + 96), *(unsigned char *)(v0 + 104));

  return _swift_deallocObject(v0, 105, 7);
}

void sub_12C84()
{
  sub_12388(v0 + 16, (void (*)(void))sub_1A918);
}

double sub_12CB4@<D0>(uint64_t a1@<X8>)
{
  return sub_12408(*(void *)(v1 + 16), a1);
}

uint64_t sub_12CD0@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_2F090();
  *a1 = v3;
  return result;
}

uint64_t sub_12CFC()
{
  return sub_2F0A0();
}

unint64_t sub_12D24()
{
  unint64_t result = qword_3D2A8;
  if (!qword_3D2A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D2A8);
  }
  return result;
}

unint64_t sub_12D78()
{
  unint64_t result = qword_3D2B0;
  if (!qword_3D2B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D2B0);
  }
  return result;
}

unint64_t sub_12DD0()
{
  unint64_t result = qword_3D2B8;
  if (!qword_3D2B8)
  {
    sub_8038(&qword_3D1C0);
    sub_8038(&qword_3D1B0);
    sub_12638();
    swift_getOpaqueTypeConformance2();
    sub_12EB0(&qword_3D2C0, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D2B8);
  }
  return result;
}

uint64_t sub_12EB0(unint64_t *a1, void (*a2)(uint64_t))
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

void *assignWithCopy for AppsSettingsListSection(void *a1, void *a2)
{
  unint64_t v4 = a2[1];
  if (a1[1] >= 3uLL)
  {
    if (v4 >= 3)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      a1[2] = a2[2];
      a1[3] = a2[3];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_8218((uint64_t)a1, &qword_3D0B8);
      long long v6 = *((_OWORD *)a2 + 1);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *((_OWORD *)a1 + 1) = v6;
    }
  }
  else if (v4 >= 3)
  {
    *a1 = *a2;
    a1[1] = a2[1];
    a1[2] = a2[2];
    a1[3] = a2[3];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v5 = *((_OWORD *)a2 + 1);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *((_OWORD *)a1 + 1) = v5;
  }
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for AppsSettingsListSection(void *a1, void *a2)
{
  if (a1[1] >= 3uLL)
  {
    unint64_t v4 = a2[1];
    if (v4 >= 3)
    {
      *a1 = *a2;
      a1[1] = v4;
      swift_bridgeObjectRelease();
      uint64_t v6 = a2[3];
      a1[2] = a2[2];
      a1[3] = v6;
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    sub_8218((uint64_t)a1, &qword_3D0B8);
  }
  long long v5 = *((_OWORD *)a2 + 1);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v5;
LABEL_6:
  a1[4] = a2[4];
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for AppsSettingsListSection()
{
  return &type metadata for AppsSettingsListSection;
}

uint64_t sub_13090()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_130AC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_5250(&qword_3D2C8);
  __chkstk_darwin(v3 - 8);
  uint64_t v56 = (uint64_t *)((char *)&v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = sub_5250(&qword_3D2D0);
  __chkstk_darwin(v5 - 8);
  uint64_t v52 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t KeyPath = sub_5250(&qword_3D2D8);
  __chkstk_darwin(KeyPath);
  uint64_t v8 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2F1A0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v46 - v14;
  uint64_t v58 = sub_5250(&qword_3D2E0);
  uint64_t v51 = *(void *)(v58 - 8);
  __chkstk_darwin(v58);
  uint64_t v17 = (char *)&v46 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = sub_5250(&qword_3D2E8);
  __chkstk_darwin(v49);
  uint64_t v55 = (char *)&v46 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_5250(&qword_3D2F0);
  uint64_t v53 = __chkstk_darwin(v19);
  uint64_t v54 = (char *)&v46 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = 0;
  uint64_t v60 = v1;
  unint64_t v22 = v1[1];
  uint64_t v23 = v1[3];
  uint64_t v46 = v1[2];
  uint64_t v47 = v23;
  uint64_t v24 = *(void *)(v1[4] + 16);
  unint64_t v59 = v22;
  uint64_t v57 = a1;
  unint64_t v25 = 0;
  uint64_t v26 = 0;
  if (v24 && v22 >= 3)
  {
    uint64_t v21 = *v1;
    swift_bridgeObjectRetain();
    uint64_t v26 = _swiftEmptyArrayStorage;
    unint64_t v25 = v59;
  }
  uint64_t v61 = v21;
  unint64_t v62 = v25;
  uint64_t v63 = 0;
  long long v64 = v26;
  sub_5250(&qword_3D2F8);
  sub_5250(&qword_3CF18);
  sub_13954();
  sub_7FC4();
  sub_2F500();
  if (v59 < 3 || v24) {
    sub_2F190();
  }
  else {
    sub_2F180();
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v15, v13, v9);
  uint64_t v27 = &v8[*(int *)(KeyPath + 36)];
  long long v28 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  v28(v27, v15, v9);
  uint64_t v29 = *(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56);
  v29(v27, 0, 1, v9);
  uint64_t v30 = v51;
  long long v31 = *(void (**)(char *, char *, uint64_t))(v51 + 16);
  uint64_t v48 = v17;
  v31(v8, v17, v58);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v32 = (uint64_t)v52;
  v28(v52, v15, v9);
  v29((char *)v32, 0, 1, v9);
  uint64_t v33 = (uint64_t)v55;
  uint64_t v34 = (uint64_t *)&v55[*(int *)(v49 + 36)];
  uint64_t v35 = sub_5250(&qword_3D308);
  sub_12A1C(v32, (uint64_t)v34 + *(int *)(v35 + 28), &qword_3D2D0);
  *uint64_t v34 = KeyPath;
  sub_12A1C((uint64_t)v8, v33, &qword_3D2D8);
  sub_8218(v32, &qword_3D2D0);
  sub_8218((uint64_t)v8, &qword_3D2D8);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v48, v58);
  if (v59 >= 3)
  {
    uint64_t v37 = (uint64_t)v56;
    uint64_t v38 = v47;
    *uint64_t v56 = v46;
    *(void *)(v37 + 8) = v38;
    *(unsigned char *)(v37 + 16) = 0;
    *(void *)(v37 + 24) = _swiftEmptyArrayStorage;
    uint64_t v39 = enum case for SectionIndexLabel.text(_:);
    uint64_t v40 = sub_2F170();
    uint64_t v41 = *(void *)(v40 - 8);
    uint64_t v42 = *(void (**)(uint64_t, uint64_t, uint64_t))(v41 + 104);
    swift_bridgeObjectRetain();
    v42(v37, v39, v40);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v41 + 56))(v37, 0, 1, v40);
  }
  else
  {
    uint64_t v36 = sub_2F170();
    uint64_t v37 = (uint64_t)v56;
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v56, 1, 1, v36);
  }
  uint64_t v43 = v57;
  uint64_t v44 = (uint64_t)v54;
  sub_12A1C(v37, (uint64_t)&v54[*(int *)(v53 + 36)], &qword_3D2C8);
  sub_12A1C(v33, v44, &qword_3D2E8);
  sub_8218(v37, &qword_3D2C8);
  sub_8218(v33, &qword_3D2E8);
  return sub_13A7C(v44, v43);
}

uint64_t sub_13758()
{
  return sub_2F4F0();
}

uint64_t sub_13820@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)a1;
  unint64_t v4 = *(void *)(a1 + 8);
  uint64_t v15 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = *(void *)(a1 + 24);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 56);
  uint64_t v14 = *(void *)(a1 + 64);
  char v13 = *(unsigned char *)(a1 + 72);
  type metadata accessor for AppsSettingsListViewModel();
  sub_631C(v3, v4);
  sub_8618(v5, v6, v7, v8, v9, v10, v14, v13);
  sub_13AE4();
  uint64_t result = sub_2EFC0();
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v12 & 1;
  *(void *)(a2 + 16) = v15;
  *(void *)(a2 + 24) = v4;
  *(void *)(a2 + 32) = v5;
  *(void *)(a2 + 40) = v6;
  *(void *)(a2 + 48) = v7;
  *(void *)(a2 + 56) = v8;
  *(void *)(a2 + 64) = v9;
  *(void *)(a2 + 72) = v10;
  *(void *)(a2 + 80) = v14;
  *(unsigned char *)(a2 + 88) = v13;
  return result;
}

uint64_t sub_13910@<X0>(uint64_t a1@<X8>)
{
  return sub_130AC(a1);
}

uint64_t sub_1394C()
{
  return sub_13758();
}

unint64_t sub_13954()
{
  unint64_t result = qword_3D300;
  if (!qword_3D300)
  {
    sub_8038(&qword_3D2F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D300);
  }
  return result;
}

uint64_t sub_139C0()
{
  return sub_2F0B0();
}

uint64_t sub_139E4(uint64_t a1)
{
  uint64_t v2 = sub_5250(&qword_3D2D0);
  __chkstk_darwin(v2 - 8);
  sub_12A1C(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_3D2D0);
  return sub_2F0C0();
}

uint64_t sub_13A7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_5250(&qword_3D2F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_13AE4()
{
  unint64_t result = qword_3D710;
  if (!qword_3D710)
  {
    type metadata accessor for AppsSettingsListViewModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D710);
  }
  return result;
}

unint64_t sub_13B40()
{
  unint64_t result = qword_3D310;
  if (!qword_3D310)
  {
    sub_8038(&qword_3D2F0);
    sub_13BE0();
    sub_8580(&qword_3D348, &qword_3D350);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D310);
  }
  return result;
}

unint64_t sub_13BE0()
{
  unint64_t result = qword_3D318;
  if (!qword_3D318)
  {
    sub_8038(&qword_3D2E8);
    sub_13C80();
    sub_8580(&qword_3D340, &qword_3D308);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D318);
  }
  return result;
}

unint64_t sub_13C80()
{
  unint64_t result = qword_3D320;
  if (!qword_3D320)
  {
    sub_8038(&qword_3D2D8);
    sub_13D20();
    sub_8580(&qword_3D330, &qword_3D338);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D320);
  }
  return result;
}

unint64_t sub_13D20()
{
  unint64_t result = qword_3D328;
  if (!qword_3D328)
  {
    sub_8038(&qword_3D2E0);
    sub_13954();
    sub_7FC4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D328);
  }
  return result;
}

uint64_t sub_13DA8@<X0>(uint64_t *a1@<X8>)
{
  *a1 = swift_getKeyPath();
  sub_5250(&qword_3D358);
  swift_storeEnumTagMultiPayload();
  uint64_t v2 = (int *)type metadata accessor for AppsSettingsList();
  uint64_t v3 = (uint64_t *)((char *)a1 + v2[5]);
  uint64_t *v3 = swift_getKeyPath();
  sub_5250(&qword_3D360);
  swift_storeEnumTagMultiPayload();
  uint64_t v4 = (uint64_t *)((char *)a1 + v2[6]);
  uint64_t *v4 = swift_getKeyPath();
  sub_5250(&qword_3D368);
  swift_storeEnumTagMultiPayload();
  type metadata accessor for AppsSettingsListViewModel();
  uint64_t result = sub_2F4A0();
  uint64_t v6 = (uint64_t *)((char *)a1 + v2[7]);
  *uint64_t v6 = v7;
  v6[1] = v8;
  return result;
}

uint64_t sub_13EA8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v156 = a1;
  uint64_t v2 = sub_5250(&qword_3D440);
  __chkstk_darwin(v2 - 8);
  v206 = (char *)&v143 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v155 = sub_2ED30();
  uint64_t v154 = *(void *)(v155 - 8);
  __chkstk_darwin(v155);
  v209 = (char *)&v143 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v205 = sub_2F550();
  uint64_t v204 = *(void *)(v205 - 8);
  __chkstk_darwin(v205);
  v203 = (char *)&v143 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v202 = sub_2F280();
  uint64_t v201 = *(void *)(v202 - 8);
  __chkstk_darwin(v202);
  v200 = (char *)&v143 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v199 = sub_2F160();
  uint64_t v198 = *(void *)(v199 - 8);
  __chkstk_darwin(v199);
  v197 = (char *)&v143 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v147 = sub_2F210();
  uint64_t v146 = *(void *)(v147 - 8);
  __chkstk_darwin(v147);
  v145 = (char *)&v143 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v168 = sub_2F260();
  uint64_t v171 = *(void *)(v168 - 8);
  __chkstk_darwin(v168);
  v144 = (char *)&v143 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v172 = sub_5250(&qword_3D448) - 8;
  __chkstk_darwin(v172);
  v170 = (char *)&v143 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_5250(&qword_3D370);
  uint64_t v12 = __chkstk_darwin(v11 - 8);
  uint64_t v148 = (uint64_t)&v143 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v12);
  v169 = (char *)&v143 - v15;
  __chkstk_darwin(v14);
  uint64_t v207 = (uint64_t)&v143 - v16;
  uint64_t v161 = sub_2F230();
  uint64_t v160 = *(void *)(v161 - 8);
  __chkstk_darwin(v161);
  v159 = (char *)&v143 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v212 = sub_5250(&qword_3D450) - 8;
  __chkstk_darwin(v212);
  uint64_t v19 = (char *)&v143 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = type metadata accessor for AppsSettingsList();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v167 = v20 - 8;
  uint64_t v22 = *(void *)(v21 + 64);
  __chkstk_darwin(v20 - 8);
  uint64_t v23 = (char *)&v143 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v195 = (char *)(sub_5250(&qword_3D458) - 8);
  __chkstk_darwin(v195);
  unint64_t v25 = (uint64_t (**)@<X0>(uint64_t@<X0>, uint64_t@<X8>))((char *)&v143 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v210 = sub_5250(&qword_3D460);
  __chkstk_darwin(v210);
  uint64_t v211 = (uint64_t)&v143 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v176 = sub_5250(&qword_3D468);
  uint64_t v175 = *(void *)(v176 - 8);
  __chkstk_darwin(v176);
  v174 = (char *)&v143 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v173 = sub_5250(&qword_3D470);
  __chkstk_darwin(v173);
  v181 = (char *)&v143 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v182 = sub_5250(&qword_3D478);
  __chkstk_darwin(v182);
  uint64_t v180 = (uint64_t)&v143 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v186 = sub_5250(&qword_3D480);
  uint64_t v184 = *(void *)(v186 - 8);
  __chkstk_darwin(v186);
  v183 = (char *)&v143 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v188 = sub_5250(&qword_3D488);
  uint64_t v187 = *(void *)(v188 - 8);
  __chkstk_darwin(v188);
  v185 = (char *)&v143 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v191 = sub_5250(&qword_3D490);
  uint64_t v190 = *(void *)(v191 - 8);
  __chkstk_darwin(v191);
  v189 = (char *)&v143 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v193 = sub_5250(&qword_3D498);
  __chkstk_darwin(v193);
  v192 = (char *)&v143 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v196 = sub_5250(&qword_3D4A0);
  uint64_t v194 = *(void *)(v196 - 8);
  __chkstk_darwin(v196);
  v213 = (char *)&v143 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v153 = sub_5250(&qword_3D4A8);
  uint64_t v152 = *(void *)(v153 - 8);
  __chkstk_darwin(v153);
  v208 = (char *)&v143 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v151 = sub_5250(&qword_3D4B0);
  uint64_t v150 = *(void *)(v151 - 8);
  __chkstk_darwin(v151);
  v149 = (char *)&v143 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1978C(v1, (uint64_t)v23);
  uint64_t v37 = *(unsigned __int8 *)(v21 + 80);
  uint64_t v38 = (v37 + 16) & ~v37;
  uint64_t v39 = v38 + v22;
  uint64_t v40 = v37 | 7;
  uint64_t v41 = swift_allocObject();
  sub_197F4((uint64_t)v23, v41 + v38);
  uint64_t v42 = sub_2F530();
  uint64_t v44 = v43;
  sub_16AE8(v1, (uint64_t)v19);
  uint64_t v45 = (uint64_t *)&v19[*(int *)(v212 + 44)];
  *uint64_t v45 = v42;
  v45[1] = v44;
  sub_12A1C((uint64_t)v19, (uint64_t)v25 + *((int *)v195 + 11), &qword_3D450);
  *unint64_t v25 = sub_19858;
  v25[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v41;
  sub_8218((uint64_t)v19, &qword_3D450);
  uint64_t v214 = v1;
  sub_1978C(v1, (uint64_t)v23);
  uint64_t v178 = v39;
  uint64_t v177 = v40;
  uint64_t v46 = swift_allocObject();
  uint64_t v179 = v38;
  v195 = v23;
  sub_197F4((uint64_t)v23, v46 + v38);
  uint64_t v47 = v211;
  sub_12A1C((uint64_t)v25, v211, &qword_3D458);
  uint64_t v48 = (uint64_t (**)())(v47 + *(int *)(v210 + 36));
  *uint64_t v48 = sub_198DC;
  v48[1] = (uint64_t (*)())v46;
  v48[2] = 0;
  v48[3] = 0;
  sub_8218((uint64_t)v25, &qword_3D458);
  uint64_t v49 = (char **)(v1 + *(int *)(v167 + 36));
  unint64_t v50 = (unint64_t)v49[1];
  v218 = *v49;
  unint64_t v219 = v50;
  uint64_t v51 = sub_5250(&qword_3D4B8);
  sub_2F4C0();
  uint64_t v52 = v221;
  unint64_t v53 = v222;
  uint64_t v54 = v223;
  swift_getKeyPath();
  v218 = v52;
  unint64_t v219 = v53;
  v220 = v54;
  sub_5250(&qword_3D4C0);
  sub_2F4E0();

  swift_release();
  uint64_t v55 = v168;
  swift_release();
  swift_release();
  v158 = v221;
  unint64_t v157 = v222;
  v165 = v223;
  uint64_t v166 = v224;
  v163 = v49;
  uint64_t v56 = v49[1];
  v215 = *v49;
  v216 = v56;
  sub_2F4C0();
  uint64_t v57 = v218;
  unint64_t v58 = v219;
  unint64_t v59 = v220;
  swift_getKeyPath();
  v218 = v57;
  unint64_t v219 = v58;
  v220 = v59;
  uint64_t v60 = (uint64_t)v170;
  sub_2F4E0();

  uint64_t v61 = v207;
  swift_release();
  uint64_t v62 = v171;
  swift_release();
  uint64_t v63 = (uint64_t)v169;
  swift_release();
  v164 = v215;
  int v162 = v217;
  sub_17B34(v61);
  (*(void (**)(uint64_t, void, uint64_t))(v62 + 104))(v63, enum case for UserInterfaceSizeClass.compact(_:), v55);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v62 + 56))(v63, 0, 1, v55);
  uint64_t v64 = v60 + *(int *)(v172 + 56);
  sub_12A1C(v61, v60, &qword_3D370);
  sub_12A1C(v63, v64, &qword_3D370);
  long long v65 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v62 + 48);
  int v66 = v65(v60, 1, v55);
  uint64_t v212 = v51;
  if (v66 != 1)
  {
    uint64_t v71 = v148;
    sub_12A1C(v60, v148, &qword_3D370);
    uint64_t v72 = v60;
    if (v65(v64, 1, v55) != 1)
    {
      uint64_t v73 = v144;
      (*(void (**)(char *, uint64_t, uint64_t))(v62 + 32))(v144, v64, v55);
      sub_1A508(&qword_3D518, (void (*)(uint64_t))&type metadata accessor for UserInterfaceSizeClass);
      char v74 = sub_2F590();
      uint64_t v75 = *(void (**)(char *, uint64_t))(v62 + 8);
      v75(v73, v55);
      sub_8218(v63, &qword_3D370);
      sub_8218(v207, &qword_3D370);
      v75((char *)v71, v55);
      sub_8218(v72, &qword_3D370);
      uint64_t v68 = v161;
      uint64_t v69 = v160;
      uint64_t v70 = v159;
      if (v74) {
        goto LABEL_9;
      }
LABEL_7:
      sub_2F220();
      goto LABEL_10;
    }
    sub_8218(v63, &qword_3D370);
    sub_8218(v207, &qword_3D370);
    (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v71, v55);
    uint64_t v68 = v161;
    uint64_t v69 = v160;
    uint64_t v70 = v159;
LABEL_6:
    sub_8218(v60, &qword_3D448);
    goto LABEL_7;
  }
  sub_8218(v63, &qword_3D370);
  sub_8218(v61, &qword_3D370);
  int v67 = v65(v64, 1, v55);
  uint64_t v68 = v161;
  uint64_t v69 = v160;
  uint64_t v70 = v159;
  if (v67 != 1) {
    goto LABEL_6;
  }
  sub_8218(v60, &qword_3D370);
LABEL_9:
  uint64_t v76 = v145;
  sub_2F200();
  sub_2F1F0();
  (*(void (**)(char *, uint64_t))(v146 + 8))(v76, v147);
LABEL_10:
  uint64_t v77 = v211;
  sub_19904();
  uint64_t v78 = v174;
  sub_2F3B0();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v69 + 8))(v70, v68);
  sub_8218(v77, &qword_3D460);
  uint64_t v79 = sub_2F540();
  uint64_t v80 = v163;
  unint64_t v81 = (unint64_t)v163[1];
  v221 = *v163;
  unint64_t v222 = v81;
  sub_2F4B0();
  uint64_t v82 = v218;
  swift_getKeyPath();
  v221 = v82;
  uint64_t v83 = sub_1A508((unint64_t *)&qword_3D710, (void (*)(uint64_t))type metadata accessor for AppsSettingsListViewModel);
  sub_2EDA0();
  swift_release();
  uint64_t v84 = *(void *)&v82[OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel__sections];
  swift_bridgeObjectRetain();

  uint64_t v85 = v175;
  uint64_t v86 = (uint64_t)v181;
  uint64_t v87 = v176;
  (*(void (**)(char *, char *, uint64_t))(v175 + 16))(v181, v78, v176);
  long long v88 = (uint64_t *)(v86 + *(int *)(v173 + 36));
  uint64_t *v88 = v79;
  v88[1] = v84;
  (*(void (**)(char *, uint64_t))(v85 + 8))(v78, v87);
  uint64_t v89 = sub_2F540();
  unint64_t v90 = (unint64_t)v80[1];
  v221 = *v80;
  unint64_t v222 = v90;
  sub_2F4B0();
  uint64_t v91 = v218;
  swift_getKeyPath();
  v221 = v91;
  uint64_t v211 = v83;
  sub_2EDA0();
  swift_release();
  uint64_t v92 = *(void *)&v91[OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel__filteredItems];
  swift_bridgeObjectRetain();

  uint64_t v93 = v180;
  sub_12A1C(v86, v180, &qword_3D470);
  uint64_t v94 = v182;
  uint64_t v95 = (uint64_t *)(v93 + *(int *)(v182 + 36));
  *uint64_t v95 = v89;
  v95[1] = v92;
  sub_8218(v86, &qword_3D470);
  unint64_t v96 = sub_19A54();
  uint64_t v97 = v183;
  sub_2F370();
  sub_8218(v93, &qword_3D478);
  sub_2F1B0();
  if (qword_3CC50 != -1) {
    swift_once();
  }
  id v98 = (id)qword_3F080;
  uint64_t v99 = sub_2F350();
  uint64_t v101 = v100;
  char v103 = v102 & 1;
  v221 = (char *)v94;
  unint64_t v222 = v96;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  long long v105 = v185;
  uint64_t v106 = v186;
  sub_2F3F0();
  sub_80D4(v99, v101, v103);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v184 + 8))(v97, v106);
  uint64_t v107 = v198;
  v108 = v197;
  uint64_t v109 = v199;
  (*(void (**)(char *, void, uint64_t))(v198 + 104))(v197, enum case for NavigationBarItem.TitleDisplayMode.inline(_:), v199);
  v221 = (char *)v106;
  unint64_t v222 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  v110 = v189;
  uint64_t v111 = v188;
  sub_2F450();
  (*(void (**)(char *, uint64_t))(v107 + 8))(v108, v109);
  (*(void (**)(char *, uint64_t))(v187 + 8))(v105, v111);
  uint64_t v112 = (uint64_t)v195;
  sub_1978C(v214, (uint64_t)v195);
  uint64_t v113 = swift_allocObject();
  sub_197F4(v112, v113 + v179);
  uint64_t v114 = v190;
  uint64_t v115 = (uint64_t)v192;
  uint64_t v116 = v191;
  (*(void (**)(char *, char *, uint64_t))(v190 + 16))(v192, v110, v191);
  uint64_t v117 = v193;
  v118 = (uint64_t (**)())(v115 + *(int *)(v193 + 36));
  *v118 = sub_19BCC;
  v118[1] = (uint64_t (*)())v113;
  v118[2] = 0;
  v118[3] = 0;
  (*(void (**)(char *, uint64_t))(v114 + 8))(v110, v116);
  unint64_t v119 = (unint64_t)v80[1];
  v221 = *v80;
  unint64_t v222 = v119;
  sub_2F4B0();
  v120 = v218;
  uint64_t v121 = type metadata accessor for AppsSettingsListViewModel();
  unint64_t v122 = sub_19C58();
  uint64_t v123 = v211;
  sub_2F3D0();

  sub_8218(v115, &qword_3D498);
  v124 = v200;
  sub_2F270();
  LOBYTE(v115) = sub_2F2E0();
  char v125 = sub_2F2C0();
  sub_2F2D0();
  sub_2F2D0();
  if (sub_2F2D0() != v115) {
    sub_2F2D0();
  }
  sub_2F2D0();
  char v126 = sub_2F2D0();
  v127 = v203;
  v128 = v206;
  if (v126 != v125) {
    sub_2F2D0();
  }
  uint64_t v129 = v204;
  v221 = (char *)v117;
  unint64_t v222 = v121;
  v223 = (void *)v122;
  uint64_t v224 = v123;
  uint64_t v130 = swift_getOpaqueTypeConformance2();
  uint64_t v131 = v196;
  v132 = v213;
  sub_2F400();
  v133 = v124;
  v134 = (char *)v131;
  (*(void (**)(char *, uint64_t))(v201 + 8))(v133, v202);
  (*(void (**)(char *, uint64_t))(v194 + 8))(v132, v131);
  void *v127 = 0xD000000000000022;
  v127[1] = 0x8000000000031F50;
  uint64_t v135 = v205;
  (*(void (**)(void *, void, uint64_t))(v129 + 104))(v127, enum case for SettingsEventImage.graphicIcon(_:), v205);
  sub_2ED20();
  sub_2ED60();
  uint64_t v136 = sub_2ED70();
  uint64_t v137 = *(void *)(v136 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v137 + 48))(v128, 1, v136);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    v221 = v134;
    unint64_t v222 = v130;
    swift_getOpaqueTypeConformance2();
    v139 = v149;
    v140 = v208;
    v141 = v209;
    uint64_t v142 = v153;
    sub_2F380();
    (*(void (**)(char *, uint64_t))(v154 + 8))(v141, v155);
    (*(void (**)(void *, uint64_t))(v129 + 8))(v127, v135);
    (*(void (**)(char *, uint64_t))(v152 + 8))(v140, v142);
    (*(void (**)(char *, uint64_t))(v137 + 8))(v128, v136);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v150 + 32))(v156, v139, v151);
  }
  return result;
}

uint64_t sub_1590C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v55 = a1;
  uint64_t v61 = a3;
  uint64_t v4 = type metadata accessor for AppsSettingsList();
  uint64_t v5 = v4 - 8;
  uint64_t v58 = *(void *)(v4 - 8);
  uint64_t v57 = *(void *)(v58 + 64);
  __chkstk_darwin(v4);
  uint64_t v56 = (uint64_t)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = sub_2F030();
  uint64_t v7 = *(void *)(v51 - 8);
  uint64_t v50 = *(void *)(v7 + 64);
  __chkstk_darwin(v51);
  uint64_t v48 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = sub_5250(&qword_3D538);
  uint64_t v52 = *(void *)(v53 - 8);
  __chkstk_darwin(v53);
  uint64_t v46 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = sub_5250(&qword_3D540);
  __chkstk_darwin(v49);
  uint64_t v11 = (char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_5250(&qword_3D548);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v59 = v12;
  uint64_t v60 = v13;
  __chkstk_darwin(v12);
  uint64_t v54 = (char *)&v46 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = (void **)(a2 + *(int *)(v5 + 36));
  uint64_t v47 = a2;
  uint64_t v16 = (ValueMetadata *)v15[1];
  uint64_t v68 = (char *)*v15;
  uint64_t v69 = v16;
  sub_5250(&qword_3D4B8);
  sub_2F4C0();
  uint64_t v17 = (char *)v63;
  uint64_t v18 = v64;
  uint64_t v19 = (void *)v65;
  swift_getKeyPath();
  uint64_t v68 = v17;
  uint64_t v69 = v18;
  *(void *)&long long v70 = v19;
  sub_5250(&qword_3D4C0);
  sub_2F4E0();

  swift_release();
  swift_release();
  swift_release();
  uint64_t v68 = (char *)v63;
  uint64_t v69 = v64;
  long long v70 = v65;
  uint64_t v62 = a2;
  sub_5250(&qword_3D550);
  sub_A904();
  sub_19F18();
  uint64_t v20 = v46;
  sub_2F320();
  uint64_t v21 = (ValueMetadata *)v15[1];
  uint64_t v63 = (uint64_t)*v15;
  uint64_t v64 = v21;
  sub_2F4B0();
  uint64_t v22 = v68;
  uint64_t v23 = *(void *)&v68[OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel_appsSettingsListScrollToItemSubject];
  swift_retain();

  uint64_t v24 = v48;
  uint64_t v25 = v51;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v48, v55, v51);
  unint64_t v26 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v27 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v27 + v26, v24, v25);
  uint64_t v28 = v52;
  uint64_t v29 = v53;
  (*(void (**)(char *, char *, uint64_t))(v52 + 16))(v11, v20, v53);
  uint64_t v30 = v49;
  *(void *)&v11[*(int *)(v49 + 52)] = v23;
  uint64_t v31 = (uint64_t (**)())&v11[*(int *)(v30 + 56)];
  *uint64_t v31 = sub_1A138;
  v31[1] = (uint64_t (*)())v27;
  (*(void (**)(char *, uint64_t))(v28 + 8))(v20, v29);
  uint64_t v32 = sub_2EEB0();
  uint64_t v33 = sub_8580(&qword_3D578, &qword_3D540);
  unint64_t v34 = sub_12BC8();
  uint64_t v35 = sub_1A508(&qword_3D580, (void (*)(uint64_t))&type metadata accessor for ApplicationSettingsView);
  uint64_t v36 = v54;
  sub_2F430();
  sub_8218((uint64_t)v11, &qword_3D540);
  uint64_t v37 = v56;
  sub_1978C(v47, v56);
  unint64_t v38 = (*(unsigned __int8 *)(v58 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v58 + 80);
  uint64_t v39 = swift_allocObject();
  sub_197F4(v37, v39 + v38);
  sub_5250(&qword_3D588);
  uint64_t v63 = v30;
  uint64_t v64 = &type metadata for InstalledApplicationSettings;
  *(void *)&long long v65 = v32;
  *((void *)&v65 + 1) = v33;
  unint64_t v66 = v34;
  uint64_t v67 = v35;
  swift_getOpaqueTypeConformance2();
  sub_1A490();
  uint64_t v40 = type metadata accessor for HiddenAppsSettingsList();
  uint64_t v41 = type metadata accessor for AppsSettingsListViewModel();
  uint64_t v42 = sub_1A508(&qword_3D598, (void (*)(uint64_t))type metadata accessor for HiddenAppsSettingsList);
  uint64_t v43 = sub_1A508((unint64_t *)&qword_3D710, (void (*)(uint64_t))type metadata accessor for AppsSettingsListViewModel);
  uint64_t v63 = v40;
  uint64_t v64 = (ValueMetadata *)v41;
  *(void *)&long long v65 = v42;
  *((void *)&v65 + 1) = v43;
  swift_getOpaqueTypeConformance2();
  uint64_t v44 = v59;
  sub_2F430();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v60 + 8))(v36, v44);
}

uint64_t sub_1606C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v31 = a2;
  uint64_t v32 = sub_5250(&qword_3D568);
  uint64_t v28 = *(void *)(v32 - 8);
  __chkstk_darwin(v32);
  uint64_t v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_5250(&qword_3D5A0);
  __chkstk_darwin(v29);
  uint64_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_5250(&qword_3CF18);
  uint64_t v27 = *(void *)(v30 - 8);
  __chkstk_darwin(v30);
  unint64_t v26 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (char **)(a1 + *(int *)(type metadata accessor for AppsSettingsList() + 28));
  uint64_t v9 = *v8;
  uint64_t v10 = v8[1];
  uint64_t v33 = *v8;
  unint64_t v34 = v10;
  sub_5250(&qword_3D4B8);
  sub_2F4B0();
  uint64_t v11 = (char *)v35;
  swift_getKeyPath();
  uint64_t v33 = v11;
  sub_1A508((unint64_t *)&qword_3D710, (void (*)(uint64_t))type metadata accessor for AppsSettingsListViewModel);
  sub_2EDA0();
  swift_release();
  LODWORD(a1) = v11[OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel_effectiveIsSearching];

  if (a1 != 1) {
    goto LABEL_6;
  }
  uint64_t v33 = v9;
  unint64_t v34 = v10;
  sub_2F4B0();
  uint64_t v12 = (char *)v35;
  swift_getKeyPath();
  uint64_t v33 = v12;
  sub_2EDA0();
  swift_release();
  uint64_t v13 = *(void *)&v12[OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel_effectiveSearchFilter];
  unint64_t v14 = *(void *)&v12[OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel_effectiveSearchFilter + 8];

  uint64_t v15 = HIBYTE(v14) & 0xF;
  if ((v14 & 0x2000000000000000) == 0) {
    uint64_t v15 = v13 & 0xFFFFFFFFFFFFLL;
  }
  if (v15)
  {
    uint64_t v33 = v9;
    unint64_t v34 = v10;
    sub_2F4B0();
    uint64_t v16 = (char *)v35;
    swift_getKeyPath();
    uint64_t v33 = v16;
    sub_2EDA0();
    swift_release();
    uint64_t v17 = *(char **)&v16[OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel__filteredItems];
    swift_bridgeObjectRetain();

    uint64_t v33 = v17;
    sub_5250(&qword_3D860);
    sub_8580(&qword_3CF60, &qword_3D860);
    sub_8080();
    sub_85C4();
    uint64_t v18 = v26;
    sub_2F4F0();
    uint64_t v19 = v27;
    uint64_t v20 = v30;
    (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v6, v18, v30);
    swift_storeEnumTagMultiPayload();
    sub_19FDC((unint64_t *)&qword_3CF20, &qword_3CF18, (void (*)(void))sub_8080);
    sub_19FDC(&qword_3D560, &qword_3D568, (void (*)(void))sub_1A054);
    sub_2F1D0();
    return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v18, v20);
  }
  else
  {
LABEL_6:
    uint64_t v33 = v9;
    unint64_t v34 = v10;
    sub_2F4B0();
    uint64_t v22 = (char *)v35;
    swift_getKeyPath();
    uint64_t v33 = v22;
    sub_2EDA0();
    swift_release();
    uint64_t v23 = *(char **)&v22[OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel__sections];
    swift_bridgeObjectRetain();

    uint64_t v33 = v23;
    sub_5250(&qword_3D5A8);
    sub_8580(&qword_3D5B0, &qword_3D5A8);
    sub_1A054();
    sub_1A614();
    sub_2F4F0();
    uint64_t v24 = v28;
    uint64_t v25 = v32;
    (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v6, v4, v32);
    swift_storeEnumTagMultiPayload();
    sub_19FDC((unint64_t *)&qword_3CF20, &qword_3CF18, (void (*)(void))sub_8080);
    sub_19FDC(&qword_3D560, &qword_3D568, (void (*)(void))sub_1A054);
    sub_2F1D0();
    return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v4, v25);
  }
}

uint64_t sub_16698@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)a1;
  unint64_t v4 = *(void *)(a1 + 8);
  uint64_t v15 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = *(void *)(a1 + 24);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 56);
  uint64_t v14 = *(void *)(a1 + 64);
  char v13 = *(unsigned char *)(a1 + 72);
  type metadata accessor for AppsSettingsListViewModel();
  sub_631C(v3, v4);
  sub_8618(v5, v6, v7, v8, v9, v10, v14, v13);
  sub_1A508((unint64_t *)&qword_3D710, (void (*)(uint64_t))type metadata accessor for AppsSettingsListViewModel);
  uint64_t result = sub_2EFC0();
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v12 & 1;
  *(void *)(a2 + 16) = v15;
  *(void *)(a2 + 24) = v4;
  *(void *)(a2 + 32) = v5;
  *(void *)(a2 + 40) = v6;
  *(void *)(a2 + 48) = v7;
  *(void *)(a2 + 56) = v8;
  *(void *)(a2 + 64) = v9;
  *(void *)(a2 + 72) = v10;
  *(void *)(a2 + 80) = v14;
  *(unsigned char *)(a2 + 88) = v13;
  return result;
}

uint64_t sub_167B8@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1;
  unint64_t v2 = a1[1];
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[3];
  uint64_t v6 = a1[4];
  *a2 = *a1;
  a2[1] = v2;
  a2[2] = v4;
  a2[3] = v5;
  a2[4] = v6;
  sub_CF5C(v3, v2);

  return swift_bridgeObjectRetain();
}

uint64_t sub_16808()
{
  return swift_release();
}

uint64_t sub_1687C(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  swift_bridgeObjectRetain();

  return ApplicationSettingsView.init(applicationBundleIdentifier:)(v1, v2);
}

uint64_t sub_168CC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for HiddenAppsSettingsList();
  __chkstk_darwin(v3);
  uint64_t v5 = (uint64_t *)((char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = (uint64_t *)(a2 + *(int *)(type metadata accessor for AppsSettingsList() + 28));
  uint64_t v7 = v6[1];
  uint64_t v13 = *v6;
  uint64_t v14 = v7;
  sub_5250(&qword_3D4B8);
  sub_2F4B0();
  uint64_t v8 = v15;
  sub_1B2B0();

  uint64_t *v5 = swift_getKeyPath();
  sub_5250(&qword_3CE28);
  swift_storeEnumTagMultiPayload();
  type metadata accessor for HiddenAppsSettingsListViewModel();
  sub_1A508((unint64_t *)&qword_3D870, (void (*)(uint64_t))type metadata accessor for HiddenAppsSettingsListViewModel);
  sub_2F520();
  uint64_t v9 = v6[1];
  uint64_t v13 = *v6;
  uint64_t v14 = v9;
  sub_2F4B0();
  uint64_t v10 = v15;
  type metadata accessor for AppsSettingsListViewModel();
  sub_1A508(&qword_3D598, (void (*)(uint64_t))type metadata accessor for HiddenAppsSettingsList);
  sub_1A508((unint64_t *)&qword_3D710, (void (*)(uint64_t))type metadata accessor for AppsSettingsListViewModel);
  sub_2F3D0();

  return sub_1A550((uint64_t)v5);
}

uint64_t sub_16AE8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v42 = a2;
  uint64_t v3 = sub_5250(&qword_3D528);
  uint64_t v39 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_5250(&qword_3D530);
  uint64_t v40 = *(void *)(v6 - 8);
  uint64_t v41 = v6;
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = (char **)(a1 + *(int *)(type metadata accessor for AppsSettingsList() + 28));
  uint64_t v10 = *v9;
  uint64_t v11 = v9[1];
  uint64_t v43 = *v9;
  uint64_t v44 = v11;
  sub_5250(&qword_3D4B8);
  sub_2F4B0();
  uint64_t v12 = (char *)v45;
  swift_getKeyPath();
  uint64_t v43 = v12;
  sub_1A508((unint64_t *)&qword_3D710, (void (*)(uint64_t))type metadata accessor for AppsSettingsListViewModel);
  sub_2EDA0();
  swift_release();
  LODWORD(a1) = v12[OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel_effectiveIsSearching];

  if (a1 != 1) {
    goto LABEL_3;
  }
  uint64_t v37 = v8;
  unint64_t v38 = v5;
  uint64_t v43 = v10;
  uint64_t v44 = v11;
  sub_2F4B0();
  uint64_t v13 = (char *)v45;
  swift_getKeyPath();
  uint64_t v43 = v13;
  sub_2EDA0();
  swift_release();
  uint64_t v14 = *(void *)&v13[OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel__filteredItems];
  swift_bridgeObjectRetain();

  uint64_t v15 = *(void *)(v14 + 16);
  swift_bridgeObjectRelease();
  if (v15) {
    goto LABEL_3;
  }
  uint64_t v43 = v10;
  uint64_t v44 = v11;
  sub_2F4B0();
  uint64_t v20 = (char *)v45;
  swift_getKeyPath();
  uint64_t v43 = v20;
  sub_2EDA0();
  swift_release();
  uint64_t v21 = *(void *)&v20[OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel_effectiveSearchFilter];
  unint64_t v22 = *(void *)&v20[OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel_effectiveSearchFilter + 8];

  uint64_t v23 = HIBYTE(v22) & 0xF;
  if ((v22 & 0x2000000000000000) == 0) {
    uint64_t v23 = v21 & 0xFFFFFFFFFFFFLL;
  }
  if (v23)
  {
    uint64_t v24 = v38;
    sub_2F250();
    uint64_t v25 = sub_2F530();
    uint64_t v27 = v26;
    id v28 = [self systemGroupedBackgroundColor];
    uint64_t v29 = sub_2F460();
    uint64_t v30 = sub_2F010();
    char v31 = sub_2F2F0();
    uint64_t v32 = v39;
    uint64_t v33 = (uint64_t)v37;
    uint64_t v34 = v3;
    (*(void (**)(char *, char *, uint64_t))(v39 + 16))(v37, v24, v3);
    uint64_t v18 = v41;
    uint64_t v35 = v33 + *(int *)(v41 + 36);
    *(void *)uint64_t v35 = v29;
    *(void *)(v35 + 8) = v30;
    *(unsigned char *)(v35 + 16) = v31;
    *(void *)(v35 + 24) = v25;
    *(void *)(v35 + 32) = v27;
    (*(void (**)(char *, uint64_t))(v32 + 8))(v24, v34);
    uint64_t v17 = v42;
    sub_19EA4(v33, v42, &qword_3D530);
    uint64_t v16 = 0;
  }
  else
  {
LABEL_3:
    uint64_t v16 = 1;
    uint64_t v18 = v41;
    uint64_t v17 = v42;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v40 + 56))(v17, v16, 1, v18);
}

void sub_16ECC(uint64_t a1)
{
  uint64_t v2 = sub_5250(&qword_3D840);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_5250(&qword_3D520);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (uint64_t *)(a1 + *(int *)(type metadata accessor for AppsSettingsList() + 28));
  uint64_t v9 = v8[1];
  uint64_t v17 = *v8;
  uint64_t v18 = v9;
  sub_5250(&qword_3D4B8);
  sub_2F4B0();
  uint64_t v10 = v19;
  sub_17DC4(&qword_3D358, (uint64_t (*)(void))&type metadata accessor for AppendSettingsNavigationPathAction, 0xD000000000000022, 0x8000000000032010, (uint64_t)v7);
  uint64_t v11 = sub_2EE80();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v7, 0, 1, v11);
  uint64_t v12 = (uint64_t)v10 + OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel_appendSettingsNavigationPath;
  swift_beginAccess();
  sub_19DD4((uint64_t)v7, v12);
  swift_endAccess();
  sub_1B440();
  sub_8218((uint64_t)v7, &qword_3D520);

  uint64_t v13 = v8[1];
  uint64_t v17 = *v8;
  uint64_t v18 = v13;
  sub_2F4B0();
  uint64_t v14 = v19;
  sub_17DC4(&qword_3D360, (uint64_t (*)(void))&type metadata accessor for ClearSettingsNavigationPathAction, 0xD000000000000021, 0x8000000000031FE0, (uint64_t)v4);
  uint64_t v15 = sub_2EE60();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v4, 0, 1, v15);
  uint64_t v16 = (uint64_t)v14 + OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel_clearSettingsNavigationPath;
  swift_beginAccess();
  sub_19E3C((uint64_t)v4, v16);
  swift_endAccess();
}

uint64_t sub_17194@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_1A508((unint64_t *)&qword_3D710, (void (*)(uint64_t))type metadata accessor for AppsSettingsListViewModel);
  sub_2EDA0();
  swift_release();
  uint64_t v4 = *(void *)(v3 + OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel_effectiveSearchFilter + 8);
  *a2 = *(void *)(v3 + OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel_effectiveSearchFilter);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1724C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_17330@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_1A508((unint64_t *)&qword_3D710, (void (*)(uint64_t))type metadata accessor for AppsSettingsListViewModel);
  sub_2EDA0();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel_effectiveIsSearching);
  return result;
}

uint64_t sub_173E0()
{
  return swift_release();
}

void sub_174B0()
{
  type metadata accessor for AppsSettingsList();
  sub_5250(&qword_3D4B8);
  sub_2F4B0();
  sub_1F52C();
}

uint64_t sub_17518@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_1A508((unint64_t *)&qword_3D710, (void (*)(uint64_t))type metadata accessor for AppsSettingsListViewModel);
  sub_2EDA0();
  swift_release();
  *a2 = *(void *)(v3 + OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel__filteredItems);
  return swift_bridgeObjectRetain();
}

uint64_t sub_175CC()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_176AC@<X0>(uint64_t a1@<X8>)
{
  return sub_17DC4(&qword_3CE28, (uint64_t (*)(void))&type metadata accessor for DismissAction, 0x417373696D736944, 0xED00006E6F697463, a1);
}

double sub_176EC(uint64_t a1, char a2)
{
  uint64_t v4 = sub_2F150();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2) {
    return *(double *)&a1;
  }
  swift_retain();
  os_log_type_t v8 = sub_2F720();
  uint64_t v9 = sub_2F2B0();
  os_log_type_t v10 = v8;
  if (os_log_type_enabled(v9, v8))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315138;
    uint64_t v13 = sub_291EC(0x74616F6C464743, 0xE700000000000000, &v14);
    sub_2F820();
    _os_log_impl(&dword_0, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  sub_2F140();
  swift_getAtKeyPath();
  sub_D468(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return *(double *)&v14;
}

id sub_178F8(void *a1, char a2)
{
  id v14 = a1;
  uint64_t v3 = sub_2F150();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    id v12 = v14;
    return v12;
  }
  else
  {
    swift_retain();
    os_log_type_t v7 = sub_2F720();
    os_log_type_t v8 = sub_2F2B0();
    os_log_type_t v9 = v7;
    if (os_log_type_enabled(v8, v7))
    {
      os_log_type_t v10 = (uint8_t *)swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      *(_DWORD *)os_log_type_t v10 = 136315138;
      uint64_t v15 = sub_291EC(0xD000000000000019, 0x8000000000032040, &v16);
      sub_2F820();
      _os_log_impl(&dword_0, v8, v9, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v10, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_2F140();
    swift_getAtKeyPath();
    sub_10708(v14, 0);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    return (id)v16;
  }
}

uint64_t sub_17B34@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_2F150();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  os_log_type_t v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_5250(&qword_3D368);
  __chkstk_darwin(v8);
  os_log_type_t v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_12A1C(v2, (uint64_t)v10, &qword_3D368);
  if (swift_getEnumCaseMultiPayload() == 1) {
    return sub_19EA4((uint64_t)v10, a1, &qword_3D370);
  }
  os_log_type_t v12 = sub_2F720();
  uint64_t v13 = sub_2F2B0();
  os_log_type_t v14 = v12;
  if (os_log_type_enabled(v13, v12))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    v17[1] = a1;
    uint64_t v18 = v16;
    *(_DWORD *)uint64_t v15 = 136315138;
    v17[2] = sub_291EC(0xD000000000000020, 0x8000000000031FB0, &v18);
    sub_2F820();
    _os_log_impl(&dword_0, v13, v14, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v15, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  sub_2F140();
  swift_getAtKeyPath();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_17DC4@<X0>(uint64_t *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v27 = a3;
  uint64_t v9 = v5;
  uint64_t v11 = sub_2F150();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  os_log_type_t v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_5250(a1);
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_12A1C(v9, (uint64_t)v17, a1);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v18 = a2(0);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(a5, v17, v18);
  }
  else
  {
    os_log_type_t v20 = sub_2F720();
    uint64_t v21 = sub_2F2B0();
    if (os_log_type_enabled(v21, v20))
    {
      unint64_t v25 = a4;
      uint64_t v22 = swift_slowAlloc();
      uint64_t v26 = a5;
      uint64_t v23 = (uint8_t *)v22;
      uint64_t v29 = swift_slowAlloc();
      *(_DWORD *)uint64_t v23 = 136315138;
      uint64_t v28 = sub_291EC(v27, v25, &v29);
      sub_2F820();
      _os_log_impl(&dword_0, v21, v20, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v23, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_2F140();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

uint64_t sub_1807C()
{
  return sub_2F0E0();
}

uint64_t type metadata accessor for AppsSettingsList()
{
  uint64_t result = qword_3D3E8;
  if (!qword_3D3E8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_180EC()
{
  return sub_2F0D0();
}

uint64_t sub_18110()
{
  return sub_2F0F0();
}

uint64_t sub_18134(uint64_t a1)
{
  uint64_t v2 = sub_5250(&qword_3D370);
  __chkstk_darwin(v2 - 8);
  sub_12A1C(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_3D370);
  return sub_2F100();
}

uint64_t *sub_181CC(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    uint64_t v4 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    sub_5250(&qword_3D358);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_2EE80();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(v4, a2, v7);
    }
    else
    {
      uint64_t *v4 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[5];
    os_log_type_t v10 = (uint64_t *)((char *)v4 + v9);
    uint64_t v11 = (uint64_t *)((char *)a2 + v9);
    sub_5250(&qword_3D360);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_2EE60();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *os_log_type_t v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v13 = a3[6];
    os_log_type_t v14 = (uint64_t *)((char *)v4 + v13);
    uint64_t v15 = (uint64_t *)((char *)a2 + v13);
    sub_5250(&qword_3D368);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v16 = sub_2F260();
      uint64_t v17 = *(void *)(v16 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
      {
        uint64_t v18 = sub_5250(&qword_3D370);
        memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v17 + 16))(v14, v15, v16);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
      }
    }
    else
    {
      *os_log_type_t v14 = *v15;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v19 = a3[7];
    os_log_type_t v20 = (uint64_t *)((char *)v4 + v19);
    uint64_t v21 = (char *)a2 + v19;
    uint64_t v22 = *(void **)v21;
    uint64_t v23 = *((void *)v21 + 1);
    *os_log_type_t v20 = *(void *)v21;
    v20[1] = v23;
    id v24 = v22;
  }
  swift_retain();
  return v4;
}

uint64_t sub_184DC(uint64_t a1, int *a2)
{
  sub_5250(&qword_3D358);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_2EE80();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  uint64_t v5 = a1 + a2[5];
  sub_5250(&qword_3D360);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_2EE60();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = a1 + a2[6];
  sub_5250(&qword_3D368);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_2F260();
    uint64_t v9 = *(void *)(v8 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8)) {
      (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
    }
  }
  else
  {
    swift_release();
  }

  return swift_release();
}

void *sub_186C0(void *a1, void *a2, int *a3)
{
  sub_5250(&qword_3D358);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_2EE80();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  sub_5250(&qword_3D360);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_2EE60();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    *uint64_t v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v11 = a3[6];
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  sub_5250(&qword_3D368);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v14 = sub_2F260();
    uint64_t v15 = *(void *)(v14 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
    {
      uint64_t v16 = sub_5250(&qword_3D370);
      memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, void *, uint64_t))(v15 + 16))(v12, v13, v14);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
    }
  }
  else
  {
    void *v12 = *v13;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v17 = a3[7];
  uint64_t v18 = (void *)((char *)a1 + v17);
  uint64_t v19 = (char *)a2 + v17;
  os_log_type_t v20 = *(void **)v19;
  uint64_t v21 = *((void *)v19 + 1);
  *uint64_t v18 = *(void *)v19;
  v18[1] = v21;
  id v22 = v20;
  swift_retain();
  return a1;
}

void *sub_18984(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_8218((uint64_t)a1, &qword_3D358);
    sub_5250(&qword_3D358);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_2EE80();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v7 = a3[5];
    uint64_t v8 = (void *)((char *)a1 + v7);
    uint64_t v9 = (void *)((char *)a2 + v7);
    sub_8218((uint64_t)a1 + v7, &qword_3D360);
    sub_5250(&qword_3D360);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_2EE60();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      *uint64_t v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v11 = a3[6];
    uint64_t v12 = (void *)((char *)a1 + v11);
    uint64_t v13 = (void *)((char *)a2 + v11);
    sub_8218((uint64_t)a1 + v11, &qword_3D368);
    sub_5250(&qword_3D368);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v14 = sub_2F260();
      uint64_t v15 = *(void *)(v14 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
      {
        uint64_t v16 = sub_5250(&qword_3D370);
        memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v15 + 16))(v12, v13, v14);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
      }
    }
    else
    {
      void *v12 = *v13;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v17 = a3[7];
  uint64_t v18 = (char *)a1 + v17;
  uint64_t v19 = (char *)a2 + v17;
  os_log_type_t v20 = *(void **)((char *)a2 + v17);
  uint64_t v21 = *(void **)v18;
  *(void *)uint64_t v18 = v20;
  id v22 = v20;

  *((void *)v18 + 1) = *((void *)v19 + 1);
  swift_retain();
  swift_release();
  return a1;
}

char *sub_18C98(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_5250(&qword_3D358);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_2EE80();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = sub_5250(&qword_3D360);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = sub_2EE60();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
  }
  uint64_t v13 = a3[6];
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  uint64_t v16 = sub_5250(&qword_3D368);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v17 = sub_2F260();
    uint64_t v18 = *(void *)(v17 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v15, 1, v17))
    {
      uint64_t v19 = sub_5250(&qword_3D370);
      memcpy(v14, v15, *(void *)(*(void *)(v19 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v14, v15, v17);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v14, 0, 1, v17);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
  }
  *(_OWORD *)&a1[a3[7]] = *(_OWORD *)&a2[a3[7]];
  return a1;
}

char *sub_18F60(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_8218((uint64_t)a1, &qword_3D358);
    uint64_t v6 = sub_5250(&qword_3D358);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_2EE80();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
    uint64_t v8 = a3[5];
    uint64_t v9 = &a1[v8];
    uint64_t v10 = &a2[v8];
    sub_8218((uint64_t)&a1[v8], &qword_3D360);
    uint64_t v11 = sub_5250(&qword_3D360);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_2EE60();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
    }
    uint64_t v13 = a3[6];
    uint64_t v14 = &a1[v13];
    uint64_t v15 = &a2[v13];
    sub_8218((uint64_t)&a1[v13], &qword_3D368);
    uint64_t v16 = sub_5250(&qword_3D368);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v17 = sub_2F260();
      uint64_t v18 = *(void *)(v17 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v15, 1, v17))
      {
        uint64_t v19 = sub_5250(&qword_3D370);
        memcpy(v14, v15, *(void *)(*(void *)(v19 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v14, v15, v17);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v14, 0, 1, v17);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
    }
  }
  uint64_t v20 = a3[7];
  uint64_t v21 = &a1[v20];
  id v22 = &a2[v20];
  uint64_t v23 = *(void **)&a1[v20];
  *(void *)&a1[v20] = *(void *)v22;

  *((void *)v21 + 1) = *((void *)v22 + 1);
  swift_release();
  return a1;
}

uint64_t sub_19280(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_19294);
}

uint64_t sub_19294(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_5250(&qword_3D378);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_8:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_5250(&qword_3D380);
  if (*(_DWORD *)(*(void *)(v11 - 8) + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = a3[5];
LABEL_7:
    uint64_t v10 = a1 + v13;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_8;
  }
  uint64_t v14 = sub_5250(&qword_3D388);
  if (*(_DWORD *)(*(void *)(v14 - 8) + 84) == a2)
  {
    uint64_t v8 = v14;
    uint64_t v12 = *(void *)(v14 - 8);
    uint64_t v13 = a3[6];
    goto LABEL_7;
  }
  unint64_t v16 = *(void *)(a1 + a3[7]);
  if (v16 >= 0xFFFFFFFF) {
    LODWORD(v16) = -1;
  }
  return (v16 + 1);
}

uint64_t sub_19400(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_19414);
}

uint64_t sub_19414(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = sub_5250(&qword_3D378);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t v13 = sub_5250(&qword_3D380);
    if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
    {
      uint64_t v10 = v13;
      uint64_t v14 = *(void *)(v13 - 8);
      uint64_t v15 = a4[5];
    }
    else
    {
      uint64_t result = sub_5250(&qword_3D388);
      if (*(_DWORD *)(*(void *)(result - 8) + 84) != a3)
      {
        *(void *)(a1 + a4[7]) = (a2 - 1);
        return result;
      }
      uint64_t v10 = result;
      uint64_t v14 = *(void *)(result - 8);
      uint64_t v15 = a4[6];
    }
    uint64_t v12 = a1 + v15;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }

  return v11(v12, a2, a2, v10);
}

void sub_1957C()
{
  sub_196C0(319, &qword_3D3F8, (void (*)(uint64_t))&type metadata accessor for AppendSettingsNavigationPathAction);
  if (v0 <= 0x3F)
  {
    sub_196C0(319, &qword_3D400, (void (*)(uint64_t))&type metadata accessor for ClearSettingsNavigationPathAction);
    if (v1 <= 0x3F)
    {
      sub_19714();
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_196C0(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_2EFB0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void sub_19714()
{
  if (!qword_3D408)
  {
    sub_8038(&qword_3D370);
    unint64_t v0 = sub_2EFB0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_3D408);
    }
  }
}

uint64_t sub_19770()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1978C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AppsSettingsList();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_197F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AppsSettingsList();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_19858@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for AppsSettingsList() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_1590C(a1, v6, a2);
}

uint64_t sub_198DC()
{
  return sub_19BE4((uint64_t (*)(uint64_t))sub_16ECC);
}

unint64_t sub_19904()
{
  unint64_t result = qword_3D4C8;
  if (!qword_3D4C8)
  {
    sub_8038(&qword_3D460);
    sub_19980();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D4C8);
  }
  return result;
}

unint64_t sub_19980()
{
  unint64_t result = qword_3D4D0;
  if (!qword_3D4D0)
  {
    sub_8038(&qword_3D458);
    sub_8580(&qword_3D4D8, &qword_3D4E0);
    sub_8580(&qword_3D4E8, &qword_3D450);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D4D0);
  }
  return result;
}

unint64_t sub_19A54()
{
  unint64_t result = qword_3D4F0;
  if (!qword_3D4F0)
  {
    sub_8038(&qword_3D478);
    sub_19AF4();
    sub_8580(&qword_3CF40, &qword_3CF48);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D4F0);
  }
  return result;
}

unint64_t sub_19AF4()
{
  unint64_t result = qword_3D4F8;
  if (!qword_3D4F8)
  {
    sub_8038(&qword_3D470);
    sub_8038(&qword_3D460);
    sub_19904();
    swift_getOpaqueTypeConformance2();
    sub_8580(&qword_3D500, &qword_3D508);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D4F8);
  }
  return result;
}

uint64_t sub_19BCC()
{
  return sub_19BE4((uint64_t (*)(uint64_t))sub_174B0);
}

uint64_t sub_19BE4(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for AppsSettingsList() - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));

  return a1(v3);
}

unint64_t sub_19C58()
{
  unint64_t result = qword_3D510;
  if (!qword_3D510)
  {
    sub_8038(&qword_3D498);
    sub_8038(&qword_3D488);
    sub_8038(&qword_3D480);
    sub_8038(&qword_3D478);
    sub_19A54();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D510);
  }
  return result;
}

uint64_t sub_19D78()
{
  return sub_1F150(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_19D94()
{
  return sub_1EB60(*(unsigned __int8 *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_19DB4()
{
  return sub_1EC88(*(char **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_19DD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_5250(&qword_3D520);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_19E3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_5250(&qword_3D840);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_19EA4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_5250(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_19F10@<X0>(uint64_t a1@<X8>)
{
  return sub_1606C(*(void *)(v1 + 16), a1);
}

unint64_t sub_19F18()
{
  unint64_t result = qword_3D558;
  if (!qword_3D558)
  {
    sub_8038(&qword_3D550);
    sub_19FDC((unint64_t *)&qword_3CF20, &qword_3CF18, (void (*)(void))sub_8080);
    sub_19FDC(&qword_3D560, &qword_3D568, (void (*)(void))sub_1A054);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D558);
  }
  return result;
}

uint64_t sub_19FDC(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_8038(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1A054()
{
  unint64_t result = qword_3D570;
  if (!qword_3D570)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D570);
  }
  return result;
}

uint64_t sub_1A0A8()
{
  uint64_t v1 = sub_2F030();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_1A138()
{
  sub_2F030();

  return sub_16808();
}

uint64_t sub_1A1AC()
{
  uint64_t v1 = (int *)type metadata accessor for AppsSettingsList();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v5 = v0 + v3;
  sub_5250(&qword_3D358);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_2EE80();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = v5 + v1[5];
  sub_5250(&qword_3D360);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_2EE60();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  }
  else
  {
    swift_release();
  }
  uint64_t v9 = v5 + v1[6];
  sub_5250(&qword_3D368);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_2F260();
    uint64_t v11 = *(void *)(v10 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10)) {
      (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
    }
  }
  else
  {
    swift_release();
  }

  swift_release();

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_1A410(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for AppsSettingsList() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_168CC(a1, v4);
}

unint64_t sub_1A490()
{
  unint64_t result = qword_3D590;
  if (!qword_3D590)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D590);
  }
  return result;
}

uint64_t sub_1A4E4()
{
  return sub_2F110();
}

uint64_t sub_1A508(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1A550(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for HiddenAppsSettingsList();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1A5AC()
{
  return sub_2F020();
}

unint64_t sub_1A614()
{
  unint64_t result = qword_3D5B8;
  if (!qword_3D5B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D5B8);
  }
  return result;
}

uint64_t sub_1A668()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1A784@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2AFF8((unint64_t *)&qword_3D870, (void (*)(uint64_t))type metadata accessor for HiddenAppsSettingsListViewModel);
  sub_2EDA0();
  swift_release();
  *a2 = *(void *)(v3 + OBJC_IVAR____TtC13InstalledApps31HiddenAppsSettingsListViewModel__hiddenApps);
  return swift_bridgeObjectRetain();
}

uint64_t sub_1A838()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1A918()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_5250(&qword_3D520);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_3CC58 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_2EEF0();
  sub_D130(v5, (uint64_t)qword_3F088);
  uint64_t v6 = sub_2EED0();
  os_log_type_t v7 = sub_2F700();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_0, v6, v7, "Presenting Default Apps.", v8, 2u);
    swift_slowDealloc();
  }

  uint64_t v9 = v1 + OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel_appendSettingsNavigationPath;
  swift_beginAccess();
  sub_12A1C(v9, (uint64_t)v4, &qword_3D520);
  uint64_t v10 = sub_2EE80();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48))(v4, 1, v10);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    sub_2E75C();
    sub_2EE70();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v4, v10);
    uint64_t KeyPath = swift_getKeyPath();
    __chkstk_darwin(KeyPath);
    v14[-3] = 0;
    v14[-2] = 0;
    v14[-4] = v1;
    void v14[2] = v1;
    sub_2AFF8((unint64_t *)&qword_3D710, (void (*)(uint64_t))type metadata accessor for AppsSettingsListViewModel);
    sub_2ED90();
    return swift_release();
  }
  return result;
}

uint64_t sub_1ABD8()
{
  uint64_t v1 = sub_5250(&qword_3D040);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_2F670();
  uint64_t v5 = *(void *)(v4 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
  uint64_t v6 = (void *)swift_allocObject();
  _OWORD v6[2] = 0;
  v6[3] = 0;
  long long v6[4] = v0;
  int v7 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4);
  id v8 = v0;
  if (v7 == 1)
  {
    sub_8218((uint64_t)v3, &qword_3D040);
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }
  else
  {
    sub_2F660();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v3, v4);
    if (v6[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v9 = sub_2F620();
      uint64_t v10 = v11;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v9 = 0;
      uint64_t v10 = 0;
    }
  }
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = &unk_3D8C8;
  *(void *)(v12 + 24) = v6;
  if (v10 | v9)
  {
    v14[0] = 0;
    v14[1] = 0;
    void v14[2] = v9;
    void v14[3] = v10;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_1AE18()
{
  swift_getKeyPath();
  sub_2AFF8((unint64_t *)&qword_3D710, (void (*)(uint64_t))type metadata accessor for AppsSettingsListViewModel);
  sub_2EDA0();
  swift_release();
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel__currentSelection);
  sub_2D89C(v1, *(void *)(v0 + OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel__currentSelection + 8));
  return v1;
}

uint64_t sub_1AED8@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2AFF8((unint64_t *)&qword_3D710, (void (*)(uint64_t))type metadata accessor for AppsSettingsListViewModel);
  sub_2EDA0();
  swift_release();
  uint64_t v4 = *(void *)(v3 + OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel__currentSelection);
  unint64_t v5 = *(void *)(v3 + OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel__currentSelection + 8);
  *a2 = v4;
  a2[1] = v5;
  return sub_2D89C(v4, v5);
}

uint64_t sub_1AF90(uint64_t *a1)
{
  uint64_t v1 = *a1;
  unint64_t v2 = a1[1];
  swift_getKeyPath();
  sub_2D89C(v1, v2);
  sub_2AFF8((unint64_t *)&qword_3D710, (void (*)(uint64_t))type metadata accessor for AppsSettingsListViewModel);
  sub_2ED90();
  sub_9B0C(v1, v2);
  return swift_release();
}

uint64_t sub_1B080()
{
  swift_getKeyPath();
  sub_2AFF8((unint64_t *)&qword_3D710, (void (*)(uint64_t))type metadata accessor for AppsSettingsListViewModel);
  sub_2EDA0();
  swift_release();
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel_effectiveIsSearching);
}

uint64_t sub_1B128()
{
  swift_getKeyPath();
  sub_2AFF8((unint64_t *)&qword_3D710, (void (*)(uint64_t))type metadata accessor for AppsSettingsListViewModel);
  sub_2EDA0();
  swift_release();
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel_effectiveSearchFilter);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1B1E4()
{
  return sub_1B20C();
}

uint64_t sub_1B1F8()
{
  return sub_1B20C();
}

uint64_t sub_1B20C()
{
  return swift_bridgeObjectRetain();
}

id sub_1B2B0()
{
  uint64_t v1 = OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel____lazy_storage___hiddenAppsSettingsListViewModel;
  unint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel____lazy_storage___hiddenAppsSettingsListViewModel);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel____lazy_storage___hiddenAppsSettingsListViewModel);
  }
  else
  {
    id v4 = [objc_allocWithZone((Class)type metadata accessor for HiddenAppsSettingsListViewModel()) init];
    unint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    unint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

uint64_t sub_1B324()
{
  sub_5250(&qword_3D838);
  uint64_t inited = swift_initStackObject();
  *(void *)(inited + 32) = 0xD000000000000010;
  *(_OWORD *)(inited + 16) = xmmword_31260;
  *(void *)(inited + 40) = 0x80000000000317F0;
  strcpy((char *)(inited + 48), "com.apple.Home");
  *(unsigned char *)(inited + 63) = -18;
  *(void *)(inited + 64) = 0xD000000000000015;
  *(void *)(inited + 72) = 0x8000000000032770;
  *(void *)(inited + 80) = 0xD000000000000010;
  *(void *)(inited + 88) = 0x8000000000032790;
  uint64_t v1 = (int *)sub_2CE14(inited);
  swift_setDeallocating();
  uint64_t result = swift_arrayDestroy();
  off_3D5C0 = v1;
  return result;
}

int *sub_1B418()
{
  uint64_t result = (int *)sub_2CFB8((uint64_t)&off_39920);
  off_3D5C8 = result;
  return result;
}

uint64_t sub_1B440()
{
  uint64_t v1 = sub_5250(&qword_3D040);
  __chkstk_darwin(v1 - 8);
  id v3 = (char *)v38 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_5250(&qword_3D440);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  int v7 = (char *)v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)v38 - v8;
  uint64_t v10 = sub_2ED70();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  uint64_t v13 = __chkstk_darwin(v10);
  uint64_t v47 = (char *)v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v46 = (char *)v38 - v15;
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)v38 - v16;
  uint64_t v18 = v0 + OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel_pendingURL;
  swift_beginAccess();
  sub_12A1C(v18, (uint64_t)v9, &qword_3D440);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1) {
    return sub_8218((uint64_t)v9, &qword_3D440);
  }
  uint64_t v20 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
  uint64_t v43 = v11 + 32;
  uint64_t v44 = v0;
  uint64_t v42 = v20;
  v20(v17, v9, v10);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v7, 1, 1, v10);
  swift_beginAccess();
  sub_2AF70((uint64_t)v7, v18);
  swift_endAccess();
  if (qword_3CC58 != -1) {
    swift_once();
  }
  uint64_t v45 = v3;
  uint64_t v21 = sub_2EEF0();
  sub_D130(v21, (uint64_t)qword_3F088);
  id v22 = v46;
  uint64_t v41 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
  v41(v46, v17, v10);
  uint64_t v23 = sub_2EED0();
  os_log_type_t v24 = sub_2F730();
  if (os_log_type_enabled(v23, v24))
  {
    uint64_t v25 = swift_slowAlloc();
    uint64_t v39 = v17;
    uint64_t v40 = v11;
    uint64_t v26 = v25;
    uint64_t v27 = swift_slowAlloc();
    v38[1] = v27;
    *(_DWORD *)uint64_t v26 = 141558275;
    uint64_t v48 = 1752392040;
    v49[0] = v27;
    sub_2F820();
    *(_WORD *)(v26 + 12) = 2081;
    uint64_t v28 = sub_2ED50();
    uint64_t v48 = sub_291EC(v28, v29, v49);
    sub_2F820();
    swift_bridgeObjectRelease();
    uint64_t v46 = *(char **)(v40 + 8);
    ((void (*)(char *, uint64_t))v46)(v22, v10);
    _os_log_impl(&dword_0, v23, v24, "Handling pending URL: '%{private,mask.hash}s'", (uint8_t *)v26, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v17 = v39;
    uint64_t v11 = v40;
    swift_slowDealloc();
  }
  else
  {
    uint64_t v46 = *(char **)(v11 + 8);
    ((void (*)(char *, uint64_t))v46)(v22, v10);
  }

  uint64_t v30 = sub_2F670();
  uint64_t v31 = (uint64_t)v45;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v45, 1, 1, v30);
  uint64_t v32 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v33 = v47;
  v41(v47, v17, v10);
  sub_2F640();
  swift_retain();
  uint64_t v34 = sub_2F630();
  unint64_t v35 = (*(unsigned __int8 *)(v11 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v36 = v17;
  uint64_t v37 = (char *)swift_allocObject();
  *((void *)v37 + 2) = v34;
  *((void *)v37 + 3) = &protocol witness table for MainActor;
  *((void *)v37 + 4) = v32;
  v42(&v37[v35], v33, v10);
  swift_release();
  sub_1E818(v31, (uint64_t)&unk_3D898, (uint64_t)v37);
  swift_release();
  return ((uint64_t (*)(char *, uint64_t))v46)(v36, v10);
}

uint64_t sub_1B9F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[6] = a4;
  v5[7] = a5;
  v5[5] = a1;
  sub_2F640();
  v5[8] = sub_2F630();
  uint64_t v7 = sub_2F620();
  v5[9] = v7;
  v5[10] = v6;
  return _swift_task_switch(sub_1BA90, v7, v6);
}

uint64_t sub_1BA90()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  *(void *)(v0 + 88) = Strong;
  if (Strong)
  {
    uint64_t v2 = (void *)swift_task_alloc();
    *(void *)(v0 + 96) = v2;
    void *v2 = v0;
    v2[1] = sub_1BBA0;
    uint64_t v3 = *(void *)(v0 + 56);
    return sub_1BD54(v3);
  }
  else
  {
    swift_release();
    **(unsigned char **)(v0 + 40) = *(void *)(v0 + 88) == 0;
    uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
    return v5();
  }
}

uint64_t sub_1BBA0()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void **)(*v0 + 88);
  swift_task_dealloc();

  uint64_t v3 = *(void *)(v1 + 80);
  uint64_t v4 = *(void *)(v1 + 72);
  return _swift_task_switch(sub_1BCE0, v4, v3);
}

uint64_t sub_1BCE0()
{
  swift_release();
  **(unsigned char **)(v0 + 40) = *(void *)(v0 + 88) == 0;
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1BD54(uint64_t a1)
{
  v2[56] = a1;
  v2[57] = v1;
  sub_5250(&qword_3D440);
  v2[58] = swift_task_alloc();
  uint64_t v3 = sub_2EE40();
  v2[59] = v3;
  v2[60] = *(void *)(v3 - 8);
  v2[61] = swift_task_alloc();
  v2[62] = swift_task_alloc();
  uint64_t v4 = sub_2ECA0();
  v2[63] = v4;
  v2[64] = *(void *)(v4 - 8);
  v2[65] = swift_task_alloc();
  v2[66] = type metadata accessor for AppsSettingsDestinationOption();
  v2[67] = swift_task_alloc();
  v2[68] = swift_task_alloc();
  sub_5250((uint64_t *)&unk_3D700);
  v2[69] = swift_task_alloc();
  uint64_t v5 = sub_2ECF0();
  v2[70] = v5;
  v2[71] = *(void *)(v5 - 8);
  v2[72] = swift_task_alloc();
  sub_5250(&qword_3D520);
  v2[73] = swift_task_alloc();
  v2[74] = swift_task_alloc();
  v2[75] = swift_task_alloc();
  uint64_t v6 = sub_2ED70();
  v2[76] = v6;
  v2[77] = *(void *)(v6 - 8);
  v2[78] = swift_task_alloc();
  v2[79] = swift_task_alloc();
  uint64_t v7 = sub_2EEF0();
  v2[80] = v7;
  v2[81] = *(void *)(v7 - 8);
  v2[82] = swift_task_alloc();
  sub_2F640();
  v2[83] = sub_2F630();
  uint64_t v9 = sub_2F620();
  v2[84] = v9;
  v2[85] = v8;
  return _swift_task_switch(sub_1C0C8, v9, v8);
}

uint64_t sub_1C0C8()
{
  uint64_t v100 = v0;
  if (qword_3CC58 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[82];
  uint64_t v2 = v0[81];
  uint64_t v3 = v0[80];
  uint64_t v4 = v0[79];
  uint64_t v5 = v0[77];
  uint64_t v6 = v0[76];
  uint64_t v7 = v0[56];
  uint64_t v8 = (void *)v0[57];
  uint64_t v9 = sub_D130(v3, (uint64_t)qword_3F088);
  v0[86] = v9;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v9, v3);
  uint64_t v97 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v97(v4, v7, v6);
  id v10 = v8;
  uint64_t v11 = sub_2EED0();
  os_log_type_t v12 = sub_2F730();
  BOOL v13 = os_log_type_enabled(v11, v12);
  uint64_t v14 = v0[82];
  uint64_t v15 = v0[81];
  uint64_t v16 = v0[80];
  uint64_t v17 = v0[79];
  uint64_t v18 = v0[77];
  uint64_t v95 = v0[76];
  uint64_t v19 = (void *)v0[57];
  if (v13)
  {
    uint64_t v20 = swift_slowAlloc();
    v99[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v20 = 136315907;
    os_log_type_t type = v12;
    swift_getObjectType();
    uint64_t v21 = sub_2FAB0();
    v0[53] = sub_291EC(v21, v22, v99);
    sub_2F820();
    swift_bridgeObjectRelease();

    *(_WORD *)(v20 + 12) = 2080;
    v0[54] = sub_291EC(0x5255656C646E6168, 0xED0000293A5F284CLL, v99);
    sub_2F820();
    *(_WORD *)(v20 + 22) = 2160;
    v0[55] = 1752392040;
    sub_2F820();
    *(_WORD *)(v20 + 32) = 2081;
    uint64_t v23 = sub_2ED50();
    v0[47] = sub_291EC(v23, v24, v99);
    sub_2F820();
    swift_bridgeObjectRelease();
    uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
    v25(v17, v95);
    _os_log_impl(&dword_0, v11, type, "Start (%s.%s) url: '%{private,mask.hash}s'…", (uint8_t *)v20, 0x2Au);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
  }
  else
  {

    uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
    v25(v17, v95);

    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
  }
  uint64_t v26 = v0[75];
  uint64_t v27 = v0[57];
  uint64_t v28 = OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel_appendSettingsNavigationPath;
  v0[87] = OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel_appendSettingsNavigationPath;
  uint64_t v29 = v27 + v28;
  swift_beginAccess();
  sub_12A1C(v29, v26, &qword_3D520);
  uint64_t v30 = sub_2EE80();
  v0[88] = v30;
  uint64_t v31 = *(void *)(v30 - 8);
  v0[89] = v31;
  uint64_t v32 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v31 + 48);
  v0[90] = v32;
  v0[91] = (v31 + 48) & 0xFFFFFFFFFFFFLL | 0x60F0000000000000;
  if (v32(v26, 1, v30) != 1)
  {
    uint64_t v45 = v0[71];
    uint64_t v46 = v0[70];
    uint64_t v47 = v0[69];
    sub_8218(v0[75], &qword_3D520);
    sub_2ECC0();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v45 + 48))(v47, 1, v46) == 1)
    {
      uint64_t v48 = v0[69];
      swift_release();
      sub_8218(v48, (uint64_t *)&unk_3D700);
      uint64_t v49 = sub_2EED0();
      os_log_type_t v50 = sub_2F710();
      if (os_log_type_enabled(v49, v50))
      {
        uint64_t v51 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v51 = 0;
        _os_log_impl(&dword_0, v49, v50, "Failed to retrieve URL components from URL.", v51, 2u);
        swift_slowDealloc();
      }
      uint64_t v53 = v0[56];
      uint64_t v52 = (void *)v0[57];

      swift_getKeyPath();
      uint64_t v54 = swift_task_alloc();
      *(void *)(v54 + 16) = v52;
      *(_OWORD *)(v54 + 24) = xmmword_30620;
      v0[40] = v52;
      sub_2AFF8((unint64_t *)&qword_3D710, (void (*)(uint64_t))type metadata accessor for AppsSettingsListViewModel);
      sub_2ED90();
      swift_release();
      swift_task_dealloc();
      uint64_t v55 = v52;
      goto LABEL_20;
    }
    (*(void (**)(void, void, void))(v0[71] + 32))(v0[72], v0[69], v0[70]);
    v0[24] = sub_2ECD0();
    v0[25] = v62;
    v0[26] = 47;
    v0[27] = 0xE100000000000000;
    v0[92] = sub_B45C();
    uint64_t v63 = sub_2F840();
    v0[93] = v63;
    swift_bridgeObjectRelease();
    unint64_t v64 = *(void *)(v63 + 16);
    v0[94] = v64;
    unint64_t v65 = v64 != 0;
    if (v64 == v65)
    {
      swift_release();
      unint64_t v66 = sub_2EED0();
      os_log_type_t v67 = sub_2F730();
      if (os_log_type_enabled(v66, v67))
      {
        uint64_t v68 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v68 = 0;
        _os_log_impl(&dword_0, v66, v67, "No first path component (likely linking to root of pane).", v68, 2u);
        swift_slowDealloc();
      }
      uint64_t v69 = v0[72];
      uint64_t v70 = v0[71];
      uint64_t v71 = v0[70];
      uint64_t v53 = v0[56];
      uint64_t v58 = (void *)v0[57];

      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v70 + 8))(v69, v71);
      swift_getKeyPath();
      uint64_t v72 = swift_task_alloc();
      *(void *)(v72 + 16) = v58;
      *(_OWORD *)(v72 + 24) = xmmword_30620;
      v0[52] = v58;
      sub_2AFF8((unint64_t *)&qword_3D710, (void (*)(uint64_t))type metadata accessor for AppsSettingsListViewModel);
      goto LABEL_19;
    }
    if (v64 > v65)
    {
      uint64_t v76 = (uint64_t *)(v63 + 32 + 16 * v65);
      uint64_t v77 = *v76;
      v0[95] = *v76;
      unint64_t v78 = v76[1];
      v0[96] = v78;
      unint64_t v79 = 1;
      if (v64) {
        unint64_t v79 = 2;
      }
      if (v64 >= v79)
      {
        if (v77 == 0xD000000000000023 && v78 == 0x8000000000031CF0 || (sub_2FA30() & 1) != 0)
        {
          uint64_t v77 = 0;
          uint64_t v80 = 0;
        }
        else if (v77 == 0xD000000000000027 && v78 == 0x8000000000031CC0 || (sub_2FA30() & 1) != 0)
        {
          uint64_t v77 = 0;
          uint64_t v80 = 1;
        }
        else if (v77 == 0xD000000000000022 && v78 == 0x8000000000032270 || (sub_2FA30() & 1) != 0)
        {
          uint64_t v77 = 0;
          uint64_t v80 = 3;
        }
        else
        {
          uint64_t v82 = self;
          swift_bridgeObjectRetain();
          NSString v83 = sub_2F5A0();
          id v84 = [v82 applicationWithBundleIdentifier:v83];

          LODWORD(v83) = [v84 isHidden];
          if (v83)
          {
            swift_release();
            swift_bridgeObjectRetain();
            uint64_t v85 = sub_2EED0();
            os_log_type_t v98 = sub_2F730();
            BOOL v86 = os_log_type_enabled(v85, v98);
            uint64_t v87 = v0[72];
            uint64_t v88 = v0[71];
            uint64_t v89 = v0[70];
            if (v86)
            {
              uint64_t v96 = v0[72];
              uint64_t v90 = swift_slowAlloc();
              v99[0] = swift_slowAlloc();
              *(_DWORD *)uint64_t v90 = 141558275;
              v0[50] = 1752392040;
              sub_2F820();
              *(_WORD *)(v90 + 12) = 2081;
              swift_bridgeObjectRetain();
              v0[51] = sub_291EC(v77, v78, v99);
              sub_2F820();
              swift_bridgeObjectRelease_n();
              _os_log_impl(&dword_0, v85, v98, "Requested application '%{private,mask.hash}s' is not selectable.", (uint8_t *)v90, 0x16u);
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_slowDealloc();

              swift_bridgeObjectRelease();
              (*(void (**)(uint64_t, uint64_t))(v88 + 8))(v96, v89);
            }
            else
            {

              swift_bridgeObjectRelease_n();
              swift_bridgeObjectRelease();
              (*(void (**)(uint64_t, uint64_t))(v88 + 8))(v87, v89);
            }
            uint64_t v92 = v0[56];
            uint64_t v91 = (void *)v0[57];
            swift_getKeyPath();
            uint64_t v93 = swift_task_alloc();
            *(void *)(v93 + 16) = v91;
            *(_OWORD *)(v93 + 24) = xmmword_30620;
            v0[49] = v91;
            sub_2AFF8((unint64_t *)&qword_3D710, (void (*)(uint64_t))type metadata accessor for AppsSettingsListViewModel);
            sub_2ED90();
            swift_release();
            swift_task_dealloc();
            uint64_t v55 = v91;
            uint64_t v73 = v92;
            goto LABEL_21;
          }
          uint64_t v80 = v78;
        }
        v0[98] = v80;
        v0[97] = v77;
        swift_bridgeObjectRetain();
        unint64_t v81 = (void *)swift_task_alloc();
        v0[99] = v81;
        *unint64_t v81 = v0;
        v81[1] = sub_1D0B8;
        return static AppDistributor.shouldShowAppInstallationSettings()();
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    return static AppDistributor.shouldShowAppInstallationSettings()();
  }
  uint64_t v33 = v0[78];
  uint64_t v34 = v0[76];
  uint64_t v35 = v0[75];
  uint64_t v36 = v0[56];
  swift_release();
  sub_8218(v35, &qword_3D520);
  v97(v33, v36, v34);
  uint64_t v37 = sub_2EED0();
  os_log_type_t v38 = sub_2F710();
  BOOL v39 = os_log_type_enabled(v37, v38);
  uint64_t v40 = v0[78];
  uint64_t v41 = v0[76];
  if (v39)
  {
    uint64_t v42 = swift_slowAlloc();
    v99[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v42 = 141558275;
    v0[38] = 1752392040;
    sub_2F820();
    *(_WORD *)(v42 + 12) = 2081;
    uint64_t v43 = sub_2ED50();
    v0[36] = sub_291EC(v43, v44, v99);
    sub_2F820();
    swift_bridgeObjectRelease();
    v25(v40, v41);
    _os_log_impl(&dword_0, v37, v38, "AppendSettingsNavigationPathAction not set, deferring handleURL for '%{private,mask.hash}s'", (uint8_t *)v42, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    v25(v0[78], v0[76]);
  }

  uint64_t v56 = v0[77];
  uint64_t v57 = v0[76];
  uint64_t v58 = (void *)v0[57];
  uint64_t v59 = v0[58];
  uint64_t v53 = v0[56];
  v97(v59, v53, v57);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v56 + 56))(v59, 0, 1, v57);
  uint64_t v60 = (uint64_t)v58 + OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel_pendingURL;
  swift_beginAccess();
  sub_2AF70(v59, v60);
  swift_endAccess();
  swift_getKeyPath();
  uint64_t v61 = swift_task_alloc();
  *(void *)(v61 + 16) = v58;
  *(_OWORD *)(v61 + 24) = xmmword_30620;
  v0[42] = v58;
  sub_2AFF8((unint64_t *)&qword_3D710, (void (*)(uint64_t))type metadata accessor for AppsSettingsListViewModel);
LABEL_19:
  sub_2ED90();
  swift_release();
  swift_task_dealloc();
  uint64_t v55 = v58;
LABEL_20:
  uint64_t v73 = v53;
LABEL_21:
  sub_2812C(v55, v73);
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
  char v74 = (uint64_t (*)(void))v0[1];
  return v74();
}

uint64_t sub_1D0B8(char a1)
{
  uint64_t v2 = *v1;
  *(unsigned char *)(*v1 + 801) = a1;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 680);
  uint64_t v4 = *(void *)(v2 + 672);
  return _swift_task_switch(sub_1D1E0, v4, v3);
}

uint64_t sub_1D1E0()
{
  uint64_t v166 = v0;
  uint64_t v1 = *(void *)(v0 + 768);
  uint64_t v2 = *(void *)(v0 + 760);
  swift_release();
  if (v2 == 0xD000000000000012 && v1 == 0x8000000000031630 || (sub_2FA30() & 1) != 0)
  {
    id v3 = [self sharedConnection];
    if (!v3)
    {
      sub_6330(*(void *)(v0 + 776), *(void *)(v0 + 784));
      __break(1u);
      goto LABEL_93;
    }
    uint64_t v4 = v3;
    unsigned int v5 = [v3 BOOLRestrictionForFeature:MCFeatureAccountModificationAllowed];

    if (v5 == 2)
    {
      sub_6330(*(void *)(v0 + 776), *(void *)(v0 + 784));
      swift_bridgeObjectRetain();
      uint64_t v6 = sub_2EED0();
      os_log_type_t v7 = sub_2F730();
      BOOL v8 = os_log_type_enabled(v6, v7);
      unint64_t v9 = *(void *)(v0 + 768);
      if (v8)
      {
        uint64_t v10 = *(void *)(v0 + 760);
        uint64_t v159 = *(void *)(v0 + 576);
        uint64_t v11 = *(void *)(v0 + 568);
        uint64_t v156 = *(void *)(v0 + 560);
        uint64_t v12 = swift_slowAlloc();
        v163[0]._countAndFlagsBits = swift_slowAlloc();
        *(_DWORD *)uint64_t v12 = 141558275;
        *(void *)(v0 + 296) = 1752392040;
        sub_2F820();
        *(_WORD *)(v12 + 12) = 2081;
        swift_bridgeObjectRetain();
        *(void *)(v0 + 384) = sub_291EC(v10, v9, &v163[0]._countAndFlagsBits);
        sub_2F820();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_0, v6, v7, "Requested application '%{private,mask.hash}s' is restricted.", (uint8_t *)v12, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        swift_bridgeObjectRelease();
        (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v159, v156);
      }
      else
      {
        uint64_t v16 = *(void *)(v0 + 576);
        uint64_t v17 = *(void *)(v0 + 568);
        uint64_t v18 = *(void *)(v0 + 560);

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
      }
      uint64_t v20 = *(void *)(v0 + 448);
      uint64_t v19 = *(void **)(v0 + 456);
      swift_getKeyPath();
      uint64_t v21 = swift_task_alloc();
      *(void *)(v21 + 16) = v19;
      *(_OWORD *)(v21 + 24) = xmmword_30620;
      *(void *)(v0 + 368) = v19;
      sub_2AFF8((unint64_t *)&qword_3D710, (void (*)(uint64_t))type metadata accessor for AppsSettingsListViewModel);
      sub_2ED90();
      swift_release();
      swift_task_dealloc();
      unint64_t v22 = v19;
      uint64_t v23 = v20;
      goto LABEL_83;
    }
  }
  uint64_t v13 = *(void *)(v0 + 784);
  swift_bridgeObjectRelease();
  switch(v13)
  {
    case 0:
      if (qword_3CC50 == -1) {
        goto LABEL_10;
      }
      goto LABEL_91;
    case 1:
      if (*(unsigned char *)(v0 + 801) != 1) {
        goto LABEL_23;
      }
      if (qword_3CC50 != -1) {
        swift_once();
      }
      v14.super.isa = (Class)qword_3F080;
      v15._countAndFlagsBits = 0xD000000000000010;
      v148._countAndFlagsBits = 0x80000000000318C0;
      v15._object = (void *)0x80000000000322A0;
      goto LABEL_28;
    case 2:
      goto LABEL_23;
    case 3:
      if (qword_3CC50 != -1) {
        swift_once();
      }
      v14.super.isa = (Class)qword_3F080;
      v148._countAndFlagsBits = 0x80000000000318C0;
      v15._countAndFlagsBits = 0x41206E6564646948;
      v15._object = (void *)0xEB00000000737070;
      goto LABEL_28;
    default:
      unint64_t v24 = *(void *)(v0 + 784);
      uint64_t v25 = *(void *)(v0 + 776);
      sub_631C(v25, v24);
      uint64_t v26 = sub_2CD84();
      char v27 = sub_263F4(v25, v24, (uint64_t)v26);
      swift_bridgeObjectRelease();
      sub_6330(v25, v24);
      if ((v27 & 1) == 0)
      {
        sub_631C(*(void *)(v0 + 776), *(void *)(v0 + 784));
        char v28 = sub_9FFC();
        if (v28 == 32) {
          goto LABEL_23;
        }
        char v29 = v28;
        if (qword_3CC68 != -1) {
          swift_once();
        }
        if ((sub_2652C(v29, (uint64_t)off_3D5C8) & 1) == 0)
        {
LABEL_23:
          sub_631C(*(void *)(v0 + 776), *(void *)(v0 + 784));
          uint64_t v35 = sub_2EED0();
          os_log_type_t v36 = sub_2F730();
          BOOL v37 = os_log_type_enabled(v35, v36);
          os_log_type_t v38 = *(void **)(v0 + 784);
          uint64_t v39 = *(void *)(v0 + 776);
          uint64_t v40 = *(void *)(v0 + 576);
          uint64_t v41 = *(void *)(v0 + 568);
          uint64_t v42 = *(void *)(v0 + 560);
          if (v37)
          {
            uint64_t v43 = swift_slowAlloc();
            v163[0]._countAndFlagsBits = swift_slowAlloc();
            *(_DWORD *)uint64_t v43 = 141558275;
            *(void *)(v0 + 352) = 1752392040;
            sub_2F820();
            *(_WORD *)(v43 + 12) = 2081;
            sub_631C(v39, (unint64_t)v38);
            v168._countAndFlagsBits = v39;
            v168._object = v38;
            uint64_t v152 = v40;
            uint64_t v153 = v42;
            uint64_t v44 = sub_A800(v168);
            unint64_t v46 = v45;
            sub_6330(v39, (unint64_t)v38);
            *(void *)(v0 + 360) = sub_291EC(v44, v46, &v163[0]._countAndFlagsBits);
            sub_2F820();
            swift_bridgeObjectRelease();
            sub_6330(v39, (unint64_t)v38);
            sub_6330(v39, (unint64_t)v38);
            _os_log_impl(&dword_0, v35, v36, "Requested selection '%{private,mask.hash}s' is not likely to be in list.", (uint8_t *)v43, 0x16u);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();

            swift_bridgeObjectRelease();
            (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v152, v153);
          }
          else
          {

            sub_6330(v39, (unint64_t)v38);
            sub_6330(v39, (unint64_t)v38);
            swift_bridgeObjectRelease();
            (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v40, v42);
          }
          uint64_t v88 = *(void *)(v0 + 448);
          uint64_t v87 = *(void **)(v0 + 456);
          swift_getKeyPath();
          uint64_t v89 = swift_task_alloc();
          *(void *)(v89 + 16) = v87;
          *(_OWORD *)(v89 + 24) = xmmword_30620;
          *(void *)(v0 + 344) = v87;
          sub_2AFF8((unint64_t *)&qword_3D710, (void (*)(uint64_t))type metadata accessor for AppsSettingsListViewModel);
          sub_2ED90();
          swift_release();
          swift_task_dealloc();
          unint64_t v22 = v87;
          uint64_t v23 = v88;
          goto LABEL_83;
        }
      }
      unint64_t v30 = *(void *)(v0 + 784);
      uint64_t v31 = *(void *)(v0 + 776);
      sub_631C(v31, v30);
      uint64_t v32 = sub_D310(v31, v24);
      uint64_t v34 = v33;
      sub_6330(v31, v30);
      break;
  }
  while (1)
  {
    sub_53D4(v32, v34, *(void *)(v0 + 776), *(void *)(v0 + 784), *(uint64_t **)(v0 + 544));
    uint64_t v149 = v32;
    uint64_t v150 = v34;
    if (swift_getEnumCaseMultiPayload())
    {
      sub_4AAC(*(void *)(v0 + 544));
      uint64_t v48 = 0;
      goto LABEL_70;
    }
    (*(void (**)(void, void))(*(void *)(v0 + 480) + 8))(*(void *)(v0 + 544), *(void *)(v0 + 472));
    uint64_t v49 = (void *)sub_2ECB0();
    if (!v49) {
      uint64_t v49 = _swiftEmptyArrayStorage;
    }
    uint64_t v50 = v49[2];
    if (!v50)
    {
      countAndFlagsBits = &_swiftEmptyDictionarySingleton;
LABEL_60:
      uint64_t v90 = *(void *)(v0 + 752);
      uint64_t v91 = *(void *)(v0 + 744);
      swift_bridgeObjectRelease();
      uint64_t v92 = (2 * v90) | 1;
      if (v90) {
        uint64_t v93 = 2;
      }
      else {
        uint64_t v93 = 1;
      }
      *(unsigned char *)(v0 + 800) = 1;
      sub_2F930();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      sub_2ADE0((uint64_t)v163, 0x6574616D696E61, 0xE700000000000000, isUniquelyReferenced_nonNull_native);
      uint64_t v95 = (uint64_t)countAndFlagsBits;
      swift_bridgeObjectRelease();
      *(void *)(v0 + 96) = v91;
      *(void *)(v0 + 104) = v91 + 32;
      *(void *)(v0 + 112) = v93;
      *(void *)(v0 + 120) = v92;
      swift_bridgeObjectRetain();
      sub_5250(&qword_3D738);
      sub_8580(&qword_3D740, &qword_3D738);
      uint64_t v96 = sub_2F580();
      unint64_t v98 = v97;
      swift_bridgeObjectRelease();
      v99._countAndFlagsBits = sub_2ECE0();
      if (v99._object)
      {
        v163[0]._countAndFlagsBits = 35;
        v163[0]._object = (void *)0xE100000000000000;
        sub_2F5D0(v99);
        swift_bridgeObjectRelease();
        sub_2F5D0(v163[0]);
        swift_bridgeObjectRelease();
      }
      uint64_t v100 = HIBYTE(v98) & 0xF;
      if ((v98 & 0x2000000000000000) == 0) {
        uint64_t v100 = v96 & 0xFFFFFFFFFFFFLL;
      }
      if (v100)
      {
        *(void *)(v0 + 256) = v96;
        *(void *)(v0 + 264) = v98;
        sub_2F930();
        char v101 = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v165 = v95;
        sub_2ADE0((uint64_t)v163, 1752457584, 0xE400000000000000, v101);
        uint64_t v95 = v165;
      }
      swift_bridgeObjectRelease();
      uint64_t v48 = sub_28520(v95);
      swift_bridgeObjectRelease();
LABEL_70:
      unint64_t v102 = *(void *)(v0 + 784);
      uint64_t v103 = *(void *)(v0 + 776);
      long long v104 = *(uint64_t **)(v0 + 536);
      *(void *)(v0 + 224) = v103;
      *(void *)(v0 + 232) = v102;
      sub_631C(v103, v102);
      sub_2EF30();
      sub_6330(v103, v102);
      sub_53D4(v149, v150, v103, v102, v104);
      swift_bridgeObjectRelease();
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload == 1)
      {
        v120 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 720);
        uint64_t v121 = *(void *)(v0 + 704);
        uint64_t v122 = *(void *)(v0 + 584);
        uint64_t v123 = *(uint64_t **)(v0 + 536);
        uint64_t v124 = *(void *)(v0 + 456) + *(void *)(v0 + 696);
        swift_bridgeObjectRelease();
        uint64_t v126 = *v123;
        uint64_t v125 = v123[1];
        sub_12A1C(v124, v122, &qword_3D520);
        if (v120(v122, 1, v121) != 1)
        {
          uint64_t v127 = *(void *)(v0 + 712);
          uint64_t v128 = *(void *)(v0 + 704);
          uint64_t v129 = *(void *)(v0 + 584);
          *(void *)(v0 + 272) = v126;
          *(void *)(v0 + 280) = v125;
          sub_12BC8();
          sub_2EE70();
          swift_bridgeObjectRelease();
          (*(void (**)(uint64_t, uint64_t))(v127 + 8))(v129, v128);
          goto LABEL_82;
        }
LABEL_94:
        sub_6330(*(void *)(v0 + 776), *(void *)(v0 + 784));
        __break(1u);
        JUMPOUT(0x1E65CLL);
      }
      if (EnumCaseMultiPayload)
      {
        unint64_t v130 = *(void *)(v0 + 784);
        uint64_t v131 = *(void *)(v0 + 776);
        swift_bridgeObjectRelease();
        sub_631C(v131, v130);
        sub_631C(v131, v130);
        v132 = sub_2EED0();
        os_log_type_t v133 = sub_2F730();
        BOOL v134 = os_log_type_enabled(v132, v133);
        uint64_t v135 = *(void **)(v0 + 784);
        uint64_t v136 = *(void *)(v0 + 776);
        if (v134)
        {
          uint64_t v137 = (uint8_t *)swift_slowAlloc();
          v163[0]._countAndFlagsBits = swift_slowAlloc();
          *(_DWORD *)uint64_t v137 = 136446210;
          sub_631C(v136, (unint64_t)v135);
          v169._countAndFlagsBits = v136;
          v169._object = v135;
          uint64_t v138 = sub_A800(v169);
          unint64_t v140 = v139;
          sub_6330(v136, (unint64_t)v135);
          *(void *)(v0 + 312) = sub_291EC(v138, v140, &v163[0]._countAndFlagsBits);
          sub_2F820();
          swift_bridgeObjectRelease();
          sub_6330(v136, (unint64_t)v135);
          sub_6330(v136, (unint64_t)v135);
          _os_log_impl(&dword_0, v132, v133, "Attempting to deep link into %{public}s which is not supported.", v137, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {
          sub_6330(*(void *)(v0 + 776), *(void *)(v0 + 784));
          sub_6330(v136, (unint64_t)v135);
        }

        sub_4AAC(*(void *)(v0 + 536));
        goto LABEL_82;
      }
      uint64_t v106 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 480) + 32);
      v106(*(void *)(v0 + 496), *(void *)(v0 + 536), *(void *)(v0 + 472));
      if (v48)
      {
        uint64_t v107 = *(void *)(v0 + 488);
        uint64_t v108 = *(void *)(v0 + 496);
        uint64_t v109 = *(void *)(v0 + 472);
        uint64_t v110 = *(void *)(v0 + 480);
        sub_2EDF0();
        swift_bridgeObjectRelease();
        (*(void (**)(uint64_t, uint64_t))(v110 + 8))(v108, v109);
        v106(v108, v107, v109);
      }
      uint64_t v111 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 720);
      uint64_t v112 = *(void *)(v0 + 704);
      uint64_t v113 = *(void *)(v0 + 592);
      sub_12A1C(*(void *)(v0 + 456) + *(void *)(v0 + 696), v113, &qword_3D520);
      if (v111(v113, 1, v112) != 1)
      {
        uint64_t v114 = *(void *)(v0 + 712);
        uint64_t v115 = *(void *)(v0 + 704);
        uint64_t v116 = *(void *)(v0 + 592);
        uint64_t v117 = *(void *)(v0 + 496);
        uint64_t v118 = *(void *)(v0 + 472);
        uint64_t v119 = *(void *)(v0 + 480);
        sub_2AFF8(&qword_3CDA0, (void (*)(uint64_t))&type metadata accessor for PreferencesControllerRecipe);
        sub_2EE70();
        (*(void (**)(uint64_t, uint64_t))(v119 + 8))(v117, v118);
        (*(void (**)(uint64_t, uint64_t))(v114 + 8))(v116, v115);
LABEL_82:
        unint64_t v141 = *(void *)(v0 + 784);
        uint64_t v142 = *(void *)(v0 + 776);
        uint64_t v143 = *(void *)(v0 + 568);
        uint64_t v158 = *(void *)(v0 + 560);
        uint64_t v161 = *(void *)(v0 + 576);
        v144 = *(void **)(v0 + 456);
        uint64_t v162 = *(void *)(v0 + 448);
        swift_getKeyPath();
        v145 = (void *)swift_task_alloc();
        v145[2] = v144;
        v145[3] = v142;
        v145[4] = v141;
        *(void *)(v0 + 328) = v144;
        sub_2AFF8((unint64_t *)&qword_3D710, (void (*)(uint64_t))type metadata accessor for AppsSettingsListViewModel);
        sub_2ED90();
        sub_6330(v142, v141);
        swift_release();
        swift_bridgeObjectRelease();
        swift_task_dealloc();
        (*(void (**)(uint64_t, uint64_t))(v143 + 8))(v161, v158);
        unint64_t v22 = v144;
        uint64_t v23 = v162;
LABEL_83:
        sub_2812C(v22, v23);
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
        uint64_t v146 = *(uint64_t (**)(void))(v0 + 8);
        return v146();
      }
LABEL_93:
      sub_6330(*(void *)(v0 + 776), *(void *)(v0 + 784));
      __break(1u);
      goto LABEL_94;
    }
    uint64_t v51 = (Swift::String *)(v0 + 16);
    uint64_t v52 = *(void *)(v0 + 512);
    uint64_t v160 = *(void (**)(void, char *, void))(v52 + 16);
    uint64_t v53 = (char *)v49 + ((*(unsigned __int8 *)(v52 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v52 + 80));
    unint64_t v157 = (void (**)(void, void))(v52 + 8);
    *(void *)os_log_type_t type = *(void *)(v52 + 72);
    v148._object = v49;
    swift_bridgeObjectRetain();
    countAndFlagsBits = &_swiftEmptyDictionarySingleton;
    uint64_t v151 = v0;
    uint64_t v154 = v0 + 56;
LABEL_38:
    v160(*(void *)(v0 + 520), v53, *(void *)(v0 + 504));
    uint64_t v56 = sub_2EC80();
    uint64_t v58 = v57;
    uint64_t v59 = sub_2EC90();
    if (!v60
      || (*(void *)(v0 + 176) = v59,
          *(void *)(v0 + 184) = v60,
          uint64_t v61 = sub_2F850(),
          uint64_t v63 = v62,
          swift_bridgeObjectRelease(),
          !v63))
    {
      swift_bridgeObjectRetain();
      unint64_t v74 = sub_2A760(v56, v58);
      char v76 = v75;
      swift_bridgeObjectRelease();
      if (v76)
      {
        v163[0]._countAndFlagsBits = (uint64_t)countAndFlagsBits;
        uint64_t v55 = v154;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_2B040();
          countAndFlagsBits = (void *)v163[0]._countAndFlagsBits;
        }
        swift_bridgeObjectRelease();
        uint64_t v77 = countAndFlagsBits[7] + 40 * v74;
        long long v78 = *(_OWORD *)v77;
        long long v79 = *(_OWORD *)(v77 + 16);
        *(void *)(v154 + 32) = *(void *)(v77 + 32);
        *(_OWORD *)uint64_t v154 = v78;
        *(_OWORD *)(v154 + 16) = v79;
        sub_2ABF4(v74, (uint64_t)countAndFlagsBits);
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v55 = v154;
        *(void *)(v154 + 32) = 0;
        *(_OWORD *)uint64_t v154 = 0u;
        *(_OWORD *)(v154 + 16) = 0u;
      }
      swift_bridgeObjectRelease();
      sub_8218(v55, &qword_3D730);
      goto LABEL_37;
    }
    *(void *)(v0 + 240) = v61;
    *(void *)(v0 + 248) = v63;
    sub_2F930();
    Swift::String v64 = v163[1];
    Swift::String *v51 = v163[0];
    v51[1] = v64;
    uint64_t v0 = (uint64_t)v51;
    v51[2]._countAndFlagsBits = v164;
    char v65 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v67 = sub_2A760(v56, v58);
    uint64_t v68 = countAndFlagsBits[2];
    BOOL v69 = (v66 & 1) == 0;
    uint64_t v70 = v68 + v69;
    if (!__OFADD__(v68, v69)) {
      break;
    }
    __break(1u);
LABEL_90:
    __break(1u);
LABEL_91:
    swift_once();
LABEL_10:
    v14.super.isa = (Class)qword_3F080;
    v148._countAndFlagsBits = 0x80000000000318C0;
    v15._countAndFlagsBits = 0x20746C7561666544;
    v15._object = (void *)0xEC00000073707041;
LABEL_28:
    v170.value._countAndFlagsBits = 0;
    v170.value._object = 0;
    v171._countAndFlagsBits = 0;
    v171._object = (void *)0xE000000000000000;
    uint64_t v32 = sub_2ED00(v15, v170, v14, v171, v148);
    uint64_t v34 = v47;
  }
  char v71 = v66;
  if (countAndFlagsBits[3] >= v70)
  {
    if (v65)
    {
      if ((v66 & 1) == 0) {
        goto LABEL_53;
      }
    }
    else
    {
      sub_2B040();
      if ((v71 & 1) == 0)
      {
LABEL_53:
        countAndFlagsBits[(v67 >> 6) + 8] |= 1 << v67;
        uint64_t v80 = (uint64_t *)(countAndFlagsBits[6] + 16 * v67);
        *uint64_t v80 = v56;
        v80[1] = v58;
        uint64_t v81 = countAndFlagsBits[7] + 40 * v67;
        long long v82 = *(_OWORD *)v0;
        long long v83 = *(_OWORD *)(v0 + 16);
        *(void *)(v81 + 32) = *(void *)(v0 + 32);
        *(_OWORD *)uint64_t v81 = v82;
        *(_OWORD *)(v81 + 16) = v83;
        uint64_t v84 = countAndFlagsBits[2];
        BOOL v85 = __OFADD__(v84, 1);
        uint64_t v86 = v84 + 1;
        if (v85) {
          goto LABEL_90;
        }
        uint64_t v51 = (Swift::String *)v0;
        countAndFlagsBits[2] = v86;
        swift_bridgeObjectRetain();
        goto LABEL_55;
      }
    }
LABEL_51:
    uint64_t v51 = (Swift::String *)v0;
    sub_2B238(v0, countAndFlagsBits[7] + 40 * v67);
LABEL_55:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v0 = v151;
LABEL_37:
    (*v157)(*(void *)(v0 + 520), *(void *)(v0 + 504));
    v53 += *(void *)type;
    if (!--v50)
    {
      swift_bridgeObjectRelease();
      goto LABEL_60;
    }
    goto LABEL_38;
  }
  sub_2A8BC(v70, v65);
  unint64_t v72 = sub_2A760(v56, v58);
  if ((v71 & 1) == (v73 & 1))
  {
    unint64_t v67 = v72;
    if ((v71 & 1) == 0) {
      goto LABEL_53;
    }
    goto LABEL_51;
  }
  return sub_2FA60();
}

uint64_t sub_1E66C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2F670();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2F660();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_8218(a1, &qword_3D040);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2F620();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1E818(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2F670();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2F660();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_8218(a1, &qword_3D040);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2F620();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  sub_5250(&qword_3D8B0);
  return swift_task_create();
}

uint64_t sub_1E9CC@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2AFF8((unint64_t *)&qword_3D710, (void (*)(uint64_t))type metadata accessor for AppsSettingsListViewModel);
  sub_2EDA0();
  swift_release();
  *a2 = *(void *)(v3 + OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel__sections);
  return swift_bridgeObjectRetain();
}

uint64_t sub_1EA80()
{
  return swift_release();
}

uint64_t sub_1EB60(uint64_t result, uint64_t a2)
{
  char v3 = result;
  if ((result & 1) == 0)
  {
    uint64_t KeyPath = swift_getKeyPath();
    __chkstk_darwin(KeyPath);
    sub_2AFF8((unint64_t *)&qword_3D710, (void (*)(uint64_t))type metadata accessor for AppsSettingsListViewModel);
    sub_2ED90();
    uint64_t result = swift_release();
  }
  *(unsigned char *)(a2 + OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel_effectiveIsSearching) = v3 & 1;
  return result;
}

uint64_t sub_1EC88(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_5250(&qword_3D040);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v9 = &a1[OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel_effectiveSearchFilter];
  *(void *)unint64_t v9 = a2;
  *((void *)v9 + 1) = a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_2F650();
  uint64_t v10 = sub_2F670();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 0, 1, v10);
  swift_getKeyPath();
  v15[1] = a1;
  sub_2AFF8((unint64_t *)&qword_3D710, (void (*)(uint64_t))type metadata accessor for AppsSettingsListViewModel);
  sub_2EDA0();
  swift_release();
  uint64_t v11 = *(void *)&a1[OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel__sections];
  uint64_t v12 = (void *)swift_allocObject();
  void v12[2] = 0;
  v12[3] = 0;
  v12[4] = v11;
  v12[5] = a2;
  v12[6] = a3;
  v12[7] = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v13 = a1;
  sub_93C0((uint64_t)v8, (uint64_t)&unk_3D888, (uint64_t)v12);
  swift_release();
  return sub_8218((uint64_t)v8, &qword_3D040);
}

uint64_t sub_1EE70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[9] = a6;
  v7[10] = a7;
  v7[7] = a4;
  v7[8] = a5;
  return _swift_task_switch(sub_1EE94, 0, 0);
}

uint64_t sub_1EE94()
{
  uint64_t v1 = *(void *)(v0[7] + 16);
  if (v1)
  {
    uint64_t v2 = swift_bridgeObjectRetain() + 64;
    do
    {
      v2 += 40;
      uint64_t v3 = swift_bridgeObjectRetain();
      sub_2B294(v3);
      --v1;
    }
    while (v1);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  v0[11] = sub_2DBA8((uint64_t)_swiftEmptyArrayStorage);
  v0[12] = 0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakInit();
  sub_2F640();
  v0[13] = sub_2F630();
  uint64_t v5 = sub_2F620();
  return _swift_task_switch(sub_1EFC4, v5, v4);
}

uint64_t sub_1EFC4()
{
  swift_release();
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v2 = (void *)Strong;
    uint64_t v3 = v0[11];
    swift_getKeyPath();
    uint64_t v4 = swift_task_alloc();
    *(void *)(v4 + 16) = v2;
    *(void *)(v4 + 24) = v3;
    v0[6] = v2;
    sub_2AFF8((unint64_t *)&qword_3D710, (void (*)(uint64_t))type metadata accessor for AppsSettingsListViewModel);
    swift_bridgeObjectRetain();
    sub_2ED90();
    swift_bridgeObjectRelease_n();
    swift_release();

    swift_task_dealloc();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  swift_unknownObjectWeakDestroy();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_1F150(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel__filteredItems) = a2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

id sub_1F194()
{
  uint64_t v1 = OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel____lazy_storage___homeKitVisibilityArbitrator;
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel____lazy_storage___homeKitVisibilityArbitrator);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel____lazy_storage___homeKitVisibilityArbitrator);
  }
  else
  {
    id v4 = [objc_allocWithZone((Class)HFHomeSettingsVisibilityArbitrator) init];
    uint64_t v5 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v10[4] = sub_2D954;
    v10[5] = v5;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 1107296256;
    _OWORD v10[2] = sub_1F4D8;
    v10[3] = &unk_3A540;
    uint64_t v6 = _Block_copy(v10);
    swift_release();
    [v4 setVisibilityStateChangeHandler:v6];
    _Block_release(v6);
    uint64_t v7 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v8 = v2;
  return v3;
}

void sub_1F2C0()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    sub_1F314();
  }
}

uint64_t sub_1F314()
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v2 = sub_5250(&qword_3D040);
  __chkstk_darwin(v2 - 8);
  id v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel_collation;
  id v6 = [*(id *)&v0[OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel_collation] sectionTitles];
  uint64_t v7 = sub_2F600();

  id v8 = [*(id *)&v0[v5] sectionIndexTitles];
  uint64_t v9 = sub_2F600();

  id v10 = sub_1F194();
  id v11 = [v10 visibilityState];

  uint64_t v12 = sub_2CD84();
  sub_2F650();
  uint64_t v13 = sub_2F670();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v4, 0, 1, v13);
  NSBundle v14 = *(void **)&v0[v5];
  Swift::String v15 = (void *)swift_allocObject();
  void v15[2] = 0;
  v15[3] = 0;
  v15[4] = v7;
  v15[5] = v12;
  v15[6] = v14;
  v15[7] = v11;
  v15[8] = v9;
  v15[9] = v0;
  v15[10] = ObjectType;
  id v16 = v14;
  uint64_t v17 = v0;
  sub_1E66C((uint64_t)v4, (uint64_t)&unk_3D7F0, (uint64_t)v15);
  return swift_release();
}

uint64_t sub_1F4D8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

uint64_t sub_1F52C()
{
  uint64_t v1 = OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel____lazy_storage___oneTimeConfiguration;
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel____lazy_storage___oneTimeConfiguration) == 1)
  {
    uint64_t result = sub_1F314();
    *(unsigned char *)(v0 + v1) = 0;
  }
  return result;
}

char *sub_1F564()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = sub_5250(&qword_3D778);
  __chkstk_darwin(v2 - 8);
  uint64_t v51 = (char *)&v47 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_2F760();
  uint64_t v52 = *(void *)(v4 - 8);
  uint64_t v53 = v4;
  __chkstk_darwin(v4);
  uint64_t v50 = (char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_5250(&qword_3D780);
  uint64_t v55 = *(void *)(v6 - 8);
  uint64_t v56 = v6;
  __chkstk_darwin(v6);
  uint64_t v54 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_5250(&qword_3D788);
  __chkstk_darwin(v8 - 8);
  id v10 = (char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = sub_2F7F0();
  uint64_t v11 = *(void *)(v47 - 8);
  __chkstk_darwin(v47);
  uint64_t v13 = (char *)&v47 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_5250(&qword_3D790);
  uint64_t v48 = *(void *)(v14 - 8);
  uint64_t v49 = v14;
  __chkstk_darwin(v14);
  id v16 = (char *)&v47 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel_appsSettingsListScrollToItemSubject;
  sub_5250(&qword_3D798);
  swift_allocObject();
  uint64_t v18 = v0;
  *(void *)&v0[v17] = sub_2EF40();
  uint64_t v19 = OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel_reloadSnapshotSubject;
  sub_5250(&qword_3D768);
  swift_allocObject();
  *(void *)&v18[v19] = sub_2EF40();
  *(void *)&v18[OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel____lazy_storage___hiddenAppsSettingsListViewModel] = 0;
  uint64_t v20 = &v18[OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel_appendSettingsNavigationPath];
  uint64_t v21 = sub_2EE80();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v20, 1, 1, v21);
  unint64_t v22 = &v18[OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel_clearSettingsNavigationPath];
  uint64_t v23 = sub_2EE60();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v22, 1, 1, v23);
  *(_OWORD *)&v18[OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel__currentSelection] = xmmword_30620;
  *(void *)&v18[OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel__sections] = _swiftEmptyArrayStorage;
  v18[OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel_effectiveIsSearching] = 0;
  unint64_t v24 = &v18[OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel_effectiveSearchFilter];
  *(void *)unint64_t v24 = 0;
  *((void *)v24 + 1) = 0xE000000000000000;
  *(void *)&v18[OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel__filteredItems] = _swiftEmptyArrayStorage;
  uint64_t v25 = OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel_collation;
  *(void *)&v18[v25] = [self currentCollation];
  *(void *)&v18[OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel____lazy_storage___homeKitVisibilityArbitrator] = 0;
  *(void *)&v18[OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel_cancellables] = &_swiftEmptySetSingleton;
  v18[OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel____lazy_storage___oneTimeConfiguration] = 1;
  uint64_t v26 = &v18[OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel_pendingURL];
  uint64_t v27 = sub_2ED70();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v26, 1, 1, v27);
  sub_2EDB0();

  v59.receiver = v18;
  v59.super_class = ObjectType;
  id v28 = objc_msgSendSuper2(&v59, "init");
  char v29 = self;
  unint64_t v30 = (char *)v28;
  uint64_t result = (char *)[v29 sharedConnection];
  if (result)
  {
    uint64_t v32 = result;
    [result registerObserver:v30];

    uint64_t v34 = __chkstk_darwin(v33);
    *(&v47 - 2) = (uint64_t)v30;
    __chkstk_darwin(v34);
    *(&v47 - 2) = (uint64_t)v30;
    sub_2ED80();
    uint64_t v35 = (void *)swift_allocObject();
    swift_unknownObjectWeakInit();
    aBlock[4] = sub_2D8F0;
    aBlock[5] = v35;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = (id)1107296256;
    aBlock[2] = sub_201B4;
    aBlock[3] = &unk_3A450;
    os_log_type_t v36 = _Block_copy(aBlock);
    swift_release();
    SBSRegisterDisplayIdentifiersChangedBlock();
    _Block_release(v36);
    aBlock[0] = *(id *)&v30[OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel_reloadSnapshotSubject];
    swift_retain();
    sub_2F7E0();
    id v57 = [self mainRunLoop];
    uint64_t v37 = sub_2F7D0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v37 - 8) + 56))(v10, 1, 1, v37);
    sub_2DF68(0, &qword_3D7A0);
    sub_8580(&qword_3D7A8, &qword_3D768);
    sub_2D910(&qword_3D7B0, &qword_3D7A0);
    sub_2EF70();
    sub_8218((uint64_t)v10, &qword_3D788);

    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v47);
    swift_release();
    swift_allocObject();
    swift_unknownObjectWeakInit();
    sub_8580(&qword_3D7B8, &qword_3D790);
    uint64_t v38 = v49;
    sub_2EF80();
    swift_release();
    (*(void (**)(char *, uint64_t))(v48 + 8))(v16, v38);
    swift_beginAccess();
    sub_2EF00();
    swift_endAccess();
    swift_release();
    id v39 = [self defaultCenter];
    uint64_t v40 = (void *)sub_2EDE0();
    uint64_t v41 = v50;
    sub_2F770();

    sub_2DF68(0, &qword_3D7C0);
    aBlock[0] = (id)sub_2F750();
    uint64_t v42 = sub_2F740();
    uint64_t v43 = (uint64_t)v51;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56))(v51, 1, 1, v42);
    sub_2AFF8(&qword_3D7C8, (void (*)(uint64_t))&type metadata accessor for NSNotificationCenter.Publisher);
    sub_2D910(&qword_3D7D0, &qword_3D7C0);
    uint64_t v44 = v53;
    unint64_t v45 = v54;
    sub_2EF60();
    sub_8218(v43, &qword_3D778);

    (*(void (**)(char *, uint64_t))(v52 + 8))(v41, v44);
    swift_allocObject();
    swift_unknownObjectWeakInit();
    sub_8580((unint64_t *)&unk_3D7D8, &qword_3D780);
    uint64_t v46 = v56;
    sub_2EF80();
    swift_release();
    (*(void (**)(char *, uint64_t))(v55 + 8))(v45, v46);
    swift_beginAccess();
    sub_2EF00();
    swift_endAccess();

    swift_release();
    return v30;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_20048()
{
  if (qword_3CC58 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2EEF0();
  sub_D130(v0, (uint64_t)qword_3F088);
  uint64_t v1 = sub_2EED0();
  os_log_type_t v2 = sub_2F730();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_0, v1, v2, "Did receive Display Identifiers Changed.", v3, 2u);
    swift_slowDealloc();
  }

  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v5 = (void *)result;
    swift_retain();

    sub_5250(&qword_3D768);
    sub_8580(&qword_3D770, &qword_3D768);
    sub_2EF50();
    return swift_release();
  }
  return result;
}

void sub_201B4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_20220()
{
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v1 = (void *)result;
    swift_retain();

    sub_5250(&qword_3D768);
    sub_8580(&qword_3D770, &qword_3D768);
    sub_2EF50();
    return swift_release();
  }
  return result;
}

id sub_202FC()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  id result = [self sharedConnection];
  if (!result) {
    goto LABEL_33;
  }
  id v4 = result;
  [result unregisterObserver:v1];

  SBSRegisterDisplayIdentifiersChangedBlock();
  uint64_t v5 = &v1[OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel_cancellables];
  swift_beginAccess();
  uint64_t v6 = *(void *)v5;
  uint64_t v23 = v1;
  unint64_t v22 = v5;
  if ((*(void *)v5 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_2F8A0();
    sub_2EF20();
    sub_2AFF8(&qword_3D878, (void (*)(uint64_t))&type metadata accessor for AnyCancellable);
    id result = (id)sub_2F6D0();
    uint64_t v6 = v26;
    uint64_t v7 = v27;
    uint64_t v8 = v28;
    uint64_t v9 = v29;
    unint64_t v10 = v30;
  }
  else
  {
    uint64_t v11 = -1 << *(unsigned char *)(v6 + 32);
    uint64_t v7 = v6 + 56;
    uint64_t v8 = ~v11;
    uint64_t v12 = -v11;
    if (v12 < 64) {
      uint64_t v13 = ~(-1 << v12);
    }
    else {
      uint64_t v13 = -1;
    }
    unint64_t v10 = v13 & *(void *)(v6 + 56);
    id result = (id)swift_bridgeObjectRetain();
    uint64_t v9 = 0;
  }
  int64_t v14 = (unint64_t)(v8 + 64) >> 6;
  if (v6 < 0) {
    goto LABEL_11;
  }
  while (1)
  {
    if (v10)
    {
      uint64_t v15 = (v10 - 1) & v10;
      unint64_t v16 = __clz(__rbit64(v10)) | (v9 << 6);
      uint64_t v17 = v9;
      goto LABEL_28;
    }
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1)) {
      break;
    }
    if (v18 >= v14) {
      goto LABEL_31;
    }
    unint64_t v19 = *(void *)(v7 + 8 * v18);
    uint64_t v17 = v9 + 1;
    if (!v19)
    {
      uint64_t v17 = v9 + 2;
      if (v9 + 2 >= v14) {
        goto LABEL_31;
      }
      unint64_t v19 = *(void *)(v7 + 8 * v17);
      if (!v19)
      {
        uint64_t v17 = v9 + 3;
        if (v9 + 3 >= v14) {
          goto LABEL_31;
        }
        unint64_t v19 = *(void *)(v7 + 8 * v17);
        if (!v19)
        {
          uint64_t v17 = v9 + 4;
          if (v9 + 4 >= v14) {
            goto LABEL_31;
          }
          unint64_t v19 = *(void *)(v7 + 8 * v17);
          if (!v19)
          {
            uint64_t v20 = v9 + 5;
            while (v14 != v20)
            {
              unint64_t v19 = *(void *)(v7 + 8 * v20++);
              if (v19)
              {
                uint64_t v17 = v20 - 1;
                goto LABEL_27;
              }
            }
LABEL_31:
            sub_2D7E4();
            *(void *)unint64_t v22 = &_swiftEmptySetSingleton;
            swift_bridgeObjectRelease();
            v25.receiver = v23;
            v25.super_class = ObjectType;
            return objc_msgSendSuper2(&v25, "dealloc");
          }
        }
      }
    }
LABEL_27:
    uint64_t v15 = (v19 - 1) & v19;
    unint64_t v16 = __clz(__rbit64(v19)) + (v17 << 6);
LABEL_28:
    uint64_t v21 = *(void *)(*(void *)(v6 + 48) + 8 * v16);
    swift_retain();
    if (!v21) {
      goto LABEL_31;
    }
    while (1)
    {
      sub_2EF10();
      id result = (id)swift_release();
      uint64_t v9 = v17;
      unint64_t v10 = v15;
      if ((v6 & 0x8000000000000000) == 0) {
        break;
      }
LABEL_11:
      if (sub_2F900())
      {
        sub_2EF20();
        swift_unknownObjectRetain();
        swift_dynamicCast();
        swift_unknownObjectRelease();
        uint64_t v17 = v9;
        uint64_t v15 = v10;
        if (v24) {
          continue;
        }
      }
      goto LABEL_31;
    }
  }
  __break(1u);
LABEL_33:
  __break(1u);
  return result;
}

uint64_t sub_207B8()
{
  return type metadata accessor for AppsSettingsListViewModel();
}

uint64_t type metadata accessor for AppsSettingsListViewModel()
{
  uint64_t result = qword_3D668;
  if (!qword_3D668) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_2080C()
{
  sub_20A08(319, &qword_3D678, (void (*)(uint64_t))&type metadata accessor for AppendSettingsNavigationPathAction);
  if (v0 <= 0x3F)
  {
    sub_20A08(319, &qword_3D680, (void (*)(uint64_t))&type metadata accessor for ClearSettingsNavigationPathAction);
    if (v1 <= 0x3F)
    {
      sub_20A08(319, &qword_3D688, (void (*)(uint64_t))&type metadata accessor for URL);
      if (v2 <= 0x3F)
      {
        sub_2EDC0();
        if (v3 <= 0x3F) {
          swift_updateClassMetadata2();
        }
      }
    }
  }
}

void sub_20A08(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_2F800();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_20A5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[43] = a8;
  v8[44] = v12;
  v8[41] = a6;
  v8[42] = a7;
  v8[39] = a4;
  v8[40] = a5;
  uint64_t v9 = sub_2ED40();
  v8[45] = v9;
  v8[46] = *(void *)(v9 - 8);
  v8[47] = swift_task_alloc();
  return _swift_task_switch(sub_20B58, 0, 0);
}

uint64_t sub_20B58()
{
  id v1 = [self hiddenApplications];
  sub_2F6F0();
  unint64_t v2 = sub_2F600();

  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_2F9D0();
    swift_bridgeObjectRelease();
    if (v3) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  uint64_t v3 = *(void *)((char *)&dword_10 + (v2 & 0xFFFFFFFFFFFFFF8));
  if (!v3) {
    goto LABEL_13;
  }
LABEL_3:
  sub_2B430(0, v3 & ~(v3 >> 63), 0);
  if (v3 < 0) {
    __break(1u);
  }
  uint64_t v16 = v0;
  uint64_t v4 = 0;
  do
  {
    if ((v2 & 0xC000000000000001) != 0) {
      id v5 = (id)sub_2F990();
    }
    else {
      id v5 = *(id *)(v2 + 8 * v4 + 32);
    }
    uint64_t v6 = v5;
    id v7 = objc_msgSend(v5, "bundleIdentifier", v16);
    uint64_t v8 = sub_2F5B0();
    uint64_t v10 = v9;

    unint64_t v12 = _swiftEmptyArrayStorage[2];
    unint64_t v11 = _swiftEmptyArrayStorage[3];
    if (v12 >= v11 >> 1) {
      sub_2B430(v11 > 1, v12 + 1, 1);
    }
    ++v4;
    _swiftEmptyArrayStorage[2] = v12 + 1;
    uint64_t v13 = &_swiftEmptyArrayStorage[2 * v12];
    v13[4] = v8;
    v13[5] = v10;
  }
  while (v3 != v4);
  swift_bridgeObjectRelease();
  uint64_t v0 = v16;
LABEL_14:
  *(void *)(v0 + 384) = sub_2DE44((uint64_t)_swiftEmptyArrayStorage);
  swift_bridgeObjectRelease();
  int64_t v14 = (void *)swift_task_alloc();
  *(void *)(v0 + 392) = v14;
  *int64_t v14 = v0;
  v14[1] = sub_20DC0;
  return static AppDistributor.shouldShowAppInstallationSettings()();
}

uint64_t sub_20DC0(char a1)
{
  *(unsigned char *)(*(void *)v1 + 720) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_20EEC, 0, 0);
}

uint64_t sub_20EEC()
{
  uint64_t v204 = (_OWORD *)(v0 + 104);
  int64_t v1 = *(void *)(*(void *)(v0 + 312) + 16);
  if (v1)
  {
    sub_2B450(0, v1, 0);
    unint64_t v2 = _swiftEmptyArrayStorage;
    unint64_t v3 = _swiftEmptyArrayStorage[2];
    do
    {
      uint64_t v207 = v2;
      unint64_t v4 = v2[3];
      if (v3 >= v4 >> 1)
      {
        sub_2B450(v4 > 1, v3 + 1, 1);
        unint64_t v2 = v207;
      }
      v2[2] = v3 + 1;
      v2[v3++ + 4] = _swiftEmptyArrayStorage;
      --v1;
    }
    while (v1);
    uint64_t v198 = v2;
  }
  else
  {
    uint64_t v198 = _swiftEmptyArrayStorage;
  }
  uint64_t v5 = *(void *)(v0 + 320);
  uint64_t v6 = swift_allocObject();
  *(void *)(v0 + 400) = v6;
  *(void *)(v6 + 16) = &_swiftEmptySetSingleton;
  id v7 = [self enumeratorWithOptions:192];
  *(void *)(v0 + 408) = v7;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v5;
  *(void *)(v8 + 24) = v6;
  *(void *)(v0 + 48) = sub_2DF54;
  *(void *)(v0 + 56) = v8;
  *(void *)(v0 + 16) = _NSConcreteStackBlock;
  *(void *)(v0 + 24) = 1107296256;
  *(void *)(v0 + 32) = sub_26BE4;
  *(void *)(v0 + 40) = &unk_3A518;
  uint64_t v9 = _Block_copy((const void *)(v0 + 16));
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  [v7 setFilter:v9];
  _Block_release(v9);
  id v10 = v7;
  sub_2F6E0();

  sub_2AFF8(&qword_3D808, (void (*)(uint64_t))&type metadata accessor for NSFastEnumerationIterator);
  unint64_t v11 = (_OWORD *)(v0 + 104);
  sub_2F810();
  uint64_t v12 = (uint64_t)_swiftEmptyArrayStorage;
  uint64_t v199 = (void *)v0;
  if (*(void *)(v0 + 128))
  {
    uint64_t v13 = (_OWORD *)(v0 + 136);
    uint64_t v14 = v0 + 200;
    uint64_t v15 = (id *)(v0 + 304);
    do
    {
      sub_2D7D4(v11, v13);
      sub_2D83C((uint64_t)v13, v14);
      sub_2DF68(0, &qword_3D830);
      if (swift_dynamicCast()
        && (id v16 = *v15,
            id v17 = [*v15 bundleIdentifier],
            v16,
            v17))
      {
        uint64_t v18 = sub_2F5B0();
        uint64_t v20 = v19;

        sub_2D7EC((uint64_t)v13);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v12 = (uint64_t)sub_290DC(0, *(void *)(v12 + 16) + 1, 1, (void *)v12);
        }
        unint64_t v22 = *(void *)(v12 + 16);
        unint64_t v21 = *(void *)(v12 + 24);
        if (v22 >= v21 >> 1) {
          uint64_t v12 = (uint64_t)sub_290DC((void *)(v21 > 1), v22 + 1, 1, (void *)v12);
        }
        *(void *)(v12 + 16) = v22 + 1;
        uint64_t v23 = v12 + 16 * v22;
        *(void *)(v23 + 32) = v18;
        *(void *)(v23 + 40) = v20;
        unint64_t v0 = (unint64_t)v199;
        unint64_t v11 = v204;
      }
      else
      {
        sub_2D7EC((uint64_t)v13);
      }
      sub_2F810();
    }
    while (*(void *)(v0 + 128));
  }
  (*(void (**)(void, void))(*(void *)(v0 + 368) + 8))(*(void *)(v0 + 376), *(void *)(v0 + 360));
  uint64_t v197 = sub_2DE44(v12);
  *(void *)(v0 + 416) = v197;
  swift_bridgeObjectRelease();
  id v24 = [self currentNotificationSettingsCenter];
  swift_beginAccess();
  swift_bridgeObjectRetain();
  Class isa = sub_2F680().super.isa;
  swift_bridgeObjectRelease();
  id v26 = [v24 notificationSourcesWithIdentifiers:isa];

  uint64_t v27 = (uint64_t)UNNotificationSource_ptr;
  sub_2DF68(0, &qword_3D810);
  sub_2D910(&qword_3D818, &qword_3D810);
  uint64_t v28 = sub_2F6A0();

  unint64_t v205 = v28 & 0xC000000000000001;
  if ((v28 & 0xC000000000000001) != 0)
  {
    uint64_t v29 = sub_2F8E0();
    if (v29) {
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v29 = *(void *)(v28 + 16);
    if (v29)
    {
LABEL_21:
      sub_2B430(0, v29 & ~(v29 >> 63), 0);
      if (v205)
      {
        uint64_t v30 = sub_2F890();
        char v32 = 1;
      }
      else
      {
        uint64_t v30 = sub_2CC04(v28);
        char v32 = v33 & 1;
      }
      uint64_t v208 = v30;
      uint64_t v210 = v31;
      unsigned __int8 v211 = v32;
      if (v29 < 0) {
        goto LABEL_206;
      }
      uint64_t v34 = (void *)(v0 + 168);
      uint64_t v202 = v28;
      do
      {
        while (1)
        {
          uint64_t v27 = v211;
          sub_2C98C(v208, v210, v211, v28);
          uint64_t v40 = v39;
          id v41 = [v39 sourceIdentifier];
          uint64_t v42 = sub_2F5B0();
          uint64_t v12 = v43;

          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            sub_2B430(0, _swiftEmptyArrayStorage[2] + 1, 1);
          }
          unint64_t v45 = _swiftEmptyArrayStorage[2];
          unint64_t v44 = _swiftEmptyArrayStorage[3];
          if (v45 >= v44 >> 1) {
            sub_2B430(v44 > 1, v45 + 1, 1);
          }
          _swiftEmptyArrayStorage[2] = v45 + 1;
          uint64_t v46 = &_swiftEmptyArrayStorage[2 * v45];
          v46[4] = v42;
          v46[5] = v12;
          if (v205) {
            break;
          }
          uint64_t v28 = v202;
          int64_t v35 = sub_2C8A8(v208, v210, v211, v202);
          uint64_t v37 = v36;
          uint64_t v12 = v38;
          sub_2DF5C(v208, v210, v211);
          uint64_t v208 = v35;
          uint64_t v210 = v37;
          unsigned __int8 v211 = v12 & 1;
          if (!--v29) {
            goto LABEL_38;
          }
        }
        uint64_t v28 = v202;
        if ((v211 & 1) == 0)
        {
          __break(1u);
LABEL_211:
          __break(1u);
        }
        if (sub_2F8B0()) {
          swift_isUniquelyReferenced_nonNull_native();
        }
        sub_5250(&qword_3D820);
        uint64_t v47 = (void (*)(void *, void))sub_2F6C0();
        sub_2F910();
        v47(v34, 0);
        --v29;
      }
      while (v29);
LABEL_38:
      sub_2DF5C(v208, v210, v211);
      swift_bridgeObjectRelease();
      unint64_t v0 = (unint64_t)v199;
      goto LABEL_39;
    }
  }
  swift_bridgeObjectRelease();
LABEL_39:
  v206 = (void *)(v0 + 296);
  uint64_t v48 = (void *)(v0 + 720);
  uint64_t v194 = (_OWORD *)(v0 + 64);
  v195 = (void *)(v0 + 264);
  v192 = (void **)(v0 + 256);
  uint64_t v193 = (void **)(v0 + 288);
  *(void *)(v0 + 424) = sub_2DE44((uint64_t)_swiftEmptyArrayStorage);
  swift_bridgeObjectRelease();
  char v49 = *(unsigned char *)(v197 + 32);
  *(unsigned char *)(v0 + 721) = v49;
  uint64_t v50 = 1 << v49;
  if (v50 < 64) {
    uint64_t v51 = ~(-1 << v50);
  }
  else {
    uint64_t v51 = -1;
  }
  unint64_t v52 = v51 & *(void *)(v197 + 56);
  *(void *)(v0 + 432) = MCFeatureAccountModificationAllowed;
  *(void *)(v0 + 528) = v198;
  swift_bridgeObjectRetain();
  uint64_t v53 = 0;
  char v54 = 0;
  uint64_t v196 = (unsigned __int8 *)(v0 + 720);
LABEL_43:
  char v200 = v54;
  *((unsigned char *)v48 + 2) = v54 & 1;
  while (1)
  {
    *(void *)(v0 + 440) = 0;
    if (v52)
    {
      unint64_t v55 = __clz(__rbit64(v52));
      v52 &= v52 - 1;
      unint64_t v56 = v55 | (v53 << 6);
      uint64_t v57 = *(void *)(v0 + 416);
      goto LABEL_59;
    }
    BOOL v58 = __OFADD__(v53++, 1);
    if (v58)
    {
      __break(1u);
      goto LABEL_204;
    }
    int64_t v59 = (unint64_t)((1 << *(unsigned char *)(v0 + 721)) + 63) >> 6;
    uint64_t v57 = *(void *)(v0 + 416);
    if (v53 >= v59) {
      goto LABEL_98;
    }
    uint64_t v60 = v57 + 56;
    unint64_t v61 = *(void *)(v57 + 56 + 8 * v53);
    if (!v61) {
      break;
    }
LABEL_58:
    unint64_t v52 = (v61 - 1) & v61;
    unint64_t v56 = __clz(__rbit64(v61)) + (v53 << 6);
LABEL_59:
    *(void *)(v0 + 448) = v53;
    *(void *)(v0 + 456) = v52;
    uint64_t v63 = (uint64_t *)(*(void *)(v57 + 48) + 16 * v56);
    uint64_t v29 = *v63;
    *(void *)(v0 + 464) = *v63;
    uint64_t v12 = v63[1];
    *(void *)(v0 + 472) = v12;
    uint64_t v64 = qword_3CC60;
    swift_bridgeObjectRetain();
    if (v64 != -1) {
      swift_once();
    }
    char v65 = off_3D5C0;
    if (!*(void *)((char *)&dword_10 + (void)off_3D5C0)) {
      goto LABEL_81;
    }
    sub_2FA80();
    sub_2F5C0();
    Swift::Int v66 = sub_2FAA0();
    uint64_t v67 = -1 << *((unsigned char *)&stru_20.cmd + (void)v65);
    unint64_t v68 = v66 & ~v67;
    BOOL v69 = v65 + 14;
    if (((*(void *)((char *)v65 + ((v68 >> 3) & 0xFFFFFFFFFFFFFF8) + 56) >> v68) & 1) == 0) {
      goto LABEL_81;
    }
    uint64_t v70 = *(void *)&stru_20.segname[(void)v65 + 8];
    char v71 = (void *)(v70 + 16 * v68);
    BOOL v72 = *v71 == v29 && v71[1] == v12;
    if (v72 || (sub_2FA30() & 1) != 0) {
      goto LABEL_75;
    }
    uint64_t v73 = ~v67;
    unint64_t v74 = (v68 + 1) & v73;
    if (((*(void *)((char *)v69 + ((v74 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v74) & 1) == 0)
    {
      unint64_t v0 = (unint64_t)v199;
      goto LABEL_81;
    }
    char v75 = (void *)(v70 + 16 * v74);
    BOOL v76 = *v75 == v29 && v75[1] == v12;
    if (v76 || (sub_2FA30() & 1) != 0)
    {
      unint64_t v0 = (unint64_t)v199;
      goto LABEL_75;
    }
    unint64_t v90 = (v74 + 1) & v73;
    unint64_t v0 = (unint64_t)v199;
    if ((*(void *)((char *)v69 + ((v90 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v90))
    {
      while (1)
      {
        uint64_t v91 = (void *)(v70 + 16 * v90);
        BOOL v92 = *v91 == v29 && v91[1] == v12;
        if (v92 || (sub_2FA30() & 1) != 0) {
          break;
        }
        unint64_t v90 = (v90 + 1) & v73;
        if (((*(void *)((char *)v69 + ((v90 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v90) & 1) == 0) {
          goto LABEL_81;
        }
      }
LABEL_75:
      swift_bridgeObjectRelease();
    }
    else
    {
LABEL_81:
      swift_bridgeObjectRetain();
      v213._countAndFlagsBits = 0xD00000000000001BLL;
      v213._object = (void *)0x8000000000032570;
      BOOL v77 = sub_2F5F0(v213);
      id v78 = objc_allocWithZone((Class)LSApplicationRecord);
      NSString v79 = sub_2F5A0();
      swift_bridgeObjectRelease();
      *(void *)(v0 + 296) = 0;
      id v80 = [v78 initWithBundleIdentifier:v79 allowPlaceholder:v77 error:v206];
      *(void *)(v0 + 480) = v80;

      uint64_t v81 = *(void **)(v0 + 296);
      if (v80)
      {
        id v82 = v81;
        if (([v80 isWebApp] & 1) == 0
          || (sub_263F4(v29, v12, *(void *)(v0 + 424)) & 1) != 0)
        {
          id v83 = [self defaultWorkspace];
          if (!v83) {
            goto LABEL_211;
          }
          uint64_t v84 = v83;
          NSString v85 = sub_2F5A0();
          unsigned __int8 v86 = [v84 applicationIsInstalled:v85];

          if (v86)
          {
            if ((v200 & 1) == 0)
            {
              id v87 = [v80 appClipMetadata];

              if (v87)
              {
                swift_bridgeObjectRelease();

                char v54 = 1;
                uint64_t v48 = v196;
                goto LABEL_43;
              }
            }
            if ((sub_263F4(v29, v12, *(void *)(v0 + 384)) & 1) == 0)
            {
              id v166 = [v80 localizedName];
              uint64_t v167 = sub_2F5B0();
              uint64_t v169 = v168;

              v199[61] = v167;
              v199[62] = v169;
              v199[63] = "localizedName";
              sub_2F640();
              id v170 = v80;
              v199[64] = sub_2F630();
              uint64_t v96 = sub_2F620();
              unint64_t v98 = sub_22AB8;
              goto LABEL_198;
            }
          }
        }
        swift_bridgeObjectRelease();
      }
      else
      {
        id v88 = v81;
        uint64_t v89 = sub_2ED10();

        uint64_t v27 = v89;
        swift_willThrow();
        swift_bridgeObjectRelease();
        swift_errorRelease();
      }
    }
  }
  uint64_t v62 = v53 + 1;
  if (v53 + 1 >= v59) {
    goto LABEL_98;
  }
  unint64_t v61 = *(void *)(v60 + 8 * v62);
  if (v61) {
    goto LABEL_57;
  }
  uint64_t v62 = v53 + 2;
  if (v53 + 2 >= v59) {
    goto LABEL_98;
  }
  unint64_t v61 = *(void *)(v60 + 8 * v62);
  if (v61)
  {
LABEL_57:
    uint64_t v53 = v62;
    goto LABEL_58;
  }
  uint64_t v62 = v53 + 3;
  if (v53 + 3 < v59)
  {
    unint64_t v61 = *(void *)(v60 + 8 * v62);
    if (!v61)
    {
      while (1)
      {
        uint64_t v53 = v62 + 1;
        if (__OFADD__(v62, 1)) {
          break;
        }
        if (v53 >= v59) {
          goto LABEL_98;
        }
        unint64_t v61 = *(void *)(v60 + 8 * v53);
        ++v62;
        if (v61) {
          goto LABEL_58;
        }
      }
LABEL_204:
      __break(1u);
LABEL_205:
      __break(1u);
LABEL_206:
      __break(1u);
LABEL_207:
      swift_once();
LABEL_100:
      v94.super.Class isa = (Class)qword_3F080;
      v189._countAndFlagsBits = 0x80000000000318C0;
      v214._countAndFlagsBits = 1701670728;
      v214._object = (void *)0xE400000000000000;
      v221.value._countAndFlagsBits = 0;
      v221.value._object = 0;
      v228._countAndFlagsBits = 0;
      v228._object = (void *)0xE000000000000000;
      *(void *)(v0 + 536) = sub_2ED00(v214, v221, v94, v228, v189);
      *(void *)(v0 + 544) = v95;
      *(void *)(v0 + 552) = sub_2F5A0();
      *(void *)(v0 + 560) = "collationString";
      sub_2F640();
      *(void *)(v0 + 568) = sub_2F630();
      uint64_t v96 = sub_2F620();
      unint64_t v98 = sub_24190;
      goto LABEL_198;
    }
    goto LABEL_57;
  }
LABEL_98:
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v93 = *(void *)(v0 + 336);
  swift_bridgeObjectRelease();
  if (v93 == 1)
  {
    if (qword_3CC50 != -1) {
      goto LABEL_207;
    }
    goto LABEL_100;
  }
  id v99 = (id)MobileGestalt_get_current_device();
  if (!v99)
  {
    __break(1u);
    JUMPOUT(0x22A38);
  }
  uint64_t v100 = v99;
  char isSimulator = MobileGestalt_get_isSimulator();

  if (isSimulator)
  {
    swift_bridgeObjectRelease();
    uint64_t v102 = *(void *)(v0 + 440);
LABEL_104:
    *(void *)(v0 + 688) = v198;
    uint64_t v103 = *(void *)(v0 + 344);
    uint64_t v104 = *(void *)(v0 + 312);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v105 = sub_26C3C(v104, v103, (uint64_t)v198);
    *(void *)(v0 + 696) = v102;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(void *)(v0 + 264) = v105;
    if (qword_3CC50 != -1) {
      swift_once();
    }
    unint64_t v106 = qword_3F080;
    uint64_t v107 = (uint64_t)"ok";
    v189._countAndFlagsBits = 0x80000000000318C0;
    v215._countAndFlagsBits = 0x20746C7561666544;
    v215._object = (void *)0xEC00000073707041;
    v222.value._countAndFlagsBits = 0;
    v222.value._object = 0;
    v108.super.Class isa = (Class)qword_3F080;
    v229._countAndFlagsBits = 0;
    v229._object = (void *)0xE000000000000000;
    uint64_t v109 = sub_2ED00(v215, v222, v108, v229, v189);
    uint64_t v111 = v110;
    v216._countAndFlagsBits = 0xD00000000000001DLL;
    v190._countAndFlagsBits = 0x8000000000031D20;
    v216._object = (void *)0x80000000000325C0;
    v223.value._countAndFlagsBits = 0;
    v223.value._object = 0;
    v112.super.Class isa = (Class)v106;
    v230._countAndFlagsBits = 0;
    v230._object = (void *)0xE000000000000000;
    uint64_t v113 = sub_2ED00(v216, v223, v112, v230, v190);
    uint64_t v115 = v114;
    v209 = (char *)_swiftEmptyArrayStorage;
    sub_28CE0((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_28D88);
    uint64_t v116 = (char *)_swiftEmptyArrayStorage;
    unint64_t v118 = _swiftEmptyArrayStorage[2];
    unint64_t v117 = _swiftEmptyArrayStorage[3];
    if (v118 >= v117 >> 1)
    {
      uint64_t v116 = sub_28D88((char *)(v117 > 1), v118 + 1, 1, (char *)_swiftEmptyArrayStorage);
      v209 = v116;
    }
    int v119 = *v196;
    *((void *)v116 + 2) = v118 + 1;
    v120 = &v116[80 * v118];
    *((void *)v120 + 4) = 0;
    *((void *)v120 + 5) = 0;
    *((void *)v120 + 6) = 0xD000000000000023;
    *((void *)v120 + 7) = 0x8000000000032590;
    *((void *)v120 + 8) = 1;
    *((void *)v120 + 9) = v109;
    *((void *)v120 + 10) = v111;
    *((void *)v120 + 11) = v113;
    *((void *)v120 + 12) = v115;
    v120[104] = 0x80;
    if (v119 == 1)
    {
      v189._countAndFlagsBits = 0x80000000000318C0;
      v217._object = (void *)0x80000000000322A0;
      v217._countAndFlagsBits = 0xD000000000000010;
      v224.value._countAndFlagsBits = 0;
      v224.value._object = 0;
      v121.super.Class isa = (Class)v106;
      v231._countAndFlagsBits = 0;
      v231._object = (void *)0xE000000000000000;
      uint64_t v27 = sub_2ED00(v217, v224, v121, v231, v189);
      uint64_t v29 = v122;
      uint64_t v53 = 0xD000000000000010;
      v218._countAndFlagsBits = 0xD000000000000020;
      v191._countAndFlagsBits = 0x8000000000031D20;
      v218._object = (void *)0x8000000000032670;
      v225.value._countAndFlagsBits = 0;
      v225.value._object = 0;
      v123.super.Class isa = (Class)v106;
      v232._countAndFlagsBits = 0;
      v232._object = (void *)0xE000000000000000;
      unint64_t v52 = sub_2ED00(v218, v225, v123, v232, v191);
      uint64_t v12 = v124;
      sub_28CE0((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_28D88);
      uint64_t v116 = v209;
      unint64_t v0 = *((void *)v209 + 2);
      int64_t v125 = *((void *)v209 + 3);
      int64_t v126 = v0 + 1;
      if (v0 >= (unint64_t)v125 >> 1) {
        goto LABEL_209;
      }
      goto LABEL_110;
    }
    goto LABEL_111;
  }
  if (qword_3CC68 != -1) {
    swift_once();
  }
  uint64_t v146 = off_3D5C8;
  *(void *)(v0 + 584) = off_3D5C8;
  char v147 = *((unsigned char *)&stru_20.cmd + (void)v146);
  *(unsigned char *)(v0 + 723) = v147;
  uint64_t v148 = 1 << v147;
  if (v148 < 64) {
    uint64_t v149 = ~(-1 << v148);
  }
  else {
    uint64_t v149 = -1;
  }
  unint64_t v106 = v149 & *(void *)&stru_20.segname[(void)v146 + 16];
  uint64_t v201 = *(void *)(v0 + 440);
  *(void *)(v0 + 592) = v198;
  swift_bridgeObjectRetain();
  uint64_t v107 = 0;
  while (2)
  {
    if (v106)
    {
      unint64_t v150 = __clz(__rbit64(v106));
      v106 &= v106 - 1;
      unint64_t v151 = v150 | (v107 << 6);
      int64_t v126 = *(void *)(v0 + 584);
LABEL_136:
      *(void *)(v0 + 608) = v106;
      *(void *)(v0 + 600) = v107;
      uint64_t v155 = *(unsigned __int8 *)(*(void *)(v126 + 48) + v151);
      *(unsigned char *)(v0 + 724) = v155;
      uint64_t v12 = 0xD000000000000014;
      uint64_t v29 = 0x8000000000031510;
      char v203 = v155;
      switch(v155)
      {
        case 1:
          uint64_t v12 = 0xD00000000000001BLL;
          uint64_t v156 = "com.apple.MobileAddressBook";
          goto LABEL_175;
        case 2:
          uint64_t v12 = 0xD000000000000013;
          uint64_t v156 = "com.apple.mobilecal";
          goto LABEL_175;
        case 3:
          uint64_t v12 = 0xD000000000000015;
          uint64_t v156 = "com.apple.mobilenotes";
          goto LABEL_175;
        case 4:
          uint64_t v12 = 0xD000000000000013;
          uint64_t v156 = "com.apple.reminders";
          goto LABEL_175;
        case 5:
          uint64_t v12 = 0xD000000000000012;
          uint64_t v156 = "com.apple.freeform";
          goto LABEL_175;
        case 6:
          uint64_t v12 = 0xD000000000000014;
          uint64_t v156 = "com.apple.VoiceMemos";
          goto LABEL_175;
        case 7:
          uint64_t v12 = 0xD000000000000015;
          uint64_t v156 = "com.apple.mobilephone";
          goto LABEL_175;
        case 8:
          uint64_t v12 = 0xD000000000000013;
          uint64_t v156 = "com.apple.MobileSMS";
          goto LABEL_175;
        case 9:
          uint64_t v12 = 0xD000000000000012;
          uint64_t v156 = "com.apple.facetime";
          goto LABEL_175;
        case 10:
          uint64_t v12 = 0xD000000000000016;
          uint64_t v156 = "com.apple.mobilesafari";
          goto LABEL_175;
        case 11:
          uint64_t v157 = 0x7377656E2E65;
          goto LABEL_162;
        case 12:
          uint64_t v158 = "com.apple.stocks";
          goto LABEL_170;
        case 13:
          uint64_t v12 = 0xD000000000000011;
          uint64_t v156 = "com.apple.weather";
          goto LABEL_175;
        case 14:
          uint64_t v12 = 0xD000000000000013;
          uint64_t v156 = "com.apple.Translate";
          goto LABEL_175;
        case 15:
          uint64_t v157 = 0x7370614D2E65;
          goto LABEL_162;
        case 16:
          uint64_t v12 = 0xD000000000000011;
          uint64_t v156 = "com.apple.compass";
          goto LABEL_175;
        case 17:
          uint64_t v12 = 0xD000000000000011;
          uint64_t v156 = "com.apple.measure";
          goto LABEL_175;
        case 18:
          uint64_t v12 = 0xD000000000000013;
          uint64_t v156 = "com.apple.shortcuts";
          goto LABEL_175;
        case 19:
          uint64_t v158 = "com.apple.Health";
          goto LABEL_170;
        case 20:
          uint64_t v12 = 0xD000000000000011;
          uint64_t v156 = "com.apple.Fitness";
          goto LABEL_175;
        case 21:
          uint64_t v157 = 0x656D6F482E65;
LABEL_162:
          uint64_t v29 = v157 & 0xFFFFFFFFFFFFLL | 0xEE00000000000000;
          goto LABEL_166;
        case 22:
          uint64_t v12 = 0xD000000000000011;
          uint64_t v156 = "com.apple.journal";
          goto LABEL_175;
        case 23:
          uint64_t v29 = 0xEF636973754D2E65;
          goto LABEL_166;
        case 24:
          uint64_t v29 = 0xEC00000076742E65;
LABEL_166:
          uint64_t v12 = 0x6C7070612E6D6F63;
          break;
        case 25:
          uint64_t v12 = 0xD000000000000019;
          uint64_t v156 = "com.apple.mobileslideshow";
          goto LABEL_175;
        case 26:
          uint64_t v158 = "com.apple.camera";
          goto LABEL_170;
        case 27:
          uint64_t v158 = "com.apple.iBooks";
LABEL_170:
          uint64_t v29 = (unint64_t)(v158 - 32) | 0x8000000000000000;
          uint64_t v12 = 0xD000000000000010;
          break;
        case 28:
          uint64_t v12 = 0xD000000000000012;
          uint64_t v156 = "com.apple.podcasts";
          goto LABEL_175;
        case 29:
          uint64_t v12 = 0xD000000000000013;
          uint64_t v156 = "com.apple.Passwords";
          goto LABEL_175;
        case 30:
          uint64_t v12 = 0xD000000000000012;
          uint64_t v156 = "com.apple.AppStore";
          goto LABEL_175;
        case 31:
          uint64_t v12 = 0xD000000000000012;
          uint64_t v156 = "com.apple.Passbook";
LABEL_175:
          uint64_t v29 = (unint64_t)(v156 - 32) | 0x8000000000000000;
          break;
        default:
          break;
      }
      unint64_t v52 = *(void *)(v0 + 416);
      if (!*(void *)(v52 + 16)) {
        goto LABEL_192;
      }
      sub_2FA80();
      sub_2F5C0();
      Swift::Int v159 = sub_2FAA0();
      uint64_t v53 = -1 << *(unsigned char *)(v52 + 32);
      unint64_t v160 = v159 & ~v53;
      if (((*(void *)(v52 + ((v160 >> 3) & 0xFFFFFFFFFFFFFF8) + 56) >> v160) & 1) == 0) {
        goto LABEL_192;
      }
      uint64_t v161 = *(void *)(*(void *)(v0 + 416) + 48);
      uint64_t v162 = (void *)(v161 + 16 * v160);
      BOOL v163 = *v162 == v12 && v162[1] == v29;
      if (!v163 && (sub_2FA30() & 1) == 0)
      {
        uint64_t v53 = ~v53;
        while (1)
        {
          unint64_t v160 = (v160 + 1) & v53;
          if (((*(void *)(*(void *)(v0 + 416) + ((v160 >> 3) & 0xFFFFFFFFFFFFFF8) + 56) >> v160) & 1) == 0) {
            break;
          }
          uint64_t v164 = (void *)(v161 + 16 * v160);
          BOOL v165 = *v164 == v12 && v164[1] == v29;
          if (v165 || (sub_2FA30() & 1) != 0) {
            goto LABEL_122;
          }
        }
LABEL_192:
        swift_bridgeObjectRelease();
        unint64_t v171 = sub_9B20(v203);
        uint64_t v173 = v172;
        id v174 = objc_allocWithZone((Class)LSApplicationRecord);
        swift_bridgeObjectRetain();
        NSString v175 = sub_2F5A0();
        swift_bridgeObjectRelease();
        *uint64_t v193 = 0;
        id v176 = [v174 initWithBundleIdentifier:v175 allowPlaceholder:1 error:v193];

        uint64_t v177 = *v193;
        if (v176)
        {
          uint64_t v178 = v201;
          goto LABEL_196;
        }
        id v179 = v177;
        sub_2ED10();

        swift_willThrow();
        swift_errorRelease();
        id v180 = objc_allocWithZone((Class)LSApplicationRecord);
        swift_bridgeObjectRetain();
        NSString v181 = sub_2F5A0();
        swift_bridgeObjectRelease();
        char *v192 = 0;
        id v176 = [v180 initWithBundleIdentifierOfSystemPlaceholder:v181 error:v192];

        uint64_t v177 = *v192;
        if (v176)
        {
          uint64_t v178 = 0;
LABEL_196:
          id v182 = v177;
          id v183 = [v176 localizedName];
          unint64_t v171 = sub_2F5B0();
          uint64_t v185 = v184;
          swift_bridgeObjectRelease();

          uint64_t v173 = v185;
        }
        else
        {
          id v187 = v177;
          sub_2ED10();

          swift_willThrow();
          swift_errorRelease();
          uint64_t v178 = 0;
        }
        *(void *)(v0 + 632) = v173;
        *(void *)(v0 + 624) = v171;
        *(void *)(v0 + 616) = v178;
        *(void *)(v0 + 640) = sub_9B20(v203);
        *(void *)(v0 + 648) = v186;
        *(void *)(v0 + 656) = sub_2F5A0();
        *(void *)(v0 + 664) = "collationString";
        sub_2F640();
        *(void *)(v0 + 672) = sub_2F630();
        uint64_t v96 = sub_2F620();
        unint64_t v98 = sub_251A8;
        goto LABEL_198;
      }
LABEL_122:
      swift_bridgeObjectRelease();
      continue;
    }
    break;
  }
  BOOL v58 = __OFADD__(v107++, 1);
  if (v58) {
    goto LABEL_205;
  }
  int64_t v125 = (unint64_t)((1 << *(unsigned char *)(v0 + 723)) + 63) >> 6;
  int64_t v126 = *(void *)(v0 + 584);
  if (v107 >= v125)
  {
LABEL_201:
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v102 = v201;
    goto LABEL_104;
  }
  int64_t v152 = v126 + 56;
  unint64_t v153 = *(void *)(v126 + 56 + 8 * v107);
  if (v153)
  {
LABEL_135:
    unint64_t v106 = (v153 - 1) & v153;
    unint64_t v151 = __clz(__rbit64(v153)) + (v107 << 6);
    goto LABEL_136;
  }
  uint64_t v154 = v107 + 1;
  if (v107 + 1 >= v125) {
    goto LABEL_201;
  }
  unint64_t v153 = *(void *)(v152 + 8 * v154);
  if (v153) {
    goto LABEL_134;
  }
  uint64_t v154 = v107 + 2;
  if (v107 + 2 >= v125) {
    goto LABEL_201;
  }
  unint64_t v153 = *(void *)(v152 + 8 * v154);
  if (v153) {
    goto LABEL_134;
  }
  uint64_t v154 = v107 + 3;
  if (v107 + 3 >= v125) {
    goto LABEL_201;
  }
  unint64_t v153 = *(void *)(v152 + 8 * v154);
  if (v153)
  {
LABEL_134:
    uint64_t v107 = v154;
    goto LABEL_135;
  }
  while (1)
  {
    uint64_t v107 = v154 + 1;
    if (__OFADD__(v154, 1)) {
      break;
    }
    if (v107 >= v125) {
      goto LABEL_201;
    }
    unint64_t v153 = *(void *)(v152 + 8 * v107);
    ++v154;
    if (v153) {
      goto LABEL_135;
    }
  }
  __break(1u);
LABEL_209:
  uint64_t v116 = sub_28D88((char *)((unint64_t)v125 > 1), v126, 1, v116);
LABEL_110:
  *((void *)v116 + 2) = v126;
  uint64_t v127 = &v116[80 * v0];
  *((_OWORD *)v127 + 2) = xmmword_31270;
  *((void *)v127 + 6) = v53 + 23;
  *((void *)v127 + 7) = 0x8000000000032640;
  *((void *)v127 + 8) = 1;
  *((void *)v127 + 9) = v27;
  *((void *)v127 + 10) = v29;
  *((void *)v127 + 11) = v52;
  *((void *)v127 + 12) = v12;
  v127[104] = 0x80;
LABEL_111:
  unsigned __int8 v128 = v196[2];
  *uint64_t v194 = 0u;
  v194[1] = 0u;
  v199[12] = v116;
  sub_2BC14(0, 0, (uint64_t)v194);
  if (v128)
  {
    v189._countAndFlagsBits = v107 | 0x8000000000000000;
    v219._countAndFlagsBits = 0x70696C4320707041;
    v219._object = (void *)0xE900000000000073;
    v226.value._countAndFlagsBits = 0;
    v226.value._object = 0;
    v129.super.Class isa = (Class)v106;
    v233._countAndFlagsBits = 0;
    v233._object = (void *)0xE000000000000000;
    uint64_t v130 = sub_2ED00(v219, v226, v129, v233, v189);
    uint64_t v132 = v131;
    sub_5250(&qword_3D828);
    uint64_t v133 = swift_allocObject();
    *(_OWORD *)(v133 + 16) = xmmword_31280;
    *(_OWORD *)(v133 + 32) = xmmword_31290;
    *(void *)(v133 + 48) = 0xD000000000000020;
    *(void *)(v133 + 56) = 0x8000000000032610;
    *(void *)(v133 + 64) = 1;
    *(void *)(v133 + 72) = v130;
    *(void *)(v133 + 88) = 0;
    *(void *)(v133 + 96) = 0;
    *(void *)(v133 + 80) = v132;
    *(unsigned char *)(v133 + 104) = 0;
    sub_28CE0((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_28EA8);
    BOOL v134 = (void *)*v195;
    unint64_t v136 = *(void *)(*v195 + 16);
    unint64_t v135 = *(void *)(*v195 + 24);
    if (v136 >= v135 >> 1)
    {
      BOOL v134 = sub_28EA8((void *)(v135 > 1), v136 + 1, 1, v134);
      void *v195 = v134;
    }
    v134[2] = v136 + 1;
    uint64_t v137 = &v134[5 * v136];
    *((_OWORD *)v137 + 2) = xmmword_31270;
    v137[6] = 0;
    v137[7] = 0;
    v137[8] = v133;
  }
  v189._countAndFlagsBits = v107 | 0x8000000000000000;
  v220._countAndFlagsBits = 0x41206E6564646948;
  v220._object = (void *)0xEB00000000737070;
  v227.value._countAndFlagsBits = 0;
  v227.value._object = 0;
  v138.super.Class isa = (Class)v106;
  v234._countAndFlagsBits = 0;
  v234._object = (void *)0xE000000000000000;
  uint64_t v139 = sub_2ED00(v220, v227, v138, v234, v189);
  uint64_t v141 = v140;
  sub_5250(&qword_3D828);
  uint64_t v142 = swift_allocObject();
  *(_OWORD *)(v142 + 16) = xmmword_31280;
  *(_OWORD *)(v142 + 32) = xmmword_312A0;
  *(void *)(v142 + 48) = 0xD000000000000022;
  *(void *)(v142 + 56) = 0x80000000000325E0;
  *(void *)(v142 + 64) = 1;
  *(void *)(v142 + 72) = v139;
  *(void *)(v142 + 88) = 0;
  *(void *)(v142 + 96) = 0;
  *(void *)(v142 + 80) = v141;
  *(unsigned char *)(v142 + 104) = 0;
  sub_28CE0((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_28EA8);
  uint64_t v143 = *(void *)(v199[33] + 16);
  sub_28D3C(v143, (uint64_t (*)(BOOL))sub_28EA8);
  uint64_t v144 = v199[33];
  v199[88] = v144;
  *(void *)(v144 + 16) = v143 + 1;
  uint64_t v145 = v144 + 40 * v143;
  *(_OWORD *)(v145 + 32) = xmmword_31290;
  *(void *)(v145 + 48) = 0;
  *(void *)(v145 + 56) = 0;
  *(void *)(v145 + 64) = v142;
  swift_unknownObjectWeakInit();
  sub_2F640();
  swift_bridgeObjectRetain();
  v199[89] = sub_2F630();
  uint64_t v96 = sub_2F620();
  unint64_t v98 = sub_26144;
LABEL_198:
  return _swift_task_switch(v98, v96, v97);
}

uint64_t sub_22AB8()
{
  uint64_t v1 = v0[63];
  unint64_t v2 = (void *)v0[60];
  unint64_t v3 = (void *)v0[41];
  swift_release();
  v0[65] = [v3 sectionForObject:v2 collationStringSelector:v1];

  return _swift_task_switch(sub_22B7C, 0, 0);
}

uint64_t sub_22B7C()
{
  uint64_t v2 = (uint64_t)v0;
  if (v0[58] == 0xD000000000000012 && v0[59] == 0x8000000000031630 || (LODWORD(v3) = 0, (sub_2FA30() & 1) != 0))
  {
    id v4 = [self sharedConnection];
    if (!v4)
    {
      __break(1u);
      goto LABEL_176;
    }
    uint64_t v5 = v4;
    unsigned int v6 = [v4 BOOLRestrictionForFeature:v0[54]];

    LODWORD(v3) = v6 == 2;
  }
  id v7 = (unsigned __int8 *)v0[62];
  uint64_t v8 = *(void *)(v2 + 472);
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v10 = *(void *)(v2 + 528);
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    goto LABEL_167;
  }
  unint64_t v11 = *(void *)(v2 + 520);
  if ((v11 & 0x8000000000000000) != 0)
  {
LABEL_168:
    __break(1u);
LABEL_169:
    __break(1u);
LABEL_170:
    __break(1u);
    goto LABEL_171;
  }
  while (2)
  {
    if (*(void *)(v10 + 16) <= v11) {
      goto LABEL_169;
    }
    uint64_t v158 = v3;
    uint64_t v160 = v2 + 296;
    uint64_t v155 = v7;
    id v7 = (unsigned __int8 *)(v2 + 720);
    int64_t v152 = (_OWORD *)(v2 + 64);
    uint64_t v153 = v2 + 264;
    unint64_t v150 = (void **)(v2 + 256);
    unint64_t v151 = (void **)(v2 + 288);
    uint64_t v12 = *(void **)(v2 + 480);
    uint64_t v13 = *(void *)(v2 + 488);
    uint64_t v14 = *(void *)(v2 + 464);
    uint64_t v162 = (void *)v2;
    unint64_t v15 = v10 + 8 * v11;
    unint64_t v3 = sub_28D88;
    sub_28CE0((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_28D88);
    uint64_t v2 = *(void *)(*(void *)(v15 + 32) + 16);
    sub_28D3C(v2, (uint64_t (*)(BOOL))sub_28D88);
    uint64_t v16 = *(void *)(v15 + 32);
    uint64_t v1 = v162;
    *(void *)(v16 + 16) = v2 + 1;
    uint64_t v17 = v16 + 80 * v2;
    *(void *)(v17 + 32) = v14;
    *(void *)(v17 + 40) = v8;
    *(void *)(v17 + 48) = v14;
    *(void *)(v17 + 56) = v8;
    *(void *)(v17 + 64) = 0;
    *(void *)(v17 + 72) = v13;
    *(void *)(v17 + 80) = v155;
    *(void *)(v17 + 88) = v158;
    *(void *)(v17 + 96) = 0;
    *(unsigned char *)(v17 + 104) = 0;

    uint64_t v19 = v162[56];
    uint64_t v18 = v162[57];
    char v20 = v7[2];
    uint64_t v8 = v162[55];
    uint64_t v154 = v10;
    v162[66] = v10;
LABEL_10:
    char v156 = v20;
    _OWORD v7[2] = v20 & 1;
    while (1)
    {
      v1[55] = v8;
      if (!v18) {
        break;
      }
      unint64_t v21 = __clz(__rbit64(v18));
      v18 &= v18 - 1;
      unint64_t v22 = v21 | (v19 << 6);
      uint64_t v23 = v1[52];
LABEL_25:
      v1[56] = v19;
      v1[57] = v18;
      uint64_t v29 = (uint64_t *)(*(void *)(v23 + 48) + 16 * v22);
      uint64_t v2 = *v29;
      v1[58] = *v29;
      uint64_t v13 = v29[1];
      v1[59] = v13;
      uint64_t v30 = qword_3CC60;
      swift_bridgeObjectRetain();
      if (v30 != -1) {
        swift_once();
      }
      uint64_t v31 = off_3D5C0;
      if (*(void *)((char *)&dword_10 + (void)off_3D5C0)
        && (sub_2FA80(),
            sub_2F5C0(),
            Swift::Int v32 = sub_2FAA0(),
            uint64_t v33 = -1 << *((unsigned char *)&stru_20.cmd + (void)v31),
            unint64_t v10 = v32 & ~v33,
            uint64_t v34 = v31 + 14,
            ((*(void *)((char *)v31 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8) + 56) >> v10) & 1) != 0))
      {
        unint64_t v3 = *(char *(**)(char *, int64_t, char, char *))&stru_20.segname[(void)v31 + 8];
        int64_t v35 = (void *)((char *)v3 + 16 * v10);
        BOOL v36 = *v35 == v2 && v35[1] == v13;
        if (v36 || (sub_2FA30() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          uint64_t v1 = v162;
        }
        else
        {
          uint64_t v37 = ~v33;
          do
          {
            unint64_t v10 = (v10 + 1) & v37;
            if (((*(void *)((char *)v34 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
              goto LABEL_42;
            }
            uint64_t v38 = (void *)((char *)v3 + 16 * v10);
            BOOL v39 = *v38 == v2 && v38[1] == v13;
          }
          while (!v39 && (sub_2FA30() & 1) == 0);
          uint64_t v1 = v162;
          swift_bridgeObjectRelease();
        }
      }
      else
      {
LABEL_42:
        swift_bridgeObjectRetain();
        v165._countAndFlagsBits = 0xD00000000000001BLL;
        v165._object = (void *)0x8000000000032570;
        BOOL v40 = sub_2F5F0(v165);
        id v41 = objc_allocWithZone((Class)LSApplicationRecord);
        unint64_t v10 = (unint64_t)sub_2F5A0();
        swift_bridgeObjectRelease();
        uint64_t v1 = v162;
        v162[37] = 0;
        id v42 = [v41 initWithBundleIdentifier:v10 allowPlaceholder:v40 error:v160];
        v162[60] = v42;

        unint64_t v3 = (char *(*)(char *, int64_t, char, char *))v162[37];
        if (v42)
        {
          uint64_t v43 = v3;
          if (([v42 isWebApp] & 1) != 0 && (sub_263F4(v2, v13, v162[53]) & 1) == 0) {
            goto LABEL_50;
          }
          unint64_t v44 = (char *(*)(char *, int64_t, char, char *))[self defaultWorkspace];
          if (!v44) {
            __break(1u);
          }
          unint64_t v3 = v44;
          unint64_t v10 = (unint64_t)sub_2F5A0();
          unsigned __int8 v45 = [v3 applicationIsInstalled:v10];

          if (v45)
          {
            if ((v156 & 1) == 0)
            {
              unint64_t v3 = (char *(*)(char *, int64_t, char, char *))[v42 appClipMetadata];

              if (v3)
              {
                swift_bridgeObjectRelease();

                char v20 = 1;
                uint64_t v1 = v162;
                goto LABEL_10;
              }
            }
            uint64_t v1 = v162;
            if ((sub_263F4(v2, v13, v162[48]) & 1) == 0)
            {
              id v104 = [v42 localizedName];
              uint64_t v105 = sub_2F5B0();
              uint64_t v107 = v106;

              v162[61] = v105;
              v162[62] = v107;
              v162[63] = "localizedName";
              sub_2F640();
              id v108 = v42;
              v162[64] = sub_2F630();
              uint64_t v102 = sub_2F620();
              uint64_t v51 = sub_22AB8;
              goto LABEL_159;
            }
LABEL_50:
            swift_bridgeObjectRelease();
          }
          else
          {
            swift_bridgeObjectRelease();

            uint64_t v1 = v162;
          }
        }
        else
        {
          uint64_t v46 = v3;
          LODWORD(v3) = sub_2ED10();

          swift_willThrow();
          swift_bridgeObjectRelease();
          swift_errorRelease();
          uint64_t v8 = 0;
        }
      }
    }
    BOOL v24 = __OFADD__(v19++, 1);
    if (v24)
    {
      __break(1u);
      goto LABEL_166;
    }
    int64_t v25 = (unint64_t)((1 << *((unsigned char *)v1 + 721)) + 63) >> 6;
    uint64_t v23 = v1[52];
    if (v19 >= v25) {
      break;
    }
    uint64_t v26 = v23 + 56;
    unint64_t v27 = *(void *)(v23 + 56 + 8 * v19);
    if (v27)
    {
LABEL_24:
      uint64_t v18 = (v27 - 1) & v27;
      unint64_t v22 = __clz(__rbit64(v27)) + (v19 << 6);
      goto LABEL_25;
    }
    uint64_t v28 = v19 + 1;
    if (v19 + 1 >= v25) {
      break;
    }
    unint64_t v27 = *(void *)(v26 + 8 * v28);
    if (v27) {
      goto LABEL_23;
    }
    uint64_t v28 = v19 + 2;
    if (v19 + 2 >= v25) {
      break;
    }
    unint64_t v27 = *(void *)(v26 + 8 * v28);
    if (v27)
    {
LABEL_23:
      uint64_t v19 = v28;
      goto LABEL_24;
    }
    uint64_t v28 = v19 + 3;
    if (v19 + 3 < v25)
    {
      unint64_t v27 = *(void *)(v26 + 8 * v28);
      if (!v27)
      {
        while (1)
        {
          uint64_t v19 = v28 + 1;
          if (__OFADD__(v28, 1)) {
            break;
          }
          if (v19 >= v25) {
            goto LABEL_58;
          }
          unint64_t v27 = *(void *)(v26 + 8 * v19);
          ++v28;
          if (v27) {
            goto LABEL_24;
          }
        }
LABEL_166:
        __break(1u);
LABEL_167:
        unint64_t v10 = (unint64_t)sub_2BDAC((void *)v10);
        unint64_t v11 = *(void *)(v2 + 520);
        if ((v11 & 0x8000000000000000) != 0) {
          goto LABEL_168;
        }
        continue;
      }
      goto LABEL_23;
    }
    break;
  }
LABEL_58:
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v47 = v1[42];
  swift_bridgeObjectRelease();
  if (v47 == 1)
  {
    if (qword_3CC50 == -1)
    {
LABEL_60:
      v48.super.Class isa = (Class)qword_3F080;
      v147._countAndFlagsBits = 0x80000000000318C0;
      v166._countAndFlagsBits = 1701670728;
      v166._object = (void *)0xE400000000000000;
      v173.value._countAndFlagsBits = 0;
      v173.value._object = 0;
      v180._countAndFlagsBits = 0;
      v180._object = (void *)0xE000000000000000;
      v1[67] = sub_2ED00(v166, v173, v48, v180, v147);
      v1[68] = v49;
      v1[69] = sub_2F5A0();
      v1[70] = "collationString";
      sub_2F640();
      v1[71] = sub_2F630();
      uint64_t v50 = sub_2F620();
      uint64_t v51 = sub_24190;
      uint64_t v52 = v50;
      uint64_t v54 = v53;
      goto LABEL_160;
    }
LABEL_171:
    swift_once();
    goto LABEL_60;
  }
  Swift::Int v159 = v7;
  id v55 = (id)MobileGestalt_get_current_device();
  if (!v55)
  {
LABEL_176:
    __break(1u);
    JUMPOUT(0x24110);
  }
  unint64_t v56 = v55;
  unint64_t isSimulator = MobileGestalt_get_isSimulator();

  if (isSimulator)
  {
    swift_bridgeObjectRelease();
    uint64_t v58 = v1[55];
LABEL_64:
    v1[86] = v154;
    uint64_t v59 = v1[43];
    uint64_t v60 = v1[39];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v61 = sub_26C3C(v60, v59, v154);
    v1[87] = v58;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v1[33] = v61;
    if (qword_3CC50 != -1) {
      swift_once();
    }
    unint64_t v62 = qword_3F080;
    uint64_t v161 = "ok";
    v147._countAndFlagsBits = 0x80000000000318C0;
    v167._countAndFlagsBits = 0x20746C7561666544;
    v167._object = (void *)0xEC00000073707041;
    v174.value._countAndFlagsBits = 0;
    v174.value._object = 0;
    v63.super.Class isa = (Class)qword_3F080;
    v181._countAndFlagsBits = 0;
    v181._object = (void *)0xE000000000000000;
    uint64_t v64 = sub_2ED00(v167, v174, v63, v181, v147);
    uint64_t v66 = v65;
    v168._countAndFlagsBits = 0xD00000000000001DLL;
    v148._countAndFlagsBits = 0x8000000000031D20;
    v168._object = (void *)0x80000000000325C0;
    v175.value._countAndFlagsBits = 0;
    v175.value._object = 0;
    v67.super.Class isa = (Class)v62;
    v182._countAndFlagsBits = 0;
    v182._object = (void *)0xE000000000000000;
    uint64_t v68 = sub_2ED00(v168, v175, v67, v182, v148);
    uint64_t v70 = v69;
    BOOL v163 = (char *)_swiftEmptyArrayStorage;
    sub_28CE0((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_28D88);
    char v71 = (char *)_swiftEmptyArrayStorage;
    unint64_t v73 = _swiftEmptyArrayStorage[2];
    unint64_t v72 = _swiftEmptyArrayStorage[3];
    if (v73 >= v72 >> 1)
    {
      char v71 = sub_28D88((char *)(v72 > 1), v73 + 1, 1, (char *)_swiftEmptyArrayStorage);
      BOOL v163 = v71;
    }
    int v74 = *v159;
    *((void *)v71 + 2) = v73 + 1;
    char v75 = &v71[80 * v73];
    *((void *)v75 + 4) = 0;
    *((void *)v75 + 5) = 0;
    *((void *)v75 + 6) = 0xD000000000000023;
    *((void *)v75 + 7) = 0x8000000000032590;
    *((void *)v75 + 8) = 1;
    *((void *)v75 + 9) = v64;
    *((void *)v75 + 10) = v66;
    *((void *)v75 + 11) = v68;
    *((void *)v75 + 12) = v70;
    v75[104] = 0x80;
    BOOL v76 = &unk_31000;
    if (v74 == 1)
    {
      v147._countAndFlagsBits = 0x80000000000318C0;
      v169._object = (void *)0x80000000000322A0;
      v169._countAndFlagsBits = 0xD000000000000010;
      v176.value._countAndFlagsBits = 0;
      v176.value._object = 0;
      v77.super.Class isa = (Class)v62;
      v183._countAndFlagsBits = 0;
      v183._object = (void *)0xE000000000000000;
      uint64_t v2 = sub_2ED00(v169, v176, v77, v183, v147);
      uint64_t v1 = v78;
      uint64_t v19 = 0xD000000000000010;
      v170._countAndFlagsBits = 0xD000000000000020;
      v149._countAndFlagsBits = 0x8000000000031D20;
      v170._object = (void *)0x8000000000032670;
      v177.value._countAndFlagsBits = 0;
      v177.value._object = 0;
      v79.super.Class isa = (Class)v62;
      v184._countAndFlagsBits = 0;
      v184._object = (void *)0xE000000000000000;
      uint64_t v18 = sub_2ED00(v170, v177, v79, v184, v149);
      uint64_t v13 = v80;
      sub_28CE0((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_28D88);
      char v71 = v163;
      unint64_t isSimulator = *((void *)v163 + 2);
      int64_t v81 = *((void *)v163 + 3);
      int64_t v82 = isSimulator + 1;
      if (isSimulator >= (unint64_t)v81 >> 1) {
        goto LABEL_173;
      }
      goto LABEL_70;
    }
    goto LABEL_71;
  }
  if (qword_3CC68 != -1) {
    swift_once();
  }
  uint64_t v109 = off_3D5C8;
  v1[73] = off_3D5C8;
  char v110 = *((unsigned char *)&stru_20.cmd + (void)v109);
  *((unsigned char *)v1 + 723) = v110;
  BOOL v76 = (_OWORD *)(&dword_0 + 1);
  uint64_t v111 = 1 << v110;
  if (v111 < 64) {
    uint64_t v112 = ~(-1 << v111);
  }
  else {
    uint64_t v112 = -1;
  }
  unint64_t v62 = v112 & *(void *)&stru_20.segname[(void)v109 + 16];
  uint64_t v157 = v1[55];
  v1[74] = v154;
  swift_bridgeObjectRetain();
  int64_t v113 = 0;
  uint64_t v161 = "v8@?0";
  while (2)
  {
    if (v62)
    {
      unint64_t v114 = __clz(__rbit64(v62));
      v62 &= v62 - 1;
      unint64_t v115 = v114 | (v113 << 6);
      int64_t v82 = v1[73];
LABEL_98:
      v1[76] = v62;
      v1[75] = v113;
      uint64_t v18 = *(unsigned __int8 *)(*(void *)(v82 + 48) + v115);
      *((unsigned char *)v1 + 724) = v18;
      uint64_t v13 = 0xD000000000000014;
      uint64_t v2 = 0x8000000000031510;
      switch(v18)
      {
        case 1:
          uint64_t v13 = 0xD00000000000001BLL;
          int v119 = "com.apple.MobileAddressBook";
          goto LABEL_137;
        case 2:
          uint64_t v13 = 0xD000000000000013;
          int v119 = "com.apple.mobilecal";
          goto LABEL_137;
        case 3:
          uint64_t v13 = 0xD000000000000015;
          int v119 = "com.apple.mobilenotes";
          goto LABEL_137;
        case 4:
          uint64_t v13 = 0xD000000000000013;
          int v119 = "com.apple.reminders";
          goto LABEL_137;
        case 5:
          uint64_t v13 = 0xD000000000000012;
          int v119 = "com.apple.freeform";
          goto LABEL_137;
        case 6:
          uint64_t v13 = 0xD000000000000014;
          int v119 = "com.apple.VoiceMemos";
          goto LABEL_137;
        case 7:
          uint64_t v13 = 0xD000000000000015;
          int v119 = "com.apple.mobilephone";
          goto LABEL_137;
        case 8:
          uint64_t v13 = 0xD000000000000013;
          int v119 = "com.apple.MobileSMS";
          goto LABEL_137;
        case 9:
          uint64_t v13 = 0xD000000000000012;
          int v119 = "com.apple.facetime";
          goto LABEL_137;
        case 10:
          uint64_t v13 = 0xD000000000000016;
          int v119 = "com.apple.mobilesafari";
          goto LABEL_137;
        case 11:
          uint64_t v120 = 0x7377656E2E65;
          goto LABEL_124;
        case 12:
          NSBundle v121 = "com.apple.stocks";
          goto LABEL_132;
        case 13:
          uint64_t v13 = 0xD000000000000011;
          int v119 = "com.apple.weather";
          goto LABEL_137;
        case 14:
          uint64_t v13 = 0xD000000000000013;
          int v119 = "com.apple.Translate";
          goto LABEL_137;
        case 15:
          uint64_t v120 = 0x7370614D2E65;
          goto LABEL_124;
        case 16:
          uint64_t v13 = 0xD000000000000011;
          int v119 = "com.apple.compass";
          goto LABEL_137;
        case 17:
          uint64_t v13 = 0xD000000000000011;
          int v119 = "com.apple.measure";
          goto LABEL_137;
        case 18:
          uint64_t v13 = 0xD000000000000013;
          int v119 = "com.apple.shortcuts";
          goto LABEL_137;
        case 19:
          NSBundle v121 = "com.apple.Health";
          goto LABEL_132;
        case 20:
          uint64_t v13 = 0xD000000000000011;
          int v119 = "com.apple.Fitness";
          goto LABEL_137;
        case 21:
          uint64_t v120 = 0x656D6F482E65;
LABEL_124:
          uint64_t v2 = v120 & 0xFFFFFFFFFFFFLL | 0xEE00000000000000;
          goto LABEL_128;
        case 22:
          uint64_t v13 = 0xD000000000000011;
          int v119 = "com.apple.journal";
          goto LABEL_137;
        case 23:
          uint64_t v2 = 0xEF636973754D2E65;
          goto LABEL_128;
        case 24:
          uint64_t v2 = 0xEC00000076742E65;
LABEL_128:
          uint64_t v13 = 0x6C7070612E6D6F63;
          break;
        case 25:
          uint64_t v13 = 0xD000000000000019;
          int v119 = "com.apple.mobileslideshow";
          goto LABEL_137;
        case 26:
          NSBundle v121 = "com.apple.camera";
          goto LABEL_132;
        case 27:
          NSBundle v121 = "com.apple.iBooks";
LABEL_132:
          uint64_t v2 = (unint64_t)(v121 - 32) | 0x8000000000000000;
          uint64_t v13 = 0xD000000000000010;
          break;
        case 28:
          uint64_t v13 = 0xD000000000000012;
          int v119 = "com.apple.podcasts";
          goto LABEL_137;
        case 29:
          uint64_t v13 = 0xD000000000000013;
          int v119 = "com.apple.Passwords";
          goto LABEL_137;
        case 30:
          uint64_t v13 = 0xD000000000000012;
          int v119 = "com.apple.AppStore";
          goto LABEL_137;
        case 31:
          uint64_t v13 = 0xD000000000000012;
          int v119 = "com.apple.Passbook";
LABEL_137:
          uint64_t v2 = (unint64_t)(v119 - 32) | 0x8000000000000000;
          break;
        default:
          break;
      }
      uint64_t v122 = v1[52];
      if (!*(void *)(v122 + 16)) {
        goto LABEL_153;
      }
      sub_2FA80();
      sub_2F5C0();
      Swift::Int v123 = sub_2FAA0();
      unint64_t isSimulator = -1 << *(unsigned char *)(v122 + 32);
      uint64_t v19 = v123 & ~isSimulator;
      if (((*(void *)(v122 + (((unint64_t)v19 >> 3) & 0xFFFFFFFFFFFFFF8) + 56) >> v19) & 1) == 0) {
        goto LABEL_153;
      }
      uint64_t v1 = v162;
      uint64_t v124 = *(void *)(v162[52] + 48);
      int64_t v125 = (void *)(v124 + 16 * v19);
      BOOL v126 = *v125 == v13 && v125[1] == v2;
      if (!v126 && (sub_2FA30() & 1) == 0)
      {
        unint64_t isSimulator = ~isSimulator;
        while (1)
        {
          uint64_t v19 = (v19 + 1) & isSimulator;
          if (((*(void *)(v1[52] + (((unint64_t)v19 >> 3) & 0xFFFFFFFFFFFFFF8) + 56) >> v19) & 1) == 0) {
            break;
          }
          uint64_t v127 = (void *)(v124 + 16 * v19);
          if (*v127 == v13 && v127[1] == v2)
          {
            uint64_t v1 = v162;
            goto LABEL_84;
          }
          uint64_t v1 = v162;
          if (sub_2FA30()) {
            goto LABEL_84;
          }
        }
LABEL_153:
        swift_bridgeObjectRelease();
        unint64_t v129 = sub_9B20(v18);
        uint64_t v131 = v130;
        id v132 = objc_allocWithZone((Class)LSApplicationRecord);
        swift_bridgeObjectRetain();
        NSString v133 = sub_2F5A0();
        swift_bridgeObjectRelease();
        *unint64_t v151 = 0;
        id v134 = [v132 initWithBundleIdentifier:v133 allowPlaceholder:1 error:v151];

        unint64_t v135 = *v151;
        if (v134)
        {
          uint64_t v136 = v157;
          goto LABEL_157;
        }
        id v137 = v135;
        sub_2ED10();

        swift_willThrow();
        swift_errorRelease();
        id v138 = objc_allocWithZone((Class)LSApplicationRecord);
        swift_bridgeObjectRetain();
        NSString v139 = sub_2F5A0();
        swift_bridgeObjectRelease();
        *unint64_t v150 = 0;
        id v134 = [v138 initWithBundleIdentifierOfSystemPlaceholder:v139 error:v150];

        unint64_t v135 = *v150;
        if (v134)
        {
          uint64_t v136 = 0;
LABEL_157:
          id v140 = v135;
          id v141 = [v134 localizedName];
          unint64_t v129 = sub_2F5B0();
          uint64_t v143 = v142;
          swift_bridgeObjectRelease();

          uint64_t v131 = v143;
        }
        else
        {
          id v145 = v135;
          sub_2ED10();

          swift_willThrow();
          swift_errorRelease();
          uint64_t v136 = 0;
        }
        v162[79] = v131;
        v162[78] = v129;
        v162[77] = v136;
        v162[80] = sub_9B20(v18);
        v162[81] = v144;
        v162[82] = sub_2F5A0();
        v162[83] = "collationString";
        sub_2F640();
        v162[84] = sub_2F630();
        uint64_t v102 = sub_2F620();
        uint64_t v51 = sub_251A8;
        goto LABEL_159;
      }
LABEL_84:
      swift_bridgeObjectRelease();
      continue;
    }
    break;
  }
  BOOL v24 = __OFADD__(v113++, 1);
  if (v24) {
    goto LABEL_170;
  }
  int64_t v81 = (unint64_t)((1 << *((unsigned char *)v1 + 723)) + 63) >> 6;
  int64_t v82 = v1[73];
  if (v113 >= v81)
  {
LABEL_163:
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v58 = v157;
    goto LABEL_64;
  }
  int64_t v116 = v82 + 56;
  unint64_t v117 = *(void *)(v82 + 56 + 8 * v113);
  if (v117)
  {
LABEL_97:
    unint64_t v62 = (v117 - 1) & v117;
    unint64_t v115 = __clz(__rbit64(v117)) + (v113 << 6);
    goto LABEL_98;
  }
  int64_t v118 = v113 + 1;
  if (v113 + 1 >= v81) {
    goto LABEL_163;
  }
  unint64_t v117 = *(void *)(v116 + 8 * v118);
  if (v117) {
    goto LABEL_96;
  }
  int64_t v118 = v113 + 2;
  if (v113 + 2 >= v81) {
    goto LABEL_163;
  }
  unint64_t v117 = *(void *)(v116 + 8 * v118);
  if (v117) {
    goto LABEL_96;
  }
  int64_t v118 = v113 + 3;
  if (v113 + 3 >= v81) {
    goto LABEL_163;
  }
  unint64_t v117 = *(void *)(v116 + 8 * v118);
  if (v117)
  {
LABEL_96:
    int64_t v113 = v118;
    goto LABEL_97;
  }
  while (1)
  {
    int64_t v113 = v118 + 1;
    if (__OFADD__(v118, 1)) {
      break;
    }
    if (v113 >= v81) {
      goto LABEL_163;
    }
    unint64_t v117 = *(void *)(v116 + 8 * v113);
    ++v118;
    if (v117) {
      goto LABEL_97;
    }
  }
  __break(1u);
LABEL_173:
  char v71 = sub_28D88((char *)((unint64_t)v81 > 1), v82, 1, v71);
LABEL_70:
  *((void *)v71 + 2) = v82;
  id v83 = &v71[80 * isSimulator];
  *((_OWORD *)v83 + 2) = v76[39];
  *((void *)v83 + 6) = v19 + 23;
  *((void *)v83 + 7) = 0x8000000000032640;
  *((void *)v83 + 8) = 1;
  *((void *)v83 + 9) = v2;
  *((void *)v83 + 10) = v1;
  *((void *)v83 + 11) = v18;
  *((void *)v83 + 12) = v13;
  v83[104] = 0x80;
LABEL_71:
  unsigned __int8 v84 = v159[2];
  *int64_t v152 = 0u;
  v152[1] = 0u;
  v162[12] = v71;
  sub_2BC14(0, 0, (uint64_t)v152);
  if (v84)
  {
    v147._countAndFlagsBits = (unint64_t)v161 | 0x8000000000000000;
    v171._countAndFlagsBits = 0x70696C4320707041;
    v171._object = (void *)0xE900000000000073;
    v178.value._countAndFlagsBits = 0;
    v178.value._object = 0;
    v85.super.Class isa = (Class)v62;
    v185._countAndFlagsBits = 0;
    v185._object = (void *)0xE000000000000000;
    uint64_t v86 = sub_2ED00(v171, v178, v85, v185, v147);
    uint64_t v88 = v87;
    sub_5250(&qword_3D828);
    uint64_t v89 = swift_allocObject();
    *(_OWORD *)(v89 + 16) = xmmword_31280;
    *(_OWORD *)(v89 + 32) = xmmword_31290;
    *(void *)(v89 + 48) = 0xD000000000000020;
    *(void *)(v89 + 56) = 0x8000000000032610;
    *(void *)(v89 + 64) = 1;
    *(void *)(v89 + 72) = v86;
    *(void *)(v89 + 88) = 0;
    *(void *)(v89 + 96) = 0;
    *(void *)(v89 + 80) = v88;
    *(unsigned char *)(v89 + 104) = 0;
    sub_28CE0((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_28EA8);
    unint64_t v90 = *(void **)v153;
    unint64_t v92 = *(void *)(*(void *)v153 + 16);
    unint64_t v91 = *(void *)(*(void *)v153 + 24);
    if (v92 >= v91 >> 1)
    {
      unint64_t v90 = sub_28EA8((void *)(v91 > 1), v92 + 1, 1, v90);
      *(void *)uint64_t v153 = v90;
    }
    v90[2] = v92 + 1;
    uint64_t v93 = &v90[5 * v92];
    *((_OWORD *)v93 + 2) = v76[39];
    v93[6] = 0;
    v93[7] = 0;
    v93[8] = v89;
  }
  v147._countAndFlagsBits = (unint64_t)v161 | 0x8000000000000000;
  v172._countAndFlagsBits = 0x41206E6564646948;
  v172._object = (void *)0xEB00000000737070;
  v179.value._countAndFlagsBits = 0;
  v179.value._object = 0;
  v94.super.Class isa = (Class)v62;
  v186._countAndFlagsBits = 0;
  v186._object = (void *)0xE000000000000000;
  uint64_t v95 = sub_2ED00(v172, v179, v94, v186, v147);
  uint64_t v97 = v96;
  sub_5250(&qword_3D828);
  uint64_t v98 = swift_allocObject();
  *(_OWORD *)(v98 + 16) = xmmword_31280;
  *(_OWORD *)(v98 + 32) = xmmword_312A0;
  *(void *)(v98 + 48) = 0xD000000000000022;
  *(void *)(v98 + 56) = 0x80000000000325E0;
  *(void *)(v98 + 64) = 1;
  *(void *)(v98 + 72) = v95;
  *(void *)(v98 + 88) = 0;
  *(void *)(v98 + 96) = 0;
  *(void *)(v98 + 80) = v97;
  *(unsigned char *)(v98 + 104) = 0;
  sub_28CE0((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_28EA8);
  uint64_t v99 = *(void *)(v162[33] + 16);
  sub_28D3C(v99, (uint64_t (*)(BOOL))sub_28EA8);
  uint64_t v100 = v162[33];
  v162[88] = v100;
  *(void *)(v100 + 16) = v99 + 1;
  uint64_t v101 = v100 + 40 * v99;
  *(_OWORD *)(v101 + 32) = xmmword_31290;
  *(void *)(v101 + 48) = 0;
  *(void *)(v101 + 56) = 0;
  *(void *)(v101 + 64) = v98;
  swift_unknownObjectWeakInit();
  sub_2F640();
  swift_bridgeObjectRetain();
  v162[89] = sub_2F630();
  uint64_t v102 = sub_2F620();
  uint64_t v51 = sub_26144;
LABEL_159:
  uint64_t v52 = v102;
  uint64_t v54 = v103;
LABEL_160:
  return _swift_task_switch(v51, v52, v54);
}

uint64_t sub_24190()
{
  uint64_t v1 = v0[70];
  uint64_t v2 = (void *)v0[69];
  unint64_t v3 = (void *)v0[41];
  swift_release();
  v0[72] = [v3 sectionForObject:v2 collationStringSelector:v1];

  return _swift_task_switch(sub_24258, 0, 0);
}

uint64_t sub_24258()
{
  uint64_t v3 = *(void *)(v0 + 544);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v5 = *(void *)(v0 + 528);
  if (isUniquelyReferenced_nonNull_native)
  {
    unint64_t v6 = *(void *)(v0 + 576);
    if ((v6 & 0x8000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_104:
    __break(1u);
    goto LABEL_105;
  }
LABEL_103:
  uint64_t v5 = (uint64_t)sub_2BDAC((void *)v5);
  unint64_t v6 = *(void *)(v0 + 576);
  if ((v6 & 0x8000000000000000) != 0) {
    goto LABEL_104;
  }
LABEL_3:
  if (*(void *)(v5 + 16) <= v6)
  {
LABEL_105:
    __break(1u);
    goto LABEL_106;
  }
  uint64_t v7 = *(void *)(v0 + 536);
  id v104 = (unsigned __int8 *)v5;
  uint64_t v8 = (void *)(v5 + 8 * v6);
  sub_28CE0((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_28D88);
  unint64_t v9 = *(void *)(v8[4] + 16);
  sub_28D3C(v9, (uint64_t (*)(BOOL))sub_28D88);
  uint64_t v10 = v8[4];
  *(void *)(v10 + 16) = v9 + 1;
  uint64_t v11 = v10 + 80 * v9;
  *(_OWORD *)(v11 + 32) = xmmword_312B0;
  *(_OWORD *)(v11 + 48) = xmmword_312B0;
  *(void *)(v11 + 64) = 0;
  *(void *)(v11 + 72) = v7;
  *(void *)(v11 + 88) = 0;
  *(void *)(v11 + 96) = 0;
  *(void *)(v11 + 80) = v3;
  *(unsigned char *)(v11 + 104) = 0;
  id v12 = (id)MobileGestalt_get_current_device();
  if (!v12) {
    __break(1u);
  }
  uint64_t v13 = v12;
  unint64_t isSimulator = MobileGestalt_get_isSimulator();

  if (isSimulator)
  {
    swift_bridgeObjectRelease();
    uint64_t v15 = *(void *)(v0 + 440);
LABEL_7:
    *(void *)(v0 + 688) = v104;
    uint64_t v16 = *(void *)(v0 + 344);
    uint64_t v17 = *(void *)(v0 + 312);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_26C3C(v17, v16, (uint64_t)v104);
    *(void *)(v0 + 696) = v15;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(void *)(v0 + 264) = v18;
    if (qword_3CC50 == -1)
    {
LABEL_8:
      uint64_t v3 = qword_3F080;
      id v104 = (unsigned __int8 *)(v0 + 720);
      uint64_t v105 = "ok";
      v99._countAndFlagsBits = 0x80000000000318C0;
      v108._countAndFlagsBits = 0x20746C7561666544;
      v108._object = (void *)0xEC00000073707041;
      v114.value._countAndFlagsBits = 0;
      v114.value._object = 0;
      v19.super.Class isa = (Class)qword_3F080;
      v120._countAndFlagsBits = 0;
      v120._object = (void *)0xE000000000000000;
      uint64_t v20 = sub_2ED00(v108, v114, v19, v120, v99);
      uint64_t v22 = v21;
      v109._countAndFlagsBits = 0xD00000000000001DLL;
      v100._countAndFlagsBits = 0x8000000000031D20;
      v109._object = (void *)0x80000000000325C0;
      v115.value._countAndFlagsBits = 0;
      v115.value._object = 0;
      v23.super.Class isa = (Class)v3;
      v121._countAndFlagsBits = 0;
      v121._object = (void *)0xE000000000000000;
      uint64_t v24 = sub_2ED00(v109, v115, v23, v121, v100);
      uint64_t v26 = v25;
      uint64_t v106 = (char *)_swiftEmptyArrayStorage;
      sub_28CE0((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_28D88);
      unint64_t v27 = (char *)_swiftEmptyArrayStorage;
      unint64_t v29 = _swiftEmptyArrayStorage[2];
      unint64_t v28 = _swiftEmptyArrayStorage[3];
      if (v29 >= v28 >> 1)
      {
        unint64_t v27 = sub_28D88((char *)(v28 > 1), v29 + 1, 1, (char *)_swiftEmptyArrayStorage);
        uint64_t v106 = v27;
      }
      unint64_t v9 = v0 + 64;
      uint64_t v103 = v0 + 264;
      uint64_t v30 = (unsigned __int8 *)(v0 + 720);
      int v31 = *v104;
      *((void *)v27 + 2) = v29 + 1;
      Swift::Int v32 = &v27[80 * v29];
      *((void *)v32 + 4) = 0;
      *((void *)v32 + 5) = 0;
      *((void *)v32 + 6) = 0xD000000000000023;
      *((void *)v32 + 7) = 0x8000000000032590;
      *((void *)v32 + 8) = 1;
      *((void *)v32 + 9) = v20;
      *((void *)v32 + 10) = v22;
      *((void *)v32 + 11) = v24;
      *((void *)v32 + 12) = v26;
      v32[104] = 0x80;
      if (v31 == 1)
      {
        v99._countAndFlagsBits = 0x80000000000318C0;
        v110._object = (void *)0x80000000000322A0;
        v110._countAndFlagsBits = 0xD000000000000010;
        v116.value._countAndFlagsBits = 0;
        v116.value._object = 0;
        v33.super.Class isa = (Class)v3;
        v122._countAndFlagsBits = 0;
        v122._object = (void *)0xE000000000000000;
        uint64_t v34 = sub_2ED00(v110, v116, v33, v122, v99);
        uint64_t v8 = v35;
        v111._countAndFlagsBits = 0xD000000000000020;
        v101._countAndFlagsBits = 0x8000000000031D20;
        v111._object = (void *)0x8000000000032670;
        v117.value._countAndFlagsBits = 0;
        v117.value._object = 0;
        v36.super.Class isa = (Class)v3;
        v123._countAndFlagsBits = 0;
        v123._object = (void *)0xE000000000000000;
        uint64_t v1 = sub_2ED00(v111, v117, v36, v123, v101);
        unint64_t v2 = v37;
        sub_28CE0((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_28D88);
        unint64_t v27 = v106;
        unint64_t isSimulator = *((void *)v106 + 2);
        int64_t v38 = *((void *)v106 + 3);
        int64_t v39 = isSimulator + 1;
        if (isSimulator >= (unint64_t)v38 >> 1) {
          goto LABEL_108;
        }
        goto LABEL_12;
      }
      goto LABEL_13;
    }
LABEL_106:
    swift_once();
    goto LABEL_8;
  }
  if (qword_3CC68 != -1) {
    swift_once();
  }
  v99._object = (void *)(v0 + 256);
  uint64_t v102 = (void **)(v0 + 288);
  unint64_t v62 = off_3D5C8;
  *(void *)(v0 + 584) = off_3D5C8;
  char v63 = *((unsigned char *)&stru_20.cmd + (void)v62);
  *(unsigned char *)(v0 + 723) = v63;
  uint64_t v64 = 1 << v63;
  if (v64 < 64) {
    uint64_t v65 = ~(-1 << v64);
  }
  else {
    uint64_t v65 = -1;
  }
  unint64_t v66 = v65 & *(void *)&stru_20.segname[(void)v62 + 16];
  uint64_t v103 = *(void *)(v0 + 440);
  *(void *)(v0 + 592) = v104;
  swift_bridgeObjectRetain();
  uint64_t v34 = 0;
  uint64_t v105 = "v8@?0";
  while (1)
  {
    if (v66)
    {
      unint64_t v67 = __clz(__rbit64(v66));
      v66 &= v66 - 1;
      unint64_t v68 = v67 | (v34 << 6);
      int64_t v39 = *(void *)(v0 + 584);
      goto LABEL_41;
    }
    uint64_t v5 = v34 + 1;
    if (__OFADD__(v34, 1))
    {
      __break(1u);
      goto LABEL_103;
    }
    int64_t v38 = (unint64_t)((1 << *(unsigned char *)(v0 + 723)) + 63) >> 6;
    int64_t v39 = *(void *)(v0 + 584);
    if (v5 >= v38) {
      goto LABEL_100;
    }
    int64_t v69 = v39 + 56;
    unint64_t v70 = *(void *)(v39 + 56 + 8 * v5);
    ++v34;
    if (!v70)
    {
      uint64_t v34 = v5 + 1;
      if (v5 + 1 >= v38) {
        goto LABEL_100;
      }
      unint64_t v70 = *(void *)(v69 + 8 * v34);
      if (!v70)
      {
        uint64_t v34 = v5 + 2;
        if (v5 + 2 >= v38) {
          goto LABEL_100;
        }
        unint64_t v70 = *(void *)(v69 + 8 * v34);
        if (!v70) {
          break;
        }
      }
    }
LABEL_40:
    unint64_t v66 = (v70 - 1) & v70;
    unint64_t v68 = __clz(__rbit64(v70)) + (v34 << 6);
LABEL_41:
    *(void *)(v0 + 608) = v66;
    *(void *)(v0 + 600) = v34;
    uint64_t v8 = (void *)*(unsigned __int8 *)(*(void *)(v39 + 48) + v68);
    *(unsigned char *)(v0 + 724) = (_BYTE)v8;
    uint64_t v1 = 0xD000000000000014;
    unint64_t v2 = 0x8000000000031510;
    switch((unint64_t)v8)
    {
      case 1uLL:
        uint64_t v1 = 0xD00000000000001BLL;
        unint64_t v72 = "com.apple.MobileAddressBook";
        goto LABEL_76;
      case 2uLL:
        uint64_t v1 = 0xD000000000000013;
        unint64_t v72 = "com.apple.mobilecal";
        goto LABEL_76;
      case 3uLL:
        uint64_t v1 = 0xD000000000000015;
        unint64_t v72 = "com.apple.mobilenotes";
        goto LABEL_76;
      case 4uLL:
        uint64_t v1 = 0xD000000000000013;
        unint64_t v72 = "com.apple.reminders";
        goto LABEL_76;
      case 5uLL:
        uint64_t v1 = 0xD000000000000012;
        unint64_t v72 = "com.apple.freeform";
        goto LABEL_76;
      case 6uLL:
        uint64_t v1 = 0xD000000000000014;
        unint64_t v72 = "com.apple.VoiceMemos";
        goto LABEL_76;
      case 7uLL:
        uint64_t v1 = 0xD000000000000015;
        unint64_t v72 = "com.apple.mobilephone";
        goto LABEL_76;
      case 8uLL:
        uint64_t v1 = 0xD000000000000013;
        unint64_t v72 = "com.apple.MobileSMS";
        goto LABEL_76;
      case 9uLL:
        uint64_t v1 = 0xD000000000000012;
        unint64_t v72 = "com.apple.facetime";
        goto LABEL_76;
      case 0xAuLL:
        uint64_t v1 = 0xD000000000000016;
        unint64_t v72 = "com.apple.mobilesafari";
        goto LABEL_76;
      case 0xBuLL:
        uint64_t v73 = 0x7377656E2E65;
        goto LABEL_63;
      case 0xCuLL:
        int v74 = "com.apple.stocks";
        goto LABEL_71;
      case 0xDuLL:
        uint64_t v1 = 0xD000000000000011;
        unint64_t v72 = "com.apple.weather";
        goto LABEL_76;
      case 0xEuLL:
        uint64_t v1 = 0xD000000000000013;
        unint64_t v72 = "com.apple.Translate";
        goto LABEL_76;
      case 0xFuLL:
        uint64_t v73 = 0x7370614D2E65;
        goto LABEL_63;
      case 0x10uLL:
        uint64_t v1 = 0xD000000000000011;
        unint64_t v72 = "com.apple.compass";
        goto LABEL_76;
      case 0x11uLL:
        uint64_t v1 = 0xD000000000000011;
        unint64_t v72 = "com.apple.measure";
        goto LABEL_76;
      case 0x12uLL:
        uint64_t v1 = 0xD000000000000013;
        unint64_t v72 = "com.apple.shortcuts";
        goto LABEL_76;
      case 0x13uLL:
        int v74 = "com.apple.Health";
        goto LABEL_71;
      case 0x14uLL:
        uint64_t v1 = 0xD000000000000011;
        unint64_t v72 = "com.apple.Fitness";
        goto LABEL_76;
      case 0x15uLL:
        uint64_t v73 = 0x656D6F482E65;
LABEL_63:
        unint64_t v2 = v73 & 0xFFFFFFFFFFFFLL | 0xEE00000000000000;
        goto LABEL_67;
      case 0x16uLL:
        uint64_t v1 = 0xD000000000000011;
        unint64_t v72 = "com.apple.journal";
        goto LABEL_76;
      case 0x17uLL:
        unint64_t v2 = 0xEF636973754D2E65;
        goto LABEL_67;
      case 0x18uLL:
        unint64_t v2 = 0xEC00000076742E65;
LABEL_67:
        uint64_t v1 = 0x6C7070612E6D6F63;
        break;
      case 0x19uLL:
        uint64_t v1 = 0xD000000000000019;
        unint64_t v72 = "com.apple.mobileslideshow";
        goto LABEL_76;
      case 0x1AuLL:
        int v74 = "com.apple.camera";
        goto LABEL_71;
      case 0x1BuLL:
        int v74 = "com.apple.iBooks";
LABEL_71:
        unint64_t v2 = (unint64_t)(v74 - 32) | 0x8000000000000000;
        uint64_t v1 = 0xD000000000000010;
        break;
      case 0x1CuLL:
        uint64_t v1 = 0xD000000000000012;
        unint64_t v72 = "com.apple.podcasts";
        goto LABEL_76;
      case 0x1DuLL:
        uint64_t v1 = 0xD000000000000013;
        unint64_t v72 = "com.apple.Passwords";
        goto LABEL_76;
      case 0x1EuLL:
        uint64_t v1 = 0xD000000000000012;
        unint64_t v72 = "com.apple.AppStore";
        goto LABEL_76;
      case 0x1FuLL:
        uint64_t v1 = 0xD000000000000012;
        unint64_t v72 = "com.apple.Passbook";
LABEL_76:
        unint64_t v2 = (unint64_t)(v72 - 32) | 0x8000000000000000;
        break;
      default:
        break;
    }
    unint64_t isSimulator = *(void *)(v0 + 416);
    if (!*(void *)(isSimulator + 16)) {
      goto LABEL_92;
    }
    sub_2FA80();
    sub_2F5C0();
    Swift::Int v75 = sub_2FAA0();
    uint64_t v3 = -1 << *(unsigned char *)(isSimulator + 32);
    unint64_t v9 = v75 & ~v3;
    if (((*(void *)(isSimulator + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8) + 56) >> v9) & 1) == 0) {
      goto LABEL_92;
    }
    uint64_t v76 = *(void *)(*(void *)(v0 + 416) + 48);
    NSBundle v77 = (void *)(v76 + 16 * v9);
    BOOL v78 = *v77 == v1 && v77[1] == v2;
    if (!v78 && (sub_2FA30() & 1) == 0)
    {
      uint64_t v3 = ~v3;
      while (1)
      {
        unint64_t v9 = (v9 + 1) & v3;
        if (((*(void *)(*(void *)(v0 + 416) + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8) + 56) >> v9) & 1) == 0) {
          break;
        }
        NSBundle v79 = (void *)(v76 + 16 * v9);
        BOOL v80 = *v79 == v1 && v79[1] == v2;
        if (v80 || (sub_2FA30() & 1) != 0) {
          goto LABEL_24;
        }
      }
LABEL_92:
      swift_bridgeObjectRelease();
      unint64_t v81 = sub_9B20((char)v8);
      uint64_t v83 = v82;
      id v84 = objc_allocWithZone((Class)LSApplicationRecord);
      swift_bridgeObjectRetain();
      NSString v85 = sub_2F5A0();
      swift_bridgeObjectRelease();
      *uint64_t v102 = 0;
      id v86 = [v84 initWithBundleIdentifier:v85 allowPlaceholder:1 error:v102];

      uint64_t v87 = *v102;
      if (v86)
      {
LABEL_95:
        id v91 = v87;
        id v92 = [v86 localizedName];
        unint64_t v81 = sub_2F5B0();
        uint64_t v94 = v93;
        swift_bridgeObjectRelease();

        uint64_t v83 = v94;
        uint64_t v95 = v103;
      }
      else
      {
        id v88 = v87;
        sub_2ED10();

        swift_willThrow();
        swift_errorRelease();
        id v89 = objc_allocWithZone((Class)LSApplicationRecord);
        swift_bridgeObjectRetain();
        NSString v90 = sub_2F5A0();
        swift_bridgeObjectRelease();
        *(void *)v99._object = 0;
        id v86 = [v89 initWithBundleIdentifierOfSystemPlaceholder:v90 error:v99._object];

        uint64_t v87 = *(void **)v99._object;
        if (v86)
        {
          uint64_t v103 = 0;
          goto LABEL_95;
        }
        id v97 = v87;
        sub_2ED10();

        swift_willThrow();
        swift_errorRelease();
        uint64_t v95 = 0;
      }
      *(void *)(v0 + 632) = v83;
      *(void *)(v0 + 624) = v81;
      *(void *)(v0 + 616) = v95;
      *(void *)(v0 + 640) = sub_9B20((char)v8);
      *(void *)(v0 + 648) = v96;
      *(void *)(v0 + 656) = sub_2F5A0();
      *(void *)(v0 + 664) = "collationString";
      sub_2F640();
      *(void *)(v0 + 672) = sub_2F630();
      uint64_t v59 = sub_2F620();
      uint64_t v61 = sub_251A8;
      goto LABEL_97;
    }
LABEL_24:
    swift_bridgeObjectRelease();
  }
  int64_t v71 = v5 + 3;
  if (v71 >= v38)
  {
LABEL_100:
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v15 = v103;
    goto LABEL_7;
  }
  unint64_t v70 = *(void *)(v69 + 8 * v71);
  if (v70)
  {
    uint64_t v34 = v71;
    goto LABEL_40;
  }
  while (1)
  {
    uint64_t v34 = v71 + 1;
    if (__OFADD__(v71, 1)) {
      break;
    }
    if (v34 >= v38) {
      goto LABEL_100;
    }
    unint64_t v70 = *(void *)(v69 + 8 * v34);
    ++v71;
    if (v70) {
      goto LABEL_40;
    }
  }
  __break(1u);
LABEL_108:
  unint64_t v27 = sub_28D88((char *)((unint64_t)v38 > 1), v39, 1, v27);
LABEL_12:
  *((void *)v27 + 2) = v39;
  BOOL v40 = &v27[80 * isSimulator];
  *((_OWORD *)v40 + 2) = xmmword_31270;
  *((void *)v40 + 6) = 0xD000000000000027;
  *((void *)v40 + 7) = 0x8000000000032640;
  *((void *)v40 + 8) = 1;
  *((void *)v40 + 9) = v34;
  *((void *)v40 + 10) = v8;
  *((void *)v40 + 11) = v1;
  *((void *)v40 + 12) = v2;
  v40[104] = 0x80;
  uint64_t v30 = v104;
LABEL_13:
  unsigned __int8 v41 = v30[2];
  *(_OWORD *)unint64_t v9 = 0u;
  *(_OWORD *)(v9 + 16) = 0u;
  *(void *)(v0 + 96) = v27;
  sub_2BC14(0, 0, v9);
  if (v41)
  {
    v99._countAndFlagsBits = (unint64_t)v105 | 0x8000000000000000;
    v112._countAndFlagsBits = 0x70696C4320707041;
    v112._object = (void *)0xE900000000000073;
    v118.value._countAndFlagsBits = 0;
    v118.value._object = 0;
    v42.super.Class isa = (Class)v3;
    v124._countAndFlagsBits = 0;
    v124._object = (void *)0xE000000000000000;
    uint64_t v43 = sub_2ED00(v112, v118, v42, v124, v99);
    uint64_t v45 = v44;
    sub_5250(&qword_3D828);
    uint64_t v46 = swift_allocObject();
    *(_OWORD *)(v46 + 16) = xmmword_31280;
    *(_OWORD *)(v46 + 32) = xmmword_31290;
    *(void *)(v46 + 48) = 0xD000000000000020;
    *(void *)(v46 + 56) = 0x8000000000032610;
    *(void *)(v46 + 64) = 1;
    *(void *)(v46 + 72) = v43;
    *(void *)(v46 + 88) = 0;
    *(void *)(v46 + 96) = 0;
    *(void *)(v46 + 80) = v45;
    *(unsigned char *)(v46 + 104) = 0;
    sub_28CE0((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_28EA8);
    uint64_t v47 = *(void **)v103;
    unint64_t v49 = *(void *)(*(void *)v103 + 16);
    unint64_t v48 = *(void *)(*(void *)v103 + 24);
    if (v49 >= v48 >> 1)
    {
      uint64_t v47 = sub_28EA8((void *)(v48 > 1), v49 + 1, 1, v47);
      *(void *)uint64_t v103 = v47;
    }
    v47[2] = v49 + 1;
    uint64_t v50 = &v47[5 * v49];
    *((_OWORD *)v50 + 2) = xmmword_31270;
    v50[6] = 0;
    v50[7] = 0;
    v50[8] = v46;
  }
  v99._countAndFlagsBits = (unint64_t)v105 | 0x8000000000000000;
  v113._countAndFlagsBits = 0x41206E6564646948;
  v113._object = (void *)0xEB00000000737070;
  v119.value._countAndFlagsBits = 0;
  v119.value._object = 0;
  v51.super.Class isa = (Class)v3;
  v125._countAndFlagsBits = 0;
  v125._object = (void *)0xE000000000000000;
  uint64_t v52 = sub_2ED00(v113, v119, v51, v125, v99);
  uint64_t v54 = v53;
  sub_5250(&qword_3D828);
  uint64_t v55 = swift_allocObject();
  *(_OWORD *)(v55 + 16) = xmmword_31280;
  *(_OWORD *)(v55 + 32) = xmmword_312A0;
  *(void *)(v55 + 48) = 0xD000000000000022;
  *(void *)(v55 + 56) = 0x80000000000325E0;
  *(void *)(v55 + 64) = 1;
  *(void *)(v55 + 72) = v52;
  *(void *)(v55 + 88) = 0;
  *(void *)(v55 + 96) = 0;
  *(void *)(v55 + 80) = v54;
  *(unsigned char *)(v55 + 104) = 0;
  sub_28CE0((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_28EA8);
  uint64_t v56 = *(void *)(*(void *)(v0 + 264) + 16);
  sub_28D3C(v56, (uint64_t (*)(BOOL))sub_28EA8);
  uint64_t v57 = *(void *)(v0 + 264);
  *(void *)(v0 + 704) = v57;
  *(void *)(v57 + 16) = v56 + 1;
  uint64_t v58 = v57 + 40 * v56;
  *(_OWORD *)(v58 + 32) = xmmword_31290;
  *(void *)(v58 + 48) = 0;
  *(void *)(v58 + 56) = 0;
  *(void *)(v58 + 64) = v55;
  swift_unknownObjectWeakInit();
  sub_2F640();
  swift_bridgeObjectRetain();
  *(void *)(v0 + 712) = sub_2F630();
  uint64_t v59 = sub_2F620();
  uint64_t v61 = sub_26144;
LABEL_97:
  return _swift_task_switch(v61, v59, v60);
}

uint64_t sub_251A8()
{
  uint64_t v1 = v0[83];
  unint64_t v2 = (void *)v0[82];
  uint64_t v3 = (void *)v0[41];
  swift_release();
  v0[85] = [v3 sectionForObject:v2 collationStringSelector:v1];

  return _swift_task_switch(sub_25270, 0, 0);
}

uint64_t sub_25270()
{
  unint64_t v1 = *(void *)(v0 + 632);
  int64_t v2 = sub_9B20(*(unsigned char *)(v0 + 724));
  uint64_t v4 = v3;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v6 = *(char **)(v0 + 592);
  if (isUniquelyReferenced_nonNull_native)
  {
    Swift::String_optional v114 = *(void **)(v0 + 592);
    unint64_t v7 = *(void *)(v0 + 680);
    if ((v7 & 0x8000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_97:
    __break(1u);
    goto LABEL_98;
  }
LABEL_96:
  Swift::String_optional v114 = sub_2BDAC(v6);
  unint64_t v7 = *(void *)(v0 + 680);
  if ((v7 & 0x8000000000000000) != 0) {
    goto LABEL_97;
  }
LABEL_3:
  if (v114[2] > v7)
  {
    v103._object = (void *)(v0 + 272);
    uint64_t v107 = (_OWORD *)(v0 + 64);
    Swift::String v109 = (unsigned __int8 *)(v0 + 720);
    Swift::String v110 = (void **)(v0 + 256);
    uint64_t v108 = v0 + 264;
    Swift::String v111 = (void **)(v0 + 288);
    uint64_t v112 = *(void *)(v0 + 648);
    uint64_t v8 = *(void *)(v0 + 640);
    uint64_t v115 = *(void *)(v0 + 624);
    unint64_t v9 = &v114[v7];
    sub_28CE0((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_28D88);
    uint64_t v10 = *(void *)(v9[4] + 16);
    sub_28D3C(v10, (uint64_t (*)(BOOL))sub_28D88);
    uint64_t v11 = v9[4];
    *(void *)(v11 + 16) = v10 + 1;
    uint64_t v12 = v11 + 80 * v10;
    *(void *)(v12 + 32) = v2;
    *(void *)(v12 + 40) = v4;
    *(void *)(v12 + 48) = v8;
    *(void *)(v12 + 56) = v112;
    *(void *)(v12 + 64) = 0;
    *(void *)(v12 + 72) = v115;
    *(void *)(v12 + 88) = 0;
    *(void *)(v12 + 96) = 0;
    *(void *)(v12 + 80) = v1;
    *(unsigned char *)(v12 + 104) = 0;
    uint64_t v113 = *(void *)(v0 + 616);
    unint64_t v1 = *(void *)(v0 + 608);
    int64_t v2 = *(void *)(v0 + 600);
    *(void *)(v0 + 592) = v114;
    unint64_t v6 = "v8@?0";
    while (1)
    {
      if (v1)
      {
        unint64_t v13 = __clz(__rbit64(v1));
        v1 &= v1 - 1;
        unint64_t v14 = v13 | (v2 << 6);
        uint64_t v15 = *(void *)(v0 + 584);
      }
      else
      {
        int64_t v16 = v2 + 1;
        if (__OFADD__(v2, 1))
        {
          __break(1u);
          goto LABEL_96;
        }
        int64_t v17 = (unint64_t)((1 << *(unsigned char *)(v0 + 723)) + 63) >> 6;
        uint64_t v15 = *(void *)(v0 + 584);
        if (v16 >= v17) {
          goto LABEL_82;
        }
        uint64_t v18 = v15 + 56;
        unint64_t v19 = *(void *)(v15 + 56 + 8 * v16);
        ++v2;
        if (!v19)
        {
          int64_t v2 = v16 + 1;
          if (v16 + 1 >= v17) {
            goto LABEL_82;
          }
          unint64_t v19 = *(void *)(v18 + 8 * v2);
          if (!v19)
          {
            int64_t v2 = v16 + 2;
            if (v16 + 2 >= v17) {
              goto LABEL_82;
            }
            unint64_t v19 = *(void *)(v18 + 8 * v2);
            if (!v19)
            {
              int64_t v20 = v16 + 3;
              if (v20 >= v17)
              {
LABEL_82:
                swift_release();
                swift_bridgeObjectRelease();
                *(void *)(v0 + 688) = v114;
                uint64_t v54 = *(void *)(v0 + 344);
                uint64_t v55 = *(void *)(v0 + 312);
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                uint64_t v56 = sub_26C3C(v55, v54, (uint64_t)v114);
                *(void *)(v0 + 696) = v113;
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                *(void *)(v0 + 264) = v56;
                if (qword_3CC50 != -1) {
                  goto LABEL_100;
                }
                goto LABEL_83;
              }
              unint64_t v19 = *(void *)(v18 + 8 * v20);
              if (!v19)
              {
                while (1)
                {
                  int64_t v2 = v20 + 1;
                  if (__OFADD__(v20, 1)) {
                    goto LABEL_99;
                  }
                  if (v2 >= v17) {
                    goto LABEL_82;
                  }
                  unint64_t v19 = *(void *)(v18 + 8 * v2);
                  ++v20;
                  if (v19) {
                    goto LABEL_21;
                  }
                }
              }
              int64_t v2 = v20;
            }
          }
        }
LABEL_21:
        unint64_t v1 = (v19 - 1) & v19;
        unint64_t v14 = __clz(__rbit64(v19)) + (v2 << 6);
      }
      *(void *)(v0 + 608) = v1;
      *(void *)(v0 + 600) = v2;
      uint64_t v21 = *(unsigned __int8 *)(*(void *)(v15 + 48) + v14);
      *(unsigned char *)(v0 + 724) = v21;
      unint64_t v22 = 0xD000000000000014;
      unint64_t v23 = 0x8000000000031510;
      switch(v21)
      {
        case 1:
          unint64_t v22 = 0xD00000000000001BLL;
          uint64_t v24 = "com.apple.MobileAddressBook";
          goto LABEL_57;
        case 2:
          unint64_t v22 = 0xD000000000000013;
          uint64_t v24 = "com.apple.mobilecal";
          goto LABEL_57;
        case 3:
          unint64_t v22 = 0xD000000000000015;
          uint64_t v24 = "com.apple.mobilenotes";
          goto LABEL_57;
        case 4:
          unint64_t v22 = 0xD000000000000013;
          uint64_t v24 = "com.apple.reminders";
          goto LABEL_57;
        case 5:
          unint64_t v22 = 0xD000000000000012;
          uint64_t v24 = "com.apple.freeform";
          goto LABEL_57;
        case 6:
          unint64_t v22 = 0xD000000000000014;
          uint64_t v24 = "com.apple.VoiceMemos";
          goto LABEL_57;
        case 7:
          unint64_t v22 = 0xD000000000000015;
          uint64_t v24 = "com.apple.mobilephone";
          goto LABEL_57;
        case 8:
          unint64_t v22 = 0xD000000000000013;
          uint64_t v24 = "com.apple.MobileSMS";
          goto LABEL_57;
        case 9:
          unint64_t v22 = 0xD000000000000012;
          uint64_t v24 = "com.apple.facetime";
          goto LABEL_57;
        case 10:
          unint64_t v22 = 0xD000000000000016;
          uint64_t v24 = "com.apple.mobilesafari";
          goto LABEL_57;
        case 11:
          uint64_t v25 = 0x7377656E2E65;
          goto LABEL_44;
        case 12:
          uint64_t v26 = "com.apple.stocks";
          goto LABEL_52;
        case 13:
          unint64_t v22 = 0xD000000000000011;
          uint64_t v24 = "com.apple.weather";
          goto LABEL_57;
        case 14:
          unint64_t v22 = 0xD000000000000013;
          uint64_t v24 = "com.apple.Translate";
          goto LABEL_57;
        case 15:
          uint64_t v25 = 0x7370614D2E65;
          goto LABEL_44;
        case 16:
          unint64_t v22 = 0xD000000000000011;
          uint64_t v24 = "com.apple.compass";
          goto LABEL_57;
        case 17:
          unint64_t v22 = 0xD000000000000011;
          uint64_t v24 = "com.apple.measure";
          goto LABEL_57;
        case 18:
          unint64_t v22 = 0xD000000000000013;
          uint64_t v24 = "com.apple.shortcuts";
          goto LABEL_57;
        case 19:
          uint64_t v26 = "com.apple.Health";
          goto LABEL_52;
        case 20:
          unint64_t v22 = 0xD000000000000011;
          uint64_t v24 = "com.apple.Fitness";
          goto LABEL_57;
        case 21:
          uint64_t v25 = 0x656D6F482E65;
LABEL_44:
          unint64_t v23 = v25 & 0xFFFFFFFFFFFFLL | 0xEE00000000000000;
          goto LABEL_48;
        case 22:
          unint64_t v22 = 0xD000000000000011;
          uint64_t v24 = "com.apple.journal";
          goto LABEL_57;
        case 23:
          unint64_t v23 = 0xEF636973754D2E65;
          goto LABEL_48;
        case 24:
          unint64_t v23 = 0xEC00000076742E65;
LABEL_48:
          unint64_t v22 = 0x6C7070612E6D6F63;
          break;
        case 25:
          unint64_t v22 = 0xD000000000000019;
          uint64_t v24 = "com.apple.mobileslideshow";
          goto LABEL_57;
        case 26:
          uint64_t v26 = "com.apple.camera";
          goto LABEL_52;
        case 27:
          uint64_t v26 = "com.apple.iBooks";
LABEL_52:
          unint64_t v23 = (unint64_t)(v26 - 32) | 0x8000000000000000;
          unint64_t v22 = 0xD000000000000010;
          break;
        case 28:
          unint64_t v22 = 0xD000000000000012;
          uint64_t v24 = "com.apple.podcasts";
          goto LABEL_57;
        case 29:
          unint64_t v22 = 0xD000000000000013;
          uint64_t v24 = "com.apple.Passwords";
          goto LABEL_57;
        case 30:
          unint64_t v22 = 0xD000000000000012;
          uint64_t v24 = "com.apple.AppStore";
          goto LABEL_57;
        case 31:
          unint64_t v22 = 0xD000000000000012;
          uint64_t v24 = "com.apple.Passbook";
LABEL_57:
          unint64_t v23 = (unint64_t)(v24 - 32) | 0x8000000000000000;
          break;
        default:
          break;
      }
      uint64_t v27 = *(void *)(v0 + 416);
      if (!*(void *)(v27 + 16)) {
        goto LABEL_73;
      }
      sub_2FA80();
      sub_2F5C0();
      Swift::Int v28 = sub_2FAA0();
      uint64_t v4 = -1 << *(unsigned char *)(v27 + 32);
      unint64_t v29 = v28 & ~v4;
      if (((*(void *)(v27 + ((v29 >> 3) & 0xFFFFFFFFFFFFFF8) + 56) >> v29) & 1) == 0) {
        goto LABEL_73;
      }
      uint64_t v30 = *(void *)(*(void *)(v0 + 416) + 48);
      int v31 = (void *)(v30 + 16 * v29);
      BOOL v32 = *v31 == v22 && v31[1] == v23;
      if (!v32 && (sub_2FA30() & 1) == 0)
      {
        uint64_t v4 = ~v4;
        while (1)
        {
          unint64_t v29 = (v29 + 1) & v4;
          if (((*(void *)(*(void *)(v0 + 416) + ((v29 >> 3) & 0xFFFFFFFFFFFFFF8) + 56) >> v29) & 1) == 0) {
            break;
          }
          NSBundle v33 = (void *)(v30 + 16 * v29);
          BOOL v34 = *v33 == v22 && v33[1] == v23;
          if (v34 || (sub_2FA30() & 1) != 0) {
            goto LABEL_5;
          }
        }
LABEL_73:
        swift_bridgeObjectRelease();
        unint64_t v35 = sub_9B20(v21);
        uint64_t v37 = v36;
        id v38 = objc_allocWithZone((Class)LSApplicationRecord);
        swift_bridgeObjectRetain();
        NSString v39 = sub_2F5A0();
        swift_bridgeObjectRelease();
        *Swift::String v111 = 0;
        id v40 = [v38 initWithBundleIdentifier:v39 allowPlaceholder:1 error:v111];

        unsigned __int8 v41 = *v111;
        if (v40)
        {
          uint64_t v42 = v113;
          goto LABEL_77;
        }
        id v43 = v41;
        sub_2ED10();

        swift_willThrow();
        swift_errorRelease();
        id v44 = objc_allocWithZone((Class)LSApplicationRecord);
        swift_bridgeObjectRetain();
        NSString v45 = sub_2F5A0();
        swift_bridgeObjectRelease();
        char *v110 = 0;
        id v40 = [v44 initWithBundleIdentifierOfSystemPlaceholder:v45 error:v110];

        unsigned __int8 v41 = *v110;
        if (v40)
        {
          uint64_t v42 = 0;
LABEL_77:
          id v46 = v41;
          id v47 = [v40 localizedName];
          unint64_t v35 = sub_2F5B0();
          uint64_t v49 = v48;
          swift_bridgeObjectRelease();

          uint64_t v37 = v49;
        }
        else
        {
          id v101 = v41;
          sub_2ED10();

          swift_willThrow();
          swift_errorRelease();
          uint64_t v42 = 0;
        }
        *(void *)(v0 + 632) = v37;
        *(void *)(v0 + 624) = v35;
        *(void *)(v0 + 616) = v42;
        *(void *)(v0 + 640) = sub_9B20(v21);
        *(void *)(v0 + 648) = v50;
        *(void *)(v0 + 656) = sub_2F5A0();
        *(void *)(v0 + 664) = "collationString";
        sub_2F640();
        *(void *)(v0 + 672) = sub_2F630();
        uint64_t v51 = sub_2F620();
        uint64_t v53 = sub_251A8;
        goto LABEL_79;
      }
LABEL_5:
      swift_bridgeObjectRelease();
    }
  }
LABEL_98:
  __break(1u);
LABEL_99:
  __break(1u);
LABEL_100:
  swift_once();
LABEL_83:
  uint64_t v57 = (objc_class *)qword_3F080;
  v103._countAndFlagsBits = 0x80000000000318C0;
  v118._countAndFlagsBits = 0x20746C7561666544;
  v118._object = (void *)0xEC00000073707041;
  v124.value._countAndFlagsBits = 0;
  v124.value._object = 0;
  v58.super.Class isa = (Class)qword_3F080;
  v130._countAndFlagsBits = 0;
  v130._object = (void *)0xE000000000000000;
  uint64_t v59 = sub_2ED00(v118, v124, v58, v130, v103);
  uint64_t v61 = v60;
  v119._countAndFlagsBits = 0xD00000000000001DLL;
  v104._countAndFlagsBits = 0x8000000000031D20;
  v119._object = (void *)0x80000000000325C0;
  v125.value._countAndFlagsBits = 0;
  v125.value._object = 0;
  v62.super.Class isa = v57;
  v131._countAndFlagsBits = 0;
  v131._object = (void *)0xE000000000000000;
  uint64_t v63 = sub_2ED00(v119, v125, v62, v131, v104);
  uint64_t v65 = v64;
  Swift::String_optional v116 = (char *)_swiftEmptyArrayStorage;
  sub_28CE0((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_28D88);
  unint64_t v66 = (char *)_swiftEmptyArrayStorage;
  unint64_t v68 = _swiftEmptyArrayStorage[2];
  unint64_t v67 = _swiftEmptyArrayStorage[3];
  if (v68 >= v67 >> 1)
  {
    unint64_t v66 = sub_28D88((char *)(v67 > 1), v68 + 1, 1, (char *)_swiftEmptyArrayStorage);
    Swift::String_optional v116 = v66;
  }
  int64_t v69 = v109;
  int v70 = *v109;
  *((void *)v66 + 2) = v68 + 1;
  int64_t v71 = &v66[80 * v68];
  *((void *)v71 + 4) = 0;
  *((void *)v71 + 5) = 0;
  *((void *)v71 + 6) = 0xD000000000000023;
  *((void *)v71 + 7) = 0x8000000000032590;
  *((void *)v71 + 8) = 1;
  *((void *)v71 + 9) = v59;
  *((void *)v71 + 10) = v61;
  *((void *)v71 + 11) = v63;
  *((void *)v71 + 12) = v65;
  v71[104] = 0x80;
  if (v70 == 1)
  {
    v105._countAndFlagsBits = 0x80000000000318C0;
    v120._object = (void *)0x80000000000322A0;
    v120._countAndFlagsBits = 0xD000000000000010;
    v126.value._countAndFlagsBits = 0;
    v126.value._object = 0;
    v72.super.Class isa = v57;
    v132._countAndFlagsBits = 0;
    v132._object = (void *)0xE000000000000000;
    uint64_t v73 = sub_2ED00(v120, v126, v72, v132, v105);
    uint64_t v75 = v74;
    v121._countAndFlagsBits = 0xD000000000000020;
    v106._countAndFlagsBits = 0x8000000000031D20;
    v121._object = (void *)0x8000000000032670;
    v127.value._countAndFlagsBits = 0;
    v127.value._object = 0;
    v76.super.Class isa = v57;
    v133._countAndFlagsBits = 0;
    v133._object = (void *)0xE000000000000000;
    uint64_t v77 = sub_2ED00(v121, v127, v76, v133, v106);
    uint64_t v79 = v78;
    sub_28CE0((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_28D88);
    unint64_t v66 = v116;
    unint64_t v81 = *((void *)v116 + 2);
    unint64_t v80 = *((void *)v116 + 3);
    if (v81 >= v80 >> 1) {
      unint64_t v66 = sub_28D88((char *)(v80 > 1), v81 + 1, 1, v116);
    }
    *((void *)v66 + 2) = v81 + 1;
    uint64_t v82 = &v66[80 * v81];
    *((_OWORD *)v82 + 2) = xmmword_31270;
    *((void *)v82 + 6) = 0xD000000000000027;
    *((void *)v82 + 7) = 0x8000000000032640;
    *((void *)v82 + 8) = 1;
    *((void *)v82 + 9) = v73;
    *((void *)v82 + 10) = v75;
    *((void *)v82 + 11) = v77;
    *((void *)v82 + 12) = v79;
    v82[104] = 0x80;
    int64_t v69 = v109;
  }
  unsigned __int8 v83 = v69[2];
  *uint64_t v107 = 0u;
  v107[1] = 0u;
  *(void *)(v0 + 96) = v66;
  sub_2BC14(0, 0, (uint64_t)v107);
  if (v83)
  {
    v105._countAndFlagsBits = 0x80000000000318C0;
    v122._countAndFlagsBits = 0x70696C4320707041;
    v122._object = (void *)0xE900000000000073;
    v128.value._countAndFlagsBits = 0;
    v128.value._object = 0;
    v84.super.Class isa = v57;
    v134._countAndFlagsBits = 0;
    v134._object = (void *)0xE000000000000000;
    uint64_t v85 = sub_2ED00(v122, v128, v84, v134, v105);
    uint64_t v87 = v86;
    sub_5250(&qword_3D828);
    uint64_t v88 = swift_allocObject();
    *(_OWORD *)(v88 + 16) = xmmword_31280;
    *(_OWORD *)(v88 + 32) = xmmword_31290;
    *(void *)(v88 + 48) = 0xD000000000000020;
    *(void *)(v88 + 56) = 0x8000000000032610;
    *(void *)(v88 + 64) = 1;
    *(void *)(v88 + 72) = v85;
    *(void *)(v88 + 88) = 0;
    *(void *)(v88 + 96) = 0;
    *(void *)(v88 + 80) = v87;
    *(unsigned char *)(v88 + 104) = 0;
    sub_28CE0((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_28EA8);
    id v89 = *(void **)v108;
    unint64_t v91 = *(void *)(*(void *)v108 + 16);
    unint64_t v90 = *(void *)(*(void *)v108 + 24);
    if (v91 >= v90 >> 1)
    {
      id v89 = sub_28EA8((void *)(v90 > 1), v91 + 1, 1, v89);
      *(void *)uint64_t v108 = v89;
    }
    v89[2] = v91 + 1;
    id v92 = &v89[5 * v91];
    *((_OWORD *)v92 + 2) = xmmword_31270;
    v92[6] = 0;
    v92[7] = 0;
    v92[8] = v88;
  }
  v105._countAndFlagsBits = 0x80000000000318C0;
  v123._countAndFlagsBits = 0x41206E6564646948;
  v123._object = (void *)0xEB00000000737070;
  v129.value._countAndFlagsBits = 0;
  v129.value._object = 0;
  v93.super.Class isa = v57;
  v135._countAndFlagsBits = 0;
  v135._object = (void *)0xE000000000000000;
  uint64_t v94 = sub_2ED00(v123, v129, v93, v135, v105);
  uint64_t v96 = v95;
  sub_5250(&qword_3D828);
  uint64_t v97 = swift_allocObject();
  *(_OWORD *)(v97 + 16) = xmmword_31280;
  *(_OWORD *)(v97 + 32) = xmmword_312A0;
  *(void *)(v97 + 48) = 0xD000000000000022;
  *(void *)(v97 + 56) = 0x80000000000325E0;
  *(void *)(v97 + 64) = 1;
  *(void *)(v97 + 72) = v94;
  *(void *)(v97 + 88) = 0;
  *(void *)(v97 + 96) = 0;
  *(void *)(v97 + 80) = v96;
  *(unsigned char *)(v97 + 104) = 0;
  sub_28CE0((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_28EA8);
  uint64_t v98 = *(void *)(*(void *)(v0 + 264) + 16);
  sub_28D3C(v98, (uint64_t (*)(BOOL))sub_28EA8);
  uint64_t v99 = *(void *)(v0 + 264);
  *(void *)(v0 + 704) = v99;
  *(void *)(v99 + 16) = v98 + 1;
  uint64_t v100 = v99 + 40 * v98;
  *(_OWORD *)(v100 + 32) = xmmword_31290;
  *(void *)(v100 + 48) = 0;
  *(void *)(v100 + 56) = 0;
  *(void *)(v100 + 64) = v97;
  swift_unknownObjectWeakInit();
  sub_2F640();
  swift_bridgeObjectRetain();
  *(void *)(v0 + 712) = sub_2F630();
  uint64_t v51 = sub_2F620();
  uint64_t v53 = sub_26144;
LABEL_79:
  return _swift_task_switch(v53, v51, v52);
}

uint64_t sub_26144()
{
  swift_release();
  sub_26FDC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
  return _swift_task_switch(sub_26228, 0, 0);
}

uint64_t sub_26228()
{
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

id sub_262D0(void *a1, uint64_t a2)
{
  id result = [a1 bundleIdentifier];
  if (result)
  {
    uint64_t v5 = result;
    Swift::Int v6 = sub_2F5B0();
    Swift::Int v8 = v7;

    id v9 = [a1 appClipMetadata];
    if (v9)
    {
LABEL_3:
      swift_bridgeObjectRelease();
      return &dword_0 + 1;
    }
    if ([a1 developerType] != 1 && objc_msgSend(a1, "isWebApp"))
    {
      swift_beginAccess();
      sub_2BA64(&v11, v6, v8);
      swift_endAccess();
      goto LABEL_3;
    }
    char v10 = sub_263F4(v6, v8, a2);
    swift_bridgeObjectRelease();
    return (id)(v10 & 1);
  }
  return result;
}

uint64_t sub_263F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_2FA80();
    sub_2F5C0();
    Swift::Int v6 = sub_2FAA0();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      Swift::Int v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_2FA30() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          int64_t v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_2FA30() & 1) != 0) {
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

uint64_t sub_2652C(char a1, uint64_t a2)
{
  if (*(void *)(a2 + 16))
  {
    sub_2FA80();
    sub_9B20(a1);
    sub_2F5C0();
    swift_bridgeObjectRelease();
    Swift::Int v4 = sub_2FAA0();
    uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v6 = v4 & ~v5;
    if ((*(void *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
    {
      uint64_t v7 = ~v5;
      while (1)
      {
        unint64_t v8 = 0xD000000000000014;
        unint64_t v9 = 0x8000000000031510;
        switch(*(unsigned char *)(*(void *)(a2 + 48) + v6))
        {
          case 1:
            unint64_t v8 = 0xD00000000000001BLL;
            uint64_t v10 = "com.apple.MobileAddressBook";
            goto LABEL_39;
          case 2:
            Swift::Int v11 = "com.apple.mobilecal";
            goto LABEL_36;
          case 3:
            unint64_t v8 = 0xD000000000000015;
            uint64_t v10 = "com.apple.mobilenotes";
            goto LABEL_39;
          case 4:
            Swift::Int v11 = "com.apple.reminders";
            goto LABEL_36;
          case 5:
            unint64_t v8 = 0xD000000000000012;
            uint64_t v10 = "com.apple.freeform";
            goto LABEL_39;
          case 6:
            unint64_t v8 = 0xD000000000000014;
            uint64_t v10 = "com.apple.VoiceMemos";
            goto LABEL_39;
          case 7:
            unint64_t v8 = 0xD000000000000015;
            uint64_t v10 = "com.apple.mobilephone";
            goto LABEL_39;
          case 8:
            Swift::Int v11 = "com.apple.MobileSMS";
            goto LABEL_36;
          case 9:
            unint64_t v8 = 0xD000000000000012;
            uint64_t v10 = "com.apple.facetime";
            goto LABEL_39;
          case 0xA:
            unint64_t v8 = 0xD000000000000016;
            uint64_t v10 = "com.apple.mobilesafari";
            goto LABEL_39;
          case 0xB:
            uint64_t v12 = 0x7377656E2E65;
            goto LABEL_26;
          case 0xC:
            unint64_t v8 = 0xD000000000000010;
            uint64_t v10 = "com.apple.stocks";
            goto LABEL_39;
          case 0xD:
            unint64_t v8 = 0xD000000000000011;
            uint64_t v10 = "com.apple.weather";
            goto LABEL_39;
          case 0xE:
            Swift::Int v11 = "com.apple.Translate";
            goto LABEL_36;
          case 0xF:
            uint64_t v12 = 0x7370614D2E65;
            goto LABEL_26;
          case 0x10:
            unint64_t v8 = 0xD000000000000011;
            uint64_t v10 = "com.apple.compass";
            goto LABEL_39;
          case 0x11:
            unint64_t v8 = 0xD000000000000011;
            uint64_t v10 = "com.apple.measure";
            goto LABEL_39;
          case 0x12:
            Swift::Int v11 = "com.apple.shortcuts";
            goto LABEL_36;
          case 0x13:
            unint64_t v8 = 0xD000000000000010;
            uint64_t v10 = "com.apple.Health";
            goto LABEL_39;
          case 0x14:
            unint64_t v8 = 0xD000000000000011;
            uint64_t v10 = "com.apple.Fitness";
            goto LABEL_39;
          case 0x15:
            uint64_t v12 = 0x656D6F482E65;
LABEL_26:
            unint64_t v9 = v12 & 0xFFFFFFFFFFFFLL | 0xEE00000000000000;
            goto LABEL_30;
          case 0x16:
            unint64_t v8 = 0xD000000000000011;
            uint64_t v10 = "com.apple.journal";
            goto LABEL_39;
          case 0x17:
            unint64_t v9 = 0xEF636973754D2E65;
            goto LABEL_30;
          case 0x18:
            unint64_t v9 = 0xEC00000076742E65;
LABEL_30:
            unint64_t v8 = 0x6C7070612E6D6F63;
            break;
          case 0x19:
            unint64_t v8 = 0xD000000000000019;
            uint64_t v10 = "com.apple.mobileslideshow";
            goto LABEL_39;
          case 0x1A:
            unint64_t v8 = 0xD000000000000010;
            uint64_t v10 = "com.apple.camera";
            goto LABEL_39;
          case 0x1B:
            unint64_t v8 = 0xD000000000000010;
            uint64_t v10 = "com.apple.iBooks";
            goto LABEL_39;
          case 0x1C:
            unint64_t v8 = 0xD000000000000012;
            uint64_t v10 = "com.apple.podcasts";
            goto LABEL_39;
          case 0x1D:
            Swift::Int v11 = "com.apple.Passwords";
LABEL_36:
            unint64_t v9 = (unint64_t)(v11 - 32) | 0x8000000000000000;
            unint64_t v8 = 0xD000000000000013;
            break;
          case 0x1E:
            unint64_t v8 = 0xD000000000000012;
            uint64_t v10 = "com.apple.AppStore";
            goto LABEL_39;
          case 0x1F:
            unint64_t v8 = 0xD000000000000012;
            uint64_t v10 = "com.apple.Passbook";
LABEL_39:
            unint64_t v9 = (unint64_t)(v10 - 32) | 0x8000000000000000;
            break;
          default:
            break;
        }
        unint64_t v13 = 0xD000000000000014;
        unint64_t v14 = 0x8000000000031510;
        switch(a1)
        {
          case 1:
            unint64_t v15 = 0xD00000000000001BLL;
            int64_t v16 = "com.apple.MobileAddressBook";
            goto LABEL_78;
          case 2:
            BOOL v17 = "com.apple.mobilecal";
            goto LABEL_73;
          case 3:
            unint64_t v15 = 0xD000000000000015;
            int64_t v16 = "com.apple.mobilenotes";
            goto LABEL_78;
          case 4:
            BOOL v17 = "com.apple.reminders";
            goto LABEL_73;
          case 5:
            unint64_t v15 = 0xD000000000000012;
            int64_t v16 = "com.apple.freeform";
            goto LABEL_78;
          case 6:
            unint64_t v15 = 0xD000000000000014;
            int64_t v16 = "com.apple.VoiceMemos";
            goto LABEL_78;
          case 7:
            unint64_t v15 = 0xD000000000000015;
            int64_t v16 = "com.apple.mobilephone";
            goto LABEL_78;
          case 8:
            BOOL v17 = "com.apple.MobileSMS";
            goto LABEL_73;
          case 9:
            unint64_t v15 = 0xD000000000000012;
            int64_t v16 = "com.apple.facetime";
            goto LABEL_78;
          case 10:
            unint64_t v15 = 0xD000000000000016;
            int64_t v16 = "com.apple.mobilesafari";
            goto LABEL_78;
          case 11:
            uint64_t v18 = 0x7377656E2E65;
            goto LABEL_62;
          case 12:
            unint64_t v15 = 0xD000000000000010;
            int64_t v16 = "com.apple.stocks";
            goto LABEL_78;
          case 13:
            unint64_t v15 = 0xD000000000000011;
            int64_t v16 = "com.apple.weather";
            goto LABEL_78;
          case 14:
            BOOL v17 = "com.apple.Translate";
            goto LABEL_73;
          case 15:
            uint64_t v18 = 0x7370614D2E65;
            goto LABEL_62;
          case 16:
            unint64_t v15 = 0xD000000000000011;
            int64_t v16 = "com.apple.compass";
            goto LABEL_78;
          case 17:
            unint64_t v15 = 0xD000000000000011;
            int64_t v16 = "com.apple.measure";
            goto LABEL_78;
          case 18:
            BOOL v17 = "com.apple.shortcuts";
            goto LABEL_73;
          case 19:
            unint64_t v15 = 0xD000000000000010;
            int64_t v16 = "com.apple.Health";
            goto LABEL_78;
          case 20:
            unint64_t v15 = 0xD000000000000011;
            int64_t v16 = "com.apple.Fitness";
            goto LABEL_78;
          case 21:
            uint64_t v18 = 0x656D6F482E65;
LABEL_62:
            unint64_t v14 = v18 & 0xFFFFFFFFFFFFLL | 0xEE00000000000000;
            goto LABEL_66;
          case 22:
            unint64_t v15 = 0xD000000000000011;
            int64_t v16 = "com.apple.journal";
            goto LABEL_78;
          case 23:
            unint64_t v14 = 0xEF636973754D2E65;
            goto LABEL_66;
          case 24:
            unint64_t v14 = 0xEC00000076742E65;
LABEL_66:
            if (v8 != 0x6C7070612E6D6F63) {
              goto LABEL_80;
            }
            goto LABEL_79;
          case 25:
            unint64_t v15 = 0xD000000000000019;
            int64_t v16 = "com.apple.mobileslideshow";
            goto LABEL_78;
          case 26:
            unint64_t v15 = 0xD000000000000010;
            int64_t v16 = "com.apple.camera";
            goto LABEL_78;
          case 27:
            unint64_t v15 = 0xD000000000000010;
            int64_t v16 = "com.apple.iBooks";
            goto LABEL_78;
          case 28:
            unint64_t v15 = 0xD000000000000012;
            int64_t v16 = "com.apple.podcasts";
            goto LABEL_78;
          case 29:
            BOOL v17 = "com.apple.Passwords";
LABEL_73:
            unint64_t v14 = (unint64_t)(v17 - 32) | 0x8000000000000000;
            unint64_t v13 = 0xD000000000000013;
            goto LABEL_74;
          case 30:
            unint64_t v15 = 0xD000000000000012;
            int64_t v16 = "com.apple.AppStore";
            goto LABEL_78;
          case 31:
            unint64_t v15 = 0xD000000000000012;
            int64_t v16 = "com.apple.Passbook";
LABEL_78:
            unint64_t v14 = (unint64_t)(v16 - 32) | 0x8000000000000000;
            if (v8 == v15) {
              goto LABEL_79;
            }
            goto LABEL_80;
          default:
LABEL_74:
            if (v8 != v13) {
              goto LABEL_80;
            }
LABEL_79:
            if (v9 == v14)
            {
              swift_bridgeObjectRelease_n();
              char v19 = 1;
              return v19 & 1;
            }
LABEL_80:
            char v19 = sub_2FA30();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (v19) {
              return v19 & 1;
            }
            unint64_t v6 = (v6 + 1) & v7;
            if (((*(void *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
              return v19 & 1;
            }
            break;
        }
      }
    }
  }
  char v19 = 0;
  return v19 & 1;
}

uint64_t sub_26BE4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  LOBYTE(v3) = v3();
  swift_release();

  return v3 & 1;
}

uint64_t sub_26C3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  unint64_t v8 = *(void *)(a2 + 16);
  int64_t v44 = v8;
  unint64_t v41 = *(void *)(a1 + 16);
  if (v8 >= v41) {
    unint64_t v8 = *(void *)(a1 + 16);
  }
  unint64_t v43 = *(void *)(a3 + 16);
  if (v43 >= v8) {
    int64_t v9 = v8;
  }
  else {
    int64_t v9 = *(void *)(a3 + 16);
  }
  uint64_t v50 = _swiftEmptyArrayStorage;
  sub_2B410(0, v9, 0);
  int64_t v10 = v9;
  Swift::Int v11 = _swiftEmptyArrayStorage;
  uint64_t v37 = a2;
  uint64_t v38 = a1;
  uint64_t v36 = a3;
  if (v9)
  {
    uint64_t v39 = a3 + 32;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v12 = a1;
    uint64_t v13 = 0;
    unint64_t v14 = (uint64_t *)(a2 + 40);
    unint64_t v15 = (uint64_t *)(v12 + 40);
    while (v41 != v13)
    {
      if (v44 == v13) {
        goto LABEL_32;
      }
      if (v43 == v13) {
        goto LABEL_33;
      }
      uint64_t v16 = *v15;
      uint64_t v17 = *v14;
      uint64_t v45 = *(v14 - 1);
      uint64_t v47 = *(v15 - 1);
      uint64_t v49 = *(void *)(v39 + 8 * v13);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      sub_29844(&v49);
      if (v4) {
        goto LABEL_36;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v18 = v49;
      uint64_t v50 = v11;
      unint64_t v20 = v11[2];
      unint64_t v19 = v11[3];
      if (v20 >= v19 >> 1)
      {
        uint64_t v35 = v49;
        sub_2B410(v19 > 1, v20 + 1, 1);
        uint64_t v18 = v35;
        Swift::Int v11 = v50;
      }
      ++v13;
      v11[2] = v20 + 1;
      uint64_t v21 = &v11[5 * v20];
      v21[4] = v47;
      v21[5] = v16;
      v21[6] = v45;
      v21[7] = v17;
      v21[8] = v18;
      v14 += 2;
      v15 += 2;
      int64_t v10 = v9;
      uint64_t v4 = 0;
      if (v9 == v13) {
        goto LABEL_17;
      }
    }
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
LABEL_17:
    unint64_t v22 = *(void *)(v38 + 16);
    if (v10 == v22)
    {
LABEL_18:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return (uint64_t)v11;
    }
    int64_t v24 = v44;
    if (v10 > v44) {
      int64_t v24 = v10;
    }
    int64_t v42 = v24;
    uint64_t v25 = 16 * v10 + 40;
    uint64_t v26 = (uint64_t *)(v38 + v25);
    uint64_t v27 = (uint64_t *)(v37 + v25);
    while (v10 < v22)
    {
      if (v44 == v10) {
        goto LABEL_18;
      }
      if (v42 == v10) {
        goto LABEL_35;
      }
      if (v43 == v10) {
        goto LABEL_18;
      }
      uint64_t v28 = *v26;
      uint64_t v29 = *v27;
      uint64_t v46 = *(v27 - 1);
      uint64_t v48 = *(v26 - 1);
      int64_t v30 = v10;
      uint64_t v49 = *(void *)(v36 + 32 + 8 * v10);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      sub_29844(&v49);
      if (v4) {
        goto LABEL_36;
      }
      uint64_t v4 = 0;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v31 = v49;
      uint64_t v50 = v11;
      unint64_t v33 = v11[2];
      unint64_t v32 = v11[3];
      if (v33 >= v32 >> 1)
      {
        uint64_t v40 = v49;
        sub_2B410(v32 > 1, v33 + 1, 1);
        uint64_t v31 = v40;
        Swift::Int v11 = v50;
      }
      ++v10;
      v11[2] = v33 + 1;
      BOOL v34 = &v11[5 * v33];
      v34[4] = v48;
      v34[5] = v28;
      v34[6] = v46;
      v34[7] = v29;
      v34[8] = v31;
      unint64_t v22 = *(void *)(v38 + 16);
      v26 += 2;
      v27 += 2;
      if (v30 + 1 == v22) {
        goto LABEL_18;
      }
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

void sub_26FDC()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    uint64_t KeyPath = swift_getKeyPath();
    __chkstk_darwin(KeyPath);
    sub_2AFF8((unint64_t *)&qword_3D710, (void (*)(uint64_t))type metadata accessor for AppsSettingsListViewModel);
    swift_bridgeObjectRetain();
    sub_2ED90();
    swift_bridgeObjectRelease();
    swift_release();
  }
  swift_beginAccess();
  uint64_t v3 = swift_unknownObjectWeakLoadStrong();
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    sub_27150();
  }
}

uint64_t sub_27150()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_5250(&qword_3D840);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  uint64_t v5 = v0 + OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel___observationRegistrar;
  uint64_t v30 = v1;
  uint64_t v6 = sub_2AFF8((unint64_t *)&qword_3D710, (void (*)(uint64_t))type metadata accessor for AppsSettingsListViewModel);
  sub_2EDA0();
  uint64_t result = swift_release();
  unint64_t v8 = *(void *)(v1 + OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel__currentSelection + 8);
  if (v8 != 4)
  {
    uint64_t v29 = v4;
    uint64_t v9 = *(void *)(v1 + OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel__currentSelection);
    swift_getKeyPath();
    uint64_t v30 = v1;
    sub_631C(v9, v8);
    v28[1] = v6;
    v28[2] = v5;
    sub_2EDA0();
    swift_release();
    uint64_t v10 = *(void *)(v1 + OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel__sections);
    uint64_t v11 = *(void *)(v10 + 16);
    if (v11)
    {
      uint64_t v12 = 0;
      uint64_t v13 = v10 + 32;
      do
      {
        uint64_t v14 = *(void *)(v13 + 40 * v12 + 32);
        uint64_t v15 = *(void *)(v14 + 16);
        if (v15)
        {
          uint64_t v16 = (unsigned char *)(v14 + 104);
          while (1)
          {
            uint64_t v18 = *((void *)v16 - 8);
            uint64_t v19 = *((void *)v16 - 2);
            char v20 = *v16;
            switch(v18)
            {
              case 0:
                if (v8) {
                  goto LABEL_11;
                }
                goto LABEL_7;
              case 1:
                if (v8 != 1) {
                  goto LABEL_11;
                }
                goto LABEL_7;
              case 2:
                if (v8 != 2) {
                  goto LABEL_11;
                }
                goto LABEL_7;
              case 3:
                if (v8 != 3) {
                  goto LABEL_11;
                }
                goto LABEL_7;
              default:
                if (v8 < 4) {
                  goto LABEL_11;
                }
                BOOL v21 = *((void *)v16 - 9) == v9 && v18 == v8;
                if (!v21 && (sub_2FA30() & 1) == 0) {
                  goto LABEL_11;
                }
LABEL_7:
                if (v20 >= 0) {
                  char v17 = v19;
                }
                else {
                  char v17 = v20;
                }
                if ((v17 & 1) == 0) {
                  return sub_9B0C(v9, v8);
                }
LABEL_11:
                v16 += 80;
                if (!--v15) {
                  goto LABEL_4;
                }
                break;
            }
          }
        }
LABEL_4:
        ++v12;
      }
      while (v12 != v11);
    }
    sub_9B0C(v9, v8);
    uint64_t KeyPath = swift_getKeyPath();
    __chkstk_darwin(KeyPath);
    v28[-4] = v1;
    *(_OWORD *)&v28[-3] = xmmword_30620;
    uint64_t v30 = v1;
    sub_2ED90();
    swift_release();
    uint64_t v23 = v1 + OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel_clearSettingsNavigationPath;
    swift_beginAccess();
    uint64_t v24 = v23;
    uint64_t v25 = (uint64_t)v29;
    sub_12A1C(v24, (uint64_t)v29, &qword_3D840);
    uint64_t v26 = sub_2EE60();
    uint64_t v27 = *(void *)(v26 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v27 + 48))(v25, 1, v26) == 1)
    {
      __break(1u);
      JUMPOUT(0x27500);
    }
    sub_2EE50();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v27 + 8))(v25, v26);
  }
  return result;
}

uint64_t sub_27510()
{
  id v0 = sub_1B2B0();
  swift_getKeyPath();
  sub_2AFF8((unint64_t *)&qword_3D870, (void (*)(uint64_t))type metadata accessor for HiddenAppsSettingsListViewModel);
  sub_2EDA0();

  return swift_release();
}

void sub_275B8()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    if (qword_3CC58 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_2EEF0();
    sub_D130(v2, (uint64_t)qword_3F088);
    uint64_t v3 = sub_2EED0();
    os_log_type_t v4 = sub_2F730();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_0, v3, v4, "Did receive hidden apps changed.", v5, 2u);
      swift_slowDealloc();
    }

    swift_retain();
    sub_5250(&qword_3D768);
    sub_8580(&qword_3D770, &qword_3D768);
    sub_2EF50();
    uint64_t v6 = swift_release();
    uint64_t v7 = __chkstk_darwin(v6);
    __chkstk_darwin(v7);
    sub_2ED80();
  }
}

uint64_t sub_277AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 152) = a4;
  return _swift_task_switch(sub_277CC, 0, 0);
}

uint64_t sub_277CC()
{
  id v1 = [self sharedGuard];
  v0[20] = v1;
  v0[2] = v0;
  v0[7] = v0 + 23;
  v0[3] = sub_278F0;
  uint64_t v2 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_27D7C;
  v0[13] = &unk_3A630;
  v0[14] = v2;
  [v1 authenticateUnconditionallyWithCompletion:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_278F0()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 168) = v1;
  if (v1) {
    uint64_t v2 = sub_27B48;
  }
  else {
    uint64_t v2 = sub_27A00;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_27A00()
{
  swift_unknownObjectWeakInit();
  sub_2F640();
  *(void *)(v0 + 176) = sub_2F630();
  uint64_t v2 = sub_2F620();
  return _swift_task_switch(sub_27AAC, v2, v1);
}

uint64_t sub_27AAC()
{
  swift_release();
  sub_27E30();
  swift_unknownObjectWeakDestroy();
  return _swift_task_switch(sub_27B34, 0, 0);
}

uint64_t sub_27B34()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_27B48()
{
  uint64_t v11 = v0;
  uint64_t v1 = (void *)v0[20];
  swift_willThrow();

  if (qword_3CC58 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2EEF0();
  sub_D130(v2, (uint64_t)qword_3F088);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v3 = sub_2EED0();
  os_log_type_t v4 = sub_2F710();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136446210;
    swift_getErrorValue();
    uint64_t v6 = sub_2FA70();
    v0[10] = sub_291EC(v6, v7, &v10);
    sub_2F820();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v3, v4, "Authentication Error: %{public}s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
  }
  unint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_27D7C(uint64_t a1, char a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_5250((uint64_t *)&unk_3D8E0);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    **(unsigned char **)(*(void *)(v3 + 64) + 40) = a2;
    return _swift_continuation_throwingResume(v3);
  }
}

uint64_t sub_27E30()
{
  uint64_t v0 = sub_5250(&qword_3D520);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)v13 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    os_log_type_t v4 = (void *)result;
    if (qword_3CC58 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_2EEF0();
    sub_D130(v5, (uint64_t)qword_3F088);
    uint64_t v6 = sub_2EED0();
    os_log_type_t v7 = sub_2F700();
    if (os_log_type_enabled(v6, v7))
    {
      unint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v8 = 0;
      _os_log_impl(&dword_0, v6, v7, "Presenting Hidden Apps.", v8, 2u);
      swift_slowDealloc();
    }

    uint64_t v9 = (uint64_t)v4 + OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel_appendSettingsNavigationPath;
    swift_beginAccess();
    sub_12A1C(v9, (uint64_t)v2, &qword_3D520);
    uint64_t v10 = sub_2EE80();
    uint64_t v11 = *(void *)(v10 - 8);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48))(v2, 1, v10);
    if (result == 1)
    {
      __break(1u);
    }
    else
    {
      sub_1A490();
      sub_2EE70();
      (*(void (**)(char *, uint64_t))(v11 + 8))(v2, v10);
      uint64_t KeyPath = swift_getKeyPath();
      __chkstk_darwin(KeyPath);
      v13[-4] = v4;
      *(_OWORD *)&v13[-3] = xmmword_312A0;
      v13[1] = v4;
      sub_2AFF8((unint64_t *)&qword_3D710, (void (*)(uint64_t))type metadata accessor for AppsSettingsListViewModel);
      sub_2ED90();

      return swift_release();
    }
  }
  return result;
}

uint64_t sub_2812C(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_2ED70();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  os_log_type_t v7 = &v24[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = sub_2EEF0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = &v24[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_3CC58 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_D130(v8, (uint64_t)qword_3F088);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v9 + 16))(v11, v12, v8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  id v13 = a1;
  uint64_t v14 = sub_2EED0();
  os_log_type_t v15 = sub_2F730();
  int v16 = v15;
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v26 = v4;
    uint64_t v18 = v17;
    uint64_t v27 = swift_slowAlloc();
    uint64_t v30 = v27;
    *(_DWORD *)uint64_t v18 = 136315907;
    int v25 = v16;
    swift_getObjectType();
    uint64_t v19 = sub_2FAB0();
    uint64_t v28 = v8;
    uint64_t v29 = sub_291EC(v19, v20, &v30);
    sub_2F820();

    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 12) = 2080;
    uint64_t v29 = sub_291EC(0x5255656C646E6168, 0xED0000293A5F284CLL, &v30);
    sub_2F820();
    *(_WORD *)(v18 + 22) = 2160;
    uint64_t v29 = 1752392040;
    sub_2F820();
    *(_WORD *)(v18 + 32) = 2081;
    uint64_t v21 = sub_2ED50();
    uint64_t v29 = sub_291EC(v21, v22, &v30);
    sub_2F820();
    swift_bridgeObjectRelease();
    (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v26);
    _os_log_impl(&dword_0, v14, (os_log_type_t)v25, "…Complete (%s.%s) url: '%{private,mask.hash}s'", (uint8_t *)v18, 0x2Au);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    return (*(uint64_t (**)(unsigned char *, uint64_t))(v9 + 8))(v11, v28);
  }
  else
  {

    (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
    return (*(uint64_t (**)(unsigned char *, uint64_t))(v9 + 8))(v11, v8);
  }
}

uint64_t sub_28520(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_5250(&qword_3D758);
    uint64_t v2 = (void *)sub_2FA00();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
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
  uint64_t v6 = (char *)(v2 + 8);
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v27) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v28 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v27) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v28 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v27) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v28 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v8 = v15;
LABEL_28:
    uint64_t v17 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_2D778(*(void *)(a1 + 56) + 40 * v12, (uint64_t)v46);
    uint64_t v44 = v19;
    uint64_t v45 = v18;
    long long v41 = v46[0];
    long long v42 = v46[1];
    uint64_t v43 = v47;
    uint64_t v31 = v19;
    uint64_t v32 = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    v29[0] = v41;
    v29[1] = v42;
    uint64_t v30 = v43;
    swift_dynamicCast();
    long long v37 = v33;
    long long v38 = v34;
    uint64_t v39 = v35;
    sub_2D7D4(&v36, v40);
    long long v33 = v37;
    long long v34 = v38;
    uint64_t v35 = v39;
    sub_2D7D4(v40, v29);
    sub_2D7D4(v29, &v37);
    uint64_t result = sub_2F920(v2[5]);
    uint64_t v20 = -1 << *((unsigned char *)v2 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)&v6[8 * (v21 >> 6)]) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v21) & ~*(void *)&v6[8 * (v21 >> 6)])) | v21 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v26 = *(void *)&v6[8 * v22];
      }
      while (v26 == -1);
      unint64_t v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)&v6[(v9 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v9;
    uint64_t v10 = v2[6] + 40 * v9;
    *(_OWORD *)uint64_t v10 = v33;
    *(_OWORD *)(v10 + 16) = v34;
    *(void *)(v10 + 32) = v35;
    uint64_t result = (uint64_t)sub_2D7D4(&v37, (_OWORD *)(v2[7] + 32 * v9));
    ++v2[2];
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_2D7E4();
    return (uint64_t)v2;
  }
  unint64_t v14 = *(void *)(v28 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_28920(void *a1, uint64_t a2, void *a3, uint64_t a4, const char *a5)
{
  if (a4) {
    sub_2F560();
  }
  uint64_t v8 = qword_3CC58;
  id v9 = a3;
  id v10 = a1;
  if (v8 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_2EEF0();
  sub_D130(v11, (uint64_t)qword_3F088);
  unint64_t v12 = sub_2EED0();
  os_log_type_t v13 = sub_2F730();
  if (os_log_type_enabled(v12, v13))
  {
    unint64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v14 = 0;
    _os_log_impl(&dword_0, v12, v13, a5, v14, 2u);
    swift_slowDealloc();
  }

  sub_5250(&qword_3D768);
  sub_8580(&qword_3D770, &qword_3D768);
  sub_2EF50();

  return swift_bridgeObjectRelease();
}

uint64_t sub_28B0C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_28BE8;
  return v6(a1);
}

uint64_t sub_28BE8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_28CE0(uint64_t (*a1)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v3 = *v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v1 = v3;
  if (!result)
  {
    uint64_t result = a1(result, *(void *)(v3 + 16) + 1, 1, v3);
    *uint64_t v1 = result;
  }
  return result;
}

uint64_t sub_28D3C(uint64_t result, uint64_t (*a2)(BOOL))
{
  unint64_t v3 = *(void *)(*(void *)v2 + 24);
  if (result + 1 > (uint64_t)(v3 >> 1))
  {
    uint64_t result = a2(v3 > 1);
    *(void *)uint64_t v2 = result;
  }
  return result;
}

char *sub_28D88(char *result, int64_t a2, char a3, char *a4)
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
      sub_5250(&qword_3D828);
      id v10 = (char *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 80);
      unint64_t v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[80 * v8 + 32]) {
          memmove(v12, a4 + 32, 80 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      id v10 = (char *)&_swiftEmptyArrayStorage;
      unint64_t v12 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result) {
        goto LABEL_13;
      }
    }
    sub_2CC8C(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_28EA8(void *result, int64_t a2, char a3, void *a4)
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
      sub_5250(&qword_3D848);
      id v10 = (void *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      _OWORD v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
      unint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[5 * v8 + 4]) {
          memmove(v12, a4 + 4, 40 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      id v10 = _swiftEmptyArrayStorage;
      unint64_t v12 = &_swiftEmptyArrayStorage[4];
      if (result) {
        goto LABEL_13;
      }
    }
    sub_2E1CC(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_28FCC(void *result, int64_t a2, char a3, void *a4)
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
      sub_5250(&qword_3D858);
      id v10 = (void *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      _OWORD v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      os_log_type_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      id v10 = _swiftEmptyArrayStorage;
      os_log_type_t v13 = &_swiftEmptyArrayStorage[4];
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4]) {
          memmove(v13, a4 + 4, 8 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_2E0C0(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_290DC(void *result, int64_t a2, char a3, void *a4)
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
      sub_5250(&qword_3D838);
      id v10 = (void *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      _OWORD v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      os_log_type_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      id v10 = _swiftEmptyArrayStorage;
      os_log_type_t v13 = &_swiftEmptyArrayStorage[4];
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
    sub_2DFA4(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_291EC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_292C0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_2D83C((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_2D83C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_2D7EC((uint64_t)v12);
  return v7;
}

uint64_t sub_292C0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2F830();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_2947C(a5, a6);
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
  uint64_t v8 = sub_2F9A0();
  if (!v8)
  {
    sub_2F9B0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_2FA10();
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

uint64_t sub_2947C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_29514(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_296F4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_296F4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_29514(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_2968C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_2F980();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_2F9B0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_2F5E0();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_2FA10();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_2F9B0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_2968C(uint64_t a1, uint64_t a2)
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
  sub_5250(&qword_3D760);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_296F4(char a1, int64_t a2, char a3, char *a4)
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
    sub_5250(&qword_3D760);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  os_log_type_t v13 = a4 + 32;
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
  uint64_t result = sub_2FA10();
  __break(1u);
  return result;
}

Swift::Int sub_29844(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_2C6A0(v2);
  }
  uint64_t v3 = *(void *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  Swift::Int result = sub_298B0(v5);
  *a1 = v2;
  return result;
}

Swift::Int sub_298B0(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  Swift::Int result = sub_2FA20(v3);
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_150;
    }
    if (v3) {
      return sub_2A110(0, v3, 1, a1);
    }
    return result;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_158;
  }
  Swift::Int v111 = result;
  uint64_t v108 = a1;
  if (v3 < 2)
  {
    int64_t v8 = &_swiftEmptyArrayStorage;
    Swift::String v119 = (char *)&_swiftEmptyArrayStorage + 32;
    if (v3 != 1)
    {
      unint64_t v12 = *((void *)&_swiftEmptyArrayStorage + 2);
      size_t v11 = (char *)&_swiftEmptyArrayStorage;
LABEL_116:
      uint64_t v99 = v11;
      Swift::String v110 = v8;
      if (v12 >= 2)
      {
        uint64_t v100 = *v108;
        do
        {
          unint64_t v101 = v12 - 2;
          if (v12 < 2) {
            goto LABEL_145;
          }
          if (!v100) {
            goto LABEL_157;
          }
          uint64_t v102 = v99;
          uint64_t v103 = *(void *)&v99[16 * v101 + 32];
          uint64_t v104 = *(void *)&v99[16 * v12 + 24];
          sub_2A244((char *)(v100 + 80 * v103), (char *)(v100 + 80 * *(void *)&v99[16 * v12 + 16]), v100 + 80 * v104, v119);
          if (v1) {
            break;
          }
          if (v104 < v103) {
            goto LABEL_146;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v102 = sub_2A74C((uint64_t)v102);
          }
          if (v101 >= *((void *)v102 + 2)) {
            goto LABEL_147;
          }
          Swift::String v105 = &v102[16 * v101 + 32];
          *(void *)Swift::String v105 = v103;
          *((void *)v105 + 1) = v104;
          unint64_t v106 = *((void *)v102 + 2);
          if (v12 > v106) {
            goto LABEL_148;
          }
          memmove(&v102[16 * v12 + 16], &v102[16 * v12 + 32], 16 * (v106 - v12));
          uint64_t v99 = v102;
          *((void *)v102 + 2) = v106 - 1;
          unint64_t v12 = v106 - 1;
        }
        while (v106 > 2);
      }
LABEL_113:
      swift_bridgeObjectRelease();
      v110[2] = 0;
      return swift_bridgeObjectRelease();
    }
    Swift::String v110 = &_swiftEmptyArrayStorage;
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    uint64_t v7 = sub_2F610();
    *(void *)(v7 + 16) = v6;
    Swift::String v110 = (void *)v7;
    Swift::String v119 = (char *)(v7 + 32);
  }
  Swift::Int v9 = 0;
  uint64_t v10 = *a1;
  uint64_t v109 = *a1 + 72;
  uint64_t v107 = *a1 - 80;
  size_t v11 = (char *)&_swiftEmptyArrayStorage;
  Swift::Int v116 = v3;
  uint64_t v120 = *a1;
  while (1)
  {
    Swift::Int v13 = v9++;
    if (v9 >= v3)
    {
      Swift::Int v16 = v13;
      goto LABEL_44;
    }
    Swift::Int v117 = v13;
    int v14 = *(char *)(v10 + 80 * v13 + 72);
    if ((*(char *)(v10 + 80 * v9 + 72) & 0x80000000) == 0)
    {
      if (v14 < 0) {
        break;
      }
      goto LABEL_19;
    }
    if ((v14 & 0x80000000) == 0) {
      break;
    }
LABEL_19:
    sub_B45C();
    BOOL v15 = sub_2F860() == -1;
    Swift::Int v16 = v117;
    Swift::Int v17 = v117 + 2;
    if (v117 + 2 < v116) {
      goto LABEL_25;
    }
LABEL_32:
    Swift::Int v9 = v17;
    if (v15) {
      goto LABEL_35;
    }
LABEL_44:
    if (v9 < v116)
    {
      if (__OFSUB__(v9, v16)) {
        goto LABEL_149;
      }
      if (v9 - v16 < v111)
      {
        if (__OFADD__(v16, v111)) {
          goto LABEL_151;
        }
        Swift::Int v31 = v16;
        if (v16 + v111 >= v116) {
          Swift::Int v32 = v116;
        }
        else {
          Swift::Int v32 = v16 + v111;
        }
        uint64_t v118 = v31;
        if (v32 < v31)
        {
LABEL_152:
          __break(1u);
          goto LABEL_153;
        }
        if (v9 != v32)
        {
          uint64_t v33 = v107 + 80 * v9;
          do
          {
            uint64_t v34 = v118;
            uint64_t v35 = v33;
            do
            {
              int v36 = *(char *)(v35 + 72);
              if (*(char *)(v35 + 152) < 0)
              {
                if ((v36 & 0x80000000) == 0) {
                  break;
                }
              }
              else if (v36 < 0)
              {
                break;
              }
              sub_B45C();
              if (sub_2F860() != -1) {
                break;
              }
              if (!v10) {
                goto LABEL_154;
              }
              long long v37 = (_OWORD *)(v35 + 80);
              uint64_t v38 = *(void *)(v35 + 144);
              char v39 = *(unsigned char *)(v35 + 152);
              long long v40 = *(_OWORD *)(v35 + 96);
              long long v41 = *(_OWORD *)(v35 + 112);
              long long v42 = *(_OWORD *)(v35 + 128);
              long long v43 = *(_OWORD *)(v35 + 48);
              long long v45 = *(_OWORD *)(v35 + 64);
              long long v44 = *(_OWORD *)(v35 + 80);
              *(_OWORD *)(v35 + 112) = *(_OWORD *)(v35 + 32);
              *(_OWORD *)(v35 + 128) = v43;
              *(_OWORD *)(v35 + 144) = v45;
              long long v47 = *(_OWORD *)v35;
              long long v46 = *(_OWORD *)(v35 + 16);
              *(_OWORD *)uint64_t v35 = v44;
              *(_OWORD *)(v35 + 16) = v40;
              *(_OWORD *)(v35 + 32) = v41;
              *(_OWORD *)(v35 + 48) = v42;
              *(void *)(v35 + 64) = v38;
              *(unsigned char *)(v35 + 72) = v39;
              v35 -= 80;
              ++v34;
              *long long v37 = v47;
              v37[1] = v46;
            }
            while (v9 != v34);
            ++v9;
            v33 += 80;
          }
          while (v9 != v32);
          Swift::Int v9 = v32;
        }
        Swift::Int v16 = v118;
      }
    }
    if (v9 < v16) {
      goto LABEL_144;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      size_t v11 = sub_2A588(0, *((void *)v11 + 2) + 1, 1, v11);
    }
    unint64_t v49 = *((void *)v11 + 2);
    unint64_t v48 = *((void *)v11 + 3);
    unint64_t v12 = v49 + 1;
    if (v49 >= v48 >> 1) {
      size_t v11 = sub_2A588((char *)(v48 > 1), v49 + 1, 1, v11);
    }
    *((void *)v11 + 2) = v12;
    uint64_t v50 = v11 + 32;
    uint64_t v51 = &v11[16 * v49 + 32];
    *(void *)uint64_t v51 = v16;
    *((void *)v51 + 1) = v9;
    if (v49)
    {
      while (1)
      {
        unint64_t v52 = v12 - 1;
        if (v12 >= 4)
        {
          uint64_t v57 = &v50[16 * v12];
          uint64_t v58 = *((void *)v57 - 8);
          uint64_t v59 = *((void *)v57 - 7);
          BOOL v63 = __OFSUB__(v59, v58);
          uint64_t v60 = v59 - v58;
          if (v63) {
            goto LABEL_133;
          }
          uint64_t v62 = *((void *)v57 - 6);
          uint64_t v61 = *((void *)v57 - 5);
          BOOL v63 = __OFSUB__(v61, v62);
          uint64_t v55 = v61 - v62;
          char v56 = v63;
          if (v63) {
            goto LABEL_134;
          }
          unint64_t v64 = v12 - 2;
          uint64_t v65 = &v50[16 * v12 - 32];
          uint64_t v67 = *(void *)v65;
          uint64_t v66 = *((void *)v65 + 1);
          BOOL v63 = __OFSUB__(v66, v67);
          uint64_t v68 = v66 - v67;
          if (v63) {
            goto LABEL_136;
          }
          BOOL v63 = __OFADD__(v55, v68);
          uint64_t v69 = v55 + v68;
          if (v63) {
            goto LABEL_139;
          }
          if (v69 >= v60)
          {
            uint64_t v87 = &v50[16 * v52];
            uint64_t v89 = *(void *)v87;
            uint64_t v88 = *((void *)v87 + 1);
            BOOL v63 = __OFSUB__(v88, v89);
            uint64_t v90 = v88 - v89;
            if (v63) {
              goto LABEL_143;
            }
            BOOL v80 = v55 < v90;
            goto LABEL_103;
          }
        }
        else
        {
          if (v12 != 3)
          {
            uint64_t v81 = *((void *)v11 + 4);
            uint64_t v82 = *((void *)v11 + 5);
            BOOL v63 = __OFSUB__(v82, v81);
            uint64_t v74 = v82 - v81;
            char v75 = v63;
            goto LABEL_97;
          }
          uint64_t v54 = *((void *)v11 + 4);
          uint64_t v53 = *((void *)v11 + 5);
          BOOL v63 = __OFSUB__(v53, v54);
          uint64_t v55 = v53 - v54;
          char v56 = v63;
        }
        if (v56) {
          goto LABEL_135;
        }
        unint64_t v64 = v12 - 2;
        int v70 = &v50[16 * v12 - 32];
        uint64_t v72 = *(void *)v70;
        uint64_t v71 = *((void *)v70 + 1);
        BOOL v73 = __OFSUB__(v71, v72);
        uint64_t v74 = v71 - v72;
        char v75 = v73;
        if (v73) {
          goto LABEL_138;
        }
        NSBundle v76 = &v50[16 * v52];
        uint64_t v78 = *(void *)v76;
        uint64_t v77 = *((void *)v76 + 1);
        BOOL v63 = __OFSUB__(v77, v78);
        uint64_t v79 = v77 - v78;
        if (v63) {
          goto LABEL_141;
        }
        if (__OFADD__(v74, v79)) {
          goto LABEL_142;
        }
        if (v74 + v79 >= v55)
        {
          BOOL v80 = v55 < v79;
LABEL_103:
          if (v80) {
            unint64_t v52 = v64;
          }
          goto LABEL_105;
        }
LABEL_97:
        if (v75) {
          goto LABEL_137;
        }
        unsigned __int8 v83 = &v50[16 * v52];
        uint64_t v85 = *(void *)v83;
        uint64_t v84 = *((void *)v83 + 1);
        BOOL v63 = __OFSUB__(v84, v85);
        uint64_t v86 = v84 - v85;
        if (v63) {
          goto LABEL_140;
        }
        if (v86 < v74) {
          goto LABEL_15;
        }
LABEL_105:
        unint64_t v91 = v52 - 1;
        if (v52 - 1 >= v12)
        {
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
          goto LABEL_152;
        }
        if (!v10) {
          goto LABEL_155;
        }
        id v92 = v11;
        uint64_t v93 = v10;
        uint64_t v94 = &v50[16 * v91];
        uint64_t v95 = *(void *)v94;
        uint64_t v96 = &v50[16 * v52];
        uint64_t v97 = *((void *)v96 + 1);
        sub_2A244((char *)(v93 + 80 * *(void *)v94), (char *)(v93 + 80 * *(void *)v96), v93 + 80 * v97, v119);
        if (v1) {
          goto LABEL_113;
        }
        if (v97 < v95) {
          goto LABEL_130;
        }
        if (v52 > *((void *)v92 + 2)) {
          goto LABEL_131;
        }
        *(void *)uint64_t v94 = v95;
        *(void *)&v50[16 * v91 + 8] = v97;
        unint64_t v98 = *((void *)v92 + 2);
        if (v52 >= v98) {
          goto LABEL_132;
        }
        size_t v11 = v92;
        unint64_t v12 = v98 - 1;
        memmove(&v50[16 * v52], v96 + 16, 16 * (v98 - 1 - v52));
        *((void *)v92 + 2) = v98 - 1;
        uint64_t v10 = v120;
        if (v98 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v12 = 1;
LABEL_15:
    Swift::Int v3 = v116;
    if (v9 >= v116)
    {
      int64_t v8 = v110;
      goto LABEL_116;
    }
  }
  Swift::Int v17 = v117 + 2;
  if (v117 + 2 >= v3)
  {
    Swift::Int v9 = v117 + 2;
    Swift::Int v16 = v117;
    goto LABEL_44;
  }
  BOOL v15 = 0;
  Swift::Int v16 = v117;
LABEL_25:
  uint64_t v18 = (char *)(v109 + 80 * v17);
  while (2)
  {
    int v20 = *(char *)(v10 + 80 * v9 + 72);
    if (*v18 < 0)
    {
      if ((v20 & 0x80000000) == 0) {
        goto LABEL_27;
      }
LABEL_31:
      sub_B45C();
      if (((v15 ^ (sub_2F860() != -1)) & 1) == 0) {
        goto LABEL_32;
      }
    }
    else
    {
      if ((v20 & 0x80000000) == 0) {
        goto LABEL_31;
      }
LABEL_27:
      if (v15) {
        goto LABEL_35;
      }
    }
    v18 += 80;
    Swift::Int v19 = v17 + 1;
    Swift::Int v9 = v17;
    Swift::Int v17 = v19;
    if (v19 < v116) {
      continue;
    }
    break;
  }
  Swift::Int v17 = v19;
  Swift::Int v9 = v19;
  if (!v15) {
    goto LABEL_44;
  }
LABEL_35:
  if (v17 >= v16)
  {
    if (v16 < v17)
    {
      uint64_t v21 = 80 * v17;
      uint64_t v22 = 80 * v16;
      Swift::Int v23 = v17;
      Swift::Int v24 = v16;
      do
      {
        if (v24 != --v23)
        {
          if (!v10) {
            goto LABEL_156;
          }
          BOOL v25 = v11;
          uint64_t v26 = (long long *)(v10 + v22);
          uint64_t v27 = v10 + v21;
          uint64_t v28 = (const void *)(v10 + v21 - 80);
          uint64_t v29 = *(void *)(v10 + v22 + 64);
          char v30 = *(unsigned char *)(v10 + v22 + 72);
          long long v114 = v26[1];
          long long v115 = *v26;
          long long v112 = v26[3];
          long long v113 = v26[2];
          memmove(v26, v28, 0x50uLL);
          *(_OWORD *)(v27 - 80) = v115;
          *(_OWORD *)(v27 - 64) = v114;
          *(_OWORD *)(v27 - 48) = v113;
          *(_OWORD *)(v27 - 32) = v112;
          *(void *)(v27 - 16) = v29;
          *(unsigned char *)(v27 - 8) = v30;
          uint64_t v10 = v120;
          size_t v11 = v25;
          Swift::Int v16 = v117;
        }
        ++v24;
        v21 -= 80;
        v22 += 80;
      }
      while (v24 < v23);
    }
    Swift::Int v9 = v17;
    goto LABEL_44;
  }
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
  Swift::Int result = sub_2F9B0();
  __break(1u);
  return result;
}

uint64_t sub_2A110(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 80 * a3 - 80;
LABEL_5:
    uint64_t v9 = v6;
    uint64_t v10 = v8;
    while (1)
    {
      int v11 = *(char *)(v10 + 72);
      if (*(char *)(v10 + 152) < 0)
      {
        if ((v11 & 0x80000000) == 0) {
          goto LABEL_4;
        }
      }
      else if (v11 < 0)
      {
        goto LABEL_4;
      }
      sub_B45C();
      Swift::Int result = sub_2F860();
      if (result != -1)
      {
LABEL_4:
        ++v4;
        v8 += 80;
        if (v4 == a2) {
          return result;
        }
        goto LABEL_5;
      }
      if (!v7) {
        break;
      }
      unint64_t v12 = (_OWORD *)(v10 + 80);
      uint64_t v13 = *(void *)(v10 + 144);
      char v14 = *(unsigned char *)(v10 + 152);
      long long v15 = *(_OWORD *)(v10 + 96);
      long long v16 = *(_OWORD *)(v10 + 112);
      long long v17 = *(_OWORD *)(v10 + 128);
      long long v18 = *(_OWORD *)(v10 + 48);
      long long v20 = *(_OWORD *)(v10 + 64);
      long long v19 = *(_OWORD *)(v10 + 80);
      *(_OWORD *)(v10 + 112) = *(_OWORD *)(v10 + 32);
      *(_OWORD *)(v10 + 128) = v18;
      *(_OWORD *)(v10 + 144) = v20;
      long long v22 = *(_OWORD *)v10;
      long long v21 = *(_OWORD *)(v10 + 16);
      *(_OWORD *)uint64_t v10 = v19;
      *(_OWORD *)(v10 + 16) = v15;
      *(_OWORD *)(v10 + 32) = v16;
      *(_OWORD *)(v10 + 48) = v17;
      *(void *)(v10 + 64) = v13;
      *(unsigned char *)(v10 + 72) = v14;
      v10 -= 80;
      ++v9;
      _OWORD *v12 = v22;
      v12[1] = v21;
      if (v4 == v9) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_2A244(char *__dst, char *__src, unint64_t a3, char *a4)
{
  uint64_t v4 = a4;
  uint64_t v6 = __src;
  uint64_t v7 = __dst;
  int64_t v8 = __src - __dst;
  int64_t v9 = (__src - __dst) / 80;
  uint64_t v10 = a3 - (void)__src;
  uint64_t v11 = (uint64_t)(a3 - (void)__src) / 80;
  uint64_t v28 = __dst;
  uint64_t v27 = a4;
  if (v9 >= v11)
  {
    if (v10 < -79) {
      goto LABEL_51;
    }
    uint64_t v18 = 80 * v11;
    if (a4 != __src || &__src[v18] <= a4) {
      memmove(a4, __src, 80 * v11);
    }
    long long v19 = &v4[v18];
    uint64_t v26 = &v4[v18];
    uint64_t v28 = v6;
    if (v7 >= v6 || v10 < 80)
    {
LABEL_50:
      sub_2A684((void **)&v28, (const void **)&v27, &v26);
      return 1;
    }
    long long v20 = (char *)(a3 - 80);
    while (1)
    {
      long long v21 = v20 + 80;
      int v22 = *(v6 - 8);
      if (*(v19 - 8) < 0)
      {
        if ((v22 & 0x80000000) == 0) {
          goto LABEL_37;
        }
      }
      else if (v22 < 0)
      {
        goto LABEL_37;
      }
      sub_B45C();
      if (sub_2F860() != -1)
      {
LABEL_37:
        unint64_t v23 = (unint64_t)(v19 - 80);
        uint64_t v26 = v19 - 80;
        if (v21 < v19 || v20 >= v19 || v21 != v19) {
          memmove(v20, v19 - 80, 0x50uLL);
        }
        Swift::Int v24 = v6;
        v19 -= 80;
        if (v23 <= (unint64_t)v4) {
          goto LABEL_50;
        }
        goto LABEL_42;
      }
      Swift::Int v24 = v6 - 80;
      if (v21 != v6 || v20 >= v6) {
        memmove(v20, v6 - 80, 0x50uLL);
      }
      uint64_t v28 = v6 - 80;
      if (v19 <= v4) {
        goto LABEL_50;
      }
LABEL_42:
      v20 -= 80;
      uint64_t v6 = v24;
      if (v24 <= v7) {
        goto LABEL_50;
      }
    }
  }
  if (v8 >= -79)
  {
    size_t v12 = 80 * v9;
    if (a4 != __dst || &__dst[v12] <= a4) {
      memmove(a4, __dst, v12);
    }
    uint64_t v13 = &v4[v12];
    uint64_t v26 = &v4[v12];
    if ((unint64_t)v6 < a3 && v8 >= 80)
    {
      char v14 = v4;
      while (1)
      {
        int v15 = v14[72];
        if (v6[72] < 0)
        {
          if ((v15 & 0x80000000) == 0) {
            goto LABEL_14;
          }
        }
        else if (v15 < 0)
        {
          goto LABEL_14;
        }
        sub_B45C();
        if (sub_2F860() == -1)
        {
          long long v17 = v6 + 80;
          long long v16 = v6;
          if (v7 == v6 && v7 < v17) {
            goto LABEL_19;
          }
          goto LABEL_18;
        }
LABEL_14:
        uint64_t v4 = v14 + 80;
        long long v16 = v14;
        long long v17 = v6;
        if (v7 == v14)
        {
          v14 += 80;
          if (v7 < v4) {
            goto LABEL_19;
          }
        }
        else
        {
          v14 += 80;
        }
LABEL_18:
        memmove(v7, v16, 0x50uLL);
LABEL_19:
        v7 += 80;
        if (v14 < v13)
        {
          uint64_t v6 = v17;
          if ((unint64_t)v17 < a3) {
            continue;
          }
        }
        uint64_t v27 = v4;
        uint64_t v28 = v7;
        goto LABEL_50;
      }
    }
    goto LABEL_50;
  }
LABEL_51:
  uint64_t result = sub_2FA10();
  __break(1u);
  return result;
}

char *sub_2A588(char *result, int64_t a2, char a3, char *a4)
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
    sub_5250(&qword_3D850);
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
  uint64_t v13 = v10 + 32;
  char v14 = a4 + 32;
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

char *sub_2A684(void **a1, const void **a2, void *a3)
{
  Swift::Int v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  if (v4 <= -80)
  {
    uint64_t result = (char *)sub_2FA10();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    size_t v6 = 80 * (v4 / 80);
    if (result != v3 || result >= &v3[v6])
    {
      return (char *)memmove(result, v3, v6);
    }
  }
  return result;
}

char *sub_2A74C(uint64_t a1)
{
  return sub_2A588(0, *(void *)(a1 + 16), 0, (char *)a1);
}

unint64_t sub_2A760(uint64_t a1, uint64_t a2)
{
  sub_2FA80();
  sub_2F5C0();
  Swift::Int v4 = sub_2FAA0();

  return sub_2A7D8(a1, a2, v4);
}

unint64_t sub_2A7D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_2FA30() & 1) == 0)
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
      while (!v14 && (sub_2FA30() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_2A8BC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_5250(&qword_3D750);
  char v42 = a2;
  uint64_t v6 = sub_2F9F0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v41 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  char v39 = v2;
  int64_t v40 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_22;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v21 >= v40) {
      break;
    }
    int v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v41 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v40) {
        goto LABEL_34;
      }
      unint64_t v23 = *(void *)(v41 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v40)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v39;
          if ((v42 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v23 = *(void *)(v41 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_43;
            }
            if (v13 >= v40) {
              goto LABEL_34;
            }
            unint64_t v23 = *(void *)(v41 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_21;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_21:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_22:
    BOOL v25 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v27 = *v25;
    uint64_t v26 = v25[1];
    uint64_t v28 = *(void *)(v5 + 56) + 40 * v20;
    if (v42)
    {
      long long v29 = *(_OWORD *)v28;
      long long v30 = *(_OWORD *)(v28 + 16);
      uint64_t v45 = *(void *)(v28 + 32);
      long long v43 = v29;
      long long v44 = v30;
    }
    else
    {
      sub_2D778(v28, (uint64_t)&v43);
      swift_bridgeObjectRetain();
    }
    sub_2FA80();
    sub_2F5C0();
    uint64_t result = sub_2FAA0();
    uint64_t v31 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v32 = result & ~v31;
    unint64_t v33 = v32 >> 6;
    if (((-1 << v32) & ~*(void *)(v11 + 8 * (v32 >> 6))) != 0)
    {
      unint64_t v14 = __clz(__rbit64((-1 << v32) & ~*(void *)(v11 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v34 = 0;
      unint64_t v35 = (unint64_t)(63 - v31) >> 6;
      do
      {
        if (++v33 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v36 = v33 == v35;
        if (v33 == v35) {
          unint64_t v33 = 0;
        }
        v34 |= v36;
        uint64_t v37 = *(void *)(v11 + 8 * v33);
      }
      while (v37 == -1);
      unint64_t v14 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    int v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
    *int v15 = v27;
    v15[1] = v26;
    uint64_t v16 = *(void *)(v7 + 56) + 40 * v14;
    long long v17 = v43;
    long long v18 = v44;
    *(void *)(v16 + 32) = v45;
    *(_OWORD *)uint64_t v16 = v17;
    *(_OWORD *)(v16 + 16) = v18;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  int v22 = (void *)(v5 + 64);
  if ((v42 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v38 = 1 << *(unsigned char *)(v5 + 32);
  if (v38 >= 64) {
    bzero(v22, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int v22 = -1 << v38;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

unint64_t sub_2ABF4(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_2F880();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_2FA80();
        swift_bridgeObjectRetain();
        sub_2F5C0();
        Swift::Int v11 = sub_2FAA0();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v12 = v11 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v12 < v8) {
            goto LABEL_5;
          }
        }
        else if (v12 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v12)
        {
LABEL_11:
          uint64_t v13 = *(void *)(a2 + 48);
          unint64_t v14 = (_OWORD *)(v13 + 16 * v3);
          int v15 = (_OWORD *)(v13 + 16 * v6);
          if (v3 != v6 || v14 >= v15 + 1) {
            *unint64_t v14 = *v15;
          }
          uint64_t v16 = *(void *)(a2 + 56);
          unint64_t v17 = v16 + 40 * v3;
          long long v18 = (long long *)(v16 + 40 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v17 >= (unint64_t)v18 + 40))
          {
            long long v9 = *v18;
            long long v10 = v18[1];
            *(void *)(v17 + 32) = *((void *)v18 + 4);
            *(_OWORD *)unint64_t v17 = v9;
            *(_OWORD *)(v17 + 16) = v10;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v20 = *v19;
    uint64_t v21 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v21 = *v19;
    uint64_t v20 = (-1 << result) - 1;
  }
  *unint64_t v19 = v21 & v20;
  uint64_t v22 = *(void *)(a2 + 16);
  BOOL v23 = __OFSUB__(v22, 1);
  uint64_t v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v24;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_2ADE0(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_2A760(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_18;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_2B040();
LABEL_7:
    long long v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7] + 40 * v12;
      return sub_2B238(a1, v19);
    }
    goto LABEL_13;
  }
  sub_2A8BC(v15, a4 & 1);
  unint64_t v21 = sub_2A760(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_19:
    uint64_t result = sub_2FA60();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  long long v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_13:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  BOOL v23 = (uint64_t *)(v18[6] + 16 * v12);
  *BOOL v23 = a2;
  v23[1] = a3;
  uint64_t v24 = v18[7] + 40 * v12;
  long long v25 = *(_OWORD *)a1;
  long long v26 = *(_OWORD *)(a1 + 16);
  *(void *)(v24 + 32) = *(void *)(a1 + 32);
  *(_OWORD *)uint64_t v24 = v25;
  *(_OWORD *)(v24 + 16) = v26;
  uint64_t v27 = v18[2];
  BOOL v28 = __OFADD__(v27, 1);
  uint64_t v29 = v27 + 1;
  if (v28)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v18[2] = v29;

  return swift_bridgeObjectRetain();
}

uint64_t sub_2AF70(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_5250(&qword_3D440);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_2AFE0()
{
  return sub_2E89C();
}

uint64_t sub_2AFF8(unint64_t *a1, void (*a2)(uint64_t))
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

void *sub_2B040()
{
  uint64_t v1 = v0;
  sub_5250(&qword_3D750);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2F9E0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    *uint64_t v1 = v4;
    return result;
  }
  BOOL v28 = v1;
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v25 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      int64_t v9 = v25 + 1;
      if (v25 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v6 + 8 * v9);
      if (!v26) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v26 - 1) & v26;
    unint64_t v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 40 * v15;
    sub_2D778(*(void *)(v2 + 56) + 40 * v15, (uint64_t)v29);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = v19;
    v21[1] = v18;
    uint64_t v22 = *(void *)(v4 + 56) + v20;
    uint64_t v23 = v30;
    long long v24 = v29[1];
    *(_OWORD *)uint64_t v22 = v29[0];
    *(_OWORD *)(v22 + 16) = v24;
    *(void *)(v22 + 32) = v23;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v27 = v25 + 2;
  if (v27 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v28;
    goto LABEL_28;
  }
  unint64_t v26 = *(void *)(v6 + 8 * v27);
  if (v26)
  {
    int64_t v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v9);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_2B238(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_2B294(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *v1;
  int64_t v4 = *((void *)*v1 + 2);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *((void *)v3 + 3) >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v14 = v4 + v2;
  }
  else {
    int64_t v14 = v4;
  }
  uint64_t v3 = sub_28D88(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = *((void *)v3 + 2);
  if ((*((void *)v3 + 3) >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v9 = (unint64_t)&v3[80 * v8 + 32];
  if (a1 + 32 < v9 + 80 * v2 && v9 < a1 + 32 + 80 * v2) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return result;
  }
  uint64_t v11 = *((void *)v3 + 2);
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    *((void *)v3 + 2) = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_2FA10();
  __break(1u);
  return result;
}

uint64_t sub_2B3F0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2B470(a1, a2, a3, *v3);
  char *v3 = (char *)result;
  return result;
}

uint64_t sub_2B410(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2B5E8(a1, a2, a3, *v3);
  char *v3 = (char *)result;
  return result;
}

uint64_t sub_2B430(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2B76C(a1, a2, a3, *v3);
  char *v3 = (char *)result;
  return result;
}

uint64_t sub_2B450(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2B8D8(a1, a2, a3, (void *)*v3);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_2B470(char a1, int64_t a2, char a3, char *a4)
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_5250(&qword_3D828);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 80);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  BOOL v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  size_t v14 = 80 * v8;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v14]) {
      memmove(v12, v13, v14);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v14] || v12 >= &v13[v14])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_2FA10();
  __break(1u);
  return result;
}

uint64_t sub_2B5E8(char a1, int64_t a2, char a3, char *a4)
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_5250(&qword_3D848);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  BOOL v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[40 * v8]) {
      memmove(v12, v13, 40 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[40 * v8] || v12 >= &v13[40 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_2FA10();
  __break(1u);
  return result;
}

uint64_t sub_2B76C(char a1, int64_t a2, char a3, char *a4)
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
    sub_5250(&qword_3D838);
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
  uint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
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
  uint64_t result = sub_2FA10();
  __break(1u);
  return result;
}

uint64_t sub_2B8D8(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_5250(&qword_3D858);
    uint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    _OWORD v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = _swiftEmptyArrayStorage;
  }
  unint64_t v13 = (unint64_t)(v10 + 4);
  unint64_t v14 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v13 >= v14 + 8 * v8) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 8 * v8 || v13 >= v14 + 8 * v8)
  {
    sub_5250(&qword_3D860);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_2FA10();
  __break(1u);
  return result;
}

uint64_t sub_2BA64(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  sub_2FA80();
  swift_bridgeObjectRetain();
  sub_2F5C0();
  Swift::Int v8 = sub_2FAA0();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_2FA30() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
      Swift::Int v15 = v14[1];
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
      if (v19 || (sub_2FA30() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_2C0A0(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  uint64_t *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

char *sub_2BC14(uint64_t a1, int64_t a2, uint64_t a3)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  int64_t v5 = *(void **)v3;
  int64_t v6 = *(void *)(*(void *)v3 + 16);
  if (v6 < a2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v8 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v9 = 1 - v8;
  if (__OFSUB__(1, v8))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  int64_t v10 = v6 + v9;
  if (__OFADD__(v6, v9))
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v10 > v5[3] >> 1)
  {
    if (v6 <= v10) {
      int64_t v13 = v6 + v9;
    }
    else {
      int64_t v13 = v6;
    }
    int64_t v5 = sub_28EA8(isUniquelyReferenced_nonNull_native, v13, 1, v5);
  }
  uint64_t v14 = (uint64_t)&v5[5 * a1 + 4];
  uint64_t result = (char *)swift_arrayDestroy();
  if (!v9) {
    goto LABEL_20;
  }
  uint64_t v16 = v5[2];
  BOOL v17 = __OFSUB__(v16, a2);
  uint64_t v18 = v16 - a2;
  if (v17) {
    goto LABEL_26;
  }
  if ((v18 & 0x8000000000000000) == 0)
  {
    uint64_t result = (char *)(v14 + 40);
    BOOL v19 = (char *)&v5[5 * a2 + 4];
    if ((char *)(v14 + 40) != v19 || result >= &v19[40 * v18]) {
      uint64_t result = (char *)memmove(result, v19, 40 * v18);
    }
    uint64_t v20 = v5[2];
    BOOL v17 = __OFADD__(v20, v9);
    uint64_t v21 = v20 + v9;
    if (!v17)
    {
      uint64_t v5[2] = v21;
LABEL_20:
      long long v22 = *(_OWORD *)(a3 + 16);
      *(_OWORD *)uint64_t v14 = *(_OWORD *)a3;
      *(_OWORD *)(v14 + 16) = v22;
      *(void *)(v14 + 32) = *(void *)(a3 + 32);
      *(void *)uint64_t v3 = v5;
      return result;
    }
    goto LABEL_27;
  }
LABEL_28:
  uint64_t result = (char *)sub_2FA10();
  __break(1u);
  return result;
}

void *sub_2BDAC(void *a1)
{
  return sub_28FCC(0, a1[2], 0, a1);
}

uint64_t sub_2BDC0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_5250(&qword_3D868);
  uint64_t v3 = sub_2F950();
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
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_2FA80();
      sub_2F5C0();
      uint64_t result = sub_2FAA0();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *int64_t v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

Swift::Int sub_2C0A0(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  Swift::Int v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_2BDC0();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)sub_2C23C();
      goto LABEL_22;
    }
    sub_2C3F0();
  }
  uint64_t v11 = *v4;
  sub_2FA80();
  sub_2F5C0();
  uint64_t result = sub_2FAA0();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_2FA30(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_2FA50();
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
          uint64_t result = sub_2FA30();
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
  uint64_t v21 = (Swift::Int *)(*(void *)(v20 + 48) + 16 * a3);
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

void *sub_2C23C()
{
  uint64_t v1 = v0;
  sub_5250(&qword_3D868);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2F940();
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    BOOL v19 = (void *)(*(void *)(v4 + 48) + v16);
    *BOOL v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_2C3F0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_5250(&qword_3D868);
  uint64_t v3 = sub_2F950();
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
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_2FA80();
    swift_bridgeObjectRetain();
    sub_2F5C0();
    uint64_t result = sub_2FAA0();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *int64_t v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_2C6A0(uint64_t a1)
{
  return sub_2B470(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_2C6B4(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v3;
  void *v3 = v2;
  v3[1] = sub_2C794;
  return v5(v2 + 32);
}

uint64_t sub_2C794()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(unsigned char **)(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  unsigned char *v2 = *(unsigned char *)(v1 + 32);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

int64_t sub_2C8A8(int64_t result, int a2, char a3, uint64_t a4)
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
  unint64_t v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    unint64_t v11 = *(void *)(v6 + 8 * v9);
    if (v11) {
      return __clz(__rbit64(v11)) + (v9 << 6);
    }
    unint64_t v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      unint64_t v11 = *(void *)(v6 + 8 * v9);
      if (v11) {
        return __clz(__rbit64(v11)) + (v9 << 6);
      }
      while (v10 - 3 != v5)
      {
        unint64_t v11 = *(void *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          unint64_t v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

void sub_2C98C(uint64_t a1, int a2, char a3, uint64_t a4)
{
  unint64_t v6 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a3)
    {
      sub_2F8F0();
      sub_2DF68(0, &qword_3D810);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      return;
    }
    goto LABEL_24;
  }
  if (a3) {
    goto LABEL_10;
  }
  if (a1 < 0 || 1 << *(unsigned char *)(a4 + 32) <= a1)
  {
    __break(1u);
    goto LABEL_21;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)a1 >> 6) + 56) >> a1) & 1) == 0)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if (*(_DWORD *)(a4 + 36) == a2) {
    goto LABEL_17;
  }
  __break(1u);
LABEL_10:
  if (sub_2F8C0() != *(_DWORD *)(a4 + 36))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  sub_2F8D0();
  sub_2DF68(0, &qword_3D810);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  unint64_t v4 = v16;
  swift_unknownObjectRelease();
  Swift::Int v7 = sub_2F7B0(*(void *)(a4 + 40));
  uint64_t v8 = -1 << *(unsigned char *)(a4 + 32);
  unint64_t v6 = v7 & ~v8;
  if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
  {
LABEL_23:

    __break(1u);
LABEL_24:
    __break(1u);
    return;
  }
  id v9 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
  char v10 = sub_2F7C0();

  if ((v10 & 1) == 0)
  {
    uint64_t v11 = ~v8;
    do
    {
      unint64_t v6 = (v6 + 1) & v11;
      if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
        goto LABEL_23;
      }
      id v12 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
      char v13 = sub_2F7C0();
    }
    while ((v13 & 1) == 0);
  }

LABEL_17:
  unint64_t v14 = *(void **)(*(void *)(a4 + 48) + 8 * v6);

  id v15 = v14;
}

uint64_t sub_2CC04(uint64_t a1)
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
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  id v9 = (unint64_t *)(a1 + 72);
  uint64_t v2 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t sub_2CC8C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 80 * a1 + 32;
    unint64_t v6 = a3 + 80 * v4;
    if (v5 >= v6 || v5 + 80 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_2FA10();
  __break(1u);
  return result;
}

void *sub_2CD84()
{
  NSString v0 = sub_2F5A0();
  sub_3FDC(v0);

  uint64_t result = (void *)SBSCopyDisplayIdentifiers();
  if (result)
  {
    uint64_t v2 = result;
    sub_2F690();

    return &_swiftEmptySetSingleton;
  }
  else
  {
    __break(1u);
  }
  return result;
}

Swift::Int sub_2CE14(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_5250(&qword_3D868);
    uint64_t v3 = sub_2F960();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v25 = a1 + 32;
    while (1)
    {
      unint64_t v6 = (uint64_t *)(v25 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      sub_2FA80();
      swift_bridgeObjectRetain();
      sub_2F5C0();
      Swift::Int result = sub_2FAA0();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = result & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = *(void *)(v3 + 48);
        int64_t v16 = (void *)(v15 + 16 * v11);
        BOOL v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (Swift::Int result = sub_2FA30(), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        uint64_t v18 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v18;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          BOOL v19 = (void *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            Swift::Int result = sub_2FA30();
            if ((result & 1) == 0) {
              continue;
            }
          }
          goto LABEL_3;
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      uint64_t v21 = (void *)(*(void *)(v3 + 48) + 16 * v11);
      *uint64_t v21 = v8;
      v21[1] = v7;
      uint64_t v22 = *(void *)(v3 + 16);
      BOOL v23 = __OFADD__(v22, 1);
      uint64_t v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v24;
LABEL_4:
      if (++v4 == v1) {
        return v3;
      }
    }
  }
  return (Swift::Int)&_swiftEmptySetSingleton;
}

void *sub_2CFB8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return &_swiftEmptySetSingleton;
  }
  sub_5250(&qword_3D748);
  uint64_t v3 = sub_2F960();
  uint64_t v4 = 0;
  uint64_t v5 = v3 + 56;
  uint64_t v28 = v1;
  uint64_t v29 = a1 + 32;
  do
  {
    uint64_t v30 = v4;
    uint64_t v6 = *(unsigned __int8 *)(v29 + v4);
    sub_2FA80();
    sub_9B20(v6);
    sub_2F5C0();
    swift_bridgeObjectRelease();
    Swift::Int v7 = sub_2FAA0();
    uint64_t v8 = ~(-1 << *(unsigned char *)(v3 + 32));
    unint64_t v9 = v7 & v8;
    unint64_t v10 = (v7 & (unint64_t)v8) >> 6;
    uint64_t v11 = *(void *)(v5 + 8 * v10);
    uint64_t v12 = 1 << (v7 & v8);
    if ((v12 & v11) != 0)
    {
      while (1)
      {
        unint64_t v13 = 0xD000000000000014;
        unint64_t v14 = 0x8000000000031510;
        switch(*(unsigned char *)(*(void *)(v3 + 48) + v9))
        {
          case 1:
            unint64_t v13 = 0xD00000000000001BLL;
            uint64_t v15 = "com.apple.MobileAddressBook";
            goto LABEL_39;
          case 2:
            int64_t v16 = "com.apple.mobilecal";
            goto LABEL_36;
          case 3:
            unint64_t v13 = 0xD000000000000015;
            uint64_t v15 = "com.apple.mobilenotes";
            goto LABEL_39;
          case 4:
            int64_t v16 = "com.apple.reminders";
            goto LABEL_36;
          case 5:
            unint64_t v13 = 0xD000000000000012;
            uint64_t v15 = "com.apple.freeform";
            goto LABEL_39;
          case 6:
            unint64_t v13 = 0xD000000000000014;
            uint64_t v15 = "com.apple.VoiceMemos";
            goto LABEL_39;
          case 7:
            unint64_t v13 = 0xD000000000000015;
            uint64_t v15 = "com.apple.mobilephone";
            goto LABEL_39;
          case 8:
            int64_t v16 = "com.apple.MobileSMS";
            goto LABEL_36;
          case 9:
            unint64_t v13 = 0xD000000000000012;
            uint64_t v15 = "com.apple.facetime";
            goto LABEL_39;
          case 0xA:
            unint64_t v13 = 0xD000000000000016;
            uint64_t v15 = "com.apple.mobilesafari";
            goto LABEL_39;
          case 0xB:
            unint64_t v13 = 0x6C7070612E6D6F63;
            unint64_t v14 = 0xEE007377656E2E65;
            break;
          case 0xC:
            unint64_t v13 = 0xD000000000000010;
            uint64_t v15 = "com.apple.stocks";
            goto LABEL_39;
          case 0xD:
            unint64_t v13 = 0xD000000000000011;
            uint64_t v15 = "com.apple.weather";
            goto LABEL_39;
          case 0xE:
            int64_t v16 = "com.apple.Translate";
            goto LABEL_36;
          case 0xF:
            unint64_t v13 = 0x6C7070612E6D6F63;
            unint64_t v14 = 0xEE007370614D2E65;
            break;
          case 0x10:
            unint64_t v13 = 0xD000000000000011;
            uint64_t v15 = "com.apple.compass";
            goto LABEL_39;
          case 0x11:
            unint64_t v13 = 0xD000000000000011;
            uint64_t v15 = "com.apple.measure";
            goto LABEL_39;
          case 0x12:
            int64_t v16 = "com.apple.shortcuts";
            goto LABEL_36;
          case 0x13:
            unint64_t v13 = 0xD000000000000010;
            uint64_t v15 = "com.apple.Health";
            goto LABEL_39;
          case 0x14:
            unint64_t v13 = 0xD000000000000011;
            uint64_t v15 = "com.apple.Fitness";
            goto LABEL_39;
          case 0x15:
            unint64_t v13 = 0x6C7070612E6D6F63;
            unint64_t v14 = 0xEE00656D6F482E65;
            break;
          case 0x16:
            unint64_t v13 = 0xD000000000000011;
            uint64_t v15 = "com.apple.journal";
            goto LABEL_39;
          case 0x17:
            unint64_t v13 = 0x6C7070612E6D6F63;
            unint64_t v14 = 0xEF636973754D2E65;
            break;
          case 0x18:
            unint64_t v13 = 0x6C7070612E6D6F63;
            unint64_t v14 = 0xEC00000076742E65;
            break;
          case 0x19:
            unint64_t v13 = 0xD000000000000019;
            uint64_t v15 = "com.apple.mobileslideshow";
            goto LABEL_39;
          case 0x1A:
            unint64_t v13 = 0xD000000000000010;
            uint64_t v15 = "com.apple.camera";
            goto LABEL_39;
          case 0x1B:
            unint64_t v13 = 0xD000000000000010;
            uint64_t v15 = "com.apple.iBooks";
            goto LABEL_39;
          case 0x1C:
            unint64_t v13 = 0xD000000000000012;
            uint64_t v15 = "com.apple.podcasts";
            goto LABEL_39;
          case 0x1D:
            int64_t v16 = "com.apple.Passwords";
LABEL_36:
            unint64_t v14 = (unint64_t)(v16 - 32) | 0x8000000000000000;
            unint64_t v13 = 0xD000000000000013;
            break;
          case 0x1E:
            unint64_t v13 = 0xD000000000000012;
            uint64_t v15 = "com.apple.AppStore";
            goto LABEL_39;
          case 0x1F:
            unint64_t v13 = 0xD000000000000012;
            uint64_t v15 = "com.apple.Passbook";
LABEL_39:
            unint64_t v14 = (unint64_t)(v15 - 32) | 0x8000000000000000;
            break;
          default:
            break;
        }
        unint64_t v17 = 0xD000000000000014;
        unint64_t v18 = 0x8000000000031510;
        switch(v6)
        {
          case 1:
            unint64_t v19 = 0xD00000000000001BLL;
            uint64_t v20 = "com.apple.MobileAddressBook";
            goto LABEL_79;
          case 2:
            uint64_t v21 = "com.apple.mobilecal";
            goto LABEL_74;
          case 3:
            unint64_t v19 = 0xD000000000000015;
            uint64_t v20 = "com.apple.mobilenotes";
            goto LABEL_79;
          case 4:
            uint64_t v21 = "com.apple.reminders";
            goto LABEL_74;
          case 5:
            unint64_t v19 = 0xD000000000000012;
            uint64_t v20 = "com.apple.freeform";
            goto LABEL_79;
          case 6:
            unint64_t v19 = 0xD000000000000014;
            uint64_t v20 = "com.apple.VoiceMemos";
            goto LABEL_79;
          case 7:
            unint64_t v19 = 0xD000000000000015;
            uint64_t v20 = "com.apple.mobilephone";
            goto LABEL_79;
          case 8:
            uint64_t v21 = "com.apple.MobileSMS";
            goto LABEL_74;
          case 9:
            unint64_t v19 = 0xD000000000000012;
            uint64_t v20 = "com.apple.facetime";
            goto LABEL_79;
          case 10:
            unint64_t v19 = 0xD000000000000016;
            uint64_t v20 = "com.apple.mobilesafari";
            goto LABEL_79;
          case 11:
            uint64_t v22 = 0x7377656E2E65;
            goto LABEL_62;
          case 12:
            unint64_t v19 = 0xD000000000000010;
            uint64_t v20 = "com.apple.stocks";
            goto LABEL_79;
          case 13:
            unint64_t v19 = 0xD000000000000011;
            uint64_t v20 = "com.apple.weather";
            goto LABEL_79;
          case 14:
            uint64_t v21 = "com.apple.Translate";
            goto LABEL_74;
          case 15:
            uint64_t v22 = 0x7370614D2E65;
            goto LABEL_62;
          case 16:
            unint64_t v19 = 0xD000000000000011;
            uint64_t v20 = "com.apple.compass";
            goto LABEL_79;
          case 17:
            unint64_t v19 = 0xD000000000000011;
            uint64_t v20 = "com.apple.measure";
            goto LABEL_79;
          case 18:
            uint64_t v21 = "com.apple.shortcuts";
            goto LABEL_74;
          case 19:
            unint64_t v19 = 0xD000000000000010;
            uint64_t v20 = "com.apple.Health";
            goto LABEL_79;
          case 20:
            unint64_t v19 = 0xD000000000000011;
            uint64_t v20 = "com.apple.Fitness";
            goto LABEL_79;
          case 21:
            uint64_t v22 = 0x656D6F482E65;
LABEL_62:
            unint64_t v18 = v22 & 0xFFFFFFFFFFFFLL | 0xEE00000000000000;
            if (v13 != 0x6C7070612E6D6F63) {
              goto LABEL_81;
            }
            goto LABEL_80;
          case 22:
            unint64_t v19 = 0xD000000000000011;
            uint64_t v20 = "com.apple.journal";
            goto LABEL_79;
          case 23:
            unint64_t v18 = 0xEF636973754D2E65;
            if (v13 != 0x6C7070612E6D6F63) {
              goto LABEL_81;
            }
            goto LABEL_80;
          case 24:
            unint64_t v18 = 0xEC00000076742E65;
            if (v13 != 0x6C7070612E6D6F63) {
              goto LABEL_81;
            }
            goto LABEL_80;
          case 25:
            unint64_t v19 = 0xD000000000000019;
            uint64_t v20 = "com.apple.mobileslideshow";
            goto LABEL_79;
          case 26:
            unint64_t v19 = 0xD000000000000010;
            uint64_t v20 = "com.apple.camera";
            goto LABEL_79;
          case 27:
            unint64_t v19 = 0xD000000000000010;
            uint64_t v20 = "com.apple.iBooks";
            goto LABEL_79;
          case 28:
            unint64_t v19 = 0xD000000000000012;
            uint64_t v20 = "com.apple.podcasts";
            goto LABEL_79;
          case 29:
            uint64_t v21 = "com.apple.Passwords";
LABEL_74:
            unint64_t v18 = (unint64_t)(v21 - 32) | 0x8000000000000000;
            unint64_t v17 = 0xD000000000000013;
            goto LABEL_75;
          case 30:
            unint64_t v19 = 0xD000000000000012;
            uint64_t v20 = "com.apple.AppStore";
            goto LABEL_79;
          case 31:
            unint64_t v19 = 0xD000000000000012;
            uint64_t v20 = "com.apple.Passbook";
LABEL_79:
            unint64_t v18 = (unint64_t)(v20 - 32) | 0x8000000000000000;
            if (v13 == v19) {
              goto LABEL_80;
            }
            goto LABEL_81;
          default:
LABEL_75:
            if (v13 != v17) {
              goto LABEL_81;
            }
LABEL_80:
            if (v14 == v18)
            {
              swift_bridgeObjectRelease_n();
              goto LABEL_4;
            }
LABEL_81:
            char v23 = sub_2FA30();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (v23) {
              goto LABEL_4;
            }
            unint64_t v9 = (v9 + 1) & v8;
            unint64_t v10 = v9 >> 6;
            uint64_t v11 = *(void *)(v5 + 8 * (v9 >> 6));
            uint64_t v12 = 1 << v9;
            if ((v11 & (1 << v9)) == 0) {
              goto LABEL_83;
            }
            break;
        }
      }
    }
LABEL_83:
    *(void *)(v5 + 8 * v10) = v12 | v11;
    *(unsigned char *)(*(void *)(v3 + 48) + v9) = v6;
    uint64_t v24 = *(void *)(v3 + 16);
    BOOL v25 = __OFADD__(v24, 1);
    uint64_t v26 = v24 + 1;
    if (v25)
    {
      __break(1u);
      JUMPOUT(0x2D678);
    }
    *(void *)(v3 + 16) = v26;
LABEL_4:
    uint64_t v4 = v30 + 1;
  }
  while (v30 + 1 != v28);
  return (void *)v3;
}

uint64_t sub_2D778(uint64_t a1, uint64_t a2)
{
  return a2;
}

_OWORD *sub_2D7D4(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_2D7E4()
{
  return swift_release();
}

uint64_t sub_2D7EC(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_2D83C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2D89C(uint64_t a1, unint64_t a2)
{
  if (a2 != 4) {
    return sub_631C(a1, a2);
  }
  return a1;
}

uint64_t sub_2D8AC()
{
  return sub_27510();
}

uint64_t sub_2D8B8()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_2D8F0()
{
  return sub_20048();
}

uint64_t sub_2D8F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_2D908()
{
  return swift_release();
}

uint64_t sub_2D910(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_2DF68(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_2D954()
{
}

uint64_t sub_2D95C()
{
  return sub_20220();
}

uint64_t sub_2D964()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 88, 7);
}

uint64_t sub_2D9C4(uint64_t a1)
{
  uint64_t v4 = v1[3];
  uint64_t v12 = v1[2];
  uint64_t v5 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v7 = v1[6];
  uint64_t v8 = v1[7];
  uint64_t v9 = v1[8];
  unint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *unint64_t v10 = v2;
  v10[1] = sub_9B1C;
  return sub_20A5C(a1, v12, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_2DAB8()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_2DAF0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_9B1C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_3D7F8 + dword_3D7F8);
  return v6(a1, v4);
}

uint64_t sub_2DBA8(uint64_t result)
{
  unint64_t v1 = *(void *)(result + 16);
  if (!v1) {
    return (uint64_t)_swiftEmptyArrayStorage;
  }
  unint64_t v2 = 0;
  uint64_t v3 = result + 56;
  uint64_t v40 = -(uint64_t)v1;
  uint64_t v4 = _swiftEmptyArrayStorage;
  uint64_t v37 = result + 56;
  unint64_t v38 = *(void *)(result + 16);
  do
  {
    char v39 = v4;
    if (v2 <= v1) {
      unint64_t v5 = v1;
    }
    else {
      unint64_t v5 = v2;
    }
    uint64_t v41 = -(uint64_t)v5;
    uint64_t v6 = v3 + 80 * v2;
    unint64_t v7 = v2 + 1;
    while (1)
    {
      if (v41 + v7 == 1)
      {
        __break(1u);
        return result;
      }
      unint64_t v43 = v7;
      uint64_t v8 = *(void *)v6;
      uint64_t v44 = *(void *)(v6 - 24);
      uint64_t v45 = *(void *)(v6 - 8);
      uint64_t v9 = *(void *)(v6 + 8);
      uint64_t v10 = *(void *)(v6 + 16);
      uint64_t v12 = *(void *)(v6 + 24);
      uint64_t v11 = *(void *)(v6 + 32);
      uint64_t v13 = *(void *)(v6 + 40);
      char v14 = *(unsigned char *)(v6 + 48);
      unint64_t v15 = *(void *)(v6 - 16);
      sub_631C(v44, v15);
      uint64_t v42 = v8;
      uint64_t v16 = v8;
      uint64_t v17 = v9;
      uint64_t v18 = v9;
      uint64_t v19 = v11;
      uint64_t v20 = v11;
      uint64_t v21 = v13;
      uint64_t v22 = v13;
      char v23 = v14;
      sub_8618(v45, v16, v18, v10, v12, v20, v22, v14);
      sub_B45C();
      if (sub_2F870()) {
        break;
      }
      sub_6330(v44, v15);
      uint64_t result = sub_AA88(v45, v42, v17, v10, v12, v19, v21, v14);
      unint64_t v7 = v43 + 1;
      v6 += 80;
      if (v40 + v43 + 1 == 1) {
        return (uint64_t)v39;
      }
    }
    uint64_t v4 = v39;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = sub_2B3F0(0, v39[2] + 1, 1);
      uint64_t v4 = v39;
    }
    uint64_t v24 = v45;
    uint64_t v25 = v42;
    uint64_t v26 = v17;
    uint64_t v27 = v19;
    uint64_t v28 = v21;
    uint64_t v29 = v10;
    char v30 = v23;
    uint64_t v31 = v12;
    uint64_t v32 = v44;
    unint64_t v33 = v15;
    unint64_t v35 = v4[2];
    unint64_t v34 = v4[3];
    if (v35 >= v34 >> 1)
    {
      uint64_t result = sub_2B3F0(v34 > 1, v35 + 1, 1);
      uint64_t v29 = v10;
      unint64_t v33 = v15;
      uint64_t v32 = v44;
      uint64_t v31 = v12;
      char v30 = v23;
      uint64_t v28 = v21;
      uint64_t v27 = v19;
      uint64_t v26 = v17;
      uint64_t v25 = v42;
      uint64_t v24 = v45;
      uint64_t v4 = v39;
    }
    v4[2] = v35 + 1;
    BOOL v36 = &v4[10 * v35];
    long long v36[4] = v32;
    v36[5] = v33;
    v36[6] = v24;
    v36[7] = v25;
    v36[8] = v26;
    v36[9] = v29;
    v36[10] = v31;
    v36[11] = v27;
    v36[12] = v28;
    *((unsigned char *)v36 + 104) = v30;
    unint64_t v2 = v43;
    uint64_t v3 = v37;
    unint64_t v1 = v38;
  }
  while (v40 + v43);
  return (uint64_t)v4;
}

uint64_t sub_2DE44(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_2F6B0();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (Swift::Int *)(a1 + 40);
    do
    {
      Swift::Int v5 = *(v4 - 1);
      Swift::Int v6 = *v4;
      swift_bridgeObjectRetain();
      sub_2BA64(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_2DEDC()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_2DF14()
{
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

id sub_2DF54(void *a1)
{
  return sub_262D0(a1, *(void *)(v1 + 16));
}

uint64_t sub_2DF5C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_2DF68(uint64_t a1, unint64_t *a2)
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

uint64_t sub_2DFA4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_2FA10();
  __break(1u);
  return result;
}

uint64_t sub_2E0A0()
{
  return sub_2E488(&OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel__sections);
}

uint64_t sub_2E0C0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 8 * a1 + 32;
    unint64_t v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      sub_5250(&qword_3D860);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_2FA10();
  __break(1u);
  return result;
}

uint64_t sub_2E1CC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_2FA10();
  __break(1u);
  return result;
}

void sub_2E2C4()
{
}

void (*sub_2E2CC())()
{
  return sub_2E2C4;
}

uint64_t sub_2E330()
{
  return sub_8880(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_2E354()
{
  return sub_2E488(&OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel__filteredItems);
}

uint64_t sub_2E37C()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_2E3CC()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = swift_task_alloc();
  long long v5 = *(_OWORD *)(v0 + 48);
  *(void *)(v1 + 16) = v4;
  *(void *)uint64_t v4 = v1;
  *(void *)(v4 + 8) = sub_9B1C;
  *(_OWORD *)(v4 + 72) = v5;
  *(void *)(v4 + 56) = v2;
  *(void *)(v4 + 64) = v3;
  return _swift_task_switch(sub_1EE94, 0, 0);
}

uint64_t sub_2E488(void *a1)
{
  *(void *)(*(void *)(v1 + 16) + *a1) = *(void *)(v1 + 24);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2E4D4()
{
  uint64_t v1 = sub_2ED70();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_2E5A8(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_2ED70() - 8);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_9B1C;
  return sub_1B9F4(a1, v5, v6, v7, v8);
}

uint64_t sub_2E6A4(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_9A18;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_3D8A0 + dword_3D8A0);
  return v6(a1, v4);
}

unint64_t sub_2E75C()
{
  unint64_t result = qword_3D8B8;
  if (!qword_3D8B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_3D8B8);
  }
  return result;
}

uint64_t sub_2E7B0()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_2E7F0()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_9A18;
  v3[19] = v2;
  return _swift_task_switch(sub_277CC, 0, 0);
}

uint64_t sub_2E89C()
{
  uint64_t v1 = v0[3];
  unint64_t v2 = v0[4];
  uint64_t v3 = (uint64_t *)(v0[2] + OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel__currentSelection);
  uint64_t v4 = *v3;
  unint64_t v5 = v3[1];
  uint64_t *v3 = v1;
  v3[1] = v2;
  sub_2D89C(v1, v2);
  return sub_9B0C(v4, v5);
}

id sub_2E910()
{
  uint64_t v1 = *(void **)(v0 + 16);
  if (v1)
  {
    id v2 = *(id *)(v0 + 16);
  }
  else
  {
    id v3 = [objc_allocWithZone((Class)type metadata accessor for AppsSettingsListViewModel()) init];
    uint64_t v4 = *(void **)(v0 + 16);
    *(void *)(v0 + 16) = v3;
    id v2 = v3;

    uint64_t v1 = 0;
  }
  id v5 = v1;
  return v2;
}

uint64_t sub_2E97C()
{
  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for InstalledAppsSettingsPluginDelegate()
{
  return self;
}

uint64_t sub_2E9D8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2E9F4()
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  return result;
}

uint64_t sub_2EA1C@<X0>(uint64_t *a1@<X8>)
{
  sub_2E910();

  return sub_13DA8(a1);
}

uint64_t sub_2EA54(uint64_t a1, uint64_t a2)
{
  *(void *)(v3 + 16) = a2;
  *(void *)(v3 + 24) = v2;
  return _swift_task_switch(sub_2EA74, 0, 0);
}

uint64_t sub_2EA74()
{
  v0[4] = sub_2E910();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[5] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_2EB18;
  uint64_t v2 = v0[2];
  return sub_1BD54(v2);
}

uint64_t sub_2EB18()
{
  uint64_t v1 = *(void **)(*v0 + 32);
  uint64_t v4 = *v0;
  swift_task_dealloc();

  uint64_t v2 = *(uint64_t (**)(void))(v4 + 8);
  return v2();
}

unint64_t sub_2EC28()
{
  unint64_t result = qword_3D998;
  if (!qword_3D998)
  {
    type metadata accessor for AppsSettingsList();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D998);
  }
  return result;
}

uint64_t sub_2EC80()
{
  return URLQueryItem.name.getter();
}

uint64_t sub_2EC90()
{
  return URLQueryItem.value.getter();
}

uint64_t sub_2ECA0()
{
  return type metadata accessor for URLQueryItem();
}

uint64_t sub_2ECB0()
{
  return URLComponents.queryItems.getter();
}

uint64_t sub_2ECC0()
{
  return URLComponents.init(url:resolvingAgainstBaseURL:)();
}

uint64_t sub_2ECD0()
{
  return URLComponents.path.getter();
}

uint64_t sub_2ECE0()
{
  return URLComponents.fragment.getter();
}

uint64_t sub_2ECF0()
{
  return type metadata accessor for URLComponents();
}

uint64_t sub_2ED00(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

uint64_t sub_2ED10()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_2ED20()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_2ED30()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_2ED40()
{
  return type metadata accessor for NSFastEnumerationIterator();
}

uint64_t sub_2ED50()
{
  return URL.absoluteString.getter();
}

uint64_t sub_2ED60()
{
  return URL.init(string:)();
}

uint64_t sub_2ED70()
{
  return type metadata accessor for URL();
}

uint64_t sub_2ED80()
{
  return withObservationTracking<A>(_:onChange:)();
}

uint64_t sub_2ED90()
{
  return ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
}

uint64_t sub_2EDA0()
{
  return ObservationRegistrar.access<A, B>(_:keyPath:)();
}

uint64_t sub_2EDB0()
{
  return ObservationRegistrar.init()();
}

uint64_t sub_2EDC0()
{
  return type metadata accessor for ObservationRegistrar();
}

uint64_t sub_2EDE0()
{
  return static AppDistributor.AppDistributorsOrTrustedDevelopersChangedNotification.getter();
}

uint64_t sub_2EDF0()
{
  return PreferencesControllerRecipe.controllerRecipeWithPendingURLPayload(_:)();
}

uint64_t sub_2EE00()
{
  return PreferencesControllerRecipe.init(viewControllerClass:specifier:)();
}

uint64_t sub_2EE10()
{
  return PreferencesControllerRecipe.init(bundleName:location:viewControllerClassName:)();
}

uint64_t sub_2EE20()
{
  return static PreferencesControllerRecipe.== infix(_:_:)();
}

uint64_t sub_2EE30()
{
  return PreferencesControllerRecipe.init(specifier:bundleName:location:viewControllerClassName:)();
}

uint64_t sub_2EE40()
{
  return type metadata accessor for PreferencesControllerRecipe();
}

void sub_2EE50()
{
}

uint64_t sub_2EE60()
{
  return type metadata accessor for ClearSettingsNavigationPathAction();
}

uint64_t sub_2EE70()
{
  return AppendSettingsNavigationPathAction.callAsFunction<A>(_:)();
}

uint64_t sub_2EE80()
{
  return type metadata accessor for AppendSettingsNavigationPathAction();
}

uint64_t sub_2EE90()
{
  return AsyncIconImage.init<>(icon:descriptor:)();
}

uint64_t sub_2EEB0()
{
  return type metadata accessor for ApplicationSettingsView();
}

uint64_t sub_2EEC0()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_2EED0()
{
  return Logger.logObject.getter();
}

uint64_t sub_2EEE0()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_2EEF0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_2EF00()
{
  return AnyCancellable.store(in:)();
}

void sub_2EF10()
{
}

uint64_t sub_2EF20()
{
  return type metadata accessor for AnyCancellable();
}

uint64_t sub_2EF30()
{
  return PassthroughSubject.send(_:)();
}

uint64_t sub_2EF40()
{
  return PassthroughSubject.init()();
}

uint64_t sub_2EF50()
{
  return Subject<>.send()();
}

uint64_t sub_2EF60()
{
  return Publisher.receive<A>(on:options:)();
}

uint64_t sub_2EF70()
{
  return Publisher.debounce<A>(for:scheduler:options:)();
}

uint64_t sub_2EF80()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t sub_2EF90()
{
  return static ScenePhase.== infix(_:_:)();
}

uint64_t sub_2EFA0()
{
  return type metadata accessor for ScenePhase();
}

uint64_t sub_2EFB0()
{
  return type metadata accessor for Environment.Content();
}

uint64_t sub_2EFC0()
{
  return Environment.init<A>(_:)();
}

void sub_2EFD0()
{
}

uint64_t sub_2EFE0()
{
  return type metadata accessor for DismissAction();
}

uint64_t sub_2EFF0()
{
  return withAnimation<A>(_:_:)();
}

uint64_t sub_2F000()
{
  return NavigationLink<>.init<A>(value:label:)();
}

uint64_t sub_2F010()
{
  return static SafeAreaRegions.all.getter();
}

uint64_t sub_2F020()
{
  return ScrollViewProxy.scrollTo<A>(_:anchor:)();
}

uint64_t sub_2F030()
{
  return type metadata accessor for ScrollViewProxy();
}

uint64_t sub_2F040()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t sub_2F050()
{
  return EnvironmentValues.imageScale.getter();
}

uint64_t sub_2F060()
{
  return EnvironmentValues.imageScale.setter();
}

uint64_t sub_2F070()
{
  return EnvironmentValues.scenePhase.getter();
}

uint64_t sub_2F080()
{
  return EnvironmentValues.scenePhase.setter();
}

uint64_t sub_2F090()
{
  return EnvironmentValues.displayScale.getter();
}

uint64_t sub_2F0A0()
{
  return EnvironmentValues.displayScale.setter();
}

uint64_t sub_2F0B0()
{
  return EnvironmentValues.listSectionSpacing.getter();
}

uint64_t sub_2F0C0()
{
  return EnvironmentValues.listSectionSpacing.setter();
}

uint64_t sub_2F0D0()
{
  return EnvironmentValues.clearSettingsNavigationPath.getter();
}

uint64_t sub_2F0E0()
{
  return EnvironmentValues.appendSettingsNavigationPath.getter();
}

uint64_t sub_2F0F0()
{
  return EnvironmentValues.horizontalSizeClass.getter();
}

uint64_t sub_2F100()
{
  return EnvironmentValues.horizontalSizeClass.setter();
}

uint64_t sub_2F110()
{
  return EnvironmentValues.dismiss.getter();
}

uint64_t sub_2F120()
{
  return EnvironmentValues.isEnabled.getter();
}

uint64_t sub_2F130()
{
  return EnvironmentValues.isEnabled.setter();
}

uint64_t sub_2F140()
{
  return EnvironmentValues.init()();
}

uint64_t sub_2F150()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t sub_2F160()
{
  return type metadata accessor for NavigationBarItem.TitleDisplayMode();
}

uint64_t sub_2F170()
{
  return type metadata accessor for SectionIndexLabel();
}

uint64_t sub_2F180()
{
  return static ListSectionSpacing.compact.getter();
}

uint64_t sub_2F190()
{
  return static ListSectionSpacing.default.getter();
}

uint64_t sub_2F1A0()
{
  return type metadata accessor for ListSectionSpacing();
}

uint64_t sub_2F1B0()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_2F1C0()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t sub_2F1D0()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_2F1E0()
{
  return static PrimitiveButtonStyle<>.navigationLink.getter();
}

uint64_t sub_2F1F0()
{
  return static SearchFieldPlacement.navigationBarDrawer(displayMode:)();
}

uint64_t sub_2F200()
{
  return static SearchFieldPlacement.NavigationBarDrawerDisplayMode.always.getter();
}

uint64_t sub_2F210()
{
  return type metadata accessor for SearchFieldPlacement.NavigationBarDrawerDisplayMode();
}

uint64_t sub_2F220()
{
  return static SearchFieldPlacement.toolbar.getter();
}

uint64_t sub_2F230()
{
  return type metadata accessor for SearchFieldPlacement();
}

uint64_t sub_2F240()
{
  return ContentUnavailableView.init(label:description:actions:)();
}

uint64_t sub_2F250()
{
  return static ContentUnavailableView<>.search.getter();
}

uint64_t sub_2F260()
{
  return type metadata accessor for UserInterfaceSizeClass();
}

uint64_t sub_2F270()
{
  return static ScrollIndicatorVisibility.hidden.getter();
}

uint64_t sub_2F280()
{
  return type metadata accessor for ScrollIndicatorVisibility();
}

uint64_t sub_2F290()
{
  return static AccessibilityChildBehavior.combine.getter();
}

uint64_t sub_2F2A0()
{
  return type metadata accessor for AccessibilityChildBehavior();
}

uint64_t sub_2F2B0()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_2F2C0()
{
  return static Axis.Set.horizontal.getter();
}

uint64_t sub_2F2D0()
{
  return Axis.Set.init(rawValue:)();
}

uint64_t sub_2F2E0()
{
  return static Axis.Set.vertical.getter();
}

uint64_t sub_2F2F0()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_2F300()
{
  return static Font.largeTitle.getter();
}

uint64_t sub_2F310()
{
  return static Font.caption.getter();
}

uint64_t sub_2F320()
{
  return List.init(selection:content:)();
}

uint64_t sub_2F330()
{
  return List<>.init(content:)();
}

uint64_t sub_2F340()
{
  return Text.font(_:)();
}

uint64_t sub_2F350()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_2F360()
{
  return Text.init<A>(_:)();
}

uint64_t sub_2F370()
{
  return View.settingsListAppearance()();
}

uint64_t sub_2F380()
{
  return View.emitNavigationEventOnAppearForSystemSetting(icon:title:localizedNavigationComponents:deepLink:)();
}

uint64_t sub_2F390()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_2F3A0()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_2F3B0()
{
  return View.searchable(text:isPresented:placement:prompt:)();
}

uint64_t sub_2F3C0()
{
  return View.buttonStyle<A>(_:)();
}

uint64_t sub_2F3D0()
{
  return View.environment<A>(_:)();
}

uint64_t sub_2F3E0()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_2F3F0()
{
  return View.navigationTitle(_:)();
}

uint64_t sub_2F400()
{
  return View.scrollIndicators(_:axes:)();
}

uint64_t sub_2F410()
{
  return View._onEnvironmentChange<A>(_:perform:)();
}

uint64_t sub_2F420()
{
  return View.accessibilityElement(children:)();
}

uint64_t sub_2F430()
{
  return View.navigationDestination<A, B>(for:destination:)();
}

uint64_t sub_2F440()
{
  return View.accessibilityIdentifier(_:)();
}

uint64_t sub_2F450()
{
  return View.navigationBarTitleDisplayMode(_:)();
}

uint64_t sub_2F460()
{
  return Color.init(uiColor:)();
}

uint64_t sub_2F470()
{
  return Image.init(systemName:)();
}

uint64_t sub_2F480()
{
  return type metadata accessor for Image.Scale();
}

uint64_t sub_2F490()
{
  return Label.init(title:icon:)();
}

uint64_t sub_2F4A0()
{
  return State.init(wrappedValue:)();
}

uint64_t sub_2F4B0()
{
  return State.wrappedValue.getter();
}

uint64_t sub_2F4C0()
{
  return State.projectedValue.getter();
}

uint64_t sub_2F4D0()
{
  return Button.init(action:label:)();
}

uint64_t sub_2F4E0()
{
  return Binding.subscript.getter();
}

uint64_t sub_2F4F0()
{
  return ForEach<>.init(_:content:)();
}

uint64_t sub_2F500()
{
  return Section<>.init(header:content:)();
}

uint64_t sub_2F510()
{
  return Bindable.wrappedValue.getter();
}

uint64_t sub_2F520()
{
  return Bindable<A>.init(wrappedValue:)();
}

uint64_t sub_2F530()
{
  return static Alignment.center.getter();
}

uint64_t sub_2F540()
{
  return static Animation.default.getter();
}

uint64_t sub_2F550()
{
  return type metadata accessor for SettingsEventImage();
}

uint64_t sub_2F560()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_2F570()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t sub_2F580()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t sub_2F590()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_2F5A0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_2F5B0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_2F5C0()
{
  return String.hash(into:)();
}

void sub_2F5D0(Swift::String a1)
{
}

Swift::Int sub_2F5E0()
{
  return String.UTF8View._foreignCount()();
}

BOOL sub_2F5F0(Swift::String a1)
{
  return String.hasPrefix(_:)(a1);
}

uint64_t sub_2F600()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_2F610()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_2F620()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_2F630()
{
  return static MainActor.shared.getter();
}

uint64_t sub_2F640()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_2F650()
{
  return static TaskPriority.userInitiated.getter();
}

uint64_t sub_2F660()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_2F670()
{
  return type metadata accessor for TaskPriority();
}

NSSet sub_2F680()
{
  return Set._bridgeToObjectiveC()();
}

uint64_t sub_2F690()
{
  return static Set._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_2F6A0()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_2F6B0()
{
  return Set.init(minimumCapacity:)();
}

uint64_t sub_2F6C0()
{
  return Set.Index._asCocoa.modify();
}

uint64_t sub_2F6D0()
{
  return Set.Iterator.init(_cocoa:)();
}

uint64_t sub_2F6E0()
{
  return NSEnumerator.makeIterator()();
}

uint64_t sub_2F6F0()
{
  return type metadata accessor for APApplication();
}

uint64_t sub_2F700()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_2F710()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_2F720()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_2F730()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_2F740()
{
  return type metadata accessor for OS_dispatch_queue.SchedulerOptions();
}

uint64_t sub_2F750()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_2F760()
{
  return type metadata accessor for NSNotificationCenter.Publisher();
}

uint64_t sub_2F770()
{
  return NSNotificationCenter.publisher(for:object:)();
}

uint64_t sub_2F780()
{
  return static NSBundle.PreferencesPluginLocation.default.getter();
}

uint64_t sub_2F790()
{
  return static NSBundle.PreferencesPluginLocation.privacy.getter();
}

uint64_t sub_2F7A0()
{
  return type metadata accessor for NSBundle.PreferencesPluginLocation();
}

Swift::Int sub_2F7B0(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_2F7C0()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_2F7D0()
{
  return type metadata accessor for NSRunLoop.SchedulerOptions();
}

uint64_t sub_2F7E0()
{
  return static NSRunLoop.SchedulerTimeType.Stride.milliseconds(_:)();
}

uint64_t sub_2F7F0()
{
  return type metadata accessor for NSRunLoop.SchedulerTimeType.Stride();
}

uint64_t sub_2F800()
{
  return type metadata accessor for Optional();
}

uint64_t sub_2F810()
{
  return dispatch thunk of IteratorProtocol.next()();
}

uint64_t sub_2F820()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_2F830()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_2F840()
{
  return StringProtocol.components<A>(separatedBy:)();
}

uint64_t sub_2F850()
{
  return StringProtocol.removingPercentEncoding.getter();
}

uint64_t sub_2F860()
{
  return StringProtocol.localizedStandardCompare<A>(_:)();
}

uint64_t sub_2F870()
{
  return StringProtocol.localizedStandardContains<A>(_:)();
}

uint64_t sub_2F880()
{
  return _HashTable.previousHole(before:)();
}

uint64_t sub_2F890()
{
  return __CocoaSet.startIndex.getter();
}

uint64_t sub_2F8A0()
{
  return __CocoaSet.makeIterator()();
}

uint64_t sub_2F8B0()
{
  return __CocoaSet.Index.handleBitPattern.getter();
}

uint64_t sub_2F8C0()
{
  return __CocoaSet.Index.age.getter();
}

uint64_t sub_2F8D0()
{
  return __CocoaSet.Index.element.getter();
}

uint64_t sub_2F8E0()
{
  return __CocoaSet.count.getter();
}

uint64_t sub_2F8F0()
{
  return __CocoaSet.element(at:)();
}

uint64_t sub_2F900()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t sub_2F910()
{
  return __CocoaSet.formIndex(after:isUnique:)();
}

Swift::Int sub_2F920(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_2F930()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_2F940()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_2F950()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_2F960()
{
  return static _SetStorage.allocate(capacity:)();
}

void sub_2F970(Swift::Int a1)
{
}

uint64_t sub_2F980()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_2F990()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_2F9A0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_2F9B0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_2F9C0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_2F9D0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_2F9E0()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_2F9F0()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_2FA00()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_2FA10()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_2FA20(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t sub_2FA30()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_2FA40()
{
  return _findStringSwitchCaseWithCache(cases:string:cache:)();
}

uint64_t sub_2FA50()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_2FA60()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_2FA70()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_2FA80()
{
  return Hasher.init(_seed:)();
}

void sub_2FA90(Swift::UInt a1)
{
}

Swift::Int sub_2FAA0()
{
  return Hasher._finalize()();
}

uint64_t sub_2FAB0()
{
  return _typeName(_:qualified:)();
}

uint64_t MobileGestalt_get_current_device()
{
  return _MobileGestalt_get_current_device();
}

uint64_t MobileGestalt_get_isSimulator()
{
  return _MobileGestalt_get_isSimulator();
}

uint64_t SBSCopyDisplayIdentifiers()
{
  return _SBSCopyDisplayIdentifiers();
}

uint64_t SBSRegisterDisplayIdentifiersChangedBlock()
{
  return _SBSRegisterDisplayIdentifiersChangedBlock();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

uint64_t ct_green_tea_logger_create()
{
  return _ct_green_tea_logger_create();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t getCTGreenTeaOsLogHandle()
{
  return _getCTGreenTeaOsLogHandle();
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
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

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return _swift_initEnumMetadataMultiPayload();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
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

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
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

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}