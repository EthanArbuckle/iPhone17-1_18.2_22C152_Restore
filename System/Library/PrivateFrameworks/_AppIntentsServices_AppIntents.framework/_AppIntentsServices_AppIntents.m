id sub_2627C63C4()
{
  char *v0;

  return IntentToggleOperation.lnValue.getter(*v0);
}

id IntentToggleOperation.lnValue.getter(char a1)
{
  return sub_2627C6520(a1, MEMORY[0x263EFBD10], (SEL *)&selRef_intentToggleOperationValueType);
}

uint64_t sub_2627C63EC(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_2627C698C();
  return MEMORY[0x270F0CBA8](a1, a2, v4);
}

uint64_t sub_2627C6438(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_2627C698C();
  return MEMORY[0x270F0CBC8](a1, a2, a3, v6);
}

id static IntentToggleOperation.lnValueType.getter()
{
  return sub_2627C6650((SEL *)&selRef_intentToggleOperationValueType);
}

uint64_t sub_2627C64AC(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_2627C698C();
  return MEMORY[0x270F0CBC0](a1, a2, v4);
}

id sub_2627C64F8()
{
  return IntentToggleState.lnValue.getter(*v0);
}

id IntentToggleState.lnValue.getter(char a1)
{
  return sub_2627C6520(a1, MEMORY[0x263EFBA50], (SEL *)&selRef_intentToggleStateValueType);
}

id sub_2627C6520(char a1, void (*a2)(void *__return_ptr, void), SEL *a3)
{
  a2(v7, a1 & 1);
  id v4 = [self *a3];
  id v5 = objc_allocWithZone(MEMORY[0x263F51D50]);
  return sub_2627C66E8(v7, v4);
}

uint64_t sub_2627C6594(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_2627C6940();
  return MEMORY[0x270F0CBA8](a1, a2, v4);
}

uint64_t sub_2627C65E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_2627C6940();
  return MEMORY[0x270F0CBC8](a1, a2, a3, v6);
}

id static IntentToggleState.lnValueType.getter()
{
  return sub_2627C6650((SEL *)&selRef_intentToggleStateValueType);
}

id sub_2627C6650(SEL *a1)
{
  id v1 = [self *a1];
  return v1;
}

uint64_t sub_2627C669C(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_2627C6940();
  return MEMORY[0x270F0CBC0](a1, a2, v4);
}

id sub_2627C66E8(void *a1, void *a2)
{
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  id v5 = objc_msgSend(v2, sel_initWithValue_valueType_, sub_2627C9630(), a2);
  swift_unknownObjectRelease();

  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return v5;
}

unint64_t sub_2627C6764()
{
  unint64_t result = qword_26A95FE20;
  if (!qword_26A95FE20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A95FE20);
  }
  return result;
}

unint64_t sub_2627C67B4()
{
  unint64_t result = qword_26A95FE28;
  if (!qword_26A95FE28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A95FE28);
  }
  return result;
}

unint64_t sub_2627C6804()
{
  unint64_t result = qword_26A95FE30;
  if (!qword_26A95FE30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A95FE30);
  }
  return result;
}

unint64_t sub_2627C6854()
{
  unint64_t result = qword_26A95FE38;
  if (!qword_26A95FE38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A95FE38);
  }
  return result;
}

unint64_t sub_2627C68A4()
{
  unint64_t result = qword_26A95FE40;
  if (!qword_26A95FE40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A95FE40);
  }
  return result;
}

unint64_t sub_2627C68F4()
{
  unint64_t result = qword_26A95FE48;
  if (!qword_26A95FE48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A95FE48);
  }
  return result;
}

unint64_t sub_2627C6940()
{
  unint64_t result = qword_26A95FE50;
  if (!qword_26A95FE50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A95FE50);
  }
  return result;
}

unint64_t sub_2627C698C()
{
  unint64_t result = qword_26A95FE58;
  if (!qword_26A95FE58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A95FE58);
  }
  return result;
}

void *__swift_project_boxed_opaque_existential_0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
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

id StringSearchCriteria.lnValue.getter()
{
  sub_2627C94F0();
  id v0 = objc_msgSend(self, sel_stringValueType);
  id v1 = objc_allocWithZone(MEMORY[0x263F51D50]);
  return sub_2627C66E8(v3, v0);
}

uint64_t sub_2627C6ADC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2627C6E0C(&qword_26A95FE88);
  return MEMORY[0x270F0CBA8](a1, a2, v4);
}

uint64_t static StringSearchCriteria.from(_:context:)@<X0>(uint64_t a1@<X8>)
{
  sub_2627C95D0();
  if (v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A95FE68);
    uint64_t v2 = sub_2627C9500();
    uint64_t v3 = swift_dynamicCast() ^ 1;
    uint64_t v4 = a1;
    uint64_t v5 = v2;
  }
  else
  {
    sub_2627C6CA4((uint64_t)v7);
    uint64_t v5 = sub_2627C9500();
    uint64_t v4 = a1;
    uint64_t v3 = 1;
  }
  return __swift_storeEnumTagSinglePayload(v4, v3, 1, v5);
}

id static StringSearchCriteria.lnValueType.getter()
{
  id v0 = objc_msgSend(self, sel_stringValueType);
  return v0;
}

uint64_t sub_2627C6C3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2627C6E0C(&qword_26A95FE88);
  return MEMORY[0x270F0CBC0](a1, a2, v4);
}

uint64_t sub_2627C6CA4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A95FE60);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
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

uint64_t sub_2627C6D70()
{
  return sub_2627C6E0C(&qword_26A95FE70);
}

uint64_t sub_2627C6DA4()
{
  return sub_2627C6E0C(&qword_26A95FE78);
}

uint64_t sub_2627C6DD8()
{
  return sub_2627C6E0C(&qword_26A95FE80);
}

uint64_t sub_2627C6E0C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_2627C9500();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t _IdentifiableAppEntityRepresentation<>.init<A>(instanceIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2627C9510();
  uint64_t v5 = sub_2627C9530();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a3 - 8) + 8))(a1, a3);
  return v5;
}

uint64_t static _IdentifiableAppEntityRepresentation<>.queryByIdentifier<A>(instanceIdentifiers:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v9[11] = a1;
  v9[6] = a2;
  v9[7] = a3;
  v9[8] = a4;
  v9[9] = a5;
  v9[2] = a2;
  v9[3] = a4;
  v9[4] = a5;
  v9[5] = swift_getKeyPath();
  uint64_t v5 = sub_2627C9580();
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_2627C7084((void (*)(char *, char *))sub_2627C7058, (uint64_t)v9, v5, MEMORY[0x263F8D310], MEMORY[0x263F8E628], WitnessTable, MEMORY[0x263F8E658], v7);
  swift_release();
  sub_2627C9520();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2627C7000@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2627C9510();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2627C7040()
{
  return 32;
}

__n128 sub_2627C704C(uint64_t a1, _OWORD *a2)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 16);
  *a2 = *(_OWORD *)a1;
  a2[1] = v3;
  return result;
}

uint64_t sub_2627C7058()
{
  return swift_getAtKeyPath();
}

uint64_t sub_2627C7084(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v34 = a5;
  uint64_t v35 = a8;
  v44 = a1;
  uint64_t v45 = a2;
  uint64_t v33 = *(void *)(a5 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v46 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v39 = *(void (***)(char *, uint64_t))(AssociatedTypeWitness - 8);
  uint64_t v10 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v12 = (char *)&v31 - v11;
  MEMORY[0x270FA5388](v10);
  v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = swift_getAssociatedTypeWitness();
  uint64_t v36 = *(void *)(v15 - 8);
  uint64_t v37 = v15;
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  v32 = (char *)&v31 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  v19 = (char *)&v31 - v18;
  uint64_t v20 = sub_2627C95A0();
  if (!v20) {
    return sub_2627C9570();
  }
  uint64_t v21 = v20;
  uint64_t v49 = sub_2627C9610();
  uint64_t v38 = sub_2627C9620();
  sub_2627C95F0();
  uint64_t v42 = a6;
  uint64_t result = sub_2627C9590();
  if (v21 < 0)
  {
    __break(1u);
  }
  else
  {
    v40 = (void (**)(char *))(v39 + 2);
    v41 = v14;
    ++v39;
    while (1)
    {
      v23 = (void (*)(char *, void))sub_2627C95C0();
      v24 = v12;
      v25 = v12;
      uint64_t v26 = AssociatedTypeWitness;
      (*v40)(v24);
      v23(v48, 0);
      uint64_t v27 = v47;
      v44(v25, v46);
      if (v27) {
        break;
      }
      uint64_t v47 = 0;
      (*v39)(v25, v26);
      sub_2627C9600();
      sub_2627C95B0();
      --v21;
      v12 = v25;
      if (!v21)
      {
        uint64_t v28 = v36;
        uint64_t v29 = v37;
        v30 = v32;
        (*(void (**)(char *, char *, uint64_t))(v36 + 32))(v32, v19, v37);
        sub_2627C95E0();
        (*(void (**)(char *, uint64_t))(v28 + 8))(v30, v29);
        return v49;
      }
    }
    (*v39)(v25, v26);
    (*(void (**)(char *, uint64_t))(v36 + 8))(v19, v37);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v33 + 32))(v35, v46, v34);
  }
  return result;
}

id IntentApplication.lnValue.getter()
{
  return sub_2627C8620(MEMORY[0x263EFBA18], (SEL *)&selRef_applicationValueType);
}

uint64_t sub_2627C751C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2627C9488(&qword_26A960048, MEMORY[0x263EFBA20]);
  return MEMORY[0x270F0CBA8](a1, a2, v4);
}

uint64_t static IntentApplication.from(_:context:)@<X0>(uint64_t a1@<X8>)
{
  return sub_2627C8728(MEMORY[0x263EFBA20], a1);
}

id static IntentApplication.lnValueType.getter()
{
  return sub_2627C87F0((SEL *)&selRef_applicationValueType);
}

uint64_t sub_2627C75C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2627C9488(&qword_26A960048, MEMORY[0x263EFBA20]);
  return MEMORY[0x270F0CBC0](a1, a2, v4);
}

id IntentCalendarEvent.lnValue.getter()
{
  return sub_2627C8620(MEMORY[0x263EFBB48], (SEL *)&selRef_calendarEventValueType);
}

uint64_t sub_2627C7664(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2627C9488(&qword_26A960040, MEMORY[0x263EFBB50]);
  return MEMORY[0x270F0CBA8](a1, a2, v4);
}

uint64_t static IntentCalendarEvent.from(_:context:)@<X0>(uint64_t a1@<X8>)
{
  return sub_2627C8728(MEMORY[0x263EFBB50], a1);
}

id static IntentCalendarEvent.lnValueType.getter()
{
  return sub_2627C87F0((SEL *)&selRef_calendarEventValueType);
}

uint64_t sub_2627C770C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2627C9488(&qword_26A960040, MEMORY[0x263EFBB50]);
  return MEMORY[0x270F0CBC0](a1, a2, v4);
}

id IntentCurrencyAmount.lnValue.getter()
{
  return sub_2627C8620(MEMORY[0x263EFBC40], (SEL *)&selRef_currencyAmountValueType);
}

uint64_t sub_2627C77AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2627C9488(&qword_26A960038, MEMORY[0x263EFBC48]);
  return MEMORY[0x270F0CBA8](a1, a2, v4);
}

uint64_t static IntentCurrencyAmount.from(_:context:)@<X0>(uint64_t a1@<X8>)
{
  return sub_2627C8728(MEMORY[0x263EFBC48], a1);
}

id static IntentCurrencyAmount.lnValueType.getter()
{
  return sub_2627C87F0((SEL *)&selRef_currencyAmountValueType);
}

uint64_t sub_2627C7854(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2627C9488(&qword_26A960038, MEMORY[0x263EFBC48]);
  return MEMORY[0x270F0CBC0](a1, a2, v4);
}

id IntentEnvironment.lnValue.getter()
{
  sub_2627C94E0();
  sub_2627C94D0();
  id v0 = objc_msgSend(self, sel_environmentValueType);
  id v1 = objc_allocWithZone(MEMORY[0x263F51D50]);
  return sub_2627C66E8(v3, v0);
}

uint64_t sub_2627C7950(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2627C9488(&qword_26A960030, MEMORY[0x263EFBA38]);
  return MEMORY[0x270F0CBA8](a1, a2, v4);
}

uint64_t static IntentEnvironment.from(_:context:)@<X0>(uint64_t a1@<X8>)
{
  return sub_2627C8728(MEMORY[0x263EFBA38], a1);
}

id static IntentEnvironment.lnValueType.getter()
{
  return sub_2627C87F0((SEL *)&selRef_environmentValueType);
}

uint64_t sub_2627C79F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2627C9488(&qword_26A960030, MEMORY[0x263EFBA38]);
  return MEMORY[0x270F0CBC0](a1, a2, v4);
}

id IntentMediaItem.lnValue.getter()
{
  return sub_2627C8620(MEMORY[0x263EFB940], (SEL *)&selRef_mediaItemValueType);
}

uint64_t sub_2627C7A98(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2627C9488(&qword_26A960028, MEMORY[0x263EFB948]);
  return MEMORY[0x270F0CBA8](a1, a2, v4);
}

uint64_t static IntentMediaItem.from(_:context:)@<X0>(uint64_t a1@<X8>)
{
  return sub_2627C8728(MEMORY[0x263EFB948], a1);
}

id static IntentMediaItem.lnValueType.getter()
{
  return sub_2627C87F0((SEL *)&selRef_mediaItemValueType);
}

uint64_t sub_2627C7B40(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2627C9488(&qword_26A960028, MEMORY[0x263EFB948]);
  return MEMORY[0x270F0CBC0](a1, a2, v4);
}

id IntentMediaSearch.lnValue.getter()
{
  return sub_2627C8620(MEMORY[0x263EFBA40], (SEL *)&selRef_mediaSearchValueType);
}

uint64_t sub_2627C7BE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2627C9488(&qword_26A960020, MEMORY[0x263EFBA48]);
  return MEMORY[0x270F0CBA8](a1, a2, v4);
}

uint64_t static IntentMediaSearch.from(_:context:)@<X0>(uint64_t a1@<X8>)
{
  return sub_2627C8728(MEMORY[0x263EFBA48], a1);
}

id static IntentMediaSearch.lnValueType.getter()
{
  return sub_2627C87F0((SEL *)&selRef_mediaSearchValueType);
}

uint64_t sub_2627C7C88(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2627C9488(&qword_26A960020, MEMORY[0x263EFBA48]);
  return MEMORY[0x270F0CBC0](a1, a2, v4);
}

id IntentMessageConversation.lnValue.getter()
{
  return sub_2627C8620(MEMORY[0x263EFBE30], (SEL *)&selRef_messageConversationValueType);
}

uint64_t sub_2627C7D28(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2627C9488(&qword_26A960018, MEMORY[0x263EFBE38]);
  return MEMORY[0x270F0CBA8](a1, a2, v4);
}

uint64_t static IntentMessageConversation.from(_:context:)@<X0>(uint64_t a1@<X8>)
{
  return sub_2627C8728(MEMORY[0x263EFBE38], a1);
}

id static IntentMessageConversation.lnValueType.getter()
{
  return sub_2627C87F0((SEL *)&selRef_messageConversationValueType);
}

uint64_t sub_2627C7DD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2627C9488(&qword_26A960018, MEMORY[0x263EFBE38]);
  return MEMORY[0x270F0CBC0](a1, a2, v4);
}

id IntentNote.lnValue.getter()
{
  return sub_2627C8620(MEMORY[0x263EFB750], (SEL *)&selRef_noteValueType);
}

uint64_t sub_2627C7E70(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2627C9488(&qword_26A960010, MEMORY[0x263EFB758]);
  return MEMORY[0x270F0CBA8](a1, a2, v4);
}

uint64_t static IntentNote.from(_:context:)@<X0>(uint64_t a1@<X8>)
{
  return sub_2627C8728(MEMORY[0x263EFB758], a1);
}

id static IntentNote.lnValueType.getter()
{
  return sub_2627C87F0((SEL *)&selRef_noteValueType);
}

uint64_t sub_2627C7F18(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2627C9488(&qword_26A960010, MEMORY[0x263EFB758]);
  return MEMORY[0x270F0CBC0](a1, a2, v4);
}

id IntentNotification.lnValue.getter()
{
  return sub_2627C8620(MEMORY[0x263EFBAE0], (SEL *)&selRef_notificationValueType);
}

uint64_t sub_2627C7FB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2627C9488(&qword_26A960008, MEMORY[0x263EFBAE8]);
  return MEMORY[0x270F0CBA8](a1, a2, v4);
}

uint64_t static IntentNotification.from(_:context:)@<X0>(uint64_t a1@<X8>)
{
  return sub_2627C8728(MEMORY[0x263EFBAE8], a1);
}

id static IntentNotification.lnValueType.getter()
{
  return sub_2627C87F0((SEL *)&selRef_notificationValueType);
}

uint64_t sub_2627C8060(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2627C9488(&qword_26A960008, MEMORY[0x263EFBAE8]);
  return MEMORY[0x270F0CBC0](a1, a2, v4);
}

id IntentPaymentMethod.lnValue.getter()
{
  return sub_2627C8620(MEMORY[0x263EFBB58], (SEL *)&selRef_paymentMethodValueType);
}

uint64_t sub_2627C8100(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2627C9488(&qword_26A960000, MEMORY[0x263EFBB60]);
  return MEMORY[0x270F0CBA8](a1, a2, v4);
}

uint64_t static IntentPaymentMethod.from(_:context:)@<X0>(uint64_t a1@<X8>)
{
  return sub_2627C8728(MEMORY[0x263EFBB60], a1);
}

id static IntentPaymentMethod.lnValueType.getter()
{
  return sub_2627C87F0((SEL *)&selRef_paymentMethodValueType);
}

uint64_t sub_2627C81A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2627C9488(&qword_26A960000, MEMORY[0x263EFBB60]);
  return MEMORY[0x270F0CBC0](a1, a2, v4);
}

id IntentPerson.lnValue.getter()
{
  return sub_2627C8620(MEMORY[0x263EFB7D0], (SEL *)&selRef_personValueType);
}

uint64_t sub_2627C8248(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2627C9488(&qword_26A95FFF8, MEMORY[0x263EFB828]);
  return MEMORY[0x270F0CBA8](a1, a2, v4);
}

uint64_t static IntentPerson.from(_:context:)@<X0>(uint64_t a1@<X8>)
{
  return sub_2627C8728(MEMORY[0x263EFB828], a1);
}

id static IntentPerson.lnValueType.getter()
{
  return sub_2627C87F0((SEL *)&selRef_personValueType);
}

uint64_t sub_2627C82F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2627C9488(&qword_26A95FFF8, MEMORY[0x263EFB828]);
  return MEMORY[0x270F0CBC0](a1, a2, v4);
}

id IntentReminderTask.lnValue.getter()
{
  return sub_2627C8620(MEMORY[0x263EFBAF0], (SEL *)&selRef_taskValueType);
}

uint64_t sub_2627C8390(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2627C9488(&qword_26A95FFF0, MEMORY[0x263EFBAF8]);
  return MEMORY[0x270F0CBA8](a1, a2, v4);
}

uint64_t static IntentReminderTask.from(_:context:)@<X0>(uint64_t a1@<X8>)
{
  return sub_2627C8728(MEMORY[0x263EFBAF8], a1);
}

id static IntentReminderTask.lnValueType.getter()
{
  return sub_2627C87F0((SEL *)&selRef_taskValueType);
}

uint64_t sub_2627C8438(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2627C9488(&qword_26A95FFF0, MEMORY[0x263EFBAF8]);
  return MEMORY[0x270F0CBC0](a1, a2, v4);
}

id IntentReminderTaskList.lnValue.getter()
{
  return sub_2627C8620(MEMORY[0x263EFBD60], (SEL *)&selRef_taskListValueType);
}

uint64_t sub_2627C84D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2627C9488(&qword_26A95FFE8, MEMORY[0x263EFBD68]);
  return MEMORY[0x270F0CBA8](a1, a2, v4);
}

uint64_t static IntentReminderTaskList.from(_:context:)@<X0>(uint64_t a1@<X8>)
{
  return sub_2627C8728(MEMORY[0x263EFBD68], a1);
}

id static IntentReminderTaskList.lnValueType.getter()
{
  return sub_2627C87F0((SEL *)&selRef_taskListValueType);
}

uint64_t sub_2627C8580(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2627C9488(&qword_26A95FFE8, MEMORY[0x263EFBD68]);
  return MEMORY[0x270F0CBC0](a1, a2, v4);
}

id IntentTimer.lnValue.getter()
{
  return sub_2627C8620(MEMORY[0x263EFB790], (SEL *)&selRef_timerValueType);
}

id sub_2627C8620(void (*a1)(void *__return_ptr), SEL *a2)
{
  a1(v6);
  id v3 = [self *a2];
  id v4 = objc_allocWithZone(MEMORY[0x263F51D50]);
  return sub_2627C66E8(v6, v3);
}

uint64_t sub_2627C8690(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2627C9488(&qword_26A95FFE0, MEMORY[0x263EFB798]);
  return MEMORY[0x270F0CBA8](a1, a2, v4);
}

uint64_t static IntentTimer.from(_:context:)@<X0>(uint64_t a1@<X8>)
{
  return sub_2627C8728(MEMORY[0x263EFB798], a1);
}

uint64_t sub_2627C8728@<X0>(uint64_t (*a1)(void)@<X2>, uint64_t a2@<X8>)
{
  sub_2627C95D0();
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A95FE68);
    uint64_t v4 = a1(0);
    uint64_t v5 = swift_dynamicCast() ^ 1;
    uint64_t v6 = a2;
    uint64_t v7 = v4;
  }
  else
  {
    sub_2627C6CA4((uint64_t)v9);
    uint64_t v7 = a1(0);
    uint64_t v6 = a2;
    uint64_t v5 = 1;
  }
  return __swift_storeEnumTagSinglePayload(v6, v5, 1, v7);
}

id static IntentTimer.lnValueType.getter()
{
  return sub_2627C87F0((SEL *)&selRef_timerValueType);
}

id sub_2627C87F0(SEL *a1)
{
  id v1 = [self *a1];
  return v1;
}

uint64_t sub_2627C883C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2627C9488(&qword_26A95FFE0, MEMORY[0x263EFB798]);
  return MEMORY[0x270F0CBC0](a1, a2, v4);
}

uint64_t sub_2627C88B8()
{
  return sub_2627C9488(&qword_26A95FE90, MEMORY[0x263EFBA20]);
}

uint64_t sub_2627C8900()
{
  return sub_2627C9488(&qword_26A95FE98, MEMORY[0x263EFBA20]);
}

uint64_t sub_2627C8948()
{
  return sub_2627C9488(&qword_26A95FEA0, MEMORY[0x263EFBA20]);
}

uint64_t sub_2627C8990()
{
  return sub_2627C9488(&qword_26A95FEA8, MEMORY[0x263EFBB50]);
}

uint64_t sub_2627C89D8()
{
  return sub_2627C9488(&qword_26A95FEB0, MEMORY[0x263EFBB50]);
}

uint64_t sub_2627C8A20()
{
  return sub_2627C9488(&qword_26A95FEB8, MEMORY[0x263EFBB50]);
}

uint64_t sub_2627C8A68()
{
  return sub_2627C9488(&qword_26A95FEC0, MEMORY[0x263EFBC48]);
}

uint64_t sub_2627C8AB0()
{
  return sub_2627C9488(&qword_26A95FEC8, MEMORY[0x263EFBC48]);
}

uint64_t sub_2627C8AF8()
{
  return sub_2627C9488(&qword_26A95FED0, MEMORY[0x263EFBC48]);
}

uint64_t sub_2627C8B40()
{
  return sub_2627C9488(&qword_26A95FED8, MEMORY[0x263EFBA38]);
}

uint64_t sub_2627C8B88()
{
  return sub_2627C9488(&qword_26A95FEE0, MEMORY[0x263EFBA38]);
}

uint64_t sub_2627C8BD0()
{
  return sub_2627C9488(&qword_26A95FEE8, MEMORY[0x263EFBA38]);
}

uint64_t sub_2627C8C18()
{
  return sub_2627C9488(&qword_26A95FEF0, MEMORY[0x263EFB948]);
}

uint64_t sub_2627C8C60()
{
  return sub_2627C9488(&qword_26A95FEF8, MEMORY[0x263EFB948]);
}

uint64_t sub_2627C8CA8()
{
  return sub_2627C9488(&qword_26A95FF00, MEMORY[0x263EFB948]);
}

uint64_t sub_2627C8CF0()
{
  return sub_2627C9488(&qword_26A95FF08, MEMORY[0x263EFBA48]);
}

uint64_t sub_2627C8D38()
{
  return sub_2627C9488(&qword_26A95FF10, MEMORY[0x263EFBA48]);
}

uint64_t sub_2627C8D80()
{
  return sub_2627C9488(&qword_26A95FF18, MEMORY[0x263EFBA48]);
}

uint64_t sub_2627C8DC8()
{
  return sub_2627C9488(&qword_26A95FF20, MEMORY[0x263EFBE38]);
}

uint64_t sub_2627C8E10()
{
  return sub_2627C9488(&qword_26A95FF28, MEMORY[0x263EFBE38]);
}

uint64_t sub_2627C8E58()
{
  return sub_2627C9488(&qword_26A95FF30, MEMORY[0x263EFBE38]);
}

uint64_t sub_2627C8EA0()
{
  return sub_2627C9488(&qword_26A95FF38, MEMORY[0x263EFB758]);
}

uint64_t sub_2627C8EE8()
{
  return sub_2627C9488(&qword_26A95FF40, MEMORY[0x263EFB758]);
}

uint64_t sub_2627C8F30()
{
  return sub_2627C9488(&qword_26A95FF48, MEMORY[0x263EFB758]);
}

uint64_t sub_2627C8F78()
{
  return sub_2627C9488(&qword_26A95FF50, MEMORY[0x263EFBAE8]);
}

uint64_t sub_2627C8FC0()
{
  return sub_2627C9488(&qword_26A95FF58, MEMORY[0x263EFBAE8]);
}

uint64_t sub_2627C9008()
{
  return sub_2627C9488(&qword_26A95FF60, MEMORY[0x263EFBAE8]);
}

uint64_t sub_2627C9050()
{
  return sub_2627C9488(&qword_26A95FF68, MEMORY[0x263EFBB60]);
}

uint64_t sub_2627C9098()
{
  return sub_2627C9488(&qword_26A95FF70, MEMORY[0x263EFBB60]);
}

uint64_t sub_2627C90E0()
{
  return sub_2627C9488(&qword_26A95FF78, MEMORY[0x263EFBB60]);
}

uint64_t sub_2627C9128()
{
  return sub_2627C9488(&qword_26A95FF80, MEMORY[0x263EFB828]);
}

uint64_t sub_2627C9170()
{
  return sub_2627C9488(&qword_26A95FF88, MEMORY[0x263EFB828]);
}

uint64_t sub_2627C91B8()
{
  return sub_2627C9488(&qword_26A95FF90, MEMORY[0x263EFB828]);
}

uint64_t sub_2627C9200()
{
  return sub_2627C9488(&qword_26A95FF98, MEMORY[0x263EFBAF8]);
}

uint64_t sub_2627C9248()
{
  return sub_2627C9488(&qword_26A95FFA0, MEMORY[0x263EFBAF8]);
}

uint64_t sub_2627C9290()
{
  return sub_2627C9488(&qword_26A95FFA8, MEMORY[0x263EFBAF8]);
}

uint64_t sub_2627C92D8()
{
  return sub_2627C9488(&qword_26A95FFB0, MEMORY[0x263EFBD68]);
}

uint64_t sub_2627C9320()
{
  return sub_2627C9488(&qword_26A95FFB8, MEMORY[0x263EFBD68]);
}

uint64_t sub_2627C9368()
{
  return sub_2627C9488(&qword_26A95FFC0, MEMORY[0x263EFBD68]);
}

uint64_t sub_2627C93B0()
{
  return sub_2627C9488(&qword_26A95FFC8, MEMORY[0x263EFB798]);
}

uint64_t sub_2627C93F8()
{
  return sub_2627C9488(&qword_26A95FFD0, MEMORY[0x263EFB798]);
}

uint64_t sub_2627C9440()
{
  return sub_2627C9488(&qword_26A95FFD8, MEMORY[0x263EFB798]);
}

uint64_t sub_2627C9488(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2627C94D0()
{
  return MEMORY[0x270EE1138]();
}

uint64_t sub_2627C94E0()
{
  return MEMORY[0x270EE15A8]();
}

uint64_t sub_2627C94F0()
{
  return MEMORY[0x270EE1848]();
}

uint64_t sub_2627C9500()
{
  return MEMORY[0x270EE1868]();
}

uint64_t sub_2627C9510()
{
  return MEMORY[0x270EE1D38]();
}

uint64_t sub_2627C9520()
{
  return MEMORY[0x270F0C7F0]();
}

uint64_t sub_2627C9530()
{
  return MEMORY[0x270F0C7F8]();
}

uint64_t sub_2627C9570()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_2627C9580()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_2627C9590()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_2627C95A0()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_2627C95B0()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_2627C95C0()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_2627C95D0()
{
  return MEMORY[0x270EE1F38]();
}

uint64_t sub_2627C95E0()
{
  return MEMORY[0x270F9E890]();
}

uint64_t sub_2627C95F0()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_2627C9600()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_2627C9610()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_2627C9620()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t sub_2627C9630()
{
  return MEMORY[0x270F9F7C0]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}