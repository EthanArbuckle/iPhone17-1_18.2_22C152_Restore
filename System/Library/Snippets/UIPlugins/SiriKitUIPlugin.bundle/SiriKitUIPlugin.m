uint64_t SiriNeedsLocationAccessErrorView.model.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t);
  uint64_t vars8;

  v3 = v1 + *(int *)(type metadata accessor for SiriNeedsLocationAccessErrorView() + 20);
  type metadata accessor for SiriKitUIModel.SiriNeedsLocationAccessErrorModel();
  OUTLINED_FUNCTION_1();
  v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);

  return v6(a1, v3, v4);
}

uint64_t type metadata accessor for SiriNeedsLocationAccessErrorView()
{
  uint64_t result = type metadata singleton initialization cache for SiriNeedsLocationAccessErrorView;
  if (!type metadata singleton initialization cache for SiriNeedsLocationAccessErrorView) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t SiriNeedsLocationAccessErrorView.body.getter()
{
  uint64_t v1 = type metadata accessor for SiriNeedsLocationAccessErrorView();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  __chkstk_darwin(v1 - 8);
  outlined init with copy of SiriNeedsLocationAccessErrorView(v0, (uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = swift_allocObject();
  outlined init with take of SiriNeedsLocationAccessErrorView((uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v5 + v4);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>, _PaddingLayout>);
  lazy protocol witness table accessor for type ModifiedContent<HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>();
  return ComponentStack.init(content:)();
}

uint64_t closure #1 in SiriNeedsLocationAccessErrorView.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>);
  __chkstk_darwin(v4 - 8);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)v6 = static VerticalAlignment.center.getter();
  *((void *)v6 + 1) = 0;
  v6[16] = 1;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _VariadicView.Tree<_HStackLayout, TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>);
  closure #1 in SiriNeedsLocationAccessErrorView.button()(a1, &v6[*(int *)(v7 + 44)]);
  LOBYTE(a1) = static Edge.Set.vertical.getter();
  EdgeInsets.init(_all:)();
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  outlined init with copy of HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>((uint64_t)v6, a2);
  uint64_t v16 = a2
      + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>, _PaddingLayout>)
               + 36);
  *(unsigned char *)uint64_t v16 = a1;
  *(void *)(v16 + 8) = v9;
  *(void *)(v16 + 16) = v11;
  *(void *)(v16 + 24) = v13;
  *(void *)(v16 + 32) = v15;
  *(unsigned char *)(v16 + 40) = 0;
  return outlined destroy of HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>((uint64_t)v6, &demangling cache variable for type metadata for HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>);
}

uint64_t outlined init with copy of SiriNeedsLocationAccessErrorView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SiriNeedsLocationAccessErrorView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with take of SiriNeedsLocationAccessErrorView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SiriNeedsLocationAccessErrorView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t partial apply for closure #1 in SiriNeedsLocationAccessErrorView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for SiriNeedsLocationAccessErrorView();
  OUTLINED_FUNCTION_2(v3);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));

  return closure #1 in SiriNeedsLocationAccessErrorView.body.getter(v5, a1);
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

unint64_t lazy protocol witness table accessor for type ModifiedContent<HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result = lazy protocol witness table cache variable for type ModifiedContent<HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>, _PaddingLayout>);
    lazy protocol witness table accessor for type HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>> and conformance HStack<A>(&lazy protocol witness table cache variable for type HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>> and conformance HStack<A>, &demangling cache variable for type metadata for HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>);
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

uint64_t closure #1 in SiriNeedsLocationAccessErrorView.button()@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  v36 = a2;
  uint64_t v3 = type metadata accessor for RFButtonStyle();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v34 = v3;
  uint64_t v35 = v4;
  ((void (*)(void))__chkstk_darwin)();
  v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(type metadata accessor for SiriNeedsLocationAccessErrorView() - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Button<Label<Text, EmptyView>>);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v32 = v9;
  uint64_t v33 = v10;
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.buttonStyle<A>(_:)>>.0);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = ((uint64_t (*)(void))__chkstk_darwin)();
  v17 = (char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v19 = (char *)&v31 - v18;
  outlined init with copy of SiriNeedsLocationAccessErrorView(a1, (uint64_t)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v20 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v21 = swift_allocObject();
  outlined init with take of SiriNeedsLocationAccessErrorView((uint64_t)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v21 + v20);
  uint64_t v37 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Label<Text, EmptyView>);
  lazy protocol witness table accessor for type HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>> and conformance HStack<A>(&lazy protocol witness table cache variable for type Label<Text, EmptyView> and conformance Label<A, B>, &demangling cache variable for type metadata for Label<Text, EmptyView>);
  Button.init(action:label:)();
  static PrimitiveButtonStyle<>.rfButton.getter();
  lazy protocol witness table accessor for type HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>> and conformance HStack<A>(&lazy protocol witness table cache variable for type Button<Label<Text, EmptyView>> and conformance Button<A>, &demangling cache variable for type metadata for Button<Label<Text, EmptyView>>);
  lazy protocol witness table accessor for type RFButtonStyle and conformance RFButtonStyle();
  uint64_t v22 = v32;
  uint64_t v23 = v34;
  View.buttonStyle<A>(_:)();
  (*(void (**)(char *, uint64_t))(v35 + 8))(v6, v23);
  (*(void (**)(char *, uint64_t))(v33 + 8))(v12, v22);
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v19, v17, v13);
  v24 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
  v24(v17, v19, v13);
  v25 = v36;
  void *v36 = 0x403E000000000000;
  *((unsigned char *)v25 + 8) = 0;
  v26 = (char *)v25;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer));
  v24(&v26[*(int *)(v27 + 48)], v17, v13);
  v28 = &v26[*(int *)(v27 + 64)];
  *(void *)v28 = 0x403E000000000000;
  v28[8] = 0;
  v29 = *(void (**)(char *, uint64_t))(v14 + 8);
  v29(v19, v13);
  return ((uint64_t (*)(char *, uint64_t))v29)(v17, v13);
}

uint64_t closure #1 in closure #1 in SiriNeedsLocationAccessErrorView.button()()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for InteractionType?);
  __chkstk_darwin();
  uint64_t v1 = (char *)&v28 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ActionProperty?);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v28 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for Command();
  uint64_t v29 = *(void *)(v4 - 8);
  __chkstk_darwin();
  v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  __chkstk_darwin();
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for StandardActionHandler?);
  __chkstk_darwin();
  uint64_t v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for StandardActionHandler();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin();
  uint64_t v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  ActionHandler.wrappedValue.getter();
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11) == 1) {
    return outlined destroy of HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>((uint64_t)v10, &demangling cache variable for type metadata for StandardActionHandler?);
  }
  v28 = v1;
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v10, v11);
  id v16 = [objc_allocWithZone((Class)SAUIAppPunchOut) init];
  URL.init(string:)();
  uint64_t v17 = type metadata accessor for URL();
  v19 = 0;
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v17) != 1)
  {
    URL._bridgeToObjectiveC()(v18);
    v19 = v20;
    (*(void (**)(char *, uint64_t))(*(void *)(v17 - 8) + 8))(v8, v17);
  }
  [v16 setPunchOutUri:v19];

  *(void *)v6 = v16;
  v6[8] = 1;
  uint64_t v21 = v29;
  (*(void (**)(char *, void, uint64_t))(v29 + 104))(v6, enum case for Command.aceCommand(_:), v4);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<ActionElementConvertible>);
  uint64_t v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_AD90;
  *(void *)(v22 + 56) = v4;
  *(void *)(v22 + 64) = &protocol witness table for Command;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v22 + 32));
  (*(void (**)(uint64_t *, char *, uint64_t))(v21 + 16))(boxed_opaque_existential_1, v6, v4);
  id v24 = v16;
  ActionProperty.init(_:)();
  uint64_t v25 = type metadata accessor for ActionProperty();
  __swift_storeEnumTagSinglePayload((uint64_t)v3, 0, 1, v25);
  uint64_t v26 = type metadata accessor for InteractionType();
  uint64_t v27 = (uint64_t)v28;
  __swift_storeEnumTagSinglePayload((uint64_t)v28, 1, 1, v26);
  StandardActionHandler.perform(_:interactionType:)();

  outlined destroy of HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>(v27, &demangling cache variable for type metadata for InteractionType?);
  outlined destroy of HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>((uint64_t)v3, &demangling cache variable for type metadata for ActionProperty?);
  (*(void (**)(char *, uint64_t))(v21 + 8))(v6, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

uint64_t closure #2 in closure #1 in SiriNeedsLocationAccessErrorView.button()()
{
  return Label.init(title:icon:)();
}

uint64_t closure #1 in closure #2 in closure #1 in SiriNeedsLocationAccessErrorView.button()@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for SiriNeedsLocationAccessErrorView();
  SiriKitUIModel.SiriNeedsLocationAccessErrorModel.buttonLabel.getter();
  lazy protocol witness table accessor for type String and conformance String();
  uint64_t result = Text.init<A>(_:)();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t SiriNeedsLocationAccessErrorView.init(model:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  ActionHandler.init()();
  uint64_t v4 = a2 + *(int *)(type metadata accessor for SiriNeedsLocationAccessErrorView() + 20);
  type metadata accessor for SiriKitUIModel.SiriNeedsLocationAccessErrorModel();
  OUTLINED_FUNCTION_1();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 32);

  return v7(v4, a1, v5);
}

uint64_t protocol witness for static View._makeView(view:inputs:) in conformance SiriNeedsLocationAccessErrorView()
{
  return static View._makeView(view:inputs:)();
}

uint64_t protocol witness for static View._makeViewList(view:inputs:) in conformance SiriNeedsLocationAccessErrorView()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t protocol witness for static View._viewListCount(inputs:) in conformance SiriNeedsLocationAccessErrorView()
{
  return static View._viewListCount(inputs:)();
}

uint64_t variable initialization expression of LocationAccessPromptView.buttonTextBlue()
{
  id v0 = [self _carSystemFocusColor];

  return Color.init(uiColor:)();
}

uint64_t associated type witness table accessor for View.Body : View in SiriNeedsLocationAccessErrorView(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &opaque type descriptor for <<opaque return type of SiriNeedsLocationAccessErrorView.body>>, 1);
}

uint64_t *initializeBufferWithCopyOfBuffer for SiriNeedsLocationAccessErrorView(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for ActionHandler();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for SiriKitUIModel.SiriNeedsLocationAccessErrorModel();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t destroy for SiriNeedsLocationAccessErrorView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ActionHandler();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = type metadata accessor for SiriKitUIModel.SiriNeedsLocationAccessErrorModel();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);

  return v7(v5, v6);
}

uint64_t initializeWithCopy for SiriNeedsLocationAccessErrorView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for ActionHandler();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for SiriKitUIModel.SiriNeedsLocationAccessErrorModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t assignWithCopy for SiriNeedsLocationAccessErrorView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for ActionHandler();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for SiriKitUIModel.SiriNeedsLocationAccessErrorModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t initializeWithTake for SiriNeedsLocationAccessErrorView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for ActionHandler();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for SiriKitUIModel.SiriNeedsLocationAccessErrorModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t assignWithTake for SiriNeedsLocationAccessErrorView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for ActionHandler();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for SiriKitUIModel.SiriNeedsLocationAccessErrorModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriNeedsLocationAccessErrorView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_5BA0);
}

uint64_t sub_5BA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for ActionHandler();
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    uint64_t v8 = type metadata accessor for SiriKitUIModel.SiriNeedsLocationAccessErrorModel();
    uint64_t v9 = a1 + *(int *)(a3 + 20);
  }

  return __swift_getEnumTagSinglePayload(v9, a2, v8);
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for SiriNeedsLocationAccessErrorView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_5C58);
}

uint64_t sub_5C58(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  type metadata accessor for ActionHandler();
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    uint64_t v10 = type metadata accessor for SiriKitUIModel.SiriNeedsLocationAccessErrorModel();
    uint64_t v11 = a1 + *(int *)(a4 + 20);
  }

  return __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t type metadata completion function for SiriNeedsLocationAccessErrorView()
{
  uint64_t result = type metadata accessor for ActionHandler();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for SiriKitUIModel.SiriNeedsLocationAccessErrorModel();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_5DCC()
{
  return lazy protocol witness table accessor for type HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>> and conformance HStack<A>(&lazy protocol witness table cache variable for type ComponentStack<ModifiedContent<HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>, _PaddingLayout>> and conformance ComponentStack<A>, &demangling cache variable for type metadata for ComponentStack<ModifiedContent<HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>, _PaddingLayout>>);
}

uint64_t outlined init with copy of HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t objectdestroyTm()
{
  unint64_t v1 = (int *)(type metadata accessor for SiriNeedsLocationAccessErrorView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  type metadata accessor for ActionHandler();
  OUTLINED_FUNCTION_1();
  (*(void (**)(uint64_t))(v7 + 8))(v6);
  uint64_t v8 = v6 + v1[7];
  type metadata accessor for SiriKitUIModel.SiriNeedsLocationAccessErrorModel();
  OUTLINED_FUNCTION_1();
  (*(void (**)(uint64_t))(v9 + 8))(v8);

  return _swift_deallocObject(v0, v4, v5);
}

uint64_t partial apply for closure #1 in closure #1 in SiriNeedsLocationAccessErrorView.button()()
{
  uint64_t v0 = type metadata accessor for SiriNeedsLocationAccessErrorView();
  OUTLINED_FUNCTION_2(v0);

  return closure #1 in closure #1 in SiriNeedsLocationAccessErrorView.button()();
}

uint64_t partial apply for closure #2 in closure #1 in SiriNeedsLocationAccessErrorView.button()()
{
  return closure #2 in closure #1 in SiriNeedsLocationAccessErrorView.button()();
}

uint64_t lazy protocol witness table accessor for type HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>> and conformance HStack<A>(unint64_t *a1, uint64_t *a2)
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

unint64_t lazy protocol witness table accessor for type RFButtonStyle and conformance RFButtonStyle()
{
  unint64_t result = lazy protocol witness table cache variable for type RFButtonStyle and conformance RFButtonStyle;
  if (!lazy protocol witness table cache variable for type RFButtonStyle and conformance RFButtonStyle)
  {
    type metadata accessor for RFButtonStyle();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type RFButtonStyle and conformance RFButtonStyle);
  }
  return result;
}

uint64_t partial apply for closure #1 in closure #2 in closure #1 in SiriNeedsLocationAccessErrorView.button()@<X0>(uint64_t a1@<X8>)
{
  return closure #1 in closure #2 in closure #1 in SiriNeedsLocationAccessErrorView.button()(a1);
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

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  unint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t outlined destroy of HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_1();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

{
  void (*v3)(void);

  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5();
  v3();
  return a1;
}

uint64_t OUTLINED_FUNCTION_2(uint64_t a1)
{
  return a1 - 8;
}

uint64_t LocationAccessPromptView.model.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for LocationAccessPromptView() + 20);
  type metadata accessor for SiriKitUIModel.LocationAccessCarPlayPromptModel();
  OUTLINED_FUNCTION_1();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);

  return v6(a1, v3, v4);
}

uint64_t type metadata accessor for LocationAccessPromptView()
{
  uint64_t result = type metadata singleton initialization cache for LocationAccessPromptView;
  if (!type metadata singleton initialization cache for LocationAccessPromptView) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t LocationAccessPromptView.buttonTextBlue.getter()
{
  type metadata accessor for LocationAccessPromptView();

  return swift_retain();
}

uint64_t LocationAccessPromptView.body.getter()
{
  uint64_t v1 = type metadata accessor for LocationAccessPromptView();
  uint64_t v2 = OUTLINED_FUNCTION_3(v1);
  uint64_t v4 = v3;
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v2);
  outlined init with copy of LocationAccessPromptView(v0, (uint64_t)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v7 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v8 = swift_allocObject();
  outlined init with take of LocationAccessPromptView((uint64_t)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v8 + v7);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TupleView<(<<opaque return type of View.separators(_:isOverride:)>>.0, ModifiedContent<HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>, _PaddingLayout>, ModifiedContent<HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>, _PaddingLayout>?, ModifiedContent<HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>, _PaddingLayout>)>);
  lazy protocol witness table accessor for type HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>> and conformance HStack<A>(&lazy protocol witness table cache variable for type TupleView<(<<opaque return type of View.separators(_:isOverride:)>>.0, ModifiedContent<HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>, _PaddingLayout>, ModifiedContent<HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>, _PaddingLayout>?, ModifiedContent<HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>, _PaddingLayout>)> and conformance TupleView<A>, &demangling cache variable for type metadata for TupleView<(<<opaque return type of View.separators(_:isOverride:)>>.0, ModifiedContent<HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>, _PaddingLayout>, ModifiedContent<HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>, _PaddingLayout>?, ModifiedContent<HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>, _PaddingLayout>)>);
  return ComponentStack.init(content:)();
}

uint64_t closure #1 in LocationAccessPromptView.body.getter@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v122 = a1;
  v112 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SiriKitUIModel.ButtonInfo?);
  __chkstk_darwin(v3 - 8);
  v108 = (char *)&v100 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>, _PaddingLayout>?);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v111 = (uint64_t)&v100 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v117 = (uint64_t)&v100 - v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v100 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v115 = type metadata accessor for SiriKitUIModel.ButtonInfo();
  uint64_t v107 = *(void *)(v115 - 8);
  uint64_t v12 = __chkstk_darwin(v115);
  v101 = (char *)&v100 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v116 = (char *)&v100 - v14;
  uint64_t v121 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>, _PaddingLayout>);
  uint64_t v15 = __chkstk_darwin(v121);
  uint64_t v109 = (uint64_t)&v100 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v110 = (uint64_t)&v100 - v18;
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v125 = (uint64_t)&v100 - v20;
  __chkstk_darwin(v19);
  uint64_t v124 = (uint64_t)&v100 - v21;
  uint64_t v106 = type metadata accessor for SeparatorStyle();
  uint64_t v104 = *(void *)(v106 - 8);
  __chkstk_darwin(v106);
  v103 = (char *)&v100 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v105 = type metadata accessor for SimpleItemStandardView();
  uint64_t v113 = *(void *)(v105 - 8);
  __chkstk_darwin(v105);
  v102 = (char *)&v100 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.separators(_:isOverride:)>>.0);
  uint64_t v119 = *(void *)(v24 - 8);
  uint64_t v120 = v24;
  uint64_t v25 = __chkstk_darwin(v24);
  uint64_t v27 = (char *)&v100 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v25);
  v123 = (char *)&v100 - v28;
  uint64_t v114 = a1 + *(int *)(type metadata accessor for LocationAccessPromptView() + 20);
  uint64_t v141 = SiriKitUIModel.LocationAccessCarPlayPromptModel.titlePrompt.getter();
  uint64_t v142 = v29;
  lazy protocol witness table accessor for type String and conformance String();
  uint64_t v30 = Text.init<A>(_:)();
  uint64_t v32 = v31;
  uint64_t v34 = v33;
  char v36 = v35 & 1;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v141 = v30;
  uint64_t v142 = v32;
  char v143 = v36;
  v144 = v34;
  v145 = (void *)KeyPath;
  char v146 = 1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>);
  lazy protocol witness table accessor for type ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>> and conformance <> ModifiedContent<A, B>();
  uint64_t v38 = View.eraseToAnyView()();
  outlined consume of Text.Storage(v30, v32, v36);
  swift_release();
  uint64_t v39 = v125;
  swift_bridgeObjectRelease();
  v145 = &protocol witness table for AnyView;
  v144 = &type metadata for AnyView;
  uint64_t v140 = 0;
  uint64_t v141 = v38;
  long long v138 = 0u;
  long long v139 = 0u;
  uint64_t v137 = 0;
  long long v135 = 0u;
  long long v136 = 0u;
  uint64_t v134 = 0;
  long long v132 = 0u;
  long long v133 = 0u;
  uint64_t v131 = 0;
  long long v129 = 0u;
  long long v130 = 0u;
  uint64_t v128 = 0;
  long long v126 = 0u;
  long long v127 = 0u;
  v40 = v102;
  SimpleItemStandardView.init(text1:text2:text3:text4:text5:text6:)();
  v42 = v103;
  uint64_t v41 = v104;
  uint64_t v43 = v106;
  (*(void (**)(char *, void, uint64_t))(v104 + 104))(v103, enum case for SeparatorStyle.none(_:), v106);
  lazy protocol witness table accessor for type SimpleItemStandardView and conformance SimpleItemStandardView(&lazy protocol witness table cache variable for type SimpleItemStandardView and conformance SimpleItemStandardView, (void (*)(uint64_t))&type metadata accessor for SimpleItemStandardView);
  uint64_t v44 = v105;
  View.separators(_:isOverride:)();
  (*(void (**)(char *, uint64_t))(v41 + 8))(v42, v43);
  (*(void (**)(char *, uint64_t))(v113 + 8))(v40, v44);
  v45 = *(void (**)(char *, char *, uint64_t))(v119 + 32);
  v118 = v27;
  v45(v123, v27, v120);
  uint64_t v46 = (uint64_t)v116;
  SiriKitUIModel.LocationAccessCarPlayPromptModel.buttonAllowOnce.getter();
  *(void *)uint64_t v11 = static VerticalAlignment.center.getter();
  *((void *)v11 + 1) = 0;
  v11[16] = 1;
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _VariadicView.Tree<_HStackLayout, TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>);
  closure #1 in LocationAccessPromptView.button(info:)(v122, v46, &v11[*(int *)(v47 + 44)]);
  LOBYTE(v38) = static Edge.Set.vertical.getter();
  EdgeInsets.init(_all:)();
  uint64_t v49 = v48;
  uint64_t v51 = v50;
  uint64_t v53 = v52;
  uint64_t v55 = v54;
  outlined init with copy of HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>((uint64_t)v11, v39, &demangling cache variable for type metadata for HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>);
  uint64_t v56 = v39 + *(int *)(v121 + 36);
  *(unsigned char *)uint64_t v56 = v38;
  *(void *)(v56 + 8) = v49;
  *(void *)(v56 + 16) = v51;
  *(void *)(v56 + 24) = v53;
  *(void *)(v56 + 32) = v55;
  *(unsigned char *)(v56 + 40) = 0;
  outlined destroy of HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>((uint64_t)v11, &demangling cache variable for type metadata for HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>);
  uint64_t v57 = v107;
  uint64_t v58 = v115;
  uint64_t v113 = *(void *)(v107 + 8);
  ((void (*)(uint64_t, uint64_t))v113)(v46, v115);
  outlined init with take of ModifiedContent<HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>, _PaddingLayout>(v39, v124);
  uint64_t v59 = (uint64_t)v108;
  SiriKitUIModel.LocationAccessCarPlayPromptModel.buttonAllowWhileUsingApp.getter();
  if (__swift_getEnumTagSinglePayload(v59, 1, v58) == 1)
  {
    outlined destroy of HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>(v59, &demangling cache variable for type metadata for SiriKitUIModel.ButtonInfo?);
    uint64_t v60 = 1;
    uint64_t v61 = v117;
  }
  else
  {
    v62 = *(void (**)(char *, uint64_t, uint64_t))(v57 + 32);
    uint64_t v63 = (uint64_t)v101;
    v62(v101, v59, v58);
    *(void *)uint64_t v11 = static VerticalAlignment.center.getter();
    *((void *)v11 + 1) = 0;
    v11[16] = 1;
    closure #1 in LocationAccessPromptView.button(info:)(v122, v63, &v11[*(int *)(v47 + 44)]);
    uint64_t v64 = v58;
    char v65 = static Edge.Set.vertical.getter();
    EdgeInsets.init(_all:)();
    uint64_t v67 = v66;
    uint64_t v69 = v68;
    uint64_t v71 = v70;
    uint64_t v73 = v72;
    uint64_t v74 = v125;
    outlined init with copy of HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>((uint64_t)v11, v125, &demangling cache variable for type metadata for HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>);
    uint64_t v75 = v74 + *(int *)(v121 + 36);
    *(unsigned char *)uint64_t v75 = v65;
    *(void *)(v75 + 8) = v67;
    *(void *)(v75 + 16) = v69;
    *(void *)(v75 + 24) = v71;
    *(void *)(v75 + 32) = v73;
    *(unsigned char *)(v75 + 40) = 0;
    outlined destroy of HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>((uint64_t)v11, &demangling cache variable for type metadata for HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>);
    ((void (*)(uint64_t, uint64_t))v113)(v63, v64);
    uint64_t v61 = v117;
    outlined init with take of ModifiedContent<HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>, _PaddingLayout>(v74, v117);
    uint64_t v60 = 0;
  }
  uint64_t v76 = v121;
  __swift_storeEnumTagSinglePayload(v61, v60, 1, v121);
  uint64_t v77 = (uint64_t)v116;
  SiriKitUIModel.LocationAccessCarPlayPromptModel.buttonDontAllow.getter();
  *(void *)uint64_t v11 = static VerticalAlignment.center.getter();
  *((void *)v11 + 1) = 0;
  v11[16] = 1;
  closure #1 in LocationAccessPromptView.button(info:)(v122, v77, &v11[*(int *)(v47 + 44)]);
  char v78 = static Edge.Set.vertical.getter();
  EdgeInsets.init(_all:)();
  uint64_t v80 = v79;
  uint64_t v82 = v81;
  uint64_t v84 = v83;
  uint64_t v86 = v85;
  uint64_t v87 = v110;
  outlined init with copy of HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>((uint64_t)v11, v110, &demangling cache variable for type metadata for HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>);
  uint64_t v88 = v87 + *(int *)(v76 + 36);
  *(unsigned char *)uint64_t v88 = v78;
  *(void *)(v88 + 8) = v80;
  *(void *)(v88 + 16) = v82;
  *(void *)(v88 + 24) = v84;
  *(void *)(v88 + 32) = v86;
  *(unsigned char *)(v88 + 40) = 0;
  outlined destroy of HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>((uint64_t)v11, &demangling cache variable for type metadata for HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>);
  ((void (*)(uint64_t, uint64_t))v113)(v77, v115);
  uint64_t v89 = v125;
  outlined init with take of ModifiedContent<HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>, _PaddingLayout>(v87, v125);
  v90 = v118;
  uint64_t v91 = v119;
  v92 = *(void (**)(char *, char *, uint64_t))(v119 + 16);
  uint64_t v93 = v120;
  v92(v118, v123, v120);
  outlined init with copy of HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>(v124, v87, &demangling cache variable for type metadata for ModifiedContent<HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>, _PaddingLayout>);
  uint64_t v94 = v111;
  outlined init with copy of HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>(v61, v111, &demangling cache variable for type metadata for ModifiedContent<HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>, _PaddingLayout>?);
  uint64_t v95 = v109;
  outlined init with copy of HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>(v89, v109, &demangling cache variable for type metadata for ModifiedContent<HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>, _PaddingLayout>);
  v96 = v112;
  v92(v112, v90, v93);
  v97 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (<<opaque return type of View.separators(_:isOverride:)>>.0, ModifiedContent<HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>, _PaddingLayout>, ModifiedContent<HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>, _PaddingLayout>?, ModifiedContent<HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>, _PaddingLayout>));
  outlined init with copy of HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>(v87, (uint64_t)&v96[v97[12]], &demangling cache variable for type metadata for ModifiedContent<HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>, _PaddingLayout>);
  outlined init with copy of HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>(v94, (uint64_t)&v96[v97[16]], &demangling cache variable for type metadata for ModifiedContent<HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>, _PaddingLayout>?);
  outlined init with copy of HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>(v95, (uint64_t)&v96[v97[20]], &demangling cache variable for type metadata for ModifiedContent<HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>, _PaddingLayout>);
  outlined destroy of HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>(v125, &demangling cache variable for type metadata for ModifiedContent<HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>, _PaddingLayout>);
  outlined destroy of HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>(v117, &demangling cache variable for type metadata for ModifiedContent<HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>, _PaddingLayout>?);
  outlined destroy of HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>(v124, &demangling cache variable for type metadata for ModifiedContent<HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>, _PaddingLayout>);
  v98 = *(void (**)(char *, uint64_t))(v91 + 8);
  v98(v123, v93);
  outlined destroy of HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>(v95, &demangling cache variable for type metadata for ModifiedContent<HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>, _PaddingLayout>);
  outlined destroy of HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>(v94, &demangling cache variable for type metadata for ModifiedContent<HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>, _PaddingLayout>?);
  outlined destroy of HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>(v87, &demangling cache variable for type metadata for ModifiedContent<HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>, _PaddingLayout>);
  return ((uint64_t (*)(char *, uint64_t))v98)(v118, v93);
}

uint64_t outlined init with copy of LocationAccessPromptView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LocationAccessPromptView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_6E98()
{
  type metadata accessor for LocationAccessPromptView();
  OUTLINED_FUNCTION_2_0();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = ((v5 + 16) & ~v5) + *(void *)(v4 + 64);
  uint64_t v7 = v5 | 7;
  type metadata accessor for ActionHandler();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5();
  v8();
  type metadata accessor for SiriKitUIModel.LocationAccessCarPlayPromptModel();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5();
  v9();
  swift_release();

  return _swift_deallocObject(v0, v6, v7);
}

uint64_t outlined init with take of LocationAccessPromptView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LocationAccessPromptView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t partial apply for closure #1 in LocationAccessPromptView.body.getter@<X0>(char *a1@<X8>)
{
  uint64_t v3 = type metadata accessor for LocationAccessPromptView();
  OUTLINED_FUNCTION_2(v3);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));

  return closure #1 in LocationAccessPromptView.body.getter(v5, a1);
}

uint64_t closure #1 in LocationAccessPromptView.button(info:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v40 = a1;
  uint64_t v51 = a3;
  uint64_t v5 = type metadata accessor for StandardSiriButtonStyle();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v49 = v5;
  uint64_t v50 = v6;
  __chkstk_darwin(v5);
  uint64_t v48 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for SiriKitUIModel.ButtonInfo();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  __chkstk_darwin(v8);
  uint64_t v11 = type metadata accessor for LocationAccessPromptView();
  uint64_t v41 = *(void *)(v11 - 8);
  uint64_t v12 = *(void *)(v41 + 64);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Button<Label<Text, EmptyView>>);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v46 = v14;
  uint64_t v47 = v15;
  __chkstk_darwin(v14);
  v42 = (char *)&v40 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.buttonStyle<A>(_:)>>.0);
  uint64_t v43 = *(void *)(v17 - 8);
  uint64_t v44 = v17;
  uint64_t v18 = __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v40 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  v45 = (char *)&v40 - v21;
  outlined init with copy of LocationAccessPromptView(a1, (uint64_t)v13);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v8);
  unint64_t v22 = (*(unsigned __int8 *)(v41 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80);
  unint64_t v23 = (v12 + *(unsigned __int8 *)(v9 + 80) + v22) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v24 = swift_allocObject();
  outlined init with take of LocationAccessPromptView((uint64_t)v13, v24 + v22);
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v24 + v23, (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  uint64_t v52 = a2;
  uint64_t v53 = v40;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Label<Text, EmptyView>);
  lazy protocol witness table accessor for type HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>> and conformance HStack<A>(&lazy protocol witness table cache variable for type Label<Text, EmptyView> and conformance Label<A, B>, &demangling cache variable for type metadata for Label<Text, EmptyView>);
  uint64_t v25 = v42;
  Button.init(action:label:)();
  uint64_t v26 = v48;
  static ButtonStyle<>.standardSiriButton(bold:hideIcon:isPressed:)();
  lazy protocol witness table accessor for type HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>> and conformance HStack<A>(&lazy protocol witness table cache variable for type Button<Label<Text, EmptyView>> and conformance Button<A>, &demangling cache variable for type metadata for Button<Label<Text, EmptyView>>);
  lazy protocol witness table accessor for type SimpleItemStandardView and conformance SimpleItemStandardView(&lazy protocol witness table cache variable for type StandardSiriButtonStyle and conformance StandardSiriButtonStyle, (void (*)(uint64_t))&type metadata accessor for StandardSiriButtonStyle);
  uint64_t v27 = v46;
  uint64_t v28 = v49;
  View.buttonStyle<A>(_:)();
  (*(void (**)(char *, uint64_t))(v50 + 8))(v26, v28);
  (*(void (**)(char *, uint64_t))(v47 + 8))(v25, v27);
  uint64_t v29 = v43;
  uint64_t v30 = v44;
  uint64_t v31 = v45;
  (*(void (**)(char *, char *, uint64_t))(v43 + 32))(v45, v20, v44);
  uint64_t v32 = v29;
  uint64_t v33 = *(void (**)(char *, char *, uint64_t))(v29 + 16);
  v33(v20, v31, v30);
  uint64_t v34 = v51;
  *uint64_t v51 = 0x403E000000000000;
  *((unsigned char *)v34 + 8) = 0;
  char v35 = (char *)v34;
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer));
  v33(&v35[*(int *)(v36 + 48)], v20, v30);
  uint64_t v37 = &v35[*(int *)(v36 + 64)];
  *(void *)uint64_t v37 = 0x403E000000000000;
  v37[8] = 0;
  uint64_t v38 = *(void (**)(char *, uint64_t))(v32 + 8);
  v38(v31, v30);
  return ((uint64_t (*)(char *, uint64_t))v38)(v20, v30);
}

uint64_t closure #1 in closure #1 in LocationAccessPromptView.button(info:)()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for InteractionType?);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ActionProperty?);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for Command();
  uint64_t v23 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for StandardActionHandler?);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for StandardActionHandler();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  ActionHandler.wrappedValue.getter();
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12) == 1) {
    return outlined destroy of HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>((uint64_t)v11, &demangling cache variable for type metadata for StandardActionHandler?);
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v11, v12);
  SiriKitUIModel.ButtonInfo.directInvocationId.getter();
  Dictionary.init(dictionaryLiteral:)();
  static Command.directInvocation(identifier:payload:isNavigation:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<ActionElementConvertible>);
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_AD90;
  *(void *)(v17 + 56) = v6;
  *(void *)(v17 + 64) = &protocol witness table for Command;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v17 + 32));
  uint64_t v19 = v23;
  (*(void (**)(uint64_t *, char *, uint64_t))(v23 + 16))(boxed_opaque_existential_1, v8, v6);
  ActionProperty.init(_:)();
  uint64_t v20 = type metadata accessor for ActionProperty();
  __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v20);
  uint64_t v21 = type metadata accessor for InteractionType();
  __swift_storeEnumTagSinglePayload((uint64_t)v2, 1, 1, v21);
  StandardActionHandler.perform(_:interactionType:)();
  outlined destroy of HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>((uint64_t)v2, &demangling cache variable for type metadata for InteractionType?);
  outlined destroy of HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>((uint64_t)v5, &demangling cache variable for type metadata for ActionProperty?);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v8, v6);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

uint64_t closure #2 in closure #1 in LocationAccessPromptView.button(info:)()
{
  return Label.init(title:icon:)();
}

uint64_t closure #1 in closure #2 in closure #1 in LocationAccessPromptView.button(info:)@<X0>(uint64_t a1@<X8>)
{
  SiriKitUIModel.ButtonInfo.label.getter();
  lazy protocol witness table accessor for type String and conformance String();
  uint64_t v2 = Text.init<A>(_:)();
  uint64_t v4 = v3;
  char v6 = v5 & 1;
  type metadata accessor for LocationAccessPromptView();
  uint64_t v7 = Text.foregroundColor(_:)();
  uint64_t v9 = v8;
  char v11 = v10;
  uint64_t v13 = v12;
  outlined consume of Text.Storage(v2, v4, v6);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a1 = v7;
  *(void *)(a1 + 8) = v9;
  *(unsigned char *)(a1 + 16) = v11 & 1;
  *(void *)(a1 + 24) = v13;
  return result;
}

uint64_t LocationAccessPromptView.init(model:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  ActionHandler.init()();
  uint64_t v4 = type metadata accessor for LocationAccessPromptView();
  uint64_t v5 = a2 + *(int *)(v4 + 20);
  type metadata accessor for SiriKitUIModel.LocationAccessCarPlayPromptModel();
  OUTLINED_FUNCTION_1();
  (*(void (**)(uint64_t, uint64_t))(v6 + 32))(v5, a1);
  uint64_t v7 = *(int *)(v4 + 24);
  id v8 = [self _carSystemFocusColor];
  uint64_t result = Color.init(uiColor:)();
  *(void *)(a2 + v7) = result;
  return result;
}

uint64_t associated type witness table accessor for View.Body : View in LocationAccessPromptView(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &opaque type descriptor for <<opaque return type of LocationAccessPromptView.body>>, 1);
}

uint64_t *initializeBufferWithCopyOfBuffer for LocationAccessPromptView(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = type metadata accessor for ActionHandler();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    char v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for SiriKitUIModel.LocationAccessCarPlayPromptModel();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 24)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 24));
  }
  swift_retain();
  return a1;
}

uint64_t destroy for LocationAccessPromptView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ActionHandler();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = type metadata accessor for SiriKitUIModel.LocationAccessCarPlayPromptModel();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);

  return swift_release();
}

uint64_t initializeWithCopy for LocationAccessPromptView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for ActionHandler();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for SiriKitUIModel.LocationAccessCarPlayPromptModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for LocationAccessPromptView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for ActionHandler();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for SiriKitUIModel.LocationAccessCarPlayPromptModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for LocationAccessPromptView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for ActionHandler();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for SiriKitUIModel.LocationAccessCarPlayPromptModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t assignWithTake for LocationAccessPromptView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for ActionHandler();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for SiriKitUIModel.LocationAccessCarPlayPromptModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for LocationAccessPromptView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_80DC);
}

uint64_t sub_80DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for ActionHandler();
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
LABEL_5:
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
  type metadata accessor for SiriKitUIModel.LocationAccessCarPlayPromptModel();
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v11 + 84) == a2)
  {
    uint64_t v8 = v10;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    goto LABEL_5;
  }
  unint64_t v13 = *(void *)(a1 + *(int *)(a3 + 24));
  if (v13 >= 0xFFFFFFFF) {
    LODWORD(v13) = -1;
  }
  return (v13 + 1);
}

uint64_t storeEnumTagSinglePayload for LocationAccessPromptView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_81A4);
}

void sub_81A4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  type metadata accessor for ActionHandler();
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    type metadata accessor for SiriKitUIModel.LocationAccessCarPlayPromptModel();
    OUTLINED_FUNCTION_0();
    if (*(_DWORD *)(v13 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
      return;
    }
    uint64_t v10 = v12;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
  }

  __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

uint64_t type metadata completion function for LocationAccessPromptView()
{
  uint64_t result = type metadata accessor for ActionHandler();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for SiriKitUIModel.LocationAccessCarPlayPromptModel();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_8328()
{
  return lazy protocol witness table accessor for type HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>> and conformance HStack<A>(&lazy protocol witness table cache variable for type ComponentStack<TupleView<(<<opaque return type of View.separators(_:isOverride:)>>.0, ModifiedContent<HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>, _PaddingLayout>, ModifiedContent<HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>, _PaddingLayout>?, ModifiedContent<HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>, _PaddingLayout>)>> and conformance ComponentStack<A>, &demangling cache variable for type metadata for ComponentStack<TupleView<(<<opaque return type of View.separators(_:isOverride:)>>.0, ModifiedContent<HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>, _PaddingLayout>, ModifiedContent<HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>, _PaddingLayout>?, ModifiedContent<HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>, _PaddingLayout>)>>);
}

uint64_t sub_8364@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = EnvironmentValues.multilineTextAlignment.getter();
  *a1 = result;
  return result;
}

uint64_t sub_8390()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result = lazy protocol witness table cache variable for type ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>> and conformance <> ModifiedContent<A, B>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>);
    lazy protocol witness table accessor for type HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>> and conformance HStack<A>(&lazy protocol witness table cache variable for type _EnvironmentKeyWritingModifier<TextAlignment> and conformance _EnvironmentKeyWritingModifier<A>, &demangling cache variable for type metadata for _EnvironmentKeyWritingModifier<TextAlignment>);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

uint64_t outlined consume of Text.Storage(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t outlined init with take of ModifiedContent<HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>, _PaddingLayout>(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>, _PaddingLayout>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with copy of HStack<TupleView<(Spacer, <<opaque return type of View.buttonStyle<A>(_:)>>.0, Spacer)>>(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_1();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_852C()
{
  type metadata accessor for LocationAccessPromptView();
  OUTLINED_FUNCTION_2_0();
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v4 = *(void *)(v3 + 64);
  uint64_t v5 = type metadata accessor for SiriKitUIModel.ButtonInfo();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = (((v2 + 16) & ~v2) + v4 + v7) & ~v7;
  uint64_t v9 = v8 + *(void *)(v6 + 64);
  uint64_t v10 = v2 | v7 | 7;
  type metadata accessor for ActionHandler();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5();
  v11();
  type metadata accessor for SiriKitUIModel.LocationAccessCarPlayPromptModel();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5();
  v12();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v8, v5);

  return _swift_deallocObject(v0, v9, v10);
}

uint64_t partial apply for closure #1 in closure #1 in LocationAccessPromptView.button(info:)()
{
  uint64_t v0 = type metadata accessor for LocationAccessPromptView();
  OUTLINED_FUNCTION_3(v0);
  uint64_t v1 = type metadata accessor for SiriKitUIModel.ButtonInfo();
  OUTLINED_FUNCTION_2(v1);

  return closure #1 in closure #1 in LocationAccessPromptView.button(info:)();
}

uint64_t partial apply for closure #2 in closure #1 in LocationAccessPromptView.button(info:)()
{
  return closure #2 in closure #1 in LocationAccessPromptView.button(info:)();
}

uint64_t lazy protocol witness table accessor for type SimpleItemStandardView and conformance SimpleItemStandardView(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t partial apply for closure #1 in closure #2 in closure #1 in LocationAccessPromptView.button(info:)@<X0>(uint64_t a1@<X8>)
{
  return closure #1 in closure #2 in closure #1 in LocationAccessPromptView.button(info:)(a1);
}

uint64_t OUTLINED_FUNCTION_3(uint64_t a1)
{
  return a1 - 8;
}

uint64_t one-time initialization function for voiceCommands()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Logger.voiceCommands);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.voiceCommands);
  if (one-time initialization token for subsystem != -1) {
    swift_once();
  }
  uint64_t v1 = one-time initialization token for voiceCommands;
  swift_bridgeObjectRetain();
  if (v1 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  return Logger.init(subsystem:category:)();
}

uint64_t *LogConst.subsystem.unsafeMutableAddressor()
{
  if (one-time initialization token for subsystem != -1) {
    swift_once();
  }
  return &static LogConst.subsystem;
}

uint64_t *LogConst.Category.voiceCommands.unsafeMutableAddressor()
{
  if (one-time initialization token for voiceCommands != -1) {
    swift_once();
  }
  return &static LogConst.Category.voiceCommands;
}

uint64_t Logger.voiceCommands.unsafeMutableAddressor()
{
  return Logger.voiceCommands.unsafeMutableAddressor(&one-time initialization token for voiceCommands, (uint64_t)static Logger.voiceCommands);
}

uint64_t static Logger.voiceCommands.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.voiceCommands.getter(&one-time initialization token for voiceCommands, (uint64_t)static Logger.voiceCommands, a1);
}

uint64_t one-time initialization function for linkUI()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Logger.linkUI);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.linkUI);
  return Logger.init(subsystem:category:)();
}

void *LogConst.subsystemSLF.unsafeMutableAddressor()
{
  return &static LogConst.subsystemSLF;
}

void *LogConst.Category.siriLinkUIPlugin.unsafeMutableAddressor()
{
  return &static LogConst.Category.siriLinkUIPlugin;
}

uint64_t Logger.linkUI.unsafeMutableAddressor()
{
  return Logger.voiceCommands.unsafeMutableAddressor(&one-time initialization token for linkUI, (uint64_t)static Logger.linkUI);
}

uint64_t static Logger.linkUI.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.voiceCommands.getter(&one-time initialization token for linkUI, (uint64_t)static Logger.linkUI, a1);
}

uint64_t one-time initialization function for siriKitUI()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Logger.siriKitUI);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.siriKitUI);
  if (one-time initialization token for siriKitUIPlugin != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  return Logger.init(subsystem:category:)();
}

void *LogConst.subsystemSKE.unsafeMutableAddressor()
{
  return &static LogConst.subsystemSKE;
}

uint64_t *LogConst.Category.siriKitUIPlugin.unsafeMutableAddressor()
{
  if (one-time initialization token for siriKitUIPlugin != -1) {
    swift_once();
  }
  return &static LogConst.Category.siriKitUIPlugin;
}

uint64_t Logger.siriKitUI.unsafeMutableAddressor()
{
  return Logger.voiceCommands.unsafeMutableAddressor(&one-time initialization token for siriKitUI, (uint64_t)static Logger.siriKitUI);
}

uint64_t Logger.voiceCommands.unsafeMutableAddressor(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();

  return __swift_project_value_buffer(v3, a2);
}

uint64_t static Logger.siriKitUI.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.voiceCommands.getter(&one-time initialization token for siriKitUI, (uint64_t)static Logger.siriKitUI, a1);
}

uint64_t static Logger.voiceCommands.getter@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v7(a3, v6, v5);
}

uint64_t Logger.logAndCrash(_:file:line:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  uint64_t v7 = v6;
  uint64_t v35 = a6;
  int v36 = a5;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Logger?);
  uint64_t v13 = __chkstk_darwin(v12 - 8);
  uint64_t v15 = &v29[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v13);
  uint64_t v17 = &v29[-v16];
  uint64_t v18 = type metadata accessor for Logger();
  uint64_t v19 = *(void *)(v18 - 8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v19 + 16))(v17, v7, v18);
  __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, v18);
  outlined init with copy of Logger?((uint64_t)v17, (uint64_t)v15);
  if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v18) == 1)
  {
    outlined destroy of Logger?((uint64_t)v15);
  }
  else
  {
    swift_bridgeObjectRetain_n();
    uint64_t v20 = Logger.logObject.getter();
    os_log_type_t v21 = static os_log_type_t.error.getter();
    int v22 = v21;
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v23 = swift_slowAlloc();
      uint64_t v33 = a3;
      uint64_t v24 = v23;
      uint64_t v32 = swift_slowAlloc();
      uint64_t v38 = v32;
      *(_DWORD *)uint64_t v24 = 136315650;
      uint64_t v34 = a4;
      uint64_t v25 = StaticString.description.getter();
      os_log_t v31 = v20;
      uint64_t v37 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v25, v26, &v38);
      int v30 = v22;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v24 + 12) = 2048;
      uint64_t v37 = v35;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v24 + 22) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v37 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, &v38);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      os_log_t v27 = v31;
      _os_log_impl(&dword_0, v31, (os_log_type_t)v30, "FatalError at %s:%lu - %s", (uint8_t *)v24, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(unsigned char *, uint64_t))(v19 + 8))(v15, v18);
  }
  static SiriKitLifecycle._logCrashToEventBus(_:)();
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void one-time initialization function for subsystem()
{
  unk_10777 = -18;
}

uint64_t static LogConst.subsystem.getter()
{
  return static LogConst.subsystem.getter(&one-time initialization token for subsystem, &static LogConst.subsystem);
}

unint64_t static LogConst.subsystemSLF.getter()
{
  return OUTLINED_FUNCTION_1_0(27);
}

unint64_t static LogConst.subsystemSKE.getter()
{
  return OUTLINED_FUNCTION_1_0(22);
}

void one-time initialization function for voiceCommands()
{
  unk_10786 = -4864;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t static LogConst.Category.voiceCommands.getter()
{
  return static LogConst.subsystem.getter(&one-time initialization token for voiceCommands, &static LogConst.Category.voiceCommands);
}

unint64_t static LogConst.Category.siriLinkUIPlugin.getter()
{
  return OUTLINED_FUNCTION_1_0(16);
}

void one-time initialization function for siriKitUIPlugin()
{
  static LogConst.Category.siriKitUIPlugin = 0x5574694B69726953;
  unk_10790 = 0xEF6E6967756C5049;
}

uint64_t outlined init with copy of Logger?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Logger?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of Logger?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Logger?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t static LogConst.Category.siriKitUIPlugin.getter()
{
  return static LogConst.subsystem.getter(&one-time initialization token for siriKitUIPlugin, &static LogConst.Category.siriKitUIPlugin);
}

uint64_t static LogConst.subsystem.getter(void *a1, uint64_t *a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = *a2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = specialized _StringGuts._deconstructUTF8<A>(scratch:)(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
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
    ObjectType = &type metadata for _StringGuts;
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

void type metadata accessor for Logger()
{
}

void type metadata accessor for LogConst()
{
}

void type metadata accessor for LogConst.Category()
{
}

uint64_t specialized _StringGuts._deconstructUTF8<A>(scratch:)(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      specialized UnsafeMutableRawPointer.initializeMemory<A>(as:from:count:)((char *)__src, HIBYTE(a6) & 0xF, __dst);
      UnsafeMutableRawBufferPointer.subscript.setter();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = (uint64_t)_StringGuts._allocateForDeconstruct()(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = _StringObject.sharedUTF8.getter();
    if (!v8)
    {
      uint64_t result = _assertionFailure(_:_:file:line:flags:)();
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

void *specialized UnsafeMutableRawPointer.initializeMemory<A>(as:from:count:)(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

void *_StringGuts._allocateForDeconstruct()(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = String.UTF8View._foreignCount()();
    if (v2) {
      goto LABEL_6;
    }
    return &_swiftEmptyArrayStorage;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    Swift::Int v2 = HIBYTE(a2) & 0xF;
  }
  else {
    Swift::Int v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
LABEL_6:
  unint64_t v3 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = _StringGuts.copyUTF8(into:)();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return v4;
  }
  _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
LABEL_14:
  uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
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
    return &_swiftEmptyArrayStorage;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    specialized UnsafeMutablePointer.moveInitialize(from:count:)(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    specialized UnsafeMutablePointer.initialize(from:count:)(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *specialized UnsafeMutablePointer.initialize(from:count:)(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *specialized UnsafeMutablePointer.moveInitialize(from:count:)(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
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

unint64_t OUTLINED_FUNCTION_1_0(uint64_t a1)
{
  return a1 & 0xFFFFFFFFFFFFLL | 0xD000000000000000;
}

uint64_t static SiriKitUIPlugin.Error.__derived_enum_equals(_:_:)()
{
  return 1;
}

void SiriKitUIPlugin.Error.hash(into:)()
{
}

Swift::Int SiriKitUIPlugin.Error.hashValue.getter()
{
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance SiriKitUIPlugin.Error()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for Error._domain.getter in conformance SiriKitUIPlugin.Error()
{
  return Error._domain.getter();
}

uint64_t protocol witness for Error._code.getter in conformance SiriKitUIPlugin.Error()
{
  return Error._code.getter();
}

uint64_t protocol witness for Error._userInfo.getter in conformance SiriKitUIPlugin.Error()
{
  return Error._userInfo.getter();
}

uint64_t protocol witness for Error._getEmbeddedNSError() in conformance SiriKitUIPlugin.Error()
{
  return Error._getEmbeddedNSError()();
}

os_log_t SiriKitUIPlugin.snippet(for:mode:idiom:)(uint64_t a1)
{
  type metadata accessor for SiriKitUIModel.SiriNeedsLocationAccessErrorModel();
  OUTLINED_FUNCTION_0_1();
  uint64_t v54 = v3;
  os_log_t v55 = v2;
  __chkstk_darwin(v2);
  uint64_t v52 = (char *)v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for SiriKitUIModel.LocationAccessCarPlayPromptModel();
  OUTLINED_FUNCTION_0_1();
  uint64_t v7 = v6;
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for SiriKitUIModel();
  OUTLINED_FUNCTION_0_1();
  uint64_t v13 = v12;
  uint64_t v15 = __chkstk_darwin(v14);
  v51[1] = (char *)v51 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v56 = (char *)v51 - v18;
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)v51 - v19;
  os_log_type_t v21 = *(void (**)(void))(v13 + 16);
  uint64_t v53 = a1;
  OUTLINED_FUNCTION_1_1();
  v21();
  int v22 = (*(uint64_t (**)(char *, uint64_t))(v13 + 88))(v20, v11);
  if (v22 == enum case for SiriKitUIModel.locationAccessCarPlayPrompt(_:))
  {
    uint64_t v23 = OUTLINED_FUNCTION_2_1();
    v24(v23);
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v10, v20, v5);
    uint64_t v25 = type metadata accessor for LocationAccessPromptView();
    uint64_t v59 = v25;
    uint64_t v60 = lazy protocol witness table accessor for type SiriNeedsLocationAccessErrorView and conformance SiriNeedsLocationAccessErrorView(&lazy protocol witness table cache variable for type LocationAccessPromptView and conformance LocationAccessPromptView, (void (*)(uint64_t))type metadata accessor for LocationAccessPromptView);
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v58);
    uint64_t v27 = OUTLINED_FUNCTION_3_0((uint64_t)boxed_opaque_existential_1);
    v28(v27, v10, v5);
    ActionHandler.init()();
    uint64_t v29 = *(int *)(v25 + 24);
    id v30 = [self _carSystemFocusColor];
    *(uint64_t *)((char *)boxed_opaque_existential_1 + v29) = Color.init(uiColor:)();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v5);
LABEL_5:
    outlined init with take of View(&v58, (uint64_t)v61);
    __swift_project_boxed_opaque_existential_1(v61, v61[3]);
    os_log_t v39 = (os_log_t)View.eraseToAnyView()();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v61);
    return v39;
  }
  if (v22 == enum case for SiriKitUIModel.siriNeedsLocationAccessError(_:))
  {
    uint64_t v31 = OUTLINED_FUNCTION_2_1();
    v32(v31);
    uint64_t v34 = v54;
    os_log_t v33 = v55;
    uint64_t v35 = v52;
    (*((void (**)(char *, char *, os_log_t))v54 + 4))(v52, v20, v55);
    uint64_t v59 = type metadata accessor for SiriNeedsLocationAccessErrorView();
    uint64_t v60 = lazy protocol witness table accessor for type SiriNeedsLocationAccessErrorView and conformance SiriNeedsLocationAccessErrorView(&lazy protocol witness table cache variable for type SiriNeedsLocationAccessErrorView and conformance SiriNeedsLocationAccessErrorView, (void (*)(uint64_t))type metadata accessor for SiriNeedsLocationAccessErrorView);
    int v36 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v58);
    uint64_t v37 = OUTLINED_FUNCTION_3_0((uint64_t)v36);
    v38(v37, v35, v33);
    ActionHandler.init()();
    (*((void (**)(char *, os_log_t))v34 + 1))(v35, v33);
    goto LABEL_5;
  }
  if (one-time initialization token for siriKitUI != -1) {
    swift_once();
  }
  uint64_t v40 = type metadata accessor for Logger();
  __swift_project_value_buffer(v40, (uint64_t)static Logger.siriKitUI);
  uint64_t v41 = v56;
  OUTLINED_FUNCTION_1_1();
  v21();
  v42 = Logger.logObject.getter();
  os_log_type_t v43 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v42, v43))
  {
    uint64_t v44 = swift_slowAlloc();
    os_log_t v55 = v42;
    v45 = (uint8_t *)v44;
    uint64_t v57 = swift_slowAlloc();
    *(void *)&long long v58 = v57;
    *(_DWORD *)v45 = 136315138;
    uint64_t v54 = v45 + 4;
    OUTLINED_FUNCTION_1_1();
    v21();
    uint64_t v46 = String.init<A>(describing:)();
    v61[6] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v46, v47, (uint64_t *)&v58);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    uint64_t v48 = *(void (**)(char *, uint64_t))(v13 + 8);
    v48(v56, v11);
    os_log_t v39 = v55;
    _os_log_impl(&dword_0, v55, v43, "Unhandled pluginModel: %s", v45, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    uint64_t v49 = *(void (**)(char *, uint64_t))(v13 + 8);
    os_log_t v39 = (os_log_t)(v13 + 8);
    uint64_t v48 = v49;
    v49(v41, v11);
  }
  lazy protocol witness table accessor for type SiriKitUIPlugin.Error and conformance SiriKitUIPlugin.Error();
  swift_allocError();
  swift_willThrow();
  v48(v20, v11);
  return v39;
}

uint64_t SiriKitUIPlugin.deinit()
{
  return v0;
}

uint64_t SiriKitUIPlugin.__deallocating_deinit()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t SiriKitUIPlugin.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t protocol witness for SnippetProviding.init() in conformance SiriKitUIPlugin@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SiriKitUIPlugin.__allocating_init()();
  *a1 = result;
  return result;
}

os_log_t protocol witness for SnippetProviding.snippet(for:mode:idiom:) in conformance SiriKitUIPlugin(uint64_t a1)
{
  return SiriKitUIPlugin.snippet(for:mode:idiom:)(a1);
}

unint64_t lazy protocol witness table accessor for type SiriKitUIPlugin.Error and conformance SiriKitUIPlugin.Error()
{
  unint64_t result = lazy protocol witness table cache variable for type SiriKitUIPlugin.Error and conformance SiriKitUIPlugin.Error;
  if (!lazy protocol witness table cache variable for type SiriKitUIPlugin.Error and conformance SiriKitUIPlugin.Error)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SiriKitUIPlugin.Error and conformance SiriKitUIPlugin.Error);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SiriKitUIPlugin.Error and conformance SiriKitUIPlugin.Error;
  if (!lazy protocol witness table cache variable for type SiriKitUIPlugin.Error and conformance SiriKitUIPlugin.Error)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SiriKitUIPlugin.Error and conformance SiriKitUIPlugin.Error);
  }
  return result;
}

uint64_t outlined init with take of View(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t associated type witness table accessor for SnippetProviding.SnippetPluginModelType : SnippetPluginModel in SiriKitUIPlugin()
{
  return lazy protocol witness table accessor for type SiriNeedsLocationAccessErrorView and conformance SiriNeedsLocationAccessErrorView(&lazy protocol witness table cache variable for type SiriKitUIModel and conformance SiriKitUIModel, (void (*)(uint64_t))&type metadata accessor for SiriKitUIModel);
}

uint64_t lazy protocol witness table accessor for type SiriNeedsLocationAccessErrorView and conformance SiriNeedsLocationAccessErrorView(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t type metadata accessor for SiriKitUIPlugin()
{
  return self;
}

uint64_t getEnumTagSinglePayload for SiriKitUIPlugin.Error(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for SiriKitUIPlugin.Error(unsigned char *result, int a2, int a3)
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
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0xA598);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t getEnumTag for SiriKitUIPlugin.Error()
{
  return 0;
}

ValueMetadata *type metadata accessor for SiriKitUIPlugin.Error()
{
  return &type metadata for SiriKitUIPlugin.Error;
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3_0(uint64_t a1)
{
  return a1 + *(int *)(v1 + 20);
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t URL.init(string:)()
{
  return URL.init(string:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t type metadata accessor for ActionProperty()
{
  return type metadata accessor for ActionProperty();
}

uint64_t ActionProperty.init(_:)()
{
  return ActionProperty.init(_:)();
}

uint64_t type metadata accessor for SeparatorStyle()
{
  return type metadata accessor for SeparatorStyle();
}

uint64_t static Command.directInvocation(identifier:payload:isNavigation:)()
{
  return static Command.directInvocation(identifier:payload:isNavigation:)();
}

uint64_t type metadata accessor for Command()
{
  return type metadata accessor for Command();
}

uint64_t SiriKitUIModel.SiriNeedsLocationAccessErrorModel.buttonLabel.getter()
{
  return SiriKitUIModel.SiriNeedsLocationAccessErrorModel.buttonLabel.getter();
}

uint64_t type metadata accessor for SiriKitUIModel.SiriNeedsLocationAccessErrorModel()
{
  return type metadata accessor for SiriKitUIModel.SiriNeedsLocationAccessErrorModel();
}

uint64_t SiriKitUIModel.ButtonInfo.directInvocationId.getter()
{
  return SiriKitUIModel.ButtonInfo.directInvocationId.getter();
}

uint64_t SiriKitUIModel.ButtonInfo.label.getter()
{
  return SiriKitUIModel.ButtonInfo.label.getter();
}

uint64_t type metadata accessor for SiriKitUIModel.ButtonInfo()
{
  return type metadata accessor for SiriKitUIModel.ButtonInfo();
}

uint64_t SiriKitUIModel.LocationAccessCarPlayPromptModel.titlePrompt.getter()
{
  return SiriKitUIModel.LocationAccessCarPlayPromptModel.titlePrompt.getter();
}

uint64_t SiriKitUIModel.LocationAccessCarPlayPromptModel.buttonAllowOnce.getter()
{
  return SiriKitUIModel.LocationAccessCarPlayPromptModel.buttonAllowOnce.getter();
}

uint64_t SiriKitUIModel.LocationAccessCarPlayPromptModel.buttonDontAllow.getter()
{
  return SiriKitUIModel.LocationAccessCarPlayPromptModel.buttonDontAllow.getter();
}

uint64_t SiriKitUIModel.LocationAccessCarPlayPromptModel.buttonAllowWhileUsingApp.getter()
{
  return SiriKitUIModel.LocationAccessCarPlayPromptModel.buttonAllowWhileUsingApp.getter();
}

uint64_t type metadata accessor for SiriKitUIModel.LocationAccessCarPlayPromptModel()
{
  return type metadata accessor for SiriKitUIModel.LocationAccessCarPlayPromptModel();
}

uint64_t type metadata accessor for SiriKitUIModel()
{
  return type metadata accessor for SiriKitUIModel();
}

uint64_t static SiriKitLifecycle._logCrashToEventBus(_:)()
{
  return static SiriKitLifecycle._logCrashToEventBus(_:)();
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

uint64_t EdgeInsets.init(_all:)()
{
  return EdgeInsets.init(_all:)();
}

uint64_t static ButtonStyle<>.standardSiriButton(bold:hideIcon:isPressed:)()
{
  return static ButtonStyle<>.standardSiriButton(bold:hideIcon:isPressed:)();
}

uint64_t EnvironmentValues.multilineTextAlignment.getter()
{
  return EnvironmentValues.multilineTextAlignment.getter();
}

uint64_t EnvironmentValues.multilineTextAlignment.setter()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t static VerticalAlignment.center.getter()
{
  return static VerticalAlignment.center.getter();
}

uint64_t static PrimitiveButtonStyle<>.rfButton.getter()
{
  return static PrimitiveButtonStyle<>.rfButton.getter();
}

uint64_t static Edge.Set.vertical.getter()
{
  return static Edge.Set.vertical.getter();
}

uint64_t Text.foregroundColor(_:)()
{
  return Text.foregroundColor(_:)();
}

uint64_t Text.init<A>(_:)()
{
  return Text.init<A>(_:)();
}

uint64_t View.eraseToAnyView()()
{
  return View.eraseToAnyView()();
}

uint64_t View.separators(_:isOverride:)()
{
  return View.separators(_:isOverride:)();
}

uint64_t View.buttonStyle<A>(_:)()
{
  return View.buttonStyle<A>(_:)();
}

{
  return View.buttonStyle<A>(_:)();
}

uint64_t static View._viewListCount(inputs:)()
{
  return static View._viewListCount(inputs:)();
}

uint64_t Color.init(uiColor:)()
{
  return Color.init(uiColor:)();
}

uint64_t Label.init(title:icon:)()
{
  return Label.init(title:icon:)();
}

uint64_t Button.init(action:label:)()
{
  return Button.init(action:label:)();
}

uint64_t ActionHandler.wrappedValue.getter()
{
  return ActionHandler.wrappedValue.getter();
}

uint64_t ActionHandler.init()()
{
  return ActionHandler.init()();
}

uint64_t type metadata accessor for ActionHandler()
{
  return type metadata accessor for ActionHandler();
}

uint64_t type metadata accessor for RFButtonStyle()
{
  return type metadata accessor for RFButtonStyle();
}

uint64_t ComponentStack.init(content:)()
{
  return ComponentStack.init(content:)();
}

uint64_t type metadata accessor for InteractionType()
{
  return type metadata accessor for InteractionType();
}

uint64_t StandardActionHandler.perform(_:interactionType:)()
{
  return StandardActionHandler.perform(_:interactionType:)();
}

uint64_t type metadata accessor for StandardActionHandler()
{
  return type metadata accessor for StandardActionHandler();
}

uint64_t SimpleItemStandardView.init(text1:text2:text3:text4:text5:text6:)()
{
  return SimpleItemStandardView.init(text1:text2:text3:text4:text5:text6:)();
}

uint64_t type metadata accessor for SimpleItemStandardView()
{
  return type metadata accessor for SimpleItemStandardView();
}

uint64_t type metadata accessor for StandardSiriButtonStyle()
{
  return type metadata accessor for StandardSiriButtonStyle();
}

uint64_t Dictionary.init(dictionaryLiteral:)()
{
  return Dictionary.init(dictionaryLiteral:)();
}

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t StaticString.description.getter()
{
  return StaticString.description.getter();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
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

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
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

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}