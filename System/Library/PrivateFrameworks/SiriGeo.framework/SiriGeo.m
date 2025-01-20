id INPerson.hasHandleLabel.getter()
{
  void *v0;
  id result;
  void *v2;
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  result = objc_msgSend(v0, sel_personHandle);
  if (result)
  {
    v2 = result;
    v3 = objc_msgSend(result, sel_label);

    if (v3)
    {
      v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v6 = v5;

      swift_bridgeObjectRelease();
      v7 = HIBYTE(v6) & 0xF;
      if ((v6 & 0x2000000000000000) == 0) {
        v7 = v4 & 0xFFFFFFFFFFFFLL;
      }
      return (id)(v7 != 0);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

id INPerson.hasHandleValue.getter()
{
  id result = objc_msgSend(v0, sel_personHandle);
  if (result)
  {
    v2 = result;
    id v3 = objc_msgSend(result, sel_value);

    if (v3)
    {
      uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v6 = v5;

      swift_bridgeObjectRelease();
      uint64_t v7 = HIBYTE(v6) & 0xF;
      if ((v6 & 0x2000000000000000) == 0) {
        uint64_t v7 = v4 & 0xFFFFFFFFFFFFLL;
      }
      return (id)(v7 != 0);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t INPerson.hasUsefulHandleValue.getter()
{
  v1 = v0;
  uint64_t v2 = type metadata accessor for ContactHandle.HandleType();
  uint64_t v3 = *(void *)(v2 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  unint64_t v5 = (char *)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (ContactHandle.HandleType?, ContactHandle.HandleType?));
  ((void (*)(void))MEMORY[0x270FA5388])();
  v8 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ContactHandle.HandleType?);
  uint64_t v9 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v44 = (uint64_t)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  v13 = (char *)&v41 - v12;
  MEMORY[0x270FA5388](v11);
  v15 = (char *)&v41 - v14;
  id v16 = objc_msgSend(v1, sel_personHandle);
  if (!v16) {
    goto LABEL_18;
  }
  v17 = v16;
  v42 = v5;
  v43 = v8;
  uint64_t v18 = v3;
  id v19 = objc_msgSend(v16, sel_value);

  if (!v19) {
    goto LABEL_18;
  }
  uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v22 = v21;

  swift_bridgeObjectRelease();
  uint64_t v23 = HIBYTE(v22) & 0xF;
  if ((v22 & 0x2000000000000000) == 0) {
    uint64_t v23 = v20 & 0xFFFFFFFFFFFFLL;
  }
  if (v23)
  {
    id v24 = objc_msgSend(v1, sel_personHandle);
    v25 = (unsigned int *)MEMORY[0x263F6D330];
    if (v24)
    {
      v26 = v24;
      id v27 = objc_msgSend(v24, sel_type);

      uint64_t v28 = v18;
      if (v27 == (id)2)
      {
        v33 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 104);
        v33(v15, *MEMORY[0x263F6D328], v2);
        uint64_t v29 = (uint64_t)v43;
      }
      else
      {
        uint64_t v29 = (uint64_t)v43;
        if (v27 == (id)1) {
          uint64_t v30 = *MEMORY[0x263F6D320];
        }
        else {
          uint64_t v30 = *v25;
        }
        v33 = *(void (**)(char *, uint64_t, uint64_t))(v28 + 104);
        v33(v15, v30, v2);
      }
      v31 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v28 + 56);
      v31(v15, 0, 1, v2);
      v33(v13, *v25, v2);
    }
    else
    {
      uint64_t v28 = v18;
      v31 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56);
      v31(v15, 1, 1, v2);
      v32 = *(void (**)(char *, void, uint64_t))(v18 + 104);
      uint64_t v29 = (uint64_t)v43;
      v32(v13, *v25, v2);
    }
    v31(v13, 0, 1, v2);
    uint64_t v34 = v29 + *(int *)(v6 + 48);
    outlined init with copy of ContactHandle.HandleType?((uint64_t)v15, v29);
    outlined init with copy of ContactHandle.HandleType?((uint64_t)v13, v34);
    v35 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v28 + 48);
    if (v35(v29, 1, v2) == 1)
    {
      outlined destroy of ContactHandle.HandleType?((uint64_t)v13, &demangling cache variable for type metadata for ContactHandle.HandleType?);
      outlined destroy of ContactHandle.HandleType?((uint64_t)v15, &demangling cache variable for type metadata for ContactHandle.HandleType?);
      if (v35(v34, 1, v2) == 1)
      {
        outlined destroy of ContactHandle.HandleType?(v29, &demangling cache variable for type metadata for ContactHandle.HandleType?);
LABEL_18:
        LOBYTE(v23) = 0;
        return v23 & 1;
      }
    }
    else
    {
      uint64_t v37 = v44;
      outlined init with copy of ContactHandle.HandleType?(v29, v44);
      if (v35(v34, 1, v2) != 1)
      {
        v38 = v42;
        (*(void (**)(char *, uint64_t, uint64_t))(v28 + 32))(v42, v34, v2);
        lazy protocol witness table accessor for type ContactHandle.HandleType and conformance ContactHandle.HandleType(&lazy protocol witness table cache variable for type ContactHandle.HandleType and conformance ContactHandle.HandleType, MEMORY[0x263F6D338]);
        char v39 = dispatch thunk of static Equatable.== infix(_:_:)();
        v40 = *(void (**)(char *, uint64_t))(v28 + 8);
        v40(v38, v2);
        outlined destroy of ContactHandle.HandleType?((uint64_t)v13, &demangling cache variable for type metadata for ContactHandle.HandleType?);
        outlined destroy of ContactHandle.HandleType?((uint64_t)v15, &demangling cache variable for type metadata for ContactHandle.HandleType?);
        v40((char *)v37, v2);
        outlined destroy of ContactHandle.HandleType?(v29, &demangling cache variable for type metadata for ContactHandle.HandleType?);
        LOBYTE(v23) = v39 ^ 1;
        return v23 & 1;
      }
      outlined destroy of ContactHandle.HandleType?((uint64_t)v13, &demangling cache variable for type metadata for ContactHandle.HandleType?);
      outlined destroy of ContactHandle.HandleType?((uint64_t)v15, &demangling cache variable for type metadata for ContactHandle.HandleType?);
      (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v37, v2);
    }
    outlined destroy of ContactHandle.HandleType?(v29, &demangling cache variable for type metadata for (ContactHandle.HandleType?, ContactHandle.HandleType?));
    LOBYTE(v23) = 1;
  }
  return v23 & 1;
}

uint64_t INPersonHandleType.toContactHandleType()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (a1 == 2)
  {
    uint64_t v3 = (unsigned int *)MEMORY[0x263F6D328];
  }
  else if (a1 == 1)
  {
    uint64_t v3 = (unsigned int *)MEMORY[0x263F6D320];
  }
  else
  {
    uint64_t v3 = (unsigned int *)MEMORY[0x263F6D330];
    if (!a1)
    {
      uint64_t v4 = *MEMORY[0x263F6D330];
      goto LABEL_8;
    }
  }
  uint64_t v4 = *v3;
LABEL_8:
  uint64_t v5 = type metadata accessor for ContactHandle.HandleType();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 104);

  return v6(a2, v4, v5);
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

uint64_t outlined init with copy of ContactHandle.HandleType?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ContactHandle.HandleType?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void INPerson.encodeBase64.getter()
{
  _StringGuts.grow(_:)(18);
  swift_bridgeObjectRelease();
  id v0 = (id)INIntentSlotValueTransformToContactValue();
  if (v0)
  {
    v1 = v0;
    id v2 = objc_msgSend(v0, sel_data);

    if (v2)
    {
      uint64_t v3 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v5 = v4;

      Swift::String v6 = Data.base64EncodedString(options:)(0);
      outlined consume of Data._Representation(v3, v5);
      String.append(_:)(v6);
      swift_bridgeObjectRelease();
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t outlined consume of Data._Representation(uint64_t a1, unint64_t a2)
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

void INPerson.toContactQueryGeo()()
{
  v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ContactQuery?);
  MEMORY[0x270FA5388](v2 - 8);
  id v27 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for ContactRelationshipQuery?);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v28 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for PersonNameComponents?);
  MEMORY[0x270FA5388](v6 - 8);
  v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for PersonNameComponents();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  v15 = (char *)&v27 - v14;
  ContactQuery.init()();
  id v16 = objc_msgSend(v0, sel_contactIdentifier);
  if (v16)
  {
    v17 = v16;
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  ContactQuery.id.setter();
  id v18 = objc_msgSend(v0, sel_nameComponents);
  if (v18)
  {
    id v19 = v18;
    static PersonNameComponents._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v20 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
    v20(v8, v13, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v8, 0, 1, v9);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) != 1)
    {
      v20(v15, v8, v9);
      PersonNameComponents.namePrefix.getter();
      ContactQuery.namePrefix.setter();
      PersonNameComponents.givenName.getter();
      ContactQuery.givenName.setter();
      PersonNameComponents.middleName.getter();
      ContactQuery.middleName.setter();
      PersonNameComponents.familyName.getter();
      ContactQuery.familyName.setter();
      PersonNameComponents.nameSuffix.getter();
      ContactQuery.nameSuffix.setter();
      PersonNameComponents.nickname.getter();
      ContactQuery.nickname.setter();
      (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
      goto LABEL_8;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
  }
  outlined destroy of ContactHandle.HandleType?((uint64_t)v8, (uint64_t *)&demangling cache variable for type metadata for PersonNameComponents?);
  id v21 = objc_msgSend(v1, sel_displayName);
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  ContactQuery.fullName.setter();
LABEL_8:
  id v22 = objc_msgSend(v1, sel_relationship);
  if (v22)
  {
    uint64_t v23 = v22;
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v24 = type metadata accessor for ContactQuery();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v27, 1, 1, v24);
    v25 = v28;
    ContactRelationshipQuery.init(label:fromContact:)();
    uint64_t v26 = type metadata accessor for ContactRelationshipQuery();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v25, 0, 1, v26);
    ContactQuery.relationship.setter();
  }
}

uint64_t INPersonHandle.toContactHandle()()
{
  v1 = v0;
  uint64_t v2 = type metadata accessor for ContactHandle.HandleType();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_msgSend(v1, sel_type);
  uint64_t v7 = (unsigned int *)MEMORY[0x263F6D328];
  v8 = (unsigned int *)MEMORY[0x263F6D320];
  if (v6 != (id)1) {
    v8 = (unsigned int *)MEMORY[0x263F6D330];
  }
  if (v6 != (id)2) {
    uint64_t v7 = v8;
  }
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *v7, v2);
  id v9 = objc_msgSend(v1, sel_label);
  if (v9)
  {
    uint64_t v10 = one-time initialization token for labelMap;
    id v11 = v9;
    if (v10 != -1) {
      swift_once();
    }
    if (*((void *)static INPersonHandle.labelMap + 2))
    {
      id v12 = v11;
      specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v12);
      if (v13)
      {
        swift_bridgeObjectRetain();

        goto LABEL_14;
      }
    }
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
LABEL_14:
  id v14 = objc_msgSend(v1, sel_value);
  if (v14)
  {
    v15 = v14;
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  return ContactHandle.init(id:type:label:value:isSuggested:)();
}

void *one-time initialization function for labelMap()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(INPersonHandleLabel, String)>);
  uint64_t inited = swift_initStackObject();
  v1 = (void **)MEMORY[0x263F0F7A8];
  *(_OWORD *)(inited + 16) = xmmword_23FEBC660;
  v50 = *v1;
  *(void *)(inited + 32) = *v1;
  uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v3 = (void **)MEMORY[0x263F0F7E0];
  *(void *)(inited + 40) = v2;
  *(void *)(inited + 48) = v4;
  uint64_t v5 = *v3;
  *(void *)(inited + 56) = *v3;
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = (void **)MEMORY[0x263F0F7C8];
  *(void *)(inited + 64) = v6;
  *(void *)(inited + 72) = v8;
  id v9 = *v7;
  *(void *)(inited + 80) = *v7;
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = (void **)MEMORY[0x263F0F7F0];
  *(void *)(inited + 88) = v10;
  *(void *)(inited + 96) = v12;
  char v13 = *v11;
  *(void *)(inited + 104) = *v11;
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v15 = (void **)MEMORY[0x263F0F7C0];
  *(void *)(inited + 112) = v14;
  *(void *)(inited + 120) = v16;
  uint64_t v17 = *v15;
  *(void *)(inited + 128) = *v15;
  uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v19 = (void **)MEMORY[0x263F0F7B8];
  *(void *)(inited + 136) = v18;
  *(void *)(inited + 144) = v20;
  id v21 = *v19;
  *(void *)(inited + 152) = *v19;
  uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v23 = (void **)MEMORY[0x263F0F7B0];
  *(void *)(inited + 160) = v22;
  *(void *)(inited + 168) = v24;
  v25 = *v23;
  *(void *)(inited + 176) = *v23;
  uint64_t v26 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v27 = (void **)MEMORY[0x263F0F7E8];
  *(void *)(inited + 184) = v26;
  *(void *)(inited + 192) = v28;
  uint64_t v29 = *v27;
  *(void *)(inited + 200) = *v27;
  uint64_t v30 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v31 = (void **)MEMORY[0x263F0F7D0];
  *(void *)(inited + 208) = v30;
  *(void *)(inited + 216) = v32;
  v33 = *v31;
  *(void *)(inited + 224) = *v31;
  uint64_t v34 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v35 = (void **)MEMORY[0x263F0F7D8];
  *(void *)(inited + 232) = v34;
  *(void *)(inited + 240) = v36;
  uint64_t v37 = *v35;
  *(void *)(inited + 248) = *v35;
  *(void *)(inited + 256) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 264) = v38;
  id v39 = v50;
  id v40 = v5;
  id v41 = v9;
  id v42 = v13;
  id v43 = v17;
  id v44 = v21;
  id v45 = v25;
  id v46 = v29;
  id v47 = v33;
  id v48 = v37;
  uint64_t result = (void *)specialized Dictionary.init(dictionaryLiteral:)(inited);
  static INPersonHandle.labelMap = result;
  return result;
}

unint64_t specialized Dictionary.init(dictionaryLiteral:)(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<INPersonHandleLabel, String>);
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 1);
    uint64_t v6 = *v4;
    id v7 = (id)*(v4 - 2);
    swift_bridgeObjectRetain();
    unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v7);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(void *)(v2[6] + 8 * result) = v7;
    uint64_t v10 = (void *)(v2[7] + 16 * result);
    *uint64_t v10 = v5;
    v10[1] = v6;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 3;
    v2[2] = v13;
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

uint64_t variable initialization expression of INDeleteParkingLocationIntentHandler.logObject()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t variable initialization expression of ContactService.logObject()
{
  return OS_os_log.init(subsystem:category:)();
}

id variable initialization expression of ContactService.store()
{
  id v0 = objc_allocWithZone(MEMORY[0x263EFEA58]);

  return objc_msgSend(v0, sel_init);
}

uint64_t variable initialization expression of ContactService.mapsService()
{
  return variable initialization expression of ContactService.mapsService((void (*)(void))type metadata accessor for MapsService, MapsService.init());
}

uint64_t variable initialization expression of EnhancedMSPSharedTripContact.textMessageServiceName()
{
  return 0;
}

uint64_t default argument 1 of EnhancedMSPSharedTripContact.init(_:_:)()
{
  return 0;
}

uint64_t variable initialization expression of MapsService.logObject()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t variable initialization expression of MapsService.timeout()
{
  return 5;
}

uint64_t variable initialization expression of MapsService.observer()
{
  return 0;
}

uint64_t variable initialization expression of MapsService.CapabilityFetcherObserver.logObject()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t variable initialization expression of MapsService.CapabilityFetcherObserver.timeout()
{
  return 5;
}

uint64_t variable initialization expression of MapsService.CapabilityFetcherObserver.completion()
{
  return 0;
}

uint64_t variable initialization expression of MapsService.CapabilityFetcherObserver.capabilities()
{
  return MEMORY[0x263F8EE78];
}

uint64_t variable initialization expression of INShareETAIntentHandler.logObject()
{
  return OS_os_log.init(subsystem:category:)();
}

double variable initialization expression of INShareETAIntentHandler.sharedTripContact@<D0>(_OWORD *a1@<X8>)
{
  double result = 0.0;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  return result;
}

uint64_t variable initialization expression of INShareETAIntentHandler.contactService()
{
  return variable initialization expression of ContactService.mapsService((void (*)(void))type metadata accessor for ContactService, (uint64_t (*)(void))ContactService.init());
}

uint64_t variable initialization expression of INStopShareETAIntentHandler.logObject()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t variable initialization expression of INStopShareETAIntentHandler.contactService()
{
  return variable initialization expression of ContactService.mapsService((void (*)(void))type metadata accessor for ContactService, (uint64_t (*)(void))ContactService.init());
}

uint64_t variable initialization expression of ContactService.mapsService(void (*a1)(void), uint64_t (*a2)(void))
{
  return a2();
}

uint64_t variable initialization expression of INStopShareETAIntentHandler.sharedTripContact()
{
  return 0;
}

uint64_t variable initialization expression of INRetrieveParkingLocationIntentHandler.logObject()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t variable initialization expression of INSaveParkingLocationIntentHandler.logObject()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t variable initialization expression of INSaveParkingLocationIntentHandler.completion()
{
  return 0;
}

uint64_t protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance INPersonHandleLabel(uint64_t a1, uint64_t a2)
{
  return protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance INPersonHandleLabel(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance INPersonHandleLabel(uint64_t a1, id *a2)
{
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance INPersonHandleLabel(uint64_t a1, id *a2)
{
  char v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance INPersonHandleLabel@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v3 = MEMORY[0x2455DADE0](v2);
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v3;
  return result;
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance INPersonHandleLabel(uint64_t a1, uint64_t a2)
{
  return protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance INPersonHandleLabel(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance INPersonHandleLabel(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t protocol witness for Hashable.hash(into:) in conformance INPersonHandleLabel()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance INPersonHandleLabel()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

void *protocol witness for OptionSet.init(rawValue:) in conformance INShareETAMediumOptions@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance CLAccuracyAuthorization(void *a1, void *a2)
{
  return *a1 == *a2;
}

id protocol witness for _BridgedStoredNSError._nsError.getter in conformance related decl 'e' for AFLocationServiceErrorCode()
{
  return *v0;
}

uint64_t protocol witness for _BridgedStoredNSError.init(_nsError:) in conformance related decl 'e' for AFLocationServiceErrorCode@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance INPersonHandleLabel()
{
  uint64_t v0 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v2 = v1;
  if (v0 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

void *protocol witness for SetAlgebra.intersection(_:) in conformance INShareETAMediumOptions@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *protocol witness for SetAlgebra.formUnion(_:) in conformance INShareETAMediumOptions(void *result)
{
  *v1 |= *result;
  return result;
}

void *protocol witness for SetAlgebra.formIntersection(_:) in conformance INShareETAMediumOptions(void *result)
{
  *v1 &= *result;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance CLAccuracyAuthorization(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t protocol witness for static CustomNSError.errorDomain.getter in conformance related decl 'e' for AFLocationServiceErrorCode()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t protocol witness for CustomNSError.errorCode.getter in conformance related decl 'e' for AFLocationServiceErrorCode(uint64_t a1)
{
  uint64_t v2 = lazy protocol witness table accessor for type ContactHandle.HandleType and conformance ContactHandle.HandleType(&lazy protocol witness table cache variable for type related decl 'e' for AFLocationServiceErrorCode and conformance related decl 'e' for AFLocationServiceErrorCode, type metadata accessor for related decl 'e' for AFLocationServiceErrorCode);

  return MEMORY[0x270EEF7E8](a1, v2);
}

uint64_t protocol witness for CustomNSError.errorUserInfo.getter in conformance related decl 'e' for AFLocationServiceErrorCode(uint64_t a1)
{
  uint64_t v2 = lazy protocol witness table accessor for type ContactHandle.HandleType and conformance ContactHandle.HandleType(&lazy protocol witness table cache variable for type related decl 'e' for AFLocationServiceErrorCode and conformance related decl 'e' for AFLocationServiceErrorCode, type metadata accessor for related decl 'e' for AFLocationServiceErrorCode);

  return MEMORY[0x270EEF7A0](a1, v2);
}

uint64_t protocol witness for _ObjectiveCBridgeableError.init(_bridgedNSError:) in conformance related decl 'e' for AFLocationServiceErrorCode(void *a1, uint64_t a2)
{
  uint64_t v4 = lazy protocol witness table accessor for type ContactHandle.HandleType and conformance ContactHandle.HandleType(&lazy protocol witness table cache variable for type related decl 'e' for AFLocationServiceErrorCode and conformance related decl 'e' for AFLocationServiceErrorCode, type metadata accessor for related decl 'e' for AFLocationServiceErrorCode);
  id v5 = a1;

  return MEMORY[0x270EEF790](v5, a2, v4);
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance related decl 'e' for AFLocationServiceErrorCode()
{
  id v1 = *v0;
  uint64_t v2 = NSObject.hashValue.getter();

  return v2;
}

uint64_t protocol witness for Hashable.hash(into:) in conformance related decl 'e' for AFLocationServiceErrorCode(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = lazy protocol witness table accessor for type ContactHandle.HandleType and conformance ContactHandle.HandleType(&lazy protocol witness table cache variable for type related decl 'e' for AFLocationServiceErrorCode and conformance related decl 'e' for AFLocationServiceErrorCode, type metadata accessor for related decl 'e' for AFLocationServiceErrorCode);

  return MEMORY[0x270EEF7D0](a1, a2, v4);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance related decl 'e' for AFLocationServiceErrorCode()
{
  return Hasher._finalize()();
}

void *protocol witness for RawRepresentable.init(rawValue:) in conformance AFLocationServiceErrorCode@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance INPersonHandleLabel@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = MEMORY[0x2455DADE0](*a1, a1[1]);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance INPersonHandleLabel@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t protocol witness for _HasCustomAnyHashableRepresentation._toCustomAnyHashable() in conformance INPersonHandleLabel(uint64_t a1)
{
  uint64_t v2 = lazy protocol witness table accessor for type ContactHandle.HandleType and conformance ContactHandle.HandleType(&lazy protocol witness table cache variable for type INPersonHandleLabel and conformance INPersonHandleLabel, type metadata accessor for INPersonHandleLabel);
  uint64_t v3 = lazy protocol witness table accessor for type ContactHandle.HandleType and conformance ContactHandle.HandleType((unint64_t *)&lazy protocol witness table cache variable for type INPersonHandleLabel and conformance INPersonHandleLabel, type metadata accessor for INPersonHandleLabel);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t protocol witness for Error._domain.getter in conformance related decl 'e' for AFLocationServiceErrorCode(uint64_t a1)
{
  uint64_t v2 = lazy protocol witness table accessor for type ContactHandle.HandleType and conformance ContactHandle.HandleType(&lazy protocol witness table cache variable for type related decl 'e' for AFLocationServiceErrorCode and conformance related decl 'e' for AFLocationServiceErrorCode, type metadata accessor for related decl 'e' for AFLocationServiceErrorCode);

  return MEMORY[0x270EF2670](a1, v2);
}

uint64_t protocol witness for Error._code.getter in conformance related decl 'e' for AFLocationServiceErrorCode(uint64_t a1)
{
  uint64_t v2 = lazy protocol witness table accessor for type ContactHandle.HandleType and conformance ContactHandle.HandleType(&lazy protocol witness table cache variable for type related decl 'e' for AFLocationServiceErrorCode and conformance related decl 'e' for AFLocationServiceErrorCode, type metadata accessor for related decl 'e' for AFLocationServiceErrorCode);

  return MEMORY[0x270EF2668](a1, v2);
}

uint64_t protocol witness for Error._userInfo.getter in conformance related decl 'e' for AFLocationServiceErrorCode()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t protocol witness for Error._getEmbeddedNSError() in conformance related decl 'e' for AFLocationServiceErrorCode(uint64_t a1)
{
  uint64_t v2 = lazy protocol witness table accessor for type ContactHandle.HandleType and conformance ContactHandle.HandleType(&lazy protocol witness table cache variable for type related decl 'e' for AFLocationServiceErrorCode and conformance related decl 'e' for AFLocationServiceErrorCode, type metadata accessor for related decl 'e' for AFLocationServiceErrorCode);

  return MEMORY[0x270EEF788](a1, v2);
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance related decl 'e' for AFLocationServiceErrorCode(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = lazy protocol witness table accessor for type ContactHandle.HandleType and conformance ContactHandle.HandleType(&lazy protocol witness table cache variable for type related decl 'e' for AFLocationServiceErrorCode and conformance related decl 'e' for AFLocationServiceErrorCode, type metadata accessor for related decl 'e' for AFLocationServiceErrorCode);

  return MEMORY[0x270EEF7B8](a1, a2, a3, v6);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v2 = Hasher._finalize()();
  swift_bridgeObjectRelease();

  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v4);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = v7;
    if (v6 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
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
          uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v15 = v14;
          if (v13 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v15 == v16) {
            break;
          }
          char v18 = _stringCompareWithSmolCheck(_:_:expecting:)();
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

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
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
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

uint64_t specialized static INPerson.contactsWithContactIdentifiers(_:)(unint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v25 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_36;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  while (v2)
  {
    unint64_t v3 = 0;
    unint64_t v4 = v1 & 0xC000000000000001;
    uint64_t v23 = v1 + 32;
    uint64_t v24 = v1 & 0xFFFFFFFFFFFFFF8;
    uint64_t v20 = v2;
    uint64_t v21 = v1;
    unint64_t v22 = v1 & 0xC000000000000001;
    while (1)
    {
      if (v4)
      {
        id v5 = (id)MEMORY[0x2455DB020](v3, v1);
      }
      else
      {
        if (v3 >= *(void *)(v24 + 16)) {
          goto LABEL_34;
        }
        id v5 = *(id *)(v23 + 8 * v3);
      }
      unint64_t v6 = v5;
      if (__OFADD__(v3++, 1)) {
        break;
      }
      id v8 = objc_msgSend(v5, sel_contactIdentifier);
      if (v8)
      {

        id v9 = v6;
        MEMORY[0x2455DAE70]();
        if (*(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        }
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();

        goto LABEL_5;
      }
      id v10 = objc_msgSend(v6, sel_siriMatches);
      if (v10)
      {
        BOOL v11 = v10;
        type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for INPerson);
        unint64_t v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

        if (v12 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v13 = _CocoaArrayWrapper.endIndex.getter();
          swift_bridgeObjectRelease();
          if (!v13) {
            goto LABEL_30;
          }
LABEL_18:
          if (v13 < 1) {
            goto LABEL_35;
          }
          for (uint64_t i = 0; i != v13; ++i)
          {
            if ((v12 & 0xC000000000000001) != 0) {
              id v15 = (id)MEMORY[0x2455DB020](i, v12);
            }
            else {
              id v15 = *(id *)(v12 + 8 * i + 32);
            }
            uint64_t v16 = v15;
            id v17 = objc_msgSend(v15, sel_contactIdentifier, v20, v21);
            if (v17)
            {

              id v18 = v16;
              MEMORY[0x2455DAE70]();
              if (*(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
              }
              specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
              specialized Array._endMutation()();
            }
          }
          swift_bridgeObjectRelease();
          uint64_t v2 = v20;
          uint64_t v1 = v21;
        }
        else
        {
          uint64_t v13 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
          if (v13) {
            goto LABEL_18;
          }
LABEL_30:

          swift_bridgeObjectRelease();
        }
        unint64_t v4 = v22;
        goto LABEL_5;
      }

LABEL_5:
      if (v3 == v2)
      {
        swift_bridgeObjectRelease();
        return v25;
      }
    }
    __break(1u);
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
LABEL_36:
    swift_bridgeObjectRetain();
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x263F8EE78];
}

uint64_t outlined destroy of ContactHandle.HandleType?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void type metadata accessor for MSPSharedTripCapabilityType(uint64_t a1)
{
}

void type metadata accessor for related decl 'e' for AFLocationServiceErrorCode(uint64_t a1)
{
}

uint64_t base witness table accessor for Equatable in related decl 'e' for AFLocationServiceErrorCode()
{
  return lazy protocol witness table accessor for type ContactHandle.HandleType and conformance ContactHandle.HandleType(&lazy protocol witness table cache variable for type related decl 'e' for AFLocationServiceErrorCode and conformance related decl 'e' for AFLocationServiceErrorCode, type metadata accessor for related decl 'e' for AFLocationServiceErrorCode);
}

uint64_t lazy protocol witness table accessor for type ContactHandle.HandleType and conformance ContactHandle.HandleType(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t base witness table accessor for Error in related decl 'e' for AFLocationServiceErrorCode()
{
  return lazy protocol witness table accessor for type ContactHandle.HandleType and conformance ContactHandle.HandleType(&lazy protocol witness table cache variable for type related decl 'e' for AFLocationServiceErrorCode and conformance related decl 'e' for AFLocationServiceErrorCode, type metadata accessor for related decl 'e' for AFLocationServiceErrorCode);
}

uint64_t base witness table accessor for CustomNSError in related decl 'e' for AFLocationServiceErrorCode()
{
  return lazy protocol witness table accessor for type ContactHandle.HandleType and conformance ContactHandle.HandleType(&lazy protocol witness table cache variable for type related decl 'e' for AFLocationServiceErrorCode and conformance related decl 'e' for AFLocationServiceErrorCode, type metadata accessor for related decl 'e' for AFLocationServiceErrorCode);
}

uint64_t base witness table accessor for _ObjectiveCBridgeableError in related decl 'e' for AFLocationServiceErrorCode()
{
  return lazy protocol witness table accessor for type ContactHandle.HandleType and conformance ContactHandle.HandleType(&lazy protocol witness table cache variable for type related decl 'e' for AFLocationServiceErrorCode and conformance related decl 'e' for AFLocationServiceErrorCode, type metadata accessor for related decl 'e' for AFLocationServiceErrorCode);
}

uint64_t base witness table accessor for Hashable in related decl 'e' for AFLocationServiceErrorCode()
{
  return lazy protocol witness table accessor for type ContactHandle.HandleType and conformance ContactHandle.HandleType(&lazy protocol witness table cache variable for type related decl 'e' for AFLocationServiceErrorCode and conformance related decl 'e' for AFLocationServiceErrorCode, type metadata accessor for related decl 'e' for AFLocationServiceErrorCode);
}

uint64_t associated type witness table accessor for _BridgedStoredNSError.Code : _ErrorCodeProtocol in related decl 'e' for AFLocationServiceErrorCode()
{
  return lazy protocol witness table accessor for type ContactHandle.HandleType and conformance ContactHandle.HandleType(&lazy protocol witness table cache variable for type AFLocationServiceErrorCode and conformance AFLocationServiceErrorCode, type metadata accessor for AFLocationServiceErrorCode);
}

void type metadata accessor for AFLocationServiceErrorCode(uint64_t a1)
{
}

uint64_t associated type witness table accessor for _BridgedStoredNSError.Code : RawRepresentable in related decl 'e' for AFLocationServiceErrorCode()
{
  return lazy protocol witness table accessor for type ContactHandle.HandleType and conformance ContactHandle.HandleType(&lazy protocol witness table cache variable for type AFLocationServiceErrorCode and conformance AFLocationServiceErrorCode, type metadata accessor for AFLocationServiceErrorCode);
}

unint64_t lazy protocol witness table accessor for type Int and conformance Int()
{
  unint64_t result = lazy protocol witness table cache variable for type Int and conformance Int;
  if (!lazy protocol witness table cache variable for type Int and conformance Int)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Int and conformance Int);
  }
  return result;
}

uint64_t base witness table accessor for Equatable in AFLocationServiceErrorCode()
{
  return lazy protocol witness table accessor for type ContactHandle.HandleType and conformance ContactHandle.HandleType(&lazy protocol witness table cache variable for type AFLocationServiceErrorCode and conformance AFLocationServiceErrorCode, type metadata accessor for AFLocationServiceErrorCode);
}

uint64_t associated type witness table accessor for _ErrorCodeProtocol._ErrorType : _BridgedStoredNSError in AFLocationServiceErrorCode()
{
  return lazy protocol witness table accessor for type ContactHandle.HandleType and conformance ContactHandle.HandleType(&lazy protocol witness table cache variable for type related decl 'e' for AFLocationServiceErrorCode and conformance related decl 'e' for AFLocationServiceErrorCode, type metadata accessor for related decl 'e' for AFLocationServiceErrorCode);
}

uint64_t type metadata accessor for OS_os_log(uint64_t a1, unint64_t *a2)
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

void type metadata accessor for INPersonHandleLabel(uint64_t a1)
{
}

void type metadata accessor for MSPSharedTripCapabilityType(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t base witness table accessor for RawRepresentable in INPersonHandleLabel()
{
  return lazy protocol witness table accessor for type ContactHandle.HandleType and conformance ContactHandle.HandleType(&lazy protocol witness table cache variable for type INPersonHandleLabel and conformance INPersonHandleLabel, type metadata accessor for INPersonHandleLabel);
}

uint64_t base witness table accessor for _HasCustomAnyHashableRepresentation in INPersonHandleLabel()
{
  return lazy protocol witness table accessor for type ContactHandle.HandleType and conformance ContactHandle.HandleType(&lazy protocol witness table cache variable for type INPersonHandleLabel and conformance INPersonHandleLabel, type metadata accessor for INPersonHandleLabel);
}

uint64_t base witness table accessor for Equatable in INPersonHandleLabel()
{
  return lazy protocol witness table accessor for type ContactHandle.HandleType and conformance ContactHandle.HandleType(&lazy protocol witness table cache variable for type INPersonHandleLabel and conformance INPersonHandleLabel, type metadata accessor for INPersonHandleLabel);
}

void INStopShareETAIntentHandler.convertSharedTripToRecipients(_:)()
{
}

id one-time initialization function for routineManager()
{
  id result = objc_msgSend(self, sel_defaultManager);
  static ParkingLocationService.routineManager = (uint64_t)result;
  return result;
}

uint64_t *ParkingLocationService.routineManager.unsafeMutableAddressor()
{
  if (one-time initialization token for routineManager != -1) {
    swift_once();
  }
  return &static ParkingLocationService.routineManager;
}

id static ParkingLocationService.routineManager.getter()
{
  if (one-time initialization token for routineManager != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static ParkingLocationService.routineManager;

  return v0;
}

ValueMetadata *type metadata accessor for ParkingLocationService()
{
  return &type metadata for ParkingLocationService;
}

id INDeleteParkingLocationIntentHandler.logObject.getter()
{
  return *(id *)(v0 + OBJC_IVAR____TtC7SiriGeo36INDeleteParkingLocationIntentHandler_logObject);
}

void INDeleteParkingLocationIntentHandler.handle(intent:completion:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void closure #1 in INDeleteParkingLocationIntentHandler.handle(intent:completion:)(uint64_t a1, void *a2, uint64_t a3, void (*a4)(void))
{
  uint64_t v8 = type metadata accessor for OSSignpostID();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  BOOL v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    id v12 = a2;
    os_log_type_t v13 = static os_log_type_t.error.getter();
    BOOL v14 = *(NSObject **)(a3 + OBJC_IVAR____TtC7SiriGeo36INDeleteParkingLocationIntentHandler_logObject);
    os_log_type_t v15 = v13;
    if (os_log_type_enabled(v14, v13))
    {
      id v16 = a2;
      id v17 = a2;
      id v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      uint64_t v39 = (uint64_t)a2;
      uint64_t v40 = v19;
      *(_DWORD *)id v18 = 136315138;
      id v20 = a2;
      __swift_instantiateConcreteTypeFromMangledName(demangling cache variable for type metadata for Error);
      uint64_t v21 = String.init<A>(describing:)();
      uint64_t v39 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v21, v22, &v40);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_23FE9C000, v14, v15, "error fetching vehicle events before deletion: %s", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2455DB720](v19, -1, -1);
      MEMORY[0x2455DB720](v18, -1, -1);
    }
    id v23 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FAA0]), sel_initWithCode_userActivity_, 4, 0);
    a4();
  }
  else
  {
    static os_signpost_type_t.end.getter();
    uint64_t v24 = *(NSObject **)(a3 + OBJC_IVAR____TtC7SiriGeo36INDeleteParkingLocationIntentHandler_logObject);
    static OSSignpostID.exclusive.getter();
    os_signpost(_:dso:log:name:signpostID:_:_:)();
    uint64_t v25 = *(void (**)(char *, uint64_t))(v9 + 8);
    v25(v11, v8);
    id v26 = objc_allocWithZone(MEMORY[0x263F0FAA0]);
    if (a1)
    {
      uint64_t v38 = a4;
      id v27 = objc_msgSend(v26, sel_initWithCode_userActivity_, 3, 0);
      static os_log_type_t.info.getter();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
      uint64_t v28 = swift_allocObject();
      *(_OWORD *)(v28 + 16) = xmmword_23FEBCB50;
      *(void *)(v28 + 56) = type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for INDeleteParkingLocationIntentResponse);
      *(void *)(v28 + 64) = lazy protocol witness table accessor for type INDeleteParkingLocationIntentResponse and conformance NSObject();
      *(void *)(v28 + 32) = v27;
      id v29 = v27;
      os_log(_:dso:log:_:_:)();
      swift_bridgeObjectRelease();
      static os_signpost_type_t.begin.getter();
      static OSSignpostID.exclusive.getter();
      os_signpost(_:dso:log:name:signpostID:_:_:)();
      v25(v11, v8);
      if (one-time initialization token for routineManager != -1) {
        swift_once();
      }
      objc_msgSend((id)static ParkingLocationService.routineManager, sel_clearAllVehicleEvents);
      static os_signpost_type_t.end.getter();
      static OSSignpostID.exclusive.getter();
      os_signpost(_:dso:log:name:signpostID:_:_:)();
      v25(v11, v8);
      os_log_type_t v30 = static os_log_type_t.default.getter();
      BOOL v31 = os_log_type_enabled(v24, v30);
      uint64_t v32 = v38;
      if (v31)
      {
        v33 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v33 = 0;
        _os_log_impl(&dword_23FE9C000, v24, v30, "Deleted all saved parking locations", v33, 2u);
        MEMORY[0x2455DB720](v33, -1, -1);
      }
      ((void (*)(id))v32)(v29);
    }
    else
    {
      id v34 = objc_msgSend(v26, sel_initWithCode_userActivity_, 4, 0);
      os_log_type_t v35 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v24, v35))
      {
        uint64_t v36 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v36 = 0;
        _os_log_impl(&dword_23FE9C000, v24, v35, "No parking locations to delete.", v36, 2u);
        MEMORY[0x2455DB720](v36, -1, -1);
      }
      objc_msgSend(v34, sel_setParkingLocation_, 0);
      ((void (*)(id))a4)(v34);
    }
  }
}

id INDeleteParkingLocationIntentHandler.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id INDeleteParkingLocationIntentHandler.init()()
{
  uint64_t v1 = OBJC_IVAR____TtC7SiriGeo36INDeleteParkingLocationIntentHandler_logObject;
  type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for OS_os_log);
  uint64_t v2 = v0;
  *(void *)&v0[v1] = OS_os_log.init(subsystem:category:)();

  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for INDeleteParkingLocationIntentHandler();
  return objc_msgSendSuper2(&v4, sel_init);
}

id INDeleteParkingLocationIntentHandler.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for INDeleteParkingLocationIntentHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void specialized INDeleteParkingLocationIntentHandler.handle(intent:completion:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for OSSignpostID();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static os_signpost_type_t.begin.getter();
  static OSSignpostID.exclusive.getter();
  os_signpost(_:dso:log:name:signpostID:_:_:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  if (one-time initialization token for routineManager != -1) {
    swift_once();
  }
  uint64_t v9 = (void *)static ParkingLocationService.routineManager;
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = v2;
  v10[3] = a1;
  v10[4] = a2;
  aBlock[4] = partial apply for closure #1 in INDeleteParkingLocationIntentHandler.handle(intent:completion:);
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed [RTVehicleEvent]?, @guaranteed Error?) -> ();
  aBlock[3] = &block_descriptor_0;
  BOOL v11 = _Block_copy(aBlock);
  id v12 = v2;
  swift_retain();
  swift_release();
  objc_msgSend(v9, sel_fetchLastVehicleEventsWithHandler_, v11);
  _Block_release(v11);
}

uint64_t type metadata accessor for INDeleteParkingLocationIntentHandler()
{
  return self;
}

uint64_t sub_23FEA1E04()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned INDeleteParkingLocationIntentResponse) -> ()()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_23FEA1E50()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

void partial apply for closure #1 in INDeleteParkingLocationIntentHandler.handle(intent:completion:)(uint64_t a1, void *a2)
{
  closure #1 in INDeleteParkingLocationIntentHandler.handle(intent:completion:)(a1, a2, *(void *)(v2 + 16), *(void (**)(void))(v2 + 24));
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

unint64_t lazy protocol witness table accessor for type INDeleteParkingLocationIntentResponse and conformance NSObject()
{
  unint64_t result = lazy protocol witness table cache variable for type INDeleteParkingLocationIntentResponse and conformance NSObject;
  if (!lazy protocol witness table cache variable for type INDeleteParkingLocationIntentResponse and conformance NSObject)
  {
    type metadata accessor for OS_os_log(255, &lazy cache variable for type metadata for INDeleteParkingLocationIntentResponse);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type INDeleteParkingLocationIntentResponse and conformance NSObject);
  }
  return result;
}

BOOL static ContactServiceError.__derived_enum_equals(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void ContactServiceError.hash(into:)(uint64_t a1, char a2)
{
}

Swift::Int ContactServiceError.hashValue.getter(char a1)
{
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance ContactServiceError(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance ContactServiceError()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance ContactServiceError()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance ContactServiceError()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t protocol witness for Error._domain.getter in conformance ContactServiceError()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t protocol witness for Error._code.getter in conformance ContactServiceError()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t protocol witness for Error._getEmbeddedNSError() in conformance ContactServiceError()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t ContactService.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  ContactService.init()();
  return v0;
}

void *ContactService.init()()
{
  type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for OS_os_log);
  v0[2] = OS_os_log.init(subsystem:category:)();
  v0[3] = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFEA58]), sel_init);
  type metadata accessor for MapsService();
  uint64_t v1 = swift_allocObject();
  *(void *)(v1 + 16) = OS_os_log.init(subsystem:category:)();
  *(_OWORD *)(v1 + 24) = xmmword_23FEBCBA0;
  v0[4] = v1;
  return v0;
}

id ContactService.logObject.getter()
{
  return *(id *)(v0 + 16);
}

Swift::OpaquePointer_optional __swiftcall ContactService.fetchContactIDs(forIdentifiers:)(Swift::OpaquePointer forIdentifiers)
{
  v20[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v2 = self;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  id v4 = objc_msgSend(v2, sel_predicateForContactsWithIdentifiers_, isa);

  uint64_t v5 = *(void **)(v1 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_23FEBCBB0;
  uint64_t v7 = (void *)*MEMORY[0x263EFE070];
  uint64_t v8 = (void *)*MEMORY[0x263EFDF80];
  *(void *)(v6 + 32) = *MEMORY[0x263EFE070];
  *(void *)(v6 + 40) = v8;
  specialized Array._endMutation()();
  id v9 = v7;
  id v10 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CNKeyDescriptor);
  Class v11 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v20[0] = 0;
  id v12 = objc_msgSend(v5, sel_unifiedContactsMatchingPredicate_keysToFetch_error_, v4, v11, v20);

  id v13 = v20[0];
  if (v12)
  {
    type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for CNContact);
    uint64_t v14 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
    id v15 = v13;
  }
  else
  {
    id v17 = v20[0];
    id v18 = (void *)_convertNSErrorToError(_:)();

    swift_willThrow();
    uint64_t v14 = 0;
  }
  uint64_t v19 = (void *)v14;
  result.value._rawValue = v19;
  result.is_nil = v16;
  return result;
}

Swift::tuple_OpaquePointer_optional_SiriGeo_ContactServiceError_optional __swiftcall ContactService.fetchPersonHandles(forIdentifiers:)(Swift::OpaquePointer forIdentifiers)
{
  uint64_t v2 = (void *)(*(uint64_t (**)(void *))(*(void *)v1 + 112))(forIdentifiers._rawValue);
  if (v2)
  {
    unint64_t v3 = (unint64_t)v2;
    static os_log_type_t.info.getter();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
    uint64_t v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = xmmword_23FEBCB50;
    unint64_t v47 = v3;
    *(void *)(v4 + 56) = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [CNContact]);
    *(void *)(v4 + 64) = lazy protocol witness table accessor for type [CNContact] and conformance [A](&lazy protocol witness table cache variable for type [CNContact] and conformance [A], &demangling cache variable for type metadata for [CNContact]);
    *(void *)(v4 + 32) = v3;
    swift_bridgeObjectRetain();
    os_log(_:dso:log:_:_:)();
    swift_bridgeObjectRelease();
    unint64_t v53 = MEMORY[0x263F8EE78];
    Class isa = (void **)(v3 & 0xFFFFFFFFFFFFFF8);
    if (v3 >> 62) {
      goto LABEL_46;
    }
    uint64_t v6 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    while (v6)
    {
      unint64_t v7 = 0;
      unint64_t v45 = v47 + 32;
      id v46 = isa;
      v51 = (void *)*MEMORY[0x263EFE070];
      v50 = (void *)*MEMORY[0x263EFDF80];
      unint64_t v8 = 0x265096000;
      uint64_t v48 = v6;
      while (1)
      {
        if ((v47 & 0xC000000000000001) != 0)
        {
          id v9 = (id)MEMORY[0x2455DB020](v7, v47);
        }
        else
        {
          if (v7 >= (unint64_t)v46[2]) {
            goto LABEL_43;
          }
          id v9 = *(id *)(v45 + 8 * v7);
        }
        id v10 = v9;
        if (__OFADD__(v7++, 1)) {
          break;
        }
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
        uint64_t v12 = swift_allocObject();
        *(_OWORD *)(v12 + 16) = xmmword_23FEBCBC0;
        *(void *)(v12 + 32) = v51;
        specialized Array._endMutation()();
        id v13 = v51;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CNKeyDescriptor);
        Class isa = (void **)Array._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease();
        unsigned int v14 = objc_msgSend(v10, *(SEL *)(v8 + 3096), isa);

        v52 = v10;
        if (v14)
        {
          id v15 = objc_msgSend(v10, sel_phoneNumbers);
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CNLabeledValue);
          unint64_t v16 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

          unint64_t v17 = v7;
          if (v16 >> 62)
          {
            swift_bridgeObjectRetain();
            uint64_t v18 = _CocoaArrayWrapper.endIndex.getter();
            swift_bridgeObjectRelease();
            if (v18)
            {
LABEL_14:
              if (v18 < 1) {
                goto LABEL_44;
              }
              uint64_t v19 = 0;
              do
              {
                if ((v16 & 0xC000000000000001) != 0) {
                  id v20 = (id)MEMORY[0x2455DB020](v19, v16);
                }
                else {
                  id v20 = *(id *)(v16 + 8 * v19 + 32);
                }
                uint64_t v21 = v20;
                id v22 = objc_msgSend(v20, sel_value, v45);
                id v23 = objc_msgSend(v22, sel_stringValue);

                uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)();
                uint64_t v26 = v25;

                id v27 = objc_allocWithZone(MEMORY[0x263F0FD20]);
                uint64_t v28 = (void *)MEMORY[0x2455DADE0](v24, v26);
                swift_bridgeObjectRelease();
                objc_msgSend(v27, sel_initWithValue_type_, v28, 2);

                MEMORY[0x2455DAE70]();
                if (*(void *)((v53 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v53 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                  specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
                }
                ++v19;
                specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
                specialized Array._endMutation()();
              }
              while (v18 != v19);
            }
          }
          else
          {
            uint64_t v18 = *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10);
            if (v18) {
              goto LABEL_14;
            }
          }
          swift_bridgeObjectRelease();
          uint64_t v6 = v48;
          unint64_t v7 = v17;
          unint64_t v8 = 0x265096000uLL;
          id v10 = v52;
        }
        uint64_t v29 = swift_allocObject();
        *(_OWORD *)(v29 + 16) = xmmword_23FEBCBC0;
        *(void *)(v29 + 32) = v50;
        specialized Array._endMutation()();
        id v30 = v50;
        Class isa = (void **)Array._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease();
        unsigned int v31 = objc_msgSend(v10, *(SEL *)(v8 + 3096), isa);

        if (v31)
        {
          id v32 = objc_msgSend(v10, sel_emailAddresses);
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CNLabeledValue);
          unint64_t v33 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

          if (v33 >> 62)
          {
            swift_bridgeObjectRetain();
            uint64_t v34 = _CocoaArrayWrapper.endIndex.getter();
            swift_bridgeObjectRelease();
            if (!v34)
            {
LABEL_38:

              swift_bridgeObjectRelease();
              goto LABEL_39;
            }
          }
          else
          {
            uint64_t v34 = *(void *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x10);
            if (!v34) {
              goto LABEL_38;
            }
          }
          if (v34 < 1) {
            goto LABEL_45;
          }
          unint64_t v49 = v7;
          uint64_t v35 = 0;
          do
          {
            if ((v33 & 0xC000000000000001) != 0) {
              id v36 = (id)MEMORY[0x2455DB020](v35, v33);
            }
            else {
              id v36 = *(id *)(v33 + 8 * v35 + 32);
            }
            uint64_t v37 = v36;
            id v38 = objc_msgSend(v36, sel_value, v45);
            uint64_t v39 = static String._unconditionallyBridgeFromObjectiveC(_:)();
            uint64_t v41 = v40;

            id v42 = objc_allocWithZone(MEMORY[0x263F0FD20]);
            id v43 = (void *)MEMORY[0x2455DADE0](v39, v41);
            swift_bridgeObjectRelease();
            objc_msgSend(v42, sel_initWithValue_type_, v43, 1);

            Class isa = (void **)&v53;
            MEMORY[0x2455DAE70]();
            if (*(void *)((v53 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v53 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
            }
            ++v35;
            specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
            specialized Array._endMutation()();
          }
          while (v34 != v35);

          swift_bridgeObjectRelease();
          uint64_t v6 = v48;
          unint64_t v7 = v49;
LABEL_39:
          unint64_t v8 = 0x265096000;
          if (v7 == v6)
          {
LABEL_40:
            swift_bridgeObjectRelease();
            uint64_t v2 = (void *)v53;
            goto LABEL_48;
          }
        }
        else
        {

          if (v7 == v6) {
            goto LABEL_40;
          }
        }
      }
      __break(1u);
LABEL_43:
      __break(1u);
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
LABEL_46:
      swift_bridgeObjectRetain();
      uint64_t v6 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    uint64_t v2 = (void *)MEMORY[0x263F8EE78];
LABEL_48:
    __int16 v44 = 2;
  }
  else
  {
    __int16 v44 = 0;
  }
  result._0.value._rawValue = v2;
  *(_WORD *)&result._0.is_nil = v44;
  return result;
}

unint64_t ContactService.fetchSingleTripContact(recipient:)(void *a1)
{
  unint64_t v3 = (unint64_t)objc_msgSend(a1, sel_contactIdentifier);
  if (!v3)
  {
    static os_log_type_t.error.getter();
    os_log(_:dso:log:_:_:)();
    id v25 = objc_msgSend(self, sel_unsupportedForReason_, 2);
    goto LABEL_32;
  }
  id v43 = a1;
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_23FEBCB50;
  *(void *)(v7 + 32) = v4;
  *(void *)(v7 + 40) = v6;
  unint64_t v8 = *(uint64_t (**)(uint64_t))(*(void *)v1 + 120);
  swift_bridgeObjectRetain();
  unint64_t v3 = v8(v7);
  unsigned __int8 v10 = v9;
  LODWORD(v8) = v9;
  swift_bridgeObjectRelease();
  if (v8 != 2 && (v10 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    static os_log_type_t.error.getter();
    os_log(_:dso:log:_:_:)();
    id v25 = objc_msgSend(self, sel_unsupportedForReason_, 3);
    unint64_t v3 = 0;
    goto LABEL_32;
  }
  uint64_t v42 = v1;
  if (!v3)
  {
LABEL_31:
    static os_log_type_t.info.getter();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
    uint64_t v37 = swift_allocObject();
    *(_OWORD *)(v37 + 16) = xmmword_23FEBCB50;
    uint64_t v38 = swift_allocObject();
    *(_OWORD *)(v38 + 16) = xmmword_23FEBCB50;
    *(void *)(v38 + 32) = v4;
    *(void *)(v38 + 40) = v6;
    *(void *)(v37 + 56) = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
    *(void *)(v37 + 64) = lazy protocol witness table accessor for type [CNContact] and conformance [A]((unint64_t *)&lazy protocol witness table cache variable for type [String] and conformance [A], &demangling cache variable for type metadata for [String]);
    *(void *)(v37 + 32) = v38;
    os_log(_:dso:log:_:_:)();
    swift_bridgeObjectRelease();
    id v25 = objc_msgSend(self, sel_unsupportedForReason_, 4);
    unint64_t v3 = 0;
    goto LABEL_32;
  }
  if (!(v3 >> 62))
  {
    uint64_t v12 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v12) {
      goto LABEL_9;
    }
    goto LABEL_30;
  }
  swift_bridgeObjectRetain();
  uint64_t v12 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v12)
  {
LABEL_30:
    swift_bridgeObjectRelease();
    goto LABEL_31;
  }
LABEL_9:
  swift_bridgeObjectRelease();
  if (v12 < 1)
  {
    __break(1u);
    goto LABEL_34;
  }
  uint64_t v13 = 0;
  unsigned int v14 = (void *)MEMORY[0x263F8EE78];
  do
  {
    if ((v3 & 0xC000000000000001) != 0) {
      id v16 = (id)MEMORY[0x2455DB020](v13, v3);
    }
    else {
      id v16 = *(id *)(v3 + 8 * v13 + 32);
    }
    unint64_t v17 = v16;
    id v18 = objc_msgSend(v16, sel_value, v42);
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v22 = v21;

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unsigned int v14 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v14[2] + 1, 1, v14);
      }
      unint64_t v24 = v14[2];
      unint64_t v23 = v14[3];
      if (v24 >= v23 >> 1) {
        unsigned int v14 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v23 > 1), v24 + 1, 1, v14);
      }
      v14[2] = v24 + 1;
      id v15 = &v14[2 * v24];
      v15[4] = v20;
      v15[5] = v22;
    }
    ++v13;
  }
  while (v12 != v13);
  swift_bridgeObjectRelease();
  uint64_t v26 = self;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v28 = objc_msgSend(v26, sel_contactsFromHandles_, isa);

  uint64_t v12 = type metadata accessor for OS_os_log(0, (unint64_t *)&lazy cache variable for type metadata for MSPSharedTripContact);
  unint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v3 >> 62)
  {
LABEL_34:
    swift_bridgeObjectRetain();
    uint64_t v41 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v41 > 0) {
      goto LABEL_25;
    }
LABEL_35:
    swift_bridgeObjectRelease();
    static os_log_type_t.error.getter();
    os_log(_:dso:log:_:_:)();
    id v25 = objc_msgSend(self, sel_unsupportedForReason_, 5);
    unint64_t v3 = 0;
    goto LABEL_32;
  }
  if (*(uint64_t *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= 0) {
    goto LABEL_35;
  }
LABEL_25:
  uint64_t v29 = *(NSObject **)(v42 + 16);
  swift_bridgeObjectRetain_n();
  os_log_type_t v30 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v29, v30))
  {
    unsigned int v31 = (uint8_t *)swift_slowAlloc();
    uint64_t v32 = swift_slowAlloc();
    uint64_t v44 = v32;
    *(_DWORD *)unsigned int v31 = 136315138;
    uint64_t v33 = swift_bridgeObjectRetain();
    uint64_t v34 = MEMORY[0x2455DAEA0](v33, v12);
    unint64_t v36 = v35;
    swift_bridgeObjectRelease();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v34, v36, &v44);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23FE9C000, v29, v30, "fetchSingleTripContact - successful %s", v31, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2455DB720](v32, -1, -1);
    MEMORY[0x2455DB720](v31, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }
  id v25 = objc_msgSend(self, sel_resolutionResultSuccessWithResolvedValue_, v43);
LABEL_32:
  id v39 = v25;
  return v3;
}

uint64_t ContactService.rankAndSortHandlesByPopularity(forHandleValues:)(uint64_t a1)
{
  id v36 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F5D388]), sel_init);
  static os_log_type_t.info.getter();
  uint64_t v35 = v1;
  unint64_t v3 = *(NSObject **)(v1 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_23FEBCB50;
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [EnhancedMSPSharedTripContact]);
  *(void *)(v4 + 56) = v34;
  uint64_t v33 = lazy protocol witness table accessor for type [CNContact] and conformance [A](&lazy protocol witness table cache variable for type [EnhancedMSPSharedTripContact] and conformance [A], &demangling cache variable for type metadata for [EnhancedMSPSharedTripContact]);
  *(void *)(v4 + 64) = v33;
  *(void *)(v4 + 32) = a1;
  swift_bridgeObjectRetain();
  os_log(_:dso:log:_:_:)();
  swift_bridgeObjectRelease();
  int64_t v5 = *(void *)(a1 + 16);
  if (v5)
  {
    uint64_t v6 = v3;
    uint64_t v37 = MEMORY[0x263F8EE78];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v5, 0);
    uint64_t v7 = v37;
    unint64_t v8 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v9 = *(v8 - 1);
      uint64_t v10 = *v8;
      uint64_t v37 = v7;
      unint64_t v12 = *(void *)(v7 + 16);
      unint64_t v11 = *(void *)(v7 + 24);
      swift_bridgeObjectRetain();
      if (v12 >= v11 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v11 > 1, v12 + 1, 1);
        uint64_t v7 = v37;
      }
      v8 += 6;
      *(void *)(v7 + 16) = v12 + 1;
      uint64_t v13 = v7 + 16 * v12;
      *(void *)(v13 + 32) = v9;
      *(void *)(v13 + 40) = v10;
      --v5;
    }
    while (v5);
    unint64_t v3 = v6;
  }
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v15 = objc_msgSend(v36, sel_rankedHandlesFromCandidateHandles_, isa);

  if (v15)
  {
    type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for NSNumber);
    uint64_t v16 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v16 = 0;
  }
  swift_bridgeObjectRetain_n();
  os_log_type_t v17 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v17))
  {
    id v18 = (uint8_t *)swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    uint64_t v37 = v19;
    *(_DWORD *)id v18 = 136315138;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : NSNumber]?);
    uint64_t v20 = String.init<A>(describing:)();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v20, v21, &v37);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23FE9C000, v3, v17, "ranked handles  %s", v18, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2455DB720](v19, -1, -1);
    MEMORY[0x2455DB720](v18, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v22 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay7SiriGeo28EnhancedMSPSharedTripContactVG_AHs5NeverOTg503_s7d5Geo14i65ServiceC30rankAndSortHandlesByPopularity15forHandleValuesSayAA021fgH18C0VGAH_tFA2GXEfU0_AF0iM0CSDySSSo8NSNumberCGSgTf1cn_nTf4ngg_n(a1, v35, v16);
  swift_release();
  swift_bridgeObjectRelease_n();
  static os_log_type_t.info.getter();
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_23FEBCB50;
  *(void *)(v23 + 56) = v34;
  *(void *)(v23 + 64) = v33;
  *(void *)(v23 + 32) = v22;
  swift_bridgeObjectRetain();
  os_log(_:dso:log:_:_:)();
  swift_bridgeObjectRelease();
  uint64_t v37 = v22;
  swift_bridgeObjectRetain();
  specialized MutableCollection<>.sort(by:)(&v37, specialized _ContiguousArrayBuffer._consumeAndCreateNew(), specialized UnsafeMutableBufferPointer._stableSortImpl(by:));
  swift_bridgeObjectRelease();
  uint64_t v24 = v37;
  swift_retain_n();
  os_log_type_t v25 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v25))
  {
    uint64_t v26 = (uint8_t *)swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    uint64_t v37 = v27;
    *(_DWORD *)uint64_t v26 = 136315138;
    uint64_t v28 = swift_retain();
    uint64_t v29 = MEMORY[0x2455DAEA0](v28, &type metadata for EnhancedMSPSharedTripContact);
    unint64_t v31 = v30;
    swift_release();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v29, v31, &v37);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23FE9C000, v3, v25, "ranked handles after sort %s", v26, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2455DB720](v27, -1, -1);
    MEMORY[0x2455DB720](v26, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  return v24;
}

double closure #2 in ContactService.rankAndSortHandlesByPopularity(forHandleValues:)@<D0>(double *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  long long v6 = *(_OWORD *)a1;
  long long v7 = *((_OWORD *)a1 + 1);
  double v8 = a1[4];
  *((double *)&v31 + 1) = a1[3];
  uint64_t v32 = (void *)*((void *)a1 + 5);
  id v9 = v32;
  swift_bridgeObjectRetain();
  *(void *)&long long v31 = (id)v7;
  static os_log_type_t.info.getter();
  uint64_t v10 = *(void *)(a2 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_23FEBCBD0;
  uint64_t v12 = EnhancedMSPSharedTripContact.debugDescription.getter();
  uint64_t v14 = v13;
  uint64_t v15 = MEMORY[0x263F8D310];
  *(void *)(v11 + 56) = MEMORY[0x263F8D310];
  unint64_t v16 = lazy protocol witness table accessor for type String and conformance String();
  *(void *)(v11 + 32) = v12;
  *(void *)(v11 + 40) = v14;
  uint64_t v17 = v6;
  *(void *)(v11 + 96) = v15;
  *(void *)(v11 + 104) = v16;
  unint64_t v18 = v16;
  *(void *)(v11 + 64) = v16;
  *(_OWORD *)(v11 + 72) = v6;
  swift_bridgeObjectRetain();
  os_log(_:dso:log:_:_:)();
  swift_bridgeObjectRelease();
  if (a3 && *(void *)(a3 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v19 = specialized __RawDictionaryStorage.find<A>(_:)(v6, *((uint64_t *)&v6 + 1));
    if (v20)
    {
      id v21 = *(id *)(*(void *)(a3 + 56) + 8 * v19);
      swift_bridgeObjectRelease();
      static os_log_type_t.info.getter();
      uint64_t v22 = swift_allocObject();
      *(_OWORD *)(v22 + 16) = xmmword_23FEBCB50;
      objc_msgSend(v21, sel_doubleValue);
      uint64_t v23 = MEMORY[0x263F8D5B8];
      *(void *)(v22 + 56) = MEMORY[0x263F8D538];
      *(void *)(v22 + 64) = v23;
      *(void *)(v22 + 32) = v24;
      os_log(_:dso:log:_:_:)();
      swift_bridgeObjectRelease();
      objc_msgSend(v21, sel_doubleValue);
      if ((~v25 & 0x7FF0000000000000) != 0 || (v25 & 0xFFFFFFFFFFFFFLL) == 0)
      {
        objc_msgSend(v21, sel_doubleValue, v10);
        double v8 = v26;
      }

      uint64_t v17 = v6;
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v17 = v6;
    }
  }
  static os_log_type_t.info.getter();
  uint64_t v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = xmmword_23FEBCB50;
  *(void *)&long long v34 = v17;
  *((void *)&v34 + 1) = *((void *)&v6 + 1);
  *(double *)&long long v35 = v8;
  *((void *)&v35 + 1) = v32;
  uint64_t v28 = EnhancedMSPSharedTripContact.debugDescription.getter();
  *(void *)(v27 + 56) = MEMORY[0x263F8D310];
  *(void *)(v27 + 64) = v18;
  *(void *)(v27 + 32) = v28;
  *(void *)(v27 + 40) = v29;
  os_log(_:dso:log:_:_:)();
  swift_bridgeObjectRelease();
  *a4 = v34;
  a4[1] = v31;
  double result = v8;
  a4[2] = v35;
  return result;
}

uint64_t ContactService.rankAndSortHandlesByPopularityAndType(forHandleValues:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  static os_log_type_t.info.getter();
  os_log(_:dso:log:_:_:)();
  uint64_t v8 = *(void *)(v3 + 32);
  id v9 = (void *)swift_allocObject();
  v9[2] = v4;
  v9[3] = a2;
  v9[4] = a3;
  uint64_t v10 = *(void (**)(uint64_t, void (*)(uint64_t, void *), void *))(*(void *)v8 + 128);
  swift_retain();
  swift_retain();
  v10(a1, partial apply for closure #1 in ContactService.rankAndSortHandlesByPopularityAndType(forHandleValues:_:), v9);

  return swift_release();
}

void closure #1 in ContactService.rankAndSortHandlesByPopularityAndType(forHandleValues:_:)(uint64_t a1, id a2, uint64_t a3, void (*a4)(uint64_t))
{
  if (a2)
  {
    id v7 = a2;
    static os_log_type_t.error.getter();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
    uint64_t v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_23FEBCB50;
    swift_getErrorValue();
    uint64_t v9 = Error.localizedDescription.getter();
    uint64_t v11 = v10;
    *(void *)(v8 + 56) = MEMORY[0x263F8D310];
    *(void *)(v8 + 64) = lazy protocol witness table accessor for type String and conformance String();
    *(void *)(v8 + 32) = v9;
    *(void *)(v8 + 40) = v11;
    os_log(_:dso:log:_:_:)();
    swift_bridgeObjectRelease();
    a4(MEMORY[0x263F8EE78]);
  }
  else if (a1)
  {
    uint64_t v14 = a1;
    swift_bridgeObjectRetain();
    specialized MutableCollection<>.sort(by:)(&v14, (uint64_t (*)(uint64_t))specialized _ArrayBuffer._consumeAndCreateNew(), specialized UnsafeMutableBufferPointer._stableSortImpl(by:));
    uint64_t v12 = (*(uint64_t (**)(uint64_t))(*(void *)a3 + 136))(v14);
    swift_bridgeObjectRelease();
    a4(v12);
    swift_bridgeObjectRelease();
  }
  else
  {
    static os_log_type_t.error.getter();
    uint64_t v13 = MEMORY[0x263F8EE78];
    os_log(_:dso:log:_:_:)();
    a4(v13);
  }
}

uint64_t specialized MutableCollection<>.sort(by:)(uint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t (*a3)(void *))
{
  uint64_t v6 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v6 = a2(v6);
  }
  uint64_t v7 = *(void *)(v6 + 16);
  v9[0] = v6 + 32;
  v9[1] = v7;
  uint64_t result = a3(v9);
  *a1 = v6;
  return result;
}

uint64_t ContactService.deinit()
{
  swift_release();
  return v0;
}

uint64_t ContactService.__deallocating_deinit()
{
  swift_release();

  return MEMORY[0x270FA0228](v0, 40, 7);
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

uint64_t serialize(_:at:)(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  unsigned char *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t closure #1 in osLogInternal(_:log:type:)(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

void *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
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
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  size_t v11;
  void *v12;

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
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<EnhancedMSPSharedTripContact>);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 48);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[6 * v8 + 4]) {
          memmove(v12, a4 + 4, 48 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v12 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t closure #1 in OSLogArguments.append(_:)(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = specialized _StringGuts._deconstructUTF8<A>(scratch:)(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, *a3);
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
      outlined init with copy of Any((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t specialized _StringGuts._deconstructUTF8<A>(scratch:)(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            UnsafeMutableRawBufferPointer.subscript.setter();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = _StringGuts._allocateForDeconstruct()(a5, a6);
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
  uint64_t v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
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

uint64_t _StringGuts._allocateForDeconstruct()(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = _StringGuts.copyUTF8(into:)();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
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
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

unsigned char **closure #1 in OSLogArguments.append(_:)(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t lazy protocol witness table accessor for type [CNContact] and conformance [A](unint64_t *a1, uint64_t *a2)
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

Swift::Int specialized UnsafeMutableBufferPointer._stableSortImpl(by:)(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  Swift::Int result = _minimumMergeRunLength(_:)(v3);
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_138;
    }
    if (v3) {
      return specialized MutableCollection<>._insertionSort(within:sortedEnd:by:)(0, v3, 1, a1);
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
    goto LABEL_146;
  }
  Swift::Int v6 = result;
  v113 = a1;
  if (v3 < 2)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    __dst = (char *)(MEMORY[0x263F8EE78] + 32);
    if (v3 != 1)
    {
      unint64_t v13 = *(void *)(MEMORY[0x263F8EE78] + 16);
      uint64_t v12 = (char *)MEMORY[0x263F8EE78];
LABEL_104:
      v104 = v12;
      uint64_t v115 = v9;
      if (v13 >= 2)
      {
        uint64_t v105 = *v113;
        do
        {
          unint64_t v106 = v13 - 2;
          if (v13 < 2) {
            goto LABEL_133;
          }
          if (!v105) {
            goto LABEL_145;
          }
          v107 = v104;
          uint64_t v108 = *(void *)&v104[16 * v106 + 32];
          uint64_t v109 = *(void *)&v104[16 * v13 + 24];
          specialized _merge<A>(low:mid:high:buffer:by:)((char *)(v105 + 48 * v108), (char *)(v105 + 48 * *(void *)&v104[16 * v13 + 16]), v105 + 48 * v109, __dst);
          if (v1) {
            break;
          }
          if (v109 < v108) {
            goto LABEL_134;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            v107 = specialized _ArrayBuffer._consumeAndCreateNew()((uint64_t)v107);
          }
          if (v106 >= *((void *)v107 + 2)) {
            goto LABEL_135;
          }
          v110 = &v107[16 * v106 + 32];
          *(void *)v110 = v108;
          *((void *)v110 + 1) = v109;
          unint64_t v111 = *((void *)v107 + 2);
          if (v13 > v111) {
            goto LABEL_136;
          }
          memmove(&v107[16 * v13 + 16], &v107[16 * v13 + 32], 16 * (v111 - v13));
          v104 = v107;
          *((void *)v107 + 2) = v111 - 1;
          unint64_t v13 = v111 - 1;
        }
        while (v111 > 2);
      }
LABEL_101:
      swift_bridgeObjectRelease();
      *(void *)(v115 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v115 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v7 = v5 >> 1;
    uint64_t v8 = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(void *)(v8 + 16) = v7;
    uint64_t v115 = v8;
    __dst = (char *)(v8 + 32);
  }
  Swift::Int v10 = 0;
  uint64_t v11 = *a1;
  uint64_t v114 = *a1 + 128;
  uint64_t v112 = *a1 + 40;
  uint64_t v12 = (char *)MEMORY[0x263F8EE78];
  Swift::Int v116 = v6;
  Swift::Int v117 = v3;
  uint64_t v118 = v11;
  while (1)
  {
    Swift::Int v14 = v10++;
    if (v10 < v3)
    {
      uint64_t v15 = v11 + 48 * v10;
      unint64_t v16 = *(void *)(v15 + 24);
      double v17 = *(double *)(v15 + 32);
      uint64_t v18 = v11 + 48 * v14;
      unint64_t v19 = *(void *)(v18 + 24);
      double v20 = *(double *)(v18 + 32);
      int v21 = v19 < v16;
      if (v16 == v19) {
        int v21 = v20 < v17;
      }
      Swift::Int v10 = v14 + 2;
      if (v14 + 2 < v3)
      {
        uint64_t v22 = (double *)(v114 + 48 * v14);
        while (1)
        {
          double v23 = v17;
          unint64_t v24 = *((void *)v22 - 1);
          double v17 = *v22;
          int v25 = v24 == v16 ? v23 < *v22 : v16 < v24;
          if (v21 != v25) {
            break;
          }
          ++v10;
          v22 += 6;
          unint64_t v16 = v24;
          if (v3 == v10)
          {
            Swift::Int v10 = v3;
            break;
          }
        }
      }
      if (v21)
      {
        if (v10 < v14) {
          goto LABEL_139;
        }
        if (v14 < v10)
        {
          uint64_t v26 = 48 * v10;
          uint64_t v27 = 48 * v14;
          Swift::Int v28 = v10;
          Swift::Int v29 = v14;
          do
          {
            if (v29 != --v28)
            {
              if (!v11) {
                goto LABEL_144;
              }
              unint64_t v30 = (_OWORD *)(v11 + v27);
              uint64_t v31 = *(void *)(v11 + v27);
              uint64_t v32 = v11 + v26;
              uint64_t v33 = *(void *)(v11 + v27 + 24);
              uint64_t v34 = *(void *)(v11 + v27 + 32);
              uint64_t v35 = *(void *)(v11 + v27 + 40);
              long long v36 = *(_OWORD *)(v11 + v27 + 8);
              long long v38 = *(_OWORD *)(v11 + v26 - 32);
              long long v37 = *(_OWORD *)(v11 + v26 - 16);
              *unint64_t v30 = *(_OWORD *)(v11 + v26 - 48);
              v30[1] = v38;
              v30[2] = v37;
              *(void *)(v32 - 48) = v31;
              *(_OWORD *)(v32 - 40) = v36;
              *(void *)(v32 - 24) = v33;
              *(void *)(v32 - 16) = v34;
              *(void *)(v32 - 8) = v35;
            }
            ++v29;
            v26 -= 48;
            v27 += 48;
          }
          while (v29 < v28);
        }
      }
    }
    if (v10 >= v3) {
      goto LABEL_54;
    }
    if (__OFSUB__(v10, v14)) {
      goto LABEL_137;
    }
    if (v10 - v14 >= v6) {
      goto LABEL_54;
    }
    Swift::Int v39 = v14 + v6;
    if (__OFADD__(v14, v6)) {
      goto LABEL_140;
    }
    if (v39 >= v3) {
      Swift::Int v39 = v3;
    }
    if (v39 < v14) {
      break;
    }
    if (v10 != v39)
    {
      uint64_t v40 = v112 + 48 * v10;
      do
      {
        uint64_t v41 = v11 + 48 * v10;
        unint64_t v42 = *(void *)(v41 + 24);
        double v43 = *(double *)(v41 + 32);
        Swift::Int v44 = v14;
        uint64_t v45 = v40;
        do
        {
          unint64_t v46 = *(void *)(v45 - 64);
          if (v42 == v46) {
            BOOL v47 = *(double *)(v45 - 56) < v43;
          }
          else {
            BOOL v47 = v46 < v42;
          }
          if (!v47) {
            break;
          }
          if (!v11) {
            goto LABEL_142;
          }
          uint64_t v48 = (_OWORD *)(v45 - 40);
          unint64_t v49 = (_OWORD *)(v45 - 88);
          long long v51 = *(_OWORD *)(v45 - 72);
          long long v50 = *(_OWORD *)(v45 - 56);
          *(void *)(v45 - 48) = *(void *)v45;
          v45 -= 48;
          uint64_t v52 = *(void *)(v45 + 8);
          long long v53 = *(_OWORD *)(v45 + 16);
          *uint64_t v48 = *v49;
          v48[1] = v51;
          v48[2] = v50;
          *(void *)(v45 - 40) = v52;
          *(_OWORD *)(v45 - 32) = v53;
          *(void *)(v45 - 16) = v42;
          *(double *)(v45 - 8) = v43;
          ++v44;
        }
        while (v10 != v44);
        ++v10;
        v40 += 48;
      }
      while (v10 != v39);
      Swift::Int v10 = v39;
    }
LABEL_54:
    if (v10 < v14) {
      goto LABEL_132;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v12 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v12 + 2) + 1, 1, v12);
    }
    unint64_t v55 = *((void *)v12 + 2);
    unint64_t v54 = *((void *)v12 + 3);
    unint64_t v13 = v55 + 1;
    uint64_t v11 = v118;
    if (v55 >= v54 >> 1)
    {
      v103 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v54 > 1), v55 + 1, 1, v12);
      uint64_t v11 = v118;
      uint64_t v12 = v103;
    }
    *((void *)v12 + 2) = v13;
    v56 = v12 + 32;
    v57 = &v12[16 * v55 + 32];
    *(void *)v57 = v14;
    *((void *)v57 + 1) = v10;
    if (v55)
    {
      while (1)
      {
        unint64_t v58 = v13 - 1;
        if (v13 >= 4)
        {
          v63 = &v56[16 * v13];
          uint64_t v64 = *((void *)v63 - 8);
          uint64_t v65 = *((void *)v63 - 7);
          BOOL v69 = __OFSUB__(v65, v64);
          uint64_t v66 = v65 - v64;
          if (v69) {
            goto LABEL_121;
          }
          uint64_t v68 = *((void *)v63 - 6);
          uint64_t v67 = *((void *)v63 - 5);
          BOOL v69 = __OFSUB__(v67, v68);
          uint64_t v61 = v67 - v68;
          char v62 = v69;
          if (v69) {
            goto LABEL_122;
          }
          unint64_t v70 = v13 - 2;
          v71 = &v56[16 * v13 - 32];
          uint64_t v73 = *(void *)v71;
          uint64_t v72 = *((void *)v71 + 1);
          BOOL v69 = __OFSUB__(v72, v73);
          uint64_t v74 = v72 - v73;
          if (v69) {
            goto LABEL_124;
          }
          BOOL v69 = __OFADD__(v61, v74);
          uint64_t v75 = v61 + v74;
          if (v69) {
            goto LABEL_127;
          }
          if (v75 >= v66)
          {
            v93 = &v56[16 * v58];
            uint64_t v95 = *(void *)v93;
            uint64_t v94 = *((void *)v93 + 1);
            BOOL v69 = __OFSUB__(v94, v95);
            uint64_t v96 = v94 - v95;
            if (v69) {
              goto LABEL_131;
            }
            BOOL v86 = v61 < v96;
            goto LABEL_91;
          }
        }
        else
        {
          if (v13 != 3)
          {
            uint64_t v87 = *((void *)v12 + 4);
            uint64_t v88 = *((void *)v12 + 5);
            BOOL v69 = __OFSUB__(v88, v87);
            uint64_t v80 = v88 - v87;
            char v81 = v69;
            goto LABEL_85;
          }
          uint64_t v60 = *((void *)v12 + 4);
          uint64_t v59 = *((void *)v12 + 5);
          BOOL v69 = __OFSUB__(v59, v60);
          uint64_t v61 = v59 - v60;
          char v62 = v69;
        }
        if (v62) {
          goto LABEL_123;
        }
        unint64_t v70 = v13 - 2;
        v76 = &v56[16 * v13 - 32];
        uint64_t v78 = *(void *)v76;
        uint64_t v77 = *((void *)v76 + 1);
        BOOL v79 = __OFSUB__(v77, v78);
        uint64_t v80 = v77 - v78;
        char v81 = v79;
        if (v79) {
          goto LABEL_126;
        }
        v82 = &v56[16 * v58];
        uint64_t v84 = *(void *)v82;
        uint64_t v83 = *((void *)v82 + 1);
        BOOL v69 = __OFSUB__(v83, v84);
        uint64_t v85 = v83 - v84;
        if (v69) {
          goto LABEL_129;
        }
        if (__OFADD__(v80, v85)) {
          goto LABEL_130;
        }
        if (v80 + v85 >= v61)
        {
          BOOL v86 = v61 < v85;
LABEL_91:
          if (v86) {
            unint64_t v58 = v70;
          }
          goto LABEL_93;
        }
LABEL_85:
        if (v81) {
          goto LABEL_125;
        }
        v89 = &v56[16 * v58];
        uint64_t v91 = *(void *)v89;
        uint64_t v90 = *((void *)v89 + 1);
        BOOL v69 = __OFSUB__(v90, v91);
        uint64_t v92 = v90 - v91;
        if (v69) {
          goto LABEL_128;
        }
        if (v92 < v80) {
          goto LABEL_15;
        }
LABEL_93:
        unint64_t v97 = v58 - 1;
        if (v58 - 1 >= v13)
        {
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
          goto LABEL_141;
        }
        if (!v11) {
          goto LABEL_143;
        }
        v98 = &v56[16 * v97];
        uint64_t v99 = *(void *)v98;
        v100 = &v56[16 * v58];
        uint64_t v101 = *((void *)v100 + 1);
        specialized _merge<A>(low:mid:high:buffer:by:)((char *)(v11 + 48 * *(void *)v98), (char *)(v11 + 48 * *(void *)v100), v11 + 48 * v101, __dst);
        if (v1) {
          goto LABEL_101;
        }
        if (v101 < v99) {
          goto LABEL_118;
        }
        if (v58 > *((void *)v12 + 2)) {
          goto LABEL_119;
        }
        *(void *)v98 = v99;
        *(void *)&v56[16 * v97 + 8] = v101;
        unint64_t v102 = *((void *)v12 + 2);
        if (v58 >= v102) {
          goto LABEL_120;
        }
        unint64_t v13 = v102 - 1;
        memmove(&v56[16 * v58], v100 + 16, 16 * (v102 - 1 - v58));
        *((void *)v12 + 2) = v102 - 1;
        uint64_t v11 = v118;
        if (v102 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v13 = 1;
LABEL_15:
    Swift::Int v6 = v116;
    Swift::Int v3 = v117;
    if (v10 >= v117)
    {
      uint64_t v9 = v115;
      goto LABEL_104;
    }
  }
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
  Swift::Int result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

{
  uint64_t v1;
  Swift::Int v3;
  Swift::Int result;
  uint64_t v5;
  Swift::Int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  Swift::Int v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  Swift::Int v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  Swift::Int v23;
  Swift::Int v24;
  _OWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  long long v31;
  long long v32;
  long long v33;
  Swift::Int v34;
  uint64_t v35;
  unint64_t v36;
  Swift::Int v37;
  uint64_t v38;
  _OWORD *v39;
  _OWORD *v40;
  long long v41;
  long long v42;
  uint64_t v43;
  uint64_t v44;
  long long v45;
  unint64_t v46;
  unint64_t v47;
  char *v48;
  char *v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  BOOL v61;
  unint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  BOOL v71;
  uint64_t v72;
  char v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  BOOL v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  char *v90;
  char *v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  unint64_t v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t i;
  unint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  long long v107;
  long long v108;
  char *v109;
  uint64_t v110;
  unint64_t v111;
  char *v112;
  uint64_t v113;
  uint64_t v114;
  char *v115;
  unint64_t v116;
  uint64_t v117;
  uint64_t *v118;
  uint64_t v119;
  uint64_t v120;
  Swift::Int v121;
  Swift::Int v122;
  uint64_t v123;
  char *__dst;

  Swift::Int v3 = a1[1];
  Swift::Int result = _minimumMergeRunLength(_:)(v3);
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_136;
    }
    if ((unint64_t)v3 >= 2)
    {
      unint64_t v97 = 0;
      v98 = *a1;
      for (uint64_t i = 1; i != v3; ++i)
      {
        v100 = *(void *)(v98 + 48 * i + 24);
        uint64_t v101 = v97;
        do
        {
          unint64_t v102 = v98 + v101;
          if (*(void *)(v98 + v101 + 24) >= v100) {
            break;
          }
          if (!v98) {
            goto LABEL_140;
          }
          v103 = *(void *)(v102 + 48);
          v104 = v98 + v101;
          uint64_t v105 = *(void *)(v98 + v101 + 80);
          unint64_t v106 = *(void *)(v98 + v101 + 88);
          v107 = *(_OWORD *)(v98 + v101 + 56);
          uint64_t v108 = *(_OWORD *)(v102 + 16);
          *(_OWORD *)(v102 + 48) = *(_OWORD *)v102;
          *(_OWORD *)(v102 + 64) = v108;
          *(_OWORD *)(v102 + 80) = *(_OWORD *)(v102 + 32);
          *(void *)v104 = v103;
          *(_OWORD *)(v104 + 8) = v107;
          *(void *)(v102 + 24) = v100;
          *(void *)(v104 + 32) = v105;
          v101 -= 48;
          *(void *)(v104 + 40) = v106;
        }
        while (v101 != -48);
        v97 += 48;
      }
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
    goto LABEL_145;
  }
  Swift::Int v6 = result;
  uint64_t v118 = a1;
  if (v3 < 2)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    __dst = (char *)(MEMORY[0x263F8EE78] + 32);
    if (v3 != 1)
    {
      unint64_t v13 = *(void *)(MEMORY[0x263F8EE78] + 16);
      uint64_t v12 = (char *)MEMORY[0x263F8EE78];
LABEL_102:
      uint64_t v109 = v12;
      v120 = v9;
      if (v13 >= 2)
      {
        v110 = *v118;
        do
        {
          unint64_t v111 = v13 - 2;
          if (v13 < 2) {
            goto LABEL_131;
          }
          if (!v110) {
            goto LABEL_144;
          }
          uint64_t v112 = v109;
          v113 = *(void *)&v109[16 * v111 + 32];
          uint64_t v114 = *(void *)&v109[16 * v13 + 24];
          specialized _merge<A>(low:mid:high:buffer:by:)((char *)(v110 + 48 * v113), (char *)(v110 + 48 * *(void *)&v109[16 * v13 + 16]), v110 + 48 * v114, __dst);
          if (v1) {
            break;
          }
          if (v114 < v113) {
            goto LABEL_132;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v112 = specialized _ArrayBuffer._consumeAndCreateNew()((uint64_t)v112);
          }
          if (v111 >= *((void *)v112 + 2)) {
            goto LABEL_133;
          }
          uint64_t v115 = &v112[16 * v111 + 32];
          *(void *)uint64_t v115 = v113;
          *((void *)v115 + 1) = v114;
          Swift::Int v116 = *((void *)v112 + 2);
          if (v13 > v116) {
            goto LABEL_134;
          }
          memmove(&v112[16 * v13 + 16], &v112[16 * v13 + 32], 16 * (v116 - v13));
          uint64_t v109 = v112;
          *((void *)v112 + 2) = v116 - 1;
          unint64_t v13 = v116 - 1;
        }
        while (v116 > 2);
      }
LABEL_93:
      swift_bridgeObjectRelease();
      *(void *)(v120 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    v120 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v7 = v5 >> 1;
    uint64_t v8 = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(void *)(v8 + 16) = v7;
    v120 = v8;
    __dst = (char *)(v8 + 32);
  }
  Swift::Int v10 = 0;
  uint64_t v11 = *a1;
  v119 = *a1 + 120;
  Swift::Int v117 = *a1 + 40;
  uint64_t v12 = (char *)MEMORY[0x263F8EE78];
  v121 = v6;
  v122 = v3;
  v123 = v11;
  while (1)
  {
    Swift::Int v14 = v10++;
    if (v10 < v3)
    {
      uint64_t v15 = *(void *)(v11 + 48 * v10 + 24);
      unint64_t v16 = *(void *)(v11 + 48 * v14 + 24);
      Swift::Int v10 = v14 + 2;
      if (v14 + 2 < v3)
      {
        double v17 = (unint64_t *)(v119 + 48 * v14);
        uint64_t v18 = v15;
        while (1)
        {
          double v20 = *v17;
          v17 += 6;
          unint64_t v19 = v20;
          if (v16 < v15 == v18 >= v20) {
            break;
          }
          ++v10;
          uint64_t v18 = v19;
          if (v3 == v10)
          {
            Swift::Int v10 = v3;
            break;
          }
        }
      }
      if (v16 < v15)
      {
        if (v10 < v14) {
          goto LABEL_137;
        }
        if (v14 < v10)
        {
          int v21 = 48 * v10;
          uint64_t v22 = 48 * v14;
          double v23 = v10;
          unint64_t v24 = v14;
          do
          {
            if (v24 != --v23)
            {
              if (!v11) {
                goto LABEL_143;
              }
              int v25 = (_OWORD *)(v11 + v22);
              uint64_t v26 = *(void *)(v11 + v22);
              uint64_t v27 = v11 + v21;
              Swift::Int v28 = *(void *)(v11 + v22 + 24);
              Swift::Int v29 = *(void *)(v11 + v22 + 32);
              unint64_t v30 = *(void *)(v11 + v22 + 40);
              uint64_t v31 = *(_OWORD *)(v11 + v22 + 8);
              uint64_t v33 = *(_OWORD *)(v11 + v21 - 32);
              uint64_t v32 = *(_OWORD *)(v11 + v21 - 16);
              void *v25 = *(_OWORD *)(v11 + v21 - 48);
              v25[1] = v33;
              v25[2] = v32;
              *(void *)(v27 - 48) = v26;
              *(_OWORD *)(v27 - 40) = v31;
              *(void *)(v27 - 24) = v28;
              *(void *)(v27 - 16) = v29;
              *(void *)(v27 - 8) = v30;
            }
            ++v24;
            v21 -= 48;
            v22 += 48;
          }
          while (v24 < v23);
        }
      }
    }
    if (v10 >= v3) {
      goto LABEL_46;
    }
    if (__OFSUB__(v10, v14)) {
      goto LABEL_135;
    }
    if (v10 - v14 >= v6) {
      goto LABEL_46;
    }
    uint64_t v34 = v14 + v6;
    if (__OFADD__(v14, v6)) {
      goto LABEL_138;
    }
    if (v34 >= v3) {
      uint64_t v34 = v3;
    }
    if (v34 < v14) {
      break;
    }
    if (v10 != v34)
    {
      uint64_t v35 = v117 + 48 * v10;
      do
      {
        long long v36 = *(void *)(v11 + 48 * v10 + 24);
        long long v37 = v14;
        long long v38 = v35;
        do
        {
          if (*(void *)(v38 - 64) >= v36) {
            break;
          }
          if (!v11) {
            goto LABEL_141;
          }
          Swift::Int v39 = (_OWORD *)(v38 - 40);
          uint64_t v40 = (_OWORD *)(v38 - 88);
          unint64_t v42 = *(_OWORD *)(v38 - 72);
          uint64_t v41 = *(_OWORD *)(v38 - 56);
          *(void *)(v38 - 48) = *(void *)v38;
          v38 -= 48;
          double v43 = *(void *)(v38 + 8);
          Swift::Int v44 = *(void *)(v38 + 40);
          uint64_t v45 = *(_OWORD *)(v38 + 16);
          *Swift::Int v39 = *v40;
          v39[1] = v42;
          v39[2] = v41;
          *(void *)(v38 - 40) = v43;
          *(_OWORD *)(v38 - 32) = v45;
          *(void *)(v38 - 16) = v36;
          *(void *)(v38 - 8) = v44;
          ++v37;
        }
        while (v10 != v37);
        ++v10;
        v35 += 48;
      }
      while (v10 != v34);
      Swift::Int v10 = v34;
    }
LABEL_46:
    if (v10 < v14) {
      goto LABEL_130;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v12 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v12 + 2) + 1, 1, v12);
    }
    BOOL v47 = *((void *)v12 + 2);
    unint64_t v46 = *((void *)v12 + 3);
    unint64_t v13 = v47 + 1;
    uint64_t v11 = v123;
    if (v47 >= v46 >> 1)
    {
      uint64_t v96 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v46 > 1), v47 + 1, 1, v12);
      uint64_t v11 = v123;
      uint64_t v12 = v96;
    }
    *((void *)v12 + 2) = v13;
    uint64_t v48 = v12 + 32;
    unint64_t v49 = &v12[16 * v47 + 32];
    *(void *)unint64_t v49 = v14;
    *((void *)v49 + 1) = v10;
    if (v47)
    {
      while (1)
      {
        long long v50 = v13 - 1;
        if (v13 >= 4)
        {
          unint64_t v55 = &v48[16 * v13];
          v56 = *((void *)v55 - 8);
          v57 = *((void *)v55 - 7);
          uint64_t v61 = __OFSUB__(v57, v56);
          unint64_t v58 = v57 - v56;
          if (v61) {
            goto LABEL_119;
          }
          uint64_t v60 = *((void *)v55 - 6);
          uint64_t v59 = *((void *)v55 - 5);
          uint64_t v61 = __OFSUB__(v59, v60);
          long long v53 = v59 - v60;
          unint64_t v54 = v61;
          if (v61) {
            goto LABEL_120;
          }
          char v62 = v13 - 2;
          v63 = &v48[16 * v13 - 32];
          uint64_t v65 = *(void *)v63;
          uint64_t v64 = *((void *)v63 + 1);
          uint64_t v61 = __OFSUB__(v64, v65);
          uint64_t v66 = v64 - v65;
          if (v61) {
            goto LABEL_122;
          }
          uint64_t v61 = __OFADD__(v53, v66);
          uint64_t v67 = v53 + v66;
          if (v61) {
            goto LABEL_125;
          }
          if (v67 >= v58)
          {
            uint64_t v85 = &v48[16 * v50];
            uint64_t v87 = *(void *)v85;
            BOOL v86 = *((void *)v85 + 1);
            uint64_t v61 = __OFSUB__(v86, v87);
            uint64_t v88 = v86 - v87;
            if (v61) {
              goto LABEL_129;
            }
            uint64_t v78 = v53 < v88;
            goto LABEL_83;
          }
        }
        else
        {
          if (v13 != 3)
          {
            BOOL v79 = *((void *)v12 + 4);
            uint64_t v80 = *((void *)v12 + 5);
            uint64_t v61 = __OFSUB__(v80, v79);
            uint64_t v72 = v80 - v79;
            uint64_t v73 = v61;
            goto LABEL_77;
          }
          uint64_t v52 = *((void *)v12 + 4);
          long long v51 = *((void *)v12 + 5);
          uint64_t v61 = __OFSUB__(v51, v52);
          long long v53 = v51 - v52;
          unint64_t v54 = v61;
        }
        if (v54) {
          goto LABEL_121;
        }
        char v62 = v13 - 2;
        uint64_t v68 = &v48[16 * v13 - 32];
        unint64_t v70 = *(void *)v68;
        BOOL v69 = *((void *)v68 + 1);
        v71 = __OFSUB__(v69, v70);
        uint64_t v72 = v69 - v70;
        uint64_t v73 = v71;
        if (v71) {
          goto LABEL_124;
        }
        uint64_t v74 = &v48[16 * v50];
        v76 = *(void *)v74;
        uint64_t v75 = *((void *)v74 + 1);
        uint64_t v61 = __OFSUB__(v75, v76);
        uint64_t v77 = v75 - v76;
        if (v61) {
          goto LABEL_127;
        }
        if (__OFADD__(v72, v77)) {
          goto LABEL_128;
        }
        if (v72 + v77 >= v53)
        {
          uint64_t v78 = v53 < v77;
LABEL_83:
          if (v78) {
            long long v50 = v62;
          }
          goto LABEL_85;
        }
LABEL_77:
        if (v73) {
          goto LABEL_123;
        }
        char v81 = &v48[16 * v50];
        uint64_t v83 = *(void *)v81;
        v82 = *((void *)v81 + 1);
        uint64_t v61 = __OFSUB__(v82, v83);
        uint64_t v84 = v82 - v83;
        if (v61) {
          goto LABEL_126;
        }
        if (v84 < v72) {
          goto LABEL_15;
        }
LABEL_85:
        v89 = v50 - 1;
        if (v50 - 1 >= v13)
        {
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
          goto LABEL_139;
        }
        if (!v11) {
          goto LABEL_142;
        }
        uint64_t v90 = v12;
        uint64_t v91 = &v48[16 * v89];
        uint64_t v92 = *(void *)v91;
        v93 = &v48[16 * v50];
        uint64_t v94 = *((void *)v93 + 1);
        specialized _merge<A>(low:mid:high:buffer:by:)((char *)(v11 + 48 * *(void *)v91), (char *)(v11 + 48 * *(void *)v93), v11 + 48 * v94, __dst);
        if (v1) {
          goto LABEL_93;
        }
        if (v94 < v92) {
          goto LABEL_116;
        }
        if (v50 > *((void *)v90 + 2)) {
          goto LABEL_117;
        }
        *(void *)uint64_t v91 = v92;
        *(void *)&v48[16 * v89 + 8] = v94;
        uint64_t v95 = *((void *)v90 + 2);
        if (v50 >= v95) {
          goto LABEL_118;
        }
        uint64_t v12 = v90;
        unint64_t v13 = v95 - 1;
        memmove(&v48[16 * v50], v93 + 16, 16 * (v95 - 1 - v50));
        *((void *)v90 + 2) = v95 - 1;
        uint64_t v11 = v123;
        if (v95 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v13 = 1;
LABEL_15:
    Swift::Int v6 = v121;
    Swift::Int v3 = v122;
    if (v10 >= v122)
    {
      uint64_t v9 = v120;
      goto LABEL_102;
    }
  }
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
  Swift::Int result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized MutableCollection<>._insertionSort(within:sortedEnd:by:)(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = *a4;
    uint64_t v5 = *a4 + 48 * a3 + 40;
LABEL_5:
    uint64_t v6 = v4 + 48 * a3;
    unint64_t v7 = *(void *)(v6 + 24);
    double v8 = *(double *)(v6 + 32);
    uint64_t v9 = result;
    uint64_t v10 = v5;
    while (1)
    {
      unint64_t v11 = *(void *)(v10 - 64);
      if (v7 == v11) {
        BOOL v12 = *(double *)(v10 - 56) < v8;
      }
      else {
        BOOL v12 = v11 < v7;
      }
      if (!v12)
      {
LABEL_4:
        ++a3;
        v5 += 48;
        if (a3 == a2) {
          return result;
        }
        goto LABEL_5;
      }
      if (!v4) {
        break;
      }
      unint64_t v13 = (_OWORD *)(v10 - 40);
      Swift::Int v14 = (_OWORD *)(v10 - 88);
      long long v16 = *(_OWORD *)(v10 - 72);
      long long v15 = *(_OWORD *)(v10 - 56);
      *(void *)(v10 - 48) = *(void *)v10;
      v10 -= 48;
      uint64_t v17 = *(void *)(v10 + 8);
      long long v18 = *(_OWORD *)(v10 + 16);
      _OWORD *v13 = *v14;
      v13[1] = v16;
      v13[2] = v15;
      *(void *)(v10 - 40) = v17;
      *(_OWORD *)(v10 - 32) = v18;
      *(void *)(v10 - 16) = v7;
      *(double *)(v10 - 8) = v8;
      if (a3 == ++v9) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t specialized _merge<A>(low:mid:high:buffer:by:)(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v6 = a2;
  unint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = (a2 - __src) / 48;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = (uint64_t)(a3 - (void)a2) / 48;
  uint64_t v35 = __src;
  uint64_t v34 = __dst;
  if (v9 >= v11)
  {
    if (v10 >= -47)
    {
      if (__dst != a2 || &a2[48 * v11] <= __dst) {
        memmove(__dst, a2, 48 * v11);
      }
      int v21 = &v4[48 * v11];
      uint64_t v33 = v21;
      uint64_t v35 = v6;
      if (v7 < v6 && v10 >= 48)
      {
        uint64_t v22 = (char *)(a3 - 48);
        do
        {
          double v23 = v22 + 48;
          unint64_t v24 = *((void *)v21 - 3);
          unint64_t v25 = *((void *)v6 - 3);
          if (v24 == v25) {
            BOOL v26 = *((double *)v6 - 2) < *((double *)v21 - 2);
          }
          else {
            BOOL v26 = v25 < v24;
          }
          if (v26)
          {
            uint64_t v27 = v6 - 48;
            if (v23 != v6 || v22 >= v6)
            {
              long long v28 = *(_OWORD *)v27;
              long long v29 = *((_OWORD *)v6 - 1);
              *((_OWORD *)v22 + 1) = *((_OWORD *)v6 - 2);
              *((_OWORD *)v22 + 2) = v29;
              *(_OWORD *)uint64_t v22 = v28;
            }
            uint64_t v35 = v6 - 48;
            if (v27 <= v7) {
              break;
            }
          }
          else
          {
            uint64_t v33 = v21 - 48;
            if (v23 < v21 || v22 >= v21 || v23 != v21)
            {
              long long v30 = *((_OWORD *)v21 - 3);
              long long v31 = *((_OWORD *)v21 - 1);
              *((_OWORD *)v22 + 1) = *((_OWORD *)v21 - 2);
              *((_OWORD *)v22 + 2) = v31;
              *(_OWORD *)uint64_t v22 = v30;
            }
            uint64_t v27 = v6;
            v21 -= 48;
            if (v6 <= v7) {
              break;
            }
          }
          v22 -= 48;
          uint64_t v6 = v27;
        }
        while (v21 > v4);
      }
LABEL_46:
      specialized $defer #1 <A>() in _merge<A>(low:mid:high:buffer:by:)((void **)&v35, &v34, &v33);
      return 1;
    }
  }
  else if (v8 >= -47)
  {
    if (__dst != __src || &__src[48 * v9] <= __dst) {
      memmove(__dst, __src, 48 * v9);
    }
    BOOL v12 = &v4[48 * v9];
    uint64_t v33 = v12;
    if ((unint64_t)v6 < a3 && v8 >= 48)
    {
      unint64_t v13 = v4;
      while (1)
      {
        unint64_t v14 = *((void *)v6 + 3);
        unint64_t v15 = *((void *)v13 + 3);
        if (v14 == v15) {
          BOOL v16 = *((double *)v13 + 4) < *((double *)v6 + 4);
        }
        else {
          BOOL v16 = v15 < v14;
        }
        if (v16)
        {
          uint64_t v17 = v6 + 48;
          long long v18 = v6;
          if (v7 == v6 && v7 < v17) {
            goto LABEL_21;
          }
        }
        else
        {
          uint64_t v4 = v13 + 48;
          long long v18 = v13;
          uint64_t v17 = v6;
          if (v7 == v13)
          {
            v13 += 48;
            if (v7 < v4) {
              goto LABEL_21;
            }
          }
          else
          {
            v13 += 48;
          }
        }
        long long v19 = *(_OWORD *)v18;
        long long v20 = *((_OWORD *)v18 + 2);
        *((_OWORD *)v7 + 1) = *((_OWORD *)v18 + 1);
        *((_OWORD *)v7 + 2) = v20;
        *(_OWORD *)unint64_t v7 = v19;
LABEL_21:
        v7 += 48;
        if (v13 < v12)
        {
          uint64_t v6 = v17;
          if ((unint64_t)v17 < a3) {
            continue;
          }
        }
        uint64_t v34 = v4;
        uint64_t v35 = v7;
        goto LABEL_46;
      }
    }
    goto LABEL_46;
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

{
  char *v4;
  char *v6;
  char *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  long long v16;
  long long v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  long long v22;
  long long v23;
  long long v24;
  long long v25;
  uint64_t result;
  char *v27;
  const void *v28;
  char *v29;

  uint64_t v4 = __dst;
  uint64_t v6 = a2;
  unint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = (a2 - __src) / 48;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = (uint64_t)(a3 - (void)a2) / 48;
  long long v29 = __src;
  long long v28 = __dst;
  if (v9 >= v11)
  {
    if (v10 >= -47)
    {
      if (__dst != a2 || &a2[48 * v11] <= __dst) {
        memmove(__dst, a2, 48 * v11);
      }
      long long v18 = &v4[48 * v11];
      uint64_t v27 = v18;
      long long v29 = v6;
      if (v7 < v6 && v10 >= 48)
      {
        long long v19 = (char *)(a3 - 48);
        do
        {
          long long v20 = v19 + 48;
          if (*((void *)v6 - 3) >= *((void *)v18 - 3))
          {
            uint64_t v27 = v18 - 48;
            if (v20 < v18 || v19 >= v18 || v20 != v18)
            {
              unint64_t v24 = *((_OWORD *)v18 - 3);
              unint64_t v25 = *((_OWORD *)v18 - 1);
              *((_OWORD *)v19 + 1) = *((_OWORD *)v18 - 2);
              *((_OWORD *)v19 + 2) = v25;
              *(_OWORD *)long long v19 = v24;
            }
            int v21 = v6;
            v18 -= 48;
            if (v6 <= v7) {
              break;
            }
          }
          else
          {
            int v21 = v6 - 48;
            if (v20 != v6 || v19 >= v6)
            {
              uint64_t v22 = *(_OWORD *)v21;
              double v23 = *((_OWORD *)v6 - 1);
              *((_OWORD *)v19 + 1) = *((_OWORD *)v6 - 2);
              *((_OWORD *)v19 + 2) = v23;
              *(_OWORD *)long long v19 = v22;
            }
            long long v29 = v6 - 48;
            if (v21 <= v7) {
              break;
            }
          }
          v19 -= 48;
          uint64_t v6 = v21;
        }
        while (v18 > v4);
      }
LABEL_40:
      specialized $defer #1 <A>() in _merge<A>(low:mid:high:buffer:by:)((void **)&v29, &v28, &v27);
      return 1;
    }
  }
  else if (v8 >= -47)
  {
    if (__dst != __src || &__src[48 * v9] <= __dst) {
      memmove(__dst, __src, 48 * v9);
    }
    BOOL v12 = &v4[48 * v9];
    uint64_t v27 = v12;
    if ((unint64_t)v6 < a3 && v8 >= 48)
    {
      unint64_t v13 = v4;
      while (1)
      {
        if (*((void *)v13 + 3) >= *((void *)v6 + 3))
        {
          uint64_t v4 = v13 + 48;
          unint64_t v15 = v13;
          unint64_t v14 = v6;
          if (v7 == v13)
          {
            v13 += 48;
            if (v7 < v4) {
              goto LABEL_18;
            }
          }
          else
          {
            v13 += 48;
          }
        }
        else
        {
          unint64_t v14 = v6 + 48;
          unint64_t v15 = v6;
          if (v7 == v6 && v7 < v14) {
            goto LABEL_18;
          }
        }
        BOOL v16 = *(_OWORD *)v15;
        uint64_t v17 = *((_OWORD *)v15 + 2);
        *((_OWORD *)v7 + 1) = *((_OWORD *)v15 + 1);
        *((_OWORD *)v7 + 2) = v17;
        *(_OWORD *)unint64_t v7 = v16;
LABEL_18:
        v7 += 48;
        if (v13 < v12)
        {
          uint64_t v6 = v14;
          if ((unint64_t)v14 < a3) {
            continue;
          }
        }
        long long v28 = v4;
        long long v29 = v7;
        goto LABEL_40;
      }
    }
    goto LABEL_40;
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

char *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Range<Int>>);
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
  unint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
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

char *specialized $defer #1 <A>() in _merge<A>(low:mid:high:buffer:by:)(void **a1, const void **a2, void *a3)
{
  Swift::Int v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  if (v4 <= -48)
  {
    uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v6 = v4 / 48;
    if (result != v3 || result >= &v3[48 * v6])
    {
      return (char *)memmove(result, v3, 48 * v6);
    }
  }
  return result;
}

char *specialized _ArrayBuffer._consumeAndCreateNew()(uint64_t a1)
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3)
{
  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *Swift::Int v3 = (char *)result;
  return result;
}

{
  char **v3;
  uint64_t result;

  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *Swift::Int v3 = (char *)result;
  return result;
}

uint64_t specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<EnhancedMSPSharedTripContact>);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[48 * v8]) {
      memmove(v12, v13, 48 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[48 * v8] || v12 >= &v13[48 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t result;

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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
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
  unint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
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
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized _ContiguousArrayBuffer._consumeAndCreateNew()(uint64_t a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t specialized _ArrayBuffer._copyContents(subRange:initializing:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 48 * a1 + 32;
    unint64_t v6 = a3 + 48 * v4;
    if (v5 >= v6 || v5 + 48 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay7SiriGeo28EnhancedMSPSharedTripContactVG_AHs5NeverOTg503_s7d5Geo14i65ServiceC30rankAndSortHandlesByPopularity15forHandleValuesSayAA021fgH18C0VGAH_tFA2GXEfU0_AF0iM0CSDySSSo8NSNumberCGSgTf1cn_nTf4ngg_n(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  int64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = MEMORY[0x263F8EE78];
  if (v5)
  {
    uint64_t v34 = MEMORY[0x263F8EE78];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v5, 0);
    uint64_t v6 = v34;
    uint64_t v8 = (void **)(a1 + 72);
    while (1)
    {
      double v9 = *((double *)v8 - 4);
      size_t v11 = *(v8 - 3);
      double v10 = *((double *)v8 - 2);
      double v12 = *((double *)v8 - 1);
      unint64_t v13 = *v8;
      *(void *)&v28[0] = *(v8 - 5);
      v28[1] = v9;
      *(void *)&v28[2] = v11;
      v28[3] = v10;
      v28[4] = v12;
      *(void *)&v28[5] = v13;
      id v14 = v13;
      swift_bridgeObjectRetain();
      id v15 = v11;
      closure #2 in ContactService.rankAndSortHandlesByPopularity(forHandleValues:)(v28, a2, a3, &v29);
      if (v4) {
        break;
      }
      uint64_t v4 = 0;

      swift_bridgeObjectRelease();
      uint64_t v16 = v29;
      long long v17 = v30;
      uint64_t v18 = v31;
      uint64_t v19 = v32;
      uint64_t v20 = v33;
      uint64_t v34 = v6;
      unint64_t v22 = *(void *)(v6 + 16);
      unint64_t v21 = *(void *)(v6 + 24);
      if (v22 >= v21 >> 1)
      {
        long long v25 = v30;
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v21 > 1, v22 + 1, 1);
        long long v17 = v25;
        uint64_t v6 = v34;
      }
      *(void *)(v6 + 16) = v22 + 1;
      uint64_t v23 = v6 + 48 * v22;
      *(void *)(v23 + 32) = v16;
      v8 += 6;
      *(_OWORD *)(v23 + 40) = v17;
      *(void *)(v23 + 56) = v18;
      *(void *)(v23 + 64) = v19;
      *(void *)(v23 + 72) = v20;
      if (!--v5) {
        return v6;
      }
    }
    swift_release();

    swift_bridgeObjectRelease();
  }
  return v6;
}

uint64_t sub_23FEA63CC()
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

void partial apply for closure #1 in ContactService.rankAndSortHandlesByPopularityAndType(forHandleValues:_:)(uint64_t a1, void *a2)
{
  closure #1 in ContactService.rankAndSortHandlesByPopularityAndType(forHandleValues:_:)(a1, a2, *(void *)(v2 + 16), *(void (**)(uint64_t))(v2 + 24));
}

unint64_t lazy protocol witness table accessor for type ContactServiceError and conformance ContactServiceError()
{
  unint64_t result = lazy protocol witness table cache variable for type ContactServiceError and conformance ContactServiceError;
  if (!lazy protocol witness table cache variable for type ContactServiceError and conformance ContactServiceError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactServiceError and conformance ContactServiceError);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ContactServiceError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ContactServiceError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x23FEA65DCLL);
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

uint64_t getEnumTag for ContactServiceError(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *destructiveInjectEnumTag for ContactServiceError(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ContactServiceError()
{
  return &type metadata for ContactServiceError;
}

uint64_t type metadata accessor for ContactService()
{
  return self;
}

unint64_t lazy protocol witness table accessor for type String and conformance String()
{
  unint64_t result = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
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

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t MapsService.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for OS_os_log);
  *(void *)(v0 + 16) = OS_os_log.init(subsystem:category:)();
  *(_OWORD *)(v0 + 24) = xmmword_23FEBCBA0;
  return v0;
}

uint64_t EnhancedMSPSharedTripContact.handle.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t EnhancedMSPSharedTripContact.handle.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*EnhancedMSPSharedTripContact.handle.modify())()
{
  return destructiveProjectEnumData for ContactServiceError;
}

id EnhancedMSPSharedTripContact.sharedTripContact.getter()
{
  return *(id *)(v0 + 16);
}

void EnhancedMSPSharedTripContact.sharedTripContact.setter(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
}

uint64_t (*EnhancedMSPSharedTripContact.sharedTripContact.modify())()
{
  return destructiveProjectEnumData for ContactServiceError;
}

uint64_t EnhancedMSPSharedTripContact.capabilityType.getter()
{
  return *(void *)(v0 + 24);
}

uint64_t EnhancedMSPSharedTripContact.capabilityType.setter(uint64_t result)
{
  *(void *)(v1 + 24) = result;
  return result;
}

uint64_t (*EnhancedMSPSharedTripContact.capabilityType.modify())()
{
  return destructiveProjectEnumData for ContactServiceError;
}

double EnhancedMSPSharedTripContact.popularity.getter()
{
  return *(double *)(v0 + 32);
}

void EnhancedMSPSharedTripContact.popularity.setter(double a1)
{
  *(double *)(v1 + 32) = a1;
}

uint64_t (*EnhancedMSPSharedTripContact.popularity.modify())()
{
  return destructiveProjectEnumData for ContactServiceError;
}

void *EnhancedMSPSharedTripContact.textMessageServiceName.getter()
{
  uint64_t v1 = *(void **)(v0 + 40);
  id v2 = v1;
  return v1;
}

void EnhancedMSPSharedTripContact.textMessageServiceName.setter(uint64_t a1)
{
  *(void *)(v1 + 40) = a1;
}

uint64_t (*EnhancedMSPSharedTripContact.textMessageServiceName.modify())()
{
  return destructiveProjectEnumData for ContactServiceError;
}

uint64_t EnhancedMSPSharedTripContact.fullName.getter()
{
  id v1 = objc_msgSend(*(id *)(v0 + 16), sel_contact);
  if (!v1) {
    goto LABEL_5;
  }
  id v2 = v1;
  id v3 = objc_msgSend(self, sel_stringFromContact_style_, v1, 0);
  if (!v3)
  {

LABEL_5:
    uint64_t v5 = *(void *)v0;
    swift_bridgeObjectRetain();
    return v5;
  }
  unsigned int v4 = v3;
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v5;
}

uint64_t EnhancedMSPSharedTripContact.contactId.getter()
{
  id v1 = objc_msgSend(*(id *)(v0 + 16), sel_contact);
  if (!v1) {
    return 0;
  }
  id v2 = v1;
  id v3 = objc_msgSend(v1, sel_identifier);
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v4;
}

uint64_t EnhancedMSPSharedTripContact.debugDescription.getter()
{
  _StringGuts.grow(_:)(91);
  v1._countAndFlagsBits = 0xD000000000000024;
  v1._object = (void *)0x800000023FEBD9F0;
  String.append(_:)(v1);
  uint64_t v2 = *(void *)v0;
  id v3 = *(void **)(v0 + 8);
  swift_bridgeObjectRetain();
  v4._countAndFlagsBits = v2;
  v4._object = v3;
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  v5._countAndFlagsBits = 0xD000000000000013;
  v5._object = (void *)0x800000023FEBDA20;
  String.append(_:)(v5);
  id v6 = *(id *)(v0 + 16);
  id v7 = objc_msgSend(v6, sel_description);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  double v10 = v9;

  v11._countAndFlagsBits = v8;
  v11._object = v10;
  String.append(_:)(v11);

  swift_bridgeObjectRelease();
  v12._object = (void *)0x800000023FEBDA40;
  v12._countAndFlagsBits = 0xD000000000000010;
  String.append(_:)(v12);
  v13._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v13);
  swift_bridgeObjectRelease();
  v14._countAndFlagsBits = 0x72616C75706F7020;
  v14._object = (void *)0xEC0000003A797469;
  String.append(_:)(v14);
  Double.write<A>(to:)();
  return 0;
}

void EnhancedMSPSharedTripContact.init(_:_:)(void *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  id v6 = objc_msgSend(a1, sel_displayName);
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;

  *a3 = v7;
  a3[1] = v9;
  a3[2] = (uint64_t)a1;
  a3[3] = a2;
  a3[4] = 0;
  a3[5] = 0;
}

Swift::UInt __swiftcall EnhancedMSPSharedTripContact.getCapabilityType()()
{
  return *(void *)(v0 + 24);
}

Swift::Bool __swiftcall EnhancedMSPSharedTripContact.isPhoneNumber()()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_isPhoneNumber);
}

INPersonHandle __swiftcall EnhancedMSPSharedTripContact.getPersonHandle()()
{
  return (INPersonHandle)specialized EnhancedMSPSharedTripContact.getPersonHandle()(*(void **)(v0 + 16));
}

BOOL static MapsService.ShareETAConfigurationError.__derived_enum_equals(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void MapsService.ShareETAConfigurationError.hash(into:)(uint64_t a1, char a2)
{
}

Swift::Int MapsService.ShareETAConfigurationError.hashValue.getter(char a1)
{
  return Hasher._finalize()();
}

id MapsService.logObject.getter()
{
  return *(id *)(v0 + 16);
}

uint64_t MapsService.timeout.getter()
{
  return 5;
}

void *MapsService.observer.getter()
{
  swift_beginAccess();
  Swift::String v1 = *(void **)(v0 + 32);
  id v2 = v1;
  return v1;
}

void MapsService.observer.setter(uint64_t a1)
{
  swift_beginAccess();
  id v3 = *(void **)(v1 + 32);
  *(void *)(v1 + 32) = a1;
}

uint64_t (*MapsService.observer.modify())()
{
  return MapsService.observer.modify;
}

id MapsService.CapabilityFetcherObserver.logObject.getter()
{
  return *(id *)(v0 + OBJC_IVAR____TtCC7SiriGeo11MapsService25CapabilityFetcherObserver_logObject);
}

uint64_t MapsService.CapabilityFetcherObserver.timeout.getter()
{
  return 5;
}

id MapsService.CapabilityFetcherObserver.levelFetcher.getter()
{
  return *(id *)(v0 + OBJC_IVAR____TtCC7SiriGeo11MapsService25CapabilityFetcherObserver_levelFetcher);
}

uint64_t key path getter for MapsService.CapabilityFetcherObserver.completion : MapsService.CapabilityFetcherObserver@<X0>(void **a1@<X0>, void *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x78))();
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = v4;
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v5;
    *(void *)(result + 24) = v6;
    uint64_t v7 = partial apply for thunk for @escaping @callee_guaranteed (@guaranteed [EnhancedMSPSharedTripContact]) -> ();
  }
  else
  {
    uint64_t v7 = 0;
  }
  *a2 = v7;
  a2[1] = result;
  return result;
}

uint64_t key path setter for MapsService.CapabilityFetcherObserver.completion : MapsService.CapabilityFetcherObserver(uint64_t *a1, void **a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed [EnhancedMSPSharedTripContact]) -> (@out ());
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v7 = *(uint64_t (**)(uint64_t (*)(uint64_t), uint64_t))((*MEMORY[0x263F8EED0] & **a2) + 0x80);
  outlined copy of (@escaping @callee_guaranteed (@guaranteed [EnhancedMSPSharedTripContact]) -> ())?(v3);
  return v7(v6, v5);
}

uint64_t MapsService.CapabilityFetcherObserver.completion.getter()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtCC7SiriGeo11MapsService25CapabilityFetcherObserver_completion);
  swift_beginAccess();
  uint64_t v2 = *v1;
  outlined copy of (@escaping @callee_guaranteed (@guaranteed [EnhancedMSPSharedTripContact]) -> ())?(*v1);
  return v2;
}

uint64_t MapsService.CapabilityFetcherObserver.completion.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (uint64_t *)(v2 + OBJC_IVAR____TtCC7SiriGeo11MapsService25CapabilityFetcherObserver_completion);
  swift_beginAccess();
  uint64_t v6 = *v5;
  *uint64_t v5 = a1;
  v5[1] = a2;
  return outlined consume of (@escaping @callee_guaranteed (@guaranteed [EnhancedMSPSharedTripContact]) -> ())?(v6);
}

uint64_t (*MapsService.CapabilityFetcherObserver.completion.modify())()
{
  return MapsService.CapabilityFetcherObserver.completion.modify;
}

uint64_t MapsService.CapabilityFetcherObserver.completion.modify()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t MapsService.CapabilityFetcherObserver.capabilities.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t MapsService.CapabilityFetcherObserver.capabilities.setter(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtCC7SiriGeo11MapsService25CapabilityFetcherObserver_capabilities);
  swift_beginAccess();
  *uint64_t v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*MapsService.CapabilityFetcherObserver.capabilities.modify())()
{
  return MapsService.observer.modify;
}

id MapsService.CapabilityFetcherObserver.__allocating_init(_:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  id v4 = specialized MapsService.CapabilityFetcherObserver.init(_:)(a1);

  return v4;
}

id MapsService.CapabilityFetcherObserver.init(_:)(void *a1)
{
  id v2 = specialized MapsService.CapabilityFetcherObserver.init(_:)(a1);

  return v2;
}

void MapsService.CapabilityFetcherObserver.fetchCapabilities(_:_:)(unint64_t a1, void (*a2)(void), uint64_t a3)
{
  id v4 = v3;
  static os_log_type_t.info.getter();
  uint64_t v8 = *(void *)((char *)v4 + OBJC_IVAR____TtCC7SiriGeo11MapsService25CapabilityFetcherObserver_logObject);
  uint64_t v9 = MEMORY[0x263F8EE78];
  os_log(_:dso:log:_:_:)();
  double v10 = *(void (**)(void (*)(void), uint64_t))((*MEMORY[0x263F8EED0] & *v4) + 0x80);
  swift_retain();
  v10(a2, a3);
  unint64_t v80 = v9;
  static os_log_type_t.info.getter();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_23FEBCBD0;
  *(void *)(v11 + 56) = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [MSPSharedTripContact]);
  *(void *)(v11 + 64) = lazy protocol witness table accessor for type [CNContact] and conformance [A]((unint64_t *)&lazy protocol witness table cache variable for type [MSPSharedTripContact] and conformance [A], &demangling cache variable for type metadata for [MSPSharedTripContact]);
  *(void *)(v11 + 32) = v9;
  unint64_t v12 = 0xE400000000000000;
  uint64_t v13 = 1702195828;
  if ((v9 & 0xC000000000000000) != 0)
  {
    uint64_t v49 = _CocoaArrayWrapper.endIndex.getter();
    uint64_t v13 = v49 ? 0x65736C6166 : 1702195828;
    if (v49) {
      unint64_t v12 = 0xE500000000000000;
    }
  }
  *(void *)(v11 + 96) = MEMORY[0x263F8D310];
  *(void *)(v11 + 104) = lazy protocol witness table accessor for type String and conformance String();
  *(void *)(v11 + 72) = v13;
  *(void *)(v11 + 80) = v12;
  log = v8;
  os_log(_:dso:log:_:_:)();
  swift_bridgeObjectRelease();
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v14 = _CocoaArrayWrapper.endIndex.getter();
    p_opt_class_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___NSCopying + 48);
    if (v14) {
      goto LABEL_4;
    }
LABEL_32:
    swift_bridgeObjectRelease();
    unint64_t v48 = MEMORY[0x263F8EE78];
    goto LABEL_33;
  }
  uint64_t v14 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  p_opt_class_meths = &OBJC_PROTOCOL___NSCopying.opt_class_meths;
  if (!v14) {
    goto LABEL_32;
  }
LABEL_4:
  uint64_t v67 = *(uint64_t (**)(void *))((*MEMORY[0x263F8EED0] & *v4) + 0xA0);
  if (v14 < 1)
  {
    __break(1u);
LABEL_50:
    swift_bridgeObjectRetain();
    uint64_t v55 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    goto LABEL_36;
  }
  char v62 = a2;
  uint64_t v16 = 0;
  id v68 = *(id *)((char *)p_opt_class_meths[71] + (void)v4);
  unint64_t v64 = a1 & 0xC000000000000001;
  uint64_t v65 = v14;
  uint64_t v66 = v4;
  do
  {
    if (v64) {
      id v17 = (id)MEMORY[0x2455DB020](v16, a1);
    }
    else {
      id v17 = *(id *)(a1 + 8 * v16 + 32);
    }
    id v18 = v17;
    id v19 = objc_msgSend(v68, sel_capabilityLevelForContact_, v18);
    id v20 = objc_msgSend(v18, sel_displayName);
    uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v23 = v22;

    id v24 = 0;
    uint64_t v74 = v21;
    uint64_t v75 = v23;
    id v76 = v18;
    id v77 = v19;
    uint64_t v78 = 0;
    id v79 = 0;
    if (v19 == (id)2)
    {
      id v25 = objc_msgSend(v68, sel_serviceNameForContact_, v18);
      if (v25)
      {
        BOOL v26 = v25;
        id v24 = (id)MSPSharedTripServiceNameForRawServiceName();

        swift_beginAccess();
        uint64_t v27 = v79;
        id v79 = v24;
      }
      else
      {
        id v24 = 0;
      }
      os_log_type_t v28 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(log, v28))
      {
        uint64_t v29 = swift_slowAlloc();
        long long v30 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v29 = 138412290;
        swift_beginAccess();
        id v24 = v79;
        *(void *)(v29 + 4) = v79;
        *long long v30 = v24;
        id v31 = v24;
        _os_log_impl(&dword_23FE9C000, log, v28, "serviceName: %@", (uint8_t *)v29, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        swift_arrayDestroy();
        MEMORY[0x2455DB720](v30, -1, -1);
        MEMORY[0x2455DB720](v29, -1, -1);
      }
    }
    swift_beginAccess();
    id v70 = v77;
    if (!v77)
    {
      id v32 = v18;
      MEMORY[0x2455DAE70]();
      if (*(void *)((v80 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v80 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      }
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();
    }
    id v71 = v24;
    uint64_t v72 = v18;
    uint64_t v33 = v16;
    unint64_t v34 = a1;
    uint64_t v35 = v75;
    uint64_t v69 = v74;
    long long v36 = v76;
    uint64_t v37 = v78;
    id v38 = v24;
    swift_bridgeObjectRetain();
    id v39 = v36;
    uint64_t v40 = (void (*)(void *, void))v67(v73);
    unint64_t v42 = v41;
    double v43 = *v41;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    void *v42 = v43;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      double v43 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v43[2] + 1, 1, v43);
      void *v42 = v43;
    }
    unint64_t v46 = v43[2];
    unint64_t v45 = v43[3];
    if (v46 >= v45 >> 1)
    {
      double v43 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v45 > 1), v46 + 1, 1, v43);
      void *v42 = v43;
    }
    a1 = v34;
    uint64_t v16 = v33 + 1;
    v43[2] = v46 + 1;
    BOOL v47 = &v43[6 * v46];
    v47[4] = v69;
    v47[5] = v35;
    v47[6] = v39;
    v47[7] = v70;
    v47[8] = v37;
    v47[9] = v71;
    v40(v73, 0);

    swift_bridgeObjectRelease();
    id v4 = v66;
  }
  while (v65 != v33 + 1);
  swift_bridgeObjectRelease();
  unint64_t v48 = v80;
  a2 = v62;
LABEL_33:
  swift_bridgeObjectRetain_n();
  LOBYTE(v12) = static os_log_type_t.default.getter();
  if (!os_log_type_enabled(log, (os_log_type_t)v12))
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_44;
  }
  uint64_t v9 = swift_slowAlloc();
  uint64_t v8 = swift_slowAlloc();
  uint64_t v74 = v8;
  *(_DWORD *)uint64_t v9 = 136315394;
  uint64_t v50 = type metadata accessor for OS_os_log(0, (unint64_t *)&lazy cache variable for type metadata for MSPSharedTripContact);
  uint64_t v51 = swift_bridgeObjectRetain();
  uint64_t v52 = MEMORY[0x2455DAEA0](v51, v50);
  unint64_t v54 = v53;
  swift_bridgeObjectRelease();
  v73[0] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v52, v54, &v74);
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  *(_WORD *)(v9 + 12) = 2080;
  if (v48 >> 62) {
    goto LABEL_50;
  }
  uint64_t v55 = *(void *)((v48 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_36:
  if (v55) {
    uint64_t v56 = 0x65736C6166;
  }
  else {
    uint64_t v56 = 1702195828;
  }
  if (v55) {
    unint64_t v57 = 0xE500000000000000;
  }
  else {
    unint64_t v57 = 0xE400000000000000;
  }
  v73[0] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v56, v57, &v74);
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  _os_log_impl(&dword_23FE9C000, log, (os_log_type_t)v12, "fetchCapabilities for: %s %s", (uint8_t *)v9, 0x16u);
  swift_arrayDestroy();
  MEMORY[0x2455DB720](v8, -1, -1);
  MEMORY[0x2455DB720](v9, -1, -1);
LABEL_44:
  swift_beginAccess();
  if (v80 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v60 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v60) {
      goto LABEL_46;
    }
  }
  else if (*(void *)((v80 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_46:
    unint64_t v58 = *(void **)((char *)v4 + OBJC_IVAR____TtCC7SiriGeo11MapsService25CapabilityFetcherObserver_levelFetcher);
    objc_msgSend(v58, sel_registerObserver_, v4, v62);
    type metadata accessor for OS_os_log(0, (unint64_t *)&lazy cache variable for type metadata for MSPSharedTripContact);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    objc_msgSend(v58, sel_requestCapabilityLevelsForContacts_, isa);

    return;
  }
  uint64_t v61 = swift_bridgeObjectRelease();
  (*(void (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v4) + 0x90))(v61);
  a2();
  swift_bridgeObjectRelease();
}

Swift::Void __swiftcall MapsService.CapabilityFetcherObserver.capabilityLevelsDidUpdate()()
{
  uint64_t v1 = v0;
  static os_log_type_t.info.getter();
  uint64_t v2 = os_log(_:dso:log:_:_:)();
  id v3 = *(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v0) + 0x90);
  unint64_t v4 = *(void *)(v3(v2) + 16);
  uint64_t v5 = swift_bridgeObjectRelease();
  if (v4)
  {
    unint64_t v6 = 0;
    uint64_t v60 = OBJC_IVAR____TtCC7SiriGeo11MapsService25CapabilityFetcherObserver_levelFetcher;
    uint64_t v7 = -(uint64_t)v4;
    char v8 = 1;
    unint64_t v64 = v3;
    uint64_t v65 = v1;
    unint64_t v56 = v4;
    uint64_t v59 = -(uint64_t)v4;
LABEL_3:
    char v57 = v8;
    if (v6 <= v4) {
      unint64_t v9 = v4;
    }
    else {
      unint64_t v9 = v6;
    }
    uint64_t v10 = -(uint64_t)v9;
    uint64_t v11 = 48 * v6++ + 72;
    uint64_t v58 = -(uint64_t)v9;
    do
    {
      if (v10 + v6 == 1)
      {
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
LABEL_30:
        __break(1u);
LABEL_31:
        __break(1u);
        return;
      }
      unint64_t v12 = v6 - 1;
      uint64_t v13 = v3(v5);
      if (v6 - 1 >= *(void *)(v13 + 16)) {
        goto LABEL_27;
      }
      uint64_t v14 = *(void *)(v13 + v11 - 16);
      uint64_t v5 = swift_bridgeObjectRelease();
      if (!v14)
      {
        static os_log_type_t.info.getter();
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
        uint64_t v15 = swift_allocObject();
        *(_OWORD *)(v15 + 16) = xmmword_23FEBCB50;
        uint64_t v16 = ((uint64_t (*)(void))v3)();
        if (v12 >= *(void *)(v16 + 16)) {
          goto LABEL_28;
        }
        uint64_t v17 = *(void *)(v16 + v11 - 40);
        uint64_t v18 = *(void *)(v16 + v11 - 32);
        id v20 = *(void **)(v16 + v11 - 24);
        uint64_t v19 = *(void *)(v16 + v11 - 16);
        uint64_t v21 = *(void *)(v16 + v11 - 8);
        uint64_t v22 = *(void **)(v16 + v11);
        id v63 = v22;
        swift_bridgeObjectRetain();
        id v23 = v20;
        uint64_t v24 = swift_bridgeObjectRelease();
        uint64_t v74 = v17;
        uint64_t v75 = v18;
        id v76 = v23;
        uint64_t v77 = v19;
        uint64_t v78 = v21;
        id v79 = v22;
        uint64_t v1 = v65;
        uint64_t v25 = EnhancedMSPSharedTripContact.description.getter(v24);
        uint64_t v27 = v26;

        id v3 = v64;
        swift_bridgeObjectRelease();
        *(void *)(v15 + 56) = MEMORY[0x263F8D310];
        unint64_t v28 = lazy protocol witness table accessor for type String and conformance String();
        *(void *)(v15 + 64) = v28;
        *(void *)(v15 + 32) = v25;
        *(void *)(v15 + 40) = v27;
        os_log(_:dso:log:_:_:)();
        uint64_t v29 = swift_bridgeObjectRelease();
        long long v30 = *(void **)((char *)v65 + v60);
        uint64_t v31 = v64(v29);
        if (v12 >= *(void *)(v31 + 16)) {
          goto LABEL_29;
        }
        id v32 = *(id *)(v31 + v11 - 24);
        swift_bridgeObjectRelease();
        id v33 = objc_msgSend(v30, sel_capabilityLevelForContact_, v32);

        id v66 = v33;
        if (!v33)
        {
          char v8 = 0;
          uint64_t v7 = v59;
          unint64_t v4 = v56;
          if (v59 + v6) {
            goto LABEL_3;
          }
          return;
        }
        static os_log_type_t.info.getter();
        uint64_t v34 = swift_allocObject();
        *(_OWORD *)(v34 + 16) = xmmword_23FEBCBD0;
        uint64_t v35 = ((uint64_t (*)(void))v64)();
        if (v12 >= *(void *)(v35 + 16)) {
          goto LABEL_30;
        }
        uint64_t v36 = *(void *)(v35 + v11 - 40);
        uint64_t v37 = *(void *)(v35 + v11 - 32);
        id v39 = *(void **)(v35 + v11 - 24);
        uint64_t v38 = *(void *)(v35 + v11 - 16);
        uint64_t v40 = *(void *)(v35 + v11 - 8);
        unint64_t v62 = v28;
        uint64_t v41 = *(void **)(v35 + v11);
        id v61 = v41;
        swift_bridgeObjectRetain();
        id v42 = v39;
        uint64_t v43 = swift_bridgeObjectRelease();
        uint64_t v68 = v36;
        uint64_t v69 = v37;
        id v70 = v42;
        uint64_t v71 = v38;
        uint64_t v72 = v40;
        uint64_t v73 = v41;
        uint64_t v44 = EnhancedMSPSharedTripContact.description.getter(v43);
        uint64_t v46 = v45;

        uint64_t v1 = v65;
        swift_bridgeObjectRelease();
        *(void *)(v34 + 56) = MEMORY[0x263F8D310];
        *(void *)(v34 + 64) = v62;
        *(void *)(v34 + 32) = v44;
        *(void *)(v34 + 40) = v46;
        *(void *)(v34 + 96) = MEMORY[0x263F8D9D0];
        *(void *)(v34 + 104) = MEMORY[0x263F8DA20];
        *(void *)(v34 + 72) = v66;
        os_log(_:dso:log:_:_:)();
        swift_bridgeObjectRelease();
        BOOL v47 = (uint64_t (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))((*MEMORY[0x263F8EED0] & *v65)
                                                                                          + 0xA0))(v67);
        uint64_t v49 = v48;
        uint64_t v50 = *v48;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *uint64_t v49 = v50;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          uint64_t v50 = specialized _ArrayBuffer._consumeAndCreateNew()(v50);
          *uint64_t v49 = v50;
        }
        uint64_t v10 = v58;
        uint64_t v7 = v59;
        id v3 = v64;
        if (v12 >= v50[2]) {
          goto LABEL_31;
        }
        *(void *)((char *)v50 + v11 - 16) = v66;
        uint64_t v5 = v47(v67, 0);
      }
      ++v6;
      v11 += 48;
    }
    while (v7 + v6 != 1);
    if ((v57 & 1) == 0) {
      return;
    }
  }
  uint64_t v52 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v1) + 0x78))(v5);
  if (v52)
  {
    unint64_t v53 = (void (*)(void))v52;
    static os_log_type_t.info.getter();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
    uint64_t v54 = swift_allocObject();
    *(_OWORD *)(v54 + 16) = xmmword_23FEBCB50;
    uint64_t v55 = ((uint64_t (*)(void))v3)();
    *(void *)(v54 + 56) = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [EnhancedMSPSharedTripContact]);
    *(void *)(v54 + 64) = lazy protocol witness table accessor for type [CNContact] and conformance [A](&lazy protocol witness table cache variable for type [EnhancedMSPSharedTripContact] and conformance [A], &demangling cache variable for type metadata for [EnhancedMSPSharedTripContact]);
    *(void *)(v54 + 32) = v55;
    os_log(_:dso:log:_:_:)();
    swift_bridgeObjectRelease();
    v3((uint64_t)objc_msgSend(*(id *)((char *)v1 + OBJC_IVAR____TtCC7SiriGeo11MapsService25CapabilityFetcherObserver_levelFetcher), sel_unregisterObserver_, v1));
    v53();
    swift_bridgeObjectRelease();
    outlined consume of (@escaping @callee_guaranteed (@guaranteed [EnhancedMSPSharedTripContact]) -> ())?((uint64_t)v53);
  }
  else
  {
    static os_log_type_t.error.getter();
    os_log(_:dso:log:_:_:)();
  }
}

id MapsService.CapabilityFetcherObserver.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void MapsService.CapabilityFetcherObserver.init()()
{
}

id MapsService.CapabilityFetcherObserver.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MapsService.CapabilityFetcherObserver();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void MapsService.fetchCapabilities(for:_:)(uint64_t a1, void (*a2)(void, void *), uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = *(NSObject **)(v3 + 16);
  swift_bridgeObjectRetain_n();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    unint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v33 = a3;
    uint64_t v10 = swift_slowAlloc();
    uint64_t v34 = v10;
    *(_DWORD *)unint64_t v9 = 136315138;
    uint64_t v11 = swift_bridgeObjectRetain();
    uint64_t v12 = MEMORY[0x2455DAEA0](v11, MEMORY[0x263F8D310]);
    unint64_t v14 = v13;
    swift_bridgeObjectRelease();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v12, v14, &v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23FE9C000, v7, v8, "fetchCapabilities %s", v9, 0xCu);
    swift_arrayDestroy();
    uint64_t v15 = v10;
    a3 = v33;
    MEMORY[0x2455DB720](v15, -1, -1);
    MEMORY[0x2455DB720](v9, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }
  uint64_t v16 = self;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  id v18 = objc_msgSend(v16, sel_contactsFromHandles_, isa);

  type metadata accessor for OS_os_log(0, (unint64_t *)&lazy cache variable for type metadata for MSPSharedTripContact);
  uint64_t v19 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  static os_log_type_t.info.getter();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
  uint64_t v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_23FEBCB50;
  *(void *)(v20 + 56) = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [MSPSharedTripContact]);
  *(void *)(v20 + 64) = lazy protocol witness table accessor for type [CNContact] and conformance [A]((unint64_t *)&lazy protocol witness table cache variable for type [MSPSharedTripContact] and conformance [A], &demangling cache variable for type metadata for [MSPSharedTripContact]);
  *(void *)(v20 + 32) = v19;
  swift_bridgeObjectRetain();
  os_log(_:dso:log:_:_:)();
  swift_bridgeObjectRelease();
  id v21 = objc_msgSend(self, sel_sharedFetcher);
  if (v21)
  {
    uint64_t v22 = v21;
    id v23 = objc_allocWithZone((Class)type metadata accessor for MapsService.CapabilityFetcherObserver());
    id v24 = v22;
    id v25 = specialized MapsService.CapabilityFetcherObserver.init(_:)(v24);

    uint64_t v26 = (*(uint64_t (**)(id))(*(void *)v4 + 112))(v25);
    uint64_t v27 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 104))(v26);
    if (v27)
    {
      unint64_t v28 = (void *)v27;
      uint64_t v29 = (void *)swift_allocObject();
      v29[2] = v4;
      v29[3] = a2;
      v29[4] = a3;
      long long v30 = *(void (**)(uint64_t, uint64_t (*)(uint64_t), void *))((*MEMORY[0x263F8EED0] & *v28)
                                                                                      + 0xB0);
      swift_retain();
      swift_retain();
      v30(v19, partial apply for closure #1 in MapsService.fetchCapabilities(for:_:), v29);

      swift_release();
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    static os_log_type_t.error.getter();
    os_log(_:dso:log:_:_:)();
    lazy protocol witness table accessor for type MapsServiceError and conformance MapsServiceError();
    uint64_t v31 = (void *)swift_allocError();
    *id v32 = 0xD00000000000001BLL;
    v32[1] = 0x800000023FEBDBC0;
    a2(0, v31);
  }
}

uint64_t closure #1 in MapsService.fetchCapabilities(for:_:)(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, void))
{
  uint64_t v5 = *(NSObject **)(a2 + 16);
  swift_bridgeObjectRetain_n();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    unint64_t v14 = a3;
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v15 = v8;
    *(_DWORD *)uint64_t v7 = 136315138;
    uint64_t v9 = swift_bridgeObjectRetain();
    uint64_t v10 = MEMORY[0x2455DAEA0](v9, &type metadata for EnhancedMSPSharedTripContact);
    unint64_t v12 = v11;
    swift_bridgeObjectRelease();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v10, v12, &v15);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23FE9C000, v5, v6, "fetchCapabilities completion handler %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2455DB720](v8, -1, -1);
    MEMORY[0x2455DB720](v7, -1, -1);
    return v14(a1, 0);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    return a3(a1, 0);
  }
}

uint64_t static MapsService.shareETAConfigurationCheck(_:)(NSObject *a1)
{
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(a1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_23FE9C000, a1, v2, "shareETAConfigurationCheck", v3, 2u);
    MEMORY[0x2455DB720](v3, -1, -1);
  }
  if ((MSPSharedTripUserEnabled() & 1) == 0)
  {
    os_log_type_t v5 = static os_log_type_t.default.getter();
    if (!os_log_type_enabled(a1, v5)) {
      return 0;
    }
    os_log_type_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v6 = 0;
    _os_log_impl(&dword_23FE9C000, a1, v5, "MSPSharedTripUserEnabled failed", v6, 2u);
    uint64_t v4 = 0;
    goto LABEL_10;
  }
  if ((MSPSharedTripNetworkEnabled() & 1) == 0)
  {
    os_log_type_t v7 = static os_log_type_t.default.getter();
    if (!os_log_type_enabled(a1, v7)) {
      return 1;
    }
    os_log_type_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v6 = 0;
    _os_log_impl(&dword_23FE9C000, a1, v7, "MSPSharedTripNetworkEnabled failed", v6, 2u);
    uint64_t v4 = 1;
LABEL_10:
    MEMORY[0x2455DB720](v6, -1, -1);
    return v4;
  }
  return 2;
}

uint64_t MapsService.deinit()
{
  return v0;
}

uint64_t MapsService.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t MapsService.init()()
{
  type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for OS_os_log);
  *(void *)(v0 + 16) = OS_os_log.init(subsystem:category:)();
  *(_OWORD *)(v0 + 24) = xmmword_23FEBCBA0;
  return v0;
}

void closure #1 in OSLogArguments.append(_:)(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  os_log_type_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  *a1 = v7;
  uint64_t v8 = *a2;
  if (*a2)
  {
    void *v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

void *specialized _ArrayBuffer._consumeAndCreateNew()(void *a1)
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, a1[2], 0, a1);
}

id specialized MapsService.CapabilityFetcherObserver.init(_:)(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtCC7SiriGeo11MapsService25CapabilityFetcherObserver_logObject;
  type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for OS_os_log);
  uint64_t v4 = v1;
  *(void *)&v1[v3] = OS_os_log.init(subsystem:category:)();
  *(void *)&v4[OBJC_IVAR____TtCC7SiriGeo11MapsService25CapabilityFetcherObserver_timeout] = 5;
  os_log_type_t v5 = &v4[OBJC_IVAR____TtCC7SiriGeo11MapsService25CapabilityFetcherObserver_completion];
  *(void *)os_log_type_t v5 = 0;
  *((void *)v5 + 1) = 0;
  *(void *)&v4[OBJC_IVAR____TtCC7SiriGeo11MapsService25CapabilityFetcherObserver_capabilities] = MEMORY[0x263F8EE78];
  *(void *)&v4[OBJC_IVAR____TtCC7SiriGeo11MapsService25CapabilityFetcherObserver_levelFetcher] = a1;
  id v6 = a1;

  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for MapsService.CapabilityFetcherObserver();
  return objc_msgSendSuper2(&v8, sel_init);
}

id specialized EnhancedMSPSharedTripContact.getPersonHandle()(void *a1)
{
  id v2 = objc_msgSend(a1, sel_in_labeledValue);
  id v3 = objc_msgSend(a1, sel_stringValue);
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  if (objc_msgSend(a1, sel_isPhoneNumber)) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 1;
  }
  if (v2)
  {
    id v9 = v2;
    id v10 = objc_msgSend(v9, sel_label);
    if (v10)
    {
      unint64_t v11 = v10;
      uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v14 = v13;
    }
    else
    {
      uint64_t v12 = 0;
      unint64_t v14 = 0xE000000000000000;
    }
    uint64_t v15 = (void *)MEMORY[0x2455DADE0](v12, v14);
    swift_bridgeObjectRelease();
    if (v7)
    {
      uint64_t v16 = (void *)MEMORY[0x2455DADE0](v5, v7);
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v16 = 0;
    }
    id v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FD20]), sel_initWithValue_type_label_, v16, v8, v15);
  }
  else
  {
    if (v7)
    {
      uint64_t v15 = (void *)MEMORY[0x2455DADE0](v5, v7);
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v15 = 0;
    }
    id v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FD20]), sel_initWithValue_type_, v15, v8);
  }

  return v17;
}

uint64_t outlined copy of (@escaping @callee_guaranteed (@guaranteed [EnhancedMSPSharedTripContact]) -> ())?(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t outlined consume of (@escaping @callee_guaranteed (@guaranteed [EnhancedMSPSharedTripContact]) -> ())?(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t type metadata accessor for MapsService.CapabilityFetcherObserver()
{
  return self;
}

unint64_t lazy protocol witness table accessor for type MapsServiceError and conformance MapsServiceError()
{
  unint64_t result = lazy protocol witness table cache variable for type MapsServiceError and conformance MapsServiceError;
  if (!lazy protocol witness table cache variable for type MapsServiceError and conformance MapsServiceError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MapsServiceError and conformance MapsServiceError);
  }
  return result;
}

uint64_t sub_23FEA90F0()
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t partial apply for closure #1 in MapsService.fetchCapabilities(for:_:)(uint64_t a1)
{
  return closure #1 in MapsService.fetchCapabilities(for:_:)(a1, *(void *)(v1 + 16), *(uint64_t (**)(uint64_t, void))(v1 + 24));
}

unint64_t lazy protocol witness table accessor for type MapsService.ShareETAConfigurationError and conformance MapsService.ShareETAConfigurationError()
{
  unint64_t result = lazy protocol witness table cache variable for type MapsService.ShareETAConfigurationError and conformance MapsService.ShareETAConfigurationError;
  if (!lazy protocol witness table cache variable for type MapsService.ShareETAConfigurationError and conformance MapsService.ShareETAConfigurationError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MapsService.ShareETAConfigurationError and conformance MapsService.ShareETAConfigurationError);
  }
  return result;
}

uint64_t sub_23FEA9194@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 104))();
  *a2 = result;
  return result;
}

uint64_t sub_23FEA91E0(id *a1, uint64_t a2)
{
  id v2 = *a1;
  id v3 = *(uint64_t (**)(id))(**(void **)a2 + 112);
  id v4 = *a1;
  return v3(v2);
}

uint64_t sub_23FEA9240@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x90))();
  *a2 = result;
  return result;
}

uint64_t sub_23FEA929C(uint64_t a1, void **a2)
{
  id v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & **a2) + 0x98);
  uint64_t v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

uint64_t initializeBufferWithCopyOfBuffer for EnhancedMSPSharedTripContact(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for EnhancedMSPSharedTripContact(uint64_t a1)
{
  swift_bridgeObjectRelease();

  uint64_t v2 = *(void **)(a1 + 40);
}

uint64_t initializeWithCopy for EnhancedMSPSharedTripContact(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  id v4 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v5 = *(void **)(a2 + 40);
  *(void *)(a1 + 40) = v5;
  swift_bridgeObjectRetain();
  id v6 = v4;
  id v7 = v5;
  return a1;
}

void *assignWithCopy for EnhancedMSPSharedTripContact(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  id v4 = (void *)a2[2];
  uint64_t v5 = (void *)a1[2];
  a1[2] = v4;
  id v6 = v4;

  a1[3] = a2[3];
  a1[4] = a2[4];
  id v7 = (void *)a1[5];
  uint64_t v8 = (void *)a2[5];
  a1[5] = v8;
  id v9 = v8;

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

uint64_t assignWithTake for EnhancedMSPSharedTripContact(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  id v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v5 = *(void **)(a1 + 40);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);

  return a1;
}

uint64_t getEnumTagSinglePayload for EnhancedMSPSharedTripContact(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EnhancedMSPSharedTripContact(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for EnhancedMSPSharedTripContact()
{
  return &type metadata for EnhancedMSPSharedTripContact;
}

void *initializeBufferWithCopyOfBuffer for MapsServiceError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for MapsServiceError()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for MapsServiceError(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for MapsServiceError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MapsServiceError(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for MapsServiceError(uint64_t result, int a2, int a3)
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

uint64_t getEnumTag for MapsServiceError()
{
  return 0;
}

ValueMetadata *type metadata accessor for MapsServiceError()
{
  return &type metadata for MapsServiceError;
}

uint64_t type metadata accessor for MapsService()
{
  return self;
}

unsigned char *storeEnumTagSinglePayload for MapsService.ShareETAConfigurationError(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 1;
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
        JUMPOUT(0x23FEA97C0);
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
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MapsService.ShareETAConfigurationError()
{
  return &type metadata for MapsService.ShareETAConfigurationError;
}

uint64_t sub_23FEA97F8()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed [EnhancedMSPSharedTripContact]) -> (@out ())(uint64_t a1)
{
  unint64_t v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  uint64_t v4 = a1;
  return v2(&v4);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@guaranteed [EnhancedMSPSharedTripContact]) -> ()(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t static UsoRequest.makeSDAForPromptForContactValue()()
{
  uint64_t v0 = type metadata accessor for Siri_Nlu_External_SystemPrompted();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  unsigned int v6 = (char *)&v9 - v5;
  type metadata accessor for UsoTaskBuilder_noVerb_common_Person();
  swift_allocObject();
  uint64_t v7 = UsoTaskBuilder_noVerb_common_Person.init()();
  type metadata accessor for UsoEntityBuilder_common_Person();
  swift_allocObject();
  UsoEntityBuilder_common_Person.init()();
  dispatch thunk of Uso_VerbTemplateBuilder_NoVerb.setEntity(value:)();
  static Siri_Nlu_External_SystemPrompted.from(_:)(v7, (uint64_t)v6);
  Siri_Nlu_External_SystemDialogAct.init()();
  (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v4, v6, v0);
  Siri_Nlu_External_SystemDialogAct.prompted.setter();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v0);
  swift_release();
  return swift_release();
}

uint64_t static Siri_Nlu_External_SystemPrompted.from(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return static Siri_Nlu_External_SystemPrompted.from(_:)(a1, MEMORY[0x263F715D8], MEMORY[0x263F715D0], a2);
}

uint64_t Siri_Nlu_External_SystemDialogAct.init(systemPrompted:)(uint64_t a1)
{
  return Siri_Nlu_External_SystemDialogAct.init(systemPrompted:)(a1, MEMORY[0x263F715E0], MEMORY[0x263F71680], MEMORY[0x263F71678]);
}

uint64_t outlined init with copy of Siri_Nlu_External_UsoGraph?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t static UsoRequest.makeSDAForYesNoCancel()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v26 = a1;
  uint64_t v25 = type metadata accessor for Siri_Nlu_External_SystemOffered();
  uint64_t v1 = *(void *)(v25 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v25);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v2);
  uint64_t v7 = (char *)&v23 - v6;
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v23 - v8;
  uint64_t v10 = type metadata accessor for Siri_Nlu_External_UserCancelled();
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v11 = type metadata accessor for Siri_Nlu_External_UserAccepted();
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v12 = type metadata accessor for Siri_Nlu_External_UserDialogAct();
  uint64_t v24 = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  id v18 = (char *)&v23 - v17;
  Siri_Nlu_External_UserDialogAct.init()();
  Siri_Nlu_External_UserAccepted.init()();
  Siri_Nlu_External_UserDialogAct.accepted.setter();
  Siri_Nlu_External_UserCancelled.init()();
  Siri_Nlu_External_UserDialogAct.cancelled.setter();
  Siri_Nlu_External_SystemOffered.init()();
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v16, v18, v12);
  Siri_Nlu_External_SystemOffered.offeredAct.setter();
  uint64_t v19 = *(void (**)(char *, char *, uint64_t))(v1 + 16);
  uint64_t v20 = v25;
  v19(v7, v9, v25);
  Siri_Nlu_External_SystemDialogAct.init()();
  v19(v4, v7, v20);
  Siri_Nlu_External_SystemDialogAct.offered.setter();
  id v21 = *(void (**)(char *, uint64_t))(v1 + 8);
  v21(v7, v20);
  v21(v9, v20);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v18, v24);
}

uint64_t Siri_Nlu_External_SystemDialogAct.init(systemOffered:)(uint64_t a1)
{
  return Siri_Nlu_External_SystemDialogAct.init(systemPrompted:)(a1, MEMORY[0x263F71530], MEMORY[0x263F71680], MEMORY[0x263F71670]);
}

uint64_t Siri_Nlu_External_SystemGaveOptions.init(choices:)(uint64_t a1)
{
  return MEMORY[0x2455DAB30](a1);
}

uint64_t Siri_Nlu_External_SystemDialogAct.init(gaveOptions:)(uint64_t a1)
{
  return Siri_Nlu_External_SystemDialogAct.init(systemPrompted:)(a1, MEMORY[0x263F71708], MEMORY[0x263F71680], MEMORY[0x263F71660]);
}

uint64_t Siri_Nlu_External_UserDialogAct.init(_:)(uint64_t a1)
{
  return Siri_Nlu_External_SystemDialogAct.init(systemPrompted:)(a1, MEMORY[0x263F71600], MEMORY[0x263F71568], MEMORY[0x263F71550]);
}

{
  return Siri_Nlu_External_SystemDialogAct.init(systemPrompted:)(a1, MEMORY[0x263F71748], MEMORY[0x263F71568], MEMORY[0x263F71558]);
}

uint64_t Siri_Nlu_External_SystemDialogAct.init(systemPrompted:)(uint64_t a1, uint64_t (*a2)(void), void (*a3)(uint64_t), void (*a4)(char *))
{
  uint64_t v7 = a2(0);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388]();
  uint64_t v11 = (char *)&v13 - v10;
  a3(v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, a1, v7);
  a4(v11);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(a1, v7);
}

uint64_t static Siri_Nlu_External_UserDialogAct.from(_:)(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Siri_Nlu_External_UserStatedTask();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v10 - v7;
  static Siri_Nlu_External_UserStatedTask.from(_:)(a1, (uint64_t)&v10 - v7);
  Siri_Nlu_External_UserDialogAct.init()();
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v8, v2);
  Siri_Nlu_External_UserDialogAct.userStatedTask.setter();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
}

uint64_t static Siri_Nlu_External_UserStatedTask.from(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v28 = a2;
  uint64_t v3 = type metadata accessor for Siri_Nlu_External_UsoGraph();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v26 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v27 = (char *)&v25 - v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v25 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v25 - v15;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UsoBuilderOptions?);
  MEMORY[0x270FA5388](v17 - 8);
  uint64_t v19 = (char *)&v25 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  uint64_t v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_23FEBCBC0;
  *(void *)(v20 + 32) = a1;
  uint64_t v29 = v20;
  specialized Array._endMutation()();
  uint64_t v21 = v29;
  uint64_t v22 = type metadata accessor for UsoBuilderOptions();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v19, 1, 1, v22);
  swift_retain();
  MEMORY[0x2455DABD0](v21, v19);
  swift_bridgeObjectRelease();
  outlined destroy of ContactHandle.HandleType?((uint64_t)v19, &demangling cache variable for type metadata for UsoBuilderOptions?);
  static UsoGraphProtoWriter.toSwiftProtobuf(graph:vocabManager:)();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v4 + 56))(v16, 0, 1, v3);
  outlined init with copy of Siri_Nlu_External_UsoGraph?((uint64_t)v16, (uint64_t)v14);
  Siri_Nlu_External_UserStatedTask.init()();
  outlined init with copy of Siri_Nlu_External_UsoGraph?((uint64_t)v14, (uint64_t)v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v11, 1, v3) == 1)
  {
    outlined destroy of ContactHandle.HandleType?((uint64_t)v14, &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
    outlined destroy of ContactHandle.HandleType?((uint64_t)v11, &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
  }
  else
  {
    uint64_t v23 = v27;
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v27, v11, v3);
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v26, v23, v3);
    Siri_Nlu_External_UserStatedTask.task.setter();
    outlined destroy of ContactHandle.HandleType?((uint64_t)v14, &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v23, v3);
  }
  swift_release();
  return outlined destroy of ContactHandle.HandleType?((uint64_t)v16, &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
}

uint64_t static Siri_Nlu_External_UserDialogAct.from(_:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v33 = a1;
  uint64_t v1 = type metadata accessor for Siri_Nlu_External_UsoGraph();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  long long v30 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v31 = (char *)&v29 - v5;
  uint64_t v6 = type metadata accessor for Siri_Nlu_External_UserStatedTask();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  id v32 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v29 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v29 - v13;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
  uint64_t v16 = MEMORY[0x270FA5388](v15 - 8);
  uint64_t v18 = (char *)&v29 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  uint64_t v21 = (char *)&v29 - v20;
  MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v29 - v22;
  static UsoGraphProtoWriter.toSwiftProtobuf(graph:vocabManager:)();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v2 + 56))(v23, 0, 1, v1);
  outlined init with copy of Siri_Nlu_External_UsoGraph?((uint64_t)v23, (uint64_t)v21);
  Siri_Nlu_External_UserStatedTask.init()();
  outlined init with copy of Siri_Nlu_External_UsoGraph?((uint64_t)v21, (uint64_t)v18);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v18, 1, v1) == 1)
  {
    outlined destroy of ContactHandle.HandleType?((uint64_t)v21, &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
    outlined destroy of ContactHandle.HandleType?((uint64_t)v18, &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
  }
  else
  {
    uint64_t v24 = v31;
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v31, v18, v1);
    (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v30, v24, v1);
    Siri_Nlu_External_UserStatedTask.task.setter();
    outlined destroy of ContactHandle.HandleType?((uint64_t)v21, &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
    (*(void (**)(char *, uint64_t))(v2 + 8))(v24, v1);
  }
  uint64_t v25 = v32;
  uint64_t v26 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  v26(v12, v14, v6);
  Siri_Nlu_External_UserDialogAct.init()();
  v26(v25, v12, v6);
  Siri_Nlu_External_UserDialogAct.userStatedTask.setter();
  uint64_t v27 = *(void (**)(char *, uint64_t))(v7 + 8);
  v27(v12, v6);
  v27(v14, v6);
  return outlined destroy of ContactHandle.HandleType?((uint64_t)v23, &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
}

uint64_t Siri_Nlu_External_UserStatedTask.init(_:)(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Siri_Nlu_External_UsoGraph();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v13 - v10;
  Siri_Nlu_External_UserStatedTask.init()();
  outlined init with copy of Siri_Nlu_External_UsoGraph?(a1, (uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    outlined destroy of ContactHandle.HandleType?(a1, &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
    return outlined destroy of ContactHandle.HandleType?((uint64_t)v4, &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v11, v4, v5);
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v11, v5);
    Siri_Nlu_External_UserStatedTask.task.setter();
    outlined destroy of ContactHandle.HandleType?(a1, &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  }
}

unint64_t Siri_Nlu_External_UserDialogAct.usoTask.getter()
{
  unint64_t result = static ConversionUtils.convertUserDialogActToTasks(userDialogAct:)();
  unint64_t v1 = result;
  if (result >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter();
    unint64_t result = swift_bridgeObjectRelease();
    if (!v2) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v2 = *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v2)
    {
LABEL_6:
      swift_bridgeObjectRelease();
      return v2;
    }
  }
  if ((v1 & 0xC000000000000001) != 0)
  {
    uint64_t v2 = MEMORY[0x2455DB020](0, v1);
    goto LABEL_6;
  }
  if (*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    uint64_t v2 = *(void *)(v1 + 32);
    swift_retain();
    goto LABEL_6;
  }
  __break(1u);
  return result;
}

uint64_t Siri_Nlu_External_UserDialogAct.contactId.getter()
{
  uint64_t v41 = type metadata accessor for Google_Protobuf_StringValue();
  uint64_t v43 = *(void *)(v41 - 8);
  MEMORY[0x270FA5388](v41);
  uint64_t v40 = (char *)&v36 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v1 = type metadata accessor for Siri_Nlu_External_UsoEntityIdentifier();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  id v42 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v36 - v5;
  uint64_t v7 = type metadata accessor for Siri_Nlu_External_UsoGraph();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for Siri_Nlu_External_UserStatedTask();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UsoEntityIdentifier?);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v38 = (char *)&v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  Siri_Nlu_External_UserDialogAct.userStatedTask.getter();
  Siri_Nlu_External_UserStatedTask.task.getter();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  uint64_t v17 = Siri_Nlu_External_UsoGraph.identifiers.getter();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v18 = *(void *)(v17 + 16);
  if (!v18)
  {
    uint64_t v32 = 1;
LABEL_15:
    uint64_t v33 = (uint64_t)v38;
    goto LABEL_18;
  }
  uint64_t v36 = v17;
  uint64_t v37 = v2;
  uint64_t v19 = v2 + 16;
  uint64_t v20 = *(void (**)(char *, unint64_t, uint64_t))(v2 + 16);
  unint64_t v21 = v17 + ((*(unsigned __int8 *)(v19 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 64));
  uint64_t v22 = (void (**)(char *, uint64_t))(v19 - 8);
  id v39 = (void (**)(char *, uint64_t))(v43 + 8);
  uint64_t v43 = *(void *)(v19 + 56);
  swift_bridgeObjectRetain();
  uint64_t v23 = v42;
  while (1)
  {
    v20(v6, v21, v1);
    if (Siri_Nlu_External_UsoEntityIdentifier.backingAppBundleID.getter() == 0x73746361746E6F43
      && v25 == 0xE800000000000000)
    {
      swift_bridgeObjectRelease();
      v20(v23, (unint64_t)v6, v1);
    }
    else
    {
      char v26 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      v20(v23, (unint64_t)v6, v1);
      if ((v26 & 1) == 0)
      {
        uint64_t v24 = *v22;
        (*v22)(v23, v1);
        goto LABEL_4;
      }
    }
    uint64_t v27 = v40;
    Siri_Nlu_External_UsoEntityIdentifier.namespace.getter();
    uint64_t v28 = Google_Protobuf_StringValue.value.getter();
    uint64_t v30 = v29;
    (*v39)(v27, v41);
    if (v28 == 0x64695F6D657469 && v30 == 0xE700000000000000) {
      break;
    }
    char v31 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    uint64_t v24 = *v22;
    uint64_t v23 = v42;
    (*v22)(v42, v1);
    if (v31) {
      goto LABEL_17;
    }
LABEL_4:
    v24(v6, v1);
    v21 += v43;
    if (!--v18)
    {
      swift_bridgeObjectRelease();
      uint64_t v32 = 1;
      uint64_t v2 = v37;
      goto LABEL_15;
    }
  }
  swift_bridgeObjectRelease();
  (*v22)(v42, v1);
LABEL_17:
  swift_bridgeObjectRelease();
  uint64_t v2 = v37;
  uint64_t v33 = (uint64_t)v38;
  (*(void (**)(char *, char *, uint64_t))(v37 + 32))(v38, v6, v1);
  uint64_t v32 = 0;
LABEL_18:
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v2 + 56))(v33, v32, 1, v1);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v33, 1, v1) == 1)
  {
    outlined destroy of ContactHandle.HandleType?(v33, &demangling cache variable for type metadata for Siri_Nlu_External_UsoEntityIdentifier?);
    return 0;
  }
  else
  {
    uint64_t v34 = Siri_Nlu_External_UsoEntityIdentifier.value.getter();
    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v33, v1);
  }
  return v34;
}

uint64_t UsoIdentifierAppBundle.rawValue.getter(char a1)
{
  if (a1) {
    return 0xD000000000000015;
  }
  else {
    return 0x73746361746E6F43;
  }
}

uint64_t UsoIdentifierNamespace.rawValue.getter(char a1)
{
  if (!a1) {
    return 0x64695F6D657469;
  }
  if (a1 == 1) {
    return 0xD000000000000012;
  }
  return 0x6369746E616D6573;
}

uint64_t static Siri_Nlu_External_UserWantedToProceed.from(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return static Siri_Nlu_External_SystemPrompted.from(_:)(a1, MEMORY[0x263F71740], MEMORY[0x263F71738], a2);
}

uint64_t static Siri_Nlu_External_SystemPrompted.from(_:)@<X0>(uint64_t a1@<X0>, void (*a2)(uint64_t)@<X1>, void (*a3)(char *)@<X2>, uint64_t a4@<X8>)
{
  uint64_t v30 = a3;
  char v31 = a2;
  uint64_t v32 = a4;
  uint64_t v5 = type metadata accessor for Siri_Nlu_External_UsoGraph();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v29 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v29 - v9;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UsoBuilderOptions?);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
  uint64_t v15 = MEMORY[0x270FA5388](v14 - 8);
  uint64_t v17 = (char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  uint64_t v20 = (char *)&v29 - v19;
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v29 - v21;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_23FEBCBC0;
  *(void *)(v23 + 32) = a1;
  uint64_t v33 = v23;
  specialized Array._endMutation()();
  uint64_t v24 = v33;
  uint64_t v25 = type metadata accessor for UsoBuilderOptions();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v13, 1, 1, v25);
  swift_retain();
  MEMORY[0x2455DABD0](v24, v13);
  swift_bridgeObjectRelease();
  outlined destroy of ContactHandle.HandleType?((uint64_t)v13, &demangling cache variable for type metadata for UsoBuilderOptions?);
  static UsoGraphProtoWriter.toSwiftProtobuf(graph:vocabManager:)();
  swift_release();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v22, 0, 1, v5);
  uint64_t v26 = outlined init with copy of Siri_Nlu_External_UsoGraph?((uint64_t)v22, (uint64_t)v20);
  v31(v26);
  outlined init with copy of Siri_Nlu_External_UsoGraph?((uint64_t)v20, (uint64_t)v17);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v17, 1, v5) == 1)
  {
    outlined destroy of ContactHandle.HandleType?((uint64_t)v20, &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
    outlined destroy of ContactHandle.HandleType?((uint64_t)v17, &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v10, v17, v5);
    uint64_t v27 = v29;
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v29, v10, v5);
    v30(v27);
    outlined destroy of ContactHandle.HandleType?((uint64_t)v20, &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v10, v5);
  }
  return outlined destroy of ContactHandle.HandleType?((uint64_t)v22, &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
}

uint64_t static Siri_Nlu_External_SystemOffered.from(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v18[0] = a1;
  v18[1] = a2;
  uint64_t v2 = type metadata accessor for Siri_Nlu_External_UserWantedToProceed();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)v18 - v7;
  uint64_t v9 = type metadata accessor for Siri_Nlu_External_UserDialogAct();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)v18 - v14;
  uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
  v16(v8, (char *)v18[0], v2);
  Siri_Nlu_External_UserDialogAct.init()();
  v16(v6, v8, v2);
  Siri_Nlu_External_UserDialogAct.wantedToProceed.setter();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  Siri_Nlu_External_SystemOffered.init()();
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v9);
  Siri_Nlu_External_SystemOffered.offeredAct.setter();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v15, v9);
}

SiriGeo::UsoIdentifierAppBundle_optional __swiftcall UsoIdentifierAppBundle.init(rawValue:)(Swift::String rawValue)
{
  object = rawValue._object;
  v2._countAndFlagsBits = rawValue._countAndFlagsBits;
  v2._object = object;
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of UsoIdentifierAppBundle.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 == 1) {
    v4.value = SiriGeo_UsoIdentifierAppBundle_siriNL;
  }
  else {
    v4.value = SiriGeo_UsoIdentifierAppBundle_unknownDefault;
  }
  if (v3) {
    return v4;
  }
  else {
    return 0;
  }
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance UsoIdentifierAppBundle(char *a1, char *a2)
{
  char v2 = *a2;
  uint64_t v3 = UsoIdentifierAppBundle.rawValue.getter(*a1);
  uint64_t v5 = v4;
  if (v3 == UsoIdentifierAppBundle.rawValue.getter(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance UsoIdentifierAppBundle()
{
  char v1 = *v0;
  Hasher.init(_seed:)();
  UsoIdentifierAppBundle.rawValue.getter(v1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance UsoIdentifierAppBundle()
{
  return specialized RawRepresentable<>.hash(into:)();
}

uint64_t specialized RawRepresentable<>.hash(into:)()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance UsoIdentifierAppBundle()
{
  char v1 = *v0;
  Hasher.init(_seed:)();
  UsoIdentifierAppBundle.rawValue.getter(v1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance UsoIdentifierAppBundle@<X0>(Swift::String *a1@<X0>, char *a2@<X8>)
{
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of UsoIdentifierAppBundle.init(rawValue:), *a1);
  uint64_t result = swift_bridgeObjectRelease();
  if (v3 == 1) {
    char v5 = 1;
  }
  else {
    char v5 = 2;
  }
  if (!v3) {
    char v5 = 0;
  }
  *a2 = v5;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance UsoIdentifierAppBundle@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = UsoIdentifierAppBundle.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance UsoIdentifierNamespace(char *a1, char *a2)
{
  char v2 = *a2;
  uint64_t v3 = UsoIdentifierNamespace.rawValue.getter(*a1);
  uint64_t v5 = v4;
  if (v3 == UsoIdentifierNamespace.rawValue.getter(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance UsoIdentifierNamespace()
{
  char v1 = *v0;
  Hasher.init(_seed:)();
  UsoIdentifierNamespace.rawValue.getter(v1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance UsoIdentifierNamespace()
{
  UsoIdentifierNamespace.rawValue.getter(*v0);
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance UsoIdentifierNamespace()
{
  char v1 = *v0;
  Hasher.init(_seed:)();
  UsoIdentifierNamespace.rawValue.getter(v1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance UsoIdentifierNamespace@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = specialized UsoIdentifierNamespace.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance UsoIdentifierNamespace@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = UsoIdentifierNamespace.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t specialized UsoIdentifierNamespace.init(rawValue:)(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of UsoIdentifierNamespace.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 >= 3) {
    return 3;
  }
  else {
    return v3;
  }
}

unint64_t lazy protocol witness table accessor for type UsoIdentifierAppBundle and conformance UsoIdentifierAppBundle()
{
  unint64_t result = lazy protocol witness table cache variable for type UsoIdentifierAppBundle and conformance UsoIdentifierAppBundle;
  if (!lazy protocol witness table cache variable for type UsoIdentifierAppBundle and conformance UsoIdentifierAppBundle)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UsoIdentifierAppBundle and conformance UsoIdentifierAppBundle);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type UsoIdentifierNamespace and conformance UsoIdentifierNamespace()
{
  unint64_t result = lazy protocol witness table cache variable for type UsoIdentifierNamespace and conformance UsoIdentifierNamespace;
  if (!lazy protocol witness table cache variable for type UsoIdentifierNamespace and conformance UsoIdentifierNamespace)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UsoIdentifierNamespace and conformance UsoIdentifierNamespace);
  }
  return result;
}

ValueMetadata *type metadata accessor for UsoRequest()
{
  return &type metadata for UsoRequest;
}

unsigned char *storeEnumTagSinglePayload for UsoIdentifierAppBundle(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x23FEABF08);
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

ValueMetadata *type metadata accessor for UsoIdentifierAppBundle()
{
  return &type metadata for UsoIdentifierAppBundle;
}

uint64_t getEnumTagSinglePayload for UsoIdentifierNamespace(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for UsoIdentifierNamespace(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x23FEAC09CLL);
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

unsigned char *destructiveInjectEnumTag for UsoIdentifierNamespace(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for UsoIdentifierNamespace()
{
  return &type metadata for UsoIdentifierNamespace;
}

id INShareETAIntentHandler.logObject.getter()
{
  return *(id *)(v0 + OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_logObject);
}

void INShareETAIntentHandler.resolveRecipients(for:with:)(void *a1, void (*a2)(uint64_t), uint64_t a3)
{
  BOOL v7 = *(NSObject **)&v3[OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_logObject];
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_23FE9C000, v7, v8, "resolveRecipient called", v9, 2u);
    MEMORY[0x2455DB720](v9, -1, -1);
  }
  id v10 = objc_msgSend(self, sel_sharedInstance);
  if (v10)
  {
    uint64_t v11 = v10;
    os_log_type_t v12 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v7, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_23FE9C000, v7, v12, "share ETA confirm ready", v13, 2u);
      MEMORY[0x2455DB720](v13, -1, -1);
    }
    uint64_t v14 = (void *)swift_allocObject();
    v14[2] = v3;
    v14[3] = v11;
    v14[4] = a1;
    v14[5] = a2;
    v14[6] = a3;
    v20[4] = partial apply for closure #1 in INShareETAIntentHandler.resolveRecipients(for:with:);
    v20[5] = v14;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 1107296256;
    id v20[2] = thunk for @escaping @callee_guaranteed (@guaranteed MSPSharedTripService) -> ();
    v20[3] = &block_descriptor_1;
    uint64_t v15 = _Block_copy(v20);
    uint64_t v16 = v3;
    id v17 = v11;
    id v18 = a1;
    swift_retain();
    swift_release();
    objc_msgSend(v17, sel_performBlockAfterInitialSync_, v15);
    _Block_release(v15);
  }
  else
  {
    static os_log_type_t.error.getter();
    os_log(_:dso:log:_:_:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
    uint64_t v19 = swift_allocObject();
    *(_OWORD *)(v19 + 16) = xmmword_23FEBCBC0;
    *(void *)(v19 + 32) = objc_msgSend(self, sel_unsupportedForReason_, 5);
    specialized Array._endMutation()();
    a2(v19);
    swift_bridgeObjectRelease();
  }
}

void closure #1 in INShareETAIntentHandler.resolveRecipients(for:with:)(uint64_t a1, uint64_t a2, void *a3, void *a4, void (*a5)(uint64_t), uint64_t a6)
{
  static os_log_type_t.info.getter();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_23FEBCB50;
  *(void *)(v10 + 56) = type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for MSPSharedTripService);
  *(void *)(v10 + 64) = lazy protocol witness table accessor for type MSPSharedTripService and conformance NSObject();
  *(void *)(v10 + 32) = a3;
  id v11 = a3;
  os_log(_:dso:log:_:_:)();
  swift_bridgeObjectRelease();
  INShareETAIntentHandler.resolveRecipientsInsideBlock(for:with:)(a4, a5, a6);
}

uint64_t partial apply for closure #1 in INShareETAIntentHandler.resolveRecipients(for:with:)(uint64_t a1)
{
  return partial apply for closure #1 in INShareETAIntentHandler.resolveRecipients(for:with:)(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))closure #1 in INShareETAIntentHandler.resolveRecipients(for:with:));
}

void thunk for @escaping @callee_guaranteed (@guaranteed MSPSharedTripService) -> ()(uint64_t a1, void *a2)
{
  int v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
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

void thunk for @escaping @callee_unowned @convention(block) (@unowned NSArray) -> ()(uint64_t a1, uint64_t a2)
{
  type metadata accessor for OS_os_log(0, (unint64_t *)&lazy cache variable for type metadata for INShareETARecipientResolutionResult);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  (*(void (**)(uint64_t, objc_class *))(a2 + 16))(a2, isa);
}

{
  objc_class *isa;
  uint64_t vars8;

  type metadata accessor for OS_os_log(0, (unint64_t *)&lazy cache variable for type metadata for INStopShareETARecipientResolutionResult);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  (*(void (**)(uint64_t, objc_class *))(a2 + 16))(a2, isa);
}

void INShareETAIntentHandler.resolveRecipientsInsideBlock(for:with:)(void *a1, void (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5 = *(NSObject **)(j + OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_logObject);
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    BOOL v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)BOOL v7 = 0;
    _os_log_impl(&dword_23FE9C000, v5, v6, "resolveRecipients", v7, 2u);
    MEMORY[0x2455DB720](v7, -1, -1);
  }
  id v8 = objc_msgSend(a1, sel_recipients);
  if (!v8)
  {
LABEL_98:
    id v92 = a1;
    os_log_type_t v93 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v5, v93))
    {
      uint64_t v94 = (uint8_t *)swift_slowAlloc();
      uint64_t v95 = swift_slowAlloc();
      uint64_t v114 = v95;
      *(_DWORD *)uint64_t v94 = 136315138;
      id v96 = v92;
      id v97 = objc_msgSend(v96, sel_description);
      uint64_t v98 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v100 = v99;

      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v98, v100, &v114);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23FE9C000, v5, v93, "resolveRecipients nil/empty recipients intent - %s", v94, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2455DB720](v95, -1, -1);
      MEMORY[0x2455DB720](v94, -1, -1);
    }
    else
    {
    }
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
    uint64_t v65 = swift_allocObject();
    *(_OWORD *)(v65 + 16) = xmmword_23FEBCBC0;
    type metadata accessor for OS_os_log(0, (unint64_t *)&lazy cache variable for type metadata for INShareETARecipientResolutionResult);
    *(void *)(v65 + 32) = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_needsValue);
LABEL_102:
    uint64_t v114 = v65;
    specialized Array._endMutation()();
    a2(v114);
    swift_bridgeObjectRelease();
    return;
  }
  id v9 = v8;
  uint64_t v109 = type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for INPerson);
  unint64_t v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  if (v10 >> 62)
  {
LABEL_95:
    swift_bridgeObjectRetain();
    uint64_t v12 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v12)
    {
      swift_bridgeObjectRetain();
      uint64_t v13 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    goto LABEL_97;
  }
  uint64_t v12 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v13 = v12;
  if (!v12)
  {
LABEL_97:
    swift_bridgeObjectRelease();

    goto LABEL_98;
  }
LABEL_6:
  oslog = v5;
  uint64_t v108 = j;
  if (v13 == 1)
  {
    uint64_t v5 = (v11 & 0xC000000000000001);
    if ((v11 & 0xC000000000000001) != 0) {
      goto LABEL_104;
    }
    if (*(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      for (id i = *(id *)(v11 + 32); ; id i = (id)MEMORY[0x2455DB020](0, v11))
      {
        uint64_t v15 = i;
        id v16 = objc_msgSend(i, sel_personHandle);

        if (v16)
        {
          if (v5) {
            id v17 = (id)MEMORY[0x2455DB020](0, v11);
          }
          else {
            id v17 = *(id *)(v11 + 32);
          }
          uint64_t v22 = v17;
          id v23 = objc_msgSend(v17, sel_personHandle);

          if (!v23) {
            goto LABEL_125;
          }
          id v24 = objc_msgSend(v23, sel_value);

          if (v24) {
            break;
          }
        }
        uint64_t j = v108;
LABEL_25:

        if (v5) {
          goto LABEL_93;
        }
LABEL_26:
        if (*(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          id v27 = *(id *)(v11 + 32);
          goto LABEL_28;
        }
        __break(1u);
LABEL_104:
        ;
      }

      static os_log_type_t.default.getter();
      os_log(_:dso:log:_:_:)();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
      uint64_t v25 = swift_allocObject();
      *(_OWORD *)(v25 + 16) = xmmword_23FEBCB50;
      if (v5) {
        id v26 = (id)MEMORY[0x2455DB020](0, v11);
      }
      else {
        id v26 = *(id *)(v11 + 32);
      }
      uint64_t v67 = v26;
      id v68 = objc_msgSend(v26, sel_personHandle);

      if (v68)
      {
        id v69 = objc_msgSend(v68, sel_value);

        uint64_t j = v108;
        if (v69)
        {
          id v70 = self;
          uint64_t v71 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v73 = v72;

          *(void *)(v25 + 32) = v71;
          *(void *)(v25 + 40) = v73;
          Class isa = Array._bridgeToObjectiveC()().super.isa;
          swift_bridgeObjectRelease();
          id v9 = objc_msgSend(v70, sel_contactsFromHandles_, isa);

          type metadata accessor for OS_os_log(0, (unint64_t *)&lazy cache variable for type metadata for MSPSharedTripContact);
          uint64_t v13 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

          if ((unint64_t)v13 >> 62) {
            goto LABEL_118;
          }
          if (*(uint64_t *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10) <= 0) {
            goto LABEL_119;
          }
          goto LABEL_80;
        }
        goto LABEL_127;
      }
LABEL_126:
      __break(1u);
LABEL_127:
      __break(1u);
      return;
    }
    __break(1u);
LABEL_106:
    if (v11 < 0) {
      uint64_t v13 = v11;
    }
    else {
      uint64_t v13 = v11 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    uint64_t v31 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v31) {
      goto LABEL_34;
    }
LABEL_110:
    uint64_t v34 = (void *)MEMORY[0x263F8EE78];
LABEL_111:
    swift_bridgeObjectRelease();
    uint64_t j = v108;
LABEL_112:
    uint64_t v101 = *(void *)(j + OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_contactService);
    unint64_t v102 = (void *)swift_allocObject();
    v102[2] = j;
    v102[3] = a2;
    v102[4] = a3;
    v103 = *(void (**)(void *, uint64_t (*)(void *), void *))(*(void *)v101 + 144);
    id v104 = (id)j;
    swift_retain();
    v103(v34, partial apply for closure #2 in INShareETAIntentHandler.resolveRecipientsInsideBlock(for:with:), v102);
    swift_bridgeObjectRelease();
    swift_release();
    return;
  }
  uint64_t v5 = (v11 & 0xC000000000000001);
  if (v13 < 2) {
    goto LABEL_25;
  }
  if (v5)
  {
    id v18 = (id)MEMORY[0x2455DB020](0, v11);
  }
  else
  {
    if (!*(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_117;
    }
    id v18 = *(id *)(v11 + 32);
  }
  uint64_t v19 = v18;
  id v20 = objc_msgSend(v18, sel_contactIdentifier);

  unint64_t v106 = v9;
  if (v20)
  {
    uint64_t v110 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a1 = v21;
  }
  else
  {
    uint64_t v110 = 0;
    a1 = 0;
  }
  swift_bridgeObjectRetain();
  char v50 = 1;
  for (uint64_t j = 4; ; ++j)
  {
    while (1)
    {
      if (v5) {
        id v51 = (id)MEMORY[0x2455DB020](j - 4, v11);
      }
      else {
        id v51 = *(id *)(v11 + 8 * j);
      }
      uint64_t v52 = v51;
      uint64_t v53 = j - 3;
      if (__OFADD__(j - 4, 1))
      {
        __break(1u);
        goto LABEL_95;
      }
      if ((v50 & 1) == 0)
      {

        goto LABEL_64;
      }
      id v54 = objc_msgSend(v51, sel_contactIdentifier);
      if (!v54) {
        break;
      }
      id v9 = v54;
      uint64_t v55 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      char v57 = v56;

      if (a1)
      {
        if (v55 != v110 || a1 != v57)
        {
          char v50 = _stringCompareWithSmolCheck(_:_:expecting:)();

          swift_bridgeObjectRelease();
          if (v53 != v12) {
            goto LABEL_51;
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v50)
          {

            goto LABEL_92;
          }
LABEL_71:
          swift_bridgeObjectRetain();
          os_log_type_t v58 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(oslog, v58))
          {
            uint64_t v59 = (uint8_t *)swift_slowAlloc();
            uint64_t v60 = swift_slowAlloc();
            uint64_t v114 = v60;
            *(_DWORD *)uint64_t v59 = 136315138;
            uint64_t v61 = swift_bridgeObjectRetain();
            uint64_t v62 = MEMORY[0x2455DAEA0](v61, v109);
            unint64_t v64 = v63;
            swift_bridgeObjectRelease();
            getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v62, v64, &v114);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_23FE9C000, oslog, v58, "resolveRecipients more than 1 disambiguation required %s", v59, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x2455DB720](v60, -1, -1);
            MEMORY[0x2455DB720](v59, -1, -1);
          }
          else
          {
            swift_bridgeObjectRelease_n();
          }
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
          uint64_t v65 = swift_allocObject();
          *(_OWORD *)(v65 + 16) = xmmword_23FEBCBC0;
          type metadata accessor for OS_os_log(0, (unint64_t *)&lazy cache variable for type metadata for INShareETARecipientResolutionResult);
          id v66 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_disambiguationWithPeopleToDisambiguate_, v106);

          *(void *)(v65 + 32) = v66;
          goto LABEL_102;
        }

        swift_bridgeObjectRelease();
        if (v53 == v12)
        {

          swift_bridgeObjectRelease();
          goto LABEL_91;
        }
        char v50 = 1;
        ++j;
      }
      else
      {

        swift_bridgeObjectRelease();
LABEL_64:
        if (v53 == v12)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          goto LABEL_71;
        }
        char v50 = 0;
LABEL_51:
        ++j;
      }
    }

    if (a1) {
      goto LABEL_64;
    }
    if (v53 == v12) {
      break;
    }
    char v50 = 1;
  }

LABEL_91:
  swift_bridgeObjectRelease();
LABEL_92:
  uint64_t j = v108;
  if (!v5) {
    goto LABEL_26;
  }
LABEL_93:
  id v27 = (id)MEMORY[0x2455DB020](0, v11);
LABEL_28:
  uint64_t v28 = v27;

  if (v5) {
    id v29 = (id)MEMORY[0x2455DB020](0, v11);
  }
  else {
    id v29 = *(id *)(v11 + 32);
  }
  uint64_t v13 = (uint64_t)v29;
  swift_bridgeObjectRelease();
  id v30 = objc_msgSend((id)v13, sel_siriMatches);

  if (!v30)
  {
    uint64_t v34 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_112;
  }
  uint64_t v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if ((unint64_t)v11 >> 62) {
    goto LABEL_106;
  }
  uint64_t v31 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v31) {
    goto LABEL_110;
  }
LABEL_34:
  if (v31 >= 1)
  {
    uint64_t v32 = 0;
    unint64_t v33 = v11 & 0xC000000000000001;
    uint64_t v34 = (void *)MEMORY[0x263F8EE78];
    unint64_t v35 = 0x265096000uLL;
    uint64_t v111 = v31;
    do
    {
      if (v33) {
        id v37 = (id)MEMORY[0x2455DB020](v32, v11);
      }
      else {
        id v37 = *(id *)(v11 + 8 * v32 + 32);
      }
      uint64_t v38 = v37;
      id v39 = [v37 *(SEL *)(v35 + 2944)];
      if (v39)
      {
        uint64_t v40 = v39;
        id v41 = objc_msgSend(v39, sel_value);

        if (v41)
        {
          unint64_t v42 = v33;
          uint64_t v43 = v11;
          unint64_t v44 = v35;
          uint64_t v45 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v47 = v46;

          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v34 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v34[2] + 1, 1, v34);
          }
          unint64_t v49 = v34[2];
          unint64_t v48 = v34[3];
          if (v49 >= v48 >> 1) {
            uint64_t v34 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v48 > 1), v49 + 1, 1, v34);
          }
          v34[2] = v49 + 1;
          uint64_t v36 = &v34[2 * v49];
          v36[4] = v45;
          v36[5] = v47;
          unint64_t v35 = v44;
          uint64_t v11 = v43;
          unint64_t v33 = v42;
          uint64_t v31 = v111;
        }
      }
      ++v32;
    }
    while (v31 != v32);
    goto LABEL_111;
  }
LABEL_117:
  __break(1u);
LABEL_118:
  swift_bridgeObjectRetain();
  uint64_t v105 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (v105 <= 0)
  {
LABEL_119:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
    uint64_t v88 = swift_allocObject();
    *(_OWORD *)(v88 + 16) = xmmword_23FEBCBC0;
    *(void *)(v88 + 32) = objc_msgSend(self, sel_unsupportedForReason_, 5);
    goto LABEL_120;
  }
LABEL_80:
  if ((v13 & 0xC000000000000001) != 0)
  {
    id v75 = (id)MEMORY[0x2455DB020](0, v13);
    goto LABEL_83;
  }
  if (!*(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
LABEL_125:

    __break(1u);
    goto LABEL_126;
  }
  id v75 = *(id *)(v13 + 32);
LABEL_83:
  id v76 = v75;
  swift_bridgeObjectRelease();
  id v77 = objc_msgSend(v76, sel_displayName);
  uint64_t v78 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v80 = v79;

  char v81 = (uint64_t *)(j + OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_sharedTripContact);
  uint64_t v82 = *(void *)(j + OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_sharedTripContact);
  uint64_t v83 = *(void *)(j + OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_sharedTripContact + 8);
  uint64_t v84 = *(void **)(j + OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_sharedTripContact + 16);
  uint64_t v85 = *(void *)(j + OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_sharedTripContact + 24);
  uint64_t v86 = *(void *)(j + OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_sharedTripContact + 32);
  uint64_t v87 = *(void **)(j + OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_sharedTripContact + 40);
  *char v81 = v78;
  v81[1] = v80;
  v81[2] = (uint64_t)v76;
  v81[3] = 0;
  v81[4] = 0;
  v81[5] = 0;
  outlined consume of EnhancedMSPSharedTripContact?(v82, v83, v84, v85, v86, v87);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  uint64_t v88 = swift_allocObject();
  *(_OWORD *)(v88 + 16) = xmmword_23FEBCBC0;
  if (v5) {
    id v89 = (id)MEMORY[0x2455DB020](0, v11);
  }
  else {
    id v89 = *(id *)(v11 + 32);
  }
  uint64_t v90 = v89;
  swift_bridgeObjectRelease();
  id v91 = objc_msgSend(self, sel_resolutionResultSuccessWithResolvedValue_, v90);

  *(void *)(v88 + 32) = v91;
LABEL_120:
  uint64_t v114 = v88;
  specialized Array._endMutation()();
  a2(v88);

  swift_bridgeObjectRelease();
}

uint64_t closure #2 in INShareETAIntentHandler.resolveRecipientsInsideBlock(for:with:)(void *a1, char *a2, void (*a3)(uint64_t), uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for PersonNameComponents?);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = (char *)&v111 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  Swift::Int v116 = (char *)&v111 - v12;
  static os_log_type_t.info.getter();
  uint64_t v13 = *(NSObject **)&a2[OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_logObject];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_23FEBCB50;
  uint64_t v15 = MEMORY[0x2455DAED0](a1, &type metadata for EnhancedMSPSharedTripContact);
  uint64_t v17 = v16;
  *(void *)(v14 + 56) = MEMORY[0x263F8D310];
  *(void *)(v14 + 64) = lazy protocol witness table accessor for type String and conformance String();
  *(void *)(v14 + 32) = v15;
  *(void *)(v14 + 40) = v17;
  id v18 = v13;
  os_log(_:dso:log:_:_:)();
  swift_bridgeObjectRelease();
  if (!a1[2])
  {
    static os_log_type_t.error.getter();
    os_log(_:dso:log:_:_:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
    uint64_t v47 = swift_allocObject();
    *(_OWORD *)(v47 + 16) = xmmword_23FEBCBC0;
    *(void *)(v47 + 32) = objc_msgSend(self, sel_unsupportedForReason_, 5);
    v124[0] = v47;
    specialized Array._endMutation()();
    a3(v124[0]);
    return swift_bridgeObjectRelease();
  }
  uint64_t v114 = a4;
  uint64_t v115 = a3;
  uint64_t result = specialized INShareETAIntentHandler.phoneDisambiguationCandidates(_:)(a1);
  uint64_t v21 = (uint64_t)v20;
  uint64_t v22 = v20[2];
  if (result)
  {
    if (v22)
    {
      v113 = v13;
      v124[0] = MEMORY[0x263F8EE78];
      specialized ContiguousArray.reserveCapacity(_:)();
      uint64_t v112 = v21;
      uint64_t v23 = v21 + 40;
      unint64_t v24 = 0x265096000;
      uint64_t v25 = v116;
      while (1)
      {
        id v29 = *(char **)v23;
        uint64_t v120 = *(void *)(v23 - 8);
        id v30 = *(void **)(v23 + 8);
        id v117 = *(id *)(v23 + 32);
        swift_bridgeObjectRetain();
        id v31 = v30;
        id v118 = specialized EnhancedMSPSharedTripContact.getPersonHandle()(v31);
        uint64_t v32 = type metadata accessor for PersonNameComponents();
        uint64_t v33 = *(void *)(v32 - 8);
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v33 + 56))(v25, 1, 1, v32);
        id v34 = [v31 *(SEL *)(v24 + 3184)];
        v119 = v29;
        if (!v34) {
          goto LABEL_11;
        }
        unint64_t v35 = v34;
        id v36 = objc_msgSend(self, sel_stringFromContact_style_, v34, 0);
        if (!v36) {
          break;
        }
        id v37 = v36;
        uint64_t v120 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        id v29 = v38;

LABEL_12:
        id v39 = [v31 *(SEL *)(v24 + 3184)];
        if (v39)
        {
          uint64_t v40 = v39;
          id v41 = objc_msgSend(v39, sel_identifier);
          uint64_t v42 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v44 = v43;

          uint64_t v25 = v116;
        }
        else
        {
          uint64_t v42 = 0;
          uint64_t v44 = 0;
        }
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v25, 1, v32) == 1)
        {
          Class isa = 0;
        }
        else
        {
          Class isa = PersonNameComponents._bridgeToObjectiveC()().super.isa;
          (*(void (**)(char *, uint64_t))(v33 + 8))(v25, v32);
        }
        uint64_t v46 = (void *)MEMORY[0x2455DADE0](v120, v29);
        swift_bridgeObjectRelease();
        if (v44)
        {
          id v26 = (void *)MEMORY[0x2455DADE0](v42, v44);
          swift_bridgeObjectRelease();
        }
        else
        {
          id v26 = 0;
        }
        unint64_t v24 = 0x265096000uLL;
        v23 += 48;
        id v27 = objc_allocWithZone(MEMORY[0x263F0FD18]);
        uint64_t v28 = v118;
        objc_msgSend(v27, sel_initWithPersonHandle_nameComponents_displayName_image_contactIdentifier_customIdentifier_, v118, isa, v46, 0, v26, 0);

        swift_bridgeObjectRelease();
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
        specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized ContiguousArray._endMutation()();
        if (!--v22)
        {
          swift_bridgeObjectRelease();
          id v18 = v113;
          goto LABEL_30;
        }
      }

LABEL_11:
      swift_bridgeObjectRetain();
      goto LABEL_12;
    }
    swift_bridgeObjectRelease();
LABEL_30:
    swift_bridgeObjectRetain_n();
    os_log_type_t v75 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v18, v75))
    {
      id v76 = (uint8_t *)swift_slowAlloc();
      uint64_t v77 = swift_slowAlloc();
      v124[0] = v77;
      *(_DWORD *)id v76 = 136315138;
      uint64_t v78 = v18;
      uint64_t v79 = type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for INPerson);
      uint64_t v80 = swift_bridgeObjectRetain();
      uint64_t v81 = MEMORY[0x2455DAEA0](v80, v79);
      unint64_t v83 = v82;
      swift_bridgeObjectRelease();
      uint64_t v121 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v81, v83, v124);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23FE9C000, v78, v75, "disambiguation list %s", v76, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2455DB720](v77, -1, -1);
      MEMORY[0x2455DB720](v76, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }
    uint64_t v84 = v115;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
    uint64_t v85 = swift_allocObject();
    *(_OWORD *)(v85 + 16) = xmmword_23FEBCBC0;
    type metadata accessor for OS_os_log(0, (unint64_t *)&lazy cache variable for type metadata for INShareETARecipientResolutionResult);
    ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
    type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for INPerson);
    Class v87 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v88 = objc_msgSend(ObjCClassFromMetadata, sel_disambiguationWithPeopleToDisambiguate_, v87);

    *(void *)(v85 + 32) = v88;
    v124[0] = v85;
    specialized Array._endMutation()();
    v84(v124[0]);
    return swift_bridgeObjectRelease();
  }
  if (v22)
  {
    uint64_t v49 = v20[4];
    unint64_t v48 = (void *)v20[5];
    char v50 = (void *)v20[6];
    id v118 = (id)v20[7];
    v119 = v11;
    id v51 = (void *)v20[9];
    id v117 = (id)v20[8];
    Swift::Int v116 = v51;
    swift_bridgeObjectRetain();
    id v52 = v50;
    swift_bridgeObjectRelease();
    uint64_t v53 = (uint64_t *)&a2[OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_sharedTripContact];
    uint64_t v54 = *(void *)&a2[OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_sharedTripContact + 8];
    uint64_t v112 = *(void *)&a2[OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_sharedTripContact];
    v113 = v13;
    uint64_t v55 = *(void **)&a2[OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_sharedTripContact + 16];
    uint64_t v56 = *(void *)&a2[OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_sharedTripContact + 24];
    uint64_t v57 = *(void *)&a2[OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_sharedTripContact + 32];
    uint64_t v111 = *(void **)&a2[OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_sharedTripContact + 40];
    uint64_t v120 = v49;
    *uint64_t v53 = v49;
    v53[1] = (uint64_t)v48;
    uint64_t v58 = (uint64_t)v118;
    v53[2] = (uint64_t)v52;
    v53[3] = v58;
    v53[4] = (uint64_t)v117;
    v53[5] = (uint64_t)v51;
    id v118 = v48;
    swift_bridgeObjectRetain();
    id v117 = v52;
    Swift::Int v116 = v116;
    uint64_t v59 = v57;
    uint64_t v60 = v113;
    outlined consume of EnhancedMSPSharedTripContact?(v112, v54, v55, v56, v59, v111);
    uint64_t v61 = a2;
    os_log_type_t v62 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v60, v62))
    {
      unint64_t v63 = (uint8_t *)swift_slowAlloc();
      uint64_t v64 = swift_slowAlloc();
      uint64_t v123 = v64;
      *(_DWORD *)unint64_t v63 = 136315138;
      uint64_t v65 = v53[1];
      if (v65)
      {
        id v66 = (void *)v53[5];
        uint64_t v67 = v53[4];
        id v69 = (void *)v53[2];
        uint64_t v68 = v53[3];
        v124[0] = *v53;
        v124[1] = v65;
        v124[2] = (uint64_t)v69;
        v124[3] = v68;
        v124[4] = v67;
        v124[5] = (uint64_t)v66;
        id v70 = v66;
        swift_bridgeObjectRetain();
        id v71 = v69;
        uint64_t v72 = EnhancedMSPSharedTripContact.description.getter(v71);
        uint64_t v74 = v73;

        uint64_t v60 = v113;
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v72 = 0;
        uint64_t v74 = 0;
      }
      uint64_t v121 = v72;
      uint64_t v122 = v74;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for String?);
      uint64_t v89 = String.init<A>(describing:)();
      uint64_t v121 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v89, v90, &v123);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23FE9C000, v60, v62, "resolveRecipients successful %s", v63, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2455DB720](v64, -1, -1);
      MEMORY[0x2455DB720](v63, -1, -1);
    }
    else
    {
    }
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
    uint64_t v91 = swift_allocObject();
    *(_OWORD *)(v91 + 16) = xmmword_23FEBCBC0;
    id v92 = v117;
    id v93 = specialized EnhancedMSPSharedTripContact.getPersonHandle()(v117);
    uint64_t v94 = type metadata accessor for PersonNameComponents();
    uint64_t v95 = (uint64_t)v119;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v94 - 8) + 56))(v119, 1, 1, v94);
    id v96 = objc_msgSend(v92, sel_contact);
    uint64_t v97 = (uint64_t)v118;
    if (v96)
    {
      uint64_t v98 = v96;
      id v99 = objc_msgSend(self, sel_stringFromContact_style_, v96, 0);
      if (v99)
      {
        unint64_t v100 = v99;
        uint64_t v120 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v102 = v101;

LABEL_41:
        id v103 = objc_msgSend(v92, sel_contact);
        id v104 = v103;
        if (v103)
        {
          id v105 = objc_msgSend(v103, sel_identifier);

          id v104 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v107 = v106;
        }
        else
        {
          uint64_t v107 = 0;
        }
        id v108 = objc_allocWithZone(MEMORY[0x263F0FD18]);
        id v109 = @nonobjc INPerson.init(personHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:)(v93, v95, v120, v102, 0, (uint64_t)v104, v107, 0, 0);
        id v110 = objc_msgSend(self, sel_resolutionResultSuccessWithResolvedValue_, v109);

        *(void *)(v91 + 32) = v110;
        uint64_t v121 = v91;
        specialized Array._endMutation()();
        v115(v121);

        swift_bridgeObjectRelease();
        return swift_bridgeObjectRelease();
      }
    }
    swift_bridgeObjectRetain();
    uint64_t v102 = v97;
    goto LABEL_41;
  }
  __break(1u);
  return result;
}

void INShareETAIntentHandler.confirm(intent:completion:)(uint64_t a1, void (*a2)(void), uint64_t a3)
{
  id v6 = objc_msgSend(self, sel_sharedInstance);
  if (v6)
  {
    BOOL v7 = v6;
    uint64_t v8 = (void *)swift_allocObject();
    v8[2] = v3;
    v8[3] = v7;
    v8[4] = a2;
    v8[5] = a3;
    aBlock[4] = partial apply for closure #1 in INShareETAIntentHandler.confirm(intent:completion:);
    aBlock[5] = v8;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed MSPSharedTripService) -> ();
    aBlock[3] = &block_descriptor_6;
    uint64_t v9 = _Block_copy(aBlock);
    id v10 = v3;
    id v11 = v7;
    swift_retain();
    swift_release();
    objc_msgSend(v11, sel_performBlockAfterInitialSync_, v9);
    _Block_release(v9);
  }
  else
  {
    static os_log_type_t.error.getter();
    os_log(_:dso:log:_:_:)();
    id v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FF58]), sel_initWithCode_userActivity_, 4, 0);
    a2();
  }
}

void closure #1 in INShareETAIntentHandler.confirm(intent:completion:)(void *a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  static os_log_type_t.info.getter();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_23FEBCB50;
  *(void *)(v10 + 56) = type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for MSPSharedTripService);
  *(void *)(v10 + 64) = lazy protocol witness table accessor for type MSPSharedTripService and conformance NSObject();
  *(void *)(v10 + 32) = a3;
  id v11 = a3;
  os_log(_:dso:log:_:_:)();
  swift_bridgeObjectRelease();
  id v12 = (void *)swift_allocObject();
  v12[2] = a2;
  uint64_t v12[3] = a4;
  v12[4] = a5;
  v15[4] = partial apply for closure #1 in closure #1 in INShareETAIntentHandler.confirm(intent:completion:);
  v15[5] = v12;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 1107296256;
  v15[2] = thunk for @escaping @callee_guaranteed (@unowned Bool, @guaranteed String?, @guaranteed Error?) -> ();
  v15[3] = &block_descriptor_73;
  uint64_t v13 = _Block_copy(v15);
  id v14 = a2;
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel_fetchRequiresUserConfirmationOfSharingIdentityWithCompletion_, v13);
  _Block_release(v13);
}

void closure #1 in closure #1 in INShareETAIntentHandler.confirm(intent:completion:)(char a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, void (*a6)(void))
{
  uint64_t v9 = *(NSObject **)(a5 + OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_logObject);
  os_log_type_t v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    id v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_23FE9C000, v9, v10, "share ETA confirm ready", v11, 2u);
    MEMORY[0x2455DB720](v11, -1, -1);
  }
  if (a4)
  {
    id v12 = a4;
    static os_log_type_t.error.getter();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
    uint64_t v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_23FEBCB50;
    swift_getErrorValue();
    uint64_t v14 = Error.localizedDescription.getter();
    uint64_t v16 = v15;
    *(void *)(v13 + 56) = MEMORY[0x263F8D310];
    *(void *)(v13 + 64) = lazy protocol witness table accessor for type String and conformance String();
    *(void *)(v13 + 32) = v14;
    *(void *)(v13 + 40) = v16;
    os_log(_:dso:log:_:_:)();
    swift_bridgeObjectRelease();
    id v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FF58]), sel_initWithCode_userActivity_, 1, 0);
    a6();
  }
  else
  {
    os_log_type_t v18 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v9, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      *(_DWORD *)uint64_t v19 = 136315138;
      uint64_t v26 = v20;
      if (a1) {
        uint64_t v21 = 1702195828;
      }
      else {
        uint64_t v21 = 0x65736C6166;
      }
      if (a1) {
        unint64_t v22 = 0xE400000000000000;
      }
      else {
        unint64_t v22 = 0xE500000000000000;
      }
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v21, v22, &v26);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23FE9C000, v9, v18, "fetchRequiresUserConfirmationOfSharingIdentity requiresConfirmation value: %s", v19, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2455DB720](v20, -1, -1);
      MEMORY[0x2455DB720](v19, -1, -1);
    }
    id v23 = objc_allocWithZone(MEMORY[0x263F0FF58]);
    if (a1) {
      uint64_t v24 = 2;
    }
    else {
      uint64_t v24 = 1;
    }
    id v25 = objc_msgSend(v23, sel_initWithCode_userActivity_, v24, 0);
    a6();
  }
}

uint64_t thunk for @escaping @callee_guaranteed (@unowned Bool, @guaranteed String?, @guaranteed Error?) -> ()(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = *(void (**)(uint64_t, uint64_t, uint64_t, void *))(a1 + 32);
  if (a3)
  {
    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  swift_retain();
  id v10 = a4;
  v6(a2, v7, v9, a4);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t INShareETAIntentHandler.handle(intent:completion:)(void *a1, void (*a2)(id), uint64_t a3)
{
  uint64_t v7 = v3;
  swift_retain();
  specialized INShareETAIntentHandler.handleShareETA(intent:completion:)(a1, v7, v7, a2, a3);

  return swift_release();
}

void closure #1 in INShareETAIntentHandler.handleShareETA(intent:completion:)(void *a1, char *a2, void *a3, void (*a4)(void), uint64_t a5, void *a6)
{
  static os_log_type_t.info.getter();
  id v12 = *(NSObject **)&a2[OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_logObject];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_23FEBCB50;
  *(void *)(v13 + 56) = type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for MSPSharedTripService);
  *(void *)(v13 + 64) = lazy protocol witness table accessor for type MSPSharedTripService and conformance NSObject();
  *(void *)(v13 + 32) = a3;
  id v14 = a3;
  oslog = v12;
  os_log(_:dso:log:_:_:)();
  swift_bridgeObjectRelease();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a1;
  *(void *)(v15 + 24) = a2;
  *(void *)&long long v56 = partial apply for closure #1 in closure #1 in INShareETAIntentHandler.handleShareETA(intent:completion:);
  *((void *)&v56 + 1) = v15;
  *(void *)&long long aBlock = MEMORY[0x263EF8330];
  *((void *)&aBlock + 1) = 1107296256;
  *(void *)&long long v55 = thunk for @escaping @callee_guaranteed (@unowned Bool, @guaranteed String?, @guaranteed Error?) -> ();
  *((void *)&v55 + 1) = &block_descriptor_55;
  uint64_t v16 = _Block_copy(&aBlock);
  id v17 = a1;
  os_log_type_t v18 = a2;
  swift_release();
  objc_msgSend(v17, sel_fetchRequiresUserConfirmationOfSharingIdentityWithCompletion_, v16);
  _Block_release(v16);
  uint64_t v19 = &v18[OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_sharedTripContact];
  uint64_t v20 = *(void *)&v18[OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_sharedTripContact + 8];
  if (v20)
  {
    uint64_t v21 = (void *)*((void *)v19 + 5);
    uint64_t v22 = *((void *)v19 + 4);
    uint64_t v24 = (void *)*((void *)v19 + 2);
    uint64_t v23 = *((void *)v19 + 3);
    *(void *)&long long aBlock = *(void *)v19;
    *((void *)&aBlock + 1) = v20;
    *(void *)&long long v55 = v24;
    *((void *)&v55 + 1) = v23;
    *(void *)&long long v56 = v22;
    *((void *)&v56 + 1) = v21;
    id v51 = v21;
    swift_bridgeObjectRetain();
    id v25 = v24;
    os_log_type_t v26 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(oslog, v26))
    {
      swift_bridgeObjectRetain_n();
      id v27 = v25;
      id v28 = v51;
      uint64_t v49 = a6;
      id v29 = v27;
      id v30 = v28;
      uint64_t v50 = a5;
      unint64_t v48 = a4;
      id v31 = (uint8_t *)swift_slowAlloc();
      uint64_t v32 = swift_slowAlloc();
      v53[0] = v32;
      *(_DWORD *)id v31 = 136315138;
      swift_bridgeObjectRetain();
      id v33 = v29;
      id v47 = v17;
      id v34 = v30;
      uint64_t v35 = EnhancedMSPSharedTripContact.description.getter(v34);
      unint64_t v37 = v36;

      swift_bridgeObjectRelease();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v35, v37, v53);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      id v17 = v47;
      a6 = v49;
      swift_bridgeObjectRelease_n();
      a5 = v50;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23FE9C000, oslog, v26, "shared trip contact retrieved %s", v31, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2455DB720](v32, -1, -1);
      uint64_t v38 = v31;
      a4 = v48;
      MEMORY[0x2455DB720](v38, -1, -1);
    }
    uint64_t v39 = swift_allocObject();
    long long v40 = v55;
    *(_OWORD *)(v39 + 40) = aBlock;
    *(void *)(v39 + 16) = v18;
    *(void *)(v39 + 24) = a4;
    *(void *)(v39 + 32) = a5;
    *(_OWORD *)(v39 + 56) = v40;
    *(_OWORD *)(v39 + 72) = v56;
    *(void *)(v39 + 88) = a6;
    v53[4] = (uint64_t)partial apply for closure #2 in closure #1 in INShareETAIntentHandler.handleShareETA(intent:completion:);
    v53[5] = v39;
    v53[0] = MEMORY[0x263EF8330];
    v53[1] = 1107296256;
    v53[2] = (uint64_t)thunk for @escaping @callee_guaranteed (@unowned MSPSharedTripCapabilityType, @guaranteed Error?) -> ();
    v53[3] = (uint64_t)&block_descriptor_61;
    id v41 = _Block_copy(v53);
    uint64_t v42 = v18;
    swift_bridgeObjectRetain();
    id v43 = v25;
    id v44 = v51;
    swift_retain();
    id v45 = a6;
    swift_release();
    objc_msgSend(v17, sel_startSharingWithContact_completion_, v43, v41);
    _Block_release(v41);

    swift_bridgeObjectRelease();
  }
  else
  {
    static os_log_type_t.error.getter();
    os_log(_:dso:log:_:_:)();
    id v46 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FF58]), sel_initWithCode_userActivity_, 4, 0);
    a4();
  }
}

void closure #1 in closure #1 in INShareETAIntentHandler.handleShareETA(intent:completion:)(char a1, uint64_t a2, unint64_t a3, uint64_t a4, void *a5, void *a6)
{
  if (a1)
  {
    if (a3) {
      uint64_t v8 = a2;
    }
    else {
      uint64_t v8 = 0;
    }
    if (a3) {
      unint64_t v9 = a3;
    }
    else {
      unint64_t v9 = 0xE000000000000000;
    }
    swift_bridgeObjectRetain();
    id v10 = (void *)MEMORY[0x2455DADE0](v8, v9);
    swift_bridgeObjectRelease();
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = a6;
    v14[4] = partial apply for closure #1 in closure #1 in closure #1 in INShareETAIntentHandler.handleShareETA(intent:completion:);
    v14[5] = v11;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 1107296256;
    v14[2] = thunk for @escaping @callee_guaranteed (@guaranteed Error?) -> ();
    v14[3] = &block_descriptor_67;
    id v12 = _Block_copy(v14);
    id v13 = a6;
    swift_release();
    objc_msgSend(a5, sel_reportUserConfirmationOfSharingIdentity_completion_, v10, v12);
    _Block_release(v12);
  }
}

void closure #1 in closure #1 in closure #1 in INShareETAIntentHandler.handleShareETA(intent:completion:)(void *a1)
{
  if (a1)
  {
    id v2 = a1;
    static os_log_type_t.error.getter();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
    uint64_t v3 = swift_allocObject();
    *(_OWORD *)(v3 + 16) = xmmword_23FEBCB50;
    swift_getErrorValue();
    uint64_t v4 = Error.localizedDescription.getter();
    uint64_t v6 = v5;
    *(void *)(v3 + 56) = MEMORY[0x263F8D310];
    *(void *)(v3 + 64) = lazy protocol witness table accessor for type String and conformance String();
    *(void *)(v3 + 32) = v4;
    *(void *)(v3 + 40) = v6;
    os_log(_:dso:log:_:_:)();
    swift_bridgeObjectRelease();
  }
}

void closure #2 in closure #1 in INShareETAIntentHandler.handleShareETA(intent:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void), uint64_t a5, uint64_t a6, NSObject *a7)
{
  if (a2) {
    uint64_t v11 = (void *)_convertErrorToNSError(_:)();
  }
  else {
    uint64_t v11 = 0;
  }
  static os_log_type_t.info.getter();
  id v12 = *(NSObject **)(a3 + OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_logObject);
  os_log(_:dso:log:_:_:)();
  if (v11)
  {
    uint64_t v39 = a1;
    os_log_t log = a7;
    id v41 = v11;
    id v13 = v11;
    id v14 = objc_msgSend(v13, sel_code);
    static os_log_type_t.error.getter();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
    uint64_t v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = xmmword_23FEBCB50;
    id v16 = objc_msgSend(v13, sel_localizedDescription);
    uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v19 = v18;

    *(void *)(v15 + 56) = MEMORY[0x263F8D310];
    *(void *)(v15 + 64) = lazy protocol witness table accessor for type String and conformance String();
    *(void *)(v15 + 32) = v17;
    *(void *)(v15 + 40) = v19;
    os_log(_:dso:log:_:_:)();
    swift_bridgeObjectRelease();
    switch((unint64_t)v14)
    {
      case 5uLL:
        id v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FF58]), sel_initWithCode_userActivity_, 13, 0, v39);
        break;
      case 8uLL:
        id v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FF58]), sel_initWithCode_userActivity_, 12, 0, v39);
        break;
      case 0xCuLL:
        os_log_type_t v21 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v12, v21))
        {
          uint64_t v22 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v22 = 0;
          _os_log_impl(&dword_23FE9C000, v12, v21, "Already sharing with Contact", v22, 2u);
          MEMORY[0x2455DB720](v22, -1, -1);
        }

        a7 = log;
        uint64_t v11 = v41;
        a1 = v39;
        goto LABEL_15;
      default:
        id v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FF58]), sel_initWithCode_userActivity_, 4, 0, v39);
        break;
    }
    id v42 = v20;
    a4();
  }
  else
  {
LABEL_15:
    id v23 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FF58]), sel_initWithCode_userActivity_, 3, 0);
    uint64_t v24 = *(void **)(a6 + 40);
    if (v24)
    {
      id v25 = *(void **)(a6 + 40);
    }
    else
    {
      type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for NSString);
      id v25 = NSString.init(stringLiteral:)();
      uint64_t v24 = 0;
    }
    id v26 = v24;
    uint64_t v27 = specialized INShareETAIntentHandler.convertCompatibilityTypeToMedium(type:serviceName:)(a1);

    objc_msgSend(v23, sel_setMediums_, v27);
    type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for INPerson);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    objc_msgSend(v23, sel_setRecipients_, isa);

    id v29 = [a7 recipients];
    objc_msgSend(v23, sel_setRecipients_, v29);

    id v30 = v23;
    os_log_type_t v31 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v12, v31))
    {
      id v43 = v11;
      uint64_t v32 = (uint8_t *)swift_slowAlloc();
      uint64_t v33 = swift_slowAlloc();
      uint64_t v45 = v33;
      *(_DWORD *)uint64_t v32 = 136315138;
      id v34 = v30;
      id v35 = objc_msgSend(v34, sel_description);
      uint64_t v36 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v38 = v37;

      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v36, v38, &v45);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      uint64_t v11 = v43;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23FE9C000, v12, v31, "Sending response : %s", v32, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2455DB720](v33, -1, -1);
      MEMORY[0x2455DB720](v32, -1, -1);
    }
    else
    {
    }
    ((void (*)(id))a4)(v30);
  }
}

void thunk for @escaping @callee_guaranteed (@unowned MSPSharedTripCapabilityType, @guaranteed Error?) -> ()(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

id INShareETAIntentHandler.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id INShareETAIntentHandler.init()()
{
  uint64_t v1 = OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_logObject;
  type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for OS_os_log);
  id v2 = v0;
  *(void *)&v0[v1] = OS_os_log.init(subsystem:category:)();
  uint64_t v3 = &v2[OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_sharedTripContact];
  *((_OWORD *)v3 + 1) = 0u;
  *((_OWORD *)v3 + 2) = 0u;
  *(_OWORD *)uint64_t v3 = 0u;
  uint64_t v4 = OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_contactService;
  type metadata accessor for ContactService();
  swift_allocObject();
  *(void *)&v2[v4] = ContactService.init()();

  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for INShareETAIntentHandler();
  return objc_msgSendSuper2(&v6, sel_init);
}

id INShareETAIntentHandler.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for INShareETAIntentHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id @nonobjc INPerson.init(personHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v16 = type metadata accessor for PersonNameComponents();
  uint64_t v17 = *(void *)(v16 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v17 + 48))(a2, 1, v16) != 1)
  {
    Class isa = PersonNameComponents._bridgeToObjectiveC()().super.isa;
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(a2, v16);
  }
  if (a4)
  {
    uint64_t v19 = (void *)MEMORY[0x2455DADE0](a3, a4);
    swift_bridgeObjectRelease();
    uint64_t v20 = a9;
    if (a7) {
      goto LABEL_5;
    }
LABEL_8:
    os_log_type_t v21 = 0;
    if (v20) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v22 = 0;
    goto LABEL_10;
  }
  uint64_t v19 = 0;
  uint64_t v20 = a9;
  if (!a7) {
    goto LABEL_8;
  }
LABEL_5:
  os_log_type_t v21 = (void *)MEMORY[0x2455DADE0](a6, a7);
  swift_bridgeObjectRelease();
  if (!v20) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v22 = (void *)MEMORY[0x2455DADE0](a8, v20);
  swift_bridgeObjectRelease();
LABEL_10:
  id v23 = objc_msgSend(v26, sel_initWithPersonHandle_nameComponents_displayName_image_contactIdentifier_customIdentifier_, a1, isa, v19, a5, v21, v22, a8);

  return v23;
}

void partial apply for closure #1 in INShareETAIntentHandler.confirm(intent:completion:)(void *a1)
{
  closure #1 in INShareETAIntentHandler.confirm(intent:completion:)(a1, *(void **)(v1 + 16), *(void **)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40));
}

void specialized INShareETAIntentHandler.resolveRecipients(for:with:)(void *a1, char *a2, void (**a3)(void, void))
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a3;
  uint64_t v7 = *(NSObject **)&a2[OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_logObject];
  _Block_copy(a3);
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    unint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v9 = 0;
    _os_log_impl(&dword_23FE9C000, v7, v8, "resolveRecipient called", v9, 2u);
    MEMORY[0x2455DB720](v9, -1, -1);
  }
  id v10 = objc_msgSend(self, sel_sharedInstance);
  if (v10)
  {
    uint64_t v11 = v10;
    os_log_type_t v12 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v7, v12))
    {
      id v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v13 = 0;
      _os_log_impl(&dword_23FE9C000, v7, v12, "share ETA confirm ready", v13, 2u);
      MEMORY[0x2455DB720](v13, -1, -1);
    }
    id v14 = (void *)swift_allocObject();
    v14[2] = a2;
    v14[3] = v11;
    v14[4] = a1;
    v14[5] = partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSArray) -> ();
    void v14[6] = v6;
    aBlock[4] = partial apply for closure #1 in INShareETAIntentHandler.resolveRecipients(for:with:);
    aBlock[5] = v14;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed MSPSharedTripService) -> ();
    aBlock[3] = &block_descriptor_40;
    uint64_t v15 = _Block_copy(aBlock);
    uint64_t v16 = a2;
    id v17 = v11;
    id v18 = a1;
    swift_retain();
    swift_release();
    objc_msgSend(v17, sel_performBlockAfterInitialSync_, v15);
    _Block_release(v15);
    swift_release();
  }
  else
  {
    static os_log_type_t.error.getter();
    os_log(_:dso:log:_:_:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
    uint64_t v19 = swift_allocObject();
    *(_OWORD *)(v19 + 16) = xmmword_23FEBCBC0;
    *(void *)(v19 + 32) = objc_msgSend(self, sel_unsupportedForReason_, 5);
    aBlock[0] = v19;
    specialized Array._endMutation()();
    type metadata accessor for OS_os_log(0, (unint64_t *)&lazy cache variable for type metadata for INShareETARecipientResolutionResult);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    ((void (**)(void, Class))a3)[2](a3, isa);
    swift_release();
    swift_bridgeObjectRelease();
  }
}

BOOL specialized INShareETAIntentHandler.phoneDisambiguationCandidates(_:)(void *a1)
{
  unint64_t v2 = a1[2];
  if (v2 > 1)
  {
    os_log_type_t v12 = (void *)a1[6];
    if ((objc_msgSend(v12, sel_isPhoneNumber) & 1) == 0)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<EnhancedMSPSharedTripContact>);
      uint64_t v29 = swift_allocObject();
      *(_OWORD *)(v29 + 16) = xmmword_23FEBCB50;
      uint64_t v30 = a1[5];
      uint64_t v31 = a1[7];
      uint64_t v32 = a1[8];
      uint64_t v33 = (void *)a1[9];
      *(void *)(v29 + 32) = a1[4];
      *(void *)(v29 + 40) = v30;
      *(void *)(v29 + 48) = v12;
      *(void *)(v29 + 56) = v31;
      *(void *)(v29 + 64) = v32;
      *(void *)(v29 + 72) = v33;
      id v34 = v33;
      swift_bridgeObjectRetain();
      id v35 = v12;
      return 0;
    }
    double v13 = *((double *)a1 + 8);
    id v14 = (id)a1[7];
    id v15 = (id)a1[9];
    uint64_t v17 = a1[4];
    uint64_t v16 = a1[5];
    id v18 = v15;
    id v19 = v12;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (objc_msgSend(v19, sel_isPhoneNumber))
    {
      uint64_t v36 = v17;
      uint64_t v20 = (id *)(a1 + 15);
      os_log_type_t v21 = (void *)MEMORY[0x263F8EE78];
      double v22 = v13;
      while (1)
      {
        id v23 = v18;
        swift_bridgeObjectRetain();
        id v24 = v19;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          os_log_type_t v21 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v21[2] + 1, 1, v21);
        }
        unint64_t v26 = v21[2];
        unint64_t v25 = v21[3];
        if (v26 >= v25 >> 1) {
          os_log_type_t v21 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v25 > 1), v26 + 1, 1, v21);
        }
        v21[2] = v26 + 1;
        uint64_t v27 = (double *)&v21[6 * v26];
        *((void *)v27 + 4) = v36;
        *((void *)v27 + 5) = v16;
        *((void *)v27 + 6) = v24;
        *((void *)v27 + 7) = v14;
        v27[8] = v22;
        *((void *)v27 + 9) = v15;

        swift_bridgeObjectRelease();
        if (!--v2) {
          break;
        }
        if (v14 != *(v20 - 2)) {
          break;
        }
        double v22 = *((double *)v20 - 1);
        if (v13 != v22) {
          break;
        }
        uint64_t v16 = (uint64_t)*(v20 - 4);
        uint64_t v36 = (uint64_t)*(v20 - 5);
        id v28 = *(v20 - 3);
        id v15 = *v20;
        id v18 = *v20;
        swift_bridgeObjectRetain();
        id v19 = v28;
        v20 += 6;
        if ((objc_msgSend(v19, sel_isPhoneNumber) & 1) == 0) {
          goto LABEL_18;
        }
      }
    }
    else
    {
      os_log_type_t v21 = (void *)MEMORY[0x263F8EE78];
LABEL_18:
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<EnhancedMSPSharedTripContact>);
    uint64_t v3 = swift_allocObject();
    *(_OWORD *)(v3 + 16) = xmmword_23FEBCB50;
    if (v2 == 1)
    {
      uint64_t v4 = a1[5];
      uint64_t v6 = (void *)a1[6];
      uint64_t v5 = a1[7];
      uint64_t v7 = a1[8];
      os_log_type_t v8 = (void *)a1[9];
      *(void *)(v3 + 32) = a1[4];
      *(void *)(v3 + 40) = v4;
      *(void *)(v3 + 48) = v6;
      *(void *)(v3 + 56) = v5;
      *(void *)(v3 + 64) = v7;
      *(void *)(v3 + 72) = v8;
      id v9 = v8;
      swift_bridgeObjectRetain();
      id v10 = v6;
      return 0;
    }
    __break(1u);
    os_log_type_t v21 = (void *)MEMORY[0x263F8EE78];
  }
  return v21[2] > 1uLL;
}

void specialized INShareETAIntentHandler.confirm(intent:completion:)(void *a1, void (**a2)(void, void))
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a2;
  uint64_t v5 = self;
  _Block_copy(a2);
  id v6 = objc_msgSend(v5, sel_sharedInstance);
  if (v6)
  {
    uint64_t v7 = v6;
    os_log_type_t v8 = (void *)swift_allocObject();
    v8[2] = a1;
    v8[3] = v7;
    v8[4] = thunk for @escaping @callee_unowned @convention(block) (@unowned INShareETAIntentResponse) -> ()partial apply;
    v8[5] = v4;
    aBlock[4] = closure #1 in INShareETAIntentHandler.confirm(intent:completion:)partial apply;
    aBlock[5] = v8;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed MSPSharedTripService) -> ();
    aBlock[3] = &block_descriptor_30;
    id v9 = _Block_copy(aBlock);
    id v10 = a1;
    id v11 = v7;
    swift_retain();
    swift_release();
    objc_msgSend(v11, sel_performBlockAfterInitialSync_, v9);
    _Block_release(v9);
    swift_release();
  }
  else
  {
    static os_log_type_t.error.getter();
    os_log(_:dso:log:_:_:)();
    id v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FF58]), sel_initWithCode_userActivity_, 4, 0);
    ((void (**)(void, id))a2)[2](a2, v12);
    swift_release();
  }
}

void specialized INShareETAIntentHandler.handleShareETA(intent:completion:)(void *a1, char *a2, void *a3, void (*a4)(id), uint64_t a5)
{
  id v10 = (void *)swift_allocObject();
  v10[2] = a3;
  v10[3] = a4;
  v10[4] = a5;
  id v11 = *(NSObject **)&a2[OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_logObject];
  id v12 = a1;
  double v13 = a3;
  swift_retain();
  os_log_type_t v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v14))
  {
    uint64_t v39 = v13;
    unint64_t v38 = a2;
    id v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    aBlock[0] = v16;
    *(_DWORD *)id v15 = 136315138;
    id v17 = objc_msgSend(v12, sel_recipients);
    if (!v17)
    {

      swift_release();
      __break(1u);
      return;
    }
    id v18 = v17;
    uint64_t v19 = type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for INPerson);
    uint64_t v20 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v21 = MEMORY[0x2455DAEA0](v20, v19);
    unint64_t v23 = v22;
    swift_bridgeObjectRelease();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v21, v23, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23FE9C000, v11, v14, "handle Contact: %s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2455DB720](v16, -1, -1);
    MEMORY[0x2455DB720](v15, -1, -1);
    double v13 = v39;
    a2 = v38;
  }
  else
  {
  }
  id v24 = objc_msgSend(self, sel_sharedInstance);
  if (v24)
  {
    unint64_t v25 = v24;
    unint64_t v26 = (void *)swift_allocObject();
    v26[2] = a2;
    v26[3] = v25;
    v26[4] = partial apply for closure #1 in INShareETAIntentHandler.handle(intent:completion:);
    v26[5] = v10;
    v26[6] = v12;
    aBlock[4] = (uint64_t)partial apply for closure #1 in INShareETAIntentHandler.handleShareETA(intent:completion:);
    aBlock[5] = (uint64_t)v26;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)thunk for @escaping @callee_guaranteed (@guaranteed MSPSharedTripService) -> ();
    aBlock[3] = (uint64_t)&block_descriptor_49;
    uint64_t v27 = _Block_copy(aBlock);
    id v28 = v12;
    uint64_t v29 = a2;
    id v30 = v25;
    swift_retain();
    swift_release();
    objc_msgSend(v30, sel_performBlockAfterInitialSync_, v27);
    _Block_release(v27);
  }
  else
  {
    static os_log_type_t.error.getter();
    os_log(_:dso:log:_:_:)();
    id v30 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FF58]), sel_initWithCode_userActivity_, 6, 0);
    uint64_t v31 = &v13[OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_sharedTripContact];
    uint64_t v32 = *(void *)&v13[OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_sharedTripContact];
    uint64_t v33 = *(void *)&v13[OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_sharedTripContact + 8];
    id v34 = *(void **)&v13[OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_sharedTripContact + 16];
    uint64_t v35 = *(void *)&v13[OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_sharedTripContact + 24];
    uint64_t v36 = *(void *)&v13[OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_sharedTripContact + 32];
    unint64_t v37 = *(void **)&v13[OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_sharedTripContact + 40];
    *(_OWORD *)uint64_t v31 = 0u;
    *((_OWORD *)v31 + 1) = 0u;
    *((_OWORD *)v31 + 2) = 0u;
    outlined consume of EnhancedMSPSharedTripContact?(v32, v33, v34, v35, v36, v37);
    a4(v30);
  }
  swift_release();
}

uint64_t type metadata accessor for INShareETAIntentHandler()
{
  return self;
}

uint64_t partial apply for closure #2 in INShareETAIntentHandler.resolveRecipientsInsideBlock(for:with:)(void *a1)
{
  return closure #2 in INShareETAIntentHandler.resolveRecipientsInsideBlock(for:with:)(a1, *(char **)(v1 + 16), *(void (**)(uint64_t))(v1 + 24), *(void *)(v1 + 32));
}

void outlined consume of EnhancedMSPSharedTripContact?(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_23FEB062C()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t objectdestroy_2Tm()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

void partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSArray) -> ()(uint64_t a1)
{
  thunk for @escaping @callee_unowned @convention(block) (@unowned NSArray) -> ()(a1, *(void *)(v1 + 16));
}

{
  uint64_t v1;

  thunk for @escaping @callee_unowned @convention(block) (@unowned NSArray) -> ()(a1, *(void *)(v1 + 16));
}

uint64_t objectdestroyTm()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t partial apply for closure #1 in INShareETAIntentHandler.handle(intent:completion:)(uint64_t a1)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v1 + 24);
  uint64_t v4 = (uint64_t *)(*(void *)(v1 + 16) + OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_sharedTripContact);
  uint64_t v5 = *v4;
  uint64_t v6 = v4[1];
  uint64_t v7 = (void *)v4[2];
  uint64_t v8 = v4[3];
  uint64_t v9 = v4[4];
  id v10 = (void *)v4[5];
  *(_OWORD *)uint64_t v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_OWORD *)v4 + 2) = 0u;
  outlined consume of EnhancedMSPSharedTripContact?(v5, v6, v7, v8, v9, v10);
  return v3(a1);
}

uint64_t sub_23FEB0774()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t partial apply for closure #1 in INShareETAIntentHandler.handleShareETA(intent:completion:)(uint64_t a1)
{
  return partial apply for closure #1 in INShareETAIntentHandler.resolveRecipients(for:with:)(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))closure #1 in INShareETAIntentHandler.handleShareETA(intent:completion:));
}

uint64_t partial apply for closure #1 in INShareETAIntentHandler.resolveRecipients(for:with:)(uint64_t a1, uint64_t (*a2)(uint64_t, void, void, void, void, void))
{
  return a2(a1, v2[2], v2[3], v2[4], v2[5], v2[6]);
}

unint64_t lazy protocol witness table accessor for type MSPSharedTripService and conformance NSObject()
{
  unint64_t result = lazy protocol witness table cache variable for type MSPSharedTripService and conformance NSObject;
  if (!lazy protocol witness table cache variable for type MSPSharedTripService and conformance NSObject)
  {
    type metadata accessor for OS_os_log(255, &lazy cache variable for type metadata for MSPSharedTripService);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MSPSharedTripService and conformance NSObject);
  }
  return result;
}

uint64_t sub_23FEB085C()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void partial apply for closure #1 in closure #1 in INShareETAIntentHandler.handleShareETA(intent:completion:)(char a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  closure #1 in closure #1 in INShareETAIntentHandler.handleShareETA(intent:completion:)(a1, a2, a3, a4, *(void **)(v4 + 16), *(void **)(v4 + 24));
}

uint64_t sub_23FEB08A4()
{
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 96, 7);
}

void partial apply for closure #2 in closure #1 in INShareETAIntentHandler.handleShareETA(intent:completion:)(uint64_t a1, uint64_t a2)
{
  closure #2 in closure #1 in INShareETAIntentHandler.handleShareETA(intent:completion:)(a1, a2, *(void *)(v2 + 16), *(void (**)(void))(v2 + 24), *(void *)(v2 + 32), v2 + 40, *(NSObject **)(v2 + 88));
}

uint64_t specialized INShareETAIntentHandler.convertCompatibilityTypeToMedium(type:serviceName:)(uint64_t a1)
{
  if (a1 == 4) {
    return 2;
  }
  if (a1 == 3) {
    return 4;
  }
  if (a1 != 2) {
    return 1;
  }
  uint64_t v1 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v3 = v2;
  if (v1 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v3 == v4)
  {
    swift_bridgeObjectRelease_n();
    return 1;
  }
  char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v6) {
    return 1;
  }
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  if (v7 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v9 == v10)
  {
    swift_bridgeObjectRelease_n();
    return 8;
  }
  else
  {
    char v12 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v12) {
      return 8;
    }
    else {
      return 1;
    }
  }
}

uint64_t sub_23FEB0A64()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void partial apply for closure #1 in closure #1 in closure #1 in INShareETAIntentHandler.handleShareETA(intent:completion:)(void *a1)
{
}

uint64_t objectdestroy_15Tm()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

void partial apply for closure #1 in closure #1 in INShareETAIntentHandler.confirm(intent:completion:)(char a1, uint64_t a2, uint64_t a3, void *a4)
{
  closure #1 in closure #1 in INShareETAIntentHandler.confirm(intent:completion:)(a1, a2, a3, a4, *(void *)(v4 + 16), *(void (**)(void))(v4 + 24));
}

void thunk for @escaping @callee_guaranteed (@guaranteed Error?) -> ()(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

id INStopShareETAIntentHandler.logObject.getter()
{
  return *(id *)(v0 + OBJC_IVAR____TtC7SiriGeo27INStopShareETAIntentHandler_logObject);
}

void INStopShareETAIntentHandler.resolveRecipients(for:with:)(void *a1, void (*a2)(uint64_t), uint64_t a3)
{
  id v7 = objc_msgSend(self, sel_sharedInstance);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = (void *)swift_allocObject();
    void v9[2] = v3;
    v9[3] = a1;
    v9[4] = a2;
    v9[5] = a3;
    v17[4] = partial apply for closure #1 in INStopShareETAIntentHandler.resolveRecipients(for:with:);
    v17[5] = v9;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 1107296256;
    v17[2] = thunk for @escaping @callee_guaranteed (@guaranteed MSPSharedTripService) -> ();
    v17[3] = &block_descriptor_2;
    uint64_t v10 = _Block_copy(v17);
    id v11 = v3;
    id v12 = a1;
    swift_retain();
    swift_release();
    objc_msgSend(v8, sel_performBlockAfterInitialSync_, v10);
    _Block_release(v10);
  }
  else
  {
    double v13 = *(NSObject **)&v3[OBJC_IVAR____TtC7SiriGeo27INStopShareETAIntentHandler_logObject];
    os_log_type_t v14 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v13, v14))
    {
      id v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v15 = 0;
      _os_log_impl(&dword_23FE9C000, v13, v14, "could not get msp shared instance to check if the there is a match with receivers", v15, 2u);
      MEMORY[0x2455DB720](v15, -1, -1);
    }
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
    uint64_t v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_23FEBCBC0;
    *(void *)(v16 + 32) = objc_msgSend(self, sel_unsupportedForReason_, 5);
    specialized Array._endMutation()();
    a2(v16);
    swift_bridgeObjectRelease();
  }
}

void INStopShareETAIntentHandler.resolveRecipientsInsideBlock(for:sharedTrip:with:)(void *a1, void *a2, void (*a3)(uint64_t))
{
  uint64_t v4 = v3;
  id v7 = objc_msgSend(a1, sel_recipients);
  if (!v7)
  {
    long long v40 = *(NSObject **)(v3 + OBJC_IVAR____TtC7SiriGeo27INStopShareETAIntentHandler_logObject);
    os_log_type_t v41 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v40, v41))
    {
      id v42 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v42 = 0;
      _os_log_impl(&dword_23FE9C000, v40, v41, "resolveRecipients nil recipients - stop sharing ETA with all recipients", v42, 2u);
      MEMORY[0x2455DB720](v42, -1, -1);
    }
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
    uint64_t v43 = swift_allocObject();
    *(_OWORD *)(v43 + 16) = xmmword_23FEBCBC0;
    type metadata accessor for OS_os_log(0, (unint64_t *)&lazy cache variable for type metadata for INStopShareETARecipientResolutionResult);
    *(void *)(v43 + 32) = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_notRequired);
    uint64_t v71 = v43;
    specialized Array._endMutation()();
    a3(v43);
    goto LABEL_55;
  }
  uint64_t v8 = v7;
  type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for INPerson);
  unint64_t v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  unint64_t v10 = specialized static INPerson.contactsWithContactIdentifiers(_:)(v9);
  swift_bridgeObjectRelease();
  uint64_t v65 = a3;
  if (v10 >> 62)
  {
LABEL_53:
    swift_bridgeObjectRetain();
    uint64_t v11 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    unint64_t v12 = v10;
    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_54;
  }
  uint64_t v11 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
  unint64_t v12 = v10;
  if (!v11)
  {
LABEL_54:
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
    uint64_t v60 = swift_allocObject();
    *(_OWORD *)(v60 + 16) = xmmword_23FEBCBC0;
    *(void *)(v60 + 32) = objc_msgSend(self, sel_unsupportedForReason_, 1);
    uint64_t v71 = v60;
    specialized Array._endMutation()();
    v65(v71);
LABEL_55:
    swift_bridgeObjectRelease();
    return;
  }
LABEL_4:
  unint64_t v13 = 0;
  os_log_type_t v14 = *(NSObject **)(v4 + OBJC_IVAR____TtC7SiriGeo27INStopShareETAIntentHandler_logObject);
  uint64_t v67 = OBJC_IVAR____TtC7SiriGeo27INStopShareETAIntentHandler_contactService;
  unint64_t v68 = v12 & 0xC000000000000001;
  unint64_t v61 = v12 + 32;
  uint64_t v62 = v12 & 0xFFFFFFFFFFFFFF8;
  uint64_t v63 = v11;
  osos_log_t log = v14;
  uint64_t v69 = v4;
  while (1)
  {
    if (v68)
    {
      id v15 = (id)MEMORY[0x2455DB020](v13, v12);
      BOOL v16 = __OFADD__(v13, 1);
      unint64_t v17 = v13 + 1;
      if (v16) {
        goto LABEL_51;
      }
    }
    else
    {
      if (v13 >= *(void *)(v62 + 16)) {
        goto LABEL_52;
      }
      id v15 = *(id *)(v61 + 8 * v13);
      BOOL v16 = __OFADD__(v13, 1);
      unint64_t v17 = v13 + 1;
      if (v16)
      {
LABEL_51:
        __break(1u);
LABEL_52:
        __break(1u);
        goto LABEL_53;
      }
    }
    id v18 = v15;
    os_log_type_t v19 = static os_log_type_t.default.getter();
    unint64_t v70 = v17;
    if (os_log_type_enabled(v14, v19))
    {
      uint64_t v20 = swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      uint64_t v71 = v21;
      *(_DWORD *)uint64_t v20 = 136315138;
      id v22 = v18;
      id v23 = objc_msgSend(v22, sel_description);
      uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v25 = a2;
      unint64_t v26 = v12;
      id v27 = v18;
      unint64_t v29 = v28;

      uint64_t v4 = v69;
      *(void *)(v20 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v24, v29, &v71);

      id v18 = v27;
      unint64_t v12 = v26;
      a2 = v25;
      uint64_t v11 = v63;
      os_log_type_t v14 = oslog;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23FE9C000, oslog, v19, "match %s", (uint8_t *)v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2455DB720](v21, -1, -1);
      MEMORY[0x2455DB720](v20, -1, -1);
    }
    else
    {
    }
    unint64_t v10 = *(void *)(v4 + v67);
    id v30 = *(uint64_t (**)(id))(*(void *)v10 + 128);
    swift_retain();
    uint64_t v31 = v30(v18);
    uint64_t v33 = v32;
    swift_release();
    if (v31) {
      break;
    }

LABEL_6:
    unint64_t v13 = v70;
    if (v70 == v11) {
      goto LABEL_54;
    }
  }
  if (!((unint64_t)v31 >> 62))
  {
    uint64_t v4 = *(void *)((v31 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v4) {
      goto LABEL_19;
    }
LABEL_34:
    swift_bridgeObjectRelease();
    os_log_type_t v39 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v14, v39))
    {
      unint64_t v10 = swift_slowAlloc();
      *(_WORD *)unint64_t v10 = 0;
      _os_log_impl(&dword_23FE9C000, v14, v39, "failed to fetch contact from recipient", (uint8_t *)v10, 2u);
      MEMORY[0x2455DB720](v10, -1, -1);
    }

    uint64_t v4 = v69;
    goto LABEL_6;
  }
  if (v31 >= 0) {
    unint64_t v10 = v31 & 0xFFFFFFFFFFFFFF8;
  }
  else {
    unint64_t v10 = v31;
  }
  swift_bridgeObjectRetain();
  uint64_t v38 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v38) {
    goto LABEL_34;
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (v4 < 0)
  {
    __break(1u);
    return;
  }
  if (!v4)
  {

    swift_bridgeObjectRelease();
    uint64_t v4 = v69;
    goto LABEL_6;
  }
LABEL_19:
  uint64_t v64 = v18;
  unint64_t v10 = 0;
  unint64_t v34 = v31 & 0xC000000000000001;
  while (1)
  {
    if (v4 == v10)
    {
      __break(1u);
      goto LABEL_51;
    }
    id v35 = v34 ? (id)MEMORY[0x2455DB020](v10, v31) : *(id *)(v31 + 8 * v10 + 32);
    uint64_t v36 = v35;
    unsigned int v37 = objc_msgSend(a2, sel_isSharingWithContact_, v35);

    if (v37) {
      break;
    }
    if (v4 == ++v10)
    {

      swift_bridgeObjectRelease();
      os_log_type_t v14 = oslog;
      uint64_t v4 = v69;
      goto LABEL_6;
    }
  }
  swift_bridgeObjectRelease();
  if (v34) {
    id v44 = (id)MEMORY[0x2455DB020](v10, v31);
  }
  else {
    id v44 = *(id *)(v31 + 8 * v10 + 32);
  }
  uint64_t v45 = v65;
  id v46 = *(void **)(v69 + OBJC_IVAR____TtC7SiriGeo27INStopShareETAIntentHandler_sharedTripContact);
  *(void *)(v69 + OBJC_IVAR____TtC7SiriGeo27INStopShareETAIntentHandler_sharedTripContact) = v44;

  swift_bridgeObjectRetain();
  os_log_type_t v47 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(oslog, v47))
  {
    unint64_t v48 = (uint8_t *)swift_slowAlloc();
    uint64_t v49 = swift_slowAlloc();
    uint64_t v71 = v49;
    *(_DWORD *)unint64_t v48 = 136315138;
    if (v34) {
      id v50 = (id)MEMORY[0x2455DB020](v10, v31);
    }
    else {
      id v50 = *(id *)(v31 + 8 * v10 + 32);
    }
    id v52 = v50;
    id v51 = v64;
    id v53 = objc_msgSend(v50, sel_description);
    uint64_t v54 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v56 = v55;

    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v54, v56, &v71);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23FE9C000, oslog, v47, "resolveRecipients successful %s", v48, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2455DB720](v49, -1, -1);
    MEMORY[0x2455DB720](v48, -1, -1);
    uint64_t v45 = v65;
  }
  else
  {
    swift_bridgeObjectRelease_n();
    id v51 = v64;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  uint64_t v57 = swift_allocObject();
  *(_OWORD *)(v57 + 16) = xmmword_23FEBCBC0;
  *(void *)(v57 + 32) = v33;
  uint64_t v71 = v57;
  specialized Array._endMutation()();
  uint64_t v58 = v71;
  id v59 = v33;
  v45(v58);
  swift_bridgeObjectRelease();
}

void INStopShareETAIntentHandler.confirm(intent:completion:)(uint64_t a1, void (*a2)(id), uint64_t a3)
{
  char v6 = *(NSObject **)&v3[OBJC_IVAR____TtC7SiriGeo27INStopShareETAIntentHandler_logObject];
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_23FE9C000, v6, v7, "stop sharing ETA - confirm", v8, 2u);
    MEMORY[0x2455DB720](v8, -1, -1);
  }
  id v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F10000]), sel_initWithCode_userActivity_, 1, 0);
  id v9 = objc_msgSend(self, sel_sharedInstance);
  if (v9)
  {
    unint64_t v10 = v9;
    uint64_t v11 = (void *)swift_allocObject();
    v11[2] = v3;
    v11[3] = v17;
    v11[4] = a2;
    v11[5] = a3;
    aBlock[4] = partial apply for closure #1 in INStopShareETAIntentHandler.confirm(intent:completion:);
    aBlock[5] = v11;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed MSPSharedTripService) -> ();
    aBlock[3] = &block_descriptor_6_0;
    unint64_t v12 = _Block_copy(aBlock);
    unint64_t v13 = v3;
    id v14 = v17;
    swift_retain();
    swift_release();
    objc_msgSend(v10, sel_performBlockAfterInitialSync_, v12);
    _Block_release(v12);
  }
  else
  {
    os_log_type_t v15 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v6, v15))
    {
      BOOL v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)BOOL v16 = 0;
      _os_log_impl(&dword_23FE9C000, v6, v15, "failed to retrieve shared instance", v16, 2u);
      MEMORY[0x2455DB720](v16, -1, -1);
    }
    a2(v17);
  }
}

uint64_t closure #1 in INStopShareETAIntentHandler.confirm(intent:completion:)(void *a1, uint64_t a2, void *a3, uint64_t (*a4)(id))
{
  uint64_t v5 = *(NSObject **)(a2 + OBJC_IVAR____TtC7SiriGeo27INStopShareETAIntentHandler_logObject);
  id v6 = a1;
  os_log_type_t v7 = static os_log_type_t.default.getter();
  unint64_t v8 = 0x265096000uLL;
  if (os_log_type_enabled(v5, v7))
  {
    id v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v34 = v10;
    *(_DWORD *)id v9 = 136315138;
    id v11 = objc_msgSend(v6, sel_receivers);
    uint64_t v12 = type metadata accessor for OS_os_log(0, (unint64_t *)&lazy cache variable for type metadata for MSPSharedTripContact);
    unint64_t v13 = a3;
    id v14 = v5;
    uint64_t v15 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v16 = MEMORY[0x2455DAEA0](v15, v12);
    unint64_t v18 = v17;
    uint64_t v5 = v14;
    a3 = v13;
    unint64_t v8 = 0x265096000;
    swift_bridgeObjectRelease();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v16, v18, &v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23FE9C000, v5, v7, "receivers of shared trip %s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2455DB720](v10, -1, -1);
    MEMORY[0x2455DB720](v9, -1, -1);
  }
  else
  {
  }
  id v19 = [v6 *(SEL *)(v8 + 3408)];
  type metadata accessor for OS_os_log(0, (unint64_t *)&lazy cache variable for type metadata for MSPSharedTripContact);
  unint64_t v20 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  specialized INStopShareETAIntentHandler.convertSharedTripToRecipients(_:)(v20);
  swift_bridgeObjectRelease();
  type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for INPerson);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setRecipients_, isa);

  id v22 = a3;
  os_log_type_t v23 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v23))
  {
    uint64_t v24 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    uint64_t v34 = v25;
    *(_DWORD *)uint64_t v24 = 136315138;
    os_log_t log = v5;
    id v26 = v22;
    id v27 = objc_msgSend(v26, sel_description);
    uint64_t v28 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v30 = v29;

    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v28, v30, &v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23FE9C000, log, v23, "confirm response %s", v24, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2455DB720](v25, -1, -1);
    MEMORY[0x2455DB720](v24, -1, -1);
  }
  else
  {
  }
  return a4(v22);
}

uint64_t INStopShareETAIntentHandler.handle(intent:completion:)(void *a1, void (*a2)(id), uint64_t a3)
{
  os_log_type_t v7 = (void *)swift_allocObject();
  v7[2] = v3;
  v7[3] = a2;
  v7[4] = a3;
  unint64_t v8 = self;
  id v9 = v3;
  swift_retain_n();
  uint64_t v10 = (char *)v9;
  id v11 = objc_msgSend(v8, sel_sharedInstance);
  if (v11)
  {
    uint64_t v12 = v11;
    unint64_t v13 = (void *)swift_allocObject();
    v13[2] = v10;
    v13[3] = partial apply for closure #1 in INStopShareETAIntentHandler.handle(intent:completion:);
    v13[4] = v7;
    v13[5] = a1;
    v20[4] = partial apply for closure #1 in INStopShareETAIntentHandler.handleStopShareETA(intent:completion:);
    v20[5] = v13;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 1107296256;
    id v20[2] = thunk for @escaping @callee_guaranteed (@guaranteed MSPSharedTripService) -> ();
    v20[3] = &block_descriptor_15;
    id v14 = _Block_copy(v20);
    uint64_t v15 = v10;
    swift_retain();
    id v16 = a1;
    swift_release();
    objc_msgSend(v12, sel_performBlockAfterInitialSync_, v14);
    _Block_release(v14);

    swift_release();
  }
  else
  {
    static os_log_type_t.error.getter();
    os_log(_:dso:log:_:_:)();
    id v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F10000]), sel_initWithCode_userActivity_, 4, 0);
    unint64_t v18 = *(void **)&v10[OBJC_IVAR____TtC7SiriGeo27INStopShareETAIntentHandler_sharedTripContact];
    *(void *)&v10[OBJC_IVAR____TtC7SiriGeo27INStopShareETAIntentHandler_sharedTripContact] = 0;

    a2(v17);
    swift_release();
  }
  return swift_release();
}

void @objc INStopShareETAIntentHandler.resolveRecipients(for:with:)(void *a1, int a2, void *a3, void *aBlock, void (*a5)(id, id, void *))
{
  unint64_t v8 = _Block_copy(aBlock);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a1;
  a5(v9, v10, v8);
  _Block_release(v8);
  _Block_release(v8);
}

void closure #1 in INStopShareETAIntentHandler.handleStopShareETA(intent:completion:)(void *a1, char *a2, uint64_t a3, uint64_t a4, void *a5)
{
  unint64_t v8 = a2;
  id v9 = *(NSObject **)&a2[OBJC_IVAR____TtC7SiriGeo27INStopShareETAIntentHandler_logObject];
  id v10 = a1;
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v11))
  {
    os_log_t log = v9;
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v58 = v8;
    uint64_t v13 = swift_slowAlloc();
    uint64_t aBlock = v13;
    *(_DWORD *)uint64_t v12 = 136315138;
    uint64_t v56 = a3;
    id v14 = v10;
    uint64_t v15 = a5;
    id v16 = v10;
    id v17 = objc_msgSend(v14, sel_description);
    uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v53 = a4;
    unint64_t v20 = v19;

    id v10 = v16;
    a5 = v15;
    uint64_t v21 = v18;
    id v9 = log;
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v21, v20, &aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    a3 = v56;
    a4 = v53;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23FE9C000, log, v11, "stop sharing ETA - shared trip retrieved %s", v12, 0xCu);
    swift_arrayDestroy();
    uint64_t v22 = v13;
    unint64_t v8 = v58;
    MEMORY[0x2455DB720](v22, -1, -1);
    MEMORY[0x2455DB720](v12, -1, -1);
  }
  else
  {
  }
  os_log_type_t v23 = *(void **)&v8[OBJC_IVAR____TtC7SiriGeo27INStopShareETAIntentHandler_sharedTripContact];
  if (v23 && (self, (uint64_t v24 = swift_dynamicCastObjCClass()) != 0))
  {
    uint64_t v25 = (void *)v24;
    id v26 = v23;
    os_log_type_t v27 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v9, v27))
    {
      uint64_t v57 = a3;
      id v59 = v8;
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      uint64_t v52 = swift_slowAlloc();
      uint64_t aBlock = v52;
      *(_DWORD *)uint64_t v28 = 136315138;
      buf = v28;
      id v54 = v10;
      id v29 = v26;
      id v30 = objc_msgSend(v25, sel_description);
      uint64_t v31 = v25;
      id v32 = v26;
      uint64_t v33 = a4;
      id v34 = v30;
      uint64_t v35 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v37 = v36;

      a4 = v33;
      id v26 = v32;
      uint64_t v25 = v31;
      uint64_t v38 = v35;
      a3 = v57;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v38, v37, &aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      id v10 = v54;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23FE9C000, v9, v27, "handle stop sharing ETA to recipient: %s", buf, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2455DB720](v52, -1, -1);
      unint64_t v8 = v59;
      MEMORY[0x2455DB720](buf, -1, -1);
    }
    else
    {
    }
    os_log_type_t v47 = (void *)swift_allocObject();
    v47[2] = v8;
    v47[3] = a3;
    v47[4] = a4;
    v47[5] = a5;
    uint64_t v64 = (void (*)(uint64_t))partial apply for closure #1 in closure #1 in INStopShareETAIntentHandler.handleStopShareETA(intent:completion:);
    uint64_t v65 = v47;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v61 = 1107296256;
    uint64_t v62 = thunk for @escaping @callee_guaranteed (@guaranteed Error?) -> ();
    uint64_t v63 = &block_descriptor_71;
    unint64_t v48 = _Block_copy(&aBlock);
    uint64_t v49 = v8;
    swift_retain();
    id v50 = a5;
    swift_release();
    objc_msgSend(v10, sel_stopSharingWithContact_completion_, v25, v48);
    _Block_release(v48);
  }
  else
  {
    os_log_type_t v39 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v9, v39))
    {
      long long v40 = (uint8_t *)swift_slowAlloc();
      os_log_type_t v41 = v9;
      id v42 = v40;
      *(_WORD *)long long v40 = 0;
      _os_log_impl(&dword_23FE9C000, v41, v39, "handle stop sharing ETA to all recipients", v40, 2u);
      MEMORY[0x2455DB720](v42, -1, -1);
    }
    uint64_t v43 = (void *)swift_allocObject();
    v43[2] = v8;
    v43[3] = a3;
    v43[4] = a4;
    v43[5] = a5;
    uint64_t v64 = partial apply for closure #2 in closure #1 in INStopShareETAIntentHandler.handleStopShareETA(intent:completion:);
    uint64_t v65 = v43;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v61 = 1107296256;
    uint64_t v62 = thunk for @escaping @callee_guaranteed (@guaranteed Error?) -> ();
    uint64_t v63 = &block_descriptor_65;
    id v44 = _Block_copy(&aBlock);
    uint64_t v45 = v8;
    swift_retain();
    id v46 = a5;
    swift_release();
    objc_msgSend(v10, sel_stopAllSharingWithCompletion_, v44);
    _Block_release(v44);
  }
}

void closure #1 in closure #1 in INStopShareETAIntentHandler.handleStopShareETA(intent:completion:)(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t a4, void *a5)
{
  if (a1)
  {
    os_log_t log = (os_log_t)_convertErrorToNSError(_:)();
    INStopShareETAIntentHandler.stopShareETAErrorHandling(_:completion:)(log, a3);
  }
  else
  {
    id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F10000]), sel_initWithCode_userActivity_, 3, 0);
    type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for INPerson);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    objc_msgSend(v8, sel_setRecipients_, isa);

    id v10 = objc_msgSend(a5, sel_recipients);
    objc_msgSend(v8, sel_setRecipients_, v10);

    os_log_type_t v11 = *(NSObject **)(a2 + OBJC_IVAR____TtC7SiriGeo27INStopShareETAIntentHandler_logObject);
    id v12 = v8;
    os_log_type_t v13 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v11, v13))
    {
      loga = v11;
      id v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      uint64_t v23 = v20;
      *(_DWORD *)id v14 = 136315138;
      id v15 = v12;
      id v16 = objc_msgSend(v15, sel_description);
      uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v19 = v18;

      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v17, v19, &v23);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23FE9C000, loga, v13, "INStopShareETAIntentHandler Sending response : %s", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2455DB720](v20, -1, -1);
      MEMORY[0x2455DB720](v14, -1, -1);
    }
    else
    {
    }
    ((void (*)(id))a3)(v12);
  }
}

void INStopShareETAIntentHandler.stopShareETAErrorHandling(_:completion:)(void *a1, void (*a2)(void))
{
  uint64_t v4 = (char *)objc_msgSend(a1, sel_code);
  static os_log_type_t.error.getter();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_23FEBCB50;
  id v6 = objc_msgSend(a1, sel_localizedDescription);
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;

  *(void *)(v5 + 56) = MEMORY[0x263F8D310];
  *(void *)(v5 + 64) = lazy protocol witness table accessor for type String and conformance String();
  *(void *)(v5 + 32) = v7;
  *(void *)(v5 + 40) = v9;
  os_log(_:dso:log:_:_:)();
  swift_bridgeObjectRelease();
  if ((unint64_t)(v4 - 5) > 9) {
    uint64_t v10 = 4;
  }
  else {
    uint64_t v10 = qword_23FEBD080[(void)(v4 - 5)];
  }
  id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F10000]), sel_initWithCode_userActivity_, v10, 0);
  a2();
}

id INStopShareETAIntentHandler.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id INStopShareETAIntentHandler.init()()
{
  uint64_t v1 = OBJC_IVAR____TtC7SiriGeo27INStopShareETAIntentHandler_logObject;
  type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for OS_os_log);
  uint64_t v2 = v0;
  *(void *)&v0[v1] = OS_os_log.init(subsystem:category:)();
  uint64_t v3 = OBJC_IVAR____TtC7SiriGeo27INStopShareETAIntentHandler_contactService;
  type metadata accessor for ContactService();
  swift_allocObject();
  *(void *)&v2[v3] = ContactService.init()();
  *(void *)&v2[OBJC_IVAR____TtC7SiriGeo27INStopShareETAIntentHandler_sharedTripContact] = 0;

  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for INStopShareETAIntentHandler();
  return objc_msgSendSuper2(&v5, sel_init);
}

id INStopShareETAIntentHandler.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for INStopShareETAIntentHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
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

uint64_t partial apply for closure #1 in INStopShareETAIntentHandler.confirm(intent:completion:)(void *a1)
{
  return closure #1 in INStopShareETAIntentHandler.confirm(intent:completion:)(a1, *(void *)(v1 + 16), *(void **)(v1 + 24), *(uint64_t (**)(id))(v1 + 32));
}

void partial apply for closure #1 in INStopShareETAIntentHandler.handleStopShareETA(intent:completion:)(void *a1)
{
  closure #1 in INStopShareETAIntentHandler.handleStopShareETA(intent:completion:)(a1, *(char **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void **)(v1 + 40));
}

uint64_t type metadata accessor for INStopShareETAIntentHandler()
{
  return self;
}

void specialized INStopShareETAIntentHandler.resolveRecipients(for:with:)(void *a1, char *a2, void (**a3)(void, void))
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a3;
  uint64_t v7 = self;
  _Block_copy(a3);
  id v8 = objc_msgSend(v7, sel_sharedInstance);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = (void *)swift_allocObject();
    v10[2] = a2;
    v10[3] = a1;
    v10[4] = partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSArray) -> ();
    v10[5] = v6;
    aBlock[4] = partial apply for closure #1 in INStopShareETAIntentHandler.resolveRecipients(for:with:);
    aBlock[5] = v10;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed MSPSharedTripService) -> ();
    aBlock[3] = &block_descriptor_59;
    id v11 = _Block_copy(aBlock);
    id v12 = a2;
    id v13 = a1;
    swift_retain();
    swift_release();
    objc_msgSend(v9, sel_performBlockAfterInitialSync_, v11);
    _Block_release(v11);
    swift_release();
  }
  else
  {
    id v14 = *(NSObject **)&a2[OBJC_IVAR____TtC7SiriGeo27INStopShareETAIntentHandler_logObject];
    os_log_type_t v15 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v14, v15))
    {
      id v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v16 = 0;
      _os_log_impl(&dword_23FE9C000, v14, v15, "could not get msp shared instance to check if the there is a match with receivers", v16, 2u);
      MEMORY[0x2455DB720](v16, -1, -1);
    }
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
    uint64_t v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_23FEBCBC0;
    *(void *)(v17 + 32) = objc_msgSend(self, sel_unsupportedForReason_, 5);
    aBlock[0] = v17;
    specialized Array._endMutation()();
    type metadata accessor for OS_os_log(0, (unint64_t *)&lazy cache variable for type metadata for INStopShareETARecipientResolutionResult);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    ((void (**)(void, Class))a3)[2](a3, isa);
    swift_release();
    swift_bridgeObjectRelease();
  }
}

void specialized INStopShareETAIntentHandler.confirm(intent:completion:)(char *a1, void (**a2)(void, void))
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a2;
  objc_super v5 = *(NSObject **)&a1[OBJC_IVAR____TtC7SiriGeo27INStopShareETAIntentHandler_logObject];
  _Block_copy(a2);
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_23FE9C000, v5, v6, "stop sharing ETA - confirm", v7, 2u);
    MEMORY[0x2455DB720](v7, -1, -1);
  }
  id v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F10000]), sel_initWithCode_userActivity_, 1, 0);
  id v8 = objc_msgSend(self, sel_sharedInstance);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = (void *)swift_allocObject();
    v10[2] = a1;
    v10[3] = v16;
    v10[4] = thunk for @escaping @callee_unowned @convention(block) (@unowned INShareETAIntentResponse) -> ()partial apply;
    v10[5] = v4;
    aBlock[4] = closure #1 in INStopShareETAIntentHandler.confirm(intent:completion:)partial apply;
    aBlock[5] = v10;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed MSPSharedTripService) -> ();
    aBlock[3] = &block_descriptor_49_0;
    id v11 = _Block_copy(aBlock);
    id v12 = a1;
    id v13 = v16;
    swift_retain();
    swift_release();
    objc_msgSend(v9, sel_performBlockAfterInitialSync_, v11);
    _Block_release(v11);
    swift_release();
  }
  else
  {
    os_log_type_t v14 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v5, v14))
    {
      os_log_type_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v15 = 0;
      _os_log_impl(&dword_23FE9C000, v5, v14, "failed to retrieve shared instance", v15, 2u);
      MEMORY[0x2455DB720](v15, -1, -1);
    }
    ((void (**)(void, id))a2)[2](a2, v16);
    swift_release();
  }
}

uint64_t specialized INStopShareETAIntentHandler.convertSharedTripToRecipients(_:)(unint64_t a1)
{
  uint64_t v15 = MEMORY[0x263F8EE78];
  if (!(a1 >> 62))
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v2) {
      goto LABEL_3;
    }
LABEL_16:
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain();
  uint64_t result = _CocoaArrayWrapper.endIndex.getter();
  uint64_t v2 = result;
  if (!result) {
    goto LABEL_16;
  }
LABEL_3:
  if (v2 < 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = 0;
    do
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v5 = (id)MEMORY[0x2455DB020](v4, a1);
      }
      else {
        id v5 = *(id *)(a1 + 8 * v4 + 32);
      }
      os_log_type_t v6 = v5;
      id v7 = objc_msgSend(v5, sel_displayName);
      uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v10 = v9;

      if (objc_msgSend(v6, sel_isPhoneNumber)) {
        uint64_t v11 = 2;
      }
      else {
        uint64_t v11 = 1;
      }
      id v12 = objc_allocWithZone(MEMORY[0x263F0FD20]);
      id v13 = (void *)MEMORY[0x2455DADE0](v8, v10);
      swift_bridgeObjectRelease();
      id v14 = objc_msgSend(v12, sel_initWithValue_type_, v13, v11);

      objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FD18]), sel_initWithPersonHandle_nameComponents_displayName_image_contactIdentifier_customIdentifier_, v14, 0, 0, 0, 0, 0);
      MEMORY[0x2455DAE70]();
      if (*(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      }
      ++v4;
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();
    }
    while (v2 != v4);
    swift_bridgeObjectRelease();
    return v15;
  }
  return result;
}

uint64_t specialized INStopShareETAIntentHandler.handle(intent:completion:)(void *a1, void *a2, void (**a3)(void, void))
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a3;
  id v7 = (void *)swift_allocObject();
  v7[2] = a2;
  v7[3] = partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned INDeleteParkingLocationIntentResponse) -> ();
  v7[4] = v6;
  uint64_t v8 = self;
  id v9 = a2;
  swift_retain_n();
  uint64_t v10 = (char *)v9;
  _Block_copy(a3);
  id v11 = objc_msgSend(v8, sel_sharedInstance);
  if (v11)
  {
    id v12 = v11;
    id v13 = (void *)swift_allocObject();
    v13[2] = v10;
    v13[3] = partial apply for closure #1 in INStopShareETAIntentHandler.handle(intent:completion:);
    v13[4] = v7;
    v13[5] = a1;
    v20[4] = closure #1 in INStopShareETAIntentHandler.handleStopShareETA(intent:completion:)partial apply;
    v20[5] = v13;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 1107296256;
    id v20[2] = thunk for @escaping @callee_guaranteed (@guaranteed MSPSharedTripService) -> ();
    v20[3] = &block_descriptor_38;
    id v14 = _Block_copy(v20);
    uint64_t v15 = v10;
    swift_retain();
    id v16 = a1;
    swift_release();
    objc_msgSend(v12, sel_performBlockAfterInitialSync_, v14);
    _Block_release(v14);

    swift_release();
  }
  else
  {
    static os_log_type_t.error.getter();
    os_log(_:dso:log:_:_:)();
    id v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F10000]), sel_initWithCode_userActivity_, 4, 0);
    unint64_t v18 = *(void **)&v10[OBJC_IVAR____TtC7SiriGeo27INStopShareETAIntentHandler_sharedTripContact];
    *(void *)&v10[OBJC_IVAR____TtC7SiriGeo27INStopShareETAIntentHandler_sharedTripContact] = 0;

    ((void (**)(void, id))a3)[2](a3, v17);
    swift_release();
  }
  return swift_release_n();
}

uint64_t sub_23FEB3670()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t partial apply for closure #1 in INStopShareETAIntentHandler.handle(intent:completion:)(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v4 = *(uint64_t (**)(uint64_t))(v1 + 24);
  id v5 = *(void **)(v3 + OBJC_IVAR____TtC7SiriGeo27INStopShareETAIntentHandler_sharedTripContact);
  *(void *)(v3 + OBJC_IVAR____TtC7SiriGeo27INStopShareETAIntentHandler_sharedTripContact) = 0;

  return v4(a1);
}

void partial apply for closure #1 in INStopShareETAIntentHandler.resolveRecipients(for:with:)(void *a1)
{
  INStopShareETAIntentHandler.resolveRecipientsInsideBlock(for:sharedTrip:with:)(*(void **)(v1 + 24), a1, *(void (**)(uint64_t))(v1 + 32));
}

void partial apply for closure #2 in closure #1 in INStopShareETAIntentHandler.handleStopShareETA(intent:completion:)(uint64_t a1)
{
  closure #1 in closure #1 in INStopShareETAIntentHandler.handleStopShareETA(intent:completion:)(a1, *(void *)(v1 + 16), *(void (**)(void))(v1 + 24), *(void *)(v1 + 32), *(void **)(v1 + 40));
}

uint64_t objectdestroy_11Tm()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

id INRetrieveParkingLocationIntentHandler.logObject.getter()
{
  return *(id *)(v0 + OBJC_IVAR____TtC7SiriGeo38INRetrieveParkingLocationIntentHandler_logObject);
}

void INRetrieveParkingLocationIntentHandler.handle(intent:completion:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void closure #1 in INRetrieveParkingLocationIntentHandler.handle(intent:completion:)(unint64_t a1, void *a2, char *a3, void (*a4)(void), uint64_t a5)
{
  uint64_t v10 = type metadata accessor for OSSignpostID();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  id v13 = (char *)&v63 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    id v14 = a2;
    os_log_type_t v15 = static os_log_type_t.error.getter();
    id v16 = *(NSObject **)&a3[OBJC_IVAR____TtC7SiriGeo38INRetrieveParkingLocationIntentHandler_logObject];
    os_log_type_t v17 = v15;
    if (os_log_type_enabled(v16, v15))
    {
      id v18 = a2;
      id v19 = a2;
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      uint64_t v73 = (uint64_t)a2;
      aBlock[0] = v21;
      *(_DWORD *)uint64_t v20 = 136315138;
      id v22 = a2;
      __swift_instantiateConcreteTypeFromMangledName(demangling cache variable for type metadata for Error);
      uint64_t v23 = String.init<A>(describing:)();
      uint64_t v73 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v23, v24, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_23FE9C000, v16, v17, "error fetching vehicle events: %s", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2455DB720](v21, -1, -1);
      MEMORY[0x2455DB720](v20, -1, -1);
    }
    id v25 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FE08]), sel_initWithCode_userActivity_, 4, 0);
    a4();

    return;
  }
  static os_signpost_type_t.end.getter();
  id v26 = *(NSObject **)&a3[OBJC_IVAR____TtC7SiriGeo38INRetrieveParkingLocationIntentHandler_logObject];
  static OSSignpostID.exclusive.getter();
  os_signpost(_:dso:log:name:signpostID:_:_:)();
  os_log_type_t v27 = *(void (**)(char *, uint64_t))(v11 + 8);
  v27(v13, v10);
  if (!a1)
  {
    id v48 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FE08]), sel_initWithCode_userActivity_, 4, 0);
    uint64_t v49 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v26, (os_log_type_t)v49))
    {
      id v50 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v50 = 0;
      _os_log_impl(&dword_23FE9C000, v26, (os_log_type_t)v49, "uh oh, no cars", v50, 2u);
      MEMORY[0x2455DB720](v50, -1, -1);
    }
    objc_msgSend(v48, sel_setParkingLocation_, 0);
    id v51 = v48;
    goto LABEL_21;
  }
  uint64_t v72 = v27;
  if (!(a1 >> 62))
  {
    uint64_t v28 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v28) {
      goto LABEL_8;
    }
LABEL_20:
    static os_log_type_t.info.getter();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
    uint64_t v58 = swift_allocObject();
    *(_OWORD *)(v58 + 16) = xmmword_23FEBCB50;
    uint64_t v59 = type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for RTVehicleEvent);
    uint64_t v60 = MEMORY[0x2455DAED0](a1, v59);
    uint64_t v62 = v61;
    swift_bridgeObjectRelease();
    *(void *)(v58 + 56) = MEMORY[0x263F8D310];
    *(void *)(v58 + 64) = lazy protocol witness table accessor for type String and conformance String();
    *(void *)(v58 + 32) = v60;
    *(void *)(v58 + 40) = v62;
    os_log(_:dso:log:_:_:)();
    swift_bridgeObjectRelease();
    id v51 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FE08]), sel_initWithCode_userActivity_, 4, 0);
    id v48 = v51;
LABEL_21:
    ((void (*)(id))a4)(v51);

    return;
  }
  swift_bridgeObjectRetain();
  if (!_CocoaArrayWrapper.endIndex.getter()) {
    goto LABEL_20;
  }
LABEL_8:
  if ((a1 & 0xC000000000000001) != 0)
  {
    id v29 = (id)MEMORY[0x2455DB020](0, a1);
  }
  else
  {
    if (!*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return;
    }
    id v29 = *(id *)(a1 + 32);
  }
  id v30 = v29;
  id v31 = objc_msgSend(v29, sel_location);

  if (!v31) {
    goto LABEL_20;
  }
  objc_msgSend(v31, sel_latitude);
  double v33 = v32;
  id v71 = v31;
  objc_msgSend(v31, sel_longitude);
  id v35 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F00A50]), sel_initWithLatitude_longitude_, v33, v34);
  os_log_type_t v36 = static os_log_type_t.default.getter();
  int v37 = v36;
  BOOL v38 = os_log_type_enabled(v26, v36);
  id v70 = v35;
  if (v38)
  {
    int v69 = v37;
    os_log_type_t v39 = a4;
    long long v40 = (uint8_t *)swift_slowAlloc();
    uint64_t v68 = swift_slowAlloc();
    aBlock[0] = v68;
    os_log_type_t v41 = v40;
    *(_DWORD *)long long v40 = 136315138;
    id v66 = v40 + 12;
    uint64_t v67 = v40;
    a4 = v39;
    uint64_t v65 = v41 + 4;
    id v42 = v35;
    id v43 = objc_msgSend(v42, sel_description);
    uint64_t v44 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v63 = v45;
    uint64_t v64 = v44;

    uint64_t v73 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v64, v63, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    id v46 = v67;
    _os_log_impl(&dword_23FE9C000, v26, (os_log_type_t)v69, "with vehicle location: %s", v67, 0xCu);
    uint64_t v47 = v68;
    swift_arrayDestroy();
    MEMORY[0x2455DB720](v47, -1, -1);
    MEMORY[0x2455DB720](v46, -1, -1);
  }
  else
  {
  }
  static os_signpost_type_t.begin.getter();
  static OSSignpostID.exclusive.getter();
  os_signpost(_:dso:log:name:signpostID:_:_:)();
  v72(v13, v10);
  id v52 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F00A40]), sel_init);
  uint64_t v53 = (void *)swift_allocObject();
  id v54 = v70;
  v53[2] = a3;
  v53[3] = v54;
  v53[4] = a1;
  v53[5] = a4;
  uint64_t v53[6] = a5;
  aBlock[4] = (uint64_t)partial apply for closure #1 in closure #1 in INRetrieveParkingLocationIntentHandler.handle(intent:completion:);
  aBlock[5] = (uint64_t)v53;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)thunk for @escaping @callee_guaranteed (@guaranteed [CLPlacemark]?, @guaranteed Error?) -> ();
  aBlock[3] = (uint64_t)&block_descriptor_11;
  unint64_t v55 = _Block_copy(aBlock);
  id v56 = v54;
  uint64_t v57 = a3;
  swift_retain();
  swift_release();
  objc_msgSend(v52, sel_reverseGeocodeLocation_completionHandler_, v56, v55);
  _Block_release(v55);
}

void closure #1 in closure #1 in INRetrieveParkingLocationIntentHandler.handle(intent:completion:)(unint64_t a1, uint64_t a2, uint64_t a3, void *a4, unint64_t a5, void (*a6)(id), uint64_t a7)
{
  uint64_t v28 = a7;
  id v29 = a6;
  uint64_t v27 = type metadata accessor for OSSignpostID();
  uint64_t v10 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  uint64_t v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FE08]), sel_initWithCode_userActivity_, 3, 0);
  if (!a1) {
    goto LABEL_10;
  }
  if (!(a1 >> 62))
  {
    uint64_t v14 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  swift_bridgeObjectRetain();
  if (!_CocoaArrayWrapper.endIndex.getter())
  {
LABEL_9:
    swift_bridgeObjectRelease();
LABEL_10:
    a1 = static os_log_type_t.info.getter();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
    uint64_t v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_23FEBCB50;
    *(void *)(v17 + 56) = type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for CLLocation);
    *(void *)(v17 + 64) = lazy protocol witness table accessor for type CLLocation and conformance NSObject();
    *(void *)(v17 + 32) = a4;
    id v18 = a4;
    os_log(_:dso:log:_:_:)();
    swift_bridgeObjectRelease();
    id v16 = objc_msgSend(self, sel_placemarkWithLocation_name_postalAddress_, v18, 0, 0);
    goto LABEL_11;
  }
LABEL_4:
  if ((a1 & 0xC000000000000001) != 0) {
    goto LABEL_25;
  }
  if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    for (id i = *(id *)(a1 + 32); ; id i = (id)MEMORY[0x2455DB020](0, a1))
    {
      id v16 = i;
      swift_bridgeObjectRelease();
LABEL_11:
      objc_msgSend(v13, sel_setParkingLocation_, v16);

      if (a5 >> 62)
      {
        swift_bridgeObjectRetain();
        id v19 = (void *)_CocoaArrayWrapper.endIndex.getter();
        if (!v19) {
          goto LABEL_18;
        }
      }
      else
      {
        id v19 = *(void **)((a5 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (!v19) {
          goto LABEL_18;
        }
      }
      if ((a5 & 0xC000000000000001) != 0) {
        break;
      }
      if (*(void *)((a5 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        id v20 = *(id *)(a5 + 32);
        goto LABEL_16;
      }
      __break(1u);
LABEL_25:
      ;
    }
    id v20 = (id)MEMORY[0x2455DB020](0, a5);
LABEL_16:
    uint64_t v21 = v20;
    swift_bridgeObjectRelease();
    id v22 = objc_msgSend(v21, sel_notes);

    if (v22)
    {
      uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v25 = v24;

      id v19 = (void *)MEMORY[0x2455DADE0](v23, v25);
LABEL_18:
      swift_bridgeObjectRelease();
      goto LABEL_20;
    }
    id v19 = 0;
LABEL_20:
    objc_msgSend(v13, sel_setParkingNote_, v19);

    static os_signpost_type_t.end.getter();
    static OSSignpostID.exclusive.getter();
    os_signpost(_:dso:log:name:signpostID:_:_:)();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v27);
    v29(v13);
  }
  else
  {
    __break(1u);
  }
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed [CLPlacemark]?, @guaranteed Error?) -> ()(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a2;
  id v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for CLPlacemark);
    uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  swift_retain();
  id v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

id INRetrieveParkingLocationIntentHandler.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id INRetrieveParkingLocationIntentHandler.init()()
{
  uint64_t v1 = OBJC_IVAR____TtC7SiriGeo38INRetrieveParkingLocationIntentHandler_logObject;
  type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for OS_os_log);
  uint64_t v2 = v0;
  *(void *)&v0[v1] = OS_os_log.init(subsystem:category:)();

  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for INRetrieveParkingLocationIntentHandler();
  return objc_msgSendSuper2(&v4, sel_init);
}

id INRetrieveParkingLocationIntentHandler.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for INRetrieveParkingLocationIntentHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void specialized INRetrieveParkingLocationIntentHandler.handle(intent:completion:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for OSSignpostID();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static os_signpost_type_t.begin.getter();
  static OSSignpostID.exclusive.getter();
  os_signpost(_:dso:log:name:signpostID:_:_:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  if (one-time initialization token for routineManager != -1) {
    swift_once();
  }
  id v9 = (void *)static ParkingLocationService.routineManager;
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = v2;
  v10[3] = a1;
  v10[4] = a2;
  aBlock[4] = partial apply for closure #1 in INRetrieveParkingLocationIntentHandler.handle(intent:completion:);
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed [RTVehicleEvent]?, @guaranteed Error?) -> ();
  aBlock[3] = &block_descriptor_3;
  uint64_t v11 = _Block_copy(aBlock);
  id v12 = v2;
  swift_retain();
  swift_release();
  objc_msgSend(v9, sel_fetchLastVehicleEventsWithHandler_, v11);
  _Block_release(v11);
}

uint64_t type metadata accessor for INRetrieveParkingLocationIntentHandler()
{
  return self;
}

uint64_t sub_23FEB4984()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_23FEB49BC()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

void partial apply for closure #1 in INRetrieveParkingLocationIntentHandler.handle(intent:completion:)(unint64_t a1, void *a2)
{
  closure #1 in INRetrieveParkingLocationIntentHandler.handle(intent:completion:)(a1, a2, *(char **)(v2 + 16), *(void (**)(void))(v2 + 24), *(void *)(v2 + 32));
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

uint64_t sub_23FEB4A20()
{
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

void partial apply for closure #1 in closure #1 in INRetrieveParkingLocationIntentHandler.handle(intent:completion:)(unint64_t a1, uint64_t a2)
{
  closure #1 in closure #1 in INRetrieveParkingLocationIntentHandler.handle(intent:completion:)(a1, a2, *(void *)(v2 + 16), *(void **)(v2 + 24), *(void *)(v2 + 32), *(void (**)(id))(v2 + 40), *(void *)(v2 + 48));
}

unint64_t lazy protocol witness table accessor for type CLLocation and conformance NSObject()
{
  unint64_t result = lazy protocol witness table cache variable for type CLLocation and conformance NSObject;
  if (!lazy protocol witness table cache variable for type CLLocation and conformance NSObject)
  {
    type metadata accessor for OS_os_log(255, &lazy cache variable for type metadata for CLLocation);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CLLocation and conformance NSObject);
  }
  return result;
}

unint64_t Apple_Parsec_Siri_V2alpha_SiriCommandBuilder.OneOf_SiriCommandBuilderParams.description.getter()
{
  uint64_t v1 = v0;
  unint64_t v2 = 0xD000000000000010;
  uint64_t v3 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriCommandBuilder.OneOf_SiriCommandBuilderParams();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v1, v3);
  int v7 = (*(uint64_t (**)(char *, uint64_t))(v4 + 88))(v6, v3);
  if (v7 == *MEMORY[0x263F5CA18])
  {
    unint64_t v2 = 0xD000000000000016;
  }
  else if (v7 == *MEMORY[0x263F5CA00])
  {
    unint64_t v2 = 0x5070614D776F6853;
  }
  else if (v7 != *MEMORY[0x263F5CA08] && v7 != *MEMORY[0x263F5CA10])
  {
    unint64_t v2 = 0x6568744F656D6F73;
  }
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v2;
}

uint64_t Apple_Parsec_Siri_V2alpha_PerResultLayoutDetails.OneOf_Snippet.description.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Apple_Parsec_Siri_V2alpha_PerResultLayoutDetails.OneOf_Snippet();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, v2);
  int v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  if (v6 == *MEMORY[0x263F5CFE8])
  {
    uint64_t v7 = 0x6E536F6E69736163;
  }
  else if (v6 == *MEMORY[0x263F5CFE0])
  {
    uint64_t v7 = 0x696E736863746177;
  }
  else if (v6 == *MEMORY[0x263F5CFF8])
  {
    uint64_t v7 = 0x736D65746970616DLL;
  }
  else if (v6 == *MEMORY[0x263F5CFF0])
  {
    uint64_t v7 = 0x6E5379636167656CLL;
  }
  else
  {
    uint64_t v7 = 0x206E776F6E6B6E75;
  }
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v7;
}

uint64_t one-time initialization function for logger()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, logger);
  __swift_project_value_buffer(v0, (uint64_t)logger);
  type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for OS_os_log);
  OS_os_log.init(subsystem:category:)();
  return Logger.init(_:)();
}

uint64_t logger.unsafeMutableAddressor()
{
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();

  return __swift_project_value_buffer(v0, (uint64_t)logger);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

BOOL static SiriGeoCommandConverter.isCommandTypeSupported(commandType:)(uint64_t a1)
{
  uint64_t v58 = a1;
  uint64_t v1 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriCommandBuilder.OneOf_SiriCommandBuilderParams();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  uint64_t v57 = (char *)&v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  id v54 = (char *)&v45 - v6;
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  unint64_t v55 = (char *)&v45 - v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v45 - v9;
  uint64_t v11 = type metadata accessor for Logger();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v15 = __swift_project_value_buffer(v11, (uint64_t)logger);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v15, v11);
  id v16 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 16);
  v16(v10, v58, v1);
  uint64_t v17 = Logger.logObject.getter();
  int v18 = static os_log_type_t.debug.getter();
  BOOL v19 = os_log_type_enabled(v17, (os_log_type_t)v18);
  id v56 = v16;
  if (v19)
  {
    uint64_t v52 = v12;
    int v47 = v18;
    id v50 = v14;
    os_log_t v48 = v17;
    id v20 = (uint8_t *)swift_slowAlloc();
    uint64_t v46 = swift_slowAlloc();
    uint64_t v60 = v46;
    uint64_t v21 = v20;
    *(_DWORD *)id v20 = 136315138;
    id v22 = v55;
    id v51 = v10;
    v16(v55, (uint64_t)v10, v1);
    uint64_t v23 = v54;
    v16(v54, (uint64_t)v22, v1);
    int v24 = (*(uint64_t (**)(char *, uint64_t))(v2 + 88))(v23, v1);
    int v25 = *MEMORY[0x263F5CA18];
    uint64_t v26 = v1;
    uint64_t v53 = v11;
    int v49 = v25;
    if (v24 == v25)
    {
      unint64_t v45 = 0xD000000000000016;
      unint64_t v27 = 0x800000023FEBE120;
    }
    else if (v24 == *MEMORY[0x263F5CA00])
    {
      unint64_t v27 = 0xED000073746E696FLL;
      unint64_t v45 = 0x5070614D776F6853;
    }
    else if (v24 == *MEMORY[0x263F5CA08])
    {
      unint64_t v27 = 0x800000023FEBE160;
      unint64_t v45 = 0xD000000000000010;
    }
    else
    {
      BOOL v32 = v24 == *MEMORY[0x263F5CA10];
      unint64_t v33 = 0xD000000000000010;
      if (v24 != *MEMORY[0x263F5CA10]) {
        unint64_t v33 = 0x6568744F656D6F73;
      }
      unint64_t v45 = v33;
      if (v32) {
        unint64_t v27 = 0x800000023FEBE140;
      }
      else {
        unint64_t v27 = 0xE900000000000072;
      }
    }
    double v34 = v21;
    id v35 = *(void (**)(char *, uint64_t))(v2 + 8);
    v35(v23, v26);
    v35(v55, v26);
    uint64_t v59 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v45, v27, &v60);
    id v29 = v35;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v35(v51, v26);
    os_log_t v36 = v48;
    _os_log_impl(&dword_23FE9C000, v48, (os_log_type_t)v47, "commandtype %s", v34, 0xCu);
    uint64_t v37 = v46;
    swift_arrayDestroy();
    MEMORY[0x2455DB720](v37, -1, -1);
    MEMORY[0x2455DB720](v34, -1, -1);

    (*(void (**)(char *, uint64_t))(v52 + 8))(v50, v53);
    int v30 = v49;
    id v31 = (_DWORD *)MEMORY[0x263F5CA10];
  }
  else
  {
    uint64_t v28 = v10;
    id v29 = *(void (**)(char *, uint64_t))(v2 + 8);
    v29(v28, v1);

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    int v30 = *MEMORY[0x263F5CA18];
    id v31 = (_DWORD *)MEMORY[0x263F5CA10];
    uint64_t v26 = v1;
  }
  BOOL v38 = v57;
  v56(v57, v58, v26);
  int v39 = (*(uint64_t (**)(char *, uint64_t))(v2 + 88))(v38, v26);
  BOOL v43 = v39 == v30 || v39 == *MEMORY[0x263F5CA00] || v39 == *MEMORY[0x263F5CA08] || v39 == *v31;
  v29(v38, v26);
  return v43;
}

BOOL static SiriGeoCommandConverter.isSnippetTypeSupported(snippetType:)(uint64_t a1)
{
  uint64_t v51 = a1;
  uint64_t v1 = type metadata accessor for Apple_Parsec_Siri_V2alpha_PerResultLayoutDetails.OneOf_Snippet();
  uint64_t v2 = *(void **)(v1 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  uint64_t v5 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v3);
  os_log_t v48 = (char *)&v38 - v7;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  int v47 = (char *)&v38 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v38 - v10;
  uint64_t v12 = type metadata accessor for Logger();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v16 = __swift_project_value_buffer(v12, (uint64_t)logger);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v16, v12);
  uint64_t v17 = (void (*)(char *, uint64_t, uint64_t))v2[2];
  v17(v11, v51, v1);
  int v18 = Logger.logObject.getter();
  int v46 = static os_log_type_t.debug.getter();
  BOOL v19 = os_log_type_enabled(v18, (os_log_type_t)v46);
  int v49 = v17;
  uint64_t v50 = v12;
  if (v19)
  {
    id v42 = v15;
    os_log_t v43 = v18;
    uint64_t v44 = v13;
    id v20 = (uint8_t *)swift_slowAlloc();
    uint64_t v39 = swift_slowAlloc();
    uint64_t v53 = v39;
    long long v40 = v20;
    *(_DWORD *)id v20 = 136315138;
    uint64_t v21 = v47;
    id v22 = v11;
    v17(v47, (uint64_t)v11, v1);
    uint64_t v23 = v48;
    v17(v48, (uint64_t)v21, v1);
    int v24 = (uint64_t (*)(char *, uint64_t))v2[11];
    uint64_t v41 = v1;
    int v25 = v24(v23, v1);
    int v26 = *MEMORY[0x263F5CFE8];
    unint64_t v45 = v5;
    if (v25 == v26)
    {
      uint64_t v38 = 0x6E536F6E69736163;
      unint64_t v27 = v22;
      unint64_t v28 = 0xED00007465707069;
    }
    else
    {
      if (v25 == *MEMORY[0x263F5CFE0])
      {
        unint64_t v28 = 0xEC00000074657070;
        uint64_t v38 = 0x696E736863746177;
      }
      else if (v25 == *MEMORY[0x263F5CFF8])
      {
        unint64_t v28 = 0xEE0074657070696ELL;
        uint64_t v38 = 0x736D65746970616DLL;
      }
      else
      {
        BOOL v31 = v25 == *MEMORY[0x263F5CFF0];
        uint64_t v32 = 0x206E776F6E6B6E75;
        if (v25 == *MEMORY[0x263F5CFF0]) {
          uint64_t v32 = 0x6E5379636167656CLL;
        }
        uint64_t v38 = v32;
        unint64_t v28 = 0xED00007465707069;
        if (!v31) {
          unint64_t v28 = 0xEC00000065707974;
        }
      }
      unint64_t v27 = v22;
    }
    unint64_t v33 = v40;
    uint64_t v30 = v41;
    id v29 = (void (*)(char *, uint64_t))v2[1];
    v29(v48, v41);
    v29(v47, v30);
    uint64_t v52 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v38, v28, &v53);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v29(v27, v30);
    os_log_t v34 = v43;
    _os_log_impl(&dword_23FE9C000, v43, (os_log_type_t)v46, "snippettype %s", v33, 0xCu);
    uint64_t v35 = v39;
    swift_arrayDestroy();
    MEMORY[0x2455DB720](v35, -1, -1);
    MEMORY[0x2455DB720](v33, -1, -1);

    (*(void (**)(char *, uint64_t))(v44 + 8))(v42, v50);
    uint64_t v5 = v45;
  }
  else
  {
    id v29 = (void (*)(char *, uint64_t))v2[1];
    v29(v11, v1);

    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v50);
    uint64_t v30 = v1;
  }
  v49(v5, v51, v30);
  BOOL v36 = ((unsigned int (*)(char *, uint64_t))v2[11])(v5, v30) == *MEMORY[0x263F5CFF8];
  v29(v5, v30);
  return v36;
}

uint64_t static SiriGeoCommandConverter.convertToSiriCommand(command:)()
{
  uint64_t v0 = type metadata accessor for Apple_Parsec_Siri_V2alpha_RecordLocationActivityBuilderParams();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v47 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for Apple_Parsec_Siri_V2alpha_ShowPlaceDetailsBuilderParams();
  uint64_t v48 = *(void *)(v4 - 8);
  uint64_t v49 = v4;
  MEMORY[0x270FA5388](v4);
  int v47 = (char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for Apple_Parsec_Siri_V2alpha_ShowMapPointsBuilderParams();
  uint64_t v50 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_SiriCommandBuilder.OneOf_SiriCommandBuilderParams?);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v12 = (char *)&v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v47 - v13;
  Apple_Parsec_Siri_V2alpha_SiriCommandBuilder.siriCommandBuilderParams.getter();
  uint64_t v15 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriCommandBuilder.OneOf_SiriCommandBuilderParams();
  uint64_t v16 = *(void *)(v15 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1) {
    goto LABEL_2;
  }
  outlined init with copy of Apple_Parsec_Siri_V2alpha_SiriCommandBuilder.OneOf_SiriCommandBuilderParams?((uint64_t)v14, (uint64_t)v12);
  int v18 = (*(uint64_t (**)(char *, uint64_t))(v16 + 88))(v12, v15);
  if (v18 == *MEMORY[0x263F5CA18])
  {
    (*(void (**)(char *, uint64_t))(v16 + 96))(v12, v15);
    (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v3, v12, v0);
    unint64_t v17 = specialized static SiriGeoCommandConverter.convertRecordLocationActivity(_:)();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }
  else if (v18 == *MEMORY[0x263F5CA00])
  {
    (*(void (**)(char *, uint64_t))(v16 + 96))(v12, v15);
    uint64_t v19 = v50;
    (*(void (**)(char *, char *, uint64_t))(v50 + 32))(v8, v12, v6);
    unint64_t v17 = specialized static SiriGeoCommandConverter.convertShowMapPoints(_:)((uint64_t)v8);
    (*(void (**)(char *, uint64_t))(v19 + 8))(v8, v6);
  }
  else if (v18 == *MEMORY[0x263F5CA08])
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v12, v15);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
    uint64_t v20 = swift_allocObject();
    *(_OWORD *)(v20 + 16) = xmmword_23FEBCBC0;
    *(void *)(v20 + 32) = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64F60]), sel_init);
    unint64_t v52 = v20;
    specialized Array._endMutation()();
    unint64_t v17 = v52;
  }
  else
  {
    if (v18 != *MEMORY[0x263F5CA10])
    {
      (*(void (**)(char *, uint64_t))(v16 + 8))(v12, v15);
LABEL_2:
      unint64_t v17 = MEMORY[0x263F8EE78];
      goto LABEL_11;
    }
    (*(void (**)(char *, uint64_t))(v16 + 96))(v12, v15);
    id v22 = v47;
    uint64_t v21 = v48;
    uint64_t v23 = v49;
    (*(void (**)(char *, char *, uint64_t))(v48 + 32))(v47, v12, v49);
    id v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64AB8]), sel_init);
    objc_msgSend(v24, sel_setItemIndex_, Apple_Parsec_Siri_V2alpha_ShowPlaceDetailsBuilderParams.itemIndex.getter());
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
    uint64_t v25 = swift_allocObject();
    *(_OWORD *)(v25 + 16) = xmmword_23FEBCBC0;
    *(void *)(v25 + 32) = v24;
    unint64_t v52 = v25;
    specialized Array._endMutation()();
    unint64_t v17 = v52;
    (*(void (**)(char *, uint64_t))(v21 + 8))(v22, v23);
  }
LABEL_11:
  outlined destroy of Apple_Parsec_Siri_V2alpha_SiriCommandBuilder.OneOf_SiriCommandBuilderParams?((uint64_t)v14);
  uint64_t v26 = Apple_Parsec_Siri_V2alpha_SiriCommandBuilder.uniqueID.getter();
  unint64_t v28 = v27;
  swift_bridgeObjectRelease();
  uint64_t v29 = HIBYTE(v28) & 0xF;
  if ((v28 & 0x2000000000000000) == 0) {
    uint64_t v29 = v26 & 0xFFFFFFFFFFFFLL;
  }
  if (!v29) {
    goto LABEL_25;
  }
  if (v17 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = _CocoaArrayWrapper.endIndex.getter();
    uint64_t v30 = result;
    if (result) {
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v30 = *(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v30)
    {
LABEL_16:
      if (v30 < 1)
      {
        __break(1u);
        return result;
      }
      uint64_t v32 = 0;
      do
      {
        if ((v17 & 0xC000000000000001) != 0) {
          id v33 = (id)MEMORY[0x2455DB020](v32, v17);
        }
        else {
          id v33 = *(id *)(v17 + 8 * v32 + 32);
        }
        os_log_t v34 = v33;
        ++v32;
        uint64_t v35 = Apple_Parsec_Siri_V2alpha_SiriCommandBuilder.uniqueID.getter();
        BOOL v36 = (void *)MEMORY[0x2455DADE0](v35);
        swift_bridgeObjectRelease();
        objc_msgSend(v34, sel_setAceId_, v36);
      }
      while (v30 != v32);
    }
  }
  swift_bridgeObjectRelease();
LABEL_25:
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v37 = type metadata accessor for Logger();
  __swift_project_value_buffer(v37, (uint64_t)logger);
  swift_bridgeObjectRetain_n();
  uint64_t v38 = Logger.logObject.getter();
  os_log_type_t v39 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v38, v39))
  {
    long long v40 = (uint8_t *)swift_slowAlloc();
    uint64_t v41 = swift_slowAlloc();
    unint64_t v52 = v41;
    *(_DWORD *)long long v40 = 136315138;
    uint64_t v42 = type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for SABaseClientBoundCommand);
    uint64_t v43 = swift_bridgeObjectRetain();
    uint64_t v44 = MEMORY[0x2455DAEA0](v43, v42);
    unint64_t v46 = v45;
    swift_bridgeObjectRelease();
    uint64_t v51 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v44, v46, (uint64_t *)&v52);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23FE9C000, v38, v39, "Converted Commands %s", v40, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2455DB720](v41, -1, -1);
    MEMORY[0x2455DB720](v40, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return v17;
}

id static SiriGeoCommandConverter.convertToSiriSnippet(snippet:)(uint64_t a1)
{
  uint64_t v60 = type metadata accessor for Apple_Parsec_Siri_V2alpha_MapItemBuilderParams();
  uint64_t v58 = *(void *)(v60 - 8);
  MEMORY[0x270FA5388](v60);
  uint64_t v3 = (char *)v49 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for Apple_Parsec_Siri_V2alpha_LocationBuilderParams();
  uint64_t v54 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for Apple_Parsec_Siri_V2alpha_PerResultLayoutDetails.OneOf_Snippet();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for Apple_Parsec_Siri_V2alpha_MapItemSnippet();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, v7);
  if ((*(unsigned int (**)(char *, uint64_t))(v8 + 88))(v10, v7) == *MEMORY[0x263F5CFF8])
  {
    uint64_t v59 = v4;
    (*(void (**)(char *, uint64_t))(v8 + 96))(v10, v7);
    uint64_t v52 = v12;
    uint64_t v53 = v11;
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v10, v11);
    id v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64A98]), sel_init);
    uint64_t v16 = Apple_Parsec_Siri_V2alpha_MapItemSnippet.objects.getter();
    uint64_t v17 = *(void *)(v16 + 16);
    if (v17)
    {
      id v50 = v15;
      uint64_t v51 = v14;
      id v61 = (id)MEMORY[0x263F8EE78];
      specialized ContiguousArray.reserveCapacity(_:)();
      int v18 = v6;
      uint64_t v20 = v58 + 16;
      uint64_t v19 = *(void *)(v58 + 16);
      unint64_t v21 = (*(unsigned __int8 *)(v58 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v58 + 80);
      v49[1] = v16;
      unint64_t v22 = v16 + v21;
      uint64_t v57 = (void (**)(char *, uint64_t))(v54 + 8);
      uint64_t v58 = v19;
      uint64_t v55 = *(void *)(v20 + 56);
      id v56 = (void (**)(char *, uint64_t))(v20 - 8);
      uint64_t v23 = v60;
      do
      {
        ((void (*)(char *, unint64_t, uint64_t))v58)(v3, v22, v23);
        id v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64A88]), sel_init);
        uint64_t v25 = Apple_Parsec_Siri_V2alpha_MapItemBuilderParams.label.getter();
        uint64_t v26 = (void *)MEMORY[0x2455DADE0](v25);
        swift_bridgeObjectRelease();
        objc_msgSend(v24, sel_setLabel_, v26);

        uint64_t v27 = Apple_Parsec_Siri_V2alpha_MapItemBuilderParams.spokenName.getter();
        unint64_t v28 = (void *)MEMORY[0x2455DADE0](v27);
        swift_bridgeObjectRelease();
        objc_msgSend(v24, sel_setSpokenName_, v28);

        Apple_Parsec_Siri_V2alpha_MapItemBuilderParams.location.getter();
        id v29 = specialized static SiriGeoCommandConverter.makeLocation(_:)();
        (*v57)(v18, v59);
        objc_msgSend(v24, sel_setLocation_, v29);

        uint64_t v30 = Apple_Parsec_Siri_V2alpha_MapItemBuilderParams.placeData.getter();
        unint64_t v32 = v31;
        Class isa = Data._bridgeToObjectiveC()().super.isa;
        unint64_t v34 = v32;
        uint64_t v23 = v60;
        outlined consume of Data._Representation(v30, v34);
        objc_msgSend(v24, sel_setPlaceData2_, isa);

        (*v56)(v3, v23);
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
        specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized ContiguousArray._endMutation()();
        v22 += v55;
        --v17;
      }
      while (v17);
      swift_bridgeObjectRelease();
      id v15 = v50;
      uint64_t v14 = v51;
      uint64_t v6 = v18;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for SALocalSearchMapItem);
    Class v36 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    objc_msgSend(v15, sel_setItems_, v36);

    Apple_Parsec_Siri_V2alpha_MapItemSnippet.searchRegionCenter.getter();
    id v37 = specialized static SiriGeoCommandConverter.makeLocation(_:)();
    (*(void (**)(char *, uint64_t))(v54 + 8))(v6, v59);
    objc_msgSend(v15, sel_setSearchRegionCenter_, v37);

    type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for NSNumber);
    Class v38 = NSNumber.init(BOOLeanLiteral:)(0).super.super.isa;
    objc_msgSend(v15, sel_setUserCurrentLocation_, v38);

    objc_msgSend(v15, sel_setSearchAlongRoute_, 0);
    uint64_t v39 = v53;
    if (one-time initialization token for logger != -1) {
      swift_once();
    }
    uint64_t v40 = type metadata accessor for Logger();
    __swift_project_value_buffer(v40, (uint64_t)logger);
    id v35 = v15;
    uint64_t v41 = Logger.logObject.getter();
    os_log_type_t v42 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = (uint8_t *)swift_slowAlloc();
      uint64_t v44 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v43 = 138412290;
      id v61 = v35;
      unint64_t v45 = v14;
      id v46 = v35;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v44 = v35;

      uint64_t v14 = v45;
      _os_log_impl(&dword_23FE9C000, v41, v42, "Converted Snippet %@", v43, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      int v47 = v44;
      uint64_t v39 = v53;
      MEMORY[0x2455DB720](v47, -1, -1);
      MEMORY[0x2455DB720](v43, -1, -1);
    }
    else
    {
    }
    (*(void (**)(char *, uint64_t))(v52 + 8))(v14, v39);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    return 0;
  }
  return v35;
}

uint64_t outlined destroy of Apple_Parsec_Siri_V2alpha_SiriCommandBuilder.OneOf_SiriCommandBuilderParams?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_SiriCommandBuilder.OneOf_SiriCommandBuilderParams?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t outlined init with copy of Apple_Parsec_Siri_V2alpha_SiriCommandBuilder.OneOf_SiriCommandBuilderParams?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_SiriCommandBuilder.OneOf_SiriCommandBuilderParams?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:)(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t specialized static SiriGeoCommandConverter.makeMapItemType(detailType:)(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Apple_Parsec_Siri_V2alpha_MapItemBuilderParams.DetailType();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  int v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  BOOL v7 = v6 == *MEMORY[0x263F5CF60] || v6 == *MEMORY[0x263F5CF78];
  if (v7
    || v6 == *MEMORY[0x263F5CF68]
    || v6 == *MEMORY[0x263F5CF58]
    || v6 == *MEMORY[0x263F5CF48]
    || v6 == *MEMORY[0x263F5CF50]
    || v6 == *MEMORY[0x263F5CF40]
    || v6 == *MEMORY[0x263F5CF70])
  {
    return static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v8;
}

id specialized static SiriGeoCommandConverter.makeLocation(_:)()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64AD0]), sel_init);
  uint64_t v1 = Apple_Parsec_Siri_V2alpha_LocationBuilderParams.label.getter();
  uint64_t v2 = (void *)MEMORY[0x2455DADE0](v1);
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_setLabel_, v2);

  uint64_t v3 = Apple_Parsec_Siri_V2alpha_LocationBuilderParams.street.getter();
  uint64_t v4 = (void *)MEMORY[0x2455DADE0](v3);
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_setStreet_, v4);

  uint64_t v5 = Apple_Parsec_Siri_V2alpha_LocationBuilderParams.thoroughfare.getter();
  int v6 = (void *)MEMORY[0x2455DADE0](v5);
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_setThoroughfare_, v6);

  uint64_t v7 = Apple_Parsec_Siri_V2alpha_LocationBuilderParams.subThoroughfare.getter();
  uint64_t v8 = (void *)MEMORY[0x2455DADE0](v7);
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_setSubThoroughfare_, v8);

  uint64_t v9 = Apple_Parsec_Siri_V2alpha_LocationBuilderParams.city.getter();
  uint64_t v10 = (void *)MEMORY[0x2455DADE0](v9);
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_setCity_, v10);

  uint64_t v11 = Apple_Parsec_Siri_V2alpha_LocationBuilderParams.stateCode.getter();
  uint64_t v12 = (void *)MEMORY[0x2455DADE0](v11);
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_setStateCode_, v12);

  uint64_t v13 = Apple_Parsec_Siri_V2alpha_LocationBuilderParams.countryCode.getter();
  uint64_t v14 = (void *)MEMORY[0x2455DADE0](v13);
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_setCountryCode_, v14);

  uint64_t v15 = Apple_Parsec_Siri_V2alpha_LocationBuilderParams.postalCode.getter();
  uint64_t v16 = (void *)MEMORY[0x2455DADE0](v15);
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_setPostalCode_, v16);

  Apple_Parsec_Siri_V2alpha_LocationBuilderParams.latitude.getter();
  int v18 = v17;
  id v19 = objc_allocWithZone(NSNumber);
  LODWORD(v20) = v18;
  id v21 = objc_msgSend(v19, sel_initWithFloat_, v20);
  objc_msgSend(v0, sel_setLatitude_, v21);

  Apple_Parsec_Siri_V2alpha_LocationBuilderParams.longitude.getter();
  int v23 = v22;
  id v24 = objc_allocWithZone(NSNumber);
  LODWORD(v25) = v23;
  id v26 = objc_msgSend(v24, sel_initWithFloat_, v25);
  objc_msgSend(v0, sel_setLongitude_, v26);

  objc_msgSend(v0, sel_setRegionType_, *MEMORY[0x263F65AC0]);
  uint64_t v27 = Apple_Parsec_Siri_V2alpha_LocationBuilderParams.timezoneID.getter();
  unint64_t v28 = (void *)MEMORY[0x2455DADE0](v27);
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_setTimezoneId_, v28);

  return v0;
}

uint64_t specialized static SiriGeoCommandConverter.makeDirectionRole(role:)(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Apple_Parsec_Siri_V2alpha_MapItemBuilderParams.Role();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  int v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  if (v6 == *MEMORY[0x263F5CF80] || v6 == *MEMORY[0x263F5CF98]) {
    return static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  int v8 = v6;
  if (v6 == *MEMORY[0x263F5CF90]) {
    return static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  int v11 = *MEMORY[0x263F5CF88];
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (v8 != v11) {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return v9;
}

id specialized static SiriGeoCommandConverter.makeActionableMapItem(_:)()
{
  uint64_t v0 = type metadata accessor for Apple_Parsec_Siri_V2alpha_MapItemBuilderParams.Role();
  uint64_t v42 = *(void *)(v0 - 8);
  uint64_t v43 = v0;
  MEMORY[0x270FA5388](v0);
  uint64_t v41 = (char *)&v40 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = type metadata accessor for Apple_Parsec_Siri_V2alpha_LocationBuilderParams();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for Apple_Parsec_Siri_V2alpha_MapItemBuilderParams.DetailType();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64A58]), sel_init);
  Apple_Parsec_Siri_V2alpha_MapItemBuilderParams.detailType.getter();
  uint64_t v11 = specialized static SiriGeoCommandConverter.makeMapItemType(detailType:)((uint64_t)v9);
  uint64_t v13 = v12;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v14 = (void *)MEMORY[0x2455DADE0](v11, v13);
  swift_bridgeObjectRelease();
  objc_msgSend(v10, sel_setDetailType_, v14);

  id v15 = v10;
  Apple_Parsec_Siri_V2alpha_MapItemBuilderParams.location.getter();
  id v16 = specialized static SiriGeoCommandConverter.makeLocation(_:)();
  int v17 = *(void (**)(char *, uint64_t))(v3 + 8);
  v17(v5, v2);
  objc_msgSend(v15, sel_setLocation_, v16);

  id v18 = v15;
  Apple_Parsec_Siri_V2alpha_MapItemBuilderParams.location.getter();
  uint64_t v19 = Apple_Parsec_Siri_V2alpha_LocationBuilderParams.label.getter();
  uint64_t v21 = v20;
  v17(v5, v2);
  int v22 = (void *)MEMORY[0x2455DADE0](v19, v21);
  swift_bridgeObjectRelease();
  objc_msgSend(v18, sel_setLabel_, v22);

  id v23 = v18;
  Apple_Parsec_Siri_V2alpha_MapItemBuilderParams.location.getter();
  uint64_t v24 = Apple_Parsec_Siri_V2alpha_LocationBuilderParams.label.getter();
  uint64_t v26 = v25;
  v17(v5, v2);
  uint64_t v27 = (void *)MEMORY[0x2455DADE0](v24, v26);
  swift_bridgeObjectRelease();
  objc_msgSend(v23, sel_setSpokenName_, v27);

  id v28 = v23;
  uint64_t v29 = Apple_Parsec_Siri_V2alpha_MapItemBuilderParams.placeData.getter();
  unint64_t v31 = v30;
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  outlined consume of Data._Representation(v29, v31);
  objc_msgSend(v28, sel_setPlaceData2_, isa);

  id v33 = v28;
  uint64_t v34 = (uint64_t)v41;
  Apple_Parsec_Siri_V2alpha_MapItemBuilderParams.directionRole.getter();
  uint64_t v35 = specialized static SiriGeoCommandConverter.makeDirectionRole(role:)(v34);
  uint64_t v37 = v36;
  (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v34, v43);
  Class v38 = (void *)MEMORY[0x2455DADE0](v35, v37);
  swift_bridgeObjectRelease();
  objc_msgSend(v33, sel_setDirectionRole_, v38);

  return v33;
}

uint64_t specialized static SiriGeoCommandConverter.convertShowMapPoints(_:)(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Apple_Parsec_Siri_V2alpha_MapItemBuilderParams();
  uint64_t v21 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Apple_Parsec_Siri_V2alpha_ShowMapPointsBuilderParams();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64AB0]), sel_init);
  uint64_t v10 = Apple_Parsec_Siri_V2alpha_ShowMapPointsBuilderParams.language.getter();
  uint64_t v11 = (void *)MEMORY[0x2455DADE0](v10);
  swift_bridgeObjectRelease();
  objc_msgSend(v9, sel_setLanguage_, v11);

  objc_msgSend(v9, sel_setShowDirections_, Apple_Parsec_Siri_V2alpha_ShowMapPointsBuilderParams.showDirections.getter() & 1);
  objc_msgSend(v9, sel_setShowTraffic_, Apple_Parsec_Siri_V2alpha_ShowMapPointsBuilderParams.showTraffic.getter() & 1);
  char v12 = Apple_Parsec_Siri_V2alpha_ShowMapPointsBuilderParams.hasItemSource.getter();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, v5);
  if (v12)
  {
    uint64_t v13 = v21;
    char v14 = Apple_Parsec_Siri_V2alpha_ShowMapPointsBuilderParams.hasItemDestination.getter();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    if (v14)
    {
      Apple_Parsec_Siri_V2alpha_ShowMapPointsBuilderParams.itemSource.getter();
      id v15 = specialized static SiriGeoCommandConverter.makeActionableMapItem(_:)();
      id v16 = *(void (**)(char *, uint64_t))(v13 + 8);
      v16(v4, v2);
      objc_msgSend(v9, sel_setItemSource_, v15);

      Apple_Parsec_Siri_V2alpha_ShowMapPointsBuilderParams.itemDestination.getter();
      id v17 = specialized static SiriGeoCommandConverter.makeActionableMapItem(_:)();
      v16(v4, v2);
      objc_msgSend(v9, sel_setItemDestination_, v17);

      id v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64A70]), sel_init);
      objc_msgSend(v18, sel_setAvoidTolls_, 0);
      objc_msgSend(v18, sel_setAvoidHighways_, 0);
      objc_msgSend(v9, sel_setCarRouteOptions_, v18);
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_23FEBCBC0;
  *(void *)(v19 + 32) = v9;
  uint64_t v22 = v19;
  specialized Array._endMutation()();
  return v22;
}

uint64_t specialized static SiriGeoCommandConverter.convertRecordLocationActivity(_:)()
{
  uint64_t v0 = type metadata accessor for Apple_Parsec_Siri_V2alpha_RecordLocationActivityBuilderParams.SourceType();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v20 - v5;
  uint64_t v7 = type metadata accessor for Apple_Parsec_Siri_V2alpha_LocationBuilderParams();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64B98]), sel_init);
  Apple_Parsec_Siri_V2alpha_RecordLocationActivityBuilderParams.location.getter();
  id v12 = specialized static SiriGeoCommandConverter.makeLocation(_:)();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  objc_msgSend(v11, sel_setLocation_, v12);

  Apple_Parsec_Siri_V2alpha_RecordLocationActivityBuilderParams.sourceType.getter();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v4, *MEMORY[0x263F5D090], v0);
  lazy protocol witness table accessor for type Apple_Parsec_Siri_V2alpha_RecordLocationActivityBuilderParams.SourceType and conformance Apple_Parsec_Siri_V2alpha_RecordLocationActivityBuilderParams.SourceType();
  dispatch thunk of RawRepresentable.rawValue.getter();
  dispatch thunk of RawRepresentable.rawValue.getter();
  uint64_t v14 = v20;
  uint64_t v13 = v21;
  id v15 = *(void (**)(char *, uint64_t))(v1 + 8);
  v15(v4, v0);
  v15(v6, v0);
  if (v13 == v14) {
    uint64_t v16 = 0x746C7561666544;
  }
  else {
    uint64_t v16 = 0x646F50656D6F48;
  }
  id v17 = (void *)MEMORY[0x2455DADE0](v16, 0xE700000000000000);
  swift_bridgeObjectRelease();
  objc_msgSend(v11, sel_setSourceType_, v17);

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_23FEBCBC0;
  *(void *)(v18 + 32) = v11;
  uint64_t v21 = v18;
  specialized Array._endMutation()();
  return v21;
}

ValueMetadata *type metadata accessor for SiriGeoCommandConverter()
{
  return &type metadata for SiriGeoCommandConverter;
}

unint64_t lazy protocol witness table accessor for type Apple_Parsec_Siri_V2alpha_RecordLocationActivityBuilderParams.SourceType and conformance Apple_Parsec_Siri_V2alpha_RecordLocationActivityBuilderParams.SourceType()
{
  unint64_t result = lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_RecordLocationActivityBuilderParams.SourceType and conformance Apple_Parsec_Siri_V2alpha_RecordLocationActivityBuilderParams.SourceType;
  if (!lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_RecordLocationActivityBuilderParams.SourceType and conformance Apple_Parsec_Siri_V2alpha_RecordLocationActivityBuilderParams.SourceType)
  {
    type metadata accessor for Apple_Parsec_Siri_V2alpha_RecordLocationActivityBuilderParams.SourceType();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_RecordLocationActivityBuilderParams.SourceType and conformance Apple_Parsec_Siri_V2alpha_RecordLocationActivityBuilderParams.SourceType);
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

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed [RTVehicleEvent]?, @guaranteed Error?) -> ()(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for RTVehicleEvent);
    uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  swift_retain();
  id v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

id INSaveParkingLocationIntentHandler.logObject.getter()
{
  return *(id *)(v0 + OBJC_IVAR____TtC7SiriGeo34INSaveParkingLocationIntentHandler_logObject);
}

uint64_t key path getter for INSaveParkingLocationIntentHandler.completion : INSaveParkingLocationIntentHandler@<X0>(void **a1@<X0>, void *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x60))();
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = v4;
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v5;
    *(void *)(result + 24) = v6;
    uint64_t v7 = partial apply for thunk for @escaping @callee_guaranteed (@guaranteed INPlacemarkResolutionResult) -> ();
  }
  else
  {
    uint64_t v7 = 0;
  }
  *a2 = v7;
  a2[1] = result;
  return result;
}

uint64_t key path setter for INSaveParkingLocationIntentHandler.completion : INSaveParkingLocationIntentHandler(uint64_t *a1, void **a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed [EnhancedMSPSharedTripContact]) -> (@out ());
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v7 = *(uint64_t (**)(uint64_t (*)(uint64_t), uint64_t))((*MEMORY[0x263F8EED0] & **a2) + 0x68);
  outlined copy of (@escaping @callee_guaranteed (@guaranteed [EnhancedMSPSharedTripContact]) -> ())?(v3);
  return v7(v6, v5);
}

uint64_t INSaveParkingLocationIntentHandler.completion.getter()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC7SiriGeo34INSaveParkingLocationIntentHandler_completion);
  swift_beginAccess();
  uint64_t v2 = *v1;
  outlined copy of (@escaping @callee_guaranteed (@guaranteed [EnhancedMSPSharedTripContact]) -> ())?(*v1);
  return v2;
}

uint64_t INSaveParkingLocationIntentHandler.completion.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (uint64_t *)(v2 + OBJC_IVAR____TtC7SiriGeo34INSaveParkingLocationIntentHandler_completion);
  swift_beginAccess();
  uint64_t v6 = *v5;
  *uint64_t v5 = a1;
  v5[1] = a2;
  return outlined consume of (@escaping @callee_guaranteed (@guaranteed [EnhancedMSPSharedTripContact]) -> ())?(v6);
}

uint64_t (*INSaveParkingLocationIntentHandler.completion.modify())()
{
  return MapsService.CapabilityFetcherObserver.completion.modify;
}

uint64_t INSaveParkingLocationIntentHandler.resolveParkingLocation(for:)(uint64_t a1)
{
  *(void *)(v2 + 296) = a1;
  *(void *)(v2 + 304) = v1;
  return MEMORY[0x270FA2498](INSaveParkingLocationIntentHandler.resolveParkingLocation(for:), 0, 0);
}

uint64_t INSaveParkingLocationIntentHandler.resolveParkingLocation(for:)()
{
  uint64_t v29 = v0;
  uint64_t v1 = *(NSObject **)(*(void *)(v0 + 304) + OBJC_IVAR____TtC7SiriGeo34INSaveParkingLocationIntentHandler_logObject);
  *(void *)(v0 + 312) = v1;
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_23FE9C000, v1, v2, "IntentHandler resolve parking location", v3, 2u);
    MEMORY[0x2455DB720](v3, -1, -1);
  }
  id v4 = objc_msgSend(*(id *)(v0 + 296), sel_parkingLocation);
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = objc_msgSend(v4, sel_location);

    if (v6)
    {
      id v7 = *(id *)(v0 + 296);
      os_log_type_t v8 = static os_log_type_t.default.getter();
      BOOL v9 = os_log_type_enabled(v1, v8);
      uint64_t v10 = *(void **)(v0 + 296);
      if (v9)
      {
        id v11 = (uint8_t *)swift_slowAlloc();
        uint64_t v27 = swift_slowAlloc();
        uint64_t v28 = v27;
        *(_DWORD *)id v11 = 136315138;
        id v12 = v10;
        id v13 = objc_msgSend(v12, sel_description);
        uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v16 = v15;

        *(void *)(v0 + 208) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v14, v16, &v28);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_23FE9C000, v1, v8, "Intent with parking location from server: %s", v11, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2455DB720](v27, -1, -1);
        MEMORY[0x2455DB720](v11, -1, -1);
      }
      else
      {
      }
      id v24 = objc_msgSend(self, sel_successWithResolvedPlacemark_, v5);

      uint64_t v25 = *(uint64_t (**)(id))(v0 + 8);
      return v25(v24);
    }
  }
  uint64_t v17 = v0 + 272;
  id v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F28538]), sel_init);
  *(void *)(v0 + 320) = v18;
  if (objc_msgSend(self, sel_isSiriLocationServicesPromptingEnabled))
  {
    uint64_t v19 = v0 + 144;
    uint64_t v20 = *(void **)(v0 + 320);
    double v21 = *MEMORY[0x263F00B28];
    *(void *)(v0 + 144) = v0;
    *(void *)(v0 + 184) = v17;
    *(void *)(v0 + 152) = INSaveParkingLocationIntentHandler.resolveParkingLocation(for:);
    uint64_t v22 = swift_continuation_init();
    *(void *)(v0 + 208) = MEMORY[0x263EF8330];
    *(void *)(v0 + 216) = 0x40000000;
    *(void *)(v0 + 224) = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned CLLocation?, @unowned NSError?) -> () with result type CLLocation;
    *(void *)(v0 + 232) = &block_descriptor_1;
    *(void *)(v0 + 240) = v22;
    objc_msgSend(v20, sel_currentLocationWithAccuracy_timeout_completion_, v0 + 208, v21, 5.0);
  }
  else
  {
    uint64_t v19 = v0 + 80;
    *(void *)(v0 + 80) = v0;
    *(void *)(v0 + 120) = v17;
    *(void *)(v0 + 88) = INSaveParkingLocationIntentHandler.resolveParkingLocation(for:);
    uint64_t v23 = swift_continuation_init();
    *(void *)(v0 + 208) = MEMORY[0x263EF8330];
    *(void *)(v0 + 216) = 0x40000000;
    *(void *)(v0 + 224) = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned AFLocationAuthorizationStyle, @unowned CLAccuracyAuthorization, @unowned NSError?) -> () with result type (AFLocationAuthorizationStyle, CLAccuracyAuthorization);
    *(void *)(v0 + 232) = &block_descriptor;
    *(void *)(v0 + 240) = v23;
    objc_msgSend(v18, sel_currentAuthorizationStyle_, v0 + 208);
  }
  return MEMORY[0x270FA23F0](v19);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v4;

  uint64_t v1 = *(void *)(*(void *)v0 + 112);
  *(void *)(*(void *)v0 + 328) = v1;
  if (v1) {
    os_log_type_t v2 = INSaveParkingLocationIntentHandler.resolveParkingLocation(for:);
  }
  else {
    os_log_type_t v2 = INSaveParkingLocationIntentHandler.resolveParkingLocation(for:);
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

{
  void *v0;
  void *v1;
  id v2;
  uint64_t (*v3)(id);
  void *v5;
  double v6;
  uint64_t v7;
  uint64_t v8;

  if ((unint64_t)(v0[34] - 3) >= 2)
  {
    uint64_t v1 = (void *)v0[40];
    goto LABEL_5;
  }
  if (v0[35])
  {
    uint64_t v1 = (void *)v0[40];
    static os_log_type_t.error.getter();
    os_log(_:dso:log:_:_:)();
LABEL_5:
    os_log_type_t v2 = objc_msgSend(self, sel_resolutionResultUnsupportedWithReason_, 1);

    uint64_t v3 = (uint64_t (*)(id))v0[1];
    return v3(v2);
  }
  uint64_t v5 = (void *)v0[40];
  id v6 = *MEMORY[0x263F00B28];
  v0[18] = v0;
  v0[23] = v0 + 34;
  v0[19] = INSaveParkingLocationIntentHandler.resolveParkingLocation(for:);
  id v7 = swift_continuation_init();
  v0[26] = MEMORY[0x263EF8330];
  v0[27] = 0x40000000;
  v0[28] = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned CLLocation?, @unowned NSError?) -> () with result type CLLocation;
  v0[29] = &block_descriptor_1;
  v0[30] = v7;
  objc_msgSend(v5, sel_currentLocationWithAccuracy_timeout_completion_, v0 + 26, v6, 5.0);
  return MEMORY[0x270FA23F0](v0 + 18);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v4;

  uint64_t v1 = *(void *)(*(void *)v0 + 176);
  *(void *)(*(void *)v0 + 336) = v1;
  if (v1) {
    os_log_type_t v2 = INSaveParkingLocationIntentHandler.resolveParkingLocation(for:);
  }
  else {
    os_log_type_t v2 = INSaveParkingLocationIntentHandler.resolveParkingLocation(for:);
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

{
  void *v0;
  void *v1;
  double v2;
  NSObject *v3;
  id v4;
  os_log_type_t v5;
  uint8_t *v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  NSObject *v10;
  uint8_t *v11;
  void *v12;
  id v13;
  uint64_t (*v14)(id);
  id v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;

  uint64_t v1 = (void *)v0[34];
  v0[43] = v1;
  if (v1)
  {
    objc_msgSend(v1, sel_horizontalAccuracy);
    if (v2 < *MEMORY[0x263F00B48])
    {
      uint64_t v3 = v0[39];
      id v4 = v1;
      uint64_t v5 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v3, v5))
      {
        uint64_t v19 = v0[39];
        id v6 = (uint8_t *)swift_slowAlloc();
        id v18 = (void *)swift_slowAlloc();
        *(_DWORD *)id v6 = 138412290;
        v0[26] = v4;
        id v7 = v4;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *id v18 = v1;

        _os_log_impl(&dword_23FE9C000, v19, v5, "resolved location %@", v6, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        swift_arrayDestroy();
        MEMORY[0x2455DB720](v18, -1, -1);
        MEMORY[0x2455DB720](v6, -1, -1);
      }
      else
      {
      }
      unint64_t v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F00A40]), sel_init);
      v0[44] = v16;
      v0[2] = v0;
      v0[7] = v0 + 34;
      v0[3] = INSaveParkingLocationIntentHandler.resolveParkingLocation(for:);
      uint64_t v17 = swift_continuation_init();
      v0[26] = MEMORY[0x263EF8330];
      v0[27] = 0x40000000;
      v0[28] = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned NSArray?, @unowned NSError?) -> () with result type [CLPlacemark];
      v0[29] = &block_descriptor_2;
      v0[30] = v17;
      objc_msgSend(v16, sel_reverseGeocodeLocation_completionHandler_, v4, v0 + 26);
      return MEMORY[0x270FA23F0](v0 + 2);
    }
    id v12 = (void *)v0[40];
    static os_log_type_t.error.getter();
    os_log(_:dso:log:_:_:)();
    id v13 = objc_msgSend(self, sel_resolutionResultUnsupportedWithReason_, 1);
  }
  else
  {
    os_log_type_t v8 = v0[39];
    BOOL v9 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = v0[39];
      id v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v11 = 0;
      _os_log_impl(&dword_23FE9C000, v10, v9, "failed to resolve location", v11, 2u);
      MEMORY[0x2455DB720](v11, -1, -1);
    }
    id v12 = (void *)v0[40];
    id v13 = objc_msgSend(self, sel_resolutionResultUnsupportedWithReason_, 1);
  }

  uint64_t v14 = (uint64_t (*)(id))v0[1];
  return v14(v13);
}

{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v4;

  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 360) = v1;
  if (v1) {
    os_log_type_t v2 = INSaveParkingLocationIntentHandler.resolveParkingLocation(for:);
  }
  else {
    os_log_type_t v2 = INSaveParkingLocationIntentHandler.resolveParkingLocation(for:);
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  id v8;
  id v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  uint64_t (*v16)(id);
  NSObject *log;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  uint64_t v20 = v0;
  uint64_t v1 = *(void **)(v0 + 328);
  swift_willThrow();
  *(void *)(v0 + 272) = v1;
  os_log_type_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(demangling cache variable for type metadata for Error);
  type metadata accessor for related decl 'e' for AFLocationServiceErrorCode(0);
  if (swift_dynamicCast())
  {
    uint64_t v3 = *(void **)(v0 + 320);

    static os_log_type_t.error.getter();
    os_log(_:dso:log:_:_:)();
    id v4 = objc_msgSend(self, sel_resolutionResultUnsupportedWithReason_, 1);
  }
  else
  {
    uint64_t v5 = *(NSObject **)(v0 + 312);

    id v6 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v5, v6))
    {
      id v7 = *(void **)(v0 + 328);
      os_log_t log = *(NSObject **)(v0 + 312);
      os_log_type_t v8 = v7;
      BOOL v9 = v7;
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      id v11 = swift_slowAlloc();
      uint64_t v19 = v11;
      *(_DWORD *)uint64_t v10 = 136315138;
      swift_getErrorValue();
      id v12 = Error.localizedDescription.getter();
      *(void *)(v0 + 208) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v12, v13, &v19);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_23FE9C000, log, v6, "Unexpected error %s", v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2455DB720](v11, -1, -1);
      MEMORY[0x2455DB720](v10, -1, -1);
    }
    unint64_t v15 = *(void **)(v0 + 320);
    uint64_t v14 = *(void **)(v0 + 328);
    id v4 = objc_msgSend(self, sel_resolutionResultUnsupportedWithReason_, 1);
  }
  unint64_t v16 = *(uint64_t (**)(id))(v0 + 8);
  return v16(v4);
}

{
  void *v0;
  void *v1;
  NSObject *v2;
  os_log_type_t v3;
  NSObject *v4;
  uint8_t *v5;
  void *v6;
  id v7;
  uint64_t (*v8)(id);
  uint64_t v10;

  uint64_t v1 = (void *)v0[42];
  swift_willThrow();

  os_log_type_t v2 = v0[39];
  uint64_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    id v4 = v0[39];
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_23FE9C000, v4, v3, "failed to resolve location", v5, 2u);
    MEMORY[0x2455DB720](v5, -1, -1);
  }
  id v6 = (void *)v0[40];
  id v7 = objc_msgSend(self, sel_resolutionResultUnsupportedWithReason_, 1);

  os_log_type_t v8 = (uint64_t (*)(id))v0[1];
  return v8(v7);
}

{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t (*v8)(id);
  uint64_t v10;

  uint64_t v1 = (void *)v0[45];
  swift_willThrow();

  os_log_type_t v2 = (void *)v0[43];
  uint64_t v3 = (void *)v0[44];
  id v4 = (void *)v0[40];
  uint64_t v5 = self;
  id v6 = objc_msgSend(self, sel_placemarkWithLocation_name_postalAddress_, v2, 0, 0);
  id v7 = objc_msgSend(v5, sel_successWithResolvedPlacemark_, v6);

  os_log_type_t v8 = (uint64_t (*)(id))v0[1];
  return v8(v7);
}

void INSaveParkingLocationIntentHandler.resolveParkingLocation(for:)()
{
  unint64_t v1 = v0[34];
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v8) {
      goto LABEL_3;
    }
LABEL_8:
    swift_bridgeObjectRelease();
    id v4 = (void *)v0[43];
    uint64_t v5 = (void *)v0[44];
    id v6 = (void *)v0[40];
    BOOL v9 = self;
    id v3 = objc_msgSend(self, sel_placemarkWithLocation_name_postalAddress_, v4, 0, 0);
    id v7 = objc_msgSend(v9, sel_successWithResolvedPlacemark_, v3);
    goto LABEL_9;
  }
  if (!*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_8;
  }
LABEL_3:
  if ((v1 & 0xC000000000000001) != 0)
  {
    id v2 = (id)MEMORY[0x2455DB020](0, v1);
  }
  else
  {
    if (!*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return;
    }
    id v2 = *(id *)(v1 + 32);
  }
  id v3 = v2;
  id v4 = (void *)v0[43];
  uint64_t v5 = (void *)v0[44];
  id v6 = (void *)v0[40];
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(self, sel_successWithResolvedPlacemark_, v3);
LABEL_9:
  id v10 = v7;

  id v11 = (void (*)(id))v0[1];
  v11(v10);
}

uint64_t @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned AFLocationAuthorizationStyle, @unowned CLAccuracyAuthorization, @unowned NSError?) -> () with result type (AFLocationAuthorizationStyle, CLAccuracyAuthorization)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (a4)
  {
    __swift_instantiateConcreteTypeFromMangledName(demangling cache variable for type metadata for Error);
    uint64_t v6 = swift_allocError();
    *id v7 = a4;
    id v8 = a4;
    return MEMORY[0x270FA2410](v4, v6);
  }
  else
  {
    BOOL v9 = *(void **)(*(void *)(v4 + 64) + 40);
    *BOOL v9 = a2;
    v9[1] = a3;
    return MEMORY[0x270FA2408](v4);
  }
}

uint64_t @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned CLLocation?, @unowned NSError?) -> () with result type CLLocation(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(demangling cache variable for type metadata for Error);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return MEMORY[0x270FA2410](v3, v5);
  }
  else
  {
    if (a2)
    {
      **(void **)(*(void *)(v3 + 64) + 40) = a2;
      id v8 = a2;
      a1 = v3;
    }
    else
    {
      __break(1u);
    }
    return MEMORY[0x270FA2408](a1);
  }
}

uint64_t @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned NSArray?, @unowned NSError?) -> () with result type [CLPlacemark](uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(demangling cache variable for type metadata for Error);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return MEMORY[0x270FA2410](v3, v5);
  }
  else
  {
    type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for CLPlacemark);
    **(void **)(*(void *)(v3 + 64) + 40) = static Array._unconditionallyBridgeFromObjectiveC(_:)();
    return MEMORY[0x270FA2408](v3);
  }
}

uint64_t @objc closure #1 in INSaveParkingLocationIntentHandler.resolveParkingLocation(for:)(void *a1, void *aBlock, void *a3)
{
  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  id v6 = a1;
  id v7 = a3;
  id v8 = (void *)swift_task_alloc();
  v3[5] = v8;
  void *v8 = v3;
  v8[1] = @objc closure #1 in INSaveParkingLocationIntentHandler.resolveParkingLocation(for:);
  v8[37] = v6;
  v8[38] = v7;
  return MEMORY[0x270FA2498](INSaveParkingLocationIntentHandler.resolveParkingLocation(for:), 0, 0);
}

uint64_t @objc closure #1 in INSaveParkingLocationIntentHandler.resolveParkingLocation(for:)(void *a1)
{
  uint64_t v3 = *(void (***)(void, void))(*v1 + 32);
  uint64_t v4 = *(void **)(*v1 + 24);
  uint64_t v5 = *(void **)(*v1 + 16);
  uint64_t v8 = *v1;
  swift_task_dealloc();

  ((void (**)(void, void *))v3)[2](v3, a1);
  _Block_release(v3);

  id v6 = *(uint64_t (**)(void))(v8 + 8);
  return v6();
}

void INSaveParkingLocationIntentHandler.handle(intent:completion:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = type metadata accessor for OSSignpostID();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static os_signpost_type_t.begin.getter();
  static OSSignpostID.exclusive.getter();
  os_signpost(_:dso:log:name:signpostID:_:_:)();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  if (one-time initialization token for routineManager != -1) {
    swift_once();
  }
  id v11 = (void *)static ParkingLocationService.routineManager;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = v3;
  uint64_t v12[3] = a2;
  v12[4] = a3;
  v12[5] = a1;
  aBlock[4] = partial apply for closure #1 in INSaveParkingLocationIntentHandler.handle(intent:completion:);
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed [RTVehicleEvent]?, @guaranteed Error?) -> ();
  aBlock[3] = &block_descriptor_3;
  id v13 = _Block_copy(aBlock);
  id v14 = v3;
  swift_retain();
  id v15 = a1;
  swift_release();
  objc_msgSend(v11, sel_fetchLastVehicleEventsWithHandler_, v13);
  _Block_release(v13);
}

void closure #1 in INSaveParkingLocationIntentHandler.handle(intent:completion:)(uint64_t a1, void *a2, uint64_t a3, void (*a4)(void), uint64_t a5, void *a6)
{
  uint64_t v11 = type metadata accessor for OSSignpostID();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  id v14 = (char *)v69 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    id v15 = a2;
    os_log_type_t v16 = static os_log_type_t.error.getter();
    uint64_t v17 = *(NSObject **)(a3 + OBJC_IVAR____TtC7SiriGeo34INSaveParkingLocationIntentHandler_logObject);
    os_log_type_t v18 = v16;
    if (os_log_type_enabled(v17, v16))
    {
      id v19 = a2;
      id v20 = a2;
      double v21 = (uint8_t *)swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      uint64_t v74 = (uint64_t)a2;
      uint64_t v75 = v22;
      *(_DWORD *)double v21 = 136315138;
      id v23 = a2;
      __swift_instantiateConcreteTypeFromMangledName(demangling cache variable for type metadata for Error);
      uint64_t v24 = String.init<A>(describing:)();
      uint64_t v74 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v24, v25, &v75);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_23FE9C000, v17, v18, "error fetching vehicle event before saving new location: %s", v21, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2455DB720](v22, -1, -1);
      MEMORY[0x2455DB720](v21, -1, -1);
    }
    id v26 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FE38]), sel_initWithCode_userActivity_, 4, 0);
    a4();
  }
  else
  {
    static os_signpost_type_t.end.getter();
    uint64_t v27 = *(NSObject **)(a3 + OBJC_IVAR____TtC7SiriGeo34INSaveParkingLocationIntentHandler_logObject);
    static OSSignpostID.exclusive.getter();
    os_log_t v73 = v27;
    os_signpost(_:dso:log:name:signpostID:_:_:)();
    uint64_t v28 = *(void (**)(char *, uint64_t))(v12 + 8);
    v28(v14, v11);
    id v29 = objc_msgSend(a6, sel_parkingLocation);
    if (v29
      && (uint64_t v30 = v29, v31 = objc_msgSend(v29, sel_location), v30, v31))
    {
      uint64_t v71 = a5;
      uint64_t v72 = a4;
      id v70 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FE38]), sel_initWithCode_userActivity_, 3, 0);
      if (one-time initialization token for routineManager != -1) {
        swift_once();
      }
      objc_msgSend((id)static ParkingLocationService.routineManager, sel_clearAllVehicleEvents);
      os_log_type_t v32 = static os_log_type_t.default.getter();
      id v33 = v73;
      if (os_log_type_enabled(v73, v32))
      {
        uint64_t v34 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v34 = 0;
        _os_log_impl(&dword_23FE9C000, v33, v32, "Deleted all saved parking locations", v34, 2u);
        MEMORY[0x2455DB720](v34, -1, -1);
      }
      static os_signpost_type_t.begin.getter();
      static OSSignpostID.exclusive.getter();
      os_signpost(_:dso:log:name:signpostID:_:_:)();
      v28(v14, v11);
      uint64_t v35 = static ParkingLocationService.routineManager;
      id v36 = v31;
      id v37 = objc_msgSend(a6, sel_parkingNote);
      Class v38 = (void *)v35;
      uint64_t v39 = v73;
      objc_msgSend(v38, sel_vehicleEventAtLocation_notes_, v36, v37);

      static os_signpost_type_t.end.getter();
      static OSSignpostID.exclusive.getter();
      os_signpost(_:dso:log:name:signpostID:_:_:)();
      v28(v14, v11);
      os_log_t v40 = (os_log_t)v36;
      os_log_type_t v41 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v39, v41))
      {
        uint64_t v42 = (uint8_t *)swift_slowAlloc();
        uint64_t v43 = swift_slowAlloc();
        uint64_t v75 = v43;
        *(_DWORD *)uint64_t v42 = 136315138;
        v69[1] = v42 + 4;
        uint64_t v44 = v40;
        id v45 = [v44 description];
        uint64_t v46 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v48 = v47;

        uint64_t v49 = v46;
        uint64_t v39 = v73;
        uint64_t v74 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v49, v48, &v75);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_23FE9C000, v39, v41, "Setting parking location to: %s", v42, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2455DB720](v43, -1, -1);
        MEMORY[0x2455DB720](v42, -1, -1);
      }
      else
      {
      }
      id v54 = objc_msgSend(a6, sel_parkingLocation);
      id v55 = v70;
      objc_msgSend(v70, sel_setParkingLocation_, v54);

      id v56 = objc_msgSend(a6, sel_parkingNote);
      objc_msgSend(v55, sel_setParkingNote_, v56);

      id v57 = v55;
      os_log_type_t v58 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v39, v58))
      {
        uint64_t v59 = swift_slowAlloc();
        os_log_t v73 = v40;
        uint64_t v60 = v39;
        id v61 = (uint8_t *)v59;
        uint64_t v62 = swift_slowAlloc();
        uint64_t v75 = v62;
        *(_DWORD *)id v61 = 136315138;
        id v70 = v61 + 4;
        id v63 = v57;
        id v64 = objc_msgSend(v63, sel_description);
        uint64_t v65 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v67 = v66;

        uint64_t v74 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v65, v67, &v75);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();

        swift_bridgeObjectRelease();
        uint64_t v68 = v60;
        os_log_t v40 = v73;
        _os_log_impl(&dword_23FE9C000, v68, v58, "Sending response : %s", v61, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2455DB720](v62, -1, -1);
        MEMORY[0x2455DB720](v61, -1, -1);
      }
      else
      {
      }
      ((void (*)(id))v72)(v57);
    }
    else
    {
      os_log_type_t v50 = static os_log_type_t.default.getter();
      uint64_t v51 = v73;
      if (os_log_type_enabled(v73, v50))
      {
        uint64_t v52 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v52 = 0;
        _os_log_impl(&dword_23FE9C000, v51, v50, "No location resolved", v52, 2u);
        MEMORY[0x2455DB720](v52, -1, -1);
      }
      id v53 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FE38]), sel_initWithCode_userActivity_, 4, 0);
      a4();
    }
  }
}

id INSaveParkingLocationIntentHandler.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id INSaveParkingLocationIntentHandler.init()()
{
  uint64_t v1 = OBJC_IVAR____TtC7SiriGeo34INSaveParkingLocationIntentHandler_logObject;
  type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for OS_os_log);
  id v2 = v0;
  *(void *)&v0[v1] = OS_os_log.init(subsystem:category:)();
  uint64_t v3 = &v2[OBJC_IVAR____TtC7SiriGeo34INSaveParkingLocationIntentHandler_completion];
  *(void *)uint64_t v3 = 0;
  *((void *)v3 + 1) = 0;

  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for INSaveParkingLocationIntentHandler();
  return objc_msgSendSuper2(&v5, sel_init);
}

id INSaveParkingLocationIntentHandler.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for INSaveParkingLocationIntentHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t _sIeghH_IeAgH_TR(uint64_t a1, uint64_t a2, int *a3)
{
  id v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = _sIeghH_IeAgH_TRTQ0_;
  return v6();
}

uint64_t _sIeAgH_ytIeAgHr_TR(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  objc_super v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *objc_super v5 = v4;
  v5[1] = _sIeghH_IeAgH_TRTQ0_;
  return v7();
}

uint64_t _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  outlined destroy of TaskPriority?(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5TQ0_;
  return v6(a1);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5TQ0_()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_23FEBACD4()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

void partial apply for closure #1 in INSaveParkingLocationIntentHandler.handle(intent:completion:)(uint64_t a1, void *a2)
{
  closure #1 in INSaveParkingLocationIntentHandler.handle(intent:completion:)(a1, a2, *(void *)(v2 + 16), *(void (**)(void))(v2 + 24), *(void *)(v2 + 32), *(void **)(v2 + 40));
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

uint64_t type metadata accessor for INSaveParkingLocationIntentHandler()
{
  return self;
}

uint64_t sub_23FEBAD6C()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_23FEBADA4()
{
  _Block_release(*(const void **)(v0 + 24));

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t partial apply for @objc closure #1 in INSaveParkingLocationIntentHandler.resolveParkingLocation(for:)()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  objc_super v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *objc_super v5 = v1;
  v5[1] = partial apply for @objc closure #1 in INSaveParkingLocationIntentHandler.resolveParkingLocation(for:);
  uint64_t v6 = (uint64_t (*)(void *, void *, void *))((char *)&async function pointer to @objc closure #1 in INSaveParkingLocationIntentHandler.resolveParkingLocation(for:)
                                                      + async function pointer to @objc closure #1 in INSaveParkingLocationIntentHandler.resolveParkingLocation(for:));
  return v6(v2, v3, v4);
}

{
  uint64_t *v0;
  uint64_t (*v1)(void);
  uint64_t v3;
  uint64_t v4;

  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t _sIeghH_IeAgH_TRTA()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  objc_super v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *objc_super v5 = v1;
  v5[1] = _sIeghH_IeAgH_TRTQ0_;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&_sIeghH_IeAgH_TRTu + _sIeghH_IeAgH_TRTu);
  return v6(v2, v3, v4);
}

uint64_t objectdestroy_14Tm()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t _sIeAgH_ytIeAgHr_TRTA(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = _sIeghH_IeAgH_TRTQ0_;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&_sIeAgH_ytIeAgHr_TRTu + _sIeAgH_ytIeAgHr_TRTu);
  return v8(a1, v4, v5, v6);
}

uint64_t outlined destroy of TaskPriority?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23FEBB1C8()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5TA(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = partial apply for @objc closure #1 in INSaveParkingLocationIntentHandler.resolveParkingLocation(for:);
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&_sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5Tu
                                              + _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5Tu);
  return v6(a1, v4);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@guaranteed INPlacemarkResolutionResult) -> ()(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t PersonNameComponents.givenName.getter()
{
  return MEMORY[0x270EEF320]();
}

uint64_t PersonNameComponents.familyName.getter()
{
  return MEMORY[0x270EEF340]();
}

uint64_t PersonNameComponents.middleName.getter()
{
  return MEMORY[0x270EEF360]();
}

uint64_t PersonNameComponents.namePrefix.getter()
{
  return MEMORY[0x270EEF390]();
}

uint64_t PersonNameComponents.nameSuffix.getter()
{
  return MEMORY[0x270EEF3B8]();
}

NSPersonNameComponents __swiftcall PersonNameComponents._bridgeToObjectiveC()()
{
  uint64_t v0 = (objc_class *)MEMORY[0x270EEF3F0]();
  result._private = v1;
  result.super.Class isa = v0;
  return result;
}

uint64_t static PersonNameComponents._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EEF410]();
}

uint64_t PersonNameComponents.nickname.getter()
{
  return MEMORY[0x270EEF420]();
}

uint64_t type metadata accessor for PersonNameComponents()
{
  return MEMORY[0x270EEF460]();
}

uint64_t _convertErrorToNSError(_:)()
{
  return MEMORY[0x270EEF830]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x270EEF840]();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)MEMORY[0x270EF0120]();
}

Swift::String __swiftcall Data.base64EncodedString(options:)(NSDataBase64EncodingOptions options)
{
  uint64_t v1 = MEMORY[0x270EF0130](options);
  result._object = v2;
  result._countAndFlagsBits = v1;
  return result;
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF0178]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriCommandBuilder.siriCommandBuilderParams.getter()
{
  return MEMORY[0x270F520C8]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriCommandBuilder.OneOf_SiriCommandBuilderParams()
{
  return MEMORY[0x270F520D0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriCommandBuilder.uniqueID.getter()
{
  return MEMORY[0x270F520E0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_MapItemSnippet.searchRegionCenter.getter()
{
  return MEMORY[0x270F529E8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_MapItemSnippet.objects.getter()
{
  return MEMORY[0x270F529F0]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_MapItemSnippet()
{
  return MEMORY[0x270F529F8]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_MapItemBuilderParams.DetailType()
{
  return MEMORY[0x270F52D28]();
}

uint64_t Apple_Parsec_Siri_V2alpha_MapItemBuilderParams.detailType.getter()
{
  return MEMORY[0x270F52D30]();
}

uint64_t Apple_Parsec_Siri_V2alpha_MapItemBuilderParams.spokenName.getter()
{
  return MEMORY[0x270F52D38]();
}

uint64_t Apple_Parsec_Siri_V2alpha_MapItemBuilderParams.directionRole.getter()
{
  return MEMORY[0x270F52D40]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_MapItemBuilderParams.Role()
{
  return MEMORY[0x270F52D48]();
}

uint64_t Apple_Parsec_Siri_V2alpha_MapItemBuilderParams.label.getter()
{
  return MEMORY[0x270F52D50]();
}

uint64_t Apple_Parsec_Siri_V2alpha_MapItemBuilderParams.location.getter()
{
  return MEMORY[0x270F52D58]();
}

uint64_t Apple_Parsec_Siri_V2alpha_MapItemBuilderParams.placeData.getter()
{
  return MEMORY[0x270F52D60]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_MapItemBuilderParams()
{
  return MEMORY[0x270F52D68]();
}

uint64_t Apple_Parsec_Siri_V2alpha_LocationBuilderParams.postalCode.getter()
{
  return MEMORY[0x270F52E68]();
}

uint64_t Apple_Parsec_Siri_V2alpha_LocationBuilderParams.timezoneID.getter()
{
  return MEMORY[0x270F52E70]();
}

uint64_t Apple_Parsec_Siri_V2alpha_LocationBuilderParams.countryCode.getter()
{
  return MEMORY[0x270F52E78]();
}

uint64_t Apple_Parsec_Siri_V2alpha_LocationBuilderParams.thoroughfare.getter()
{
  return MEMORY[0x270F52E80]();
}

uint64_t Apple_Parsec_Siri_V2alpha_LocationBuilderParams.subThoroughfare.getter()
{
  return MEMORY[0x270F52E88]();
}

uint64_t Apple_Parsec_Siri_V2alpha_LocationBuilderParams.city.getter()
{
  return MEMORY[0x270F52E90]();
}

uint64_t Apple_Parsec_Siri_V2alpha_LocationBuilderParams.label.getter()
{
  return MEMORY[0x270F52E98]();
}

uint64_t Apple_Parsec_Siri_V2alpha_LocationBuilderParams.street.getter()
{
  return MEMORY[0x270F52EA0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_LocationBuilderParams.latitude.getter()
{
  return MEMORY[0x270F52EA8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_LocationBuilderParams.longitude.getter()
{
  return MEMORY[0x270F52EB0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_LocationBuilderParams.stateCode.getter()
{
  return MEMORY[0x270F52EB8]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_LocationBuilderParams()
{
  return MEMORY[0x270F52EC0]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_PerResultLayoutDetails.OneOf_Snippet()
{
  return MEMORY[0x270F52F20]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ShowMapPointsBuilderParams.itemSource.getter()
{
  return MEMORY[0x270F53088]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ShowMapPointsBuilderParams.showTraffic.getter()
{
  return MEMORY[0x270F53090]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ShowMapPointsBuilderParams.hasItemSource.getter()
{
  return MEMORY[0x270F53098]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ShowMapPointsBuilderParams.showDirections.getter()
{
  return MEMORY[0x270F530A0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ShowMapPointsBuilderParams.itemDestination.getter()
{
  return MEMORY[0x270F530A8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ShowMapPointsBuilderParams.hasItemDestination.getter()
{
  return MEMORY[0x270F530B0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ShowMapPointsBuilderParams.language.getter()
{
  return MEMORY[0x270F530B8]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_ShowMapPointsBuilderParams()
{
  return MEMORY[0x270F530C0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ShowPlaceDetailsBuilderParams.itemIndex.getter()
{
  return MEMORY[0x270F53108]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_ShowPlaceDetailsBuilderParams()
{
  return MEMORY[0x270F53110]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_RecordLocationActivityBuilderParams.SourceType()
{
  return MEMORY[0x270F53118]();
}

uint64_t Apple_Parsec_Siri_V2alpha_RecordLocationActivityBuilderParams.sourceType.getter()
{
  return MEMORY[0x270F53120]();
}

uint64_t Apple_Parsec_Siri_V2alpha_RecordLocationActivityBuilderParams.location.getter()
{
  return MEMORY[0x270F53128]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_RecordLocationActivityBuilderParams()
{
  return MEMORY[0x270F53130]();
}

uint64_t Siri_Nlu_External_UsoGraph.identifiers.getter()
{
  return MEMORY[0x270F6A350]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UsoGraph()
{
  return MEMORY[0x270F6A370]();
}

uint64_t Siri_Nlu_External_UserAccepted.init()()
{
  return MEMORY[0x270F6A5D8]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UserAccepted()
{
  return MEMORY[0x270F6A5E0]();
}

uint64_t Siri_Nlu_External_SystemOffered.offeredAct.setter()
{
  return MEMORY[0x270F6A718]();
}

uint64_t Siri_Nlu_External_SystemOffered.init()()
{
  return MEMORY[0x270F6A720]();
}

uint64_t type metadata accessor for Siri_Nlu_External_SystemOffered()
{
  return MEMORY[0x270F6A728]();
}

uint64_t Siri_Nlu_External_UserCancelled.init()()
{
  return MEMORY[0x270F6A748]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UserCancelled()
{
  return MEMORY[0x270F6A750]();
}

uint64_t Siri_Nlu_External_UserDialogAct.userStatedTask.getter()
{
  return MEMORY[0x270F6A7B0]();
}

uint64_t Siri_Nlu_External_UserDialogAct.userStatedTask.setter()
{
  return MEMORY[0x270F6A7B8]();
}

uint64_t Siri_Nlu_External_UserDialogAct.wantedToProceed.setter()
{
  return MEMORY[0x270F6A7E8]();
}

uint64_t Siri_Nlu_External_UserDialogAct.accepted.setter()
{
  return MEMORY[0x270F6A818]();
}

uint64_t Siri_Nlu_External_UserDialogAct.cancelled.setter()
{
  return MEMORY[0x270F6A848]();
}

uint64_t Siri_Nlu_External_UserDialogAct.init()()
{
  return MEMORY[0x270F6A860]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UserDialogAct()
{
  return MEMORY[0x270F6A868]();
}

uint64_t type metadata accessor for Siri_Nlu_External_SystemPrompted()
{
  return MEMORY[0x270F6AA98]();
}

uint64_t Siri_Nlu_External_UserStatedTask.task.getter()
{
  return MEMORY[0x270F6AAB0]();
}

uint64_t Siri_Nlu_External_UserStatedTask.task.setter()
{
  return MEMORY[0x270F6AAB8]();
}

uint64_t Siri_Nlu_External_UserStatedTask.init()()
{
  return MEMORY[0x270F6AAC0]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UserStatedTask()
{
  return MEMORY[0x270F6AAC8]();
}

uint64_t Siri_Nlu_External_SystemDialogAct.offered.setter()
{
  return MEMORY[0x270F6AC88]();
}

uint64_t Siri_Nlu_External_SystemDialogAct.prompted.setter()
{
  return MEMORY[0x270F6ACA0]();
}

uint64_t Siri_Nlu_External_SystemDialogAct.init()()
{
  return MEMORY[0x270F6ACB0]();
}

uint64_t Siri_Nlu_External_SystemGaveOptions.choices.setter()
{
  return MEMORY[0x270F6ADB0]();
}

uint64_t Siri_Nlu_External_SystemGaveOptions.init()()
{
  return MEMORY[0x270F6ADB8]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UserWantedToProceed()
{
  return MEMORY[0x270F6AF78]();
}

uint64_t Siri_Nlu_External_UsoEntityIdentifier.backingAppBundleID.getter()
{
  return MEMORY[0x270F6AF98]();
}

uint64_t Siri_Nlu_External_UsoEntityIdentifier.value.getter()
{
  return MEMORY[0x270F6AFB0]();
}

uint64_t Siri_Nlu_External_UsoEntityIdentifier.namespace.getter()
{
  return MEMORY[0x270F6AFC0]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UsoEntityIdentifier()
{
  return MEMORY[0x270F6AFC8]();
}

uint64_t static ConversionUtils.convertUserDialogActToTasks(userDialogAct:)()
{
  return MEMORY[0x270F6BB18]();
}

uint64_t static UsoGraphProtoWriter.toSwiftProtobuf(graph:vocabManager:)()
{
  return MEMORY[0x270F6BB38]();
}

uint64_t dispatch thunk of Uso_VerbTemplateBuilder_NoVerb.setEntity(value:)()
{
  return MEMORY[0x270F6C048]();
}

uint64_t static UsoGraphBuilder.buildGraphWithOptions(taskBuilders:options:)()
{
  return MEMORY[0x270F6CCA0]();
}

uint64_t type metadata accessor for UsoBuilderOptions()
{
  return MEMORY[0x270F6CD70]();
}

uint64_t UsoEntityBuilder_common_Person.init()()
{
  return MEMORY[0x270F6DB78]();
}

uint64_t type metadata accessor for UsoEntityBuilder_common_Person()
{
  return MEMORY[0x270F6DB80]();
}

uint64_t UsoTaskBuilder_noVerb_common_Person.init()()
{
  return MEMORY[0x270F6E6B0]();
}

uint64_t type metadata accessor for UsoTaskBuilder_noVerb_common_Person()
{
  return MEMORY[0x270F6E6B8]();
}

uint64_t ContactQuery.familyName.setter()
{
  return MEMORY[0x270F655E8]();
}

uint64_t ContactQuery.middleName.setter()
{
  return MEMORY[0x270F655F8]();
}

uint64_t ContactQuery.namePrefix.setter()
{
  return MEMORY[0x270F65608]();
}

uint64_t ContactQuery.nameSuffix.setter()
{
  return MEMORY[0x270F65618]();
}

uint64_t ContactQuery.relationship.setter()
{
  return MEMORY[0x270F65628]();
}

uint64_t ContactQuery.id.setter()
{
  return MEMORY[0x270F65650]();
}

uint64_t ContactQuery.fullName.setter()
{
  return MEMORY[0x270F65678]();
}

uint64_t ContactQuery.nickname.setter()
{
  return MEMORY[0x270F65688]();
}

uint64_t ContactQuery.givenName.setter()
{
  return MEMORY[0x270F65698]();
}

uint64_t ContactQuery.init()()
{
  return MEMORY[0x270F656A0]();
}

uint64_t type metadata accessor for ContactQuery()
{
  return MEMORY[0x270F656A8]();
}

uint64_t type metadata accessor for ContactHandle.HandleType()
{
  return MEMORY[0x270F65718]();
}

uint64_t ContactHandle.init(id:type:label:value:isSuggested:)()
{
  return MEMORY[0x270F65720]();
}

uint64_t ContactRelationshipQuery.init(label:fromContact:)()
{
  return MEMORY[0x270F65998]();
}

uint64_t type metadata accessor for ContactRelationshipQuery()
{
  return MEMORY[0x270F659A0]();
}

uint64_t Google_Protobuf_StringValue.value.getter()
{
  return MEMORY[0x270F446F8]();
}

uint64_t type metadata accessor for Google_Protobuf_StringValue()
{
  return MEMORY[0x270F44710]();
}

uint64_t os_log(_:dso:log:_:_:)()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t os_signpost(_:dso:log:name:signpostID:_:_:)()
{
  return MEMORY[0x270FA2C90]();
}

uint64_t static OSSignpostID.exclusive.getter()
{
  return MEMORY[0x270FA2CF8]();
}

uint64_t type metadata accessor for OSSignpostID()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t Logger.init(_:)()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1840]();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return MEMORY[0x270F9D320]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x270F9D598]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x270EF19B0]();
}

uint64_t static String._forceBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t static String._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t String.init<A>(describing:)()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x270F9D708]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t dispatch thunk of RawRepresentable.rawValue.getter()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x270F9DBA0]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x270EF1B88]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t Array.description.getter()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t specialized Array._endMutation()()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t Array.debugDescription.getter()
{
  return MEMORY[0x270F9DBF8]();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t TaskPriority.rawValue.getter()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t type metadata accessor for TaskPriority()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t Double.write<A>(to:)()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t static os_log_type_t.info.getter()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t static os_log_type_t.debug.getter()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t static os_log_type_t.default.getter()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t static os_signpost_type_t.end.getter()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t static os_signpost_type_t.begin.getter()
{
  return MEMORY[0x270FA2EA8]();
}

NSNumber __swiftcall NSNumber.init(BOOLeanLiteral:)(Swift::Bool BOOLeanLiteral)
{
  return (NSNumber)MEMORY[0x270EF2180](BOOLeanLiteral);
}

uint64_t NSObject.hashValue.getter()
{
  return MEMORY[0x270FA11A0]();
}

uint64_t NSString.init(stringLiteral:)()
{
  return MEMORY[0x270EF21A8]();
}

uint64_t OS_os_log.init(subsystem:category:)()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x270F9E530]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x270F9E560]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x270F9F080]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9F0C0]();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return MEMORY[0x270F9F230](cases._rawValue, string._countAndFlagsBits, string._object);
}

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return MEMORY[0x270F9F4C8](a1);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t Error.localizedDescription.getter()
{
  return MEMORY[0x270EF2680]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x270F9FC48]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t INIntentSlotValueTransformToContactValue()
{
  return MEMORY[0x270EF5230]();
}

uint64_t MSPSharedTripNetworkEnabled()
{
  return MEMORY[0x270F49688]();
}

uint64_t MSPSharedTripServiceNameForRawServiceName()
{
  return MEMORY[0x270F49690]();
}

uint64_t MSPSharedTripUserEnabled()
{
  return MEMORY[0x270F49698]();
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

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x270FA0250]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}