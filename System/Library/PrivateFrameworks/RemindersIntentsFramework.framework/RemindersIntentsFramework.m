uint64_t sub_25AF46F84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);
  uint64_t vars8;

  v0 = sub_25AF795B0();
  __swift_allocate_value_buffer(v0, qword_26A4D58C8);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_26A4D58C8);
  if (qword_26A4D5900 != -1) {
    swift_once();
  }
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_26A4D6660);
  v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

id variable initialization expression of TTRIntentHandler.store()
{
  id v0 = objc_allocWithZone(MEMORY[0x263F62F78]);
  return objc_msgSend(v0, sel_initUserInteractive_, 1);
}

uint64_t variable initialization expression of TTRIntentHandler.queue()
{
  return sub_25AF79830();
}

uint64_t variable initialization expression of TTRIntentHandler.$__lazy_storage_$_contactStore()
{
  return 0;
}

uint64_t variable initialization expression of TTRIntentHandler.$__lazy_storage_$_addTasksHandler()
{
  return 0;
}

uint64_t variable initialization expression of TTRIntentHandler.$__lazy_storage_$_setTaskAttributeHandler()
{
  return 0;
}

uint64_t variable initialization expression of TTRIntentHandler.$__lazy_storage_$_snoozeTasksHandler()
{
  return 0;
}

uint64_t variable initialization expression of TTRIntentHandler.$__lazy_storage_$_searchForNotebookItemsHandler()
{
  return 0;
}

uint64_t variable initialization expression of TTRIntentHandler.$__lazy_storage_$_widgetListHandler()
{
  return 0;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_25AF47104(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_25AF47124(uint64_t result, int a2, int a3)
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

void *sub_25AF47160@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_25AF47170(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_25AF4717C(uint64_t a1, uint64_t a2)
{
  return sub_25AF47480(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_25AF47194(uint64_t a1, id *a2)
{
  uint64_t result = sub_25AF79620();
  *a2 = 0;
  return result;
}

uint64_t sub_25AF4720C(uint64_t a1, id *a2)
{
  char v3 = sub_25AF79630();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_25AF4728C@<X0>(uint64_t *a1@<X8>)
{
  sub_25AF79640();
  uint64_t v2 = sub_25AF79610();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_25AF472D0()
{
  uint64_t v0 = sub_25AF79640();
  uint64_t v2 = v1;
  if (v0 == sub_25AF79640() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_25AF79C80();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_25AF4735C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_25AF79610();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_25AF473A4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25AF79640();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25AF473D0(uint64_t a1)
{
  uint64_t v2 = sub_25AF48EA8(&qword_26A4D59C0);
  uint64_t v3 = sub_25AF48EA8(&qword_26A4D59C8);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_25AF47468(uint64_t a1, uint64_t a2)
{
  return sub_25AF47480(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_25AF47480(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_25AF79640();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_25AF474C4()
{
  sub_25AF79640();
  sub_25AF79680();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25AF47518()
{
  sub_25AF79640();
  sub_25AF79CC0();
  sub_25AF79680();
  uint64_t v0 = sub_25AF79CD0();
  swift_bridgeObjectRelease();
  return v0;
}

void sub_25AF4758C(void *a1, uint64_t a2, uint64_t a3)
{
  if (qword_26A4D58C0 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_25AF795B0();
  v6 = (uint8_t *)__swift_project_value_buffer(v5, (uint64_t)qword_26A4D58C8);
  id v7 = a1;
  v8 = sub_25AF795A0();
  os_log_type_t v9 = sub_25AF797D0();
  unint64_t v10 = 0x265487000uLL;
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v73 = a3;
    v11 = (uint8_t *)swift_slowAlloc();
    v72 = v6;
    uint64_t v12 = swift_slowAlloc();
    unint64_t v75 = v12;
    *(_DWORD *)v11 = 136315138;
    id v13 = objc_msgSend(v7, sel_contactEventTrigger);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5988);
    uint64_t v14 = sub_25AF799B0();
    unint64_t v16 = v15;

    uint64_t v17 = v14;
    unint64_t v10 = 0x265487000;
    sub_25AF772F0(v17, v16, (uint64_t *)&v75);
    sub_25AF799C0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25AF45000, v8, v9, "SiriKit asked for resolving contactEventTrigger {contactEventTrigger: %s}", v11, 0xCu);
    swift_arrayDestroy();
    v6 = v72;
    MEMORY[0x26115ACE0](v12, -1, -1);
    v18 = v11;
    a3 = v73;
    MEMORY[0x26115ACE0](v18, -1, -1);
  }
  else
  {
  }
  id v19 = [v7 *(SEL *)(v10 + 2528)];
  if (!v19) {
    goto LABEL_13;
  }
  id v20 = v19;
  id v21 = objc_msgSend(v19, sel_triggerContact);
  if (!v21)
  {

LABEL_13:
    v29 = sub_25AF795A0();
    os_log_type_t v30 = sub_25AF797D0();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v31 = 0;
      _os_log_impl(&dword_25AF45000, v29, v30, "Got nil contactEventTrigger. {result: .notRequired}", v31, 2u);
      MEMORY[0x26115ACE0](v31, -1, -1);
    }

    sub_25AF48D94(0, &qword_26A4D5990);
    id v20 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_notRequired);
    (*(void (**)(uint64_t, id))(a3 + 16))(a3, v20);
    goto LABEL_16;
  }
  v22 = v21;
  id v23 = sub_25AF4C098(v7);
  if (!v23)
  {
    v32 = sub_25AF795A0();
    os_log_type_t v33 = sub_25AF797B0();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v34 = 0;
      _os_log_impl(&dword_25AF45000, v32, v33, "Unable to lookup capabilities. Ignoring contactEventTrigger. {result: .notRequired}", v34, 2u);
      MEMORY[0x26115ACE0](v34, -1, -1);
    }

    sub_25AF48D94(0, &qword_26A4D5990);
    id v35 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_notRequired);
    (*(void (**)(uint64_t, id))(a3 + 16))(a3, v35);

    id v20 = v35;
    goto LABEL_16;
  }
  v24 = v23;
  if ((objc_msgSend(v23, sel_supportsPersonTrigger) & 1) == 0)
  {
    v36 = sub_25AF795A0();
    os_log_type_t v37 = sub_25AF797D0();
    if (os_log_type_enabled(v36, v37))
    {
      v38 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v38 = 0;
      _os_log_impl(&dword_25AF45000, v36, v37, "Reminder account doesn't support contactTrigger. {result: .unsupported(.accountDoesNotSupport)}", v38, 2u);
      MEMORY[0x26115ACE0](v38, -1, -1);
    }

    id v39 = objc_msgSend(self, sel_unsupportedForReason_, 1);
    (*(void (**)(uint64_t, id))(a3 + 16))(a3, v39);

    id v20 = v39;
    goto LABEL_16;
  }
  id v25 = objc_msgSend(v22, sel_contactIdentifier);
  if (v25)
  {

    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5980);
    uint64_t v26 = swift_allocObject();
    *(_OWORD *)(v26 + 16) = xmmword_25AF7A510;
    *(void *)(v26 + 32) = v22;
    unint64_t v75 = v26;
    sub_25AF796F0();
    unint64_t v27 = v75;
    id v28 = v22;
  }
  else
  {
    id v40 = objc_msgSend(v22, sel_alternatives);
    if (v40)
    {
      v41 = v40;
      sub_25AF48D94(0, &qword_26A4D5978);
      unint64_t v27 = sub_25AF796D0();
    }
    else
    {
      unint64_t v27 = MEMORY[0x263F8EE78];
    }
  }
  if (v27 >> 62)
  {
    swift_bridgeObjectRetain();
    unint64_t v42 = sub_25AF79C10();
    swift_bridgeObjectRelease();
    v71 = v24;
    if (v42)
    {
LABEL_28:
      unint64_t v75 = MEMORY[0x263F8EE78];
      sub_25AF79B10();
      if ((v42 & 0x8000000000000000) != 0)
      {
        __break(1u);
LABEL_60:
        id v70 = (id)MEMORY[0x26115A540](0, v42);
LABEL_56:
        v58 = v70;
        swift_bridgeObjectRelease();
        sub_25AF48D94(0, &qword_26A4D5990);
        id v59 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_successWithResolvedContactEventTrigger_, v58);
        goto LABEL_57;
      }
      uint64_t v43 = 0;
      do
      {
        if ((v27 & 0xC000000000000001) != 0) {
          id v44 = (id)MEMORY[0x26115A540](v43, v27);
        }
        else {
          id v44 = *(id *)(v27 + 8 * v43 + 32);
        }
        v45 = v44;
        ++v43;
        objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FA08]), sel_initWithTriggerContact_, v44);

        sub_25AF79AF0();
        sub_25AF79B20();
        sub_25AF79B30();
        sub_25AF79B00();
      }
      while (v42 != v43);
      unint64_t v42 = v75;
      swift_bridgeObjectRelease();
      v24 = v71;
      if (!(v42 >> 62)) {
        goto LABEL_35;
      }
LABEL_42:
      swift_bridgeObjectRetain();
      uint64_t v46 = sub_25AF79C10();
      swift_bridgeObjectRelease();
      if (v46 >= 2) {
        goto LABEL_36;
      }
      goto LABEL_43;
    }
  }
  else
  {
    unint64_t v42 = *(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10);
    v71 = v24;
    if (v42) {
      goto LABEL_28;
    }
  }
  swift_bridgeObjectRelease();
  unint64_t v42 = MEMORY[0x263F8EE78];
  if (MEMORY[0x263F8EE78] >> 62) {
    goto LABEL_42;
  }
LABEL_35:
  uint64_t v46 = *(void *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v46 >= 2)
  {
LABEL_36:
    swift_bridgeObjectRetain_n();
    v47 = sub_25AF795A0();
    os_log_type_t v48 = sub_25AF797D0();
    if (os_log_type_enabled(v47, v48))
    {
      v49 = (uint8_t *)swift_slowAlloc();
      uint64_t v74 = swift_slowAlloc();
      unint64_t v75 = v74;
      *(_DWORD *)v49 = 136315138;
      v50 = v22;
      uint64_t v51 = sub_25AF48D94(0, &qword_26A4D5970);
      uint64_t v52 = swift_bridgeObjectRetain();
      uint64_t v53 = MEMORY[0x26115A160](v52, v51);
      unint64_t v55 = v54;
      swift_bridgeObjectRelease();
      uint64_t v56 = v53;
      v22 = v50;
      v24 = v71;
      sub_25AF772F0(v56, v55, (uint64_t *)&v75);
      sub_25AF799C0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25AF45000, v47, v48, "Got >1 triggersToChoose {result: .disambiguation(%s)}", v49, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x26115ACE0](v74, -1, -1);
      MEMORY[0x26115ACE0](v49, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    sub_25AF48D94(0, &qword_26A4D5990);
    ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
    sub_25AF48D94(0, &qword_26A4D5970);
    v58 = (void *)sub_25AF796C0();
    swift_bridgeObjectRelease();
    id v59 = objc_msgSend(ObjCClassFromMetadata, sel_disambiguationWithContactEventTriggersToDisambiguate_, v58);
LABEL_57:
    id v69 = v59;

LABEL_58:
    (*(void (**)(uint64_t, id))(a3 + 16))(a3, v69);

LABEL_16:
    return;
  }
LABEL_43:
  if (v46 != 1)
  {
    swift_bridgeObjectRelease();
    v66 = sub_25AF795A0();
    os_log_type_t v67 = sub_25AF797D0();
    if (os_log_type_enabled(v66, v67))
    {
      v68 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v68 = 0;
      _os_log_impl(&dword_25AF45000, v66, v67, "Got 0 triggersToChoose {result: .unsupported}", v68, 2u);
      MEMORY[0x26115ACE0](v68, -1, -1);
    }

    sub_25AF48D94(0, &qword_26A4D5990);
    id v69 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupported);
    goto LABEL_58;
  }
  swift_bridgeObjectRetain_n();
  v60 = sub_25AF795A0();
  os_log_type_t v61 = sub_25AF797D0();
  if (!os_log_type_enabled(v60, v61))
  {

    swift_bridgeObjectRelease_n();
    unint64_t v62 = v42 & 0xC000000000000001;
    goto LABEL_53;
  }
  v6 = (uint8_t *)swift_slowAlloc();
  unint64_t v27 = swift_slowAlloc();
  *(_DWORD *)v6 = 138412290;
  unint64_t v62 = v42 & 0xC000000000000001;
  if ((v42 & 0xC000000000000001) != 0) {
    goto LABEL_62;
  }
  if (*(void *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    v63 = v22;
    for (id i = *(id *)(v42 + 32); ; id i = (id)MEMORY[0x26115A540](0, v42))
    {
      id v65 = i;
      unint64_t v75 = (unint64_t)i;
      sub_25AF799C0();
      *(void *)unint64_t v27 = v65;
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25AF45000, v60, v61, "Got 1 triggersToChoose {result: .success(%@)}", v6, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5D80);
      swift_arrayDestroy();
      MEMORY[0x26115ACE0](v27, -1, -1);
      MEMORY[0x26115ACE0](v6, -1, -1);

      v22 = v63;
      v24 = v71;
LABEL_53:
      if (v62) {
        break;
      }
      if (*(void *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        id v70 = *(id *)(v42 + 32);
        goto LABEL_56;
      }
      __break(1u);
LABEL_62:
      v63 = v22;
    }
    goto LABEL_60;
  }
  __break(1u);
}

void sub_25AF480E8(void *a1, uint64_t a2, uint64_t a3)
{
  if (qword_26A4D58C0 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_25AF795B0();
  v6 = (uint8_t *)__swift_project_value_buffer(v5, (uint64_t)qword_26A4D58C8);
  id v7 = a1;
  v8 = sub_25AF795A0();
  os_log_type_t v9 = sub_25AF797D0();
  unint64_t v10 = 0x265487000uLL;
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v76 = a3;
    v11 = (uint8_t *)swift_slowAlloc();
    unint64_t v75 = v6;
    uint64_t v12 = swift_slowAlloc();
    unint64_t v78 = v12;
    *(_DWORD *)v11 = 136315138;
    id v13 = objc_msgSend(v7, sel_contactEventTrigger);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5988);
    uint64_t v14 = sub_25AF799B0();
    unint64_t v16 = v15;

    uint64_t v17 = v14;
    unint64_t v10 = 0x265487000;
    sub_25AF772F0(v17, v16, (uint64_t *)&v78);
    sub_25AF799C0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25AF45000, v8, v9, "SiriKit asked for resolving contactEventTrigger {contactEventTrigger: %s}", v11, 0xCu);
    swift_arrayDestroy();
    v6 = v75;
    MEMORY[0x26115ACE0](v12, -1, -1);
    v18 = v11;
    a3 = v76;
    MEMORY[0x26115ACE0](v18, -1, -1);
  }
  else
  {
  }
  id v19 = [v7 *(SEL *)(v10 + 2528)];
  if (!v19) {
    goto LABEL_18;
  }
  id v20 = v19;
  id v21 = objc_msgSend(v19, sel_triggerContact);
  if (!v21)
  {

LABEL_18:
    v36 = sub_25AF795A0();
    os_log_type_t v37 = sub_25AF797D0();
    if (os_log_type_enabled(v36, v37))
    {
      v38 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v38 = 0;
      _os_log_impl(&dword_25AF45000, v36, v37, "Got nil contactEventTrigger. {result: .notRequired}", v38, 2u);
      MEMORY[0x26115ACE0](v38, -1, -1);
    }

    sub_25AF48D94(0, (unint64_t *)&unk_26A4D5960);
    id v20 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_notRequired);
    (*(void (**)(uint64_t, id))(a3 + 16))(a3, v20);
    goto LABEL_21;
  }
  v22 = v21;
  id v23 = objc_msgSend(v7, sel_targetTask);
  if (!v23
    || (v24 = v23, id v25 = (void *)sub_25AF798D0(), v24, !v25)
    || (id v26 = objc_msgSend(v25, sel_account),
        id v27 = objc_msgSend(v26, sel_capabilities),
        v26,
        v25,
        !v27))
  {
    v32 = sub_25AF795A0();
    os_log_type_t v33 = sub_25AF797B0();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v34 = 0;
      _os_log_impl(&dword_25AF45000, v32, v33, "Unable to lookup capabilities. Ignoring contactEventTrigger. {result: .notRequired}", v34, 2u);
      MEMORY[0x26115ACE0](v34, -1, -1);
    }

    sub_25AF48D94(0, (unint64_t *)&unk_26A4D5960);
    id v35 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_notRequired);
    (*(void (**)(uint64_t, id))(a3 + 16))(a3, v35);

    id v20 = v35;
    goto LABEL_21;
  }
  if (!objc_msgSend(v27, sel_supportsPersonTrigger))
  {
    id v39 = sub_25AF795A0();
    os_log_type_t v40 = sub_25AF797D0();
    if (os_log_type_enabled(v39, v40))
    {
      v41 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v41 = 0;
      _os_log_impl(&dword_25AF45000, v39, v40, "Reminder account doesn't support contactTrigger. {result: .unsupported(.accountDoesNotSupport)}", v41, 2u);
      MEMORY[0x26115ACE0](v41, -1, -1);
    }

    id v42 = objc_msgSend(self, sel_unsupportedForReason_, 1);
    (*(void (**)(uint64_t, id))(a3 + 16))(a3, v42);

    id v20 = v42;
    goto LABEL_21;
  }
  id v28 = objc_msgSend(v22, sel_contactIdentifier);
  if (v28)
  {

    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5980);
    uint64_t v29 = swift_allocObject();
    *(_OWORD *)(v29 + 16) = xmmword_25AF7A510;
    *(void *)(v29 + 32) = v22;
    unint64_t v78 = v29;
    sub_25AF796F0();
    unint64_t v30 = v78;
    id v31 = v22;
  }
  else
  {
    id v43 = objc_msgSend(v22, sel_alternatives);
    if (v43)
    {
      id v44 = v43;
      sub_25AF48D94(0, &qword_26A4D5978);
      unint64_t v30 = sub_25AF796D0();
    }
    else
    {
      unint64_t v30 = MEMORY[0x263F8EE78];
    }
  }
  if (v30 >> 62)
  {
    swift_bridgeObjectRetain();
    unint64_t v45 = sub_25AF79C10();
    swift_bridgeObjectRelease();
    id v74 = v27;
    if (v45) {
      goto LABEL_30;
    }
LABEL_38:
    swift_bridgeObjectRelease();
    unint64_t v45 = MEMORY[0x263F8EE78];
    goto LABEL_39;
  }
  unint64_t v45 = *(void *)((v30 & 0xFFFFFFFFFFFFFF8) + 0x10);
  id v74 = v27;
  if (!v45) {
    goto LABEL_38;
  }
LABEL_30:
  unint64_t v78 = MEMORY[0x263F8EE78];
  sub_25AF79B10();
  if ((v45 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_63:
    id v73 = (id)MEMORY[0x26115A540](0, v45);
LABEL_59:
    os_log_type_t v61 = v73;
    swift_bridgeObjectRelease();
    sub_25AF48D94(0, (unint64_t *)&unk_26A4D5960);
    id v62 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_successWithResolvedContactEventTrigger_, v61);
    goto LABEL_60;
  }
  uint64_t v46 = 0;
  do
  {
    if ((v30 & 0xC000000000000001) != 0) {
      id v47 = (id)MEMORY[0x26115A540](v46, v30);
    }
    else {
      id v47 = *(id *)(v30 + 8 * v46 + 32);
    }
    os_log_type_t v48 = v47;
    ++v46;
    objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FA08]), sel_initWithTriggerContact_, v47);

    sub_25AF79AF0();
    sub_25AF79B20();
    sub_25AF79B30();
    sub_25AF79B00();
  }
  while (v45 != v46);
  unint64_t v45 = v78;
  swift_bridgeObjectRelease();
  id v27 = v74;
LABEL_39:
  if (v45 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v49 = sub_25AF79C10();
    swift_bridgeObjectRelease();
    if (v49 >= 2) {
      goto LABEL_41;
    }
  }
  else
  {
    uint64_t v49 = *(void *)((v45 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v49 >= 2)
    {
LABEL_41:
      swift_bridgeObjectRetain_n();
      v50 = sub_25AF795A0();
      os_log_type_t v51 = sub_25AF797D0();
      if (os_log_type_enabled(v50, v51))
      {
        uint64_t v52 = (uint8_t *)swift_slowAlloc();
        uint64_t v77 = swift_slowAlloc();
        unint64_t v78 = v77;
        *(_DWORD *)uint64_t v52 = 136315138;
        uint64_t v53 = v22;
        uint64_t v54 = sub_25AF48D94(0, &qword_26A4D5970);
        uint64_t v55 = swift_bridgeObjectRetain();
        uint64_t v56 = MEMORY[0x26115A160](v55, v54);
        unint64_t v58 = v57;
        swift_bridgeObjectRelease();
        uint64_t v59 = v56;
        v22 = v53;
        id v27 = v74;
        sub_25AF772F0(v59, v58, (uint64_t *)&v78);
        sub_25AF799C0();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25AF45000, v50, v51, "Got >1 triggersToChoose {result: .disambiguation(%s)}", v52, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x26115ACE0](v77, -1, -1);
        MEMORY[0x26115ACE0](v52, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      sub_25AF48D94(0, (unint64_t *)&unk_26A4D5960);
      ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
      sub_25AF48D94(0, &qword_26A4D5970);
      os_log_type_t v61 = (void *)sub_25AF796C0();
      swift_bridgeObjectRelease();
      id v62 = objc_msgSend(ObjCClassFromMetadata, sel_disambiguationWithContactEventTriggersToDisambiguate_, v61);
LABEL_60:
      id v72 = v62;

LABEL_61:
      (*(void (**)(uint64_t, id))(a3 + 16))(a3, v72);

LABEL_21:
      return;
    }
  }
  if (v49 != 1)
  {
    swift_bridgeObjectRelease();
    id v69 = sub_25AF795A0();
    os_log_type_t v70 = sub_25AF797D0();
    if (os_log_type_enabled(v69, v70))
    {
      v71 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v71 = 0;
      _os_log_impl(&dword_25AF45000, v69, v70, "Got 0 triggersToChoose {result: .unsupported}", v71, 2u);
      MEMORY[0x26115ACE0](v71, -1, -1);
    }

    sub_25AF48D94(0, (unint64_t *)&unk_26A4D5960);
    id v72 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupported);
    goto LABEL_61;
  }
  swift_bridgeObjectRetain_n();
  v63 = sub_25AF795A0();
  os_log_type_t v64 = sub_25AF797D0();
  if (!os_log_type_enabled(v63, v64))
  {

    swift_bridgeObjectRelease_n();
    unint64_t v65 = v45 & 0xC000000000000001;
    goto LABEL_56;
  }
  v6 = (uint8_t *)swift_slowAlloc();
  unint64_t v30 = swift_slowAlloc();
  *(_DWORD *)v6 = 138412290;
  unint64_t v65 = v45 & 0xC000000000000001;
  if ((v45 & 0xC000000000000001) != 0) {
    goto LABEL_65;
  }
  if (*(void *)((v45 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    v66 = v22;
    for (id i = *(id *)(v45 + 32); ; id i = (id)MEMORY[0x26115A540](0, v45))
    {
      id v68 = i;
      unint64_t v78 = (unint64_t)i;
      sub_25AF799C0();
      *(void *)unint64_t v30 = v68;
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25AF45000, v63, v64, "Got 1 triggersToChoose {result: .success(%@)}", v6, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5D80);
      swift_arrayDestroy();
      MEMORY[0x26115ACE0](v30, -1, -1);
      MEMORY[0x26115ACE0](v6, -1, -1);

      v22 = v66;
      id v27 = v74;
LABEL_56:
      if (v65) {
        break;
      }
      if (*(void *)((v45 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        id v73 = *(id *)(v45 + 32);
        goto LABEL_59;
      }
      __break(1u);
LABEL_65:
      v66 = v22;
    }
    goto LABEL_63;
  }
  __break(1u);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
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

uint64_t sub_25AF48D94(uint64_t a1, unint64_t *a2)
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

void type metadata accessor for INTaskReference(uint64_t a1)
{
}

void type metadata accessor for REMSmartListType(uint64_t a1)
{
}

void sub_25AF48DF8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_25AF48E40()
{
  return sub_25AF48EA8(&qword_26A4D59A8);
}

uint64_t sub_25AF48E74()
{
  return sub_25AF48EA8(&qword_26A4D59B0);
}

uint64_t sub_25AF48EA8(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for REMSmartListType(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_25AF48EEC()
{
  return sub_25AF48EA8(&qword_26A4D59B8);
}

uint64_t sub_25AF48F24()
{
  uint64_t v0 = sub_25AF795B0();
  __swift_allocate_value_buffer(v0, qword_26A4D5A30);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_26A4D5A30);
  if (qword_26A4D5900 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_26A4D6660);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

void sub_25AF48FEC(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  uint64_t v5 = sub_25AF79320();
  unint64_t v6 = sub_25AF79300();
  uint64_t v60 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5C28);
  sub_25AF78F60();
  sub_25AF55188();
  sub_25AF54E10(&qword_26A4D5C38, MEMORY[0x263F07508]);
  unint64_t v7 = sub_25AF796A0();
  swift_bridgeObjectRelease();
  if (v7 >> 62)
  {
    swift_bridgeObjectRetain();
    v8 = (void *)sub_25AF79C10();
    swift_bridgeObjectRelease();
    if (v8) {
      goto LABEL_5;
    }
  }
  else
  {
    v8 = *(void **)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v8) {
      goto LABEL_5;
    }
  }
  if (!(v6 >> 62))
  {
    if (*(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_5;
    }
LABEL_52:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_26A4D58E0 != -1) {
      swift_once();
    }
    uint64_t v55 = sub_25AF795B0();
    __swift_project_value_buffer(v55, (uint64_t)qword_26A4D5A30);
    uint64_t v56 = sub_25AF795A0();
    os_log_type_t v57 = sub_25AF797D0();
    if (os_log_type_enabled(v56, v57))
    {
      unint64_t v58 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v58 = 0;
      _os_log_impl(&dword_25AF45000, v56, v57, "No REMList or REMSmartList matches the name, prompt for creation {result: .confirmationRequired(.listShouldBeCreated)}", v58, 2u);
      MEMORY[0x26115ACE0](v58, -1, -1);
    }

    id v39 = objc_msgSend(self, sel_confirmationRequiredWithTaskListToConfirm_forReason_, a2, 1);
    goto LABEL_57;
  }
  swift_bridgeObjectRetain();
  uint64_t v54 = sub_25AF79C10();
  swift_bridgeObjectRelease();
  if (!v54) {
    goto LABEL_52;
  }
LABEL_5:
  if (v7 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_25AF79C10();
    swift_bridgeObjectRelease();
    if (!v8) {
      goto LABEL_16;
    }
LABEL_9:
    if (v9 != 1) {
      goto LABEL_16;
    }
    if ((v7 & 0xC000000000000001) != 0)
    {
      swift_bridgeObjectRetain();
      id v10 = (id)MEMORY[0x26115A540](0, v7);
      swift_bridgeObjectRelease();
    }
    else
    {
      if (!*(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        goto LABEL_50;
      }
      id v10 = *(id *)(v7 + 32);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_25AF48D94(0, &qword_26A4D5B48);
    unint64_t v7 = (unint64_t)v10;
    v8 = (void *)sub_25AF79760();
    if (qword_26A4D58E0 == -1)
    {
LABEL_14:
      uint64_t v11 = sub_25AF795B0();
      __swift_project_value_buffer(v11, (uint64_t)qword_26A4D5A30);
      uint64_t v12 = (id *)(id)v7;
      id v13 = v8;
      uint64_t v14 = v12;
      id v15 = v13;
      unint64_t v16 = sub_25AF795A0();
      os_log_type_t v17 = sub_25AF797D0();
      if (os_log_type_enabled(v16, v17))
      {
        uint64_t v18 = swift_slowAlloc();
        id v19 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v18 = 138412546;
        *(void *)type = a3;
        id v20 = [v14 objectID];
        sub_25AF799C0();
        *id v19 = v20;

        *(_WORD *)(v18 + 12) = 2112;
        uint64_t v60 = (uint64_t)v15;
        id v21 = v14;
        id v22 = v15;
        a3 = *(void (**)(void))type;
        sub_25AF799C0();
        v19[1] = v15;

        uint64_t v14 = v21;
        _os_log_impl(&dword_25AF45000, v16, v17, "Got one REMList(%@) matches the name {result: .success(%@)}", (uint8_t *)v18, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5D80);
        swift_arrayDestroy();
        MEMORY[0x26115ACE0](v19, -1, -1);
        MEMORY[0x26115ACE0](v18, -1, -1);
      }
      else
      {

        unint64_t v16 = v14;
      }

      sub_25AF48D94(0, &qword_26A4D5B38);
      id v39 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_successWithResolvedTaskList_, v15);

      goto LABEL_57;
    }
LABEL_50:
    swift_once();
    goto LABEL_14;
  }
  uint64_t v9 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v8) {
    goto LABEL_9;
  }
LABEL_16:
  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v40 = sub_25AF79C10();
    swift_bridgeObjectRelease();
    if (v40 != 1) {
      goto LABEL_35;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    id v23 = (void *)sub_25AF79C10();
    swift_bridgeObjectRelease();
    if (v23)
    {
LABEL_19:
      if ((v6 & 0xC000000000000001) != 0)
      {
        id v24 = (id)MEMORY[0x26115A540](0, v6);
      }
      else
      {
        if (!*(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          goto LABEL_60;
        }
        id v24 = *(id *)(v6 + 32);
      }
      id v25 = v24;
      swift_bridgeObjectRelease();
      sub_25AF48D94(0, &qword_26A4D5B48);
      unint64_t v7 = v25;
      id v23 = (void *)sub_25AF79740();
      if (qword_26A4D58E0 == -1)
      {
LABEL_23:
        uint64_t v26 = sub_25AF795B0();
        __swift_project_value_buffer(v26, (uint64_t)qword_26A4D5A30);
        id v27 = (id *)(id)v7;
        id v28 = v23;
        uint64_t v29 = v27;
        id v30 = v28;
        id v31 = sub_25AF795A0();
        os_log_type_t v32 = sub_25AF797D0();
        if (os_log_type_enabled(v31, v32))
        {
          uint64_t v33 = swift_slowAlloc();
          v34 = (void *)swift_slowAlloc();
          *(_DWORD *)uint64_t v33 = 138412546;
          id v35 = [v29 objectID];
          sub_25AF799C0();
          void *v34 = v35;

          *(_WORD *)(v33 + 12) = 2112;
          uint64_t v60 = (uint64_t)v30;
          v36 = v29;
          os_log_type_t v37 = a3;
          id v38 = v30;
          sub_25AF799C0();
          v34[1] = v30;

          a3 = v37;
          uint64_t v29 = v36;
          _os_log_impl(&dword_25AF45000, v31, v32, "Found REMSmartList matching the name {objectID: %@, result: .success(%@)}", (uint8_t *)v33, 0x16u);
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5D80);
          swift_arrayDestroy();
          MEMORY[0x26115ACE0](v34, -1, -1);
          MEMORY[0x26115ACE0](v33, -1, -1);
        }
        else
        {

          id v31 = v29;
        }

        sub_25AF48D94(0, &qword_26A4D5B38);
        id v39 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_successWithResolvedTaskList_, v30);

LABEL_48:
LABEL_57:
        a3(v39);

        return;
      }
LABEL_60:
      swift_once();
      goto LABEL_23;
    }
  }
  else
  {
    if (*(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10) != 1) {
      goto LABEL_35;
    }
    swift_bridgeObjectRelease();
    id v23 = *(void **)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v23) {
      goto LABEL_19;
    }
  }
  swift_bridgeObjectRelease();
  __break(1u);
LABEL_35:
  swift_bridgeObjectRelease();
  if (!v9) {
    goto LABEL_42;
  }
  uint64_t v60 = MEMORY[0x263F8EE78];
  sub_25AF79B10();
  if ((v9 & 0x8000000000000000) == 0)
  {
    sub_25AF48D94(0, &qword_26A4D5B48);
    uint64_t v41 = 0;
    do
    {
      if ((v7 & 0xC000000000000001) != 0) {
        MEMORY[0x26115A540](v41, v7);
      }
      else {
        id v42 = *(id *)(v7 + 8 * v41 + 32);
      }
      ++v41;
      sub_25AF79760();
      sub_25AF79AF0();
      sub_25AF79B20();
      sub_25AF79B30();
      sub_25AF79B00();
    }
    while (v9 != v41);
LABEL_42:
    if (qword_26A4D58E0 != -1) {
      swift_once();
    }
    uint64_t v43 = sub_25AF795B0();
    __swift_project_value_buffer(v43, (uint64_t)qword_26A4D5A30);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    id v44 = sub_25AF795A0();
    os_log_type_t v45 = sub_25AF797D0();
    if (os_log_type_enabled(v44, v45))
    {
      uint64_t v46 = swift_slowAlloc();
      uint64_t v47 = swift_slowAlloc();
      uint64_t v60 = v47;
      *(_DWORD *)uint64_t v46 = 134218242;
      swift_bridgeObjectRelease();
      sub_25AF799C0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v46 + 12) = 2080;
      uint64_t v48 = sub_25AF48D94(0, &qword_26A4D5B48);
      uint64_t v49 = swift_bridgeObjectRetain();
      uint64_t v50 = MEMORY[0x26115A160](v49, v48);
      unint64_t v52 = v51;
      swift_bridgeObjectRelease();
      sub_25AF772F0(v50, v52, &v60);
      sub_25AF799C0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25AF45000, v44, v45, "Got %ld REMList matches the name {result: .disambiguation(%s)}", (uint8_t *)v46, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x26115ACE0](v47, -1, -1);
      MEMORY[0x26115ACE0](v46, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    sub_25AF48D94(0, &qword_26A4D5B38);
    ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
    sub_25AF48D94(0, &qword_26A4D5B48);
    uint64_t v29 = sub_25AF796C0();
    swift_bridgeObjectRelease();
    id v39 = objc_msgSend(ObjCClassFromMetadata, sel_disambiguationWithTaskListsToDisambiguate_, v29);
    goto LABEL_48;
  }
  __break(1u);
}

void sub_25AF49B90(id *a1)
{
  id v1 = objc_msgSend(*a1, sel_remObjectID);
  id v2 = objc_msgSend(v1, sel_uuid);

  sub_25AF78F50();
}

void sub_25AF49C08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(void))
{
  if (!((unint64_t)a1 >> 62))
  {
    uint64_t v10 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v10) {
      goto LABEL_3;
    }
LABEL_32:
    if (qword_26A4D58E0 != -1) {
      swift_once();
    }
    uint64_t v65 = sub_25AF795B0();
    __swift_project_value_buffer(v65, (uint64_t)qword_26A4D5A30);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    v66 = sub_25AF795A0();
    os_log_type_t v67 = sub_25AF797D0();
    if (os_log_type_enabled(v66, v67))
    {
      uint64_t v68 = swift_slowAlloc();
      uint64_t v84 = swift_slowAlloc();
      uint64_t v90 = v84;
      *(_DWORD *)uint64_t v68 = 136315650;
      v89 = a6;
      uint64_t v69 = sub_25AF48D94(0, &qword_26A4D5978);
      uint64_t v70 = swift_bridgeObjectRetain();
      uint64_t v71 = MEMORY[0x26115A160](v70, v69);
      unint64_t v73 = v72;
      swift_bridgeObjectRelease();
      sub_25AF772F0(v71, v73, &v90);
      sub_25AF799C0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v68 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v74 = MEMORY[0x263F8D310];
      uint64_t v75 = MEMORY[0x26115A160](a3, MEMORY[0x263F8D310]);
      unint64_t v77 = v76;
      swift_bridgeObjectRelease();
      sub_25AF772F0(v75, v77, &v90);
      sub_25AF799C0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v68 + 22) = 2080;
      uint64_t v78 = swift_bridgeObjectRetain();
      uint64_t v79 = MEMORY[0x26115A160](v78, v74);
      unint64_t v81 = v80;
      swift_bridgeObjectRelease();
      sub_25AF772F0(v79, v81, &v90);
      a6 = v89;
      sub_25AF799C0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25AF45000, v66, v67, "No list shared with the specified .targetTaskListMembers {targetTaskListMembers: %s, emails: %s, phones: %s, result: .disambiguateDueToNoDefaultList}", (uint8_t *)v68, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x26115ACE0](v84, -1, -1);
      MEMORY[0x26115ACE0](v68, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    id v35 = sub_25AF4A900();
    goto LABEL_38;
  }
  if (a1 < 0) {
    unint64_t v6 = (void *)a1;
  }
  else {
    unint64_t v6 = (void *)(a1 & 0xFFFFFFFFFFFFFF8);
  }
  swift_bridgeObjectRetain();
  uint64_t v64 = sub_25AF79C10();
  swift_bridgeObjectRelease();
  if (!v64) {
    goto LABEL_32;
  }
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_25AF79C10();
  swift_bridgeObjectRelease();
LABEL_3:
  if (!v10)
  {
LABEL_21:
    if (qword_26A4D58E0 != -1) {
      swift_once();
    }
    uint64_t v40 = sub_25AF795B0();
    __swift_project_value_buffer(v40, (uint64_t)qword_26A4D5A30);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v41 = sub_25AF795A0();
    os_log_type_t v42 = sub_25AF797D0();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = swift_slowAlloc();
      os_log_t loga = (os_log_t)swift_slowAlloc();
      uint64_t v90 = (uint64_t)loga;
      *(_DWORD *)uint64_t v43 = 134219010;
      swift_bridgeObjectRelease();
      sub_25AF799C0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v43 + 12) = 2080;
      uint64_t v44 = sub_25AF48D94(0, &qword_26A4D5978);
      uint64_t v45 = swift_bridgeObjectRetain();
      uint64_t v46 = MEMORY[0x26115A160](v45, v44);
      os_log_type_t v83 = v42;
      unint64_t v48 = v47;
      swift_bridgeObjectRelease();
      sub_25AF772F0(v46, v48, &v90);
      sub_25AF799C0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v43 + 22) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v49 = MEMORY[0x263F8D310];
      uint64_t v50 = MEMORY[0x26115A160](a3, MEMORY[0x263F8D310]);
      unint64_t v52 = v51;
      swift_bridgeObjectRelease();
      sub_25AF772F0(v50, v52, &v90);
      sub_25AF799C0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v43 + 32) = 2080;
      uint64_t v53 = swift_bridgeObjectRetain();
      uint64_t v54 = MEMORY[0x26115A160](v53, v49);
      unint64_t v56 = v55;
      swift_bridgeObjectRelease();
      sub_25AF772F0(v54, v56, &v90);
      sub_25AF799C0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v43 + 42) = 2080;
      uint64_t v57 = sub_25AF48D94(0, &qword_26A4D5B48);
      uint64_t v58 = swift_bridgeObjectRetain();
      uint64_t v59 = MEMORY[0x26115A160](v58, v57);
      unint64_t v61 = v60;
      swift_bridgeObjectRelease();
      sub_25AF772F0(v59, v61, &v90);
      sub_25AF799C0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25AF45000, v41, v83, "Got %ld REMList matching .targetTaskListMembers {targetTaskListMembers: %s, emails: %s, phones: %s, result: .disambiguation(%s)}", (uint8_t *)v43, 0x34u);
      swift_arrayDestroy();
      MEMORY[0x26115ACE0](loga, -1, -1);
      MEMORY[0x26115ACE0](v43, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    sub_25AF48D94(0, &qword_26A4D5B38);
    ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
    sub_25AF48D94(0, &qword_26A4D5B48);
    v63 = (void *)sub_25AF796C0();
    swift_bridgeObjectRelease();
    id v35 = objc_msgSend(ObjCClassFromMetadata, sel_disambiguationWithTaskListsToDisambiguate_, v63);

    goto LABEL_38;
  }
  if (v10 == 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      MEMORY[0x26115A540](0, a1);
    }
    else
    {
      if (!*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        goto LABEL_41;
      }
      id v11 = *(id *)(a1 + 32);
    }
    sub_25AF48D94(0, &qword_26A4D5B48);
    unint64_t v6 = (void *)sub_25AF79760();
    if (qword_26A4D58E0 == -1)
    {
LABEL_9:
      uint64_t v12 = sub_25AF795B0();
      __swift_project_value_buffer(v12, (uint64_t)qword_26A4D5A30);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      id v13 = v6;
      uint64_t v14 = sub_25AF795A0();
      os_log_type_t v15 = sub_25AF797D0();
      if (os_log_type_enabled(v14, v15))
      {
        log = v14;
        uint64_t v16 = swift_slowAlloc();
        v82 = (void *)swift_slowAlloc();
        uint64_t v87 = swift_slowAlloc();
        uint64_t v90 = v87;
        *(_DWORD *)uint64_t v16 = 136315906;
        uint64_t v17 = sub_25AF48D94(0, &qword_26A4D5978);
        uint64_t v18 = swift_bridgeObjectRetain();
        uint64_t v19 = MEMORY[0x26115A160](v18, v17);
        id v20 = a6;
        unint64_t v22 = v21;
        swift_bridgeObjectRelease();
        sub_25AF772F0(v19, v22, &v90);
        sub_25AF799C0();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v16 + 12) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v23 = MEMORY[0x263F8D310];
        uint64_t v24 = MEMORY[0x26115A160](a3, MEMORY[0x263F8D310]);
        unint64_t v26 = v25;
        swift_bridgeObjectRelease();
        uint64_t v27 = v24;
        a6 = v20;
        sub_25AF772F0(v27, v26, &v90);
        sub_25AF799C0();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v16 + 22) = 2080;
        uint64_t v28 = swift_bridgeObjectRetain();
        uint64_t v29 = MEMORY[0x26115A160](v28, v23);
        unint64_t v31 = v30;
        swift_bridgeObjectRelease();
        sub_25AF772F0(v29, v31, &v90);
        sub_25AF799C0();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v16 + 32) = 2112;
        id v32 = v13;
        sub_25AF799C0();
        void *v82 = v13;

        _os_log_impl(&dword_25AF45000, log, v15, "Found exactly 1 list matching .targetTaskListMembers, using that. {targetTaskListMembers: %s, emails: %s, phones: %s, result: .success(%@)}", (uint8_t *)v16, 0x2Au);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5D80);
        swift_arrayDestroy();
        MEMORY[0x26115ACE0](v82, -1, -1);
        swift_arrayDestroy();
        MEMORY[0x26115ACE0](v87, -1, -1);
        MEMORY[0x26115ACE0](v16, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
      }
      sub_25AF48D94(0, &qword_26A4D5B38);
      id v35 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_successWithResolvedTaskList_, v13);

LABEL_38:
      a6(v35);

      return;
    }
LABEL_41:
    swift_once();
    goto LABEL_9;
  }
  uint64_t v90 = MEMORY[0x263F8EE78];
  sub_25AF79B10();
  if ((v10 & 0x8000000000000000) == 0)
  {
    v88 = a6;
    sub_25AF48D94(0, &qword_26A4D5B48);
    if ((a1 & 0xC000000000000001) != 0)
    {
      uint64_t v33 = 0;
      do
      {
        uint64_t v34 = v33 + 1;
        MEMORY[0x26115A540]();
        sub_25AF79760();
        sub_25AF79AF0();
        sub_25AF79B20();
        sub_25AF79B30();
        sub_25AF79B00();
        uint64_t v33 = v34;
      }
      while (v10 != v34);
    }
    else
    {
      v36 = (void **)(a1 + 32);
      uint64_t v37 = v10;
      do
      {
        id v38 = *v36++;
        id v39 = v38;
        sub_25AF79760();
        sub_25AF79AF0();
        sub_25AF79B20();
        sub_25AF79B30();
        sub_25AF79B00();
        --v37;
      }
      while (v37);
    }
    a6 = v88;
    goto LABEL_21;
  }
  __break(1u);
}

id sub_25AF4A900()
{
  v62[1] = *(id *)MEMORY[0x263EF8340];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5B30);
  uint64_t v1 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v3 = (char *)&v59 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v1);
  uint64_t v5 = (char *)&v59 - v4;
  unint64_t v6 = *(void **)(v0 + OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_store);
  v62[0] = 0;
  id v7 = objc_msgSend(v6, sel_fetchEligibleDefaultListsWithError_, v62);
  id v8 = v62[0];
  if (!v7)
  {
    id v22 = v62[0];
    id v23 = (id)sub_25AF78E60();

    swift_willThrow();
    goto LABEL_38;
  }
  uint64_t v9 = v7;
  id v60 = v6;
  sub_25AF48D94(0, (unint64_t *)&qword_26A4D5B40);
  unint64_t v10 = sub_25AF796D0();
  id v11 = v8;

  if (!(v10 >> 62))
  {
    unint64_t v12 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v12) {
      goto LABEL_4;
    }
LABEL_28:
    swift_bridgeObjectRelease();
    unint64_t v12 = MEMORY[0x263F8EE78];
    if (!(MEMORY[0x263F8EE78] >> 62)) {
      goto LABEL_11;
    }
    goto LABEL_29;
  }
  swift_bridgeObjectRetain();
  unint64_t v12 = sub_25AF79C10();
  swift_bridgeObjectRelease();
  if (!v12) {
    goto LABEL_28;
  }
LABEL_4:
  v62[0] = (id)MEMORY[0x263F8EE78];
  sub_25AF79B10();
  if ((v12 & 0x8000000000000000) == 0)
  {
    sub_25AF48D94(0, &qword_26A4D5B48);
    uint64_t v13 = 0;
    do
    {
      if ((v10 & 0xC000000000000001) != 0) {
        MEMORY[0x26115A540](v13, v10);
      }
      else {
        id v14 = *(id *)(v10 + 8 * v13 + 32);
      }
      ++v13;
      sub_25AF79760();
      sub_25AF79AF0();
      sub_25AF79B20();
      sub_25AF79B30();
      sub_25AF79B00();
    }
    while (v12 != v13);
    unint64_t v12 = (unint64_t)v62[0];
    swift_bridgeObjectRelease();
    if (!(v12 >> 62))
    {
LABEL_11:
      os_log_type_t v15 = *(void **)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v15) {
        goto LABEL_12;
      }
LABEL_31:
      swift_bridgeObjectRelease();
      sub_25AF79170();
      id v32 = (void *)sub_25AF79670();
      swift_bridgeObjectRelease();
      uint64_t v33 = sub_25AF78E40();
      uint64_t v34 = *(void *)(v33 - 8);
      id v35 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v34 + 56);
      v35(v5, 1, 1, v33);
      v35(v3, 1, 1, v33);
      sub_25AF48D94(0, &qword_26A4D5B50);
      v36 = (void *)sub_25AF796C0();
      uint64_t v37 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48);
      id v38 = 0;
      if (v37(v5, 1, v33) != 1)
      {
        id v38 = (void *)sub_25AF78DD0();
        (*(void (**)(char *, uint64_t))(v34 + 8))(v5, v33);
      }
      if (v37(v3, 1, v33) == 1)
      {
        id v39 = 0;
      }
      else
      {
        id v39 = (void *)sub_25AF78DD0();
        (*(void (**)(char *, uint64_t))(v34 + 8))(v3, v33);
      }
      uint64_t v5 = (char *)objc_msgSend(objc_allocWithZone(MEMORY[0x263F10038]), sel_initWithTitle_tasks_groupName_createdDateComponents_modifiedDateComponents_identifier_, v32, v36, 0, v38, v39, 0);

      v62[0] = 0;
      uint64_t v40 = (char *)objc_msgSend(v60, sel_fetchDefaultAccountWithError_, v62);
      uint64_t v3 = v40;
      if (!v62[0])
      {
        if (!v40)
        {
          if (qword_26A4D58E0 != -1) {
            swift_once();
          }
          uint64_t v55 = sub_25AF795B0();
          __swift_project_value_buffer(v55, (uint64_t)qword_26A4D5A30);
          unint64_t v56 = sub_25AF795A0();
          os_log_type_t v57 = sub_25AF797B0();
          if (os_log_type_enabled(v56, v57))
          {
            uint64_t v58 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v58 = 0;
            _os_log_impl(&dword_25AF45000, v56, v57, "No lists found in fetchEligibleDefaultLists and no default account available. Responding with .success so that we can fail the user in handle() with .failureRequiringAppLaunch. {result: .success}", v58, 2u);
            MEMORY[0x26115ACE0](v58, -1, -1);
          }

          sub_25AF48D94(0, &qword_26A4D5B38);
          id v30 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_successWithResolvedTaskList_, v5);

          return v30;
        }
        if (qword_26A4D58E0 == -1) {
          goto LABEL_47;
        }
        goto LABEL_60;
      }
      id v23 = v62[0];

      swift_willThrow();
LABEL_38:
      if (qword_26A4D58E0 != -1) {
        swift_once();
      }
      uint64_t v41 = sub_25AF795B0();
      __swift_project_value_buffer(v41, (uint64_t)qword_26A4D5A30);
      id v42 = v23;
      id v43 = v23;
      uint64_t v44 = sub_25AF795A0();
      os_log_type_t v45 = sub_25AF797B0();
      if (os_log_type_enabled(v44, v45))
      {
        uint64_t v46 = (uint8_t *)swift_slowAlloc();
        unint64_t v47 = (void *)swift_slowAlloc();
        v62[0] = v47;
        *(_DWORD *)uint64_t v46 = 136315138;
        swift_getErrorValue();
        uint64_t v48 = sub_25AF79CA0();
        uint64_t v61 = sub_25AF772F0(v48, v49, (uint64_t *)v62);
        sub_25AF799C0();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_25AF45000, v44, v45, "Error trying to retrieve eligible default lists {error: %s}", v46, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x26115ACE0](v47, -1, -1);
        MEMORY[0x26115ACE0](v46, -1, -1);
      }
      else
      {
      }
      sub_25AF48D94(0, &qword_26A4D5B38);
      id v21 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupported);

      return v21;
    }
LABEL_29:
    swift_bridgeObjectRetain();
    uint64_t v31 = sub_25AF79C10();
    swift_bridgeObjectRelease();
    if (v31)
    {
      swift_bridgeObjectRetain();
      os_log_type_t v15 = (void *)sub_25AF79C10();
      swift_bridgeObjectRelease();
LABEL_12:
      if (v15 != (void *)1)
      {
        if (qword_26A4D58E0 != -1) {
          swift_once();
        }
        uint64_t v24 = sub_25AF795B0();
        __swift_project_value_buffer(v24, (uint64_t)qword_26A4D5A30);
        swift_bridgeObjectRetain();
        unint64_t v25 = sub_25AF795A0();
        os_log_type_t v26 = sub_25AF797D0();
        if (os_log_type_enabled(v25, v26))
        {
          uint64_t v27 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)uint64_t v27 = 134217984;
          v62[0] = v15;
          sub_25AF799C0();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_25AF45000, v25, v26, "Disambiguating with some lists {count: %ld}", v27, 0xCu);
          MEMORY[0x26115ACE0](v27, -1, -1);
        }
        else
        {

          swift_bridgeObjectRelease();
        }
        sub_25AF48D94(0, &qword_26A4D5B38);
        ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
        sub_25AF48D94(0, &qword_26A4D5B48);
        uint64_t v29 = (void *)sub_25AF796C0();
        swift_bridgeObjectRelease();
        id v30 = objc_msgSend(ObjCClassFromMetadata, sel_disambiguationWithTaskListsToDisambiguate_, v29);

        return v30;
      }
      if (qword_26A4D58E0 == -1) {
        goto LABEL_14;
      }
      goto LABEL_57;
    }
    goto LABEL_31;
  }
  __break(1u);
LABEL_57:
  swift_once();
LABEL_14:
  uint64_t v16 = sub_25AF795B0();
  __swift_project_value_buffer(v16, (uint64_t)qword_26A4D5A30);
  uint64_t v17 = sub_25AF795A0();
  os_log_type_t v18 = sub_25AF797D0();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v3 = (char *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_25AF45000, v17, v18, "Got exactly 1 list from fetchEligibleDefaultLists, using that. {result: .confirmationRequired}", (uint8_t *)v3, 2u);
    MEMORY[0x26115ACE0](v3, -1, -1);
  }

  if ((v12 & 0xC000000000000001) != 0)
  {
    id v19 = (id)MEMORY[0x26115A540](0, v12);
    goto LABEL_19;
  }
  if (*(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v19 = *(id *)(v12 + 32);
LABEL_19:
    id v20 = v19;
    swift_bridgeObjectRelease();
    sub_25AF48D94(0, &qword_26A4D5B38);
    id v21 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_confirmationRequiredWithTaskListToConfirm_, v20);

    return v21;
  }
  __break(1u);
LABEL_60:
  swift_once();
LABEL_47:
  uint64_t v51 = sub_25AF795B0();
  __swift_project_value_buffer(v51, (uint64_t)qword_26A4D5A30);
  unint64_t v52 = sub_25AF795A0();
  os_log_type_t v53 = sub_25AF797D0();
  if (os_log_type_enabled(v52, v53))
  {
    uint64_t v54 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v54 = 0;
    _os_log_impl(&dword_25AF45000, v52, v53, "No lists found in fetchEligibleDefaultLists(), prompt for creation {result: .confirmationRequired(.listShouldBeCreated)}", v54, 2u);
    MEMORY[0x26115ACE0](v54, -1, -1);
  }

  id v30 = objc_msgSend(self, sel_confirmationRequiredWithTaskListToConfirm_forReason_, v5, 1);
  return v30;
}

void sub_25AF4B450(void *a1, uint64_t a2, uint64_t a3)
{
  if (qword_26A4D58E0 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_25AF795B0();
  __swift_project_value_buffer(v6, (uint64_t)qword_26A4D5A30);
  id v7 = a1;
  id v8 = sub_25AF795A0();
  os_log_type_t v9 = sub_25AF797D0();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v23 = a2;
    uint64_t v24 = a3;
    unint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v25 = v11;
    *(_DWORD *)unint64_t v10 = 136315138;
    id v12 = objc_msgSend(v7, sel_taskTitles);
    if (v12)
    {
      uint64_t v13 = v12;
      sub_25AF48D94(0, (unint64_t *)&unk_26A4D5B10);
      sub_25AF796D0();
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5B08);
    uint64_t v15 = sub_25AF799B0();
    unint64_t v17 = v16;
    swift_bridgeObjectRelease();
    sub_25AF772F0(v15, v17, &v25);
    sub_25AF799C0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25AF45000, v8, v9, "SiriKit asked for resolving task titles {taskTitles: %s}", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x26115ACE0](v11, -1, -1);
    MEMORY[0x26115ACE0](v10, -1, -1);

    a2 = v23;
    a3 = v24;
  }
  else
  {
  }
  MEMORY[0x270FA5388](v14);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5AF0);
  swift_allocObject();
  sub_25AF79570();
  os_log_type_t v18 = (void *)sub_25AF79500();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5AF8);
  sub_25AF79540();
  swift_release();

  *(void *)(swift_allocObject() + 16) = v7;
  id v19 = v7;
  id v20 = (void *)sub_25AF79500();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5B00);
  sub_25AF79540();
  swift_release();
  swift_release();

  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = a2;
  *(void *)(v21 + 24) = a3;
  swift_retain();
  id v22 = (void *)sub_25AF79500();
  sub_25AF79540();
  swift_release();
  swift_release();
  swift_release();
}

uint64_t sub_25AF4B81C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5B28);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  id v7 = (uint64_t *)((char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v5);
  os_log_type_t v9 = (char *)&v14 - v8;
  if (*a1)
  {
    sub_25AF797F0();
    uint64_t v10 = sub_25AF797E0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 0, 1, v10);
  }
  else
  {
    uint64_t v10 = sub_25AF797E0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  }
  sub_25AF54B6C((uint64_t)v9, (uint64_t)v7, &qword_26A4D5B28);
  sub_25AF797E0();
  if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48))(v7, 1, v10) == 1)
  {
    uint64_t result = sub_25AF54EBC((uint64_t)v7, &qword_26A4D5B28);
    uint64_t v12 = 0;
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v12 = *v7;
    uint64_t v13 = v7[1];
    swift_bridgeObjectRetain();
    uint64_t result = sub_25AF54FE0((uint64_t)v7, MEMORY[0x263F63530]);
  }
  *a2 = v12;
  a2[1] = v13;
  return result;
}

uint64_t sub_25AF4B9E8@<X0>(id a1@<X1>, uint64_t *a2@<X0>, uint64_t *a3@<X8>)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  id v6 = objc_msgSend(a1, sel_taskTitles);
  id v7 = (uint64_t *)MEMORY[0x263F8EE78];
  id v43 = a3;
  if (!v6)
  {
    a3 = (uint64_t *)MEMORY[0x263F8EE78];
    if (!v5) {
      goto LABEL_22;
    }
    goto LABEL_15;
  }
  uint64_t v8 = v6;
  sub_25AF48D94(0, (unint64_t *)&unk_26A4D5B10);
  unint64_t v9 = sub_25AF796D0();

  if (!(v9 >> 62))
  {
    uint64_t v10 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v10) {
      goto LABEL_4;
    }
LABEL_21:
    swift_bridgeObjectRelease();
    a3 = (uint64_t *)MEMORY[0x263F8EE78];
    if (!v5) {
      goto LABEL_22;
    }
    goto LABEL_15;
  }
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_25AF79C10();
  swift_bridgeObjectRelease();
  if (!v10) {
    goto LABEL_21;
  }
LABEL_4:
  sub_25AF72C9C(0, v10 & ~(v10 >> 63), 0);
  if (v10 < 0)
  {
    __break(1u);
    goto LABEL_39;
  }
  uint64_t v41 = v5;
  uint64_t v42 = v4;
  uint64_t v11 = 0;
  a3 = v7;
  unint64_t v44 = v9 & 0xC000000000000001;
  unint64_t v12 = v9;
  uint64_t v13 = v10;
  do
  {
    if (v44) {
      id v14 = (id)MEMORY[0x26115A540](v11, v9);
    }
    else {
      id v14 = *(id *)(v9 + 8 * v11 + 32);
    }
    uint64_t v15 = v14;
    id v16 = objc_msgSend(v14, sel_spokenPhrase);
    uint64_t v17 = sub_25AF79640();
    uint64_t v19 = v18;

    unint64_t v21 = a3[2];
    unint64_t v20 = a3[3];
    if (v21 >= v20 >> 1) {
      sub_25AF72C9C(v20 > 1, v21 + 1, 1);
    }
    ++v11;
    a3[2] = v21 + 1;
    id v22 = &a3[2 * v21];
    v22[4] = v17;
    v22[5] = v19;
    unint64_t v9 = v12;
  }
  while (v13 != v11);
  swift_bridgeObjectRelease();
  id v7 = (uint64_t *)MEMORY[0x263F8EE78];
  uint64_t v5 = v41;
  uint64_t v4 = v42;
  if (v41)
  {
LABEL_15:
    if (a3[2])
    {
LABEL_23:
      if (qword_26A4D58E0 != -1) {
        swift_once();
      }
      uint64_t v26 = sub_25AF795B0();
      __swift_project_value_buffer(v26, (uint64_t)qword_26A4D5A30);
      uint64_t v27 = sub_25AF795A0();
      os_log_type_t v28 = sub_25AF797D0();
      if (os_log_type_enabled(v27, v28))
      {
        uint64_t v29 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v29 = 0;
        _os_log_impl(&dword_25AF45000, v27, v28, "Resolved taskTitles {result: .success}", v29, 2u);
        MEMORY[0x26115ACE0](v29, -1, -1);
      }

      uint64_t v30 = a3[2];
      if (v30)
      {
        uint64_t v45 = (uint64_t)v7;
        swift_bridgeObjectRetain();
        sub_25AF79B10();
        uint64_t v31 = self;
        id v32 = a3 + 5;
        do
        {
          swift_bridgeObjectRetain();
          uint64_t v33 = (void *)sub_25AF79670();
          id v34 = objc_msgSend(v31, sel_successWithResolvedString_, v33);
          swift_bridgeObjectRelease();

          sub_25AF79AF0();
          sub_25AF79B20();
          sub_25AF79B30();
          sub_25AF79B00();
          v32 += 2;
          --v30;
        }
        while (v30);
        uint64_t v35 = v45;
        uint64_t result = swift_bridgeObjectRelease_n();
      }
      else
      {
        uint64_t result = swift_bridgeObjectRelease();
        uint64_t v35 = MEMORY[0x263F8EE78];
      }
      goto LABEL_37;
    }
    swift_bridgeObjectRetain();
    if (swift_isUniquelyReferenced_nonNull_native())
    {
LABEL_17:
      unint64_t v24 = a3[2];
      unint64_t v23 = a3[3];
      if (v24 >= v23 >> 1) {
        a3 = sub_25AF76F3C((void *)(v23 > 1), v24 + 1, 1, a3);
      }
      a3[2] = v24 + 1;
      uint64_t v25 = &a3[2 * v24];
      v25[4] = v4;
      v25[5] = v5;
      goto LABEL_23;
    }
LABEL_39:
    a3 = sub_25AF76F3C(0, 1, 1, a3);
    goto LABEL_17;
  }
LABEL_22:
  if (a3[2]) {
    goto LABEL_23;
  }
  swift_bridgeObjectRelease();
  if (qword_26A4D58E0 != -1) {
    swift_once();
  }
  uint64_t v37 = sub_25AF795B0();
  __swift_project_value_buffer(v37, (uint64_t)qword_26A4D5A30);
  id v38 = sub_25AF795A0();
  os_log_type_t v39 = sub_25AF797D0();
  if (os_log_type_enabled(v38, v39))
  {
    uint64_t v40 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v40 = 0;
    _os_log_impl(&dword_25AF45000, v38, v39, "userTitles has 0 elements {result: .needsValue}", v40, 2u);
    MEMORY[0x26115ACE0](v40, -1, -1);
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5980);
  uint64_t v35 = swift_allocObject();
  *(_OWORD *)(v35 + 16) = xmmword_25AF7A510;
  sub_25AF48D94(0, &qword_26A4D5B20);
  *(void *)(v35 + 32) = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_needsValue);
  uint64_t result = sub_25AF796F0();
LABEL_37:
  *id v43 = v35;
  return result;
}

void sub_25AF4BFEC(uint64_t a1, uint64_t a2)
{
  sub_25AF48D94(0, &qword_26A4D5B20);
  id v3 = (id)sub_25AF796C0();
  (*(void (**)(uint64_t, id))(a2 + 16))(a2, v3);
}

id sub_25AF4C098(void *a1)
{
  uint64_t v2 = v1;
  id v3 = objc_msgSend(a1, sel_targetTaskList);
  if (!v3 || (v4 = v3, uint64_t v5 = (void *)sub_25AF79730(), v4, !v5))
  {
    id v6 = sub_25AF4F524(*(void **)(v2 + OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_store));
    if (!v6) {
      return 0;
    }
LABEL_6:
    id v7 = objc_msgSend(v6, sel_capabilities);

    return v7;
  }
  id v6 = objc_msgSend(v5, sel_account);

  if (v6) {
    goto LABEL_6;
  }
  return 0;
}

void sub_25AF4C160(void *a1, void (*a2)(void))
{
  if (*a1)
  {
    if (qword_26A4D58E0 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_25AF795B0();
    __swift_project_value_buffer(v3, (uint64_t)qword_26A4D5A30);
    uint64_t v4 = sub_25AF795A0();
    os_log_type_t v5 = sub_25AF797D0();
    if (os_log_type_enabled(v4, v5))
    {
      id v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_25AF45000, v4, v5, "Got userActivity {result: .success(.currentActivity)", v6, 2u);
      MEMORY[0x26115ACE0](v6, -1, -1);
    }

    id v7 = objc_msgSend(self, sel_successWithResolvedTaskReference_, 1);
  }
  else
  {
    if (qword_26A4D58E0 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_25AF795B0();
    __swift_project_value_buffer(v8, (uint64_t)qword_26A4D5A30);
    unint64_t v9 = sub_25AF795A0();
    os_log_type_t v10 = sub_25AF797D0();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_25AF45000, v9, v10, "Got nil userActivity {result: .notRequired}", v11, 2u);
      MEMORY[0x26115ACE0](v11, -1, -1);
    }

    sub_25AF48D94(0, &qword_26A4D5BE8);
    id v7 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_notRequired);
  }
  id v12 = v7;
  a2();
}

void sub_25AF4C364(void *a1, void (*a2)(id))
{
  if (qword_26A4D58E0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25AF795B0();
  __swift_project_value_buffer(v4, (uint64_t)qword_26A4D5A30);
  id v5 = a1;
  id v6 = a1;
  id v7 = sub_25AF795A0();
  os_log_type_t v8 = sub_25AF797B0();
  if (os_log_type_enabled(v7, v8))
  {
    unint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v14 = v10;
    *(_DWORD *)unint64_t v9 = 136315138;
    swift_getErrorValue();
    uint64_t v11 = sub_25AF79CA0();
    sub_25AF772F0(v11, v12, &v14);
    sub_25AF799C0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_25AF45000, v7, v8, "Got error userActivity. {result: .notRequired, error: %s}", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x26115ACE0](v10, -1, -1);
    MEMORY[0x26115ACE0](v9, -1, -1);
  }
  else
  {
  }
  sub_25AF48D94(0, &qword_26A4D5BE8);
  id v13 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_notRequired);
  a2(v13);
}

void sub_25AF4C5AC(void *a1, int a2, void *a3, void *aBlock, void (*a5)(id, void *))
{
  os_log_type_t v8 = _Block_copy(aBlock);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a1;
  a5(v9, v8);
  _Block_release(v8);
  _Block_release(v8);
}

void sub_25AF4C654(void **a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  if (*a1)
  {
    swift_beginAccess();
    uint64_t v4 = *(void **)(a2 + 16);
    *(void *)(a2 + 16) = v2;
    id v5 = v2;
  }
}

uint64_t sub_25AF4C6B8(void **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = sub_25AF797E0();
  MEMORY[0x270FA5388](v7 - 8);
  id v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5B80);
  MEMORY[0x270FA5388](v10 - 8);
  unint64_t v12 = (char *)v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = *a1;
  uint64_t result = swift_projectBox();
  if (v13)
  {
    uint64_t v15 = result;
    v26[11] = a4 + 16;
    id v16 = objc_allocWithZone(MEMORY[0x263F62FA0]);
    id v17 = v13;
    id v18 = objc_msgSend(v16, sel_initWithUserActivity_, v17);
    swift_beginAccess();
    uint64_t v19 = *(void **)(a2 + 16);
    *(void *)(a2 + 16) = v18;

    id v20 = objc_msgSend(v17, sel_webpageURL);
    if (v20)
    {
      unint64_t v21 = v20;
      sub_25AF78E80();

      uint64_t v22 = sub_25AF78E90();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v12, 0, 1, v22);
    }
    else
    {
      uint64_t v23 = sub_25AF78E90();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v12, 1, 1, v23);
    }
    swift_beginAccess();
    sub_25AF55040((uint64_t)v12, v15);
    sub_25AF797F0();

    uint64_t v25 = *((void *)v9 + 2);
    uint64_t v24 = *((void *)v9 + 3);
    swift_bridgeObjectRetain();
    sub_25AF54FE0((uint64_t)v9, MEMORY[0x263F63530]);
    swift_beginAccess();
    *(void *)(a4 + 16) = v25;
    *(void *)(a4 + 24) = v24;
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_25AF4C924(uint64_t a1, uint64_t a2, void *a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void (*a16)(void))
{
  v80[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v62 = swift_projectBox();
  uint64_t v18 = swift_projectBox();
  id v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F62F38]), sel_initWithStore_, *(void *)(a2 + OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_store));
  sub_25AF79040();
  a3;
  id v20 = v19;
  sub_25AF79090();
  id v68 = v80[0];
  uint64_t v69 = 0;
  uint64_t v70 = a5;
  uint64_t v71 = a6;
  uint64_t v72 = v62;
  uint64_t v73 = a8;
  uint64_t v74 = a9 + 16;
  uint64_t v75 = a10 + 16;
  uint64_t v76 = v18;
  uint64_t v77 = a12 + 16;
  uint64_t v78 = a13 + 16;
  uint64_t v79 = a14;
  unint64_t v21 = v20;
  unint64_t v22 = sub_25AF736D8((void (*)(uint64_t *__return_ptr, id *))sub_25AF54DC8, (uint64_t)v67, a4);
  v80[0] = 0;
  if (objc_msgSend(v21, sel_saveSynchronouslyWithError_, v80))
  {
    id v23 = v80[0];
    sub_25AF79060();
    swift_retain();
    sub_25AF79050();
    swift_release();
    if (v22 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v24 = sub_25AF79C10();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v24 = *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v61 = v21;
    if (v24)
    {
      v80[0] = (id)MEMORY[0x263F8EE78];
      sub_25AF79B10();
      if (v24 < 0) {
        __break(1u);
      }
      sub_25AF48D94(0, &qword_26A4D5B50);
      uint64_t v25 = 0;
      do
      {
        if ((v22 & 0xC000000000000001) != 0) {
          MEMORY[0x26115A540](v25, v22);
        }
        else {
          id v26 = *(id *)(v22 + 8 * v25 + 32);
        }
        ++v25;
        sub_25AF798E0();
        sub_25AF79AF0();
        sub_25AF79B20();
        sub_25AF79B30();
        sub_25AF79B00();
      }
      while (v24 != v25);
    }
    swift_bridgeObjectRelease();
    uint64_t v39 = a15;
    if (qword_26A4D58E0 != -1) {
      swift_once();
    }
    uint64_t v40 = sub_25AF795B0();
    __swift_project_value_buffer(v40, (uint64_t)qword_26A4D5A30);
    swift_bridgeObjectRetain_n();
    uint64_t v41 = sub_25AF795A0();
    os_log_type_t v42 = sub_25AF797D0();
    if (os_log_type_enabled(v41, v42))
    {
      id v43 = (uint8_t *)swift_slowAlloc();
      unint64_t v44 = (void *)swift_slowAlloc();
      v80[0] = v44;
      *(_DWORD *)id v43 = 136315138;
      uint64_t v45 = sub_25AF48D94(0, &qword_26A4D5B50);
      uint64_t v46 = swift_bridgeObjectRetain();
      uint64_t v47 = MEMORY[0x26115A160](v46, v45);
      unint64_t v49 = v48;
      swift_bridgeObjectRelease();
      uint64_t v50 = v47;
      uint64_t v39 = a15;
      sub_25AF772F0(v50, v49, (uint64_t *)v80);
      sub_25AF799C0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25AF45000, v41, v42, "insertedTasks: %s", v43, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x26115ACE0](v44, -1, -1);
      MEMORY[0x26115ACE0](v43, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    id v51 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0F968]), sel_initWithCode_userActivity_, 3, 0);
    objc_msgSend(v51, sel_setModifiedTaskList_, v39);
    sub_25AF48D94(0, &qword_26A4D5B50);
    unint64_t v52 = (void *)sub_25AF796C0();
    swift_bridgeObjectRelease();
    objc_msgSend(v51, sel_setAddedTasks_, v52);

    v80[0] = a14;
    os_log_type_t v53 = (void *)sub_25AF79930();
    sub_25AF48D94(0, (unint64_t *)&unk_26A4D5B70);
    uint64_t v54 = sub_25AF79230();

    objc_msgSend(v51, sel_setWarnings_, v54);
    uint64_t v55 = v51;
    unint64_t v56 = sub_25AF795A0();
    os_log_type_t v57 = sub_25AF797D0();
    if (os_log_type_enabled(v56, v57))
    {
      uint64_t v58 = (uint8_t *)swift_slowAlloc();
      uint64_t v59 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v58 = 138412290;
      v80[0] = v55;
      id v60 = v55;
      sub_25AF799C0();
      *uint64_t v59 = v55;

      _os_log_impl(&dword_25AF45000, v56, v57, "successfully handled intent {result: %@}", v58, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5D80);
      swift_arrayDestroy();
      MEMORY[0x26115ACE0](v59, -1, -1);
      MEMORY[0x26115ACE0](v58, -1, -1);
    }
    else
    {

      unint64_t v56 = v55;
    }

    ((void (*))a16)(v55);
    swift_release();
  }
  else
  {
    id v27 = v80[0];
    swift_bridgeObjectRelease();
    os_log_type_t v28 = (void *)sub_25AF78E60();

    swift_willThrow();
    if (qword_26A4D58E0 != -1) {
      swift_once();
    }
    uint64_t v29 = sub_25AF795B0();
    __swift_project_value_buffer(v29, (uint64_t)qword_26A4D5A30);
    id v30 = v28;
    id v31 = v28;
    id v32 = sub_25AF795A0();
    os_log_type_t v33 = sub_25AF797B0();
    if (os_log_type_enabled(v32, v33))
    {
      id v34 = (uint8_t *)swift_slowAlloc();
      uint64_t v35 = (void *)swift_slowAlloc();
      v80[0] = v35;
      *(_DWORD *)id v34 = 136446210;
      swift_getErrorValue();
      uint64_t v36 = sub_25AF79CB0();
      sub_25AF772F0(v36, v37, (uint64_t *)v80);
      sub_25AF799C0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_25AF45000, v32, v33, "Error saving saveRequest {error: %{public}s}", v34, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x26115ACE0](v35, -1, -1);
      MEMORY[0x26115ACE0](v34, -1, -1);
    }
    else
    {
    }
    id v38 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0F968]), sel_initWithCode_userActivity_, 4, 0);
    a16();

    swift_release();
  }
}

void sub_25AF4D1E4(void **a1@<X0>, void *a2@<X2>, void *a3@<X3>, void *a4@<X4>, void (*a5)(char *, char *, uint64_t)@<X5>, uint64_t a6@<X6>, NSObject *a7@<X7>, void *a8@<X8>, void **a9, void *a10, void *a11, id *a12, id a13)
{
  os_log_t v193 = a7;
  uint64_t v179 = a6;
  v191 = a5;
  id v200 = a4;
  v197 = a8;
  uint64_t v16 = sub_25AF795B0();
  uint64_t v172 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  v173 = (char *)&v172 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v186 = sub_25AF78F20();
  uint64_t v185 = *(void *)(v186 - 8);
  MEMORY[0x270FA5388](v186);
  v184 = (char *)&v172 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5B80);
  MEMORY[0x270FA5388](v19 - 8);
  v182 = (char *)&v172 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  v201 = (id *)((char *)&v172 - v22);
  uint64_t v196 = sub_25AF78E90();
  uint64_t v195 = *(void *)(v196 - 8);
  MEMORY[0x270FA5388](v196);
  v181 = (char *)&v172 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v24);
  v194 = (char *)&v172 - v25;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5B58);
  MEMORY[0x270FA5388](v26 - 8);
  uint64_t v178 = (uint64_t)&v172 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v189 = sub_25AF791C0();
  uint64_t v187 = *(void *)(v189 - 8);
  MEMORY[0x270FA5388](v189);
  uint64_t v174 = (uint64_t)&v172 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v29);
  uint64_t v175 = (uint64_t)&v172 - v30;
  MEMORY[0x270FA5388](v31);
  uint64_t v180 = (uint64_t)&v172 - v32;
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5B30);
  MEMORY[0x270FA5388](v33 - 8);
  v177 = (char *)&v172 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v35);
  uint64_t v190 = (uint64_t)&v172 - v36;
  uint64_t v37 = sub_25AF78E40();
  id v38 = *(void **)(v37 - 8);
  MEMORY[0x270FA5388](v37);
  v176 = (char *)&v172 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v40);
  v192 = (char *)&v172 - v41;
  os_log_type_t v42 = *a1;
  id v43 = (void *)sub_25AF79030();
  sub_25AF79160();
  sub_25AF54E10(&qword_26A4D5BB8, MEMORY[0x263F634B0]);
  id v44 = v43;
  id v45 = a2;
  id v198 = v44;
  uint64_t v46 = a3;
  sub_25AF79180();
  uint64_t v47 = v208;
  id v48 = objc_msgSend(v42, sel_spokenPhrase);
  sub_25AF79640();

  id v49 = objc_allocWithZone(MEMORY[0x263F086A0]);
  uint64_t v50 = (void *)sub_25AF79610();
  swift_bridgeObjectRelease();
  id v51 = objc_msgSend(v49, sel_initWithString_, v50);

  sub_25AF79120();
  unint64_t v52 = 0x26A4D5000uLL;
  v202 = v47;
  uint64_t v203 = v16;
  v199 = v38;
  if (v46)
  {
    uint64_t v53 = qword_26A4D58E0;
    id v54 = v46;
    if (v53 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v16, (uint64_t)qword_26A4D5A30);
    uint64_t v55 = v54;
    unint64_t v56 = sub_25AF795A0();
    os_log_type_t v57 = sub_25AF797D0();
    if (os_log_type_enabled(v56, v57))
    {
      uint64_t v188 = v37;
      uint64_t v58 = (uint8_t *)swift_slowAlloc();
      uint64_t v59 = (void *)swift_slowAlloc();
      uint64_t v183 = (uint64_t)v46;
      *(_DWORD *)uint64_t v58 = 138412290;
      v208 = v55;
      id v60 = v55;
      uint64_t v37 = v188;
      uint64_t v46 = (void *)v183;
      sub_25AF799C0();
      *uint64_t v59 = v46;

      uint64_t v16 = v203;
      _os_log_impl(&dword_25AF45000, v56, v57, "setting locationTrigger {locationTrigger: %@}", v58, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5D80);
      swift_arrayDestroy();
      uint64_t v61 = v59;
      unint64_t v52 = 0x26A4D5000;
      MEMORY[0x26115ACE0](v61, -1, -1);
      uint64_t v62 = v58;
      id v38 = v199;
      MEMORY[0x26115ACE0](v62, -1, -1);
    }
    else
    {

      unint64_t v56 = v55;
    }

    v63 = v55;
    MEMORY[0x261159B50](v46);
  }
  id v64 = v200;
  if (v200)
  {
    uint64_t v65 = *(void *)(v52 + 2272);
    id v66 = v200;
    if (v65 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v16, (uint64_t)qword_26A4D5A30);
    os_log_type_t v67 = v66;
    id v68 = sub_25AF795A0();
    os_log_type_t v69 = sub_25AF797D0();
    if (os_log_type_enabled(v68, v69))
    {
      uint64_t v70 = (uint8_t *)swift_slowAlloc();
      uint64_t v71 = (void *)swift_slowAlloc();
      uint64_t v188 = v37;
      *(_DWORD *)uint64_t v70 = 138412290;
      v208 = v67;
      uint64_t v72 = v67;
      unint64_t v52 = 0x26A4D5000;
      uint64_t v16 = v203;
      uint64_t v37 = v188;
      sub_25AF799C0();
      void *v71 = v200;

      _os_log_impl(&dword_25AF45000, v68, v69, "setting vehicleTrigger {vehicleTrigger: %@}", v70, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5D80);
      swift_arrayDestroy();
      uint64_t v73 = v71;
      id v38 = v199;
      MEMORY[0x26115ACE0](v73, -1, -1);
      uint64_t v74 = v70;
      id v64 = v200;
      MEMORY[0x26115ACE0](v74, -1, -1);
    }
    else
    {

      id v68 = v67;
    }

    uint64_t v75 = v67;
    MEMORY[0x261159B40](v64);
  }
  uint64_t v76 = a9;
  uint64_t v77 = (uint64_t)v191;
  swift_beginAccess();
  uint64_t v78 = v190;
  sub_25AF54E58(v77, v190, &qword_26A4D5B30);
  if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v38[6])(v78, 1, v37) == 1)
  {
    sub_25AF54EBC(v78, &qword_26A4D5B30);
    uint64_t v79 = (uint64_t)v201;
  }
  else
  {
    unint64_t v80 = v192;
    ((void (*)(char *, uint64_t, uint64_t))v38[4])(v192, v78, v37);
    if (*(void *)(v52 + 2272) != -1) {
      swift_once();
    }
    uint64_t v81 = __swift_project_value_buffer(v16, (uint64_t)qword_26A4D5A30);
    v82 = v176;
    v191 = (void (*)(char *, char *, uint64_t))v38[2];
    v191(v176, v80, v37);
    uint64_t v190 = v81;
    os_log_type_t v83 = sub_25AF795A0();
    os_log_type_t v84 = sub_25AF797D0();
    BOOL v85 = os_log_type_enabled(v83, v84);
    uint64_t v183 = (uint64_t)a9;
    if (v85)
    {
      v86 = (uint8_t *)swift_slowAlloc();
      uint64_t v87 = swift_slowAlloc();
      uint64_t v207 = v87;
      *(_DWORD *)v86 = 136315138;
      id v200 = v86 + 4;
      sub_25AF54E10(&qword_26A4D5BC8, MEMORY[0x263F063B0]);
      uint64_t v88 = sub_25AF79C50();
      uint64_t v206 = sub_25AF772F0(v88, v89, &v207);
      unint64_t v80 = v192;
      sub_25AF799C0();
      swift_bridgeObjectRelease();
      id v200 = (id)v199[1];
      ((void (*)(char *, uint64_t))v200)(v82, v37);
      _os_log_impl(&dword_25AF45000, v83, v84, "setting dueDateComponents {dueDateComponents: %s}", v86, 0xCu);
      swift_arrayDestroy();
      uint64_t v90 = v87;
      id v38 = v199;
      MEMORY[0x26115ACE0](v90, -1, -1);
      uint64_t v16 = v203;
      MEMORY[0x26115ACE0](v86, -1, -1);
    }
    else
    {
      id v200 = (id)v38[1];
      ((void (*)(char *, uint64_t))v200)(v82, v37);

      uint64_t v16 = v203;
    }
    uint64_t v91 = (uint64_t)v177;
    v191(v177, v80, v37);
    ((void (*)(uint64_t, void, uint64_t, uint64_t))v38[7])(v91, 0, 1, v37);
    sub_25AF790F0();
    sub_25AF54EBC(v91, &qword_26A4D5B30);
    uint64_t v92 = v178;
    sub_25AF54E58(v179, v178, &qword_26A4D5B58);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v187 + 48))(v92, 1, v189) == 1)
    {
      ((void (*)(char *, uint64_t))v200)(v80, v37);
      sub_25AF54EBC(v92, &qword_26A4D5B58);
      unint64_t v52 = 0x26A4D5000;
    }
    else
    {
      uint64_t v188 = v37;
      uint64_t v93 = v180;
      sub_25AF54F18(v92, v180);
      uint64_t v94 = v175;
      sub_25AF54F7C(v93, v175);
      v95 = sub_25AF795A0();
      os_log_type_t v96 = sub_25AF797D0();
      unint64_t v52 = 0x26A4D5000uLL;
      if (os_log_type_enabled(v95, v96))
      {
        v97 = (uint8_t *)swift_slowAlloc();
        uint64_t v98 = swift_slowAlloc();
        uint64_t v207 = v98;
        *(_DWORD *)v97 = 136315138;
        v191 = (void (*)(char *, char *, uint64_t))(v97 + 4);
        sub_25AF54F7C(v94, v174);
        uint64_t v99 = sub_25AF79650();
        uint64_t v206 = sub_25AF772F0(v99, v100, &v207);
        sub_25AF799C0();
        uint64_t v16 = v203;
        swift_bridgeObjectRelease();
        sub_25AF54FE0(v94, MEMORY[0x263F634E0]);
        _os_log_impl(&dword_25AF45000, v95, v96, "setting recurrenceRule {recurrenceRule: %s}", v97, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x26115ACE0](v98, -1, -1);
        MEMORY[0x26115ACE0](v97, -1, -1);
      }
      else
      {
        sub_25AF54FE0(v94, MEMORY[0x263F634E0]);
      }

      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5BC0);
      unint64_t v101 = (*(unsigned __int8 *)(v187 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v187 + 80);
      uint64_t v102 = swift_allocObject();
      *(_OWORD *)(v102 + 16) = xmmword_25AF7A830;
      uint64_t v103 = v180;
      sub_25AF54F7C(v180, v102 + v101);
      sub_25AF790E0();
      swift_setDeallocating();
      swift_arrayDestroy();
      swift_deallocClassInstance();
      sub_25AF54FE0(v103, MEMORY[0x263F634E0]);
      ((void (*)(char *, uint64_t))v200)(v192, v188);
    }
    uint64_t v79 = (uint64_t)v201;
    uint64_t v76 = (void **)v183;
  }
  id v200 = a10;
  os_log_t v104 = v193;
  swift_beginAccess();
  Class isa = v104->isa;
  if (isa)
  {
    uint64_t v106 = *(void *)(v52 + 2272);
    v107 = isa;
    if (v106 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v16, (uint64_t)qword_26A4D5A30);
    v108 = v107;
    v109 = sub_25AF795A0();
    os_log_type_t v110 = sub_25AF797D0();
    if (os_log_type_enabled(v109, v110))
    {
      uint64_t v183 = (uint64_t)v76;
      v111 = (uint8_t *)swift_slowAlloc();
      v199 = (void *)swift_slowAlloc();
      *(_DWORD *)v111 = 138412290;
      uint64_t v206 = (uint64_t)v108;
      v112 = v108;
      uint64_t v76 = (void **)v183;
      unint64_t v52 = 0x26A4D5000;
      sub_25AF799C0();
      v113 = v199;
      void *v199 = isa;

      uint64_t v16 = v203;
      _os_log_impl(&dword_25AF45000, v109, v110, "setting contactRepresentation {contactRepresentation: %@}", v111, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5D80);
      swift_arrayDestroy();
      MEMORY[0x26115ACE0](v113, -1, -1);
      MEMORY[0x26115ACE0](v111, -1, -1);
    }
    else
    {

      v109 = v108;
    }

    v114 = v108;
    sub_25AF790B0();

    uint64_t v79 = (uint64_t)v201;
  }
  uint64_t v115 = (uint64_t)a11;
  swift_beginAccess();
  v116 = *v76;
  if (*v76)
  {
    uint64_t v117 = *(void *)(v52 + 2272);
    id v118 = v116;
    if (v117 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v16, (uint64_t)qword_26A4D5A30);
    v119 = v118;
    v120 = sub_25AF795A0();
    os_log_type_t v121 = sub_25AF797D0();
    if (os_log_type_enabled(v120, v121))
    {
      uint64_t v122 = swift_slowAlloc();
      v199 = a11;
      v123 = (uint8_t *)v122;
      os_log_t v193 = (os_log_t)swift_slowAlloc();
      *(_DWORD *)v123 = 138412290;
      v205[3] = (uint64_t)v119;
      v124 = v119;
      unint64_t v52 = 0x26A4D5000;
      sub_25AF799C0();
      os_log_t v125 = v193;
      v193->Class isa = (Class)v116;

      _os_log_impl(&dword_25AF45000, v120, v121, "setting userActivity {remUserActivity: %@}", v123, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5D80);
      swift_arrayDestroy();
      MEMORY[0x26115ACE0](v125, -1, -1);
      v126 = v123;
      uint64_t v115 = (uint64_t)v199;
      MEMORY[0x26115ACE0](v126, -1, -1);
    }
    else
    {

      v120 = v119;
    }

    v127 = v119;
    sub_25AF790A0();

    uint64_t v16 = v203;
    uint64_t v79 = (uint64_t)v201;
  }
  v201 = a12;
  uint64_t v128 = (uint64_t)v200;
  swift_beginAccess();
  sub_25AF54E58(v128, v79, &qword_26A4D5B80);
  uint64_t v129 = v195;
  uint64_t v130 = v196;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v195 + 48))(v79, 1, v196) == 1)
  {
    sub_25AF54EBC(v79, &qword_26A4D5B80);
  }
  else
  {
    v199 = (void *)v115;
    v131 = v194;
    (*(void (**)(char *, uint64_t, uint64_t))(v129 + 32))(v194, v79, v130);
    if (*(void *)(v52 + 2272) != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v16, (uint64_t)qword_26A4D5A30);
    v132 = v181;
    id v200 = *(id *)(v129 + 16);
    ((void (*)(char *, char *, uint64_t))v200)(v181, v131, v130);
    v133 = sub_25AF795A0();
    os_log_type_t v134 = sub_25AF797D0();
    if (os_log_type_enabled(v133, v134))
    {
      os_log_t v193 = v133;
      v135 = (uint8_t *)swift_slowAlloc();
      v192 = (char *)swift_slowAlloc();
      v205[0] = (uint64_t)v192;
      uint64_t v136 = v129;
      *(_DWORD *)v135 = 136315138;
      uint64_t v137 = sub_25AF78E70();
      uint64_t v204 = sub_25AF772F0(v137, v138, v205);
      sub_25AF799C0();
      swift_bridgeObjectRelease();
      v139 = *(void (**)(char *, uint64_t))(v129 + 8);
      v139(v132, v130);
      v133 = v193;
      _os_log_impl(&dword_25AF45000, v193, v134, "setting URL attachment {userActivityURL: %s}", v135, 0xCu);
      v140 = v192;
      swift_arrayDestroy();
      uint64_t v141 = v203;
      MEMORY[0x26115ACE0](v140, -1, -1);
      MEMORY[0x26115ACE0](v135, -1, -1);
    }
    else
    {
      uint64_t v141 = v16;
      uint64_t v136 = v129;
      v139 = *(void (**)(char *, uint64_t))(v129 + 8);
      v139(v132, v130);
    }

    uint64_t v142 = (uint64_t)v182;
    v143 = v194;
    ((void (*)(char *, char *, uint64_t))v200)(v182, v194, v130);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v136 + 56))(v142, 0, 1, v130);
    sub_25AF79100();
    sub_25AF54EBC(v142, &qword_26A4D5B80);
    v139(v143, v130);
    unint64_t v52 = 0x26A4D5000uLL;
    uint64_t v16 = v141;
    uint64_t v115 = (uint64_t)v199;
  }
  swift_beginAccess();
  if (*(void *)(v115 + 8))
  {
    uint64_t v144 = *(void *)(v52 + 2272);
    swift_bridgeObjectRetain();
    if (v144 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v16, (uint64_t)qword_26A4D5A30);
    v145 = sub_25AF795A0();
    os_log_type_t v146 = sub_25AF797D0();
    if (os_log_type_enabled(v145, v146))
    {
      v147 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v147 = 0;
      _os_log_impl(&dword_25AF45000, v145, v146, "setting notes", v147, 2u);
      MEMORY[0x26115ACE0](v147, -1, -1);
    }

    id v148 = objc_allocWithZone(MEMORY[0x263F086A0]);
    v149 = (void *)sub_25AF79610();
    swift_bridgeObjectRelease();
    id v150 = objc_msgSend(v148, sel_initWithString_, v149);

    sub_25AF79110();
  }
  v151 = v201;
  swift_beginAccess();
  v152 = v198;
  if (*v151)
  {
    uint64_t v153 = *(void *)(v52 + 2272);
    id v154 = *v151;
    if (v153 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v16, (uint64_t)qword_26A4D5A30);
    v155 = sub_25AF795A0();
    os_log_type_t v156 = sub_25AF797D0();
    if (os_log_type_enabled(v155, v156))
    {
      v157 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v157 = 0;
      _os_log_impl(&dword_25AF45000, v155, v156, "setting custom smart list filters", v157, 2u);
      v158 = v157;
      v152 = v198;
      MEMORY[0x26115ACE0](v158, -1, -1);
    }

    v159 = v184;
    sub_25AF78F10();
    sub_25AF79130();

    (*(void (**)(char *, uint64_t))(v185 + 8))(v159, v186);
  }
  id v160 = objc_msgSend(v152, sel_accountCapabilities, v172);
  unsigned int v161 = objc_msgSend(v160, sel_supportsFlagged);

  if (!v161) {
    goto LABEL_68;
  }
  id v162 = objc_msgSend(a13, sel_priority);
  if (!v162) {
    goto LABEL_68;
  }
  if (v162 == (id)1 || v162 == (id)2)
  {
    sub_25AF79150();
LABEL_68:
    if (*(void *)(v52 + 2272) != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v16, (uint64_t)qword_26A4D5A30);
    id v163 = v152;
    v164 = sub_25AF795A0();
    os_log_type_t v165 = sub_25AF797D0();
    if (os_log_type_enabled(v164, v165))
    {
      v166 = (uint8_t *)swift_slowAlloc();
      v167 = (void *)swift_slowAlloc();
      *(_DWORD *)v166 = 138543362;
      id v168 = objc_msgSend(v163, sel_objectID);
      id v209 = v168;
      sub_25AF799C0();
      void *v167 = v168;

      _os_log_impl(&dword_25AF45000, v164, v165, "Inserting reminder: {objectID: %{public}@}", v166, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5D80);
      swift_arrayDestroy();
      MEMORY[0x26115ACE0](v167, -1, -1);
      MEMORY[0x26115ACE0](v166, -1, -1);

      swift_release();
    }
    else
    {

      swift_release();
    }
    void *v197 = v163;
    return;
  }
  if (*(void *)(v52 + 2272) != -1) {
    swift_once();
  }
  uint64_t v169 = v203;
  uint64_t v170 = __swift_project_value_buffer(v203, (uint64_t)qword_26A4D5A30);
  (*(void (**)(char *, uint64_t, uint64_t))(v172 + 16))(v173, v170, v169);
  uint64_t v171 = MEMORY[0x263F8EE78];
  sub_25AF6026C(MEMORY[0x263F8EE78]);
  sub_25AF6026C(v171);
  sub_25AF58288((uint64_t)"unknown priority", 16, 2);
  __break(1u);
}

void sub_25AF4ED54(void *a1, int a2, void *a3, void *aBlock, void (*a5)(id, id, void *))
{
  uint64_t v8 = _Block_copy(aBlock);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a1;
  a5(v9, v10, v8);
  _Block_release(v8);
  _Block_release(v8);
}

uint64_t sub_25AF4EDE8(uint64_t (*a1)(uint64_t *), uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a1;
  *(void *)(v12 + 24) = a2;
  swift_retain();
  id v13 = objc_msgSend(a5, sel_taskReference);
  if (!v13)
  {
    swift_release();
    if (qword_26A4D58E0 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_25AF795B0();
    __swift_project_value_buffer(v19, (uint64_t)qword_26A4D5A30);
    uint64_t v20 = sub_25AF795A0();
    os_log_type_t v21 = sub_25AF797A0();
    if (!os_log_type_enabled(v20, v21)) {
      goto LABEL_15;
    }
    uint64_t v22 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v22 = 0;
    uint64_t v23 = ".taskReference is .unknown. {resolve: nil}";
    goto LABEL_14;
  }
  if (v13 != (id)1)
  {
    swift_release();
    if (qword_26A4D58E0 != -1) {
      swift_once();
    }
    uint64_t v24 = sub_25AF795B0();
    __swift_project_value_buffer(v24, (uint64_t)qword_26A4D5A30);
    uint64_t v20 = sub_25AF795A0();
    os_log_type_t v21 = sub_25AF797B0();
    if (!os_log_type_enabled(v20, v21)) {
      goto LABEL_15;
    }
    uint64_t v22 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v22 = 0;
    uint64_t v23 = ".taskReference is an unhandled enum. {resolve: nil}";
LABEL_14:
    _os_log_impl(&dword_25AF45000, v20, v21, v23, v22, 2u);
    MEMORY[0x26115ACE0](v22, -1, -1);
LABEL_15:

    uint64_t v25 = 0;
    return a1(&v25);
  }
  uint64_t v14 = *(void *)(a6 + OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_userActivityProvider + 24);
  uint64_t v15 = *(void *)(a6 + OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_userActivityProvider + 32);
  __swift_project_boxed_opaque_existential_1((void *)(a6 + OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_userActivityProvider), v14);
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = a3;
  v16[3] = a4;
  v16[4] = sub_25AF4F4A0;
  v16[5] = v12;
  uint64_t v17 = *(void (**)(void (*)(int, void *), void *, uint64_t, uint64_t))(v15 + 8);
  swift_retain();
  v17(sub_25AF4F518, v16, v14, v15);
  return swift_release();
}

void sub_25AF4F0A0(int a1, id a2, void (*a3)(id), uint64_t a4, void (*a5)(void))
{
  if (a2)
  {
    id v7 = a2;
    a3(a2);
  }
  else
  {
    a5();
  }
}

uint64_t sub_25AF4F118(void *a1)
{
  id v2 = objc_msgSend(a1, sel_contactEventTrigger);
  id v3 = objc_msgSend(v2, sel_triggerContact);

  if (v3)
  {
    uint64_t v4 = __swift_project_boxed_opaque_existential_1((void *)(v1+ OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_contactRepresentationResolver), *(void *)(v1+ OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_contactRepresentationResolver+ 24));
    MEMORY[0x270FA5388](v4);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A4D5D60);
    swift_allocObject();
    id v5 = v3;
    uint64_t v6 = sub_25AF79570();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A4D5D60);
    swift_allocObject();
    return sub_25AF79560();
  }
  return v6;
}

id sub_25AF4F280()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TTRAddTasksIntentHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for TTRAddTasksIntentHandler()
{
  return self;
}

_UNKNOWN **sub_25AF4F364()
{
  return &off_2708A54E0;
}

_UNKNOWN **sub_25AF4F370()
{
  return &off_2708A4C40;
}

_UNKNOWN **sub_25AF4F37C()
{
  return &off_2708A5668;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

void sub_25AF4F3CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_25AF58684(a1, a2, a3, a4, *(uint64_t (**)(uint64_t))(v4 + 16), *(void *)(v4 + 24), *(void **)(v4 + 32));
}

uint64_t sub_25AF4F3D8(uint64_t (*a1)(uint64_t *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25AF4EDE8(a1, a2, a3, a4, *(void **)(v4 + 16), *(void *)(v4 + 24));
}

uint64_t sub_25AF4F3E0()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25AF4F418@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_25AF4B9E8(*(id *)(v2 + 16), a1, a2);
}

uint64_t sub_25AF4F434()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25AF4F46C(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_25AF4F4A0(uint64_t a1)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  uint64_t v4 = a1;
  return v2(&v4);
}

uint64_t sub_25AF4F4D8()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

void sub_25AF4F518(int a1, void *a2)
{
  sub_25AF4F0A0(a1, a2, *(void (**)(id))(v2 + 16), *(void *)(v2 + 24), *(void (**)(void))(v2 + 32));
}

id sub_25AF4F524(void *a1)
{
  v12[1] = *(id *)MEMORY[0x263EF8340];
  v12[0] = 0;
  id v1 = objc_msgSend(a1, sel_fetchDefaultAccountWithError_, v12);
  if (v12[0])
  {
    id v2 = v12[0];

    swift_willThrow();
    if (qword_26A4D58E0 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_25AF795B0();
    __swift_project_value_buffer(v3, (uint64_t)qword_26A4D5A30);
    id v4 = v2;
    id v5 = sub_25AF795A0();
    os_log_type_t v6 = sub_25AF797B0();
    if (os_log_type_enabled(v5, v6))
    {
      id v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v8 = (void *)swift_slowAlloc();
      v12[0] = v8;
      *(_DWORD *)id v7 = 136315138;
      swift_getErrorValue();
      uint64_t v9 = sub_25AF79CA0();
      sub_25AF772F0(v9, v10, (uint64_t *)v12);
      sub_25AF799C0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25AF45000, v5, v6, "Unable to determine default account {error: %s}", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x26115ACE0](v8, -1, -1);
      MEMORY[0x26115ACE0](v7, -1, -1);
    }
    else
    {
    }
    return 0;
  }
  return v1;
}

uint64_t sub_25AF4F74C(unint64_t a1, void *a2)
{
  if (a1 >> 62) {
    goto LABEL_14;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t result = MEMORY[0x263F8EE78];
    if (!v4) {
      break;
    }
    uint64_t v10 = MEMORY[0x263F8EE78];
    uint64_t result = sub_25AF79B10();
    if (v4 < 0)
    {
      __break(1u);
      return result;
    }
    uint64_t v6 = 0;
    while (v4 != v6)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v7 = (id)MEMORY[0x26115A540](v6, a1);
      }
      else {
        id v7 = *(id *)(a1 + 8 * v6 + 32);
      }
      ++v6;
      id v8 = v7;
      id v9 = objc_msgSend(a2, sel_event);
      objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FF90]), sel_initWithPlacemark_event_, v8, v9);

      sub_25AF79AF0();
      sub_25AF79B20();
      sub_25AF79B30();
      sub_25AF79B00();
      if (v4 == v6) {
        return v10;
      }
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_25AF79C10();
    swift_bridgeObjectRelease();
  }
  return result;
}

void sub_25AF4F8CC(void *a1, char *a2, void (**a3)(void, void))
{
  v80[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a3;
  _Block_copy(a3);
  if (qword_26A4D58E0 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_25AF795B0();
  __swift_project_value_buffer(v7, (uint64_t)qword_26A4D5A30);
  id v8 = a1;
  id v9 = sub_25AF795A0();
  os_log_type_t v10 = sub_25AF797D0();
  unint64_t v11 = 0x265487000uLL;
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v76 = a3;
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(void *)type = v6;
    id v13 = (void *)swift_slowAlloc();
    v80[0] = v13;
    *(_DWORD *)uint64_t v12 = 136315138;
    id v14 = objc_msgSend(v8, sel_targetTaskList);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5C20);
    uint64_t v15 = sub_25AF799B0();
    unint64_t v17 = v16;

    uint64_t v18 = v15;
    unint64_t v11 = 0x265487000;
    sub_25AF772F0(v18, v17, (uint64_t *)v80);
    sub_25AF799C0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25AF45000, v9, v10, "SiriKit asked for resolving tasklist {targetTaskList: %s}", v12, 0xCu);
    swift_arrayDestroy();
    uint64_t v19 = v13;
    uint64_t v6 = *(void *)type;
    MEMORY[0x26115ACE0](v19, -1, -1);
    uint64_t v20 = v12;
    a3 = v76;
    MEMORY[0x26115ACE0](v20, -1, -1);
  }
  else
  {
  }
  id v21 = [v8 *(SEL *)(v11 + 2744)];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)&a2[OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_dataSource + 24];
    uint64_t v24 = *(void *)&a2[OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_dataSource + 32];
    __swift_project_boxed_opaque_existential_1(&a2[OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_dataSource], v23);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5980);
    uint64_t v25 = swift_allocObject();
    *(_OWORD *)(v25 + 16) = xmmword_25AF7A510;
    *(void *)(v25 + 32) = v22;
    v80[0] = (id)v25;
    sub_25AF796F0();
    id v26 = v80[0];
    uint64_t v27 = (void *)swift_allocObject();
    v27[2] = v22;
    v27[3] = sub_25AF55280;
    v27[4] = v6;
    uint64_t v28 = *(void (**)(id, void (*)(uint64_t), void *, uint64_t, uint64_t))(v24 + 40);
    id v29 = v22;
    swift_retain();
    v28(v26, sub_25AF5517C, v27, v23, v24);
    swift_release();

    swift_bridgeObjectRelease();
LABEL_8:
    swift_release();
    return;
  }
  id v30 = objc_msgSend(v8, sel_targetTaskListMembers);
  if (v30)
  {
    uint64_t v31 = v30;
    sub_25AF48D94(0, &qword_26A4D5978);
    unint64_t v32 = sub_25AF796D0();

    if (v32 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v33 = sub_25AF79C10();
      swift_bridgeObjectRelease();
      if (v33) {
        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v33 = *(void *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v33)
      {
LABEL_12:
        uint64_t v34 = (void *)MEMORY[0x263F8EE78];
        v80[0] = (id)MEMORY[0x263F8EE78];
        if (v33 < 1) {
          __break(1u);
        }
        unint64_t v35 = v32 & 0xC000000000000001;
        swift_bridgeObjectRetain();
        uint64_t v36 = 0;
        do
        {
          if (v35) {
            id v37 = (id)MEMORY[0x26115A540](v36, v32);
          }
          else {
            id v37 = *(id *)(v32 + 8 * v36 + 32);
          }
          id v38 = v37;
          ++v36;
          uint64_t v39 = sub_25AF79940();

          sub_25AF5E818(v39);
        }
        while (v33 != v36);
        swift_bridgeObjectRelease();
        id v40 = v80[0];
        v80[0] = v34;
        swift_bridgeObjectRetain();
        uint64_t v41 = 0;
        do
        {
          if (v35) {
            id v42 = (id)MEMORY[0x26115A540](v41, v32);
          }
          else {
            id v42 = *(id *)(v32 + 8 * v41 + 32);
          }
          id v43 = v42;
          ++v41;
          uint64_t v44 = sub_25AF79950();

          sub_25AF5E818(v44);
        }
        while (v33 != v41);
        swift_bridgeObjectRelease();
        id v45 = v80[0];
        uint64_t v46 = *(void *)&a2[OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_dataSource + 32];
        uint64_t v78 = *(void *)&a2[OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_dataSource + 24];
        __swift_project_boxed_opaque_existential_1(&a2[OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_dataSource], v78);
        uint64_t v47 = swift_bridgeObjectRetain();
        uint64_t v48 = sub_25AF5D288(v47);
        swift_bridgeObjectRelease();
        uint64_t v49 = swift_bridgeObjectRetain();
        uint64_t v50 = sub_25AF5D288(v49);
        swift_bridgeObjectRelease();
        id v51 = (void *)swift_allocObject();
        v51[2] = v32;
        v51[3] = v40;
        v51[4] = v45;
        v51[5] = a2;
        v51[6] = sub_25AF55280;
        v51[7] = v6;
        unint64_t v52 = *(void (**)(uint64_t, uint64_t, void (*)(uint64_t), void *, uint64_t, uint64_t))(v46 + 56);
        swift_retain();
        uint64_t v53 = a2;
        v52(v48, v50, sub_25AF5512C, v51, v78, v46);
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_8;
      }
    }
    swift_bridgeObjectRelease();
  }
  id v54 = *(void **)&a2[OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_store];
  v80[0] = 0;
  id v55 = objc_msgSend(v54, sel_fetchDefaultListWithError_, v80);
  unint64_t v56 = v55;
  if (v80[0])
  {
    id v57 = v80[0];

    swift_willThrow();
  }
  else if (v55)
  {
    uint64_t v79 = a2;
    sub_25AF48D94(0, &qword_26A4D5B48);
    id v62 = v56;
    v63 = (void *)sub_25AF79760();
    id v64 = v62;
    id v65 = v63;
    id v66 = v64;
    id v67 = v65;
    id v68 = sub_25AF795A0();
    os_log_type_t v69 = sub_25AF797D0();
    if (os_log_type_enabled(v68, v69))
    {
      uint64_t v70 = swift_slowAlloc();
      uint64_t v71 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v70 = 138412546;
      uint64_t v77 = a3;
      id v72 = [v66 objectID];
      v80[0] = v72;
      sub_25AF799C0();
      void *v71 = v72;

      *(_WORD *)(v70 + 12) = 2112;
      v80[0] = v67;
      id v73 = v67;
      a3 = v77;
      sub_25AF799C0();
      v71[1] = v67;

      _os_log_impl(&dword_25AF45000, v68, v69, "Using defaultList {objectID: %@, result: .success(%@)}", (uint8_t *)v70, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5D80);
      swift_arrayDestroy();
      MEMORY[0x26115ACE0](v71, -1, -1);
      MEMORY[0x26115ACE0](v70, -1, -1);
    }
    else
    {

      id v68 = v66;
    }

    v79[OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_didNotSpecifyTargetList] = 1;
    sub_25AF48D94(0, &qword_26A4D5B38);
    id v74 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_successWithResolvedTaskList_, v67);
    ((void (**)(void, id))a3)[2](a3, v74);
    swift_release();

    return;
  }
  uint64_t v58 = sub_25AF795A0();
  os_log_type_t v59 = sub_25AF797D0();
  if (os_log_type_enabled(v58, v59))
  {
    id v60 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v60 = 0;
    _os_log_impl(&dword_25AF45000, v58, v59, "No .targetTaskList and unable to get defaultList. {result: .disambiguateDueToNoDefaultList}", v60, 2u);
    MEMORY[0x26115ACE0](v60, -1, -1);
  }

  id v61 = sub_25AF4A900();
  ((void (**)(void, id))a3)[2](a3, v61);
  swift_release();
}

void sub_25AF501CC(void *a1, uint64_t a2)
{
  if (qword_26A4D58E0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25AF795B0();
  __swift_project_value_buffer(v4, (uint64_t)qword_26A4D5A30);
  id v5 = a1;
  uint64_t v6 = sub_25AF795A0();
  os_log_type_t v7 = sub_25AF797D0();
  unint64_t v8 = 0x265487000uLL;
  if (os_log_type_enabled(v6, v7))
  {
    id v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v103 = a2;
    uint64_t v10 = swift_slowAlloc();
    v105 = v10;
    *(_DWORD *)id v9 = 136315138;
    id v11 = objc_msgSend(v5, sel_spatialEventTrigger);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5C18);
    uint64_t v12 = sub_25AF799B0();
    unint64_t v14 = v13;

    sub_25AF772F0(v12, v14, (uint64_t *)&v105);
    sub_25AF799C0();

    unint64_t v8 = 0x265487000;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25AF45000, v6, v7, "SiriKit asked for resolving spatial event trigger {spatialEventTrigger: %s}", v9, 0xCu);
    swift_arrayDestroy();
    uint64_t v15 = v10;
    a2 = v103;
    MEMORY[0x26115ACE0](v15, -1, -1);
    MEMORY[0x26115ACE0](v9, -1, -1);
  }
  else
  {
  }
  id v16 = [v5 *(SEL *)(v8 + 2816)];
  if (!v16)
  {
    uint64_t v27 = sub_25AF795A0();
    os_log_type_t v28 = sub_25AF797D0();
    if (os_log_type_enabled(v27, v28))
    {
      id v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v29 = 0;
      _os_log_impl(&dword_25AF45000, v27, v28, ".spatialEventTrigger is nil {result: .notRequired}", v29, 2u);
      MEMORY[0x26115ACE0](v29, -1, -1);
    }

    sub_25AF48D94(0, &qword_26A4D5BF0);
    id v30 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_notRequired);
    (*(void (**)(uint64_t, NSObject *))(a2 + 16))(a2, v30);
    goto LABEL_61;
  }
  unint64_t v17 = v16;
  if (!objc_msgSend(v16, sel_event))
  {
    uint64_t v31 = sub_25AF795A0();
    os_log_type_t v32 = sub_25AF797B0();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v33 = 0;
      _os_log_impl(&dword_25AF45000, v31, v32, "spatialEventTrigger.event must not be .unknown {result: .unsupported}", v33, 2u);
      MEMORY[0x26115ACE0](v33, -1, -1);
    }

    sub_25AF48D94(0, &qword_26A4D5BF0);
    id v30 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupported);
    (*(void (**)(uint64_t, NSObject *))(a2 + 16))(a2, v30);

    goto LABEL_61;
  }
  id v18 = objc_msgSend(v17, sel_mobileSpace);
  uint64_t v19 = v17;
  uint64_t v20 = sub_25AF795A0();
  os_log_type_t v21 = sub_25AF797D0();
  BOOL v22 = os_log_type_enabled(v20, v21);
  if (v18 == (id)1)
  {
    if (v22)
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      uint64_t v24 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v23 = 138412290;
      v105 = v19;
      uint64_t v25 = v19;
      id v26 = v19;
      sub_25AF799C0();
      void *v24 = v17;

      uint64_t v19 = v25;
      _os_log_impl(&dword_25AF45000, v20, v21, "Resolved vehicle trigger {result: .success, spatialEventTrigger: %@}", v23, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5D80);
      swift_arrayDestroy();
      MEMORY[0x26115ACE0](v24, -1, -1);
      MEMORY[0x26115ACE0](v23, -1, -1);
    }
    else
    {

      uint64_t v20 = v19;
    }

    id v30 = objc_msgSend(self, sel_successWithResolvedSpatialEventTrigger_, v19);
    (*(void (**)(uint64_t, NSObject *))(a2 + 16))(a2, v30);

LABEL_61:
    return;
  }
  uint64_t v104 = a2;
  unint64_t v101 = v19;
  if (v22)
  {
    uint64_t v34 = (uint8_t *)swift_slowAlloc();
    uint64_t v35 = swift_slowAlloc();
    v105 = v35;
    *(_DWORD *)uint64_t v34 = 136315138;
    id v36 = [v19 suggestedValues];
    if (v36)
    {
      id v37 = v36;
      sub_25AF48D94(0, &qword_26A4D5C00);
      sub_25AF796D0();
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5C10);
    uint64_t v38 = sub_25AF799B0();
    unint64_t v40 = v39;
    swift_bridgeObjectRelease();
    sub_25AF772F0(v38, v40, (uint64_t *)&v105);
    sub_25AF799C0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25AF45000, v20, v21, "suggestedValues: %s", v34, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x26115ACE0](v35, -1, -1);
    MEMORY[0x26115ACE0](v34, -1, -1);

    a2 = v104;
  }
  else
  {
  }
  id v41 = [v19 suggestedValues];
  if (v41)
  {
    id v42 = v41;
    sub_25AF48D94(0, &qword_26A4D5C00);
    unint64_t v43 = sub_25AF796D0();
  }
  else
  {
    unint64_t v43 = MEMORY[0x263F8EE78];
  }
  unint64_t v44 = v43 >> 62;
  if (!(v43 >> 62))
  {
    if (*(void *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_29;
    }
LABEL_38:
    swift_bridgeObjectRelease();
    id v61 = sub_25AF795A0();
    os_log_type_t v62 = sub_25AF797D0();
    if (os_log_type_enabled(v61, v62))
    {
      v63 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v63 = 0;
      _os_log_impl(&dword_25AF45000, v61, v62, "fallback to spatialEventTrigger.placemark instead because placemark count is 0 {count: 0}", v63, 2u);
      MEMORY[0x26115ACE0](v63, -1, -1);
    }

    id v64 = [v19 placemark];
    if (!v64)
    {
      id v65 = sub_25AF795A0();
      os_log_type_t v66 = sub_25AF797B0();
      if (os_log_type_enabled(v65, v66))
      {
        id v67 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v67 = 0;
        _os_log_impl(&dword_25AF45000, v65, v66, "spatialEventTrigger.placemark == nil. Siri is messed up. Ignoring. {result: .notRequired}", v67, 2u);
        MEMORY[0x26115ACE0](v67, -1, -1);
      }

      sub_25AF48D94(0, &qword_26A4D5BF0);
      id v68 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_notRequired);
      (*(void (**)(uint64_t, id))(a2 + 16))(a2, v68);

      id v30 = v19;
      goto LABEL_61;
    }
    id v45 = [v19 placemark];
LABEL_50:
    id v73 = objc_msgSend(v45, sel_region);
    if (v73)
    {
      id v74 = v73;
      self;
      uint64_t v75 = swift_dynamicCastObjCClass();
      if (v75)
      {
        uint64_t v76 = v75;
        uint64_t v77 = v19;
        id v78 = v74;
        uint64_t v79 = v77;
        unint64_t v80 = v78;
        uint64_t v81 = sub_25AF795A0();
        os_log_type_t v82 = sub_25AF797D0();
        if (os_log_type_enabled(v81, v82))
        {
          uint64_t v102 = v79;
          uint64_t v83 = swift_slowAlloc();
          os_log_type_t v84 = (void *)swift_slowAlloc();
          *(_DWORD *)uint64_t v83 = 138412546;
          v105 = v76;
          BOOL v85 = v80;
          sub_25AF799C0();
          *os_log_type_t v84 = v76;

          *(_WORD *)(v83 + 12) = 2112;
          v105 = v102;
          v86 = v102;
          sub_25AF799C0();
          v84[1] = v17;

          a2 = v104;
          _os_log_impl(&dword_25AF45000, v81, v82, "Resolved circularRegion {circularRegion: %@, result: .success(%@)}", (uint8_t *)v83, 0x16u);
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5D80);
          swift_arrayDestroy();
          MEMORY[0x26115ACE0](v84, -1, -1);
          uint64_t v87 = v83;
          uint64_t v79 = v102;
          MEMORY[0x26115ACE0](v87, -1, -1);
        }
        else
        {

          uint64_t v81 = v80;
        }

        id v30 = v45;
        id v98 = [v79 event];
        id v99 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FF90]), sel_initWithPlacemark_event_, v30, v98);

        id v100 = objc_msgSend(self, sel_successWithResolvedSpatialEventTrigger_, v99);
        (*(void (**)(uint64_t, id))(a2 + 16))(a2, v100);

        goto LABEL_61;
      }
    }
    id v30 = v45;
    uint64_t v88 = sub_25AF795A0();
    os_log_type_t v89 = sub_25AF797B0();
    if (os_log_type_enabled(v88, v89))
    {
      uint64_t v90 = (uint8_t *)swift_slowAlloc();
      uint64_t v91 = swift_slowAlloc();
      v105 = v91;
      *(_DWORD *)uint64_t v90 = 136315138;
      id v92 = [v30 region];
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5C08);
      uint64_t v93 = sub_25AF799B0();
      unint64_t v95 = v94;

      sub_25AF772F0(v93, v95, (uint64_t *)&v105);
      sub_25AF799C0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25AF45000, v88, v89, "Got a placemark with a CLRegion that is not a CLCircularRegion {region: %s, result: unsupported}", v90, 0xCu);
      swift_arrayDestroy();
      uint64_t v96 = v91;
      a2 = v104;
      MEMORY[0x26115ACE0](v96, -1, -1);
      MEMORY[0x26115ACE0](v90, -1, -1);
    }
    else
    {
    }
    sub_25AF48D94(0, &qword_26A4D5BF0);
    id v97 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupported);
    (*(void (**)(uint64_t, id))(a2 + 16))(a2, v97);

    goto LABEL_61;
  }
  swift_bridgeObjectRetain();
  uint64_t v60 = sub_25AF79C10();
  swift_bridgeObjectRelease();
  if (!v60) {
    goto LABEL_38;
  }
LABEL_29:
  if ((v43 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    id v45 = (id)MEMORY[0x26115A540](0, v43);
    swift_bridgeObjectRelease();
    uint64_t v46 = v43 & 0xFFFFFFFFFFFFFF8;
    if (!v44)
    {
LABEL_32:
      if (*(void *)(v46 + 16) != 1)
      {
LABEL_33:

        swift_bridgeObjectRetain_n();
        uint64_t v47 = sub_25AF795A0();
        os_log_type_t v48 = sub_25AF797D0();
        if (os_log_type_enabled(v47, v48))
        {
          uint64_t v49 = (uint8_t *)swift_slowAlloc();
          uint64_t v50 = swift_slowAlloc();
          v105 = v50;
          *(_DWORD *)uint64_t v49 = 136315138;
          uint64_t v51 = sub_25AF48D94(0, &qword_26A4D5C00);
          uint64_t v52 = swift_bridgeObjectRetain();
          uint64_t v53 = MEMORY[0x26115A160](v52, v51);
          id v54 = v19;
          unint64_t v56 = v55;
          swift_bridgeObjectRelease();
          sub_25AF772F0(v53, v56, (uint64_t *)&v105);
          a2 = v104;
          sub_25AF799C0();
          swift_bridgeObjectRelease_n();
          uint64_t v19 = v54;
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_25AF45000, v47, v48, "Disambiguate suggestedValues {result: .disambiguation, placemarks: %s}", v49, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x26115ACE0](v50, -1, -1);
          MEMORY[0x26115ACE0](v49, -1, -1);
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        id v30 = v19;
        sub_25AF4F74C(v43, v30);
        swift_bridgeObjectRelease();

        id v57 = self;
        sub_25AF48D94(0, &qword_26A4D5BF8);
        uint64_t v58 = (void *)sub_25AF796C0();
        swift_bridgeObjectRelease();
        id v59 = objc_msgSend(v57, sel_disambiguationWithSpatialEventTriggersToDisambiguate_, v58);

        (*(void (**)(uint64_t, id))(a2 + 16))(a2, v59);
        goto LABEL_61;
      }
      goto LABEL_47;
    }
LABEL_46:
    swift_bridgeObjectRetain();
    uint64_t v69 = sub_25AF79C10();
    swift_bridgeObjectRelease();
    if (v69 != 1) {
      goto LABEL_33;
    }
LABEL_47:
    swift_bridgeObjectRelease();
    uint64_t v70 = sub_25AF795A0();
    os_log_type_t v71 = sub_25AF797D0();
    if (os_log_type_enabled(v70, v71))
    {
      id v72 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v72 = 0;
      _os_log_impl(&dword_25AF45000, v70, v71, "Using the only suggestedValue because placemarks.count is 1 {count: 1}", v72, 2u);
      MEMORY[0x26115ACE0](v72, -1, -1);
    }

    goto LABEL_50;
  }
  if (*(void *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v45 = *(id *)(v43 + 32);
    uint64_t v46 = v43 & 0xFFFFFFFFFFFFFF8;
    if (!v44) {
      goto LABEL_32;
    }
    goto LABEL_46;
  }
  __break(1u);
}

void sub_25AF51184(void *a1, uint64_t a2, void (**a3)(void, void))
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a3;
  _Block_copy(a3);
  if (qword_26A4D58E0 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_25AF795B0();
  __swift_project_value_buffer(v6, (uint64_t)qword_26A4D5A30);
  id v7 = a1;
  unint64_t v8 = sub_25AF795A0();
  os_log_type_t v9 = sub_25AF797D0();
  unint64_t v10 = 0x265487000uLL;
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v30 = v5;
    id v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v31 = v12;
    *(_DWORD *)id v11 = 136315138;
    objc_msgSend(v7, sel_taskReference);
    type metadata accessor for INTaskReference(0);
    uint64_t v13 = sub_25AF79650();
    sub_25AF772F0(v13, v14, &v31);
    sub_25AF799C0();

    unint64_t v10 = 0x265487000;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25AF45000, v8, v9, "SiriKit asked for resolving task reference {taskReference: %s}", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x26115ACE0](v12, -1, -1);
    uint64_t v15 = v11;
    uint64_t v5 = v30;
    MEMORY[0x26115ACE0](v15, -1, -1);
  }
  else
  {
  }
  if ([v7 *(SEL *)(v10 + 2672)] != (id)1)
  {
    uint64_t v23 = sub_25AF795A0();
    os_log_type_t v24 = sub_25AF797D0();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v25 = 0;
      _os_log_impl(&dword_25AF45000, v23, v24, "userActivity not requested {result: .notRequired}", v25, 2u);
      MEMORY[0x26115ACE0](v25, -1, -1);
    }

    sub_25AF48D94(0, &qword_26A4D5BE8);
    id v26 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_notRequired);
    goto LABEL_16;
  }
  id v16 = sub_25AF4C098(v7);
  if (v16)
  {
    unint64_t v17 = v16;
    unsigned __int8 v18 = objc_msgSend(v16, sel_supportsReminderActions);

    if ((v18 & 1) == 0)
    {
      uint64_t v27 = sub_25AF795A0();
      os_log_type_t v28 = sub_25AF797B0();
      if (os_log_type_enabled(v27, v28))
      {
        id v29 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v29 = 0;
        _os_log_impl(&dword_25AF45000, v27, v28, "Target list account doesn't support userActivity. {result: .unsupported()}", v29, 2u);
        MEMORY[0x26115ACE0](v29, -1, -1);
      }

      sub_25AF48D94(0, &qword_26A4D5BE8);
      id v26 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupported);
LABEL_16:
      id v22 = v26;
      ((void (**)(void, id))a3)[2](a3, v22);
      goto LABEL_17;
    }
  }
  MEMORY[0x270FA5388](v16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5AF0);
  swift_allocObject();
  sub_25AF79570();
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = sub_25AF55280;
  *(void *)(v19 + 24) = v5;
  swift_retain();
  uint64_t v20 = (void *)sub_25AF79500();
  sub_25AF79540();
  swift_release();
  swift_release();

  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = sub_25AF55280;
  *(void *)(v21 + 24) = v5;
  swift_retain();
  id v22 = (id)sub_25AF79500();
  sub_25AF79550();
  swift_release();
  swift_release();
  swift_release();
LABEL_17:
  swift_release();
}

void sub_25AF51698(void *a1, uint64_t a2)
{
  if (qword_26A4D58E0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25AF795B0();
  __swift_project_value_buffer(v4, (uint64_t)qword_26A4D5A30);
  id v5 = a1;
  uint64_t v6 = sub_25AF795A0();
  os_log_type_t v7 = sub_25AF797D0();
  if (os_log_type_enabled(v6, v7))
  {
    unint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v28 = v9;
    *(_DWORD *)unint64_t v8 = 136315138;
    id v10 = objc_msgSend(v5, sel_targetTaskListMembers);
    if (v10)
    {
      id v11 = v10;
      sub_25AF48D94(0, &qword_26A4D5978);
      sub_25AF796D0();
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5BE0);
    uint64_t v12 = sub_25AF79650();
    uint64_t v27 = sub_25AF772F0(v12, v13, &v28);
    sub_25AF799C0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25AF45000, v6, v7, "SiriKit asked for resolving target task list members {targetTaskListMembers: %s}", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x26115ACE0](v9, -1, -1);
    MEMORY[0x26115ACE0](v8, -1, -1);
  }
  else
  {
  }
  id v14 = objc_msgSend(v5, sel_targetTaskListMembers, v27);
  if (!v14)
  {
    sub_25AF48D94(0, (unint64_t *)&unk_26A4D5BD0);
    id v23 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_notRequired);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5980);
    uint64_t v24 = swift_allocObject();
    *(_OWORD *)(v24 + 16) = xmmword_25AF7A510;
    *(void *)(v24 + 32) = v23;
    uint64_t v28 = v24;
    sub_25AF796F0();
    id v25 = v23;
    id v26 = (void *)sub_25AF796C0();
    (*(void (**)(uint64_t, void *))(a2 + 16))(a2, v26);

LABEL_21:
    swift_bridgeObjectRelease();

    return;
  }
  uint64_t v15 = v14;
  sub_25AF48D94(0, &qword_26A4D5978);
  unint64_t v16 = sub_25AF796D0();

  if (!(v16 >> 62))
  {
    uint64_t v17 = *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v17) {
      goto LABEL_11;
    }
LABEL_20:
    swift_bridgeObjectRelease();
    sub_25AF48D94(0, (unint64_t *)&unk_26A4D5BD0);
    id v26 = (void *)sub_25AF796C0();
    (*(void (**)(uint64_t, void *))(a2 + 16))(a2, v26);
    goto LABEL_21;
  }
  swift_bridgeObjectRetain();
  uint64_t v17 = sub_25AF79C10();
  swift_bridgeObjectRelease();
  if (!v17) {
    goto LABEL_20;
  }
LABEL_11:
  uint64_t v28 = MEMORY[0x263F8EE78];
  sub_25AF79B10();
  if ((v17 & 0x8000000000000000) == 0)
  {
    unsigned __int8 v18 = self;
    uint64_t v19 = 0;
    do
    {
      if ((v16 & 0xC000000000000001) != 0) {
        id v20 = (id)MEMORY[0x26115A540](v19, v16);
      }
      else {
        id v20 = *(id *)(v16 + 8 * v19 + 32);
      }
      uint64_t v21 = v20;
      ++v19;
      id v22 = objc_msgSend(v18, sel_successWithResolvedPerson_, v20);

      sub_25AF79AF0();
      sub_25AF79B20();
      sub_25AF79B30();
      sub_25AF79B00();
    }
    while (v17 != v19);
    goto LABEL_20;
  }
  __break(1u);
}

void sub_25AF51AFC(void *a1, unsigned char *a2, const void *a3)
{
  v338[15] = *(id *)MEMORY[0x263EF8340];
  uint64_t v312 = sub_25AF79000();
  uint64_t v311 = *(void *)(v312 - 8);
  MEMORY[0x270FA5388](v312);
  v310 = (char *)&v298 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v318 = sub_25AF78E40();
  uint64_t v317 = *(void *)(v318 - 8);
  MEMORY[0x270FA5388](v318);
  v316 = (char *)&v298 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v315 = sub_25AF78F20();
  uint64_t v314 = *(void *)(v315 - 8);
  MEMORY[0x270FA5388](v315);
  v313 = (char *)&v298 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v321 = sub_25AF79250();
  uint64_t v320 = *(void *)(v321 - 8);
  MEMORY[0x270FA5388](v321);
  v319 = (char *)&v298 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5B58);
  unint64_t v322 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10 - 8);
  v324 = (char *)&v298 - ((unint64_t)(v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v323 = v11;
  MEMORY[0x270FA5388](v12);
  uint64_t v326 = (uint64_t)&v298 - v13;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5B60);
  MEMORY[0x270FA5388](v14 - 8);
  v327 = (char *)&v298 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  v333 = (uint8_t **)((char *)&v298 - v17);
  v332 = (void *)sub_25AF78F60();
  uint64_t v331 = *(v332 - 1);
  MEMORY[0x270FA5388](v332);
  os_log_t v328 = (os_log_t)((char *)&v298 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v19);
  v325 = (char *)&v298 - v20;
  uint64_t v21 = sub_25AF795B0();
  uint64_t v22 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  uint64_t v24 = (char *)&v298 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = a3;
  _Block_copy(a3);
  if (qword_26A4D58E0 != -1) {
    swift_once();
  }
  uint64_t v26 = __swift_project_value_buffer(v21, (uint64_t)qword_26A4D5A30);
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v24, v26, v21);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5B68);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25AF7A830;
  *(void *)(inited + 32) = 0x746E65746E69;
  *(void *)(inited + 40) = 0xE600000000000000;
  *(void *)(inited + 72) = sub_25AF48D94(0, (unint64_t *)&unk_26A4D5B70);
  *(void *)(inited + 48) = a1;
  id v28 = a1;
  sub_25AF6026C(inited);
  sub_25AF57F94();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v24, v21);
  id v29 = v28;
  uint64_t v334 = v26;
  uint64_t v30 = sub_25AF795A0();
  os_log_type_t v31 = sub_25AF797D0();
  if (os_log_type_enabled(v30, v31))
  {
    uint64_t v32 = swift_slowAlloc();
    v330 = a2;
    uint64_t v329 = v25;
    uint64_t v33 = (uint8_t *)v32;
    uint64_t v34 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v33 = 138412290;
    v338[0] = v29;
    uint64_t v35 = v29;
    sub_25AF799C0();
    void *v34 = v29;

    _os_log_impl(&dword_25AF45000, v30, v31, "SiriKit asked for handling intent {intent: %@}", v33, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5D80);
    swift_arrayDestroy();
    MEMORY[0x26115ACE0](v34, -1, -1);
    id v36 = v33;
    uint64_t v25 = v329;
    a2 = v330;
    MEMORY[0x26115ACE0](v36, -1, -1);
  }
  else
  {

    uint64_t v30 = v29;
  }

  id v37 = [v29 taskTitles];
  id v38 = v333;
  if (!v37)
  {
    uint64_t v47 = sub_25AF795A0();
    os_log_type_t v48 = sub_25AF797B0();
    if (!os_log_type_enabled(v47, v48))
    {
LABEL_18:

      id v58 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0F968]), sel_initWithCode_userActivity_, 4, 0);
      (*((void (**)(const void *, id))a3 + 2))(a3, v58);
      swift_release();

      return;
    }
    uint64_t v49 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v49 = 0;
    _os_log_impl(&dword_25AF45000, v47, v48, "intent.taskTitles is nil - should have resolved it in previous calls. {result: .failure}", v49, 2u);
    uint64_t v50 = v49;
LABEL_16:
    MEMORY[0x26115ACE0](v50, -1, -1);
    goto LABEL_18;
  }
  unint64_t v39 = v37;
  sub_25AF48D94(0, (unint64_t *)&unk_26A4D5B10);
  uint64_t v40 = sub_25AF796D0();

  id v41 = [v29 targetTaskList];
  if (!v41)
  {
    swift_bridgeObjectRelease();
    uint64_t v51 = v29;
    uint64_t v47 = sub_25AF795A0();
    os_log_type_t v52 = sub_25AF797B0();
    if (!os_log_type_enabled(v47, v52))
    {

      uint64_t v47 = v51;
      goto LABEL_18;
    }
    uint64_t v53 = (uint8_t *)swift_slowAlloc();
    uint64_t v54 = swift_slowAlloc();
    v309 = a3;
    unint64_t v55 = (void *)v54;
    *(_DWORD *)uint64_t v53 = 138412290;
    v338[0] = v51;
    unint64_t v56 = v51;
    sub_25AF799C0();
    *unint64_t v55 = v51;

    _os_log_impl(&dword_25AF45000, v47, v52, "Unexpected nil .targetTaskList from intent. {intent: %@, result: .failure}", v53, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5D80);
    swift_arrayDestroy();
    id v57 = v55;
    a3 = v309;
    MEMORY[0x26115ACE0](v57, -1, -1);
    uint64_t v50 = v53;
    goto LABEL_16;
  }
  id v42 = v41;
  v306 = v29;
  uint64_t v308 = swift_allocObject();
  *(void *)(v308 + 16) = 0;
  char v43 = sub_25AF79750();
  id v307 = v42;
  if (!v44) {
    goto LABEL_27;
  }
  if (v43)
  {
    sub_25AF78F30();
    uint64_t v45 = v331;
    uint64_t v46 = v332;
    if ((*(unsigned int (**)(id, uint64_t, void *))(v331 + 48))(v38, 1, v332) == 1)
    {
      sub_25AF54EBC((uint64_t)v38, &qword_26A4D5B60);
      goto LABEL_25;
    }
    (*(void (**)(char *, id, void *))(v45 + 32))(v325, v38, v46);
    id v59 = self;
    uint64_t v60 = (void *)sub_25AF78F40();
    id v61 = objc_msgSend(v59, sel_objectIDWithUUID_, v60);

    os_log_type_t v62 = *(void **)&a2[OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_store];
    v338[0] = 0;
    v333 = objc_msgSend(v62, sel_fetchCustomSmartListWithObjectID_error_, v61, v338);
    if (v333)
    {
      id v63 = v338[0];
      id v64 = objc_msgSend(v333, sel_customContext);
      if (!v64 || (id v65 = v64, v66 = sub_25AF79890(), v65, !v66))
      {

        (*(void (**)(char *, void *))(v331 + 8))(v325, v332);
        id v42 = v307;
        goto LABEL_25;
      }
      v303 = (void *)v66;
      id v67 = v61;
      id v68 = sub_25AF795A0();
      os_log_type_t v69 = sub_25AF797D0();
      LODWORD(v301) = v69;
      BOOL v70 = os_log_type_enabled(v68, v69);
      id v304 = v61;
      v302 = v67;
      if (v70)
      {
        uint64_t v305 = v40;
        os_log_type_t v71 = (uint8_t *)swift_slowAlloc();
        v300 = (void *)swift_slowAlloc();
        v309 = a3;
        v299 = v71;
        *(_DWORD *)os_log_type_t v71 = 138543362;
        v298 = v71 + 4;
        v338[0] = v67;
        id v72 = v67;
        uint64_t v40 = v305;
        a3 = v309;
        sub_25AF799C0();
        void *v300 = v67;

        id v73 = v299;
        _os_log_impl(&dword_25AF45000, v68, (os_log_type_t)v301, "Successfully fetched custom smart list {smartListID: %{public}@}", v299, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5D80);
        id v74 = v300;
        swift_arrayDestroy();
        MEMORY[0x26115ACE0](v74, -1, -1);
        MEMORY[0x26115ACE0](v73, -1, -1);
      }
      else
      {

        id v68 = v67;
      }

      v272 = *(void **)(v308 + 16);
      v273 = v303;
      *(void *)(v308 + 16) = v303;
      id v274 = v273;

      v338[0] = 0;
      id v275 = objc_msgSend(v62, sel_fetchDefaultListWithError_, v338);
      if (!v338[0])
      {
        (*(void (**)(char *, void *))(v331 + 8))(v325, v332);

        id v42 = v307;
        if (v275)
        {
          unint64_t v95 = v275;
          swift_bridgeObjectRelease();
          v333 = v95;
LABEL_52:
          unsigned int v167 = objc_msgSend(v95, sel_isGroup);
          id v168 = v306;
          if (v167)
          {
            swift_bridgeObjectRelease();
            uint64_t v169 = v95;
            uint64_t v170 = sub_25AF795A0();
            os_log_type_t v171 = sub_25AF797B0();
            if (os_log_type_enabled(v170, v171))
            {
              uint64_t v172 = (uint8_t *)swift_slowAlloc();
              uint64_t v173 = swift_slowAlloc();
              v309 = a3;
              uint64_t v174 = (void *)v173;
              *(_DWORD *)uint64_t v172 = 138543362;
              id v175 = [v169 objectID];
              v338[0] = v175;
              sub_25AF799C0();
              *uint64_t v174 = v175;

              _os_log_impl(&dword_25AF45000, v170, v171, "Fetched list is a Group, can't add reminder to groups. {result: .failure, listID: %{public}@}", v172, 0xCu);
              __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5D80);
              swift_arrayDestroy();
              v176 = v174;
              a3 = v309;
              MEMORY[0x26115ACE0](v176, -1, -1);
              MEMORY[0x26115ACE0](v172, -1, -1);
            }
            else
            {

              uint64_t v170 = v169;
            }
            id v177 = v333;

            id v178 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0F968]), sel_initWithCode_userActivity_, 4, 0);
            (*((void (**)(const void *, id))a3 + 2))(a3, v178);
            swift_release();
            swift_release();

            return;
          }
          uint64_t v305 = v40;
          if ([v306 spatialEventTrigger])
          {
            sub_25AF48D94(0, (unint64_t *)&unk_26A4D5D70);
            os_log_t v328 = (os_log_t)sub_25AF79880();
          }
          else
          {
            os_log_t v328 = 0;
          }
          id v198 = [v168 spatialEventTrigger];
          v332 = v95;
          if (v198)
          {
            sub_25AF48D94(0, (unint64_t *)&unk_26A4D5B90);
            id v304 = (id)sub_25AF79870();
          }
          else
          {
            id v304 = 0;
          }
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5B30);
          uint64_t v331 = swift_allocBox();
          uint64_t v200 = v199;
          id v201 = [v168 temporalEventTrigger];
          v298 = (uint8_t *)v200;
          if (v201)
          {
            v202 = v201;
            sub_25AF79850();
          }
          else
          {
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v317 + 56))(v200, 1, 1, v318);
          }
          id v203 = [v168 temporalEventTrigger];
          v309 = a3;
          if (v203)
          {
            sub_25AF54CFC((uint64_t)&a2[OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_timeProvider], (uint64_t)v338);
            sub_25AF791B0();
          }
          else
          {
            uint64_t v204 = sub_25AF791C0();
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v204 - 8) + 56))(v326, 1, 1, v204);
          }
          uint64_t v329 = v25;
          uint64_t v205 = swift_allocObject();
          *(void *)(v205 + 16) = 0;
          uint64_t v206 = sub_25AF4F118(v168);
          uint64_t v207 = swift_allocObject();
          v330 = a2;
          *(void *)(v207 + 16) = 0;
          MEMORY[0x270FA5388](v207);
          *(&v298 - 2) = (uint8_t *)v168;
          *(&v298 - 1) = (uint8_t *)v208;
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5AF0);
          swift_allocObject();
          uint64_t v209 = sub_25AF79570();
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5B80);
          uint64_t v210 = swift_allocBox();
          uint64_t v212 = v211;
          uint64_t v213 = sub_25AF78E90();
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v213 - 8) + 56))(v212, 1, 1, v213);
          v214 = swift_allocObject();
          v214[2].Class isa = 0;
          v214[3].Class isa = 0;
          v299 = (uint8_t *)__swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5B88);
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5980);
          uint64_t v215 = swift_allocObject();
          *(_OWORD *)(v215 + 16) = xmmword_25AF7A840;
          swift_retain();
          v216 = (void *)sub_25AF79500();
          uint64_t v217 = MEMORY[0x263F8EE60] + 8;
          v303 = (void *)v206;
          uint64_t v218 = sub_25AF79540();
          uint64_t v334 = v205;
          swift_release();

          *(void *)(v215 + 32) = v218;
          v219 = (void *)swift_allocObject();
          v219[2] = v207;
          v219[3] = v210;
          v219[4] = v214;
          v327 = (char *)v207;
          swift_retain();
          v325 = (char *)v210;
          swift_retain();
          v302 = v214;
          swift_retain();
          v220 = (void *)sub_25AF79500();
          v300 = (void *)v217;
          uint64_t v301 = v209;
          uint64_t v221 = sub_25AF79540();
          swift_release();

          *(void *)(v215 + 40) = v221;
          v338[0] = (id)v215;
          sub_25AF796F0();
          v299 = (uint8_t *)sub_25AF79510();
          swift_bridgeObjectRelease();
          uint64_t v222 = v320;
          v223 = v319;
          uint64_t v224 = v321;
          (*(void (**)(char *, void, uint64_t))(v320 + 104))(v319, *MEMORY[0x263F63098], v321);
          LOBYTE(v221) = sub_25AF79240();
          (*(void (**)(char *, uint64_t))(v222 + 8))(v223, v224);
          v225 = v330;
          if ((v221 & 1) != 0
            && v330[OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_didNotSpecifyTargetList] == 1)
          {
            id v226 = [v306 temporalEventTrigger];

            if (!v226)
            {
              id v227 = [v306 spatialEventTrigger];

              if (!v227)
              {
                id v228 = [v306 contactEventTrigger];

                if (!v228)
                {
                  v229 = v225;
                  v230 = &v225[OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_timeProvider];
                  uint64_t v231 = *(void *)&v225[OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_timeProvider
                                        + 24];
                  uint64_t v232 = v230[4];
                  __swift_project_boxed_opaque_existential_1(v230, v231);
                  v233 = v313;
                  (*(void (**)(uint64_t, uint64_t))(v232 + 8))(v231, v232);
                  v234 = self;
                  v235 = (void *)sub_25AF78ED0();
                  v236 = v310;
                  sub_25AF78FF0();
                  v237 = (void *)sub_25AF78FE0();
                  (*(void (**)(char *, uint64_t))(v311 + 8))(v236, v312);
                  id v238 = objc_msgSend(v234, sel_rem_dateComponentsWithDate_timeZone_isAllDay_, v235, v237, 0);

                  v239 = v316;
                  sub_25AF78DE0();

                  uint64_t v240 = sub_25AF78DF0();
                  if (v241)
                  {
                    _Block_release(v309);

                    __break(1u);
                    return;
                  }
                  uint64_t v242 = v240;
                  v243 = self;
                  objc_msgSend(v243, sel_nextThirdsHour_, objc_msgSend(v243, sel_nextThirdsHourFromHour_, v242));
                  sub_25AF78E00();
                  sub_25AF78E10();
                  sub_25AF78E20();
                  (*(void (**)(char *, uint64_t))(v314 + 8))(v233, v315);
                  uint64_t v244 = (uint64_t)v298;
                  sub_25AF54EBC((uint64_t)v298, &qword_26A4D5B30);
                  uint64_t v245 = v317;
                  v246 = v239;
                  uint64_t v247 = v318;
                  (*(void (**)(uint64_t, char *, uint64_t))(v317 + 32))(v244, v246, v318);
                  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v245 + 56))(v244, 0, 1, v247);
                  v225 = v229;
                }
              }
            }
          }
          sub_25AF54E58(v326, (uint64_t)v324, &qword_26A4D5B58);
          unint64_t v248 = (*(unsigned __int8 *)(v322 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v322 + 80);
          unint64_t v322 = (unint64_t)&v323[v248 + 7] & 0xFFFFFFFFFFFFFFF8;
          unint64_t v249 = (v322 + 15) & 0xFFFFFFFFFFFFFFF8;
          unint64_t v250 = (v249 + 15) & 0xFFFFFFFFFFFFFFF8;
          unint64_t v251 = (v250 + 15) & 0xFFFFFFFFFFFFFFF8;
          v323 = (char *)((v251 + 15) & 0xFFFFFFFFFFFFFFF8);
          unint64_t v252 = (unint64_t)(v323 + 15) & 0xFFFFFFFFFFFFFFF8;
          unint64_t v253 = (v252 + 15) & 0xFFFFFFFFFFFFFFF8;
          uint64_t v254 = swift_allocObject();
          v255 = v332;
          *(void *)(v254 + 16) = v225;
          *(void *)(v254 + 24) = v255;
          os_log_t v256 = v328;
          *(void *)(v254 + 32) = v305;
          *(void *)(v254 + 40) = v256;
          id v257 = v304;
          uint64_t v258 = v331;
          *(void *)(v254 + 48) = v304;
          *(void *)(v254 + 56) = v258;
          sub_25AF54B6C((uint64_t)v324, v254 + v248, &qword_26A4D5B58);
          *(void *)(v254 + v322) = v334;
          *(void *)(v254 + v249) = v327;
          *(void *)(v254 + v250) = v325;
          *(void *)(v254 + v251) = v302;
          v259 = (uint64_t (**)())(v254 + ((v253 + 15) & 0xFFFFFFFFFFFFFFF8));
          *(void *)&v323[v254] = v308;
          v260 = v306;
          *(void *)(v254 + v252) = v306;
          id v261 = v307;
          *(void *)(v254 + v253) = v307;
          v262 = (uint64_t (*)())v329;
          *v259 = sub_25AF54804;
          v259[1] = v262;
          v324 = (char *)v257;
          swift_retain();
          swift_retain();
          v323 = (char *)v261;
          swift_retain();
          v263 = v260;
          v264 = v332;
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          v265 = v330;
          v266 = v328;
          v267 = (void *)sub_25AF79500();
          sub_25AF79540();

          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();

          sub_25AF54EBC(v326, &qword_26A4D5B58);
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
LABEL_84:
          swift_release();
          return;
        }
        goto LABEL_25;
      }
      v330 = v274;
      id v276 = v338[0];
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      swift_willThrow();
      v338[0] = v276;
      id v180 = v276;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5BA0);
      sub_25AF48D94(0, &qword_26A4D5BA8);
      char v277 = swift_dynamicCast();
      uint64_t v329 = v25;
      if (v277)
      {

        v278 = v336;
        v279 = v302;
        id v280 = v278;
        v281 = v279;
        id v282 = v280;
        v283 = sub_25AF795A0();
        os_log_type_t v284 = sub_25AF797B0();
        if (os_log_type_enabled(v283, v284))
        {
          uint64_t v285 = swift_slowAlloc();
          v309 = a3;
          uint64_t v286 = v285;
          v287 = (void *)swift_slowAlloc();
          uint64_t v334 = swift_slowAlloc();
          uint64_t v335 = (uint64_t)v281;
          uint64_t v337 = v334;
          *(_DWORD *)uint64_t v286 = 138543618;
          os_log_t v328 = v283;
          v288 = v282;
          v289 = v281;
          sub_25AF799C0();
          void *v287 = v281;

          id v282 = v288;
          *(_WORD *)(v286 + 12) = 2082;
          uint64_t v335 = (uint64_t)v288;
          sub_25AF54D60();
          uint64_t v290 = sub_25AF79CB0();
          uint64_t v335 = sub_25AF772F0(v290, v291, &v337);
          sub_25AF799C0();

          swift_bridgeObjectRelease();
          os_log_t v292 = v328;
          _os_log_impl(&dword_25AF45000, v328, v284, "Smart List found and unable to fetch default list. {result: .failure, smartListID: %{public}@, error: %{public}s}", (uint8_t *)v286, 0x16u);
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5D80);
          swift_arrayDestroy();
          MEMORY[0x26115ACE0](v287, -1, -1);
          uint64_t v293 = v334;
          swift_arrayDestroy();
          MEMORY[0x26115ACE0](v293, -1, -1);
          uint64_t v294 = v286;
          a3 = v309;
          MEMORY[0x26115ACE0](v294, -1, -1);
        }
        else
        {
        }
        id v295 = v307;
        id v296 = v330;
        id v297 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0F968]), sel_initWithCode_userActivity_, 4, 0);
        (*((void (**)(const void *, id))a3 + 2))(a3, v297);

LABEL_87:
        (*(void (**)(char *, void *))(v331 + 8))(v325, v332);

        goto LABEL_83;
      }
    }
    else
    {
      id v304 = v61;
      uint64_t v329 = v25;
      id v179 = v338[0];
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      id v180 = (id)sub_25AF78E60();

      swift_willThrow();
    }
    v338[0] = v180;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5BA0);
    v181 = (void *)sub_25AF48D94(0, &qword_26A4D5BA8);
    swift_dynamicCast();
    v182 = v336;
    id v183 = v304;
    id v184 = v182;
    id v185 = v183;
    id v186 = v184;
    uint64_t v187 = sub_25AF795A0();
    os_log_type_t v188 = sub_25AF797B0();
    if (os_log_type_enabled(v187, v188))
    {
      uint64_t v189 = swift_slowAlloc();
      v309 = a3;
      uint64_t v190 = v189;
      uint64_t v191 = swift_slowAlloc();
      v333 = v181;
      v192 = (void *)v191;
      uint64_t v334 = swift_slowAlloc();
      uint64_t v335 = (uint64_t)v185;
      uint64_t v337 = v334;
      *(_DWORD *)uint64_t v190 = 138543618;
      id v193 = v185;
      sub_25AF799C0();
      void *v192 = v185;

      *(_WORD *)(v190 + 12) = 2082;
      uint64_t v335 = (uint64_t)v186;
      sub_25AF54D60();
      uint64_t v194 = sub_25AF79CB0();
      uint64_t v335 = sub_25AF772F0(v194, v195, &v337);
      sub_25AF799C0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25AF45000, v187, v188, "Error fetching smart list. {listID: %{public}@, error: %{public}s}", (uint8_t *)v190, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5D80);
      swift_arrayDestroy();
      MEMORY[0x26115ACE0](v192, -1, -1);
      uint64_t v196 = v334;
      swift_arrayDestroy();
      MEMORY[0x26115ACE0](v196, -1, -1);
      uint64_t v197 = v190;
      a3 = v309;
      MEMORY[0x26115ACE0](v197, -1, -1);
    }
    else
    {
    }
    id v270 = v307;
    id v271 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0F968]), sel_initWithCode_userActivity_, 4, 0);
    (*((void (**)(const void *, id))a3 + 2))(a3, v271);

    goto LABEL_87;
  }
LABEL_25:
  uint64_t v75 = v327;
  sub_25AF78F30();
  uint64_t v76 = (uint64_t)v75;
  swift_bridgeObjectRelease();
  uint64_t v77 = v331;
  id v78 = v75;
  uint64_t v79 = v332;
  if ((*(unsigned int (**)(char *, uint64_t, void *))(v331 + 48))(v78, 1, v332) != 1)
  {
    (*(void (**)(os_log_t, uint64_t, void *))(v77 + 32))(v328, v76, v79);
    v107 = self;
    v108 = (void *)sub_25AF78F40();
    id v109 = objc_msgSend(v107, sel_objectIDWithUUID_, v108);

    os_log_type_t v110 = *(void **)&a2[OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_store];
    v338[0] = 0;
    id v111 = objc_msgSend(v110, sel_fetchListWithObjectID_error_, v109, v338);
    id v112 = v338[0];
    if (v111)
    {
      unint64_t v95 = v111;
      id v113 = v112;
      v114 = sub_25AF795A0();
      os_log_type_t v115 = sub_25AF797D0();
      if (os_log_type_enabled(v114, v115))
      {
        v309 = a3;
        uint64_t v116 = swift_slowAlloc();
        v330 = a2;
        uint64_t v117 = (uint8_t *)v116;
        v333 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v117 = 138543362;
        id v118 = objc_msgSend(v95, sel_objectID);
        v119 = v95;
        uint64_t v120 = v40;
        id v121 = v118;
        v338[0] = v118;
        a3 = v309;
        sub_25AF799C0();
        uint64_t v122 = v333;
        void *v333 = v121;
        uint64_t v40 = v120;
        unint64_t v95 = v119;

        _os_log_impl(&dword_25AF45000, v114, v115, "Successfully fetched list {listID: %{public}@}", v117, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5D80);
        swift_arrayDestroy();
        id v42 = v307;
        MEMORY[0x26115ACE0](v122, -1, -1);
        v123 = v117;
        a2 = v330;
        MEMORY[0x26115ACE0](v123, -1, -1);
      }
      else
      {

        id v109 = v95;
      }

      (*(void (**)(os_log_t, void *))(v331 + 8))(v328, v332);
      v333 = 0;
      goto LABEL_52;
    }
    id v133 = v338[0];
    swift_bridgeObjectRelease();
    os_log_type_t v134 = (void *)sub_25AF78E60();

    swift_willThrow();
    v338[0] = v134;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5BA0);
    v135 = (void *)sub_25AF48D94(0, &qword_26A4D5BA8);
    swift_dynamicCast();
    uint64_t v136 = v336;
    id v137 = v109;
    id v138 = v136;
    id v139 = v137;
    id v140 = v138;
    uint64_t v141 = sub_25AF795A0();
    os_log_type_t v142 = sub_25AF797B0();
    if (os_log_type_enabled(v141, v142))
    {
      uint64_t v143 = swift_slowAlloc();
      v309 = a3;
      uint64_t v144 = v143;
      uint64_t v145 = swift_slowAlloc();
      v333 = v135;
      os_log_type_t v146 = (void *)v145;
      uint64_t v334 = swift_slowAlloc();
      uint64_t v335 = (uint64_t)v139;
      uint64_t v337 = v334;
      *(_DWORD *)uint64_t v144 = 138543618;
      uint64_t v329 = v25;
      id v147 = v139;
      sub_25AF799C0();
      *os_log_type_t v146 = v139;

      *(_WORD *)(v144 + 12) = 2082;
      uint64_t v335 = (uint64_t)v140;
      sub_25AF54D60();
      uint64_t v148 = sub_25AF79CB0();
      uint64_t v335 = sub_25AF772F0(v148, v149, &v337);
      id v42 = v307;
      sub_25AF799C0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25AF45000, v141, v142, "Unable to fetch list. {result: .failure, listID: %{public}@, error: %{public}s}", (uint8_t *)v144, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5D80);
      swift_arrayDestroy();
      MEMORY[0x26115ACE0](v146, -1, -1);
      uint64_t v150 = v334;
      swift_arrayDestroy();
      MEMORY[0x26115ACE0](v150, -1, -1);
      uint64_t v151 = v144;
      a3 = v309;
      MEMORY[0x26115ACE0](v151, -1, -1);
    }
    else
    {
    }
    v268 = v332;
    id v269 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0F968]), sel_initWithCode_userActivity_, 4, 0);
    (*((void (**)(const void *, id))a3 + 2))(a3, v269);

    (*(void (**)(os_log_t, void *))(v331 + 8))(v328, v268);
    id v166 = v338[0];
LABEL_82:

LABEL_83:
    swift_release();
    goto LABEL_84;
  }
  sub_25AF54EBC(v76, &qword_26A4D5B60);
LABEL_27:
  uint64_t v80 = v40;
  uint64_t v81 = *(void **)&a2[OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_store];
  id v82 = sub_25AF4F524(v81);
  if (v82)
  {
    uint64_t v83 = v82;
    v330 = a2;
    id v84 = objc_msgSend(v42, sel_title);
    id v85 = objc_msgSend(v84, sel_spokenPhrase);

    if (!v85)
    {
      sub_25AF79640();
      id v85 = (id)sub_25AF79610();
      swift_bridgeObjectRelease();
    }
    id v86 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F62F38]), sel_initWithStore_, v81);
    v333 = objc_msgSend(v86, sel_updateAccount_, v83);
    id v87 = objc_msgSend(v86, sel_addListWithName_toAccountChangeItem_, v85);

    v338[0] = 0;
    unsigned int v88 = objc_msgSend(v86, sel_saveSynchronouslyWithError_, v338);
    id v89 = v338[0];
    if (v88)
    {
      v309 = a3;
      id v90 = v338[0];
      id v91 = objc_msgSend(v87, sel_objectID);
      v338[0] = 0;
      id v92 = objc_msgSend(v81, sel_fetchListWithObjectID_error_, v91, v338);

      id v89 = v338[0];
      if (v92)
      {
        v332 = v86;
        uint64_t v329 = v25;
        id v93 = v92;
        id v94 = v83;
        unint64_t v95 = v93;
        id v96 = v94;
        id v97 = v89;
        id v98 = sub_25AF795A0();
        os_log_type_t v99 = sub_25AF797D0();
        int v100 = v99;
        if (os_log_type_enabled(v98, v99))
        {
          uint64_t v101 = swift_slowAlloc();
          uint64_t v102 = swift_slowAlloc();
          LODWORD(v331) = v100;
          uint64_t v103 = (void *)v102;
          *(_DWORD *)uint64_t v101 = 138543618;
          os_log_t v328 = v98;
          id v104 = objc_msgSend(v95, sel_objectID);
          v338[0] = v104;
          sub_25AF799C0();
          *uint64_t v103 = v104;

          *(_WORD *)(v101 + 12) = 2112;
          v338[0] = v96;
          id v105 = v96;
          sub_25AF799C0();
          v103[1] = v83;

          os_log_t v106 = v328;
          _os_log_impl(&dword_25AF45000, v328, (os_log_type_t)v331, "Successfully created new list {listID: %{public}@, account: %@}", (uint8_t *)v101, 0x16u);
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5D80);
          swift_arrayDestroy();
          MEMORY[0x26115ACE0](v103, -1, -1);
          MEMORY[0x26115ACE0](v101, -1, -1);
        }
        else
        {
        }
        v333 = 0;
        uint64_t v25 = v329;
        a3 = v309;
        id v42 = v307;
        a2 = v330;
        uint64_t v40 = v80;
        goto LABEL_52;
      }
      a3 = v309;
    }
    id v152 = v89;
    swift_bridgeObjectRelease();
    uint64_t v153 = sub_25AF78E60();

    swift_willThrow();
    id v154 = v83;
    v155 = v87;
    os_log_type_t v156 = sub_25AF795A0();
    os_log_type_t v157 = sub_25AF797B0();
    if (os_log_type_enabled(v156, v157))
    {
      uint64_t v158 = swift_slowAlloc();
      uint64_t v159 = swift_slowAlloc();
      uint64_t v329 = v25;
      id v160 = (void *)v159;
      *(_DWORD *)uint64_t v158 = 138543618;
      v332 = v86;
      id v161 = [v155 objectID];
      v309 = a3;
      id v162 = v161;
      v338[0] = v161;
      uint64_t v331 = (uint64_t)v83;
      uint64_t v334 = v153;
      sub_25AF799C0();
      *id v160 = v162;

      *(_WORD *)(v158 + 12) = 2112;
      v338[0] = v154;
      id v163 = v155;
      id v164 = v154;
      uint64_t v153 = v334;
      a3 = v309;
      id v86 = v332;
      sub_25AF799C0();
      v160[1] = v331;

      v155 = v163;
      _os_log_impl(&dword_25AF45000, v156, v157, "Error creating new list. {listID: %{public}@, account: %@, result: .failure}", (uint8_t *)v158, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5D80);
      swift_arrayDestroy();
      MEMORY[0x26115ACE0](v160, -1, -1);
      MEMORY[0x26115ACE0](v158, -1, -1);
    }
    else
    {

      os_log_type_t v156 = v155;
    }

    id v165 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0F968]), sel_initWithCode_userActivity_, 4, 0);
    (*((void (**)(const void *, id))a3 + 2))(a3, v165);

    id v166 = (id)v153;
    goto LABEL_82;
  }
  swift_bridgeObjectRelease();
  v124 = v306;
  os_log_t v125 = sub_25AF795A0();
  os_log_type_t v126 = sub_25AF797B0();
  if (os_log_type_enabled(v125, v126))
  {
    v127 = (uint8_t *)swift_slowAlloc();
    uint64_t v128 = swift_slowAlloc();
    v309 = a3;
    uint64_t v129 = (void *)v128;
    *(_DWORD *)v127 = 138412290;
    v338[0] = v124;
    uint64_t v130 = v124;
    id v42 = v307;
    sub_25AF799C0();
    *uint64_t v129 = v124;

    _os_log_impl(&dword_25AF45000, v125, v126, "Unable to create list because there is no default account. {intent: %@, result: .failureRequiringAppLaunch}", v127, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5D80);
    swift_arrayDestroy();
    v131 = v129;
    a3 = v309;
    MEMORY[0x26115ACE0](v131, -1, -1);
    MEMORY[0x26115ACE0](v127, -1, -1);
  }
  else
  {

    os_log_t v125 = v124;
  }

  id v132 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0F968]), sel_initWithCode_userActivity_, 5, 0);
  (*((void (**)(const void *, id))a3 + 2))(a3, v132);
  swift_release();
  swift_release();
}

uint64_t sub_25AF547CC()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25AF54804()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_25AF54818()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_25AF54850(void **a1)
{
  sub_25AF4C654(a1, v1);
}

uint64_t sub_25AF5486C()
{
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_25AF548B4(void **a1)
{
  return sub_25AF4C6B8(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_25AF548D4()
{
  uint64_t v1 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5B58) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 64) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);

  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v5 = sub_25AF791C0();
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))((char *)v0 + v3, 1, v5))
  {
    uint64_t v6 = sub_25AF79190();
    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48))((char *)v0 + v3, 1, v6)&& !swift_getEnumCaseMultiPayload())
    {
      uint64_t v7 = sub_25AF78F20();
      (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))((char *)v0 + v3, v7);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  unint64_t v8 = (((((((((((v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
        + 15) & 0xFFFFFFFFFFFFFFF8)
      + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v9 = (v8 + 15) & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  return MEMORY[0x270FA0238](v0, ((v9 + 15) & 0xFFFFFFFFFFFFFFF8) + 16, v2 | 7);
}

uint64_t sub_25AF54B6C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void sub_25AF54BD0(uint64_t a1)
{
  uint64_t v3 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5B58) - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v9 = (v8 + 15) & 0xFFFFFFFFFFFFFFF8;
  sub_25AF4C924(a1, *(void *)(v1 + 16), *(void **)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56), v1 + v4, *(void *)(v1 + v5), *(void *)(v1 + v6), *(void *)(v1 + v7), *(void *)(v1 + v8), *(void *)(v1 + v9), *(void **)(v1 + ((v9 + 15) & 0xFFFFFFFFFFFFFFF8)), *(void *)(v1 + ((((v9 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)), *(void (**)(void))(v1+ ((((((v9 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)));
}

uint64_t sub_25AF54CFC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_25AF54D60()
{
  unint64_t result = qword_26A4D5BB0;
  if (!qword_26A4D5BB0)
  {
    sub_25AF48D94(255, &qword_26A4D5BA8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4D5BB0);
  }
  return result;
}

void sub_25AF54DC8(void **a1@<X0>, void *a2@<X8>)
{
  sub_25AF4D1E4(a1, *(void **)(v2 + 24), *(void **)(v2 + 32), *(void **)(v2 + 40), *(void (**)(char *, char *, uint64_t))(v2 + 48), *(void *)(v2 + 56), *(NSObject **)(v2 + 64), a2, *(void ***)(v2 + 72), *(void **)(v2 + 80), *(void **)(v2 + 88), *(id **)(v2 + 96), *(id *)(v2 + 104));
}

uint64_t sub_25AF54E10(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25AF54E58(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25AF54EBC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25AF54F18(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25AF791C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25AF54F7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25AF791C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25AF54FE0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25AF55040(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5B80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_25AF550A8(void *a1)
{
  sub_25AF4C160(a1, *(void (**)(void))(v1 + 16));
}

void sub_25AF550C4(void *a1)
{
  sub_25AF4C364(a1, *(void (**)(id))(v1 + 16));
}

void sub_25AF550CC(uint64_t a1)
{
  sub_25AF4BFEC(a1, *(void *)(v1 + 16));
}

uint64_t sub_25AF550D4()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

void sub_25AF5512C(uint64_t a1)
{
  sub_25AF49C08(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void (**)(void))(v1 + 48));
}

uint64_t sub_25AF5513C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_25AF5517C(uint64_t a1)
{
  sub_25AF48FEC(a1, *(void *)(v1 + 16), *(void (**)(void))(v1 + 24));
}

unint64_t sub_25AF55188()
{
  unint64_t result = qword_26A4D5C30;
  if (!qword_26A4D5C30)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A4D5C28);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4D5C30);
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

uint64_t sub_25AF552A8()
{
  uint64_t v0 = sub_25AF795B0();
  __swift_allocate_value_buffer(v0, qword_26A4D5CA0);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_26A4D5CA0);
  if (qword_26A4D5900 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_26A4D6660);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

void sub_25AF55370(unint64_t a1, void (*a2)(id))
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = (char *)sub_25AF79C10();
    swift_bridgeObjectRelease();
    if ((uint64_t)v4 > 0) {
      goto LABEL_3;
    }
LABEL_30:
    if (qword_26A4D58E8 != -1) {
      swift_once();
    }
    uint64_t v34 = sub_25AF795B0();
    __swift_project_value_buffer(v34, (uint64_t)qword_26A4D5CA0);
    uint64_t v35 = sub_25AF795A0();
    os_log_type_t v36 = sub_25AF797D0();
    if (os_log_type_enabled(v35, v36))
    {
      id v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v37 = 0;
      _os_log_impl(&dword_25AF45000, v35, v36, "No reminder matches with the term {result: .unsupported}", v37, 2u);
      MEMORY[0x26115ACE0](v37, -1, -1);
    }

    sub_25AF48D94(0, (unint64_t *)&unk_26A4D5D90);
    id v32 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupported);
    goto LABEL_35;
  }
  uint64_t v4 = *(char **)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if ((uint64_t)v4 <= 0) {
    goto LABEL_30;
  }
LABEL_3:
  if (v4 == (char *)1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      MEMORY[0x26115A540](0, a1);
    }
    else
    {
      if (!*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        goto LABEL_38;
      }
      id v5 = *(id *)(a1 + 32);
    }
    sub_25AF48D94(0, &qword_26A4D5B50);
    uint64_t v4 = (char *)sub_25AF79900();
    if (qword_26A4D58E8 == -1)
    {
LABEL_8:
      uint64_t v6 = sub_25AF795B0();
      __swift_project_value_buffer(v6, (uint64_t)qword_26A4D5CA0);
      swift_bridgeObjectRetain_n();
      unint64_t v7 = sub_25AF795A0();
      os_log_type_t v8 = sub_25AF797D0();
      if (os_log_type_enabled(v7, v8))
      {
        unint64_t v9 = (uint8_t *)swift_slowAlloc();
        uint64_t v10 = (void *)swift_slowAlloc();
        *(_DWORD *)unint64_t v9 = 138412290;
        if ((a1 & 0xC000000000000001) != 0) {
          id v11 = (id)MEMORY[0x26115A540](0, a1);
        }
        else {
          id v11 = *(id *)(a1 + 32);
        }
        id v33 = v11;
        uint64_t v38 = (uint64_t)v11;
        sub_25AF799C0();
        *uint64_t v10 = v33;
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_25AF45000, v7, v8, "One reminder matches with the term {result: .success(%@)}", v9, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5D80);
        swift_arrayDestroy();
        MEMORY[0x26115ACE0](v10, -1, -1);
        MEMORY[0x26115ACE0](v9, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      id v32 = objc_msgSend(self, sel_successWithResolvedTask_, v4);

      goto LABEL_35;
    }
LABEL_38:
    swift_once();
    goto LABEL_8;
  }
  if (qword_26A4D58E8 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_25AF795B0();
  __swift_project_value_buffer(v12, (uint64_t)qword_26A4D5CA0);
  uint64_t v13 = sub_25AF795A0();
  os_log_type_t v14 = sub_25AF797D0();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl(&dword_25AF45000, v13, v14, "Multiple reminders match with the term {result: .disambiguation}", v15, 2u);
    MEMORY[0x26115ACE0](v15, -1, -1);
  }

  swift_bridgeObjectRetain_n();
  uint64_t v16 = sub_25AF795A0();
  os_log_type_t v17 = sub_25AF797D0();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    uint64_t v38 = v19;
    *(_DWORD *)uint64_t v18 = 136315138;
    uint64_t v20 = sub_25AF48D94(0, &qword_26A4D60C0);
    uint64_t v21 = swift_bridgeObjectRetain();
    uint64_t v22 = MEMORY[0x26115A160](v21, v20);
    unint64_t v24 = v23;
    swift_bridgeObjectRelease();
    sub_25AF772F0(v22, v24, &v38);
    sub_25AF799C0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25AF45000, v16, v17, "Matching reminders: %s", v18, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x26115ACE0](v19, -1, -1);
    MEMORY[0x26115ACE0](v18, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v38 = MEMORY[0x263F8EE78];
  sub_25AF79B10();
  sub_25AF48D94(0, &qword_26A4D5B50);
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v25 = 0;
    do
    {
      uint64_t v26 = v25 + 1;
      MEMORY[0x26115A540]();
      sub_25AF79900();
      sub_25AF79AF0();
      sub_25AF79B20();
      sub_25AF79B30();
      sub_25AF79B00();
      uint64_t v25 = v26;
    }
    while (v4 != v26);
  }
  else
  {
    uint64_t v27 = (void **)(a1 + 32);
    do
    {
      id v28 = *v27++;
      id v29 = v28;
      sub_25AF79900();
      sub_25AF79AF0();
      sub_25AF79B20();
      sub_25AF79B30();
      sub_25AF79B00();
      --v4;
    }
    while (v4);
  }
  uint64_t v30 = self;
  os_log_type_t v31 = (void *)sub_25AF796C0();
  swift_bridgeObjectRelease();
  id v32 = objc_msgSend(v30, sel_disambiguationWithTasksToDisambiguate_, v31);

LABEL_35:
  a2(v32);
}

void sub_25AF55B30(void **a1, uint64_t a2, id a3, uint64_t a4, uint64_t a5, void *a6, void (*a7)(void))
{
  uint64_t v9 = a4;
  id v10 = a3;
  v52[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v12 = *a1;
  if (*a1)
  {
    uint64_t v13 = qword_26A4D58E8;
    id v14 = v12;
    if (v13 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_25AF795B0();
    __swift_project_value_buffer(v15, (uint64_t)qword_26A4D5CA0);
    id v16 = v14;
    os_log_type_t v17 = sub_25AF795A0();
    os_log_type_t v18 = sub_25AF797D0();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      os_log_type_t v48 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v19 = 138412290;
      uint64_t v47 = v19 + 4;
      v52[0] = v16;
      id v20 = v16;
      sub_25AF799C0();
      *os_log_type_t v48 = v12;

      _os_log_impl(&dword_25AF45000, v17, v18, "Populating contactRepresentation {contactRepresentation: %@}", v19, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5D80);
      swift_arrayDestroy();
      MEMORY[0x26115ACE0](v48, -1, -1);
      MEMORY[0x26115ACE0](v19, -1, -1);
    }
    else
    {
    }
    uint64_t v9 = a4;
    id v21 = v16;
    sub_25AF790B0();

    id v10 = a3;
  }
  v52[0] = 0;
  unsigned int v22 = objc_msgSend(v10, sel_saveSynchronouslyWithError_, v52, v47);
  id v23 = v52[0];
  if (!v22) {
    goto LABEL_11;
  }
  id v24 = v52[0];
  sub_25AF79060();
  swift_retain();
  sub_25AF79050();
  swift_release();
  uint64_t v25 = *(void **)(v9 + OBJC_IVAR____TtC25RemindersIntentsFramework32TTRSetTaskAttributeIntentHandler_store);
  v52[0] = 0;
  id v26 = objc_msgSend(v25, sel_fetchReminderWithObjectID_error_, a5, v52);
  id v23 = v52[0];
  if (v26)
  {
    uint64_t v27 = v26;
    id v28 = objc_allocWithZone(MEMORY[0x263F0FF30]);
    id v29 = v23;
    id v30 = objc_msgSend(v28, sel_initWithCode_userActivity_, 3, 0);
    sub_25AF48D94(0, &qword_26A4D5B50);
    id v31 = v27;
    id v32 = (void *)sub_25AF79900();
    objc_msgSend(v30, sel_setModifiedTask_, v32);

    v52[0] = a6;
    id v33 = objc_msgSend(*(id *)(a2 + 16), sel_accountCapabilities);
    sub_25AF48D94(0, &qword_26A4D5D50);
    uint64_t v34 = sub_25AF79230();

    objc_msgSend(v30, sel_setWarnings_, v34);
    ((void (*)(id))a7)(v30);
  }
  else
  {
LABEL_11:
    id v35 = v23;
    os_log_type_t v36 = (void *)sub_25AF78E60();

    swift_willThrow();
    if (qword_26A4D58E8 != -1) {
      swift_once();
    }
    uint64_t v37 = sub_25AF795B0();
    __swift_project_value_buffer(v37, (uint64_t)qword_26A4D5CA0);
    id v38 = v36;
    id v39 = v36;
    uint64_t v40 = sub_25AF795A0();
    os_log_type_t v41 = sub_25AF797B0();
    if (os_log_type_enabled(v40, v41))
    {
      id v42 = (uint8_t *)swift_slowAlloc();
      char v43 = (void *)swift_slowAlloc();
      v52[0] = v43;
      *(_DWORD *)id v42 = 136315138;
      swift_getErrorValue();
      uint64_t v44 = sub_25AF79CA0();
      sub_25AF772F0(v44, v45, (uint64_t *)v52);
      sub_25AF799C0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_25AF45000, v40, v41, "Error saving saveRequest {error: %s}", v42, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x26115ACE0](v43, -1, -1);
      MEMORY[0x26115ACE0](v42, -1, -1);
    }
    else
    {
    }
    id v46 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FF30]), sel_initWithCode_userActivity_, 4, 0);
    a7();
  }
}

void sub_25AF560FC(void *a1, int a2, void *a3, void *aBlock, void (*a5)(id, id, void *))
{
  os_log_type_t v8 = _Block_copy(aBlock);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a1;
  a5(v9, v10, v8);
  _Block_release(v8);
  _Block_release(v8);
}

id sub_25AF561C0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TTRSetTaskAttributeIntentHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for TTRSetTaskAttributeIntentHandler()
{
  return self;
}

_UNKNOWN **sub_25AF56294()
{
  return &off_2708A54F0;
}

_UNKNOWN **sub_25AF562A0()
{
  return &off_2708A4C50;
}

_UNKNOWN **sub_25AF562AC()
{
  return &off_2708A5678;
}

void sub_25AF562B8(void *a1, uint64_t a2, void (**a3)(void, void))
{
  uint64_t v6 = sub_25AF792A0();
  uint64_t v45 = *(void *)(v6 - 8);
  uint64_t v46 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v44 = (BOOL *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = swift_allocObject();
  *(void *)(v47 + 16) = a3;
  _Block_copy(a3);
  if (qword_26A4D58E8 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_25AF795B0();
  uint64_t v9 = __swift_project_value_buffer(v8, (uint64_t)qword_26A4D5CA0);
  id v10 = a1;
  id v11 = sub_25AF795A0();
  os_log_type_t v12 = sub_25AF797D0();
  unint64_t v13 = 0x265487000uLL;
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v43 = v9;
    uint64_t v15 = (uint8_t *)v14;
    unint64_t v42 = swift_slowAlloc();
    unint64_t v49 = v42;
    *(_DWORD *)uint64_t v15 = 136315138;
    id v16 = a3;
    uint64_t v17 = a2;
    id v18 = objc_msgSend(v10, sel_targetTask, v15 + 4);
    uint64_t v48 = (uint64_t)v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5D58);
    uint64_t v19 = sub_25AF799B0();
    unint64_t v21 = v20;

    a2 = v17;
    a3 = v16;
    uint64_t v48 = sub_25AF772F0(v19, v21, (uint64_t *)&v49);
    sub_25AF799C0();

    unint64_t v13 = 0x265487000;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25AF45000, v11, v12, "SiriKit asked for resolving target task {targetTask: %s}", v15, 0xCu);
    uint64_t v22 = v42;
    swift_arrayDestroy();
    MEMORY[0x26115ACE0](v22, -1, -1);
    MEMORY[0x26115ACE0](v15, -1, -1);
  }
  else
  {
  }
  id v23 = [v10 *(SEL *)(v13 + 2552)];
  if (v23)
  {
    id v24 = v23;
    BOOL v25 = objc_msgSend(v10, sel_status) == (id)1;
    uint64_t v27 = v44;
    uint64_t v26 = v45;
    *uint64_t v44 = v25;
    uint64_t v28 = v46;
    (*(void (**)(BOOL *, void, uint64_t))(v26 + 104))(v27, *MEMORY[0x263F630F0], v46);
    uint64_t v29 = *(void *)(a2 + OBJC_IVAR____TtC25RemindersIntentsFramework32TTRSetTaskAttributeIntentHandler_dataSource + 32);
    unint64_t v42 = *(void *)(a2 + OBJC_IVAR____TtC25RemindersIntentsFramework32TTRSetTaskAttributeIntentHandler_dataSource + 24);
    uint64_t v43 = v29;
    os_log_type_t v41 = __swift_project_boxed_opaque_existential_1((void *)(a2 + OBJC_IVAR____TtC25RemindersIntentsFramework32TTRSetTaskAttributeIntentHandler_dataSource), v42);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5980);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_25AF7A510;
    *(void *)(inited + 32) = v24;
    unint64_t v49 = inited;
    sub_25AF796F0();
    unint64_t v31 = v49;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A4D5DA0);
    unint64_t v32 = (*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
    uint64_t v33 = swift_allocObject();
    *(_OWORD *)(v33 + 16) = xmmword_25AF7A830;
    (*(void (**)(unint64_t, BOOL *, uint64_t))(v26 + 16))(v33 + v32, v27, v28);
    uint64_t v34 = swift_allocObject();
    uint64_t v35 = v47;
    *(void *)(v34 + 16) = sub_25AF54804;
    *(void *)(v34 + 24) = v35;
    id v36 = v24;
    swift_retain();
    sub_25AF5DA28(v31, v33, (void (*)(uint64_t))sub_25AF57F88, v34, v42, v43);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();

    (*(void (**)(BOOL *, uint64_t))(v26 + 8))(v27, v28);
    swift_release();
  }
  else
  {
    uint64_t v37 = sub_25AF795A0();
    os_log_type_t v38 = sub_25AF797B0();
    if (os_log_type_enabled(v37, v38))
    {
      id v39 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v39 = 0;
      _os_log_impl(&dword_25AF45000, v37, v38, "INSetTaskAttributeIntent contains nil targetTask, returning INTask.disambiguateWithIncompleteReminders", v39, 2u);
      MEMORY[0x26115ACE0](v39, -1, -1);
    }

    sub_25AF48D94(0, &qword_26A4D5B50);
    sub_25AF48D94(0, (unint64_t *)&unk_26A4D5D90);
    uint64_t v40 = (void *)sub_25AF798B0();
    ((void (**)(void, void *))a3)[2](a3, v40);
    swift_release();
  }
}

uint64_t sub_25AF567FC(void *a1)
{
  id v2 = objc_msgSend(a1, sel_contactEventTrigger);

  if (v2) {
    return 0;
  }
  if (objc_msgSend(a1, sel_priority)) {
    return 0;
  }
  id v3 = objc_msgSend(a1, sel_spatialEventTrigger);

  if (v3) {
    return 0;
  }
  if (objc_msgSend(a1, sel_status)) {
    return 0;
  }
  id v4 = objc_msgSend(a1, sel_taskTitle);

  if (v4) {
    return 0;
  }
  id v5 = objc_msgSend(a1, sel_temporalEventTrigger);
  if (v5)
  {

    return 0;
  }
  return 1;
}

void sub_25AF568D8(void *a1, uint64_t a2)
{
  if (qword_26A4D58E8 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25AF795B0();
  __swift_project_value_buffer(v4, (uint64_t)qword_26A4D5CA0);
  id v5 = a1;
  uint64_t v6 = sub_25AF795A0();
  os_log_type_t v7 = sub_25AF797D0();
  unint64_t v8 = 0x265487000uLL;
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v33 = a2;
    uint64_t v10 = swift_slowAlloc();
    uint64_t v34 = v10;
    *(_DWORD *)uint64_t v9 = 136315138;
    id v11 = objc_msgSend(v5, sel_taskTitle);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5D88);
    uint64_t v12 = sub_25AF799B0();
    unint64_t v14 = v13;

    uint64_t v15 = v12;
    unint64_t v8 = 0x265487000;
    sub_25AF772F0(v15, v14, (uint64_t *)&v34);
    sub_25AF799C0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25AF45000, v6, v7, "SiriKit asked for resolving task title {taskTitle: %s}", v9, 0xCu);
    swift_arrayDestroy();
    uint64_t v16 = v10;
    a2 = v33;
    MEMORY[0x26115ACE0](v16, -1, -1);
    MEMORY[0x26115ACE0](v9, -1, -1);
  }
  else
  {
  }
  id v17 = [v5 *(SEL *)(v8 + 3080)];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = v17;
    unint64_t v20 = sub_25AF795A0();
    os_log_type_t v21 = sub_25AF797D0();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      id v23 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v22 = 138412290;
      uint64_t v34 = v19;
      id v24 = v19;
      sub_25AF799C0();
      *id v23 = v18;

      _os_log_impl(&dword_25AF45000, v20, v21, "Resolving TaskTitle, got new task title, returning success {taskTitle: %@}", v22, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5D80);
      swift_arrayDestroy();
      MEMORY[0x26115ACE0](v23, -1, -1);
      MEMORY[0x26115ACE0](v22, -1, -1);
    }
    else
    {

      unint64_t v20 = v19;
    }

    id v31 = objc_msgSend(self, sel_successWithResolvedString_, v19);
    (*(void (**)(uint64_t, id))(a2 + 16))(a2, v31);
  }
  else
  {
    char v25 = sub_25AF567FC(v5);
    uint64_t v26 = sub_25AF795A0();
    os_log_type_t v27 = sub_25AF797D0();
    BOOL v28 = os_log_type_enabled(v26, v27);
    if (v25)
    {
      if (v28)
      {
        uint64_t v29 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v29 = 0;
        _os_log_impl(&dword_25AF45000, v26, v27, "Resolving TaskTitle, nothing to do, returning .needsValue()", v29, 2u);
        MEMORY[0x26115ACE0](v29, -1, -1);
      }

      sub_25AF48D94(0, &qword_26A4D5B20);
      id v30 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_needsValue);
    }
    else
    {
      if (v28)
      {
        unint64_t v32 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v32 = 0;
        _os_log_impl(&dword_25AF45000, v26, v27, "Resolving TaskTitle, no title, other stuff to do, returning .notRequired()", v32, 2u);
        MEMORY[0x26115ACE0](v32, -1, -1);
      }

      sub_25AF48D94(0, &qword_26A4D5B20);
      id v30 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_notRequired);
    }
    id v31 = v30;
    (*(void (**)(uint64_t, id))(a2 + 16))(a2, v31);
  }
}

void sub_25AF56D98(void *a1, char *a2, const void *a3)
{
  id v139 = a2;
  uint64_t v5 = sub_25AF791C0();
  uint64_t v128 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v126 = (uint64_t)&v117 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5B58);
  MEMORY[0x270FA5388](v7 - 8);
  v131 = (char *)&v117 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v135 = (uint64_t)&v117 - v10;
  uint64_t v134 = sub_25AF78E40();
  uint64_t v133 = *(void *)(v134 - 8);
  MEMORY[0x270FA5388](v134);
  id v132 = (char *)&v117 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5B30);
  MEMORY[0x270FA5388](v12 - 8);
  v127 = (char *)&v117 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v130 = (uint64_t)&v117 - v15;
  MEMORY[0x270FA5388](v16);
  id v18 = (char *)&v117 - v17;
  uint64_t v19 = sub_25AF795B0();
  uint64_t v20 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  v124 = (char *)&v117 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  uint64_t v122 = (char *)&v117 - v23;
  MEMORY[0x270FA5388](v24);
  uint64_t v26 = (char *)&v117 - v25;
  uint64_t v27 = swift_allocObject();
  *(void *)(v27 + 16) = a3;
  id v137 = a3;
  _Block_copy(a3);
  if (qword_26A4D58E8 != -1) {
    swift_once();
  }
  uint64_t v28 = __swift_project_value_buffer(v19, (uint64_t)qword_26A4D5CA0);
  uint64_t v29 = *(void (**)(char *, uint64_t, uint64_t))(v20 + 16);
  uint64_t v121 = v20 + 16;
  uint64_t v120 = v29;
  v29(v26, v28, v19);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5B68);
  uint64_t v30 = v19;
  uint64_t inited = swift_initStackObject();
  long long v125 = xmmword_25AF7A830;
  *(_OWORD *)(inited + 16) = xmmword_25AF7A830;
  *(void *)(inited + 32) = 0x746E65746E69;
  *(void *)(inited + 40) = 0xE600000000000000;
  *(void *)(inited + 72) = sub_25AF48D94(0, &qword_26A4D5D50);
  *(void *)(inited + 48) = a1;
  id v32 = a1;
  sub_25AF6026C(inited);
  sub_25AF57F94();
  swift_bridgeObjectRelease();
  uint64_t v33 = *(void (**)(char *, uint64_t))(v20 + 8);
  uint64_t v123 = v30;
  v33(v26, v30);
  uint64_t v34 = v32;
  uint64_t v136 = v28;
  uint64_t v35 = sub_25AF795A0();
  os_log_type_t v36 = sub_25AF797D0();
  BOOL v37 = os_log_type_enabled(v35, v36);
  uint64_t v129 = v5;
  if (v37)
  {
    uint64_t v38 = swift_slowAlloc();
    id v138 = (char *)v27;
    id v39 = (uint8_t *)v38;
    uint64_t v40 = (void *)swift_slowAlloc();
    *(_DWORD *)id v39 = 138412290;
    v140[0] = (uint64_t)v34;
    os_log_type_t v41 = v18;
    unint64_t v42 = v34;
    sub_25AF799C0();
    *uint64_t v40 = v34;

    id v18 = v41;
    _os_log_impl(&dword_25AF45000, v35, v36, "SiriKit asked for handling set task attribute intent {intent: %@}", v39, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5D80);
    swift_arrayDestroy();
    MEMORY[0x26115ACE0](v40, -1, -1);
    uint64_t v43 = v39;
    uint64_t v27 = (uint64_t)v138;
    MEMORY[0x26115ACE0](v43, -1, -1);
  }
  else
  {

    uint64_t v35 = v34;
  }

  id v44 = [v34 targetTask];
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = *(void *)&v139[OBJC_IVAR____TtC25RemindersIntentsFramework32TTRSetTaskAttributeIntentHandler_store];
    uint64_t v47 = (void *)sub_25AF798D0();

    if (v47)
    {
      id v119 = objc_msgSend(v47, sel_objectID);
      id v48 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F62F38]), sel_initWithStore_, v46);
      sub_25AF79160();
      uint64_t v141 = (uint64_t)v47;
      id v49 = v48;
      id v118 = v47;
      id v117 = v49;
      sub_25AF79090();
      uint64_t v50 = v140[0];
      id v51 = [v34 taskTitle];
      if (v51)
      {
        os_log_type_t v52 = v51;
        id v53 = objc_msgSend(v51, sel_spokenPhrase);
        sub_25AF79640();
        uint64_t v54 = v34;

        id v55 = objc_allocWithZone(MEMORY[0x263F086A0]);
        unint64_t v56 = (void *)sub_25AF79610();
        swift_bridgeObjectRelease();
        id v57 = objc_msgSend(v55, sel_initWithString_, v56);

        sub_25AF79120();
        uint64_t v34 = v54;
      }
      id v58 = [v34 status];
      uint64_t v59 = v134;
      uint64_t v60 = (uint64_t)v131;
      if (v58)
      {
        if (v58 != (id)1 && v58 != (id)2)
        {
          v120(v122, v136, v123);
          uint64_t v113 = MEMORY[0x263F8EE78];
          sub_25AF6026C(MEMORY[0x263F8EE78]);
          sub_25AF6026C(v113);
          swift_release();
          _Block_release(v137);
          v114 = "unknown status";
          uint64_t v115 = 14;
          goto LABEL_48;
        }
        sub_25AF79140();
      }
      id v72 = objc_msgSend(*(id *)(v50 + 16), sel_accountCapabilities);
      unsigned int v73 = objc_msgSend(v72, sel_supportsFlagged);

      if (!v73 || (id v74 = [v34 priority]) == 0)
      {
LABEL_24:
        id v75 = [v34 spatialEventTrigger];
        uint64_t v76 = v133;
        if (v75)
        {
          uint64_t v77 = v75;
          id v78 = v34;
          sub_25AF48D94(0, (unint64_t *)&unk_26A4D5D70);
          id v79 = v77;
          uint64_t v80 = sub_25AF79880();
          if (v80)
          {
            uint64_t v81 = (void *)v80;
            MEMORY[0x261159B50]();
          }
          sub_25AF48D94(0, (unint64_t *)&unk_26A4D5B90);
          id v82 = v79;
          uint64_t v83 = sub_25AF79870();
          if (v83)
          {
            id v84 = (void *)v83;
            MEMORY[0x261159B40]();

            id v82 = v84;
          }
          uint64_t v34 = v78;
        }
        id v85 = [v34 temporalEventTrigger];
        if (v85)
        {
          id v86 = v85;
          sub_25AF79850();
        }
        else
        {
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v76 + 56))(v18, 1, 1, v59);
        }
        uint64_t v87 = v130;
        sub_25AF54E58((uint64_t)v18, v130, &qword_26A4D5B30);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v76 + 48))(v87, 1, v59) == 1)
        {
          unsigned int v88 = &qword_26A4D5B30;
          uint64_t v89 = v87;
        }
        else
        {
          uint64_t v90 = v87;
          id v91 = v132;
          (*(void (**)(char *, uint64_t, uint64_t))(v76 + 32))(v132, v90, v59);
          uint64_t v92 = (uint64_t)v127;
          (*(void (**)(char *, char *, uint64_t))(v76 + 16))(v127, v91, v59);
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v76 + 56))(v92, 0, 1, v59);
          sub_25AF790F0();
          sub_25AF54EBC(v92, &qword_26A4D5B30);
          if ([v34 temporalEventTrigger])
          {
            sub_25AF54CFC((uint64_t)&v139[OBJC_IVAR____TtC25RemindersIntentsFramework32TTRSetTaskAttributeIntentHandler_timeProvider], (uint64_t)v140);
            sub_25AF791B0();
            uint64_t v93 = v129;
            uint64_t v94 = v128;
          }
          else
          {
            uint64_t v94 = v128;
            uint64_t v93 = v129;
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v128 + 56))(v135, 1, 1, v129);
          }
          sub_25AF54E58(v135, v60, &qword_26A4D5B58);
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v94 + 48))(v60, 1, v93) != 1)
          {
            uint64_t v95 = v126;
            sub_25AF54F18(v60, v126);
            __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5BC0);
            unint64_t v96 = (*(unsigned __int8 *)(v94 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v94 + 80);
            uint64_t v97 = swift_allocObject();
            *(_OWORD *)(v97 + 16) = v125;
            sub_25AF54F7C(v95, v97 + v96);
            sub_25AF790E0();
            swift_setDeallocating();
            swift_arrayDestroy();
            swift_deallocClassInstance();
            sub_25AF57EF4(v95);
            sub_25AF54EBC(v135, &qword_26A4D5B58);
            (*(void (**)(char *, uint64_t))(v76 + 8))(v132, v134);
            goto LABEL_42;
          }
          sub_25AF54EBC(v135, &qword_26A4D5B58);
          (*(void (**)(char *, uint64_t))(v76 + 8))(v132, v59);
          uint64_t v89 = v60;
          unsigned int v88 = &qword_26A4D5B58;
        }
        sub_25AF54EBC(v89, v88);
LABEL_42:
        id v138 = v18;
        id v98 = v34;
        id v99 = [v34 contactEventTrigger];
        id v100 = objc_msgSend(v99, sel_triggerContact);

        if (v100)
        {
          uint64_t v101 = __swift_project_boxed_opaque_existential_1(&v139[OBJC_IVAR____TtC25RemindersIntentsFramework32TTRSetTaskAttributeIntentHandler_contactRepresentationResolver], *(void *)&v139[OBJC_IVAR____TtC25RemindersIntentsFramework32TTRSetTaskAttributeIntentHandler_contactRepresentationResolver+ 24]);
          *(double *)&long long v102 = MEMORY[0x270FA5388](v101);
          *((_OWORD *)&v117 - 2) = v102;
          *(&v117 - 2) = v100;
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A4D5D60);
          swift_allocObject();
          id v103 = v100;
          sub_25AF79570();

          swift_retain();
        }
        else
        {
          v140[0] = 0;
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A4D5D60);
          swift_allocObject();
          sub_25AF79560();
        }
        id v104 = (void *)swift_allocObject();
        id v105 = v117;
        v104[2] = v50;
        v104[3] = v105;
        os_log_t v106 = v139;
        v107 = v119;
        v104[4] = v139;
        v104[5] = v107;
        v104[6] = v98;
        v104[7] = sub_25AF55280;
        v104[8] = v27;
        v108 = v98;
        id v109 = v105;
        swift_retain();
        id v110 = v106;
        id v111 = v107;
        swift_retain();
        id v112 = (void *)sub_25AF79500();
        sub_25AF79540();

        swift_release();
        swift_release();

        swift_release();
        swift_release();
        swift_release();

        sub_25AF54EBC((uint64_t)v138, &qword_26A4D5B30);
        swift_release();
        return;
      }
      if (v74 == (id)1 || v74 == (id)2)
      {
        sub_25AF79150();
        goto LABEL_24;
      }
      v120(v124, v136, v123);
      uint64_t v116 = MEMORY[0x263F8EE78];
      sub_25AF6026C(MEMORY[0x263F8EE78]);
      sub_25AF6026C(v116);
      swift_release();
      _Block_release(v137);
      v114 = "unknown priority";
      uint64_t v115 = 16;
LABEL_48:
      sub_25AF58288((uint64_t)v114, v115, 2);
      __break(1u);
      return;
    }
  }
  id v61 = v34;
  os_log_type_t v62 = sub_25AF795A0();
  os_log_type_t v63 = sub_25AF797B0();
  if (os_log_type_enabled(v62, v63))
  {
    id v64 = (uint8_t *)swift_slowAlloc();
    uint64_t v65 = swift_slowAlloc();
    id v138 = (char *)v27;
    uint64_t v66 = v65;
    v140[0] = v65;
    *(_DWORD *)id v64 = 136315138;
    id v67 = [v61 targetTask];
    uint64_t v141 = (uint64_t)v67;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5D58);
    uint64_t v68 = sub_25AF799B0();
    unint64_t v70 = v69;

    uint64_t v141 = sub_25AF772F0(v68, v70, v140);
    sub_25AF799C0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25AF45000, v62, v63, "Should have resolved targetTask into a reminder. {targetTask: %s}", v64, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x26115ACE0](v66, -1, -1);
    MEMORY[0x26115ACE0](v64, -1, -1);
  }
  else
  {
  }
  id v71 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FF30]), sel_initWithCode_userActivity_, 4, 0);
  (*((void (**)(const void *, id))v137 + 2))(v137, v71);
  swift_release();
}

uint64_t sub_25AF57E34()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25AF57E6C()
{
  swift_release();

  swift_release();
  return MEMORY[0x270FA0238](v0, 72, 7);
}

void sub_25AF57ECC(void **a1)
{
  sub_25AF55B30(a1, *(void *)(v1 + 16), *(id *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void **)(v1 + 48), *(void (**)(void))(v1 + 56));
}

uint64_t sub_25AF57EF4(uint64_t a1)
{
  uint64_t v2 = sub_25AF791C0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25AF57F50()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_25AF57F88(unint64_t a1)
{
  sub_25AF55370(a1, *(void (**)(id))(v1 + 16));
}

void sub_25AF57F94()
{
  sub_25AF79260();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5E10);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25AF7A830;
  sub_25AF79590();
  *(void *)(inited + 32) = 0x696669746E656449;
  *(void *)(inited + 40) = 0xEA00000000007265;
  sub_25AF79AB0();
  uint64_t v1 = sub_25AF79610();
  swift_bridgeObjectRelease();
  *(void *)(inited + 48) = v1;
  sub_25AF60150(inited);
  sub_25AF79580();
  swift_bridgeObjectRelease();
  if (qword_26A4D58F0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25AF795B0();
  __swift_project_value_buffer(v2, (uint64_t)qword_26A4D6630);
  swift_bridgeObjectRetain_n();
  id v3 = sub_25AF795A0();
  os_log_type_t v4 = sub_25AF797D0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v12 = v6;
    *(_DWORD *)uint64_t v5 = 136446466;
    uint64_t v7 = sub_25AF79AB0();
    sub_25AF772F0(v7, v8, &v12);
    sub_25AF799C0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v5 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_25AF795E0();
    unint64_t v11 = v10;
    swift_bridgeObjectRelease();
    sub_25AF772F0(v9, v11, &v12);
    sub_25AF799C0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25AF45000, v3, v4, "%{public}s; UserInfo=%s", (uint8_t *)v5, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x26115ACE0](v6, -1, -1);
    MEMORY[0x26115ACE0](v5, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

void sub_25AF58288(uint64_t a1, uint64_t a2, char a3)
{
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v5 = sub_25AF795A0();
  os_log_type_t v6 = sub_25AF797C0();
  uint64_t v18 = a1;
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    uint64_t v19 = v16;
    *(_DWORD *)uint64_t v7 = 136446722;
    uint64_t v8 = sub_25AF79AB0();
    sub_25AF772F0(v8, v9, &v19);
    sub_25AF799C0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 12) = 2080;
    swift_bridgeObjectRetain();
    char v17 = a3;
    uint64_t v10 = sub_25AF795E0();
    unint64_t v12 = v11;
    swift_bridgeObjectRelease();
    sub_25AF772F0(v10, v12, &v19);
    sub_25AF799C0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 22) = 2082;
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_25AF795E0();
    unint64_t v15 = v14;
    swift_bridgeObjectRelease();
    sub_25AF772F0(v13, v15, &v19);
    sub_25AF799C0();
    swift_bridgeObjectRelease_n();
    a3 = v17;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25AF45000, v5, v6, "%{public}s; UserInfo=%s; PublicUserInfo=%{public}s", (uint8_t *)v7, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x26115ACE0](v16, -1, -1);
    MEMORY[0x26115ACE0](v7, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }

  if (a3) {
    goto LABEL_7;
  }
  if (v18)
  {
    rdi_os_crash();
LABEL_7:
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_25AF5850C(uint64_t a1)
{
  return sub_25AF58548(a1, qword_26A4D6630, (SEL *)&selRef_userAction);
}

uint64_t sub_25AF58520(uint64_t a1)
{
  return sub_25AF58548(a1, qword_26A4D6648, (SEL *)&selRef_utility);
}

uint64_t sub_25AF58534(uint64_t a1)
{
  return sub_25AF58548(a1, qword_26A4D6660, (SEL *)&selRef_siriKit);
}

uint64_t sub_25AF58548(uint64_t a1, uint64_t *a2, SEL *a3)
{
  uint64_t v5 = sub_25AF795B0();
  __swift_allocate_value_buffer(v5, a2);
  __swift_project_value_buffer(v5, (uint64_t)a2);
  id v6 = [self *a3];
  return sub_25AF795C0();
}

uint64_t sub_25AF585BC()
{
  uint64_t v0 = sub_25AF795B0();
  __swift_allocate_value_buffer(v0, qword_26A4D5E18);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_26A4D5E18);
  if (qword_26A4D58F8 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_26A4D6648);
  id v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

void sub_25AF58684(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t), uint64_t a6, void *a7)
{
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a1;
  *(void *)(v12 + 24) = a2;
  uint64_t v13 = swift_retain();
  unint64_t v14 = (void *)a5(v13);
  unint64_t v15 = (void *)swift_allocObject();
  v15[2] = sub_25AF4F4A0;
  v15[3] = v12;
  v15[4] = a7;
  v15[5] = a5;
  v15[6] = a6;
  v18[4] = sub_25AF58B78;
  v18[5] = v15;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 1107296256;
  v18[2] = sub_25AF58B88;
  v18[3] = &block_descriptor;
  uint64_t v16 = _Block_copy(v18);
  id v17 = a7;
  swift_retain();
  swift_release();
  objc_msgSend(v14, sel_requestAccessForEntityType_completionHandler_, 0, v16);
  _Block_release(v16);
}

uint64_t sub_25AF587CC()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_25AF58804(char a1, id a2, void (*a3)(id), uint64_t a4, uint64_t a5, uint64_t (*a6)(void))
{
  if (a2)
  {
    id v8 = a2;
    if (qword_26A4D5908 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_25AF795B0();
    __swift_project_value_buffer(v9, (uint64_t)qword_26A4D5E18);
    id v10 = a2;
    id v11 = a2;
    uint64_t v12 = sub_25AF795A0();
    os_log_type_t v13 = sub_25AF797B0();
    if (os_log_type_enabled(v12, v13))
    {
      unint64_t v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      uint64_t v24 = v15;
      *(_DWORD *)unint64_t v14 = 136315138;
      swift_getErrorValue();
      uint64_t v16 = sub_25AF79CA0();
      sub_25AF772F0(v16, v17, &v24);
      sub_25AF799C0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_25AF45000, v12, v13, "Error requesting permission for CNContactStore {error: %s}", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x26115ACE0](v15, -1, -1);
      MEMORY[0x26115ACE0](v14, -1, -1);
    }
    else
    {
    }
    a3(0);
  }
  else if (a1)
  {
    uint64_t v18 = (void *)a6();
    id v23 = (id)sub_25AF79960();

    a3(v23);
  }
  else
  {
    if (qword_26A4D5908 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_25AF795B0();
    __swift_project_value_buffer(v19, (uint64_t)qword_26A4D5E18);
    uint64_t v20 = sub_25AF795A0();
    os_log_type_t v21 = sub_25AF797B0();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl(&dword_25AF45000, v20, v21, "Permission not granted for accessing CNContactStore {granted: false}", v22, 2u);
      MEMORY[0x26115ACE0](v22, -1, -1);
    }

    a3(0);
  }
}

uint64_t sub_25AF58B30()
{
  swift_release();

  swift_release();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

void sub_25AF58B78(char a1, void *a2)
{
  sub_25AF58804(a1, a2, *(void (**)(id))(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(uint64_t (**)(void))(v2 + 40));
}

void sub_25AF58B88(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
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

void *initializeBufferWithCopyOfBuffer for TTRContactRepresentationResolver(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for TTRContactRepresentationResolver()
{
  return swift_release();
}

void *assignWithCopy for TTRContactRepresentationResolver(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for TTRContactRepresentationResolver(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for TTRContactRepresentationResolver(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for TTRContactRepresentationResolver(uint64_t result, int a2, int a3)
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TTRContactRepresentationResolver()
{
  return &type metadata for TTRContactRepresentationResolver;
}

uint64_t sub_25AF58D58()
{
  uint64_t v0 = sub_25AF795B0();
  __swift_allocate_value_buffer(v0, qword_26A4D5E30);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_26A4D5E30);
  if (qword_26A4D5900 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_26A4D6660);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

uint64_t sub_25AF58E20(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  v6[4] = a1;
  v6[5] = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 1107296256;
  v6[2] = sub_25AF58ED4;
  v6[3] = &block_descriptor_0;
  os_log_type_t v4 = _Block_copy(v6);
  swift_retain();
  objc_msgSend(v3, sel_getDeliveredNotificationsWithCompletionHandler_, v4);
  _Block_release(v4);
  return swift_release();
}

uint64_t sub_25AF58ED4(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  sub_25AF48D94(0, &qword_26A4D5E58);
  uint64_t v2 = sub_25AF796D0();
  swift_retain();
  v1(v2);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25AF58F58(unint64_t a1, void (**a2)(unsigned char *, uint64_t, uint64_t, uint64_t), uint64_t a3, uint64_t a4)
{
  uint64_t v75 = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5E50);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = &v66[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = sub_25AF79380();
  id v11 = *(char **)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  os_log_type_t v13 = &v66[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v14);
  unsigned int v88 = &v66[-v15];
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A4D6000);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v18 = &v66[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v19 = sub_25AF794D0();
  uint64_t v86 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v94 = &v66[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v21);
  id v85 = &v66[-v22];
  if (a1 >> 62)
  {
LABEL_53:
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_25AF79C10();
  }
  else
  {
    uint64_t v23 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  uint64_t v96 = v19;
  uint64_t v93 = v23;
  uint64_t v74 = a3;
  if (v23)
  {
    uint64_t v87 = v13;
    id v72 = a2;
    unint64_t v92 = a1 & 0xC000000000000001;
    uint64_t v90 = (unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v11 + 48);
    id v82 = (void (**)(unsigned char *, unsigned char *, uint64_t))(v11 + 16);
    uint64_t v83 = (void (**)(unsigned char *, unsigned char *, uint64_t))(v11 + 32);
    uint64_t v81 = (uint64_t (**)(unsigned char *, uint64_t))(v11 + 88);
    int v80 = *MEMORY[0x263F631A8];
    int v78 = *MEMORY[0x263F631A0];
    int v76 = *MEMORY[0x263F631B0];
    int v73 = *MEMORY[0x263F63180];
    int v71 = *MEMORY[0x263F63188];
    int v70 = *MEMORY[0x263F631C0];
    id v79 = (void (**)(unsigned char *, uint64_t))(v11 + 8);
    a2 = (void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v86 + 56);
    uint64_t v77 = (void (**)(unsigned char *, uint64_t))(v11 + 96);
    os_log_type_t v13 = (unsigned char *)(v86 + 32);
    uint64_t v89 = (unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v86 + 48);
    int v69 = *MEMORY[0x263F63190];
    a3 = 4;
    int v68 = *MEMORY[0x263F63198];
    int v67 = *MEMORY[0x263F631B8];
    unint64_t v95 = MEMORY[0x263F8EE78];
    unint64_t v91 = a1;
    id v84 = v9;
    while (1)
    {
      uint64_t v19 = a3 - 4;
      if (v92) {
        uint64_t v25 = (char *)MEMORY[0x26115A540](a3 - 4, a1);
      }
      else {
        uint64_t v25 = (char *)*(id *)(a1 + 8 * a3);
      }
      id v11 = v25;
      a1 = a3 - 3;
      if (__OFADD__(v19, 1))
      {
        __break(1u);
        goto LABEL_53;
      }
      id v26 = objc_msgSend(v25, sel_request);
      id v27 = objc_msgSend(v26, sel_content);

      id v28 = v27;
      sub_25AF79370();
      if ((*v90)(v9, 1, v10) == 1)
      {

        sub_25AF54EBC((uint64_t)v9, &qword_26A4D5E50);
      }
      else
      {
        uint64_t v30 = v9;
        id v31 = a2;
        id v32 = v88;
        (*v83)(v88, v30, v10);
        uint64_t v33 = v87;
        (*v82)(v87, v32, v10);
        int v34 = (*v81)(v33, v10);
        if (v34 == v80)
        {
          (*v79)(v32, v10);

          (*v77)(v33, v10);
          uint64_t v19 = v96;
          (*(void (**)(unsigned char *, unsigned char *, uint64_t))v13)(v18, v33, v96);
          uint64_t v29 = 0;
          goto LABEL_22;
        }
        if (v34 == v78 || v34 == v76 || v34 == v73 || v34 == v71 || v34 == v70)
        {
          uint64_t v35 = *v79;
          (*v79)(v88, v10);

          v35(v87, v10);
          uint64_t v29 = 1;
          uint64_t v19 = v96;
LABEL_22:
          a2 = v31;
LABEL_23:
          uint64_t v9 = v84;
          goto LABEL_24;
        }
        a2 = v31;
        if (v34 == v69)
        {
          (*v79)(v88, v10);

          uint64_t v29 = 1;
          uint64_t v19 = v96;
          goto LABEL_23;
        }
        uint64_t v9 = v84;
        if (v34 != v68 && v34 != v67)
        {
          uint64_t result = sub_25AF79C70();
          __break(1u);
          return result;
        }
        (*v79)(v88, v10);
      }
      uint64_t v29 = 1;
      uint64_t v19 = v96;
LABEL_24:
      (*a2)(v18, v29, 1, v19);

      if ((*v89)(v18, 1, v19) == 1)
      {
        sub_25AF54EBC((uint64_t)v18, (uint64_t *)&unk_26A4D6000);
      }
      else
      {
        os_log_type_t v36 = *(void (**)(unsigned char *, unsigned char *, uint64_t))v13;
        BOOL v37 = v85;
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))v13)(v85, v18, v19);
        v36(v94, v37, v19);
        unint64_t v38 = v95;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v38 = sub_25AF7704C(0, *(void *)(v38 + 16) + 1, 1, v38);
        }
        unint64_t v40 = *(void *)(v38 + 16);
        unint64_t v39 = *(void *)(v38 + 24);
        unint64_t v95 = v38;
        if (v40 >= v39 >> 1) {
          unint64_t v95 = sub_25AF7704C(v39 > 1, v40 + 1, 1, v95);
        }
        os_log_type_t v41 = v94;
        unint64_t v42 = v95;
        *(void *)(v95 + 16) = v40 + 1;
        unint64_t v43 = v42
            + ((*(unsigned __int8 *)(v86 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v86 + 80))
            + *(void *)(v86 + 72) * v40;
        uint64_t v19 = v96;
        v36((unsigned char *)v43, v41, v96);
      }
      ++a3;
      BOOL v24 = a1 == v93;
      a1 = v91;
      if (v24)
      {
        swift_bridgeObjectRelease();
        a3 = v74;
        unint64_t v44 = v95;
        goto LABEL_37;
      }
    }
  }
  swift_bridgeObjectRelease();
  unint64_t v44 = MEMORY[0x263F8EE78];
LABEL_37:
  unint64_t v45 = v44;
  unint64_t v46 = sub_25AF799A0();
  unint64_t v47 = v46;
  if (v46 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v48 = sub_25AF79C10();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v48 = *(void *)((v46 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v49 = *(void *)(v45 + 16);
  if (v48 != v49)
  {
    if (qword_26A4D5910 != -1) {
      swift_once();
    }
    uint64_t v50 = sub_25AF795B0();
    __swift_project_value_buffer(v50, (uint64_t)qword_26A4D5E30);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v51 = sub_25AF795A0();
    os_log_type_t v52 = sub_25AF797B0();
    if (os_log_type_enabled(v51, v52))
    {
      uint64_t v53 = swift_slowAlloc();
      *(_DWORD *)uint64_t v53 = 134218240;
      v98[0] = v48;
      sub_25AF799C0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v53 + 12) = 2048;
      v98[0] = v49;
      sub_25AF799C0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25AF45000, v51, v52, "Unable to fetch some reminders. reminders count doesn't match with reminderIDs count. {notificationIdentifiers.count: %ld, reminders.count: %ld}", (uint8_t *)v53, 0x16u);
      MEMORY[0x26115ACE0](v53, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    uint64_t v19 = v96;
  }
  if (qword_26A4D5910 != -1) {
    swift_once();
  }
  uint64_t v54 = sub_25AF795B0();
  __swift_project_value_buffer(v54, (uint64_t)qword_26A4D5E30);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  id v55 = sub_25AF795A0();
  os_log_type_t v56 = sub_25AF797D0();
  if (os_log_type_enabled(v55, v56))
  {
    uint64_t v57 = v19;
    uint64_t v58 = swift_slowAlloc();
    uint64_t v96 = swift_slowAlloc();
    v98[0] = v96;
    *(_DWORD *)uint64_t v58 = 134218242;
    swift_bridgeObjectRelease();
    uint64_t v97 = v48;
    sub_25AF799C0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v58 + 12) = 2080;
    uint64_t v59 = swift_bridgeObjectRetain();
    uint64_t v60 = MEMORY[0x26115A160](v59, v57);
    uint64_t v61 = a3;
    unint64_t v63 = v62;
    swift_bridgeObjectRelease();
    uint64_t v97 = sub_25AF772F0(v60, v63, v98);
    sub_25AF799C0();
    swift_bridgeObjectRelease_n();
    a3 = v61;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25AF45000, v55, v56, "Retrieved %ld reminders from notification center {notificationIdentifiers: %s}", (uint8_t *)v58, 0x16u);
    uint64_t v64 = v96;
    swift_arrayDestroy();
    MEMORY[0x26115ACE0](v64, -1, -1);
    MEMORY[0x26115ACE0](v58, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  ((void (*)(unint64_t))a3)(v47);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25AF59C94(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = MEMORY[0x263F8EE78];
  uint64_t v33 = v4;
  *(void *)(v4 + 16) = MEMORY[0x263F8EE78];
  id v6 = (void *)(v4 + 16);
  uint64_t v35 = swift_allocObject();
  *(void *)(v35 + 16) = v5;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_25AF79C10();
    uint64_t v7 = result;
    if (!result) {
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v7) {
      goto LABEL_19;
    }
  }
  if (v7 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v9 = 0;
  unint64_t v10 = a1 & 0xC000000000000001;
  unint64_t v34 = a1;
  do
  {
    if (v10) {
      id v13 = (id)MEMORY[0x26115A540](v9, a1);
    }
    else {
      id v13 = *(id *)(a1 + 8 * v9 + 32);
    }
    uint64_t v12 = v13;
    uint64_t v14 = (void *)sub_25AF798C0();
    if (v14)
    {
      id v11 = v14;
      MEMORY[0x26115A130]();
      if (*(void *)((*v6 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_25AF79700();
      }
      sub_25AF79710();
      sub_25AF796F0();

      uint64_t v12 = v11;
    }
    else
    {
      id v15 = objc_msgSend(v12, sel_title);
      id v16 = objc_msgSend(v15, sel_spokenPhrase);

      uint64_t v17 = sub_25AF79640();
      uint64_t v19 = v18;

      uint64_t v20 = *(void **)(v35 + 16);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(void *)(v35 + 16) = v20;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        uint64_t v20 = sub_25AF76F3C(0, v20[2] + 1, 1, v20);
        *(void *)(v35 + 16) = v20;
      }
      unint64_t v23 = v20[2];
      unint64_t v22 = v20[3];
      if (v23 >= v22 >> 1)
      {
        uint64_t v20 = sub_25AF76F3C((void *)(v22 > 1), v23 + 1, 1, v20);
        *(void *)(v35 + 16) = v20;
      }
      v20[2] = v23 + 1;
      BOOL v24 = &v20[2 * v23];
      v24[4] = v17;
      v24[5] = v19;
      a1 = v34;
    }
    ++v9;
  }
  while (v7 != v9);
LABEL_19:
  swift_bridgeObjectRelease();
  uint64_t v25 = (void *)swift_allocObject();
  v25[2] = v33;
  v25[3] = v35;
  v25[4] = a2;
  v25[5] = a3;
  uint64_t v26 = v32[6];
  uint64_t v27 = v32[7];
  __swift_project_boxed_opaque_existential_1(v32 + 3, v26);
  id v28 = (void *)swift_allocObject();
  v28[2] = v32;
  v28[3] = sub_25AF5A380;
  v28[4] = v25;
  uint64_t v29 = *(void (**)(uint64_t (*)(unint64_t), void *, uint64_t, uint64_t))(v27 + 8);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  v29(sub_25AF5A3CC, v28, v26, v27);
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_25AF59FFC(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(unint64_t))
{
  uint64_t v5 = (void *)(a2 + 16);
  id v6 = (uint64_t *)(a3 + 16);
  unint64_t v7 = swift_bridgeObjectRetain();
  unint64_t v8 = sub_25AF5A3D8(v7, v5, v6);
  swift_bridgeObjectRelease();
  if (qword_26A4D5910 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_25AF795B0();
  __swift_project_value_buffer(v9, (uint64_t)qword_26A4D5E30);
  swift_bridgeObjectRetain_n();
  unint64_t v10 = sub_25AF795A0();
  os_log_type_t v11 = sub_25AF797D0();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    uint64_t v21 = v13;
    *(_DWORD *)uint64_t v12 = 134218242;
    uint64_t v20 = a4;
    if (v8 >> 62)
    {
      swift_bridgeObjectRetain();
      sub_25AF79C10();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    sub_25AF799C0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2080;
    uint64_t v14 = sub_25AF48D94(0, &qword_26A4D60C0);
    uint64_t v15 = swift_bridgeObjectRetain();
    uint64_t v16 = MEMORY[0x26115A160](v15, v14);
    unint64_t v18 = v17;
    swift_bridgeObjectRelease();
    sub_25AF772F0(v16, v18, &v21);
    sub_25AF799C0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25AF45000, v10, v11, "Got %ld matchingReminders matching searchTerms {matchingReminders: %s}", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x26115ACE0](v13, -1, -1);
    MEMORY[0x26115ACE0](v12, -1, -1);

    v20(v8);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    a4(v8);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_25AF5A29C()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for TTRIntentsHandlerNotificationCenterDataSource()
{
  return self;
}

uint64_t sub_25AF5A300()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25AF5A338()
{
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_25AF5A380(uint64_t a1)
{
  return sub_25AF59FFC(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void (**)(unint64_t))(v1 + 32));
}

uint64_t sub_25AF5A38C()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_25AF5A3CC(unint64_t a1)
{
  return sub_25AF58F58(a1, *(void (***)(unsigned char *, uint64_t, uint64_t, uint64_t))(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_25AF5A3D8(unint64_t a1, void *a2, uint64_t *a3)
{
  uint64_t v4 = a1;
  uint64_t v36 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_52;
  }
  uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_3:
  swift_beginAccess();
  swift_beginAccess();
  if (v5)
  {
    unint64_t v6 = 0;
    uint64_t v33 = v4 & 0xFFFFFFFFFFFFFF8;
    unint64_t v34 = v4 & 0xC000000000000001;
    uint64_t v31 = v4;
    uint64_t v32 = v4 + 32;
    id v28 = a2;
    uint64_t v30 = v5;
    while (1)
    {
      if (v34)
      {
        id v8 = (id)MEMORY[0x26115A540](v6, v4);
      }
      else
      {
        if (v6 >= *(void *)(v33 + 16)) {
          goto LABEL_49;
        }
        id v8 = *(id *)(v32 + 8 * v6);
      }
      uint64_t v9 = v8;
      BOOL v10 = __OFADD__(v6, 1);
      unint64_t v11 = v6 + 1;
      if (v10) {
        goto LABEL_50;
      }
      unint64_t v35 = v11;
      unint64_t v12 = *a2;
      swift_bridgeObjectRetain();
      id v13 = objc_msgSend(v9, sel_objectID);
      if (v12 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v14 = sub_25AF79C10();
        if (!v14) {
          goto LABEL_19;
        }
      }
      else
      {
        uint64_t v14 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (!v14) {
          goto LABEL_19;
        }
      }
      if ((v12 & 0xC000000000000001) != 0) {
        id v15 = (id)MEMORY[0x26115A540](0, v12);
      }
      else {
        id v15 = *(id *)(v12 + 32);
      }
      uint64_t v16 = v15;
      sub_25AF48D94(0, &qword_26A4D5E48);
      uint64_t v4 = sub_25AF79980();

      if (v4)
      {

        swift_bridgeObjectRelease_n();
LABEL_41:
        uint64_t v7 = v30;
        uint64_t v4 = v31;
        unint64_t v6 = v35;
        sub_25AF79AF0();
        sub_25AF79B20();
        sub_25AF79B30();
        sub_25AF79B00();
        goto LABEL_7;
      }
      if (v14 != 1)
      {
        if ((v12 & 0xC000000000000001) != 0)
        {
          uint64_t v22 = 1;
          while (1)
          {
            uint64_t v23 = MEMORY[0x26115A540](v22, v12);
            a2 = (void *)(v22 + 1);
            if (__OFADD__(v22, 1)) {
              break;
            }
            uint64_t v4 = v23;
            char v24 = sub_25AF79980();
            swift_unknownObjectRelease();
            if (v24) {
              goto LABEL_39;
            }
            ++v22;
            if (a2 == (void *)v14) {
              goto LABEL_38;
            }
          }
          __break(1u);
LABEL_49:
          __break(1u);
LABEL_50:
          __break(1u);
          goto LABEL_51;
        }
        uint64_t v25 = 5;
        while (1)
        {
          a2 = (void *)(v25 - 3);
          if (__OFADD__(v25 - 4, 1)) {
            break;
          }
          id v26 = *(id *)(v12 + 8 * v25);
          uint64_t v4 = sub_25AF79980();

          if (v4)
          {
LABEL_39:

            swift_bridgeObjectRelease_n();
LABEL_40:
            a2 = v28;
            goto LABEL_41;
          }
          ++v25;
          if (a2 == (void *)v14)
          {
LABEL_38:

            swift_bridgeObjectRelease();
            a2 = v28;
            goto LABEL_20;
          }
        }
LABEL_51:
        __break(1u);
LABEL_52:
        uint64_t v5 = sub_25AF79C10();
        goto LABEL_3;
      }
LABEL_19:

      swift_bridgeObjectRelease();
LABEL_20:
      swift_bridgeObjectRelease();
      uint64_t v17 = *a3;
      uint64_t v18 = *(void *)(*a3 + 16);
      if (v18)
      {
        swift_bridgeObjectRetain();
        uint64_t v19 = v17 + 40;
        while (1)
        {
          swift_bridgeObjectRetain();
          id v20 = objc_msgSend(v9, sel_titleAsString);
          if (v20)
          {
            uint64_t v21 = v20;
            sub_25AF79640();

            LOBYTE(v21) = sub_25AF79660();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (v21)
            {
              swift_bridgeObjectRelease();
              goto LABEL_40;
            }
          }
          else
          {
            swift_bridgeObjectRelease();
          }
          v19 += 16;
          if (!--v18)
          {

            swift_bridgeObjectRelease();
            a2 = v28;
            goto LABEL_6;
          }
        }
      }

LABEL_6:
      uint64_t v7 = v30;
      uint64_t v4 = v31;
      unint64_t v6 = v35;
LABEL_7:
      if (v6 == v7) {
        return v36;
      }
    }
  }
  return MEMORY[0x263F8EE78];
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

uint64_t sub_25AF5A7D8()
{
  uint64_t v0 = sub_25AF795B0();
  __swift_allocate_value_buffer(v0, qword_26A4D5E60);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_26A4D5E60);
  if (qword_26A4D5900 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_26A4D6660);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

uint64_t sub_25AF5A8A0(uint64_t a1, void (*a2)(uint64_t))
{
  sub_25AF79360();
  id v3 = objc_msgSend(self, sel_defaultFetchOptions);
  uint64_t v4 = sub_25AF79350();

  a2(v4);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25AF5AB4C(unint64_t a1)
{
  v23[1] = *(id *)MEMORY[0x263EF8340];
  if (!(a1 >> 62))
  {
    if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_3;
    }
    return MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain();
  uint64_t v22 = sub_25AF79C10();
  swift_bridgeObjectRelease();
  if (!v22) {
    return MEMORY[0x263F8EE78];
  }
LABEL_3:
  uint64_t v2 = *(void **)(v1 + 16);
  uint64_t v3 = sub_25AF48D94(0, &qword_26A4D5E48);
  uint64_t v4 = (void *)sub_25AF796C0();
  v23[0] = 0;
  id v5 = objc_msgSend(v2, sel_fetchRemindersWithObjectIDs_error_, v4, v23);

  id v6 = v23[0];
  if (!v5)
  {
    id v10 = v23[0];
    unint64_t v11 = (void *)sub_25AF78E60();

    swift_willThrow();
    if (qword_26A4D5918 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_25AF795B0();
    __swift_project_value_buffer(v12, (uint64_t)qword_26A4D5E60);
    swift_bridgeObjectRetain_n();
    id v13 = sub_25AF795A0();
    os_log_type_t v14 = sub_25AF797B0();
    if (os_log_type_enabled(v13, v14))
    {
      id v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v16 = (void *)swift_slowAlloc();
      v23[0] = v16;
      *(_DWORD *)id v15 = 136315138;
      uint64_t v17 = swift_bridgeObjectRetain();
      uint64_t v18 = MEMORY[0x26115A160](v17, v3);
      unint64_t v20 = v19;
      swift_bridgeObjectRelease();
      sub_25AF772F0(v18, v20, (uint64_t *)v23);
      sub_25AF799C0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25AF45000, v13, v14, "Error fetching reminders by objetIDs {objectIDs: %s}", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x26115ACE0](v16, -1, -1);
      MEMORY[0x26115ACE0](v15, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }

    return MEMORY[0x263F8EE78];
  }
  sub_25AF48D94(0, &qword_26A4D60C0);
  sub_25AF5D96C();
  unint64_t v7 = sub_25AF795D0();
  id v8 = v6;

  uint64_t v9 = sub_25AF7795C(v7);
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_25AF5AE78(uint64_t a1, void (*a2)(char *), uint64_t a3)
{
  uint64_t v6 = sub_25AF79330();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  MEMORY[0x270FA5388](v8);
  id v10 = (char *)&v13 - v9;
  if (*(void *)(a1 + 16) <= 1uLL)
  {
    sub_25AF79360();
    sub_25AF792F0();
    a2(v10);
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  else
  {
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = a2;
    *(void *)(v11 + 24) = a3;
    swift_retain();
    sub_25AF739A8(a1, (uint64_t)sub_25AF5DA24, v11);
    return swift_release();
  }
}

uint64_t sub_25AF5B220(uint64_t a1, uint64_t a2, void (*a3)(char *))
{
  uint64_t v4 = sub_25AF79330();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_25AF79310();
  a3(v7);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_25AF5B324(unint64_t a1, void (*a2)(char *), uint64_t a3)
{
  uint64_t v81 = a2;
  v101[1] = *MEMORY[0x263EF8340];
  uint64_t v79 = sub_25AF79330();
  uint64_t v78 = *(void *)(v79 - 8);
  MEMORY[0x270FA5388](v79);
  uint64_t v77 = (char *)&v77 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v97 = sub_25AF792A0();
  uint64_t v93 = *(void *)(v97 - 8);
  MEMORY[0x270FA5388](v97);
  uint64_t v87 = (char *)&v77 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v96 = (uint64_t *)((char *)&v77 - v12);
  unint64_t v99 = MEMORY[0x263F8EE78];
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_25AF79C10();
  }
  else
  {
    uint64_t v13 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  id v82 = v3;
  if (!v13)
  {
    swift_bridgeObjectRelease();
    unint64_t v50 = MEMORY[0x263F8EE78];
    unint64_t v16 = MEMORY[0x263F8EE78];
LABEL_30:
    uint64_t v97 = v16;
    if (v50 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v72 = sub_25AF79C10();
      swift_bridgeObjectRelease();
      if (v72)
      {
LABEL_32:
        id v51 = (void *)v3[2];
        os_log_type_t v52 = v3;
        uint64_t v4 = sub_25AF48D94(0, &qword_26A4D5E48);
        swift_bridgeObjectRetain();
        uint64_t v53 = (void *)sub_25AF796C0();
        swift_bridgeObjectRelease();
        v100[0] = 0;
        id v54 = objc_msgSend(v51, sel_fetchListsWithObjectIDs_error_, v53, v100);

        id v55 = v100[0];
        if (v54)
        {
          sub_25AF48D94(0, (unint64_t *)&qword_26A4D5B40);
          sub_25AF5D96C();
          unint64_t v56 = sub_25AF795D0();
          id v57 = v55;

          uint64_t v6 = sub_25AF77948(v56);
          swift_bridgeObjectRelease();
          swift_retain();
          unint64_t v58 = swift_bridgeObjectRetain();
          uint64_t v71 = sub_25AF5D0B8(v58, v52);
          swift_bridgeObjectRelease();
          swift_release();
          goto LABEL_41;
        }
        id v59 = v100[0];
        uint64_t v5 = (void *)sub_25AF78E60();

        swift_willThrow();
        uint64_t v6 = MEMORY[0x263F8EE78];
        if (qword_26A4D5918 == -1) {
          goto LABEL_35;
        }
        goto LABEL_46;
      }
    }
    else if (*(void *)((v50 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_32;
    }
    uint64_t v71 = MEMORY[0x263F8EE78];
    uint64_t v6 = MEMORY[0x263F8EE78];
    goto LABEL_41;
  }
  if (v13 >= 1)
  {
    uint64_t v80 = a3;
    uint64_t v14 = 0;
    unint64_t v15 = a1 & 0xC000000000000001;
    unsigned int v89 = *MEMORY[0x263F63280];
    unsigned int v88 = *MEMORY[0x263F63110];
    uint64_t v94 = v93 + 32;
    unint64_t v95 = (void (**)(uint64_t *, void, uint64_t))(v93 + 104);
    unsigned int v85 = *MEMORY[0x263F63178];
    unsigned int v84 = *MEMORY[0x263F63130];
    unint64_t v16 = MEMORY[0x263F8EE78];
    uint64_t v86 = "8^B16";
    unint64_t v83 = 0x800000025AF80000;
    unint64_t v90 = a1 & 0xC000000000000001;
    uint64_t v91 = v13;
    unint64_t v92 = a1;
    while (1)
    {
      if (v15) {
        id v17 = (id)MEMORY[0x26115A540](v14, a1);
      }
      else {
        id v17 = *(id *)(a1 + 8 * v14 + 32);
      }
      uint64_t v18 = v17;
      unint64_t v19 = (void *)sub_25AF79780();
      if (v19)
      {
        id v20 = v19;
        MEMORY[0x26115A130]();
        if (*(void *)((v99 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v99 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_25AF79700();
        }
        sub_25AF79710();
        sub_25AF796F0();

        uint64_t v18 = v20;
        goto LABEL_8;
      }
      id v21 = objc_msgSend(v18, sel_title);
      id v22 = objc_msgSend(v21, sel_spokenPhrase);

      uint64_t v23 = sub_25AF79640();
      uint64_t v25 = v24;

      uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D6020);
      uint64_t v27 = v96;
      id v28 = (char *)v96 + *(int *)(v26 + 48);
      *uint64_t v96 = v23;
      v27[1] = v25;
      uint64_t v29 = sub_25AF793C0();
      (*(void (**)(char *, void, uint64_t))(*(void *)(v29 - 8) + 104))(v28, v89, v29);
      uint64_t v30 = (void (*)(char *, void, uint64_t))*v95;
      (*v95)(v27, v88, v97);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v16 = sub_25AF76F18(0, *(void *)(v16 + 16) + 1, 1, v16);
      }
      unint64_t v32 = *(void *)(v16 + 16);
      unint64_t v31 = *(void *)(v16 + 24);
      if (v32 >= v31 >> 1) {
        unint64_t v16 = sub_25AF76F18(v31 > 1, v32 + 1, 1, v16);
      }
      *(void *)(v16 + 16) = v32 + 1;
      unint64_t v33 = (*(unsigned __int8 *)(v93 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v93 + 80);
      unint64_t v34 = v16;
      unint64_t v35 = v16 + v33;
      uint64_t v36 = *(void *)(v93 + 72);
      unint64_t v37 = v35 + v36 * v32;
      unint64_t v38 = *(void (**)(unint64_t, uint64_t *, uint64_t))(v93 + 32);
      v38(v37, v96, v97);
      id v39 = objc_msgSend(v18, sel_title);
      id v40 = objc_msgSend(v39, sel_vocabularyIdentifier);

      if (v40)
      {
        uint64_t v41 = sub_25AF79640();
        uint64_t v43 = v42;

        if (v41 == 0xD000000000000011 && v43 == v83)
        {
          swift_bridgeObjectRelease();
LABEL_25:
          uint64_t v45 = sub_25AF792E0();
          unint64_t v46 = v87;
          (*(void (**)(char *, void, uint64_t))(*(void *)(v45 - 8) + 104))(v87, v85, v45);
          v30(v46, v84, v97);
          unint64_t v48 = *(void *)(v34 + 16);
          unint64_t v47 = *(void *)(v34 + 24);
          if (v48 >= v47 >> 1) {
            unint64_t v34 = sub_25AF76F18(v47 > 1, v48 + 1, 1, v34);
          }
          *(void *)(v34 + 16) = v48 + 1;
          unint64_t v49 = v34 + v33 + v48 * v36;
          unint64_t v16 = v34;
          v38(v49, (uint64_t *)v87, v97);
          goto LABEL_7;
        }
        char v44 = sub_25AF79C80();
        swift_bridgeObjectRelease();
        if (v44) {
          goto LABEL_25;
        }
      }
      unint64_t v16 = v34;
LABEL_7:
      uint64_t v13 = v91;
      a1 = v92;
      unint64_t v15 = v90;
LABEL_8:
      ++v14;

      if (v13 == v14)
      {
        swift_bridgeObjectRelease();
        unint64_t v50 = v99;
        a3 = v80;
        uint64_t v3 = v82;
        goto LABEL_30;
      }
    }
  }
  __break(1u);
LABEL_46:
  swift_once();
LABEL_35:
  uint64_t v60 = sub_25AF795B0();
  __swift_project_value_buffer(v60, (uint64_t)qword_26A4D5E60);
  uint64_t v61 = sub_25AF795A0();
  os_log_type_t v62 = sub_25AF797B0();
  if (os_log_type_enabled(v61, v62))
  {
    unint64_t v63 = (uint8_t *)swift_slowAlloc();
    uint64_t v64 = swift_slowAlloc();
    uint64_t v80 = a3;
    uint64_t v65 = v64;
    v101[0] = v64;
    *(_DWORD *)unint64_t v63 = 136315138;
    uint64_t v96 = (uint64_t *)(v63 + 4);
    swift_beginAccess();
    uint64_t v66 = swift_bridgeObjectRetain();
    uint64_t v67 = MEMORY[0x26115A160](v66, v4);
    unint64_t v69 = v68;
    swift_bridgeObjectRelease();
    uint64_t v98 = sub_25AF772F0(v67, v69, v101);
    sub_25AF799C0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25AF45000, v61, v62, "Error fetching lists by objetIDs {objectIDs: %s}", v63, 0xCu);
    swift_arrayDestroy();
    uint64_t v70 = v65;
    a3 = v80;
    MEMORY[0x26115ACE0](v70, -1, -1);
    MEMORY[0x26115ACE0](v63, -1, -1);
  }

  uint64_t v71 = MEMORY[0x263F8EE78];
LABEL_41:
  uint64_t v73 = v97;
  if (*(void *)(v97 + 16))
  {
    uint64_t v74 = (void *)swift_allocObject();
    v74[2] = v81;
    v74[3] = a3;
    v74[4] = v6;
    v74[5] = v73;
    v74[6] = v71;
    swift_bridgeObjectRetain();
    swift_retain();
    sub_25AF739A8(v73, (uint64_t)sub_25AF5D95C, (uint64_t)v74);
    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v75 = v77;
    sub_25AF79310();
    v81(v75);
    (*(void (**)(char *, uint64_t))(v78 + 8))(v75, v79);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_25AF5BD80(unint64_t a1, unint64_t a2, void (*a3)(char *), uint64_t a4, unint64_t a5, uint64_t a6, unint64_t a7)
{
  uint64_t v13 = sub_25AF79330();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  unint64_t v16 = (char *)&v18 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v19 = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_25AF5E984(a5);
  sub_25AF6C480(a6, v19);
  swift_bridgeObjectRelease();
  unint64_t v19 = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_25AF5E96C(a7);
  sub_25AF79310();
  a3(v16);
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

uint64_t sub_25AF5BEEC(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = MEMORY[0x263F8EE78];
  uint64_t v8 = *(void **)(v3 + 16);
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = a1;
  v9[3] = a2;
  v9[4] = v7;
  v13[4] = sub_25AF5D8E0;
  v13[5] = v9;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 1107296256;
  v13[2] = sub_25AF5CA14;
  v13[3] = &block_descriptor_1;
  uint64_t v10 = _Block_copy(v13);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  objc_msgSend(v8, sel_enumerateAllListsWithBlock_, v10);
  _Block_release(v10);
  swift_beginAccess();
  uint64_t v11 = swift_bridgeObjectRetain();
  a3(v11);
  swift_release();
  return swift_bridgeObjectRelease();
}

id sub_25AF5C068(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  uint64_t v9 = sub_25AF795B0();
  uint64_t v52 = *(void *)(v9 - 8);
  uint64_t v53 = v9;
  double v10 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (void **)((char *)&v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  id result = objc_msgSend((id)a1, sel_isShared, v10);
  if (!result) {
    return result;
  }
  uint64_t v14 = (void *)(a5 + 16);
  id v15 = objc_msgSend((id)a1, sel_sharedOwnerAddress);
  if (v15)
  {
    unint64_t v16 = v15;
    uint64_t v17 = sub_25AF79640();
    uint64_t v19 = v18;

    if (sub_25AF5C5F8(v17, v19, a3))
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v20 = sub_25AF5C5F8(v17, v19, a4);
      swift_bridgeObjectRelease();
      if ((v20 & 1) == 0) {
        goto LABEL_10;
      }
    }
    if (objc_msgSend((id)a1, sel_isShared))
    {
      swift_beginAccess();
      id v21 = (id)a1;
      MEMORY[0x26115A130]();
      if (*(void *)((*v14 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v14 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_25AF79700();
      }
      sub_25AF79710();
      sub_25AF796F0();
      swift_endAccess();
    }
  }
LABEL_10:
  id result = objc_msgSend((id)a1, sel_shareeContext);
  if (result)
  {
    id v22 = result;
    uint64_t v49 = a3;
    id v23 = objc_msgSend(result, sel_sharees);

    sub_25AF48D94(0, &qword_26A4D5E88);
    unint64_t v24 = sub_25AF796D0();

    if (v24 >> 62) {
      goto LABEL_38;
    }
    uint64_t v25 = *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    while (1)
    {
      unint64_t v48 = a4;
      unint64_t v50 = (void *)a1;
      id v51 = v14;
      if (!v25) {
        break;
      }
      unint64_t v47 = v12;
      a4 = v24 & 0xC000000000000001;
      uint64_t v12 = (void *)MEMORY[0x263F8EE78];
      uint64_t v26 = 4;
      a1 = 0x265487000uLL;
      while (2)
      {
        if (a4) {
          id v27 = (id)MEMORY[0x26115A540](v26 - 4, v24);
        }
        else {
          id v27 = *(id *)(v24 + 8 * v26);
        }
        id v28 = v27;
        uint64_t v14 = (void *)(v26 - 3);
        if (!__OFADD__(v26 - 4, 1))
        {
          switch((unint64_t)[v27 *(SEL *)(a1 + 3088)])
          {
            case 0uLL:
            case 2uLL:
            case 3uLL:
            case 4uLL:
              goto LABEL_15;
            case 1uLL:
            case 5uLL:
              id v29 = objc_msgSend(v28, sel_address);
              if (v29)
              {
                uint64_t v30 = v29;
                sub_25AF79640();

                unint64_t v31 = (void *)sub_25AF79610();
                swift_bridgeObjectRelease();
                id v32 = objc_msgSend(v31, sel_rem_removingMailto);

                uint64_t v33 = sub_25AF79640();
                uint64_t v35 = v34;

                if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                  uint64_t v12 = sub_25AF76F3C(0, v12[2] + 1, 1, v12);
                }
                unint64_t v37 = v12[2];
                unint64_t v36 = v12[3];
                if (v37 >= v36 >> 1) {
                  uint64_t v12 = sub_25AF76F3C((void *)(v36 > 1), v37 + 1, 1, v12);
                }
                id v12[2] = v37 + 1;
                unint64_t v38 = &v12[2 * v37];
                v38[4] = v33;
                v38[5] = v35;
                a1 = 0x265487000;
              }
              else
              {
LABEL_15:
              }
              ++v26;
              if (v14 != (void *)v25) {
                continue;
              }
              goto LABEL_29;
            default:
              if (qword_26A4D5918 != -1) {
                swift_once();
              }
              uint64_t v44 = v53;
              uint64_t v45 = __swift_project_value_buffer(v53, (uint64_t)qword_26A4D5E60);
              (*(void (**)(void *, uint64_t, uint64_t))(v52 + 16))(v47, v45, v44);
              uint64_t v46 = MEMORY[0x263F8EE78];
              sub_25AF6026C(MEMORY[0x263F8EE78]);
              sub_25AF6026C(v46);
              sub_25AF58288((uint64_t)"unknown status", 14, 2);
              __break(1u);
              JUMPOUT(0x25AF5C5E0);
          }
        }
        break;
      }
      __break(1u);
LABEL_38:
      swift_bridgeObjectRetain_n();
      uint64_t v25 = sub_25AF79C10();
      swift_bridgeObjectRelease();
    }
    uint64_t v12 = (void *)MEMORY[0x263F8EE78];
LABEL_29:
    swift_bridgeObjectRelease_n();
    uint64_t v39 = sub_25AF5D288((uint64_t)v12);
    swift_bridgeObjectRelease();
    if (sub_25AF5C730(v39, v49))
    {
      char v40 = sub_25AF5C730(v39, v48);
      id result = (id)swift_bridgeObjectRelease();
      uint64_t v41 = v50;
      uint64_t v42 = v51;
      if (v40) {
        return result;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v41 = v50;
      uint64_t v42 = v51;
    }
    swift_beginAccess();
    id v43 = v41;
    MEMORY[0x26115A130]();
    if (*(void *)((*v42 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v42 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_25AF79700();
    }
    sub_25AF79710();
    sub_25AF796F0();
    return (id)swift_endAccess();
  }
  return result;
}

uint64_t sub_25AF5C5F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_25AF79CC0();
    sub_25AF79680();
    uint64_t v6 = sub_25AF79CD0();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      uint64_t v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_25AF79C80() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          unint64_t v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_25AF79C80() & 1) != 0) {
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

uint64_t sub_25AF5C730(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 1;
  }
  unint64_t v3 = *(void *)(a1 + 16);
  if (!v3) {
    return 1;
  }
  if (v2 >= v3) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = a2;
  }
  if (v2 >= v3) {
    uint64_t v5 = a2;
  }
  else {
    uint64_t v5 = a1;
  }
  uint64_t v32 = v4;
  uint64_t v33 = v4 + 56;
  uint64_t v6 = -1 << *(unsigned char *)(v4 + 32);
  if (-v6 < 64) {
    uint64_t v7 = ~(-1 << -(char)v6);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v4 + 56);
  int64_t v31 = (unint64_t)(63 - v6) >> 6;
  uint64_t v9 = v5 + 56;
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v11 = 0;
  while (1)
  {
    while (1)
    {
      int64_t v12 = v11;
      if (!v8) {
        break;
      }
      unint64_t v13 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v14 = v13 | (v11 << 6);
      if (*(void *)(v5 + 16)) {
        goto LABEL_31;
      }
    }
    int64_t v15 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_50;
    }
    if (v15 >= v31) {
      goto LABEL_48;
    }
    unint64_t v16 = *(void *)(v33 + 8 * v15);
    ++v11;
    if (!v16)
    {
      int64_t v11 = v12 + 2;
      if (v12 + 2 >= v31) {
        goto LABEL_48;
      }
      unint64_t v16 = *(void *)(v33 + 8 * v11);
      if (!v16)
      {
        int64_t v11 = v12 + 3;
        if (v12 + 3 >= v31) {
          goto LABEL_48;
        }
        unint64_t v16 = *(void *)(v33 + 8 * v11);
        if (!v16) {
          break;
        }
      }
    }
LABEL_30:
    unint64_t v8 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
    if (*(void *)(v5 + 16))
    {
LABEL_31:
      uint64_t v18 = (uint64_t *)(*(void *)(v32 + 48) + 16 * v14);
      uint64_t v20 = *v18;
      uint64_t v19 = v18[1];
      sub_25AF79CC0();
      swift_bridgeObjectRetain();
      sub_25AF79680();
      uint64_t v21 = sub_25AF79CD0();
      uint64_t v22 = -1 << *(unsigned char *)(v5 + 32);
      unint64_t v23 = v21 & ~v22;
      if ((*(void *)(v9 + ((v23 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v23))
      {
        uint64_t v24 = *(void *)(v5 + 48);
        uint64_t v25 = (void *)(v24 + 16 * v23);
        BOOL v26 = *v25 == v20 && v25[1] == v19;
        if (v26 || (sub_25AF79C80() & 1) != 0)
        {
LABEL_44:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v30 = 0;
LABEL_45:
          sub_25AF5D904();
          return v30;
        }
        uint64_t v27 = ~v22;
        while (1)
        {
          unint64_t v23 = (v23 + 1) & v27;
          if (((*(void *)(v9 + ((v23 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v23) & 1) == 0) {
            break;
          }
          id v28 = (void *)(v24 + 16 * v23);
          BOOL v29 = *v28 == v20 && v28[1] == v19;
          if (v29 || (sub_25AF79C80() & 1) != 0) {
            goto LABEL_44;
          }
        }
      }
      uint64_t result = swift_bridgeObjectRelease();
    }
  }
  int64_t v17 = v12 + 4;
  if (v12 + 4 >= v31)
  {
LABEL_48:
    swift_bridgeObjectRelease();
    uint64_t v30 = 1;
    goto LABEL_45;
  }
  unint64_t v16 = *(void *)(v33 + 8 * v17);
  if (v16)
  {
    int64_t v11 = v12 + 4;
    goto LABEL_30;
  }
  while (1)
  {
    int64_t v11 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v11 >= v31) {
      goto LABEL_48;
    }
    unint64_t v16 = *(void *)(v33 + 8 * v11);
    ++v17;
    if (v16) {
      goto LABEL_30;
    }
  }
LABEL_50:
  __break(1u);
  return result;
}

void sub_25AF5CA14(uint64_t a1, void *a2)
{
  unint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

id sub_25AF5CA88()
{
  v13[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v1 = *(void **)(v0 + 16);
  v13[0] = 0;
  id v2 = objc_msgSend(v1, sel_fetchDefaultListWithError_, v13);
  if (v13[0])
  {
    id v3 = v13[0];

    swift_willThrow();
    if (qword_26A4D5918 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_25AF795B0();
    __swift_project_value_buffer(v4, (uint64_t)qword_26A4D5E60);
    id v5 = v3;
    uint64_t v6 = sub_25AF795A0();
    os_log_type_t v7 = sub_25AF797B0();
    if (os_log_type_enabled(v6, v7))
    {
      unint64_t v8 = (uint8_t *)swift_slowAlloc();
      uint64_t v9 = (void *)swift_slowAlloc();
      v13[0] = v9;
      *(_DWORD *)unint64_t v8 = 136315138;
      swift_getErrorValue();
      uint64_t v10 = sub_25AF79CA0();
      sub_25AF772F0(v10, v11, (uint64_t *)v13);
      sub_25AF799C0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25AF45000, v6, v7, "Error fetching default list %s", v8, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x26115ACE0](v9, -1, -1);
      MEMORY[0x26115ACE0](v8, -1, -1);
    }
    else
    {
    }
    return 0;
  }
  return v2;
}

uint64_t sub_25AF5CCB4(uint64_t a1)
{
  v14[0] = a1;
  uint64_t v1 = sub_25AF793F0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_25AF794A0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unint64_t v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5E80);
  MEMORY[0x270FA5388](v9 - 8);
  unint64_t v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25AF794B0();
  sub_25AF793E0();
  sub_25AF793D0();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  sub_25AF79490();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v12 = sub_25AF79480();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 0, 1, v12);
  ((void (*)(char *))v14[0])(v11);
  return sub_25AF5D800((uint64_t)v11);
}

uint64_t sub_25AF5CF5C()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for TTRIntentsHandlerStoreDataSource()
{
  return self;
}

uint64_t sub_25AF5CFB8(unint64_t a1)
{
  return sub_25AF5AB4C(a1);
}

uint64_t sub_25AF5CFDC(uint64_t a1, void (*a2)(uint64_t))
{
  return sub_25AF5A8A0(a1, a2);
}

uint64_t sub_25AF5D000(uint64_t a1, void (*a2)(char *), uint64_t a3)
{
  return sub_25AF5AE78(a1, a2, a3);
}

uint64_t sub_25AF5D024(unint64_t a1, void (*a2)(char *), uint64_t a3)
{
  return sub_25AF5B324(a1, a2, a3);
}

uint64_t sub_25AF5D048(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  return sub_25AF5BEEC(a1, a2, a3);
}

id sub_25AF5D06C()
{
  return sub_25AF5CA88();
}

uint64_t sub_25AF5D090(uint64_t a1)
{
  return sub_25AF5CCB4(a1);
}

uint64_t sub_25AF5D0B8(unint64_t a1, void *a2)
{
  unint64_t v3 = v2;
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a1 >> 62) {
    goto LABEL_16;
  }
  uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t result = MEMORY[0x263F8EE78];
    if (!v6) {
      break;
    }
    uint64_t v15 = MEMORY[0x263F8EE78];
    sub_25AF79B10();
    if (v6 < 0) {
      __break(1u);
    }
    unint64_t v13 = v3;
    uint64_t v8 = 0;
    a2 = (void *)a2[2];
    unint64_t v3 = 0x265487000uLL;
    while (v6 != v8)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v9 = (id)MEMORY[0x26115A540](v8, a1);
      }
      else {
        id v9 = *(id *)(a1 + 8 * v8 + 32);
      }
      uint64_t v10 = v9;
      id v14 = 0;
      if (!objc_msgSend(a2, sel_fetchCustomSmartListWithObjectID_error_, v9, &v14, v13))
      {
        id v12 = v14;
        sub_25AF78E60();

        swift_willThrow();
        return swift_release();
      }
      ++v8;
      id v11 = v14;

      sub_25AF79AF0();
      sub_25AF79B20();
      sub_25AF79B30();
      sub_25AF79B00();
      if (v6 == v8) {
        return v15;
      }
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_25AF79C10();
    swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25AF5D288(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_25AF79720();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_25AF6CDF0(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_25AF5D320(uint64_t a1, uint64_t a2, void (*a3)(char *), uint64_t a4)
{
  uint64_t v7 = sub_25AF79330();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  MEMORY[0x270FA5388](v9);
  id v11 = (char *)&v15 - v10;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a3;
  *(void *)(v12 + 24) = a4;
  if (*(void *)(a1 + 16) < 2uLL)
  {
    sub_25AF79360();
    swift_retain();
    sub_25AF792F0();
    a3(v11);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
    return swift_release();
  }
  else
  {
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = sub_25AF5DA0C;
    *(void *)(v13 + 24) = v12;
    swift_retain();
    swift_retain();
    sub_25AF739A8(a1, sub_25AF5DA14, v13);
    swift_release();
    return swift_release();
  }
}

uint64_t sub_25AF5D720(void (*a1)(uint64_t))
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5E78);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_25AF7AB50;
  unint64_t v3 = (void *)*MEMORY[0x263F63018];
  uint64_t v4 = (void *)*MEMORY[0x263F63000];
  *(void *)(v2 + 32) = *MEMORY[0x263F63018];
  *(void *)(v2 + 40) = v4;
  uint64_t v5 = (void *)*MEMORY[0x263F62FE0];
  uint64_t v6 = (void *)*MEMORY[0x263F62FF8];
  *(void *)(v2 + 48) = *MEMORY[0x263F62FE0];
  *(void *)(v2 + 56) = v6;
  uint64_t v7 = (void *)*MEMORY[0x263F62FE8];
  *(void *)(v2 + 64) = *MEMORY[0x263F62FE8];
  id v8 = v3;
  id v9 = v4;
  id v10 = v5;
  id v11 = v6;
  id v12 = v7;
  a1(v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25AF5D800(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5E80);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25AF5D860()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25AF5D898()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

id sub_25AF5D8E0(unint64_t a1, uint64_t a2)
{
  return sub_25AF5C068(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32));
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

uint64_t sub_25AF5D904()
{
  return swift_release();
}

uint64_t sub_25AF5D90C()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_25AF5D95C(unint64_t a1, unint64_t a2)
{
  return sub_25AF5BD80(a1, a2, *(void (**)(char *))(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 48));
}

unint64_t sub_25AF5D96C()
{
  unint64_t result = qword_26A4D5E90;
  if (!qword_26A4D5E90)
  {
    sub_25AF48D94(255, &qword_26A4D5E48);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4D5E90);
  }
  return result;
}

uint64_t sub_25AF5D9D4()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25AF5DA0C(uint64_t a1)
{
  return sub_25AF5E338(a1, *(uint64_t (**)(void))(v1 + 16));
}

uint64_t sub_25AF5DA14(uint64_t a1, uint64_t a2)
{
  return sub_25AF5B220(a1, a2, *(void (**)(char *))(v2 + 16));
}

void sub_25AF5DA28(unint64_t a1, uint64_t a2, void (*a3)(uint64_t), uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v43 = a6;
  uint64_t v42 = a5;
  uint64_t v51 = sub_25AF792A0();
  uint64_t v10 = *(void *)(v51 - 8);
  MEMORY[0x270FA5388](v51);
  id v12 = (uint64_t *)((char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v54 = MEMORY[0x263F8EE78];
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_25AF79C10();
  }
  else
  {
    uint64_t v13 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  uint64_t v45 = a3;
  uint64_t v46 = a4;
  uint64_t v41 = a2;
  if (v13)
  {
    if (v13 < 1)
    {
      __break(1u);
      return;
    }
    uint64_t v14 = 0;
    unint64_t v52 = a1 & 0xC000000000000001;
    unsigned int v50 = *MEMORY[0x263F63280];
    unsigned int v49 = *MEMORY[0x263F63110];
    uint64_t v47 = v10 + 32;
    unint64_t v48 = (void (**)(uint64_t *, void, uint64_t))(v10 + 104);
    uint64_t v15 = MEMORY[0x263F8EE78];
    do
    {
      if (v52) {
        id v18 = (id)MEMORY[0x26115A540](v14, a1);
      }
      else {
        id v18 = *(id *)(a1 + 8 * v14 + 32);
      }
      int64_t v17 = v18;
      uint64_t v19 = (void *)sub_25AF798C0();
      if (v19)
      {
        id v16 = v19;
        MEMORY[0x26115A130]();
        if (*(void *)((v54 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v54 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_25AF79700();
        }
        sub_25AF79710();
        sub_25AF796F0();

        int64_t v17 = v16;
      }
      else
      {
        id v20 = objc_msgSend(v17, sel_title);
        id v21 = objc_msgSend(v20, sel_spokenPhrase);

        uint64_t v22 = sub_25AF79640();
        uint64_t v24 = v23;

        uint64_t v25 = (char *)v12 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A4D6020) + 48);
        *id v12 = v22;
        v12[1] = v24;
        uint64_t v26 = sub_25AF793C0();
        (*(void (**)(char *, void, uint64_t))(*(void *)(v26 - 8) + 104))(v25, v50, v26);
        (*v48)(v12, v49, v51);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v15 = sub_25AF76F18(0, *(void *)(v15 + 16) + 1, 1, v15);
        }
        unint64_t v28 = *(void *)(v15 + 16);
        unint64_t v27 = *(void *)(v15 + 24);
        if (v28 >= v27 >> 1) {
          uint64_t v15 = sub_25AF76F18(v27 > 1, v28 + 1, 1, v15);
        }
        *(void *)(v15 + 16) = v28 + 1;
        (*(void (**)(unint64_t, uint64_t *, uint64_t))(v10 + 32))(v15+ ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80))+ *(void *)(v10 + 72) * v28, v12, v51);
      }
      ++v14;
    }
    while (v13 != v14);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v15 = MEMORY[0x263F8EE78];
  }
  uint64_t v29 = v43;
  uint64_t v30 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v43 + 8);
  uint64_t v31 = swift_bridgeObjectRetain();
  uint64_t v32 = v44;
  uint64_t v33 = v42;
  uint64_t v34 = v30(v31, v42, v29);
  swift_bridgeObjectRelease();
  if (*(void *)(v15 + 16))
  {
    uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5EE8);
    MEMORY[0x270FA5388](v35);
    *(&v40 - 4) = v33;
    *(&v40 - 3) = v29;
    uint64_t v36 = v41;
    *(&v40 - 2) = v32;
    *(&v40 - 1) = v36;
    swift_bridgeObjectRetain();
    uint64_t v37 = sub_25AF73848((void (*)(uint64_t *__return_ptr, uint64_t))sub_25AF5F874, (uint64_t)(&v40 - 6), v15);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v53 = v37;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5EF0);
    sub_25AF5F8F8(&qword_26A4D5EF8, &qword_26A4D5EF0);
    sub_25AF79520();
    swift_bridgeObjectRelease();
    unint64_t v38 = (void *)swift_allocObject();
    v38[2] = v45;
    v38[3] = v46;
    v38[4] = v34;
    swift_retain();
    uint64_t v39 = (void *)sub_25AF79500();
    sub_25AF79540();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v45(v34);
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_25AF5DF74@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A4D5DA0);
  uint64_t v3 = sub_25AF792A0();
  uint64_t v4 = *(void *)(v3 - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_25AF7A830;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v4 + 16))(v6 + v5, a1, v3);
  swift_bridgeObjectRetain();
  sub_25AF5E99C(v6);
  uint64_t v7 = sub_25AF5E0EC();
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v7;
  return result;
}

uint64_t sub_25AF5E0EC()
{
  return sub_25AF79570();
}

uint64_t sub_25AF5E150(uint64_t a1, void (*a2)(uint64_t), uint64_t a3, uint64_t a4)
{
  unint64_t v6 = MEMORY[0x263F8EE78];
  unint64_t v11 = MEMORY[0x263F8EE78];
  uint64_t v7 = *(void *)(*(void *)a1 + 16);
  if (v7)
  {
    swift_bridgeObjectRetain();
    for (uint64_t i = 0; i != v7; ++i)
    {
      unint64_t v9 = swift_bridgeObjectRetain();
      sub_25AF5EB70(v9, (uint64_t (*)(uint64_t, void, unint64_t))sub_25AF5F184);
    }
    swift_bridgeObjectRelease();
    unint64_t v6 = v11;
  }
  swift_bridgeObjectRetain();
  sub_25AF5EB70(v6, (uint64_t (*)(uint64_t, void, unint64_t))sub_25AF5F184);
  a2(a4);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25AF5E24C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a1;
  *(void *)(v13 + 24) = a2;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = sub_25AF4F4A0;
  *(void *)(v14 + 24) = v13;
  uint64_t v15 = *(void (**)(uint64_t, uint64_t (*)(), uint64_t, uint64_t, uint64_t))(a8 + 24);
  swift_retain();
  v15(a6, sub_25AF5F954, v14, a7, a8);
  return swift_release();
}

uint64_t sub_25AF5E338(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t sub_25AF5E360(uint64_t a1, uint64_t a2)
{
  return sub_25AF5E454(a1, a2, &qword_26A4D5EC8);
}

uint64_t sub_25AF5E380(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a1;
  *(void *)(v11 + 24) = a2;
  id v12 = *(void (**)(uint64_t (*)(), uint64_t, uint64_t, uint64_t))(a7 + 80);
  swift_retain();
  v12(sub_25AF5F818, v11, a6, a7);
  return swift_release();
}

uint64_t sub_25AF5E434(uint64_t a1, uint64_t a2)
{
  return sub_25AF5E454(a1, a2, &qword_26A4D5ED0);
}

uint64_t sub_25AF5E454(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_25AF79570();
}

uint64_t sub_25AF5E4A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a1;
  *(void *)(v11 + 24) = a2;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = sub_25AF4F4A0;
  *(void *)(v12 + 24) = v11;
  uint64_t v13 = *(void (**)(uint64_t (*)(), uint64_t, uint64_t, uint64_t))(a7 + 88);
  swift_retain();
  v13(sub_25AF5F84C, v12, a6, a7);
  return swift_release();
}

uint64_t sub_25AF5E588(uint64_t *a1, void (*a2)(uint64_t, uint64_t), uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_25AF79330();
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *a1;
  uint64_t v40 = MEMORY[0x263F8EE78];
  uint64_t v14 = *(void *)(v13 + 16);
  if (v14)
  {
    uint64_t v32 = a3;
    uint64_t v33 = a2;
    uint64_t v34 = v4;
    uint64_t v35 = v13;
    int64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
    uint64_t v15 = v10 + 16;
    id v16 = v17;
    uint64_t v18 = v13 + ((*(unsigned __int8 *)(v15 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 64));
    uint64_t v19 = *(void *)(v15 + 56);
    uint64_t v36 = v15;
    uint64_t v37 = v9;
    unint64_t v38 = (void (**)(char *, uint64_t))(v15 - 8);
    uint64_t v39 = v19;
    swift_bridgeObjectRetain();
    uint64_t v20 = v18;
    uint64_t v31 = v14;
    uint64_t v21 = v14;
    uint64_t v22 = v37;
    do
    {
      v16(v12, v20, v22);
      uint64_t v23 = v16;
      unint64_t v24 = sub_25AF79320();
      uint64_t v25 = *v38;
      (*v38)(v12, v22);
      sub_25AF5EB70(v24, (uint64_t (*)(uint64_t, void, unint64_t))sub_25AF5EF64);
      v20 += v39;
      --v21;
    }
    while (v21);
    swift_bridgeObjectRelease();
    uint64_t v30 = v40;
    uint64_t v40 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    uint64_t v26 = v37;
    uint64_t v27 = v31;
    do
    {
      v16(v12, v18, v26);
      unint64_t v28 = sub_25AF79300();
      v25(v12, v26);
      sub_25AF5EB70(v28, (uint64_t (*)(uint64_t, void, unint64_t))sub_25AF5ED44);
      id v16 = v23;
      v18 += v39;
      --v27;
    }
    while (v27);
    swift_bridgeObjectRelease();
    v33(v30, v40);
  }
  else
  {
    a2(MEMORY[0x263F8EE78], MEMORY[0x263F8EE78]);
  }
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25AF5E818(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
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
  uint64_t v3 = sub_25AF76F3C(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v9 = (unint64_t)&v3[2 * v8 + 4];
  if (a1 + 32 < v9 + 16 * v2 && v9 < a1 + 32 + 16 * v2) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v11 = v3[2];
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_25AF79C30();
  __break(1u);
  return result;
}

uint64_t sub_25AF5E96C(unint64_t a1)
{
  return sub_25AF5EB70(a1, (uint64_t (*)(uint64_t, void, unint64_t))sub_25AF5ED44);
}

uint64_t sub_25AF5E984(unint64_t a1)
{
  return sub_25AF5EB70(a1, (uint64_t (*)(uint64_t, void, unint64_t))sub_25AF5EF64);
}

uint64_t sub_25AF5E99C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *(void *)(v3 + 24) >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v22 = v4 + v2;
  }
  else {
    int64_t v22 = v4;
  }
  unint64_t v3 = sub_25AF76F18(isUniquelyReferenced_nonNull_native, v22, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = (*(void *)(v3 + 24) >> 1) - v8;
  uint64_t v10 = *(void *)(sub_25AF792A0() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  if (v9 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = v3 + v12 + v11 * v8;
  unint64_t v14 = a1 + v12;
  uint64_t v15 = v11 * v2;
  unint64_t v16 = v13 + v15;
  unint64_t v17 = v14 + v15;
  if (v14 < v16 && v13 < v17) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    unint64_t *v1 = v3;
    return result;
  }
  uint64_t v19 = *(void *)(v3 + 16);
  BOOL v20 = __OFADD__(v19, v2);
  uint64_t v21 = v19 + v2;
  if (!v20)
  {
    *(void *)(v3 + 16) = v21;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_25AF79C30();
  __break(1u);
  return result;
}

uint64_t sub_25AF5EB40(unint64_t a1)
{
  return sub_25AF5EB70(a1, (uint64_t (*)(uint64_t, void, unint64_t))sub_25AF5F3A4);
}

uint64_t sub_25AF5EB58(unint64_t a1)
{
  return sub_25AF5EB70(a1, (uint64_t (*)(uint64_t, void, unint64_t))sub_25AF5F5C4);
}

uint64_t sub_25AF5EB70(unint64_t a1, uint64_t (*a2)(uint64_t, void, unint64_t))
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_25AF79C10();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v6 = *v2;
  if (*v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_25AF79C10();
    swift_bridgeObjectRelease();
    uint64_t v8 = v7 + v5;
    if (!__OFADD__(v7, v5)) {
      goto LABEL_5;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v8 = v7 + v5;
  if (__OFADD__(v7, v5)) {
    goto LABEL_25;
  }
LABEL_5:
  unint64_t v6 = *v2;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v2 = v6;
  uint64_t v7 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
  {
    uint64_t v10 = v6 & 0xFFFFFFFFFFFFFF8;
    if (v8 <= *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_15;
    }
    uint64_t v7 = 1;
  }
  if (v6 >> 62) {
    goto LABEL_27;
  }
  uint64_t v11 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v11 <= v8) {
      uint64_t v11 = v8;
    }
    swift_bridgeObjectRetain();
    unint64_t v6 = MEMORY[0x26115A550](v7, v11, 1, v6);
    swift_bridgeObjectRelease();
    *uint64_t v2 = v6;
    uint64_t v10 = v6 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t result = a2(v10 + 8 * *(void *)(v10 + 16) + 32, (*(void *)(v10 + 24) >> 1) - *(void *)(v10 + 16), a1);
    if (v13 >= v5) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_25AF79C10();
    swift_bridgeObjectRelease();
  }
  if (v13 >= 1)
  {
    uint64_t v14 = *(void *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v15 = __OFADD__(v14, v13);
    uint64_t v16 = v14 + v13;
    if (v15)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10) = v16;
  }
  swift_bridgeObjectRelease();
  return sub_25AF796F0();
}

uint64_t sub_25AF5ED44(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_25AF79C10();
    swift_bridgeObjectRelease();
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
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_25AF79C10();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_25AF5F8F8(&qword_26A4D5EA8, &qword_26A4D5EA0);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5EA0);
          unint64_t v12 = sub_25AF77B80(v16, i, a3);
          id v14 = *v13;
          ((void (*)(uint64_t (**)(), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
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
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_25AF48D94(0, &qword_26A4D5E98);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_25AF79C30();
  __break(1u);
  return result;
}

uint64_t sub_25AF5EF64(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_25AF79C10();
    swift_bridgeObjectRelease();
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
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_25AF79C10();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_25AF5F8F8(&qword_26A4D5EB0, &qword_26A4D5C28);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5C28);
          unint64_t v12 = sub_25AF77B80(v16, i, a3);
          id v14 = *v13;
          ((void (*)(uint64_t (**)(), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
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
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_25AF48D94(0, (unint64_t *)&qword_26A4D5B40);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_25AF79C30();
  __break(1u);
  return result;
}

uint64_t sub_25AF5F184(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_25AF79C10();
    swift_bridgeObjectRelease();
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
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_25AF79C10();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_25AF5F8F8(&qword_26A4D5F08, &qword_26A4D5F00);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5F00);
          unint64_t v12 = sub_25AF77B80(v16, i, a3);
          id v14 = *v13;
          ((void (*)(uint64_t (**)(), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
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
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_25AF48D94(0, &qword_26A4D60C0);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_25AF79C30();
  __break(1u);
  return result;
}

uint64_t sub_25AF5F3A4(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_25AF79C10();
    swift_bridgeObjectRelease();
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
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_25AF79C10();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_25AF5F8F8(&qword_26A4D5EE0, &qword_26A4D5ED8);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5ED8);
          unint64_t v12 = sub_25AF77B80(v16, i, a3);
          id v14 = *v13;
          ((void (*)(uint64_t (**)(), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
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
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_25AF48D94(0, &qword_26A4D5B48);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_25AF79C30();
  __break(1u);
  return result;
}

uint64_t sub_25AF5F5C4(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_25AF79C10();
    swift_bridgeObjectRelease();
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
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_25AF79C10();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_25AF5F8F8(&qword_26A4D5EC0, &qword_26A4D5EB8);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5EB8);
          unint64_t v12 = sub_25AF77BEC(v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
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
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_25AF79270();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_25AF79C30();
  __break(1u);
  return result;
}

uint64_t sub_25AF5F7D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25AF5E380(a1, a2, a3, a4, v4[4], v4[2], v4[3]);
}

uint64_t sub_25AF5F7E0()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25AF5F818()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_25AF5F840(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25AF5E4A8(a1, a2, a3, a4, v4[4], v4[2], v4[3]);
}

uint64_t sub_25AF5F84C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_25AF5F874@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_25AF5DF74(a1, a2);
}

uint64_t sub_25AF5F898()
{
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_25AF5F8D8(uint64_t a1)
{
  return sub_25AF5E150(a1, *(void (**)(uint64_t))(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_25AF5F8F8(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_25AF5F948(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25AF5E24C(a1, a2, a3, a4, v4[4], v4[5], v4[2], v4[3]);
}

uint64_t sub_25AF5F954()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_25AF5F98C()
{
  uint64_t v0 = sub_25AF795B0();
  __swift_allocate_value_buffer(v0, qword_26A4D5F10);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_26A4D5F10);
  if (qword_26A4D5900 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_26A4D6660);
  unint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

void sub_25AF5FA54(void *a1, uint64_t a2, uint64_t a3)
{
}

void sub_25AF5FA70(void *a1, uint64_t a2, uint64_t a3)
{
}

void sub_25AF5FA8C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t *a6)
{
  if (qword_26A4D5920 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_25AF795B0();
  __swift_project_value_buffer(v9, (uint64_t)qword_26A4D5F10);
  id v10 = a1;
  uint64_t v11 = sub_25AF795A0();
  os_log_type_t v12 = sub_25AF797D0();
  unint64_t v13 = 0x265487000uLL;
  if (os_log_type_enabled(v11, v12))
  {
    id v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v47 = swift_slowAlloc();
    uint64_t v51 = v47;
    *(_DWORD *)id v14 = 136315138;
    BOOL v15 = a6;
    id v16 = objc_msgSend(v10, sel_temporalEventTrigger);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5F30);
    uint64_t v17 = sub_25AF799B0();
    uint64_t v50 = a3;
    unint64_t v19 = v18;

    a6 = v15;
    uint64_t v20 = v17;
    unint64_t v13 = 0x265487000;
    sub_25AF772F0(v20, v19, &v51);
    sub_25AF799C0();

    a3 = v50;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25AF45000, v11, v12, "SiriKit asked for resolving temporalEventTrigger {temporalEventTrigger: %s}", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x26115ACE0](v47, -1, -1);
    MEMORY[0x26115ACE0](v14, -1, -1);
  }
  else
  {
  }
  id v21 = [v10 *(SEL *)(v13 + 2824)];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = (void *)sub_25AF79860();
    unint64_t v24 = v23;
    if (v25)
    {
      if ((_BYTE)v23)
      {
        if (v23 == 1)
        {
          uint64_t v35 = sub_25AF795A0();
          os_log_type_t v36 = sub_25AF797D0();
          if (os_log_type_enabled(v35, v36))
          {
            uint64_t v37 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v37 = 0;
            _os_log_impl(&dword_25AF45000, v35, v36, ".temporalEventTrigger.recurrenceRule is not supported {result: .unsupported(.invalidRecurrence)}", v37, 2u);
            MEMORY[0x26115ACE0](v37, -1, -1);
          }

          id v38 = objc_msgSend(self, sel_unsupportedForReason_, 2);
        }
        else
        {
          uint64_t v43 = sub_25AF795A0();
          os_log_type_t v44 = sub_25AF797D0();
          if (os_log_type_enabled(v43, v44))
          {
            uint64_t v45 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v45 = 0;
            _os_log_impl(&dword_25AF45000, v43, v44, ".temporalEventTrigger could not be converted into a dueDate, ignoring it {result: .notRequired}", v45, 2u);
            MEMORY[0x26115ACE0](v45, -1, -1);
          }

          sub_25AF48D94(0, a6);
          id v38 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_notRequired);
        }
      }
      else
      {
        uint64_t v40 = sub_25AF795A0();
        os_log_type_t v41 = sub_25AF797D0();
        if (os_log_type_enabled(v40, v41))
        {
          uint64_t v42 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v42 = 0;
          _os_log_impl(&dword_25AF45000, v40, v41, ".temporalEventTrigger would create a due date in the past {result: .unsupported(.timeInPast)}", v42, 2u);
          MEMORY[0x26115ACE0](v42, -1, -1);
        }

        id v38 = objc_msgSend(self, sel_unsupportedForReason_, 1);
      }
      id v46 = v38;
      (*(void (**)(uint64_t, id))(a3 + 16))(a3, v46);

      id v22 = v46;
    }
    else
    {
      id v26 = v23;
      uint64_t v27 = sub_25AF795A0();
      os_log_type_t v28 = sub_25AF797D0();
      if (os_log_type_enabled(v27, v28))
      {
        unsigned int v49 = v26;
        uint64_t v29 = (uint8_t *)swift_slowAlloc();
        unint64_t v48 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v29 = 138412290;
        uint64_t v51 = (uint64_t)v49;
        id v30 = v49;
        sub_25AF799C0();
        *unint64_t v48 = v24;
        sub_25AF60144(v24, 0);
        sub_25AF60144(v24, 0);
        _os_log_impl(&dword_25AF45000, v27, v28, ".temporalEventTrigger resolved to a valid date {result: .success(with: %@)}", v29, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5D80);
        swift_arrayDestroy();
        MEMORY[0x26115ACE0](v48, -1, -1);
        uint64_t v31 = v29;
        id v26 = v49;
        MEMORY[0x26115ACE0](v31, -1, -1);
      }
      else
      {
        sub_25AF60144(v24, 0);
        sub_25AF60144(v24, 0);
      }

      sub_25AF48D94(0, a6);
      id v39 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_successWithResolvedTemporalEventTrigger_, v26);
      (*(void (**)(uint64_t, id))(a3 + 16))(a3, v39);

      sub_25AF60144(v24, 0);
    }
  }
  else
  {
    uint64_t v32 = sub_25AF795A0();
    os_log_type_t v33 = sub_25AF797D0();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v34 = 0;
      _os_log_impl(&dword_25AF45000, v32, v33, ".temporalEventTrigger is nil {result: .notRequired}", v34, 2u);
      MEMORY[0x26115ACE0](v34, -1, -1);
    }

    sub_25AF48D94(0, a6);
    id v22 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_notRequired);
    (*(void (**)(uint64_t, id))(a3 + 16))(a3, v22);
  }
}

void sub_25AF60144(id a1, char a2)
{
  if ((a2 & 1) == 0) {
}
  }

unint64_t sub_25AF60150(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D6050);
  uint64_t v2 = (void *)sub_25AF79C20();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  int64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_25AF68944(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
    v4 += 3;
    if (!--v3)
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

unint64_t sub_25AF6026C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D6058);
  uint64_t v2 = sub_25AF79C20();
  uint64_t v3 = (void *)v2;
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
    sub_25AF54E58(v6, (uint64_t)&v15, &qword_26A4D6060);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_25AF68944(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_25AF670D4(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
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

uint64_t sub_25AF603A4()
{
  uint64_t v0 = sub_25AF795B0();
  __swift_allocate_value_buffer(v0, qword_26A4D5F40);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_26A4D5F40);
  if (qword_26A4D5900 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_26A4D6660);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

void sub_25AF60668(unint64_t a1, void (*a2)(NSObject *))
{
  if (qword_26A4D5928 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_25AF795B0();
  __swift_project_value_buffer(v5, (uint64_t)qword_26A4D5F40);
  swift_bridgeObjectRetain_n();
  uint64_t v6 = sub_25AF795A0();
  LOBYTE(v7) = sub_25AF797D0();
  unint64_t v8 = a1 >> 62;
  if (!os_log_type_enabled(v6, (os_log_type_t)v7))
  {

    swift_bridgeObjectRelease_n();
    goto LABEL_8;
  }
  uint64_t v2 = (uint8_t *)swift_slowAlloc();
  *(_DWORD *)uint64_t v2 = 134217984;
  if (v8) {
    goto LABEL_33;
  }
  uint64_t v9 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    swift_bridgeObjectRelease();
    uint64_t v26 = v9;
    sub_25AF799C0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25AF45000, v6, (os_log_type_t)v7, "Search dataSource returned %ld reminders", v2, 0xCu);
    MEMORY[0x26115ACE0](v2, -1, -1);

LABEL_8:
    if (v8)
    {
      swift_bridgeObjectRetain();
      uint64_t v10 = sub_25AF79C10();
      swift_bridgeObjectRelease();
      if (v10 <= 9)
      {
LABEL_10:
        sub_25AF48D94(0, &qword_26A4D5B50);
        a1 = sub_25AF798F0();
        goto LABEL_13;
      }
    }
    else if (*(uint64_t *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10) <= 9)
    {
      goto LABEL_10;
    }
    swift_bridgeObjectRetain();
LABEL_13:
    if (a1 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v7 = sub_25AF79C10();
      swift_bridgeObjectRelease();
      if (!v7) {
        goto LABEL_24;
      }
    }
    else
    {
      uint64_t v7 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (!v7) {
        goto LABEL_24;
      }
    }
    uint64_t v26 = MEMORY[0x263F8EE78];
    uint64_t v6 = &v26;
    sub_25AF79B10();
    if ((v7 & 0x8000000000000000) == 0) {
      break;
    }
    __break(1u);
LABEL_33:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_25AF79C10();
    swift_bridgeObjectRelease();
  }
  sub_25AF48D94(0, &qword_26A4D5B50);
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v11 = 0;
    do
    {
      uint64_t v12 = v11 + 1;
      MEMORY[0x26115A540]();
      sub_25AF79900();
      sub_25AF79AF0();
      sub_25AF79B20();
      sub_25AF79B30();
      sub_25AF79B00();
      uint64_t v11 = v12;
    }
    while (v7 != v12);
  }
  else
  {
    BOOL v13 = (void **)(a1 + 32);
    do
    {
      uint64_t v14 = *v13++;
      id v15 = v14;
      sub_25AF79900();
      sub_25AF79AF0();
      sub_25AF79B20();
      sub_25AF79B30();
      sub_25AF79B00();
      --v7;
    }
    while (v7);
  }
LABEL_24:
  swift_bridgeObjectRelease();
  id v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FE98]), sel_initWithCode_userActivity_, 3, 0);
  sub_25AF48D94(0, &qword_26A4D5B50);
  long long v17 = (void *)sub_25AF796C0();
  swift_bridgeObjectRelease();
  objc_msgSend(v16, sel_setTasks_, v17);

  unint64_t v18 = v16;
  unint64_t v19 = sub_25AF795A0();
  os_log_type_t v20 = sub_25AF797D0();
  if (os_log_type_enabled(v19, v20))
  {
    id v21 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)id v21 = 134217984;
    id v22 = [v18 tasks];
    if (v22)
    {
      uint64_t v23 = v22;
      unint64_t v24 = sub_25AF796D0();

      if (v24 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v25 = sub_25AF79C10();

        swift_bridgeObjectRelease_n();
      }
      else
      {
        uint64_t v25 = *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10);

        swift_bridgeObjectRelease();
      }
    }
    else
    {

      uint64_t v25 = -1;
    }
    uint64_t v26 = v25;
    sub_25AF799C0();

    _os_log_impl(&dword_25AF45000, v19, v20, "Return success search result {tasksCount: %ld}", v21, 0xCu);
    MEMORY[0x26115ACE0](v21, -1, -1);
  }
  else
  {

    unint64_t v19 = v18;
  }

  a2(v18);
}

void sub_25AF60B8C(uint64_t a1, void *a2, void (*a3)(NSObject *))
{
  unint64_t v5 = sub_25AF79320();
  unint64_t v6 = sub_25AF79300();
  if (qword_26A4D5928 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_25AF795B0();
  __swift_project_value_buffer(v7, (uint64_t)qword_26A4D5F40);
  swift_bridgeObjectRetain_n();
  unint64_t v8 = sub_25AF795A0();
  os_log_type_t v9 = sub_25AF797D0();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 134217984;
    if (v5 >> 62)
    {
      swift_bridgeObjectRetain();
      sub_25AF79C10();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    sub_25AF799C0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25AF45000, v8, v9, "Search dataSource returned %ld lists", v10, 0xCu);
    MEMORY[0x26115ACE0](v10, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  uint64_t v11 = sub_25AF795A0();
  os_log_type_t v12 = sub_25AF797D0();
  if (os_log_type_enabled(v11, v12))
  {
    BOOL v13 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)BOOL v13 = 134217984;
    if (v6 >> 62)
    {
      swift_bridgeObjectRetain();
      sub_25AF79C10();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    sub_25AF799C0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25AF45000, v11, v12, "Search dataSource returned %ld smartLists", v13, 0xCu);
    MEMORY[0x26115ACE0](v13, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  id v14 = a2;
  uint64_t v15 = sub_25AF619F4(v5, (uint64_t)v14, (uint64_t)v28, (void (*)(uint64_t *__return_ptr, id *, uint64_t))sub_25AF6108C);
  swift_bridgeObjectRelease();

  id v16 = v14;
  unint64_t v17 = sub_25AF619F4(v6, (uint64_t)v16, (uint64_t)v27, (void (*)(uint64_t *__return_ptr, id *, uint64_t))sub_25AF61534);
  swift_bridgeObjectRelease();

  id v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FE98]), sel_initWithCode_userActivity_, 3, 0);
  sub_25AF5EB40(v17);
  sub_25AF48D94(0, &qword_26A4D5B48);
  unint64_t v19 = (void *)sub_25AF796C0();
  swift_bridgeObjectRelease();
  objc_msgSend(v18, sel_setTaskLists_, v19, v15);

  os_log_type_t v20 = v18;
  id v21 = sub_25AF795A0();
  os_log_type_t v22 = sub_25AF797D0();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v23 = 134217984;
    id v24 = [v20 taskLists];
    if (v24)
    {
      uint64_t v25 = v24;
      unint64_t v26 = sub_25AF796D0();

      if (v26 >> 62)
      {
        swift_bridgeObjectRetain();
        sub_25AF79C10();

        swift_bridgeObjectRelease_n();
      }
      else
      {

        swift_bridgeObjectRelease();
      }
    }
    else
    {
    }
    sub_25AF799C0();

    _os_log_impl(&dword_25AF45000, v21, v22, "Return success search result {taskListsCount: %ld}", v23, 0xCu);
    MEMORY[0x26115ACE0](v23, -1, -1);
  }
  else
  {

    id v21 = v20;
  }

  a3(v20);
}

void sub_25AF6108C(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2 = *a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A4D5DA0);
  uint64_t v3 = sub_25AF792A0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 72);
  unint64_t v6 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_25AF7ACC0;
  unint64_t v8 = (void *)(v7 + v6);
  os_log_type_t v9 = (char *)v8 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A4D6048) + 48);
  void *v8 = objc_msgSend(v2, sel_objectID);
  uint64_t v10 = *MEMORY[0x263F63148];
  uint64_t v11 = sub_25AF79290();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 104))(v9, v10, v11);
  os_log_type_t v12 = *(void (**)(void))(v4 + 104);
  ((void (*)(void *, void, uint64_t))v12)(v8, *MEMORY[0x263F63120], v3);
  *((unsigned char *)v8 + v5) = 0;
  v12();
  sub_25AF79360();
  id v13 = objc_msgSend(self, sel_defaultFetchOptions);
  id v14 = v29;
  sub_25AF79350();
  if (v29)
  {

    swift_bridgeObjectRelease();
    if (qword_26A4D5928 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_25AF795B0();
    __swift_project_value_buffer(v15, (uint64_t)qword_26A4D5F40);
    id v16 = v29;
    id v17 = v2;
    id v18 = v29;
    unint64_t v19 = sub_25AF795A0();
    os_log_type_t v20 = sub_25AF797B0();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = swift_slowAlloc();
      os_log_type_t v22 = (void *)swift_slowAlloc();
      uint64_t v30 = swift_slowAlloc();
      uint64_t v32 = v30;
      *(_DWORD *)uint64_t v21 = 138412546;
      id v23 = objc_msgSend(v17, sel_objectID);
      sub_25AF799C0();
      void *v22 = v23;

      *(_WORD *)(v21 + 12) = 2080;
      swift_getErrorValue();
      uint64_t v24 = sub_25AF79CA0();
      sub_25AF772F0(v24, v25, &v32);
      sub_25AF799C0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_25AF45000, v19, v20, "Error fetching reminders for list {listID: %@, error: %s", (uint8_t *)v21, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5D80);
      swift_arrayDestroy();
      MEMORY[0x26115ACE0](v22, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x26115ACE0](v30, -1, -1);
      MEMORY[0x26115ACE0](v21, -1, -1);
    }
    else
    {
    }
    sub_25AF48D94(0, &qword_26A4D5B48);
    id v28 = v17;
    uint64_t v27 = sub_25AF79760();
  }
  else
  {

    swift_bridgeObjectRelease();
    sub_25AF48D94(0, &qword_26A4D5B48);
    id v26 = v2;
    uint64_t v27 = sub_25AF79770();
  }
  *a2 = v27;
}

void sub_25AF61534(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = *a1;
  sub_25AF79360();
  sub_25AF79340();
  if (v2)
  {
    if (qword_26A4D5928 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_25AF795B0();
    __swift_project_value_buffer(v5, (uint64_t)qword_26A4D5F40);
    id v6 = v2;
    id v7 = v4;
    id v8 = v2;
    os_log_type_t v9 = sub_25AF795A0();
    os_log_type_t v10 = sub_25AF797B0();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = swift_slowAlloc();
      os_log_type_t v12 = (void *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      uint64_t v21 = v19;
      *(_DWORD *)uint64_t v11 = 138412546;
      os_log_type_t v20 = a2;
      id v13 = objc_msgSend(v7, sel_objectID);
      sub_25AF799C0();
      *os_log_type_t v12 = v13;

      *(_WORD *)(v11 + 12) = 2080;
      swift_getErrorValue();
      uint64_t v14 = sub_25AF79CA0();
      sub_25AF772F0(v14, v15, &v21);
      a2 = v20;
      sub_25AF799C0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_25AF45000, v9, v10, "Error fetching reminders for smartList {smartListID: %@, error: %s", (uint8_t *)v11, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5D80);
      swift_arrayDestroy();
      MEMORY[0x26115ACE0](v12, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x26115ACE0](v19, -1, -1);
      MEMORY[0x26115ACE0](v11, -1, -1);
    }
    else
    {
    }
    sub_25AF48D94(0, &qword_26A4D5B48);
    id v18 = v7;
    uint64_t v17 = sub_25AF79740();
  }
  else
  {
    sub_25AF48D94(0, &qword_26A4D5B48);
    id v16 = v4;
    uint64_t v17 = sub_25AF79740();
  }
  *a2 = v17;
}

void sub_25AF6186C(void *a1, int a2, void *a3, void *aBlock, void (*a5)(id, id, void *))
{
  id v8 = _Block_copy(aBlock);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a1;
  a5(v9, v10, v8);
  _Block_release(v8);
  _Block_release(v8);
}

id sub_25AF61930()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TTRSearchForNotebookItemsIntentHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for TTRSearchForNotebookItemsIntentHandler()
{
  return self;
}

uint64_t sub_25AF619F4(unint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t *__return_ptr, id *, uint64_t))
{
  if (a1 >> 62) {
    goto LABEL_16;
  }
  uint64_t v7 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t result = MEMORY[0x263F8EE78];
    if (!v7) {
      break;
    }
    uint64_t v15 = MEMORY[0x263F8EE78];
    uint64_t result = sub_25AF79B10();
    if (v7 < 0)
    {
      __break(1u);
      return result;
    }
    uint64_t v9 = 0;
    while (v7 != v9)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v10 = (id)MEMORY[0x26115A540](v9, a1);
      }
      else {
        id v10 = *(id *)(a1 + 8 * v9 + 32);
      }
      uint64_t v11 = v10;
      id v13 = v10;
      a4(&v14, &v13, a2);

      if (v4) {
        return swift_release();
      }
      ++v9;
      sub_25AF79AF0();
      sub_25AF79B20();
      sub_25AF79B30();
      sub_25AF79B00();
      if (v7 == v9) {
        return v15;
      }
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_25AF79C10();
    swift_bridgeObjectRelease();
  }
  return result;
}

void sub_25AF61B68(void *a1, uint64_t a2, void (**a3)(void, void))
{
  uint64_t v5 = sub_25AF795B0();
  uint64_t v24 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v27 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A4D5928 != -1) {
    swift_once();
  }
  uint64_t v25 = v5;
  uint64_t v7 = __swift_project_value_buffer(v5, (uint64_t)qword_26A4D5F40);
  id v8 = a1;
  uint64_t v9 = sub_25AF795A0();
  os_log_type_t v10 = sub_25AF797D0();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v26 = v7;
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    id v28 = a3;
    uint64_t v29 = v8;
    id v13 = (void *)v12;
    *(_DWORD *)uint64_t v11 = 138412290;
    uint64_t v14 = v8;
    uint64_t v7 = v26;
    sub_25AF799C0();
    *id v13 = v8;

    _os_log_impl(&dword_25AF45000, v9, v10, "SiriKit asked for resolving itemType {intent: %@}", v11, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5D80);
    swift_arrayDestroy();
    uint64_t v15 = v13;
    a3 = v28;
    MEMORY[0x26115ACE0](v15, -1, -1);
    MEMORY[0x26115ACE0](v11, -1, -1);
  }
  else
  {
  }
  switch((unint64_t)[v8 itemType])
  {
    case 0uLL:
    case 3uLL:
      goto LABEL_7;
    case 1uLL:
      sub_25AF48D94(0, (unint64_t *)&unk_26A4D6070);
      id v16 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupported);
      goto LABEL_9;
    case 2uLL:
      if (sub_25AF798A0()) {
LABEL_7:
      }
        id v16 = objc_msgSend(self, sel_successWithResolvedNotebookItemType_, 3);
      else {
        id v16 = objc_msgSend(self, sel_successWithResolvedNotebookItemType_, 2);
      }
LABEL_9:
      uint64_t v17 = v16;
      id v18 = sub_25AF795A0();
      os_log_type_t v19 = sub_25AF797D0();
      if (os_log_type_enabled(v18, v19))
      {
        os_log_type_t v20 = (uint8_t *)swift_slowAlloc();
        uint64_t v21 = (void *)swift_slowAlloc();
        *(_DWORD *)os_log_type_t v20 = 138412290;
        uint64_t v29 = v17;
        os_log_type_t v22 = v17;
        sub_25AF799C0();
        *uint64_t v21 = v17;

        _os_log_impl(&dword_25AF45000, v18, v19, "Resolved itemType {result: %@}", v20, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5D80);
        swift_arrayDestroy();
        MEMORY[0x26115ACE0](v21, -1, -1);
        MEMORY[0x26115ACE0](v20, -1, -1);
      }
      else
      {

        id v18 = v17;
      }

      ((void (**)(void, NSObject *))a3)[2](a3, v17);
      return;
    default:
      (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v27, v7, v25);
      uint64_t v23 = MEMORY[0x263F8EE78];
      sub_25AF6026C(MEMORY[0x263F8EE78]);
      sub_25AF6026C(v23);
      _Block_release(a3);
      sub_25AF58288((uint64_t)"unknown item type", 17, 2);
      __break(1u);
      JUMPOUT(0x25AF61FECLL);
  }
}

uint64_t sub_25AF61FFC(void *a1, char *a2, const void *a3)
{
  v607 = a2;
  uint64_t v580 = sub_25AF78FC0();
  uint64_t v579 = *(void *)(v580 - 8);
  MEMORY[0x270FA5388](v580);
  v578 = (char *)v536 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5FE0);
  MEMORY[0x270FA5388](v6 - 8);
  v573 = (char *)v536 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  v574 = (char *)v536 - v9;
  MEMORY[0x270FA5388](v10);
  v545 = (char *)v536 - v11;
  MEMORY[0x270FA5388](v12);
  v546 = (char *)v536 - v13;
  MEMORY[0x270FA5388](v14);
  v555 = (char *)v536 - v15;
  MEMORY[0x270FA5388](v16);
  v554 = (char *)v536 - v17;
  MEMORY[0x270FA5388](v18);
  v565 = (char *)v536 - v19;
  v603 = (void *)sub_25AF78E40();
  uint64_t v617 = *(v603 - 1);
  MEMORY[0x270FA5388](v603);
  v577 = (char *)v536 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  v566 = (char *)v536 - v22;
  MEMORY[0x270FA5388](v23);
  v564 = (char *)v536 - v24;
  uint64_t v602 = sub_25AF78F20();
  uint64_t v605 = *(void *)(v602 - 8);
  MEMORY[0x270FA5388](v602);
  v572 = (char *)v536 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v26);
  v569 = (char *)v536 - v27;
  MEMORY[0x270FA5388](v28);
  v544 = (char *)v536 - v29;
  MEMORY[0x270FA5388](v30);
  v590 = (char *)v536 - v31;
  MEMORY[0x270FA5388](v32);
  v543 = (char *)v536 - v33;
  MEMORY[0x270FA5388](v34);
  v599 = (char *)v536 - v35;
  MEMORY[0x270FA5388](v36);
  v563 = (char *)v536 - v37;
  MEMORY[0x270FA5388](v38);
  v615 = (char *)v536 - v39;
  MEMORY[0x270FA5388](v40);
  v606 = (char *)v536 - v41;
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A4D5FE8);
  MEMORY[0x270FA5388](v42 - 8);
  v562 = (char *)v536 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v44);
  v598 = (void (*)(void, void))((char *)v536 - v45);
  uint64_t v604 = sub_25AF78FD0();
  uint64_t v601 = *(void *)(v604 - 8);
  MEMORY[0x270FA5388](v604);
  v608 = (char *)v536 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5B30);
  MEMORY[0x270FA5388](v47 - 8);
  uint64_t v589 = (uint64_t)v536 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v49);
  v595 = (char *)v536 - v50;
  MEMORY[0x270FA5388](v51);
  uint64_t v561 = (uint64_t)v536 - v52;
  MEMORY[0x270FA5388](v53);
  v597 = (void (*)(void, void))((char *)v536 - v54);
  MEMORY[0x270FA5388](v55);
  uint64_t v588 = (uint64_t)v536 - v56;
  MEMORY[0x270FA5388](v57);
  v586 = (char *)v536 - v58;
  MEMORY[0x270FA5388](v59);
  uint64_t v587 = (uint64_t)v536 - v60;
  MEMORY[0x270FA5388](v61);
  uint64_t v621 = (uint64_t)v536 - v62;
  MEMORY[0x270FA5388](v63);
  v584 = (char *)v536 - v64;
  MEMORY[0x270FA5388](v65);
  uint64_t v585 = (uint64_t)v536 - v66;
  MEMORY[0x270FA5388](v67);
  uint64_t v609 = (uint64_t)v536 - v68;
  uint64_t v553 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5FF8);
  MEMORY[0x270FA5388](v553);
  uint64_t v600 = (uint64_t)v536 - ((v69 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v70);
  v591 = (char *)v536 - v71;
  MEMORY[0x270FA5388](v72);
  uint64_t v74 = (BOOL *)v536 - v73;
  MEMORY[0x270FA5388](v75);
  v552 = (char *)v536 - v76;
  uint64_t v77 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A4D6000);
  MEMORY[0x270FA5388](v77 - 8);
  v583 = (void (*)(BOOL *, uint64_t, uint64_t, uint64_t))((char *)v536 - ((v78 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v616 = sub_25AF794D0();
  v611 = *(void (**)(void))(v616 - 8);
  MEMORY[0x270FA5388](v616);
  v560 = (char *)v536 - ((v79 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v80);
  v551 = (char *)v536 - v81;
  MEMORY[0x270FA5388](v82);
  v557 = (char *)v536 - v83;
  MEMORY[0x270FA5388](v84);
  v596 = (char *)v536 - v85;
  uint64_t v86 = sub_25AF792A0();
  uint64_t v620 = *(void *)(v86 - 8);
  MEMORY[0x270FA5388](v86);
  v594 = (BOOL *)v536 - ((v87 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v88);
  v571 = (char *)v536 - v89;
  MEMORY[0x270FA5388](v90);
  v570 = (char *)v536 - v91;
  MEMORY[0x270FA5388](v92);
  v556 = (char *)v536 - v93;
  MEMORY[0x270FA5388](v94);
  v593 = (char *)v536 - v95;
  MEMORY[0x270FA5388](v96);
  v592 = (char *)v536 - v97;
  MEMORY[0x270FA5388](v98);
  v581 = (char *)v536 - v99;
  MEMORY[0x270FA5388](v100);
  v582 = (char *)v536 - v101;
  MEMORY[0x270FA5388](v102);
  v542 = (char *)v536 - v103;
  MEMORY[0x270FA5388](v104);
  v568 = (char *)v536 - v105;
  MEMORY[0x270FA5388](v106);
  v567 = (char *)v536 - v107;
  MEMORY[0x270FA5388](v108);
  v576 = (void *)((char *)v536 - v109);
  MEMORY[0x270FA5388](v110);
  v619 = (BOOL *)v536 - v111;
  MEMORY[0x270FA5388](v112);
  v558 = (void *)((char *)v536 - v113);
  MEMORY[0x270FA5388](v114);
  v559 = (NSObject **)((char *)v536 - v115);
  MEMORY[0x270FA5388](v116);
  v550 = (char *)v536 - v117;
  MEMORY[0x270FA5388](v118);
  v613 = ((char *)v536 - v119);
  MEMORY[0x270FA5388](v120);
  v612 = (char *)v536 - v121;
  uint64_t v122 = sub_25AF795B0();
  uint64_t v123 = *(void *)(v122 - 8);
  MEMORY[0x270FA5388](v122);
  long long v125 = (char *)v536 - ((v124 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v126);
  v537 = (char *)v536 - v127;
  MEMORY[0x270FA5388](v128);
  uint64_t v130 = (char *)v536 - v129;
  uint64_t v614 = swift_allocObject();
  *(void *)(v614 + 16) = a3;
  v575 = a3;
  _Block_copy(a3);
  if (qword_26A4D5928 != -1) {
    swift_once();
  }
  uint64_t v131 = __swift_project_value_buffer(v122, (uint64_t)qword_26A4D5F40);
  id v132 = *(void (**)(void, void, void))(v123 + 16);
  uint64_t v539 = v123 + 16;
  v538 = (void (*)(char *, uint64_t, uint64_t))v132;
  v132(v130, v131, v122);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5B68);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25AF7A830;
  *(void *)(inited + 32) = 0x746E65746E69;
  *(void *)(inited + 40) = 0xE600000000000000;
  *(void *)(inited + 72) = sub_25AF48D94(0, &qword_26A4D6010);
  *(void *)(inited + 48) = a1;
  id v134 = a1;
  sub_25AF6026C(inited);
  sub_25AF57F94();
  swift_bridgeObjectRelease();
  uint64_t v135 = *(void (**)(char *, uint64_t))(v123 + 8);
  uint64_t v540 = v122;
  v135(v130, v122);
  uint64_t v136 = v134;
  uint64_t v610 = v131;
  id v137 = sub_25AF795A0();
  os_log_type_t v138 = sub_25AF797D0();
  BOOL v139 = os_log_type_enabled(v137, v138);
  v622 = v74;
  uint64_t v623 = v86;
  v541 = v125;
  if (v139)
  {
    id v140 = (uint8_t *)swift_slowAlloc();
    uint64_t v141 = (void *)swift_slowAlloc();
    *(_DWORD *)id v140 = 138412290;
    v628 = v136;
    os_log_type_t v142 = v136;
    sub_25AF799C0();
    *uint64_t v141 = v136;

    uint64_t v74 = v622;
    _os_log_impl(&dword_25AF45000, v137, v138, "SiriKit asked for handling search {intent: %@}", v140, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5D80);
    swift_arrayDestroy();
    MEMORY[0x26115ACE0](v141, -1, -1);
    MEMORY[0x26115ACE0](v140, -1, -1);
  }
  else
  {

    id v137 = v136;
  }
  uint64_t v143 = v136;

  unint64_t v629 = MEMORY[0x263F8EE78];
  unint64_t v630 = MEMORY[0x263F8EE78];
  id v144 = [v136 title];
  uint64_t v145 = v144;
  if (v144)
  {
    id v146 = objc_msgSend(v144, sel_spokenPhrase);

    uint64_t v145 = (void *)sub_25AF79640();
    uint64_t v148 = v147;
  }
  else
  {
    uint64_t v148 = 0;
  }
  id v149 = [v136 content];
  if (v149)
  {
    uint64_t v150 = v149;
    uint64_t v151 = sub_25AF79640();
    uint64_t v153 = v152;
  }
  else
  {
    uint64_t v151 = 0;
    uint64_t v153 = 0;
  }
  v618 = v136;
  if (!((unint64_t)v148 | (unint64_t)v153)) {
    goto LABEL_41;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D6028);
  uint64_t v154 = swift_initStackObject();
  *(_OWORD *)(v154 + 16) = xmmword_25AF7ACC0;
  *(void *)(v154 + 32) = v145;
  *(void *)(v154 + 40) = v148;
  *(void *)(v154 + 48) = v151;
  *(void *)(v154 + 56) = v153;
  if (!v148)
  {
    v155 = MEMORY[0x263F8EE78];
    uint64_t v158 = v623;
    if (!v153) {
      goto LABEL_24;
    }
    goto LABEL_19;
  }
  swift_bridgeObjectRetain();
  v155 = sub_25AF76F3C(0, 1, 1, MEMORY[0x263F8EE78]);
  unint64_t isa = (unint64_t)v155[2].isa;
  unint64_t v156 = (unint64_t)v155[3].isa;
  if (isa >= v156 >> 1) {
    v155 = sub_25AF76F3C((void *)(v156 > 1), isa + 1, 1, v155);
  }
  uint64_t v158 = v623;
  v155[2].unint64_t isa = (Class)(isa + 1);
  uint64_t v159 = &v155[2 * isa];
  v159[4].unint64_t isa = (Class)v145;
  v159[5].unint64_t isa = v148;
  if (v153)
  {
LABEL_19:
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      v155 = sub_25AF76F3C(0, (int64_t)v155[2].isa + 1, 1, v155);
    }
    unint64_t v161 = (unint64_t)v155[2].isa;
    unint64_t v160 = (unint64_t)v155[3].isa;
    if (v161 >= v160 >> 1) {
      v155 = sub_25AF76F3C((void *)(v160 > 1), v161 + 1, 1, v155);
    }
    v155[2].unint64_t isa = (Class)(v161 + 1);
    id v162 = &v155[2 * v161];
    v162[4].unint64_t isa = (Class)v151;
    v162[5].unint64_t isa = v153;
  }
LABEL_24:
  swift_release();
  v628 = v155;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D6030);
  sub_25AF67078();
  uint64_t v163 = sub_25AF79600();
  id v165 = v164;
  swift_bridgeObjectRelease();
  uint64_t v166 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D6020);
  unsigned int v167 = v612;
  id v168 = &v612[*(int *)(v166 + 48)];
  v536[0] = v163;
  *(void *)v612 = v163;
  *((void *)v167 + 1) = v165;
  uint64_t v169 = *MEMORY[0x263F63280];
  uint64_t v170 = sub_25AF793C0();
  os_log_type_t v171 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v170 - 8) + 104);
  v171(v168, v169, v170);
  uint64_t v172 = *MEMORY[0x263F63110];
  uint64_t v173 = *(void (**)(void, void, void))(v620 + 104);
  v536[1] = v620 + 104;
  v549 = (void (*)(NSObject *, uint64_t, uint64_t))v173;
  v173(v167, v172, v158);
  unint64_t v174 = v630;
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v174 = sub_25AF76F18(0, *(void *)(v174 + 16) + 1, 1, v174);
  }
  unint64_t v176 = *(void *)(v174 + 16);
  unint64_t v175 = *(void *)(v174 + 24);
  if (v176 >= v175 >> 1) {
    unint64_t v174 = sub_25AF76F18(v175 > 1, v176 + 1, 1, v174);
  }
  *(void *)(v174 + 16) = v176 + 1;
  id v177 = *(char **)(v620 + 32);
  unint64_t v548 = (*(unsigned __int8 *)(v620 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v620 + 80);
  uint64_t v547 = *(void *)(v620 + 72);
  unint64_t v178 = v174 + v548 + v547 * v176;
  id v179 = v612;
  uint64_t v180 = v623;
  v612 = v177;
  ((void (*)(unint64_t, char *, uint64_t))v177)(v178, v179, v623);
  unint64_t v630 = v174;
  uint64_t v181 = *(int *)(v166 + 48);
  v182 = v613;
  id v183 = (char *)v613 + v181;
  v613->unint64_t isa = (Class)v536[0];
  v182[1].unint64_t isa = v165;
  v171(v183, v169, v170);
  v549(v182, v172, v180);
  unint64_t v184 = v629;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v184 = sub_25AF76F18(0, *(void *)(v184 + 16) + 1, 1, v184);
  }
  uint64_t v74 = v622;
  uint64_t v143 = v618;
  unint64_t v186 = *(void *)(v184 + 16);
  unint64_t v185 = *(void *)(v184 + 24);
  if (v186 >= v185 >> 1) {
    unint64_t v184 = sub_25AF76F18(v185 > 1, v186 + 1, 1, v184);
  }
  *(void *)(v184 + 16) = v186 + 1;
  ((void (*)(unint64_t, NSObject *, uint64_t))v612)(v184 + v548 + v186 * v547, v613, v623);
  unint64_t v629 = v184;
  id v187 = [v143 title];
  if (v187)
  {
    os_log_type_t v188 = v187;
    id v189 = objc_msgSend(v187, sel_vocabularyIdentifier);

    if (v189)
    {
      uint64_t v190 = sub_25AF79640();
      uint64_t v192 = v191;

      if (v190 == 0xD000000000000011 && v192 == 0x800000025AF80000)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        char v193 = sub_25AF79C80();
        swift_bridgeObjectRelease();
        if ((v193 & 1) == 0) {
          goto LABEL_41;
        }
      }
      uint64_t v194 = *MEMORY[0x263F63178];
      uint64_t v195 = sub_25AF792E0();
      uint64_t v196 = v550;
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v195 - 8) + 104))(v550, v194, v195);
      v549(v196, *MEMORY[0x263F63130], v623);
      unint64_t v198 = *(void *)(v184 + 16);
      unint64_t v197 = *(void *)(v184 + 24);
      if (v198 >= v197 >> 1) {
        unint64_t v184 = sub_25AF76F18(v197 > 1, v198 + 1, 1, v184);
      }
      *(void *)(v184 + 16) = v198 + 1;
      ((void (*)(unint64_t, char *, uint64_t))v612)(v184 + v548 + v198 * v547, v196, v623);
      unint64_t v629 = v184;
    }
  }
LABEL_41:
  id v199 = [v143 notebookItemIdentifier];
  if (v199)
  {
    uint64_t v200 = v199;
    uint64_t v201 = sub_25AF79640();
    unint64_t v203 = v202;

    swift_bridgeObjectRetain();
    uint64_t v204 = (uint64_t)v583;
    sub_25AF794C0();
    uint64_t v205 = v611;
    uint64_t v206 = v616;
    if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t))v611 + 6))(v204, 1, v616) == 1)
    {
      sub_25AF54EBC(v204, (uint64_t *)&unk_26A4D6000);
      swift_bridgeObjectRetain();
      uint64_t v207 = sub_25AF795A0();
      os_log_type_t v208 = sub_25AF797B0();
      if (os_log_type_enabled(v207, v208))
      {
        uint64_t v209 = (uint8_t *)swift_slowAlloc();
        uint64_t v210 = swift_slowAlloc();
        v628 = v210;
        *(_DWORD *)uint64_t v209 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v627 = sub_25AF772F0(v201, v203, (uint64_t *)&v628);
        uint64_t v143 = v618;
        sub_25AF799C0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_25AF45000, v207, v208, "[Announce Reminders] Unable to create itemIdentifier from %s", v209, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x26115ACE0](v210, -1, -1);
        MEMORY[0x26115ACE0](v209, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      uint64_t v227 = v623;
      uint64_t v228 = v620;
      uint64_t v74 = v622;
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v217 = v596;
      (*((void (**)(char *, uint64_t, uint64_t))v205 + 4))(v596, v204, v206);
      uint64_t v218 = (void (*)(char *, char *, uint64_t))*((void *)v205 + 2);
      v219 = v557;
      v218(v557, v217, v206);
      v220 = sub_25AF795A0();
      os_log_type_t v221 = sub_25AF797D0();
      if (os_log_type_enabled(v220, v221))
      {
        uint64_t v222 = (uint8_t *)swift_slowAlloc();
        v613 = swift_slowAlloc();
        v628 = v613;
        *(_DWORD *)uint64_t v222 = 136446210;
        v218(v551, v219, v616);
        uint64_t v223 = sub_25AF79650();
        uint64_t v627 = sub_25AF772F0(v223, v224, (uint64_t *)&v628);
        uint64_t v206 = v616;
        sub_25AF799C0();
        swift_bridgeObjectRelease();
        v225 = (void (*)(char *, uint64_t))*((void *)v205 + 1);
        v225(v219, v206);
        _os_log_impl(&dword_25AF45000, v220, v221, "[Announce Reminders] requestIdentifier:%{public}s", v222, 0xCu);
        id v226 = v613;
        swift_arrayDestroy();
        MEMORY[0x26115ACE0](v226, -1, -1);
        MEMORY[0x26115ACE0](v222, -1, -1);
      }
      else
      {
        v225 = (void (*)(char *, uint64_t))*((void *)v205 + 1);
        v225(v219, v206);
      }

      uint64_t v229 = v620;
      v230 = (uint64_t *)v560;
      v218(v560, v596, v206);
      int v231 = (*((uint64_t (**)(uint64_t *, uint64_t))v205 + 11))(v230, v206);
      if (v231 == *MEMORY[0x263F63348])
      {
        (*((void (**)(uint64_t *, uint64_t))v205 + 12))(v230, v206);
        uint64_t v232 = *v230;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5980);
        uint64_t v233 = swift_allocObject();
        *(_OWORD *)(v233 + 16) = xmmword_25AF7A510;
        *(void *)(v233 + 32) = v232;
        v628 = v233;
        sub_25AF796F0();
        *v559 = v628;
        uint64_t v227 = v623;
        (*(void (**)(void))(v229 + 104))();
        unint64_t v234 = v630;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v234 = sub_25AF76F18(0, *(void *)(v234 + 16) + 1, 1, v234);
        }
        uint64_t v74 = v622;
        unint64_t v236 = *(void *)(v234 + 16);
        unint64_t v235 = *(void *)(v234 + 24);
        if (v236 >= v235 >> 1) {
          unint64_t v234 = sub_25AF76F18(v235 > 1, v236 + 1, 1, v234);
        }
        *(void *)(v234 + 16) = v236 + 1;
        uint64_t v237 = *(unsigned __int8 *)(v229 + 80);
        uint64_t v238 = *(void *)(v229 + 72);
        (*(void (**)(unint64_t, NSObject **, uint64_t))(v229 + 32))(v234 + ((v237 + 32) & ~v237) + v238 * v236, v559, v227);
      }
      else
      {
        uint64_t v227 = v623;
        if (v231 != *MEMORY[0x263F63340]) {
          goto LABEL_236;
        }
        (*((void (**)(uint64_t *, uint64_t))v205 + 12))(v230, v206);
        uint64_t v239 = v230[1];
        uint64_t v240 = v558;
        uint64_t *v558 = *v230;
        v240[1] = v239;
        (*(void (**)(void))(v229 + 104))();
        unint64_t v234 = v630;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v234 = sub_25AF76F18(0, *(void *)(v234 + 16) + 1, 1, v234);
        }
        uint64_t v74 = v622;
        unint64_t v242 = *(void *)(v234 + 16);
        unint64_t v241 = *(void *)(v234 + 24);
        if (v242 >= v241 >> 1) {
          unint64_t v234 = sub_25AF76F18(v241 > 1, v242 + 1, 1, v234);
        }
        *(void *)(v234 + 16) = v242 + 1;
        uint64_t v237 = *(unsigned __int8 *)(v229 + 80);
        uint64_t v238 = *(void *)(v229 + 72);
        (*(void (**)(unint64_t, uint64_t *, uint64_t))(v229 + 32))(v234 + ((v237 + 32) & ~v237) + v238 * v242, v558, v227);
      }
      unint64_t v630 = v234;
      v243 = sub_25AF795A0();
      os_log_type_t v244 = sub_25AF797D0();
      if (os_log_type_enabled(v243, v244))
      {
        uint64_t v245 = (uint8_t *)swift_slowAlloc();
        uint64_t v246 = swift_slowAlloc();
        v628 = v246;
        *(_DWORD *)uint64_t v245 = 136446210;
        swift_beginAccess();
        uint64_t v247 = *(void *)(v630 + 16);
        if (v247)
        {
          unint64_t v248 = v630 + ((v237 + 32) & ~(unint64_t)v237) + v238 * (v247 - 1);
          uint64_t v249 = v620;
          unint64_t v250 = v552;
          (*(void (**)(char *, unint64_t, uint64_t))(v620 + 16))(v552, v248, v227);
          uint64_t v251 = 0;
        }
        else
        {
          uint64_t v251 = 1;
          uint64_t v249 = v620;
          unint64_t v250 = v552;
        }
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v249 + 56))(v250, v251, 1, v227);
        uint64_t v252 = sub_25AF79650();
        uint64_t v627 = sub_25AF772F0(v252, v253, (uint64_t *)&v628);
        uint64_t v228 = v620;
        sub_25AF799C0();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25AF45000, v243, v244, "[Announce Reminders] Added %{public}s to search criteria", v245, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x26115ACE0](v246, -1, -1);
        MEMORY[0x26115ACE0](v245, -1, -1);

        v225(v596, v616);
      }
      else
      {

        v225(v596, v616);
        uint64_t v228 = v620;
      }
      uint64_t v143 = v618;
    }
  }
  else
  {
    uint64_t v211 = v143;
    uint64_t v212 = sub_25AF795A0();
    os_log_type_t v213 = sub_25AF797B0();
    if (os_log_type_enabled(v212, v213))
    {
      v214 = (uint8_t *)swift_slowAlloc();
      uint64_t v215 = (void *)swift_slowAlloc();
      *(_DWORD *)v214 = 138412290;
      v628 = v211;
      v216 = v211;
      uint64_t v143 = v618;
      sub_25AF799C0();
      *uint64_t v215 = v211;

      _os_log_impl(&dword_25AF45000, v212, v213, "[Announce Reminders] notebookIdentifier not found in intent: %@", v214, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5D80);
      swift_arrayDestroy();
      MEMORY[0x26115ACE0](v215, -1, -1);
      MEMORY[0x26115ACE0](v214, -1, -1);
    }
    else
    {
    }
    uint64_t v227 = v623;
    uint64_t v228 = v620;
  }
  BOOL v254 = [v143 status] == (id)2;
  BOOL *v619 = v254;
  v255 = *(void (**)(void))(v228 + 104);
  uint64_t v616 = v228 + 104;
  v255();
  swift_beginAccess();
  unint64_t v256 = v630;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v256 = sub_25AF76F18(0, *(void *)(v256 + 16) + 1, 1, v256);
  }
  unint64_t v258 = *(void *)(v256 + 16);
  unint64_t v257 = *(void *)(v256 + 24);
  if (v258 >= v257 >> 1) {
    unint64_t v256 = sub_25AF76F18(v257 > 1, v258 + 1, 1, v256);
  }
  *(void *)(v256 + 16) = v258 + 1;
  v260 = (char *)(v228 + 32);
  v259 = *(BOOL **)(v228 + 32);
  v613 = ((*(unsigned __int8 *)(v228 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v228 + 80));
  v612 = *(char **)(v228 + 72);
  id v261 = v619;
  v619 = v259;
  ((void (*)(char *, BOOL *, uint64_t))v259)((char *)v613 + v256 + (void)v612 * v258, v261, v227);
  unint64_t v630 = v256;
  swift_endAccess();
  id v262 = [v143 location];
  if (v262)
  {
    v263 = v262;
    id v264 = objc_msgSend(v262, sel_name);

    if (v264)
    {
      uint64_t v265 = sub_25AF79640();
      uint64_t v267 = v266;

      if ([v143 locationSearchType] == (id)1)
      {
        v268 = v74;
        uint64_t v269 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D6020);
        id v270 = v576;
        id v271 = (char *)v576 + *(int *)(v269 + 48);
        uint64_t *v576 = v265;
        v270[1] = v267;
        uint64_t v272 = *MEMORY[0x263F63280];
        uint64_t v273 = sub_25AF793C0();
        (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v273 - 8) + 104))(v271, v272, v273);
        ((void (*)(uint64_t *, void, uint64_t))v255)(v270, *MEMORY[0x263F63138], v227);
        swift_beginAccess();
        unint64_t v274 = v630;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v274 = sub_25AF76F18(0, *(void *)(v274 + 16) + 1, 1, v274);
        }
        unint64_t v276 = *(void *)(v274 + 16);
        unint64_t v275 = *(void *)(v274 + 24);
        uint64_t v74 = v268;
        if (v276 >= v275 >> 1) {
          unint64_t v274 = sub_25AF76F18(v275 > 1, v276 + 1, 1, v274);
        }
        *(void *)(v274 + 16) = v276 + 1;
        ((void (*)(char *, uint64_t *, uint64_t))v619)((char *)v613 + v274 + v276 * (void)v612, v576, v227);
        unint64_t v630 = v274;
        swift_endAccess();
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
  }
  v611 = v255;
  v583 = *(void (**)(BOOL *, uint64_t, uint64_t, uint64_t))(v228 + 56);
  v583(v74, 1, 1, v227);
  unsigned __int8 v277 = [v143 temporalEventTriggerTypes];
  unsigned __int8 v278 = [v143 temporalEventTriggerTypes];
  BOOL v279 = (v278 & 2) == 0;
  unsigned __int8 v280 = [v143 temporalEventTriggerTypes];
  if (v277)
  {
    uint64_t v281 = v609;
    if ((v278 & 2) != 0)
    {
      if ((v280 & 4) != 0) {
        goto LABEL_103;
      }
      BOOL v279 = 0;
      id v282 = v611;
      goto LABEL_97;
    }
    if ((v280 & 4) != 0) {
      goto LABEL_103;
    }
    goto LABEL_102;
  }
  uint64_t v281 = v609;
  if ((v278 & 2) == 0)
  {
    if ((v280 & 4) == 0) {
      goto LABEL_103;
    }
    goto LABEL_94;
  }
  if ((v280 & 4) != 0)
  {
LABEL_102:
    sub_25AF54EBC((uint64_t)v74, &qword_26A4D5FF8);
    *uint64_t v74 = (v277 & 1) == 0;
    ((void (*)(BOOL *, void, uint64_t))v611)(v74, *MEMORY[0x263F630E8], v227);
    v583(v74, 0, 1, v227);
    goto LABEL_103;
  }
LABEL_94:
  sub_25AF54EBC((uint64_t)v74, &qword_26A4D5FF8);
  *uint64_t v74 = 1;
  id v282 = v611;
  ((void (*)(BOOL *, void, uint64_t))v611)(v74, *MEMORY[0x263F630E8], v227);
  v583(v74, 0, 1, v227);
LABEL_97:
  BOOL *v594 = v279;
  v282();
  swift_beginAccess();
  unint64_t v283 = v630;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v283 = sub_25AF76F18(0, *(void *)(v283 + 16) + 1, 1, v283);
  }
  unint64_t v285 = *(void *)(v283 + 16);
  unint64_t v284 = *(void *)(v283 + 24);
  if (v285 >= v284 >> 1) {
    unint64_t v283 = sub_25AF76F18(v284 > 1, v285 + 1, 1, v283);
  }
  *(void *)(v283 + 16) = v285 + 1;
  ((void (*)(char *, BOOL *, uint64_t))v619)((char *)v613 + v283 + v285 * (void)v612, v594, v227);
  unint64_t v630 = v283;
  swift_endAccess();
LABEL_103:
  v560 = (char *)(v228 + 56);
  id v286 = [v143 dateTime];
  if (!v286) {
    goto LABEL_196;
  }
  v287 = v286;
  id v288 = objc_msgSend(v286, sel_allDay);
  if (v288)
  {
    v289 = v288;
    LODWORD(v576) = objc_msgSend(v288, sel_BOOLValue);
  }
  else
  {
    LODWORD(v576) = 0;
  }
  uint64_t v290 = v617;
  unint64_t v291 = v584;
  id v292 = objc_msgSend(v287, sel_startDateComponents);
  if (v292)
  {
    uint64_t v293 = v292;
    sub_25AF78DE0();

    uint64_t v294 = *(void (**)(char *, uint64_t, uint64_t, void *))(v290 + 56);
    id v295 = v291;
    uint64_t v296 = 0;
  }
  else
  {
    uint64_t v294 = *(void (**)(char *, uint64_t, uint64_t, void *))(v290 + 56);
    id v295 = v291;
    uint64_t v296 = 1;
  }
  id v297 = v603;
  v294(v295, v296, 1, v603);
  uint64_t v298 = (uint64_t)v291;
  uint64_t v299 = v585;
  sub_25AF67010(v298, v585);
  v300 = *(unsigned int (**)(uint64_t, uint64_t, void *))(v290 + 48);
  if (v300(v299, 1, v297) == 1)
  {
    sub_25AF54EBC(v299, &qword_26A4D5B30);
    uint64_t v301 = 1;
  }
  else
  {
    sub_25AF78DC0();
    (*(void (**)(uint64_t, void *))(v290 + 8))(v299, v297);
    uint64_t v301 = 0;
  }
  v302 = v297;
  uint64_t v303 = 1;
  v294((char *)v281, v301, 1, v302);
  v594 = (BOOL *)v287;
  id v304 = objc_msgSend(v287, sel_endDateComponents);
  if (v304)
  {
    uint64_t v305 = v304;
    v306 = v586;
    sub_25AF78DE0();

    uint64_t v303 = 0;
    uint64_t v307 = v621;
  }
  else
  {
    uint64_t v307 = v621;
    v306 = v586;
  }
  uint64_t v308 = v303;
  v309 = v603;
  v294(v306, v308, 1, v603);
  uint64_t v310 = (uint64_t)v306;
  uint64_t v311 = v309;
  uint64_t v312 = v587;
  sub_25AF67010(v310, v587);
  if (v300(v312, 1, v311) == 1)
  {
    sub_25AF54EBC(v312, &qword_26A4D5B30);
    uint64_t v313 = 1;
  }
  else
  {
    sub_25AF78DC0();
    uint64_t v307 = v621;
    (*(void (**)(uint64_t, void *))(v617 + 8))(v312, v311);
    uint64_t v313 = 0;
  }
  uint64_t v314 = v601;
  v596 = v260;
  v294((char *)v307, v313, 1, v311);
  uint64_t v315 = v588;
  sub_25AF54E58(v281, v588, &qword_26A4D5B30);
  if (v300(v315, 1, v311) == 1)
  {
    sub_25AF54EBC(v315, &qword_26A4D5B30);
    v316 = v598;
    uint64_t v317 = v604;
    (*(void (**)(void (*)(void, void), uint64_t, uint64_t, uint64_t))(v314 + 56))(v598, 1, 1, v604);
  }
  else
  {
    v316 = v598;
    sub_25AF78E30();
    uint64_t v307 = v621;
    (*(void (**)(uint64_t, void *))(v617 + 8))(v315, v311);
    uint64_t v317 = v604;
  }
  uint64_t v318 = (uint64_t)v595;
  v319 = v597;
  sub_25AF54E58(v307, (uint64_t)v597, &qword_26A4D5B30);
  uint64_t v320 = *(unsigned int (**)(void (*)(void, void), uint64_t, uint64_t))(v314 + 48);
  if (v320(v316, 1, v317) != 1)
  {
    sub_25AF54EBC((uint64_t)v319, &qword_26A4D5B30);
    (*(void (**)(char *, void (*)(void, void), uint64_t))(v314 + 32))(v608, v316, v317);
    v323 = v606;
    uint64_t v324 = v621;
    uint64_t v325 = v617;
    uint64_t v74 = v622;
    goto LABEL_130;
  }
  uint64_t v321 = v561;
  sub_25AF54E58((uint64_t)v319, v561, &qword_26A4D5B30);
  if (v300(v321, 1, v311) == 1)
  {
    sub_25AF54EBC(v321, &qword_26A4D5B30);
    uint64_t v322 = (uint64_t)v562;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v601 + 56))(v562, 1, 1, v604);
    v323 = v606;
    uint64_t v74 = v622;
  }
  else
  {
    uint64_t v326 = v562;
    sub_25AF78E30();
    (*(void (**)(uint64_t, void *))(v617 + 8))(v321, v311);
    unsigned int v327 = v320((void (*)(void, void))v326, 1, v604);
    uint64_t v322 = (uint64_t)v326;
    v323 = v606;
    uint64_t v74 = v622;
    if (v327 != 1)
    {
      sub_25AF54EBC((uint64_t)v597, &qword_26A4D5B30);
      (*(void (**)(char *, uint64_t, uint64_t))(v601 + 32))(v608, v322, v604);
      goto LABEL_129;
    }
  }
  uint64_t v328 = *(void *)&v607[OBJC_IVAR____TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler_timeProvider
                        + 24];
  uint64_t v329 = *(void *)&v607[OBJC_IVAR____TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler_timeProvider
                        + 32];
  __swift_project_boxed_opaque_existential_1(&v607[OBJC_IVAR____TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler_timeProvider], v328);
  v330 = *(void (**)(uint64_t, uint64_t))(v329 + 16);
  uint64_t v331 = v329;
  uint64_t v318 = (uint64_t)v595;
  v330(v328, v331);
  sub_25AF54EBC((uint64_t)v597, &qword_26A4D5B30);
  sub_25AF54EBC(v322, (uint64_t *)&unk_26A4D5FE8);
LABEL_129:
  uint64_t v324 = v621;
  sub_25AF54EBC((uint64_t)v598, (uint64_t *)&unk_26A4D5FE8);
  uint64_t v325 = v617;
LABEL_130:
  sub_25AF78EA0();
  sub_25AF78EB0();
  sub_25AF54E58(v609, v318, &qword_26A4D5B30);
  if (v300(v318, 1, v311) == 1)
  {
    sub_25AF54EBC(v318, &qword_26A4D5B30);
    v332 = v590;
  }
  else
  {
    v598 = (void (*)(void, void))v300;
    v333 = *(void (**)(char *, uint64_t, void *))(v325 + 32);
    uint64_t v334 = v564;
    v333(v564, v318, v311);
    if (v576)
    {
      uint64_t v335 = v566;
      sub_25AF78DB0();
      (*(void (**)(char *, void *))(v617 + 8))(v334, v311);
      v333(v334, (uint64_t)v335, v311);
    }
    uint64_t v336 = *(void *)&v607[OBJC_IVAR____TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler_timeProvider
                          + 24];
    uint64_t v337 = *(void *)&v607[OBJC_IVAR____TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler_timeProvider
                          + 32];
    __swift_project_boxed_opaque_existential_1(&v607[OBJC_IVAR____TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler_timeProvider], v336);
    v338 = v599;
    (*(void (**)(uint64_t, uint64_t))(v337 + 8))(v336, v337);
    uint64_t v339 = (uint64_t)v565;
    sub_25AF78F90();
    uint64_t v340 = v605;
    v341 = *(void (**)(char *, uint64_t))(v605 + 8);
    v342 = v334;
    uint64_t v343 = v602;
    v341(v338, v602);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v340 + 48))(v339, 1, v343) == 1)
    {
      v344 = v563;
      sub_25AF78EA0();
      uint64_t v325 = v617;
      v345 = v342;
      uint64_t v311 = v603;
      (*(void (**)(char *, void *))(v617 + 8))(v345, v603);
      v341(v323, v343);
      sub_25AF54EBC(v339, &qword_26A4D5FE0);
      (*(void (**)(char *, char *, uint64_t))(v340 + 32))(v323, v344, v343);
    }
    else
    {
      uint64_t v325 = v617;
      v346 = v342;
      uint64_t v311 = v603;
      (*(void (**)(char *, void *))(v617 + 8))(v346, v603);
      v341(v323, v343);
      v347 = *(void (**)(char *, uint64_t, uint64_t))(v340 + 32);
      v348 = v563;
      v347(v563, v339, v343);
      v347(v323, (uint64_t)v348, v343);
    }
    uint64_t v324 = v621;
    v332 = v590;
    uint64_t v74 = v622;
    v300 = (unsigned int (*)(uint64_t, uint64_t, void *))v598;
  }
  uint64_t v349 = v324;
  uint64_t v350 = v589;
  sub_25AF54E58(v349, v589, &qword_26A4D5B30);
  if (v300(v350, 1, v311) == 1)
  {
    sub_25AF54EBC(v350, &qword_26A4D5B30);
    uint64_t v143 = v618;
    uint64_t v351 = v602;
LABEL_149:
    v370 = (void *)v605;
    goto LABEL_150;
  }
  v352 = v74;
  uint64_t v353 = v325;
  v354 = *(void (**)(char *, uint64_t, void *))(v325 + 32);
  v355 = v577;
  v354(v577, v350, v311);
  if ((v576 & 1) == 0)
  {
    uint64_t v371 = *(void *)&v607[OBJC_IVAR____TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler_timeProvider
                          + 24];
    uint64_t v372 = *(void *)&v607[OBJC_IVAR____TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler_timeProvider
                          + 32];
    __swift_project_boxed_opaque_existential_1(&v607[OBJC_IVAR____TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler_timeProvider], v371);
    v373 = v599;
    (*(void (**)(uint64_t, uint64_t))(v372 + 8))(v371, v372);
    uint64_t v374 = (uint64_t)v555;
    sub_25AF78F90();
    uint64_t v375 = v605;
    v376 = *(void (**)(char *, uint64_t))(v605 + 8);
    v377 = v373;
    uint64_t v378 = v602;
    v376(v377, v602);
    v379 = v311;
    uint64_t v351 = v378;
    (*(void (**)(char *, void *))(v353 + 8))(v355, v379);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v375 + 48))(v374, 1, v378) == 1)
    {
      v380 = *(void (**)(char *, char *, uint64_t))(v375 + 32);
      v381 = v615;
      v380(v332, v615, v351);
      sub_25AF54EBC(v374, &qword_26A4D5FE0);
    }
    else
    {
      v381 = v615;
      v376(v615, v351);
      v380 = *(void (**)(char *, char *, uint64_t))(v375 + 32);
      v380(v332, (char *)v374, v351);
    }
    v323 = v606;
    uint64_t v143 = v618;
    uint64_t v74 = v352;
    v380(v381, v332, v351);
    goto LABEL_149;
  }
  v356 = v566;
  sub_25AF78DB0();
  uint64_t v357 = v605;
  v358 = v311;
  uint64_t v359 = v602;
  v361 = *(void (**)(void, void))(v353 + 8);
  uint64_t v360 = v353 + 8;
  v598 = v361;
  v361(v355, v311);
  v354(v355, (uint64_t)v356, v311);
  uint64_t v362 = *(void *)&v607[OBJC_IVAR____TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler_timeProvider
                        + 24];
  uint64_t v363 = *(void *)&v607[OBJC_IVAR____TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler_timeProvider
                        + 32];
  __swift_project_boxed_opaque_existential_1(&v607[OBJC_IVAR____TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler_timeProvider], v362);
  v364 = v355;
  v365 = v599;
  (*(void (**)(uint64_t, uint64_t))(v363 + 8))(v362, v363);
  uint64_t v366 = (uint64_t)v554;
  sub_25AF78F90();
  v367 = v365;
  uint64_t v368 = v357;
  v597 = *(void (**)(void, void))(v357 + 8);
  v597(v367, v359);
  v369 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v357 + 48);
  if (v369(v366, 1, v359) == 1)
  {
    v598(v364, v358);
    sub_25AF54EBC(v366, &qword_26A4D5FE0);
    uint64_t v74 = v622;
    v370 = (void *)v368;
    uint64_t v351 = v359;
    v323 = v606;
    uint64_t v143 = v618;
    goto LABEL_150;
  }
  uint64_t v617 = v360;
  v382 = *(char **)(v368 + 32);
  v383 = v543;
  v595 = (char *)(v368 + 32);
  v590 = v382;
  ((void (*)(char *, uint64_t, uint64_t))v382)(v543, v366, v359);
  uint64_t v384 = v579;
  v385 = v578;
  uint64_t v386 = v580;
  (*(void (**)(char *, void, uint64_t))(v579 + 104))(v578, *MEMORY[0x263F07870], v580);
  uint64_t v387 = (uint64_t)v545;
  sub_25AF78FB0();
  uint64_t v388 = v387;
  (*(void (**)(char *, uint64_t))(v384 + 8))(v385, v386);
  v389 = v369;
  if (v369(v387, 1, v359) == 1)
  {
    v597(v383, v359);
    v598(v577, v603);
    sub_25AF54EBC(v387, &qword_26A4D5FE0);
    v370 = (void *)v605;
    uint64_t v390 = (uint64_t)v546;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v605 + 56))(v546, 1, 1, v359);
    uint64_t v351 = v359;
  }
  else
  {
    uint64_t v390 = (uint64_t)v546;
    sub_25AF78EC0();
    v466 = v597;
    v597(v383, v359);
    v598(v577, v603);
    v466(v388, v359);
    v370 = (void *)v605;
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v605 + 56))(v390, 0, 1, v359);
    uint64_t v351 = v359;
    if (v389(v390, 1, v359) != 1)
    {
      v468 = v615;
      v466((uint64_t)v615, v359);
      v467 = v544;
      v469 = (void (*)(char *, char *, uint64_t))v590;
      ((void (*)(char *, uint64_t, uint64_t))v590)(v544, v390, v359);
      goto LABEL_231;
    }
  }
  v467 = v544;
  v468 = v615;
  v469 = (void (*)(char *, char *, uint64_t))v590;
  ((void (*)(char *, char *, uint64_t))v590)(v544, v615, v351);
  sub_25AF54EBC(v390, &qword_26A4D5FE0);
LABEL_231:
  uint64_t v74 = v622;
  uint64_t v143 = v618;
  v469(v468, v467, v351);
  v323 = v606;
LABEL_150:
  v391 = &v607[OBJC_IVAR____TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler_timeProvider];
  if ((sub_25AF798A0() & 1) == 0) {
    goto LABEL_157;
  }
  v392 = v599;
  sub_25AF78EA0();
  v393 = (void (*)(char *, uint64_t))v370[1];
  v393(v323, v351);
  uint64_t v617 = v370[4];
  ((void (*)(char *, char *, uint64_t))v617)(v323, v392, v351);
  uint64_t v394 = *((void *)v391 + 3);
  uint64_t v395 = *((void *)v391 + 4);
  __swift_project_boxed_opaque_existential_1(v391, v394);
  uint64_t v396 = v605;
  (*(void (**)(uint64_t, uint64_t))(v395 + 8))(v394, v395);
  v397 = v569;
  sub_25AF78F80();
  v603 = v393;
  v393(v392, v351);
  uint64_t v398 = v351;
  uint64_t v399 = v579;
  v400 = v397;
  v401 = v578;
  uint64_t v402 = v580;
  (*(void (**)(char *, void, uint64_t))(v579 + 104))(v578, *MEMORY[0x263F07870], v580);
  uint64_t v403 = (uint64_t)v573;
  sub_25AF78FB0();
  (*(void (**)(char *, uint64_t))(v399 + 8))(v401, v402);
  uint64_t v404 = v398;
  v370 = (void *)v396;
  v405 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v396 + 48);
  if (v405(v403, 1, v404) == 1)
  {
    ((void (*)(char *, uint64_t))v603)(v400, v404);
    sub_25AF54EBC(v403, &qword_26A4D5FE0);
    uint64_t v406 = (uint64_t)v574;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v396 + 56))(v574, 1, 1, v404);
    v407 = v572;
  }
  else
  {
    uint64_t v406 = (uint64_t)v574;
    sub_25AF78EC0();
    v408 = v400;
    v409 = (void (*)(uint64_t, uint64_t))v603;
    ((void (*)(char *, uint64_t))v603)(v408, v404);
    v409(v403, v404);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v396 + 56))(v406, 0, 1, v404);
    int v410 = v405(v406, 1, v404);
    v407 = v572;
    if (v410 != 1)
    {
      v411 = v615;
      v409((uint64_t)v615, v404);
      v412 = (void (*)(char *, char *, uint64_t))v617;
      ((void (*)(char *, uint64_t, uint64_t))v617)(v407, v406, v404);
      goto LABEL_156;
    }
  }
  v411 = v615;
  v412 = (void (*)(char *, char *, uint64_t))v617;
  ((void (*)(char *, char *, uint64_t))v617)(v407, v615, v404);
  sub_25AF54EBC(v406, &qword_26A4D5FE0);
LABEL_156:
  uint64_t v74 = v622;
  v323 = v606;
  uint64_t v351 = v404;
  v412(v411, v407, v404);
  uint64_t v143 = v618;
LABEL_157:
  id v413 = [v143 dateSearchType];
  uint64_t v414 = v621;
  v415 = v591;
  switch((unint64_t)v413)
  {
    case 0uLL:

      v416 = (void (*)(char *, uint64_t))v370[1];
      v416(v615, v351);
      v416(v323, v351);
      (*(void (**)(char *, uint64_t))(v601 + 8))(v608, v604);
      sub_25AF54EBC(v414, &qword_26A4D5B30);
      sub_25AF54EBC(v609, &qword_26A4D5B30);
      uint64_t v227 = v623;
      goto LABEL_159;
    case 1uLL:
      sub_25AF54E58((uint64_t)v74, (uint64_t)v591, &qword_26A4D5FF8);
      uint64_t v455 = v620;
      uint64_t v227 = v623;
      if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v620 + 48))(v415, 1, v623) == 1)
      {
        sub_25AF54EBC((uint64_t)v415, &qword_26A4D5FF8);
LABEL_191:
        uint64_t v470 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D6018);
        v471 = v556;
        v472 = &v556[*(int *)(v470 + 48)];
        v473 = (void (*)(char *, char *, uint64_t))v370[2];
        v473(v556, v323, v351);
        v474 = (void (*)(char *, void, uint64_t, uint64_t))v370[7];
        v474(v471, 0, 1, v351);
        v473(v472, v615, v351);
        v474(v472, 0, 1, v351);
        ((void (*)(char *, void, uint64_t))v611)(v471, *MEMORY[0x263F63128], v227);
        swift_beginAccess();
        unint64_t v475 = v630;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v475 = sub_25AF76F18(0, *(void *)(v475 + 16) + 1, 1, v475);
        }
        uint64_t v228 = v620;
        unint64_t v477 = *(void *)(v475 + 16);
        unint64_t v476 = *(void *)(v475 + 24);
        uint64_t v478 = v605;
        if (v477 >= v476 >> 1) {
          unint64_t v475 = sub_25AF76F18(v476 > 1, v477 + 1, 1, v475);
        }
        *(void *)(v475 + 16) = v477 + 1;
        ((void (*)(char *, char *, uint64_t))v619)((char *)v613 + v475 + v477 * (void)v612, v556, v227);
        unint64_t v630 = v475;
        swift_endAccess();

        v479 = *(void (**)(char *, uint64_t))(v478 + 8);
        v479(v615, v351);
        v479(v606, v351);
        (*(void (**)(char *, uint64_t))(v601 + 8))(v608, v604);
        sub_25AF54EBC(v621, &qword_26A4D5B30);
        sub_25AF54EBC(v609, &qword_26A4D5B30);
        break;
      }
      if ((*(unsigned int (**)(unsigned char *, uint64_t))(v455 + 88))(v415, v227) != *MEMORY[0x263F630E8])
      {
        (*(void (**)(unsigned char *, uint64_t))(v455 + 8))(v415, v227);
        goto LABEL_191;
      }
      (*(void (**)(unsigned char *, uint64_t))(v455 + 96))(v415, v227);
      if (*v415)
      {
        uint64_t v456 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D6018);
        v457 = v542;
        v458 = &v542[*(int *)(v456 + 48)];
        v459 = (void (*)(char *, char *, uint64_t))v370[2];
        v459(v542, v323, v351);
        v460 = (void (*)(char *, void, uint64_t, uint64_t))v370[7];
        v460(v457, 0, 1, v351);
        v459(v458, v615, v351);
        v460(v458, 0, 1, v351);
        ((void (*)(char *, void, uint64_t))v611)(v457, *MEMORY[0x263F63128], v227);
        swift_beginAccess();
        unint64_t v461 = v630;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v461 = sub_25AF76F18(0, *(void *)(v461 + 16) + 1, 1, v461);
        }
        uint64_t v228 = v620;
        unint64_t v463 = *(void *)(v461 + 16);
        unint64_t v462 = *(void *)(v461 + 24);
        uint64_t v464 = v605;
        if (v463 >= v462 >> 1) {
          unint64_t v461 = sub_25AF76F18(v462 > 1, v463 + 1, 1, v461);
        }
        *(void *)(v461 + 16) = v463 + 1;
        ((void (*)(char *, char *, uint64_t))v619)((char *)v613 + v461 + v463 * (void)v612, v542, v227);
        unint64_t v630 = v461;
        swift_endAccess();

        v465 = *(void (**)(char *, uint64_t))(v464 + 8);
        v465(v615, v351);
        v465(v606, v351);
        (*(void (**)(char *, uint64_t))(v601 + 8))(v608, v604);
        sub_25AF54EBC(v621, &qword_26A4D5B30);
        sub_25AF54EBC(v609, &qword_26A4D5B30);
        sub_25AF54EBC((uint64_t)v74, &qword_26A4D5FF8);
        v583(v74, 1, 1, v227);
      }
      else
      {

        v531 = (void (*)(char *, uint64_t))v370[1];
        v531(v615, v351);
        v531(v323, v351);
        (*(void (**)(char *, uint64_t))(v601 + 8))(v608, v604);
        sub_25AF54EBC(v414, &qword_26A4D5B30);
        sub_25AF54EBC(v609, &qword_26A4D5B30);
LABEL_159:
        uint64_t v228 = v620;
      }
      break;
    case 2uLL:
      uint64_t v417 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D6018);
      v418 = v567;
      v419 = &v567[*(int *)(v417 + 48)];
      v420 = (void (*)(char *, char *, uint64_t))v370[2];
      v420(v567, v323, v351);
      v421 = (void (*)(char *, void, uint64_t, uint64_t))v370[7];
      v421(v418, 0, 1, v351);
      v420(v419, v615, v351);
      v421(v419, 0, 1, v351);
      uint64_t v422 = *MEMORY[0x263F63108];
      ((void (*)(char *, uint64_t, uint64_t))v611)(v418, v422, v623);
      swift_beginAccess();
      unint64_t v423 = v630;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v423 = sub_25AF76F18(0, *(void *)(v423 + 16) + 1, 1, v423);
      }
      unint64_t v425 = *(void *)(v423 + 16);
      unint64_t v424 = *(void *)(v423 + 24);
      if (v425 >= v424 >> 1) {
        unint64_t v423 = sub_25AF76F18(v424 > 1, v425 + 1, 1, v423);
      }
      *(void *)(v423 + 16) = v425 + 1;
      uint64_t v426 = v623;
      ((void (*)(char *, char *, uint64_t))v619)((char *)v613 + v423 + v425 * (void)v612, v567, v623);
      unint64_t v630 = v423;
      swift_endAccess();
      v427 = v570;
      v428 = &v570[*(int *)(v417 + 48)];
      uint64_t v429 = v602;
      v420(v570, v606, v602);
      v421(v427, 0, 1, v429);
      v420(v428, v615, v429);
      uint64_t v227 = v426;
      v421(v428, 0, 1, v429);
      ((void (*)(char *, uint64_t, uint64_t))v611)(v427, v422, v426);
      unint64_t v430 = v629;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v430 = sub_25AF76F18(0, *(void *)(v430 + 16) + 1, 1, v430);
      }
      uint64_t v74 = v622;
      uint64_t v431 = v605;
      uint64_t v432 = v604;
      v433 = v608;
      unint64_t v435 = *(void *)(v430 + 16);
      unint64_t v434 = *(void *)(v430 + 24);
      uint64_t v436 = v602;
      if (v435 >= v434 >> 1) {
        unint64_t v430 = sub_25AF76F18(v434 > 1, v435 + 1, 1, v430);
      }
      *(void *)(v430 + 16) = v435 + 1;
      v437 = (char *)v613 + v430 + v435 * (void)v612;
      v438 = &v602;
      goto LABEL_178;
    case 3uLL:
      uint64_t v439 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D6018);
      v440 = v568;
      v441 = &v568[*(int *)(v439 + 48)];
      v442 = (void (*)(char *, char *, uint64_t))v370[2];
      v442(v568, v323, v351);
      v443 = (void (*)(char *, void, uint64_t, uint64_t))v370[7];
      v443(v440, 0, 1, v351);
      v442(v441, v615, v351);
      v443(v441, 0, 1, v351);
      uint64_t v444 = *MEMORY[0x263F63100];
      ((void (*)(char *, uint64_t, uint64_t))v611)(v440, v444, v623);
      swift_beginAccess();
      unint64_t v445 = v630;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v445 = sub_25AF76F18(0, *(void *)(v445 + 16) + 1, 1, v445);
      }
      unint64_t v447 = *(void *)(v445 + 16);
      unint64_t v446 = *(void *)(v445 + 24);
      if (v447 >= v446 >> 1) {
        unint64_t v445 = sub_25AF76F18(v446 > 1, v447 + 1, 1, v445);
      }
      *(void *)(v445 + 16) = v447 + 1;
      uint64_t v448 = v623;
      ((void (*)(char *, char *, uint64_t))v619)((char *)v613 + v445 + v447 * (void)v612, v568, v623);
      unint64_t v630 = v445;
      swift_endAccess();
      v449 = v571;
      v450 = &v571[*(int *)(v439 + 48)];
      uint64_t v451 = v602;
      v442(v571, v606, v602);
      v443(v449, 0, 1, v451);
      v442(v450, v615, v451);
      uint64_t v227 = v448;
      v443(v450, 0, 1, v451);
      ((void (*)(char *, uint64_t, uint64_t))v611)(v449, v444, v448);
      unint64_t v430 = v629;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v430 = sub_25AF76F18(0, *(void *)(v430 + 16) + 1, 1, v430);
      }
      uint64_t v74 = v622;
      uint64_t v431 = v605;
      uint64_t v432 = v604;
      v433 = v608;
      unint64_t v453 = *(void *)(v430 + 16);
      unint64_t v452 = *(void *)(v430 + 24);
      uint64_t v436 = v602;
      if (v453 >= v452 >> 1) {
        unint64_t v430 = sub_25AF76F18(v452 > 1, v453 + 1, 1, v430);
      }
      *(void *)(v430 + 16) = v453 + 1;
      v437 = (char *)v613 + v430 + v453 * (void)v612;
      v438 = (uint64_t *)&v603;
LABEL_178:
      ((void (*)(char *, void, uint64_t))v619)(v437, *(v438 - 32), v227);

      unint64_t v629 = v430;
      v454 = *(void (**)(char *, uint64_t))(v431 + 8);
      v454(v615, v436);
      v454(v606, v436);
      (*(void (**)(char *, uint64_t))(v601 + 8))(v433, v432);
      sub_25AF54EBC(v621, &qword_26A4D5B30);
      sub_25AF54EBC(v609, &qword_26A4D5B30);
      uint64_t v228 = v620;
      uint64_t v143 = v618;
      break;
    default:
      v538(v537, v610, v540);
      uint64_t v532 = MEMORY[0x263F8EE78];
      sub_25AF6026C(MEMORY[0x263F8EE78]);
      sub_25AF6026C(v532);
      swift_release();
      _Block_release(v575);
      v533 = "unknown date search type";
      uint64_t v534 = 24;
      goto LABEL_235;
  }
LABEL_196:
  uint64_t v480 = v600;
  sub_25AF54E58((uint64_t)v74, v600, &qword_26A4D5FF8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v228 + 48))(v480, 1, v227) == 1)
  {
    sub_25AF54EBC(v480, &qword_26A4D5FF8);
  }
  else
  {
    v481 = v582;
    ((void (*)(char *, uint64_t, uint64_t))v619)(v582, v480, v227);
    v482 = v581;
    (*(void (**)(char *, char *, uint64_t))(v228 + 16))(v581, v481, v227);
    swift_beginAccess();
    unint64_t v483 = v630;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v483 = sub_25AF76F18(0, *(void *)(v483 + 16) + 1, 1, v483);
    }
    unint64_t v485 = *(void *)(v483 + 16);
    unint64_t v484 = *(void *)(v483 + 24);
    if (v485 >= v484 >> 1) {
      unint64_t v483 = sub_25AF76F18(v484 > 1, v485 + 1, 1, v483);
    }
    *(void *)(v483 + 16) = v485 + 1;
    ((void (*)(char *, char *, uint64_t))v619)((char *)v613 + v483 + v485 * (void)v612, v482, v227);
    unint64_t v630 = v483;
    swift_endAccess();
    (*(void (**)(char *, uint64_t))(v228 + 8))(v481, v227);
    uint64_t v143 = v618;
  }
  id v486 = [v143 taskPriority];
  v487 = v611;
  if (v486)
  {
    if (v486 == (id)1)
    {
      unsigned char *v593 = 0;
      v487();
      swift_beginAccess();
      unint64_t v488 = v630;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v488 = sub_25AF76F18(0, *(void *)(v488 + 16) + 1, 1, v488);
      }
      unint64_t v490 = *(void *)(v488 + 16);
      unint64_t v489 = *(void *)(v488 + 24);
      if (v490 >= v489 >> 1) {
        unint64_t v488 = sub_25AF76F18(v489 > 1, v490 + 1, 1, v488);
      }
      *(void *)(v488 + 16) = v490 + 1;
      v491 = (char *)v613 + v488 + v490 * (void)v612;
      v492 = &v625;
LABEL_216:
      ((void (*)(char *, void, uint64_t))v619)(v491, *((void *)v492 - 32), v227);
      unint64_t v630 = v488;
      swift_endAccess();
      goto LABEL_217;
    }
    if (v486 == (id)2)
    {
      unsigned char *v592 = 1;
      v487();
      swift_beginAccess();
      unint64_t v488 = v630;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v488 = sub_25AF76F18(0, *(void *)(v488 + 16) + 1, 1, v488);
      }
      unint64_t v494 = *(void *)(v488 + 16);
      unint64_t v493 = *(void *)(v488 + 24);
      if (v494 >= v493 >> 1) {
        unint64_t v488 = sub_25AF76F18(v493 > 1, v494 + 1, 1, v488);
      }
      *(void *)(v488 + 16) = v494 + 1;
      v491 = (char *)v613 + v488 + v494 * (void)v612;
      v492 = &v624;
      goto LABEL_216;
    }
    v538(v541, v610, v540);
    uint64_t v535 = MEMORY[0x263F8EE78];
    sub_25AF6026C(MEMORY[0x263F8EE78]);
    sub_25AF6026C(v535);
    swift_release();
    _Block_release(v575);
    v533 = "unknown task priority";
    uint64_t v534 = 21;
LABEL_235:
    sub_25AF58288((uint64_t)v533, v534, 2);
    __break(1u);
LABEL_236:
    swift_release();
    _Block_release(v575);
    sub_25AF79C70();
    __break(1u);
    JUMPOUT(0x25AF66F3CLL);
  }
LABEL_217:
  id v495 = [v143 itemType];
  if (v495 == (id)2)
  {
    v510 = sub_25AF795A0();
    os_log_type_t v511 = sub_25AF797D0();
    if (os_log_type_enabled(v510, v511))
    {
      v512 = (uint8_t *)swift_slowAlloc();
      uint64_t v513 = swift_slowAlloc();
      v628 = v513;
      *(_DWORD *)v512 = 136315138;
      swift_beginAccess();
      uint64_t v514 = swift_bridgeObjectRetain();
      uint64_t v515 = MEMORY[0x26115A160](v514, v227);
      unint64_t v517 = v516;
      swift_bridgeObjectRelease();
      uint64_t v626 = sub_25AF772F0(v515, v517, (uint64_t *)&v628);
      sub_25AF799C0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25AF45000, v510, v511, "Consulting Search datasource for lists {itemType: taskList, criteria: %s}", v512, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x26115ACE0](v513, -1, -1);
      MEMORY[0x26115ACE0](v512, -1, -1);
    }

    uint64_t v518 = v614;
    v519 = v607;
    uint64_t v520 = *(void *)&v607[OBJC_IVAR____TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler_dataSource
                          + 24];
    uint64_t v521 = *(void *)&v607[OBJC_IVAR____TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler_dataSource
                          + 32];
    __swift_project_boxed_opaque_existential_1(&v607[OBJC_IVAR____TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler_dataSource], v520);
    swift_beginAccess();
    unint64_t v522 = v629;
    v523 = (void *)swift_allocObject();
    v523[2] = v519;
    v523[3] = sub_25AF54804;
    v523[4] = v518;
    v524 = *(void (**)(unint64_t, void (*)(uint64_t), void *, uint64_t, uint64_t))(v521 + 32);
    swift_retain();
    swift_bridgeObjectRetain();
    id v525 = v519;
    v524(v522, sub_25AF66FC4, v523, v520, v521);
    goto LABEL_225;
  }
  uint64_t v496 = v614;
  if (v495 == (id)3)
  {
    v497 = sub_25AF795A0();
    os_log_type_t v498 = sub_25AF797D0();
    if (os_log_type_enabled(v497, v498))
    {
      v499 = (uint8_t *)swift_slowAlloc();
      uint64_t v500 = swift_slowAlloc();
      v628 = v500;
      *(_DWORD *)v499 = 136315138;
      uint64_t v501 = swift_bridgeObjectRetain();
      uint64_t v502 = MEMORY[0x26115A160](v501, v227);
      unint64_t v504 = v503;
      swift_bridgeObjectRelease();
      uint64_t v627 = sub_25AF772F0(v502, v504, (uint64_t *)&v628);
      uint64_t v496 = v614;
      sub_25AF799C0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25AF45000, v497, v498, "Consulting Search datasource for reminders {itemType: task, criteria: %s}", v499, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x26115ACE0](v500, -1, -1);
      MEMORY[0x26115ACE0](v499, -1, -1);
    }

    uint64_t v505 = *(void *)&v607[OBJC_IVAR____TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler_dataSource
                          + 24];
    uint64_t v506 = *(void *)&v607[OBJC_IVAR____TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler_dataSource
                          + 32];
    __swift_project_boxed_opaque_existential_1(&v607[OBJC_IVAR____TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler_dataSource], v505);
    unint64_t v507 = v630;
    uint64_t v508 = swift_allocObject();
    *(void *)(v508 + 16) = sub_25AF54804;
    *(void *)(v508 + 24) = v496;
    v509 = *(void (**)(unint64_t, void (*)(unint64_t), uint64_t, uint64_t, uint64_t))(v506 + 24);
    swift_bridgeObjectRetain();
    swift_retain();
    v509(v507, sub_25AF67008, v508, v505, v506);
LABEL_225:
    swift_bridgeObjectRelease();
    swift_release();
    goto LABEL_229;
  }
  v526 = sub_25AF795A0();
  os_log_type_t v527 = sub_25AF797C0();
  if (os_log_type_enabled(v526, v527))
  {
    v528 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v528 = 0;
    _os_log_impl(&dword_25AF45000, v526, v527, "Unhandled itemType. Should have been cleaned up in resolve(). Return failure search result.", v528, 2u);
    MEMORY[0x26115ACE0](v528, -1, -1);
  }

  id v529 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FE98]), sel_initWithCode_userActivity_, 4, 0);
  (*((void (**)(const void *, id))v575 + 2))(v575, v529);

LABEL_229:
  sub_25AF54EBC((uint64_t)v74, &qword_26A4D5FF8);
  swift_bridgeObjectRelease();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25AF66F4C()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25AF66F84()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_25AF66FC4(uint64_t a1)
{
  sub_25AF60B8C(a1, *(void **)(v1 + 16), *(void (**))(v1 + 24));
}

uint64_t sub_25AF66FD0()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_25AF67008(unint64_t a1)
{
  sub_25AF60668(a1, *(void (**))(v1 + 16));
}

uint64_t sub_25AF67010(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5B30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_25AF67078()
{
  unint64_t result = qword_26A4D6038;
  if (!qword_26A4D6038)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A4D6030);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4D6038);
  }
  return result;
}

_OWORD *sub_25AF670D4(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_25AF670E4()
{
  uint64_t v0 = sub_25AF795B0();
  __swift_allocate_value_buffer(v0, qword_26A4D6080);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_26A4D6080);
  if (qword_26A4D5900 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_26A4D6660);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

uint64_t sub_25AF671AC(void *a1, uint64_t a2, uint64_t a3)
{
  id v7 = objc_msgSend(a1, sel_tasks);
  if (v7)
  {
    uint64_t v8 = v7;
    sub_25AF48D94(0, &qword_26A4D5B50);
    unint64_t v9 = sub_25AF796D0();

    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = a2;
    *(void *)(v10 + 24) = a3;
    swift_retain();
    sub_25AF59C94(v9, (uint64_t)sub_25AF68694, v10);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v11 = *(void **)(v3 + OBJC_IVAR____TtC25RemindersIntentsFramework27TTRSnoozeTasksIntentHandler_dataSource);
    uint64_t v12 = (void *)swift_allocObject();
    id v12[2] = a2;
    v12[3] = a3;
    v12[4] = a1;
    uint64_t v13 = v11[6];
    uint64_t v14 = v11[7];
    __swift_project_boxed_opaque_existential_1(v11 + 3, v13);
    uint64_t v15 = (void *)swift_allocObject();
    v15[2] = v11;
    v15[3] = sub_25AF68610;
    v15[4] = v12;
    uint64_t v16 = *(void (**)(uint64_t (*)(unint64_t), void *, uint64_t, uint64_t))(v14 + 8);
    swift_retain();
    id v17 = a1;
    swift_retain();
    swift_retain();
    v16(sub_25AF5A3CC, v15, v13, v14);
    swift_release();
  }
  return swift_release();
}

void sub_25AF67378(unint64_t a1, void (*a2)(uint64_t))
{
  if (!(a1 >> 62))
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v4) {
      goto LABEL_3;
    }
LABEL_27:
    if (qword_26A4D5930 != -1) {
      swift_once();
    }
    uint64_t v27 = sub_25AF795B0();
    __swift_project_value_buffer(v27, (uint64_t)qword_26A4D6080);
    uint64_t v28 = sub_25AF795A0();
    os_log_type_t v29 = sub_25AF79790();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v30 = 0;
      _os_log_impl(&dword_25AF45000, v28, v29, "No reminders found for searchTerm {result: .unsupported(.noTasksFound)}", v30, 2u);
      MEMORY[0x26115ACE0](v30, -1, -1);
    }

    id v13 = objc_msgSend(self, sel_unsupportedForReason_, 1);
    goto LABEL_32;
  }
  swift_bridgeObjectRetain();
  uint64_t v26 = sub_25AF79C10();
  swift_bridgeObjectRelease();
  if (!v26) {
    goto LABEL_27;
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_25AF79C10();
  swift_bridgeObjectRelease();
LABEL_3:
  if (v4 == 1)
  {
    if (qword_26A4D5930 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_25AF795B0();
    __swift_project_value_buffer(v5, (uint64_t)qword_26A4D6080);
    uint64_t v6 = sub_25AF795A0();
    os_log_type_t v7 = sub_25AF79790();
    uint64_t v4 = v7;
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_25AF45000, v6, (os_log_type_t)v4, "One reminder found for searchTerm {result: .success}", v8, 2u);
      MEMORY[0x26115ACE0](v8, -1, -1);
    }

    if ((a1 & 0xC000000000000001) != 0)
    {
      MEMORY[0x26115A540](0, a1);
      goto LABEL_11;
    }
    if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      id v9 = *(id *)(a1 + 32);
LABEL_11:
      uint64_t v10 = self;
      sub_25AF48D94(0, &qword_26A4D5B50);
      uint64_t v11 = (void *)sub_25AF79900();
      id v12 = objc_msgSend(v10, sel_successWithResolvedTask_, v11);

      id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FF88]), sel_initWithTaskResolutionResult_, v12);
LABEL_32:
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5980);
      uint64_t v31 = swift_allocObject();
      *(_OWORD *)(v31 + 16) = xmmword_25AF7A510;
      *(void *)(v31 + 32) = v13;
      uint64_t v33 = v31;
      sub_25AF796F0();
      id v32 = v13;
      a2(v33);
      swift_bridgeObjectRelease();

      return;
    }
    __break(1u);
  }
  else if (qword_26A4D5930 == -1)
  {
    goto LABEL_13;
  }
  swift_once();
LABEL_13:
  uint64_t v14 = sub_25AF795B0();
  __swift_project_value_buffer(v14, (uint64_t)qword_26A4D6080);
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_25AF795A0();
  os_log_type_t v16 = sub_25AF79790();
  if (os_log_type_enabled(v15, v16))
  {
    id v17 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)id v17 = 134217984;
    sub_25AF799C0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25AF45000, v15, v16, "Found %ld reminders found for searchTerm {result: .disambiguation}", v17, 0xCu);
    MEMORY[0x26115ACE0](v17, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease();
  }
  if (!v4) {
    goto LABEL_24;
  }
  sub_25AF79B10();
  if ((v4 & 0x8000000000000000) == 0)
  {
    sub_25AF48D94(0, &qword_26A4D5B50);
    if ((a1 & 0xC000000000000001) != 0)
    {
      uint64_t v18 = 0;
      do
      {
        uint64_t v19 = v18 + 1;
        MEMORY[0x26115A540]();
        sub_25AF79900();
        sub_25AF79AF0();
        sub_25AF79B20();
        sub_25AF79B30();
        sub_25AF79B00();
        uint64_t v18 = v19;
      }
      while (v4 != v19);
    }
    else
    {
      uint64_t v20 = (void **)(a1 + 32);
      do
      {
        uint64_t v21 = *v20++;
        id v22 = v21;
        sub_25AF79900();
        sub_25AF79AF0();
        sub_25AF79B20();
        sub_25AF79B30();
        sub_25AF79B00();
        --v4;
      }
      while (v4);
    }
LABEL_24:
    uint64_t v23 = self;
    sub_25AF48D94(0, &qword_26A4D5B50);
    uint64_t v24 = (void *)sub_25AF796C0();
    swift_bridgeObjectRelease();
    id v25 = objc_msgSend(v23, sel_disambiguationWithTasksToDisambiguate_, v24);

    id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FF88]), sel_initWithTaskResolutionResult_, v25);
    goto LABEL_32;
  }
  __break(1u);
}

uint64_t sub_25AF67958(unint64_t a1, void (*a2)(void), int a3, id a4)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v53 = sub_25AF79C10();
    swift_bridgeObjectRelease();
    if (v53)
    {
      swift_bridgeObjectRetain();
      uint64_t v7 = sub_25AF79C10();
      swift_bridgeObjectRelease();
      if (v7 == 1) {
        goto LABEL_6;
      }
LABEL_4:
      id v8 = objc_msgSend(a4, sel_all);
      if (!v8 || (id v9 = v8, v10 = objc_msgSend(v8, sel_BOOLValue), v9, !v10))
      {
        if (qword_26A4D5930 == -1)
        {
LABEL_17:
          uint64_t v21 = sub_25AF795B0();
          __swift_project_value_buffer(v21, (uint64_t)qword_26A4D6080);
          swift_bridgeObjectRetain_n();
          id v22 = sub_25AF795A0();
          os_log_type_t v23 = sub_25AF797B0();
          if (os_log_type_enabled(v22, v23))
          {
            uint64_t v24 = (uint8_t *)swift_slowAlloc();
            uint64_t v25 = swift_slowAlloc();
            uint64_t v62 = v25;
            *(_DWORD *)uint64_t v24 = 136315138;
            uint64_t v26 = a2;
            uint64_t v27 = sub_25AF48D94(0, &qword_26A4D60C0);
            uint64_t v28 = swift_bridgeObjectRetain();
            uint64_t v29 = MEMORY[0x26115A160](v28, v27);
            unint64_t v31 = v30;
            swift_bridgeObjectRelease();
            uint64_t v32 = v29;
            a2 = v26;
            sub_25AF772F0(v32, v31, &v62);
            sub_25AF799C0();
            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_25AF45000, v22, v23, "Multiple reminders match but user didn't say 'all'. Ask the user to disambiguate which reminder to snooze. {reminders: %s, result: .disambiguation}", v24, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x26115ACE0](v25, -1, -1);
            MEMORY[0x26115ACE0](v24, -1, -1);
          }
          else
          {

            swift_bridgeObjectRelease_n();
          }
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5980);
          uint64_t v44 = swift_allocObject();
          *(_OWORD *)(v44 + 16) = xmmword_25AF7A510;
          if (!v7) {
            goto LABEL_39;
          }
          uint64_t v62 = MEMORY[0x263F8EE78];
          uint64_t result = sub_25AF79B10();
          if ((v7 & 0x8000000000000000) == 0)
          {
            sub_25AF48D94(0, &qword_26A4D5B50);
            if ((a1 & 0xC000000000000001) != 0)
            {
              uint64_t v45 = 0;
              do
              {
                uint64_t v46 = v45 + 1;
                MEMORY[0x26115A540]();
                sub_25AF79900();
                sub_25AF79AF0();
                sub_25AF79B20();
                sub_25AF79B30();
                sub_25AF79B00();
                uint64_t v45 = v46;
              }
              while (v7 != v46);
            }
            else
            {
              uint64_t v47 = (void **)(a1 + 32);
              do
              {
                uint64_t v48 = *v47++;
                id v49 = v48;
                sub_25AF79900();
                sub_25AF79AF0();
                sub_25AF79B20();
                sub_25AF79B30();
                sub_25AF79B00();
                --v7;
              }
              while (v7);
            }
LABEL_39:
            sub_25AF48D94(0, &qword_26A4D60B8);
            ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
            sub_25AF48D94(0, &qword_26A4D5B50);
            uint64_t v51 = (void *)sub_25AF796C0();
            swift_bridgeObjectRelease();
            id v52 = objc_msgSend(ObjCClassFromMetadata, sel_disambiguationWithTasksToDisambiguate_, v51);

            *(void *)(v44 + 32) = v52;
            uint64_t v62 = v44;
            sub_25AF796F0();
            uint64_t v37 = v62;
            goto LABEL_40;
          }
          goto LABEL_55;
        }
LABEL_53:
        swift_once();
        goto LABEL_17;
      }
LABEL_6:
      if (qword_26A4D5930 != -1) {
        swift_once();
      }
      uint64_t v11 = sub_25AF795B0();
      __swift_project_value_buffer(v11, (uint64_t)qword_26A4D6080);
      swift_bridgeObjectRetain_n();
      id v12 = sub_25AF795A0();
      os_log_type_t v13 = sub_25AF797D0();
      if (os_log_type_enabled(v12, v13))
      {
        os_log_type_t v60 = v13;
        uint64_t v14 = swift_slowAlloc();
        uint64_t v59 = swift_slowAlloc();
        uint64_t v62 = v59;
        *(_DWORD *)uint64_t v14 = 134218242;
        sub_25AF799C0();
        *(_WORD *)(v14 + 12) = 2080;
        uint64_t v15 = MEMORY[0x263F8EE78];
        if (v7)
        {
          uint64_t v61 = MEMORY[0x263F8EE78];
          uint64_t result = sub_25AF79B10();
          if (v7 < 0)
          {
            __break(1u);
LABEL_55:
            __break(1u);
            return result;
          }
          uint64_t v17 = 0;
          do
          {
            if ((a1 & 0xC000000000000001) != 0) {
              id v18 = (id)MEMORY[0x26115A540](v17, a1);
            }
            else {
              id v18 = *(id *)(a1 + 8 * v17 + 32);
            }
            uint64_t v19 = v18;
            ++v17;
            id v20 = objc_msgSend(v18, sel_objectID);

            sub_25AF79AF0();
            sub_25AF79B20();
            sub_25AF79B30();
            sub_25AF79B00();
          }
          while (v7 != v17);
          uint64_t v15 = v61;
        }
        uint64_t v33 = sub_25AF48D94(0, &qword_26A4D5E48);
        uint64_t v34 = MEMORY[0x26115A160](v15, v33);
        unint64_t v36 = v35;
        swift_bridgeObjectRelease();
        sub_25AF772F0(v34, v36, &v62);
        sub_25AF799C0();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25AF45000, v12, v60, "Resolved %ld tasks to snooze. {reminderIDs: %s, result: .success}", (uint8_t *)v14, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x26115ACE0](v59, -1, -1);
        MEMORY[0x26115ACE0](v14, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      uint64_t v37 = MEMORY[0x263F8EE78];
      if (!v7)
      {
LABEL_40:
        a2(v37);
        return swift_bridgeObjectRelease();
      }
      uint64_t v62 = MEMORY[0x263F8EE78];
      sub_25AF79B10();
      if ((v7 & 0x8000000000000000) == 0)
      {
        sub_25AF48D94(0, &qword_26A4D60B8);
        uint64_t v38 = (void *)swift_getObjCClassFromMetadata();
        sub_25AF48D94(0, &qword_26A4D5B50);
        uint64_t v39 = 0;
        do
        {
          if ((a1 & 0xC000000000000001) != 0) {
            id v40 = (id)MEMORY[0x26115A540](v39, a1);
          }
          else {
            id v40 = *(id *)(a1 + 8 * v39 + 32);
          }
          ++v39;
          id v41 = v40;
          uint64_t v42 = (void *)sub_25AF79900();
          id v43 = objc_msgSend(v38, sel_successWithResolvedTask_, v42);

          sub_25AF79AF0();
          sub_25AF79B20();
          sub_25AF79B30();
          sub_25AF79B00();
        }
        while (v7 != v39);
        a2(v62);
        return swift_bridgeObjectRelease();
      }
      __break(1u);
      goto LABEL_53;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v7)
    {
      if (v7 == 1) {
        goto LABEL_6;
      }
      goto LABEL_4;
    }
  }
  if (qword_26A4D5930 != -1) {
    swift_once();
  }
  uint64_t v54 = sub_25AF795B0();
  __swift_project_value_buffer(v54, (uint64_t)qword_26A4D6080);
  uint64_t v55 = sub_25AF795A0();
  os_log_type_t v56 = sub_25AF797D0();
  if (os_log_type_enabled(v55, v56))
  {
    uint64_t v57 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v57 = 0;
    _os_log_impl(&dword_25AF45000, v55, v56, "No reminders to snooze. {result: .unsupported(.noTasksFound)}", v57, 2u);
    MEMORY[0x26115ACE0](v57, -1, -1);
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5980);
  uint64_t v58 = swift_allocObject();
  *(_OWORD *)(v58 + 16) = xmmword_25AF7A510;
  *(void *)(v58 + 32) = objc_msgSend(self, sel_unsupportedForReason_, 1);
  uint64_t v62 = v58;
  sub_25AF796F0();
  a2(v58);
  return swift_bridgeObjectRelease();
}

void sub_25AF6835C(uint64_t a1, uint64_t a2)
{
  sub_25AF48D94(0, &qword_26A4D60B8);
  id v3 = (id)sub_25AF796C0();
  (*(void (**)(uint64_t, id))(a2 + 16))(a2, v3);
}

id sub_25AF6851C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TTRSnoozeTasksIntentHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for TTRSnoozeTasksIntentHandler()
{
  return self;
}

uint64_t sub_25AF685D0()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_25AF68610(unint64_t a1)
{
  return sub_25AF67958(a1, *(void (**)(void))(v1 + 16), *(void *)(v1 + 24), *(id *)(v1 + 32));
}

uint64_t sub_25AF6861C()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_25AF6865C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_25AF68694(unint64_t a1)
{
  sub_25AF67378(a1, *(void (**)(uint64_t))(v1 + 16));
}

id sub_25AF6869C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = sub_25AF78F20();
  uint64_t v11 = *(void *)(v10 - 8);
  id v12 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48);
  os_log_type_t v13 = 0;
  if (v12(a1, 1, v10) != 1)
  {
    os_log_type_t v13 = (void *)sub_25AF78ED0();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a1, v10);
  }
  if (v12(a2, 1, v10) == 1)
  {
    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v14 = (void *)sub_25AF78ED0();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a2, v10);
  }
  uint64_t v15 = sub_25AF78FD0();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = 0;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))(a3, 1, v15) != 1)
  {
    uint64_t v17 = (void *)sub_25AF78FA0();
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(a3, v15);
  }
  uint64_t v18 = sub_25AF79000();
  uint64_t v19 = *(void *)(v18 - 8);
  id v20 = 0;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v19 + 48))(a4, 1, v18) != 1)
  {
    id v20 = (void *)sub_25AF78FE0();
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(a4, v18);
  }
  id v21 = objc_msgSend(v5, sel_initWithStartDate_endDate_onCalendar_inTimeZone_, v13, v14, v17, v20);

  return v21;
}

unint64_t sub_25AF68944(uint64_t a1, uint64_t a2)
{
  sub_25AF79CC0();
  sub_25AF79680();
  uint64_t v4 = sub_25AF79CD0();
  return sub_25AF68A00(a1, a2, v4);
}

unint64_t sub_25AF689BC(uint64_t a1)
{
  uint64_t v2 = sub_25AF79970();
  return sub_25AF68AE4(a1, v2);
}

unint64_t sub_25AF68A00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_25AF79C80() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        os_log_type_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_25AF79C80() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_25AF68AE4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    sub_25AF48D94(0, &qword_26A4D5E48);
    id v6 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    char v7 = sub_25AF79980();

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = ~v4;
      for (unint64_t i = (i + 1) & v8; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v8)
      {
        id v9 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v10 = sub_25AF79980();

        if (v10) {
          break;
        }
      }
    }
  }
  return i;
}

uint64_t sub_25AF68C00(uint64_t a1)
{
  if ((a1 & 0xC000000000000001) != 0) {
    return sub_25AF79B40();
  }
  unint64_t v2 = *(void *)(a1 + 64);
  if (v2)
  {
    uint64_t v3 = 0;
    return __clz(__rbit64(v2)) + v3;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v1 = 1 << v5;
  if (v6 < 7) {
    return v1;
  }
  unint64_t v2 = *(void *)(a1 + 72);
  if (v2)
  {
    uint64_t v3 = 64;
    return __clz(__rbit64(v2)) + v3;
  }
  unint64_t v7 = (unint64_t)(v1 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  id v9 = (unint64_t *)(a1 + 80);
  uint64_t v3 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v2 = v10;
    --v8;
    v3 += 64;
    if (v10) {
      return __clz(__rbit64(v2)) + v3;
    }
  }
  return v1;
}

void sub_25AF68CC4(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  if ((a3 & 1) == 0)
  {
    if (a1 < 0 || -(-1 << *(unsigned char *)(a4 + 32)) <= a1)
    {
      __break(1u);
    }
    else if ((*(void *)(a4 + 64 + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> a1))
    {
      if (*(_DWORD *)(a4 + 36) == a2)
      {
        sub_25AF79A00();
        return;
      }
      goto LABEL_12;
    }
    __break(1u);
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (sub_25AF79B80() != *(_DWORD *)(a4 + 36))
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  sub_25AF79B90();
  sub_25AF6A918(a1, a2, 1);
  sub_25AF48D94(0, &qword_26A4D5E48);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  swift_unknownObjectRelease();
  sub_25AF689BC((uint64_t)v8);
  char v7 = v6;

  if (v7)
  {
    sub_25AF79B60();
    sub_25AF79BB0();
    sub_25AF6A90C(a1, a2, 1);
    swift_unknownObjectRelease();
    return;
  }
LABEL_14:
  __break(1u);
}

void sub_25AF68E64(uint64_t a1, int a2, char a3, uint64_t a4)
{
  unint64_t v5 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a3)
    {
      sub_25AF79BC0();
      sub_25AF48D94(0, &qword_26A4D60C0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      return;
    }
    goto LABEL_19;
  }
  if (a3)
  {
LABEL_10:
    if (sub_25AF79B80() == *(_DWORD *)(a4 + 36))
    {
      sub_25AF79B90();
      sub_25AF48D94(0, &qword_26A4D5E48);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      unint64_t v5 = sub_25AF689BC((uint64_t)v10);
      char v7 = v6;

      if (v7) {
        goto LABEL_12;
      }
LABEL_18:
      __break(1u);
LABEL_19:
      __break(1u);
      return;
    }
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (a1 < 0 || 1 << *(unsigned char *)(a4 + 32) <= a1)
  {
    __break(1u);
    goto LABEL_16;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)a1 >> 6) + 64) >> a1) & 1) == 0)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
    __break(1u);
    goto LABEL_10;
  }
LABEL_12:
  unint64_t v8 = *(void **)(*(void *)(a4 + 56) + 8 * v5);
  id v9 = v8;
}

uint64_t sub_25AF69030(uint64_t a1, void *a2)
{
  unint64_t v21 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0) {
    uint64_t v4 = sub_25AF79A30();
  }
  else {
    uint64_t v4 = *(void *)(a1 + 16);
  }
  uint64_t result = MEMORY[0x263F8EE78];
  if (v4)
  {
    uint64_t v26 = MEMORY[0x263F8EE78];
    sub_25AF79B10();
    uint64_t result = sub_25AF68C00(a1);
    uint64_t v23 = result;
    uint64_t v24 = v6;
    char v25 = v7 & 1;
    if (v4 < 0)
    {
      __break(1u);
LABEL_16:
      __break(1u);
    }
    else
    {
      do
      {
        while (1)
        {
          uint64_t v14 = v23;
          uint64_t v15 = v24;
          char v16 = v25;
          sub_25AF68E64(v23, v24, v25, a1);
          uint64_t v18 = v17;
          id v19 = objc_msgSend(a2, sel_updateReminder_, v17);

          sub_25AF79AF0();
          sub_25AF79B20();
          sub_25AF79B30();
          uint64_t result = sub_25AF79B00();
          if (v21) {
            break;
          }
          sub_25AF68CC4(v14, v15, v16, a1);
          uint64_t v9 = v8;
          uint64_t v11 = v10;
          char v13 = v12;
          sub_25AF6A90C(v14, v15, v16);
          uint64_t v23 = v9;
          uint64_t v24 = v11;
          char v25 = v13 & 1;
          if (!--v4) {
            goto LABEL_13;
          }
        }
        if ((v16 & 1) == 0) {
          goto LABEL_16;
        }
        if (sub_25AF79B70()) {
          swift_isUniquelyReferenced_nonNull_native();
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D60C8);
        id v20 = (void (*)(unsigned char *, void))sub_25AF795F0();
        sub_25AF79BF0();
        v20(v22, 0);
        --v4;
      }
      while (v4);
LABEL_13:
      sub_25AF6A90C(v23, v24, v25);
      return v26;
    }
  }
  return result;
}

uint64_t sub_25AF69240(void *a1, uint64_t a2)
{
  uint64_t v98 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A4D60D0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v97 = (uint8_t *)&v87 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A4D5FE8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v96 = (char *)&v87 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5FE0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v89 = (char *)&v87 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v95 = (char *)&v87 - v10;
  MEMORY[0x270FA5388](v11);
  uint64_t v94 = (char *)&v87 - v12;
  MEMORY[0x270FA5388](v13);
  uint64_t v92 = (char *)&v87 - v14;
  MEMORY[0x270FA5388](v15);
  uint64_t v90 = (char *)&v87 - v16;
  uint64_t v17 = sub_25AF78F20();
  uint64_t v102 = *(void **)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v88 = (char *)&v87 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  unint64_t v21 = (char *)&v87 - v20;
  MEMORY[0x270FA5388](v22);
  uint64_t v24 = (char *)&v87 - v23;
  MEMORY[0x270FA5388](v25);
  uint64_t v27 = (char *)&v87 - v26;
  if (qword_26A4D5930 != -1) {
    swift_once();
  }
  uint64_t v28 = sub_25AF795B0();
  uint64_t v29 = __swift_project_value_buffer(v28, (uint64_t)qword_26A4D6080);
  id v30 = a1;
  uint64_t v93 = v29;
  unint64_t v31 = sub_25AF795A0();
  os_log_type_t v32 = sub_25AF797D0();
  BOOL v33 = os_log_type_enabled(v31, v32);
  uint64_t v101 = v27;
  if (v33)
  {
    uint64_t v34 = (uint8_t *)swift_slowAlloc();
    uint64_t v35 = swift_slowAlloc();
    uint64_t v91 = v24;
    uint64_t v36 = v35;
    uint64_t v104 = (void *)v35;
    *(_DWORD *)uint64_t v34 = 136315138;
    uint64_t v100 = v34 + 4;
    id v103 = objc_msgSend(v30, sel_nextTriggerTime);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A4D60E0);
    uint64_t v37 = sub_25AF79650();
    id v103 = (id)sub_25AF772F0(v37, v38, (uint64_t *)&v104);
    sub_25AF799C0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25AF45000, v31, v32, "Resolving nextTriggerTime {nextTriggerTime: %s}", v34, 0xCu);
    swift_arrayDestroy();
    uint64_t v39 = v36;
    uint64_t v24 = v91;
    MEMORY[0x26115ACE0](v39, -1, -1);
    id v40 = v34;
    uint64_t v27 = v101;
    MEMORY[0x26115ACE0](v40, -1, -1);
  }
  else
  {
  }
  sub_25AF78F10();
  sub_25AF78F10();
  sub_25AF78EC0();
  uint64_t v99 = (void (*)(char *, uint64_t))v102[1];
  uint64_t v100 = (uint8_t *)(v102 + 1);
  v99(v21, v17);
  id v41 = objc_msgSend(v30, sel_nextTriggerTime);
  uint64_t v42 = (uint64_t)v92;
  if (v41)
  {
    id v43 = v41;
    id v44 = objc_msgSend(v41, sel_endDate);
    if (v44)
    {
      uint64_t v45 = v44;
      uint64_t v91 = v24;
      sub_25AF78F00();

      uint64_t v46 = v102;
      uint64_t v47 = (void (*)(uint64_t, char *, uint64_t))v102[4];
      v47(v42, v21, v17);
      uint64_t v48 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v46[7];
      v48(v42, 0, 1, v17);
      id v49 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v46[6];
      if (v49(v42, 1, v17) != 1)
      {
        uint64_t v50 = (uint64_t)v90;
        v47((uint64_t)v90, (char *)v42, v17);
        v48(v50, 0, 1, v17);
        uint64_t v24 = v91;
        uint64_t v27 = v101;
LABEL_16:
        if (v49(v50, 1, v17) == 1)
        {

          sub_25AF6A8AC(v50);
        }
        else
        {
          uint64_t v57 = (void (*)(char *, uint64_t, uint64_t))v102[4];
          uint64_t v58 = v88;
          v57(v88, v50, v17);
          char v59 = sub_25AF78EE0();

          if (v59)
          {
            v99(v24, v17);
            v57(v24, (uint64_t)v58, v17);
          }
          else
          {
            v99(v58, v17);
          }
        }
        goto LABEL_21;
      }
      uint64_t v24 = v91;
      uint64_t v27 = v101;
    }
    else
    {
      uint64_t v48 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v102[7];
      v48(v42, 1, 1, v17);
    }
    uint64_t v50 = (uint64_t)v90;
    id v51 = objc_msgSend(v43, sel_startDate);
    if (v51)
    {
      id v52 = v51;
      uint64_t v53 = v89;
      sub_25AF78F00();

      uint64_t v54 = (uint64_t)v53;
      uint64_t v55 = 0;
    }
    else
    {
      uint64_t v55 = 1;
      uint64_t v54 = (uint64_t)v89;
    }
    os_log_type_t v56 = v102;
    v48(v54, v55, 1, v17);
    sub_25AF6A924(v54, v50);
    sub_25AF6A8AC(v42);
    id v49 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v56[6];
    goto LABEL_16;
  }
LABEL_21:
  os_log_type_t v60 = v102;
  uint64_t v61 = (void (*)(char *, char *, uint64_t))v102[2];
  uint64_t v62 = (uint64_t)v94;
  v61(v94, v27, v17);
  uint64_t v63 = (void (*)(uint64_t, void, uint64_t, uint64_t))v60[7];
  v63(v62, 0, 1, v17);
  uint64_t v64 = (uint64_t)v95;
  v61(v95, v24, v17);
  v63(v64, 0, 1, v17);
  uint64_t v65 = sub_25AF78FD0();
  uint64_t v66 = (uint64_t)v96;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v65 - 8) + 56))(v96, 1, 1, v65);
  uint64_t v67 = sub_25AF79000();
  uint64_t v68 = v97;
  (*(void (**)(uint8_t *, uint64_t, uint64_t, uint64_t))(*(void *)(v67 - 8) + 56))(v97, 1, 1, v67);
  id v69 = objc_allocWithZone(MEMORY[0x263F0FA60]);
  id v70 = sub_25AF6869C(v62, v64, v66, (uint64_t)v68);
  uint64_t v71 = sub_25AF795A0();
  os_log_type_t v72 = sub_25AF797D0();
  if (os_log_type_enabled(v71, v72))
  {
    uint64_t v73 = (uint8_t *)swift_slowAlloc();
    uint64_t v102 = (void *)swift_slowAlloc();
    uint64_t v104 = v102;
    *(_DWORD *)uint64_t v73 = 136315138;
    uint64_t v96 = (char *)(v73 + 4);
    uint64_t v97 = v73;
    id v74 = v70;
    uint64_t v75 = v17;
    id v76 = objc_msgSend(v74, sel_description);
    uint64_t v77 = v24;
    uint64_t v78 = sub_25AF79640();
    unint64_t v80 = v79;

    uint64_t v17 = v75;
    uint64_t v81 = v78;
    uint64_t v24 = v77;
    id v103 = (id)sub_25AF772F0(v81, v80, (uint64_t *)&v104);
    sub_25AF799C0();

    uint64_t v27 = v101;
    swift_bridgeObjectRelease();
    uint64_t v82 = v97;
    _os_log_impl(&dword_25AF45000, v71, v72, "Resolved nextTriggerTime. {nextTriggerTime: %s, result: .success", v97, 0xCu);
    uint64_t v83 = v102;
    swift_arrayDestroy();
    MEMORY[0x26115ACE0](v83, -1, -1);
    MEMORY[0x26115ACE0](v82, -1, -1);
  }
  else
  {
  }
  id v84 = objc_msgSend(self, sel_successWithResolvedDateComponentsRange_, v70);
  (*(void (**)(uint64_t, id))(v98 + 16))(v98, v84);

  uint64_t v85 = (uint64_t (*)(char *, uint64_t))v99;
  v99(v24, v17);
  return v85(v27, v17);
}

void sub_25AF69C44(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v101 = a3;
  uint64_t v97 = a2;
  v103[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5FE0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v93 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25AF78F20();
  uint64_t v8 = *(void (***)(char *, uint64_t, uint64_t, uint64_t))(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v93 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v93 - v12;
  if (qword_26A4D5930 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_25AF795B0();
  uint64_t v15 = (uint8_t *)__swift_project_value_buffer(v14, (uint64_t)qword_26A4D6080);
  id v16 = a1;
  uint64_t v17 = sub_25AF795A0();
  os_log_type_t v18 = sub_25AF797D0();
  BOOL v19 = os_log_type_enabled(v17, v18);
  uint64_t v100 = v10;
  if (v19)
  {
    uint64_t v96 = v6;
    uint64_t v20 = swift_slowAlloc();
    uint64_t v98 = v7;
    unint64_t v21 = (uint8_t *)v20;
    uint64_t v22 = (void *)swift_slowAlloc();
    uint64_t v95 = v21;
    *(_DWORD *)unint64_t v21 = 138412290;
    v103[0] = v16;
    id v23 = v16;
    uint64_t v99 = v13;
    id v24 = v23;
    uint64_t v6 = v96;
    sub_25AF799C0();
    void *v22 = v16;

    uint64_t v13 = v99;
    uint64_t v25 = v95;
    _os_log_impl(&dword_25AF45000, v17, v18, "SiriKit asked for handling snooze tasks intent {intent: %@}", v95, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5D80);
    swift_arrayDestroy();
    MEMORY[0x26115ACE0](v22, -1, -1);
    uint64_t v26 = v25;
    uint64_t v7 = v98;
    MEMORY[0x26115ACE0](v26, -1, -1);
  }
  else
  {
  }
  id v27 = objc_msgSend(v16, sel_tasks);
  if (!v27)
  {
    uint64_t v45 = sub_25AF795A0();
    os_log_type_t v46 = sub_25AF797B0();
    if (os_log_type_enabled(v45, v46))
    {
      uint64_t v47 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v47 = 0;
      _os_log_impl(&dword_25AF45000, v45, v46, "No .tasks to snooze. Should have resolved this in resolve stage. Giving up", v47, 2u);
      MEMORY[0x26115ACE0](v47, -1, -1);
    }

    id v48 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FF80]), sel_initWithCode_userActivity_, 4, 0);
    id v49 = *(void (**)(void))(v101 + 16);
    goto LABEL_32;
  }
  uint64_t v28 = v27;
  sub_25AF48D94(0, &qword_26A4D5B50);
  unint64_t v29 = sub_25AF796D0();
  id v30 = (char *)objc_msgSend(v16, sel_nextTriggerTime);
  if (!v30)
  {
    swift_bridgeObjectRelease();

LABEL_29:
    uint64_t v50 = sub_25AF795A0();
    os_log_type_t v51 = sub_25AF797B0();
    BOOL v52 = os_log_type_enabled(v50, v51);
    uint64_t v53 = v101;
    if (v52)
    {
      uint64_t v54 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v54 = 0;
      _os_log_impl(&dword_25AF45000, v50, v51, "No nextTriggerTime.endDate. Should have resolved this in resolve stage. Giving up.", v54, 2u);
      MEMORY[0x26115ACE0](v54, -1, -1);
    }

    id v48 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FF80]), sel_initWithCode_userActivity_, 4, 0);
    id v49 = *(void (**)(void))(v53 + 16);
LABEL_32:
    v49();

    return;
  }
  uint64_t v95 = v15;
  uint64_t v96 = v30;
  id v31 = objc_msgSend(v30, sel_endDate);
  if (!v31)
  {
    v8[7](v6, 1, 1, v7);
    goto LABEL_28;
  }
  os_log_type_t v32 = v31;
  BOOL v33 = v100;
  sub_25AF78F00();

  uint64_t v34 = v8[4];
  ((void (*)(char *, char *, uint64_t))v34)(v6, v33, v7);
  v8[7](v6, 0, 1, v7);
  if (((unsigned int (*)(char *, uint64_t, uint64_t))v8[6])(v6, 1, v7) == 1)
  {
LABEL_28:

    swift_bridgeObjectRelease();
    sub_25AF6A8AC((uint64_t)v6);
    goto LABEL_29;
  }
  ((void (*)(char *, char *, uint64_t))v34)(v13, v6, v7);
  uint64_t v99 = v13;
  sub_25AF78EF0();
  double v36 = v35;
  unint64_t v37 = *(void *)(v97 + OBJC_IVAR____TtC25RemindersIntentsFramework27TTRSnoozeTasksIntentHandler_store);
  unint64_t v38 = (char *)objc_msgSend(objc_allocWithZone(MEMORY[0x263F62F38]), sel_initWithStore_, v37);
  v103[0] = (id)MEMORY[0x263F8EE78];
  if (v29 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v39 = sub_25AF79C10();
  }
  else
  {
    uint64_t v39 = *(void *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  id v93 = v28;
  uint64_t v94 = v8;
  uint64_t v100 = v38;
  if (v39)
  {
    if (v39 < 1)
    {
      __break(1u);
      goto LABEL_46;
    }
    unint64_t v40 = v37;
    for (uint64_t i = 0; i != v39; ++i)
    {
      if ((v29 & 0xC000000000000001) != 0) {
        id v42 = (id)MEMORY[0x26115A540](i, v29);
      }
      else {
        id v42 = *(id *)(v29 + 8 * i + 32);
      }
      id v43 = v42;
      uint64_t v44 = sub_25AF798C0();

      if (v44)
      {
        MEMORY[0x26115A130]();
        if (*(void *)(((unint64_t)v103[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)v103[0] & 0xFFFFFFFFFFFFFF8)
                                                                                                + 0x18) >> 1)
          sub_25AF79700();
        sub_25AF79710();
        sub_25AF796F0();
      }
    }
    swift_bridgeObjectRelease();
    unint64_t v37 = v40;
    unint64_t v38 = v100;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  unint64_t v29 = sub_25AF48D94(0, &qword_26A4D5E48);
  uint64_t v55 = (void *)sub_25AF796C0();
  v103[0] = 0;
  id v56 = objc_msgSend((id)v37, sel_fetchRemindersWithObjectIDs_error_, v55, v103);

  id v57 = v103[0];
  uint64_t v98 = v7;
  if (!v56) {
    goto LABEL_51;
  }
  sub_25AF48D94(0, &qword_26A4D60C0);
  sub_25AF5D96C();
  uint64_t v58 = sub_25AF795D0();
  id v59 = v57;

  uint64_t v8 = v38;
  unint64_t v37 = sub_25AF69030(v58, v8);
  swift_bridgeObjectRelease();

  if (v37 >> 62)
  {
LABEL_46:
    swift_bridgeObjectRetain();
    uint64_t v60 = sub_25AF79C10();
    if (v60) {
      goto LABEL_38;
    }
    goto LABEL_47;
  }
  uint64_t v60 = *(void *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v60)
  {
LABEL_38:
    if (v60 < 1) {
      __break(1u);
    }
    for (uint64_t j = 0; j != v60; ++j)
    {
      if ((v37 & 0xC000000000000001) != 0) {
        id v62 = (id)MEMORY[0x26115A540](j, v37);
      }
      else {
        id v62 = *(id *)(v37 + 8 * j + 32);
      }
      uint64_t v63 = v62;
      objc_msgSend(v62, sel_snoozeFromNowForTimeInterval_, v36, v93);
    }
  }
LABEL_47:
  swift_bridgeObjectRelease_n();
  v103[0] = 0;
  unsigned int v64 = objc_msgSend(v8, sel_saveSynchronouslyWithError_, v103);
  id v57 = v103[0];
  if (v64)
  {
    id v65 = v103[0];
    sub_25AF79060();
    swift_retain();
    sub_25AF79050();
    swift_release();
    swift_bridgeObjectRetain();
    uint64_t v66 = sub_25AF795A0();
    os_log_type_t v67 = sub_25AF797D0();
    if (os_log_type_enabled(v66, v67))
    {
      uint64_t v68 = (uint8_t *)swift_slowAlloc();
      id v69 = v8;
      id v70 = (void *)swift_slowAlloc();
      v103[0] = v70;
      *(_DWORD *)uint64_t v68 = 136315138;
      uint64_t v71 = swift_bridgeObjectRetain();
      uint64_t v72 = MEMORY[0x26115A160](v71, v29);
      unint64_t v74 = v73;
      swift_bridgeObjectRelease();
      uint64_t v102 = sub_25AF772F0(v72, v74, (uint64_t *)v103);
      sub_25AF799C0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25AF45000, v66, v67, "Successfully snoozed reminders. {reminderIDs: %s}", v68, 0xCu);
      swift_arrayDestroy();
      uint64_t v75 = v70;
      uint64_t v8 = v69;
      uint64_t v76 = v101;
      MEMORY[0x26115ACE0](v75, -1, -1);
      MEMORY[0x26115ACE0](v68, -1, -1);

      uint64_t v77 = v98;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      uint64_t v77 = v98;
      uint64_t v76 = v101;
    }
    id v91 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FF80]), sel_initWithCode_userActivity_, 3, 0);
    id v92 = v93;
    objc_msgSend(v91, sel_setSnoozedTasks_, v93);

    (*(void (**)(uint64_t, id))(v76 + 16))(v76, v91);
    ((void (*)(char *, uint64_t))v94[1])(v99, v77);
    return;
  }
  uint64_t v7 = v98;
  unint64_t v38 = v100;
LABEL_51:
  id v78 = v57;

  unint64_t v79 = (void *)sub_25AF78E60();
  swift_willThrow();
  swift_bridgeObjectRetain();
  unint64_t v80 = sub_25AF795A0();
  os_log_type_t v81 = sub_25AF797B0();
  if (os_log_type_enabled(v80, v81))
  {
    uint64_t v82 = (uint8_t *)swift_slowAlloc();
    uint64_t v83 = (void *)swift_slowAlloc();
    v103[0] = v83;
    *(_DWORD *)uint64_t v82 = 136315138;
    uint64_t v84 = swift_bridgeObjectRetain();
    uint64_t v85 = v79;
    uint64_t v86 = MEMORY[0x26115A160](v84, v29);
    unint64_t v88 = v87;
    swift_bridgeObjectRelease();
    uint64_t v89 = v86;
    unint64_t v79 = v85;
    uint64_t v102 = sub_25AF772F0(v89, v88, (uint64_t *)v103);
    unint64_t v38 = v100;
    uint64_t v7 = v98;
    sub_25AF799C0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25AF45000, v80, v81, "Error snoozing reminders {reminderIDs: %s}", v82, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x26115ACE0](v83, -1, -1);
    MEMORY[0x26115ACE0](v82, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  id v90 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FF80]), sel_initWithCode_userActivity_, 4, 0);
  (*(void (**)(uint64_t, id))(v101 + 16))(v101, v90);

  ((void (*)(char *, uint64_t))v94[1])(v99, v7);
}

uint64_t sub_25AF6A8AC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5FE0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25AF6A90C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25AF6A918(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_25AF6A924(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5FE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25AF6A98C()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_25AF6A9C4(uint64_t a1)
{
  sub_25AF6835C(a1, *(void *)(v1 + 16));
}

uint64_t sub_25AF6A9CC()
{
  uint64_t v0 = sub_25AF795B0();
  __swift_allocate_value_buffer(v0, qword_26A4D60F0);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_26A4D60F0);
  if (qword_26A4D5900 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_26A4D6660);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

id sub_25AF6AA94()
{
  uint64_t v1 = OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler____lazy_storage___contactStore;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler____lazy_storage___contactStore);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler____lazy_storage___contactStore);
  }
  else
  {
    id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFEA58]), sel_init);
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id TTRIntentHandler.handler(for:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t ObjectType = swift_getObjectType();
  if (qword_26A4D5938 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25AF795B0();
  __swift_project_value_buffer(v4, (uint64_t)qword_26A4D60F0);
  id v5 = a1;
  id v6 = sub_25AF795A0();
  os_log_type_t v7 = sub_25AF797A0();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 138412290;
    id v10 = v5;
    sub_25AF799C0();
    *uint64_t v9 = v5;

    _os_log_impl(&dword_25AF45000, v6, v7, "SiriKit asks for handler for intent: %@", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5D80);
    swift_arrayDestroy();
    MEMORY[0x26115ACE0](v9, -1, -1);
    MEMORY[0x26115ACE0](v8, -1, -1);
  }
  else
  {
  }
  self;
  if (swift_dynamicCastObjCClass())
  {
    uint64_t v11 = &OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler____lazy_storage___addTasksHandler;
    uint64_t v12 = (uint64_t (*)(uint64_t))sub_25AF6B414;
LABEL_8:
    uint64_t v13 = sub_25AF6B140(v11, v12);
LABEL_11:
    uint64_t v14 = v13;
    id result = (id)swift_getObjectType();
LABEL_12:
    a2[3] = (uint64_t)result;
    *a2 = v14;
    return result;
  }
  self;
  if (swift_dynamicCastObjCClass())
  {
    uint64_t v13 = (uint64_t)sub_25AF6AF2C();
    goto LABEL_11;
  }
  self;
  if (swift_dynamicCastObjCClass())
  {
    uint64_t v11 = &OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler____lazy_storage___snoozeTasksHandler;
    uint64_t v12 = (uint64_t (*)(uint64_t))sub_25AF6B70C;
    goto LABEL_8;
  }
  self;
  if (swift_dynamicCastObjCClass())
  {
    uint64_t v11 = &OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler____lazy_storage___searchForNotebookItemsHandler;
    uint64_t v12 = (uint64_t (*)(uint64_t))sub_25AF6B86C;
    goto LABEL_8;
  }
  sub_25AF792B0();
  if (swift_dynamicCastClass())
  {
    uint64_t v14 = (uint64_t)sub_25AF6B1A8();
    id result = (id)type metadata accessor for ConfigurationIntentHandler();
    goto LABEL_12;
  }
  id v16 = v5;
  uint64_t v17 = sub_25AF795A0();
  os_log_type_t v18 = sub_25AF797C0();
  if (os_log_type_enabled(v17, v18))
  {
    BOOL v19 = (uint8_t *)swift_slowAlloc();
    uint64_t v20 = (void *)swift_slowAlloc();
    *(_DWORD *)BOOL v19 = 138412290;
    unint64_t v21 = v16;
    sub_25AF799C0();
    *uint64_t v20 = v16;

    _os_log_impl(&dword_25AF45000, v17, v18, "TTRIntentHandler does not know how to handle intent of class: %@", v19, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5D80);
    swift_arrayDestroy();
    MEMORY[0x26115ACE0](v20, -1, -1);
    MEMORY[0x26115ACE0](v19, -1, -1);
  }
  else
  {

    uint64_t v17 = v16;
  }

  a2[3] = ObjectType;
  *a2 = (uint64_t)v23;
  return v23;
}

id sub_25AF6AF2C()
{
  uint64_t v1 = OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler____lazy_storage___setTaskAttributeHandler;
  if (*(void *)&v0[OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler____lazy_storage___setTaskAttributeHandler])
  {
    id v2 = *(id *)&v0[OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler____lazy_storage___setTaskAttributeHandler];
  }
  else
  {
    id v3 = v0;
    uint64_t v4 = *(void **)&v0[OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler_store];
    id v5 = *(void **)&v3[OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler_queue];
    type metadata accessor for TTRIntentsHandlerStoreDataSource();
    uint64_t v6 = swift_allocObject();
    uint64_t v7 = qword_26A4D5918;
    id v8 = v4;
    if (v7 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_25AF795B0();
    __swift_project_value_buffer(v9, (uint64_t)qword_26A4D5E60);
    id v10 = sub_25AF795A0();
    os_log_type_t v11 = sub_25AF797D0();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_25AF45000, v10, v11, "[TTRIntentsHandlerStoreDataSource] Using the backup intents handler data source", v12, 2u);
      MEMORY[0x26115ACE0](v12, -1, -1);
    }

    *(void *)(v6 + 16) = v8;
    type metadata accessor for TTRIntentsHandlerSpotlightDataSource();
    uint64_t v13 = swift_allocObject();
    id v14 = v8;
    id v15 = v5;
    uint64_t v16 = sub_25AF6BD44((uint64_t)v14, (uint64_t)v15, v6, v13);
    uint64_t v17 = swift_allocObject();
    *(void *)(v17 + 16) = v3;
    sub_25AF791A0();
    os_log_type_t v18 = (uint64_t *)swift_allocObject();
    id v19 = v14;
    id v20 = v15;
    unint64_t v21 = v3;
    id v22 = sub_25AF6C0B0((uint64_t)v19, (uint64_t)v20, (uint64_t)sub_25AF6C47C, v17, v16, v18);
    *(void *)&v3[v1] = v22;
    id v2 = v22;
    swift_unknownObjectRelease();
  }
  swift_unknownObjectRetain();
  return v2;
}

uint64_t sub_25AF6B140(uint64_t *a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = *a1;
  uint64_t v4 = *(void *)(v2 + *a1);
  if (v4)
  {
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v5 = a2(v2);
    *(void *)(v2 + v3) = v5;
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
  }
  swift_unknownObjectRetain();
  return v5;
}

id sub_25AF6B1A8()
{
  uint64_t v1 = OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler____lazy_storage___widgetListHandler;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler____lazy_storage___widgetListHandler);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler____lazy_storage___widgetListHandler);
  }
  else
  {
    uint64_t v4 = v0;
    uint64_t v5 = *(void **)(v0 + OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler_store);
    uint64_t v6 = *(void **)(v4 + OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler_queue);
    type metadata accessor for TTRIntentsHandlerStoreDataSource();
    uint64_t v7 = swift_allocObject();
    uint64_t v8 = qword_26A4D5918;
    id v9 = v5;
    if (v8 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_25AF795B0();
    __swift_project_value_buffer(v10, (uint64_t)qword_26A4D5E60);
    os_log_type_t v11 = sub_25AF795A0();
    os_log_type_t v12 = sub_25AF797D0();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_25AF45000, v11, v12, "[TTRIntentsHandlerStoreDataSource] Using the backup intents handler data source", v13, 2u);
      MEMORY[0x26115ACE0](v13, -1, -1);
    }

    *(void *)(v7 + 16) = v9;
    type metadata accessor for TTRIntentsHandlerSpotlightDataSource();
    uint64_t v14 = swift_allocObject();
    id v15 = v9;
    id v16 = v6;
    uint64_t v17 = sub_25AF6BD44((uint64_t)v15, (uint64_t)v16, v7, v14);
    os_log_type_t v18 = (char *)objc_allocWithZone((Class)type metadata accessor for ConfigurationIntentHandler());
    id v19 = v15;
    id v20 = v16;
    id v21 = sub_25AF6C2D0(v19, v20, v17, v18);

    id v22 = *(void **)(v4 + v1);
    *(void *)(v4 + v1) = v21;
    id v3 = v21;

    uint64_t v2 = 0;
  }
  id v23 = v2;
  return v3;
}

id sub_25AF6B414(char *a1)
{
  uint64_t v2 = *(void **)&a1[OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler_store];
  id v3 = *(void **)&a1[OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler_queue];
  type metadata accessor for TTRIntentsHandlerStoreDataSource();
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = qword_26A4D5918;
  id v6 = v2;
  if (v5 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_25AF795B0();
  __swift_project_value_buffer(v7, (uint64_t)qword_26A4D5E60);
  uint64_t v8 = sub_25AF795A0();
  os_log_type_t v9 = sub_25AF797D0();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_25AF45000, v8, v9, "[TTRIntentsHandlerStoreDataSource] Using the backup intents handler data source", v10, 2u);
    MEMORY[0x26115ACE0](v10, -1, -1);
  }

  *(void *)(v4 + 16) = v6;
  type metadata accessor for TTRIntentsHandlerSpotlightDataSource();
  uint64_t v11 = swift_allocObject();
  id v12 = v6;
  id v13 = v3;
  uint64_t v14 = sub_25AF6BD44((uint64_t)v12, (uint64_t)v13, v4, v11);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a1;
  sub_25AF791A0();
  uint64_t v16 = swift_allocObject();
  v31[3] = &type metadata for TTRContactRepresentationResolver;
  v31[4] = &off_2708A5190;
  v31[0] = sub_25AF6BEA0;
  v31[1] = v15;
  uint64_t v17 = objc_allocWithZone((Class)type metadata accessor for TTRAddTasksIntentHandler());
  uint64_t v18 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v31, (uint64_t)&type metadata for TTRContactRepresentationResolver);
  double v19 = MEMORY[0x270FA5388](v18);
  id v21 = (void *)((char *)&v31[-1] - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *, double))(v22 + 16))(v21, v19);
  uint64_t v23 = *v21;
  uint64_t v24 = v21[1];
  id v25 = v12;
  id v26 = v13;
  id v27 = a1;
  swift_retain();
  swift_retain();
  swift_retain();
  id v28 = sub_25AF6BF14((uint64_t)v25, (uint64_t)v26, v14, v23, v24, v16, v17);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
  swift_release();
  swift_release();
  swift_release();
  return v28;
}

id sub_25AF6B70C(uint64_t a1)
{
  sub_25AF79640();
  id v2 = objc_allocWithZone(MEMORY[0x263F1DFB0]);
  id v3 = (void *)sub_25AF79610();
  swift_bridgeObjectRelease();
  id v4 = objc_msgSend(v2, sel_initWithBundleIdentifier_, v3);

  uint64_t v5 = *(void **)(a1 + OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler_store);
  uint64_t v15 = sub_25AF48D94(0, (unint64_t *)&unk_26A4D61C0);
  uint64_t v16 = &off_2708A51A0;
  *(void *)&long long v14 = v4;
  type metadata accessor for TTRIntentsHandlerNotificationCenterDataSource();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  sub_25AF6C098(&v14, v6 + 24);
  uint64_t v7 = *(void **)(a1 + OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler_queue);
  uint64_t v8 = (objc_class *)type metadata accessor for TTRSnoozeTasksIntentHandler();
  os_log_type_t v9 = (char *)objc_allocWithZone(v8);
  *(void *)&v9[OBJC_IVAR____TtC25RemindersIntentsFramework27TTRSnoozeTasksIntentHandler_store] = v5;
  *(void *)&v9[OBJC_IVAR____TtC25RemindersIntentsFramework27TTRSnoozeTasksIntentHandler_queue] = v7;
  *(void *)&v9[OBJC_IVAR____TtC25RemindersIntentsFramework27TTRSnoozeTasksIntentHandler_dataSource] = v6;
  v13.receiver = v9;
  v13.super_class = v8;
  id v10 = v5;
  id v11 = v7;
  return objc_msgSendSuper2(&v13, sel_init);
}

id sub_25AF6B86C(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler_store);
  id v2 = *(void **)(a1 + OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler_queue);
  type metadata accessor for TTRIntentsHandlerStoreDataSource();
  uint64_t v3 = swift_allocObject();
  uint64_t v4 = qword_26A4D5918;
  id v5 = v1;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_25AF795B0();
  __swift_project_value_buffer(v6, (uint64_t)qword_26A4D5E60);
  uint64_t v7 = sub_25AF795A0();
  os_log_type_t v8 = sub_25AF797D0();
  if (os_log_type_enabled(v7, v8))
  {
    os_log_type_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v9 = 0;
    _os_log_impl(&dword_25AF45000, v7, v8, "[TTRIntentsHandlerStoreDataSource] Using the backup intents handler data source", v9, 2u);
    MEMORY[0x26115ACE0](v9, -1, -1);
  }

  *(void *)(v3 + 16) = v5;
  uint64_t v10 = type metadata accessor for TTRIntentsHandlerSpotlightDataSource();
  uint64_t v11 = swift_allocObject();
  id v12 = v5;
  id v13 = v2;
  swift_retain();
  uint64_t v14 = sub_25AF6BD44((uint64_t)v12, (uint64_t)v13, v3, v11);
  v26[3] = v10;
  v26[4] = &off_2708A5930;
  swift_release();
  v26[0] = v14;
  sub_25AF54CFC((uint64_t)v26, (uint64_t)v25);
  uint64_t v15 = sub_25AF791A0();
  uint64_t v16 = swift_allocObject();
  v24[3] = v15;
  v24[4] = MEMORY[0x263F634D8];
  v24[0] = v16;
  uint64_t v17 = (objc_class *)type metadata accessor for TTRSearchForNotebookItemsIntentHandler();
  uint64_t v18 = (char *)objc_allocWithZone(v17);
  *(void *)&v18[OBJC_IVAR____TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler_store] = v12;
  *(void *)&v18[OBJC_IVAR____TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler_queue] = v13;
  sub_25AF54CFC((uint64_t)v25, (uint64_t)&v18[OBJC_IVAR____TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler_dataSource]);
  sub_25AF54CFC((uint64_t)v24, (uint64_t)&v18[OBJC_IVAR____TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler_timeProvider]);
  v23.receiver = v18;
  v23.super_class = v17;
  id v19 = v12;
  id v20 = v13;
  swift_retain();
  id v21 = objc_msgSendSuper2(&v23, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  return v21;
}

id TTRIntentHandler.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id TTRIntentHandler.init()()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler_store;
  id v3 = objc_allocWithZone(MEMORY[0x263F62F78]);
  uint64_t v4 = v0;
  *(void *)&v0[v2] = objc_msgSend(v3, sel_initUserInteractive_, 1);
  uint64_t v5 = OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler_queue;
  sub_25AF48D94(0, (unint64_t *)&qword_26A4D5950);
  *(void *)&v4[v5] = sub_25AF79830();
  *(void *)&v4[OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler____lazy_storage___contactStore] = 0;
  *(void *)&v4[OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler____lazy_storage___addTasksHandler] = 0;
  *(void *)&v4[OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler____lazy_storage___setTaskAttributeHandler] = 0;
  *(void *)&v4[OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler____lazy_storage___snoozeTasksHandler] = 0;
  *(void *)&v4[OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler____lazy_storage___searchForNotebookItemsHandler] = 0;
  *(void *)&v4[OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler____lazy_storage___widgetListHandler] = 0;

  v7.receiver = v4;
  v7.super_class = ObjectType;
  return objc_msgSendSuper2(&v7, sel_init);
}

id TTRIntentHandler.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for TTRIntentHandler()
{
  return self;
}

uint64_t sub_25AF6BD44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v14 = type metadata accessor for TTRIntentsHandlerStoreDataSource();
  uint64_t v15 = &off_2708A5278;
  *(void *)&long long v13 = a3;
  if (qword_26A4D5948 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_25AF795B0();
  __swift_project_value_buffer(v8, (uint64_t)qword_26A4D6250);
  os_log_type_t v9 = sub_25AF795A0();
  os_log_type_t v10 = sub_25AF797D0();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_25AF45000, v9, v10, "[TTRIntentsHandlerSpotlightDataSource] Using the Spotlight intents handler data source", v11, 2u);
    MEMORY[0x26115ACE0](v11, -1, -1);
  }

  *(void *)(a4 + 16) = a1;
  *(void *)(a4 + 24) = a2;
  sub_25AF6C098(&v13, a4 + 32);
  return a4;
}

uint64_t sub_25AF6BE68()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_25AF6BEA0()
{
  return sub_25AF6AA94();
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

id sub_25AF6BF14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  v22[3] = type metadata accessor for TTRIntentsHandlerSpotlightDataSource();
  v22[4] = &off_2708A5930;
  v22[0] = a3;
  uint64_t v20 = MEMORY[0x263F63500];
  uint64_t v21 = MEMORY[0x263F634F8];
  v18[3] = sub_25AF791A0();
  v18[4] = MEMORY[0x263F634D8];
  v18[0] = a6;
  v17[3] = &type metadata for TTRContactRepresentationResolver;
  v17[4] = &off_2708A5190;
  v17[0] = a4;
  v17[1] = a5;
  a7[OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_didNotSpecifyTargetList] = 0;
  sub_25AF54CFC((uint64_t)v18, (uint64_t)&a7[OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_timeProvider]);
  *(void *)&a7[OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_store] = a1;
  *(void *)&a7[OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_queue] = a2;
  sub_25AF54CFC((uint64_t)v22, (uint64_t)&a7[OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_dataSource]);
  sub_25AF54CFC((uint64_t)v17, (uint64_t)&a7[OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_contactRepresentationResolver]);
  sub_25AF54CFC((uint64_t)v19, (uint64_t)&a7[OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_userActivityProvider]);
  v16.receiver = a7;
  v16.super_class = (Class)type metadata accessor for TTRAddTasksIntentHandler();
  id v14 = objc_msgSendSuper2(&v16, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
  return v14;
}

uint64_t sub_25AF6C098(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

id sub_25AF6C0B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6)
{
  uint64_t v12 = *a6;
  v28[4] = &off_2708A5930;
  v28[3] = type metadata accessor for TTRIntentsHandlerSpotlightDataSource();
  v28[0] = a5;
  v27[3] = &type metadata for TTRContactRepresentationResolver;
  v27[4] = &off_2708A5190;
  v27[0] = a3;
  v27[1] = a4;
  v26[3] = v12;
  v26[4] = MEMORY[0x263F634D8];
  v26[0] = a6;
  long long v13 = (objc_class *)type metadata accessor for TTRSetTaskAttributeIntentHandler();
  id v14 = (char *)objc_allocWithZone(v13);
  uint64_t v15 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v27, (uint64_t)&type metadata for TTRContactRepresentationResolver);
  double v16 = MEMORY[0x270FA5388](v15);
  uint64_t v18 = (long long *)((char *)&v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(long long *, double))(v19 + 16))(v18, v16);
  uint64_t v24 = &type metadata for TTRContactRepresentationResolver;
  id v25 = &off_2708A5190;
  long long v23 = *v18;
  *(void *)&v14[OBJC_IVAR____TtC25RemindersIntentsFramework32TTRSetTaskAttributeIntentHandler_store] = a1;
  *(void *)&v14[OBJC_IVAR____TtC25RemindersIntentsFramework32TTRSetTaskAttributeIntentHandler_queue] = a2;
  sub_25AF54CFC((uint64_t)&v23, (uint64_t)&v14[OBJC_IVAR____TtC25RemindersIntentsFramework32TTRSetTaskAttributeIntentHandler_contactRepresentationResolver]);
  sub_25AF54CFC((uint64_t)v28, (uint64_t)&v14[OBJC_IVAR____TtC25RemindersIntentsFramework32TTRSetTaskAttributeIntentHandler_dataSource]);
  sub_25AF54CFC((uint64_t)v26, (uint64_t)&v14[OBJC_IVAR____TtC25RemindersIntentsFramework32TTRSetTaskAttributeIntentHandler_timeProvider]);
  v22.receiver = v14;
  v22.super_class = v13;
  id v20 = objc_msgSendSuper2(&v22, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v23);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
  return v20;
}

id sub_25AF6C2D0(void *a1, void *a2, uint64_t a3, char *a4)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  v20[3] = type metadata accessor for TTRIntentsHandlerSpotlightDataSource();
  v20[4] = &off_2708A5930;
  v20[0] = a3;
  *(int64x2_t *)&a4[OBJC_IVAR____TtC25RemindersIntentsFramework26ConfigurationIntentHandler_badgeSize] = vdupq_n_s64(0x4040000000000000uLL);
  uint64_t v9 = qword_26A4D5940;
  os_log_type_t v10 = a4;
  if (v9 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_25AF795B0();
  __swift_project_value_buffer(v11, (uint64_t)qword_26A4D61E8);
  uint64_t v12 = sub_25AF795A0();
  os_log_type_t v13 = sub_25AF797D0();
  if (os_log_type_enabled(v12, v13))
  {
    id v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v14 = 0;
    _os_log_impl(&dword_25AF45000, v12, v13, "ConfigurationIntentHandler Created", v14, 2u);
    MEMORY[0x26115ACE0](v14, -1, -1);
  }

  *(void *)&v10[OBJC_IVAR____TtC25RemindersIntentsFramework26ConfigurationIntentHandler_store] = a1;
  *(void *)&v10[OBJC_IVAR____TtC25RemindersIntentsFramework26ConfigurationIntentHandler_queue] = a2;
  sub_25AF54CFC((uint64_t)v20, (uint64_t)&v10[OBJC_IVAR____TtC25RemindersIntentsFramework26ConfigurationIntentHandler_dataSource]);
  id v15 = a1;
  id v16 = a2;

  v19.receiver = v10;
  v19.super_class = ObjectType;
  id v17 = objc_msgSendSuper2(&v19, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
  return v17;
}

uint64_t sub_25AF6C480(uint64_t a1, unint64_t a2)
{
  uint64_t v80 = a1;
  uint64_t v91 = sub_25AF792E0();
  uint64_t v3 = *(void *)(v91 - 8);
  MEMORY[0x270FA5388](v91);
  id v90 = (char *)&v73 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v89 = (char *)&v73 - v6;
  uint64_t v93 = sub_25AF792A0();
  uint64_t v7 = *(void *)(v93 - 8);
  MEMORY[0x270FA5388](v93);
  uint64_t v9 = (char *)&v73 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v73 - v11;
  MEMORY[0x270FA5388](v13);
  id v78 = (char *)&v73 - v14;
  MEMORY[0x270FA5388](v15);
  unint64_t v79 = (char *)&v73 - v16;
  MEMORY[0x270FA5388](v17);
  id v92 = (char *)&v73 - v18;
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = (char *)&v73 - v20;
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v70 = sub_25AF79C10();
    swift_bridgeObjectRelease();
    if (v70 < 2) {
      goto LABEL_12;
    }
  }
  else if (*(uint64_t *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10) < 2)
  {
LABEL_12:
    swift_bridgeObjectRetain();
    if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0 && sub_25AF79C10()) {
      goto LABEL_29;
    }
    uint64_t v42 = MEMORY[0x263F8EE88];
LABEL_14:
    uint64_t v100 = v42;
    unint64_t v43 = swift_bridgeObjectRetain();
    uint64_t v44 = sub_25AF6EB08(v43);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v44;
  }
  unint64_t v22 = *(void *)(v80 + 16);
  if (!v22) {
    goto LABEL_12;
  }
  unint64_t v73 = v9;
  unint64_t v74 = v12;
  uint64_t v76 = 0;
  uint64_t v24 = v7 + 16;
  long long v23 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  unint64_t v25 = v22;
  id v26 = (char *)(v80 + ((*(unsigned __int8 *)(v24 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 64)));
  uint64_t v27 = *(void *)(v24 + 56);
  uint64_t v97 = (uint64_t (**)(char *, uint64_t))(v24 + 72);
  uint64_t v98 = v23;
  LODWORD(v96) = *MEMORY[0x263F63130];
  unint64_t v88 = (char **)(v24 + 80);
  uint64_t v86 = (void (**)(char *, char *, uint64_t))(v3 + 32);
  unsigned int v85 = *MEMORY[0x263F63178];
  uint64_t v83 = (void (**)(char *, uint64_t))(v3 + 8);
  uint64_t v84 = (void (**)(char *, void, uint64_t))(v3 + 104);
  unint64_t v77 = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v99 = (void (**)(char *, uint64_t))(v24 - 8);
  uint64_t v75 = v26;
  unint64_t v81 = v25;
  uint64_t v82 = v27;
  unint64_t v28 = v25;
  id v30 = v92;
  uint64_t v29 = v93;
  uint64_t v87 = v24;
  while (1)
  {
    os_log_type_t v32 = v98;
    v98(v21, v26, v29);
    v32(v30, v21, v29);
    BOOL v33 = *v97;
    int v34 = (*v97)(v30, v29);
    if (v34 == v96) {
      break;
    }
    id v31 = *v99;
    (*v99)(v30, v29);
LABEL_6:
    v31(v21, v29);
    v26 += v27;
    if (!--v28)
    {
      swift_bridgeObjectRelease();
      goto LABEL_11;
    }
  }
  double v35 = v21;
  uint64_t v94 = v33;
  double v36 = *v88;
  ((void (*)(char *, uint64_t))*v88)(v30, v29);
  unint64_t v37 = v30;
  unint64_t v38 = v89;
  uint64_t v39 = v91;
  (*v86)(v89, v37, v91);
  unint64_t v40 = v90;
  (*v84)(v90, v85, v39);
  int v95 = sub_25AF792D0();
  id v41 = *v83;
  (*v83)(v40, v39);
  v41(v38, v39);
  id v31 = *v99;
  if ((v95 & 1) == 0)
  {
    uint64_t v27 = v82;
    id v30 = v92;
    uint64_t v29 = v93;
    uint64_t v21 = v35;
    goto LABEL_6;
  }
  id v92 = v36;
  uint64_t v46 = v93;
  uint64_t v96 = v31;
  v31(v35, v93);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  unint64_t v47 = 0;
  int v95 = *MEMORY[0x263F63110];
  id v48 = v79;
  id v49 = v78;
  uint64_t v50 = v75;
  uint64_t v51 = v82;
  BOOL v52 = v96;
  while (1)
  {
    uint64_t v53 = v50;
    uint64_t v54 = v98;
    ((void (*)(char *))v98)(v48);
    v54(v49, v48, v46);
    uint64_t v55 = v94;
    int v56 = v94(v49, v46);
    if (v56 == v95) {
      break;
    }
    swift_bridgeObjectRetain();
    v52(v49, v46);
    v52(v48, v46);
    swift_bridgeObjectRelease();
    ++v47;
    uint64_t v50 = &v53[v51];
    if (v81 == v47) {
      goto LABEL_11;
    }
  }
  uint64_t v75 = v53;
  id v57 = (void (*)(char *, uint64_t))v92;
  ((void (*)(char *, uint64_t))v92)(v49, v46);
  uint64_t v91 = *((void *)v49 + 1);
  uint64_t v58 = &v49[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A4D6020) + 48)];
  uint64_t v59 = sub_25AF793C0();
  uint64_t v60 = *(void *)(v59 - 8);
  uint64_t v61 = *(void (**)(char *, uint64_t))(v60 + 8);
  id v62 = (char *)(v60 + 8);
  swift_bridgeObjectRetain();
  id v90 = v62;
  v61(v58, v59);
  v96(v48, v46);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v81 == v47) {
    goto LABEL_11;
  }
  if (v47 >= v81)
  {
    __break(1u);
    goto LABEL_31;
  }
  uint64_t v63 = v74;
  unsigned int v64 = v98;
  v98(v74, v75, v46);
  id v65 = v73;
  v64(v73, v63, v46);
  int v66 = v55(v65, v46);
  if (v66 == v95)
  {
    v57(v65, v46);
    uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D6020);
    v61(&v65[*(int *)(v67 + 48)], v59);
    v96(v63, v46);
    swift_bridgeObjectRelease();
    unint64_t v68 = swift_bridgeObjectRetain();
    unint64_t v69 = sub_25AF6E5AC(v68);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (!(v69 >> 62))
    {
      if (*(void *)((v69 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
LABEL_24:
        if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0 && sub_25AF79C10()) {
LABEL_29:
        }
          sub_25AF6E7B0(MEMORY[0x263F8EE78]);
        else {
          uint64_t v42 = MEMORY[0x263F8EE88];
        }
        goto LABEL_14;
      }
LABEL_11:
      swift_bridgeObjectRelease();
      goto LABEL_12;
    }
LABEL_31:
    swift_bridgeObjectRetain();
    uint64_t v71 = sub_25AF79C10();
    swift_bridgeObjectRelease();
    if (v71) {
      goto LABEL_24;
    }
    goto LABEL_11;
  }
  uint64_t v72 = v96;
  v96(v65, v46);
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v72)(v63, v46);
  __break(1u);
  return result;
}

uint64_t sub_25AF6CDF0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_25AF79CC0();
  swift_bridgeObjectRetain();
  sub_25AF79680();
  uint64_t v8 = sub_25AF79CD0();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_25AF79C80() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
      uint64_t v15 = v14[1];
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
      if (v19 || (sub_25AF79C80() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_25AF6DA0C(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_25AF6CFA0(void *a1, void *a2)
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
    uint64_t v9 = sub_25AF79A40();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_25AF6ECE8();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v26;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_25AF79A30();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    uint64_t v21 = sub_25AF6D220(v7, result + 1);
    uint64_t v27 = v21;
    if (*(void *)(v21 + 24) <= *(void *)(v21 + 16))
    {
      id v25 = v8;
      sub_25AF6D6E8();
      uint64_t v22 = v27;
    }
    else
    {
      uint64_t v22 = v21;
      id v23 = v8;
    }
    sub_25AF6D988((uint64_t)v8, v22);
    *uint64_t v3 = v22;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_25AF79970();
    uint64_t v12 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v13 = v11 & ~v12;
    if ((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
    {
      sub_25AF6ECE8();
      id v14 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
      char v15 = sub_25AF79980();

      if (v15)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        BOOL v19 = *(void **)(*(void *)(*v2 + 48) + 8 * v13);
        *a1 = v19;
        id v20 = v19;
        return 0;
      }
      uint64_t v16 = ~v12;
      while (1)
      {
        unint64_t v13 = (v13 + 1) & v16;
        if (((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0) {
          break;
        }
        id v17 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
        char v18 = sub_25AF79980();

        if (v18) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v28 = *v2;
    *long long v2 = 0x8000000000000000;
    id v8 = a2;
    sub_25AF6DBA8((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native);
    *long long v2 = v28;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_25AF6D220(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D61D8);
    uint64_t v2 = sub_25AF79A80();
    uint64_t v14 = v2;
    sub_25AF79A20();
    if (sub_25AF79A50())
    {
      sub_25AF6ECE8();
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_25AF6D6E8();
          uint64_t v2 = v14;
        }
        uint64_t result = sub_25AF79970();
        uint64_t v4 = v2 + 56;
        uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v6 = result & ~v5;
        unint64_t v7 = v6 >> 6;
        if (((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          unint64_t v8 = __clz(__rbit64((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v9 = 0;
          unint64_t v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v11 = v7 == v10;
            if (v7 == v10) {
              unint64_t v7 = 0;
            }
            v9 |= v11;
            uint64_t v12 = *(void *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          unint64_t v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(void *)(*(void *)(v2 + 48) + 8 * v8) = v13;
        ++*(void *)(v2 + 16);
      }
      while (sub_25AF79A50());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x263F8EE88];
  }
  return v2;
}

uint64_t sub_25AF6D408()
{
  id v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D61E0);
  uint64_t v3 = sub_25AF79A70();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    id v30 = (void *)(v2 + 56);
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
                id v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *id v30 = -1 << v29;
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
      sub_25AF79CC0();
      sub_25AF79680();
      uint64_t result = sub_25AF79CD0();
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
      uint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *uint64_t v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_25AF6D6E8()
{
  id v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D61D8);
  uint64_t v3 = sub_25AF79A70();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v28 = v0;
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
                id v1 = v28;
                uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
                if (v27 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v6 = -1 << v27;
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
      uint64_t v19 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
      uint64_t result = sub_25AF79970();
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
      *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

unint64_t sub_25AF6D988(uint64_t a1, uint64_t a2)
{
  sub_25AF79970();
  unint64_t result = sub_25AF79A10();
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

uint64_t sub_25AF6DA0C(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_25AF6D408();
  }
  else
  {
    if (v10 > v9)
    {
      unint64_t result = (uint64_t)sub_25AF6DD20();
      goto LABEL_22;
    }
    sub_25AF6E080();
  }
  uint64_t v11 = *v4;
  sub_25AF79CC0();
  sub_25AF79680();
  unint64_t result = sub_25AF79CD0();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (unint64_t result = sub_25AF79C80(), (result & 1) != 0))
    {
LABEL_21:
      unint64_t result = sub_25AF79C90();
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
          unint64_t result = sub_25AF79C80();
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

void sub_25AF6DBA8(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_25AF6D6E8();
  }
  else
  {
    if (v7 > v6)
    {
      sub_25AF6DED4();
      goto LABEL_14;
    }
    sub_25AF6E330();
  }
  uint64_t v8 = *v3;
  uint64_t v9 = sub_25AF79970();
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_25AF6ECE8();
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = sub_25AF79980();

    if (v12)
    {
LABEL_13:
      sub_25AF79C90();
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
        char v15 = sub_25AF79980();

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

void *sub_25AF6DD20()
{
  id v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D61E0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25AF79A60();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    unint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    uint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v19 = *v17;
    v19[1] = v18;
    unint64_t result = (void *)swift_bridgeObjectRetain();
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

id sub_25AF6DED4()
{
  id v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D61D8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25AF79A60();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19)
      {
        int64_t v9 = v18 + 2;
        if (v18 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v19 = *(void *)(v6 + 8 * v9);
        if (!v19) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    id result = v17;
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v13) {
    goto LABEL_28;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_25AF6E080()
{
  id v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D61E0);
  uint64_t v3 = sub_25AF79A70();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
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
    unint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_25AF79CC0();
    swift_bridgeObjectRetain();
    sub_25AF79680();
    uint64_t result = sub_25AF79CD0();
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
    id v1 = v0;
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

uint64_t sub_25AF6E330()
{
  id v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D61D8);
  uint64_t v3 = sub_25AF79A70();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  BOOL v27 = v0;
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
    id v19 = *(id *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t result = sub_25AF79970();
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
    *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    id v1 = v27;
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

uint64_t sub_25AF6E5AC(unint64_t a1)
{
  unint64_t v1 = a1;
  uint64_t v18 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_21;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = 0;
      unint64_t v4 = v1 & 0xC000000000000001;
      uint64_t v5 = v1 & 0xFFFFFFFFFFFFFF8;
      unint64_t v6 = 0x265487000uLL;
      unint64_t v17 = v1;
      uint64_t v16 = v1 & 0xFFFFFFFFFFFFFF8;
      while (v4)
      {
        id v7 = (id)MEMORY[0x26115A540](v3, v1);
LABEL_9:
        unint64_t v8 = v7;
        unint64_t v9 = v3 + 1;
        if (__OFADD__(v3, 1)) {
          goto LABEL_20;
        }
        id v10 = [v7 *(SEL *)(v6 + 3536)];
        if (v10)
        {
          int64_t v11 = v10;
          if (objc_msgSend(v10, sel_shouldCategorizeGroceryItems))
          {
            unint64_t v12 = v4;
            id v13 = objc_msgSend(v8, sel_name);
            sub_25AF79640();

            sub_25AF6EC94();
            uint64_t v14 = sub_25AF799E0();
            swift_bridgeObjectRelease();

            if (v14)
            {
            }
            else
            {
              sub_25AF79AF0();
              sub_25AF79B20();
              sub_25AF79B30();
              sub_25AF79B00();
            }
            unint64_t v4 = v12;
            uint64_t v5 = v16;
            unint64_t v1 = v17;
            unint64_t v6 = 0x265487000;
          }
          else
          {
          }
        }
        else
        {
        }
        ++v3;
        if (v9 == v2) {
          return v18;
        }
      }
      if (v3 < *(void *)(v5 + 16)) {
        break;
      }
      __break(1u);
LABEL_20:
      __break(1u);
LABEL_21:
      uint64_t v2 = sub_25AF79C10();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    id v7 = *(id *)(v1 + 8 * v3 + 32);
    goto LABEL_9;
  }
  return MEMORY[0x263F8EE78];
}

void sub_25AF6E7B0(unint64_t a1)
{
  unint64_t v1 = a1;
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_25AF79C10();
    swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D61D8);
      uint64_t v3 = sub_25AF79A90();
      uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
      if (!v2) {
        goto LABEL_4;
      }
LABEL_8:
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_25AF79C10();
      swift_bridgeObjectRelease();
      if (!v5) {
        return;
      }
      goto LABEL_9;
    }
  }
  else if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  uint64_t v3 = MEMORY[0x263F8EE88];
  uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
  if (v2) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5) {
    return;
  }
LABEL_9:
  uint64_t v7 = v3 + 56;
  uint64_t v42 = v5;
  if ((v1 & 0xC000000000000001) != 0)
  {
    uint64_t v8 = 0;
    unint64_t v40 = v1;
    while (1)
    {
      uint64_t v9 = MEMORY[0x26115A540](v8, v1);
      BOOL v10 = __OFADD__(v8++, 1);
      if (v10)
      {
        __break(1u);
        goto LABEL_37;
      }
      uint64_t v11 = v9;
      uint64_t v12 = sub_25AF79970();
      uint64_t v13 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v14 = v12 & ~v13;
      unint64_t v15 = v14 >> 6;
      uint64_t v16 = *(void *)(v7 + 8 * (v14 >> 6));
      uint64_t v17 = 1 << v14;
      if (((1 << v14) & v16) != 0)
      {
        sub_25AF6ECE8();
        id v18 = *(id *)(*(void *)(v3 + 48) + 8 * v14);
        char v19 = sub_25AF79980();

        if (v19)
        {
LABEL_11:
          swift_unknownObjectRelease();
          unint64_t v1 = v40;
          goto LABEL_12;
        }
        uint64_t v20 = ~v13;
        while (1)
        {
          unint64_t v14 = (v14 + 1) & v20;
          unint64_t v15 = v14 >> 6;
          uint64_t v16 = *(void *)(v7 + 8 * (v14 >> 6));
          uint64_t v17 = 1 << v14;
          if ((v16 & (1 << v14)) == 0) {
            break;
          }
          id v21 = *(id *)(*(void *)(v3 + 48) + 8 * v14);
          char v22 = sub_25AF79980();

          if (v22) {
            goto LABEL_11;
          }
        }
        unint64_t v1 = v40;
      }
      *(void *)(v7 + 8 * v15) = v17 | v16;
      *(void *)(*(void *)(v3 + 48) + 8 * v14) = v11;
      uint64_t v23 = *(void *)(v3 + 16);
      BOOL v10 = __OFADD__(v23, 1);
      uint64_t v24 = v23 + 1;
      if (v10) {
        goto LABEL_38;
      }
      *(void *)(v3 + 16) = v24;
LABEL_12:
      if (v8 == v42) {
        return;
      }
    }
  }
  uint64_t v25 = 0;
  uint64_t v41 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v25 != v41)
  {
    id v26 = *(id *)(v1 + 32 + 8 * v25);
    uint64_t v27 = sub_25AF79970();
    uint64_t v28 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v29 = v27 & ~v28;
    unint64_t v30 = v29 >> 6;
    uint64_t v31 = *(void *)(v7 + 8 * (v29 >> 6));
    uint64_t v32 = 1 << v29;
    if (((1 << v29) & v31) != 0)
    {
      sub_25AF6ECE8();
      id v33 = *(id *)(*(void *)(v3 + 48) + 8 * v29);
      char v34 = sub_25AF79980();

      if (v34) {
        goto LABEL_24;
      }
      uint64_t v35 = ~v28;
      unint64_t v29 = (v29 + 1) & v35;
      unint64_t v30 = v29 >> 6;
      uint64_t v31 = *(void *)(v7 + 8 * (v29 >> 6));
      uint64_t v32 = 1 << v29;
      if ((v31 & (1 << v29)) != 0)
      {
        while (1)
        {
          id v36 = *(id *)(*(void *)(v3 + 48) + 8 * v29);
          char v37 = sub_25AF79980();

          if (v37) {
            break;
          }
          unint64_t v29 = (v29 + 1) & v35;
          unint64_t v30 = v29 >> 6;
          uint64_t v31 = *(void *)(v7 + 8 * (v29 >> 6));
          uint64_t v32 = 1 << v29;
          if ((v31 & (1 << v29)) == 0) {
            goto LABEL_32;
          }
        }
LABEL_24:

        uint64_t v5 = v42;
        goto LABEL_25;
      }
LABEL_32:
      uint64_t v5 = v42;
    }
    *(void *)(v7 + 8 * v30) = v32 | v31;
    *(void *)(*(void *)(v3 + 48) + 8 * v29) = v26;
    uint64_t v38 = *(void *)(v3 + 16);
    BOOL v10 = __OFADD__(v38, 1);
    uint64_t v39 = v38 + 1;
    if (v10) {
      goto LABEL_39;
    }
    *(void *)(v3 + 16) = v39;
LABEL_25:
    if (++v25 == v5) {
      return;
    }
  }
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
}

uint64_t sub_25AF6EB08(unint64_t a1)
{
  uint64_t v11 = MEMORY[0x263F8EE78];
  if (a1 >> 62)
  {
LABEL_16:
    uint64_t v2 = sub_25AF79C10();
    if (v2) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v2)
    {
LABEL_3:
      unint64_t v3 = 0;
      uint64_t v4 = a1 & 0xFFFFFFFFFFFFFF8;
      while (1)
      {
        if ((a1 & 0xC000000000000001) != 0)
        {
          id v5 = (id)MEMORY[0x26115A540](v3, a1);
          unint64_t v6 = v3 + 1;
          if (__OFADD__(v3, 1))
          {
LABEL_13:
            __break(1u);
            return v11;
          }
        }
        else
        {
          if (v3 >= *(void *)(v4 + 16))
          {
            __break(1u);
            goto LABEL_16;
          }
          id v5 = *(id *)(a1 + 8 * v3 + 32);
          unint64_t v6 = v3 + 1;
          if (__OFADD__(v3, 1)) {
            goto LABEL_13;
          }
        }
        id v7 = v5;
        char v8 = sub_25AF6CFA0(&v10, v7);

        if (v8)
        {
          sub_25AF79AF0();
          sub_25AF79B20();
          uint64_t v4 = a1 & 0xFFFFFFFFFFFFFF8;
          sub_25AF79B30();
          sub_25AF79B00();
        }
        else
        {
        }
        ++v3;
        if (v6 == v2) {
          return v11;
        }
      }
    }
  }
  return MEMORY[0x263F8EE78];
}

unint64_t sub_25AF6EC94()
{
  unint64_t result = qword_26A4D61D0;
  if (!qword_26A4D61D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4D61D0);
  }
  return result;
}

unint64_t sub_25AF6ECE8()
{
  unint64_t result = qword_26A4D5B40;
  if (!qword_26A4D5B40)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A4D5B40);
  }
  return result;
}

uint64_t sub_25AF6ED28()
{
  uint64_t v0 = sub_25AF795B0();
  __swift_allocate_value_buffer(v0, qword_26A4D61E8);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_26A4D61E8);
  if (qword_26A4D5900 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_26A4D6660);
  unint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

void sub_25AF6EE78(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (qword_26A4D5940 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_25AF795B0();
  __swift_project_value_buffer(v8, (uint64_t)qword_26A4D61E8);
  swift_bridgeObjectRetain_n();
  id v9 = a1;
  id v10 = sub_25AF795A0();
  os_log_type_t v11 = sub_25AF797D0();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v34 = a5;
    uint64_t v13 = swift_slowAlloc();
    uint64_t v38 = v13;
    *(_DWORD *)uint64_t v12 = 136315394;
    id v14 = v9;
    id v15 = objc_msgSend(v14, sel_description);
    uint64_t v16 = sub_25AF79640();
    unint64_t v18 = v17;

    sub_25AF772F0(v16, v18, &v38);
    sub_25AF799C0();

    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2080;
    uint64_t v19 = a2;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5AF8);
    uint64_t v20 = sub_25AF79650();
    sub_25AF772F0(v20, v21, &v38);
    sub_25AF799C0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25AF45000, v10, v11, "Widget provideListOptions {intent: %s, searchTerm: %s}", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    uint64_t v22 = v13;
    a5 = v34;
    MEMORY[0x26115ACE0](v22, -1, -1);
    MEMORY[0x26115ACE0](v12, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    uint64_t v19 = a2;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D6228);
  uint64_t v23 = &v36[OBJC_IVAR____TtC25RemindersIntentsFramework26ConfigurationIntentHandler_dataSource];
  uint64_t v24 = *(void *)&v36[OBJC_IVAR____TtC25RemindersIntentsFramework26ConfigurationIntentHandler_dataSource + 24];
  uint64_t v25 = *(void *)&v36[OBJC_IVAR____TtC25RemindersIntentsFramework26ConfigurationIntentHandler_dataSource + 32];
  __swift_project_boxed_opaque_existential_1(&v36[OBJC_IVAR____TtC25RemindersIntentsFramework26ConfigurationIntentHandler_dataSource], v24);
  sub_25AF5E434(v24, v25);
  uint64_t v26 = *((void *)v23 + 3);
  uint64_t v27 = *((void *)v23 + 4);
  __swift_project_boxed_opaque_existential_1(v23, v26);
  sub_25AF5E360(v26, v27);
  sub_25AF79530();
  swift_release();
  swift_release();
  uint64_t v28 = (void *)swift_allocObject();
  v28[2] = a4;
  v28[3] = a5;
  v28[4] = v36;
  void v28[5] = v19;
  v28[6] = a3;
  uint64_t v29 = swift_allocObject();
  *(void *)(v29 + 16) = sub_25AF72B84;
  *(void *)(v29 + 24) = v28;
  swift_bridgeObjectRetain();
  swift_retain();
  unint64_t v30 = v36;
  uint64_t v31 = (void *)sub_25AF79500();
  sub_25AF79540();
  swift_release();

  uint64_t v32 = swift_allocObject();
  *(void *)(v32 + 16) = a4;
  *(void *)(v32 + 24) = a5;
  swift_retain();
  id v33 = (void *)sub_25AF79500();
  sub_25AF79550();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
}

void sub_25AF6F378(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = sub_25AF78E50();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);
}

uint64_t sub_25AF6F3E8(uint64_t a1, uint64_t a2, uint64_t (*a3)(id, void), uint64_t a4, char *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v189 = a7;
  uint64_t v181 = a6;
  unint64_t v234 = a5;
  uint64_t v176 = a4;
  id v177 = (uint64_t (*)(id, void))a3;
  uint64_t v225 = sub_25AF79400();
  uint64_t v193 = *(void *)(v225 - 8);
  MEMORY[0x270FA5388](v225);
  id v10 = (id *)((char *)&v171 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v11);
  unint64_t v224 = (char *)&v171 - v12;
  uint64_t v200 = sub_25AF79430();
  uint64_t v13 = *(char **)(v200 - 8);
  MEMORY[0x270FA5388](v200);
  id v199 = (char *)&v171 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v230 = sub_25AF78E90();
  unint64_t v233 = *(void *)(v230 - 8);
  MEMORY[0x270FA5388](v230);
  uint64_t v229 = (char *)&v171 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v213 = sub_25AF79410();
  uint64_t v186 = *(void *)(v213 - 8);
  MEMORY[0x270FA5388](v213);
  uint64_t v207 = (void **)((char *)&v171 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)&v171 - v18;
  uint64_t v192 = sub_25AF79460();
  uint64_t v190 = *(void *)(v192 - 8);
  MEMORY[0x270FA5388](v192);
  unint64_t v185 = (char *)&v171 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5E80);
  MEMORY[0x270FA5388](v21 - 8);
  uint64_t v23 = (char *)&v171 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_25AF79480();
  uint64_t v25 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  uint64_t v27 = (char *)&v171 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v28);
  unint64_t v178 = (char *)&v171 - v29;
  if (!a1)
  {
LABEL_4:
    if (qword_26A4D5940 == -1)
    {
LABEL_5:
      uint64_t v30 = sub_25AF795B0();
      __swift_project_value_buffer(v30, (uint64_t)qword_26A4D61E8);
      uint64_t v31 = sub_25AF795A0();
      os_log_type_t v32 = sub_25AF797B0();
      if (os_log_type_enabled(v31, v32))
      {
        id v33 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v33 = 0;
        _os_log_impl(&dword_25AF45000, v31, v32, "Widget provideListOptions failed no data", v33, 2u);
        MEMORY[0x26115ACE0](v33, -1, -1);
      }

      return v177(0, 0);
    }
LABEL_76:
    swift_once();
    goto LABEL_5;
  }
  sub_25AF72C34(a2, (uint64_t)v23);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24) == 1)
  {
    sub_25AF54EBC((uint64_t)v23, &qword_26A4D5E80);
    goto LABEL_4;
  }
  uint64_t v227 = v13;
  uint64_t v35 = v178;
  (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v178, v23, v24);
  uint64_t v36 = qword_26A4D5940;
  swift_bridgeObjectRetain();
  if (v36 != -1) {
    swift_once();
  }
  uint64_t v37 = sub_25AF795B0();
  uint64_t v38 = __swift_project_value_buffer(v37, (uint64_t)qword_26A4D61E8);
  (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v27, v35, v24);
  swift_bridgeObjectRetain();
  uint64_t v39 = v25;
  uint64_t v173 = v38;
  unint64_t v40 = sub_25AF795A0();
  os_log_type_t v41 = sub_25AF797D0();
  BOOL v42 = os_log_type_enabled(v40, v41);
  uint64_t v223 = v10;
  uint64_t v211 = v19;
  uint64_t v175 = v24;
  uint64_t v174 = v39;
  if (v42)
  {
    uint64_t v43 = swift_slowAlloc();
    *(_DWORD *)uint64_t v43 = 134218240;
    uint64_t aBlock = *(void *)(a1 + 16);
    sub_25AF799C0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v43 + 12) = 2048;
    uint64_t v44 = *(void *)(sub_25AF79470() + 16);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v39 + 8))(v27, v24);
    uint64_t aBlock = v44;
    sub_25AF799C0();
    _os_log_impl(&dword_25AF45000, v40, v41, "Widget provideListOptions smartListTypes: %ld, accounts %ld ", (uint8_t *)v43, 0x16u);
    MEMORY[0x26115ACE0](v43, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v39 + 8))(v27, v24);

    swift_bridgeObjectRelease();
  }
  uint64_t v45 = MEMORY[0x263F8EE78];
  unint64_t v244 = MEMORY[0x263F8EE78];
  sub_25AF79220();
  uint64_t v46 = MEMORY[0x261159C90](v178);
  uint64_t v47 = *(void *)(a1 + 16);
  uint64_t v48 = v225;
  id v49 = v227;
  if (v47)
  {
    uint64_t v50 = v46;
    uint64_t v51 = (id *)(a1 + 32);
    uint64_t v52 = MEMORY[0x263F8EE78];
    do
    {
      id v249 = *v51;
      id v53 = v249;
      if (sub_25AF71128((uint64_t)&v249, v50))
      {
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t aBlock = v52;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_25AF72CBC(0, *(void *)(v52 + 16) + 1, 1);
          uint64_t v52 = aBlock;
        }
        unint64_t v56 = *(void *)(v52 + 16);
        unint64_t v55 = *(void *)(v52 + 24);
        if (v56 >= v55 >> 1)
        {
          sub_25AF72CBC(v55 > 1, v56 + 1, 1);
          uint64_t v52 = aBlock;
        }
        *(void *)(v52 + 16) = v56 + 1;
        *(void *)(v52 + 8 * v56 + 32) = v53;
        uint64_t v48 = v225;
      }
      else
      {
      }
      ++v51;
      --v47;
    }
    while (v47);
  }
  else
  {
    uint64_t v52 = v45;
  }
  swift_bridgeObjectRelease();
  id v57 = v234;
  unint64_t v58 = sub_25AF72FD0(v52);
  swift_release();
  uint64_t v232 = v57;

  uint64_t v59 = v189;
  if (v189)
  {
    swift_bridgeObjectRetain();
    sub_25AF730A8(v58, v181, v59);
    uint64_t v188 = 0;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v188 = 0;
  }
  uint64_t v60 = v223;
  uint64_t v61 = v224;
  id v62 = v185;
  id v63 = objc_allocWithZone(MEMORY[0x263F0FCC0]);
  uint64_t v231 = sub_25AF79270();
  unsigned int v64 = (void *)sub_25AF796C0();
  swift_bridgeObjectRelease();
  id v65 = objc_msgSend(v63, sel_initWithTitle_items_, 0, v64);

  id v66 = v65;
  MEMORY[0x26115A130]();
  if (*(void *)((v244 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v244 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_25AF79700();
  }
  id v172 = v66;
  sub_25AF79710();
  sub_25AF796F0();
  uint64_t v67 = sub_25AF79470();
  uint64_t v182 = *(void *)(v67 + 16);
  if (!v182)
  {
LABEL_67:
    swift_bridgeObjectRelease();
    unint64_t v161 = v244;
    swift_bridgeObjectRetain_n();
    id v162 = sub_25AF795A0();
    os_log_type_t v163 = sub_25AF797D0();
    if (os_log_type_enabled(v162, v163))
    {
      id v164 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)id v164 = 134217984;
      if (v161 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v165 = sub_25AF79C10();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v165 = *(void *)((v161 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      uint64_t aBlock = v165;
      sub_25AF799C0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25AF45000, v162, v163, "Widget provideListOptions sections %ld ", v164, 0xCu);
      MEMORY[0x26115ACE0](v164, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v166 = v172;
    swift_beginAccess();
    id v167 = objc_allocWithZone(MEMORY[0x263F0FCB8]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D6238);
    id v168 = (void *)sub_25AF796C0();
    swift_bridgeObjectRelease();
    id v169 = objc_msgSend(v167, sel_initWithSections_, v168);

    id v170 = v169;
    v177(v169, 0);

    return (*(uint64_t (**)(char *, uint64_t))(v174 + 8))(v178, v175);
  }
  unint64_t v68 = 0;
  unint64_t v184 = v67 + ((*(unsigned __int8 *)(v190 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v190 + 80));
  uint64_t v183 = v190 + 16;
  uint64_t v206 = v186 + 16;
  uint64_t v205 = (uint64_t (**)(void **, uint64_t))(v186 + 88);
  int v204 = *MEMORY[0x263F632A0];
  unint64_t v203 = (void (**)(void **, uint64_t))(v186 + 96);
  uint64_t v196 = (void (**)(char *, void **, uint64_t))(v49 + 32);
  uint64_t v222 = v193 + 16;
  os_log_type_t v221 = (uint64_t (**)(id *, uint64_t))(v193 + 88);
  int v198 = *MEMORY[0x263F63298];
  v220 = (void (**)(id *, uint64_t))(v193 + 96);
  uint64_t v228 = (void (**)(char *, uint64_t))(v233 + 8);
  int v195 = *MEMORY[0x263F632A8];
  v219 = &v237;
  int v218 = *MEMORY[0x263F63290];
  uint64_t v217 = (void (**)(char *, uint64_t))(v193 + 8);
  uint64_t v194 = (void (**)(char *, uint64_t))(v49 + 8);
  int v215 = *MEMORY[0x263F63288];
  unint64_t v202 = (void (**)(char *, uint64_t))(v186 + 8);
  id v179 = (void (**)(char *, uint64_t))(v190 + 8);
  long long v201 = xmmword_25AF7A510;
  uint64_t v180 = v67;
  while (1)
  {
    if (v68 >= *(void *)(v67 + 16))
    {
LABEL_75:
      __break(1u);
      goto LABEL_76;
    }
    uint64_t v69 = *(void *)(v190 + 72);
    unint64_t v191 = v68;
    (*(void (**)(char *, unint64_t, uint64_t))(v190 + 16))(v62, v184 + v69 * v68, v192);
    uint64_t v70 = sub_25AF79420();
    unint64_t v71 = MEMORY[0x263F8EE78];
    unint64_t v243 = MEMORY[0x263F8EE78];
    uint64_t v212 = *(void *)(v70 + 16);
    if (v212) {
      break;
    }
    swift_bridgeObjectRelease();
LABEL_62:
    uint64_t v152 = v189;
    if (v189)
    {
      swift_bridgeObjectRetain();
      uint64_t v153 = v188;
      sub_25AF730A8(v71, v181, v152);
      uint64_t v188 = v153;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    uint64_t v154 = (void *)sub_25AF79440();
    id v155 = objc_msgSend(v154, sel_displayName);

    sub_25AF79640();
    id v156 = objc_allocWithZone(MEMORY[0x263F0FCC0]);
    os_log_type_t v157 = (void *)sub_25AF79610();
    swift_bridgeObjectRelease();
    uint64_t v158 = (void *)sub_25AF796C0();
    swift_bridgeObjectRelease();
    id v159 = objc_msgSend(v156, sel_initWithTitle_items_, v157, v158);

    id v160 = v159;
    MEMORY[0x26115A130]();
    if (*(void *)((v244 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v244 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_25AF79700();
    }
    unint64_t v68 = v191 + 1;
    sub_25AF79710();
    sub_25AF796F0();

    (*v179)(v62, v192);
    uint64_t v67 = v180;
    if (v68 == v182) {
      goto LABEL_67;
    }
  }
  unint64_t v210 = v70 + ((*(unsigned __int8 *)(v186 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v186 + 80));
  uint64_t v209 = *(void *)(v186 + 72);
  os_log_type_t v208 = *(void (**)(void, void, void))(v186 + 16);
  uint64_t v187 = v70;
  swift_bridgeObjectRetain();
  uint64_t v72 = 0;
  uint64_t v73 = v213;
  unint64_t v74 = v211;
  while (1)
  {
    uint64_t v214 = v72;
    unint64_t v81 = (void (*)(void **, char *, uint64_t))v208;
    v208(v74, v210 + v209 * v72, v73);
    uint64_t v82 = v207;
    v81(v207, v74, v73);
    int v83 = (*v205)(v82, v73);
    if (v83 != v204) {
      break;
    }
    (*v203)(v82, v73);
    uint64_t v75 = *v82;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5980);
    uint64_t v76 = swift_allocObject();
    *(_OWORD *)(v76 + 16) = v201;
    *(void *)(v76 + 32) = sub_25AF71724(v75);
    uint64_t aBlock = v76;
    sub_25AF796F0();
    uint64_t v77 = v213;
    unint64_t v78 = aBlock;

LABEL_35:
    uint64_t v79 = v214 + 1;
    unint64_t v74 = v211;
    (*v202)(v211, v77);
    uint64_t v73 = v77;
    unint64_t v80 = v78;
    uint64_t v72 = v79;
    sub_25AF5EB58(v80);
    if (v79 == v212)
    {
      swift_bridgeObjectRelease_n();
      unint64_t v71 = v243;
      id v62 = v185;
      goto LABEL_62;
    }
  }
  if (v83 == v198)
  {
    (*v203)(v82, v73);
    uint64_t v84 = *v82;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5980);
    uint64_t v85 = swift_allocObject();
    *(_OWORD *)(v85 + 16) = v201;
    id v86 = objc_msgSend(v84, sel_objectID);
    id v87 = objc_msgSend(v86, sel_urlRepresentation);

    unint64_t v88 = v229;
    sub_25AF78E80();

    sub_25AF78E70();
    (*v228)(v88, v230);
    id v89 = objc_msgSend(v84, sel_name);
    sub_25AF79640();

    id v90 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
    uint64_t v91 = (void *)sub_25AF79610();
    swift_bridgeObjectRelease();
    id v92 = (void *)sub_25AF79610();
    swift_bridgeObjectRelease();
    id v93 = objc_msgSend(v90, sel_initWithIdentifier_displayString_, v91, v92);

    id v94 = objc_msgSend(v84, sel_customContext);
    id v95 = objc_msgSend(v94, sel_badge);
    id v96 = objc_msgSend(v94, sel_color);
    uint64_t v97 = sub_25AF79070();
    sub_25AF72898(v97, (uint64_t)v245);
    uint64_t v98 = (void *)sub_25AF720D0(v95, v96, (uint64_t)v245);

    if (v98)
    {
      objc_msgSend(v93, sel_setDisplayImage_, v98);
    }
    objc_msgSend(v93, sel_setSubtitleString_, 0);
    *(void *)(v85 + 32) = v93;
    uint64_t aBlock = v85;
    sub_25AF796F0();
    unint64_t v78 = aBlock;

    uint64_t v77 = v213;
    goto LABEL_35;
  }
  if (v83 != v195) {
    goto LABEL_79;
  }
  (*v203)(v82, v73);
  (*v196)(v199, v82, v200);
  uint64_t v99 = sub_25AF79420();
  uint64_t v100 = *(char **)(v99 + 16);
  if (!v100)
  {
    swift_bridgeObjectRelease();
    unint64_t v78 = MEMORY[0x263F8EE78];
LABEL_59:
    uint64_t v77 = v213;
    (*v194)(v199, v200);
    goto LABEL_35;
  }
  unint64_t v242 = MEMORY[0x263F8EE78];
  sub_25AF79B10();
  unint64_t v101 = (*(unsigned __int8 *)(v193 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v193 + 80);
  uint64_t v197 = v99;
  unint64_t v102 = v99 + v101;
  uint64_t v226 = *(void *)(v193 + 72);
  uint64_t v227 = *(char **)(v193 + 16);
  while (2)
  {
    uint64_t v105 = v227;
    ((void (*)(char *, unint64_t, uint64_t))v227)(v61, v102, v48);
    ((void (*)(id *, char *, uint64_t))v105)(v60, v61, v48);
    int v106 = (*v221)(v60, v48);
    unint64_t v234 = v100;
    unint64_t v233 = v102;
    if (v106 == v218)
    {
      (*v220)(v60, v48);
      id v107 = *v60;
      id v108 = objc_msgSend(*v60, sel_objectID);
      id v109 = objc_msgSend(v108, sel_urlRepresentation);

      uint64_t v110 = v229;
      sub_25AF78E80();

      sub_25AF78E70();
      (*v228)(v110, v230);
      id v111 = objc_msgSend(v107, sel_displayName);
      sub_25AF79640();

      id v112 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
      uint64_t v113 = (void *)sub_25AF79610();
      swift_bridgeObjectRelease();
      uint64_t v114 = (void *)sub_25AF79610();
      swift_bridgeObjectRelease();
      id v115 = objc_msgSend(v112, sel_initWithIdentifier_displayString_, v113, v114);

      id v116 = objc_msgSend(v107, sel_appearanceContext);
      id v117 = objc_msgSend(v116, sel_badge);

      id v118 = objc_msgSend(v107, sel_color);
      memset(v246, 0, sizeof(v246));
      uint64_t v247 = 0;
      char v248 = 2;
      unint64_t v241 = 0;
      sub_25AF72854();
      uint64_t v119 = sub_25AF79830();
      uint64_t v120 = (void *)swift_allocObject();
      uint64_t v121 = v232;
      v120[2] = v232;
      v120[3] = v117;
      v120[4] = v118;
      sub_25AF72898((uint64_t)v246, (uint64_t)(v120 + 5));
      v120[11] = &v241;
      uint64_t v122 = swift_allocObject();
      *(void *)(v122 + 16) = sub_25AF728F4;
      *(void *)(v122 + 24) = v120;
      uint64_t v239 = sub_25AF736B4;
      uint64_t v240 = v122;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v236 = 1107296256;
      uint64_t v237 = sub_25AF725A8;
      uint64_t v238 = &block_descriptor_49;
      uint64_t v123 = _Block_copy(&aBlock);
      uint64_t v124 = v121;
      swift_retain();
      id v125 = v117;
      id v126 = v118;
      swift_release();
      dispatch_sync(v119, v123);

      _Block_release(v123);
      LOBYTE(v110) = swift_isEscapingClosureAtFileLocation();
      swift_release();
      if (v110)
      {
        __break(1u);
LABEL_74:
        __break(1u);
        goto LABEL_75;
      }
      uint64_t v127 = v241;

      swift_release();
      if (v127)
      {
        objc_msgSend(v115, sel_setDisplayImage_, v127);
      }
      id v128 = v115;
      id v129 = objc_msgSend(v107, sel_sharingStatusText);
      uint64_t v60 = v223;
      uint64_t v48 = v225;
      if (v129)
      {
        sub_25AF79640();

        id v129 = (id)sub_25AF79610();
        swift_bridgeObjectRelease();
      }
      id v103 = v234;
      unint64_t v104 = v233;
      objc_msgSend(v128, sel_setSubtitleString_, v129);

      goto LABEL_45;
    }
    if (v106 == v215)
    {
      (*v220)(v60, v48);
      id v130 = *v60;
      id v131 = objc_msgSend(*v60, sel_objectID);
      id v132 = objc_msgSend(v131, sel_urlRepresentation);

      uint64_t v133 = v229;
      sub_25AF78E80();

      sub_25AF78E70();
      (*v228)(v133, v230);
      id v134 = objc_msgSend(v130, sel_name);
      sub_25AF79640();

      id v135 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
      uint64_t v136 = (void *)sub_25AF79610();
      swift_bridgeObjectRelease();
      id v137 = (void *)sub_25AF79610();
      swift_bridgeObjectRelease();
      id v138 = objc_msgSend(v135, sel_initWithIdentifier_displayString_, v136, v137);

      id v216 = v130;
      id v139 = objc_msgSend(v130, sel_customContext);
      id v140 = objc_msgSend(v139, sel_badge);
      id v141 = objc_msgSend(v139, sel_color);
      uint64_t v142 = sub_25AF79070();
      sub_25AF72898(v142, (uint64_t)&v249);
      unint64_t v241 = 0;
      sub_25AF72854();
      uint64_t v143 = sub_25AF79830();
      id v144 = (void *)swift_allocObject();
      uint64_t v145 = v232;
      v144[2] = v232;
      v144[3] = v140;
      v144[4] = v141;
      sub_25AF72898((uint64_t)&v249, (uint64_t)(v144 + 5));
      v144[11] = &v241;
      uint64_t v146 = swift_allocObject();
      *(void *)(v146 + 16) = sub_25AF728F4;
      *(void *)(v146 + 24) = v144;
      uint64_t v239 = sub_25AF736B4;
      uint64_t v240 = v146;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v236 = 1107296256;
      uint64_t v237 = sub_25AF725A8;
      uint64_t v238 = &block_descriptor_38;
      id v147 = _Block_copy(&aBlock);
      uint64_t v148 = v145;
      swift_retain();
      id v149 = v140;
      id v150 = v141;
      swift_release();
      dispatch_sync((dispatch_queue_t)v143, v147);

      _Block_release(v147);
      LOBYTE(v143) = swift_isEscapingClosureAtFileLocation();
      swift_release();
      if (v143) {
        goto LABEL_74;
      }
      uint64_t v151 = v241;

      swift_release();
      if (v151)
      {
        objc_msgSend(v138, sel_setDisplayImage_, v151);
      }
      objc_msgSend(v138, sel_setSubtitleString_, 0);
      uint64_t v48 = v225;
      uint64_t v60 = v223;
      id v103 = v234;
      unint64_t v104 = v233;
      id v129 = v216;
LABEL_45:

      uint64_t v61 = v224;
      (*v217)(v224, v48);
      sub_25AF79AF0();
      sub_25AF79B20();
      sub_25AF79B30();
      sub_25AF79B00();
      unint64_t v102 = v104 + v226;
      uint64_t v100 = v103 - 1;
      if (!v100)
      {
        unint64_t v78 = v242;
        swift_bridgeObjectRelease();
        goto LABEL_59;
      }
      continue;
    }
    break;
  }
  sub_25AF79C70();
  __break(1u);
LABEL_79:
  uint64_t result = sub_25AF79C70();
  __break(1u);
  return result;
}

BOOL sub_25AF71128(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_25AF79640();
  uint64_t v5 = v4;
  if (v3 == sub_25AF79640() && v5 == v6) {
    goto LABEL_14;
  }
  char v8 = sub_25AF79C80();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v8) {
    return 1;
  }
  uint64_t v10 = sub_25AF79640();
  uint64_t v12 = v11;
  if (v10 == sub_25AF79640() && v12 == v13)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_16;
  }
  char v15 = sub_25AF79C80();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v15)
  {
LABEL_16:
    uint64_t v20 = (void *)sub_25AF791F0();
    return (*v20 & ~a2) == 0;
  }
  uint64_t v16 = sub_25AF79640();
  uint64_t v18 = v17;
  if (v16 == sub_25AF79640() && v18 == v19)
  {
LABEL_14:
    swift_bridgeObjectRelease_n();
    return 1;
  }
  char v21 = sub_25AF79C80();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v21) {
    return 1;
  }
  uint64_t v22 = sub_25AF79640();
  uint64_t v24 = v23;
  if (v22 == sub_25AF79640() && v24 == v25) {
    goto LABEL_22;
  }
  char v26 = sub_25AF79C80();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  BOOL result = 0;
  if ((v26 & 1) == 0)
  {
    uint64_t v27 = sub_25AF79640();
    uint64_t v29 = v28;
    if (v27 == sub_25AF79640() && v29 == v30)
    {
      swift_bridgeObjectRelease_n();
LABEL_29:
      uint64_t v20 = (void *)sub_25AF79200();
      return (*v20 & ~a2) == 0;
    }
    char v31 = sub_25AF79C80();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v31) {
      goto LABEL_29;
    }
    uint64_t v32 = sub_25AF79640();
    uint64_t v34 = v33;
    if (v32 == sub_25AF79640() && v34 == v35)
    {
LABEL_22:
      swift_bridgeObjectRelease_n();
      return 0;
    }
    char v36 = sub_25AF79C80();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    BOOL result = 0;
    if ((v36 & 1) == 0)
    {
      uint64_t v37 = sub_25AF79640();
      uint64_t v39 = v38;
      if (v37 != sub_25AF79640() || v39 != v40)
      {
        sub_25AF79C80();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return 0;
      }
      goto LABEL_22;
    }
  }
  return result;
}

id sub_25AF71488(void *a1)
{
  uint64_t v2 = sub_25AF78E90();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D6220);
  MEMORY[0x270FA5388](v6 - 8);
  char v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = a1;
  sub_25AF793B0();
  uint64_t v10 = sub_25AF793A0();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) == 1)
  {
    sub_25AF54EBC((uint64_t)v8, &qword_26A4D6220);
    uint64_t v12 = 0;
  }
  else
  {
    sub_25AF79390();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
    sub_25AF78E70();
    uint64_t v12 = v13;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  sub_25AF79820();
  if (v12)
  {
    uint64_t v14 = (void *)sub_25AF79610();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v14 = 0;
  }
  sub_25AF79270();
  id v15 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v16 = (void *)sub_25AF79610();
  swift_bridgeObjectRelease();
  id v17 = objc_msgSend(v15, sel_initWithIdentifier_displayString_, v14, v16);

  uint64_t v18 = sub_25AF71F48(v9);
  if (v18)
  {
    uint64_t v19 = (void *)v18;
    objc_msgSend(v17, sel_setDisplayImage_, v18);
  }
  return v17;
}

id sub_25AF71724(void *a1)
{
  uint64_t v2 = sub_25AF78E90();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25AF79270();
  id v6 = objc_msgSend(a1, sel_objectID);
  id v7 = objc_msgSend(v6, sel_urlRepresentation);

  sub_25AF78E80();
  sub_25AF78E70();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  id v8 = objc_msgSend(a1, sel_displayName);
  sub_25AF79640();

  id v9 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v10 = (void *)sub_25AF79610();
  swift_bridgeObjectRelease();
  uint64_t v11 = (void *)sub_25AF79610();
  swift_bridgeObjectRelease();
  id v12 = objc_msgSend(v9, sel_initWithIdentifier_displayString_, v10, v11);

  id v13 = objc_msgSend(a1, sel_appearanceContext);
  id v14 = objc_msgSend(v13, sel_badge);

  id v15 = objc_msgSend(a1, sel_color);
  memset(v20, 0, sizeof(v20));
  uint64_t v21 = 0;
  char v22 = 2;
  uint64_t v16 = (void *)sub_25AF720D0(v14, v15, (uint64_t)v20);

  if (v16)
  {
    objc_msgSend(v12, sel_setDisplayImage_, v16);
  }
  id v17 = v12;
  id v18 = objc_msgSend(a1, sel_sharingStatusText);
  objc_msgSend(v17, sel_setSubtitleString_, v18);

  return v17;
}

uint64_t sub_25AF719D0(void *a1, uint64_t (*a2)(void, void *))
{
  if (qword_26A4D5940 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25AF795B0();
  __swift_project_value_buffer(v4, (uint64_t)qword_26A4D61E8);
  id v5 = a1;
  id v6 = a1;
  id v7 = sub_25AF795A0();
  os_log_type_t v8 = sub_25AF797B0();
  if (os_log_type_enabled(v7, v8))
  {
    id v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v14 = v10;
    *(_DWORD *)id v9 = 136315138;
    swift_getErrorValue();
    uint64_t v11 = sub_25AF79CA0();
    sub_25AF772F0(v11, v12, &v14);
    sub_25AF799C0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_25AF45000, v7, v8, "Widget provideListOptions failed error %s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x26115ACE0](v10, -1, -1);
    MEMORY[0x26115ACE0](v9, -1, -1);
  }
  else
  {
  }
  return a2(0, a1);
}

id sub_25AF71C90(void *a1)
{
  uint64_t v2 = v1;
  if (qword_26A4D5940 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25AF795B0();
  __swift_project_value_buffer(v4, (uint64_t)qword_26A4D61E8);
  id v5 = a1;
  id v6 = sub_25AF795A0();
  os_log_type_t v7 = sub_25AF797D0();
  if (os_log_type_enabled(v6, v7))
  {
    os_log_type_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v22 = v2;
    uint64_t v9 = swift_slowAlloc();
    uint64_t v23 = v9;
    *(_DWORD *)os_log_type_t v8 = 136315138;
    id v10 = v5;
    id v11 = objc_msgSend(v10, sel_description);
    uint64_t v12 = sub_25AF79640();
    unint64_t v14 = v13;

    sub_25AF772F0(v12, v14, &v23);
    sub_25AF799C0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25AF45000, v6, v7, "Widget defaultList {intent: %s}", v8, 0xCu);
    swift_arrayDestroy();
    uint64_t v15 = v9;
    uint64_t v2 = v22;
    MEMORY[0x26115ACE0](v15, -1, -1);
    MEMORY[0x26115ACE0](v8, -1, -1);
  }
  else
  {
  }
  uint64_t v16 = *(void *)(v2 + OBJC_IVAR____TtC25RemindersIntentsFramework26ConfigurationIntentHandler_dataSource + 24);
  uint64_t v17 = *(void *)(v2 + OBJC_IVAR____TtC25RemindersIntentsFramework26ConfigurationIntentHandler_dataSource + 32);
  __swift_project_boxed_opaque_existential_1((void *)(v2 + OBJC_IVAR____TtC25RemindersIntentsFramework26ConfigurationIntentHandler_dataSource), v16);
  id v18 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v17 + 72))(v16, v17);
  if (!v18) {
    return sub_25AF71488((void *)*MEMORY[0x263F63018]);
  }
  uint64_t v19 = v18;
  id v20 = sub_25AF71724(v18);

  return v20;
}

uint64_t sub_25AF71F48(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v13 = 0;
  sub_25AF72854();
  uint64_t v4 = sub_25AF79830();
  id v5 = (void *)swift_allocObject();
  v5[2] = a1;
  v5[3] = v2;
  v5[4] = &v13;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_25AF72AE0;
  *(void *)(v6 + 24) = v5;
  aBlock[4] = sub_25AF736B4;
  aBlock[5] = v6;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_25AF725A8;
  aBlock[3] = &block_descriptor_15;
  os_log_type_t v7 = _Block_copy(aBlock);
  id v8 = a1;
  id v9 = v2;
  swift_retain();
  swift_release();
  dispatch_sync((dispatch_queue_t)v4, v7);

  _Block_release(v7);
  LOBYTE(v4) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v4)
  {
    __break(1u);
  }
  else
  {
    uint64_t v11 = v13;
    swift_release();
    return v11;
  }
  return result;
}

uint64_t sub_25AF720D0(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v18 = 0;
  sub_25AF72854();
  uint64_t v8 = sub_25AF79830();
  id v9 = (void *)swift_allocObject();
  v9[2] = v4;
  v9[3] = a1;
  v9[4] = a2;
  sub_25AF72898(a3, (uint64_t)(v9 + 5));
  v9[11] = &v18;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = sub_25AF728F4;
  *(void *)(v10 + 24) = v9;
  aBlock[4] = sub_25AF72908;
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_25AF725A8;
  aBlock[3] = &block_descriptor_2;
  uint64_t v11 = _Block_copy(aBlock);
  id v12 = a2;
  swift_retain();
  id v13 = v4;
  id v14 = a1;
  swift_release();
  dispatch_sync((dispatch_queue_t)v8, v11);

  _Block_release(v11);
  LOBYTE(v8) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v8)
  {
    __break(1u);
  }
  else
  {
    uint64_t v16 = v18;
    swift_release();
    return v16;
  }
  return result;
}

void sub_25AF72274(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, id *a5)
{
  id v9 = objc_msgSend(objc_allocWithZone((Class)sub_25AF79080()), sel_initWithFrame_, 0.0, 0.0, 32.0, 32.0);
  uint64_t v10 = (void *)MEMORY[0x263F8EED0];
  if (!a2) {
    goto LABEL_7;
  }
  id v11 = objc_msgSend(a2, sel_emoji);
  if (!v11)
  {
    id v20 = objc_msgSend(a2, sel_emblem);
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = sub_25AF79840();

      goto LABEL_8;
    }
LABEL_7:
    uint64_t v22 = sub_25AF79840();
LABEL_8:
    (*(void (**)(uint64_t))((*v10 & *v9) + 0x140))(v22);
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  id v12 = v11;
  uint64_t v13 = sub_25AF79640();
  uint64_t v15 = v14;

  uint64_t v16 = (*(uint64_t (**)(uint64_t, uint64_t))((*v10 & *v9) + 0x158))(v13, v15);
  (*(void (**)(uint64_t, double))((*v10 & *v9) + 0x170))(v16, 20.0);
  if (!a3)
  {
LABEL_4:
    uint64_t v17 = v9;
    uint64_t v18 = sub_25AF79010();
    swift_beginAccess();
    sub_25AF72948(v18, (uint64_t)v29);
    sub_25AF72A00((uint64_t)v29, (void (*)(void, void, void, void, void, void, void))sub_25AF729A4);
    uint64_t v19 = (void *)sub_25AF79020();
    sub_25AF72A00((uint64_t)v29, (void (*)(void, void, void, void, void, void, void))sub_25AF72A44);
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v23 = v9;
  uint64_t v19 = (void *)sub_25AF79990();
LABEL_10:
  objc_msgSend(v9, sel_setTintColor_, v19);

  (*(void (**)(uint64_t))((*v10 & *v9) + 0x110))(a4);
  sub_25AF79920();
  objc_msgSend(v9, sel_layoutIfNeeded);
  uint64_t v24 = sub_25AF79910();
  if (v24)
  {
    uint64_t v25 = (void *)v24;
    id v26 = objc_msgSend(self, sel_imageWithUIImage_, v24);
    id v27 = *a5;
    *a5 = v26;

    if (*a5)
    {
      id v28 = *a5;
      objc_msgSend(v28, sel__setRenderingMode_, 1);
    }
    id v9 = v25;
  }
}

uint64_t sub_25AF725A8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

void sub_25AF725D0(uint64_t a1, uint64_t a2, id *a3)
{
  uint64_t v4 = sub_25AF79810();
  if (v4)
  {
    id v5 = (void *)v4;
    uint64_t v6 = sub_25AF79800();
    if (v6)
    {
      os_log_type_t v7 = (void *)v6;
      uint64_t v8 = objc_msgSend(objc_allocWithZone((Class)sub_25AF79080()), sel_initWithFrame_, 0.0, 0.0, 32.0, 32.0);
      id v9 = *(void (**)(void *))((*MEMORY[0x263F8EED0] & *v8) + 0x140);
      id v16 = v5;
      v9(v5);
      objc_msgSend(v8, sel_setTintColor_, v7);
      uint64_t v10 = sub_25AF79910();
      if (v10)
      {
        id v11 = (void *)v10;
        id v12 = objc_msgSend(self, sel_imageWithUIImage_, v10);
        id v13 = *a3;
        *a3 = v12;

        if (*a3)
        {
          id v14 = *a3;
          objc_msgSend(v14, sel__setRenderingMode_, 1);
        }
      }
      else
      {
        id v11 = v16;
        id v16 = v8;
      }

      uint64_t v15 = v16;
    }
    else
    {
      uint64_t v15 = v5;
    }
  }
}

id sub_25AF7279C()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ConfigurationIntentHandler()
{
  return self;
}

unint64_t sub_25AF72854()
{
  unint64_t result = qword_26A4D5950;
  if (!qword_26A4D5950)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A4D5950);
  }
  return result;
}

uint64_t sub_25AF72898(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_25AF728F8()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25AF72908()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
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

uint64_t sub_25AF72948(uint64_t a1, uint64_t a2)
{
  return a2;
}

id sub_25AF729A4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  if (a7)
  {
    return a1;
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return (id)swift_bridgeObjectRetain();
  }
}

uint64_t sub_25AF72A00(uint64_t a1, void (*a2)(void, void, void, void, void, void, void))
{
  return a1;
}

void sub_25AF72A44(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  if (a7)
  {
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_25AF72AA0()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_25AF72AE0()
{
  sub_25AF725D0(*(void *)(v0 + 16), *(void *)(v0 + 24), *(id **)(v0 + 32));
}

uint64_t sub_25AF72AEC()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25AF72AFC()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_25AF72B34(uint64_t a1, uint64_t a2)
{
  sub_25AF6F378(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_25AF72B3C()
{
  swift_release();

  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_25AF72B84(uint64_t a1, uint64_t a2)
{
  return sub_25AF6F3E8(a1, a2, *(uint64_t (**)(id, void))(v2 + 16), *(void *)(v2 + 24), *(char **)(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 48));
}

uint64_t sub_25AF72B94()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25AF72BCC(char *a1)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t, char *))(v1 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D6230);
  return v3(v4, &a1[*(int *)(v5 + 48)]);
}

uint64_t sub_25AF72C2C(void *a1)
{
  return sub_25AF719D0(a1, *(uint64_t (**)(void, void *))(v1 + 16));
}

uint64_t sub_25AF72C34(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5E80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25AF72C9C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25AF72CDC(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_25AF72CBC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25AF72E48(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_25AF72CDC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D6248);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  id v13 = v10 + 32;
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
  uint64_t result = sub_25AF79C30();
  __break(1u);
  return result;
}

uint64_t sub_25AF72E48(char a1, int64_t a2, char a3, void *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5E78);
    uint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
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
    type metadata accessor for REMSmartListType(0);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_25AF79C30();
  __break(1u);
  return result;
}

uint64_t sub_25AF72FD0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = MEMORY[0x263F8EE78];
  if (v2)
  {
    uint64_t v7 = MEMORY[0x263F8EE78];
    sub_25AF79B10();
    uint64_t v4 = (void **)(a1 + 32);
    do
    {
      uint64_t v5 = *v4++;
      id v6 = v5;
      sub_25AF71488(v6);

      sub_25AF79AF0();
      sub_25AF79B20();
      sub_25AF79B30();
      sub_25AF79B00();
      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

uint64_t sub_25AF73098()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25AF730A8(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v24 = a2;
  uint64_t v25 = a3;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D6240);
  v7.n128_f64[0] = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_16;
  }
  uint64_t v10 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v10)
  {
    while (1)
    {
      unint64_t v11 = 0;
      unint64_t v23 = a1 & 0xC000000000000001;
      v21[1] = v4;
      uint64_t v22 = a1 & 0xFFFFFFFFFFFFFF8;
      while (v23)
      {
        id v12 = (id)MEMORY[0x26115A540](v11, a1, v7);
LABEL_9:
        uint64_t v4 = v12;
        unint64_t v13 = v11 + 1;
        if (__OFADD__(v11, 1)) {
          goto LABEL_15;
        }
        id v14 = objc_msgSend(v12, sel_displayString);
        uint64_t v15 = sub_25AF79640();
        uint64_t v17 = v16;

        uint64_t v28 = v15;
        uint64_t v29 = v17;
        uint64_t v26 = v24;
        uint64_t v27 = v25;
        uint64_t v18 = sub_25AF78F70();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v9, 1, 1, v18);
        sub_25AF6EC94();
        sub_25AF799F0();
        LOBYTE(v14) = v19;
        sub_25AF54EBC((uint64_t)v9, &qword_26A4D6240);
        swift_bridgeObjectRelease();
        if (v14)
        {
        }
        else
        {
          sub_25AF79AF0();
          sub_25AF79B20();
          sub_25AF79B30();
          sub_25AF79B00();
        }
        ++v11;
        if (v13 == v10) {
          return v30;
        }
      }
      if (v11 < *(void *)(v22 + 16)) {
        break;
      }
      __break(1u);
LABEL_15:
      __break(1u);
LABEL_16:
      uint64_t v10 = sub_25AF79C10();
      if (!v10) {
        return MEMORY[0x263F8EE78];
      }
    }
    id v12 = *(id *)(a1 + 8 * v11 + 32);
    goto LABEL_9;
  }
  return MEMORY[0x263F8EE78];
}

uint64_t objectdestroyTm()
{
  return MEMORY[0x270FA0238](v0, 96, 7);
}

void sub_25AF7334C()
{
  sub_25AF72274(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void *)(v0 + 32), v0 + 40, *(id **)(v0 + 88));
}

uint64_t sub_25AF73360()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_25AF73374(void *a1, uint64_t a2)
{
  sub_25AF794F0();
  uint64_t v4 = (void *)sub_25AF794E0();
  id v5 = objc_msgSend(a1, sel_list);
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = objc_msgSend(v5, sel_identifier);

    if (v7)
    {
      sub_25AF79640();

      uint64_t v6 = (void *)sub_25AF79610();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  objc_msgSend(v4, sel_setList_, v6);

  if (qword_26A4D5940 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_25AF795B0();
  __swift_project_value_buffer(v8, (uint64_t)qword_26A4D61E8);
  id v9 = a1;
  id v10 = v4;
  id v11 = v9;
  id v12 = v10;
  unint64_t v13 = sub_25AF795A0();
  os_log_type_t v14 = sub_25AF797D0();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    uint64_t v28 = v26;
    *(_DWORD *)uint64_t v15 = 136315394;
    id v16 = v11;
    id v17 = objc_msgSend(v16, sel_description);
    uint64_t v18 = sub_25AF79640();
    uint64_t v27 = a2;
    unint64_t v20 = v19;

    sub_25AF772F0(v18, v20, &v28);
    sub_25AF799C0();

    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 2080;
    id v21 = v12;
    id v22 = objc_msgSend(v21, sel_description);
    uint64_t v23 = sub_25AF79640();
    unint64_t v25 = v24;

    sub_25AF772F0(v23, v25, &v28);
    a2 = v27;
    sub_25AF799C0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25AF45000, v13, v14, "Widget handle {intent: %s, response: %s}", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x26115ACE0](v26, -1, -1);
    MEMORY[0x26115ACE0](v15, -1, -1);
  }
  else
  {
  }
  (*(void (**)(uint64_t, id))(a2 + 16))(a2, v12);
}

uint64_t sub_25AF736D8(void (*a1)(uint64_t *__return_ptr, id *), uint64_t a2, unint64_t a3)
{
  if (a3 >> 62) {
    goto LABEL_16;
  }
  uint64_t v6 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t result = MEMORY[0x263F8EE78];
    if (!v6) {
      break;
    }
    uint64_t v13 = MEMORY[0x263F8EE78];
    uint64_t result = sub_25AF79B10();
    if (v6 < 0)
    {
      __break(1u);
      return result;
    }
    uint64_t v8 = 0;
    while (v6 != v8)
    {
      if ((a3 & 0xC000000000000001) != 0) {
        id v9 = (id)MEMORY[0x26115A540](v8, a3);
      }
      else {
        id v9 = *(id *)(a3 + 8 * v8 + 32);
      }
      id v10 = v9;
      id v11 = v9;
      a1(&v12, &v11);

      if (v3) {
        return swift_release();
      }
      ++v8;
      sub_25AF79AF0();
      sub_25AF79B20();
      sub_25AF79B30();
      sub_25AF79B00();
      if (v6 == v8) {
        return v13;
      }
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_25AF79C10();
    swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25AF73848(void (*a1)(uint64_t *__return_ptr, uint64_t), uint64_t a2, uint64_t a3)
{
  return sub_25AF73860(a1, a2, a3);
}

uint64_t sub_25AF73860(void (*a1)(uint64_t *__return_ptr, uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = *(void *)(a3 + 16);
  uint64_t result = MEMORY[0x263F8EE78];
  if (v6)
  {
    uint64_t v13 = MEMORY[0x263F8EE78];
    sub_25AF79B10();
    uint64_t v9 = *(void *)(sub_25AF792A0() - 8);
    uint64_t v10 = a3 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v11 = *(void *)(v9 + 72);
    while (1)
    {
      a1(&v12, v10);
      if (v4) {
        break;
      }
      uint64_t v4 = 0;
      sub_25AF79AF0();
      sub_25AF79B20();
      sub_25AF79B30();
      sub_25AF79B00();
      v10 += v11;
      if (!--v6) {
        return v13;
      }
    }
    return swift_release();
  }
  return result;
}

void sub_25AF739A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25AF739DC(a1, a2, a3, (void (*)(uint64_t *__return_ptr, uint64_t))sub_25AF78CF4);
}

void sub_25AF739DC(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t *__return_ptr, uint64_t))
{
  v9[2] = &v10;
  uint64_t v6 = sub_25AF73860(a4, (uint64_t)v9, a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D6268);
  v9[4] = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D6270);
  sub_25AF78560();
  sub_25AF79520();
  swift_bridgeObjectRelease();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  swift_retain();
  uint64_t v8 = (void *)sub_25AF79500();
  sub_25AF79540();
  swift_release();
  swift_release();
  swift_release();
}

uint64_t sub_25AF73AF0()
{
  uint64_t v0 = sub_25AF795B0();
  __swift_allocate_value_buffer(v0, qword_26A4D6250);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_26A4D6250);
  if (qword_26A4D5900 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_26A4D6660);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

void sub_25AF73BB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_25AF792A0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v57 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  os_log_type_t v14 = (char *)&v57 - v13;
  uint64_t v15 = *(void *)(a1 + 16);
  if (v15)
  {
    uint64_t v59 = v4;
    uint64_t v60 = a2;
    uint64_t v62 = a3;
    uint64_t v58 = v9;
    uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
    uint64_t v17 = v9 + 16;
    id v16 = v18;
    uint64_t v19 = a1 + ((*(unsigned __int8 *)(v17 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 64));
    int v64 = *MEMORY[0x263F63110];
    unint64_t v20 = (void (**)(char *, uint64_t))(v17 - 8);
    uint64_t v63 = *(void *)(v17 + 56);
    uint64_t v61 = a1;
    swift_bridgeObjectRetain();
    while (1)
    {
      v16(v14, v19, v8);
      v16(v11, (uint64_t)v14, v8);
      int v21 = (*(uint64_t (**)(char *, uint64_t))(v17 + 72))(v11, v8);
      if (v21 == v64) {
        break;
      }
      id v22 = *v20;
      (*v20)(v11, v8);
      v22(v14, v8);
      v19 += v63;
      if (!--v15)
      {
        a1 = v61;
        swift_bridgeObjectRelease();
        a3 = v62;
        uint64_t v4 = v59;
        a2 = v60;
        goto LABEL_6;
      }
    }
    uint64_t v30 = v58 + 96;
    (*(void (**)(char *, uint64_t))(v58 + 96))(v11, v8);
    swift_bridgeObjectRelease();
    char v31 = &v11[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A4D6020) + 48)];
    uint64_t v32 = sub_25AF793C0();
    (*(void (**)(char *, uint64_t))(*(void *)(v32 - 8) + 8))(v31, v32);
    (*(void (**)(char *, uint64_t))(v30 - 88))(v14, v8);
    uint64_t v33 = v61;
    swift_bridgeObjectRelease();
    if (qword_26A4D5948 != -1) {
      swift_once();
    }
    uint64_t v34 = sub_25AF795B0();
    __swift_project_value_buffer(v34, (uint64_t)qword_26A4D6250);
    swift_bridgeObjectRetain_n();
    uint64_t v35 = sub_25AF795A0();
    os_log_type_t v36 = sub_25AF797D0();
    BOOL v37 = os_log_type_enabled(v35, v36);
    uint64_t v38 = v59;
    if (v37)
    {
      uint64_t v39 = (uint8_t *)swift_slowAlloc();
      uint64_t v40 = swift_slowAlloc();
      uint64_t v66 = v40;
      *(_DWORD *)uint64_t v39 = 136315138;
      uint64_t v41 = swift_bridgeObjectRetain();
      uint64_t v42 = MEMORY[0x26115A160](v41, v8);
      unint64_t v44 = v43;
      swift_bridgeObjectRelease();
      uint64_t v65 = sub_25AF772F0(v42, v44, &v66);
      sub_25AF799C0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25AF45000, v35, v36, "Querying Spotlight for reminders {criteria: %s}", v39, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x26115ACE0](v40, -1, -1);
      MEMORY[0x26115ACE0](v39, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v45 = v33;
    sub_25AF791E0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D6280);
    uint64_t v46 = sub_25AF792C0();
    uint64_t v47 = *(void *)(v46 - 8);
    unint64_t v48 = (*(unsigned __int8 *)(v47 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v47 + 80);
    uint64_t v49 = swift_allocObject();
    *(_OWORD *)(v49 + 16) = xmmword_25AF7A830;
    (*(void (**)(unint64_t, void, uint64_t))(v47 + 104))(v49 + v48, *MEMORY[0x263F63170], v46);
    sub_25AF48D94(0, (unint64_t *)&qword_26A4D5950);
    uint64_t v50 = (void *)sub_25AF79830();
    sub_25AF791D0();
    swift_bridgeObjectRelease();

    uint64_t v51 = (void *)swift_allocObject();
    v51[2] = v45;
    v51[3] = v38;
    uint64_t v52 = v60;
    uint64_t v53 = v62;
    v51[4] = v60;
    v51[5] = v53;
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    uint64_t v54 = (void *)sub_25AF79500();
    sub_25AF79540();
    swift_release();
    swift_release();

    unint64_t v55 = (void *)swift_allocObject();
    v55[2] = v45;
    v55[3] = v52;
    v55[4] = v53;
    swift_bridgeObjectRetain();
    swift_retain();
    unint64_t v56 = (void *)sub_25AF79500();
    sub_25AF79550();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
LABEL_6:
    if (qword_26A4D5948 != -1) {
      swift_once();
    }
    uint64_t v23 = sub_25AF795B0();
    __swift_project_value_buffer(v23, (uint64_t)qword_26A4D6250);
    unint64_t v24 = sub_25AF795A0();
    os_log_type_t v25 = sub_25AF797D0();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v26 = 0;
      _os_log_impl(&dword_25AF45000, v24, v25, "Criteria does not contain a text search, using fallback data source", v26, 2u);
      MEMORY[0x26115ACE0](v26, -1, -1);
    }

    uint64_t v27 = v4 + 4;
    uint64_t v29 = v4[7];
    uint64_t v28 = v4[8];
    __swift_project_boxed_opaque_existential_1(v27, v29);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v28 + 24))(a1, a2, a3, v29, v28);
  }
}

uint64_t sub_25AF742B4(uint64_t a1, uint64_t a2, void *a3, void (*a4)(unint64_t), uint64_t a5)
{
  id v132 = a4;
  id v134 = a3;
  v140[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v8 = sub_25AF79290();
  uint64_t v124 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v113 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v119 = (char *)&v113 - v12;
  MEMORY[0x270FA5388](v13);
  uint64_t v120 = (char *)&v113 - v14;
  uint64_t v15 = sub_25AF792A0();
  uint64_t v129 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v122 = (void **)((char *)&v113 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v17);
  uint64_t v127 = (id *)((char *)&v113 - v18);
  MEMORY[0x270FA5388](v19);
  id v128 = (uint8_t *)&v113 - v20;
  MEMORY[0x270FA5388](v21);
  uint64_t v121 = (uint8_t *)&v113 - v22;
  MEMORY[0x270FA5388](v23);
  uint64_t v123 = (char *)&v113 - v24;
  unint64_t v25 = swift_bridgeObjectRetain();
  uint64_t v26 = sub_25AF77A84(v25);
  swift_bridgeObjectRelease();
  if (qword_26A4D5948 != -1) {
    swift_once();
  }
  uint64_t v27 = sub_25AF795B0();
  uint64_t v28 = __swift_project_value_buffer(v27, (uint64_t)qword_26A4D6250);
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v126 = v28;
  uint64_t v29 = sub_25AF795A0();
  int v30 = sub_25AF797D0();
  BOOL v31 = os_log_type_enabled(v29, (os_log_type_t)v30);
  id v118 = v10;
  uint64_t v130 = a5;
  uint64_t v131 = v5;
  uint64_t v125 = v8;
  uint64_t v133 = v15;
  if (v31)
  {
    LODWORD(v138) = v30;
    uint64_t v32 = swift_slowAlloc();
    uint64_t v33 = (void *)swift_slowAlloc();
    v140[0] = v33;
    *(_DWORD *)uint64_t v32 = 134218498;
    id v137 = v33;
    if (v26 < 0 || (v26 & 0x4000000000000000) != 0)
    {
      uint64_t v34 = v29;
      swift_bridgeObjectRetain();
      uint64_t v35 = sub_25AF79C10();
      swift_release();
    }
    else
    {
      uint64_t v34 = v29;
      uint64_t v35 = *(void *)(v26 + 16);
    }
    swift_release();
    uint64_t v139 = v35;
    sub_25AF799C0();
    swift_release();
    *(_WORD *)(v32 + 12) = 2080;
    uint64_t v36 = swift_bridgeObjectRetain();
    uint64_t v37 = MEMORY[0x26115A160](v36, v133);
    unint64_t v39 = v38;
    swift_bridgeObjectRelease();
    uint64_t v139 = sub_25AF772F0(v37, v39, (uint64_t *)v140);
    sub_25AF799C0();
    uint64_t v40 = a2;
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v32 + 22) = 2080;
    uint64_t v41 = sub_25AF48D94(0, &qword_26A4D5E48);
    uint64_t v42 = swift_bridgeObjectRetain();
    uint64_t v43 = MEMORY[0x26115A160](v42, v41);
    unint64_t v45 = v44;
    swift_release();
    uint64_t v139 = sub_25AF772F0(v43, v45, (uint64_t *)v140);
    sub_25AF799C0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25AF45000, v34, (os_log_type_t)v138, "Got %ld reminders from Spotlight {criteria: %s, reminderIDs: %s}", (uint8_t *)v32, 0x20u);
    id v46 = v137;
    swift_arrayDestroy();
    MEMORY[0x26115ACE0](v46, -1, -1);
    MEMORY[0x26115ACE0](v32, -1, -1);
  }
  else
  {

    uint64_t v40 = a2;
    swift_bridgeObjectRelease_n();
    swift_release_n();
  }
  uint64_t v47 = (void *)v134[2];
  sub_25AF48D94(0, &qword_26A4D5E48);
  unint64_t v48 = (void *)sub_25AF796C0();
  swift_release();
  v140[0] = 0;
  id v49 = objc_msgSend(v47, sel_fetchRemindersWithObjectIDs_error_, v48, v140);

  id v50 = v140[0];
  if (!v49)
  {
    id v68 = v140[0];
    sub_25AF78E60();

    return swift_willThrow();
  }
  sub_25AF48D94(0, &qword_26A4D60C0);
  sub_25AF5D96C();
  unint64_t v51 = sub_25AF795D0();
  id v52 = v50;

  unint64_t v53 = sub_25AF77970(v51, &qword_26A4D60C0);
  swift_bridgeObjectRelease();
  uint64_t v54 = v40;
  uint64_t v55 = *(void *)(v40 + 16);
  if (v55)
  {
    unint64_t v116 = v53;
    id v138 = *(void (**)(id *, uint8_t *, uint64_t))(v129 + 16);
    unint64_t v56 = (uint8_t *)(v40
                    + ((*(unsigned __int8 *)(v129 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v129 + 80)));
    uint64_t v57 = (uint64_t (**)(id *, uint64_t))(v129 + 88);
    LODWORD(v137) = *MEMORY[0x263F63120];
    id v135 = *(void (**)(char *, uint64_t))(v129 + 72);
    uint64_t v136 = (void (**)(char *, uint64_t))(v129 + 8);
    uint64_t v117 = v40;
    swift_bridgeObjectRetain();
    uint64_t v58 = v133;
    uint64_t v60 = v127;
    uint64_t v59 = v128;
    uint64_t v61 = (void (**)(id *, uint64_t))v136;
    while (1)
    {
      uint64_t v62 = v138;
      v138((id *)v59, v56, v58);
      v62(v60, v59, v58);
      uint64_t v63 = *v57;
      int v64 = (*v57)(v60, v58);
      if (v64 == v137) {
        break;
      }
      uint64_t v65 = *v61;
      (*v61)(v60, v58);
      v65((id *)v59, v58);
      unint64_t v56 = (uint8_t *)v135 + (void)v56;
      if (!--v55)
      {
        uint64_t v54 = v117;
        swift_bridgeObjectRelease();
        uint64_t v66 = v130;
        uint64_t v67 = v132;
LABEL_27:
        unint64_t v53 = v116;
        goto LABEL_28;
      }
    }
    uint64_t v70 = v129;
    unint64_t v71 = *(void (**)(void **, uint64_t))(v129 + 96);
    uint64_t v115 = v129 + 96;
    uint64_t v114 = v71;
    v71(v60, v58);

    uint64_t v113 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D6048);
    uint64_t v72 = (char *)v60 + *(int *)(v113 + 48);
    uint64_t v73 = (void (*)(id *, uint8_t *, uint64_t))(v124 + 8);
    id v135 = *(void (**)(char *, uint64_t))(v124 + 8);
    v135(v72, v125);
    swift_bridgeObjectRelease();
    unint64_t v74 = *(void (**)(char *, uint8_t *, uint64_t))(v70 + 32);
    uint64_t v75 = v121;
    v74((char *)v121, v59, v58);
    uint64_t v76 = v123;
    v74(v123, v75, v58);
    uint64_t v77 = v122;
    v138(v122, (uint8_t *)v76, v58);
    int v78 = v63(v77, v58);
    if (v78 != v137)
    {
      id v93 = v77;
      id v94 = *v136;
      (*v136)(v76, v58);
      v94((char *)v93, v58);
      uint64_t v66 = v130;
      uint64_t v67 = v132;
      uint64_t v54 = v117;
      goto LABEL_27;
    }
    v114(v77, v58);
    uint64_t v79 = *v77;
    uint64_t v80 = v124;
    uint64_t v81 = v125;
    uint64_t v82 = v120;
    (*(void (**)(char *, char *, uint64_t))(v124 + 32))(v120, (char *)v77 + *(int *)(v113 + 48), v125);
    int v83 = v119;
    (*(void (**)(char *, void, uint64_t))(v80 + 104))(v119, *MEMORY[0x263F63148], v81);
    char v84 = sub_25AF79280();
    uint64_t v85 = v83;
    id v138 = v73;
    id v86 = v135;
    v135(v85, v81);
    uint64_t v67 = v132;
    if ((v84 & 1) == 0)
    {
      id v95 = v86;
      id v137 = v79;
      id v96 = v118;
      (*(void (**)(char *, char *, uint64_t))(v80 + 16))(v118, v82, v81);
      uint64_t v97 = sub_25AF795A0();
      uint64_t v98 = v82;
      os_log_type_t v99 = sub_25AF797C0();
      BOOL v100 = os_log_type_enabled(v97, v99);
      uint64_t v54 = v117;
      if (v100)
      {
        unint64_t v101 = (uint8_t *)swift_slowAlloc();
        uint64_t v129 = swift_slowAlloc();
        v140[0] = (id)v129;
        *(_DWORD *)unint64_t v101 = 136315138;
        uint64_t v127 = (id *)(v101 + 4);
        id v128 = v101;
        sub_25AF788A4();
        uint64_t v102 = sub_25AF79C50();
        uint64_t v139 = sub_25AF772F0(v102, v103, (uint64_t *)v140);
        sub_25AF799C0();
        swift_bridgeObjectRelease();
        v95(v96, v81);
        os_log_type_t v104 = v99;
        uint64_t v105 = v128;
        _os_log_impl(&dword_25AF45000, v97, v104, "Called with %s, but should only be .includeForSiri in TTRIntentsHandlerSpotlightDataSource.", v128, 0xCu);
        uint64_t v106 = v129;
        swift_arrayDestroy();
        MEMORY[0x26115ACE0](v106, -1, -1);
        MEMORY[0x26115ACE0](v105, -1, -1);

        v95(v120, v81);
        (*v136)(v123, v133);
      }
      else
      {

        v95(v96, v81);
        v95(v98, v81);
        (*v136)(v123, v58);
      }
      uint64_t v66 = v130;
      goto LABEL_27;
    }
    id v87 = sub_25AF795A0();
    os_log_type_t v88 = sub_25AF797D0();
    BOOL v89 = os_log_type_enabled(v87, v88);
    uint64_t v54 = v117;
    if (v89)
    {
      id v90 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v90 = 0;
      _os_log_impl(&dword_25AF45000, v87, v88, "Criteria had list id, filtering further", v90, 2u);
      uint64_t v91 = v90;
      uint64_t v82 = v120;
      MEMORY[0x26115ACE0](v91, -1, -1);
    }

    id v92 = v79;
    unint64_t v53 = sub_25AF78B4C(v116);
    swift_release();

    v135(v82, v81);
    (*v136)(v123, v58);

    uint64_t v66 = v130;
  }
  else
  {
    uint64_t v67 = v132;
    uint64_t v66 = v130;
  }
LABEL_28:
  if (v53 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v107 = sub_25AF79C10();
    swift_bridgeObjectRelease();
    if (v107) {
      goto LABEL_30;
    }
  }
  else if (*(void *)((v53 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_30:
    v67(v53);
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  id v108 = sub_25AF795A0();
  os_log_type_t v109 = sub_25AF797D0();
  if (os_log_type_enabled(v108, v109))
  {
    uint64_t v110 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v110 = 0;
    _os_log_impl(&dword_25AF45000, v108, v109, "Consulting fallbackDataSource since Spotlight result is empty.", v110, 2u);
    MEMORY[0x26115ACE0](v110, -1, -1);
  }

  uint64_t v111 = v134[7];
  uint64_t v112 = v134[8];
  __swift_project_boxed_opaque_existential_1(v134 + 4, v111);
  return (*(uint64_t (**)(uint64_t, void (*)(unint64_t), uint64_t, uint64_t, uint64_t))(v112 + 24))(v54, v67, v66, v111, v112);
}

uint64_t sub_25AF75000(void *a1, uint64_t a2, uint64_t (*a3)(void))
{
  if (qword_26A4D5948 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_25AF795B0();
  __swift_project_value_buffer(v5, (uint64_t)qword_26A4D6250);
  swift_bridgeObjectRetain();
  id v6 = a1;
  swift_bridgeObjectRetain();
  id v7 = a1;
  uint64_t v8 = sub_25AF795A0();
  os_log_type_t v9 = sub_25AF797B0();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v21 = v11;
    *(_DWORD *)uint64_t v10 = 136315394;
    uint64_t v12 = sub_25AF792A0();
    uint64_t v13 = swift_bridgeObjectRetain();
    uint64_t v14 = MEMORY[0x26115A160](v13, v12);
    uint64_t v15 = a3;
    unint64_t v17 = v16;
    swift_bridgeObjectRelease();
    sub_25AF772F0(v14, v17, &v21);
    sub_25AF799C0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2080;
    swift_getErrorValue();
    uint64_t v18 = sub_25AF79CA0();
    sub_25AF772F0(v18, v19, &v21);
    a3 = v15;
    sub_25AF799C0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_25AF45000, v8, v9, "Error matching reminders from Spotlight {criteria: %s, error: %s}", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x26115ACE0](v11, -1, -1);
    MEMORY[0x26115ACE0](v10, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }
  return a3(MEMORY[0x263F8EE78]);
}

void sub_25AF75288(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  if (*(void *)(a1 + 16) < 2uLL)
  {
    if (qword_26A4D5948 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_25AF795B0();
    __swift_project_value_buffer(v10, (uint64_t)qword_26A4D6250);
    swift_bridgeObjectRetain_n();
    uint64_t v11 = sub_25AF795A0();
    os_log_type_t v12 = sub_25AF797D0();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      uint64_t v29 = v14;
      *(_DWORD *)uint64_t v13 = 136315138;
      uint64_t v15 = sub_25AF792A0();
      uint64_t v16 = swift_bridgeObjectRetain();
      uint64_t v17 = MEMORY[0x26115A160](v16, v15);
      unint64_t v19 = v18;
      swift_bridgeObjectRelease();
      sub_25AF772F0(v17, v19, &v29);
      sub_25AF799C0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25AF45000, v11, v12, "Querying Spotlight for lists {criteria: %s}", v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x26115ACE0](v14, -1, -1);
      MEMORY[0x26115ACE0](v13, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    sub_25AF791E0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D6280);
    uint64_t v20 = sub_25AF792C0();
    uint64_t v21 = *(void *)(v20 - 8);
    unint64_t v22 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
    uint64_t v23 = swift_allocObject();
    *(_OWORD *)(v23 + 16) = xmmword_25AF7A830;
    (*(void (**)(unint64_t, void, uint64_t))(v21 + 104))(v23 + v22, *MEMORY[0x263F63168], v20);
    sub_25AF48D94(0, (unint64_t *)&qword_26A4D5950);
    uint64_t v24 = (void *)sub_25AF79830();
    sub_25AF791D0();
    swift_bridgeObjectRelease();

    unint64_t v25 = (void *)swift_allocObject();
    v25[2] = a1;
    v25[3] = v4;
    v25[4] = a2;
    v25[5] = a3;
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t v26 = (void *)sub_25AF79500();
    sub_25AF79540();
    swift_release();
    swift_release();

    uint64_t v27 = (void *)swift_allocObject();
    v27[2] = a1;
    v27[3] = a2;
    v27[4] = a3;
    swift_retain();
    swift_bridgeObjectRetain();
    uint64_t v28 = (void *)sub_25AF79500();
    sub_25AF79550();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    uint64_t v8 = (void *)swift_allocObject();
    v8[2] = a2;
    v8[3] = a3;
    v8[4] = a1;
    swift_retain();
    uint64_t v9 = swift_bridgeObjectRetain();
    sub_25AF739DC(v9, (uint64_t)sub_25AF78780, (uint64_t)v8, (void (*)(uint64_t *__return_ptr, uint64_t))sub_25AF7852C);
    swift_release();
  }
}

uint64_t sub_25AF75730(unint64_t a1, uint64_t a2, void (*a3)(char *), uint64_t a4, uint64_t a5)
{
  uint64_t v8 = sub_25AF79330();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25AF6C480(a5, a1);
  swift_bridgeObjectRetain();
  sub_25AF79310();
  a3(v11);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_25AF75840(uint64_t a1, uint64_t a2, void *a3, void (*a4)(void), uint64_t a5)
{
  unint64_t v53 = a3;
  v55[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v9 = sub_25AF79330();
  uint64_t v51 = *(void *)(v9 - 8);
  uint64_t v52 = v9;
  MEMORY[0x270FA5388](v9);
  id v50 = (char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v11 = swift_bridgeObjectRetain();
  uint64_t v12 = sub_25AF77A84(v11);
  swift_bridgeObjectRelease();
  if (qword_26A4D5948 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_25AF795B0();
  uint64_t v14 = __swift_project_value_buffer(v13, (uint64_t)qword_26A4D6250);
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v49 = v14;
  uint64_t v15 = sub_25AF795A0();
  os_log_type_t v16 = sub_25AF797D0();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    unint64_t v45 = (void *)swift_slowAlloc();
    v55[0] = v45;
    *(_DWORD *)uint64_t v17 = 134218498;
    uint64_t v47 = a5;
    uint64_t v48 = v5;
    id v46 = a4;
    if (v12 < 0 || (v12 & 0x4000000000000000) != 0)
    {
      uint64_t v18 = a2;
      swift_bridgeObjectRetain();
      uint64_t v19 = sub_25AF79C10();
      swift_release();
    }
    else
    {
      uint64_t v18 = a2;
      uint64_t v19 = *(void *)(v12 + 16);
    }
    swift_release();
    uint64_t v54 = v19;
    sub_25AF799C0();
    swift_release();
    *(_WORD *)(v17 + 12) = 2080;
    uint64_t v20 = sub_25AF792A0();
    uint64_t v21 = swift_bridgeObjectRetain();
    uint64_t v22 = MEMORY[0x26115A160](v21, v20);
    unint64_t v24 = v23;
    swift_bridgeObjectRelease();
    uint64_t v54 = sub_25AF772F0(v22, v24, (uint64_t *)v55);
    sub_25AF799C0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 22) = 2080;
    uint64_t v25 = sub_25AF48D94(0, &qword_26A4D5E48);
    uint64_t v26 = swift_bridgeObjectRetain();
    uint64_t v27 = MEMORY[0x26115A160](v26, v25);
    unint64_t v29 = v28;
    swift_release();
    uint64_t v54 = sub_25AF772F0(v27, v29, (uint64_t *)v55);
    sub_25AF799C0();
    swift_release_n();
    a2 = v18;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25AF45000, v15, v16, "Got %ld lists from Spotlight {criteria: %s, listIDs: %s}", (uint8_t *)v17, 0x20u);
    int v30 = v45;
    swift_arrayDestroy();
    MEMORY[0x26115ACE0](v30, -1, -1);
    MEMORY[0x26115ACE0](v17, -1, -1);

    a5 = v47;
    a4 = v46;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release_n();
  }
  BOOL v31 = (void *)v53[2];
  sub_25AF48D94(0, &qword_26A4D5E48);
  uint64_t v32 = (void *)sub_25AF796C0();
  swift_release();
  v55[0] = 0;
  id v33 = objc_msgSend(v31, sel_fetchListsWithObjectIDs_error_, v32, v55);

  id v34 = v55[0];
  if (v33)
  {
    sub_25AF48D94(0, (unint64_t *)&qword_26A4D5B40);
    sub_25AF5D96C();
    unint64_t v35 = sub_25AF795D0();
    id v36 = v34;

    if ((v35 & 0xC000000000000001) != 0)
    {
      if (sub_25AF79A30())
      {
LABEL_12:
        sub_25AF77970(v35, (unint64_t *)&qword_26A4D5B40);
        swift_bridgeObjectRelease();
        uint64_t v37 = v50;
        sub_25AF79310();
        a4(v37);
        return (*(uint64_t (**)(char *, uint64_t))(v51 + 8))(v37, v52);
      }
    }
    else if (*(void *)(v35 + 16))
    {
      goto LABEL_12;
    }
    swift_bridgeObjectRelease();
    uint64_t v40 = sub_25AF795A0();
    os_log_type_t v41 = sub_25AF797D0();
    if (os_log_type_enabled(v40, v41))
    {
      uint64_t v42 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v42 = 0;
      _os_log_impl(&dword_25AF45000, v40, v41, "Consulting fallbackDataSource for CSL or non-Spotlight-indexed list", v42, 2u);
      MEMORY[0x26115ACE0](v42, -1, -1);
    }

    uint64_t v43 = v53[7];
    uint64_t v44 = v53[8];
    __swift_project_boxed_opaque_existential_1(v53 + 4, v43);
    return (*(uint64_t (**)(uint64_t, void (*)(void), uint64_t, uint64_t, uint64_t))(v44 + 32))(a2, a4, a5, v43, v44);
  }
  else
  {
    id v39 = v55[0];
    sub_25AF78E60();

    return swift_willThrow();
  }
}

uint64_t sub_25AF75E1C(void *a1, uint64_t a2, void (*a3)(void), uint64_t a4)
{
  uint64_t v7 = sub_25AF79330();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A4D5948 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_25AF795B0();
  __swift_project_value_buffer(v11, (uint64_t)qword_26A4D6250);
  swift_bridgeObjectRetain();
  id v12 = a1;
  swift_bridgeObjectRetain();
  id v13 = a1;
  uint64_t v14 = sub_25AF795A0();
  os_log_type_t v15 = sub_25AF797B0();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = swift_slowAlloc();
    uint64_t v30 = v7;
    uint64_t v17 = v16;
    uint64_t v29 = swift_slowAlloc();
    uint64_t v34 = v29;
    *(_DWORD *)uint64_t v17 = 136315394;
    uint64_t v18 = sub_25AF792A0();
    uint64_t v32 = a3;
    uint64_t v19 = v18;
    uint64_t v20 = swift_bridgeObjectRetain();
    uint64_t v21 = MEMORY[0x26115A160](v20, v19);
    uint64_t v31 = a4;
    unint64_t v23 = v22;
    swift_bridgeObjectRelease();
    uint64_t v33 = sub_25AF772F0(v21, v23, &v34);
    sub_25AF799C0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 2080;
    swift_getErrorValue();
    uint64_t v24 = sub_25AF79CA0();
    uint64_t v33 = sub_25AF772F0(v24, v25, &v34);
    a3 = v32;
    sub_25AF799C0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_25AF45000, v14, v15, "Error matching lists from Spotlight {criteria: %s, error: %s}", (uint8_t *)v17, 0x16u);
    uint64_t v26 = v29;
    swift_arrayDestroy();
    MEMORY[0x26115ACE0](v26, -1, -1);
    uint64_t v27 = v17;
    uint64_t v7 = v30;
    MEMORY[0x26115ACE0](v27, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }
  sub_25AF79310();
  a3(v10);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_25AF7614C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v51 = a3;
  uint64_t v50 = a2;
  uint64_t v67 = sub_25AF792A0();
  uint64_t v60 = *(void *)(v67 - 8);
  MEMORY[0x270FA5388](v67);
  uint64_t v57 = (char *)&v49 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (uint64_t *)((char *)&v49 - v6);
  uint64_t v8 = swift_allocObject();
  uint64_t v9 = MEMORY[0x263F8EE78];
  uint64_t v63 = v8;
  *(void *)(v8 + 16) = MEMORY[0x263F8EE78];
  uint64_t v68 = v9;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_25AF79C10();
    uint64_t v10 = result;
    if (result) {
      goto LABEL_3;
    }
LABEL_29:
    swift_bridgeObjectRelease();
    uint64_t v42 = MEMORY[0x263F8EE78];
LABEL_30:
    uint64_t v43 = v68;
    if (*(void *)(v42 + 16))
    {
      uint64_t v44 = (void *)swift_allocObject();
      uint64_t v45 = v51;
      v44[2] = v52;
      v44[3] = a1;
      v44[4] = v50;
      v44[5] = v45;
      uint64_t v46 = v63;
      v44[6] = v43;
      v44[7] = v46;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_retain();
      swift_retain();
      swift_retain();
      sub_25AF739DC(v42, (uint64_t)sub_25AF77DAC, (uint64_t)v44, (void (*)(uint64_t *__return_ptr, uint64_t))sub_25AF7852C);
      swift_release();
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v47 = v52[7];
      uint64_t v48 = v52[8];
      __swift_project_boxed_opaque_existential_1(v52 + 4, v47);
      (*(void (**)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v48 + 40))(a1, v50, v51, v47, v48);
    }
    return swift_release();
  }
  uint64_t v10 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain();
  if (!v10) {
    goto LABEL_29;
  }
LABEL_3:
  if (v10 >= 1)
  {
    uint64_t v12 = 0;
    unint64_t v64 = a1 & 0xC000000000000001;
    unsigned int v59 = *MEMORY[0x263F63280];
    unsigned int v58 = *MEMORY[0x263F63110];
    uint64_t v61 = v60 + 32;
    uint64_t v62 = (void (**)(uint64_t *, void, uint64_t))(v60 + 104);
    unsigned int v55 = *MEMORY[0x263F63178];
    unsigned int v54 = *MEMORY[0x263F63130];
    unint64_t v56 = "8^B16";
    unint64_t v53 = 0x800000025AF80000;
    uint64_t v65 = v10;
    unint64_t v66 = a1;
    while (1)
    {
      if (v64) {
        id v14 = (id)MEMORY[0x26115A540](v12, a1);
      }
      else {
        id v14 = *(id *)(a1 + 8 * v12 + 32);
      }
      os_log_type_t v15 = v14;
      uint64_t v16 = (void *)sub_25AF79780();

      if (v16)
      {
        id v13 = v15;
        MEMORY[0x26115A130]();
        if (*(void *)((v68 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v68 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_25AF79700();
        }
        sub_25AF79710();
        sub_25AF796F0();
        goto LABEL_8;
      }
      id v17 = objc_msgSend(v15, sel_title);
      id v18 = objc_msgSend(v17, sel_spokenPhrase);

      uint64_t v19 = sub_25AF79640();
      uint64_t v21 = v20;

      unint64_t v22 = (char *)v7 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A4D6020) + 48);
      *uint64_t v7 = v19;
      v7[1] = v21;
      uint64_t v23 = sub_25AF793C0();
      (*(void (**)(char *, void, uint64_t))(*(void *)(v23 - 8) + 104))(v22, v59, v23);
      uint64_t v24 = (void (*)(char *, void, uint64_t))*v62;
      (*v62)(v7, v58, v67);
      unint64_t v25 = *(void *)(v63 + 16);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        unint64_t v25 = sub_25AF77070(0, *(void *)(v25 + 16) + 1, 1, v25, (uint64_t *)&unk_26A4D5DA0, MEMORY[0x263F63160], MEMORY[0x263F63160]);
        *(void *)(v63 + 16) = v25;
      }
      unint64_t v27 = *(void *)(v25 + 16);
      unint64_t v26 = *(void *)(v25 + 24);
      if (v27 >= v26 >> 1)
      {
        unint64_t v25 = sub_25AF77070(v26 > 1, v27 + 1, 1, v25, (uint64_t *)&unk_26A4D5DA0, MEMORY[0x263F63160], MEMORY[0x263F63160]);
        *(void *)(v63 + 16) = v25;
      }
      *(void *)(v25 + 16) = v27 + 1;
      unint64_t v28 = (*(unsigned __int8 *)(v60 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v60 + 80);
      uint64_t v29 = *(void *)(v60 + 72);
      uint64_t v30 = *(void (**)(unint64_t, uint64_t *, uint64_t))(v60 + 32);
      v30(v25 + v28 + v29 * v27, v7, v67);
      id v31 = objc_msgSend(v15, sel_title);
      id v32 = objc_msgSend(v31, sel_vocabularyIdentifier);

      if (v32)
      {
        uint64_t v33 = sub_25AF79640();
        uint64_t v35 = v34;

        if (v33 == 0xD000000000000011 && v35 == v53)
        {
          swift_bridgeObjectRelease();
LABEL_22:
          uint64_t v37 = sub_25AF792E0();
          unint64_t v38 = v57;
          (*(void (**)(char *, void, uint64_t))(*(void *)(v37 - 8) + 104))(v57, v55, v37);
          v24(v38, v54, v67);
          unint64_t v39 = *(void *)(v63 + 16);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            unint64_t v39 = sub_25AF77070(0, *(void *)(v39 + 16) + 1, 1, v39, (uint64_t *)&unk_26A4D5DA0, MEMORY[0x263F63160], MEMORY[0x263F63160]);
            *(void *)(v63 + 16) = v39;
          }
          unint64_t v41 = *(void *)(v39 + 16);
          unint64_t v40 = *(void *)(v39 + 24);
          if (v41 >= v40 >> 1)
          {
            unint64_t v39 = sub_25AF77070(v40 > 1, v41 + 1, 1, v39, (uint64_t *)&unk_26A4D5DA0, MEMORY[0x263F63160], MEMORY[0x263F63160]);
            *(void *)(v63 + 16) = v39;
          }
          *(void *)(v39 + 16) = v41 + 1;
          v30(v39 + v28 + v41 * v29, (uint64_t *)v57, v67);
          goto LABEL_8;
        }
        char v36 = sub_25AF79C80();
        swift_bridgeObjectRelease();
        if (v36) {
          goto LABEL_22;
        }
      }
LABEL_8:
      ++v12;

      a1 = v66;
      if (v65 == v12)
      {
        swift_bridgeObjectRelease();
        uint64_t v42 = *(void *)(v63 + 16);
        goto LABEL_30;
      }
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_25AF76898(unint64_t a1, unint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v22 = sub_25AF79C10();
    swift_bridgeObjectRelease();
    if (v22) {
      goto LABEL_5;
    }
LABEL_3:
    if (a2 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v23 = sub_25AF79C10();
      swift_bridgeObjectRelease();
      if (v23) {
        goto LABEL_5;
      }
    }
    else if (*(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_5;
    }
    uint64_t v24 = a6;
    uint64_t v25 = a3[7];
    uint64_t v26 = a3[8];
    __swift_project_boxed_opaque_existential_1(a3 + 4, v25);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v26 + 40))(a4, a5, v24, v25, v26);
  }
  if (!*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_3;
  }
LABEL_5:
  uint64_t v16 = a3 + 4;
  uint64_t v17 = a3[7];
  uint64_t v18 = a3[8];
  __swift_project_boxed_opaque_existential_1(v16, v17);
  uint64_t v19 = (void *)swift_allocObject();
  v19[2] = a1;
  v19[3] = a8;
  v19[4] = a2;
  v19[5] = a5;
  v19[6] = a6;
  uint64_t v20 = *(void (**)(uint64_t, uint64_t (*)(uint64_t), void *, uint64_t, uint64_t))(v18 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  v20(a7, sub_25AF786FC, v19, v17, v18);
  return swift_release();
}

uint64_t sub_25AF76A8C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(char *), uint64_t a6)
{
  uint64_t v17 = a6;
  uint64_t v18 = a5;
  uint64_t v8 = sub_25AF79330();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v12 = sub_25AF79320();
  unint64_t v20 = a2;
  swift_bridgeObjectRetain();
  sub_25AF5E984(v12);
  unint64_t v13 = v20;
  swift_beginAccess();
  uint64_t v14 = swift_bridgeObjectRetain();
  sub_25AF6C480(v14, v13);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v15 = sub_25AF79300();
  uint64_t v19 = a4;
  swift_bridgeObjectRetain();
  sub_25AF5E96C(v15);
  sub_25AF79310();
  v18(v11);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_25AF76C20()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for TTRIntentsHandlerSpotlightDataSource()
{
  return self;
}

uint64_t sub_25AF76C8C(uint64_t a1)
{
  uint64_t v3 = *(void *)(*(void *)v1 + 56);
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)v1 + 32), v3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 8))(a1, v3, v4);
}

void sub_25AF76CEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_25AF76D10(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

uint64_t sub_25AF76D34(unint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25AF7614C(a1, a2, a3);
}

uint64_t sub_25AF76D58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = *(void *)(*(void *)v4 + 56);
  uint64_t v10 = *(void *)(*(void *)v4 + 64);
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)v4 + 32), v9);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56))(a1, a2, a3, a4, v9, v10);
}

uint64_t sub_25AF76DE0()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 56);
  uint64_t v2 = *(void *)(*(void *)v0 + 64);
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)v0 + 32), v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 72))(v1, v2);
}

uint64_t sub_25AF76E38(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(*(void *)v2 + 56);
  uint64_t v6 = *(void *)(*(void *)v2 + 64);
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)v2 + 32), v5);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 80))(a1, a2, v5, v6);
}

uint64_t sub_25AF76EA8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(*(void *)v2 + 56);
  uint64_t v6 = *(void *)(*(void *)v2 + 64);
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)v2 + 32), v5);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 88))(a1, a2, v5, v6);
}

uint64_t sub_25AF76F18(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_25AF77070(a1, a2, a3, a4, (uint64_t *)&unk_26A4D5DA0, MEMORY[0x263F63160], MEMORY[0x263F63160]);
}

void *sub_25AF76F3C(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D6248);
      uint64_t v10 = (void *)swift_allocObject();
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
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
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
    sub_25AF788FC(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_25AF7704C(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_25AF77070(a1, a2, a3, a4, (uint64_t *)&unk_26A4D62A0, MEMORY[0x263F63350], MEMORY[0x263F63350]);
}

uint64_t sub_25AF77070(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void))
{
  if (a3)
  {
    unint64_t v11 = *(void *)(a4 + 24);
    uint64_t v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v12 = a2;
      }
    }
  }
  else
  {
    uint64_t v12 = a2;
  }
  uint64_t v13 = *(void *)(a4 + 16);
  if (v12 <= v13) {
    uint64_t v14 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v14 = v12;
  }
  if (!v14)
  {
    uint64_t v18 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v15 = *(void *)(a6(0) - 8);
  uint64_t v16 = *(void *)(v15 + 72);
  unint64_t v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  uint64_t v18 = (void *)swift_allocObject();
  size_t v19 = _swift_stdlib_malloc_size(v18);
  if (!v16 || (v19 - v17 == 0x8000000000000000 ? (BOOL v20 = v16 == -1) : (BOOL v20 = 0), v20))
  {
LABEL_29:
    uint64_t result = sub_25AF79C00();
    __break(1u);
    return result;
  }
  v18[2] = v13;
  v18[3] = 2 * ((uint64_t)(v19 - v17) / v16);
LABEL_19:
  uint64_t v21 = *(void *)(a6(0) - 8);
  unint64_t v22 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  unint64_t v23 = (unint64_t)v18 + v22;
  if (a1)
  {
    if ((unint64_t)v18 < a4 || v23 >= a4 + v22 + *(void *)(v21 + 72) * v13)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v18 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25AF789F0(0, v13, v23, a4, a7);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v18;
}

uint64_t sub_25AF772F0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_25AF773C4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25AF7878C((uint64_t)v12, *a3);
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
      sub_25AF7878C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_25AF773C4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_25AF799D0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_25AF77580(a5, a6);
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
  uint64_t v8 = sub_25AF79AE0();
  if (!v8)
  {
    sub_25AF79C00();
    __break(1u);
LABEL_17:
    uint64_t result = sub_25AF79C30();
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

uint64_t sub_25AF77580(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25AF77618(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_25AF777F8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_25AF777F8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25AF77618(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_25AF77790(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_25AF79AA0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_25AF79C00();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_25AF79690();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_25AF79C30();
    __break(1u);
LABEL_14:
    uint64_t result = sub_25AF79C00();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_25AF77790(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D6288);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_25AF777F8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D6288);
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
  uint64_t v13 = a4 + 32;
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
  uint64_t result = sub_25AF79C30();
  __break(1u);
  return result;
}

uint64_t sub_25AF77948(unint64_t a1)
{
  return sub_25AF77970(a1, (unint64_t *)&qword_26A4D5B40);
}

uint64_t sub_25AF7795C(unint64_t a1)
{
  return sub_25AF77970(a1, &qword_26A4D60C0);
}

uint64_t sub_25AF77970(unint64_t a1, unint64_t *a2)
{
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v4 = sub_25AF79A30();
    if (v4) {
      goto LABEL_3;
    }
    return MEMORY[0x263F8EE78];
  }
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4) {
    return MEMORY[0x263F8EE78];
  }
LABEL_3:
  if (v4 <= 0)
  {
    size_t v5 = (uint64_t *)MEMORY[0x263F8EE78];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5980);
    size_t v5 = (uint64_t *)swift_allocObject();
    int64_t v6 = _swift_stdlib_malloc_size(v5);
    uint64_t v7 = v6 - 32;
    if (v6 < 32) {
      uint64_t v7 = v6 - 25;
    }
    v5[2] = v4;
    v5[3] = (2 * (v7 >> 3)) | 1;
  }
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_25AF77E44((uint64_t)&v10, v5 + 4, v4, a1, a2);
  uint64_t result = sub_25AF5D904();
  if (v8 == v4) {
    return (uint64_t)v5;
  }
  __break(1u);
  return result;
}

uint64_t sub_25AF77A84(unint64_t a1)
{
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v2 = sub_25AF79A30();
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
    unint64_t v3 = (uint64_t *)MEMORY[0x263F8EE78];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D5980);
    unint64_t v3 = (uint64_t *)swift_allocObject();
    int64_t v4 = _swift_stdlib_malloc_size(v3);
    uint64_t v5 = v4 - 32;
    if (v4 < 32) {
      uint64_t v5 = v4 - 25;
    }
    v3[2] = v2;
    v3[3] = (2 * (v5 >> 3)) | 1;
  }
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_25AF78110((uint64_t)&v8, v3 + 4, v2, a1);
  uint64_t result = sub_25AF5D904();
  if (v6 == v2) {
    return (uint64_t)v3;
  }
  __break(1u);
  return result;
}

uint64_t (*sub_25AF77B80(uint64_t (**a1)(), unint64_t a2, uint64_t a3))()
{
  uint64_t v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_25AF77C9C(v6, a2, a3);
  return sub_25AF77BE8;
}

uint64_t (*sub_25AF77BEC(void (**a1)(id *a1), unint64_t a2, uint64_t a3))()
{
  uint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_25AF77DBC(v6, a2, a3);
  return sub_25AF77BE8;
}

void sub_25AF77C54(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t (*sub_25AF77C9C(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  unint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x26115A540](a2, a3);
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
    *(void *)unint64_t v3 = v4;
    return sub_25AF78DAC;
  }
  __break(1u);
  return result;
}

uint64_t sub_25AF77D1C()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25AF77D54()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_25AF77DAC(unint64_t a1, unint64_t a2)
{
  return sub_25AF76898(a1, a2, *(void **)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 48), *(void *)(v2 + 56));
}

void (*sub_25AF77DBC(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  unint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x26115A540](a2, a3);
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
    *(void *)unint64_t v3 = v4;
    return sub_25AF77E3C;
  }
  __break(1u);
  return result;
}

void sub_25AF77E3C(id *a1)
{
}

uint64_t sub_25AF77E44(uint64_t result, uint64_t *a2, uint64_t a3, unint64_t a4, unint64_t *a5)
{
  unint64_t v5 = a4;
  uint64_t v7 = a2;
  uint64_t v8 = (void *)result;
  if ((a4 & 0xC000000000000001) != 0)
  {
    uint64_t result = sub_25AF79B50();
    unint64_t v9 = 0;
    uint64_t v10 = 0;
    unint64_t v11 = 0;
    unint64_t v5 = result | 0x8000000000000000;
    if (v7) {
      goto LABEL_3;
    }
LABEL_36:
    int64_t v12 = 0;
    a3 = 0;
LABEL_45:
    void *v8 = v5;
    v8[1] = v9;
    v8[2] = v10;
    v8[3] = v12;
    v8[4] = v11;
    return a3;
  }
  uint64_t v20 = -1 << *(unsigned char *)(a4 + 32);
  unint64_t v9 = a4 + 64;
  uint64_t v21 = ~v20;
  uint64_t v22 = -v20;
  if (v22 < 64) {
    uint64_t v23 = ~(-1 << v22);
  }
  else {
    uint64_t v23 = -1;
  }
  unint64_t v11 = v23 & *(void *)(a4 + 64);
  uint64_t v10 = v21;
  if (!a2) {
    goto LABEL_36;
  }
LABEL_3:
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_45;
  }
  if (a3 < 0)
  {
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  uint64_t v24 = v10;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v25 = (unint64_t)(v10 + 64) >> 6;
  while ((v5 & 0x8000000000000000) != 0)
  {
    if (!sub_25AF79BD0())
    {
      a3 = v13;
LABEL_44:
      uint64_t v10 = v24;
      goto LABEL_45;
    }
    swift_unknownObjectRelease();
    sub_25AF48D94(0, a5);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    uint64_t v16 = v27;
    uint64_t result = swift_unknownObjectRelease();
    if (!v27) {
      goto LABEL_43;
    }
LABEL_8:
    ++v13;
    *v7++ = v16;
    if (v13 == a3) {
      goto LABEL_44;
    }
  }
  if (v11)
  {
    unint64_t v14 = __clz(__rbit64(v11));
    v11 &= v11 - 1;
    unint64_t v15 = v14 | (v12 << 6);
    goto LABEL_7;
  }
  int64_t v17 = v12 + 1;
  if (__OFADD__(v12, 1))
  {
    __break(1u);
    goto LABEL_47;
  }
  if (v17 >= v25) {
    goto LABEL_39;
  }
  unint64_t v18 = *(void *)(v9 + 8 * v17);
  if (v18) {
    goto LABEL_23;
  }
  v12 += 2;
  if (v17 + 1 >= v25)
  {
    unint64_t v11 = 0;
    int64_t v12 = v17;
    goto LABEL_43;
  }
  unint64_t v18 = *(void *)(v9 + 8 * v12);
  if (v18)
  {
LABEL_16:
    int64_t v17 = v12;
LABEL_23:
    unint64_t v11 = (v18 - 1) & v18;
    unint64_t v15 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
LABEL_7:
    uint64_t result = (uint64_t)*(id *)(*(void *)(v5 + 56) + 8 * v15);
    uint64_t v16 = result;
    if (!result) {
      goto LABEL_43;
    }
    goto LABEL_8;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v25) {
    goto LABEL_39;
  }
  unint64_t v18 = *(void *)(v9 + 8 * v19);
  if (v18)
  {
LABEL_22:
    int64_t v17 = v19;
    goto LABEL_23;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v25)
  {
    unint64_t v11 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_43;
  }
  unint64_t v18 = *(void *)(v9 + 8 * v12);
  if (v18) {
    goto LABEL_16;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v25)
  {
LABEL_39:
    unint64_t v11 = 0;
LABEL_43:
    a3 = v13;
    goto LABEL_44;
  }
  unint64_t v18 = *(void *)(v9 + 8 * v19);
  if (v18) {
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v25)
    {
      unint64_t v11 = 0;
      int64_t v12 = v25 - 1;
      goto LABEL_43;
    }
    unint64_t v18 = *(void *)(v9 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_23;
    }
  }
LABEL_48:
  __break(1u);
  return result;
}

uint64_t sub_25AF78110(uint64_t result, uint64_t *a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4;
  uint64_t v6 = a2;
  uint64_t v7 = (void *)result;
  if ((a4 & 0xC000000000000001) != 0)
  {
    uint64_t result = sub_25AF79B50();
    unint64_t v8 = 0;
    uint64_t v9 = 0;
    unint64_t v10 = 0;
    unint64_t v4 = result | 0x8000000000000000;
    if (v6) {
      goto LABEL_3;
    }
LABEL_36:
    int64_t v11 = 0;
    a3 = 0;
LABEL_45:
    *uint64_t v7 = v4;
    v7[1] = v8;
    v7[2] = v9;
    v7[3] = v11;
    v7[4] = v10;
    return a3;
  }
  uint64_t v19 = -1 << *(unsigned char *)(a4 + 32);
  unint64_t v8 = a4 + 64;
  uint64_t v20 = ~v19;
  uint64_t v21 = -v19;
  if (v21 < 64) {
    uint64_t v22 = ~(-1 << v21);
  }
  else {
    uint64_t v22 = -1;
  }
  unint64_t v10 = v22 & *(void *)(a4 + 64);
  uint64_t v9 = v20;
  if (!a2) {
    goto LABEL_36;
  }
LABEL_3:
  if (!a3)
  {
    int64_t v11 = 0;
    goto LABEL_45;
  }
  if (a3 < 0)
  {
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  uint64_t v23 = v9;
  int64_t v11 = 0;
  uint64_t v12 = 0;
  int64_t v24 = (unint64_t)(v9 + 64) >> 6;
  while ((v4 & 0x8000000000000000) != 0)
  {
    if (!sub_25AF79BE0())
    {
      a3 = v12;
LABEL_44:
      uint64_t v9 = v23;
      goto LABEL_45;
    }
    sub_25AF48D94(0, &qword_26A4D5E48);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    uint64_t v15 = v25;
    uint64_t result = swift_unknownObjectRelease();
    if (!v25) {
      goto LABEL_43;
    }
LABEL_8:
    ++v12;
    *v6++ = v15;
    if (v12 == a3) {
      goto LABEL_44;
    }
  }
  if (v10)
  {
    unint64_t v13 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    unint64_t v14 = v13 | (v11 << 6);
    goto LABEL_7;
  }
  int64_t v16 = v11 + 1;
  if (__OFADD__(v11, 1))
  {
    __break(1u);
    goto LABEL_47;
  }
  if (v16 >= v24) {
    goto LABEL_39;
  }
  unint64_t v17 = *(void *)(v8 + 8 * v16);
  if (v17) {
    goto LABEL_23;
  }
  v11 += 2;
  if (v16 + 1 >= v24)
  {
    unint64_t v10 = 0;
    int64_t v11 = v16;
    goto LABEL_43;
  }
  unint64_t v17 = *(void *)(v8 + 8 * v11);
  if (v17)
  {
LABEL_16:
    int64_t v16 = v11;
LABEL_23:
    unint64_t v10 = (v17 - 1) & v17;
    unint64_t v14 = __clz(__rbit64(v17)) + (v16 << 6);
    int64_t v11 = v16;
LABEL_7:
    uint64_t result = (uint64_t)*(id *)(*(void *)(v4 + 48) + 8 * v14);
    uint64_t v15 = result;
    if (!result) {
      goto LABEL_43;
    }
    goto LABEL_8;
  }
  int64_t v18 = v16 + 2;
  if (v16 + 2 >= v24) {
    goto LABEL_39;
  }
  unint64_t v17 = *(void *)(v8 + 8 * v18);
  if (v17)
  {
LABEL_22:
    int64_t v16 = v18;
    goto LABEL_23;
  }
  int64_t v11 = v16 + 3;
  if (v16 + 3 >= v24)
  {
    unint64_t v10 = 0;
    int64_t v11 = v16 + 2;
    goto LABEL_43;
  }
  unint64_t v17 = *(void *)(v8 + 8 * v11);
  if (v17) {
    goto LABEL_16;
  }
  int64_t v18 = v16 + 4;
  if (v16 + 4 >= v24)
  {
LABEL_39:
    unint64_t v10 = 0;
LABEL_43:
    a3 = v12;
    goto LABEL_44;
  }
  unint64_t v17 = *(void *)(v8 + 8 * v18);
  if (v17) {
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v16 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v16 >= v24)
    {
      unint64_t v10 = 0;
      int64_t v11 = v24 - 1;
      goto LABEL_43;
    }
    unint64_t v17 = *(void *)(v8 + 8 * v16);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_48:
  __break(1u);
  return result;
}

uint64_t sub_25AF783E0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A4D5DA0);
  uint64_t v4 = sub_25AF792A0();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_25AF7A830;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v5 + 16))(v7 + v6, a1, v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D6268);
  swift_allocObject();
  uint64_t v8 = sub_25AF79570();
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v8;
  return result;
}

uint64_t sub_25AF7852C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_25AF783E0(a1, a2);
}

unint64_t sub_25AF78560()
{
  unint64_t result = qword_26A4D6278;
  if (!qword_26A4D6278)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A4D6270);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4D6278);
  }
  return result;
}

uint64_t sub_25AF785BC()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25AF785F4(uint64_t *a1)
{
  return sub_25AF5E588(a1, *(void (**)(uint64_t, uint64_t))(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_25AF78610(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a1;
  *(void *)(v9 + 24) = a2;
  swift_retain();
  sub_25AF75288(a6, sub_25AF5DA0C, v9);
  return swift_release();
}

uint64_t sub_25AF786A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25AF78610(a1, a2, a3, a4, *(void *)(v4 + 16), *(void *)(v4 + 24));
}

uint64_t sub_25AF786AC()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_25AF786FC(uint64_t a1)
{
  return sub_25AF76A8C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void (**)(char *))(v1 + 40), *(void *)(v1 + 48));
}

uint64_t sub_25AF78710(uint64_t a1)
{
  return sub_25AF75840(a1, *(void *)(v1 + 16), *(void **)(v1 + 24), *(void (**)(void))(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_25AF78734(void *a1)
{
  return sub_25AF75E1C(a1, *(void *)(v1 + 16), *(void (**)(void))(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_25AF78740()
{
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_25AF78780(unint64_t a1, uint64_t a2)
{
  return sub_25AF75730(a1, a2, *(void (**)(char *))(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32));
}

uint64_t sub_25AF7878C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t objectdestroy_28Tm()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_25AF78834(uint64_t a1)
{
  return sub_25AF742B4(a1, *(void *)(v1 + 16), *(void **)(v1 + 24), *(void (**)(unint64_t))(v1 + 32), *(void *)(v1 + 40));
}

uint64_t objectdestroy_31Tm()
{
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_25AF78898(void *a1)
{
  return sub_25AF75000(a1, *(void *)(v1 + 16), *(uint64_t (**)(void))(v1 + 24));
}

unint64_t sub_25AF788A4()
{
  unint64_t result = qword_26A4D6290;
  if (!qword_26A4D6290)
  {
    sub_25AF79290();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4D6290);
  }
  return result;
}

uint64_t sub_25AF788FC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_25AF79C30();
  __break(1u);
  return result;
}

uint64_t sub_25AF789F0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
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
      return v13;
    }
  }
  uint64_t result = sub_25AF79C30();
  __break(1u);
  return result;
}

uint64_t sub_25AF78B4C(unint64_t a1)
{
  uint64_t v10 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_16;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = 0;
      while ((a1 & 0xC000000000000001) != 0)
      {
        id v4 = (id)MEMORY[0x26115A540](v3, a1);
LABEL_9:
        uint64_t v5 = v4;
        unint64_t v6 = v3 + 1;
        if (__OFADD__(v3, 1)) {
          goto LABEL_15;
        }
        sub_25AF48D94(0, &qword_26A4D6298);
        id v7 = objc_msgSend(v5, sel_list);
        id v8 = objc_msgSend(v7, sel_objectID);

        LOBYTE(v7) = sub_25AF79980();
        if (v7)
        {
          sub_25AF79AF0();
          sub_25AF79B20();
          sub_25AF79B30();
          sub_25AF79B00();
        }
        else
        {
        }
        ++v3;
        if (v6 == v2) {
          return v10;
        }
      }
      if (v3 < *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        break;
      }
      __break(1u);
LABEL_15:
      __break(1u);
LABEL_16:
      uint64_t v2 = sub_25AF79C10();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    id v4 = *(id *)(a1 + 8 * v3 + 32);
    goto LABEL_9;
  }
  return MEMORY[0x263F8EE78];
}

uint64_t sub_25AF78CF4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_25AF783E0(a1, a2);
}

uint64_t sub_25AF78D28(void (*a1)(char *), uint64_t a2)
{
  uint64_t v5 = *(uint64_t **)(v2 + 16);
  uint64_t v6 = *(void *)(v2 + 24);
  uint64_t v7 = *v5;
  swift_retain();
  sub_25AF5D320(v6, v7, a1, a2);
  return swift_release();
}

uint64_t sub_25AF78D94(uint64_t *a1)
{
  return sub_25AF785F4(a1);
}

uint64_t sub_25AF78DB0()
{
  return MEMORY[0x270F5A328]();
}

uint64_t sub_25AF78DC0()
{
  return MEMORY[0x270F5A340]();
}

uint64_t sub_25AF78DD0()
{
  return MEMORY[0x270EEE738]();
}

uint64_t sub_25AF78DE0()
{
  return MEMORY[0x270EEE760]();
}

uint64_t sub_25AF78DF0()
{
  return MEMORY[0x270EEE7B8]();
}

uint64_t sub_25AF78E00()
{
  return MEMORY[0x270EEE7C8]();
}

uint64_t sub_25AF78E10()
{
  return MEMORY[0x270EEE838]();
}

uint64_t sub_25AF78E20()
{
  return MEMORY[0x270EEE850]();
}

uint64_t sub_25AF78E30()
{
  return MEMORY[0x270EEE898]();
}

uint64_t sub_25AF78E40()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_25AF78E50()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_25AF78E60()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_25AF78E70()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_25AF78E80()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_25AF78E90()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_25AF78EA0()
{
  return MEMORY[0x270EF0700]();
}

uint64_t sub_25AF78EB0()
{
  return MEMORY[0x270EF07A0]();
}

uint64_t sub_25AF78EC0()
{
  return MEMORY[0x270EF0898]();
}

uint64_t sub_25AF78ED0()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_25AF78EE0()
{
  return MEMORY[0x270EF09B8]();
}

uint64_t sub_25AF78EF0()
{
  return MEMORY[0x270EF09E0]();
}

uint64_t sub_25AF78F00()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_25AF78F10()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_25AF78F20()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_25AF78F30()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t sub_25AF78F40()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_25AF78F50()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_25AF78F60()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_25AF78F70()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_25AF78F80()
{
  return MEMORY[0x270EF1100]();
}

uint64_t sub_25AF78F90()
{
  return MEMORY[0x270F5A348]();
}

uint64_t sub_25AF78FA0()
{
  return MEMORY[0x270EF12C8]();
}

uint64_t sub_25AF78FB0()
{
  return MEMORY[0x270EF1388]();
}

uint64_t sub_25AF78FC0()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_25AF78FD0()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_25AF78FE0()
{
  return MEMORY[0x270EF15C8]();
}

uint64_t sub_25AF78FF0()
{
  return MEMORY[0x270EF1600]();
}

uint64_t sub_25AF79000()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_25AF79010()
{
  return MEMORY[0x270F5A380]();
}

uint64_t sub_25AF79020()
{
  return MEMORY[0x270F5A388]();
}

uint64_t sub_25AF79030()
{
  return MEMORY[0x270F5A3B0]();
}

uint64_t sub_25AF79040()
{
  return MEMORY[0x270F5A3D0]();
}

uint64_t sub_25AF79050()
{
  return MEMORY[0x270F5A430]();
}

uint64_t sub_25AF79060()
{
  return MEMORY[0x270F5A438]();
}

uint64_t sub_25AF79070()
{
  return MEMORY[0x270F5A460]();
}

uint64_t sub_25AF79080()
{
  return MEMORY[0x270F5A468]();
}

uint64_t sub_25AF79090()
{
  return MEMORY[0x270F5A478]();
}

uint64_t sub_25AF790A0()
{
  return MEMORY[0x270F5A4D8]();
}

uint64_t sub_25AF790B0()
{
  return MEMORY[0x270F5A4E8]();
}

uint64_t sub_25AF790C0()
{
  return MEMORY[0x270F5A4F0]();
}

uint64_t sub_25AF790D0()
{
  return MEMORY[0x270F5A4F8]();
}

uint64_t sub_25AF790E0()
{
  return MEMORY[0x270F5A500]();
}

uint64_t sub_25AF790F0()
{
  return MEMORY[0x270F5A508]();
}

uint64_t sub_25AF79100()
{
  return MEMORY[0x270F5A518]();
}

uint64_t sub_25AF79110()
{
  return MEMORY[0x270F5A520]();
}

uint64_t sub_25AF79120()
{
  return MEMORY[0x270F5A528]();
}

uint64_t sub_25AF79130()
{
  return MEMORY[0x270F5A540]();
}

uint64_t sub_25AF79140()
{
  return MEMORY[0x270F5A548]();
}

uint64_t sub_25AF79150()
{
  return MEMORY[0x270F5A558]();
}

uint64_t sub_25AF79160()
{
  return MEMORY[0x270F5A568]();
}

uint64_t sub_25AF79170()
{
  return MEMORY[0x270F5A580]();
}

uint64_t sub_25AF79180()
{
  return MEMORY[0x270F5A598]();
}

uint64_t sub_25AF79190()
{
  return MEMORY[0x270F5A5F8]();
}

uint64_t sub_25AF791A0()
{
  return MEMORY[0x270F5A600]();
}

uint64_t sub_25AF791B0()
{
  return MEMORY[0x270F5A618]();
}

uint64_t sub_25AF791C0()
{
  return MEMORY[0x270F5A620]();
}

uint64_t sub_25AF791D0()
{
  return MEMORY[0x270F5A638]();
}

uint64_t sub_25AF791E0()
{
  return MEMORY[0x270F5A640]();
}

uint64_t sub_25AF791F0()
{
  return MEMORY[0x270F5A648]();
}

uint64_t sub_25AF79200()
{
  return MEMORY[0x270F5A650]();
}

uint64_t sub_25AF79210()
{
  return MEMORY[0x270F5A658]();
}

uint64_t sub_25AF79220()
{
  return MEMORY[0x270F5A660]();
}

uint64_t sub_25AF79230()
{
  return MEMORY[0x270F5A6D0]();
}

uint64_t sub_25AF79240()
{
  return MEMORY[0x270F59B18]();
}

uint64_t sub_25AF79250()
{
  return MEMORY[0x270F59B20]();
}

uint64_t sub_25AF79260()
{
  return MEMORY[0x270F59B28]();
}

uint64_t sub_25AF79270()
{
  return MEMORY[0x270F59B58]();
}

uint64_t sub_25AF79280()
{
  return MEMORY[0x270F59B78]();
}

uint64_t sub_25AF79290()
{
  return MEMORY[0x270F59B80]();
}

uint64_t sub_25AF792A0()
{
  return MEMORY[0x270F59B88]();
}

uint64_t sub_25AF792B0()
{
  return MEMORY[0x270F59B90]();
}

uint64_t sub_25AF792C0()
{
  return MEMORY[0x270F59C08]();
}

uint64_t sub_25AF792D0()
{
  return MEMORY[0x270F59C10]();
}

uint64_t sub_25AF792E0()
{
  return MEMORY[0x270F59C18]();
}

uint64_t sub_25AF792F0()
{
  return MEMORY[0x270F59C20]();
}

uint64_t sub_25AF79300()
{
  return MEMORY[0x270F59C28]();
}

uint64_t sub_25AF79310()
{
  return MEMORY[0x270F59C30]();
}

uint64_t sub_25AF79320()
{
  return MEMORY[0x270F59C38]();
}

uint64_t sub_25AF79330()
{
  return MEMORY[0x270F59C40]();
}

uint64_t sub_25AF79340()
{
  return MEMORY[0x270F59C48]();
}

uint64_t sub_25AF79350()
{
  return MEMORY[0x270F59C50]();
}

uint64_t sub_25AF79360()
{
  return MEMORY[0x270F59C58]();
}

uint64_t sub_25AF79370()
{
  return MEMORY[0x270F59C60]();
}

uint64_t sub_25AF79380()
{
  return MEMORY[0x270F59C68]();
}

uint64_t sub_25AF79390()
{
  return MEMORY[0x270F59CC0]();
}

uint64_t sub_25AF793A0()
{
  return MEMORY[0x270F59CC8]();
}

uint64_t sub_25AF793B0()
{
  return MEMORY[0x270F59CD0]();
}

uint64_t sub_25AF793C0()
{
  return MEMORY[0x270F59CD8]();
}

uint64_t sub_25AF793D0()
{
  return MEMORY[0x270F59CE0]();
}

uint64_t sub_25AF793E0()
{
  return MEMORY[0x270F59CE8]();
}

uint64_t sub_25AF793F0()
{
  return MEMORY[0x270F59CF0]();
}

uint64_t sub_25AF79400()
{
  return MEMORY[0x270F59D00]();
}

uint64_t sub_25AF79410()
{
  return MEMORY[0x270F59D08]();
}

uint64_t sub_25AF79420()
{
  return MEMORY[0x270F59D18]();
}

uint64_t sub_25AF79430()
{
  return MEMORY[0x270F59D20]();
}

uint64_t sub_25AF79440()
{
  return MEMORY[0x270F59D28]();
}

uint64_t sub_25AF79450()
{
  return MEMORY[0x270F59D30]();
}

uint64_t sub_25AF79460()
{
  return MEMORY[0x270F59D38]();
}

uint64_t sub_25AF79470()
{
  return MEMORY[0x270F59D40]();
}

uint64_t sub_25AF79480()
{
  return MEMORY[0x270F59D48]();
}

uint64_t sub_25AF79490()
{
  return MEMORY[0x270F59D50]();
}

uint64_t sub_25AF794A0()
{
  return MEMORY[0x270F59D58]();
}

uint64_t sub_25AF794B0()
{
  return MEMORY[0x270F59D60]();
}

uint64_t sub_25AF794C0()
{
  return MEMORY[0x270F59ED8]();
}

uint64_t sub_25AF794D0()
{
  return MEMORY[0x270F59EE0]();
}

uint64_t sub_25AF794E0()
{
  return MEMORY[0x270F59EE8]();
}

uint64_t sub_25AF794F0()
{
  return MEMORY[0x270F59EF0]();
}

uint64_t sub_25AF79500()
{
  return MEMORY[0x270F59F70]();
}

uint64_t sub_25AF79510()
{
  return MEMORY[0x270F59F78]();
}

uint64_t sub_25AF79520()
{
  return MEMORY[0x270F59F80]();
}

uint64_t sub_25AF79530()
{
  return MEMORY[0x270F59F88]();
}

uint64_t sub_25AF79540()
{
  return MEMORY[0x270F59F90]();
}

uint64_t sub_25AF79550()
{
  return MEMORY[0x270F59F98]();
}

uint64_t sub_25AF79560()
{
  return MEMORY[0x270F59FA0]();
}

uint64_t sub_25AF79570()
{
  return MEMORY[0x270F59FA8]();
}

uint64_t sub_25AF79580()
{
  return MEMORY[0x270F59FB0]();
}

uint64_t sub_25AF79590()
{
  return MEMORY[0x270F59FC0]();
}

uint64_t sub_25AF795A0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25AF795B0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25AF795C0()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t sub_25AF795D0()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_25AF795E0()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_25AF795F0()
{
  return MEMORY[0x270F9D110]();
}

uint64_t sub_25AF79600()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_25AF79610()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25AF79620()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_25AF79630()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_25AF79640()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25AF79650()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_25AF79660()
{
  return MEMORY[0x270F5A778]();
}

uint64_t sub_25AF79670()
{
  return MEMORY[0x270F5A780]();
}

uint64_t sub_25AF79680()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25AF79690()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25AF796A0()
{
  return MEMORY[0x270F59FE8]();
}

uint64_t sub_25AF796B0()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_25AF796C0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_25AF796D0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_25AF796E0()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_25AF796F0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_25AF79700()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_25AF79710()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_25AF79720()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_25AF79730()
{
  return MEMORY[0x270F5A790]();
}

uint64_t sub_25AF79740()
{
  return MEMORY[0x270F5A798]();
}

uint64_t sub_25AF79750()
{
  return MEMORY[0x270F5A7A0]();
}

uint64_t sub_25AF79760()
{
  return MEMORY[0x270F5A7A8]();
}

uint64_t sub_25AF79770()
{
  return MEMORY[0x270F5A7B0]();
}

uint64_t sub_25AF79780()
{
  return MEMORY[0x270F5A7B8]();
}

uint64_t sub_25AF79790()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_25AF797A0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_25AF797B0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25AF797C0()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_25AF797D0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_25AF797E0()
{
  return MEMORY[0x270F5A7D8]();
}

uint64_t sub_25AF797F0()
{
  return MEMORY[0x270F5A7E0]();
}

uint64_t sub_25AF79800()
{
  return MEMORY[0x270F5A7F0]();
}

uint64_t sub_25AF79810()
{
  return MEMORY[0x270F5A7F8]();
}

uint64_t sub_25AF79820()
{
  return MEMORY[0x270F5A800]();
}

uint64_t sub_25AF79830()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_25AF79840()
{
  return MEMORY[0x270F5A818]();
}

uint64_t sub_25AF79850()
{
  return MEMORY[0x270F5A830]();
}

uint64_t sub_25AF79860()
{
  return MEMORY[0x270F5A838]();
}

uint64_t sub_25AF79870()
{
  return MEMORY[0x270F5A848]();
}

uint64_t sub_25AF79880()
{
  return MEMORY[0x270F5A860]();
}

uint64_t sub_25AF79890()
{
  return MEMORY[0x270F5A078]();
}

uint64_t sub_25AF798A0()
{
  return MEMORY[0x270F5A870]();
}

uint64_t sub_25AF798B0()
{
  return MEMORY[0x270F5A878]();
}

uint64_t sub_25AF798C0()
{
  return MEMORY[0x270F5A880]();
}

uint64_t sub_25AF798D0()
{
  return MEMORY[0x270F5A888]();
}

uint64_t sub_25AF798E0()
{
  return MEMORY[0x270F5A890]();
}

uint64_t sub_25AF798F0()
{
  return MEMORY[0x270F5A898]();
}

uint64_t sub_25AF79900()
{
  return MEMORY[0x270F5A8A0]();
}

uint64_t sub_25AF79910()
{
  return MEMORY[0x270F5A8A8]();
}

uint64_t sub_25AF79920()
{
  return MEMORY[0x270F5A8B0]();
}

uint64_t sub_25AF79930()
{
  return MEMORY[0x270F5A8B8]();
}

uint64_t sub_25AF79940()
{
  return MEMORY[0x270F5A8C8]();
}

uint64_t sub_25AF79950()
{
  return MEMORY[0x270F5A8D0]();
}

uint64_t sub_25AF79960()
{
  return MEMORY[0x270F5A8D8]();
}

uint64_t sub_25AF79970()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_25AF79980()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_25AF79990()
{
  return MEMORY[0x270F5A8E0]();
}

uint64_t sub_25AF799A0()
{
  return MEMORY[0x270F5A088]();
}

uint64_t sub_25AF799B0()
{
  return MEMORY[0x270F5A098]();
}

uint64_t sub_25AF799C0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25AF799D0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25AF799E0()
{
  return MEMORY[0x270EF24C0]();
}

uint64_t sub_25AF799F0()
{
  return MEMORY[0x270EF2560]();
}

uint64_t sub_25AF79A00()
{
  return MEMORY[0x270F9E7F8]();
}

uint64_t sub_25AF79A10()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_25AF79A20()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_25AF79A30()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_25AF79A40()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_25AF79A50()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_25AF79A60()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_25AF79A70()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_25AF79A80()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_25AF79A90()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_25AF79AA0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25AF79AB0()
{
  return MEMORY[0x270F9E9E8]();
}

uint64_t sub_25AF79AC0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_25AF79AD0()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_25AF79AE0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25AF79AF0()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_25AF79B00()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_25AF79B10()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_25AF79B20()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_25AF79B30()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_25AF79B40()
{
  return MEMORY[0x270F9EF48]();
}

uint64_t sub_25AF79B50()
{
  return MEMORY[0x270F9EF50]();
}

uint64_t sub_25AF79B60()
{
  return MEMORY[0x270F9EF60]();
}

uint64_t sub_25AF79B70()
{
  return MEMORY[0x270F9EF68]();
}

uint64_t sub_25AF79B80()
{
  return MEMORY[0x270F9EF78]();
}

uint64_t sub_25AF79B90()
{
  return MEMORY[0x270F9EF80]();
}

uint64_t sub_25AF79BA0()
{
  return MEMORY[0x270F9EF88]();
}

uint64_t sub_25AF79BB0()
{
  return MEMORY[0x270F9EF90]();
}

uint64_t sub_25AF79BC0()
{
  return MEMORY[0x270F9EFA0]();
}

uint64_t sub_25AF79BD0()
{
  return MEMORY[0x270F9EFC0]();
}

uint64_t sub_25AF79BE0()
{
  return MEMORY[0x270F9EFC8]();
}

uint64_t sub_25AF79BF0()
{
  return MEMORY[0x270F9EFE0]();
}

uint64_t sub_25AF79C00()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25AF79C10()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_25AF79C20()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25AF79C30()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25AF79C50()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25AF79C60()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_25AF79C70()
{
  return MEMORY[0x270F9F7C8]();
}

uint64_t sub_25AF79C80()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25AF79C90()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_25AF79CA0()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_25AF79CB0()
{
  return MEMORY[0x270F5A0A8]();
}

uint64_t sub_25AF79CC0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25AF79CD0()
{
  return MEMORY[0x270F9FC90]();
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

void bzero(void *a1, size_t a2)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

uint64_t rdi_os_crash()
{
  return MEMORY[0x270F5A0C0]();
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
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