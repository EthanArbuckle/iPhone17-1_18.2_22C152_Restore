void type metadata accessor for UIContentInsetsReference(uint64_t a1)
{
  sub_1E4AC3EE8(a1, &qword_1EAE88B18);
}

void type metadata accessor for ScrollDirection(uint64_t a1)
{
}

void type metadata accessor for CKTranscriptLayoutContext(uint64_t a1)
{
}

void sub_1E4AC3EE8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t _sSo28CKInboxViewControllerFactoryC15MessagesSupportE05inboxbC05modelSo06UIViewC0CSo0A5ModelC_tFZ_0(void *a1)
{
  type metadata accessor for InboxModel(0);
  sub_1E4AC4084();
  sub_1E4ACFA48();
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = a1;
  swift_beginAccess();
  id v3 = a1;
  sub_1E4ACF998();
  swift_endAccess();
  objc_msgSend(v3, sel_setDelegate_, v2);
  sub_1E4ACF958();
  id v4 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1EAE88B98));
  return sub_1E4ACFAB8();
}

unint64_t sub_1E4AC4084()
{
  unint64_t result = qword_1EAE88B90;
  if (!qword_1EAE88B90)
  {
    type metadata accessor for InboxModel(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE88B90);
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

uint64_t DateText.init(date:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  type metadata accessor for MajorTimeChangeCoordinator();
  sub_1E4AC48F0(&qword_1EAE88BA0, v4, (void (*)(uint64_t))type metadata accessor for MajorTimeChangeCoordinator);
  *a2 = sub_1E4ACFA48();
  a2[1] = v5;
  v6 = (char *)a2 + *(int *)(type metadata accessor for DateText() + 20);
  uint64_t v7 = sub_1E4ACF8A8();
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32);
  return v8(v6, a1, v7);
}

uint64_t type metadata accessor for MajorTimeChangeCoordinator()
{
  return self;
}

uint64_t type metadata accessor for DateText()
{
  uint64_t result = qword_1EAE88BC8;
  if (!qword_1EAE88BC8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t DateText.body.getter@<X0>(uint64_t *a1@<X8>)
{
  v58 = a1;
  uint64_t v1 = type metadata accessor for DateText();
  ((void (*)(void))MEMORY[0x1F4188790])();
  uint64_t v52 = (uint64_t)&v49 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1E4ACF938();
  uint64_t v4 = *(void *)(v3 - 8);
  ((void (*)(void))MEMORY[0x1F4188790])();
  v6 = (char *)&v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1E4ACF8A8();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  v51 = (char *)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x1F4188790](v9);
  v13 = (char *)&v49 - v12;
  uint64_t v14 = MEMORY[0x1F4188790](v11);
  v16 = (char *)&v49 - v15;
  MEMORY[0x1F4188790](v14);
  v18 = (char *)&v49 - v17;
  sub_1E4ACF928();
  sub_1E4ACF898();
  v57 = v18;
  sub_1E4ACF908();
  uint64_t v50 = v8;
  v19 = *(void (**)(char *, uint64_t))(v8 + 8);
  v19(v16, v7);
  v20 = *(void (**)(char *, uint64_t))(v4 + 8);
  v20(v6, v3);
  sub_1E4ACF928();
  sub_1E4ACF898();
  v55 = v13;
  sub_1E4ACF908();
  v56 = v19;
  v19(v16, v7);
  uint64_t v21 = v53;
  v20(v6, v3);
  if (!*(void *)v21) {
    goto LABEL_12;
  }
  id v54 = *(id *)(*(void *)v21 + 16);
  sub_1E4ACF928();
  uint64_t v49 = v1;
  char v22 = sub_1E4ACF918();
  v20(v6, v3);
  if ((v22 & 1) == 0)
  {
    v25 = v57;
    char v28 = sub_1E4ACF888();
    uint64_t v29 = v52;
    sub_1E4AC47DC(v21, v52);
    v30 = v51;
    v24 = v55;
    (*(void (**)(char *, char *, uint64_t))(v50 + 16))(v51, v55, v7);
    if (v28)
    {
      v31 = (uint64_t *)v21;
      sub_1E4AC48F0(&qword_1EAE88BB0, 255, MEMORY[0x1E4F27928]);
      char v32 = sub_1E4ACFC68();
      v27 = v56;
      v56(v30, v7);
      sub_1E4AC4840(v29);
      if ((v32 & 1) == 0)
      {
        uint64_t v33 = *v31;
        if (*v31)
        {
          swift_retain();

          id v26 = *(id *)(v33 + 32);
          swift_release();
          goto LABEL_11;
        }
        while (1)
        {
LABEL_12:
          type metadata accessor for MajorTimeChangeCoordinator();
          sub_1E4AC48F0(&qword_1EAE88BA0, v48, (void (*)(uint64_t))type metadata accessor for MajorTimeChangeCoordinator);
          sub_1E4ACFA38();
          __break(1u);
        }
      }
    }
    else
    {
      v27 = v56;
      v56(v30, v7);
      sub_1E4AC4840(v29);
    }
    id v26 = v54;
    goto LABEL_11;
  }
  uint64_t v23 = *(void *)v21;
  v24 = v55;
  v25 = v57;
  if (!*(void *)v21) {
    goto LABEL_12;
  }
  swift_retain();

  id v26 = *(id *)(v23 + 24);
  swift_release();
  v27 = v56;
LABEL_11:
  v34 = (void *)sub_1E4ACF878();
  id v35 = objc_msgSend(v26, sel_stringFromDate_, v34);

  uint64_t v36 = sub_1E4ACFC88();
  v37 = v26;
  uint64_t v39 = v38;

  uint64_t v59 = v36;
  uint64_t v60 = v39;
  sub_1E4AC489C();
  uint64_t v40 = sub_1E4ACFBA8();
  uint64_t v42 = v41;
  LOBYTE(v39) = v43;
  uint64_t v45 = v44;

  v27(v24, v7);
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v27)(v25, v7);
  v47 = v58;
  uint64_t *v58 = v40;
  v47[1] = v42;
  *((unsigned char *)v47 + 16) = v39 & 1;
  v47[3] = v45;
  return result;
}

uint64_t sub_1E4AC47DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DateText();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1E4AC4840(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DateText();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1E4AC489C()
{
  unint64_t result = qword_1EAE88BA8;
  if (!qword_1EAE88BA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE88BA8);
  }
  return result;
}

uint64_t sub_1E4AC48F0(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_1E4AC4940()
{
  return sub_1E4ACFBD8();
}

id sub_1E4AC4960()
{
  uint64_t v0 = sub_1E4ACF8F8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28C10]), sel_init);
  objc_msgSend(v4, sel_setDateStyle_, 1);
  objc_msgSend(v4, sel_setTimeStyle_, 0);
  objc_msgSend(v4, sel_setDoesRelativeDateFormatting_, 0);
  uint64_t v5 = self;
  v6 = (void *)sub_1E4ACFC78();
  sub_1E4ACF8E8();
  uint64_t v7 = (void *)sub_1E4ACF8D8();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  id v8 = objc_msgSend(v5, sel_dateFormatFromTemplate_options_locale_, v6, 0, v7);

  objc_msgSend(v4, sel_setDateFormat_, v8);
  return v4;
}

uint64_t MajorTimeChangeCoordinator.objectWillChange.getter()
{
  return swift_retain();
}

uint64_t MajorTimeChangeCoordinator.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  MajorTimeChangeCoordinator.init()();
  return v0;
}

void *MajorTimeChangeCoordinator.init()()
{
  uint64_t v1 = v0;
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28C10]), sel_init);
  objc_msgSend(v2, sel_setDateStyle_, 1);
  objc_msgSend(v2, sel_setTimeStyle_, 0);
  objc_msgSend(v2, sel_setDoesRelativeDateFormatting_, 1);
  v1[2] = v2;
  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28C10]), sel_init);
  objc_msgSend(v3, sel_setDateStyle_, 0);
  objc_msgSend(v3, sel_setTimeStyle_, 1);
  objc_msgSend(v3, sel_setDoesRelativeDateFormatting_, 1);
  v1[3] = v3;
  v1[4] = sub_1E4AC4960();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE88BB8);
  swift_allocObject();
  uint64_t v4 = sub_1E4ACF978();
  uint64_t v5 = MEMORY[0x1E4FBC860];
  v1[5] = v4;
  v1[6] = v5;
  sub_1E4AC4C4C();
  return v1;
}

uint64_t sub_1E4AC4C4C()
{
  swift_beginAccess();
  unint64_t v1 = *(void *)(v0 + 48);
  uint64_t v24 = v0;
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_1E4ACFD68();
    if (!v2) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v2) {
      goto LABEL_10;
    }
  }
  uint64_t result = self;
  if (v2 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v4 = (void *)result;
  uint64_t v5 = 0;
  do
  {
    if ((v1 & 0xC000000000000001) != 0)
    {
      uint64_t v6 = MEMORY[0x1E4E872B0](v5, v1);
    }
    else
    {
      uint64_t v6 = *(void *)(v1 + 8 * v5 + 32);
      swift_unknownObjectRetain();
    }
    ++v5;
    id v7 = objc_msgSend(v4, sel_defaultCenter, v24);
    objc_msgSend(v7, sel_removeObserver_, v6);
    swift_unknownObjectRelease();
  }
  while (v2 != v5);
LABEL_10:
  swift_bridgeObjectRelease();
  id v8 = self;
  id v9 = objc_msgSend(v8, sel_defaultCenter);
  uint64_t v10 = *MEMORY[0x1E4F436B0];
  uint64_t v11 = self;
  id v12 = objc_msgSend(v11, sel_mainQueue);
  uint64_t v13 = swift_allocObject();
  swift_weakInit();
  uint64_t v29 = sub_1E4AC5D04;
  uint64_t v30 = v13;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v26 = 1107296256;
  v27 = sub_1E4AC5124;
  char v28 = &block_descriptor;
  uint64_t v14 = _Block_copy(&aBlock);
  swift_release();
  id v15 = objc_msgSend(v9, sel_addObserverForName_object_queue_usingBlock_, v10, 0, v12, v14);
  _Block_release(v14);

  uint64_t v16 = swift_beginAccess();
  MEMORY[0x1E4E87220](v16);
  if (*(void *)((*(void *)(v24 + 48) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v24 + 48) & 0xFFFFFFFFFFFFFF8)
                                                                                      + 0x18) >> 1)
    sub_1E4ACFCE8();
  sub_1E4ACFCF8();
  sub_1E4ACFCD8();
  swift_endAccess();
  id v17 = objc_msgSend(v8, sel_defaultCenter);
  uint64_t v18 = *MEMORY[0x1E4F1C370];
  id v19 = objc_msgSend(v11, sel_mainQueue);
  uint64_t v20 = swift_allocObject();
  swift_weakInit();
  uint64_t v29 = sub_1E4AC5D24;
  uint64_t v30 = v20;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v26 = 1107296256;
  v27 = sub_1E4AC5124;
  char v28 = &block_descriptor_8;
  uint64_t v21 = _Block_copy(&aBlock);
  swift_release();
  id v22 = objc_msgSend(v17, sel_addObserverForName_object_queue_usingBlock_, v18, 0, v19, v21);
  _Block_release(v21);

  uint64_t v23 = swift_beginAccess();
  MEMORY[0x1E4E87220](v23);
  if (*(void *)((*(void *)(v24 + 48) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v24 + 48) & 0xFFFFFFFFFFFFFF8)
                                                                                      + 0x18) >> 1)
    sub_1E4ACFCE8();
  sub_1E4ACFCF8();
  sub_1E4ACFCD8();
  return swift_endAccess();
}

uint64_t sub_1E4AC5080()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    swift_retain();
    swift_release();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE88BB8);
    sub_1E4AC5D2C(&qword_1EAE88BD8);
    sub_1E4ACF988();
    return swift_release();
  }
  return result;
}

uint64_t sub_1E4AC5124(uint64_t a1)
{
  uint64_t v2 = sub_1E4ACF858();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void (**)(char *))(a1 + 32);
  sub_1E4ACF848();
  swift_retain();
  v6(v5);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_1E4AC5218()
{
  uint64_t v0 = sub_1E4ACF8F8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = &v11[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    id v5 = *(id *)(Strong + 32);
    swift_release();
    uint64_t v6 = self;
    id v7 = (void *)sub_1E4ACFC78();
    sub_1E4ACF8E8();
    uint64_t v8 = (void *)sub_1E4ACF8D8();
    (*(void (**)(unsigned char *, uint64_t))(v1 + 8))(v3, v0);
    id v9 = objc_msgSend(v6, sel_dateFormatFromTemplate_options_locale_, v7, 0, v8);

    objc_msgSend(v5, sel_setDateFormat_, v9);
  }
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    swift_retain();
    swift_release();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE88BB8);
    sub_1E4AC5D2C(&qword_1EAE88BD8);
    sub_1E4ACF988();
    return swift_release();
  }
  return result;
}

uint64_t MajorTimeChangeCoordinator.deinit()
{
  swift_beginAccess();
  unint64_t v1 = *(void *)(v0 + 48);
  if (!(v1 >> 62))
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v2) {
      goto LABEL_3;
    }
LABEL_10:
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF78E8);
    uint64_t v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_1E4AD0AB0;
    *(void *)(v8 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v8 + 32) = 0xD000000000000012;
    *(void *)(v8 + 40) = 0x80000001E4AD1300;
    sub_1E4ACFDE8();
    swift_bridgeObjectRelease();

    swift_release();
    swift_bridgeObjectRelease();
    return v0;
  }
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_1E4ACFD68();
  if (!v2) {
    goto LABEL_10;
  }
LABEL_3:
  uint64_t result = self;
  if (v2 >= 1)
  {
    uint64_t v4 = (void *)result;
    uint64_t v5 = 0;
    do
    {
      if ((v1 & 0xC000000000000001) != 0)
      {
        uint64_t v6 = MEMORY[0x1E4E872B0](v5, v1);
      }
      else
      {
        uint64_t v6 = *(void *)(v1 + 8 * v5 + 32);
        swift_unknownObjectRetain();
      }
      ++v5;
      id v7 = objc_msgSend(v4, sel_defaultCenter);
      objc_msgSend(v7, sel_removeObserver_, v6);
      swift_unknownObjectRelease();
    }
    while (v2 != v5);
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t MajorTimeChangeCoordinator.__deallocating_deinit()
{
  MajorTimeChangeCoordinator.deinit();
  return MEMORY[0x1F4186488](v0, 56, 7);
}

uint64_t sub_1E4AC5624()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1E4AC5640()
{
  return sub_1E4AC5D2C(&qword_1EAE88BC0);
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

uint64_t sub_1E4AC56BC@<X0>(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 40);
  return swift_retain();
}

uint64_t *initializeBufferWithCopyOfBuffer for DateText(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v5 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a1;
    a1[1] = a2[1];
    uint64_t v6 = *(int *)(a3 + 20);
    id v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = sub_1E4ACF8A8();
    uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
    swift_retain();
    v10(v7, v8, v9);
  }
  return v5;
}

uint64_t destroy for DateText(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_1E4ACF8A8();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *initializeWithCopy for DateText(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (char *)a1 + v5;
  id v7 = (char *)a2 + v5;
  uint64_t v8 = sub_1E4ACF8A8();
  uint64_t v9 = *(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16);
  swift_retain();
  v9(v6, v7, v8);
  return a1;
}

void *assignWithCopy for DateText(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  uint64_t v6 = *(int *)(a3 + 20);
  id v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1E4ACF8A8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *initializeWithTake for DateText(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_1E4ACF8A8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void *assignWithTake for DateText(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1E4ACF8A8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for DateText(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1E4AC5A84);
}

uint64_t sub_1E4AC5A84(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = sub_1E4ACF8A8();
    uint64_t v10 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48);
    uint64_t v11 = v9;
    id v12 = (char *)a1 + *(int *)(a3 + 20);
    return v10(v12, a2, v11);
  }
}

uint64_t storeEnumTagSinglePayload for DateText(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1E4AC5B54);
}

void *sub_1E4AC5B54(void *result, uint64_t a2, int a3, uint64_t a4)
{
  int v5 = result;
  if (a3 == 2147483646)
  {
    *uint64_t result = a2;
  }
  else
  {
    uint64_t v7 = sub_1E4ACF8A8();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_1E4AC5BFC()
{
  uint64_t result = sub_1E4ACF8A8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t method lookup function for MajorTimeChangeCoordinator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for MajorTimeChangeCoordinator);
}

uint64_t dispatch thunk of MajorTimeChangeCoordinator.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t sub_1E4AC5CC0()
{
  return MEMORY[0x1E4F3E2E8];
}

uint64_t sub_1E4AC5CCC()
{
  swift_weakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1E4AC5D04()
{
  return sub_1E4AC5080();
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

uint64_t sub_1E4AC5D24()
{
  return sub_1E4AC5218();
}

uint64_t sub_1E4AC5D2C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE88BB8);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

id static TranscriptLayoutUtilities.layoutSize(size:)(double a1, double a2)
{
  uint64_t v4 = self;
  id v5 = objc_msgSend(v4, sel_absoluteDimension_, a1);
  id v6 = objc_msgSend(v4, sel_absoluteDimension_, a2);
  id v7 = objc_msgSend(self, sel_sizeWithWidthDimension_heightDimension_, v5, v6);

  return v7;
}

id static TranscriptLayoutUtilities.dynamicWidthLayoutSize(height:)(double a1)
{
  uint64_t v2 = self;
  id v3 = objc_msgSend(v2, sel_fractionalWidthDimension_, 1.0);
  id v4 = objc_msgSend(v2, sel_absoluteDimension_, a1);
  id v5 = objc_msgSend(self, sel_sizeWithWidthDimension_heightDimension_, v3, v4);

  return v5;
}

id TranscriptLayoutUtilities.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id TranscriptLayoutUtilities.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id TranscriptLayoutUtilities.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id _s15MessagesSupport25TranscriptLayoutUtilitiesC012dynamicWidthD5Group10layoutItemSo012NSCollectiondH0CSo0kdJ0C_tFZ_0(void *a1)
{
  id v2 = objc_msgSend(self, sel_fractionalWidthDimension_, 1.0);
  id v3 = objc_msgSend(a1, sel_layoutSize);
  id v4 = objc_msgSend(v3, sel_heightDimension);

  id v5 = objc_msgSend(self, sel_sizeWithWidthDimension_heightDimension_, v2, v4);
  id v6 = self;
  __swift_instantiateConcreteTypeFromMangledName(qword_1EBFF78F0);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1E4AD0BF0;
  *(void *)(v7 + 32) = a1;
  sub_1E4ACFCD8();
  sub_1E4AC6330();
  id v8 = a1;
  uint64_t v9 = (void *)sub_1E4ACFCB8();
  swift_bridgeObjectRelease();
  id v10 = objc_msgSend(v6, sel_verticalGroupWithLayoutSize_subitems_, v5, v9);

  return v10;
}

uint64_t type metadata accessor for TranscriptLayoutUtilities()
{
  return self;
}

unint64_t sub_1E4AC6330()
{
  unint64_t result = qword_1EBFF78C0;
  if (!qword_1EBFF78C0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBFF78C0);
  }
  return result;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

ValueMetadata *type metadata accessor for InboxView()
{
  return &type metadata for InboxView;
}

uint64_t sub_1E4AC6398()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1E4AC63B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE88BE0);
  MEMORY[0x1F4188790](v6 - 8);
  id v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE88BE8);
  uint64_t v10 = v9 - 8;
  MEMORY[0x1F4188790](v9);
  id v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)id v8 = sub_1E4ACFAA8();
  *((void *)v8 + 1) = 0;
  v8[16] = 1;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE88BF0);
  sub_1E4AC6558(a1, a2, (uint64_t)&v8[*(int *)(v13 + 44)]);
  id v14 = objc_msgSend(self, sel_systemGroupedBackgroundColor);
  uint64_t v15 = MEMORY[0x1E4E87180](v14);
  LOBYTE(a1) = sub_1E4ACFAF8();
  sub_1E4AC7EE0((uint64_t)v8, (uint64_t)v12, &qword_1EAE88BE0);
  uint64_t v16 = &v12[*(int *)(v10 + 44)];
  *(void *)uint64_t v16 = v15;
  v16[8] = a1;
  sub_1E4AC7F44((uint64_t)v8, &qword_1EAE88BE0);
  char v17 = sub_1E4ACFB08();
  sub_1E4AC7EE0((uint64_t)v12, a3, &qword_1EAE88BE8);
  *(unsigned char *)(a3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EAE88BF8) + 36)) = v17;
  return sub_1E4AC7F44((uint64_t)v12, &qword_1EAE88BE8);
}

uint64_t sub_1E4AC6558@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE88C00);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE88C08);
  MEMORY[0x1F4188790](v48);
  uint64_t v11 = (char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE88C10);
  MEMORY[0x1F4188790](v49);
  uint64_t v13 = (char *)&v45 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE88C18);
  uint64_t v14 = *(void *)(v56 - 8);
  MEMORY[0x1F4188790](v56);
  uint64_t v16 = (char *)&v45 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE88C20);
  uint64_t v18 = MEMORY[0x1F4188790](v17 - 8);
  MEMORY[0x1F4188790](v18);
  uint64_t v54 = (uint64_t)&v45 - v20;
  if (a1)
  {
    uint64_t v51 = a2;
    uint64_t v52 = v11;
    uint64_t v55 = v19;
    uint64_t v53 = v6;
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_1E4ACF9D8();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v50 = v16;
    if (v60)
    {
      sub_1E4AC7D34();
      sub_1E4AC7D88();
      uint64_t v57 = 0;
      uint64_t v58 = 0;
      char v59 = 0;
    }
    else
    {
      type metadata accessor for InboxModel(0);
      sub_1E4AC87FC((unint64_t *)&qword_1EAE88B90, (void (*)(uint64_t))type metadata accessor for InboxModel);
      uint64_t v57 = sub_1E4ACFA48();
      uint64_t v58 = v21;
      char v59 = 1;
      sub_1E4AC7D34();
      sub_1E4AC7D88();
    }
    sub_1E4ACFAC8();
    uint64_t v23 = v60;
    uint64_t v22 = v61;
    char v24 = v62;
    id v25 = objc_msgSend(*(id *)(a1 + 16), sel_footerAction);
    uint64_t v26 = 1;
    if (v25)
    {
      _Block_release(v25);
      uint64_t v27 = swift_allocObject();
      uint64_t v46 = a3;
      uint64_t v47 = v14;
      uint64_t v28 = v51;
      *(void *)(v27 + 16) = a1;
      *(void *)(v27 + 24) = v28;
      swift_retain();
      sub_1E4ACFC38();
      uint64_t KeyPath = swift_getKeyPath();
      uint64_t v30 = (uint64_t)v52;
      uint64_t v31 = v53;
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v52, v9, v53);
      uint64_t v32 = v30 + *(int *)(v48 + 36);
      *(void *)uint64_t v32 = KeyPath;
      *(unsigned char *)(v32 + 8) = 1;
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v31);
      uint64_t v33 = sub_1E4ACFB58();
      uint64_t v34 = swift_getKeyPath();
      sub_1E4AC7EE0(v30, (uint64_t)v13, &qword_1EAE88C08);
      id v35 = (uint64_t *)&v13[*(int *)(v49 + 36)];
      *id v35 = v34;
      v35[1] = v33;
      a3 = v46;
      sub_1E4AC7F44(v30, &qword_1EAE88C08);
      char v36 = sub_1E4ACFAF8();
      uint64_t v37 = (uint64_t)v50;
      sub_1E4AC7EE0((uint64_t)v13, (uint64_t)v50, &qword_1EAE88C10);
      uint64_t v38 = v56;
      uint64_t v39 = v37 + *(int *)(v56 + 36);
      *(unsigned char *)uint64_t v39 = v36;
      *(_OWORD *)(v39 + 8) = 0u;
      *(_OWORD *)(v39 + 24) = 0u;
      *(unsigned char *)(v39 + 40) = 1;
      uint64_t v14 = v47;
      sub_1E4AC7F44((uint64_t)v13, &qword_1EAE88C10);
      uint64_t v40 = v37;
      uint64_t v41 = v54;
      sub_1E4AC831C(v40, v54, &qword_1EAE88C18);
      uint64_t v26 = 0;
    }
    else
    {
      uint64_t v38 = v56;
      uint64_t v41 = v54;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56))(v41, v26, 1, v38);
    uint64_t v42 = v55;
    sub_1E4AC7EE0(v41, v55, &qword_1EAE88C20);
    *(void *)a3 = v23;
    *(void *)(a3 + 8) = v22;
    *(unsigned char *)(a3 + 16) = v24;
    uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE88C38);
    sub_1E4AC7EE0(v42, a3 + *(int *)(v43 + 48), &qword_1EAE88C20);
    sub_1E4AC7DDC(v23, v22, v24);
    sub_1E4AC7F44(v41, &qword_1EAE88C20);
    sub_1E4AC7F44(v42, &qword_1EAE88C20);
    return sub_1E4AC7DE8(v23, v22, v24);
  }
  else
  {
    type metadata accessor for InboxModel(0);
    sub_1E4AC87FC((unint64_t *)&qword_1EAE88B90, (void (*)(uint64_t))type metadata accessor for InboxModel);
    uint64_t result = sub_1E4ACFA38();
    __break(1u);
  }
  return result;
}

void sub_1E4AC6B7C(uint64_t a1)
{
  if (a1)
  {
    id v1 = objc_msgSend(*(id *)(a1 + 16), sel_footerAction);
    if (v1)
    {
      id v2 = v1;
      (*((void (**)(void))v1 + 2))();
      _Block_release(v2);
    }
  }
  else
  {
    type metadata accessor for InboxModel(0);
    sub_1E4AC87FC((unint64_t *)&qword_1EAE88B90, (void (*)(uint64_t))type metadata accessor for InboxModel);
    sub_1E4ACFA38();
    __break(1u);
  }
}

void sub_1E4AC6C40(uint64_t a1@<X8>)
{
  if (qword_1EAE88B10 != -1) {
    swift_once();
  }
  if (qword_1EAE89810)
  {
    id v1 = (id)qword_1EAE89810;
    sub_1E4ACF868();

    sub_1E4AC489C();
    uint64_t v2 = sub_1E4ACFBA8();
    uint64_t v4 = v3;
    char v6 = v5 & 1;
    uint64_t v7 = self;
    MEMORY[0x1E4E87180](objc_msgSend(v7, sel_secondaryLabelColor, 0xE000000000000000));
    uint64_t v8 = sub_1E4ACFB78();
    uint64_t v30 = v9;
    uint64_t v31 = v8;
    char v11 = v10;
    swift_release();
    sub_1E4AC7FA0(v2, v4, v6);
    swift_bridgeObjectRelease();
    if (qword_1EAE89810)
    {
      id v12 = (id)qword_1EAE89810;
      sub_1E4ACF868();

      uint64_t v13 = sub_1E4ACFBA8();
      uint64_t v15 = v14;
      char v17 = v16 & 1;
      MEMORY[0x1E4E87180](objc_msgSend(v7, sel_linkColor, 0xE000000000000000));
      uint64_t v18 = sub_1E4ACFB78();
      uint64_t v20 = v19;
      char v22 = v21;
      swift_release();
      sub_1E4AC7FA0(v13, v15, v17);
      swift_bridgeObjectRelease();
      uint64_t v28 = sub_1E4ACFB88();
      uint64_t v29 = v23;
      uint64_t v25 = v24;
      char v27 = v26;
      sub_1E4AC7FA0(v18, v20, v22 & 1);
      swift_bridgeObjectRelease();
      sub_1E4AC7FA0(v31, v30, v11 & 1);
      swift_bridgeObjectRelease();
      *(void *)a1 = v28;
      *(void *)(a1 + 8) = v25;
      *(unsigned char *)(a1 + 16) = v27 & 1;
      *(void *)(a1 + 24) = v29;
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_1E4AC6F3C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4AC63B4(*v1, v1[1], a1);
}

uint64_t sub_1E4AC6F44()
{
  uint64_t v0 = sub_1E4ACFAE8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for InboxModel(0);
  sub_1E4AC87FC((unint64_t *)&qword_1EAE88B90, (void (*)(uint64_t))type metadata accessor for InboxModel);
  v6[0] = sub_1E4ACFA48();
  v6[1] = v4;
  sub_1E4ACFAD8();
  sub_1E4AC82C0();
  sub_1E4ACFBF8();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return swift_release();
}

uint64_t sub_1E4AC7098@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v39 = a3;
  uint64_t v5 = sub_1E4ACFA28();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE88C70);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  id v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE88C78);
  uint64_t v33 = *(void *)(v35 - 8);
  MEMORY[0x1F4188790](v35);
  uint64_t v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE88C80);
  uint64_t v37 = *(void *)(v15 - 8);
  uint64_t v38 = v15;
  MEMORY[0x1F4188790](v15);
  char v36 = (char *)&v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE88C88);
  MEMORY[0x1F4188790](v34);
  uint64_t v18 = (char *)&v32 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = a1;
  uint64_t v41 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE88C90);
  sub_1E4AC8678(&qword_1EAE88C98, &qword_1EAE88C90);
  sub_1E4ACFB68();
  sub_1E4ACFA18();
  uint64_t v19 = sub_1E4AC8678(&qword_1EAE88CA0, &qword_1EAE88C70);
  sub_1E4ACFBF8();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  if (qword_1EAE88B10 != -1) {
    uint64_t result = swift_once();
  }
  if (qword_1EAE89810)
  {
    id v21 = (id)qword_1EAE89810;
    uint64_t v22 = sub_1E4ACF868();
    uint64_t v24 = v23;

    uint64_t v46 = v22;
    uint64_t v47 = v24;
    uint64_t v42 = v9;
    uint64_t v43 = v5;
    uint64_t v44 = v19;
    uint64_t v45 = MEMORY[0x1E4F3CDC8];
    swift_getOpaqueTypeConformance2();
    sub_1E4AC489C();
    uint64_t v25 = v35;
    char v26 = v36;
    sub_1E4ACFBE8();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v14, v25);
    id v27 = objc_msgSend(self, sel_systemGroupedBackgroundColor);
    uint64_t v28 = MEMORY[0x1E4E87180](v27);
    LOBYTE(v22) = sub_1E4ACFAF8();
    uint64_t v30 = v37;
    uint64_t v29 = v38;
    (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v18, v26, v38);
    uint64_t v31 = &v18[*(int *)(v34 + 36)];
    *(void *)uint64_t v31 = v28;
    v31[8] = v22;
    (*(void (**)(char *, uint64_t))(v30 + 8))(v26, v29);
    return sub_1E4AC831C((uint64_t)v18, v39, &qword_1EAE88C88);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_1E4AC75C4(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE88CA8);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x1F4188790](v4);
  uint64_t v8 = (char *)v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  uint64_t v10 = (char *)v22 - v9;
  if (!a1) {
    goto LABEL_18;
  }
  id v11 = objc_msgSend(*(id *)(a1 + 16), sel_sections);
  sub_1E4AC8380();
  unint64_t v12 = sub_1E4ACFCC8();

  unint64_t v23 = v12;
  unint64_t v13 = v12 >> 62;
  if (!(v12 >> 62))
  {
    if (*(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_4;
    }
    goto LABEL_12;
  }
  swift_bridgeObjectRetain();
  uint64_t v19 = sub_1E4ACFD68();
  swift_bridgeObjectRelease();
  if (v19)
  {
    swift_bridgeObjectRetain();
    uint64_t v20 = sub_1E4ACFD68();
    swift_bridgeObjectRelease();
    if (v20)
    {
LABEL_4:
      if ((v12 & 0xC000000000000001) == 0)
      {
        if (!*(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
LABEL_16:
          __break(1u);
          goto LABEL_17;
        }
        id v14 = *(id *)(v12 + 32);
        if (!v13) {
          goto LABEL_7;
        }
        goto LABEL_14;
      }
LABEL_13:
      id v14 = (id)MEMORY[0x1E4E872B0](0, v12);
      if (!v13)
      {
LABEL_7:
        if (*(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
LABEL_8:
          sub_1E4AC83C0(0, 1);
          v22[2] = v23;
          v22[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE88CB8);
          sub_1E4ACF8C8();
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE88CC0);
          sub_1E4AC8678(&qword_1EAE88CC8, &qword_1EAE88CB8);
          sub_1E4AC86BC();
          sub_1E4AC87FC(&qword_1EAE88CF0, (void (*)(uint64_t))sub_1E4AC8380);
          sub_1E4ACFC48();
          uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
          v15(v8, v10, v4);
          *(void *)a2 = v14;
          uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE88CF8);
          v15(&a2[*(int *)(v16 + 48)], v8, v4);
          uint64_t v17 = *(void (**)(char *, uint64_t))(v5 + 8);
          id v18 = v14;
          v17(v10, v4);
          v17(v8, v4);

          return;
        }
        goto LABEL_15;
      }
LABEL_14:
      swift_bridgeObjectRetain();
      uint64_t v21 = sub_1E4ACFD68();
      swift_bridgeObjectRelease();
      if (v21) {
        goto LABEL_8;
      }
LABEL_15:
      __break(1u);
      goto LABEL_16;
    }
    __break(1u);
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
LABEL_17:
  __break(1u);
LABEL_18:
  type metadata accessor for InboxModel(0);
  sub_1E4AC87FC((unint64_t *)&qword_1EAE88B90, (void (*)(uint64_t))type metadata accessor for InboxModel);
  sub_1E4ACFA38();
  __break(1u);
}

uint64_t sub_1E4AC79A4@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE88CC0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *a1;
  sub_1E4AC7B88((uint64_t *)v25);
  long long v23 = v25[0];
  long long v24 = v25[1];
  id v9 = objc_msgSend(v8, sel_footer);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = sub_1E4ACFC88();
    uint64_t v13 = v12;

    uint64_t v19 = v11;
    uint64_t v20 = v13;
    sub_1E4AC489C();
    id v9 = (id)sub_1E4ACFBA8();
    uint64_t v17 = v16 & 1;
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v17 = 0;
    uint64_t v15 = 0;
  }
  uint64_t v19 = (uint64_t)v9;
  uint64_t v20 = v14;
  uint64_t v21 = v17;
  uint64_t v22 = v15;
  MEMORY[0x1F4188790](v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE88CE0);
  sub_1E4AC873C();
  sub_1E4AC87A8();
  sub_1E4ACFC58();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(a2, v7, v4);
}

id sub_1E4AC7B88@<X0>(uint64_t *a1@<X8>)
{
  id result = objc_msgSend(v1, sel_header);
  if (result)
  {
    uint64_t v4 = result;
    sub_1E4ACFC88();

    sub_1E4AC489C();
    uint64_t v5 = sub_1E4ACFBA8();
    uint64_t v7 = v6;
    char v9 = v8 & 1;
    sub_1E4ACFB38();
    sub_1E4ACFB28();
    sub_1E4ACFB48();
    swift_release();
    uint64_t v10 = sub_1E4ACFB98();
    uint64_t v12 = v11;
    char v14 = v13;
    swift_release();
    char v15 = v14 & 1;
    sub_1E4AC7FA0(v5, v7, v9);
    swift_bridgeObjectRelease();
    id v16 = objc_msgSend(self, sel_labelColor);
    MEMORY[0x1E4E87180](v16);
    uint64_t v17 = sub_1E4ACFB78();
    uint64_t v19 = v18;
    char v21 = v20;
    uint64_t v23 = v22;
    swift_release();
    uint64_t v24 = v21 & 1;
    sub_1E4AC7FA0(v10, v12, v15);
    id result = (id)swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v17 = 0;
    uint64_t v19 = 0;
    uint64_t v24 = 0;
    uint64_t v23 = 0;
  }
  *a1 = v17;
  a1[1] = v19;
  a1[2] = v24;
  a1[3] = v23;
  return result;
}

uint64_t sub_1E4AC7D24@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4AC7098(*v1, v1[1], a1);
}

unint64_t sub_1E4AC7D34()
{
  unint64_t result = qword_1EAE88C28;
  if (!qword_1EAE88C28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE88C28);
  }
  return result;
}

unint64_t sub_1E4AC7D88()
{
  unint64_t result = qword_1EAE88C30;
  if (!qword_1EAE88C30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE88C30);
  }
  return result;
}

uint64_t sub_1E4AC7DDC(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_1E4AC7DE8(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  return result;
}

uint64_t sub_1E4AC7DF4()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

void sub_1E4AC7E2C()
{
  sub_1E4AC6B7C(*(void *)(v0 + 16));
}

uint64_t sub_1E4AC7E34@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1E4ACFA58();
  *a1 = result;
  return result;
}

uint64_t sub_1E4AC7E60()
{
  return sub_1E4ACFA68();
}

uint64_t sub_1E4AC7E88@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1E4ACFA78();
  *a1 = result;
  return result;
}

uint64_t sub_1E4AC7EB4()
{
  return sub_1E4ACFA88();
}

uint64_t sub_1E4AC7EE0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1E4AC7F44(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1E4AC7FA0(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

void *initializeBufferWithCopyOfBuffer for InboxSidebarList(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for InboxSidebarList()
{
  return swift_release();
}

void *assignWithCopy for InboxContentView(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  return a1;
}

void *assignWithTake for InboxSidebarList(void *a1, void *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for InboxContentView(uint64_t *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for InboxContentView(uint64_t result, unsigned int a2, unsigned int a3)
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

ValueMetadata *type metadata accessor for InboxSidebarList()
{
  return &type metadata for InboxSidebarList;
}

ValueMetadata *type metadata accessor for InboxGroupedList()
{
  return &type metadata for InboxGroupedList;
}

unint64_t sub_1E4AC8148()
{
  unint64_t result = qword_1EAE88C40;
  if (!qword_1EAE88C40)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE88BF8);
    sub_1E4AC81C4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE88C40);
  }
  return result;
}

unint64_t sub_1E4AC81C4()
{
  unint64_t result = qword_1EAE88C48;
  if (!qword_1EAE88C48)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE88BE8);
    sub_1E4AC8678(&qword_1EAE88C50, &qword_1EAE88BE0);
    sub_1E4AC8678(&qword_1EAE88C58, &qword_1EAE88C60);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE88C48);
  }
  return result;
}

uint64_t sub_1E4AC8288()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1E4AC82A4()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1E4AC82C0()
{
  unint64_t result = qword_1EAE88C68;
  if (!qword_1EAE88C68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE88C68);
  }
  return result;
}

void sub_1E4AC8314(char *a1@<X8>)
{
  sub_1E4AC75C4(*(void *)(v1 + 16), a1);
}

uint64_t sub_1E4AC831C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_1E4AC8380()
{
  unint64_t result = qword_1EAE88CB0;
  if (!qword_1EAE88CB0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EAE88CB0);
  }
  return result;
}

uint64_t sub_1E4AC83C0(uint64_t a1, uint64_t a2)
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
      if (*(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= a2) {
        goto LABEL_4;
      }
LABEL_32:
      __break(1u);
      goto LABEL_33;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_1E4ACFD68();
  swift_bridgeObjectRelease();
  if (v21 < v2) {
    goto LABEL_32;
  }
LABEL_4:
  uint64_t v6 = v2 - v4;
  if (__OFSUB__(v2, v4))
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  uint64_t v5 = v4 - v2;
  if (__OFSUB__(0, v6))
  {
LABEL_34:
    __break(1u);
LABEL_35:
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1E4ACFD68();
    swift_bridgeObjectRelease();
    uint64_t v8 = v7 + v5;
    if (!__OFADD__(v7, v5)) {
      goto LABEL_8;
    }
LABEL_37:
    __break(1u);
LABEL_38:
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_1E4ACFD68();
    swift_bridgeObjectRelease();
    unint64_t v9 = *v3;
    goto LABEL_15;
  }
  if (*v3 >> 62) {
    goto LABEL_35;
  }
  uint64_t v7 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v8 = v7 - v6;
  if (__OFADD__(v7, v5)) {
    goto LABEL_37;
  }
LABEL_8:
  unint64_t v9 = *v3;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v3 = v9;
  uint64_t v7 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v9 & 0x8000000000000000) == 0 && (v9 & 0x4000000000000000) == 0)
  {
    uint64_t v11 = v9 & 0xFFFFFFFFFFFFFF8;
    if (v8 <= *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_18;
    }
    uint64_t v7 = 1;
  }
  if (v9 >> 62) {
    goto LABEL_38;
  }
  uint64_t v12 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_15:
  if (v12 <= v8) {
    uint64_t v12 = v8;
  }
  swift_bridgeObjectRetain();
  *uint64_t v3 = MEMORY[0x1E4E872C0](v7, v12, 1, v9);
  swift_bridgeObjectRelease();
  uint64_t v11 = *v3 & 0xFFFFFFFFFFFFFF8;
LABEL_18:
  uint64_t v13 = v11 + 32;
  char v14 = (char *)(v11 + 32 + 8 * v4);
  sub_1E4AC8380();
  uint64_t result = swift_arrayDestroy();
  if (v5)
  {
    if (*v3 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v22 = sub_1E4ACFD68();
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v17 = v22 - v2;
      if (!__OFSUB__(v22, v2)) {
        goto LABEL_21;
      }
    }
    else
    {
      uint64_t v16 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t v17 = v16 - v2;
      if (!__OFSUB__(v16, v2))
      {
LABEL_21:
        uint64_t v18 = (char *)(v13 + 8 * v2);
        if (v4 != v2 || v14 >= &v18[8 * v17]) {
          uint64_t result = (uint64_t)memmove(v14, v18, 8 * v17);
        }
        if (!(*v3 >> 62))
        {
          uint64_t v19 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
          uint64_t v20 = v19 + v5;
          if (!__OFADD__(v19, v5))
          {
LABEL_26:
            *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10) = v20;
            goto LABEL_27;
          }
LABEL_44:
          __break(1u);
          return result;
        }
LABEL_42:
        swift_bridgeObjectRetain();
        uint64_t v23 = sub_1E4ACFD68();
        uint64_t result = swift_bridgeObjectRelease();
        uint64_t v20 = v23 + v5;
        if (!__OFADD__(v23, v5)) {
          goto LABEL_26;
        }
        goto LABEL_44;
      }
    }
    __break(1u);
    goto LABEL_42;
  }
LABEL_27:
  return sub_1E4ACFCD8();
}

uint64_t sub_1E4AC8678(unint64_t *a1, uint64_t *a2)
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

unint64_t sub_1E4AC86BC()
{
  unint64_t result = qword_1EAE88CD0;
  if (!qword_1EAE88CD0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE88CC0);
    sub_1E4AC873C();
    sub_1E4AC87A8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE88CD0);
  }
  return result;
}

unint64_t sub_1E4AC873C()
{
  unint64_t result = qword_1EAE88CD8;
  if (!qword_1EAE88CD8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE88CE0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE88CD8);
  }
  return result;
}

unint64_t sub_1E4AC87A8()
{
  unint64_t result = qword_1EAE88CE8;
  if (!qword_1EAE88CE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE88CE8);
  }
  return result;
}

uint64_t sub_1E4AC87FC(unint64_t *a1, void (*a2)(uint64_t))
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

id sub_1E4AC8844@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void **)(v1 + 16);
  *a1 = v2;
  return v2;
}

uint64_t sub_1E4AC8850()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1E4AC88C0()
{
  unint64_t result = qword_1EAE88D00;
  if (!qword_1EAE88D00)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE88C88);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE88C78);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE88C70);
    sub_1E4ACFA28();
    sub_1E4AC8678(&qword_1EAE88CA0, &qword_1EAE88C70);
    swift_getOpaqueTypeConformance2();
    sub_1E4AC489C();
    swift_getOpaqueTypeConformance2();
    sub_1E4AC8678(&qword_1EAE88C58, &qword_1EAE88C60);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE88D00);
  }
  return result;
}

uint64_t sub_1E4AC8A38()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1E4ACF9D8();
  swift_release();
  swift_release();
  return v1;
}

void _sSo14CKInboxSectionC15MessagesSupportE2id10Foundation4UUIDVvg_0()
{
  id v1 = objc_msgSend(v0, sel_identifier);
  sub_1E4ACF8B8();
}

void sub_1E4AC8B18()
{
  id v1 = objc_msgSend(*v0, sel_identifier);
  sub_1E4ACF8B8();
}

uint64_t sub_1E4AC8B78@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1E4ACF9D8();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_1E4AC8BF8()
{
  return sub_1E4ACF9E8();
}

uint64_t sub_1E4AC8C6C()
{
  id v1 = (char *)v0 + OBJC_IVAR____TtC15MessagesSupport10InboxModel__isCollapsed;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE88DC0);
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *((unsigned int *)*v0 + 12);
  uint64_t v4 = *((unsigned __int16 *)*v0 + 26);
  return MEMORY[0x1F4186488](v0, v3, v4);
}

uint64_t sub_1E4AC8D18@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1E4ACF968();
  *a1 = result;
  return result;
}

uint64_t InboxItem.id.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR___CKInboxItemSwift_identifier;
  uint64_t v4 = sub_1E4ACF8C8();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t InboxItem.title.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___CKInboxItemSwift_title);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InboxItem.subtitle.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___CKInboxItemSwift_subtitle);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InboxItem.systemImage.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___CKInboxItemSwift_systemImage);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InboxItem.accessoryText.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1E4ACF9D8();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1E4AC8F78@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1E4ACF9D8();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_1E4AC8FFC(uint64_t a1, void **a2)
{
  uint64_t v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  id v3 = v2;
  return sub_1E4ACF9E8();
}

uint64_t InboxItem.accessoryText.setter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v1 = v0;
  return sub_1E4ACF9E8();
}

void (*InboxItem.accessoryText.modify(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_1E4ACF9C8();
  return sub_1E4AC9184;
}

void sub_1E4AC9184(void *a1)
{
  id v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();
  free(v1);
}

uint64_t InboxItem.$accessoryText.getter()
{
  return swift_endAccess();
}

uint64_t sub_1E4AC9250()
{
  return swift_endAccess();
}

uint64_t sub_1E4AC92B8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE88D18);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x1F4188790](v2);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  uint64_t v8 = (char *)&v11 - v7;
  unint64_t v9 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v9((char *)&v11 - v7, a1, v2);
  v9(v6, (uint64_t)v8, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE88D10);
  sub_1E4ACF9B8();
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
}

uint64_t InboxItem.$accessoryText.setter(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE88D18);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE88D10);
  sub_1E4ACF9B8();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void (*InboxItem.$accessoryText.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE88D18);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR___CKInboxItemSwift__accessoryText;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE88D10);
  sub_1E4ACF9A8();
  swift_endAccess();
  return sub_1E4AC9668;
}

void sub_1E4AC9668(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)a1;
  uint64_t v4 = *(void (**)(void, void, void))(*(void *)(*(void *)a1 + 88) + 16);
  v4(*(void *)(*(void *)a1 + 104), v3[14], v3[10]);
  uint64_t v5 = (void *)v3[14];
  size_t v6 = (void *)v3[12];
  uint64_t v7 = (void *)v3[13];
  uint64_t v8 = v3[10];
  uint64_t v9 = v3[11];
  if (a2)
  {
    v4(v3[12], v3[13], v3[10]);
    swift_beginAccess();
    sub_1E4ACF9B8();
    swift_endAccess();
    uint64_t v10 = *(void (**)(void *, uint64_t))(v9 + 8);
    v10(v7, v8);
    v10(v5, v8);
  }
  else
  {
    swift_beginAccess();
    sub_1E4ACF9B8();
    swift_endAccess();
    (*(void (**)(void *, uint64_t))(v9 + 8))(v5, v8);
  }
  free(v5);
  free(v7);
  free(v6);
  free(v3);
}

id InboxItem.__allocating_init(identifier:title:subtitle:systemImage:accessoryText:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unint64_t a9)
{
  id v18 = objc_allocWithZone(v9);
  return InboxItem.init(identifier:title:subtitle:systemImage:accessoryText:)(a1, a2, a3, a4, a5, a6, a7, a8, a9);
}

id InboxItem.init(identifier:title:subtitle:systemImage:accessoryText:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unint64_t a9)
{
  uint64_t v10 = v9;
  unint64_t v16 = a9;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v17 = &v9[OBJC_IVAR___CKInboxItemSwift_identifier];
  uint64_t v18 = sub_1E4ACF8C8();
  uint64_t v19 = *(void *)(v18 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v17, a1, v18);
  uint64_t v20 = &v10[OBJC_IVAR___CKInboxItemSwift_title];
  *(void *)uint64_t v20 = a2;
  *((void *)v20 + 1) = a3;
  uint64_t v21 = &v10[OBJC_IVAR___CKInboxItemSwift_subtitle];
  *(void *)uint64_t v21 = a4;
  *((void *)v21 + 1) = a5;
  uint64_t v22 = &v10[OBJC_IVAR___CKInboxItemSwift_systemImage];
  *(void *)uint64_t v22 = a6;
  *((void *)v22 + 1) = a7;
  if (a9) {
    uint64_t v23 = a8;
  }
  else {
    uint64_t v23 = 0;
  }
  if (!a9) {
    unint64_t v16 = 0xE000000000000000;
  }
  swift_beginAccess();
  uint64_t v32 = v23;
  unint64_t v33 = v16;
  uint64_t v24 = v10;
  sub_1E4ACF998();
  swift_endAccess();

  v31.receiver = v24;
  v31.super_class = ObjectType;
  id v25 = objc_msgSendSuper2(&v31, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(a1, v18);
  return v25;
}

Swift::Void __swiftcall InboxItem.update(accessoryText:)(Swift::String accessoryText)
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  id v2 = v1;
  sub_1E4ACF9E8();
}

uint64_t InboxItem.description.getter()
{
  sub_1E4ACFD28();
  swift_bridgeObjectRelease();
  strcpy((char *)v1, "<InboxItem t:");
  swift_bridgeObjectRetain();
  sub_1E4ACFC98();
  swift_bridgeObjectRelease();
  sub_1E4ACFC98();
  swift_bridgeObjectRetain();
  sub_1E4ACFC98();
  swift_bridgeObjectRelease();
  sub_1E4ACFC98();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1E4ACF9D8();
  swift_release();
  swift_release();
  sub_1E4ACFC98();
  swift_bridgeObjectRelease();
  sub_1E4ACFC98();
  return v1[0];
}

id InboxItem.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void InboxItem.init()()
{
}

id InboxItem.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_1E4AC9EEC()
{
  unint64_t result = qword_1EAE88D20;
  if (!qword_1EAE88D20)
  {
    sub_1E4ACF8C8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE88D20);
  }
  return result;
}

uint64_t sub_1E4AC9F44()
{
  return MEMORY[0x1E4F1ABE8];
}

uint64_t sub_1E4ACA044@<X0>(uint64_t *a1@<X8>)
{
  swift_getObjectType();
  uint64_t result = sub_1E4ACF968();
  *a1 = result;
  return result;
}

uint64_t sub_1E4ACA084@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1 + OBJC_IVAR___CKInboxItemSwift_identifier;
  uint64_t v4 = sub_1E4ACF8C8();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t sub_1E4ACA104()
{
  return type metadata accessor for InboxModel(0);
}

uint64_t type metadata accessor for InboxModel(uint64_t a1)
{
  return sub_1E4ACA204(a1, (uint64_t *)&unk_1EAE88D30);
}

void sub_1E4ACA12C()
{
  sub_1E4ACA35C(319, &qword_1EAE88D40);
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t sub_1E4ACA1DC()
{
  return type metadata accessor for InboxItem(0);
}

uint64_t type metadata accessor for InboxItem(uint64_t a1)
{
  return sub_1E4ACA204(a1, (uint64_t *)&unk_1EAE88DA8);
}

uint64_t sub_1E4ACA204(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1E4ACA23C()
{
  sub_1E4ACF8C8();
  if (v0 <= 0x3F)
  {
    sub_1E4ACA35C(319, &qword_1EAE88DB8);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t method lookup function for InboxItem(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for InboxItem);
}

uint64_t dispatch thunk of InboxItem.__allocating_init(identifier:title:subtitle:systemImage:accessoryText:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

void sub_1E4ACA35C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_1E4ACF9F8();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

ValueMetadata *type metadata accessor for InboxContentView()
{
  return &type metadata for InboxContentView;
}

ValueMetadata *type metadata accessor for InboxSectionViews()
{
  return &type metadata for InboxSectionViews;
}

uint64_t sub_1E4ACA3CC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1E4ACA3E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE88DC8);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = &v19[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE88DD0);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = &v19[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v20 = a1;
  uint64_t v21 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE88CA8);
  sub_1E4ACAE20();
  uint64_t result = sub_1E4ACFB68();
  if (qword_1EAE88B10 != -1) {
    uint64_t result = swift_once();
  }
  if (qword_1EAE89810)
  {
    id v15 = (id)qword_1EAE89810;
    uint64_t v16 = sub_1E4ACF868();
    uint64_t v18 = v17;

    uint64_t v22 = v16;
    uint64_t v23 = v18;
    sub_1E4AC8678(&qword_1EAE88DE0, &qword_1EAE88DC8);
    sub_1E4AC489C();
    sub_1E4ACFBE8();
    swift_bridgeObjectRelease();
    (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
    return (*(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(v11 + 32))(a3, v13, v10);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1E4ACA698@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v10[0] = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE88CA8);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    id v7 = objc_msgSend(*(id *)(a1 + 16), sel_sections);
    sub_1E4ACAED8(0, (unint64_t *)&qword_1EAE88CB0);
    uint64_t v8 = sub_1E4ACFCC8();

    v10[1] = v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE88CB8);
    sub_1E4ACF8C8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE88CC0);
    sub_1E4AC8678(&qword_1EAE88CC8, &qword_1EAE88CB8);
    sub_1E4AC86BC();
    sub_1E4ACAE94(&qword_1EAE88CF0, (unint64_t *)&qword_1EAE88CB0);
    sub_1E4ACFC48();
    return (*(uint64_t (**)(void, char *, uint64_t))(v4 + 32))(v10[0], v6, v3);
  }
  else
  {
    type metadata accessor for InboxModel(0);
    sub_1E4ACAFB0((unint64_t *)&qword_1EAE88B90, (void (*)(uint64_t))type metadata accessor for InboxModel);
    uint64_t result = sub_1E4ACFA38();
    __break(1u);
  }
  return result;
}

uint64_t sub_1E4ACA8F8@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE88CC0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  id v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *a1;
  sub_1E4AC7B88((uint64_t *)v25);
  long long v23 = v25[0];
  long long v24 = v25[1];
  id v9 = objc_msgSend(v8, sel_footer);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = sub_1E4ACFC88();
    uint64_t v13 = v12;

    uint64_t v19 = v11;
    uint64_t v20 = v13;
    sub_1E4AC489C();
    id v9 = (id)sub_1E4ACFBA8();
    uint64_t v17 = v16 & 1;
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v17 = 0;
    uint64_t v15 = 0;
  }
  uint64_t v19 = (uint64_t)v9;
  uint64_t v20 = v14;
  uint64_t v21 = v17;
  uint64_t v22 = v15;
  MEMORY[0x1F4188790](v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE88CE0);
  sub_1E4AC873C();
  sub_1E4AC87A8();
  sub_1E4ACFC58();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(a2, v7, v4);
}

uint64_t sub_1E4ACAADC@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4ACA3E8(*v1, v1[1], a1);
}

uint64_t sub_1E4ACAAE4(void **a1)
{
  unint64_t v1 = *a1;
  *(void *)(swift_allocObject() + 16) = v1;
  sub_1E4ACAF5C();
  id v2 = v1;
  return sub_1E4ACFC38();
}

void sub_1E4ACAB88(void *a1)
{
  id v1 = objc_msgSend(a1, sel_action);
  if (v1)
  {
    id v2 = v1;
    (*((void (**)(void))v1 + 2))();
    _Block_release(v2);
  }
}

uint64_t sub_1E4ACABEC@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(a1, sel_inboxItemSwift);
  type metadata accessor for InboxItem(0);
  sub_1E4ACAFB0(&qword_1EAE88E20, (void (*)(uint64_t))type metadata accessor for InboxItem);
  uint64_t result = sub_1E4ACFA08();
  *a2 = result;
  a2[1] = v5;
  return result;
}

uint64_t sub_1E4ACAC80()
{
  id v1 = objc_msgSend(*v0, sel_items);
  sub_1E4ACAED8(0, &qword_1EAE88DE8);
  sub_1E4ACFCC8();

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE88DF0);
  sub_1E4ACF8C8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE88DF8);
  sub_1E4AC8678(&qword_1EAE88E00, &qword_1EAE88DF0);
  sub_1E4AC8678(&qword_1EAE88E08, &qword_1EAE88DF8);
  sub_1E4ACAE94(&qword_1EAE88E10, &qword_1EAE88DE8);
  return sub_1E4ACFC48();
}

uint64_t sub_1E4ACADFC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1E4ACAE18@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4ACA698(*(void *)(v1 + 16), a1);
}

unint64_t sub_1E4ACAE20()
{
  unint64_t result = qword_1EAE88DD8;
  if (!qword_1EAE88DD8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE88CA8);
    sub_1E4AC86BC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE88DD8);
  }
  return result;
}

uint64_t sub_1E4ACAE94(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1E4ACAED8(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1E4ACAED8(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1E4ACAF14()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1E4ACAF4C()
{
  sub_1E4ACAB88(*(void **)(v0 + 16));
}

uint64_t sub_1E4ACAF54@<X0>(uint64_t *a1@<X8>)
{
  return sub_1E4ACABEC(*(void **)(v1 + 16), a1);
}

unint64_t sub_1E4ACAF5C()
{
  unint64_t result = qword_1EAE88E18;
  if (!qword_1EAE88E18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE88E18);
  }
  return result;
}

uint64_t sub_1E4ACAFB0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1E4ACAFF8()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1E4ACB090()
{
  unint64_t result = qword_1EAE88E28;
  if (!qword_1EAE88E28)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_1EAE88E30);
    sub_1E4AC8678(&qword_1EAE88E08, &qword_1EAE88DF8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE88E28);
  }
  return result;
}

void *TranscriptCompositor.collectionView.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR___CKTranscriptCompositorSwift_collectionView);
  swift_beginAccess();
  id v2 = *v1;
  id v3 = v2;
  return v2;
}

void TranscriptCompositor.collectionView.setter(void *a1)
{
  sub_1E4ACD558(a1);
}

void (*TranscriptCompositor.collectionView.modify(void *a1))(void **a1, char a2)
{
  id v3 = malloc(0x28uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR___CKTranscriptCompositorSwift_collectionView;
  v3[3] = v1;
  v3[4] = v4;
  swift_beginAccess();
  return sub_1E4ACB284;
}

void sub_1E4ACB284(void **a1, char a2)
{
  id v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    uint64_t v4 = *(void **)(v3[3] + v3[4]);
    if (v4)
    {
      id v5 = objc_msgSend(v4, sel_collectionViewLayout);
      self;
      uint64_t v6 = swift_dynamicCastObjCClass();
      if (v6)
      {
        id v7 = (void *)v6;
        uint64_t v8 = (id *)(v3[3] + OBJC_IVAR___CKTranscriptCompositorSwift_collectionViewLayout);
        swift_beginAccess();
        id v5 = *v8;
        *uint64_t v8 = v7;
      }
    }
  }
  free(v3);
}

uint64_t TranscriptCompositor.delegate.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___CKTranscriptCompositorSwift_delegate;
  swift_beginAccess();
  return MEMORY[0x1E4E87900](v1);
}

uint64_t TranscriptCompositor.delegate.setter()
{
  return swift_unknownObjectRelease();
}

void (*TranscriptCompositor.delegate.modify(void *a1))(void **a1, char a2)
{
  id v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR___CKTranscriptCompositorSwift_delegate;
  v3[4] = v1;
  v3[5] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x1E4E87900](v5);
  return sub_1E4ACB520;
}

void sub_1E4ACB520(void **a1, char a2)
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

uint64_t TranscriptCompositor.layoutContext.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___CKTranscriptCompositorSwift_layoutContext;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t TranscriptCompositor.datasource.getter()
{
  return sub_1E4ACC2DC(&OBJC_IVAR___CKTranscriptCompositorSwift_datasource, MEMORY[0x1E4FBC900]);
}

id sub_1E4ACB76C(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = (id *)(a1 + *a3);
  swift_beginAccess();
  return *v3;
}

void *TranscriptCompositor.collectionViewLayout.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR___CKTranscriptCompositorSwift_collectionViewLayout);
  swift_beginAccess();
  id v2 = *v1;
  id v3 = v2;
  return v2;
}

uint64_t TranscriptCompositor.scrollDirection.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___CKTranscriptCompositorSwift_scrollDirection;
  swift_beginAccess();
  return *(void *)v1;
}

void TranscriptCompositor.scrollDirection.setter(uint64_t a1)
{
  id v3 = (void *)(v1 + OBJC_IVAR___CKTranscriptCompositorSwift_scrollDirection);
  swift_beginAccess();
  *id v3 = a1;
  uint64_t v4 = (void **)(v1 + OBJC_IVAR___CKTranscriptCompositorSwift_collectionViewLayout);
  swift_beginAccess();
  uint64_t v5 = *v4;
  if (v5)
  {
    id v6 = objc_allocWithZone(MEMORY[0x1E4F42878]);
    id v7 = v5;
    id v8 = objc_msgSend(v6, sel_init);
    objc_msgSend(v8, sel_setScrollDirection_, *v3);
    id v9 = (double *)(v1 + OBJC_IVAR___CKTranscriptCompositorSwift_interSectionSpacing);
    swift_beginAccess();
    objc_msgSend(v8, sel_setInterSectionSpacing_, *v9);
    swift_beginAccess();
    sub_1E4ACAED8(0, &qword_1EAE88E80);
    swift_bridgeObjectRetain();
    uint64_t v10 = (void *)sub_1E4ACFCB8();
    swift_bridgeObjectRelease();
    objc_msgSend(v8, sel_setBoundarySupplementaryItems_, v10);

    uint64_t v11 = (void *)(v1 + OBJC_IVAR___CKTranscriptCompositorSwift_contentsInsetReference);
    swift_beginAccess();
    objc_msgSend(v8, sel_setContentInsetsReference_, *v11);
    objc_msgSend(v7, sel_setConfiguration_, v8);
  }
}

void (*TranscriptCompositor.scrollDirection.modify(void *a1))(void **a1, char a2)
{
  id v3 = malloc(0x70uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR___CKTranscriptCompositorSwift_scrollDirection;
  v3[12] = v1;
  v3[13] = v4;
  swift_beginAccess();
  return sub_1E4ACBB6C;
}

void sub_1E4ACBB6C(void **a1, char a2)
{
  id v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    uint64_t v4 = (void **)(v3[12] + OBJC_IVAR___CKTranscriptCompositorSwift_collectionViewLayout);
    swift_beginAccess();
    uint64_t v5 = *v4;
    if (v5)
    {
      uint64_t v7 = v3[12];
      uint64_t v6 = v3[13];
      id v8 = objc_allocWithZone(MEMORY[0x1E4F42878]);
      id v9 = v5;
      id v10 = objc_msgSend(v8, sel_init);
      objc_msgSend(v10, sel_setScrollDirection_, *(void *)(v7 + v6));
      uint64_t v11 = (double *)(v7 + OBJC_IVAR___CKTranscriptCompositorSwift_interSectionSpacing);
      swift_beginAccess();
      objc_msgSend(v10, sel_setInterSectionSpacing_, *v11);
      swift_beginAccess();
      sub_1E4ACAED8(0, &qword_1EAE88E80);
      swift_bridgeObjectRetain();
      uint64_t v12 = (void *)sub_1E4ACFCB8();
      swift_bridgeObjectRelease();
      objc_msgSend(v10, sel_setBoundarySupplementaryItems_, v12);

      uint64_t v13 = (void *)(v7 + OBJC_IVAR___CKTranscriptCompositorSwift_contentsInsetReference);
      swift_beginAccess();
      objc_msgSend(v10, sel_setContentInsetsReference_, *v13);
      objc_msgSend(v9, sel_setConfiguration_, v10);
    }
  }
  free(v3);
}

double TranscriptCompositor.interSectionSpacing.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___CKTranscriptCompositorSwift_interSectionSpacing;
  swift_beginAccess();
  return *(double *)v1;
}

void TranscriptCompositor.interSectionSpacing.setter(double a1)
{
  id v3 = (double *)(v1 + OBJC_IVAR___CKTranscriptCompositorSwift_interSectionSpacing);
  swift_beginAccess();
  *id v3 = a1;
  uint64_t v4 = (void **)(v1 + OBJC_IVAR___CKTranscriptCompositorSwift_collectionViewLayout);
  swift_beginAccess();
  uint64_t v5 = *v4;
  if (v5)
  {
    id v6 = objc_allocWithZone(MEMORY[0x1E4F42878]);
    id v7 = v5;
    id v8 = objc_msgSend(v6, sel_init);
    id v9 = (void *)(v1 + OBJC_IVAR___CKTranscriptCompositorSwift_scrollDirection);
    swift_beginAccess();
    objc_msgSend(v8, sel_setScrollDirection_, *v9);
    objc_msgSend(v8, sel_setInterSectionSpacing_, *v3);
    swift_beginAccess();
    sub_1E4ACAED8(0, &qword_1EAE88E80);
    swift_bridgeObjectRetain();
    id v10 = (void *)sub_1E4ACFCB8();
    swift_bridgeObjectRelease();
    objc_msgSend(v8, sel_setBoundarySupplementaryItems_, v10);

    uint64_t v11 = (void *)(v1 + OBJC_IVAR___CKTranscriptCompositorSwift_contentsInsetReference);
    swift_beginAccess();
    objc_msgSend(v8, sel_setContentInsetsReference_, *v11);
    objc_msgSend(v7, sel_setConfiguration_, v8);
  }
}

void (*TranscriptCompositor.interSectionSpacing.modify(void *a1))(void **a1, char a2)
{
  id v3 = malloc(0x70uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR___CKTranscriptCompositorSwift_interSectionSpacing;
  v3[12] = v1;
  v3[13] = v4;
  swift_beginAccess();
  return sub_1E4ACC050;
}

void sub_1E4ACC050(void **a1, char a2)
{
  id v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    uint64_t v4 = (void **)(v3[12] + OBJC_IVAR___CKTranscriptCompositorSwift_collectionViewLayout);
    swift_beginAccess();
    uint64_t v5 = *v4;
    if (v5)
    {
      uint64_t v6 = v3[12];
      uint64_t v7 = v3[13];
      id v8 = objc_allocWithZone(MEMORY[0x1E4F42878]);
      id v9 = v5;
      id v10 = objc_msgSend(v8, sel_init);
      uint64_t v11 = (void *)(v6 + OBJC_IVAR___CKTranscriptCompositorSwift_scrollDirection);
      swift_beginAccess();
      objc_msgSend(v10, sel_setScrollDirection_, *v11);
      objc_msgSend(v10, sel_setInterSectionSpacing_, *(double *)(v6 + v7));
      swift_beginAccess();
      sub_1E4ACAED8(0, &qword_1EAE88E80);
      swift_bridgeObjectRetain();
      uint64_t v12 = (void *)sub_1E4ACFCB8();
      swift_bridgeObjectRelease();
      objc_msgSend(v10, sel_setBoundarySupplementaryItems_, v12);

      uint64_t v13 = (void *)(v6 + OBJC_IVAR___CKTranscriptCompositorSwift_contentsInsetReference);
      swift_beginAccess();
      objc_msgSend(v10, sel_setContentInsetsReference_, *v13);
      objc_msgSend(v9, sel_setConfiguration_, v10);
    }
  }
  free(v3);
}

uint64_t TranscriptCompositor.boundarySupplementaryItems.getter()
{
  return sub_1E4ACC2DC(&OBJC_IVAR___CKTranscriptCompositorSwift_boundarySupplementaryItems, MEMORY[0x1E4FBC8A8]);
}

uint64_t sub_1E4ACC2DC(void *a1, uint64_t (*a2)(void))
{
  uint64_t v4 = (void *)(v2 + *a1);
  swift_beginAccess();
  return a2(*v4);
}

void TranscriptCompositor.boundarySupplementaryItems.setter(uint64_t a1)
{
  id v3 = (void *)(v1 + OBJC_IVAR___CKTranscriptCompositorSwift_boundarySupplementaryItems);
  swift_beginAccess();
  *id v3 = a1;
  swift_bridgeObjectRelease();
  uint64_t v4 = (void **)(v1 + OBJC_IVAR___CKTranscriptCompositorSwift_collectionViewLayout);
  swift_beginAccess();
  uint64_t v5 = *v4;
  if (v5)
  {
    id v6 = objc_allocWithZone(MEMORY[0x1E4F42878]);
    id v7 = v5;
    id v8 = objc_msgSend(v6, sel_init);
    id v9 = (void *)(v1 + OBJC_IVAR___CKTranscriptCompositorSwift_scrollDirection);
    swift_beginAccess();
    objc_msgSend(v8, sel_setScrollDirection_, *v9);
    id v10 = (double *)(v1 + OBJC_IVAR___CKTranscriptCompositorSwift_interSectionSpacing);
    swift_beginAccess();
    objc_msgSend(v8, sel_setInterSectionSpacing_, *v10);
    sub_1E4ACAED8(0, &qword_1EAE88E80);
    swift_bridgeObjectRetain();
    uint64_t v11 = (void *)sub_1E4ACFCB8();
    swift_bridgeObjectRelease();
    objc_msgSend(v8, sel_setBoundarySupplementaryItems_, v11);

    uint64_t v12 = (void *)(v1 + OBJC_IVAR___CKTranscriptCompositorSwift_contentsInsetReference);
    swift_beginAccess();
    objc_msgSend(v8, sel_setContentInsetsReference_, *v12);
    objc_msgSend(v7, sel_setConfiguration_, v8);
  }
}

void (*TranscriptCompositor.boundarySupplementaryItems.modify(void *a1))(void **a1, char a2)
{
  id v3 = malloc(0x70uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR___CKTranscriptCompositorSwift_boundarySupplementaryItems;
  v3[12] = v1;
  v3[13] = v4;
  swift_beginAccess();
  return sub_1E4ACC5DC;
}

void sub_1E4ACC5DC(void **a1, char a2)
{
  id v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    uint64_t v4 = (void **)(v3[12] + OBJC_IVAR___CKTranscriptCompositorSwift_collectionViewLayout);
    swift_beginAccess();
    uint64_t v5 = *v4;
    if (v5)
    {
      uint64_t v6 = v3[12];
      id v7 = objc_allocWithZone(MEMORY[0x1E4F42878]);
      id v8 = v5;
      id v9 = objc_msgSend(v7, sel_init);
      id v10 = (void *)(v6 + OBJC_IVAR___CKTranscriptCompositorSwift_scrollDirection);
      swift_beginAccess();
      objc_msgSend(v9, sel_setScrollDirection_, *v10);
      uint64_t v11 = (double *)(v6 + OBJC_IVAR___CKTranscriptCompositorSwift_interSectionSpacing);
      swift_beginAccess();
      objc_msgSend(v9, sel_setInterSectionSpacing_, *v11);
      sub_1E4ACAED8(0, &qword_1EAE88E80);
      swift_bridgeObjectRetain();
      uint64_t v12 = (void *)sub_1E4ACFCB8();
      swift_bridgeObjectRelease();
      objc_msgSend(v9, sel_setBoundarySupplementaryItems_, v12);

      uint64_t v13 = (void *)(v6 + OBJC_IVAR___CKTranscriptCompositorSwift_contentsInsetReference);
      swift_beginAccess();
      objc_msgSend(v9, sel_setContentInsetsReference_, *v13);
      objc_msgSend(v8, sel_setConfiguration_, v9);
    }
  }
  free(v3);
}

uint64_t TranscriptCompositor.contentsInsetReference.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___CKTranscriptCompositorSwift_contentsInsetReference;
  swift_beginAccess();
  return *(void *)v1;
}

void TranscriptCompositor.contentsInsetReference.setter(uint64_t a1)
{
  id v3 = (void *)(v1 + OBJC_IVAR___CKTranscriptCompositorSwift_contentsInsetReference);
  swift_beginAccess();
  *id v3 = a1;
  uint64_t v4 = (void **)(v1 + OBJC_IVAR___CKTranscriptCompositorSwift_collectionViewLayout);
  swift_beginAccess();
  uint64_t v5 = *v4;
  if (*v4)
  {
    id v6 = objc_allocWithZone(MEMORY[0x1E4F42878]);
    id v7 = v5;
    id v8 = objc_msgSend(v6, sel_init);
    id v9 = (void *)(v1 + OBJC_IVAR___CKTranscriptCompositorSwift_scrollDirection);
    swift_beginAccess();
    objc_msgSend(v8, sel_setScrollDirection_, *v9);
    id v10 = (double *)(v1 + OBJC_IVAR___CKTranscriptCompositorSwift_interSectionSpacing);
    swift_beginAccess();
    objc_msgSend(v8, sel_setInterSectionSpacing_, *v10);
    swift_beginAccess();
    sub_1E4ACAED8(0, &qword_1EAE88E80);
    swift_bridgeObjectRetain();
    uint64_t v11 = (void *)sub_1E4ACFCB8();
    swift_bridgeObjectRelease();
    objc_msgSend(v8, sel_setBoundarySupplementaryItems_, v11);

    objc_msgSend(v8, sel_setContentInsetsReference_, *v3);
    objc_msgSend(v7, sel_setConfiguration_, v8);
  }
}

void (*TranscriptCompositor.contentsInsetReference.modify(void *a1))(void **a1, char a2)
{
  id v3 = malloc(0x70uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR___CKTranscriptCompositorSwift_contentsInsetReference;
  v3[12] = v1;
  v3[13] = v4;
  swift_beginAccess();
  return sub_1E4ACCAC0;
}

void sub_1E4ACCAC0(void **a1, char a2)
{
  id v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    uint64_t v4 = (void **)(v3[12] + OBJC_IVAR___CKTranscriptCompositorSwift_collectionViewLayout);
    swift_beginAccess();
    uint64_t v5 = *v4;
    if (v5)
    {
      uint64_t v7 = v3[12];
      uint64_t v6 = v3[13];
      id v8 = objc_allocWithZone(MEMORY[0x1E4F42878]);
      id v9 = v5;
      id v10 = objc_msgSend(v8, sel_init);
      uint64_t v11 = (void *)(v7 + OBJC_IVAR___CKTranscriptCompositorSwift_scrollDirection);
      swift_beginAccess();
      objc_msgSend(v10, sel_setScrollDirection_, *v11);
      uint64_t v12 = (double *)(v7 + OBJC_IVAR___CKTranscriptCompositorSwift_interSectionSpacing);
      swift_beginAccess();
      objc_msgSend(v10, sel_setInterSectionSpacing_, *v12);
      swift_beginAccess();
      sub_1E4ACAED8(0, &qword_1EAE88E80);
      swift_bridgeObjectRetain();
      uint64_t v13 = (void *)sub_1E4ACFCB8();
      swift_bridgeObjectRelease();
      objc_msgSend(v10, sel_setBoundarySupplementaryItems_, v13);

      objc_msgSend(v10, sel_setContentInsetsReference_, *(void *)(v7 + v6));
      objc_msgSend(v9, sel_setConfiguration_, v10);
    }
  }
  free(v3);
}

id TranscriptCompositor.__allocating_init(layoutContext:datasource:)(uint64_t a1, uint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  return TranscriptCompositor.init(layoutContext:datasource:)(a1, a2);
}

id TranscriptCompositor.init(layoutContext:datasource:)(uint64_t a1, uint64_t a2)
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v2[OBJC_IVAR___CKTranscriptCompositorSwift_collectionView] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v2[OBJC_IVAR___CKTranscriptCompositorSwift_collectionViewLayout] = 0;
  *(void *)&v2[OBJC_IVAR___CKTranscriptCompositorSwift_scrollDirection] = 0;
  *(void *)&v2[OBJC_IVAR___CKTranscriptCompositorSwift_interSectionSpacing] = 0;
  *(void *)&v2[OBJC_IVAR___CKTranscriptCompositorSwift_boundarySupplementaryItems] = MEMORY[0x1E4FBC860];
  *(void *)&v2[OBJC_IVAR___CKTranscriptCompositorSwift_contentsInsetReference] = 1;
  *(void *)&v2[OBJC_IVAR___CKTranscriptCompositorSwift_layoutContext] = a1;
  *(void *)&v2[OBJC_IVAR___CKTranscriptCompositorSwift_datasource] = a2;
  v7.receiver = v2;
  v7.super_class = ObjectType;
  return objc_msgSendSuper2(&v7, sel_init);
}

id TranscriptCompositor.layoutSection(forSection:layoutEnvironment:)(uint64_t a1, uint64_t a2)
{
  id v5 = (void **)&v2[OBJC_IVAR___CKTranscriptCompositorSwift_collectionView];
  swift_beginAccess();
  uint64_t v6 = *v5;
  if (!v6)
  {
    sub_1E4ACAED8(0, &qword_1EBFF78E0);
    id v9 = (id)sub_1E4ACFD18();
    sub_1E4ACFD08();
    sub_1E4ACF948();
LABEL_9:

    return 0;
  }
  objc_super v7 = &v2[OBJC_IVAR___CKTranscriptCompositorSwift_delegate];
  swift_beginAccess();
  id v8 = (void *)MEMORY[0x1E4E87900](v7);
  id v9 = v6;
  if (!v8) {
    goto LABEL_22;
  }
  id v10 = objc_msgSend(v8, sel_compositorDatasourceItemsForSection_, a1);
  swift_unknownObjectRelease();
  if (!v10) {
    goto LABEL_22;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF78D0);
  unint64_t v11 = sub_1E4ACFCC8();

  if (!(v11 >> 62))
  {
    if (*(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
  swift_bridgeObjectRetain();
  uint64_t v36 = sub_1E4ACFD68();
  swift_bridgeObjectRelease();
  if (!v36)
  {
LABEL_21:
    swift_bridgeObjectRelease();
LABEL_22:
    sub_1E4ACAED8(0, &qword_1EBFF78E0);
    uint64_t v22 = (void *)sub_1E4ACFD18();
    sub_1E4ACFD08();
    goto LABEL_23;
  }
LABEL_6:
  uint64_t v12 = (void *)MEMORY[0x1E4E87900](v7);
  if (!v12)
  {
    swift_bridgeObjectRelease();
    sub_1E4ACAED8(0, &qword_1EBFF78E0);
    uint64_t v22 = (void *)sub_1E4ACFD18();
    sub_1E4ACFD08();
LABEL_23:
    sub_1E4ACF948();

    return 0;
  }
  objc_msgSend(v12, sel_compositorMarginInsets);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  swift_unknownObjectRelease();
  uint64_t v21 = v2;
  swift_unknownObjectRetain();
  sub_1E4ACE9FC(v21, a1, a2, v11, (uint64_t)v40, v14, v16, v18, v20);
  unint64_t v23 = v41;
  unint64_t v44 = v41;
  if (v41 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v38 = sub_1E4ACFD68();
    sub_1E4ACD68C((uint64_t)&v44);
    if (v38) {
      goto LABEL_13;
    }
    goto LABEL_27;
  }
  if (!*(void *)((v41 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_27:
    sub_1E4ACAED8(0, &qword_1EBFF78E0);
    uint64_t v39 = (void *)sub_1E4ACFD18();
    sub_1E4ACFD08();
    sub_1E4ACF948();

    sub_1E4ACD624((uint64_t)v40);
    goto LABEL_9;
  }
LABEL_13:
  char v24 = v43;
  id v25 = self;
  if (v24)
  {
    objc_msgSend(v9, sel_bounds);
    double v27 = v28;
    char v26 = &selRef_estimatedDimension_;
  }
  else
  {
    char v26 = &selRef_absoluteDimension_;
    double v27 = v42;
  }
  id v29 = objc_msgSend(v25, *v26, v27);
  id v30 = objc_msgSend(self, sel_fractionalWidthDimension_, 1.0);
  id v31 = objc_msgSend(self, sel_sizeWithWidthDimension_heightDimension_, v30, v29);
  if (v23 >> 62)
  {
    sub_1E4ACAED8(0, (unint64_t *)&qword_1EBFF78C0);
    swift_bridgeObjectRetain();
    sub_1E4ACFD58();
    sub_1E4ACD68C((uint64_t)&v44);
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_1E4ACFD98();
    sub_1E4ACAED8(0, (unint64_t *)&qword_1EBFF78C0);
  }
  uint64_t v32 = self;
  sub_1E4ACAED8(0, (unint64_t *)&qword_1EBFF78C0);
  unint64_t v33 = (void *)sub_1E4ACFCB8();
  swift_bridgeObjectRelease();
  id v34 = objc_msgSend(v32, sel_verticalGroupWithLayoutSize_subitems_, v31, v33);

  id v35 = objc_msgSend(self, sel_sectionWithGroup_, v34);
  sub_1E4ACD624((uint64_t)v40);
  return v35;
}

id TranscriptCompositor.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void TranscriptCompositor.init()()
{
}

id TranscriptCompositor.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_1E4ACD558(void *a1)
{
  id v3 = (id *)(v1 + OBJC_IVAR___CKTranscriptCompositorSwift_collectionView);
  swift_beginAccess();
  id v4 = *v3;
  *id v3 = a1;
  id v5 = a1;

  if (*v3)
  {
    id v6 = objc_msgSend(*v3, sel_collectionViewLayout);
    self;
    uint64_t v7 = swift_dynamicCastObjCClass();
    if (v7)
    {
      id v8 = (void *)v7;
      id v9 = (id *)(v1 + OBJC_IVAR___CKTranscriptCompositorSwift_collectionViewLayout);
      swift_beginAccess();
      id v6 = *v9;
      *id v9 = v8;
    }
  }
}

uint64_t sub_1E4ACD624(uint64_t a1)
{
  objc_super v2 = *(void **)a1;
  id v3 = *(void **)(a1 + 8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1E4ACD68C(uint64_t a1)
{
  return a1;
}

id sub_1E4ACD6B8@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  id v3 = (void **)(*a1 + OBJC_IVAR___CKTranscriptCompositorSwift_collectionView);
  swift_beginAccess();
  id v4 = *v3;
  *a2 = *v3;
  return v4;
}

void sub_1E4ACD71C(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  sub_1E4ACD558(v1);
}

uint64_t sub_1E4ACD76C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR___CKTranscriptCompositorSwift_delegate;
  swift_beginAccess();
  uint64_t result = MEMORY[0x1E4E87900](v3);
  *a2 = result;
  return result;
}

uint64_t sub_1E4ACD7C4()
{
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_1E4ACD81C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_get_3Tm(a1, &OBJC_IVAR___CKTranscriptCompositorSwift_scrollDirection, a2);
}

void sub_1E4ACD828(uint64_t *a1)
{
}

double sub_1E4ACD850@<D0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (double *)(*a1 + OBJC_IVAR___CKTranscriptCompositorSwift_interSectionSpacing);
  swift_beginAccess();
  double result = *v3;
  *a2 = *(void *)v3;
  return result;
}

void sub_1E4ACD8A4(double *a1)
{
}

uint64_t sub_1E4ACD8CC@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(*a1 + OBJC_IVAR___CKTranscriptCompositorSwift_boundarySupplementaryItems);
  swift_beginAccess();
  *a2 = *v3;
  return swift_bridgeObjectRetain();
}

void sub_1E4ACD924()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  TranscriptCompositor.boundarySupplementaryItems.setter(v0);
}

uint64_t sub_1E4ACD950@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_get_3Tm(a1, &OBJC_IVAR___CKTranscriptCompositorSwift_contentsInsetReference, a2);
}

uint64_t keypath_get_3Tm@<X0>(void *a1@<X0>, void *a2@<X3>, void *a3@<X8>)
{
  id v4 = (void *)(*a1 + *a2);
  uint64_t result = swift_beginAccess();
  *a3 = *v4;
  return result;
}

void sub_1E4ACD9AC(uint64_t *a1)
{
}

uint64_t type metadata accessor for TranscriptCompositor()
{
  return self;
}

uint64_t method lookup function for TranscriptCompositor(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for TranscriptCompositor);
}

uint64_t dispatch thunk of TranscriptCompositor.__allocating_init(layoutContext:datasource:)()
{
  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t sub_1E4ACDA24(uint64_t a1)
{
  return a1;
}

void sub_1E4ACDA4C()
{
  uint64_t v0 = (void *)sub_1E4ACFC78();
  id v1 = objc_msgSend(self, sel_bundleWithIdentifier_, v0);

  qword_1EAE89810 = (uint64_t)v1;
}

BOOL sub_1E4ACDABC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_1E4ACDAD4()
{
  return sub_1E4ACFE18();
}

uint64_t sub_1E4ACDB1C()
{
  return sub_1E4ACFE08();
}

uint64_t sub_1E4ACDB48()
{
  return sub_1E4ACFE18();
}

uint64_t sub_1E4ACDB9C(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = v3;
  unint64_t v5 = a2;
  uint64_t v28 = a1;
  if (a2 >> 62)
  {
LABEL_22:
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_1E4ACFD68();
    if (v6) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v6 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v6)
    {
LABEL_3:
      uint64_t v29 = v4;
      unint64_t v30 = v5 & 0xC000000000000001;
      unint64_t v31 = v5;
      uint64_t v7 = 4;
      do
      {
        uint64_t v12 = v7 - 4;
        if (v30)
        {
          double v13 = (void *)MEMORY[0x1E4E872B0](v7 - 4, v5);
          uint64_t v14 = v7 - 3;
          if (__OFADD__(v12, 1)) {
            goto LABEL_21;
          }
        }
        else
        {
          double v13 = *(void **)(v5 + 8 * v7);
          swift_unknownObjectRetain();
          uint64_t v14 = v7 - 3;
          if (__OFADD__(v12, 1))
          {
LABEL_21:
            __break(1u);
            goto LABEL_22;
          }
        }
        uint64_t v15 = v2[1];
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF78D0);
        double v16 = (void *)sub_1E4ACFCB8();
        id v17 = objc_msgSend(v13, sel_layoutItemWithEnvironment_datasourceItemIndex_allDatasourceItems_, v15, v7 - 4, v16);

        if (v17)
        {
          uint64_t v18 = *v2 + OBJC_IVAR___CKTranscriptCompositorSwift_delegate;
          swift_beginAccess();
          double v19 = (void *)MEMORY[0x1E4E87900](v18);
          if (v19)
          {
            unsigned int v20 = objc_msgSend(v19, sel_compositorSupportsCustomLayoutGroupsForSection_, v28);
            swift_unknownObjectRelease();
          }
          else
          {
            unsigned int v20 = 0;
          }
          uint64_t v21 = (void *)MEMORY[0x1E4E87900](v18);
          if (v21
            && (unsigned int v22 = objc_msgSend(v21, sel_compositorSupportsCustomLayoutGroupsForLayoutProvider_, v13),
                swift_unknownObjectRelease(),
                (v20 & v22) == 1))
          {
            sub_1E4ACDE68(v13, v7 - 4, v31, v17);
            if (v29)
            {

              swift_bridgeObjectRelease();
              id v23 = objc_msgSend(v13, sel_layoutGroupIdentifier);
              uint64_t v24 = sub_1E4ACFC88();
              uint64_t v26 = v25;

              swift_unknownObjectRelease();
              uint64_t result = swift_bridgeObjectRelease();
              v2[5] = v24;
              v2[6] = v26;
              return result;
            }
          }
          else
          {
            sub_1E4ACE5C0(v13, v7 - 4, 0.0, 0.0, v31, v17);
          }
        }
        id v8 = objc_msgSend(v13, sel_layoutGroupIdentifier, v28);
        uint64_t v9 = sub_1E4ACFC88();
        uint64_t v11 = v10;

        uint64_t v4 = v2[6];
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
        v2[5] = v9;
        v2[6] = v11;
        ++v7;
        unint64_t v5 = v31;
      }
      while (v14 != v6);
    }
  }
  return swift_bridgeObjectRelease();
}

void sub_1E4ACDE68(void *a1, uint64_t a2, unint64_t a3, void *a4)
{
  uint64_t v9 = a2 + 1;
  if (__OFADD__(a2, 1))
  {
    __break(1u);
  }
  else
  {
    uint64_t v5 = v4;
    id v8 = a4;
    uint64_t v4 = a3;
    uint64_t v7 = a2;
    uint64_t v6 = a1;
    if (!(a3 >> 62))
    {
      uint64_t v10 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_4;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_1E4ACFD68();
  swift_bridgeObjectRelease();
LABEL_4:
  uint64_t v58 = v7;
  if (v9 >= v10)
  {
    uint64_t v20 = *(void *)(v5 + 48);
    if (!v20) {
      goto LABEL_43;
    }
    char v59 = v8;
    char v21 = 0;
    goto LABEL_16;
  }
  char v59 = v8;
  if ((v4 & 0xC000000000000001) != 0)
  {
    uint64_t v11 = (void *)MEMORY[0x1E4E872B0](v9, v4);
    goto LABEL_9;
  }
  if (v9 < 0)
  {
    __break(1u);
    goto LABEL_51;
  }
  if ((unint64_t)v9 >= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  uint64_t v11 = *(void **)(v4 + 8 * v9 + 32);
  swift_unknownObjectRetain();
LABEL_9:
  id v12 = objc_msgSend(v11, sel_layoutGroupIdentifier, v7);
  swift_unknownObjectRelease();
  uint64_t v13 = sub_1E4ACFC88();
  uint64_t v15 = v14;

  id v16 = objc_msgSend(v6, sel_layoutGroupIdentifier);
  uint64_t v17 = sub_1E4ACFC88();
  uint64_t v19 = v18;

  if (v13 == v17 && v15 == v19)
  {
    swift_bridgeObjectRelease_n();
    uint64_t v20 = *(void *)(v5 + 48);
    id v8 = v59;
    if (!v20) {
      goto LABEL_42;
    }
    char v21 = 1;
  }
  else
  {
    char v21 = sub_1E4ACFD88();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v20 = *(void *)(v5 + 48);
    if (!v20)
    {
      id v8 = v59;
      if (v21) {
        goto LABEL_42;
      }
      goto LABEL_43;
    }
  }
LABEL_16:
  uint64_t v22 = *(void *)(v5 + 40);
  swift_bridgeObjectRetain();
  id v23 = objc_msgSend(v6, sel_layoutGroupIdentifier);
  uint64_t v24 = sub_1E4ACFC88();
  uint64_t v26 = v25;

  if (v22 != v24 || v20 != v26)
  {
    char v27 = sub_1E4ACFD88();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v21)
    {
      id v8 = v59;
      if (v27) {
        goto LABEL_22;
      }
LABEL_42:
      __swift_instantiateConcreteTypeFromMangledName(qword_1EBFF78F0);
      uint64_t v53 = swift_allocObject();
      *(_OWORD *)(v53 + 16) = xmmword_1E4AD0BF0;
      *(void *)(v53 + 32) = v6;
      uint64_t v60 = v53;
      sub_1E4ACFCD8();
      *(void *)(v5 + 56) = v60;
      swift_unknownObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v54 = swift_allocObject();
      *(_OWORD *)(v54 + 16) = xmmword_1E4AD0BF0;
      *(void *)(v54 + 32) = v8;
      uint64_t v61 = v54;
      sub_1E4ACFCD8();
      *(void *)(v5 + 64) = v61;
      id v55 = v8;
      swift_bridgeObjectRelease();
      return;
    }
    id v8 = v59;
    if (v27) {
      goto LABEL_27;
    }
LABEL_43:
    uint64_t v56 = MEMORY[0x1E4FBC860];
    *(void *)(v5 + 56) = MEMORY[0x1E4FBC860];
    swift_bridgeObjectRelease();
    *(void *)(v5 + 64) = v56;
    swift_bridgeObjectRelease();
    sub_1E4ACE5C0(v6, v58, 0.0, 0.0, v4, v8);
    return;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v8 = v59;
  if ((v21 & 1) == 0)
  {
LABEL_27:
    uint64_t v30 = swift_unknownObjectRetain();
    MEMORY[0x1E4E87220](v30);
    if (*(void *)((*(void *)(v5 + 56) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v5 + 56) & 0xFFFFFFFFFFFFFF8)
                                                                                       + 0x18) >> 1)
      sub_1E4ACFCE8();
    sub_1E4ACFCF8();
    sub_1E4ACFCD8();
    id v31 = v8;
    MEMORY[0x1E4E87220]();
    if (*(void *)((*(void *)(v5 + 64) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v5 + 64) & 0xFFFFFFFFFFFFFF8)
                                                                                       + 0x18) >> 1)
      sub_1E4ACFCE8();
    sub_1E4ACFCF8();
    sub_1E4ACFCD8();
    uint64_t v32 = *(void *)v5 + OBJC_IVAR___CKTranscriptCompositorSwift_delegate;
    swift_beginAccess();
    uint64_t v33 = MEMORY[0x1E4E87900](v32);
    if (!v33) {
      goto LABEL_40;
    }
    id v34 = (void *)v33;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF78D0);
    id v35 = (void *)sub_1E4ACFCB8();
    uint64_t v36 = *(void *)(v5 + 8);
    sub_1E4ACAED8(0, (unint64_t *)&qword_1EBFF78C0);
    uint64_t v37 = (void *)sub_1E4ACFCB8();
    id v38 = objc_msgSend(v34, sel_layoutGroupForDatasourceItems_environment_layoutItems_, v35, v36, v37);
    swift_unknownObjectRelease();

    if (!v38)
    {
LABEL_40:
      sub_1E4ACAED8(0, &qword_1EBFF78E0);
      uint64_t v51 = (void *)sub_1E4ACFD18();
      sub_1E4ACFD08();
      sub_1E4ACF948();

      sub_1E4ACED84();
      swift_allocError();
      *uint64_t v52 = 0;
      swift_willThrow();
      return;
    }
    id v39 = v38;
    MEMORY[0x1E4E87220]();
    if (*(void *)((*(void *)(v5 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v5 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                       + 0x18) >> 1)
      sub_1E4ACFCE8();
    sub_1E4ACFCF8();
    sub_1E4ACFCD8();
    sub_1E4ACE910(v39);
    id v40 = objc_msgSend(v39, sel_edgeSpacing);
    if (v40)
    {
      unint64_t v41 = v40;
      id v42 = objc_msgSend(v40, sel_top);
      if (v42)
      {
        char v43 = v42;
        objc_msgSend(v42, sel_spacing);
        double v45 = v44;

        *(double *)(v5 + 24) = v45 + *(double *)(v5 + 24);
      }
      id v46 = objc_msgSend(v41, sel_bottom, v58);
      if (v46)
      {
        uint64_t v47 = v46;
        objc_msgSend(v46, sel_spacing);
        double v49 = v48;

        *(double *)(v5 + 24) = v49 + *(double *)(v5 + 24);
        uint64_t v50 = MEMORY[0x1E4FBC860];
        *(void *)(v5 + 56) = MEMORY[0x1E4FBC860];
        swift_bridgeObjectRelease();
        *(void *)(v5 + 64) = v50;
LABEL_46:

        swift_bridgeObjectRelease();
        return;
      }
    }
    uint64_t v57 = MEMORY[0x1E4FBC860];
    *(void *)(v5 + 56) = MEMORY[0x1E4FBC860];
    swift_bridgeObjectRelease();
    *(void *)(v5 + 64) = v57;
    goto LABEL_46;
  }
LABEL_22:
  uint64_t v28 = swift_unknownObjectRetain();
  MEMORY[0x1E4E87220](v28);
  if (*(void *)((*(void *)(v5 + 56) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v5 + 56) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
LABEL_52:
    sub_1E4ACFCE8();
  sub_1E4ACFCF8();
  sub_1E4ACFCD8();
  id v29 = v8;
  MEMORY[0x1E4E87220]();
  if (*(void *)((*(void *)(v5 + 64) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v5 + 64) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_1E4ACFCE8();
  sub_1E4ACFCF8();
  sub_1E4ACFCD8();
}

void sub_1E4ACE5C0(void *a1, uint64_t a2, double a3, double a4, uint64_t a5, void *a6)
{
  uint64_t v7 = v6;
  sub_1E4ACE910(a6);
  uint64_t v13 = *(void *)v6 + OBJC_IVAR___CKTranscriptCompositorSwift_delegate;
  swift_beginAccess();
  uint64_t v14 = MEMORY[0x1E4E87900](v13);
  if (!v14) {
    goto LABEL_3;
  }
  uint64_t v15 = (void *)v14;
  __swift_instantiateConcreteTypeFromMangledName(qword_1EBFF78F0);
  uint64_t v16 = swift_allocObject();
  long long v36 = xmmword_1E4AD0BF0;
  *(_OWORD *)(v16 + 16) = xmmword_1E4AD0BF0;
  *(void *)(v16 + 32) = a1;
  sub_1E4ACFCD8();
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF78D0);
  uint64_t v17 = (void *)sub_1E4ACFCB8();
  swift_bridgeObjectRelease();
  uint64_t v37 = *((void *)v7 + 1);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_1E4AD0BF0;
  *(void *)(v18 + 32) = a6;
  sub_1E4ACFCD8();
  sub_1E4ACAED8(0, (unint64_t *)&qword_1EBFF78C0);
  id v19 = a6;
  uint64_t v20 = a2;
  char v21 = (void *)sub_1E4ACFCB8();
  swift_bridgeObjectRelease();
  id v22 = objc_msgSend(v15, sel_layoutGroupForDatasourceItems_environment_layoutItems_, v17, v37, v21);
  swift_unknownObjectRelease();

  a2 = v20;
  if (!v22) {
LABEL_3:
  }
    id v22 = _s15MessagesSupport25TranscriptLayoutUtilitiesC012dynamicWidthD5Group10layoutItemSo012NSCollectiondH0CSo0kdJ0C_tFZ_0(a6);
  uint64_t v23 = *((void *)v7 + 1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF78D0);
  uint64_t v24 = (void *)sub_1E4ACFCB8();
  sub_1E4ACAED8(0, &qword_1EBFF78D8);
  uint64_t v25 = (void *)sub_1E4ACFCB8();
  id v26 = objc_msgSend(a1, sel_layoutItemSpacingWithEnvironment_datasourceItemIndex_allDatasourceItems_supplementryItems_sizeOverride_, v23, a2, v24, v25, a3, a4);

  if (v26)
  {
    objc_msgSend(v22, sel_setEdgeSpacing_, v26);
    id v27 = objc_msgSend(v26, sel_top);
    if (v27)
    {
      uint64_t v28 = v27;
      objc_msgSend(v27, sel_spacing);
      double v30 = v29;

      v7[3] = v30 + v7[3];
    }
    id v31 = objc_msgSend(v26, sel_bottom, v36);
    if (v31)
    {
      uint64_t v32 = v31;
      objc_msgSend(v31, sel_spacing);
      double v34 = v33;

      v7[3] = v34 + v7[3];
    }
    else
    {
    }
  }
  id v35 = v22;
  MEMORY[0x1E4E87220]();
  if (*(void *)(((void)v7[2] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((void)v7[2] & 0xFFFFFFFFFFFFFF8)
                                                                              + 0x18) >> 1)
    sub_1E4ACFCE8();
  sub_1E4ACFCF8();
  sub_1E4ACFCD8();
}

void sub_1E4ACE910(void *a1)
{
  id v3 = objc_msgSend(a1, sel_layoutSize);
  id v4 = objc_msgSend(v3, sel_heightDimension);

  LOBYTE(v3) = objc_msgSend(v4, sel_isEstimated);
  if (v3)
  {
    char v5 = 1;
  }
  else
  {
    id v6 = objc_msgSend(a1, sel_layoutSize);
    id v7 = objc_msgSend(v6, sel_heightDimension);

    objc_msgSend(v7, sel_dimension);
    double v9 = v8;

    char v5 = 0;
    *(double *)(v1 + 24) = v9 + *(double *)(v1 + 24);
  }
  *(unsigned char *)(v1 + 32) = v5;
}

uint64_t sub_1E4ACE9FC@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>, double a6@<D0>, double a7@<D1>, double a8@<D2>, double a9@<D3>)
{
  *((void *)&v46 + 1) = MEMORY[0x1E4FBC860];
  uint64_t v47 = 0;
  char v48 = 0;
  long long v49 = 0uLL;
  *(void *)&long long v50 = MEMORY[0x1E4FBC860];
  *((void *)&v50 + 1) = MEMORY[0x1E4FBC860];
  id v19 = (void **)&a1[OBJC_IVAR___CKTranscriptCompositorSwift_collectionView];
  swift_beginAccess();
  uint64_t v20 = *v19;
  if (!*v19)
  {
    swift_bridgeObjectRelease();
    sub_1E4ACAED8(0, &qword_1EBFF78E0);
    id v26 = (void *)sub_1E4ACFD18();
    sub_1E4ACFD08();
    sub_1E4ACF948();

    sub_1E4ACED84();
    swift_allocError();
    *id v27 = 1;
    swift_willThrow();

    swift_unknownObjectRelease();
LABEL_8:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  uint64_t v43 = a2;
  id v45 = a1;
  char v21 = &a1[OBJC_IVAR___CKTranscriptCompositorSwift_delegate];
  swift_beginAccess();
  id v22 = (void *)MEMORY[0x1E4E87900](v21);
  id v23 = v20;
  uint64_t v24 = a1;
  uint64_t v42 = a5;
  unint64_t v51 = a4;
  if (v22)
  {
    id v25 = objc_msgSend(v22, sel_compositorMessageEditingContext);
    swift_unknownObjectRelease();
  }
  else
  {
    id v25 = 0;
  }
  uint64_t v28 = &v24[OBJC_IVAR___CKTranscriptCompositorSwift_datasource];
  swift_beginAccess();
  uint64_t v29 = *(void *)v28;
  v44[3] = swift_getObjectType();
  v44[0] = v29;
  double v30 = &v24[OBJC_IVAR___CKTranscriptCompositorSwift_layoutContext];
  swift_beginAccess();
  uint64_t v31 = *(void *)v30;
  id v32 = objc_allocWithZone((Class)CKTranscriptLayoutEnvironment);
  id v33 = v23;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v34 = v25;
  id v35 = objc_msgSend(v32, sel_initWithDatasource_collectionLayoutEnvironment_collectionView_marginInsets_layoutContext_messageEditingContext_, sub_1E4ACFD78(), a3, v33, v31, v34, a6, a7, a8, a9);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  __swift_destroy_boxed_opaque_existential_0((uint64_t)v44);
  *(void *)&long long v46 = v35;
  sub_1E4ACDB9C(v43, v51);

  swift_bridgeObjectRelease();
  uint64_t result = swift_unknownObjectRelease();
  if (v9)
  {

    goto LABEL_8;
  }
  uint64_t v37 = v47;
  char v38 = v48;
  long long v39 = v49;
  long long v40 = v46;
  long long v41 = v50;
  *(void *)uint64_t v42 = v45;
  *(_OWORD *)(v42 + 8) = v40;
  *(void *)(v42 + 24) = v37;
  *(unsigned char *)(v42 + 32) = v38;
  *(_OWORD *)(v42 + 40) = v39;
  *(_OWORD *)(v42 + 56) = v41;
  return result;
}

unint64_t sub_1E4ACED84()
{
  unint64_t result = qword_1EAE88EF8;
  if (!qword_1EAE88EF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE88EF8);
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for TranscriptCompositorLayoutPassError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
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
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for TranscriptCompositorLayoutPassError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1E4ACEF94);
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

uint64_t sub_1E4ACEFBC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1E4ACEFC8(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for TranscriptCompositorLayoutPassError()
{
  return &type metadata for TranscriptCompositorLayoutPassError;
}

unint64_t sub_1E4ACEFE8()
{
  unint64_t result = qword_1EAE88F60;
  if (!qword_1EAE88F60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE88F60);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for InboxItemView(void *a1, void *a2)
{
  int v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  id v4 = v3;
  return a1;
}

void destroy for InboxItemView(uint64_t a1)
{
}

void *assignWithCopy for InboxItemView(void *a1, void *a2)
{
  *a1 = *a2;
  int v3 = (void *)a2[1];
  id v4 = (void *)a1[1];
  a1[1] = v3;
  id v5 = v3;

  return a1;
}

void *assignWithTake for InboxItemView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  id v4 = (void *)a1[1];
  *a1 = *a2;
  a1[1] = v3;

  return a1;
}

uint64_t getEnumTagSinglePayload for InboxItemView(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for InboxItemView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for InboxItemView()
{
  return &type metadata for InboxItemView;
}

uint64_t sub_1E4ACF17C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1E4ACF198@<X0>(uint64_t a1@<X0>, void *a2@<X1>, char *a3@<X8>)
{
  unint64_t v51 = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE88F78);
  uint64_t v50 = *(void *)(v5 - 8);
  uint64_t v6 = MEMORY[0x1F4188790](v5);
  int v8 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  uint64_t v54 = a1;
  id v55 = a2;
  uint64_t v52 = a1;
  uint64_t v53 = a2;
  long long v49 = (char *)&v44 - v9;
  sub_1E4ACFC28();
  swift_getKeyPath();
  swift_getKeyPath();
  id v10 = a2;
  sub_1E4ACF9D8();

  swift_release();
  swift_release();
  uint64_t v11 = HIBYTE(v57) & 0xF;
  if ((v57 & 0x2000000000000000) == 0) {
    uint64_t v11 = v56 & 0xFFFFFFFFFFFFLL;
  }
  if (v11)
  {
    sub_1E4AC489C();
    uint64_t v12 = sub_1E4ACFBA8();
    uint64_t v14 = v13;
    char v16 = v15 & 1;
    sub_1E4ACFB18();
    uint64_t v17 = sub_1E4ACFB98();
    id v45 = v8;
    uint64_t v46 = v5;
    uint64_t v18 = v17;
    uint64_t v20 = v19;
    char v22 = v21;
    swift_release();
    char v23 = v22 & 1;
    sub_1E4AC7FA0(v12, v14, v16);
    swift_bridgeObjectRelease();
    id v24 = objc_msgSend(self, sel_secondaryLabelColor);
    MEMORY[0x1E4E87180](v24);
    uint64_t v25 = sub_1E4ACFB78();
    uint64_t v27 = v26;
    char v29 = v28;
    uint64_t v31 = v30;
    uint64_t v5 = v46;
    swift_release();
    uint64_t v32 = v29 & 1;
    int v8 = v45;
    sub_1E4AC7FA0(v18, v20, v23);
    swift_bridgeObjectRelease();
    sub_1E4ACF734(v25, v27, v32);
    swift_bridgeObjectRetain();
    uint64_t v47 = v27;
    uint64_t v48 = v25;
    sub_1E4AC7FA0(v25, v27, v32);
    swift_bridgeObjectRelease();
    uint64_t v33 = 1;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v33 = 0;
    uint64_t v47 = 0;
    uint64_t v48 = 0;
    uint64_t v32 = 0;
    uint64_t v31 = 0;
  }
  id v34 = v49;
  uint64_t v35 = v50;
  long long v36 = *(void (**)(char *, char *, uint64_t))(v50 + 16);
  uint64_t v37 = v5;
  v36(v8, v49, v5);
  char v38 = v51;
  v36(v51, v8, v37);
  long long v39 = &v38[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EAE88F80) + 48)];
  *(void *)long long v39 = 0;
  *((void *)v39 + 1) = v33;
  uint64_t v41 = v47;
  uint64_t v40 = v48;
  *((void *)v39 + 2) = v48;
  *((void *)v39 + 3) = v41;
  *((void *)v39 + 4) = v32;
  *((void *)v39 + 5) = v31;
  sub_1E4ACF744(0, v33, v40, v41, v32, v31);
  uint64_t v42 = *(void (**)(char *, uint64_t))(v35 + 8);
  v42(v34, v37);
  sub_1E4ACF794(0, v33, v40, v41, v32, v31);
  return ((uint64_t (*)(char *, uint64_t))v42)(v8, v37);
}

uint64_t sub_1E4ACF560@<X0>(uint64_t a1@<X8>)
{
  sub_1E4AC489C();
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_1E4ACFBA8();
  uint64_t v4 = v3;
  char v6 = v5 & 1;
  id v7 = objc_msgSend(self, sel_labelColor);
  MEMORY[0x1E4E87180](v7);
  uint64_t v8 = sub_1E4ACFB78();
  uint64_t v10 = v9;
  char v12 = v11;
  uint64_t v14 = v13;
  swift_release();
  sub_1E4AC7FA0(v2, v4, v6);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a1 = v8;
  *(void *)(a1 + 8) = v10;
  *(unsigned char *)(a1 + 16) = v12 & 1;
  *(void *)(a1 + 24) = v14;
  return result;
}

uint64_t sub_1E4ACF670@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = *v1;
  uint64_t v3 = (void *)v1[1];
  *(void *)a1 = sub_1E4ACFA98();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE88F70);
  return sub_1E4ACF198(v4, v3, (char *)(a1 + *(int *)(v5 + 44)));
}

uint64_t sub_1E4ACF6CC@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4ACF560(a1);
}

uint64_t sub_1E4ACF6D4@<X0>(uint64_t *a1@<X8>)
{
  swift_bridgeObjectRetain();
  uint64_t result = sub_1E4ACFC18();
  *a1 = result;
  return result;
}

uint64_t sub_1E4ACF734(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_1E4ACF744(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  if (a6)
  {
    sub_1E4ACF734(a3, a4, a5 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_1E4ACF794(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  if (a6)
  {
    sub_1E4AC7FA0(a3, a4, a5 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_1E4ACF7E8()
{
  unint64_t result = qword_1EAE88F88;
  if (!qword_1EAE88F88)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_1EAE88F90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE88F88);
  }
  return result;
}

uint64_t sub_1E4ACF848()
{
  return MEMORY[0x1F40E3550]();
}

uint64_t sub_1E4ACF858()
{
  return MEMORY[0x1F40E35A8]();
}

uint64_t sub_1E4ACF868()
{
  return MEMORY[0x1F40E3F58]();
}

uint64_t sub_1E4ACF878()
{
  return MEMORY[0x1F40E5188]();
}

uint64_t sub_1E4ACF888()
{
  return MEMORY[0x1F40E51A8]();
}

uint64_t sub_1E4ACF898()
{
  return MEMORY[0x1F40E51D8]();
}

uint64_t sub_1E4ACF8A8()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1E4ACF8B8()
{
  return MEMORY[0x1F40E53F8]();
}

uint64_t sub_1E4ACF8C8()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1E4ACF8D8()
{
  return MEMORY[0x1F40E5648]();
}

uint64_t sub_1E4ACF8E8()
{
  return MEMORY[0x1F40E5728]();
}

uint64_t sub_1E4ACF8F8()
{
  return MEMORY[0x1F40E5890]();
}

uint64_t sub_1E4ACF908()
{
  return MEMORY[0x1F40E58D0]();
}

uint64_t sub_1E4ACF918()
{
  return MEMORY[0x1F40E5930]();
}

uint64_t sub_1E4ACF928()
{
  return MEMORY[0x1F40E5AB8]();
}

uint64_t sub_1E4ACF938()
{
  return MEMORY[0x1F40E5B18]();
}

uint64_t sub_1E4ACF948()
{
  return MEMORY[0x1F41884F0]();
}

uint64_t sub_1E4ACF958()
{
  return MEMORY[0x1F40F7D68]();
}

uint64_t sub_1E4ACF968()
{
  return MEMORY[0x1F40D69E0]();
}

uint64_t sub_1E4ACF978()
{
  return MEMORY[0x1F40D6A20]();
}

uint64_t sub_1E4ACF988()
{
  return MEMORY[0x1F40D6B68]();
}

uint64_t sub_1E4ACF998()
{
  return MEMORY[0x1F40D6B80]();
}

uint64_t sub_1E4ACF9A8()
{
  return MEMORY[0x1F40D6B88]();
}

uint64_t sub_1E4ACF9B8()
{
  return MEMORY[0x1F40D6B90]();
}

uint64_t sub_1E4ACF9C8()
{
  return MEMORY[0x1F40D6B98]();
}

uint64_t sub_1E4ACF9D8()
{
  return MEMORY[0x1F40D6BA0]();
}

uint64_t sub_1E4ACF9E8()
{
  return MEMORY[0x1F40D6BA8]();
}

uint64_t sub_1E4ACF9F8()
{
  return MEMORY[0x1F40D6BB8]();
}

uint64_t sub_1E4ACFA08()
{
  return MEMORY[0x1F40F87F0]();
}

uint64_t sub_1E4ACFA18()
{
  return MEMORY[0x1F40F8EC8]();
}

uint64_t sub_1E4ACFA28()
{
  return MEMORY[0x1F40F8ED0]();
}

uint64_t sub_1E4ACFA38()
{
  return MEMORY[0x1F40F90C8]();
}

uint64_t sub_1E4ACFA48()
{
  return MEMORY[0x1F40F90E0]();
}

uint64_t sub_1E4ACFA58()
{
  return MEMORY[0x1F40F9470]();
}

uint64_t sub_1E4ACFA68()
{
  return MEMORY[0x1F40F9480]();
}

uint64_t sub_1E4ACFA78()
{
  return MEMORY[0x1F40F9550]();
}

uint64_t sub_1E4ACFA88()
{
  return MEMORY[0x1F40F9568]();
}

uint64_t sub_1E4ACFA98()
{
  return MEMORY[0x1F40F98C0]();
}

uint64_t sub_1E4ACFAA8()
{
  return MEMORY[0x1F40F9CD8]();
}

uint64_t sub_1E4ACFAB8()
{
  return MEMORY[0x1F40F9E10]();
}

uint64_t sub_1E4ACFAC8()
{
  return MEMORY[0x1F40F9FA8]();
}

uint64_t sub_1E4ACFAD8()
{
  return MEMORY[0x1F40FA288]();
}

uint64_t sub_1E4ACFAE8()
{
  return MEMORY[0x1F40FA298]();
}

uint64_t sub_1E4ACFAF8()
{
  return MEMORY[0x1F40FADC0]();
}

uint64_t sub_1E4ACFB08()
{
  return MEMORY[0x1F40FADE0]();
}

uint64_t sub_1E4ACFB18()
{
  return MEMORY[0x1F40FAE68]();
}

uint64_t sub_1E4ACFB28()
{
  return MEMORY[0x1F40FB000]();
}

uint64_t sub_1E4ACFB38()
{
  return MEMORY[0x1F40FB078]();
}

uint64_t sub_1E4ACFB48()
{
  return MEMORY[0x1F40FB088]();
}

uint64_t sub_1E4ACFB58()
{
  return MEMORY[0x1F40FB0E8]();
}

uint64_t sub_1E4ACFB68()
{
  return MEMORY[0x1F40FB1E0]();
}

uint64_t sub_1E4ACFB78()
{
  return MEMORY[0x1F40FB3B0]();
}

uint64_t sub_1E4ACFB88()
{
  return MEMORY[0x1F40FB408]();
}

uint64_t sub_1E4ACFB98()
{
  return MEMORY[0x1F40FB460]();
}

uint64_t sub_1E4ACFBA8()
{
  return MEMORY[0x1F40FB580]();
}

uint64_t sub_1E4ACFBB8()
{
  return MEMORY[0x1F40FB5D0]();
}

uint64_t sub_1E4ACFBC8()
{
  return MEMORY[0x1F40FB5D8]();
}

uint64_t sub_1E4ACFBD8()
{
  return MEMORY[0x1F40FB920]();
}

uint64_t sub_1E4ACFBE8()
{
  return MEMORY[0x1F40FBA60]();
}

uint64_t sub_1E4ACFBF8()
{
  return MEMORY[0x1F40FC240]();
}

uint64_t sub_1E4ACFC08()
{
  return MEMORY[0x1F40FC2E0]();
}

uint64_t sub_1E4ACFC18()
{
  return MEMORY[0x1F40FC5A0]();
}

uint64_t sub_1E4ACFC28()
{
  return MEMORY[0x1F40FC620]();
}

uint64_t sub_1E4ACFC38()
{
  return MEMORY[0x1F40FC760]();
}

uint64_t sub_1E4ACFC48()
{
  return MEMORY[0x1F40FC9D0]();
}

uint64_t sub_1E4ACFC58()
{
  return MEMORY[0x1F40FCA30]();
}

uint64_t sub_1E4ACFC68()
{
  return MEMORY[0x1F4183740]();
}

uint64_t sub_1E4ACFC78()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1E4ACFC88()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1E4ACFC98()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1E4ACFCA8()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1E4ACFCB8()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1E4ACFCC8()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1E4ACFCD8()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1E4ACFCE8()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1E4ACFCF8()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1E4ACFD08()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1E4ACFD18()
{
  return MEMORY[0x1F4188728]();
}

uint64_t sub_1E4ACFD28()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1E4ACFD38()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1E4ACFD48()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t sub_1E4ACFD58()
{
  return MEMORY[0x1F41852B0]();
}

uint64_t sub_1E4ACFD68()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1E4ACFD78()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_1E4ACFD88()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1E4ACFD98()
{
  return MEMORY[0x1F4185B90]();
}

uint64_t sub_1E4ACFDA8()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1E4ACFDB8()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1E4ACFDC8()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1E4ACFDD8()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1E4ACFDE8()
{
  return MEMORY[0x1F4185E90]();
}

uint64_t sub_1E4ACFDF8()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1E4ACFE08()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1E4ACFE18()
{
  return MEMORY[0x1F4185EF8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1F41865E8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1F4186618]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1F41866F8]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
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