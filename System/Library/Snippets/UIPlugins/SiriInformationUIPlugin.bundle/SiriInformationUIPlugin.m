uint64_t SiriInformationUIPlugin.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t SiriInformationUIPlugin.deinit()
{
  return v0;
}

uint64_t SiriInformationUIPlugin.snippet(for:mode:idiom:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for KnowledgeFallbackConfirmationView();
  __chkstk_darwin();
  v10 = (uint64_t *)((char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  InteractionDelegate.init()();
  v11 = (void *)((char *)v10 + *(int *)(v8 + 32));
  type metadata accessor for Context();
  lazy protocol witness table accessor for type Context and conformance Context(&lazy protocol witness table cache variable for type Context and conformance Context, (void (*)(uint64_t))&type metadata accessor for Context);
  uint64_t *v11 = EnvironmentObject.init()();
  v11[1] = v12;
  void *v10 = a1;
  v10[1] = a2;
  v10[2] = a3;
  v10[3] = a4;
  v10[4] = static InvocationFactory.makeConfirmAndRejectActions()();
  v10[5] = v13;
  lazy protocol witness table accessor for type Context and conformance Context(&lazy protocol witness table cache variable for type KnowledgeFallbackConfirmationView and conformance KnowledgeFallbackConfirmationView, (void (*)(uint64_t))type metadata accessor for KnowledgeFallbackConfirmationView);
  uint64_t v14 = View.eraseToAnyView()();
  outlined destroy of KnowledgeFallbackConfirmationView((uint64_t)v10);
  return v14;
}

uint64_t type metadata accessor for KnowledgeFallbackConfirmationView()
{
  uint64_t result = type metadata singleton initialization cache for KnowledgeFallbackConfirmationView;
  if (!type metadata singleton initialization cache for KnowledgeFallbackConfirmationView) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t KnowledgeFallbackConfirmationView.init(model:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  uint64_t v10 = type metadata accessor for KnowledgeFallbackConfirmationView();
  InteractionDelegate.init()();
  v11 = (void *)((char *)a5 + *(int *)(v10 + 32));
  type metadata accessor for Context();
  lazy protocol witness table accessor for type Context and conformance Context(&lazy protocol witness table cache variable for type Context and conformance Context, (void (*)(uint64_t))&type metadata accessor for Context);
  uint64_t *v11 = EnvironmentObject.init()();
  v11[1] = v12;
  *a5 = a1;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  uint64_t result = static InvocationFactory.makeConfirmAndRejectActions()();
  a5[4] = result;
  a5[5] = v14;
  return result;
}

uint64_t outlined destroy of KnowledgeFallbackConfirmationView(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for KnowledgeFallbackConfirmationView();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t SiriInformationUIPlugin.__deallocating_deinit()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t protocol witness for SnippetProviding.init() in conformance SiriInformationUIPlugin@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = swift_allocObject();
  *a1 = result;
  return result;
}

uint64_t protocol witness for SnippetProviding.snippet(for:mode:idiom:) in conformance SiriInformationUIPlugin(uint64_t *a1)
{
  uint64_t v2 = type metadata accessor for KnowledgeFallbackConfirmationView();
  __chkstk_darwin();
  v4 = (uint64_t *)((char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = *a1;
  uint64_t v5 = a1[1];
  uint64_t v8 = a1[2];
  uint64_t v7 = a1[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  InteractionDelegate.init()();
  uint64_t v9 = (void *)((char *)v4 + *(int *)(v2 + 32));
  type metadata accessor for Context();
  lazy protocol witness table accessor for type Context and conformance Context(&lazy protocol witness table cache variable for type Context and conformance Context, (void (*)(uint64_t))&type metadata accessor for Context);
  *uint64_t v9 = EnvironmentObject.init()();
  v9[1] = v10;
  void *v4 = v6;
  v4[1] = v5;
  v4[2] = v8;
  v4[3] = v7;
  v4[4] = static InvocationFactory.makeConfirmAndRejectActions()();
  v4[5] = v11;
  lazy protocol witness table accessor for type Context and conformance Context(&lazy protocol witness table cache variable for type KnowledgeFallbackConfirmationView and conformance KnowledgeFallbackConfirmationView, (void (*)(uint64_t))type metadata accessor for KnowledgeFallbackConfirmationView);
  uint64_t v12 = View.eraseToAnyView()();
  outlined destroy of KnowledgeFallbackConfirmationView((uint64_t)v4);
  return v12;
}

uint64_t KnowledgeFallbackConfirmationView.snippetModel.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v1;
}

id KnowledgeFallbackConfirmationView.skeConfirmAction.getter()
{
  return *(id *)(v0 + 32);
}

id KnowledgeFallbackConfirmationView.skeRejectAction.getter()
{
  return *(id *)(v0 + 40);
}

uint64_t variable initialization expression of KnowledgeFallbackConfirmationView._context()
{
  type metadata accessor for Context();
  lazy protocol witness table accessor for type Context and conformance Context(&lazy protocol witness table cache variable for type Context and conformance Context, (void (*)(uint64_t))&type metadata accessor for Context);

  return EnvironmentObject.init()();
}

uint64_t KnowledgeFallbackConfirmationView.body.getter()
{
  uint64_t v1 = *(void *)(type metadata accessor for KnowledgeFallbackConfirmationView() - 8);
  uint64_t v2 = *(void *)(v1 + 64);
  __chkstk_darwin();
  outlined init with copy of KnowledgeFallbackConfirmationView(v0, (uint64_t)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v3 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v4 = swift_allocObject();
  outlined init with take of KnowledgeFallbackConfirmationView((uint64_t)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0), v4 + v3);
  type metadata accessor for BinaryButtonView();
  lazy protocol witness table accessor for type Context and conformance Context(&lazy protocol witness table cache variable for type BinaryButtonView and conformance BinaryButtonView, (void (*)(uint64_t))&type metadata accessor for BinaryButtonView);
  return ComponentStack.init(content:)();
}

uint64_t closure #1 in KnowledgeFallbackConfirmationView.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v34 = a2;
  uint64_t v33 = type metadata accessor for ButtonItemButtonStyle.Role();
  uint64_t v3 = *(void *)(v33 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void *)(type metadata accessor for KnowledgeFallbackConfirmationView() - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  __chkstk_darwin();
  uint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Button<Text>);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin();
  uint64_t v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.buttonRole(_:)>>.0);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v31 = v13;
  uint64_t v32 = v14;
  __chkstk_darwin();
  uint64_t v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = a1;
  outlined init with copy of KnowledgeFallbackConfirmationView(a1, (uint64_t)v8);
  uint64_t v17 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v30 = ((v17 + 16) & ~v17) + v7;
  uint64_t v18 = (v17 + 16) & ~v17;
  uint64_t v29 = v17 | 7;
  uint64_t v19 = swift_allocObject();
  outlined init with take of KnowledgeFallbackConfirmationView((uint64_t)v8, v19 + v18);
  uint64_t v36 = a1;
  Button.init(action:label:)();
  uint64_t v20 = v33;
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for ButtonItemButtonStyle.Role.preferred(_:), v33);
  uint64_t v21 = lazy protocol witness table accessor for type ComponentStack<BinaryButtonView> and conformance ComponentStack<A>(&lazy protocol witness table cache variable for type Button<Text> and conformance Button<A>, &demangling cache variable for type metadata for Button<Text>);
  View.buttonRole(_:)();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v20);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  uint64_t v38 = v9;
  uint64_t v39 = v21;
  swift_getOpaqueTypeConformance2();
  uint64_t v22 = v31;
  uint64_t v23 = View.eraseToAnyView()();
  (*(void (**)(char *, uint64_t))(v32 + 8))(v16, v22);
  v40 = &type metadata for AnyView;
  v41 = &protocol witness table for AnyView;
  uint64_t v38 = v23;
  uint64_t v24 = v28;
  outlined init with copy of KnowledgeFallbackConfirmationView(v28, (uint64_t)v8);
  uint64_t v25 = swift_allocObject();
  outlined init with take of KnowledgeFallbackConfirmationView((uint64_t)v8, v25 + v18);
  uint64_t v35 = v24;
  v37[3] = v9;
  v37[4] = lazy protocol witness table accessor for type ComponentStack<BinaryButtonView> and conformance ComponentStack<A>(&lazy protocol witness table cache variable for type Button<Text> and conformance Button<A>, &demangling cache variable for type metadata for Button<Text>);
  __swift_allocate_boxed_opaque_existential_1(v37);
  Button.init(action:label:)();
  return BinaryButtonView.init(primaryButton:secondaryButton:)();
}

uint64_t outlined init with copy of KnowledgeFallbackConfirmationView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for KnowledgeFallbackConfirmationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with take of KnowledgeFallbackConfirmationView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for KnowledgeFallbackConfirmationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t lazy protocol witness table accessor for type Context and conformance Context(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t lazy protocol witness table accessor for type SiriInformationDataModels and conformance SiriInformationDataModels()
{
  unint64_t result = lazy protocol witness table cache variable for type SiriInformationDataModels and conformance SiriInformationDataModels;
  if (!lazy protocol witness table cache variable for type SiriInformationDataModels and conformance SiriInformationDataModels)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SiriInformationDataModels and conformance SiriInformationDataModels);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SiriInformationDataModels and conformance SiriInformationDataModels;
  if (!lazy protocol witness table cache variable for type SiriInformationDataModels and conformance SiriInformationDataModels)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SiriInformationDataModels and conformance SiriInformationDataModels);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SiriInformationDataModels and conformance SiriInformationDataModels;
  if (!lazy protocol witness table cache variable for type SiriInformationDataModels and conformance SiriInformationDataModels)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SiriInformationDataModels and conformance SiriInformationDataModels);
  }
  return result;
}

uint64_t associated type witness table accessor for View.Body : View in KnowledgeFallbackConfirmationView()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t KnowledgeFallbackConfirmationView.yesAction()()
{
  uint64_t v1 = type metadata accessor for InteractionDelegateWrapper();
  uint64_t v25 = *(void *)(v1 - 8);
  uint64_t v26 = v1;
  __chkstk_darwin();
  uint64_t v24 = (char *)v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ComponentType?);
  __chkstk_darwin();
  uint64_t v4 = (char *)v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for InteractionType();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v8 = (char *)v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Command();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin();
  uint64_t v12 = (char *)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = type metadata accessor for KnowledgeFallbackConfirmationView();
  uint64_t v13 = *(void **)(v0 + *(int *)(v23 + 32));
  if (v13)
  {
    v22[1] = v0;
    uint64_t v14 = *(void **)(v0 + 32);
    *(void *)uint64_t v12 = v14;
    v12[8] = 0;
    (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, enum case for Command.directInvocation(_:), v9);
    (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for InteractionType.buttonTapped(_:), v5);
    id v15 = v13;
    id v16 = v14;
    static ComponentType.customCanvas.getter();
    uint64_t v17 = type metadata accessor for ComponentType();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v4, 0, 1, v17);
    id v18 = objc_allocWithZone((Class)type metadata accessor for RFInteractionPerformed());
    uint64_t v19 = (void *)RFInteractionPerformed.init(actionName:command:interactionType:componentType:componentName:componentIndex:)();
    dispatch thunk of Context.emit(_:)();

    uint64_t v20 = v24;
    InteractionDelegate.wrappedValue.getter();
    InteractionDelegateWrapper.perform(directInvocation:)();
    return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v20, v26);
  }
  else
  {
    type metadata accessor for Context();
    lazy protocol witness table accessor for type Context and conformance Context(&lazy protocol witness table cache variable for type Context and conformance Context, (void (*)(uint64_t))&type metadata accessor for Context);
    uint64_t result = EnvironmentObject.error()();
    __break(1u);
  }
  return result;
}

uint64_t closure #1 in closure #1 in KnowledgeFallbackConfirmationView.body.getter@<X0>(uint64_t a1@<X8>)
{
  lazy protocol witness table accessor for type String and conformance String();
  swift_bridgeObjectRetain();
  uint64_t result = Text.init<A>(_:)();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t KnowledgeFallbackConfirmationView.noAction()()
{
  uint64_t v1 = type metadata accessor for InteractionDelegateWrapper();
  uint64_t v25 = *(void *)(v1 - 8);
  uint64_t v26 = v1;
  __chkstk_darwin();
  uint64_t v24 = (char *)v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ComponentType?);
  __chkstk_darwin();
  char v4 = (char *)v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for InteractionType();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v8 = (char *)v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Command();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin();
  uint64_t v12 = (char *)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = type metadata accessor for KnowledgeFallbackConfirmationView();
  uint64_t v13 = *(void **)(v0 + *(int *)(v23 + 32));
  if (v13)
  {
    v22[1] = v0;
    uint64_t v14 = *(void **)(v0 + 40);
    *(void *)uint64_t v12 = v14;
    v12[8] = 0;
    (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, enum case for Command.directInvocation(_:), v9);
    (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for InteractionType.buttonTapped(_:), v5);
    id v15 = v13;
    id v16 = v14;
    static ComponentType.customCanvas.getter();
    uint64_t v17 = type metadata accessor for ComponentType();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v4, 0, 1, v17);
    id v18 = objc_allocWithZone((Class)type metadata accessor for RFInteractionPerformed());
    uint64_t v19 = (void *)RFInteractionPerformed.init(actionName:command:interactionType:componentType:componentName:componentIndex:)();
    dispatch thunk of Context.emit(_:)();

    uint64_t v20 = v24;
    InteractionDelegate.wrappedValue.getter();
    InteractionDelegateWrapper.perform(directInvocation:)();
    return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v20, v26);
  }
  else
  {
    type metadata accessor for Context();
    lazy protocol witness table accessor for type Context and conformance Context(&lazy protocol witness table cache variable for type Context and conformance Context, (void (*)(uint64_t))&type metadata accessor for Context);
    uint64_t result = EnvironmentObject.error()();
    __break(1u);
  }
  return result;
}

uint64_t closure #2 in closure #1 in KnowledgeFallbackConfirmationView.body.getter@<X0>(uint64_t a1@<X8>)
{
  lazy protocol witness table accessor for type String and conformance String();
  swift_bridgeObjectRetain();
  uint64_t result = Text.init<A>(_:)();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t protocol witness for static View._makeView(view:inputs:) in conformance KnowledgeFallbackConfirmationView()
{
  return static View._makeView(view:inputs:)();
}

uint64_t protocol witness for static View._makeViewList(view:inputs:) in conformance KnowledgeFallbackConfirmationView()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t protocol witness for static View._viewListCount(inputs:) in conformance KnowledgeFallbackConfirmationView()
{
  return static View._viewListCount(inputs:)();
}

uint64_t protocol witness for View.body.getter in conformance KnowledgeFallbackConfirmationView(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  __chkstk_darwin();
  outlined init with copy of KnowledgeFallbackConfirmationView(v1, (uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = swift_allocObject();
  outlined init with take of KnowledgeFallbackConfirmationView((uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v5 + v4);
  type metadata accessor for BinaryButtonView();
  lazy protocol witness table accessor for type Context and conformance Context(&lazy protocol witness table cache variable for type BinaryButtonView and conformance BinaryButtonView, (void (*)(uint64_t))&type metadata accessor for BinaryButtonView);
  return ComponentStack.init(content:)();
}

uint64_t type metadata accessor for SiriInformationUIPlugin()
{
  return self;
}

uint64_t *initializeBufferWithCopyOfBuffer for KnowledgeFallbackConfirmationView(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v22 = *a2;
    uint64_t *v4 = *a2;
    unint64_t v4 = (uint64_t *)(v22 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    uint64_t v9 = (void *)a2[4];
    uint64_t v10 = (void *)a2[5];
    uint64_t v11 = *(int *)(a3 + 28);
    uint64_t v24 = (char *)a2 + v11;
    uint64_t v25 = (char *)a1 + v11;
    a1[4] = (uint64_t)v9;
    a1[5] = (uint64_t)v10;
    uint64_t v12 = type metadata accessor for InteractionDelegate();
    uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v14 = v9;
    id v15 = v10;
    v13(v25, v24, v12);
    uint64_t v16 = *(int *)(a3 + 32);
    uint64_t v17 = (uint64_t *)((char *)v4 + v16);
    id v18 = (char *)a2 + v16;
    uint64_t v20 = *(void **)v18;
    uint64_t v19 = *((void *)v18 + 1);
    *uint64_t v17 = v20;
    v17[1] = v19;
    id v21 = v20;
  }
  return v4;
}

void destroy for KnowledgeFallbackConfirmationView(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = type metadata accessor for InteractionDelegate();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = *(void **)(a1 + *(int *)(a2 + 32));
}

void *initializeWithCopy for KnowledgeFallbackConfirmationView(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  uint64_t v8 = (void *)a2[4];
  uint64_t v9 = (void *)a2[5];
  uint64_t v10 = *(int *)(a3 + 28);
  uint64_t v22 = (char *)a2 + v10;
  uint64_t v23 = (char *)a1 + v10;
  a1[4] = v8;
  a1[5] = v9;
  uint64_t v11 = type metadata accessor for InteractionDelegate();
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v13 = v8;
  id v14 = v9;
  v12(v23, v22, v11);
  uint64_t v15 = *(int *)(a3 + 32);
  uint64_t v16 = (void *)((char *)a1 + v15);
  uint64_t v17 = (char *)a2 + v15;
  uint64_t v19 = *(void **)v17;
  uint64_t v18 = *((void *)v17 + 1);
  *uint64_t v16 = v19;
  v16[1] = v18;
  id v20 = v19;
  return a1;
}

void *assignWithCopy for KnowledgeFallbackConfirmationView(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = (void *)a2[4];
  uint64_t v7 = (void *)a1[4];
  a1[4] = v6;
  id v8 = v6;

  uint64_t v9 = (void *)a2[5];
  uint64_t v10 = (void *)a1[5];
  a1[5] = v9;
  id v11 = v9;

  uint64_t v12 = *(int *)(a3 + 28);
  id v13 = (char *)a1 + v12;
  id v14 = (char *)a2 + v12;
  uint64_t v15 = type metadata accessor for InteractionDelegate();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 24))(v13, v14, v15);
  uint64_t v16 = *(int *)(a3 + 32);
  uint64_t v17 = (void *)((char *)a1 + v16);
  uint64_t v18 = (char *)a2 + v16;
  uint64_t v19 = *(void **)((char *)a1 + v16);
  id v20 = *(void **)v18;
  *uint64_t v17 = *(void *)v18;
  id v21 = v20;

  v17[1] = *((void *)v18 + 1);
  return a1;
}

_OWORD *initializeWithTake for KnowledgeFallbackConfirmationView(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  a1[2] = a2[2];
  uint64_t v7 = *(int *)(a3 + 28);
  id v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for InteractionDelegate();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 32)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 32));
  return a1;
}

void *assignWithTake for KnowledgeFallbackConfirmationView(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  id v8 = (void *)a1[4];
  a1[4] = a2[4];

  uint64_t v9 = (void *)a1[5];
  a1[5] = a2[5];

  uint64_t v10 = *(int *)(a3 + 28);
  id v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = type metadata accessor for InteractionDelegate();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 40))(v11, v12, v13);
  uint64_t v14 = *(int *)(a3 + 32);
  uint64_t v15 = (void *)((char *)a1 + v14);
  uint64_t v16 = (void *)((char *)a2 + v14);
  uint64_t v17 = *(void **)((char *)a1 + v14);
  *uint64_t v15 = *v16;

  v15[1] = v16[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for KnowledgeFallbackConfirmationView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_48A0);
}

uint64_t sub_48A0(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = type metadata accessor for InteractionDelegate();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for KnowledgeFallbackConfirmationView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_4964);
}

uint64_t sub_4964(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for InteractionDelegate();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata completion function for KnowledgeFallbackConfirmationView()
{
  uint64_t result = type metadata accessor for InteractionDelegate();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_4ABC()
{
  return lazy protocol witness table accessor for type ComponentStack<BinaryButtonView> and conformance ComponentStack<A>(&lazy protocol witness table cache variable for type ComponentStack<BinaryButtonView> and conformance ComponentStack<A>, &demangling cache variable for type metadata for ComponentStack<BinaryButtonView>);
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

uint64_t partial apply for closure #1 in KnowledgeFallbackConfirmationView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for KnowledgeFallbackConfirmationView() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return closure #1 in KnowledgeFallbackConfirmationView.body.getter(v4, a1);
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

uint64_t partial apply for implicit closure #2 in implicit closure #1 in closure #1 in KnowledgeFallbackConfirmationView.body.getter()
{
  return partial apply for implicit closure #2 in implicit closure #1 in closure #1 in KnowledgeFallbackConfirmationView.body.getter(KnowledgeFallbackConfirmationView.yesAction());
}

uint64_t partial apply for closure #1 in closure #1 in KnowledgeFallbackConfirmationView.body.getter@<X0>(uint64_t a1@<X8>)
{
  return closure #1 in closure #1 in KnowledgeFallbackConfirmationView.body.getter(a1);
}

uint64_t objectdestroyTm()
{
  uint64_t v1 = (int *)(type metadata accessor for KnowledgeFallbackConfirmationView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v7 = v6 + v1[9];
  uint64_t v8 = type metadata accessor for InteractionDelegate();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);

  return _swift_deallocObject(v0, v4, v5);
}

uint64_t partial apply for implicit closure #4 in implicit closure #3 in closure #1 in KnowledgeFallbackConfirmationView.body.getter()
{
  return partial apply for implicit closure #2 in implicit closure #1 in closure #1 in KnowledgeFallbackConfirmationView.body.getter(KnowledgeFallbackConfirmationView.noAction());
}

uint64_t partial apply for implicit closure #2 in implicit closure #1 in closure #1 in KnowledgeFallbackConfirmationView.body.getter(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t partial apply for closure #2 in closure #1 in KnowledgeFallbackConfirmationView.body.getter@<X0>(uint64_t a1@<X8>)
{
  return closure #2 in closure #1 in KnowledgeFallbackConfirmationView.body.getter(a1);
}

uint64_t lazy protocol witness table accessor for type ComponentStack<BinaryButtonView> and conformance ComponentStack<A>(unint64_t *a1, uint64_t *a2)
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

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
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

void *SiriInformationDataModels.bundleName.unsafeMutableAddressor()
{
  return &static SiriInformationDataModels.bundleName;
}

unint64_t static SiriInformationDataModels.bundleName.getter()
{
  return 0xD000000000000017;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance SiriInformationDataModels.CodingKeys()
{
  return 1;
}

void protocol witness for Hashable.hash(into:) in conformance SiriInformationDataModels.CodingKeys()
{
}

unint64_t protocol witness for CodingKey.stringValue.getter in conformance SiriInformationDataModels.CodingKeys()
{
  return 0xD00000000000001DLL;
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance SiriInformationDataModels.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized SiriInformationDataModels.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance SiriInformationDataModels.CodingKeys()
{
  return 0;
}

void protocol witness for CodingKey.init(intValue:) in conformance SiriInformationDataModels.CodingKeys(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SiriInformationDataModels.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SiriInformationDataModels.CodingKeys and conformance SiriInformationDataModels.CodingKeys();

  return CodingKey.description.getter(a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SiriInformationDataModels.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SiriInformationDataModels.CodingKeys and conformance SiriInformationDataModels.CodingKeys();

  return CodingKey.debugDescription.getter(a1, v2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance SiriInformationDataModels.CodingKeys()
{
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance SiriInformationDataModels.CodingKeys()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance SiriInformationDataModels.KnowledgeFallbackConfirmationCodingKeys()
{
  return 12383;
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance SiriInformationDataModels.KnowledgeFallbackConfirmationCodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SiriInformationDataModels.KnowledgeFallbackConfirmationCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SiriInformationDataModels.KnowledgeFallbackConfirmationCodingKeys and conformance SiriInformationDataModels.KnowledgeFallbackConfirmationCodingKeys();

  return CodingKey.description.getter(a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SiriInformationDataModels.KnowledgeFallbackConfirmationCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SiriInformationDataModels.KnowledgeFallbackConfirmationCodingKeys and conformance SiriInformationDataModels.KnowledgeFallbackConfirmationCodingKeys();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t SiriInformationDataModels.encode(to:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v17 = a4;
  uint64_t v18 = a5;
  uint64_t v15 = a2;
  uint64_t v16 = a3;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<SiriInformationDataModels.KnowledgeFallbackConfirmationCodingKeys>);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<SiriInformationDataModels.CodingKeys>);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin();
  uint64_t v13 = (char *)&v15 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type SiriInformationDataModels.CodingKeys and conformance SiriInformationDataModels.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  lazy protocol witness table accessor for type SiriInformationDataModels.KnowledgeFallbackConfirmationCodingKeys and conformance SiriInformationDataModels.KnowledgeFallbackConfirmationCodingKeys();
  KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
  uint64_t v19 = v15;
  uint64_t v20 = v16;
  uint64_t v21 = v17;
  uint64_t v22 = v18;
  lazy protocol witness table accessor for type KnowledgeFallbackConfirmationPayload and conformance KnowledgeFallbackConfirmationPayload();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t lazy protocol witness table accessor for type SiriInformationDataModels.CodingKeys and conformance SiriInformationDataModels.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type SiriInformationDataModels.CodingKeys and conformance SiriInformationDataModels.CodingKeys;
  if (!lazy protocol witness table cache variable for type SiriInformationDataModels.CodingKeys and conformance SiriInformationDataModels.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SiriInformationDataModels.CodingKeys and conformance SiriInformationDataModels.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SiriInformationDataModels.CodingKeys and conformance SiriInformationDataModels.CodingKeys;
  if (!lazy protocol witness table cache variable for type SiriInformationDataModels.CodingKeys and conformance SiriInformationDataModels.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SiriInformationDataModels.CodingKeys and conformance SiriInformationDataModels.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SiriInformationDataModels.CodingKeys and conformance SiriInformationDataModels.CodingKeys;
  if (!lazy protocol witness table cache variable for type SiriInformationDataModels.CodingKeys and conformance SiriInformationDataModels.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SiriInformationDataModels.CodingKeys and conformance SiriInformationDataModels.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SiriInformationDataModels.CodingKeys and conformance SiriInformationDataModels.CodingKeys;
  if (!lazy protocol witness table cache variable for type SiriInformationDataModels.CodingKeys and conformance SiriInformationDataModels.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SiriInformationDataModels.CodingKeys and conformance SiriInformationDataModels.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SiriInformationDataModels.KnowledgeFallbackConfirmationCodingKeys and conformance SiriInformationDataModels.KnowledgeFallbackConfirmationCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type SiriInformationDataModels.KnowledgeFallbackConfirmationCodingKeys and conformance SiriInformationDataModels.KnowledgeFallbackConfirmationCodingKeys;
  if (!lazy protocol witness table cache variable for type SiriInformationDataModels.KnowledgeFallbackConfirmationCodingKeys and conformance SiriInformationDataModels.KnowledgeFallbackConfirmationCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SiriInformationDataModels.KnowledgeFallbackConfirmationCodingKeys and conformance SiriInformationDataModels.KnowledgeFallbackConfirmationCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SiriInformationDataModels.KnowledgeFallbackConfirmationCodingKeys and conformance SiriInformationDataModels.KnowledgeFallbackConfirmationCodingKeys;
  if (!lazy protocol witness table cache variable for type SiriInformationDataModels.KnowledgeFallbackConfirmationCodingKeys and conformance SiriInformationDataModels.KnowledgeFallbackConfirmationCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SiriInformationDataModels.KnowledgeFallbackConfirmationCodingKeys and conformance SiriInformationDataModels.KnowledgeFallbackConfirmationCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SiriInformationDataModels.KnowledgeFallbackConfirmationCodingKeys and conformance SiriInformationDataModels.KnowledgeFallbackConfirmationCodingKeys;
  if (!lazy protocol witness table cache variable for type SiriInformationDataModels.KnowledgeFallbackConfirmationCodingKeys and conformance SiriInformationDataModels.KnowledgeFallbackConfirmationCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SiriInformationDataModels.KnowledgeFallbackConfirmationCodingKeys and conformance SiriInformationDataModels.KnowledgeFallbackConfirmationCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SiriInformationDataModels.KnowledgeFallbackConfirmationCodingKeys and conformance SiriInformationDataModels.KnowledgeFallbackConfirmationCodingKeys;
  if (!lazy protocol witness table cache variable for type SiriInformationDataModels.KnowledgeFallbackConfirmationCodingKeys and conformance SiriInformationDataModels.KnowledgeFallbackConfirmationCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SiriInformationDataModels.KnowledgeFallbackConfirmationCodingKeys and conformance SiriInformationDataModels.KnowledgeFallbackConfirmationCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type KnowledgeFallbackConfirmationPayload and conformance KnowledgeFallbackConfirmationPayload()
{
  unint64_t result = lazy protocol witness table cache variable for type KnowledgeFallbackConfirmationPayload and conformance KnowledgeFallbackConfirmationPayload;
  if (!lazy protocol witness table cache variable for type KnowledgeFallbackConfirmationPayload and conformance KnowledgeFallbackConfirmationPayload)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type KnowledgeFallbackConfirmationPayload and conformance KnowledgeFallbackConfirmationPayload);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type KnowledgeFallbackConfirmationPayload and conformance KnowledgeFallbackConfirmationPayload;
  if (!lazy protocol witness table cache variable for type KnowledgeFallbackConfirmationPayload and conformance KnowledgeFallbackConfirmationPayload)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type KnowledgeFallbackConfirmationPayload and conformance KnowledgeFallbackConfirmationPayload);
  }
  return result;
}

uint64_t SiriInformationDataModels.init(from:)(uint64_t a1)
{
  return SiriInformationDataModels.init(from:)(a1, (uint64_t (*)(void))specialized SiriInformationDataModels.init(from:));
}

uint64_t protocol witness for SnippetPluginModel.snippetHidden(for:idiom:) in conformance SiriInformationDataModels()
{
  return SnippetPluginModel.snippetHidden(for:idiom:)();
}

void *protocol witness for Decodable.init(from:) in conformance SiriInformationDataModels@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  unint64_t result = specialized SiriInformationDataModels.init(from:)(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }
  return result;
}

uint64_t protocol witness for Encodable.encode(to:) in conformance SiriInformationDataModels(void *a1)
{
  return SiriInformationDataModels.encode(to:)(a1, *v1, v1[1], v1[2], v1[3]);
}

uint64_t KnowledgeFallbackConfirmationPayload.yesLabel.getter(uint64_t a1)
{
  return a1;
}

uint64_t KnowledgeFallbackConfirmationPayload.noLabel.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance KnowledgeFallbackConfirmationPayload.CodingKeys(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance KnowledgeFallbackConfirmationPayload.CodingKeys()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance KnowledgeFallbackConfirmationPayload.CodingKeys()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance KnowledgeFallbackConfirmationPayload.CodingKeys()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance KnowledgeFallbackConfirmationPayload.CodingKeys()
{
  if (*v0) {
    return 0x6C6562614C6F6ELL;
  }
  else {
    return 0x6C6562614C736579;
  }
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance KnowledgeFallbackConfirmationPayload.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized KnowledgeFallbackConfirmationPayload.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

void protocol witness for CodingKey.init(intValue:) in conformance KnowledgeFallbackConfirmationPayload.CodingKeys(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance KnowledgeFallbackConfirmationPayload.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type KnowledgeFallbackConfirmationPayload.CodingKeys and conformance KnowledgeFallbackConfirmationPayload.CodingKeys();

  return CodingKey.description.getter(a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance KnowledgeFallbackConfirmationPayload.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type KnowledgeFallbackConfirmationPayload.CodingKeys and conformance KnowledgeFallbackConfirmationPayload.CodingKeys();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t KnowledgeFallbackConfirmationPayload.encode(to:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v13[0] = a4;
  v13[1] = a5;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<KnowledgeFallbackConfirmationPayload.CodingKeys>);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  uint64_t v11 = (char *)v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type KnowledgeFallbackConfirmationPayload.CodingKeys and conformance KnowledgeFallbackConfirmationPayload.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  char v15 = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v5)
  {
    char v14 = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

uint64_t KnowledgeFallbackConfirmationPayload.init(from:)(uint64_t a1)
{
  return SiriInformationDataModels.init(from:)(a1, (uint64_t (*)(void))specialized KnowledgeFallbackConfirmationPayload.init(from:));
}

uint64_t SiriInformationDataModels.init(from:)(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t result = a2();
  if (v2) {
    return v4;
  }
  return result;
}

uint64_t protocol witness for Decodable.init(from:) in conformance KnowledgeFallbackConfirmationPayload@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = specialized KnowledgeFallbackConfirmationPayload.init(from:)(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }
  return result;
}

uint64_t protocol witness for Encodable.encode(to:) in conformance KnowledgeFallbackConfirmationPayload(void *a1)
{
  return KnowledgeFallbackConfirmationPayload.encode(to:)(a1, *v1, v1[1], v1[2], v1[3]);
}

uint64_t specialized SiriInformationDataModels.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD00000000000001DLL && a2 == 0x80000000000078C0)
  {
    swift_bridgeObjectRelease();
    char v2 = 0;
  }
  else
  {
    char v3 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    char v2 = v3 ^ 1;
  }
  return v2 & 1;
}

void *specialized SiriInformationDataModels.init(from:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<SiriInformationDataModels.KnowledgeFallbackConfirmationCodingKeys>);
  uint64_t v20 = *(void *)(v3 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<SiriInformationDataModels.CodingKeys>);
  uint64_t v6 = *(void *)(v22 - 8);
  __chkstk_darwin();
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type SiriInformationDataModels.CodingKeys and conformance SiriInformationDataModels.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v1) {
    goto LABEL_5;
  }
  uint64_t v18 = a1;
  uint64_t v19 = v6;
  uint64_t v10 = v22;
  if (*(void *)(KeyedDecodingContainer.allKeys.getter() + 16) != 1)
  {
    uint64_t v12 = v10;
    uint64_t v13 = type metadata accessor for DecodingError();
    swift_allocError();
    char v15 = v14;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (@thick Any.Type, DecodingError.Context));
    *char v15 = &type metadata for SiriInformationDataModels;
    uint64_t v9 = v8;
    KeyedDecodingContainer.codingPath.getter();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v13 - 8) + 104))(v15, enum case for DecodingError.typeMismatch(_:), v13);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v8, v12);
    a1 = v18;
LABEL_5:
    __swift_destroy_boxed_opaque_existential_1(a1);
    return v9;
  }
  lazy protocol witness table accessor for type SiriInformationDataModels.KnowledgeFallbackConfirmationCodingKeys and conformance SiriInformationDataModels.KnowledgeFallbackConfirmationCodingKeys();
  KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
  uint64_t v11 = v19;
  lazy protocol witness table accessor for type KnowledgeFallbackConfirmationPayload and conformance KnowledgeFallbackConfirmationPayload();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v5, v3);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
  uint64_t v9 = v21;
  __swift_destroy_boxed_opaque_existential_1(v18);
  return v9;
}

unint64_t lazy protocol witness table accessor for type KnowledgeFallbackConfirmationPayload.CodingKeys and conformance KnowledgeFallbackConfirmationPayload.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type KnowledgeFallbackConfirmationPayload.CodingKeys and conformance KnowledgeFallbackConfirmationPayload.CodingKeys;
  if (!lazy protocol witness table cache variable for type KnowledgeFallbackConfirmationPayload.CodingKeys and conformance KnowledgeFallbackConfirmationPayload.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type KnowledgeFallbackConfirmationPayload.CodingKeys and conformance KnowledgeFallbackConfirmationPayload.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type KnowledgeFallbackConfirmationPayload.CodingKeys and conformance KnowledgeFallbackConfirmationPayload.CodingKeys;
  if (!lazy protocol witness table cache variable for type KnowledgeFallbackConfirmationPayload.CodingKeys and conformance KnowledgeFallbackConfirmationPayload.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type KnowledgeFallbackConfirmationPayload.CodingKeys and conformance KnowledgeFallbackConfirmationPayload.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type KnowledgeFallbackConfirmationPayload.CodingKeys and conformance KnowledgeFallbackConfirmationPayload.CodingKeys;
  if (!lazy protocol witness table cache variable for type KnowledgeFallbackConfirmationPayload.CodingKeys and conformance KnowledgeFallbackConfirmationPayload.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type KnowledgeFallbackConfirmationPayload.CodingKeys and conformance KnowledgeFallbackConfirmationPayload.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type KnowledgeFallbackConfirmationPayload.CodingKeys and conformance KnowledgeFallbackConfirmationPayload.CodingKeys;
  if (!lazy protocol witness table cache variable for type KnowledgeFallbackConfirmationPayload.CodingKeys and conformance KnowledgeFallbackConfirmationPayload.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type KnowledgeFallbackConfirmationPayload.CodingKeys and conformance KnowledgeFallbackConfirmationPayload.CodingKeys);
  }
  return result;
}

uint64_t specialized KnowledgeFallbackConfirmationPayload.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6C6562614C736579 && a2 == 0xE800000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6C6562614C6F6ELL && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t specialized KnowledgeFallbackConfirmationPayload.init(from:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<KnowledgeFallbackConfirmationPayload.CodingKeys>);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  char v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type KnowledgeFallbackConfirmationPayload.CodingKeys and conformance KnowledgeFallbackConfirmationPayload.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1(a1);
  }
  else
  {
    char v11 = 0;
    uint64_t v7 = KeyedDecodingContainer.decode(_:forKey:)();
    char v10 = 1;
    swift_bridgeObjectRetain();
    KeyedDecodingContainer.decode(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1(a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v7;
}

uint64_t initializeBufferWithCopyOfBuffer for SiriInformationDataModels(uint64_t *a1, uint64_t *a2)
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

uint64_t getEnumTag for SiriInformationDataModels()
{
  return 0;
}

ValueMetadata *type metadata accessor for SiriInformationDataModels()
{
  return &type metadata for SiriInformationDataModels;
}

uint64_t destroy for SiriInformationDataModels()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for SiriInformationDataModels(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for SiriInformationDataModels(void *a1, void *a2)
{
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

void *assignWithTake for SiriInformationDataModels(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriInformationDataModels(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriInformationDataModels(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for KnowledgeFallbackConfirmationPayload()
{
  return &type metadata for KnowledgeFallbackConfirmationPayload;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for KnowledgeFallbackConfirmationPayload.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for KnowledgeFallbackConfirmationPayload.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x6550);
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

uint64_t getEnumTag for KnowledgeFallbackConfirmationPayload.CodingKeys(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *destructiveInjectEnumTag for KnowledgeFallbackConfirmationPayload.CodingKeys(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

void *type metadata accessor for KnowledgeFallbackConfirmationPayload.CodingKeys()
{
  return &unk_8830;
}

void *type metadata accessor for SiriInformationDataModels.CodingKeys()
{
  return &unk_88C0;
}

uint64_t getEnumTagSinglePayload for SiriInformationDataModels.CodingKeys(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for SiriInformationDataModels.CodingKeys(unsigned char *result, int a2, int a3)
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
        *__n128 result = a2;
        return result;
      case 2:
        *(_WORD *)__n128 result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)__n128 result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *__n128 result = 0;
      break;
    case 2:
      *(_WORD *)__n128 result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x66A4);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

void *type metadata accessor for SiriInformationDataModels.KnowledgeFallbackConfirmationCodingKeys()
{
  return &unk_8950;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return _swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t type metadata accessor for Command()
{
  return type metadata accessor for Command();
}

uint64_t static InvocationFactory.makeConfirmAndRejectActions()()
{
  return static InvocationFactory.makeConfirmAndRejectActions()();
}

uint64_t EnvironmentObject.error()()
{
  return EnvironmentObject.error()();
}

uint64_t EnvironmentObject.init()()
{
  return EnvironmentObject.init()();
}

uint64_t Text.init<A>(_:)()
{
  return Text.init<A>(_:)();
}

uint64_t View.eraseToAnyView()()
{
  return View.eraseToAnyView()();
}

uint64_t View.buttonRole(_:)()
{
  return View.buttonRole(_:)();
}

uint64_t static View._viewListCount(inputs:)()
{
  return static View._viewListCount(inputs:)();
}

uint64_t Button.init(action:label:)()
{
  return Button.init(action:label:)();
}

uint64_t type metadata accessor for ButtonItemButtonStyle.Role()
{
  return type metadata accessor for ButtonItemButtonStyle.Role();
}

uint64_t static ComponentType.customCanvas.getter()
{
  return static ComponentType.customCanvas.getter();
}

uint64_t type metadata accessor for ComponentType()
{
  return type metadata accessor for ComponentType();
}

uint64_t ComponentStack.init(content:)()
{
  return ComponentStack.init(content:)();
}

uint64_t type metadata accessor for InteractionType()
{
  return type metadata accessor for InteractionType();
}

uint64_t BinaryButtonView.init(primaryButton:secondaryButton:)()
{
  return BinaryButtonView.init(primaryButton:secondaryButton:)();
}

uint64_t type metadata accessor for BinaryButtonView()
{
  return type metadata accessor for BinaryButtonView();
}

uint64_t InteractionDelegate.wrappedValue.getter()
{
  return InteractionDelegate.wrappedValue.getter();
}

uint64_t InteractionDelegate.init()()
{
  return InteractionDelegate.init()();
}

uint64_t type metadata accessor for InteractionDelegate()
{
  return type metadata accessor for InteractionDelegate();
}

uint64_t RFInteractionPerformed.init(actionName:command:interactionType:componentType:componentName:componentIndex:)()
{
  return RFInteractionPerformed.init(actionName:command:interactionType:componentType:componentName:componentIndex:)();
}

uint64_t type metadata accessor for RFInteractionPerformed()
{
  return type metadata accessor for RFInteractionPerformed();
}

uint64_t InteractionDelegateWrapper.perform(directInvocation:)()
{
  return InteractionDelegateWrapper.perform(directInvocation:)();
}

uint64_t type metadata accessor for InteractionDelegateWrapper()
{
  return type metadata accessor for InteractionDelegateWrapper();
}

uint64_t dispatch thunk of Context.emit(_:)()
{
  return dispatch thunk of Context.emit(_:)();
}

uint64_t type metadata accessor for Context()
{
  return type metadata accessor for Context();
}

uint64_t DecodingError.Context.init(codingPath:debugDescription:underlyingError:)()
{
  return DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
}

uint64_t type metadata accessor for DecodingError()
{
  return type metadata accessor for DecodingError();
}

uint64_t KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t KeyedDecodingContainer.codingPath.getter()
{
  return KeyedDecodingContainer.codingPath.getter();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t KeyedDecodingContainer.allKeys.getter()
{
  return KeyedDecodingContainer.allKeys.getter();
}

uint64_t KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
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

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
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

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}