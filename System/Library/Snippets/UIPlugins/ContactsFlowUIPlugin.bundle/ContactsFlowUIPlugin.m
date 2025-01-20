uint64_t one-time initialization function for siriContacts()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Logger.siriContacts);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.siriContacts);
  return Logger.init(subsystem:category:)();
}

void *LogConst.subsystem.unsafeMutableAddressor()
{
  return &static LogConst.subsystem;
}

const char *LogConst.Category.siriContacts.unsafeMutableAddressor()
{
  return "SiriContacts";
}

uint64_t Logger.siriContacts.unsafeMutableAddressor()
{
  if (one-time initialization token for siriContacts != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();

  return __swift_project_value_buffer(v0, (uint64_t)static Logger.siriContacts);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t static Logger.siriContacts.getter@<X0>(uint64_t a1@<X8>)
{
  if (one-time initialization token for siriContacts != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)static Logger.siriContacts);
  v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t static LogConst.subsystem.getter()
{
  return 0xD000000000000017;
}

uint64_t static LogConst.Category.siriContacts.getter()
{
  return 0x746E6F4369726953;
}

void type metadata accessor for Logger()
{
}

void type metadata accessor for LogConst()
{
}

void type metadata accessor for LogConst.Category()
{
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

uint64_t ContactsFlowUIPlugin.__allocating_init()()
{
  return _swift_allocObject(v0, 16, 7);
}

uint64_t ContactsFlowUIPlugin.deinit()
{
  return v0;
}

uint64_t ContactsFlowUIPlugin.snippet(for:mode:idiom:)(uint64_t a1)
{
  uint64_t v31 = a1;
  type metadata accessor for ModifyContactAttributeSnippetModel();
  OUTLINED_FUNCTION_0_0();
  uint64_t v29 = v5;
  uint64_t v30 = v4;
  __chkstk_darwin();
  OUTLINED_FUNCTION_8();
  uint64_t ContactAttributeSnippetModel = type metadata accessor for GetContactAttributeSnippetModel();
  OUTLINED_FUNCTION_0_0();
  uint64_t v28 = v7;
  __chkstk_darwin();
  OUTLINED_FUNCTION_9();
  uint64_t ContactSnippetModel = type metadata accessor for GetContactSnippetModel();
  OUTLINED_FUNCTION_0_0();
  uint64_t v10 = v9;
  __chkstk_darwin();
  OUTLINED_FUNCTION_3();
  uint64_t v11 = type metadata accessor for ContactsSnippetPluginModel();
  OUTLINED_FUNCTION_0_0();
  uint64_t v13 = v12;
  __chkstk_darwin();
  v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v31, v11);
  int v16 = (*(uint64_t (**)(char *, uint64_t))(v13 + 88))(v15, v11);
  if (v16 == enum case for ContactsSnippetPluginModel.getContact(_:))
  {
    uint64_t v17 = OUTLINED_FUNCTION_7();
    v18(v17);
    (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(v1, v15, ContactSnippetModel);
    uint64_t v19 = ContactsFlowUIPlugin.makeGetContactView(for:)();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v1, ContactSnippetModel);
    return v19;
  }
  if (v16 == enum case for ContactsSnippetPluginModel.getContactAttribute(_:))
  {
    uint64_t v20 = OUTLINED_FUNCTION_7();
    v21(v20);
    uint64_t v22 = v28;
    (*(void (**)(uint64_t, char *, uint64_t))(v28 + 32))(v3, v15, ContactAttributeSnippetModel);
    uint64_t v19 = ContactsFlowUIPlugin.makeGetContactAttributeView(for:)();
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v3, ContactAttributeSnippetModel);
    return v19;
  }
  if (v16 == enum case for ContactsSnippetPluginModel.modifyContactAttribute(_:))
  {
    uint64_t v23 = OUTLINED_FUNCTION_7();
    v24(v23);
    uint64_t v26 = v29;
    uint64_t v25 = v30;
    (*(void (**)(uint64_t, char *, uint64_t))(v29 + 32))(v2, v15, v30);
    uint64_t v19 = ContactsFlowUIPlugin.makeModifyContactAttributeView(for:)();
    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v2, v25);
    return v19;
  }
  uint64_t result = _diagnoseUnexpectedEnumCase<A>(type:)();
  __break(1u);
  return result;
}

uint64_t ContactsFlowUIPlugin.makeGetContactView(for:)()
{
  type metadata accessor for Logger();
  OUTLINED_FUNCTION_0_0();
  __chkstk_darwin();
  OUTLINED_FUNCTION_8();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for HostBackground?);
  __chkstk_darwin();
  OUTLINED_FUNCTION_15(v2, v46);
  type metadata accessor for GetContactView();
  OUTLINED_FUNCTION_0_0();
  __chkstk_darwin();
  OUTLINED_FUNCTION_9();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<GetContactView, _BackgroundStyleModifier<Gradient>>);
  OUTLINED_FUNCTION_2();
  __chkstk_darwin();
  OUTLINED_FUNCTION_19(v3, v47);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.setHostBackground(_:)>>.0);
  OUTLINED_FUNCTION_0_0();
  __chkstk_darwin();
  OUTLINED_FUNCTION_20(v4, v48);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodableContact<CNContact>);
  OUTLINED_FUNCTION_0_0();
  __chkstk_darwin();
  OUTLINED_FUNCTION_3();
  type metadata accessor for GetContactSnippetModel();
  OUTLINED_FUNCTION_0_0();
  __chkstk_darwin();
  uint64_t v5 = OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0();
  __chkstk_darwin();
  OUTLINED_FUNCTION_18();
  GetContactSnippetModel.flowState.getter();
  uint64_t v6 = OUTLINED_FUNCTION_17();
  int v8 = v7(v6);
  if (v8 == enum case for ContactsSnippetFlowState.confirm(_:))
  {
    uint64_t v9 = OUTLINED_FUNCTION_25();
    v10(v9);
    OUTLINED_FUNCTION_28();
    uint64_t v11 = OUTLINED_FUNCTION_10();
    v12(v11);
    uint64_t v13 = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v13, v14))
    {
      *(_WORD *)swift_slowAlloc() = 0;
      OUTLINED_FUNCTION_31(&dword_0, v15, v16, "#ContactsFlowUIPlugin makeGetContactView called for confirmation state, no view expected");
      swift_slowDealloc();
    }

    uint64_t v17 = OUTLINED_FUNCTION_24();
    v18(v17);
    return View.eraseToAnyView()();
  }
  if (v8 == enum case for ContactsSnippetFlowState.intentHandled(_:))
  {
    uint64_t v19 = OUTLINED_FUNCTION_5();
    v1(v19);
    GetContactSnippetModel.contact.getter();
    CodableContact.wrappedValue.getter();
    uint64_t v20 = OUTLINED_FUNCTION_13();
    v21(v20);
    uint64_t v22 = outlined bridged method (ob) of @objc CNContact.thumbnailImageData.getter(v0);
    unint64_t v24 = v23;
    static ContactsFlowImageColorGenerator.colors(for:)();
    outlined consume of Data?(v22, v24);
    static ContactsFlowImageColorGenerator.shouldDisplayLightText(against:)();
    GetContactSnippetModel.shouldDisplayLightText.setter();
    uint64_t v25 = OUTLINED_FUNCTION_23();
    v1(v25);
    uint64_t v26 = OUTLINED_FUNCTION_1();
    v27(v26);
    Gradient.init(colors:)();
    static Edge.Set.all.getter();
    uint64_t v28 = OUTLINED_FUNCTION_6();
    v29(v28);
    uint64_t v30 = OUTLINED_FUNCTION_4();
    v31(v30);
    uint64_t *v49 = static Color.clear.getter();
    uint64_t v0 = (void *)enum case for HostBackground.color(_:);
    type metadata accessor for HostBackground();
    OUTLINED_FUNCTION_2();
    uint64_t v32 = OUTLINED_FUNCTION_26();
    v33(v32);
    OUTLINED_FUNCTION_29();
    unint64_t Contact = lazy protocol witness table accessor for type ModifiedContent<GetContactView, _BackgroundStyleModifier<Gradient>> and conformance <> ModifiedContent<A, B>();
    OUTLINED_FUNCTION_11(Contact);
    outlined destroy of HostBackground?((uint64_t)v49, &demangling cache variable for type metadata for HostBackground?);
    outlined destroy of HostBackground?(v5, &demangling cache variable for type metadata for ModifiedContent<GetContactView, _BackgroundStyleModifier<Gradient>>);
    swift_getOpaqueTypeConformance2();
    OUTLINED_FUNCTION_27();
    uint64_t v35 = OUTLINED_FUNCTION_12();
    v36(v35);
    uint64_t v37 = OUTLINED_FUNCTION_16();
    v38(v37);
    return (uint64_t)v0;
  }
  if (v8 == enum case for ContactsSnippetFlowState.unsupported(_:))
  {
    uint64_t v39 = OUTLINED_FUNCTION_21();
    v40(v39);
    uint64_t v41 = OUTLINED_FUNCTION_1();
    v42(v41);
    lazy protocol witness table accessor for type ContactsSnippetPluginModel and conformance ContactsSnippetPluginModel(&lazy protocol witness table cache variable for type GetContactView and conformance GetContactView, (void (*)(uint64_t))&type metadata accessor for GetContactView);
    View.eraseToAnyView()();
    uint64_t v43 = OUTLINED_FUNCTION_22();
    v44(v43);
    return (uint64_t)v0;
  }
  uint64_t result = _diagnoseUnexpectedEnumCase<A>(type:)();
  __break(1u);
  return result;
}

uint64_t ContactsFlowUIPlugin.makeGetContactAttributeView(for:)()
{
  type metadata accessor for Logger();
  OUTLINED_FUNCTION_0_0();
  __chkstk_darwin();
  OUTLINED_FUNCTION_8();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for HostBackground?);
  __chkstk_darwin();
  OUTLINED_FUNCTION_15(v2, v46);
  type metadata accessor for GetContactAttributeView();
  OUTLINED_FUNCTION_0_0();
  __chkstk_darwin();
  OUTLINED_FUNCTION_9();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<GetContactAttributeView, _BackgroundStyleModifier<Gradient>>);
  OUTLINED_FUNCTION_2();
  __chkstk_darwin();
  OUTLINED_FUNCTION_19(v3, v47);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.setHostBackground(_:)>>.0);
  OUTLINED_FUNCTION_0_0();
  __chkstk_darwin();
  OUTLINED_FUNCTION_20(v4, v48);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodableContact<CNContact>);
  OUTLINED_FUNCTION_0_0();
  __chkstk_darwin();
  OUTLINED_FUNCTION_3();
  type metadata accessor for GetContactAttributeSnippetModel();
  OUTLINED_FUNCTION_0_0();
  __chkstk_darwin();
  uint64_t v5 = OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0();
  __chkstk_darwin();
  OUTLINED_FUNCTION_18();
  GetContactAttributeSnippetModel.flowState.getter();
  uint64_t v6 = OUTLINED_FUNCTION_17();
  int v8 = v7(v6);
  if (v8 == enum case for ContactsSnippetFlowState.confirm(_:))
  {
    uint64_t v9 = OUTLINED_FUNCTION_25();
    v10(v9);
    OUTLINED_FUNCTION_28();
    uint64_t v11 = OUTLINED_FUNCTION_10();
    v12(v11);
    uint64_t v13 = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v13, v14))
    {
      *(_WORD *)swift_slowAlloc() = 0;
      OUTLINED_FUNCTION_31(&dword_0, v15, v16, "#ContactsFlowUIPlugin makeGetContactAttributeView called for confirmation state, no view expected");
      swift_slowDealloc();
    }

    uint64_t v17 = OUTLINED_FUNCTION_24();
    v18(v17);
    return View.eraseToAnyView()();
  }
  if (v8 == enum case for ContactsSnippetFlowState.intentHandled(_:))
  {
    uint64_t v19 = OUTLINED_FUNCTION_5();
    v1(v19);
    GetContactAttributeSnippetModel.contact.getter();
    CodableContact.wrappedValue.getter();
    uint64_t v20 = OUTLINED_FUNCTION_13();
    v21(v20);
    uint64_t v22 = outlined bridged method (ob) of @objc CNContact.thumbnailImageData.getter(v0);
    unint64_t v24 = v23;
    static ContactsFlowImageColorGenerator.colors(for:)();
    outlined consume of Data?(v22, v24);
    static ContactsFlowImageColorGenerator.shouldDisplayLightText(against:)();
    GetContactAttributeSnippetModel.shouldDisplayLightText.setter();
    uint64_t v25 = OUTLINED_FUNCTION_23();
    v1(v25);
    uint64_t v26 = OUTLINED_FUNCTION_1();
    v27(v26);
    Gradient.init(colors:)();
    static Edge.Set.all.getter();
    uint64_t v28 = OUTLINED_FUNCTION_6();
    v29(v28);
    uint64_t v30 = OUTLINED_FUNCTION_4();
    v31(v30);
    uint64_t *v49 = static Color.clear.getter();
    uint64_t v0 = (void *)enum case for HostBackground.color(_:);
    type metadata accessor for HostBackground();
    OUTLINED_FUNCTION_2();
    uint64_t v32 = OUTLINED_FUNCTION_26();
    v33(v32);
    OUTLINED_FUNCTION_29();
    unint64_t ContactAttribute = lazy protocol witness table accessor for type ModifiedContent<GetContactAttributeView, _BackgroundStyleModifier<Gradient>> and conformance <> ModifiedContent<A, B>();
    OUTLINED_FUNCTION_11(ContactAttribute);
    outlined destroy of HostBackground?((uint64_t)v49, &demangling cache variable for type metadata for HostBackground?);
    outlined destroy of HostBackground?(v5, &demangling cache variable for type metadata for ModifiedContent<GetContactAttributeView, _BackgroundStyleModifier<Gradient>>);
    swift_getOpaqueTypeConformance2();
    OUTLINED_FUNCTION_27();
    uint64_t v35 = OUTLINED_FUNCTION_12();
    v36(v35);
    uint64_t v37 = OUTLINED_FUNCTION_16();
    v38(v37);
    return (uint64_t)v0;
  }
  if (v8 == enum case for ContactsSnippetFlowState.unsupported(_:))
  {
    uint64_t v39 = OUTLINED_FUNCTION_21();
    v40(v39);
    uint64_t v41 = OUTLINED_FUNCTION_1();
    v42(v41);
    lazy protocol witness table accessor for type ContactsSnippetPluginModel and conformance ContactsSnippetPluginModel(&lazy protocol witness table cache variable for type GetContactAttributeView and conformance GetContactAttributeView, (void (*)(uint64_t))&type metadata accessor for GetContactAttributeView);
    View.eraseToAnyView()();
    uint64_t v43 = OUTLINED_FUNCTION_22();
    v44(v43);
    return (uint64_t)v0;
  }
  uint64_t result = _diagnoseUnexpectedEnumCase<A>(type:)();
  __break(1u);
  return result;
}

uint64_t ContactsFlowUIPlugin.makeModifyContactAttributeView(for:)()
{
  uint64_t v0 = type metadata accessor for ModifyContactAttributeView();
  OUTLINED_FUNCTION_0_0();
  uint64_t v2 = v1;
  __chkstk_darwin();
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for ContactsSnippetFlowState();
  OUTLINED_FUNCTION_0_0();
  uint64_t v7 = v6;
  __chkstk_darwin();
  uint64_t v9 = (uint64_t *)((char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  ModifyContactAttributeSnippetModel.flowState.getter();
  int v10 = (*(uint64_t (**)(uint64_t *, uint64_t))(v7 + 88))(v9, v5);
  if (v10 == enum case for ContactsSnippetFlowState.confirm(_:))
  {
    (*(void (**)(uint64_t *, uint64_t))(v7 + 96))(v9, v5);
    uint64_t v11 = *v9;
    unint64_t v12 = v9[1];
    uint64_t v13 = v9[2];
    unint64_t v14 = v9[3];
    outlined consume of Data?(v11, v12);
    outlined consume of Data?(v13, v14);
    type metadata accessor for ModifyContactAttributeSnippetModel();
    OUTLINED_FUNCTION_2();
    uint64_t v15 = OUTLINED_FUNCTION_30();
    v16(v15);
    uint64_t v17 = (unsigned int *)&enum case for ModifyContactAttributeView.confirm(_:);
LABEL_5:
    (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *v17, v0);
    lazy protocol witness table accessor for type ContactsSnippetPluginModel and conformance ContactsSnippetPluginModel(&lazy protocol witness table cache variable for type ModifyContactAttributeView and conformance ModifyContactAttributeView, (void (*)(uint64_t))&type metadata accessor for ModifyContactAttributeView);
    uint64_t v20 = View.eraseToAnyView()();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v0);
    return v20;
  }
  if (v10 == enum case for ContactsSnippetFlowState.intentHandled(_:))
  {
    type metadata accessor for ModifyContactAttributeSnippetModel();
    OUTLINED_FUNCTION_2();
    uint64_t v18 = OUTLINED_FUNCTION_30();
    v19(v18);
    uint64_t v17 = (unsigned int *)&enum case for ModifyContactAttributeView.intentHandled(_:);
    goto LABEL_5;
  }
  if (v10 == enum case for ContactsSnippetFlowState.unsupported(_:)) {
    return View.eraseToAnyView()();
  }
  uint64_t result = _diagnoseUnexpectedEnumCase<A>(type:)();
  __break(1u);
  return result;
}

uint64_t ContactsFlowUIPlugin.__deallocating_deinit()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t associated type witness table accessor for SnippetProviding.SnippetPluginModelType : SnippetPluginModel in ContactsFlowUIPlugin()
{
  return lazy protocol witness table accessor for type ContactsSnippetPluginModel and conformance ContactsSnippetPluginModel(&lazy protocol witness table cache variable for type ContactsSnippetPluginModel and conformance ContactsSnippetPluginModel, (void (*)(uint64_t))&type metadata accessor for ContactsSnippetPluginModel);
}

uint64_t protocol witness for SnippetProviding.init() in conformance ContactsFlowUIPlugin@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = ContactsFlowUIPlugin.__allocating_init()();
  *a1 = result;
  return result;
}

uint64_t protocol witness for SnippetProviding.snippet(for:mode:idiom:) in conformance ContactsFlowUIPlugin(uint64_t a1)
{
  return ContactsFlowUIPlugin.snippet(for:mode:idiom:)(a1);
}

uint64_t type metadata accessor for ContactsFlowUIPlugin()
{
  return self;
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

uint64_t outlined consume of Data?(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return outlined consume of Data._Representation(a1, a2);
  }
  return a1;
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

uint64_t outlined bridged method (ob) of @objc CNContact.thumbnailImageData.getter(void *a1)
{
  id v2 = [a1 thumbnailImageData];

  if (!v2) {
    return 0;
  }
  uint64_t v3 = static Data._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<GetContactView, _BackgroundStyleModifier<Gradient>> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result = lazy protocol witness table cache variable for type ModifiedContent<GetContactView, _BackgroundStyleModifier<Gradient>> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<GetContactView, _BackgroundStyleModifier<Gradient>> and conformance <> ModifiedContent<A, B>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<GetContactView, _BackgroundStyleModifier<Gradient>>);
    lazy protocol witness table accessor for type ContactsSnippetPluginModel and conformance ContactsSnippetPluginModel(&lazy protocol witness table cache variable for type GetContactView and conformance GetContactView, (void (*)(uint64_t))&type metadata accessor for GetContactView);
    lazy protocol witness table accessor for type _BackgroundStyleModifier<Gradient> and conformance _BackgroundStyleModifier<A>();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<GetContactView, _BackgroundStyleModifier<Gradient>> and conformance <> ModifiedContent<A, B>);
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

unint64_t lazy protocol witness table accessor for type _BackgroundStyleModifier<Gradient> and conformance _BackgroundStyleModifier<A>()
{
  unint64_t result = lazy protocol witness table cache variable for type _BackgroundStyleModifier<Gradient> and conformance _BackgroundStyleModifier<A>;
  if (!lazy protocol witness table cache variable for type _BackgroundStyleModifier<Gradient> and conformance _BackgroundStyleModifier<A>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for _BackgroundStyleModifier<Gradient>);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type _BackgroundStyleModifier<Gradient> and conformance _BackgroundStyleModifier<A>);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<GetContactAttributeView, _BackgroundStyleModifier<Gradient>> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result = lazy protocol witness table cache variable for type ModifiedContent<GetContactAttributeView, _BackgroundStyleModifier<Gradient>> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<GetContactAttributeView, _BackgroundStyleModifier<Gradient>> and conformance <> ModifiedContent<A, B>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<GetContactAttributeView, _BackgroundStyleModifier<Gradient>>);
    lazy protocol witness table accessor for type ContactsSnippetPluginModel and conformance ContactsSnippetPluginModel(&lazy protocol witness table cache variable for type GetContactAttributeView and conformance GetContactAttributeView, (void (*)(uint64_t))&type metadata accessor for GetContactAttributeView);
    lazy protocol witness table accessor for type _BackgroundStyleModifier<Gradient> and conformance _BackgroundStyleModifier<A>();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<GetContactAttributeView, _BackgroundStyleModifier<Gradient>> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

uint64_t outlined destroy of HostBackground?(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_2();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t lazy protocol witness table accessor for type ContactsSnippetPluginModel and conformance ContactsSnippetPluginModel(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t OUTLINED_FUNCTION_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_4()
{
  uint64_t v5 = v3 + *(int *)(*(void *)(v4 - 168) + 36);
  *(void *)uint64_t v5 = v0;
  *(unsigned char *)(v5 + 8) = v1;
  return v2;
}

uint64_t OUTLINED_FUNCTION_5()
{
  *(void *)(v2 - 200) = v1;
  return v0;
}

uint64_t OUTLINED_FUNCTION_6()
{
  return *(void *)(v0 - 184);
}

uint64_t OUTLINED_FUNCTION_7()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_10()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_11(uint64_t a1)
{
  return View.setHostBackground(_:)(v1, v2, a1);
}

uint64_t OUTLINED_FUNCTION_12()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_13()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_14()
{
  return type metadata accessor for ContactsSnippetFlowState();
}

uint64_t OUTLINED_FUNCTION_15@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 144) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
  return 0;
}

uint64_t OUTLINED_FUNCTION_16()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_17()
{
  return v0;
}

void OUTLINED_FUNCTION_19(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 184) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_20(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 176) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_21()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_22()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_23()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_24()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_25()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_26()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_27()
{
  return View.eraseToAnyView()();
}

uint64_t OUTLINED_FUNCTION_28()
{
  uint64_t v1 = v0[2];
  unint64_t v2 = v0[3];
  outlined consume of Data?(*v0, v0[1]);
  outlined consume of Data?(v1, v2);
  return Logger.siriContacts.unsafeMutableAddressor();
}

uint64_t OUTLINED_FUNCTION_29()
{
  return __swift_storeEnumTagSinglePayload(v1, 0, 1, v0);
}

uint64_t OUTLINED_FUNCTION_30()
{
  return v0;
}

void OUTLINED_FUNCTION_31(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t static ContactsFlowImageColorGenerator.shouldDisplayLightText(against:)()
{
  return static ContactsFlowImageColorGenerator.shouldDisplayLightText(against:)();
}

uint64_t static ContactsFlowImageColorGenerator.colors(for:)()
{
  return static ContactsFlowImageColorGenerator.colors(for:)();
}

uint64_t type metadata accessor for GetContactView()
{
  return type metadata accessor for GetContactView();
}

uint64_t type metadata accessor for GetContactAttributeView()
{
  return type metadata accessor for GetContactAttributeView();
}

uint64_t type metadata accessor for ModifyContactAttributeView()
{
  return type metadata accessor for ModifyContactAttributeView();
}

uint64_t type metadata accessor for ContactsSnippetFlowState()
{
  return type metadata accessor for ContactsSnippetFlowState();
}

uint64_t type metadata accessor for ContactsSnippetPluginModel()
{
  return type metadata accessor for ContactsSnippetPluginModel();
}

uint64_t CodableContact.wrappedValue.getter()
{
  return CodableContact.wrappedValue.getter();
}

uint64_t GetContactSnippetModel.shouldDisplayLightText.setter()
{
  return GetContactSnippetModel.shouldDisplayLightText.setter();
}

uint64_t GetContactSnippetModel.contact.getter()
{
  return GetContactSnippetModel.contact.getter();
}

uint64_t GetContactSnippetModel.flowState.getter()
{
  return GetContactSnippetModel.flowState.getter();
}

uint64_t type metadata accessor for GetContactSnippetModel()
{
  return type metadata accessor for GetContactSnippetModel();
}

uint64_t GetContactAttributeSnippetModel.shouldDisplayLightText.setter()
{
  return GetContactAttributeSnippetModel.shouldDisplayLightText.setter();
}

uint64_t GetContactAttributeSnippetModel.contact.getter()
{
  return GetContactAttributeSnippetModel.contact.getter();
}

uint64_t GetContactAttributeSnippetModel.flowState.getter()
{
  return GetContactAttributeSnippetModel.flowState.getter();
}

uint64_t type metadata accessor for GetContactAttributeSnippetModel()
{
  return type metadata accessor for GetContactAttributeSnippetModel();
}

uint64_t ModifyContactAttributeSnippetModel.flowState.getter()
{
  return ModifyContactAttributeSnippetModel.flowState.getter();
}

uint64_t type metadata accessor for ModifyContactAttributeSnippetModel()
{
  return type metadata accessor for ModifyContactAttributeSnippetModel();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init(subsystem:category:)()
{
  return Logger.init(subsystem:category:)();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t static Edge.Set.all.getter()
{
  return static Edge.Set.all.getter();
}

uint64_t View.eraseToAnyView()()
{
  return View.eraseToAnyView()();
}

uint64_t static Color.clear.getter()
{
  return static Color.clear.getter();
}

uint64_t Gradient.init(colors:)()
{
  return Gradient.init(colors:)();
}

uint64_t type metadata accessor for HostBackground()
{
  return type metadata accessor for HostBackground();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t _diagnoseUnexpectedEnumCase<A>(type:)()
{
  return _diagnoseUnexpectedEnumCase<A>(type:)();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

uint64_t self
{
  return _self;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
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

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}