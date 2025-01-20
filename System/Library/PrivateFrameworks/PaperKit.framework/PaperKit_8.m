uint64_t *assignWithCopy for MiniColorButton(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _OWORD *v14;
  _OWORD *v15;
  uint64_t v16;
  uint64_t v17;
  long long v18;
  long long v19;

  v4 = *a2;
  v5 = *((unsigned char *)a2 + 8);
  outlined copy of Environment<MiniMenuController?>.Content(*a2, v5);
  v6 = *a1;
  v7 = *((unsigned __int8 *)a1 + 8);
  *a1 = v4;
  *((unsigned char *)a1 + 8) = v5;
  outlined consume of Environment<MiniMenuController?>.Content(v6, v7);
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  a1[3] = a2[3];
  swift_retain();
  swift_release();
  v8 = (void *)a1[4];
  v9 = (void *)a2[4];
  a1[4] = (uint64_t)v9;
  v10 = v9;

  *((unsigned char *)a1 + 40) = *((unsigned char *)a2 + 40);
  v11 = (void *)a1[6];
  v12 = (void *)a2[6];
  a1[6] = (uint64_t)v12;
  v13 = v12;

  a1[7] = a2[7];
  swift_retain();
  swift_release();
  v14 = a1 + 8;
  v15 = a2 + 8;
  v16 = a2[9];
  if (a1[9])
  {
    if (v16)
    {
      a1[8] = a2[8];
      swift_retain();
      swift_release();
      a1[9] = a2[9];
      swift_retain();
      swift_release();
      a1[10] = a2[10];
      *((unsigned char *)a1 + 88) = *((unsigned char *)a2 + 88);
    }
    else
    {
      outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)(a1 + 8), &demangling cache variable for type metadata for Binding<Inspected<CGFloat>>);
      v18 = *(_OWORD *)((char *)a2 + 73);
      *v14 = *v15;
      *(_OWORD *)((char *)a1 + 73) = v18;
    }
  }
  else if (v16)
  {
    a1[8] = a2[8];
    a1[9] = a2[9];
    v17 = a2[10];
    *((unsigned char *)a1 + 88) = *((unsigned char *)a2 + 88);
    a1[10] = v17;
    swift_retain();
    swift_retain();
  }
  else
  {
    v19 = *v15;
    *(_OWORD *)((char *)a1 + 73) = *(_OWORD *)((char *)a2 + 73);
    *v14 = v19;
  }
  *((unsigned char *)a1 + 89) = *((unsigned char *)a2 + 89);
  *((unsigned char *)a1 + 96) = *((unsigned char *)a2 + 96);
  a1[13] = a2[13];
  swift_retain();
  swift_release();
  *((unsigned char *)a1 + 112) = *((unsigned char *)a2 + 112);
  a1[15] = a2[15];
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy128_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  __n128 result = (__n128)a2[4];
  long long v6 = a2[5];
  long long v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 64) = result;
  *(_OWORD *)(a1 + 80) = v6;
  return result;
}

uint64_t *assignWithTake for MiniColorButton(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  char v5 = *((unsigned char *)a2 + 8);
  uint64_t v6 = *a1;
  uint64_t v7 = *((unsigned __int8 *)a1 + 8);
  *a1 = v4;
  *((unsigned char *)a1 + 8) = v5;
  outlined consume of Environment<MiniMenuController?>.Content(v6, v7);
  a1[2] = a2[2];
  swift_release();
  a1[3] = a2[3];
  swift_release();
  v8 = (void *)a1[4];
  a1[4] = a2[4];

  *((unsigned char *)a1 + 40) = *((unsigned char *)a2 + 40);
  v9 = (void *)a1[6];
  a1[6] = a2[6];

  a1[7] = a2[7];
  swift_release();
  if (!a1[9]) {
    goto LABEL_5;
  }
  uint64_t v10 = a2[9];
  if (!v10)
  {
    outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)(a1 + 8), &demangling cache variable for type metadata for Binding<Inspected<CGFloat>>);
LABEL_5:
    *((_OWORD *)a1 + 4) = *((_OWORD *)a2 + 4);
    *(_OWORD *)((char *)a1 + 73) = *(_OWORD *)((char *)a2 + 73);
    goto LABEL_6;
  }
  a1[8] = a2[8];
  swift_release();
  a1[9] = v10;
  swift_release();
  a1[10] = a2[10];
  *((unsigned char *)a1 + 88) = *((unsigned char *)a2 + 88);
LABEL_6:
  *((unsigned char *)a1 + 89) = *((unsigned char *)a2 + 89);
  *((unsigned char *)a1 + 96) = *((unsigned char *)a2 + 96);
  a1[13] = a2[13];
  swift_release();
  *((unsigned char *)a1 + 112) = *((unsigned char *)a2 + 112);
  a1[15] = a2[15];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for MiniColorButton(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 128)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MiniColorButton(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 128) = 1;
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
    *(unsigned char *)(result + 128) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MiniColorButton()
{
  return &type metadata for MiniColorButton;
}

uint64_t associated type witness table accessor for View.Body : View in MiniColorButton()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t partial apply for closure #1 in MiniColorButton.body.getter@<X0>(uint64_t a1@<X8>)
{
  return closure #1 in MiniColorButton.body.getter(v1 + 16, a1);
}

uint64_t partial apply for closure #2 in MiniColorButton.body.getter@<X0>(uint64_t a1@<X8>)
{
  return closure #2 in MiniColorButton.body.getter(v1 + 16, a1);
}

uint64_t outlined retain of MiniColorButton(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 32);
  long long v3 = *(void **)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 72);
  outlined copy of Environment<MiniMenuController?>.Content(*(void *)a1, *(unsigned __int8 *)(a1 + 8));
  swift_retain();
  swift_retain();
  swift_retain();
  id v6 = v2;
  id v7 = v3;
  outlined copy of Binding<Inspected<CGFloat>>?(v4, v5);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t partial apply for closure #3 in MiniColorButton.body.getter@<X0>(uint64_t a1@<X8>)
{
  return closure #3 in MiniColorButton.body.getter((_OWORD *)(v1 + 16), a1);
}

uint64_t partial apply for closure #1 in closure #3 in MiniColorButton.body.getter(void *a1)
{
  return closure #1 in closure #3 in MiniColorButton.body.getter(a1, (_OWORD *)(v1 + 16));
}

uint64_t outlined init with take of MultiColorSwatchButton(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void partial apply for closure #1 in MiniColorButton.pickerColor.getter(void *a1@<X8>)
{
  closure #1 in MiniColorButton.pickerColor.getter(v1 + 32, a1);
}

uint64_t partial apply for closure #2 in MiniColorButton.pickerColor.getter(id *a1)
{
  return closure #2 in MiniColorButton.pickerColor.getter(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), v1 + 32);
}

uint64_t outlined release of MiniColorButton(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 32);
  long long v3 = *(void **)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 72);
  outlined consume of Environment<MiniMenuController?>.Content(*(void *)a1, *(unsigned __int8 *)(a1 + 8));
  swift_release();
  swift_release();

  swift_release();
  outlined consume of Binding<Inspected<CGFloat>>?(v4, v5);
  swift_release();
  swift_release();
  return a1;
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<Grid<TupleView<(ModifiedContent<GridRow<ForEach<[MiniDefaultColor], String, MiniColorSwatch>>, _PaddingLayout>, GridRow<ForEach<[MiniDefaultColor], String, MiniColorSwatch>>, _ConditionalContent<HStack<TupleView<(ModifiedContent<ModifiedContent<LineWidthStepperView, _FrameLayout>, _PaddingLayout>, ModifiedContent<ModifiedContent<MultiColorSwatchButton, _FrameLayout>, _PaddingLayout>)>>, TupleView<(HStack<TupleView<(<<opaque return type of View.buttonStyle<A>(_:)>>.0, ModifiedContent<ModifiedContent<MultiColorSwatchButton, _FrameLayout>, _PaddingLayout>)>>, HStack<ModifiedContent<LineWidthStepperView, _FrameLayout>>?)>>)>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result = lazy protocol witness table cache variable for type ModifiedContent<Grid<TupleView<(ModifiedContent<GridRow<ForEach<[MiniDefaultColor], String, MiniColorSwatch>>, _PaddingLayout>, GridRow<ForEach<[MiniDefaultColor], String, MiniColorSwatch>>, _ConditionalContent<HStack<TupleView<(ModifiedContent<ModifiedContent<LineWidthStepperView, _FrameLayout>, _PaddingLayout>, ModifiedContent<ModifiedContent<MultiColorSwatchButton, _FrameLayout>, _PaddingLayout>)>>, TupleView<(HStack<TupleView<(<<opaque return type of View.buttonStyle<A>(_:)>>.0, ModifiedContent<ModifiedContent<MultiColorSwatchButton, _FrameLayout>, _PaddingLayout>)>>, HStack<ModifiedContent<LineWidthStepperView, _FrameLayout>>?)>>)>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<Grid<TupleView<(ModifiedContent<GridRow<ForEach<[MiniDefaultColor], String, MiniColorSwatch>>, _PaddingLayout>, GridRow<ForEach<[MiniDefaultColor], String, MiniColorSwatch>>, _ConditionalContent<HStack<TupleView<(ModifiedContent<ModifiedContent<LineWidthStepperView, _FrameLayout>, _PaddingLayout>, ModifiedContent<ModifiedContent<MultiColorSwatchButton, _FrameLayout>, _PaddingLayout>)>>, TupleView<(HStack<TupleView<(<<opaque return type of View.buttonStyle<A>(_:)>>.0, ModifiedContent<ModifiedContent<MultiColorSwatchButton, _FrameLayout>, _PaddingLayout>)>>, HStack<ModifiedContent<LineWidthStepperView, _FrameLayout>>?)>>)>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<Grid<TupleView<(ModifiedContent<GridRow<ForEach<[MiniDefaultColor], String, MiniColorSwatch>>, _PaddingLayout>, GridRow<ForEach<[MiniDefaultColor], String, MiniColorSwatch>>, _ConditionalContent<HStack<TupleView<(ModifiedContent<ModifiedContent<LineWidthStepperView, _FrameLayout>, _PaddingLayout>, ModifiedContent<ModifiedContent<MultiColorSwatchButton, _FrameLayout>, _PaddingLayout>)>>, TupleView<(HStack<TupleView<(<<opaque return type of View.buttonStyle<A>(_:)>>.0, ModifiedContent<ModifiedContent<MultiColorSwatchButton, _FrameLayout>, _PaddingLayout>)>>, HStack<ModifiedContent<LineWidthStepperView, _FrameLayout>>?)>>)>>, _PaddingLayout>);
    lazy protocol witness table accessor for type VStack<TupleView<(HStack<TupleView<(HStack<TupleView<(ModifiedContent<<<opaque return type of View.toggleStyle<A>(_:)>>.0, _EnvironmentKeyTransformModifier<Bool>>, ModifiedContent<<<opaque return type of View.toggleStyle<A>(_:)>>.0, _EnvironmentKeyTransformModifier<Bool>>, <<opaque return type of View.toggleStyle<A>(_:)>>.0, <<opaque return type of View.toggleStyle<A>(_:)>>.0)>>, HStack<ModifiedContent<MultiColorSwatchButton, _FrameLayout>>)>>, HStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Menu<ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<CGFloat>>, _EnvironmentKeyWritingModifier<Font?>>, _EnvironmentKeyWritingModifier<Color?>>, ForEach<Range<Int>, Int, Button<Text>>>, _FlexFrameLayout>, _BackgroundStyleModifier<Color>>, _ClipEffect<RoundedCorner>>, ModifiedContent<HStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Button<ModifiedContent<ModifiedContent<Image, _EnvironmentKeyWritingModifie(&lazy protocol witness table cache variable for type Grid<TupleView<(ModifiedContent<GridRow<ForEach<[MiniDefaultColor], String, MiniColorSwatch>>, _PaddingLayout>, GridRow<ForEach<[MiniDefaultColor], String, MiniColorSwatch>>, _ConditionalContent<HStack<TupleView<(ModifiedContent<ModifiedContent<LineWidthStepperView, _FrameLayout>, _PaddingLayout>, ModifiedContent<ModifiedContent<MultiColorSwatchButton, _FrameLayout>, _PaddingLayout>)>>, TupleView<(HStack<TupleView<(<<opaque return type of View.buttonStyle<A>(_:)>>.0, ModifiedContent<ModifiedContent<MultiColorSwatchButton, _FrameLayout>, _PaddingLayout>)>>, HStack<ModifiedContent<LineWidthStepperView, _FrameLayout>>?)>>)>> and conformance Grid<A>, &demangling cache variable for type metadata for Grid<TupleView<(ModifiedContent<GridRow<ForEach<[MiniDefaultColor], String, MiniColorSwatch>>, _PaddingLayout>, GridRow<ForEach<[MiniDefaultColor], String, MiniColorSwatch>>, _ConditionalContent<HStack<TupleView<(ModifiedContent<ModifiedContent<LineWidthStepperView, _FrameLayout>, _PaddingLayout>, ModifiedContent<ModifiedContent<MultiColorSwatchButton, _FrameLayout>, _PaddingLayout>)>>, TupleView<(HStack<TupleView<(<<opaque return type of View.buttonStyle<A>(_:)>>.0, ModifiedContent<ModifiedContent<MultiColorSwatchButton, _FrameLayout>, _PaddingLayout>)>>, HStack<ModifiedContent<LineWidthStepperView, _FrameLayout>>?)>>)>>);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<Grid<TupleView<(ModifiedContent<GridRow<ForEach<[MiniDefaultColor], String, MiniColorSwatch>>, _PaddingLayout>, GridRow<ForEach<[MiniDefaultColor], String, MiniColorSwatch>>, _ConditionalContent<HStack<TupleView<(ModifiedContent<ModifiedContent<LineWidthStepperView, _FrameLayout>, _PaddingLayout>, ModifiedContent<ModifiedContent<MultiColorSwatchButton, _FrameLayout>, _PaddingLayout>)>>, TupleView<(HStack<TupleView<(<<opaque return type of View.buttonStyle<A>(_:)>>.0, ModifiedContent<ModifiedContent<MultiColorSwatchButton, _FrameLayout>, _PaddingLayout>)>>, HStack<ModifiedContent<LineWidthStepperView, _FrameLayout>>?)>>)>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type MiniColorSwatch and conformance MiniColorSwatch()
{
  unint64_t result = lazy protocol witness table cache variable for type MiniColorSwatch and conformance MiniColorSwatch;
  if (!lazy protocol witness table cache variable for type MiniColorSwatch and conformance MiniColorSwatch)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MiniColorSwatch and conformance MiniColorSwatch);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type MiniDefaultColor and conformance MiniDefaultColor()
{
  unint64_t result = lazy protocol witness table cache variable for type MiniDefaultColor and conformance MiniDefaultColor;
  if (!lazy protocol witness table cache variable for type MiniDefaultColor and conformance MiniDefaultColor)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MiniDefaultColor and conformance MiniDefaultColor);
  }
  return result;
}

uint64_t partial apply for closure #1 in closure #2 in closure #1 in closure #2 in MiniColorButton.body.getter@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return closure #1 in closure #1 in closure #1 in closure #2 in MiniColorButton.body.getter(a1, a2);
}

uint64_t outlined copy of HStack<ModifiedContent<LineWidthStepperView, _FrameLayout>>?(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a5)
  {
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t outlined consume of HStack<ModifiedContent<LineWidthStepperView, _FrameLayout>>?(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a5)
  {
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t partial apply for closure #1 in MiniColorButton.multicolorSwatch.getter()
{
  return closure #1 in MiniColorButton.multicolorSwatch.getter(v0 + 16);
}

uint64_t partial apply for closure #2 in MiniColorButton.multicolorSwatch.getter(void *a1)
{
  return closure #2 in MiniColorButton.multicolorSwatch.getter(a1);
}

uint64_t objectdestroy_38Tm_0()
{
  outlined consume of Environment<MiniMenuController?>.Content(*(void *)(v0 + 16), *(unsigned __int8 *)(v0 + 24));
  swift_release();
  swift_release();

  swift_release();
  if (*(void *)(v0 + 88))
  {
    swift_release();
    swift_release();
  }
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 144, 7);
}

uint64_t partial apply for closure #1 in closure #4 in closure #1 in closure #2 in MiniColorButton.body.getter()
{
  return closure #1 in closure #4 in closure #1 in closure #2 in MiniColorButton.body.getter((_OWORD *)(v0 + 16));
}

unint64_t lazy protocol witness table accessor for type MiniTextButtonStyle and conformance MiniTextButtonStyle()
{
  unint64_t result = lazy protocol witness table cache variable for type MiniTextButtonStyle and conformance MiniTextButtonStyle;
  if (!lazy protocol witness table cache variable for type MiniTextButtonStyle and conformance MiniTextButtonStyle)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MiniTextButtonStyle and conformance MiniTextButtonStyle);
  }
  return result;
}

uint64_t objectdestroy_53Tm()
{
  swift_unknownObjectRelease();
  outlined consume of Environment<MiniMenuController?>.Content(*(void *)(v0 + 32), *(unsigned __int8 *)(v0 + 40));
  swift_release();
  swift_release();

  swift_release();
  if (*(void *)(v0 + 104))
  {
    swift_release();
    swift_release();
  }
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 160, 7);
}

unint64_t lazy protocol witness table accessor for type Group<_ConditionalContent<ModifiedContent<_ShapeView<Circle, Color>, _PaddingLayout>, ModifiedContent<ModifiedContent<StrokeShapeView<Circle, Color, EmptyView>, _PaddingLayout>, _ContentShapeKindModifier<Circle>>>> and conformance <A> Group<A>()
{
  unint64_t result = lazy protocol witness table cache variable for type Group<_ConditionalContent<ModifiedContent<_ShapeView<Circle, Color>, _PaddingLayout>, ModifiedContent<ModifiedContent<StrokeShapeView<Circle, Color, EmptyView>, _PaddingLayout>, _ContentShapeKindModifier<Circle>>>> and conformance <A> Group<A>;
  if (!lazy protocol witness table cache variable for type Group<_ConditionalContent<ModifiedContent<_ShapeView<Circle, Color>, _PaddingLayout>, ModifiedContent<ModifiedContent<StrokeShapeView<Circle, Color, EmptyView>, _PaddingLayout>, _ContentShapeKindModifier<Circle>>>> and conformance <A> Group<A>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Group<_ConditionalContent<ModifiedContent<_ShapeView<Circle, Color>, _PaddingLayout>, ModifiedContent<ModifiedContent<StrokeShapeView<Circle, Color, EmptyView>, _PaddingLayout>, _ContentShapeKindModifier<Circle>>>>);
    lazy protocol witness table accessor for type _ConditionalContent<ModifiedContent<_ShapeView<Circle, Color>, _PaddingLayout>, ModifiedContent<ModifiedContent<StrokeShapeView<Circle, Color, EmptyView>, _PaddingLayout>, _ContentShapeKindModifier<Circle>>> and conformance <> _ConditionalContent<A, B>();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Group<_ConditionalContent<ModifiedContent<_ShapeView<Circle, Color>, _PaddingLayout>, ModifiedContent<ModifiedContent<StrokeShapeView<Circle, Color, EmptyView>, _PaddingLayout>, _ContentShapeKindModifier<Circle>>>> and conformance <A> Group<A>);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type _ConditionalContent<ModifiedContent<_ShapeView<Circle, Color>, _PaddingLayout>, ModifiedContent<ModifiedContent<StrokeShapeView<Circle, Color, EmptyView>, _PaddingLayout>, _ContentShapeKindModifier<Circle>>> and conformance <> _ConditionalContent<A, B>()
{
  unint64_t result = lazy protocol witness table cache variable for type _ConditionalContent<ModifiedContent<_ShapeView<Circle, Color>, _PaddingLayout>, ModifiedContent<ModifiedContent<StrokeShapeView<Circle, Color, EmptyView>, _PaddingLayout>, _ContentShapeKindModifier<Circle>>> and conformance <> _ConditionalContent<A, B>;
  if (!lazy protocol witness table cache variable for type _ConditionalContent<ModifiedContent<_ShapeView<Circle, Color>, _PaddingLayout>, ModifiedContent<ModifiedContent<StrokeShapeView<Circle, Color, EmptyView>, _PaddingLayout>, _ContentShapeKindModifier<Circle>>> and conformance <> _ConditionalContent<A, B>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&demangling cache variable for type metadata for _ConditionalContent<ModifiedContent<_ShapeView<Circle, Color>, _PaddingLayout>, ModifiedContent<ModifiedContent<StrokeShapeView<Circle, Color, EmptyView>, _PaddingLayout>, _ContentShapeKindModifier<Circle>>>);
    lazy protocol witness table accessor for type ModifiedContent<_ShapeView<Circle, Color>, _PaddingLayout> and conformance <> ModifiedContent<A, B>();
    lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<StrokeShapeView<Circle, Color, EmptyView>, _PaddingLayout>, _ContentShapeKindModifier<Circle>> and conformance <> ModifiedContent<A, B>();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type _ConditionalContent<ModifiedContent<_ShapeView<Circle, Color>, _PaddingLayout>, ModifiedContent<ModifiedContent<StrokeShapeView<Circle, Color, EmptyView>, _PaddingLayout>, _ContentShapeKindModifier<Circle>>> and conformance <> _ConditionalContent<A, B>);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<StrokeShapeView<Circle, Color, EmptyView>, _PaddingLayout>, _ContentShapeKindModifier<Circle>> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result = lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<StrokeShapeView<Circle, Color, EmptyView>, _PaddingLayout>, _ContentShapeKindModifier<Circle>> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<StrokeShapeView<Circle, Color, EmptyView>, _PaddingLayout>, _ContentShapeKindModifier<Circle>> and conformance <> ModifiedContent<A, B>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<StrokeShapeView<Circle, Color, EmptyView>, _PaddingLayout>, _ContentShapeKindModifier<Circle>>);
    lazy protocol witness table accessor for type ModifiedContent<StrokeShapeView<Circle, Color, EmptyView>, _PaddingLayout> and conformance <> ModifiedContent<A, B>();
    lazy protocol witness table accessor for type VStack<TupleView<(HStack<TupleView<(HStack<TupleView<(ModifiedContent<<<opaque return type of View.toggleStyle<A>(_:)>>.0, _EnvironmentKeyTransformModifier<Bool>>, ModifiedContent<<<opaque return type of View.toggleStyle<A>(_:)>>.0, _EnvironmentKeyTransformModifier<Bool>>, <<opaque return type of View.toggleStyle<A>(_:)>>.0, <<opaque return type of View.toggleStyle<A>(_:)>>.0)>>, HStack<ModifiedContent<MultiColorSwatchButton, _FrameLayout>>)>>, HStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Menu<ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<CGFloat>>, _EnvironmentKeyWritingModifier<Font?>>, _EnvironmentKeyWritingModifier<Color?>>, ForEach<Range<Int>, Int, Button<Text>>>, _FlexFrameLayout>, _BackgroundStyleModifier<Color>>, _ClipEffect<RoundedCorner>>, ModifiedContent<HStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Button<ModifiedContent<ModifiedContent<Image, _EnvironmentKeyWritingModifie(&lazy protocol witness table cache variable for type _ContentShapeKindModifier<Circle> and conformance _ContentShapeKindModifier<A>, &demangling cache variable for type metadata for _ContentShapeKindModifier<Circle>);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<StrokeShapeView<Circle, Color, EmptyView>, _PaddingLayout>, _ContentShapeKindModifier<Circle>> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<StrokeShapeView<Circle, Color, EmptyView>, _PaddingLayout> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result = lazy protocol witness table cache variable for type ModifiedContent<StrokeShapeView<Circle, Color, EmptyView>, _PaddingLayout> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<StrokeShapeView<Circle, Color, EmptyView>, _PaddingLayout> and conformance <> ModifiedContent<A, B>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<StrokeShapeView<Circle, Color, EmptyView>, _PaddingLayout>);
    lazy protocol witness table accessor for type VStack<TupleView<(HStack<TupleView<(HStack<TupleView<(ModifiedContent<<<opaque return type of View.toggleStyle<A>(_:)>>.0, _EnvironmentKeyTransformModifier<Bool>>, ModifiedContent<<<opaque return type of View.toggleStyle<A>(_:)>>.0, _EnvironmentKeyTransformModifier<Bool>>, <<opaque return type of View.toggleStyle<A>(_:)>>.0, <<opaque return type of View.toggleStyle<A>(_:)>>.0)>>, HStack<ModifiedContent<MultiColorSwatchButton, _FrameLayout>>)>>, HStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Menu<ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<CGFloat>>, _EnvironmentKeyWritingModifier<Font?>>, _EnvironmentKeyWritingModifier<Color?>>, ForEach<Range<Int>, Int, Button<Text>>>, _FlexFrameLayout>, _BackgroundStyleModifier<Color>>, _ClipEffect<RoundedCorner>>, ModifiedContent<HStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Button<ModifiedContent<ModifiedContent<Image, _EnvironmentKeyWritingModifie(&lazy protocol witness table cache variable for type StrokeShapeView<Circle, Color, EmptyView> and conformance StrokeShapeView<A, B, C>, &demangling cache variable for type metadata for StrokeShapeView<Circle, Color, EmptyView>);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<StrokeShapeView<Circle, Color, EmptyView>, _PaddingLayout> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type ModifiedContent<Group<_ConditionalContent<ModifiedContent<_ShapeView<Circle, Color>, _PaddingLayout>, ModifiedContent<ModifiedContent<StrokeShapeView<Circle, Color, EmptyView>, _PaddingLayout>, _ContentShapeKindModifier<Circle>>>>, AccessibilityAttachmentModifier> and conformance <> ModifiedContent<A, B>(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    lazy protocol witness table accessor for type ColorPickerRepresentable and conformance ColorPickerRepresentable(&lazy protocol witness table cache variable for type AccessibilityAttachmentModifier and conformance AccessibilityAttachmentModifier, MEMORY[0x263F1A470]);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<ZStack<_ConditionalContent<StrokeShapeView<Path, Color, EmptyView>, ZStack<TupleView<(StrokeShapeView<Path, Color, StrokeShapeView<Path, Color, EmptyView>>, StrokeShapeView<Path, Color, EmptyView>)>>>>, _ContentShapeKindModifier<Circle>> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result = lazy protocol witness table cache variable for type ModifiedContent<ZStack<_ConditionalContent<StrokeShapeView<Path, Color, EmptyView>, ZStack<TupleView<(StrokeShapeView<Path, Color, StrokeShapeView<Path, Color, EmptyView>>, StrokeShapeView<Path, Color, EmptyView>)>>>>, _ContentShapeKindModifier<Circle>> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<ZStack<_ConditionalContent<StrokeShapeView<Path, Color, EmptyView>, ZStack<TupleView<(StrokeShapeView<Path, Color, StrokeShapeView<Path, Color, EmptyView>>, StrokeShapeView<Path, Color, EmptyView>)>>>>, _ContentShapeKindModifier<Circle>> and conformance <> ModifiedContent<A, B>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<ZStack<_ConditionalContent<StrokeShapeView<Path, Color, EmptyView>, ZStack<TupleView<(StrokeShapeView<Path, Color, StrokeShapeView<Path, Color, EmptyView>>, StrokeShapeView<Path, Color, EmptyView>)>>>>, _ContentShapeKindModifier<Circle>>);
    lazy protocol witness table accessor for type VStack<TupleView<(HStack<TupleView<(HStack<TupleView<(ModifiedContent<<<opaque return type of View.toggleStyle<A>(_:)>>.0, _EnvironmentKeyTransformModifier<Bool>>, ModifiedContent<<<opaque return type of View.toggleStyle<A>(_:)>>.0, _EnvironmentKeyTransformModifier<Bool>>, <<opaque return type of View.toggleStyle<A>(_:)>>.0, <<opaque return type of View.toggleStyle<A>(_:)>>.0)>>, HStack<ModifiedContent<MultiColorSwatchButton, _FrameLayout>>)>>, HStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Menu<ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<CGFloat>>, _EnvironmentKeyWritingModifier<Font?>>, _EnvironmentKeyWritingModifier<Color?>>, ForEach<Range<Int>, Int, Button<Text>>>, _FlexFrameLayout>, _BackgroundStyleModifier<Color>>, _ClipEffect<RoundedCorner>>, ModifiedContent<HStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Button<ModifiedContent<ModifiedContent<Image, _EnvironmentKeyWritingModifie(&lazy protocol witness table cache variable for type ZStack<_ConditionalContent<StrokeShapeView<Path, Color, EmptyView>, ZStack<TupleView<(StrokeShapeView<Path, Color, StrokeShapeView<Path, Color, EmptyView>>, StrokeShapeView<Path, Color, EmptyView>)>>>> and conformance ZStack<A>, &demangling cache variable for type metadata for ZStack<_ConditionalContent<StrokeShapeView<Path, Color, EmptyView>, ZStack<TupleView<(StrokeShapeView<Path, Color, StrokeShapeView<Path, Color, EmptyView>>, StrokeShapeView<Path, Color, EmptyView>)>>>>);
    lazy protocol witness table accessor for type VStack<TupleView<(HStack<TupleView<(HStack<TupleView<(ModifiedContent<<<opaque return type of View.toggleStyle<A>(_:)>>.0, _EnvironmentKeyTransformModifier<Bool>>, ModifiedContent<<<opaque return type of View.toggleStyle<A>(_:)>>.0, _EnvironmentKeyTransformModifier<Bool>>, <<opaque return type of View.toggleStyle<A>(_:)>>.0, <<opaque return type of View.toggleStyle<A>(_:)>>.0)>>, HStack<ModifiedContent<MultiColorSwatchButton, _FrameLayout>>)>>, HStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Menu<ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<CGFloat>>, _EnvironmentKeyWritingModifier<Font?>>, _EnvironmentKeyWritingModifier<Color?>>, ForEach<Range<Int>, Int, Button<Text>>>, _FlexFrameLayout>, _BackgroundStyleModifier<Color>>, _ClipEffect<RoundedCorner>>, ModifiedContent<HStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Button<ModifiedContent<ModifiedContent<Image, _EnvironmentKeyWritingModifie(&lazy protocol witness table cache variable for type _ContentShapeKindModifier<Circle> and conformance _ContentShapeKindModifier<A>, &demangling cache variable for type metadata for _ContentShapeKindModifier<Circle>);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<ZStack<_ConditionalContent<StrokeShapeView<Path, Color, EmptyView>, ZStack<TupleView<(StrokeShapeView<Path, Color, StrokeShapeView<Path, Color, EmptyView>>, StrokeShapeView<Path, Color, EmptyView>)>>>>, _ContentShapeKindModifier<Circle>> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

uint64_t outlined retain of ZStack<_ConditionalContent<StrokeShapeView<Path, Color, EmptyView>, ZStack<TupleView<(StrokeShapeView<Path, Color, StrokeShapeView<Path, Color, EmptyView>>, StrokeShapeView<Path, Color, EmptyView>)>>>>(uint64_t a1)
{
  long long v8 = *(_OWORD *)(a1 + 320);
  long long v9 = *(_OWORD *)(a1 + 336);
  long long v6 = *(_OWORD *)(a1 + 288);
  long long v7 = *(_OWORD *)(a1 + 304);
  long long v4 = *(_OWORD *)(a1 + 256);
  long long v5 = *(_OWORD *)(a1 + 272);
  long long v3 = *(_OWORD *)(a1 + 224);
  outlined copy of _ConditionalContent<StrokeShapeView<Path, Color, EmptyView>, ZStack<TupleView<(StrokeShapeView<Path, Color, StrokeShapeView<Path, Color, EmptyView>>, StrokeShapeView<Path, Color, EmptyView>)>>>.Storage(*(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144), *(void *)(a1 + 152), *(_OWORD *)(a1 + 160),
    *(void *)(a1 + 168),
    *(void *)(a1 + 176),
    *(void *)(a1 + 184),
    *(void *)(a1 + 192),
    *(void *)(a1 + 200),
    *(void *)(a1 + 208),
    *(void *)(a1 + 216),
    v3,
    *((uint64_t *)&v3 + 1),
    *(void *)(a1 + 240),
    *(void *)(a1 + 248),
    v4,
    *((uint64_t *)&v4 + 1),
    v5,
    *((uint64_t *)&v5 + 1),
    v6,
    *((uint64_t *)&v6 + 1),
    v7,
    *((uint64_t *)&v7 + 1),
    v8,
    *((uint64_t *)&v8 + 1),
    v9,
    *((uint64_t *)&v9 + 1),
    *(void *)(a1 + 352),
    *(void *)(a1 + 360),
    *(unsigned char *)(a1 + 368));
  return a1;
}

uint64_t outlined copy of _ConditionalContent<StrokeShapeView<Path, Color, EmptyView>, ZStack<TupleView<(StrokeShapeView<Path, Color, StrokeShapeView<Path, Color, EmptyView>>, StrokeShapeView<Path, Color, EmptyView>)>>>.Storage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned __int8 a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, unsigned __int8 a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,unsigned __int8 a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  if (a45)
  {
    outlined copy of Path.Storage(a3, a4, a5, a6, a7);
    swift_bridgeObjectRetain();
    swift_retain();
    outlined copy of Path.Storage(a15, a16, a17, a18, a19);
    swift_bridgeObjectRetain();
    swift_retain();
    outlined copy of Path.Storage(a31, a32, a33, a34, a35);
  }
  else
  {
    outlined copy of Path.Storage(a1, a2, a3, a4, a5);
  }
  swift_bridgeObjectRetain();
  return swift_retain();
}

uint64_t outlined copy of Path.Storage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 - 2 <= 3) {
    return swift_retain();
  }
  return result;
}

uint64_t outlined release of _ConditionalContent<StrokeShapeView<Path, Color, EmptyView>, ZStack<TupleView<(StrokeShapeView<Path, Color, StrokeShapeView<Path, Color, EmptyView>>, StrokeShapeView<Path, Color, EmptyView>)>>>(uint64_t a1)
{
  long long v8 = *(_OWORD *)(a1 + 304);
  long long v9 = *(_OWORD *)(a1 + 320);
  long long v6 = *(_OWORD *)(a1 + 272);
  long long v7 = *(_OWORD *)(a1 + 288);
  long long v4 = *(_OWORD *)(a1 + 240);
  long long v5 = *(_OWORD *)(a1 + 256);
  long long v3 = *(_OWORD *)(a1 + 208);
  outlined consume of _ConditionalContent<StrokeShapeView<Path, Color, EmptyView>, ZStack<TupleView<(StrokeShapeView<Path, Color, StrokeShapeView<Path, Color, EmptyView>>, StrokeShapeView<Path, Color, EmptyView>)>>>.Storage(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(_OWORD *)(a1 + 144),
    *(void *)(a1 + 152),
    *(void *)(a1 + 160),
    *(void *)(a1 + 168),
    *(void *)(a1 + 176),
    *(void *)(a1 + 184),
    *(void *)(a1 + 192),
    *(void *)(a1 + 200),
    v3,
    *((uint64_t *)&v3 + 1),
    *(void *)(a1 + 224),
    *(void *)(a1 + 232),
    v4,
    *((uint64_t *)&v4 + 1),
    v5,
    *((uint64_t *)&v5 + 1),
    v6,
    *((uint64_t *)&v6 + 1),
    v7,
    *((uint64_t *)&v7 + 1),
    v8,
    *((uint64_t *)&v8 + 1),
    v9,
    *((uint64_t *)&v9 + 1),
    *(void *)(a1 + 336),
    *(void *)(a1 + 344),
    *(unsigned char *)(a1 + 352));
  return a1;
}

uint64_t outlined consume of _ConditionalContent<StrokeShapeView<Path, Color, EmptyView>, ZStack<TupleView<(StrokeShapeView<Path, Color, StrokeShapeView<Path, Color, EmptyView>>, StrokeShapeView<Path, Color, EmptyView>)>>>.Storage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned __int8 a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, unsigned __int8 a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,unsigned __int8 a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  if (a45)
  {
    outlined consume of Path.Storage(a3, a4, a5, a6, a7);
    swift_release();
    swift_bridgeObjectRelease();
    outlined consume of Path.Storage(a15, a16, a17, a18, a19);
    swift_release();
    swift_bridgeObjectRelease();
    outlined consume of Path.Storage(a31, a32, a33, a34, a35);
  }
  else
  {
    outlined consume of Path.Storage(a1, a2, a3, a4, a5);
  }
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t outlined consume of Path.Storage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 - 2 <= 3) {
    return swift_release();
  }
  return result;
}

uint64_t _s7SwiftUI19_ConditionalContentV7StorageOyAA15StrokeShapeViewVyAA4PathVAA5ColorVAA05EmptyH0VGAA6ZStackVyAA05TupleH0VyAGyAikNG_ANtGG_GWOi0_(uint64_t result)
{
  *(unsigned char *)(result + 352) = 1;
  return result;
}

uint64_t _s7SwiftUI19_ConditionalContentV7StorageOyAA15StrokeShapeViewVyAA4PathVAA5ColorVAA05EmptyH0VGAA6ZStackVyAA05TupleH0VyAGyAikNG_ANtGG_GWOi_(uint64_t result)
{
  *(unsigned char *)(result + 352) = 0;
  return result;
}

uint64_t outlined init with take of Path.Storage(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t outlined retain of Path.Storage(uint64_t a1)
{
  return a1;
}

uint64_t outlined retain of StrokeShapeView<Path, Color, StrokeShapeView<Path, Color, EmptyView>>(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 96);
  uint64_t v3 = *(void *)(a1 + 104);
  uint64_t v4 = *(void *)(a1 + 112);
  uint64_t v5 = *(void *)(a1 + 120);
  unsigned __int8 v6 = *(unsigned char *)(a1 + 128);
  outlined copy of Path.Storage(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(unsigned char *)(a1 + 32));
  swift_bridgeObjectRetain();
  swift_retain();
  outlined copy of Path.Storage(v2, v3, v4, v5, v6);
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t outlined release of StrokeShapeView<Path, Color, StrokeShapeView<Path, Color, EmptyView>>(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 96);
  uint64_t v3 = *(void *)(a1 + 104);
  uint64_t v4 = *(void *)(a1 + 112);
  uint64_t v5 = *(void *)(a1 + 120);
  unsigned __int8 v6 = *(unsigned char *)(a1 + 128);
  outlined consume of Path.Storage(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(unsigned char *)(a1 + 32));
  swift_release();
  swift_bridgeObjectRelease();
  outlined consume of Path.Storage(v2, v3, v4, v5, v6);
  swift_release();
  swift_bridgeObjectRelease();
  return a1;
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<<<opaque return type of View.popover<A>(isPresented:attachmentAnchor:arrowEdge:content:)>>.0, _AlignmentWritingModifier> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result = lazy protocol witness table cache variable for type ModifiedContent<<<opaque return type of View.popover<A>(isPresented:attachmentAnchor:arrowEdge:content:)>>.0, _AlignmentWritingModifier> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<<<opaque return type of View.popover<A>(isPresented:attachmentAnchor:arrowEdge:content:)>>.0, _AlignmentWritingModifier> and conformance <> ModifiedContent<A, B>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.popover<A>(isPresented:attachmentAnchor:arrowEdge:content:)>>.0, _AlignmentWritingModifier>);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for MiniPopoverButton<HStack<_ConditionalContent<ModifiedContent<ModifiedContent<ZStack<_ConditionalContent<StrokeShapeView<Path, Color, EmptyView>, ZStack<TupleView<(StrokeShapeView<Path, Color, StrokeShapeView<Path, Color, EmptyView>>, StrokeShapeView<Path, Color, EmptyView>)>>>>, _ContentShapeKindModifier<Circle>>, AccessibilityAttachmentModifier>, ModifiedContent<Group<_ConditionalContent<ModifiedContent<_ShapeView<Circle, Color>, _PaddingLayout>, ModifiedContent<ModifiedContent<StrokeShapeView<Circle, Color, EmptyView>, _PaddingLayout>, _ContentShapeKindModifier<Circle>>>>, AccessibilityAttachmentModifier>>>, <<opaque return type of View.allowsSecureDrawing()>>.0>);
    type metadata accessor for ColorPickerRepresentable(255);
    lazy protocol witness table accessor for type VStack<TupleView<(HStack<TupleView<(HStack<TupleView<(ModifiedContent<<<opaque return type of View.toggleStyle<A>(_:)>>.0, _EnvironmentKeyTransformModifier<Bool>>, ModifiedContent<<<opaque return type of View.toggleStyle<A>(_:)>>.0, _EnvironmentKeyTransformModifier<Bool>>, <<opaque return type of View.toggleStyle<A>(_:)>>.0, <<opaque return type of View.toggleStyle<A>(_:)>>.0)>>, HStack<ModifiedContent<MultiColorSwatchButton, _FrameLayout>>)>>, HStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Menu<ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<CGFloat>>, _EnvironmentKeyWritingModifier<Font?>>, _EnvironmentKeyWritingModifier<Color?>>, ForEach<Range<Int>, Int, Button<Text>>>, _FlexFrameLayout>, _BackgroundStyleModifier<Color>>, _ClipEffect<RoundedCorner>>, ModifiedContent<HStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Button<ModifiedContent<ModifiedContent<Image, _EnvironmentKeyWritingModifie(&lazy protocol witness table cache variable for type MiniPopoverButton<HStack<_ConditionalContent<ModifiedContent<ModifiedContent<ZStack<_ConditionalContent<StrokeShapeView<Path, Color, EmptyView>, ZStack<TupleView<(StrokeShapeView<Path, Color, StrokeShapeView<Path, Color, EmptyView>>, StrokeShapeView<Path, Color, EmptyView>)>>>>, _ContentShapeKindModifier<Circle>>, AccessibilityAttachmentModifier>, ModifiedContent<Group<_ConditionalContent<ModifiedContent<_ShapeView<Circle, Color>, _PaddingLayout>, ModifiedContent<ModifiedContent<StrokeShapeView<Circle, Color, EmptyView>, _PaddingLayout>, _ContentShapeKindModifier<Circle>>>>, AccessibilityAttachmentModifier>>>, <<opaque return type of View.allowsSecureDrawing()>>.0> and conformance MiniPopoverButton<A, B>, &demangling cache variable for type metadata for MiniPopoverButton<HStack<_ConditionalContent<ModifiedContent<ModifiedContent<ZStack<_ConditionalContent<StrokeShapeView<Path, Color, EmptyView>, ZStack<TupleView<(StrokeShapeView<Path, Color, StrokeShapeView<Path, Color, EmptyView>>, StrokeShapeView<Path, Color, EmptyView>)>>>>, _ContentShapeKindModifier<Circle>>, AccessibilityAttachmentModifier>, ModifiedContent<Group<_ConditionalContent<ModifiedContent<_ShapeView<Circle, Color>, _PaddingLayout>, ModifiedContent<ModifiedContent<StrokeShapeView<Circle, Color, EmptyView>, _PaddingLayout>, _ContentShapeKindModifier<Circle>>>>, AccessibilityAttachmentModifier>>>, <<opaque return type of View.allowsSecureDrawing()>>.0>);
    lazy protocol witness table accessor for type ColorPickerRepresentable and conformance ColorPickerRepresentable(&lazy protocol witness table cache variable for type ColorPickerRepresentable and conformance ColorPickerRepresentable, (void (*)(uint64_t))type metadata accessor for ColorPickerRepresentable);
    swift_getOpaqueTypeConformance2();
    lazy protocol witness table accessor for type _AlignmentWritingModifier and conformance _AlignmentWritingModifier();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<<<opaque return type of View.popover<A>(isPresented:attachmentAnchor:arrowEdge:content:)>>.0, _AlignmentWritingModifier> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

uint64_t UserInterfaceStyle.init(rawValue:)(uint64_t result)
{
  if ((unint64_t)(result + 1) >= 3) {
    return 0;
  }
  return result;
}

uint64_t *protocol witness for RawRepresentable.init(rawValue:) in conformance UserInterfaceStyle@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *result;
  if ((unint64_t)(*result + 1) <= 2)
  {
    char v3 = 0;
  }
  else
  {
    uint64_t v2 = 0;
    char v3 = 1;
  }
  *(void *)a2 = v2;
  *(unsigned char *)(a2 + 8) = v3;
  return result;
}

unint64_t UserInterfaceState.init(rawValue:)(unint64_t result)
{
  if (result > 2) {
    return 0;
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type UserInterfaceStyle and conformance UserInterfaceStyle()
{
  unint64_t result = lazy protocol witness table cache variable for type UserInterfaceStyle and conformance UserInterfaceStyle;
  if (!lazy protocol witness table cache variable for type UserInterfaceStyle and conformance UserInterfaceStyle)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UserInterfaceStyle and conformance UserInterfaceStyle);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type UserInterfaceState and conformance UserInterfaceState()
{
  unint64_t result = lazy protocol witness table cache variable for type UserInterfaceState and conformance UserInterfaceState;
  if (!lazy protocol witness table cache variable for type UserInterfaceState and conformance UserInterfaceState)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UserInterfaceState and conformance UserInterfaceState);
  }
  return result;
}

uint64_t *protocol witness for RawRepresentable.init(rawValue:) in conformance UserInterfaceState@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *result;
  BOOL v3 = (unint64_t)*result > 2;
  if ((unint64_t)*result > 2) {
    uint64_t v2 = 0;
  }
  *(void *)a2 = v2;
  *(unsigned char *)(a2 + 8) = v3;
  return result;
}

ValueMetadata *type metadata accessor for UserInterfaceStyle()
{
  return &type metadata for UserInterfaceStyle;
}

ValueMetadata *type metadata accessor for UserInterfaceState()
{
  return &type metadata for UserInterfaceState;
}

uint64_t key path getter for MiniMenuState.feedbackAction : MiniMenuState@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  lazy protocol witness table accessor for type MiniMenuState and conformance MiniMenuState();
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v4 = *(void *)(v3 + 248);
  *a2 = *(void *)(v3 + 240);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t key path setter for MiniMenuState.feedbackAction : MiniMenuState()
{
  return swift_bridgeObjectRelease();
}

uint64_t EnvironmentValues.miniMenuController.getter()
{
  lazy protocol witness table accessor for type EnvironmentValues.__Key_miniMenuController and conformance EnvironmentValues.__Key_miniMenuController();
  EnvironmentValues.subscript.getter();
  return v1;
}

uint64_t one-time initialization function for miniMenuLogger()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, miniMenuLogger);
  __swift_project_value_buffer(v0, (uint64_t)miniMenuLogger);
  return Logger.init(subsystem:category:)();
}

uint64_t protocol witness for static EnvironmentKey._valuesEqual(_:_:) in conformance EnvironmentValues.__Key_miniMenuController()
{
  return MEMORY[0x270EFF9A0]();
}

void *MiniMenuController.init()()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for MiniMenu(0);
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  uint64_t v5 = &v17[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v3);
  long long v7 = &v17[-v6];
  v0[2] = 0;
  type metadata accessor for MiniMenuState();
  swift_allocObject();
  MiniMenuState.init(visible:options:)();
  v0[3] = v8;
  v0[5] = 0;
  swift_unknownObjectWeakInit();
  swift_weakInit();
  v17[15] = 0;
  swift_retain();
  State.init(wrappedValue:)();
  uint64_t v9 = v18;
  v7[8] = v17[16];
  *((void *)v7 + 2) = v9;
  lazy protocol witness table accessor for type MiniMenuState and conformance MiniMenuState();
  Bindable<A>.init(wrappedValue:)();
  id v10 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SecureHostingController<MiniMenu>));
  outlined init with copy of MiniMenu((uint64_t)v7, (uint64_t)v5);
  uint64_t v11 = UIHostingController.init(rootView:)();
  outlined destroy of MiniMenu((uint64_t)v7);
  v12 = (void *)v1[2];
  v1[2] = v11;

  v13 = (void *)v1[2];
  if (!v13) {
    return v1;
  }
  unint64_t result = objc_msgSend(v13, sel_view);
  if (result)
  {
    v15 = result;
    id v16 = objc_msgSend(self, sel_clearColor);
    objc_msgSend(v15, sel_setBackgroundColor_, v16);

    return v1;
  }
  __break(1u);
  return result;
}

void MiniMenuController.dismissMiniMenu()()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)(v0 + 24);
  swift_getKeyPath();
  lazy protocol witness table accessor for type MiniMenuState and conformance MiniMenuState();
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  if (*(unsigned char *)(v2 + 32) == 1)
  {
    if (one-time initialization token for miniMenuLogger != -1) {
      swift_once();
    }
    uint64_t v3 = type metadata accessor for Logger();
    __swift_project_value_buffer(v3, (uint64_t)miniMenuLogger);
    uint64_t v4 = Logger.logObject.getter();
    os_log_type_t v5 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_20C2D7000, v4, v5, "Mini Menu being hidden", v6, 2u);
      MEMORY[0x210550270](v6, -1, -1);
    }
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
  uint64_t v8 = *(void **)(v1 + 16);
  if (v8)
  {
    id v9 = objc_msgSend(v8, sel_view);
    if (!v9)
    {
      __break(1u);
      goto LABEL_18;
    }
    id v10 = v9;
    objc_msgSend(v9, sel_setHidden_, 1);

    uint64_t v11 = *(void **)(v1 + 16);
    if (v11)
    {
      id v12 = objc_msgSend(v11, sel_parentViewController);
      if (v12)
      {

        v13 = *(void **)(v1 + 16);
        if (v13)
        {
          objc_msgSend(v13, sel_willMoveToParentViewController_, 0);
          v14 = *(void **)(v1 + 16);
          if (v14)
          {
            objc_msgSend(v14, sel_removeFromParentViewController);
            v15 = *(void **)(v1 + 16);
            if (v15)
            {
              id v16 = objc_msgSend(v15, sel_view);
              if (v16)
              {
                v17 = v16;
                objc_msgSend(v16, sel_removeFromSuperview);

                return;
              }
LABEL_18:
              __break(1u);
            }
          }
        }
      }
    }
  }
}

void MiniMenuController.showMiniMenu()()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)(v0 + 24);
  swift_getKeyPath();
  lazy protocol witness table accessor for type MiniMenuState and conformance MiniMenuState();
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  if ((*(unsigned char *)(v2 + 32) & 1) == 0)
  {
    if (one-time initialization token for miniMenuLogger != -1) {
      swift_once();
    }
    uint64_t v3 = type metadata accessor for Logger();
    __swift_project_value_buffer(v3, (uint64_t)miniMenuLogger);
    uint64_t v4 = Logger.logObject.getter();
    os_log_type_t v5 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_20C2D7000, v4, v5, "Mini Menu being shown", v6, 2u);
      MEMORY[0x210550270](v6, -1, -1);
    }
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
  uint64_t v8 = *(void **)(v1 + 16);
  if (v8)
  {
    id v9 = objc_msgSend(v8, sel_view);
    if (v9)
    {
      id v10 = v9;
      objc_msgSend(v9, sel_setHidden_, 0);
    }
    else
    {
      __break(1u);
    }
  }
}

Swift::Void __swiftcall MiniMenuController.update()()
{
  uint64_t v1 = v0;
  if (MEMORY[0x210550400](v0 + 32))
  {
    uint64_t v2 = *(void *)(v0 + 40);
    if (MEMORY[0x210550400](v0 + 32))
    {
      uint64_t v3 = *(void *)(v0 + 40);
      uint64_t ObjectType = swift_getObjectType();
      os_log_type_t v5 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 136))(ObjectType, v3);
      swift_unknownObjectRelease();
      if (v5)
      {
        uint64_t v6 = *(void *)(v0 + 24);
        uint64_t KeyPath = swift_getKeyPath();
        MEMORY[0x270FA5388](KeyPath);
        lazy protocol witness table accessor for type MiniMenuState and conformance MiniMenuState();
        ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
        swift_release();
        uint64_t v8 = swift_getObjectType();
        if (((*(uint64_t (**)(uint64_t, uint64_t))(v2 + 144))(v8, v2) & 1) == 0) {
          goto LABEL_42;
        }
        double v9 = (*(double (**)(uint64_t, uint64_t))(v2 + 160))(v8, v2);
        CGFloat v11 = v10;
        CGFloat v13 = v12;
        CGFloat v15 = v14;
        if (!CGRect.isFinite.getter(v9, v10, v12, v14)) {
          goto LABEL_42;
        }
        v119.origin.x = v9;
        v119.origin.y = v11;
        v119.size.width = v13;
        v119.size.height = v15;
        if (CGRectIsEmpty(v119)) {
          goto LABEL_42;
        }
        if (MEMORY[0x210550400](v0 + 32))
        {
          uint64_t v16 = *(void *)(v0 + 40);
          uint64_t v17 = swift_getObjectType();
          uint64_t v18 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v16 + 136))(v17, v16);
          swift_unknownObjectRelease();
          if (v18)
          {
            id v19 = objc_msgSend(v18, sel_window);

            if (v19)
            {
              id v20 = objc_msgSend(self, sel_activeToolPickerForWindow_, v19);

              if (v20)
              {
                v21 = *(void **)(v1 + 16);
                if (v21)
                {
                  id v22 = objc_msgSend(v21, sel_view);
                  if (!v22)
                  {
LABEL_64:
                    __break(1u);
LABEL_65:
                    __break(1u);
                    return;
                  }
                  v23 = v22;
                  id v24 = objc_msgSend(v22, sel_superview);

                  if (v24)
                  {
                    objc_msgSend(v20, sel_frameObscuredInView_, v24);
                    double v9 = specialized MiniMenuController.cropFrameToPreventOverlap(frame:overlapFrame:)(v9, v11, v13, v15, v25, v26, v27, v28);
                    CGFloat v11 = v29;
                    CGFloat v13 = v30;
                    CGFloat v15 = v31;
                  }
                }
              }
            }
          }
        }
        v32 = *(void **)(v1 + 16);
        if (!v32) {
          goto LABEL_42;
        }
        id v112 = v32;
        id v33 = objc_msgSend(v112, sel_parentViewController);
        v110 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 128);
        uint64_t v34 = v110(v8, v2);
        v35 = (void *)v34;
        if (v33)
        {
          if (v34)
          {
            type metadata accessor for UIViewController();
            id v36 = v33;
            char v37 = static NSObject.== infix(_:_:)();

            v38 = v112;
            if (v37) {
              goto LABEL_32;
            }
            goto LABEL_28;
          }
        }
        else
        {
          v38 = v112;
          if (!v34) {
            goto LABEL_32;
          }
          id v33 = (id)v34;
        }

        v38 = v112;
LABEL_28:
        objc_msgSend(v38, sel_removeFromParentViewController);
        id v39 = objc_msgSend(v38, sel_view);
        if (!v39)
        {
          __break(1u);
LABEL_63:
          __break(1u);
          goto LABEL_64;
        }
        v40 = v39;
        objc_msgSend(v39, sel_removeFromSuperview);

        objc_msgSend(v38, sel_didMoveToParentViewController_, 0);
        v41 = (void *)v110(v8, v2);
        if (v41)
        {
          v42 = v41;
          objc_msgSend(v41, sel_addChildViewController_, v38);
          id v43 = objc_msgSend(v38, sel_view);
          if (v43)
          {
            v44 = v43;
            objc_msgSend(v5, sel_addSubview_, v43);

            objc_msgSend(v38, sel_didMoveToParentViewController_, v42);
            goto LABEL_32;
          }
          goto LABEL_63;
        }
LABEL_32:

        v45 = *(void **)(v1 + 16);
        if (v45)
        {
          id v46 = objc_msgSend(v45, sel_view);
          if (v46)
          {
            v47 = v46;
            v48 = (void *)MEMORY[0x21054D080](0x756E654D696E694DLL, 0xE800000000000000);
            objc_msgSend(v47, sel_setAccessibilityIdentifier_, v48);
          }
          v49 = *(void **)(v1 + 16);
          if (v49)
          {
            id v50 = objc_msgSend(v49, sel_view);
            if (v50)
            {
              v51 = v50;
              v52 = (void *)MEMORY[0x21054D080](0x756E654D696E694DLL, 0xE800000000000000);
              objc_msgSend(v51, sel_setAccessibilityLabel_, v52);
            }
            v53 = *(void **)(v1 + 16);
            if (v53)
            {
              id v54 = objc_msgSend(v53, sel_view);
              if (v54)
              {
                v55 = v54;
                CGFloat v113 = (*(double (**)(uint64_t, uint64_t))(v2 + 152))(v8, v2);
                CGFloat v57 = v56;
                CGFloat v59 = v58;
                CGFloat v61 = v60;
                id v62 = objc_msgSend(v5, sel_window);
                if (v62)
                {
                  v63 = v62;
                  id v64 = objc_msgSend(v62, sel_screen);

                  objc_msgSend(v64, sel_scale);
                  double v66 = v65;
                }
                else
                {
                  double v66 = 1.0;
                }
                double v67 = CGRect.rounded(scale:)(v66, v113, v57, v59, v61);
                CGFloat v69 = v68;
                CGFloat v71 = v70;
                CGFloat v73 = v72;
                swift_getKeyPath();
                ObservationRegistrar.access<A, B>(_:keyPath:)();
                swift_release();
                v74 = *(double **)(v6 + 24);
                v74[2] = v67;
                v74[3] = v69;
                v74[4] = v71;
                v74[5] = v73;
                v120.size.height = v73;
                CGFloat v117 = v73;
                v120.origin.x = v67;
                v120.origin.y = v69;
                CGFloat v75 = v69;
                CGFloat v108 = v69;
                v120.size.width = v71;
                double MinY = CGRectGetMinY(v120);
                v121.origin.x = v9;
                v121.origin.y = v11;
                v121.size.width = v13;
                v121.size.height = v15;
                double v114 = MinY - CGRectGetMinY(v121);
                v122.origin.x = v9;
                v122.origin.y = v11;
                v122.size.width = v13;
                v122.size.height = v15;
                double MaxY = CGRectGetMaxY(v122);
                v123.origin.x = v67;
                v123.origin.y = v75;
                v123.size.width = v71;
                v123.size.height = v117;
                double v111 = MaxY - CGRectGetMaxY(v123);
                MiniMenuController.showMiniMenu()();
                objc_msgSend(v55, sel_sizeToFit);
                objc_msgSend(v55, sel_frame);
                double v109 = v78;
                double v80 = v79;
                v124.origin.x = v67;
                v124.origin.y = v108;
                CGFloat v116 = v71;
                v124.size.width = v71;
                v124.size.height = v117;
                v136.origin.x = v9;
                v136.origin.y = v11;
                v136.size.width = v13;
                v136.size.height = v15;
                CGRect v125 = CGRectIntersection(v124, v136);
                v137.origin.x = v9;
                v137.origin.y = v11;
                v137.size.width = v13;
                v137.size.height = v15;
                if (CGRectEqualToRect(v125, v137))
                {
                  double v81 = v80;
                  v126.origin.x = v9;
                  v126.origin.y = v11;
                  v126.size.width = v13;
                  v126.size.height = v15;
                  CGFloat v82 = v109;
                  double v83 = CGRectGetMidX(v126) + v109 * -0.5;
                  double v84 = v9;
                  CGFloat v85 = v11;
                  CGFloat v86 = v13;
                  CGFloat v87 = v15;
                  if (v111 >= v114) {
                    double v88 = CGRectGetMaxY(*(CGRect *)&v84);
                  }
                  else {
                    double v88 = CGRectGetMinY(*(CGRect *)&v84);
                  }
                  double v93 = v88 + -16.0 - v81;
                  goto LABEL_56;
                }
                double v107 = v80;
                double v89 = v80 + 16.0;
                if (v111 >= v114)
                {
                  CGFloat v90 = v67;
                  v129.origin.x = v67;
                  v129.origin.y = v108;
                  v129.size.width = v116;
                  v129.size.height = v117;
                  double v91 = CGRectGetMaxY(v129);
                  v130.origin.x = v9;
                  v130.origin.y = v11;
                  v130.size.width = v13;
                  v130.size.height = v15;
                  if (v89 < CGRectGetMaxY(v130) - v91) {
                    goto LABEL_50;
                  }
                }
                else
                {
                  CGFloat v90 = v67;
                  v127.origin.x = v67;
                  v127.origin.y = v108;
                  v127.size.width = v116;
                  v127.size.height = v117;
                  double v91 = CGRectGetMinY(v127);
                  v128.origin.x = v9;
                  v128.origin.y = v11;
                  v128.size.width = v13;
                  v128.size.height = v15;
                  if (v89 >= v91 - CGRectGetMinY(v128))
                  {
LABEL_50:
                    double v92 = v91 + 16.0;
LABEL_55:
                    double v115 = v92;
                    v131.origin.x = v90;
                    v131.origin.y = v108;
                    v131.size.width = v116;
                    v131.size.height = v117;
                    CGFloat v82 = v109;
                    double v83 = CGRectGetMidX(v131) + v109 * -0.5;
                    double v81 = v107;
                    double v93 = v115;
LABEL_56:
                    v132.origin.x = v83;
                    v132.origin.y = v93;
                    v132.size.width = v82;
                    v132.size.height = v81;
                    if (CGRectIsEmpty(v132))
                    {
                      swift_unknownObjectRelease();

                      goto LABEL_43;
                    }
                    v133.origin.x = v9;
                    v133.origin.y = v11;
                    v133.size.width = v13;
                    v133.size.height = v15;
                    CGRect v134 = CGRectInset(v133, 5.0, 5.0);
                    __C::CGRect v135 = CGRect.closestRect(in:)((__C::CGRect)v134);
                    objc_msgSend(v55, sel_setFrame_, v135.origin.x, v135.origin.y, v135.size.width, v135.size.height);
                    v94 = *(void **)(v1 + 16);
                    if (!v94) {
                      goto LABEL_61;
                    }
                    id v95 = v94;
                    id v96 = objc_msgSend(v95, sel_view);
                    if (v96)
                    {
                      v97 = v96;
                      objc_msgSend(v5, sel_bringSubviewToFront_, v96);

                      objc_msgSend(v95, sel_setIsAccessibilityElement_, 1);
                      objc_msgSend(v95, sel_setAccessibilityElementsHidden_, 0);

LABEL_61:
                      swift_getKeyPath();
                      ObservationRegistrar.access<A, B>(_:keyPath:)();
                      swift_release();
                      v98 = *(void **)(v6 + 24);
                      swift_retain();
                      objc_msgSend(v5, sel_convertRect_toView_, 0, v9, v11, v13, v15);
                      uint64_t v100 = v99;
                      uint64_t v102 = v101;
                      uint64_t v104 = v103;
                      uint64_t v106 = v105;
                      swift_unknownObjectRelease();

                      v98[6] = v100;
                      v98[7] = v102;
                      v98[8] = v104;
                      v98[9] = v106;
                      swift_release();
                      return;
                    }
                    goto LABEL_65;
                  }
                }
                double v92 = v91 + -16.0 - v107;
                goto LABEL_55;
              }
            }
          }
        }
LABEL_42:
        MiniMenuController.dismissMiniMenu()();
        swift_unknownObjectRelease();
LABEL_43:

        return;
      }
    }
    swift_unknownObjectRelease();
  }
  MiniMenuController.dismissMiniMenu()();
}

void __swiftcall MiniMenuController.hitTestMenu(_:with:sendingView:)(UIView_optional *__return_ptr retstr, CGPoint _, UIEvent_optional with, UIView *sendingView)
{
  Class isa = with.value.super.isa;
  with.value.super.Class isa = *(Class *)(v4 + 16);
  if (with.value.super.isa)
  {
    uint64_t v6 = *(void *)&with.is_nil;
    double y = _.y;
    double x = _.x;
    id v9 = [(objc_class *)with.value.super.isa view];
    if (v9)
    {
      double v10 = v9;
      uint64_t v11 = *(void *)(v4 + 24);
      swift_getKeyPath();
      lazy protocol witness table accessor for type MiniMenuState and conformance MiniMenuState();
      ObservationRegistrar.access<A, B>(_:keyPath:)();
      swift_release();
      if (*(unsigned char *)(v11 + 32) == 1)
      {
        objc_msgSend(v10, sel_convertPoint_fromCoordinateSpace_, v6, x, y);
        objc_msgSend(v10, sel_hitTest_withEvent_, isa);
      }
    }
  }
}

void MiniMenuController.convert(color:)(CGColor **a1@<X0>, CGColor **a2@<X8>)
{
  uint64_t v4 = *a1;
  if (MEMORY[0x210550400](v2 + 32)
    && (uint64_t v5 = *(void *)(v2 + 40),
        uint64_t ObjectType = swift_getObjectType(),
        long long v7 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(ObjectType, v5),
        swift_unknownObjectRelease(),
        v7))
  {
    id v8 = objc_msgSend(v7, sel_traitCollection);

    id v9 = objc_msgSend(v8, sel_userInterfaceStyle);
    BOOL v10 = v9 == (id)2;
    if (!v4) {
      goto LABEL_10;
    }
  }
  else
  {
    BOOL v10 = 0;
    if (!v4)
    {
LABEL_10:
      *a2 = v4;
      return;
    }
  }
  if (!v10)
  {
    CGFloat v15 = v4;
    goto LABEL_10;
  }
  id v11 = objc_allocWithZone(MEMORY[0x263F825C8]);
  double v12 = v4;
  id v13 = objc_msgSend(v11, sel_initWithCGColor_, v12);
  double v14 = (void *)static PKInkingTool.convertColor(_:from:to:)();

  Color.init(cgColor:)((CGColor *)objc_msgSend(v14, sel_CGColor), &v16);
  uint64_t v4 = v16;
  if (v16)
  {

    goto LABEL_10;
  }
  __break(1u);
}

CGColorRef __swiftcall MiniMenuController.convert(cgColor:)(CGColorRef cgColor)
{
  if (MEMORY[0x210550400](v1 + 32))
  {
    uint64_t v3 = *(void *)(v1 + 40);
    uint64_t ObjectType = swift_getObjectType();
    id v5 = (id)(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(ObjectType, v3);
    swift_unknownObjectRelease();
    if (v5)
    {
      id v6 = objc_msgSend(v5, sel_traitCollection);

      id v5 = objc_msgSend(v6, sel_userInterfaceStyle);
      LODWORD(v5) = v5 == (id)2;
    }
  }
  else
  {
    LODWORD(v5) = 0;
  }
  double v12 = cgColor;
  Color.init(cgColor:)(v12, &v13);
  long long v7 = v13;
  if (v13)
  {
    if (!v5) {
      return v7;
    }
    id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithCGColor_, v13);
    id v9 = (void *)static PKInkingTool.convertColor(_:from:to:)();

    Color.init(cgColor:)((CGColor *)objc_msgSend(v9, sel_CGColor), &v13);
    id v11 = v13;
    if (v13)
    {

      return v11;
    }
    __break(1u);
  }
  else
  {
    return v12;
  }
  return result;
}

uint64_t MiniMenuController.__deallocating_deinit()
{
  swift_release();
  outlined destroy of weak AnyContainerCanvasElementView?(v0 + 32);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for MiniMenuController()
{
  return self;
}

unint64_t type metadata accessor for UIViewController()
{
  unint64_t result = lazy cache variable for type metadata for UIViewController;
  if (!lazy cache variable for type metadata for UIViewController)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for UIViewController);
  }
  return result;
}

CGFloat specialized MiniMenuController.cropFrameToPreventOverlap(frame:overlapFrame:)(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  v26.origin.CGFloat x = a5;
  v26.origin.CGFloat y = a6;
  v26.size.CGFloat width = a7;
  v26.size.CGFloat height = a8;
  v36.origin.CGFloat x = a1;
  v36.origin.CGFloat y = a2;
  v36.size.CGFloat width = a3;
  v36.size.CGFloat height = a4;
  CGRect v27 = CGRectIntersection(v26, v36);
  CGFloat x = v27.origin.x;
  CGFloat y = v27.origin.y;
  CGFloat width = v27.size.width;
  CGFloat height = v27.size.height;
  if (!CGRectEqualToRect(v27, *MEMORY[0x263F001A0]))
  {
    v28.origin.CGFloat x = a1;
    v28.origin.CGFloat y = a2;
    v28.size.CGFloat width = a3;
    v28.size.CGFloat height = a4;
    double MaxY = CGRectGetMaxY(v28);
    v29.origin.CGFloat x = x;
    v29.origin.CGFloat y = y;
    v29.size.CGFloat width = width;
    v29.size.CGFloat height = height;
    double v25 = MaxY - CGRectGetMinY(v29);
    v30.origin.CGFloat x = x;
    v30.origin.CGFloat y = y;
    v30.size.CGFloat width = width;
    v30.size.CGFloat height = height;
    double v22 = CGRectGetMaxY(v30);
    v31.origin.CGFloat x = a1;
    v31.origin.CGFloat y = a2;
    v31.size.CGFloat width = a3;
    v31.size.CGFloat height = a4;
    double v23 = v22 - CGRectGetMinY(v31);
    v32.origin.CGFloat x = x;
    v32.origin.CGFloat y = y;
    v32.size.CGFloat width = width;
    v32.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v32);
    v33.origin.CGFloat x = a1;
    v33.origin.CGFloat y = a2;
    v33.size.CGFloat width = a3;
    v33.size.CGFloat height = a4;
    double v21 = MaxX - CGRectGetMinX(v33);
    v34.origin.CGFloat x = a1;
    v34.origin.CGFloat y = a2;
    v34.size.CGFloat width = a3;
    v34.size.CGFloat height = a4;
    double v16 = CGRectGetMaxX(v34);
    v35.origin.CGFloat x = x;
    v35.origin.CGFloat y = y;
    v35.size.CGFloat width = width;
    v35.size.CGFloat height = height;
    double v17 = v16 - CGRectGetMinX(v35);
    if (v23 >= v25) {
      double v18 = v25;
    }
    else {
      double v18 = v23;
    }
    if (v21 < v18) {
      double v18 = v21;
    }
    if (v17 < v18) {
      double v18 = v17;
    }
    if (v18 != v25 && v18 != v23 && v18 == v21) {
      return v21 + a1;
    }
  }
  return a1;
}

uint64_t outlined init with copy of MiniMenu(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MiniMenu(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of MiniMenu(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MiniMenu(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

ValueMetadata *type metadata accessor for EnvironmentValues.__Key_miniMenuController()
{
  return &type metadata for EnvironmentValues.__Key_miniMenuController;
}

uint64_t closure #1 in MiniMenuState.visible.setterpartial apply()
{
  return _s8PaperKit13MiniMenuStateC7visibleSbvsyyXEfU_TA_0();
}

Swift::Void __swiftcall CanvasGenerationToolOverlayController.removeUI()()
{
  uint64_t v1 = OBJC_IVAR____TtC8PaperKit37CanvasGenerationToolOverlayController_canvasGenerationToolController;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC8PaperKit37CanvasGenerationToolOverlayController_canvasGenerationToolController);
  if (v2)
  {
    uint64_t v3 = v0;
    uint64_t v4 = one-time initialization token for canvasGenerationToolController;
    id v5 = v2;
    if (v4 != -1) {
      swift_once();
    }
    uint64_t v6 = type metadata accessor for Logger();
    __swift_project_value_buffer(v6, (uint64_t)static Logger.canvasGenerationToolController);
    long long v7 = Logger.logObject.getter();
    os_log_type_t v8 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v7, v8))
    {
      id v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_20C2D7000, v7, v8, "remove canvas generation tool overlay", v9, 2u);
      MEMORY[0x210550270](v9, -1, -1);
    }

    objc_msgSend(v5, sel_willMoveToParentViewController_, 0);
    id v10 = objc_msgSend(v5, sel_view);
    if (v10)
    {
      id v11 = v10;
      objc_msgSend(v10, sel_removeFromSuperview);

      objc_msgSend(v5, sel_didMoveToParentViewController_, 0);
      double v12 = *(void **)(v3 + v1);
      *(void *)(v3 + v1) = 0;
    }
    else
    {
      __break(1u);
    }
  }
}

id CanvasGenerationToolOverlayController.imageGenerationController.getter()
{
  uint64_t v1 = OBJC_IVAR____TtC8PaperKit37CanvasGenerationToolOverlayController____lazy_storage___imageGenerationController;
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC8PaperKit37CanvasGenerationToolOverlayController____lazy_storage___imageGenerationController);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC8PaperKit37CanvasGenerationToolOverlayController____lazy_storage___imageGenerationController);
  }
  else
  {
    id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F14B38]), sel_init);
    objc_msgSend(v4, sel_setDelegate_, v0);
    id v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

void CanvasGenerationToolOverlayController.updateUI()()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0 + OBJC_IVAR____TtC8PaperKit37CanvasGenerationToolOverlayController_tiledTextView;
  id v3 = (void *)MEMORY[0x210550400](v0 + OBJC_IVAR____TtC8PaperKit37CanvasGenerationToolOverlayController_tiledTextView);
  if (v3
    && (id v4 = v3, v5 = objc_msgSend(v3, sel_superview), v4, v5)
    && (v5,
        id v6 = CanvasGenerationToolOverlayController.imageGenerationController.getter(),
        unsigned int v7 = objc_msgSend(v6, sel_shouldShowImageGenerationUI),
        v6,
        v7))
  {
    uint64_t v8 = OBJC_IVAR____TtC8PaperKit37CanvasGenerationToolOverlayController_canvasGenerationToolController;
    if (*(void *)(v1 + OBJC_IVAR____TtC8PaperKit37CanvasGenerationToolOverlayController_canvasGenerationToolController)
      || (uint64_t v14 = MEMORY[0x210550400](v2)) == 0)
    {
      id v9 = (void *)MEMORY[0x210550400](v2);

      if (v9) {
        return;
      }
      if (one-time initialization token for canvasGenerationToolController != -1) {
        swift_once();
      }
      uint64_t v23 = type metadata accessor for Logger();
      __swift_project_value_buffer(v23, (uint64_t)static Logger.canvasGenerationToolController);
      oslog = Logger.logObject.getter();
      os_log_type_t v24 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(oslog, v24))
      {
        double v25 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)double v25 = 0;
        _os_log_impl(&dword_20C2D7000, oslog, v24, "unable to install canvas generation tool overlay", v25, 2u);
        MEMORY[0x210550270](v25, -1, -1);
      }
    }
    else
    {
      CGFloat v15 = (void *)v14;
      if (one-time initialization token for canvasGenerationToolController != -1) {
        swift_once();
      }
      uint64_t v16 = type metadata accessor for Logger();
      __swift_project_value_buffer(v16, (uint64_t)static Logger.canvasGenerationToolController);
      double v17 = Logger.logObject.getter();
      os_log_type_t v18 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v17, v18))
      {
        id v19 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v19 = 0;
        _os_log_impl(&dword_20C2D7000, v17, v18, "install canvas generation tool overlay", v19, 2u);
        MEMORY[0x210550270](v19, -1, -1);
      }

      id v20 = TiledTextView.createCanvasGenerationToolController()();
      double v21 = *(void **)(v1 + v8);
      *(void *)(v1 + v8) = v20;
      oslog = v20;

      if (v20)
      {
        double v22 = (void *)MEMORY[0x210550400](v1 + OBJC_IVAR____TtC8PaperKit37CanvasGenerationToolOverlayController_canvas);
        swift_unknownObjectWeakAssign();
      }
      if (*(void *)(v1 + v8)) {
        swift_unknownObjectWeakAssign();
      }
    }
  }
  else
  {
    if (one-time initialization token for canvasGenerationToolController != -1) {
      swift_once();
    }
    uint64_t v10 = type metadata accessor for Logger();
    __swift_project_value_buffer(v10, (uint64_t)static Logger.canvasGenerationToolController);
    id v11 = Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v11, v12))
    {
      id v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v13 = 0;
      _os_log_impl(&dword_20C2D7000, v11, v12, "remove canvas generation tool overlay", v13, 2u);
      MEMORY[0x210550270](v13, -1, -1);
    }

    CanvasGenerationToolOverlayController.removeUI()();
  }
}

uint64_t closure #1 in CanvasGenerationToolOverlayController.imageGenerationControllerShouldShowImageGenerationUIDidChange(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  type metadata accessor for MainActor();
  *(void *)(v4 + 24) = static MainActor.shared.getter();
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter();
  return MEMORY[0x270FA2498](closure #1 in CanvasGenerationToolOverlayController.imageGenerationControllerShouldShowImageGenerationUIDidChange(_:), v6, v5);
}

uint64_t closure #1 in CanvasGenerationToolOverlayController.imageGenerationControllerShouldShowImageGenerationUIDidChange(_:)()
{
  swift_release();
  CanvasGenerationToolOverlayController.updateUI()();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t type metadata accessor for CanvasGenerationToolOverlayController()
{
  return self;
}

uint64_t sub_20C81DA8C()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t partial apply for closure #1 in CanvasGenerationToolOverlayController.imageGenerationControllerShouldShowImageGenerationUIDidChange(_:)(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  unsigned int v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *unsigned int v7 = v2;
  v7[1] = partial apply for closure #1 in AnyCanvas.calculateDocumentResultChanged(_:itemUUID:needsAttribution:);
  return closure #1 in CanvasGenerationToolOverlayController.imageGenerationControllerShouldShowImageGenerationUIDidChange(_:)(a1, v4, v5, v6);
}

void *ImageLayout.createView<A>(in:canvas:parent:)(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  v26[1] = a4;
  v26[2] = a5;
  v26[3] = a1;
  uint64_t v9 = type metadata accessor for CRKeyPath();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  os_log_type_t v12 = (char *)v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Ref<Image>);
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Capsule<Image>);
  double v18 = MEMORY[0x270FA5388](v17 - 8);
  id v20 = (char *)v26 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, double))(v10 + 16))(v12, v6, v9, v18);
  type metadata accessor for Image();
  lazy protocol witness table accessor for type NSObject and conformance NSObject(&lazy protocol witness table cache variable for type Image and conformance Image, (void (*)(uint64_t))type metadata accessor for Image);
  Ref.init(id:)();
  type metadata accessor for Capsule();
  lazy protocol witness table accessor for type Ref<Image> and conformance Ref<A>();
  Capsule.encapsulate<A>(_:)();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  id v21 = objc_allocWithZone((Class)type metadata accessor for ImageElementView(0));
  id v22 = a3;
  id v23 = a2;
  os_log_type_t v24 = specialized ImageElementView.init(canvasElement:canvas:parentCanvasElement:)((uint64_t)v20, a2, a3);

  return v24;
}

void closure #1 in static ImageLayout.loadItemProvider(_:canvasFrame:frame:rotation:anchor:offset:assetManager:dragItem:completion:)(uint64_t a1, unint64_t a2, void *a3, double a4, double a5, double a6, double a7, double a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, NSObject *a13, char a14, void *a15, uint64_t a16, uint64_t a17)
{
  uint64_t v49 = a12;
  id v50 = a13;
  uint64_t v47 = a17;
  uint64_t v48 = a10;
  uint64_t v46 = a16;
  uint64_t v26 = type metadata accessor for CRAsset();
  uint64_t v27 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388](v26);
  CGRect v29 = (char *)&v46 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2 >> 60 == 15)
  {
    if (a3)
    {
      id v30 = a3;
      if (one-time initialization token for logger != -1) {
        swift_once();
      }
      uint64_t v31 = type metadata accessor for Logger();
      __swift_project_value_buffer(v31, (uint64_t)logger);
      id v32 = a3;
      id v33 = a3;
      id v50 = Logger.logObject.getter();
      os_log_type_t v34 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v50, v34))
      {
        CGRect v35 = (uint8_t *)swift_slowAlloc();
        uint64_t v36 = swift_slowAlloc();
        v52[0] = v36;
        *(_DWORD *)CGRect v35 = 136315138;
        swift_getErrorValue();
        uint64_t v37 = Error.localizedDescription.getter();
        uint64_t v51 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v37, v38, v52);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_20C2D7000, v50, v34, "Unable to decode image data representation: %s", v35, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x210550270](v36, -1, -1);
        MEMORY[0x210550270](v35, -1, -1);
      }
      else
      {

        v45 = v50;
      }
    }
  }
  else
  {
    outlined copy of Data?(a1, a2);
    outlined copy of Data?(a1, a2);
    swift_retain();
    CRAsset.init(data:assetManager:)();
    LOBYTE(v52[0]) = a11;
    id v39 = objc_msgSend(a15, sel_suggestedName);
    if (v39)
    {
      v40 = v39;
      uint64_t v41 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v43 = v42;
    }
    else
    {
      uint64_t v41 = 0;
      uint64_t v43 = 0;
    }
    uint64_t v44 = swift_allocObject();
    *(void *)(v44 + 16) = v46;
    *(void *)(v44 + 24) = v47;
    swift_retain();
    static ImageLayout.load(_:canvasFrame:frame:rotation:scaleFrame:anchor:offset:name:completion:)((uint64_t)v29, v48, 1, (unsigned __int8 *)v52, v49, (uint64_t)v50, a14 & 1, v41, a4, a5, a6, a7, a8, v43, (uint64_t)partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Capsule<Image>?) -> (), v44);
    swift_release();
    swift_bridgeObjectRelease();
    outlined consume of Data?(a1, a2);
    (*(void (**)(char *, uint64_t))(v27 + 8))(v29, v26);
  }
}

uint64_t thunk for @escaping @callee_guaranteed (@in_guaranteed Capsule<Image>?) -> ()(uint64_t a1, void (*a2)(char *))
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Capsule<Image>?);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Capsule<Image>);
  uint64_t v8 = *(void *)(v7 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v6, a1, v7);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  a2(v6);
  return outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)v6, &demangling cache variable for type metadata for Capsule<Image>?);
}

uint64_t static ImageLayout.load(_:canvasFrame:frame:rotation:scaleFrame:anchor:offset:name:completion:)(uint64_t a1, uint64_t a2, int a3, unsigned __int8 *a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, double a9, double a10, double a11, double a12, double a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  uint64_t v61 = a8;
  int v56 = a7;
  uint64_t v55 = a6;
  uint64_t v54 = a5;
  int v53 = a3;
  double v59 = a13;
  uint64_t v60 = a16;
  uint64_t v57 = a15;
  uint64_t v58 = a14;
  outlined init with take of CGRect?(a2, (uint64_t)v62);
  double v23 = *(double *)v62;
  double v24 = *(double *)&v62[1];
  double v26 = *(double *)&v62[2];
  double v25 = *(double *)&v62[3];
  uint64_t v27 = type metadata accessor for CRAsset();
  uint64_t v28 = *(void *)(v27 - 8);
  uint64_t v29 = *(void *)(v28 + 64);
  MEMORY[0x270FA5388](v27);
  id v30 = (char *)v51 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v52 = *a4;
  uint64_t v31 = (double *)swift_allocObject();
  outlined init with take of CGRect?(a2, (uint64_t)v63);
  int v32 = v64;
  if (v64 == 1) {
    double v33 = 0.0;
  }
  else {
    double v33 = v23;
  }
  if (v64 == 1) {
    double v34 = 0.0;
  }
  else {
    double v34 = v24;
  }
  if (v64 == 1) {
    double v35 = 0.0;
  }
  else {
    double v35 = v26;
  }
  v31[2] = v33;
  v31[3] = v34;
  if (v32 == 1) {
    double v36 = 0.0;
  }
  else {
    double v36 = v25;
  }
  v31[4] = v35;
  v31[5] = v36;
  double v37 = v35;
  double v38 = v36;
  if (CGRectIsEmpty(*(CGRect *)&v33))
  {
    if (one-time initialization token for canvasElementDefaultSize != -1) {
      swift_once();
    }
    double v35 = *(double *)&static UIConstants.canvasElementDefaultSize;
    double v36 = *(double *)algn_2676E93F0;
    *((void *)v31 + 4) = static UIConstants.canvasElementDefaultSize;
    v31[5] = v36;
  }
  else if (one-time initialization token for canvasElementDefaultSize != -1)
  {
    swift_once();
  }
  BOOL v39 = v36 == *(double *)algn_2676E93F0 && v35 == *(double *)&static UIConstants.canvasElementDefaultSize;
  (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))((char *)v51 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v27);
  uint64_t v40 = *(unsigned __int8 *)(v28 + 80);
  v51[1] = a1;
  uint64_t v41 = (v40 + 81) & ~v40;
  unint64_t v42 = (v29 + v41 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v43 = (v42 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v44 = swift_allocObject();
  *(void *)(v44 + 16) = v31;
  *(unsigned char *)(v44 + 24) = v53 & 1;
  *(unsigned char *)(v44 + 25) = v39;
  *(unsigned char *)(v44 + 26) = v52;
  *(double *)(v44 + 32) = a9;
  *(double *)(v44 + 40) = a10;
  *(double *)(v44 + 48) = a11;
  *(double *)(v44 + 56) = a12;
  uint64_t v45 = v55;
  *(void *)(v44 + 64) = v54;
  *(void *)(v44 + 72) = v45;
  *(unsigned char *)(v44 + 80) = v56 & 1;
  (*(void (**)(uint64_t, char *, uint64_t))(v28 + 32))(v44 + v41, v30, v27);
  *(double *)(v44 + v42) = v59;
  uint64_t v46 = (void *)(v44 + v43);
  uint64_t v47 = v60;
  uint64_t v48 = v58;
  *uint64_t v46 = v61;
  v46[1] = v48;
  uint64_t v49 = (void *)(v44 + ((v43 + 23) & 0xFFFFFFFFFFFFFFF8));
  void *v49 = v57;
  v49[1] = v47;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  CRAsset.read(withAccessor:)();
  swift_release();
  swift_release();
  return swift_release();
}

void closure #1 in static ImageLayout.load(_:canvasFrame:frame:rotation:scaleFrame:anchor:offset:name:completion:)(CGFloat *a1@<X1>, char a2@<W2>, char a3@<W3>, char a4@<W4>, double a5@<X5>, double a6@<X6>, char a7@<W7>, NSURL *a8@<X8>, double a9@<D0>, double a10@<D1>, double a11@<D2>, double a12@<D3>, double a13@<D4>, uint64_t a14, uint64_t a15, uint64_t a16, void (*a17)(char *), uint64_t a18)
{
  *(double *)&v52[16] = a11;
  *(double *)&v52[24] = a12;
  *(double *)int v52 = a9;
  *(double *)&v52[8] = a10;
  URL._bridgeToObjectiveC()(a8);
  CFURLRef v25 = v24;
  CGImageSourceRef v26 = CGImageSourceCreateWithURL(v24, 0);

  swift_beginAccess();
  double width = a1[4];
  double v27 = a1[5];
  if (a2)
  {
    if ((double v29 = specialized static ImageLayout.imageSize(_:)(v26), (*(void *)&width & 0x7FFFFFFFFFFFFFFFLL) == 0)
      && (*(void *)&v27 & 0x7FFFFFFFFFFFFFFFLL) == 0
      || vabdd_f64(width / v27, v29 / v30) > 0.01)
    {
      double v27 = v30;
      double width = v29;
    }
  }
  double v55 = width;
  if (a3)
  {
    if (v27 >= width) {
      double v31 = width;
    }
    else {
      double v31 = v27;
    }
    if (width > v27) {
      double v32 = width;
    }
    else {
      double v32 = v27;
    }
    if (one-time initialization token for canvasElementDefaultDimension != -1) {
      swift_once();
    }
    double v51 = a13;
    double v33 = *(double *)&static UIConstants.canvasElementDefaultDimension / v31;
    if (one-time initialization token for maximumDropCanvasElementDimension != -1) {
      swift_once();
    }
    double v34 = *(double *)&static UIConstants.maximumDropCanvasElementDimension / v32;
    if (*(double *)&static UIConstants.maximumDropCanvasElementDimension / v32 >= v33) {
      double v34 = v33;
    }
    double v35 = fmin(v34, 1.0);
    double width = width * v35;
    double height = v27 * v35;
    swift_beginAccess();
    CGFloat v37 = a1[2];
    CGFloat v38 = a1[3];
    CGFloat v40 = a1[4];
    CGFloat v39 = a1[5];
    v57.origin.double x = v37;
    v57.origin.double y = v38;
    v57.size.double width = v40;
    v57.size.double height = v39;
    double MidX = CGRectGetMidX(v57);
    v58.origin.double x = v37;
    v58.origin.double y = v38;
    v58.size.double width = v40;
    v58.size.double height = v39;
    double MidY = CGRectGetMidY(v58);
    swift_endAccess();
    double x = MidX - width * 0.5;
    double y = MidY - height * 0.5;
    swift_beginAccess();
    a1[2] = x;
    a1[3] = y;
    a13 = v51;
  }
  else
  {
    swift_beginAccess();
    CGFloat v45 = a1[2];
    CGFloat v46 = a1[3];
    CGFloat v47 = a1[4];
    CGFloat v48 = a1[5];
    v59.origin.double x = v45;
    v59.origin.double y = v46;
    v59.size.double width = v47;
    v59.size.double height = v48;
    double v49 = CGRectGetMidX(v59);
    v60.origin.double x = v45;
    v60.origin.double y = v46;
    v60.size.double width = v47;
    v60.size.double height = v48;
    double v50 = CGRectGetMidY(v60);
    swift_endAccess();
    double x = v49 - width * 0.5;
    double y = v50 - v27 * 0.5;
    swift_beginAccess();
    a1[2] = x;
    a1[3] = y;
    double height = v27;
  }
  a1[4] = width;
  a1[5] = height;
  if (a4 != 9)
  {
    char v56 = a4;
    __C::CGRect v61 = CGRect.position(in:anchor:)(*(__C::CGRect *)v52, (PaperKit::LayoutAnchor)&v56);
    double x = v61.origin.x;
    double y = v61.origin.y;
    double width = v61.size.width;
    double height = v61.size.height;
    swift_beginAccess();
    a1[2] = x;
    a1[3] = y;
    a1[4] = width;
    a1[5] = height;
  }
  if ((a7 & 1) == 0)
  {
    double x = x + a5;
    double y = y + a6;
    swift_beginAccess();
    a1[2] = x;
    a1[3] = y;
    a1[4] = width;
    a1[5] = height;
  }
  specialized static ImageLayout.createImage(_:frame:rotation:imageSize:name:completion:)(a14, a15, a16, a17, a18, x, y, width, height, a13, v55, v27);
}

uint64_t protocol witness for static Layout.canHandle(itemProvider:) in conformance ImageLayout(void *a1)
{
  uint64_t v2 = type metadata accessor for UTType();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UTType.image.getter();
  uint64_t v6 = UTType.identifier.getter();
  uint64_t v8 = v7;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v9 = (void *)MEMORY[0x21054D080](v6, v8);
  swift_bridgeObjectRelease();
  LODWORD(v2) = objc_msgSend(a1, sel_hasItemConformingToTypeIdentifier_, v9);

  if (v2) {
    return objc_msgSend(a1, sel_hasItemConformingToTypeIdentifier_, *MEMORY[0x263F14C60]) ^ 1;
  }
  else {
    return 0;
  }
}

uint64_t sub_20C81EBB0()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Capsule<Image>?) -> ()(uint64_t a1)
{
  return thunk for @escaping @callee_guaranteed (@in_guaranteed Capsule<Image>?) -> ()(a1, *(void (**)(char *))(v1 + 16));
}

uint64_t sub_20C81EBF0()
{
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_20C81EC00()
{
  uint64_t v1 = type metadata accessor for CRAsset();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 81) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (((((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, v6 + 16, v5);
}

void partial apply for closure #1 in static ImageLayout.load(_:canvasFrame:frame:rotation:scaleFrame:anchor:offset:name:completion:)()
{
  uint64_t v1 = *(void *)(type metadata accessor for CRAsset() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 81) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v3 = (*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v4 = (v3 + 15) & 0xFFFFFFFFFFFFFFF8;
  closure #1 in static ImageLayout.load(_:canvasFrame:frame:rotation:scaleFrame:anchor:offset:name:completion:)(*(CGFloat **)(v0 + 16), *(unsigned char *)(v0 + 24), *(unsigned char *)(v0 + 25), *(unsigned char *)(v0 + 26), *(double *)(v0 + 64), *(double *)(v0 + 72), *(unsigned char *)(v0 + 80), (NSURL *)(v0 + v2), *(double *)(v0 + 32), *(double *)(v0 + 40), *(double *)(v0 + 48), *(double *)(v0 + 56), *(double *)(v0 + v3), v0 + v2, *(void *)(v0 + v4), *(void *)(v0 + v4 + 8), *(void (**)(char *))(v0 + ((v4 + 23) & 0xFFFFFFFFFFFFFFF8)), *(void *)(v0 + ((v4 + 23) & 0xFFFFFFFFFFFFFFF8) + 8));
}

uint64_t specialized static ImageLayout.canvasSize(from:)(double a1, double a2)
{
  if (a1 > 0.0 && a2 > 0.0 && one-time initialization token for imageMarkupMaxDimensionBounds != -1) {
    return swift_once();
  }
  return result;
}

double specialized static ImageLayout.imageSize(_:)(void *a1)
{
  if (!a1) {
    return 0.0;
  }
  uint64_t v1 = a1;
  CFDictionaryRef v2 = CGImageSourceCopyPropertiesAtIndex(v1, 0, 0);
  if (!v2) {
    goto LABEL_21;
  }
  CFDictionaryRef v3 = v2;
  type metadata accessor for NSObject();
  lazy protocol witness table accessor for type NSObject and conformance NSObject((unint64_t *)&lazy protocol witness table cache variable for type NSObject and conformance NSObject, (void (*)(uint64_t))type metadata accessor for NSObject);
  uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v5 = (void *)*MEMORY[0x263F0F4F8];
  unint64_t v6 = v4 & 0xC000000000000001;
  if ((v4 & 0xC000000000000001) != 0)
  {
    id v7 = v5;
    if (!__CocoaDictionary.lookup(_:)()) {
      goto LABEL_22;
    }
  }
  else
  {
    if (!*(void *)(v4 + 16)) {
      goto LABEL_20;
    }
    id v7 = v5;
    specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v7);
    if ((v8 & 1) == 0) {
      goto LABEL_22;
    }
    swift_unknownObjectRetain();
  }

  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_20;
  }
  double v9 = v18;
  uint64_t v10 = (void *)*MEMORY[0x263F0F4F0];
  if (!v6)
  {
    if (*(void *)(v4 + 16))
    {
      id v7 = v10;
      specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v7);
      if (v11)
      {
        swift_unknownObjectRetain();
        goto LABEL_16;
      }
LABEL_22:
      swift_bridgeObjectRelease();

      return 0.0;
    }
LABEL_20:
    swift_bridgeObjectRelease();
LABEL_21:

    return 0.0;
  }
  id v7 = v10;
  if (!__CocoaDictionary.lookup(_:)()) {
    goto LABEL_22;
  }
LABEL_16:

  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_20;
  }
  os_log_type_t v12 = (void *)*MEMORY[0x263F0F4C8];
  if (v6)
  {
    id v13 = v12;
    uint64_t v14 = __CocoaDictionary.lookup(_:)();

    swift_bridgeObjectRelease();
    if (!v14) {
      return v9;
    }
    goto LABEL_28;
  }
  if (!*(void *)(v4 + 16))
  {
LABEL_33:
    swift_bridgeObjectRelease();

    return v9;
  }
  id v16 = v12;
  specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v16);
  if ((v17 & 1) == 0)
  {

    goto LABEL_33;
  }
  swift_unknownObjectRetain();

  swift_bridgeObjectRelease();
LABEL_28:
  if ((swift_dynamicCast() & 1) != 0 && LODWORD(v18) > 4) {
    return v18;
  }
  return v9;
}

double specialized static ImageLayout.imageSize(from:)(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for URL();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = &v23[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = type metadata accessor for DataOrURL();
  MEMORY[0x270FA5388](v6);
  char v8 = (uint64_t *)&v23[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, Bool)>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_20C832C20;
  uint64_t v10 = (void *)*MEMORY[0x263F0F600];
  *(void *)(inited + 32) = *MEMORY[0x263F0F600];
  *(unsigned char *)(inited + 40) = 0;
  id v11 = v10;
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  type metadata accessor for CFStringRef(0);
  lazy protocol witness table accessor for type NSObject and conformance NSObject((unint64_t *)&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, type metadata accessor for CFStringRef);
  v12.super.CFDataRef isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  outlined init with copy of Image(a1, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for DataOrURL);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v3 + 32))(v5, v8, v2);
    URL._bridgeToObjectiveC()(v13);
    CFURLRef v15 = v14;
    CGImageSourceRef v16 = CGImageSourceCreateWithURL(v14, v12.super.isa);

    (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
  }
  else
  {
    uint64_t v17 = *v8;
    unint64_t v18 = v8[1];
    CFDataRef isa = Data._bridgeToObjectiveC()().super.isa;
    id v20 = v12.super.isa;
    CGImageSourceRef v16 = CGImageSourceCreateWithData(isa, v20);
    outlined consume of Data._Representation(v17, v18);
  }
  double v21 = specialized static ImageLayout.imageSize(_:)(v16);

  return v21;
}

uint64_t specialized static ImageLayout.createImage(_:frame:rotation:imageSize:name:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(char *), uint64_t a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12)
{
  uint64_t v43 = a5;
  uint64_t v44 = a4;
  uint64_t v39 = a2;
  uint64_t v40 = a1;
  uint64_t v20 = type metadata accessor for CRKeyPath();
  MEMORY[0x270FA5388](v20 - 8);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Capsule<Image>);
  uint64_t v41 = *(void *)(v21 - 8);
  uint64_t v42 = v21;
  MEMORY[0x270FA5388](v21);
  double v23 = (char *)&v39 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CRAssetOrData?);
  MEMORY[0x270FA5388](v24 - 8);
  CGImageSourceRef v26 = (char *)&v39 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v27);
  double v29 = (char *)&v39 - v28;
  uint64_t v30 = type metadata accessor for Image();
  MEMORY[0x270FA5388](v30);
  double v32 = (char *)&v39 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v33);
  double v35 = (char *)&v39 - v34;
  Image.init()((uint64_t)&v39 - v34);
  double v45 = 0.0;
  double v46 = 0.0;
  double v47 = a11;
  double v48 = a12;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CRRegister<CGRect>);
  CRRegister.wrappedValue.setter();
  double v45 = a6;
  double v46 = a7;
  double v47 = a8;
  double v48 = a9;
  CRRegister.wrappedValue.setter();
  double v45 = a10;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CRRegister<CGFloat>);
  CRRegister.wrappedValue.setter();
  uint64_t v36 = type metadata accessor for CRAsset();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v36 - 8) + 16))(v29, v40, v36);
  uint64_t v37 = type metadata accessor for CRAssetOrData();
  swift_storeEnumTagMultiPayload();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v37 - 8) + 56))(v29, 0, 1, v37);
  outlined init with copy of CRAssetOrData?((uint64_t)v29, (uint64_t)v26);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CRRegister<CRAssetOrData?>);
  CRRegister.wrappedValue.setter();
  outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)v29, &demangling cache variable for type metadata for CRAssetOrData?);
  if (a3)
  {
    swift_bridgeObjectRetain();
    String.count.getter();
    swift_bridgeObjectRelease();
  }
  outlined init with copy of Image((uint64_t)v35, (uint64_t)v32, (uint64_t (*)(void))type metadata accessor for Image);
  static CRKeyPath.unique.getter();
  lazy protocol witness table accessor for type NSObject and conformance NSObject(&lazy protocol witness table cache variable for type Image and conformance Image, (void (*)(uint64_t))type metadata accessor for Image);
  Capsule<>.init(_:id:)();
  v44(v23);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v23, v42);
  return outlined destroy of Image((uint64_t)v35);
}

uint64_t outlined init with copy of CRAssetOrData?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CRAssetOrData?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of Image(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Image();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t lazy protocol witness table accessor for type NSObject and conformance NSObject(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t outlined init with copy of Image(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t getEnumTagSinglePayload for ImageLayout(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_20C81F9C0);
}

uint64_t sub_20C81F9C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CRKeyPath();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for ImageLayout(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_20C81FA40);
}

uint64_t sub_20C81FA40(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CRKeyPath();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for ImageLayout()
{
  uint64_t result = type metadata singleton initialization cache for ImageLayout;
  if (!type metadata singleton initialization cache for ImageLayout) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t associated type witness table accessor for LayoutItemProvider.Model : CRDT in ImageLayout()
{
  return lazy protocol witness table accessor for type NSObject and conformance NSObject(&lazy protocol witness table cache variable for type Image and conformance Image, (void (*)(uint64_t))type metadata accessor for Image);
}

_UNKNOWN **associated type witness table accessor for LayoutItemProvider.Model : CanvasElement in ImageLayout()
{
  return &protocol witness table for Image;
}

unint64_t lazy protocol witness table accessor for type Ref<Image> and conformance Ref<A>()
{
  unint64_t result = lazy protocol witness table cache variable for type Ref<Image> and conformance Ref<A>;
  if (!lazy protocol witness table cache variable for type Ref<Image> and conformance Ref<A>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Ref<Image>);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Ref<Image> and conformance Ref<A>);
  }
  return result;
}

id InlineDrawingCanvasElementController.activeToolPicker()()
{
  if (!MEMORY[0x210550400](v0 + OBJC_IVAR____TtC8PaperKit36InlineDrawingCanvasElementController_delegate)) {
    return 0;
  }
  specialized InlineDrawingTiledTextView.inlineDrawingCanvasElementControllerCurrentAttachment(_:)();
  uint64_t v2 = v1;
  swift_unknownObjectRelease();
  if (!v2) {
    return 0;
  }
  id v3 = objc_msgSend(v2, sel_window);

  if (!v3)
  {

    return 0;
  }
  id result = objc_msgSend(v2, sel_window);
  if (result)
  {
    uint64_t v5 = result;
    id v6 = objc_msgSend(self, sel_activeToolPickerForWindow_, result);

    return v6;
  }
  __break(1u);
  return result;
}

double InlineDrawingCanvasElementController.visibleBounds.getter()
{
  uint64_t v1 = type metadata accessor for PKDrawing();
  uint64_t v2 = *(void *)(v1 - 8);
  double v3 = MEMORY[0x270FA5388](v1);
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v6 = 0.0;
  if (MEMORY[0x210550400](v0 + OBJC_IVAR____TtC8PaperKit36InlineDrawingCanvasElementController_delegate, v3))
  {
    specialized InlineDrawingTiledTextView.inlineDrawingCanvasElementControllerCurrentAttachment(_:)();
    char v8 = v7;
    swift_unknownObjectRelease();
    if (v8)
    {
      id v9 = objc_msgSend(v8, sel_tiledView);
      if (v9)
      {
        uint64_t v10 = v9;
        id v11 = objc_msgSend(v8, sel_drawing);
        static PKDrawing._unconditionallyBridgeFromObjectiveC(_:)();

        PKDrawing._bridgeToObjectiveC()(v12);
        CFURLRef v14 = v13;
        (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
        objc_msgSend(v10, sel_visibleOnscreenBoundsForDrawing_slack_, v14, 0.0, 0.0);
        double v6 = v15;
      }
      else
      {
        objc_msgSend(v8, sel_drawingCanvasBounds);
        double v6 = v16;
      }
    }
  }
  return v6;
}

void InlineDrawingCanvasElementController.configureToolPicker(_:)(void *a1)
{
  if (!MEMORY[0x210550400](v1 + OBJC_IVAR____TtC8PaperKit36InlineDrawingCanvasElementController_delegate)) {
    return;
  }
  specialized InlineDrawingTiledTextView.inlineDrawingCanvasElementControllerCurrentAttachment(_:)();
  id v14 = v3;
  swift_unknownObjectRelease();
  if (!v14) {
    return;
  }
  uint64_t v4 = *(void **)(v1 + OBJC_IVAR____TtC8PaperKit36InlineDrawingCanvasElementController_toolPickerController);
  if (v4)
  {
    id v5 = v4;
    objc_msgSend(a1, sel_frameObscuredInView_, v14);
    BOOL IsNull = CGRectIsNull(v16);
    unsigned int v7 = objc_msgSend(a1, sel__wantsUndoRedoButtonsVisibleInCompactSize);
    uint64_t v8 = v7 ^ 1;
    if (IsNull)
    {
      objc_msgSend(a1, sel__setWantsEllipsisButtonVisibleInCompactSize_, v8);
      objc_msgSend(a1, sel__setShowsPlusButton_, 1);
    }
    else
    {
      char v9 = v7;
      objc_msgSend(a1, sel__setWantsEllipsisButtonVisibleInCompactSize_, objc_msgSend(a1, sel__wantsUndoRedoButtonsVisibleInCompactSize) ^ 1);
      objc_msgSend(a1, sel__setShowsPlusButton_, v8);
      if (v9)
      {
        uint64_t v10 = 0;
LABEL_13:
        objc_msgSend(a1, sel__setPlusButtonViewController_, v10);

        id v11 = ToolPickerController.textToolListViewController.getter();
        unsigned int v12 = objc_msgSend(a1, sel__showsShapeButton);
        int v13 = v11[OBJC_IVAR____TtC8PaperKit26TextToolListViewController_addShapeListItemVisible];
        v11[OBJC_IVAR____TtC8PaperKit26TextToolListViewController_addShapeListItemVisible] = v12 ^ 1;
        if (v12 == v13) {
          TextToolListViewController.updateUI()();
        }

        objc_msgSend(objc_msgSend(a1, sel__selectionContext), sel_setColorSwatchesVisible_, 1);
        swift_unknownObjectRelease();
        return;
      }
    }
    uint64_t v10 = ToolPickerController.textToolListViewController.getter();
    goto LABEL_13;
  }
}

void InlineDrawingCanvasElementController.updateToolPickerUI()()
{
  if (!MEMORY[0x210550400](v0 + OBJC_IVAR____TtC8PaperKit36InlineDrawingCanvasElementController_delegate)) {
    return;
  }
  specialized InlineDrawingTiledTextView.inlineDrawingCanvasElementControllerCurrentAttachment(_:)();
  uint64_t v2 = v1;
  swift_unknownObjectRelease();
  if (!v2) {
    return;
  }
  id v3 = objc_msgSend(v2, sel_window);

  if (!v3)
  {
    double v6 = v2;
LABEL_11:

    return;
  }
  id v4 = objc_msgSend(v2, sel_window);
  if (!v4)
  {
    __break(1u);
    return;
  }
  id v5 = v4;
  id v7 = objc_msgSend(self, sel_activeToolPickerForWindow_, v4);

  if (v7)
  {
    if (objc_msgSend(v7, sel_isVisible)) {
      InlineDrawingCanvasElementController.configureToolPicker(_:)(v7);
    }
    double v6 = v7;
    goto LABEL_11;
  }
}

void InlineDrawingCanvasElementController.upgradePaper(_:)(uint64_t a1)
{
  uint64_t v55 = a1;
  uint64_t v2 = type metadata accessor for UUID();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  id v5 = (char *)&v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v6);
  char v9 = (char *)&v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v11 = MEMORY[0x270FA5388](v10);
  int v13 = (char *)&v47 - v12;
  if (MEMORY[0x210550400](v1 + OBJC_IVAR____TtC8PaperKit36InlineDrawingCanvasElementController_delegate, v11))
  {
    specialized InlineDrawingTiledTextView.inlineDrawingCanvasElementControllerCurrentAttachment(_:)();
    id v56 = v14;
    swift_unknownObjectRelease();
    if (v56)
    {
      uint64_t v52 = v7;
      int v53 = v13;
      uint64_t v50 = v1;
      uint64_t v54 = v6;
      id v15 = objc_msgSend(v56, sel_superview);
      if (v15)
      {
        CGRect v16 = v15;
        uint64_t v17 = 0;
        do
        {
          if (v17)
          {

            goto LABEL_11;
          }
          self;
          uint64_t v17 = (void *)swift_dynamicCastObjCClass();
          if (v17) {
            id v19 = v16;
          }
          id v18 = objc_msgSend(v16, sel_superview);

          CGRect v16 = v18;
        }
        while (v18);
        if (!v17) {
          goto LABEL_14;
        }
LABEL_11:
        type metadata accessor for CRContext();
        CGRect v59 = 0;
        long long aBlock = 0u;
        long long v58 = 0u;
        id v51 = (id)MEMORY[0x21054C990](0, &aBlock);
        outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)&aBlock, (uint64_t *)&demangling cache variable for type metadata for EncryptionDelegate?);
        uint64_t v20 = NSTemporaryDirectory();
        static String._unconditionallyBridgeFromObjectiveC(_:)();

        URL.init(fileURLWithPath:)();
        swift_bridgeObjectRelease();
        UUID.init()();
        UUID.uuidString.getter();
        (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
        URL.appendingPathComponent(_:)();
        swift_bridgeObjectRelease();
        uint64_t v21 = *(void (**)(char *, uint64_t))(v52 + 8);
        uint64_t v49 = v52 + 8;
        double v48 = v21;
        v21(v9, v54);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CRDataStoreBundle<Paper>);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<CRCodableVersion>);
        uint64_t v22 = type metadata accessor for CRCodableVersion();
        uint64_t v23 = *(void *)(v22 - 8);
        uint64_t v24 = *(void *)(v23 + 72);
        unint64_t v25 = (*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
        uint64_t v26 = swift_allocObject();
        *(_OWORD *)(v26 + 16) = xmmword_20C835740;
        uint64_t v27 = *(void (**)(unint64_t, void, uint64_t))(v23 + 104);
        v27(v26 + v25, *MEMORY[0x263F32EB0], v22);
        v27(v26 + v25 + v24, *MEMORY[0x263F32EB8], v22);
        if (one-time initialization token for allFileFormatVersions != -1) {
          swift_once();
        }
        uint64_t v28 = v53;
        static CRDataStoreBundle.write(_:model:url:allowedEncodings:allowedAppFormats:)();
        swift_bridgeObjectRelease();
        id v30 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F088E0]), sel_init);
        uint64_t v31 = (void *)MEMORY[0x21054D080](0x6C7070612E6D6F63, 0xEF72657061702E65);
        uint64_t v32 = v52;
        uint64_t v33 = v54;
        (*(void (**)(char *, char *, uint64_t))(v52 + 16))(v9, v28, v54);
        unint64_t v34 = (*(unsigned __int8 *)(v32 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80);
        double v35 = v28;
        uint64_t v36 = swift_allocObject();
        (*(void (**)(unint64_t, char *, uint64_t))(v32 + 32))(v36 + v34, v9, v33);
        CGRect v59 = partial apply for closure #1 in InlineDrawingCanvasElementController.upgradePaper(_:);
        uint64_t v60 = v36;
        *(void *)&long long aBlock = MEMORY[0x263EF8330];
        *((void *)&aBlock + 1) = 1107296256;
        *(void *)&long long v58 = thunk for @escaping @callee_guaranteed @Sendable (@guaranteed (@escaping @callee_guaranteed @Sendable (@guaranteed NSSecureCoding?, @guaranteed Error?) -> ())?, @unowned @thick Swift.AnyObject.Type?, @guaranteed [AnyHashable : Any]?) -> ();
        *((void *)&v58 + 1) = &block_descriptor_80;
        uint64_t v37 = _Block_copy(&aBlock);
        swift_release();
        objc_msgSend(v30, sel_registerItemForTypeIdentifier_loadHandler_, v31, v37);
        _Block_release(v37);

        id v38 = objc_msgSend(v56, sel__characterIndex);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
        uint64_t v39 = swift_allocObject();
        *(_OWORD *)(v39 + 16) = xmmword_20C835790;
        *(void *)(v39 + 32) = v30;
        *(void *)&long long aBlock = v39;
        specialized Array._endMutation()();
        type metadata accessor for NSObject(0, &lazy cache variable for type metadata for NSItemProvider);
        id v40 = v30;
        Class isa = Array._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease();
        v62.origin.CGFloat x = InlineDrawingCanvasElementController.visibleBounds.getter();
        CGFloat x = v62.origin.x;
        CGFloat y = v62.origin.y;
        CGFloat width = v62.size.width;
        CGFloat height = v62.size.height;
        double MidX = CGRectGetMidX(v62);
        v63.origin.CGFloat x = x;
        v63.origin.CGFloat y = y;
        v63.size.CGFloat width = width;
        v63.size.CGFloat height = height;
        objc_msgSend(v17, sel__upgradeDrawingAtCharacterIndex_itemProviders_insertionLocationInDrawing_, v38, isa, MidX, CGRectGetMidY(v63));

        v48(v35, v33);
      }
      else
      {
LABEL_14:
        id v29 = v56;
      }
    }
  }
}

uint64_t InlineDrawingCanvasElementController.addCanvasElement<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v25 = a4;
  uint64_t v22 = a2;
  uint64_t v23 = a3;
  uint64_t v24 = a1;
  uint64_t v4 = type metadata accessor for CRKeyPath();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v21 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Ref<PKDrawingStruct>?);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  double v11 = (char *)&v21 - v10;
  uint64_t v12 = type metadata accessor for Paper();
  MEMORY[0x270FA5388](v12);
  id v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Capsule<Paper>);
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  id v18 = (char *)&v21 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for CGRect(0);
  _sSo6CGRectVAB9Coherence7CRValue8PaperKitWlTm_14((unint64_t *)&lazy protocol witness table cache variable for type CGRect and conformance CGRect, type metadata accessor for CGRect);
  long long v30 = 0u;
  long long v31 = 0u;
  CRRegister.init(wrappedValue:)();
  long long v30 = 0u;
  long long v31 = 0u;
  CRRegister.init(wrappedValue:)();
  *(void *)&long long v30 = 0;
  lazy protocol witness table accessor for type CGFloat and conformance CGFloat();
  CRRegister.init(wrappedValue:)();
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Ref<PKDrawingStruct>);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v11, 1, 1, v19);
  outlined init with copy of Ref<PKDrawingStruct>?((uint64_t)v11, (uint64_t)v8);
  lazy protocol witness table accessor for type Ref<PKDrawingStruct>? and conformance <A> A?();
  CRRegister.init(wrappedValue:)();
  outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)v11, &demangling cache variable for type metadata for Ref<PKDrawingStruct>?);
  *(void *)&long long v30 = 0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Color?);
  lazy protocol witness table accessor for type Color? and conformance <A> A?();
  CRRegister.init(wrappedValue:)();
  *(void *)&long long v30 = 0;
  *((void *)&v30 + 1) = 0xE000000000000000;
  CRRegister.init(wrappedValue:)();
  *(void *)&long long v30 = 0;
  lazy protocol witness table accessor for type CanvasElementFlags and conformance CanvasElementFlags();
  CRRegister.init(wrappedValue:)();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for SharedTagged_9<TaggedCanvasElement>);
  lazy protocol witness table accessor for type VStack<TupleView<(HStack<TupleView<(HStack<TupleView<(ModifiedContent<<<opaque return type of View.toggleStyle<A>(_:)>>.0, _EnvironmentKeyTransformModifier<Bool>>, ModifiedContent<<<opaque return type of View.toggleStyle<A>(_:)>>.0, _EnvironmentKeyTransformModifier<Bool>>, <<opaque return type of View.toggleStyle<A>(_:)>>.0, <<opaque return type of View.toggleStyle<A>(_:)>>.0)>>, HStack<ModifiedContent<MultiColorSwatchButton, _FrameLayout>>)>>, HStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Menu<ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<CGFloat>>, _EnvironmentKeyWritingModifier<Font?>>, _EnvironmentKeyWritingModifier<Color?>>, ForEach<Range<Int>, Int, Button<Text>>>, _FlexFrameLayout>, _BackgroundStyleModifier<Color>>, _ClipEffect<RoundedCorner>>, ModifiedContent<HStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Button<ModifiedContent<ModifiedContent<Image, _EnvironmentKeyWritingModifie((unint64_t *)&lazy protocol witness table cache variable for type SharedTagged_9<TaggedCanvasElement> and conformance SharedTagged_9<A>, (uint64_t *)&demangling cache variable for type metadata for SharedTagged_9<TaggedCanvasElement>);
  lazy protocol witness table accessor for type VStack<TupleView<(HStack<TupleView<(HStack<TupleView<(ModifiedContent<<<opaque return type of View.toggleStyle<A>(_:)>>.0, _EnvironmentKeyTransformModifier<Bool>>, ModifiedContent<<<opaque return type of View.toggleStyle<A>(_:)>>.0, _EnvironmentKeyTransformModifier<Bool>>, <<opaque return type of View.toggleStyle<A>(_:)>>.0, <<opaque return type of View.toggleStyle<A>(_:)>>.0)>>, HStack<ModifiedContent<MultiColorSwatchButton, _FrameLayout>>)>>, HStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Menu<ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<CGFloat>>, _EnvironmentKeyWritingModifier<Font?>>, _EnvironmentKeyWritingModifier<Color?>>, ForEach<Range<Int>, Int, Button<Text>>>, _FlexFrameLayout>, _BackgroundStyleModifier<Color>>, _ClipEffect<RoundedCorner>>, ModifiedContent<HStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Button<ModifiedContent<ModifiedContent<Image, _EnvironmentKeyWritingModifie((unint64_t *)&lazy protocol witness table cache variable for type SharedTagged_9<TaggedCanvasElement> and conformance SharedTagged_9<A>, (uint64_t *)&demangling cache variable for type metadata for SharedTagged_9<TaggedCanvasElement>);
  CROrderedSet.init()();
  *(void *)&v14[*(int *)(v12 + 48)] = MEMORY[0x263F8EE80];
  CRKeyPath.init(_:)();
  _sSo6CGRectVAB9Coherence7CRValue8PaperKitWlTm_14((unint64_t *)&lazy protocol witness table cache variable for type Paper and conformance Paper, (void (*)(uint64_t))type metadata accessor for Paper);
  Capsule<>.init(_:id:)();
  uint64_t v26 = v22;
  uint64_t v27 = v23;
  uint64_t v28 = v25;
  uint64_t v29 = v24;
  Capsule.mutate<A>(_:)();
  InlineDrawingCanvasElementController.upgradePaper(_:)((uint64_t)v18);
  return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, v15);
}

uint64_t closure #1 in InlineDrawingCanvasElementController.addCanvasElement<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v33 = a5;
  uint64_t v40 = a1;
  uint64_t v6 = type metadata accessor for CRKeyPath();
  MEMORY[0x270FA5388](v6 - 8);
  unint64_t v34 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for SharedTagged_9<TaggedCanvasElement>);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v30 = v8;
  uint64_t v31 = v9;
  MEMORY[0x270FA5388](v8);
  double v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v32 = (char *)&v29 - v13;
  uint64_t v14 = type metadata accessor for Capsule();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v29 - v16;
  uint64_t v18 = type metadata accessor for Ref();
  uint64_t v35 = *(void *)(v18 - 8);
  double v19 = MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v29 - v20;
  (*(void (**)(char *, uint64_t, uint64_t, double))(v15 + 16))(v17, a2, v14, v19);
  swift_retain();
  Ref.init<A>(_:_:)();
  swift_getKeyPath();
  Capsule<>.sharedCanvasElement.getter(v14, v33, (uint64_t)v11);
  uint64_t v22 = v30;
  SharedTagged_9.tag.getter();
  uint64_t v23 = *(void (**)(char *, uint64_t))(v31 + 8);
  uint64_t v24 = v11;
  uint64_t v25 = v22;
  v23(v24, v22);
  uint64_t v38 = v36;
  char v39 = v37;
  swift_getWitnessTable();
  Reference.identity.getter();
  lazy protocol witness table accessor for type TaggedCanvasElement and conformance TaggedCanvasElement();
  uint64_t v26 = v32;
  SharedTagged_9.init(_:id:)();
  _sSo6CGRectVAB9Coherence7CRValue8PaperKitWlTm_14((unint64_t *)&lazy protocol witness table cache variable for type Paper and conformance Paper, (void (*)(uint64_t))type metadata accessor for Paper);
  uint64_t v27 = (void (*)(uint64_t *, void))Capsule.Ref<>.subscript.modify();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CROrderedSet<SharedTagged_9<TaggedCanvasElement>>);
  CROrderedSet.append(_:)();
  v23(v26, v25);
  v27(&v36, 0);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v21, v18);
}

double InlineDrawingCanvasElementController.suggestedPositionForNewCanvasElement(withSize:)(double a1, CGFloat a2)
{
  double MidX = 0.0;
  if (MEMORY[0x210550400](v2 + OBJC_IVAR____TtC8PaperKit36InlineDrawingCanvasElementController_delegate))
  {
    specialized InlineDrawingTiledTextView.inlineDrawingCanvasElementControllerCurrentAttachment(_:)();
    uint64_t v6 = v5;
    swift_unknownObjectRelease();
    if (v6)
    {
      double v7 = InlineDrawingCanvasElementController.visibleBounds.getter();
      if (CGRect.isFinite.getter(v7, v8, v9, v10)
        && (v22.origin.CGFloat x = InlineDrawingCanvasElementController.visibleBounds.getter(), !CGRectIsEmpty(v22)))
      {
        double v11 = InlineDrawingCanvasElementController.visibleBounds.getter();
      }
      else
      {
        objc_msgSend(v6, sel_drawingCanvasBounds);
      }
      CGFloat v15 = v11;
      CGFloat v16 = v12;
      CGFloat v17 = v13;
      CGFloat v18 = v14;
      double MidX = CGRectGetMidX(*(CGRect *)&v11);
      v23.origin.CGFloat x = v15;
      v23.origin.CGFloat y = v16;
      v23.size.CGFloat width = v17;
      v23.size.CGFloat height = v18;
      CGRectGetMidY(v23);
      v24.origin.CGFloat x = v15;
      v24.origin.CGFloat y = v16;
      v24.size.CGFloat width = v17;
      v24.size.CGFloat height = v18;
      if (CGRectGetHeight(v24) >= a2)
      {
      }
      else
      {
        v25.origin.CGFloat x = v15;
        v25.origin.CGFloat y = v16;
        v25.size.CGFloat width = v17;
        v25.size.CGFloat height = v18;
        CGRectGetMidX(v25);
        v26.origin.CGFloat x = v15;
        v26.origin.CGFloat y = v16;
        v26.size.CGFloat width = v17;
        v26.size.CGFloat height = v18;
        CGRectGetMidY(v26);
        if (one-time initialization token for defaultShapeTopOffsetInAttachment != -1) {
          swift_once();
        }

        return UnknownCanvasElementView.flags.modify(v19, v20);
      }
    }
  }
  return MidX;
}

uint64_t type metadata accessor for InlineDrawingCanvasElementController()
{
  return self;
}

void protocol witness for ToolPickerControllerDelegate.toolPickerController(_:willShowToolPicker:) in conformance InlineDrawingCanvasElementController(uint64_t a1, void *a2)
{
}

void protocol witness for ToolPickerControllerDelegate.toolPickerControllerConfigureToolPicker(_:) in conformance InlineDrawingCanvasElementController()
{
}

id protocol witness for ToolPickerControllerDelegate.toolPickerControllerWindowScene(_:) in conformance InlineDrawingCanvasElementController()
{
  return specialized InlineDrawingCanvasElementController.toolPickerControllerWindowScene(_:)((SEL *)&selRef_windowScene);
}

id protocol witness for ToolPickerControllerDelegate.toolPickerControllerViewController(_:) in conformance InlineDrawingCanvasElementController()
{
  return specialized InlineDrawingCanvasElementController.toolPickerControllerWindowScene(_:)((SEL *)&selRef_rootViewController);
}

double protocol witness for ToolPickerControllerDelegate.suggestedPositionForNewCanvasElement(withSize:) in conformance InlineDrawingCanvasElementController(double a1, CGFloat a2)
{
  return InlineDrawingCanvasElementController.suggestedPositionForNewCanvasElement(withSize:)(a1, a2);
}

uint64_t partial apply for closure #1 in InlineDrawingCanvasElementController.addCanvasElement<A>(_:)(uint64_t a1)
{
  return closure #1 in InlineDrawingCanvasElementController.addCanvasElement<A>(_:)(a1, v1[5], v1[2], v1[3], v1[4]);
}

uint64_t sub_20C821610()
{
  uint64_t v1 = type metadata accessor for URL();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

void partial apply for closure #1 in InlineDrawingCanvasElementController.upgradePaper(_:)(void (*a1)(void))
{
  uint64_t v2 = *(void *)(type metadata accessor for URL() - 8);
  if (a1)
  {
    URL._bridgeToObjectiveC()((NSURL *)((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80)));
    id v4 = v3;
    a1();
  }
}

uint64_t block_copy_helper_80(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_80()
{
  return swift_release();
}

uint64_t sub_20C82176C()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void specialized InlineDrawingCanvasElementController.toolPickerController(_:willShowToolPicker:)(void *a1)
{
  uint64_t v2 = v1;
  if (!MEMORY[0x210550400](v1 + OBJC_IVAR____TtC8PaperKit36InlineDrawingCanvasElementController_delegate)) {
    return;
  }
  specialized InlineDrawingTiledTextView.inlineDrawingCanvasElementControllerCurrentAttachment(_:)();
  id v12 = v4;
  swift_unknownObjectRelease();
  if (!v12) {
    return;
  }
  id v5 = objc_msgSend(v12, sel_window);

  if (!v5) {
    goto LABEL_9;
  }
  id v6 = objc_msgSend(v12, sel_window);
  if (!v6)
  {
    __break(1u);
    return;
  }
  double v7 = v6;
  id v8 = objc_msgSend(self, sel_activeToolPickerForWindow_, v6);

  if (v8)
  {
    type metadata accessor for NSObject(0, (unint64_t *)&lazy cache variable for type metadata for PKToolPicker);
    id v9 = a1;
    char v10 = static NSObject.== infix(_:_:)();

    if (v10)
    {
      id v11 = InlineDrawingCanvasElementController.activeToolPicker()();
      if (v11)
      {
        id v12 = v11;
        objc_msgSend(v11, sel_addObserver_, v2);
        InlineDrawingCanvasElementController.updateToolPickerUI()();
LABEL_9:
      }
    }
  }
}

id specialized InlineDrawingCanvasElementController.toolPickerControllerWindowScene(_:)(SEL *a1)
{
  id v3 = (id)MEMORY[0x210550400](v1 + OBJC_IVAR____TtC8PaperKit36InlineDrawingCanvasElementController_delegate);
  if (v3)
  {
    specialized InlineDrawingTiledTextView.inlineDrawingCanvasElementControllerCurrentAttachment(_:)();
    id v5 = v4;
    swift_unknownObjectRelease();
    if (v5)
    {
      id v6 = objc_msgSend(v5, sel_window);
      id v3 = [v6 *a1];
    }
    else
    {
      return 0;
    }
  }
  return v3;
}

id specialized InlineDrawingCanvasElementController.toolPickerControllerViewControllerForPresentingUI(_:)()
{
  id v1 = (id)MEMORY[0x210550400](v0 + OBJC_IVAR____TtC8PaperKit36InlineDrawingCanvasElementController_delegate);
  if (v1)
  {
    specialized InlineDrawingTiledTextView.inlineDrawingCanvasElementControllerCurrentAttachment(_:)();
    id v3 = v2;
    swift_unknownObjectRelease();
    if (v3)
    {
      id v4 = objc_msgSend(v3, sel_window);
      id v1 = objc_msgSend(v4, sel_rootViewController);
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t compatibilityInitializeAvailabilityCheck()
{
  return _initializeAvailabilityCheck(1);
}

uint64_t __isPlatformVersionAtLeast(uint64_t a1, int a2, int a3, int a4)
{
  if (qword_2676E8F50 == -1)
  {
    if (qword_2676E8F58) {
      return _availability_version_check();
    }
  }
  else
  {
    dispatch_once_f(&qword_2676E8F50, 0, (dispatch_function_t)initializeAvailabilityCheck);
    if (qword_2676E8F58) {
      return _availability_version_check();
    }
  }
  if (qword_2676E8F48 == -1)
  {
    BOOL v8 = _MergedGlobals < a2;
    if (_MergedGlobals > a2) {
      return 1;
    }
  }
  else
  {
    dispatch_once_f(&qword_2676E8F48, 0, (dispatch_function_t)compatibilityInitializeAvailabilityCheck);
    BOOL v8 = _MergedGlobals < a2;
    if (_MergedGlobals > a2) {
      return 1;
    }
  }
  if (v8) {
    return 0;
  }
  if (dword_2676E8F3C > a3) {
    return 1;
  }
  return dword_2676E8F3C >= a3 && dword_2676E8F40 >= a4;
}

uint64_t initializeAvailabilityCheck()
{
  return _initializeAvailabilityCheck(0);
}

uint64_t _initializeAvailabilityCheck(uint64_t result)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v1 = qword_2676E8F58;
  if (qword_2676E8F58) {
    BOOL v2 = result == 0;
  }
  else {
    BOOL v2 = 0;
  }
  if (!v2)
  {
    if (MEMORY[0x263EF8368])
    {
      uint64_t v1 = MEMORY[0x270FA5398];
      qword_2676E8F58 = MEMORY[0x270FA5398];
    }
    if (!v1 || result != 0)
    {
      id result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "kCFAllocatorNull");
      if (result)
      {
        id v4 = *(unsigned __int8 **)result;
        id result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDataCreateWithBytesNoCopy");
        if (result)
        {
          id v5 = (uint64_t (*)(void))result;
          unint64_t v6 = (unint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateWithData");
          id result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateFromXMLData");
          if (v6 | result)
          {
            double v7 = (uint64_t (*)(void, uint64_t, void, void))result;
            id result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringCreateWithCStringNoCopy");
            if (result)
            {
              BOOL v8 = (uint64_t (*)(void, const char *, uint64_t, unsigned __int8 *))result;
              id result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDictionaryGetValue");
              if (result)
              {
                id v9 = (uint64_t (*)(uint64_t, uint64_t))result;
                id result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFGetTypeID");
                if (result)
                {
                  char v10 = (uint64_t (*)(uint64_t))result;
                  id result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetTypeID");
                  if (result)
                  {
                    id v11 = (uint64_t (*)(void))result;
                    id result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetCString");
                    uint64_t v28 = (unsigned int (*)(uint64_t, char *, uint64_t, uint64_t))result;
                    if (result)
                    {
                      id result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFRelease");
                      if (result)
                      {
                        id v12 = (FILE *)result;
                        id result = (uint64_t)fopen("/System/Library/CoreServices/SystemVersion.plist", "r");
                        if (result)
                        {
                          double v13 = (FILE *)result;
                          uint64_t v27 = v12;
                          fseek((FILE *)result, 0, 2);
                          uint64_t v14 = MEMORY[0x21054F7B0](v13);
                          if (v14 < 0)
                          {
                            CGFloat v16 = 0;
                          }
                          else
                          {
                            size_t v15 = v14;
                            rewind(v13);
                            CGFloat v16 = malloc(v15);
                            if (v16)
                            {
                              CGRect v26 = v16;
                              if (fread(v16, 1uLL, v15, v13) == v15)
                              {
                                uint64_t v17 = v5(0);
                                if (v17)
                                {
                                  uint64_t v18 = v17;
                                  uint64_t v19 = v13;
                                  if (v6) {
                                    uint64_t v20 = ((uint64_t (*)(void, uint64_t, void, void, void))v6)(0, v17, 0, 0, 0);
                                  }
                                  else {
                                    uint64_t v20 = v7(0, v17, 0, 0);
                                  }
                                  uint64_t v21 = v20;
                                  if (v20)
                                  {
                                    uint64_t v22 = v8(0, "ProductVersion", 1536, v4);
                                    if (v22)
                                    {
                                      uint64_t v23 = v22;
                                      uint64_t v24 = v9(v21, v22);
                                      ((void (*)(uint64_t))v27)(v23);
                                      if (v24)
                                      {
                                        uint64_t v25 = v10(v24);
                                        if (v25 == v11())
                                        {
                                          if (v28(v24, v29, 32, 134217984)) {
                                            sscanf(v29, "%d.%d.%d", &_MergedGlobals, &dword_2676E8F3C, &dword_2676E8F40);
                                          }
                                        }
                                      }
                                    }
                                    ((void (*)(uint64_t))v27)(v21);
                                    uint64_t v19 = v13;
                                  }
                                  ((void (*)(uint64_t))v27)(v18);
                                }
                                else
                                {
                                  uint64_t v19 = v13;
                                }
                                CGFloat v16 = v26;
                              }
                              else
                              {
                                CGFloat v16 = v26;
                                uint64_t v19 = v13;
                              }
                              goto LABEL_41;
                            }
                          }
                          uint64_t v19 = v13;
LABEL_41:
                          free(v16);
                          return fclose(v19);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t __getMUImageReaderClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[PPKPDFThumbnailsCollectionViewBase configureCell:withPage:indexPath:](v0);
}

uint64_t __getPXDisplayAssetViewClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getPXFileBackedUIMediaProviderClass_block_invoke_cold_1(v0);
}

uint64_t __getPXFileBackedUIMediaProviderClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getPXFileBackedAssetClass_block_invoke_cold_1(v0);
}

uint64_t __getPXFileBackedAssetClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getVKCImageAnalyzerClass_block_invoke_cold_1(v0);
}

uint64_t __getVKCImageAnalyzerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getVKCImageAnalysisInteractionClass_block_invoke_cold_1(v0);
}

uint64_t __getVKCImageAnalysisInteractionClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getVKCImageAnalyzerRequestClass_block_invoke_cold_1(v0);
}

uint64_t __getVKCImageAnalyzerRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[PPKGPInProcessMagicPaperViewController _updateTelemetryWithImagesCount:shapesCount:signaturesCount:strokesCount:invocation:](v0);
}

void __getGPAppleConnectTokenProviderClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getGPInProcessMagicPaperViewControllerClass_block_invoke_cold_1(v0);
}

void __getGPInProcessMagicPaperViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getGPRecipeClass_block_invoke_cold_1(v0);
}

void __getGPRecipeClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getGPDrawOnImageRecipeClass_block_invoke_cold_1(v0);
}

void __getGPDrawOnImageRecipeClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getGPMagicPaperStateClass_block_invoke_cold_1(v0);
}

void __getGPMagicPaperStateClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getGPPromptElementClass_block_invoke_cold_1(v0);
}

void __getGPPromptElementClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getGPGenerationRecipeDataClass_block_invoke_cold_1(v0);
}

void __getGPGenerationRecipeDataClass_block_invoke_cold_1()
{
}

uint64_t NSNotFound.getter()
{
  return MEMORY[0x270EEDAC8]();
}

uint64_t dispatch thunk of JSONDecoder.decode<A>(_:from:)()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t JSONDecoder.init()()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t type metadata accessor for JSONDecoder()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t dispatch thunk of JSONEncoder.encode<A>(_:)()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t JSONEncoder.init()()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t type metadata accessor for JSONEncoder()
{
  return MEMORY[0x270EEDF38]();
}

NSCharacterSet __swiftcall CharacterSet._bridgeToObjectiveC()()
{
  return (NSCharacterSet)MEMORY[0x270EEE158]();
}

uint64_t static CharacterSet.punctuationCharacters.getter()
{
  return MEMORY[0x270EEE170]();
}

uint64_t static CharacterSet.whitespacesAndNewlines.getter()
{
  return MEMORY[0x270EEE188]();
}

uint64_t CharacterSet.inverted.getter()
{
  return MEMORY[0x270EEE208]();
}

uint64_t type metadata accessor for CharacterSet()
{
  return MEMORY[0x270EEE258]();
}

uint64_t static Notification._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EEE378]();
}

uint64_t Notification.object.getter()
{
  return MEMORY[0x270EEE3A8]();
}

uint64_t Notification.userInfo.getter()
{
  return MEMORY[0x270EEE3B8]();
}

uint64_t type metadata accessor for Notification()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t __DataStorage.init(bytes:length:)()
{
  return MEMORY[0x270EEE628]();
}

uint64_t __DataStorage._bytes.getter()
{
  return MEMORY[0x270EEE638]();
}

uint64_t __DataStorage._length.getter()
{
  return MEMORY[0x270EEE658]();
}

uint64_t __DataStorage._offset.getter()
{
  return MEMORY[0x270EEE670]();
}

uint64_t __DataStorage.init(capacity:)()
{
  return MEMORY[0x270EEE680]();
}

uint64_t type metadata accessor for __DataStorage()
{
  return MEMORY[0x270EEE688]();
}

uint64_t AttributeScopes.SwiftUIAttributes.foregroundColor.getter()
{
  return MEMORY[0x270EFEAE8]();
}

uint64_t AttributeScopes.SwiftUIAttributes.font.getter()
{
  return MEMORY[0x270EFEB00]();
}

uint64_t dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)()
{
  return MEMORY[0x270EEEA60]();
}

uint64_t AttributedString.characters.getter()
{
  return MEMORY[0x270EEEA90]();
}

uint64_t type metadata accessor for AttributedString.CharacterView()
{
  return MEMORY[0x270EEEAE8]();
}

uint64_t AttributedString.subscript.setter()
{
  return MEMORY[0x270EEEB18]();
}

uint64_t type metadata accessor for AttributedString.Index()
{
  return MEMORY[0x270EEED18]();
}

uint64_t type metadata accessor for AttributedString()
{
  return MEMORY[0x270EEEDD8]();
}

uint64_t AttributedString.init(_:attributes:)()
{
  return MEMORY[0x270EEEDF0]();
}

uint64_t AttributedString.subscript.modify()
{
  return MEMORY[0x270EEEE18]();
}

Swift::String __swiftcall NSLocalizedString(_:tableName:bundle:value:comment:)(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  uint64_t v5 = MEMORY[0x270EEEEC0](_._countAndFlagsBits, _._object, tableName.value._countAndFlagsBits, tableName.value._object, bundle.super.isa, value._countAndFlagsBits, value._object, comment._countAndFlagsBits);
  result._object = v6;
  result._countAndFlagsBits = v5;
  return result;
}

uint64_t URLResourceValues.contentType.getter()
{
  return MEMORY[0x270FA1638]();
}

uint64_t type metadata accessor for URLResourceValues()
{
  return MEMORY[0x270EEEFF8]();
}

uint64_t AttributeContainer.init()()
{
  return MEMORY[0x270EEF060]();
}

uint64_t type metadata accessor for AttributeContainer()
{
  return MEMORY[0x270EEF070]();
}

uint64_t AttributedSubstring.subscript.setter()
{
  return MEMORY[0x270EEF180]();
}

uint64_t dispatch thunk of PropertyListDecoder.decode<A>(_:from:)()
{
  return MEMORY[0x270EEF238]();
}

uint64_t PropertyListDecoder.init()()
{
  return MEMORY[0x270EEF250]();
}

uint64_t type metadata accessor for PropertyListDecoder()
{
  return MEMORY[0x270EEF268]();
}

uint64_t dispatch thunk of PropertyListEncoder.outputFormat.setter()
{
  return MEMORY[0x270EEF278]();
}

uint64_t dispatch thunk of PropertyListEncoder.encode<A>(_:)()
{
  return MEMORY[0x270EEF288]();
}

uint64_t PropertyListEncoder.init()()
{
  return MEMORY[0x270EEF2A8]();
}

uint64_t type metadata accessor for PropertyListEncoder()
{
  return MEMORY[0x270EEF2B8]();
}

uint64_t _BridgedStoredNSError.code.getter()
{
  return MEMORY[0x270EEF7C8]();
}

uint64_t AttributeDynamicLookup.subscript.getter()
{
  return MEMORY[0x270EFEB28]();
}

uint64_t _convertErrorToNSError(_:)()
{
  return MEMORY[0x270EEF830]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x270EEF840]();
}

uint64_t AttributedStringProtocol.range<A>(of:options:locale:)()
{
  return MEMORY[0x270EEF930]();
}

uint64_t NSFastEnumerationIterator.next()()
{
  return MEMORY[0x270EEFA08]();
}

uint64_t type metadata accessor for NSFastEnumerationIterator()
{
  return MEMORY[0x270EEFA18]();
}

uint64_t URL.pathExtension.getter()
{
  return MEMORY[0x270EEFC48]();
}

uint64_t URL.absoluteString.getter()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t URL.resourceValues(forKeys:)()
{
  return MEMORY[0x270EEFC88]();
}

uint64_t URL.init(fileURLWithPath:)()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t URL.init(dataRepresentation:relativeTo:isAbsolute:)()
{
  return MEMORY[0x270EEFCF8]();
}

uint64_t URL.dataRepresentation.getter()
{
  return MEMORY[0x270EEFD00]();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t URL.init(resolvingBookmarkData:options:relativeTo:bookmarkDataIsStale:)()
{
  return MEMORY[0x270EEFD68]();
}

uint64_t URL.appendingPathComponent(_:)()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t URL.appendingPathExtension(_:)()
{
  return MEMORY[0x270EEFD90]();
}

uint64_t URL.deletingLastPathComponent()()
{
  return MEMORY[0x270EEFDC0]();
}

uint64_t static URL.== infix(_:_:)()
{
  return MEMORY[0x270EEFDF0]();
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EEFE20]();
}

Swift::Bool __swiftcall URL.startAccessingSecurityScopedResource()()
{
  return MEMORY[0x270EEFE38]();
}

uint64_t URL.host.getter()
{
  return MEMORY[0x270EEFE60]();
}

uint64_t URL.path.getter()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t Data.base64EncodedData(options:)()
{
  return MEMORY[0x270EEFF90]();
}

uint64_t Data.init(contentsOf:options:)()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t Data.description.getter()
{
  return MEMORY[0x270EF0020]();
}

uint64_t Data.init(base64Encoded:options:)()
{
  return MEMORY[0x270EF0050]();
}

{
  return MEMORY[0x270EF0060]();
}

uint64_t type metadata accessor for Data.RangeReference()
{
  return MEMORY[0x270EF0070]();
}

uint64_t Data._Representation.append(contentsOf:)()
{
  return MEMORY[0x270EF00B0]();
}

uint64_t Data._Representation.subscript.getter()
{
  return MEMORY[0x270EF00D0]();
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

uint64_t static Data._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x270EF0168]();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF0178]();
}

uint64_t Data.init(from:)()
{
  return MEMORY[0x270EF0180]();
}

{
  return MEMORY[0x270F16E70]();
}

uint64_t Data.hash(into:)()
{
  return MEMORY[0x270EF0190]();
}

uint64_t Data.append(_:)()
{
  return MEMORY[0x270EF01E0]();
}

uint64_t Data.encode(to:)()
{
  return MEMORY[0x270EF0208]();
}

{
  return MEMORY[0x270F16E78]();
}

uint64_t Data.subscript.getter()
{
  return MEMORY[0x270EF02A8]();
}

uint64_t Date.timeIntervalSinceReferenceDate.getter()
{
  return MEMORY[0x270EF02C8]();
}

uint64_t static Date.timeIntervalSinceReferenceDate.getter()
{
  return MEMORY[0x270EF02D8]();
}

uint64_t static Date.distantPast.getter()
{
  return MEMORY[0x270EF0700]();
}

uint64_t static Date.distantFuture.getter()
{
  return MEMORY[0x270EF07A0]();
}

uint64_t Date.timeIntervalSince(_:)()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t Date.addingTimeInterval(_:)()
{
  return MEMORY[0x270EF0898]();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)MEMORY[0x270EF0998]();
}

uint64_t static Date.> infix(_:_:)()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t static Date.< infix(_:_:)()
{
  return MEMORY[0x270EF09B8]();
}

uint64_t Date.init(timeIntervalSinceNow:)()
{
  return MEMORY[0x270EF09D8]();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t static Date.now.getter()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t Date.init()()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t type metadata accessor for Date()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t UUID.init(uuidString:)()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t UUID.uuidString.getter()
{
  return MEMORY[0x270EF0C68]();
}

NSUUID __swiftcall UUID._bridgeToObjectiveC()()
{
  return (NSUUID)MEMORY[0x270EF0C88]();
}

uint64_t static UUID.== infix(_:_:)()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t static UUID._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t UUID.init(uuid:)()
{
  return MEMORY[0x270EF0CE0]();
}

uint64_t UUID.uuid.getter()
{
  return MEMORY[0x270EF0CF0]();
}

uint64_t UUID.init()()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t type metadata accessor for UUID()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t Locale.identifier.getter()
{
  return MEMORY[0x270EF0D80]();
}

uint64_t static Locale.preferredLanguages.getter()
{
  return MEMORY[0x270EF0ED0]();
}

uint64_t static Locale._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF0F40]();
}

uint64_t static Locale.current.getter()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t type metadata accessor for Locale()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t IndexSet.init(integersIn:)()
{
  return MEMORY[0x270EF1460]();
}

uint64_t IndexSet.last.getter()
{
  return MEMORY[0x270EF14B0]();
}

uint64_t IndexSet.first.getter()
{
  return MEMORY[0x270EF14C0]();
}

Swift::tuple_inserted_Bool_memberAfterInsert_Int __swiftcall IndexSet.insert(_:)(Swift::Int a1)
{
  char v1 = MEMORY[0x270EF14D8](a1);
  result.memberAfterInsert = v2;
  result.inserted = v1;
  return result;
}

uint64_t IndexSet.init(integer:)()
{
  return MEMORY[0x270EF14F8]();
}

uint64_t IndexSet.isEmpty.getter()
{
  return MEMORY[0x270EF1508]();
}

uint64_t IndexSet.init()()
{
  return MEMORY[0x270EF1538]();
}

uint64_t type metadata accessor for IndexSet()
{
  return MEMORY[0x270EF1550]();
}

NSIndexPath __swiftcall IndexPath._bridgeToObjectiveC()()
{
  return (NSIndexPath)MEMORY[0x270EF16E0]();
}

uint64_t static IndexPath._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1700]();
}

uint64_t IndexPath.row.getter()
{
  return MEMORY[0x270F816F8]();
}

uint64_t type metadata accessor for IndexPath()
{
  return MEMORY[0x270EF1738]();
}

uint64_t static Selector.== infix(_:_:)()
{
  return MEMORY[0x270FA1158]();
}

uint64_t Selector.init(_:)()
{
  return MEMORY[0x270FA1168]();
}

uint64_t CalculateScrubberView.init(scrubber:isCompact:isUsingPopoverPresentationController:)()
{
  return MEMORY[0x270F134B8]();
}

uint64_t type metadata accessor for CalculateScrubberView()
{
  return MEMORY[0x270F134C0]();
}

uint64_t CalculateGraphExpression.expression.getter()
{
  return MEMORY[0x270F134C8]();
}

uint64_t dispatch thunk of CalculateGraphExpression.effectiveColor.getter()
{
  return MEMORY[0x270F134D0]();
}

uint64_t dispatch thunk of CalculateGraphExpression.id.getter()
{
  return MEMORY[0x270F134D8]();
}

uint64_t dispatch thunk of CalculateGraphExpression.color.getter()
{
  return MEMORY[0x270F134E0]();
}

uint64_t dispatch thunk of CalculateGraphExpression.color.setter()
{
  return MEMORY[0x270F134E8]();
}

uint64_t type metadata accessor for CalculateGraphExpression()
{
  return MEMORY[0x270F134F0]();
}

uint64_t CalculateGraphExpression.init(_:color:)()
{
  return MEMORY[0x270F134F8]();
}

uint64_t CalculateExpressionTypesetView.init(expression:result:showResult:)()
{
  return MEMORY[0x270F13500]();
}

uint64_t type metadata accessor for CalculateExpressionTypesetView()
{
  return MEMORY[0x270F13508]();
}

uint64_t CalculateExpressionTypesetImage(expression:result:showResult:fontSize:)()
{
  return MEMORY[0x270F13510]();
}

uint64_t dispatch thunk of CalculateGraph.isSelected.setter()
{
  return MEMORY[0x270F13518]();
}

uint64_t dispatch thunk of CalculateGraph.xAxisBounds.getter()
{
  return MEMORY[0x270F13520]();
}

uint64_t dispatch thunk of CalculateGraph.yAxisBounds.getter()
{
  return MEMORY[0x270F13528]();
}

uint64_t CalculateGraph.init(graphExpressions:xAxisBounds:yAxisBounds:animation:isSelected:)()
{
  return MEMORY[0x270F13530]();
}

uint64_t dispatch thunk of CalculateGraph.graphExpressions.getter()
{
  return MEMORY[0x270F13538]();
}

uint64_t dispatch thunk of CalculateGraph.graphExpressions.setter()
{
  return MEMORY[0x270F13540]();
}

uint64_t type metadata accessor for CalculateGraph()
{
  return MEMORY[0x270F13550]();
}

uint64_t CalculateScrubber.init(formattedValue:)()
{
  return MEMORY[0x270F13558]();
}

uint64_t CalculateScrubber.didScrub.setter()
{
  return MEMORY[0x270F13560]();
}

uint64_t type metadata accessor for CalculateScrubber()
{
  return MEMORY[0x270F13568]();
}

uint64_t CalculateGraphView.init(graph:)()
{
  return MEMORY[0x270F13570]();
}

uint64_t type metadata accessor for CalculateGraphView()
{
  return MEMORY[0x270F13578]();
}

uint64_t withObservationTracking<A>(_:onChange:)()
{
  return MEMORY[0x270FA11C0]();
}

uint64_t ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)()
{
  return MEMORY[0x270FA11F8]();
}

uint64_t ObservationRegistrar.access<A, B>(_:keyPath:)()
{
  return MEMORY[0x270FA1208]();
}

uint64_t ObservationRegistrar.didSet<A, B>(_:keyPath:)()
{
  return MEMORY[0x270FA1220]();
}

uint64_t ObservationRegistrar.willSet<A, B>(_:keyPath:)()
{
  return MEMORY[0x270FA1228]();
}

uint64_t ObservationRegistrar.init()()
{
  return MEMORY[0x270FA1238]();
}

uint64_t type metadata accessor for ObservationRegistrar()
{
  return MEMORY[0x270FA1250]();
}

uint64_t type metadata accessor for CGPathFillRule()
{
  return MEMORY[0x270EE57F8]();
}

NSNumber __swiftcall CGFloat._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x270EF17B0]();
}

uint64_t static CGFloat._forceBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x270EF17B8]();
}

uint64_t static CGFloat._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x270EF17D0]();
}

uint64_t static CGFloat._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF17E0]();
}

uint64_t isFeatureEnabled(_:)()
{
  return MEMORY[0x270F28690]();
}

uint64_t static _CFObject.== infix(_:_:)()
{
  return MEMORY[0x270FA06B8]();
}

uint64_t _CFObject.hash(into:)()
{
  return MEMORY[0x270FA06C8]();
}

uint64_t _CFObject.hashValue.getter()
{
  return MEMORY[0x270FA06D8]();
}

uint64_t FBKSDonation.init(featureDomain:bundleID:prefillQuestions:originalAnnotatedContent:generatedAnnotatedContent:extraContent:modelVersion:diagnostics:auxiliaryMetrics:isHighPriority:)()
{
  return MEMORY[0x270F287E0]();
}

uint64_t type metadata accessor for FBKSDonation()
{
  return MEMORY[0x270F28810]();
}

uint64_t FBKSEvaluation.Action.description.getter()
{
  return MEMORY[0x270F28840]();
}

uint64_t FBKSEvaluation.Action.rawValue.getter()
{
  return MEMORY[0x270F28848]();
}

uint64_t type metadata accessor for FBKSEvaluation.Action()
{
  return MEMORY[0x270F28850]();
}

uint64_t type metadata accessor for FBKSEvaluation.Subject()
{
  return MEMORY[0x270F288A8]();
}

uint64_t type metadata accessor for FBKSInteraction.FeatureDomain()
{
  return MEMORY[0x270F28900]();
}

uint64_t type metadata accessor for FBKSInteraction.StructuredValue()
{
  return MEMORY[0x270F28930]();
}

uint64_t FBKSInteraction.StructuredValue.init(_:)()
{
  return MEMORY[0x270F28938]();
}

uint64_t FBKSInteraction.AnnotatedContent.init(payload:displayName:description:fileName:group:iconType:additionalInfo:)()
{
  return MEMORY[0x270F28988]();
}

uint64_t type metadata accessor for FBKSInteraction.AnnotatedContent.IconType()
{
  return MEMORY[0x270F289A8]();
}

uint64_t type metadata accessor for FBKSInteraction.AnnotatedContent()
{
  return MEMORY[0x270F289D8]();
}

uint64_t type metadata accessor for FBKSInteraction.Content()
{
  return MEMORY[0x270F28A20]();
}

uint64_t type metadata accessor for GenerativeModelsAvailability.Availability.RestrictedInfo()
{
  return MEMORY[0x270F2F8B0]();
}

uint64_t type metadata accessor for GenerativeModelsAvailability.Availability.UnavailableInfo()
{
  return MEMORY[0x270F2F910]();
}

uint64_t type metadata accessor for GenerativeModelsAvailability.Availability()
{
  return MEMORY[0x270F2F948]();
}

uint64_t GenerativeModelsAvailability.Parameters.init(useCaseIdentifier:)()
{
  return MEMORY[0x270F2F950]();
}

uint64_t type metadata accessor for GenerativeModelsAvailability.Parameters()
{
  return MEMORY[0x270F2F990]();
}

uint64_t GenerativeModelsAvailability.availability.getter()
{
  return MEMORY[0x270F2F9A8]();
}

uint64_t GenerativeModelsAvailability.ChangeSequence.makeAsyncIterator()()
{
  return MEMORY[0x270F2F9C8]();
}

uint64_t type metadata accessor for GenerativeModelsAvailability.ChangeSequence.Iterator()
{
  return MEMORY[0x270F2F9D0]();
}

uint64_t type metadata accessor for GenerativeModelsAvailability.ChangeSequence()
{
  return MEMORY[0x270F2F9D8]();
}

Swift::Bool __swiftcall GenerativeModelsAvailability.shouldShowEnrollmentScreen()()
{
  return MEMORY[0x270F2FA50]();
}

uint64_t GenerativeModelsAvailability.changes.getter()
{
  return MEMORY[0x270F2FA78]();
}

uint64_t static GenerativeModelsAvailability.current(parameters:)()
{
  return MEMORY[0x270F2FA88]();
}

uint64_t type metadata accessor for GenerativeModelsAvailability()
{
  return MEMORY[0x270F2FA98]();
}

uint64_t UnknownStorage.traverse<A>(visitor:)()
{
  return MEMORY[0x270F44A18]();
}

uint64_t UnknownStorage.init()()
{
  return MEMORY[0x270F44A20]();
}

uint64_t type metadata accessor for UnknownStorage()
{
  return MEMORY[0x270F44A28]();
}

uint64_t BinaryDecodingOptions.init()()
{
  return MEMORY[0x270F44AA8]();
}

uint64_t type metadata accessor for BinaryDecodingOptions()
{
  return MEMORY[0x270F44AB0]();
}

uint64_t dispatch thunk of Decoder.nextFieldNumber()()
{
  return MEMORY[0x270F44B10]();
}

uint64_t dispatch thunk of Decoder.decodeRepeatedEnumField<A>(value:)()
{
  return MEMORY[0x270F44B30]();
}

uint64_t dispatch thunk of Decoder.decodeRepeatedDoubleField(value:)()
{
  return MEMORY[0x270F44BB8]();
}

uint64_t Message.init(serializedData:extensions:partial:options:)()
{
  return MEMORY[0x270F44CA0]();
}

uint64_t Message.serializedData(partial:)()
{
  return MEMORY[0x270F44CA8]();
}

uint64_t dispatch thunk of Visitor.visitPackedEnumField<A>(value:fieldNumber:)()
{
  return MEMORY[0x270F44D20]();
}

uint64_t dispatch thunk of Visitor.visitPackedDoubleField(value:fieldNumber:)()
{
  return MEMORY[0x270F44D40]();
}

uint64_t type metadata accessor for _NameMap.NameDescription()
{
  return MEMORY[0x270F44E10]();
}

uint64_t _NameMap.init(dictionaryLiteral:)()
{
  return MEMORY[0x270F44E18]();
}

uint64_t type metadata accessor for _NameMap()
{
  return MEMORY[0x270F44E28]();
}

uint64_t UTType.identifier.getter()
{
  return MEMORY[0x270FA16A8]();
}

uint64_t static UTType.utf8PlainText.getter()
{
  return MEMORY[0x270FA1728]();
}

uint64_t UTType.init(filenameExtension:conformingTo:)()
{
  return MEMORY[0x270FA1750]();
}

uint64_t static UTType._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270FA17A0]();
}

uint64_t static UTType.pdf.getter()
{
  return MEMORY[0x270FA17B8]();
}

uint64_t static UTType.png.getter()
{
  return MEMORY[0x270FA17C0]();
}

uint64_t static UTType.url.getter()
{
  return MEMORY[0x270FA17D8]();
}

uint64_t static UTType.heic.getter()
{
  return MEMORY[0x270FA1808]();
}

uint64_t static UTType.heif.getter()
{
  return MEMORY[0x270FA1810]();
}

uint64_t static UTType.jpeg.getter()
{
  return MEMORY[0x270FA1828]();
}

uint64_t static UTType.image.getter()
{
  return MEMORY[0x270FA1868]();
}

uint64_t UTType.conforms(to:)()
{
  return MEMORY[0x270FA18E0]();
}

uint64_t static UTType.plainText.getter()
{
  return MEMORY[0x270FA1930]();
}

uint64_t type metadata accessor for UTType()
{
  return MEMORY[0x270FA1938]();
}

uint64_t UTType.init(_:)()
{
  return MEMORY[0x270FA1948]();
}

uint64_t EnrollmentView.init(useCaseIdentifier:options:)()
{
  return MEMORY[0x270F2EDE0]();
}

uint64_t EnrollmentViewOptions.init(onDismissal:)()
{
  return MEMORY[0x270F2EDF0]();
}

uint64_t type metadata accessor for EnrollmentViewOptions()
{
  return MEMORY[0x270F2EDF8]();
}

uint64_t os_log(_:dso:log:_:_:)()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t Logger.init(subsystem:category:)()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t static _UIKitNumericRawRepresentable.- infix(_:_:)()
{
  return MEMORY[0x270F81750]();
}

uint64_t type metadata accessor for UIPointerShape()
{
  return MEMORY[0x270F81928]();
}

uint64_t UIMutableTraits.userInterfaceStyle.setter()
{
  return MEMORY[0x270F819F8]();
}

uint64_t type metadata accessor for UIPointerEffect.TintMode()
{
  return MEMORY[0x270F81A70]();
}

uint64_t type metadata accessor for UIPointerEffect()
{
  return MEMORY[0x270F81A78]();
}

uint64_t type metadata accessor for UITraitOverrides()
{
  return MEMORY[0x270F81B08]();
}

uint64_t type metadata accessor for UITraitUserInterfaceStyle()
{
  return MEMORY[0x270F81D20]();
}

uint64_t type metadata accessor for UITraitHorizontalSizeClass()
{
  return MEMORY[0x270F81EF0]();
}

uint64_t UIIndirectScribbleInteraction.__allocating_init(delegate:)()
{
  return MEMORY[0x270F820E8]();
}

uint64_t UIIndirectScribbleInteraction.init(delegate:)()
{
  return MEMORY[0x270F820F0]();
}

uint64_t type metadata accessor for UIIndirectScribbleInteraction()
{
  return MEMORY[0x270F820F8]();
}

uint64_t type metadata accessor for UIConfigurationTextAttributesTransformer()
{
  return MEMORY[0x270F823E0]();
}

uint64_t UIConfigurationTextAttributesTransformer.init(_:)()
{
  return MEMORY[0x270F823F8]();
}

uint64_t Tip.invalidate(reason:)()
{
  return MEMORY[0x270F05B40]();
}

uint64_t Tip.statusUpdates.getter()
{
  return MEMORY[0x270F05B48]();
}

uint64_t Tip.shouldDisplayUpdates.getter()
{
  return MEMORY[0x270F05B50]();
}

uint64_t Tip.id.getter()
{
  return MEMORY[0x270F05B58]();
}

uint64_t Tip.actions.getter()
{
  return MEMORY[0x270F05B80]();
}

uint64_t TipUIPopoverViewController.popoverPresentationController.getter()
{
  return MEMORY[0x270F05B98]();
}

uint64_t type metadata accessor for TipUIPopoverViewController()
{
  return MEMORY[0x270F05BA8]();
}

uint64_t TipUIPopoverViewController.__allocating_init(_:sourceItem:actionHandler:)()
{
  return MEMORY[0x270F05BB0]();
}

uint64_t static Tips.OptionsBuilder.buildOptional(_:)()
{
  return MEMORY[0x270F05C18]();
}

uint64_t static Tips.OptionsBuilder.buildExpression<A>(_:)()
{
  return MEMORY[0x270F05C30]();
}

uint64_t static Tips.OptionsBuilder.buildFinalResult<A>(_:)()
{
  return MEMORY[0x270F05C38]();
}

uint64_t static Tips.OptionsBuilder.buildPartialBlock<A>(first:)()
{
  return MEMORY[0x270F05C48]();
}

uint64_t static Tips.resetDatastore()()
{
  return MEMORY[0x270F05C50]();
}

uint64_t type metadata accessor for Tips.MaxDisplayCount()
{
  return MEMORY[0x270F05C58]();
}

uint64_t Tips.MaxDisplayCount.init(_:)()
{
  return MEMORY[0x270F05C60]();
}

uint64_t type metadata accessor for Tips.InvalidationReason()
{
  return MEMORY[0x270F05C88]();
}

uint64_t static Tips.ConfigurationOption.DisplayFrequency.system.getter()
{
  return MEMORY[0x270F05CA8]();
}

uint64_t static Tips.ConfigurationOption.DisplayFrequency.immediate.getter()
{
  return MEMORY[0x270F05CB0]();
}

uint64_t type metadata accessor for Tips.ConfigurationOption.DisplayFrequency()
{
  return MEMORY[0x270F05CB8]();
}

uint64_t static Tips.ConfigurationOption.displayFrequency(_:)()
{
  return MEMORY[0x270F05CC0]();
}

uint64_t static Tips.ConfigurationOption.DatastoreLocation.applicationDefault.getter()
{
  return MEMORY[0x270F05CC8]();
}

uint64_t type metadata accessor for Tips.ConfigurationOption.DatastoreLocation()
{
  return MEMORY[0x270F05CD8]();
}

uint64_t static Tips.ConfigurationOption.datastoreLocation(_:)()
{
  return MEMORY[0x270F05CE0]();
}

uint64_t type metadata accessor for Tips.ConfigurationOption()
{
  return MEMORY[0x270F05CE8]();
}

uint64_t type metadata accessor for Tips.Status()
{
  return MEMORY[0x270F05D60]();
}

uint64_t static Tips.configure(_:)()
{
  return MEMORY[0x270F05D80]();
}

uint64_t dispatch thunk of CustomCombineIdentifierConvertible.combineIdentifier.getter()
{
  return MEMORY[0x270EE3820]();
}

uint64_t CustomCombineIdentifierConvertible<>.combineIdentifier.getter()
{
  return MEMORY[0x270EE3828]();
}

uint64_t dispatch thunk of Subscriber.receive(subscription:)()
{
  return MEMORY[0x270EE3AE8]();
}

uint64_t type metadata accessor for AnyPublisher()
{
  return MEMORY[0x270EE3B60]();
}

uint64_t AnyPublisher.init<A>(_:)()
{
  return MEMORY[0x270EE3B68]();
}

uint64_t type metadata accessor for AnySubscriber()
{
  return MEMORY[0x270EE3B80]();
}

uint64_t AnyCancellable.store(in:)()
{
  return MEMORY[0x270EE3B98]();
}

uint64_t type metadata accessor for AnyCancellable()
{
  return MEMORY[0x270EE3BB0]();
}

uint64_t type metadata accessor for AnySubscriberBox()
{
  return MEMORY[0x270EE3C08]();
}

uint64_t AnySubscriberBox.__allocating_init(_:)()
{
  return MEMORY[0x270EE3C10]();
}

uint64_t static ObservableObject.environmentStore.getter()
{
  return MEMORY[0x270EFEB58]();
}

uint64_t ObservableObject<>.objectWillChange.getter()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t dispatch thunk of AnySubscriberBase.receive(_:)()
{
  return MEMORY[0x270EE3C38]();
}

uint64_t PassthroughSubject.send(completion:)()
{
  return MEMORY[0x270EE3C40]();
}

uint64_t PassthroughSubject.send(_:)()
{
  return MEMORY[0x270EE3C50]();
}

uint64_t PassthroughSubject.__allocating_init()()
{
  return MEMORY[0x270EE3C60]();
}

uint64_t PassthroughSubject.init()()
{
  return MEMORY[0x270EE3C70]();
}

uint64_t type metadata accessor for PassthroughSubject()
{
  return MEMORY[0x270EE3C78]();
}

uint64_t Published.init(initialValue:)()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t Published.projectedValue.getter()
{
  return MEMORY[0x270EE3DB0]();
}

uint64_t static Published.subscript.modify()
{
  return MEMORY[0x270EE3DD0]();
}

uint64_t static Published.subscript.getter()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t static Published.subscript.setter()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t Publisher.eraseToAnyPublisher()()
{
  return MEMORY[0x270EE3E08]();
}

uint64_t Publisher.sink(receiveCompletion:receiveValue:)()
{
  return MEMORY[0x270EE3E98]();
}

uint64_t Publisher.receive<A>(on:options:)()
{
  return MEMORY[0x270EE3F78]();
}

uint64_t Publisher.subscribe<A>(_:)()
{
  return MEMORY[0x270EE3FC8]();
}

uint64_t Publisher<>.sink(receiveValue:)()
{
  return MEMORY[0x270EE4008]();
}

uint64_t Animatable<>.animatableData.modify()
{
  return MEMORY[0x270EFEBA0]();
}

uint64_t static ButtonRole.destructive.getter()
{
  return MEMORY[0x270EFEC68]();
}

uint64_t type metadata accessor for ButtonRole()
{
  return MEMORY[0x270EFEC88]();
}

uint64_t EdgeInsets.init(_all:)()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t ScrollView.init(_:showsIndicators:content:)()
{
  return MEMORY[0x270EFEDF8]();
}

uint64_t ColorPicker<>.init(_:selection:supportsOpacity:)()
{
  return MEMORY[0x270EFEF00]();
}

uint64_t static ColorScheme.== infix(_:_:)()
{
  return MEMORY[0x270EFEF10]();
}

uint64_t type metadata accessor for ColorScheme()
{
  return MEMORY[0x270EFEF30]();
}

uint64_t type metadata accessor for Environment.Content()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)()
{
  return MEMORY[0x270EFF128]();
}

uint64_t _FrameLayout.init(width:height:alignment:)()
{
  return MEMORY[0x270EFF598]();
}

uint64_t AnyShapeStyle.init<A>(_:)()
{
  return MEMORY[0x270EFF5E0]();
}

uint64_t GeometryProxy.size.getter()
{
  return MEMORY[0x270EFF6D0]();
}

uint64_t GeometryProxy.frame<A>(in:)()
{
  return MEMORY[0x270EFF6E8]();
}

uint64_t ImageRenderer.uiImage.getter()
{
  return MEMORY[0x270EFF710]();
}

uint64_t ImageRenderer.scale.setter()
{
  return MEMORY[0x270EFF728]();
}

uint64_t ImageRenderer.init(content:)()
{
  return MEMORY[0x270EFF748]();
}

uint64_t withAnimation<A>(_:_:)()
{
  return MEMORY[0x270EFF940]();
}

uint64_t GeometryReader.init(content:)()
{
  return MEMORY[0x270EFFA08]();
}

uint64_t type metadata accessor for GeometryReader()
{
  return MEMORY[0x270EFFA10]();
}

uint64_t ObservedObject.init(wrappedValue:)()
{
  return MEMORY[0x270EFFB80]();
}

uint64_t ObservedObject.projectedValue.getter()
{
  return MEMORY[0x270EFFB88]();
}

uint64_t ObservedObject.Wrapper.subscript.getter()
{
  return MEMORY[0x270EFFBA0]();
}

uint64_t ViewDimensions.subscript.getter()
{
  return MEMORY[0x270EFFD60]();
}

uint64_t type metadata accessor for DynamicTypeSize()
{
  return MEMORY[0x270EFFEE0]();
}

uint64_t type metadata accessor for LiftHoverEffect()
{
  return MEMORY[0x270F00060]();
}

uint64_t ModifiedContent<>.accessibilityValue<A>(_:)()
{
  return MEMORY[0x270F00100]();
}

uint64_t type metadata accessor for ModifiedContent()
{
  return MEMORY[0x270F001A8]();
}

uint64_t PlainButtonStyle.init()()
{
  return MEMORY[0x270F004D0]();
}

uint64_t type metadata accessor for PlainButtonStyle()
{
  return MEMORY[0x270F004E8]();
}

Swift::Void __swiftcall PresentationMode.dismiss()()
{
}

uint64_t type metadata accessor for PresentationMode()
{
  return MEMORY[0x270F00530]();
}

uint64_t _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)()
{
  return MEMORY[0x270F00688]();
}

uint64_t static ContentShapeKinds.interaction.getter()
{
  return MEMORY[0x270F00720]();
}

uint64_t type metadata accessor for ContentShapeKinds()
{
  return MEMORY[0x270F00738]();
}

uint64_t static CustomHoverEffect<>.lift.getter()
{
  return MEMORY[0x270F007E8]();
}

uint64_t static CustomHoverEffect<>.automatic.getter()
{
  return MEMORY[0x270F007F0]();
}

uint64_t EnvironmentObject.error()()
{
  return MEMORY[0x270F00828]();
}

uint64_t EnvironmentObject.init()()
{
  return MEMORY[0x270F00840]();
}

uint64_t EnvironmentValues.imageScale.getter()
{
  return MEMORY[0x270F00860]();
}

uint64_t EnvironmentValues.imageScale.setter()
{
  return MEMORY[0x270F00868]();
}

uint64_t EnvironmentValues.colorScheme.getter()
{
  return MEMORY[0x270F008D0]();
}

uint64_t EnvironmentValues.colorScheme.setter()
{
  return MEMORY[0x270F008D8]();
}

uint64_t EnvironmentValues.foregroundColor.getter()
{
  return MEMORY[0x270F00A20]();
}

uint64_t EnvironmentValues.foregroundColor.setter()
{
  return MEMORY[0x270F00A30]();
}

uint64_t EnvironmentValues.presentationMode.getter()
{
  return MEMORY[0x270F00AC0]();
}

uint64_t EnvironmentValues.minimumScaleFactor.getter()
{
  return MEMORY[0x270F00B78]();
}

uint64_t EnvironmentValues.minimumScaleFactor.setter()
{
  return MEMORY[0x270F00B80]();
}

uint64_t EnvironmentValues.font.getter()
{
  return MEMORY[0x270F00D80]();
}

uint64_t EnvironmentValues.font.setter()
{
  return MEMORY[0x270F00D90]();
}

uint64_t EnvironmentValues.tint.getter()
{
  return MEMORY[0x270F00DA8]();
}

uint64_t EnvironmentValues.tint.setter()
{
  return MEMORY[0x270F00DB8]();
}

uint64_t EnvironmentValues.isEnabled.getter()
{
  return MEMORY[0x270F00E50]();
}

uint64_t EnvironmentValues.isEnabled.setter()
{
  return MEMORY[0x270F00E68]();
}

uint64_t EnvironmentValues.init()()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t type metadata accessor for EnvironmentValues()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t EnvironmentValues.subscript.getter()
{
  return MEMORY[0x270F00F10]();
}

uint64_t EnvironmentValues.subscript.setter()
{
  return MEMORY[0x270F00F20]();
}

uint64_t static VerticalAlignment.firstTextBaseline.getter()
{
  return MEMORY[0x270F01038]();
}

uint64_t static VerticalAlignment.center.getter()
{
  return MEMORY[0x270F01070]();
}

uint64_t IconOnlyLabelStyle.init()()
{
  return MEMORY[0x270F01198]();
}

uint64_t type metadata accessor for IconOnlyLabelStyle()
{
  return MEMORY[0x270F011A0]();
}

uint64_t LocalizedStringKey.StringInterpolation.appendInterpolation<A>(_:specifier:)()
{
  return MEMORY[0x270F011F0]();
}

Swift::Void __swiftcall LocalizedStringKey.StringInterpolation.appendInterpolation(_:)(Swift::String a1)
{
}

Swift::Void __swiftcall LocalizedStringKey.StringInterpolation.appendLiteral(_:)(Swift::String a1)
{
}

uint64_t LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)()
{
  return MEMORY[0x270F01248]();
}

uint64_t type metadata accessor for LocalizedStringKey.StringInterpolation()
{
  return MEMORY[0x270F01258]();
}

uint64_t LocalizedStringKey.init(stringLiteral:)()
{
  return MEMORY[0x270F01270]();
}

uint64_t LocalizedStringKey.init(stringInterpolation:)()
{
  return MEMORY[0x270F01280]();
}

uint64_t type metadata accessor for RoundedCornerStyle()
{
  return MEMORY[0x270F01358]();
}

uint64_t static HorizontalAlignment.center.getter()
{
  return MEMORY[0x270F01510]();
}

uint64_t static HorizontalAlignment.leading.getter()
{
  return MEMORY[0x270F01520]();
}

uint64_t dispatch thunk of UIHostingController.sizeThatFits(in:)()
{
  return MEMORY[0x270F01650]();
}

uint64_t UIHostingController.init(coder:rootView:)()
{
  return MEMORY[0x270F01678]();
}

uint64_t UIHostingController.init(rootView:)()
{
  return MEMORY[0x270F016A0]();
}

uint64_t dispatch thunk of UIHostingController.rootView.getter()
{
  return MEMORY[0x270F016B8]();
}

uint64_t UIViewRepresentable.sizeThatFits(_:uiView:context:)()
{
  return MEMORY[0x270F01708]();
}

uint64_t UIViewRepresentable.body.getter()
{
  return MEMORY[0x270F01778]();
}

uint64_t _ConditionalContent<>.init(storage:)()
{
  return MEMORY[0x270F01800]();
}

uint64_t type metadata accessor for AutomaticHoverEffect()
{
  return MEMORY[0x270F01838]();
}

uint64_t type metadata accessor for GlobalCoordinateSpace()
{
  return MEMORY[0x270F01B78]();
}

uint64_t static PresentationAdaptation.popover.getter()
{
  return MEMORY[0x270F01DB8]();
}

uint64_t type metadata accessor for PresentationAdaptation()
{
  return MEMORY[0x270F01DC0]();
}

uint64_t static CoordinateSpaceProtocol<>.global.getter()
{
  return MEMORY[0x270F01F98]();
}

uint64_t type metadata accessor for PopoverAttachmentAnchor()
{
  return MEMORY[0x270F02078]();
}

uint64_t _GeometryActionModifier.init(value:action:)()
{
  return MEMORY[0x270F020D0]();
}

uint64_t type metadata accessor for _GeometryActionModifier()
{
  return MEMORY[0x270F020D8]();
}

uint64_t type metadata accessor for ButtonStyleConfiguration.Label()
{
  return MEMORY[0x270F020E8]();
}

uint64_t ButtonStyleConfiguration.label.getter()
{
  return MEMORY[0x270F020F0]();
}

uint64_t ToggleStyleConfiguration.isOn.modify()
{
  return MEMORY[0x270F021F0]();
}

uint64_t ToggleStyleConfiguration.isOn.getter()
{
  return MEMORY[0x270F021F8]();
}

uint64_t type metadata accessor for ToggleStyleConfiguration()
{
  return MEMORY[0x270F02218]();
}

uint64_t static AccessibilityChildBehavior.contain.getter()
{
  return MEMORY[0x270F02390]();
}

uint64_t type metadata accessor for AccessibilityChildBehavior()
{
  return MEMORY[0x270F023A0]();
}

uint64_t UIViewRepresentableContext.coordinator.getter()
{
  return MEMORY[0x270F02418]();
}

uint64_t UIViewControllerRepresentable.sizeThatFits(_:uiViewController:context:)()
{
  return MEMORY[0x270F026C8]();
}

uint64_t UIViewControllerRepresentable.body.getter()
{
  return MEMORY[0x270F02700]();
}

uint64_t UIViewControllerRepresentableContext.coordinator.getter()
{
  return MEMORY[0x270F02988]();
}

uint64_t static Log.runtimeIssuesLog.getter()
{
  return MEMORY[0x270F029E0]();
}

uint64_t static Axis.Set.vertical.getter()
{
  return MEMORY[0x270F02A00]();
}

uint64_t static Edge.Set.horizontal.getter()
{
  return MEMORY[0x270F02A20]();
}

uint64_t static Edge.Set.all.getter()
{
  return MEMORY[0x270F02A30]();
}

uint64_t static Edge.Set.top.getter()
{
  return MEMORY[0x270F02A38]();
}

uint64_t static Edge.Set.bottom.getter()
{
  return MEMORY[0x270F02A48]();
}

uint64_t static Edge.Set.leading.getter()
{
  return MEMORY[0x270F02A60]();
}

uint64_t static Edge.Set.trailing.getter()
{
  return MEMORY[0x270F02A78]();
}

uint64_t static Edge.Set.vertical.getter()
{
  return MEMORY[0x270F02A90]();
}

uint64_t Edge.Set.init(_:)()
{
  return MEMORY[0x270F02A98]();
}

uint64_t static Font.body.getter()
{
  return MEMORY[0x270F02B48]();
}

uint64_t type metadata accessor for Font.Design()
{
  return MEMORY[0x270F02BA8]();
}

uint64_t static Font.Weight.bold.getter()
{
  return MEMORY[0x270F02BC0]();
}

uint64_t static Font.system(size:weight:design:)()
{
  return MEMORY[0x270F02C40]();
}

uint64_t static Font.caption.getter()
{
  return MEMORY[0x270F02CD0]();
}

uint64_t Menu.init(content:label:)()
{
  return MEMORY[0x270F02DF8]();
}

Swift::Void __swiftcall Path.move(to:)(CGPoint to)
{
  MEMORY[0x270F02E88]((__n128)__PAIR128__(v1, *(unint64_t *)&to.x), (__n128)__PAIR128__(v2, *(unint64_t *)&to.y));
}

Swift::Void __swiftcall Path.addLine(to:)(CGPoint to)
{
  MEMORY[0x270F02EA8]((__n128)__PAIR128__(v1, *(unint64_t *)&to.x), (__n128)__PAIR128__(v2, *(unint64_t *)&to.y));
}

uint64_t Path.init(_:)()
{
  return MEMORY[0x270F02F00]();
}

{
  return MEMORY[0x270F02F08]();
}

uint64_t Text.fontWeight(_:)()
{
  return MEMORY[0x270F02F28]();
}

uint64_t Text.foregroundColor(_:)()
{
  return MEMORY[0x270F03008]();
}

uint64_t Text.font(_:)()
{
  return MEMORY[0x270F030A8]();
}

uint64_t Text.init(_:tableName:bundle:comment:)()
{
  return MEMORY[0x270F03228]();
}

uint64_t Text.init(_:)()
{
  return MEMORY[0x270F03238]();
}

uint64_t Text.init<A>(_:)()
{
  return MEMORY[0x270F03250]();
}

uint64_t View.labelStyle<A>(_:)()
{
  return MEMORY[0x270F03388]();
}

uint64_t View.buttonStyle<A>(_:)()
{
  return MEMORY[0x270F03438]();
}

{
  return MEMORY[0x270F03448]();
}

uint64_t View.hoverEffect<A>(_:isEnabled:)()
{
  return MEMORY[0x270F034B0]();
}

uint64_t View.popoverCore<A>(isPresented:attachmentAnchor:arrowEdges:isDetachable:content:)()
{
  return MEMORY[0x270F03500]();
}

uint64_t View.toggleStyle<A>(_:)()
{
  return MEMORY[0x270F03548]();
}

uint64_t View.onTapGesture(count:perform:)()
{
  return MEMORY[0x270F035E0]();
}

uint64_t static View._viewListCount(inputs:)()
{
  return MEMORY[0x270F036C0]();
}

uint64_t View.dynamicTypeSize(_:)()
{
  return MEMORY[0x270F03788]();
}

uint64_t View.accessibilityLabel(_:)()
{
  return MEMORY[0x270F03998]();
}

uint64_t View.accessibilityLabel<A>(_:)()
{
  return MEMORY[0x270F039B0]();
}

uint64_t View.allowsSecureDrawing()()
{
  return MEMORY[0x270F03B10]();
}

uint64_t View.accessibilityElement(children:)()
{
  return MEMORY[0x270F03BC0]();
}

uint64_t View.presentationCompactAdaptation(_:)()
{
  return MEMORY[0x270F03E70]();
}

uint64_t View.frame(width:height:alignment:)()
{
  return MEMORY[0x270F03FE8]();
}

uint64_t View.modifier<A>(_:)()
{
  return MEMORY[0x270F04170]();
}

uint64_t View.onAppear(perform:)()
{
  return MEMORY[0x270F04178]();
}

uint64_t View.onChange<A>(of:initial:_:)()
{
  return MEMORY[0x270F041A0]();
}

uint64_t View.menuOrder(_:)()
{
  return MEMORY[0x270F04288]();
}

uint64_t Color.init(cgColor:)()
{
  return MEMORY[0x270F04360]();
}

uint64_t Color.cgColor.getter()
{
  return MEMORY[0x270F04368]();
}

uint64_t Color.init(uiColor:)()
{
  return MEMORY[0x270F04378]();
}

uint64_t static Color.accentColor.getter()
{
  return MEMORY[0x270F04388]();
}

uint64_t type metadata accessor for Color.RGBColorSpace()
{
  return MEMORY[0x270F043A8]();
}

uint64_t static Color.red.getter()
{
  return MEMORY[0x270F043E8]();
}

uint64_t static Color.gray.getter()
{
  return MEMORY[0x270F04410]();
}

uint64_t static Color.black.getter()
{
  return MEMORY[0x270F04460]();
}

uint64_t static Color.clear.getter()
{
  return MEMORY[0x270F04478]();
}

uint64_t static Color.white.getter()
{
  return MEMORY[0x270F04498]();
}

uint64_t Color.opacity(_:)()
{
  return MEMORY[0x270F044E8]();
}

uint64_t Color.resolve(in:)()
{
  return MEMORY[0x270F04508]();
}

uint64_t Color.Resolved.cgColor.getter()
{
  return MEMORY[0x270F04510]();
}

uint64_t static Color.secondary.getter()
{
  return MEMORY[0x270F04558]();
}

uint64_t Color.init(_:red:green:blue:opacity:)()
{
  return MEMORY[0x270F04570]();
}

uint64_t Color.init(_:white:opacity:)()
{
  return MEMORY[0x270F04580]();
}

uint64_t Color.init(_:)()
{
  return MEMORY[0x270F045A8]();
}

uint64_t Image.init(systemName:)()
{
  return MEMORY[0x270F04650]();
}

uint64_t Image.renderingMode(_:)()
{
  return MEMORY[0x270F046A8]();
}

uint64_t Image.init(_internalSystemName:)()
{
  return MEMORY[0x270F046C8]();
}

uint64_t type metadata accessor for Image.TemplateRenderingMode()
{
  return MEMORY[0x270F046E8]();
}

uint64_t type metadata accessor for Image.Scale()
{
  return MEMORY[0x270F04708]();
}

uint64_t Image.init(_:bundle:)()
{
  return MEMORY[0x270F04738]();
}

uint64_t Label.init(title:icon:)()
{
  return MEMORY[0x270F04748]();
}

uint64_t Label<>.init<A>(_:systemImage:)()
{
  return MEMORY[0x270F04770]();
}

uint64_t State.init(wrappedValue:)()
{
  return MEMORY[0x270F04818]();
}

uint64_t State.wrappedValue.getter()
{
  return MEMORY[0x270F04820]();
}

uint64_t State.wrappedValue.setter()
{
  return MEMORY[0x270F04830]();
}

uint64_t State.projectedValue.getter()
{
  return MEMORY[0x270F04848]();
}

uint64_t static Anchor.Source<A>.bounds.getter()
{
  return MEMORY[0x270F04870]();
}

uint64_t Button.init(role:action:label:)()
{
  return MEMORY[0x270F04890]();
}

uint64_t Button.init(action:label:)()
{
  return MEMORY[0x270F048B0]();
}

uint64_t Button<>.init(_:action:)()
{
  return MEMORY[0x270F048E0]();
}

uint64_t Button<>.init<A>(_:action:)()
{
  return MEMORY[0x270F048E8]();
}

uint64_t type metadata accessor for Button()
{
  return MEMORY[0x270F04900]();
}

uint64_t Toggle<>.init(_:isOn:)()
{
  return MEMORY[0x270F04AD0]();
}

uint64_t Binding.wrappedValue.getter()
{
  return MEMORY[0x270F04B30]();
}

uint64_t Binding.wrappedValue.setter()
{
  return MEMORY[0x270F04B48]();
}

uint64_t Binding.subscript.getter()
{
  return MEMORY[0x270F04B58]();
}

uint64_t Binding.projectedValue.getter()
{
  return MEMORY[0x270F04B68]();
}

uint64_t Binding.init(get:set:)()
{
  return MEMORY[0x270F04B80]();
}

uint64_t Binding<A>.startIndex.getter()
{
  return MEMORY[0x270F04BA8]();
}

uint64_t Binding<A>.endIndex.getter()
{
  return MEMORY[0x270F04BB0]();
}

uint64_t Binding<A>.formIndex(after:)()
{
  return MEMORY[0x270F04BC0]();
}

uint64_t Binding<A>.subscript.getter()
{
  return MEMORY[0x270F04BD8]();
}

uint64_t type metadata accessor for Binding()
{
  return MEMORY[0x270F04BF8]();
}

uint64_t type metadata accessor for Capsule()
{
  return MEMORY[0x270F04C18]();
}

{
  return MEMORY[0x270F17EE0]();
}

uint64_t Divider.init()()
{
  return MEMORY[0x270F04C20]();
}

uint64_t type metadata accessor for Divider()
{
  return MEMORY[0x270F04C30]();
}

uint64_t ForEach<>.init(_:id:content:)()
{
  return MEMORY[0x270F04C90]();
}

uint64_t ForEach<>.init(_:content:)()
{
  return MEMORY[0x270F04CA8]();
}

uint64_t Bindable.wrappedValue.getter()
{
  return MEMORY[0x270F04DF0]();
}

uint64_t Bindable.projectedValue.getter()
{
  return MEMORY[0x270F04E10]();
}

uint64_t Bindable<A>.init(wrappedValue:)()
{
  return MEMORY[0x270F04E20]();
}

uint64_t Bindable<A>.subscript.getter()
{
  return MEMORY[0x270F04E28]();
}

uint64_t type metadata accessor for Bindable()
{
  return MEMORY[0x270F04E38]();
}

uint64_t static Material.regular.getter()
{
  return MEMORY[0x270F04F98]();
}

uint64_t type metadata accessor for Material()
{
  return MEMORY[0x270F04FB0]();
}

uint64_t static Alignment.center.getter()
{
  return MEMORY[0x270F05078]();
}

uint64_t static Alignment.trailing.getter()
{
  return MEMORY[0x270F05098]();
}

uint64_t static Animation.easeIn(duration:)()
{
  return MEMORY[0x270F050F8]();
}

uint64_t static Animation.easeInOut(duration:)()
{
  return MEMORY[0x270F05160]();
}

uint64_t static MenuOrder.fixed.getter()
{
  return MEMORY[0x270F05210]();
}

uint64_t type metadata accessor for MenuOrder()
{
  return MEMORY[0x270F05220]();
}

uint64_t static UnitPoint.center.getter()
{
  return MEMORY[0x270F053C8]();
}

uint64_t type metadata accessor for DispatchTimeInterval()
{
  return MEMORY[0x270FA0970]();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t type metadata accessor for DispatchQoS.QoSClass()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t static DispatchQoS.userInitiated.getter()
{
  return MEMORY[0x270FA0A00]();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t static DispatchTime.now()()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t type metadata accessor for DispatchTime()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t DispatchWorkItem.init(flags:block:)()
{
  return MEMORY[0x270FA0B60]();
}

uint64_t dispatch thunk of DispatchWorkItem.cancel()()
{
  return MEMORY[0x270FA0B70]();
}

uint64_t type metadata accessor for DispatchWorkItem()
{
  return MEMORY[0x270FA0B98]();
}

uint64_t + infix(_:_:)()
{
  return MEMORY[0x270FA0BB0]();
}

{
  return MEMORY[0x270FA0BC8]();
}

uint64_t dispatch thunk of CalculateExpression.PlainExpression.tokens.getter()
{
  return MEMORY[0x270F13120]();
}

uint64_t CalculateExpression.expression.getter()
{
  return MEMORY[0x270F13130]();
}

uint64_t CalculateExpression.expression.setter()
{
  return MEMORY[0x270F13138]();
}

uint64_t CalculateExpression.isGraphable.getter()
{
  return MEMORY[0x270F13140]();
}

uint64_t CalculateExpression.isLikelyMath.getter()
{
  return MEMORY[0x270F13148]();
}

uint64_t CalculateExpression.referenceCount.getter()
{
  return MEMORY[0x270F13168]();
}

uint64_t CalculateExpression.needsEvaluation.getter()
{
  return MEMORY[0x270F13178]();
}

uint64_t CalculateExpression.graphableVariable.getter()
{
  return MEMORY[0x270F13190]();
}

uint64_t CalculateExpression.graphableVariable.setter()
{
  return MEMORY[0x270F13198]();
}

uint64_t CalculateExpression.graphableVariables.getter()
{
  return MEMORY[0x270F131A0]();
}

uint64_t CalculateExpression.id.getter()
{
  return MEMORY[0x270F131D8]();
}

uint64_t CalculateExpression.accessibilityMathEquationDescription.getter()
{
  return MEMORY[0x270F131E0]();
}

uint64_t type metadata accessor for CalculateExpression.Base()
{
  return MEMORY[0x270F131F0]();
}

uint64_t dispatch thunk of CalculateExpression.Token.isTrigonometric.getter()
{
  return MEMORY[0x270F13210]();
}

uint64_t dispatch thunk of CalculateExpression.Token.text.getter()
{
  return MEMORY[0x270F13218]();
}

uint64_t CalculateExpression.Token.type.getter()
{
  return MEMORY[0x270F13220]();
}

uint64_t dispatch thunk of CalculateExpression.Token.errors.getter()
{
  return MEMORY[0x270F13228]();
}

uint64_t CalculateExpression.error.getter()
{
  return MEMORY[0x270F13230]();
}

uint64_t CalculateExpression.plain.getter()
{
  return MEMORY[0x270F13238]();
}

uint64_t CalculateExpression.format.getter()
{
  return MEMORY[0x270F13248]();
}

uint64_t CalculateExpression.result.getter()
{
  return MEMORY[0x270F13268]();
}

uint64_t CalculateExpression.options.getter()
{
  return MEMORY[0x270F13278]();
}

uint64_t CalculateExpression.TokenType.isConstant.getter()
{
  return MEMORY[0x270F133F8]();
}

uint64_t static CalculateExpression.TokenType.== infix(_:_:)()
{
  return MEMORY[0x270F13418]();
}

uint64_t type metadata accessor for CalculateExpression.TokenType()
{
  return MEMORY[0x270F13420]();
}

uint64_t type metadata accessor for CalculateExpression()
{
  return MEMORY[0x270F13428]();
}

uint64_t CalculateExpression.init(_:options:base:id:)()
{
  return MEMORY[0x270F13430]();
}

uint64_t CalculateDocument.init(expressions:options:)()
{
  return MEMORY[0x270F13438]();
}

uint64_t dispatch thunk of CalculateDocument.expressions.getter()
{
  return MEMORY[0x270F13440]();
}

uint64_t dispatch thunk of CalculateDocument.expressions.setter()
{
  return MEMORY[0x270F13448]();
}

uint64_t dispatch thunk of CalculateDocument.declaredSymbols.getter()
{
  return MEMORY[0x270F13450]();
}

uint64_t type metadata accessor for CalculateDocument()
{
  return MEMORY[0x270F13458]();
}

uint64_t StocksKitCurrencyCache.Provider.logo.getter()
{
  return MEMORY[0x270F13580]();
}

uint64_t StocksKitCurrencyCache.Provider.name.getter()
{
  return MEMORY[0x270F13588]();
}

uint64_t type metadata accessor for StocksKitCurrencyCache.Provider()
{
  return MEMORY[0x270F13590]();
}

uint64_t static StocksKitCurrencyCache.shared.getter()
{
  return MEMORY[0x270F134A0]();
}

uint64_t type metadata accessor for StocksKitCurrencyCache()
{
  return MEMORY[0x270F134A8]();
}

uint64_t AnyCRValue.visitReferences(_:)()
{
  return MEMORY[0x270F16E80]();
}

uint64_t AnyCRValue.copy(renamingReferences:)()
{
  return MEMORY[0x270F16E88]();
}

uint64_t type metadata accessor for AnyCRValue()
{
  return MEMORY[0x270F16E90]();
}

uint64_t CRRegister.init(wrappedValue:)()
{
  return MEMORY[0x270F16E98]();
}

uint64_t CRRegister.wrappedValue.modify()
{
  return MEMORY[0x270F16EA0]();
}

uint64_t CRRegister.wrappedValue.getter()
{
  return MEMORY[0x270F16EA8]();
}

uint64_t CRRegister.wrappedValue.setter()
{
  return MEMORY[0x270F16EB0]();
}

uint64_t CRRegister.projectedValue.getter()
{
  return MEMORY[0x270F16EB8]();
}

uint64_t CRRegister.projectedValue.setter()
{
  return MEMORY[0x270F16EC0]();
}

uint64_t CRRegister.copy(renamingReferences:)()
{
  return MEMORY[0x270F16EC8]();
}

uint64_t CRRegister.apply(_:)()
{
  return MEMORY[0x270F16ED0]();
}

uint64_t CRRegister.value.getter()
{
  return MEMORY[0x270F16ED8]();
}

uint64_t CRRegister.value.setter()
{
  return MEMORY[0x270F16EE0]();
}

uint64_t CRRegister.timestamp.getter()
{
  return MEMORY[0x270F16EE8]();
}

uint64_t type metadata accessor for CRRegister()
{
  return MEMORY[0x270F16EF8]();
}

uint64_t CRRegister.init<A>(_:)()
{
  return MEMORY[0x270F16F00]();
}

uint64_t CRRegister.init(_:)()
{
  return MEMORY[0x270F16F08]();
}

uint64_t CRSequence.makeIterator()()
{
  return MEMORY[0x270F16F10]();
}

uint64_t CRSequence.count.getter()
{
  return MEMORY[0x270F16F18]();
}

uint64_t CRSequence.filter(_:)()
{
  return MEMORY[0x270F16F20]();
}

uint64_t CRSequence.Iterator.next()()
{
  return MEMORY[0x270F16F28]();
}

uint64_t CRSequence.hasDelta(from:)()
{
  return MEMORY[0x270F16F30]();
}

uint64_t type metadata accessor for CRSequence()
{
  return MEMORY[0x270F16F38]();
}

uint64_t CRSequence.init<A>(_:)()
{
  return MEMORY[0x270F16F40]();
}

Swift::Bool __swiftcall CRStruct_1.needToFinalizeTimestamps()()
{
  return MEMORY[0x270F16F70]();
}

uint64_t CRStruct_1.init(from:)()
{
  return MEMORY[0x270F16F88]();
}

uint64_t CRStruct_1.encode(to:)()
{
  return MEMORY[0x270F16FB0]();
}

Swift::Bool __swiftcall CRStruct_2.needToFinalizeTimestamps()()
{
  return MEMORY[0x270F16FF8]();
}

uint64_t CRStruct_2.init(from:)()
{
  return MEMORY[0x270F17010]();
}

uint64_t CRStruct_2.encode(to:)()
{
  return MEMORY[0x270F17038]();
}

Swift::Bool __swiftcall CRStruct_3.needToFinalizeTimestamps()()
{
  return MEMORY[0x270F17080]();
}

uint64_t CRStruct_3.init(from:)()
{
  return MEMORY[0x270F17098]();
}

uint64_t CRStruct_3.encode(to:)()
{
  return MEMORY[0x270F170C0]();
}

Swift::Bool __swiftcall CRStruct_4.needToFinalizeTimestamps()()
{
  return MEMORY[0x270F17108]();
}

uint64_t CRStruct_4.init(from:)()
{
  return MEMORY[0x270F17120]();
}

uint64_t CRStruct_4.encode(to:)()
{
  return MEMORY[0x270F17148]();
}

uint64_t CRStruct_4<>.encode(to:)()
{
  return MEMORY[0x270F17168]();
}

Swift::Bool __swiftcall CRStruct_5.needToFinalizeTimestamps()()
{
  return MEMORY[0x270F17198]();
}

uint64_t CRStruct_5.init(from:)()
{
  return MEMORY[0x270F171B0]();
}

uint64_t CRStruct_5.encode(to:)()
{
  return MEMORY[0x270F171D8]();
}

Swift::Bool __swiftcall CRStruct_7.needToFinalizeTimestamps()()
{
  return MEMORY[0x270F172A8]();
}

uint64_t CRStruct_7.init(from:)()
{
  return MEMORY[0x270F172C0]();
}

uint64_t CRStruct_7.encode(to:)()
{
  return MEMORY[0x270F172E8]();
}

Swift::Bool __swiftcall CRStruct_8.needToFinalizeTimestamps()()
{
  return MEMORY[0x270F17330]();
}

uint64_t CRStruct_8.init(from:)()
{
  return MEMORY[0x270F17348]();
}

uint64_t CRStruct_8.encode(to:)()
{
  return MEMORY[0x270F17370]();
}

Swift::Bool __swiftcall CRStruct_9.needToFinalizeTimestamps()()
{
  return MEMORY[0x270F173B8]();
}

uint64_t CRStruct_9.init(from:)()
{
  return MEMORY[0x270F173C0]();
}

uint64_t CRStruct_9.encode(to:)()
{
  return MEMORY[0x270F173E8]();
}

uint64_t CRDictionary.makeIterator()()
{
  return MEMORY[0x270F17428]();
}

uint64_t CRDictionary.Iterator.next()()
{
  return MEMORY[0x270F17450]();
}

uint64_t CRDictionary.init()()
{
  return MEMORY[0x270F17458]();
}

uint64_t type metadata accessor for CRDictionary()
{
  return MEMORY[0x270F17460]();
}

uint64_t CRDictionary.subscript.modify()
{
  return MEMORY[0x270F17468]();
}

uint64_t CRDictionary.subscript.getter()
{
  return MEMORY[0x270F17470]();
}

uint64_t static CRExtensible.== infix(_:_:)()
{
  return MEMORY[0x270F17480]();
}

uint64_t CRExtensible.rawValue.getter()
{
  return MEMORY[0x270F17488]();
}

uint64_t CROrderedSet.makeIterator()()
{
  return MEMORY[0x270F17490]();
}

uint64_t CROrderedSet.visitReferences(_:)()
{
  return MEMORY[0x270F17498]();
}

uint64_t CROrderedSet.map<A>(_:)()
{
  return MEMORY[0x270F174A8]();
}

uint64_t CROrderedSet.copy(renamingReferences:)()
{
  return MEMORY[0x270F174B0]();
}

Swift::Void __swiftcall CROrderedSet.move(from:to:)(Swift::Int from, Swift::Int to)
{
}

uint64_t CROrderedSet.count.getter()
{
  return MEMORY[0x270F174C0]();
}

uint64_t CROrderedSet.append<A>(contentsOf:)()
{
  return MEMORY[0x270F174D0]();
}

uint64_t CROrderedSet.append(_:)()
{
  return MEMORY[0x270F174D8]();
}

uint64_t CROrderedSet.filter(_:)()
{
  return MEMORY[0x270F174E0]();
}

uint64_t CROrderedSet.insert<A>(contentsOf:at:)()
{
  return MEMORY[0x270F174E8]();
}

uint64_t CROrderedSet.insert(_:at:)()
{
  return MEMORY[0x270F174F0]();
}

Swift::Void __swiftcall CROrderedSet.remove(at:)(Swift::Int at)
{
}

uint64_t CROrderedSet.remove(_:)()
{
  return MEMORY[0x270F17500]();
}

uint64_t CROrderedSet.Iterator.next()()
{
  return MEMORY[0x270F17508]();
}

uint64_t CROrderedSet.contains(_:)()
{
  return MEMORY[0x270F17510]();
}

uint64_t CROrderedSet.init()()
{
  return MEMORY[0x270F17528]();
}

uint64_t type metadata accessor for CROrderedSet()
{
  return MEMORY[0x270F17530]();
}

uint64_t CROrderedSet.init<A>(_:)()
{
  return MEMORY[0x270F17538]();
}

uint64_t CROrderedSet.subscript.getter()
{
  return MEMORY[0x270F17548]();
}

uint64_t CROrderedSet.subscript.setter()
{
  return MEMORY[0x270F17550]();
}

uint64_t static WeakTagged_3.== infix(_:_:)()
{
  return MEMORY[0x270F17558]();
}

uint64_t WeakTagged_3.id.getter()
{
  return MEMORY[0x270F17560]();
}

uint64_t WeakTagged_3.tagged2.getter()
{
  return MEMORY[0x270F17570]();
}

uint64_t WeakTagged_3.tagged3.getter()
{
  return MEMORY[0x270F17578]();
}

uint64_t type metadata accessor for WeakTagged_3()
{
  return MEMORY[0x270F17580]();
}

uint64_t WeakTagged_3.init(_:id:)()
{
  return MEMORY[0x270F17588]();
}

uint64_t WeakTagged_3.subscript.modify()
{
  return MEMORY[0x270F17590]();
}

uint64_t WeakTagged_3.subscript.getter()
{
  return MEMORY[0x270F17598]();
}

uint64_t WeakTagged_3.init(_:)()
{
  return MEMORY[0x270F175A0]();
}

uint64_t WeakTagged_9.id.getter()
{
  return MEMORY[0x270F175A8]();
}

uint64_t WeakTagged_9.tag.getter()
{
  return MEMORY[0x270F175B0]();
}

uint64_t WeakTagged_9.tagged2.getter()
{
  return MEMORY[0x270F175C0]();
}

uint64_t WeakTagged_9.tagged3.getter()
{
  return MEMORY[0x270F175C8]();
}

uint64_t WeakTagged_9.tagged4.getter()
{
  return MEMORY[0x270F175D0]();
}

uint64_t WeakTagged_9.tagged5.getter()
{
  return MEMORY[0x270F175D8]();
}

uint64_t WeakTagged_9.tagged6.getter()
{
  return MEMORY[0x270F175E0]();
}

uint64_t WeakTagged_9.tagged7.getter()
{
  return MEMORY[0x270F175E8]();
}

uint64_t WeakTagged_9.identity.getter()
{
  return MEMORY[0x270F17600]();
}

uint64_t WeakTagged_9.init(_:id:)()
{
  return MEMORY[0x270F17608]();
}

{
  return MEMORY[0x270F17610]();
}

uint64_t WeakTagged_9.subscript.modify()
{
  return MEMORY[0x270F17618]();
}

uint64_t WeakTagged_9.subscript.getter()
{
  return MEMORY[0x270F17620]();
}

{
  return MEMORY[0x270F17628]();
}

uint64_t type metadata accessor for CRCodingError()
{
  return MEMORY[0x270F17630]();
}

uint64_t CRStableAsset.url.getter()
{
  return MEMORY[0x270F17658]();
}

uint64_t CRStableAsset.init(url:extension:)()
{
  return MEMORY[0x270F17660]();
}

uint64_t type metadata accessor for CRStableAsset()
{
  return MEMORY[0x270F17668]();
}

Swift::Void __swiftcall CRStruct_Base.willEncode()()
{
}

Swift::Void __swiftcall CRStruct_Base.didMerge()()
{
}

uint64_t CRValueStruct.init(from:)()
{
  return MEMORY[0x270F17690]();
}

uint64_t CRValueStruct.encode(to:)()
{
  return MEMORY[0x270F17698]();
}

uint64_t TaggedValue_1.tagged1.getter()
{
  return MEMORY[0x270F176A0]();
}

uint64_t TaggedValue_1.init(_:)()
{
  return MEMORY[0x270F176A8]();
}

uint64_t TaggedValue_2.tagged1.getter()
{
  return MEMORY[0x270F176B0]();
}

uint64_t TaggedValue_2.tagged2.getter()
{
  return MEMORY[0x270F176B8]();
}

uint64_t TaggedValue_2.init(_:)()
{
  return MEMORY[0x270F176C0]();
}

{
  return MEMORY[0x270F176C8]();
}

uint64_t TaggedValue_9.taggedEnum.getter()
{
  return MEMORY[0x270F176D0]();
}

uint64_t TaggedValue_9.taggedEnum.setter()
{
  return MEMORY[0x270F176D8]();
}

uint64_t TaggedValue_9.tagged1.getter()
{
  return MEMORY[0x270F176E0]();
}

uint64_t TaggedValue_9.tagged2.getter()
{
  return MEMORY[0x270F176E8]();
}

uint64_t TaggedValue_9.tagged3.getter()
{
  return MEMORY[0x270F176F0]();
}

uint64_t TaggedValue_9.tagged4.getter()
{
  return MEMORY[0x270F176F8]();
}

uint64_t TaggedValue_9.tagged5.getter()
{
  return MEMORY[0x270F17700]();
}

uint64_t TaggedValue_9.tagged6.getter()
{
  return MEMORY[0x270F17708]();
}

uint64_t TaggedValue_9.tagged7.getter()
{
  return MEMORY[0x270F17710]();
}

uint64_t TaggedValue_9.tagged8.getter()
{
  return MEMORY[0x270F17718]();
}

uint64_t TaggedValue_9.tagged9.getter()
{
  return MEMORY[0x270F17720]();
}

uint64_t TaggedValue_9.init(_:)()
{
  return MEMORY[0x270F17728]();
}

{
  return MEMORY[0x270F17730]();
}

{
  return MEMORY[0x270F17738]();
}

{
  return MEMORY[0x270F17740]();
}

{
  return MEMORY[0x270F17748]();
}

{
  return MEMORY[0x270F17750]();
}

{
  return MEMORY[0x270F17758]();
}

{
  return MEMORY[0x270F17760]();
}

{
  return MEMORY[0x270F17768]();
}

uint64_t CRAssetManager.encryptionDelegate.getter()
{
  return MEMORY[0x270F17770]();
}

uint64_t SharedTagged_2.tagged1.getter()
{
  return MEMORY[0x270F177A0]();
}

uint64_t SharedTagged_2.tagged2.getter()
{
  return MEMORY[0x270F177A8]();
}

uint64_t SharedTagged_2.identity.getter()
{
  return MEMORY[0x270F177B0]();
}

uint64_t SharedTagged_2.init(_:id:)()
{
  return MEMORY[0x270F177B8]();
}

uint64_t SharedTagged_3.id.getter()
{
  return MEMORY[0x270F177C0]();
}

uint64_t SharedTagged_3.any.getter()
{
  return MEMORY[0x270F177D0]();
}

uint64_t SharedTagged_3.tagged2.getter()
{
  return MEMORY[0x270F177E0]();
}

uint64_t SharedTagged_3.init(_:id:)()
{
  return MEMORY[0x270F177F0]();
}

uint64_t SharedTagged_3.subscript.modify()
{
  return MEMORY[0x270F177F8]();
}

uint64_t SharedTagged_3.subscript.getter()
{
  return MEMORY[0x270F17808]();
}

{
  return MEMORY[0x270F17810]();
}

uint64_t SharedTagged_3.init(_:)()
{
  return MEMORY[0x270F17818]();
}

uint64_t SharedTagged_9.id.getter()
{
  return MEMORY[0x270F17820]();
}

uint64_t SharedTagged_9.any.getter()
{
  return MEMORY[0x270F17828]();
}

uint64_t SharedTagged_9.tag.getter()
{
  return MEMORY[0x270F17830]();
}

uint64_t SharedTagged_9.tagged2.getter()
{
  return MEMORY[0x270F17840]();
}

uint64_t SharedTagged_9.tagged3.getter()
{
  return MEMORY[0x270F17848]();
}

uint64_t SharedTagged_9.tagged5.getter()
{
  return MEMORY[0x270F17858]();
}

uint64_t SharedTagged_9.tagged6.getter()
{
  return MEMORY[0x270F17860]();
}

uint64_t SharedTagged_9.tagged7.getter()
{
  return MEMORY[0x270F17868]();
}

uint64_t SharedTagged_9.tagged9.getter()
{
  return MEMORY[0x270F17878]();
}

uint64_t SharedTagged_9.unknown.getter()
{
  return MEMORY[0x270F17880]();
}

uint64_t SharedTagged_9.identity.getter()
{
  return MEMORY[0x270F17888]();
}

uint64_t type metadata accessor for SharedTagged_9()
{
  return MEMORY[0x270F17890]();
}

uint64_t SharedTagged_9.init(_:id:)()
{
  return MEMORY[0x270F17898]();
}

{
  return MEMORY[0x270F178A0]();
}

uint64_t SharedTagged_9.init<A>(_:_:id:)()
{
  return MEMORY[0x270F178A8]();
}

{
  return MEMORY[0x270F178B0]();
}

uint64_t SharedTagged_9.subscript.modify()
{
  return MEMORY[0x270F178B8]();
}

uint64_t SharedTagged_9.subscript.getter()
{
  return MEMORY[0x270F178C0]();
}

{
  return MEMORY[0x270F178C8]();
}

{
  return MEMORY[0x270F178D0]();
}

uint64_t SharedTagged_9.init<A>(_:_:)()
{
  return MEMORY[0x270F178D8]();
}

uint64_t CRMulticastLink.send(_:)()
{
  return MEMORY[0x270F17920]();
}

uint64_t type metadata accessor for CRCodableVersion()
{
  return MEMORY[0x270F17930]();
}

uint64_t static CRDataStoreBundle.read(_:url:fileVersionPolicy:allowedEncodings:allowedAppFormats:)()
{
  return MEMORY[0x270F17938]();
}

uint64_t CRDataStoreBundle.sync(_:finished:)()
{
  return MEMORY[0x270F17940]();
}

uint64_t static CRDataStoreBundle.write(_:model:url:allowedEncodings:allowedAppFormats:)()
{
  return MEMORY[0x270F17950]();
}

uint64_t static CRDataStoreBundle.canRead(url:allowedEncodings:allowedAppFormats:)()
{
  return MEMORY[0x270F17960]();
}

uint64_t CRDataStoreBundle.publisher.getter()
{
  return MEMORY[0x270F17970]();
}

uint64_t type metadata accessor for CRDataStoreBundle()
{
  return MEMORY[0x270F17978]();
}

uint64_t CRDataStoreBundle.__allocating_init(_:sync:at:allowedEncodings:allowedAppFormats:writableAppFormats:)()
{
  return MEMORY[0x270F17980]();
}

uint64_t CRDataStoreBundle.init(_:sync:at:allowedEncodings:allowedAppFormats:writableAppFormats:)()
{
  return MEMORY[0x270F17988]();
}

Swift::Bool __swiftcall CRStruct_10_Final.needToFinalizeTimestamps()()
{
  return MEMORY[0x270F179B8]();
}

uint64_t CRStruct_10_Final.init(from:)()
{
  return MEMORY[0x270F179D0]();
}

uint64_t CRStruct_10_Final.encode(to:)()
{
  return MEMORY[0x270F179F8]();
}

uint64_t type metadata accessor for CapsuleUndoAction()
{
  return MEMORY[0x270F17A18]();
}

uint64_t CRAttributedString.attributedString.getter()
{
  return MEMORY[0x270F17A20]();
}

uint64_t CRAttributedString.Attributes.subscript.getter()
{
  return MEMORY[0x270F17A28]();
}

uint64_t CRAttributedString.Attributes.subscript.setter()
{
  return MEMORY[0x270F17A30]();
}

uint64_t CRAttributedString.Attributes.init()()
{
  return MEMORY[0x270F17A38]();
}

uint64_t CRAttributedString.attributes(at:effectiveRange:)()
{
  return MEMORY[0x270F17A40]();
}

uint64_t CRAttributedString.setAttributes(_:range:)()
{
  return MEMORY[0x270F17A48]();
}

uint64_t CRAttributedString.replaceSubrange(_:with:)()
{
  return MEMORY[0x270F17A50]();
}

uint64_t CRAttributedString.ObservableDifference.edits.getter()
{
  return MEMORY[0x270F17A58]();
}

uint64_t CRAttributedString.Runs.Run.attributes.getter()
{
  return MEMORY[0x270F17A60]();
}

uint64_t CRAttributedString.Runs.Run.subscript.getter()
{
  return MEMORY[0x270F17A68]();
}

uint64_t CRAttributedString.Runs.Run.range.getter()
{
  return MEMORY[0x270F17A70]();
}

uint64_t CRAttributedString.Runs.next()()
{
  return MEMORY[0x270F17A78]();
}

uint64_t CRAttributedString.runs.getter()
{
  return MEMORY[0x270F17A80]();
}

uint64_t CRAttributedString.count.getter()
{
  return MEMORY[0x270F17A88]();
}

uint64_t CRAttributedString.merge(_:)()
{
  return MEMORY[0x270F17A90]();
}

uint64_t CRAttributedString.range(of:)()
{
  return MEMORY[0x270F17A98]();
}

uint64_t CRAttributedString.cursor(range:)()
{
  return MEMORY[0x270F17AA0]();
}

uint64_t CRAttributedString.Substring.attributes.setter()
{
  return MEMORY[0x270F17AA8]();
}

uint64_t CRAttributedString.Substring.subscript.setter()
{
  return MEMORY[0x270F17AB0]();
}

uint64_t CRAttributedString.Substring.runs.getter()
{
  return MEMORY[0x270F17AB8]();
}

uint64_t CRAttributedString.init()()
{
  return MEMORY[0x270F17AC0]();
}

uint64_t type metadata accessor for CRAttributedString()
{
  return MEMORY[0x270F17AC8]();
}

uint64_t CRAttributedString.subscript.modify()
{
  return MEMORY[0x270F17AD0]();
}

uint64_t CRAttributedString.subscript.getter()
{
  return MEMORY[0x270F17AD8]();
}

uint64_t CRAttributedString.init(_:)()
{
  return MEMORY[0x270F17AE0]();
}

{
  return MEMORY[0x270F17AE8]();
}

uint64_t dispatch thunk of EncryptionDelegate.decrypt(_:)()
{
  return MEMORY[0x270F17AF0]();
}

uint64_t static FinalizedTimestamp.== infix(_:_:)()
{
  return MEMORY[0x270F17AF8]();
}

uint64_t FinalizedTimestamp.counter.getter()
{
  return MEMORY[0x270F17B00]();
}

uint64_t FinalizedTimestamp.replica.getter()
{
  return MEMORY[0x270F17B08]();
}

uint64_t FinalizedTimestamp.init(replica:counter:)()
{
  return MEMORY[0x270F17B10]();
}

uint64_t type metadata accessor for FinalizedTimestamp()
{
  return MEMORY[0x270F17B18]();
}

uint64_t static CRAttributeStringKey.loadAttribute(from:)()
{
  return MEMORY[0x270F17B20]();
}

uint64_t CRMulticastSyncManager.isValidMessage(_:)()
{
  return MEMORY[0x270F17B28]();
}

uint64_t CRMulticastSyncManager.sync(_:sendDelta:)()
{
  return MEMORY[0x270F17B30]();
}

uint64_t CRMulticastSyncManager.merge<A>(_:sendDelta:)()
{
  return MEMORY[0x270F17B38]();
}

uint64_t CRMulticastSyncManager.receive(_:)()
{
  return MEMORY[0x270F17B40]();
}

uint64_t CRMulticastSyncManager.setLink(_:)()
{
  return MEMORY[0x270F17B48]();
}

uint64_t CRMulticastSyncManager.updates.getter()
{
  return MEMORY[0x270F17B50]();
}

uint64_t type metadata accessor for CRMulticastSyncManager()
{
  return MEMORY[0x270F17B60]();
}

uint64_t CRMulticastSyncManager.__allocating_init(_:model:appFormat:identifier:catchup:)()
{
  return MEMORY[0x270F17B68]();
}

uint64_t CRCustomFileSyncManager.sync(_:)()
{
  return MEMORY[0x270F17B80]();
}

uint64_t CRCustomFileSyncManager.updates.getter()
{
  return MEMORY[0x270F17B88]();
}

uint64_t CRCustomFileSyncManager.init(_:sync:at:customSync:)()
{
  return MEMORY[0x270F17BA0]();
}

uint64_t type metadata accessor for CRMulticastSyncManagerCatchupBehavior()
{
  return MEMORY[0x270F17BD0]();
}

uint64_t type metadata accessor for CRDataStoreBundleReadFileVersionPolicy()
{
  return MEMORY[0x270F17BD8]();
}

uint64_t Ref.visitReferences(_:)()
{
  return MEMORY[0x270F17BE0]();
}

uint64_t static Ref.== infix(_:_:)()
{
  return MEMORY[0x270F17BE8]();
}

uint64_t Ref.id.getter()
{
  return MEMORY[0x270F17BF0]();
}

uint64_t Ref.init(id:)()
{
  return MEMORY[0x270F17BF8]();
}

{
  return MEMORY[0x270F17C00]();
}

uint64_t Ref.copy(renamingReferences:)()
{
  return MEMORY[0x270F17C08]();
}

uint64_t type metadata accessor for Ref()
{
  return MEMORY[0x270F17C10]();
}

uint64_t Ref.init<A>(_:_:identity:)()
{
  return MEMORY[0x270F17C18]();
}

uint64_t Ref.init<A>(_:_:)()
{
  return MEMORY[0x270F17C20]();
}

uint64_t Ref.init<A>(_:)()
{
  return MEMORY[0x270F17C28]();
}

uint64_t Ref.subscript.modify()
{
  return MEMORY[0x270F17C30]();
}

uint64_t Ref.subscript.getter()
{
  return MEMORY[0x270F17C38]();
}

{
  return MEMORY[0x270F17C48]();
}

{
  return MEMORY[0x270F17C50]();
}

uint64_t Ref.subscript.setter()
{
  return MEMORY[0x270F17C40]();
}

uint64_t CRDT.serializedData(_:version:)()
{
  return MEMORY[0x270F17C60]();
}

uint64_t CRDT.init(serializedData:)()
{
  return MEMORY[0x270F17C68]();
}

uint64_t CRType.observableDifference(from:)()
{
  return MEMORY[0x270F17CB0]();
}

uint64_t CRType.copy(renamingReferences:)()
{
  return MEMORY[0x270F17CB8]();
}

uint64_t CRAsset.assetManager.getter()
{
  return MEMORY[0x270F17D28]();
}

uint64_t CRAsset.visitReferences(_:)()
{
  return MEMORY[0x270F17D30]();
}

uint64_t CRAsset.debugDescription.getter()
{
  return MEMORY[0x270F17D38]();
}

uint64_t static CRAsset.== infix(_:_:)()
{
  return MEMORY[0x270F17D40]();
}

uint64_t CRAsset.init(url:coordinated:assetManager:)()
{
  return MEMORY[0x270F17D48]();
}

uint64_t CRAsset.init(data:assetManager:)()
{
  return MEMORY[0x270F17D50]();
}

uint64_t CRAsset.init(from:)()
{
  return MEMORY[0x270F17D58]();
}

uint64_t CRAsset.read(withAccessor:)()
{
  return MEMORY[0x270F17D60]();
}

uint64_t CRAsset.digest.getter()
{
  return MEMORY[0x270F17D70]();
}

uint64_t CRAsset.encode(to:)()
{
  return MEMORY[0x270F17D78]();
}

uint64_t type metadata accessor for CRAsset()
{
  return MEMORY[0x270F17D80]();
}

uint64_t CRValue<>.init(from:)()
{
  return MEMORY[0x270F17DA0]();
}

uint64_t CRValue<>.encode(to:)()
{
  return MEMORY[0x270F17DA8]();
}

uint64_t Capsule.encapsulate<A>(_:)()
{
  return MEMORY[0x270F17DB0]();
}

uint64_t Capsule.versionUUID.getter()
{
  return MEMORY[0x270F17DB8]();
}

uint64_t Capsule.callAsFunction<A>(_:)()
{
  return MEMORY[0x270F17DC0]();
}

uint64_t Capsule.copyAssetsSync(to:)()
{
  return MEMORY[0x270F17DC8]();
}

uint64_t Capsule.getCachedValue<A>(forKey:recompute:)()
{
  return MEMORY[0x270F17DD0]();
}

uint64_t Capsule.getCachedValue<A>(forKey:)()
{
  return MEMORY[0x270F17DD8]();
}

uint64_t Capsule.setCachedValue<A>(_:forKey:)()
{
  return MEMORY[0x270F17DE0]();
}

uint64_t Capsule.clearCachedValue(forKey:)()
{
  return MEMORY[0x270F17DE8]();
}

uint64_t Capsule.encapsulateTransient<A>(_:)()
{
  return MEMORY[0x270F17DF8]();
}

uint64_t Capsule.actionUndoingDifference(from:)()
{
  return MEMORY[0x270F17E00]();
}

uint64_t Capsule.Ref.import<A, B>(_:from:)()
{
  return MEMORY[0x270F17E08]();
}

uint64_t Capsule.Ref.import<A>(_:)()
{
  return MEMORY[0x270F17E10]();
}

uint64_t Capsule.Ref<>.subscript.modify()
{
  return MEMORY[0x270F17E18]();
}

uint64_t Capsule.Ref<>.subscript.getter()
{
  return MEMORY[0x270F17E20]();
}

uint64_t Capsule.Ref<>.subscript.setter()
{
  return MEMORY[0x270F17E28]();
}

uint64_t Capsule.Ref<>.root.modify()
{
  return MEMORY[0x270F17E30]();
}

uint64_t Capsule.Ref<>.root.getter()
{
  return MEMORY[0x270F17E38]();
}

uint64_t Capsule.Ref<>.root.setter()
{
  return MEMORY[0x270F17E40]();
}

uint64_t Capsule.Ref<>.rootID.getter()
{
  return MEMORY[0x270F17E48]();
}

uint64_t type metadata accessor for Capsule.Ref()
{
  return MEMORY[0x270F17E50]();
}

uint64_t Capsule.Ref.subscript.modify()
{
  return MEMORY[0x270F17E58]();
}

uint64_t Capsule.Ref.subscript.getter()
{
  return MEMORY[0x270F17E60]();
}

uint64_t Capsule.copy()()
{
  return MEMORY[0x270F17E68]();
}

uint64_t Capsule.apply(_:)()
{
  return MEMORY[0x270F17E70]();
}

uint64_t Capsule.merge<A>(_:)()
{
  return MEMORY[0x270F17E78]();
}

uint64_t Capsule.mutate<A>(_:)()
{
  return MEMORY[0x270F17E80]();
}

uint64_t Capsule.version.getter()
{
  return MEMORY[0x270F17E88]();
}

uint64_t Capsule<>.subscript.getter()
{
  return MEMORY[0x270F17E98]();
}

uint64_t Capsule<>.init(serializedData:allowedAppFormats:)()
{
  return MEMORY[0x270F17EA0]();
}

uint64_t Capsule<>.serializedData(_:version:allowedAppFormats:)()
{
  return MEMORY[0x270F17EA8]();
}

uint64_t Capsule<>.init(id:initClosure:)()
{
  return MEMORY[0x270F17EB0]();
}

{
  return MEMORY[0x270F17EB8]();
}

uint64_t Capsule<>.root.getter()
{
  return MEMORY[0x270F17EC0]();
}

uint64_t Capsule<>.rootID.getter()
{
  return MEMORY[0x270F17EC8]();
}

uint64_t Capsule<>.init(_:id:)()
{
  return MEMORY[0x270F17ED0]();
}

{
  return MEMORY[0x270F17ED8]();
}

uint64_t Capsule.subscript.getter()
{
  return MEMORY[0x270F17EE8]();
}

{
  return MEMORY[0x270F17EF0]();
}

uint64_t WeakRef.id.getter()
{
  return MEMORY[0x270F17EF8]();
}

uint64_t WeakRef.init(id:)()
{
  return MEMORY[0x270F17F00]();
}

{
  return MEMORY[0x270F17F08]();
}

uint64_t type metadata accessor for WeakRef()
{
  return MEMORY[0x270F17F10]();
}

uint64_t WeakRef.init<A>(_:)()
{
  return MEMORY[0x270F17F18]();
}

uint64_t WeakRef.subscript.modify()
{
  return MEMORY[0x270F17F20]();
}

uint64_t WeakRef.subscript.getter()
{
  return MEMORY[0x270F17F28]();
}

{
  return MEMORY[0x270F17F30]();
}

uint64_t CRContext.assetManager.getter()
{
  return MEMORY[0x270F17F80]();
}

uint64_t static CRContext.newTransientContext(uniqueAssetManager:encryptionDelegate:)()
{
  return MEMORY[0x270F17F88]();
}

uint64_t static CRContext.uniqueContextUnchecked(for:encryptionDelegate:temporaryDirectory:)()
{
  return MEMORY[0x270F17F90]();
}

uint64_t type metadata accessor for CRContext()
{
  return MEMORY[0x270F17FA0]();
}

uint64_t dispatch thunk of CRDecoder.CRDTContainer.decodeCustomSiblings()()
{
  return MEMORY[0x270F17FD0]();
}

uint64_t dispatch thunk of CRDecoder.crdtContainer()()
{
  return MEMORY[0x270F17FD8]();
}

uint64_t dispatch thunk of CRDecoder.valueContainer()()
{
  return MEMORY[0x270F17FE0]();
}

uint64_t dispatch thunk of CRDecoder.CRValueContainer.decode(_:)()
{
  return MEMORY[0x270F17FE8]();
}

{
  return MEMORY[0x270F17FF0]();
}

{
  return MEMORY[0x270F17FF8]();
}

uint64_t dispatch thunk of CREncoder.CRDTContainer.encodeCustom(_:version:)()
{
  return MEMORY[0x270F18000]();
}

uint64_t dispatch thunk of CREncoder.crdtContainer()()
{
  return MEMORY[0x270F18008]();
}

uint64_t CRKeyPath.description.getter()
{
  return MEMORY[0x270F18018]();
}

uint64_t static CRKeyPath.== infix(_:_:)()
{
  return MEMORY[0x270F18020]();
}

uint64_t CRKeyPath.uuid.getter()
{
  return MEMORY[0x270F18028]();
}

uint64_t static CRKeyPath.unique.getter()
{
  return MEMORY[0x270F18030]();
}

uint64_t CRKeyPath.rawValue.getter()
{
  return MEMORY[0x270F18038]();
}

uint64_t CRKeyPath.init(rawValue:)()
{
  return MEMORY[0x270F18040]();
}

uint64_t type metadata accessor for CRKeyPath()
{
  return MEMORY[0x270F18048]();
}

uint64_t CRKeyPath.init(_:)()
{
  return MEMORY[0x270F18050]();
}

{
  return MEMORY[0x270F18058]();
}

uint64_t CRKeyPath.init<A>(_:)()
{
  return MEMORY[0x270F18060]();
}

uint64_t static CRVersion.== infix(_:_:)()
{
  return MEMORY[0x270F18070]();
}

uint64_t CRVersion.init()()
{
  return MEMORY[0x270F18080]();
}

uint64_t type metadata accessor for CRVersion()
{
  return MEMORY[0x270F18088]();
}

uint64_t CRVersion.subscript.setter()
{
  return MEMORY[0x270F18090]();
}

uint64_t Reference.identity.getter()
{
  return MEMORY[0x270F18098]();
}

uint64_t dispatch thunk of HashFunction.update(bufferPointer:)()
{
  return MEMORY[0x270EEAA78]();
}

uint64_t dispatch thunk of HashFunction.finalize()()
{
  return MEMORY[0x270EEAA80]();
}

uint64_t dispatch thunk of HashFunction.init()()
{
  return MEMORY[0x270EEAA98]();
}

uint64_t type metadata accessor for SHA256Digest()
{
  return MEMORY[0x270EEAAA8]();
}

uint64_t Digest.makeIterator()()
{
  return MEMORY[0x270EEB060]();
}

uint64_t SHA256.finalize()()
{
  return MEMORY[0x270EEB078]();
}

uint64_t SHA256.init()()
{
  return MEMORY[0x270EEB088]();
}

uint64_t type metadata accessor for SHA256()
{
  return MEMORY[0x270EEB090]();
}

uint64_t type metadata accessor for Insecure.MD5()
{
  return MEMORY[0x270EEB0D8]();
}

uint64_t type metadata accessor for Insecure.MD5Digest()
{
  return MEMORY[0x270EEB0F0]();
}

uint64_t static PKLassoTool._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EFA0C0]();
}

uint64_t type metadata accessor for PKLassoTool()
{
  return MEMORY[0x270EFA0C8]();
}

uint64_t PKCustomTool.customIdentifier.getter()
{
  return MEMORY[0x270EFA0D0]();
}

uint64_t PKCustomTool.color.getter()
{
  return MEMORY[0x270EFA0D8]();
}

uint64_t PKCustomTool.weight.getter()
{
  return MEMORY[0x270EFA0E0]();
}

uint64_t type metadata accessor for PKCustomTool()
{
  return MEMORY[0x270EFA0E8]();
}

uint64_t static PKEraserTool._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EFA0F0]();
}

uint64_t type metadata accessor for PKEraserTool()
{
  return MEMORY[0x270EFA0F8]();
}

uint64_t static PKInkingTool.convertColor(_:from:to:)()
{
  return MEMORY[0x270EFA100]();
}

uint64_t static PKInkingTool._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EFA108]();
}

uint64_t PKInkingTool.init(ink:width:)()
{
  return MEMORY[0x270EFA110]();
}

uint64_t PKInkingTool.ink.getter()
{
  return MEMORY[0x270EFA118]();
}

uint64_t type metadata accessor for PKInkingTool.InkType()
{
  return MEMORY[0x270EFA120]();
}

uint64_t type metadata accessor for PKInkingTool()
{
  return MEMORY[0x270EFA128]();
}

uint64_t PKInkingTool.init(_:color:width:)()
{
  return MEMORY[0x270EFA130]();
}

uint64_t PKStrokePath.creationDate.getter()
{
  return MEMORY[0x270EFA138]();
}

uint64_t PKStrokePath.init<A>(controlPoints:creationDate:)()
{
  return MEMORY[0x270EFA140]();
}

PKStrokePath __swiftcall PKStrokePath._bridgeToObjectiveC()()
{
  return (PKStrokePath)MEMORY[0x270EFA148]();
}

uint64_t static PKStrokePath._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EFA150]();
}

uint64_t PKStrokePath.init()()
{
  return MEMORY[0x270EFA158]();
}

uint64_t type metadata accessor for PKStrokePath()
{
  return MEMORY[0x270EFA160]();
}

uint64_t PKStrokePoint.timeOffset.getter()
{
  return MEMORY[0x270EFA168]();
}

uint64_t PKStrokePoint.force.getter()
{
  return MEMORY[0x270EFA170]();
}

uint64_t PKStrokePoint.azimuth.getter()
{
  return MEMORY[0x270EFA178]();
}

uint64_t PKStrokePoint.opacity.getter()
{
  return MEMORY[0x270EFA180]();
}

uint64_t PKStrokePoint.altitude.getter()
{
  return MEMORY[0x270EFA188]();
}

uint64_t PKStrokePoint.init(location:timeOffset:size:opacity:force:azimuth:altitude:)()
{
  return MEMORY[0x270EFA190]();
}

uint64_t PKStrokePoint.location.getter()
{
  return MEMORY[0x270EFA198]();
}

uint64_t type metadata accessor for PKStrokePoint()
{
  return MEMORY[0x270EFA1A0]();
}

uint64_t PKGenerationTool.init()()
{
  return MEMORY[0x270EFA1A8]();
}

uint64_t type metadata accessor for PKGenerationTool()
{
  return MEMORY[0x270EFA1B0]();
}

uint64_t PKHandwritingTool.init()()
{
  return MEMORY[0x270EFA1B8]();
}

uint64_t type metadata accessor for PKHandwritingTool()
{
  return MEMORY[0x270EFA1C0]();
}

PKInk __swiftcall PKInk._bridgeToObjectiveC()()
{
  return (PKInk)MEMORY[0x270EFA1C8]();
}

uint64_t static PKInk._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EFA1D0]();
}

uint64_t PKInk.color.setter()
{
  return MEMORY[0x270EFA1D8]();
}

uint64_t type metadata accessor for PKInk()
{
  return MEMORY[0x270EFA1E0]();
}

uint64_t PKInk.init(_:color:)()
{
  return MEMORY[0x270EFA1E8]();
}

uint64_t PKStroke.renderBounds.getter()
{
  return MEMORY[0x270EFA1F0]();
}

PKStroke __swiftcall PKStroke._bridgeToObjectiveC()()
{
  return (PKStroke)MEMORY[0x270EFA1F8]();
}

uint64_t static PKStroke._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EFA200]();
}

uint64_t PKStroke.init(ink:path:transform:mask:)()
{
  return MEMORY[0x270EFA208]();
}

uint64_t PKStroke.ink.getter()
{
  return MEMORY[0x270EFA210]();
}

uint64_t PKStroke.path.getter()
{
  return MEMORY[0x270EFA218]();
}

uint64_t PKStroke.transform.setter()
{
  return MEMORY[0x270EFA220]();
}

uint64_t type metadata accessor for PKStroke()
{
  return MEMORY[0x270EFA228]();
}

void __swiftcall PKDrawing._bridgeToObjectiveC()(PKDrawing *__return_ptr retstr)
{
}

uint64_t static PKDrawing._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EFA238]();
}

uint64_t PKDrawing.init(data:)()
{
  return MEMORY[0x270EFA240]();
}

uint64_t PKDrawing.bounds.getter()
{
  return MEMORY[0x270EFA248]();
}

uint64_t PKDrawing.init<A>(strokes:)()
{
  return MEMORY[0x270EFA250]();
}

uint64_t PKDrawing.strokes.getter()
{
  return MEMORY[0x270EFA258]();
}

uint64_t PKDrawing.init()()
{
  return MEMORY[0x270EFA260]();
}

uint64_t type metadata accessor for PKDrawing()
{
  return MEMORY[0x270EFA268]();
}

uint64_t Array.init()()
{
  return MEMORY[0x270F9CFC0]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x270EF1818]();
}

uint64_t static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x270EF1830]();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1840]();
}

uint64_t dispatch thunk of Encodable.encode(to:)()
{
  return MEMORY[0x270F9D220]();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return MEMORY[0x270F9D318]();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return MEMORY[0x270F9D320]();
}

uint64_t dispatch thunk of Hashable.hashValue.getter()
{
  return MEMORY[0x270F9D328]();
}

uint64_t dispatch thunk of BidirectionalCollection.formIndex(before:)()
{
  return MEMORY[0x270F9D410]();
}

uint64_t BidirectionalCollection<>.difference<A>(from:)()
{
  return MEMORY[0x270F9D468]();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return MEMORY[0x270F9D478]();
}

uint64_t dispatch thunk of static Comparable.<= infix(_:_:)()
{
  return MEMORY[0x270F9D498]();
}

uint64_t MutableCollection.move(fromOffsets:toOffset:)()
{
  return MEMORY[0x270F053E0]();
}

uint64_t ObjectIdentifier.debugDescription.getter()
{
  return MEMORY[0x270F9D568]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x270F9D598]();
}

Swift::Void __swiftcall String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(Swift::String a1)
{
}

Swift::Void __swiftcall String.LocalizationValue.StringInterpolation.appendLiteral(_:)(Swift::String a1)
{
}

uint64_t String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)()
{
  return MEMORY[0x270EF1928]();
}

uint64_t type metadata accessor for String.LocalizationValue.StringInterpolation()
{
  return MEMORY[0x270EF1938]();
}

uint64_t String.LocalizationValue.init(stringInterpolation:)()
{
  return MEMORY[0x270EF1950]();
}

uint64_t type metadata accessor for String.LocalizationValue()
{
  return MEMORY[0x270EF1958]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x270EF19B0]();
}

uint64_t static String.localizedStringWithFormat(_:_:)()
{
  return MEMORY[0x270EF19B8]();
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

uint64_t String.data(using:allowLossyConversion:)()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t String.init(format:_:)()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t static String.Encoding.utf8.getter()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t type metadata accessor for String.Encoding()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t String.init(localized:table:bundle:locale:comment:)()
{
  return MEMORY[0x270EF1AF8]();
}

uint64_t String.init<A>(describing:)()
{
  return MEMORY[0x270F9D5E0]();
}

Swift::String __swiftcall String.lowercased()()
{
  uint64_t v0 = MEMORY[0x270F9D5F8]();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

Swift::String __swiftcall String.uppercased()()
{
  uint64_t v0 = MEMORY[0x270F9D610]();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t static String._fromSubstring(_:)()
{
  return MEMORY[0x270F9D648]();
}

uint64_t String.replaceSubrange<A>(_:with:)()
{
  return MEMORY[0x270F9D660]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x270F9D708]();
}

uint64_t String.Index.utf16Offset<A>(in:)()
{
  return MEMORY[0x270F9D720]();
}

uint64_t String.count.getter()
{
  return MEMORY[0x270F9D740]();
}

uint64_t String.index(_:offsetBy:limitedBy:)()
{
  return MEMORY[0x270F9D758]();
}

uint64_t String.index(_:offsetBy:)()
{
  return MEMORY[0x270F9D760]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

uint64_t String.init(cString:)()
{
  return MEMORY[0x270F9D7C0]();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x270F9D7E0]();
}

Swift::Int __swiftcall String.UTF16View._foreignCount()()
{
  return MEMORY[0x270F9D830]();
}

uint64_t String.UTF16View._nativeGetOffset(for:)()
{
  return MEMORY[0x270F9D840]();
}

uint64_t String.UTF16View.count.getter()
{
  return MEMORY[0x270F9D850]();
}

Swift::Bool __swiftcall String.hasPrefix(_:)(Swift::String a1)
{
  return MEMORY[0x270F9D878](a1._countAndFlagsBits, a1._object);
}

Swift::String __swiftcall String.init(repeating:count:)(Swift::String repeating, Swift::Int count)
{
  uint64_t v2 = MEMORY[0x270F9D898](repeating._countAndFlagsBits, repeating._object, count);
  result._object = v3;
  result._countAndFlagsBits = v2;
  return result;
}

uint64_t String.subscript.getter()
{
  return MEMORY[0x270F9D8B0]();
}

{
  return MEMORY[0x270F9D8F0]();
}

uint64_t String.init<A>(_:)()
{
  return MEMORY[0x270F9D8D8]();
}

uint64_t dispatch thunk of Sequence.makeIterator()()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t dispatch thunk of Sequence._copyContents(initializing:)()
{
  return MEMORY[0x270F9D900]();
}

uint64_t dispatch thunk of Sequence.underestimatedCount.getter()
{
  return MEMORY[0x270F9D908]();
}

uint64_t dispatch thunk of Sequence._copyToContiguousArray()()
{
  return MEMORY[0x270F9D910]();
}

uint64_t Sequence.reduce<A>(_:_:)()
{
  return MEMORY[0x270F9D9A8]();
}

uint64_t dispatch thunk of RawRepresentable.rawValue.getter()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t RawRepresentable<>.encode(to:)()
{
  return MEMORY[0x270F9DA98]();
}

{
  return MEMORY[0x270F9DAB8]();
}

uint64_t RawRepresentable<>.init(from:)()
{
  return MEMORY[0x270F9DB18]();
}

{
  return MEMORY[0x270F9DB38]();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x270F9DBA0]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x270EF1B88]();
}

uint64_t static Array._forceBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x270EF1B98]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t specialized Array._endMutation()()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t static Array._adoptStorage(_:count:)()
{
  return MEMORY[0x270F9DBC8]();
}

uint64_t Array._checkSubscript(_:wasNativeTypeChecked:)()
{
  return MEMORY[0x270F9DBD0]();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return MEMORY[0x270F9DC20]();
}

Swift::Bool __swiftcall Array._hoistableIsNativeTypeChecked()()
{
  return MEMORY[0x270F9DC30]();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t Array.append(_:)()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t Array.endIndex.getter()
{
  return MEMORY[0x270F9DCA8]();
}

uint64_t Array<A>.copy(renamingReferences:)()
{
  return MEMORY[0x270F180B0]();
}

uint64_t type metadata accessor for Array()
{
  return MEMORY[0x270F9DCD8]();
}

NSNumber __swiftcall Bool._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x270EF1BD8]();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t CheckedContinuation.resume(throwing:)()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t type metadata accessor for CheckedContinuation()
{
  return MEMORY[0x270FA1E28]();
}

uint64_t static MainActor.shared.getter()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t type metadata accessor for MainActor()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t static TaskPriority.background.getter()
{
  return MEMORY[0x270FA1EB0]();
}

uint64_t static TaskPriority.userInitiated.getter()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t TaskPriority.rawValue.getter()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t type metadata accessor for TaskPriority()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t AsyncStream.Continuation.yield(_:)()
{
  return MEMORY[0x270FA1F48]();
}

uint64_t AsyncStream.makeAsyncIterator()()
{
  return MEMORY[0x270FA1F60]();
}

uint64_t type metadata accessor for AsyncStream.Iterator()
{
  return MEMORY[0x270FA1F78]();
}

uint64_t type metadata accessor for AsyncStream()
{
  return MEMORY[0x270FA1F88]();
}

uint64_t AsyncStream.init(_:bufferingPolicy:_:)()
{
  return MEMORY[0x270FA1F90]();
}

Swift::Void __swiftcall Task.cancel()()
{
}

uint64_t static Task<>.isCancelled.getter()
{
  return MEMORY[0x270FA1FD8]();
}

uint64_t dispatch thunk of AsyncSequence.makeAsyncIterator()()
{
  return MEMORY[0x270FA2080]();
}

uint64_t Double.init(truncating:)()
{
  return MEMORY[0x270EF1C00]();
}

NSNumber __swiftcall Double._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x270EF1C18]();
}

uint64_t Double.description.getter()
{
  return MEMORY[0x270F9DD60]();
}

uint64_t Double.significandWidth.getter()
{
  return MEMORY[0x270F9DD78]();
}

uint64_t Double.exponent.getter()
{
  return MEMORY[0x270F9DDB0]();
}

uint64_t Double.encode(to:)()
{
  return MEMORY[0x270F180B8]();
}

NSNumber __swiftcall Float._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x270EF1C48]();
}

uint64_t static Float._forceBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x270EF1C60]();
}

uint64_t static Float._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x270EF1C70]();
}

uint64_t static Float._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1C78]();
}

uint64_t Float.write<A>(to:)()
{
  return MEMORY[0x270F9DE48]();
}

NSSet __swiftcall Set._bridgeToObjectiveC()()
{
  return (NSSet)MEMORY[0x270EF1C98]();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t Set.init(minimumCapacity:)()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t Set.Iterator.init(_cocoa:)()
{
  return MEMORY[0x270F9DF80]();
}

NSNumber __swiftcall Int._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x270EF1CE0]();
}

uint64_t Int.encode(to:)()
{
  return MEMORY[0x270F180C0]();
}

uint64_t dispatch thunk of Collection.startIndex.getter()
{
  return MEMORY[0x270F9E080]();
}

uint64_t dispatch thunk of Collection._customIndexOfEquatableElement(_:)()
{
  return MEMORY[0x270F9E098]();
}

uint64_t dispatch thunk of Collection.count.getter()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t dispatch thunk of Collection.endIndex.getter()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t dispatch thunk of Collection.formIndex(after:)()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t dispatch thunk of Collection.subscript.read()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t CGColorRef.components.getter()
{
  return MEMORY[0x270EE5820]();
}

uint64_t NLTokenizer.enumerateTokens(in:using:)()
{
  return MEMORY[0x270FA10D8]();
}

uint64_t CGContextRef.setLineDash(phase:lengths:)()
{
  return MEMORY[0x270EE5828]();
}

uint64_t CGContextRef.clip(using:)()
{
  return MEMORY[0x270EE5840]();
}

Swift::Void __swiftcall CGContextRef.draw(_:in:byTiling:)(CGImageRef _, __C::CGRect in, Swift::Bool byTiling)
{
}

Swift::Void __swiftcall CGContextRef.fill(_:)(Swift::OpaquePointer a1)
{
}

Swift::Void __swiftcall CGContextRef.move(to:)(CGPoint to)
{
  MEMORY[0x270EE5860]((__n128)__PAIR128__(v1, *(unint64_t *)&to.x), (__n128)__PAIR128__(v2, *(unint64_t *)&to.y));
}

Swift::Void __swiftcall CGContextRef.addLine(to:)(CGPoint to)
{
  MEMORY[0x270EE5878]((__n128)__PAIR128__(v1, *(unint64_t *)&to.x), (__n128)__PAIR128__(v2, *(unint64_t *)&to.y));
}

uint64_t CGContextRef.fillPath(using:)()
{
  return MEMORY[0x270EE5888]();
}

uint64_t NSDictionary.init(dictionaryLiteral:)()
{
  return MEMORY[0x270EF1DE8]();
}

uint64_t NSEnumerator.makeIterator()()
{
  return MEMORY[0x270EF1E08]();
}

uint64_t NSOrderedSet.makeIterator()()
{
  return MEMORY[0x270EF1E70]();
}

uint64_t PKCanvasView.tool.setter()
{
  return MEMORY[0x270EFA270]();
}

uint64_t NSFileManager.replaceItemAt(_:withItemAt:backupItemName:options:)()
{
  return MEMORY[0x270EF1EF8]();
}

uint64_t NSUndoManager.registerUndo<A>(withTarget:handler:)()
{
  return MEMORY[0x270EF1F00]();
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

uint64_t static os_log_type_t.fault.getter()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t static os_log_type_t.default.getter()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t NSItemProvider.loadObject<A>(ofClass:completionHandler:)()
{
  return MEMORY[0x270EF1F08]();
}

uint64_t NSItemProvider.registerDataRepresentation(for:visibility:loadHandler:)()
{
  return MEMORY[0x270FA1960]();
}

uint64_t UIPointerStyle.init(effect:shape:)()
{
  return MEMORY[0x270F82470]();
}

uint64_t UIPointerRegion.init(rect:identifier:)()
{
  return MEMORY[0x270F82490]();
}

Swift::Void __swiftcall CGMutablePathRef.addPath(_:transform:)(CGPathRef _, CGAffineTransform *transform)
{
}

Swift::Void __swiftcall CGMutablePathRef.addEllipse(in:transform:)(__C::CGRect in, CGAffineTransform *transform)
{
}

Swift::Void __swiftcall CGMutablePathRef.addQuadCurve(to:control:transform:)(CGPoint to, CGPoint control, CGAffineTransform *transform)
{
  MEMORY[0x270EE58A8](transform, (__n128)__PAIR128__(v3, *(unint64_t *)&to.x), (__n128)__PAIR128__(v4, *(unint64_t *)&to.y), (__n128)__PAIR128__(v5, *(unint64_t *)&control.x), (__n128)__PAIR128__(v6, *(unint64_t *)&control.y));
}

Swift::Void __swiftcall CGMutablePathRef.move(to:transform:)(CGPoint to, CGAffineTransform *transform)
{
  MEMORY[0x270EE58B8](transform, (__n128)__PAIR128__(v2, *(unint64_t *)&to.x), (__n128)__PAIR128__(v3, *(unint64_t *)&to.y));
}

uint64_t CGMutablePathRef.addArc(center:radius:startAngle:endAngle:clockwise:transform:)()
{
  return MEMORY[0x270EE58C8]();
}

Swift::Void __swiftcall CGMutablePathRef.addLine(to:transform:)(CGPoint to, CGAffineTransform *transform)
{
  MEMORY[0x270EE58D8](transform, (__n128)__PAIR128__(v2, *(unint64_t *)&to.x), (__n128)__PAIR128__(v3, *(unint64_t *)&to.y));
}

Swift::Void __swiftcall CGMutablePathRef.addRect(_:transform:)(__C::CGRect _, CGAffineTransform *transform)
{
}

Swift::Void __swiftcall CGMutablePathRef.addCurve(to:control1:control2:transform:)(CGPoint to, CGPoint control1, CGPoint control2, CGAffineTransform *transform)
{
  MEMORY[0x270EE58E8](transform, (__n128)__PAIR128__(v4, *(unint64_t *)&to.x), (__n128)__PAIR128__(v5, *(unint64_t *)&to.y), (__n128)__PAIR128__(v6, *(unint64_t *)&control1.x), (__n128)__PAIR128__(v7, *(unint64_t *)&control1.y), (__n128)__PAIR128__(v8, *(unint64_t *)&control2.x), (__n128)__PAIR128__(v9, *(unint64_t *)&control2.y));
}

Swift::Void __swiftcall CGMutablePathRef.addLines(between:transform:)(Swift::OpaquePointer between, CGAffineTransform *transform)
{
}

uint64_t UIViewController.registerForTraitChanges<A>(_:handler:)()
{
  return MEMORY[0x270F82578]();
}

uint64_t static CGAffineTransform.== infix(_:_:)()
{
  return MEMORY[0x270EE58F8]();
}

uint64_t static NSKeyedUnarchiver.unarchivedObject(ofClasses:from:)()
{
  return MEMORY[0x270EF1F70]();
}

Swift::Void __swiftcall OS_dispatch_group.wait()()
{
}

uint64_t OS_dispatch_group.notify(qos:flags:queue:execute:)()
{
  return MEMORY[0x270FA0C20]();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)()
{
  return MEMORY[0x270FA0C78]();
}

uint64_t OS_dispatch_queue.asyncAfter(deadline:execute:)()
{
  return MEMORY[0x270FA0C90]();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t OS_dispatch_queue.sync<A>(execute:)()
{
  return MEMORY[0x270FA0D88]();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t OS_dispatch_queue.async(execute:)()
{
  return MEMORY[0x270FA0DB0]();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t static OS_dispatch_queue.global(qos:)()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t static UIPointerAccessory.arrow(_:)()
{
  return MEMORY[0x270F82600]();
}

uint64_t static UIPointerAccessory.Position.bottomLeft.getter()
{
  return MEMORY[0x270F82608]();
}

uint64_t static UIPointerAccessory.Position.bottomRight.getter()
{
  return MEMORY[0x270F82610]();
}

uint64_t static UIPointerAccessory.Position.top.getter()
{
  return MEMORY[0x270F82618]();
}

uint64_t static UIPointerAccessory.Position.left.getter()
{
  return MEMORY[0x270F82620]();
}

uint64_t static UIPointerAccessory.Position.right.getter()
{
  return MEMORY[0x270F82628]();
}

uint64_t static UIPointerAccessory.Position.bottom.getter()
{
  return MEMORY[0x270F82630]();
}

uint64_t static UIPointerAccessory.Position.topLeft.getter()
{
  return MEMORY[0x270F82638]();
}

uint64_t static UIPointerAccessory.Position.topRight.getter()
{
  return MEMORY[0x270F82640]();
}

uint64_t type metadata accessor for UIPointerAccessory.Position()
{
  return MEMORY[0x270F82648]();
}

Swift::Void __swiftcall OS_dispatch_semaphore.wait()()
{
}

Swift::Int __swiftcall OS_dispatch_semaphore.signal()()
{
  return MEMORY[0x270FA0F28]();
}

uint64_t PKToolPickerLassoItem.lassoTool.getter()
{
  return MEMORY[0x270EFA278]();
}

uint64_t UIContentSizeCategory.isAccessibilityCategory.getter()
{
  return MEMORY[0x270F82688]();
}

uint64_t PKToolPickerEraserItem.eraserTool.getter()
{
  return MEMORY[0x270EFA280]();
}

uint64_t PKToolPickerInkingItem.inkingTool.getter()
{
  return MEMORY[0x270EFA288]();
}

uint64_t UIEditMenuConfiguration.init(identifier:sourcePoint:)()
{
  return MEMORY[0x270F826C8]();
}

uint64_t UIBandSelectionInteraction.selectionRect.getter()
{
  return MEMORY[0x270F82718]();
}

uint64_t CGRect.debugDescription.getter()
{
  return MEMORY[0x270EE5908]();
}

uint64_t CGSize.debugDescription.getter()
{
  return MEMORY[0x270EE5910]();
}

UIMenu __swiftcall UIMenu.init(title:subtitle:image:identifier:options:preferredElementSize:children:)(Swift::String title, Swift::String_optional subtitle, UIImage_optional image, UIMenuIdentifier_optional identifier, UIMenuOptions options, UIMenuElementSize preferredElementSize, Swift::OpaquePointer children)
{
  return (UIMenu)MEMORY[0x270F828A8](title._countAndFlagsBits, title._object, subtitle.value._countAndFlagsBits, subtitle.value._object, image.value.super.isa, *(void *)&image.is_nil, identifier.value, options);
}

uint64_t UIView.traitOverrides.getter()
{
  return MEMORY[0x270F828B8]();
}

uint64_t UIView.traitOverrides.setter()
{
  return MEMORY[0x270F828C0]();
}

uint64_t UIView.registerForTraitChanges<A>(_:handler:)()
{
  return MEMORY[0x270F828E0]();
}

uint64_t CGPoint.debugDescription.getter()
{
  return MEMORY[0x270EE5920]();
}

uint64_t NSArray.init(arrayLiteral:)()
{
  return MEMORY[0x270EF20C0]();
}

uint64_t NSArray.makeIterator()()
{
  return MEMORY[0x270EF20D8]();
}

uint64_t NSArray.init(objects:)()
{
  return MEMORY[0x270EF20E8]();
}

uint64_t NSCoder.decodeObject<A>(of:forKey:)()
{
  return MEMORY[0x270EF20F8]();
}

uint64_t NSCoder.decodeTopLevelObject<A>(of:forKey:)()
{
  return MEMORY[0x270EF2138]();
}

uint64_t UIColor.init(_:)()
{
  return MEMORY[0x270F05438]();
}

NSNumber __swiftcall NSNumber.init(floatLiteral:)(Swift::Double floatLiteral)
{
  return (NSNumber)MEMORY[0x270EF2170](floatLiteral);
}

NSNumber __swiftcall NSNumber.init(BOOLeanLiteral:)(Swift::Bool BOOLeanLiteral)
{
  return (NSNumber)MEMORY[0x270EF2180](BOOLeanLiteral);
}

NSNumber __swiftcall NSNumber.init(integerLiteral:)(Swift::Int integerLiteral)
{
  return (NSNumber)MEMORY[0x270EF2198](integerLiteral);
}

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  return MEMORY[0x270FA1170](seed);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return MEMORY[0x270FA1180]();
}

uint64_t NSObject.hashValue.getter()
{
  return MEMORY[0x270FA11A0]();
}

uint64_t UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)()
{
  return MEMORY[0x270F82960]();
}

uint64_t UIButton.Configuration.preferredSymbolConfigurationForImage.setter()
{
  return MEMORY[0x270F82978]();
}

uint64_t UIButton.Configuration.buttonSize.setter()
{
  return MEMORY[0x270F82998]();
}

uint64_t type metadata accessor for UIButton.Configuration.CornerStyle()
{
  return MEMORY[0x270F829B0]();
}

uint64_t UIButton.Configuration.cornerStyle.setter()
{
  return MEMORY[0x270F829B8]();
}

uint64_t UIButton.Configuration.imagePadding.setter()
{
  return MEMORY[0x270F829D8]();
}

uint64_t UIButton.Configuration.imagePlacement.setter()
{
  return MEMORY[0x270F82A10]();
}

uint64_t static UIButton.Configuration.borderedProminent()()
{
  return MEMORY[0x270F82A38]();
}

uint64_t UIButton.Configuration.titleTextAttributesTransformer.setter()
{
  return MEMORY[0x270F82AB0]();
}

uint64_t type metadata accessor for UIButton.Configuration.Size()
{
  return MEMORY[0x270F82AD0]();
}

uint64_t UIButton.Configuration.image.setter()
{
  return MEMORY[0x270F82AF0]();
}

uint64_t static UIButton.Configuration.plain()()
{
  return MEMORY[0x270F82B00]();
}

uint64_t UIButton.Configuration.title.setter()
{
  return MEMORY[0x270F82B18]();
}

uint64_t static UIButton.Configuration.filled()()
{
  return MEMORY[0x270F82B28]();
}

uint64_t type metadata accessor for UIButton.Configuration()
{
  return MEMORY[0x270F82B58]();
}

uint64_t UIButton.init(configuration:primaryAction:)()
{
  return MEMORY[0x270F82B60]();
}

uint64_t UIButton.configuration.setter()
{
  return MEMORY[0x270F82B88]();
}

uint64_t static _NSRange._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x270EF21F8]();
}

uint64_t CGPathRef.copy(strokingWithWidth:lineCap:lineJoin:miterLimit:transform:)()
{
  return MEMORY[0x270EE5938]();
}

uint64_t CGPathRef.contains(_:using:transform:)()
{
  return MEMORY[0x270EE5950]();
}

uint64_t type metadata accessor for NSRunLoop.SchedulerOptions()
{
  return MEMORY[0x270EF2310]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t dispatch thunk of IteratorProtocol.next()()
{
  return MEMORY[0x270F9E518]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x270F9E530]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x270F9E560]();
}

uint64_t StringProtocol.trimmingCharacters(in:)()
{
  return MEMORY[0x270EF2478]();
}

uint64_t StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t StringProtocol.localizedCaseInsensitiveContains<A>(_:)()
{
  return MEMORY[0x270EF2518]();
}

uint64_t StringProtocol.range<A>(of:options:range:locale:)()
{
  return MEMORY[0x270EF2560]();
}

uint64_t StringProtocol.contains<A>(_:)()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t BinaryInteger.description.getter()
{
  return MEMORY[0x270F9E658]();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return MEMORY[0x270F9E670]();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t _HashTable.previousHole(before:)()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t _HashTable.nextHole(atOrAfter:)()
{
  return MEMORY[0x270F9E800]();
}

uint64_t __CocoaSet.startIndex.getter()
{
  return MEMORY[0x270F9E810]();
}

uint64_t __CocoaSet.makeIterator()()
{
  return MEMORY[0x270F9E818]();
}

uint64_t static __CocoaSet.Index.== infix(_:_:)()
{
  return MEMORY[0x270F9E830]();
}

uint64_t __CocoaSet.Index.age.getter()
{
  return MEMORY[0x270F9E838]();
}

uint64_t __CocoaSet.Index.element.getter()
{
  return MEMORY[0x270F9E840]();
}

uint64_t __CocoaSet.count.getter()
{
  return MEMORY[0x270F9E848]();
}

uint64_t __CocoaSet.member(for:)()
{
  return MEMORY[0x270F9E858]();
}

uint64_t __CocoaSet.element(at:)()
{
  return MEMORY[0x270F9E860]();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return MEMORY[0x270F9E870]();
}

uint64_t __CocoaSet.contains(_:)()
{
  return MEMORY[0x270F9E878]();
}

uint64_t __CocoaSet.endIndex.getter()
{
  return MEMORY[0x270F9E880]();
}

NSObject __swiftcall AnyHashable._bridgeToObjectiveC()()
{
  return (NSObject)MEMORY[0x270EF2608]();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return MEMORY[0x270F9E8C0](seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t static _SetStorage.copy(original:)()
{
  return MEMORY[0x270F9E958]();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x270F9E960]();
}

uint64_t static _SetStorage.convert(_:capacity:)()
{
  return MEMORY[0x270F9E968]();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return MEMORY[0x270F9E970]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x270F9E9B0]();
}

Swift::Void __swiftcall _ArrayBuffer._typeCheckSlowPath(_:)(Swift::Int a1)
{
}

uint64_t _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x270F9EA38]();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t DecodingError.Context.init(codingPath:debugDescription:underlyingError:)()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t type metadata accessor for DecodingError()
{
  return MEMORY[0x270F9EA98]();
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

Swift::Void __swiftcall ContiguousArray.reserveCapacity(_:)(Swift::Int a1)
{
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

uint64_t ContiguousArray.append(_:)()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t ContiguousArray.init()()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t type metadata accessor for ContiguousArray()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t static ContinuousClock.Instant.now.getter()
{
  return MEMORY[0x270FA2188]();
}

uint64_t ContinuousClock.Instant.advanced(by:)()
{
  return MEMORY[0x270FA2190]();
}

uint64_t type metadata accessor for ContinuousClock.Instant()
{
  return MEMORY[0x270FA21A0]();
}

uint64_t ContinuousClock.init()()
{
  return MEMORY[0x270FA21A8]();
}

uint64_t type metadata accessor for ContinuousClock()
{
  return MEMORY[0x270FA21B0]();
}

uint64_t dispatch thunk of InstantProtocol.advanced(by:)()
{
  return MEMORY[0x270F9ECD8]();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t AsyncMapSequence.base.getter()
{
  return MEMORY[0x270FA2210]();
}

uint64_t AsyncMapSequence.Iterator.baseIterator.modify()
{
  return MEMORY[0x270FA2218]();
}

uint64_t AsyncMapSequence.Iterator.transform.getter()
{
  return MEMORY[0x270FA2220]();
}

uint64_t AsyncMapSequence.Iterator.init(_:transform:)()
{
  return MEMORY[0x270FA2228]();
}

uint64_t AsyncMapSequence.transform.getter()
{
  return MEMORY[0x270FA2230]();
}

uint64_t type metadata accessor for CodingUserInfoKey()
{
  return MEMORY[0x270F9EDF8]();
}

uint64_t dispatch thunk of CustomReflectable.customMirror.getter()
{
  return MEMORY[0x270F9EE00]();
}

uint64_t __CocoaDictionary.makeIterator()()
{
  return MEMORY[0x270F9EF50]();
}

uint64_t __CocoaDictionary.count.getter()
{
  return MEMORY[0x270F9EF88]();
}

uint64_t __CocoaDictionary.lookup(_:)()
{
  return MEMORY[0x270F9EFB0]();
}

uint64_t __CocoaDictionary.Iterator.next()()
{
  return MEMORY[0x270F9EFC0]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9EFE8]();
}

{
  return MEMORY[0x270F9EFF0]();
}

uint64_t _bridgeCocoaArray<A>(_:)()
{
  return MEMORY[0x270F9F000]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x270F9F080]();
}

uint64_t _CocoaArrayWrapper.subscript.getter()
{
  return MEMORY[0x270F9F088]();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return MEMORY[0x270F9F098]();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t static _DictionaryStorage.convert(_:capacity:)()
{
  return MEMORY[0x270F9F0A8]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t static CollectionDifference._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF2610]();
}

uint64_t CollectionDifference<A>.inferringMoves()()
{
  return MEMORY[0x270F9F120]();
}

uint64_t _SwiftNewtypeWrapper<>._toCustomAnyHashable()()
{
  return MEMORY[0x270F9F1A8]();
}

uint64_t dispatch thunk of static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x270F9F210]();
}

uint64_t _convertToAnyHashable<A>(_:)()
{
  return MEMORY[0x270F9F228]();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return MEMORY[0x270F9F230](cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return MEMORY[0x270F9F250]();
}

uint64_t KeyedDecodingContainer.codingPath.getter()
{
  return MEMORY[0x270F9F258]();
}

uint64_t KeyedDecodingContainer.decodeIfPresent(_:forKey:)()
{
  return MEMORY[0x270F9F270]();
}

uint64_t KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return MEMORY[0x270F9F2E8]();
}

{
  return MEMORY[0x270F9F2F0]();
}

{
  return MEMORY[0x270F9F2F8]();
}

{
  return MEMORY[0x270F9F300]();
}

{
  return MEMORY[0x270F9F308]();
}

{
  return MEMORY[0x270F9F310]();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return MEMORY[0x270F9F318]();
}

uint64_t KeyedDecodingContainer.allKeys.getter()
{
  return MEMORY[0x270F9F360]();
}

uint64_t KeyedDecodingContainer.contains(_:)()
{
  return MEMORY[0x270F9F368]();
}

uint64_t KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return MEMORY[0x270F9F390]();
}

uint64_t KeyedEncodingContainer.encodeIfPresent(_:forKey:)()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return MEMORY[0x270F9F428]();
}

{
  return MEMORY[0x270F9F430]();
}

{
  return MEMORY[0x270F9F438]();
}

{
  return MEMORY[0x270F9F440]();
}

{
  return MEMORY[0x270F9F448]();
}

{
  return MEMORY[0x270F9F450]();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return MEMORY[0x270F9F458]();
}

uint64_t KeyedEncodingContainer.init<A>(_:)()
{
  return MEMORY[0x270F9F4B0]();
}

uint64_t specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x270F9F4C0]();
}

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return MEMORY[0x270F9F4C8](a1);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t type metadata accessor for _ContiguousArrayStorage()
{
  return MEMORY[0x270F9F4F8]();
}

uint64_t _getErrorEmbeddedNSError<A>(_:)()
{
  return MEMORY[0x270F9F730]();
}

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t dispatch thunk of SingleValueDecodingContainer.decode<A>(_:)()
{
  return MEMORY[0x270F9F818]();
}

uint64_t dispatch thunk of SingleValueEncodingContainer.encode<A>(_:)()
{
  return MEMORY[0x270F9F8A8]();
}

uint64_t SingleValueEncodingContainer.encode(_:)()
{
  return MEMORY[0x270F9F8F8]();
}

{
  return MEMORY[0x270F9F900]();
}

uint64_t dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter()
{
  return MEMORY[0x270F9F918]();
}

uint64_t type metadata accessor for __ContiguousArrayStorageBase()
{
  return MEMORY[0x270F9F920]();
}

uint64_t KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:)()
{
  return MEMORY[0x270F9F9B0]();
}

{
  return MEMORY[0x270F9F9B8]();
}

{
  return MEMORY[0x270F9F9C0]();
}

{
  return MEMORY[0x270F9F9C8]();
}

{
  return MEMORY[0x270F9F9D0]();
}

{
  return MEMORY[0x270F9F9E0]();
}

{
  return MEMORY[0x270F9F9E8]();
}

{
  return MEMORY[0x270F9F9F0]();
}

{
  return MEMORY[0x270F9F9F8]();
}

uint64_t KeyedEncodingContainerProtocol.encodeIfPresent<A>(_:forKey:)()
{
  return MEMORY[0x270F9F9D8]();
}

uint64_t KeyedEncodingContainerProtocol.encodeConditional<A>(_:forKey:)()
{
  return MEMORY[0x270F9FA00]();
}

uint64_t KeyedEncodingContainerProtocol.encode(_:forKey:)()
{
  return MEMORY[0x270F9FA08]();
}

{
  return MEMORY[0x270F9FA10]();
}

uint64_t _findStringSwitchCaseWithCache(cases:string:cache:)()
{
  return MEMORY[0x270F9FA40]();
}

uint64_t dispatch thunk of CustomPlaygroundDisplayConvertible.playgroundDescription.getter()
{
  return MEMORY[0x270F9FA78]();
}

uint64_t _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t dispatch thunk of Clock.now.getter()
{
  return MEMORY[0x270FA2378]();
}

uint64_t Error.localizedDescription.getter()
{
  return MEMORY[0x270EF2680]();
}

uint64_t static Hasher._hash(seed:bytes:count:)()
{
  return MEMORY[0x270F9FC30]();
}

uint64_t static Hasher._hash(seed:_:)()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x270F9FC48]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt8 a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt32 a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt64 a1)
{
}

Swift::Int __swiftcall Hasher.finalize()()
{
  return MEMORY[0x270F9FC88]();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t Hasher.init()()
{
  return MEMORY[0x270F9FC98]();
}

uint64_t type metadata accessor for Mirror.DisplayStyle()
{
  return MEMORY[0x270F9FCB8]();
}

uint64_t type metadata accessor for Mirror.AncestorRepresentation()
{
  return MEMORY[0x270F9FCC8]();
}

uint64_t Mirror.init<A>(_:children:displayStyle:ancestorRepresentation:)()
{
  return MEMORY[0x270F9FCF0]();
}

uint64_t dispatch thunk of Decoder.singleValueContainer()()
{
  return MEMORY[0x270F9FD60]();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t dispatch thunk of Encoder.singleValueContainer()()
{
  return MEMORY[0x270F9FD88]();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t dispatch thunk of CodingKey.stringValue.getter()
{
  return MEMORY[0x270FA0090]();
}

uint64_t TaskLocal.init(wrappedValue:)()
{
  return MEMORY[0x270FA23A8]();
}

uint64_t TaskLocal.wrappedValue.getter()
{
  return MEMORY[0x270FA23B0]();
}

uint64_t TaskLocal.get()()
{
  return MEMORY[0x270FA23B8]();
}

uint64_t _typeName(_:qualified:)()
{
  return MEMORY[0x270FA0128]();
}

uint64_t AnalyticsIsEventUsed()
{
  return MEMORY[0x270F18A30]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x270F18A38]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  MEMORY[0x270EFB7B0](minimum, maximum, preferred);
  result.preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

CATransform3D *__cdecl CATransform3DMakeAffineTransform(CATransform3D *__return_ptr retstr, CGAffineTransform *m)
{
  return (CATransform3D *)MEMORY[0x270EFB930](retstr, m);
}

CCCryptorStatus CCCrypt(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x270ED78A0](*(void *)&op, *(void *)&alg, *(void *)&options, key, keyLength, iv, dataIn, dataInLength);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x270EE47E0](allocator, capacity);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x270EE49A0](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x270EE5960](retstr, t1, t2);
}

CGAffineTransformComponents *__cdecl CGAffineTransformDecompose(CGAffineTransformComponents *__return_ptr retstr, CGAffineTransform *transform)
{
  return (CGAffineTransformComponents *)MEMORY[0x270EE5968](retstr, transform);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x270EE5978](retstr, t);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x270EE5980](t);
}

CGAffineTransform *__cdecl CGAffineTransformMake(CGAffineTransform *__return_ptr retstr, CGFloat a, CGFloat b, CGFloat c, CGFloat d, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE5990](retstr, a, b, c, d, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE5998](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59B0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59C8](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59D8](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x270EE59F8](context);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x270EE5B50](space, components);
}

CGColorRef CGColorCreateCopyByMatchingToColorSpace(CGColorSpaceRef a1, CGColorRenderingIntent intent, CGColorRef color, CFDictionaryRef options)
{
  return (CGColorRef)MEMORY[0x270EE5B60](a1, *(void *)&intent, color, options);
}

CGColorRef CGColorCreateCopyWithAlpha(CGColorRef color, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x270EE5B68](color, alpha);
}

CGColorRef CGColorCreateGenericGray(CGFloat gray, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x270EE5B70](gray, alpha);
}

CGColorRef CGColorCreateSRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x270EE5B88](red, green, blue, alpha);
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  MEMORY[0x270EE5BC0](color);
  return result;
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5BC8](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x270EE5BE0](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C60]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5CA8](name);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextAddEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextBeginTransparencyLayer(CGContextRef c, CFDictionaryRef auxiliaryInfo)
{
}

void CGContextBeginTransparencyLayerWithRect(CGContextRef c, CGRect rect, CFDictionaryRef auxInfo)
{
}

void CGContextClosePath(CGContextRef c)
{
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

CGRect CGContextConvertRectToDeviceSpace(CGContextRef c, CGRect rect)
{
  MEMORY[0x270EE5E88](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode)
{
}

void CGContextEndTransparencyLayer(CGContextRef c)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

CGRect CGContextGetClipBoundingBox(CGContextRef c)
{
  MEMORY[0x270EE5FC8](c);
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v2;
  result.origin.CGFloat x = v1;
  return result;
}

uint64_t CGContextGetType()
{
  return MEMORY[0x270EE6038]();
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetAlpha(CGContextRef c, CGFloat alpha)
{
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetGrayFillColor(CGContextRef c, CGFloat gray, CGFloat alpha)
{
}

void CGContextSetLineCap(CGContextRef c, CGLineCap cap)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetRGBFillColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
}

void CGContextSetShadowWithColor(CGContextRef c, CGSize offset, CGFloat blur, CGColorRef color)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGDataConsumerRef CGDataConsumerCreateWithCFData(CFMutableDataRef data)
{
  return (CGDataConsumerRef)MEMORY[0x270EE6298](data);
}

CGDataConsumerRef CGDataConsumerCreateWithURL(CFURLRef url)
{
  return (CGDataConsumerRef)MEMORY[0x270EE62A0](url);
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x270EE62D0](data);
}

uint64_t CGDisplayListContextCreate()
{
  return MEMORY[0x270EE6340]();
}

uint64_t CGDisplayListCreateWithRect()
{
  return MEMORY[0x270EE6350]();
}

uint64_t CGDisplayListEntryGetType()
{
  return MEMORY[0x270EE6368]();
}

uint64_t CGDisplayListEntryImageGetImage()
{
  return MEMORY[0x270EE63A8]();
}

uint64_t CGDisplayListEnumerateEntriesWithOptions()
{
  return MEMORY[0x270EE63B8]();
}

uint64_t CGDisplayListGetNumberOfEntries()
{
  return MEMORY[0x270EE63C0]();
}

uint64_t CGDisplayListGetNumberOfEntriesOfType()
{
  return MEMORY[0x270EE63C8]();
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x270EE6750](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGImageRef CGImageCreateWithJPEGDataProvider(CGDataProviderRef source, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x270EE6760](source, decode, shouldInterpolate, *(void *)&intent);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

void CGImageDestinationAddImageAndMetadata(CGImageDestinationRef idst, CGImageRef image, CGImageMetadataRef metadata, CFDictionaryRef options)
{
}

void CGImageDestinationAddImageFromSource(CGImageDestinationRef idst, CGImageSourceRef isrc, size_t index, CFDictionaryRef properties)
{
}

CFArrayRef CGImageDestinationCopyTypeIdentifiers(void)
{
  return (CFArrayRef)MEMORY[0x270EF4F18]();
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x270EF4F20](data, type, count, options);
}

CGImageDestinationRef CGImageDestinationCreateWithDataConsumer(CGDataConsumerRef consumer, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x270EF4F30](consumer, type, count, options);
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x270EF4F38](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x270EF4F48](idst);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

uint64_t CGImageGetMask()
{
  return MEMORY[0x270EE6818]();
}

uint64_t CGImageGetSizeAfterOrientation()
{
  return MEMORY[0x270EE6850]();
}

CFStringRef CGImageGetUTType(CGImageRef image)
{
  return (CFStringRef)MEMORY[0x270EE6860](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

uint64_t CGImageHasAlpha()
{
  return MEMORY[0x270EE6870]();
}

CGImageMetadataTagRef CGImageMetadataCopyTagWithPath(CGImageMetadataRef metadata, CGImageMetadataTagRef parent, CFStringRef path)
{
  return (CGImageMetadataTagRef)MEMORY[0x270EF4F68](metadata, parent, path);
}

CGMutableImageMetadataRef CGImageMetadataCreateMutable(void)
{
  return (CGMutableImageMetadataRef)MEMORY[0x270EF4F80]();
}

CGMutableImageMetadataRef CGImageMetadataCreateMutableCopy(CGImageMetadataRef metadata)
{
  return (CGMutableImageMetadataRef)MEMORY[0x270EF4F88](metadata);
}

BOOL CGImageMetadataRegisterNamespaceForPrefix(CGMutableImageMetadataRef metadata, CFStringRef xmlns, CFStringRef prefix, CFErrorRef *err)
{
  return MEMORY[0x270EF4FA0](metadata, xmlns, prefix, err);
}

BOOL CGImageMetadataRemoveTagWithPath(CGMutableImageMetadataRef metadata, CGImageMetadataTagRef parent, CFStringRef path)
{
  return MEMORY[0x270EF4FA8](metadata, parent, path);
}

BOOL CGImageMetadataSetTagWithPath(CGMutableImageMetadataRef metadata, CGImageMetadataTagRef parent, CFStringRef path, CGImageMetadataTagRef tag)
{
  return MEMORY[0x270EF4FB0](metadata, parent, path, tag);
}

BOOL CGImageMetadataSetValueMatchingImageProperty(CGMutableImageMetadataRef metadata, CFStringRef dictionaryName, CFStringRef propertyName, CFTypeRef value)
{
  return MEMORY[0x270EF4FB8](metadata, dictionaryName, propertyName, value);
}

CFTypeRef CGImageMetadataTagCopyValue(CGImageMetadataTagRef tag)
{
  return (CFTypeRef)MEMORY[0x270EF4FD8](tag);
}

CGImageMetadataTagRef CGImageMetadataTagCreate(CFStringRef xmlns, CFStringRef prefix, CFStringRef name, CGImageMetadataType type, CFTypeRef value)
{
  return (CGImageMetadataTagRef)MEMORY[0x270EF4FE0](xmlns, prefix, name, *(void *)&type, value);
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x270EE6908](image);
}

CGImageMetadataRef CGImageSourceCopyMetadataAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageMetadataRef)MEMORY[0x270EF4FF0](isrc, index, options);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x270EF5000](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x270EF5018](isrc, index, options);
}

CGImageRef CGImageSourceCreateThumbnailAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x270EF5028](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5030](data, options);
}

CGImageSourceRef CGImageSourceCreateWithDataProvider(CGDataProviderRef provider, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5038](provider, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5040](url, options);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x270EF5068](isrc);
}

void CGPDFContextBeginPage(CGContextRef context, CFDictionaryRef pageInfo)
{
}

void CGPDFContextClose(CGContextRef context)
{
}

CGContextRef CGPDFContextCreate(CGDataConsumerRef consumer, const CGRect *mediaBox, CFDictionaryRef auxiliaryInfo)
{
  return (CGContextRef)MEMORY[0x270EE6A80](consumer, mediaBox, auxiliaryInfo);
}

CGContextRef CGPDFContextCreateWithURL(CFURLRef url, const CGRect *mediaBox, CFDictionaryRef auxiliaryInfo)
{
  return (CGContextRef)MEMORY[0x270EE6A88](url, mediaBox, auxiliaryInfo);
}

void CGPDFContextEndPage(CGContextRef context)
{
}

BOOL CGPDFDictionaryGetDictionary(CGPDFDictionaryRef dict, const char *key, CGPDFDictionaryRef *value)
{
  return MEMORY[0x270EE6AF0](dict, key, value);
}

BOOL CGPDFDictionaryGetStream(CGPDFDictionaryRef dict, const char *key, CGPDFStreamRef *value)
{
  return MEMORY[0x270EE6B28](dict, key, value);
}

BOOL CGPDFDictionaryGetString(CGPDFDictionaryRef dict, const char *key, CGPDFStringRef *value)
{
  return MEMORY[0x270EE6B30](dict, key, value);
}

CGRect CGPDFPageGetBoxRect(CGPDFPageRef page, CGPDFBox box)
{
  MEMORY[0x270EE6D80](page, *(void *)&box);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

CFDataRef CGPDFStreamCopyData(CGPDFStreamRef stream, CGPDFDataFormat *format)
{
  return (CFDataRef)MEMORY[0x270EE6EB8](stream, format);
}

CFStringRef CGPDFStringCopyTextString(CGPDFStringRef string)
{
  return (CFStringRef)MEMORY[0x270EE6ED0](string);
}

void CGPathAddCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathApplyWithBlock(CGPathRef path, CGPathApplyBlock block)
{
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
}

CGPathRef CGPathCreateCopyByTransformingPath(CGPathRef path, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x270EE7008](path, transform);
}

CGPathRef CGPathCreateCopyByUnioningPath(CGPathRef path, CGPathRef maskPath, BOOL evenOddFillRule)
{
  return (CGPathRef)MEMORY[0x270EE7010](path, maskPath, evenOddFillRule);
}

CGPathRef CGPathCreateCopyOfLineByIntersectingPath(CGPathRef path, CGPathRef maskPath, BOOL evenOddFillRule)
{
  return (CGPathRef)MEMORY[0x270EE7018](path, maskPath, evenOddFillRule);
}

CGPathRef CGPathCreateCopyOfLineBySubtractingPath(CGPathRef path, CGPathRef maskPath, BOOL evenOddFillRule)
{
  return (CGPathRef)MEMORY[0x270EE7020](path, maskPath, evenOddFillRule);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x270EE7030]();
}

CGPathRef CGPathCreateWithEllipseInRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x270EE7050](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGPathRef CGPathCreateWithRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x270EE7058](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGPathRef CGPathCreateWithRoundedRect(CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x270EE7060](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, cornerWidth, cornerHeight);
}

CGRect CGPathGetBoundingBox(CGPathRef path)
{
  MEMORY[0x270EE7070](path);
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v2;
  result.origin.CGFloat x = v1;
  return result;
}

CGPoint CGPathGetCurrentPoint(CGPathRef path)
{
  MEMORY[0x270EE7078](path);
  result.CGFloat y = v2;
  result.CGFloat x = v1;
  return result;
}

uint64_t CGPathGetNumberOfElements()
{
  return MEMORY[0x270EE7080]();
}

uint64_t CGPathGetNumberOfPoints()
{
  return MEMORY[0x270EE7088]();
}

CGRect CGPathGetPathBoundingBox(CGPathRef path)
{
  MEMORY[0x270EE7090](path);
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v2;
  result.origin.CGFloat x = v1;
  return result;
}

BOOL CGPathIntersectsPath(CGPathRef path1, CGPathRef path2, BOOL evenOddFillRule)
{
  return MEMORY[0x270EE70A0](path1, path2, evenOddFillRule);
}

uint64_t CGPathIntersectsRect()
{
  return MEMORY[0x270EE70B0]();
}

BOOL CGPathIsEmpty(CGPathRef path)
{
  return MEMORY[0x270EE70C8](path);
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

CGPoint CGPointApplyAffineTransform(CGPoint point, CGAffineTransform *t)
{
  MEMORY[0x270EE7148](t, (__n128)point, *(__n128 *)&point.y);
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x270EE7168](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7180]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

void CGRectDivide(CGRect rect, CGRect *slice, CGRect *remainder, CGFloat amount, CGRectEdge edge)
{
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x270EE7230]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v2;
  result.origin.CGFloat x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7238]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7250]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x270EE7268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x270EE7270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

CGRect CGRectStandardize(CGRect rect)
{
  MEMORY[0x270EE7288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v2;
  result.origin.CGFloat x = v1;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

CGSize CGSizeApplyAffineTransform(CGSize size, CGAffineTransform *t)
{
  MEMORY[0x270EE7330](t, (__n128)size, *(__n128 *)&size.height);
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

uint64_t CHGetPersonalizedSynthesisSupportState()
{
  return MEMORY[0x270F18DC0]();
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA150](allocator, width, height, *(void *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1E8](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA240](pixelBuffer);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x270EF2C30]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

uint64_t PKIsSixChannelBlendEnabledInPaper()
{
  return MEMORY[0x270EFA290]();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x270EFD970](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x270EFD978](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x270EFD980](query);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x270EFDCB0](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x270EFDCE0](allocator, token);
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x270F82C48]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x270F82CD0](category);
}

void UIGraphicsBeginImageContext(CGSize size)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x270F82D70]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F82D80]();
}

void UIGraphicsPopContext(void)
{
}

void UIGraphicsPushContext(CGContextRef context)
{
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x270F82DD0](image, compressionQuality);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x270F82DD8](image);
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

__double2 __sincos_stret(double a1)
{
  MEMORY[0x270ED7E88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t _availability_version_check()
{
  return MEMORY[0x270ED7F40]();
}

{
  return MEMORY[0x270F9A3C0]();
}

{
  return MEMORY[0x270F9A3C8]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
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

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x270ED86A8](__y, __x);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x270F9A400](cls, name, imp, types);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x270F9A460](cls, name);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
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

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9A28](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x270ED9AC0](a1, a2, *(void *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x270ED9B18](a1);
}

IMP imp_implementationWithBlock(id block)
{
  return (IMP)MEMORY[0x270F9A4C0](block);
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

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void method_exchangeImplementations(Method m1, Method m2)
{
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x270F9A4F0](m);
}

IMP method_setImplementation(Method m, IMP imp)
{
  return (IMP)MEMORY[0x270F9A518](m, imp);
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

void objc_enumerationMutation(id obj)
{
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

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x270F9AA40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x270EDAB48]();
}

void rewind(FILE *a1)
{
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB560](a1, a2);
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

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x270FA0218]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x270FA2400]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x270FA2408]();
}

uint64_t swift_deallocBox()
{
  return MEMORY[0x270FA0220]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
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

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x270FA0270]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x270FA0278]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x270FA0290]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x270FA0298]();
}

uint64_t swift_dynamicCastUnknownClass()
{
  return MEMORY[0x270FA02B0]();
}

uint64_t swift_dynamicCastUnknownClassUnconditional()
{
  return MEMORY[0x270FA02B8]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x270FA03F8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeLayout()
{
  return MEMORY[0x270FA0408]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x270FA0410]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStaticObject()
{
  return MEMORY[0x270FA0480]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
}

uint64_t swift_isUniquelyReferenced_nonNull()
{
  return MEMORY[0x270FA04B8]();
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

uint64_t swift_modifyAtWritableKeyPath()
{
  return MEMORY[0x270FA04E8]();
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

uint64_t swift_setAtWritableKeyPath()
{
  return MEMORY[0x270FA0548]();
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

uint64_t swift_task_localValuePop()
{
  return MEMORY[0x270FA2480]();
}

uint64_t swift_task_localValuePush()
{
  return MEMORY[0x270FA2488]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
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

uint64_t swift_unknownObjectUnownedAssign()
{
  return MEMORY[0x270FA05B0]();
}

uint64_t swift_unknownObjectUnownedDestroy()
{
  return MEMORY[0x270FA05B8]();
}

uint64_t swift_unknownObjectUnownedInit()
{
  return MEMORY[0x270FA05C0]();
}

uint64_t swift_unknownObjectUnownedLoadStrong()
{
  return MEMORY[0x270FA05C8]();
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

uint64_t swift_weakCopyAssign()
{
  return MEMORY[0x270FA0638]();
}

uint64_t swift_weakCopyInit()
{
  return MEMORY[0x270FA0640]();
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

uint64_t swift_weakTakeAssign()
{
  return MEMORY[0x270FA0660]();
}

uint64_t swift_weakTakeInit()
{
  return MEMORY[0x270FA0668]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

uint64_t vk_cgImageRemoveBackground()
{
  return MEMORY[0x270F83C38]();
}