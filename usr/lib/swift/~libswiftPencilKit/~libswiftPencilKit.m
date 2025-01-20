uint64_t PKCanvasView.tool.getter@<X0>(uint64_t *a1@<X8>)
{
  void *v1;
  id v3;
  uint64_t result;
  _UNKNOWN **v5;
  ValueMetadata *v6;
  id v7;
  id v8;

  v3 = [v1 sel_tool];
  self;
  result = swift_dynamicCastObjCClass();
  if (result)
  {
    v5 = &protocol witness table for PKInkingTool;
    v6 = &type metadata for PKInkingTool;
LABEL_7:
    a1[3] = (uint64_t)v6;
    a1[4] = (uint64_t)v5;
    *a1 = result;
    return result;
  }

  v7 = [v1 sel_tool];
  self;
  result = swift_dynamicCastObjCClass();
  if (result)
  {
    v5 = &protocol witness table for PKEraserTool;
    v6 = &type metadata for PKEraserTool;
    goto LABEL_7;
  }

  v8 = [v1 sel_tool];
  self;
  result = swift_dynamicCastObjCClass();
  if (result)
  {
    v5 = &protocol witness table for PKLassoTool;
    v6 = &type metadata for PKLassoTool;
    goto LABEL_7;
  }

  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t key path getter for PKCanvasView.tool : PKCanvasView@<X0>(uint64_t *a1@<X8>)
{
  return PKCanvasView.tool.getter(a1);
}

uint64_t key path setter for PKCanvasView.tool : PKCanvasView(uint64_t a1)
{
  outlined init with copy of PKTool(a1, (uint64_t)v2);
  return PKCanvasView.tool.setter((uint64_t)v2);
}

uint64_t PKCanvasView.tool.setter(uint64_t a1)
{
  outlined init with copy of PKTool(a1, (uint64_t)v5);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PKTool);
  if (swift_dynamicCast()
    || (outlined init with copy of PKTool(a1, (uint64_t)v5), swift_dynamicCast())
    || (outlined init with copy of PKTool(a1, (uint64_t)v5), swift_dynamicCast()))
  {
    [v1 setTool:v4];

    return __swift_destroy_boxed_opaque_existential_1(a1);
  }
  else
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

uint64_t outlined init with copy of PKTool(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
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

void (*PKCanvasView.tool.modify(uint64_t **a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = (uint64_t *)malloc(0x58uLL);
  *a1 = v3;
  v3[10] = v1;
  PKCanvasView.tool.getter(v3);
  return PKCanvasView.tool.modify;
}

void PKCanvasView.tool.modify(uint64_t *a1, char a2)
{
  v2 = (void *)*a1;
  if (a2)
  {
    outlined init with copy of PKTool(*a1, (uint64_t)v2 + 40);
    PKCanvasView.tool.setter((uint64_t)v2 + 40);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  }
  else
  {
    PKCanvasView.tool.setter(*a1);
  }

  free(v2);
}

PencilKit::PKStrokePath __swiftcall PKStrokePath.init()()
{
  uint64_t v1 = v0;
  result.strokeData.super.isa = (Class)[objc_allocWithZone(MEMORY[0x263F14BC0]) sel_init];
  v1->strokeData.super.isa = result.strokeData.super.isa;
  return result;
}

uint64_t PKStrokePath.init<A>(controlPoints:creationDate:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v8 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388]();
  (*(void (**)(char *, uint64_t))(v8 + 16))((char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  Array.init<A>(_:)();
  id v10 = objc_allocWithZone(MEMORY[0x263F14BC0]);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  Class v12 = Date._bridgeToObjectiveC()().super.isa;
  id v13 = [v10 initWithControlPoints:v12 creationDate:isa];

  uint64_t v14 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(a2, v14);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(a1, a3);
  *a4 = v13;
  return result;
}

void PKStrokePath.creationDate.getter()
{
  id v1 = [*v0 creationDate];
  static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

id PKStrokePath.interpolatedLocation(at:)()
{
  return [*v0 interpolatedLocationAt:];
}

id PKStrokePath.interpolatedPoint(at:)@<X0>(void *a1@<X8>)
{
  id result = [*v1 interpolatedPointAt:];
  if (result)
  {
    *a1 = result;
  }
  else
  {
    id result = (id)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

void PKStrokePath.interpolatedPoints(in:by:)(uint64_t a1@<X0>, double a2@<X1>, char a3@<W2>, uint64_t *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v7 = *a4;
  char v8 = *((unsigned char *)a4 + 8);
  uint64_t v9 = *v5;
  if (a3)
  {
    v15 = *v5;
    id v11 = v9;
    int64_t v12 = (int64_t)[v11 count];
    if (((unint64_t)objc_msgSend(v11, sel_count) & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else
    {
      id v13 = [v11 count];

      if ((v12 & 0x8000000000000000) == 0 && (uint64_t)v13 >= v12)
      {
        if (v12)
        {
          a1 = 0;
          a2 = (double)(v12 - 1);
          uint64_t v9 = v15;
          goto LABEL_8;
        }
LABEL_13:
        __break(1u);
        return;
      }
    }
    __break(1u);
    goto LABEL_13;
  }
LABEL_8:
  *(void *)a5 = v9;
  *(void *)(a5 + 8) = v7;
  *(unsigned char *)(a5 + 16) = v8;
  *(void *)(a5 + 24) = a1;
  *(double *)(a5 + 32) = a2;
  *(void *)(a5 + 40) = a1;

  id v14 = v9;
}

void PKStrokePath.parametricValue(_:offsetBy:)(uint64_t a1, double a2)
{
  double v3 = *(double *)a1;
  int v4 = *(unsigned __int8 *)(a1 + 8);
  v5 = *v2;
  if (v4)
  {
    if (v4 != 1)
    {
      id v8 = v5;
      int64_t v9 = (int64_t)[v8 sel_count];
      if (((unint64_t)objc_msgSend(v8, sel_count) & 0x8000000000000000) != 0)
      {
        __break(1u);
      }
      else
      {
        id v10 = [v8 count];

        if ((v9 & 0x8000000000000000) == 0 && (uint64_t)v10 >= v9) {
          return;
        }
      }
      __break(1u);
      return;
    }
    double v6 = v3;
    uint64_t v7 = sel_parametricValue_offsetByTime_;
  }
  else
  {
    double v6 = v3;
    uint64_t v7 = sel_parametricValue_offsetByDistance_;
  }

  [v5 v7:a2 v6];
}

uint64_t PKStrokePath.startIndex.getter()
{
  return 0;
}

id PKStrokePath.endIndex.getter()
{
  return [*v0 count];
}

id PKStrokePath.subscript.getter@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  id result = [*v2 objectAtIndexedSubscript:a1];
  if (result)
  {
    *a2 = result;
  }
  else
  {
    id result = (id)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

id specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)(int64_t a1, uint64_t a2, int64_t a3, id a4)
{
  id result = [a4 count];
  if (a1 < 0 || (uint64_t)result < a1)
  {
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  id result = [a4 count];
  if (a3 < 0 || (uint64_t)result < a3) {
    goto LABEL_17;
  }
  uint64_t v9 = a3 - a1;
  if (a2 >= 1)
  {
    if (v9 < 0 || v9 >= a2) {
      goto LABEL_12;
    }
    return 0;
  }
  if (v9 <= 0 && v9 > a2) {
    return 0;
  }
LABEL_12:
  BOOL v11 = __OFADD__(a1, a2);
  int64_t v10 = a1 + a2;
  if (v11)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  id result = [a4 count];
  if ((v10 & 0x8000000000000000) == 0 && (uint64_t)result >= v10) {
    return (id)v10;
  }
LABEL_19:
  __break(1u);
  return result;
}

void *protocol witness for BidirectionalCollection.index(before:) in conformance PKStrokePath@<X0>(void *result@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = *result - 1;
  if (__OFSUB__(*result, 1))
  {
    __break(1u);
  }
  else
  {
    id result = [*v2 sel_count];
    if ((v4 & 0x8000000000000000) == 0 && v4 < (uint64_t)result)
    {
      *a2 = v4;
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t *protocol witness for BidirectionalCollection.formIndex(before:) in conformance PKStrokePath(uint64_t *result)
{
  uint64_t v2 = *result - 1;
  if (__OFSUB__(*result, 1))
  {
    __break(1u);
  }
  else
  {
    double v3 = result;
    id result = [(uint64_t *)[*v1 sel_count];
    if ((v2 & 0x8000000000000000) == 0 && v2 < (uint64_t)result)
    {
      *double v3 = v2;
      return result;
    }
  }
  __break(1u);
  return result;
}

void protocol witness for Collection.startIndex.getter in conformance PKStrokePath(void *a1@<X8>)
{
  *a1 = 0;
}

id protocol witness for Collection.endIndex.getter in conformance PKStrokePath@<X0>(void *a1@<X8>)
{
  id result = [*v1 sel_count];
  *a1 = result;
  return result;
}

void (*protocol witness for Collection.subscript.read in conformance PKStrokePath(void *a1, void *a2))(id *a1)
{
  id v4 = [*v2 objectAtIndexedSubscript:*a2];
  if (v4)
  {
    *a1 = v4;
    return protocol witness for Collection.subscript.read in conformance PKStrokePath;
  }
  else
  {
    id result = (void (*)(id *))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

void protocol witness for Collection.subscript.read in conformance PKStrokePath(id *a1)
{
}

uint64_t protocol witness for Collection.subscript.getter in conformance PKStrokePath@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = *a1;
  uint64_t v4 = a1[1];
  id v7 = *v2;
  uint64_t result = (uint64_t)[*v2 count];
  if (result < 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v5 < 0)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (result < v4)
  {
LABEL_9:
    __break(1u);
    return result;
  }
  a2[1] = v4;
  a2[2] = v7;
  *a2 = v5;

  return (uint64_t)v7;
}

unint64_t protocol witness for Collection.indices.getter in conformance PKStrokePath@<X0>(void *a1@<X8>)
{
  unint64_t result = (unint64_t)[*v1 sel_count];
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    *a1 = 0;
    a1[1] = result;
  }
  return result;
}

BOOL protocol witness for Collection.isEmpty.getter in conformance PKStrokePath()
{
  return [*v0 sel_count] == 0;
}

void protocol witness for Collection._customIndexOfEquatableElement(_:) in conformance PKStrokePath(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(_WORD *)(a1 + 8) = 256;
}

void *protocol witness for RandomAccessCollection.index(_:offsetBy:) in conformance PKStrokePath@<X0>(void *result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v5 = *result + a2;
  if (__OFADD__(*result, a2))
  {
    __break(1u);
  }
  else
  {
    unint64_t result = [*v3 sel_count];
    if ((v5 & 0x8000000000000000) == 0 && (uint64_t)result >= v5)
    {
      *a3 = v5;
      return result;
    }
  }
  __break(1u);
  return result;
}

id protocol witness for RandomAccessCollection.index(_:offsetBy:limitedBy:) in conformance PKStrokePath@<X0>(int64_t *a1@<X0>, uint64_t a2@<X1>, int64_t *a3@<X2>, uint64_t a4@<X8>)
{
  id result = specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)(*a1, a2, *a3, *v4);
  *(void *)a4 = result;
  *(unsigned char *)(a4 + 8) = v7 & 1;
  return result;
}

id protocol witness for RandomAccessCollection.distance(from:to:) in conformance PKStrokePath(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  id v5 = *v2;
  id result = [*v2 sel_count];
  if (v3 < 0 || (uint64_t)result < v3)
  {
    __break(1u);
  }
  else
  {
    id result = [v5 count];
    if ((v4 & 0x8000000000000000) == 0 && (uint64_t)result >= v4) {
      return (id)(v4 - v3);
    }
  }
  __break(1u);
  return result;
}

uint64_t *protocol witness for Collection._failEarlyRangeCheck(_:bounds:) in conformance PKStrokePath(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *result;
  uint64_t v3 = a2[1];
  if (*result >= *a2)
  {
    BOOL v5 = __OFSUB__(v2, v3);
    BOOL v4 = v2 - v3 < 0;
  }
  else
  {
    BOOL v5 = 0;
    BOOL v4 = 0;
  }
  if (v4 == v5) {
    __break(1u);
  }
  return result;
}

void *protocol witness for Collection._failEarlyRangeCheck(_:bounds:) in conformance PKStrokePath(void *result, void *a2)
{
  if (*result < *a2 || a2[1] < *result) {
    __break(1u);
  }
  return result;
}

{
  if (*result < *a2 || a2[1] < result[1]) {
    __break(1u);
  }
  return result;
}

id protocol witness for Collection.index(after:) in conformance PKStrokePath@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  id result = [*v2 count];
  if (v4 < 0 || v4 >= (uint64_t)result) {
    __break(1u);
  }
  else {
    *a2 = v4 + 1;
  }
  return result;
}

id protocol witness for Collection.formIndex(after:) in conformance PKStrokePath(uint64_t *a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = *a1;
  id result = [v3 count];
  if (v4 < 0 || v4 >= (uint64_t)result) {
    __break(1u);
  }
  else {
    *a1 = v4 + 1;
  }
  return result;
}

void protocol witness for Sequence.makeIterator() in conformance PKStrokePath(void *a1@<X8>)
{
  *a1 = *v1;
  a1[1] = 0;
}

int64_t protocol witness for Collection.count.getter in conformance PKStrokePath()
{
  id v1 = *v0;
  int64_t v2 = (int64_t)[v1 count];
  int64_t result = (int64_t)[v1 count];
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    int64_t result = (int64_t)[v1 sel_count];
    if ((v2 & 0x8000000000000000) == 0 && result >= v2) {
      return v2;
    }
  }
  __break(1u);
  return result;
}

uint64_t protocol witness for Sequence._customContainsEquatableElement(_:) in conformance PKStrokePath()
{
  return 2;
}

uint64_t protocol witness for Sequence._copyToContiguousArray() in conformance PKStrokePath()
{
  id v1 = *v0;
  uint64_t v2 = specialized _copyCollectionToContiguousArray<A>(_:)(*v0);

  return v2;
}

uint64_t protocol witness for Sequence._copyContents(initializing:) in conformance PKStrokePath(void *a1, uint64_t a2, uint64_t a3)
{
  return specialized Sequence._copySequenceContents(initializing:)(a1, a2, a3, *v3);
}

uint64_t protocol witness for Sequence.withContiguousStorageIfAvailable<A>(_:) in conformance PKStrokePath()
{
  return Sequence.withContiguousStorageIfAvailable<A>(_:)();
}

PKStrokePath __swiftcall PKStrokePath._bridgeToObjectiveC()()
{
  return (PKStrokePath)*v0;
}

id static PKStrokePath._forceBridgeFromObjectiveC(_:result:)(void *a1, id *a2)
{
  *a2 = a1;

  return a1;
}

uint64_t static PKStrokePath._conditionallyBridgeFromObjectiveC(_:result:)(void *a1, id *a2)
{
  *a2 = a1;
  id v4 = a1;
  return 1;
}

uint64_t static PKStrokePath._unconditionallyBridgeFromObjectiveC(_:)@<X0>(id a1@<X0>, void *a2@<X8>)
{
  if (!a1) {
    a1 = [objc_allocWithZone(MEMORY[0x263F14BC0]) init];
  }
  *a2 = a1;

  return MEMORY[0x270F9A8A0]();
}

unint64_t lazy protocol witness table accessor for type PKStrokePath and conformance PKStrokePath()
{
  unint64_t result = lazy protocol witness table cache variable for type PKStrokePath and conformance PKStrokePath;
  if (!lazy protocol witness table cache variable for type PKStrokePath and conformance PKStrokePath)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PKStrokePath and conformance PKStrokePath);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type PKStrokePath and conformance PKStrokePath;
  if (!lazy protocol witness table cache variable for type PKStrokePath and conformance PKStrokePath)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PKStrokePath and conformance PKStrokePath);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type PKStrokePath and conformance PKStrokePath;
  if (!lazy protocol witness table cache variable for type PKStrokePath and conformance PKStrokePath)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PKStrokePath and conformance PKStrokePath);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type PKStrokePath and conformance PKStrokePath;
  if (!lazy protocol witness table cache variable for type PKStrokePath and conformance PKStrokePath)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PKStrokePath and conformance PKStrokePath);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.Indices : RandomAccessCollection in PKStrokePath()
{
  return lazy protocol witness table accessor for type Range<Int> and conformance <> Range<A>(&lazy protocol witness table cache variable for type Range<Int> and conformance <> Range<A>);
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

uint64_t associated type witness table accessor for Collection.SubSequence : RandomAccessCollection in PKStrokePath()
{
  return lazy protocol witness table accessor for type Slice<PKStrokePath> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<PKStrokePath> and conformance <> Slice<A>, (void (*)(void))lazy protocol witness table accessor for type PKStrokePath and conformance PKStrokePath);
}

uint64_t associated type witness table accessor for Collection.Indices : BidirectionalCollection in PKStrokePath()
{
  return lazy protocol witness table accessor for type Range<Int> and conformance <> Range<A>(&lazy protocol witness table cache variable for type Range<Int> and conformance <> Range<A>);
}

uint64_t associated type witness table accessor for Collection.SubSequence : BidirectionalCollection in PKStrokePath()
{
  return lazy protocol witness table accessor for type Slice<PKStrokePath> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<PKStrokePath> and conformance <> Slice<A>, (void (*)(void))lazy protocol witness table accessor for type PKStrokePath and conformance PKStrokePath);
}

uint64_t lazy protocol witness table accessor for type Slice<PKStrokePath> and conformance <> Slice<A>(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Slice<PKStrokePath>);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.Index : Comparable in PKStrokePath()
{
  return MEMORY[0x263F8D6E0];
}

uint64_t associated type witness table accessor for Collection.Indices : Collection in PKStrokePath()
{
  return lazy protocol witness table accessor for type Range<Int> and conformance <> Range<A>(&lazy protocol witness table cache variable for type Range<Int> and conformance <> Range<A>);
}

uint64_t lazy protocol witness table accessor for type Range<Int> and conformance <> Range<A>(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Range<Int>);
    lazy protocol witness table accessor for type Int and conformance Int();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : Collection in PKStrokePath()
{
  return lazy protocol witness table accessor for type Slice<PKStrokePath> and conformance Slice<A>(&lazy protocol witness table cache variable for type Slice<PKStrokePath> and conformance Slice<A>, &demangling cache variable for type metadata for Slice<PKStrokePath>);
}

uint64_t associated type witness table accessor for Sequence.Iterator : IteratorProtocol in PKStrokePath()
{
  return lazy protocol witness table accessor for type Slice<PKStrokePath> and conformance Slice<A>(&lazy protocol witness table cache variable for type IndexingIterator<PKStrokePath> and conformance IndexingIterator<A>, &demangling cache variable for type metadata for IndexingIterator<PKStrokePath>);
}

uint64_t lazy protocol witness table accessor for type Slice<PKStrokePath> and conformance Slice<A>(unint64_t *a1, uint64_t *a2)
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

id protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance PKStrokePath()
{
  return *v0;
}

id protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance PKStrokePath(void *a1, id *a2)
{
  *a2 = a1;

  return a1;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance PKStrokePath(void *a1, id *a2)
{
  *a2 = a1;
  id v4 = a1;
  return 1;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance PKStrokePath@<X0>(id a1@<X0>, void *a2@<X8>)
{
  if (!a1) {
    a1 = [objc_allocWithZone(MEMORY[0x263F14BC0]) init];
  }
  *a2 = a1;

  return MEMORY[0x270F9A8A0]();
}

ValueMetadata *type metadata accessor for PKStrokePath()
{
  return &type metadata for PKStrokePath;
}

uint64_t initializeBufferWithCopyOfBuffer for PKStrokePath.InterpolatedSlice(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t initializeWithCopy for PKStrokePath.InterpolatedSlice(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  id v5 = v3;
  return a1;
}

uint64_t assignWithCopy for PKStrokePath.InterpolatedSlice(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  uint64_t v7 = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 8) = v7;
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
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

uint64_t assignWithTake for PKStrokePath.InterpolatedSlice(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for PKStrokePath.InterpolatedSlice(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PKStrokePath.InterpolatedSlice(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PKStrokePath.InterpolatedSlice()
{
  return &type metadata for PKStrokePath.InterpolatedSlice;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)__n128 result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for PKStrokePath.InterpolatedSlice.Stride(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for PKStrokePath.InterpolatedSlice.Stride(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)__n128 result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t getEnumTag for PKStrokePath.InterpolatedSlice.Stride(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t destructiveInjectEnumTag for PKStrokePath.InterpolatedSlice.Stride(uint64_t result, char a2)
{
  *(unsigned char *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for PKStrokePath.InterpolatedSlice.Stride()
{
  return &type metadata for PKStrokePath.InterpolatedSlice.Stride;
}

uint64_t specialized _copyCollectionToContiguousArray<A>(_:)(void *a1)
{
  uint64_t v2 = (uint64_t)[a1 sel_count];
  uint64_t result = (uint64_t)[a1 sel_count];
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t result = (uint64_t)[a1 sel_count];
    if ((v2 & 0x8000000000000000) == 0 && result >= v2)
    {
      if (v2)
      {
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<PKStrokePoint>);
        int v4 = (void *)swift_allocObject();
        int64_t v5 = _swift_stdlib_malloc_size(v4);
        uint64_t v6 = v5 - 32;
        if (v5 < 32) {
          uint64_t v6 = v5 - 25;
        }
        v4[2] = v2;
        v4[3] = 2 * (v6 >> 3);
        uint64_t v7 = specialized Sequence._copySequenceContents(initializing:)(v8, (uint64_t)(v4 + 4), v2, a1);

        if (v7 == v2) {
          return (uint64_t)v4;
        }
        __break(1u);
      }
      return MEMORY[0x263F8EE78];
    }
  }
  __break(1u);
  return result;
}

id static PKEraserTool._unconditionallyBridgeFromObjectiveC(_:)@<X0>(id result@<X0>, id *a2@<X8>)
{
  if (result)
  {
    *a2 = result;
    return result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

PKEraserTool __swiftcall PKEraserTool._bridgeToObjectiveC()()
{
  return (PKEraserTool)*v0;
}

PencilKit::PKEraserTool __swiftcall PKEraserTool.init(_:)(PencilKit::PKEraserTool::EraserType a1)
{
  uint64_t v2 = v1;
  result.tool.super.super.Class isa = (Class)[objc_allocWithZone(MEMORY[0x263F14B08]) sel_initWithEraserType_:*(unsigned __int8 *)a1];
  v2->tool.super.super.Class isa = result.tool.super.super.isa;
  return result;
}

BOOL static PKEraserTool.EraserType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void PKEraserTool.EraserType.hash(into:)()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int PKEraserTool.EraserType.hashValue.getter()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance PKEraserTool.EraserType(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance PKEraserTool.EraserType()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance PKEraserTool.EraserType()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance PKEraserTool.EraserType()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

id PKEraserTool.eraserType.getter@<X0>(char *a1@<X8>)
{
  id result = [*v1 sel_eraserType];
  if (!result)
  {
    char v4 = 0;
LABEL_5:
    *a1 = v4;
    return result;
  }
  if (result == (id)1)
  {
    char v4 = 1;
    goto LABEL_5;
  }
  id result = (id)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

id key path getter for PKEraserTool.eraserType : PKEraserTool@<X0>(id *a1@<X0>, char *a2@<X8>)
{
  id result = [*a1 sel_eraserType];
  if (!result)
  {
    char v4 = 0;
LABEL_5:
    *a2 = v4;
    return result;
  }
  if (result == (id)1)
  {
    char v4 = 1;
    goto LABEL_5;
  }
  id result = (id)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void PKEraserTool.eraserType.setter(unsigned __int8 *a1)
{
  id v2 = [objc_allocWithZone(MEMORY[0x263F14B08]) initWithEraserType:*a1];

  id *v1 = v2;
}

void (*PKEraserTool.eraserType.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  id v3 = [*v1 sel_eraserType];
  if (!v3)
  {
    char v4 = 0;
LABEL_5:
    *(unsigned char *)(a1 + 8) = v4;
    return PKEraserTool.eraserType.modify;
  }
  if (v3 == (id)1)
  {
    char v4 = 1;
    goto LABEL_5;
  }
  id result = (void (*)(uint64_t))_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void PKEraserTool.eraserType.modify(uint64_t a1)
{
  Swift::UInt v1 = *(id **)a1;
  id v2 = [objc_allocWithZone(MEMORY[0x263F14B08]) initWithEraserType:*(unsigned __int8 *)(a1 + 8)];

  id *v1 = v2;
}

uint64_t static PKEraserTool.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)() & 1;
}

unint64_t type metadata accessor for NSObject()
{
  unint64_t result = lazy cache variable for type metadata for NSObject;
  if (!lazy cache variable for type metadata for NSObject)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for NSObject);
  }
  return result;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance PKEraserTool()
{
  return static NSObject.== infix(_:_:)() & 1;
}

id static PKEraserTool._forceBridgeFromObjectiveC(_:result:)(void *a1, id *a2)
{
  *a2 = a1;

  return a1;
}

uint64_t static PKEraserTool._conditionallyBridgeFromObjectiveC(_:result:)(void *a1, id *a2)
{
  *a2 = a1;
  id v4 = a1;
  return 1;
}

unint64_t lazy protocol witness table accessor for type PKEraserTool.EraserType and conformance PKEraserTool.EraserType()
{
  unint64_t result = lazy protocol witness table cache variable for type PKEraserTool.EraserType and conformance PKEraserTool.EraserType;
  if (!lazy protocol witness table cache variable for type PKEraserTool.EraserType and conformance PKEraserTool.EraserType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PKEraserTool.EraserType and conformance PKEraserTool.EraserType);
  }
  return result;
}

id protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance PKEraserTool@<X0>(id result@<X0>, id *a2@<X8>)
{
  if (result)
  {
    *a2 = result;
    return result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_22B2B3CA4(unsigned __int8 *a1, id *a2)
{
  id v3 = [objc_allocWithZone(MEMORY[0x263F14B08]) initWithEraserType:*a1];

  *a2 = v3;
}

ValueMetadata *type metadata accessor for PKEraserTool()
{
  return &type metadata for PKEraserTool;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PKEraserTool.EraserType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for PKEraserTool.EraserType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x22B2B3E6CLL);
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

uint64_t getEnumTag for PKEraserTool.EraserType(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *destructiveInjectEnumTag for PKEraserTool.EraserType(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PKEraserTool.EraserType()
{
  return &type metadata for PKEraserTool.EraserType;
}

PencilKit::PKStroke __swiftcall PKStroke.init(ink:path:transform:mask:)(PencilKit::PKInk ink, PencilKit::PKStrokePath path, CGAffineTransform *transform, UIBezierPath_optional mask)
{
  Class isa = mask.value.super.isa;
  unsigned int v6 = v4;
  long long v13 = *(_OWORD *)&transform->c;
  CGFloat tx = transform->tx;
  CGFloat ty = transform->ty;
  uint64_t v9 = *(void **)ink.ink.super.isa;
  int64_t v10 = *(void **)path.strokeData.super.isa;
  v14[0] = *(_OWORD *)&transform->a;
  v14[1] = v13;
  CGFloat v15 = tx;
  CGFloat v16 = ty;
  id v11 = [objc_allocWithZone(MEMORY[0x263F14BB0]) initWithInk:v9 strokePath:v10 transform:v14 mask:mask.value.super.isa];

  *unsigned int v6 = v11;
  return result;
}

void PKStroke.ink.getter(void *a1@<X8>)
{
  id v3 = [*v1 sel_ink];
  if (!v3)
  {
    id v4 = [self blackColor];
    uint64_t v5 = (void *)MEMORY[0x230F44590](0xD000000000000011, 0x800000022B2B9530);
    id v3 = [objc_allocWithZone(MEMORY[0x263F14B48]) initWithInkType:v5 color:v4];
  }
  *a1 = v3;
}

void key path getter for PKStroke.ink : PKStroke(id *a1@<X0>, void *a2@<X8>)
{
  id v3 = *a1;
  id v4 = [v3 sel_ink];
  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    id v6 = [self blackColor];
    BOOL v7 = (void *)MEMORY[0x230F44590](0xD000000000000011, 0x800000022B2B9530);
    id v5 = [objc_allocWithZone(MEMORY[0x263F14B48]) initWithInkType:v7 color:v6];

    id v3 = v6;
  }

  *a2 = v5;
}

void PKStroke.ink.setter(void **a1)
{
  int v2 = *a1;
  id v3 = *v1;
  id v4 = [*v1 sel_path];
  if (!v4) {
    id v4 = [objc_allocWithZone(MEMORY[0x263F14BC0]) init];
  }
  [v3 sel_transform];
  long long v10 = v13;
  long long v11 = v12;
  uint64_t v5 = v14;
  uint64_t v6 = v15;
  id v7 = [v3 sel_mask];
  id v8 = objc_allocWithZone(MEMORY[0x263F14BB0]);
  long long v12 = v11;
  long long v13 = v10;
  uint64_t v14 = v5;
  uint64_t v15 = v6;
  id v9 = [v8 initInk_strokePath_transform_mask_:v2, v4, &v12, v7];

  id *v1 = v9;
}

double PKStroke.transform.getter@<D0>(_OWORD *a1@<X8>)
{
  [*v1 sel_transform];
  double result = *(double *)&v4;
  *a1 = v4;
  a1[1] = v5;
  a1[2] = v6;
  return result;
}

id PKStroke.mask.getter()
{
  id v1 = [*v0 sel_mask];

  return v1;
}

void (*PKStroke.ink.modify(void *a1))(char **a1, char a2)
{
  id v3 = malloc(0x40uLL);
  *a1 = v3;
  long long v4 = v3 + 6;
  v3[7] = v1;
  id v5 = [*v1 sel_ink];
  if (!v5)
  {
    id v6 = [self blackColor];
    id v7 = (void *)MEMORY[0x230F44590](0xD000000000000011, 0x800000022B2B9530);
    id v5 = [objc_allocWithZone(MEMORY[0x263F14B48]) initWithInkType:v7 color:v6];
  }
  void *v4 = v5;
  return PKStroke.ink.modify;
}

void PKStroke.ink.modify(char **a1, char a2)
{
  int v2 = *a1;
  id v3 = (void *)*((void *)*a1 + 6);
  long long v4 = (void *)**((void **)*a1 + 7);
  if (a2)
  {
    id v5 = v3;
    id v6 = [v4 sel_path];
    if (!v6) {
      id v6 = [objc_allocWithZone(MEMORY[0x263F14BC0]) sel_init];
    }
    id v7 = (void *)*((void *)v2 + 7);
    [v4 sel_transform];
    id v8 = [v4 sel_mask];
    id v9 = objc_allocWithZone(MEMORY[0x263F14BB0]);
    *(void *)int v2 = v16;
    *(_OWORD *)(v2 + 8) = v17;
    *(_OWORD *)(v2 + 24) = v18;
    *((void *)v2 + 5) = v19;
    id v10 = [v9 initInk_strokePath_transform_mask_:v5, v6, v2, v8];

    *id v7 = v10;
  }
  else
  {
    id v11 = [*(*(id **)*a1 + 7) sel_path];
    if (!v11) {
      id v11 = [objc_allocWithZone(MEMORY[0x263F14BC0]) sel_init];
    }
    long long v12 = (void *)*((void *)v2 + 7);
    [v4 sel_transform];
    id v13 = [v4 sel_mask];
    id v14 = objc_allocWithZone(MEMORY[0x263F14BB0]);
    *(void *)int v2 = v16;
    *(_OWORD *)(v2 + 8) = v17;
    *(_OWORD *)(v2 + 24) = v18;
    *((void *)v2 + 5) = v19;
    id v15 = [v14 initInk_strokePath_transform_mask_:v3, v11, v2, v13];

    *long long v12 = v15;
  }

  free(v2);
}

void PKStroke.transform.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[3];
  uint64_t v6 = a1[4];
  uint64_t v7 = a1[5];
  id v8 = *v1;
  id v9 = [*v1 sel_ink];
  if (!v9)
  {
    id v10 = [self blackColor];
    id v11 = (void *)MEMORY[0x230F44590](0xD000000000000011, 0x800000022B2B9530);
    id v9 = [objc_allocWithZone(MEMORY[0x263F14B48]) initWithInkType:v11 color:v10];
  }
  id v12 = [v8 sel_path];
  if (!v12) {
    id v12 = [objc_allocWithZone(MEMORY[0x263F14BC0]) init];
  }
  id v13 = [v8 sel_mask];
  v15[0] = v2;
  v15[1] = v3;
  v15[2] = v4;
  v15[3] = v5;
  v15[4] = v6;
  v15[5] = v7;
  id v14 = [objc_allocWithZone(MEMORY[0x263F14BB0]) initWithInk:v9 strokePath:v12 transform:v15 mask:v13];

  id *v1 = v14;
}

void (*PKStroke.transform.modify(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x98uLL);
  *a1 = v3;
  v3[18] = v1;
  [*v1 sel_transform];
  *((_OWORD *)v3 + 6) = v5;
  *((_OWORD *)v3 + 7) = v6;
  *((_OWORD *)v3 + 8) = v7;
  return PKStroke.transform.modify;
}

void PKStroke.transform.modify(uint64_t *a1, char a2)
{
  uint64_t v2 = (_OWORD *)*a1;
  if (a2) {
    uint64_t v3 = *a1;
  }
  else {
    uint64_t v3 = *a1 + 48;
  }
  long long v4 = v2[7];
  *(_OWORD *)uint64_t v3 = v2[6];
  *(_OWORD *)(v3 + 16) = v4;
  *(_OWORD *)(v3 + 32) = v2[8];
  PKStroke.transform.setter((uint64_t *)v3);

  free(v2);
}

id PKStroke.path.getter@<X0>(void *a1@<X8>)
{
  id result = [*v1 sel_path];
  if (!result) {
    id result = [objc_allocWithZone(MEMORY[0x263F14BC0]) sel_init];
  }
  *a1 = result;
  return result;
}

void key path getter for PKStroke.path : PKStroke(id *a1@<X0>, void *a2@<X8>)
{
  id v3 = *a1;
  id v4 = [v3 sel_path];
  if (!v4) {
    id v4 = [objc_allocWithZone(MEMORY[0x263F14BC0]) init];
  }

  *a2 = v4;
}

void PKStroke.path.setter(void **a1)
{
  uint64_t v2 = *a1;
  id v3 = *v1;
  id v4 = [*v1 sel_ink];
  if (!v4)
  {
    id v5 = [self blackColor];
    long long v6 = (void *)MEMORY[0x230F44590](0xD000000000000011, 0x800000022B2B9530);
    id v4 = [objc_allocWithZone(MEMORY[0x263F14B48]) initWithInkType:v6 color:v5];
  }
  [v3 sel_transform];
  long long v12 = v15;
  long long v13 = v14;
  uint64_t v7 = v16;
  uint64_t v8 = v17;
  id v9 = [v3 sel_mask];
  id v10 = objc_allocWithZone(MEMORY[0x263F14BB0]);
  long long v14 = v13;
  long long v15 = v12;
  uint64_t v16 = v7;
  uint64_t v17 = v8;
  id v11 = [v10 initWithInk:v4 strokePath:v2 transform:&v14 mask:v9];

  id *v1 = v11;
}

void (*PKStroke.path.modify(void *a1))(void **a1, char a2)
{
  a1[1] = v1;
  id v3 = [*v1 sel_path];
  if (!v3) {
    id v3 = [objc_allocWithZone(MEMORY[0x263F14BC0]) init];
  }
  *a1 = v3;
  return PKStroke.path.modify;
}

void PKStroke.path.modify(void **a1, char a2)
{
  uint64_t v2 = *a1;
  if (a2)
  {
    id v4 = *a1;
    id v3 = v2;
    PKStroke.path.setter(&v4);
  }
  else
  {
    id v4 = *a1;
    PKStroke.path.setter(&v4);
  }
}

void PKStroke.mask.setter(void *a1)
{
  id v3 = *v1;
  id v4 = [*v1 sel_ink];
  if (!v4)
  {
    id v5 = [self blackColor];
    long long v6 = (void *)MEMORY[0x230F44590](0xD000000000000011, 0x800000022B2B9530);
    id v4 = [objc_allocWithZone(MEMORY[0x263F14B48]) initWithInkType:v6 color:v5];
  }
  id v7 = [v3 sel_path];
  if (!v7) {
    id v7 = [objc_allocWithZone(MEMORY[0x263F14BC0]) init];
  }
  [v3 sel_transform];
  long long v12 = v15;
  long long v13 = v14;
  uint64_t v8 = v16;
  uint64_t v9 = v17;
  id v10 = objc_allocWithZone(MEMORY[0x263F14BB0]);
  long long v14 = v13;
  long long v15 = v12;
  uint64_t v16 = v8;
  uint64_t v17 = v9;
  id v11 = [v10 initWithInk:v4 strokePath:v7 transform:&v14 mask:a1];

  id *v1 = v11;
}

void (*PKStroke.mask.modify(void *a1))(void **a1, char a2)
{
  a1[1] = v1;
  *a1 = [*v1 sel_mask];
  return PKStroke.mask.modify;
}

void PKStroke.mask.modify(void **a1, char a2)
{
  uint64_t v2 = *a1;
  if (a2)
  {
    id v3 = v2;
    PKStroke.mask.setter(v2);
  }
  else
  {
    PKStroke.mask.setter(*a1);
  }
}

id PKStroke.renderBounds.getter()
{
  return [*v0 renderBounds];
}

char *PKStroke.maskedPathRanges.getter()
{
  id v1 = [*v0 sel_maskedPathRanges];
  type metadata accessor for PKFloatRange();
  unint64_t v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v2 >> 62) {
    goto LABEL_14;
  }
  uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v3)
  {
    while (1)
    {
      uint64_t v16 = MEMORY[0x263F8EE78];
      id result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3 & ~(v3 >> 63), 0);
      if (v3 < 0) {
        break;
      }
      uint64_t v5 = 0;
      uint64_t v6 = v16;
      while (1)
      {
        id v7 = (v2 & 0xC000000000000001) != 0 ? (id)MEMORY[0x230F44610](v5, v2) : *(id *)(v2 + 8 * v5 + 32);
        uint64_t v8 = v7;
        [v7 lowerBound];
        double v10 = v9;
        [v8 sel_upperBound];
        double v12 = v11;

        if (v10 > v12) {
          break;
        }
        unint64_t v14 = *(void *)(v16 + 16);
        unint64_t v13 = *(void *)(v16 + 24);
        if (v14 >= v13 >> 1) {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v13 > 1), v14 + 1, 1);
        }
        ++v5;
        *(void *)(v16 + 16) = v14 + 1;
        uint64_t v15 = v16 + 16 * v14;
        *(double *)(v15 + 32) = v10;
        *(double *)(v15 + 40) = v12;
        if (v3 == v5)
        {
          swift_bridgeObjectRelease();
          return (char *)v6;
        }
      }
      __break(1u);
LABEL_14:
      swift_bridgeObjectRetain();
      uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (!v3) {
        goto LABEL_15;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_15:
    swift_bridgeObjectRelease();
    return (char *)MEMORY[0x263F8EE78];
  }
  return result;
}

PKStroke __swiftcall PKStroke._bridgeToObjectiveC()()
{
  return (PKStroke)*v0;
}

id static PKStroke._forceBridgeFromObjectiveC(_:result:)(void *a1, id *a2)
{
  *a2 = a1;

  return a1;
}

uint64_t static PKStroke._conditionallyBridgeFromObjectiveC(_:result:)(void *a1, id *a2)
{
  *a2 = a1;
  id v4 = a1;
  return 1;
}

id static PKStroke._unconditionallyBridgeFromObjectiveC(_:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  if (a1)
  {
    *a2 = a1;
    return a1;
  }
  else
  {
    id result = (id)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

id protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance PKStroke@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  if (a1)
  {
    *a2 = a1;
    return a1;
  }
  else
  {
    id result = (id)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

unint64_t type metadata accessor for PKFloatRange()
{
  unint64_t result = lazy cache variable for type metadata for PKFloatRange;
  if (!lazy cache variable for type metadata for PKFloatRange)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for PKFloatRange);
  }
  return result;
}

char *specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(char *a1, int64_t a2, char a3)
{
  unint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

{
  char **v3;
  char *result;

  unint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

void sub_22B2B5124(void **a1)
{
  unint64_t v2 = *a1;
  id v1 = v2;
  PKStroke.ink.setter(&v2);
}

double sub_22B2B5160@<D0>(id *a1@<X0>, _OWORD *a2@<X8>)
{
  [*a1 sel_transform];
  double result = *(double *)&v4;
  *a2 = v4;
  a2[1] = v5;
  a2[2] = v6;
  return result;
}

void sub_22B2B51AC(uint64_t *a1)
{
}

void sub_22B2B51D4(void **a1)
{
  unint64_t v2 = *a1;
  id v1 = v2;
  PKStroke.path.setter(&v2);
}

id sub_22B2B5210@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = [*a1 sel_mask];
  *a2 = result;
  return result;
}

void sub_22B2B524C(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  PKStroke.mask.setter(v1);
}

ValueMetadata *type metadata accessor for PKStroke()
{
  return &type metadata for PKStroke;
}

char *specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<ClosedRange<CGFloat>>);
    double v10 = (char *)swift_allocObject();
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
    double v10 = (char *)MEMORY[0x263F8EE78];
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
  swift_release();
  return v10;
}

{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<PKStroke>);
    double v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    double v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

id static PKStrokePoint._unconditionallyBridgeFromObjectiveC(_:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  if (a1)
  {
    *a2 = a1;
    return a1;
  }
  else
  {
    id result = (id)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

id PKStrokePoint.init(location:timeOffset:size:opacity:force:azimuth:altitude:)@<X0>(void *a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>, double a6@<D4>, double a7@<D5>, double a8@<D6>, double a9@<D7>, uint64_t a10)
{
  id result = [objc_allocWithZone(MEMORY[0x263F14BC8]) initWithLocation:a2 timeOffset:a3 size:a4 opacity:a5 force:a6 azimuth:a7 altitude:a8];
  *a1 = result;
  return result;
}

id PKStrokePoint.location.getter()
{
  return [*v0 sel_location];
}

id PKStrokePoint.timeOffset.getter()
{
  return [*v0 sel_timeOffset];
}

id PKStrokePoint.size.getter()
{
  return [*v0 sel_size];
}

id PKStrokePoint.opacity.getter()
{
  return [*v0 sel_opacity];
}

id PKStrokePoint.azimuth.getter()
{
  return [*v0 azimuth];
}

id PKStrokePoint.force.getter()
{
  return [*v0 sel_force];
}

id PKStrokePoint.altitude.getter()
{
  return [*v0 sel_altitude];
}

PKStrokePoint __swiftcall PKStrokePoint._bridgeToObjectiveC()()
{
  return (PKStrokePoint)*v0;
}

id static PKStrokePoint._forceBridgeFromObjectiveC(_:result:)(void *a1, id *a2)
{
  *a2 = a1;

  return a1;
}

uint64_t static PKStrokePoint._conditionallyBridgeFromObjectiveC(_:result:)(void *a1, id *a2)
{
  *a2 = a1;
  id v4 = a1;
  return 1;
}

id protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance PKStrokePoint@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  if (a1)
  {
    *a2 = a1;
    return a1;
  }
  else
  {
    id result = (id)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

ValueMetadata *type metadata accessor for PKStrokePoint()
{
  return &type metadata for PKStrokePoint;
}

id static PKInkingTool._unconditionallyBridgeFromObjectiveC(_:)@<X0>(id result@<X0>, id *a2@<X8>)
{
  if (result)
  {
    *a2 = result;
    return result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

PKInkingTool __swiftcall PKInkingTool._bridgeToObjectiveC()()
{
  return (PKInkingTool)*v0;
}

void PKInkingTool.init(_:color:width:)(unsigned char *a1@<X0>, void *a2@<X1>, double a3@<X2>, char a4@<W3>, void *a5@<X8>)
{
  int v5 = *a1;
  unint64_t v6 = 0x800000022B2B9550;
  if (v5 != 1) {
    unint64_t v6 = 0x800000022B2B9570;
  }
  if (*a1) {
    unint64_t v7 = 0xD000000000000014;
  }
  else {
    unint64_t v7 = 0xD000000000000011;
  }
  if (v5) {
    unint64_t v8 = v6;
  }
  else {
    unint64_t v8 = 0x800000022B2B9530;
  }
  int64_t v11 = (void *)MEMORY[0x230F44590](v7, v8);
  swift_bridgeObjectRelease();
  if (a4)
  {
    unint64_t v13 = 0x800000022B2B9550;
    if (v5 != 1) {
      unint64_t v13 = 0x800000022B2B9570;
    }
    if (v5) {
      unint64_t v14 = 0xD000000000000014;
    }
    else {
      unint64_t v14 = 0xD000000000000011;
    }
    if (v5) {
      unint64_t v15 = v13;
    }
    else {
      unint64_t v15 = 0x800000022B2B9530;
    }
    uint64_t v16 = self;
    uint64_t v17 = (void *)MEMORY[0x230F44590](v14, v15);
    swift_bridgeObjectRelease();
    [v16 defaultWidthForInkType:v17];
    double v12 = v18;
  }
  else
  {
    double v12 = a3;
  }
  id v19 = [objc_allocWithZone(MEMORY[0x263F14B50]) initWithInkType:v11 color:a2 width:v12];

  *a5 = v19;
}

double PKInkingTool.InkType.defaultWidth.getter()
{
  int v1 = *v0;
  unint64_t v2 = 0x800000022B2B9550;
  if (v1 != 1) {
    unint64_t v2 = 0x800000022B2B9570;
  }
  if (*v0) {
    unint64_t v3 = 0xD000000000000014;
  }
  else {
    unint64_t v3 = 0xD000000000000011;
  }
  if (v1) {
    unint64_t v4 = v2;
  }
  else {
    unint64_t v4 = 0x800000022B2B9530;
  }
  int v5 = self;
  unint64_t v6 = (void *)MEMORY[0x230F44590](v3, v4);
  swift_bridgeObjectRelease();
  [v5 defaultWidthForInkType:v6];
  double v8 = v7;

  return v8;
}

PencilKit::PKInkingTool::InkType_optional __swiftcall PKInkingTool.InkType.init(rawValue:)(Swift::String rawValue)
{
  object = rawValue._object;
  v3._countAndFlagsBits = rawValue._countAndFlagsBits;
  unint64_t v4 = v1;
  v3._object = object;
  unint64_t v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of PKInkingTool.InkType.init(rawValue:), v3);
  result.value = swift_bridgeObjectRelease();
  char v7 = 3;
  if (v5 < 3) {
    char v7 = v5;
  }
  char *v4 = v7;
  return result;
}

unint64_t PKInkingTool.InkType.rawValue.getter()
{
  if (*v0) {
    return 0xD000000000000014;
  }
  else {
    return 0xD000000000000011;
  }
}

void PKInkingTool.InkType.validWidthRange.getter()
{
  int v1 = *v0;
  if (v1 == 1) {
    unint64_t v2 = 0x800000022B2B9550;
  }
  else {
    unint64_t v2 = 0x800000022B2B9570;
  }
  if (*v0) {
    unint64_t v3 = 0xD000000000000014;
  }
  else {
    unint64_t v3 = 0xD000000000000011;
  }
  if (*v0) {
    unint64_t v4 = v2;
  }
  else {
    unint64_t v4 = 0x800000022B2B9530;
  }
  unint64_t v5 = self;
  unint64_t v6 = (void *)MEMORY[0x230F44590](v3, v4);
  swift_bridgeObjectRelease();
  [v5 minimumWidthForInkType:v6];
  double v8 = v7;

  if (v1 == 1) {
    unint64_t v9 = 0x800000022B2B9550;
  }
  else {
    unint64_t v9 = 0x800000022B2B9570;
  }
  if (v1) {
    unint64_t v10 = 0xD000000000000014;
  }
  else {
    unint64_t v10 = 0xD000000000000011;
  }
  if (v1) {
    unint64_t v11 = v9;
  }
  else {
    unint64_t v11 = 0x800000022B2B9530;
  }
  double v12 = (void *)MEMORY[0x230F44590](v10, v11);
  swift_bridgeObjectRelease();
  [v5 maximumWidthForInkType:v12];
  double v14 = v13;

  if (v8 > v14) {
    __break(1u);
  }
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance PKInkingTool.InkType(char *a1, unsigned __int8 *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

uint64_t specialized == infix<A>(_:_:)(char a1, unsigned __int8 a2)
{
  unint64_t v2 = 0x800000022B2B9530;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v3 = 0x800000022B2B9550;
    }
    else {
      unint64_t v3 = 0x800000022B2B9570;
    }
    unint64_t v4 = 0xD000000000000014;
    int v5 = a2;
    if (a2)
    {
LABEL_6:
      if (v5 == 1) {
        unint64_t v2 = 0x800000022B2B9550;
      }
      else {
        unint64_t v2 = 0x800000022B2B9570;
      }
      if (v4 != 0xD000000000000014) {
        goto LABEL_15;
      }
      goto LABEL_13;
    }
  }
  else
  {
    unint64_t v4 = 0xD000000000000011;
    unint64_t v3 = 0x800000022B2B9530;
    int v5 = a2;
    if (a2) {
      goto LABEL_6;
    }
  }
  if (v4 != 0xD000000000000011)
  {
LABEL_15:
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    goto LABEL_16;
  }
LABEL_13:
  if (v3 != v2) {
    goto LABEL_15;
  }
  char v6 = 1;
LABEL_16:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v6 & 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance PKInkingTool.InkType()
{
  return specialized RawRepresentable<>.hashValue.getter();
}

Swift::Int specialized RawRepresentable<>.hashValue.getter()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance PKInkingTool.InkType()
{
  return specialized RawRepresentable<>.hash(into:)();
}

uint64_t specialized RawRepresentable<>.hash(into:)()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance PKInkingTool.InkType()
{
  return specialized RawRepresentable<>._rawHashValue(seed:)();
}

Swift::Int specialized RawRepresentable<>._rawHashValue(seed:)()
{
  return Hasher._finalize()();
}

PencilKit::PKInkingTool::InkType_optional protocol witness for RawRepresentable.init(rawValue:) in conformance PKInkingTool.InkType(Swift::String *a1)
{
  return PKInkingTool.InkType.init(rawValue:)(*a1);
}

unint64_t protocol witness for RawRepresentable.rawValue.getter in conformance PKInkingTool.InkType@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = PKInkingTool.InkType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

id PKInkingTool.color.getter()
{
  id v1 = [*v0 sel_color];

  return v1;
}

void PKInkingTool.color.setter(void *a1)
{
  id v3 = *v1;
  id v4 = [*v1 sel_inkType];
  v5._countAndFlagsBits = static String._unconditionallyBridgeFromObjectiveC(_:)();
  PKInkingTool.InkType.init(rawValue:)(v5);
  if (v12 == 3)
  {
    __break(1u);
  }
  else
  {

    unint64_t v6 = 0x800000022B2B9550;
    if (v12 != 1) {
      unint64_t v6 = 0x800000022B2B9570;
    }
    if (v12) {
      unint64_t v7 = 0xD000000000000014;
    }
    else {
      unint64_t v7 = 0xD000000000000011;
    }
    if (v12) {
      unint64_t v8 = v6;
    }
    else {
      unint64_t v8 = 0x800000022B2B9530;
    }
    unint64_t v9 = (void *)MEMORY[0x230F44590](v7, v8);
    swift_bridgeObjectRelease();
    [v3 sel_width];
    id v11 = [objc_allocWithZone(MEMORY[0x263F14B50]) initWithInkType:v9 color:a1 width:v10];

    id *v1 = v11;
  }
}

void PKInkingTool.inkType.getter(unsigned char *a1@<X8>)
{
  id v3 = [*v1 sel_inkType];
  v4._countAndFlagsBits = static String._unconditionallyBridgeFromObjectiveC(_:)();
  PKInkingTool.InkType.init(rawValue:)(v4);
  if (v5 == 3)
  {
    __break(1u);
  }
  else
  {

    *a1 = v5;
  }
}

id PKInkingTool.width.getter()
{
  return [*v0 sel_width];
}

void (*PKInkingTool.color.modify(void *a1))(void **a1, char a2)
{
  a1[1] = v1;
  *a1 = [*v1 sel_color];
  return PKInkingTool.color.modify;
}

void PKInkingTool.color.modify(void **a1, char a2)
{
  unint64_t v2 = *a1;
  if (a2)
  {
    id v3 = v2;
    PKInkingTool.color.setter(v3);
  }
  else
  {
    PKInkingTool.color.setter(v2);
  }
}

id static PKInkingTool.convertColor(_:from:to:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = [self convertColor:a1 fromUserInterfaceStyle:a2 to:a3];

  return v3;
}

void PKInkingTool.width.setter(double a1)
{
  id v3 = *v1;
  id v4 = [*v1 sel_inkType];
  v5._countAndFlagsBits = static String._unconditionallyBridgeFromObjectiveC(_:)();
  PKInkingTool.InkType.init(rawValue:)(v5);
  if (v12 == 3)
  {
    __break(1u);
  }
  else
  {

    unint64_t v6 = 0x800000022B2B9550;
    if (v12 != 1) {
      unint64_t v6 = 0x800000022B2B9570;
    }
    if (v12) {
      unint64_t v7 = 0xD000000000000014;
    }
    else {
      unint64_t v7 = 0xD000000000000011;
    }
    if (v12) {
      unint64_t v8 = v6;
    }
    else {
      unint64_t v8 = 0x800000022B2B9530;
    }
    unint64_t v9 = (void *)MEMORY[0x230F44590](v7, v8);
    swift_bridgeObjectRelease();
    id v10 = [v3 sel_color];
    id v11 = [objc_allocWithZone(MEMORY[0x263F14B50]) initWithInkType:v9 color:v10 width:a1];

    id *v1 = v11;
  }
}

void (*PKInkingTool.width.modify(void *a1))(double *a1)
{
  a1[1] = v1;
  [*v1 sel_width];
  *a1 = v3;
  return PKInkingTool.width.modify;
}

void PKInkingTool.width.modify(double *a1)
{
}

void key path getter for PKInkingTool.inkType : PKInkingTool(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id v3 = *a1;
  id v4 = [v3 sel_inkType];
  v5._countAndFlagsBits = static String._unconditionallyBridgeFromObjectiveC(_:)();
  PKInkingTool.InkType.init(rawValue:)(v5);
  if (v6 == 3)
  {
    __break(1u);
  }
  else
  {

    *a2 = v6;
  }
}

void PKInkingTool.inkType.setter(unsigned char *a1)
{
  int v2 = *a1;
  unint64_t v3 = 0x800000022B2B9550;
  if (v2 != 1) {
    unint64_t v3 = 0x800000022B2B9570;
  }
  if (*a1) {
    unint64_t v4 = 0xD000000000000014;
  }
  else {
    unint64_t v4 = 0xD000000000000011;
  }
  if (v2) {
    unint64_t v5 = v3;
  }
  else {
    unint64_t v5 = 0x800000022B2B9530;
  }
  char v6 = (void *)MEMORY[0x230F44590](v4, v5);
  swift_bridgeObjectRelease();
  id v7 = *v1;
  id v8 = [*v1 sel_color];
  [v7 sel_width];
  id v10 = [objc_allocWithZone(MEMORY[0x263F14B50]) initWithInkType:v6 color:v8 width:v9];

  id *v1 = v10;
}

char PKInkingTool.inkType.modify(uint64_t a1)
{
  *(void *)a1 = v1;
  id v3 = [*v1 sel_inkType];
  v4._countAndFlagsBits = static String._unconditionallyBridgeFromObjectiveC(_:)();
  LOBYTE(v5) = PKInkingTool.InkType.init(rawValue:)(v4);
  if (v7 == 3)
  {
    __break(1u);
  }
  else
  {

    *(unsigned char *)(a1 + 8) = v7;
    return (char)PKInkingTool.inkType.modify;
  }
  return v5;
}

void PKInkingTool.inkType.modify(uint64_t a1)
{
  unint64_t v1 = 0xD000000000000014;
  unint64_t v2 = 0x800000022B2B9550;
  if (*(unsigned char *)(a1 + 8) != 1) {
    unint64_t v2 = 0x800000022B2B9570;
  }
  if (*(unsigned char *)(a1 + 8))
  {
    unint64_t v3 = v2;
  }
  else
  {
    unint64_t v1 = 0xD000000000000011;
    unint64_t v3 = 0x800000022B2B9530;
  }
  Swift::String v4 = *(id **)a1;
  uint64_t v5 = (void *)MEMORY[0x230F44590](v1, v3);
  swift_bridgeObjectRelease();
  id v6 = *v4;
  id v7 = [*v4 sel_color];
  [v6 sel_width];
  id v9 = [objc_allocWithZone(MEMORY[0x263F14B50]) initWithInkType:v5 color:v7 width:v8];

  id *v4 = v9;
}

uint64_t static PKInkingTool.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)() & 1;
}

void PKInkingTool.init(ink:width:)(void *a1@<X0>, void *a2@<X8>, double a3@<D0>)
{
  Swift::String v4 = (void *)*a1;
  id v5 = [objc_allocWithZone(MEMORY[0x263F14B50]) initWithInk:*a1 width:a3];

  *a2 = v5;
}

void PKInkingTool.ink.getter(void *a1@<X8>)
{
  id v3 = [*v1 sel_ink];
  if (!v3)
  {
    id v4 = [self blackColor];
    id v5 = (void *)MEMORY[0x230F44590](0xD000000000000011, 0x800000022B2B9530);
    id v3 = [objc_allocWithZone(MEMORY[0x263F14B48]) initWithInkType:v5 color:v4];
  }
  *a1 = v3;
}

id static PKInkingTool._forceBridgeFromObjectiveC(_:result:)(void *a1, id *a2)
{
  *a2 = a1;

  return a1;
}

uint64_t static PKInkingTool._conditionallyBridgeFromObjectiveC(_:result:)(void *a1, id *a2)
{
  *a2 = a1;
  id v4 = a1;
  return 1;
}

unint64_t lazy protocol witness table accessor for type PKInkingTool.InkType and conformance PKInkingTool.InkType()
{
  unint64_t result = lazy protocol witness table cache variable for type PKInkingTool.InkType and conformance PKInkingTool.InkType;
  if (!lazy protocol witness table cache variable for type PKInkingTool.InkType and conformance PKInkingTool.InkType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PKInkingTool.InkType and conformance PKInkingTool.InkType);
  }
  return result;
}

id sub_22B2B6910@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = [*a1 sel_color];
  *a2 = result;
  return result;
}

void sub_22B2B694C(id *a1)
{
}

id sub_22B2B6978@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = [*a1 sel_width];
  *a2 = v4;
  return result;
}

void sub_22B2B69AC(double *a1)
{
}

void sub_22B2B69D8(char *a1)
{
  char v1 = *a1;
  PKInkingTool.inkType.setter(&v1);
}

ValueMetadata *type metadata accessor for PKInkingTool()
{
  return &type metadata for PKInkingTool;
}

uint64_t getEnumTagSinglePayload for PKInkingTool.InkType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for PKInkingTool.InkType(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *id result = a2 + 2;
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
        JUMPOUT(0x22B2B6B7CLL);
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
          *id result = a2 + 2;
        break;
    }
  }
  return result;
}

unsigned char *destructiveInjectEnumTag for PKInkingTool.InkType(unsigned char *result, char a2)
{
  *id result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PKInkingTool.InkType()
{
  return &type metadata for PKInkingTool.InkType;
}

PencilKit::PKDrawing __swiftcall PKDrawing.init()()
{
  char v1 = v0;
  result.drawing.super.Class isa = (Class)[objc_allocWithZone(MEMORY[0x263F14AE0]) sel_init];
  v1->drawing.super.Class isa = result.drawing.super.isa;
  return result;
}

uint64_t PKDrawing.init(data:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, void *a3@<X8>)
{
  id v7 = objc_allocWithZone(MEMORY[0x263F14AE0]);
  id v8 = specialized @nonobjc PKDrawing.init(data:)();
  uint64_t result = outlined consume of Data._Representation(a1, a2);
  if (!v3) {
    *a3 = v8;
  }
  return result;
}

uint64_t PKDrawing.dataRepresentation()()
{
  id v1 = [*v0 sel_dataRepresentation];
  uint64_t v2 = static Data._unconditionallyBridgeFromObjectiveC(_:)();

  return v2;
}

id PKDrawing.bounds.getter()
{
  return [*v0 bounds];
}

id PKDrawing.image(from:scale:)()
{
  id v1 = [*v0 imageFromRect:x0 scale:x1];

  return v1;
}

Swift::Void __swiftcall PKDrawing.transform(using:)(CGAffineTransform *using)
{
  uint64_t v2 = *v1;
  long long v3 = *(_OWORD *)&using->c;
  v6[0] = *(_OWORD *)&using->a;
  v6[1] = v3;
  v6[2] = *(_OWORD *)&using->tx;
  id v4 = [v2 drawingByApplyingTransform:v6];
  if (v4)
  {
    id v5 = v4;

    PencilKit::PKDrawing *v1 = v5;
  }
  else
  {
    __break(1u);
  }
}

PencilKit::PKDrawing __swiftcall PKDrawing.transformed(using:)(CGAffineTransform *using)
{
  long long v3 = v1;
  id v4 = *v2;
  long long v5 = *(_OWORD *)&using->c;
  v7[0] = *(_OWORD *)&using->a;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&using->tx;
  result.drawing.super.Class isa = (Class)[v4 drawingByApplyingTransform:v7];
  if (result.drawing.super.isa) {
    v3->drawing.super.Class isa = result.drawing.super.isa;
  }
  else {
    __break(1u);
  }
  return result;
}

Swift::Void __swiftcall PKDrawing.append(_:)(PencilKit::PKDrawing a1)
{
  id v2 = *v1;
  id v3 = [*v1 sel_drawingByAppendingDrawing_:*(void *)a1.drawing.super.isa];
  if (v3)
  {
    id v4 = v3;

    id *v1 = v4;
  }
  else
  {
    __break(1u);
  }
}

PKDrawing __swiftcall PKDrawing._bridgeToObjectiveC()()
{
  return (PKDrawing)*v0;
}

PencilKit::PKDrawing __swiftcall PKDrawing.appending(_:)(PencilKit::PKDrawing a1)
{
  id v3 = v1;
  result.drawing.super.Class isa = (Class)[*v2 sel_drawingByAppendingDrawing_:*(void *)a1.drawing.super.isa];
  if (!result.drawing.super.isa) {
    result.drawing.super.Class isa = (Class)[objc_allocWithZone(MEMORY[0x263F14AE0]) sel_init];
  }
  v3->drawing.super.Class isa = result.drawing.super.isa;
  return result;
}

uint64_t static PKDrawing._unconditionallyBridgeFromObjectiveC(_:)@<X0>(id a1@<X0>, void *a2@<X8>)
{
  if (!a1) {
    a1 = [objc_allocWithZone(MEMORY[0x263F14AE0]) init];
  }
  *a2 = a1;

  return MEMORY[0x270F9A8A0]();
}

uint64_t PKDrawing.init<A>(strokes:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v6 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388]();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a1, a2);
  Array.init<A>(_:)();
  id v8 = objc_allocWithZone(MEMORY[0x263F14AE0]);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v10 = [v8 sel_initWithStrokes_:isa];

  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, a2);
  *a3 = v10;
  return result;
}

uint64_t PKDrawing.strokes.getter()
{
  id v1 = [*v0 sel_strokes];
  uint64_t v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  int64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    uint64_t v10 = MEMORY[0x263F8EE78];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3, 0);
    uint64_t v4 = 0;
    uint64_t v5 = v10;
    do
    {
      unint64_t v6 = *(void *)(v10 + 16);
      unint64_t v7 = *(void *)(v10 + 24);
      id v8 = *(id *)(v2 + 8 * v4 + 32);
      if (v6 >= v7 >> 1) {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v7 > 1), v6 + 1, 1);
      }
      ++v4;
      *(void *)(v10 + 16) = v6 + 1;
      *(void *)(v10 + 8 * v6 + 32) = v8;
    }
    while (v3 != v4);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  return v5;
}

void key path setter for PKDrawing.strokes : PKDrawing(uint64_t a1, id *a2)
{
  id v3 = objc_allocWithZone(MEMORY[0x263F14AE0]);
  swift_bridgeObjectRetain();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v5 = [v3 initWithStrokes:isa];

  *a2 = v5;
}

void PKDrawing.strokes.setter()
{
  id v1 = objc_allocWithZone(MEMORY[0x263F14AE0]);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v3 = [v1 initWithStrokes:isa];

  id *v0 = v3;
}

void (*PKDrawing.strokes.modify(uint64_t *a1))(uint64_t a1, char a2)
{
  a1[1] = v1;
  *a1 = PKDrawing.strokes.getter();
  return PKDrawing.strokes.modify;
}

void PKDrawing.strokes.modify(uint64_t a1, char a2)
{
  id v4 = objc_allocWithZone(MEMORY[0x263F14AE0]);
  id v5 = *(id **)(a1 + 8);
  if (a2)
  {
    swift_bridgeObjectRetain();
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v7 = [v4 initWithStrokes:isa];

    id *v5 = v7;
    swift_bridgeObjectRelease();
  }
  else
  {
    Class v8 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v9 = [v4 initWithStrokes:v8];

    id *v5 = v9;
  }
}

uint64_t static PKDrawing.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)() & 1;
}

uint64_t PKDrawing.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  dispatch thunk of Decoder.singleValueContainer()();
  if (!v2)
  {
    __swift_project_boxed_opaque_existential_1(v10, v10[3]);
    lazy protocol witness table accessor for type Data and conformance Data();
    dispatch thunk of SingleValueDecodingContainer.decode<A>(_:)();
    id v5 = objc_allocWithZone(MEMORY[0x263F14AE0]);
    id v6 = specialized @nonobjc PKDrawing.init(data:)();
    outlined consume of Data._Representation(v8, v9);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
    *a2 = v6;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t PKDrawing.encode(to:)(void *a1)
{
  uint64_t v2 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  dispatch thunk of Encoder.singleValueContainer()();
  id v3 = [v2 dataRepresentation];
  uint64_t v4 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v6 = v5;

  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v8, v9);
  lazy protocol witness table accessor for type Data and conformance Data();
  dispatch thunk of SingleValueEncodingContainer.encode<A>(_:)();
  outlined consume of Data._Representation(v4, v6);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

uint64_t protocol witness for Decodable.init(from:) in conformance PKDrawing@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return PKDrawing.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance PKDrawing(void *a1)
{
  return PKDrawing.encode(to:)(a1);
}

id static PKDrawing._forceBridgeFromObjectiveC(_:result:)(void *a1, id *a2)
{
  *a2 = a1;

  return a1;
}

uint64_t static PKDrawing._conditionallyBridgeFromObjectiveC(_:result:)(void *a1, id *a2)
{
  *a2 = a1;
  id v4 = a1;
  return 1;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance PKDrawing@<X0>(id a1@<X0>, void *a2@<X8>)
{
  if (!a1) {
    a1 = [objc_allocWithZone(MEMORY[0x263F14AE0]) init];
  }
  *a2 = a1;

  return MEMORY[0x270F9A8A0]();
}

id specialized @nonobjc PKDrawing.init(data:)()
{
  v6[1] = *(id *)MEMORY[0x263EF8340];
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  v6[0] = 0;
  id v2 = [v0 initWithData:v6 error:nil];

  if (v2)
  {
    id v3 = v6[0];
  }
  else
  {
    id v4 = v6[0];
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  return v2;
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

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t lazy protocol witness table accessor for type Data and conformance Data()
{
  unint64_t result = lazy protocol witness table cache variable for type Data and conformance Data;
  if (!lazy protocol witness table cache variable for type Data and conformance Data)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Data and conformance Data);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type Data and conformance Data;
  if (!lazy protocol witness table cache variable for type Data and conformance Data)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Data and conformance Data);
  }
  return result;
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

uint64_t sub_22B2B7974@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = PKDrawing.strokes.getter();
  *a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for PKDrawing()
{
  return &type metadata for PKDrawing;
}

id static PKLassoTool._unconditionallyBridgeFromObjectiveC(_:)@<X0>(id result@<X0>, id *a2@<X8>)
{
  if (result)
  {
    *a2 = result;
    return result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

PKLassoTool __swiftcall PKLassoTool._bridgeToObjectiveC()()
{
  return (PKLassoTool)*v0;
}

PencilKit::PKLassoTool __swiftcall PKLassoTool.init()()
{
  uint64_t v1 = v0;
  result.tool.super.super.Class isa = (Class)[objc_allocWithZone(MEMORY[0x263F14B58]) sel_init];
  v1->tool.super.super.Class isa = result.tool.super.super.isa;
  return result;
}

uint64_t static PKLassoTool.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)() & 1;
}

id static PKLassoTool._forceBridgeFromObjectiveC(_:result:)(void *a1, id *a2)
{
  *a2 = a1;

  return a1;
}

uint64_t static PKLassoTool._conditionallyBridgeFromObjectiveC(_:result:)(void *a1, id *a2)
{
  *a2 = a1;
  id v4 = a1;
  return 1;
}

ValueMetadata *type metadata accessor for PKLassoTool()
{
  return &type metadata for PKLassoTool;
}

uint64_t PKToolPicker.selectedTool.getter@<X0>(uint64_t *a1@<X8>)
{
  id v3 = [v1 sel_selectedTool];
  self;
  uint64_t result = swift_dynamicCastObjCClass();
  if (result)
  {
    unint64_t v5 = &protocol witness table for PKInkingTool;
    unint64_t v6 = &type metadata for PKInkingTool;
LABEL_7:
    a1[3] = (uint64_t)v6;
    a1[4] = (uint64_t)v5;
    *a1 = result;
    return result;
  }

  id v7 = [v1 sel_selectedTool];
  self;
  uint64_t result = swift_dynamicCastObjCClass();
  if (result)
  {
    unint64_t v5 = &protocol witness table for PKEraserTool;
    unint64_t v6 = &type metadata for PKEraserTool;
    goto LABEL_7;
  }

  id v8 = [v1 sel_selectedTool];
  self;
  uint64_t result = swift_dynamicCastObjCClass();
  if (result)
  {
    unint64_t v5 = &protocol witness table for PKLassoTool;
    unint64_t v6 = &type metadata for PKLassoTool;
    goto LABEL_7;
  }

  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t PKToolPicker.selectedTool.setter(uint64_t a1)
{
  outlined init with copy of PKTool(a1, (uint64_t)v5);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PKTool);
  if (swift_dynamicCast()
    || (outlined init with copy of PKTool(a1, (uint64_t)v5), swift_dynamicCast())
    || (outlined init with copy of PKTool(a1, (uint64_t)v5), swift_dynamicCast()))
  {
    [v1 setSelectedTool:v4];

    return __swift_destroy_boxed_opaque_existential_1(a1);
  }
  else
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

void (*PKToolPicker.selectedTool.modify(uint64_t **a1))(uint64_t *a1, char a2)
{
  id v3 = (uint64_t *)malloc(0x58uLL);
  *a1 = v3;
  v3[10] = v1;
  PKToolPicker.selectedTool.getter(v3);
  return PKToolPicker.selectedTool.modify;
}

void PKToolPicker.selectedTool.modify(uint64_t *a1, char a2)
{
  uint64_t v2 = (void *)*a1;
  if (a2)
  {
    outlined init with copy of PKTool(*a1, (uint64_t)v2 + 40);
    PKToolPicker.selectedTool.setter((uint64_t)v2 + 40);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  }
  else
  {
    PKToolPicker.selectedTool.setter(*a1);
  }

  free(v2);
}

uint64_t sub_22B2B7E5C@<X0>(uint64_t *a1@<X8>)
{
  return PKToolPicker.selectedTool.getter(a1);
}

uint64_t sub_22B2B7E80(uint64_t a1)
{
  outlined init with copy of PKTool(a1, (uint64_t)v2);
  return PKToolPicker.selectedTool.setter((uint64_t)v2);
}

PencilKit::PKStrokePoint_optional __swiftcall PKStrokePath.InterpolatedSlice.next()()
{
  uint64_t v3 = v2;
  id v4 = v1;
  double v6 = *(double *)(v3 + 32);
  double v5 = *(double *)(v3 + 40);
  if (v6 >= v5)
  {
    id v7 = *(id *)v3;
    id v8 = [v7 interpolatedPointAt:v5];
    id v9 = v8;
    if (v6 <= v5 + 0.001)
    {
      if (v8)
      {

        void *v4 = v9;
        double v12 = v5 + 1.0;
        goto LABEL_8;
      }
    }
    else if (v8)
    {

      void *v4 = v9;
      id v15 = v7;
      char v10 = *(unsigned char *)(v3 + 16);
      uint64_t v13 = *(void *)(v3 + 8);
      char v14 = v10;
      PKStrokePath.parametricValue(_:offsetBy:)((uint64_t)&v13, v5);
LABEL_8:
      *(double *)(v3 + 40) = v12;
      goto LABEL_10;
    }
    v0 = (objc_class *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    goto LABEL_10;
  }
  void *v1 = 0;
LABEL_10:
  result.value.strokePoint.super.Class isa = v0;
  result.is_nil = v11;
  return result;
}

unint64_t lazy protocol witness table accessor for type PKStrokePath.InterpolatedSlice and conformance PKStrokePath.InterpolatedSlice()
{
  unint64_t result = lazy protocol witness table cache variable for type PKStrokePath.InterpolatedSlice and conformance PKStrokePath.InterpolatedSlice;
  if (!lazy protocol witness table cache variable for type PKStrokePath.InterpolatedSlice and conformance PKStrokePath.InterpolatedSlice)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PKStrokePath.InterpolatedSlice and conformance PKStrokePath.InterpolatedSlice);
  }
  return result;
}

double protocol witness for Sequence.makeIterator() in conformance PKStrokePath.InterpolatedSlice@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 8);
  char v3 = *(unsigned char *)(v1 + 16);
  double result = *(double *)(v1 + 40);
  *(void *)a1 = *(void *)v1;
  *(void *)(a1 + 8) = v2;
  *(unsigned char *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(v1 + 24);
  *(double *)(a1 + 40) = result;
  return result;
}

uint64_t protocol witness for Sequence.underestimatedCount.getter in conformance PKStrokePath.InterpolatedSlice()
{
  return 0;
}

uint64_t protocol witness for Sequence._copyToContiguousArray() in conformance PKStrokePath.InterpolatedSlice()
{
  long long v1 = v0[1];
  v4[0] = *v0;
  v4[1] = v1;
  v4[2] = v0[2];
  uint64_t v2 = specialized _copySequenceToContiguousArray<A>(_:)((uint64_t)v4);
  outlined release of PKStrokePath.InterpolatedSlice((id *)v4);
  return v2;
}

uint64_t protocol witness for Sequence._copyContents(initializing:) in conformance PKStrokePath.InterpolatedSlice(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return specialized Sequence._copySequenceContents(initializing:)(a1, a2, a3);
}

uint64_t specialized Sequence._copySequenceContents(initializing:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = (id *)v3;
  if (!a2)
  {
    a3 = 0;
    long long v12 = *(_OWORD *)(v3 + 16);
    *(_OWORD *)a1 = *(_OWORD *)v3;
    *(_OWORD *)(a1 + 16) = v12;
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(v3 + 32);
    return a3;
  }
  double v6 = *(double *)(v3 + 32);
  double v5 = *(double *)(v3 + 40);
  uint64_t v7 = *(void *)(v3 + 24);
  int v8 = *(unsigned __int8 *)(v3 + 16);
  id v10 = *(id *)v3;
  double v9 = *(double *)(v3 + 8);
  if (!a3)
  {
LABEL_29:
    *(void *)a1 = v10;
    *(double *)(a1 + 8) = v9;
    *(unsigned char *)(a1 + 16) = v8;
    *(void *)(a1 + 24) = v7;
    *(double *)(a1 + 32) = v6;
    *(double *)(a1 + 40) = v5;
    return a3;
  }
  if (a3 < 0) {
    goto LABEL_33;
  }
  uint64_t v29 = a1;
  double v30 = *(double *)(v3 + 8);
  if (v6 < v5)
  {
    uint64_t v11 = 0;
LABEL_27:
    *(void *)uint64_t v29 = v10;
    *(double *)(v29 + 8) = v30;
    *(unsigned char *)(v29 + 16) = v8;
    *(void *)(v29 + 24) = v7;
    *(double *)(v29 + 32) = v6;
    a3 = v11;
    *(double *)(v29 + 40) = v5;
    return a3;
  }
  uint64_t v13 = a2;
  uint64_t v11 = 0;
  double v14 = v9;
  uint64_t v26 = a3;
  uint64_t v32 = a3 - 1;
  id v15 = (SEL *)&property descriptor for PKDrawing.strokes;
  int v31 = v8;
  v28 = v4;
  while (1)
  {
    id v16 = v10;
    id v17 = [v16 v15[15] v5];
    id v18 = v17;
    if (v6 <= v5 + 0.001)
    {
      if (!v17) {
        goto LABEL_34;
      }
      outlined release of PKStrokePath.InterpolatedSlice(v4);
      double v5 = v5 + 1.0;
      goto LABEL_25;
    }
    if (!v17) {
      goto LABEL_34;
    }

    if (!v31)
    {
      [v16 parametricValue:v5 offsetByDistance:v14];
      double v5 = v20;
      LOBYTE(v8) = 0;
      goto LABEL_25;
    }
    if (v31 == 1)
    {
      [v16 parametricValue:v5 offsetByTime:v14];
      double v5 = v19;
      LOBYTE(v8) = 1;
      goto LABEL_25;
    }
    id v21 = v16;
    int64_t v22 = (int64_t)[v21 count];
    if (((unint64_t)objc_msgSend(v21, sel_count) & 0x8000000000000000) != 0) {
      break;
    }
    v23 = v10;
    id v24 = [v21 (SEL)0x264890E18];

    if (v22 < 0 || (uint64_t)v24 < v22) {
      goto LABEL_32;
    }
    if (v5 + v14 >= (double)(v22 - 1)) {
      double v5 = (double)(v22 - 1);
    }
    else {
      double v5 = v5 + v14;
    }
    LOBYTE(v8) = 2;
    if (v5 < 0.0) {
      double v5 = 0.0;
    }
    id v10 = v23;
    id v15 = (SEL *)&property descriptor for PKDrawing.strokes;
    uint64_t v13 = a2;
    id v4 = v28;
LABEL_25:
    *(void *)(v13 + 8 * v11) = v18;
    if (v32 == v11)
    {
      a3 = v26;
      a1 = v29;
      double v9 = v30;
      LOBYTE(v8) = v31;
      goto LABEL_29;
    }
    ++v11;
    if (v6 < v5) {
      goto LABEL_27;
    }
  }
  __break(1u);
LABEL_32:
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

id *outlined release of PKStrokePath.InterpolatedSlice(id *a1)
{
  return a1;
}

uint64_t specialized Sequence._copySequenceContents(initializing:)(void *a1, uint64_t a2, uint64_t a3, id a4)
{
  if (!a2)
  {
    uint64_t v8 = 0;
    goto LABEL_12;
  }
  if (!a3)
  {
LABEL_11:
    uint64_t v8 = a3;
    goto LABEL_12;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = 0;
    if (objc_msgSend(a4, sel_count))
    {
      do
      {
        id v9 = [a4 objectAtIndexedSubscript:v8];
        if (!v9) {
          goto LABEL_15;
        }
        id v10 = v9;
        if (v8 >= (uint64_t)objc_msgSend(a4, sel_count))
        {
          __break(1u);
          goto LABEL_14;
        }
        *(void *)(a2 + 8 * v8) = v10;
        if (a3 - 1 == v8) {
          goto LABEL_11;
        }
      }
      while ((id)++v8 != [a4 count]);
    }
LABEL_12:
    *a1 = a4;
    a1[1] = v8;
    return v8;
  }
LABEL_14:
  __break(1u);
LABEL_15:
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized _copySequenceToContiguousArray<A>(_:)(uint64_t a1)
{
  double v2 = *(double *)(a1 + 32);
  double v1 = *(double *)(a1 + 40);
  uint64_t v3 = (void *)MEMORY[0x263F8EE78];
  if (v2 >= v1)
  {
    outlined init with take of PKStrokePath.InterpolatedSlice.Stride(a1 + 8, (uint64_t)v32);
    id v6 = *(id *)a1;
    outlined retain of PKStrokePath.InterpolatedSlice((id *)a1);
    uint64_t v4 = 0;
    uint64_t v7 = v3 + 4;
    uint64_t v8 = (SEL *)&property descriptor for PKDrawing.strokes;
    while (1)
    {
      id v9 = v6;
      id v10 = [v9 interpolatedPointAt:v1];
      id v11 = v10;
      if (v2 <= v1 + 0.001)
      {
        if (!v10) {
          goto LABEL_46;
        }
        outlined release of PKStrokePath.InterpolatedSlice((id *)a1);
        double v1 = v1 + 1.0;
      }
      else
      {
        if (!v10) {
          goto LABEL_46;
        }

        outlined init with take of PKStrokePath.InterpolatedSlice.Stride((uint64_t)v32, (uint64_t)&v33);
        if (!v34)
        {
          [v9 parametricValue:v1 offsetByDistance:v33];
          goto LABEL_12;
        }
        if (v34 == 1)
        {
          [v9 parametricValue:v1 offsetByTime:v33];
LABEL_12:
          double v1 = v12;
          goto LABEL_13;
        }
        double v24 = v33;
        id v25 = v9;
        int64_t v26 = (int64_t)[v25 v8[16]];
        if (((unint64_t)[v25 v8[16]] & 0x8000000000000000) != 0) {
          goto LABEL_43;
        }
        id v27 = [v25 v8[16]];

        if (v26 < 0 || (uint64_t)v27 < v26) {
          goto LABEL_44;
        }
        if (v1 + v24 >= (double)(v26 - 1)) {
          double v1 = (double)(v26 - 1);
        }
        else {
          double v1 = v1 + v24;
        }
        uint64_t v8 = (SEL *)&property descriptor for PKDrawing.strokes;
        if (v1 < 0.0) {
          double v1 = 0.0;
        }
      }
LABEL_13:
      if (!v4)
      {
        unint64_t v13 = v3[3];
        if ((uint64_t)((v13 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_42;
        }
        int64_t v14 = v13 & 0xFFFFFFFFFFFFFFFELL;
        if (v14 <= 1) {
          uint64_t v15 = 1;
        }
        else {
          uint64_t v15 = v14;
        }
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<PKStrokePoint>);
        id v16 = (void *)swift_allocObject();
        int64_t v17 = _swift_stdlib_malloc_size(v16);
        uint64_t v18 = v17 - 32;
        if (v17 < 32) {
          uint64_t v18 = v17 - 25;
        }
        uint64_t v19 = v18 >> 3;
        v16[2] = v15;
        v16[3] = 2 * (v18 >> 3);
        unint64_t v20 = (unint64_t)(v16 + 4);
        uint64_t v21 = v3[3] >> 1;
        if (v3[2])
        {
          int64_t v22 = v3 + 4;
          if (v16 != v3 || v20 >= (unint64_t)v22 + 8 * v21) {
            memmove(v16 + 4, v22, 8 * v21);
          }
          v3[2] = 0;
        }
        uint64_t v7 = (void *)(v20 + 8 * v21);
        uint64_t v4 = (v19 & 0x7FFFFFFFFFFFFFFFLL) - v21;
        swift_release();
        uint64_t v3 = v16;
        uint64_t v8 = (SEL *)&property descriptor for PKDrawing.strokes;
      }
      BOOL v23 = __OFSUB__(v4--, 1);
      if (v23)
      {
        __break(1u);
LABEL_42:
        __break(1u);
LABEL_43:
        __break(1u);
LABEL_44:
        __break(1u);
LABEL_45:
        __break(1u);
LABEL_46:
        uint64_t result = _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
        return result;
      }
      *v7++ = v11;
      if (v2 < v1)
      {

        goto LABEL_37;
      }
    }
  }
  uint64_t v4 = 0;
LABEL_37:
  unint64_t v28 = v3[3];
  if (v28 >= 2)
  {
    unint64_t v29 = v28 >> 1;
    BOOL v23 = __OFSUB__(v29, v4);
    uint64_t v30 = v29 - v4;
    if (v23) {
      goto LABEL_45;
    }
    v3[2] = v30;
  }
  return (uint64_t)v3;
}

uint64_t outlined init with take of PKStrokePath.InterpolatedSlice.Stride(uint64_t a1, uint64_t a2)
{
  return a2;
}

id *outlined retain of PKStrokePath.InterpolatedSlice(id *a1)
{
  id v2 = *a1;
  return a1;
}

id static PKInk._unconditionallyBridgeFromObjectiveC(_:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  if (a1)
  {
    id v3 = a1;
  }
  else
  {
    id v4 = [self blackColor];
    double v5 = (void *)MEMORY[0x230F44590](0xD000000000000011, 0x800000022B2B9530);
    id v3 = [objc_allocWithZone(MEMORY[0x263F14B48]) initWithInkType:v5 color:v4];

    a1 = 0;
  }
  *a2 = v3;

  return a1;
}

PencilKit::PKInk __swiftcall PKInk.init(_:color:)(PencilKit::PKInkingTool::InkType _, UIColor color)
{
  id v3 = v2;
  int v4 = *(unsigned __int8 *)_;
  unint64_t v5 = 0x800000022B2B9550;
  if (v4 != 1) {
    unint64_t v5 = 0x800000022B2B9570;
  }
  if (*(unsigned char *)_) {
    unint64_t v6 = 0xD000000000000014;
  }
  else {
    unint64_t v6 = 0xD000000000000011;
  }
  if (v4) {
    unint64_t v7 = v5;
  }
  else {
    unint64_t v7 = 0x800000022B2B9530;
  }
  id v9 = (void *)MEMORY[0x230F44590](v6, v7);
  swift_bridgeObjectRelease();
  id v10 = [objc_allocWithZone(MEMORY[0x263F14B48]) initWithInkType:v9 color:color.super.isa];

  *id v3 = v10;
  return result;
}

void PKInk.inkType.getter(unsigned char *a1@<X8>)
{
  id v3 = [*v1 sel_inkType];
  v4._countAndFlagsBits = static String._unconditionallyBridgeFromObjectiveC(_:)();
  PKInkingTool.InkType.init(rawValue:)(v4);
  if (v5 == 3)
  {
    __break(1u);
  }
  else
  {

    *a1 = v5;
  }
}

void PKInk.inkType.setter(unsigned char *a1)
{
  int v2 = *a1;
  unint64_t v3 = 0x800000022B2B9550;
  if (v2 != 1) {
    unint64_t v3 = 0x800000022B2B9570;
  }
  if (*a1) {
    unint64_t v4 = 0xD000000000000014;
  }
  else {
    unint64_t v4 = 0xD000000000000011;
  }
  if (v2) {
    unint64_t v5 = v3;
  }
  else {
    unint64_t v5 = 0x800000022B2B9530;
  }
  unint64_t v6 = (void *)MEMORY[0x230F44590](v4, v5);
  swift_bridgeObjectRelease();
  id v7 = *v1;
  id v8 = [*v1 sel_color];
  id v9 = [objc_allocWithZone(MEMORY[0x263F14B48]) initWithInkType:v6 color:v8];

  id *v1 = v9;
}

id PKInk.color.getter()
{
  id v1 = [*v0 sel_color];

  return v1;
}

char PKInk.inkType.modify(uint64_t a1)
{
  *(void *)a1 = v1;
  id v3 = [*v1 sel_inkType];
  v4._countAndFlagsBits = static String._unconditionallyBridgeFromObjectiveC(_:)();
  LOBYTE(v5) = PKInkingTool.InkType.init(rawValue:)(v4);
  if (v7 == 3)
  {
    __break(1u);
  }
  else
  {

    *(unsigned char *)(a1 + 8) = v7;
    return (char)PKInk.inkType.modify;
  }
  return v5;
}

void PKInk.inkType.modify(uint64_t a1)
{
  unint64_t v1 = 0xD000000000000014;
  unint64_t v2 = 0x800000022B2B9550;
  if (*(unsigned char *)(a1 + 8) != 1) {
    unint64_t v2 = 0x800000022B2B9570;
  }
  if (*(unsigned char *)(a1 + 8))
  {
    unint64_t v3 = v2;
  }
  else
  {
    unint64_t v1 = 0xD000000000000011;
    unint64_t v3 = 0x800000022B2B9530;
  }
  Swift::String v4 = *(id **)a1;
  uint64_t v5 = (void *)MEMORY[0x230F44590](v1, v3);
  swift_bridgeObjectRelease();
  id v6 = *v4;
  id v7 = [*v4 sel_color];
  id v8 = [objc_allocWithZone(MEMORY[0x263F14B48]) initWithInkType:v5 color:v7];

  id *v4 = v8;
}

void key path setter for PKInk.color : PKInk(id *a1, void **a2)
{
  unint64_t v3 = *a2;
  id v4 = *a1;
  id v5 = [v3 sel_inkType];
  id v6 = [objc_allocWithZone(MEMORY[0x263F14B48]) initWithInkType:v5 color:v4];

  *a2 = v6;
}

void PKInk.color.setter(void *a1)
{
  id v3 = *v1;
  id v4 = [*v1 sel_inkType];
  id v5 = [objc_allocWithZone(MEMORY[0x263F14B48]) initWithInkType:v4 color:a1];

  id *v1 = v5;
}

void (*PKInk.color.modify(void *a1))(uint64_t a1, char a2)
{
  a1[1] = v1;
  *a1 = [*v1 sel_color];
  return PKInk.color.modify;
}

void PKInk.color.modify(uint64_t a1, char a2)
{
  unint64_t v2 = *(void **)a1;
  id v3 = *(id **)(a1 + 8);
  id v4 = *v3;
  if (a2)
  {
    id v9 = v2;
    id v5 = [v4 sel_inkType];
    id v6 = [objc_allocWithZone(MEMORY[0x263F14B48]) initWithInkType:v5 color:v9];

    *id v3 = v6;
  }
  else
  {
    id v7 = [*v3 sel_inkType];
    id v8 = [objc_allocWithZone(MEMORY[0x263F14B48]) initWithInkType:v7 color:v2];

    *id v3 = v8;
  }
}

PKInk __swiftcall PKInk._bridgeToObjectiveC()()
{
  return (PKInk)*v0;
}

id static PKInk._forceBridgeFromObjectiveC(_:result:)(void *a1, id *a2)
{
  *a2 = a1;

  return a1;
}

uint64_t static PKInk._conditionallyBridgeFromObjectiveC(_:result:)(void *a1, id *a2)
{
  *a2 = a1;
  id v4 = a1;
  return 1;
}

void sub_22B2B9058(char *a1)
{
  char v1 = *a1;
  PKInk.inkType.setter(&v1);
}

id sub_22B2B9090@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = [*a1 sel_color];
  *a2 = result;
  return result;
}

ValueMetadata *type metadata accessor for PKInk()
{
  return &type metadata for PKInk;
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x270EEF840]();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)MEMORY[0x270EF0120]();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF0178]();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)MEMORY[0x270EF0998]();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t type metadata accessor for Date()
{
  return MEMORY[0x270EF0C40]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x270EF19B0]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x270F9D708]();
}

uint64_t Sequence.withContiguousStorageIfAvailable<A>(_:)()
{
  return MEMORY[0x270F9D968]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x270EF1B88]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t Array.init<A>(_:)()
{
  return MEMORY[0x270F9DD08]();
}

uint64_t static NSObject.== infix(_:_:)()
{
  return MEMORY[0x270FA1180]();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x270F9F080]();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return MEMORY[0x270F9F230](cases._rawValue, string._countAndFlagsBits, string._object);
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

uint64_t dispatch thunk of Decoder.singleValueContainer()()
{
  return MEMORY[0x270F9FD60]();
}

uint64_t dispatch thunk of Encoder.singleValueContainer()()
{
  return MEMORY[0x270F9FD88]();
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
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

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
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

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}