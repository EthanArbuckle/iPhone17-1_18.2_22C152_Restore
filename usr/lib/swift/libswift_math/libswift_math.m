double M_PI.getter()
{
  return 3.14159265;
}

double M_PI_2.getter()
{
  return 1.57079633;
}

double M_PI_4.getter()
{
  return 0.785398163;
}

void one-time initialization function for M_SQRT2()
{
  M_SQRT2 = 1.41421356;
}

double M_SQRT2.getter()
{
  return M_SQRT2.getter(&one-time initialization token for M_SQRT2, (uint64_t)&M_SQRT2);
}

void one-time initialization function for M_SQRT1_2()
{
  M_SQRT1_2 = 0.707106781;
}

double M_SQRT1_2.getter()
{
  return M_SQRT2.getter(&one-time initialization token for M_SQRT1_2, (uint64_t)&M_SQRT1_2);
}

double M_SQRT2.getter(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  return *(double *)a2;
}

uint64_t fabs<A>(_:)()
{
  return dispatch thunk of Numeric.magnitude.getter();
}

uint64_t sqrt<A>(_:)()
{
  return dispatch thunk of FloatingPoint.squareRoot()();
}

uint64_t fma<A>(_:_:_:)()
{
  return dispatch thunk of FloatingPoint.addingProduct(_:_:)();
}

uint64_t remainder<A>(_:_:)()
{
  return dispatch thunk of FloatingPoint.remainder(dividingBy:)();
}

uint64_t fmod<A>(_:_:)()
{
  return dispatch thunk of FloatingPoint.truncatingRemainder(dividingBy:)();
}

uint64_t ceil<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return ceil<A>(_:)(a1, a2, a3, MEMORY[0x263F8E218]);
}

uint64_t floor<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return ceil<A>(_:)(a1, a2, a3, MEMORY[0x263F8E220]);
}

uint64_t round<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return ceil<A>(_:)(a1, a2, a3, MEMORY[0x263F8E210]);
}

uint64_t trunc<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return ceil<A>(_:)(a1, a2, a3, MEMORY[0x263F8E1F8]);
}

uint64_t ceil<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int *a4)
{
  uint64_t v5 = type metadata accessor for FloatingPointRoundingRule();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *a4, v5);
  dispatch thunk of FloatingPoint.rounded(_:)();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t scalbn<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388]();
  v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388]();
  v10[1] = a2;
  swift_getAssociatedConformanceWitness();
  lazy protocol witness table accessor for type Int and conformance Int();
  dispatch thunk of BinaryInteger.init<A>(_:)();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, a3);
  return dispatch thunk of FloatingPoint.init(sign:exponent:significand:)();
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

uint64_t modf<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v19 = a2;
  uint64_t v17 = a1;
  uint64_t v15 = *(void *)(a4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = *(void *)(*(void *)(v8 + 16) + 8);
  swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388]();
  uint64_t v9 = type metadata accessor for FloatingPointRoundingRule();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388]();
  v12 = (char *)&v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = a3;
  if (dispatch thunk of FloatingPoint.isFinite.getter())
  {
    (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, *MEMORY[0x263F8E1F8], v9);
    dispatch thunk of FloatingPoint.rounded(_:)();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    return dispatch thunk of static AdditiveArithmetic.- infix(_:_:)();
  }
  else
  {
    swift_getAssociatedConformanceWitness();
    dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
    dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
    dispatch thunk of static AdditiveArithmetic.+ infix(_:_:)();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v7, a4);
    dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
    return dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
  }
}

uint64_t frexp<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v97 = a1;
  uint64_t v6 = *(void *)(a4 + 16);
  swift_getAssociatedTypeWitness();
  uint64_t v86 = *(void *)(swift_getAssociatedConformanceWitness() + 8);
  uint64_t v83 = *(void *)(v86 + 24);
  uint64_t v89 = *(void *)(v83 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  ((void (*)(void))MEMORY[0x270FA5388])();
  v87 = (char *)v78 - v7;
  uint64_t v85 = swift_checkMetadataState();
  uint64_t v91 = *(void *)(v85 - 8);
  uint64_t v8 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v79 = (char *)v78 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  v93 = (char *)v78 - v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  v92 = (char *)v78 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  v80 = (char *)v78 - v15;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  v82 = (char *)v78 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  v90 = (char *)v78 - v19;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  v94 = (char *)v78 - v21;
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  v84 = (char *)v78 - v23;
  uint64_t v96 = *(void *)(a3 - 8);
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  v81 = (char *)v78 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v24);
  v27 = (char *)v78 - v26;
  uint64_t v28 = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](v28);
  uint64_t v95 = v6;
  LOBYTE(v6) = dispatch thunk of FloatingPoint.isFinite.getter();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
  dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
  if ((v6 & 1) == 0)
  {
    dispatch thunk of static AdditiveArithmetic.+ infix(_:_:)();
    (*(void (**)(char *, uint64_t))(v96 + 8))(v27, a3);
    return 0;
  }
  v78[1] = AssociatedConformanceWitness;
  uint64_t v30 = a2;
  char v31 = dispatch thunk of static Equatable.== infix(_:_:)();
  uint64_t v32 = v96;
  v33 = *(void (**)(char *, uint64_t))(v96 + 8);
  v33(v27, a3);
  if (v31)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 16))(v97, v30, a3);
    return 0;
  }
  dispatch thunk of FloatingPoint.significand.getter();
  dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
  v35 = v81;
  dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
  dispatch thunk of static FloatingPoint./ infix(_:_:)();
  v33(v35, a3);
  v33(v27, a3);
  v36 = v94;
  dispatch thunk of FloatingPoint.exponent.getter();
  uint64_t v37 = v85;
  uint64_t v97 = swift_getAssociatedConformanceWitness();
  dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
  v38 = v90;
  dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
  v39 = v84;
  dispatch thunk of static AdditiveArithmetic.+ infix(_:_:)();
  uint64_t v40 = v91;
  v41 = *(void (**)(char *, uint64_t))(v91 + 8);
  v41(v38, v37);
  v41(v36, v37);
  char v42 = dispatch thunk of static BinaryInteger.isSigned.getter();
  v43 = *(void (**)(char *, char *, uint64_t))(v40 + 16);
  v44 = v82;
  v43(v82, v39, v37);
  if ((v42 & 1) == 0)
  {
    v41(v44, v37);
    v46 = v92;
    goto LABEL_12;
  }
  uint64_t v45 = dispatch thunk of BinaryInteger.bitWidth.getter();
  v41(v44, v37);
  v46 = v92;
  if (v45 <= 64) {
    goto LABEL_12;
  }
  v47 = v80;
  v43(v80, v39, v37);
  int64_t v99 = 0x8000000000000000;
  if (dispatch thunk of static BinaryInteger.isSigned.getter())
  {
    if (dispatch thunk of BinaryInteger.bitWidth.getter() >= 64)
    {
      lazy protocol witness table accessor for type Int and conformance Int();
      v67 = v94;
      dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
      v68 = v47;
      char v69 = dispatch thunk of static Comparable.< infix(_:_:)();
      v70 = v67;
      v46 = v92;
      v41(v70, v37);
      v41(v68, v37);
      if (v69) {
        goto LABEL_37;
      }
      goto LABEL_12;
    }
    uint64_t v48 = dispatch thunk of BinaryInteger._lowWord.getter();
    v49 = v47;
    uint64_t v50 = v48;
    v51 = v49;
LABEL_36:
    v41(v51, v37);
    if (v50 < v99) {
      goto LABEL_37;
    }
LABEL_12:
    uint64_t v52 = dispatch thunk of BinaryInteger.bitWidth.getter();
    v43(v46, v39, v37);
    if (v52 < 65)
    {
      uint64_t v57 = dispatch thunk of BinaryInteger.bitWidth.getter();
      v41(v46, v37);
      if (v57 != 64 || (dispatch thunk of static BinaryInteger.isSigned.getter() & 1) != 0) {
        goto LABEL_25;
      }
    }
    else
    {
      v41(v46, v37);
    }
    v43(v93, v39, v37);
    int64_t v99 = 0x7FFFFFFFFFFFFFFFLL;
    char v53 = dispatch thunk of static BinaryInteger.isSigned.getter();
    uint64_t v54 = dispatch thunk of BinaryInteger.bitWidth.getter();
    if (v53)
    {
      if (v54 > 64)
      {
        lazy protocol witness table accessor for type Int and conformance Int();
        v55 = v94;
        dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
        v56 = v93;
        while (1)
        {
          char v60 = dispatch thunk of static Comparable.< infix(_:_:)();
          v41(v55, v37);
          v41(v56, v37);
          if ((v60 & 1) == 0) {
            break;
          }
LABEL_22:
          __break(1u);
LABEL_23:
          uint64_t v98 = 0x7FFFFFFFFFFFFFFFLL;
          v56 = v94;
          (*(void (**)(char *, char *, uint64_t))(v91 + 32))(v94, v93, v37);
          lazy protocol witness table accessor for type Int and conformance Int();
          v55 = v90;
          dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
        }
        goto LABEL_25;
      }
    }
    else if (v54 > 63)
    {
      goto LABEL_23;
    }
    v58 = v93;
    uint64_t v59 = dispatch thunk of BinaryInteger._lowWord.getter();
    v41(v58, v37);
    if (v99 < v59) {
      goto LABEL_22;
    }
LABEL_25:
    uint64_t v34 = dispatch thunk of BinaryInteger._lowWord.getter();
    v41(v39, v37);
    return v34;
  }
  char v62 = dispatch thunk of static BinaryInteger.isSigned.getter();
  uint64_t v63 = dispatch thunk of BinaryInteger.bitWidth.getter();
  if ((v62 & 1) == 0)
  {
    v46 = v92;
    if (v63 >= 64)
    {
      v41(v80, v37);
      goto LABEL_12;
    }
    v71 = v80;
    uint64_t v50 = dispatch thunk of BinaryInteger._lowWord.getter();
    v51 = v71;
    goto LABEL_36;
  }
  if (v63 <= 64) {
    goto LABEL_38;
  }
  lazy protocol witness table accessor for type Int and conformance Int();
  v64 = v94;
  dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
  v65 = v80;
  char v66 = dispatch thunk of static Comparable.< infix(_:_:)();
  v41(v64, v37);
  v41(v65, v37);
  v46 = v92;
  if ((v66 & 1) == 0) {
    goto LABEL_12;
  }
LABEL_37:
  while (1)
  {
    __break(1u);
LABEL_38:
    dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
    v72 = v94;
    dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
    v73 = v80;
    LODWORD(v97) = dispatch thunk of static Comparable.< infix(_:_:)();
    v41(v72, v37);
    v74 = v79;
    (*(void (**)(char *, char *, uint64_t))(v91 + 32))(v79, v73, v37);
    if (v97) {
      break;
    }
    int64_t v75 = v99;
    uint64_t v76 = dispatch thunk of BinaryInteger._lowWord.getter();
    v41(v74, v37);
    BOOL v77 = v76 < v75;
    v46 = v92;
    if (!v77) {
      goto LABEL_12;
    }
  }
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v41)(v74, v37);
  __break(1u);
  return result;
}

Swift::Float __swiftcall ldexp(_:_:)(Swift::Float result, Swift::Int a2)
{
  int v2 = (LODWORD(result) >> 23);
  if (v2 != 255 && (v2 | LODWORD(result) & 0x7FFFFF) != 0)
  {
    if (a2 > -127)
    {
      if (a2 > 127)
      {
        if (a2 >= 381) {
          a2 = 381;
        }
        do
        {
          a2 -= 127;
          uint64_t result = result * 1.7014e38;
        }
        while ((unint64_t)a2 > 0x7F);
      }
    }
    else
    {
      if (a2 <= -378) {
        Swift::Int v4 = -378;
      }
      else {
        Swift::Int v4 = a2;
      }
      do
      {
        LODWORD(a2) = v4 + 126;
        uint64_t result = result * 1.1755e-38;
        BOOL v5 = __CFADD__(v4, 252);
        v4 += 126;
      }
      while (!v5);
    }
    return result * COERCE_FLOAT(((a2 << 23) + 1065353216) & 0x7F800000);
  }
  return result;
}

Swift::Double __swiftcall ldexp(_:_:)(Swift::Double result, Swift::Int a2)
{
  uint64_t v2 = (*(void *)&result >> 52) & 0x7FFLL;
  if (v2 != 2047 && (v2 | *(void *)&result & 0xFFFFFFFFFFFFFLL) != 0)
  {
    if (a2 > -1023)
    {
      if (a2 > 1023)
      {
        if (a2 >= 3069) {
          a2 = 3069;
        }
        do
        {
          a2 -= 1023;
          uint64_t result = result * 8.98846567e307;
        }
        while ((unint64_t)a2 > 0x3FF);
      }
    }
    else
    {
      if (a2 <= -3066) {
        Swift::Int v4 = -3066;
      }
      else {
        Swift::Int v4 = a2;
      }
      do
      {
        a2 = v4 + 1022;
        uint64_t result = result * 2.22507386e-308;
        BOOL v5 = __CFADD__(v4, 2044);
        v4 += 1022;
      }
      while (!v5);
    }
    return result * COERCE_DOUBLE(((a2 << 52) + 0x3FF0000000000000) & 0x7FF0000000000000);
  }
  return result;
}

void fpclassify<A>(_:)()
{
}

void isnormal<A>(_:)()
{
}

void isfinite<A>(_:)()
{
}

void isinf<A>(_:)()
{
}

void isnan<A>(_:)()
{
}

void signbit<A>(_:)()
{
}

uint64_t ilogb<A>(_:)()
{
  swift_getAssociatedTypeWitness();
  uint64_t v56 = *(void *)(*(void *)(*(void *)(swift_getAssociatedConformanceWitness() + 8) + 24) + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  v55 = (char *)&v51 - v0;
  uint64_t v1 = swift_checkMetadataState();
  uint64_t v2 = *(void **)(v1 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  uint64_t v54 = (char *)&v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v57 = (char *)&v51 - v6;
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v59 = (char *)&v51 - v8;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v51 - v10;
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  v58 = (char *)&v51 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v51 - v15;
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v19 = (char *)&v51 - v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v51 - v20;
  dispatch thunk of FloatingPoint.exponent.getter();
  char v22 = dispatch thunk of static BinaryInteger.isSigned.getter();
  char v60 = (void (*)(char *, char *, uint64_t))v2[2];
  v60(v19, v21, v1);
  if ((v22 & 1) == 0)
  {
    uint64_t v16 = (char *)v2[1];
    ((void (*)(char *, uint64_t))v16)(v19, v1);
    goto LABEL_20;
  }
  uint64_t v23 = dispatch thunk of BinaryInteger.bitWidth.getter();
  uint64_t v52 = v2;
  uint64_t v24 = (void (*)(char *, uint64_t))v2[1];
  v24(v19, v1);
  if (v23 <= 64)
  {
    uint64_t v2 = v52;
    uint64_t v16 = (char *)v24;
    goto LABEL_20;
  }
  v60(v16, v21, v1);
  int64_t v62 = 0x8000000000000000;
  if (dispatch thunk of static BinaryInteger.isSigned.getter())
  {
    if (dispatch thunk of BinaryInteger.bitWidth.getter() < 64) {
      goto LABEL_14;
    }
LABEL_10:
    lazy protocol witness table accessor for type Int and conformance Int();
    v27 = v58;
    dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
    char v28 = dispatch thunk of static Comparable.< infix(_:_:)();
    v24(v27, v1);
    v29 = v16;
    uint64_t v16 = (char *)v24;
    v24(v29, v1);
    uint64_t v2 = v52;
    if (v28) {
      goto LABEL_15;
    }
LABEL_20:
    uint64_t v38 = dispatch thunk of BinaryInteger.bitWidth.getter();
    v60(v11, v21, v1);
    if (v38 < 65)
    {
      uint64_t v45 = dispatch thunk of BinaryInteger.bitWidth.getter();
      ((void (*)(char *, uint64_t))v16)(v11, v1);
      if (v45 != 64 || (dispatch thunk of static BinaryInteger.isSigned.getter() & 1) != 0) {
        goto LABEL_33;
      }
    }
    else
    {
      ((void (*)(char *, uint64_t))v16)(v11, v1);
    }
    v39 = v59;
    v60(v59, v21, v1);
    int64_t v62 = 0x7FFFFFFFFFFFFFFFLL;
    char v40 = dispatch thunk of static BinaryInteger.isSigned.getter();
    uint64_t v41 = dispatch thunk of BinaryInteger.bitWidth.getter();
    if (v40)
    {
      if (v41 > 64)
      {
        lazy protocol witness table accessor for type Int and conformance Int();
        char v42 = v58;
        dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
        char v43 = dispatch thunk of static Comparable.< infix(_:_:)();
        ((void (*)(char *, uint64_t))v16)(v42, v1);
        for (i = v39; ; i = v48)
        {
          ((void (*)(char *, uint64_t))v16)(i, v1);
          if ((v43 & 1) == 0) {
            break;
          }
LABEL_30:
          __break(1u);
LABEL_31:
          uint64_t v61 = 0x7FFFFFFFFFFFFFFFLL;
          v47 = (void (*)(char *, char *, uint64_t))v2[4];
          v2 += 4;
          uint64_t v48 = v58;
          v47(v58, v39, v1);
          lazy protocol witness table accessor for type Int and conformance Int();
          v39 = v57;
          dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
          char v43 = dispatch thunk of static Comparable.< infix(_:_:)();
          ((void (*)(char *, uint64_t))v16)(v39, v1);
        }
        goto LABEL_33;
      }
    }
    else if (v41 > 63)
    {
      goto LABEL_31;
    }
    uint64_t v46 = dispatch thunk of BinaryInteger._lowWord.getter();
    ((void (*)(char *, uint64_t))v16)(v39, v1);
    if (v62 < v46) {
      goto LABEL_30;
    }
LABEL_33:
    uint64_t v49 = dispatch thunk of BinaryInteger._lowWord.getter();
    ((void (*)(char *, uint64_t))v16)(v21, v1);
    return v49;
  }
  char v25 = dispatch thunk of static BinaryInteger.isSigned.getter();
  uint64_t v26 = dispatch thunk of BinaryInteger.bitWidth.getter();
  if (v25)
  {
    if (v26 <= 64) {
      goto LABEL_16;
    }
    goto LABEL_10;
  }
  if (v26 >= 64)
  {
    uint64_t v37 = v16;
    uint64_t v16 = (char *)v24;
    v24(v37, v1);
    uint64_t v2 = v52;
    goto LABEL_20;
  }
LABEL_14:
  uint64_t v30 = dispatch thunk of BinaryInteger._lowWord.getter();
  char v31 = v16;
  uint64_t v16 = (char *)v24;
  v24(v31, v1);
  uint64_t v2 = v52;
  if (v30 >= v62) {
    goto LABEL_20;
  }
LABEL_15:
  while (1)
  {
    __break(1u);
LABEL_16:
    swift_getAssociatedConformanceWitness();
    dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
    uint64_t v32 = v58;
    dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
    LODWORD(v56) = dispatch thunk of static Comparable.< infix(_:_:)();
    v24(v32, v1);
    v33 = v54;
    ((void (*)(char *, char *, uint64_t))v52[4])(v54, v16, v1);
    if (v56) {
      break;
    }
    int64_t v34 = v62;
    uint64_t v35 = dispatch thunk of BinaryInteger._lowWord.getter();
    v24(v33, v1);
    BOOL v36 = v35 < v34;
    uint64_t v2 = v52;
    uint64_t v16 = (char *)v24;
    if (!v36) {
      goto LABEL_20;
    }
  }
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v24)(v33, v1);
  __break(1u);
  return result;
}

Swift::Float __swiftcall nearbyint(_:)(Swift::Float a1)
{
  return nearbyintf(a1);
}

Swift::Double __swiftcall nearbyint(_:)(Swift::Double a1)
{
  return nearbyint(a1);
}

Swift::Float __swiftcall rint(_:)(Swift::Float a1)
{
  return rintf(a1);
}

Swift::Double __swiftcall rint(_:)(Swift::Double a1)
{
  return rint(a1);
}

Swift::Float __swiftcall copysign(_:_:)(Swift::Float a1, Swift::Float a2)
{
  v2.i64[0] = 0x8000000080000000;
  v2.i64[1] = 0x8000000080000000;
  LODWORD(result) = vbslq_s8(v2, *(int8x16_t *)&a1, *(int8x16_t *)&a2).u32[0];
  return result;
}

Swift::Float __swiftcall fmax(_:_:)(Swift::Float a1, Swift::Float a2)
{
  return fmaxf(a1, a2);
}

Swift::Float __swiftcall fmin(_:_:)(Swift::Float a1, Swift::Float a2)
{
  return fminf(a1, a2);
}

Swift::tuple_Float_Int __swiftcall lgamma(_:)(Swift::Float a1)
{
  lgammaf_r();
  Swift::Int v2 = 0;
  result._1 = v2;
  result._0 = v1;
  return result;
}

Swift::tuple_Double_Int __swiftcall lgamma(_:)(Swift::Double a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v4 = 0;
  double v1 = lgamma_r(a1, &v4);
  Swift::Int v2 = v4;
  result._0 = v1;
  result._1 = v2;
  return result;
}

Swift::tuple_Float_Int __swiftcall remquo(_:_:)(Swift::Float a1, Swift::Float a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v4 = 0;
  float v2 = remquof(a1, a2, &v4);
  Swift::Int v3 = v4;
  result._1 = v3;
  result._0 = v2;
  return result;
}

Swift::tuple_Double_Int __swiftcall remquo(_:_:)(Swift::Double a1, Swift::Double a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int __z = 0;
  double v2 = remquo(a1, a2, &__z);
  Swift::Int v3 = __z;
  result._0 = v2;
  result._1 = v3;
  return result;
}

Swift::Float __swiftcall nan(_:)(Swift::String a1)
{
  uint64_t v1 = String.utf8CString.getter();
  float v2 = nanf((const char *)(v1 + 32));
  swift_release();
  return v2;
}

Swift::Double __swiftcall jn(_:_:)(Swift::Int a1, Swift::Double a2)
{
  jn(_:_:)(a1, MEMORY[0x263EF8908]);
  return result;
}

Swift::Double __swiftcall yn(_:_:)(Swift::Int a1, Swift::Double a2)
{
  jn(_:_:)(a1, MEMORY[0x263EF8B28]);
  return result;
}

uint64_t jn(_:_:)(uint64_t a1, uint64_t (*a2)(void))
{
  if (a1 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (a1 <= 0x7FFFFFFF)
  {
    return a2();
  }
  __break(1u);
  return dispatch thunk of FloatingPoint.squareRoot()();
}

uint64_t dispatch thunk of FloatingPoint.squareRoot()()
{
  return MEMORY[0x270F9D230]();
}

uint64_t dispatch thunk of FloatingPoint.significand.getter()
{
  return MEMORY[0x270F9D240]();
}

uint64_t dispatch thunk of FloatingPoint.addingProduct(_:_:)()
{
  return MEMORY[0x270F9D248]();
}

uint64_t dispatch thunk of FloatingPoint.truncatingRemainder(dividingBy:)()
{
  return MEMORY[0x270F9D258]();
}

uint64_t dispatch thunk of static FloatingPoint./ infix(_:_:)()
{
  return MEMORY[0x270F9D260]();
}

uint64_t dispatch thunk of FloatingPoint.init(sign:exponent:significand:)()
{
  return MEMORY[0x270F9D298]();
}

uint64_t dispatch thunk of FloatingPoint.rounded(_:)()
{
  return MEMORY[0x270F9D2C8]();
}

uint64_t dispatch thunk of FloatingPoint.exponent.getter()
{
  return MEMORY[0x270F9D2D0]();
}

uint64_t dispatch thunk of FloatingPoint.isFinite.getter()
{
  return MEMORY[0x270F9D2D8]();
}

uint64_t dispatch thunk of FloatingPoint.remainder(dividingBy:)()
{
  return MEMORY[0x270F9D2E8]();
}

uint64_t dispatch thunk of static Comparable.< infix(_:_:)()
{
  return MEMORY[0x270F9D488]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x270F9D598]();
}

uint64_t String.utf8CString.getter()
{
  return MEMORY[0x270F9D620]();
}

uint64_t dispatch thunk of Numeric.magnitude.getter()
{
  return MEMORY[0x270F9E030]();
}

uint64_t dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)()
{
  return MEMORY[0x270F9E5B8]();
}

uint64_t dispatch thunk of BinaryInteger._lowWord.getter()
{
  return MEMORY[0x270F9E640]();
}

uint64_t dispatch thunk of BinaryInteger.bitWidth.getter()
{
  return MEMORY[0x270F9E648]();
}

uint64_t dispatch thunk of static BinaryInteger.isSigned.getter()
{
  return MEMORY[0x270F9E650]();
}

uint64_t dispatch thunk of BinaryInteger.init<A>(_:)()
{
  return MEMORY[0x270F9E668]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t dispatch thunk of static AdditiveArithmetic.+ infix(_:_:)()
{
  return MEMORY[0x270F9F010]();
}

uint64_t dispatch thunk of static AdditiveArithmetic.- infix(_:_:)()
{
  return MEMORY[0x270F9F018]();
}

uint64_t type metadata accessor for FloatingPointRoundingRule()
{
  return MEMORY[0x270F9F750]();
}

uint64_t dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)()
{
  return MEMORY[0x270F9F7B0]();
}

uint64_t dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)()
{
  return MEMORY[0x270F9FA80]();
}

float acosf(float a1)
{
  MEMORY[0x270ED8598](a1);
  return result;
}

float acoshf(float a1)
{
  MEMORY[0x270ED85A8](a1);
  return result;
}

float asinf(float a1)
{
  MEMORY[0x270ED8618](a1);
  return result;
}

float asinhf(float a1)
{
  MEMORY[0x270ED8628](a1);
  return result;
}

float atan2f(float a1, float a2)
{
  MEMORY[0x270ED86B8](a1, a2);
  return result;
}

float atanf(float a1)
{
  MEMORY[0x270ED86C0](a1);
  return result;
}

float atanhf(float a1)
{
  MEMORY[0x270ED86D0](a1);
  return result;
}

float cbrtf(float a1)
{
  MEMORY[0x270ED87C0](a1);
  return result;
}

long double cos(long double __x)
{
  MEMORY[0x270ED9128](__x);
  return result;
}

float cosf(float a1)
{
  MEMORY[0x270ED9130](a1);
  return result;
}

float coshf(float a1)
{
  MEMORY[0x270ED9140](a1);
  return result;
}

float erfcf(float a1)
{
  MEMORY[0x270ED9790](a1);
  return result;
}

float erff(float a1)
{
  MEMORY[0x270ED9798](a1);
  return result;
}

long double exp(long double __x)
{
  MEMORY[0x270ED9858](__x);
  return result;
}

long double exp2(long double __x)
{
  MEMORY[0x270ED9860](__x);
  return result;
}

float exp2f(float a1)
{
  MEMORY[0x270ED9868](a1);
  return result;
}

float expf(float a1)
{
  MEMORY[0x270ED9870](a1);
  return result;
}

float expm1f(float a1)
{
  MEMORY[0x270ED9880](a1);
  return result;
}

float fdimf(float a1, float a2)
{
  MEMORY[0x270ED98E0](a1, a2);
  return result;
}

float hypotf(float a1, float a2)
{
  MEMORY[0x270ED9E60](a1, a2);
  return result;
}

double lgamma_r(double a1, int *a2)
{
  MEMORY[0x270EDA050](a2, a1);
  return result;
}

uint64_t lgammaf_r()
{
  return MEMORY[0x270EDA060]();
}

long double log(long double __x)
{
  MEMORY[0x270EDA0A8](__x);
  return result;
}

long double log10(long double __x)
{
  MEMORY[0x270EDA0B0](__x);
  return result;
}

float log10f(float a1)
{
  MEMORY[0x270EDA0B8](a1);
  return result;
}

float log1pf(float a1)
{
  MEMORY[0x270EDA0C8](a1);
  return result;
}

long double log2(long double __x)
{
  MEMORY[0x270EDA0D8](__x);
  return result;
}

float log2f(float a1)
{
  MEMORY[0x270EDA0E0](a1);
  return result;
}

float logbf(float a1)
{
  MEMORY[0x270EDA0F0](a1);
  return result;
}

float logf(float a1)
{
  MEMORY[0x270EDA0F8](a1);
  return result;
}

float nanf(const char *a1)
{
  MEMORY[0x270EDA608](a1);
  return result;
}

float nextafterf(float a1, float a2)
{
  MEMORY[0x270EDA718](a1, a2);
  return result;
}

float powf(float a1, float a2)
{
  MEMORY[0x270EDAD00](a1, a2);
  return result;
}

long double remquo(long double __x, long double __y, int *__z)
{
  MEMORY[0x270EDB228](__z, __x, __y);
  return result;
}

float remquof(float a1, float a2, int *a3)
{
  MEMORY[0x270EDB230](a3, a1, a2);
  return result;
}

long double sin(long double __x)
{
  MEMORY[0x270EDB4E8](__x);
  return result;
}

float sinf(float a1)
{
  MEMORY[0x270EDB4F0](a1);
  return result;
}

float sinhf(float a1)
{
  MEMORY[0x270EDB500](a1);
  return result;
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

float tanf(float a1)
{
  MEMORY[0x270EDB818](a1);
  return result;
}

float tanhf(float a1)
{
  MEMORY[0x270EDB828](a1);
  return result;
}

float tgammaf(float a1)
{
  MEMORY[0x270EDB8E8](a1);
  return result;
}