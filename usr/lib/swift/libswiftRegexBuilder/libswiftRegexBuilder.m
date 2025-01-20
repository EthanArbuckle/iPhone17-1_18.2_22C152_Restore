uint64_t BidirectionalCollection<>.wholeMatch<A, B>(of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return BidirectionalCollection<>.wholeMatch<A, B>(of:)(a1, a2, a3, a4, a5, a6, a7, MEMORY[0x263F901D8]);
}

uint64_t BidirectionalCollection<>.prefixMatch<A, B>(of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return BidirectionalCollection<>.wholeMatch<A, B>(of:)(a1, a2, a3, a4, a5, a6, a7, MEMORY[0x263F901E0]);
}

uint64_t BidirectionalCollection<>.wholeMatch<A, B>(of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void (*a8)(char *, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v13 = *(void *)(a5 - 8);
  v14 = (void (*)(void))MEMORY[0x270FA5388]();
  v16 = (char *)&v18 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14();
  a8(v16, a3, a5, a6, a7);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v16, a5);
}

uint64_t BidirectionalCollection<>.contains<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return BidirectionalCollection<>.contains<A>(_:)(a1, a2, a3, a4, a5, a6, MEMORY[0x263F901F0]);
}

uint64_t BidirectionalCollection<>.firstRange<A>(of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a4 - 8);
  v6 = (void (*)(void))MEMORY[0x270FA5388]();
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6();
  uint64_t v9 = BidirectionalCollection<>.firstRange<A>(of:)();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, a4);
  return v9;
}

uint64_t BidirectionalCollection<>.ranges<A>(of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a4 - 8);
  v6 = (void (*)(void))MEMORY[0x270FA5388]();
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6();
  uint64_t v9 = BidirectionalCollection<>.ranges<A>(of:)();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, a4);
  return v9;
}

uint64_t BidirectionalCollection<>.split<A>(maxSplits:omittingEmptySubsequences:separator:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = *(void *)(a6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388]();
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11(v8);
  uint64_t v12 = BidirectionalCollection<>.split<A>(separator:maxSplits:omittingEmptySubsequences:)();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, a6);
  return v12;
}

uint64_t BidirectionalCollection<>.starts<A>(with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return BidirectionalCollection<>.contains<A>(_:)(a1, a2, a3, a4, a5, a6, MEMORY[0x263F901E8]);
}

uint64_t BidirectionalCollection<>.contains<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(char *, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v12 = *(void *)(a4 - 8);
  uint64_t v13 = (void (*)(void))MEMORY[0x270FA5388]();
  uint64_t v15 = (char *)&v17 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13();
  LOBYTE(a7) = a7(v15, a3, a4, a5, a6);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, a4);
  return a7 & 1;
}

uint64_t BidirectionalCollection<>.trimmingPrefix<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a4 - 8);
  v6 = (void (*)(void))MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6();
  uint64_t v9 = BidirectionalCollection<>.trimmingPrefix<A>(_:)();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, a4);
  return v9;
}

uint64_t BidirectionalCollection<>.firstMatch<A, B>(of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = *(void *)(a5 - 8);
  uint64_t v7 = (void (*)(void))MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7();
  BidirectionalCollection<>.firstMatch<A, B>(of:)();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, a5);
}

uint64_t BidirectionalCollection<>.matches<A, B>(of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = *(void *)(a5 - 8);
  uint64_t v7 = (void (*)(void))MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7();
  uint64_t v10 = BidirectionalCollection<>.matches<A, B>(of:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, a5);
  return v10;
}

uint64_t RangeReplaceableCollection<>.trimPrefix<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a4 - 8);
  uint64_t v6 = (void (*)(void))MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6();
  RangeReplaceableCollection<>.trimPrefix<A>(_:)();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, a4);
}

uint64_t RangeReplaceableCollection<>.replacing<A, B>(with:subrange:maxReplacements:content:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, long long a11)
{
  uint64_t v19 = a8;
  uint64_t v18 = a7;
  long long v17 = a11;
  uint64_t v11 = *(void *)(a9 - 8);
  uint64_t v12 = MEMORY[0x270FA5388]();
  uint64_t v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15(v12);
  RangeReplaceableCollection<>.replacing<A, B>(_:with:subrange:maxReplacements:)();
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v14, a9);
}

uint64_t RangeReplaceableCollection<>.replacing<A, B>(with:maxReplacements:content:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v14[2] = a6;
  v14[1] = a5;
  uint64_t v8 = *(void *)(a7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388]();
  uint64_t v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12(v9);
  RangeReplaceableCollection<>.replacing<A, B>(_:with:maxReplacements:)();
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, a7);
}

uint64_t RangeReplaceableCollection<>.replace<A, B>(with:maxReplacements:content:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14 = a6;
  uint64_t v8 = *(void *)(a7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](a1);
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12(v9);
  RangeReplaceableCollection<>.replace<A, B>(_:with:maxReplacements:)();
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, a7);
}

uint64_t RangeReplaceableCollection<>.replacing<A, B, C>(subrange:maxReplacements:content:with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, long long a13)
{
  uint64_t v24 = a8;
  uint64_t v22 = a6;
  uint64_t v23 = a7;
  uint64_t v20 = a9;
  uint64_t v21 = a3;
  long long v19 = a13;
  uint64_t v13 = *(void *)(a11 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](a1);
  v16 = (char *)&v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17(v14);
  RangeReplaceableCollection<>.replacing<A, B, C>(_:subrange:maxReplacements:with:)();
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v16, a11);
}

uint64_t RangeReplaceableCollection<>.replacing<A, B, C>(maxReplacements:content:with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, long long a11)
{
  uint64_t v20 = a8;
  uint64_t v18 = a6;
  uint64_t v19 = a7;
  long long v17 = a11;
  uint64_t v11 = *(void *)(a9 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](a1);
  uint64_t v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15(v12);
  RangeReplaceableCollection<>.replacing<A, B, C>(_:maxReplacements:with:)();
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v14, a9);
}

uint64_t RangeReplaceableCollection<>.replace<A, B, C>(maxReplacements:content:with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, long long a11)
{
  uint64_t v19 = a8;
  uint64_t v18 = a7;
  long long v17 = a11;
  uint64_t v11 = *(void *)(a9 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](a1);
  uint64_t v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15(v12);
  RangeReplaceableCollection<>.replace<A, B, C>(_:maxReplacements:with:)();
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v14, a9);
}

uint64_t StringProtocol<>.split(separator:maxSplits:omittingEmptySubsequences:)()
{
  return MEMORY[0x270FA2C08]();
}

{
  return MEMORY[0x270FA2C10]();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance Anchor.Kind(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance Anchor.Kind()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance Anchor.Kind()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance Anchor.Kind()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t Anchor.regex.getter()
{
  uint64_t v1 = type metadata accessor for DSLTree.Atom.Assertion();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for _RegexFactory();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v0;
  unsigned __int8 v10 = v0[1];
  _RegexFactory.init()();
  switch(v9)
  {
    case 1:
      uint64_t v11 = (unsigned int *)MEMORY[0x263F901C0];
      goto LABEL_12;
    case 2:
      uint64_t v11 = (unsigned int *)MEMORY[0x263F90198];
      goto LABEL_12;
    case 3:
      uint64_t v11 = (unsigned int *)MEMORY[0x263F901C8];
      goto LABEL_12;
    case 4:
      uint64_t v12 = *(void (**)(char *, void, uint64_t))(v2 + 104);
      if (v10) {
        uint64_t v13 = (unsigned int *)MEMORY[0x263F901A8];
      }
      else {
        uint64_t v13 = (unsigned int *)MEMORY[0x263F90190];
      }
      goto LABEL_15;
    case 5:
      uint64_t v11 = (unsigned int *)MEMORY[0x263F90188];
      goto LABEL_12;
    case 6:
      uint64_t v11 = (unsigned int *)MEMORY[0x263F901D0];
      goto LABEL_12;
    case 7:
      uint64_t v12 = *(void (**)(char *, void, uint64_t))(v2 + 104);
      if (v10) {
        uint64_t v13 = (unsigned int *)MEMORY[0x263F901B8];
      }
      else {
        uint64_t v13 = (unsigned int *)MEMORY[0x263F901A0];
      }
LABEL_15:
      v12(v4, *v13, v1);
      break;
    default:
      uint64_t v11 = (unsigned int *)MEMORY[0x263F901B0];
LABEL_12:
      (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *v11, v1);
      break;
  }
  _RegexFactory.assertion<A>(_:)();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

void static Anchor.startOfSubject.getter(_WORD *a1@<X8>)
{
  *a1 = 0;
}

void static Anchor.endOfSubjectBeforeNewline.getter(_WORD *a1@<X8>)
{
  *a1 = 1;
}

void static Anchor.endOfSubject.getter(_WORD *a1@<X8>)
{
  *a1 = 2;
}

void static Anchor.firstMatchingPositionInSubject.getter(_WORD *a1@<X8>)
{
  *a1 = 3;
}

void static Anchor.textSegmentBoundary.getter(_WORD *a1@<X8>)
{
  *a1 = 4;
}

void static Anchor.startOfLine.getter(_WORD *a1@<X8>)
{
  *a1 = 5;
}

void static Anchor.endOfLine.getter(_WORD *a1@<X8>)
{
  *a1 = 6;
}

void static Anchor.wordBoundary.getter(_WORD *a1@<X8>)
{
  *a1 = 7;
}

void Anchor.inverted.getter(unsigned char *a1@<X8>)
{
  char v2 = v1[1];
  *a1 = *v1;
  a1[1] = (v2 & 1) == 0;
}

uint64_t (*Lookahead.regex.modify())()
{
  return Lookahead.regex.modify;
}

uint64_t Lookahead.init<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  return Lookahead.init<A>(_:)(a1, a2, a3, a4, MEMORY[0x263F900A8], a5);
}

uint64_t Lookahead.init<A>(_:)@<X0>(void (*a1)(uint64_t)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  return Lookahead.init<A>(_:)(a1, a2, a3, a4, MEMORY[0x263F900A8], a5);
}

uint64_t (*NegativeLookahead.regex.modify())()
{
  return Lookahead.regex.modify;
}

uint64_t NegativeLookahead.init<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  return Lookahead.init<A>(_:)(a1, a2, a3, a4, MEMORY[0x263F900B0], a5);
}

uint64_t Lookahead.init<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void (*a5)(uint64_t, uint64_t, uint64_t, uint64_t)@<X4>, uint64_t a6@<X8>)
{
  uint64_t v19 = a5;
  uint64_t v20 = a6;
  uint64_t v10 = type metadata accessor for _RegexFactory();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for Regex();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  long long v17 = (char *)&v19 - v16;
  _RegexFactory.init()();
  v19(a1, a2, a3, a4);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a3 - 8) + 8))(a1, a3);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v15 + 32))(v20, v17, v14);
}

uint64_t NegativeLookahead.init<A>(_:)@<X0>(void (*a1)(uint64_t)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  return Lookahead.init<A>(_:)(a1, a2, a3, a4, MEMORY[0x263F900B0], a5);
}

uint64_t Lookahead.init<A>(_:)@<X0>(void (*a1)(uint64_t)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, void (*a5)(char *, uint64_t, uint64_t, uint64_t)@<X5>, uint64_t a6@<X8>)
{
  uint64_t v23 = a4;
  uint64_t v24 = a5;
  uint64_t v22 = a1;
  uint64_t v25 = a6;
  uint64_t v8 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = type metadata accessor for _RegexFactory();
  uint64_t v11 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  uint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for Regex();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  long long v17 = (char *)&v20 - v16;
  uint64_t v18 = _RegexFactory.init()();
  v22(v18);
  v24(v10, a2, a3, v23);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, a3);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v21);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v15 + 32))(v25, v17, v14);
}

uint64_t static RegexComponentBuilder.buildBlock()()
{
  uint64_t v0 = type metadata accessor for _RegexFactory();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  _RegexFactory.init()();
  _RegexFactory.empty<A>()();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t static RegexComponentBuilder.buildPartialBlock<A>(first:)()
{
  return dispatch thunk of RegexComponent.regex.getter();
}

uint64_t CharacterClass.regex.getter()
{
  uint64_t v1 = type metadata accessor for _RegexFactory();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DSLTree.Atom.CharacterClass?);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for DSLTree.Atom.CharacterClass();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for CharacterClass();
  outlined init with copy of DSLTree.Atom.CharacterClass?(v0 + *(int *)(v12 + 20), (uint64_t)v7, &demangling cache variable for type metadata for DSLTree.Atom.CharacterClass?);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    outlined destroy of DSLTree.Atom.CharacterClass?((uint64_t)v7, &demangling cache variable for type metadata for DSLTree.Atom.CharacterClass?);
    _RegexFactory.init()();
    _RegexFactory.customCharacterClass<A>(_:)();
    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v7, v8);
    _RegexFactory.init()();
    _RegexFactory.characterClass<A>(_:)();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
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

uint64_t type metadata accessor for CharacterClass()
{
  uint64_t result = type metadata singleton initialization cache for CharacterClass;
  if (!type metadata singleton initialization cache for CharacterClass) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t CharacterClass.inverted.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v39 = a1;
  uint64_t v2 = type metadata accessor for DSLTree.CustomCharacterClass();
  uint64_t v36 = *(void *)(v2 - 8);
  v37 = (void (*)(uint64_t, char *, uint64_t))v2;
  MEMORY[0x270FA5388](v2);
  v4 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for CharacterClass();
  MEMORY[0x270FA5388](v5);
  v38 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DSLTree.Atom.CharacterClass?);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v34 - v11;
  uint64_t v13 = type metadata accessor for DSLTree.Atom.CharacterClass();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  v34 = (char *)&v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v34 - v17;
  uint64_t v19 = *(int *)(v5 + 20);
  uint64_t v35 = v1;
  outlined init with copy of DSLTree.Atom.CharacterClass?(v1 + v19, (uint64_t)v10, &demangling cache variable for type metadata for DSLTree.Atom.CharacterClass?);
  uint64_t v20 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48);
  if (v20(v10, 1, v13) == 1)
  {
    outlined destroy of DSLTree.Atom.CharacterClass?((uint64_t)v10, &demangling cache variable for type metadata for DSLTree.Atom.CharacterClass?);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, 1, 1, v13);
  }
  else
  {
    DSLTree.Atom.CharacterClass.inverted.getter();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v10, v13);
    if (v20(v12, 1, v13) != 1)
    {
      uint64_t v24 = *(void (**)(uint64_t, char *, uint64_t))(v14 + 32);
      v37 = v24;
      v24((uint64_t)v18, v12, v13);
      uint64_t v25 = v34;
      v24((uint64_t)v34, v18, v13);
      uint64_t v21 = (uint64_t)v38;
      uint64_t v26 = (uint64_t)&v38[*(int *)(v5 + 20)];
      uint64_t v36 = *(void *)(v14 + 56);
      ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v36)(v26, 1, 1, v13);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<DSLTree.CustomCharacterClass.Member>);
      uint64_t v35 = type metadata accessor for DSLTree.CustomCharacterClass.Member();
      uint64_t v27 = *(void *)(v35 - 8);
      unint64_t v28 = (*(unsigned __int8 *)(v27 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80);
      uint64_t v29 = swift_allocObject();
      *(_OWORD *)(v29 + 16) = xmmword_239953830;
      unint64_t v30 = v29 + v28;
      (*(void (**)(unint64_t, char *, uint64_t))(v14 + 16))(v30, v25, v13);
      uint64_t v31 = *MEMORY[0x263F90168];
      uint64_t v32 = type metadata accessor for DSLTree.Atom();
      (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 104))(v30, v31, v32);
      (*(void (**)(unint64_t, void, uint64_t))(v27 + 104))(v30, *MEMORY[0x263F90110], v35);
      DSLTree.CustomCharacterClass.init(members:isInverted:)();
      outlined destroy of DSLTree.Atom.CharacterClass?(v26, &demangling cache variable for type metadata for DSLTree.Atom.CharacterClass?);
      v37(v26, v34, v13);
      ((void (*)(uint64_t, void, uint64_t, uint64_t))v36)(v26, 0, 1, v13);
      return outlined init with take of CharacterClass(v21, v39);
    }
  }
  outlined destroy of DSLTree.Atom.CharacterClass?((uint64_t)v12, &demangling cache variable for type metadata for DSLTree.Atom.CharacterClass?);
  DSLTree.CustomCharacterClass.inverted.getter();
  uint64_t v21 = (uint64_t)v38;
  uint64_t v22 = (uint64_t)&v38[*(int *)(v5 + 20)];
  uint64_t v23 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  v23(v22, 1, 1, v13);
  (*(void (**)(uint64_t, char *, void))(v36 + 32))(v21, v4, v37);
  outlined destroy of DSLTree.Atom.CharacterClass?(v22, &demangling cache variable for type metadata for DSLTree.Atom.CharacterClass?);
  v23(v22, 1, 1, v13);
  return outlined init with take of CharacterClass(v21, v39);
}

uint64_t outlined init with take of CharacterClass(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CharacterClass();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t static RegexComponent<>.any.getter@<X0>(uint64_t a1@<X8>)
{
  return static RegexComponent<>.any.getter(MEMORY[0x263F90170], a1);
}

uint64_t static RegexComponent<>.anyNonNewline.getter@<X0>(uint64_t a1@<X8>)
{
  return static RegexComponent<>.any.getter(MEMORY[0x263F90128], a1);
}

uint64_t static RegexComponent<>.any.getter@<X0>(unsigned int *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for DSLTree.CustomCharacterClass();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<DSLTree.CustomCharacterClass.Member>);
  uint64_t v8 = type metadata accessor for DSLTree.CustomCharacterClass.Member();
  uint64_t v9 = *(void *)(v8 - 8);
  unint64_t v10 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_239953830;
  unint64_t v12 = v11 + v10;
  uint64_t v13 = *a1;
  uint64_t v14 = type metadata accessor for DSLTree.Atom();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 104))(v12, v13, v14);
  (*(void (**)(unint64_t, void, uint64_t))(v9 + 104))(v12, *MEMORY[0x263F90110], v8);
  DSLTree.CustomCharacterClass.init(members:isInverted:)();
  uint64_t v15 = a2 + *(int *)(type metadata accessor for CharacterClass() + 20);
  uint64_t v16 = type metadata accessor for DSLTree.Atom.CharacterClass();
  uint64_t v17 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  v17(v15, 1, 1, v16);
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(a2, v7, v4);
  outlined destroy of DSLTree.Atom.CharacterClass?(v15, &demangling cache variable for type metadata for DSLTree.Atom.CharacterClass?);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v17)(v15, 1, 1, v16);
}

uint64_t static RegexComponent<>.anyGraphemeCluster.getter@<X0>(uint64_t a1@<X8>)
{
  return static RegexComponent<>.anyGraphemeCluster.getter(MEMORY[0x263F90138], a1);
}

uint64_t static RegexComponent<>.digit.getter@<X0>(uint64_t a1@<X8>)
{
  return static RegexComponent<>.anyGraphemeCluster.getter(MEMORY[0x263F90160], a1);
}

uint64_t static RegexComponent<>.anyGraphemeCluster.getter@<X0>(unsigned int *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v17 = a2;
  uint64_t v4 = type metadata accessor for DSLTree.Atom.CharacterClass();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *a1, v4);
  uint64_t v8 = a2 + *(int *)(type metadata accessor for CharacterClass() + 20);
  uint64_t v18 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56);
  v18(v8, 1, 1, v4);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<DSLTree.CustomCharacterClass.Member>);
  uint64_t v9 = type metadata accessor for DSLTree.CustomCharacterClass.Member();
  uint64_t v10 = *(void *)(v9 - 8);
  unint64_t v11 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_239953830;
  unint64_t v13 = v12 + v11;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 16))(v13, v7, v4);
  uint64_t v14 = *MEMORY[0x263F90168];
  uint64_t v15 = type metadata accessor for DSLTree.Atom();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 104))(v13, v14, v15);
  (*(void (**)(unint64_t, void, uint64_t))(v10 + 104))(v13, *MEMORY[0x263F90110], v9);
  DSLTree.CustomCharacterClass.init(members:isInverted:)();
  outlined destroy of DSLTree.Atom.CharacterClass?(v8, &demangling cache variable for type metadata for DSLTree.Atom.CharacterClass?);
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v8, v7, v4);
  return ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t))v18)(v8, 0, 1, v4);
}

uint64_t static RegexComponent<>.hexDigit.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v32 = a1;
  uint64_t v1 = type metadata accessor for DSLTree.CustomCharacterClass();
  uint64_t v33 = *(void *)(v1 - 8);
  uint64_t v34 = v1;
  MEMORY[0x270FA5388](v1);
  uint64_t v31 = (char *)v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<DSLTree.CustomCharacterClass.Member>);
  uint64_t v35 = type metadata accessor for DSLTree.CustomCharacterClass.Member();
  uint64_t v3 = *(void *)(v35 - 8);
  uint64_t v4 = *(void *)(v3 + 72);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v29 = 2 * v4;
  uint64_t v6 = swift_allocObject();
  uint64_t v30 = v6;
  *(_OWORD *)(v6 + 16) = xmmword_239953840;
  uint64_t v7 = (void *)(v6 + v5);
  *uint64_t v7 = 65;
  v7[1] = 0xE100000000000000;
  uint64_t v8 = *MEMORY[0x263F90178];
  uint64_t v9 = type metadata accessor for DSLTree.Atom();
  uint64_t v10 = *(void (**)(void))(*(void *)(v9 - 8) + 104);
  ((void (*)(void *, uint64_t, uint64_t))v10)(v7, v8, v9);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (DSLTree.Atom, DSLTree.Atom));
  unint64_t v11 = (void *)((char *)v7 + *(int *)(v28 + 48));
  *unint64_t v11 = 70;
  v11[1] = 0xE100000000000000;
  v10();
  uint64_t v12 = *MEMORY[0x263F90118];
  unint64_t v13 = *(void (**)(void *, uint64_t, uint64_t))(v3 + 104);
  v27[1] = v3 + 104;
  uint64_t v14 = v35;
  v13(v7, v12, v35);
  uint64_t v15 = (void *)((char *)v7 + v4);
  *uint64_t v15 = 97;
  v15[1] = 0xE100000000000000;
  ((void (*)(void *, uint64_t, uint64_t))v10)(v15, v8, v9);
  uint64_t v16 = v28;
  uint64_t v17 = (void *)((char *)v15 + *(int *)(v28 + 48));
  *uint64_t v17 = 102;
  v17[1] = 0xE100000000000000;
  v10();
  v13(v15, v12, v14);
  uint64_t v18 = (void *)((char *)v7 + v29);
  *uint64_t v18 = 48;
  v18[1] = 0xE100000000000000;
  ((void (*)(void *, uint64_t, uint64_t))v10)(v18, v8, v9);
  uint64_t v19 = (void *)((char *)v18 + *(int *)(v16 + 48));
  *uint64_t v19 = 57;
  v19[1] = 0xE100000000000000;
  v10();
  v13(v18, v12, v35);
  uint64_t v20 = v31;
  DSLTree.CustomCharacterClass.init(members:isInverted:)();
  uint64_t v21 = type metadata accessor for CharacterClass();
  uint64_t v22 = v32;
  uint64_t v23 = v32 + *(int *)(v21 + 20);
  uint64_t v24 = type metadata accessor for DSLTree.Atom.CharacterClass();
  uint64_t v25 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56);
  v25(v23, 1, 1, v24);
  (*(void (**)(uint64_t, char *, uint64_t))(v33 + 32))(v22, v20, v34);
  outlined destroy of DSLTree.Atom.CharacterClass?(v23, &demangling cache variable for type metadata for DSLTree.Atom.CharacterClass?);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v25)(v23, 1, 1, v24);
}

uint64_t static RegexComponent<>.word.getter@<X0>(uint64_t a1@<X8>)
{
  return static RegexComponent<>.anyGraphemeCluster.getter(MEMORY[0x263F90158], a1);
}

uint64_t static RegexComponent<>.whitespace.getter@<X0>(uint64_t a1@<X8>)
{
  return static RegexComponent<>.anyGraphemeCluster.getter(MEMORY[0x263F90130], a1);
}

uint64_t static RegexComponent<>.horizontalWhitespace.getter@<X0>(uint64_t a1@<X8>)
{
  return static RegexComponent<>.anyGraphemeCluster.getter(MEMORY[0x263F90150], a1);
}

uint64_t static RegexComponent<>.newlineSequence.getter@<X0>(uint64_t a1@<X8>)
{
  return static RegexComponent<>.anyGraphemeCluster.getter(MEMORY[0x263F90140], a1);
}

uint64_t static RegexComponent<>.verticalWhitespace.getter@<X0>(uint64_t a1@<X8>)
{
  return static RegexComponent<>.anyGraphemeCluster.getter(MEMORY[0x263F90148], a1);
}

uint64_t static RegexComponent<>.anyOf<A>(_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return static RegexComponent<>.anyOf<A>(_:)(a1, a2, (void (*)(char *, char *))closure #1 in static RegexComponent<>.anyOf<A>(_:), a3);
}

{
  return static RegexComponent<>.anyOf<A>(_:)(a1, a2, (void (*)(char *, char *))closure #1 in static RegexComponent<>.anyOf<A>(_:), a3);
}

uint64_t closure #1 in static RegexComponent<>.anyOf<A>(_:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = a1[1];
  *a2 = *a1;
  a2[1] = v3;
  uint64_t v4 = *MEMORY[0x263F90178];
  uint64_t v5 = type metadata accessor for DSLTree.Atom();
  (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 104))(a2, v4, v5);
  uint64_t v6 = *MEMORY[0x263F90110];
  uint64_t v7 = type metadata accessor for DSLTree.CustomCharacterClass.Member();
  (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 104))(a2, v6, v7);
  return swift_bridgeObjectRetain();
}

uint64_t _sSTsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v43 = a8;
  uint64_t v44 = a5;
  uint64_t v9 = v8;
  uint64_t v58 = a2;
  v59 = a4;
  v57 = a1;
  uint64_t v42 = *(void *)(a5 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](a1);
  v55 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  v54 = (char *)&v40 - v13;
  uint64_t v15 = v14;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v52 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  v41 = (char *)&v40 - v17;
  uint64_t v18 = type metadata accessor for Optional();
  uint64_t v45 = *(void *)(v18 - 8);
  uint64_t v46 = v18;
  uint64_t v19 = MEMORY[0x270FA5388](v18);
  v47 = (char *)&v40 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v40 - v22;
  uint64_t v24 = MEMORY[0x270FA5388](v21);
  v40 = (char *)&v40 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  uint64_t v27 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v26);
  v53 = (char *)&v40 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = a6;
  uint64_t v49 = v15;
  uint64_t v60 = swift_getAssociatedTypeWitness();
  uint64_t v48 = *(void *)(v60 - 8);
  MEMORY[0x270FA5388](v60);
  uint64_t v30 = (char *)&v40 - v29;
  Swift::Int v31 = dispatch thunk of Sequence.underestimatedCount.getter();
  uint64_t v61 = MEMORY[0x23ECA89D0](v59);
  uint64_t v56 = type metadata accessor for ContiguousArray();
  ContiguousArray.reserveCapacity(_:)(v31);
  (*(void (**)(char *, uint64_t, uint64_t))(v27 + 16))(v53, v50, v49);
  v59 = v30;
  uint64_t result = dispatch thunk of Sequence.makeIterator()();
  if (v31 < 0)
  {
    __break(1u);
LABEL_15:
    __break(1u);
    return result;
  }
  swift_getAssociatedConformanceWitness();
  if (v31)
  {
    uint64_t v33 = (uint64_t (**)(char *, uint64_t, uint64_t))(v52 + 48);
    uint64_t v34 = (uint64_t (**)(char *, uint64_t))(v52 + 8);
    do
    {
      dispatch thunk of IteratorProtocol.next()();
      uint64_t result = (*v33)(v23, 1, AssociatedTypeWitness);
      if (result == 1) {
        goto LABEL_15;
      }
      v57(v23, v55);
      if (v9)
      {
        (*(void (**)(char *, uint64_t))(v48 + 8))(v59, v60);
        swift_release();
        (*(void (**)(uint64_t, char *, uint64_t))(v42 + 32))(v43, v55, v44);
        return (*v34)(v23, AssociatedTypeWitness);
      }
      uint64_t v9 = 0;
      (*v34)(v23, AssociatedTypeWitness);
      ContiguousArray.append(_:)();
    }
    while (--v31);
  }
  uint64_t v35 = v47;
  dispatch thunk of IteratorProtocol.next()();
  uint64_t v36 = v52;
  v37 = *(char **)(v52 + 48);
  v55 = (char *)(v52 + 48);
  v53 = v37;
  if (((unsigned int (*)(char *, uint64_t, uint64_t))v37)(v35, 1, AssociatedTypeWitness) == 1)
  {
LABEL_11:
    (*(void (**)(char *, uint64_t))(v48 + 8))(v59, v60);
    (*(void (**)(char *, uint64_t))(v45 + 8))(v35, v46);
    return v61;
  }
  else
  {
    uint64_t v52 = *(void *)(v36 + 32);
    v38 = (void (**)(char *, uint64_t))(v36 + 8);
    uint64_t v39 = v41;
    while (1)
    {
      ((void (*)(char *, char *, uint64_t))v52)(v39, v35, AssociatedTypeWitness);
      v57(v39, v54);
      if (v9) {
        break;
      }
      uint64_t v9 = 0;
      (*v38)(v39, AssociatedTypeWitness);
      ContiguousArray.append(_:)();
      dispatch thunk of IteratorProtocol.next()();
      if (((unsigned int (*)(char *, uint64_t, uint64_t))v53)(v35, 1, AssociatedTypeWitness) == 1) {
        goto LABEL_11;
      }
    }
    (*v38)(v39, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v48 + 8))(v59, v60);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v42 + 32))(v43, v54, v44);
  }
}

uint64_t static RegexComponent<>.anyOf<A>(_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, void (*a3)(char *, char *)@<X3>, uint64_t a4@<X8>)
{
  uint64_t v8 = type metadata accessor for DSLTree.CustomCharacterClass();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (char *)type metadata accessor for DSLTree.CustomCharacterClass.Member();
  _sSTsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF(a3, 0, a1, v12, MEMORY[0x263F8E628], a2, MEMORY[0x263F8E658], v13);
  DSLTree.CustomCharacterClass.init(members:isInverted:)();
  uint64_t v14 = a4 + *(int *)(type metadata accessor for CharacterClass() + 20);
  uint64_t v15 = type metadata accessor for DSLTree.Atom.CharacterClass();
  uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  v16(v14, 1, 1, v15);
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(a4, v11, v8);
  outlined destroy of DSLTree.Atom.CharacterClass?(v14, &demangling cache variable for type metadata for DSLTree.Atom.CharacterClass?);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v16)(v14, 1, 1, v15);
}

uint64_t closure #1 in static RegexComponent<>.anyOf<A>(_:)@<X0>(_DWORD *a1@<X0>, _DWORD *a2@<X8>)
{
  *a2 = *a1;
  uint64_t v3 = *MEMORY[0x263F90180];
  uint64_t v4 = type metadata accessor for DSLTree.Atom();
  (*(void (**)(_DWORD *, uint64_t, uint64_t))(*(void *)(v4 - 8) + 104))(a2, v3, v4);
  uint64_t v5 = *MEMORY[0x263F90110];
  uint64_t v6 = type metadata accessor for DSLTree.CustomCharacterClass.Member();
  return (*(uint64_t (**)(_DWORD *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 104))(a2, v5, v6);
}

uint64_t static CharacterClass.generalCategory(_:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for DSLTree.CustomCharacterClass();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  static DSLTree.CustomCharacterClass.generalCategory(_:)();
  uint64_t v6 = a1 + *(int *)(type metadata accessor for CharacterClass() + 20);
  uint64_t v7 = type metadata accessor for DSLTree.Atom.CharacterClass();
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
  v8(v6, 1, 1, v7);
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(a1, v5, v2);
  outlined destroy of DSLTree.Atom.CharacterClass?(v6, &demangling cache variable for type metadata for DSLTree.Atom.CharacterClass?);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v8)(v6, 1, 1, v7);
}

uint64_t ... infix(_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v29 = a2;
  uint64_t v30 = a3;
  uint64_t v32 = a5;
  uint64_t v8 = type metadata accessor for DSLTree.CustomCharacterClass();
  uint64_t v33 = *(void *)(v8 - 8);
  uint64_t v34 = v8;
  MEMORY[0x270FA5388](v8);
  Swift::Int v31 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = type metadata accessor for DSLTree.CustomCharacterClass.Member();
  uint64_t v10 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  uint64_t v12 = (uint64_t *)((char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = (void *)((char *)v12
                 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (DSLTree.Atom, DSLTree.Atom))
                          + 48));
  *uint64_t v12 = a1;
  v12[1] = a2;
  uint64_t v14 = *MEMORY[0x263F90178];
  uint64_t v15 = type metadata accessor for DSLTree.Atom();
  uint64_t v16 = *(void (**)(void *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 104);
  v16(v12, v14, v15);
  *uint64_t v13 = v30;
  v13[1] = a4;
  v16(v13, v14, v15);
  uint64_t v17 = v28;
  (*(void (**)(void *, void, uint64_t))(v10 + 104))(v12, *MEMORY[0x263F90118], v28);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<DSLTree.CustomCharacterClass.Member>);
  unint64_t v18 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_239953830;
  (*(void (**)(unint64_t, void *, uint64_t))(v10 + 32))(v19 + v18, v12, v17);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v20 = v31;
  DSLTree.CustomCharacterClass.init(members:isInverted:)();
  uint64_t v21 = type metadata accessor for CharacterClass();
  uint64_t v22 = v32;
  uint64_t v23 = v32 + *(int *)(v21 + 20);
  uint64_t v24 = type metadata accessor for DSLTree.Atom.CharacterClass();
  uint64_t v25 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56);
  v25(v23, 1, 1, v24);
  (*(void (**)(uint64_t, char *, uint64_t))(v33 + 32))(v22, v20, v34);
  outlined destroy of DSLTree.Atom.CharacterClass?(v23, &demangling cache variable for type metadata for DSLTree.Atom.CharacterClass?);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v25)(v23, 1, 1, v24);
}

uint64_t ... infix(_:_:)@<X0>(int a1@<W0>, int a2@<W1>, uint64_t a3@<X8>)
{
  int v24 = a2;
  uint64_t v26 = a3;
  uint64_t v4 = type metadata accessor for DSLTree.CustomCharacterClass();
  uint64_t v27 = *(void *)(v4 - 8);
  uint64_t v28 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v25 = &v23[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = type metadata accessor for DSLTree.CustomCharacterClass.Member();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = &v23[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = (_DWORD *)((char *)v9
                 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (DSLTree.Atom, DSLTree.Atom))
                          + 48));
  *uint64_t v9 = a1;
  uint64_t v11 = *MEMORY[0x263F90180];
  uint64_t v12 = type metadata accessor for DSLTree.Atom();
  uint64_t v13 = *(void (**)(_DWORD *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 104);
  v13(v9, v11, v12);
  _DWORD *v10 = v24;
  v13(v10, v11, v12);
  (*(void (**)(_DWORD *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F90118], v6);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<DSLTree.CustomCharacterClass.Member>);
  unint64_t v14 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_239953830;
  (*(void (**)(unint64_t, _DWORD *, uint64_t))(v7 + 32))(v15 + v14, v9, v6);
  uint64_t v16 = v25;
  DSLTree.CustomCharacterClass.init(members:isInverted:)();
  uint64_t v17 = type metadata accessor for CharacterClass();
  uint64_t v18 = v26;
  uint64_t v19 = v26 + *(int *)(v17 + 20);
  uint64_t v20 = type metadata accessor for DSLTree.Atom.CharacterClass();
  uint64_t v21 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56);
  v21(v19, 1, 1, v20);
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v27 + 32))(v18, v16, v28);
  outlined destroy of DSLTree.Atom.CharacterClass?(v19, &demangling cache variable for type metadata for DSLTree.Atom.CharacterClass?);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v21)(v19, 1, 1, v20);
}

size_t RegexComponent<>.init(_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v50 = a1;
  uint64_t v46 = a3;
  uint64_t v52 = type metadata accessor for DSLTree.CustomCharacterClass.Member();
  uint64_t v4 = *(void *)(v52 - 8);
  MEMORY[0x270FA5388](v52);
  uint64_t v6 = (char *)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CollectionOfOne<CharacterClass>);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v49 = (uint64_t)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v42 - v10;
  uint64_t v12 = type metadata accessor for CharacterClass();
  uint64_t v51 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  unint64_t v14 = (char *)&v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for DSLTree.CustomCharacterClass();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v42 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = a2;
  uint64_t v20 = *(void *)(a2 + 16);
  if (!v20)
  {
    swift_bridgeObjectRelease();
    uint64_t v35 = v50;
    (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, v50, v15);
    outlined destroy of CharacterClass(v35);
    uint64_t v36 = (uint64_t)&v14[*(int *)(v12 + 20)];
    uint64_t v37 = type metadata accessor for DSLTree.Atom.CharacterClass();
    v38 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v37 - 8) + 56);
    v38(v36, 1, 1, v37);
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v14, v18, v15);
    outlined destroy of DSLTree.Atom.CharacterClass?(v36, &demangling cache variable for type metadata for DSLTree.Atom.CharacterClass?);
    v38(v36, 1, 1, v37);
    uint64_t v32 = v46;
    return outlined init with take of CharacterClass((uint64_t)v14, v32);
  }
  uint64_t v43 = v12;
  uint64_t v44 = (char *)&v42 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = v16;
  outlined init with take of CharacterClass(v50, (uint64_t)v11);
  size_t v21 = MEMORY[0x263F8EE78];
  size_t v53 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v20 + 1, 0, MEMORY[0x263F8EE78]);
  uint64_t v22 = v49;
  outlined init with take of CollectionOfOne<CharacterClass>((uint64_t)v11, v49, &demangling cache variable for type metadata for CollectionOfOne<CharacterClass>);
  specialized Array.append<A>(contentsOf:)(v22);
  specialized Array.append<A>(contentsOf:)(v19);
  size_t v23 = v53;
  int64_t v24 = *(void *)(v53 + 16);
  if (!v24)
  {
    swift_bridgeObjectRelease();
    uint64_t v34 = v44;
    uint64_t v31 = v45;
    uint64_t v33 = v43;
    uint64_t v32 = v46;
LABEL_13:
    DSLTree.CustomCharacterClass.init(members:isInverted:)();
    uint64_t v39 = (uint64_t)&v14[*(int *)(v33 + 20)];
    uint64_t v40 = type metadata accessor for DSLTree.Atom.CharacterClass();
    v41 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56);
    v41(v39, 1, 1, v40);
    (*(void (**)(char *, char *, uint64_t))(v31 + 32))(v14, v34, v15);
    outlined destroy of DSLTree.Atom.CharacterClass?(v39, &demangling cache variable for type metadata for DSLTree.Atom.CharacterClass?);
    v41(v39, 1, 1, v40);
    return outlined init with take of CharacterClass((uint64_t)v14, v32);
  }
  size_t v53 = v21;
  size_t result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v24, 0);
  unint64_t v26 = 0;
  uint64_t v27 = (void (**)(char *, char *, uint64_t))(v45 + 16);
  unsigned int v48 = *MEMORY[0x263F90120];
  uint64_t v47 = v4 + 32;
  uint64_t v49 = v24;
  uint64_t v50 = v15;
  while (v26 < *(void *)(v23 + 16))
  {
    outlined init with copy of CharacterClass(v23+ ((*(unsigned __int8 *)(v51 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v51 + 80))+ *(void *)(v51 + 72) * v26, (uint64_t)v14);
    (*v27)(v6, v14, v15);
    outlined destroy of CharacterClass((uint64_t)v14);
    (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, v48, v52);
    size_t v28 = v53;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v28 + 16) + 1, 1);
      size_t v28 = v53;
    }
    unint64_t v30 = *(void *)(v28 + 16);
    unint64_t v29 = *(void *)(v28 + 24);
    if (v30 >= v29 >> 1)
    {
      specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v29 > 1, v30 + 1, 1);
      size_t v28 = v53;
    }
    ++v26;
    *(void *)(v28 + 16) = v30 + 1;
    size_t result = (*(uint64_t (**)(size_t, char *, uint64_t))(v4 + 32))(v28+ ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))+ *(void *)(v4 + 72) * v30, v6, v52);
    size_t v53 = v28;
    uint64_t v15 = v50;
    if (v49 == v26)
    {
      swift_bridgeObjectRelease();
      uint64_t v31 = v45;
      uint64_t v32 = v46;
      uint64_t v33 = v43;
      uint64_t v34 = v44;
      goto LABEL_13;
    }
  }
  __break(1u);
  return result;
}

uint64_t CharacterClass.union(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v25 = a1;
  uint64_t v26 = a2;
  uint64_t v3 = type metadata accessor for DSLTree.CustomCharacterClass();
  uint64_t v23 = *(void *)(v3 - 8);
  uint64_t v4 = v23;
  MEMORY[0x270FA5388](v3);
  int64_t v24 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<DSLTree.CustomCharacterClass.Member>);
  uint64_t v6 = type metadata accessor for DSLTree.CustomCharacterClass.Member();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 72);
  unint64_t v9 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_239953850;
  unint64_t v11 = v10 + v9;
  uint64_t v12 = *(void (**)(unint64_t, uint64_t, uint64_t))(v4 + 16);
  v12(v11, v2, v3);
  uint64_t v13 = *MEMORY[0x263F90120];
  unint64_t v14 = *(void (**)(unint64_t, uint64_t, uint64_t))(v7 + 104);
  v14(v11, v13, v6);
  unint64_t v15 = v11 + v8;
  v12(v15, v25, v3);
  v14(v15, v13, v6);
  uint64_t v16 = v24;
  DSLTree.CustomCharacterClass.init(members:isInverted:)();
  uint64_t v17 = type metadata accessor for CharacterClass();
  uint64_t v18 = v26;
  uint64_t v19 = v26 + *(int *)(v17 + 20);
  uint64_t v20 = type metadata accessor for DSLTree.Atom.CharacterClass();
  size_t v21 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56);
  v21(v19, 1, 1, v20);
  (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(v18, v16, v3);
  outlined destroy of DSLTree.Atom.CharacterClass?(v19, &demangling cache variable for type metadata for DSLTree.Atom.CharacterClass?);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v21)(v19, 1, 1, v20);
}

uint64_t CharacterClass.intersection(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return CharacterClass.intersection(_:)(a1, MEMORY[0x263F90100], a2);
}

uint64_t CharacterClass.subtracting(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return CharacterClass.intersection(_:)(a1, MEMORY[0x263F900F8], a2);
}

uint64_t CharacterClass.intersection(_:)@<X0>(uint64_t a1@<X0>, unsigned int *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v26 = a1;
  uint64_t v27 = a2;
  uint64_t v28 = a3;
  uint64_t v3 = type metadata accessor for DSLTree.CustomCharacterClass();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  int64_t v24 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<DSLTree.CustomCharacterClass.Member>);
  uint64_t v6 = type metadata accessor for DSLTree.CustomCharacterClass.Member();
  uint64_t v7 = *(void *)(v6 - 8);
  unint64_t v8 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_239953830;
  uint64_t v10 = (uint64_t *)(v9 + v8);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (DSLTree.CustomCharacterClass, DSLTree.CustomCharacterClass));
  uint64_t v12 = swift_allocBox();
  uint64_t v14 = v13 + *(int *)(v11 + 48);
  unint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v15(v13, v25, v3);
  v15(v14, v26, v3);
  uint64_t *v10 = v12;
  (*(void (**)(uint64_t *, void, uint64_t))(v7 + 104))(v10, *v27, v6);
  uint64_t v16 = v24;
  DSLTree.CustomCharacterClass.init(members:isInverted:)();
  uint64_t v17 = type metadata accessor for CharacterClass();
  uint64_t v18 = v28;
  uint64_t v19 = v28 + *(int *)(v17 + 20);
  uint64_t v20 = type metadata accessor for DSLTree.Atom.CharacterClass();
  size_t v21 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56);
  v21(v19, 1, 1, v20);
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))(v18, v16, v3);
  outlined destroy of DSLTree.Atom.CharacterClass?(v19, &demangling cache variable for type metadata for DSLTree.Atom.CharacterClass?);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v21)(v19, 1, 1, v20);
}

uint64_t CharacterClass.symmetricDifference(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return CharacterClass.intersection(_:)(a1, MEMORY[0x263F90108], a2);
}

uint64_t Regex.init<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a4 - 8);
  uint64_t v6 = (void (*)(void))MEMORY[0x270FA5388](a1);
  unint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6();
  dispatch thunk of RegexComponent.regex.getter();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, a4);
}

void String.regex.getter()
{
  swift_bridgeObjectRetain();

  JUMPOUT(0x23ECA87C0);
}

void protocol witness for RegexComponent.regex.getter in conformance String()
{
  swift_bridgeObjectRetain();

  JUMPOUT(0x23ECA87C0);
}

void Substring.regex.getter()
{
  MEMORY[0x23ECA88D0]();

  JUMPOUT(0x23ECA87C0);
}

void protocol witness for RegexComponent.regex.getter in conformance Substring()
{
  MEMORY[0x23ECA88D0](*v0, v0[1], v0[2], v0[3]);

  JUMPOUT(0x23ECA87C0);
}

uint64_t Character.regex.getter()
{
  uint64_t v0 = type metadata accessor for _RegexFactory();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  _RegexFactory.init()();
  _RegexFactory.char<A>(_:)();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t protocol witness for RegexComponent.regex.getter in conformance Character()
{
  uint64_t v0 = type metadata accessor for _RegexFactory();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  _RegexFactory.init()();
  _RegexFactory.char<A>(_:)();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t Unicode.Scalar.regex.getter()
{
  uint64_t v0 = type metadata accessor for _RegexFactory();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  _RegexFactory.init()();
  _RegexFactory.scalar<A>(_:)();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t protocol witness for RegexComponent.regex.getter in conformance Unicode.Scalar()
{
  uint64_t v0 = type metadata accessor for _RegexFactory();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  _RegexFactory.init()();
  _RegexFactory.scalar<A>(_:)();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t (*One.regex.modify())()
{
  return Lookahead.regex.modify;
}

uint64_t One.init<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for Regex();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v11 - v8;
  dispatch thunk of RegexComponent.regex.getter();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 8))(a1, a2);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v7 + 32))(a3, v9, v6);
}

uint64_t (*OneOrMore.regex.modify())()
{
  return Lookahead.regex.modify;
}

uint64_t (*ZeroOrMore.regex.modify())()
{
  return Lookahead.regex.modify;
}

uint64_t (*Optionally.regex.modify())()
{
  return Lookahead.regex.modify;
}

uint64_t (*Repeat.regex.modify())()
{
  return Lookahead.regex.modify;
}

uint64_t static AlternationBuilder.buildPartialBlock<A>(first:)@<X0>(uint64_t a1@<X8>)
{
  swift_getAssociatedTypeWitness();
  uint64_t v2 = type metadata accessor for Regex();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - v4;
  dispatch thunk of RegexComponent.regex.getter();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v3 + 32))(a1, v5, v2);
}

uint64_t static RegexComponentBuilder.buildExpression<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(a3, a1, a2);
}

uint64_t (*ChoiceOf.regex.modify())()
{
  return Lookahead.regex.modify;
}

uint64_t ChoiceOf.init(_:)(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t (*Capture.regex.modify())()
{
  return Lookahead.regex.modify;
}

uint64_t (*TryCapture.regex.modify())()
{
  return Lookahead.regex.modify;
}

uint64_t Lookahead.regex.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for Regex();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t Lookahead.regex.setter(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for Regex();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 40);

  return v4(v1, a1, v3);
}

uint64_t (*Local.regex.modify())()
{
  return Lookahead.regex.modify;
}

uint64_t Lookahead.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for Regex();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32);

  return v5(a2, a1, v4);
}

uint64_t Reference.init(_:)()
{
  return MEMORY[0x270FA2980]();
}

uint64_t Reference._raw.getter()
{
  return MEMORY[0x270FA2978]();
}

uint64_t Reference.regex.getter()
{
  uint64_t v0 = type metadata accessor for _RegexFactory();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  _RegexFactory.init()();
  _RegexFactory.symbolicReference<A>(_:)();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t Regex.Match.subscript.getter()
{
  return MEMORY[0x270FA2AC8]();
}

size_t specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(size_t a1, int64_t a2, char a3)
{
  size_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

size_t specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(size_t result, int64_t a2, char a3, void *a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<DSLTree.CustomCharacterClass.Member>);
  uint64_t v10 = *(void *)(type metadata accessor for DSLTree.CustomCharacterClass.Member() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_29;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(type metadata accessor for DSLTree.CustomCharacterClass.Member() - 8);
  if (v5)
  {
    if (v13 < a4
      || (unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(void *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return (size_t)v13;
}

size_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(size_t result, int64_t a2, char a3, void *a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<CharacterClass>);
  uint64_t v10 = *(void *)(type metadata accessor for CharacterClass() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_29;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(type metadata accessor for CharacterClass() - 8);
  if (v5)
  {
    if (v13 < a4
      || (unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(void *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v13;
}

uint64_t specialized Array.append<A>(contentsOf:)(uint64_t result)
{
  uint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v6 = result;
  size_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(void *)(v6 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
  if (v4 <= v5) {
    int64_t v12 = v4 + v2;
  }
  else {
    int64_t v12 = v4;
  }
  uint64_t v3 = (void *)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(isUniquelyReferenced_nonNull_native, v12, 1, v3);
  if (!*(void *)(v6 + 16))
  {
LABEL_13:
    size_t result = swift_bridgeObjectRelease();
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
LABEL_5:
  uint64_t v8 = (v3[3] >> 1) - v3[2];
  size_t result = type metadata accessor for CharacterClass();
  if (v8 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  swift_arrayInitWithCopy();
  size_t result = swift_bridgeObjectRelease();
  if (!v2)
  {
LABEL_14:
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v9 = v3[2];
  BOOL v10 = __OFADD__(v9, v2);
  uint64_t v11 = v9 + v2;
  if (!v10)
  {
    v3[2] = v11;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t specialized Array.append<A>(contentsOf:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v46 = type metadata accessor for CharacterClass();
  uint64_t v4 = *(void *)(v46 - 8);
  MEMORY[0x270FA5388](v46);
  uint64_t v44 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CharacterClass?);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v9 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v45 = (uint64_t)&v39 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v39 - v12;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CollectionOfOne<CharacterClass>.Iterator);
  MEMORY[0x270FA5388](v14 - 8);
  unint64_t v16 = (char *)&v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = (void *)*v2;
  unint64_t v18 = *(void *)(*v2 + 16);
  size_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v2 = (size_t)v17;
  if (!isUniquelyReferenced_nonNull_native || (unint64_t v20 = v17[3] >> 1, v20 <= v18))
  {
    uint64_t v17 = (void *)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(isUniquelyReferenced_nonNull_native, v18 + 1, 1, v17);
    *uint64_t v2 = (size_t)v17;
    unint64_t v20 = v17[3] >> 1;
  }
  uint64_t v21 = v17[2];
  unint64_t v22 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v23 = *(void *)(v4 + 72);
  uint64_t v24 = v20 - v21;
  uint64_t v25 = specialized Sequence._copySequenceContents(initializing:)((uint64_t)v16, (uint64_t)v17 + v22 + v23 * v21, v20 - v21);
  if (v25 < 1)
  {
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v26 = v17[2];
  a1 = v26 + v25;
  if (__OFADD__(v26, v25))
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v17[2] = a1;
  if (v25 != v24)
  {
    uint64_t v27 = &demangling cache variable for type metadata for CollectionOfOne<CharacterClass>.Iterator;
    uint64_t v28 = (uint64_t)v16;
    return outlined destroy of DSLTree.Atom.CharacterClass?(v28, v27);
  }
LABEL_11:
  outlined init with take of CollectionOfOne<CharacterClass>((uint64_t)v16, (uint64_t)v13, &demangling cache variable for type metadata for CharacterClass?);
  uint64_t v30 = v46;
  uint64_t v40 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56);
  uint64_t v41 = v4 + 56;
  v40(v16, 1, 1, v46);
  uint64_t v31 = v45;
  outlined init with copy of DSLTree.Atom.CharacterClass?((uint64_t)v13, v45, &demangling cache variable for type metadata for CharacterClass?);
  uint64_t v43 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 48);
  if (v43((char *)v31, 1, v30) != 1)
  {
    do
    {
      outlined destroy of DSLTree.Atom.CharacterClass?(v31, &demangling cache variable for type metadata for CharacterClass?);
      size_t v33 = *v2;
      unint64_t v34 = *(void *)(*v2 + 24);
      if ((uint64_t)(v34 >> 1) < a1 + 1)
      {
        size_t v33 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v34 > 1, a1 + 1, 1, (void *)*v2);
        *uint64_t v2 = v33;
        uint64_t v42 = *(void *)(v33 + 24) >> 1;
      }
      else
      {
        uint64_t v42 = v34 >> 1;
      }
      swift_retain();
      outlined init with copy of DSLTree.Atom.CharacterClass?((uint64_t)v13, (uint64_t)v9, &demangling cache variable for type metadata for CharacterClass?);
      int v35 = v43(v9, 1, v46);
      size_t v39 = v33;
      if (v35 == 1)
      {
LABEL_14:
        swift_bridgeObjectRelease();
        outlined destroy of DSLTree.Atom.CharacterClass?((uint64_t)v9, &demangling cache variable for type metadata for CharacterClass?);
        uint64_t v32 = a1;
      }
      else
      {
        uint64_t v36 = v42;
        if (a1 > v42) {
          uint64_t v36 = a1;
        }
        uint64_t v42 = v36;
        uint64_t v37 = v33 + v22 + v23 * a1;
        uint64_t v38 = (uint64_t)v44;
        while (1)
        {
          outlined init with take of CharacterClass((uint64_t)v9, v38);
          if (v42 == a1) {
            break;
          }
          outlined destroy of DSLTree.Atom.CharacterClass?((uint64_t)v13, &demangling cache variable for type metadata for CharacterClass?);
          outlined init with take of CharacterClass(v38, v37);
          ++a1;
          outlined init with take of CollectionOfOne<CharacterClass>((uint64_t)v16, (uint64_t)v13, &demangling cache variable for type metadata for CharacterClass?);
          v40(v16, 1, 1, v46);
          outlined init with copy of DSLTree.Atom.CharacterClass?((uint64_t)v13, (uint64_t)v9, &demangling cache variable for type metadata for CharacterClass?);
          v37 += v23;
          if (v43(v9, 1, v46) == 1) {
            goto LABEL_14;
          }
        }
        outlined destroy of CharacterClass(v38);
        swift_bridgeObjectRelease();
        uint64_t v32 = v42;
        a1 = v42;
      }
      *(void *)(*v2 + 16) = v32;
      uint64_t v31 = v45;
      outlined init with copy of DSLTree.Atom.CharacterClass?((uint64_t)v13, v45, &demangling cache variable for type metadata for CharacterClass?);
    }
    while (v43((char *)v31, 1, v46) != 1);
  }
  outlined destroy of DSLTree.Atom.CharacterClass?((uint64_t)v13, &demangling cache variable for type metadata for CharacterClass?);
  outlined destroy of DSLTree.Atom.CharacterClass?((uint64_t)v16, &demangling cache variable for type metadata for CollectionOfOne<CharacterClass>.Iterator);
  uint64_t v28 = v31;
  uint64_t v27 = &demangling cache variable for type metadata for CharacterClass?;
  return outlined destroy of DSLTree.Atom.CharacterClass?(v28, v27);
}

uint64_t outlined init with copy of CharacterClass(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CharacterClass();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of CharacterClass(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CharacterClass();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t instantiation function for generic protocol witness table for Lookahead<A>(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for NegativeLookahead<A>(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for OneOrMore<A>(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for ZeroOrMore<A>(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for Optionally<A>(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for Repeat<A>(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for ChoiceOf<A>(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for Capture<A>(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for TryCapture<A>(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for Local<A>(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

_WORD *__swift_memcpy2_1(_WORD *result, _WORD *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for Anchor(unsigned __int16 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 65281 <= 0xFFFEFFFF) {
    int v2 = 2;
  }
  else {
    int v2 = 4;
  }
  if (a2 + 65281 < 0xFF0000) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 16)) - 65281;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 16)) - 65281;
    }
    int v4 = *((unsigned __int8 *)a1 + 2);
    if (*((unsigned char *)a1 + 2)) {
      return (*a1 | (v4 << 16)) - 65281;
    }
  }
LABEL_17:
  unsigned int v6 = *((unsigned __int8 *)a1 + 1);
  BOOL v7 = v6 >= 2;
  int v8 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for Anchor(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a3 + 65281 <= 0xFFFEFFFF) {
    int v3 = 2;
  }
  else {
    int v3 = 4;
  }
  if (a3 + 65281 < 0xFF0000) {
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
    unsigned int v6 = ((a2 - 255) >> 16) + 1;
    *(_WORD *)uint64_t result = a2 - 255;
    switch(v5)
    {
      case 1:
        *(unsigned char *)(result + 2) = v6;
        break;
      case 2:
        *(_WORD *)(result + 2) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x23995156CLL);
      case 4:
        *(_DWORD *)(result + 2) = v6;
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
        *(unsigned char *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 2) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *(unsigned char *)(result + 1) = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Anchor()
{
  return &type metadata for Anchor;
}

uint64_t type metadata instantiation function for Lookahead(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t getEnumTagSinglePayload for Lookahead(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm);
}

uint64_t storeEnumTagSinglePayload for Lookahead(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm);
}

uint64_t type metadata accessor for Lookahead()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t getEnumTagSinglePayload for NegativeLookahead(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm_0);
}

uint64_t storeEnumTagSinglePayload for NegativeLookahead(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm_0);
}

uint64_t type metadata accessor for NegativeLookahead()
{
  return __swift_instantiateGenericMetadata();
}

ValueMetadata *type metadata accessor for RegexComponentBuilder()
{
  return &type metadata for RegexComponentBuilder;
}

uint64_t *initializeBufferWithCopyOfBuffer for CharacterClass(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for DSLTree.CustomCharacterClass();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for DSLTree.Atom.CharacterClass();
    uint64_t v12 = *(void *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DSLTree.Atom.CharacterClass?);
      memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
  }
  return a1;
}

uint64_t destroy for CharacterClass(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DSLTree.CustomCharacterClass();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = type metadata accessor for DSLTree.Atom.CharacterClass();
  uint64_t v9 = *(void *)(v6 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v5, 1, v6);
  if (!result)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v9 + 8);
    return v8(v5, v6);
  }
  return result;
}

uint64_t initializeWithCopy for CharacterClass(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for DSLTree.CustomCharacterClass();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = type metadata accessor for DSLTree.Atom.CharacterClass();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DSLTree.Atom.CharacterClass?);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  return a1;
}

uint64_t assignWithCopy for CharacterClass(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for DSLTree.CustomCharacterClass();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = type metadata accessor for DSLTree.Atom.CharacterClass();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DSLTree.Atom.CharacterClass?);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

uint64_t initializeWithTake for CharacterClass(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for DSLTree.CustomCharacterClass();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = type metadata accessor for DSLTree.Atom.CharacterClass();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DSLTree.Atom.CharacterClass?);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  return a1;
}

uint64_t assignWithTake for CharacterClass(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for DSLTree.CustomCharacterClass();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = type metadata accessor for DSLTree.Atom.CharacterClass();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DSLTree.Atom.CharacterClass?);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for CharacterClass(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_239951F24);
}

uint64_t sub_239951F24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for DSLTree.CustomCharacterClass();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DSLTree.Atom.CharacterClass?);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t storeEnumTagSinglePayload for CharacterClass(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_239952034);
}

uint64_t sub_239952034(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for DSLTree.CustomCharacterClass();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DSLTree.Atom.CharacterClass?);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

void type metadata completion function for CharacterClass()
{
  type metadata accessor for DSLTree.CustomCharacterClass();
  if (v0 <= 0x3F)
  {
    type metadata accessor for DSLTree.Atom.CharacterClass?();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void type metadata accessor for DSLTree.Atom.CharacterClass?()
{
  if (!lazy cache variable for type metadata for DSLTree.Atom.CharacterClass?)
  {
    type metadata accessor for DSLTree.Atom.CharacterClass();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for DSLTree.Atom.CharacterClass?);
    }
  }
}

uint64_t getEnumTagSinglePayload for One(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm_1);
}

uint64_t storeEnumTagSinglePayload for One(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm_1);
}

uint64_t type metadata accessor for One()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t getEnumTagSinglePayload for OneOrMore(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm_2);
}

uint64_t storeEnumTagSinglePayload for OneOrMore(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm_2);
}

uint64_t type metadata accessor for OneOrMore()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t getEnumTagSinglePayload for ZeroOrMore(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm_3);
}

uint64_t storeEnumTagSinglePayload for ZeroOrMore(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm_3);
}

uint64_t type metadata accessor for ZeroOrMore()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t getEnumTagSinglePayload for Optionally(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm_4);
}

uint64_t storeEnumTagSinglePayload for Optionally(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm_4);
}

uint64_t type metadata accessor for Optionally()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t getEnumTagSinglePayload for Repeat(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm_5);
}

uint64_t storeEnumTagSinglePayload for Repeat(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm_5);
}

uint64_t type metadata accessor for Repeat()
{
  return __swift_instantiateGenericMetadata();
}

ValueMetadata *type metadata accessor for AlternationBuilder()
{
  return &type metadata for AlternationBuilder;
}

uint64_t getEnumTagSinglePayload for ChoiceOf(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm_6);
}

uint64_t storeEnumTagSinglePayload for ChoiceOf(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm_6);
}

uint64_t type metadata accessor for ChoiceOf()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t getEnumTagSinglePayload for Capture(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm_7);
}

uint64_t storeEnumTagSinglePayload for Capture(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm_7);
}

uint64_t type metadata accessor for Capture()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t getEnumTagSinglePayload for TryCapture(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm_8);
}

uint64_t storeEnumTagSinglePayload for TryCapture(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm_8);
}

uint64_t type metadata accessor for TryCapture()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata completion function for Lookahead()
{
  uint64_t result = type metadata accessor for Regex();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for Lookahead(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Regex();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t destroy for Lookahead(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Regex();
  int v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t initializeWithCopy for Lookahead(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Regex();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for Lookahead(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Regex();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for Lookahead(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Regex();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for Lookahead(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Regex();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for Local(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2399527C8);
}

uint64_t __swift_get_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Regex();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for Local(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_239952850);
}

uint64_t __swift_store_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Regex();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for Local()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata completion function for Reference()
{
  uint64_t result = type metadata accessor for ReferenceID();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for Reference(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ReferenceID();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t destroy for Reference(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ReferenceID();
  int v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t initializeWithCopy for Reference(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ReferenceID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for Reference(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ReferenceID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for Reference(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ReferenceID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for Reference(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ReferenceID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for Reference(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_239952BE0);
}

uint64_t sub_239952BE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ReferenceID();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for Reference(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_239952C60);
}

uint64_t sub_239952C60(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ReferenceID();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for Reference()
{
  return __swift_instantiateGenericMetadata();
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for Anchor.Kind(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF9) {
    goto LABEL_17;
  }
  if (a2 + 7 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 7) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 7;
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
      return (*a1 | (v4 << 8)) - 7;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 7;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v8 = v6 - 8;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for Anchor.Kind(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF8)
  {
    unsigned int v6 = ((a2 - 249) >> 8) + 1;
    *uint64_t result = a2 + 7;
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
        JUMPOUT(0x239952E50);
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
          *uint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

uint64_t getEnumTag for Anchor.Kind(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *destructiveInjectEnumTag for Anchor.Kind(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for Anchor.Kind()
{
  return &type metadata for Anchor.Kind;
}

unint64_t lazy protocol witness table accessor for type Anchor.Kind and conformance Anchor.Kind()
{
  unint64_t result = lazy protocol witness table cache variable for type Anchor.Kind and conformance Anchor.Kind;
  if (!lazy protocol witness table cache variable for type Anchor.Kind and conformance Anchor.Kind)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Anchor.Kind and conformance Anchor.Kind);
  }
  return result;
}

uint64_t specialized Sequence._copySequenceContents(initializing:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v27 = a3;
  uint64_t v28 = a1;
  uint64_t v5 = type metadata accessor for CharacterClass();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  int v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CharacterClass?);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v26 - v13;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CollectionOfOne<CharacterClass>.Iterator);
  uint64_t v16 = MEMORY[0x270FA5388](v15 - 8);
  unint64_t v18 = (char *)&v26 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  unint64_t v20 = (char *)&v26 - v19;
  outlined init with take of CharacterClass(v3, (uint64_t)v14);
  uint64_t v29 = v6;
  uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
  v21(v14, 0, 1, v5);
  v21(v18, 1, 1, v5);
  outlined assign with take of CharacterClass?((uint64_t)v14, (uint64_t)v18);
  uint64_t result = outlined init with take of CollectionOfOne<CharacterClass>((uint64_t)v18, (uint64_t)v20, &demangling cache variable for type metadata for CollectionOfOne<CharacterClass>.Iterator);
  if (!a2)
  {
    uint64_t v24 = 0;
    goto LABEL_10;
  }
  uint64_t v23 = v27;
  if (!v27)
  {
LABEL_7:
    uint64_t v24 = v23;
LABEL_10:
    outlined init with take of CollectionOfOne<CharacterClass>((uint64_t)v20, v28, &demangling cache variable for type metadata for CollectionOfOne<CharacterClass>.Iterator);
    return v24;
  }
  if ((v27 & 0x8000000000000000) == 0)
  {
    uint64_t v24 = 0;
    uint64_t v25 = (unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48);
    while (1)
    {
      outlined init with take of CollectionOfOne<CharacterClass>((uint64_t)v20, (uint64_t)v12, &demangling cache variable for type metadata for CharacterClass?);
      v21(v20, 1, 1, v5);
      if ((*v25)(v12, 1, v5) == 1) {
        break;
      }
      ++v24;
      outlined init with take of CharacterClass((uint64_t)v12, (uint64_t)v8);
      outlined init with take of CharacterClass((uint64_t)v8, a2);
      a2 += *(void *)(v29 + 72);
      if (v23 == v24) {
        goto LABEL_7;
      }
    }
    outlined destroy of DSLTree.Atom.CharacterClass?((uint64_t)v12, &demangling cache variable for type metadata for CharacterClass?);
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t outlined init with copy of DSLTree.Atom.CharacterClass?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t outlined destroy of DSLTree.Atom.CharacterClass?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t outlined assign with take of CharacterClass?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CharacterClass?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with take of CollectionOfOne<CharacterClass>(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t type metadata accessor for ReferenceID()
{
  return MEMORY[0x270FA2988]();
}

uint64_t _RegexFactory.characterClass<A>(_:)()
{
  return MEMORY[0x270FA29A8]();
}

uint64_t _RegexFactory.symbolicReference<A>(_:)()
{
  return MEMORY[0x270FA29B8]();
}

uint64_t _RegexFactory.customCharacterClass<A>(_:)()
{
  return MEMORY[0x270FA29C0]();
}

uint64_t _RegexFactory.char<A>(_:)()
{
  return MEMORY[0x270FA29D8]();
}

uint64_t _RegexFactory.empty<A>()()
{
  return MEMORY[0x270FA29E0]();
}

uint64_t _RegexFactory.scalar<A>(_:)()
{
  return MEMORY[0x270FA29E8]();
}

uint64_t _RegexFactory.assertion<A>(_:)()
{
  return MEMORY[0x270FA2A08]();
}

uint64_t _RegexFactory.init()()
{
  return MEMORY[0x270FA2A20]();
}

uint64_t type metadata accessor for _RegexFactory()
{
  return MEMORY[0x270FA2A28]();
}

uint64_t dispatch thunk of RegexComponent.regex.getter()
{
  return MEMORY[0x270FA2A50]();
}

uint64_t Regex.init(verbatim:)()
{
  return MEMORY[0x270FA2AD0]();
}

uint64_t type metadata accessor for Regex()
{
  return MEMORY[0x270FA2AE0]();
}

uint64_t static DSLTree.CustomCharacterClass.generalCategory(_:)()
{
  return MEMORY[0x270FA2AE8]();
}

uint64_t type metadata accessor for DSLTree.CustomCharacterClass.Member()
{
  return MEMORY[0x270FA2AF0]();
}

uint64_t DSLTree.CustomCharacterClass.init(members:isInverted:)()
{
  return MEMORY[0x270FA2AF8]();
}

uint64_t DSLTree.CustomCharacterClass.inverted.getter()
{
  return MEMORY[0x270FA2B00]();
}

uint64_t type metadata accessor for DSLTree.CustomCharacterClass()
{
  return MEMORY[0x270FA2B08]();
}

uint64_t DSLTree.Atom.CharacterClass.inverted.getter()
{
  return MEMORY[0x270FA2B10]();
}

uint64_t type metadata accessor for DSLTree.Atom.CharacterClass()
{
  return MEMORY[0x270FA2B18]();
}

uint64_t type metadata accessor for DSLTree.Atom.Assertion()
{
  return MEMORY[0x270FA2B20]();
}

uint64_t type metadata accessor for DSLTree.Atom()
{
  return MEMORY[0x270FA2B28]();
}

uint64_t BidirectionalCollection<>.firstMatch<A, B>(of:)()
{
  return MEMORY[0x270FA2B38]();
}

uint64_t BidirectionalCollection<>.firstRange<A>(of:)()
{
  return MEMORY[0x270FA2B40]();
}

uint64_t BidirectionalCollection<>.trimmingPrefix<A>(_:)()
{
  return MEMORY[0x270FA2B58]();
}

uint64_t BidirectionalCollection<>.split<A>(separator:maxSplits:omittingEmptySubsequences:)()
{
  return MEMORY[0x270FA2B60]();
}

uint64_t BidirectionalCollection<>.ranges<A>(of:)()
{
  return MEMORY[0x270FA2B68]();
}

uint64_t BidirectionalCollection<>.matches<A, B>(of:)()
{
  return MEMORY[0x270FA2B78]();
}

uint64_t static String._fromSubstring(_:)()
{
  return MEMORY[0x270F9D648]();
}

uint64_t dispatch thunk of Sequence.makeIterator()()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t dispatch thunk of Sequence.underestimatedCount.getter()
{
  return MEMORY[0x270F9D908]();
}

uint64_t RangeReplaceableCollection<>.trimPrefix<A>(_:)()
{
  return MEMORY[0x270FA2BB0]();
}

uint64_t RangeReplaceableCollection<>.replace<A, B, C>(_:maxReplacements:with:)()
{
  return MEMORY[0x270FA2BD0]();
}

uint64_t RangeReplaceableCollection<>.replace<A, B>(_:with:maxReplacements:)()
{
  return MEMORY[0x270FA2BD8]();
}

uint64_t RangeReplaceableCollection<>.replacing<A, B, C>(_:maxReplacements:with:)()
{
  return MEMORY[0x270FA2BE0]();
}

uint64_t RangeReplaceableCollection<>.replacing<A, B>(_:with:maxReplacements:)()
{
  return MEMORY[0x270FA2BE8]();
}

uint64_t RangeReplaceableCollection<>.replacing<A, B>(_:with:subrange:maxReplacements:)()
{
  return MEMORY[0x270FA2BF0]();
}

uint64_t RangeReplaceableCollection<>.replacing<A, B, C>(_:subrange:maxReplacements:with:)()
{
  return MEMORY[0x270FA2BF8]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t dispatch thunk of IteratorProtocol.next()()
{
  return MEMORY[0x270F9E518]();
}

Swift::Void __swiftcall ContiguousArray.reserveCapacity(_:)(Swift::Int a1)
{
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

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
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

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}