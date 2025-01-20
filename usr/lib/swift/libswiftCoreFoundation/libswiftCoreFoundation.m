BOOL protocol witness for static Comparable.< infix(_:_:) in conformance CGFloat(double *a1, double *a2)
{
  return *a1 < *a2;
}

BOOL protocol witness for static Comparable.>= infix(_:_:) in conformance CGFloat(double *a1, double *a2)
{
  return *a2 <= *a1;
}

double protocol witness for Numeric.magnitude.getter in conformance CGFloat@<D0>(double *a1@<X8>)
{
  double result = fabs(*v1);
  *a1 = result;
  return result;
}

CFHashCode _CFObject.hashValue.getter()
{
  return CFHash(v0);
}

ValueMetadata *type metadata accessor for CGFloat()
{
  return &type metadata for CGFloat;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance CGFloat(double *a1, double *a2)
{
  return *a1 == *a2;
}

uint64_t protocol witness for FloatingPoint.sign.getter in conformance CGFloat()
{
  return *v0 >> 63;
}

double protocol witness for ExpressibleByIntegerLiteral.init(integerLiteral:) in conformance CGFloat@<D0>(uint64_t *a1@<X0>, double *a2@<X8>)
{
  double result = (double)*a1;
  *a2 = result;
  return result;
}

double protocol witness for static Numeric.*= infix(_:_:) in conformance CGFloat(double *a1, double *a2)
{
  double result = *a2 * *a1;
  *a1 = result;
  return result;
}

double protocol witness for static Numeric.* infix(_:_:) in conformance CGFloat@<D0>(double *a1@<X0>, double *a2@<X1>, double *a3@<X8>)
{
  double result = *a1 * *a2;
  *a3 = result;
  return result;
}

double protocol witness for static FloatingPoint./= infix(_:_:) in conformance CGFloat(double *a1, double *a2)
{
  double result = *a1 / *a2;
  *a1 = result;
  return result;
}

uint64_t protocol witness for CVarArg._cVarArgEncoding.getter in conformance CGFloat()
{
  uint64_t v1 = *v0;
  uint64_t result = static Array._allocateBufferUninitialized(minimumCapacity:)();
  *(void *)(result + 16) = 1;
  *(void *)(result + 32) = v1;
  return result;
}

uint64_t protocol witness for FloatingPoint.round(_:) in conformance CGFloat(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for FloatingPointRoundingRule();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790]();
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v4 + 88))(v6, v3);
  if (result == *MEMORY[0x1E4FBBEA0])
  {
    double *v1 = round(*v1);
    return result;
  }
  if (result == *MEMORY[0x1E4FBBE98])
  {
    double *v1 = rint(*v1);
    return result;
  }
  if (result == *MEMORY[0x1E4FBBEA8])
  {
    double v8 = *v1;
LABEL_7:
    double *v1 = ceil(v8);
    return result;
  }
  if (result == *MEMORY[0x1E4FBBEB0])
  {
    double v8 = *v1;
LABEL_10:
    double *v1 = floor(v8);
    return result;
  }
  if (result == *MEMORY[0x1E4FBBE88])
  {
    double *v1 = trunc(*v1);
  }
  else
  {
    if (result == *MEMORY[0x1E4FBBE90])
    {
      double v8 = *v1;
      if ((*(void *)v1 & 0x8000000000000000) == 0) {
        goto LABEL_7;
      }
      goto LABEL_10;
    }
    Double._roundSlowPath(_:)();
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  return result;
}

void protocol witness for BinaryFloatingPoint.init<A>(_:) in conformance CGFloat(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, double *a4@<X8>)
{
  *a4 = specialized BinaryFloatingPoint.init<A>(_:)(a1, a2, a3);
}

double specialized BinaryFloatingPoint.init<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v76 = a1;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v72 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v73 = AssociatedTypeWitness;
  ((void (*)(void))MEMORY[0x1F4188790])();
  v71 = (char *)&v68 - v6;
  uint64_t v7 = swift_getAssociatedTypeWitness();
  uint64_t v69 = *(void *)(v7 - 8);
  uint64_t v70 = v7;
  uint64_t v8 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  v68 = (char *)&v68 - v9;
  uint64_t v75 = *(void *)(a2 - 8);
  uint64_t v10 = MEMORY[0x1F4188790](v8);
  v12 = (char *)&v68 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x1F4188790](v10);
  v15 = (char *)&v68 - v14;
  uint64_t v16 = MEMORY[0x1F4188790](v13);
  v18 = (char *)&v68 - v17;
  uint64_t v19 = MEMORY[0x1F4188790](v16);
  v21 = (char *)&v68 - v20;
  uint64_t v22 = MEMORY[0x1F4188790](v19);
  v24 = (char *)&v68 - v23;
  MEMORY[0x1F4188790](v22);
  v26 = (char *)&v68 - v25;
  uint64_t v27 = dispatch thunk of static BinaryFloatingPoint.exponentBitCount.getter();
  uint64_t v74 = a3;
  uint64_t v28 = dispatch thunk of static BinaryFloatingPoint.significandBitCount.getter();
  if (v27 == 11)
  {
    if (v28 == 52)
    {
      uint64_t v34 = v75;
      uint64_t v33 = v76;
      (*(void (**)(char *, uint64_t, uint64_t))(v75 + 16))(v15, v76, a2);
      int v35 = swift_dynamicCast();
      _D8 = v77;
      (*(void (**)(char *, uint64_t, uint64_t))(v34 + 32))(v12, v33, a2);
      if (v35)
      {
        (*(void (**)(char *, uint64_t))(v34 + 8))(v12, a2);
      }
      else
      {
        uint64_t v54 = dispatch thunk of FloatingPoint.sign.getter();
        v55 = v68;
        dispatch thunk of BinaryFloatingPoint.exponentBitPattern.getter();
        uint64_t v56 = v70;
        swift_getAssociatedConformanceWitness();
        __int16 v57 = dispatch thunk of BinaryInteger._lowWord.getter();
        (*(void (**)(char *, uint64_t))(v69 + 8))(v55, v56);
        v58 = v71;
        dispatch thunk of BinaryFloatingPoint.significandBitPattern.getter();
        (*(void (**)(char *, uint64_t))(v34 + 8))(v12, a2);
        uint64_t v59 = v73;
        swift_getAssociatedConformanceWitness();
        uint64_t v60 = dispatch thunk of BinaryInteger._lowWord.getter();
        (*(void (**)(char *, uint64_t))(v72 + 8))(v58, v59);
        *(void *)&_D8 = (v54 << 63) | ((unint64_t)(v57 & 0x7FF) << 52) | v60 & 0xFFFFFFFFFFFFFLL;
      }
      return _D8;
    }
LABEL_13:
    lazy protocol witness table accessor for type CGFloat and conformance CGFloat();
    uint64_t v41 = v76;
    static BinaryFloatingPoint._convert<A>(from:)();
    (*(void (**)(uint64_t, uint64_t))(v75 + 8))(v41, a2);
    return v77;
  }
  if (v27 == 8)
  {
    if (v28 == 23)
    {
      uint64_t v38 = v75;
      uint64_t v37 = v76;
      (*(void (**)(char *, uint64_t, uint64_t))(v75 + 16))(v21, v76, a2);
      int v39 = swift_dynamicCast();
      float v40 = *(float *)&v77;
      (*(void (**)(char *, uint64_t, uint64_t))(v38 + 32))(v18, v37, a2);
      if (v39)
      {
        (*(void (**)(char *, uint64_t))(v38 + 8))(v18, a2);
        return v40;
      }
      else
      {
        int v61 = dispatch thunk of FloatingPoint.sign.getter();
        v62 = v68;
        dispatch thunk of BinaryFloatingPoint.exponentBitPattern.getter();
        uint64_t v63 = v70;
        swift_getAssociatedConformanceWitness();
        unsigned __int8 v64 = dispatch thunk of BinaryInteger._lowWord.getter();
        (*(void (**)(char *, uint64_t))(v69 + 8))(v62, v63);
        v65 = v71;
        dispatch thunk of BinaryFloatingPoint.significandBitPattern.getter();
        (*(void (**)(char *, uint64_t))(v38 + 8))(v18, a2);
        uint64_t v66 = v73;
        swift_getAssociatedConformanceWitness();
        int v67 = dispatch thunk of BinaryInteger._lowWord.getter();
        (*(void (**)(char *, uint64_t))(v72 + 8))(v65, v66);
        return COERCE_FLOAT((v61 << 31) | (v64 << 23) | v67 & 0x7FFFFF);
      }
    }
    goto LABEL_13;
  }
  if (v27 != 5 || v28 != 10) {
    goto LABEL_13;
  }
  uint64_t v29 = v75;
  uint64_t v30 = v76;
  (*(void (**)(char *, uint64_t, uint64_t))(v75 + 16))(v26, v76, a2);
  int v31 = swift_dynamicCast();
  _H8 = LOWORD(v77);
  (*(void (**)(char *, uint64_t, uint64_t))(v29 + 32))(v24, v30, a2);
  if (v31)
  {
    (*(void (**)(char *, uint64_t))(v29 + 8))(v24, a2);
  }
  else
  {
    __int16 v43 = dispatch thunk of FloatingPoint.sign.getter();
    v44 = v68;
    dispatch thunk of BinaryFloatingPoint.exponentBitPattern.getter();
    uint64_t v45 = v70;
    swift_getAssociatedConformanceWitness();
    char v46 = dispatch thunk of BinaryInteger._lowWord.getter();
    (*(void (**)(char *, uint64_t))(v69 + 8))(v44, v45);
    v47 = v71;
    dispatch thunk of BinaryFloatingPoint.significandBitPattern.getter();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v24, a2);
    uint64_t v48 = v73;
    swift_getAssociatedConformanceWitness();
    __int16 v49 = dispatch thunk of BinaryInteger._lowWord.getter();
    (*(void (**)(char *, uint64_t))(v72 + 8))(v47, v48);
    _H8 = (v43 << 15) | ((v46 & 0x1F) << 10) | v49 & 0x3FF;
  }
  __asm { FCVT            D8, H8 }
  return _D8;
}

void protocol witness for BinaryFloatingPoint.significandBitPattern.getter in conformance CGFloat(uint64_t *a1@<X8>)
{
  *a1 = *v1 & 0xFFFFFFFFFFFFFLL;
}

uint64_t protocol witness for static BinaryFloatingPoint.significandBitCount.getter in conformance CGFloat()
{
  return 52;
}

void protocol witness for BinaryFloatingPoint.exponentBitPattern.getter in conformance CGFloat(uint64_t *a1@<X8>)
{
  *a1 = (*v1 >> 52) & 0x7FFLL;
}

uint64_t protocol witness for static BinaryFloatingPoint.exponentBitCount.getter in conformance CGFloat()
{
  return 11;
}

BOOL static _CFObject.== infix(_:_:)(const void *a1, const void *a2)
{
  return CFEqual(a1, a2) != 0;
}

uint64_t protocol witness for Encodable.encode(to:) in conformance CGFloat(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  dispatch thunk of Encoder.singleValueContainer()();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v2, v2[3]);
  dispatch thunk of SingleValueEncodingContainer.encode(_:)();
  return __swift_destroy_boxed_opaque_existential_1(v2);
}

uint64_t protocol witness for Decodable.init(from:) in conformance CGFloat@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  v15 = a2;
  uint64_t v4 = type metadata accessor for DecodingError.Context();
  v14[3] = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v6 = (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for DecodingError();
  v14[4] = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  dispatch thunk of Decoder.singleValueContainer()();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1(a1);
  }
  v14[1] = v6;
  v14[2] = v9;
  uint64_t v10 = v15;
  __swift_project_boxed_opaque_existential_1(v16, v16[3]);
  dispatch thunk of SingleValueDecodingContainer.decode(_:)();
  uint64_t v12 = v11;
  __swift_destroy_boxed_opaque_existential_1(v16);
  uint64_t result = __swift_destroy_boxed_opaque_existential_1(a1);
  *uint64_t v10 = v12;
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return MEMORY[0x1F4186758](*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

void _CFObject.hash(into:)()
{
  Swift::UInt v0 = dispatch thunk of Hashable.hashValue.getter();
  Hasher._combine(_:)(v0);
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

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

double protocol witness for static AdditiveArithmetic.-= infix(_:_:) in conformance CGFloat(double *a1, double *a2)
{
  double result = *a1 - *a2;
  *a1 = result;
  return result;
}

double protocol witness for static AdditiveArithmetic.+= infix(_:_:) in conformance CGFloat(double *a1, double *a2)
{
  double result = *a2 + *a1;
  *a1 = result;
  return result;
}

void protocol witness for static AdditiveArithmetic.zero.getter in conformance CGFloat(void *a1@<X8>)
{
  *a1 = 0;
}

unint64_t lazy protocol witness table accessor for type CGFloat and conformance CGFloat()
{
  unint64_t result = lazy protocol witness table cache variable for type CGFloat and conformance CGFloat;
  if (!lazy protocol witness table cache variable for type CGFloat and conformance CGFloat)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CGFloat and conformance CGFloat);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CGFloat and conformance CGFloat;
  if (!lazy protocol witness table cache variable for type CGFloat and conformance CGFloat)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CGFloat and conformance CGFloat);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CGFloat and conformance CGFloat;
  if (!lazy protocol witness table cache variable for type CGFloat and conformance CGFloat)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CGFloat and conformance CGFloat);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CGFloat and conformance CGFloat;
  if (!lazy protocol witness table cache variable for type CGFloat and conformance CGFloat)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CGFloat and conformance CGFloat);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CGFloat and conformance CGFloat;
  if (!lazy protocol witness table cache variable for type CGFloat and conformance CGFloat)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CGFloat and conformance CGFloat);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CGFloat and conformance CGFloat;
  if (!lazy protocol witness table cache variable for type CGFloat and conformance CGFloat)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CGFloat and conformance CGFloat);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CGFloat and conformance CGFloat;
  if (!lazy protocol witness table cache variable for type CGFloat and conformance CGFloat)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CGFloat and conformance CGFloat);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CGFloat and conformance CGFloat;
  if (!lazy protocol witness table cache variable for type CGFloat and conformance CGFloat)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CGFloat and conformance CGFloat);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CGFloat and conformance CGFloat;
  if (!lazy protocol witness table cache variable for type CGFloat and conformance CGFloat)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CGFloat and conformance CGFloat);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CGFloat and conformance CGFloat;
  if (!lazy protocol witness table cache variable for type CGFloat and conformance CGFloat)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CGFloat and conformance CGFloat);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CGFloat and conformance CGFloat;
  if (!lazy protocol witness table cache variable for type CGFloat and conformance CGFloat)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CGFloat and conformance CGFloat);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CGFloat and conformance CGFloat;
  if (!lazy protocol witness table cache variable for type CGFloat and conformance CGFloat)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CGFloat and conformance CGFloat);
  }
  return result;
}

uint64_t associated type witness table accessor for ExpressibleByIntegerLiteral.IntegerLiteralType : _ExpressibleByBuiltinIntegerLiteral in CGFloat()
{
  return MEMORY[0x1E4FBB5C0];
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance CGFloat()
{
  return MEMORY[0x1F4184008](*v0);
}

unint64_t lazy protocol witness table accessor for type UInt and conformance UInt()
{
  unint64_t result = lazy protocol witness table cache variable for type UInt and conformance UInt;
  if (!lazy protocol witness table cache variable for type UInt and conformance UInt)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UInt and conformance UInt);
  }
  return result;
}

CoreGraphics::CGFloat __swiftcall CGFloat.init()()
{
  return 0;
}

CoreGraphics::CGFloat __swiftcall CGFloat.init(_:)(Swift::Float a1)
{
  result.native = a1;
  return result;
}

void CGFloat.native.setter(double a1)
{
  double *v1 = a1;
}

uint64_t (*CGFloat.native.modify())()
{
  return CGFloat.native.modify;
}

uint64_t CGFloat.init<A>(exactly:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 - 8);
  MEMORY[0x1F4188790](a1);
  uint64_t v6 = (uint64_t)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v6, a1, a2);
  uint64_t v7 = Double.init<A>(exactly:)(v6, a2);
  LOBYTE(v6) = v8;
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, a2);
  if (v6) {
    return 0;
  }
  else {
    return v7;
  }
}

uint64_t Double.init<A>(exactly:)(uint64_t a1, uint64_t a2)
{
  if (dispatch thunk of BinaryInteger.bitWidth.getter() > 64)
  {
    lazy protocol witness table accessor for type Double and conformance Double();
    lazy protocol witness table accessor for type UInt64 and conformance UInt64();
    char v4 = static BinaryFloatingPoint<>._convert<A>(from:)();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 8))(a1, a2);
    if (v4) {
      return v11;
    }
    goto LABEL_13;
  }
  char v6 = dispatch thunk of static BinaryInteger.isSigned.getter();
  uint64_t v7 = dispatch thunk of BinaryInteger._lowWord.getter();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 8))(a1, a2);
  if (v6)
  {
    double v8 = (double)v7;
    if ((double)v7 < 9.22337204e18)
    {
      *(double *)&uint64_t result = (double)v7;
      if ((~*(void *)&v8 & 0x7FF0000000000000) != 0)
      {
        if (v8 > -9.22337204e18)
        {
          uint64_t v9 = (uint64_t)v8;
          goto LABEL_12;
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
      goto LABEL_17;
    }
  }
  else
  {
    double v10 = (double)(unint64_t)v7;
    if ((double)(unint64_t)v7 < 1.84467441e19)
    {
      *(double *)&uint64_t result = (double)(unint64_t)v7;
      if ((~*(void *)&v10 & 0x7FF0000000000000) != 0)
      {
        uint64_t v9 = (unint64_t)v10;
LABEL_12:
        if (v7 == v9) {
          return result;
        }
        goto LABEL_13;
      }
LABEL_17:
      __break(1u);
      return result;
    }
  }
LABEL_13:
  *(double *)&uint64_t result = 0.0;
  return result;
}

double CGFloat.magnitude.getter(double a1)
{
  return fabs(a1);
}

double protocol witness for static SignedNumeric.- prefix(_:) in conformance CGFloat@<D0>(double *a1@<X0>, double *a2@<X8>)
{
  double result = -*a1;
  *a2 = result;
  return result;
}

double protocol witness for SignedNumeric.negate() in conformance CGFloat()
{
  double result = -*v0;
  double *v0 = result;
  return result;
}

Swift::Void __swiftcall CGFloat.negate()()
{
  double *v0 = -*v0;
}

double static CGFloat.* infix(_:_:)(double a1, double a2)
{
  return a1 * a2;
}

double static CGFloat.*= infix(_:_:)(double *a1, double a2)
{
  double result = *a1 * a2;
  *a1 = result;
  return result;
}

double protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance CGFloat@<D0>(double *a1@<X0>, double *a2@<X1>, double *a3@<X8>)
{
  double result = *a1 + *a2;
  *a3 = result;
  return result;
}

double static CGFloat.+ infix(_:_:)(double a1, double a2)
{
  return a1 + a2;
}

double static CGFloat.+= infix(_:_:)(double *a1, double a2)
{
  double result = *a1 + a2;
  *a1 = result;
  return result;
}

double protocol witness for static AdditiveArithmetic.- infix(_:_:) in conformance CGFloat@<D0>(double *a1@<X0>, double *a2@<X1>, double *a3@<X8>)
{
  double result = *a1 - *a2;
  *a3 = result;
  return result;
}

double static CGFloat.- infix(_:_:)(double a1, double a2)
{
  return a1 - a2;
}

double static CGFloat.-= infix(_:_:)(double *a1, double a2)
{
  double result = *a1 - a2;
  *a1 = result;
  return result;
}

CoreGraphics::CGFloat __swiftcall CGFloat.init(integerLiteral:)(Swift::Int integerLiteral)
{
  result.native = (double)integerLiteral;
  return result;
}

uint64_t static CGFloat.exponentBitCount.getter()
{
  return 11;
}

uint64_t static CGFloat.significandBitCount.getter()
{
  return 52;
}

CoreGraphics::CGFloat __swiftcall CGFloat.init(bitPattern:)(Swift::UInt bitPattern)
{
  return (CoreGraphics::CGFloat)bitPattern;
}

uint64_t CGFloat.sign.getter(double a1)
{
  return *(void *)&a1 >> 63;
}

uint64_t CGFloat.exponentBitPattern.getter(double a1)
{
  return (*(void *)&a1 >> 52) & 0x7FFLL;
}

uint64_t CGFloat.significandBitPattern.getter(double a1)
{
  return *(void *)&a1 & 0xFFFFFFFFFFFFFLL;
}

double CGFloat.init(sign:exponentBitPattern:significandBitPattern:)(uint64_t a1, __int16 a2, uint64_t a3)
{
  *(void *)&double result = ((unint64_t)(a2 & 0x7FF) << 52) | (a1 << 63) | a3 & 0xFFFFFFFFFFFFFLL;
  return result;
}

CoreGraphics::CGFloat __swiftcall CGFloat.init(nan:signaling:)(Swift::UInt nan, Swift::Bool signaling)
{
  if (!(nan >> 50)) {
    return (CoreGraphics::CGFloat)((0x8000000000000uLL >> signaling) | nan | 0x7FF0000000000000);
  }
  __break(1u);
  return result;
}

double static CGFloat.infinity.getter()
{
  return INFINITY;
}

double static CGFloat.nan.getter()
{
  return NAN;
}

double static CGFloat.signalingNaN.getter()
{
  return NAN;
}

void static CGFloat.quietNaN.getter()
{
}

double static CGFloat.greatestFiniteMagnitude.getter()
{
  return 1.79769313e308;
}

double static CGFloat.pi.getter()
{
  return 3.14159265;
}

double CGFloat.ulp.getter(double a1)
{
  uint64_t v2 = (*(void *)&a1 >> 52) & 0x7FFLL;
  if (v2)
  {
    double result = NAN;
    if (v2 != 2047) {
      return COERCE_DOUBLE(*(void *)&a1 & 0x7FF0000000000000) * 2.22044605e-16;
    }
  }
  else
  {
    *(void *)&double result = 1;
  }
  return result;
}

double static CGFloat.leastNormalMagnitude.getter()
{
  return 2.22507386e-308;
}

double static CGFloat.leastNonzeroMagnitude.getter()
{
  *(void *)&double result = 1;
  return result;
}

unint64_t CGFloat.exponent.getter(double a1)
{
  uint64_t v1 = (*(void *)&a1 >> 52) & 0x7FFLL;
  if (v1 == 2047) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v3 = *(void *)&a1 & 0xFFFFFFFFFFFFFLL;
  if (!(v1 | *(void *)&a1 & 0xFFFFFFFFFFFFFLL)) {
    return 0x8000000000000000;
  }
  if (v1) {
    return v1 - 1023;
  }
  if (v3) {
    return -1011 - __clz(v3);
  }
  __break(1u);
  return result;
}

double CGFloat.significand.getter(double result)
{
  uint64_t v1 = (*(void *)&result >> 52) & 0x7FFLL;
  unint64_t v2 = *(void *)&result & 0xFFFFFFFFFFFFFLL;
  if ((*(void *)&result & 0xFFFFFFFFFFFFFLL) == 0 || v1 != 2047)
  {
    if (v1)
    {
      if (v1 != 2047)
      {
        *(void *)&unint64_t result = v2 | 0x3FF0000000000000;
        return result;
      }
    }
    else if (v2)
    {
      *(void *)&unint64_t result = (*(void *)&result << (__clz(v2) + 53)) & 0xFFFFFFFFFFFFFLL | 0x3FF0000000000000;
      return result;
    }
    *(void *)&unint64_t result = v1 << 52;
  }
  return result;
}

double CGFloat.init(sign:exponent:significand:)(char a1, uint64_t a2, double a3)
{
  return specialized Double.init(sign:exponent:significand:)(a1 & 1, a2, a3);
}

uint64_t CGFloat.round(_:)(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for FloatingPointRoundingRule();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  char v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v4 + 88))(v6, v3);
  if (result == *MEMORY[0x1E4FBBEA0])
  {
    double *v1 = round(*v1);
    return result;
  }
  if (result == *MEMORY[0x1E4FBBE98])
  {
    double *v1 = rint(*v1);
    return result;
  }
  if (result == *MEMORY[0x1E4FBBEA8])
  {
    double v8 = *v1;
LABEL_7:
    double *v1 = ceil(v8);
    return result;
  }
  if (result == *MEMORY[0x1E4FBBEB0])
  {
    double v8 = *v1;
LABEL_10:
    double *v1 = floor(v8);
    return result;
  }
  if (result == *MEMORY[0x1E4FBBE88])
  {
    double *v1 = trunc(*v1);
  }
  else
  {
    if (result == *MEMORY[0x1E4FBBE90])
    {
      double v8 = *v1;
      if ((*(void *)v1 & 0x8000000000000000) == 0) {
        goto LABEL_7;
      }
      goto LABEL_10;
    }
    Double._roundSlowPath(_:)();
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  return result;
}

double CGFloat.nextUp.getter(double a1)
{
  double result = a1 + 0.0;
  if (result < INFINITY) {
    *(void *)&result += (*(uint64_t *)&result >> 63) | 1;
  }
  return result;
}

double static CGFloat./= infix(_:_:)(double *a1, double a2)
{
  double result = *a1 / a2;
  *a1 = result;
  return result;
}

Swift::Void __swiftcall CGFloat.formTruncatingRemainder(dividingBy:)(CoreGraphics::CGFloat dividingBy)
{
  long double *v1 = fmod(*v1, dividingBy.native);
}

Swift::Void __swiftcall CGFloat.formRemainder(dividingBy:)(CoreGraphics::CGFloat dividingBy)
{
  long double *v1 = remainder(*v1, dividingBy.native);
}

Swift::Void __swiftcall CGFloat.formSquareRoot()()
{
  double *v0 = sqrt(*v0);
}

Swift::Void __swiftcall CGFloat.addProduct(_:_:)(CoreGraphics::CGFloat a1, CoreGraphics::CGFloat a2)
{
  *unint64_t v2 = *v2 + a1.native * a2.native;
}

Swift::Bool __swiftcall CGFloat.isEqual(to:)(CoreGraphics::CGFloat to)
{
  return v1 == to.native;
}

Swift::Bool __swiftcall CGFloat.isLess(than:)(CoreGraphics::CGFloat than)
{
  return v1 < than.native;
}

Swift::Bool __swiftcall CGFloat.isLessThanOrEqualTo(_:)(CoreGraphics::CGFloat a1)
{
  return v1 <= a1.native;
}

BOOL CGFloat.isNormal.getter(double a1)
{
  return ((*(void *)&a1 >> 52) & 0x7FFLL) != 0x7FF && ((*(void *)&a1 >> 52) & 0x7FFLL) != 0;
}

BOOL CGFloat.isFinite.getter(double a1)
{
  return (~*(void *)&a1 & 0x7FF0000000000000) != 0;
}

BOOL CGFloat.isZero.getter(double a1)
{
  return (*(void *)&a1 & 0x7FFFFFFFFFFFFFFFLL) == 0;
}

BOOL CGFloat.isSubnormal.getter(double a1)
{
  return (*(void *)&a1 & 0xFFFFFFFFFFFFFLL) != 0 && (*(void *)&a1 & 0x7FF0000000000000) == 0;
}

BOOL CGFloat.isInfinite.getter(double a1)
{
  return (*(void *)&a1 & 0x7FFFFFFFFFFFFFFFLL) == 0x7FF0000000000000;
}

BOOL CGFloat.isNaN.getter(double a1)
{
  return (*(void *)&a1 & 0xFFFFFFFFFFFFFLL) != 0 && (~*(void *)&a1 & 0x7FF0000000000000) == 0;
}

BOOL CGFloat.isSignalingNaN.getter(double a1)
{
  return (~*(void *)&a1 & 0x7FF0000000000000) == 0
      && (*(void *)&a1 & 0xFFFFFFFFFFFFFLL) != 0
      && (*(void *)&a1 & 0x8000000000000) == 0;
}

void CGFloat.isSignaling.getter()
{
}

uint64_t CGFloat.isCanonical.getter()
{
  return 1;
}

double CGFloat.binade.getter(double a1)
{
  uint64_t v1 = (*(void *)&a1 >> 52) & 0x7FFLL;
  if (v1 == 2047) {
    return NAN;
  }
  if ((*(void *)&a1 & 0xFFFFFFFFFFFFFLL) != 0 && !v1) {
    return COERCE_DOUBLE(COERCE_UNSIGNED_INT64(a1 * 4.50359963e15) & 0xFFF0000000000000) * 2.22044605e-16;
  }
  *(void *)&double result = *(void *)&a1 & 0xFFF0000000000000;
  return result;
}

uint64_t CGFloat.significandWidth.getter(double a1)
{
  unint64_t v1 = *(void *)&a1 & 0xFFFFFFFFFFFFFLL;
  unint64_t v2 = __clz(__rbit64(*(void *)&a1 & 0xFFFFFFFFFFFFFLL));
  uint64_t v3 = (*(void *)&a1 >> 52) & 0x7FFLL;
  if (v3 && v3 != 2047)
  {
    unint64_t v6 = 52 - v2;
    if (v1) {
      return v6;
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v4 = 63 - __clz(v1) - v2;
    if (v3) {
      uint64_t v4 = -1;
    }
    if (v1) {
      return v4;
    }
    else {
      return -1;
    }
  }
}

uint64_t protocol witness for BinaryFloatingPoint.init(sign:exponentBitPattern:significandBitPattern:) in conformance CGFloat@<X0>(uint64_t result@<X0>, void *a2@<X1>, void *a3@<X2>, uint64_t *a4@<X8>)
{
  *a4 = (result << 63) | ((*a2 & 0x7FFLL) << 52) | *a3 & 0xFFFFFFFFFFFFFLL;
  return result;
}

double protocol witness for BinaryFloatingPoint.init(_:) in conformance CGFloat@<D0>(double *a1@<X8>, float a2@<S0>)
{
  double result = a2;
  *a1 = result;
  return result;
}

void protocol witness for BinaryFloatingPoint.init(_:) in conformance CGFloat(double *a1@<X8>, double a2@<D0>)
{
  *a1 = a2;
}

uint64_t protocol witness for BinaryFloatingPoint.init<A>(exactly:) in conformance CGFloat@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t result = specialized BinaryFloatingPoint.init<A>(exactly:)(a1, a2, a3);
  *(void *)a4 = result;
  *(unsigned char *)(a4 + 8) = v6 & 1;
  return result;
}

uint64_t specialized BinaryFloatingPoint.init<A>(exactly:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_getAssociatedTypeWitness();
  v154 = *(char **)(swift_getAssociatedConformanceWitness() + 8);
  uint64_t v149 = *(void *)(*((void *)v154 + 3) + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x1F4188790](AssociatedTypeWitness);
  v148 = (char *)&v135 - v6;
  uint64_t v7 = swift_checkMetadataState();
  v157 = *(char **)(v7 - 8);
  uint64_t v8 = MEMORY[0x1F4188790](v7);
  double v10 = (char *)&v135 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x1F4188790](v8);
  v146 = (char *)&v135 - v12;
  uint64_t v13 = MEMORY[0x1F4188790](v11);
  v145 = (char *)&v135 - v14;
  uint64_t v15 = MEMORY[0x1F4188790](v13);
  v144 = (char *)&v135 - v16;
  uint64_t v17 = MEMORY[0x1F4188790](v15);
  v143 = (char *)&v135 - v18;
  uint64_t v19 = MEMORY[0x1F4188790](v17);
  v141 = (char *)&v135 - v20;
  uint64_t v21 = MEMORY[0x1F4188790](v19);
  v152 = (char *)&v135 - v22;
  uint64_t v23 = MEMORY[0x1F4188790](v21);
  v150 = (char *)&v135 - v24;
  uint64_t v25 = MEMORY[0x1F4188790](v23);
  v142 = (char *)&v135 - v26;
  uint64_t v27 = MEMORY[0x1F4188790](v25);
  v151 = (char *)&v135 - v28;
  uint64_t v29 = MEMORY[0x1F4188790](v27);
  v153 = (char *)&v135 - v30;
  uint64_t v31 = MEMORY[0x1F4188790](v29);
  v156 = (char *)&v135 - v32;
  uint64_t v33 = MEMORY[0x1F4188790](v31);
  v155 = (char *)&v135 - v34;
  uint64_t v35 = *(void *)(a2 - 8);
  uint64_t v36 = MEMORY[0x1F4188790](v33);
  uint64_t v38 = (char *)&v135 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v36);
  float v40 = (char *)&v135 - v39;
  if (dispatch thunk of FloatingPoint.isNaN.getter())
  {
    (*(void (**)(uint64_t, uint64_t))(v35 + 8))(a1, a2);
    return 0;
  }
  v139 = (char *)v7;
  uint64_t v42 = dispatch thunk of static BinaryFloatingPoint.exponentBitCount.getter();
  uint64_t v140 = a3;
  uint64_t v43 = a1;
  int v44 = v42 > 11 || dispatch thunk of static BinaryFloatingPoint.significandBitCount.getter() > 52;
  uint64_t v45 = *(void (**)(char *, uint64_t, uint64_t))(v35 + 16);
  v45(v40, v43, a2);
  if (v44) {
    LOBYTE(v44) = dispatch thunk of FloatingPoint.isFinite.getter();
  }
  v47 = *(void (**)(char *, uint64_t))(v35 + 8);
  uint64_t v46 = v35 + 8;
  uint64_t v48 = v40;
  __int16 v49 = v47;
  v47(v48, a2);
  v45(v38, v43, a2);
  if ((v44 & 1) == 0)
  {
    v49(v38, a2);
    uint64_t v51 = v43;
    return specialized BinaryFloatingPoint.init<A>(_:)(v51, a2, v140);
  }
  char v50 = dispatch thunk of FloatingPoint.isZero.getter();
  v138 = (void (*)(uint64_t, uint64_t))v49;
  v49(v38, a2);
  uint64_t v51 = v43;
  if (v50) {
    return specialized BinaryFloatingPoint.init<A>(_:)(v51, a2, v140);
  }
  uint64_t v137 = v46;
  v52 = v155;
  dispatch thunk of FloatingPoint.exponent.getter();
  uint64_t v53 = Double.exponent.getter();
  int64_t v159 = v53;
  uint64_t v54 = v139;
  v55 = v154;
  if (dispatch thunk of static BinaryInteger.isSigned.getter())
  {
    if (dispatch thunk of BinaryInteger.bitWidth.getter() < 64)
    {
LABEL_22:
      uint64_t v61 = dispatch thunk of BinaryInteger._lowWord.getter();
      uint64_t v60 = v157;
      if (v61 >= v53) {
        goto LABEL_23;
      }
      goto LABEL_40;
    }
    goto LABEL_18;
  }
  char v56 = dispatch thunk of static BinaryInteger.isSigned.getter();
  uint64_t v57 = dispatch thunk of BinaryInteger.bitWidth.getter();
  if ((v56 & 1) == 0)
  {
    if (v57 < 64) {
      goto LABEL_22;
    }
    uint64_t v60 = v157;
    (*((void (**)(char *, char *, char *))v157 + 2))(v10, v52, v54);
    uint64_t v158 = v53;
    if (v53 <= 0)
    {
      (*((void (**)(char *, char *))v60 + 1))(v10, v54);
    }
    else
    {
      lazy protocol witness table accessor for type Int and conformance Int();
      uint64_t v74 = v156;
      dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
      char v75 = dispatch thunk of static Comparable.< infix(_:_:)();
      uint64_t v76 = (void (*)(char *, char *))*((void *)v60 + 1);
      double v77 = v74;
      v52 = v155;
      v76(v77, v54);
      v76(v10, v54);
      if (v75) {
        goto LABEL_40;
      }
    }
    goto LABEL_23;
  }
  if (v57 > 64)
  {
LABEL_18:
    lazy protocol witness table accessor for type Int and conformance Int();
    v58 = v156;
    dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
    char v59 = dispatch thunk of static Comparable.< infix(_:_:)();
    uint64_t v60 = v157;
    (*((void (**)(char *, char *))v157 + 1))(v58, v54);
    if ((v59 & 1) == 0) {
      goto LABEL_23;
    }
    goto LABEL_40;
  }
  swift_getAssociatedConformanceWitness();
  dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
  uint64_t v70 = v156;
  dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
  char v71 = dispatch thunk of static Comparable.< infix(_:_:)();
  uint64_t v60 = v157;
  uint64_t v72 = (void (*)(char *, char *))*((void *)v157 + 1);
  v72(v70, v54);
  uint64_t v73 = v146;
  (*((void (**)(char *, char *, char *))v60 + 2))(v146, v52, v54);
  if ((v71 & 1) == 0)
  {
    v83 = v73;
    int64_t v136 = v159;
    uint64_t v84 = dispatch thunk of BinaryInteger._lowWord.getter();
    v72(v83, v54);
    if (v84 < v136) {
      goto LABEL_40;
    }
LABEL_23:
    uint64_t v62 = Double.exponent.getter();
    int64_t v159 = v62;
    char v63 = dispatch thunk of static BinaryInteger.isSigned.getter();
    uint64_t v64 = dispatch thunk of BinaryInteger.bitWidth.getter();
    if (v63)
    {
      if (v64 > 64)
      {
        lazy protocol witness table accessor for type Int and conformance Int();
        v65 = v156;
        dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
        char v66 = dispatch thunk of static Comparable.< infix(_:_:)();
        int v67 = (void (*)(char *, char *))*((void *)v60 + 1);
        v67(v65, v54);
        v68 = v52;
LABEL_36:
        v67(v68, v54);
        if ((v66 & 1) == 0)
        {
LABEL_37:
          uint64_t v80 = dispatch thunk of BinaryFloatingPoint.significandWidth.getter();
          if (Double.significandWidth.getter() < v80)
          {
            uint64_t v81 = v51;
            uint64_t v82 = a2;
LABEL_77:
            v138(v81, v82);
            return 0;
          }
          return specialized BinaryFloatingPoint.init<A>(_:)(v51, a2, v140);
        }
LABEL_76:
        uint64_t v81 = v51;
        uint64_t v82 = a2;
        goto LABEL_77;
      }
    }
    else if (v64 > 63)
    {
      uint64_t v158 = v62;
      v78 = v145;
      (*((void (**)(char *, char *, char *))v60 + 4))(v145, v52, v54);
      if (v62 < 0)
      {
        (*((void (**)(char *, char *))v60 + 1))(v78, v54);
        goto LABEL_76;
      }
      lazy protocol witness table accessor for type Int and conformance Int();
      v79 = v156;
      dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
      char v66 = dispatch thunk of static Comparable.< infix(_:_:)();
      int v67 = (void (*)(char *, char *))*((void *)v60 + 1);
      v67(v79, v54);
      v68 = v78;
      goto LABEL_36;
    }
    uint64_t v69 = dispatch thunk of BinaryInteger._lowWord.getter();
    (*((void (**)(char *, char *))v60 + 1))(v52, v54);
    if (v159 >= v69) {
      goto LABEL_37;
    }
    goto LABEL_76;
  }
  v72(v73, v54);
LABEL_40:
  uint64_t v85 = Double.exponent.getter();
  int64_t v159 = v85;
  if (dispatch thunk of static BinaryInteger.isSigned.getter())
  {
    if (dispatch thunk of BinaryInteger.bitWidth.getter() < 64)
    {
LABEL_49:
      if (dispatch thunk of BinaryInteger._lowWord.getter() >= v85) {
        goto LABEL_50;
      }
      goto LABEL_83;
    }
LABEL_45:
    lazy protocol witness table accessor for type Int and conformance Int();
    v88 = v156;
    dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
    char v89 = dispatch thunk of static Comparable.< infix(_:_:)();
    (*((void (**)(char *, char *))v60 + 1))(v88, v54);
    if ((v89 & 1) == 0) {
      goto LABEL_50;
    }
LABEL_83:
    v138(v51, a2);
    (*((void (**)(char *, char *))v60 + 1))(v52, v54);
    return 0;
  }
  char v86 = dispatch thunk of static BinaryInteger.isSigned.getter();
  uint64_t v87 = dispatch thunk of BinaryInteger.bitWidth.getter();
  if (v86)
  {
    if (v87 <= 64) {
      goto LABEL_69;
    }
    goto LABEL_45;
  }
  if (v87 < 64) {
    goto LABEL_49;
  }
  v113 = v144;
  (*((void (**)(char *, char *, char *))v60 + 2))(v144, v52, v54);
  uint64_t v158 = v85;
  if (v85 > 0)
  {
    lazy protocol witness table accessor for type Int and conformance Int();
    v114 = v156;
    dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
    char v115 = dispatch thunk of static Comparable.< infix(_:_:)();
    v116 = (void (*)(char *, char *))*((void *)v60 + 1);
    v116(v114, v54);
    v116(v144, v54);
    if ((v115 & 1) == 0) {
      goto LABEL_50;
    }
    goto LABEL_83;
  }
  (*((void (**)(char *, char *))v60 + 1))(v113, v54);
  while (1)
  {
LABEL_50:
    v146 = (char *)dispatch thunk of BinaryFloatingPoint.significandWidth.getter();
    v90 = v153;
    v145 = (char *)*((void *)v60 + 4);
    ((void (*)(char *, char *, char *))v145)(v153, v52, v54);
    char v91 = dispatch thunk of static BinaryInteger.isSigned.getter();
    v92 = v60;
    v93 = v60 + 16;
    uint64_t v60 = (char *)*((void *)v60 + 2);
    v94 = v151;
    v155 = v93;
    ((void (*)(char *, char *, char *))v60)(v151, v90, v54);
    if ((v91 & 1) == 0)
    {
      v96 = (char *)*((void *)v92 + 1);
      ((void (*)(char *, char *))v96)(v94, v54);
LABEL_56:
      v97 = v54;
      v52 = v55;
      v55 = v153;
      uint64_t v54 = v150;
      goto LABEL_57;
    }
    uint64_t v95 = dispatch thunk of BinaryInteger.bitWidth.getter();
    v96 = (char *)*((void *)v92 + 1);
    ((void (*)(char *, char *))v96)(v94, v54);
    if (v95 <= 64) {
      goto LABEL_56;
    }
    v97 = v142;
    ((void (*)(char *, char *, char *))v60)(v142, v153, v54);
    int64_t v159 = 0x8000000000000000;
    if (dispatch thunk of static BinaryInteger.isSigned.getter())
    {
      v98 = v97;
      v97 = v54;
      v52 = v55;
      if (dispatch thunk of BinaryInteger.bitWidth.getter() < 64)
      {
        v99 = v98;
        uint64_t v100 = dispatch thunk of BinaryInteger._lowWord.getter();
        ((void (*)(char *, char *))v96)(v99, v54);
        BOOL v101 = v100 < v159;
        goto LABEL_96;
      }
      v126 = v98;
      lazy protocol witness table accessor for type Int and conformance Int();
      v125 = v156;
      goto LABEL_89;
    }
    LODWORD(v151) = dispatch thunk of static BinaryInteger.isSigned.getter();
    uint64_t v124 = dispatch thunk of BinaryInteger.bitWidth.getter();
    if ((v151 & 1) == 0)
    {
      uint64_t v54 = v150;
      if (v124 >= 64)
      {
LABEL_99:
        v134 = v97;
        v97 = v139;
        ((void (*)(char *, char *))v96)(v134, v139);
        v55 = v153;
        v52 = v154;
        goto LABEL_57;
      }
      v128 = v97;
      v97 = v139;
      v52 = v154;
      uint64_t v129 = dispatch thunk of BinaryInteger._lowWord.getter();
      ((void (*)(char *, char *))v96)(v128, v97);
      v55 = v153;
      if (v129 >= v159) {
        goto LABEL_57;
      }
LABEL_98:
      __break(1u);
      goto LABEL_99;
    }
    if (v124 > 64)
    {
      lazy protocol witness table accessor for type Int and conformance Int();
      v125 = v156;
      v126 = v97;
      v97 = v139;
      v52 = v154;
LABEL_89:
      dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
      char v127 = dispatch thunk of static Comparable.< infix(_:_:)();
      ((void (*)(char *, char *))v96)(v125, v97);
      ((void (*)(char *, char *))v96)(v126, v97);
      v55 = v153;
      uint64_t v54 = v150;
      if ((v127 & 1) == 0) {
        goto LABEL_57;
      }
      goto LABEL_98;
    }
    uint64_t v54 = v139;
    swift_getAssociatedConformanceWitness();
    dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
    v130 = v156;
    dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
    char v131 = dispatch thunk of static Comparable.< infix(_:_:)();
    ((void (*)(char *, char *))v96)(v130, v54);
    v55 = v141;
    ((void (*)(char *, char *, char *))v145)(v141, v97, v54);
    if (v131) {
      goto LABEL_101;
    }
    int64_t v132 = v159;
    v52 = v154;
    uint64_t v133 = dispatch thunk of BinaryInteger._lowWord.getter();
    ((void (*)(char *, char *))v96)(v55, v54);
    BOOL v101 = v133 < v132;
    v97 = v54;
LABEL_96:
    v55 = v153;
    uint64_t v54 = v150;
    if (v101) {
      goto LABEL_98;
    }
LABEL_57:
    uint64_t v102 = dispatch thunk of BinaryInteger.bitWidth.getter();
    ((void (*)(char *, char *, char *))v60)(v54, v55, v97);
    if (v102 >= 65)
    {
      ((void (*)(char *, char *))v96)(v54, v97);
      goto LABEL_59;
    }
    uint64_t v105 = dispatch thunk of BinaryInteger.bitWidth.getter();
    ((void (*)(char *, char *))v96)(v54, v97);
    if (v105 != 64 || (dispatch thunk of static BinaryInteger.isSigned.getter() & 1) != 0) {
      break;
    }
LABEL_59:
    ((void (*)(char *, char *, char *))v60)(v152, v55, v97);
    int64_t v159 = 0x7FFFFFFFFFFFFFFFLL;
    char v103 = dispatch thunk of static BinaryInteger.isSigned.getter();
    uint64_t v104 = dispatch thunk of BinaryInteger.bitWidth.getter();
    uint64_t v54 = v96;
    if (v103)
    {
      if (v104 <= 64) {
        goto LABEL_67;
      }
      lazy protocol witness table accessor for type Int and conformance Int();
    }
    else
    {
      if (v104 < 64)
      {
LABEL_67:
        v106 = v152;
        uint64_t v107 = dispatch thunk of BinaryInteger._lowWord.getter();
        v108 = v106;
        v96 = v54;
        ((void (*)(char *, char *))v54)(v108, v97);
        if (v159 >= v107) {
          break;
        }
        goto LABEL_68;
      }
      uint64_t v158 = 0x7FFFFFFFFFFFFFFFLL;
      lazy protocol witness table accessor for type Int and conformance Int();
    }
    v117 = v156;
    dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
    uint64_t v60 = v152;
    char v118 = dispatch thunk of static Comparable.< infix(_:_:)();
    v119 = v117;
    v96 = v54;
    ((void (*)(char *, char *))v54)(v119, v97);
    ((void (*)(char *, char *))v54)(v60, v97);
    if ((v118 & 1) == 0) {
      break;
    }
LABEL_68:
    __break(1u);
LABEL_69:
    swift_getAssociatedConformanceWitness();
    dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
    v109 = v156;
    dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
    char v110 = dispatch thunk of static Comparable.< infix(_:_:)();
    v111 = (void (*)(char *, char *))*((void *)v60 + 1);
    v111(v109, v54);
    v112 = v143;
    (*((void (**)(char *, char *, char *))v60 + 2))(v143, v52, v54);
    if (v110)
    {
      v111(v112, v54);
      goto LABEL_83;
    }
    v122 = v112;
    v155 = (char *)v159;
    uint64_t v123 = dispatch thunk of BinaryInteger._lowWord.getter();
    v111(v122, v54);
    if (v123 < (uint64_t)v155) {
      goto LABEL_83;
    }
  }
  uint64_t v120 = dispatch thunk of BinaryInteger._lowWord.getter();
  ((void (*)(char *, char *))v96)(v55, v97);
  uint64_t v121 = Double.exponent.getter();
  if (__OFSUB__(v120, v121))
  {
    __break(1u);
LABEL_101:
    uint64_t result = ((uint64_t (*)(char *, char *))v96)(v55, v54);
    __break(1u);
    return result;
  }
  if (v120 - v121 >= (uint64_t)v146) {
    return specialized BinaryFloatingPoint.init<A>(_:)(v51, a2, v140);
  }
  v138(v51, a2);
  return 0;
}

uint64_t protocol witness for BinaryFloatingPoint.binade.getter in conformance CGFloat@<X0>(void *a1@<X8>)
{
  uint64_t result = Double.binade.getter();
  *a1 = v3;
  return result;
}

uint64_t protocol witness for BinaryFloatingPoint.significandWidth.getter in conformance CGFloat()
{
  return Double.significandWidth.getter();
}

void protocol witness for FloatingPoint.init(sign:exponent:significand:) in conformance CGFloat(char a1@<W0>, uint64_t *a2@<X1>, double *a3@<X2>, double *a4@<X8>)
{
  *a4 = specialized Double.init(sign:exponent:significand:)(a1 & 1, *a2, *a3);
}

void protocol witness for FloatingPoint.init(signOf:magnitudeOf:) in conformance CGFloat(double *a1@<X0>, double *a2@<X1>, double *a3@<X8>)
{
  *a3 = specialized BinaryFloatingPoint.init(signOf:magnitudeOf:)(*a1, *a2);
}

double protocol witness for FloatingPoint.init(_:) in conformance CGFloat@<D0>(uint64_t a1@<X0>, double *a2@<X8>)
{
  double result = (double)a1;
  *a2 = (double)a1;
  return result;
}

uint64_t protocol witness for FloatingPoint.init<A>(_:) in conformance CGFloat@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, double *a3@<X8>)
{
  double v6 = specialized CGFloat.init<A>(_:)(a1, a2);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 8))(a1, a2);
  *a3 = v6;
  return result;
}

uint64_t protocol witness for Numeric.init<A>(exactly:) in conformance CGFloat@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = *(void *)(a2 - 8);
  MEMORY[0x1F4188790](a1);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, a2);
  uint64_t v9 = Double.init<A>(exactly:)((uint64_t)v8, a2);
  char v11 = v10;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, a2);
  if (v11) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = v9;
  }
  *(void *)a3 = v13;
  *(unsigned char *)(a3 + 8) = v11 & 1;
  return result;
}

uint64_t protocol witness for static FloatingPoint.radix.getter in conformance CGFloat()
{
  return 2;
}

void protocol witness for static FloatingPoint.nan.getter in conformance CGFloat(void *a1@<X8>)
{
  *a1 = 0x7FF8000000000000;
}

void protocol witness for static FloatingPoint.signalingNaN.getter in conformance CGFloat(void *a1@<X8>)
{
  *a1 = 0x7FF4000000000000;
}

void protocol witness for static FloatingPoint.infinity.getter in conformance CGFloat(void *a1@<X8>)
{
  *a1 = 0x7FF0000000000000;
}

void protocol witness for static FloatingPoint.greatestFiniteMagnitude.getter in conformance CGFloat(void *a1@<X8>)
{
  *a1 = 0x7FEFFFFFFFFFFFFFLL;
}

void protocol witness for static FloatingPoint.pi.getter in conformance CGFloat(void *a1@<X8>)
{
  *a1 = 0x400921FB54442D18;
}

double protocol witness for FloatingPoint.ulp.getter in conformance CGFloat@<D0>(double *a1@<X8>)
{
  uint64_t v2 = (*v1 >> 52) & 0x7FFLL;
  if (v2)
  {
    if (v2 != 2047)
    {
      double result = COERCE_DOUBLE(*v1 & 0x7FF0000000000000) * 2.22044605e-16;
      *a1 = result;
      return result;
    }
    double v4 = NAN;
  }
  else
  {
    *(void *)&double v4 = 1;
  }
  double result = v4;
  *a1 = v4;
  return result;
}

void protocol witness for static FloatingPoint.ulpOfOne.getter in conformance CGFloat(void *a1@<X8>)
{
  *a1 = 0x3CB0000000000000;
}

void protocol witness for static FloatingPoint.leastNormalMagnitude.getter in conformance CGFloat(void *a1@<X8>)
{
  *a1 = 0x10000000000000;
}

void protocol witness for static FloatingPoint.leastNonzeroMagnitude.getter in conformance CGFloat(void *a1@<X8>)
{
  *a1 = 1;
}

uint64_t protocol witness for FloatingPoint.exponent.getter in conformance CGFloat@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = Double.exponent.getter();
  *a1 = result;
  return result;
}

uint64_t protocol witness for FloatingPoint.significand.getter in conformance CGFloat@<X0>(void *a1@<X8>)
{
  uint64_t result = Double.significand.getter();
  *a1 = v3;
  return result;
}

double protocol witness for static FloatingPoint./ infix(_:_:) in conformance CGFloat@<D0>(double *a1@<X0>, double *a2@<X1>, double *a3@<X8>)
{
  double result = *a1 / *a2;
  *a3 = result;
  return result;
}

double static CGFloat./ infix(_:_:)(double a1, double a2)
{
  return a1 / a2;
}

void protocol witness for FloatingPoint.remainder(dividingBy:) in conformance CGFloat(long double *a1@<X0>, long double *a2@<X8>)
{
  *a2 = _stdlib_remainder(*v2, *a1);
}

void protocol witness for FloatingPoint.formRemainder(dividingBy:) in conformance CGFloat(long double *a1)
{
  long double *v1 = _stdlib_remainder(*v1, *a1);
}

void protocol witness for FloatingPoint.truncatingRemainder(dividingBy:) in conformance CGFloat(long double *a1@<X0>, long double *a2@<X8>)
{
  *a2 = fmod(*v2, *a1);
}

void protocol witness for FloatingPoint.formTruncatingRemainder(dividingBy:) in conformance CGFloat(long double *a1)
{
  long double *v1 = fmod(*v1, *a1);
}

void protocol witness for FloatingPoint.squareRoot() in conformance CGFloat(double *a1@<X8>)
{
  *a1 = _stdlib_squareRoot(*v1);
}

void protocol witness for FloatingPoint.formSquareRoot() in conformance CGFloat()
{
  double *v0 = _stdlib_squareRoot(*v0);
}

double protocol witness for FloatingPoint.addingProduct(_:_:) in conformance CGFloat@<D0>(double *a1@<X0>, double *a2@<X1>, double *a3@<X8>)
{
  double result = *v3 + *a1 * *a2;
  *a3 = result;
  return result;
}

double protocol witness for FloatingPoint.addProduct(_:_:) in conformance CGFloat(double *a1, double *a2)
{
  double result = *v2 + *a1 * *a2;
  *uint64_t v2 = result;
  return result;
}

double *protocol witness for static FloatingPoint.minimum(_:_:) in conformance CGFloat@<X0>(double *result@<X0>, double *a2@<X1>, double *a3@<X8>)
{
  double v3 = *result;
  double v4 = *a2;
  if (*result > *a2)
  {
    if ((*(void *)&v4 & 0xFFFFFFFFFFFFFLL) == 0) {
      double v3 = *a2;
    }
    if ((~*(void *)&v4 & 0x7FF0000000000000) != 0) {
      double v3 = *a2;
    }
  }
  *a3 = v3;
  return result;
}

double *protocol witness for static FloatingPoint.maximum(_:_:) in conformance CGFloat@<X0>(double *result@<X0>, double *a2@<X1>, double *a3@<X8>)
{
  double v3 = *result;
  double v4 = *a2;
  if (*a2 >= *result)
  {
    if ((*(void *)&v4 & 0xFFFFFFFFFFFFFLL) == 0) {
      double v3 = *a2;
    }
    if ((~*(void *)&v4 & 0x7FF0000000000000) != 0) {
      double v3 = *a2;
    }
  }
  *a3 = v3;
  return result;
}

double *protocol witness for static FloatingPoint.minimumMagnitude(_:_:) in conformance CGFloat@<X0>(double *result@<X0>, double *a2@<X1>, double *a3@<X8>)
{
  double v3 = *result;
  double v4 = *a2;
  if (fabs(*result) > fabs(*a2))
  {
    if ((*(void *)&v4 & 0xFFFFFFFFFFFFFLL) == 0) {
      double v3 = *a2;
    }
    if ((~*(void *)&v4 & 0x7FF0000000000000) != 0) {
      double v3 = *a2;
    }
  }
  *a3 = v3;
  return result;
}

double *protocol witness for static FloatingPoint.maximumMagnitude(_:_:) in conformance CGFloat@<X0>(double *result@<X0>, double *a2@<X1>, double *a3@<X8>)
{
  double v3 = *result;
  double v4 = *a2;
  if (fabs(*a2) >= fabs(*result))
  {
    if ((*(void *)&v4 & 0xFFFFFFFFFFFFFLL) == 0) {
      double v3 = *a2;
    }
    if ((~*(void *)&v4 & 0x7FF0000000000000) != 0) {
      double v3 = *a2;
    }
  }
  *a3 = v3;
  return result;
}

uint64_t protocol witness for FloatingPoint.rounded(_:) in conformance CGFloat@<X0>(uint64_t a1@<X0>, double *a2@<X8>)
{
  uint64_t v5 = type metadata accessor for FloatingPointRoundingRule();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v9 = *v2;
  double v14 = *v2;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, v5);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v6 + 88))(v8, v5);
  if (result == *MEMORY[0x1E4FBBEA0])
  {
    double v11 = round(v9);
  }
  else if (result == *MEMORY[0x1E4FBBE98])
  {
    double v11 = rint(v9);
  }
  else if (result == *MEMORY[0x1E4FBBEA8])
  {
    double v11 = ceil(v9);
  }
  else if (result == *MEMORY[0x1E4FBBEB0])
  {
    double v11 = floor(v9);
  }
  else if (result == *MEMORY[0x1E4FBBE88])
  {
    double v11 = trunc(v9);
  }
  else if (result == *MEMORY[0x1E4FBBE90])
  {
    double v11 = ceil(v9);
    double v12 = floor(v9);
    if (v9 < 0.0) {
      double v11 = v12;
    }
  }
  else
  {
    Double._roundSlowPath(_:)();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    double v11 = v14;
  }
  *a2 = v11;
  return result;
}

void protocol witness for FloatingPoint.nextUp.getter in conformance CGFloat(double *a1@<X8>)
{
  double v2 = *v1 + 0.0;
  if (v2 < INFINITY) {
    *(void *)&v2 += (*(uint64_t *)&v2 >> 63) | 1;
  }
  *a1 = v2;
}

double protocol witness for FloatingPoint.nextDown.getter in conformance CGFloat@<D0>(double *a1@<X8>)
{
  double v2 = 0.0 - *v1;
  if (v2 < INFINITY) {
    *(void *)&v2 += (*(uint64_t *)&v2 >> 63) | 1;
  }
  double result = -v2;
  *a1 = result;
  return result;
}

BOOL protocol witness for FloatingPoint.isEqual(to:) in conformance CGFloat(double *a1)
{
  return *v1 == *a1;
}

BOOL protocol witness for FloatingPoint.isLess(than:) in conformance CGFloat(double *a1)
{
  return *v1 < *a1;
}

BOOL protocol witness for FloatingPoint.isLessThanOrEqualTo(_:) in conformance CGFloat(double *a1)
{
  return *v1 <= *a1;
}

uint64_t protocol witness for FloatingPoint.isTotallyOrdered(belowOrEqualTo:) in conformance CGFloat(double *a1)
{
  return specialized BinaryFloatingPoint.isTotallyOrdered(belowOrEqualTo:)(*a1, *v1);
}

uint64_t specialized BinaryFloatingPoint.isTotallyOrdered(belowOrEqualTo:)(double a1, double a2)
{
  if (a2 < a1) {
    return 1;
  }
  uint64_t result = *(void *)&a2 >> 63;
  if ((*(void *)&a1 & 0x8000000000000000) != 0)
  {
    if ((*(void *)&a2 & 0x8000000000000000) == 0) {
      return result;
    }
  }
  else if ((*(void *)&a2 & 0x8000000000000000) != 0)
  {
    return result;
  }
  unint64_t v3 = (*(void *)&a2 >> 52) & 0x7FFLL;
  unint64_t v4 = (*(void *)&a1 >> 52) & 0x7FFLL;
  unint64_t v5 = *(void *)&a2 & 0xFFFFFFFFFFFFFLL;
  unint64_t v6 = *(void *)&a1 & 0xFFFFFFFFFFFFFLL;
  BOOL v8 = a2 >= 0.0 || v5 >= v6;
  if (v6 < v5) {
    BOOL v8 = *(void *)&a2 >> 63;
  }
  if (v3 < v4) {
    BOOL v8 = a2 >= 0.0;
  }
  if (v4 < v3) {
    return result;
  }
  else {
    return v8;
  }
}

BOOL protocol witness for FloatingPoint.isNormal.getter in conformance CGFloat()
{
  return ((*v0 >> 52) & 0x7FFLL) != 0x7FF && ((*v0 >> 52) & 0x7FFLL) != 0;
}

BOOL protocol witness for FloatingPoint.isFinite.getter in conformance CGFloat()
{
  return (~*v0 & 0x7FF0000000000000) != 0;
}

BOOL protocol witness for FloatingPoint.isZero.getter in conformance CGFloat()
{
  return (*v0 & 0x7FFFFFFFFFFFFFFFLL) == 0;
}

BOOL protocol witness for FloatingPoint.isSubnormal.getter in conformance CGFloat()
{
  return (*v0 & 0xFFFFFFFFFFFFFLL) != 0 && (*v0 & 0x7FF0000000000000) == 0;
}

BOOL protocol witness for FloatingPoint.isInfinite.getter in conformance CGFloat()
{
  return (*v0 & 0x7FFFFFFFFFFFFFFFLL) == 0x7FF0000000000000;
}

BOOL protocol witness for FloatingPoint.isNaN.getter in conformance CGFloat()
{
  return (*v0 & 0xFFFFFFFFFFFFFLL) != 0 && (~*v0 & 0x7FF0000000000000) == 0;
}

BOOL protocol witness for FloatingPoint.isSignalingNaN.getter in conformance CGFloat()
{
  return (~*v0 & 0x7FF0000000000000) == 0 && (*v0 & 0xFFFFFFFFFFFFFLL) != 0 && (*v0 & 0x8000000000000) == 0;
}

uint64_t protocol witness for FloatingPoint.floatingPointClass.getter in conformance CGFloat()
{
  return specialized FloatingPoint.floatingPointClass.getter(*v0);
}

uint64_t protocol witness for FloatingPoint.isCanonical.getter in conformance CGFloat()
{
  return 1;
}

double protocol witness for ExpressibleByFloatLiteral.init(floatLiteral:) in conformance CGFloat@<D0>(double *a1@<X0>, void *a2@<X8>)
{
  double result = *a1;
  *a2 = *(void *)a1;
  return result;
}

uint64_t CGFloat.customMirror.getter()
{
  return Mirror.init(reflecting:)();
}

uint64_t protocol witness for CustomReflectable.customMirror.getter in conformance CGFloat()
{
  return Mirror.init(reflecting:)();
}

uint64_t CGFloat.description.getter(double a1)
{
  return MEMORY[0x1F4184008](a1);
}

uint64_t CGFloat.hashValue.getter()
{
  return MEMORY[0x1F4184070]();
}

void CGFloat.hash(into:)(double a1)
{
  if ((*(void *)&a1 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
    Swift::UInt64 v1 = *(void *)&a1;
  }
  else {
    Swift::UInt64 v1 = 0;
  }
  Hasher._combine(_:)(v1);
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance CGFloat()
{
  return MEMORY[0x1F4184070](*v0);
}

void protocol witness for Hashable.hash(into:) in conformance CGFloat()
{
  if ((*v0 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
    Swift::UInt64 v1 = *v0;
  }
  else {
    Swift::UInt64 v1 = 0;
  }
  Hasher._combine(_:)(v1);
}

uint64_t protocol witness for Hashable._rawHashValue(seed:) in conformance CGFloat(uint64_t a1)
{
  if ((*v1 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
    uint64_t v2 = *v1;
  }
  else {
    uint64_t v2 = 0;
  }
  return MEMORY[0x1F4185EA8](a1, v2);
}

Swift::UInt8 __swiftcall UInt8.init(_:)(CoreGraphics::CGFloat a1)
{
  if ((~*(void *)&a1.native & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (a1.native <= -1.0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (a1.native >= 256.0)
  {
LABEL_7:
    __break(1u);
    return v1;
  }
  return (int)a1.native;
}

Swift::Int8 __swiftcall Int8.init(_:)(CoreGraphics::CGFloat a1)
{
  if ((~*(void *)&a1.native & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (a1.native <= -129.0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (a1.native >= 128.0)
  {
LABEL_7:
    __break(1u);
    return v1;
  }
  return (int)a1.native;
}

Swift::UInt16 __swiftcall UInt16.init(_:)(CoreGraphics::CGFloat a1)
{
  if ((~*(void *)&a1.native & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (a1.native <= -1.0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (a1.native >= 65536.0)
  {
LABEL_7:
    __break(1u);
    return v1;
  }
  return (int)a1.native;
}

Swift::Int16 __swiftcall Int16.init(_:)(CoreGraphics::CGFloat a1)
{
  if ((~*(void *)&a1.native & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (a1.native <= -32769.0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (a1.native >= 32768.0)
  {
LABEL_7:
    __break(1u);
    return v1;
  }
  return (int)a1.native;
}

Swift::UInt32 __swiftcall UInt32.init(_:)(CoreGraphics::CGFloat a1)
{
  if ((~*(void *)&a1.native & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (a1.native <= -1.0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (a1.native < 4294967300.0) {
    return a1.native;
  }
LABEL_7:
  __break(1u);
  return result;
}

Swift::Int32 __swiftcall Int32.init(_:)(CoreGraphics::CGFloat a1)
{
  if ((~*(void *)&a1.native & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (a1.native <= -2147483650.0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (a1.native < 2147483650.0) {
    return (int)a1.native;
  }
LABEL_7:
  __break(1u);
  return result;
}

unint64_t UInt64.init(_:)(double a1)
{
  if ((~*(void *)&a1 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (a1 <= -1.0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (a1 < 1.84467441e19) {
    return (unint64_t)a1;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t Int64.init(_:)(double a1)
{
  if ((~*(void *)&a1 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (a1 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (a1 < 9.22337204e18) {
    return (uint64_t)a1;
  }
LABEL_7:
  __break(1u);
  return result;
}

Swift::Float __swiftcall Float.init(_:)(CoreGraphics::CGFloat a1)
{
  return a1.native;
}

CoreGraphics::CGFloat __swiftcall CGFloat.distance(to:)(CoreGraphics::CGFloat to)
{
  result.native = to.native - v1;
  return result;
}

CoreGraphics::CGFloat __swiftcall CGFloat.advanced(by:)(CoreGraphics::CGFloat by)
{
  result.native = by.native + v1;
  return result;
}

double protocol witness for Strideable.distance(to:) in conformance CGFloat@<D0>(double *a1@<X0>, double *a2@<X8>)
{
  double result = *a1 - *v2;
  *a2 = result;
  return result;
}

double protocol witness for Strideable.advanced(by:) in conformance CGFloat@<D0>(double *a1@<X0>, double *a2@<X8>)
{
  double result = *a1 + *v2;
  *a2 = result;
  return result;
}

double *protocol witness for static Strideable._step(after:from:by:) in conformance CGFloat(double *result, uint64_t a2, char a3, double *a4, double *a5, double *a6)
{
  double v6 = *a6;
  if (a3)
  {
    double v8 = v6 + *a4;
    goto LABEL_5;
  }
  if (!__OFADD__(a2++, 1))
  {
    double v8 = *a5 + (double)a2 * v6;
LABEL_5:
    *double result = v8;
    return (double *)a2;
  }
  __break(1u);
  return result;
}

BOOL protocol witness for static Comparable.<= infix(_:_:) in conformance CGFloat(double *a1, double *a2)
{
  return *a1 <= *a2;
}

BOOL protocol witness for static Comparable.> infix(_:_:) in conformance CGFloat(double *a1, double *a2)
{
  return *a2 < *a1;
}

uint64_t CGFloat._cVarArgEncoding.getter(double a1)
{
  uint64_t result = static Array._allocateBufferUninitialized(minimumCapacity:)();
  *(void *)(result + 16) = 1;
  *(double *)(result + 32) = a1;
  return result;
}

uint64_t CGFloat._cVarArgAlignment.getter()
{
  return 8;
}

uint64_t protocol witness for _CVarArgAligned._cVarArgAlignment.getter in conformance CGFloat()
{
  return 8;
}

double CGFloat.init(from:)(void *a1)
{
  uint64_t v4 = type metadata accessor for DecodingError();
  uint64_t v14 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v5 = type metadata accessor for DecodingError.Context();
  uint64_t v13 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  dispatch thunk of Decoder.singleValueContainer()();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1(a1);
  }
  else
  {
    double v11 = v7;
    double v12 = a1;
    __swift_project_boxed_opaque_existential_1(v15, v15[3]);
    dispatch thunk of SingleValueDecodingContainer.decode(_:)();
    double v2 = v8;
    double v9 = v12;
    __swift_destroy_boxed_opaque_existential_1(v15);
    __swift_destroy_boxed_opaque_existential_1(v9);
  }
  return v2;
}

uint64_t CGFloat.encode(to:)(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  dispatch thunk of Encoder.singleValueContainer()();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v2, v2[3]);
  dispatch thunk of SingleValueEncodingContainer.encode(_:)();
  return __swift_destroy_boxed_opaque_existential_1(v2);
}

uint64_t specialized FloatingPoint.floatingPointClass.getter(double a1)
{
  uint64_t v1 = (*(void *)&a1 >> 52) & 0x7FFLL;
  if (a1 < 0.0) {
    unsigned int v2 = 5;
  }
  else {
    unsigned int v2 = 6;
  }
  if (a1 < 0.0) {
    int v3 = 4;
  }
  else {
    int v3 = 7;
  }
  if ((*(void *)&a1 & 0xFFFFFFFFFFFFFLL) != 0) {
    unsigned int v2 = v3;
  }
  if (a1 < 0.0) {
    int v4 = 3;
  }
  else {
    int v4 = 8;
  }
  if (a1 < 0.0) {
    int v5 = 2;
  }
  else {
    int v5 = 9;
  }
  if ((*(void *)&a1 & 0xFFFFFFFFFFFFFLL) != 0) {
    unsigned int v6 = (*(void *)&a1 >> 51) & 1;
  }
  else {
    unsigned int v6 = v5;
  }
  if (v1 != 2047) {
    unsigned int v6 = v4;
  }
  if (v1) {
    return v6;
  }
  else {
    return v2;
  }
}

double specialized CGFloat.init<A>(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 - 8);
  MEMORY[0x1F4188790](a1);
  int v5 = (char *)v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v3 + 16))(v5);
  if (dispatch thunk of BinaryInteger.bitWidth.getter() < 65)
  {
    char v7 = dispatch thunk of static BinaryInteger.isSigned.getter();
    uint64_t v8 = dispatch thunk of BinaryInteger._lowWord.getter();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, a2);
    if (v7) {
      return (double)v8;
    }
    else {
      return (double)(unint64_t)v8;
    }
  }
  else
  {
    lazy protocol witness table accessor for type Double and conformance Double();
    lazy protocol witness table accessor for type UInt64 and conformance UInt64();
    static BinaryFloatingPoint<>._convert<A>(from:)();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, a2);
    return *(double *)&v9[1];
  }
}

double specialized Double.init(sign:exponent:significand:)(char a1, uint64_t a2, double a3)
{
  double result = -a3;
  if ((a1 & 1) == 0) {
    double result = a3;
  }
  uint64_t v5 = (*(void *)&a3 >> 52) & 0x7FFLL;
  if (v5 != 2047 && v5 | *(void *)&a3 & 0xFFFFFFFFFFFFFLL)
  {
    if (a2 >= -1022)
    {
      if (a2 >= 1024)
      {
        if (a2 >= 3069) {
          a2 = 3069;
        }
        do
        {
          a2 -= 1023;
          double result = result * 8.98846567e307;
        }
        while ((unint64_t)a2 > 0x3FF);
      }
    }
    else
    {
      if (a2 <= -3066) {
        uint64_t v6 = -3066;
      }
      else {
        uint64_t v6 = a2;
      }
      do
      {
        a2 = v6 + 1022;
        double result = result * 2.22507386e-308;
        BOOL v7 = __CFADD__(v6, 2044);
        v6 += 1022;
      }
      while (!v7);
    }
    return result * COERCE_DOUBLE(((a2 << 52) + 0x3FF0000000000000) & 0x7FF0000000000000);
  }
  return result;
}

double _stdlib_squareRoot(double a1)
{
  return sqrt(a1);
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

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type Int and conformance Int;
  if (!lazy protocol witness table cache variable for type Int and conformance Int)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Int and conformance Int);
  }
  return result;
}

uint64_t associated type witness table accessor for ExpressibleByFloatLiteral.FloatLiteralType : _ExpressibleByBuiltinFloatLiteral in CGFloat()
{
  return MEMORY[0x1E4FBB450];
}

unint64_t lazy protocol witness table accessor for type Double and conformance Double()
{
  unint64_t result = lazy protocol witness table cache variable for type Double and conformance Double;
  if (!lazy protocol witness table cache variable for type Double and conformance Double)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Double and conformance Double);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type UInt64 and conformance UInt64()
{
  unint64_t result = lazy protocol witness table cache variable for type UInt64 and conformance UInt64;
  if (!lazy protocol witness table cache variable for type UInt64 and conformance UInt64)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UInt64 and conformance UInt64);
  }
  return result;
}

double specialized BinaryFloatingPoint.init(signOf:magnitudeOf:)(double a1, double a2)
{
  *(void *)&double result = *(void *)&a1 & 0x8000000000000000 | *(void *)&a2 & 0x7FFFFFFFFFFFFFFFLL;
  return result;
}

uint64_t dispatch thunk of static BinaryFloatingPoint.exponentBitCount.getter()
{
  return MEMORY[0x1F4183298]();
}

uint64_t dispatch thunk of BinaryFloatingPoint.significandWidth.getter()
{
  return MEMORY[0x1F41832A0]();
}

uint64_t dispatch thunk of BinaryFloatingPoint.exponentBitPattern.getter()
{
  return MEMORY[0x1F41832A8]();
}

uint64_t dispatch thunk of static BinaryFloatingPoint.significandBitCount.getter()
{
  return MEMORY[0x1F41832B0]();
}

uint64_t dispatch thunk of BinaryFloatingPoint.significandBitPattern.getter()
{
  return MEMORY[0x1F41832B8]();
}

uint64_t static BinaryFloatingPoint._convert<A>(from:)()
{
  return MEMORY[0x1F41832C8]();
}

uint64_t static BinaryFloatingPoint<>._convert<A>(from:)()
{
  return MEMORY[0x1F41832F0]();
}

uint64_t dispatch thunk of FloatingPoint.sign.getter()
{
  return MEMORY[0x1F4183548]();
}

uint64_t dispatch thunk of FloatingPoint.isNaN.getter()
{
  return MEMORY[0x1F4183550]();
}

uint64_t dispatch thunk of FloatingPoint.isZero.getter()
{
  return MEMORY[0x1F4183558]();
}

uint64_t dispatch thunk of FloatingPoint.exponent.getter()
{
  return MEMORY[0x1F4183578]();
}

uint64_t dispatch thunk of FloatingPoint.isFinite.getter()
{
  return MEMORY[0x1F4183588]();
}

uint64_t dispatch thunk of Hashable.hashValue.getter()
{
  return MEMORY[0x1F41835D0]();
}

uint64_t dispatch thunk of static Comparable.< infix(_:_:)()
{
  return MEMORY[0x1F4183740]();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t Double.significand.getter()
{
  return MEMORY[0x1F4184010]();
}

uint64_t Double._roundSlowPath(_:)()
{
  return MEMORY[0x1F4184018]();
}

uint64_t Double.significandWidth.getter()
{
  return MEMORY[0x1F4184028]();
}

uint64_t Double.binade.getter()
{
  return MEMORY[0x1F4184050]();
}

uint64_t Double.exponent.getter()
{
  return MEMORY[0x1F4184058]();
}

uint64_t dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)()
{
  return MEMORY[0x1F41848C0]();
}

uint64_t dispatch thunk of BinaryInteger._lowWord.getter()
{
  return MEMORY[0x1F4184938]();
}

uint64_t dispatch thunk of BinaryInteger.bitWidth.getter()
{
  return MEMORY[0x1F4184940]();
}

uint64_t dispatch thunk of static BinaryInteger.isSigned.getter()
{
  return MEMORY[0x1F4184950]();
}

uint64_t type metadata accessor for DecodingError.Context()
{
  return MEMORY[0x1F4184DE8]();
}

uint64_t type metadata accessor for DecodingError()
{
  return MEMORY[0x1F4184DF0]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t type metadata accessor for FloatingPointRoundingRule()
{
  return MEMORY[0x1F41859C8]();
}

uint64_t dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)()
{
  return MEMORY[0x1F4185A20]();
}

uint64_t dispatch thunk of SingleValueDecodingContainer.decode(_:)()
{
  return MEMORY[0x1F4185A68]();
}

{
  return MEMORY[0x1F4185A70]();
}

uint64_t dispatch thunk of SingleValueEncodingContainer.encode(_:)()
{
  return MEMORY[0x1F4185B00]();
}

uint64_t dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)()
{
  return MEMORY[0x1F4185D58]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt64 a1)
{
}

uint64_t Mirror.init(reflecting:)()
{
  return MEMORY[0x1F4185F10]();
}

uint64_t dispatch thunk of Decoder.singleValueContainer()()
{
  return MEMORY[0x1F4185FB8]();
}

uint64_t dispatch thunk of Encoder.singleValueContainer()()
{
  return MEMORY[0x1F4185FE0]();
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1F40D7BA0](cf);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

long double remainder(long double __x, long double __y)
{
  MEMORY[0x1F40CDD00](__x, __y);
  return result;
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1F4186460]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1F4186538]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1F4186540]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1F4186710]();
}