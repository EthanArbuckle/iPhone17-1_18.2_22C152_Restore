uint64_t Differentiable<>.move(by:)()
{
  swift_getAssociatedConformanceWitness();
  return dispatch thunk of static AdditiveArithmetic.+= infix(_:_:)();
}

uint64_t valueWithDifferential<A, B>(at:of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v8 = *(uint64_t (**)(char *, uint64_t))(a3 + 16);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ());
  swift_getTupleTypeMetadata2();
  MEMORY[0x270FA5388]();
  v10 = (char *)&v13 - v9;
  uint64_t v11 = v8((char *)&v13 - v9, a2);
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(a5 - 8) + 32))(a1, v10, a5);
  return v11;
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

uint64_t valueWithDifferential<A, B, C>(at:_:of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(a4 + 16);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ());
  swift_getTupleTypeMetadata2();
  MEMORY[0x270FA5388]();
  uint64_t v13 = (char *)&v16 - v12;
  uint64_t v14 = v11((char *)&v16 - v12, a2, a3);
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(a7 - 8) + 32))(a1, v13, a7);
  return v14;
}

uint64_t valueWithDifferential<A, B, C, D>(at:_:_:of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v13 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(a5 + 16);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ());
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  MEMORY[0x270FA5388](TupleTypeMetadata2 - 8);
  uint64_t v16 = (char *)&v19 - v15;
  uint64_t v17 = v13((char *)&v19 - v15, a2, a3, a4);
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(a9 - 8) + 32))(a1, v16, a9);
  return v17;
}

uint64_t valueWithPullback<A, B>(at:of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v8 = *(uint64_t (**)(char *, uint64_t))(a3 + 32);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ());
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  MEMORY[0x270FA5388](TupleTypeMetadata2 - 8);
  uint64_t v11 = (char *)&v14 - v10;
  uint64_t v12 = v8((char *)&v14 - v10, a2);
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(a5 - 8) + 32))(a1, v11, a5);
  return v12;
}

uint64_t valueWithPullback<A, B, C>(at:_:of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(a4 + 32);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ());
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  MEMORY[0x270FA5388](TupleTypeMetadata2 - 8);
  uint64_t v14 = (char *)&v17 - v13;
  uint64_t v15 = v11((char *)&v17 - v13, a2, a3);
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(a7 - 8) + 32))(a1, v14, a7);
  return v15;
}

uint64_t valueWithPullback<A, B, C, D>(at:_:_:of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v13 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(a5 + 32);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ());
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  MEMORY[0x270FA5388](TupleTypeMetadata2 - 8);
  uint64_t v16 = (char *)&v19 - v15;
  uint64_t v17 = v13((char *)&v19 - v15, a2, a3, a4);
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(a9 - 8) + 32))(a1, v16, a9);
  return v17;
}

uint64_t differential<A, B>(at:of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a4 - 8);
  MEMORY[0x270FA5388](a1);
  v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v9 = v8[1];
  v14[0] = *v8;
  v14[1] = v9;
  v14[2] = v8[2];
  uint64_t v12 = valueWithDifferential<A, B>(at:of:)((uint64_t)v7, v11, (uint64_t)v14, v10, v10);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, a4);
  return v12;
}

uint64_t differential<A, B, C>(at:_:of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = *(void *)(a6 - 8);
  MEMORY[0x270FA5388](a1);
  long long v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v11 = v10[1];
  v18[0] = *v10;
  v18[1] = v11;
  v18[2] = v10[2];
  uint64_t v16 = valueWithDifferential<A, B, C>(at:_:of:)((uint64_t)v9, v12, v15, (uint64_t)v18, v13, v14, v14);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, a6);
  return v16;
}

uint64_t differential<A, B, C, D>(at:_:_:of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a8 - 8);
  MEMORY[0x270FA5388](a1);
  long long v11 = (char *)v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v13 = v12[1];
  v22[0] = *v12;
  v22[1] = v13;
  v22[2] = v12[2];
  uint64_t v20 = valueWithDifferential<A, B, C, D>(at:_:_:of:)((uint64_t)v11, v14, v15, v19, (uint64_t)v22, v16, v17, v18, v18);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, a8);
  return v20;
}

uint64_t pullback<A, B>(at:of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(uint64_t (**)(char *, uint64_t))(a2 + 32);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ());
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  MEMORY[0x270FA5388](TupleTypeMetadata2 - 8);
  uint64_t v9 = (char *)&v12 - v8;
  uint64_t v10 = v6((char *)&v12 - v8, a1);
  (*(void (**)(char *, uint64_t))(*(void *)(a4 - 8) + 8))(v9, a4);
  return v10;
}

uint64_t pullback<A, B, C>(at:_:of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(a3 + 32);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ());
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  MEMORY[0x270FA5388](TupleTypeMetadata2 - 8);
  uint64_t v12 = (char *)&v15 - v11;
  uint64_t v13 = v9((char *)&v15 - v11, a1, a2);
  (*(void (**)(char *, uint64_t))(*(void *)(a6 - 8) + 8))(v12, a6);
  return v13;
}

uint64_t pullback<A, B, C, D>(at:_:_:of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(a4 + 32);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ());
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  MEMORY[0x270FA5388](TupleTypeMetadata2 - 8);
  uint64_t v15 = (char *)&v18 - v14;
  uint64_t v16 = v12((char *)&v18 - v14, a1, a2, a3);
  (*(void (**)(char *, uint64_t))(*(void *)(a8 - 8) + 8))(v15, a8);
  return v16;
}

uint64_t derivative<A, B>(at:of:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](a1);
  uint64_t v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v9 = v8[1];
  v14[0] = *v8;
  v14[1] = v9;
  v14[2] = v8[2];
  uint64_t v12 = (void (*)(char *))differential<A, B>(at:of:)(v5, (uint64_t)v14, v10, v11);
  dispatch thunk of FloatingPoint.init(_:)();
  v12(v7);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, a3);
}

uint64_t derivative<A, B, C>(at:_:of:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X6>, uint64_t a5@<X8>)
{
  v24[0] = a4;
  v24[1] = a5;
  uint64_t v7 = *(void *)(a3 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](a1);
  uint64_t v10 = (char *)v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v8);
  uint64_t v15 = (char *)v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v17 = v16[1];
  v25[0] = *v16;
  v25[1] = v17;
  v25[2] = v16[2];
  v22 = (void (*)(char *, char *))differential<A, B, C>(at:_:of:)(v13, v18, (uint64_t)v25, v19, v20, v21);
  dispatch thunk of FloatingPoint.init(_:)();
  dispatch thunk of FloatingPoint.init(_:)();
  v22(v15, v10);
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, a3);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v15, a2);
}

uint64_t derivative<A, B, C, D>(at:_:_:of:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X4>, uint64_t a3@<X5>, uint64_t a4@<X6>, uint64_t a5@<X8>, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  v36[4] = a5;
  v36[2] = a8;
  v36[3] = a10;
  uint64_t v37 = *(void *)(a4 - 8);
  v36[1] = a6;
  uint64_t v13 = MEMORY[0x270FA5388](a1);
  uint64_t v15 = (char *)v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v13);
  uint64_t v20 = (char *)v36 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = MEMORY[0x270FA5388](v18);
  v25 = (char *)v36 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v27 = v26[1];
  v38[0] = *v26;
  v38[1] = v27;
  v38[2] = v26[2];
  v34 = (void (*)(char *, char *, char *))differential<A, B, C, D>(at:_:_:of:)(v23, v28, v29, (uint64_t)v38, v30, v31, v32, v33);
  v36[0] = a2;
  dispatch thunk of FloatingPoint.init(_:)();
  dispatch thunk of FloatingPoint.init(_:)();
  dispatch thunk of FloatingPoint.init(_:)();
  v34(v25, v20, v15);
  swift_release();
  (*(void (**)(char *, uint64_t))(v37 + 8))(v15, a4);
  (*(void (**)(char *, uint64_t))(v17 + 8))(v20, a3);
  return (*(uint64_t (**)(char *, void))(v22 + 8))(v25, v36[0]);
}

uint64_t gradient<A, B>(at:of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](a1);
  uint64_t v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v10 = v9[1];
  v15[0] = *v9;
  v15[1] = v10;
  v15[2] = v9[2];
  uint64_t v13 = (void (*)(char *))pullback<A, B>(at:of:)(v6, (uint64_t)v15, v11, v12);
  dispatch thunk of FloatingPoint.init(_:)();
  v13(v8);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, a4);
}

uint64_t gradient<A, B, C>(at:_:of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = *(void *)(a8 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v13 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v15 = v14[1];
  v21[0] = *v14;
  v21[1] = v15;
  v21[2] = v14[2];
  uint64_t v19 = (void (*)(uint64_t, uint64_t, char *))pullback<A, B, C>(at:_:of:)(v18, v16, (uint64_t)v21, v16, (uint64_t)v14, v17);
  dispatch thunk of FloatingPoint.init(_:)();
  v19(a1, a2, v13);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, a8);
}

uint64_t gradient<A, B, C, D>(at:_:_:of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v14 = *(void *)(a11 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v16 = (char *)v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v18 = v17[1];
  v24[0] = *v17;
  v24[1] = v18;
  void v24[2] = v17[2];
  uint64_t v22 = (void (*)(uint64_t, uint64_t, uint64_t, char *))pullback<A, B, C, D>(at:_:_:of:)(v21, v19, v20, (uint64_t)v24, v19, v20, (uint64_t)v17, a11);
  dispatch thunk of FloatingPoint.init(_:)();
  v22(a1, a2, a3, v16);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, a11);
}

uint64_t valueWithDerivative<A, B>(at:of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = *(void *)(a5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v11 = v10[1];
  v16[0] = *v10;
  v16[1] = v11;
  v16[2] = v10[2];
  uint64_t v14 = (void (*)(char *))valueWithDifferential<A, B>(at:of:)(v7, v13, (uint64_t)v16, (uint64_t)v10, v12);
  dispatch thunk of FloatingPoint.init(_:)();
  v14(v9);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, a5);
}

uint64_t valueWithDerivative<A, B, C>(at:_:of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  v30[0] = a11;
  v30[1] = a2;
  uint64_t v13 = *(void *)(a7 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](a1);
  uint64_t v16 = (char *)v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v14);
  uint64_t v21 = (char *)v30 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v23 = v22[1];
  v31[0] = *v22;
  v31[1] = v23;
  v31[2] = v22[2];
  uint64_t v28 = (void (*)(char *, char *))valueWithDifferential<A, B, C>(at:_:of:)(v19, v24, v27, (uint64_t)v31, (uint64_t)v22, v25, v26);
  dispatch thunk of FloatingPoint.init(_:)();
  dispatch thunk of FloatingPoint.init(_:)();
  v28(v21, v16);
  swift_release();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v16, a7);
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v21, a6);
}

uint64_t valueWithDerivative<A, B, C, D>(at:_:_:of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  v40[3] = a15;
  v40[4] = a2;
  v40[2] = a13;
  uint64_t v41 = *(void *)(a9 - 8);
  v40[1] = a11;
  uint64_t v17 = MEMORY[0x270FA5388](a1);
  uint64_t v19 = (char *)v40 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = MEMORY[0x270FA5388](v17);
  uint64_t v24 = (char *)v40 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v27 = MEMORY[0x270FA5388](v22);
  uint64_t v29 = (char *)v40 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v31 = v30[1];
  v42[0] = *v30;
  v42[1] = v31;
  v42[2] = v30[2];
  v38 = (void (*)(char *, char *, char *))valueWithDifferential<A, B, C, D>(at:_:_:of:)(v27, v32, v33, v36, (uint64_t)v42, (uint64_t)v30, v34, v35, v37);
  v40[0] = a7;
  dispatch thunk of FloatingPoint.init(_:)();
  dispatch thunk of FloatingPoint.init(_:)();
  dispatch thunk of FloatingPoint.init(_:)();
  v38(v29, v24, v19);
  swift_release();
  (*(void (**)(char *, uint64_t))(v41 + 8))(v19, a9);
  (*(void (**)(char *, uint64_t))(v21 + 8))(v24, a8);
  return (*(uint64_t (**)(char *, void))(v26 + 8))(v29, v40[0]);
}

uint64_t valueWithGradient<A, B>(at:of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = *(void *)(a6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](a1);
  long long v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v12 = v11[1];
  v17[0] = *v11;
  v17[1] = v12;
  v17[2] = v11[2];
  uint64_t v15 = (void (*)(char *))valueWithPullback<A, B>(at:of:)(v8, v14, (uint64_t)v17, (uint64_t)v11, v13);
  dispatch thunk of FloatingPoint.init(_:)();
  v15(v10);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, a6);
}

uint64_t valueWithGradient<A, B, C>(at:_:of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v11 = *(void *)(a9 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](a1);
  uint64_t v14 = (char *)v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v16 = v15[1];
  v21[0] = *v15;
  v21[1] = v16;
  v21[2] = v15[2];
  uint64_t v19 = (void (*)(uint64_t, uint64_t, char *))valueWithPullback<A, B, C>(at:_:of:)(v12, v18, v17, (uint64_t)v21, v17, (uint64_t)v15, a9);
  dispatch thunk of FloatingPoint.init(_:)();
  v19(a2, a3, v14);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v14, a9);
}

uint64_t valueWithGradient<A, B, C, D>(at:_:_:of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v15 = *(void *)(a12 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](a1);
  uint64_t v18 = (char *)v26 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v20 = v19[1];
  v26[0] = *v19;
  v26[1] = v20;
  v26[2] = v19[2];
  uint64_t v24 = (void (*)(uint64_t, uint64_t, uint64_t, char *))valueWithPullback<A, B, C, D>(at:_:_:of:)(v16, v23, v21, v22, (uint64_t)v26, v21, v22, (uint64_t)v19, a12);
  dispatch thunk of FloatingPoint.init(_:)();
  v24(a2, a3, a4, v18);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v18, a12);
}

uint64_t (*derivative<A, B>(of:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6))(uint64_t a1)
{
  uint64_t v12 = *a1;
  uint64_t v13 = a1[5];
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a2;
  *(void *)(v14 + 24) = a3;
  *(void *)(v14 + 32) = a4;
  *(void *)(v14 + 40) = a5;
  *(void *)(v14 + 48) = a6;
  *(void *)(v14 + 56) = v12;
  long long v15 = *(_OWORD *)(a1 + 3);
  *(_OWORD *)(v14 + 64) = *(_OWORD *)(a1 + 1);
  *(_OWORD *)(v14 + 80) = v15;
  *(void *)(v14 + 96) = v13;
  swift_retain();
  swift_retain();
  swift_retain();
  return partial apply for closure #1 in derivative<A, B>(of:);
}

uint64_t partial apply for closure #1 in derivative<A, B>(of:)(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + 16);
  long long v3 = *(_OWORD *)(v1 + 72);
  v5[0] = *(_OWORD *)(v1 + 56);
  v5[1] = v3;
  v5[2] = *(_OWORD *)(v1 + 88);
  return derivative<A, B>(at:of:)(a1, (uint64_t)v5, v2);
}

uint64_t (*derivative<A, B, C>(of:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9))@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v15 = *a1;
  uint64_t v16 = a1[5];
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a2;
  *(void *)(v17 + 24) = a3;
  *(void *)(v17 + 32) = a4;
  *(void *)(v17 + 40) = a5;
  *(void *)(v17 + 48) = a6;
  *(void *)(v17 + 56) = a7;
  *(void *)(v17 + 64) = a8;
  *(void *)(v17 + 72) = a9;
  *(void *)(v17 + 80) = v15;
  *(_OWORD *)(v17 + 88) = *(_OWORD *)(a1 + 1);
  *(_OWORD *)(v17 + 104) = *(_OWORD *)(a1 + 3);
  *(void *)(v17 + 120) = v16;
  swift_retain();
  swift_retain();
  swift_retain();
  return partial apply for closure #1 in derivative<A, B, C>(of:);
}

uint64_t sub_22272292C()
{
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 128, 7);
}

uint64_t partial apply for closure #1 in derivative<A, B, C>(of:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return derivative<A, B, C>(at:_:of:)(a1, v2[2], v2[3], v2[5], a2);
}

uint64_t (*derivative<A, B, C, D>(of:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9, uint64_t a10, uint64_t a11))@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v16 = *a1;
  uint64_t v17 = a1[5];
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = a2;
  *(void *)(v18 + 24) = a3;
  *(void *)(v18 + 32) = a4;
  *(void *)(v18 + 40) = a5;
  *(void *)(v18 + 48) = a6;
  *(void *)(v18 + 56) = a7;
  *(void *)(v18 + 64) = a8;
  *(_OWORD *)(v18 + 72) = a9;
  *(void *)(v18 + 88) = a10;
  *(void *)(v18 + 96) = a11;
  *(void *)(v18 + 104) = v16;
  long long v19 = *(_OWORD *)(a1 + 3);
  *(_OWORD *)(v18 + 112) = *(_OWORD *)(a1 + 1);
  *(_OWORD *)(v18 + 128) = v19;
  *(void *)(v18 + 144) = v17;
  swift_retain();
  swift_retain();
  swift_retain();
  return partial apply for closure #1 in derivative<A, B, C, D>(of:);
}

uint64_t sub_222722ABC()
{
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 152, 7);
}

uint64_t partial apply for closure #1 in derivative<A, B, C, D>(of:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return derivative<A, B, C, D>(at:_:_:of:)(a1, v2[2], v2[3], v2[4], a2, v2[6], v4, v2[8], v5, v2[10]);
}

uint64_t (*gradient<A, B>(of:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v12 = *a1;
  uint64_t v13 = a1[5];
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a2;
  *(void *)(v14 + 24) = a3;
  *(void *)(v14 + 32) = a4;
  *(void *)(v14 + 40) = a5;
  *(void *)(v14 + 48) = a6;
  *(void *)(v14 + 56) = v12;
  long long v15 = *(_OWORD *)(a1 + 3);
  *(_OWORD *)(v14 + 64) = *(_OWORD *)(a1 + 1);
  *(_OWORD *)(v14 + 80) = v15;
  *(void *)(v14 + 96) = v13;
  swift_retain();
  swift_retain();
  swift_retain();
  return partial apply for closure #1 in gradient<A, B>(of:);
}

uint64_t objectdestroyTm()
{
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 104, 7);
}

uint64_t partial apply for closure #1 in gradient<A, B>(of:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(v3 + 24);
  long long v5 = *(_OWORD *)(v3 + 72);
  v7[0] = *(_OWORD *)(v3 + 56);
  v7[1] = v5;
  v7[2] = *(_OWORD *)(v3 + 88);
  return gradient<A, B>(at:of:)(a1, (uint64_t)v7, a3, v4);
}

uint64_t (*gradient<A, B, C>(of:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8))(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v15 = *a1;
  uint64_t v16 = a1[5];
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a2;
  *(void *)(v17 + 24) = a3;
  *(void *)(v17 + 32) = a4;
  *(void *)(v17 + 40) = a5;
  *(void *)(v17 + 48) = a6;
  *(void *)(v17 + 56) = a7;
  *(void *)(v17 + 64) = a8;
  *(void *)(v17 + 72) = v15;
  long long v18 = *(_OWORD *)(a1 + 3);
  *(_OWORD *)(v17 + 80) = *(_OWORD *)(a1 + 1);
  *(_OWORD *)(v17 + 96) = v18;
  *(void *)(v17 + 112) = v16;
  swift_retain();
  swift_retain();
  swift_retain();
  return partial apply for closure #1 in gradient<A, B, C>(of:);
}

uint64_t sub_222722DA0()
{
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 120, 7);
}

uint64_t partial apply for closure #1 in gradient<A, B, C>(of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8 = *(void *)(v7 + 32);
  long long v9 = *(_OWORD *)(v7 + 88);
  v11[0] = *(_OWORD *)(v7 + 72);
  v11[1] = v9;
  v11[2] = *(_OWORD *)(v7 + 104);
  return gradient<A, B, C>(at:_:of:)(a1, a2, a3, a4, (uint64_t)v11, a6, a7, v8);
}

uint64_t (*gradient<A, B, C, D>(of:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10))(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v15 = *a1;
  uint64_t v16 = a1[5];
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a2;
  *(void *)(v17 + 24) = a3;
  *(void *)(v17 + 32) = a4;
  *(void *)(v17 + 40) = a5;
  *(void *)(v17 + 48) = a6;
  *(void *)(v17 + 56) = a7;
  *(void *)(v17 + 64) = a8;
  *(void *)(v17 + 72) = a9;
  *(void *)(v17 + 80) = a10;
  *(void *)(v17 + 88) = v15;
  long long v18 = *(_OWORD *)(a1 + 3);
  *(_OWORD *)(v17 + 96) = *(_OWORD *)(a1 + 1);
  *(_OWORD *)(v17 + 112) = v18;
  *(void *)(v17 + 128) = v16;
  swift_retain();
  swift_retain();
  swift_retain();
  return partial apply for closure #1 in gradient<A, B, C, D>(of:);
}

uint64_t sub_222722F1C()
{
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 136, 7);
}

uint64_t partial apply for closure #1 in gradient<A, B, C, D>(of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(v8 + 40);
  long long v10 = *(_OWORD *)(v8 + 104);
  v14[0] = *(_OWORD *)(v8 + 88);
  v14[1] = v10;
  v14[2] = *(_OWORD *)(v8 + 120);
  return gradient<A, B, C, D>(at:_:_:of:)(a1, a2, a3, a4, a5, a6, (uint64_t)v14, a8, v12, v13, v9);
}

uint64_t withoutDerivative<A>(at:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(a3, a1, a2);
}

void _fatalErrorForwardModeDifferentiationDisabled()
{
}

uint64_t _ConcreteDifferentiableBox._move(by:)(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  uint64_t v21 = *(void *)(a2 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = type metadata accessor for Optional();
  uint64_t v20 = *(void *)(v5 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v19 - v7;
  uint64_t v9 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v11 = (char *)&v19 - v10;
  uint64_t v13 = a1[3];
  uint64_t v12 = a1[4];
  __swift_project_boxed_opaque_existential_1Tm(a1, v13);
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v12 + 56))(v22, v13, v12);
  int v14 = swift_dynamicCast();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
  if (!v14)
  {
    v15(v8, 1, 1, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v20 + 8))(v8, v5);
    uint64_t v17 = a1[3];
    uint64_t v18 = a1[4];
    __swift_project_boxed_opaque_existential_1Tm(a1, v17);
    (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v18 + 56))(v22, v17, v18);
    __swift_project_boxed_opaque_existential_1Tm(v22, v22[3]);
    swift_getDynamicType();
    _derivativeTypeMismatch(_:_:file:line:)();
  }
  v15(v8, 0, 1, AssociatedTypeWitness);
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v8, AssociatedTypeWitness);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 32))(v11, v21, v3);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, AssociatedTypeWitness);
}

uint64_t AnyDerivative.base.getter()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[4];
  __swift_project_boxed_opaque_existential_1Tm(v0, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 56))(v1, v2);
}

void _derivativeTypeMismatch(_:_:file:line:)()
{
  _StringGuts.grow(_:)(35);
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any.Type);
  v0._countAndFlagsBits = String.init<A>(reflecting:)();
  String.append(_:)(v0);
  swift_bridgeObjectRelease();
  v1._countAndFlagsBits = 0x20646E6120;
  v1._object = (void *)0xE500000000000000;
  String.append(_:)(v1);
  v2._countAndFlagsBits = String.init<A>(reflecting:)();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
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

uint64_t protocol witness for _AnyDifferentiableBox._typeErasedBase.getter in conformance _ConcreteDifferentiableBox<A>@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return _ConcreteDifferentiableBox._typeErasedBase.getter(a1, a2);
}

uint64_t AnyDifferentiable.base.getter()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[4];
  __swift_project_boxed_opaque_existential_1Tm(v0, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v1, v2);
}

uint64_t AnyDifferentiable.init<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return AnyDifferentiable.init<A>(_:)(a1, a2, (uint64_t (*)(void))type metadata accessor for _ConcreteDifferentiableBox, (uint64_t)&protocol witness table for _ConcreteDifferentiableBox<A>, a3);
}

uint64_t type metadata accessor for _ConcreteDifferentiableBox()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t (*static AnyDifferentiable._vjpInit<A>(_:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4))(void *a1)
{
  MEMORY[0x270FA5388](a1);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v9 + 16))(v8);
  AnyDifferentiable.init<A>(_:)((uint64_t)v8, a3, a1);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a3;
  *(void *)(v10 + 24) = a4;
  return partial apply for closure #1 in static AnyDifferentiable._vjpInit<A>(_:);
}

uint64_t closure #1 in static AnyDifferentiable._vjpInit<A>(_:)(void *a1)
{
  uint64_t v1 = a1[3];
  uint64_t v2 = a1[4];
  __swift_project_boxed_opaque_existential_1Tm(a1, v1);
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v2 + 56))(v4, v1, v2);
  swift_getAssociatedTypeWitness();
  return swift_dynamicCast();
}

uint64_t sub_222723714()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t partial apply for closure #1 in static AnyDifferentiable._vjpInit<A>(_:)(void *a1)
{
  return closure #1 in static AnyDifferentiable._vjpInit<A>(_:)(a1);
}

uint64_t (*reverse-mode derivative of AnyDifferentiable.init<A>(_:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4))(void *a1)
{
  return partial apply for closure #1 in static AnyDifferentiable._vjpInit<A>(_:);
}

uint64_t (*static AnyDifferentiable._jvpInit<A>(_:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4))@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  MEMORY[0x270FA5388](a1);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v9 + 16))(v8);
  AnyDifferentiable.init<A>(_:)((uint64_t)v8, a3, a1);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a3;
  *(void *)(v10 + 24) = a4;
  return partial apply for closure #1 in static AnyDifferentiable._jvpInit<A>(_:);
}

uint64_t closure #1 in static AnyDifferentiable._jvpInit<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v6 = (char *)&v9 - v5;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v9 - v5, a1, AssociatedTypeWitness);
  swift_getAssociatedConformanceWitness();
  return AnyDerivative.init<A>(_:)((uint64_t)v6, AssociatedTypeWitness, a2);
}

uint64_t sub_2227239C4()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t partial apply for closure #1 in static AnyDifferentiable._jvpInit<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return closure #1 in static AnyDifferentiable._jvpInit<A>(_:)(a1, a2);
}

uint64_t AnyDerivative.init<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return AnyDifferentiable.init<A>(_:)(a1, a2, (uint64_t (*)(void))type metadata accessor for _ConcreteDerivativeBox, (uint64_t)&protocol witness table for _ConcreteDerivativeBox<A>, a3);
}

uint64_t AnyDifferentiable.init<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(void)@<X3>, uint64_t a4@<X4>, uint64_t *a5@<X8>)
{
  a5[3] = a3(0);
  a5[4] = a4;
  boxed_opaque_existential_1Tm = __swift_allocate_boxed_opaque_existential_1Tm(a5);
  uint64_t v10 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 32);

  return v10(boxed_opaque_existential_1Tm, a1, a2);
}

uint64_t (*forward-mode derivative of AnyDifferentiable.init<A>(_:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4))(uint64_t a1)
{
  static AnyDifferentiable._jvpInit<A>(_:)(a1, a2, a3, a4);
  uint64_t v8 = v7;
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a3 - 8) + 8))(a2, a3);
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = partial apply for closure #1 in static AnyDifferentiable._jvpInit<A>(_:);
  v9[5] = v8;
  return partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A.Differentiable.TangentVector) -> (@out AnyDerivative);
}

uint64_t AnyDifferentiable.move(by:)(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 24);
  uint64_t v4 = *(void *)(v1 + 32);
  __swift_mutable_project_boxed_opaque_existential_1(v1, v3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 8))(a1, v3, v4);
}

uint64_t protocol witness for Differentiable.move(by:) in conformance AnyDifferentiable(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 24);
  uint64_t v4 = *(void *)(v1 + 32);
  __swift_mutable_project_boxed_opaque_existential_1(v1, v3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 8))(a1, v3, v4);
}

uint64_t AnyDifferentiable.customMirror.getter()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[4];
  __swift_project_boxed_opaque_existential_1Tm(v0, v1);
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v2 + 16))(v4, v1, v2);
  return Mirror.init(reflecting:)();
}

uint64_t protocol witness for CustomReflectable.customMirror.getter in conformance AnyDifferentiable()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[4];
  __swift_project_boxed_opaque_existential_1Tm(v0, v1);
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v2 + 16))(v4, v1, v2);
  return Mirror.init(reflecting:)();
}

Swift::Bool __swiftcall _AnyDerivativeBox._isOpaqueZero()()
{
  void (*v4)(uint64_t *__return_ptr, ValueMetadata *, ValueMetadata *, unint64_t, uint64_t, uint64_t);
  unint64_t v5;
  uint64_t v7;

  uint64_t v2 = v1;
  uint64_t v3 = v0;
  uint64_t v4 = *(void (**)(uint64_t *__return_ptr, ValueMetadata *, ValueMetadata *, unint64_t, uint64_t, uint64_t))(v1 + 64);
  uint64_t v5 = lazy protocol witness table accessor for type AnyDerivative.OpaqueZero and conformance AnyDerivative.OpaqueZero();
  v4(&v7, &type metadata for AnyDerivative.OpaqueZero, &type metadata for AnyDerivative.OpaqueZero, v5, v3, v2);
  return (v7 & 1) == 0;
}

uint64_t _ConcreteDerivativeBox._base.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t _ConcreteDerivativeBox._base.setter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a2 + 16) - 8) + 40))(v2, a1);
}

uint64_t (*_ConcreteDerivativeBox._base.modify())()
{
  return _ConcreteDerivativeBox._base.modify;
}

uint64_t _ConcreteDifferentiableBox.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 32))(a3, a1, a2);
}

uint64_t type metadata accessor for _ConcreteDerivativeBox()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A.Differentiable.TangentVector) -> (@out AnyDerivative)(uint64_t a1)
{
  (*(void (**)(void))(v1 + 32))();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 8);

  return v4(a1, AssociatedTypeWitness);
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

unint64_t lazy protocol witness table accessor for type AnyDerivative.OpaqueZero and conformance AnyDerivative.OpaqueZero()
{
  unint64_t result = lazy protocol witness table cache variable for type AnyDerivative.OpaqueZero and conformance AnyDerivative.OpaqueZero;
  if (!lazy protocol witness table cache variable for type AnyDerivative.OpaqueZero and conformance AnyDerivative.OpaqueZero)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AnyDerivative.OpaqueZero and conformance AnyDerivative.OpaqueZero);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AnyDerivative.OpaqueZero and conformance AnyDerivative.OpaqueZero;
  if (!lazy protocol witness table cache variable for type AnyDerivative.OpaqueZero and conformance AnyDerivative.OpaqueZero)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AnyDerivative.OpaqueZero and conformance AnyDerivative.OpaqueZero);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AnyDerivative.OpaqueZero and conformance AnyDerivative.OpaqueZero;
  if (!lazy protocol witness table cache variable for type AnyDerivative.OpaqueZero and conformance AnyDerivative.OpaqueZero)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AnyDerivative.OpaqueZero and conformance AnyDerivative.OpaqueZero);
  }
  return result;
}

uint64_t _ConcreteDifferentiableBox._typeErasedBase.getter@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  a2[3] = v3;
  boxed_opaque_existential_1Tm = __swift_allocate_boxed_opaque_existential_1Tm(a2);
  uint64_t v5 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v5(boxed_opaque_existential_1Tm, v2, v3);
}

uint64_t *__swift_allocate_boxed_opaque_existential_1Tm(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t _ConcreteDerivativeBox._unboxed<A>(to:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5 = v4;
  uint64_t v9 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for _ConcreteDerivativeBox();
  uint64_t v13 = type metadata accessor for Optional();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v23 - v15;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v5, a2);
  int v17 = swift_dynamicCast();
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
  if (v17)
  {
    uint64_t v19 = *(void *)(v12 - 8);
    v18(v16, 0, 1, v12);
    uint64_t v20 = *(void *)(a3 - 8);
    (*(void (**)(uint64_t, char *, uint64_t))(v20 + 16))(a4, v16, a3);
    (*(void (**)(char *, uint64_t))(v19 + 8))(v16, v12);
    uint64_t v21 = 0;
  }
  else
  {
    uint64_t v21 = 1;
    v18(v16, 1, 1, v12);
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    uint64_t v20 = *(void *)(a3 - 8);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56))(a4, v21, 1, a3);
}

uint64_t _ConcreteDerivativeBox._isEqual(to:)(void *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](a1);
  v39 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Optional();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v42 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](TupleTypeMetadata2);
  uint64_t v13 = (char *)&v36 - v12;
  uint64_t v41 = *(void *)(v9 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  v43 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v36 - v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v36 - v19;
  uint64_t v40 = v7;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v36 - v19, v3, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v20, 0, 1, v6);
  uint64_t v21 = a1[4];
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  uint64_t v22 = *(void (**)(uint64_t, uint64_t))(v21 + 64);
  uint64_t v38 = *(void *)(a2 + 24);
  v22(v6, v6);
  uint64_t v23 = TupleTypeMetadata2;
  uint64_t v24 = *(int *)(TupleTypeMetadata2 + 48);
  uint64_t v25 = v41;
  uint64_t v26 = &v13[v24];
  uint64_t v27 = *(void (**)(char *, char *, uint64_t))(v41 + 32);
  v27(v13, v20, v9);
  v27(v26, v18, v9);
  uint64_t v28 = v40;
  uint64_t v29 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v40 + 48);
  if (v29(v13, 1, v6) == 1)
  {
    if (v29(v26, 1, v6) == 1)
    {
      char v30 = 1;
    }
    else
    {
      uint64_t v25 = v42;
      uint64_t v9 = v23;
      char v30 = 0;
    }
  }
  else
  {
    uint64_t v31 = v42;
    uint64_t v37 = v23;
    (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v43, v13, v9);
    if (v29(v26, 1, v6) == 1)
    {
      (*(void (**)(char *, uint64_t))(v28 + 8))(v43, v6);
      char v30 = 0;
      uint64_t v25 = v31;
      uint64_t v9 = v37;
    }
    else
    {
      uint64_t v32 = v39;
      (*(void (**)(char *, char *, uint64_t))(v28 + 32))(v39, v26, v6);
      swift_getAssociatedConformanceWitness();
      uint64_t v33 = v43;
      char v30 = dispatch thunk of static Equatable.== infix(_:_:)();
      uint64_t v34 = *(void (**)(char *, uint64_t))(v28 + 8);
      v34(v32, v6);
      v34(v33, v6);
    }
  }
  (*(void (**)(char *, uint64_t))(v25 + 8))(v13, v9);
  return v30 & 1;
}

uint64_t _ConcreteDerivativeBox._isNotEqual(to:)(void *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v36 = (char *)v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Optional();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v38 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](TupleTypeMetadata2);
  uint64_t v41 = (char *)v35 - v12;
  uint64_t v40 = *(void *)(v9 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v37 = (char *)v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)v35 - v16;
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)v35 - v18;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)v35 - v18, v3, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v19, 0, 1, v6);
  uint64_t v20 = a1[4];
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v20 + 64);
  v35[1] = *(void *)(a2 + 24);
  v21(v6, v6);
  uint64_t v39 = TupleTypeMetadata2;
  uint64_t v22 = *(int *)(TupleTypeMetadata2 + 48);
  uint64_t v23 = v7;
  uint64_t v24 = v41;
  uint64_t v25 = &v41[v22];
  uint64_t v26 = v40;
  uint64_t v27 = *(void (**)(char *, char *, uint64_t))(v40 + 32);
  v27(v41, v19, v9);
  v27(v25, v17, v9);
  uint64_t v28 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48);
  if (v28(v24, 1, v6) != 1)
  {
    char v30 = v37;
    (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v37, v24, v9);
    if (v28(v25, 1, v6) != 1)
    {
      uint64_t v31 = v36;
      (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v36, v25, v6);
      swift_getAssociatedConformanceWitness();
      char v32 = dispatch thunk of static Equatable.== infix(_:_:)();
      uint64_t v33 = *(void (**)(char *, uint64_t))(v23 + 8);
      v33(v31, v6);
      v33(v30, v6);
      (*(void (**)(char *, uint64_t))(v26 + 8))(v24, v9);
      char v29 = v32 ^ 1;
      return v29 & 1;
    }
    (*(void (**)(char *, uint64_t))(v23 + 8))(v30, v6);
    goto LABEL_6;
  }
  if (v28(v25, 1, v6) != 1)
  {
LABEL_6:
    (*(void (**)(char *, uint64_t))(v38 + 8))(v24, v39);
    char v29 = 1;
    return v29 & 1;
  }
  (*(void (**)(char *, uint64_t))(v26 + 8))(v24, v9);
  char v29 = 0;
  return v29 & 1;
}

uint64_t static _ConcreteDerivativeBox._zero.getter@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getAssociatedConformanceWitness();
  dispatch thunk of static AdditiveArithmetic.zero.getter();
  a2[3] = type metadata accessor for _ConcreteDerivativeBox();
  a2[4] = (uint64_t)&protocol witness table for _ConcreteDerivativeBox<A>;
  boxed_opaque_existential_1Tm = __swift_allocate_boxed_opaque_existential_1Tm(a2);
  return (*(uint64_t (**)(uint64_t *, char *, uint64_t))(v4 + 32))(boxed_opaque_existential_1Tm, v6, a1);
}

uint64_t _ConcreteDerivativeBox._adding(_:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = *(void *)(a2 + 16);
  uint64_t v8 = type metadata accessor for Optional();
  uint64_t v36 = *(void *)(v8 - 8);
  uint64_t v37 = v8;
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v32 - v10;
  uint64_t v12 = *(void *)(v7 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v9);
  uint64_t v15 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v32 - v16;
  unint64_t v18 = lazy protocol witness table accessor for type AnyDerivative.OpaqueZero and conformance AnyDerivative.OpaqueZero();
  _ConcreteDerivativeBox._unboxed<A>(to:)(v18, a2, (uint64_t)&type metadata for AnyDerivative.OpaqueZero, (uint64_t)v38);
  if ((v38[0] & 1) == 0) {
    return outlined init with copy of _AnyDerivativeBox((uint64_t)a1, a3);
  }
  uint64_t v33 = v12;
  uint64_t v34 = (uint64_t *)a3;
  uint64_t v35 = v3;
  uint64_t v20 = a1[3];
  uint64_t v19 = a1[4];
  __swift_project_boxed_opaque_existential_1Tm(a1, v20);
  (*(void (**)(void *__return_ptr, ValueMetadata *, ValueMetadata *, unint64_t, uint64_t, uint64_t))(v19 + 64))(v38, &type metadata for AnyDerivative.OpaqueZero, &type metadata for AnyDerivative.OpaqueZero, v18, v20, v19);
  if (v38[0])
  {
    uint64_t v21 = a1[4];
    __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
    uint64_t v22 = *(void (**)(uint64_t, uint64_t))(v21 + 64);
    uint64_t v32 = *(void *)(a2 + 24);
    v22(v7, v7);
    uint64_t v23 = v33;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v11, 1, v7) == 1)
    {
      (*(void (**)(char *, uint64_t))(v36 + 8))(v11, v37);
      uint64_t v30 = a1[3];
      uint64_t v31 = a1[4];
      __swift_project_boxed_opaque_existential_1Tm(a1, v30);
      (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v31 + 56))(v38, v30, v31);
      __swift_project_boxed_opaque_existential_1Tm(v38, v38[3]);
      swift_getDynamicType();
      _derivativeTypeMismatch(_:_:file:line:)();
    }
    uint64_t v24 = *(void (**)(char *, char *, uint64_t))(v23 + 32);
    v24(v17, v11, v7);
    swift_getAssociatedConformanceWitness();
    dispatch thunk of static AdditiveArithmetic.+ infix(_:_:)();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v17, v7);
    uint64_t v25 = v34;
    v34[3] = a2;
    v25[4] = (uint64_t)&protocol witness table for _ConcreteDerivativeBox<A>;
    boxed_opaque_existential_1Tm = __swift_allocate_boxed_opaque_existential_1Tm(v25);
    return ((uint64_t (*)(uint64_t *, char *, uint64_t))v24)(boxed_opaque_existential_1Tm, v15, v7);
  }
  else
  {
    uint64_t v28 = v34;
    v34[3] = a2;
    v28[4] = (uint64_t)&protocol witness table for _ConcreteDerivativeBox<A>;
    char v29 = __swift_allocate_boxed_opaque_existential_1Tm(v28);
    return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(v29, v35, a2);
  }
}

void *__swift_project_boxed_opaque_existential_1Tm(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t outlined init with copy of _AnyDerivativeBox(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t _ConcreteDerivativeBox._subtracting(_:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  void *(*v15)(void *__return_ptr, ValueMetadata *, ValueMetadata *, unint64_t, uint64_t, uint64_t);
  unint64_t v16;
  void *v17;
  uint64_t *v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  char *v21;
  uint64_t v22;
  void (*v23)(char *, char *, uint64_t);
  char *v24;
  char *v25;
  uint64_t *boxed_opaque_existential_1Tm;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void v33[2];
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  void v41[3];
  uint64_t v42;
  uint64_t v43;

  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = type metadata accessor for Optional();
  uint64_t v34 = *(void *)(v7 - 8);
  uint64_t v35 = v7;
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v38 = (char *)v33 - v9;
  uint64_t v39 = *(void *)(v6 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v37 = (char *)v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v36 = (char *)v33 - v12;
  uint64_t v14 = a1[3];
  uint64_t v13 = a1[4];
  __swift_project_boxed_opaque_existential_1Tm(a1, v14);
  uint64_t v15 = *(void *(**)(void *__return_ptr, ValueMetadata *, ValueMetadata *, unint64_t, uint64_t, uint64_t))(v13 + 64);
  uint64_t v16 = lazy protocol witness table accessor for type AnyDerivative.OpaqueZero and conformance AnyDerivative.OpaqueZero();
  uint64_t v17 = v15(v41, &type metadata for AnyDerivative.OpaqueZero, &type metadata for AnyDerivative.OpaqueZero, v16, v14, v13);
  if (v41[0])
  {
    unint64_t v18 = a3;
    _ConcreteDerivativeBox._unboxed<A>(to:)((uint64_t)v17, a2, (uint64_t)&type metadata for AnyDerivative.OpaqueZero, (uint64_t)v41);
    if (v41[0])
    {
      uint64_t v19 = a1[4];
      __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
      uint64_t v20 = *(void (**)(uint64_t, uint64_t))(v19 + 64);
      uint64_t v21 = v38;
      v33[1] = *(void *)(a2 + 24);
      v20(v6, v6);
      uint64_t v22 = v39;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v39 + 48))(v21, 1, v6) == 1)
      {
        (*(void (**)(char *, uint64_t))(v34 + 8))(v21, v35);
        uint64_t v31 = a1[3];
        uint64_t v32 = a1[4];
        __swift_project_boxed_opaque_existential_1Tm(a1, v31);
        (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v32 + 56))(v41, v31, v32);
        __swift_project_boxed_opaque_existential_1Tm(v41, v42);
        swift_getDynamicType();
        _derivativeTypeMismatch(_:_:file:line:)();
      }
      uint64_t v23 = *(void (**)(char *, char *, uint64_t))(v22 + 32);
      uint64_t v24 = v36;
      v23(v36, v21, v6);
      swift_getAssociatedConformanceWitness();
      uint64_t v25 = v37;
      dispatch thunk of static AdditiveArithmetic.- infix(_:_:)();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v24, v6);
      _OWORD v18[3] = a2;
      v18[4] = (uint64_t)&protocol witness table for _ConcreteDerivativeBox<A>;
      boxed_opaque_existential_1Tm = __swift_allocate_boxed_opaque_existential_1Tm(v18);
      return ((uint64_t (*)(uint64_t *, char *, uint64_t))v23)(boxed_opaque_existential_1Tm, v25, v6);
    }
    else
    {
      __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
      swift_getDynamicType();
      (*(void (**)(void *__return_ptr))(a1[4] + 24))(v41);
      char v29 = v42;
      uint64_t v30 = v43;
      __swift_project_boxed_opaque_existential_1Tm(v41, v42);
      (*(void (**)(void *, uint64_t, uint64_t))(v30 + 40))(a1, v29, v30);
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
    }
  }
  else
  {
    a3[3] = a2;
    a3[4] = (uint64_t)&protocol witness table for _ConcreteDerivativeBox<A>;
    uint64_t v28 = __swift_allocate_boxed_opaque_existential_1Tm(a3);
    return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(v28, v40, a2);
  }
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

void *_ConcreteDerivativeBox._move(by:)(void *a1, uint64_t a2)
{
  void *(*v13)(void *__return_ptr, ValueMetadata *, ValueMetadata *, unint64_t, uint64_t, uint64_t);
  unint64_t v14;
  void *result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void v24[4];

  uint64_t v23 = a2;
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = type metadata accessor for Optional();
  uint64_t v21 = *(void *)(v4 - 8);
  uint64_t v22 = v4;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v21 - v6;
  uint64_t v8 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = a1[3];
  uint64_t v11 = a1[4];
  __swift_project_boxed_opaque_existential_1Tm(a1, v12);
  uint64_t v13 = *(void *(**)(void *__return_ptr, ValueMetadata *, ValueMetadata *, unint64_t, uint64_t, uint64_t))(v11 + 64);
  uint64_t v14 = lazy protocol witness table accessor for type AnyDerivative.OpaqueZero and conformance AnyDerivative.OpaqueZero();
  unint64_t result = v13(v24, &type metadata for AnyDerivative.OpaqueZero, &type metadata for AnyDerivative.OpaqueZero, v14, v12, v11);
  if (LOBYTE(v24[0]) == 1)
  {
    uint64_t v16 = a1[3];
    uint64_t v17 = a1[4];
    __swift_project_boxed_opaque_existential_1Tm(a1, v16);
    unint64_t v18 = *(void *)(v23 + 24);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v17 + 64))(v3, v3, v18, v16, v17);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v7, 1, v3) == 1)
    {
      (*(void (**)(char *, uint64_t))(v21 + 8))(v7, v22);
      uint64_t v19 = a1[3];
      uint64_t v20 = a1[4];
      __swift_project_boxed_opaque_existential_1Tm(a1, v19);
      (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v20 + 56))(v24, v19, v20);
      __swift_project_boxed_opaque_existential_1Tm(v24, v24[3]);
      swift_getDynamicType();
      _derivativeTypeMismatch(_:_:file:line:)();
    }
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v7, v3);
    (*(void (**)(char *, uint64_t, uint64_t))(v18 + 32))(v10, v3, v18);
    return (void *)(*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v3);
  }
  return result;
}

uint64_t protocol witness for static _AnyDerivativeBox._zero.getter in conformance _ConcreteDerivativeBox<A>@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return static _ConcreteDerivativeBox._zero.getter(*(void *)(a1 + 16), a2);
}

uint64_t protocol witness for _AnyDerivativeBox._unboxed<A>(to:) in conformance _ConcreteDerivativeBox<A>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  return _ConcreteDerivativeBox._unboxed<A>(to:)(a1, a3, a2, a4);
}

uint64_t AnyDerivative._box.getter@<X0>(uint64_t a1@<X8>)
{
  return outlined init with copy of _AnyDerivativeBox(v1, a1);
}

uint64_t AnyDerivative._box.setter(long long *a1)
{
  __swift_destroy_boxed_opaque_existential_1(v1);

  return outlined init with take of _AnyDerivativeBox(a1, v1);
}

uint64_t outlined init with take of _AnyDerivativeBox(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t (*AnyDerivative._box.modify())()
{
  return _ConcreteDerivativeBox._base.modify;
}

uint64_t AnyDerivative.init(_box:)@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  return outlined init with take of _AnyDerivativeBox(a1, a2);
}

uint64_t (*static AnyDerivative._vjpInit<A>(_:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4))(void *a1)
{
  MEMORY[0x270FA5388](a1);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v9 + 16))(v8);
  AnyDerivative.init<A>(_:)((uint64_t)v8, a3, a1);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a3;
  *(void *)(v10 + 24) = a4;
  return partial apply for closure #1 in static AnyDerivative._vjpInit<A>(_:);
}

uint64_t closure #1 in static AnyDerivative._vjpInit<A>(_:)(void *a1)
{
  uint64_t v1 = a1[3];
  uint64_t v2 = a1[4];
  __swift_project_boxed_opaque_existential_1Tm(a1, v1);
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v2 + 56))(v4, v1, v2);
  return swift_dynamicCast();
}

uint64_t sub_222725ADC()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t partial apply for closure #1 in static AnyDerivative._vjpInit<A>(_:)(void *a1)
{
  return closure #1 in static AnyDerivative._vjpInit<A>(_:)(a1);
}

uint64_t (*reverse-mode derivative of AnyDerivative.init<A>(_:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4))(void *a1)
{
  return partial apply for closure #1 in static AnyDerivative._vjpInit<A>(_:);
}

uint64_t (*static AnyDerivative._jvpInit<A>(_:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4))@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  MEMORY[0x270FA5388](a1);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v9 + 16))(v8);
  AnyDerivative.init<A>(_:)((uint64_t)v8, a3, a1);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a3;
  *(void *)(v10 + 24) = a4;
  return partial apply for closure #1 in static AnyDerivative._jvpInit<A>(_:);
}

uint64_t closure #1 in static AnyDerivative._jvpInit<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  MEMORY[0x270FA5388](a1);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v7 + 16))(v6);
  return AnyDerivative.init<A>(_:)((uint64_t)v6, a2, a3);
}

uint64_t sub_222725D38()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t partial apply for closure #1 in static AnyDerivative._jvpInit<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return closure #1 in static AnyDerivative._jvpInit<A>(_:)(a1, *(void *)(v2 + 16), a2);
}

uint64_t (*forward-mode derivative of AnyDerivative.init<A>(_:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4))(uint64_t a1)
{
  static AnyDerivative._jvpInit<A>(_:)(a1, a2, a3, a4);
  uint64_t v8 = v7;
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a3 - 8) + 8))(a2, a3);
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = partial apply for closure #1 in static AnyDerivative._jvpInit<A>(_:);
  v9[5] = v8;
  return partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A) -> (@out AnyDerivative);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A) -> (@out AnyDerivative)(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 16);
  (*(void (**)(void))(v1 + 32))();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);

  return v4(a1, v3);
}

uint64_t static AnyDerivative.== infix(_:_:)(void *a1, uint64_t a2)
{
  uint64_t v3 = a1[3];
  uint64_t v4 = a1[4];
  __swift_project_boxed_opaque_existential_1Tm(a1, v3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 8))(a2, v3, v4) & 1;
}

uint64_t static AnyDerivative.!= infix(_:_:)(void *a1, uint64_t a2)
{
  uint64_t v3 = a1[3];
  uint64_t v4 = a1[4];
  __swift_project_boxed_opaque_existential_1Tm(a1, v3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(a2, v3, v4) & 1;
}

uint64_t static AnyDerivative.OpaqueZero.== infix(_:_:)()
{
  return 1;
}

uint64_t static AdditiveArithmetic.+= infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 - 8);
  uint64_t v6 = MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9(v6);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, a3);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(a1, v8, a3);
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance AnyDerivative.OpaqueZero()
{
  return 1;
}

uint64_t static AnyDerivative.zero.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ConcreteDerivativeBox<AnyDerivative.OpaqueZero>);
  *(void *)(a1 + 24) = result;
  *(void *)(a1 + 32) = &protocol witness table for _ConcreteDerivativeBox<A>;
  return result;
}

uint64_t static AnyDerivative.+ infix(_:_:)(void *a1, uint64_t a2)
{
  uint64_t v3 = a1[3];
  uint64_t v4 = a1[4];
  __swift_project_boxed_opaque_existential_1Tm(a1, v3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(a2, v3, v4);
}

uint64_t (*static AnyDerivative._vjpAdd(lhs:rhs:)(uint64_t a1, void *a2, uint64_t a3))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a2[3];
  uint64_t v5 = a2[4];
  __swift_project_boxed_opaque_existential_1Tm(a2, v4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(a3, v4, v5);
  return closure #1 in static AnyDerivative._vjpAdd(lhs:rhs:);
}

uint64_t closure #1 in static AnyDerivative._vjpAdd(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  outlined init with copy of AnyDerivative(a3, a1);

  return outlined init with copy of AnyDerivative(a3, a2);
}

uint64_t (*reverse-mode derivative of static AnyDerivative.+ infix(_:_:)(uint64_t a1, void *a2, uint64_t a3))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a2[3];
  uint64_t v5 = a2[4];
  __swift_project_boxed_opaque_existential_1Tm(a2, v4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(a3, v4, v5);
  return closure #1 in static AnyDerivative._vjpAdd(lhs:rhs:);
}

uint64_t (*static AnyDerivative._jvpAdd(lhs:rhs:)(uint64_t a1, void *a2, uint64_t a3))(void *a1, uint64_t a2)
{
  uint64_t v4 = a2[3];
  uint64_t v5 = a2[4];
  __swift_project_boxed_opaque_existential_1Tm(a2, v4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(a3, v4, v5);
  return closure #1 in static AnyDerivative._jvpAdd(lhs:rhs:);
}

uint64_t closure #1 in static AnyDerivative._jvpAdd(lhs:rhs:)(void *a1, uint64_t a2)
{
  uint64_t v3 = a1[3];
  uint64_t v4 = a1[4];
  __swift_project_boxed_opaque_existential_1Tm(a1, v3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(a2, v3, v4);
}

uint64_t (*forward-mode derivative of static AnyDerivative.+ infix(_:_:)(uint64_t a1, void *a2, uint64_t a3))(void *a1, uint64_t a2)
{
  uint64_t v4 = a2[3];
  uint64_t v5 = a2[4];
  __swift_project_boxed_opaque_existential_1Tm(a2, v4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(a3, v4, v5);
  return closure #1 in static AnyDerivative._jvpAdd(lhs:rhs:);
}

uint64_t static AnyDerivative.- infix(_:_:)(void *a1, uint64_t a2)
{
  uint64_t v3 = a1[3];
  uint64_t v4 = a1[4];
  __swift_project_boxed_opaque_existential_1Tm(a1, v3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 40))(a2, v3, v4);
}

uint64_t (*static AnyDerivative._vjpSubtract(lhs:rhs:)(uint64_t a1, void *a2, uint64_t a3))(uint64_t a1, uint64_t *a2, void *a3)
{
  uint64_t v4 = a2[3];
  uint64_t v5 = a2[4];
  __swift_project_boxed_opaque_existential_1Tm(a2, v4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 40))(a3, v4, v5);
  return closure #1 in static AnyDerivative._vjpSubtract(lhs:rhs:);
}

uint64_t closure #1 in static AnyDerivative._vjpSubtract(lhs:rhs:)(uint64_t a1, uint64_t *a2, void *a3)
{
  outlined init with copy of AnyDerivative((uint64_t)a3, a1);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ConcreteDerivativeBox<AnyDerivative.OpaqueZero>);
  _OWORD v7[3] = v5;
  v7[4] = &protocol witness table for _ConcreteDerivativeBox<A>;
  __swift_project_boxed_opaque_existential_1Tm(v7, v5);
  _ConcreteDerivativeBox._subtracting(_:)(a3, v5, a2);
  return outlined destroy of AnyDerivative((uint64_t)v7);
}

uint64_t (*reverse-mode derivative of static AnyDerivative.- infix(_:_:)(uint64_t a1, void *a2, uint64_t a3))(uint64_t a1, uint64_t *a2, void *a3)
{
  uint64_t v4 = a2[3];
  uint64_t v5 = a2[4];
  __swift_project_boxed_opaque_existential_1Tm(a2, v4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 40))(a3, v4, v5);
  return closure #1 in static AnyDerivative._vjpSubtract(lhs:rhs:);
}

uint64_t (*static AnyDerivative._jvpSubtract(lhs:rhs:)(uint64_t a1, void *a2, uint64_t a3))(void *a1, uint64_t a2)
{
  uint64_t v4 = a2[3];
  uint64_t v5 = a2[4];
  __swift_project_boxed_opaque_existential_1Tm(a2, v4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 40))(a3, v4, v5);
  return closure #1 in static AnyDerivative._jvpSubtract(lhs:rhs:);
}

uint64_t closure #1 in static AnyDerivative._jvpSubtract(lhs:rhs:)(void *a1, uint64_t a2)
{
  uint64_t v3 = a1[3];
  uint64_t v4 = a1[4];
  __swift_project_boxed_opaque_existential_1Tm(a1, v3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 40))(a2, v3, v4);
}

uint64_t (*forward-mode derivative of static AnyDerivative.- infix(_:_:)(uint64_t a1, void *a2, uint64_t a3))(void *a1, uint64_t a2)
{
  uint64_t v4 = a2[3];
  uint64_t v5 = a2[4];
  __swift_project_boxed_opaque_existential_1Tm(a2, v4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 40))(a3, v4, v5);
  return closure #1 in static AnyDerivative._jvpSubtract(lhs:rhs:);
}

uint64_t *AnyDerivative.move(by:)(uint64_t *a1)
{
  void (*v5)(uint64_t *__return_ptr, ValueMetadata *, ValueMetadata *, unint64_t, uint64_t, uint64_t);
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  uint64_t v3 = v1[3];
  uint64_t v4 = v1[4];
  __swift_project_boxed_opaque_existential_1Tm(v1, v3);
  uint64_t v5 = *(void (**)(uint64_t *__return_ptr, ValueMetadata *, ValueMetadata *, unint64_t, uint64_t, uint64_t))(v4 + 64);
  uint64_t v6 = lazy protocol witness table accessor for type AnyDerivative.OpaqueZero and conformance AnyDerivative.OpaqueZero();
  v5(&v10, &type metadata for AnyDerivative.OpaqueZero, &type metadata for AnyDerivative.OpaqueZero, v6, v3, v4);
  if ((v10 & 1) == 0) {
    return __swift_assign_boxed_opaque_existential_1(v1, a1);
  }
  uint64_t v7 = v1[3];
  uint64_t v8 = v1[4];
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v1, v7);
  return (uint64_t *)(*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a1, v7, v8);
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        uint64_t result = (uint64_t *)swift_release();
        *uint64_t v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

uint64_t *protocol witness for Differentiable.move(by:) in conformance AnyDerivative(uint64_t *a1)
{
  __swift_project_boxed_opaque_existential_1Tm(v1, v1[3]);
  if (_AnyDerivativeBox._isOpaqueZero()())
  {
    return __swift_assign_boxed_opaque_existential_1(v1, a1);
  }
  else
  {
    uint64_t v4 = v1[3];
    uint64_t v5 = v1[4];
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v1, v4);
    return (uint64_t *)(*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v5 + 48))(a1, v4, v5);
  }
}

uint64_t protocol witness for static AdditiveArithmetic.zero.getter in conformance AnyDerivative@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ConcreteDerivativeBox<AnyDerivative.OpaqueZero>);
  *(void *)(a1 + 24) = result;
  *(void *)(a1 + 32) = &protocol witness table for _ConcreteDerivativeBox<A>;
  return result;
}

double protocol witness for static AdditiveArithmetic.+= infix(_:_:) in conformance AnyDerivative(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v5 = *(void *)(a1 + 32);
  __swift_project_boxed_opaque_existential_1Tm((void *)a1, v4);
  (*(void (**)(_OWORD *__return_ptr, uint64_t, uint64_t, uint64_t))(v5 + 32))(v8, a2, v4, v5);
  outlined destroy of AnyDerivative(a1);
  double result = *(double *)v8;
  long long v7 = v8[1];
  *(_OWORD *)a1 = v8[0];
  *(_OWORD *)(a1 + 16) = v7;
  *(void *)(a1 + 32) = v9;
  return result;
}

double protocol witness for static AdditiveArithmetic.-= infix(_:_:) in conformance AnyDerivative(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v5 = *(void *)(a1 + 32);
  __swift_project_boxed_opaque_existential_1Tm((void *)a1, v4);
  (*(void (**)(_OWORD *__return_ptr, uint64_t, uint64_t, uint64_t))(v5 + 40))(v8, a2, v4, v5);
  outlined destroy of AnyDerivative(a1);
  double result = *(double *)v8;
  long long v7 = v8[1];
  *(_OWORD *)a1 = v8[0];
  *(_OWORD *)(a1 + 16) = v7;
  *(void *)(a1 + 32) = v9;
  return result;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance AnyDerivative(void *a1, uint64_t a2)
{
  uint64_t v3 = a1[3];
  uint64_t v4 = a1[4];
  __swift_project_boxed_opaque_existential_1Tm(a1, v3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 8))(a2, v3, v4) & 1;
}

uint64_t AnyDerivative.customMirror.getter()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[4];
  __swift_project_boxed_opaque_existential_1Tm(v0, v1);
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v2 + 56))(v4, v1, v2);
  return Mirror.init(reflecting:)();
}

uint64_t protocol witness for CustomReflectable.customMirror.getter in conformance AnyDerivative()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[4];
  __swift_project_boxed_opaque_existential_1Tm(v0, v1);
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v2 + 56))(v4, v1, v2);
  return Mirror.init(reflecting:)();
}

uint64_t Array<A>.DifferentiableView.base.getter()
{
  _ConcreteDerivativeBox._base.modify();

  return swift_bridgeObjectRetain();
}

uint64_t key path getter for Array<A>.DifferentiableView.base : <A>[A]<A>.DifferentiableView@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  *a4 = _ConcreteDerivativeBox._base.modify(*a1, *(void *)(a3 + a2 - 16), *(void *)(a3 + a2 - 8));

  return swift_bridgeObjectRetain();
}

uint64_t key path setter for Array<A>.DifferentiableView.base : <A>[A]<A>.DifferentiableView(uint64_t *a1)
{
  uint64_t v1 = *a1;
  swift_bridgeObjectRetain();
  uint64_t v2 = Array<A>.DifferentiableView.base.modify();
  *uint64_t v3 = v1;
  swift_bridgeObjectRelease();
  return ((uint64_t (*)(uint64_t *, void))v2)(&v5, 0);
}

uint64_t (*Array<A>.DifferentiableView.base.modify())()
{
  return _ConcreteDerivativeBox._base.modify;
}

uint64_t Array<A>.DifferentiableView.base.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v1 = a1;
  return result;
}

uint64_t Array<A>.DifferentiableView._vjpBase()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a2;
  *(void *)(v5 + 24) = a3;
  return swift_bridgeObjectRetain();
}

uint64_t reverse-mode derivative of Array<A>.DifferentiableView.base.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = Array<A>.DifferentiableView._vjpBase()(a1, a2, a3);
  uint64_t v7 = v6;
  uint64_t v8 = (void *)swift_allocObject();
  _OWORD v8[2] = a2;
  v8[3] = a3;
  v8[4] = partial apply for closure #1 in Array<A>.DifferentiableView._vjpBase();
  v8[5] = v7;
  return v5;
}

uint64_t Array<A>.DifferentiableView._jvpBase()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a2;
  *(void *)(v5 + 24) = a3;
  return swift_bridgeObjectRetain();
}

uint64_t forward-mode derivative of Array<A>.DifferentiableView.base.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = Array<A>.DifferentiableView._jvpBase()(a1, a2, a3);
  uint64_t v7 = v6;
  uint64_t v8 = (void *)swift_allocObject();
  _OWORD v8[2] = a2;
  v8[3] = a3;
  v8[4] = partial apply for closure #1 in Array<A>.DifferentiableView._jvpBase();
  v8[5] = v7;
  return v5;
}

uint64_t static Array<A>.DifferentiableView._vjpInit(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a2;
  *(void *)(v5 + 24) = a3;
  return swift_bridgeObjectRetain();
}

uint64_t reverse-mode derivative of Array<A>.DifferentiableView.init(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = static Array<A>.DifferentiableView._vjpInit(_:)(a1, a2, a3);
  uint64_t v7 = v6;
  swift_bridgeObjectRelease();
  uint64_t v8 = (void *)swift_allocObject();
  _OWORD v8[2] = a2;
  v8[3] = a3;
  v8[4] = partial apply for closure #1 in Array<A>.DifferentiableView._vjpBase();
  v8[5] = v7;
  return v5;
}

uint64_t static Array<A>.DifferentiableView._jvpInit(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a2;
  *(void *)(v5 + 24) = a3;
  return swift_bridgeObjectRetain();
}

uint64_t forward-mode derivative of Array<A>.DifferentiableView.init(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = static Array<A>.DifferentiableView._jvpInit(_:)(a1, a2, a3);
  uint64_t v7 = v6;
  swift_bridgeObjectRelease();
  uint64_t v8 = (void *)swift_allocObject();
  _OWORD v8[2] = a2;
  v8[3] = a3;
  v8[4] = partial apply for closure #1 in Array<A>.DifferentiableView._vjpBase();
  v8[5] = v7;
  return v5;
}

uint64_t Array<A>.DifferentiableView.move(by:)(int64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v25 = *(void *)(a2 + 24);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v7 = (char *)v24 - v6;
  int64_t v28 = a1;
  type metadata accessor for Array();
  int64_t v26 = a1;
  swift_bridgeObjectRetain();
  swift_getWitnessTable();
  if (Collection.isEmpty.getter()) {
    return swift_bridgeObjectRelease();
  }
  uint64_t v8 = swift_bridgeObjectRetain();
  uint64_t v9 = MEMORY[0x223C9BB00](v8, v3);
  swift_bridgeObjectRelease();
  uint64_t v10 = v26;
  uint64_t v11 = MEMORY[0x223C9BB00](v26, AssociatedTypeWitness);
  if (v9 == v11)
  {
    uint64_t v27 = v10;
    swift_getWitnessTable();
    RandomAccessCollection<>.indices.getter();
    Swift::Int v12 = v28;
    int64_t v13 = v29;
    if (v28 != v29)
    {
      v24[1] = v25 + 32;
      uint64_t v14 = (void (**)(char *, uint64_t))(v5 + 8);
      if (v29 <= v28) {
        int64_t v15 = v28;
      }
      else {
        int64_t v15 = v29;
      }
      while (v15 != v12)
      {
        Array.subscript.getter();
        type metadata accessor for Array();
        Array._makeMutableAndUnique()();
        Array._checkSubscript_mutating(_:)(v12);
        _swift_isClassOrObjCExistentialType();
        (*(void (**)(char *, uint64_t))(v25 + 32))(v7, v3);
        (*v14)(v7, AssociatedTypeWitness);
        if (v13 == ++v12) {
          return swift_bridgeObjectRelease();
        }
      }
      uint64_t v11 = _fatalErrorMessage(_:_:file:line:flags:)();
      __break(1u);
      goto LABEL_11;
    }
    return swift_bridgeObjectRelease();
  }
LABEL_11:
  uint64_t v17 = v11;
  swift_bridgeObjectRelease();
  int64_t v28 = 0;
  int64_t v29 = 0xE000000000000000;
  _StringGuts.grow(_:)(48);
  swift_bridgeObjectRelease();
  int64_t v28 = 0xD000000000000010;
  int64_t v29 = 0x8000000222758980;
  uint64_t v18 = swift_bridgeObjectRetain();
  uint64_t v19 = MEMORY[0x223C9BB00](v18, v3);
  swift_bridgeObjectRelease();
  uint64_t v27 = v19;
  v20._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v20);
  swift_bridgeObjectRelease();
  v21._countAndFlagsBits = 0x27666C6573272820;
  v21._object = (void *)0xEE0020646E612029;
  String.append(_:)(v21);
  uint64_t v27 = v17;
  v22._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v22);
  swift_bridgeObjectRelease();
  v23._countAndFlagsBits = 0x6365726964272820;
  v23._object = (void *)0xEE0029276E6F6974;
  String.append(_:)(v23);
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t protocol witness for Differentiable.move(by:) in conformance [A]<A>.DifferentiableView(int64_t *a1, uint64_t a2)
{
  return Array<A>.DifferentiableView.move(by:)(*a1, a2);
}

uint64_t static Array<A>.DifferentiableView<>.== infix(_:_:)()
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v0 = static Array<A>.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0 & 1;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance <> [A]<A>.DifferentiableView()
{
  return static Array<A>.DifferentiableView<>.== infix(_:_:)();
}

uint64_t protocol witness for ExpressibleByArrayLiteral.init(arrayLiteral:) in conformance [A]<A>.DifferentiableView@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t Array<A>.DifferentiableView.description.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = swift_bridgeObjectRetain();
  uint64_t v4 = MEMORY[0x223C9BA70](v3, a2);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance [A]<A>.DifferentiableView(uint64_t a1)
{
  return Array<A>.DifferentiableView.description.getter(*v1, *(void *)(a1 + 16));
}

uint64_t Array<A>.DifferentiableView.customMirror.getter()
{
  swift_bridgeObjectRetain();
  Array.customMirror.getter();

  return swift_bridgeObjectRelease();
}

uint64_t protocol witness for CustomReflectable.customMirror.getter in conformance [A]<A>.DifferentiableView()
{
  return Array<A>.DifferentiableView.customMirror.getter();
}

uint64_t static Array<A>.DifferentiableView<>.zero.getter()
{
  return static Array._allocateUninitialized(_:)();
}

uint64_t static Array<A>.DifferentiableView<>.+ infix(_:_:)(uint64_t a1, uint64_t a2, char *a3, uint64_t a4, uint64_t a5)
{
  return static Array<A>.DifferentiableView<>.+ infix(_:_:)(a1, a2, a3, a4, a5, 140, (uint64_t)&unk_26D4DFDE8, (uint64_t)partial apply for implicit closure #3 in static Array<A>.DifferentiableView<>.+ infix(_:_:), (void (*)(char *, char *))partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A, @in_guaranteed A) -> (@out A));
}

uint64_t _sSTsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v46 = a8;
  uint64_t v47 = a5;
  uint64_t v9 = v8;
  uint64_t v60 = a2;
  v61 = a4;
  v59 = a1;
  uint64_t v45 = *(void *)(a5 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](a1);
  v57 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  v56 = (char *)&v42 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  MEMORY[0x270FA5388](v14);
  v44 = (char *)&v42 - v15;
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v21 = type metadata accessor for Optional();
  uint64_t v48 = *(void *)(v21 - 8);
  uint64_t v49 = v21;
  uint64_t v22 = MEMORY[0x270FA5388](v21);
  uint64_t v24 = (char *)&v42 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = MEMORY[0x270FA5388](v22);
  v50 = (char *)&v42 - v26;
  uint64_t v54 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  v43 = (char *)&v42 - v28;
  v55 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v19 - 8);
  MEMORY[0x270FA5388](v27);
  uint64_t v30 = (char *)&v42 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = v17;
  uint64_t v62 = swift_getAssociatedTypeWitness();
  uint64_t v53 = *(void *)(v62 - 8);
  MEMORY[0x270FA5388](v62);
  uint64_t v32 = (char *)&v42 - v31;
  Swift::Int v33 = dispatch thunk of Sequence.underestimatedCount.getter();
  uint64_t v63 = MEMORY[0x223C9BD40](v61);
  uint64_t v58 = type metadata accessor for ContiguousArray();
  ContiguousArray.reserveCapacity(_:)(v33);
  (*((void (**)(char *, uint64_t, uint64_t))v55 + 2))(v30, v51, v19);
  v61 = v32;
  dispatch thunk of Sequence.makeIterator()();
  if (v33 < 0)
  {
    while (1)
    {
LABEL_14:
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
  }
  swift_getAssociatedConformanceWitness();
  if (v33)
  {
    uint64_t v34 = (unsigned int (**)(char *, uint64_t, uint64_t))(v54 + 48);
    uint64_t v35 = (void (**)(char *, uint64_t))(v54 + 8);
    while (1)
    {
      dispatch thunk of IteratorProtocol.next()();
      if ((*v34)(v24, 1, AssociatedTypeWitness) == 1) {
        goto LABEL_14;
      }
      v59(v24, v57);
      if (v9) {
        break;
      }
      uint64_t v9 = 0;
      (*v35)(v24, AssociatedTypeWitness);
      ContiguousArray.append(_:)();
      if (!--v33) {
        goto LABEL_7;
      }
    }
    (*(void (**)(char *, uint64_t))(v53 + 8))(v61, v62);
    swift_release();
    (*(void (**)(uint64_t, char *, uint64_t))(v45 + 32))(v46, v57, v47);
    return ((uint64_t (*)(char *, uint64_t))*v35)(v24, AssociatedTypeWitness);
  }
  else
  {
LABEL_7:
    uint64_t v36 = v50;
    dispatch thunk of IteratorProtocol.next()();
    uint64_t v37 = v54;
    uint64_t v38 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v54 + 48);
    v57 = (char *)(v54 + 48);
    v55 = v38;
    if (v38(v36, 1, AssociatedTypeWitness) == 1)
    {
LABEL_11:
      (*(void (**)(char *, uint64_t))(v53 + 8))(v61, v62);
      (*(void (**)(char *, uint64_t))(v48 + 8))(v36, v49);
      return v63;
    }
    else
    {
      uint64_t v54 = *(void *)(v37 + 32);
      uint64_t v39 = (void (**)(char *, uint64_t))(v37 + 8);
      uint64_t v40 = v43;
      while (1)
      {
        ((void (*)(char *, char *, uint64_t))v54)(v40, v36, AssociatedTypeWitness);
        v59(v40, v56);
        if (v9) {
          break;
        }
        uint64_t v9 = 0;
        (*v39)(v40, AssociatedTypeWitness);
        ContiguousArray.append(_:)();
        dispatch thunk of IteratorProtocol.next()();
        if (v55(v36, 1, AssociatedTypeWitness) == 1) {
          goto LABEL_11;
        }
      }
      (*v39)(v40, AssociatedTypeWitness);
      (*(void (**)(char *, uint64_t))(v53 + 8))(v61, v62);
      swift_release();
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v45 + 32))(v46, v56, v47);
    }
  }
}

uint64_t static Array<A>.DifferentiableView<>.- infix(_:_:)(uint64_t a1, uint64_t a2, char *a3, uint64_t a4, uint64_t a5)
{
  return static Array<A>.DifferentiableView<>.+ infix(_:_:)(a1, a2, a3, a4, a5, 156, (uint64_t)&unk_26D4DFE10, (uint64_t)partial apply for implicit closure #3 in static Array<A>.DifferentiableView<>.- infix(_:_:), (void (*)(char *, char *))partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A, @in_guaranteed A) -> (@out A));
}

uint64_t static Array<A>.DifferentiableView<>.+ infix(_:_:)(uint64_t a1, uint64_t a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void (*a9)(char *, char *))
{
  uint64_t v15 = swift_bridgeObjectRetain();
  uint64_t v16 = MEMORY[0x223C9BB00](v15, a3);
  if (!v16)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    return a2;
  }
  uint64_t v17 = v16;
  uint64_t v18 = swift_bridgeObjectRetain();
  uint64_t v19 = MEMORY[0x223C9BB00](v18, a3);
  if (!v19)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    return a1;
  }
  if (v17 == v19)
  {
    uint64_t v32 = a1;
    uint64_t v20 = type metadata accessor for Array();
    uint64_t WitnessTable = swift_getWitnessTable();
    zip<A, B>(_:_:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    long long v36 = v37;
    uint64_t v22 = (void *)swift_allocObject();
    uint64_t v31 = (uint64_t)&v31;
    v22[2] = a3;
    _OWORD v22[3] = a4;
    void v22[4] = a5;
    v22[5] = a3;
    void v30[2] = a3;
    v30[3] = a4;
    v30[4] = a5;
    v30[5] = a8;
    v30[6] = MEMORY[0x270FA5388](v22);
    uint64_t v32 = v20;
    uint64_t v33 = v20;
    uint64_t v34 = WitnessTable;
    uint64_t v35 = WitnessTable;
    uint64_t v23 = type metadata accessor for Zip2Sequence();
    uint64_t v24 = swift_getWitnessTable();
    a2 = _sSTsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF(a9, (uint64_t)v30, v23, a3, MEMORY[0x263F8E628], v24, MEMORY[0x263F8E658], v25);
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return a2;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  _StringGuts.grow(_:)(25);
  swift_bridgeObjectRelease();
  v27._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v27);
  swift_bridgeObjectRelease();
  v28._countAndFlagsBits = 0x20646E6120;
  v28._object = (void *)0xE500000000000000;
  String.append(_:)(v28);
  v29._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v29);
  swift_bridgeObjectRelease();
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t Array<A>.DifferentiableView<>.subscript.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_bridgeObjectRetain();
  if (MEMORY[0x223C9BB00](a2, a3) <= a1)
  {
    swift_bridgeObjectRelease();
    return dispatch thunk of static AdditiveArithmetic.zero.getter();
  }
  else
  {
    Array.subscript.getter();
    return swift_bridgeObjectRelease();
  }
}

uint64_t protocol witness for static AdditiveArithmetic.zero.getter in conformance <> [A]<A>.DifferentiableView@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static Array<A>.DifferentiableView<>.zero.getter();
  *a1 = result;
  return result;
}

uint64_t protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> [A]<A>.DifferentiableView@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  return protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> [A]<A>.DifferentiableView(a1, a2, a3, a4, (uint64_t (*)(void, void, void, void, void))static Array<A>.DifferentiableView<>.+ infix(_:_:), a5);
}

uint64_t protocol witness for static AdditiveArithmetic.+= infix(_:_:) in conformance <> [A]<A>.DifferentiableView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return static AdditiveArithmetic.+= infix(_:_:)(a1, a2, a3);
}

uint64_t protocol witness for static AdditiveArithmetic.- infix(_:_:) in conformance <> [A]<A>.DifferentiableView@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  return protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> [A]<A>.DifferentiableView(a1, a2, a3, a4, (uint64_t (*)(void, void, void, void, void))static Array<A>.DifferentiableView<>.- infix(_:_:), a5);
}

uint64_t protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> [A]<A>.DifferentiableView@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t (*a5)(void, void, void, void, void)@<X4>, uint64_t *a6@<X8>)
{
  uint64_t result = a5(*a1, *a2, *(void *)(a3 + 16), *(void *)(a4 - 8), *(void *)(a3 + 24));
  *a6 = result;
  return result;
}

uint64_t protocol witness for static AdditiveArithmetic.-= infix(_:_:) in conformance <> [A]<A>.DifferentiableView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return static AdditiveArithmetic.+= infix(_:_:)(a1, a2, a3);
}

uint64_t Array<A>.move(by:)(int64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v3 = type metadata accessor for Array<A>.DifferentiableView();
  uint64_t result = Array<A>.DifferentiableView.move(by:)(a1, v3);
  *uint64_t v1 = v5;
  return result;
}

uint64_t protocol witness for Differentiable.move(by:) in conformance <A> [A](int64_t *a1)
{
  return Array<A>.move(by:)(*a1);
}

uint64_t (*Array<A>._vjpSubscript(index:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t a1)
{
  Array.subscript.getter();
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = a4;
  v9[3] = a5;
  v9[4] = a3;
  v9[5] = a2;
  swift_bridgeObjectRetain();
  return partial apply for pullback #1 <A>(_:) in Array<A>._vjpSubscript(index:);
}

uint64_t pullback #1 <A>(_:) in Array<A>._vjpSubscript(index:)(uint64_t a1, uint64_t a2, Swift::Int a3, uint64_t a4)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v9 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v11 = (char *)&v18 - v10;
  swift_getAssociatedConformanceWitness();
  dispatch thunk of static AdditiveArithmetic.zero.getter();
  uint64_t v12 = MEMORY[0x223C9BB00](a2, a4);
  uint64_t v13 = specialized Array.init(repeating:count:)((uint64_t)v11, v12, AssociatedTypeWitness);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, AssociatedTypeWitness);
  uint64_t v19 = v13;
  type metadata accessor for Array();
  Array._makeMutableAndUnique()();
  uint64_t v14 = v19;
  Array._checkSubscript_mutating(_:)(a3);
  char isClassOrObjCExistentialType = _swift_isClassOrObjCExistentialType();
  uint64_t v16 = v14 & 0xFFFFFFFFFFFFFF8;
  if ((isClassOrObjCExistentialType & 1) == 0) {
    uint64_t v16 = v14;
  }
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v9 + 24))(v16+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(void *)(v9 + 72) * a3, a1, AssociatedTypeWitness);
  return v19;
}

uint64_t (*reverse-mode derivative of Array.subscript.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  Array<A>._vjpSubscript(index:)(a1, a2, a3, a4, a5);
  uint64_t v8 = v7;
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = a4;
  v9[3] = a5;
  v9[4] = partial apply for pullback #1 <A>(_:) in Array<A>._vjpSubscript(index:);
  v9[5] = v8;
  return partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A.Differentiable.TangentVector) -> (@owned [A.Differentiable.TangentVector]<A>.DifferentiableView);
}

uint64_t (*Array<A>._jvpSubscript(index:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t a1)
{
  Array.subscript.getter();
  uint64_t v8 = (void *)swift_allocObject();
  _OWORD v8[2] = a4;
  v8[3] = a5;
  v8[4] = a2;
  return partial apply for differential #1 <A>(_:) in Array<A>._jvpSubscript(index:);
}

uint64_t (*forward-mode derivative of Array.subscript.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  Array<A>._jvpSubscript(index:)(a1, a2, a3, a4, a5);
  uint64_t v8 = v7;
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = a4;
  v9[3] = a5;
  v9[4] = partial apply for differential #1 <A>(_:) in Array<A>._jvpSubscript(index:);
  v9[5] = v8;
  return partial apply for thunk for @escaping @callee_guaranteed (@guaranteed [A.Differentiable.TangentVector]<A>.DifferentiableView) -> (@out A.Differentiable.TangentVector);
}

uint64_t static Array<A>._vjpConcatenate(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = static Array.+ infix(_:_:)();
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = a1;
  v9[5] = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v8;
}

uint64_t reverse-mode derivative of static Array.+ infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = static Array<A>._vjpConcatenate(_:_:)(a1, a2, a3, a4);
  uint64_t v8 = v7;
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = partial apply for pullback #1 <A>(_:) in static Array<A>._vjpConcatenate(_:_:);
  v9[5] = v8;
  return v6;
}

uint64_t static Array<A>._jvpConcatenate(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = static Array.+ infix(_:_:)();
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = a1;
  v9[5] = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v8;
}

uint64_t forward-mode derivative of static Array.+ infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = static Array<A>._jvpConcatenate(_:_:)(a1, a2, a3, a4);
  uint64_t v8 = v7;
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = partial apply for differential #1 <A>(_:_:) in static Array<A>._jvpConcatenate(_:_:);
  v9[5] = v8;
  return v6;
}

uint64_t (*Array<A>._vjpAppend(_:)(uint64_t a1, uint64_t a2, uint64_t a3))()
{
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x223C9BB00](*v3, v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  Array.append(_:)();
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = v6;
  _OWORD v11[3] = a3;
  v11[4] = v10;
  return partial apply for closure #1 in Array<A>._vjpAppend(_:);
}

uint64_t $defer #1 <A>() in closure #1 in Array<A>._vjpAppend(_:)()
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v1 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v3 = (char *)&v5 - v2;
  type metadata accessor for Array();
  swift_getWitnessTable();
  swift_getWitnessTable();
  RangeReplaceableCollection<>.removeLast()();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, AssociatedTypeWitness);
}

uint64_t (*reverse-mode derivative of Array.append(_:)(uint64_t a1, uint64_t a2, uint64_t a3))()
{
  Array<A>._vjpAppend(_:)(a1, a2, a3);
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(a2 + 16);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(a1, v8);
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = v8;
  v9[3] = a3;
  v9[4] = partial apply for closure #1 in Array<A>._vjpAppend(_:);
  v9[5] = v7;
  return partial apply for autodiff self-reordering reabstraction thunk for @escaping @callee_guaranteed (@inout [A.Differentiable.TangentVector]<A>.DifferentiableView) -> (@out A.Differentiable.TangentVector);
}

uint64_t (*Array<A>._jvpAppend(_:)(uint64_t a1, uint64_t a2, uint64_t a3))(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 16);
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *))(v6 + 16))((char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  Array.append(_:)();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v4;
  *(void *)(v7 + 24) = a3;
  return partial apply for closure #1 in Array<A>._jvpAppend(_:);
}

uint64_t closure #1 in Array<A>._jvpAppend(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v7 - v4, a2, AssociatedTypeWitness);
  type metadata accessor for Array();
  return Array.append(_:)();
}

uint64_t (*forward-mode derivative of Array.append(_:)(uint64_t a1, uint64_t a2, uint64_t a3))(uint64_t a1, uint64_t a2)
{
  Array<A>._jvpAppend(_:)(a1, a2, a3);
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(a2 + 16);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(a1, v8);
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = v8;
  v9[3] = a3;
  v9[4] = partial apply for closure #1 in Array<A>._jvpAppend(_:);
  v9[5] = v7;
  return partial apply for autodiff self-reordering reabstraction thunk for @escaping @callee_guaranteed (@in A.Differentiable.TangentVector, @inout [A.Differentiable.TangentVector]<A>.DifferentiableView) -> ();
}

uint64_t (*static Array<A>._vjpAppend(_:_:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4))()
{
  uint64_t v6 = MEMORY[0x223C9BB00](*a1, a3);
  static Array.+= infix(_:_:)();
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = a3;
  _OWORD v7[3] = a4;
  v7[4] = v6;
  return partial apply for closure #1 in static Array<A>._vjpAppend(_:_:);
}

uint64_t (*reverse-mode derivative of static Array.+= infix(_:_:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4))()
{
  static Array<A>._vjpAppend(_:_:)(a1, a2, a3, a4);
  uint64_t v7 = v6;
  uint64_t v8 = (void *)swift_allocObject();
  _OWORD v8[2] = a3;
  v8[3] = a4;
  v8[4] = partial apply for closure #1 in static Array<A>._vjpAppend(_:_:);
  v8[5] = v7;
  return partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A.Differentiable.TangentVector) -> (@owned [A.Differentiable.TangentVector]<A>.DifferentiableView);
}

uint64_t (*static Array<A>._jvpAppend(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4))()
{
  static Array.+= infix(_:_:)();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a3;
  *(void *)(v6 + 24) = a4;
  return partial apply for closure #1 in static Array<A>._jvpAppend(_:_:);
}

uint64_t (*forward-mode derivative of static Array.+= infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4))()
{
  static Array<A>._jvpAppend(_:_:)(a1, a2, a3, a4);
  uint64_t v7 = v6;
  uint64_t v8 = (void *)swift_allocObject();
  _OWORD v8[2] = a3;
  v8[3] = a4;
  v8[4] = partial apply for closure #1 in static Array<A>._jvpAppend(_:_:);
  v8[5] = v7;
  return partial apply for thunk for @escaping @callee_guaranteed (@inout [A.Differentiable.TangentVector]<A>.DifferentiableView, @guaranteed [A.Differentiable.TangentVector]<A>.DifferentiableView) -> ();
}

uint64_t static Array<A>._vjpInit(repeating:count:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = specialized Array.init(repeating:count:)(a1, a2, a3);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a3;
  *(void *)(v7 + 24) = a4;
  return v6;
}

uint64_t closure #1 in static Array<A>._vjpInit(repeating:count:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v9 = &v11[-v8];
  uint64_t v15 = a1;
  swift_getAssociatedConformanceWitness();
  swift_bridgeObjectRetain();
  dispatch thunk of static AdditiveArithmetic.zero.getter();
  uint64_t v12 = a2;
  uint64_t v13 = a3;
  uint64_t v14 = AssociatedTypeWitness;
  type metadata accessor for Array();
  swift_getWitnessTable();
  Sequence.reduce<A>(_:_:)();
  (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v9, AssociatedTypeWitness);
  return swift_bridgeObjectRelease();
}

uint64_t reverse-mode derivative of Array.init(repeating:count:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = static Array<A>._vjpInit(repeating:count:)(a1, a2, a3, a4);
  uint64_t v9 = v8;
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a3 - 8) + 8))(a1, a3);
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = a3;
  v10[3] = a4;
  v10[4] = partial apply for closure #1 in static Array<A>._vjpInit(repeating:count:);
  v10[5] = v9;
  return v7;
}

uint64_t static Array<A>._jvpInit(repeating:count:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = specialized Array.init(repeating:count:)(a1, a2, a3);
  uint64_t v8 = (void *)swift_allocObject();
  _OWORD v8[2] = a3;
  v8[3] = a4;
  v8[4] = a2;
  return v7;
}

uint64_t forward-mode derivative of Array.init(repeating:count:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = static Array<A>._jvpInit(repeating:count:)(a1, a2, a3, a4);
  uint64_t v9 = v8;
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a3 - 8) + 8))(a1, a3);
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = a3;
  v10[3] = a4;
  v10[4] = partial apply for closure #1 in static Array<A>._jvpInit(repeating:count:);
  v10[5] = v9;
  return v7;
}

uint64_t Array<A>.differentiableMap<A>(_:)(long long *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v13 = a2;
  v11[2] = a3;
  _OWORD v11[3] = a4;
  v11[4] = a5;
  v11[5] = a6;
  long long v12 = *a1;
  uint64_t v7 = type metadata accessor for Array();
  uint64_t WitnessTable = swift_getWitnessTable();
  return _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF((void (*)(char *, char *))partial apply for thunk for @callee_guaranteed (@in_guaranteed A) -> (@out A1), (uint64_t)v11, v7, a4, MEMORY[0x263F8E628], WitnessTable, MEMORY[0x263F8E658], v9);
}

uint64_t _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v37 = a5;
  uint64_t v38 = a8;
  v44 = a1;
  uint64_t v45 = a2;
  uint64_t v36 = *(void *)(a5 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v46 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v47 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v12 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v39 = (char *)&v32 - v13;
  uint64_t v14 = a4;
  MEMORY[0x270FA5388](v12);
  uint64_t v40 = (char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = swift_getAssociatedTypeWitness();
  uint64_t v41 = *(void *)(v16 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  uint64_t v35 = (char *)&v32 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v32 - v19;
  uint64_t v21 = dispatch thunk of Collection.count.getter();
  if (!v21) {
    return static Array._allocateUninitialized(_:)();
  }
  Swift::Int v22 = v21;
  uint64_t v34 = v16;
  uint64_t v50 = MEMORY[0x223C9BD40](v14);
  uint64_t v42 = type metadata accessor for ContiguousArray();
  ContiguousArray.reserveCapacity(_:)(v22);
  uint64_t v33 = v20;
  dispatch thunk of Collection.startIndex.getter();
  if (v22 < 0)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v23 = (void (**)(char *))(v47 + 16);
    v43 = (void (**)(char *, uint64_t))(v47 + 8);
    uint64_t v47 = a6;
    uint64_t v24 = v39;
    uint64_t v25 = v33;
    while (1)
    {
      uint64_t v26 = (void (*)(char *, void))dispatch thunk of Collection.subscript.read();
      (*v23)(v24);
      v26(v49, 0);
      uint64_t v27 = v48;
      v44(v24, v46);
      if (v27) {
        break;
      }
      uint64_t v48 = 0;
      (*v43)(v24, AssociatedTypeWitness);
      ContiguousArray.append(_:)();
      dispatch thunk of Collection.formIndex(after:)();
      if (!--v22)
      {
        uint64_t v28 = v41;
        uint64_t v29 = v34;
        uint64_t v30 = v35;
        (*(void (**)(char *, char *, uint64_t))(v41 + 32))(v35, v25, v34);
        _expectEnd<A>(of:is:)();
        (*(void (**)(char *, uint64_t))(v28 + 8))(v30, v29);
        return v50;
      }
    }
    (*v43)(v24, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v41 + 8))(v25, v34);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v36 + 32))(v38, v46, v37);
  }
  return result;
}

uint64_t Array<A>._vjpDifferentiableMap<A>(_:)(long long *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  long long v11 = *a1;
  long long v43 = a1[1];
  long long v44 = v11;
  long long v42 = a1[2];
  uint64_t v12 = MEMORY[0x270FA5388](a1);
  uint64_t v41 = (char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v12);
  uint64_t v45 = (char *)&v34 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v34 - v18;
  uint64_t v39 = (void (**)(void, void, void))static Array._allocateUninitialized(_:)();
  uint64_t v50 = v39;
  swift_getAssociatedTypeWitness();
  uint64_t v46 = a4;
  swift_getAssociatedTypeWitness();
  FunctionTypeMetadata1 = swift_getFunctionTypeMetadata1();
  uint64_t v20 = static Array._allocateUninitialized(_:)();
  uint64_t v49 = v20;
  if (MEMORY[0x223C9BB20](a2, a3))
  {
    uint64_t v35 = a5;
    uint64_t v36 = a6;
    uint64_t v21 = 0;
    uint64_t v39 = (void (**)(void, void, void))(v15 + 16);
    uint64_t v38 = (void (**)(char *, char *, uint64_t))(v15 + 32);
    uint64_t v37 = (void (**)(char *, uint64_t))(v15 + 8);
    uint64_t v22 = (uint64_t)v41;
    while (1)
    {
      Swift::Bool IsNativeType = Array._hoistableIsNativeTypeChecked()();
      Array._checkSubscript(_:wasNativeTypeChecked:)();
      if (IsNativeType)
      {
        uint64_t v24 = v45;
        (*(void (**)(char *, unint64_t, uint64_t))(v15 + 16))(v45, a2+ ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80))+ *(void *)(v15 + 72) * v21, a3);
      }
      else
      {
        uint64_t v30 = _ArrayBuffer._getElementSlowPath(_:)();
        uint64_t v24 = v45;
        if (v34 != 8) {
          goto LABEL_12;
        }
        v47[0] = v30;
        (*v39)(v45, v47, a3);
        swift_unknownObjectRelease();
      }
      (*v38)(v19, v24, a3);
      uint64_t v26 = v21 + 1;
      if (__OFADD__(v21, 1)) {
        break;
      }
      v48[0] = v44;
      v48[1] = v43;
      v48[2] = v42;
      uint64_t v27 = valueWithPullback<A, B>(at:of:)(v22, (uint64_t)v19, (uint64_t)v48, v25, v46);
      uint64_t v29 = v28;
      (*v37)(v19, a3);
      type metadata accessor for Array();
      Array.append(_:)();
      v47[0] = v27;
      v47[1] = v29;
      type metadata accessor for Array();
      Array.append(_:)();
      ++v21;
      if (v26 == MEMORY[0x223C9BB20](a2, a3))
      {
        uint64_t v20 = v49;
        uint64_t v39 = v50;
        a6 = v36;
        a5 = v35;
        goto LABEL_10;
      }
    }
    __break(1u);
LABEL_12:
    swift_unknownObjectRelease();
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
LABEL_10:
    uint64_t v31 = (void *)swift_allocObject();
    uint64_t v32 = v46;
    v31[2] = a3;
    _OWORD v31[3] = v32;
    v31[4] = a5;
    v31[5] = a6;
    v31[6] = v20;
    return (uint64_t)v39;
  }
  return result;
}

uint64_t specialized pullback #1 <A><A1>(_:) in Array<A>._vjpDifferentiableMap<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  swift_getAssociatedTypeWitness();
  uint64_t v10 = type metadata accessor for Array();
  swift_getAssociatedTypeWitness();
  swift_getFunctionTypeMetadata1();
  uint64_t v11 = type metadata accessor for Array();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v13 = swift_getWitnessTable();
  zip<A, B>(_:_:)();
  long long v30 = v31;
  uint64_t v22 = a3;
  uint64_t v23 = a4;
  uint64_t v24 = a5;
  uint64_t v25 = a6;
  v20[2] = a3;
  v20[3] = a4;
  v20[4] = a5;
  v20[5] = a6;
  v20[6] = partial apply for closure #1 in pullback #1 <A><A1>(_:) in Array<A>._vjpDifferentiableMap<A>(_:);
  v20[7] = &v21;
  uint64_t v26 = v10;
  uint64_t v27 = v11;
  uint64_t v28 = WitnessTable;
  uint64_t v29 = v13;
  uint64_t v14 = type metadata accessor for Zip2Sequence();
  uint64_t v15 = (char *)swift_checkMetadataState();
  uint64_t v16 = swift_getWitnessTable();
  uint64_t v18 = _sSTsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF((void (*)(char *, char *))_s13TangentVector16_Differentiation14DifferentiablePQyd__xq_Ri_zRi0_zRi__Ri0__r0_lyAeaDQzIsegnr_AFIgngr_AE_xq_Ri_zRi0_zRi__Ri0__r0_lyAeFIsegnr_tAFs5NeverOIegnrzr_AbCRzAbCRd__r__lTRTA, (uint64_t)v20, v14, v15, MEMORY[0x263F8E628], v16, MEMORY[0x263F8E658], v17);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v18;
}

uint64_t _s13TangentVector16_Differentiation14DifferentiablePQyd__xq_Ri_zRi0_zRi__Ri0__r0_lyAeaDQzIsegnr_AFIgngr_AE_xq_Ri_zRi0_zRi__Ri0__r0_lyAeFIsegnr_tAFs5NeverOIegnrzr_AbCRzAbCRd__r__lTR(uint64_t a1, uint64_t (*a2)(uint64_t, void, void))
{
  swift_getAssociatedTypeWitness();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ());
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  return a2(a1, *(void *)(a1 + *(int *)(TupleTypeMetadata2 + 48)), *(void *)(a1 + *(int *)(TupleTypeMetadata2 + 48) + 8));
}

uint64_t reverse-mode derivative of Array<A>.differentiableMap<A>(_:)(long long *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  long long v10 = a1[1];
  v16[0] = *a1;
  v16[1] = v10;
  v16[2] = a1[2];
  uint64_t v11 = Array<A>._vjpDifferentiableMap<A>(_:)(v16, a2, a3, a4, a5, a6);
  uint64_t v13 = v12;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = a3;
  _OWORD v14[3] = a4;
  v14[4] = a5;
  v14[5] = a6;
  v14[6] = partial apply for specialized pullback #1 <A><A1>(_:) in Array<A>._vjpDifferentiableMap<A>(_:);
  v14[7] = v13;
  return v11;
}

uint64_t Array<A>._jvpDifferentiableMap<A>(_:)(long long *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  long long v11 = *a1;
  long long v44 = a1[1];
  long long v45 = v11;
  long long v43 = a1[2];
  uint64_t v12 = MEMORY[0x270FA5388](a1);
  uint64_t v42 = (uint64_t)&v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v12);
  uint64_t v18 = (char *)&v33 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v46 = (char *)&v33 - v19;
  uint64_t v40 = (void (**)(void, void, void))static Array._allocateUninitialized(_:)();
  uint64_t v51 = v40;
  uint64_t v47 = a4;
  swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  FunctionTypeMetadata1 = swift_getFunctionTypeMetadata1();
  uint64_t v20 = static Array._allocateUninitialized(_:)();
  uint64_t v50 = v20;
  if (MEMORY[0x223C9BB20](a2, a3))
  {
    uint64_t v35 = a5;
    uint64_t v36 = a6;
    uint64_t v21 = 0;
    uint64_t v40 = (void (**)(void, void, void))(v15 + 16);
    uint64_t v39 = (void (**)(char *, char *, uint64_t))(v15 + 32);
    uint64_t v37 = (void (**)(uint64_t, uint64_t))(v15 + 8);
    uint64_t v38 = a2;
    while (1)
    {
      Swift::Bool IsNativeType = Array._hoistableIsNativeTypeChecked()();
      Array._checkSubscript(_:wasNativeTypeChecked:)();
      if (IsNativeType)
      {
        (*(void (**)(char *, unint64_t, uint64_t))(v15 + 16))(v18, a2+ ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80))+ *(void *)(v15 + 72) * v21, a3);
      }
      else
      {
        uint64_t v29 = _ArrayBuffer._getElementSlowPath(_:)();
        if (v34 != 8) {
          goto LABEL_12;
        }
        v48[0] = v29;
        (*v40)(v18, v48, a3);
        swift_unknownObjectRelease();
      }
      uint64_t v23 = (uint64_t)v46;
      (*v39)(v46, v18, a3);
      uint64_t v25 = v21 + 1;
      if (__OFADD__(v21, 1)) {
        break;
      }
      v49[0] = v45;
      v49[1] = v44;
      v49[2] = v43;
      uint64_t v26 = valueWithDifferential<A, B>(at:of:)(v42, v23, (uint64_t)v49, v24, v47);
      uint64_t v28 = v27;
      (*v37)(v23, a3);
      type metadata accessor for Array();
      a2 = v38;
      Array.append(_:)();
      v48[0] = v26;
      v48[1] = v28;
      type metadata accessor for Array();
      Array.append(_:)();
      ++v21;
      if (v25 == MEMORY[0x223C9BB20](a2, a3))
      {
        uint64_t v20 = v50;
        uint64_t v40 = v51;
        a6 = v36;
        a5 = v35;
        goto LABEL_10;
      }
    }
    __break(1u);
LABEL_12:
    swift_unknownObjectRelease();
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
LABEL_10:
    long long v30 = (void *)swift_allocObject();
    uint64_t v31 = v47;
    void v30[2] = a3;
    v30[3] = v31;
    v30[4] = a5;
    v30[5] = a6;
    v30[6] = v20;
    return (uint64_t)v40;
  }
  return result;
}

uint64_t specialized differential #1 <A><A1>(_:) in Array<A>._jvpDifferentiableMap<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  swift_getAssociatedTypeWitness();
  uint64_t v10 = type metadata accessor for Array();
  swift_getAssociatedTypeWitness();
  swift_getFunctionTypeMetadata1();
  uint64_t v11 = type metadata accessor for Array();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v13 = swift_getWitnessTable();
  zip<A, B>(_:_:)();
  long long v30 = v31;
  uint64_t v22 = a3;
  uint64_t v23 = a4;
  uint64_t v24 = a5;
  uint64_t v25 = a6;
  v20[2] = a3;
  v20[3] = a4;
  v20[4] = a5;
  v20[5] = a6;
  v20[6] = partial apply for closure #1 in differential #1 <A><A1>(_:) in Array<A>._jvpDifferentiableMap<A>(_:);
  v20[7] = &v21;
  uint64_t v26 = v10;
  uint64_t v27 = v11;
  uint64_t v28 = WitnessTable;
  uint64_t v29 = v13;
  uint64_t v14 = type metadata accessor for Zip2Sequence();
  uint64_t v15 = (char *)swift_checkMetadataState();
  uint64_t v16 = swift_getWitnessTable();
  uint64_t v18 = _sSTsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF((void (*)(char *, char *))_s13TangentVector16_Differentiation14DifferentiablePQzxq_Ri_zRi0_zRi__Ri0__r0_lyAeaDQyd__Isegnr_AFIgngr_AE_xq_Ri_zRi0_zRi__Ri0__r0_lyAeFIsegnr_tAFs5NeverOIegnrzr_AbCRzAbCRd__r__lTRTA, (uint64_t)v20, v14, v15, MEMORY[0x263F8E628], v16, MEMORY[0x263F8E658], v17);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v18;
}

uint64_t _s13TangentVector16_Differentiation14DifferentiablePQzxq_Ri_zRi0_zRi__Ri0__r0_lyAeaDQyd__Isegnr_AFIgngr_AE_xq_Ri_zRi0_zRi__Ri0__r0_lyAeFIsegnr_tAFs5NeverOIegnrzr_AbCRzAbCRd__r__lTR(uint64_t a1, uint64_t (*a2)(uint64_t, void, void))
{
  swift_getAssociatedTypeWitness();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ());
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  return a2(a1, *(void *)(a1 + *(int *)(TupleTypeMetadata2 + 48)), *(void *)(a1 + *(int *)(TupleTypeMetadata2 + 48) + 8));
}

uint64_t forward-mode derivative of Array<A>.differentiableMap<A>(_:)(long long *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  long long v10 = a1[1];
  v16[0] = *a1;
  v16[1] = v10;
  v16[2] = a1[2];
  uint64_t v11 = Array<A>._jvpDifferentiableMap<A>(_:)(v16, a2, a3, a4, a5, a6);
  uint64_t v13 = v12;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = a3;
  _OWORD v14[3] = a4;
  v14[4] = a5;
  v14[5] = a6;
  v14[6] = partial apply for specialized differential #1 <A><A1>(_:) in Array<A>._jvpDifferentiableMap<A>(_:);
  v14[7] = v13;
  return v11;
}

uint64_t Array<A>.differentiableReduce<A>(_:_:)()
{
  return Sequence.reduce<A>(_:_:)();
}

uint64_t (*Array<A>._vjpDifferentiableReduce<A>(_:_:)(uint64_t a1, void (**a2)(uint64_t, uint64_t, uint64_t), long long *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7))(uint64_t a1, uint64_t a2)
{
  v64 = a2;
  uint64_t v52 = a1;
  long long v11 = *a3;
  long long v60 = a3[1];
  long long v61 = v11;
  uint64_t v12 = *(void *)(a5 - 8);
  long long v59 = a3[2];
  uint64_t v65 = v12;
  uint64_t v13 = *(void *)(v12 + 64);
  uint64_t v14 = MEMORY[0x270FA5388](a1);
  uint64_t v63 = (char *)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  uint64_t v62 = (char *)&v49 - v16;
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v15);
  uint64_t v58 = (char *)&v49 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v22 = (char *)&v49 - v21;
  uint64_t v68 = v23;
  swift_getAssociatedTypeWitness();
  uint64_t v67 = a7;
  swift_getAssociatedTypeWitness();
  swift_getTupleTypeMetadata2();
  swift_getFunctionTypeMetadata1();
  uint64_t v71 = static Array._allocateUninitialized(_:)();
  Swift::Int v24 = MEMORY[0x223C9BB00](a4, a5);
  uint64_t v57 = type metadata accessor for Array();
  Array.reserveCapacity(_:)(v24);
  uint64_t v25 = *(void (**)(char *, void, uint64_t))(v18 + 16);
  v66 = v22;
  v25(v22, v64, a6);
  if (MEMORY[0x223C9BB20](a4, a5))
  {
    Swift::Int v51 = v24;
    uint64_t v50 = v13;
    uint64_t v26 = 0;
    v56 = (void (**)(char *, void *, uint64_t))(v65 + 16);
    v55 = (void (**)(char *, char *, uint64_t))(v65 + 32);
    uint64_t v54 = (void (**)(uint64_t, uint64_t))(v65 + 8);
    uint64_t v53 = (void (**)(uint64_t, uint64_t))(v18 + 8);
    v64 = (void (**)(uint64_t, uint64_t, uint64_t))(v18 + 32);
    uint64_t v27 = (uint64_t)v58;
    uint64_t v28 = (uint64_t)v66;
    while (1)
    {
      Swift::Bool IsNativeType = Array._hoistableIsNativeTypeChecked()();
      Array._checkSubscript(_:wasNativeTypeChecked:)();
      if (IsNativeType)
      {
        long long v30 = v63;
        (*(void (**)(char *, unint64_t, uint64_t))(v65 + 16))(v63, a4+ ((*(unsigned __int8 *)(v65 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v65 + 80))+ *(void *)(v65 + 72) * v26, a5);
      }
      else
      {
        uint64_t v43 = _ArrayBuffer._getElementSlowPath(_:)();
        long long v30 = v63;
        if (v50 != 8) {
          goto LABEL_13;
        }
        v69[0] = v43;
        (*v56)(v63, v69, a5);
        swift_unknownObjectRelease();
      }
      uint64_t v31 = (uint64_t)v62;
      (*v55)(v62, v30, a5);
      uint64_t v34 = v26 + 1;
      if (__OFADD__(v26, 1)) {
        break;
      }
      v70[0] = v61;
      v70[1] = v60;
      v70[2] = v59;
      uint64_t v35 = valueWithPullback<A, B, C>(at:_:of:)(v27, v28, v31, (uint64_t)v70, v32, v33, a6);
      uint64_t v36 = v31;
      uint64_t v37 = v35;
      uint64_t v39 = v38;
      (*v54)(v36, a5);
      (*v53)(v28, a6);
      uint64_t v40 = *v64;
      (*v64)(v28, v27, a6);
      uint64_t v41 = (void *)swift_allocObject();
      v41[2] = a5;
      v41[3] = a6;
      uint64_t v42 = v68;
      v41[4] = v67;
      v41[5] = v42;
      v41[6] = v37;
      v41[7] = v39;
      v69[0] = partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A1.Differentiable.TangentVector) -> (@out A1.Differentiable.TangentVector, @out A.Differentiable.TangentVector);
      v69[1] = v41;
      Array.append(_:)();
      ++v26;
      if (v34 == MEMORY[0x223C9BB20](a4, a5))
      {
        uint64_t v44 = v52;
        Swift::Int v24 = v51;
        goto LABEL_11;
      }
    }
    __break(1u);
LABEL_13:
    swift_unknownObjectRelease();
    uint64_t result = (uint64_t (*)(uint64_t, uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v40 = *(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 32);
    uint64_t v44 = v52;
LABEL_11:
    v40(v44, (uint64_t)v66, a6);
    uint64_t v45 = v71;
    uint64_t v46 = (void *)swift_allocObject();
    v46[2] = a5;
    v46[3] = a6;
    uint64_t v47 = v68;
    v46[4] = v67;
    v46[5] = v47;
    v46[6] = v24;
    v46[7] = v45;
    return partial apply for specialized closure #1 in Array<A>._vjpDifferentiableReduce<A>(_:_:);
  }
  return result;
}

uint64_t thunk for @escaping @callee_guaranteed (@in_guaranteed A1.Differentiable.TangentVector) -> (@out A1.Differentiable.TangentVector, @out A.Differentiable.TangentVector)@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X1>, uint64_t a3@<X8>)
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  return a2(a3, a3 + *(int *)(TupleTypeMetadata2 + 48), a1);
}

uint64_t specialized closure #1 in Array<A>._vjpDifferentiableReduce<A>(_:_:)(uint64_t a1, uint64_t a2, Swift::Int a3, uint64_t a4)
{
  uint64_t v33 = a1;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = swift_getAssociatedTypeWitness();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v10 = MEMORY[0x270FA5388](TupleTypeMetadata2);
  uint64_t v12 = (char *)&v33 - v11;
  uint64_t v13 = *(void *)(v8 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v10);
  uint64_t v37 = (char *)&v33 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v33 - v16;
  uint64_t v34 = v18;
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))((char *)&v33 - v16, a2, AssociatedTypeWitness);
  uint64_t v44 = static Array._allocateUninitialized(_:)();
  uint64_t v39 = v8;
  uint64_t v40 = type metadata accessor for Array();
  Array.reserveCapacity(_:)(a3);
  uint64_t v41 = AssociatedTypeWitness;
  uint64_t v42 = a4;
  uint64_t v38 = TupleTypeMetadata2;
  FunctionTypeMetadata1 = swift_getFunctionTypeMetadata1();
  type metadata accessor for Array();
  swift_bridgeObjectRetain();
  swift_getWitnessTable();
  BidirectionalCollection.reversed()();
  uint64_t v20 = v43;
  uint64_t v36 = FunctionTypeMetadata1;
  uint64_t v21 = MEMORY[0x223C9BB20](v43, FunctionTypeMetadata1);
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v35 = v20 + 32;
    uint64_t v23 = (void (**)(char *, uint64_t))(v34 + 8);
    Swift::Int v24 = (void (**)(char *, char *, uint64_t))(v34 + 32);
    uint64_t v25 = (void (**)(char *, char *, uint64_t))(v13 + 32);
    while (!__OFSUB__(v22--, 1))
    {
      Swift::Bool IsNativeType = Array._hoistableIsNativeTypeChecked()();
      Array._checkSubscript(_:wasNativeTypeChecked:)();
      if (!IsNativeType) {
        goto LABEL_8;
      }
      uint64_t v28 = *(void (**)(char *))(v35 + 16 * v22);
      uint64_t v29 = &v12[*(int *)(v38 + 48)];
      swift_retain();
      v28(v17);
      swift_release();
      uint64_t v30 = v41;
      (*v23)(v17, v41);
      (*v24)(v17, v12, v30);
      (*v25)(v37, v29, v39);
      Array.append(_:)();
      if (!v22) {
        goto LABEL_6;
      }
    }
    __break(1u);
LABEL_8:
    _ArrayBuffer._getElementSlowPath(_:)();
    swift_unknownObjectRelease();
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
LABEL_6:
    swift_bridgeObjectRelease();
    uint64_t v43 = v44;
    swift_bridgeObjectRetain();
    swift_getWitnessTable();
    uint64_t v31 = Sequence.reversed()();
    (*(void (**)(uint64_t, char *, uint64_t))(v34 + 32))(v33, v17, v41);
    swift_bridgeObjectRelease();
    return v31;
  }
  return result;
}

uint64_t (*reverse-mode derivative of Array<A>.differentiableReduce<A>(_:_:)(uint64_t a1, void (**a2)(uint64_t, uint64_t, uint64_t), long long *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8))()
{
  long long v12 = a3[1];
  v17[0] = *a3;
  v17[1] = v12;
  v17[2] = a3[2];
  Array<A>._vjpDifferentiableReduce<A>(_:_:)(a1, a2, v17, a4, a5, a6, a7);
  uint64_t v14 = v13;
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = a5;
  _OWORD v15[3] = a6;
  v15[4] = a7;
  v15[5] = a8;
  v15[6] = partial apply for specialized closure #1 in Array<A>._vjpDifferentiableReduce<A>(_:_:);
  v15[7] = v14;
  return partial apply for autodiff self-reordering reabstraction thunk for @escaping @callee_guaranteed (@in_guaranteed A1.Differentiable.TangentVector) -> (@out A1.Differentiable.TangentVector, @owned [A.Differentiable.TangentVector]<A>.DifferentiableView);
}

uint64_t (*Array<A>._jvpDifferentiableReduce<A>(_:_:)(uint64_t a1, uint64_t a2, long long *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7))@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v68 = a2;
  uint64_t v52 = a1;
  long long v11 = *a3;
  long long v62 = a3[1];
  long long v63 = v11;
  uint64_t v12 = *(void *)(a5 - 8);
  long long v61 = a3[2];
  uint64_t v13 = v12;
  uint64_t v14 = MEMORY[0x270FA5388](a1);
  uint64_t v65 = (char *)&v49 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = v15;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  v64 = (char *)&v49 - v17;
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = MEMORY[0x270FA5388](v16);
  long long v60 = (char *)&v49 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  uint64_t v23 = (char *)&v49 - v22;
  uint64_t v53 = v24;
  swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  swift_getFunctionTypeMetadata2();
  uint64_t v71 = static Array._allocateUninitialized(_:)();
  Swift::Int v25 = MEMORY[0x223C9BB00](a4, a5);
  uint64_t v59 = type metadata accessor for Array();
  Array.reserveCapacity(_:)(v25);
  uint64_t v26 = *(void (**)(char *, uint64_t, uint64_t))(v19 + 16);
  uint64_t v27 = v68;
  uint64_t v67 = v23;
  uint64_t v68 = a6;
  v26(v23, v27, a6);
  if (MEMORY[0x223C9BB20](a4, a5))
  {
    uint64_t v51 = a7;
    uint64_t v28 = 0;
    uint64_t v58 = (void (**)(char *, void *, uint64_t))(v13 + 16);
    uint64_t v57 = (void (**)(uint64_t, char *, uint64_t))(v13 + 32);
    uint64_t v56 = v13;
    v55 = (void (**)(uint64_t, uint64_t))(v13 + 8);
    uint64_t v54 = (void (**)(uint64_t, uint64_t))(v19 + 8);
    v66 = (void (**)(uint64_t, uint64_t, uint64_t))(v19 + 32);
    uint64_t v29 = (uint64_t)v60;
    uint64_t v31 = (uint64_t)v67;
    uint64_t v30 = v68;
    while (1)
    {
      Swift::Bool IsNativeType = Array._hoistableIsNativeTypeChecked()();
      Array._checkSubscript(_:wasNativeTypeChecked:)();
      if (IsNativeType)
      {
        uint64_t v33 = v65;
        (*(void (**)(char *, unint64_t, uint64_t))(v56 + 16))(v65, a4+ ((*(unsigned __int8 *)(v56 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80))+ *(void *)(v56 + 72) * v28, a5);
        uint64_t v34 = (uint64_t)v64;
      }
      else
      {
        uint64_t v42 = _ArrayBuffer._getElementSlowPath(_:)();
        uint64_t v34 = (uint64_t)v64;
        uint64_t v33 = v65;
        if (v50 != 8) {
          goto LABEL_13;
        }
        v69[0] = v42;
        (*v58)(v65, v69, a5);
        swift_unknownObjectRelease();
      }
      (*v57)(v34, v33, a5);
      uint64_t v37 = v28 + 1;
      if (__OFADD__(v28, 1)) {
        break;
      }
      v70[0] = v63;
      v70[1] = v62;
      v70[2] = v61;
      uint64_t v38 = valueWithDifferential<A, B, C>(at:_:of:)(v29, v31, v34, (uint64_t)v70, v35, v36, v30);
      uint64_t v40 = v39;
      (*v55)(v34, a5);
      (*v54)(v31, v30);
      uint64_t v41 = *v66;
      (*v66)(v31, v29, v30);
      v69[0] = v38;
      v69[1] = v40;
      Array.append(_:)();
      ++v28;
      if (v37 == MEMORY[0x223C9BB20](a4, a5))
      {
        uint64_t v43 = v53;
        a7 = v51;
        uint64_t v44 = v52;
        goto LABEL_11;
      }
    }
    __break(1u);
LABEL_13:
    swift_unknownObjectRelease();
    uint64_t result = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X1>, uint64_t@<X8>))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v41 = *(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 32);
    uint64_t v44 = v52;
    uint64_t v43 = v53;
LABEL_11:
    uint64_t v45 = v68;
    v41(v44, (uint64_t)v67, v68);
    uint64_t v46 = v71;
    uint64_t v47 = (void *)swift_allocObject();
    void v47[2] = a5;
    v47[3] = v45;
    v47[4] = a7;
    v47[5] = v43;
    v47[6] = v46;
    return partial apply for specialized closure #1 in Array<A>._jvpDifferentiableReduce<A>(_:_:);
  }
  return result;
}

uint64_t specialized closure #1 in Array<A>._jvpDifferentiableReduce<A>(_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v45 = a3;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v39 = (char *)&v34 - v9;
  uint64_t v10 = swift_getAssociatedTypeWitness();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v36 = (char *)&v34 - v12;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ());
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v14 = type metadata accessor for Optional();
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v34 - v15;
  uint64_t v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
  uint64_t v38 = a4;
  v17(a4, a2, AssociatedTypeWitness);
  uint64_t v18 = v8 + 16;
  uint64_t v50 = a1;
  *(void *)&long long v49 = v45;
  uint64_t v19 = type metadata accessor for Array();
  uint64_t v37 = v10;
  uint64_t v40 = AssociatedTypeWitness;
  swift_getFunctionTypeMetadata2();
  uint64_t v20 = type metadata accessor for Array();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v22 = swift_getWitnessTable();
  zip<A, B>(_:_:)();
  long long v49 = v46;
  uint64_t v44 = v20;
  uint64_t v45 = v19;
  uint64_t v50 = v19;
  uint64_t v51 = v20;
  uint64_t v42 = v22;
  uint64_t v43 = WitnessTable;
  uint64_t v52 = WitnessTable;
  uint64_t v53 = v22;
  type metadata accessor for Zip2Sequence();
  Zip2Sequence.makeIterator()();
  uint64_t v41 = TupleTypeMetadata2 - 8;
  uint64_t v35 = (void (**)(char *, char *, uint64_t))(v11 + 32);
  uint64_t v34 = (void (**)(char *, uint64_t))(v11 + 8);
  uint64_t v23 = (void (**)(uint64_t, uint64_t))(v18 - 8);
  uint64_t v24 = (void (**)(uint64_t, char *, uint64_t))(v18 + 16);
  uint64_t v26 = v36;
  uint64_t v25 = v37;
  for (i = v39; ; (*v24)(v32, i, v31))
  {
    *(void *)&long long v46 = v45;
    *((void *)&v46 + 1) = v44;
    uint64_t v47 = v43;
    uint64_t v48 = v42;
    type metadata accessor for Zip2Sequence.Iterator();
    Zip2Sequence.Iterator.next()();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(TupleTypeMetadata2 - 8) + 48))(v16, 1, TupleTypeMetadata2) == 1)break; {
    uint64_t v28 = *(void (**)(uint64_t, char *))&v16[*(int *)(TupleTypeMetadata2 + 48)];
    }
    (*v35)(v26, v16, v25);
    uint64_t v29 = TupleTypeMetadata2;
    uint64_t v30 = v38;
    v28(v38, v26);
    swift_release();
    (*v34)(v26, v25);
    uint64_t v31 = v40;
    (*v23)(v30, v40);
    uint64_t v32 = v30;
    TupleTypeMetadata2 = v29;
  }
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t (*forward-mode derivative of Array<A>.differentiableReduce<A>(_:_:)(uint64_t a1, uint64_t a2, long long *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8))(uint64_t a1, uint64_t a2)
{
  long long v12 = a3[1];
  v17[0] = *a3;
  v17[1] = v12;
  v17[2] = a3[2];
  Array<A>._jvpDifferentiableReduce<A>(_:_:)(a1, a2, v17, a4, a5, a6, a7);
  uint64_t v14 = v13;
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = a5;
  _OWORD v15[3] = a6;
  v15[4] = a7;
  v15[5] = a8;
  v15[6] = partial apply for specialized closure #1 in Array<A>._jvpDifferentiableReduce<A>(_:_:);
  v15[7] = v14;
  return partial apply for autodiff self-reordering reabstraction thunk for @escaping @callee_guaranteed (@in_guaranteed A1.Differentiable.TangentVector, @guaranteed [A.Differentiable.TangentVector]<A>.DifferentiableView) -> (@out A1.Differentiable.TangentVector);
}

uint64_t Optional<A>.TangentVector.value.getter@<X0>(uint64_t a1@<X8>)
{
  swift_getAssociatedTypeWitness();
  uint64_t v3 = type metadata accessor for Optional();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t Optional<A>.TangentVector.value.setter(uint64_t a1)
{
  swift_getAssociatedTypeWitness();
  uint64_t v3 = type metadata accessor for Optional();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 40);

  return v4(v1, a1, v3);
}

uint64_t (*Optional<A>.TangentVector.value.modify())()
{
  return _ConcreteDerivativeBox._base.modify;
}

uint64_t Optional<A>.TangentVector.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 56))(a2, 1, 1, AssociatedTypeWitness);
  uint64_t v5 = type metadata accessor for Optional();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);

  return v6(a2, a1, v5);
}

uint64_t static Optional<A>.TangentVector.zero.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v3 = type metadata accessor for Optional();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v7 - v4;
  swift_getAssociatedConformanceWitness();
  dispatch thunk of static AdditiveArithmetic.zero.getter();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 56))(v5, 0, 1, AssociatedTypeWitness);
  return Optional<A>.TangentVector.init(_:)((uint64_t)v5, a1);
}

uint64_t static Optional<A>.TangentVector.+ infix(_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v31 = a2;
  uint64_t v32 = a5;
  uint64_t v33 = a3;
  uint64_t v34 = a4;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v8 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v30 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v29 - v10;
  uint64_t v12 = type metadata accessor for Optional();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v29 - v14;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v17 = MEMORY[0x270FA5388](TupleTypeMetadata2 - 8);
  uint64_t v19 = (char *)&v29 - v18;
  uint64_t v20 = (char *)&v29 + *(int *)(v17 + 56) - v18;
  uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
  v21((char *)&v29 - v18, a1, v12);
  v21(v20, v31, v12);
  uint64_t v22 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  LODWORD(v12) = v22(v19, 1, AssociatedTypeWitness);
  int v23 = v22(v20, 1, AssociatedTypeWitness);
  if (v12 != 1)
  {
    uint64_t v25 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
    if (v23 != 1)
    {
      v25(v11, v19, AssociatedTypeWitness);
      uint64_t v26 = v30;
      v25(v30, v20, AssociatedTypeWitness);
      swift_getAssociatedConformanceWitness();
      dispatch thunk of static AdditiveArithmetic.+ infix(_:_:)();
      uint64_t v27 = *(void (**)(char *, uint64_t))(v7 + 8);
      v27(v26, AssociatedTypeWitness);
      v27(v11, AssociatedTypeWitness);
      uint64_t v24 = 0;
      goto LABEL_10;
    }
    v25(v15, v19, AssociatedTypeWitness);
LABEL_7:
    uint64_t v24 = 0;
    goto LABEL_10;
  }
  if (v23 != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v15, v20, AssociatedTypeWitness);
    goto LABEL_7;
  }
  uint64_t v24 = 1;
LABEL_10:
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v15, v24, 1, AssociatedTypeWitness);
  return Optional<A>.TangentVector.init(_:)((uint64_t)v15, v32);
}

uint64_t static Optional<A>.TangentVector.- infix(_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v29 = a1;
  uint64_t v30 = a2;
  uint64_t v31 = a5;
  uint64_t v32 = a3;
  uint64_t v33 = a4;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v6 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v7 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v28 - v10;
  uint64_t v12 = type metadata accessor for Optional();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v28 - v14;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v17 = MEMORY[0x270FA5388](TupleTypeMetadata2 - 8);
  uint64_t v19 = (char *)&v28 - v18;
  uint64_t v20 = (char *)&v28 + *(int *)(v17 + 56) - v18;
  uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
  v21((char *)&v28 - v18, v29, v12);
  v21(v20, v30, v12);
  uint64_t v22 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48);
  LODWORD(v12) = v22(v19, 1, AssociatedTypeWitness);
  int v23 = v22(v20, 1, AssociatedTypeWitness);
  if (v12 != 1)
  {
    uint64_t v25 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
    if (v23 == 1)
    {
      v25(v15, v19, AssociatedTypeWitness);
      uint64_t v24 = 0;
      goto LABEL_10;
    }
    v25(v11, v19, AssociatedTypeWitness);
    v25(v9, v20, AssociatedTypeWitness);
    swift_getAssociatedConformanceWitness();
    goto LABEL_9;
  }
  if (v23 != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v11, v20, AssociatedTypeWitness);
    swift_getAssociatedConformanceWitness();
    dispatch thunk of static AdditiveArithmetic.zero.getter();
LABEL_9:
    dispatch thunk of static AdditiveArithmetic.- infix(_:_:)();
    uint64_t v26 = *(void (**)(char *, uint64_t))(v6 + 8);
    v26(v9, AssociatedTypeWitness);
    v26(v11, AssociatedTypeWitness);
    uint64_t v24 = 0;
    goto LABEL_10;
  }
  uint64_t v24 = 1;
LABEL_10:
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v15, v24, 1, AssociatedTypeWitness);
  return Optional<A>.TangentVector.init(_:)((uint64_t)v15, v31);
}

uint64_t Optional<A>.TangentVector.move(by:)(uint64_t a1)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v3 = type metadata accessor for Optional();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)v14 - v6;
  uint64_t v8 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)v14 - v9;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, a1, v3);
  uint64_t v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48);
  if (v11(v7, 1, AssociatedTypeWitness) == 1) {
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  }
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v7, AssociatedTypeWitness);
  if (!v11((char *)v14[1], 1, AssociatedTypeWitness))
  {
    uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    (*(void (**)(char *, uint64_t, uint64_t))(AssociatedConformanceWitness + 32))(v10, AssociatedTypeWitness, AssociatedConformanceWitness);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, AssociatedTypeWitness);
}

BOOL static Optional<A>.TangentVector.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v24[1] = a4;
  void v24[2] = a3;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  v24[0] = (char *)v24 - v8;
  uint64_t v9 = type metadata accessor for Optional();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v27 = (char *)v24 - v11;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v25 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](TupleTypeMetadata2);
  uint64_t v15 = (char *)v24 - v14;
  uint64_t v16 = (char *)v24 + *(int *)(v13 + 48) - v14;
  uint64_t v26 = v10;
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v17((char *)v24 - v14, a1, v9);
  v17(v16, a2, v9);
  uint64_t v18 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
  if (v18(v15, 1, AssociatedTypeWitness) == 1)
  {
    if (v18(v16, 1, AssociatedTypeWitness) == 1)
    {
      (*(void (**)(char *, uint64_t))(v26 + 8))(v15, v9);
      return 1;
    }
    goto LABEL_6;
  }
  v17(v27, (uint64_t)v15, v9);
  if (v18(v16, 1, AssociatedTypeWitness) == 1)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v27, AssociatedTypeWitness);
LABEL_6:
    (*(void (**)(char *, uint64_t))(v25 + 8))(v15, TupleTypeMetadata2);
    return 0;
  }
  uint64_t v19 = v24[0];
  (*(void (**)(void, char *, uint64_t))(v7 + 32))(v24[0], v16, AssociatedTypeWitness);
  swift_getAssociatedConformanceWitness();
  uint64_t v20 = v27;
  char v21 = dispatch thunk of static Equatable.== infix(_:_:)();
  uint64_t v22 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
  v22(v19, AssociatedTypeWitness);
  v22((uint64_t)v20, AssociatedTypeWitness);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v15, v9);
  return (v21 & 1) != 0;
}

uint64_t protocol witness for static AdditiveArithmetic.zero.getter in conformance A?<A>.TangentVector@<X0>(uint64_t a1@<X8>)
{
  return static Optional<A>.TangentVector.zero.getter(a1);
}

uint64_t protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance A?<A>.TangentVector@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return static Optional<A>.TangentVector.+ infix(_:_:)(a1, a2, *(void *)(a3 + 16), *(void *)(a3 + 24), a4);
}

uint64_t protocol witness for static AdditiveArithmetic.- infix(_:_:) in conformance A?<A>.TangentVector@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return static Optional<A>.TangentVector.- infix(_:_:)(a1, a2, *(void *)(a3 + 16), *(void *)(a3 + 24), a4);
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance A?<A>.TangentVector(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return static Optional<A>.TangentVector.== infix(_:_:)(a1, a2, *(void *)(a3 + 16), *(void *)(a3 + 24));
}

uint64_t Optional<A>.move(by:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = type metadata accessor for Optional();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v17 - v11;
  uint64_t v13 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v15 = (char *)&v17 - v14;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, a1, v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v12, 1, AssociatedTypeWitness) == 1) {
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v12, AssociatedTypeWitness);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48))(v3, 1, v6)) {
    (*(void (**)(char *, uint64_t, uint64_t))(a3 + 32))(v15, v6, a3);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, AssociatedTypeWitness);
}

uint64_t protocol witness for Differentiable.move(by:) in conformance <A> A?(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return Optional<A>.move(by:)(a1, a2, *(void *)(a3 - 8));
}

uint64_t Optional<A>.TangentVector.customMirror.getter()
{
  swift_getAssociatedTypeWitness();
  uint64_t v0 = type metadata accessor for Optional();

  return MEMORY[0x270F9E3A8](v0);
}

__int16 Float16.move(by:)@<H0>(__n128 a1@<Q0>)
{
  *(short float *)&__int16 result = *v1 + *(short float *)a1.n128_u16;
  *uint64_t v1 = *(short float *)&result;
  return result;
}

__int16 protocol witness for Differentiable.move(by:) in conformance Float16@<H0>(short float *a1@<X0>)
{
  *(short float *)&__int16 result = *a1 + *v1;
  *uint64_t v1 = *(short float *)&result;
  return result;
}

uint64_t (*static Float16._vjpInit(x:)())()
{
  return _ConcreteDerivativeBox._base.modify;
}

uint64_t (*static Float16._jvpInit(x:)())()
{
  return _ConcreteDerivativeBox._base.modify;
}

uint64_t (*static Float16._vjpInit(x:)(float _S0))()
{
  __asm { FCVT            H0, S0 }
  return closure #1 in static Float16._vjpInit(x:);
}

uint64_t (*static Float16._jvpInit(x:)(float _S0))()
{
  __asm { FCVT            H0, S0 }
  return closure #1 in static Float16._jvpInit(x:);
}

uint64_t (*static Float16._vjpInit(x:)(double _D0))()
{
  __asm { FCVT            H0, D0 }
  return closure #1 in static Float16._vjpInit(x:);
}

uint64_t (*static Float16._jvpInit(x:)(double _D0))()
{
  __asm { FCVT            H0, D0 }
  return closure #1 in static Float16._jvpInit(x:);
}

uint64_t (*static Float16._vjpNegate(x:)())()
{
  return closure #1 in static Float16._vjpNegate(x:);
}

__int16 (*static Float16._jvpNegate(x:)())@<H0>(__n128 a1@<Q0>)
{
  return closure #1 in static Float16._jvpNegate(x:);
}

__int16 closure #1 in static Float16._jvpNegate(x:)@<H0>(__n128 a1@<Q0>)
{
  *(short float *)&__int16 result = -*(short float *)a1.n128_u16;
  return result;
}

void (*static Float16._vjpAdd(lhs:rhs:)())()
{
  return closure #1 in static Float16._vjpAdd(lhs:rhs:);
}

__int16 (*static Float16._jvpAdd(lhs:rhs:)())@<H0>(__n128 a1@<Q0>, __n128 a2@<Q1>)
{
  return closure #1 in static Float16._jvpAdd(lhs:rhs:);
}

__int16 closure #1 in static Float16._jvpAdd(lhs:rhs:)@<H0>(__n128 a1@<Q0>, __n128 a2@<Q1>)
{
  *(short float *)&__int16 result = *(short float *)a1.n128_u16 + *(short float *)a2.n128_u16;
  return result;
}

__int16 (*static Float16._vjpAddAssign(_:_:)(short float *a1, __n128 a2))@<H0>(uint64_t a1@<X0>)
{
  *a1 = *a1 + *(short float *)a2.n128_u16;
  return closure #1 in static Float16._vjpAddAssign(_:_:);
}

__int16 closure #1 in static Float16._vjpAddAssign(_:_:)@<H0>(uint64_t a1@<X0>)
{
  return *(_WORD *)a1;
}

__int16 (*static Float16._jvpAddAssign(_:_:)(short float *a1, __n128 a2))@<H0>(short float *a1@<X0>, __n128 a2@<Q0>)
{
  *a1 = *a1 + *(short float *)a2.n128_u16;
  return closure #1 in static Float16._jvpAddAssign(_:_:);
}

__int16 closure #1 in static Float16._jvpAddAssign(_:_:)@<H0>(short float *a1@<X0>, __n128 a2@<Q0>)
{
  *(short float *)&__int16 result = *a1 + *(short float *)a2.n128_u16;
  *a1 = *(short float *)&result;
  return result;
}

void (*static Float16._vjpSubtract(lhs:rhs:)())()
{
  return closure #1 in static Float16._vjpSubtract(lhs:rhs:);
}

__int16 (*static Float16._jvpSubtract(lhs:rhs:)())@<H0>(__n128 a1@<Q0>, __n128 a2@<Q1>)
{
  return closure #1 in static Float16._jvpSubtract(lhs:rhs:);
}

__int16 closure #1 in static Float16._jvpSubtract(lhs:rhs:)@<H0>(__n128 a1@<Q0>, __n128 a2@<Q1>)
{
  *(short float *)&__int16 result = *(short float *)a1.n128_u16 - *(short float *)a2.n128_u16;
  return result;
}

__int16 (*static Float16._vjpSubtractAssign(_:_:)(short float *a1, __n128 a2))@<H0>(short float *a1@<X0>)
{
  *a1 = *a1 - *(short float *)a2.n128_u16;
  return closure #1 in static Float16._vjpSubtractAssign(_:_:);
}

__int16 closure #1 in static Float16._vjpSubtractAssign(_:_:)@<H0>(short float *a1@<X0>)
{
  *(short float *)&__int16 result = -*a1;
  return result;
}

__int16 (*static Float16._jvpSubtractAssign(_:_:)(short float *a1, __n128 a2))@<H0>(short float *a1@<X0>, __n128 a2@<Q0>)
{
  *a1 = *a1 - *(short float *)a2.n128_u16;
  return closure #1 in static Float16._jvpSubtractAssign(_:_:);
}

__int16 closure #1 in static Float16._jvpSubtractAssign(_:_:)@<H0>(short float *a1@<X0>, __n128 a2@<Q0>)
{
  *(short float *)&__int16 result = *a1 - *(short float *)a2.n128_u16;
  *a1 = *(short float *)&result;
  return result;
}

float static Float16._vjpMultiply(lhs:rhs:)(__n128 a1, __n128 a2)
{
  unsigned __int16 v3 = a2.n128_u16[0];
  unsigned __int16 v4 = a1.n128_u16[0];
  *(short float *)&float v2 = *(short float *)a1.n128_u16 * *(short float *)a2.n128_u16;
  uint64_t v5 = swift_allocObject();
  *(_WORD *)(v5 + 16) = v3;
  *(_WORD *)(v5 + 18) = v4;
  return v2;
}

float reverse-mode derivative of static Float16.* infix(_:_:)(__n128 a1, __n128 a2)
{
  unsigned __int16 v3 = a2.n128_u16[0];
  unsigned __int16 v4 = a1.n128_u16[0];
  *(short float *)&float v2 = *(short float *)a1.n128_u16 * *(short float *)a2.n128_u16;
  uint64_t v5 = swift_allocObject();
  *(_WORD *)(v5 + 16) = v3;
  *(_WORD *)(v5 + 18) = v4;
  return v2;
}

float static Float16._jvpMultiply(lhs:rhs:)(__n128 a1, __n128 a2)
{
  unsigned __int16 v3 = a2.n128_u16[0];
  unsigned __int16 v4 = a1.n128_u16[0];
  *(short float *)&float v2 = *(short float *)a1.n128_u16 * *(short float *)a2.n128_u16;
  uint64_t v5 = swift_allocObject();
  *(_WORD *)(v5 + 16) = v4;
  *(_WORD *)(v5 + 18) = v3;
  return v2;
}

float forward-mode derivative of static Float16.* infix(_:_:)(__n128 a1, __n128 a2)
{
  unsigned __int16 v3 = a2.n128_u16[0];
  unsigned __int16 v4 = a1.n128_u16[0];
  *(short float *)&float v2 = *(short float *)a1.n128_u16 * *(short float *)a2.n128_u16;
  uint64_t v5 = swift_allocObject();
  *(_WORD *)(v5 + 16) = v4;
  *(_WORD *)(v5 + 18) = v3;
  return v2;
}

__int16 (*static Float16._vjpMultiplyAssign(_:_:)(short float *a1, __n128 a2))@<H0>(short float *a1@<X0>)
{
  short float v2 = *(short float *)a2.n128_u16;
  short float v4 = *a1;
  uint64_t v5 = swift_allocObject();
  *(short float *)(v5 + 16) = v4;
  *(short float *)(v5 + 18) = v2;
  *a1 = v4 * v2;
  return partial apply for closure #1 in static Float16._vjpMultiplyAssign(_:_:);
}

uint64_t (*reverse-mode derivative of static Float16.*= infix(_:_:)(short float *a1, __n128 a2))()
{
  short float v2 = *(short float *)a2.n128_u16;
  short float v4 = *a1;
  uint64_t v5 = swift_allocObject();
  *(short float *)(v5 + 16) = v4;
  *(short float *)(v5 + 18) = v2;
  *a1 = v4 * v2;
  return closure #1 in static Float16._vjpMultiplyAssign(_:_:)partial apply;
}

__int16 (*static Float16._jvpMultiplyAssign(_:_:)(short float *a1, __n128 a2))@<H0>(short float *a1@<X0>, __n128 a2@<Q0>)
{
  unsigned __int16 v2 = a2.n128_u16[0];
  short float v3 = *a1;
  *a1 = *a1 * *(short float *)a2.n128_u16;
  uint64_t v4 = swift_allocObject();
  *(_WORD *)(v4 + 16) = v2;
  *(short float *)(v4 + 18) = v3;
  return partial apply for closure #1 in static Float16._jvpMultiplyAssign(_:_:);
}

uint64_t (*forward-mode derivative of static Float16.*= infix(_:_:)(short float *a1, __n128 a2))()
{
  unsigned __int16 v2 = a2.n128_u16[0];
  short float v3 = *a1;
  *a1 = *a1 * *(short float *)a2.n128_u16;
  uint64_t v4 = swift_allocObject();
  *(_WORD *)(v4 + 16) = v2;
  *(short float *)(v4 + 18) = v3;
  return closure #1 in static Float16._jvpMultiplyAssign(_:_:)partial apply;
}

float static Float16._vjpDivide(lhs:rhs:)(__n128 a1, __n128 a2)
{
  unsigned __int16 v3 = a2.n128_u16[0];
  unsigned __int16 v4 = a1.n128_u16[0];
  *(short float *)&float v2 = *(short float *)a1.n128_u16 / *(short float *)a2.n128_u16;
  uint64_t v5 = swift_allocObject();
  *(_WORD *)(v5 + 16) = v3;
  *(_WORD *)(v5 + 18) = v4;
  return v2;
}

float reverse-mode derivative of static Float16./ infix(_:_:)(__n128 a1, __n128 a2)
{
  unsigned __int16 v3 = a2.n128_u16[0];
  unsigned __int16 v4 = a1.n128_u16[0];
  *(short float *)&float v2 = *(short float *)a1.n128_u16 / *(short float *)a2.n128_u16;
  uint64_t v5 = swift_allocObject();
  *(_WORD *)(v5 + 16) = v3;
  *(_WORD *)(v5 + 18) = v4;
  return v2;
}

float static Float16._jvpDivide(lhs:rhs:)(__n128 a1, __n128 a2)
{
  unsigned __int16 v3 = a2.n128_u16[0];
  unsigned __int16 v4 = a1.n128_u16[0];
  *(short float *)&float v2 = *(short float *)a1.n128_u16 / *(short float *)a2.n128_u16;
  uint64_t v5 = swift_allocObject();
  *(_WORD *)(v5 + 16) = v3;
  *(_WORD *)(v5 + 18) = v4;
  return v2;
}

float forward-mode derivative of static Float16./ infix(_:_:)(__n128 a1, __n128 a2)
{
  unsigned __int16 v3 = a2.n128_u16[0];
  unsigned __int16 v4 = a1.n128_u16[0];
  *(short float *)&float v2 = *(short float *)a1.n128_u16 / *(short float *)a2.n128_u16;
  uint64_t v5 = swift_allocObject();
  *(_WORD *)(v5 + 16) = v3;
  *(_WORD *)(v5 + 18) = v4;
  return v2;
}

uint64_t (*static Float16._vjpDivideAssign(_:_:)(short float *a1, __n128 a2))()
{
  short float v2 = *(short float *)a2.n128_u16;
  short float v4 = *a1;
  uint64_t v5 = swift_allocObject();
  *(short float *)(v5 + 16) = v4;
  *(short float *)(v5 + 18) = v2;
  *a1 = v4 / v2;
  return partial apply for closure #1 in static Float16._vjpDivideAssign(_:_:);
}

uint64_t (*reverse-mode derivative of static Float16./= infix(_:_:)(short float *a1, __n128 a2))()
{
  short float v2 = *(short float *)a2.n128_u16;
  short float v4 = *a1;
  uint64_t v5 = swift_allocObject();
  *(short float *)(v5 + 16) = v4;
  *(short float *)(v5 + 18) = v2;
  *a1 = v4 / v2;
  return partial apply for closure #1 in static Float16._vjpDivideAssign(_:_:);
}

uint64_t (*static Float16._jvpDivideAssign(_:_:)(short float *a1, __n128 a2))()
{
  unsigned __int16 v2 = a2.n128_u16[0];
  short float v3 = *a1;
  *a1 = *a1 / *(short float *)a2.n128_u16;
  uint64_t v4 = swift_allocObject();
  *(_WORD *)(v4 + 16) = v2;
  *(short float *)(v4 + 18) = v3;
  return partial apply for closure #1 in static Float16._jvpDivideAssign(_:_:);
}

uint64_t (*forward-mode derivative of static Float16./= infix(_:_:)(short float *a1, __n128 a2))()
{
  unsigned __int16 v2 = a2.n128_u16[0];
  short float v3 = *a1;
  *a1 = *a1 / *(short float *)a2.n128_u16;
  uint64_t v4 = swift_allocObject();
  *(_WORD *)(v4 + 16) = v2;
  *(short float *)(v4 + 18) = v3;
  return partial apply for closure #1 in static Float16._jvpDivideAssign(_:_:);
}

Swift::Void __swiftcall Float.move(by:)(Swift::Float by)
{
  *uint64_t v1 = *v1 + by;
}

float protocol witness for Differentiable.move(by:) in conformance Float(float *a1)
{
  float result = *a1 + *v1;
  *uint64_t v1 = result;
  return result;
}

__int16 (*static Float._vjpInit(x:)(__n128 _Q0))@<H0>(float _S0@<S0>)
{
  __asm { FCVT            S0, H0 }
  return closure #1 in static Float._vjpInit(x:);
}

__int16 closure #1 in static Float._vjpInit(x:)@<H0>(float _S0@<S0>)
{
  __asm { FCVT            H0, S0 }
  return result;
}

float (*static Float._jvpInit(x:)(__n128 _Q0))(__n128 _Q0)
{
  __asm { FCVT            S0, H0 }
  return closure #1 in static Float._jvpInit(x:);
}

float closure #1 in static Float._jvpInit(x:)(__n128 _Q0)
{
  __asm { FCVT            S0, H0 }
  return result;
}

uint64_t (*static Float._vjpInit(x:)())()
{
  return _ConcreteDerivativeBox._base.modify;
}

{
  return closure #1 in static Float._vjpInit(x:);
}

uint64_t (*static Float._jvpInit(x:)())()
{
  return _ConcreteDerivativeBox._base.modify;
}

{
  return closure #1 in static Float._jvpInit(x:);
}

uint64_t (*static Float._vjpNegate(x:)())()
{
  return closure #1 in static Float._vjpNegate(x:);
}

float (*static Float._jvpNegate(x:)())(float a1)
{
  return closure #1 in static Float._jvpNegate(x:);
}

float closure #1 in static Float._jvpNegate(x:)(float a1)
{
  return -a1;
}

void (*static Float._vjpAdd(lhs:rhs:)())()
{
  return closure #1 in static Float16._vjpAdd(lhs:rhs:);
}

float (*static Float._jvpAdd(lhs:rhs:)())(float a1, float a2)
{
  return closure #1 in static Float._jvpAdd(lhs:rhs:);
}

float closure #1 in static Float._jvpAdd(lhs:rhs:)(float a1, float a2)
{
  return a1 + a2;
}

float (*static Float._vjpAddAssign(_:_:)(float *a1, float a2))(uint64_t a1)
{
  *a1 = *a1 + a2;
  return closure #1 in static Float._vjpAddAssign(_:_:);
}

float closure #1 in static Float._vjpAddAssign(_:_:)(uint64_t a1)
{
  return *(float *)a1;
}

float (*static Float._jvpAddAssign(_:_:)(float *a1, float a2))(float *a1, float a2)
{
  *a1 = *a1 + a2;
  return closure #1 in static Float._jvpAddAssign(_:_:);
}

float closure #1 in static Float._jvpAddAssign(_:_:)(float *a1, float a2)
{
  float result = *a1 + a2;
  *a1 = result;
  return result;
}

void (*static Float._vjpSubtract(lhs:rhs:)())()
{
  return closure #1 in static Float._vjpSubtract(lhs:rhs:);
}

float (*static Float._jvpSubtract(lhs:rhs:)())(float a1, float a2)
{
  return closure #1 in static Float._jvpSubtract(lhs:rhs:);
}

float closure #1 in static Float._jvpSubtract(lhs:rhs:)(float a1, float a2)
{
  return a1 - a2;
}

float (*static Float._vjpSubtractAssign(_:_:)(float *a1, float a2))(float *a1)
{
  *a1 = *a1 - a2;
  return closure #1 in static Float._vjpSubtractAssign(_:_:);
}

float closure #1 in static Float._vjpSubtractAssign(_:_:)(float *a1)
{
  return -*a1;
}

float (*static Float._jvpSubtractAssign(_:_:)(float *a1, float a2))(float *a1, float a2)
{
  *a1 = *a1 - a2;
  return closure #1 in static Float._jvpSubtractAssign(_:_:);
}

float closure #1 in static Float._jvpSubtractAssign(_:_:)(float *a1, float a2)
{
  float result = *a1 - a2;
  *a1 = result;
  return result;
}

float static Float._vjpMultiply(lhs:rhs:)(float a1, float a2)
{
  float v4 = a1 * a2;
  uint64_t v5 = swift_allocObject();
  *(float *)(v5 + 16) = a2;
  *(float *)(v5 + 20) = a1;
  return v4;
}

float reverse-mode derivative of static Float.* infix(_:_:)(float a1, float a2)
{
  float v4 = a1 * a2;
  uint64_t v5 = swift_allocObject();
  *(float *)(v5 + 16) = a2;
  *(float *)(v5 + 20) = a1;
  return v4;
}

float static Float._jvpMultiply(lhs:rhs:)(float a1, float a2)
{
  float v4 = a1 * a2;
  uint64_t v5 = swift_allocObject();
  *(float *)(v5 + 16) = a1;
  *(float *)(v5 + 20) = a2;
  return v4;
}

float forward-mode derivative of static Float.* infix(_:_:)(float a1, float a2)
{
  float v4 = a1 * a2;
  uint64_t v5 = swift_allocObject();
  *(float *)(v5 + 16) = a1;
  *(float *)(v5 + 20) = a2;
  return v4;
}

float (*static Float._vjpMultiplyAssign(_:_:)(float *a1, float a2))(float *a1)
{
  float v4 = *a1;
  uint64_t v5 = swift_allocObject();
  *(float *)(v5 + 16) = v4;
  *(float *)(v5 + 20) = a2;
  *a1 = v4 * a2;
  return partial apply for closure #1 in static Float._vjpMultiplyAssign(_:_:);
}

uint64_t (*reverse-mode derivative of static Float.*= infix(_:_:)(float *a1, float a2))()
{
  float v4 = *a1;
  uint64_t v5 = swift_allocObject();
  *(float *)(v5 + 16) = v4;
  *(float *)(v5 + 20) = a2;
  *a1 = v4 * a2;
  return closure #1 in static Float._vjpMultiplyAssign(_:_:)partial apply;
}

float (*static Float._jvpMultiplyAssign(_:_:)(float *a1, float a2))(float *a1, float a2)
{
  float v3 = *a1;
  *a1 = *a1 * a2;
  uint64_t v4 = swift_allocObject();
  *(float *)(v4 + 16) = a2;
  *(float *)(v4 + 20) = v3;
  return partial apply for closure #1 in static Float._jvpMultiplyAssign(_:_:);
}

uint64_t (*forward-mode derivative of static Float.*= infix(_:_:)(float *a1, float a2))()
{
  float v3 = *a1;
  *a1 = *a1 * a2;
  uint64_t v4 = swift_allocObject();
  *(float *)(v4 + 16) = a2;
  *(float *)(v4 + 20) = v3;
  return closure #1 in static Float._jvpMultiplyAssign(_:_:)partial apply;
}

float static Float._vjpDivide(lhs:rhs:)(float a1, float a2)
{
  float v4 = a1 / a2;
  uint64_t v5 = swift_allocObject();
  *(float *)(v5 + 16) = a2;
  *(float *)(v5 + 20) = a1;
  return v4;
}

float reverse-mode derivative of static Float./ infix(_:_:)(float a1, float a2)
{
  float v4 = a1 / a2;
  uint64_t v5 = swift_allocObject();
  *(float *)(v5 + 16) = a2;
  *(float *)(v5 + 20) = a1;
  return v4;
}

float static Float._jvpDivide(lhs:rhs:)(float a1, float a2)
{
  float v4 = a1 / a2;
  uint64_t v5 = swift_allocObject();
  *(float *)(v5 + 16) = a2;
  *(float *)(v5 + 20) = a1;
  return v4;
}

float forward-mode derivative of static Float./ infix(_:_:)(float a1, float a2)
{
  float v4 = a1 / a2;
  uint64_t v5 = swift_allocObject();
  *(float *)(v5 + 16) = a2;
  *(float *)(v5 + 20) = a1;
  return v4;
}

uint64_t (*static Float._vjpDivideAssign(_:_:)(float *a1, float a2))()
{
  float v4 = *a1;
  uint64_t v5 = swift_allocObject();
  *(float *)(v5 + 16) = v4;
  *(float *)(v5 + 20) = a2;
  *a1 = v4 / a2;
  return partial apply for closure #1 in static Float._vjpDivideAssign(_:_:);
}

uint64_t (*reverse-mode derivative of static Float./= infix(_:_:)(float *a1, float a2))()
{
  float v4 = *a1;
  uint64_t v5 = swift_allocObject();
  *(float *)(v5 + 16) = v4;
  *(float *)(v5 + 20) = a2;
  *a1 = v4 / a2;
  return partial apply for closure #1 in static Float._vjpDivideAssign(_:_:);
}

uint64_t (*static Float._jvpDivideAssign(_:_:)(float *a1, float a2))()
{
  float v3 = *a1;
  *a1 = *a1 / a2;
  uint64_t v4 = swift_allocObject();
  *(float *)(v4 + 16) = a2;
  *(float *)(v4 + 20) = v3;
  return partial apply for closure #1 in static Float._jvpDivideAssign(_:_:);
}

uint64_t (*forward-mode derivative of static Float./= infix(_:_:)(float *a1, float a2))()
{
  float v3 = *a1;
  *a1 = *a1 / a2;
  uint64_t v4 = swift_allocObject();
  *(float *)(v4 + 16) = a2;
  *(float *)(v4 + 20) = v3;
  return partial apply for closure #1 in static Float._jvpDivideAssign(_:_:);
}

Swift::Void __swiftcall Double.move(by:)(Swift::Double by)
{
  *uint64_t v1 = *v1 + by;
}

double protocol witness for Differentiable.move(by:) in conformance Double(double *a1)
{
  double result = *a1 + *v1;
  *uint64_t v1 = result;
  return result;
}

__int16 (*static Double._vjpInit(x:)(__n128 _Q0))@<H0>(double _D0@<D0>)
{
  __asm { FCVT            D0, H0 }
  return closure #1 in static Double._vjpInit(x:);
}

__int16 closure #1 in static Double._vjpInit(x:)@<H0>(double _D0@<D0>)
{
  __asm { FCVT            H0, D0 }
  return result;
}

double (*static Double._jvpInit(x:)(__n128 _Q0))(__n128 _Q0)
{
  __asm { FCVT            D0, H0 }
  return closure #1 in static Double._jvpInit(x:);
}

double closure #1 in static Double._jvpInit(x:)(__n128 _Q0)
{
  __asm { FCVT            D0, H0 }
  return result;
}

float (*static Double._vjpInit(x:)())(double a1)
{
  return closure #1 in static Double._vjpInit(x:);
}

float closure #1 in static Double._vjpInit(x:)(double a1)
{
  return a1;
}

double (*static Double._jvpInit(x:)())(float a1)
{
  return closure #1 in static Double._jvpInit(x:);
}

double closure #1 in static Double._jvpInit(x:)(float a1)
{
  return a1;
}

uint64_t (*static Double._vjpInit(x:)())()
{
  return _ConcreteDerivativeBox._base.modify;
}

uint64_t (*static Double._jvpInit(x:)())()
{
  return _ConcreteDerivativeBox._base.modify;
}

uint64_t (*static Double._vjpNegate(x:)())()
{
  return closure #1 in static Double._vjpNegate(x:);
}

double (*static Double._jvpNegate(x:)())(double a1)
{
  return closure #1 in static Double._jvpNegate(x:);
}

double closure #1 in static Double._jvpNegate(x:)(double a1)
{
  return -a1;
}

void (*static Double._vjpAdd(lhs:rhs:)())()
{
  return closure #1 in static Double._vjpAdd(lhs:rhs:);
}

double (*static Double._jvpAdd(lhs:rhs:)())(double a1, double a2)
{
  return closure #1 in static Double._jvpAdd(lhs:rhs:);
}

double closure #1 in static Double._jvpAdd(lhs:rhs:)(double a1, double a2)
{
  return a1 + a2;
}

double (*static Double._vjpAddAssign(_:_:)(double *a1, double a2))(uint64_t a1)
{
  *a1 = *a1 + a2;
  return closure #1 in static Double._vjpAddAssign(_:_:);
}

double closure #1 in static Double._vjpAddAssign(_:_:)(uint64_t a1)
{
  return *(double *)a1;
}

double (*static Double._jvpAddAssign(_:_:)(double *a1, double a2))(double *a1, double a2)
{
  *a1 = *a1 + a2;
  return closure #1 in static Double._jvpAddAssign(_:_:);
}

double closure #1 in static Double._jvpAddAssign(_:_:)(double *a1, double a2)
{
  double result = *a1 + a2;
  *a1 = result;
  return result;
}

void (*static Double._vjpSubtract(lhs:rhs:)())()
{
  return closure #1 in static Double._vjpSubtract(lhs:rhs:);
}

double (*static Double._jvpSubtract(lhs:rhs:)())(double a1, double a2)
{
  return closure #1 in static Double._jvpSubtract(lhs:rhs:);
}

double closure #1 in static Double._jvpSubtract(lhs:rhs:)(double a1, double a2)
{
  return a1 - a2;
}

double (*static Double._vjpSubtractAssign(_:_:)(double *a1, double a2))(double *a1)
{
  *a1 = *a1 - a2;
  return closure #1 in static Double._vjpSubtractAssign(_:_:);
}

double closure #1 in static Double._vjpSubtractAssign(_:_:)(double *a1)
{
  return -*a1;
}

double (*static Double._jvpSubtractAssign(_:_:)(double *a1, double a2))(double *a1, double a2)
{
  *a1 = *a1 - a2;
  return closure #1 in static Double._jvpSubtractAssign(_:_:);
}

double closure #1 in static Double._jvpSubtractAssign(_:_:)(double *a1, double a2)
{
  double result = *a1 - a2;
  *a1 = result;
  return result;
}

double static Double._vjpMultiply(lhs:rhs:)(double a1, double a2)
{
  double v4 = a1 * a2;
  uint64_t v5 = swift_allocObject();
  *(double *)(v5 + 16) = a2;
  *(double *)(v5 + 24) = a1;
  return v4;
}

double reverse-mode derivative of static Double.* infix(_:_:)(double a1, double a2)
{
  double v4 = a1 * a2;
  uint64_t v5 = swift_allocObject();
  *(double *)(v5 + 16) = a2;
  *(double *)(v5 + 24) = a1;
  return v4;
}

double static Double._jvpMultiply(lhs:rhs:)(double a1, double a2)
{
  double v4 = a1 * a2;
  uint64_t v5 = swift_allocObject();
  *(double *)(v5 + 16) = a1;
  *(double *)(v5 + 24) = a2;
  return v4;
}

double forward-mode derivative of static Double.* infix(_:_:)(double a1, double a2)
{
  double v4 = a1 * a2;
  uint64_t v5 = swift_allocObject();
  *(double *)(v5 + 16) = a1;
  *(double *)(v5 + 24) = a2;
  return v4;
}

double (*static Double._vjpMultiplyAssign(_:_:)(double *a1, double a2))(double *a1)
{
  double v4 = *a1;
  uint64_t v5 = swift_allocObject();
  *(double *)(v5 + 16) = v4;
  *(double *)(v5 + 24) = a2;
  *a1 = v4 * a2;
  return partial apply for closure #1 in static Double._vjpMultiplyAssign(_:_:);
}

uint64_t (*reverse-mode derivative of static Double.*= infix(_:_:)(double *a1, double a2))()
{
  double v4 = *a1;
  uint64_t v5 = swift_allocObject();
  *(double *)(v5 + 16) = v4;
  *(double *)(v5 + 24) = a2;
  *a1 = v4 * a2;
  return closure #1 in static Double._vjpMultiplyAssign(_:_:)partial apply;
}

double (*static Double._jvpMultiplyAssign(_:_:)(double *a1, double a2))(double *a1, double a2)
{
  double v3 = *a1;
  *a1 = *a1 * a2;
  uint64_t v4 = swift_allocObject();
  *(double *)(v4 + 16) = a2;
  *(double *)(v4 + 24) = v3;
  return partial apply for closure #1 in static Double._jvpMultiplyAssign(_:_:);
}

uint64_t (*forward-mode derivative of static Double.*= infix(_:_:)(double *a1, double a2))()
{
  double v3 = *a1;
  *a1 = *a1 * a2;
  uint64_t v4 = swift_allocObject();
  *(double *)(v4 + 16) = a2;
  *(double *)(v4 + 24) = v3;
  return closure #1 in static Double._jvpMultiplyAssign(_:_:)partial apply;
}

double static Double._vjpDivide(lhs:rhs:)(double a1, double a2)
{
  double v4 = a1 / a2;
  uint64_t v5 = swift_allocObject();
  *(double *)(v5 + 16) = a2;
  *(double *)(v5 + 24) = a1;
  return v4;
}

double reverse-mode derivative of static Double./ infix(_:_:)(double a1, double a2)
{
  double v4 = a1 / a2;
  uint64_t v5 = swift_allocObject();
  *(double *)(v5 + 16) = a2;
  *(double *)(v5 + 24) = a1;
  return v4;
}

double static Double._jvpDivide(lhs:rhs:)(double a1, double a2)
{
  double v4 = a1 / a2;
  uint64_t v5 = swift_allocObject();
  *(double *)(v5 + 16) = a2;
  *(double *)(v5 + 24) = a1;
  return v4;
}

double forward-mode derivative of static Double./ infix(_:_:)(double a1, double a2)
{
  double v4 = a1 / a2;
  uint64_t v5 = swift_allocObject();
  *(double *)(v5 + 16) = a2;
  *(double *)(v5 + 24) = a1;
  return v4;
}

uint64_t (*static Double._vjpDivideAssign(_:_:)(double *a1, double a2))()
{
  double v4 = *a1;
  uint64_t v5 = swift_allocObject();
  *(double *)(v5 + 16) = v4;
  *(double *)(v5 + 24) = a2;
  *a1 = v4 / a2;
  return partial apply for closure #1 in static Double._vjpDivideAssign(_:_:);
}

uint64_t (*reverse-mode derivative of static Double./= infix(_:_:)(double *a1, double a2))()
{
  double v4 = *a1;
  uint64_t v5 = swift_allocObject();
  *(double *)(v5 + 16) = v4;
  *(double *)(v5 + 24) = a2;
  *a1 = v4 / a2;
  return partial apply for closure #1 in static Double._vjpDivideAssign(_:_:);
}

uint64_t (*static Double._jvpDivideAssign(_:_:)(double *a1, double a2))()
{
  double v3 = *a1;
  *a1 = *a1 / a2;
  uint64_t v4 = swift_allocObject();
  *(double *)(v4 + 16) = a2;
  *(double *)(v4 + 24) = v3;
  return partial apply for closure #1 in static Double._jvpDivideAssign(_:_:);
}

uint64_t (*forward-mode derivative of static Double./= infix(_:_:)(double *a1, double a2))()
{
  double v3 = *a1;
  *a1 = *a1 / a2;
  uint64_t v4 = swift_allocObject();
  *(double *)(v4 + 16) = a2;
  *(double *)(v4 + 24) = v3;
  return partial apply for closure #1 in static Double._jvpDivideAssign(_:_:);
}

uint64_t (*FloatingPoint<>._vjpAddingProduct(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6))(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v24 = a6;
  uint64_t v10 = *(void *)(a4 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  uint64_t v12 = MEMORY[0x270FA5388](a1);
  uint64_t v13 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v23 - v14;
  dispatch thunk of FloatingPoint.addingProduct(_:_:)();
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v16(v15, a3, a4);
  v16(v13, a2, a4);
  uint64_t v17 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v18 = (v17 + 40) & ~v17;
  uint64_t v19 = (v11 + v17 + v18) & ~v17;
  uint64_t v20 = (char *)swift_allocObject();
  *((void *)v20 + 2) = a4;
  *((void *)v20 + 3) = a5;
  *((void *)v20 + 4) = v24;
  char v21 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
  v21(&v20[v18], v15, a4);
  v21(&v20[v19], v13, a4);
  return partial apply for closure #1 in FloatingPoint<>._vjpAddingProduct(_:_:);
}

uint64_t closure #1 in FloatingPoint<>._vjpAddingProduct(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return dispatch thunk of static Numeric.* infix(_:_:)();
}

uint64_t (*reverse-mode derivative of FloatingPoint.addingProduct(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  FloatingPoint<>._vjpAddingProduct(_:_:)(a1, a2, a3, a4, a5, a6);
  uint64_t v10 = v9;
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a4;
  _OWORD v11[3] = a5;
  v11[4] = a6;
  v11[5] = partial apply for closure #1 in FloatingPoint<>._vjpAddingProduct(_:_:);
  void v11[6] = v10;
  return partial apply for autodiff self-reordering reabstraction thunk for @escaping @callee_guaranteed (@in_guaranteed A) -> (@out A, @out A, @out A);
}

uint64_t (*FloatingPoint<>._vjpSquareRoot()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4))()
{
  uint64_t v8 = *(void *)(a2 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v10 = MEMORY[0x270FA5388](a1);
  uint64_t v11 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v18 - v12;
  dispatch thunk of FloatingPoint.squareRoot()();
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 16))(a1, v13, a2);
  uint64_t v14 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
  v14(v11, v13, a2);
  unint64_t v15 = (*(unsigned __int8 *)(v8 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v16 = (char *)swift_allocObject();
  *((void *)v16 + 2) = a2;
  *((void *)v16 + 3) = a3;
  *((void *)v16 + 4) = a4;
  v14(&v16[v15], v11, a2);
  return partial apply for closure #1 in FloatingPoint<>._vjpSquareRoot();
}

uint64_t (*reverse-mode derivative of FloatingPoint.squareRoot()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4))()
{
  return partial apply for closure #1 in FloatingPoint<>._vjpSquareRoot();
}

uint64_t (*static FloatingPoint<>._vjpMinimum(_:_:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6))()
{
  char v21 = a1;
  uint64_t v11 = *(void *)(a4 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v14 = dispatch thunk of static Comparable.<= infix(_:_:)();
  unint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v15(v13, a3, a4);
  if (v14)
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, a4);
    uint64_t v16 = partial apply for closure #1 in static FloatingPoint<>._vjpMinimum(_:_:);
  }
  else
  {
    uint64_t v20 = a6;
    char v17 = dispatch thunk of FloatingPoint.isNaN.getter();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, a4);
    if (v17)
    {
      uint64_t v16 = partial apply for closure #1 in static FloatingPoint<>._vjpMinimum(_:_:);
    }
    else
    {
      uint64_t v16 = partial apply for closure #2 in static FloatingPoint<>._vjpMinimum(_:_:);
      a2 = a3;
    }
    a6 = v20;
  }
  v15(v21, a2, a4);
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = a4;
  _OWORD v18[3] = a5;
  v18[4] = a6;
  return v16;
}

uint64_t (*reverse-mode derivative of static FloatingPoint.minimum(_:_:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6))()
{
  return static FloatingPoint<>._vjpMinimum(_:_:)(a1, a2, a3, a4, a5, a6);
}

uint64_t (*static FloatingPoint<>._vjpMaximum(_:_:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v21 = a1;
  uint64_t v11 = *(void *)(a4 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v14 = dispatch thunk of static Comparable.> infix(_:_:)();
  unint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v15(v13, a3, a4);
  if (v14)
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, a4);
    uint64_t v16 = partial apply for closure #1 in static FloatingPoint<>._vjpMaximum(_:_:);
  }
  else
  {
    uint64_t v20 = a6;
    char v17 = dispatch thunk of FloatingPoint.isNaN.getter();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, a4);
    if (v17)
    {
      uint64_t v16 = partial apply for closure #1 in static FloatingPoint<>._vjpMaximum(_:_:);
    }
    else
    {
      uint64_t v16 = partial apply for closure #2 in static FloatingPoint<>._vjpMaximum(_:_:);
      a2 = a3;
    }
    a6 = v20;
  }
  v15(v21, a2, a4);
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = a4;
  _OWORD v18[3] = a5;
  v18[4] = a6;
  return v16;
}

uint64_t closure #1 in static FloatingPoint<>._vjpMinimum(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return dispatch thunk of static AdditiveArithmetic.zero.getter();
}

uint64_t closure #2 in static FloatingPoint<>._vjpMinimum(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_getAssociatedConformanceWitness();
  dispatch thunk of static AdditiveArithmetic.zero.getter();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a4 - 8) + 16);

  return v7(a2, a3, a4);
}

uint64_t (*reverse-mode derivative of static FloatingPoint.maximum(_:_:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return static FloatingPoint<>._vjpMaximum(_:_:)(a1, a2, a3, a4, a5, a6);
}

uint64_t (*_jvpFma<A>(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v25 = a7;
  uint64_t v11 = *(void *)(a5 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  uint64_t v13 = MEMORY[0x270FA5388](a1);
  char v14 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v24 - v15;
  dispatch thunk of FloatingPoint.addingProduct(_:_:)();
  char v17 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v17(v16, a3, a5);
  v17(v14, a2, a5);
  uint64_t v18 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v19 = (v18 + 40) & ~v18;
  uint64_t v20 = (v12 + v18 + v19) & ~v18;
  char v21 = (char *)swift_allocObject();
  *((void *)v21 + 2) = a5;
  *((void *)v21 + 3) = a6;
  *((void *)v21 + 4) = v25;
  uint64_t v22 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
  v22(&v21[v19], v16, a5);
  v22(&v21[v20], v14, a5);
  return partial apply for closure #1 in _jvpFma<A>(_:_:_:);
}

uint64_t closure #1 in _jvpFma<A>(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v18[1] = a3;
  uint64_t v7 = *(void *)(a6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](a1);
  uint64_t v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)v18 - v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)v18 - v14;
  dispatch thunk of static Numeric.* infix(_:_:)();
  dispatch thunk of static Numeric.* infix(_:_:)();
  swift_getAssociatedConformanceWitness();
  dispatch thunk of static AdditiveArithmetic.+ infix(_:_:)();
  uint64_t v16 = *(void (**)(char *, uint64_t))(v7 + 8);
  v16(v10, a6);
  v16(v13, a6);
  dispatch thunk of static AdditiveArithmetic.+ infix(_:_:)();
  return ((uint64_t (*)(char *, uint64_t))v16)(v15, a6);
}

uint64_t (*forward-mode derivative of fma<A>(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return partial apply for closure #1 in _jvpFma<A>(_:_:_:);
}

uint64_t (*_vjpFma<A>(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7))(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v25 = a7;
  uint64_t v11 = *(void *)(a5 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  uint64_t v13 = MEMORY[0x270FA5388](a1);
  uint64_t v14 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v24 - v15;
  dispatch thunk of FloatingPoint.addingProduct(_:_:)();
  char v17 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v17(v16, a3, a5);
  v17(v14, a2, a5);
  uint64_t v18 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v19 = (v18 + 40) & ~v18;
  uint64_t v20 = (v12 + v18 + v19) & ~v18;
  char v21 = (char *)swift_allocObject();
  *((void *)v21 + 2) = a5;
  *((void *)v21 + 3) = a6;
  *((void *)v21 + 4) = v25;
  uint64_t v22 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
  v22(&v21[v19], v16, a5);
  v22(&v21[v20], v14, a5);
  return partial apply for closure #1 in _vjpFma<A>(_:_:_:);
}

uint64_t closure #1 in _vjpFma<A>(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  dispatch thunk of static Numeric.* infix(_:_:)();
  dispatch thunk of static Numeric.* infix(_:_:)();
  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a7 - 8) + 16);

  return v10(a3, a4, a7);
}

uint64_t (*reverse-mode derivative of fma<A>(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7))(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return partial apply for closure #1 in _vjpFma<A>(_:_:_:);
}

void _jvpRemainder<A>(_:_:)()
{
}

void forward-mode derivative of remainder<A>(_:_:)()
{
}

uint64_t (*_vjpRemainder<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v24 = a6;
  uint64_t v10 = *(void *)(a4 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  uint64_t v12 = MEMORY[0x270FA5388](a1);
  uint64_t v13 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v23 - v14;
  dispatch thunk of FloatingPoint.remainder(dividingBy:)();
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v16(v15, a2, a4);
  v16(v13, a3, a4);
  uint64_t v17 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v18 = (v17 + 40) & ~v17;
  uint64_t v19 = (v11 + v17 + v18) & ~v17;
  uint64_t v20 = (char *)swift_allocObject();
  *((void *)v20 + 2) = a4;
  *((void *)v20 + 3) = a5;
  *((void *)v20 + 4) = v24;
  char v21 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
  v21(&v20[v18], v15, a4);
  v21(&v20[v19], v13, a4);
  return partial apply for closure #1 in _vjpRemainder<A>(_:_:);
}

uint64_t (*reverse-mode derivative of remainder<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return partial apply for closure #1 in _vjpRemainder<A>(_:_:);
}

void _jvpFmod<A>(_:_:)()
{
}

void forward-mode derivative of fmod<A>(_:_:)()
{
}

uint64_t (*_vjpFmod<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v24 = a6;
  uint64_t v10 = *(void *)(a4 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  uint64_t v12 = MEMORY[0x270FA5388](a1);
  uint64_t v13 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v23 - v14;
  dispatch thunk of FloatingPoint.truncatingRemainder(dividingBy:)();
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v16(v15, a2, a4);
  v16(v13, a3, a4);
  uint64_t v17 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v18 = (v17 + 40) & ~v17;
  uint64_t v19 = (v11 + v17 + v18) & ~v17;
  uint64_t v20 = (char *)swift_allocObject();
  *((void *)v20 + 2) = a4;
  *((void *)v20 + 3) = a5;
  *((void *)v20 + 4) = v24;
  char v21 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
  v21(&v20[v18], v15, a4);
  v21(&v20[v19], v13, a4);
  return partial apply for closure #1 in _vjpFmod<A>(_:_:);
}

uint64_t closure #1 in _vjpRemainder<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned int *a9)
{
  v29[1] = a4;
  uint64_t v33 = a2;
  uint64_t v31 = a5;
  uint64_t v32 = a9;
  uint64_t v30 = type metadata accessor for FloatingPointRoundingRule();
  uint64_t v13 = *(void *)(v30 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v30);
  uint64_t v16 = (char *)v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = *(void *)(a6 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v14);
  uint64_t v20 = (char *)v29 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x270FA5388](v18);
  uint64_t v23 = (char *)v29 - v22;
  MEMORY[0x270FA5388](v21);
  uint64_t v25 = (char *)v29 - v24;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(a1, a3, a6);
  v29[0] = *(void *)(a7 + 16);
  dispatch thunk of static SignedNumeric.- prefix(_:)();
  dispatch thunk of static FloatingPoint./ infix(_:_:)();
  uint64_t v26 = v30;
  (*(void (**)(char *, void, uint64_t))(v13 + 104))(v16, *v32, v30);
  dispatch thunk of FloatingPoint.rounded(_:)();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v26);
  uint64_t v27 = *(void (**)(char *, uint64_t))(v17 + 8);
  v27(v20, a6);
  dispatch thunk of static Numeric.* infix(_:_:)();
  v27(v23, a6);
  return ((uint64_t (*)(char *, uint64_t))v27)(v25, a6);
}

uint64_t (*reverse-mode derivative of fmod<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return partial apply for closure #1 in _vjpFmod<A>(_:_:);
}

uint64_t (*_jvpSqrt<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  uint64_t v9 = *(void *)(a3 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  uint64_t v11 = MEMORY[0x270FA5388](a1);
  uint64_t v12 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v19 - v13;
  dispatch thunk of FloatingPoint.squareRoot()();
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 16))(a1, v14, a3);
  uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
  v15(v12, v14, a3);
  unint64_t v16 = (*(unsigned __int8 *)(v9 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v17 = (char *)swift_allocObject();
  *((void *)v17 + 2) = a3;
  *((void *)v17 + 3) = a4;
  *((void *)v17 + 4) = a5;
  v15(&v17[v16], v12, a3);
  return partial apply for closure #1 in FloatingPoint<>._vjpSquareRoot();
}

uint64_t (*forward-mode derivative of sqrt<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  return partial apply for closure #1 in FloatingPoint<>._vjpSquareRoot();
}

uint64_t (*_jvpCeil<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  uint64_t v8 = type metadata accessor for FloatingPointRoundingRule();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x263F8E218], v8);
  dispatch thunk of FloatingPoint.rounded(_:)();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = a5;
  return partial apply for closure #1 in _jvpCeil<A>(_:);
}

uint64_t (*forward-mode derivative of ceil<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  return partial apply for closure #1 in _jvpCeil<A>(_:);
}

uint64_t (*_jvpFloor<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  uint64_t v8 = type metadata accessor for FloatingPointRoundingRule();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x263F8E220], v8);
  dispatch thunk of FloatingPoint.rounded(_:)();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = a5;
  return partial apply for closure #1 in _jvpFloor<A>(_:);
}

uint64_t (*forward-mode derivative of floor<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  return partial apply for closure #1 in _jvpFloor<A>(_:);
}

uint64_t (*_jvpRound<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  uint64_t v8 = type metadata accessor for FloatingPointRoundingRule();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x263F8E210], v8);
  dispatch thunk of FloatingPoint.rounded(_:)();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = a5;
  return partial apply for closure #1 in _jvpFloor<A>(_:);
}

uint64_t (*forward-mode derivative of round<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  return partial apply for closure #1 in _jvpFloor<A>(_:);
}

uint64_t (*_jvpTrunc<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  uint64_t v8 = type metadata accessor for FloatingPointRoundingRule();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x263F8E1F8], v8);
  dispatch thunk of FloatingPoint.rounded(_:)();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = a5;
  return partial apply for closure #1 in _jvpFloor<A>(_:);
}

uint64_t (*forward-mode derivative of trunc<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  return partial apply for closure #1 in _jvpFloor<A>(_:);
}

uint64_t (*_vjpSqrt<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  uint64_t v9 = *(void *)(a3 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  uint64_t v11 = MEMORY[0x270FA5388](a1);
  uint64_t v12 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v19 - v13;
  dispatch thunk of FloatingPoint.squareRoot()();
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 16))(a1, v14, a3);
  uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
  v15(v12, v14, a3);
  unint64_t v16 = (*(unsigned __int8 *)(v9 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v17 = (char *)swift_allocObject();
  *((void *)v17 + 2) = a3;
  *((void *)v17 + 3) = a4;
  *((void *)v17 + 4) = a5;
  v15(&v17[v16], v12, a3);
  return partial apply for closure #1 in FloatingPoint<>._vjpSquareRoot();
}

uint64_t closure #1 in FloatingPoint<>._vjpSquareRoot()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  v15[1] = a2;
  v15[2] = a4;
  _OWORD v15[3] = a1;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v6 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v7 = *(void *)(a3 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v15 - v11;
  swift_getAssociatedConformanceWitness();
  dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
  dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
  dispatch thunk of static Numeric.* infix(_:_:)();
  uint64_t v13 = *(void (**)(char *, uint64_t))(v7 + 8);
  v13(v10, a3);
  dispatch thunk of static FloatingPoint./ infix(_:_:)();
  return ((uint64_t (*)(char *, uint64_t))v13)(v12, a3);
}

uint64_t (*reverse-mode derivative of sqrt<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  return partial apply for closure #1 in FloatingPoint<>._vjpSquareRoot();
}

uint64_t (*_vjpCeil<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  uint64_t v8 = type metadata accessor for FloatingPointRoundingRule();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x263F8E218], v8);
  dispatch thunk of FloatingPoint.rounded(_:)();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = a5;
  return partial apply for closure #1 in _jvpFloor<A>(_:);
}

uint64_t (*reverse-mode derivative of ceil<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  return partial apply for closure #1 in _jvpFloor<A>(_:);
}

uint64_t (*_vjpFloor<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  uint64_t v8 = type metadata accessor for FloatingPointRoundingRule();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x263F8E220], v8);
  dispatch thunk of FloatingPoint.rounded(_:)();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = a5;
  return partial apply for closure #1 in _jvpFloor<A>(_:);
}

uint64_t (*reverse-mode derivative of floor<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  return partial apply for closure #1 in _jvpFloor<A>(_:);
}

uint64_t (*_vjpRound<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  uint64_t v8 = type metadata accessor for FloatingPointRoundingRule();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x263F8E210], v8);
  dispatch thunk of FloatingPoint.rounded(_:)();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = a5;
  return partial apply for closure #1 in _jvpFloor<A>(_:);
}

uint64_t (*reverse-mode derivative of round<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  return partial apply for closure #1 in _jvpFloor<A>(_:);
}

uint64_t (*_vjpTrunc<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  uint64_t v8 = type metadata accessor for FloatingPointRoundingRule();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x263F8E1F8], v8);
  dispatch thunk of FloatingPoint.rounded(_:)();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = a5;
  return partial apply for closure #1 in _jvpFloor<A>(_:);
}

uint64_t closure #1 in _jvpCeil<A>(_:)()
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  swift_getAssociatedConformanceWitness();
  dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
  return dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
}

uint64_t (*reverse-mode derivative of trunc<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  return partial apply for closure #1 in _jvpFloor<A>(_:);
}

double _jvpFma(_:_:_:)(long double a1, long double a2, long double a3)
{
  double v5 = fma(a1, a2, a3);
  uint64_t v6 = swift_allocObject();
  *(long double *)(v6 + 16) = a2;
  *(long double *)(v6 + 24) = a1;
  return v5;
}

double fmaTJfSSSpSr(long double a1, long double a2, long double a3)
{
  double v5 = fma(a1, a2, a3);
  uint64_t v6 = swift_allocObject();
  *(long double *)(v6 + 16) = a2;
  *(long double *)(v6 + 24) = a1;
  return v5;
}

double _vjpFma(_:_:_:)(long double a1, long double a2, long double a3)
{
  double v5 = fma(a1, a2, a3);
  uint64_t v6 = swift_allocObject();
  *(long double *)(v6 + 16) = a2;
  *(long double *)(v6 + 24) = a1;
  return v5;
}

double fmaTJrSSSpSr(long double a1, long double a2, long double a3)
{
  double v5 = fma(a1, a2, a3);
  uint64_t v6 = swift_allocObject();
  *(long double *)(v6 + 16) = a2;
  *(long double *)(v6 + 24) = a1;
  return v5;
}

void _jvpRemainder(_:_:)()
{
}

void remainderTJfSSpSr()
{
}

double _vjpRemainder(_:_:)(long double a1, long double a2)
{
  double v4 = remainder(a1, a2);
  uint64_t v5 = swift_allocObject();
  *(long double *)(v5 + 16) = a1;
  *(long double *)(v5 + 24) = a2;
  return v4;
}

double remainderTJrSSpSr(long double a1, long double a2)
{
  double v4 = remainder(a1, a2);
  uint64_t v5 = swift_allocObject();
  *(long double *)(v5 + 16) = a1;
  *(long double *)(v5 + 24) = a2;
  return v4;
}

void _jvpFmod(_:_:)()
{
}

void fmodTJfSSpSr()
{
}

double _vjpFmod(_:_:)(long double a1, long double a2)
{
  double v4 = fmod(a1, a2);
  uint64_t v5 = swift_allocObject();
  *(long double *)(v5 + 16) = a1;
  *(long double *)(v5 + 24) = a2;
  return v4;
}

double fmodTJrSSpSr(long double a1, long double a2)
{
  double v4 = fmod(a1, a2);
  uint64_t v5 = swift_allocObject();
  *(long double *)(v5 + 16) = a1;
  *(long double *)(v5 + 24) = a2;
  return v4;
}

double _jvpSqrt(_:)(double a1)
{
  double v1 = sqrt(a1);
  *(double *)(swift_allocObject() + 16) = v1;
  return v1;
}

double sqrtTJfSpSr(double a1)
{
  double v1 = sqrt(a1);
  *(double *)(swift_allocObject() + 16) = v1;
  return v1;
}

double (*_jvpCeil(_:)())()
{
  return closure #1 in _jvpCeil(_:);
}

double closure #1 in _jvpCeil(_:)()
{
  return 0.0;
}

double (*_jvpFloor(_:)())()
{
  return closure #1 in _jvpCeil(_:);
}

double (*_jvpRound(_:)())()
{
  return closure #1 in _jvpCeil(_:);
}

double (*_jvpTrunc(_:)())()
{
  return closure #1 in _jvpCeil(_:);
}

double _vjpSqrt(_:)(double a1)
{
  double v1 = sqrt(a1);
  *(double *)(swift_allocObject() + 16) = v1;
  return v1;
}

double sqrtTJrSpSr(double a1)
{
  double v1 = sqrt(a1);
  *(double *)(swift_allocObject() + 16) = v1;
  return v1;
}

double (*_vjpCeil(_:)())()
{
  return closure #1 in _jvpCeil(_:);
}

double (*_vjpFloor(_:)())()
{
  return closure #1 in _jvpCeil(_:);
}

double (*_vjpRound(_:)())()
{
  return closure #1 in _jvpCeil(_:);
}

double (*_vjpTrunc(_:)())()
{
  return closure #1 in _jvpCeil(_:);
}

float _jvpExp(_:)(float a1)
{
  float v1 = expf(a1);
  *(float *)(swift_allocObject() + 16) = v1;
  return v1;
}

float forward-mode derivative of exp(_:)(float a1)
{
  float v1 = expf(a1);
  *(float *)(swift_allocObject() + 16) = v1;
  return v1;
}

float _jvpExp2(_:)(float a1)
{
  float v1 = exp2f(a1);
  *(float *)(swift_allocObject() + 16) = v1;
  return v1;
}

float forward-mode derivative of exp2(_:)(float a1)
{
  float v1 = exp2f(a1);
  *(float *)(swift_allocObject() + 16) = v1;
  return v1;
}

float _jvpLog(_:)(float a1)
{
  float v2 = logf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float forward-mode derivative of log(_:)(float a1)
{
  float v2 = logf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _jvpLog10(_:)(float a1)
{
  float v2 = log10f(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float forward-mode derivative of log10(_:)(float a1)
{
  float v2 = log10f(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _jvpLog2(_:)(float a1)
{
  float v2 = log2f(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float forward-mode derivative of log2(_:)(float a1)
{
  float v2 = log2f(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _jvpSin(_:)(float a1)
{
  float v2 = sinf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float forward-mode derivative of sin(_:)(float a1)
{
  float v2 = sinf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _jvpCos(_:)(float a1)
{
  float v2 = cosf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float forward-mode derivative of cos(_:)(float a1)
{
  float v2 = cosf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _jvpTan(_:)(float a1)
{
  float v1 = tanf(a1);
  *(float *)(swift_allocObject() + 16) = v1;
  return v1;
}

float forward-mode derivative of tan(_:)(float a1)
{
  float v1 = tanf(a1);
  *(float *)(swift_allocObject() + 16) = v1;
  return v1;
}

float _jvpAsin(_:)(float a1)
{
  float v2 = asinf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float forward-mode derivative of asin(_:)(float a1)
{
  float v2 = asinf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _jvpAcos(_:)(float a1)
{
  float v2 = acosf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float forward-mode derivative of acos(_:)(float a1)
{
  float v2 = acosf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _jvpAtan(_:)(float a1)
{
  float v2 = atanf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float forward-mode derivative of atan(_:)(float a1)
{
  float v2 = atanf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _jvpSinh(_:)(float a1)
{
  float v2 = sinhf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float forward-mode derivative of sinh(_:)(float a1)
{
  float v2 = sinhf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _jvpCosh(_:)(float a1)
{
  float v2 = coshf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float forward-mode derivative of cosh(_:)(float a1)
{
  float v2 = coshf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _jvpTanh(_:)(float a1)
{
  float v1 = tanhf(a1);
  *(float *)(swift_allocObject() + 16) = v1;
  return v1;
}

float forward-mode derivative of tanh(_:)(float a1)
{
  float v1 = tanhf(a1);
  *(float *)(swift_allocObject() + 16) = v1;
  return v1;
}

float _jvpAsinh(_:)(float a1)
{
  float v2 = asinhf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float forward-mode derivative of asinh(_:)(float a1)
{
  float v2 = asinhf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _jvpAcosh(_:)(float a1)
{
  float v2 = acoshf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float forward-mode derivative of acosh(_:)(float a1)
{
  float v2 = acoshf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _jvpAtanh(_:)(float a1)
{
  float v2 = atanhf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float forward-mode derivative of atanh(_:)(float a1)
{
  float v2 = atanhf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _jvpExpm1(_:)(float a1)
{
  float v2 = expm1f(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float forward-mode derivative of expm1(_:)(float a1)
{
  float v2 = expm1f(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _jvpLog1p(_:)(float a1)
{
  float v2 = log1pf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float forward-mode derivative of log1p(_:)(float a1)
{
  float v2 = log1pf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _jvpErf(_:)(float a1)
{
  float v2 = erff(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float forward-mode derivative of erf(_:)(float a1)
{
  float v2 = erff(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _jvpErfc(_:)(float a1)
{
  float v2 = erfcf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float forward-mode derivative of erfc(_:)(float a1)
{
  float v2 = erfcf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _jvpExp(_:)(long double a1)
{
  double v1 = exp(a1);
  *(double *)(swift_allocObject() + 16) = v1;
  return v1;
}

double forward-mode derivative of exp(_:)(long double a1)
{
  double v1 = exp(a1);
  *(double *)(swift_allocObject() + 16) = v1;
  return v1;
}

double _jvpExp2(_:)(long double a1)
{
  double v1 = exp2(a1);
  *(double *)(swift_allocObject() + 16) = v1;
  return v1;
}

double forward-mode derivative of exp2(_:)(long double a1)
{
  double v1 = exp2(a1);
  *(double *)(swift_allocObject() + 16) = v1;
  return v1;
}

double _jvpLog(_:)(long double a1)
{
  double v2 = log(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double forward-mode derivative of log(_:)(long double a1)
{
  double v2 = log(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _jvpLog10(_:)(long double a1)
{
  double v2 = log10(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double forward-mode derivative of log10(_:)(long double a1)
{
  double v2 = log10(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _jvpLog2(_:)(long double a1)
{
  double v2 = log2(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double forward-mode derivative of log2(_:)(long double a1)
{
  double v2 = log2(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _jvpSin(_:)(long double a1)
{
  double v2 = sin(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double forward-mode derivative of sin(_:)(long double a1)
{
  double v2 = sin(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _jvpCos(_:)(long double a1)
{
  double v2 = cos(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double forward-mode derivative of cos(_:)(long double a1)
{
  double v2 = cos(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _jvpTan(_:)(long double a1)
{
  double v1 = tan(a1);
  *(double *)(swift_allocObject() + 16) = v1;
  return v1;
}

double tanTJfSpSr(long double a1)
{
  double v1 = tan(a1);
  *(double *)(swift_allocObject() + 16) = v1;
  return v1;
}

double _jvpAsin(_:)(long double a1)
{
  double v2 = asin(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double asinTJfSpSr(long double a1)
{
  double v2 = asin(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _jvpAcos(_:)(long double a1)
{
  double v2 = acos(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double acosTJfSpSr(long double a1)
{
  double v2 = acos(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _jvpAtan(_:)(long double a1)
{
  double v2 = atan(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double atanTJfSpSr(long double a1)
{
  double v2 = atan(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _jvpSinh(_:)(long double a1)
{
  double v2 = sinh(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double sinhTJfSpSr(long double a1)
{
  double v2 = sinh(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _jvpCosh(_:)(long double a1)
{
  double v2 = cosh(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double coshTJfSpSr(long double a1)
{
  double v2 = cosh(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _jvpTanh(_:)(long double a1)
{
  double v1 = tanh(a1);
  *(double *)(swift_allocObject() + 16) = v1;
  return v1;
}

double tanhTJfSpSr(long double a1)
{
  double v1 = tanh(a1);
  *(double *)(swift_allocObject() + 16) = v1;
  return v1;
}

double _jvpAsinh(_:)(long double a1)
{
  double v2 = asinh(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double asinhTJfSpSr(long double a1)
{
  double v2 = asinh(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _jvpAcosh(_:)(long double a1)
{
  double v2 = acosh(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double acoshTJfSpSr(long double a1)
{
  double v2 = acosh(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _jvpAtanh(_:)(long double a1)
{
  double v2 = atanh(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double atanhTJfSpSr(long double a1)
{
  double v2 = atanh(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _jvpExpm1(_:)(long double a1)
{
  double v2 = expm1(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double expm1TJfSpSr(long double a1)
{
  double v2 = expm1(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _jvpLog1p(_:)(long double a1)
{
  double v2 = log1p(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double log1pTJfSpSr(long double a1)
{
  double v2 = log1p(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _jvpErf(_:)(long double a1)
{
  double v2 = erf(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double erfTJfSpSr(long double a1)
{
  double v2 = erf(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _jvpErfc(_:)(long double a1)
{
  double v2 = erfc(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double erfcTJfSpSr(long double a1)
{
  double v2 = erfc(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _vjpExp(_:)(float a1)
{
  float v1 = expf(a1);
  *(float *)(swift_allocObject() + 16) = v1;
  return v1;
}

float reverse-mode derivative of exp(_:)(float a1)
{
  float v1 = expf(a1);
  *(float *)(swift_allocObject() + 16) = v1;
  return v1;
}

float _vjpExp2(_:)(float a1)
{
  float v1 = exp2f(a1);
  *(float *)(swift_allocObject() + 16) = v1;
  return v1;
}

float reverse-mode derivative of exp2(_:)(float a1)
{
  float v1 = exp2f(a1);
  *(float *)(swift_allocObject() + 16) = v1;
  return v1;
}

float _vjpLog(_:)(float a1)
{
  float v2 = logf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float reverse-mode derivative of log(_:)(float a1)
{
  float v2 = logf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _vjpLog10(_:)(float a1)
{
  float v2 = log10f(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float reverse-mode derivative of log10(_:)(float a1)
{
  float v2 = log10f(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _vjpLog2(_:)(float a1)
{
  float v2 = log2f(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float reverse-mode derivative of log2(_:)(float a1)
{
  float v2 = log2f(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _vjpSin(_:)(float a1)
{
  float v2 = sinf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float reverse-mode derivative of sin(_:)(float a1)
{
  float v2 = sinf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _vjpCos(_:)(float a1)
{
  float v2 = cosf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float reverse-mode derivative of cos(_:)(float a1)
{
  float v2 = cosf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _vjpTan(_:)(float a1)
{
  float v1 = tanf(a1);
  *(float *)(swift_allocObject() + 16) = v1;
  return v1;
}

float reverse-mode derivative of tan(_:)(float a1)
{
  float v1 = tanf(a1);
  *(float *)(swift_allocObject() + 16) = v1;
  return v1;
}

float _vjpAsin(_:)(float a1)
{
  float v2 = asinf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float reverse-mode derivative of asin(_:)(float a1)
{
  float v2 = asinf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _vjpAcos(_:)(float a1)
{
  float v2 = acosf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float reverse-mode derivative of acos(_:)(float a1)
{
  float v2 = acosf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _vjpAtan(_:)(float a1)
{
  float v2 = atanf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float reverse-mode derivative of atan(_:)(float a1)
{
  float v2 = atanf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _vjpSinh(_:)(float a1)
{
  float v2 = sinhf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float reverse-mode derivative of sinh(_:)(float a1)
{
  float v2 = sinhf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _vjpCosh(_:)(float a1)
{
  float v2 = coshf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float reverse-mode derivative of cosh(_:)(float a1)
{
  float v2 = coshf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _vjpTanh(_:)(float a1)
{
  float v1 = tanhf(a1);
  *(float *)(swift_allocObject() + 16) = v1;
  return v1;
}

float reverse-mode derivative of tanh(_:)(float a1)
{
  float v1 = tanhf(a1);
  *(float *)(swift_allocObject() + 16) = v1;
  return v1;
}

float _vjpAsinh(_:)(float a1)
{
  float v2 = asinhf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float reverse-mode derivative of asinh(_:)(float a1)
{
  float v2 = asinhf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _vjpAcosh(_:)(float a1)
{
  float v2 = acoshf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float reverse-mode derivative of acosh(_:)(float a1)
{
  float v2 = acoshf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _vjpAtanh(_:)(float a1)
{
  float v2 = atanhf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float reverse-mode derivative of atanh(_:)(float a1)
{
  float v2 = atanhf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _vjpExpm1(_:)(float a1)
{
  float v2 = expm1f(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float reverse-mode derivative of expm1(_:)(float a1)
{
  float v2 = expm1f(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _vjpLog1p(_:)(float a1)
{
  float v2 = log1pf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float reverse-mode derivative of log1p(_:)(float a1)
{
  float v2 = log1pf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _vjpErf(_:)(float a1)
{
  float v2 = erff(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float reverse-mode derivative of erf(_:)(float a1)
{
  float v2 = erff(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _vjpErfc(_:)(float a1)
{
  float v2 = erfcf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

float reverse-mode derivative of erfc(_:)(float a1)
{
  float v2 = erfcf(a1);
  *(float *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _vjpExp(_:)(long double a1)
{
  double v1 = exp(a1);
  *(double *)(swift_allocObject() + 16) = v1;
  return v1;
}

double reverse-mode derivative of exp(_:)(long double a1)
{
  double v1 = exp(a1);
  *(double *)(swift_allocObject() + 16) = v1;
  return v1;
}

double _vjpExp2(_:)(long double a1)
{
  double v1 = exp2(a1);
  *(double *)(swift_allocObject() + 16) = v1;
  return v1;
}

double reverse-mode derivative of exp2(_:)(long double a1)
{
  double v1 = exp2(a1);
  *(double *)(swift_allocObject() + 16) = v1;
  return v1;
}

double _vjpLog(_:)(long double a1)
{
  double v2 = log(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double reverse-mode derivative of log(_:)(long double a1)
{
  double v2 = log(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _vjpLog10(_:)(long double a1)
{
  double v2 = log10(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double reverse-mode derivative of log10(_:)(long double a1)
{
  double v2 = log10(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _vjpLog2(_:)(long double a1)
{
  double v2 = log2(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double reverse-mode derivative of log2(_:)(long double a1)
{
  double v2 = log2(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _vjpSin(_:)(long double a1)
{
  double v2 = sin(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double reverse-mode derivative of sin(_:)(long double a1)
{
  double v2 = sin(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _vjpCos(_:)(long double a1)
{
  double v2 = cos(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double reverse-mode derivative of cos(_:)(long double a1)
{
  double v2 = cos(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _vjpTan(_:)(long double a1)
{
  double v1 = tan(a1);
  *(double *)(swift_allocObject() + 16) = v1;
  return v1;
}

double tanTJrSpSr(long double a1)
{
  double v1 = tan(a1);
  *(double *)(swift_allocObject() + 16) = v1;
  return v1;
}

double _vjpAsin(_:)(long double a1)
{
  double v2 = asin(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double asinTJrSpSr(long double a1)
{
  double v2 = asin(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _vjpAcos(_:)(long double a1)
{
  double v2 = acos(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double acosTJrSpSr(long double a1)
{
  double v2 = acos(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _vjpAtan(_:)(long double a1)
{
  double v2 = atan(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double atanTJrSpSr(long double a1)
{
  double v2 = atan(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _vjpSinh(_:)(long double a1)
{
  double v2 = sinh(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double sinhTJrSpSr(long double a1)
{
  double v2 = sinh(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _vjpCosh(_:)(long double a1)
{
  double v2 = cosh(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double coshTJrSpSr(long double a1)
{
  double v2 = cosh(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _vjpTanh(_:)(long double a1)
{
  double v1 = tanh(a1);
  *(double *)(swift_allocObject() + 16) = v1;
  return v1;
}

double tanhTJrSpSr(long double a1)
{
  double v1 = tanh(a1);
  *(double *)(swift_allocObject() + 16) = v1;
  return v1;
}

double _vjpAsinh(_:)(long double a1)
{
  double v2 = asinh(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double asinhTJrSpSr(long double a1)
{
  double v2 = asinh(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _vjpAcosh(_:)(long double a1)
{
  double v2 = acosh(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double acoshTJrSpSr(long double a1)
{
  double v2 = acosh(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _vjpAtanh(_:)(long double a1)
{
  double v2 = atanh(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double atanhTJrSpSr(long double a1)
{
  double v2 = atanh(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _vjpExpm1(_:)(long double a1)
{
  double v2 = expm1(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double expm1TJrSpSr(long double a1)
{
  double v2 = expm1(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _vjpLog1p(_:)(long double a1)
{
  double v2 = log1p(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double log1pTJrSpSr(long double a1)
{
  double v2 = log1p(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _vjpErf(_:)(long double a1)
{
  double v2 = erf(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double erfTJrSpSr(long double a1)
{
  double v2 = erf(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double _vjpErfc(_:)(long double a1)
{
  double v2 = erfc(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

double erfcTJrSpSr(long double a1)
{
  double v2 = erfc(a1);
  *(long double *)(swift_allocObject() + 16) = a1;
  return v2;
}

float _vjpPow(_:_:)(float a1, float a2)
{
  float v4 = powf(a1, a2);
  uint64_t v5 = swift_allocObject();
  *(float *)(v5 + 16) = a2;
  *(float *)(v5 + 20) = a1;
  *(float *)(v5 + 24) = v4;
  return v4;
}

float reverse-mode derivative of pow(_:_:)(float a1, float a2)
{
  float v4 = powf(a1, a2);
  uint64_t v5 = swift_allocObject();
  *(float *)(v5 + 16) = a2;
  *(float *)(v5 + 20) = a1;
  *(float *)(v5 + 24) = v4;
  return v4;
}

float _jvpPow(_:_:)(float a1, float a2)
{
  float v4 = powf(a1, a2);
  uint64_t v5 = swift_allocObject();
  *(float *)(v5 + 16) = a2;
  *(float *)(v5 + 20) = a1;
  *(float *)(v5 + 24) = v4;
  return v4;
}

float forward-mode derivative of pow(_:_:)(float a1, float a2)
{
  float v4 = powf(a1, a2);
  uint64_t v5 = swift_allocObject();
  *(float *)(v5 + 16) = a2;
  *(float *)(v5 + 20) = a1;
  *(float *)(v5 + 24) = v4;
  return v4;
}

double _vjpPow(_:_:)(long double a1, long double a2)
{
  double v4 = pow(a1, a2);
  uint64_t v5 = swift_allocObject();
  *(long double *)(v5 + 16) = a2;
  *(long double *)(v5 + 24) = a1;
  *(double *)(v5 + 32) = v4;
  return v4;
}

double powTJrSSpSr(long double a1, long double a2)
{
  double v4 = pow(a1, a2);
  uint64_t v5 = swift_allocObject();
  *(long double *)(v5 + 16) = a2;
  *(long double *)(v5 + 24) = a1;
  *(double *)(v5 + 32) = v4;
  return v4;
}

double _jvpPow(_:_:)(long double a1, long double a2)
{
  double v4 = pow(a1, a2);
  uint64_t v5 = swift_allocObject();
  *(long double *)(v5 + 16) = a2;
  *(long double *)(v5 + 24) = a1;
  *(double *)(v5 + 32) = v4;
  return v4;
}

double powTJfSSpSr(long double a1, long double a2)
{
  double v4 = pow(a1, a2);
  uint64_t v5 = swift_allocObject();
  *(long double *)(v5 + 16) = a2;
  *(long double *)(v5 + 24) = a1;
  *(double *)(v5 + 32) = v4;
  return v4;
}

uint64_t protocol witness for static AdditiveArithmetic.zero.getter in conformance <> SIMD2<A>()
{
  return protocol witness for static AdditiveArithmetic.zero.getter in conformance <> SIMD2<A>();
}

{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  return dispatch thunk of SIMDStorage.init()();
}

uint64_t protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> SIMD2<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> SIMD2<A>(a1, a2, a3, a4, MEMORY[0x263F8DF20]);
}

uint64_t protocol witness for static AdditiveArithmetic.+= infix(_:_:) in conformance <> SIMD2<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return static SIMD<>.+= infix(_:_:)(a1, a2, a3);
}

uint64_t protocol witness for static AdditiveArithmetic.- infix(_:_:) in conformance <> SIMD2<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> SIMD2<A>(a1, a2, a3, a4, MEMORY[0x263F8DF28]);
}

uint64_t protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> SIMD2<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(char *, char *, uint64_t, uint64_t))
{
  v14[1] = a2;
  uint64_t v15 = *(void *)(a4 - 8);
  unint64_t v16 = a5;
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = MEMORY[0x270FA5388](a1);
  uint64_t v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v11 = (char *)v14 - v10;
  MEMORY[0x270FA5388](v9);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  dispatch thunk of SIMDStorage.init()();
  dispatch thunk of SIMDStorage.subscript.getter();
  dispatch thunk of SIMDStorage.subscript.getter();
  uint64_t v12 = v16;
  uint64_t v15 = *(void *)(*(void *)(*(void *)(v15 + 16) + 8) + 8);
  ((void (*)(char *, char *, uint64_t))v16)(v11, v8, v5);
  dispatch thunk of SIMDStorage.subscript.setter();
  dispatch thunk of SIMDStorage.subscript.getter();
  dispatch thunk of SIMDStorage.subscript.getter();
  v12(v11, v8, v5, v15);
  return dispatch thunk of SIMDStorage.subscript.setter();
}

uint64_t protocol witness for static AdditiveArithmetic.-= infix(_:_:) in conformance <> SIMD2<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return static SIMD<>.+= infix(_:_:)(a1, a2, a3);
}

uint64_t static SIMD<>.+= infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 - 8);
  uint64_t v6 = MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9(v6);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, a3);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(a1, v8, a3);
}

uint64_t (*SIMD2<>._vjpSubscript(_:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t a1)
{
  if (a2 >= 2)
  {
    double result = (uint64_t (*)(uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v9 = *(void *)(a3 + 16);
    uint64_t v8 = *(void *)(a3 + 24);
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.getter();
    uint64_t v10 = (void *)swift_allocObject();
    v10[2] = v9;
    v10[3] = a4;
    v10[4] = v8;
    v10[5] = a5;
    v10[6] = a2;
    return partial apply for closure #1 in SIMD2<>._vjpSubscript(_:);
  }
  return result;
}

uint64_t closure #1 in SIMD2<>._vjpSubscript(_:)(const void *a1, unint64_t a2, uint64_t a3)
{
  size_t v5 = *(void *)(*(void *)(a3 - 8) + 64);
  MEMORY[0x270FA5388](a1);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  dispatch thunk of SIMDStorage.init()();
  memcpy((char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v5);
  if (a2 < 2) {
    return dispatch thunk of SIMDStorage.subscript.setter();
  }
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t (*reverse-mode derivative of SIMD2.subscript.getter(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  SIMD2<>._vjpSubscript(_:)(a1, a2, a3, a4, a5);
  uint64_t v9 = v8;
  uint64_t v10 = (void *)swift_allocObject();
  uint64_t v11 = *(void *)(a3 + 24);
  v10[2] = *(void *)(a3 + 16);
  v10[3] = a4;
  v10[4] = v11;
  v10[5] = a5;
  v10[6] = partial apply for closure #1 in SIMD2<>._vjpSubscript(_:);
  v10[7] = v9;
  return partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A) -> (@out SIMD2<A>);
}

uint64_t (*SIMD2<>._jvpSubscript(index:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t a1)
{
  if (a2 >= 2)
  {
    uint64_t result = (uint64_t (*)(uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v9 = *(void *)(a3 + 16);
    uint64_t v8 = *(void *)(a3 + 24);
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.getter();
    uint64_t v10 = (void *)swift_allocObject();
    v10[2] = v9;
    v10[3] = a4;
    v10[4] = v8;
    v10[5] = a5;
    v10[6] = a2;
    return partial apply for closure #1 in SIMD2<>._jvpSubscript(index:);
  }
  return result;
}

uint64_t closure #1 in SIMD2<>._jvpSubscript(index:)(uint64_t a1)
{
  MEMORY[0x270FA5388](a1);
  if (v1 >= 2)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.getter();
    return dispatch thunk of BinaryFloatingPoint.init<A>(_:)();
  }
  return result;
}

uint64_t (*forward-mode derivative of SIMD2.subscript.getter(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  SIMD2<>._jvpSubscript(index:)(a1, a2, a3, a4, a5);
  uint64_t v9 = v8;
  uint64_t v10 = (void *)swift_allocObject();
  uint64_t v11 = *(void *)(a3 + 24);
  v10[2] = *(void *)(a3 + 16);
  v10[3] = a4;
  v10[4] = v11;
  v10[5] = a5;
  v10[6] = partial apply for closure #1 in SIMD2<>._jvpSubscript(index:);
  v10[7] = v9;
  return partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed SIMD2<A>) -> (@out A);
}

uint64_t (*SIMD2<>._vjpSubscriptSetter(_:_:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t a1)
{
  uint64_t v9 = *(void *)(a3 + 16);
  MEMORY[0x270FA5388](a1);
  memcpy((char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v11, v10);
  if (a2 >= 2)
  {
    uint64_t result = (uint64_t (*)(uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v12 = *(void *)(a3 + 24);
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.setter();
    uint64_t v13 = (void *)swift_allocObject();
    v13[2] = v9;
    v13[3] = a4;
    v13[4] = v12;
    v13[5] = a5;
    v13[6] = a2;
    return partial apply for closure #1 in SIMD2<>._vjpSubscriptSetter(_:_:);
  }
  return result;
}

uint64_t closure #1 in SIMD2<>._vjpSubscriptSetter(_:_:)(uint64_t a1, unint64_t a2)
{
  MEMORY[0x270FA5388](a1);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  if (a2 >= 2)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.getter();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
    dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
    return dispatch thunk of SIMDStorage.subscript.setter();
  }
  return result;
}

uint64_t (*reverse-mode derivative of SIMD2.subscript.setter(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  SIMD2<>._vjpSubscriptSetter(_:_:)(a1, a2, a3, a4, a5);
  uint64_t v9 = v8;
  size_t v10 = (void *)swift_allocObject();
  uint64_t v11 = *(void *)(a3 + 24);
  v10[2] = *(void *)(a3 + 16);
  v10[3] = a4;
  v10[4] = v11;
  v10[5] = a5;
  v10[6] = partial apply for closure #1 in SIMD2<>._vjpSubscriptSetter(_:_:);
  v10[7] = v9;
  return partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed SIMD2<A>) -> (@out A);
}

uint64_t protocol witness for static AdditiveArithmetic.zero.getter in conformance <> SIMD4<A>()
{
  return protocol witness for static AdditiveArithmetic.zero.getter in conformance <> SIMD2<A>();
}

uint64_t protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> SIMD4<A>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  return protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> SIMD4<A>(a1, a2, a3, a4, MEMORY[0x263F8DF20], a5);
}

uint64_t protocol witness for static AdditiveArithmetic.+= infix(_:_:) in conformance <> SIMD4<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return static SIMD<>.+= infix(_:_:)(a1, a2, a3);
}

uint64_t protocol witness for static AdditiveArithmetic.- infix(_:_:) in conformance <> SIMD4<A>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  return protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> SIMD4<A>(a1, a2, a3, a4, MEMORY[0x263F8DF28], a5);
}

uint64_t protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> SIMD4<A>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void (*a5)(char *, char *, uint64_t, uint64_t)@<X4>, uint64_t a6@<X8>)
{
  uint64_t v20 = a2;
  uint64_t v21 = a5;
  uint64_t v19 = a6;
  uint64_t v18 = *(void *)(a4 - 8);
  uint64_t v7 = *(void *)(a3 + 16);
  uint64_t v8 = MEMORY[0x270FA5388](a1);
  size_t v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)v17 - v12;
  MEMORY[0x270FA5388](v11);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  dispatch thunk of SIMDStorage.init()();
  v17[1] = a1;
  dispatch thunk of SIMDStorage.subscript.getter();
  dispatch thunk of SIMDStorage.subscript.getter();
  uint64_t v18 = *(void *)(*(void *)(*(void *)(v18 + 16) + 8) + 8);
  uint64_t v14 = v18;
  uint64_t v15 = v21;
  v21(v13, v10, v7, v18);
  dispatch thunk of SIMDStorage.subscript.setter();
  dispatch thunk of SIMDStorage.subscript.getter();
  dispatch thunk of SIMDStorage.subscript.getter();
  v15(v13, v10, v7, v14);
  dispatch thunk of SIMDStorage.subscript.setter();
  dispatch thunk of SIMDStorage.subscript.getter();
  dispatch thunk of SIMDStorage.subscript.getter();
  v21(v13, v10, v7, v18);
  dispatch thunk of SIMDStorage.subscript.setter();
  dispatch thunk of SIMDStorage.subscript.getter();
  dispatch thunk of SIMDStorage.subscript.getter();
  v21(v13, v10, v7, v18);
  return dispatch thunk of SIMDStorage.subscript.setter();
}

uint64_t protocol witness for static AdditiveArithmetic.-= infix(_:_:) in conformance <> SIMD4<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return static SIMD<>.+= infix(_:_:)(a1, a2, a3);
}

uint64_t (*SIMD4<>._vjpSubscript(_:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t a1)
{
  if (a2 >= 4)
  {
    uint64_t result = (uint64_t (*)(uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v9 = *(void *)(a3 + 16);
    uint64_t v8 = *(void *)(a3 + 24);
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.getter();
    size_t v10 = (void *)swift_allocObject();
    v10[2] = v9;
    v10[3] = a4;
    v10[4] = v8;
    v10[5] = a5;
    v10[6] = a2;
    return partial apply for closure #1 in SIMD4<>._vjpSubscript(_:);
  }
  return result;
}

uint64_t closure #1 in SIMD4<>._vjpSubscript(_:)(const void *a1, unint64_t a2, uint64_t a3)
{
  size_t v5 = *(void *)(*(void *)(a3 - 8) + 64);
  MEMORY[0x270FA5388](a1);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  dispatch thunk of SIMDStorage.init()();
  memcpy((char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v5);
  if (a2 < 4) {
    return dispatch thunk of SIMDStorage.subscript.setter();
  }
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t (*reverse-mode derivative of SIMD4.subscript.getter(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  SIMD4<>._vjpSubscript(_:)(a1, a2, a3, a4, a5);
  uint64_t v9 = v8;
  size_t v10 = (void *)swift_allocObject();
  uint64_t v11 = *(void *)(a3 + 24);
  v10[2] = *(void *)(a3 + 16);
  v10[3] = a4;
  v10[4] = v11;
  v10[5] = a5;
  v10[6] = partial apply for closure #1 in SIMD4<>._vjpSubscript(_:);
  v10[7] = v9;
  return partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A) -> (@out SIMD2<A>);
}

uint64_t (*SIMD4<>._jvpSubscript(index:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t a1)
{
  if (a2 >= 4)
  {
    uint64_t result = (uint64_t (*)(uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v9 = *(void *)(a3 + 16);
    uint64_t v8 = *(void *)(a3 + 24);
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.getter();
    size_t v10 = (void *)swift_allocObject();
    v10[2] = v9;
    v10[3] = a4;
    v10[4] = v8;
    v10[5] = a5;
    v10[6] = a2;
    return partial apply for closure #1 in SIMD4<>._jvpSubscript(index:);
  }
  return result;
}

uint64_t closure #1 in SIMD4<>._jvpSubscript(index:)(uint64_t a1)
{
  MEMORY[0x270FA5388](a1);
  if (v1 >= 4)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.getter();
    return dispatch thunk of BinaryFloatingPoint.init<A>(_:)();
  }
  return result;
}

uint64_t (*forward-mode derivative of SIMD4.subscript.getter(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  SIMD4<>._jvpSubscript(index:)(a1, a2, a3, a4, a5);
  uint64_t v9 = v8;
  size_t v10 = (void *)swift_allocObject();
  uint64_t v11 = *(void *)(a3 + 24);
  v10[2] = *(void *)(a3 + 16);
  v10[3] = a4;
  v10[4] = v11;
  v10[5] = a5;
  v10[6] = partial apply for closure #1 in SIMD4<>._jvpSubscript(index:);
  v10[7] = v9;
  return partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A) -> (@out SIMD2<A>);
}

uint64_t (*SIMD4<>._vjpSubscriptSetter(_:_:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t a1)
{
  uint64_t v9 = *(void *)(a3 + 16);
  MEMORY[0x270FA5388](a1);
  memcpy((char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v11, v10);
  if (a2 >= 4)
  {
    uint64_t result = (uint64_t (*)(uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v12 = *(void *)(a3 + 24);
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.setter();
    uint64_t v13 = (void *)swift_allocObject();
    v13[2] = v9;
    v13[3] = a4;
    v13[4] = v12;
    v13[5] = a5;
    v13[6] = a2;
    return partial apply for closure #1 in SIMD4<>._vjpSubscriptSetter(_:_:);
  }
  return result;
}

uint64_t closure #1 in SIMD4<>._vjpSubscriptSetter(_:_:)(uint64_t a1, unint64_t a2)
{
  MEMORY[0x270FA5388](a1);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  if (a2 >= 4)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.getter();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
    dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
    return dispatch thunk of SIMDStorage.subscript.setter();
  }
  return result;
}

uint64_t (*reverse-mode derivative of SIMD4.subscript.setter(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  SIMD4<>._vjpSubscriptSetter(_:_:)(a1, a2, a3, a4, a5);
  uint64_t v9 = v8;
  size_t v10 = (void *)swift_allocObject();
  uint64_t v11 = *(void *)(a3 + 24);
  v10[2] = *(void *)(a3 + 16);
  v10[3] = a4;
  v10[4] = v11;
  v10[5] = a5;
  v10[6] = partial apply for closure #1 in SIMD4<>._vjpSubscriptSetter(_:_:);
  v10[7] = v9;
  return partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A) -> (@out SIMD2<A>);
}

uint64_t protocol witness for static AdditiveArithmetic.zero.getter in conformance <> SIMD8<A>()
{
  return protocol witness for static AdditiveArithmetic.zero.getter in conformance <> SIMD2<A>();
}

uint64_t protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> SIMD8<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> SIMD8<A>(a1, a2, a3, a4, MEMORY[0x263F8DF20]);
}

uint64_t protocol witness for static AdditiveArithmetic.+= infix(_:_:) in conformance <> SIMD8<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return static SIMD<>.+= infix(_:_:)(a1, a2, a3);
}

uint64_t protocol witness for static AdditiveArithmetic.- infix(_:_:) in conformance <> SIMD8<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> SIMD8<A>(a1, a2, a3, a4, MEMORY[0x263F8DF28]);
}

uint64_t protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> SIMD8<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(char *, char *, uint64_t, void))
{
  void v14[2] = a2;
  uint64_t v15 = a5;
  v14[0] = *(void *)(a4 - 8);
  v14[1] = a1;
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = MEMORY[0x270FA5388](a1);
  uint64_t v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v11 = (char *)v14 - v10;
  MEMORY[0x270FA5388](v9);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  dispatch thunk of SIMDStorage.init()();
  for (uint64_t i = 0; i != 8; ++i)
  {
    dispatch thunk of SIMDStorage.subscript.getter();
    dispatch thunk of SIMDStorage.subscript.getter();
    v15(v11, v8, v5, *(void *)(*(void *)(*(void *)(v14[0] + 16) + 8) + 8));
    uint64_t result = dispatch thunk of SIMDStorage.subscript.setter();
  }
  return result;
}

uint64_t protocol witness for static AdditiveArithmetic.-= infix(_:_:) in conformance <> SIMD8<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return static SIMD<>.+= infix(_:_:)(a1, a2, a3);
}

uint64_t (*SIMD8<>._vjpSubscript(_:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t a1)
{
  if (a2 >= 8)
  {
    uint64_t result = (uint64_t (*)(uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v9 = *(void *)(a3 + 16);
    uint64_t v8 = *(void *)(a3 + 24);
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.getter();
    uint64_t v10 = (void *)swift_allocObject();
    v10[2] = v9;
    v10[3] = a4;
    v10[4] = v8;
    v10[5] = a5;
    v10[6] = a2;
    return partial apply for closure #1 in SIMD8<>._vjpSubscript(_:);
  }
  return result;
}

uint64_t closure #1 in SIMD8<>._vjpSubscript(_:)(const void *a1, unint64_t a2, uint64_t a3)
{
  size_t v5 = *(void *)(*(void *)(a3 - 8) + 64);
  MEMORY[0x270FA5388](a1);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  dispatch thunk of SIMDStorage.init()();
  memcpy((char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v5);
  if (a2 < 8) {
    return dispatch thunk of SIMDStorage.subscript.setter();
  }
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t (*reverse-mode derivative of SIMD8.subscript.getter(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  SIMD8<>._vjpSubscript(_:)(a1, a2, a3, a4, a5);
  uint64_t v9 = v8;
  uint64_t v10 = (void *)swift_allocObject();
  uint64_t v11 = *(void *)(a3 + 24);
  v10[2] = *(void *)(a3 + 16);
  v10[3] = a4;
  v10[4] = v11;
  v10[5] = a5;
  v10[6] = partial apply for closure #1 in SIMD8<>._vjpSubscript(_:);
  v10[7] = v9;
  return partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A) -> (@out SIMD2<A>);
}

uint64_t (*SIMD8<>._jvpSubscript(index:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t a1)
{
  if (a2 >= 8)
  {
    uint64_t result = (uint64_t (*)(uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v9 = *(void *)(a3 + 16);
    uint64_t v8 = *(void *)(a3 + 24);
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.getter();
    uint64_t v10 = (void *)swift_allocObject();
    v10[2] = v9;
    v10[3] = a4;
    v10[4] = v8;
    v10[5] = a5;
    v10[6] = a2;
    return partial apply for closure #1 in SIMD8<>._jvpSubscript(index:);
  }
  return result;
}

uint64_t closure #1 in SIMD8<>._jvpSubscript(index:)(uint64_t a1)
{
  MEMORY[0x270FA5388](a1);
  if (v1 >= 8)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.getter();
    return dispatch thunk of BinaryFloatingPoint.init<A>(_:)();
  }
  return result;
}

uint64_t (*forward-mode derivative of SIMD8.subscript.getter(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  SIMD8<>._jvpSubscript(index:)(a1, a2, a3, a4, a5);
  uint64_t v9 = v8;
  uint64_t v10 = (void *)swift_allocObject();
  uint64_t v11 = *(void *)(a3 + 24);
  v10[2] = *(void *)(a3 + 16);
  v10[3] = a4;
  v10[4] = v11;
  v10[5] = a5;
  v10[6] = partial apply for closure #1 in SIMD8<>._jvpSubscript(index:);
  v10[7] = v9;
  return partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A) -> (@out SIMD2<A>);
}

uint64_t (*SIMD8<>._vjpSubscriptSetter(_:_:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t a1)
{
  uint64_t v9 = *(void *)(a3 + 16);
  MEMORY[0x270FA5388](a1);
  memcpy((char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v11, v10);
  if (a2 >= 8)
  {
    uint64_t result = (uint64_t (*)(uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v12 = *(void *)(a3 + 24);
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.setter();
    uint64_t v13 = (void *)swift_allocObject();
    v13[2] = v9;
    v13[3] = a4;
    v13[4] = v12;
    v13[5] = a5;
    v13[6] = a2;
    return partial apply for closure #1 in SIMD8<>._vjpSubscriptSetter(_:_:);
  }
  return result;
}

uint64_t closure #1 in SIMD8<>._vjpSubscriptSetter(_:_:)(uint64_t a1, unint64_t a2)
{
  MEMORY[0x270FA5388](a1);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  if (a2 >= 8)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.getter();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
    dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
    return dispatch thunk of SIMDStorage.subscript.setter();
  }
  return result;
}

uint64_t (*reverse-mode derivative of SIMD8.subscript.setter(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  SIMD8<>._vjpSubscriptSetter(_:_:)(a1, a2, a3, a4, a5);
  uint64_t v9 = v8;
  size_t v10 = (void *)swift_allocObject();
  uint64_t v11 = *(void *)(a3 + 24);
  v10[2] = *(void *)(a3 + 16);
  v10[3] = a4;
  v10[4] = v11;
  v10[5] = a5;
  v10[6] = partial apply for closure #1 in SIMD8<>._vjpSubscriptSetter(_:_:);
  v10[7] = v9;
  return partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A) -> (@out SIMD2<A>);
}

uint64_t protocol witness for static AdditiveArithmetic.zero.getter in conformance <> SIMD16<A>()
{
  return protocol witness for static AdditiveArithmetic.zero.getter in conformance <> SIMD2<A>();
}

uint64_t protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> SIMD16<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> SIMD16<A>(a1, a2, a3, a4, MEMORY[0x263F8DF20]);
}

uint64_t protocol witness for static AdditiveArithmetic.+= infix(_:_:) in conformance <> SIMD16<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return static SIMD<>.+= infix(_:_:)(a1, a2, a3);
}

uint64_t protocol witness for static AdditiveArithmetic.- infix(_:_:) in conformance <> SIMD16<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> SIMD16<A>(a1, a2, a3, a4, MEMORY[0x263F8DF28]);
}

uint64_t protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> SIMD16<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(char *, char *, uint64_t, void))
{
  void v14[2] = a2;
  uint64_t v15 = a5;
  v14[0] = *(void *)(a4 - 8);
  v14[1] = a1;
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = MEMORY[0x270FA5388](a1);
  uint64_t v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v11 = (char *)v14 - v10;
  MEMORY[0x270FA5388](v9);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  dispatch thunk of SIMDStorage.init()();
  for (uint64_t i = 0; i != 16; ++i)
  {
    dispatch thunk of SIMDStorage.subscript.getter();
    dispatch thunk of SIMDStorage.subscript.getter();
    v15(v11, v8, v5, *(void *)(*(void *)(*(void *)(v14[0] + 16) + 8) + 8));
    uint64_t result = dispatch thunk of SIMDStorage.subscript.setter();
  }
  return result;
}

uint64_t protocol witness for static AdditiveArithmetic.-= infix(_:_:) in conformance <> SIMD16<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return static SIMD<>.+= infix(_:_:)(a1, a2, a3);
}

uint64_t (*SIMD16<>._vjpSubscript(_:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t a1)
{
  if (a2 >= 0x10)
  {
    uint64_t result = (uint64_t (*)(uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v9 = *(void *)(a3 + 16);
    uint64_t v8 = *(void *)(a3 + 24);
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.getter();
    uint64_t v10 = (void *)swift_allocObject();
    v10[2] = v9;
    v10[3] = a4;
    v10[4] = v8;
    v10[5] = a5;
    v10[6] = a2;
    return partial apply for closure #1 in SIMD16<>._vjpSubscript(_:);
  }
  return result;
}

uint64_t closure #1 in SIMD16<>._vjpSubscript(_:)(const void *a1, unint64_t a2, uint64_t a3)
{
  size_t v5 = *(void *)(*(void *)(a3 - 8) + 64);
  MEMORY[0x270FA5388](a1);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  dispatch thunk of SIMDStorage.init()();
  memcpy((char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v5);
  if (a2 < 0x10) {
    return dispatch thunk of SIMDStorage.subscript.setter();
  }
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t (*reverse-mode derivative of SIMD16.subscript.getter(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  SIMD16<>._vjpSubscript(_:)(a1, a2, a3, a4, a5);
  uint64_t v9 = v8;
  uint64_t v10 = (void *)swift_allocObject();
  uint64_t v11 = *(void *)(a3 + 24);
  v10[2] = *(void *)(a3 + 16);
  v10[3] = a4;
  v10[4] = v11;
  v10[5] = a5;
  v10[6] = partial apply for closure #1 in SIMD16<>._vjpSubscript(_:);
  v10[7] = v9;
  return partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A) -> (@out SIMD2<A>);
}

uint64_t (*SIMD16<>._jvpSubscript(index:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t a1)
{
  if (a2 >= 0x10)
  {
    uint64_t result = (uint64_t (*)(uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v9 = *(void *)(a3 + 16);
    uint64_t v8 = *(void *)(a3 + 24);
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.getter();
    uint64_t v10 = (void *)swift_allocObject();
    v10[2] = v9;
    v10[3] = a4;
    v10[4] = v8;
    v10[5] = a5;
    v10[6] = a2;
    return partial apply for closure #1 in SIMD16<>._jvpSubscript(index:);
  }
  return result;
}

uint64_t closure #1 in SIMD16<>._jvpSubscript(index:)(uint64_t a1)
{
  MEMORY[0x270FA5388](a1);
  if (v1 >= 0x10)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.getter();
    return dispatch thunk of BinaryFloatingPoint.init<A>(_:)();
  }
  return result;
}

uint64_t (*forward-mode derivative of SIMD16.subscript.getter(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  SIMD16<>._jvpSubscript(index:)(a1, a2, a3, a4, a5);
  uint64_t v9 = v8;
  uint64_t v10 = (void *)swift_allocObject();
  uint64_t v11 = *(void *)(a3 + 24);
  v10[2] = *(void *)(a3 + 16);
  v10[3] = a4;
  v10[4] = v11;
  v10[5] = a5;
  v10[6] = partial apply for closure #1 in SIMD16<>._jvpSubscript(index:);
  v10[7] = v9;
  return partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A) -> (@out SIMD2<A>);
}

uint64_t (*SIMD16<>._vjpSubscriptSetter(_:_:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t a1)
{
  uint64_t v9 = *(void *)(a3 + 16);
  MEMORY[0x270FA5388](a1);
  memcpy((char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v11, v10);
  if (a2 >= 0x10)
  {
    uint64_t result = (uint64_t (*)(uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v12 = *(void *)(a3 + 24);
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.setter();
    uint64_t v13 = (void *)swift_allocObject();
    v13[2] = v9;
    v13[3] = a4;
    v13[4] = v12;
    v13[5] = a5;
    v13[6] = a2;
    return partial apply for closure #1 in SIMD16<>._vjpSubscriptSetter(_:_:);
  }
  return result;
}

uint64_t closure #1 in SIMD16<>._vjpSubscriptSetter(_:_:)(uint64_t a1, unint64_t a2)
{
  MEMORY[0x270FA5388](a1);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  if (a2 >= 0x10)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.getter();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
    dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
    return dispatch thunk of SIMDStorage.subscript.setter();
  }
  return result;
}

uint64_t (*reverse-mode derivative of SIMD16.subscript.setter(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  SIMD16<>._vjpSubscriptSetter(_:_:)(a1, a2, a3, a4, a5);
  uint64_t v9 = v8;
  size_t v10 = (void *)swift_allocObject();
  uint64_t v11 = *(void *)(a3 + 24);
  v10[2] = *(void *)(a3 + 16);
  v10[3] = a4;
  v10[4] = v11;
  v10[5] = a5;
  v10[6] = partial apply for closure #1 in SIMD16<>._vjpSubscriptSetter(_:_:);
  v10[7] = v9;
  return partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A) -> (@out SIMD2<A>);
}

uint64_t protocol witness for static AdditiveArithmetic.zero.getter in conformance <> SIMD32<A>()
{
  return protocol witness for static AdditiveArithmetic.zero.getter in conformance <> SIMD2<A>();
}

uint64_t protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> SIMD32<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> SIMD32<A>(a1, a2, a3, a4, MEMORY[0x263F8DF20]);
}

uint64_t protocol witness for static AdditiveArithmetic.+= infix(_:_:) in conformance <> SIMD32<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return static SIMD<>.+= infix(_:_:)(a1, a2, a3);
}

uint64_t protocol witness for static AdditiveArithmetic.- infix(_:_:) in conformance <> SIMD32<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> SIMD32<A>(a1, a2, a3, a4, MEMORY[0x263F8DF28]);
}

uint64_t protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> SIMD32<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(char *, char *, uint64_t, void))
{
  void v14[2] = a2;
  uint64_t v15 = a5;
  v14[0] = *(void *)(a4 - 8);
  v14[1] = a1;
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = MEMORY[0x270FA5388](a1);
  uint64_t v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v11 = (char *)v14 - v10;
  MEMORY[0x270FA5388](v9);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  dispatch thunk of SIMDStorage.init()();
  for (uint64_t i = 0; i != 32; ++i)
  {
    dispatch thunk of SIMDStorage.subscript.getter();
    dispatch thunk of SIMDStorage.subscript.getter();
    v15(v11, v8, v5, *(void *)(*(void *)(*(void *)(v14[0] + 16) + 8) + 8));
    uint64_t result = dispatch thunk of SIMDStorage.subscript.setter();
  }
  return result;
}

uint64_t protocol witness for static AdditiveArithmetic.-= infix(_:_:) in conformance <> SIMD32<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return static SIMD<>.+= infix(_:_:)(a1, a2, a3);
}

uint64_t (*SIMD32<>._vjpSubscript(_:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t a1)
{
  if (a2 >= 0x20)
  {
    uint64_t result = (uint64_t (*)(uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v9 = *(void *)(a3 + 16);
    uint64_t v8 = *(void *)(a3 + 24);
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.getter();
    uint64_t v10 = (void *)swift_allocObject();
    v10[2] = v9;
    v10[3] = a4;
    v10[4] = v8;
    v10[5] = a5;
    v10[6] = a2;
    return partial apply for closure #1 in SIMD32<>._vjpSubscript(_:);
  }
  return result;
}

uint64_t closure #1 in SIMD32<>._vjpSubscript(_:)(const void *a1, unint64_t a2, uint64_t a3)
{
  size_t v5 = *(void *)(*(void *)(a3 - 8) + 64);
  MEMORY[0x270FA5388](a1);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  dispatch thunk of SIMDStorage.init()();
  memcpy((char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v5);
  if (a2 < 0x20) {
    return dispatch thunk of SIMDStorage.subscript.setter();
  }
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t (*reverse-mode derivative of SIMD32.subscript.getter(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  SIMD32<>._vjpSubscript(_:)(a1, a2, a3, a4, a5);
  uint64_t v9 = v8;
  uint64_t v10 = (void *)swift_allocObject();
  uint64_t v11 = *(void *)(a3 + 24);
  v10[2] = *(void *)(a3 + 16);
  v10[3] = a4;
  v10[4] = v11;
  v10[5] = a5;
  v10[6] = partial apply for closure #1 in SIMD32<>._vjpSubscript(_:);
  v10[7] = v9;
  return partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A) -> (@out SIMD2<A>);
}

uint64_t (*SIMD32<>._jvpSubscript(index:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t a1)
{
  if (a2 >= 0x20)
  {
    uint64_t result = (uint64_t (*)(uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v9 = *(void *)(a3 + 16);
    uint64_t v8 = *(void *)(a3 + 24);
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.getter();
    uint64_t v10 = (void *)swift_allocObject();
    v10[2] = v9;
    v10[3] = a4;
    v10[4] = v8;
    v10[5] = a5;
    v10[6] = a2;
    return partial apply for closure #1 in SIMD32<>._jvpSubscript(index:);
  }
  return result;
}

uint64_t closure #1 in SIMD32<>._jvpSubscript(index:)(uint64_t a1)
{
  MEMORY[0x270FA5388](a1);
  if (v1 >= 0x20)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.getter();
    return dispatch thunk of BinaryFloatingPoint.init<A>(_:)();
  }
  return result;
}

uint64_t (*forward-mode derivative of SIMD32.subscript.getter(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  SIMD32<>._jvpSubscript(index:)(a1, a2, a3, a4, a5);
  uint64_t v9 = v8;
  uint64_t v10 = (void *)swift_allocObject();
  uint64_t v11 = *(void *)(a3 + 24);
  v10[2] = *(void *)(a3 + 16);
  v10[3] = a4;
  v10[4] = v11;
  v10[5] = a5;
  v10[6] = partial apply for closure #1 in SIMD32<>._jvpSubscript(index:);
  v10[7] = v9;
  return partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A) -> (@out SIMD2<A>);
}

uint64_t (*SIMD32<>._vjpSubscriptSetter(_:_:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t a1)
{
  uint64_t v9 = *(void *)(a3 + 16);
  MEMORY[0x270FA5388](a1);
  memcpy((char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v11, v10);
  if (a2 >= 0x20)
  {
    uint64_t result = (uint64_t (*)(uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v12 = *(void *)(a3 + 24);
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.setter();
    uint64_t v13 = (void *)swift_allocObject();
    v13[2] = v9;
    v13[3] = a4;
    v13[4] = v12;
    v13[5] = a5;
    v13[6] = a2;
    return partial apply for closure #1 in SIMD32<>._vjpSubscriptSetter(_:_:);
  }
  return result;
}

uint64_t closure #1 in SIMD32<>._vjpSubscriptSetter(_:_:)(uint64_t a1, unint64_t a2)
{
  MEMORY[0x270FA5388](a1);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  if (a2 >= 0x20)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.getter();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
    dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
    return dispatch thunk of SIMDStorage.subscript.setter();
  }
  return result;
}

uint64_t (*reverse-mode derivative of SIMD32.subscript.setter(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  SIMD32<>._vjpSubscriptSetter(_:_:)(a1, a2, a3, a4, a5);
  uint64_t v9 = v8;
  size_t v10 = (void *)swift_allocObject();
  uint64_t v11 = *(void *)(a3 + 24);
  v10[2] = *(void *)(a3 + 16);
  v10[3] = a4;
  v10[4] = v11;
  v10[5] = a5;
  v10[6] = partial apply for closure #1 in SIMD32<>._vjpSubscriptSetter(_:_:);
  v10[7] = v9;
  return partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A) -> (@out SIMD2<A>);
}

uint64_t protocol witness for static AdditiveArithmetic.zero.getter in conformance <> SIMD64<A>()
{
  return protocol witness for static AdditiveArithmetic.zero.getter in conformance <> SIMD2<A>();
}

uint64_t protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> SIMD64<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> SIMD64<A>(a1, a2, a3, a4, MEMORY[0x263F8DF20]);
}

uint64_t protocol witness for static AdditiveArithmetic.+= infix(_:_:) in conformance <> SIMD64<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return static SIMD<>.+= infix(_:_:)(a1, a2, a3);
}

uint64_t protocol witness for static AdditiveArithmetic.- infix(_:_:) in conformance <> SIMD64<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> SIMD64<A>(a1, a2, a3, a4, MEMORY[0x263F8DF28]);
}

uint64_t protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> SIMD64<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(char *, char *, uint64_t, void))
{
  void v14[2] = a2;
  uint64_t v15 = a5;
  v14[0] = *(void *)(a4 - 8);
  v14[1] = a1;
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = MEMORY[0x270FA5388](a1);
  uint64_t v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v11 = (char *)v14 - v10;
  MEMORY[0x270FA5388](v9);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  dispatch thunk of SIMDStorage.init()();
  for (uint64_t i = 0; i != 64; ++i)
  {
    dispatch thunk of SIMDStorage.subscript.getter();
    dispatch thunk of SIMDStorage.subscript.getter();
    v15(v11, v8, v5, *(void *)(*(void *)(*(void *)(v14[0] + 16) + 8) + 8));
    uint64_t result = dispatch thunk of SIMDStorage.subscript.setter();
  }
  return result;
}

uint64_t protocol witness for static AdditiveArithmetic.-= infix(_:_:) in conformance <> SIMD64<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return static SIMD<>.+= infix(_:_:)(a1, a2, a3);
}

uint64_t (*SIMD64<>._vjpSubscript(_:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t a1)
{
  if (a2 >= 0x40)
  {
    uint64_t result = (uint64_t (*)(uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v9 = *(void *)(a3 + 16);
    uint64_t v8 = *(void *)(a3 + 24);
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.getter();
    uint64_t v10 = (void *)swift_allocObject();
    v10[2] = v9;
    v10[3] = a4;
    v10[4] = v8;
    v10[5] = a5;
    v10[6] = a2;
    return partial apply for closure #1 in SIMD64<>._vjpSubscript(_:);
  }
  return result;
}

uint64_t closure #1 in SIMD64<>._vjpSubscript(_:)(const void *a1, unint64_t a2, uint64_t a3)
{
  size_t v5 = *(void *)(*(void *)(a3 - 8) + 64);
  MEMORY[0x270FA5388](a1);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  dispatch thunk of SIMDStorage.init()();
  memcpy((char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v5);
  if (a2 < 0x40) {
    return dispatch thunk of SIMDStorage.subscript.setter();
  }
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t (*reverse-mode derivative of SIMD64.subscript.getter(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  SIMD64<>._vjpSubscript(_:)(a1, a2, a3, a4, a5);
  uint64_t v9 = v8;
  uint64_t v10 = (void *)swift_allocObject();
  uint64_t v11 = *(void *)(a3 + 24);
  v10[2] = *(void *)(a3 + 16);
  v10[3] = a4;
  v10[4] = v11;
  v10[5] = a5;
  v10[6] = partial apply for closure #1 in SIMD64<>._vjpSubscript(_:);
  v10[7] = v9;
  return partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A) -> (@out SIMD2<A>);
}

uint64_t (*SIMD64<>._jvpSubscript(index:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t a1)
{
  if (a2 >= 0x40)
  {
    uint64_t result = (uint64_t (*)(uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v9 = *(void *)(a3 + 16);
    uint64_t v8 = *(void *)(a3 + 24);
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.getter();
    uint64_t v10 = (void *)swift_allocObject();
    v10[2] = v9;
    v10[3] = a4;
    v10[4] = v8;
    v10[5] = a5;
    v10[6] = a2;
    return partial apply for closure #1 in SIMD64<>._jvpSubscript(index:);
  }
  return result;
}

uint64_t closure #1 in SIMD64<>._jvpSubscript(index:)(uint64_t a1)
{
  MEMORY[0x270FA5388](a1);
  if (v1 >= 0x40)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.getter();
    return dispatch thunk of BinaryFloatingPoint.init<A>(_:)();
  }
  return result;
}

uint64_t (*forward-mode derivative of SIMD64.subscript.getter(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  SIMD64<>._jvpSubscript(index:)(a1, a2, a3, a4, a5);
  uint64_t v9 = v8;
  uint64_t v10 = (void *)swift_allocObject();
  uint64_t v11 = *(void *)(a3 + 24);
  v10[2] = *(void *)(a3 + 16);
  v10[3] = a4;
  v10[4] = v11;
  v10[5] = a5;
  v10[6] = partial apply for closure #1 in SIMD64<>._jvpSubscript(index:);
  v10[7] = v9;
  return partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A) -> (@out SIMD2<A>);
}

uint64_t (*SIMD64<>._vjpSubscriptSetter(_:_:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t a1)
{
  uint64_t v9 = *(void *)(a3 + 16);
  MEMORY[0x270FA5388](a1);
  memcpy((char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v11, v10);
  if (a2 >= 0x40)
  {
    uint64_t result = (uint64_t (*)(uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v12 = *(void *)(a3 + 24);
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.setter();
    uint64_t v13 = (void *)swift_allocObject();
    v13[2] = v9;
    v13[3] = a4;
    v13[4] = v12;
    v13[5] = a5;
    v13[6] = a2;
    return partial apply for closure #1 in SIMD64<>._vjpSubscriptSetter(_:_:);
  }
  return result;
}

uint64_t closure #1 in SIMD64<>._vjpSubscriptSetter(_:_:)(uint64_t a1, unint64_t a2)
{
  MEMORY[0x270FA5388](a1);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  if (a2 >= 0x40)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.getter();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
    dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
    return dispatch thunk of SIMDStorage.subscript.setter();
  }
  return result;
}

uint64_t (*reverse-mode derivative of SIMD64.subscript.setter(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  SIMD64<>._vjpSubscriptSetter(_:_:)(a1, a2, a3, a4, a5);
  uint64_t v9 = v8;
  size_t v10 = (void *)swift_allocObject();
  uint64_t v11 = *(void *)(a3 + 24);
  v10[2] = *(void *)(a3 + 16);
  v10[3] = a4;
  v10[4] = v11;
  v10[5] = a5;
  v10[6] = partial apply for closure #1 in SIMD64<>._vjpSubscriptSetter(_:_:);
  v10[7] = v9;
  return partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A) -> (@out SIMD2<A>);
}

uint64_t protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> SIMD3<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> SIMD3<A>(a1, a2, a3, a4, MEMORY[0x263F8DF20]);
}

uint64_t protocol witness for static AdditiveArithmetic.+= infix(_:_:) in conformance <> SIMD3<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return static SIMD<>.+= infix(_:_:)(a1, a2, a3);
}

uint64_t protocol witness for static AdditiveArithmetic.- infix(_:_:) in conformance <> SIMD3<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> SIMD3<A>(a1, a2, a3, a4, MEMORY[0x263F8DF28]);
}

uint64_t protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance <> SIMD3<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(char *, char *, uint64_t, uint64_t))
{
  uint64_t v19 = a2;
  uint64_t v6 = *(void *)(a4 - 8);
  uint64_t v17 = a5;
  uint64_t v18 = v6;
  uint64_t v7 = *(void *)(a3 + 16);
  uint64_t v8 = MEMORY[0x270FA5388](a1);
  size_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)&v16 - v12;
  MEMORY[0x270FA5388](v11);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  dispatch thunk of SIMDStorage.init()();
  uint64_t v16 = a1;
  dispatch thunk of SIMDStorage.subscript.getter();
  dispatch thunk of SIMDStorage.subscript.getter();
  uint64_t v14 = v17;
  uint64_t v18 = *(void *)(*(void *)(*(void *)(v18 + 16) + 8) + 8);
  ((void (*)(char *, char *, uint64_t))v17)(v13, v10, v7);
  dispatch thunk of SIMDStorage.subscript.setter();
  dispatch thunk of SIMDStorage.subscript.getter();
  dispatch thunk of SIMDStorage.subscript.getter();
  v14(v13, v10, v7, v18);
  dispatch thunk of SIMDStorage.subscript.setter();
  dispatch thunk of SIMDStorage.subscript.getter();
  dispatch thunk of SIMDStorage.subscript.getter();
  v14(v13, v10, v7, v18);
  return dispatch thunk of SIMDStorage.subscript.setter();
}

uint64_t protocol witness for static AdditiveArithmetic.-= infix(_:_:) in conformance <> SIMD3<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return static SIMD<>.+= infix(_:_:)(a1, a2, a3);
}

uint64_t (*SIMD3<>._vjpSubscript(_:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t a1)
{
  if (a2 >= 3)
  {
    uint64_t result = (uint64_t (*)(uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v9 = *(void *)(a3 + 16);
    uint64_t v8 = *(void *)(a3 + 24);
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.getter();
    size_t v10 = (void *)swift_allocObject();
    v10[2] = v9;
    v10[3] = a4;
    v10[4] = v8;
    v10[5] = a5;
    v10[6] = a2;
    return partial apply for closure #1 in SIMD3<>._vjpSubscript(_:);
  }
  return result;
}

uint64_t closure #1 in SIMD3<>._vjpSubscript(_:)(const void *a1, unint64_t a2, uint64_t a3)
{
  size_t v5 = *(void *)(*(void *)(a3 - 8) + 64);
  MEMORY[0x270FA5388](a1);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  dispatch thunk of SIMDStorage.init()();
  memcpy((char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v5);
  if (a2 < 3) {
    return dispatch thunk of SIMDStorage.subscript.setter();
  }
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t (*reverse-mode derivative of SIMD3.subscript.getter(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  SIMD3<>._vjpSubscript(_:)(a1, a2, a3, a4, a5);
  uint64_t v9 = v8;
  size_t v10 = (void *)swift_allocObject();
  uint64_t v11 = *(void *)(a3 + 24);
  v10[2] = *(void *)(a3 + 16);
  v10[3] = a4;
  v10[4] = v11;
  v10[5] = a5;
  v10[6] = partial apply for closure #1 in SIMD3<>._vjpSubscript(_:);
  v10[7] = v9;
  return partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A) -> (@out SIMD2<A>);
}

uint64_t (*SIMD3<>._jvpSubscript(index:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t a1)
{
  if (a2 >= 3)
  {
    uint64_t result = (uint64_t (*)(uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v9 = *(void *)(a3 + 16);
    uint64_t v8 = *(void *)(a3 + 24);
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.getter();
    size_t v10 = (void *)swift_allocObject();
    v10[2] = v9;
    v10[3] = a4;
    v10[4] = v8;
    v10[5] = a5;
    v10[6] = a2;
    return partial apply for closure #1 in SIMD3<>._jvpSubscript(index:);
  }
  return result;
}

uint64_t closure #1 in SIMD3<>._jvpSubscript(index:)(uint64_t a1)
{
  MEMORY[0x270FA5388](a1);
  if (v1 >= 3)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.getter();
    return dispatch thunk of BinaryFloatingPoint.init<A>(_:)();
  }
  return result;
}

uint64_t (*forward-mode derivative of SIMD3.subscript.getter(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  SIMD3<>._jvpSubscript(index:)(a1, a2, a3, a4, a5);
  uint64_t v9 = v8;
  size_t v10 = (void *)swift_allocObject();
  uint64_t v11 = *(void *)(a3 + 24);
  v10[2] = *(void *)(a3 + 16);
  v10[3] = a4;
  v10[4] = v11;
  v10[5] = a5;
  v10[6] = partial apply for closure #1 in SIMD3<>._jvpSubscript(index:);
  v10[7] = v9;
  return partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A) -> (@out SIMD2<A>);
}

uint64_t (*SIMD3<>._vjpSubscriptSetter(_:_:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t a1)
{
  uint64_t v9 = *(void *)(a3 + 16);
  MEMORY[0x270FA5388](a1);
  memcpy((char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v11, v10);
  if (a2 >= 3)
  {
    uint64_t result = (uint64_t (*)(uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v12 = *(void *)(a3 + 24);
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.setter();
    uint64_t v13 = (void *)swift_allocObject();
    v13[2] = v9;
    v13[3] = a4;
    v13[4] = v12;
    v13[5] = a5;
    v13[6] = a2;
    return partial apply for closure #1 in SIMD3<>._vjpSubscriptSetter(_:_:);
  }
  return result;
}

uint64_t closure #1 in SIMD3<>._vjpSubscriptSetter(_:_:)(uint64_t a1, unint64_t a2)
{
  MEMORY[0x270FA5388](a1);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  if (a2 >= 3)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of SIMDStorage.subscript.getter();
    swift_getAssociatedConformanceWitness();
    dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
    dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
    return dispatch thunk of SIMDStorage.subscript.setter();
  }
  return result;
}

uint64_t (*reverse-mode derivative of SIMD3.subscript.setter(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  SIMD3<>._vjpSubscriptSetter(_:_:)(a1, a2, a3, a4, a5);
  uint64_t v9 = v8;
  size_t v10 = (void *)swift_allocObject();
  uint64_t v11 = *(void *)(a3 + 24);
  v10[2] = *(void *)(a3 + 16);
  v10[3] = a4;
  v10[4] = v11;
  v10[5] = a5;
  v10[6] = partial apply for closure #1 in SIMD3<>._vjpSubscriptSetter(_:_:);
  v10[7] = v9;
  return partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A) -> (@out SIMD2<A>);
}

uint64_t (*static SIMD<>._vjpAdd(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v38 = a6;
  uint64_t v39 = a8;
  uint64_t v45 = a7;
  uint64_t v43 = a3;
  uint64_t v33 = a2;
  uint64_t v36 = a1;
  uint64_t v37 = a5;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v46 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v10 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v32 = (char *)&AssociatedTypeWitness - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&AssociatedTypeWitness - v13;
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v17 = (char *)&AssociatedTypeWitness - v16;
  uint64_t v35 = *(void *)(a4 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&AssociatedTypeWitness - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v20 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v20 < 0)
  {
    uint64_t result = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v34 = a9;
    uint64_t v44 = v19;
    uint64_t v42 = v17;
    uint64_t v21 = v32;
    uint64_t v22 = AssociatedTypeWitness;
    if (v20)
    {
      uint64_t v23 = 0;
      uint64_t v40 = v46 + 8;
      uint64_t v41 = v20;
      uint64_t v24 = (void (**)(char *, uint64_t))(v46 + 8);
      do
      {
        uint64_t v46 = v23 + 1;
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static AdditiveArithmetic.+ infix(_:_:)();
        uint64_t v25 = *v24;
        (*v24)(v21, v22);
        v25(v14, v22);
        dispatch thunk of SIMDStorage.subscript.setter();
        uint64_t v23 = v46;
      }
      while (v41 != v46);
    }
    (*(void (**)(uint64_t, char *, uint64_t))(v35 + 32))(v36, v44, a4);
    uint64_t v26 = (void *)swift_allocObject();
    uint64_t v27 = v37;
    v26[2] = a4;
    _OWORD v26[3] = v27;
    uint64_t v28 = v45;
    v26[4] = v38;
    v26[5] = v28;
    uint64_t v29 = v34;
    v26[6] = v39;
    v26[7] = v29;
    return partial apply for closure #1 in static SIMD<>._vjpAdd(lhs:rhs:);
  }
  return result;
}

uint64_t (*reverse-mode derivative of static SIMD<>.+ infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return partial apply for closure #1 in static SIMD<>._vjpAdd(lhs:rhs:);
}

uint64_t (*static SIMD<>._jvpAdd(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9))(uint64_t a1, uint64_t a2)
{
  uint64_t v38 = a6;
  uint64_t v39 = a8;
  uint64_t v45 = a7;
  uint64_t v43 = a3;
  uint64_t v33 = a2;
  uint64_t v36 = a1;
  uint64_t v37 = a5;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v46 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v10 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v32 = (char *)&AssociatedTypeWitness - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&AssociatedTypeWitness - v13;
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v17 = (char *)&AssociatedTypeWitness - v16;
  uint64_t v35 = *(void *)(a4 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&AssociatedTypeWitness - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v20 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v20 < 0)
  {
    uint64_t result = (uint64_t (*)(uint64_t, uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v34 = a9;
    uint64_t v44 = v19;
    uint64_t v42 = v17;
    uint64_t v21 = v32;
    uint64_t v22 = AssociatedTypeWitness;
    if (v20)
    {
      uint64_t v23 = 0;
      uint64_t v40 = v46 + 8;
      uint64_t v41 = v20;
      uint64_t v24 = (void (**)(char *, uint64_t))(v46 + 8);
      do
      {
        uint64_t v46 = v23 + 1;
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static AdditiveArithmetic.+ infix(_:_:)();
        uint64_t v25 = *v24;
        (*v24)(v21, v22);
        v25(v14, v22);
        dispatch thunk of SIMDStorage.subscript.setter();
        uint64_t v23 = v46;
      }
      while (v41 != v46);
    }
    (*(void (**)(uint64_t, char *, uint64_t))(v35 + 32))(v36, v44, a4);
    uint64_t v26 = (void *)swift_allocObject();
    uint64_t v27 = v37;
    v26[2] = a4;
    _OWORD v26[3] = v27;
    uint64_t v28 = v45;
    v26[4] = v38;
    v26[5] = v28;
    uint64_t v29 = v34;
    v26[6] = v39;
    v26[7] = v29;
    return partial apply for closure #1 in static SIMD<>._jvpAdd(lhs:rhs:);
  }
  return result;
}

uint64_t (*forward-mode derivative of static SIMD<>.+ infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9))(uint64_t a1, uint64_t a2)
{
  return partial apply for closure #1 in static SIMD<>._jvpAdd(lhs:rhs:);
}

uint64_t (*static SIMD<>._vjpSubtract(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v38 = a6;
  uint64_t v39 = a8;
  uint64_t v45 = a7;
  uint64_t v43 = a3;
  uint64_t v33 = a2;
  uint64_t v36 = a1;
  uint64_t v37 = a5;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v46 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v10 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v32 = (char *)&AssociatedTypeWitness - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&AssociatedTypeWitness - v13;
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v17 = (char *)&AssociatedTypeWitness - v16;
  uint64_t v35 = *(void *)(a4 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&AssociatedTypeWitness - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v20 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v20 < 0)
  {
    uint64_t result = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v34 = a9;
    uint64_t v44 = v19;
    uint64_t v42 = v17;
    uint64_t v21 = v32;
    uint64_t v22 = AssociatedTypeWitness;
    if (v20)
    {
      uint64_t v23 = 0;
      uint64_t v40 = v46 + 8;
      uint64_t v41 = v20;
      uint64_t v24 = (void (**)(char *, uint64_t))(v46 + 8);
      do
      {
        uint64_t v46 = v23 + 1;
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static AdditiveArithmetic.- infix(_:_:)();
        uint64_t v25 = *v24;
        (*v24)(v21, v22);
        v25(v14, v22);
        dispatch thunk of SIMDStorage.subscript.setter();
        uint64_t v23 = v46;
      }
      while (v41 != v46);
    }
    (*(void (**)(uint64_t, char *, uint64_t))(v35 + 32))(v36, v44, a4);
    uint64_t v26 = (void *)swift_allocObject();
    uint64_t v27 = v37;
    v26[2] = a4;
    _OWORD v26[3] = v27;
    uint64_t v28 = v45;
    v26[4] = v38;
    v26[5] = v28;
    uint64_t v29 = v34;
    v26[6] = v39;
    v26[7] = v29;
    return partial apply for closure #1 in static SIMD<>._vjpSubtract(lhs:rhs:);
  }
  return result;
}

uint64_t closure #1 in static SIMD<>._vjpSubtract(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v62 = a3;
  uint64_t v63 = a2;
  uint64_t v65 = a1;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v11 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v12 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v14 = (char *)&v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  v66 = (char *)&v53 - v15;
  uint64_t v64 = *(void *)(a8 + 48);
  uint64_t v16 = swift_getAssociatedTypeWitness();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  v55 = (char *)&v53 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v54 = (char *)&v53 - v21;
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  long long v61 = (char *)&v53 - v23;
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  uint64_t v26 = (char *)&v53 - v25;
  MEMORY[0x270FA5388](v24);
  uint64_t v28 = (char *)&v53 - v27;
  uint64_t v60 = *(void *)(*(void *)(*(void *)(a9 + 16) + 16) + 8);
  uint64_t v29 = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](v29);
  uint64_t v57 = v11;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v65, v62, AssociatedTypeWitness);
  swift_getAssociatedConformanceWitness();
  dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
  dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
  uint64_t v65 = v17;
  uint64_t v30 = *(void (**)(char *, char *, uint64_t))(v17 + 16);
  uint64_t v31 = v26;
  uint64_t v59 = v28;
  uint64_t v53 = v16;
  uint64_t v32 = v16;
  uint64_t v33 = v30;
  v30(v26, v28, v32);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v56 = AssociatedTypeWitness;
  uint64_t v34 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v34 < 0) {
    goto LABEL_10;
  }
  uint64_t v35 = v34;
  uint64_t v36 = v56;
  uint64_t v37 = v14;
  uint64_t v38 = v33;
  uint64_t v39 = v53;
  uint64_t v40 = v61;
  if (v34)
  {
    uint64_t v41 = 0;
    do
    {
      v38(v40, v31, v39);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v41;
    }
    while (v35 != v41);
  }
  uint64_t v42 = v65 + 8;
  uint64_t v43 = *(void (**)(char *, uint64_t))(v65 + 8);
  v43(v31, v39);
  (*(void (**)(char *, char *, uint64_t))(v57 + 32))(v66, v37, v36);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v44 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v44 < 0)
  {
LABEL_10:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v45 = v44;
    v43(v59, v39);
    uint64_t v46 = v66;
    uint64_t v65 = v42;
    uint64_t v47 = v54;
    uint64_t v48 = v55;
    uint64_t v49 = v56;
    uint64_t v59 = (char *)v43;
    if (v45)
    {
      uint64_t v50 = 0;
      uint64_t v58 = v45;
      uint64_t v51 = (void (*)(char *, uint64_t))v59;
      do
      {
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static AdditiveArithmetic.- infix(_:_:)();
        v51(v48, v39);
        v51(v47, v39);
        dispatch thunk of SIMDStorage.subscript.setter();
        uint64_t v46 = v66;
        ++v50;
      }
      while (v58 != v50);
    }
    return (*(uint64_t (**)(char *, uint64_t))(v57 + 8))(v46, v49);
  }
  return result;
}

uint64_t (*reverse-mode derivative of static SIMD<>.- infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return partial apply for closure #1 in static SIMD<>._vjpSubtract(lhs:rhs:);
}

uint64_t (*static SIMD<>._jvpSubtract(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9))(uint64_t a1, uint64_t a2)
{
  uint64_t v38 = a6;
  uint64_t v39 = a8;
  uint64_t v45 = a7;
  uint64_t v43 = a3;
  uint64_t v33 = a2;
  uint64_t v36 = a1;
  uint64_t v37 = a5;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v46 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v10 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v32 = (char *)&AssociatedTypeWitness - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&AssociatedTypeWitness - v13;
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v17 = (char *)&AssociatedTypeWitness - v16;
  uint64_t v35 = *(void *)(a4 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&AssociatedTypeWitness - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v20 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v20 < 0)
  {
    uint64_t result = (uint64_t (*)(uint64_t, uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v34 = a9;
    uint64_t v44 = v19;
    uint64_t v42 = v17;
    uint64_t v21 = v32;
    uint64_t v22 = AssociatedTypeWitness;
    if (v20)
    {
      uint64_t v23 = 0;
      uint64_t v40 = v46 + 8;
      uint64_t v41 = v20;
      uint64_t v24 = (void (**)(char *, uint64_t))(v46 + 8);
      do
      {
        uint64_t v46 = v23 + 1;
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static AdditiveArithmetic.- infix(_:_:)();
        uint64_t v25 = *v24;
        (*v24)(v21, v22);
        v25(v14, v22);
        dispatch thunk of SIMDStorage.subscript.setter();
        uint64_t v23 = v46;
      }
      while (v41 != v46);
    }
    (*(void (**)(uint64_t, char *, uint64_t))(v35 + 32))(v36, v44, a4);
    uint64_t v26 = (void *)swift_allocObject();
    uint64_t v27 = v37;
    v26[2] = a4;
    _OWORD v26[3] = v27;
    uint64_t v28 = v45;
    v26[4] = v38;
    v26[5] = v28;
    uint64_t v29 = v34;
    v26[6] = v39;
    v26[7] = v29;
    return partial apply for closure #1 in static SIMD<>._jvpSubtract(lhs:rhs:);
  }
  return result;
}

uint64_t closure #1 in static SIMD<>._jvpAdd(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t (*a9)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  return a9(a1, a2, AssociatedTypeWitness, AssociatedConformanceWitness);
}

uint64_t (*forward-mode derivative of static SIMD<>.- infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9))(uint64_t a1, uint64_t a2)
{
  return partial apply for closure #1 in static SIMD<>._jvpSubtract(lhs:rhs:);
}

uint64_t (*static SIMD<>._vjpNegate(rhs:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8))()
{
  uint64_t v66 = a7;
  uint64_t v67 = a8;
  uint64_t v64 = a5;
  uint64_t v73 = a2;
  uint64_t v62 = a1;
  uint64_t v69 = *(void *)(a3 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](a1);
  v76 = (char *)&v56 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v56 - v13;
  MEMORY[0x270FA5388](v12);
  v78 = (char *)&v56 - v15;
  uint64_t v63 = v16;
  uint64_t v17 = *(void *)(v16 + 48);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v19 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v20 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  long long v61 = (char *)&v56 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  uint64_t v60 = (char *)&v56 - v23;
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  v74 = (char *)&v56 - v25;
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  uint64_t v28 = (char *)&v56 - v27;
  MEMORY[0x270FA5388](v26);
  uint64_t v30 = (char *)&v56 - v29;
  uint64_t v65 = a6;
  uint64_t v72 = *(void *)(*(void *)(*(void *)(a6 + 16) + 16) + 8);
  uint64_t v31 = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](v31);
  swift_getAssociatedConformanceWitness();
  dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
  dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
  uint64_t v75 = v19;
  uint64_t v32 = *(char **)(v19 + 16);
  uint64_t v33 = v28;
  uint64_t v71 = v30;
  uint64_t v57 = AssociatedTypeWitness;
  v70 = (void (*)(char *, char *, uint64_t))v32;
  uint64_t v59 = v19 + 16;
  ((void (*)(char *, char *, uint64_t))v32)(v28, v30, AssociatedTypeWitness);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v68 = a3;
  uint64_t v77 = v17;
  uint64_t v34 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v34 < 0) {
    goto LABEL_10;
  }
  uint64_t v35 = v34;
  uint64_t v36 = v68;
  uint64_t v37 = v74;
  uint64_t v38 = v70;
  uint64_t v39 = v57;
  if (v34)
  {
    uint64_t v40 = 0;
    do
    {
      v38(v37, v33, v39);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v40;
    }
    while (v35 != v40);
  }
  uint64_t v41 = v75 + 8;
  uint64_t v42 = *(void (**)(char *, uint64_t))(v75 + 8);
  v42(v33, v39);
  uint64_t v58 = *(void (**)(char *, char *, uint64_t))(v69 + 32);
  uint64_t v59 = v69 + 32;
  v58(v78, v14, v36);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v43 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v43 < 0)
  {
LABEL_10:
    uint64_t result = (uint64_t (*)())_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v44 = v43;
    v42(v71, v39);
    uint64_t v45 = v78;
    uint64_t v75 = v41;
    uint64_t v46 = v60;
    uint64_t v47 = v61;
    uint64_t v48 = v68;
    uint64_t v71 = (char *)v42;
    if (v44)
    {
      uint64_t v49 = 0;
      v70 = (void (*)(char *, char *, uint64_t))v44;
      do
      {
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static AdditiveArithmetic.- infix(_:_:)();
        uint64_t v50 = (void (*)(char *, uint64_t))v71;
        ((void (*)(char *, uint64_t))v71)(v47, v39);
        v50(v46, v39);
        dispatch thunk of SIMDStorage.subscript.setter();
        uint64_t v45 = v78;
        uint64_t v49 = (void (*)(char *, char *, uint64_t))((char *)v49 + 1);
      }
      while (v70 != v49);
    }
    (*(void (**)(char *, uint64_t))(v69 + 8))(v45, v48);
    v58(v62, v76, v48);
    uint64_t v51 = (void *)swift_allocObject();
    uint64_t v52 = v63;
    v51[2] = v48;
    v51[3] = v52;
    uint64_t v53 = v65;
    v51[4] = v64;
    v51[5] = v53;
    uint64_t v54 = v67;
    v51[6] = v66;
    v51[7] = v54;
    return partial apply for closure #1 in static SIMD<>._vjpNegate(rhs:);
  }
  return result;
}

uint64_t (*reverse-mode derivative of static SIMD<>.- prefix(_:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8))()
{
  return partial apply for closure #1 in static SIMD<>._vjpNegate(rhs:);
}

uint64_t (*static SIMD<>._jvpNegate(rhs:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8))()
{
  uint64_t v66 = a7;
  uint64_t v67 = a8;
  uint64_t v64 = a5;
  uint64_t v73 = a2;
  uint64_t v62 = a1;
  uint64_t v69 = *(void *)(a3 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](a1);
  v76 = (char *)&v56 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v56 - v13;
  MEMORY[0x270FA5388](v12);
  v78 = (char *)&v56 - v15;
  uint64_t v63 = v16;
  uint64_t v17 = *(void *)(v16 + 48);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v19 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v20 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  long long v61 = (char *)&v56 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  uint64_t v60 = (char *)&v56 - v23;
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  v74 = (char *)&v56 - v25;
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  uint64_t v28 = (char *)&v56 - v27;
  MEMORY[0x270FA5388](v26);
  uint64_t v30 = (char *)&v56 - v29;
  uint64_t v65 = a6;
  uint64_t v72 = *(void *)(*(void *)(*(void *)(a6 + 16) + 16) + 8);
  uint64_t v31 = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](v31);
  swift_getAssociatedConformanceWitness();
  dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
  dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
  uint64_t v75 = v19;
  uint64_t v32 = *(char **)(v19 + 16);
  uint64_t v33 = v28;
  uint64_t v71 = v30;
  uint64_t v57 = AssociatedTypeWitness;
  v70 = (void (*)(char *, char *, uint64_t))v32;
  uint64_t v59 = v19 + 16;
  ((void (*)(char *, char *, uint64_t))v32)(v28, v30, AssociatedTypeWitness);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v68 = a3;
  uint64_t v77 = v17;
  uint64_t v34 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v34 < 0) {
    goto LABEL_10;
  }
  uint64_t v35 = v34;
  uint64_t v36 = v68;
  uint64_t v37 = v74;
  uint64_t v38 = v70;
  uint64_t v39 = v57;
  if (v34)
  {
    uint64_t v40 = 0;
    do
    {
      v38(v37, v33, v39);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v40;
    }
    while (v35 != v40);
  }
  uint64_t v41 = v75 + 8;
  uint64_t v42 = *(void (**)(char *, uint64_t))(v75 + 8);
  v42(v33, v39);
  uint64_t v58 = *(void (**)(char *, char *, uint64_t))(v69 + 32);
  uint64_t v59 = v69 + 32;
  v58(v78, v14, v36);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v43 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v43 < 0)
  {
LABEL_10:
    uint64_t result = (uint64_t (*)())_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v44 = v43;
    v42(v71, v39);
    uint64_t v45 = v78;
    uint64_t v75 = v41;
    uint64_t v46 = v60;
    uint64_t v47 = v61;
    uint64_t v48 = v68;
    uint64_t v71 = (char *)v42;
    if (v44)
    {
      uint64_t v49 = 0;
      v70 = (void (*)(char *, char *, uint64_t))v44;
      do
      {
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static AdditiveArithmetic.- infix(_:_:)();
        uint64_t v50 = (void (*)(char *, uint64_t))v71;
        ((void (*)(char *, uint64_t))v71)(v47, v39);
        v50(v46, v39);
        dispatch thunk of SIMDStorage.subscript.setter();
        uint64_t v45 = v78;
        uint64_t v49 = (void (*)(char *, char *, uint64_t))((char *)v49 + 1);
      }
      while (v70 != v49);
    }
    (*(void (**)(char *, uint64_t))(v69 + 8))(v45, v48);
    v58(v62, v76, v48);
    uint64_t v51 = (void *)swift_allocObject();
    uint64_t v52 = v63;
    v51[2] = v48;
    v51[3] = v52;
    uint64_t v53 = v65;
    v51[4] = v64;
    v51[5] = v53;
    uint64_t v54 = v67;
    v51[6] = v66;
    v51[7] = v54;
    return partial apply for closure #1 in static SIMD<>._vjpNegate(rhs:);
  }
  return result;
}

uint64_t closure #1 in static SIMD<>._vjpNegate(rhs:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X5>, uint64_t a3@<X6>, uint64_t a4@<X8>)
{
  uint64_t v61 = a1;
  uint64_t v62 = a4;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v58 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v7 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v9 = (char *)&v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v66 = (char *)&v52 - v10;
  uint64_t v11 = *(void *)(a2 + 48);
  uint64_t v12 = swift_getAssociatedTypeWitness();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v56 = (char *)&v52 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  v55 = (char *)&v52 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v63 = (char *)&v52 - v19;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v52 - v21;
  MEMORY[0x270FA5388](v20);
  uint64_t v24 = (char *)&v52 - v23;
  uint64_t v54 = *(void *)(*(void *)(*(void *)(a3 + 16) + 16) + 8);
  uint64_t v25 = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](v25);
  swift_getAssociatedConformanceWitness();
  dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
  dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
  uint64_t v64 = v13;
  uint64_t v26 = *(void (**)(char *, uint64_t))(v13 + 16);
  uint64_t v67 = v24;
  uint64_t v53 = v12;
  uint64_t v59 = (char *)(v13 + 16);
  uint64_t v60 = v26;
  ((void (*)(char *, char *, uint64_t))v26)(v22, v24, v12);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v27 = v9;
  uint64_t v57 = AssociatedTypeWitness;
  uint64_t v65 = v11;
  uint64_t v28 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v28 < 0) {
    goto LABEL_10;
  }
  uint64_t v29 = v28;
  uint64_t v30 = v57;
  uint64_t v31 = v63;
  uint64_t v32 = (void (*)(char *, char *, uint64_t))v60;
  uint64_t v33 = v53;
  if (v28)
  {
    uint64_t v34 = 0;
    do
    {
      v32(v31, v22, v33);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v34;
    }
    while (v29 != v34);
  }
  uint64_t v36 = v64 + 8;
  uint64_t v35 = *(void (**)(char *, uint64_t))(v64 + 8);
  v35(v22, v33);
  (*(void (**)(char *, char *, uint64_t))(v58 + 32))(v66, v27, v30);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v37 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v37 < 0)
  {
LABEL_10:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v38 = v37;
    v35(v67, v33);
    uint64_t v40 = v65;
    uint64_t v39 = v66;
    uint64_t v64 = v36;
    uint64_t v42 = v55;
    uint64_t v41 = v56;
    uint64_t v43 = v33;
    uint64_t v44 = v57;
    uint64_t v60 = v35;
    if (v38)
    {
      uint64_t v45 = 0;
      uint64_t v59 = (char *)v38;
      do
      {
        uint64_t v67 = v45 + 1;
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static AdditiveArithmetic.- infix(_:_:)();
        uint64_t v46 = v41;
        uint64_t v47 = v40;
        uint64_t v48 = v41;
        uint64_t v49 = v44;
        uint64_t v50 = v60;
        v60(v46, v43);
        v50(v42, v43);
        uint64_t v44 = v49;
        uint64_t v41 = v48;
        uint64_t v40 = v47;
        dispatch thunk of SIMDStorage.subscript.setter();
        uint64_t v39 = v66;
        uint64_t v45 = v67;
      }
      while (v59 != v67);
    }
    return (*(uint64_t (**)(char *, uint64_t))(v58 + 8))(v39, v44);
  }
  return result;
}

uint64_t (*forward-mode derivative of static SIMD<>.- prefix(_:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8))()
{
  return partial apply for closure #1 in static SIMD<>._vjpNegate(rhs:);
}

uint64_t (*static SIMD<>._vjpMultiply(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v56 = a3;
  uint64_t v57 = a7;
  uint64_t v50 = a5;
  uint64_t v51 = a6;
  uint64_t v55 = a2;
  uint64_t v49 = a1;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v43 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v9 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v11 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v44 = (char *)&v42 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v42 - v15;
  uint64_t v45 = *(void *)(a4 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v48 = (char *)&v42 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v46 = v21;
  uint64_t v47 = (char *)&v42 - v20;
  MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v42 - v22;
  dispatch thunk of SIMDStorage.init()();
  uint64_t v24 = a4;
  uint64_t v25 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v25 < 0)
  {
    uint64_t result = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v53 = v16;
    uint64_t v54 = v23;
    uint64_t v26 = v44;
    if (v25)
    {
      uint64_t v27 = 0;
      uint64_t v28 = (void (**)(char *, uint64_t))(v43 + 8);
      uint64_t v52 = v25;
      do
      {
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static Numeric.* infix(_:_:)();
        uint64_t v29 = *v28;
        (*v28)(v11, AssociatedTypeWitness);
        v29(v26, AssociatedTypeWitness);
        dispatch thunk of SIMDStorage.subscript.setter();
        ++v27;
      }
      while (v52 != v27);
    }
    uint64_t v30 = v45;
    uint64_t v31 = *(void (**)(uint64_t, char *, uint64_t))(v45 + 32);
    v31(v49, v54, v24);
    uint64_t v32 = *(void (**)(char *, uint64_t, uint64_t))(v30 + 16);
    uint64_t v33 = v47;
    v32(v47, v56, v24);
    uint64_t v34 = v48;
    v32(v48, v55, v24);
    uint64_t v35 = *(unsigned __int8 *)(v30 + 80);
    uint64_t v36 = (v35 + 48) & ~v35;
    uint64_t v37 = (v46 + v35 + v36) & ~v35;
    uint64_t v38 = (void *)swift_allocObject();
    uint64_t v39 = v50;
    v38[2] = v24;
    _OWORD v38[3] = v39;
    uint64_t v40 = v57;
    void v38[4] = v51;
    v38[5] = v40;
    v31((uint64_t)v38 + v36, v33, v24);
    v31((uint64_t)v38 + v37, v34, v24);
    return partial apply for closure #1 in static SIMD<>._vjpMultiply(lhs:rhs:);
  }
  return result;
}

uint64_t closure #1 in static SIMD<>._vjpMultiply(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v45 = a4;
  uint64_t v46 = a5;
  uint64_t v42 = a3;
  uint64_t v49 = a2;
  uint64_t v11 = *(void *)(a7 + 48);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v38 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v39 = AssociatedTypeWitness;
  uint64_t v13 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v41 = (char *)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v40 = (char *)&v35 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v52 = (char *)&v35 - v18;
  uint64_t v36 = *(void *)(a6 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v35 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v21 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v21 < 0) {
    goto LABEL_10;
  }
  uint64_t v37 = a1;
  uint64_t v51 = a9;
  uint64_t v22 = v41;
  uint64_t v47 = v11;
  uint64_t v48 = v20;
  uint64_t v24 = v39;
  uint64_t v23 = v40;
  if (v21)
  {
    uint64_t v25 = 0;
    uint64_t v43 = v38 + 8;
    uint64_t v44 = v21;
    uint64_t v26 = (void (**)(char *, uint64_t))(v38 + 8);
    do
    {
      uint64_t v50 = v25 + 1;
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of static Numeric.* infix(_:_:)();
      uint64_t v27 = *v26;
      (*v26)(v22, v24);
      v27(v23, v24);
      dispatch thunk of SIMDStorage.subscript.setter();
      uint64_t v25 = v50;
    }
    while ((char *)v44 != v50);
  }
  (*(void (**)(uint64_t, char *, uint64_t))(v36 + 32))(v37, v48, a6);
  dispatch thunk of SIMDStorage.init()();
  uint64_t result = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (result < 0)
  {
LABEL_10:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v29 = v41;
    uint64_t v31 = v39;
    uint64_t v30 = v40;
    if (result)
    {
      uint64_t v32 = 0;
      uint64_t v45 = v38 + 8;
      uint64_t v48 = (char *)result;
      uint64_t v33 = (void (**)(char *, uint64_t))(v38 + 8);
      do
      {
        uint64_t v50 = v32 + 1;
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static Numeric.* infix(_:_:)();
        uint64_t v34 = *v33;
        (*v33)(v29, v31);
        v34(v30, v31);
        dispatch thunk of SIMDStorage.subscript.setter();
        uint64_t result = (uint64_t)v48;
        uint64_t v32 = v50;
      }
      while (v48 != v50);
    }
  }
  return result;
}

{
  uint64_t v10;
  uint64_t AssociatedTypeWitness;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  void (**v36)(char *, uint64_t);
  uint64_t v37;
  uint64_t v38;
  void (*v39)(char *, uint64_t);
  uint64_t v40;
  void (*v41)(char *, uint64_t);
  char *v42;
  void (*v43)(char *, uint64_t);
  uint64_t (*v44)(char *, uint64_t);
  uint64_t v45;
  void (*v46)(char *, uint64_t, uint64_t);
  uint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  void (*v57)(char *, uint64_t);
  uint64_t v58;
  uint64_t v59;
  char *v60;
  char *v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  char *v72;
  void (*v73)(char *, uint64_t);
  uint64_t result;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  char *v81;
  char *v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t (*v86)(char *, uint64_t);
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void (*v90)(char *, uint64_t);
  uint64_t v91;
  uint64_t v92;
  char *v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;

  v78 = a7;
  v79 = a5;
  v88 = a4;
  v84 = a3;
  v92 = a2;
  uint64_t v77 = a1;
  uint64_t v10 = *(void *)(a7 + 48);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v95 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v12 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  v82 = (char *)&v75 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  v83 = (char *)&v75 - v15;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  v80 = (char *)&v75 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v75 - v19;
  v85 = *(void *)(a6 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v18);
  uint64_t v23 = (char *)&v75 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = MEMORY[0x270FA5388](v21);
  v94 = (char *)&v75 - v25;
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  uint64_t v28 = (void (*)(char *, uint64_t))((char *)&v75 - v27);
  MEMORY[0x270FA5388](v26);
  v76 = (char *)&v75 - v29;
  dispatch thunk of SIMDStorage.init()();
  uint64_t v30 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v30 < 0) {
    goto LABEL_14;
  }
  v81 = v23;
  v90 = v28;
  v91 = a9;
  uint64_t v32 = v83;
  uint64_t v31 = v84;
  v97 = v10;
  v93 = v20;
  uint64_t v33 = a6;
  uint64_t v34 = v80;
  v89 = AssociatedTypeWitness;
  if (v30)
  {
    uint64_t v35 = 0;
    v86 = (uint64_t (*)(char *, uint64_t))(v95 + 8);
    v87 = v30;
    uint64_t v36 = (void (**)(char *, uint64_t))(v95 + 8);
    do
    {
      v96 = v35 + 1;
      uint64_t v37 = v31;
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of SIMDStorage.subscript.getter();
      uint64_t v38 = v89;
      dispatch thunk of static Numeric.* infix(_:_:)();
      uint64_t v39 = *v36;
      (*v36)(v32, v38);
      v39(v34, v38);
      dispatch thunk of SIMDStorage.subscript.setter();
      uint64_t v31 = v37;
      uint64_t v35 = v96;
    }
    while (v87 != v96);
  }
  uint64_t v40 = v85;
  uint64_t v41 = *(void (**)(char *, uint64_t))(v85 + 32);
  uint64_t v42 = v76;
  uint64_t v43 = v90;
  v96 = v85 + 32;
  v90 = v41;
  ((void (*)(char *, void (*)(char *, uint64_t), uint64_t))v41)(v76, v43, v33);
  v91 = *(void *)(v91 + 16);
  SIMD<>.sum()(v33, v91, v77);
  uint64_t v44 = *(uint64_t (**)(char *, uint64_t))(v40 + 8);
  v85 = v40 + 8;
  v86 = v44;
  v44(v42, v33);
  uint64_t v45 = v89;
  uint64_t v46 = *(void (**)(char *, uint64_t, uint64_t))(v95 + 16);
  v46(v82, v79, v89);
  dispatch thunk of SIMDStorage.init()();
  v87 = v33;
  uint64_t v47 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v47 < 0) {
    goto LABEL_14;
  }
  uint64_t v48 = v47;
  uint64_t v49 = v81;
  uint64_t v50 = v82;
  uint64_t v51 = v93;
  uint64_t v52 = v87;
  if (v47)
  {
    uint64_t v53 = 0;
    do
    {
      v46(v51, (uint64_t)v50, v45);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v53;
    }
    while (v48 != v53);
  }
  uint64_t v54 = v50;
  uint64_t v55 = v45;
  uint64_t v56 = v95 + 8;
  uint64_t v57 = *(void (**)(char *, uint64_t))(v95 + 8);
  v57(v54, v45);
  ((void (*)(char *, char *, uint64_t))v90)(v94, v49, v52);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v58 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v58 < 0)
  {
LABEL_14:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v60 = v83;
    uint64_t v59 = v84;
    v95 = v56;
    v90 = v57;
    uint64_t v61 = v80;
    uint64_t v62 = v93;
    uint64_t v63 = v97;
    uint64_t v64 = v87;
    if (v58)
    {
      uint64_t v65 = v55;
      uint64_t v66 = 0;
      v88 = v58;
      do
      {
        v96 = v66 + 1;
        uint64_t v67 = v59;
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static Numeric.* infix(_:_:)();
        uint64_t v68 = v60;
        uint64_t v69 = v63;
        v70 = v64;
        uint64_t v71 = v60;
        uint64_t v72 = v62;
        uint64_t v73 = v90;
        v90(v68, v65);
        v73(v61, v65);
        uint64_t v62 = v72;
        uint64_t v60 = v71;
        uint64_t v64 = v70;
        uint64_t v63 = v69;
        dispatch thunk of SIMDStorage.subscript.setter();
        uint64_t v59 = v67;
        uint64_t v66 = v96;
      }
      while (v88 != v96);
    }
    return v86(v94, v64);
  }
  return result;
}

uint64_t (*reverse-mode derivative of static SIMD<>.* infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return partial apply for closure #1 in static SIMD<>._vjpMultiply(lhs:rhs:);
}

uint64_t (*static SIMD<>._jvpMultiply(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7))(uint64_t a1, uint64_t a2)
{
  uint64_t v56 = a3;
  uint64_t v57 = a7;
  uint64_t v50 = a5;
  uint64_t v51 = a6;
  uint64_t v55 = a2;
  uint64_t v49 = a1;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v43 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v9 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v11 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v44 = (char *)&v42 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v42 - v15;
  uint64_t v45 = *(void *)(a4 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v48 = (char *)&v42 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v46 = v21;
  uint64_t v47 = (char *)&v42 - v20;
  MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v42 - v22;
  dispatch thunk of SIMDStorage.init()();
  uint64_t v24 = a4;
  uint64_t v25 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v25 < 0)
  {
    uint64_t result = (uint64_t (*)(uint64_t, uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v53 = v16;
    uint64_t v54 = v23;
    uint64_t v26 = v44;
    if (v25)
    {
      uint64_t v27 = 0;
      uint64_t v28 = (void (**)(char *, uint64_t))(v43 + 8);
      uint64_t v52 = v25;
      do
      {
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static Numeric.* infix(_:_:)();
        uint64_t v29 = *v28;
        (*v28)(v11, AssociatedTypeWitness);
        v29(v26, AssociatedTypeWitness);
        dispatch thunk of SIMDStorage.subscript.setter();
        ++v27;
      }
      while (v52 != v27);
    }
    uint64_t v30 = v45;
    uint64_t v31 = *(void (**)(uint64_t, char *, uint64_t))(v45 + 32);
    v31(v49, v54, v24);
    uint64_t v32 = *(void (**)(char *, uint64_t, uint64_t))(v30 + 16);
    uint64_t v33 = v47;
    v32(v47, v55, v24);
    uint64_t v34 = v48;
    v32(v48, v56, v24);
    uint64_t v35 = *(unsigned __int8 *)(v30 + 80);
    uint64_t v36 = (v35 + 48) & ~v35;
    uint64_t v37 = (v46 + v35 + v36) & ~v35;
    uint64_t v38 = (void *)swift_allocObject();
    uint64_t v39 = v50;
    v38[2] = v24;
    _OWORD v38[3] = v39;
    uint64_t v40 = v57;
    void v38[4] = v51;
    v38[5] = v40;
    v31((uint64_t)v38 + v36, v33, v24);
    v31((uint64_t)v38 + v37, v34, v24);
    return partial apply for closure #1 in static SIMD<>._jvpMultiply(lhs:rhs:);
  }
  return result;
}

uint64_t closure #1 in static SIMD<>._jvpMultiply(lhs:rhs:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v63 = a8;
  uint64_t v47 = a1;
  uint64_t v48 = a7;
  uint64_t v58 = a4;
  uint64_t v45 = a3;
  uint64_t v49 = a9;
  uint64_t v11 = *(char **)(a6 + 48);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v50 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v13 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v52 = (char *)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v51 = (char *)&v45 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v62 = (char *)&v45 - v18;
  uint64_t v54 = *(void *)(a5 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v60 = (char *)&v45 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v46 = (char *)&v45 - v22;
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v25 = (char *)&v45 - v24;
  MEMORY[0x270FA5388](v23);
  uint64_t v53 = (char *)&v45 - v26;
  dispatch thunk of SIMDStorage.init()();
  uint64_t v27 = a5;
  uint64_t v28 = v11;
  uint64_t v29 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v29 < 0) {
    goto LABEL_10;
  }
  uint64_t v57 = a2;
  uint64_t v59 = v25;
  uint64_t v31 = v51;
  uint64_t v30 = v52;
  if (v29)
  {
    uint64_t v32 = 0;
    uint64_t v55 = v50 + 8;
    uint64_t v56 = (char *)v29;
    uint64_t v33 = (void (**)(char *, uint64_t))(v50 + 8);
    do
    {
      uint64_t v61 = v32 + 1;
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of static Numeric.* infix(_:_:)();
      uint64_t v34 = *v33;
      (*v33)(v30, AssociatedTypeWitness);
      v34(v31, AssociatedTypeWitness);
      dispatch thunk of SIMDStorage.subscript.setter();
      uint64_t v32 = v61;
    }
    while (v56 != v61);
  }
  uint64_t v56 = *(char **)(v54 + 32);
  uint64_t v57 = v54 + 32;
  ((void (*)(char *, char *, uint64_t))v56)(v53, v59, v27);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v35 = dispatch thunk of SIMDStorage.scalarCount.getter();
  uint64_t v61 = v28;
  if (v35 < 0)
  {
LABEL_10:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v36 = v51;
    uint64_t v37 = v52;
    if (v35)
    {
      uint64_t v38 = 0;
      uint64_t v39 = (void (**)(char *, uint64_t))(v50 + 8);
      uint64_t v59 = (char *)v35;
      do
      {
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static Numeric.* infix(_:_:)();
        uint64_t v40 = *v39;
        (*v39)(v37, AssociatedTypeWitness);
        v40(v36, AssociatedTypeWitness);
        dispatch thunk of SIMDStorage.subscript.setter();
        ++v38;
      }
      while (v59 != v38);
    }
    uint64_t v41 = v46;
    ((void (*)(char *, char *, uint64_t))v56)(v46, v60, v27);
    swift_getAssociatedConformanceWitness();
    uint64_t v42 = v53;
    dispatch thunk of static AdditiveArithmetic.+ infix(_:_:)();
    uint64_t v43 = *(void (**)(char *, uint64_t))(v54 + 8);
    v43(v41, v27);
    return ((uint64_t (*)(char *, uint64_t))v43)(v42, v27);
  }
  return result;
}

{
  uint64_t v11;
  uint64_t AssociatedTypeWitness;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(char *, uint64_t, uint64_t);
  char *v48;
  uint64_t v49;
  void (*v50)(char *, uint64_t);
  uint64_t v51;
  char *v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  char *v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  void (*v62)(char *, uint64_t);
  char *v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  char *v67;
  uint64_t v68;
  char *v69;
  void (*v70)(char *, char *, uint64_t);
  uint64_t v71;
  uint64_t v72;
  char *v73;
  char *v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  char *v78;
  char *v79;
  char *v80;
  char *v81;
  uint64_t v82;
  void (*v83)(char *, uint64_t);
  void (*v84)(char *, uint64_t);
  char *v85;
  char *v86;
  uint64_t result;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  char *v96;
  char *v97;
  char *v98;
  char *v99;
  void (*v100)(uint64_t, uint64_t);
  uint64_t v101;
  uint64_t v102;
  void (*v103)(char *, char *, uint64_t);
  uint64_t v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  char *v108;
  char *v109;
  char *v110;
  char *v111;
  char *v112;
  uint64_t v113;
  void (*v114)(char *, uint64_t);
  uint64_t v115;
  uint64_t v116;

  v113 = a8;
  v92 = a7;
  v89 = a4;
  v88 = a3;
  v91 = a1;
  v93 = a9;
  uint64_t v11 = *(void *)(a6 + 48);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v13 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  v96 = (char *)&v88 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  v99 = (char *)&v88 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  v98 = (char *)&v88 - v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  v105 = (char *)&v88 - v20;
  MEMORY[0x270FA5388](v19);
  v106 = *(void *)(a5 - 8);
  uint64_t v22 = MEMORY[0x270FA5388]((char *)&v88 - v21);
  v111 = (char *)&v88 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  v95 = (char *)&v88 - v25;
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  v110 = (char *)&v88 - v27;
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  v90 = (char *)&v88 - v29;
  uint64_t v30 = MEMORY[0x270FA5388](v28);
  v109 = (char *)&v88 - v31;
  uint64_t v32 = MEMORY[0x270FA5388](v30);
  uint64_t v34 = (char *)&v88 - v33;
  uint64_t v35 = MEMORY[0x270FA5388](v32);
  v108 = (char *)&v88 - v36;
  uint64_t v37 = MEMORY[0x270FA5388](v35);
  v97 = (char *)&v88 - v38;
  v115 = v39;
  uint64_t v40 = v37;
  uint64_t v42 = v41;
  v100 = *(void (**)(uint64_t, uint64_t))(v39 + 16);
  v101 = v39 + 16;
  v100(v37, a2);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v43 = a5;
  uint64_t v44 = v11;
  uint64_t v45 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v45 < 0) {
    goto LABEL_18;
  }
  uint64_t v46 = v45;
  uint64_t v47 = (void (*)(char *, uint64_t, uint64_t))v100;
  v116 = v44;
  uint64_t v48 = v105;
  if (v45)
  {
    uint64_t v49 = 0;
    do
    {
      v47(v48, v40, v42);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v49;
    }
    while (v46 != v49);
  }
  uint64_t v50 = *(void (**)(char *, uint64_t))(v115 + 8);
  v94 = v42;
  v114 = v50;
  v115 += 8;
  v50((char *)v40, v42);
  v103 = *(void (**)(char *, char *, uint64_t))(v106 + 32);
  v104 = v106 + 32;
  v103(v108, v34, v43);
  dispatch thunk of SIMDStorage.init()();
  v102 = v43;
  uint64_t v51 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v51 < 0) {
    goto LABEL_18;
  }
  uint64_t v52 = v98;
  uint64_t v53 = v99;
  uint64_t v54 = v116;
  uint64_t v55 = v102;
  uint64_t v56 = v105;
  uint64_t v57 = v94;
  if (v51)
  {
    uint64_t v58 = 0;
    v107 = v51;
    do
    {
      v112 = v58 + 1;
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of static Numeric.* infix(_:_:)();
      uint64_t v59 = v56;
      uint64_t v60 = v55;
      uint64_t v61 = v54;
      uint64_t v62 = v114;
      v114(v53, v57);
      v62(v52, v57);
      uint64_t v54 = v61;
      uint64_t v55 = v60;
      uint64_t v56 = v59;
      dispatch thunk of SIMDStorage.subscript.setter();
      uint64_t v58 = v112;
    }
    while ((char *)v107 != v112);
  }
  uint64_t v63 = v108;
  v108 = *(char **)(v106 + 8);
  v106 += 8;
  ((void (*)(char *, uint64_t))v108)(v63, v55);
  v103(v97, v109, v55);
  ((void (*)(char *, uint64_t, uint64_t))v100)(v96, v89, v57);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v64 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v64 < 0) {
    goto LABEL_18;
  }
  uint64_t v65 = v64;
  uint64_t v66 = v96;
  uint64_t v67 = v95;
  uint64_t v68 = v102;
  uint64_t v69 = v105;
  v70 = (void (*)(char *, char *, uint64_t))v100;
  if (v64)
  {
    uint64_t v71 = 0;
    do
    {
      v70(v69, v66, v57);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v71;
    }
    while (v65 != v71);
  }
  v114(v66, v57);
  v103(v110, v67, v68);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v72 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v72 < 0)
  {
LABEL_18:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v73 = v98;
    v74 = v99;
    uint64_t v75 = v102;
    v76 = v105;
    uint64_t v77 = v94;
    if (v72)
    {
      v78 = 0;
      v109 = (char *)v72;
      do
      {
        v112 = v78 + 1;
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static Numeric.* infix(_:_:)();
        v79 = v74;
        v80 = v74;
        v81 = v76;
        v82 = v75;
        v83 = v114;
        v114(v79, v77);
        v83(v73, v77);
        uint64_t v75 = v82;
        v76 = v81;
        v74 = v80;
        dispatch thunk of SIMDStorage.subscript.setter();
        v78 = v112;
      }
      while (v109 != v112);
    }
    v84 = (void (*)(char *, uint64_t))v108;
    ((void (*)(char *, uint64_t))v108)(v110, v75);
    v85 = v90;
    v103(v90, v111, v75);
    swift_getAssociatedConformanceWitness();
    v86 = v97;
    dispatch thunk of static AdditiveArithmetic.+ infix(_:_:)();
    v84(v85, v75);
    return ((uint64_t (*)(char *, uint64_t))v84)(v86, v75);
  }
  return result;
}

uint64_t (*forward-mode derivative of static SIMD<>.* infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7))(uint64_t a1, uint64_t a2)
{
  return partial apply for closure #1 in static SIMD<>._jvpMultiply(lhs:rhs:);
}

uint64_t (*static SIMD<>._vjpDivide(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v56 = a3;
  uint64_t v57 = a7;
  uint64_t v50 = a5;
  uint64_t v51 = a6;
  uint64_t v55 = a2;
  uint64_t v49 = a1;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v43 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v9 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v11 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v44 = (char *)&v42 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v42 - v15;
  uint64_t v45 = *(void *)(a4 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v48 = (char *)&v42 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v46 = v21;
  uint64_t v47 = (char *)&v42 - v20;
  MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v42 - v22;
  dispatch thunk of SIMDStorage.init()();
  uint64_t v24 = a4;
  uint64_t v25 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v25 < 0)
  {
    uint64_t result = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v53 = v16;
    uint64_t v54 = v23;
    uint64_t v26 = v44;
    if (v25)
    {
      uint64_t v27 = 0;
      uint64_t v28 = (void (**)(char *, uint64_t))(v43 + 8);
      uint64_t v52 = v25;
      do
      {
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static FloatingPoint./ infix(_:_:)();
        uint64_t v29 = *v28;
        (*v28)(v11, AssociatedTypeWitness);
        v29(v26, AssociatedTypeWitness);
        dispatch thunk of SIMDStorage.subscript.setter();
        ++v27;
      }
      while (v52 != v27);
    }
    uint64_t v30 = v45;
    uint64_t v31 = *(void (**)(uint64_t, char *, uint64_t))(v45 + 32);
    v31(v49, v54, v24);
    uint64_t v32 = *(void (**)(char *, uint64_t, uint64_t))(v30 + 16);
    uint64_t v33 = v47;
    v32(v47, v56, v24);
    uint64_t v34 = v48;
    v32(v48, v55, v24);
    uint64_t v35 = *(unsigned __int8 *)(v30 + 80);
    uint64_t v36 = (v35 + 48) & ~v35;
    uint64_t v37 = (v46 + v35 + v36) & ~v35;
    uint64_t v38 = (void *)swift_allocObject();
    uint64_t v39 = v50;
    v38[2] = v24;
    _OWORD v38[3] = v39;
    uint64_t v40 = v57;
    void v38[4] = v51;
    v38[5] = v40;
    v31((uint64_t)v38 + v36, v33, v24);
    v31((uint64_t)v38 + v37, v34, v24);
    return partial apply for closure #1 in static SIMD<>._vjpDivide(lhs:rhs:);
  }
  return result;
}

uint64_t closure #1 in static SIMD<>._vjpDivide(lhs:rhs:)(void (*a1)(void, void, void), uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(char *, char *), char *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  v117 = a5;
  uint64_t v120 = a4;
  uint64_t v121 = a2;
  uint64_t v122 = a3;
  v112 = a1;
  uint64_t v130 = *(void *)(a9 + 16);
  uint64_t v131 = *(void *)(*(void *)(v130 + 16) + 8);
  uint64_t v10 = *(void *)(v131 + 16);
  uint64_t v11 = *(void *)(a7 + 48);
  swift_getAssociatedTypeWitness();
  uint64_t v106 = v10;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  v104 = (char *)&v104 - v12;
  uint64_t v13 = swift_checkMetadataState();
  uint64_t v134 = *(void *)(v13 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  v108 = (char *)&v104 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  v109 = (char *)&v104 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  v113 = (char *)&v104 - v19;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v104 - v21;
  uint64_t v23 = MEMORY[0x270FA5388](v20);
  v133 = (char *)&v104 - v24;
  uint64_t v114 = *((void *)a6 - 1);
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  v128 = (char *)&v104 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  v125 = (char *)&v104 - v28;
  uint64_t v29 = MEMORY[0x270FA5388](v27);
  v127 = (char *)&v104 - v30;
  uint64_t v31 = MEMORY[0x270FA5388](v29);
  v129 = (char *)&v104 - v32;
  uint64_t v33 = MEMORY[0x270FA5388](v31);
  uint64_t v35 = (char *)&v104 - v34;
  uint64_t v36 = MEMORY[0x270FA5388](v33);
  v123 = (char *)&v104 - v37;
  uint64_t v38 = MEMORY[0x270FA5388](v36);
  v126 = (char *)&v104 - v39;
  uint64_t v40 = MEMORY[0x270FA5388](v38);
  v110 = (char *)&v104 - v41;
  MEMORY[0x270FA5388](v40);
  uint64_t v43 = (char *)&v104 - v42;
  dispatch thunk of SIMDStorage.init()();
  uint64_t v44 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v44 < 0) {
    goto LABEL_26;
  }
  v107 = v35;
  v124 = v43;
  uint64_t v119 = v11;
  uint64_t v45 = a6;
  uint64_t v46 = v113;
  uint64_t v47 = v133;
  uint64_t v118 = v13;
  if (v44)
  {
    uint64_t v48 = 0;
    uint64_t v115 = v134 + 8;
    v116 = (char *)v44;
    uint64_t v49 = (void (**)(char *, uint64_t))(v134 + 8);
    do
    {
      v132 = v48 + 1;
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of SIMDStorage.subscript.getter();
      uint64_t v50 = v118;
      dispatch thunk of static FloatingPoint./ infix(_:_:)();
      uint64_t v51 = v47;
      uint64_t v52 = *v49;
      (*v49)(v46, v50);
      v52(v22, v50);
      uint64_t v47 = v51;
      dispatch thunk of SIMDStorage.subscript.setter();
      uint64_t v48 = v132;
    }
    while (v116 != v132);
  }
  uint64_t v53 = v45;
  v111 = v22;
  uint64_t v54 = *(void (**)(void, void, void))(v114 + 32);
  uint64_t v55 = v112;
  uint64_t v115 = v114 + 32;
  v112 = v54;
  v54(v55, v124, v45);
  uint64_t v56 = v118;
  swift_getAssociatedConformanceWitness();
  dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
  uint64_t v57 = v109;
  dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
  uint64_t v58 = *(void (**)(char *, char *, uint64_t))(v134 + 16);
  v58(v108, v57, v56);
  uint64_t v59 = v119;
  dispatch thunk of SIMDStorage.init()();
  v124 = v53;
  uint64_t v60 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v60 < 0) {
    goto LABEL_26;
  }
  uint64_t v61 = v60;
  uint64_t v62 = v108;
  uint64_t v63 = v107;
  uint64_t v64 = v133;
  if (v60)
  {
    uint64_t v65 = 0;
    do
    {
      v58(v64, v62, v56);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v65;
    }
    while (v61 != v65);
  }
  uint64_t v66 = v59;
  uint64_t v68 = v134 + 8;
  uint64_t v67 = *(void (**)(char *, uint64_t))(v134 + 8);
  v67(v62, v56);
  v112(v123, v63, v124);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v69 = v66;
  uint64_t v70 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v70 < 0) {
    goto LABEL_26;
  }
  uint64_t v71 = v70;
  v67(v109, v56);
  uint64_t v134 = v68;
  v132 = (char *)v67;
  uint64_t v72 = v113;
  uint64_t v73 = v111;
  v74 = v123;
  uint64_t v75 = v124;
  if (v71)
  {
    v76 = 0;
    v116 = (char *)v71;
    do
    {
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of static AdditiveArithmetic.- infix(_:_:)();
      uint64_t v77 = v132;
      ((void (*)(char *, uint64_t))v132)(v72, v56);
      ((void (*)(char *, uint64_t))v77)(v73, v56);
      dispatch thunk of SIMDStorage.subscript.setter();
      v74 = v123;
      ++v76;
    }
    while (v116 != v76);
  }
  v78 = *(void (**)(char *, char *))(v114 + 8);
  v114 += 8;
  v117 = v78;
  v78(v74, v75);
  v112(v126, v129, v75);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v79 = v69;
  uint64_t v80 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v80 < 0) {
    goto LABEL_26;
  }
  v81 = v113;
  v82 = v111;
  v83 = v75;
  if (v80)
  {
    v84 = 0;
    v123 = (char *)v80;
    do
    {
      v129 = v84 + 1;
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of static Numeric.* infix(_:_:)();
      v85 = v83;
      v86 = v132;
      ((void (*)(char *, uint64_t))v132)(v81, v56);
      ((void (*)(char *, uint64_t))v86)(v82, v56);
      v83 = v85;
      dispatch thunk of SIMDStorage.subscript.setter();
      v84 = v129;
    }
    while (v123 != v129);
  }
  v112(v127, v125, v83);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v87 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v87 < 0) {
    goto LABEL_26;
  }
  uint64_t v88 = v79;
  v89 = v83;
  v90 = v113;
  v91 = v111;
  if (v87)
  {
    v92 = 0;
    v129 = (char *)v87;
    v93 = v132;
    do
    {
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of static FloatingPoint./ infix(_:_:)();
      ((void (*)(char *, uint64_t))v93)(v90, v56);
      ((void (*)(char *, uint64_t))v93)(v91, v56);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v92;
    }
    while (v129 != v92);
  }
  v94 = v117;
  v117(v127, v89);
  v94(v126, v89);
  v112(v110, v128, v89);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v95 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v95 < 0)
  {
LABEL_26:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v96 = v110;
    if (v95)
    {
      uint64_t v97 = 0;
      v129 = (char *)v95;
      do
      {
        uint64_t v130 = v97 + 1;
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static Numeric.* infix(_:_:)();
        v98 = v90;
        v99 = v90;
        v100 = v89;
        uint64_t v101 = v88;
        v102 = v132;
        ((void (*)(char *, uint64_t))v132)(v98, v56);
        ((void (*)(char *, uint64_t))v102)(v91, v56);
        uint64_t v88 = v101;
        v89 = v100;
        v90 = v99;
        dispatch thunk of SIMDStorage.subscript.setter();
        uint64_t v97 = v130;
      }
      while (v129 != (char *)v130);
    }
    return ((uint64_t (*)(char *, char *))v117)(v96, v89);
  }
  return result;
}

uint64_t (*reverse-mode derivative of static SIMD<>./ infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return partial apply for closure #1 in static SIMD<>._vjpDivide(lhs:rhs:);
}

uint64_t (*static SIMD<>._jvpDivide(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7))(uint64_t a1, uint64_t a2)
{
  uint64_t v56 = a3;
  uint64_t v57 = a7;
  uint64_t v50 = a5;
  uint64_t v51 = a6;
  uint64_t v55 = a2;
  uint64_t v49 = a1;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v43 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v9 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v11 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v44 = (char *)&v42 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v42 - v15;
  uint64_t v45 = *(void *)(a4 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v48 = (char *)&v42 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v46 = v21;
  uint64_t v47 = (char *)&v42 - v20;
  MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v42 - v22;
  dispatch thunk of SIMDStorage.init()();
  uint64_t v24 = a4;
  uint64_t v25 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v25 < 0)
  {
    uint64_t result = (uint64_t (*)(uint64_t, uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v53 = v16;
    uint64_t v54 = v23;
    uint64_t v26 = v44;
    if (v25)
    {
      uint64_t v27 = 0;
      uint64_t v28 = (void (**)(char *, uint64_t))(v43 + 8);
      uint64_t v52 = v25;
      do
      {
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static FloatingPoint./ infix(_:_:)();
        uint64_t v29 = *v28;
        (*v28)(v11, AssociatedTypeWitness);
        v29(v26, AssociatedTypeWitness);
        dispatch thunk of SIMDStorage.subscript.setter();
        ++v27;
      }
      while (v52 != v27);
    }
    uint64_t v30 = v45;
    uint64_t v31 = *(void (**)(uint64_t, char *, uint64_t))(v45 + 32);
    v31(v49, v54, v24);
    uint64_t v32 = *(void (**)(char *, uint64_t, uint64_t))(v30 + 16);
    uint64_t v33 = v47;
    v32(v47, v56, v24);
    uint64_t v34 = v48;
    v32(v48, v55, v24);
    uint64_t v35 = *(unsigned __int8 *)(v30 + 80);
    uint64_t v36 = (v35 + 48) & ~v35;
    uint64_t v37 = (v46 + v35 + v36) & ~v35;
    uint64_t v38 = (void *)swift_allocObject();
    uint64_t v39 = v50;
    v38[2] = v24;
    _OWORD v38[3] = v39;
    uint64_t v40 = v57;
    void v38[4] = v51;
    v38[5] = v40;
    v31((uint64_t)v38 + v36, v33, v24);
    v31((uint64_t)v38 + v37, v34, v24);
    return partial apply for closure #1 in static SIMD<>._jvpDivide(lhs:rhs:);
  }
  return result;
}

uint64_t closure #1 in static SIMD<>._jvpDivide(lhs:rhs:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, char *a4@<X4>, uint64_t a5@<X5>, void (*a6)(char *, char *)@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>)
{
  uint64_t v88 = a7;
  uint64_t v68 = a3;
  uint64_t v69 = a6;
  uint64_t v80 = a2;
  uint64_t v81 = a8;
  uint64_t v78 = a1;
  uint64_t v9 = *(char **)(a5 + 48);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v73 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v74 = AssociatedTypeWitness;
  uint64_t v11 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v13 = (char *)&v66 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&v66 - v15;
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v87 = (char *)&v66 - v18;
  uint64_t v75 = *((void *)a4 - 1);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  v83 = (char *)&v66 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  v85 = (char *)&v66 - v22;
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  v82 = (char *)&v66 - v24;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v67 = (char *)&v66 - v26;
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  uint64_t v29 = (char *)&v66 - v28;
  uint64_t v30 = MEMORY[0x270FA5388](v27);
  uint64_t v72 = (char *)&v66 - v31;
  MEMORY[0x270FA5388](v30);
  v84 = (char *)&v66 - v32;
  dispatch thunk of SIMDStorage.init()();
  uint64_t v33 = a4;
  uint64_t v34 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v34 < 0) {
    goto LABEL_18;
  }
  uint64_t v79 = v29;
  uint64_t v35 = v74;
  if (v34)
  {
    uint64_t v36 = 0;
    v76 = (void (**)(char *, uint64_t))(v73 + 8);
    uint64_t v77 = v34;
    do
    {
      v86 = v36 + 1;
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of static Numeric.* infix(_:_:)();
      uint64_t v37 = *v76;
      (*v76)(v13, v35);
      v37(v16, v35);
      dispatch thunk of SIMDStorage.subscript.setter();
      uint64_t v36 = v86;
    }
    while ((char *)v77 != v86);
  }
  uint64_t v70 = *(void (**)(char *, char *, char *))(v75 + 32);
  uint64_t v71 = v75 + 32;
  v70(v72, v79, a4);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v38 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v38 < 0) {
    goto LABEL_18;
  }
  uint64_t v79 = v9;
  uint64_t v39 = v13;
  uint64_t v40 = v74;
  if (v38)
  {
    uint64_t v41 = 0;
    v76 = (void (**)(char *, uint64_t))(v73 + 8);
    uint64_t v77 = v38;
    uint64_t v42 = (void (**)(char *, uint64_t))(v73 + 8);
    do
    {
      v86 = v41 + 1;
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of static Numeric.* infix(_:_:)();
      uint64_t v43 = *v42;
      (*v42)(v39, v40);
      v43(v16, v40);
      dispatch thunk of SIMDStorage.subscript.setter();
      uint64_t v41 = v86;
    }
    while ((char *)v77 != v86);
  }
  v76 = (void (**)(char *, uint64_t))v16;
  uint64_t v77 = (uint64_t)v39;
  uint64_t v44 = v67;
  v70(v67, v82, v33);
  swift_getAssociatedConformanceWitness();
  uint64_t v45 = v72;
  dispatch thunk of static AdditiveArithmetic.- infix(_:_:)();
  uint64_t v46 = v75 + 8;
  uint64_t v47 = *(void (**)(char *, char *))(v75 + 8);
  v47(v44, v33);
  uint64_t v75 = v46;
  uint64_t v69 = v47;
  v47(v45, v33);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v72 = v33;
  uint64_t v48 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v48 < 0) {
    goto LABEL_18;
  }
  uint64_t v49 = v76;
  uint64_t v50 = v77;
  uint64_t v51 = v72;
  uint64_t v52 = v74;
  if (v48)
  {
    uint64_t v53 = 0;
    uint64_t v78 = v73 + 8;
    v82 = (char *)v48;
    uint64_t v54 = (void (**)(uint64_t, uint64_t))(v73 + 8);
    do
    {
      v86 = v53 + 1;
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of static Numeric.* infix(_:_:)();
      uint64_t v55 = *v54;
      (*v54)(v50, v52);
      v55((uint64_t)v49, v52);
      dispatch thunk of SIMDStorage.subscript.setter();
      uint64_t v53 = v86;
    }
    while (v82 != v86);
  }
  v70(v85, v83, v51);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v56 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v56 < 0)
  {
LABEL_18:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v57 = v76;
    uint64_t v58 = v77;
    uint64_t v59 = v72;
    uint64_t v60 = v74;
    if (v56)
    {
      uint64_t v61 = 0;
      uint64_t v62 = (void (**)(uint64_t, uint64_t))(v73 + 8);
      v86 = (char *)v56;
      do
      {
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static FloatingPoint./ infix(_:_:)();
        uint64_t v63 = *v62;
        (*v62)(v58, v60);
        v63((uint64_t)v57, v60);
        dispatch thunk of SIMDStorage.subscript.setter();
        ++v61;
      }
      while (v86 != v61);
    }
    uint64_t v64 = (uint64_t (*)(char *, char *))v69;
    v69(v85, v59);
    return v64(v84, v59);
  }
  return result;
}

uint64_t (*forward-mode derivative of static SIMD<>./ infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7))(uint64_t a1, uint64_t a2)
{
  return partial apply for closure #1 in static SIMD<>._jvpDivide(lhs:rhs:);
}

uint64_t (*static SIMD<>._vjpAdd(lhs:rhs:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v72 = a6;
  uint64_t v73 = a8;
  uint64_t v78 = a3;
  uint64_t v79 = a7;
  uint64_t v70 = a1;
  uint64_t v71 = a5;
  uint64_t v12 = *(void *)(a5 + 48);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v14 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v15 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v64 = (char *)&v62 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v67 = (char *)&v62 - v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v62 - v20;
  MEMORY[0x270FA5388](v19);
  uint64_t v75 = *(void *)(a4 - 8);
  uint64_t v23 = MEMORY[0x270FA5388]((char *)&v62 - v22);
  uint64_t v25 = (char *)&v62 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = MEMORY[0x270FA5388](v23);
  uint64_t v28 = (char *)&v62 - v27;
  uint64_t v29 = MEMORY[0x270FA5388](v26);
  uint64_t v74 = (char *)&v62 - v30;
  uint64_t v81 = v14;
  uint64_t v31 = *(void (**)(void, void))(v14 + 16);
  uint64_t v76 = v14 + 16;
  uint64_t v77 = (void (*)(void, void))v29;
  uint64_t v33 = v32;
  uint64_t v34 = (void (*)(char *, void (*)(void, void), uint64_t))v31;
  v31(v29, a2);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v35 = v28;
  uint64_t v36 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v36 < 0) {
    goto LABEL_10;
  }
  uint64_t v37 = v36;
  uint64_t v80 = v25;
  uint64_t v82 = v12;
  uint64_t v38 = v77;
  if (v36)
  {
    uint64_t v39 = 0;
    do
    {
      v34(v21, v38, v33);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v39;
    }
    while (v37 != v39);
  }
  uint64_t v63 = v21;
  uint64_t v40 = v81 + 8;
  uint64_t v41 = *(void (**)(void, uint64_t))(v81 + 8);
  v41(v38, v33);
  uint64_t v68 = *(void (**)(char *, char *, uint64_t))(v75 + 32);
  uint64_t v69 = v75 + 32;
  v68(v74, v35, a4);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v42 = a4;
  uint64_t v43 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v43 < 0)
  {
LABEL_10:
    uint64_t result = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v65 = a9;
    uint64_t v66 = a10;
    uint64_t v81 = v40;
    uint64_t v44 = v63;
    uint64_t v45 = v64;
    uint64_t v46 = v67;
    uint64_t v47 = v74;
    uint64_t v77 = v41;
    if (v43)
    {
      uint64_t v48 = v33;
      uint64_t v49 = 0;
      uint64_t v76 = v43;
      do
      {
        uint64_t v82 = v49 + 1;
        uint64_t v50 = v46;
        uint64_t v51 = v47;
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static AdditiveArithmetic.+ infix(_:_:)();
        uint64_t v52 = v45;
        uint64_t v53 = v45;
        uint64_t v54 = v44;
        uint64_t v55 = v42;
        uint64_t v56 = (void (*)(char *, uint64_t))v77;
        v77(v52, v48);
        v56(v50, v48);
        uint64_t v42 = v55;
        uint64_t v44 = v54;
        uint64_t v45 = v53;
        dispatch thunk of SIMDStorage.subscript.setter();
        uint64_t v46 = v50;
        uint64_t v47 = v51;
        uint64_t v49 = v82;
      }
      while (v76 != v82);
    }
    (*(void (**)(char *, uint64_t))(v75 + 8))(v47, v42);
    v68(v70, v80, v42);
    uint64_t v57 = (void *)swift_allocObject();
    uint64_t v58 = v71;
    v57[2] = v42;
    v57[3] = v58;
    uint64_t v59 = v79;
    v57[4] = v72;
    v57[5] = v59;
    uint64_t v60 = v65;
    v57[6] = v73;
    v57[7] = v60;
    v57[8] = v66;
    return partial apply for closure #1 in static SIMD<>._vjpAdd(lhs:rhs:);
  }
  return result;
}

{
  uint64_t v12;
  uint64_t AssociatedTypeWitness;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(void, void);
  uint64_t v32;
  uint64_t v33;
  void (*v34)(char *, void (*)(void, void), uint64_t);
  char *v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(void, void);
  uint64_t v39;
  uint64_t v40;
  void (*v41)(void, uint64_t);
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  char *v52;
  char *v53;
  char *v54;
  uint64_t v55;
  void (*v56)(char *, uint64_t);
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t (*result)(uint64_t, uint64_t, uint64_t);
  uint64_t v62;
  char *v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  void (*v68)(char *, char *, uint64_t);
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void (*v77)(void, void);
  uint64_t v78;
  char *v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;

  uint64_t v73 = a6;
  uint64_t v74 = a8;
  uint64_t v78 = a7;
  uint64_t v70 = a2;
  uint64_t v71 = a1;
  uint64_t v72 = a5;
  uint64_t v12 = *(void *)(a5 + 48);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v14 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v15 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v64 = (char *)&v62 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v67 = (char *)&v62 - v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v62 - v20;
  MEMORY[0x270FA5388](v19);
  uint64_t v75 = *(void *)(a4 - 8);
  uint64_t v23 = MEMORY[0x270FA5388]((char *)&v62 - v22);
  uint64_t v25 = (char *)&v62 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = MEMORY[0x270FA5388](v23);
  uint64_t v28 = (char *)&v62 - v27;
  uint64_t v29 = MEMORY[0x270FA5388](v26);
  uint64_t v79 = (char *)&v62 - v30;
  uint64_t v81 = v14;
  uint64_t v31 = *(void (**)(void, void))(v14 + 16);
  uint64_t v76 = v14 + 16;
  uint64_t v77 = (void (*)(void, void))v29;
  uint64_t v33 = v32;
  uint64_t v34 = (void (*)(char *, void (*)(void, void), uint64_t))v31;
  v31(v29, a3);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v35 = v28;
  uint64_t v36 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v36 < 0) {
    goto LABEL_10;
  }
  uint64_t v37 = v36;
  uint64_t v80 = v25;
  uint64_t v82 = v12;
  uint64_t v38 = v77;
  if (v36)
  {
    uint64_t v39 = 0;
    do
    {
      v34(v21, v38, v33);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v39;
    }
    while (v37 != v39);
  }
  uint64_t v63 = v21;
  uint64_t v40 = v81 + 8;
  uint64_t v41 = *(void (**)(void, uint64_t))(v81 + 8);
  v41(v38, v33);
  uint64_t v68 = *(void (**)(char *, char *, uint64_t))(v75 + 32);
  uint64_t v69 = v75 + 32;
  v68(v79, v35, a4);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v42 = a4;
  uint64_t v43 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v43 < 0)
  {
LABEL_10:
    uint64_t result = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v65 = a9;
    uint64_t v66 = a10;
    uint64_t v44 = v70;
    uint64_t v81 = v40;
    uint64_t v45 = v63;
    uint64_t v46 = v64;
    uint64_t v47 = v67;
    uint64_t v77 = v41;
    if (v43)
    {
      uint64_t v48 = v33;
      uint64_t v49 = 0;
      uint64_t v76 = v43;
      do
      {
        uint64_t v82 = v49 + 1;
        uint64_t v50 = v47;
        uint64_t v51 = v44;
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static AdditiveArithmetic.+ infix(_:_:)();
        uint64_t v52 = v46;
        uint64_t v53 = v46;
        uint64_t v54 = v45;
        uint64_t v55 = v42;
        uint64_t v56 = (void (*)(char *, uint64_t))v77;
        v77(v52, v48);
        v56(v50, v48);
        uint64_t v42 = v55;
        uint64_t v45 = v54;
        uint64_t v46 = v53;
        dispatch thunk of SIMDStorage.subscript.setter();
        uint64_t v47 = v50;
        uint64_t v44 = v51;
        uint64_t v49 = v82;
      }
      while (v76 != v82);
    }
    (*(void (**)(char *, uint64_t))(v75 + 8))(v79, v42);
    v68(v71, v80, v42);
    uint64_t v57 = (void *)swift_allocObject();
    uint64_t v58 = v72;
    v57[2] = v42;
    v57[3] = v58;
    uint64_t v59 = v78;
    v57[4] = v73;
    v57[5] = v59;
    uint64_t v60 = v65;
    v57[6] = v74;
    v57[7] = v60;
    v57[8] = v66;
    return partial apply for closure #1 in static SIMD<>._vjpAdd(lhs:rhs:);
  }
  return result;
}

uint64_t closure #1 in static SIMD<>._vjpAdd(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  SIMD<>.sum()(AssociatedTypeWitness, *(void *)(a10 + 16), a1);
  uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16);

  return v14(a2, a3, AssociatedTypeWitness);
}

{
  uint64_t AssociatedTypeWitness;

  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16))(a1, a3, AssociatedTypeWitness);
  return SIMD<>.sum()(AssociatedTypeWitness, *(void *)(a10 + 16), a2);
}

uint64_t SIMD<>.sum()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v9 = (char *)v16 - v8;
  v16[1] = *(void *)(*(void *)(*(void *)(a2 + 16) + 8) + 8);
  dispatch thunk of static AdditiveArithmetic.zero.getter();
  v16[0] = a3;
  dispatch thunk of static SignedNumeric.- prefix(_:)();
  uint64_t v10 = *(void (**)(char *, uint64_t))(v7 + 8);
  v10(v9, AssociatedTypeWitness);
  uint64_t result = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (result < 0)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v12 = result;
    if (result)
    {
      uint64_t v13 = a1;
      uint64_t result = 0;
      do
      {
        uint64_t v14 = result + 1;
        uint64_t v15 = v13;
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static AdditiveArithmetic.+= infix(_:_:)();
        v10(v9, AssociatedTypeWitness);
        uint64_t v13 = v15;
        uint64_t result = v14;
      }
      while (v12 != v14);
    }
  }
  return result;
}

uint64_t (*reverse-mode derivative of static SIMD<>.+ infix(_:_:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return partial apply for closure #1 in static SIMD<>._vjpAdd(lhs:rhs:);
}

{
  static SIMD<>._vjpAdd(lhs:rhs:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
  return partial apply for closure #1 in static SIMD<>._vjpAdd(lhs:rhs:);
}

uint64_t (*static SIMD<>._jvpAdd(lhs:rhs:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10))(uint64_t a1, uint64_t a2)
{
  uint64_t v72 = a6;
  uint64_t v73 = a8;
  uint64_t v78 = a3;
  uint64_t v79 = a7;
  uint64_t v70 = a1;
  uint64_t v71 = a5;
  uint64_t v12 = *(void *)(a5 + 48);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v14 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v15 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v64 = (char *)&v62 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v67 = (char *)&v62 - v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v62 - v20;
  MEMORY[0x270FA5388](v19);
  uint64_t v75 = *(void *)(a4 - 8);
  uint64_t v23 = MEMORY[0x270FA5388]((char *)&v62 - v22);
  uint64_t v25 = (char *)&v62 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = MEMORY[0x270FA5388](v23);
  uint64_t v28 = (char *)&v62 - v27;
  uint64_t v29 = MEMORY[0x270FA5388](v26);
  uint64_t v74 = (char *)&v62 - v30;
  uint64_t v81 = v14;
  uint64_t v31 = *(void (**)(void, void))(v14 + 16);
  uint64_t v76 = v14 + 16;
  uint64_t v77 = (void (*)(void, void))v29;
  uint64_t v33 = v32;
  uint64_t v34 = (void (*)(char *, void (*)(void, void), uint64_t))v31;
  v31(v29, a2);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v35 = v28;
  uint64_t v36 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v36 < 0) {
    goto LABEL_10;
  }
  uint64_t v37 = v36;
  uint64_t v80 = v25;
  uint64_t v82 = v12;
  uint64_t v38 = v77;
  if (v36)
  {
    uint64_t v39 = 0;
    do
    {
      v34(v21, v38, v33);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v39;
    }
    while (v37 != v39);
  }
  uint64_t v63 = v21;
  uint64_t v40 = v81 + 8;
  uint64_t v41 = *(void (**)(void, uint64_t))(v81 + 8);
  v41(v38, v33);
  uint64_t v68 = *(void (**)(char *, char *, uint64_t))(v75 + 32);
  uint64_t v69 = v75 + 32;
  v68(v74, v35, a4);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v42 = a4;
  uint64_t v43 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v43 < 0)
  {
LABEL_10:
    uint64_t result = (uint64_t (*)(uint64_t, uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v65 = a9;
    uint64_t v66 = a10;
    uint64_t v81 = v40;
    uint64_t v44 = v63;
    uint64_t v45 = v64;
    uint64_t v46 = v67;
    uint64_t v47 = v74;
    uint64_t v77 = v41;
    if (v43)
    {
      uint64_t v48 = v33;
      uint64_t v49 = 0;
      uint64_t v76 = v43;
      do
      {
        uint64_t v82 = v49 + 1;
        uint64_t v50 = v46;
        uint64_t v51 = v47;
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static AdditiveArithmetic.+ infix(_:_:)();
        uint64_t v52 = v45;
        uint64_t v53 = v45;
        uint64_t v54 = v44;
        uint64_t v55 = v42;
        uint64_t v56 = (void (*)(char *, uint64_t))v77;
        v77(v52, v48);
        v56(v50, v48);
        uint64_t v42 = v55;
        uint64_t v44 = v54;
        uint64_t v45 = v53;
        dispatch thunk of SIMDStorage.subscript.setter();
        uint64_t v46 = v50;
        uint64_t v47 = v51;
        uint64_t v49 = v82;
      }
      while (v76 != v82);
    }
    (*(void (**)(char *, uint64_t))(v75 + 8))(v47, v42);
    v68(v70, v80, v42);
    uint64_t v57 = (void *)swift_allocObject();
    uint64_t v58 = v71;
    v57[2] = v42;
    v57[3] = v58;
    uint64_t v59 = v79;
    v57[4] = v72;
    v57[5] = v59;
    uint64_t v60 = v65;
    v57[6] = v73;
    v57[7] = v60;
    v57[8] = v66;
    return partial apply for closure #1 in static SIMD<>._jvpAdd(lhs:rhs:);
  }
  return result;
}

{
  uint64_t v12;
  uint64_t AssociatedTypeWitness;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(void, void);
  uint64_t v32;
  uint64_t v33;
  void (*v34)(char *, void (*)(void, void), uint64_t);
  char *v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(void, void);
  uint64_t v39;
  uint64_t v40;
  void (*v41)(void, uint64_t);
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  char *v52;
  char *v53;
  char *v54;
  uint64_t v55;
  void (*v56)(char *, uint64_t);
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t (*result)(uint64_t, uint64_t);
  uint64_t v62;
  char *v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  void (*v68)(char *, char *, uint64_t);
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void (*v77)(void, void);
  uint64_t v78;
  char *v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;

  uint64_t v73 = a6;
  uint64_t v74 = a8;
  uint64_t v78 = a7;
  uint64_t v70 = a2;
  uint64_t v71 = a1;
  uint64_t v72 = a5;
  uint64_t v12 = *(void *)(a5 + 48);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v14 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v15 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v64 = (char *)&v62 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v67 = (char *)&v62 - v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v62 - v20;
  MEMORY[0x270FA5388](v19);
  uint64_t v75 = *(void *)(a4 - 8);
  uint64_t v23 = MEMORY[0x270FA5388]((char *)&v62 - v22);
  uint64_t v25 = (char *)&v62 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = MEMORY[0x270FA5388](v23);
  uint64_t v28 = (char *)&v62 - v27;
  uint64_t v29 = MEMORY[0x270FA5388](v26);
  uint64_t v79 = (char *)&v62 - v30;
  uint64_t v81 = v14;
  uint64_t v31 = *(void (**)(void, void))(v14 + 16);
  uint64_t v76 = v14 + 16;
  uint64_t v77 = (void (*)(void, void))v29;
  uint64_t v33 = v32;
  uint64_t v34 = (void (*)(char *, void (*)(void, void), uint64_t))v31;
  v31(v29, a3);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v35 = v28;
  uint64_t v36 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v36 < 0) {
    goto LABEL_10;
  }
  uint64_t v37 = v36;
  uint64_t v80 = v25;
  uint64_t v82 = v12;
  uint64_t v38 = v77;
  if (v36)
  {
    uint64_t v39 = 0;
    do
    {
      v34(v21, v38, v33);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v39;
    }
    while (v37 != v39);
  }
  uint64_t v63 = v21;
  uint64_t v40 = v81 + 8;
  uint64_t v41 = *(void (**)(void, uint64_t))(v81 + 8);
  v41(v38, v33);
  uint64_t v68 = *(void (**)(char *, char *, uint64_t))(v75 + 32);
  uint64_t v69 = v75 + 32;
  v68(v79, v35, a4);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v42 = a4;
  uint64_t v43 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v43 < 0)
  {
LABEL_10:
    uint64_t result = (uint64_t (*)(uint64_t, uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v65 = a9;
    uint64_t v66 = a10;
    uint64_t v44 = v70;
    uint64_t v81 = v40;
    uint64_t v45 = v63;
    uint64_t v46 = v64;
    uint64_t v47 = v67;
    uint64_t v77 = v41;
    if (v43)
    {
      uint64_t v48 = v33;
      uint64_t v49 = 0;
      uint64_t v76 = v43;
      do
      {
        uint64_t v82 = v49 + 1;
        uint64_t v50 = v47;
        uint64_t v51 = v44;
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static AdditiveArithmetic.+ infix(_:_:)();
        uint64_t v52 = v46;
        uint64_t v53 = v46;
        uint64_t v54 = v45;
        uint64_t v55 = v42;
        uint64_t v56 = (void (*)(char *, uint64_t))v77;
        v77(v52, v48);
        v56(v50, v48);
        uint64_t v42 = v55;
        uint64_t v45 = v54;
        uint64_t v46 = v53;
        dispatch thunk of SIMDStorage.subscript.setter();
        uint64_t v47 = v50;
        uint64_t v44 = v51;
        uint64_t v49 = v82;
      }
      while (v76 != v82);
    }
    (*(void (**)(char *, uint64_t))(v75 + 8))(v79, v42);
    v68(v71, v80, v42);
    uint64_t v57 = (void *)swift_allocObject();
    uint64_t v58 = v72;
    v57[2] = v42;
    v57[3] = v58;
    uint64_t v59 = v78;
    v57[4] = v73;
    v57[5] = v59;
    uint64_t v60 = v65;
    v57[6] = v74;
    v57[7] = v60;
    v57[8] = v66;
    return partial apply for closure #1 in static SIMD<>._jvpAdd(lhs:rhs:);
  }
  return result;
}

uint64_t (*forward-mode derivative of static SIMD<>.+ infix(_:_:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10))(uint64_t a1, uint64_t a2)
{
  return partial apply for closure #1 in static SIMD<>._jvpAdd(lhs:rhs:);
}

{
  static SIMD<>._jvpAdd(lhs:rhs:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
  return partial apply for closure #1 in static SIMD<>._jvpAdd(lhs:rhs:);
}

uint64_t (*static SIMD<>._vjpSubtract(lhs:rhs:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v72 = a6;
  uint64_t v73 = a8;
  uint64_t v78 = a3;
  uint64_t v79 = a7;
  uint64_t v70 = a1;
  uint64_t v71 = a5;
  uint64_t v12 = *(void *)(a5 + 48);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v14 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v15 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v64 = (char *)&v62 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v67 = (char *)&v62 - v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v62 - v20;
  MEMORY[0x270FA5388](v19);
  uint64_t v75 = *(void *)(a4 - 8);
  uint64_t v23 = MEMORY[0x270FA5388]((char *)&v62 - v22);
  uint64_t v25 = (char *)&v62 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = MEMORY[0x270FA5388](v23);
  uint64_t v28 = (char *)&v62 - v27;
  uint64_t v29 = MEMORY[0x270FA5388](v26);
  uint64_t v74 = (char *)&v62 - v30;
  uint64_t v81 = v14;
  uint64_t v31 = *(void (**)(void, void))(v14 + 16);
  uint64_t v76 = v14 + 16;
  uint64_t v77 = (void (*)(void, void))v29;
  uint64_t v33 = v32;
  uint64_t v34 = (void (*)(char *, void (*)(void, void), uint64_t))v31;
  v31(v29, a2);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v35 = v28;
  uint64_t v36 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v36 < 0) {
    goto LABEL_10;
  }
  uint64_t v37 = v36;
  uint64_t v80 = v25;
  uint64_t v82 = v12;
  uint64_t v38 = v77;
  if (v36)
  {
    uint64_t v39 = 0;
    do
    {
      v34(v21, v38, v33);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v39;
    }
    while (v37 != v39);
  }
  uint64_t v63 = v21;
  uint64_t v40 = v81 + 8;
  uint64_t v41 = *(void (**)(void, uint64_t))(v81 + 8);
  v41(v38, v33);
  uint64_t v68 = *(void (**)(char *, char *, uint64_t))(v75 + 32);
  uint64_t v69 = v75 + 32;
  v68(v74, v35, a4);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v42 = a4;
  uint64_t v43 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v43 < 0)
  {
LABEL_10:
    uint64_t result = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v65 = a9;
    uint64_t v66 = a10;
    uint64_t v81 = v40;
    uint64_t v44 = v63;
    uint64_t v45 = v64;
    uint64_t v46 = v67;
    uint64_t v47 = v74;
    uint64_t v77 = v41;
    if (v43)
    {
      uint64_t v48 = v33;
      uint64_t v49 = 0;
      uint64_t v76 = v43;
      do
      {
        uint64_t v82 = v49 + 1;
        uint64_t v50 = v46;
        uint64_t v51 = v47;
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static AdditiveArithmetic.- infix(_:_:)();
        uint64_t v52 = v45;
        uint64_t v53 = v45;
        uint64_t v54 = v44;
        uint64_t v55 = v42;
        uint64_t v56 = (void (*)(char *, uint64_t))v77;
        v77(v52, v48);
        v56(v50, v48);
        uint64_t v42 = v55;
        uint64_t v44 = v54;
        uint64_t v45 = v53;
        dispatch thunk of SIMDStorage.subscript.setter();
        uint64_t v46 = v50;
        uint64_t v47 = v51;
        uint64_t v49 = v82;
      }
      while (v76 != v82);
    }
    (*(void (**)(char *, uint64_t))(v75 + 8))(v47, v42);
    v68(v70, v80, v42);
    uint64_t v57 = (void *)swift_allocObject();
    uint64_t v58 = v71;
    v57[2] = v42;
    v57[3] = v58;
    uint64_t v59 = v79;
    v57[4] = v72;
    v57[5] = v59;
    uint64_t v60 = v65;
    v57[6] = v73;
    v57[7] = v60;
    v57[8] = v66;
    return partial apply for closure #1 in static SIMD<>._vjpSubtract(lhs:rhs:);
  }
  return result;
}

{
  uint64_t v12;
  uint64_t AssociatedTypeWitness;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(void, void);
  uint64_t v32;
  uint64_t v33;
  void (*v34)(char *, void (*)(void, void), uint64_t);
  char *v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(void, void);
  uint64_t v39;
  uint64_t v40;
  void (*v41)(void, uint64_t);
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  char *v52;
  char *v53;
  char *v54;
  uint64_t v55;
  void (*v56)(char *, uint64_t);
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t (*result)(uint64_t, uint64_t, uint64_t);
  uint64_t v62;
  char *v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  void (*v68)(char *, char *, uint64_t);
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void (*v77)(void, void);
  uint64_t v78;
  char *v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;

  uint64_t v73 = a6;
  uint64_t v74 = a8;
  uint64_t v78 = a7;
  uint64_t v70 = a2;
  uint64_t v71 = a1;
  uint64_t v72 = a5;
  uint64_t v12 = *(void *)(a5 + 48);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v14 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v15 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v64 = (char *)&v62 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v67 = (char *)&v62 - v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v62 - v20;
  MEMORY[0x270FA5388](v19);
  uint64_t v75 = *(void *)(a4 - 8);
  uint64_t v23 = MEMORY[0x270FA5388]((char *)&v62 - v22);
  uint64_t v25 = (char *)&v62 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = MEMORY[0x270FA5388](v23);
  uint64_t v28 = (char *)&v62 - v27;
  uint64_t v29 = MEMORY[0x270FA5388](v26);
  uint64_t v79 = (char *)&v62 - v30;
  uint64_t v81 = v14;
  uint64_t v31 = *(void (**)(void, void))(v14 + 16);
  uint64_t v76 = v14 + 16;
  uint64_t v77 = (void (*)(void, void))v29;
  uint64_t v33 = v32;
  uint64_t v34 = (void (*)(char *, void (*)(void, void), uint64_t))v31;
  v31(v29, a3);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v35 = v28;
  uint64_t v36 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v36 < 0) {
    goto LABEL_10;
  }
  uint64_t v37 = v36;
  uint64_t v80 = v25;
  uint64_t v82 = v12;
  uint64_t v38 = v77;
  if (v36)
  {
    uint64_t v39 = 0;
    do
    {
      v34(v21, v38, v33);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v39;
    }
    while (v37 != v39);
  }
  uint64_t v63 = v21;
  uint64_t v40 = v81 + 8;
  uint64_t v41 = *(void (**)(void, uint64_t))(v81 + 8);
  v41(v38, v33);
  uint64_t v68 = *(void (**)(char *, char *, uint64_t))(v75 + 32);
  uint64_t v69 = v75 + 32;
  v68(v79, v35, a4);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v42 = a4;
  uint64_t v43 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v43 < 0)
  {
LABEL_10:
    uint64_t result = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v65 = a9;
    uint64_t v66 = a10;
    uint64_t v44 = v70;
    uint64_t v81 = v40;
    uint64_t v45 = v63;
    uint64_t v46 = v64;
    uint64_t v47 = v67;
    uint64_t v77 = v41;
    if (v43)
    {
      uint64_t v48 = v33;
      uint64_t v49 = 0;
      uint64_t v76 = v43;
      do
      {
        uint64_t v82 = v49 + 1;
        uint64_t v50 = v47;
        uint64_t v51 = v44;
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static AdditiveArithmetic.- infix(_:_:)();
        uint64_t v52 = v46;
        uint64_t v53 = v46;
        uint64_t v54 = v45;
        uint64_t v55 = v42;
        uint64_t v56 = (void (*)(char *, uint64_t))v77;
        v77(v52, v48);
        v56(v50, v48);
        uint64_t v42 = v55;
        uint64_t v45 = v54;
        uint64_t v46 = v53;
        dispatch thunk of SIMDStorage.subscript.setter();
        uint64_t v47 = v50;
        uint64_t v44 = v51;
        uint64_t v49 = v82;
      }
      while (v76 != v82);
    }
    (*(void (**)(char *, uint64_t))(v75 + 8))(v79, v42);
    v68(v71, v80, v42);
    uint64_t v57 = (void *)swift_allocObject();
    uint64_t v58 = v72;
    v57[2] = v42;
    v57[3] = v58;
    uint64_t v59 = v78;
    v57[4] = v73;
    v57[5] = v59;
    uint64_t v60 = v65;
    v57[6] = v74;
    v57[7] = v60;
    v57[8] = v66;
    return partial apply for closure #1 in static SIMD<>._vjpSubtract(lhs:rhs:);
  }
  return result;
}

uint64_t closure #1 in static SIMD<>._vjpSubtract(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v67 = a3;
  uint64_t v68 = a2;
  uint64_t v69 = a1;
  uint64_t v65 = a9;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v60 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v12 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v61 = (char *)v54 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v70 = (char *)v54 - v14;
  uint64_t v63 = swift_getAssociatedTypeWitness();
  uint64_t v64 = a8;
  uint64_t v15 = swift_getAssociatedTypeWitness();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v58 = (char *)v54 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v57 = (char *)v54 - v20;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v66 = (char *)v54 - v22;
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v25 = (char *)v54 - v24;
  MEMORY[0x270FA5388](v23);
  uint64_t v27 = (char *)v54 - v26;
  uint64_t v28 = *(void *)(a10 + 16);
  uint64_t v29 = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](v29);
  uint64_t v30 = v65;
  SIMD<>.sum()(AssociatedTypeWitness, v28, v69);
  swift_getAssociatedConformanceWitness();
  dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
  dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
  uint64_t v69 = v16;
  uint64_t v31 = *(void (**)(char *, char *, uint64_t))(v16 + 16);
  uint64_t v55 = v15;
  uint64_t v56 = v25;
  uint64_t v62 = v27;
  uint64_t v32 = v31;
  v54[1] = v16 + 16;
  v31(v25, v27, v15);
  uint64_t v33 = *(void *)(v30 + 48);
  uint64_t v34 = v61;
  dispatch thunk of SIMDStorage.init()();
  uint64_t v35 = v34;
  uint64_t v59 = AssociatedTypeWitness;
  uint64_t v36 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v36 < 0) {
    goto LABEL_10;
  }
  uint64_t v37 = v36;
  uint64_t v38 = v59;
  uint64_t v39 = v66;
  uint64_t v40 = v55;
  uint64_t v41 = v56;
  uint64_t v65 = v33;
  if (v36)
  {
    uint64_t v42 = 0;
    do
    {
      v32(v39, v41, v40);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v42;
    }
    while (v37 != v42);
  }
  uint64_t v43 = v69 + 8;
  uint64_t v44 = *(void (**)(char *, uint64_t))(v69 + 8);
  v44(v41, v40);
  (*(void (**)(char *, char *, uint64_t))(v60 + 32))(v70, v35, v38);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v45 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v45 < 0)
  {
LABEL_10:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v46 = (char *)v45;
    v44(v62, v40);
    uint64_t v47 = v70;
    uint64_t v69 = v43;
    uint64_t v49 = v57;
    uint64_t v48 = v58;
    uint64_t v50 = v59;
    uint64_t v62 = (char *)v44;
    if (v46)
    {
      uint64_t v51 = 0;
      uint64_t v61 = v46;
      do
      {
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        swift_getAssociatedConformanceWitness();
        dispatch thunk of static AdditiveArithmetic.- infix(_:_:)();
        uint64_t v52 = (void (*)(char *, uint64_t))v62;
        ((void (*)(char *, uint64_t))v62)(v48, v40);
        v52(v49, v40);
        dispatch thunk of SIMDStorage.subscript.setter();
        uint64_t v47 = v70;
        ++v51;
      }
      while (v61 != v51);
    }
    return (*(uint64_t (**)(char *, uint64_t))(v60 + 8))(v47, v50);
  }
  return result;
}

{
  uint64_t AssociatedTypeWitness;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  void v18[2];

  v18[0] = a9;
  v18[1] = a2;
  swift_getAssociatedTypeWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v13 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v15 = (char *)v18 - v14;
  uint64_t v16 = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16))(a1, a3, v16);
  SIMD<>.sum()(v16, *(void *)(a10 + 16), (uint64_t)v15);
  dispatch thunk of static SignedNumeric.- prefix(_:)();
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, AssociatedTypeWitness);
}

uint64_t (*reverse-mode derivative of static SIMD<>.- infix(_:_:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return partial apply for closure #1 in static SIMD<>._vjpSubtract(lhs:rhs:);
}

{
  static SIMD<>._vjpSubtract(lhs:rhs:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
  return partial apply for closure #1 in static SIMD<>._vjpSubtract(lhs:rhs:);
}

uint64_t (*static SIMD<>._jvpSubtract(lhs:rhs:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10))(uint64_t a1, uint64_t a2)
{
  uint64_t v72 = a6;
  uint64_t v73 = a8;
  uint64_t v78 = a3;
  uint64_t v79 = a7;
  uint64_t v70 = a1;
  uint64_t v71 = a5;
  uint64_t v12 = *(void *)(a5 + 48);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v14 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v15 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v64 = (char *)&v62 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v67 = (char *)&v62 - v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v62 - v20;
  MEMORY[0x270FA5388](v19);
  uint64_t v75 = *(void *)(a4 - 8);
  uint64_t v23 = MEMORY[0x270FA5388]((char *)&v62 - v22);
  uint64_t v25 = (char *)&v62 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = MEMORY[0x270FA5388](v23);
  uint64_t v28 = (char *)&v62 - v27;
  uint64_t v29 = MEMORY[0x270FA5388](v26);
  uint64_t v74 = (char *)&v62 - v30;
  uint64_t v81 = v14;
  uint64_t v31 = *(void (**)(void, void))(v14 + 16);
  uint64_t v76 = v14 + 16;
  uint64_t v77 = (void (*)(void, void))v29;
  uint64_t v33 = v32;
  uint64_t v34 = (void (*)(char *, void (*)(void, void), uint64_t))v31;
  v31(v29, a2);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v35 = v28;
  uint64_t v36 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v36 < 0) {
    goto LABEL_10;
  }
  uint64_t v37 = v36;
  uint64_t v80 = v25;
  uint64_t v82 = v12;
  uint64_t v38 = v77;
  if (v36)
  {
    uint64_t v39 = 0;
    do
    {
      v34(v21, v38, v33);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v39;
    }
    while (v37 != v39);
  }
  uint64_t v63 = v21;
  uint64_t v40 = v81 + 8;
  uint64_t v41 = *(void (**)(void, uint64_t))(v81 + 8);
  v41(v38, v33);
  uint64_t v68 = *(void (**)(char *, char *, uint64_t))(v75 + 32);
  uint64_t v69 = v75 + 32;
  v68(v74, v35, a4);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v42 = a4;
  uint64_t v43 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v43 < 0)
  {
LABEL_10:
    uint64_t result = (uint64_t (*)(uint64_t, uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v65 = a9;
    uint64_t v66 = a10;
    uint64_t v81 = v40;
    uint64_t v44 = v63;
    uint64_t v45 = v64;
    uint64_t v46 = v67;
    uint64_t v47 = v74;
    uint64_t v77 = v41;
    if (v43)
    {
      uint64_t v48 = v33;
      uint64_t v49 = 0;
      uint64_t v76 = v43;
      do
      {
        uint64_t v82 = v49 + 1;
        uint64_t v50 = v46;
        uint64_t v51 = v47;
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static AdditiveArithmetic.- infix(_:_:)();
        uint64_t v52 = v45;
        uint64_t v53 = v45;
        uint64_t v54 = v44;
        uint64_t v55 = v42;
        uint64_t v56 = (void (*)(char *, uint64_t))v77;
        v77(v52, v48);
        v56(v50, v48);
        uint64_t v42 = v55;
        uint64_t v44 = v54;
        uint64_t v45 = v53;
        dispatch thunk of SIMDStorage.subscript.setter();
        uint64_t v46 = v50;
        uint64_t v47 = v51;
        uint64_t v49 = v82;
      }
      while (v76 != v82);
    }
    (*(void (**)(char *, uint64_t))(v75 + 8))(v47, v42);
    v68(v70, v80, v42);
    uint64_t v57 = (void *)swift_allocObject();
    uint64_t v58 = v71;
    v57[2] = v42;
    v57[3] = v58;
    uint64_t v59 = v79;
    v57[4] = v72;
    v57[5] = v59;
    uint64_t v60 = v65;
    v57[6] = v73;
    v57[7] = v60;
    v57[8] = v66;
    return partial apply for closure #1 in static SIMD<>._jvpSubtract(lhs:rhs:);
  }
  return result;
}

{
  uint64_t v12;
  uint64_t AssociatedTypeWitness;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(void, void);
  uint64_t v32;
  uint64_t v33;
  void (*v34)(char *, void (*)(void, void), uint64_t);
  char *v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(void, void);
  uint64_t v39;
  uint64_t v40;
  void (*v41)(void, uint64_t);
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  char *v52;
  char *v53;
  char *v54;
  uint64_t v55;
  void (*v56)(char *, uint64_t);
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t (*result)(uint64_t, uint64_t);
  uint64_t v62;
  char *v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  void (*v68)(char *, char *, uint64_t);
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void (*v77)(void, void);
  uint64_t v78;
  char *v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;

  uint64_t v73 = a6;
  uint64_t v74 = a8;
  uint64_t v78 = a7;
  uint64_t v70 = a2;
  uint64_t v71 = a1;
  uint64_t v72 = a5;
  uint64_t v12 = *(void *)(a5 + 48);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v14 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v15 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v64 = (char *)&v62 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v67 = (char *)&v62 - v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v62 - v20;
  MEMORY[0x270FA5388](v19);
  uint64_t v75 = *(void *)(a4 - 8);
  uint64_t v23 = MEMORY[0x270FA5388]((char *)&v62 - v22);
  uint64_t v25 = (char *)&v62 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = MEMORY[0x270FA5388](v23);
  uint64_t v28 = (char *)&v62 - v27;
  uint64_t v29 = MEMORY[0x270FA5388](v26);
  uint64_t v79 = (char *)&v62 - v30;
  uint64_t v81 = v14;
  uint64_t v31 = *(void (**)(void, void))(v14 + 16);
  uint64_t v76 = v14 + 16;
  uint64_t v77 = (void (*)(void, void))v29;
  uint64_t v33 = v32;
  uint64_t v34 = (void (*)(char *, void (*)(void, void), uint64_t))v31;
  v31(v29, a3);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v35 = v28;
  uint64_t v36 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v36 < 0) {
    goto LABEL_10;
  }
  uint64_t v37 = v36;
  uint64_t v80 = v25;
  uint64_t v82 = v12;
  uint64_t v38 = v77;
  if (v36)
  {
    uint64_t v39 = 0;
    do
    {
      v34(v21, v38, v33);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v39;
    }
    while (v37 != v39);
  }
  uint64_t v63 = v21;
  uint64_t v40 = v81 + 8;
  uint64_t v41 = *(void (**)(void, uint64_t))(v81 + 8);
  v41(v38, v33);
  uint64_t v68 = *(void (**)(char *, char *, uint64_t))(v75 + 32);
  uint64_t v69 = v75 + 32;
  v68(v79, v35, a4);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v42 = a4;
  uint64_t v43 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v43 < 0)
  {
LABEL_10:
    uint64_t result = (uint64_t (*)(uint64_t, uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v65 = a9;
    uint64_t v66 = a10;
    uint64_t v44 = v70;
    uint64_t v81 = v40;
    uint64_t v45 = v63;
    uint64_t v46 = v64;
    uint64_t v47 = v67;
    uint64_t v77 = v41;
    if (v43)
    {
      uint64_t v48 = v33;
      uint64_t v49 = 0;
      uint64_t v76 = v43;
      do
      {
        uint64_t v82 = v49 + 1;
        uint64_t v50 = v47;
        uint64_t v51 = v44;
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static AdditiveArithmetic.- infix(_:_:)();
        uint64_t v52 = v46;
        uint64_t v53 = v46;
        uint64_t v54 = v45;
        uint64_t v55 = v42;
        uint64_t v56 = (void (*)(char *, uint64_t))v77;
        v77(v52, v48);
        v56(v50, v48);
        uint64_t v42 = v55;
        uint64_t v45 = v54;
        uint64_t v46 = v53;
        dispatch thunk of SIMDStorage.subscript.setter();
        uint64_t v47 = v50;
        uint64_t v44 = v51;
        uint64_t v49 = v82;
      }
      while (v76 != v82);
    }
    (*(void (**)(char *, uint64_t))(v75 + 8))(v79, v42);
    v68(v71, v80, v42);
    uint64_t v57 = (void *)swift_allocObject();
    uint64_t v58 = v72;
    v57[2] = v42;
    v57[3] = v58;
    uint64_t v59 = v78;
    v57[4] = v73;
    v57[5] = v59;
    uint64_t v60 = v65;
    v57[6] = v74;
    v57[7] = v60;
    v57[8] = v66;
    return partial apply for closure #1 in static SIMD<>._jvpSubtract(lhs:rhs:);
  }
  return result;
}

uint64_t closure #1 in static SIMD<>._jvpAdd(lhs:rhs:)@<X0>(void (*a1)(void, void)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X6>, char *a4@<X7>, uint64_t a5@<X8>, uint64_t a6, void (*a7)(char *, char *, uint64_t, uint64_t))
{
  uint64_t v65 = a4;
  uint64_t v61 = a2;
  uint64_t v63 = a5;
  uint64_t v62 = a3;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = swift_getAssociatedTypeWitness();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v53 = (char *)&v52 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v54 = (char *)&v52 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v52 = (char *)&v52 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v52 - v16;
  uint64_t v18 = swift_getAssociatedTypeWitness();
  uint64_t v56 = *(void *)(v18 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v52 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v55 = (char *)&v52 - v22;
  uint64_t v64 = v9;
  uint64_t v23 = *(void (**)(char *, void (*)(void, void), uint64_t))(v9 + 16);
  uint64_t v58 = v9 + 16;
  uint64_t v59 = (void (*)(void, void))v17;
  uint64_t v24 = v23;
  v23(v17, a1, v8);
  uint64_t v25 = *((void *)v65 + 6);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v26 = v21;
  uint64_t v27 = v18;
  uint64_t v28 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v28 < 0) {
    goto LABEL_10;
  }
  uint64_t v29 = v28;
  uint64_t v30 = v59;
  uint64_t v65 = v26;
  uint64_t v31 = v52;
  if (v28)
  {
    uint64_t v32 = 0;
    do
    {
      v24(v31, v30, v8);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v32;
    }
    while (v29 != v32);
  }
  uint64_t v33 = v30;
  uint64_t v34 = v64 + 8;
  uint64_t v35 = *(void (**)(void, uint64_t))(v64 + 8);
  v35(v33, v8);
  (*(void (**)(char *, char *, uint64_t))(v56 + 32))(v55, v65, v27);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v36 = v27;
  uint64_t v37 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v37 < 0)
  {
LABEL_10:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v64 = v34;
    uint64_t v39 = v53;
    uint64_t v38 = v54;
    uint64_t v40 = v55;
    uint64_t v59 = v35;
    uint64_t v41 = v31;
    uint64_t v42 = v36;
    if (v37)
    {
      uint64_t v43 = 0;
      uint64_t v57 = a7;
      uint64_t v58 = v37;
      do
      {
        uint64_t v65 = v43 + 1;
        uint64_t v44 = v38;
        uint64_t v45 = v40;
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
        v57(v44, v39, v8, AssociatedConformanceWitness);
        uint64_t v47 = v42;
        uint64_t v48 = v41;
        uint64_t v49 = v25;
        uint64_t v50 = (void (*)(char *, uint64_t))v59;
        v59(v39, v8);
        v50(v44, v8);
        uint64_t v25 = v49;
        uint64_t v41 = v48;
        uint64_t v42 = v47;
        dispatch thunk of SIMDStorage.subscript.setter();
        uint64_t v38 = v44;
        uint64_t v40 = v45;
        uint64_t v43 = v65;
      }
      while ((char *)v58 != v65);
    }
    return (*(uint64_t (**)(char *, uint64_t))(v56 + 8))(v40, v42);
  }
  return result;
}

uint64_t (*forward-mode derivative of static SIMD<>.- infix(_:_:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10))(uint64_t a1, uint64_t a2)
{
  return partial apply for closure #1 in static SIMD<>._jvpSubtract(lhs:rhs:);
}

{
  static SIMD<>._jvpSubtract(lhs:rhs:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
  return partial apply for closure #1 in static SIMD<>._jvpSubtract(lhs:rhs:);
}

uint64_t closure #1 in static SIMD<>._jvpAdd(lhs:rhs:)@<X0>(uint64_t a1@<X0>, void (*a2)(void, void)@<X1>, uint64_t a3@<X6>, char *a4@<X7>, uint64_t a5@<X8>, uint64_t a6, void (*a7)(char *, char *, uint64_t, uint64_t))
{
  uint64_t v66 = a4;
  uint64_t v56 = a1;
  uint64_t v63 = a5;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v62 = a3;
  uint64_t v9 = swift_getAssociatedTypeWitness();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v54 = (char *)&v53 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v55 = (char *)&v53 - v14;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v53 = (char *)&v53 - v16;
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v53 - v17;
  uint64_t v19 = swift_getAssociatedTypeWitness();
  uint64_t v57 = *(void *)(v19 - 8);
  uint64_t v20 = MEMORY[0x270FA5388](v19);
  uint64_t v22 = (char *)&v53 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  uint64_t v64 = v10;
  uint64_t v65 = (char *)&v53 - v23;
  uint64_t v24 = *(void (**)(char *, void (*)(void, void), uint64_t))(v10 + 16);
  uint64_t v59 = v10 + 16;
  uint64_t v60 = (void (*)(void, void))v18;
  uint64_t v25 = v24;
  v24(v18, a2, v9);
  uint64_t v26 = *((void *)v66 + 6);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v27 = v22;
  uint64_t v28 = v19;
  uint64_t v29 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v29 < 0) {
    goto LABEL_10;
  }
  uint64_t v30 = v29;
  uint64_t v31 = v60;
  uint64_t v66 = v27;
  uint64_t v32 = v53;
  if (v29)
  {
    uint64_t v33 = 0;
    do
    {
      v25(v32, v31, v9);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v33;
    }
    while (v30 != v33);
  }
  uint64_t v34 = v31;
  uint64_t v35 = v64 + 8;
  uint64_t v36 = *(void (**)(void, uint64_t))(v64 + 8);
  v36(v34, v9);
  (*(void (**)(char *, char *, uint64_t))(v57 + 32))(v65, v66, v28);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v37 = v28;
  uint64_t v38 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v38 < 0)
  {
LABEL_10:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v39 = v55;
    uint64_t v40 = v56;
    uint64_t v64 = v35;
    uint64_t v41 = v54;
    uint64_t v60 = v36;
    uint64_t v42 = v32;
    uint64_t v43 = v37;
    if (v38)
    {
      uint64_t v44 = 0;
      uint64_t v58 = a7;
      uint64_t v59 = v38;
      do
      {
        uint64_t v66 = v44 + 1;
        uint64_t v45 = v39;
        uint64_t v46 = v40;
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
        v58(v45, v41, v9, AssociatedConformanceWitness);
        uint64_t v48 = v43;
        uint64_t v49 = v42;
        uint64_t v50 = v26;
        uint64_t v51 = (void (*)(char *, uint64_t))v60;
        v60(v41, v9);
        v51(v45, v9);
        uint64_t v26 = v50;
        uint64_t v42 = v49;
        uint64_t v43 = v48;
        dispatch thunk of SIMDStorage.subscript.setter();
        uint64_t v39 = v45;
        uint64_t v40 = v46;
        uint64_t v44 = v66;
      }
      while ((char *)v59 != v66);
    }
    return (*(uint64_t (**)(char *, uint64_t))(v57 + 8))(v65, v43);
  }
  return result;
}

uint64_t (*static SIMD<>._vjpMultiply(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v72 = a5;
  uint64_t v73 = a6;
  uint64_t v87 = a2;
  uint64_t v69 = a1;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v13 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v66 = (char *)v64 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v65 = (char *)v64 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  v86 = (char *)v64 - v18;
  uint64_t v70 = v19;
  MEMORY[0x270FA5388](v17);
  uint64_t v78 = *(void *)(a4 - 8);
  uint64_t v21 = MEMORY[0x270FA5388]((char *)v64 - v20);
  uint64_t v68 = (char *)v64 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  v85 = (char *)v64 - v24;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v27 = (void (*)(uint64_t, uint64_t))((char *)v64 - v26);
  uint64_t v67 = v28;
  uint64_t v29 = MEMORY[0x270FA5388](v25);
  v84 = (char *)v64 - v30;
  uint64_t v79 = v31;
  uint64_t v32 = *(void (**)(char *, uint64_t, uint64_t))(v31 + 16);
  uint64_t v33 = v29;
  uint64_t v71 = a3;
  uint64_t v35 = v34;
  uint64_t v75 = v32;
  uint64_t v76 = v31 + 16;
  ((void (*)(uint64_t, uint64_t))v32)(v29, a3);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v77 = a4;
  uint64_t v36 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v36 < 0) {
    goto LABEL_10;
  }
  uint64_t v37 = v36;
  uint64_t v82 = v27;
  uint64_t v83 = a7;
  uint64_t v74 = a8;
  uint64_t v38 = v77;
  uint64_t v39 = v86;
  uint64_t v40 = v75;
  if (v36)
  {
    uint64_t v41 = 0;
    do
    {
      v40(v39, v33, v35);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v41;
    }
    while (v37 != v41);
  }
  uint64_t v42 = v35;
  uint64_t v43 = v35;
  uint64_t v44 = *(void (**)(uint64_t, uint64_t))(v79 + 8);
  uint64_t v81 = v79 + 8;
  v44(v33, v43);
  uint64_t v45 = *(void (**)(char *, void (*)(uint64_t, uint64_t), uint64_t))(v78 + 32);
  v64[1] = v78 + 32;
  v64[0] = v45;
  v45(v84, v82, v38);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v46 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v46 < 0)
  {
LABEL_10:
    uint64_t result = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v47 = v87;
    uint64_t v48 = v66;
    uint64_t v49 = v65;
    uint64_t v50 = v77;
    uint64_t v82 = v44;
    if (v46)
    {
      uint64_t v51 = 0;
      uint64_t v80 = v46;
      do
      {
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static Numeric.* infix(_:_:)();
        uint64_t v52 = (void (*)(char *, uint64_t))v82;
        v82((uint64_t)v48, v42);
        v52(v49, v42);
        dispatch thunk of SIMDStorage.subscript.setter();
        uint64_t v47 = v87;
        ++v51;
      }
      while (v80 != v51);
    }
    uint64_t v53 = v78;
    (*(void (**)(char *, uint64_t))(v78 + 8))(v84, v50);
    uint64_t v54 = (void (*)(char *, char *, uint64_t))v64[0];
    ((void (*)(uint64_t, char *, uint64_t))v64[0])(v69, v85, v50);
    uint64_t v55 = v86;
    v75(v86, v71, v42);
    uint64_t v56 = v68;
    (*(void (**)(char *, uint64_t, uint64_t))(v53 + 16))(v68, v47, v50);
    uint64_t v57 = v79;
    unint64_t v58 = (*(unsigned __int8 *)(v79 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v79 + 80);
    unint64_t v59 = (v70 + *(unsigned __int8 *)(v53 + 80) + v58) & ~(unint64_t)*(unsigned __int8 *)(v53 + 80);
    uint64_t v60 = (char *)swift_allocObject();
    uint64_t v61 = v72;
    *((void *)v60 + 2) = v50;
    *((void *)v60 + 3) = v61;
    uint64_t v62 = v83;
    *((void *)v60 + 4) = v73;
    *((void *)v60 + 5) = v62;
    *((void *)v60 + 6) = v74;
    (*(void (**)(char *, char *, uint64_t))(v57 + 32))(&v60[v58], v55, v42);
    v54(&v60[v59], v56, v50);
    return partial apply for closure #1 in static SIMD<>._vjpMultiply(lhs:rhs:);
  }
  return result;
}

{
  uint64_t AssociatedTypeWitness;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(char *, uint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  void (*v41)(char *, uint64_t, uint64_t);
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t, uint64_t);
  void (*v46)(char *, char *, uint64_t);
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  char *v51;
  char *v52;
  char *v53;
  void (*v54)(char *, uint64_t);
  uint64_t v55;
  uint64_t v56;
  void (*v57)(char *, char *, uint64_t);
  char *v58;
  char *v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  unint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t (*result)(uint64_t, uint64_t, uint64_t);
  void v68[2];
  char *v69;
  char *v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  void (*v80)(char *, uint64_t, uint64_t);
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void (*v86)(uint64_t, uint64_t);
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  char *v92;
  char *v93;

  uint64_t v76 = a5;
  uint64_t v77 = a6;
  v89 = a3;
  uint64_t v73 = a1;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v13 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v70 = (char *)v68 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v69 = (char *)v68 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  v92 = (char *)v68 - v18;
  uint64_t v74 = v19;
  MEMORY[0x270FA5388](v17);
  uint64_t v83 = *(void *)(a4 - 8);
  uint64_t v21 = MEMORY[0x270FA5388]((char *)v68 - v20);
  uint64_t v72 = (char *)v68 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  v91 = (char *)v68 - v24;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v27 = (char *)v68 - v26;
  uint64_t v71 = v28;
  uint64_t v29 = MEMORY[0x270FA5388](v25);
  uint64_t v79 = (char *)v68 - v30;
  v84 = v31;
  uint64_t v32 = *(void (**)(char *, uint64_t, uint64_t))(v31 + 16);
  uint64_t v33 = v29;
  uint64_t v75 = a2;
  uint64_t v35 = v34;
  uint64_t v80 = v32;
  uint64_t v81 = v31 + 16;
  ((void (*)(uint64_t, uint64_t))v32)(v29, a2);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v36 = v27;
  uint64_t v82 = a4;
  uint64_t v37 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v37 < 0) {
    goto LABEL_10;
  }
  uint64_t v38 = v37;
  v90 = a7;
  uint64_t v78 = a8;
  uint64_t v39 = v92;
  uint64_t v40 = v82;
  uint64_t v41 = v80;
  v93 = v36;
  if (v37)
  {
    uint64_t v42 = 0;
    do
    {
      v41(v39, v33, v35);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v42;
    }
    while (v38 != v42);
  }
  uint64_t v43 = v33;
  uint64_t v44 = v35;
  uint64_t v45 = *(void (**)(uint64_t, uint64_t))(v84 + 8);
  uint64_t v87 = v84 + 8;
  v45(v43, v35);
  uint64_t v46 = *(void (**)(char *, char *, uint64_t))(v83 + 32);
  v68[1] = v83 + 32;
  v68[0] = v46;
  v46(v79, v93, v40);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v47 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v47 < 0)
  {
LABEL_10:
    uint64_t result = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v48 = v70;
    uint64_t v49 = v69;
    uint64_t v50 = v82;
    uint64_t v51 = v91;
    uint64_t v52 = v79;
    uint64_t v88 = v44;
    v86 = v45;
    if (v47)
    {
      uint64_t v53 = 0;
      v85 = v47;
      uint64_t v54 = (void (*)(char *, uint64_t))v86;
      do
      {
        v93 = v53 + 1;
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        uint64_t v55 = v88;
        dispatch thunk of static Numeric.* infix(_:_:)();
        v54(v48, v55);
        v54(v49, v55);
        uint64_t v51 = v91;
        dispatch thunk of SIMDStorage.subscript.setter();
        uint64_t v53 = v93;
      }
      while ((char *)v85 != v93);
    }
    uint64_t v56 = v83;
    (*(void (**)(char *, uint64_t))(v83 + 8))(v52, v50);
    uint64_t v57 = (void (*)(char *, char *, uint64_t))v68[0];
    ((void (*)(uint64_t, char *, uint64_t))v68[0])(v73, v51, v50);
    unint64_t v58 = v72;
    (*(void (**)(char *, uint64_t, uint64_t))(v56 + 16))(v72, v89, v50);
    unint64_t v59 = v92;
    uint64_t v60 = v88;
    v80(v92, v75, v88);
    uint64_t v61 = (*(unsigned __int8 *)(v56 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80);
    uint64_t v62 = v84;
    uint64_t v63 = (v71 + *(unsigned __int8 *)(v84 + 80) + v61) & ~(unint64_t)*(unsigned __int8 *)(v84 + 80);
    uint64_t v64 = (char *)swift_allocObject();
    uint64_t v65 = v76;
    *((void *)v64 + 2) = v50;
    *((void *)v64 + 3) = v65;
    uint64_t v66 = v90;
    *((void *)v64 + 4) = v77;
    *((void *)v64 + 5) = v66;
    *((void *)v64 + 6) = v78;
    v57(&v64[v61], v58, v50);
    (*(void (**)(char *, char *, uint64_t))(v62 + 32))(&v64[v63], v59, v60);
    return partial apply for closure #1 in static SIMD<>._vjpMultiply(lhs:rhs:);
  }
  return result;
}

uint64_t closure #1 in static SIMD<>._vjpMultiply(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void (*a9)(void, void))
{
  uint64_t v78 = a5;
  uint64_t v75 = a3;
  uint64_t v67 = a2;
  uint64_t v65 = a1;
  uint64_t v68 = a7;
  uint64_t v11 = *(void *)(a7 + 48);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v13 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v14 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v74 = (char *)&v65 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v73 = (char *)&v65 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  v86 = (char *)&v65 - v19;
  MEMORY[0x270FA5388](v18);
  uint64_t v76 = *(void *)(a6 - 8);
  uint64_t v21 = MEMORY[0x270FA5388]((char *)&v65 - v20);
  uint64_t v81 = (char *)&v65 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v66 = (char *)&v65 - v24;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v80 = (char *)&v65 - v26;
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  uint64_t v29 = (char *)&v65 - v28;
  uint64_t v30 = MEMORY[0x270FA5388](v27);
  uint64_t v79 = (char *)&v65 - v31;
  uint64_t v87 = v13;
  uint64_t v32 = *(void (**)(void, void))(v13 + 16);
  uint64_t v33 = v30;
  uint64_t v35 = v34;
  v84 = (void (*)(char *, uint64_t))(v13 + 16);
  v85 = v32;
  v32(v30, a4);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v36 = v29;
  uint64_t v37 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v37 < 0) {
    goto LABEL_14;
  }
  uint64_t v38 = v37;
  uint64_t v40 = (void (*)(char *, uint64_t, uint64_t))v85;
  uint64_t v39 = v86;
  uint64_t v82 = v11;
  if (v37)
  {
    uint64_t v41 = 0;
    do
    {
      v40(v39, v33, v35);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v41;
    }
    while (v38 != v41);
  }
  uint64_t v42 = *(void (**)(char *, uint64_t))(v87 + 8);
  uint64_t v69 = v35;
  v87 += 8;
  v84 = v42;
  v42((char *)v33, v35);
  uint64_t v43 = *(void (**)(uint64_t, char *, uint64_t))(v76 + 32);
  uint64_t v72 = v76 + 32;
  uint64_t v70 = v43;
  v43((uint64_t)v79, v36, a6);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v71 = a6;
  uint64_t v44 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v44 < 0) {
    goto LABEL_14;
  }
  v85 = a9;
  uint64_t v45 = v74;
  uint64_t v46 = v73;
  uint64_t v47 = v71;
  uint64_t v48 = v69;
  if (v44)
  {
    uint64_t v49 = 0;
    uint64_t v77 = v44;
    do
    {
      uint64_t v83 = v49 + 1;
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of static Numeric.* infix(_:_:)();
      uint64_t v50 = v47;
      uint64_t v51 = v84;
      v84(v45, v48);
      v51(v46, v48);
      uint64_t v47 = v50;
      dispatch thunk of SIMDStorage.subscript.setter();
      uint64_t v49 = v83;
    }
    while ((char *)v77 != v83);
  }
  uint64_t v52 = *(char **)(v76 + 8);
  uint64_t v53 = v79;
  v76 += 8;
  uint64_t v79 = v52;
  ((void (*)(char *, uint64_t))v52)(v53, v47);
  v70(v65, v80, v47);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v54 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v54 < 0)
  {
LABEL_14:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v55 = v74;
    uint64_t v56 = v73;
    uint64_t v57 = v71;
    uint64_t v58 = v69;
    if (v54)
    {
      unint64_t v59 = 0;
      uint64_t v80 = (char *)v54;
      do
      {
        uint64_t v83 = v59 + 1;
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static Numeric.* infix(_:_:)();
        uint64_t v60 = v55;
        uint64_t v61 = v55;
        uint64_t v62 = v84;
        v84(v60, v58);
        v62(v56, v58);
        uint64_t v55 = v61;
        dispatch thunk of SIMDStorage.subscript.setter();
        unint64_t v59 = v83;
      }
      while (v80 != v83);
    }
    uint64_t v63 = v66;
    v70((uint64_t)v66, v81, v57);
    SIMD<>.sum()(v57, *((void *)v85 + 2), v67);
    return ((uint64_t (*)(char *, uint64_t))v79)(v63, v57);
  }
  return result;
}

uint64_t (*reverse-mode derivative of static SIMD<>.* infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return partial apply for closure #1 in static SIMD<>._vjpMultiply(lhs:rhs:);
}

{
  static SIMD<>._vjpMultiply(lhs:rhs:)(a1, a2, a3, a4, a5, a6, a7, a8);
  return partial apply for closure #1 in static SIMD<>._vjpMultiply(lhs:rhs:);
}

uint64_t (*static SIMD<>._jvpMultiply(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8))(uint64_t a1, uint64_t a2)
{
  uint64_t v77 = a5;
  uint64_t v78 = a6;
  uint64_t v94 = a2;
  uint64_t v74 = a1;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v13 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v71 = (char *)v69 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v70 = (char *)v69 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  v92 = (char *)v69 - v18;
  uint64_t v75 = v19;
  MEMORY[0x270FA5388](v17);
  uint64_t v84 = *(void *)(a4 - 8);
  uint64_t v21 = MEMORY[0x270FA5388]((char *)v69 - v20);
  uint64_t v73 = (char *)v69 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  v91 = (char *)v69 - v24;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v27 = (char *)v69 - v26;
  uint64_t v72 = v28;
  uint64_t v29 = MEMORY[0x270FA5388](v25);
  uint64_t v80 = (char *)v69 - v30;
  uint64_t v85 = v31;
  uint64_t v32 = *(void (**)(char *, uint64_t, uint64_t))(v31 + 16);
  uint64_t v33 = v29;
  uint64_t v76 = a3;
  uint64_t v35 = v34;
  uint64_t v81 = v32;
  uint64_t v82 = v31 + 16;
  ((void (*)(uint64_t, uint64_t))v32)(v29, a3);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v36 = v27;
  uint64_t v83 = a4;
  uint64_t v37 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v37 < 0) {
    goto LABEL_10;
  }
  uint64_t v38 = v37;
  uint64_t v90 = a7;
  uint64_t v79 = a8;
  uint64_t v39 = v92;
  uint64_t v40 = v83;
  uint64_t v41 = v81;
  v93 = v36;
  if (v37)
  {
    uint64_t v42 = 0;
    do
    {
      v41(v39, v33, v35);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v42;
    }
    while (v38 != v42);
  }
  uint64_t v43 = v33;
  uint64_t v44 = v35;
  uint64_t v45 = *(void (**)(uint64_t, uint64_t))(v85 + 8);
  uint64_t v88 = v85 + 8;
  v45(v43, v35);
  uint64_t v46 = *(void (**)(char *, char *, uint64_t))(v84 + 32);
  v69[1] = v84 + 32;
  v69[0] = v46;
  v46(v80, v93, v40);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v47 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v47 < 0)
  {
LABEL_10:
    uint64_t result = (uint64_t (*)(uint64_t, uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v48 = v94;
    uint64_t v49 = v71;
    uint64_t v50 = v70;
    uint64_t v51 = v83;
    uint64_t v52 = v91;
    uint64_t v53 = v80;
    uint64_t v89 = v44;
    uint64_t v87 = v45;
    if (v47)
    {
      uint64_t v54 = 0;
      uint64_t v86 = v47;
      uint64_t v55 = (void (*)(char *, uint64_t))v87;
      do
      {
        v93 = v54 + 1;
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        uint64_t v56 = v89;
        dispatch thunk of static Numeric.* infix(_:_:)();
        v55(v49, v56);
        v55(v50, v56);
        uint64_t v52 = v91;
        dispatch thunk of SIMDStorage.subscript.setter();
        uint64_t v48 = v94;
        uint64_t v54 = v93;
      }
      while ((char *)v86 != v93);
    }
    uint64_t v57 = v84;
    (*(void (**)(char *, uint64_t))(v84 + 8))(v53, v51);
    uint64_t v58 = (void (*)(char *, char *, uint64_t))v69[0];
    ((void (*)(uint64_t, char *, uint64_t))v69[0])(v74, v52, v51);
    unint64_t v59 = v73;
    (*(void (**)(char *, uint64_t, uint64_t))(v57 + 16))(v73, v48, v51);
    uint64_t v60 = v92;
    uint64_t v61 = v89;
    v81(v92, v76, v89);
    unint64_t v62 = (*(unsigned __int8 *)(v57 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v57 + 80);
    uint64_t v63 = v85;
    unint64_t v64 = (v72 + *(unsigned __int8 *)(v85 + 80) + v62) & ~(unint64_t)*(unsigned __int8 *)(v85 + 80);
    uint64_t v65 = (char *)swift_allocObject();
    uint64_t v66 = v77;
    *((void *)v65 + 2) = v51;
    *((void *)v65 + 3) = v66;
    uint64_t v67 = v90;
    *((void *)v65 + 4) = v78;
    *((void *)v65 + 5) = v67;
    *((void *)v65 + 6) = v79;
    v58(&v65[v62], v59, v51);
    (*(void (**)(char *, char *, uint64_t))(v63 + 32))(&v65[v64], v60, v61);
    return partial apply for closure #1 in static SIMD<>._jvpMultiply(lhs:rhs:);
  }
  return result;
}

uint64_t (*forward-mode derivative of static SIMD<>.* infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8))(uint64_t a1, uint64_t a2)
{
  return partial apply for closure #1 in static SIMD<>._jvpMultiply(lhs:rhs:);
}

uint64_t (*static SIMD<>._vjpDivide(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v72 = a5;
  uint64_t v73 = a6;
  uint64_t v87 = a2;
  uint64_t v69 = a1;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v13 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v66 = (char *)v64 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v65 = (char *)v64 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v86 = (char *)v64 - v18;
  uint64_t v70 = v19;
  MEMORY[0x270FA5388](v17);
  uint64_t v78 = *(void *)(a4 - 8);
  uint64_t v21 = MEMORY[0x270FA5388]((char *)v64 - v20);
  uint64_t v68 = (char *)v64 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v85 = (char *)v64 - v24;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v27 = (void (*)(uint64_t, uint64_t))((char *)v64 - v26);
  uint64_t v67 = v28;
  uint64_t v29 = MEMORY[0x270FA5388](v25);
  uint64_t v84 = (char *)v64 - v30;
  uint64_t v79 = v31;
  uint64_t v32 = *(void (**)(char *, uint64_t, uint64_t))(v31 + 16);
  uint64_t v33 = v29;
  uint64_t v71 = a3;
  uint64_t v35 = v34;
  uint64_t v75 = v32;
  uint64_t v76 = v31 + 16;
  ((void (*)(uint64_t, uint64_t))v32)(v29, a3);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v77 = a4;
  uint64_t v36 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v36 < 0) {
    goto LABEL_10;
  }
  uint64_t v37 = v36;
  uint64_t v82 = v27;
  uint64_t v83 = a7;
  uint64_t v74 = a8;
  uint64_t v38 = v77;
  uint64_t v39 = v86;
  uint64_t v40 = v75;
  if (v36)
  {
    uint64_t v41 = 0;
    do
    {
      v40(v39, v33, v35);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v41;
    }
    while (v37 != v41);
  }
  uint64_t v42 = v35;
  uint64_t v43 = v35;
  uint64_t v44 = *(void (**)(uint64_t, uint64_t))(v79 + 8);
  uint64_t v81 = v79 + 8;
  v44(v33, v43);
  uint64_t v45 = *(void (**)(char *, void (*)(uint64_t, uint64_t), uint64_t))(v78 + 32);
  v64[1] = v78 + 32;
  v64[0] = v45;
  v45(v84, v82, v38);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v46 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v46 < 0)
  {
LABEL_10:
    uint64_t result = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v47 = v87;
    uint64_t v48 = v66;
    uint64_t v49 = v65;
    uint64_t v50 = v77;
    uint64_t v82 = v44;
    if (v46)
    {
      uint64_t v51 = 0;
      uint64_t v80 = v46;
      do
      {
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static FloatingPoint./ infix(_:_:)();
        uint64_t v52 = (void (*)(char *, uint64_t))v82;
        v82((uint64_t)v48, v42);
        v52(v49, v42);
        dispatch thunk of SIMDStorage.subscript.setter();
        uint64_t v47 = v87;
        ++v51;
      }
      while (v80 != v51);
    }
    uint64_t v53 = v78;
    (*(void (**)(char *, uint64_t))(v78 + 8))(v84, v50);
    uint64_t v54 = (void (*)(char *, char *, uint64_t))v64[0];
    ((void (*)(uint64_t, char *, uint64_t))v64[0])(v69, v85, v50);
    uint64_t v55 = v86;
    v75(v86, v71, v42);
    uint64_t v56 = v68;
    (*(void (**)(char *, uint64_t, uint64_t))(v53 + 16))(v68, v47, v50);
    uint64_t v57 = v79;
    unint64_t v58 = (*(unsigned __int8 *)(v79 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v79 + 80);
    unint64_t v59 = (v70 + *(unsigned __int8 *)(v53 + 80) + v58) & ~(unint64_t)*(unsigned __int8 *)(v53 + 80);
    uint64_t v60 = (char *)swift_allocObject();
    uint64_t v61 = v72;
    *((void *)v60 + 2) = v50;
    *((void *)v60 + 3) = v61;
    uint64_t v62 = v83;
    *((void *)v60 + 4) = v73;
    *((void *)v60 + 5) = v62;
    *((void *)v60 + 6) = v74;
    (*(void (**)(char *, char *, uint64_t))(v57 + 32))(&v60[v58], v55, v42);
    v54(&v60[v59], v56, v50);
    return partial apply for closure #1 in static SIMD<>._vjpDivide(lhs:rhs:);
  }
  return result;
}

{
  uint64_t AssociatedTypeWitness;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(char *, uint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  void (*v41)(char *, uint64_t, uint64_t);
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t, uint64_t);
  void (*v46)(char *, char *, uint64_t);
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  char *v51;
  char *v52;
  char *v53;
  void (*v54)(char *, uint64_t);
  uint64_t v55;
  uint64_t v56;
  void (*v57)(char *, char *, uint64_t);
  char *v58;
  char *v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  unint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t (*result)(uint64_t, uint64_t, uint64_t);
  void v68[2];
  char *v69;
  char *v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  void (*v80)(char *, uint64_t, uint64_t);
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void (*v86)(uint64_t, uint64_t);
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  char *v92;
  char *v93;

  uint64_t v76 = a5;
  uint64_t v77 = a6;
  uint64_t v89 = a3;
  uint64_t v73 = a1;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v13 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v70 = (char *)v68 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v69 = (char *)v68 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  v92 = (char *)v68 - v18;
  uint64_t v74 = v19;
  MEMORY[0x270FA5388](v17);
  uint64_t v83 = *(void *)(a4 - 8);
  uint64_t v21 = MEMORY[0x270FA5388]((char *)v68 - v20);
  uint64_t v72 = (char *)v68 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  v91 = (char *)v68 - v24;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v27 = (char *)v68 - v26;
  uint64_t v71 = v28;
  uint64_t v29 = MEMORY[0x270FA5388](v25);
  uint64_t v79 = (char *)v68 - v30;
  uint64_t v84 = v31;
  uint64_t v32 = *(void (**)(char *, uint64_t, uint64_t))(v31 + 16);
  uint64_t v33 = v29;
  uint64_t v75 = a2;
  uint64_t v35 = v34;
  uint64_t v80 = v32;
  uint64_t v81 = v31 + 16;
  ((void (*)(uint64_t, uint64_t))v32)(v29, a2);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v36 = v27;
  uint64_t v82 = a4;
  uint64_t v37 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v37 < 0) {
    goto LABEL_10;
  }
  uint64_t v38 = v37;
  uint64_t v90 = a7;
  uint64_t v78 = a8;
  uint64_t v39 = v92;
  uint64_t v40 = v82;
  uint64_t v41 = v80;
  v93 = v36;
  if (v37)
  {
    uint64_t v42 = 0;
    do
    {
      v41(v39, v33, v35);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v42;
    }
    while (v38 != v42);
  }
  uint64_t v43 = v33;
  uint64_t v44 = v35;
  uint64_t v45 = *(void (**)(uint64_t, uint64_t))(v84 + 8);
  uint64_t v87 = v84 + 8;
  v45(v43, v35);
  uint64_t v46 = *(void (**)(char *, char *, uint64_t))(v83 + 32);
  v68[1] = v83 + 32;
  v68[0] = v46;
  v46(v79, v93, v40);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v47 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v47 < 0)
  {
LABEL_10:
    uint64_t result = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v48 = v70;
    uint64_t v49 = v69;
    uint64_t v50 = v82;
    uint64_t v51 = v91;
    uint64_t v52 = v79;
    uint64_t v88 = v44;
    uint64_t v86 = v45;
    if (v47)
    {
      uint64_t v53 = 0;
      uint64_t v85 = v47;
      uint64_t v54 = (void (*)(char *, uint64_t))v86;
      do
      {
        v93 = v53 + 1;
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        uint64_t v55 = v88;
        dispatch thunk of static FloatingPoint./ infix(_:_:)();
        v54(v48, v55);
        v54(v49, v55);
        uint64_t v51 = v91;
        dispatch thunk of SIMDStorage.subscript.setter();
        uint64_t v53 = v93;
      }
      while ((char *)v85 != v93);
    }
    uint64_t v56 = v83;
    (*(void (**)(char *, uint64_t))(v83 + 8))(v52, v50);
    uint64_t v57 = (void (*)(char *, char *, uint64_t))v68[0];
    ((void (*)(uint64_t, char *, uint64_t))v68[0])(v73, v51, v50);
    unint64_t v58 = v72;
    (*(void (**)(char *, uint64_t, uint64_t))(v56 + 16))(v72, v89, v50);
    unint64_t v59 = v92;
    uint64_t v60 = v88;
    v80(v92, v75, v88);
    uint64_t v61 = (*(unsigned __int8 *)(v56 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80);
    uint64_t v62 = v84;
    uint64_t v63 = (v71 + *(unsigned __int8 *)(v84 + 80) + v61) & ~(unint64_t)*(unsigned __int8 *)(v84 + 80);
    unint64_t v64 = (char *)swift_allocObject();
    uint64_t v65 = v76;
    *((void *)v64 + 2) = v50;
    *((void *)v64 + 3) = v65;
    uint64_t v66 = v90;
    *((void *)v64 + 4) = v77;
    *((void *)v64 + 5) = v66;
    *((void *)v64 + 6) = v78;
    v57(&v64[v61], v58, v50);
    (*(void (**)(char *, char *, uint64_t))(v62 + 32))(&v64[v63], v59, v60);
    return partial apply for closure #1 in static SIMD<>._vjpDivide(lhs:rhs:);
  }
  return result;
}

uint64_t closure #1 in static SIMD<>._vjpDivide(lhs:rhs:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char *a10)
{
  uint64_t v164 = a5;
  uint64_t v166 = a3;
  uint64_t v146 = a2;
  v141 = a1;
  uint64_t v174 = *(void *)(a9 + 16);
  uint64_t v165 = *(void *)(*(void *)(v174 + 16) + 8);
  uint64_t v12 = *(void *)(v165 + 16);
  uint64_t v147 = a7;
  uint64_t v13 = *(void *)(a7 + 48);
  swift_getAssociatedTypeWitness();
  uint64_t v142 = v12;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  v139[1] = (char *)v139 - v14;
  uint64_t v15 = swift_checkMetadataState();
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  v151 = (char *)v139 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  v154 = (char *)v139 - v19;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  v149 = (char *)v139 - v21;
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  v150 = (char *)v139 - v23;
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  v158 = (char *)v139 - v25;
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  v157 = (char *)v139 - v27;
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  v176 = (char *)v139 - v29;
  MEMORY[0x270FA5388](v28);
  uint64_t v162 = *(void *)(a6 - 8);
  uint64_t v31 = MEMORY[0x270FA5388]((char *)v139 - v30);
  v173 = (char *)v139 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = MEMORY[0x270FA5388](v31);
  v172 = (char *)v139 - v34;
  uint64_t v35 = MEMORY[0x270FA5388](v33);
  v143 = (char *)v139 - v36;
  uint64_t v37 = MEMORY[0x270FA5388](v35);
  v152 = (char *)v139 - v38;
  uint64_t v39 = MEMORY[0x270FA5388](v37);
  v170 = (char *)v139 - v40;
  uint64_t v41 = MEMORY[0x270FA5388](v39);
  v148 = (char *)v139 - v42;
  uint64_t v43 = MEMORY[0x270FA5388](v41);
  v169 = (char *)v139 - v44;
  uint64_t v45 = MEMORY[0x270FA5388](v43);
  v171 = (char *)v139 - v46;
  uint64_t v47 = MEMORY[0x270FA5388](v45);
  v153 = (char *)v139 - v48;
  uint64_t v49 = MEMORY[0x270FA5388](v47);
  v145 = (char *)v139 - v50;
  uint64_t v51 = MEMORY[0x270FA5388](v49);
  v168 = (char *)v139 - v52;
  uint64_t v53 = MEMORY[0x270FA5388](v51);
  uint64_t v55 = (char *)v139 - v54;
  uint64_t v56 = MEMORY[0x270FA5388](v53);
  v167 = (char *)v139 - v57;
  uint64_t v179 = v58;
  unint64_t v59 = *(void (**)(char *, uint64_t, uint64_t))(v58 + 16);
  uint64_t v60 = v56;
  uint64_t v144 = a4;
  uint64_t v180 = v61;
  uint64_t v155 = v58 + 16;
  v156 = v59;
  ((void (*)(uint64_t, uint64_t))v59)(v56, a4);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v62 = v55;
  uint64_t v159 = a6;
  uint64_t v63 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v63 < 0) {
    goto LABEL_30;
  }
  uint64_t v64 = v63;
  uint64_t v65 = v176;
  uint64_t v66 = v159;
  uint64_t v67 = v156;
  if (v63)
  {
    uint64_t v68 = 0;
    do
    {
      v67(v65, v60, v180);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v68;
    }
    while (v64 != v68);
  }
  v178 = *(void (**)(uint64_t, uint64_t))(v179 + 8);
  v179 += 8;
  v178(v60, v180);
  v160 = *(void (**)(char *, char *, uint64_t))(v162 + 32);
  uint64_t v161 = v162 + 32;
  v160(v167, v62, v66);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v175 = v13;
  uint64_t v69 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v69 < 0) {
    goto LABEL_30;
  }
  uint64_t v70 = (void (*)(char *, uint64_t))v178;
  uint64_t v71 = v158;
  uint64_t v72 = v157;
  uint64_t v73 = v159;
  if (v69)
  {
    uint64_t v74 = 0;
    uint64_t v163 = v69;
    do
    {
      v177 = v74 + 1;
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of SIMDStorage.subscript.getter();
      uint64_t v75 = v180;
      dispatch thunk of static FloatingPoint./ infix(_:_:)();
      v70(v71, v75);
      v70(v72, v75);
      dispatch thunk of SIMDStorage.subscript.setter();
      uint64_t v74 = v177;
    }
    while ((char *)v163 != v177);
  }
  uint64_t v76 = *(char **)(v162 + 8);
  uint64_t v77 = v167;
  v162 += 8;
  v167 = v76;
  ((void (*)(char *, uint64_t))v76)(v77, v73);
  v160(v141, v168, v73);
  uint64_t v78 = v180;
  swift_getAssociatedConformanceWitness();
  dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
  uint64_t v79 = v150;
  dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
  uint64_t v80 = (void (*)(char *, char *, uint64_t))v156;
  v156(v149, (uint64_t)v79, v78);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v81 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v81 < 0) {
    goto LABEL_30;
  }
  uint64_t v82 = v81;
  uint64_t v83 = v73;
  uint64_t v84 = v176;
  uint64_t v85 = v149;
  uint64_t v86 = v148;
  if (v81)
  {
    uint64_t v87 = 0;
    do
    {
      v80(v84, v85, v180);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v87;
    }
    while (v82 != v87);
  }
  uint64_t v88 = (void (*)(char *, uint64_t))v178;
  v178((uint64_t)v85, v180);
  v160(v169, v86, v83);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v89 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v89 < 0) {
    goto LABEL_30;
  }
  uint64_t v90 = v89;
  v88(v150, v180);
  v91 = v158;
  v92 = v157;
  uint64_t v93 = v175;
  uint64_t v94 = v159;
  uint64_t v95 = v169;
  if (v90)
  {
    v96 = 0;
    v168 = a10;
    v177 = (char *)v90;
    uint64_t v97 = v180;
    do
    {
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of SIMDStorage.subscript.getter();
      swift_getAssociatedConformanceWitness();
      dispatch thunk of static AdditiveArithmetic.- infix(_:_:)();
      uint64_t v98 = v94;
      uint64_t v99 = v93;
      v100 = (void (*)(char *, uint64_t))v178;
      v178((uint64_t)v91, v97);
      v100(v92, v97);
      uint64_t v93 = v99;
      uint64_t v94 = v98;
      dispatch thunk of SIMDStorage.subscript.setter();
      uint64_t v95 = v169;
      ++v96;
    }
    while (v177 != v96);
  }
  ((void (*)(char *, uint64_t))v167)(v95, v94);
  v160(v171, v170, v94);
  uint64_t v101 = v154;
  uint64_t v102 = v180;
  dispatch thunk of static Numeric.* infix(_:_:)();
  v156(v151, (uint64_t)v101, v102);
  v103 = v143;
  dispatch thunk of SIMDStorage.init()();
  uint64_t v104 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v104 < 0) {
    goto LABEL_30;
  }
  uint64_t v105 = v104;
  uint64_t v106 = v94;
  v107 = v151;
  v108 = v176;
  v109 = (void (*)(char *, char *, uint64_t))v156;
  if (v104)
  {
    uint64_t v110 = 0;
    do
    {
      v109(v108, v107, v180);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v110;
    }
    while (v105 != v110);
  }
  v178((uint64_t)v107, v180);
  v160(v152, v103, v106);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v111 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v111 < 0) {
    goto LABEL_30;
  }
  uint64_t v113 = v174;
  uint64_t v112 = v175;
  uint64_t v114 = v152;
  uint64_t v115 = v158;
  v116 = v157;
  uint64_t v117 = v159;
  if (v111)
  {
    uint64_t v118 = 0;
    v170 = (char *)v111;
    do
    {
      v177 = v118 + 1;
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of SIMDStorage.subscript.getter();
      uint64_t v119 = v180;
      dispatch thunk of static FloatingPoint./ infix(_:_:)();
      uint64_t v120 = v115;
      uint64_t v121 = v115;
      uint64_t v122 = v113;
      uint64_t v123 = v112;
      v124 = v114;
      v125 = (void (*)(char *, uint64_t))v178;
      v178((uint64_t)v120, v119);
      v125(v116, v119);
      uint64_t v114 = v124;
      uint64_t v112 = v123;
      uint64_t v113 = v122;
      uint64_t v115 = v121;
      dispatch thunk of SIMDStorage.subscript.setter();
      uint64_t v118 = v177;
    }
    while (v170 != v177);
  }
  v126 = v114;
  v127 = (void (*)(char *, uint64_t))v167;
  ((void (*)(char *, uint64_t))v167)(v126, v117);
  v178((uint64_t)v154, v180);
  v127(v171, v117);
  v160(v153, v172, v117);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v128 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v128 < 0)
  {
LABEL_30:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v129 = v153;
    uint64_t v130 = (void (*)(char *, uint64_t))v178;
    uint64_t v131 = v158;
    v132 = v157;
    uint64_t v133 = v159;
    if (v128)
    {
      uint64_t v134 = 0;
      v172 = (char *)v128;
      do
      {
        v177 = v134 + 1;
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        uint64_t v135 = v180;
        dispatch thunk of static Numeric.* infix(_:_:)();
        v130(v131, v135);
        v130(v132, v135);
        dispatch thunk of SIMDStorage.subscript.setter();
        uint64_t v134 = v177;
      }
      while (v172 != v177);
    }
    v136 = (uint64_t (*)(char *, uint64_t))v167;
    ((void (*)(char *, uint64_t))v167)(v129, v133);
    v137 = v145;
    v160(v145, v173, v133);
    SIMD<>.sum()(v133, v174, v146);
    return v136(v137, v133);
  }
  return result;
}

uint64_t (*reverse-mode derivative of static SIMD<>./ infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return partial apply for closure #1 in static SIMD<>._vjpDivide(lhs:rhs:);
}

{
  static SIMD<>._vjpDivide(lhs:rhs:)(a1, a2, a3, a4, a5, a6, a7, a8);
  return partial apply for closure #1 in static SIMD<>._vjpDivide(lhs:rhs:);
}

uint64_t (*static SIMD<>._jvpDivide(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8))(uint64_t a1, uint64_t a2)
{
  uint64_t v72 = a5;
  uint64_t v73 = a6;
  uint64_t v87 = a2;
  uint64_t v69 = a1;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v13 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v66 = (char *)v64 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v65 = (char *)v64 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v86 = (char *)v64 - v18;
  uint64_t v70 = v19;
  MEMORY[0x270FA5388](v17);
  uint64_t v78 = *(void *)(a4 - 8);
  uint64_t v21 = MEMORY[0x270FA5388]((char *)v64 - v20);
  uint64_t v68 = (char *)v64 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v85 = (char *)v64 - v24;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v27 = (void (*)(uint64_t, uint64_t))((char *)v64 - v26);
  uint64_t v67 = v28;
  uint64_t v29 = MEMORY[0x270FA5388](v25);
  uint64_t v84 = (char *)v64 - v30;
  uint64_t v79 = v31;
  uint64_t v32 = *(void (**)(char *, uint64_t, uint64_t))(v31 + 16);
  uint64_t v33 = v29;
  uint64_t v71 = a3;
  uint64_t v35 = v34;
  uint64_t v75 = v32;
  uint64_t v76 = v31 + 16;
  ((void (*)(uint64_t, uint64_t))v32)(v29, a3);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v77 = a4;
  uint64_t v36 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v36 < 0) {
    goto LABEL_10;
  }
  uint64_t v37 = v36;
  uint64_t v82 = v27;
  uint64_t v83 = a7;
  uint64_t v74 = a8;
  uint64_t v38 = v77;
  uint64_t v39 = v86;
  uint64_t v40 = v75;
  if (v36)
  {
    uint64_t v41 = 0;
    do
    {
      v40(v39, v33, v35);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v41;
    }
    while (v37 != v41);
  }
  uint64_t v42 = v35;
  uint64_t v43 = v35;
  uint64_t v44 = *(void (**)(uint64_t, uint64_t))(v79 + 8);
  uint64_t v81 = v79 + 8;
  v44(v33, v43);
  uint64_t v45 = *(void (**)(char *, void (*)(uint64_t, uint64_t), uint64_t))(v78 + 32);
  v64[1] = v78 + 32;
  v64[0] = v45;
  v45(v84, v82, v38);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v46 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v46 < 0)
  {
LABEL_10:
    uint64_t result = (uint64_t (*)(uint64_t, uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v47 = v87;
    uint64_t v48 = v66;
    uint64_t v49 = v65;
    uint64_t v50 = v77;
    uint64_t v82 = v44;
    if (v46)
    {
      uint64_t v51 = 0;
      uint64_t v80 = v46;
      do
      {
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static FloatingPoint./ infix(_:_:)();
        uint64_t v52 = (void (*)(char *, uint64_t))v82;
        v82((uint64_t)v48, v42);
        v52(v49, v42);
        dispatch thunk of SIMDStorage.subscript.setter();
        uint64_t v47 = v87;
        ++v51;
      }
      while (v80 != v51);
    }
    uint64_t v53 = v78;
    (*(void (**)(char *, uint64_t))(v78 + 8))(v84, v50);
    uint64_t v54 = (void (*)(char *, char *, uint64_t))v64[0];
    ((void (*)(uint64_t, char *, uint64_t))v64[0])(v69, v85, v50);
    uint64_t v55 = v86;
    v75(v86, v71, v42);
    uint64_t v56 = v68;
    (*(void (**)(char *, uint64_t, uint64_t))(v53 + 16))(v68, v47, v50);
    uint64_t v57 = v79;
    unint64_t v58 = (*(unsigned __int8 *)(v79 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v79 + 80);
    unint64_t v59 = (v70 + *(unsigned __int8 *)(v53 + 80) + v58) & ~(unint64_t)*(unsigned __int8 *)(v53 + 80);
    uint64_t v60 = (char *)swift_allocObject();
    uint64_t v61 = v72;
    *((void *)v60 + 2) = v50;
    *((void *)v60 + 3) = v61;
    uint64_t v62 = v83;
    *((void *)v60 + 4) = v73;
    *((void *)v60 + 5) = v62;
    *((void *)v60 + 6) = v74;
    (*(void (**)(char *, char *, uint64_t))(v57 + 32))(&v60[v58], v55, v42);
    v54(&v60[v59], v56, v50);
    return partial apply for closure #1 in static SIMD<>._jvpDivide(lhs:rhs:);
  }
  return result;
}

{
  uint64_t AssociatedTypeWitness;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(char *, uint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  void (*v41)(char *, uint64_t, uint64_t);
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t, uint64_t);
  void (*v46)(char *, char *, uint64_t);
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  char *v51;
  char *v52;
  char *v53;
  void (*v54)(char *, uint64_t);
  uint64_t v55;
  uint64_t v56;
  void (*v57)(char *, char *, uint64_t);
  char *v58;
  char *v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  unint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t (*result)(uint64_t, uint64_t);
  void v68[2];
  char *v69;
  char *v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  void (*v80)(char *, uint64_t, uint64_t);
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void (*v86)(uint64_t, uint64_t);
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  char *v92;
  char *v93;

  uint64_t v76 = a5;
  uint64_t v77 = a6;
  uint64_t v89 = a3;
  uint64_t v73 = a1;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v13 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v70 = (char *)v68 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v69 = (char *)v68 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  v92 = (char *)v68 - v18;
  uint64_t v74 = v19;
  MEMORY[0x270FA5388](v17);
  uint64_t v83 = *(void *)(a4 - 8);
  uint64_t v21 = MEMORY[0x270FA5388]((char *)v68 - v20);
  uint64_t v72 = (char *)v68 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  v91 = (char *)v68 - v24;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v27 = (char *)v68 - v26;
  uint64_t v71 = v28;
  uint64_t v29 = MEMORY[0x270FA5388](v25);
  uint64_t v79 = (char *)v68 - v30;
  uint64_t v84 = v31;
  uint64_t v32 = *(void (**)(char *, uint64_t, uint64_t))(v31 + 16);
  uint64_t v33 = v29;
  uint64_t v75 = a2;
  uint64_t v35 = v34;
  uint64_t v80 = v32;
  uint64_t v81 = v31 + 16;
  ((void (*)(uint64_t, uint64_t))v32)(v29, a2);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v36 = v27;
  uint64_t v82 = a4;
  uint64_t v37 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v37 < 0) {
    goto LABEL_10;
  }
  uint64_t v38 = v37;
  uint64_t v90 = a7;
  uint64_t v78 = a8;
  uint64_t v39 = v92;
  uint64_t v40 = v82;
  uint64_t v41 = v80;
  uint64_t v93 = v36;
  if (v37)
  {
    uint64_t v42 = 0;
    do
    {
      v41(v39, v33, v35);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v42;
    }
    while (v38 != v42);
  }
  uint64_t v43 = v33;
  uint64_t v44 = v35;
  uint64_t v45 = *(void (**)(uint64_t, uint64_t))(v84 + 8);
  uint64_t v87 = v84 + 8;
  v45(v43, v35);
  uint64_t v46 = *(void (**)(char *, char *, uint64_t))(v83 + 32);
  v68[1] = v83 + 32;
  v68[0] = v46;
  v46(v79, v93, v40);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v47 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v47 < 0)
  {
LABEL_10:
    uint64_t result = (uint64_t (*)(uint64_t, uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v48 = v70;
    uint64_t v49 = v69;
    uint64_t v50 = v82;
    uint64_t v51 = v91;
    uint64_t v52 = v79;
    uint64_t v88 = v44;
    uint64_t v86 = v45;
    if (v47)
    {
      uint64_t v53 = 0;
      uint64_t v85 = v47;
      uint64_t v54 = (void (*)(char *, uint64_t))v86;
      do
      {
        uint64_t v93 = v53 + 1;
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        uint64_t v55 = v88;
        dispatch thunk of static FloatingPoint./ infix(_:_:)();
        v54(v48, v55);
        v54(v49, v55);
        uint64_t v51 = v91;
        dispatch thunk of SIMDStorage.subscript.setter();
        uint64_t v53 = v93;
      }
      while ((char *)v85 != v93);
    }
    uint64_t v56 = v83;
    (*(void (**)(char *, uint64_t))(v83 + 8))(v52, v50);
    uint64_t v57 = (void (*)(char *, char *, uint64_t))v68[0];
    ((void (*)(uint64_t, char *, uint64_t))v68[0])(v73, v51, v50);
    unint64_t v58 = v72;
    (*(void (**)(char *, uint64_t, uint64_t))(v56 + 16))(v72, v89, v50);
    unint64_t v59 = v92;
    uint64_t v60 = v88;
    v80(v92, v75, v88);
    uint64_t v61 = (*(unsigned __int8 *)(v56 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80);
    uint64_t v62 = v84;
    uint64_t v63 = (v71 + *(unsigned __int8 *)(v84 + 80) + v61) & ~(unint64_t)*(unsigned __int8 *)(v84 + 80);
    uint64_t v64 = (char *)swift_allocObject();
    uint64_t v65 = v76;
    *((void *)v64 + 2) = v50;
    *((void *)v64 + 3) = v65;
    uint64_t v66 = v90;
    *((void *)v64 + 4) = v77;
    *((void *)v64 + 5) = v66;
    *((void *)v64 + 6) = v78;
    v57(&v64[v61], v58, v50);
    (*(void (**)(char *, char *, uint64_t))(v62 + 32))(&v64[v63], v59, v60);
    return partial apply for closure #1 in static SIMD<>._jvpDivide(lhs:rhs:);
  }
  return result;
}

uint64_t closure #1 in static SIMD<>._jvpDivide(lhs:rhs:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v144 = a8;
  uint64_t v118 = a7;
  uint64_t v117 = a4;
  uint64_t v115 = a2;
  uint64_t v114 = a1;
  uint64_t v136 = a9;
  uint64_t v11 = *(void *)(a6 + 48);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v13 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  v124 = (char *)&v114 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  v126 = (char *)&v114 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v121 = (char *)&v114 - v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v142 = (char *)&v114 - v20;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v128 = (char *)&v114 - v22;
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v147 = (char *)&v114 - v24;
  MEMORY[0x270FA5388](v23);
  uint64_t v134 = *(void *)(a5 - 8);
  uint64_t v26 = MEMORY[0x270FA5388]((char *)&v114 - v25);
  uint64_t v123 = (char *)&v114 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  v125 = (char *)&v114 - v29;
  uint64_t v30 = MEMORY[0x270FA5388](v28);
  v140 = (char *)&v114 - v31;
  uint64_t v32 = MEMORY[0x270FA5388](v30);
  uint64_t v120 = (char *)&v114 - v33;
  uint64_t v34 = MEMORY[0x270FA5388](v32);
  v139 = (char *)&v114 - v35;
  uint64_t v36 = MEMORY[0x270FA5388](v34);
  v116 = (char *)&v114 - v37;
  uint64_t v38 = MEMORY[0x270FA5388](v36);
  v138 = (char *)&v114 - v39;
  uint64_t v40 = MEMORY[0x270FA5388](v38);
  uint64_t v42 = (char *)&v114 - v41;
  uint64_t v43 = MEMORY[0x270FA5388](v40);
  v137 = (char *)&v114 - v44;
  uint64_t v45 = MEMORY[0x270FA5388](v43);
  uint64_t v122 = (char *)&v114 - v46;
  uint64_t v47 = MEMORY[0x270FA5388](v45);
  v141 = (char *)&v114 - v48;
  uint64_t v146 = v49;
  uint64_t v50 = *(void (**)(char *, uint64_t, uint64_t))(v49 + 16);
  uint64_t v51 = v47;
  uint64_t v119 = a3;
  uint64_t v53 = v52;
  uint64_t v127 = v49 + 16;
  v132 = v50;
  ((void (*)(uint64_t, uint64_t))v50)(v47, a3);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v54 = v42;
  uint64_t v55 = a5;
  uint64_t v148 = v11;
  uint64_t v56 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v56 < 0) {
    goto LABEL_26;
  }
  uint64_t v57 = v56;
  unint64_t v58 = v147;
  unint64_t v59 = v132;
  if (v56)
  {
    uint64_t v60 = 0;
    do
    {
      v59(v58, v51, v53);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v60;
    }
    while (v57 != v60);
  }
  uint64_t v61 = *(void (**)(char *, uint64_t))(v146 + 8);
  uint64_t v133 = v53;
  v145 = v61;
  v146 += 8;
  v61((char *)v51, v53);
  v129 = *(void (**)(char *, char *, uint64_t))(v134 + 32);
  uint64_t v130 = v134 + 32;
  v129(v137, v54, v55);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v131 = v55;
  uint64_t v62 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v62 < 0) {
    goto LABEL_26;
  }
  uint64_t v63 = v142;
  uint64_t v64 = v128;
  uint64_t v65 = v148;
  uint64_t v66 = v131;
  uint64_t v67 = v133;
  if (v62)
  {
    uint64_t v68 = 0;
    uint64_t v135 = v62;
    do
    {
      v143 = v68 + 1;
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of static Numeric.* infix(_:_:)();
      uint64_t v69 = v66;
      uint64_t v70 = v65;
      uint64_t v71 = v145;
      v145(v63, v67);
      v71(v64, v67);
      uint64_t v65 = v70;
      uint64_t v66 = v69;
      dispatch thunk of SIMDStorage.subscript.setter();
      uint64_t v68 = v143;
    }
    while ((char *)v135 != v143);
  }
  uint64_t v72 = *(char **)(v134 + 8);
  uint64_t v73 = v137;
  v134 += 8;
  v137 = v72;
  ((void (*)(char *, uint64_t))v72)(v73, v66);
  v129(v122, v138, v66);
  v132(v121, v115, v67);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v74 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v74 < 0) {
    goto LABEL_26;
  }
  uint64_t v75 = v74;
  uint64_t v76 = v147;
  uint64_t v77 = v131;
  uint64_t v78 = (void (*)(char *, char *, uint64_t))v132;
  uint64_t v79 = v133;
  uint64_t v80 = v121;
  uint64_t v81 = v120;
  if (v74)
  {
    uint64_t v82 = 0;
    do
    {
      v78(v76, v80, v79);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v82;
    }
    while (v75 != v82);
  }
  v145(v80, v79);
  v129(v139, v81, v77);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v83 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v83 < 0) {
    goto LABEL_26;
  }
  uint64_t v84 = v142;
  uint64_t v85 = v128;
  uint64_t v86 = v131;
  uint64_t v87 = v133;
  if (v83)
  {
    uint64_t v88 = 0;
    v138 = (char *)v83;
    do
    {
      v143 = v88 + 1;
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of static Numeric.* infix(_:_:)();
      uint64_t v89 = v87;
      uint64_t v90 = v87;
      v91 = v145;
      v145(v84, v89);
      v91(v85, v90);
      uint64_t v87 = v90;
      dispatch thunk of SIMDStorage.subscript.setter();
      uint64_t v88 = v143;
    }
    while (v138 != v143);
  }
  v92 = (void (*)(char *, uint64_t))v137;
  ((void (*)(char *, uint64_t))v137)(v139, v86);
  uint64_t v93 = v116;
  v129(v116, v140, v86);
  swift_getAssociatedConformanceWitness();
  uint64_t v94 = v122;
  dispatch thunk of static AdditiveArithmetic.- infix(_:_:)();
  v92(v93, v86);
  v92(v94, v86);
  v143 = *(char **)(v144 + 16);
  uint64_t v95 = v126;
  dispatch thunk of static Numeric.* infix(_:_:)();
  v132(v124, (uint64_t)v95, v87);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v96 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v96 < 0) {
    goto LABEL_26;
  }
  uint64_t v97 = v96;
  uint64_t v98 = v124;
  uint64_t v99 = v123;
  uint64_t v101 = (void (*)(char *, char *, uint64_t))v132;
  uint64_t v100 = v133;
  if (v96)
  {
    uint64_t v102 = 0;
    v103 = v147;
    do
    {
      v101(v103, v98, v100);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v102;
    }
    while (v97 != v102);
  }
  v145(v98, v100);
  v129(v125, v99, v86);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v104 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v104 < 0)
  {
LABEL_26:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v105 = v125;
    uint64_t v106 = v142;
    uint64_t v107 = v131;
    uint64_t v108 = v133;
    v109 = v128;
    if (v104)
    {
      uint64_t v110 = 0;
      v140 = (char *)v104;
      do
      {
        uint64_t v144 = v110 + 1;
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static FloatingPoint./ infix(_:_:)();
        uint64_t v111 = v145;
        v145(v106, v108);
        v111(v109, v108);
        uint64_t v106 = v142;
        dispatch thunk of SIMDStorage.subscript.setter();
        uint64_t v110 = v144;
      }
      while (v140 != (char *)v144);
    }
    uint64_t v112 = (uint64_t (*)(char *, uint64_t))v137;
    ((void (*)(char *, uint64_t))v137)(v105, v107);
    v145(v126, v108);
    return v112(v141, v107);
  }
  return result;
}

{
  uint64_t v11;
  uint64_t AssociatedTypeWitness;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(char *, uint64_t, uint64_t);
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(char *, uint64_t, uint64_t);
  char *v54;
  uint64_t v55;
  void (*v56)(char *, uint64_t);
  void (*v57)(char *, char *, uint64_t);
  uint64_t v58;
  char *v59;
  char *v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  char *v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void (*v72)(char *, uint64_t);
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  char *v78;
  char *v79;
  void (*v80)(char *, char *, uint64_t);
  uint64_t v81;
  uint64_t v82;
  char *v83;
  char *v84;
  uint64_t v85;
  char *v86;
  char *v87;
  char *v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  void (*v92)(char *, uint64_t);
  char *v93;
  char *v94;
  char *v95;
  uint64_t v96;
  char *v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  void (*v101)(char *, uint64_t);
  char *v102;
  uint64_t v103;
  void (*v104)(char *, uint64_t);
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char *v108;
  char *v109;
  uint64_t v110;
  void (*v111)(char *, uint64_t);
  char *v112;
  uint64_t v113;
  char *v114;
  uint64_t result;
  uint64_t v116;
  uint64_t v117;
  char *v118;
  uint64_t v119;
  char *v120;
  char *v121;
  char *v122;
  char *v123;
  char *v124;
  void (*v125)(char *, uint64_t, uint64_t);
  uint64_t v126;
  void (*v127)(char *, char *, uint64_t);
  uint64_t v128;
  char *v129;
  char *v130;
  uint64_t v131;
  uint64_t v132;
  char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  char *v137;
  char *v138;
  char *v139;
  char *v140;
  char *v141;
  uint64_t v142;
  char *v143;
  char *v144;
  void (*v145)(char *, uint64_t);
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;

  uint64_t v146 = a8;
  uint64_t v119 = a7;
  uint64_t v117 = a4;
  uint64_t v134 = a2;
  uint64_t v135 = a3;
  uint64_t v136 = a9;
  uint64_t v11 = *(void *)(a6 + 48);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v13 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v122 = (char *)&v116 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v130 = (char *)&v116 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  v129 = (char *)&v116 - v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  v143 = (char *)&v116 - v20;
  MEMORY[0x270FA5388](v19);
  v132 = *(void *)(a5 - 8);
  uint64_t v22 = MEMORY[0x270FA5388]((char *)&v116 - v21);
  v139 = (char *)&v116 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  v141 = (char *)&v116 - v25;
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  v138 = (char *)&v116 - v27;
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  uint64_t v121 = (char *)&v116 - v29;
  uint64_t v30 = MEMORY[0x270FA5388](v28);
  uint64_t v123 = (char *)&v116 - v31;
  uint64_t v32 = MEMORY[0x270FA5388](v30);
  uint64_t v118 = (char *)&v116 - v33;
  uint64_t v34 = MEMORY[0x270FA5388](v32);
  v137 = (char *)&v116 - v35;
  uint64_t v36 = MEMORY[0x270FA5388](v34);
  uint64_t v38 = (char *)&v116 - v37;
  uint64_t v39 = MEMORY[0x270FA5388](v36);
  uint64_t v120 = (char *)&v116 - v40;
  uint64_t v41 = MEMORY[0x270FA5388](v39);
  v124 = (char *)&v116 - v42;
  uint64_t v43 = MEMORY[0x270FA5388](v41);
  v140 = (char *)&v116 - v44;
  uint64_t v147 = v46;
  uint64_t v148 = v45;
  uint64_t v47 = *(void (**)(char *, uint64_t, uint64_t))(v46 + 16);
  uint64_t v48 = v43;
  v126 = v46 + 16;
  v125 = v47;
  ((void (*)(uint64_t, uint64_t))v47)(v43, a1);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v49 = a5;
  uint64_t v50 = v11;
  uint64_t v51 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v51 < 0) {
    goto LABEL_26;
  }
  uint64_t v52 = v51;
  uint64_t v53 = v125;
  uint64_t v54 = v143;
  if (v51)
  {
    uint64_t v55 = 0;
    do
    {
      v53(v54, v48, v148);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v55;
    }
    while (v52 != v55);
  }
  uint64_t v56 = *(void (**)(char *, uint64_t))(v147 + 8);
  v147 += 8;
  v145 = v56;
  v56((char *)v48, v148);
  uint64_t v57 = *(void (**)(char *, char *, uint64_t))(v132 + 32);
  uint64_t v128 = v132 + 32;
  uint64_t v127 = v57;
  v57(v120, v38, v49);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v131 = v49;
  uint64_t v142 = v50;
  unint64_t v58 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v58 < 0) {
    goto LABEL_26;
  }
  unint64_t v59 = v129;
  uint64_t v60 = v130;
  uint64_t v61 = v142;
  uint64_t v62 = v143;
  uint64_t v63 = v131;
  uint64_t v64 = v120;
  if (v58)
  {
    uint64_t v65 = 0;
    uint64_t v133 = (char *)v58;
    do
    {
      uint64_t v144 = v65 + 1;
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of SIMDStorage.subscript.getter();
      uint64_t v66 = v148;
      dispatch thunk of static Numeric.* infix(_:_:)();
      uint64_t v67 = v66;
      uint64_t v68 = v62;
      uint64_t v69 = v63;
      uint64_t v70 = v61;
      uint64_t v71 = v66;
      uint64_t v72 = v145;
      v145(v60, v67);
      v72(v59, v71);
      uint64_t v61 = v70;
      uint64_t v63 = v69;
      uint64_t v62 = v68;
      dispatch thunk of SIMDStorage.subscript.setter();
      uint64_t v65 = v144;
    }
    while (v133 != v144);
  }
  uint64_t v73 = *(char **)(v132 + 8);
  v132 += 8;
  uint64_t v133 = v73;
  ((void (*)(char *, uint64_t))v73)(v64, v63);
  v127(v124, v137, v63);
  v125(v122, v117, v148);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v74 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v74 < 0) {
    goto LABEL_26;
  }
  uint64_t v75 = v74;
  uint64_t v76 = v131;
  uint64_t v77 = v143;
  uint64_t v78 = v122;
  uint64_t v79 = v121;
  uint64_t v80 = (void (*)(char *, char *, uint64_t))v125;
  if (v74)
  {
    uint64_t v81 = 0;
    do
    {
      v80(v77, v78, v148);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v81;
    }
    while (v75 != v81);
  }
  v145(v78, v148);
  v127(v123, v79, v76);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v82 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v82 < 0) {
    goto LABEL_26;
  }
  uint64_t v83 = v129;
  uint64_t v84 = v130;
  uint64_t v85 = v131;
  uint64_t v86 = v143;
  uint64_t v87 = v123;
  if (v82)
  {
    uint64_t v88 = 0;
    v137 = (char *)v82;
    do
    {
      uint64_t v144 = v88 + 1;
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of SIMDStorage.subscript.getter();
      uint64_t v89 = v148;
      dispatch thunk of static Numeric.* infix(_:_:)();
      uint64_t v90 = v86;
      v91 = v85;
      v92 = v145;
      v145(v84, v89);
      v92(v83, v89);
      uint64_t v85 = v91;
      uint64_t v86 = v90;
      dispatch thunk of SIMDStorage.subscript.setter();
      uint64_t v88 = v144;
    }
    while (v137 != v144);
  }
  uint64_t v93 = v133;
  ((void (*)(char *, uint64_t))v133)(v87, v85);
  uint64_t v94 = v118;
  v127(v118, v138, v85);
  swift_getAssociatedConformanceWitness();
  uint64_t v95 = v124;
  dispatch thunk of static AdditiveArithmetic.- infix(_:_:)();
  ((void (*)(char *, uint64_t))v93)(v94, v85);
  ((void (*)(char *, uint64_t))v93)(v95, v85);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v96 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v96 < 0) {
    goto LABEL_26;
  }
  uint64_t v97 = v129;
  uint64_t v98 = v130;
  uint64_t v99 = v142;
  uint64_t v100 = v131;
  uint64_t v101 = v145;
  if (v96)
  {
    uint64_t v102 = 0;
    v138 = (char *)v96;
    do
    {
      uint64_t v144 = v102 + 1;
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of SIMDStorage.subscript.getter();
      v103 = v99;
      uint64_t v104 = v101;
      uint64_t v105 = v148;
      dispatch thunk of static Numeric.* infix(_:_:)();
      v104(v98, v105);
      uint64_t v106 = v105;
      uint64_t v101 = v104;
      uint64_t v99 = v103;
      v101(v97, v106);
      dispatch thunk of SIMDStorage.subscript.setter();
      uint64_t v102 = v144;
    }
    while (v138 != v144);
  }
  v127(v141, v139, v100);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v107 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v107 < 0)
  {
LABEL_26:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v109 = v129;
    uint64_t v108 = v130;
    uint64_t v110 = v131;
    uint64_t v111 = v145;
    if (v107)
    {
      uint64_t v112 = 0;
      uint64_t v144 = (char *)v107;
      uint64_t v113 = v148;
      do
      {
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static FloatingPoint./ infix(_:_:)();
        v111(v108, v113);
        v111(v109, v113);
        dispatch thunk of SIMDStorage.subscript.setter();
        ++v112;
      }
      while (v144 != v112);
    }
    uint64_t v114 = v133;
    ((void (*)(char *, uint64_t))v133)(v141, v110);
    return ((uint64_t (*)(char *, uint64_t))v114)(v140, v110);
  }
  return result;
}

uint64_t (*forward-mode derivative of static SIMD<>./ infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8))(uint64_t a1, uint64_t a2)
{
  return partial apply for closure #1 in static SIMD<>._jvpDivide(lhs:rhs:);
}

{
  static SIMD<>._jvpDivide(lhs:rhs:)(a1, a2, a3, a4, a5, a6, a7, a8);
  return partial apply for closure #1 in static SIMD<>._jvpDivide(lhs:rhs:);
}

uint64_t (*static SIMD<>._jvpMultiply(lhs:rhs:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8))(uint64_t a1, uint64_t a2)
{
  uint64_t v79 = a5;
  uint64_t v80 = a6;
  uint64_t v91 = a3;
  uint64_t v76 = a1;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v13 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v73 = (char *)&v69 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v72 = (char *)&v69 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v94 = (char *)&v69 - v18;
  uint64_t v77 = v19;
  MEMORY[0x270FA5388](v17);
  uint64_t v86 = *(void *)(a4 - 8);
  uint64_t v21 = MEMORY[0x270FA5388]((char *)&v69 - v20);
  uint64_t v75 = (char *)&v69 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v84 = (char *)&v69 - v24;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v27 = (char *)&v69 - v26;
  uint64_t v74 = v28;
  uint64_t v29 = MEMORY[0x270FA5388](v25);
  uint64_t v93 = (char *)&v69 - v30;
  uint64_t v87 = v31;
  uint64_t v32 = *(void (**)(char *, uint64_t, uint64_t))(v31 + 16);
  uint64_t v33 = v29;
  uint64_t v78 = a2;
  uint64_t v35 = v34;
  uint64_t v82 = v32;
  uint64_t v83 = v31 + 16;
  ((void (*)(uint64_t, uint64_t))v32)(v29, a2);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v36 = v27;
  uint64_t v85 = a4;
  uint64_t v37 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v37 < 0) {
    goto LABEL_10;
  }
  uint64_t v38 = v37;
  uint64_t v92 = a7;
  uint64_t v81 = a8;
  uint64_t v39 = v85;
  uint64_t v40 = v94;
  uint64_t v41 = v82;
  uint64_t v95 = v36;
  if (v37)
  {
    uint64_t v42 = 0;
    do
    {
      v41(v40, v33, v35);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v42;
    }
    while (v38 != v42);
  }
  uint64_t v43 = *(void (**)(uint64_t, uint64_t))(v87 + 8);
  uint64_t v69 = v87 + 8;
  v43(v33, v35);
  uint64_t v44 = *(void (**)(char *, char *, uint64_t))(v86 + 32);
  uint64_t v71 = v86 + 32;
  uint64_t v70 = v44;
  v44(v93, v95, v39);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v45 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v45 < 0)
  {
LABEL_10:
    uint64_t result = (uint64_t (*)(uint64_t, uint64_t))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v46 = v73;
    uint64_t v47 = v72;
    uint64_t v48 = v84;
    uint64_t v49 = v93;
    uint64_t v89 = v43;
    uint64_t v90 = v35;
    uint64_t v50 = v85;
    if (v45)
    {
      uint64_t v51 = 0;
      uint64_t v88 = v45;
      uint64_t v52 = (void (*)(char *, uint64_t))v89;
      do
      {
        uint64_t v95 = v51 + 1;
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        uint64_t v53 = v90;
        dispatch thunk of static Numeric.* infix(_:_:)();
        v52(v46, v53);
        v52(v47, v53);
        dispatch thunk of SIMDStorage.subscript.setter();
        uint64_t v49 = v93;
        uint64_t v51 = v95;
      }
      while ((char *)v88 != v95);
    }
    uint64_t v54 = v86;
    (*(void (**)(char *, uint64_t))(v86 + 8))(v49, v50);
    uint64_t v55 = v48;
    uint64_t v56 = v50;
    uint64_t v57 = v50;
    unint64_t v58 = v70;
    v70(v76, v55, v56);
    unint64_t v59 = v94;
    uint64_t v60 = v90;
    v82(v94, v78, v90);
    uint64_t v61 = v75;
    (*(void (**)(char *, uint64_t, uint64_t))(v54 + 16))(v75, v91, v57);
    uint64_t v62 = v87;
    unint64_t v63 = (*(unsigned __int8 *)(v87 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v87 + 80);
    unint64_t v64 = (v77 + *(unsigned __int8 *)(v54 + 80) + v63) & ~(unint64_t)*(unsigned __int8 *)(v54 + 80);
    uint64_t v65 = (char *)swift_allocObject();
    uint64_t v66 = v79;
    *((void *)v65 + 2) = v57;
    *((void *)v65 + 3) = v66;
    uint64_t v67 = v92;
    *((void *)v65 + 4) = v80;
    *((void *)v65 + 5) = v67;
    *((void *)v65 + 6) = v81;
    (*(void (**)(char *, char *, uint64_t))(v62 + 32))(&v65[v63], v59, v60);
    v58(&v65[v64], v61, v57);
    return partial apply for closure #1 in static SIMD<>._jvpMultiply(lhs:rhs:);
  }
  return result;
}

uint64_t closure #1 in static SIMD<>._jvpMultiply(lhs:rhs:)@<X0>(uint64_t a1@<X0>, void (*a2)(char *, uint64_t)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v114 = a8;
  uint64_t v91 = a7;
  v109 = a2;
  uint64_t v110 = a4;
  uint64_t v89 = a1;
  uint64_t v92 = a9;
  uint64_t v11 = *(void *)(a6 + 48);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v13 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v96 = (char *)&v89 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v100 = (char *)&v89 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v99 = (char *)&v89 - v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v106 = (char *)&v89 - v20;
  MEMORY[0x270FA5388](v19);
  uint64_t v107 = *(void *)(a5 - 8);
  uint64_t v22 = MEMORY[0x270FA5388]((char *)&v89 - v21);
  uint64_t v112 = (char *)&v89 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  uint64_t v95 = (char *)&v89 - v25;
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  uint64_t v97 = (char *)&v89 - v27;
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  uint64_t v90 = (char *)&v89 - v29;
  uint64_t v30 = MEMORY[0x270FA5388](v28);
  uint64_t v111 = (char *)&v89 - v31;
  uint64_t v32 = MEMORY[0x270FA5388](v30);
  uint64_t v34 = (char *)&v89 - v33;
  uint64_t v35 = MEMORY[0x270FA5388](v32);
  uint64_t v93 = (char *)&v89 - v36;
  uint64_t v37 = MEMORY[0x270FA5388](v35);
  uint64_t v98 = (char *)&v89 - v38;
  uint64_t v116 = v39;
  uint64_t v40 = v37;
  uint64_t v42 = v41;
  uint64_t v101 = *(void (**)(uint64_t, uint64_t))(v39 + 16);
  uint64_t v102 = v39 + 16;
  v101(v37, a3);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v43 = a5;
  uint64_t v44 = v11;
  uint64_t v45 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v45 < 0) {
    goto LABEL_18;
  }
  uint64_t v46 = v45;
  uint64_t v47 = (void (*)(char *, uint64_t, uint64_t))v101;
  uint64_t v117 = v44;
  uint64_t v48 = v106;
  if (v45)
  {
    uint64_t v49 = 0;
    do
    {
      v47(v48, v40, v42);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v49;
    }
    while (v46 != v49);
  }
  uint64_t v50 = *(void (**)(char *, uint64_t))(v116 + 8);
  uint64_t v94 = v42;
  uint64_t v115 = v50;
  v116 += 8;
  v50((char *)v40, v42);
  uint64_t v104 = *(void (**)(char *, char *, uint64_t))(v107 + 32);
  uint64_t v105 = v107 + 32;
  v104(v93, v34, v43);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v103 = v43;
  uint64_t v51 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v51 < 0) {
    goto LABEL_18;
  }
  uint64_t v52 = v99;
  uint64_t v53 = v100;
  uint64_t v54 = v117;
  uint64_t v55 = v103;
  uint64_t v56 = v106;
  uint64_t v57 = v94;
  unint64_t v58 = v93;
  if (v51)
  {
    unint64_t v59 = 0;
    uint64_t v108 = v51;
    do
    {
      uint64_t v113 = v59 + 1;
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of static Numeric.* infix(_:_:)();
      uint64_t v60 = v56;
      uint64_t v61 = v55;
      uint64_t v62 = v54;
      unint64_t v63 = v115;
      v115(v53, v57);
      v63(v52, v57);
      uint64_t v54 = v62;
      uint64_t v55 = v61;
      uint64_t v56 = v60;
      dispatch thunk of SIMDStorage.subscript.setter();
      unint64_t v59 = v113;
    }
    while ((char *)v108 != v113);
  }
  v109 = *(void (**)(char *, uint64_t))(v107 + 8);
  v107 += 8;
  v109(v58, v55);
  v104(v98, v111, v55);
  ((void (*)(char *, uint64_t, uint64_t))v101)(v96, v89, v57);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v64 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v64 < 0) {
    goto LABEL_18;
  }
  uint64_t v65 = v64;
  uint64_t v66 = v96;
  uint64_t v67 = v95;
  uint64_t v68 = v103;
  uint64_t v69 = v106;
  uint64_t v70 = (void (*)(char *, char *, uint64_t))v101;
  if (v64)
  {
    uint64_t v71 = 0;
    do
    {
      v70(v69, v66, v57);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v71;
    }
    while (v65 != v71);
  }
  v115(v66, v57);
  v104(v97, v67, v68);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v72 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v72 < 0)
  {
LABEL_18:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v73 = v99;
    uint64_t v74 = v100;
    uint64_t v75 = v97;
    uint64_t v76 = v103;
    uint64_t v77 = v106;
    uint64_t v78 = v94;
    if (v72)
    {
      uint64_t v79 = 0;
      uint64_t v111 = (char *)v72;
      do
      {
        uint64_t v113 = v79 + 1;
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of static Numeric.* infix(_:_:)();
        uint64_t v80 = v74;
        uint64_t v81 = v74;
        uint64_t v82 = v77;
        uint64_t v83 = v76;
        uint64_t v84 = v115;
        v115(v80, v78);
        v84(v73, v78);
        uint64_t v76 = v83;
        uint64_t v77 = v82;
        uint64_t v74 = v81;
        dispatch thunk of SIMDStorage.subscript.setter();
        uint64_t v79 = v113;
      }
      while (v111 != v113);
    }
    uint64_t v85 = v109;
    v109(v75, v76);
    uint64_t v86 = v90;
    v104(v90, v112, v76);
    swift_getAssociatedConformanceWitness();
    uint64_t v87 = v98;
    dispatch thunk of static AdditiveArithmetic.+ infix(_:_:)();
    v85(v86, v76);
    return ((uint64_t (*)(char *, uint64_t))v85)(v87, v76);
  }
  return result;
}

uint64_t (*forward-mode derivative of static SIMD<>.* infix(_:_:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8))(uint64_t a1, uint64_t a2)
{
  return partial apply for closure #1 in static SIMD<>._jvpMultiply(lhs:rhs:);
}

uint64_t closure #1 in static SIMD<>._vjpDivide(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v101 = a5;
  uint64_t v100 = a4;
  uint64_t v112 = a2;
  uint64_t v113 = a3;
  uint64_t v98 = a1;
  uint64_t v102 = (void (*)(char *, uint64_t))a7;
  uint64_t v10 = *(void *)(a7 + 48);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v119 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v11 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v103 = (char *)&v96 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v106 = (char *)&v96 - v14;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v96 - v16;
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  uint64_t v105 = (char *)&v96 - v19;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v96 - v21;
  uint64_t v107 = *(void *)(a6 - 8);
  uint64_t v23 = MEMORY[0x270FA5388](v20);
  uint64_t v114 = (char *)&v96 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v97 = (char *)&v96 - v26;
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  uint64_t v117 = (char *)&v96 - v28;
  uint64_t v29 = MEMORY[0x270FA5388](v27);
  uint64_t v31 = (char *)&v96 - v30;
  uint64_t v32 = MEMORY[0x270FA5388](v29);
  uint64_t v104 = (char *)&v96 - v33;
  uint64_t v34 = MEMORY[0x270FA5388](v32);
  uint64_t v118 = (char *)&v96 - v35;
  uint64_t v36 = MEMORY[0x270FA5388](v34);
  uint64_t v38 = (char *)&v96 - v37;
  MEMORY[0x270FA5388](v36);
  uint64_t v96 = (char *)&v96 - v39;
  dispatch thunk of SIMDStorage.init()();
  uint64_t v40 = v38;
  uint64_t v41 = v10;
  uint64_t v42 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v42 < 0) {
    goto LABEL_22;
  }
  uint64_t v115 = v31;
  uint64_t v111 = a9;
  uint64_t v43 = v100;
  uint64_t v110 = v40;
  uint64_t v120 = v22;
  uint64_t v121 = v41;
  uint64_t v44 = v105;
  if (v42)
  {
    uint64_t v45 = 0;
    uint64_t v108 = (void (*)(char *, char *, uint64_t))(v119 + 8);
    v109 = (char *)v42;
    uint64_t v46 = (void (**)(char *, uint64_t))(v119 + 8);
    do
    {
      uint64_t v116 = v45 + 1;
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of SIMDStorage.subscript.getter();
      uint64_t v47 = AssociatedTypeWitness;
      dispatch thunk of static FloatingPoint./ infix(_:_:)();
      uint64_t v48 = v43;
      uint64_t v49 = *v46;
      (*v46)(v17, v47);
      v49(v44, v47);
      uint64_t v43 = v48;
      uint64_t v41 = v121;
      dispatch thunk of SIMDStorage.subscript.setter();
      uint64_t v45 = v116;
    }
    while (v109 != v116);
  }
  uint64_t v99 = v17;
  uint64_t v50 = v107;
  uint64_t v51 = v96;
  uint64_t v108 = *(void (**)(char *, char *, uint64_t))(v107 + 32);
  v109 = (char *)(v107 + 32);
  v108(v96, v110, a6);
  uint64_t v52 = *(void *)(v111 + 16);
  SIMD<>.sum()(a6, v52, v98);
  uint64_t v53 = *(void (**)(char *, uint64_t))(v50 + 8);
  uint64_t v107 = v50 + 8;
  uint64_t v102 = v53;
  v53(v51, a6);
  uint64_t v96 = (char *)v52;
  uint64_t v101 = *(void *)(v52 + 16);
  dispatch thunk of static SignedNumeric.- prefix(_:)();
  dispatch thunk of SIMDStorage.init()();
  uint64_t v98 = a6;
  uint64_t v54 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v54 < 0) {
    goto LABEL_22;
  }
  uint64_t v55 = v101;
  uint64_t v56 = v100;
  uint64_t v57 = v99;
  unint64_t v58 = v105;
  uint64_t v59 = v98;
  if (v54)
  {
    uint64_t v60 = 0;
    uint64_t v110 = (char *)(v119 + 8);
    uint64_t v111 = v54;
    uint64_t v61 = (void (**)(char *, uint64_t))(v119 + 8);
    do
    {
      uint64_t v116 = v60 + 1;
      uint64_t v62 = v58;
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of SIMDStorage.subscript.getter();
      uint64_t v63 = v56;
      uint64_t v64 = v59;
      uint64_t v65 = v41;
      uint64_t v66 = v55;
      uint64_t v67 = AssociatedTypeWitness;
      dispatch thunk of static Numeric.* infix(_:_:)();
      uint64_t v68 = *v61;
      (*v61)(v57, v67);
      uint64_t v69 = v67;
      uint64_t v55 = v66;
      uint64_t v41 = v65;
      uint64_t v59 = v64;
      uint64_t v56 = v63;
      v68(v62, v69);
      dispatch thunk of SIMDStorage.subscript.setter();
      unint64_t v58 = v62;
      uint64_t v60 = v116;
    }
    while ((char *)v111 != v116);
  }
  v108(v104, v115, v59);
  uint64_t v70 = *(void (**)(char *, char *, uint64_t))(v119 + 16);
  v70(v103, v106, AssociatedTypeWitness);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v71 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v71 < 0) {
    goto LABEL_22;
  }
  uint64_t v72 = v71;
  uint64_t v73 = v103;
  uint64_t v74 = v120;
  uint64_t v75 = v105;
  uint64_t v76 = v98;
  uint64_t v77 = v97;
  if (v71)
  {
    uint64_t v78 = 0;
    do
    {
      v70(v74, v73, AssociatedTypeWitness);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v78;
    }
    while (v72 != v78);
  }
  uint64_t v79 = *(char **)(v119 + 8);
  v119 += 8;
  uint64_t v116 = v79;
  ((void (*)(char *, uint64_t))v79)(v73, AssociatedTypeWitness);
  v108(v117, v77, v76);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v80 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v80 < 0) {
    goto LABEL_22;
  }
  uint64_t v81 = v117;
  uint64_t v82 = v104;
  uint64_t v83 = v99;
  uint64_t v84 = v75;
  if (v80)
  {
    uint64_t v85 = 0;
    uint64_t v111 = v80;
    do
    {
      uint64_t v115 = v85 + 1;
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of SIMDStorage.subscript.getter();
      uint64_t v86 = AssociatedTypeWitness;
      dispatch thunk of static FloatingPoint./ infix(_:_:)();
      uint64_t v87 = v82;
      uint64_t v88 = v116;
      ((void (*)(char *, uint64_t))v116)(v83, v86);
      ((void (*)(char *, uint64_t))v88)(v84, v86);
      uint64_t v82 = v87;
      dispatch thunk of SIMDStorage.subscript.setter();
      uint64_t v81 = v117;
      uint64_t v85 = v115;
    }
    while ((char *)v111 != v115);
  }
  uint64_t v89 = v102;
  v102(v81, v76);
  v89(v82, v76);
  ((void (*)(char *, uint64_t))v116)(v106, AssociatedTypeWitness);
  v108(v118, v114, v76);
  dispatch thunk of SIMDStorage.init()();
  uint64_t v90 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v90 < 0)
  {
LABEL_22:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v91 = v118;
    if (v90)
    {
      uint64_t v92 = 0;
      uint64_t v115 = (char *)v90;
      uint64_t v93 = v116;
      do
      {
        uint64_t v117 = v92 + 1;
        dispatch thunk of SIMDStorage.subscript.getter();
        dispatch thunk of SIMDStorage.subscript.getter();
        uint64_t v94 = AssociatedTypeWitness;
        dispatch thunk of static Numeric.* infix(_:_:)();
        ((void (*)(char *, uint64_t))v93)(v83, v94);
        ((void (*)(char *, uint64_t))v93)(v84, v94);
        dispatch thunk of SIMDStorage.subscript.setter();
        uint64_t v91 = v118;
        uint64_t v92 = v117;
      }
      while (v115 != v117);
    }
    return ((uint64_t (*)(char *, uint64_t))v102)(v91, v76);
  }
  return result;
}

uint64_t (*static SIMD<>._vjpInit(repeating:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7))@<X0>(uint64_t a1@<X8>)
{
  uint64_t v37 = a6;
  uint64_t v38 = a7;
  uint64_t v36 = a5;
  uint64_t v33 = *(void *)(a3 - 8);
  uint64_t v34 = a1;
  MEMORY[0x270FA5388](a1);
  uint64_t v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = v10;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v12 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v13 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v31 = (char *)&v30 - v16;
  uint64_t v32 = v12;
  uint64_t v18 = v17;
  uint64_t v19 = *(void (**)(void))(v12 + 16);
  uint64_t v30 = v12 + 16;
  v19();
  dispatch thunk of SIMDStorage.init()();
  uint64_t v20 = a3;
  uint64_t v21 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v21 < 0)
  {
    uint64_t result = (uint64_t (*)@<X0>(uint64_t@<X8>))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v22 = v21;
    uint64_t v39 = v20;
    uint64_t v23 = v31;
    if (v21)
    {
      uint64_t v24 = 0;
      do
      {
        ((void (*)(char *, char *, uint64_t))v19)(v15, v23, v18);
        dispatch thunk of SIMDStorage.subscript.setter();
        ++v24;
      }
      while (v22 != v24);
    }
    (*(void (**)(char *, uint64_t))(v32 + 8))(v23, v18);
    uint64_t v25 = v39;
    (*(void (**)(uint64_t, char *, uint64_t))(v33 + 32))(v34, v9, v39);
    uint64_t v26 = (void *)swift_allocObject();
    uint64_t v27 = v35;
    v26[2] = v25;
    _OWORD v26[3] = v27;
    uint64_t v28 = v37;
    v26[4] = v36;
    v26[5] = v28;
    v26[6] = v38;
    return partial apply for closure #1 in static SIMD<>._vjpInit(repeating:);
  }
  return result;
}

uint64_t (*reverse-mode derivative of SIMD.init(repeating:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7))@<X0>(uint64_t a1@<X8>)
{
  static SIMD<>._vjpInit(repeating:)(a1, a2, a3, a4, a5, a6, a7);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 8))(a2, AssociatedTypeWitness);
  return partial apply for closure #1 in static SIMD<>._vjpInit(repeating:);
}

uint64_t (*static SIMD<>._jvpInit(repeating:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7))@<X0>(uint64_t a1@<X8>)
{
  uint64_t v37 = a6;
  uint64_t v38 = a7;
  uint64_t v36 = a5;
  uint64_t v33 = *(void *)(a3 - 8);
  uint64_t v34 = a1;
  MEMORY[0x270FA5388](a1);
  uint64_t v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = v10;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v12 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v13 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v31 = (char *)&v30 - v16;
  uint64_t v32 = v12;
  uint64_t v18 = v17;
  uint64_t v19 = *(void (**)(void))(v12 + 16);
  uint64_t v30 = v12 + 16;
  v19();
  dispatch thunk of SIMDStorage.init()();
  uint64_t v20 = a3;
  uint64_t v21 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v21 < 0)
  {
    uint64_t result = (uint64_t (*)@<X0>(uint64_t@<X8>))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v22 = v21;
    uint64_t v39 = v20;
    uint64_t v23 = v31;
    if (v21)
    {
      uint64_t v24 = 0;
      do
      {
        ((void (*)(char *, char *, uint64_t))v19)(v15, v23, v18);
        dispatch thunk of SIMDStorage.subscript.setter();
        ++v24;
      }
      while (v22 != v24);
    }
    (*(void (**)(char *, uint64_t))(v32 + 8))(v23, v18);
    uint64_t v25 = v39;
    (*(void (**)(uint64_t, char *, uint64_t))(v33 + 32))(v34, v9, v39);
    uint64_t v26 = (void *)swift_allocObject();
    uint64_t v27 = v35;
    v26[2] = v25;
    _OWORD v26[3] = v27;
    uint64_t v28 = v37;
    v26[4] = v36;
    v26[5] = v28;
    v26[6] = v38;
    return partial apply for closure #1 in static SIMD<>._jvpInit(repeating:);
  }
  return result;
}

uint64_t closure #1 in static SIMD<>._jvpInit(repeating:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v6 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v21 = v5;
  uint64_t v9 = *(void (**)(void))(v5 + 16);
  uint64_t v11 = (char *)&v20 - v10;
  uint64_t v13 = v12;
  uint64_t v14 = v9;
  v9();
  dispatch thunk of SIMDStorage.init()();
  uint64_t v22 = a1;
  uint64_t v15 = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (v15 < 0)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v23 = a2;
    uint64_t v16 = v13;
    if (v15)
    {
      uint64_t v17 = 0;
      do
      {
        uint64_t v18 = v15;
        ((void (*)(char *, char *, uint64_t))v14)(v8, v11, v16);
        dispatch thunk of SIMDStorage.subscript.setter();
        uint64_t v15 = v18;
        ++v17;
      }
      while (v18 != v17);
    }
    return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v11, v16);
  }
  return result;
}

uint64_t (*forward-mode derivative of SIMD.init(repeating:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7))(uint64_t a1)
{
  static SIMD<>._jvpInit(repeating:)(a1, a2, a3, a4, a5, a6, a7);
  uint64_t v14 = v13;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 8))(a2, AssociatedTypeWitness);
  uint64_t v16 = (void *)swift_allocObject();
  void v16[2] = a3;
  long long v16[3] = a4;
  v16[4] = a5;
  v16[5] = a6;
  v16[6] = a7;
  v16[7] = partial apply for closure #1 in static SIMD<>._jvpInit(repeating:);
  v16[8] = v14;
  return partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A.SIMDStorage.Scalar) -> (@out A);
}

void forward-mode derivative of FloatingPoint.addingProduct(_:_:)()
{
}

void forward-mode derivative of FloatingPoint.squareRoot()()
{
}

void forward-mode derivative of static FloatingPoint.maximum(_:_:)()
{
}

void forward-mode derivative of SIMD2.subscript.setter()
{
}

void forward-mode derivative of SIMD4.subscript.setter()
{
}

void forward-mode derivative of SIMD8.subscript.setter()
{
}

void forward-mode derivative of SIMD16.subscript.setter()
{
}

void forward-mode derivative of SIMD32.subscript.setter()
{
}

void forward-mode derivative of SIMD64.subscript.setter()
{
}

void forward-mode derivative of SIMD3.subscript.setter()
{
}

Swift::Void __swiftcall Array._checkSubscript_mutating(_:)(Swift::Int a1)
{
  uint64_t v2 = v1;
  char isClassOrObjCExistentialType = _swift_isClassOrObjCExistentialType();
  if (a1 < 0) {
    goto LABEL_5;
  }
  uint64_t v5 = v2 & 0xFFFFFFFFFFFFFF8;
  if ((isClassOrObjCExistentialType & 1) == 0) {
    uint64_t v5 = v2;
  }
  if (*(void *)(v5 + 16) <= (unint64_t)a1)
  {
LABEL_5:
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
}

uint64_t sub_22274E938()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@guaranteed [A.Differentiable.TangentVector]<A>.DifferentiableView) -> (@owned [A.Differentiable.TangentVector]<A>.DifferentiableView)()
{
  return (*(uint64_t (**)(void))(v0 + 32))();
}

{
  uint64_t v0;
  uint64_t v1;

  uint64_t v1 = (*(uint64_t (**)(void))(v0 + 32))();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_22274E970()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22274E984()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22274E994()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22274E9E0()
{
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t partial apply for implicit closure #3 in static Array<A>.DifferentiableView<>.+ infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return partial apply for implicit closure #3 in static Array<A>.DifferentiableView<>.+ infix(_:_:)(a1, a2, MEMORY[0x263F8DF20]);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A, @in_guaranteed A) -> (@out A)(uint64_t a1)
{
  return partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A, @in_guaranteed A) -> (@out A)(a1);
}

{
  uint64_t v1;
  uint64_t (*v3)(uint64_t, uint64_t);
  uint64_t TupleTypeMetadata2;

  double v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 40);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  return v3(a1, a1 + *(int *)(TupleTypeMetadata2 + 48));
}

uint64_t sub_22274EA20()
{
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t partial apply for implicit closure #3 in static Array<A>.DifferentiableView<>.- infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return partial apply for implicit closure #3 in static Array<A>.DifferentiableView<>.+ infix(_:_:)(a1, a2, MEMORY[0x263F8DF28]);
}

uint64_t partial apply for implicit closure #3 in static Array<A>.DifferentiableView<>.+ infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, void, void))
{
  return a3(a1, a2, *(void *)(v3 + 16), *(void *)(v3 + 24));
}

uint64_t type metadata accessor for Array<A>.DifferentiableView()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_22274EB00()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t partial apply for pullback #1 <A>(_:) in Array<A>._vjpSubscript(index:)(uint64_t a1)
{
  return pullback #1 <A>(_:) in Array<A>._vjpSubscript(index:)(a1, v1[4], v1[5], v1[2]);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A.Differentiable.TangentVector) -> (@owned [A.Differentiable.TangentVector]<A>.DifferentiableView)()
{
  return (*(uint64_t (**)(void))(v0 + 32))();
}

uint64_t sub_22274EB6C()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t partial apply for differential #1 <A>(_:) in Array<A>._jvpSubscript(index:)(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 32);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();

  return Array<A>.DifferentiableView<>.subscript.getter(v3, a1, AssociatedTypeWitness);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@guaranteed [A.Differentiable.TangentVector]<A>.DifferentiableView) -> (@out A.Differentiable.TangentVector)()
{
  return (*(uint64_t (**)(void))(v0 + 32))();
}

uint64_t partial apply for pullback #1 <A>(_:) in static Array<A>._vjpConcatenate(_:_:)(uint64_t a1)
{
  uint64_t v3 = v1[2];
  uint64_t v4 = v1[4];
  uint64_t v5 = v1[5];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  type metadata accessor for Array();
  swift_bridgeObjectRetain();
  swift_getWitnessTable();
  if (Collection.isEmpty.getter())
  {
    swift_bridgeObjectRelease();
    uint64_t v7 = static Array._allocateUninitialized(_:)();
    static Array._allocateUninitialized(_:)();
    return v7;
  }
  uint64_t v8 = MEMORY[0x223C9BB00](a1, AssociatedTypeWitness);
  uint64_t v9 = MEMORY[0x223C9BB00](v4, v3);
  uint64_t v10 = MEMORY[0x223C9BB00](v5, v3);
  if (__OFADD__(v9, v10))
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v8 != v9 + v10)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    _StringGuts.grow(_:)(91);
    v12._object = (void *)0x8000000222758BB0;
    v12._countAndFlagsBits = 0xD000000000000022;
    String.append(_:)(v12);
    v13._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v13);
    swift_bridgeObjectRelease();
    v14._countAndFlagsBits = 0xD00000000000002ELL;
    v14._object = (void *)0x8000000222758BE0;
    String.append(_:)(v14);
    v15._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v15);
    swift_bridgeObjectRelease();
    v16._countAndFlagsBits = 0x20646E6120;
    v16._object = (void *)0xE500000000000000;
    String.append(_:)(v16);
    v17._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v17);
    swift_bridgeObjectRelease();
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    goto LABEL_10;
  }
  if ((MEMORY[0x223C9BB00](v4, v3) & 0x8000000000000000) == 0)
  {
    Array.subscript.getter();
    type metadata accessor for ArraySlice();
    swift_getWitnessTable();
    uint64_t v7 = Array.init<A>(_:)();
    swift_getCanonicalSpecializedMetadata();
    swift_getWitnessTable();
    lazy protocol witness table accessor for type PartialRangeFrom<Int> and conformance PartialRangeFrom<A>();
    MutableCollection.subscript.getter();
    swift_bridgeObjectRelease();
    Array.init<A>(_:)();
    return v7;
  }
LABEL_10:
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@guaranteed [A.Differentiable.TangentVector]<A>.DifferentiableView) -> (@owned [A.Differentiable.TangentVector]<A>.DifferentiableView, @owned [A.Differentiable.TangentVector]<A>.DifferentiableView)()
{
  return (*(uint64_t (**)(void))(v0 + 32))();
}

uint64_t objectdestroy_80Tm()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t partial apply for differential #1 <A>(_:_:) in static Array<A>._jvpConcatenate(_:_:)()
{
  uint64_t v1 = v0[2];
  uint64_t v3 = v0[4];
  uint64_t v2 = v0[5];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = swift_bridgeObjectRetain();
  uint64_t v6 = MEMORY[0x223C9BB00](v5, AssociatedTypeWitness);
  swift_bridgeObjectRelease();
  if (v6 == MEMORY[0x223C9BB00](v3, v1)
    && (uint64_t v7 = swift_bridgeObjectRetain(),
        uint64_t v8 = MEMORY[0x223C9BB00](v7, AssociatedTypeWitness),
        swift_bridgeObjectRelease(),
        v8 == MEMORY[0x223C9BB00](v2, v1)))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v9 = static Array.+ infix(_:_:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v9;
  }
  else
  {
    _StringGuts.grow(_:)(82);
    v11._object = (void *)0x8000000222758B60;
    v11._countAndFlagsBits = 0xD000000000000049;
    String.append(_:)(v11);
    v12._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v12);
    swift_bridgeObjectRelease();
    v13._countAndFlagsBits = 0x20646E6120;
    v13._object = (void *)0xE500000000000000;
    String.append(_:)(v13);
    MEMORY[0x223C9BB00](v2, v1);
    v14._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v14);
    swift_bridgeObjectRelease();
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@guaranteed [A.Differentiable.TangentVector]<A>.DifferentiableView, @guaranteed [A.Differentiable.TangentVector]<A>.DifferentiableView) -> (@owned [A.Differentiable.TangentVector]<A>.DifferentiableView)()
{
  return (*(uint64_t (**)(void))(v0 + 32))();
}

uint64_t sub_22274F2A4()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t partial apply for closure #1 in Array<A>._vjpAppend(_:)()
{
  swift_getAssociatedTypeWitness();
  swift_bridgeObjectRetain();
  Array.subscript.getter();
  swift_bridgeObjectRelease();

  return $defer #1 <A>() in closure #1 in Array<A>._vjpAppend(_:)();
}

uint64_t partial apply for autodiff self-reordering reabstraction thunk for @escaping @callee_guaranteed (@inout [A.Differentiable.TangentVector]<A>.DifferentiableView) -> (@out A.Differentiable.TangentVector)()
{
  return (*(uint64_t (**)(void))(v0 + 32))();
}

uint64_t sub_22274F388()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t partial apply for closure #1 in Array<A>._jvpAppend(_:)(uint64_t a1, uint64_t a2)
{
  return closure #1 in Array<A>._jvpAppend(_:)(a1, a2);
}

uint64_t sub_22274F3A0()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t partial apply for autodiff self-reordering reabstraction thunk for @escaping @callee_guaranteed (@in A.Differentiable.TangentVector, @inout [A.Differentiable.TangentVector]<A>.DifferentiableView) -> ()(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(v2 + 32))(a2, a1);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 8);

  return v5(a1, AssociatedTypeWitness);
}

uint64_t sub_22274F474()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t partial apply for closure #1 in static Array<A>._vjpAppend(_:_:)()
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  type metadata accessor for Array();
  swift_bridgeObjectRetain();
  swift_getWitnessTable();
  Collection.dropFirst(_:)();
  type metadata accessor for ArraySlice();
  swift_getWitnessTable();
  uint64_t v1 = Array.init<A>(_:)();
  uint64_t v2 = swift_bridgeObjectRetain();
  MEMORY[0x223C9BB00](v2, AssociatedTypeWitness);
  swift_bridgeObjectRelease();
  swift_getWitnessTable();
  swift_getWitnessTable();
  RangeReplaceableCollection<>.removeLast(_:)();
  return v1;
}

uint64_t sub_22274F5F0()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t partial apply for closure #1 in static Array<A>._jvpAppend(_:_:)()
{
  swift_getAssociatedTypeWitness();
  swift_bridgeObjectRetain();
  static Array.+= infix(_:_:)();

  return swift_bridgeObjectRelease();
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@inout [A.Differentiable.TangentVector]<A>.DifferentiableView, @guaranteed [A.Differentiable.TangentVector]<A>.DifferentiableView) -> ()()
{
  return (*(uint64_t (**)(void))(v0 + 32))();
}

uint64_t specialized Array.init(repeating:count:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = static Array._allocateUninitialized(_:)();
  if (a2 < 0)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v8 = v6;
    if (a2)
    {
      uint64_t v9 = v7;
      uint64_t v10 = *(void *)(a3 - 8);
      Swift::String v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16);
      do
      {
        v11(v9, a1, a3);
        v9 += *(void *)(v10 + 72);
        --a2;
      }
      while (a2);
    }
    type metadata accessor for Array();
    return v8;
  }
  return result;
}

uint64_t sub_22274F7CC()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t partial apply for closure #1 in static Array<A>._vjpInit(repeating:count:)(uint64_t a1)
{
  return closure #1 in static Array<A>._vjpInit(repeating:count:)(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_22274F7E4()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t partial apply for closure #1 in static Array<A>._jvpInit(repeating:count:)(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 32);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();

  return specialized Array.init(repeating:count:)(a1, v3, AssociatedTypeWitness);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A.Differentiable.TangentVector) -> (@owned [A.Differentiable.TangentVector]<A>.DifferentiableView)(uint64_t a1)
{
  uint64_t v3 = (*(uint64_t (**)(void))(v1 + 32))();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 8))(a1, AssociatedTypeWitness);
  return v3;
}

uint64_t partial apply for thunk for @callee_guaranteed (@in_guaranteed A) -> (@out A1)()
{
  return (*(uint64_t (**)(void))(v0 + 48))();
}

uint64_t sub_22274F910()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t partial apply for specialized pullback #1 <A><A1>(_:) in Array<A>._vjpDifferentiableMap<A>(_:)(uint64_t a1)
{
  return partial apply for specialized pullback #1 <A><A1>(_:) in Array<A>._vjpDifferentiableMap<A>(_:)(a1, specialized pullback #1 <A><A1>(_:) in Array<A>._vjpDifferentiableMap<A>(_:));
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@guaranteed [A1.Differentiable.TangentVector]<A>.DifferentiableView) -> (@owned [A.Differentiable.TangentVector]<A>.DifferentiableView)()
{
  return (*(uint64_t (**)(void))(v0 + 48))();
}

uint64_t partial apply for specialized differential #1 <A><A1>(_:) in Array<A>._jvpDifferentiableMap<A>(_:)(uint64_t a1)
{
  return partial apply for specialized pullback #1 <A><A1>(_:) in Array<A>._vjpDifferentiableMap<A>(_:)(a1, specialized differential #1 <A><A1>(_:) in Array<A>._jvpDifferentiableMap<A>(_:));
}

uint64_t partial apply for specialized pullback #1 <A><A1>(_:) in Array<A>._vjpDifferentiableMap<A>(_:)(uint64_t a1, uint64_t (*a2)(uint64_t, void, void, void, void, void))
{
  return a2(a1, v2[6], v2[2], v2[3], v2[4], v2[5]);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A1.Differentiable.TangentVector) -> (@out A1.Differentiable.TangentVector, @out A.Differentiable.TangentVector)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return thunk for @escaping @callee_guaranteed (@in_guaranteed A1.Differentiable.TangentVector) -> (@out A1.Differentiable.TangentVector, @out A.Differentiable.TangentVector)(a1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 48), a2);
}

uint64_t sub_22274F9C8()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t partial apply for specialized closure #1 in Array<A>._vjpDifferentiableReduce<A>(_:_:)(uint64_t a1, uint64_t a2)
{
  return specialized closure #1 in Array<A>._vjpDifferentiableReduce<A>(_:_:)(a1, a2, *(void *)(v2 + 48), *(void *)(v2 + 56));
}

uint64_t partial apply for autodiff self-reordering reabstraction thunk for @escaping @callee_guaranteed (@in_guaranteed A1.Differentiable.TangentVector) -> (@out A1.Differentiable.TangentVector, @owned [A.Differentiable.TangentVector]<A>.DifferentiableView)()
{
  return (*(uint64_t (**)(void))(v0 + 48))();
}

uint64_t partial apply for specialized closure #1 in Array<A>._jvpDifferentiableReduce<A>(_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return specialized closure #1 in Array<A>._jvpDifferentiableReduce<A>(_:_:)(a1, a2, *(void *)(v3 + 48), a3);
}

uint64_t partial apply for autodiff self-reordering reabstraction thunk for @escaping @callee_guaranteed (@in_guaranteed A1.Differentiable.TangentVector, @guaranteed [A.Differentiable.TangentVector]<A>.DifferentiableView) -> (@out A1.Differentiable.TangentVector)(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 48))(a2, a1);
}

uint64_t sub_22274FA7C()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

float partial apply for closure #1 in static Float16._vjpMultiply(lhs:rhs:)(__n128 a1, double a2, float a3)
{
  *(short float *)&a3 = *(short float *)(v3 + 16) * *(short float *)a1.n128_u16;
  return a3;
}

uint64_t sub_22274FAA4()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_22274FAB4()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

__int16 partial apply for closure #1 in static Float16._jvpMultiply(lhs:rhs:)@<H0>(__n128 a1@<Q0>, __n128 a2@<Q1>)
{
  *(short float *)&__int16 result = (short float)(*(short float *)(v2 + 16) * *(short float *)a2.n128_u16)
                          + (short float)(*(short float *)(v2 + 18) * *(short float *)a1.n128_u16);
  return result;
}

uint64_t sub_22274FADC()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_22274FAEC()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

__int16 partial apply for closure #1 in static Float16._vjpMultiplyAssign(_:_:)@<H0>(short float *a1@<X0>)
{
  *(short float *)&__int16 result = *(short float *)(v1 + 16) * *a1;
  *a1 = *(short float *)(v1 + 18) * *a1;
  return result;
}

uint64_t sub_22274FB18()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_22274FB28()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

__int16 partial apply for closure #1 in static Float16._jvpMultiplyAssign(_:_:)@<H0>(short float *a1@<X0>, __n128 a2@<Q0>)
{
  *(short float *)&__int16 result = (short float)(*(short float *)(v2 + 18) * *(short float *)a2.n128_u16)
                          + (short float)(*(short float *)(v2 + 16) * *a1);
  *a1 = *(short float *)&result;
  return result;
}

uint64_t sub_22274FB58()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_22274FB68()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_22274FB7C()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

float partial apply for closure #1 in static Float16._vjpDivide(lhs:rhs:)(__n128 a1, double a2, float a3)
{
  *(short float *)&a3 = *(short float *)a1.n128_u16 / *(short float *)(v3 + 16);
  return a3;
}

uint64_t sub_22274FBB0()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

__int16 partial apply for closure #1 in static Float16._jvpDivide(lhs:rhs:)@<H0>(__n128 a1@<Q0>, __n128 a2@<Q1>)
{
  *(short float *)&__int16 result = (short float)(*(short float *)a1.n128_u16 / *(short float *)(v2 + 16))
                          - (short float)((short float)(*(short float *)(v2 + 18)
                                                      / (short float)(*(short float *)(v2 + 16)
                                                                    * *(short float *)(v2 + 16)))
                                        * *(short float *)a2.n128_u16);
  return result;
}

uint64_t sub_22274FBE0()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_22274FBF0()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_22274FC04()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

__int16 partial apply for closure #1 in static Float16._vjpDivideAssign(_:_:)@<H0>(short float *a1@<X0>)
{
  short float v2 = *(short float *)(v1 + 18);
  *(short float *)&__int16 result = *a1 * (short float)(-*(short float *)(v1 + 16) / (short float)(v2 * v2));
  *a1 = *a1 / v2;
  return result;
}

uint64_t sub_22274FC3C()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_22274FC50()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

__int16 partial apply for closure #1 in static Float16._jvpDivideAssign(_:_:)@<H0>(short float *a1@<X0>, __n128 a2@<Q0>)
{
  *(short float *)&__int16 result = (short float)((short float)(*(short float *)(v2 + 16) * *a1)
                                        - (short float)(*(short float *)(v2 + 18) * *(short float *)a2.n128_u16))
                          / (short float)(*(short float *)(v2 + 16) * *(short float *)(v2 + 16));
  *a1 = *(short float *)&result;
  return result;
}

uint64_t sub_22274FC88()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

float partial apply for closure #1 in static Float._vjpMultiply(lhs:rhs:)(float a1)
{
  return *(float *)(v1 + 16) * a1;
}

uint64_t sub_22274FCAC()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22274FCBC()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

float partial apply for closure #1 in static Float._jvpMultiply(lhs:rhs:)(float a1, float a2)
{
  return (float)(*(float *)(v2 + 16) * a2) + (float)(*(float *)(v2 + 20) * a1);
}

uint64_t sub_22274FCE0()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22274FCF0()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

float partial apply for closure #1 in static Float._vjpMultiplyAssign(_:_:)(float *a1)
{
  float result = *(float *)(v1 + 16) * *a1;
  *a1 = *(float *)(v1 + 20) * *a1;
  return result;
}

uint64_t sub_22274FD18()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22274FD28()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

float partial apply for closure #1 in static Float._jvpMultiplyAssign(_:_:)(float *a1, float a2)
{
  float result = (float)(*(float *)(v2 + 20) * a2) + (float)(*(float *)(v2 + 16) * *a1);
  *a1 = result;
  return result;
}

uint64_t sub_22274FD54()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22274FD64()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22274FD78()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

float partial apply for closure #1 in static Float._vjpDivide(lhs:rhs:)(float a1)
{
  return a1 / *(float *)(v1 + 16);
}

uint64_t sub_22274FDA8()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

float partial apply for closure #1 in static Float._jvpDivide(lhs:rhs:)(float a1, float a2)
{
  return (float)(a1 / *(float *)(v2 + 16))
       - (float)((float)(*(float *)(v2 + 20) / (float)(*(float *)(v2 + 16) * *(float *)(v2 + 16))) * a2);
}

uint64_t sub_22274FDD4()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22274FDE4()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22274FDF8()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

float partial apply for closure #1 in static Float._vjpDivideAssign(_:_:)(float *a1)
{
  float v2 = *(float *)(v1 + 20);
  float result = *a1 * (float)((float)-*(float *)(v1 + 16) / (float)(v2 * v2));
  *a1 = *a1 / v2;
  return result;
}

uint64_t sub_22274FE2C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22274FE40()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

float partial apply for closure #1 in static Float._jvpDivideAssign(_:_:)(float *a1, float a2)
{
  float result = (float)((float)(*(float *)(v2 + 16) * *a1) - (float)(*(float *)(v2 + 20) * a2))
         / (float)(*(float *)(v2 + 16) * *(float *)(v2 + 16));
  *a1 = result;
  return result;
}

uint64_t sub_22274FE74()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

double partial apply for closure #1 in static Double._vjpMultiply(lhs:rhs:)(double a1)
{
  return *(double *)(v1 + 16) * a1;
}

uint64_t sub_22274FE98()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22274FEA8()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

double partial apply for closure #1 in static Double._jvpMultiply(lhs:rhs:)(double a1, double a2)
{
  return *(double *)(v2 + 16) * a2 + *(double *)(v2 + 24) * a1;
}

uint64_t sub_22274FECC()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22274FEDC()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

double partial apply for closure #1 in static Double._vjpMultiplyAssign(_:_:)(double *a1)
{
  double result = *(double *)(v1 + 16) * *a1;
  *a1 = *(double *)(v1 + 24) * *a1;
  return result;
}

uint64_t sub_22274FF04()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22274FF14()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

double partial apply for closure #1 in static Double._jvpMultiplyAssign(_:_:)(double *a1, double a2)
{
  double result = *(double *)(v2 + 24) * a2 + *(double *)(v2 + 16) * *a1;
  *a1 = result;
  return result;
}

uint64_t sub_22274FF40()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22274FF50()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22274FF64()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

double partial apply for closure #1 in static Double._vjpDivide(lhs:rhs:)(double a1)
{
  return a1 / *(double *)(v1 + 16);
}

uint64_t sub_22274FF94()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

double partial apply for closure #1 in static Double._jvpDivide(lhs:rhs:)(double a1, double a2)
{
  return a1 / *(double *)(v2 + 16) - *(double *)(v2 + 24) / (*(double *)(v2 + 16) * *(double *)(v2 + 16)) * a2;
}

uint64_t sub_22274FFC0()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22274FFD0()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22274FFE4()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

double partial apply for closure #1 in static Double._vjpDivideAssign(_:_:)(double *a1)
{
  double v2 = *(double *)(v1 + 24);
  double result = *a1 * (-*(double *)(v1 + 16) / (v2 * v2));
  *a1 = *a1 / v2;
  return result;
}

uint64_t sub_222750018()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22275002C()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

double partial apply for closure #1 in static Double._jvpDivideAssign(_:_:)(double *a1, double a2)
{
  double result = (*(double *)(v2 + 16) * *a1 - *(double *)(v2 + 24) * a2) / (*(double *)(v2 + 16) * *(double *)(v2 + 16));
  *a1 = result;
  return result;
}

uint64_t partial apply for closure #1 in FloatingPoint<>._vjpAddingProduct(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return partial apply for closure #1 in FloatingPoint<>._vjpAddingProduct(_:_:)(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))closure #1 in FloatingPoint<>._vjpAddingProduct(_:_:));
}

uint64_t sub_22275007C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t partial apply for autodiff self-reordering reabstraction thunk for @escaping @callee_guaranteed (@in_guaranteed A) -> (@out A, @out A, @out A)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 40))(a3, a1, a2);
}

uint64_t sub_2227500F4()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_222750104()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_222750114()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t partial apply for closure #2 in static FloatingPoint<>._vjpMaximum(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return closure #2 in static FloatingPoint<>._vjpMinimum(_:_:)(a1, a2, a3, *(void *)(v3 + 16));
}

uint64_t sub_222750144()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t partial apply for closure #1 in static FloatingPoint<>._vjpMaximum(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return closure #1 in static FloatingPoint<>._vjpMinimum(_:_:)(a1, a2, a3, *(void *)(v3 + 16));
}

uint64_t partial apply for closure #1 in _jvpFma<A>(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(unsigned __int8 *)(*(void *)(*(void *)(v3 + 16) - 8) + 80);
  return closure #1 in _jvpFma<A>(_:_:_:)(a1, a2, a3, v3 + ((v4 + 40) & ~v4), v3 + ((*(void *)(*(void *)(*(void *)(v3 + 16) - 8) + 64) + v4 + ((v4 + 40) & ~v4)) & ~v4), *(void *)(v3 + 16));
}

uint64_t partial apply for closure #1 in _vjpFma<A>(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return partial apply for closure #1 in FloatingPoint<>._vjpAddingProduct(_:_:)(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))closure #1 in _vjpFma<A>(_:_:_:));
}

uint64_t partial apply for closure #1 in FloatingPoint<>._vjpAddingProduct(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v6 = *(unsigned __int8 *)(*(void *)(*(void *)(v5 + 16) - 8) + 80);
  return a5(a1, a2, a3, a4, v5 + ((v6 + 40) & ~v6), v5 + ((*(void *)(*(void *)(*(void *)(v5 + 16) - 8) + 64) + v6 + ((v6 + 40) & ~v6)) & ~v6));
}

uint64_t partial apply for closure #1 in _vjpRemainder<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return partial apply for closure #1 in _vjpRemainder<A>(_:_:)(a1, a2, a3, MEMORY[0x263F8E208]);
}

uint64_t objectdestroy_324Tm()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  uint64_t v4 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = (v4 + 40) & ~v4;
  uint64_t v6 = *(void *)(v2 + 64);
  uint64_t v7 = v4 | 7;
  uint64_t v8 = (v6 + v4 + v5) & ~v4;
  uint64_t v9 = v8 + v6;
  v3(v0 + v5, v1);
  v3(v0 + v8, v1);

  return MEMORY[0x270FA0238](v0, v9, v7);
}

uint64_t partial apply for closure #1 in _vjpFmod<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return partial apply for closure #1 in _vjpRemainder<A>(_:_:)(a1, a2, a3, MEMORY[0x263F8E1F8]);
}

uint64_t partial apply for closure #1 in _vjpRemainder<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int *a4)
{
  uint64_t v5 = *(unsigned __int8 *)(*(void *)(v4[2] - 8) + 80);
  return closure #1 in _vjpRemainder<A>(_:_:)(a1, a2, a3, (uint64_t)v4 + ((v5 + 40) & ~v5), (uint64_t)v4 + ((*(void *)(*(void *)(v4[2] - 8) + 64) + v5 + ((v5 + 40) & ~v5)) & ~v5), v4[2], v4[3], v4[4], a4);
}

uint64_t partial apply for closure #1 in FloatingPoint<>._vjpSquareRoot()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return closure #1 in FloatingPoint<>._vjpSquareRoot()(a1, v2+ ((*(unsigned __int8 *)(*(void *)(*(void *)(v2 + 16) - 8) + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v2 + 16) - 8) + 80)), *(void *)(v2 + 16), a2);
}

uint64_t sub_22275045C()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t partial apply for closure #1 in _jvpCeil<A>(_:)()
{
  return closure #1 in _jvpCeil<A>(_:)();
}

uint64_t sub_22275048C()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_22275049C()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2227504AC()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t objectdestroy_330Tm()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 40) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);

  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_222750548()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_222750558()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_222750568()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_222750578()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_222750588()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

double partial apply for closure #1 in _jvpFma(_:_:_:)(double a1, double a2, double a3)
{
  return *(double *)(v3 + 16) * a1 + *(double *)(v3 + 24) * a2 + a3;
}

uint64_t sub_2227505B0()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2227505C0()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

double partial apply for closure #1 in _vjpFma(_:_:_:)(double a1)
{
  return *(double *)(v1 + 16) * a1;
}

uint64_t sub_2227505E4()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2227505F4()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_222750618()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_222750628()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22275064C()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22275065C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

double partial apply for closure #1 in _jvpSqrt(_:)(double a1)
{
  return a1 / (*(double *)(v1 + 16) + *(double *)(v1 + 16));
}

uint64_t sub_22275067C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22275068C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22275069C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2227506AC()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

float partial apply for closure #1 in _jvpExp(_:)(float a1)
{
  return *(float *)(v1 + 16) * a1;
}

uint64_t sub_2227506C8()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_2227506D8()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

float partial apply for closure #1 in _jvpExp2(_:)(float a1)
{
  return (float)(a1 * 0.69315) * *(float *)(v1 + 16);
}

uint64_t sub_222750704()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_222750714()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

float partial apply for closure #1 in _jvpLog(_:)(float a1)
{
  return a1 / *(float *)(v1 + 16);
}

uint64_t sub_222750730()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_222750740()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

float partial apply for closure #1 in _jvpLog10(_:)(float a1)
{
  return (float)(a1 * 0.43429) / *(float *)(v1 + 16);
}

uint64_t sub_22275076C()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_22275077C()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

float partial apply for closure #1 in _jvpLog2(_:)(float a1)
{
  return a1 / (float)(*(float *)(v1 + 16) * 0.69315);
}

uint64_t sub_2227507A8()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_2227507B8()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

float partial apply for closure #1 in _jvpSin(_:)(float a1)
{
  return cosf(*(float *)(v1 + 16)) * a1;
}

uint64_t sub_2227507F4()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_222750804()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

float partial apply for closure #1 in _jvpCos(_:)(float a1)
{
  return -(float)(a1 * sinf(*(float *)(v1 + 16)));
}

uint64_t sub_222750840()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_222750850()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

float partial apply for closure #1 in _jvpTan(_:)(float a1)
{
  return (float)((float)(*(float *)(v1 + 16) * *(float *)(v1 + 16)) + 1.0) * a1;
}

uint64_t sub_222750878()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_222750888()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

float partial apply for closure #1 in _jvpAsin(_:)(float a1)
{
  return a1 / sqrtf(1.0 - (float)(*(float *)(v1 + 16) * *(float *)(v1 + 16)));
}

uint64_t sub_2227508B4()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_2227508C4()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

float partial apply for closure #1 in _jvpAcos(_:)(float a1)
{
  return (float)-a1 / sqrtf(1.0 - (float)(*(float *)(v1 + 16) * *(float *)(v1 + 16)));
}

uint64_t sub_2227508F4()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_222750904()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

float partial apply for closure #1 in _jvpAtan(_:)(float a1)
{
  return a1 / (float)((float)(*(float *)(v1 + 16) * *(float *)(v1 + 16)) + 1.0);
}

uint64_t sub_22275092C()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_22275093C()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

float partial apply for closure #1 in _jvpSinh(_:)(float a1)
{
  return coshf(*(float *)(v1 + 16)) * a1;
}

uint64_t sub_222750978()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_222750988()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

float partial apply for closure #1 in _jvpCosh(_:)(float a1)
{
  return sinhf(*(float *)(v1 + 16)) * a1;
}

uint64_t sub_2227509C4()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_2227509D4()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

float partial apply for closure #1 in _jvpTanh(_:)(float a1)
{
  return (float)(1.0 - (float)(*(float *)(v1 + 16) * *(float *)(v1 + 16))) * a1;
}

uint64_t sub_2227509FC()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_222750A0C()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

float partial apply for closure #1 in _jvpAsinh(_:)(float a1)
{
  return a1 / sqrtf((float)(*(float *)(v1 + 16) * *(float *)(v1 + 16)) + 1.0);
}

uint64_t sub_222750A38()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_222750A48()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

float partial apply for closure #1 in _jvpAcosh(_:)(float a1)
{
  return a1 / sqrtf((float)(*(float *)(v1 + 16) * *(float *)(v1 + 16)) + -1.0);
}

uint64_t sub_222750A74()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_222750A84()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

float partial apply for closure #1 in _jvpAtanh(_:)(float a1)
{
  return a1 / (float)(1.0 - (float)(*(float *)(v1 + 16) * *(float *)(v1 + 16)));
}

uint64_t sub_222750AAC()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_222750ABC()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

float partial apply for closure #1 in _jvpExpm1(_:)(float a1)
{
  return expf(*(float *)(v1 + 16)) * a1;
}

uint64_t sub_222750AF8()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_222750B08()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

float partial apply for closure #1 in _jvpLog1p(_:)(float a1)
{
  return a1 / (float)(*(float *)(v1 + 16) + 1.0);
}

uint64_t sub_222750B2C()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_222750B3C()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

float partial apply for closure #1 in _jvpErf(_:)(float a1)
{
  return (float)(a1 * 1.1284) * expf(-(float)(*(float *)(v1 + 16) * *(float *)(v1 + 16)));
}

uint64_t sub_222750B88()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_222750B98()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

float partial apply for closure #1 in _jvpErfc(_:)(float a1)
{
  return (float)(a1 * -1.1284) * expf(-(float)(*(float *)(v1 + 16) * *(float *)(v1 + 16)));
}

uint64_t sub_222750BE4()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_222750BF4()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

double partial apply for closure #1 in _jvpExp(_:)(double a1)
{
  return *(double *)(v1 + 16) * a1;
}

uint64_t sub_222750C10()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_222750C20()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

double partial apply for closure #1 in _jvpExp2(_:)(double a1)
{
  return a1 * 0.693147181 * *(double *)(v1 + 16);
}

uint64_t sub_222750C48()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_222750C58()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

double partial apply for closure #1 in _jvpLog(_:)(double a1)
{
  return a1 / *(double *)(v1 + 16);
}

uint64_t sub_222750C74()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_222750C84()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

double partial apply for closure #1 in _jvpLog10(_:)(double a1)
{
  return a1 * 0.434294482 / *(double *)(v1 + 16);
}

uint64_t sub_222750CAC()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_222750CBC()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

double partial apply for closure #1 in _jvpLog2(_:)(double a1)
{
  return a1 / (*(double *)(v1 + 16) * 0.693147181);
}

uint64_t sub_222750CE4()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_222750CF4()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

long double partial apply for closure #1 in _jvpSin(_:)(double a1)
{
  return cos(*(long double *)(v1 + 16)) * a1;
}

uint64_t sub_222750D30()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_222750D40()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

long double partial apply for closure #1 in _jvpCos(_:)(double a1)
{
  return -(a1 * sin(*(long double *)(v1 + 16)));
}

uint64_t sub_222750D7C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_222750D8C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

double partial apply for closure #1 in _jvpTan(_:)(double a1)
{
  return (*(double *)(v1 + 16) * *(double *)(v1 + 16) + 1.0) * a1;
}

uint64_t sub_222750DB4()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_222750DC4()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

double partial apply for closure #1 in _jvpAsin(_:)(double a1)
{
  return a1 / sqrt(1.0 - *(double *)(v1 + 16) * *(double *)(v1 + 16));
}

uint64_t sub_222750DF0()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_222750E00()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

double partial apply for closure #1 in _jvpAcos(_:)(double a1)
{
  return -a1 / sqrt(1.0 - *(double *)(v1 + 16) * *(double *)(v1 + 16));
}

uint64_t sub_222750E30()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_222750E40()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

double partial apply for closure #1 in _jvpAtan(_:)(double a1)
{
  return a1 / (*(double *)(v1 + 16) * *(double *)(v1 + 16) + 1.0);
}

uint64_t sub_222750E68()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_222750E78()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

long double partial apply for closure #1 in _jvpSinh(_:)(double a1)
{
  return cosh(*(long double *)(v1 + 16)) * a1;
}

uint64_t sub_222750EB4()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_222750EC4()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

long double partial apply for closure #1 in _jvpCosh(_:)(double a1)
{
  return sinh(*(long double *)(v1 + 16)) * a1;
}

uint64_t sub_222750F00()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_222750F10()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

double partial apply for closure #1 in _jvpTanh(_:)(double a1)
{
  return (1.0 - *(double *)(v1 + 16) * *(double *)(v1 + 16)) * a1;
}

uint64_t sub_222750F38()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_222750F48()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

double partial apply for closure #1 in _jvpAsinh(_:)(double a1)
{
  return a1 / sqrt(*(double *)(v1 + 16) * *(double *)(v1 + 16) + 1.0);
}

uint64_t sub_222750F74()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_222750F84()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

double partial apply for closure #1 in _jvpAcosh(_:)(double a1)
{
  return a1 / sqrt(*(double *)(v1 + 16) * *(double *)(v1 + 16) + -1.0);
}

uint64_t sub_222750FB0()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_222750FC0()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

double partial apply for closure #1 in _jvpAtanh(_:)(double a1)
{
  return a1 / (1.0 - *(double *)(v1 + 16) * *(double *)(v1 + 16));
}

uint64_t sub_222750FE8()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_222750FF8()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

long double partial apply for closure #1 in _jvpExpm1(_:)(double a1)
{
  return exp(*(long double *)(v1 + 16)) * a1;
}

uint64_t sub_222751034()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_222751044()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

double partial apply for closure #1 in _jvpLog1p(_:)(double a1)
{
  return a1 / (*(double *)(v1 + 16) + 1.0);
}

uint64_t sub_222751068()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_222751078()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

long double partial apply for closure #1 in _jvpErf(_:)(double a1)
{
  return a1 * 1.12837917 * exp(-(*(double *)(v1 + 16) * *(double *)(v1 + 16)));
}

uint64_t sub_2227510C0()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2227510D0()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

long double partial apply for closure #1 in _jvpErfc(_:)(double a1)
{
  return a1 * -1.12837917 * exp(-(*(double *)(v1 + 16) * *(double *)(v1 + 16)));
}

uint64_t sub_222751118()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_222751128()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_222751138()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_222751148()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_222751158()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_222751168()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_222751178()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_222751188()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_222751198()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_2227511A8()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_2227511B8()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_2227511C8()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_2227511D8()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_2227511E8()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_2227511F8()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_222751208()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_222751218()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_222751228()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_222751238()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_222751248()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_222751258()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_222751268()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_222751278()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_222751288()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_222751298()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_2227512A8()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_2227512B8()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_2227512C8()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_2227512D8()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_2227512E8()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_2227512F8()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_222751308()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_222751318()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_222751328()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_222751338()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_222751348()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_222751358()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_222751368()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_222751378()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_222751388()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_222751398()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_2227513A8()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_2227513B8()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_2227513C8()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2227513D8()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2227513E8()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2227513F8()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_222751408()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_222751418()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_222751428()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_222751438()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_222751448()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_222751458()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_222751468()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_222751478()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_222751488()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_222751498()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2227514A8()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2227514B8()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2227514C8()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2227514D8()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2227514E8()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2227514F8()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_222751508()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_222751518()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_222751528()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_222751538()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_222751548()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_222751558()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_222751568()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_222751578()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_222751588()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_222751598()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2227515A8()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2227515B8()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2227515C8()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2227515D8()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2227515E8()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2227515F8()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_222751608()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_222751618()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_222751628()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_222751638()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_222751648()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_222751658()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_222751668()
{
  return MEMORY[0x270FA0238](v0, 28, 7);
}

uint64_t sub_22275167C()
{
  return MEMORY[0x270FA0238](v0, 28, 7);
}

float partial apply for closure #1 in _vjpPow(_:_:)(float a1)
{
  float v3 = *(float *)(v1 + 20);
  if (v3 > 0.0) {
    float v5 = *(float *)(v1 + 20);
  }
  else {
    float v5 = 1.0;
  }
  float v4 = *(float *)(v1 + 16);
  float v6 = (float)(v4 * a1) * powf(v3, v4 + -1.0);
  logf(v5);
  return v6;
}

uint64_t sub_2227516F0()
{
  return MEMORY[0x270FA0238](v0, 28, 7);
}

uint64_t sub_222751704()
{
  return MEMORY[0x270FA0238](v0, 28, 7);
}

float partial apply for closure #1 in _jvpPow(_:_:)(float a1, float a2)
{
  float v5 = v2[6];
  if (v2[5] > 0.0) {
    float v6 = v2[5];
  }
  else {
    float v6 = 1.0;
  }
  float v4 = v2[4];
  float v7 = (float)(v4 * a1) * powf(v2[5], v4 + -1.0);
  return v7 + (float)((float)(v5 * a2) * logf(v6));
}

uint64_t sub_22275177C()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_222751790()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

long double partial apply for closure #1 in _vjpPow(_:_:)(double a1)
{
  long double v3 = *(double *)(v1 + 24);
  if (v3 > 0.0) {
    double v5 = *(double *)(v1 + 24);
  }
  else {
    double v5 = 1.0;
  }
  double v4 = *(double *)(v1 + 16);
  long double v6 = v4 * a1 * pow(v3, v4 + -1.0);
  log(v5);
  return v6;
}

uint64_t sub_222751804()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_222751818()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

long double partial apply for closure #1 in _jvpPow(_:_:)(double a1, double a2)
{
  double v5 = v2[4];
  if (v2[3] > 0.0) {
    double v6 = v2[3];
  }
  else {
    double v6 = 1.0;
  }
  double v4 = v2[2];
  long double v7 = v4 * a1 * pow(v2[3], v4 + -1.0);
  return v7 + v5 * a2 * log(v6);
}

uint64_t sub_222751890()
{
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t partial apply for closure #1 in SIMD2<>._vjpSubscript(_:)(uint64_t a1)
{
  return partial apply for closure #1 in SIMD2<>._vjpSubscript(_:)(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))closure #1 in SIMD2<>._vjpSubscript(_:));
}

uint64_t sub_2227518B8()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_2227518F0()
{
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t partial apply for closure #1 in SIMD2<>._jvpSubscript(index:)(uint64_t a1)
{
  return partial apply for closure #1 in SIMD2<>._vjpSubscript(_:)(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))closure #1 in SIMD2<>._jvpSubscript(index:));
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed SIMD2<A>) -> (@out A)()
{
  return (*(uint64_t (**)(void))(v0 + 48))();
}

uint64_t sub_222751940()
{
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t partial apply for closure #1 in SIMD2<>._vjpSubscriptSetter(_:_:)(uint64_t a1)
{
  return partial apply for closure #1 in SIMD2<>._vjpSubscriptSetter(_:_:)(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))closure #1 in SIMD2<>._vjpSubscriptSetter(_:_:));
}

uint64_t sub_222751968()
{
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t partial apply for closure #1 in SIMD4<>._vjpSubscript(_:)(uint64_t a1)
{
  return partial apply for closure #1 in SIMD2<>._vjpSubscript(_:)(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))closure #1 in SIMD4<>._vjpSubscript(_:));
}

uint64_t sub_222751990()
{
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t partial apply for closure #1 in SIMD4<>._jvpSubscript(index:)(uint64_t a1)
{
  return partial apply for closure #1 in SIMD2<>._vjpSubscript(_:)(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))closure #1 in SIMD4<>._jvpSubscript(index:));
}

uint64_t sub_2227519B8()
{
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t partial apply for closure #1 in SIMD4<>._vjpSubscriptSetter(_:_:)(uint64_t a1)
{
  return partial apply for closure #1 in SIMD2<>._vjpSubscriptSetter(_:_:)(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))closure #1 in SIMD4<>._vjpSubscriptSetter(_:_:));
}

uint64_t sub_2227519E0()
{
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t partial apply for closure #1 in SIMD8<>._vjpSubscript(_:)(uint64_t a1)
{
  return partial apply for closure #1 in SIMD2<>._vjpSubscript(_:)(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))closure #1 in SIMD8<>._vjpSubscript(_:));
}

uint64_t sub_222751A08()
{
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t partial apply for closure #1 in SIMD8<>._jvpSubscript(index:)(uint64_t a1)
{
  return partial apply for closure #1 in SIMD2<>._vjpSubscript(_:)(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))closure #1 in SIMD8<>._jvpSubscript(index:));
}

uint64_t sub_222751A30()
{
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t partial apply for closure #1 in SIMD8<>._vjpSubscriptSetter(_:_:)(uint64_t a1)
{
  return partial apply for closure #1 in SIMD2<>._vjpSubscriptSetter(_:_:)(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))closure #1 in SIMD8<>._vjpSubscriptSetter(_:_:));
}

uint64_t sub_222751A58()
{
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t partial apply for closure #1 in SIMD16<>._vjpSubscript(_:)(uint64_t a1)
{
  return partial apply for closure #1 in SIMD2<>._vjpSubscript(_:)(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))closure #1 in SIMD16<>._vjpSubscript(_:));
}

uint64_t sub_222751A80()
{
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t partial apply for closure #1 in SIMD16<>._jvpSubscript(index:)(uint64_t a1)
{
  return partial apply for closure #1 in SIMD2<>._vjpSubscript(_:)(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))closure #1 in SIMD16<>._jvpSubscript(index:));
}

uint64_t sub_222751AA8()
{
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t partial apply for closure #1 in SIMD16<>._vjpSubscriptSetter(_:_:)(uint64_t a1)
{
  return partial apply for closure #1 in SIMD2<>._vjpSubscriptSetter(_:_:)(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))closure #1 in SIMD16<>._vjpSubscriptSetter(_:_:));
}

uint64_t sub_222751AD0()
{
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t partial apply for closure #1 in SIMD32<>._vjpSubscript(_:)(uint64_t a1)
{
  return partial apply for closure #1 in SIMD2<>._vjpSubscript(_:)(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))closure #1 in SIMD32<>._vjpSubscript(_:));
}

uint64_t sub_222751AF8()
{
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t partial apply for closure #1 in SIMD32<>._jvpSubscript(index:)(uint64_t a1)
{
  return partial apply for closure #1 in SIMD2<>._vjpSubscript(_:)(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))closure #1 in SIMD32<>._jvpSubscript(index:));
}

uint64_t sub_222751B20()
{
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t partial apply for closure #1 in SIMD32<>._vjpSubscriptSetter(_:_:)(uint64_t a1)
{
  return partial apply for closure #1 in SIMD2<>._vjpSubscriptSetter(_:_:)(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))closure #1 in SIMD32<>._vjpSubscriptSetter(_:_:));
}

uint64_t sub_222751B48()
{
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t partial apply for closure #1 in SIMD64<>._vjpSubscript(_:)(uint64_t a1)
{
  return partial apply for closure #1 in SIMD2<>._vjpSubscript(_:)(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))closure #1 in SIMD64<>._vjpSubscript(_:));
}

uint64_t sub_222751B70()
{
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t partial apply for closure #1 in SIMD64<>._jvpSubscript(index:)(uint64_t a1)
{
  return partial apply for closure #1 in SIMD2<>._vjpSubscript(_:)(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))closure #1 in SIMD64<>._jvpSubscript(index:));
}

uint64_t sub_222751B98()
{
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t partial apply for closure #1 in SIMD64<>._vjpSubscriptSetter(_:_:)(uint64_t a1)
{
  return partial apply for closure #1 in SIMD2<>._vjpSubscriptSetter(_:_:)(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))closure #1 in SIMD64<>._vjpSubscriptSetter(_:_:));
}

uint64_t sub_222751BC0()
{
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t partial apply for closure #1 in SIMD3<>._vjpSubscript(_:)(uint64_t a1)
{
  return partial apply for closure #1 in SIMD2<>._vjpSubscript(_:)(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))closure #1 in SIMD3<>._vjpSubscript(_:));
}

uint64_t sub_222751BE8()
{
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t partial apply for closure #1 in SIMD3<>._jvpSubscript(index:)(uint64_t a1)
{
  return partial apply for closure #1 in SIMD2<>._vjpSubscript(_:)(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))closure #1 in SIMD3<>._jvpSubscript(index:));
}

uint64_t partial apply for closure #1 in SIMD2<>._vjpSubscript(_:)(uint64_t a1, uint64_t (*a2)(uint64_t, void, void, void, void, void))
{
  return a2(a1, v2[6], v2[2], v2[3], v2[4], v2[5]);
}

uint64_t sub_222751C28()
{
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t partial apply for closure #1 in SIMD3<>._vjpSubscriptSetter(_:_:)(uint64_t a1)
{
  return partial apply for closure #1 in SIMD2<>._vjpSubscriptSetter(_:_:)(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))closure #1 in SIMD3<>._vjpSubscriptSetter(_:_:));
}

uint64_t partial apply for closure #1 in SIMD2<>._vjpSubscriptSetter(_:_:)(uint64_t a1, uint64_t (*a2)(uint64_t, void, void, void, void, void))
{
  return a2(a1, v2[6], v2[2], v2[3], v2[4], v2[5]);
}

uint64_t sub_222751C68()
{
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t partial apply for closure #1 in static SIMD<>._vjpAdd(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t, uint64_t))v8)((void *)(AssociatedTypeWitness - 8), a1, a3, AssociatedTypeWitness);

  return v8(a2, a3, AssociatedTypeWitness);
}

{
  return partial apply for closure #1 in static SIMD<>._vjpAdd(lhs:rhs:)(a1, a2, a3, closure #1 in static SIMD<>._vjpAdd(lhs:rhs:));
}

{
  return partial apply for closure #1 in static SIMD<>._vjpAdd(lhs:rhs:)(a1, a2, a3, closure #1 in static SIMD<>._vjpAdd(lhs:rhs:));
}

uint64_t sub_222751D38()
{
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t partial apply for closure #1 in static SIMD<>._jvpAdd(lhs:rhs:)(uint64_t a1, uint64_t a2)
{
  return partial apply for closure #1 in static SIMD<>._jvpAdd(lhs:rhs:)(a1, a2, MEMORY[0x263F8DF20]);
}

{
  return partial apply for closure #1 in static SIMD<>._jvpAdd(lhs:rhs:)(a1, a2, MEMORY[0x263F8DF20], (uint64_t (*)(uint64_t, uint64_t, void, void, void, void, void, void, void, uint64_t))closure #1 in static SIMD<>._jvpAdd(lhs:rhs:));
}

{
  return partial apply for closure #1 in static SIMD<>._jvpAdd(lhs:rhs:)(a1, a2, MEMORY[0x263F8DF20], (uint64_t (*)(uint64_t, uint64_t, void, void, void, void, void, void, void, uint64_t))closure #1 in static SIMD<>._jvpAdd(lhs:rhs:));
}

uint64_t sub_222751D60()
{
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t partial apply for closure #1 in static SIMD<>._vjpSubtract(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return closure #1 in static SIMD<>._vjpSubtract(lhs:rhs:)(a1, a2, a3, v3[2], v3[3], v3[4], v3[5], v3[6], v3[7]);
}

{
  return partial apply for closure #1 in static SIMD<>._vjpAdd(lhs:rhs:)(a1, a2, a3, closure #1 in static SIMD<>._vjpSubtract(lhs:rhs:));
}

{
  return partial apply for closure #1 in static SIMD<>._vjpAdd(lhs:rhs:)(a1, a2, a3, closure #1 in static SIMD<>._vjpSubtract(lhs:rhs:));
}

uint64_t sub_222751DA0()
{
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t partial apply for closure #1 in static SIMD<>._jvpSubtract(lhs:rhs:)(uint64_t a1, uint64_t a2)
{
  return partial apply for closure #1 in static SIMD<>._jvpAdd(lhs:rhs:)(a1, a2, MEMORY[0x263F8DF28]);
}

{
  return partial apply for closure #1 in static SIMD<>._jvpAdd(lhs:rhs:)(a1, a2, MEMORY[0x263F8DF28], (uint64_t (*)(uint64_t, uint64_t, void, void, void, void, void, void, void, uint64_t))closure #1 in static SIMD<>._jvpAdd(lhs:rhs:));
}

{
  return partial apply for closure #1 in static SIMD<>._jvpAdd(lhs:rhs:)(a1, a2, MEMORY[0x263F8DF28], (uint64_t (*)(uint64_t, uint64_t, void, void, void, void, void, void, void, uint64_t))closure #1 in static SIMD<>._jvpAdd(lhs:rhs:));
}

uint64_t partial apply for closure #1 in static SIMD<>._jvpAdd(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  return closure #1 in static SIMD<>._jvpAdd(lhs:rhs:)(a1, a2, v3[2], v3[3], v3[4], v3[5], v3[6], v3[7], a3);
}

uint64_t sub_222751DFC()
{
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_222751E10()
{
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t partial apply for closure #1 in static SIMD<>._vjpNegate(rhs:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return closure #1 in static SIMD<>._vjpNegate(rhs:)(a1, *(void *)(v2 + 48), *(void *)(v2 + 56), a2);
}

uint64_t partial apply for closure #1 in static SIMD<>._vjpMultiply(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return partial apply for closure #1 in static SIMD<>._vjpMultiply(lhs:rhs:)(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))closure #1 in static SIMD<>._vjpMultiply(lhs:rhs:));
}

{
  return partial apply for closure #1 in static SIMD<>._vjpMultiply(lhs:rhs:)(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t, char *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))closure #1 in static SIMD<>._vjpMultiply(lhs:rhs:));
}

{
  return partial apply for closure #1 in static SIMD<>._vjpMultiply(lhs:rhs:)(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t, char *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))closure #1 in static SIMD<>._vjpMultiply(lhs:rhs:));
}

uint64_t partial apply for closure #1 in static SIMD<>._jvpMultiply(lhs:rhs:)(uint64_t a1, uint64_t a2)
{
  return partial apply for closure #1 in static SIMD<>._jvpMultiply(lhs:rhs:)(a1, a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))closure #1 in static SIMD<>._jvpMultiply(lhs:rhs:));
}

{
  return partial apply for closure #1 in static SIMD<>._jvpMultiply(lhs:rhs:)(a1, a2, (uint64_t (*)(uint64_t, uint64_t, char *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))closure #1 in static SIMD<>._jvpMultiply(lhs:rhs:));
}

{
  return partial apply for closure #1 in static SIMD<>._jvpDivide(lhs:rhs:)(a1, a2, (uint64_t (*)(uint64_t, uint64_t, char *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))closure #1 in static SIMD<>._jvpMultiply(lhs:rhs:));
}

uint64_t partial apply for closure #1 in static SIMD<>._vjpDivide(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return partial apply for closure #1 in static SIMD<>._vjpMultiply(lhs:rhs:)(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))closure #1 in static SIMD<>._vjpDivide(lhs:rhs:));
}

{
  return partial apply for closure #1 in static SIMD<>._vjpMultiply(lhs:rhs:)(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t, char *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))closure #1 in static SIMD<>._vjpDivide(lhs:rhs:));
}

{
  return partial apply for closure #1 in static SIMD<>._vjpMultiply(lhs:rhs:)(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t, char *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))closure #1 in static SIMD<>._vjpDivide(lhs:rhs:));
}

uint64_t partial apply for closure #1 in static SIMD<>._vjpMultiply(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v5 = *(unsigned __int8 *)(*(void *)(*(void *)(v4 + 16) - 8) + 80);
  return a4(a1, a2, a3, v4 + ((v5 + 48) & ~v5), v4 + ((*(void *)(*(void *)(*(void *)(v4 + 16) - 8) + 64) + v5 + ((v5 + 48) & ~v5)) & ~v5));
}

uint64_t objectdestroy_1189Tm()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v1 - 8);
  long double v3 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  uint64_t v4 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = (v4 + 48) & ~v4;
  uint64_t v6 = *(void *)(v2 + 64);
  uint64_t v7 = v4 | 7;
  uint64_t v8 = (v6 + v4 + v5) & ~v4;
  uint64_t v9 = v8 + v6;
  v3(v0 + v5, v1);
  v3(v0 + v8, v1);

  return MEMORY[0x270FA0238](v0, v9, v7);
}

uint64_t partial apply for closure #1 in static SIMD<>._jvpDivide(lhs:rhs:)(uint64_t a1, uint64_t a2)
{
  return partial apply for closure #1 in static SIMD<>._jvpMultiply(lhs:rhs:)(a1, a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))closure #1 in static SIMD<>._jvpDivide(lhs:rhs:));
}

{
  return partial apply for closure #1 in static SIMD<>._jvpDivide(lhs:rhs:)(a1, a2, (uint64_t (*)(uint64_t, uint64_t, char *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))closure #1 in static SIMD<>._jvpDivide(lhs:rhs:));
}

{
  return partial apply for closure #1 in static SIMD<>._jvpMultiply(lhs:rhs:)(a1, a2, (uint64_t (*)(uint64_t, uint64_t, char *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))closure #1 in static SIMD<>._jvpDivide(lhs:rhs:));
}

uint64_t partial apply for closure #1 in static SIMD<>._jvpMultiply(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v4 = *(void *)(*(void *)(v3 + 16) - 8);
  uint64_t v5 = *(unsigned __int8 *)(v4 + 80);
  return a3(a1, a2, v3 + ((v5 + 48) & ~v5), v3 + ((*(void *)(v4 + 64) + v5 + ((v5 + 48) & ~v5)) & ~v5));
}

uint64_t sub_222752078()
{
  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_2227520A0()
{
  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_2227520DC()
{
  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_222752104()
{
  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t partial apply for closure #1 in static SIMD<>._jvpAdd(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, void, void, void, void, void, void, void, uint64_t))
{
  return a4(a1, a2, v4[2], v4[3], v4[4], v4[5], v4[6], v4[7], v4[8], a3);
}

uint64_t sub_222752180()
{
  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_2227521A8()
{
  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_2227521E4()
{
  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t partial apply for closure #1 in static SIMD<>._vjpAdd(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, void, void, void, void, void, void, void))
{
  return a4(a1, a2, a3, v4[2], v4[3], v4[4], v4[5], v4[6], v4[7], v4[8]);
}

uint64_t sub_222752248()
{
  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t partial apply for closure #1 in static SIMD<>._vjpMultiply(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, char *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v9 = *((void *)v4 + 2);
  uint64_t v10 = *((void *)v4 + 3);
  uint64_t v11 = *((void *)v4 + 4);
  uint64_t v12 = *((void *)v4 + 5);
  uint64_t v13 = *((void *)v4 + 6);
  uint64_t v14 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unint64_t v15 = (*(unsigned __int8 *)(v14 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  return a4(a1, a2, a3, &v4[v15], &v4[(v15 + *(void *)(v14 + 64) + *(unsigned __int8 *)(*(void *)(v9 - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v9 - 8) + 80)], v9, v10, v11, v12, v13);
}

{
  char *v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;

  uint64_t v7 = *((void *)v4 + 2);
  uint64_t v8 = *((void *)v4 + 3);
  uint64_t v9 = *((void *)v4 + 4);
  uint64_t v10 = *((void *)v4 + 5);
  uint64_t v11 = *((void *)v4 + 6);
  uint64_t v12 = (*(unsigned __int8 *)(*(void *)(v7 - 8) + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v7 - 8) + 80);
  uint64_t v13 = v12 + *(void *)(*(void *)(v7 - 8) + 64);
  uint64_t v14 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  return a4(a1, a2, a3, &v4[v12], &v4[(v13 + *(unsigned __int8 *)(v14 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80)], v7, v8, v9, v10, v11);
}

uint64_t objectdestroy_1225Tm()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v3 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 56) & ~v4;
  uint64_t v6 = *(void *)(v1 - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = (v5 + *(void *)(v3 + 64) + v7) & ~v7;
  uint64_t v9 = v8 + *(void *)(v6 + 64);
  uint64_t v10 = v4 | v7 | 7;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v5, AssociatedTypeWitness);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v8, v1);

  return MEMORY[0x270FA0238](v0, v9, v10);
}

uint64_t partial apply for closure #1 in static SIMD<>._jvpDivide(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, char *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v7 = *((void *)v3 + 2);
  uint64_t v8 = *((void *)v3 + 3);
  uint64_t v9 = *((void *)v3 + 4);
  uint64_t v10 = *((void *)v3 + 5);
  uint64_t v11 = *((void *)v3 + 6);
  uint64_t v12 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unint64_t v13 = (*(unsigned __int8 *)(v12 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  return a3(a1, a2, &v3[v13], &v3[(v13 + *(void *)(v12 + 64) + *(unsigned __int8 *)(*(void *)(v7 - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v7 - 8) + 80)], v7, v8, v9, v10, v11);
}

uint64_t objectdestroy_1228Tm()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 56) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v5 + v8) & ~v8;
  uint64_t v10 = v9 + *(void *)(v7 + 64);
  uint64_t v11 = v3 | v8 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, AssociatedTypeWitness);

  return MEMORY[0x270FA0238](v0, v10, v11);
}

uint64_t partial apply for closure #1 in static SIMD<>._jvpMultiply(lhs:rhs:)(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, char *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v5 = *((void *)v3 + 2);
  uint64_t v6 = *((void *)v3 + 3);
  uint64_t v7 = *((void *)v3 + 4);
  uint64_t v8 = *((void *)v3 + 5);
  uint64_t v9 = *((void *)v3 + 6);
  unint64_t v10 = (*(unsigned __int8 *)(*(void *)(v5 - 8) + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v5 - 8) + 80);
  unint64_t v11 = v10 + *(void *)(*(void *)(v5 - 8) + 64);
  uint64_t v12 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  return a3(a1, a2, &v3[v10], &v3[(v11 + *(unsigned __int8 *)(v12 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80)], v5, v6, v7, v8, v9);
}

uint64_t sub_222752AA0()
{
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t partial apply for closure #1 in static SIMD<>._vjpInit(repeating:)@<X0>(uint64_t a1@<X8>)
{
  return SIMD<>.sum()(*(void *)(v1 + 16), *(void *)(*(void *)(v1 + 40) + 16), a1);
}

uint64_t sub_222752AE4()
{
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t partial apply for closure #1 in static SIMD<>._jvpInit(repeating:)@<X0>(uint64_t a1@<X8>)
{
  return closure #1 in static SIMD<>._jvpInit(repeating:)(*(void *)(v1 + 16), a1);
}

uint64_t sub_222752B04()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A.SIMDStorage.Scalar) -> (@out A)(uint64_t a1)
{
  (*(void (**)(void))(v1 + 56))();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 8);

  return v4(a1, AssociatedTypeWitness);
}

unint64_t lazy protocol witness table accessor for type AnyDerivative and conformance AnyDerivative()
{
  unint64_t result = lazy protocol witness table cache variable for type AnyDerivative and conformance AnyDerivative;
  if (!lazy protocol witness table cache variable for type AnyDerivative and conformance AnyDerivative)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AnyDerivative and conformance AnyDerivative);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AnyDerivative and conformance AnyDerivative;
  if (!lazy protocol witness table cache variable for type AnyDerivative and conformance AnyDerivative)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AnyDerivative and conformance AnyDerivative);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AnyDerivative and conformance AnyDerivative;
  if (!lazy protocol witness table cache variable for type AnyDerivative and conformance AnyDerivative)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AnyDerivative and conformance AnyDerivative);
  }
  return result;
}

uint64_t associated type witness table accessor for Differentiable.TangentVector : AdditiveArithmetic in [A]<A>.DifferentiableView()
{
  return swift_getWitnessTable();
}

uint64_t associated type witness table accessor for Differentiable.TangentVector : Differentiable in [A]<A>.DifferentiableView()
{
  return swift_getWitnessTable();
}

uint64_t base witness table accessor for Equatable in <> [A]<A>.DifferentiableView()
{
  return swift_getWitnessTable();
}

uint64_t associated type witness table accessor for Differentiable.TangentVector : AdditiveArithmetic in <A> [A]()
{
  return swift_getWitnessTable();
}

uint64_t associated type witness table accessor for Differentiable.TangentVector : AdditiveArithmetic in A?<A>.TangentVector()
{
  return swift_getWitnessTable();
}

uint64_t associated type witness table accessor for Differentiable.TangentVector : Differentiable in A?<A>.TangentVector()
{
  return swift_getWitnessTable();
}

uint64_t base witness table accessor for Equatable in A?<A>.TangentVector()
{
  return swift_getWitnessTable();
}

uint64_t associated type witness table accessor for Differentiable.TangentVector : AdditiveArithmetic in Float16()
{
  return MEMORY[0x263F8EA10];
}

_UNKNOWN **associated type witness table accessor for Differentiable.TangentVector : Differentiable in Float16()
{
  return &protocol witness table for Float16;
}

uint64_t associated type witness table accessor for Differentiable.TangentVector : AdditiveArithmetic in Float()
{
  return MEMORY[0x263F8D628];
}

_UNKNOWN **associated type witness table accessor for Differentiable.TangentVector : Differentiable in Float()
{
  return &protocol witness table for Float;
}

uint64_t associated type witness table accessor for Differentiable.TangentVector : AdditiveArithmetic in Double()
{
  return MEMORY[0x263F8D598];
}

_UNKNOWN **associated type witness table accessor for Differentiable.TangentVector : Differentiable in Double()
{
  return &protocol witness table for Double;
}

uint64_t base witness table accessor for Equatable in <> SIMD2<A>()
{
  return swift_getWitnessTable();
}

uint64_t associated type witness table accessor for Differentiable.TangentVector : AdditiveArithmetic in <> SIMD2<A>()
{
  return swift_getWitnessTable();
}

uint64_t associated type witness table accessor for Differentiable.TangentVector : Differentiable in <> SIMD2<A>()
{
  return associated type witness table accessor for Differentiable.TangentVector : Differentiable in <> SIMD2<A>();
}

{
  return swift_getWitnessTable();
}

uint64_t base witness table accessor for Equatable in <> SIMD4<A>()
{
  return swift_getWitnessTable();
}

uint64_t associated type witness table accessor for Differentiable.TangentVector : AdditiveArithmetic in <> SIMD4<A>()
{
  return swift_getWitnessTable();
}

uint64_t associated type witness table accessor for Differentiable.TangentVector : Differentiable in <> SIMD4<A>()
{
  return associated type witness table accessor for Differentiable.TangentVector : Differentiable in <> SIMD2<A>();
}

uint64_t base witness table accessor for Equatable in <> SIMD8<A>()
{
  return swift_getWitnessTable();
}

uint64_t associated type witness table accessor for Differentiable.TangentVector : AdditiveArithmetic in <> SIMD8<A>()
{
  return swift_getWitnessTable();
}

uint64_t associated type witness table accessor for Differentiable.TangentVector : Differentiable in <> SIMD8<A>()
{
  return associated type witness table accessor for Differentiable.TangentVector : Differentiable in <> SIMD2<A>();
}

uint64_t base witness table accessor for Equatable in <> SIMD16<A>()
{
  return swift_getWitnessTable();
}

uint64_t associated type witness table accessor for Differentiable.TangentVector : AdditiveArithmetic in <> SIMD16<A>()
{
  return swift_getWitnessTable();
}

uint64_t associated type witness table accessor for Differentiable.TangentVector : Differentiable in <> SIMD16<A>()
{
  return associated type witness table accessor for Differentiable.TangentVector : Differentiable in <> SIMD2<A>();
}

uint64_t base witness table accessor for Equatable in <> SIMD32<A>()
{
  return swift_getWitnessTable();
}

uint64_t associated type witness table accessor for Differentiable.TangentVector : AdditiveArithmetic in <> SIMD32<A>()
{
  return swift_getWitnessTable();
}

uint64_t associated type witness table accessor for Differentiable.TangentVector : Differentiable in <> SIMD32<A>()
{
  return associated type witness table accessor for Differentiable.TangentVector : Differentiable in <> SIMD2<A>();
}

uint64_t base witness table accessor for Equatable in <> SIMD64<A>()
{
  return swift_getWitnessTable();
}

uint64_t associated type witness table accessor for Differentiable.TangentVector : AdditiveArithmetic in <> SIMD64<A>()
{
  return swift_getWitnessTable();
}

uint64_t associated type witness table accessor for Differentiable.TangentVector : Differentiable in <> SIMD64<A>()
{
  return associated type witness table accessor for Differentiable.TangentVector : Differentiable in <> SIMD2<A>();
}

uint64_t base witness table accessor for Equatable in <> SIMD3<A>()
{
  return swift_getWitnessTable();
}

uint64_t associated type witness table accessor for Differentiable.TangentVector : AdditiveArithmetic in <> SIMD3<A>()
{
  return swift_getWitnessTable();
}

uint64_t associated type witness table accessor for Differentiable.TangentVector : Differentiable in <> SIMD3<A>()
{
  return associated type witness table accessor for Differentiable.TangentVector : Differentiable in <> SIMD2<A>();
}

uint64_t sub_2227532FC()
{
  return 16;
}

__n128 sub_222753308(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t dispatch thunk of Differentiable.move(by:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t *assignWithCopy for AnyDifferentiable(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

ValueMetadata *type metadata accessor for AnyDifferentiable()
{
  return &type metadata for AnyDifferentiable;
}

uint64_t dispatch thunk of _AnyDerivativeBox._isEqual(to:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of _AnyDerivativeBox._isNotEqual(to:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of static _AnyDerivativeBox._zero.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of _AnyDerivativeBox._adding(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of _AnyDerivativeBox._subtracting(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of _AnyDerivativeBox._move(by:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of _AnyDerivativeBox._typeErasedBase.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of _AnyDerivativeBox._unboxed<A>(to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 64))();
}

uint64_t type metadata instantiation function for _ConcreteDerivativeBox(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

uint64_t initializeBufferWithCopyOfBuffer for AnyDerivative(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t initializeWithCopy for AnyDifferentiable(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t assignWithTake for AnyDerivative(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for AnyDifferentiable(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AnyDifferentiable(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
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
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AnyDerivative()
{
  return &type metadata for AnyDerivative;
}

ValueMetadata *type metadata accessor for AnyDerivative.OpaqueZero()
{
  return &type metadata for AnyDerivative.OpaqueZero;
}

uint64_t type metadata completion function for Optional<A>.TangentVector()
{
  swift_getAssociatedTypeWitness();
  uint64_t result = type metadata accessor for Optional();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for Optional<A>.TangentVector(uint64_t *a1, uint64_t *a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  if (*(_DWORD *)(v5 + 84)) {
    size_t v6 = *(void *)(v5 + 64);
  }
  else {
    size_t v6 = *(void *)(v5 + 64) + 1;
  }
  uint64_t v7 = *(_DWORD *)(v5 + 80);
  if (v7 > 7 || (*(_DWORD *)(v5 + 80) & 0x100000) != 0 || v6 > 0x18)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v7 + 16) & ~v7));
    swift_retain();
  }
  else
  {
    uint64_t v11 = AssociatedTypeWitness;
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v5 + 48))(a2, 1, AssociatedTypeWitness))
    {
      memcpy(a1, a2, v6);
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v5 + 16))(a1, a2, v11);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v11);
    }
  }
  return a1;
}

uint64_t destroy for Optional<A>.TangentVector(uint64_t a1)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, AssociatedTypeWitness);
  if (!result)
  {
    long long v4 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
    return v4(a1, AssociatedTypeWitness);
  }
  return result;
}

void *initializeWithCopy for Optional<A>.TangentVector(void *a1, const void *a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(a2, 1, AssociatedTypeWitness))
  {
    if (*(_DWORD *)(v5 + 84)) {
      size_t v6 = *(void *)(v5 + 64);
    }
    else {
      size_t v6 = *(void *)(v5 + 64) + 1;
    }
    memcpy(a1, a2, v6);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, AssociatedTypeWitness);
  }
  return a1;
}

void *assignWithCopy for Optional<A>.TangentVector(void *a1, void *a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  size_t v6 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  int v7 = v6(a1, 1, AssociatedTypeWitness);
  int v8 = v6(a2, 1, AssociatedTypeWitness);
  if (v7)
  {
    if (!v8)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, AssociatedTypeWitness);
      return a1;
    }
    int v9 = *(_DWORD *)(v5 + 84);
    size_t v10 = *(void *)(v5 + 64);
  }
  else
  {
    if (!v8)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 24))(a1, a2, AssociatedTypeWitness);
      return a1;
    }
    uint64_t v12 = *(void (**)(void *, uint64_t))(v5 + 8);
    uint64_t v11 = v5 + 8;
    v12(a1, AssociatedTypeWitness);
    int v9 = *(_DWORD *)(v11 + 76);
    size_t v10 = *(void *)(v11 + 56);
  }
  if (v9) {
    size_t v13 = v10;
  }
  else {
    size_t v13 = v10 + 1;
  }
  memcpy(a1, a2, v13);
  return a1;
}

void *initializeWithTake for Optional<A>.TangentVector(void *a1, const void *a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(a2, 1, AssociatedTypeWitness))
  {
    if (*(_DWORD *)(v5 + 84)) {
      size_t v6 = *(void *)(v5 + 64);
    }
    else {
      size_t v6 = *(void *)(v5 + 64) + 1;
    }
    memcpy(a1, a2, v6);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 32))(a1, a2, AssociatedTypeWitness);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, AssociatedTypeWitness);
  }
  return a1;
}

void *assignWithTake for Optional<A>.TangentVector(void *a1, void *a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  size_t v6 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  int v7 = v6(a1, 1, AssociatedTypeWitness);
  int v8 = v6(a2, 1, AssociatedTypeWitness);
  if (v7)
  {
    if (!v8)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 32))(a1, a2, AssociatedTypeWitness);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, AssociatedTypeWitness);
      return a1;
    }
    int v9 = *(_DWORD *)(v5 + 84);
    size_t v10 = *(void *)(v5 + 64);
  }
  else
  {
    if (!v8)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 40))(a1, a2, AssociatedTypeWitness);
      return a1;
    }
    uint64_t v12 = *(void (**)(void *, uint64_t))(v5 + 8);
    uint64_t v11 = v5 + 8;
    v12(a1, AssociatedTypeWitness);
    int v9 = *(_DWORD *)(v11 + 76);
    size_t v10 = *(void *)(v11 + 56);
  }
  if (v9) {
    size_t v13 = v10;
  }
  else {
    size_t v13 = v10 + 1;
  }
  memcpy(a1, a2, v13);
  return a1;
}

uint64_t getEnumTagSinglePayload for Optional<A>.TangentVector(unsigned __int16 *a1, unsigned int a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  unsigned int v6 = *(_DWORD *)(v5 + 84);
  unsigned int v7 = v6 - 1;
  if (!v6) {
    unsigned int v7 = 0;
  }
  uint64_t v8 = *(void *)(*(void *)(AssociatedTypeWitness - 8) + 64);
  if (!v6) {
    ++v8;
  }
  if (!a2) {
    return 0;
  }
  if (a2 > v7)
  {
    char v9 = 8 * v8;
    if (v8 > 3) {
      goto LABEL_8;
    }
    unsigned int v11 = ((a2 - v7 + ~(-1 << v9)) >> v9) + 1;
    if (HIWORD(v11))
    {
      int v10 = *(_DWORD *)((char *)a1 + v8);
      if (v10) {
        goto LABEL_15;
      }
    }
    else
    {
      if (v11 <= 0xFF)
      {
        if (v11 < 2) {
          goto LABEL_23;
        }
LABEL_8:
        int v10 = *((unsigned __int8 *)a1 + v8);
        if (!*((unsigned char *)a1 + v8)) {
          goto LABEL_23;
        }
LABEL_15:
        int v12 = (v10 - 1) << v9;
        if (v8 > 3) {
          int v12 = 0;
        }
        if (v8)
        {
          if (v8 > 3) {
            LODWORD(v8) = 4;
          }
          switch((int)v8)
          {
            case 2:
              LODWORD(v8) = *a1;
              break;
            case 3:
              LODWORD(v8) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
              break;
            case 4:
              LODWORD(v8) = *(_DWORD *)a1;
              break;
            default:
              LODWORD(v8) = *(unsigned __int8 *)a1;
              break;
          }
        }
        return v7 + (v8 | v12) + 1;
      }
      int v10 = *(unsigned __int16 *)((char *)a1 + v8);
      if (*(unsigned __int16 *)((char *)a1 + v8)) {
        goto LABEL_15;
      }
    }
  }
LABEL_23:
  if (v6 < 2) {
    return 0;
  }
  unsigned int v14 = (*(uint64_t (**)(unsigned __int16 *))(v5 + 48))(a1);
  if (v14 >= 2) {
    return v14 - 1;
  }
  else {
    return 0;
  }
}

void storeEnumTagSinglePayload for Optional<A>.TangentVector(unsigned char *a1, unsigned int a2, unsigned int a3)
{
  int v6 = 0;
  uint64_t v7 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unsigned int v8 = *(_DWORD *)(v7 + 84);
  unsigned int v9 = v8 - 1;
  if (v8)
  {
    size_t v10 = *(void *)(v7 + 64);
  }
  else
  {
    unsigned int v9 = 0;
    size_t v10 = *(void *)(v7 + 64) + 1;
  }
  if (a3 <= v9) {
    goto LABEL_12;
  }
  if (v10 <= 3)
  {
    unsigned int v11 = ((a3 - v9 + ~(-1 << (8 * v10))) >> (8 * v10)) + 1;
    if (HIWORD(v11))
    {
      int v6 = 4;
      if (v9 >= a2) {
        goto LABEL_20;
      }
      goto LABEL_13;
    }
    if (v11 >= 0x100) {
      int v6 = 2;
    }
    else {
      int v6 = v11 > 1;
    }
LABEL_12:
    if (v9 >= a2) {
      goto LABEL_20;
    }
    goto LABEL_13;
  }
  int v6 = 1;
  if (v9 >= a2)
  {
LABEL_20:
    switch(v6)
    {
      case 1:
        a1[v10] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_25;
      case 2:
        *(_WORD *)&a1[v10] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_25;
      case 3:
        goto LABEL_38;
      case 4:
        *(_DWORD *)&a1[v10] = 0;
        goto LABEL_24;
      default:
LABEL_24:
        if (a2)
        {
LABEL_25:
          if (v8 >= 2)
          {
            unint64_t v15 = *(void (**)(unsigned char *, void))(v7 + 56);
            v15(a1, a2 + 1);
          }
        }
        break;
    }
    return;
  }
LABEL_13:
  unsigned int v12 = ~v9 + a2;
  if (v10 < 4)
  {
    int v13 = (v12 >> (8 * v10)) + 1;
    if (v10)
    {
      int v14 = v12 & ~(-1 << (8 * v10));
      bzero(a1, v10);
      if (v10 == 3)
      {
        *(_WORD *)a1 = v14;
        a1[2] = BYTE2(v14);
      }
      else if (v10 == 2)
      {
        *(_WORD *)a1 = v14;
      }
      else
      {
        *a1 = v14;
      }
    }
  }
  else
  {
    bzero(a1, v10);
    *(_DWORD *)a1 = v12;
    int v13 = 1;
  }
  switch(v6)
  {
    case 1:
      a1[v10] = v13;
      break;
    case 2:
      *(_WORD *)&a1[v10] = v13;
      break;
    case 3:
LABEL_38:
      __break(1u);
      JUMPOUT(0x2227541A8);
    case 4:
      *(_DWORD *)&a1[v10] = v13;
      break;
    default:
      return;
  }
}

uint64_t type metadata accessor for Optional<A>.TangentVector()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata completion function for _ConcreteDerivativeBox()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for _ConcreteDerivativeBox(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  long long v3 = a1;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = *(_DWORD *)(v4 + 80);
  if (v5 <= 7
    && *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 0x18uLL
    && (*(_DWORD *)(v4 + 80) & 0x100000) == 0)
  {
    (*(void (**)(uint64_t *))(v4 + 16))(a1);
  }
  else
  {
    uint64_t v8 = *a2;
    *long long v3 = *a2;
    long long v3 = (uint64_t *)(v8 + ((v5 + 16) & ~v5));
    swift_retain();
  }
  return v3;
}

uint64_t destroy for _ConcreteDerivativeBox(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
}

uint64_t initializeWithCopy for _ConcreteDerivativeBox(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t assignWithCopy for _ConcreteDerivativeBox(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t initializeWithTake for _ConcreteDerivativeBox(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t assignWithTake for _ConcreteDerivativeBox(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t getEnumTagSinglePayload for _ConcreteDerivativeBox(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(v4 + 64);
  if (!a2) {
    return 0;
  }
  unsigned int v7 = a2 - v5;
  if (a2 <= v5) {
    goto LABEL_19;
  }
  char v8 = 8 * v6;
  if (v6 <= 3)
  {
    unsigned int v10 = ((v7 + ~(-1 << v8)) >> v8) + 1;
    if (HIWORD(v10))
    {
      int v9 = *(_DWORD *)((char *)a1 + v6);
      if (!v9) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v10 > 0xFF)
    {
      int v9 = *(unsigned __int16 *)((char *)a1 + v6);
      if (!*(unsigned __int16 *)((char *)a1 + v6)) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v10 < 2)
    {
LABEL_19:
      if (v5) {
        return (*(uint64_t (**)(void))(v4 + 48))();
      }
      return 0;
    }
  }
  int v9 = *((unsigned __int8 *)a1 + v6);
  if (!*((unsigned char *)a1 + v6)) {
    goto LABEL_19;
  }
LABEL_11:
  int v11 = (v9 - 1) << v8;
  if (v6 > 3) {
    int v11 = 0;
  }
  if (v6)
  {
    if (v6 > 3) {
      LODWORD(v6) = 4;
    }
    switch((int)v6)
    {
      case 2:
        LODWORD(v6) = *a1;
        break;
      case 3:
        LODWORD(v6) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v6) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v6) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v5 + (v6 | v11) + 1;
}

void storeEnumTagSinglePayload for _ConcreteDerivativeBox(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  size_t v8 = *(void *)(v6 + 64);
  BOOL v9 = a3 >= v7;
  unsigned int v10 = a3 - v7;
  if (v10 != 0 && v9)
  {
    if (v8 <= 3)
    {
      unsigned int v14 = ((v10 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v14))
      {
        int v11 = 4;
      }
      else if (v14 >= 0x100)
      {
        int v11 = 2;
      }
      else
      {
        int v11 = v14 > 1;
      }
    }
    else
    {
      int v11 = 1;
    }
  }
  else
  {
    int v11 = 0;
  }
  if (v7 < a2)
  {
    unsigned int v12 = ~v7 + a2;
    if (v8 < 4)
    {
      int v13 = (v12 >> (8 * v8)) + 1;
      if (v8)
      {
        int v15 = v12 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if (v8 == 3)
        {
          *(_WORD *)a1 = v15;
          a1[2] = BYTE2(v15);
        }
        else if (v8 == 2)
        {
          *(_WORD *)a1 = v15;
        }
        else
        {
          *a1 = v15;
        }
      }
    }
    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v12;
      int v13 = 1;
    }
    switch(v11)
    {
      case 1:
        a1[v8] = v13;
        return;
      case 2:
        *(_WORD *)&a1[v8] = v13;
        return;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v8] = v13;
        return;
      default:
        return;
    }
  }
  switch(v11)
  {
    case 1:
      a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 2:
      *(_WORD *)&a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 3:
LABEL_34:
      __break(1u);
      JUMPOUT(0x222754810);
    case 4:
      *(_DWORD *)&a1[v8] = 0;
      goto LABEL_20;
    default:
LABEL_20:
      if (a2)
      {
LABEL_21:
        Swift::String v16 = *(void (**)(void))(v6 + 56);
        v16();
      }
      return;
  }
}

uint64_t outlined destroy of AnyDerivative(uint64_t a1)
{
  return a1;
}

uint64_t partial apply for closure #1 in differential #1 <A><A1>(_:) in Array<A>._jvpDifferentiableMap<A>(_:)(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t _s13TangentVector16_Differentiation14DifferentiablePQzxq_Ri_zRi0_zRi__Ri0__r0_lyAeaDQyd__Isegnr_AFIgngr_AE_xq_Ri_zRi0_zRi__Ri0__r0_lyAeFIsegnr_tAFs5NeverOIegnrzr_AbCRzAbCRd__r__lTRTA(uint64_t a1, uint64_t a2)
{
  return _s13TangentVector16_Differentiation14DifferentiablePQzxq_Ri_zRi0_zRi__Ri0__r0_lyAeaDQyd__Isegnr_AFIgngr_AE_xq_Ri_zRi0_zRi__Ri0__r0_lyAeFIsegnr_tAFs5NeverOIegnrzr_AbCRzAbCRd__r__lTRTATm(a1, a2, (uint64_t (*)(uint64_t, void, void, void, void, void, void, uint64_t))_s13TangentVector16_Differentiation14DifferentiablePQzxq_Ri_zRi0_zRi__Ri0__r0_lyAeaDQyd__Isegnr_AFIgngr_AE_xq_Ri_zRi0_zRi__Ri0__r0_lyAeFIsegnr_tAFs5NeverOIegnrzr_AbCRzAbCRd__r__lTR);
}

uint64_t _s13TangentVector16_Differentiation14DifferentiablePQyd__xq_Ri_zRi0_zRi__Ri0__r0_lyAeaDQzIsegnr_AFIgngr_AE_xq_Ri_zRi0_zRi__Ri0__r0_lyAeFIsegnr_tAFs5NeverOIegnrzr_AbCRzAbCRd__r__lTRTA(uint64_t a1, uint64_t a2)
{
  return _s13TangentVector16_Differentiation14DifferentiablePQzxq_Ri_zRi0_zRi__Ri0__r0_lyAeaDQyd__Isegnr_AFIgngr_AE_xq_Ri_zRi0_zRi__Ri0__r0_lyAeFIsegnr_tAFs5NeverOIegnrzr_AbCRzAbCRd__r__lTRTATm(a1, a2, (uint64_t (*)(uint64_t, void, void, void, void, void, void, uint64_t))_s13TangentVector16_Differentiation14DifferentiablePQyd__xq_Ri_zRi0_zRi__Ri0__r0_lyAeaDQzIsegnr_AFIgngr_AE_xq_Ri_zRi0_zRi__Ri0__r0_lyAeFIsegnr_tAFs5NeverOIegnrzr_AbCRzAbCRd__r__lTR);
}

uint64_t _s13TangentVector16_Differentiation14DifferentiablePQzxq_Ri_zRi0_zRi__Ri0__r0_lyAeaDQyd__Isegnr_AFIgngr_AE_xq_Ri_zRi0_zRi__Ri0__r0_lyAeFIsegnr_tAFs5NeverOIegnrzr_AbCRzAbCRd__r__lTRTATm(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, void, void, void, void, void, void, uint64_t))
{
  return a3(a1, v3[6], v3[7], v3[2], v3[3], v3[4], v3[5], a2);
}

uint64_t partial apply for implicit closure #1 in closure #1 in static Array<A>._vjpInit(repeating:count:)()
{
  return dispatch thunk of static AdditiveArithmetic.+ infix(_:_:)();
}

unint64_t lazy protocol witness table accessor for type PartialRangeFrom<Int> and conformance PartialRangeFrom<A>()
{
  unint64_t result = lazy protocol witness table cache variable for type PartialRangeFrom<Int> and conformance PartialRangeFrom<A>;
  if (!lazy protocol witness table cache variable for type PartialRangeFrom<Int> and conformance PartialRangeFrom<A>)
  {
    swift_getCanonicalSpecializedMetadata();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PartialRangeFrom<Int> and conformance PartialRangeFrom<A>);
  }
  return result;
}

uint64_t outlined init with copy of AnyDerivative(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a1 + 24);
  *(_OWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

void forward-mode derivative of static FloatingPoint.minimum(_:_:)()
{
}

uint64_t dispatch thunk of BinaryFloatingPoint.init<A>(_:)()
{
  return MEMORY[0x270F9D050]();
}

uint64_t dispatch thunk of FloatingPoint.squareRoot()()
{
  return MEMORY[0x270F9D230]();
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

uint64_t dispatch thunk of FloatingPoint.isNaN.getter()
{
  return MEMORY[0x270F9D2A8]();
}

uint64_t dispatch thunk of FloatingPoint.rounded(_:)()
{
  return MEMORY[0x270F9D2C8]();
}

uint64_t dispatch thunk of FloatingPoint.remainder(dividingBy:)()
{
  return MEMORY[0x270F9D2E8]();
}

uint64_t dispatch thunk of FloatingPoint.init(_:)()
{
  return MEMORY[0x270F9D2F0]();
}

uint64_t BidirectionalCollection.reversed()()
{
  return MEMORY[0x270F9D458]();
}

uint64_t dispatch thunk of static Comparable.> infix(_:_:)()
{
  return MEMORY[0x270F9D480]();
}

uint64_t dispatch thunk of static Comparable.<= infix(_:_:)()
{
  return MEMORY[0x270F9D498]();
}

uint64_t MutableCollection.subscript.getter()
{
  return MEMORY[0x270F9D4E8]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x270F9D598]();
}

uint64_t String.init<A>(reflecting:)()
{
  return MEMORY[0x270F9D600]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

uint64_t dispatch thunk of Sequence.makeIterator()()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t dispatch thunk of Sequence.underestimatedCount.getter()
{
  return MEMORY[0x270F9D908]();
}

uint64_t Sequence.reduce<A>(_:_:)()
{
  return MEMORY[0x270F9D9A8]();
}

uint64_t Sequence.reversed()()
{
  return MEMORY[0x270F9D9E0]();
}

uint64_t Array.description.getter()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t Array.customMirror.getter()
{
  return MEMORY[0x270F9DBC0]();
}

uint64_t Array._checkSubscript(_:wasNativeTypeChecked:)()
{
  return MEMORY[0x270F9DBD0]();
}

Swift::Void __swiftcall Array.reserveCapacity(_:)(Swift::Int a1)
{
}

uint64_t static Array.+ infix(_:_:)()
{
  return MEMORY[0x270F9DC00]();
}

Swift::Void __swiftcall Array._makeMutableAndUnique()()
{
}

uint64_t static Array._allocateUninitialized(_:)()
{
  return MEMORY[0x270F9DC10]();
}

Swift::Bool __swiftcall Array._hoistableIsNativeTypeChecked()()
{
  return MEMORY[0x270F9DC30]();
}

uint64_t static Array.+= infix(_:_:)()
{
  return MEMORY[0x270F9DC38]();
}

uint64_t Array.count.getter()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t Array.append(_:)()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t Array.endIndex.getter()
{
  return MEMORY[0x270F9DCA8]();
}

uint64_t type metadata accessor for Array()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t static Array<A>.== infix(_:_:)()
{
  return MEMORY[0x270F9DCF8]();
}

uint64_t Array.init<A>(_:)()
{
  return MEMORY[0x270F9DD08]();
}

uint64_t Array.subscript.getter()
{
  return MEMORY[0x270F9DD10]();
}

{
  return MEMORY[0x270F9DD28]();
}

uint64_t dispatch thunk of static Numeric.* infix(_:_:)()
{
  return MEMORY[0x270F9E018]();
}

uint64_t RandomAccessCollection<>.indices.getter()
{
  return MEMORY[0x270F9E070]();
}

uint64_t dispatch thunk of Collection.startIndex.getter()
{
  return MEMORY[0x270F9E080]();
}

uint64_t dispatch thunk of Collection.count.getter()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t dispatch thunk of Collection.formIndex(after:)()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t Collection.isEmpty.getter()
{
  return MEMORY[0x270F9E178]();
}

uint64_t Collection.dropFirst(_:)()
{
  return MEMORY[0x270F9E190]();
}

uint64_t dispatch thunk of Collection.subscript.read()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t RangeReplaceableCollection<>.removeLast()()
{
  return MEMORY[0x270F9E2D8]();
}

uint64_t RangeReplaceableCollection<>.removeLast(_:)()
{
  return MEMORY[0x270F9E2E0]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t dispatch thunk of IteratorProtocol.next()()
{
  return MEMORY[0x270F9E518]();
}

uint64_t type metadata accessor for ArraySlice()
{
  return MEMORY[0x270F9E708]();
}

uint64_t _expectEnd<A>(of:is:)()
{
  return MEMORY[0x270F9E890]();
}

uint64_t dispatch thunk of SIMDStorage.scalarCount.getter()
{
  return MEMORY[0x270F9E938]();
}

uint64_t dispatch thunk of SIMDStorage.init()()
{
  return MEMORY[0x270F9E940]();
}

uint64_t dispatch thunk of SIMDStorage.subscript.getter()
{
  return MEMORY[0x270F9E948]();
}

uint64_t dispatch thunk of SIMDStorage.subscript.setter()
{
  return MEMORY[0x270F9E950]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t Zip2Sequence.makeIterator()()
{
  return MEMORY[0x270F9E9F0]();
}

uint64_t Zip2Sequence.Iterator.next()()
{
  return MEMORY[0x270F9E9F8]();
}

uint64_t type metadata accessor for Zip2Sequence.Iterator()
{
  return MEMORY[0x270F9EA00]();
}

uint64_t type metadata accessor for Zip2Sequence()
{
  return MEMORY[0x270F9EA08]();
}

uint64_t _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x270F9EA38]();
}

uint64_t dispatch thunk of static SignedNumeric.- prefix(_:)()
{
  return MEMORY[0x270F9EB00]();
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

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9EFE8]();
}

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

uint64_t dispatch thunk of static AdditiveArithmetic.+= infix(_:_:)()
{
  return MEMORY[0x270F9F020]();
}

uint64_t dispatch thunk of static AdditiveArithmetic.zero.getter()
{
  return MEMORY[0x270F9F030]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x270F9F4E0]();
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

uint64_t zip<A, B>(_:_:)()
{
  return MEMORY[0x270F9FAB8]();
}

uint64_t Mirror.init(reflecting:)()
{
  return MEMORY[0x270F9FCA8]();
}

uint64_t _swift_isClassOrObjCExistentialType()
{
  return MEMORY[0x270FA0150]();
}

long double acos(long double __x)
{
  MEMORY[0x270ED8588](__x);
  return result;
}

float acosf(float a1)
{
  MEMORY[0x270ED8598](a1);
  return result;
}

long double acosh(long double __x)
{
  MEMORY[0x270ED85A0](__x);
  return result;
}

float acoshf(float a1)
{
  MEMORY[0x270ED85A8](a1);
  return result;
}

long double asin(long double __x)
{
  MEMORY[0x270ED8610](__x);
  return result;
}

float asinf(float a1)
{
  MEMORY[0x270ED8618](a1);
  return result;
}

long double asinh(long double __x)
{
  MEMORY[0x270ED8620](__x);
  return result;
}

float asinhf(float a1)
{
  MEMORY[0x270ED8628](a1);
  return result;
}

long double atan(long double __x)
{
  MEMORY[0x270ED86A0](__x);
  return result;
}

float atanf(float a1)
{
  MEMORY[0x270ED86C0](a1);
  return result;
}

long double atanh(long double __x)
{
  MEMORY[0x270ED86C8](__x);
  return result;
}

float atanhf(float a1)
{
  MEMORY[0x270ED86D0](a1);
  return result;
}

void bzero(void *a1, size_t a2)
{
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

long double cosh(long double __x)
{
  MEMORY[0x270ED9138](__x);
  return result;
}

float coshf(float a1)
{
  MEMORY[0x270ED9140](a1);
  return result;
}

long double erf(long double __x)
{
  MEMORY[0x270ED9780](__x);
  return result;
}

long double erfc(long double __x)
{
  MEMORY[0x270ED9788](__x);
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

long double expm1(long double __x)
{
  MEMORY[0x270ED9878](__x);
  return result;
}

float expm1f(float a1)
{
  MEMORY[0x270ED9880](a1);
  return result;
}

long double fma(long double __x, long double __y, long double __z)
{
  MEMORY[0x270ED99C0](__x, __y, __z);
  return result;
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
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

long double log1p(long double __x)
{
  MEMORY[0x270EDA0C0](__x);
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

float logf(float a1)
{
  MEMORY[0x270EDA0F8](a1);
  return result;
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
}

float powf(float a1, float a2)
{
  MEMORY[0x270EDAD00](a1, a2);
  return result;
}

long double remainder(long double __x, long double __y)
{
  MEMORY[0x270EDB1D8](__x, __y);
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

long double sinh(long double __x)
{
  MEMORY[0x270EDB4F8](__x);
  return result;
}

float sinhf(float a1)
{
  MEMORY[0x270EDB500](a1);
  return result;
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getCanonicalSpecializedMetadata()
{
  return MEMORY[0x270FA0328]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
}

uint64_t swift_getFunctionTypeMetadata1()
{
  return MEMORY[0x270FA0390]();
}

uint64_t swift_getFunctionTypeMetadata2()
{
  return MEMORY[0x270FA0398]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

long double tan(long double __x)
{
  MEMORY[0x270EDB810](__x);
  return result;
}

float tanf(float a1)
{
  MEMORY[0x270EDB818](a1);
  return result;
}

long double tanh(long double __x)
{
  MEMORY[0x270EDB820](__x);
  return result;
}

float tanhf(float a1)
{
  MEMORY[0x270EDB828](a1);
  return result;
}