uint64_t SiriExpanseInternalUIPlugin.__deallocating_deinit()
{
  uint64_t v0;

  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for SiriExpanseInternalUIPlugin()
{
  return self;
}

uint64_t associated type witness table accessor for SnippetProviding.SnippetPluginModelType : SnippetPluginModel in SiriExpanseInternalUIPlugin()
{
  return lazy protocol witness table accessor for type ExpanseUIModel and conformance ExpanseUIModel(&lazy protocol witness table cache variable for type ExpanseUIModel and conformance ExpanseUIModel, (void (*)(uint64_t))type metadata accessor for ExpanseUIModel);
}

uint64_t protocol witness for SnippetProviding.init() in conformance SiriExpanseInternalUIPlugin@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = swift_allocObject();
  *a1 = result;
  return result;
}

uint64_t protocol witness for SnippetProviding.snippet(for:mode:idiom:) in conformance SiriExpanseInternalUIPlugin(uint64_t a1)
{
  return specialized SiriExpanseInternalUIPlugin.snippet(for:mode:idiom:)(a1);
}

uint64_t specialized SiriExpanseInternalUIPlugin.snippet(for:mode:idiom:)(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for BinaryButtonSnippetView();
  MEMORY[0x270FA5388]();
  v4 = (uint64_t *)((char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
  MEMORY[0x270FA5388]();
  v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for AppStorePunchoutButtonView();
  MEMORY[0x270FA5388]();
  v9 = (uint64_t *)((char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
  MEMORY[0x270FA5388]();
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for ExpanseUIModel(0);
  MEMORY[0x270FA5388]();
  v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of ExpanseUIModel(a1, (uint64_t)v13, type metadata accessor for ExpanseUIModel);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    outlined init with take of ExpanseUIModel.BinaryButtonSnippetModel((uint64_t)v13, (uint64_t)v6, type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel);
    outlined init with copy of ExpanseUIModel((uint64_t)v6, (uint64_t)v4 + *(int *)(v2 + 20), type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel);
    type metadata accessor for Context();
    lazy protocol witness table accessor for type ExpanseUIModel and conformance ExpanseUIModel((unint64_t *)&lazy protocol witness table cache variable for type Context and conformance Context, MEMORY[0x263F77980]);
    uint64_t *v4 = EnvironmentObject.init()();
    v4[1] = v14;
    lazy protocol witness table accessor for type ExpanseUIModel and conformance ExpanseUIModel(&lazy protocol witness table cache variable for type BinaryButtonSnippetView and conformance BinaryButtonSnippetView, (void (*)(uint64_t))type metadata accessor for BinaryButtonSnippetView);
    uint64_t v15 = View.eraseToAnyView()();
    outlined destroy of BinaryButtonSnippetView((uint64_t)v4, (uint64_t (*)(void))type metadata accessor for BinaryButtonSnippetView);
    v16 = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel;
    uint64_t v17 = (uint64_t)v6;
  }
  else
  {
    outlined init with take of ExpanseUIModel.BinaryButtonSnippetModel((uint64_t)v13, (uint64_t)v11, type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel);
    outlined init with copy of ExpanseUIModel((uint64_t)v11, (uint64_t)v9 + *(int *)(v7 + 20), type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel);
    type metadata accessor for Context();
    lazy protocol witness table accessor for type ExpanseUIModel and conformance ExpanseUIModel((unint64_t *)&lazy protocol witness table cache variable for type Context and conformance Context, MEMORY[0x263F77980]);
    uint64_t *v9 = EnvironmentObject.init()();
    v9[1] = v18;
    lazy protocol witness table accessor for type ExpanseUIModel and conformance ExpanseUIModel(&lazy protocol witness table cache variable for type AppStorePunchoutButtonView and conformance AppStorePunchoutButtonView, (void (*)(uint64_t))type metadata accessor for AppStorePunchoutButtonView);
    uint64_t v15 = View.eraseToAnyView()();
    outlined destroy of BinaryButtonSnippetView((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for AppStorePunchoutButtonView);
    v16 = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel;
    uint64_t v17 = (uint64_t)v11;
  }
  outlined destroy of BinaryButtonSnippetView(v17, v16);
  return v15;
}

uint64_t outlined init with take of ExpanseUIModel.BinaryButtonSnippetModel(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t outlined init with copy of ExpanseUIModel(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t lazy protocol witness table accessor for type ExpanseUIModel and conformance ExpanseUIModel(unint64_t *a1, void (*a2)(uint64_t))
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

{
  uint64_t result;

  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t outlined destroy of BinaryButtonSnippetView(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t *initializeBufferWithCopyOfBuffer for BinaryButtonSnippetViewModel(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
  int v5 = *(_DWORD *)(*(void *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = v4;
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
    uint64_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + *(int *)(v6 + 20)), (uint64_t *)((char *)a2 + *(int *)(v6 + 20)), v7);
  }
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

uint64_t destroy for BinaryButtonSnippetViewModel(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
  int v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v5)((void *)(v2 - 8), a1, v2);
  uint64_t v3 = a1 + *(int *)(type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0) + 20);
  return v5(v3, v2);
}

uint64_t initializeWithCopy for BinaryButtonSnippetViewModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
  int v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  v5(a1, a2, v4);
  uint64_t v6 = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
  v5(a1 + *(int *)(v6 + 20), a2 + *(int *)(v6 + 20), v4);
  return a1;
}

uint64_t assignWithCopy for BinaryButtonSnippetViewModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
  int v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24);
  v5(a1, a2, v4);
  uint64_t v6 = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
  v5(a1 + *(int *)(v6 + 20), a2 + *(int *)(v6 + 20), v4);
  return a1;
}

uint64_t initializeWithTake for BinaryButtonSnippetViewModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
  int v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32);
  v5(a1, a2, v4);
  uint64_t v6 = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
  v5(a1 + *(int *)(v6 + 20), a2 + *(int *)(v6 + 20), v4);
  return a1;
}

uint64_t assignWithTake for BinaryButtonSnippetViewModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
  int v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40);
  v5(a1, a2, v4);
  uint64_t v6 = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
  v5(a1 + *(int *)(v6 + 20), a2 + *(int *)(v6 + 20), v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for BinaryButtonSnippetViewModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C867900);
}

uint64_t sub_25C867900(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for BinaryButtonSnippetViewModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C867980);
}

uint64_t sub_25C867980(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for BinaryButtonSnippetViewModel()
{
  uint64_t result = type metadata singleton initialization cache for BinaryButtonSnippetViewModel;
  if (!type metadata singleton initialization cache for BinaryButtonSnippetViewModel) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t type metadata completion function for BinaryButtonSnippetViewModel()
{
  uint64_t result = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

char *initializeBufferWithCopyOfBuffer for AppStorePunchoutButtonView(char *a1, char **a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  int v5 = *a2;
  *(void *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = &v5[(v4 + 16) & ~(unint64_t)v4];
    swift_retain();
  }
  else
  {
    *((void *)a1 + 1) = a2[1];
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = &a1[v6];
    uint64_t v8 = (uint64_t)a2 + v6;
    uint64_t v9 = v5;
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<String>);
    v11 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
    v11(v7, v8, v10);
    uint64_t v12 = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
    v11(&v7[*(int *)(v12 + 20)], v8 + *(int *)(v12 + 20), v10);
  }
  return a1;
}

uint64_t destroy for AppStorePunchoutButtonView(id *a1, uint64_t a2)
{
  int v4 = (char *)a1 + *(int *)(a2 + 20);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<String>);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8);
  ((void (*)(void *__return_ptr, char *, uint64_t))v8)((void *)(v5 - 8), v4, v5);
  uint64_t v6 = &v4[*(int *)(type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0) + 20)];
  return v8(v6, v5);
}

void *initializeWithCopy for AppStorePunchoutButtonView(void *a1, uint64_t a2, uint64_t a3)
{
  int v4 = *(void **)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v5;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = a2 + v6;
  id v9 = v4;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<String>);
  v11 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
  v11(v7, v8, v10);
  uint64_t v12 = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
  v11(&v7[*(int *)(v12 + 20)], v8 + *(int *)(v12 + 20), v10);
  return a1;
}

uint64_t assignWithCopy for AppStorePunchoutButtonView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v8 = v7;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<String>);
  v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 24);
  v13(v10, v11, v12);
  uint64_t v14 = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
  v13(v10 + *(int *)(v14 + 20), v11 + *(int *)(v14 + 20), v12);
  return a1;
}

_OWORD *initializeWithTake for AppStorePunchoutButtonView(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<String>);
  id v8 = *(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32);
  v8(v5, v6, v7);
  uint64_t v9 = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
  v8(&v5[*(int *)(v9 + 20)], &v6[*(int *)(v9 + 20)], v7);
  return a1;
}

uint64_t assignWithTake for AppStorePunchoutButtonView(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<String>);
  uint64_t v11 = *(void (**)(uint64_t, char *, uint64_t))(*(void *)(v10 - 8) + 40);
  v11(v8, v9, v10);
  uint64_t v12 = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
  v11(v8 + *(int *)(v12 + 20), &v9[*(int *)(v12 + 20)], v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppStorePunchoutButtonView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C867F8C);
}

uint64_t sub_25C867F8C(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v9 = type metadata accessor for AppStorePunchoutButtonViewModel();
    uint64_t v10 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48);
    uint64_t v11 = v9;
    uint64_t v12 = (char *)a1 + *(int *)(a3 + 20);
    return v10(v12, a2, v11);
  }
}

uint64_t storeEnumTagSinglePayload for AppStorePunchoutButtonView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C86805C);
}

void *sub_25C86805C(void *result, uint64_t a2, int a3, uint64_t a4)
{
  int v5 = result;
  if (a3 == 2147483646)
  {
    *uint64_t result = a2;
  }
  else
  {
    uint64_t v7 = type metadata accessor for AppStorePunchoutButtonViewModel();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for AppStorePunchoutButtonView()
{
  uint64_t result = type metadata singleton initialization cache for AppStorePunchoutButtonView;
  if (!type metadata singleton initialization cache for AppStorePunchoutButtonView) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t type metadata completion function for AppStorePunchoutButtonView()
{
  uint64_t result = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t associated type witness table accessor for View.Body : View in AppStorePunchoutButtonView()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t closure #1 in AppStorePunchoutButtonView.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v16[1] = a2;
  v16[0] = type metadata accessor for ButtonItemButtonStyle.Role();
  uint64_t v3 = *(void *)(v16[0] - 8);
  MEMORY[0x270FA5388]();
  int v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void *)(type metadata accessor for AppStorePunchoutButtonView() - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x270FA5388]();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Button<Text>);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v11 = (char *)v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of AppStorePunchoutButtonView(a1, (uint64_t)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for AppStorePunchoutButtonView);
  unint64_t v12 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v13 = swift_allocObject();
  outlined init with take of AppStorePunchoutButtonView((uint64_t)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v13 + v12);
  v16[4] = a1;
  Button.init(action:label:)();
  uint64_t v14 = v16[0];
  (*(void (**)(char *, void, void))(v3 + 104))(v5, *MEMORY[0x263F774D8], v16[0]);
  lazy protocol witness table accessor for type Button<Text> and conformance Button<A>(&lazy protocol witness table cache variable for type Button<Text> and conformance Button<A>, &demangling cache variable for type metadata for Button<Text>);
  View.buttonRole(_:)();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v14);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

void AppStorePunchoutButtonView.onButtonTapped()()
{
  unint64_t v1 = *v0;
  if (*v0)
  {
    type metadata accessor for AppStorePunchoutButtonView();
    uint64_t v6 = type metadata accessor for Context();
    uint64_t v7 = &protocol witness table for Context;
    v5[0] = v1;
    type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
    id v2 = v1;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<String>);
    Loggable.wrappedValue.getter();
    id v3 = AppStorePunchoutButtonViewModel.makeAppStorePunchout(appName:)();
    swift_bridgeObjectRelease();
    __swift_project_boxed_opaque_existential_1(v5, v6);
    id v4 = v3;
    dispatch thunk of Context.perform(aceCommand:)();

    __swift_destroy_boxed_opaque_existential_1(v5);
  }
  else
  {
    type metadata accessor for Context();
    lazy protocol witness table accessor for type Context and conformance Context();
    EnvironmentObject.error()();
    __break(1u);
  }
}

uint64_t closure #1 in closure #1 in AppStorePunchoutButtonView.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  type metadata accessor for AppStorePunchoutButtonViewModel();
  MEMORY[0x270FA5388]();
  int v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for AppStorePunchoutButtonView();
  outlined init with copy of AppStorePunchoutButtonView(a1 + *(int *)(v6 + 20), (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for AppStorePunchoutButtonViewModel);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<String>);
  Loggable.wrappedValue.getter();
  uint64_t v7 = v13;
  uint64_t v8 = v14;
  outlined destroy of ExpanseUIModel.AppStorePunchoutSnippetModel((uint64_t)v5);
  uint64_t v13 = v7;
  uint64_t v14 = v8;
  lazy protocol witness table accessor for type String and conformance String();
  uint64_t result = Text.init<A>(_:)();
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v10;
  *(unsigned char *)(a2 + 16) = v11 & 1;
  *(void *)(a2 + 24) = v12;
  return result;
}

uint64_t protocol witness for static View._makeView(view:inputs:) in conformance AppStorePunchoutButtonView()
{
  return MEMORY[0x270F032C0]();
}

uint64_t protocol witness for static View._makeViewList(view:inputs:) in conformance AppStorePunchoutButtonView()
{
  return MEMORY[0x270F032D0]();
}

uint64_t protocol witness for static View._viewListCount(inputs:) in conformance AppStorePunchoutButtonView()
{
  return static View._viewListCount(inputs:)();
}

uint64_t protocol witness for View.body.getter in conformance AppStorePunchoutButtonView(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  MEMORY[0x270FA5388]();
  outlined init with copy of AppStorePunchoutButtonView(v1, (uint64_t)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for AppStorePunchoutButtonView);
  unint64_t v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = swift_allocObject();
  outlined init with take of AppStorePunchoutButtonView((uint64_t)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v5 + v4);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.buttonRole(_:)>>.0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Button<Text>);
  uint64_t v7 = lazy protocol witness table accessor for type Button<Text> and conformance Button<A>(&lazy protocol witness table cache variable for type Button<Text> and conformance Button<A>, &demangling cache variable for type metadata for Button<Text>);
  v9[0] = v6;
  v9[1] = v7;
  swift_getOpaqueTypeConformance2();
  return ComponentStack.init(content:)();
}

uint64_t outlined init with take of AppStorePunchoutButtonView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AppStorePunchoutButtonView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t partial apply for closure #1 in AppStorePunchoutButtonView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for AppStorePunchoutButtonView() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return closure #1 in AppStorePunchoutButtonView.body.getter(v4, a1);
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

uint64_t objectdestroyTm()
{
  uint64_t v1 = (int *)(type metadata accessor for AppStorePunchoutButtonView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;

  uint64_t v7 = v6 + v1[7];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<String>);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
  v9(v7, v8);
  uint64_t v10 = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
  v9(v7 + *(int *)(v10 + 20), v8);
  return MEMORY[0x270FA0238](v0, v4, v5);
}

void partial apply for implicit closure #2 in implicit closure #1 in closure #1 in AppStorePunchoutButtonView.body.getter()
{
}

uint64_t partial apply for closure #1 in closure #1 in AppStorePunchoutButtonView.body.getter@<X0>(uint64_t a1@<X8>)
{
  return closure #1 in closure #1 in AppStorePunchoutButtonView.body.getter(*(void *)(v1 + 16), a1);
}

uint64_t outlined init with copy of AppStorePunchoutButtonView(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t outlined destroy of ExpanseUIModel.AppStorePunchoutSnippetModel(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
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

unint64_t lazy protocol witness table accessor for type Context and conformance Context()
{
  unint64_t result = lazy protocol witness table cache variable for type Context and conformance Context;
  if (!lazy protocol witness table cache variable for type Context and conformance Context)
  {
    type metadata accessor for Context();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Context and conformance Context);
  }
  return result;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return MEMORY[0x270FA0520](*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_25C868D48()
{
  return lazy protocol witness table accessor for type Button<Text> and conformance Button<A>(&lazy protocol witness table cache variable for type ComponentStack<<<opaque return type of View.buttonRole(_:)>>.0> and conformance ComponentStack<A>, &demangling cache variable for type metadata for ComponentStack<<<opaque return type of View.buttonRole(_:)>>.0>);
}

uint64_t lazy protocol witness table accessor for type Button<Text> and conformance Button<A>(unint64_t *a1, uint64_t *a2)
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

uint64_t *initializeBufferWithCopyOfBuffer for AppStorePunchoutButtonViewModel(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
  int v5 = *(_DWORD *)(*(void *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = v4;
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<String>);
    uint64_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + *(int *)(v6 + 20)), (uint64_t *)((char *)a2 + *(int *)(v6 + 20)), v7);
  }
  return a1;
}

uint64_t destroy for AppStorePunchoutButtonViewModel(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<String>);
  int v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v5)((void *)(v2 - 8), a1, v2);
  uint64_t v3 = a1 + *(int *)(type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0) + 20);
  return v5(v3, v2);
}

uint64_t initializeWithCopy for AppStorePunchoutButtonViewModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<String>);
  int v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  v5(a1, a2, v4);
  uint64_t v6 = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
  v5(a1 + *(int *)(v6 + 20), a2 + *(int *)(v6 + 20), v4);
  return a1;
}

uint64_t assignWithCopy for AppStorePunchoutButtonViewModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<String>);
  int v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24);
  v5(a1, a2, v4);
  uint64_t v6 = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
  v5(a1 + *(int *)(v6 + 20), a2 + *(int *)(v6 + 20), v4);
  return a1;
}

uint64_t initializeWithTake for AppStorePunchoutButtonViewModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<String>);
  int v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32);
  v5(a1, a2, v4);
  uint64_t v6 = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
  v5(a1 + *(int *)(v6 + 20), a2 + *(int *)(v6 + 20), v4);
  return a1;
}

uint64_t assignWithTake for AppStorePunchoutButtonViewModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<String>);
  int v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40);
  v5(a1, a2, v4);
  uint64_t v6 = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
  v5(a1 + *(int *)(v6 + 20), a2 + *(int *)(v6 + 20), v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppStorePunchoutButtonViewModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C8691F0);
}

uint64_t sub_25C8691F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for AppStorePunchoutButtonViewModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C869270);
}

uint64_t sub_25C869270(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for AppStorePunchoutButtonViewModel()
{
  uint64_t result = type metadata singleton initialization cache for AppStorePunchoutButtonViewModel;
  if (!type metadata singleton initialization cache for AppStorePunchoutButtonViewModel) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t type metadata completion function for AppStorePunchoutButtonViewModel()
{
  uint64_t result = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

id AppStorePunchoutButtonViewModel.makeAppStorePunchout(appName:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x270FA5388]();
  unint64_t v1 = (char *)&v13 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = type metadata accessor for URLComponents();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  int v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  URLComponents.init()();
  URLComponents.scheme.setter();
  MEMORY[0x261194E00](0, 0xE000000000000000);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<URLQueryItem>);
  type metadata accessor for URLQueryItem();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_25C870420;
  URLQueryItem.init(name:value:)();
  URLQueryItem.init(name:value:)();
  URLQueryItem.init(name:value:)();
  URLComponents.queryItems.setter();
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64EE0]), sel_init);
  URLComponents.url.getter();
  uint64_t v7 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v1, 1, v7) != 1)
  {
    URL._bridgeToObjectiveC()(v9);
    uint64_t v10 = v11;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v1, v7);
  }
  objc_msgSend(v6, sel_setPunchOutUri_, v10);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v6;
}

uint64_t base witness table accessor for Decodable in ExpanseUIModel()
{
  return lazy protocol witness table accessor for type ExpanseUIModel and conformance ExpanseUIModel(&lazy protocol witness table cache variable for type ExpanseUIModel and conformance ExpanseUIModel, (void (*)(uint64_t))type metadata accessor for ExpanseUIModel);
}

uint64_t type metadata accessor for ExpanseUIModel(uint64_t a1)
{
  return type metadata accessor for ExpanseUIModel(a1, (uint64_t *)&type metadata singleton initialization cache for ExpanseUIModel);
}

uint64_t base witness table accessor for Encodable in ExpanseUIModel()
{
  return lazy protocol witness table accessor for type ExpanseUIModel and conformance ExpanseUIModel(&lazy protocol witness table cache variable for type ExpanseUIModel and conformance ExpanseUIModel, (void (*)(uint64_t))type metadata accessor for ExpanseUIModel);
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys()
{
  if (*v0) {
    return 0x656D614E707061;
  }
  else {
    return 0x614C6E6F74747562;
  }
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys()
{
  return 0;
}

void protocol witness for CodingKey.init(intValue:) in conformance ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys and conformance ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys and conformance ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ExpanseUIModel.AppStorePunchoutSnippetModel.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys>);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  id v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys and conformance ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v8[15] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<String>);
  lazy protocol witness table accessor for type Loggable<String> and conformance <A> Loggable<A>(&lazy protocol witness table cache variable for type Loggable<String> and conformance <A> Loggable<A>);
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v1)
  {
    type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
    v8[14] = 1;
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t ExpanseUIModel.AppStorePunchoutSnippetModel.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v25 = a2;
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<String>);
  uint64_t v27 = *(void *)(v30 - 8);
  uint64_t v4 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  id v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  v28 = (char *)&v21 - v7;
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys>);
  uint64_t v26 = *(void *)(v29 - 8);
  MEMORY[0x270FA5388](v29);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys and conformance ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1(a1);
  }
  uint64_t v22 = v10;
  v23 = v6;
  uint64_t v14 = v26;
  uint64_t v13 = v27;
  v24 = v12;
  char v32 = 0;
  uint64_t v15 = lazy protocol witness table accessor for type Loggable<String> and conformance <A> Loggable<A>(&lazy protocol witness table cache variable for type Loggable<String> and conformance <A> Loggable<A>);
  v16 = v28;
  uint64_t v17 = v29;
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  uint64_t v21 = v15;
  v28 = *(char **)(v13 + 32);
  ((void (*)(char *, char *, uint64_t))v28)(v24, v16, v30);
  char v31 = 1;
  uint64_t v18 = v23;
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v9, v17);
  uint64_t v19 = (uint64_t)v24;
  ((void (*)(char *, char *, uint64_t))v28)(&v24[*(int *)(v22 + 20)], v18, v30);
  _s21SiriExpanseInternalUI0B7UIModelOWOcTm_0(v19, v25, type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return outlined destroy of ExpanseUIModel.BinaryButtonSnippetModel(v19, type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel);
}

uint64_t ExpanseUIModel.BinaryButtonSnippetModel.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys>);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  id v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys and conformance ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v8[15] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
  lazy protocol witness table accessor for type Loggable<ExpanseUIModel.ButtonModel> and conformance <A> Loggable<A>(&lazy protocol witness table cache variable for type Loggable<ExpanseUIModel.ButtonModel> and conformance <A> Loggable<A>);
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v1)
  {
    type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
    v8[14] = 1;
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t ExpanseUIModel.BinaryButtonSnippetModel.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v25 = a2;
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
  uint64_t v27 = *(void *)(v30 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v30);
  id v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  v28 = (char *)&v21 - v7;
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys>);
  uint64_t v26 = *(void *)(v29 - 8);
  MEMORY[0x270FA5388](v29);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys and conformance ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1(a1);
  }
  uint64_t v22 = v10;
  v23 = v6;
  uint64_t v14 = v26;
  uint64_t v13 = v27;
  v24 = v12;
  char v32 = 0;
  uint64_t v15 = lazy protocol witness table accessor for type Loggable<ExpanseUIModel.ButtonModel> and conformance <A> Loggable<A>(&lazy protocol witness table cache variable for type Loggable<ExpanseUIModel.ButtonModel> and conformance <A> Loggable<A>);
  v16 = v28;
  uint64_t v17 = v29;
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  uint64_t v21 = v15;
  v28 = *(char **)(v13 + 32);
  ((void (*)(char *, char *, uint64_t))v28)(v24, v16, v30);
  char v31 = 1;
  uint64_t v18 = v23;
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v9, v17);
  uint64_t v19 = (uint64_t)v24;
  ((void (*)(char *, char *, uint64_t))v28)(&v24[*(int *)(v22 + 20)], v18, v30);
  _s21SiriExpanseInternalUI0B7UIModelOWOcTm_0(v19, v25, type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return outlined destroy of ExpanseUIModel.BinaryButtonSnippetModel(v19, type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel);
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance ExpanseUIModel.AppStorePunchoutSnippetModel()
{
  if ((static Loggable<A>.== infix(_:_:)() & 1) == 0) {
    return 0;
  }
  return static Loggable<A>.== infix(_:_:)();
}

uint64_t protocol witness for Decodable.init(from:) in conformance ExpanseUIModel.AppStorePunchoutSnippetModel@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ExpanseUIModel.AppStorePunchoutSnippetModel.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance ExpanseUIModel.AppStorePunchoutSnippetModel(void *a1)
{
  return ExpanseUIModel.AppStorePunchoutSnippetModel.encode(to:)(a1);
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys()
{
  if (*v0) {
    return 0x7261646E6F636573;
  }
  else {
    return 0x427972616D697270;
  }
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys and conformance ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys and conformance ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t protocol witness for Decodable.init(from:) in conformance ExpanseUIModel.BinaryButtonSnippetModel@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ExpanseUIModel.BinaryButtonSnippetModel.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance ExpanseUIModel.BinaryButtonSnippetModel(void *a1)
{
  return ExpanseUIModel.BinaryButtonSnippetModel.encode(to:)(a1);
}

uint64_t ExpanseUIModel.ButtonModel.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ExpanseUIModel.ButtonModel.CodingKeys>);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  id v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type ExpanseUIModel.ButtonModel.CodingKeys and conformance ExpanseUIModel.ButtonModel.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v8[15] = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v1)
  {
    type metadata accessor for ExpanseUIModel.ButtonModel(0);
    v8[14] = 1;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodableAceObject<SAIntentGroupRunSiriKitExecutor>);
    lazy protocol witness table accessor for type CodableAceObject<SAIntentGroupRunSiriKitExecutor> and conformance CodableAceObject<A>(&lazy protocol witness table cache variable for type CodableAceObject<SAIntentGroupRunSiriKitExecutor> and conformance CodableAceObject<A>);
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t ExpanseUIModel.ButtonModel.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v17 = a2;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodableAceObject<SAIntentGroupRunSiriKitExecutor>);
  uint64_t v16 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ExpanseUIModel.ButtonModel.CodingKeys>);
  uint64_t v18 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for ExpanseUIModel.ButtonModel(0);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (uint64_t *)((char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type ExpanseUIModel.ButtonModel.CodingKeys and conformance ExpanseUIModel.ButtonModel.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1(a1);
  }
  uint64_t v15 = v8;
  uint64_t v12 = v18;
  uint64_t v11 = v19;
  char v22 = 0;
  *uint64_t v10 = KeyedDecodingContainer.decode(_:forKey:)();
  v10[1] = v13;
  char v21 = 1;
  lazy protocol witness table accessor for type CodableAceObject<SAIntentGroupRunSiriKitExecutor> and conformance CodableAceObject<A>(&lazy protocol witness table cache variable for type CodableAceObject<SAIntentGroupRunSiriKitExecutor> and conformance CodableAceObject<A>);
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v20);
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))((char *)v10 + *(int *)(v15 + 20), v5, v11);
  _s21SiriExpanseInternalUI0B7UIModelOWOcTm_0((uint64_t)v10, v17, type metadata accessor for ExpanseUIModel.ButtonModel);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return outlined destroy of ExpanseUIModel.BinaryButtonSnippetModel((uint64_t)v10, type metadata accessor for ExpanseUIModel.ButtonModel);
}

uint64_t ExpanseUIModel.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ExpanseUIModel.BinaryButtonCodingKeys>);
  uint64_t v32 = *(void *)(v2 - 8);
  uint64_t v33 = v2;
  MEMORY[0x270FA5388](v2);
  char v31 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
  MEMORY[0x270FA5388](v29);
  uint64_t v30 = (uint64_t)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ExpanseUIModel.AppStorePunchoutCodingKeys>);
  uint64_t v27 = *(void *)(v5 - 8);
  uint64_t v28 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
  MEMORY[0x270FA5388](v26);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for ExpanseUIModel(0);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ExpanseUIModel.CodingKeys>);
  uint64_t v13 = *(void *)(v34 - 8);
  MEMORY[0x270FA5388](v34);
  uint64_t v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type ExpanseUIModel.CodingKeys and conformance ExpanseUIModel.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  _s21SiriExpanseInternalUI0B7UIModelOWOcTm_0(v35, (uint64_t)v12, type metadata accessor for ExpanseUIModel);
  uint64_t v16 = (uint64_t (**)(char *, uint64_t))(v13 + 8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v17 = v30;
    outlined init with take of ExpanseUIModel((uint64_t)v12, v30, type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel);
    char v37 = 1;
    lazy protocol witness table accessor for type ExpanseUIModel.BinaryButtonCodingKeys and conformance ExpanseUIModel.BinaryButtonCodingKeys();
    uint64_t v18 = v31;
    uint64_t v19 = v34;
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    lazy protocol witness table accessor for type ExpanseUIModel and conformance ExpanseUIModel(&lazy protocol witness table cache variable for type ExpanseUIModel.BinaryButtonSnippetModel and conformance ExpanseUIModel.BinaryButtonSnippetModel, (void (*)(uint64_t))type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel);
    uint64_t v20 = v33;
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v18, v20);
    char v21 = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel;
    uint64_t v22 = v17;
  }
  else
  {
    outlined init with take of ExpanseUIModel((uint64_t)v12, (uint64_t)v9, type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel);
    char v36 = 0;
    lazy protocol witness table accessor for type ExpanseUIModel.AppStorePunchoutCodingKeys and conformance ExpanseUIModel.AppStorePunchoutCodingKeys();
    uint64_t v19 = v34;
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    lazy protocol witness table accessor for type ExpanseUIModel and conformance ExpanseUIModel(&lazy protocol witness table cache variable for type ExpanseUIModel.AppStorePunchoutSnippetModel and conformance ExpanseUIModel.AppStorePunchoutSnippetModel, (void (*)(uint64_t))type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel);
    uint64_t v23 = v28;
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v7, v23);
    char v21 = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel;
    uint64_t v22 = (uint64_t)v9;
  }
  outlined destroy of ExpanseUIModel.BinaryButtonSnippetModel(v22, v21);
  return (*v16)(v15, v19);
}

uint64_t ExpanseUIModel.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v37 = a2;
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ExpanseUIModel.BinaryButtonCodingKeys>);
  uint64_t v41 = *(void *)(v38 - 8);
  MEMORY[0x270FA5388](v38);
  v44 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ExpanseUIModel.AppStorePunchoutCodingKeys>);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v39 = v4;
  uint64_t v40 = v5;
  MEMORY[0x270FA5388](v4);
  v43 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ExpanseUIModel.CodingKeys>);
  uint64_t v42 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for ExpanseUIModel(0);
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&v35 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v35 - v17;
  uint64_t v19 = a1[3];
  v45 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v19);
  lazy protocol witness table accessor for type ExpanseUIModel.CodingKeys and conformance ExpanseUIModel.CodingKeys();
  uint64_t v20 = v46;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v20) {
    goto LABEL_7;
  }
  uint64_t v35 = v18;
  char v36 = v13;
  char v21 = v16;
  uint64_t v22 = v43;
  uint64_t v23 = v44;
  uint64_t v46 = v10;
  uint64_t v24 = KeyedDecodingContainer.allKeys.getter();
  uint64_t v25 = v9;
  if (*(void *)(v24 + 16) != 1)
  {
    uint64_t v29 = type metadata accessor for DecodingError();
    swift_allocError();
    char v31 = v30;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (@thick Any.Type, DecodingError.Context));
    *char v31 = v46;
    KeyedDecodingContainer.codingPath.getter();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v29 - 8) + 104))(v31, *MEMORY[0x263F8DCB0], v29);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v42 + 8))(v9, v7);
LABEL_7:
    uint64_t v27 = v45;
    return __swift_destroy_boxed_opaque_existential_1(v27);
  }
  if (*(unsigned char *)(v24 + 32))
  {
    char v48 = 1;
    lazy protocol witness table accessor for type ExpanseUIModel.BinaryButtonCodingKeys and conformance ExpanseUIModel.BinaryButtonCodingKeys();
    KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
    lazy protocol witness table accessor for type ExpanseUIModel and conformance ExpanseUIModel(&lazy protocol witness table cache variable for type ExpanseUIModel.BinaryButtonSnippetModel and conformance ExpanseUIModel.BinaryButtonSnippetModel, (void (*)(uint64_t))type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel);
    uint64_t v26 = v38;
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v23, v26);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v42 + 8))(v9, v7);
    uint64_t v27 = v45;
    uint64_t v28 = (uint64_t)v36;
  }
  else
  {
    char v47 = 0;
    lazy protocol witness table accessor for type ExpanseUIModel.AppStorePunchoutCodingKeys and conformance ExpanseUIModel.AppStorePunchoutCodingKeys();
    KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
    lazy protocol witness table accessor for type ExpanseUIModel and conformance ExpanseUIModel(&lazy protocol witness table cache variable for type ExpanseUIModel.AppStorePunchoutSnippetModel and conformance ExpanseUIModel.AppStorePunchoutSnippetModel, (void (*)(uint64_t))type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel);
    uint64_t v28 = (uint64_t)v21;
    uint64_t v33 = v39;
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v40 + 8))(v22, v33);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v42 + 8))(v25, v7);
    uint64_t v27 = v45;
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v34 = (uint64_t)v35;
  outlined init with take of ExpanseUIModel(v28, (uint64_t)v35, type metadata accessor for ExpanseUIModel);
  outlined init with take of ExpanseUIModel(v34, v37, type metadata accessor for ExpanseUIModel);
  return __swift_destroy_boxed_opaque_existential_1(v27);
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance ExpanseUIModel.ButtonModel.CodingKeys()
{
  if (*v0) {
    return 0xD000000000000010;
  }
  else {
    return 0x6C6562616CLL;
  }
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance ExpanseUIModel.ButtonModel.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized ExpanseUIModel.ButtonModel.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ExpanseUIModel.ButtonModel.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ExpanseUIModel.ButtonModel.CodingKeys and conformance ExpanseUIModel.ButtonModel.CodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ExpanseUIModel.ButtonModel.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ExpanseUIModel.ButtonModel.CodingKeys and conformance ExpanseUIModel.ButtonModel.CodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t protocol witness for Decodable.init(from:) in conformance ExpanseUIModel.ButtonModel@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ExpanseUIModel.ButtonModel.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance ExpanseUIModel.ButtonModel(void *a1)
{
  return ExpanseUIModel.ButtonModel.encode(to:)(a1);
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance ExpanseUIModel.AppStorePunchoutCodingKeys()
{
  return 1;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance ExpanseUIModel.AppStorePunchoutCodingKeys()
{
  return 12383;
}

void protocol witness for CodingKey.init(intValue:) in conformance ExpanseUIModel.AppStorePunchoutCodingKeys(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ExpanseUIModel.AppStorePunchoutCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ExpanseUIModel.AppStorePunchoutCodingKeys and conformance ExpanseUIModel.AppStorePunchoutCodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ExpanseUIModel.AppStorePunchoutCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ExpanseUIModel.AppStorePunchoutCodingKeys and conformance ExpanseUIModel.AppStorePunchoutCodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance ExpanseUIModel.AppStorePunchoutCodingKeys()
{
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance ExpanseUIModel.BinaryButtonCodingKeys()
{
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance ExpanseUIModel.AppStorePunchoutCodingKeys()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance ExpanseUIModel.AppStorePunchoutCodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
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

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ExpanseUIModel.BinaryButtonCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ExpanseUIModel.BinaryButtonCodingKeys and conformance ExpanseUIModel.BinaryButtonCodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ExpanseUIModel.BinaryButtonCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ExpanseUIModel.BinaryButtonCodingKeys and conformance ExpanseUIModel.BinaryButtonCodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance ExpanseUIModel.CodingKeys(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance ExpanseUIModel.CodingKeys()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance ExpanseUIModel.CodingKeys()
{
  if (*v0) {
    return 0x75427972616E6962;
  }
  else {
    return 0xD000000000000010;
  }
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance ExpanseUIModel.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized ExpanseUIModel.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ExpanseUIModel.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ExpanseUIModel.CodingKeys and conformance ExpanseUIModel.CodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ExpanseUIModel.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ExpanseUIModel.CodingKeys and conformance ExpanseUIModel.CodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

unint64_t protocol witness for static SnippetPluginModel.bundleName.getter in conformance ExpanseUIModel()
{
  return 0xD00000000000001BLL;
}

uint64_t protocol witness for SnippetPluginModel.snippetHidden(for:idiom:) in conformance ExpanseUIModel()
{
  return MEMORY[0x270F739D8]();
}

uint64_t protocol witness for Decodable.init(from:) in conformance ExpanseUIModel@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ExpanseUIModel.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance ExpanseUIModel(void *a1)
{
  return ExpanseUIModel.encode(to:)(a1);
}

unint64_t lazy protocol witness table accessor for type ExpanseUIModel.CodingKeys and conformance ExpanseUIModel.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type ExpanseUIModel.CodingKeys and conformance ExpanseUIModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type ExpanseUIModel.CodingKeys and conformance ExpanseUIModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExpanseUIModel.CodingKeys and conformance ExpanseUIModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ExpanseUIModel.CodingKeys and conformance ExpanseUIModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type ExpanseUIModel.CodingKeys and conformance ExpanseUIModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExpanseUIModel.CodingKeys and conformance ExpanseUIModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ExpanseUIModel.CodingKeys and conformance ExpanseUIModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type ExpanseUIModel.CodingKeys and conformance ExpanseUIModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExpanseUIModel.CodingKeys and conformance ExpanseUIModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ExpanseUIModel.CodingKeys and conformance ExpanseUIModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type ExpanseUIModel.CodingKeys and conformance ExpanseUIModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExpanseUIModel.CodingKeys and conformance ExpanseUIModel.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ExpanseUIModel.BinaryButtonCodingKeys and conformance ExpanseUIModel.BinaryButtonCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type ExpanseUIModel.BinaryButtonCodingKeys and conformance ExpanseUIModel.BinaryButtonCodingKeys;
  if (!lazy protocol witness table cache variable for type ExpanseUIModel.BinaryButtonCodingKeys and conformance ExpanseUIModel.BinaryButtonCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExpanseUIModel.BinaryButtonCodingKeys and conformance ExpanseUIModel.BinaryButtonCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ExpanseUIModel.BinaryButtonCodingKeys and conformance ExpanseUIModel.BinaryButtonCodingKeys;
  if (!lazy protocol witness table cache variable for type ExpanseUIModel.BinaryButtonCodingKeys and conformance ExpanseUIModel.BinaryButtonCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExpanseUIModel.BinaryButtonCodingKeys and conformance ExpanseUIModel.BinaryButtonCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ExpanseUIModel.BinaryButtonCodingKeys and conformance ExpanseUIModel.BinaryButtonCodingKeys;
  if (!lazy protocol witness table cache variable for type ExpanseUIModel.BinaryButtonCodingKeys and conformance ExpanseUIModel.BinaryButtonCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExpanseUIModel.BinaryButtonCodingKeys and conformance ExpanseUIModel.BinaryButtonCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ExpanseUIModel.BinaryButtonCodingKeys and conformance ExpanseUIModel.BinaryButtonCodingKeys;
  if (!lazy protocol witness table cache variable for type ExpanseUIModel.BinaryButtonCodingKeys and conformance ExpanseUIModel.BinaryButtonCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExpanseUIModel.BinaryButtonCodingKeys and conformance ExpanseUIModel.BinaryButtonCodingKeys);
  }
  return result;
}

uint64_t type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(uint64_t a1)
{
  return type metadata accessor for ExpanseUIModel(a1, (uint64_t *)&type metadata singleton initialization cache for ExpanseUIModel.BinaryButtonSnippetModel);
}

unint64_t lazy protocol witness table accessor for type ExpanseUIModel.AppStorePunchoutCodingKeys and conformance ExpanseUIModel.AppStorePunchoutCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type ExpanseUIModel.AppStorePunchoutCodingKeys and conformance ExpanseUIModel.AppStorePunchoutCodingKeys;
  if (!lazy protocol witness table cache variable for type ExpanseUIModel.AppStorePunchoutCodingKeys and conformance ExpanseUIModel.AppStorePunchoutCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExpanseUIModel.AppStorePunchoutCodingKeys and conformance ExpanseUIModel.AppStorePunchoutCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ExpanseUIModel.AppStorePunchoutCodingKeys and conformance ExpanseUIModel.AppStorePunchoutCodingKeys;
  if (!lazy protocol witness table cache variable for type ExpanseUIModel.AppStorePunchoutCodingKeys and conformance ExpanseUIModel.AppStorePunchoutCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExpanseUIModel.AppStorePunchoutCodingKeys and conformance ExpanseUIModel.AppStorePunchoutCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ExpanseUIModel.AppStorePunchoutCodingKeys and conformance ExpanseUIModel.AppStorePunchoutCodingKeys;
  if (!lazy protocol witness table cache variable for type ExpanseUIModel.AppStorePunchoutCodingKeys and conformance ExpanseUIModel.AppStorePunchoutCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExpanseUIModel.AppStorePunchoutCodingKeys and conformance ExpanseUIModel.AppStorePunchoutCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ExpanseUIModel.AppStorePunchoutCodingKeys and conformance ExpanseUIModel.AppStorePunchoutCodingKeys;
  if (!lazy protocol witness table cache variable for type ExpanseUIModel.AppStorePunchoutCodingKeys and conformance ExpanseUIModel.AppStorePunchoutCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExpanseUIModel.AppStorePunchoutCodingKeys and conformance ExpanseUIModel.AppStorePunchoutCodingKeys);
  }
  return result;
}

uint64_t type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(uint64_t a1)
{
  return type metadata accessor for ExpanseUIModel(a1, (uint64_t *)&type metadata singleton initialization cache for ExpanseUIModel.AppStorePunchoutSnippetModel);
}

uint64_t outlined init with take of ExpanseUIModel(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t outlined destroy of ExpanseUIModel.BinaryButtonSnippetModel(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t *initializeBufferWithCopyOfBuffer for ExpanseUIModel.ButtonModel(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = *(int *)(a3 + 20);
    char v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    swift_bridgeObjectRetain();
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodableAceObject<SAIntentGroupRunSiriKitExecutor>);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  }
  return a1;
}

uint64_t destroy for ExpanseUIModel.ButtonModel(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodableAceObject<SAIntentGroupRunSiriKitExecutor>);
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *initializeWithCopy for ExpanseUIModel.ButtonModel(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (char *)a1 + v5;
  char v7 = (char *)a2 + v5;
  swift_bridgeObjectRetain();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodableAceObject<SAIntentGroupRunSiriKitExecutor>);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
  return a1;
}

void *assignWithCopy for ExpanseUIModel.ButtonModel(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  char v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodableAceObject<SAIntentGroupRunSiriKitExecutor>);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *initializeWithTake for ExpanseUIModel.ButtonModel(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodableAceObject<SAIntentGroupRunSiriKitExecutor>);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void *assignWithTake for ExpanseUIModel.ButtonModel(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodableAceObject<SAIntentGroupRunSiriKitExecutor>);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for ExpanseUIModel.ButtonModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C86C030);
}

uint64_t sub_25C86C030(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodableAceObject<SAIntentGroupRunSiriKitExecutor>);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for ExpanseUIModel.ButtonModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C86C0F8);
}

uint64_t sub_25C86C0F8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodableAceObject<SAIntentGroupRunSiriKitExecutor>);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for ExpanseUIModel.ButtonModel(uint64_t a1)
{
  return type metadata accessor for ExpanseUIModel(a1, (uint64_t *)&type metadata singleton initialization cache for ExpanseUIModel.ButtonModel);
}

uint64_t type metadata accessor for ExpanseUIModel(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void type metadata completion function for ExpanseUIModel.ButtonModel()
{
  type metadata accessor for CodableAceObject<SAIntentGroupRunSiriKitExecutor>(319, &lazy cache variable for type metadata for CodableAceObject<SAIntentGroupRunSiriKitExecutor>, (uint64_t (*)(uint64_t))type metadata accessor for SAIntentGroupRunSiriKitExecutor, MEMORY[0x263F76C68]);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unint64_t type metadata accessor for SAIntentGroupRunSiriKitExecutor()
{
  unint64_t result = lazy cache variable for type metadata for SAIntentGroupRunSiriKitExecutor;
  if (!lazy cache variable for type metadata for SAIntentGroupRunSiriKitExecutor)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for SAIntentGroupRunSiriKitExecutor);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for ExpanseUIModel.AppStorePunchoutSnippetModel(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return initializeBufferWithCopyOfBuffer for ExpanseUIModel.AppStorePunchoutSnippetModel(a1, a2, a3, &demangling cache variable for type metadata for Loggable<String>);
}

uint64_t destroy for ExpanseUIModel.AppStorePunchoutSnippetModel(uint64_t a1, uint64_t a2)
{
  return destroy for ExpanseUIModel.AppStorePunchoutSnippetModel(a1, a2, &demangling cache variable for type metadata for Loggable<String>);
}

uint64_t initializeWithCopy for ExpanseUIModel.AppStorePunchoutSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return initializeWithCopy for ExpanseUIModel.AppStorePunchoutSnippetModel(a1, a2, a3, &demangling cache variable for type metadata for Loggable<String>);
}

uint64_t assignWithCopy for ExpanseUIModel.AppStorePunchoutSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return assignWithCopy for ExpanseUIModel.AppStorePunchoutSnippetModel(a1, a2, a3, &demangling cache variable for type metadata for Loggable<String>);
}

uint64_t initializeWithTake for ExpanseUIModel.AppStorePunchoutSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return initializeWithTake for ExpanseUIModel.AppStorePunchoutSnippetModel(a1, a2, a3, &demangling cache variable for type metadata for Loggable<String>);
}

uint64_t assignWithTake for ExpanseUIModel.AppStorePunchoutSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return assignWithTake for ExpanseUIModel.AppStorePunchoutSnippetModel(a1, a2, a3, &demangling cache variable for type metadata for Loggable<String>);
}

uint64_t getEnumTagSinglePayload for ExpanseUIModel.AppStorePunchoutSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C86C360);
}

uint64_t sub_25C86C360(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_2Tm(a1, a2, a3, &demangling cache variable for type metadata for Loggable<String>);
}

uint64_t storeEnumTagSinglePayload for ExpanseUIModel.AppStorePunchoutSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C86C380);
}

uint64_t sub_25C86C380(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_3Tm(a1, a2, a3, a4, &demangling cache variable for type metadata for Loggable<String>);
}

void type metadata completion function for ExpanseUIModel.AppStorePunchoutSnippetModel()
{
  type metadata accessor for Loggable<String>();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void type metadata accessor for Loggable<String>()
{
  if (!lazy cache variable for type metadata for Loggable<String>)
  {
    unint64_t v0 = type metadata accessor for Loggable();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for Loggable<String>);
    }
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for ExpanseUIModel.BinaryButtonSnippetModel(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return initializeBufferWithCopyOfBuffer for ExpanseUIModel.AppStorePunchoutSnippetModel(a1, a2, a3, &demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
}

uint64_t *initializeBufferWithCopyOfBuffer for ExpanseUIModel.AppStorePunchoutSnippetModel(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  int v6 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v6 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(a4);
    uint64_t v9 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v8 - 8) + 16);
    v9(a1, a2, v8);
    v9((uint64_t *)((char *)a1 + *(int *)(a3 + 20)), (uint64_t *)((char *)a2 + *(int *)(a3 + 20)), v8);
  }
  return a1;
}

uint64_t destroy for ExpanseUIModel.BinaryButtonSnippetModel(uint64_t a1, uint64_t a2)
{
  return destroy for ExpanseUIModel.AppStorePunchoutSnippetModel(a1, a2, &demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
}

uint64_t destroy for ExpanseUIModel.AppStorePunchoutSnippetModel(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v8)((void *)(v5 - 8), a1, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 20);
  return v8(v6, v5);
}

uint64_t initializeWithCopy for ExpanseUIModel.BinaryButtonSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return initializeWithCopy for ExpanseUIModel.AppStorePunchoutSnippetModel(a1, a2, a3, &demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
}

uint64_t initializeWithCopy for ExpanseUIModel.AppStorePunchoutSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(a4);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);
  v8(a1, a2, v7);
  v8(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v7);
  return a1;
}

uint64_t assignWithCopy for ExpanseUIModel.BinaryButtonSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return assignWithCopy for ExpanseUIModel.AppStorePunchoutSnippetModel(a1, a2, a3, &demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
}

uint64_t assignWithCopy for ExpanseUIModel.AppStorePunchoutSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(a4);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 24);
  v8(a1, a2, v7);
  v8(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v7);
  return a1;
}

uint64_t initializeWithTake for ExpanseUIModel.BinaryButtonSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return initializeWithTake for ExpanseUIModel.AppStorePunchoutSnippetModel(a1, a2, a3, &demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
}

uint64_t initializeWithTake for ExpanseUIModel.AppStorePunchoutSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(a4);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32);
  v8(a1, a2, v7);
  v8(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v7);
  return a1;
}

uint64_t assignWithTake for ExpanseUIModel.BinaryButtonSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return assignWithTake for ExpanseUIModel.AppStorePunchoutSnippetModel(a1, a2, a3, &demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
}

uint64_t assignWithTake for ExpanseUIModel.AppStorePunchoutSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(a4);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 40);
  v8(a1, a2, v7);
  v8(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for ExpanseUIModel.BinaryButtonSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C86C8B4);
}

uint64_t sub_25C86C8B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_2Tm(a1, a2, a3, &demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
}

uint64_t __swift_get_extra_inhabitant_index_2Tm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(a4);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48);
  return v7(a1, a2, v6);
}

uint64_t storeEnumTagSinglePayload for ExpanseUIModel.BinaryButtonSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C86C940);
}

uint64_t sub_25C86C940(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_3Tm(a1, a2, a3, a4, &demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
}

uint64_t __swift_store_extra_inhabitant_index_3Tm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
  return v8(a1, a2, a2, v7);
}

void type metadata completion function for ExpanseUIModel.BinaryButtonSnippetModel()
{
  type metadata accessor for CodableAceObject<SAIntentGroupRunSiriKitExecutor>(319, &lazy cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>, type metadata accessor for ExpanseUIModel.ButtonModel, MEMORY[0x263F77230]);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void type metadata accessor for CodableAceObject<SAIntentGroupRunSiriKitExecutor>(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTag for ExpanseUIModel.CodingKeys(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *destructiveInjectEnumTag for ExpanseUIModel.CodingKeys(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

void *type metadata accessor for ExpanseUIModel.CodingKeys()
{
  return &unk_2709EAB00;
}

uint64_t getEnumTag for ExpanseUIModel.AppStorePunchoutCodingKeys()
{
  return 0;
}

void *type metadata accessor for ExpanseUIModel.AppStorePunchoutCodingKeys()
{
  return &unk_2709EAB90;
}

uint64_t getEnumTagSinglePayload for ExpanseUIModel.AppStorePunchoutCodingKeys(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for ExpanseUIModel.AppStorePunchoutCodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25C86CC2CLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

void *type metadata accessor for ExpanseUIModel.BinaryButtonCodingKeys()
{
  return &unk_2709EAC20;
}

uint64_t *initializeBufferWithCopyOfBuffer for ExpanseUIModel(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
      uint64_t v7 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16);
      v7(a1, a2, v6);
      uint64_t v8 = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
    }
    else
    {
      uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<String>);
      uint64_t v7 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16);
      v7(a1, a2, v6);
      uint64_t v8 = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
    }
    v7((uint64_t *)((char *)a1 + *(int *)(v8 + 20)), (uint64_t *)((char *)a2 + *(int *)(v8 + 20)), v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for ExpanseUIModel(uint64_t a1)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
    ((void (*)(void *__return_ptr, uint64_t, uint64_t))v6)((void *)(v2 - 8), a1, v2);
    uint64_t v3 = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
  }
  else
  {
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<String>);
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
    ((void (*)(void *__return_ptr, uint64_t, uint64_t))v6)((void *)(v2 - 8), a1, v2);
    uint64_t v3 = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
  }
  uint64_t v4 = a1 + *(int *)(v3 + 20);
  return v6(v4, v2);
}

uint64_t initializeWithCopy for ExpanseUIModel(uint64_t a1, uint64_t a2)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
    int v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
    v5(a1, a2, v4);
    uint64_t v6 = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
  }
  else
  {
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<String>);
    int v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
    v5(a1, a2, v4);
    uint64_t v6 = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
  }
  v5(a1 + *(int *)(v6 + 20), a2 + *(int *)(v6 + 20), v4);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for ExpanseUIModel(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    outlined destroy of ExpanseUIModel.BinaryButtonSnippetModel(a1, type metadata accessor for ExpanseUIModel);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
      int v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
      v5(a1, a2, v4);
      uint64_t v6 = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
    }
    else
    {
      uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<String>);
      int v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
      v5(a1, a2, v4);
      uint64_t v6 = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
    }
    v5(a1 + *(int *)(v6 + 20), a2 + *(int *)(v6 + 20), v4);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t initializeWithTake for ExpanseUIModel(uint64_t a1, uint64_t a2)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
    int v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32);
    v5(a1, a2, v4);
    uint64_t v6 = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
  }
  else
  {
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<String>);
    int v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32);
    v5(a1, a2, v4);
    uint64_t v6 = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
  }
  v5(a1 + *(int *)(v6 + 20), a2 + *(int *)(v6 + 20), v4);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithTake for ExpanseUIModel(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    outlined destroy of ExpanseUIModel.BinaryButtonSnippetModel(a1, type metadata accessor for ExpanseUIModel);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
      int v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32);
      v5(a1, a2, v4);
      uint64_t v6 = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
    }
    else
    {
      uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<String>);
      int v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32);
      v5(a1, a2, v4);
      uint64_t v6 = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
    }
    v5(a1 + *(int *)(v6 + 20), a2 + *(int *)(v6 + 20), v4);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for ExpanseUIModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for ExpanseUIModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t destructiveInjectEnumTag for ExpanseUIModel()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t type metadata completion function for ExpanseUIModel()
{
  uint64_t result = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(319);
    if (v2 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

uint64_t base witness table accessor for Decodable in ExpanseUIModel.BinaryButtonSnippetModel()
{
  return lazy protocol witness table accessor for type ExpanseUIModel and conformance ExpanseUIModel(&lazy protocol witness table cache variable for type ExpanseUIModel.BinaryButtonSnippetModel and conformance ExpanseUIModel.BinaryButtonSnippetModel, (void (*)(uint64_t))type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel);
}

uint64_t base witness table accessor for Encodable in ExpanseUIModel.BinaryButtonSnippetModel()
{
  return lazy protocol witness table accessor for type ExpanseUIModel and conformance ExpanseUIModel(&lazy protocol witness table cache variable for type ExpanseUIModel.BinaryButtonSnippetModel and conformance ExpanseUIModel.BinaryButtonSnippetModel, (void (*)(uint64_t))type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel);
}

uint64_t base witness table accessor for Decodable in ExpanseUIModel.AppStorePunchoutSnippetModel()
{
  return lazy protocol witness table accessor for type ExpanseUIModel and conformance ExpanseUIModel(&lazy protocol witness table cache variable for type ExpanseUIModel.AppStorePunchoutSnippetModel and conformance ExpanseUIModel.AppStorePunchoutSnippetModel, (void (*)(uint64_t))type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel);
}

uint64_t base witness table accessor for Encodable in ExpanseUIModel.AppStorePunchoutSnippetModel()
{
  return lazy protocol witness table accessor for type ExpanseUIModel and conformance ExpanseUIModel(&lazy protocol witness table cache variable for type ExpanseUIModel.AppStorePunchoutSnippetModel and conformance ExpanseUIModel.AppStorePunchoutSnippetModel, (void (*)(uint64_t))type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel);
}

uint64_t specialized ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x614C6E6F74747562 && a2 == 0xEB000000006C6562;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656D614E707061 && a2 == 0xE700000000000000)
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

uint64_t specialized ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x427972616D697270 && a2 == 0xED00006E6F747475;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7261646E6F636573 && a2 == 0xEF6E6F7474754279)
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

uint64_t specialized ExpanseUIModel.ButtonModel.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6C6562616CLL && a2 == 0xE500000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000025C870F10)
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

uint64_t specialized ExpanseUIModel.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000010 && a2 == 0x800000025C870EF0
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x75427972616E6962 && a2 == 0xEC0000006E6F7474)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

unint64_t lazy protocol witness table accessor for type ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys and conformance ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys and conformance ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys and conformance ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys and conformance ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys and conformance ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys and conformance ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys and conformance ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys and conformance ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys and conformance ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys and conformance ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys and conformance ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys and conformance ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys and conformance ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys);
  }
  return result;
}

uint64_t _s21SiriExpanseInternalUI0B7UIModelOWOcTm_0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t lazy protocol witness table accessor for type ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys and conformance ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys and conformance ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys and conformance ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys and conformance ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys and conformance ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys and conformance ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys and conformance ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys and conformance ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys and conformance ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys and conformance ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys and conformance ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys and conformance ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys and conformance ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type Loggable<ExpanseUIModel.ButtonModel> and conformance <A> Loggable<A>(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
    lazy protocol witness table accessor for type ExpanseUIModel and conformance ExpanseUIModel(&lazy protocol witness table cache variable for type ExpanseUIModel.ButtonModel and conformance ExpanseUIModel.ButtonModel, (void (*)(uint64_t))type metadata accessor for ExpanseUIModel.ButtonModel);
    lazy protocol witness table accessor for type ExpanseUIModel and conformance ExpanseUIModel(&lazy protocol witness table cache variable for type ExpanseUIModel.ButtonModel and conformance ExpanseUIModel.ButtonModel, (void (*)(uint64_t))type metadata accessor for ExpanseUIModel.ButtonModel);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type Loggable<String> and conformance <A> Loggable<A>(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Loggable<String>);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ExpanseUIModel.ButtonModel.CodingKeys and conformance ExpanseUIModel.ButtonModel.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type ExpanseUIModel.ButtonModel.CodingKeys and conformance ExpanseUIModel.ButtonModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type ExpanseUIModel.ButtonModel.CodingKeys and conformance ExpanseUIModel.ButtonModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExpanseUIModel.ButtonModel.CodingKeys and conformance ExpanseUIModel.ButtonModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ExpanseUIModel.ButtonModel.CodingKeys and conformance ExpanseUIModel.ButtonModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type ExpanseUIModel.ButtonModel.CodingKeys and conformance ExpanseUIModel.ButtonModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExpanseUIModel.ButtonModel.CodingKeys and conformance ExpanseUIModel.ButtonModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ExpanseUIModel.ButtonModel.CodingKeys and conformance ExpanseUIModel.ButtonModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type ExpanseUIModel.ButtonModel.CodingKeys and conformance ExpanseUIModel.ButtonModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExpanseUIModel.ButtonModel.CodingKeys and conformance ExpanseUIModel.ButtonModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ExpanseUIModel.ButtonModel.CodingKeys and conformance ExpanseUIModel.ButtonModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type ExpanseUIModel.ButtonModel.CodingKeys and conformance ExpanseUIModel.ButtonModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExpanseUIModel.ButtonModel.CodingKeys and conformance ExpanseUIModel.ButtonModel.CodingKeys);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type CodableAceObject<SAIntentGroupRunSiriKitExecutor> and conformance CodableAceObject<A>(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for CodableAceObject<SAIntentGroupRunSiriKitExecutor>);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void *type metadata accessor for ExpanseUIModel.ButtonModel.CodingKeys()
{
  return &unk_2709EACB0;
}

void *type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys()
{
  return &unk_2709EAD40;
}

uint64_t getEnumTagSinglePayload for ExpanseUIModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ExpanseUIModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x25C86E210);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

void *type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys()
{
  return &unk_2709EADD0;
}

uint64_t dispatch thunk of ViewContext.perform(aceCommand:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of ViewContext.perform(directInvocation:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

char *initializeBufferWithCopyOfBuffer for BinaryButtonSnippetView(char *a1, char **a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  *(void *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = &v5[(v4 + 16) & ~(unint64_t)v4];
    swift_retain();
  }
  else
  {
    *((void *)a1 + 1) = a2[1];
    uint64_t v6 = *(int *)(a3 + 20);
    BOOL v7 = &a1[v6];
    uint64_t v8 = (uint64_t)a2 + v6;
    uint64_t v9 = v5;
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
    uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
    v11(v7, v8, v10);
    uint64_t v12 = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
    v11(&v7[*(int *)(v12 + 20)], v8 + *(int *)(v12 + 20), v10);
  }
  return a1;
}

uint64_t destroy for BinaryButtonSnippetView(id *a1, uint64_t a2)
{
  int v4 = (char *)a1 + *(int *)(a2 + 20);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8);
  ((void (*)(void *__return_ptr, char *, uint64_t))v8)((void *)(v5 - 8), v4, v5);
  uint64_t v6 = &v4[*(int *)(type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0) + 20)];
  return v8(v6, v5);
}

void *initializeWithCopy for BinaryButtonSnippetView(void *a1, uint64_t a2, uint64_t a3)
{
  int v4 = *(void **)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v5;
  uint64_t v6 = *(int *)(a3 + 20);
  BOOL v7 = (char *)a1 + v6;
  uint64_t v8 = a2 + v6;
  id v9 = v4;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
  uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
  v11(v7, v8, v10);
  uint64_t v12 = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
  v11(&v7[*(int *)(v12 + 20)], v8 + *(int *)(v12 + 20), v10);
  return a1;
}

uint64_t assignWithCopy for BinaryButtonSnippetView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  BOOL v7 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v8 = v7;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
  uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 24);
  v13(v10, v11, v12);
  uint64_t v14 = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
  v13(v10 + *(int *)(v14 + 20), v11 + *(int *)(v14 + 20), v12);
  return a1;
}

_OWORD *initializeWithTake for BinaryButtonSnippetView(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
  id v8 = *(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32);
  v8(v5, v6, v7);
  uint64_t v9 = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
  v8(&v5[*(int *)(v9 + 20)], &v6[*(int *)(v9 + 20)], v7);
  return a1;
}

uint64_t assignWithTake for BinaryButtonSnippetView(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
  uint64_t v11 = *(void (**)(uint64_t, char *, uint64_t))(*(void *)(v10 - 8) + 40);
  v11(v8, v9, v10);
  uint64_t v12 = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
  v11(v8 + *(int *)(v12 + 20), &v9[*(int *)(v12 + 20)], v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for BinaryButtonSnippetView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C86EA60);
}

uint64_t sub_25C86EA60(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v9 = type metadata accessor for BinaryButtonSnippetViewModel();
    uint64_t v10 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48);
    uint64_t v11 = v9;
    uint64_t v12 = (char *)a1 + *(int *)(a3 + 20);
    return v10(v12, a2, v11);
  }
}

uint64_t storeEnumTagSinglePayload for BinaryButtonSnippetView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C86EB30);
}

void *sub_25C86EB30(void *result, uint64_t a2, int a3, uint64_t a4)
{
  int v5 = result;
  if (a3 == 2147483646)
  {
    *uint64_t result = a2;
  }
  else
  {
    uint64_t v7 = type metadata accessor for BinaryButtonSnippetViewModel();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for BinaryButtonSnippetView()
{
  uint64_t result = type metadata singleton initialization cache for BinaryButtonSnippetView;
  if (!type metadata singleton initialization cache for BinaryButtonSnippetView) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t type metadata completion function for BinaryButtonSnippetView()
{
  uint64_t result = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t associated type witness table accessor for View.Body : View in BinaryButtonSnippetView()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t closure #1 in BinaryButtonSnippetView.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v37 = a2;
  uint64_t v36 = type metadata accessor for ButtonItemButtonStyle.Role();
  uint64_t v3 = *(void *)(v36 - 8);
  MEMORY[0x270FA5388](v36);
  int v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for BinaryButtonSnippetView();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Button<Text>);
  uint64_t v32 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.buttonRole(_:)>>.0);
  uint64_t v35 = *(void *)(v33 - 8);
  MEMORY[0x270FA5388](v33);
  uint64_t v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = type metadata accessor for BinaryButtonSnippetView;
  uint64_t v29 = a1;
  outlined init with copy of BinaryButtonSnippetView(a1, (uint64_t)v9, (uint64_t (*)(void))type metadata accessor for BinaryButtonSnippetView);
  uint64_t v15 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v16 = (v15 + 16) & ~v15;
  uint64_t v31 = v16 + v8;
  uint64_t v30 = v15 | 7;
  uint64_t v17 = swift_allocObject();
  outlined init with take of BinaryButtonSnippetView((uint64_t)v9, v17 + v16);
  uint64_t v39 = a1;
  Button.init(action:label:)();
  uint64_t v18 = v36;
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F774E0], v36);
  uint64_t v19 = lazy protocol witness table accessor for type Button<Text> and conformance Button<A>(&lazy protocol witness table cache variable for type Button<Text> and conformance Button<A>, &demangling cache variable for type metadata for Button<Text>);
  View.buttonRole(_:)();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v18);
  uint64_t v20 = *(void (**)(char *, uint64_t))(v32 + 8);
  v20(v12, v10);
  uint64_t v43 = v10;
  uint64_t v44 = v19;
  swift_getOpaqueTypeConformance2();
  uint64_t v21 = v33;
  uint64_t v22 = View.eraseToAnyView()();
  (*(void (**)(char *, uint64_t))(v35 + 8))(v14, v21);
  uint64_t v23 = MEMORY[0x263F774B0];
  uint64_t v45 = MEMORY[0x263F1B720];
  uint64_t v46 = MEMORY[0x263F774B0];
  uint64_t v43 = v22;
  uint64_t v24 = v29;
  outlined init with copy of BinaryButtonSnippetView(v29, (uint64_t)v9, (uint64_t (*)(void))v34);
  uint64_t v25 = swift_allocObject();
  outlined init with take of BinaryButtonSnippetView((uint64_t)v9, v25 + v16);
  uint64_t v38 = v24;
  Button.init(action:label:)();
  uint64_t v26 = View.eraseToAnyView()();
  v20(v12, v10);
  uint64_t v42 = v23;
  uint64_t v41 = MEMORY[0x263F1B720];
  uint64_t v40 = v26;
  return BinaryButtonView.init(primaryButton:secondaryButton:)();
}

void BinaryButtonSnippetView.onPrimaryButtonTapped()()
{
  uint64_t v1 = type metadata accessor for ExpanseUIModel.ButtonModel(0);
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v8[-1] - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *v0;
  if (*v0)
  {
    type metadata accessor for BinaryButtonSnippetView();
    uint64_t v9 = type metadata accessor for Context();
    uint64_t v10 = &protocol witness table for Context;
    v8[0] = v4;
    __swift_project_boxed_opaque_existential_1(v8, v9);
    id v5 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
    Loggable.wrappedValue.getter();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodableAceObject<SAIntentGroupRunSiriKitExecutor>);
    uint64_t v6 = (void *)CodableAceObject.wrappedValue.getter();
    _s21SiriExpanseInternalUI0B7UIModelO24BinaryButtonSnippetModelVWOhTm_0((uint64_t)v3, type metadata accessor for ExpanseUIModel.ButtonModel);
    dispatch thunk of Context.perform(directInvocation:)();

    __swift_destroy_boxed_opaque_existential_1(v8);
  }
  else
  {
    type metadata accessor for Context();
    lazy protocol witness table accessor for type BinaryButtonView and conformance BinaryButtonView((unint64_t *)&lazy protocol witness table cache variable for type Context and conformance Context, MEMORY[0x263F77980]);
    EnvironmentObject.error()();
    __break(1u);
  }
}

uint64_t closure #1 in BinaryButtonSnippetView.primaryButton.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for ExpanseUIModel.ButtonModel(0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (void *)((char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = type metadata accessor for BinaryButtonSnippetViewModel();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for BinaryButtonSnippetView();
  outlined init with copy of BinaryButtonSnippetView(a1 + *(int *)(v10 + 20), (uint64_t)v9, (uint64_t (*)(void))type metadata accessor for BinaryButtonSnippetViewModel);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
  Loggable.wrappedValue.getter();
  _s21SiriExpanseInternalUI0B7UIModelO24BinaryButtonSnippetModelVWOhTm_0((uint64_t)v9, type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel);
  uint64_t v12 = *v6;
  uint64_t v11 = v6[1];
  swift_bridgeObjectRetain();
  _s21SiriExpanseInternalUI0B7UIModelO24BinaryButtonSnippetModelVWOhTm_0((uint64_t)v6, type metadata accessor for ExpanseUIModel.ButtonModel);
  v17[0] = v12;
  v17[1] = v11;
  lazy protocol witness table accessor for type String and conformance String();
  uint64_t result = Text.init<A>(_:)();
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v14;
  *(unsigned char *)(a2 + 16) = v15 & 1;
  *(void *)(a2 + 24) = v16;
  return result;
}

void BinaryButtonSnippetView.onSecondaryButtonTapped()()
{
  uint64_t v1 = type metadata accessor for ExpanseUIModel.ButtonModel(0);
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v8[-1] - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *v0;
  if (*v0)
  {
    type metadata accessor for BinaryButtonSnippetView();
    uint64_t v9 = type metadata accessor for Context();
    uint64_t v10 = &protocol witness table for Context;
    v8[0] = v4;
    __swift_project_boxed_opaque_existential_1(v8, v9);
    type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
    id v5 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
    Loggable.wrappedValue.getter();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodableAceObject<SAIntentGroupRunSiriKitExecutor>);
    uint64_t v6 = (void *)CodableAceObject.wrappedValue.getter();
    _s21SiriExpanseInternalUI0B7UIModelO24BinaryButtonSnippetModelVWOhTm_0((uint64_t)v3, type metadata accessor for ExpanseUIModel.ButtonModel);
    dispatch thunk of Context.perform(directInvocation:)();

    __swift_destroy_boxed_opaque_existential_1(v8);
  }
  else
  {
    type metadata accessor for Context();
    lazy protocol witness table accessor for type BinaryButtonView and conformance BinaryButtonView((unint64_t *)&lazy protocol witness table cache variable for type Context and conformance Context, MEMORY[0x263F77980]);
    EnvironmentObject.error()();
    __break(1u);
  }
}

uint64_t closure #1 in BinaryButtonSnippetView.secondaryButton.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for ExpanseUIModel.ButtonModel(0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (void *)((char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = type metadata accessor for BinaryButtonSnippetViewModel();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for BinaryButtonSnippetView();
  outlined init with copy of BinaryButtonSnippetView(a1 + *(int *)(v10 + 20), (uint64_t)v9, (uint64_t (*)(void))type metadata accessor for BinaryButtonSnippetViewModel);
  type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
  Loggable.wrappedValue.getter();
  _s21SiriExpanseInternalUI0B7UIModelO24BinaryButtonSnippetModelVWOhTm_0((uint64_t)v9, type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel);
  uint64_t v12 = *v6;
  uint64_t v11 = v6[1];
  swift_bridgeObjectRetain();
  _s21SiriExpanseInternalUI0B7UIModelO24BinaryButtonSnippetModelVWOhTm_0((uint64_t)v6, type metadata accessor for ExpanseUIModel.ButtonModel);
  v17[0] = v12;
  v17[1] = v11;
  lazy protocol witness table accessor for type String and conformance String();
  uint64_t result = Text.init<A>(_:)();
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v14;
  *(unsigned char *)(a2 + 16) = v15 & 1;
  *(void *)(a2 + 24) = v16;
  return result;
}

uint64_t protocol witness for View.body.getter in conformance BinaryButtonSnippetView(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  MEMORY[0x270FA5388](a1 - 8);
  outlined init with copy of BinaryButtonSnippetView(v1, (uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for BinaryButtonSnippetView);
  unint64_t v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = swift_allocObject();
  outlined init with take of BinaryButtonSnippetView((uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v5 + v4);
  type metadata accessor for BinaryButtonView();
  lazy protocol witness table accessor for type BinaryButtonView and conformance BinaryButtonView(&lazy protocol witness table cache variable for type BinaryButtonView and conformance BinaryButtonView, MEMORY[0x263F77660]);
  return ComponentStack.init(content:)();
}

uint64_t outlined init with take of BinaryButtonSnippetView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for BinaryButtonSnippetView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t partial apply for closure #1 in BinaryButtonSnippetView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for BinaryButtonSnippetView() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return closure #1 in BinaryButtonSnippetView.body.getter(v4, a1);
}

uint64_t partial apply for implicit closure #2 in implicit closure #1 in BinaryButtonSnippetView.primaryButton.getter()
{
  return partial apply for implicit closure #2 in implicit closure #1 in BinaryButtonSnippetView.primaryButton.getter((uint64_t (*)(void))BinaryButtonSnippetView.onPrimaryButtonTapped());
}

uint64_t partial apply for closure #1 in BinaryButtonSnippetView.primaryButton.getter@<X0>(uint64_t a1@<X8>)
{
  return closure #1 in BinaryButtonSnippetView.primaryButton.getter(*(void *)(v1 + 16), a1);
}

uint64_t objectdestroyTm_0()
{
  uint64_t v1 = (int *)(type metadata accessor for BinaryButtonSnippetView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;

  uint64_t v7 = v6 + v1[7];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
  v9(v7, v8);
  uint64_t v10 = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
  v9(v7 + *(int *)(v10 + 20), v8);
  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t partial apply for implicit closure #2 in implicit closure #1 in BinaryButtonSnippetView.secondaryButton.getter()
{
  return partial apply for implicit closure #2 in implicit closure #1 in BinaryButtonSnippetView.primaryButton.getter((uint64_t (*)(void))BinaryButtonSnippetView.onSecondaryButtonTapped());
}

uint64_t partial apply for implicit closure #2 in implicit closure #1 in BinaryButtonSnippetView.primaryButton.getter(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t partial apply for closure #1 in BinaryButtonSnippetView.secondaryButton.getter@<X0>(uint64_t a1@<X8>)
{
  return closure #1 in BinaryButtonSnippetView.secondaryButton.getter(*(void *)(v1 + 16), a1);
}

uint64_t outlined init with copy of BinaryButtonSnippetView(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t _s21SiriExpanseInternalUI0B7UIModelO24BinaryButtonSnippetModelVWOhTm_0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t lazy protocol witness table accessor for type BinaryButtonView and conformance BinaryButtonView(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25C86FCE4()
{
  return lazy protocol witness table accessor for type Button<Text> and conformance Button<A>(&lazy protocol witness table cache variable for type ComponentStack<BinaryButtonView> and conformance ComponentStack<A>, (uint64_t *)&demangling cache variable for type metadata for ComponentStack<BinaryButtonView>);
}

uint64_t URLQueryItem.init(name:value:)()
{
  return MEMORY[0x270EEE3E0]();
}

uint64_t type metadata accessor for URLQueryItem()
{
  return MEMORY[0x270EEE410]();
}

uint64_t URLComponents.queryItems.setter()
{
  return MEMORY[0x270EEE4C0]();
}

uint64_t URLComponents.url.getter()
{
  return MEMORY[0x270EEE520]();
}

uint64_t URLComponents.host.setter()
{
  return MEMORY[0x270EEE548]();
}

uint64_t URLComponents.scheme.setter()
{
  return MEMORY[0x270EEE5B8]();
}

uint64_t URLComponents.init()()
{
  return MEMORY[0x270EEE5F8]();
}

uint64_t type metadata accessor for URLComponents()
{
  return MEMORY[0x270EEE610]();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t CodableAceObject.wrappedValue.getter()
{
  return MEMORY[0x270F74448]();
}

uint64_t Loggable.wrappedValue.getter()
{
  return MEMORY[0x270F756B0]();
}

uint64_t static Loggable<A>.== infix(_:_:)()
{
  return MEMORY[0x270F756C0]();
}

uint64_t type metadata accessor for Loggable()
{
  return MEMORY[0x270F756C8]();
}

uint64_t EnvironmentObject.error()()
{
  return MEMORY[0x270F00828]();
}

uint64_t EnvironmentObject.init()()
{
  return MEMORY[0x270F00840]();
}

uint64_t Text.init<A>(_:)()
{
  return MEMORY[0x270F03250]();
}

uint64_t View.eraseToAnyView()()
{
  return MEMORY[0x270F75950]();
}

uint64_t View.buttonRole(_:)()
{
  return MEMORY[0x270F75970]();
}

uint64_t static View._viewListCount(inputs:)()
{
  return MEMORY[0x270F036C0]();
}

uint64_t Button.init(action:label:)()
{
  return MEMORY[0x270F048B0]();
}

uint64_t type metadata accessor for ButtonItemButtonStyle.Role()
{
  return MEMORY[0x270F75AD0]();
}

uint64_t ComponentStack.init(content:)()
{
  return MEMORY[0x270F75C30]();
}

uint64_t BinaryButtonView.init(primaryButton:secondaryButton:)()
{
  return MEMORY[0x270F75C80]();
}

uint64_t type metadata accessor for BinaryButtonView()
{
  return MEMORY[0x270F75C90]();
}

uint64_t dispatch thunk of Context.perform(aceCommand:)()
{
  return MEMORY[0x270F76248]();
}

uint64_t dispatch thunk of Context.perform(directInvocation:)()
{
  return MEMORY[0x270F76270]();
}

uint64_t type metadata accessor for Context()
{
  return MEMORY[0x270F76280]();
}

uint64_t DecodingError.Context.init(codingPath:debugDescription:underlyingError:)()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t type metadata accessor for DecodingError()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return MEMORY[0x270F9F250]();
}

uint64_t KeyedDecodingContainer.codingPath.getter()
{
  return MEMORY[0x270F9F258]();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return MEMORY[0x270F9F318]();
}

uint64_t KeyedDecodingContainer.allKeys.getter()
{
  return MEMORY[0x270F9F360]();
}

uint64_t KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return MEMORY[0x270F9F390]();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return MEMORY[0x270F9F428]();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return MEMORY[0x270F9F458]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x270F9F7D0]();
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

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return MEMORY[0x270F9FD98]();
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

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}