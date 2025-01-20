uint64_t sub_25E6464B8()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t result;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v1 = v0[5];
  v2 = v0[6];
  v3 = v0[7];
  v4 = v0[8];
  v5 = v0[10];
  v16 = v0[9];
  v6 = v0[11];
  sub_25E6699D0();
  sub_25E6699D0();
  sub_25E6699D0();
  sub_25E6699E0();
  v7 = v3 >> 1;
  result = (v3 >> 1) - v2;
  if (__OFSUB__(v3 >> 1, v2))
  {
    __break(1u);
    goto LABEL_16;
  }
  result = sub_25E6699D0();
  v9 = __OFSUB__(v7, v2);
  v10 = v7 - v2;
  if (v10)
  {
    if ((v10 < 0) ^ v9 | (v10 == 0))
    {
LABEL_17:
      __break(1u);
      goto LABEL_18;
    }
    v11 = v1 + v2;
    do
    {
      ++v11;
      sub_25E6699E0();
      --v10;
    }
    while (v10);
  }
  if (!v4) {
    return sub_25E6699E0();
  }
  sub_25E6699E0();
  v12 = v6 >> 1;
  result = (v6 >> 1) - v5;
  if (__OFSUB__(v6 >> 1, v5))
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  result = sub_25E6699D0();
  v13 = __OFSUB__(v12, v5);
  v14 = v12 - v5;
  if (!v14) {
    return result;
  }
  if ((v14 < 0) ^ v13 | (v14 == 0))
  {
LABEL_18:
    __break(1u);
    return result;
  }
  v15 = v16 + v5;
  do
  {
    ++v15;
    result = sub_25E6699E0();
    --v14;
  }
  while (v14);
  return result;
}

uint64_t sub_25E6465D0()
{
  return sub_25E669A00();
}

uint64_t sub_25E64664C()
{
  return sub_25E669A00();
}

uint64_t sub_25E6466C4()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = v0[10];
  unint64_t v3 = v0[11];
  sub_25E669880();
  sub_25E669620();
  ASN1Identifier.description.getter();
  sub_25E669620();
  swift_bridgeObjectRelease();
  sub_25E669620();
  sub_25E669940();
  sub_25E669620();
  swift_bridgeObjectRelease();
  sub_25E669620();
  if (v1 && __OFSUB__(v3 >> 1, v2)) {
    __break(1u);
  }
  sub_25E669940();
  sub_25E669620();
  swift_bridgeObjectRelease();
  sub_25E669620();
  return 0;
}

uint64_t static DER.sequence<A>(_:identifier:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void (*a3)(void *)@<X2>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  BOOL v7 = *(void *)a1 == *(void *)a2 && *(unsigned __int8 *)(a1 + 8) == *(unsigned __int8 *)(a2 + 8);
  if (v7 && (*(unsigned char *)(a1 + 56) & 1) == 0)
  {
    uint64_t v13 = *(void *)(a1 + 16);
    uint64_t v12 = *(void *)(a1 + 24);
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 40);
    uint64_t v16 = *(void *)(a1 + 48);
    v22[0] = v13;
    v22[1] = v12;
    v22[2] = v15;
    v22[3] = v14;
    v22[4] = v16;
    swift_unknownObjectRetain_n();
    a3(v22);
    if (v5
      || (ASN1NodeCollection.Iterator.next()((uint64_t)v19),
          uint64_t v17 = v21,
          sub_25E64EC20(v19[0], v19[1], v19[2], v19[3], v19[4], v19[5], v19[6], v20, v21),
          !v17))
    {
      swift_unknownObjectRelease();
      return j__swift_unknownObjectRelease(v13, v12, v15, v14, v16, 0);
    }
    else
    {
      sub_25E64EBC8();
      swift_allocError();
      static ASN1Error.invalidASN1Object(reason:file:line:)(0xD000000000000019, 0x800000025E66BA90, (uint64_t)"SwiftASN1/ASN1.swift", 20, 2, 92, v18);
      swift_willThrow();
      j__swift_unknownObjectRelease(v13, v12, v15, v14, v16, 0);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(a4 - 8) + 8))(a5, a4);
      return swift_unknownObjectRelease();
    }
  }
  else
  {
    sub_25E64EBC8();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1.swift", 20, 2, 84, v8);
    return swift_willThrow();
  }
}

uint64_t ASN1NodeCollection.makeIterator()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 32);
  long long v3 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v1;
  *(_OWORD *)(a1 + 16) = v3;
  *(void *)(a1 + 32) = v2;
  return swift_unknownObjectRetain();
}

void ASN1NodeCollection.Iterator.next()(uint64_t a1@<X8>)
{
  int64_t v3 = v1[2];
  unint64_t v4 = v1[3];
  if (v3 == v4 >> 1)
  {
    *(_OWORD *)(a1 + 64) = 0u;
    *(_OWORD *)(a1 + 80) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    return;
  }
  if (v3 >= (uint64_t)(v4 >> 1))
  {
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v5 = *v1;
  uint64_t v6 = v1[1];
  BOOL v7 = (long long *)(v6 + 96 * v3);
  long long v8 = v7[1];
  long long v37 = *v7;
  long long v38 = v8;
  long long v9 = v7[2];
  long long v10 = v7[3];
  long long v11 = v7[5];
  v41[0] = v7[4];
  v41[1] = v11;
  long long v39 = v9;
  long long v40 = v10;
  uint64_t v12 = v3 + 1;
  v1[2] = v3 + 1;
  if ((BYTE8(v38) & 1) == 0)
  {
    sub_25E64EC84((uint64_t)v41, (uint64_t)v42);
    sub_25E64EC84((uint64_t)v42, (uint64_t)&v34);
    uint64_t v13 = v34;
    if ((void)v34)
    {
      uint64_t v14 = *((void *)&v34 + 1);
      uint64_t v15 = BYTE8(v37);
      *(void *)a1 = v37;
      *(void *)(a1 + 8) = v15;
      *(void *)(a1 + 16) = v13;
      *(void *)(a1 + 24) = v14;
      *(_OWORD *)(a1 + 32) = v35;
      *(_OWORD *)(a1 + 48) = xmmword_25E669C70;
      long long v16 = v40;
      *(_OWORD *)(a1 + 64) = v39;
      *(_OWORD *)(a1 + 80) = v16;
      sub_25E64ED30((uint64_t)v42);
      swift_unknownObjectRetain();
      return;
    }
LABEL_14:
    __break(1u);
    return;
  }
  sub_25E650478(v5, v6, v12, v4, (uint64_t)&v37);
  uint64_t v21 = v20;
  if (__OFSUB__(v19 >> 1, v18))
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v22 = v17;
  uint64_t v23 = v18;
  unint64_t v24 = v19;
  *uint64_t v1 = sub_25E64A364((v19 >> 1) - v18, v5, v6, v12, v4);
  v1[1] = v25;
  v1[2] = v26;
  v1[3] = v27;
  uint64_t v28 = v37;
  uint64_t v29 = BYTE8(v37);
  sub_25E64A734(v21, v22, v23, v24, v38, &v34);
  uint64_t v30 = v36;
  long long v32 = v34;
  long long v31 = v35;
  *(void *)a1 = v28;
  *(void *)(a1 + 8) = v29;
  *(_OWORD *)(a1 + 16) = v32;
  *(_OWORD *)(a1 + 32) = v31;
  *(void *)(a1 + 48) = v30;
  *(void *)(a1 + 56) = 0;
  long long v33 = v40;
  *(_OWORD *)(a1 + 64) = v39;
  *(_OWORD *)(a1 + 80) = v33;
  swift_unknownObjectRetain();

  swift_unknownObjectRetain();
}

uint64_t static DER.sequence<A>(of:identifier:rootNode:)(uint64_t a1, uint64_t a2, uint64_t a3, char *a4)
{
  BOOL v5 = *(void *)a3 == *(void *)a2 && *(unsigned __int8 *)(a3 + 8) == *(unsigned __int8 *)(a2 + 8);
  if (v5 && (*(unsigned char *)(a3 + 56) & 1) == 0)
  {
    uint64_t v20 = &v18;
    uint64_t v9 = *(void *)(a3 + 16);
    uint64_t v19 = *(void *)(a3 + 24);
    uint64_t v10 = *(void *)(a3 + 32);
    uint64_t v11 = *(void *)(a3 + 40);
    uint64_t v12 = *(void *)(a3 + 48);
    uint64_t v21 = v9;
    uint64_t v22 = v19;
    uint64_t v23 = v10;
    uint64_t v24 = v11;
    uint64_t v25 = v12;
    MEMORY[0x270FA5388](a1);
    v17[2] = v13;
    v17[3] = v14;
    swift_unknownObjectRetain();
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B38DCA0);
    unint64_t v16 = sub_25E64F454();
    uint64_t v4 = sub_25E646E28((void (*)(char *, char *))sub_25E652EA0, (uint64_t)v17, (uint64_t)&type metadata for ASN1NodeCollection, a4, v15, v16, MEMORY[0x263F8E4E0], (uint64_t)&v26);
    j__swift_unknownObjectRelease(v9, v19, v10, v11, v12, 0);
  }
  else
  {
    sub_25E64EBC8();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1.swift", 20, 2, 109, v6);
    swift_willThrow();
  }
  return v4;
}

uint64_t sub_25E646E28(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v43 = a8;
  uint64_t v44 = a5;
  uint64_t v9 = v8;
  uint64_t v58 = a2;
  v59 = a4;
  v57 = a1;
  uint64_t v42 = *(void *)(a5 - 8);
  uint64_t v11 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v55 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  v53 = (char *)&v40 - v13;
  uint64_t v15 = v14;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v54 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  v41 = (char *)&v40 - v17;
  uint64_t v18 = sub_25E669790();
  uint64_t v45 = *(void *)(v18 - 8);
  uint64_t v46 = v18;
  uint64_t v19 = MEMORY[0x270FA5388](v18);
  v51 = (char *)&v40 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v40 - v22;
  uint64_t v24 = MEMORY[0x270FA5388](v21);
  long long v40 = (char *)&v40 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  uint64_t v50 = *((void *)v15 - 1);
  MEMORY[0x270FA5388](v26);
  uint64_t v28 = (char *)&v40 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = a6;
  v52 = v15;
  uint64_t v60 = swift_getAssociatedTypeWitness();
  uint64_t v47 = *(void *)(v60 - 8);
  MEMORY[0x270FA5388](v60);
  uint64_t v30 = (char *)&v40 - v29;
  uint64_t v31 = sub_25E669650();
  uint64_t v61 = sub_25E6698D0();
  uint64_t v56 = sub_25E6698E0();
  sub_25E6698B0();
  (*(void (**)(char *, uint64_t, void))(v50 + 16))(v28, v48, v52);
  v59 = v30;
  uint64_t result = sub_25E669640();
  if (v31 < 0)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    return result;
  }
  if (v31)
  {
    long long v33 = (uint64_t (**)(char *, uint64_t, uint64_t))(v54 + 48);
    long long v34 = (uint64_t (**)(char *, uint64_t))(v54 + 8);
    swift_getAssociatedConformanceWitness();
    while (1)
    {
      sub_25E6697A0();
      uint64_t result = (*v33)(v23, 1, AssociatedTypeWitness);
      if (result == 1) {
        goto LABEL_18;
      }
      v57(v23, v55);
      if (v9)
      {
        (*(void (**)(char *, uint64_t))(v47 + 8))(v59, v60);
        swift_release();
        (*(void (**)(uint64_t, char *, uint64_t))(v42 + 32))(v43, v55, v44);
        return (*v34)(v23, AssociatedTypeWitness);
      }
      uint64_t v9 = 0;
      (*v34)(v23, AssociatedTypeWitness);
      sub_25E6698C0();
      if (!--v31)
      {
        uint64_t v35 = v54;
        uint64_t v36 = v51;
        goto LABEL_9;
      }
    }
  }
  swift_getAssociatedConformanceWitness();
  uint64_t v35 = v54;
  uint64_t v36 = v51;
LABEL_9:
  sub_25E6697A0();
  v55 = *(char **)(v35 + 48);
  if (((unsigned int (*)(char *, uint64_t, uint64_t))v55)(v36, 1, AssociatedTypeWitness) == 1)
  {
    long long v37 = v51;
LABEL_14:
    (*(void (**)(char *, uint64_t))(v47 + 8))(v59, v60);
    (*(void (**)(char *, uint64_t))(v45 + 8))(v37, v46);
    return v61;
  }
  else
  {
    v52 = *(void (**)(char *, char *, uint64_t))(v35 + 32);
    uint64_t v54 = v35 + 32;
    long long v38 = (void (**)(char *, uint64_t))(v35 + 8);
    long long v39 = v41;
    long long v37 = v51;
    while (1)
    {
      v52(v39, v37, AssociatedTypeWitness);
      v57(v39, v53);
      if (v9) {
        break;
      }
      uint64_t v9 = 0;
      (*v38)(v39, AssociatedTypeWitness);
      sub_25E6698C0();
      sub_25E6697A0();
      if (((unsigned int (*)(char *, uint64_t, uint64_t))v55)(v37, 1, AssociatedTypeWitness) == 1) {
        goto LABEL_14;
      }
    }
    (*v38)(v39, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v47 + 8))(v59, v60);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v42 + 32))(v43, v53, v44);
  }
}

uint64_t static DER.sequence<A>(of:identifier:nodes:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_25E647634(a1, a2, a3, a4, a5, (uint64_t (*)(void))static DER.sequence<A>(of:identifier:rootNode:), 0xD00000000000002FLL, 0x800000025E66BAB0, 127);
}

uint64_t static DER.set<A>(_:identifier:_:)@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, void (*a3)(void *)@<X2>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  char v5 = *((unsigned char *)a1 + 8);
  uint64_t v6 = a1[6];
  char v7 = *((unsigned char *)a1 + 56);
  uint64_t v8 = *a2;
  char v9 = *((unsigned char *)a2 + 8);
  uint64_t v15 = *a1;
  char v16 = v5;
  long long v10 = *((_OWORD *)a1 + 2);
  long long v17 = *((_OWORD *)a1 + 1);
  long long v18 = v10;
  uint64_t v19 = v6;
  char v20 = v7;
  long long v11 = *((_OWORD *)a1 + 5);
  long long v21 = *((_OWORD *)a1 + 4);
  long long v22 = v11;
  uint64_t v13 = v8;
  char v14 = v9;
  return static DER.sequence<A>(_:identifier:_:)((uint64_t)&v15, (uint64_t)&v13, a3, a4, a5);
}

uint64_t static DER.set<A>(of:identifier:nodes:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_25E647634(a1, a2, a3, a4, a5, (uint64_t (*)(void))static DER.set<A>(of:identifier:rootNode:), 0xD000000000000029, 0x800000025E66BAE0, 158);
}

uint64_t sub_25E647634(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(void), uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v28 = a4;
  ASN1NodeCollection.Iterator.next()((uint64_t)v25);
  uint64_t v12 = v27;
  if (v27)
  {
    uint64_t v23 = v25[5];
    uint64_t v24 = v25[6];
    uint64_t v22 = v25[4];
    char v20 = v26;
    uint64_t v21 = v25[3];
    uint64_t v13 = a6;
    uint64_t v15 = v25[1];
    uint64_t v14 = v25[2];
    uint64_t v16 = v25[0];
    LOBYTE(v26) = v26 & 1;
    uint64_t v17 = v13();
    sub_25E64EC20(v16, v15, v14, v21, v22, v23, v24, v20, v12);
  }
  else
  {
    uint64_t v17 = a9;
    sub_25E64EBC8();
    swift_allocError();
    static ASN1Error.invalidASN1Object(reason:file:line:)(a7, a8, (uint64_t)"SwiftASN1/ASN1.swift", 20, 2, a9, v18);
    swift_willThrow();
  }
  return v17;
}

uint64_t static DER.set<A>(of:identifier:rootNode:)(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, uint64_t a5)
{
  BOOL v7 = *(void *)a3 == *(void *)a2 && *(unsigned __int8 *)(a3 + 8) == *(unsigned __int8 *)(a2 + 8);
  if (v7 && (*(unsigned char *)(a3 + 56) & 1) == 0)
  {
    uint64_t v6 = v5;
    uint64_t v13 = *(void *)(a3 + 16);
    uint64_t v12 = *(void *)(a3 + 24);
    uint64_t v15 = *(void *)(a3 + 32);
    uint64_t v14 = *(void *)(a3 + 40);
    uint64_t v16 = *(void *)(a3 + 48);
    uint64_t v24 = v13;
    uint64_t v25 = v12;
    uint64_t v26 = v15;
    uint64_t v27 = v14;
    uint64_t v28 = v16;
    swift_unknownObjectRetain();
    uint64_t v17 = sub_25E6479F8();
    if (v17)
    {
      v22[1] = v22;
      uint64_t v24 = v13;
      uint64_t v25 = v12;
      uint64_t v26 = v15;
      uint64_t v27 = v14;
      uint64_t v28 = v16;
      MEMORY[0x270FA5388](v17);
      uint64_t v23 = v16;
      v21[2] = a4;
      v21[3] = a5;
      uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B38DCA0);
      unint64_t v19 = sub_25E64F454();
      uint64_t v6 = sub_25E646E28((void (*)(char *, char *))sub_25E64F4A8, (uint64_t)v21, (uint64_t)&type metadata for ASN1NodeCollection, a4, v18, v19, MEMORY[0x263F8E4E0], (uint64_t)&v29);
      j__swift_unknownObjectRelease(v13, v12, v15, v14, v23, 0);
    }
    else
    {
      sub_25E64EBC8();
      swift_allocError();
      static ASN1Error.invalidASN1Object(reason:file:line:)(0xD00000000000002FLL, 0x800000025E66BB10, (uint64_t)"SwiftASN1/ASN1.swift", 20, 2, 179, v20);
      swift_willThrow();
      j__swift_unknownObjectRelease(v13, v12, v15, v14, v16, 0);
    }
  }
  else
  {
    sub_25E64EBC8();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1.swift", 20, 2, 175, v8);
    swift_willThrow();
  }
  return v6;
}

uint64_t sub_25E6479F8()
{
  uint64_t v1 = *((void *)v0 + 4);
  long long v2 = v0[1];
  long long v83 = *v0;
  long long v84 = v2;
  uint64_t v85 = v1;
  ASN1NodeCollection.Iterator.next()((uint64_t)v75);
  uint64_t v3 = v79;
  if (!v79)
  {
    swift_unknownObjectRetain();
LABEL_41:
    swift_unknownObjectRelease();
    return 1;
  }
  uint64_t v4 = v75[4];
  uint64_t v58 = v75[3];
  uint64_t v59 = v75[2];
  uint64_t v5 = v76;
  uint64_t v57 = v77;
  char v6 = v78;
  uint64_t v7 = v78 & 1;
  unint64_t v9 = *((void *)&v84 + 1);
  int64_t v8 = v84;
  int64_t v10 = *((void *)&v84 + 1) >> 1;
  if ((void)v84 == *((void *)&v84 + 1) >> 1)
  {
    swift_unknownObjectRetain();
    uint64_t v11 = v57;
LABEL_40:
    j__swift_unknownObjectRelease(v59, v58, v4, v5, v11, v7);
    swift_unknownObjectRelease();
    goto LABEL_41;
  }
  char v74 = v78 & 1;
  uint64_t v53 = v75[1];
  uint64_t v54 = v75[0];
  uint64_t v55 = v80;
  uint64_t v56 = v76;
  unint64_t v51 = v82;
  int64_t v52 = v81;
  long long v12 = v83;
  swift_unknownObjectRetain();
  char v48 = v6;
  sub_25E652CBC(v54, v53, v59, v58, v4, v5, v57, v6, v3);
  unint64_t v61 = v9 & 0xFFFFFFFFFFFFFFFELL;
  uint64_t v60 = *((void *)&v12 + 1) + 112;
  uint64_t v49 = v3;
  uint64_t v50 = v4;
  uint64_t v13 = v3;
  uint64_t result = v55;
  uint64_t v15 = v5;
  unint64_t v17 = v51;
  int64_t v16 = v52;
  uint64_t v18 = v59;
  uint64_t v19 = v58;
  uint64_t v20 = v4;
  uint64_t v21 = v57;
  while (v8 < (uint64_t)(v9 >> 1))
  {
    if (v10 <= v8) {
      goto LABEL_47;
    }
    if (v9 >> 1 < v10) {
      goto LABEL_48;
    }
    uint64_t v22 = *((void *)&v12 + 1) + 96 * v8;
    int v23 = *(unsigned __int8 *)(v22 + 24);
    uint64_t v25 = *(void *)(v22 + 32);
    uint64_t v24 = *(void *)(v22 + 40);
    uint64_t v26 = *(void *)(v22 + 48);
    unint64_t v27 = *(void *)(v22 + 56);
    uint64_t v28 = v8 + 1;
    unint64_t v29 = v9 & 1;
    uint64_t v72 = v15;
    uint64_t v73 = v20;
    uint64_t v70 = v19;
    uint64_t v71 = v21;
    uint64_t v69 = v18;
    unint64_t v63 = v29;
    int64_t v68 = v16;
    if (*(unsigned char *)(v22 + 24))
    {
      uint64_t v30 = *(void *)(v22 + 16);
      int64_t v31 = v10;
      if (v28 != v10)
      {
        long long v32 = (uint64_t *)(v60 + 96 * v8);
        int64_t v31 = v8 + 1;
        do
        {
          if (v31 >= v10)
          {
LABEL_44:
            __break(1u);
LABEL_45:
            __break(1u);
            goto LABEL_46;
          }
          if (v30 >= *v32) {
            goto LABEL_17;
          }
          uint64_t v33 = v31 + 1;
          if (__OFADD__(v31, 1)) {
            goto LABEL_45;
          }
          ++v31;
          v32 += 12;
        }
        while (v33 != v10);
        int64_t v31 = v10;
LABEL_17:
        if (v31 <= v8) {
          goto LABEL_49;
        }
        if (v31 < 0) {
          goto LABEL_50;
        }
      }
      uint64_t v34 = v31 - v28;
      if (__OFSUB__(v31, v28)) {
        goto LABEL_51;
      }
      if (v34 < 0) {
        goto LABEL_52;
      }
      int64_t v35 = v10 - v28;
      if (__OFSUB__(v10, v28)) {
        goto LABEL_53;
      }
      if (!v34 || v35 < 0 || (int64_t v36 = v10, v35 >= v34))
      {
        int64_t v36 = v31;
        if (__OFADD__(v28, v34)) {
          goto LABEL_56;
        }
        if (v10 < v31) {
          goto LABEL_54;
        }
      }
      if (v36 <= v8) {
        goto LABEL_55;
      }
      if (v28 != v31)
      {
        if (v28 >= v31) {
          goto LABEL_57;
        }
        long long v37 = (uint64_t *)(v60 + 96 * v8);
        do
        {
          uint64_t v38 = *v37;
          v37 += 12;
          if (v30 >= v38)
          {
            __break(1u);
            goto LABEL_44;
          }
          --v34;
        }
        while (v34);
        if (*(void *)(*((void *)&v12 + 1) + 96 * v28 + 16) != v30 + 1) {
          goto LABEL_58;
        }
      }
      int64_t v62 = v36;
      uint64_t v39 = v26;
      uint64_t v40 = v13;
      uint64_t v41 = result;
      uint64_t v67 = v29 | (2 * v31);
      uint64_t v65 = *((void *)&v12 + 1);
      uint64_t v66 = swift_unknownObjectRetain();
      uint64_t v64 = v28;
    }
    else
    {
      uint64_t v41 = result;
      uint64_t result = *(void *)(v22 + 64);
      if (!result) {
        goto LABEL_59;
      }
      uint64_t v39 = *(void *)(v22 + 48);
      uint64_t v40 = v13;
      uint64_t v64 = *(void *)(v22 + 80);
      uint64_t v65 = *(void *)(v22 + 72);
      uint64_t v66 = *(void *)(v22 + 64);
      uint64_t v67 = *(void *)(v22 + 88);
      swift_unknownObjectRetain();
      uint64_t v30 = 0;
      int64_t v62 = v28;
    }
    uint64_t v42 = v23 ^ 1u;
    swift_unknownObjectRetain();
    uint64_t v43 = swift_unknownObjectRetain();
    uint64_t v44 = v39;
    sub_25E64C26C(v43, v24, v39, v27, v40, v41, v68, v17);
    char v46 = v45;
    j__swift_unknownObjectRelease(v69, v70, v73, v72, v71, v74 & 1);
    swift_unknownObjectRelease_n();
    if (v46)
    {
      swift_unknownObjectRelease();
      sub_25E64EC20(v54, v53, v59, v58, v50, v56, v57, v48, v49);
      j__swift_unknownObjectRelease(v66, v65, v64, v67, v30, v42);
      swift_unknownObjectRelease();
      return 0;
    }
    unint64_t v9 = v63 | v61;
    uint64_t v13 = v25;
    uint64_t result = v24;
    int64_t v16 = v44;
    unint64_t v17 = v27;
    int64_t v8 = v62;
    uint64_t v18 = v66;
    uint64_t v19 = v65;
    uint64_t v4 = v64;
    uint64_t v20 = v64;
    uint64_t v15 = v67;
    uint64_t v21 = v30;
    char v74 = v42;
    if (v62 == v10)
    {
      sub_25E64EC20(v54, v53, v59, v58, v50, v56, v57, v48, v49);
      uint64_t v47 = v42;
      uint64_t v58 = v65;
      uint64_t v59 = v66;
      uint64_t v5 = v67;
      uint64_t v11 = v30;
      uint64_t v7 = v47;
      goto LABEL_40;
    }
  }
LABEL_46:
  __break(1u);
LABEL_47:
  __break(1u);
LABEL_48:
  __break(1u);
LABEL_49:
  __break(1u);
LABEL_50:
  __break(1u);
LABEL_51:
  __break(1u);
LABEL_52:
  __break(1u);
LABEL_53:
  __break(1u);
LABEL_54:
  __break(1u);
LABEL_55:
  __break(1u);
LABEL_56:
  __break(1u);
LABEL_57:
  __break(1u);
LABEL_58:
  __break(1u);
LABEL_59:
  __break(1u);
  return result;
}

uint64_t sub_25E647EA0(uint64_t *a1, uint64_t a2, uint64_t a3, void *a4)
{
  char v8 = *((unsigned char *)a1 + 8);
  uint64_t v10 = a1[2];
  uint64_t v9 = a1[3];
  uint64_t v11 = a1[4];
  uint64_t v12 = a1[5];
  uint64_t v13 = a1[6];
  uint64_t v14 = *((unsigned __int8 *)a1 + 56);
  uint64_t v18 = *a1;
  char v19 = v8;
  uint64_t v20 = v10;
  uint64_t v21 = v9;
  uint64_t v22 = v11;
  uint64_t v23 = v12;
  uint64_t v24 = v13;
  char v25 = v14;
  long long v15 = *((_OWORD *)a1 + 5);
  long long v26 = *((_OWORD *)a1 + 4);
  long long v27 = v15;
  int64_t v16 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(a3 + 8);
  j__swift_unknownObjectRetain(v10, v9, v11, v12, v13, v14);
  swift_unknownObjectRetain();
  uint64_t result = v16(&v18, a2, a3);
  if (v4) {
    *a4 = v4;
  }
  return result;
}

void static DER.optionalExplicitlyTagged<A>(_:tagNumber:tagClass:_:)(long long *a1@<X0>, uint64_t a2@<X1>, unsigned __int8 *a3@<X2>, void (*a4)(uint64_t *)@<X3>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  int v11 = *a3;
  uint64_t v12 = *((void *)a1 + 4);
  long long v13 = a1[1];
  long long v68 = *a1;
  long long v69 = v13;
  uint64_t v70 = v12;
  ASN1NodeCollection.Iterator.next()((uint64_t)&v56);
  uint64_t v14 = v64;
  if (!v64)
  {
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a5 - 8) + 56))(a6, 1, 1, a5);
    return;
  }
  uint64_t v52 = a6;
  uint64_t v51 = a5;
  uint64_t v15 = v56;
  uint64_t v16 = a2;
  uint64_t v18 = v58;
  uint64_t v17 = v59;
  uint64_t v20 = v60;
  uint64_t v19 = v61;
  uint64_t v22 = v62;
  char v21 = v63;
  uint64_t v50 = v16;
  uint64_t v71 = v63;
  if (v56 != v16 || v11 != v57)
  {
    uint64_t v54 = v62;
    uint64_t v55 = v61;
    uint64_t v28 = v57;
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
    sub_25E64EC20(v15, v28, v18, v17, v20, v55, v54, v71, v14);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v51 - 8) + 56))(v52, 1, 1);
    return;
  }
  uint64_t v49 = v57;
  uint64_t v23 = v70;
  long long v24 = v69;
  *a1 = v68;
  a1[1] = v24;
  *((void *)a1 + 4) = v23;
  if (v21)
  {
    __break(1u);
    return;
  }
  uint64_t v25 = v22;
  ASN1NodeCollection.Iterator.next()((uint64_t)&v56);
  if (!v64)
  {
    j__swift_unknownObjectRetain(v18, v17, v20, v19, v25, 0);
    j__swift_unknownObjectRetain(v18, v17, v20, v19, v25, 0);
    swift_unknownObjectRetain();
    goto LABEL_11;
  }
  uint64_t v44 = v64;
  uint64_t v40 = v56;
  uint64_t v41 = v58;
  uint64_t v42 = v57;
  uint64_t v43 = v59;
  uint64_t v45 = v60;
  uint64_t v46 = v61;
  uint64_t v47 = v62;
  char v48 = v63;
  uint64_t v38 = v66;
  uint64_t v39 = v65;
  uint64_t v37 = v67;
  ASN1NodeCollection.Iterator.next()((uint64_t)&v56);
  uint64_t v26 = v56;
  uint64_t v35 = v58;
  uint64_t v36 = v57;
  uint64_t v33 = v60;
  uint64_t v34 = v59;
  uint64_t v31 = v62;
  uint64_t v32 = v61;
  uint64_t v27 = v64;
  char v30 = v63;
  j__swift_unknownObjectRetain(v18, v17, v20, v19, v25, 0);
  j__swift_unknownObjectRetain(v18, v17, v20, v19, v25, 0);
  swift_unknownObjectRetain();
  sub_25E64EC20(v26, v36, v35, v34, v33, v32, v31, v30, v27);
  if (v27)
  {
    sub_25E64EC20(v40, v42, v41, v43, v45, v46, v47, v48, v44);
LABEL_11:
    sub_25E64EBC8();
    swift_allocError();
    static ASN1Error.invalidASN1Object(reason:file:line:)(0xD000000000000041, 0x800000025E66BB40, (uint64_t)"SwiftASN1/ASN1.swift", 20, 2, 222, v29);
    swift_willThrow();
    j__swift_unknownObjectRelease(v18, v17, v20, v19, v25, 0);
    sub_25E64EC20(v50, v49, v18, v17, v20, v19, v25, v71, v14);
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    return;
  }
  uint64_t v56 = v40;
  LOBYTE(v57) = v42;
  uint64_t v58 = v41;
  uint64_t v59 = v43;
  uint64_t v60 = v45;
  uint64_t v61 = v46;
  uint64_t v62 = v47;
  LOBYTE(v63) = v48 & 1;
  uint64_t v64 = v44;
  uint64_t v65 = v39;
  uint64_t v66 = v38;
  uint64_t v67 = v37;
  a4(&v56);
  j__swift_unknownObjectRelease(v18, v17, v20, v19, v25, 0);
  sub_25E64EC20(v50, v49, v18, v17, v20, v19, v25, v71, v14);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_25E64EC20(v40, v42, v41, v43, v45, v46, v47, v48, v44);
  if (!v6) {
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v51 - 8) + 56))(v52, 0, 1, v51);
  }
}

uint64_t static DER.optionalImplicitlyTagged<A>(_:tag:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = *(void *)a2;
  int v11 = *(unsigned __int8 *)(a2 + 8);
  uint64_t v12 = *(void *)(a1 + 32);
  long long v13 = *(_OWORD *)(a1 + 16);
  long long v35 = *(_OWORD *)a1;
  long long v36 = v13;
  uint64_t v37 = v12;
  ASN1NodeCollection.Iterator.next()((uint64_t)&v26);
  uint64_t v14 = v34;
  if (v34)
  {
    uint64_t v38 = v5;
    uint64_t v16 = v26;
    uint64_t v15 = v27;
    uint64_t v24 = v29;
    uint64_t v25 = v28;
    uint64_t v22 = v31;
    uint64_t v23 = v30;
    char v20 = v33;
    uint64_t v21 = v32;
    if (v26 == v10 && v11 == v27)
    {
      uint64_t v26 = v10;
      LOBYTE(v27) = v11;
      swift_unknownObjectRetain();
      uint64_t v17 = v38;
      DERImplicitlyTaggable.init(derEncoded:withIdentifier:)(a1, &v26, a3, a4);
      swift_unknownObjectRelease();
      uint64_t result = sub_25E64EC20(v10, v15, v25, v24, v23, v22, v21, v20, v14);
      if (v17) {
        return result;
      }
      uint64_t v19 = 0;
    }
    else
    {
      swift_unknownObjectRetain();
      swift_unknownObjectRelease();
      sub_25E64EC20(v16, v15, v25, v24, v23, v22, v21, v20, v14);
      uint64_t v19 = 1;
    }
  }
  else
  {
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
    uint64_t v19 = 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a3 - 8) + 56))(a5, v19, 1, a3);
}

uint64_t DERImplicitlyTaggable.init(derEncoded:withIdentifier:)(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *a2;
  char v7 = *((unsigned char *)a2 + 8);
  ASN1NodeCollection.Iterator.next()((uint64_t)&v12);
  if (v14)
  {
    LOBYTE(v13) = v13 & 1;
    uint64_t v10 = v6;
    char v11 = v7;
    return (*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t, uint64_t))(a4 + 32))(&v12, &v10, a3, a4);
  }
  else
  {
    sub_25E64EBC8();
    swift_allocError();
    static ASN1Error.invalidASN1Object(reason:file:line:)(0xD00000000000002ALL, 0x800000025E66BB90, (uint64_t)"SwiftASN1/ASN1.swift", 20, 2, 1107, v9);
    return swift_willThrow();
  }
}

{
  uint64_t v4;
  uint64_t v7;
  char v8;
  uint64_t result;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  long long v14;
  long long v15;
  uint64_t v16;
  char v17;
  long long v18;
  long long v19;
  uint64_t v20;
  char v21;
  long long v22;
  long long v23;
  uint64_t v24;
  char v25;
  long long v26;
  long long v27;

  char v7 = *a2;
  char v8 = *((unsigned char *)a2 + 8);
  static DER.parse(_:)(a1, a1 + 32, 0, (2 * *(void *)(a1 + 16)) | 1, (uint64_t)&v20);
  uint64_t result = swift_bridgeObjectRelease();
  if (!v4)
  {
    uint64_t v12 = v20;
    int v13 = v21;
    uint64_t v14 = v22;
    uint64_t v15 = v23;
    uint64_t v16 = v24;
    uint64_t v17 = v25;
    uint64_t v18 = v26;
    uint64_t v19 = v27;
    uint64_t v10 = v7;
    char v11 = v8;
    return (*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t, uint64_t))(a4 + 32))(&v12, &v10, a3, a4);
  }
  return result;
}

uint64_t static DER.optionalImplicitlyTagged<A>(_:tagNumber:tagClass:_:)@<X0>(long long *a1@<X0>, uint64_t a2@<X1>, unsigned __int8 *a3@<X2>, void (*a4)(uint64_t *)@<X3>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  int v12 = *a3;
  uint64_t v13 = *((void *)a1 + 4);
  long long v14 = a1[1];
  long long v55 = *a1;
  long long v56 = v14;
  uint64_t v57 = v13;
  ASN1NodeCollection.Iterator.next()((uint64_t)&v43);
  uint64_t v15 = v51;
  if (v51)
  {
    uint64_t v37 = a4;
    uint64_t v58 = a6;
    uint64_t v38 = a5;
    uint64_t v17 = v43;
    uint64_t v16 = v44;
    uint64_t v19 = v45;
    uint64_t v18 = v46;
    uint64_t v21 = v47;
    uint64_t v20 = v48;
    uint64_t v23 = v49;
    char v22 = v50;
    uint64_t v25 = v52;
    uint64_t v24 = v53;
    uint64_t v26 = v54;
    uint64_t v40 = v49;
    char v41 = v50;
    uint64_t v39 = v48;
    if (v43 == a2 && v12 == v44)
    {
      uint64_t v27 = v57;
      long long v28 = v56;
      *a1 = v55;
      a1[1] = v28;
      *((void *)a1 + 4) = v27;
      uint64_t v43 = a2;
      LOBYTE(v44) = v12;
      uint64_t v45 = v19;
      uint64_t v46 = v18;
      uint64_t v47 = v21;
      uint64_t v48 = v20;
      uint64_t v49 = v23;
      LOBYTE(v50) = v22 & 1;
      uint64_t v51 = v15;
      uint64_t v52 = v25;
      uint64_t v53 = v24;
      uint64_t v54 = v26;
      uint64_t v42 = v21;
      uint64_t v35 = v19;
      uint64_t v36 = v18;
      uint64_t v29 = v16;
      swift_unknownObjectRetain();
      v37(&v43);
      swift_unknownObjectRelease();
      uint64_t result = sub_25E64EC20(a2, v29, v35, v36, v42, v39, v40, v41, v15);
      if (v6) {
        return result;
      }
      uint64_t v31 = 0;
    }
    else
    {
      uint64_t v32 = v47;
      uint64_t v33 = v46;
      uint64_t v34 = v44;
      swift_unknownObjectRetain();
      swift_unknownObjectRelease();
      sub_25E64EC20(v17, v34, v19, v33, v32, v39, v40, v41, v15);
      uint64_t v31 = 1;
    }
    a5 = v38;
    a6 = v58;
  }
  else
  {
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
    uint64_t v31 = 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a5 - 8) + 56))(a6, v31, 1, a5);
}

uint64_t static DER.decodeDefault<A>(_:identifier:defaultValue:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, void (*a3)(uint64_t *)@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X8>)
{
  uint64_t v53 = a6;
  uint64_t v56 = a4;
  uint64_t v57 = a3;
  uint64_t v11 = *(void *)(a5 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](a1);
  uint64_t v58 = (char *)&v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *(void *)v14;
  int v16 = *(unsigned __int8 *)(v14 + 8);
  uint64_t v17 = *(void *)(v12 + 32);
  long long v18 = *(_OWORD *)(v12 + 16);
  long long v60 = *(_OWORD *)v12;
  long long v73 = v60;
  long long v74 = v18;
  uint64_t v75 = v17;
  ASN1NodeCollection.Iterator.next()((uint64_t)&v61);
  uint64_t v19 = v69;
  if (v69)
  {
    uint64_t v51 = a2;
    uint64_t v50 = v11;
    uint64_t v52 = a5;
    uint64_t v49 = a7;
    uint64_t v21 = v61;
    uint64_t v20 = v62;
    uint64_t v22 = v63;
    uint64_t v23 = v64;
    uint64_t v25 = v65;
    uint64_t v24 = v66;
    uint64_t v27 = v67;
    uint64_t v26 = v68;
    uint64_t v28 = v71;
    uint64_t v59 = v70;
    uint64_t v29 = v72;
    uint64_t v55 = v67;
    uint64_t v54 = v66;
    if (v61 == v15 && v16 == v62)
    {
      uint64_t v48 = v62;
      uint64_t v30 = v75;
      long long v31 = v74;
      *(_OWORD *)a1 = v73;
      *(_OWORD *)(a1 + 16) = v31;
      *(void *)(a1 + 32) = v30;
      uint64_t v61 = v15;
      LOBYTE(v62) = v16;
      uint64_t v63 = v22;
      uint64_t v64 = v23;
      uint64_t v65 = v25;
      uint64_t v66 = v24;
      uint64_t v67 = v27;
      LOBYTE(v68) = v26 & 1;
      uint64_t v69 = v19;
      uint64_t v70 = v59;
      uint64_t v71 = v28;
      uint64_t v72 = v29;
      uint64_t v32 = v15;
      *(void *)&long long v60 = v26;
      uint64_t v33 = v22;
      uint64_t v34 = v28;
      uint64_t v35 = v29;
      swift_unknownObjectRetain();
      uint64_t v36 = v76;
      v57(&v61);
      if (v36)
      {
        swift_unknownObjectRelease();
        return sub_25E64EC20(v32, v48, v33, (uint64_t)v23, v25, v54, v55, v60, v19);
      }
      else
      {
        uint64_t v45 = v32;
        uint64_t v46 = v35;
        uint64_t v47 = v34;
        uint64_t v56 = v33;
        uint64_t v57 = (void (*)(uint64_t *))v23;
        uint64_t v76 = v25;
        char v40 = v60;
        char v41 = v58;
        uint64_t v42 = v52;
        if (sub_25E6695F0())
        {
          sub_25E64EBC8();
          swift_allocError();
          static ASN1Error.invalidASN1Object(reason:file:line:)(0xD000000000000047, 0x800000025E66BBC0, (uint64_t)"SwiftASN1/ASN1.swift", 20, 2, 323, v43);
          swift_willThrow();
          sub_25E64EC20(v45, v48, v56, (uint64_t)v57, v76, v54, v55, v40, v19);
          (*(void (**)(char *, uint64_t))(v50 + 8))(v41, v42);
          return swift_unknownObjectRelease();
        }
        else
        {
          swift_unknownObjectRelease();
          sub_25E64EC20(v45, v48, v56, (uint64_t)v57, v76, v54, v55, v40, v19);
          return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v50 + 32))(v49, v41, v42);
        }
      }
    }
    else
    {
      char v38 = v68;
      uint64_t v39 = v63;
      swift_unknownObjectRetain();
      swift_unknownObjectRelease();
      sub_25E64EC20(v21, v20, v39, (uint64_t)v23, v25, v54, v55, v38, v19);
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v50 + 16))(v49, v51, v52);
    }
  }
  else
  {
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(a7, a2, a5);
  }
}

uint64_t static DER.decodeDefault<A>(_:identifier:defaultValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  char v7 = *(unsigned char *)(a2 + 8);
  v9[6] = *(void *)a2;
  char v10 = v7;
  v9[2] = a4;
  v9[3] = a5;
  v9[4] = a6;
  return static DER.decodeDefault<A>(_:identifier:defaultValue:_:)(a1, a3, (void (*)(uint64_t *))sub_25E64F4CC, (uint64_t)v9, a4, a5, a7);
}

uint64_t static DER.decodeDefault<A>(_:defaultValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a5 + 24))(&v14, a3, a5);
  uint64_t v12 = *(void *)(a5 + 8);
  uint64_t v20 = v14;
  char v21 = v15;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  uint64_t v19 = v12;
  return static DER.decodeDefault<A>(_:identifier:defaultValue:_:)(a1, a2, (void (*)(uint64_t *))sub_25E64F4CC, (uint64_t)v16, a3, a4, a6);
}

void static DER.decodeDefaultExplicitlyTagged<A>(_:tagNumber:tagClass:defaultValue:_:)(long long *a1@<X0>, uint64_t a2@<X1>, unsigned __int8 *a3@<X2>, uint64_t a4@<X3>, void (*a5)(uint64_t *)@<X4>, uint64_t a6@<X6>, uint64_t a7@<X7>, char *a8@<X8>)
{
  uint64_t v28 = a7;
  uint64_t v30 = a8;
  uint64_t v31 = a4;
  uint64_t v13 = sub_25E669790();
  uint64_t v29 = *(void *)(v13 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  int v16 = (char *)&v28 - v15;
  uint64_t v32 = *(void *)(a6 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v28 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  unsigned __int8 v34 = *a3;
  uint64_t v19 = v33;
  static DER.optionalExplicitlyTagged<A>(_:tagNumber:tagClass:_:)(a1, a2, &v34, a5, a6, (uint64_t)v16);
  if (!v19)
  {
    uint64_t v20 = v13;
    uint64_t v22 = v31;
    uint64_t v21 = v32;
    uint64_t v24 = v29;
    uint64_t v23 = v30;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(v16, 1, a6) == 1)
    {
      (*(void (**)(char *, uint64_t))(v24 + 8))(v16, v20);
      (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v23, v22, a6);
    }
    else
    {
      uint64_t v25 = v16;
      uint64_t v26 = *(void (**)(char *, char *, uint64_t))(v21 + 32);
      v26(v18, v25, a6);
      if (sub_25E6695F0())
      {
        sub_25E64EBC8();
        swift_allocError();
        static ASN1Error.invalidASN1Object(reason:file:line:)(0xD000000000000051, 0x800000025E66BC10, (uint64_t)"SwiftASN1/ASN1.swift", 20, 2, 377, v27);
        swift_willThrow();
        (*(void (**)(char *, uint64_t))(v21 + 8))(v18, a6);
      }
      else
      {
        v26(v23, v18, a6);
      }
    }
  }
}

void static DER.decodeDefaultExplicitlyTagged<A>(_:tagNumber:tagClass:defaultValue:)(long long *a1@<X0>, uint64_t a2@<X1>, unsigned __int8 *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, char *a7@<X8>)
{
  unsigned __int8 v7 = *a3;
  static DER.decodeDefaultExplicitlyTagged<A>(_:tagNumber:tagClass:defaultValue:_:)(a1, a2, &v7, a4, (void (*)(uint64_t *))sub_25E652ED0, a5, a6, a7);
}

uint64_t sub_25E649378(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char v6 = *((unsigned char *)a1 + 8);
  uint64_t v8 = a1[2];
  uint64_t v7 = a1[3];
  uint64_t v9 = a1[4];
  uint64_t v10 = a1[5];
  uint64_t v11 = a1[6];
  uint64_t v12 = *((unsigned __int8 *)a1 + 56);
  uint64_t v16 = *a1;
  char v17 = v6;
  uint64_t v18 = v8;
  uint64_t v19 = v7;
  uint64_t v20 = v9;
  uint64_t v21 = v10;
  uint64_t v22 = v11;
  char v23 = v12;
  long long v13 = *((_OWORD *)a1 + 5);
  long long v24 = *((_OWORD *)a1 + 4);
  long long v25 = v13;
  uint64_t v14 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(a4 + 8);
  j__swift_unknownObjectRetain(v8, v7, v9, v10, v11, v12);
  swift_unknownObjectRetain();
  return v14(&v16, a2, a4);
}

uint64_t static DER.explicitlyTagged<A>(_:tagNumber:tagClass:_:)(uint64_t a1, uint64_t a2, unsigned __int8 *a3, void (*a4)(uint64_t *))
{
  unsigned __int8 v6 = *a3;
  ASN1NodeCollection.Iterator.next()((uint64_t)v20);
  uint64_t v7 = v22;
  if (v22)
  {
    uint64_t v18 = v20[5];
    uint64_t v19 = v20[6];
    char v16 = v21;
    uint64_t v17 = v20[4];
    uint64_t v9 = v20[2];
    uint64_t v8 = v20[3];
    uint64_t v10 = a4;
    uint64_t v11 = a2;
    uint64_t v13 = v20[0];
    uint64_t v12 = v20[1];
    LOBYTE(v21) = v21 & 1;
    unsigned __int8 v23 = v6;
    static DER.explicitlyTagged<A>(_:tagNumber:tagClass:_:)((uint64_t)v20, v11, &v23, v10);
    return sub_25E64EC20(v13, v12, v9, v8, v17, v18, v19, v16, v7);
  }
  else
  {
    sub_25E64EBC8();
    swift_allocError();
    static ASN1Error.invalidASN1Object(reason:file:line:)(0xD000000000000040, 0x800000025E66BC70, (uint64_t)"SwiftASN1/ASN1.swift", 20, 2, 423, v15);
    return swift_willThrow();
  }
}

{
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
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
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;

  if (*(void *)a1 != a2 || *(unsigned __int8 *)(a1 + 8) != *a3)
  {
    sub_25E64EBC8();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1.swift", 20, 2, 442, v5);
    return swift_willThrow();
  }
  if (*(unsigned char *)(a1 + 56))
  {
    sub_25E64EBC8();
    swift_allocError();
    static ASN1Error.invalidASN1Object(reason:file:line:)(0xD00000000000001DLL, 0x800000025E66BCC0, (uint64_t)"SwiftASN1/ASN1.swift", 20, 2, 447, v6);
    return swift_willThrow();
  }
  uint64_t v9 = *(void *)(a1 + 24);
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 48);
  uint64_t v59 = *(void *)(a1 + 16);
  uint64_t v54 = v59;
  uint64_t v55 = v9;
  uint64_t v56 = v11;
  uint64_t v57 = v10;
  uint64_t v58 = v12;
  ASN1NodeCollection.Iterator.next()((uint64_t)&v42);
  if (!v50)
  {
    uint64_t v20 = v59;
    j__swift_unknownObjectRetain(v59, v9, v11, v10, v12, 0);
    j__swift_unknownObjectRetain(v20, v9, v11, v10, v12, 0);
    uint64_t v14 = v10;
    goto LABEL_13;
  }
  uint64_t v37 = v50;
  uint64_t v33 = v42;
  unsigned __int8 v34 = v44;
  uint64_t v35 = v43;
  uint64_t v36 = v45;
  char v38 = v46;
  uint64_t v39 = v47;
  char v40 = v48;
  char v41 = v49;
  uint64_t v31 = v52;
  uint64_t v32 = v51;
  uint64_t v22 = v53;
  ASN1NodeCollection.Iterator.next()((uint64_t)&v42);
  uint64_t v29 = v43;
  uint64_t v30 = v42;
  uint64_t v27 = v45;
  uint64_t v28 = v44;
  long long v25 = v47;
  uint64_t v26 = v46;
  uint64_t v13 = v50;
  unsigned __int8 v23 = v49;
  long long v24 = v48;
  uint64_t v14 = v10;
  uint64_t v15 = v12;
  char v16 = v11;
  uint64_t v17 = v9;
  uint64_t v18 = v59;
  j__swift_unknownObjectRetain(v59, v17, v16, v14, v15, 0);
  uint64_t v19 = v18;
  uint64_t v9 = v17;
  uint64_t v11 = v16;
  uint64_t v12 = v15;
  j__swift_unknownObjectRetain(v19, v9, v11, v14, v15, 0);
  sub_25E64EC20(v30, v29, v28, v27, v26, v25, v24, v23, v13);
  if (v13)
  {
    sub_25E64EC20(v33, v35, v34, v36, v38, v39, v40, v41, v37);
    uint64_t v20 = v59;
LABEL_13:
    sub_25E64EBC8();
    swift_allocError();
    static ASN1Error.invalidASN1Object(reason:file:line:)(0xD000000000000033, 0x800000025E66BCE0, (uint64_t)"SwiftASN1/ASN1.swift", 20, 2, 452, v21);
    swift_willThrow();
    j__swift_unknownObjectRelease(v20, v9, v11, v14, v12, 0);
    return swift_unknownObjectRelease();
  }
  uint64_t v42 = v33;
  LOBYTE(v43) = v35;
  uint64_t v44 = v34;
  uint64_t v45 = v36;
  uint64_t v46 = v38;
  uint64_t v47 = v39;
  uint64_t v48 = v40;
  LOBYTE(v49) = v41 & 1;
  uint64_t v50 = v37;
  uint64_t v51 = v32;
  uint64_t v52 = v31;
  uint64_t v53 = v22;
  a4(&v42);
  swift_unknownObjectRelease();
  j__swift_unknownObjectRelease(v59, v9, v11, v14, v15, 0);
  return sub_25E64EC20(v33, v35, v34, v36, v38, v39, v40, v41, v37);
}

uint64_t sub_25E6499C0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  v9[0] = a1;
  v9[1] = a2;
  uint64_t v10 = a3;
  unint64_t v11 = a4;
  swift_unknownObjectRetain();
  uint64_t v8 = sub_25E64EF58(0, 16, 0, MEMORY[0x263F8EE78]);
  uint64_t result = sub_25E649AEC(v9, 1, &v8);
  if (v4) {
    goto LABEL_6;
  }
  if (!__OFSUB__(v11 >> 1, v10))
  {
    if (v11 >> 1 == v10)
    {
      uint64_t v5 = v8;
      swift_unknownObjectRelease();
      return (uint64_t)v5;
    }
    sub_25E64EBC8();
    swift_allocError();
    static ASN1Error.invalidASN1Object(reason:file:line:)(0xD000000000000021, 0x800000025E66BD80, (uint64_t)"SwiftASN1/ASN1.swift", 20, 2, 479, v7);
    swift_willThrow();
LABEL_6:
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    return (uint64_t)v5;
  }
  __break(1u);
  return result;
}

uint64_t sub_25E649AEC(uint64_t *a1, uint64_t a2, char **a3)
{
  if (a2 > 50)
  {
    sub_25E64EBC8();
    swift_allocError();
    static ASN1Error.invalidASN1Object(reason:file:line:)(0xD000000000000021, 0x800000025E66BE00, (uint64_t)"SwiftASN1/ASN1.swift", 20, 2, 490, v4);
    return swift_willThrow();
  }
  uint64_t v7 = a1;
  uint64_t v8 = *a1;
  uint64_t v9 = a1[1];
  uint64_t v10 = a1[2];
  unint64_t v11 = a1[3];
  __int16 v12 = sub_25E664E84();
  if ((v12 & 0x100) != 0)
  {
    sub_25E64EBC8();
    swift_allocError();
    static ASN1Error.truncatedASN1Field(file:line:)((uint64_t)"SwiftASN1/ASN1.swift", 20, 2, 496, v21);
    return swift_willThrow();
  }
  uint64_t v64 = v9;
  unsigned int v13 = v12;
  unint64_t v14 = v12 & 0x1F;
  if (v14 == 31)
  {
    swift_unknownObjectRetain();
    sub_25E65EA14();
    if (v3) {
      return swift_unknownObjectRelease();
    }
    unint64_t v14 = v15;
    if (v15 <= 0x1E)
    {
      sub_25E64EBC8();
      swift_allocError();
      uint64_t v16 = 0xD00000000000002BLL;
      uint64_t v18 = v17;
      uint64_t v19 = 0x800000025E66BDD0;
      uint64_t v20 = 510;
LABEL_26:
      static ASN1Error.invalidASN1Object(reason:file:line:)(v16, v19, (uint64_t)"SwiftASN1/ASN1.swift", 20, 2, v20, v18);
      goto LABEL_27;
    }
  }
  else
  {
    swift_unknownObjectRetain();
  }
  sub_25E64A064();
  if (v3) {
    return swift_unknownObjectRelease();
  }
  if (v24)
  {
    sub_25E64EBC8();
    swift_allocError();
    static ASN1Error.truncatedASN1Field(file:line:)((uint64_t)"SwiftASN1/ASN1.swift", 20, 2, 518, v39);
LABEL_27:
    swift_willThrow();
    return swift_unknownObjectRelease();
  }
  if (v23 < 0)
  {
    sub_25E64EBC8();
    swift_allocError();
    uint64_t v18 = v40;
    uint64_t v16 = 0xD000000000000018;
    uint64_t v19 = 0x800000025E66BDB0;
    uint64_t v20 = 523;
    goto LABEL_26;
  }
  uint64_t v60 = *v7;
  int64_t v54 = v7[2];
  unint64_t v55 = v7[1];
  uint64_t v52 = v10;
  unint64_t v53 = v7[3];
  uint64_t v25 = v23;
  uint64_t v26 = sub_25E64A2E8(v23, *v7, v55, v54, v53);
  unint64_t v58 = v28;
  uint64_t v59 = v27;
  uint64_t v56 = v26;
  uint64_t v57 = v25;
  v61[0] = v26;
  v61[1] = v29;
  uint64_t v51 = v29;
  uint64_t v62 = v27;
  unint64_t v63 = v28;
  *uint64_t v7 = sub_25E64A364(v25, v60, v55, v54, v53);
  v7[1] = v30;
  v7[2] = v31;
  v7[3] = v32;
  uint64_t v33 = v58 >> 1;
  if (__OFSUB__(v58 >> 1, v59)) {
    goto LABEL_41;
  }
  uint64_t v25 = v52;
  if ((v58 >> 1) - v59 != v57)
  {
    sub_25E64EBC8();
    swift_allocError();
    static ASN1Error.truncatedASN1Field(file:line:)((uint64_t)"SwiftASN1/ASN1.swift", 20, 2, 530, v41);
    swift_unknownObjectRetain();
    swift_willThrow();
    swift_unknownObjectRelease();
    return swift_unknownObjectRelease();
  }
  if (v33 < v52) {
    goto LABEL_42;
  }
  if ((uint64_t)(v11 >> 1) < v52)
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  if (v11 >> 1 < v33)
  {
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  unint64_t v55 = v58 & 0xFFFFFFFFFFFFFFFELL | v11 & 1;
  if ((v13 & 0x20) != 0)
  {
    uint64_t v42 = *a3;
    swift_unknownObjectRetain_n();
    swift_unknownObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v42 = sub_25E64EF58(0, *((void *)v42 + 2) + 1, 1, v42);
    }
    unint64_t v44 = *((void *)v42 + 2);
    unint64_t v43 = *((void *)v42 + 3);
    unint64_t v45 = v44 + 1;
    uint64_t v46 = v57;
    if (v44 >= v43 >> 1)
    {
      uint64_t v50 = sub_25E64EF58((char *)(v43 > 1), v44 + 1, 1, v42);
      unint64_t v45 = v44 + 1;
      uint64_t v42 = v50;
      uint64_t v46 = v57;
    }
    *((void *)v42 + 2) = v45;
    uint64_t v47 = &v42[96 * v44];
    *((void *)v47 + 4) = v14;
    v47[40] = v13 >> 6;
    *((void *)v47 + 6) = a2;
    v47[56] = 1;
    uint64_t v48 = v64;
    *((void *)v47 + 8) = v8;
    *((void *)v47 + 9) = v48;
    *((void *)v47 + 10) = v52;
    *((void *)v47 + 11) = v55;
    *((_OWORD *)v47 + 6) = 0u;
    *((_OWORD *)v47 + 7) = 0u;
    *a3 = v42;
    if (!v46)
    {
      swift_unknownObjectRelease_n();
      return swift_unknownObjectRelease();
    }
    uint64_t v7 = (uint64_t *)(a2 + 1);
    while (1)
    {
      sub_25E649AEC(v61, a2 + 1, a3);
      if (__OFSUB__(v63 >> 1, v62)) {
        break;
      }
      if ((uint64_t)((v63 >> 1) - v62) <= 0)
      {
        swift_unknownObjectRelease_n();
        return swift_unknownObjectRelease();
      }
    }
    __break(1u);
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  uint64_t v7 = (uint64_t *)*a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
LABEL_45:
  }
    uint64_t v7 = (uint64_t *)sub_25E64EF58(0, v7[2] + 1, 1, (char *)v7);
  unint64_t v35 = v7[2];
  unint64_t v34 = v7[3];
  uint64_t v36 = v35 + 1;
  if (v35 >= v34 >> 1)
  {
    uint64_t v49 = sub_25E64EF58((char *)(v34 > 1), v35 + 1, 1, (char *)v7);
    uint64_t v36 = v35 + 1;
    uint64_t v7 = (uint64_t *)v49;
  }
  v7[2] = v36;
  uint64_t v37 = &v7[12 * v35];
  v37[4] = v14;
  *((unsigned char *)v37 + 40) = v13 >> 6;
  v37[6] = a2;
  *((unsigned char *)v37 + 56) = 0;
  uint64_t v38 = v64;
  v37[8] = v8;
  v37[9] = v38;
  v37[10] = v25;
  v37[11] = v55;
  v37[12] = v56;
  v37[13] = v51;
  v37[14] = v59;
  v37[15] = v58;
  swift_unknownObjectRelease();
  uint64_t result = swift_unknownObjectRelease();
  *a3 = (char *)v7;
  return result;
}

void sub_25E64A064()
{
  uint64_t v2 = v0[2];
  unint64_t v3 = v0[3];
  int64_t v4 = v3 >> 1;
  if (v2 == v3 >> 1) {
    return;
  }
  if (v2 >= v4)
  {
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v5 = *v0;
  uint64_t v6 = v0[1];
  int v7 = *(unsigned __int8 *)(v6 + v2);
  int64_t v8 = v2 + 1;
  v0[2] = v2 + 1;
  if (v7 == 128)
  {
    sub_25E64EBC8();
    swift_allocError();
    static ASN1Error.unsupportedFieldLength(reason:file:line:)(0xD000000000000035, 0x800000025E66BEC0, (uint64_t)"SwiftASN1/ASN1.swift", 20, 2, 1149, v9);
    swift_willThrow();
    return;
  }
  if ((v7 & 0x80) != 0)
  {
    BOOL v10 = __OFSUB__(v4, v8);
    int64_t v11 = v4 - v8;
    if (!v10)
    {
      unint64_t v12 = v7 & 0x7F;
      if (v11 < (uint64_t)v12) {
        return;
      }
      sub_25E64A2E8(v7 & 0x7F, v5, v6, v2 + 1, v3);
      uint64_t v29 = v13;
      uint64_t v15 = v14;
      unint64_t v28 = v16;
      uint64_t *v0 = sub_25E64A364(v12, v5, v6, v8, v3);
      v0[1] = v17;
      v0[2] = v18;
      v0[3] = v19;
      swift_unknownObjectRetain();
      uint64_t v20 = swift_unknownObjectRetain();
      sub_25E652EEC(v20, v29, v15, v28);
      if (!v1)
      {
        if (v21 <= 0x7F)
        {
          sub_25E64EBC8();
          swift_allocError();
          uint64_t v24 = 0xD00000000000004FLL;
          uint64_t v23 = v27;
          uint64_t v25 = 0x800000025E66BE30;
          uint64_t v26 = 1168;
        }
        else
        {
          if (v12 <= (71 - __clz(v21)) >> 3) {
            goto LABEL_15;
          }
          sub_25E64EBC8();
          swift_allocError();
          uint64_t v23 = v22;
          uint64_t v24 = 0xD000000000000031;
          uint64_t v25 = 0x800000025E66BE80;
          uint64_t v26 = 1173;
        }
        static ASN1Error.unsupportedFieldLength(reason:file:line:)(v24, v25, (uint64_t)"SwiftASN1/ASN1.swift", 20, 2, v26, v23);
        swift_willThrow();
      }
LABEL_15:
      swift_unknownObjectRelease();
      return;
    }
LABEL_18:
    __break(1u);
  }
}

uint64_t sub_25E64A2E8(uint64_t result, uint64_t a2, uint64_t a3, int64_t a4, unint64_t a5)
{
  if (result < 0)
  {
    __break(1u);
    goto LABEL_13;
  }
  int64_t v5 = a5 >> 1;
  uint64_t v6 = (a5 >> 1) - a4;
  if (__OFSUB__(a5 >> 1, a4))
  {
LABEL_13:
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (!result || v6 < 0 || (int64_t v7 = a5 >> 1, v6 >= result))
  {
    int64_t v7 = a4 + result;
    if (__OFADD__(a4, result)) {
      goto LABEL_18;
    }
  }
  if (v7 < a4) {
    goto LABEL_14;
  }
  if (v5 < a4)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (v5 >= v7)
  {
    if ((v7 & 0x8000000000000000) == 0) {
      return a2;
    }
    goto LABEL_17;
  }
LABEL_16:
  __break(1u);
LABEL_17:
  __break(1u);
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_25E64A364(uint64_t result, uint64_t a2, uint64_t a3, int64_t a4, unint64_t a5)
{
  if (result < 0)
  {
    __break(1u);
    goto LABEL_12;
  }
  int64_t v5 = a5 >> 1;
  uint64_t v6 = (a5 >> 1) - a4;
  if (__OFSUB__(a5 >> 1, a4))
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (result)
  {
    if ((v6 & 0x8000000000000000) == 0)
    {
      int64_t v7 = a5 >> 1;
      if (v6 < result)
      {
LABEL_8:
        if (v7 >= a4)
        {
          if (v5 >= a4) {
            return a2;
          }
          goto LABEL_15;
        }
LABEL_14:
        __break(1u);
LABEL_15:
        __break(1u);
        goto LABEL_16;
      }
    }
  }
  int64_t v7 = a4 + result;
  if (!__OFADD__(a4, result))
  {
    if (v5 >= v7) {
      goto LABEL_8;
    }
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
LABEL_16:
  __break(1u);
  return result;
}

uint64_t sub_25E64A3D4()
{
  uint64_t v1 = v0[1];
  uint64_t v2 = v0[2];
  unint64_t v3 = v0[3];
  sub_25E6699C0();
  sub_25E65030C((uint64_t)v5, v1, v2, v3);
  return sub_25E669A00();
}

uint64_t sub_25E64A430(uint64_t a1)
{
  return sub_25E65030C(a1, *(void *)(v1 + 8), *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_25E64A43C()
{
  uint64_t v1 = v0[1];
  uint64_t v2 = v0[2];
  unint64_t v3 = v0[3];
  sub_25E6699C0();
  sub_25E65030C((uint64_t)v5, v1, v2, v3);
  return sub_25E669A00();
}

uint64_t sub_25E64A494(uint64_t a1, uint64_t a2)
{
  return sub_25E64F4EC(*(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a2 + 8), *(void *)(a2 + 16), *(void *)(a2 + 24));
}

uint64_t static DER.parse(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = a1 + 32;
  unint64_t v4 = (2 * *(void *)(a1 + 16)) | 1;
  uint64_t v5 = swift_bridgeObjectRetain();
  static DER.parse(_:)(v5, v3, 0, v4, a2);
  return swift_bridgeObjectRelease();
}

uint64_t static DER.parse(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t result = sub_25E6499C0(a1, a2, a3, a4);
  if (!v5)
  {
    unint64_t v11 = v10;
    unint64_t v12 = v10 >> 1;
    if (v9 == v10 >> 1)
    {
      __break(1u);
    }
    else if (v9 < (uint64_t)(v10 >> 1))
    {
      uint64_t v13 = result;
      uint64_t v14 = v8;
      uint64_t v15 = (long long *)(v8 + 96 * v9);
      long long v16 = v15[1];
      long long v44 = *v15;
      long long v45 = v16;
      long long v17 = v15[2];
      long long v18 = v15[3];
      long long v19 = v15[5];
      v48[0] = v15[4];
      v48[1] = v19;
      long long v46 = v17;
      long long v47 = v18;
      int64_t v20 = v9 + 1;
      int v51 = BYTE8(v45);
      if (BYTE8(v45))
      {
        sub_25E650478(result, v8, v9 + 1, v10, (uint64_t)&v44);
        uint64_t v41 = v29;
        uint64_t result = (v28 >> 1) - v27;
        if (__OFSUB__(v28 >> 1, v27))
        {
LABEL_17:
          __break(1u);
          goto LABEL_18;
        }
        uint64_t v30 = v26;
        uint64_t v31 = v27;
        unint64_t v32 = v28;
        sub_25E64A364(result, v13, v14, v20, v11);
        unint64_t v37 = v33;
        int64_t v20 = v34;
        sub_25E64A734(v41, v30, v31, v32, v45, v42);
        uint64_t v21 = v42[0];
        uint64_t v39 = v42[1];
        uint64_t v22 = v42[2];
        long long v38 = v43;
        long long v40 = v46;
        uint64_t v24 = *((void *)&v47 + 1);
        uint64_t v25 = v47;
        swift_unknownObjectRetain();
        swift_unknownObjectRetain();
        uint64_t result = swift_unknownObjectRelease();
        unint64_t v12 = v37 >> 1;
      }
      else
      {
        sub_25E64EC84((uint64_t)v48, (uint64_t)v49);
        uint64_t result = sub_25E64EC84((uint64_t)v49, (uint64_t)v50);
        uint64_t v21 = v50[0];
        if (!v50[0])
        {
LABEL_18:
          __break(1u);
          return result;
        }
        uint64_t v22 = v50[2];
        uint64_t v39 = v50[1];
        *((void *)&v23 + 1) = *((void *)&v46 + 1);
        long long v40 = v46;
        uint64_t v24 = *((void *)&v47 + 1);
        uint64_t v25 = v47;
        *(void *)&long long v23 = v50[3];
        long long v38 = v23;
        sub_25E64ED30((uint64_t)v49);
        swift_unknownObjectRetain();
        uint64_t result = swift_unknownObjectRelease();
      }
      if (!__OFSUB__(v12, v20))
      {
        if (v12 == v20)
        {
          char v35 = BYTE8(v44);
          BOOL v36 = (v51 & 1) == 0;
          *(void *)a5 = v44;
          *(unsigned char *)(a5 + 8) = v35;
          *(void *)(a5 + 16) = v21;
          *(void *)(a5 + 24) = v39;
          *(void *)(a5 + 32) = v22;
          *(_OWORD *)(a5 + 40) = v38;
          *(unsigned char *)(a5 + 56) = v36;
          *(_OWORD *)(a5 + 64) = v40;
          *(void *)(a5 + 80) = v25;
          *(void *)(a5 + 88) = v24;
          return result;
        }
        goto LABEL_16;
      }
LABEL_15:
      __break(1u);
LABEL_16:
      __break(1u);
      goto LABEL_17;
    }
    __break(1u);
    goto LABEL_15;
  }
  return result;
}

uint64_t sub_25E64A734@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  int64_t v6 = a4 >> 1;
  if (a4 >> 1 == a3)
  {
LABEL_7:
    *a6 = result;
    a6[1] = a2;
    a6[2] = a3;
    a6[3] = a4;
    a6[4] = a5;
  }
  else
  {
    int64_t v7 = (void *)(a2 + 96 * a3 + 16);
    uint64_t v8 = a3;
    do
    {
      if (v8 >= v6)
      {
        __break(1u);
LABEL_9:
        __break(1u);
        goto LABEL_10;
      }
      if (*v7 <= a5) {
        goto LABEL_9;
      }
      ++v8;
      v7 += 12;
    }
    while (v6 != v8);
    if (*(void *)(a2 + 96 * a3 + 16) == a5 + 1) {
      goto LABEL_7;
    }
LABEL_10:
    __break(1u);
  }
  return result;
}

uint64_t ASN1NodeCollection.hash(into:)(uint64_t a1)
{
  sub_25E65030C(a1, *(void *)(v1 + 8), *(void *)(v1 + 16), *(void *)(v1 + 24));
  return sub_25E6699D0();
}

uint64_t static ASN1NodeCollection.== infix(_:_:)(void *a1, void *a2)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a2[4];
  return sub_25E64F4EC(a1[1], a1[2], a1[3], a2[1], a2[2], a2[3]) & (v2 == v3);
}

uint64_t ASN1NodeCollection.hashValue.getter()
{
  uint64_t v1 = v0[1];
  uint64_t v2 = v0[2];
  unint64_t v3 = v0[3];
  sub_25E6699C0();
  sub_25E65030C((uint64_t)v5, v1, v2, v3);
  sub_25E6699D0();
  return sub_25E669A00();
}

uint64_t sub_25E64A894()
{
  uint64_t v1 = v0[1];
  uint64_t v2 = v0[2];
  unint64_t v3 = v0[3];
  sub_25E6699C0();
  sub_25E65030C((uint64_t)v5, v1, v2, v3);
  sub_25E6699D0();
  return sub_25E669A00();
}

uint64_t sub_25E64A904(uint64_t a1)
{
  sub_25E65030C(a1, *(void *)(v1 + 8), *(void *)(v1 + 16), *(void *)(v1 + 24));
  return sub_25E6699D0();
}

uint64_t sub_25E64A93C()
{
  uint64_t v1 = v0[1];
  uint64_t v2 = v0[2];
  unint64_t v3 = v0[3];
  sub_25E6699C0();
  sub_25E65030C((uint64_t)v5, v1, v2, v3);
  sub_25E6699D0();
  return sub_25E669A00();
}

uint64_t sub_25E64A9A8(void *a1, void *a2)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a2[4];
  return sub_25E64F4EC(a1[1], a1[2], a1[3], a2[1], a2[2], a2[3]) & (v2 == v3);
}

__n128 sub_25E64A9F0@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 32);
  __n128 result = *(__n128 *)v1;
  long long v4 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v1;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = v2;
  return result;
}

uint64_t sub_25E64AA04()
{
  return 0;
}

uint64_t sub_25E64AA0C()
{
  return 2;
}

char *sub_25E64AA14()
{
  long long v1 = *(_OWORD *)(v0 + 16);
  v4[0] = *(_OWORD *)v0;
  v4[1] = v1;
  uint64_t v5 = *(void *)(v0 + 32);
  uint64_t v2 = sub_25E659ADC((char *)v4);
  sub_25E652A9C((uint64_t)v4);
  return v2;
}

uint64_t sub_25E64AA60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25E65D824(a1, a2, a3);
}

uint64_t sub_25E64AA9C()
{
  return sub_25E669670();
}

void ASN1Node.identifier.getter(uint64_t a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 8);
  *(void *)a1 = *(void *)v1;
  *(unsigned char *)(a1 + 8) = v2;
}

uint64_t ASN1Node.identifier.setter(uint64_t result)
{
  char v2 = *(unsigned char *)(result + 8);
  *(void *)uint64_t v1 = *(void *)result;
  *(unsigned char *)(v1 + 8) = v2;
  return result;
}

uint64_t (*ASN1Node.identifier.modify())()
{
  return nullsub_1;
}

uint64_t ASN1Node.content.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 24);
  uint64_t v3 = *(void *)(v1 + 32);
  uint64_t v4 = *(void *)(v1 + 40);
  uint64_t v5 = *(void *)(v1 + 48);
  char v6 = *(unsigned char *)(v1 + 56);
  *(void *)a1 = *(void *)(v1 + 16);
  *(void *)(a1 + 8) = v2;
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = v5;
  *(unsigned char *)(a1 + 40) = v6;
  return j__swift_unknownObjectRetain();
}

__n128 ASN1Node.content.setter(long long *a1)
{
  __n128 v5 = (__n128)a1[1];
  long long v6 = *a1;
  uint64_t v2 = *((void *)a1 + 4);
  char v3 = *((unsigned char *)a1 + 40);
  j__swift_unknownObjectRelease(*(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(unsigned __int8 *)(v1 + 56));
  __n128 result = v5;
  *(_OWORD *)(v1 + 16) = v6;
  *(__n128 *)(v1 + 32) = v5;
  *(void *)(v1 + 48) = v2;
  *(unsigned char *)(v1 + 56) = v3;
  return result;
}

uint64_t (*ASN1Node.content.modify())()
{
  return nullsub_1;
}

uint64_t ASN1Node.encodedBytes.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t ASN1Node.encodedBytes.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = swift_unknownObjectRelease();
  v4[8] = a1;
  v4[9] = a2;
  v4[10] = a3;
  v4[11] = a4;
  return result;
}

uint64_t (*ASN1Node.encodedBytes.modify())()
{
  return nullsub_1;
}

uint64_t ASN1Node.hash(into:)(uint64_t a1)
{
  uint64_t v3 = v1[9];
  uint64_t v4 = v1[10];
  unint64_t v5 = v1[11];
  sub_25E6699D0();
  sub_25E6699D0();
  ASN1Node.Content.hash(into:)(a1);
  unint64_t v6 = v5 >> 1;
  uint64_t result = (v5 >> 1) - v4;
  if (__OFSUB__(v5 >> 1, v4))
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t result = sub_25E6699D0();
  BOOL v8 = __OFSUB__(v6, v4);
  uint64_t v9 = v6 - v4;
  if (!v9) {
    return result;
  }
  if ((v9 < 0) ^ v8 | (v9 == 0))
  {
LABEL_8:
    __break(1u);
    return result;
  }
  uint64_t v10 = v3 + v4;
  do
  {
    ++v10;
    uint64_t result = sub_25E6699E0();
    --v9;
  }
  while (v9);
  return result;
}

uint64_t ASN1Node.hashValue.getter()
{
  char v1 = *((unsigned char *)v0 + 8);
  uint64_t v2 = v0[6];
  char v3 = *((unsigned char *)v0 + 56);
  uint64_t v8 = *v0;
  char v9 = v1;
  long long v4 = *((_OWORD *)v0 + 2);
  long long v10 = *((_OWORD *)v0 + 1);
  long long v11 = v4;
  uint64_t v12 = v2;
  char v13 = v3;
  long long v5 = *((_OWORD *)v0 + 5);
  long long v14 = *((_OWORD *)v0 + 4);
  long long v15 = v5;
  sub_25E6699C0();
  ASN1Node.hash(into:)((uint64_t)v7);
  return sub_25E669A00();
}

uint64_t sub_25E64ADB4()
{
  char v1 = *((unsigned char *)v0 + 8);
  uint64_t v2 = v0[6];
  char v3 = *((unsigned char *)v0 + 56);
  uint64_t v8 = *v0;
  char v9 = v1;
  long long v4 = *((_OWORD *)v0 + 2);
  long long v10 = *((_OWORD *)v0 + 1);
  long long v11 = v4;
  uint64_t v12 = v2;
  char v13 = v3;
  long long v5 = *((_OWORD *)v0 + 5);
  long long v14 = *((_OWORD *)v0 + 4);
  long long v15 = v5;
  sub_25E6699C0();
  ASN1Node.hash(into:)((uint64_t)v7);
  return sub_25E669A00();
}

uint64_t sub_25E64AE30()
{
  char v1 = *((unsigned char *)v0 + 8);
  uint64_t v2 = v0[6];
  char v3 = *((unsigned char *)v0 + 56);
  uint64_t v8 = *v0;
  char v9 = v1;
  long long v4 = *((_OWORD *)v0 + 2);
  long long v10 = *((_OWORD *)v0 + 1);
  long long v11 = v4;
  uint64_t v12 = v2;
  char v13 = v3;
  long long v5 = *((_OWORD *)v0 + 5);
  long long v14 = *((_OWORD *)v0 + 4);
  long long v15 = v5;
  sub_25E6699C0();
  ASN1Node.hash(into:)((uint64_t)v7);
  return sub_25E669A00();
}

uint64_t ASN1Node.Content.hash(into:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(v2 + 8);
  uint64_t v5 = *(void *)(v2 + 16);
  unint64_t v6 = *(void *)(v2 + 24);
  if ((*(unsigned char *)(v2 + 40) & 1) == 0)
  {
    sub_25E6699D0();
    sub_25E65030C(a1, v4, v5, v6);
    return sub_25E6699D0();
  }
  sub_25E6699D0();
  unint64_t v7 = v6 >> 1;
  uint64_t result = v7 - v5;
  if (__OFSUB__(v7, v5))
  {
    __break(1u);
    goto LABEL_11;
  }
  uint64_t result = sub_25E6699D0();
  BOOL v9 = __OFSUB__(v7, v5);
  uint64_t v10 = v7 - v5;
  if (!v10) {
    return result;
  }
  if ((v10 < 0) ^ v9 | (v10 == 0))
  {
LABEL_11:
    __break(1u);
    return result;
  }
  uint64_t v11 = v4 + v5;
  do
  {
    ++v11;
    uint64_t result = sub_25E6699E0();
    --v10;
  }
  while (v10);
  return result;
}

uint64_t ASN1Node.Content.hashValue.getter()
{
  uint64_t v1 = *((void *)v0 + 4);
  char v2 = *((unsigned char *)v0 + 40);
  long long v3 = v0[1];
  long long v6 = *v0;
  long long v7 = v3;
  uint64_t v8 = v1;
  char v9 = v2;
  sub_25E6699C0();
  ASN1Node.Content.hash(into:)((uint64_t)v5);
  return sub_25E669A00();
}

uint64_t sub_25E64AFB4()
{
  uint64_t v1 = *((void *)v0 + 4);
  char v2 = *((unsigned char *)v0 + 40);
  long long v3 = v0[1];
  long long v6 = *v0;
  long long v7 = v3;
  uint64_t v8 = v1;
  char v9 = v2;
  sub_25E6699C0();
  ASN1Node.Content.hash(into:)((uint64_t)v5);
  return sub_25E669A00();
}

uint64_t sub_25E64B014()
{
  uint64_t v1 = *((void *)v0 + 4);
  char v2 = *((unsigned char *)v0 + 40);
  long long v3 = v0[1];
  long long v6 = *v0;
  long long v7 = v3;
  uint64_t v8 = v1;
  char v9 = v2;
  sub_25E6699C0();
  ASN1Node.Content.hash(into:)((uint64_t)v5);
  return sub_25E669A00();
}

uint64_t DER.Serializer.serializedBytes.getter()
{
  return swift_bridgeObjectRetain();
}

char *DER.Serializer.init()@<X0>(char **a1@<X8>)
{
  uint64_t result = sub_25E64EE6C(0, 1024, 0, MEMORY[0x263F8EE78]);
  *a1 = result;
  return result;
}

uint64_t DER.Serializer.appendPrimitiveNode(identifier:_:)(uint64_t a1, uint64_t (*a2)(char **))
{
  char v3 = *(unsigned char *)(a1 + 8);
  uint64_t v5 = *(void *)a1;
  char v6 = v3;
  return sub_25E65054C(&v5, 0, v2, a2);
}

uint64_t sub_25E64B0F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25E651BD0(a4);
}

uint64_t sub_25E64B12C(uint64_t *a1, char a2, uint64_t *a3)
{
  char v6 = *((unsigned char *)a1 + 8);
  uint64_t v15 = *a1;
  char v16 = v6;
  sub_25E668C38((uint64_t)&v15, a2);
  uint64_t v7 = *a3;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0) {
    goto LABEL_29;
  }
  while (1)
  {
    unint64_t v10 = *(void *)(v7 + 16);
    unint64_t v9 = *(void *)(v7 + 24);
    unint64_t v11 = v10 + 1;
    if (v10 >= v9 >> 1)
    {
      uint64_t result = (uint64_t)sub_25E64EE6C((char *)(v9 > 1), v10 + 1, 1, (char *)v7);
      uint64_t v7 = result;
    }
    *(void *)(v7 + 16) = v11;
    *(unsigned char *)(v7 + 32 + v10) = 0;
    *a3 = v7;
    unint64_t v12 = *(void *)(v7 + 16);
    unint64_t v13 = v12 - v11;
    if ((uint64_t)(v12 - v11) < 128) {
      break;
    }
    if (v12 <= v10)
    {
      __break(1u);
    }
    else
    {
      unint64_t v4 = 71 - __clz(v13);
      unint64_t v3 = v4 >> 3;
      sub_25E64C9F0(v4 >> 3, v10 + 1, v12);
      uint64_t v7 = *a3;
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if (result) {
        goto LABEL_7;
      }
    }
    uint64_t result = (uint64_t)sub_25E65A138(v7);
    uint64_t v7 = result;
LABEL_7:
    if (v10 >= *(void *)(v7 + 16))
    {
      __break(1u);
      goto LABEL_33;
    }
    uint64_t v14 = v7 + 32;
    *(unsigned char *)(v7 + 32 + v10) = (v4 >> 3) | 0x80;
    *a3 = v7;
    if (v10 + 1 < *(void *)(v7 + 16))
    {
      *(unsigned char *)(v14 + v10 + 1) = v13 >> (8 * ((v3 - 1) & 7));
      if (v3 == 1) {
        goto LABEL_27;
      }
      if (v10 + 2 < *(void *)(v7 + 16))
      {
        *(unsigned char *)(v14 + v10 + 2) = v13 >> (8 * ((v3 - 2) & 7));
        if (v3 == 2) {
          goto LABEL_27;
        }
        if (v10 + 3 < *(void *)(v7 + 16))
        {
          *(unsigned char *)(v14 + v10 + 3) = v13 >> (8 * ((v3 - 3) & 7));
          if (v3 == 3) {
            goto LABEL_27;
          }
          if (v10 + 4 < *(void *)(v7 + 16))
          {
            *(unsigned char *)(v14 + v10 + 4) = v13 >> (8 * ((v3 - 4) & 7));
            if (v3 == 4) {
              goto LABEL_27;
            }
            if (v10 + 5 < *(void *)(v7 + 16))
            {
              *(unsigned char *)(v14 + v10 + 5) = v13 >> (8 * ((v3 - 5) & 7));
              if (v3 == 5) {
                goto LABEL_27;
              }
              if (v10 + 6 < *(void *)(v7 + 16))
              {
                *(unsigned char *)(v14 + v10 + 6) = v13 >> (8 * ((v3 - 6) & 7));
                if (v3 == 6) {
                  goto LABEL_27;
                }
                if (v10 + 7 < *(void *)(v7 + 16))
                {
                  *(unsigned char *)(v14 + v10 + 7) = v13 >> (8 * ((v3 - 7) & 7));
                  if (v3 == 7) {
                    goto LABEL_27;
                  }
                  if (v10 + 8 < *(void *)(v7 + 16))
                  {
                    *(unsigned char *)(v14 + v10 + 8) = v13 >> (v4 & 0x38);
LABEL_27:
                    *a3 = v7;
                    return result;
                  }
                }
              }
            }
          }
        }
      }
    }
    __break(1u);
LABEL_29:
    uint64_t result = (uint64_t)sub_25E64EE6C(0, *(void *)(v7 + 16) + 1, 1, (char *)v7);
    uint64_t v7 = result;
  }
  if ((v13 & 0x8000000000000000) != 0)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  if (v10 < v12)
  {
    *(unsigned char *)(v7 + 32 + v10) = v13;
    goto LABEL_27;
  }
LABEL_34:
  __break(1u);
  return result;
}

uint64_t sub_25E64B3B4(uint64_t *a1, char a2, uint64_t (*a3)(char **))
{
  char v6 = v3;
  char v8 = *((unsigned char *)a1 + 8);
  uint64_t v17 = *a1;
  char v18 = v8;
  sub_25E668C38((uint64_t)&v17, a2);
  unint64_t v9 = *v3;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    goto LABEL_32;
  }
  while (1)
  {
    unint64_t v11 = *((void *)v9 + 2);
    unint64_t v10 = *((void *)v9 + 3);
    unint64_t v12 = v11 + 1;
    if (v11 >= v10 >> 1) {
      unint64_t v9 = sub_25E64EE6C((char *)(v10 > 1), v11 + 1, 1, v9);
    }
    *((void *)v9 + 2) = v12;
    v9[v11 + 32] = 0;
    *char v6 = v9;
    uint64_t result = a3(v6);
    if (v4) {
      return result;
    }
    unint64_t v9 = *v6;
    unint64_t v14 = *((void *)*v6 + 2);
    unint64_t v15 = v14 - v12;
    if ((uint64_t)(v14 - v12) <= 127) {
      break;
    }
    if (v14 <= v11)
    {
      __break(1u);
    }
    else
    {
      unint64_t v5 = 71 - __clz(v15);
      a3 = (uint64_t (*)(char **))(v5 >> 3);
      sub_25E64C9F0(v5 >> 3, v11 + 1, v14);
      unint64_t v9 = *v6;
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if (result) {
        goto LABEL_8;
      }
    }
    uint64_t result = (uint64_t)sub_25E65A138((uint64_t)v9);
    unint64_t v9 = (char *)result;
LABEL_8:
    if (v11 >= *((void *)v9 + 2))
    {
      __break(1u);
      goto LABEL_36;
    }
    char v16 = v9 + 32;
    v9[v11 + 32] = (v5 >> 3) | 0x80;
    *char v6 = v9;
    if (v11 + 1 < *((void *)v9 + 2))
    {
      v16[v11 + 1] = v15 >> (8 * (((_BYTE)a3 - 1) & 7u));
      if (a3 == (uint64_t (*)(char **))1) {
        goto LABEL_29;
      }
      if (v11 + 2 < *((void *)v9 + 2))
      {
        v16[v11 + 2] = v15 >> (8 * (((_BYTE)a3 - 2) & 7u));
        if (a3 == (uint64_t (*)(char **))2) {
          goto LABEL_29;
        }
        if (v11 + 3 < *((void *)v9 + 2))
        {
          v16[v11 + 3] = v15 >> (8 * (((_BYTE)a3 - 3) & 7u));
          if (a3 == (uint64_t (*)(char **))3) {
            goto LABEL_29;
          }
          if (v11 + 4 < *((void *)v9 + 2))
          {
            v16[v11 + 4] = v15 >> (8 * (((_BYTE)a3 - 4) & 7u));
            if (a3 == (uint64_t (*)(char **))4) {
              goto LABEL_29;
            }
            if (v11 + 5 < *((void *)v9 + 2))
            {
              v16[v11 + 5] = v15 >> (8 * (((_BYTE)a3 - 5) & 7u));
              if (a3 == (uint64_t (*)(char **))5) {
                goto LABEL_29;
              }
              if (v11 + 6 < *((void *)v9 + 2))
              {
                v16[v11 + 6] = v15 >> (8 * (((_BYTE)a3 - 6) & 7u));
                if (a3 == (uint64_t (*)(char **))6) {
                  goto LABEL_29;
                }
                if (v11 + 7 < *((void *)v9 + 2))
                {
                  v16[v11 + 7] = v15 >> (8 * (((_BYTE)a3 - 7) & 7u));
                  if (a3 == (uint64_t (*)(char **))7) {
                    goto LABEL_29;
                  }
                  if (v11 + 8 < *((void *)v9 + 2))
                  {
                    v16[v11 + 8] = v15 >> (v5 & 0x38);
LABEL_29:
                    *char v6 = v9;
                    return result;
                  }
                }
              }
            }
          }
        }
      }
    }
    __break(1u);
LABEL_32:
    unint64_t v9 = sub_25E64EE6C(0, *((void *)v9 + 2) + 1, 1, v9);
  }
  if ((v15 & 0x8000000000000000) != 0)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (result) {
    goto LABEL_27;
  }
LABEL_37:
  uint64_t result = (uint64_t)sub_25E65A138((uint64_t)v9);
  unint64_t v9 = (char *)result;
LABEL_27:
  if (v11 < *((void *)v9 + 2))
  {
    v9[v11 + 32] = v15;
    goto LABEL_29;
  }
  __break(1u);
  return result;
}

uint64_t DER.Serializer.appendConstructedNode(identifier:_:)(uint64_t a1, uint64_t (*a2)(char **))
{
  char v2 = *(unsigned char *)(a1 + 8);
  uint64_t v4 = *(void *)a1;
  char v5 = v2;
  return sub_25E64B3B4(&v4, 1, a2);
}

uint64_t DER.Serializer.serialize<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t))(a3 + 8))(v3);
}

uint64_t DER.Serializer.serialize<A>(_:explicitlyTaggedWithTagNumber:tagClass:)(uint64_t a1, uint64_t a2, char *a3)
{
  char v3 = *a3;
  uint64_t v5 = a2;
  char v6 = v3;
  return sub_25E64B3B4(&v5, 1, (uint64_t (*)(char **))sub_25E650514);
}

uint64_t DER.Serializer.serialize<A>(_:explicitlyTaggedWithIdentifier:)(uint64_t a1, uint64_t a2)
{
  char v2 = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void *)a2;
  char v5 = v2;
  return sub_25E64B3B4(&v4, 1, (uint64_t (*)(char **))sub_25E650514);
}

uint64_t DER.Serializer.serializeOptionalImplicitlyTagged<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25E669790();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  unint64_t v10 = (char *)v15 - v9;
  uint64_t v11 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](v8);
  unint64_t v13 = (char *)v15 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, a1, v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v10, 1, a2) == 1) {
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v13, v10, a2);
  (*(void (**)(void, uint64_t, uint64_t))(a3 + 8))(v15[1], a2, a3);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, a2);
}

uint64_t DER.Serializer.serializeOptionalImplicitlyTagged<A>(_:withIdentifier:)(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v19 = a4;
  uint64_t v7 = sub_25E669790();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v18 - v10;
  uint64_t v12 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](v9);
  unint64_t v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *a2;
  char v16 = *((unsigned char *)a2 + 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, a1, v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v11, 1, a3) == 1) {
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v11, a3);
  uint64_t v20 = v15;
  char v21 = v16;
  (*(void (**)(uint64_t, uint64_t *, uint64_t))(v19 + 40))(v18, &v20, a3);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, a3);
}

uint64_t DER.Serializer.serialize(explicitlyTaggedWithTagNumber:tagClass:_:)(uint64_t a1, char *a2, uint64_t (*a3)(char **))
{
  char v4 = *a2;
  uint64_t v6 = a1;
  char v7 = v4;
  return sub_25E65054C(&v6, 1, v3, a3);
}

uint64_t DER.Serializer.serializeSequenceOf<A>(_:identifier:)(uint64_t a1, uint64_t a2)
{
  char v2 = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void *)a2;
  char v5 = v2;
  return sub_25E64B3B4(&v4, 1, (uint64_t (*)(char **))sub_25E650828);
}

uint64_t sub_25E64BC68(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, uint64_t a5)
{
  uint64_t v30 = a1;
  uint64_t v31 = a5;
  uint64_t v33 = a2;
  unint64_t v32 = a4;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v29 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v9 = (char *)&v25 - v8;
  uint64_t v10 = sub_25E669790();
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v13 = (char *)&v25 - v12;
  uint64_t v14 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](v11);
  char v16 = (char *)&v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = swift_getAssociatedTypeWitness();
  uint64_t v26 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)&v25 - v18;
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, v33, a3);
  sub_25E669640();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  unint64_t v32 = v19;
  uint64_t v33 = v17;
  sub_25E6697A0();
  uint64_t v21 = v29;
  uint64_t v22 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48);
  if (v22(v13, 1, AssociatedTypeWitness) != 1)
  {
    uint64_t v27 = v22;
    uint64_t v28 = AssociatedConformanceWitness;
    uint64_t v29 = *(void *)(v21 + 32);
    long long v23 = (void (**)(char *, uint64_t))(v21 + 8);
    while (1)
    {
      ((void (*)(char *, char *, uint64_t))v29)(v9, v13, AssociatedTypeWitness);
      (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v30, AssociatedTypeWitness);
      if (v5) {
        break;
      }
      (*v23)(v9, AssociatedTypeWitness);
      sub_25E6697A0();
      if (v27(v13, 1, AssociatedTypeWitness) == 1) {
        return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v32, v33);
      }
    }
    (*v23)(v9, AssociatedTypeWitness);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v32, v33);
}

uint64_t DER.Serializer.serializeSetOf<A>(_:identifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char v7 = v5;
  uint64_t v11 = *(char **)a2;
  char v12 = *(unsigned char *)(a2 + 8);
  uint64_t v22 = sub_25E64EE6C(0, 1024, 0, MEMORY[0x263F8EE78]);
  v19[2] = a3;
  v19[3] = a4;
  v19[4] = a5;
  v19[5] = &v22;
  uint64_t v13 = (char *)__swift_instantiateConcreteTypeFromMangledName(&qword_26B38DC70);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B38DCA0);
  uint64_t v15 = (char *)sub_25E646E28((void (*)(char *, char *))sub_25E650848, (uint64_t)v19, a3, v13, v14, a4, MEMORY[0x263F8E4E0], (uint64_t)&v20);
  if (v6) {
    return swift_bridgeObjectRelease();
  }
  unint64_t v17 = (unint64_t)v22;
  uint64_t v20 = v15;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  sub_25E651AD0(&v20, v17);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v18 = (uint64_t *)v20;
  uint64_t v20 = v11;
  char v21 = v12;
  sub_25E65086C((uint64_t *)&v20, 1, v7, v18, v17);
  swift_release();
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_25E64C1AC@<X0>(uint64_t a1@<X1>, uint64_t a2@<X4>, void *a3@<X5>, unint64_t *a4@<X8>)
{
  unint64_t v9 = *(void *)(*(void *)a1 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a2 + 8))(a1, AssociatedTypeWitness, a2);
  if (v4)
  {
    *a3 = v4;
  }
  else
  {
    unint64_t v12 = *(void *)(*(void *)a1 + 16);
    if (v12 < v9)
    {
      __break(1u);
    }
    else
    {
      *a4 = v9;
      a4[1] = v12;
    }
  }
  return result;
}

void sub_25E64C26C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, int64_t a7, unint64_t a8)
{
  int64_t v8 = a4 >> 1;
  if (a4 >> 1 == a3) {
    goto LABEL_4;
  }
  if ((uint64_t)(a4 >> 1) <= a3) {
    goto LABEL_34;
  }
  int64_t v9 = a8 >> 1;
  if (a8 >> 1 == a7)
  {
LABEL_4:
    if (!__OFSUB__(v8, a3))
    {
      sub_25E64A364(v8 - a3, a5, a6, a7, a8);
      int64_t v13 = v12 >> 1;
      if (v11 == v12 >> 1)
      {
LABEL_20:
        swift_unknownObjectRetain();
        swift_unknownObjectRelease();
        return;
      }
      if (v11 >= (uint64_t)(v12 >> 1)) {
        goto LABEL_35;
      }
      if (*(unsigned char *)(v10 + v11) || v11 + 1 == v13) {
        goto LABEL_20;
      }
      while (v11 + 1 < v13)
      {
        if (*(unsigned char *)(v10 + 1 + v11)) {
          BOOL v16 = 1;
        }
        else {
          BOOL v16 = v13 - 2 == v11;
        }
        ++v11;
        if (v16) {
          goto LABEL_20;
        }
      }
      __break(1u);
    }
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  if ((uint64_t)(a8 >> 1) <= a7)
  {
LABEL_36:
    __break(1u);
    return;
  }
  unsigned int v14 = *(unsigned __int8 *)(a2 + a3);
  unsigned int v15 = *(unsigned __int8 *)(a6 + a7);
  if (v14 >= v15 && v15 >= v14)
  {
    uint64_t v17 = 0;
    int64_t v18 = a7 + 1;
    while (~a3 + v8 != v17)
    {
      if (a3 + 1 + v17 >= v8) {
        goto LABEL_32;
      }
      if (~a7 + v9 == v17) {
        break;
      }
      if (v18 + v17 < a7 || v18 + v17 >= v9) {
        goto LABEL_33;
      }
      int v19 = *(unsigned __int8 *)(a2 + a3 + 1 + v17);
      int v20 = *(unsigned __int8 *)(a6 + a7 + 1 + v17++);
      if (v20 != v19) {
        return;
      }
    }
    goto LABEL_4;
  }
}

uint64_t DER.Serializer.serializeRawBytes<A>(_:)(uint64_t a1)
{
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *))(v2 + 16))((char *)&v4 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6FE450);
  return sub_25E669690();
}

uint64_t DER.Serializer.serialize(_:)(long long *a1)
{
  long long v2 = a1[3];
  long long v3 = a1[4];
  long long v4 = a1[1];
  v11[1] = a1[2];
  v11[2] = v2;
  long long v5 = a1[5];
  v11[3] = v3;
  v11[4] = v5;
  long long v10 = *a1;
  v11[0] = v4;
  uint64_t v8 = *(void *)a1;
  char v9 = *((unsigned char *)a1 + 8);
  sub_25E651B74(v11, v12);
  sub_25E651B74(v12, &v13);
  char v6 = v14;
  sub_25E651B8C((uint64_t)&v10);
  sub_25E650040(&v8, (v6 & 1) == 0, v1, (uint64_t)&v10);
  return sub_25E651BD0((uint64_t)&v10);
}

uint64_t sub_25E64C5A4(uint64_t result, uint64_t a2)
{
  uint64_t v5 = v3;
  uint64_t v7 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v8 = *(void *)(a2 + 32);
  unint64_t v9 = *(void *)(a2 + 40);
  uint64_t v10 = *(void *)(a2 + 48);
  uint64_t v11 = *(unsigned __int8 *)(a2 + 56);
  uint64_t v38 = v6;
  if (v11)
  {
    j__swift_unknownObjectRetain(v7, v6, v8, v9, v10, 1);
    sub_25E65E8B4(v7, v6, v8, v9);
    return j__swift_unknownObjectRelease(v7, v6, v8, v9, v10, v11);
  }
  else
  {
    unsigned int v33 = *(unsigned __int8 *)(a2 + 56);
    int64_t v12 = v9 >> 1;
    if (v8 != v9 >> 1)
    {
      uint64_t v37 = result;
      uint64_t v55 = v3;
      uint64_t v30 = v10;
      j__swift_unknownObjectRetain(v7, v6, v8, v9, v10, 0);
      uint64_t v35 = v7;
      unint64_t v36 = v9 & 0xFFFFFFFFFFFFFFFELL;
      swift_unknownObjectRetain();
      uint64_t v34 = v6 + 112;
      unint64_t v31 = v9;
      uint64_t v32 = v8;
      uint64_t v13 = v8;
      unint64_t v14 = v9;
      while (v13 < (uint64_t)(v14 >> 1))
      {
        if (v12 <= v13) {
          goto LABEL_46;
        }
        if (v14 >> 1 < v12) {
          goto LABEL_47;
        }
        uint64_t v15 = v6 + 96 * v13;
        uint64_t v16 = *(void *)v15;
        char v17 = *(unsigned char *)(v15 + 8);
        uint64_t v18 = *(unsigned __int8 *)(v15 + 24);
        long long v42 = *(_OWORD *)(v15 + 32);
        uint64_t v8 = v13 + 1;
        unint64_t v19 = v14 & 1;
        unint64_t v41 = v19;
        long long v40 = *(_OWORD *)(v15 + 48);
        if (*(unsigned char *)(v15 + 24))
        {
          uint64_t v4 = *(void *)(v15 + 16);
          if (v8 == v12)
          {
            uint64_t v20 = v12;
          }
          else
          {
            uint64_t v22 = (void *)(v34 + 96 * v13);
            uint64_t v20 = v13 + 1;
            do
            {
              if (v20 >= v12)
              {
LABEL_43:
                __break(1u);
LABEL_44:
                __break(1u);
                goto LABEL_45;
              }
              if (v4 >= *v22) {
                goto LABEL_19;
              }
              uint64_t v23 = v20 + 1;
              if (__OFADD__(v20, 1)) {
                goto LABEL_44;
              }
              ++v20;
              v22 += 12;
            }
            while (v23 != v12);
            uint64_t v20 = v12;
LABEL_19:
            if (v20 <= v13) {
              goto LABEL_48;
            }
            if (v20 < 0) {
              goto LABEL_49;
            }
          }
          uint64_t v24 = v20 - v8;
          if (__OFSUB__(v20, v8)) {
            goto LABEL_50;
          }
          if (v24 < 0) {
            goto LABEL_51;
          }
          int64_t v25 = v12 - v8;
          if (__OFSUB__(v12, v8)) {
            goto LABEL_52;
          }
          if (!v24 || v25 < 0 || (uint64_t v26 = v12, v25 >= v24))
          {
            uint64_t v26 = v20;
            if (__OFADD__(v8, v24)) {
              goto LABEL_55;
            }
            if (v12 < v20) {
              goto LABEL_53;
            }
          }
          if (v26 <= v13) {
            goto LABEL_54;
          }
          if (v8 != v20)
          {
            if (v8 >= v20) {
              goto LABEL_56;
            }
            uint64_t v27 = (uint64_t *)(v34 + 96 * v13);
            do
            {
              uint64_t v28 = *v27;
              v27 += 12;
              if (v4 >= v28)
              {
                __break(1u);
                goto LABEL_43;
              }
              --v24;
            }
            while (v24);
            if (*(void *)(v6 + 96 * v8 + 16) != v4 + 1) {
              goto LABEL_57;
            }
          }
          uint64_t v39 = v26;
          uint64_t v21 = v18;
          uint64_t v7 = v19 | (2 * v20);
          uint64_t v5 = v35;
          swift_unknownObjectRetain();
          uint64_t v2 = v8;
        }
        else
        {
          uint64_t v5 = *(void *)(v15 + 64);
          if (!v5) {
            goto LABEL_58;
          }
          uint64_t v21 = *(unsigned __int8 *)(v15 + 24);
          uint64_t v6 = *(void *)(v15 + 72);
          uint64_t v2 = *(void *)(v15 + 80);
          uint64_t v7 = *(void *)(v15 + 88);
          swift_unknownObjectRetain();
          uint64_t v4 = 0;
          uint64_t v39 = v8;
        }
        uint64_t v8 = v21 ^ 1;
        uint64_t v45 = v16;
        char v46 = v17;
        uint64_t v47 = v5;
        uint64_t v48 = v6;
        uint64_t v49 = v2;
        uint64_t v50 = v7;
        uint64_t v51 = v4;
        char v52 = v21 ^ 1;
        long long v53 = v42;
        long long v54 = v40;
        uint64_t v43 = v16;
        char v44 = v17;
        j__swift_unknownObjectRetain(v5, v6, v2, v7, v4, v8);
        swift_unknownObjectRetain();
        j__swift_unknownObjectRetain(v5, v6, v2, v7, v4, v8);
        swift_unknownObjectRetain_n();
        uint64_t v29 = v55;
        sub_25E64B0F8((uint64_t)&v43, v21, v37, (uint64_t)&v45);
        uint64_t v55 = v29;
        if (v29) {
          goto LABEL_59;
        }
        unint64_t v14 = v41 | v36;
        j__swift_unknownObjectRelease(v5, v6, v2, v7, v4, v8);
        swift_unknownObjectRelease();
        j__swift_unknownObjectRelease(v5, v6, v2, v7, v4, v8);
        swift_unknownObjectRelease();
        uint64_t v6 = v38;
        uint64_t v13 = v39;
        if (v39 == v12)
        {
          uint64_t v7 = v35;
          swift_unknownObjectRelease();
          unint64_t v9 = v31;
          uint64_t v8 = v32;
          uint64_t v10 = v30;
          uint64_t v11 = v33;
          return j__swift_unknownObjectRelease(v7, v6, v8, v9, v10, v11);
        }
      }
LABEL_45:
      __break(1u);
LABEL_46:
      __break(1u);
LABEL_47:
      __break(1u);
LABEL_48:
      __break(1u);
LABEL_49:
      __break(1u);
LABEL_50:
      __break(1u);
LABEL_51:
      __break(1u);
LABEL_52:
      __break(1u);
LABEL_53:
      __break(1u);
LABEL_54:
      __break(1u);
LABEL_55:
      __break(1u);
LABEL_56:
      __break(1u);
LABEL_57:
      __break(1u);
LABEL_58:
      __break(1u);
LABEL_59:
      j__swift_unknownObjectRelease(v5, v6, v2, v7, v4, v8);
      swift_unknownObjectRelease();
      uint64_t result = swift_unexpectedError();
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_25E64C9F0(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result < 1) {
    goto LABEL_28;
  }
  uint64_t v6 = a3;
  uint64_t v7 = *v4;
  uint64_t v8 = *(void *)(*v4 + 16);
  uint64_t v9 = v8 - a3;
  if (__OFSUB__(v8, a3)) {
    goto LABEL_29;
  }
  uint64_t v3 = a2;
  uint64_t v5 = result;
  if (v9 >= result) {
    goto LABEL_13;
  }
  uint64_t v10 = result - v9;
  if (__OFSUB__(result, v9))
  {
    __break(1u);
    goto LABEL_32;
  }
  if (v10 < 0)
  {
LABEL_32:
    __break(1u);
LABEL_33:
    uint64_t result = (uint64_t)sub_25E64EE6C(0, v8 + 1, 1, (char *)v7);
    uint64_t v7 = result;
LABEL_8:
    unint64_t v11 = *(void *)(v7 + 16);
    do
    {
      unint64_t v12 = *(void *)(v7 + 24);
      if (v11 >= v12 >> 1)
      {
        uint64_t result = (uint64_t)sub_25E64EE6C((char *)(v12 > 1), v11 + 1, 1, (char *)v7);
        uint64_t v7 = result;
      }
      *(void *)(v7 + 16) = v11 + 1;
      *(unsigned char *)(v7 + v11++ + 32) = 0;
      --v10;
    }
    while (v10);
    *uint64_t v4 = v7;
    goto LABEL_13;
  }
  if (v10)
  {
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if (result) {
      goto LABEL_8;
    }
    goto LABEL_33;
  }
LABEL_13:
  if (v6 == v3) {
    return result;
  }
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0) {
    goto LABEL_30;
  }
  do
  {
    while (1)
    {
      if (v6 <= v3)
      {
        __break(1u);
LABEL_24:
        __break(1u);
LABEL_25:
        __break(1u);
LABEL_26:
        __break(1u);
        goto LABEL_27;
      }
      unint64_t v13 = v6 - 1 + v5;
      if (__OFADD__(v6 - 1, v5)) {
        goto LABEL_24;
      }
      unint64_t v14 = v6 - 1;
      if (v6 < 1) {
        goto LABEL_25;
      }
      unint64_t v15 = *(void *)(v7 + 16);
      if (v14 >= v15) {
        goto LABEL_26;
      }
      if (v13 < v15) {
        break;
      }
LABEL_27:
      __break(1u);
LABEL_28:
      __break(1u);
LABEL_29:
      __break(1u);
LABEL_30:
      uint64_t result = (uint64_t)sub_25E65A138(v7);
      uint64_t v7 = result;
    }
    *(unsigned char *)(v7 + 32 + v13) = *(unsigned char *)(v7 + v6-- + 31);
  }
  while (v14 != v3);
  *uint64_t v4 = v7;
  return result;
}

uint64_t DERParseable.init(derEncoded:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  ASN1NodeCollection.Iterator.next()((uint64_t)&v7);
  if (v9)
  {
    LOBYTE(v8) = v8 & 1;
    return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(a3 + 8))(&v7, a2, a3);
  }
  else
  {
    sub_25E64EBC8();
    swift_allocError();
    static ASN1Error.invalidASN1Object(reason:file:line:)(0xD00000000000002ALL, 0x800000025E66BB90, (uint64_t)"SwiftASN1/ASN1.swift", 20, 2, 1026, v6);
    return swift_willThrow();
  }
}

{
  uint64_t v3;
  uint64_t result;
  uint64_t v7;
  char v8;
  long long v9;
  long long v10;
  uint64_t v11;
  char v12;
  long long v13;
  long long v14;
  uint64_t v15;
  char v16;
  long long v17;
  long long v18;
  uint64_t v19;
  char v20;
  long long v21;
  long long v22;

  static DER.parse(_:)(a1, a1 + 32, 0, (2 * *(void *)(a1 + 16)) | 1, (uint64_t)&v15);
  uint64_t result = swift_bridgeObjectRelease();
  if (!v3)
  {
    uint64_t v7 = v15;
    int v8 = v16;
    uint64_t v9 = v17;
    uint64_t v10 = v18;
    unint64_t v11 = v19;
    unint64_t v12 = v20;
    unint64_t v13 = v21;
    unint64_t v14 = v22;
    return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(a3 + 8))(&v7, a2, a3);
  }
  return result;
}

uint64_t DERParseable.init(derEncoded:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  static DER.parse(_:)(a1, a2, a3, a4, (uint64_t)&v18);
  if (!v6)
  {
    uint64_t v10 = v18;
    char v11 = v19;
    long long v12 = v20;
    long long v13 = v21;
    uint64_t v14 = v22;
    char v15 = v23;
    long long v16 = v24;
    long long v17 = v25;
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(a6 + 8))(&v10, a5, a6);
  }
  return swift_unknownObjectRelease();
}

uint64_t DERImplicitlyTaggable.init(derEncoded:withIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v10 = *a5;
  char v11 = *((unsigned char *)a5 + 8);
  static DER.parse(_:)(a1, a2, a3, a4, (uint64_t)&v23);
  if (!v7)
  {
    uint64_t v15 = v23;
    char v16 = v24;
    long long v17 = v25;
    long long v18 = v26;
    uint64_t v19 = v27;
    char v20 = v28;
    long long v21 = v29;
    long long v22 = v30;
    uint64_t v13 = v10;
    char v14 = v11;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t, uint64_t))(a7 + 32))(&v15, &v13, a6, a7);
  }
  return swift_unknownObjectRelease();
}

uint64_t sub_25E64CFF0@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = result;
  if (*(void *)result == 12 && *(unsigned char *)(result + 8) == 0)
  {
    if (*(unsigned char *)(result + 56) == 1)
    {
      uint64_t v7 = *(void *)(result + 32);
      uint64_t v6 = *(void *)(result + 40);
      long long v8 = *(_OWORD *)(result + 16);
      swift_unknownObjectRetain();
      uint64_t result = sub_25E651BD0(v2);
      *(_OWORD *)a2 = v8;
      *(void *)(a2 + 16) = v7;
      *(void *)(a2 + 24) = v6;
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    sub_25E64EBC8();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1OctetString.swift", 31, 2, 26, v5);
    sub_25E651BD0(v2);
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_25E64D0D8@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = result;
  if (*(void *)result == 4 && *(unsigned char *)(result + 8) == 0)
  {
    if (*(unsigned char *)(result + 56) == 1)
    {
      uint64_t v7 = *(void *)(result + 32);
      uint64_t v6 = *(void *)(result + 40);
      long long v8 = *(_OWORD *)(result + 16);
      swift_unknownObjectRetain();
      uint64_t result = sub_25E651BD0(v2);
      *(_OWORD *)a2 = v8;
      *(void *)(a2 + 16) = v7;
      *(void *)(a2 + 24) = v6;
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    sub_25E64EBC8();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1OctetString.swift", 31, 2, 26, v5);
    sub_25E651BD0(v2);
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_25E64D1C0@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = result;
  if (*(void *)result == 20 && *(unsigned char *)(result + 8) == 0)
  {
    if (*(unsigned char *)(result + 56) == 1)
    {
      uint64_t v7 = *(void *)(result + 32);
      uint64_t v6 = *(void *)(result + 40);
      long long v8 = *(_OWORD *)(result + 16);
      swift_unknownObjectRetain();
      uint64_t result = sub_25E651BD0(v2);
      *(_OWORD *)a2 = v8;
      *(void *)(a2 + 16) = v7;
      *(void *)(a2 + 24) = v6;
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    sub_25E64EBC8();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1OctetString.swift", 31, 2, 26, v5);
    sub_25E651BD0(v2);
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_25E64D2A8@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = result;
  if (*(void *)result == 28 && *(unsigned char *)(result + 8) == 0)
  {
    if (*(unsigned char *)(result + 56) == 1)
    {
      uint64_t v7 = *(void *)(result + 32);
      uint64_t v6 = *(void *)(result + 40);
      long long v8 = *(_OWORD *)(result + 16);
      swift_unknownObjectRetain();
      uint64_t result = sub_25E651BD0(v2);
      *(_OWORD *)a2 = v8;
      *(void *)(a2 + 16) = v7;
      *(void *)(a2 + 24) = v6;
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    sub_25E64EBC8();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1OctetString.swift", 31, 2, 26, v5);
    sub_25E651BD0(v2);
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_25E64D390@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = result;
  if (*(void *)result == 30 && *(unsigned char *)(result + 8) == 0)
  {
    if (*(unsigned char *)(result + 56) == 1)
    {
      uint64_t v7 = *(void *)(result + 32);
      uint64_t v6 = *(void *)(result + 40);
      long long v8 = *(_OWORD *)(result + 16);
      swift_unknownObjectRetain();
      uint64_t result = sub_25E651BD0(v2);
      *(_OWORD *)a2 = v8;
      *(void *)(a2 + 16) = v7;
      *(void *)(a2 + 24) = v6;
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    sub_25E64EBC8();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1OctetString.swift", 31, 2, 26, v5);
    sub_25E651BD0(v2);
    return swift_willThrow();
  }
  return result;
}

uint64_t DERImplicitlyTaggable.init(derEncoded:)(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  char v5 = *((unsigned char *)a1 + 8);
  uint64_t v6 = a1[6];
  char v7 = *((unsigned char *)a1 + 56);
  uint64_t v15 = *a1;
  char v16 = v5;
  long long v8 = *((_OWORD *)a1 + 2);
  long long v17 = *((_OWORD *)a1 + 1);
  long long v18 = v8;
  uint64_t v19 = v6;
  char v20 = v7;
  long long v9 = *((_OWORD *)a1 + 5);
  long long v21 = *((_OWORD *)a1 + 4);
  long long v22 = v9;
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a3 + 24))(&v13, a2, a3);
  uint64_t v11 = v13;
  char v12 = v14;
  return (*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t, uint64_t))(a3 + 32))(&v15, &v11, a2, a3);
}

uint64_t DERImplicitlyTaggable.serialize(into:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a3 + 24))(&v9, a2, a3);
  uint64_t v7 = v9;
  char v8 = v10;
  return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t))(a3 + 40))(a1, &v7, a2, a3);
}

uint64_t sub_25E64D5FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v48 = a6;
  uint64_t v40 = *(void *)(a2 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](a1);
  char v46 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v47 = (char *)&v39 - v13;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v42 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v43 = AssociatedTypeWitness;
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v49 = (char *)&v39 - v15;
  uint64_t v41 = *(void *)(a4 + 8);
  uint64_t v16 = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](v16);
  uint64_t v51 = a1;
  uint64_t v44 = sub_25E6696F0();
  uint64_t v17 = a2;
  if (v44 <= sub_25E669910() / 8)
  {
    swift_getAssociatedConformanceWitness();
    sub_25E669970();
    sub_25E669950();
    uint64_t v20 = v51;
    uint64_t result = sub_25E6696F0();
    if ((unint64_t)(result - 0x1000000000000000) >> 61 == 7)
    {
      uint64_t v21 = sub_25E653890(0, 8 * result, 8);
      sub_25E6696E0();
      uint64_t v22 = a3;
      uint64_t v39 = v21;
      uint64_t v23 = *(void *)(v21 + 16);
      uint64_t v24 = v20;
      uint64_t v25 = v41;
      if (v23)
      {
        long long v26 = (uint64_t *)(v39 + 32);
        uint64_t v44 = v40 + 8;
        uint64_t v45 = a5;
        uint64_t v27 = (void (**)(char *, uint64_t))(v40 + 8);
        do
        {
          uint64_t v28 = *v26++;
          uint64_t v29 = v22;
          long long v30 = (void (*)(uint64_t *, void))sub_25E669770();
          char v32 = *v31;
          v30(v50, 0);
          LOBYTE(v50[0]) = v32;
          sub_25E652AC8();
          uint64_t v33 = v17;
          uint64_t v34 = v46;
          sub_25E6697D0();
          v50[0] = v28;
          sub_25E652B1C();
          uint64_t v35 = v25;
          unint64_t v36 = v47;
          sub_25E669800();
          uint64_t v37 = *v27;
          (*v27)(v34, v33);
          sub_25E669810();
          uint64_t v38 = v36;
          uint64_t v25 = v35;
          uint64_t v17 = v33;
          v37(v38, v33);
          sub_25E669700();
          uint64_t v24 = v51;
          uint64_t v22 = v29;
          --v23;
        }
        while (v23);
      }
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v22 - 8) + 8))(v24, v22);
      swift_bridgeObjectRelease();
      return (*(uint64_t (**)(char *, uint64_t))(v42 + 8))(v49, v43);
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    sub_25E64EBC8();
    swift_allocError();
    static ASN1Error.invalidASN1Object(reason:file:line:)(0xD00000000000001ALL, 0x800000025E66BD60, (uint64_t)"SwiftASN1/ASN1.swift", 20, 2, 1191, v18);
    swift_willThrow();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a3 - 8) + 8))(v51, a3);
  }
  return result;
}

uint64_t sub_25E64DB08()
{
  uint64_t v0 = sub_25E669830();
  uint64_t result = sub_25E669920();
  uint64_t v2 = v0 - result;
  if (__OFSUB__(v0, result))
  {
    __break(1u);
  }
  else
  {
    BOOL v3 = __OFADD__(v2, 7);
    uint64_t v4 = v2 + 7;
    if (!v3) {
      return v4 / 8;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_25E64DB74@<X0>(_OWORD *a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_25E64DC2C(a1, (uint64_t (*)(_OWORD *, uint64_t, void))sub_25E653C3C, a2);
}

uint64_t sub_25E64DBA0(char **a1)
{
  char v5 = *v1;
  uint64_t v3 = 2;
  char v4 = 0;
  return sub_25E65054C(&v3, 0, a1, (uint64_t (*)(char **))sub_25E652A78);
}

uint64_t sub_25E64DC00@<X0>(_OWORD *a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_25E64DC2C(a1, (uint64_t (*)(_OWORD *, uint64_t, void))sub_25E6545AC, a2);
}

uint64_t sub_25E64DC2C@<X0>(_OWORD *a1@<X0>, uint64_t (*a2)(_OWORD *, uint64_t, void)@<X3>, unsigned char *a3@<X8>)
{
  long long v5 = a1[3];
  uint64_t v9[2] = a1[2];
  v9[3] = v5;
  long long v6 = a1[5];
  v9[4] = a1[4];
  v9[5] = v6;
  long long v7 = a1[1];
  v9[0] = *a1;
  v9[1] = v7;
  uint64_t result = a2(v9, 2, 0);
  if (!v3) {
    *a3 = result;
  }
  return result;
}

uint64_t sub_25E64DC88(char **a1)
{
  char v5 = *v1;
  uint64_t v3 = 2;
  char v4 = 0;
  return sub_25E65054C(&v3, 0, a1, sub_25E652A54);
}

uint64_t sub_25E64DCE8@<X0>(_OWORD *a1@<X0>, _WORD *a2@<X8>)
{
  return sub_25E64DDA0(a1, (uint64_t (*)(_OWORD *, uint64_t, void))sub_25E653E98, a2);
}

uint64_t sub_25E64DD14(char **a1)
{
  __int16 v5 = *v1;
  uint64_t v3 = 2;
  char v4 = 0;
  return sub_25E65054C(&v3, 0, a1, (uint64_t (*)(char **))sub_25E652A30);
}

uint64_t sub_25E64DD74@<X0>(_OWORD *a1@<X0>, _WORD *a2@<X8>)
{
  return sub_25E64DDA0(a1, (uint64_t (*)(_OWORD *, uint64_t, void))sub_25E654854, a2);
}

uint64_t sub_25E64DDA0@<X0>(_OWORD *a1@<X0>, uint64_t (*a2)(_OWORD *, uint64_t, void)@<X3>, _WORD *a3@<X8>)
{
  long long v5 = a1[3];
  uint64_t v9[2] = a1[2];
  v9[3] = v5;
  long long v6 = a1[5];
  v9[4] = a1[4];
  v9[5] = v6;
  long long v7 = a1[1];
  v9[0] = *a1;
  v9[1] = v7;
  uint64_t result = a2(v9, 2, 0);
  if (!v3) {
    *a3 = result;
  }
  return result;
}

uint64_t sub_25E64DDFC(char **a1)
{
  __int16 v5 = *v1;
  uint64_t v3 = 2;
  char v4 = 0;
  return sub_25E65054C(&v3, 0, a1, sub_25E652A0C);
}

uint64_t sub_25E64DE5C@<X0>(_OWORD *a1@<X0>, _DWORD *a2@<X8>)
{
  return sub_25E64DF14(a1, (uint64_t (*)(_OWORD *, uint64_t, void))sub_25E6540F4, a2);
}

uint64_t sub_25E64DE88(char **a1)
{
  int v5 = *v1;
  uint64_t v3 = 2;
  char v4 = 0;
  return sub_25E65054C(&v3, 0, a1, (uint64_t (*)(char **))sub_25E6529E8);
}

uint64_t sub_25E64DEE8@<X0>(_OWORD *a1@<X0>, _DWORD *a2@<X8>)
{
  return sub_25E64DF14(a1, (uint64_t (*)(_OWORD *, uint64_t, void))sub_25E654AFC, a2);
}

uint64_t sub_25E64DF14@<X0>(_OWORD *a1@<X0>, uint64_t (*a2)(_OWORD *, uint64_t, void)@<X3>, _DWORD *a3@<X8>)
{
  long long v5 = a1[3];
  uint64_t v9[2] = a1[2];
  v9[3] = v5;
  long long v6 = a1[5];
  v9[4] = a1[4];
  v9[5] = v6;
  long long v7 = a1[1];
  v9[0] = *a1;
  v9[1] = v7;
  uint64_t result = a2(v9, 2, 0);
  if (!v3) {
    *a3 = result;
  }
  return result;
}

uint64_t sub_25E64DF70(char **a1)
{
  int v5 = *v1;
  uint64_t v3 = 2;
  char v4 = 0;
  return sub_25E65054C(&v3, 0, a1, sub_25E6529C4);
}

uint64_t sub_25E64DFD0@<X0>(_OWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_25E64E114(a1, (uint64_t (*)(_OWORD *, uint64_t, void))sub_25E653960, a2);
}

uint64_t sub_25E64DFFC(char **a1)
{
  uint64_t v5 = *v1;
  uint64_t v3 = 2;
  char v4 = 0;
  return sub_25E65054C(&v3, 0, a1, (uint64_t (*)(char **))sub_25E6529A0);
}

uint64_t sub_25E64E05C@<X0>(_OWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_25E64E114(a1, (uint64_t (*)(_OWORD *, uint64_t, void))sub_25E654DA4, a2);
}

uint64_t sub_25E64E088(char **a1)
{
  uint64_t v5 = *v1;
  uint64_t v3 = 2;
  char v4 = 0;
  return sub_25E65054C(&v3, 0, a1, sub_25E652978);
}

uint64_t sub_25E64E0E8@<X0>(_OWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_25E64E114(a1, (uint64_t (*)(_OWORD *, uint64_t, void))sub_25E653978, a2);
}

uint64_t sub_25E64E114@<X0>(_OWORD *a1@<X0>, uint64_t (*a2)(_OWORD *, uint64_t, void)@<X3>, uint64_t *a3@<X8>)
{
  long long v5 = a1[3];
  uint64_t v9[2] = a1[2];
  v9[3] = v5;
  long long v6 = a1[5];
  v9[4] = a1[4];
  v9[5] = v6;
  long long v7 = a1[1];
  v9[0] = *a1;
  v9[1] = v7;
  uint64_t result = a2(v9, 2, 0);
  if (!v3) {
    *a3 = result;
  }
  return result;
}

uint64_t sub_25E64E170@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  char v4 = *((unsigned char *)a1 + 8);
  uint64_t v5 = a1[6];
  char v6 = *((unsigned char *)a1 + 56);
  uint64_t v12 = *a1;
  char v13 = v4;
  long long v7 = *((_OWORD *)a1 + 2);
  long long v14 = *((_OWORD *)a1 + 1);
  long long v15 = v7;
  uint64_t v16 = v5;
  char v17 = v6;
  long long v8 = *((_OWORD *)a1 + 5);
  long long v18 = *((_OWORD *)a1 + 4);
  long long v19 = v8;
  uint64_t v10 = 6;
  char v11 = 0;
  uint64_t result = ASN1ObjectIdentifier.init(derEncoded:withIdentifier:)((uint64_t)&v12, (uint64_t)&v10, &v20);
  if (!v2) {
    *a2 = v20;
  }
  return result;
}

uint64_t sub_25E64E1F0(char **a1)
{
  uint64_t v2 = 6;
  char v3 = 0;
  return sub_25E65054C(&v2, 0, a1, (uint64_t (*)(char **))sub_25E65295C);
}

uint64_t sub_25E64E248@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  char v4 = *((unsigned char *)a1 + 8);
  uint64_t v5 = a1[6];
  char v6 = *((unsigned char *)a1 + 56);
  uint64_t v12 = *a1;
  char v13 = v4;
  long long v7 = *((_OWORD *)a1 + 2);
  long long v14 = *((_OWORD *)a1 + 1);
  long long v15 = v7;
  uint64_t v16 = v5;
  char v17 = v6;
  long long v8 = *((_OWORD *)a1 + 5);
  long long v18 = *((_OWORD *)a1 + 4);
  long long v19 = v8;
  uint64_t v10 = 1;
  char v11 = 0;
  uint64_t result = sub_25E660E1C((uint64_t)&v12, (uint64_t)&v10);
  if (!v2) {
    *a2 = result & 1;
  }
  return result;
}

uint64_t sub_25E64E2C4(char **a1)
{
  uint64_t v2 = 1;
  char v3 = 0;
  return sub_25E65054C(&v2, 0, a1, (uint64_t (*)(char **))sub_25E652940);
}

uint64_t sub_25E64E31C@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X8>)
{
  long long v2 = a1[3];
  v6[2] = a1[2];
  v6[3] = v2;
  long long v3 = a1[5];
  v6[4] = a1[4];
  v6[5] = v3;
  long long v4 = a1[1];
  v6[0] = *a1;
  v6[1] = v4;
  return sub_25E64CFF0((uint64_t)v6, a2);
}

uint64_t sub_25E64E358(char **a1)
{
  uint64_t v2 = 12;
  char v3 = 0;
  return sub_25E65054C(&v2, 0, a1, (uint64_t (*)(char **))sub_25E652EB8);
}

uint64_t sub_25E64E3B0@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X8>)
{
  long long v2 = a1[3];
  v6[2] = a1[2];
  v6[3] = v2;
  long long v3 = a1[5];
  v6[4] = a1[4];
  v6[5] = v3;
  long long v4 = a1[1];
  v6[0] = *a1;
  v6[1] = v4;
  return sub_25E64D1C0((uint64_t)v6, a2);
}

uint64_t sub_25E64E3EC(char **a1)
{
  uint64_t v2 = 20;
  char v3 = 0;
  return sub_25E65054C(&v2, 0, a1, (uint64_t (*)(char **))sub_25E652EB8);
}

double sub_25E64E444@<D0>(uint64_t *a1@<X0>, _OWORD *a2@<X8>)
{
  return sub_25E64E624(a1, 19, (void (*)(_OWORD *__return_ptr, uint64_t *, uint64_t *))ASN1PrintableString.init(derEncoded:withIdentifier:), a2);
}

uint64_t sub_25E64E474(char **a1)
{
  uint64_t v2 = 19;
  char v3 = 0;
  return sub_25E65054C(&v2, 0, a1, (uint64_t (*)(char **))sub_25E652EB8);
}

uint64_t sub_25E64E4CC@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X8>)
{
  long long v2 = a1[3];
  v6[2] = a1[2];
  v6[3] = v2;
  long long v3 = a1[5];
  v6[4] = a1[4];
  v6[5] = v3;
  long long v4 = a1[1];
  v6[0] = *a1;
  v6[1] = v4;
  return sub_25E64D2A8((uint64_t)v6, a2);
}

uint64_t sub_25E64E508(char **a1)
{
  uint64_t v2 = 28;
  char v3 = 0;
  return sub_25E65054C(&v2, 0, a1, (uint64_t (*)(char **))sub_25E652EB8);
}

uint64_t sub_25E64E560@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X8>)
{
  long long v2 = a1[3];
  v6[2] = a1[2];
  v6[3] = v2;
  long long v3 = a1[5];
  v6[4] = a1[4];
  v6[5] = v3;
  long long v4 = a1[1];
  v6[0] = *a1;
  v6[1] = v4;
  return sub_25E64D390((uint64_t)v6, a2);
}

uint64_t sub_25E64E59C(char **a1)
{
  uint64_t v2 = 30;
  char v3 = 0;
  return sub_25E65054C(&v2, 0, a1, (uint64_t (*)(char **))sub_25E652EB8);
}

double sub_25E64E5F4@<D0>(uint64_t *a1@<X0>, _OWORD *a2@<X8>)
{
  return sub_25E64E624(a1, 22, (void (*)(_OWORD *__return_ptr, uint64_t *, uint64_t *))ASN1IA5String.init(derEncoded:withIdentifier:), a2);
}

double sub_25E64E624@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X3>, void (*a3)(_OWORD *__return_ptr, uint64_t *, uint64_t *)@<X4>, _OWORD *a4@<X8>)
{
  char v6 = *((unsigned char *)a1 + 8);
  uint64_t v7 = a1[6];
  char v8 = *((unsigned char *)a1 + 56);
  uint64_t v15 = *a1;
  char v16 = v6;
  long long v9 = *((_OWORD *)a1 + 2);
  long long v17 = *((_OWORD *)a1 + 1);
  long long v18 = v9;
  uint64_t v19 = v7;
  char v20 = v8;
  long long v10 = *((_OWORD *)a1 + 5);
  long long v21 = *((_OWORD *)a1 + 4);
  long long v22 = v10;
  uint64_t v13 = a2;
  char v14 = 0;
  a3(v23, &v15, &v13);
  if (!v4)
  {
    double result = *(double *)v23;
    long long v12 = v23[1];
    *a4 = v23[0];
    a4[1] = v12;
  }
  return result;
}

uint64_t sub_25E64E6A4(char **a1)
{
  uint64_t v2 = 22;
  char v3 = 0;
  return sub_25E65054C(&v2, 0, a1, (uint64_t (*)(char **))sub_25E652EB8);
}

uint64_t sub_25E64E6FC@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X8>)
{
  long long v2 = a1[3];
  v6[2] = a1[2];
  v6[3] = v2;
  long long v3 = a1[5];
  v6[4] = a1[4];
  v6[5] = v3;
  long long v4 = a1[1];
  v6[0] = *a1;
  v6[1] = v4;
  return sub_25E64D0D8((uint64_t)v6, a2);
}

uint64_t sub_25E64E738(char **a1)
{
  uint64_t v2 = 4;
  char v3 = 0;
  return sub_25E65054C(&v2, 0, a1, (uint64_t (*)(char **))sub_25E652920);
}

double sub_25E64E790@<D0>(uint64_t *a1@<X0>, _OWORD *a2@<X8>)
{
  char v4 = *((unsigned char *)a1 + 8);
  uint64_t v5 = a1[6];
  char v6 = *((unsigned char *)a1 + 56);
  uint64_t v13 = *a1;
  char v14 = v4;
  long long v7 = *((_OWORD *)a1 + 2);
  long long v15 = *((_OWORD *)a1 + 1);
  long long v16 = v7;
  uint64_t v17 = v5;
  char v18 = v6;
  long long v8 = *((_OWORD *)a1 + 5);
  long long v19 = *((_OWORD *)a1 + 4);
  long long v20 = v8;
  uint64_t v11 = 23;
  char v12 = 0;
  UTCTime.init(derEncoded:withIdentifier:)((uint64_t)&v13, (uint64_t)&v11, v21);
  if (!v2)
  {
    long long v10 = v21[1];
    *a2 = v21[0];
    a2[1] = v10;
    double result = *(double *)&v22;
    a2[2] = v22;
  }
  return result;
}

uint64_t sub_25E64E818(char **a1)
{
  long long v2 = v1[1];
  long long v6 = *v1;
  long long v7 = v2;
  long long v8 = v1[2];
  uint64_t v4 = 23;
  char v5 = 0;
  return sub_25E65054C(&v4, 0, a1, (uint64_t (*)(char **))sub_25E652904);
}

uint64_t sub_25E64E880(char **a1)
{
  long long v2 = v1[1];
  long long v6 = *v1;
  long long v7 = v2;
  uint64_t v4 = 2;
  char v5 = 0;
  return sub_25E65054C(&v4, 0, a1, sub_25E6528E8);
}

uint64_t sub_25E64E8E0@<X0>(_OWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  long long v4 = a1[3];
  v11[2] = a1[2];
  v11[3] = v4;
  long long v5 = a1[5];
  v11[4] = a1[4];
  long long v11[5] = v5;
  long long v6 = a1[1];
  v11[0] = *a1;
  v11[1] = v6;
  uint64_t result = sub_25E6539A4((uint64_t)v11, 2, 0);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v8;
    a2[2] = v9;
    a2[3] = v10;
  }
  return result;
}

double sub_25E64E93C@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  char v4 = *((unsigned char *)a1 + 8);
  uint64_t v5 = a1[6];
  char v6 = *((unsigned char *)a1 + 56);
  uint64_t v13 = *a1;
  char v14 = v4;
  long long v7 = *((_OWORD *)a1 + 2);
  long long v15 = *((_OWORD *)a1 + 1);
  long long v16 = v7;
  uint64_t v17 = v5;
  char v18 = v6;
  long long v8 = *((_OWORD *)a1 + 5);
  long long v19 = *((_OWORD *)a1 + 4);
  long long v20 = v8;
  uint64_t v11 = 24;
  char v12 = 0;
  GeneralizedTime.init(derEncoded:withIdentifier:)((uint64_t)&v13, (uint64_t)&v11, (uint64_t)v21);
  if (!v2)
  {
    double result = v22;
    long long v10 = v21[1];
    *(_OWORD *)a2 = v21[0];
    *(_OWORD *)(a2 + 16) = v10;
    *(_OWORD *)(a2 + 32) = v21[2];
    *(double *)(a2 + 48) = result;
  }
  return result;
}

uint64_t sub_25E64E9CC(char **a1)
{
  long long v2 = v1[1];
  long long v6 = *v1;
  long long v7 = v2;
  long long v8 = v1[2];
  uint64_t v9 = *((void *)v1 + 6);
  uint64_t v4 = 24;
  char v5 = 0;
  return sub_25E65054C(&v4, 0, a1, (uint64_t (*)(char **))sub_25E6528CC);
}

uint64_t sub_25E64EA3C(uint64_t *a1)
{
  char v1 = *((unsigned char *)a1 + 8);
  uint64_t v2 = a1[6];
  char v3 = *((unsigned char *)a1 + 56);
  uint64_t v9 = *a1;
  char v10 = v1;
  long long v4 = *((_OWORD *)a1 + 2);
  long long v11 = *((_OWORD *)a1 + 1);
  long long v12 = v4;
  uint64_t v13 = v2;
  char v14 = v3;
  long long v5 = *((_OWORD *)a1 + 5);
  long long v15 = *((_OWORD *)a1 + 4);
  long long v16 = v5;
  uint64_t v7 = 5;
  char v8 = 0;
  return ASN1Null.init(derEncoded:withIdentifier:)((uint64_t)&v9, (uint64_t)&v7);
}

uint64_t sub_25E64EAA0(uint64_t *a1)
{
  uint64_t v2 = 5;
  char v3 = 0;
  return sub_25E64B12C(&v2, 0, a1);
}

double sub_25E64EAD8@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  char v4 = *((unsigned char *)a1 + 8);
  uint64_t v5 = a1[6];
  char v6 = *((unsigned char *)a1 + 56);
  uint64_t v14 = *a1;
  char v15 = v4;
  long long v7 = *((_OWORD *)a1 + 2);
  long long v16 = *((_OWORD *)a1 + 1);
  long long v17 = v7;
  uint64_t v18 = v5;
  char v19 = v6;
  long long v8 = *((_OWORD *)a1 + 5);
  long long v20 = *((_OWORD *)a1 + 4);
  long long v21 = v8;
  uint64_t v12 = 3;
  char v13 = 0;
  ASN1BitString.init(derEncoded:withIdentifier:)((uint64_t)&v14, (uint64_t)&v12, v22);
  if (!v2)
  {
    uint64_t v10 = v23;
    double result = *(double *)v22;
    long long v11 = v22[1];
    *(_OWORD *)a2 = v22[0];
    *(_OWORD *)(a2 + 16) = v11;
    *(void *)(a2 + 32) = v10;
  }
  return result;
}

uint64_t sub_25E64EB60(char **a1)
{
  long long v2 = v1[1];
  long long v6 = *v1;
  long long v7 = v2;
  uint64_t v8 = *((void *)v1 + 4);
  uint64_t v4 = 3;
  char v5 = 0;
  return sub_25E65054C(&v4, 0, a1, sub_25E6528B0);
}

unint64_t sub_25E64EBC8()
{
  unint64_t result = qword_26A6FE448;
  if (!qword_26A6FE448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6FE448);
  }
  return result;
}

uint64_t sub_25E64EC20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9)
{
  if (a9)
  {
    j__swift_unknownObjectRelease(a3, a4, a5, a6, a7, a8 & 1);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_25E64EC84(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B38DC78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
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

uint64_t sub_25E64ED30(uint64_t a1)
{
  return a1;
}

char *sub_25E64ED5C(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_25E64ED74(a1, a2, a3, a4, &qword_26B38DC88);
}

char *sub_25E64ED68(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_25E64ED74(a1, a2, a3, a4, &qword_26A6FE480);
}

char *sub_25E64ED74(char *result, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  char v6 = (char)result;
  if (a3)
  {
    unint64_t v7 = *((void *)a4 + 3);
    int64_t v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v8 = a2;
      }
    }
  }
  else
  {
    int64_t v8 = a2;
  }
  uint64_t v9 = *((void *)a4 + 2);
  if (v8 <= v9) {
    uint64_t v10 = *((void *)a4 + 2);
  }
  else {
    uint64_t v10 = v8;
  }
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    long long v11 = (char *)swift_allocObject();
    int64_t v12 = _swift_stdlib_malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 25;
    }
    *((void *)v11 + 2) = v9;
    *((void *)v11 + 3) = 2 * (v13 >> 3);
  }
  else
  {
    long long v11 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v14 = v11 + 32;
  char v15 = a4 + 32;
  if (v6)
  {
    if (v11 != a4 || v14 >= &v15[8 * v9]) {
      memmove(v14, v15, 8 * v9);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v14, v15, 8 * v9);
  }
  swift_bridgeObjectRelease();
  return v11;
}

char *sub_25E64EE6C(char *result, int64_t a2, char a3, char *a4)
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
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B38DC98);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  int64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_25E64EF58(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B38DC80);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 96);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  int64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[96 * v8]) {
      memmove(v12, v13, 96 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_25E64F074(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B38DC90);
    uint64_t v10 = (char *)swift_allocObject();
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
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
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
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_25E64F170(uint64_t a1)
{
  return sub_25E64F074(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_25E64F184(uint64_t *a1, int64_t *a2)
{
  return sub_25E65545C(*a2, a1);
}

uint64_t sub_25E64F1A8(char **a1, unint64_t *a2)
{
  return sub_25E6554B0(*a2, a1);
}

uint64_t sub_25E64F1CC(uint64_t *a1, unsigned __int8 *a2)
{
  return sub_25E6556D8(*a2, a1);
}

uint64_t sub_25E64F1F0(uint64_t *a1, unsigned __int16 *a2)
{
  return sub_25E6557D8(*a2, a1);
}

uint64_t sub_25E64F214(uint64_t *a1, unsigned int *a2)
{
  return sub_25E6558B0(*a2, a1);
}

uint64_t sub_25E64F238(char **a1, unsigned __int8 *a2)
{
  return sub_25E655A68(*a2, a1);
}

uint64_t sub_25E64F25C(char **a1, unsigned __int16 *a2)
{
  return sub_25E655C08(*a2, a1);
}

uint64_t sub_25E64F280(char **a1, unsigned int *a2)
{
  return sub_25E655D9C(*a2, a1);
}

uint64_t sub_25E64F2A4(uint64_t result, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  int64_t v6 = a3 >> 1;
  uint64_t v7 = (a3 >> 1) - a2;
  if (!__OFSUB__(a3 >> 1, a2))
  {
    int64_t v8 = a6 >> 1;
    if (__OFSUB__(a6 >> 1, a5)) {
      goto LABEL_20;
    }
    if (v7 != (a6 >> 1) - a5) {
      return 0;
    }
    if (!v7 || result + a2 == a4 + a5 || v6 == a2) {
      return 1;
    }
    if (v6 <= a2) {
      goto LABEL_22;
    }
    uint64_t v9 = a2 + 1;
    int v10 = *(unsigned __int8 *)(result + a2);
    if (v6 == a2) {
      return 1;
    }
    uint64_t v11 = a5;
    if (v8 == a5) {
      return 0;
    }
    while (v11 >= a5 && v11 < v8)
    {
      if (v10 != *(unsigned __int8 *)(a4 + v11)) {
        return 0;
      }
      if (v6 == v9) {
        return 1;
      }
      if (v9 >= v6) {
        goto LABEL_21;
      }
      int v10 = *(unsigned __int8 *)(result + v9++);
      if (v8 == ++v11) {
        return 0;
      }
    }
    __break(1u);
  }
  __break(1u);
LABEL_20:
  __break(1u);
LABEL_21:
  __break(1u);
LABEL_22:
  __break(1u);
  return result;
}

uint64_t sub_25E64F378(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0;
  if (*(void *)a1 == *(void *)a2
    && *(unsigned __int8 *)(a1 + 8) == *(unsigned __int8 *)(a2 + 8)
    && *(void *)(a1 + 16) == *(void *)(a2 + 16)
    && ((*(unsigned __int8 *)(a1 + 24) ^ *(unsigned __int8 *)(a2 + 24)) & 1) == 0)
  {
    uint64_t v4 = *(void *)(a1 + 72);
    uint64_t v5 = *(void *)(a1 + 80);
    unint64_t v6 = *(void *)(a1 + 88);
    uint64_t v7 = *(void *)(a2 + 72);
    uint64_t v8 = *(void *)(a2 + 80);
    unint64_t v9 = *(void *)(a2 + 88);
    uint64_t v10 = *(void *)(a2 + 64);
    uint64_t v11 = *(void *)(a1 + 64);
    if (sub_25E64F2A4(*(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a2 + 40), *(void *)(a2 + 48), *(void *)(a2 + 56)))
    {
      if (v11)
      {
        if (v10 && (sub_25E64F2A4(v4, v5, v6, v7, v8, v9) & 1) != 0) {
          return 1;
        }
      }
      else if (!v10)
      {
        return 1;
      }
    }
    return 0;
  }
  return result;
}

unint64_t sub_25E64F454()
{
  unint64_t result = qword_26B38DC58;
  if (!qword_26B38DC58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B38DC58);
  }
  return result;
}

uint64_t sub_25E64F4A8(uint64_t *a1, void *a2)
{
  return sub_25E647EA0(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), a2);
}

uint64_t sub_25E64F4CC(uint64_t *a1)
{
  return sub_25E649378(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_25E64F4EC(uint64_t result, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  int64_t v6 = a3 >> 1;
  uint64_t v7 = (a3 >> 1) - a2;
  if (__OFSUB__(a3 >> 1, a2))
  {
    __break(1u);
LABEL_44:
    __break(1u);
LABEL_45:
    __break(1u);
LABEL_46:
    __break(1u);
LABEL_47:
    __break(1u);
    return result;
  }
  uint64_t v8 = a5;
  int64_t v9 = a6 >> 1;
  if (__OFSUB__(a6 >> 1, a5)) {
    goto LABEL_44;
  }
  if (v7 != (a6 >> 1) - a5) {
    return 0;
  }
  if (!v7) {
    return 1;
  }
  uint64_t v10 = a4;
  uint64_t v11 = result + 96 * a2;
  if (v11 == a4 + 96 * a5) {
    return 1;
  }
  unint64_t v50 = a6 >> 1;
  if (v6 != a2)
  {
    uint64_t v18 = a5;
    if (v6 > a2) {
      goto LABEL_9;
    }
    goto LABEL_46;
  }
  uint64_t v47 = a2;
  int64_t v48 = a3 >> 1;
  uint64_t v45 = result;
  uint64_t v64 = 0;
  uint64_t v67 = 0;
  uint64_t v68 = 0;
  uint64_t v12 = 0;
  char v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  unint64_t v69 = 0;
  uint64_t v66 = 0;
  uint64_t v56 = 0;
  uint64_t v57 = 0;
  unint64_t v16 = 0;
  uint64_t v17 = a5;
  uint64_t v18 = a5;
LABEL_10:
  long long v21 = (unint64_t *)(v10 + 96 * v17 + 88);
  uint64_t v52 = v17;
  while (1)
  {
    if (!v14) {
      return 1;
    }
    uint64_t v65 = v13 & 1;
    if (v9 == v18)
    {
      uint64_t v22 = v12;
      uint64_t v31 = 0;
      uint64_t v32 = 0;
      uint64_t v33 = 0;
      uint64_t v27 = 0;
      uint64_t v34 = 0;
      uint64_t v35 = 0;
      uint64_t v36 = 0;
      uint64_t v37 = 0;
      uint64_t v25 = 0;
      uint64_t v38 = 0;
      uint64_t v26 = 0;
LABEL_33:
      v70[0] = v64;
      v70[1] = v68;
      v70[2] = v22;
      v70[3] = v65;
      v70[4] = v14;
      v70[5] = v15;
      v70[6] = v67;
      v70[7] = v69;
      v70[8] = v66;
      v70[9] = v57;
      v70[10] = v56;
      v70[11] = v16;
      v70[12] = v26;
      v70[13] = v38;
      v70[14] = v25;
      v70[15] = v37;
      v70[16] = 0;
      v70[17] = v36;
      v70[18] = v35;
      v70[19] = v34;
      v70[20] = v27;
      v70[21] = v33;
      v70[22] = v32;
      v70[23] = v31;
      sub_25E652B70(v70);
      return 0;
    }
    if (v17 < v8 || v18 >= v9) {
      goto LABEL_45;
    }
    uint64_t v53 = v18;
    uint64_t v22 = v12;
    uint64_t v23 = *(v21 - 7);
    uint64_t v62 = *((unsigned __int8 *)v21 - 64);
    uint64_t v63 = *((unsigned __int8 *)v21 - 80);
    unint64_t v54 = *v21;
    uint64_t v55 = *(v21 - 1);
    uint64_t v24 = *(v21 - 3);
    uint64_t v60 = *(v21 - 6);
    unint64_t v61 = *(v21 - 4);
    uint64_t v58 = *(v21 - 2);
    uint64_t v59 = *(v21 - 5);
    uint64_t v25 = *(v21 - 9);
    uint64_t v26 = *(v21 - 11);
    swift_unknownObjectRetain();
    uint64_t v27 = v24;
    swift_unknownObjectRetain();
    if (!v23)
    {
      uint64_t v38 = v63;
      uint64_t v36 = v60;
      uint64_t v34 = v61;
      uint64_t v33 = v58;
      uint64_t v35 = v59;
      uint64_t v37 = v62;
      uint64_t v31 = v54;
      uint64_t v32 = v55;
      goto LABEL_33;
    }
    if (v64 != v26)
    {
      uint64_t v29 = v22;
      uint64_t v39 = v22;
      uint64_t v30 = v64;
      sub_25E652C78(v64, v68, v39, v65, v14);
      uint64_t v40 = v23;
      uint64_t v41 = v26;
      uint64_t v28 = v65;
      uint64_t v42 = v63;
      uint64_t v43 = v25;
LABEL_38:
      uint64_t v44 = v62;
      goto LABEL_39;
    }
    if (v63 != v68)
    {
      sub_25E652C78(v64, v68, v22, v65, v14);
      uint64_t v40 = v23;
      uint64_t v29 = v22;
      uint64_t v41 = v64;
      uint64_t v30 = v64;
      uint64_t v42 = v63;
      uint64_t v43 = v25;
      uint64_t v28 = v65;
      goto LABEL_38;
    }
    uint64_t v28 = v65;
    if (v22 != v25)
    {
      sub_25E652C78(v64, v68, v22, v65, v14);
      uint64_t v40 = v23;
      uint64_t v29 = v22;
      uint64_t v30 = v64;
      uint64_t v41 = v64;
      uint64_t v42 = v63;
      uint64_t v43 = v25;
      uint64_t v28 = v65;
      goto LABEL_38;
    }
    if (v62 != v65 || (sub_25E64F2A4(v15, v67, v69, v60, v59, v61) & 1) == 0)
    {
      sub_25E652C78(v64, v68, v22, v65, v14);
      uint64_t v40 = v23;
      uint64_t v29 = v22;
      uint64_t v28 = v65;
      uint64_t v30 = v64;
      uint64_t v41 = v64;
      uint64_t v42 = v63;
      uint64_t v43 = v29;
      goto LABEL_38;
    }
    if (v66)
    {
      if (!v24) {
        break;
      }
      char v49 = sub_25E64F2A4(v57, v56, v16, v58, v55, v54);
      sub_25E652C78(v64, v68, v22, v65, v14);
      uint64_t v28 = v65;
      uint64_t v29 = v22;
      uint64_t v30 = v64;
      sub_25E652C34(v64, v63, v29, v62, v23);
      if ((v49 & 1) == 0) {
        goto LABEL_40;
      }
      goto LABEL_27;
    }
    if (v24) {
      break;
    }
    uint64_t v29 = v22;
    sub_25E652C78(v64, v68, v22, v65, v14);
    uint64_t v30 = v64;
    sub_25E652C34(v64, v63, v29, v62, v23);
LABEL_27:
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    unint64_t result = sub_25E652C34(v30, v68, v29, v28, v14);
    uint64_t v64 = 0;
    uint64_t v67 = 0;
    uint64_t v68 = 0;
    uint64_t v12 = 0;
    char v13 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    unint64_t v69 = 0;
    uint64_t v66 = 0;
    uint64_t v56 = 0;
    uint64_t v57 = 0;
    unint64_t v16 = 0;
    v21 += 12;
    uint64_t v18 = v53 + 1;
    int64_t v9 = v50;
    uint64_t v8 = a5;
    uint64_t v17 = v52;
    if (v47 != v48)
    {
      if (v47 >= v48) {
        goto LABEL_47;
      }
      unint64_t result = v45;
      uint64_t v10 = a4;
      a2 = v47;
      int64_t v6 = v48;
      uint64_t v11 = v45 + 96 * v47;
LABEL_9:
      int64_t v48 = v6;
      uint64_t v45 = result;
      uint64_t v19 = result + 96 * a2;
      uint64_t v14 = *(void *)(v19 + 32);
      uint64_t v15 = *(void *)(v19 + 40);
      uint64_t v20 = a2 + 1;
      char v13 = *(unsigned char *)(v19 + 24);
      uint64_t v68 = *(unsigned __int8 *)(v11 + 8);
      unint64_t v16 = *(void *)(v19 + 88);
      uint64_t v56 = *(void *)(v19 + 80);
      uint64_t v57 = *(void *)(v19 + 72);
      unint64_t v69 = *(void *)(v19 + 56);
      uint64_t v66 = *(void *)(v19 + 64);
      uint64_t v67 = *(void *)(v19 + 48);
      uint64_t v12 = *(void *)(v19 + 16);
      uint64_t v64 = *(void *)v11;
      swift_unknownObjectRetain();
      unint64_t result = swift_unknownObjectRetain();
      uint64_t v17 = v18;
      uint64_t v47 = v20;
      goto LABEL_10;
    }
  }
  sub_25E652C78(v64, v68, v22, v65, v14);
  uint64_t v28 = v65;
  uint64_t v29 = v22;
  uint64_t v30 = v64;
  uint64_t v41 = v64;
  uint64_t v44 = v62;
  uint64_t v42 = v63;
  uint64_t v43 = v29;
  uint64_t v40 = v23;
LABEL_39:
  sub_25E652C34(v41, v42, v43, v44, v40);
LABEL_40:
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_25E652C34(v30, v68, v29, v28, v14);
  return 0;
}

uint64_t _s9SwiftASN10B4NodeV7ContentO2eeoiySbAE_AEtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = a1[1];
  uint64_t v4 = a1[2];
  unint64_t v3 = a1[3];
  uint64_t v5 = a1[4];
  uint64_t v6 = *((unsigned __int8 *)a1 + 40);
  uint64_t v8 = *a2;
  uint64_t v7 = a2[1];
  uint64_t v10 = a2[2];
  unint64_t v9 = a2[3];
  uint64_t v11 = a2[4];
  uint64_t v12 = *((unsigned __int8 *)a2 + 40);
  if (v6)
  {
    if (v12)
    {
      uint64_t v26 = *a2;
      uint64_t v13 = a2[1];
      uint64_t v14 = a2[4];
      uint64_t v15 = *a1;
      char v23 = sub_25E64F2A4(v2, v4, v3, v7, v10, v9);
      j__swift_unknownObjectRetain(v15, v2, v4, v3, v5, 1);
      j__swift_unknownObjectRetain(v26, v13, v10, v9, v14, 1);
      j__swift_unknownObjectRelease(v15, v2, v4, v3, v5, 1);
      j__swift_unknownObjectRelease(v26, v13, v10, v9, v14, 1);
      return v23 & 1;
    }
    goto LABEL_5;
  }
  if (v12)
  {
LABEL_5:
    uint64_t v22 = a1[4];
    uint64_t v24 = a1[3];
    uint64_t v17 = a2[1];
    uint64_t v18 = *a1;
    j__swift_unknownObjectRetain(*a1, v2, v4, v24, v22, v6);
    j__swift_unknownObjectRetain(v8, v17, v10, v9, v11, v12);
    j__swift_unknownObjectRelease(v18, v2, v4, v24, v22, v6);
    j__swift_unknownObjectRelease(v8, v17, v10, v9, v11, v12);
    return 0;
  }
  uint64_t v27 = *a2;
  uint64_t v19 = a2[1];
  uint64_t v20 = a2[4];
  uint64_t v21 = *a1;
  j__swift_unknownObjectRetain(v8, v7, v10, v9, v20, 0);
  j__swift_unknownObjectRetain(v21, v2, v4, v3, v5, 0);
  j__swift_unknownObjectRetain(v21, v2, v4, v3, v5, 0);
  j__swift_unknownObjectRetain(v27, v19, v10, v9, v20, 0);
  unsigned __int8 v25 = sub_25E64F4EC(v2, v4, v3, v19, v10, v9);
  j__swift_unknownObjectRelease(v21, v2, v4, v3, v5, 0);
  j__swift_unknownObjectRelease(v27, v19, v10, v9, v20, 0);
  j__swift_unknownObjectRelease(v27, v19, v10, v9, v20, 0);
  j__swift_unknownObjectRelease(v21, v2, v4, v3, v5, 0);
  return v25 & (v5 == v20);
}

uint64_t _s9SwiftASN10B4NodeV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  if (*(void *)a1 != *(void *)a2 || *(unsigned __int8 *)(a1 + 8) != *(unsigned __int8 *)(a2 + 8)) {
    return 0;
  }
  uint64_t v3 = *(void *)(a1 + 72);
  uint64_t v4 = *(void *)(a1 + 80);
  unint64_t v5 = *(void *)(a1 + 88);
  uint64_t v6 = *(void *)(a2 + 72);
  uint64_t v7 = *(void *)(a2 + 80);
  unint64_t v8 = *(void *)(a2 + 88);
  char v9 = *(unsigned char *)(a2 + 56);
  uint64_t v10 = *(void *)(a2 + 48);
  char v11 = *(unsigned char *)(a1 + 56);
  uint64_t v12 = *(void *)(a1 + 48);
  long long v13 = *(_OWORD *)(a1 + 32);
  v19[0] = *(_OWORD *)(a1 + 16);
  v19[1] = v13;
  uint64_t v20 = v12;
  char v21 = v11;
  long long v14 = *(_OWORD *)(a2 + 32);
  v16[0] = *(_OWORD *)(a2 + 16);
  v16[1] = v14;
  uint64_t v17 = v10;
  char v18 = v9;
  if ((_s9SwiftASN10B4NodeV7ContentO2eeoiySbAE_AEtFZ_0((uint64_t *)v19, (uint64_t *)v16) & 1) == 0) {
    return 0;
  }

  return sub_25E64F2A4(v3, v4, v5, v6, v7, v8);
}

uint64_t sub_25E650040(uint64_t *a1, char a2, uint64_t a3, uint64_t a4)
{
  char v8 = *((unsigned char *)a1 + 8);
  uint64_t v17 = *a1;
  char v18 = v8;
  sub_25E668C38((uint64_t)&v17, a2);
  char v9 = *(char **)a3;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    goto LABEL_32;
  }
  while (1)
  {
    unint64_t v11 = *((void *)v9 + 2);
    unint64_t v10 = *((void *)v9 + 3);
    unint64_t v12 = v11 + 1;
    if (v11 >= v10 >> 1) {
      char v9 = sub_25E64EE6C((char *)(v10 > 1), v11 + 1, 1, v9);
    }
    *((void *)v9 + 2) = v12;
    v9[v11 + 32] = 0;
    *(void *)a3 = v9;
    uint64_t result = sub_25E64C5A4(a3, a4);
    if (v4) {
      return result;
    }
    a4 = *(void *)a3;
    unint64_t v14 = *(void *)(*(void *)a3 + 16);
    unint64_t v15 = v14 - v12;
    if ((uint64_t)(v14 - v12) <= 127) {
      break;
    }
    if (v14 <= v11)
    {
      __break(1u);
    }
    else
    {
      unint64_t v5 = 71 - __clz(v15);
      char v9 = (char *)(v5 >> 3);
      sub_25E64C9F0(v5 >> 3, v11 + 1, v14);
      a4 = *(void *)a3;
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if (result) {
        goto LABEL_8;
      }
    }
    uint64_t result = (uint64_t)sub_25E65A138(a4);
    a4 = result;
LABEL_8:
    if (v11 >= *(void *)(a4 + 16))
    {
      __break(1u);
      goto LABEL_36;
    }
    uint64_t v16 = a4 + 32;
    *(unsigned char *)(a4 + 32 + v11) = (v5 >> 3) | 0x80;
    *(void *)a3 = a4;
    if (v11 + 1 < *(void *)(a4 + 16))
    {
      *(unsigned char *)(v16 + v11 + 1) = v15 >> (8 * (((_BYTE)v9 - 1) & 7u));
      if (v9 == (char *)1) {
        goto LABEL_29;
      }
      if (v11 + 2 < *(void *)(a4 + 16))
      {
        *(unsigned char *)(v16 + v11 + 2) = v15 >> (8 * (((_BYTE)v9 - 2) & 7u));
        if (v9 == (char *)2) {
          goto LABEL_29;
        }
        if (v11 + 3 < *(void *)(a4 + 16))
        {
          *(unsigned char *)(v16 + v11 + 3) = v15 >> (8 * (((_BYTE)v9 - 3) & 7u));
          if (v9 == (char *)3) {
            goto LABEL_29;
          }
          if (v11 + 4 < *(void *)(a4 + 16))
          {
            *(unsigned char *)(v16 + v11 + 4) = v15 >> (8 * (((_BYTE)v9 - 4) & 7u));
            if (v9 == (char *)4) {
              goto LABEL_29;
            }
            if (v11 + 5 < *(void *)(a4 + 16))
            {
              *(unsigned char *)(v16 + v11 + 5) = v15 >> (8 * (((_BYTE)v9 - 5) & 7u));
              if (v9 == (char *)5) {
                goto LABEL_29;
              }
              if (v11 + 6 < *(void *)(a4 + 16))
              {
                *(unsigned char *)(v16 + v11 + 6) = v15 >> (8 * (((_BYTE)v9 - 6) & 7u));
                if (v9 == (char *)6) {
                  goto LABEL_29;
                }
                if (v11 + 7 < *(void *)(a4 + 16))
                {
                  *(unsigned char *)(v16 + v11 + 7) = v15 >> (8 * (((_BYTE)v9 - 7) & 7u));
                  if (v9 == (char *)7) {
                    goto LABEL_29;
                  }
                  if (v11 + 8 < *(void *)(a4 + 16))
                  {
                    *(unsigned char *)(v16 + v11 + 8) = v15 >> (v5 & 0x38);
LABEL_29:
                    *(void *)a3 = a4;
                    return result;
                  }
                }
              }
            }
          }
        }
      }
    }
    __break(1u);
LABEL_32:
    char v9 = sub_25E64EE6C(0, *((void *)v9 + 2) + 1, 1, v9);
  }
  if ((v15 & 0x8000000000000000) != 0)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (result) {
    goto LABEL_27;
  }
LABEL_37:
  uint64_t result = (uint64_t)sub_25E65A138(a4);
  a4 = result;
LABEL_27:
  if (v11 < *(void *)(a4 + 16))
  {
    *(unsigned char *)(a4 + v11 + 32) = v15;
    goto LABEL_29;
  }
  __break(1u);
  return result;
}

uint64_t sub_25E65030C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  int64_t v4 = a4 >> 1;
  uint64_t result = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
LABEL_25:
    __break(1u);
    return result;
  }
  uint64_t v6 = a3;
  uint64_t result = sub_25E6699D0();
  if (v4 != v6)
  {
    uint64_t v21 = v4;
    while (v6 < v4)
    {
      uint64_t v7 = (void *)(a2 + 96 * v6);
      uint64_t v8 = v7[5];
      uint64_t v9 = v7[6];
      uint64_t v10 = v7[10];
      uint64_t v23 = v7[9];
      unint64_t v24 = v7[11];
      unint64_t v12 = v7[7];
      uint64_t v11 = v7[8];
      sub_25E6699D0();
      sub_25E6699D0();
      sub_25E6699D0();
      sub_25E6699E0();
      unint64_t v13 = v12 >> 1;
      uint64_t result = (v12 >> 1) - v9;
      if (__OFSUB__(v12 >> 1, v9)) {
        goto LABEL_21;
      }
      uint64_t result = sub_25E6699D0();
      BOOL v14 = __OFSUB__(v13, v9);
      uint64_t v15 = v13 - v9;
      if (v15)
      {
        if ((v15 < 0) ^ v14 | (v15 == 0)) {
          goto LABEL_23;
        }
        uint64_t v16 = v8 + v9;
        do
        {
          ++v16;
          sub_25E6699E0();
          --v15;
        }
        while (v15);
      }
      if (v11)
      {
        sub_25E6699E0();
        unint64_t v17 = v24 >> 1;
        uint64_t result = (v24 >> 1) - v10;
        if (__OFSUB__(v24 >> 1, v10)) {
          goto LABEL_22;
        }
        uint64_t result = sub_25E6699D0();
        BOOL v18 = __OFSUB__(v17, v10);
        uint64_t v19 = v17 - v10;
        if (v19)
        {
          if ((v19 < 0) ^ v18 | (v19 == 0)) {
            goto LABEL_24;
          }
          uint64_t v20 = v23 + v10;
          do
          {
            ++v20;
            uint64_t result = sub_25E6699E0();
            --v19;
          }
          while (v19);
        }
      }
      else
      {
        uint64_t result = sub_25E6699E0();
      }
      ++v6;
      int64_t v4 = v21;
      if (v6 == v21) {
        return result;
      }
    }
    __break(1u);
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  return result;
}

void sub_25E650478(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  int64_t v5 = a4 >> 1;
  int64_t v6 = a3;
  if (a4 >> 1 != a3)
  {
    uint64_t v7 = (void *)(a2 + 96 * a3 + 16);
    int64_t v6 = a3;
    while (1)
    {
      if (v6 >= v5)
      {
        __break(1u);
        goto LABEL_13;
      }
      if (*(void *)(a5 + 16) >= *v7) {
        break;
      }
      ++v6;
      v7 += 12;
      if (v5 == v6)
      {
        int64_t v6 = a4 >> 1;
        break;
      }
    }
    if (v6 >= a3) {
      goto LABEL_8;
    }
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
LABEL_8:
  if (v5 < a3)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (v5 < v6)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (v6 < 0) {
LABEL_16:
  }
    __break(1u);
}

uint64_t sub_25E6504FC(uint64_t *a1, char a2, char **a3, uint64_t (*a4)(char **))
{
  return sub_25E65054C(a1, a2, a3, a4);
}

uint64_t sub_25E650514(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, void))(*(void *)(v1 + 24) + 8))(a1, *(void *)(v1 + 16));
}

uint64_t sub_25E65054C(uint64_t *a1, char a2, char **a3, uint64_t (*a4)(char **))
{
  char v8 = *((unsigned char *)a1 + 8);
  uint64_t v17 = *a1;
  char v18 = v8;
  sub_25E668C38((uint64_t)&v17, a2);
  uint64_t v9 = *a3;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    goto LABEL_32;
  }
  while (1)
  {
    unint64_t v11 = *((void *)v9 + 2);
    unint64_t v10 = *((void *)v9 + 3);
    unint64_t v12 = v11 + 1;
    if (v11 >= v10 >> 1) {
      uint64_t v9 = sub_25E64EE6C((char *)(v10 > 1), v11 + 1, 1, v9);
    }
    *((void *)v9 + 2) = v12;
    v9[v11 + 32] = 0;
    *a3 = v9;
    uint64_t result = a4(a3);
    if (v4) {
      return result;
    }
    uint64_t v9 = *a3;
    unint64_t v14 = *((void *)*a3 + 2);
    unint64_t v15 = v14 - v12;
    if ((uint64_t)(v14 - v12) <= 127) {
      break;
    }
    if (v14 <= v11)
    {
      __break(1u);
    }
    else
    {
      unint64_t v5 = 71 - __clz(v15);
      a4 = (uint64_t (*)(char **))(v5 >> 3);
      sub_25E64C9F0(v5 >> 3, v11 + 1, v14);
      uint64_t v9 = *a3;
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if (result) {
        goto LABEL_8;
      }
    }
    uint64_t result = (uint64_t)sub_25E65A138((uint64_t)v9);
    uint64_t v9 = (char *)result;
LABEL_8:
    if (v11 >= *((void *)v9 + 2))
    {
      __break(1u);
      goto LABEL_36;
    }
    uint64_t v16 = v9 + 32;
    v9[v11 + 32] = (v5 >> 3) | 0x80;
    *a3 = v9;
    if (v11 + 1 < *((void *)v9 + 2))
    {
      v16[v11 + 1] = v15 >> (8 * (((_BYTE)a4 - 1) & 7u));
      if (a4 == (uint64_t (*)(char **))1) {
        goto LABEL_29;
      }
      if (v11 + 2 < *((void *)v9 + 2))
      {
        v16[v11 + 2] = v15 >> (8 * (((_BYTE)a4 - 2) & 7u));
        if (a4 == (uint64_t (*)(char **))2) {
          goto LABEL_29;
        }
        if (v11 + 3 < *((void *)v9 + 2))
        {
          v16[v11 + 3] = v15 >> (8 * (((_BYTE)a4 - 3) & 7u));
          if (a4 == (uint64_t (*)(char **))3) {
            goto LABEL_29;
          }
          if (v11 + 4 < *((void *)v9 + 2))
          {
            v16[v11 + 4] = v15 >> (8 * (((_BYTE)a4 - 4) & 7u));
            if (a4 == (uint64_t (*)(char **))4) {
              goto LABEL_29;
            }
            if (v11 + 5 < *((void *)v9 + 2))
            {
              v16[v11 + 5] = v15 >> (8 * (((_BYTE)a4 - 5) & 7u));
              if (a4 == (uint64_t (*)(char **))5) {
                goto LABEL_29;
              }
              if (v11 + 6 < *((void *)v9 + 2))
              {
                v16[v11 + 6] = v15 >> (8 * (((_BYTE)a4 - 6) & 7u));
                if (a4 == (uint64_t (*)(char **))6) {
                  goto LABEL_29;
                }
                if (v11 + 7 < *((void *)v9 + 2))
                {
                  v16[v11 + 7] = v15 >> (8 * (((_BYTE)a4 - 7) & 7u));
                  if (a4 == (uint64_t (*)(char **))7) {
                    goto LABEL_29;
                  }
                  if (v11 + 8 < *((void *)v9 + 2))
                  {
                    v16[v11 + 8] = v15 >> (v5 & 0x38);
LABEL_29:
                    *a3 = v9;
                    return result;
                  }
                }
              }
            }
          }
        }
      }
    }
    __break(1u);
LABEL_32:
    uint64_t v9 = sub_25E64EE6C(0, *((void *)v9 + 2) + 1, 1, v9);
  }
  if ((v15 & 0x8000000000000000) != 0)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (result) {
    goto LABEL_27;
  }
LABEL_37:
  uint64_t result = (uint64_t)sub_25E65A138((uint64_t)v9);
  uint64_t v9 = (char *)result;
LABEL_27:
  if (v11 < *((void *)v9 + 2))
  {
    v9[v11 + 32] = v15;
    goto LABEL_29;
  }
  __break(1u);
  return result;
}

uint64_t sub_25E650828(uint64_t a1)
{
  return sub_25E64BC68(a1, *(void *)(v1 + 40), *(void *)(v1 + 16), *(char **)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_25E650848@<X0>(void *a1@<X1>, unint64_t *a2@<X8>)
{
  return sub_25E64C1AC(*(void *)(v2 + 40), *(void *)(v2 + 32), a1, a2);
}

uint64_t sub_25E65086C(uint64_t *a1, char a2, char **a3, uint64_t *a4, unint64_t a5)
{
  uint64_t v7 = v5;
  char v11 = *((unsigned char *)a1 + 8);
  uint64_t v24 = *a1;
  char v25 = v11;
  sub_25E668C38((uint64_t)&v24, a2);
  unint64_t v12 = *a3;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    goto LABEL_43;
  }
  while (1)
  {
    unint64_t v14 = *((void *)v12 + 2);
    unint64_t v13 = *((void *)v12 + 3);
    uint64_t v15 = v14 + 1;
    if (v14 >= v13 >> 1) {
      unint64_t v12 = sub_25E64EE6C((char *)(v13 > 1), v14 + 1, 1, v12);
    }
    *((void *)v12 + 2) = v15;
    v12[v14 + 32] = 0;
    *a3 = v12;
    uint64_t v16 = a4[2];
    if (v16)
    {
      uint64_t v26 = v7;
      unint64_t v12 = (char *)(a5 + 32);
      uint64_t v7 = *(void *)(a5 + 16);
      swift_bridgeObjectRetain();
      a4 += 5;
      while (1)
      {
        uint64_t v17 = *(a4 - 1);
        if (v17 < 0) {
          break;
        }
        uint64_t v18 = *a4;
        if (v7 < v17 || v7 < v18) {
          goto LABEL_40;
        }
        if (v18 < 0) {
          goto LABEL_41;
        }
        a4 += 2;
        unint64_t v6 = (2 * v18) | 1;
        uint64_t v20 = swift_bridgeObjectRetain();
        sub_25E65E8B4(v20, a5 + 32, v17, v6);
        swift_bridgeObjectRelease();
        if (!--v16)
        {
          swift_bridgeObjectRelease();
          unint64_t v12 = *a3;
          uint64_t v7 = v26;
          uint64_t v15 = v14 + 1;
          goto LABEL_14;
        }
      }
      __break(1u);
LABEL_40:
      __break(1u);
LABEL_41:
      __break(1u);
      goto LABEL_42;
    }
LABEL_14:
    unint64_t v21 = *((void *)v12 + 2);
    a5 = v21 - v15;
    if ((uint64_t)(v21 - v15) <= 127) {
      break;
    }
    if (v21 <= v14)
    {
      __break(1u);
      goto LABEL_45;
    }
    unint64_t v6 = 71 - __clz(a5);
    a4 = (uint64_t *)(v6 >> 3);
    sub_25E64C9F0(v6 >> 3, v15, v21);
    unint64_t v12 = *a3;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0) {
      goto LABEL_46;
    }
LABEL_17:
    if (v14 >= *((void *)v12 + 2))
    {
      __break(1u);
      goto LABEL_48;
    }
    uint64_t v23 = v12 + 32;
    v12[v14 + 32] = (v6 >> 3) | 0x80;
    *a3 = v12;
    if (v14 + 1 < *((void *)v12 + 2))
    {
      v23[v14 + 1] = a5 >> (8 * (((_BYTE)a4 - 1) & 7u));
      if (a4 == (uint64_t *)1) {
        goto LABEL_38;
      }
      if (v14 + 2 < *((void *)v12 + 2))
      {
        v23[v14 + 2] = a5 >> (8 * (((_BYTE)a4 - 2) & 7u));
        if (a4 == (uint64_t *)2) {
          goto LABEL_38;
        }
        if (v14 + 3 < *((void *)v12 + 2))
        {
          v23[v14 + 3] = a5 >> (8 * (((_BYTE)a4 - 3) & 7u));
          if (a4 == (uint64_t *)3) {
            goto LABEL_38;
          }
          if (v14 + 4 < *((void *)v12 + 2))
          {
            v23[v14 + 4] = a5 >> (8 * (((_BYTE)a4 - 4) & 7u));
            if (a4 == (uint64_t *)4) {
              goto LABEL_38;
            }
            if (v14 + 5 < *((void *)v12 + 2))
            {
              v23[v14 + 5] = a5 >> (8 * (((_BYTE)a4 - 5) & 7u));
              if (a4 == (uint64_t *)5) {
                goto LABEL_38;
              }
              if (v14 + 6 < *((void *)v12 + 2))
              {
                v23[v14 + 6] = a5 >> (8 * (((_BYTE)a4 - 6) & 7u));
                if (a4 == (uint64_t *)6) {
                  goto LABEL_38;
                }
                if (v14 + 7 < *((void *)v12 + 2))
                {
                  v23[v14 + 7] = a5 >> (8 * (((_BYTE)a4 - 7) & 7u));
                  if (a4 == (uint64_t *)7) {
                    goto LABEL_38;
                  }
                  if (v14 + 8 < *((void *)v12 + 2))
                  {
                    v23[v14 + 8] = a5 >> (v6 & 0x38);
LABEL_38:
                    *a3 = v12;
                    return result;
                  }
                }
              }
            }
          }
        }
      }
    }
LABEL_42:
    __break(1u);
LABEL_43:
    unint64_t v12 = sub_25E64EE6C(0, *((void *)v12 + 2) + 1, 1, v12);
  }
  if ((a5 & 0x8000000000000000) != 0)
  {
LABEL_45:
    __break(1u);
LABEL_46:
    uint64_t result = (uint64_t)sub_25E65A138((uint64_t)v12);
    unint64_t v12 = (char *)result;
    goto LABEL_17;
  }
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (result) {
    goto LABEL_36;
  }
LABEL_48:
  uint64_t result = (uint64_t)sub_25E65A138((uint64_t)v12);
  unint64_t v12 = (char *)result;
LABEL_36:
  if (v14 < *((void *)v12 + 2))
  {
    v12[v14 + 32] = a5;
    goto LABEL_38;
  }
  __break(1u);
  return result;
}

uint64_t sub_25E650BC0(uint64_t __src, uint64_t *__dst, unint64_t a3, char *a4, uint64_t a5)
{
  unint64_t v6 = __dst;
  uint64_t v7 = (uint64_t *)__src;
  uint64_t v8 = (uint64_t)__dst - __src;
  uint64_t v9 = (uint64_t)__dst - __src + 15;
  if ((uint64_t)__dst - __src >= 0) {
    uint64_t v9 = (uint64_t)__dst - __src;
  }
  uint64_t v10 = v9 >> 4;
  uint64_t v11 = a3 - (void)__dst;
  uint64_t v12 = a3 - (void)__dst + 15;
  if ((uint64_t)(a3 - (void)__dst) >= 0) {
    uint64_t v12 = a3 - (void)__dst;
  }
  uint64_t v13 = v12 >> 4;
  if (v10 < v12 >> 4)
  {
    unint64_t v14 = (int64_t *)a4;
    if (a4 != (char *)__src || __src + 16 * v10 <= (unint64_t)a4) {
      __src = (uint64_t)memmove(a4, (const void *)__src, 16 * v10);
    }
    uint64_t v15 = &a4[16 * v10];
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      uint64_t v16 = *(void *)(a5 + 16);
      while (1)
      {
        uint64_t v17 = *v6;
        if (*v6 < 0)
        {
          __break(1u);
LABEL_75:
          __break(1u);
LABEL_76:
          __break(1u);
LABEL_77:
          __break(1u);
LABEL_78:
          __break(1u);
LABEL_79:
          __break(1u);
          goto LABEL_80;
        }
        uint64_t v18 = v6[1];
        if (v18 < 0) {
          goto LABEL_75;
        }
        int64_t v19 = *v14;
        if (*v14 < 0) {
          goto LABEL_76;
        }
        int64_t v20 = v14[1];
        if (v16 < v17 || v16 < v18 || v16 < v19 || v16 < v20) {
          goto LABEL_77;
        }
        if (v20 < 0) {
          goto LABEL_78;
        }
        uint64_t v24 = v6;
        char v25 = v15;
        unint64_t v26 = (2 * v18) | 1;
        unint64_t v27 = (2 * v20) | 1;
        uint64_t v28 = swift_bridgeObjectRetain();
        sub_25E64C26C(v28, a5 + 32, v17, v26, a5, a5 + 32, v19, v27);
        LOBYTE(v27) = v29;
        __src = swift_bridgeObjectRelease();
        if ((v27 & 1) == 0) {
          break;
        }
        uint64_t v30 = v24;
        unint64_t v6 = v24 + 2;
        uint64_t v15 = v25;
        if (v7 != v24) {
          goto LABEL_30;
        }
LABEL_31:
        v7 += 2;
        if (v14 >= (int64_t *)v15 || (unint64_t)v6 >= a3)
        {
          unint64_t v6 = v7;
          goto LABEL_70;
        }
      }
      uint64_t v30 = v14;
      BOOL v31 = v7 == v14;
      v14 += 2;
      unint64_t v6 = v24;
      uint64_t v15 = v25;
      if (v31) {
        goto LABEL_31;
      }
LABEL_30:
      *(_OWORD *)uint64_t v7 = *(_OWORD *)v30;
      goto LABEL_31;
    }
    unint64_t v6 = v7;
LABEL_70:
    if (v6 != v14
      || v6 >= (int64_t *)((char *)v14
                                + ((v15 - (char *)v14 + (v15 - (char *)v14 < 0 ? 0xFuLL : 0)) & 0xFFFFFFFFFFFFFFF0)))
    {
      memmove(v6, v14, 16 * ((v15 - (char *)v14) / 16));
    }
    return 1;
  }
  if (a4 != (char *)__dst || &__dst[2 * v13] <= (uint64_t *)a4) {
    __src = (uint64_t)memmove(a4, __dst, 16 * v13);
  }
  uint64_t v15 = &a4[16 * v13];
  unint64_t v14 = (int64_t *)a4;
  if (v7 >= v6 || v11 < 16) {
    goto LABEL_70;
  }
  unint64_t v50 = (int64_t *)a4;
  uint64_t v51 = *(void *)(a5 + 16);
  uint64_t v32 = (uint64_t *)(a3 - 16);
  char v49 = v7;
  while (1)
  {
    uint64_t v34 = v15 - 16;
    uint64_t v33 = *((void *)v15 - 2);
    if (v33 < 0) {
      goto LABEL_79;
    }
    uint64_t v35 = *((void *)v15 - 1);
    if (v35 < 0) {
      break;
    }
    uint64_t v36 = v6 - 2;
    int64_t v37 = *(v6 - 2);
    if (v37 < 0) {
      goto LABEL_81;
    }
    uint64_t v38 = *(v6 - 1);
    if (v51 < v33 || v51 < v35 || v51 < v37 || v51 < v38) {
      goto LABEL_82;
    }
    if (v38 < 0) {
      goto LABEL_83;
    }
    uint64_t v53 = (uint64_t *)v15;
    uint64_t v42 = v32 + 2;
    unint64_t v43 = (2 * v35) | 1;
    unint64_t v44 = (2 * v38) | 1;
    uint64_t v45 = swift_bridgeObjectRetain();
    sub_25E64C26C(v45, a5 + 32, v33, v43, a5, a5 + 32, v37, v44);
    LOBYTE(v43) = v46;
    __src = swift_bridgeObjectRelease();
    if ((v43 & 1) == 0)
    {
      unint64_t v47 = (unint64_t)v49;
      uint64_t v36 = (uint64_t *)v34;
      if (v42 == v53)
      {
        uint64_t v15 = v34;
        unint64_t v14 = v50;
        if (v32 < v53) {
          goto LABEL_66;
        }
        goto LABEL_65;
      }
      uint64_t v15 = v34;
LABEL_64:
      unint64_t v14 = v50;
LABEL_65:
      *(_OWORD *)uint64_t v32 = *(_OWORD *)v36;
      goto LABEL_66;
    }
    unint64_t v47 = (unint64_t)v49;
    uint64_t v15 = (char *)v53;
    if (v42 != v6)
    {
      v6 -= 2;
      goto LABEL_64;
    }
    BOOL v48 = v32 >= v6;
    v6 -= 2;
    unint64_t v14 = v50;
    if (v48) {
      goto LABEL_65;
    }
LABEL_66:
    if ((unint64_t)v6 > v47)
    {
      v32 -= 2;
      if (v15 > (char *)v14) {
        continue;
      }
    }
    goto LABEL_70;
  }
LABEL_80:
  __break(1u);
LABEL_81:
  __break(1u);
LABEL_82:
  __break(1u);
LABEL_83:
  __break(1u);
  return __src;
}

uint64_t sub_25E650F5C(uint64_t *a1, uint64_t a2)
{
  uint64_t v5 = a1[1];
  swift_bridgeObjectRetain_n();
  uint64_t v6 = sub_25E669930();
  uint64_t v174 = a2;
  uint64_t v162 = v5;
  if (v6 < v5)
  {
    if (v5 >= 0) {
      uint64_t v7 = v5;
    }
    else {
      uint64_t v7 = v5 + 1;
    }
    if (v5 < -1)
    {
LABEL_258:
      __break(1u);
      goto LABEL_259;
    }
    uint64_t v157 = v6;
    uint64_t v170 = v2;
    v154 = a1;
    if (v5 <= 1)
    {
      uint64_t v11 = MEMORY[0x263F8EE78];
      v161 = (char *)(MEMORY[0x263F8EE78] + 32);
      if (v5 != 1)
      {
        unint64_t v71 = *(void *)(MEMORY[0x263F8EE78] + 16);
        unint64_t v14 = (char *)MEMORY[0x263F8EE78];
        goto LABEL_191;
      }
      uint64_t v156 = MEMORY[0x263F8EE78];
    }
    else
    {
      uint64_t v8 = v7 >> 1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B38DC70);
      uint64_t v9 = sub_25E669680();
      *(void *)(v9 + 16) = v8;
      uint64_t v156 = v9;
      v161 = (char *)(v9 + 32);
    }
    uint64_t v12 = 0;
    uint64_t v13 = *a1;
    uint64_t v165 = a2 + 32;
    uint64_t v155 = *a1 + 40;
    uint64_t v153 = *a1 - 16;
    uint64_t v158 = a2 + 33;
    unint64_t v14 = (char *)MEMORY[0x263F8EE78];
    uint64_t v171 = *a1;
LABEL_15:
    while (2)
    {
      uint64_t v15 = v12++;
      v160 = v14;
      *(void *)v167 = v15;
      if (v12 >= v5) {
        goto LABEL_59;
      }
      uint64_t v16 = (uint64_t *)(v13 + 16 * v12);
      uint64_t v17 = *v16;
      if (*v16 < 0) {
        goto LABEL_252;
      }
      uint64_t v18 = v16[1];
      if (v18 < 0) {
        goto LABEL_253;
      }
      int64_t v19 = (unint64_t *)(v13 + 16 * v15);
      unint64_t v20 = *v19;
      if ((*v19 & 0x8000000000000000) != 0) {
        goto LABEL_254;
      }
      int64_t v21 = v19[1];
      int64_t v22 = *(void *)(a2 + 16);
      BOOL v23 = v22 >= v21 && v22 >= v20;
      BOOL v24 = !v23 || v22 < v17;
      if (v24 || v22 < v18) {
        goto LABEL_255;
      }
      if (v21 < 0) {
        goto LABEL_256;
      }
      unint64_t v26 = (2 * v18) | 1;
      unint64_t v27 = (2 * v21) | 1;
      uint64_t v28 = swift_bridgeObjectRetain();
      sub_25E64C26C(v28, v165, v17, v26, a2, v165, v20, v27);
      int v30 = v29;
      swift_bridgeObjectRelease();
      uint64_t v12 = *(void *)v167 + 2;
      if (*(void *)v167 + 2 >= v5)
      {
LABEL_51:
        uint64_t v13 = v171;
        uint64_t v15 = *(void *)v167;
        if ((v30 & 1) == 0) {
          goto LABEL_59;
        }
      }
      else
      {
        BOOL v31 = (int64_t *)(v155 + 16 * *(void *)v167);
        do
        {
          uint64_t v32 = *(v31 - 1);
          if (v32 < 0) {
            goto LABEL_230;
          }
          int64_t v33 = *v31;
          if (*v31 < 0) {
            goto LABEL_231;
          }
          int64_t v34 = *(v31 - 3);
          if (v34 < 0) {
            goto LABEL_232;
          }
          int64_t v35 = *(v31 - 2);
          if (v22 < v32 || v22 < v33 || v22 < v34 || v22 < v35) {
            goto LABEL_233;
          }
          if (v35 < 0) {
            goto LABEL_234;
          }
          unint64_t v39 = (2 * v33) | 1;
          unint64_t v40 = (2 * v35) | 1;
          uint64_t v41 = swift_bridgeObjectRetain();
          sub_25E64C26C(v41, v165, v32, v39, v174, v165, v34, v40);
          LODWORD(v40) = v42;
          swift_bridgeObjectRelease();
          if ((v30 ^ v40))
          {
            a2 = v174;
            unint64_t v14 = v160;
            goto LABEL_51;
          }
          v31 += 2;
          ++v12;
          unint64_t v14 = v160;
          uint64_t v13 = v171;
        }
        while (v5 != v12);
        uint64_t v12 = v5;
        a2 = v174;
        uint64_t v15 = *(void *)v167;
        if ((v30 & 1) == 0) {
          goto LABEL_59;
        }
      }
      if (v12 < v15) {
        goto LABEL_262;
      }
      if (v15 < v12)
      {
        unint64_t v43 = (long long *)(v153 + 16 * v12);
        uint64_t v44 = v12;
        uint64_t v45 = v15;
        char v46 = (long long *)(v13 + 16 * v15);
        do
        {
          if (v45 != --v44)
          {
            if (!v13) {
              goto LABEL_266;
            }
            long long v47 = *v46;
            *char v46 = *v43;
            *unint64_t v43 = v47;
          }
          ++v45;
          --v43;
          ++v46;
        }
        while (v45 < v44);
      }
LABEL_59:
      if (v12 < v5)
      {
        if (__OFSUB__(v12, v15)) {
          goto LABEL_257;
        }
        if (v12 - v15 < v157)
        {
          uint64_t v48 = v15 + v157;
          if (__OFADD__(v15, v157)) {
            goto LABEL_260;
          }
          if (v48 >= v5) {
            uint64_t v48 = v5;
          }
          if (v48 < v15) {
            goto LABEL_261;
          }
          if (v12 != v48)
          {
            uint64_t v49 = *(void *)(a2 + 16);
            uint64_t v159 = v48;
LABEL_70:
            long long v50 = *(_OWORD *)(v13 + 16 * v12);
            uint64_t v163 = v12;
            uint64_t v51 = v12;
            while (1)
            {
              uint64_t v52 = v50;
              if ((v50 & 0x8000000000000000) != 0) {
                goto LABEL_212;
              }
              uint64_t v53 = *((void *)&v50 + 1);
              if ((*((void *)&v50 + 1) & 0x8000000000000000) != 0) {
                goto LABEL_213;
              }
              uint64_t v54 = v51 - 1;
              uint64_t v55 = (uint64_t *)(v13 + 16 * (v51 - 1));
              uint64_t v56 = *v55;
              if (*v55 < 0) {
                goto LABEL_214;
              }
              if (v49 < (uint64_t)v50) {
                goto LABEL_215;
              }
              uint64_t v57 = v55[1];
              BOOL v58 = v49 < *((uint64_t *)&v50 + 1) || v49 < v56;
              if (v58 || v49 < v57) {
                goto LABEL_215;
              }
              if (v57 < 0) {
                goto LABEL_216;
              }
              uint64_t v60 = *((void *)&v50 + 1) - v50;
              if (*((void *)&v50 + 1) != (void)v50)
              {
                if (*((void *)&v50 + 1) <= (unint64_t)v50) {
                  goto LABEL_229;
                }
                if (v57 != v56)
                {
                  if (v57 <= (unint64_t)v56) {
                    goto LABEL_245;
                  }
                  unsigned int v63 = *(unsigned __int8 *)(v165 + v50);
                  unsigned int v64 = *(unsigned __int8 *)(v165 + v56);
                  if (v63 < v64) {
                    goto LABEL_98;
                  }
                  if (v64 < v63) {
                    goto LABEL_69;
                  }
                  uint64_t v65 = 0;
                  while (~(void)v50 + *((void *)&v50 + 1) != v65)
                  {
                    if ((uint64_t)v50 + v65 + 1 >= *((uint64_t *)&v50 + 1)) {
                      goto LABEL_217;
                    }
                    if (~v56 + v57 == v65) {
                      break;
                    }
                    uint64_t v66 = v56 + v65 + 1;
                    if (v66 < v56 || v66 >= v57) {
                      goto LABEL_218;
                    }
                    unsigned int v67 = *(unsigned __int8 *)(v158 + v50 + v65);
                    unsigned int v68 = *(unsigned __int8 *)(v158 + v56 + v65);
                    if (v67 < v68) {
                      goto LABEL_98;
                    }
                    ++v65;
                    if (v68 < v67) {
                      goto LABEL_69;
                    }
                  }
                }
              }
              swift_unknownObjectRetain();
              if (v60 < 0) {
                goto LABEL_224;
              }
              if (v53 == v52 || v57 - v56 < 0 || (uint64_t v61 = v57, v57 - v56 >= v60))
              {
                uint64_t v61 = v56 + v60;
                if (__OFADD__(v56, v60)) {
                  goto LABEL_228;
                }
                if (v57 < v61) {
                  goto LABEL_220;
                }
              }
              if (v61 < v56) {
                goto LABEL_225;
              }
              if (v57 < v56) {
                goto LABEL_226;
              }
              if (v61 == v57) {
                goto LABEL_68;
              }
              if (v61 >= v57) {
                goto LABEL_227;
              }
              if (!*(unsigned char *)(v165 + v61))
              {
                if (v61 + 1 != v57)
                {
                  while (v61 + 1 < v57)
                  {
                    if (*(unsigned char *)(a2 + v61 + 33)) {
                      goto LABEL_97;
                    }
                    if (v57 - 1 == ++v61) {
                      goto LABEL_68;
                    }
                  }
                  __break(1u);
                  goto LABEL_207;
                }
LABEL_68:
                swift_bridgeObjectRelease();
                uint64_t v13 = v171;
LABEL_69:
                uint64_t v12 = v163 + 1;
                if (v163 + 1 != v159) {
                  goto LABEL_70;
                }
                uint64_t v12 = v159;
                uint64_t v5 = v162;
                unint64_t v14 = v160;
                uint64_t v15 = *(void *)v167;
                break;
              }
LABEL_97:
              swift_bridgeObjectRelease();
              uint64_t v13 = v171;
LABEL_98:
              if (!v13) {
                goto LABEL_265;
              }
              uint64_t v62 = (long long *)(v13 + 16 * v51);
              long long v50 = *v62;
              *uint64_t v62 = *(_OWORD *)v55;
              *(_OWORD *)uint64_t v55 = v50;
              --v51;
              if (v54 == *(void *)v167) {
                goto LABEL_69;
              }
            }
          }
        }
      }
      if (v12 < v15) {
        goto LABEL_251;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v14 = sub_25E64F074(0, *((void *)v14 + 2) + 1, 1, v14);
      }
      unint64_t v70 = *((void *)v14 + 2);
      unint64_t v69 = *((void *)v14 + 3);
      unint64_t v71 = v70 + 1;
      uint64_t v13 = v171;
      if (v70 >= v69 >> 1)
      {
        v122 = sub_25E64F074((char *)(v69 > 1), v70 + 1, 1, v14);
        uint64_t v13 = v171;
        unint64_t v14 = v122;
      }
      *((void *)v14 + 2) = v71;
      uint64_t v72 = v14 + 32;
      long long v73 = &v14[16 * v70 + 32];
      *(void *)long long v73 = *(void *)v167;
      *((void *)v73 + 1) = v12;
      if (v70)
      {
        uint64_t v164 = v12;
        while (1)
        {
          unint64_t v74 = v71 - 1;
          if (v71 >= 4)
          {
            uint64_t v79 = &v72[16 * v71];
            uint64_t v80 = *((void *)v79 - 8);
            uint64_t v81 = *((void *)v79 - 7);
            BOOL v85 = __OFSUB__(v81, v80);
            uint64_t v82 = v81 - v80;
            if (v85) {
              goto LABEL_235;
            }
            uint64_t v84 = *((void *)v79 - 6);
            uint64_t v83 = *((void *)v79 - 5);
            BOOL v85 = __OFSUB__(v83, v84);
            uint64_t v77 = v83 - v84;
            char v78 = v85;
            if (v85) {
              goto LABEL_236;
            }
            unint64_t v86 = v71 - 2;
            v87 = &v72[16 * v71 - 32];
            uint64_t v89 = *(void *)v87;
            uint64_t v88 = *((void *)v87 + 1);
            BOOL v85 = __OFSUB__(v88, v89);
            uint64_t v90 = v88 - v89;
            if (v85) {
              goto LABEL_237;
            }
            BOOL v85 = __OFADD__(v77, v90);
            uint64_t v91 = v77 + v90;
            if (v85) {
              goto LABEL_239;
            }
            if (v91 >= v82)
            {
              v109 = &v72[16 * v74];
              uint64_t v111 = *(void *)v109;
              uint64_t v110 = *((void *)v109 + 1);
              BOOL v85 = __OFSUB__(v110, v111);
              uint64_t v112 = v110 - v111;
              if (v85) {
                goto LABEL_246;
              }
              BOOL v102 = v77 < v112;
              goto LABEL_157;
            }
          }
          else
          {
            if (v71 != 3)
            {
              uint64_t v103 = *((void *)v14 + 4);
              uint64_t v104 = *((void *)v14 + 5);
              BOOL v85 = __OFSUB__(v104, v103);
              uint64_t v96 = v104 - v103;
              char v97 = v85;
LABEL_151:
              if (v97) {
                goto LABEL_241;
              }
              v105 = &v72[16 * v74];
              uint64_t v107 = *(void *)v105;
              uint64_t v106 = *((void *)v105 + 1);
              BOOL v85 = __OFSUB__(v106, v107);
              uint64_t v108 = v106 - v107;
              if (v85) {
                goto LABEL_243;
              }
              if (v108 < v96) {
                goto LABEL_14;
              }
              goto LABEL_159;
            }
            uint64_t v76 = *((void *)v14 + 4);
            uint64_t v75 = *((void *)v14 + 5);
            BOOL v85 = __OFSUB__(v75, v76);
            uint64_t v77 = v75 - v76;
            char v78 = v85;
          }
          if (v78) {
            goto LABEL_238;
          }
          unint64_t v86 = v71 - 2;
          v92 = &v72[16 * v71 - 32];
          uint64_t v94 = *(void *)v92;
          uint64_t v93 = *((void *)v92 + 1);
          BOOL v95 = __OFSUB__(v93, v94);
          uint64_t v96 = v93 - v94;
          char v97 = v95;
          if (v95) {
            goto LABEL_240;
          }
          v98 = &v72[16 * v74];
          uint64_t v100 = *(void *)v98;
          uint64_t v99 = *((void *)v98 + 1);
          BOOL v85 = __OFSUB__(v99, v100);
          uint64_t v101 = v99 - v100;
          if (v85) {
            goto LABEL_242;
          }
          if (__OFADD__(v96, v101)) {
            goto LABEL_244;
          }
          if (v96 + v101 < v77) {
            goto LABEL_151;
          }
          BOOL v102 = v77 < v101;
LABEL_157:
          if (v102) {
            unint64_t v74 = v86;
          }
LABEL_159:
          unint64_t v113 = v74 - 1;
          if (v74 - 1 >= v71) {
            goto LABEL_219;
          }
          if (!v13) {
            goto LABEL_264;
          }
          v114 = &v72[16 * v113];
          uint64_t v115 = *(void *)v114;
          unint64_t v116 = v74;
          v117 = &v72[16 * v74];
          uint64_t v118 = *((void *)v117 + 1);
          uint64_t v119 = v13 + 16 * *(void *)v114;
          v120 = (uint64_t *)(v13 + 16 * *(void *)v117);
          unint64_t v168 = v13 + 16 * v118;
          swift_bridgeObjectRetain();
          sub_25E650BC0(v119, v120, v168, v161, v174);
          if (v170)
          {
LABEL_169:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            *(void *)(v156 + 16) = 0;
            swift_bridgeObjectRelease_n();
            return swift_bridgeObjectRelease();
          }
          swift_bridgeObjectRelease();
          if (v118 < v115) {
            goto LABEL_221;
          }
          if (v116 > *((void *)v14 + 2)) {
            goto LABEL_222;
          }
          *(void *)v114 = v115;
          uint64_t v72 = v14 + 32;
          *(void *)&v14[16 * v113 + 40] = v118;
          unint64_t v121 = *((void *)v14 + 2);
          if (v116 >= v121) {
            goto LABEL_223;
          }
          uint64_t v170 = 0;
          unint64_t v71 = v121 - 1;
          memmove(v117, v117 + 16, 16 * (v121 - 1 - v116));
          *((void *)v14 + 2) = v121 - 1;
          BOOL v24 = v121 > 2;
          a2 = v174;
          uint64_t v5 = v162;
          uint64_t v12 = v164;
          uint64_t v13 = v171;
          if (!v24)
          {
LABEL_14:
            if (v12 >= v5) {
              goto LABEL_205;
            }
            goto LABEL_15;
          }
        }
      }
      unint64_t v71 = 1;
      if (v12 < v5) {
        continue;
      }
      break;
    }
LABEL_205:
    uint64_t v11 = v156;
LABEL_191:
    uint64_t v156 = v11;
    if (v71 < 2)
    {
LABEL_202:
      swift_bridgeObjectRelease();
      *(void *)(v156 + 16) = 0;
      swift_bridgeObjectRelease_n();
      return swift_bridgeObjectRelease();
    }
    uint64_t v143 = *v154;
    uint64_t v173 = *v154;
    while (1)
    {
      unint64_t v144 = v71 - 2;
      if (v71 < 2) {
        break;
      }
      if (!v143) {
        goto LABEL_267;
      }
      uint64_t v145 = (uint64_t)v14;
      uint64_t v146 = *(void *)&v14[16 * v144 + 32];
      uint64_t v147 = *(void *)&v14[16 * v71 + 24];
      uint64_t v148 = v143 + 16 * v146;
      v149 = (uint64_t *)(v143 + 16 * *(void *)&v14[16 * v71 + 16]);
      unint64_t v150 = v143 + 16 * v147;
      swift_bridgeObjectRetain();
      sub_25E650BC0(v148, v149, v150, v161, v174);
      if (v170) {
        goto LABEL_169;
      }
      swift_bridgeObjectRelease();
      if (v147 < v146) {
        goto LABEL_248;
      }
      unint64_t v14 = (char *)v145;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v14 = sub_25E64F170(v145);
      }
      if (v144 >= *((void *)v14 + 2)) {
        goto LABEL_249;
      }
      v151 = &v14[16 * v144 + 32];
      *(void *)v151 = v146;
      *((void *)v151 + 1) = v147;
      unint64_t v152 = *((void *)v14 + 2);
      if (v71 > v152) {
        goto LABEL_250;
      }
      memmove(&v14[16 * v71 + 16], &v14[16 * v71 + 32], 16 * (v152 - v71));
      *((void *)v14 + 2) = v152 - 1;
      unint64_t v71 = v152 - 1;
      uint64_t v143 = v173;
      if (v152 <= 2) {
        goto LABEL_202;
      }
    }
LABEL_247:
    __break(1u);
LABEL_248:
    __break(1u);
LABEL_249:
    __break(1u);
LABEL_250:
    __break(1u);
LABEL_251:
    __break(1u);
LABEL_252:
    __break(1u);
LABEL_253:
    __break(1u);
LABEL_254:
    __break(1u);
LABEL_255:
    __break(1u);
LABEL_256:
    __break(1u);
LABEL_257:
    __break(1u);
    goto LABEL_258;
  }
  if ((v5 & 0x8000000000000000) == 0)
  {
    if ((unint64_t)v5 <= 1) {
      return swift_bridgeObjectRelease_n();
    }
    uint64_t v123 = *a1;
    uint64_t v124 = a2 + 32;
    uint64_t v125 = *(void *)(a2 + 16);
    swift_bridgeObjectRetain();
    uint64_t v126 = -1;
    uint64_t v127 = v123;
    uint64_t v128 = v123;
    uint64_t v129 = 1;
LABEL_172:
    uint64_t v166 = v129;
    long long v130 = *(_OWORD *)(v127 + 16 * v129);
    uint64_t v172 = v126;
    *(void *)v169 = v128;
    while (1)
    {
      uint64_t v131 = v130;
      if ((v130 & 0x8000000000000000) != 0) {
        break;
      }
      if ((*((void *)&v130 + 1) & 0x8000000000000000) != 0) {
        goto LABEL_208;
      }
      int64_t v132 = *(void *)v128;
      if ((*(void *)v128 & 0x8000000000000000) != 0) {
        goto LABEL_209;
      }
      if (v125 < (uint64_t)v130) {
        goto LABEL_210;
      }
      uint64_t v133 = *(void *)(v128 + 8);
      BOOL v134 = v125 < *((uint64_t *)&v130 + 1) || v125 < v132;
      if (v134 || v125 < v133) {
        goto LABEL_210;
      }
      if (v133 < 0) {
        goto LABEL_211;
      }
      unint64_t v136 = (2 * *((void *)&v130 + 1)) | 1;
      unint64_t v137 = (2 * v133) | 1;
      uint64_t v138 = swift_bridgeObjectRetain();
      sub_25E64C26C(v138, v124, v131, v136, v174, v124, v132, v137);
      char v140 = v139;
      swift_bridgeObjectRelease();
      if (v140)
      {
        if (!v127) {
          goto LABEL_263;
        }
        v141 = (_OWORD *)(v128 + 16);
        long long v142 = *(_OWORD *)v128;
        long long v130 = *(_OWORD *)(v128 + 16);
        *(_OWORD *)uint64_t v128 = v130;
        v128 -= 16;
        _OWORD *v141 = v142;
        BOOL v23 = __CFADD__(v126++, 1);
        if (!v23) {
          continue;
        }
      }
      uint64_t v129 = v166 + 1;
      uint64_t v128 = *(void *)v169 + 16;
      uint64_t v126 = v172 - 1;
      if (v166 + 1 == v162) {
        return swift_bridgeObjectRelease_n();
      }
      goto LABEL_172;
    }
LABEL_207:
    __break(1u);
LABEL_208:
    __break(1u);
LABEL_209:
    __break(1u);
LABEL_210:
    __break(1u);
LABEL_211:
    __break(1u);
LABEL_212:
    __break(1u);
LABEL_213:
    __break(1u);
LABEL_214:
    __break(1u);
LABEL_215:
    __break(1u);
LABEL_216:
    __break(1u);
LABEL_217:
    __break(1u);
LABEL_218:
    __break(1u);
LABEL_219:
    __break(1u);
LABEL_220:
    __break(1u);
LABEL_221:
    __break(1u);
LABEL_222:
    __break(1u);
LABEL_223:
    __break(1u);
LABEL_224:
    __break(1u);
LABEL_225:
    __break(1u);
LABEL_226:
    __break(1u);
LABEL_227:
    __break(1u);
LABEL_228:
    __break(1u);
LABEL_229:
    __break(1u);
LABEL_230:
    __break(1u);
LABEL_231:
    __break(1u);
LABEL_232:
    __break(1u);
LABEL_233:
    __break(1u);
LABEL_234:
    __break(1u);
LABEL_235:
    __break(1u);
LABEL_236:
    __break(1u);
LABEL_237:
    __break(1u);
LABEL_238:
    __break(1u);
LABEL_239:
    __break(1u);
LABEL_240:
    __break(1u);
LABEL_241:
    __break(1u);
LABEL_242:
    __break(1u);
LABEL_243:
    __break(1u);
LABEL_244:
    __break(1u);
LABEL_245:
    __break(1u);
LABEL_246:
    __break(1u);
    goto LABEL_247;
  }
LABEL_259:
  __break(1u);
LABEL_260:
  __break(1u);
LABEL_261:
  __break(1u);
LABEL_262:
  __break(1u);
LABEL_263:
  __break(1u);
LABEL_264:
  swift_bridgeObjectRelease_n();
  __break(1u);
LABEL_265:
  swift_bridgeObjectRelease_n();
  __break(1u);
LABEL_266:
  swift_bridgeObjectRelease_n();
  __break(1u);
LABEL_267:
  uint64_t result = swift_bridgeObjectRelease_n();
  __break(1u);
  return result;
}

uint64_t sub_25E651AD0(char **a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  swift_bridgeObjectRetain_n();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v4 = sub_25E666358((uint64_t)v4);
  }
  uint64_t v5 = *((void *)v4 + 2);
  v7[0] = (uint64_t)(v4 + 32);
  v7[1] = v5;
  swift_bridgeObjectRetain();
  sub_25E650F5C(v7, a2);
  swift_bridgeObjectRelease();
  *a1 = v4;
  return swift_bridgeObjectRelease_n();
}

_OWORD *sub_25E651B74(long long *a1, _OWORD *a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(_OWORD *)((char *)a2 + 25) = *(long long *)((char *)a1 + 25);
  *a2 = v2;
  a2[1] = v3;
  return a2;
}

uint64_t sub_25E651B8C(uint64_t a1)
{
  return a1;
}

uint64_t sub_25E651BD0(uint64_t a1)
{
  return a1;
}

unint64_t sub_25E651C18()
{
  unint64_t result = qword_26A6FE458;
  if (!qword_26A6FE458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6FE458);
  }
  return result;
}

unint64_t sub_25E651C70()
{
  unint64_t result = qword_26B38DC50;
  if (!qword_26B38DC50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B38DC50);
  }
  return result;
}

unint64_t sub_25E651CC8()
{
  unint64_t result = qword_26A6FE460;
  if (!qword_26A6FE460)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6FE460);
  }
  return result;
}

unint64_t sub_25E651D20()
{
  unint64_t result = qword_26A6FE468;
  if (!qword_26A6FE468)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6FE468);
  }
  return result;
}

ValueMetadata *type metadata accessor for DER()
{
  return &type metadata for DER;
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

ValueMetadata *type metadata accessor for ASN1NodeCollection()
{
  return &type metadata for ASN1NodeCollection;
}

uint64_t initializeBufferWithCopyOfBuffer for ASN1NodeCollection.Iterator(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for ASN1NodeCollection.Iterator()
{
  return swift_unknownObjectRelease();
}

uint64_t initializeWithCopy for ASN1BitString(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_unknownObjectRetain();
  return a1;
}

void *assignWithCopy for ASN1BitString(void *a1, void *a2)
{
  *a1 = *a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  return a1;
}

uint64_t assignWithTake for ASN1BitString(uint64_t a1, uint64_t a2)
{
  swift_unknownObjectRelease();
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for ASN1BitString(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ASN1BitString(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ASN1NodeCollection.Iterator()
{
  return &type metadata for ASN1NodeCollection.Iterator;
}

uint64_t destroy for ASN1Node(uint64_t a1)
{
  j__swift_unknownObjectRelease(*(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));

  return swift_unknownObjectRelease();
}

uint64_t initializeWithCopy for ASN1Node(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 24);
  uint64_t v6 = *(void *)(a2 + 32);
  uint64_t v7 = *(void *)(a2 + 40);
  uint64_t v8 = *(void *)(a2 + 48);
  uint64_t v9 = *(unsigned __int8 *)(a2 + 56);
  j__swift_unknownObjectRetain(v4, v5, v6, v7, v8, v9);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v6;
  *(void *)(a1 + 40) = v7;
  *(void *)(a1 + 48) = v8;
  *(unsigned char *)(a1 + 56) = v9;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_unknownObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ASN1Node(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 24);
  uint64_t v6 = *(void *)(a2 + 32);
  uint64_t v7 = *(void *)(a2 + 40);
  uint64_t v8 = *(void *)(a2 + 48);
  uint64_t v9 = *(unsigned __int8 *)(a2 + 56);
  j__swift_unknownObjectRetain(v4, v5, v6, v7, v8, v9);
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = *(void *)(a1 + 24);
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 48);
  uint64_t v15 = *(unsigned __int8 *)(a1 + 56);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v6;
  *(void *)(a1 + 40) = v7;
  *(void *)(a1 + 48) = v8;
  *(unsigned char *)(a1 + 56) = v9;
  j__swift_unknownObjectRelease(v10, v11, v12, v13, v14, v15);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  return a1;
}

__n128 __swift_memcpy96_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v4;
  return result;
}

uint64_t assignWithTake for ASN1Node(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 48);
  char v5 = *(unsigned char *)(a2 + 56);
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = *(unsigned __int8 *)(a1 + 56);
  long long v12 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v12;
  *(void *)(a1 + 48) = v4;
  *(unsigned char *)(a1 + 56) = v5;
  j__swift_unknownObjectRelease(v6, v7, v8, v9, v10, v11);
  swift_unknownObjectRelease();
  long long v13 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v13;
  return a1;
}

uint64_t getEnumTagSinglePayload for ASN1Node(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 96)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 64);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ASN1Node(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 96) = 1;
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
      *(void *)(result + 64) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 96) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ASN1Node()
{
  return &type metadata for ASN1Node;
}

uint64_t destroy for ASN1Node.Content(uint64_t a1)
{
  return j__swift_unknownObjectRelease(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t initializeWithCopy for ASN1Node.Content(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  uint64_t v5 = a2[2];
  uint64_t v6 = a2[3];
  uint64_t v7 = a2[4];
  uint64_t v8 = *((unsigned __int8 *)a2 + 40);
  j__swift_unknownObjectRetain(*a2, v4, v5, v6, v7, v8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(unsigned char *)(a1 + 40) = v8;
  return a1;
}

uint64_t *assignWithCopy for ASN1Node.Content(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  uint64_t v5 = a2[2];
  uint64_t v6 = a2[3];
  uint64_t v7 = a2[4];
  uint64_t v8 = *((unsigned __int8 *)a2 + 40);
  j__swift_unknownObjectRetain(*a2, v4, v5, v6, v7, v8);
  uint64_t v9 = *a1;
  uint64_t v10 = a1[1];
  uint64_t v11 = a1[2];
  uint64_t v12 = a1[3];
  uint64_t v13 = a1[4];
  uint64_t v14 = *((unsigned __int8 *)a1 + 40);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  *((unsigned char *)a1 + 40) = v8;
  j__swift_unknownObjectRelease(v9, v10, v11, v12, v13, v14);
  return a1;
}

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t *assignWithTake for ASN1Node.Content(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 32);
  char v4 = *(unsigned char *)(a2 + 40);
  uint64_t v5 = *a1;
  uint64_t v7 = a1[1];
  uint64_t v6 = a1[2];
  uint64_t v8 = a1[3];
  uint64_t v9 = a1[4];
  uint64_t v10 = *((unsigned __int8 *)a1 + 40);
  long long v11 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v11;
  a1[4] = v3;
  *((unsigned char *)a1 + 40) = v4;
  j__swift_unknownObjectRelease(v5, v7, v6, v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for ASN1Node.Content(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 41)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ASN1Node.Content(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 41) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 41) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 40) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_25E65249C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 40);
}

uint64_t sub_25E6524A4(uint64_t result, char a2)
{
  *(unsigned char *)(result + 40) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ASN1Node.Content()
{
  return &type metadata for ASN1Node.Content;
}

ValueMetadata *type metadata accessor for DER.Serializer()
{
  return &type metadata for DER.Serializer;
}

uint64_t dispatch thunk of DERParseable.init(derEncoded:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of DERSerializable.serialize(into:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of static DERImplicitlyTaggable.defaultIdentifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of DERImplicitlyTaggable.init(derEncoded:withIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of DERImplicitlyTaggable.serialize(into:withIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t destroy for DER.ParserNode()
{
  swift_unknownObjectRelease();

  return swift_unknownObjectRelease();
}

uint64_t initializeWithCopy for DER.ParserNode(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  uint64_t v3 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v3;
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DER.ParserNode(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  return a1;
}

uint64_t assignWithTake for DER.ParserNode(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  swift_unknownObjectRelease();
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  swift_unknownObjectRelease();
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  return a1;
}

uint64_t getEnumTagSinglePayload for DER.ParserNode(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 96)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DER.ParserNode(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 96) = 1;
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
      *(void *)(result + 32) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 96) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DER.ParserNode()
{
  return &type metadata for DER.ParserNode;
}

unint64_t sub_25E652804()
{
  unint64_t result = qword_26A6FE470;
  if (!qword_26A6FE470)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6FE470);
  }
  return result;
}

unint64_t sub_25E65285C()
{
  unint64_t result = qword_26A6FE478;
  if (!qword_26A6FE478)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6FE478);
  }
  return result;
}

uint64_t sub_25E6528B0(char **a1)
{
  return sub_25E668734(a1, *(uint64_t **)(v1 + 16));
}

uint64_t sub_25E6528CC(uint64_t a1)
{
  return sub_25E66761C(a1, *(void *)(v1 + 16));
}

uint64_t sub_25E6528E8(char **a1)
{
  return sub_25E65A1B8(a1, *(void *)(v1 + 16));
}

uint64_t sub_25E652904(uint64_t a1)
{
  return sub_25E664794(a1, *(_OWORD **)(v1 + 16));
}

uint64_t sub_25E652920(uint64_t a1)
{
  return sub_25E6635A8(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_25E652940(uint64_t *a1)
{
  return sub_25E660C6C(a1, *(unsigned char *)(v1 + 16));
}

uint64_t sub_25E65295C(uint64_t a1)
{
  return sub_25E65EFD8(a1, *(void **)(v1 + 16));
}

uint64_t sub_25E652978(char **a1)
{
  return sub_25E6554B0(**(void **)(v1 + 16), a1);
}

uint64_t sub_25E6529A0(uint64_t *a1)
{
  return sub_25E65545C(**(void **)(v1 + 16), a1);
}

uint64_t sub_25E6529C4(char **a1)
{
  return sub_25E655D9C(**(unsigned int **)(v1 + 16), a1);
}

uint64_t sub_25E6529E8(uint64_t *a1)
{
  return sub_25E6558B0(**(unsigned int **)(v1 + 16), a1);
}

uint64_t sub_25E652A0C(char **a1)
{
  return sub_25E655C08(**(unsigned __int16 **)(v1 + 16), a1);
}

uint64_t sub_25E652A30(uint64_t *a1)
{
  return sub_25E6557D8(**(unsigned __int16 **)(v1 + 16), a1);
}

uint64_t sub_25E652A54(char **a1)
{
  return sub_25E655A68(**(unsigned __int8 **)(v1 + 16), a1);
}

uint64_t sub_25E652A78(uint64_t *a1)
{
  return sub_25E6556D8(**(unsigned __int8 **)(v1 + 16), a1);
}

uint64_t sub_25E652A9C(uint64_t a1)
{
  return a1;
}

unint64_t sub_25E652AC8()
{
  unint64_t result = qword_26A6FE488;
  if (!qword_26A6FE488)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6FE488);
  }
  return result;
}

unint64_t sub_25E652B1C()
{
  unint64_t result = qword_26A6FE490;
  if (!qword_26A6FE490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6FE490);
  }
  return result;
}

uint64_t *sub_25E652B70(uint64_t *a1)
{
  uint64_t v2 = a1[13];
  uint64_t v7 = a1[12];
  uint64_t v3 = a1[14];
  uint64_t v4 = a1[15];
  uint64_t v5 = a1[16];
  sub_25E652C34(*a1, a1[1], a1[2], a1[3], a1[4]);
  sub_25E652C34(v7, v2, v3, v4, v5);
  return a1;
}

uint64_t sub_25E652C34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a5)
  {
    swift_unknownObjectRelease();
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_25E652C78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a5)
  {
    swift_unknownObjectRetain();
    return swift_unknownObjectRetain();
  }
  return result;
}

uint64_t sub_25E652CBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9)
{
  if (a9)
  {
    j__swift_unknownObjectRetain(a3, a4, a5, a6, a7, a8 & 1);
    return swift_unknownObjectRetain();
  }
  return result;
}

uint64_t initializeWithCopy for DER.ParseResult(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_unknownObjectRetain();
  return a1;
}

void *assignWithCopy for DER.ParseResult(void *a1, void *a2)
{
  *a1 = *a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

_OWORD *assignWithTake for DER.ParseResult(_OWORD *a1, _OWORD *a2)
{
  swift_unknownObjectRelease();
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  return a1;
}

uint64_t getEnumTagSinglePayload for DER.ParseResult(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DER.ParseResult(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DER.ParseResult()
{
  return &type metadata for DER.ParseResult;
}

uint64_t sub_25E652EA0(uint64_t *a1, void *a2)
{
  return sub_25E64F4A8(a1, a2);
}

uint64_t sub_25E652EB8(uint64_t a1)
{
  return sub_25E652920(a1);
}

uint64_t sub_25E652ED0(uint64_t *a1)
{
  return sub_25E64F4CC(a1);
}

void sub_25E652EEC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  int64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (v5 > 8)
    {
      sub_25E64EBC8();
      swift_allocError();
      static ASN1Error.invalidASN1Object(reason:file:line:)(0xD00000000000001ALL, 0x800000025E66BD60, (uint64_t)"SwiftASN1/ASN1.swift", 20, 2, 1191, v6);
      swift_willThrow();
      swift_unknownObjectRelease();
      return;
    }
    if ((unint64_t)(v5 - 0x1000000000000000) >> 61 != 7) {
      goto LABEL_24;
    }
    uint64_t v9 = sub_25E653890(0, 8 * v5, 8);
    uint64_t v10 = *(void *)(v9 + 16);
    if (!v10)
    {
LABEL_21:
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      return;
    }
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    if (a3 <= v4) {
      uint64_t v13 = v4;
    }
    else {
      uint64_t v13 = a3;
    }
    unint64_t v14 = v13 - a3;
    while (v14 > v10 - 1)
    {
      unint64_t v16 = *(void *)(v9 + 8 * v11 + 32);
      if (v16 - 65 < 0xFFFFFFFFFFFFFF7FLL)
      {
        unint64_t v15 = 0;
      }
      else
      {
        unint64_t v17 = *(unsigned __int8 *)(a2 + a3 + v11);
        if ((v16 & 0x8000000000000000) != 0)
        {
          unint64_t v19 = v17 >> -(char)v16;
          if (v16 <= 0xFFFFFFFFFFFFFFC0) {
            unint64_t v15 = 0;
          }
          else {
            unint64_t v15 = v19;
          }
        }
        else
        {
          uint64_t v18 = v17 << v16;
          if (v16 >= 0x40) {
            unint64_t v15 = 0;
          }
          else {
            unint64_t v15 = v18;
          }
        }
      }
      ++v11;
      v12 |= v15;
      if (v10 == v11) {
        goto LABEL_21;
      }
    }
    __break(1u);
  }
  __break(1u);
LABEL_24:
  __break(1u);
}

void sub_25E653084(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  int64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (v5 > 1)
    {
      sub_25E64EBC8();
      swift_allocError();
      static ASN1Error.invalidASN1Object(reason:file:line:)(0xD00000000000001ALL, 0x800000025E66BD60, (uint64_t)"SwiftASN1/ASN1.swift", 20, 2, 1191, v6);
      swift_willThrow();
      swift_unknownObjectRelease();
      return;
    }
    if ((unint64_t)(v5 - 0x1000000000000000) >> 61 != 7) {
      goto LABEL_26;
    }
    uint64_t v9 = sub_25E653890(0, 8 * v5, 8);
    uint64_t v10 = *(void *)(v9 + 16);
    if (!v10)
    {
LABEL_23:
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      return;
    }
    uint64_t v11 = 0;
    int v12 = 0;
    if (a3 <= v4) {
      uint64_t v13 = v4;
    }
    else {
      uint64_t v13 = a3;
    }
    unint64_t v14 = v13 - a3;
    while (v14 > v10 - 1)
    {
      uint64_t v16 = *(void *)(v9 + 8 * v11 + 32);
      int v17 = *(unsigned __int8 *)(a2 + a3 + v11);
      if (v16 <= -9)
      {
        int v15 = (char)v17 >> 7;
      }
      else if (v16 < 9)
      {
        if (v16 < 0)
        {
          int v19 = (char)v17 >> -(char)v16;
          int v20 = (char)v17 >> 7;
          if ((unint64_t)v16 <= 0xFFFFFFFFFFFFFFF8) {
            int v15 = v20;
          }
          else {
            int v15 = v19;
          }
        }
        else
        {
          BOOL v18 = (unint64_t)v16 >= 8;
          int v15 = v17 << v16;
          if (v18) {
            int v15 = 0;
          }
        }
      }
      else
      {
        int v15 = 0;
      }
      ++v11;
      v12 |= v15;
      if (v10 == v11) {
        goto LABEL_23;
      }
    }
    __break(1u);
  }
  __break(1u);
LABEL_26:
  __break(1u);
}

void sub_25E653230(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  int64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (v5 > 2)
    {
      sub_25E64EBC8();
      swift_allocError();
      static ASN1Error.invalidASN1Object(reason:file:line:)(0xD00000000000001ALL, 0x800000025E66BD60, (uint64_t)"SwiftASN1/ASN1.swift", 20, 2, 1191, v6);
      swift_willThrow();
      swift_unknownObjectRelease();
      return;
    }
    if ((unint64_t)(v5 - 0x1000000000000000) >> 61 != 7) {
      goto LABEL_24;
    }
    uint64_t v9 = sub_25E653890(0, 8 * v5, 8);
    uint64_t v10 = *(void *)(v9 + 16);
    if (!v10)
    {
LABEL_21:
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      return;
    }
    uint64_t v11 = 0;
    int v12 = 0;
    if (a3 <= v4) {
      uint64_t v13 = v4;
    }
    else {
      uint64_t v13 = a3;
    }
    unint64_t v14 = v13 - a3;
    while (v14 > v10 - 1)
    {
      unint64_t v16 = *(void *)(v9 + 8 * v11 + 32);
      if (v16 - 17 <= 0xFFFFFFFFFFFFFFDELL)
      {
        int v15 = 0;
      }
      else
      {
        unsigned int v17 = *(unsigned __int8 *)(a2 + a3 + v11);
        if ((v16 & 0x8000000000000000) != 0)
        {
          unsigned int v19 = v17 >> -(char)v16;
          if (v16 <= 0xFFFFFFFFFFFFFFF0) {
            int v15 = 0;
          }
          else {
            int v15 = v19;
          }
        }
        else
        {
          BOOL v18 = v16 >= 0x10;
          int v15 = v17 << v16;
          if (v18) {
            int v15 = 0;
          }
        }
      }
      ++v11;
      v12 |= v15;
      if (v10 == v11) {
        goto LABEL_21;
      }
    }
    __break(1u);
  }
  __break(1u);
LABEL_24:
  __break(1u);
}

void sub_25E6533C8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  int64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (v5 > 4)
    {
      sub_25E64EBC8();
      swift_allocError();
      static ASN1Error.invalidASN1Object(reason:file:line:)(0xD00000000000001ALL, 0x800000025E66BD60, (uint64_t)"SwiftASN1/ASN1.swift", 20, 2, 1191, v6);
      swift_willThrow();
      swift_unknownObjectRelease();
      return;
    }
    if ((unint64_t)(v5 - 0x1000000000000000) >> 61 != 7) {
      goto LABEL_24;
    }
    uint64_t v9 = sub_25E653890(0, 8 * v5, 8);
    uint64_t v10 = *(void *)(v9 + 16);
    if (!v10)
    {
LABEL_21:
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      return;
    }
    uint64_t v11 = 0;
    int v12 = 0;
    if (a3 <= v4) {
      uint64_t v13 = v4;
    }
    else {
      uint64_t v13 = a3;
    }
    unint64_t v14 = v13 - a3;
    while (v14 > v10 - 1)
    {
      unint64_t v16 = *(void *)(v9 + 8 * v11 + 32);
      if (v16 - 33 <= 0xFFFFFFFFFFFFFFBELL)
      {
        int v15 = 0;
      }
      else
      {
        unsigned int v17 = *(unsigned __int8 *)(a2 + a3 + v11);
        if ((v16 & 0x8000000000000000) != 0)
        {
          unsigned int v19 = v17 >> -(char)v16;
          if (v16 <= 0xFFFFFFFFFFFFFFE0) {
            int v15 = 0;
          }
          else {
            int v15 = v19;
          }
        }
        else
        {
          BOOL v18 = v16 >= 0x20;
          int v15 = v17 << v16;
          if (v18) {
            int v15 = 0;
          }
        }
      }
      ++v11;
      v12 |= v15;
      if (v10 == v11) {
        goto LABEL_21;
      }
    }
    __break(1u);
  }
  __break(1u);
LABEL_24:
  __break(1u);
}

void sub_25E653560(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  int64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (v5 > 8)
    {
      sub_25E64EBC8();
      swift_allocError();
      static ASN1Error.invalidASN1Object(reason:file:line:)(0xD00000000000001ALL, 0x800000025E66BD60, (uint64_t)"SwiftASN1/ASN1.swift", 20, 2, 1191, v6);
      swift_willThrow();
      swift_unknownObjectRelease();
      return;
    }
    if ((unint64_t)(v5 - 0x1000000000000000) >> 61 != 7) {
      goto LABEL_24;
    }
    uint64_t v9 = sub_25E653890(0, 8 * v5, 8);
    uint64_t v10 = *(void *)(v9 + 16);
    if (!v10)
    {
LABEL_21:
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      return;
    }
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    if (a3 <= v4) {
      uint64_t v13 = v4;
    }
    else {
      uint64_t v13 = a3;
    }
    unint64_t v14 = v13 - a3;
    while (v14 > v10 - 1)
    {
      unint64_t v16 = *(void *)(v9 + 8 * v11 + 32);
      if (v16 - 65 <= 0xFFFFFFFFFFFFFF7ELL)
      {
        unint64_t v15 = 0;
      }
      else
      {
        unint64_t v17 = *(unsigned __int8 *)(a2 + a3 + v11);
        if ((v16 & 0x8000000000000000) != 0)
        {
          unint64_t v19 = v17 >> -(char)v16;
          if (v16 <= 0xFFFFFFFFFFFFFFC0) {
            unint64_t v15 = 0;
          }
          else {
            unint64_t v15 = v19;
          }
        }
        else
        {
          uint64_t v18 = v17 << v16;
          if (v16 >= 0x40) {
            unint64_t v15 = 0;
          }
          else {
            unint64_t v15 = v18;
          }
        }
      }
      ++v11;
      v12 |= v15;
      if (v10 == v11) {
        goto LABEL_21;
      }
    }
    __break(1u);
  }
  __break(1u);
LABEL_24:
  __break(1u);
}

void sub_25E6536F8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  int64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (v5 > 1)
    {
      sub_25E64EBC8();
      swift_allocError();
      static ASN1Error.invalidASN1Object(reason:file:line:)(0xD00000000000001ALL, 0x800000025E66BD60, (uint64_t)"SwiftASN1/ASN1.swift", 20, 2, 1191, v6);
      swift_willThrow();
      swift_unknownObjectRelease();
      return;
    }
    if ((unint64_t)(v5 - 0x1000000000000000) >> 61 != 7) {
      goto LABEL_24;
    }
    uint64_t v9 = sub_25E653890(0, 8 * v5, 8);
    uint64_t v10 = *(void *)(v9 + 16);
    if (!v10)
    {
LABEL_21:
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      return;
    }
    uint64_t v11 = 0;
    int v12 = 0;
    if (a3 <= v4) {
      uint64_t v13 = v4;
    }
    else {
      uint64_t v13 = a3;
    }
    unint64_t v14 = v13 - a3;
    while (v14 > v10 - 1)
    {
      unint64_t v16 = *(void *)(v9 + 8 * v11 + 32);
      if (v16 - 9 <= 0xFFFFFFFFFFFFFFEELL)
      {
        int v15 = 0;
      }
      else
      {
        unsigned int v17 = *(unsigned __int8 *)(a2 + a3 + v11);
        if ((v16 & 0x8000000000000000) != 0)
        {
          unsigned int v19 = v17 >> -(char)v16;
          if (v16 <= 0xFFFFFFFFFFFFFFF8) {
            int v15 = 0;
          }
          else {
            int v15 = v19;
          }
        }
        else
        {
          BOOL v18 = v16 >= 8;
          int v15 = v17 << v16;
          if (v18) {
            int v15 = 0;
          }
        }
      }
      ++v11;
      v12 |= v15;
      if (v10 == v11) {
        goto LABEL_21;
      }
    }
    __break(1u);
  }
  __break(1u);
LABEL_24:
  __break(1u);
}

uint64_t sub_25E653890(uint64_t a1, int64_t a2, uint64_t a3)
{
  uint64_t result = sub_25E659EA0(a1, a2, a3);
  uint64_t v4 = result;
  unint64_t v5 = *(void *)(result + 16);
  if (v5 < 2) {
    return v4;
  }
  unint64_t v6 = 0;
  unint64_t v7 = v5 >> 1;
  for (unint64_t i = v5 + 3; ; --i)
  {
    if (v6 == i - 4) {
      goto LABEL_5;
    }
    unint64_t v9 = *(void *)(v4 + 16);
    if (v6 >= v9) {
      break;
    }
    if (i - 4 >= v9) {
      goto LABEL_12;
    }
    uint64_t v10 = *(void *)(v4 + 8 * v6 + 32);
    uint64_t v11 = *(void *)(v4 + 8 * i);
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_25E65A124(v4);
      uint64_t v4 = result;
    }
    *(void *)(v4 + 8 * v6 + 32) = v11;
    *(void *)(v4 + 8 * i) = v10;
LABEL_5:
    if (v7 == ++v6) {
      return v4;
    }
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

void static ASN1IntegerRepresentable.defaultIdentifier.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 2;
  *(unsigned char *)(a1 + 8) = 0;
}

uint64_t sub_25E653960(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  return sub_25E654350(a1, a2, a3);
}

uint64_t sub_25E653978(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  return sub_25E654DD0(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, unint64_t, unint64_t))sub_25E652EEC);
}

uint64_t sub_25E6539A4(uint64_t result, uint64_t a2, unsigned __int8 a3)
{
  uint64_t v4 = result;
  if (*(void *)result != a2 || *(unsigned __int8 *)(result + 8) != a3)
  {
    sub_25E64EBC8();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1Integer.swift", 27, 2, 46, v11);
    sub_25E651BD0(v4);
    swift_willThrow();
    return v3;
  }
  if (*(unsigned char *)(result + 56) == 1)
  {
    uint64_t v3 = *(void *)(result + 16);
    uint64_t v5 = *(void *)(result + 24);
    uint64_t v7 = *(void *)(result + 32);
    unint64_t v6 = *(void *)(result + 40);
    uint64_t v8 = *(void *)(result + 48);
    swift_unknownObjectRetain();
    uint64_t result = sub_25E651BD0(v4);
    int64_t v9 = v6 >> 1;
    if (__OFSUB__(v6 >> 1, v7))
    {
      __break(1u);
      goto LABEL_25;
    }
    if ((uint64_t)((v6 >> 1) - v7) < 1)
    {
      sub_25E64EBC8();
      swift_allocError();
      uint64_t v13 = v12;
      uint64_t v14 = 0xD00000000000001FLL;
      uint64_t v15 = 0x800000025E66BF20;
      uint64_t v16 = 55;
LABEL_13:
      static ASN1Error.invalidASN1IntegerEncoding(reason:file:line:)(v14, v15, (uint64_t)"SwiftASN1/ASN1Integer.swift", 27, 2, v16, v13);
      swift_willThrow();
      j__swift_unknownObjectRelease(v3, v5, v7, v6, v8, 1);
      return v3;
    }
    if (v7 != v9)
    {
      if (v7 < v9)
      {
        int v10 = *(unsigned __int8 *)(v5 + v7);
        if (v7 + 1 == v9)
        {
          if (!*(unsigned char *)(v5 + v7)) {
            return v3;
          }
LABEL_19:
          if ((v10 & 0x80) == 0) {
            return v3;
          }
          goto LABEL_21;
        }
        if (v7 + 1 < v9)
        {
          int v17 = *(char *)(v5 + v7 + 1);
          if (*(unsigned char *)(v5 + v7))
          {
            if (v10 != 255) {
              goto LABEL_19;
            }
            if ((v17 & 0x80000000) == 0)
            {
LABEL_21:
              sub_25E64EBC8();
              swift_allocError();
              uint64_t v14 = 0xD000000000000021;
              uint64_t v13 = v18;
              uint64_t v15 = 0x800000025E66BF40;
              uint64_t v16 = 77;
              goto LABEL_13;
            }
          }
          else if (v17 < 0)
          {
            return v3;
          }
          sub_25E64EBC8();
          swift_allocError();
          uint64_t v14 = 0xD00000000000002ELL;
          uint64_t v13 = v19;
          uint64_t v15 = 0x800000025E66BF70;
          uint64_t v16 = 67;
          goto LABEL_13;
        }
        goto LABEL_26;
      }
LABEL_25:
      __break(1u);
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
    return v3;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_25E653C3C(uint64_t result, uint64_t a2, unsigned __int8 a3)
{
  uint64_t v3 = result;
  if (*(void *)result != a2 || *(unsigned __int8 *)(result + 8) != a3)
  {
    sub_25E64EBC8();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1Integer.swift", 27, 2, 46, v12);
    sub_25E651BD0(v3);
    swift_willThrow();
    return v3;
  }
  if (*(unsigned char *)(result + 56) == 1)
  {
    uint64_t v5 = *(void *)(result + 16);
    uint64_t v4 = *(void *)(result + 24);
    uint64_t v7 = *(void *)(result + 32);
    unint64_t v6 = *(void *)(result + 40);
    uint64_t v8 = *(void *)(result + 48);
    swift_unknownObjectRetain();
    uint64_t result = sub_25E651BD0(v3);
    int64_t v9 = v6 >> 1;
    if (__OFSUB__(v6 >> 1, v7))
    {
      __break(1u);
    }
    else
    {
      if ((uint64_t)((v6 >> 1) - v7) < 1)
      {
        sub_25E64EBC8();
        swift_allocError();
        uint64_t v14 = v13;
        uint64_t v15 = 0xD00000000000001FLL;
        uint64_t v16 = 0x800000025E66BF20;
        uint64_t v17 = 55;
LABEL_16:
        static ASN1Error.invalidASN1IntegerEncoding(reason:file:line:)(v15, v16, (uint64_t)"SwiftASN1/ASN1Integer.swift", 27, 2, v17, v14);
        swift_willThrow();
        j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, 1);
        return v3;
      }
      if (v7 == v9) {
        goto LABEL_13;
      }
      if (v7 < v9)
      {
        if (v7 + 1 == v9) {
          goto LABEL_13;
        }
        if (v7 + 1 < v9)
        {
          int v10 = *(char *)(v4 + v7 + 1);
          if (*(unsigned char *)(v4 + v7))
          {
            if (*(unsigned __int8 *)(v4 + v7) != 255 || (v10 & 0x80000000) == 0) {
              goto LABEL_13;
            }
            goto LABEL_19;
          }
          if ((v10 & 0x80000000) == 0)
          {
LABEL_19:
            sub_25E64EBC8();
            swift_allocError();
            uint64_t v15 = 0xD00000000000002ELL;
            uint64_t v14 = v18;
            uint64_t v16 = 0x800000025E66BF70;
            uint64_t v17 = 67;
            goto LABEL_16;
          }
LABEL_13:
          sub_25E65A450(v5, v4, v7, v6);
          uint64_t v3 = v11;
          j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, 1);
          return v3;
        }
        goto LABEL_22;
      }
    }
    __break(1u);
LABEL_22:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_25E653E98(uint64_t result, uint64_t a2, unsigned __int8 a3)
{
  uint64_t v3 = result;
  if (*(void *)result != a2 || *(unsigned __int8 *)(result + 8) != a3)
  {
    sub_25E64EBC8();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1Integer.swift", 27, 2, 46, v12);
    sub_25E651BD0(v3);
    swift_willThrow();
    return v3;
  }
  if (*(unsigned char *)(result + 56) == 1)
  {
    uint64_t v5 = *(void *)(result + 16);
    uint64_t v4 = *(void *)(result + 24);
    uint64_t v7 = *(void *)(result + 32);
    unint64_t v6 = *(void *)(result + 40);
    uint64_t v8 = *(void *)(result + 48);
    swift_unknownObjectRetain();
    uint64_t result = sub_25E651BD0(v3);
    int64_t v9 = v6 >> 1;
    if (__OFSUB__(v6 >> 1, v7))
    {
      __break(1u);
    }
    else
    {
      if ((uint64_t)((v6 >> 1) - v7) < 1)
      {
        sub_25E64EBC8();
        swift_allocError();
        uint64_t v14 = v13;
        uint64_t v15 = 0xD00000000000001FLL;
        uint64_t v16 = 0x800000025E66BF20;
        uint64_t v17 = 55;
LABEL_16:
        static ASN1Error.invalidASN1IntegerEncoding(reason:file:line:)(v15, v16, (uint64_t)"SwiftASN1/ASN1Integer.swift", 27, 2, v17, v14);
        swift_willThrow();
        j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, 1);
        return v3;
      }
      if (v7 == v9) {
        goto LABEL_13;
      }
      if (v7 < v9)
      {
        if (v7 + 1 == v9) {
          goto LABEL_13;
        }
        if (v7 + 1 < v9)
        {
          int v10 = *(char *)(v4 + v7 + 1);
          if (*(unsigned char *)(v4 + v7))
          {
            if (*(unsigned __int8 *)(v4 + v7) != 255 || (v10 & 0x80000000) == 0) {
              goto LABEL_13;
            }
            goto LABEL_19;
          }
          if ((v10 & 0x80000000) == 0)
          {
LABEL_19:
            sub_25E64EBC8();
            swift_allocError();
            uint64_t v15 = 0xD00000000000002ELL;
            uint64_t v14 = v18;
            uint64_t v16 = 0x800000025E66BF70;
            uint64_t v17 = 67;
            goto LABEL_16;
          }
LABEL_13:
          sub_25E65A4A8(v5, v4, v7, v6);
          uint64_t v3 = v11;
          j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, 1);
          return v3;
        }
        goto LABEL_22;
      }
    }
    __break(1u);
LABEL_22:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_25E6540F4(uint64_t result, uint64_t a2, unsigned __int8 a3)
{
  uint64_t v3 = result;
  if (*(void *)result != a2 || *(unsigned __int8 *)(result + 8) != a3)
  {
    sub_25E64EBC8();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1Integer.swift", 27, 2, 46, v12);
    sub_25E651BD0(v3);
    swift_willThrow();
    return v3;
  }
  if (*(unsigned char *)(result + 56) == 1)
  {
    uint64_t v5 = *(void *)(result + 16);
    uint64_t v4 = *(void *)(result + 24);
    uint64_t v7 = *(void *)(result + 32);
    unint64_t v6 = *(void *)(result + 40);
    uint64_t v8 = *(void *)(result + 48);
    swift_unknownObjectRetain();
    uint64_t result = sub_25E651BD0(v3);
    int64_t v9 = v6 >> 1;
    if (__OFSUB__(v6 >> 1, v7))
    {
      __break(1u);
    }
    else
    {
      if ((uint64_t)((v6 >> 1) - v7) < 1)
      {
        sub_25E64EBC8();
        swift_allocError();
        uint64_t v14 = v13;
        uint64_t v15 = 0xD00000000000001FLL;
        uint64_t v16 = 0x800000025E66BF20;
        uint64_t v17 = 55;
LABEL_16:
        static ASN1Error.invalidASN1IntegerEncoding(reason:file:line:)(v15, v16, (uint64_t)"SwiftASN1/ASN1Integer.swift", 27, 2, v17, v14);
        swift_willThrow();
        j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, 1);
        return v3;
      }
      if (v7 == v9) {
        goto LABEL_13;
      }
      if (v7 < v9)
      {
        if (v7 + 1 == v9) {
          goto LABEL_13;
        }
        if (v7 + 1 < v9)
        {
          int v10 = *(char *)(v4 + v7 + 1);
          if (*(unsigned char *)(v4 + v7))
          {
            if (*(unsigned __int8 *)(v4 + v7) != 255 || (v10 & 0x80000000) == 0) {
              goto LABEL_13;
            }
            goto LABEL_19;
          }
          if ((v10 & 0x80000000) == 0)
          {
LABEL_19:
            sub_25E64EBC8();
            swift_allocError();
            uint64_t v15 = 0xD00000000000002ELL;
            uint64_t v14 = v18;
            uint64_t v16 = 0x800000025E66BF70;
            uint64_t v17 = 67;
            goto LABEL_16;
          }
LABEL_13:
          sub_25E65A5D4(v5, v4, v7, v6);
          uint64_t v3 = v11;
          j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, 1);
          return v3;
        }
        goto LABEL_22;
      }
    }
    __break(1u);
LABEL_22:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_25E654350(uint64_t result, uint64_t a2, unsigned __int8 a3)
{
  uint64_t v3 = result;
  if (*(void *)result != a2 || *(unsigned __int8 *)(result + 8) != a3)
  {
    sub_25E64EBC8();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1Integer.swift", 27, 2, 46, v12);
    sub_25E651BD0(v3);
    swift_willThrow();
    return v3;
  }
  if (*(unsigned char *)(result + 56) == 1)
  {
    uint64_t v5 = *(void *)(result + 16);
    uint64_t v4 = *(void *)(result + 24);
    uint64_t v7 = *(void *)(result + 32);
    unint64_t v6 = *(void *)(result + 40);
    uint64_t v8 = *(void *)(result + 48);
    swift_unknownObjectRetain();
    uint64_t result = sub_25E651BD0(v3);
    int64_t v9 = v6 >> 1;
    if (__OFSUB__(v6 >> 1, v7))
    {
      __break(1u);
    }
    else
    {
      if ((uint64_t)((v6 >> 1) - v7) < 1)
      {
        sub_25E64EBC8();
        swift_allocError();
        uint64_t v14 = v13;
        uint64_t v15 = 0xD00000000000001FLL;
        uint64_t v16 = 0x800000025E66BF20;
        uint64_t v17 = 55;
LABEL_16:
        static ASN1Error.invalidASN1IntegerEncoding(reason:file:line:)(v15, v16, (uint64_t)"SwiftASN1/ASN1Integer.swift", 27, 2, v17, v14);
        swift_willThrow();
        j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, 1);
        return v3;
      }
      if (v7 == v9) {
        goto LABEL_13;
      }
      if (v7 < v9)
      {
        if (v7 + 1 == v9) {
          goto LABEL_13;
        }
        if (v7 + 1 < v9)
        {
          int v10 = *(char *)(v4 + v7 + 1);
          if (*(unsigned char *)(v4 + v7))
          {
            if (*(unsigned __int8 *)(v4 + v7) != 255 || (v10 & 0x80000000) == 0) {
              goto LABEL_13;
            }
            goto LABEL_19;
          }
          if ((v10 & 0x80000000) == 0)
          {
LABEL_19:
            sub_25E64EBC8();
            swift_allocError();
            uint64_t v15 = 0xD00000000000002ELL;
            uint64_t v14 = v18;
            uint64_t v16 = 0x800000025E66BF70;
            uint64_t v17 = 67;
            goto LABEL_16;
          }
LABEL_13:
          sub_25E65A708(v5, v4, v7, v6);
          uint64_t v3 = v11;
          j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, 1);
          return v3;
        }
        goto LABEL_22;
      }
    }
    __break(1u);
LABEL_22:
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_25E6545AC(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (*(void *)a1 != a2 || *(unsigned __int8 *)(a1 + 8) != a3)
  {
    sub_25E64EBC8();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1Integer.swift", 27, 2, 46, v12);
    sub_25E651BD0(a1);
    swift_willThrow();
    return;
  }
  if (*(unsigned char *)(a1 + 56) != 1) {
    goto LABEL_28;
  }
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v7 = *(void *)(a1 + 32);
  unint64_t v6 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  swift_unknownObjectRetain();
  sub_25E651BD0(a1);
  int64_t v9 = v6 >> 1;
  if (__OFSUB__(v6 >> 1, v7))
  {
    __break(1u);
  }
  else
  {
    if ((uint64_t)((v6 >> 1) - v7) < 1)
    {
      sub_25E64EBC8();
      swift_allocError();
      uint64_t v14 = v13;
      uint64_t v15 = 0xD00000000000001FLL;
      uint64_t v16 = 0x800000025E66BF20;
      uint64_t v17 = 55;
LABEL_13:
      static ASN1Error.invalidASN1IntegerEncoding(reason:file:line:)(v15, v16, (uint64_t)"SwiftASN1/ASN1Integer.swift", 27, 2, v17, v14);
      swift_willThrow();
      j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, 1);
      return;
    }
    if (v7 == v9)
    {
LABEL_20:
      uint64_t v11 = v7;
      goto LABEL_21;
    }
    if (v7 < v9)
    {
      int v10 = *(unsigned __int8 *)(v4 + v7);
      uint64_t v11 = v7 + 1;
      if (v7 + 1 == v9)
      {
        if (!*(unsigned char *)(v4 + v7))
        {
          uint64_t v11 = v6 >> 1;
LABEL_21:
          sub_25E6536F8(v5, v4, v11, v6);
          return;
        }
LABEL_19:
        if ((v10 & 0x80) == 0) {
          goto LABEL_20;
        }
        goto LABEL_22;
      }
      if (v7 + 1 < v9)
      {
        int v18 = *(char *)(v4 + v11);
        if (*(unsigned char *)(v4 + v7))
        {
          if (v10 != 255) {
            goto LABEL_19;
          }
          if ((v18 & 0x80000000) == 0)
          {
LABEL_22:
            sub_25E64EBC8();
            swift_allocError();
            uint64_t v15 = 0xD000000000000021;
            uint64_t v14 = v19;
            uint64_t v16 = 0x800000025E66BF40;
            uint64_t v17 = 77;
            goto LABEL_13;
          }
        }
        else if (v18 < 0)
        {
          goto LABEL_21;
        }
        sub_25E64EBC8();
        swift_allocError();
        uint64_t v15 = 0xD00000000000002ELL;
        uint64_t v14 = v20;
        uint64_t v16 = 0x800000025E66BF70;
        uint64_t v17 = 67;
        goto LABEL_13;
      }
      goto LABEL_27;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
}

void sub_25E654854(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (*(void *)a1 != a2 || *(unsigned __int8 *)(a1 + 8) != a3)
  {
    sub_25E64EBC8();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1Integer.swift", 27, 2, 46, v12);
    sub_25E651BD0(a1);
    swift_willThrow();
    return;
  }
  if (*(unsigned char *)(a1 + 56) != 1) {
    goto LABEL_28;
  }
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v7 = *(void *)(a1 + 32);
  unint64_t v6 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  swift_unknownObjectRetain();
  sub_25E651BD0(a1);
  int64_t v9 = v6 >> 1;
  if (__OFSUB__(v6 >> 1, v7))
  {
    __break(1u);
  }
  else
  {
    if ((uint64_t)((v6 >> 1) - v7) < 1)
    {
      sub_25E64EBC8();
      swift_allocError();
      uint64_t v14 = v13;
      uint64_t v15 = 0xD00000000000001FLL;
      uint64_t v16 = 0x800000025E66BF20;
      uint64_t v17 = 55;
LABEL_13:
      static ASN1Error.invalidASN1IntegerEncoding(reason:file:line:)(v15, v16, (uint64_t)"SwiftASN1/ASN1Integer.swift", 27, 2, v17, v14);
      swift_willThrow();
      j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, 1);
      return;
    }
    if (v7 == v9)
    {
LABEL_20:
      uint64_t v11 = v7;
      goto LABEL_21;
    }
    if (v7 < v9)
    {
      int v10 = *(unsigned __int8 *)(v4 + v7);
      uint64_t v11 = v7 + 1;
      if (v7 + 1 == v9)
      {
        if (!*(unsigned char *)(v4 + v7))
        {
          uint64_t v11 = v6 >> 1;
LABEL_21:
          sub_25E653230(v5, v4, v11, v6);
          return;
        }
LABEL_19:
        if ((v10 & 0x80) == 0) {
          goto LABEL_20;
        }
        goto LABEL_22;
      }
      if (v7 + 1 < v9)
      {
        int v18 = *(char *)(v4 + v11);
        if (*(unsigned char *)(v4 + v7))
        {
          if (v10 != 255) {
            goto LABEL_19;
          }
          if ((v18 & 0x80000000) == 0)
          {
LABEL_22:
            sub_25E64EBC8();
            swift_allocError();
            uint64_t v15 = 0xD000000000000021;
            uint64_t v14 = v19;
            uint64_t v16 = 0x800000025E66BF40;
            uint64_t v17 = 77;
            goto LABEL_13;
          }
        }
        else if (v18 < 0)
        {
          goto LABEL_21;
        }
        sub_25E64EBC8();
        swift_allocError();
        uint64_t v15 = 0xD00000000000002ELL;
        uint64_t v14 = v20;
        uint64_t v16 = 0x800000025E66BF70;
        uint64_t v17 = 67;
        goto LABEL_13;
      }
      goto LABEL_27;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
}

void sub_25E654AFC(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (*(void *)a1 != a2 || *(unsigned __int8 *)(a1 + 8) != a3)
  {
    sub_25E64EBC8();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1Integer.swift", 27, 2, 46, v12);
    sub_25E651BD0(a1);
    swift_willThrow();
    return;
  }
  if (*(unsigned char *)(a1 + 56) != 1) {
    goto LABEL_28;
  }
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v7 = *(void *)(a1 + 32);
  unint64_t v6 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  swift_unknownObjectRetain();
  sub_25E651BD0(a1);
  int64_t v9 = v6 >> 1;
  if (__OFSUB__(v6 >> 1, v7))
  {
    __break(1u);
  }
  else
  {
    if ((uint64_t)((v6 >> 1) - v7) < 1)
    {
      sub_25E64EBC8();
      swift_allocError();
      uint64_t v14 = v13;
      uint64_t v15 = 0xD00000000000001FLL;
      uint64_t v16 = 0x800000025E66BF20;
      uint64_t v17 = 55;
LABEL_13:
      static ASN1Error.invalidASN1IntegerEncoding(reason:file:line:)(v15, v16, (uint64_t)"SwiftASN1/ASN1Integer.swift", 27, 2, v17, v14);
      swift_willThrow();
      j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, 1);
      return;
    }
    if (v7 == v9)
    {
LABEL_20:
      uint64_t v11 = v7;
      goto LABEL_21;
    }
    if (v7 < v9)
    {
      int v10 = *(unsigned __int8 *)(v4 + v7);
      uint64_t v11 = v7 + 1;
      if (v7 + 1 == v9)
      {
        if (!*(unsigned char *)(v4 + v7))
        {
          uint64_t v11 = v6 >> 1;
LABEL_21:
          sub_25E6533C8(v5, v4, v11, v6);
          return;
        }
LABEL_19:
        if ((v10 & 0x80) == 0) {
          goto LABEL_20;
        }
        goto LABEL_22;
      }
      if (v7 + 1 < v9)
      {
        int v18 = *(char *)(v4 + v11);
        if (*(unsigned char *)(v4 + v7))
        {
          if (v10 != 255) {
            goto LABEL_19;
          }
          if ((v18 & 0x80000000) == 0)
          {
LABEL_22:
            sub_25E64EBC8();
            swift_allocError();
            uint64_t v15 = 0xD000000000000021;
            uint64_t v14 = v19;
            uint64_t v16 = 0x800000025E66BF40;
            uint64_t v17 = 77;
            goto LABEL_13;
          }
        }
        else if (v18 < 0)
        {
          goto LABEL_21;
        }
        sub_25E64EBC8();
        swift_allocError();
        uint64_t v15 = 0xD00000000000002ELL;
        uint64_t v14 = v20;
        uint64_t v16 = 0x800000025E66BF70;
        uint64_t v17 = 67;
        goto LABEL_13;
      }
      goto LABEL_27;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
}

uint64_t sub_25E654DA4(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  return sub_25E654DD0(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, unint64_t, unint64_t))sub_25E653560);
}

uint64_t sub_25E654DD0(uint64_t result, uint64_t a2, unsigned __int8 a3, uint64_t (*a4)(uint64_t, uint64_t, unint64_t, unint64_t))
{
  uint64_t v4 = result;
  if (*(void *)result != a2 || *(unsigned __int8 *)(result + 8) != a3)
  {
    sub_25E64EBC8();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1Integer.swift", 27, 2, 46, v14);
    sub_25E651BD0(v4);
    return swift_willThrow();
  }
  if (*(unsigned char *)(result + 56) != 1) {
    goto LABEL_28;
  }
  uint64_t v7 = *(void *)(result + 16);
  uint64_t v6 = *(void *)(result + 24);
  uint64_t v9 = *(void *)(result + 32);
  unint64_t v8 = *(void *)(result + 40);
  uint64_t v10 = *(void *)(result + 48);
  swift_unknownObjectRetain();
  uint64_t result = sub_25E651BD0(v4);
  int64_t v11 = v8 >> 1;
  if (__OFSUB__(v8 >> 1, v9))
  {
    __break(1u);
  }
  else
  {
    if ((uint64_t)((v8 >> 1) - v9) < 1)
    {
      sub_25E64EBC8();
      swift_allocError();
      uint64_t v16 = v15;
      uint64_t v17 = 0xD00000000000001FLL;
      uint64_t v18 = 0x800000025E66BF20;
      uint64_t v19 = 55;
LABEL_13:
      static ASN1Error.invalidASN1IntegerEncoding(reason:file:line:)(v17, v18, (uint64_t)"SwiftASN1/ASN1Integer.swift", 27, 2, v19, v16);
      swift_willThrow();
      return j__swift_unknownObjectRelease(v7, v6, v9, v8, v10, 1);
    }
    if (v9 == v11)
    {
LABEL_20:
      unint64_t v13 = v9;
      return a4(v7, v6, v13, v8);
    }
    if (v9 < v11)
    {
      int v12 = *(unsigned __int8 *)(v6 + v9);
      unint64_t v13 = v9 + 1;
      if (v9 + 1 == v11)
      {
        if (!*(unsigned char *)(v6 + v9))
        {
          unint64_t v13 = v8 >> 1;
          return a4(v7, v6, v13, v8);
        }
LABEL_19:
        if ((v12 & 0x80) == 0) {
          goto LABEL_20;
        }
        goto LABEL_22;
      }
      if (v9 + 1 < v11)
      {
        int v20 = *(char *)(v6 + v13);
        if (*(unsigned char *)(v6 + v9))
        {
          if (v12 != 255) {
            goto LABEL_19;
          }
          if ((v20 & 0x80000000) == 0)
          {
LABEL_22:
            sub_25E64EBC8();
            swift_allocError();
            uint64_t v17 = 0xD000000000000021;
            uint64_t v16 = v21;
            uint64_t v18 = 0x800000025E66BF40;
            uint64_t v19 = 77;
            goto LABEL_13;
          }
        }
        else if (v20 < 0)
        {
          return a4(v7, v6, v13, v8);
        }
        sub_25E64EBC8();
        swift_allocError();
        uint64_t v17 = 0xD00000000000002ELL;
        uint64_t v16 = v22;
        uint64_t v18 = 0x800000025E66BF70;
        uint64_t v19 = 67;
        goto LABEL_13;
      }
      goto LABEL_27;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
  return result;
}

uint64_t ASN1IntegerRepresentable.init(derEncoded:withIdentifier:)(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(result + 16);
  uint64_t v4 = *(void *)(result + 24);
  uint64_t v7 = *(void *)(result + 32);
  unint64_t v6 = *(void *)(result + 40);
  uint64_t v8 = *(void *)(result + 48);
  uint64_t v9 = *(unsigned __int8 *)(result + 56);
  if (*(void *)result != *(void *)a2 || *(unsigned __int8 *)(result + 8) != *(unsigned __int8 *)(a2 + 8))
  {
    sub_25E64EBC8();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1Integer.swift", 27, 2, 46, v16);
    j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, v9);
    swift_unknownObjectRelease();
    return swift_willThrow();
  }
  if (!*(unsigned char *)(result + 56)) {
    goto LABEL_31;
  }
  uint64_t v12 = swift_unknownObjectRetain();
  j__swift_unknownObjectRelease(v12, v4, v7, v6, v8, 1);
  uint64_t result = swift_unknownObjectRelease();
  int64_t v13 = v6 >> 1;
  if (__OFSUB__(v6 >> 1, v7))
  {
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  if ((uint64_t)((v6 >> 1) - v7) < 1)
  {
    sub_25E64EBC8();
    swift_allocError();
    uint64_t v18 = v17;
    uint64_t v19 = 0xD00000000000001FLL;
    uint64_t v20 = 0x800000025E66BF20;
    uint64_t v21 = 55;
    goto LABEL_19;
  }
  if (v7 == v13) {
    goto LABEL_13;
  }
  if (v7 >= v13) {
    goto LABEL_28;
  }
  if (v7 + 1 == v13) {
    goto LABEL_13;
  }
  if (v7 + 1 < v13)
  {
    int v14 = *(char *)(v4 + v7 + 1);
    if (*(unsigned char *)(v4 + v7))
    {
      if (*(unsigned __int8 *)(v4 + v7) != 255 || (v14 & 0x80000000) == 0)
      {
LABEL_13:
        uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t))(a4 + 32);
        swift_unknownObjectRetain();
        uint64_t result = v15(a3, a4);
        if ((result & 1) != 0 || v7 == v13)
        {
          j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, 1);
          return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t))(a4 + 40))(v5, v4, v7, v6, a3, a4);
        }
        if (v7 < v13)
        {
          int v22 = *(char *)(v4 + v7);
          j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, 1);
          if (!v22) {
            return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t))(a4 + 40))(v5, v4, ++v7, v6, a3, a4);
          }
          if ((v22 & 0x80000000) == 0) {
            return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t))(a4 + 40))(v5, v4, v7, v6, a3, a4);
          }
          sub_25E64EBC8();
          swift_allocError();
          uint64_t v19 = 0xD000000000000021;
          uint64_t v18 = v23;
          uint64_t v20 = 0x800000025E66BF40;
          uint64_t v21 = 77;
          goto LABEL_19;
        }
        goto LABEL_30;
      }
    }
    else if (v14 < 0)
    {
      goto LABEL_13;
    }
    sub_25E64EBC8();
    swift_allocError();
    uint64_t v19 = 0xD00000000000002ELL;
    uint64_t v18 = v24;
    uint64_t v20 = 0x800000025E66BF70;
    uint64_t v21 = 67;
LABEL_19:
    static ASN1Error.invalidASN1IntegerEncoding(reason:file:line:)(v19, v20, (uint64_t)"SwiftASN1/ASN1Integer.swift", 27, 2, v21, v18);
    swift_willThrow();
    return j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, 1);
  }
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
  return result;
}

uint64_t ASN1IntegerRepresentable.serialize(into:withIdentifier:)(char **a1, uint64_t a2)
{
  char v2 = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void *)a2;
  char v5 = v2;
  return sub_25E6504FC(&v4, 0, a1, (uint64_t (*)(char **))sub_25E65A14C);
}

uint64_t sub_25E65545C(int64_t a1, uint64_t *a2)
{
  return sub_25E655984(a1, a2, (uint64_t (*)(unint64_t, unint64_t, void, int64_t))sub_25E65E620, (uint64_t (*)(unint64_t, void, unint64_t))sub_25E65CF7C, (uint64_t (*)(unint64_t, unint64_t, unint64_t))sub_25E65BCC8);
}

uint64_t sub_25E6554B0(unint64_t a1, char **a2)
{
  return sub_25E655F28(a1, a2, (uint64_t (*)(unint64_t, unint64_t, void, int64_t))sub_25E65E624, (uint64_t (*)(unint64_t, void, unint64_t))sub_25E65CF7C, (uint64_t (*)(unint64_t, unint64_t, unint64_t))sub_25E65BCF4, (uint64_t (*)(unint64_t))sub_25E65BF84);
}

uint64_t sub_25E655518(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, char **a5)
{
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v5 = a5;
  if (a4 >> 1 != a3)
  {
    if ((uint64_t)(a4 >> 1) <= a3)
    {
      __break(1u);
    }
    else
    {
      unint64_t v6 = a4;
      uint64_t v7 = a2;
      if ((*(char *)(a2 + a3) & 0x80000000) == 0)
      {
        uint64_t v13 = sub_25E656450(a1, a2, a3, a4);
        sub_25E65E8B4(v13, v14, v15, v16);
        return swift_unknownObjectRelease();
      }
      uint64_t v8 = *a5;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *char v5 = v8;
      if (isUniquelyReferenced_nonNull_native)
      {
LABEL_11:
        unint64_t v18 = *((void *)v8 + 2);
        unint64_t v19 = *((void *)v8 + 3);
        unint64_t v20 = v18 + 1;
        if (v18 >= v19 >> 1)
        {
          unint64_t v25 = v18 + 1;
          int v22 = v8;
          unint64_t v23 = *((void *)v8 + 2);
          BOOL v24 = sub_25E64EE6C((char *)(v19 > 1), v18 + 1, 1, v22);
          unint64_t v18 = v23;
          unint64_t v20 = v25;
          uint64_t v8 = v24;
        }
        *((void *)v8 + 2) = v20;
        v8[v18 + 32] = 0;
        *char v5 = v8;
        uint64_t v21 = swift_unknownObjectRetain();
        sub_25E65E8B4(v21, v7, a3, v6);
        return swift_unknownObjectRelease();
      }
    }
    uint64_t v8 = sub_25E64EE6C(0, *((void *)v8 + 2) + 1, 1, v8);
    *char v5 = v8;
    goto LABEL_11;
  }
  unint64_t v6 = (unint64_t)*a5;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *char v5 = v6;
  if ((result & 1) == 0)
  {
LABEL_16:
    uint64_t result = (uint64_t)sub_25E64EE6C(0, *(void *)(v6 + 16) + 1, 1, (char *)v6);
    unint64_t v6 = result;
    *char v5 = result;
  }
  unint64_t v11 = *(void *)(v6 + 16);
  unint64_t v10 = *(void *)(v6 + 24);
  if (v11 >= v10 >> 1)
  {
    uint64_t result = (uint64_t)sub_25E64EE6C((char *)(v10 > 1), v11 + 1, 1, (char *)v6);
    unint64_t v6 = result;
  }
  *(void *)(v6 + 16) = v11 + 1;
  *(unsigned char *)(v6 + v11 + 32) = 0;
  *char v5 = v6;
  return result;
}

uint64_t sub_25E6556D8(uint64_t a1, uint64_t *a2)
{
  if ((_BYTE)a1)
  {
    sub_25E6568E4(a1, (uint64_t (*)(uint64_t, uint64_t, void, uint64_t))sub_25E65E628, (uint64_t (*)(uint64_t, void, uint64_t))sub_25E65CF80, (uint64_t)v7);
    return sub_25E65BF9C(v7[0], v7[1], v8);
  }
  else
  {
    uint64_t v4 = *a2;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    *a2 = v4;
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_25E64EE6C(0, *(void *)(v4 + 16) + 1, 1, (char *)v4);
      uint64_t v4 = result;
      *a2 = result;
    }
    unint64_t v6 = *(void *)(v4 + 16);
    unint64_t v5 = *(void *)(v4 + 24);
    if (v6 >= v5 >> 1)
    {
      uint64_t result = (uint64_t)sub_25E64EE6C((char *)(v5 > 1), v6 + 1, 1, (char *)v4);
      uint64_t v4 = result;
    }
    *(void *)(v4 + 16) = v6 + 1;
    *(unsigned char *)(v4 + v6 + 32) = 0;
    *a2 = v4;
  }
  return result;
}

uint64_t sub_25E6557D8(uint64_t a1, uint64_t *a2)
{
  if ((_WORD)a1)
  {
    sub_25E65655C(a1, (uint64_t)v7);
    return sub_25E65BFC8(v7[0], v7[1], v8);
  }
  else
  {
    uint64_t v4 = *a2;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    *a2 = v4;
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_25E64EE6C(0, *(void *)(v4 + 16) + 1, 1, (char *)v4);
      uint64_t v4 = result;
      *a2 = result;
    }
    unint64_t v6 = *(void *)(v4 + 16);
    unint64_t v5 = *(void *)(v4 + 24);
    if (v6 >= v5 >> 1)
    {
      uint64_t result = (uint64_t)sub_25E64EE6C((char *)(v5 > 1), v6 + 1, 1, (char *)v4);
      uint64_t v4 = result;
    }
    *(void *)(v4 + 16) = v6 + 1;
    *(unsigned char *)(v4 + v6 + 32) = 0;
    *a2 = v4;
  }
  return result;
}

uint64_t sub_25E6558B0(uint64_t a1, uint64_t *a2)
{
  if (a1)
  {
    sub_25E656660(a1, (uint64_t)v7);
    return sub_25E65BFF4(v7[0], v7[1], v8);
  }
  else
  {
    uint64_t v4 = *a2;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    *a2 = v4;
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_25E64EE6C(0, *(void *)(v4 + 16) + 1, 1, (char *)v4);
      uint64_t v4 = result;
      *a2 = result;
    }
    unint64_t v6 = *(void *)(v4 + 16);
    unint64_t v5 = *(void *)(v4 + 24);
    if (v6 >= v5 >> 1)
    {
      uint64_t result = (uint64_t)sub_25E64EE6C((char *)(v5 > 1), v6 + 1, 1, (char *)v4);
      uint64_t v4 = result;
    }
    *(void *)(v4 + 16) = v6 + 1;
    *(unsigned char *)(v4 + v6 + 32) = 0;
    *a2 = v4;
  }
  return result;
}

uint64_t sub_25E655984(int64_t a1, uint64_t *a2, uint64_t (*a3)(unint64_t, unint64_t, void, int64_t), uint64_t (*a4)(unint64_t, void, unint64_t), uint64_t (*a5)(unint64_t, unint64_t, unint64_t))
{
  if (a1)
  {
    sub_25E6567A8(a1, a3, a4, v11);
    return a5(v11[0], v11[1], v11[2]);
  }
  else
  {
    uint64_t v8 = *a2;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    *a2 = v8;
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_25E64EE6C(0, *(void *)(v8 + 16) + 1, 1, (char *)v8);
      uint64_t v8 = result;
      *a2 = result;
    }
    unint64_t v10 = *(void *)(v8 + 16);
    unint64_t v9 = *(void *)(v8 + 24);
    if (v10 >= v9 >> 1)
    {
      uint64_t result = (uint64_t)sub_25E64EE6C((char *)(v9 > 1), v10 + 1, 1, (char *)v8);
      uint64_t v8 = result;
    }
    *(void *)(v8 + 16) = v10 + 1;
    *(unsigned char *)(v8 + v10 + 32) = 0;
    *a2 = v8;
  }
  return result;
}

uint64_t sub_25E655A68(uint64_t a1, char **a2)
{
  if ((_BYTE)a1)
  {
    unsigned int v3 = a1;
    if ((a1 & 0x80) != 0)
    {
      uint64_t v8 = *a2;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *a2 = v8;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        uint64_t v8 = sub_25E64EE6C(0, *((void *)v8 + 2) + 1, 1, v8);
        *a2 = v8;
      }
      unint64_t v10 = *((void *)v8 + 2);
      unint64_t v11 = *((void *)v8 + 3);
      unint64_t v12 = v10 + 1;
      if (v10 >= v11 >> 1)
      {
        unint64_t v18 = v10 + 1;
        uint64_t v13 = v8;
        unint64_t v14 = v10;
        uint64_t v15 = sub_25E64EE6C((char *)(v11 > 1), v10 + 1, 1, v13);
        unint64_t v10 = v14;
        unint64_t v12 = v18;
        uint64_t v8 = v15;
      }
      *((void *)v8 + 2) = v12;
      v8[v10 + 32] = 0;
      *a2 = v8;
      return sub_25E65C2C4(v3);
    }
    else
    {
      sub_25E6568E4(a1, (uint64_t (*)(uint64_t, uint64_t, void, uint64_t))sub_25E65E718, (uint64_t (*)(uint64_t, void, uint64_t))sub_25E65CF80, (uint64_t)v16);
      return sub_25E65C020(v16[0], v16[1], v17);
    }
  }
  else
  {
    uint64_t v5 = (uint64_t)*a2;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    *a2 = (char *)v5;
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_25E64EE6C(0, *(void *)(v5 + 16) + 1, 1, (char *)v5);
      uint64_t v5 = result;
      *a2 = (char *)result;
    }
    unint64_t v7 = *(void *)(v5 + 16);
    unint64_t v6 = *(void *)(v5 + 24);
    if (v7 >= v6 >> 1)
    {
      uint64_t result = (uint64_t)sub_25E64EE6C((char *)(v6 > 1), v7 + 1, 1, (char *)v5);
      uint64_t v5 = result;
    }
    *(void *)(v5 + 16) = v7 + 1;
    *(unsigned char *)(v5 + v7 + 32) = 0;
    *a2 = (char *)v5;
  }
  return result;
}

uint64_t sub_25E655C08(uint64_t a1, char **a2)
{
  if ((_WORD)a1)
  {
    if ((sub_25E6579FC((unsigned __int16)(39 - __clz((unsigned __int16)a1)) >> 3, a1) & 0x80) != 0)
    {
      uint64_t v8 = *a2;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *a2 = v8;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        uint64_t v8 = sub_25E64EE6C(0, *((void *)v8 + 2) + 1, 1, v8);
        *a2 = v8;
      }
      unint64_t v10 = *((void *)v8 + 2);
      unint64_t v11 = *((void *)v8 + 3);
      unint64_t v12 = v10 + 1;
      if (v10 >= v11 >> 1)
      {
        unint64_t v18 = v10 + 1;
        uint64_t v13 = v8;
        unint64_t v14 = v10;
        uint64_t v15 = sub_25E64EE6C((char *)(v11 > 1), v10 + 1, 1, v13);
        unint64_t v10 = v14;
        unint64_t v12 = v18;
        uint64_t v8 = v15;
      }
      *((void *)v8 + 2) = v12;
      v8[v10 + 32] = 0;
      *a2 = v8;
      return sub_25E65C700(a1);
    }
    else
    {
      sub_25E656990(a1, (uint64_t)v16);
      return sub_25E65C43C(v16[0], v16[1], v17);
    }
  }
  else
  {
    uint64_t v5 = (uint64_t)*a2;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    *a2 = (char *)v5;
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_25E64EE6C(0, *(void *)(v5 + 16) + 1, 1, (char *)v5);
      uint64_t v5 = result;
      *a2 = (char *)result;
    }
    unint64_t v7 = *(void *)(v5 + 16);
    unint64_t v6 = *(void *)(v5 + 24);
    if (v7 >= v6 >> 1)
    {
      uint64_t result = (uint64_t)sub_25E64EE6C((char *)(v6 > 1), v7 + 1, 1, (char *)v5);
      uint64_t v5 = result;
    }
    *(void *)(v5 + 16) = v7 + 1;
    *(unsigned char *)(v5 + v7 + 32) = 0;
    *a2 = (char *)v5;
  }
  return result;
}

uint64_t sub_25E655D9C(uint64_t a1, char **a2)
{
  if (a1)
  {
    if ((sub_25E657A50((39 - __clz(a1)) >> 3, a1) & 0x80) != 0)
    {
      uint64_t v8 = *a2;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *a2 = v8;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        uint64_t v8 = sub_25E64EE6C(0, *((void *)v8 + 2) + 1, 1, v8);
        *a2 = v8;
      }
      unint64_t v10 = *((void *)v8 + 2);
      unint64_t v11 = *((void *)v8 + 3);
      unint64_t v12 = v10 + 1;
      if (v10 >= v11 >> 1)
      {
        unint64_t v18 = v10 + 1;
        uint64_t v13 = v8;
        unint64_t v14 = v10;
        uint64_t v15 = sub_25E64EE6C((char *)(v11 > 1), v10 + 1, 1, v13);
        unint64_t v10 = v14;
        unint64_t v12 = v18;
        uint64_t v8 = v15;
      }
      *((void *)v8 + 2) = v12;
      v8[v10 + 32] = 0;
      *a2 = v8;
      return sub_25E65CBA8(a1);
    }
    else
    {
      sub_25E656A6C(a1, (uint64_t)v16);
      return sub_25E65C8F0(v16[0], v16[1], v17);
    }
  }
  else
  {
    uint64_t v5 = (uint64_t)*a2;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    *a2 = (char *)v5;
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_25E64EE6C(0, *(void *)(v5 + 16) + 1, 1, (char *)v5);
      uint64_t v5 = result;
      *a2 = (char *)result;
    }
    unint64_t v7 = *(void *)(v5 + 16);
    unint64_t v6 = *(void *)(v5 + 24);
    if (v7 >= v6 >> 1)
    {
      uint64_t result = (uint64_t)sub_25E64EE6C((char *)(v6 > 1), v7 + 1, 1, (char *)v5);
      uint64_t v5 = result;
    }
    *(void *)(v5 + 16) = v7 + 1;
    *(unsigned char *)(v5 + v7 + 32) = 0;
    *a2 = (char *)v5;
  }
  return result;
}

uint64_t sub_25E655F28(unint64_t a1, char **a2, uint64_t (*a3)(unint64_t, unint64_t, void, int64_t), uint64_t (*a4)(unint64_t, void, unint64_t), uint64_t (*a5)(unint64_t, unint64_t, unint64_t), uint64_t (*a6)(unint64_t))
{
  if (a1)
  {
    if ((sub_25E657AA0((71 - __clz(a1)) >> 3, a1) & 0x80) != 0)
    {
      unint64_t v16 = *a2;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *a2 = v16;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        unint64_t v16 = sub_25E64EE6C(0, *((void *)v16 + 2) + 1, 1, v16);
        *a2 = v16;
      }
      unint64_t v19 = *((void *)v16 + 2);
      unint64_t v18 = *((void *)v16 + 3);
      if (v19 >= v18 >> 1) {
        unint64_t v16 = sub_25E64EE6C((char *)(v18 > 1), v19 + 1, 1, v16);
      }
      *((void *)v16 + 2) = v19 + 1;
      v16[v19 + 32] = 0;
      *a2 = v16;
      return a6(a1);
    }
    else
    {
      sub_25E656C50(a1, a3, a4, v20);
      return a5(v20[0], v20[1], v20[2]);
    }
  }
  else
  {
    uint64_t v13 = (uint64_t)*a2;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    *a2 = (char *)v13;
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_25E64EE6C(0, *(void *)(v13 + 16) + 1, 1, (char *)v13);
      uint64_t v13 = result;
      *a2 = (char *)result;
    }
    unint64_t v15 = *(void *)(v13 + 16);
    unint64_t v14 = *(void *)(v13 + 24);
    if (v15 >= v14 >> 1)
    {
      uint64_t result = (uint64_t)sub_25E64EE6C((char *)(v14 > 1), v15 + 1, 1, (char *)v13);
      uint64_t v13 = result;
    }
    *(void *)(v13 + 16) = v15 + 1;
    *(unsigned char *)(v13 + v15 + 32) = 0;
    *a2 = (char *)v13;
  }
  return result;
}

uint64_t sub_25E6560CC(uint64_t a1, char **a2, uint64_t a3, uint64_t a4)
{
  swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  unint64_t v10 = (char *)&v23 - v9;
  uint64_t v11 = swift_checkMetadataState();
  uint64_t v24 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  unint64_t v25 = (char *)&v23 - v12;
  uint64_t v27 = a1;
  if (sub_25E6696F0())
  {
    if (((*(uint64_t (**)(uint64_t, uint64_t))(a4 + 32))(a3, a4) & 1) != 0
      || (sub_25E669720(), v29 == 1)
      || (v28 & 0x80000000) == 0)
    {
      sub_25E656D64((uint64_t)v10);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A6FE450);
      swift_getAssociatedConformanceWitness();
      return sub_25E669690();
    }
    else
    {
      unsigned int v17 = *a2;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *a2 = v17;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        unsigned int v17 = sub_25E64EE6C(0, *((void *)v17 + 2) + 1, 1, v17);
        *a2 = v17;
      }
      uint64_t v20 = v24;
      unint64_t v19 = v25;
      unint64_t v22 = *((void *)v17 + 2);
      unint64_t v21 = *((void *)v17 + 3);
      if (v22 >= v21 >> 1) {
        unsigned int v17 = sub_25E64EE6C((char *)(v21 > 1), v22 + 1, 1, v17);
      }
      *((void *)v17 + 2) = v22 + 1;
      v17[v22 + 32] = 0;
      *a2 = v17;
      (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v19, v27, v11);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A6FE450);
      return sub_25E669690();
    }
  }
  else
  {
    uint64_t v14 = (uint64_t)*a2;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    *a2 = (char *)v14;
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_25E64EE6C(0, *(void *)(v14 + 16) + 1, 1, (char *)v14);
      uint64_t v14 = result;
      *a2 = (char *)result;
    }
    unint64_t v16 = *(void *)(v14 + 16);
    unint64_t v15 = *(void *)(v14 + 24);
    if (v16 >= v15 >> 1)
    {
      uint64_t result = (uint64_t)sub_25E64EE6C((char *)(v15 > 1), v16 + 1, 1, (char *)v14);
      uint64_t v14 = result;
    }
    *(void *)(v14 + 16) = v16 + 1;
    *(unsigned char *)(v14 + v16 + 32) = 0;
    *a2 = (char *)v14;
  }
  return result;
}

uint64_t sub_25E656450(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  int64_t v4 = a4 >> 1;
  if ((uint64_t)(a4 >> 1) < a3)
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  uint64_t v5 = a3;
  if (a4 >> 1 == a3) {
    return swift_unknownObjectRetain();
  }
  if (v4 <= a3) {
    goto LABEL_31;
  }
  int v6 = *(unsigned __int8 *)(a2 + a3);
  if (v6 != 255 && v6 != 0) {
    return swift_unknownObjectRetain();
  }
  if (!__OFSUB__(v4, a3))
  {
    if (v4 - a3 >= 2)
    {
      if (a3 <= v4) {
        unint64_t v8 = a4 >> 1;
      }
      else {
        unint64_t v8 = a3;
      }
      int v9 = *(unsigned __int8 *)(a2 + a3);
      while (v4 != v5)
      {
        if (v8 == v5)
        {
          __break(1u);
LABEL_26:
          __break(1u);
LABEL_27:
          __break(1u);
LABEL_28:
          __break(1u);
LABEL_29:
          __break(1u);
          goto LABEL_30;
        }
        if (v9 != v6) {
          return swift_unknownObjectRetain();
        }
        if (__OFSUB__(v4, v5)) {
          goto LABEL_26;
        }
        if (v4 - 1 == v5) {
          goto LABEL_27;
        }
        uint64_t v10 = v5 + 1;
        if (v5 + 1 >= v4) {
          goto LABEL_28;
        }
        int v9 = *(unsigned __int8 *)(a2 + 1 + v5);
        if (((v9 ^ v6) & 0x80) != 0) {
          return swift_unknownObjectRetain();
        }
        BOOL v11 = __OFSUB__(v4, v10);
        uint64_t v12 = v4 - v10;
        if (v11) {
          goto LABEL_29;
        }
        ++v5;
        if (v12 <= 1) {
          return swift_unknownObjectRetain();
        }
      }
    }
    return swift_unknownObjectRetain();
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_25E65655C@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  if ((_WORD)result)
  {
    int v3 = result;
    unint64_t v4 = (unsigned __int16)(32 - __clz((unsigned __int16)result)) + 7;
    unint64_t v5 = v4 >> 3;
    uint64_t result = sub_25E657870(v4 >> 3, result);
    unsigned __int8 v6 = result;
    if ((_BYTE)result && result != 255
      || (uint64_t result = sub_25E65CF84(v5, 0, v3), result < 2)
      || v6 != ((unsigned __int16)v3 >> (8 * ((v5 - 1) & 1))))
    {
LABEL_12:
      *(void *)a2 = v5;
      *(void *)(a2 + 8) = 0;
      *(_WORD *)(a2 + 16) = v3;
      return result;
    }
    if (v5 == 1)
    {
      __break(1u);
    }
    else if ((unsigned __int16)v3 >= 0x100u)
    {
      int v7 = (unsigned __int16)v3 >> (v4 & 8);
      if ((unsigned __int16)v4 < 0x10u) {
        LOBYTE(v7) = v3 << (-(v4 & 8) & 8);
      }
      if (((v7 ^ v6) & 0x80u) == 0) {
        --v5;
      }
      goto LABEL_12;
    }
    __break(1u);
  }
  else
  {
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *(_WORD *)(a2 + 16) = 0;
  }
  return result;
}

uint64_t sub_25E656660@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  if (result)
  {
    unsigned int v3 = result;
    unint64_t v4 = 32 - __clz(result) + 7;
    unint64_t v5 = v4 >> 3;
    uint64_t result = sub_25E657910(v4 >> 3, result);
    int v6 = result;
    if ((_BYTE)result && result != 255 || (uint64_t result = sub_25E65CF88(v5, 0, v3), result < 2))
    {
LABEL_20:
      *(void *)a2 = v5;
      *(void *)(a2 + 8) = 0;
      *(_DWORD *)(a2 + 16) = v3;
    }
    else
    {
      uint64_t v7 = 0;
      uint64_t v8 = 8 * v5;
      uint64_t v9 = 8 * v5 - 8;
      int v10 = -16;
      int v11 = -8;
      while (1)
      {
        if (v8 == v7)
        {
          unint64_t v5 = 0;
          goto LABEL_20;
        }
        if ((int)v8 + v11 >= 0) {
          unsigned __int8 v12 = v3 >> ((v8 + v11) & 0x18);
        }
        else {
          unsigned __int8 v12 = v3 << ((v7 - (v4 & 0xF8) + 8) & 0x18);
        }
        if (v6 != v12) {
          goto LABEL_20;
        }
        if (v9 == v7) {
          break;
        }
        if ((int)v8 + v10 >= 0) {
          unsigned int v13 = v3 >> ((v8 + v10) & 0x18);
        }
        else {
          unsigned int v13 = v3 << ((v7 - (v4 & 0xF8) + 16) & 0x18);
        }
        if (((v6 ^ v13) & 0x80) != 0) {
          goto LABEL_20;
        }
        --v5;
        v7 += 8;
        v10 -= 8;
        v11 -= 8;
        if (v5 <= 1)
        {
          unint64_t v5 = 1;
          goto LABEL_20;
        }
      }
      __break(1u);
    }
  }
  else
  {
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *(_DWORD *)(a2 + 16) = 0;
  }
  return result;
}

int64_t sub_25E6567A8@<X0>(int64_t result@<X0>, uint64_t (*a2)(unint64_t, unint64_t, void, int64_t)@<X1>, uint64_t (*a3)(unint64_t, void, unint64_t)@<X2>, unint64_t *a4@<X8>)
{
  if (result)
  {
    unint64_t v6 = result;
    unint64_t v7 = (71 - __clz(result)) >> 3;
    uint64_t result = a2(v7, v7, 0, result);
    int v8 = result;
    if ((_BYTE)result && result != 255 || (uint64_t result = a3(v7, 0, v6), result < 2))
    {
LABEL_19:
      *a4 = v7;
      a4[1] = 0;
      a4[2] = v6;
    }
    else
    {
      uint64_t v9 = 8 * v7;
      char v10 = 16 - 8 * v7;
      while (1)
      {
        if (!v9)
        {
          unint64_t v7 = 0;
          goto LABEL_19;
        }
        if (v9 - 8 < 0) {
          unint64_t v11 = v6 << ((v10 - 8) & 0x38);
        }
        else {
          unint64_t v11 = v6 >> ((v9 - 8) & 0x38);
        }
        if (v8 != v11) {
          goto LABEL_19;
        }
        uint64_t v12 = v9 - 8;
        if (v9 == 8) {
          break;
        }
        BOOL v13 = v9 < 16;
        unint64_t v14 = v6 >> ((v9 + 48) & 0x38);
        if (v13) {
          unint64_t v14 = v6 << (v10 & 0x38);
        }
        if (((v8 ^ v14) & 0x80) != 0) {
          goto LABEL_19;
        }
        --v7;
        v10 += 8;
        uint64_t v9 = v12;
        if (v7 <= 1)
        {
          unint64_t v7 = 1;
          goto LABEL_19;
        }
      }
      __break(1u);
    }
  }
  else
  {
    *a4 = 0;
    a4[1] = 0;
    a4[2] = 0;
  }
  return result;
}

uint64_t sub_25E6568E4@<X0>(uint64_t result@<X0>, uint64_t (*a2)(uint64_t, uint64_t, void, uint64_t)@<X1>, uint64_t (*a3)(uint64_t, void, uint64_t)@<X2>, uint64_t a4@<X8>)
{
  if ((_BYTE)result)
  {
    uint64_t v6 = result;
    uint64_t result = a2(1, 1, 0, result);
    unsigned __int8 v7 = result;
    if ((_BYTE)result && result != 255
      || ((result = a3(1, 0, v6), v7 == v6) ? (BOOL v8 = result <= 1) : (BOOL v8 = 1), v8))
    {
      *(_OWORD *)a4 = xmmword_25E66A000;
      *(unsigned char *)(a4 + 16) = v6;
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    *(void *)a4 = 0;
    *(void *)(a4 + 8) = 0;
    *(unsigned char *)(a4 + 16) = 0;
  }
  return result;
}

uint64_t sub_25E656990@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  if ((_WORD)result)
  {
    unsigned __int16 v3 = result;
    unint64_t v4 = ((unint64_t)(unsigned __int16)(32 - __clz((unsigned __int16)result)) + 7) >> 3;
    uint64_t result = sub_25E6579FC(v4, result);
    unsigned __int8 v5 = result;
    if ((_BYTE)result && result != 255) {
      goto LABEL_10;
    }
    uint64_t result = sub_25E65CF84(v4, 0, v3);
    if (result < 2 || v5 != (v3 >> (8 * ((v4 - 1) & 1)))) {
      goto LABEL_10;
    }
    if (v4 == 1)
    {
      __break(1u);
    }
    else if (v3 >= 0x100u)
    {
      if (((v5 ^ v3) & 0x80u) == 0) {
        --v4;
      }
LABEL_10:
      *(void *)a2 = v4;
      *(void *)(a2 + 8) = 0;
      *(_WORD *)(a2 + 16) = v3;
      return result;
    }
    __break(1u);
  }
  else
  {
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *(_WORD *)(a2 + 16) = 0;
  }
  return result;
}

uint64_t sub_25E656A6C@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  if (!result)
  {
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *(_DWORD *)(a2 + 16) = 0;
    return result;
  }
  unsigned int v3 = result;
  uint64_t v4 = 32 - __clz(result);
  unint64_t v5 = (unint64_t)(v4 + 7) >> 3;
  uint64_t result = sub_25E657A50(v5, result);
  int v6 = result;
  if ((_BYTE)result && result != 255)
  {
    *(void *)a2 = v5;
    goto LABEL_30;
  }
  uint64_t result = sub_25E65CF88((unint64_t)(v4 + 7) >> 3, 0, v3);
  if (result < 2 || (unint64_t v7 = v5 - 1, v6 != (v3 >> (8 * ((v5 - 1) & 3)))))
  {
    unint64_t v8 = (unint64_t)(v4 + 7) >> 3;
    goto LABEL_28;
  }
  if (v5 == 1) {
    goto LABEL_34;
  }
  if (v3 < 0x100) {
    goto LABEL_35;
  }
  unint64_t v8 = (unint64_t)(v4 + 7) >> 3;
  if (((v6 ^ (v3 >> ((v4 + 23) & 0x18))) & 0x80) != 0)
  {
LABEL_28:
    *(void *)a2 = v8;
LABEL_30:
    *(void *)(a2 + 8) = 0;
    *(_DWORD *)(a2 + 16) = v3;
    return result;
  }
  if (v7 < 2)
  {
LABEL_31:
    unint64_t v8 = 1;
    goto LABEL_28;
  }
  unint64_t v9 = v5 - 2;
  if (v6 != (v3 >> (8 * ((v5 - 2) & 3))))
  {
LABEL_32:
    unint64_t v8 = v7;
    goto LABEL_28;
  }
  if (v5 == 2)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v3 < 0x10000) {
    goto LABEL_35;
  }
  unint64_t v8 = v5 - 1;
  if (((v6 ^ (v3 >> ((8 * v7 + 16) & 0x18))) & 0x80) != 0) {
    goto LABEL_28;
  }
  if (v9 < 2) {
    goto LABEL_31;
  }
  unint64_t v7 = v5 - 3;
  if (v6 != (v3 >> (8 * ((v5 - 3) & 3))))
  {
    unint64_t v8 = v5 - 2;
    goto LABEL_28;
  }
  if (v5 == 3) {
    goto LABEL_34;
  }
  if (!HIBYTE(v3)) {
    goto LABEL_35;
  }
  unint64_t v8 = v5 - 2;
  if (((v6 ^ (v3 >> ((8 * v9 + 16) & 0x18))) & 0x80) != 0) {
    goto LABEL_28;
  }
  if (v7 < 2) {
    goto LABEL_31;
  }
  if (v6 != (v3 >> ((v4 + 7) & 0x18))) {
    goto LABEL_32;
  }
  if (v5 == 4) {
    goto LABEL_34;
  }
  if (v4 >= 0x21)
  {
    if (((v6 ^ (v3 >> ((8 * v7 + 16) & 0x18))) & 0x80u) == 0) {
      unint64_t v8 = 1;
    }
    else {
      unint64_t v8 = v5 - 3;
    }
    goto LABEL_28;
  }
LABEL_35:
  __break(1u);
  return result;
}

int64_t sub_25E656C50@<X0>(int64_t result@<X0>, uint64_t (*a2)(unint64_t, unint64_t, void, int64_t)@<X1>, uint64_t (*a3)(unint64_t, void, unint64_t)@<X2>, unint64_t *a4@<X8>)
{
  if (result)
  {
    unint64_t v6 = result;
    unint64_t v7 = (71 - __clz(result)) >> 3;
    uint64_t result = a2(v7, v7, 0, result);
    int v8 = result;
    if ((_BYTE)result && result != 255 || (uint64_t result = a3(v7, 0, v6), result < 2))
    {
LABEL_15:
      *a4 = v7;
      a4[1] = 0;
      a4[2] = v6;
    }
    else
    {
      uint64_t v9 = 8 * v7;
      while (1)
      {
        if (!v9)
        {
          unint64_t v7 = 0;
          goto LABEL_15;
        }
        if (v8 != (v6 >> ((v9 - 8) & 0x38))) {
          goto LABEL_15;
        }
        if (v9 == 8) {
          break;
        }
        if (v9 < 16) {
          goto LABEL_17;
        }
        if (((v8 ^ (v6 >> ((v9 + 48) & 0x38))) & 0x80) != 0) {
          goto LABEL_15;
        }
        --v7;
        v9 -= 8;
        if (v7 <= 1)
        {
          unint64_t v7 = 1;
          goto LABEL_15;
        }
      }
      __break(1u);
LABEL_17:
      __break(1u);
    }
  }
  else
  {
    *a4 = 0;
    a4[1] = 0;
    a4[2] = 0;
  }
  return result;
}

uint64_t sub_25E656D64@<X0>(uint64_t a1@<X8>)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v3 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v4 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  unint64_t v22 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  int v8 = (char *)&v19 - v7;
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  unint64_t v11 = (char *)&v19 - v10;
  MEMORY[0x270FA5388](v9);
  BOOL v13 = (char *)&v19 - v12;
  sub_25E669750();
  swift_getAssociatedConformanceWitness();
  sub_25E669720();
  if ((v29 & 1) != 0 || v28 && v28 != 255) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v3 + 32))(a1, v13, AssociatedTypeWitness);
  }
  int v23 = v28;
  uint64_t v19 = a1;
  uint64_t v20 = v3;
  if (sub_25E6696F0() >= 2)
  {
    unint64_t v14 = (void (**)(char *, char *, uint64_t))(v20 + 16);
    unint64_t v15 = (uint64_t (**)(char *, uint64_t))(v20 + 8);
    unint64_t v21 = (void (**)(char *, char *, uint64_t))(v20 + 32);
    while (1)
    {
      sub_25E669720();
      if ((v27 & 1) != 0 || v26 != v23) {
        break;
      }
      unint64_t v16 = *v14;
      (*v14)(v8, v13, AssociatedTypeWitness);
      sub_25E669740();
      sub_25E669720();
      unsigned int v17 = *v15;
      uint64_t result = (*v15)(v11, AssociatedTypeWitness);
      if (v25)
      {
        __break(1u);
        return result;
      }
      if (((v24 ^ v23) & 0x80) == 0)
      {
        v16(v22, v13, AssociatedTypeWitness);
        sub_25E669740();
        v17(v13, AssociatedTypeWitness);
        (*v21)(v13, v8, AssociatedTypeWitness);
        if (sub_25E6696F0() > 1) {
          continue;
        }
      }
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v20 + 32))(v19, v13, AssociatedTypeWitness);
    }
  }
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v20 + 32))(v19, v13, AssociatedTypeWitness);
}

uint64_t ASN1IntegerRepresentable<>.init(derIntegerBytes:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v50 = a8;
  uint64_t AssociatedConformanceWitness = a7;
  uint64_t v54 = *(void *)(a6 + 8);
  uint64_t v53 = *(void *)(*(void *)(v54 + 24) + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v14 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v49 = (char *)v45 - v15;
  uint64_t v48 = *(void *)(a5 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  unint64_t v18 = (char *)v45 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  unint64_t v21 = (char *)v45 - v20;
  MEMORY[0x270FA5388](v19);
  int v23 = (char *)v45 - v22;
  v56[0] = a1;
  v56[1] = a2;
  uint64_t v47 = a2;
  uint64_t v52 = a3;
  v56[2] = a3;
  v56[3] = a4;
  unint64_t v24 = a4;
  swift_unknownObjectRetain();
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6FE498);
  uint64_t v26 = sub_25E65B034(&qword_26A6FE4A0, &qword_26A6FE498);
  char v27 = v55;
  sub_25E64D5FC((uint64_t)v56, a5, v25, a6, v26, (uint64_t)v23);
  if (v27) {
    return swift_unknownObjectRelease();
  }
  v45[0] = 0;
  v45[1] = a1;
  char v46 = v18;
  uint64_t v29 = v48;
  uint64_t v30 = v50;
  (*(void (**)(uint64_t, char *, uint64_t))(v48 + 32))(v50, v23, a5);
  uint64_t result = (*(uint64_t (**)(uint64_t))(AssociatedConformanceWitness + 32))(a5);
  if ((result & 1) == 0 || v24 >> 1 == v52) {
    return swift_unknownObjectRelease();
  }
  if ((uint64_t)(v24 >> 1) <= v52)
  {
    __break(1u);
    goto LABEL_16;
  }
  if (*(char *)(v47 + v52) < 0)
  {
    uint64_t v31 = v30;
    uint64_t v55 = v21;
    uint64_t v32 = sub_25E669830();
    uint64_t result = sub_25E669920();
    uint64_t v33 = v32 - result;
    if (!__OFSUB__(v32, result))
    {
      uint64_t v34 = sub_25E669830();
      if (v33 < v34)
      {
        uint64_t v35 = v34;
        uint64_t v36 = v31;
        uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
        uint64_t v48 = v29 + 8;
        int64_t v37 = (void (**)(char *, uint64_t))(v29 + 8);
        do
        {
          uint64_t v38 = v33 + 8;
          if (__OFADD__(v33, 8)) {
            uint64_t v38 = 0x7FFFFFFFFFFFFFFFLL;
          }
          uint64_t v52 = v38;
          sub_25E669970();
          uint64_t v39 = v36;
          uint64_t v40 = v35;
          uint64_t v41 = v46;
          sub_25E669950();
          v56[0] = v33;
          sub_25E652B1C();
          sub_25E669800();
          int v42 = *v37;
          unint64_t v43 = v41;
          uint64_t v35 = v40;
          uint64_t v36 = v39;
          (*v37)(v43, a5);
          uint64_t v44 = v55;
          sub_25E669810();
          v42(v44, a5);
          uint64_t v33 = v52;
        }
        while (v52 < v35);
      }
      return swift_unknownObjectRelease();
    }
LABEL_16:
    __break(1u);
    return result;
  }
  return swift_unknownObjectRelease();
}

uint64_t ASN1IntegerRepresentable<>.withBigEndianIntegerBytes<A>(_:)(void (*a1)(char *), uint64_t a2, uint64_t a3)
{
  uint64_t v14 = a1;
  uint64_t v5 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for IntegerBytesCollection();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  unint64_t v11 = (char *)&v13 - v10;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v3, a3);
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v11, v7, a3);
  v14(v11);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t IntegerBytesCollection.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 32))(a3, a1, a2);
}

uint64_t IntegerBytesCollection.hash(into:)()
{
  return sub_25E669590();
}

uint64_t static IntegerBytesCollection.== infix(_:_:)()
{
  return sub_25E6695F0() & 1;
}

uint64_t IntegerBytesCollection.hashValue.getter()
{
  return sub_25E669A00();
}

uint64_t sub_25E65774C()
{
  return sub_25E669A00();
}

uint64_t sub_25E657790()
{
  return static IntegerBytesCollection.== infix(_:_:)();
}

uint64_t sub_25E65779C()
{
  if (__OFSUB__(*v0, 1))
  {
    __break(1u);
  }
  else if ((unint64_t)(*v0 - 0x1000000000000001) >> 61 == 7)
  {
    sub_25E652B1C();
    return sub_25E669850();
  }
  __break(1u);
  return result;
}

uint64_t IntegerBytesCollection.startIndex.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25E64DB08();
  *a1 = result;
  return result;
}

void IntegerBytesCollection.endIndex.getter(void *a1@<X8>)
{
  *a1 = 0;
}

uint64_t IntegerBytesCollection.count.getter()
{
  return sub_25E64DB08();
}

uint64_t sub_25E657870(uint64_t result, int a2)
{
  uint64_t v2 = result - 1;
  if (__OFSUB__(result, 1))
  {
    __break(1u);
    goto LABEL_16;
  }
  if ((unint64_t)(result - 0x1000000000000001) >> 61 != 7)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v3 = 8 * v2;
  if (8 * v2 < -32768)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (v3 >= 0x8000)
  {
LABEL_18:
    __break(1u);
    return result;
  }
  uint64_t v4 = v2 << 51;
  if ((unint64_t)(v4 - 0x10000000000001) < 0xFFDFFFFFFFFFFFFFLL) {
    return 0;
  }
  unsigned int v5 = (unsigned __int16)a2 >> (v3 & 8);
  if ((unint64_t)v4 >> 52) {
    unsigned int v5 = 0;
  }
  if ((unint64_t)v4 <= 0xFFF0000000000000) {
    unsigned int v6 = 0;
  }
  else {
    unsigned int v6 = a2 << (-BYTE6(v4) & 8);
  }
  if (v4 < 0) {
    return v6;
  }
  else {
    return v5;
  }
}

uint64_t sub_25E657910(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = a1 - 1;
  if (__OFSUB__(a1, 1))
  {
    __break(1u);
    goto LABEL_12;
  }
  if ((unint64_t)(a1 - 0x1000000000000001) >> 61 != 7)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v3 = 8 * v2;
  if (8 * v2 < (uint64_t)0xFFFFFFFF80000000)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v3 > 0x7FFFFFFF)
  {
LABEL_14:
    __break(1u);
LABEL_15:
    if ((unint64_t)v2 <= 0xFFFFFFE000000000) {
      return 0;
    }
    else {
      return a2 << (-BYTE4(v2) & 0x18);
    }
  }
  v2 <<= 35;
  if (v2 < (uint64_t)0xFFFFFFE000000000 || v2 > 0x2000000000) {
    return 0;
  }
  if (v2 < 0) {
    goto LABEL_15;
  }
  if ((unint64_t)v2 >> 37) {
    return 0;
  }
  return a2 >> (v3 & 0x18);
}

uint64_t sub_25E6579B4(uint64_t result, unsigned int a2)
{
  uint64_t v2 = result - 1;
  if (__OFSUB__(result, 1))
  {
    __break(1u);
    goto LABEL_9;
  }
  if ((unint64_t)(result - 0x1000000000000001) >> 61 != 7)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (8 * v2 < 0)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if ((unint64_t)(8 * v2) > 0xFF)
  {
LABEL_11:
    __break(1u);
    return result;
  }
  if ((v2 & 0x1F) != 0) {
    return 0;
  }
  else {
    return a2;
  }
}

uint64_t sub_25E6579FC(uint64_t result, unsigned __int16 a2)
{
  uint64_t v2 = result - 1;
  if (__OFSUB__(result, 1))
  {
    __break(1u);
    goto LABEL_9;
  }
  if ((unint64_t)(result - 0x1000000000000001) >> 61 != 7)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  unint64_t v3 = 8 * v2;
  if (8 * v2 < 0)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (v3 >> 16)
  {
LABEL_11:
    __break(1u);
    return result;
  }
  unsigned int v4 = a2 >> (v3 & 8);
  if ((v2 & 0x1FFE) != 0) {
    return 0;
  }
  else {
    return v4;
  }
}

uint64_t sub_25E657A50(uint64_t result, unsigned int a2)
{
  uint64_t v2 = result - 1;
  if (__OFSUB__(result, 1))
  {
    __break(1u);
    goto LABEL_9;
  }
  if ((unint64_t)(result - 0x1000000000000001) >> 61 != 7)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  unint64_t v3 = 8 * v2;
  if (8 * v2 < 0)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (HIDWORD(v3))
  {
LABEL_11:
    __break(1u);
    return result;
  }
  unsigned int v4 = a2 >> (v3 & 0x18);
  if ((v2 & 0x1FFFFFFC) != 0) {
    return 0;
  }
  else {
    return v4;
  }
}

uint64_t sub_25E657AA0(uint64_t result, unint64_t a2)
{
  if (__OFSUB__(result, 1))
  {
    __break(1u);
    goto LABEL_8;
  }
  if ((unint64_t)(result - 0x1000000000000001) >> 61 != 7)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  unint64_t v2 = 8 * (result - 1);
  if ((v2 & 0x8000000000000000) != 0)
  {
LABEL_9:
    __break(1u);
    return result;
  }
  if (v2 >= 0x40) {
    return 0;
  }
  else {
    return (a2 >> (v2 & 0x38));
  }
}

uint64_t IntegerBytesCollection.subscript.getter(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v64 = *(void *)(a2 + 24);
  uint64_t v56 = *(void *)(*(void *)(v64 + 8) + 24);
  uint64_t v57 = v4;
  swift_getAssociatedTypeWitness();
  uint64_t v59 = *(void *)(swift_getAssociatedConformanceWitness() + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  unsigned int v63 = (char *)&v50 - v6;
  uint64_t v7 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v50 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = swift_checkMetadataState();
  uint64_t v62 = *(void *)(v10 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v52 = (char *)&v50 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v54 = (char *)&v50 - v14;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v65 = (char *)&v50 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v61 = (char *)&v50 - v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  unint64_t v21 = (char *)&v50 - v20;
  uint64_t v55 = (char *)&v50 - v20;
  MEMORY[0x270FA5388](v19);
  uint64_t v60 = (char *)&v50 - v22;
  uint64_t v23 = *a1;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v2, v4);
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  sub_25E6697D0();
  uint64_t v67 = v23;
  type metadata accessor for IntegerBytesCollection.Index();
  sub_25E65779C();
  sub_25E6697F0();
  uint64_t v25 = v4;
  uint64_t v26 = (char *)AssociatedTypeWitness;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v25);
  char v27 = *(void (**)(char *, uint64_t))(v62 + 8);
  v27(v21, v10);
  swift_getAssociatedConformanceWitness();
  sub_25E669970();
  sub_25E669950();
  unsigned __int8 v28 = v61;
  sub_25E6697E0();
  v27(v21, v10);
  uint64_t v53 = *(void (**)(char *, char *, uint64_t))(v62 + 16);
  v53(v65, v28, v10);
  uint64_t v64 = AssociatedConformanceWitness;
  if ((sub_25E669840() & 1) == 0
    || (sub_25E669970(),
        uint64_t v29 = v55,
        sub_25E669950(),
        swift_getAssociatedConformanceWitness(),
        char v30 = sub_25E6695D0(),
        uint64_t result = ((uint64_t (*)(char *, uint64_t))v27)(v29, v10),
        (v30 & 1) != 0))
  {
    uint64_t v32 = v65;
    if (sub_25E669830() < 8) {
      goto LABEL_15;
    }
    uint64_t v51 = v27;
    uint64_t v33 = v54;
    v53(v54, v32, v10);
    unsigned __int8 v66 = -1;
    uint64_t v34 = (void (*)(char *, uint64_t))v64;
    char v35 = sub_25E669840();
    uint64_t v36 = sub_25E669830();
    if (v35)
    {
      if (v36 <= 8)
      {
        sub_25E669970();
        int64_t v37 = v55;
        sub_25E669950();
        swift_getAssociatedConformanceWitness();
        char v38 = sub_25E6695B0();
        uint64_t v39 = v37;
        uint64_t v34 = v51;
        v51(v39, v10);
        unsigned int v40 = v66;
        uint64_t v26 = v52;
        (*(void (**)(char *, char *, uint64_t))(v62 + 32))(v52, v33, v10);
        if ((v38 & 1) == 0)
        {
LABEL_14:
          v34(v26, v10);
          uint64_t v32 = v65;
          char v27 = v34;
          goto LABEL_15;
        }
        unsigned __int8 v41 = sub_25E669820();
        v34(v26, v10);
        uint64_t v32 = v65;
        char v27 = v34;
        if (v40 < v41)
        {
LABEL_13:
          __break(1u);
          goto LABEL_14;
        }
LABEL_15:
        uint64_t v49 = sub_25E669820();
        v27(v32, v10);
        v27(v61, v10);
        v27(v60, v10);
        return v49;
      }
    }
    else if (v36 < 9)
    {
      unsigned __int8 v47 = sub_25E669820();
      uint64_t v48 = v33;
      char v27 = v51;
      v51(v48, v10);
      uint64_t v32 = v65;
      if (v66 < v47) {
        goto LABEL_13;
      }
      goto LABEL_15;
    }
    sub_25E652AC8();
    int v42 = v55;
    sub_25E6697D0();
    swift_getAssociatedConformanceWitness();
    char v43 = sub_25E6695C0();
    uint64_t v44 = v42;
    uint64_t v45 = v51;
    v51(v44, v10);
    char v46 = v33;
    char v27 = v45;
    v45(v46, v10);
    uint64_t v32 = v65;
    if (v43) {
      goto LABEL_13;
    }
    goto LABEL_15;
  }
  __break(1u);
  return result;
}

uint64_t sub_25E658290(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for IntegerBytesCollection.Index();
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270F9E068](a1, a2, a3, a4, WitnessTable);
}

uint64_t sub_25E658324(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for IntegerBytesCollection.Index();
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270F9E078](a1, a2, a3, a4, WitnessTable);
}

uint64_t sub_25E6583AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25E658828(a1, a2, a3, MEMORY[0x263F8D7A8]);
}

void *sub_25E6583C4(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_25E6588F4(a1, a2, a3, MEMORY[0x263F8D7A8]);
}

uint64_t sub_25E6583E0()
{
  swift_getWitnessTable();

  return sub_25E6696A0();
}

void sub_25E65846C(void *a1@<X8>)
{
}

void (*sub_25E658484(void *a1, uint64_t *a2, uint64_t a3))(void *a1)
{
  uint64_t v6 = malloc(0x30uLL);
  *a1 = v6;
  uint64_t v7 = sub_25E658544((uint64_t)v6, a2, a3);
  v6[40] = v8;
  *((void *)v6 + 4) = v7;
  return sub_25E6584FC;
}

void sub_25E6584FC(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

uint64_t (*sub_25E658544(uint64_t a1, uint64_t *a2, uint64_t a3))()
{
  return nullsub_1;
}

uint64_t sub_25E658590(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  type metadata accessor for IntegerBytesCollection.Index();
  uint64_t v3 = swift_getWitnessTable();

  return MEMORY[0x270F9E070](a1, WitnessTable, v3);
}

void sub_25E65862C(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(_WORD *)(a1 + 8) = 256;
}

uint64_t sub_25E65863C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  type metadata accessor for IntegerBytesCollection.Index();
  uint64_t v7 = swift_getWitnessTable();

  return MEMORY[0x270F9E068](a1, a2, a3, WitnessTable, v7);
}

uint64_t sub_25E6586E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  type metadata accessor for IntegerBytesCollection.Index();
  uint64_t v7 = swift_getWitnessTable();

  return MEMORY[0x270F9E078](a1, a2, a3, WitnessTable, v7);
}

uint64_t sub_25E65878C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25E65A1E0(a1, a2, a3, a4, MEMORY[0x263F8D870], MEMORY[0x263F8D170]);
}

uint64_t sub_25E6587CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25E65A1E0(a1, a2, a3, a4, MEMORY[0x263F8D1A0], MEMORY[0x263F8D180]);
}

uint64_t sub_25E658810(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25E658828(a1, a2, a3, MEMORY[0x263F8D7A0]);
}

uint64_t sub_25E658828(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t WitnessTable = swift_getWitnessTable();
  type metadata accessor for IntegerBytesCollection.Index();
  uint64_t v7 = swift_getWitnessTable();

  return a4(a1, a2, WitnessTable, v7);
}

void *sub_25E6588DC(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_25E6588F4(a1, a2, a3, MEMORY[0x263F8D7A0]);
}

void *sub_25E6588F4(void *a1, uint64_t a2, uint64_t a3, void *(*a4)(uint64_t *__return_ptr, void *, uint64_t, uint64_t, uint64_t))
{
  uint64_t WitnessTable = swift_getWitnessTable();
  type metadata accessor for IntegerBytesCollection.Index();
  uint64_t v8 = swift_getWitnessTable();
  uint64_t result = a4(&v10, a1, a2, WitnessTable, v8);
  *a1 = v10;
  return result;
}

uint64_t sub_25E65899C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(a1 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(a2, v2, a1);
  IntegerBytesCollection.startIndex.getter(&v7);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v2, a1);
  swift_getWitnessTable();
  uint64_t result = sub_25E669900();
  *(void *)(a2 + *(int *)(result + 36)) = v7;
  return result;
}

uint64_t sub_25E658A8C(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270F9E108](a1, WitnessTable);
}

uint64_t sub_25E658AE0(uint64_t a1)
{
  swift_getWitnessTable();
  uint64_t v3 = sub_25E65BB84();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a1 - 8) + 8))(v1, a1);
  return v3;
}

uint64_t IntegerBytesCollection.Index.hash(into:)()
{
  return sub_25E6699D0();
}

uint64_t IntegerBytesCollection.Index.hashValue.getter()
{
  return sub_25E669A00();
}

uint64_t sub_25E658BEC()
{
  return sub_25E669A00();
}

uint64_t sub_25E658C28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270F9E580](a1, a2, a3, WitnessTable);
}

BOOL static IntegerBytesCollection.Index.< infix(_:_:)(void *a1, void *a2)
{
  return *a2 < *a1;
}

BOOL static IntegerBytesCollection.Index.> infix(_:_:)(void *a1, void *a2)
{
  return *a1 < *a2;
}

BOOL static IntegerBytesCollection.Index.<= infix(_:_:)(void *a1, void *a2)
{
  return *a1 >= *a2;
}

BOOL static IntegerBytesCollection.Index.>= infix(_:_:)(void *a1, void *a2)
{
  return *a2 >= *a1;
}

uint64_t IntegerBytesCollection.Index.advanced(by:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  if (__OFSUB__(*v2, result)) {
    __break(1u);
  }
  else {
    *a2 = *v2 - result;
  }
  return result;
}

uint64_t IntegerBytesCollection.Index.distance(to:)(void *a1)
{
  BOOL v2 = __OFSUB__(*v1, *a1);
  uint64_t result = *v1 - *a1;
  if (v2) {
    __break(1u);
  }
  return result;
}

uint64_t sub_25E658D24@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = IntegerBytesCollection.Index.distance(to:)(a1);
  *a2 = result;
  return result;
}

uint64_t sub_25E658D4C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return IntegerBytesCollection.Index.advanced(by:)(*a1, a2);
}

uint64_t sub_25E658D54()
{
  return sub_25E6697C0();
}

uint64_t sub_25E658D74()
{
  return 1;
}

uint64_t sub_25E658D7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, unsigned char *a5@<X8>)
{
  sub_25E65A450(a1, a2, a3, a4);
  char v8 = v7;
  uint64_t result = swift_unknownObjectRelease();
  if (!v5) {
    *a5 = v8;
  }
  return result;
}

uint64_t sub_25E658DC8(void (*a1)(char *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return ASN1IntegerRepresentable<>.withBigEndianIntegerBytes<A>(_:)(a1, a2, a4);
}

uint64_t sub_25E658E28@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  return sub_25E658F78(a1, a2, (uint64_t (*)(_OWORD *, void, void))sub_25E653C3C, a3);
}

uint64_t sub_25E658E54(char **a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  char v8 = *v2;
  uint64_t v6 = v3;
  char v7 = v4;
  return sub_25E6504FC(&v6, 0, a1, (uint64_t (*)(char **))sub_25E65BB14);
}

uint64_t sub_25E658EB8()
{
  return 0;
}

void sub_25E658EC0(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, unsigned char *a5@<X8>)
{
  sub_25E6536F8(a1, a2, a3, a4);
  if (!v5) {
    *a5 = v7;
  }
}

uint64_t sub_25E658EEC(void (*a1)(char *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return ASN1IntegerRepresentable<>.withBigEndianIntegerBytes<A>(_:)(a1, a2, a4);
}

uint64_t sub_25E658F4C@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  return sub_25E658F78(a1, a2, (uint64_t (*)(_OWORD *, void, void))sub_25E6545AC, a3);
}

uint64_t sub_25E658F78@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(_OWORD *, void, void)@<X4>, unsigned char *a4@<X8>)
{
  long long v6 = a1[3];
  v10[2] = a1[2];
  v10[3] = v6;
  long long v7 = a1[5];
  v10[4] = a1[4];
  v10[5] = v7;
  long long v8 = a1[1];
  v10[0] = *a1;
  v10[1] = v8;
  uint64_t result = a3(v10, *(void *)a2, *(unsigned __int8 *)(a2 + 8));
  if (!v4) {
    *a4 = result;
  }
  return result;
}

uint64_t sub_25E658FD8(char **a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  char v8 = *v2;
  uint64_t v6 = v3;
  char v7 = v4;
  return sub_25E6504FC(&v6, 0, a1, sub_25E65BAA4);
}

uint64_t sub_25E65903C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, _WORD *a5@<X8>)
{
  sub_25E65A4A8(a1, a2, a3, a4);
  __int16 v8 = v7;
  uint64_t result = swift_unknownObjectRelease();
  if (!v5) {
    *a5 = v8;
  }
  return result;
}

uint64_t sub_25E659088(void (*a1)(char *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return ASN1IntegerRepresentable<>.withBigEndianIntegerBytes<A>(_:)(a1, a2, a4);
}

uint64_t sub_25E6590E8@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, _WORD *a3@<X8>)
{
  return sub_25E659230(a1, a2, (uint64_t (*)(_OWORD *, void, void))sub_25E653E98, a3);
}

uint64_t sub_25E659114(char **a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  __int16 v8 = *v2;
  uint64_t v6 = v3;
  char v7 = v4;
  return sub_25E6504FC(&v6, 0, a1, (uint64_t (*)(char **))sub_25E65BA34);
}

void sub_25E659178(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, _WORD *a5@<X8>)
{
  sub_25E653230(a1, a2, a3, a4);
  if (!v5) {
    *a5 = v7;
  }
}

uint64_t sub_25E6591A4(void (*a1)(char *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return ASN1IntegerRepresentable<>.withBigEndianIntegerBytes<A>(_:)(a1, a2, a4);
}

uint64_t sub_25E659204@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, _WORD *a3@<X8>)
{
  return sub_25E659230(a1, a2, (uint64_t (*)(_OWORD *, void, void))sub_25E654854, a3);
}

uint64_t sub_25E659230@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(_OWORD *, void, void)@<X4>, _WORD *a4@<X8>)
{
  long long v6 = a1[3];
  v10[2] = a1[2];
  v10[3] = v6;
  long long v7 = a1[5];
  v10[4] = a1[4];
  v10[5] = v7;
  long long v8 = a1[1];
  v10[0] = *a1;
  v10[1] = v8;
  uint64_t result = a3(v10, *(void *)a2, *(unsigned __int8 *)(a2 + 8));
  if (!v4) {
    *a4 = result;
  }
  return result;
}

uint64_t sub_25E659290(char **a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  __int16 v8 = *v2;
  uint64_t v6 = v3;
  char v7 = v4;
  return sub_25E6504FC(&v6, 0, a1, sub_25E65B9C4);
}

uint64_t sub_25E6592F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, _DWORD *a5@<X8>)
{
  sub_25E65A5D4(a1, a2, a3, a4);
  int v8 = v7;
  uint64_t result = swift_unknownObjectRelease();
  if (!v5) {
    *a5 = v8;
  }
  return result;
}

uint64_t sub_25E659340(void (*a1)(char *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return ASN1IntegerRepresentable<>.withBigEndianIntegerBytes<A>(_:)(a1, a2, a4);
}

uint64_t sub_25E6593A0@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X8>)
{
  return sub_25E6594E8(a1, a2, (uint64_t (*)(_OWORD *, void, void))sub_25E6540F4, a3);
}

uint64_t sub_25E6593CC(char **a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  int v8 = *v2;
  uint64_t v6 = v3;
  char v7 = v4;
  return sub_25E6504FC(&v6, 0, a1, (uint64_t (*)(char **))sub_25E65B954);
}

void sub_25E659430(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, _DWORD *a5@<X8>)
{
  sub_25E6533C8(a1, a2, a3, a4);
  if (!v5) {
    *a5 = v7;
  }
}

uint64_t sub_25E65945C(void (*a1)(char *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return ASN1IntegerRepresentable<>.withBigEndianIntegerBytes<A>(_:)(a1, a2, a4);
}

uint64_t sub_25E6594BC@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X8>)
{
  return sub_25E6594E8(a1, a2, (uint64_t (*)(_OWORD *, void, void))sub_25E654AFC, a3);
}

uint64_t sub_25E6594E8@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(_OWORD *, void, void)@<X4>, _DWORD *a4@<X8>)
{
  long long v6 = a1[3];
  v10[2] = a1[2];
  v10[3] = v6;
  long long v7 = a1[5];
  v10[4] = a1[4];
  v10[5] = v7;
  long long v8 = a1[1];
  v10[0] = *a1;
  v10[1] = v8;
  uint64_t result = a3(v10, *(void *)a2, *(unsigned __int8 *)(a2 + 8));
  if (!v4) {
    *a4 = result;
  }
  return result;
}

uint64_t sub_25E659548(char **a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  int v8 = *v2;
  uint64_t v6 = v3;
  char v7 = v4;
  return sub_25E6504FC(&v6, 0, a1, sub_25E65B8E4);
}

uint64_t sub_25E6595AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, void *a5@<X8>)
{
  return sub_25E659814(a1, a2, a3, a4, a5);
}

uint64_t sub_25E6595C4(void (*a1)(char *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return ASN1IntegerRepresentable<>.withBigEndianIntegerBytes<A>(_:)(a1, a2, a4);
}

uint64_t sub_25E659624@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_25E6598D0(a1, a2, a3);
}

uint64_t sub_25E65963C(char **a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  uint64_t v8 = *v2;
  uint64_t v6 = v3;
  char v7 = v4;
  return sub_25E6504FC(&v6, 0, a1, (uint64_t (*)(char **))sub_25E65B7CC);
}

uint64_t sub_25E65969C@<X0>(uint64_t *a1@<X8>)
{
  return sub_25E659958((uint64_t (*)(void))sub_25E653560, a1);
}

uint64_t sub_25E6596C8(void (*a1)(char *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return ASN1IntegerRepresentable<>.withBigEndianIntegerBytes<A>(_:)(a1, a2, a4);
}

uint64_t sub_25E659728@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_25E659754(a1, a2, (uint64_t (*)(uint64_t, uint64_t, unint64_t, unint64_t))sub_25E653560, a3);
}

uint64_t sub_25E659754@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, unint64_t, unint64_t)@<X4>, uint64_t *a4@<X8>)
{
  long long v6 = a1[3];
  v10[2] = a1[2];
  v10[3] = v6;
  long long v7 = a1[5];
  v10[4] = a1[4];
  v10[5] = v7;
  long long v8 = a1[1];
  v10[0] = *a1;
  v10[1] = v8;
  uint64_t result = sub_25E654DD0((uint64_t)v10, *(void *)a2, *(unsigned char *)(a2 + 8), a3);
  if (!v4) {
    *a4 = result;
  }
  return result;
}

uint64_t sub_25E6597B4(char **a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  uint64_t v8 = *v2;
  uint64_t v6 = v3;
  char v7 = v4;
  return sub_25E6504FC(&v6, 0, a1, sub_25E65B75C);
}

uint64_t sub_25E659814@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, void *a5@<X8>)
{
  sub_25E65A708(a1, a2, a3, a4);
  uint64_t v8 = v7;
  uint64_t result = swift_unknownObjectRelease();
  if (!v5) {
    *a5 = v8;
  }
  return result;
}

uint64_t sub_25E659860(void (*a1)(char *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return ASN1IntegerRepresentable<>.withBigEndianIntegerBytes<A>(_:)(a1, a2, a4);
}

void sub_25E6598C0(uint64_t a1@<X8>)
{
  *(void *)a1 = 2;
  *(unsigned char *)(a1 + 8) = 0;
}

uint64_t sub_25E6598D0@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  long long v5 = a1[3];
  uint64_t v9[2] = a1[2];
  v9[3] = v5;
  long long v6 = a1[5];
  v9[4] = a1[4];
  v9[5] = v6;
  long long v7 = a1[1];
  v9[0] = *a1;
  v9[1] = v7;
  uint64_t result = sub_25E654350((uint64_t)v9, *(void *)a2, *(unsigned char *)(a2 + 8));
  if (!v3) {
    *a3 = result;
  }
  return result;
}

uint64_t sub_25E65992C@<X0>(uint64_t *a1@<X8>)
{
  return sub_25E659958((uint64_t (*)(void))sub_25E652EEC, a1);
}

uint64_t sub_25E659958@<X0>(uint64_t (*a1)(void)@<X6>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_25E659988(void (*a1)(char *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return ASN1IntegerRepresentable<>.withBigEndianIntegerBytes<A>(_:)(a1, a2, a4);
}

uint64_t sub_25E6599E8@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_25E659754(a1, a2, (uint64_t (*)(uint64_t, uint64_t, unint64_t, unint64_t))sub_25E652EEC, a3);
}

uint64_t sub_25E659A18@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  long long v5 = a1[3];
  v12[2] = a1[2];
  long long v12[3] = v5;
  long long v6 = a1[5];
  v12[4] = a1[4];
  v12[5] = v6;
  long long v7 = a1[1];
  v12[0] = *a1;
  v12[1] = v7;
  uint64_t result = sub_25E6539A4((uint64_t)v12, *(void *)a2, *(unsigned char *)(a2 + 8));
  if (!v3)
  {
    *a3 = result;
    a3[1] = v9;
    a3[2] = v10;
    a3[3] = v11;
  }
  return result;
}

uint64_t sub_25E659A78(char **a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  long long v5 = v2[1];
  long long v9 = *v2;
  long long v10 = v5;
  uint64_t v7 = v3;
  char v8 = v4;
  return sub_25E6504FC(&v7, 0, a1, sub_25E65B734);
}

char *sub_25E659ADC(char *result)
{
  uint64_t v3 = *((void *)result + 2);
  unint64_t v2 = *((void *)result + 3);
  int64_t v4 = v2 >> 1;
  long long v5 = (char *)MEMORY[0x263F8EE78];
  if (v3 != v2 >> 1)
  {
    uint64_t v36 = *(void *)result;
    uint64_t v38 = *((void *)result + 1);
    uint64_t result = (char *)sub_25E64ED30((uint64_t)result);
    if (v3 >= v4)
    {
LABEL_50:
      __break(1u);
LABEL_51:
      uint64_t result = (char *)swift_unknownObjectRelease();
      goto LABEL_52;
    }
    uint64_t v1 = 0;
    uint64_t v34 = v2 & 1;
    uint64_t v35 = v38 + 112;
    uint64_t v6 = (uint64_t)(v5 + 32);
    while (1)
    {
      if (v4 <= v3)
      {
LABEL_59:
        __break(1u);
LABEL_60:
        __break(1u);
LABEL_61:
        __break(1u);
LABEL_62:
        __break(1u);
LABEL_63:
        __break(1u);
LABEL_64:
        __break(1u);
LABEL_65:
        __break(1u);
LABEL_66:
        __break(1u);
LABEL_67:
        __break(1u);
LABEL_68:
        __break(1u);
LABEL_69:
        __break(1u);
LABEL_70:
        __break(1u);
LABEL_71:
        __break(1u);
LABEL_72:
        __break(1u);
LABEL_73:
        __break(1u);
        return result;
      }
      uint64_t v7 = (uint64_t *)(v38 + 96 * v3);
      uint64_t v8 = *v7;
      char v9 = *((unsigned char *)v7 + 24);
      uint64_t v10 = v3 + 1;
      long long v43 = *((_OWORD *)v7 + 3);
      long long v44 = *((_OWORD *)v7 + 2);
      char v42 = *((unsigned char *)v7 + 8);
      if (v9)
      {
        uint64_t v11 = v7[2];
        uint64_t v12 = v4;
        if (v10 != v4)
        {
          uint64_t v13 = (void *)(v35 + 96 * v3);
          uint64_t v12 = v3 + 1;
          do
          {
            if (v12 >= v4)
            {
LABEL_57:
              __break(1u);
LABEL_58:
              __break(1u);
              goto LABEL_59;
            }
            if (v11 >= *v13) {
              goto LABEL_14;
            }
            uint64_t v14 = v12 + 1;
            if (__OFADD__(v12, 1)) {
              goto LABEL_58;
            }
            ++v12;
            v13 += 12;
          }
          while (v14 != v4);
          uint64_t v12 = v4;
LABEL_14:
          if (v12 <= v3) {
            goto LABEL_61;
          }
          if (v12 < 0) {
            goto LABEL_62;
          }
        }
        uint64_t v15 = v12 - v10;
        if (__OFSUB__(v12, v10)) {
          goto LABEL_63;
        }
        if (v15 < 0) {
          goto LABEL_64;
        }
        uint64_t v16 = v4 - v10;
        if (__OFSUB__(v4, v10)) {
          goto LABEL_65;
        }
        int64_t v37 = v5;
        if (!v15 || v16 < 0 || (uint64_t v17 = v4, v16 >= v15))
        {
          uint64_t v17 = v12;
          if (__OFADD__(v10, v15)) {
            goto LABEL_69;
          }
          if (v4 < v12) {
            goto LABEL_66;
          }
        }
        if (v17 <= v3) {
          goto LABEL_67;
        }
        if (v10 != v12)
        {
          if (v10 >= v12) {
            goto LABEL_70;
          }
          uint64_t v18 = (uint64_t *)(v35 + 96 * v3);
          do
          {
            uint64_t v19 = *v18;
            v18 += 12;
            if (v11 >= v19)
            {
              __break(1u);
              goto LABEL_57;
            }
            --v15;
          }
          while (v15);
          if (*(void *)(v38 + 96 * v10 + 16) != v11 + 1) {
            goto LABEL_71;
          }
        }
        uint64_t v41 = v34 | (2 * v12);
        uint64_t v20 = v36;
        uint64_t result = (char *)swift_unknownObjectRetain();
        uint64_t v39 = v3 + 1;
        uint64_t v40 = v38;
        uint64_t v3 = v17;
        long long v5 = v37;
        if (v1)
        {
LABEL_43:
          uint64_t result = (char *)swift_unknownObjectRetain();
          BOOL v30 = __OFSUB__(v1--, 1);
          if (v30) {
            goto LABEL_60;
          }
          goto LABEL_48;
        }
      }
      else
      {
        uint64_t v20 = v7[8];
        if (!v20) {
          goto LABEL_73;
        }
        uint64_t v39 = v7[10];
        uint64_t v40 = v7[9];
        uint64_t v41 = v7[11];
        uint64_t result = (char *)swift_unknownObjectRetain();
        uint64_t v11 = 0;
        ++v3;
        if (v1) {
          goto LABEL_43;
        }
      }
      unint64_t v21 = *((void *)v5 + 3);
      if ((uint64_t)((v21 >> 1) + 0x4000000000000000) < 0) {
        goto LABEL_68;
      }
      int64_t v22 = v21 & 0xFFFFFFFFFFFFFFFELL;
      if (v22 <= 1) {
        uint64_t v23 = 1;
      }
      else {
        uint64_t v23 = v22;
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A6FE6A0);
      unint64_t v24 = (char *)swift_allocObject();
      uint64_t v25 = (uint64_t)(_swift_stdlib_malloc_size(v24) - 32) / 96;
      *((void *)v24 + 2) = v23;
      *((void *)v24 + 3) = 2 * v25;
      uint64_t v26 = v24 + 32;
      uint64_t v27 = *((void *)v5 + 3) >> 1;
      uint64_t v6 = (uint64_t)&v24[96 * v27 + 32];
      uint64_t v28 = (v25 & 0x7FFFFFFFFFFFFFFFLL) - v27;
      if (*((void *)v5 + 2))
      {
        uint64_t v29 = v5 + 32;
        if (v24 != v5 || v26 >= &v29[96 * v27]) {
          memmove(v26, v29, 96 * v27);
        }
        swift_unknownObjectRetain();
        *((void *)v5 + 2) = 0;
      }
      else
      {
        swift_unknownObjectRetain();
      }
      uint64_t result = (char *)swift_release();
      long long v5 = v24;
      BOOL v30 = __OFSUB__(v28, 1);
      uint64_t v1 = v28 - 1;
      if (v30) {
        goto LABEL_60;
      }
LABEL_48:
      *(void *)uint64_t v6 = v8;
      *(unsigned char *)(v6 + 8) = v42;
      *(void *)(v6 + 16) = v20;
      *(void *)(v6 + 24) = v40;
      *(void *)(v6 + 32) = v39;
      *(void *)(v6 + 40) = v41;
      *(void *)(v6 + 48) = v11;
      *(unsigned char *)(v6 + 56) = v9 ^ 1;
      *(_OWORD *)(v6 + 64) = v44;
      *(_OWORD *)(v6 + 80) = v43;
      if (v3 == v4) {
        goto LABEL_51;
      }
      v6 += 96;
      if (v3 >= v4) {
        goto LABEL_50;
      }
    }
  }
  uint64_t v1 = 0;
LABEL_52:
  unint64_t v31 = *((void *)v5 + 3);
  if (v31 >= 2)
  {
    unint64_t v32 = v31 >> 1;
    BOOL v30 = __OFSUB__(v32, v1);
    uint64_t v33 = v32 - v1;
    if (v30) {
      goto LABEL_72;
    }
    *((void *)v5 + 2) = v33;
  }
  return v5;
}

uint64_t sub_25E659EA0(uint64_t result, int64_t a2, uint64_t a3)
{
  uint64_t v5 = result;
  uint64_t v6 = 0;
  uint64_t v7 = 32;
  int64_t v8 = result;
  while (1)
  {
    BOOL v9 = v8 <= a2;
    if (a3 > 0) {
      BOOL v9 = v8 >= a2;
    }
    if (v9) {
      break;
    }
    BOOL v10 = __OFADD__(v8, a3);
    v8 += a3;
    if (v10) {
      int64_t v8 = (v8 >> 63) ^ 0x8000000000000000;
    }
    v7 += 8;
    BOOL v10 = __OFADD__(v6++, 1);
    if (v10)
    {
      __break(1u);
      break;
    }
  }
  if (v6 > 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B38DC88);
    uint64_t v11 = (int64_t *)swift_allocObject();
    uint64_t result = _swift_stdlib_malloc_size(v11);
    uint64_t v12 = result - 32;
    if (result < 32) {
      uint64_t v12 = result - 25;
    }
    uint64_t v13 = v12 >> 3;
    v11[2] = v6;
    unint64_t v11[3] = 2 * v13;
    uint64_t v14 = v11 + 4;
    uint64_t v15 = v13 & 0x7FFFFFFFFFFFFFFFLL;
LABEL_15:
    v15 -= v6;
    while (1)
    {
      BOOL v16 = v5 <= a2;
      if (a3 > 0) {
        BOOL v16 = v5 >= a2;
      }
      if (v16) {
        break;
      }
      if (__OFADD__(v5, a3)) {
        int64_t v17 = ((v5 + a3) >> 63) ^ 0x8000000000000000;
      }
      else {
        int64_t v17 = v5 + a3;
      }
      *v14++ = v5;
      uint64_t v5 = v17;
      if (!--v6) {
        goto LABEL_23;
      }
    }
    __break(1u);
LABEL_57:
    __break(1u);
LABEL_58:
    __break(1u);
    goto LABEL_59;
  }
  uint64_t v11 = (int64_t *)MEMORY[0x263F8EE78];
  uint64_t v14 = (int64_t *)(MEMORY[0x263F8EE78] + 32);
  uint64_t v15 = *(void *)(MEMORY[0x263F8EE78] + 24) >> 1;
  if (v6) {
    goto LABEL_15;
  }
  int64_t v17 = result;
LABEL_23:
  BOOL v18 = v17 <= a2;
  if (a3 > 0) {
    BOOL v18 = v17 >= a2;
  }
  if (!v18)
  {
    uint64_t v19 = (a3 >> 63) ^ 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      int64_t v20 = v17 + a3;
      if (__OFADD__(v17, a3))
      {
        int64_t v20 = v19;
        if (!v15) {
          goto LABEL_32;
        }
        int64_t v20 = v19;
      }
      else if (!v15)
      {
LABEL_32:
        unint64_t v21 = v11[3];
        if ((uint64_t)((v21 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_58;
        }
        int64_t v22 = v21 & 0xFFFFFFFFFFFFFFFELL;
        if (v22 <= 1) {
          uint64_t v23 = 1;
        }
        else {
          uint64_t v23 = v22;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_26B38DC88);
        unint64_t v24 = (int64_t *)swift_allocObject();
        int64_t v25 = _swift_stdlib_malloc_size(v24);
        uint64_t v26 = v25 - 32;
        if (v25 < 32) {
          uint64_t v26 = v25 - 25;
        }
        uint64_t v27 = v26 >> 3;
        v24[2] = v23;
        v24[3] = 2 * (v26 >> 3);
        unint64_t v28 = (unint64_t)(v24 + 4);
        unint64_t v29 = (unint64_t)v11[3] >> 1;
        if (v11[2])
        {
          if (v24 != v11 || v28 >= (unint64_t)&v11[v29 + 4]) {
            memmove(v24 + 4, v11 + 4, 8 * v29);
          }
          v11[2] = 0;
        }
        uint64_t v14 = (int64_t *)(v28 + 8 * v29);
        uint64_t v15 = (v27 & 0x7FFFFFFFFFFFFFFFLL) - v29;
        uint64_t result = swift_release();
        uint64_t v11 = v24;
        uint64_t v19 = (a3 >> 63) ^ 0x7FFFFFFFFFFFFFFFLL;
      }
      BOOL v10 = __OFSUB__(v15--, 1);
      if (v10) {
        goto LABEL_57;
      }
      *v14++ = v17;
      BOOL v31 = v20 <= a2;
      if (a3 > 0) {
        BOOL v31 = v20 >= a2;
      }
      int64_t v17 = v20;
    }
    while (!v31);
  }
  unint64_t v32 = v11[3];
  if (v32 < 2) {
    return (uint64_t)v11;
  }
  unint64_t v33 = v32 >> 1;
  BOOL v10 = __OFSUB__(v33, v15);
  unint64_t v34 = v33 - v15;
  if (!v10)
  {
    v11[2] = v34;
    return (uint64_t)v11;
  }
LABEL_59:
  __break(1u);
  return result;
}

char *sub_25E65A124(uint64_t a1)
{
  return sub_25E64ED5C(0, *(void *)(a1 + 16), 0, (char *)a1);
}

char *sub_25E65A138(uint64_t a1)
{
  return sub_25E64EE6C(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_25E65A14C(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + 24);
  _OWORD v4[2] = *(void *)(v1 + 16);
  v4[3] = v2;
  v4[4] = a1;
  return (*(uint64_t (**)(uint64_t (*)(uint64_t), void *, uint64_t))(v2 + 48))(sub_25E65BB88, v4, MEMORY[0x263F8EE60] + 8);
}

uint64_t sub_25E65A1B8(char **a1, uint64_t a2)
{
  return sub_25E655518(*(void *)a2, *(void *)(a2 + 8), *(void *)(a2 + 16), *(void *)(a2 + 24), a1);
}

uint64_t sub_25E65A1E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void, uint64_t, uint64_t), uint64_t (*a6)(char *, char *, uint64_t, uint64_t))
{
  uint64_t v23 = a6;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v11 = a5(0, AssociatedTypeWitness, AssociatedConformanceWitness);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v22 - v14;
  uint64_t v16 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](v13);
  BOOL v18 = (char *)&v22 - v17;
  char v19 = sub_25E6695E0();
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, a1, AssociatedTypeWitness);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, a2, v11);
  if ((v19 & 1) == 0)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, AssociatedTypeWitness);
    goto LABEL_5;
  }
  char v20 = v23(v18, &v15[*(int *)(v11 + 36)], AssociatedTypeWitness, AssociatedConformanceWitness);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, AssociatedTypeWitness);
  if ((v20 & 1) == 0) {
LABEL_5:
  }
    __break(1u);
  return result;
}

void sub_25E65A450(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = swift_unknownObjectRetain();
  sub_25E653084(v8, a2, a3, a4);
  if (!v4 && (uint64_t)(a4 >> 1) < a3) {
    __break(1u);
  }
}

void sub_25E65A4A8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = swift_unknownObjectRetain();
  sub_25E653230(v8, a2, a3, a4);
  if (!v4 && a4 >> 1 != a3 && (uint64_t)(a4 >> 1) <= a3) {
    __break(1u);
  }
}

void sub_25E65A5D4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = swift_unknownObjectRetain();
  sub_25E6533C8(v8, a2, a3, a4);
  if (!v4 && a4 >> 1 != a3 && (uint64_t)(a4 >> 1) <= a3) {
    __break(1u);
  }
}

void sub_25E65A708(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = swift_unknownObjectRetain();
  sub_25E653560(v8, a2, a3, a4);
  if (!v4 && a4 >> 1 != a3 && (uint64_t)(a4 >> 1) <= a3) {
    __break(1u);
  }
}

uint64_t sub_25E65A890(uint64_t a1, uint64_t a2)
{
  swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v5 = sub_25E669780();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  BOOL v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)v17 - v10;
  v17[1] = AssociatedConformanceWitness;
  LOBYTE(AssociatedConformanceWitness) = sub_25E6695E0();
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v12(v11, a1, v5);
  v12(v9, a2, v5);
  if ((AssociatedConformanceWitness & 1) == 0)
  {
    uint64_t v16 = *(void (**)(char *, uint64_t))(v6 + 8);
    v16(v9, v5);
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v16)(v11, v5);
    goto LABEL_5;
  }
  char v13 = sub_25E6695E0();
  uint64_t v14 = *(void (**)(char *, uint64_t))(v6 + 8);
  v14(v9, v5);
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v14)(v11, v5);
  if ((v13 & 1) == 0) {
LABEL_5:
  }
    __break(1u);
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

uint64_t type metadata accessor for IntegerBytesCollection()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for IntegerBytesCollection.Index()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_25E65AB14()
{
  return swift_getWitnessTable();
}

uint64_t sub_25E65AB30()
{
  return swift_getWitnessTable();
}

uint64_t sub_25E65AB4C()
{
  return sub_25E65AD04();
}

unint64_t sub_25E65AB64()
{
  unint64_t result = qword_26A6FE4A8;
  if (!qword_26A6FE4A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6FE4A8);
  }
  return result;
}

uint64_t sub_25E65ABB8()
{
  return swift_getWitnessTable();
}

uint64_t sub_25E65AC1C()
{
  return swift_getWitnessTable();
}

uint64_t sub_25E65AC38()
{
  return sub_25E65AD04();
}

uint64_t sub_25E65AC50()
{
  return swift_getWitnessTable();
}

uint64_t sub_25E65ACB4()
{
  return swift_getWitnessTable();
}

uint64_t sub_25E65ACD0()
{
  return swift_getWitnessTable();
}

uint64_t sub_25E65ACEC()
{
  return sub_25E65AD04();
}

uint64_t sub_25E65AD04()
{
  return swift_getWitnessTable();
}

uint64_t sub_25E65AD70()
{
  return swift_getWitnessTable();
}

uint64_t sub_25E65AD8C()
{
  return swift_getWitnessTable();
}

uint64_t sub_25E65ADA8()
{
  return swift_getWitnessTable();
}

uint64_t sub_25E65ADC4()
{
  return MEMORY[0x263F8D6E0];
}

uint64_t sub_25E65ADD0()
{
  return MEMORY[0x263F8D720];
}

uint64_t sub_25E65ADDC()
{
  return sub_25E65B034(&qword_26A6FE4B0, &qword_26A6FE4B8);
}

uint64_t sub_25E65AE18()
{
  return sub_25E65B034(&qword_26A6FE4C0, &qword_26A6FE4C8);
}

uint64_t sub_25E65AE54()
{
  return sub_25E65B034(&qword_26A6FE4D0, &qword_26A6FE4D8);
}

uint64_t sub_25E65AE90()
{
  return sub_25E65B034(&qword_26A6FE4E0, &qword_26A6FE4E8);
}

uint64_t sub_25E65AECC()
{
  return sub_25E65B034(&qword_26A6FE4F0, &qword_26A6FE4F8);
}

uint64_t sub_25E65AF08()
{
  return sub_25E65B034(&qword_26A6FE500, &qword_26A6FE508);
}

uint64_t sub_25E65AF44()
{
  return sub_25E65B034(&qword_26A6FE510, &qword_26A6FE518);
}

uint64_t sub_25E65AF80()
{
  return sub_25E65B034(&qword_26A6FE520, &qword_26A6FE528);
}

uint64_t sub_25E65AFBC()
{
  return sub_25E65B034(&qword_26A6FE530, &qword_26A6FE538);
}

uint64_t sub_25E65AFF8()
{
  return sub_25E65B034(&qword_26A6FE540, qword_26A6FE548);
}

uint64_t sub_25E65B034(unint64_t *a1, uint64_t *a2)
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

uint64_t dispatch thunk of static ASN1IntegerRepresentable.isSigned.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of ASN1IntegerRepresentable.init(derIntegerBytes:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 40))();
}

uint64_t dispatch thunk of ASN1IntegerRepresentable.withBigEndianIntegerBytes<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 48))();
}

uint64_t sub_25E65B0DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t sub_25E65B0E4()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_25E65B174(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
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
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v8 + ((v5 + 16) & ~v5));
    swift_retain();
  }
  return v3;
}

uint64_t sub_25E65B22C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
}

uint64_t sub_25E65B258(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_25E65B2A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_25E65B2F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_25E65B348(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_25E65B398(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
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

void sub_25E65B4F4(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
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
      JUMPOUT(0x25E65B70CLL);
    case 4:
      *(_DWORD *)&a1[v8] = 0;
      goto LABEL_20;
    default:
LABEL_20:
      if (a2)
      {
LABEL_21:
        uint64_t v16 = *(void (**)(void))(v6 + 56);
        v16();
      }
      return;
  }
}

uint64_t sub_25E65B734(char **a1)
{
  return sub_25E655518(**(void **)(v1 + 16), *(void *)(*(void *)(v1 + 16) + 8), *(void *)(*(void *)(v1 + 16) + 16), *(void *)(*(void *)(v1 + 16) + 24), a1);
}

uint64_t sub_25E65B75C(char **a1)
{
  return sub_25E64F1A8(a1, *(unint64_t **)(v1 + 16));
}

unint64_t sub_25E65B778()
{
  unint64_t result = qword_26A6FE650;
  if (!qword_26A6FE650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6FE650);
  }
  return result;
}

uint64_t sub_25E65B7CC(uint64_t *a1)
{
  return sub_25E64F184(a1, *(int64_t **)(v1 + 16));
}

unint64_t sub_25E65B7E8()
{
  unint64_t result = qword_26A6FE658;
  if (!qword_26A6FE658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6FE658);
  }
  return result;
}

unint64_t sub_25E65B83C()
{
  unint64_t result = qword_26A6FE660;
  if (!qword_26A6FE660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6FE660);
  }
  return result;
}

unint64_t sub_25E65B890()
{
  unint64_t result = qword_26A6FE668;
  if (!qword_26A6FE668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6FE668);
  }
  return result;
}

uint64_t sub_25E65B8E4(char **a1)
{
  return sub_25E64F280(a1, *(unsigned int **)(v1 + 16));
}

unint64_t sub_25E65B900()
{
  unint64_t result = qword_26A6FE670;
  if (!qword_26A6FE670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6FE670);
  }
  return result;
}

uint64_t sub_25E65B954(uint64_t *a1)
{
  return sub_25E64F214(a1, *(unsigned int **)(v1 + 16));
}

unint64_t sub_25E65B970()
{
  unint64_t result = qword_26A6FE678;
  if (!qword_26A6FE678)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6FE678);
  }
  return result;
}

uint64_t sub_25E65B9C4(char **a1)
{
  return sub_25E64F25C(a1, *(unsigned __int16 **)(v1 + 16));
}

unint64_t sub_25E65B9E0()
{
  unint64_t result = qword_26A6FE680;
  if (!qword_26A6FE680)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6FE680);
  }
  return result;
}

uint64_t sub_25E65BA34(uint64_t *a1)
{
  return sub_25E64F1F0(a1, *(unsigned __int16 **)(v1 + 16));
}

unint64_t sub_25E65BA50()
{
  unint64_t result = qword_26A6FE688;
  if (!qword_26A6FE688)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6FE688);
  }
  return result;
}

uint64_t sub_25E65BAA4(char **a1)
{
  return sub_25E64F238(a1, *(unsigned __int8 **)(v1 + 16));
}

unint64_t sub_25E65BAC0()
{
  unint64_t result = qword_26A6FE690;
  if (!qword_26A6FE690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6FE690);
  }
  return result;
}

uint64_t sub_25E65BB14(uint64_t *a1)
{
  return sub_25E64F1CC(a1, *(unsigned __int8 **)(v1 + 16));
}

unint64_t sub_25E65BB30()
{
  unint64_t result = qword_26A6FE698;
  if (!qword_26A6FE698)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6FE698);
  }
  return result;
}

uint64_t sub_25E65BB88(uint64_t a1)
{
  return sub_25E6560CC(a1, *(char ***)(v1 + 32), *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_25E65BBE4(uint64_t result)
{
  int64_t v2 = *(void *)(result + 16);
  uint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v6 = result;
  unint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (result && v5 <= *(void *)(v3 + 24) >> 1)
  {
    if (*(void *)(v6 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
  if (v4 <= v5) {
    int64_t v11 = v4 + v2;
  }
  else {
    int64_t v11 = v4;
  }
  unint64_t result = (uint64_t)sub_25E64EE6C((char *)result, v11, 1, (char *)v3);
  uint64_t v3 = result;
  if (!*(void *)(v6 + 16))
  {
LABEL_13:
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
LABEL_5:
  uint64_t v7 = *(void *)(v3 + 16);
  if ((*(void *)(v3 + 24) >> 1) - v7 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  unint64_t result = (uint64_t)memcpy((void *)(v3 + v7 + 32), (const void *)(v6 + 32), v2);
  if (!v2)
  {
LABEL_14:
    unint64_t result = swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return result;
  }
  uint64_t v8 = *(void *)(v3 + 16);
  BOOL v9 = __OFADD__(v8, v2);
  uint64_t v10 = v8 + v2;
  if (!v9)
  {
    *(void *)(v3 + 16) = v10;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_25E65BCC8(uint64_t a1, unint64_t a2, unint64_t a3)
{
  return sub_25E65BD20(a1, a2, a3, (uint64_t (*)(uint64_t *, char *, int64_t, uint64_t, unint64_t, unint64_t))sub_25E65E0D4, (uint64_t (*)(uint64_t))sub_25E65E690);
}

uint64_t sub_25E65BCF4(uint64_t a1, unint64_t a2, unint64_t a3)
{
  return sub_25E65BD20(a1, a2, a3, (uint64_t (*)(uint64_t *, char *, int64_t, uint64_t, unint64_t, unint64_t))sub_25E65E530, (uint64_t (*)(uint64_t))sub_25E65E76C);
}

uint64_t sub_25E65BD20(uint64_t result, unint64_t a2, unint64_t a3, uint64_t (*a4)(uint64_t *, char *, int64_t, uint64_t, unint64_t, unint64_t), uint64_t (*a5)(uint64_t))
{
  unint64_t v8 = (71 - __clz(a3)) >> 3;
  if (v8 < result)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 < a2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v10 = result;
  uint64_t v11 = result - a2;
  uint64_t v7 = *v6;
  int64_t v12 = *((void *)*v6 + 2);
  int64_t v13 = v12 + result - a2;
  if (__OFADD__(v12, result - a2))
  {
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  int64_t v5 = a5;
  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || (int64_t v17 = *((void *)v7 + 3) >> 1, v17 < v13))
  {
    if (v12 <= v13) {
      int64_t v18 = v13;
    }
    else {
      int64_t v18 = v12;
    }
    uint64_t v7 = sub_25E64EE6C(isUniquelyReferenced_nonNull_native, v18, 1, v7);
    int64_t v17 = *((void *)v7 + 3) >> 1;
  }
  uint64_t v19 = *((void *)v7 + 2);
  int64_t v20 = v17 - v19;
  unint64_t result = a4(&v35, &v7[v19 + 32], v17 - v19, v10, a2, a3);
  if (result < v11) {
    goto LABEL_19;
  }
  if (result >= 1)
  {
    uint64_t v21 = *((void *)v7 + 2);
    BOOL v22 = __OFADD__(v21, result);
    uint64_t v23 = v21 + result;
    if (v22)
    {
      __break(1u);
LABEL_38:
      *((void *)v7 + 2) = v20 + 1;
      goto LABEL_15;
    }
    *((void *)v7 + 2) = v23;
  }
  if (result != v20)
  {
LABEL_15:
    *uint64_t v6 = v7;
    return result;
  }
LABEL_20:
  uint64_t v24 = v38;
  uint64_t v25 = v36;
  if (!__OFSUB__(v38, v36))
  {
    if (v38 == v36) {
      goto LABEL_15;
    }
    int64_t v20 = *((void *)v7 + 2);
    unint64_t v26 = v37;
    uint64_t v34 = v35;
    unint64_t result = v5(v38);
    int64_t v27 = v24 - 1;
    if (v24 >= 1)
    {
      int64_t v33 = (71 - __clz(v26)) >> 3;
      if (v33 >= v24) {
        goto LABEL_26;
      }
    }
    __break(1u);
    do
    {
LABEL_25:
      while (1)
      {
        *((void *)v7 + 2) = v20;
LABEL_26:
        unint64_t v28 = *((void *)v7 + 3);
        int64_t v29 = v28 >> 1;
        if ((uint64_t)(v28 >> 1) < v20 + 1) {
          break;
        }
        if (v20 < v29) {
          goto LABEL_28;
        }
      }
      uint64_t v32 = result;
      uint64_t v7 = sub_25E64EE6C((char *)(v28 > 1), v20 + 1, 1, v7);
      unint64_t result = v32;
      int64_t v29 = *((void *)v7 + 3) >> 1;
    }
    while (v20 >= v29);
LABEL_28:
    uint64_t v30 = v27;
    while (1)
    {
      v7[v20 + 32] = result;
      if (__OFSUB__(v30, v25)) {
        break;
      }
      if (v25 == v30) {
        goto LABEL_38;
      }
      unint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, unint64_t))v5)(v30, v34, v25, v26);
      if (v27 > v33) {
        goto LABEL_40;
      }
      if (v30-- < 1) {
        goto LABEL_40;
      }
      if (v29 == ++v20)
      {
        int64_t v20 = v29;
        int64_t v27 = v30;
        goto LABEL_25;
      }
    }
    __break(1u);
LABEL_40:
    __break(1u);
  }
  __break(1u);
  return result;
}

int64_t sub_25E65BF84(int64_t a1)
{
  return sub_25E65CD8C(a1, sub_25E65786C);
}

uint64_t sub_25E65BF9C(uint64_t a1, unint64_t a2, uint64_t a3)
{
  return sub_25E65C04C(a1, a2, a3, (uint64_t (*)(uint64_t *, char *, int64_t, uint64_t, unint64_t, uint64_t))sub_25E65DC90, (uint64_t (*)(uint64_t))sub_25E65E628);
}

uint64_t sub_25E65BFC8(uint64_t a1, unint64_t a2, uint64_t a3)
{
  return sub_25E65C468(a1, a2, a3, (uint64_t (*)(uint64_t *, char *, int64_t, uint64_t, unint64_t, uint64_t))sub_25E65DDB4, (uint64_t (*)(uint64_t, uint64_t))sub_25E657870);
}

uint64_t sub_25E65BFF4(uint64_t a1, unint64_t a2, uint64_t a3)
{
  return sub_25E65C91C(a1, a2, a3, (uint64_t (*)(uint64_t *, char *, int64_t, uint64_t, unint64_t, uint64_t))sub_25E65DF44, (uint64_t (*)(uint64_t, uint64_t))sub_25E657910);
}

uint64_t sub_25E65C020(uint64_t a1, unint64_t a2, uint64_t a3)
{
  return sub_25E65C04C(a1, a2, a3, (uint64_t (*)(uint64_t *, char *, int64_t, uint64_t, unint64_t, uint64_t))sub_25E65E21C, (uint64_t (*)(uint64_t))sub_25E65E718);
}

uint64_t sub_25E65C04C(uint64_t result, unint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t *, char *, int64_t, uint64_t, unint64_t, uint64_t), uint64_t (*a5)(uint64_t))
{
  unint64_t v8 = ((unint64_t)(32 - __clz(a3)) + 7) >> 3;
  if (v8 < result)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 < a2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v10 = result;
  uint64_t v11 = result - a2;
  uint64_t v7 = *v6;
  int64_t v12 = *((void *)*v6 + 2);
  int64_t v13 = v12 + result - a2;
  if (__OFADD__(v12, result - a2))
  {
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  int64_t v5 = a5;
  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || (int64_t v17 = *((void *)v7 + 3) >> 1, v17 < v13))
  {
    if (v12 <= v13) {
      int64_t v18 = v13;
    }
    else {
      int64_t v18 = v12;
    }
    uint64_t v7 = sub_25E64EE6C(isUniquelyReferenced_nonNull_native, v18, 1, v7);
    int64_t v17 = *((void *)v7 + 3) >> 1;
  }
  uint64_t v19 = *((void *)v7 + 2);
  int64_t v20 = v17 - v19;
  unint64_t result = a4(&v35, &v7[v19 + 32], v17 - v19, v10, a2, a3);
  if (result < v11) {
    goto LABEL_19;
  }
  if (result >= 1)
  {
    uint64_t v21 = *((void *)v7 + 2);
    BOOL v22 = __OFADD__(v21, result);
    uint64_t v23 = v21 + result;
    if (v22)
    {
      __break(1u);
LABEL_38:
      *((void *)v7 + 2) = v20 + 1;
      goto LABEL_15;
    }
    *((void *)v7 + 2) = v23;
  }
  if (result != v20)
  {
LABEL_15:
    *uint64_t v6 = v7;
    return result;
  }
LABEL_20:
  uint64_t v24 = v38;
  uint64_t v25 = v36;
  if (!__OFSUB__(v38, v36))
  {
    if (v38 == v36) {
      goto LABEL_15;
    }
    int64_t v20 = *((void *)v7 + 2);
    uint64_t v26 = v37;
    uint64_t v34 = v35;
    unint64_t result = v5(v38);
    int64_t v27 = v24 - 1;
    if (v24 >= 1)
    {
      int64_t v33 = ((unint64_t)(32 - __clz(v26)) + 7) >> 3;
      if (v33 >= v24) {
        goto LABEL_26;
      }
    }
    __break(1u);
    do
    {
LABEL_25:
      while (1)
      {
        *((void *)v7 + 2) = v20;
LABEL_26:
        unint64_t v28 = *((void *)v7 + 3);
        int64_t v29 = v28 >> 1;
        if ((uint64_t)(v28 >> 1) < v20 + 1) {
          break;
        }
        if (v20 < v29) {
          goto LABEL_28;
        }
      }
      uint64_t v32 = result;
      uint64_t v7 = sub_25E64EE6C((char *)(v28 > 1), v20 + 1, 1, v7);
      unint64_t result = v32;
      int64_t v29 = *((void *)v7 + 3) >> 1;
    }
    while (v20 >= v29);
LABEL_28:
    uint64_t v30 = v27;
    while (1)
    {
      v7[v20 + 32] = result;
      if (__OFSUB__(v30, v25)) {
        break;
      }
      if (v25 == v30) {
        goto LABEL_38;
      }
      unint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v5)(v30, v34, v25, v26);
      if (v27 > v33) {
        goto LABEL_40;
      }
      if (v30-- < 1) {
        goto LABEL_40;
      }
      if (v29 == ++v20)
      {
        int64_t v20 = v29;
        int64_t v27 = v30;
        goto LABEL_25;
      }
    }
    __break(1u);
LABEL_40:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_25E65C2C4(unsigned int a1)
{
  unint64_t v3 = ((unint64_t)(32 - __clz(a1)) + 7) >> 3;
  int64_t v4 = *v1;
  unint64_t v5 = *((void *)*v1 + 2) + v3;
  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || (unint64_t v7 = *((void *)v4 + 3) >> 1, v7 < v5))
  {
    int64_t v4 = sub_25E64EE6C(isUniquelyReferenced_nonNull_native, v5, 1, v4);
    unint64_t v7 = *((void *)v4 + 3) >> 1;
  }
  int64_t v8 = *((void *)v4 + 2);
  uint64_t result = v3;
  unint64_t v10 = v7 - v8;
  if (v7 != v8)
  {
    if ((v10 & 0x8000000000000000) != 0)
    {
      __break(1u);
      return result;
    }
    if (!(_BYTE)a1) {
      goto LABEL_17;
    }
    uint64_t result = 0;
    v4[v8 + 32] = a1;
    if (v10 != 1) {
      goto LABEL_11;
    }
  }
  if (v10 < v3)
  {
    __break(1u);
LABEL_19:
    uint64_t result = sub_25E6579B4(result, a1);
    char v13 = result;
    int64_t v14 = v8 + 1;
    while (1)
    {
      unint64_t v15 = *((void *)v4 + 3);
      if ((uint64_t)(v15 >> 1) < v14)
      {
        int64_t v16 = v8;
        int64_t v17 = v14;
        uint64_t result = (uint64_t)sub_25E64EE6C((char *)(v15 > 1), v14, 1, v4);
        int64_t v14 = v17;
        int64_t v8 = v16;
        int64_t v4 = (char *)result;
        if (v16 < *(void *)(result + 24) >> 1)
        {
LABEL_24:
          v4[v8 + 32] = v13;
          *((void *)v4 + 2) = v14;
          goto LABEL_17;
        }
      }
      else if (v8 < (uint64_t)(v15 >> 1))
      {
        goto LABEL_24;
      }
      *((void *)v4 + 2) = v8;
    }
  }
  if (v7 == v8)
  {
    uint64_t v11 = 0;
  }
  else
  {
LABEL_11:
    *((void *)v4 + 2) = ++v8;
    uint64_t v11 = 1;
  }
  if (v11 == v10 && result != 0) {
    goto LABEL_19;
  }
LABEL_17:
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_25E65C43C(uint64_t a1, unint64_t a2, uint64_t a3)
{
  return sub_25E65C468(a1, a2, a3, (uint64_t (*)(uint64_t *, char *, int64_t, uint64_t, unint64_t, uint64_t))sub_25E65E31C, (uint64_t (*)(uint64_t, uint64_t))sub_25E6579FC);
}

uint64_t sub_25E65C468(uint64_t result, unint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t *, char *, int64_t, uint64_t, unint64_t, uint64_t), uint64_t (*a5)(uint64_t, uint64_t))
{
  unint64_t v8 = ((unint64_t)(unsigned __int16)(32 - __clz((unsigned __int16)a3)) + 7) >> 3;
  if (v8 < result)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 < a2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v10 = result;
  uint64_t v11 = result - a2;
  unint64_t v7 = *v6;
  int64_t v12 = *((void *)*v6 + 2);
  int64_t v13 = v12 + result - a2;
  if (__OFADD__(v12, result - a2))
  {
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  unint64_t v5 = a5;
  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || (int64_t v17 = *((void *)v7 + 3) >> 1, v17 < v13))
  {
    if (v12 <= v13) {
      int64_t v18 = v13;
    }
    else {
      int64_t v18 = v12;
    }
    unint64_t v7 = sub_25E64EE6C(isUniquelyReferenced_nonNull_native, v18, 1, v7);
    int64_t v17 = *((void *)v7 + 3) >> 1;
  }
  uint64_t v19 = *((void *)v7 + 2);
  int64_t v20 = v17 - v19;
  uint64_t result = a4(&v35, &v7[v19 + 32], v17 - v19, v10, a2, a3);
  if (result < v11) {
    goto LABEL_19;
  }
  if (result >= 1)
  {
    uint64_t v21 = *((void *)v7 + 2);
    BOOL v22 = __OFADD__(v21, result);
    uint64_t v23 = v21 + result;
    if (v22)
    {
      __break(1u);
LABEL_42:
      *((void *)v7 + 2) = v20 + 1;
      goto LABEL_15;
    }
    *((void *)v7 + 2) = v23;
  }
  if (result != v20)
  {
LABEL_15:
    *uint64_t v6 = v7;
    return result;
  }
LABEL_20:
  uint64_t v24 = v38;
  uint64_t v25 = v36;
  if (__OFSUB__(v38, v36))
  {
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
  if (v38 == v36) {
    goto LABEL_15;
  }
  if (v36 < v38)
  {
    int64_t v34 = v35;
    if (v35 >= v38)
    {
      int64_t v20 = *((void *)v7 + 2);
      uint64_t v26 = v37;
      uint64_t result = v5(v38, v37);
      int64_t v27 = v24 - 1;
      if (v24 >= 1)
      {
        int64_t v33 = ((unint64_t)(unsigned __int16)(32 - __clz(v26)) + 7) >> 3;
        if (v33 >= v24) {
          goto LABEL_28;
        }
      }
      __break(1u);
      do
      {
LABEL_27:
        while (1)
        {
          *((void *)v7 + 2) = v20;
LABEL_28:
          unint64_t v28 = *((void *)v7 + 3);
          int64_t v29 = v28 >> 1;
          if ((uint64_t)(v28 >> 1) < v20 + 1) {
            break;
          }
          if (v20 < v29) {
            goto LABEL_30;
          }
        }
        uint64_t v32 = result;
        unint64_t v7 = sub_25E64EE6C((char *)(v28 > 1), v20 + 1, 1, v7);
        uint64_t result = v32;
        int64_t v29 = *((void *)v7 + 3) >> 1;
      }
      while (v20 >= v29);
LABEL_30:
      uint64_t v30 = v27;
      while (1)
      {
        v7[v20 + 32] = result;
        if (__OFSUB__(v30, v25)) {
          break;
        }
        if (v25 == v30) {
          goto LABEL_42;
        }
        if (v27 > v34 || v25 >= v30) {
          goto LABEL_44;
        }
        uint64_t result = v5(v30, v26);
        if (v27 > v33) {
          goto LABEL_45;
        }
        if (v30-- < 1) {
          goto LABEL_45;
        }
        if (v29 == ++v20)
        {
          int64_t v20 = v29;
          int64_t v27 = v30;
          goto LABEL_27;
        }
      }
      __break(1u);
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      goto LABEL_46;
    }
  }
LABEL_47:
  __break(1u);
  return result;
}

uint64_t sub_25E65C700(uint64_t result)
{
  int64_t v3 = ((unint64_t)(unsigned __int16)(32 - __clz((unsigned __int16)result)) + 7) >> 3;
  int64_t v4 = *v1;
  int64_t v5 = *((void *)*v1 + 2);
  int64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3))
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  unsigned __int16 v7 = result;
  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || (int64_t v9 = *((void *)v4 + 3) >> 1, v9 < v6))
  {
    if (v5 <= v6) {
      int64_t v10 = v5 + v3;
    }
    else {
      int64_t v10 = v5;
    }
    int64_t v4 = sub_25E64EE6C(isUniquelyReferenced_nonNull_native, v10, 1, v4);
    int64_t v9 = *((void *)v4 + 3) >> 1;
  }
  uint64_t v11 = *((void *)v4 + 2);
  uint64_t v12 = v9 - v11;
  uint64_t result = sub_25E65DAE4((unint64_t)&v24, (uint64_t)&v4[v11 + 32], v9 - v11, v7);
  if (result < v3) {
    goto LABEL_15;
  }
  if (result >= 1)
  {
    uint64_t v13 = *((void *)v4 + 2);
    BOOL v14 = __OFADD__(v13, result);
    uint64_t v15 = v13 + result;
    if (v14)
    {
      __break(1u);
      goto LABEL_32;
    }
    *((void *)v4 + 2) = v15;
  }
  if (result == v12)
  {
LABEL_16:
    uint64_t v16 = v25;
    if (!v25) {
      goto LABEL_13;
    }
    int64_t v3 = *((void *)v4 + 2);
    unsigned int v17 = v24;
    uint64_t result = sub_25E6579FC(v25, v24);
    int64_t v18 = v16 - 1;
    if (v16 >= 1)
    {
      int64_t v2 = ((unint64_t)(unsigned __int16)(32 - __clz(v17)) + 7) >> 3;
      if (v2 >= v16) {
        goto LABEL_21;
      }
    }
    __break(1u);
    do
    {
LABEL_20:
      while (1)
      {
        *((void *)v4 + 2) = v3;
LABEL_21:
        unint64_t v19 = *((void *)v4 + 3);
        int64_t v20 = v19 >> 1;
        if ((uint64_t)(v19 >> 1) < v3 + 1) {
          break;
        }
        if (v3 < v20) {
          goto LABEL_23;
        }
      }
      uint64_t v23 = result;
      int64_t v4 = sub_25E64EE6C((char *)(v19 > 1), v3 + 1, 1, v4);
      uint64_t result = v23;
      int64_t v20 = *((void *)v4 + 3) >> 1;
    }
    while (v3 >= v20);
LABEL_23:
    uint64_t v21 = v18;
    while (1)
    {
      v4[v3++ + 32] = result;
      if (!v21) {
        break;
      }
      uint64_t result = sub_25E6579FC(v21, v17);
      if (v18 > v2 || (BOOL v22 = v21 < 1, --v21, v22))
      {
        __break(1u);
        return result;
      }
      if (v20 == v3)
      {
        int64_t v3 = v20;
        int64_t v18 = v21;
        goto LABEL_20;
      }
    }
LABEL_32:
    *((void *)v4 + 2) = v3;
  }
LABEL_13:
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_25E65C8F0(uint64_t a1, unint64_t a2, uint64_t a3)
{
  return sub_25E65C91C(a1, a2, a3, (uint64_t (*)(uint64_t *, char *, int64_t, uint64_t, unint64_t, uint64_t))sub_25E65E42C, (uint64_t (*)(uint64_t, uint64_t))sub_25E657A50);
}

uint64_t sub_25E65C91C(uint64_t result, unint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t *, char *, int64_t, uint64_t, unint64_t, uint64_t), uint64_t (*a5)(uint64_t, uint64_t))
{
  unint64_t v8 = ((unint64_t)(32 - __clz(a3)) + 7) >> 3;
  if (v8 < result)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 < a2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v10 = result;
  uint64_t v11 = result - a2;
  unsigned __int16 v7 = *v6;
  int64_t v12 = *((void *)*v6 + 2);
  int64_t v13 = v12 + result - a2;
  if (__OFADD__(v12, result - a2))
  {
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  int64_t v5 = a5;
  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || (int64_t v17 = *((void *)v7 + 3) >> 1, v17 < v13))
  {
    if (v12 <= v13) {
      int64_t v18 = v13;
    }
    else {
      int64_t v18 = v12;
    }
    unsigned __int16 v7 = sub_25E64EE6C(isUniquelyReferenced_nonNull_native, v18, 1, v7);
    int64_t v17 = *((void *)v7 + 3) >> 1;
  }
  uint64_t v19 = *((void *)v7 + 2);
  int64_t v20 = v17 - v19;
  uint64_t result = a4(&v35, &v7[v19 + 32], v17 - v19, v10, a2, a3);
  if (result < v11) {
    goto LABEL_19;
  }
  if (result >= 1)
  {
    uint64_t v21 = *((void *)v7 + 2);
    BOOL v22 = __OFADD__(v21, result);
    uint64_t v23 = v21 + result;
    if (v22)
    {
      __break(1u);
LABEL_42:
      *((void *)v7 + 2) = v20 + 1;
      goto LABEL_15;
    }
    *((void *)v7 + 2) = v23;
  }
  if (result != v20)
  {
LABEL_15:
    *int64_t v6 = v7;
    return result;
  }
LABEL_20:
  uint64_t v24 = v38;
  uint64_t v25 = v36;
  if (__OFSUB__(v38, v36))
  {
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
  if (v38 == v36) {
    goto LABEL_15;
  }
  if (v36 < v38)
  {
    int64_t v34 = v35;
    if (v35 >= v38)
    {
      int64_t v20 = *((void *)v7 + 2);
      uint64_t v26 = v37;
      uint64_t result = v5(v38, v37);
      int64_t v27 = v24 - 1;
      if (v24 >= 1)
      {
        int64_t v33 = ((unint64_t)(32 - __clz(v26)) + 7) >> 3;
        if (v33 >= v24) {
          goto LABEL_28;
        }
      }
      __break(1u);
      do
      {
LABEL_27:
        while (1)
        {
          *((void *)v7 + 2) = v20;
LABEL_28:
          unint64_t v28 = *((void *)v7 + 3);
          int64_t v29 = v28 >> 1;
          if ((uint64_t)(v28 >> 1) < v20 + 1) {
            break;
          }
          if (v20 < v29) {
            goto LABEL_30;
          }
        }
        uint64_t v32 = result;
        unsigned __int16 v7 = sub_25E64EE6C((char *)(v28 > 1), v20 + 1, 1, v7);
        uint64_t result = v32;
        int64_t v29 = *((void *)v7 + 3) >> 1;
      }
      while (v20 >= v29);
LABEL_30:
      uint64_t v30 = v27;
      while (1)
      {
        v7[v20 + 32] = result;
        if (__OFSUB__(v30, v25)) {
          break;
        }
        if (v25 == v30) {
          goto LABEL_42;
        }
        if (v27 > v34 || v25 >= v30) {
          goto LABEL_44;
        }
        uint64_t result = v5(v30, v26);
        if (v27 > v33) {
          goto LABEL_45;
        }
        if (v30-- < 1) {
          goto LABEL_45;
        }
        if (v29 == ++v20)
        {
          int64_t v20 = v29;
          int64_t v27 = v30;
          goto LABEL_27;
        }
      }
      __break(1u);
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      goto LABEL_46;
    }
  }
LABEL_47:
  __break(1u);
  return result;
}

uint64_t sub_25E65CBA8(uint64_t result)
{
  int64_t v3 = ((unint64_t)(32 - __clz(result)) + 7) >> 3;
  int64_t v4 = *v1;
  int64_t v5 = *((void *)*v1 + 2);
  int64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3))
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  unsigned int v7 = result;
  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || (int64_t v9 = *((void *)v4 + 3) >> 1, v9 < v6))
  {
    if (v5 <= v6) {
      int64_t v10 = v5 + v3;
    }
    else {
      int64_t v10 = v5;
    }
    int64_t v4 = sub_25E64EE6C(isUniquelyReferenced_nonNull_native, v10, 1, v4);
    int64_t v9 = *((void *)v4 + 3) >> 1;
  }
  uint64_t v11 = *((void *)v4 + 2);
  uint64_t v12 = v9 - v11;
  uint64_t result = sub_25E65DB78((unint64_t)&v24, (uint64_t)&v4[v11 + 32], v9 - v11, v7);
  if (result < v3) {
    goto LABEL_15;
  }
  if (result >= 1)
  {
    uint64_t v13 = *((void *)v4 + 2);
    BOOL v14 = __OFADD__(v13, result);
    uint64_t v15 = v13 + result;
    if (v14)
    {
      __break(1u);
      goto LABEL_32;
    }
    *((void *)v4 + 2) = v15;
  }
  if (result == v12)
  {
LABEL_16:
    uint64_t v16 = v25;
    if (!v25) {
      goto LABEL_13;
    }
    int64_t v3 = *((void *)v4 + 2);
    unsigned int v17 = v24;
    uint64_t result = sub_25E657A50(v25, v24);
    int64_t v18 = v16 - 1;
    if (v16 >= 1)
    {
      int64_t v2 = ((unint64_t)(32 - __clz(v17)) + 7) >> 3;
      if (v2 >= v16) {
        goto LABEL_21;
      }
    }
    __break(1u);
    do
    {
LABEL_20:
      while (1)
      {
        *((void *)v4 + 2) = v3;
LABEL_21:
        unint64_t v19 = *((void *)v4 + 3);
        int64_t v20 = v19 >> 1;
        if ((uint64_t)(v19 >> 1) < v3 + 1) {
          break;
        }
        if (v3 < v20) {
          goto LABEL_23;
        }
      }
      uint64_t v23 = result;
      int64_t v4 = sub_25E64EE6C((char *)(v19 > 1), v3 + 1, 1, v4);
      uint64_t result = v23;
      int64_t v20 = *((void *)v4 + 3) >> 1;
    }
    while (v3 >= v20);
LABEL_23:
    uint64_t v21 = v18;
    while (1)
    {
      v4[v3++ + 32] = result;
      if (!v21) {
        break;
      }
      uint64_t result = sub_25E657A50(v21, v17);
      if (v18 > v2 || (BOOL v22 = v21 < 1, --v21, v22))
      {
        __break(1u);
        return result;
      }
      if (v20 == v3)
      {
        int64_t v3 = v20;
        int64_t v18 = v21;
        goto LABEL_20;
      }
    }
LABEL_32:
    *((void *)v4 + 2) = v3;
  }
LABEL_13:
  *uint64_t v1 = v4;
  return result;
}

int64_t sub_25E65CD8C(int64_t result, uint64_t (*a2)(uint64_t, unint64_t))
{
  int64_t v5 = (71 - __clz(result)) >> 3;
  int64_t v6 = *v3;
  int64_t v7 = *((void *)*v3 + 2);
  int64_t v8 = v7 + v5;
  if (__OFADD__(v7, v5))
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  int64_t v2 = a2;
  unint64_t v9 = result;
  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || (int64_t v11 = *((void *)v6 + 3) >> 1, v11 < v8))
  {
    if (v7 <= v8) {
      int64_t v12 = v7 + v5;
    }
    else {
      int64_t v12 = v7;
    }
    int64_t v6 = sub_25E64EE6C(isUniquelyReferenced_nonNull_native, v12, 1, v6);
    int64_t v11 = *((void *)v6 + 3) >> 1;
  }
  uint64_t v13 = *((void *)v6 + 2);
  uint64_t v14 = v11 - v13;
  uint64_t result = (int64_t)sub_25E65DC08(&v26, (uint64_t)&v6[v13 + 32], v11 - v13, v9);
  if (result < v5) {
    goto LABEL_15;
  }
  if (result >= 1)
  {
    uint64_t v15 = *((void *)v6 + 2);
    BOOL v16 = __OFADD__(v15, result);
    uint64_t v17 = v15 + result;
    if (v16)
    {
      __break(1u);
      goto LABEL_32;
    }
    *((void *)v6 + 2) = v17;
  }
  if (result == v14)
  {
LABEL_16:
    uint64_t v18 = v27;
    if (!v27) {
      goto LABEL_13;
    }
    int64_t v5 = *((void *)v6 + 2);
    unint64_t v19 = v26;
    uint64_t result = v2(v27, v26);
    int64_t v20 = v18 - 1;
    if (v18 >= 1)
    {
      int64_t v4 = (71 - __clz(v19)) >> 3;
      if (v4 >= v18) {
        goto LABEL_21;
      }
    }
    __break(1u);
    do
    {
LABEL_20:
      while (1)
      {
        *((void *)v6 + 2) = v5;
LABEL_21:
        unint64_t v21 = *((void *)v6 + 3);
        int64_t v22 = v21 >> 1;
        if ((uint64_t)(v21 >> 1) < v5 + 1) {
          break;
        }
        if (v5 < v22) {
          goto LABEL_23;
        }
      }
      int64_t v25 = result;
      int64_t v6 = sub_25E64EE6C((char *)(v21 > 1), v5 + 1, 1, v6);
      uint64_t result = v25;
      int64_t v22 = *((void *)v6 + 3) >> 1;
    }
    while (v5 >= v22);
LABEL_23:
    uint64_t v23 = v20;
    while (1)
    {
      v6[v5++ + 32] = result;
      if (!v23) {
        break;
      }
      uint64_t result = v2(v23, v19);
      if (v20 > v4 || (BOOL v24 = v23 < 1, --v23, v24))
      {
        __break(1u);
        return result;
      }
      if (v22 == v5)
      {
        int64_t v5 = v22;
        int64_t v20 = v23;
        goto LABEL_20;
      }
    }
LABEL_32:
    *((void *)v6 + 2) = v5;
  }
LABEL_13:
  *int64_t v3 = v6;
  return result;
}

unint64_t sub_25E65CF8C(unint64_t result, unint64_t a2, unsigned __int8 a3)
{
  unint64_t v3 = ((unint64_t)(32 - __clz(a3)) + 7) >> 3;
  if (v3 < result)
  {
    __break(1u);
  }
  else if (v3 >= a2)
  {
    result -= a2;
    return result;
  }
  __break(1u);
  return result;
}

unint64_t sub_25E65CFC8(unint64_t result, unint64_t a2, unsigned __int16 a3)
{
  unint64_t v3 = ((unint64_t)(unsigned __int16)(32 - __clz(a3)) + 7) >> 3;
  if (v3 < result)
  {
    __break(1u);
  }
  else if (v3 >= a2)
  {
    result -= a2;
    return result;
  }
  __break(1u);
  return result;
}

unint64_t sub_25E65D004(unint64_t result, unint64_t a2, unsigned int a3)
{
  unint64_t v3 = ((unint64_t)(32 - __clz(a3)) + 7) >> 3;
  if (v3 < result)
  {
    __break(1u);
  }
  else if (v3 >= a2)
  {
    result -= a2;
    return result;
  }
  __break(1u);
  return result;
}

unint64_t sub_25E65D038(unint64_t result, unint64_t a2, unint64_t a3)
{
  unint64_t v3 = (71 - __clz(a3)) >> 3;
  if (v3 < result)
  {
    __break(1u);
  }
  else if (v3 >= a2)
  {
    result -= a2;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t ASN1Any.init<A>(erasing:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char **a4@<X8>)
{
  uint64_t v13 = sub_25E64EE6C(0, 1024, 0, MEMORY[0x263F8EE78]);
  (*(void (**)(char **, uint64_t, uint64_t))(a3 + 8))(&v13, a2, a3);
  if (v4)
  {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 8))(a1, a2);
    return swift_bridgeObjectRelease();
  }
  else
  {
    int64_t v10 = v13;
    int64_t v11 = v13 + 32;
    uint64_t v12 = (2 * *((void *)v13 + 2)) | 1;
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 8))(a1, a2);
    *a4 = v10;
    a4[1] = v11;
    a4[2] = 0;
    a4[3] = (char *)v12;
  }
  return result;
}

uint64_t ASN1Any.init<A>(erasing:withIdentifier:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char **a5@<X8>)
{
  uint64_t v10 = *a2;
  char v11 = *((unsigned char *)a2 + 8);
  uint64_t v18 = sub_25E64EE6C(0, 1024, 0, MEMORY[0x263F8EE78]);
  uint64_t v16 = v10;
  char v17 = v11;
  (*(void (**)(char **, uint64_t *, uint64_t, uint64_t))(a4 + 40))(&v18, &v16, a3, a4);
  if (v5)
  {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(a3 - 8) + 8))(a1, a3);
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v13 = v18;
    uint64_t v14 = v18 + 32;
    uint64_t v15 = (2 * *((void *)v18 + 2)) | 1;
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a3 - 8) + 8))(a1, a3);
    *a5 = v13;
    a5[1] = v14;
    a5[2] = 0;
    a5[3] = (char *)v15;
  }
  return result;
}

uint64_t ASN1Any.init(derEncoded:)@<X0>(_OWORD *a1@<X0>, char **a2@<X8>)
{
  int64_t v2 = a1;
  long long v4 = a1[3];
  v14[1] = a1[2];
  v14[2] = v4;
  long long v5 = a1[5];
  v14[3] = a1[4];
  v14[4] = v5;
  long long v6 = a1[1];
  long long v13 = *a1;
  v14[0] = v6;
  uint64_t v12 = sub_25E64EE6C(0, 1024, 0, MEMORY[0x263F8EE78]);
  uint64_t v10 = *(void *)v2;
  char v11 = *((unsigned char *)v2 + 8);
  sub_25E651B74(v14, v15);
  sub_25E651B74(v15, &v16);
  LOBYTE(v2) = v17;
  sub_25E651B8C((uint64_t)&v13);
  sub_25E650040(&v10, (v2 & 1) == 0, (uint64_t)&v12, (uint64_t)&v13);
  sub_25E651BD0((uint64_t)&v13);
  uint64_t result = sub_25E651BD0((uint64_t)&v13);
  int64_t v8 = v12 + 32;
  uint64_t v9 = (2 * *((void *)v12 + 2)) | 1;
  *a2 = v12;
  a2[1] = v8;
  a2[2] = 0;
  a2[3] = (char *)v9;
  return result;
}

uint64_t ASN1Any.serialize(into:)()
{
  uint64_t v1 = v0[1];
  uint64_t v3 = v0[2];
  unint64_t v2 = v0[3];
  uint64_t v4 = swift_unknownObjectRetain();
  sub_25E65E8B4(v4, v1, v3, v2);
  return swift_unknownObjectRelease();
}

uint64_t ASN1Any.hash(into:)()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3] >> 1;
  uint64_t result = v2 - v1;
  if (__OFSUB__(v2, v1))
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v4 = v0[1];
  uint64_t result = sub_25E6699D0();
  BOOL v5 = __OFSUB__(v2, v1);
  uint64_t v6 = v2 - v1;
  if (!v6) {
    return result;
  }
  if ((v6 < 0) ^ v5 | (v6 == 0))
  {
LABEL_8:
    __break(1u);
    return result;
  }
  uint64_t v7 = v4 + v1;
  do
  {
    ++v7;
    uint64_t result = sub_25E6699E0();
    --v6;
  }
  while (v6);
  return result;
}

uint64_t static ASN1Any.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return sub_25E64F2A4(*(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a2 + 8), *(void *)(a2 + 16), *(void *)(a2 + 24));
}

uint64_t ASN1Any.hashValue.getter()
{
  uint64_t v1 = v0[1];
  uint64_t v2 = v0[2];
  unint64_t v3 = v0[3];
  sub_25E6699C0();
  unint64_t v4 = v3 >> 1;
  uint64_t result = v4 - v2;
  if (__OFSUB__(v4, v2))
  {
    __break(1u);
  }
  else
  {
    uint64_t result = sub_25E6699D0();
    BOOL v6 = __OFSUB__(v4, v2);
    uint64_t v7 = v4 - v2;
    if (!v7) {
      return sub_25E669A00();
    }
    if (!((v7 < 0) ^ v6 | (v7 == 0)))
    {
      uint64_t v8 = v1 + v2;
      do
      {
        ++v8;
        sub_25E6699E0();
        --v7;
      }
      while (v7);
      return sub_25E669A00();
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_25E65D540@<X0>(_OWORD *a1@<X0>, char **a2@<X8>)
{
  return ASN1Any.init(derEncoded:)(a1, a2);
}

uint64_t sub_25E65D568()
{
  uint64_t v1 = v0[1];
  uint64_t v3 = v0[2];
  unint64_t v2 = v0[3];
  uint64_t v4 = swift_unknownObjectRetain();
  sub_25E65E8B4(v4, v1, v3, v2);
  return swift_unknownObjectRelease();
}

uint64_t sub_25E65D5D4()
{
  uint64_t v1 = v0[1];
  uint64_t v2 = v0[2];
  unint64_t v3 = v0[3];
  sub_25E6699C0();
  unint64_t v4 = v3 >> 1;
  uint64_t result = v4 - v2;
  if (__OFSUB__(v4, v2))
  {
    __break(1u);
  }
  else
  {
    uint64_t result = sub_25E6699D0();
    BOOL v6 = __OFSUB__(v4, v2);
    uint64_t v7 = v4 - v2;
    if (!v7) {
      return sub_25E669A00();
    }
    if (!((v7 < 0) ^ v6 | (v7 == 0)))
    {
      uint64_t v8 = v1 + v2;
      do
      {
        ++v8;
        sub_25E6699E0();
        --v7;
      }
      while (v7);
      return sub_25E669A00();
    }
  }
  __break(1u);
  return result;
}

uint64_t _s9SwiftASN10B10UTF8StringV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  return sub_25E64F2A4(*(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a2 + 8), *(void *)(a2 + 16), *(void *)(a2 + 24));
}

uint64_t ASN1Any.description.getter()
{
  return 0x28796E41314E5341;
}

uint64_t sub_25E65D710()
{
  return 0x28796E41314E5341;
}

uint64_t DERParseable.init(asn1Any:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return DERParseable.init(derEncoded:)(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), a2, a3);
}

uint64_t DERImplicitlyTaggable.init(asn1Any:withIdentifier:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *a1;
  uint64_t v7 = a1[1];
  uint64_t v8 = a1[2];
  unint64_t v9 = a1[3];
  char v10 = *(unsigned char *)(a2 + 8);
  uint64_t v12 = *(void *)a2;
  char v13 = v10;
  return DERImplicitlyTaggable.init(derEncoded:withIdentifier:)(v6, v7, v8, v9, &v12, a3, a4);
}

uint64_t sub_25E65D824(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *v3;
  uint64_t v6 = v3[1];
  int64_t v7 = v3[2];
  long long v29 = *(_OWORD *)(v3 + 3);
  if (!a2) {
    goto LABEL_5;
  }
  uint64_t v8 = a3;
  if (!a3)
  {
LABEL_44:
    *(void *)uint64_t result = v5;
    *(void *)(result + 8) = v6;
    *(void *)(result + 16) = v7;
    *(_OWORD *)(result + 24) = v29;
    return v8;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    int64_t v9 = (unint64_t)v29 >> 1;
    if (v7 == (unint64_t)v29 >> 1)
    {
LABEL_5:
      uint64_t v8 = 0;
      goto LABEL_44;
    }
    uint64_t v28 = v5;
    uint64_t v26 = result;
    if (v7 >= (uint64_t)((unint64_t)v29 >> 1))
    {
LABEL_40:
      __break(1u);
LABEL_41:
      uint64_t v6 = v31;
LABEL_43:
      swift_unknownObjectRetain();
      int64_t v7 = v4;
      uint64_t result = v26;
      uint64_t v5 = v28;
      goto LABEL_44;
    }
    uint64_t v10 = a2;
    uint64_t v27 = v6 + 112;
    uint64_t v11 = 1;
    uint64_t v31 = v6;
    while (v9 > v7)
    {
      uint64_t v12 = (uint64_t *)(v6 + 96 * v7);
      uint64_t v13 = *v12;
      char v14 = *((unsigned char *)v12 + 8);
      char v15 = *((unsigned char *)v12 + 24);
      int64_t v16 = v7 + 1;
      long long v33 = *((_OWORD *)v12 + 3);
      long long v34 = *((_OWORD *)v12 + 2);
      if (v15)
      {
        uint64_t v17 = v12[2];
        int64_t v18 = (unint64_t)v29 >> 1;
        if (v16 != v9)
        {
          unint64_t v19 = (void *)(v27 + 96 * v7);
          int64_t v18 = v7 + 1;
          do
          {
            if (v18 >= v9)
            {
LABEL_46:
              __break(1u);
LABEL_47:
              __break(1u);
              goto LABEL_48;
            }
            if (v17 >= *v19) {
              goto LABEL_17;
            }
            int64_t v20 = v18 + 1;
            if (__OFADD__(v18, 1)) {
              goto LABEL_47;
            }
            ++v18;
            v19 += 12;
          }
          while (v20 != v9);
          int64_t v18 = (unint64_t)v29 >> 1;
LABEL_17:
          if (v18 <= v7) {
            goto LABEL_49;
          }
          if (v18 < 0) {
            goto LABEL_50;
          }
        }
        int64_t v21 = v18 - v16;
        if (__OFSUB__(v18, v16)) {
          goto LABEL_51;
        }
        if (v21 < 0) {
          goto LABEL_52;
        }
        int64_t v22 = v9 - v16;
        if (__OFSUB__(v9, v16)) {
          goto LABEL_53;
        }
        if (!v21 || v22 < 0 || (int64_t v4 = (unint64_t)v29 >> 1, v22 >= v21))
        {
          int64_t v4 = v18;
          if (__OFADD__(v16, v21)) {
            goto LABEL_56;
          }
          if (v9 < v18) {
            goto LABEL_54;
          }
        }
        if (v4 <= v7) {
          goto LABEL_55;
        }
        if (v16 != v18)
        {
          if (v16 >= v18) {
            goto LABEL_57;
          }
          uint64_t v23 = (uint64_t *)(v27 + 96 * v7);
          do
          {
            uint64_t v24 = *v23;
            v23 += 12;
            if (v17 >= v24)
            {
              __break(1u);
              goto LABEL_46;
            }
            --v21;
          }
          while (v21);
          if (*(void *)(v6 + 96 * v16 + 16) != v17 + 1) {
            goto LABEL_58;
          }
        }
        uint64_t v32 = v29 & 1 | (2 * v18);
        uint64_t v25 = swift_unknownObjectRetain();
      }
      else
      {
        uint64_t result = v12[8];
        if (!result) {
          goto LABEL_60;
        }
        int64_t v4 = v7 + 1;
        uint64_t v6 = v12[9];
        int64_t v16 = v12[10];
        uint64_t v32 = v12[11];
        uint64_t v25 = swift_unknownObjectRetain();
        uint64_t v17 = 0;
      }
      *(void *)uint64_t v10 = v13;
      *(unsigned char *)(v10 + 8) = v14;
      *(void *)(v10 + 16) = v25;
      *(void *)(v10 + 24) = v6;
      *(void *)(v10 + 32) = v16;
      *(void *)(v10 + 40) = v32;
      *(void *)(v10 + 48) = v17;
      *(unsigned char *)(v10 + 56) = v15 ^ 1;
      *(_OWORD *)(v10 + 64) = v34;
      *(_OWORD *)(v10 + 80) = v33;
      uint64_t v8 = a3;
      if (v11 == a3) {
        goto LABEL_41;
      }
      uint64_t v6 = v31;
      if (v4 == v9)
      {
        int64_t v4 = (unint64_t)v29 >> 1;
        uint64_t v8 = v11;
        goto LABEL_43;
      }
      ++v11;
      v10 += 96;
      uint64_t result = swift_unknownObjectRetain();
      int64_t v7 = v4;
      if (v4 >= v9) {
        goto LABEL_40;
      }
    }
LABEL_48:
    __break(1u);
LABEL_49:
    __break(1u);
LABEL_50:
    __break(1u);
LABEL_51:
    __break(1u);
LABEL_52:
    __break(1u);
LABEL_53:
    __break(1u);
LABEL_54:
    __break(1u);
LABEL_55:
    __break(1u);
LABEL_56:
    __break(1u);
LABEL_57:
    __break(1u);
LABEL_58:
    __break(1u);
  }
  __break(1u);
LABEL_60:
  __break(1u);
  return result;
}

unint64_t sub_25E65DAE4(unint64_t result, uint64_t a2, unint64_t a3, unsigned __int16 a4)
{
  unint64_t v4 = ((unint64_t)(unsigned __int16)(32 - __clz(a4)) + 7) >> 3;
  if (!a2)
  {
    unint64_t v6 = v4;
    unint64_t v4 = 0;
    goto LABEL_12;
  }
  if (!a3)
  {
    unint64_t v6 = v4;
LABEL_11:
    unint64_t v4 = a3;
    goto LABEL_12;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    if (a4)
    {
      uint64_t v5 = 0;
      unint64_t v6 = v4 - 1;
      do
      {
        *(unsigned char *)(a2 + v5) = a4 >> (8 * (v6 & 1));
        if (a3 - 1 == v5) {
          goto LABEL_11;
        }
        ++v5;
      }
      while (--v6 != -1);
    }
    unint64_t v6 = 0;
LABEL_12:
    *(_WORD *)uint64_t result = a4;
    *(void *)(result + 8) = v6;
    return v4;
  }
  __break(1u);
  return result;
}

unint64_t sub_25E65DB78(unint64_t result, uint64_t a2, unint64_t a3, unsigned int a4)
{
  unint64_t v4 = 32 - __clz(a4) + 7;
  unint64_t v5 = v4 >> 3;
  if (!a2)
  {
    unint64_t v7 = v4 >> 3;
    unint64_t v5 = 0;
    goto LABEL_12;
  }
  if (!a3)
  {
    unint64_t v7 = v4 >> 3;
LABEL_11:
    unint64_t v5 = a3;
    goto LABEL_12;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    if (a4)
    {
      uint64_t v6 = 0;
      unint64_t v7 = v5 - 1;
      char v8 = (v4 & 0xF8) - 8;
      do
      {
        *(unsigned char *)(a2 + v6) = a4 >> (v8 & 0x18);
        if (a3 - 1 == v6) {
          goto LABEL_11;
        }
        ++v6;
        --v7;
        v8 -= 8;
      }
      while (v7 != -1);
    }
    unint64_t v7 = 0;
LABEL_12:
    *(_DWORD *)uint64_t result = a4;
    *(void *)(result + 8) = v7;
    return v5;
  }
  __break(1u);
  return result;
}

unint64_t *sub_25E65DC08(unint64_t *result, uint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v4 = (71 - __clz(a4)) >> 3;
  if (!a2)
  {
    unint64_t v6 = v4;
    unint64_t v4 = 0;
    goto LABEL_12;
  }
  if (!a3)
  {
    unint64_t v6 = v4;
LABEL_11:
    unint64_t v4 = a3;
    goto LABEL_12;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    if (a4)
    {
      uint64_t v5 = 0;
      unint64_t v6 = v4 - 1;
      char v7 = 8 * v4 - 8;
      do
      {
        *(unsigned char *)(a2 + v5) = a4 >> (v7 & 0x38);
        if (a3 - 1 == v5) {
          goto LABEL_11;
        }
        ++v5;
        --v6;
        v7 -= 8;
      }
      while (v6 != -1);
    }
    unint64_t v6 = 0;
LABEL_12:
    *uint64_t result = a4;
    result[1] = v6;
    return (unint64_t *)v4;
  }
  __break(1u);
  return result;
}

uint64_t sub_25E65DC90(uint64_t result, uint64_t a2, int64_t a3, int64_t a4, int64_t a5, unsigned __int8 a6)
{
  if (!a2)
  {
    a3 = 0;
LABEL_24:
    int64_t v16 = a4;
LABEL_26:
    *(void *)uint64_t result = a4;
    *(void *)(result + 8) = a5;
    *(unsigned char *)(result + 16) = a6;
    *(void *)(result + 24) = v16;
    return a3;
  }
  if (!a3) {
    goto LABEL_24;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    uint64_t v6 = 0;
    int64_t v7 = ((unint64_t)(32 - __clz(a6)) + 7) >> 3;
    if (a5 >= a4) {
      int64_t v8 = a4;
    }
    else {
      int64_t v8 = a5;
    }
    uint64_t v9 = 8 * a4;
    unint64_t v10 = (a4 << 59) - 0x800000000000000;
    int64_t v11 = a4;
    while (!__OFSUB__(v11, a5))
    {
      if (v11 == a5)
      {
        int64_t v16 = a5;
        a3 = a4 - a5;
        goto LABEL_26;
      }
      int64_t v12 = v11;
      if (v8 == v11) {
        goto LABEL_28;
      }
      if ((unint64_t)(v11 - 0x1000000000000001) >> 61 != 7) {
        goto LABEL_29;
      }
      v9 -= 8;
      if (v9 < -128) {
        goto LABEL_30;
      }
      if (v9 > 127) {
        goto LABEL_31;
      }
      if (v7 < a4) {
        goto LABEL_32;
      }
      BOOL v13 = __OFSUB__(v11--, 1);
      if (v12 - 1 < 0 != v13) {
        goto LABEL_32;
      }
      if (v10) {
        unsigned __int8 v14 = 0;
      }
      else {
        unsigned __int8 v14 = a6;
      }
      BOOL v15 = v10 > 0x800000000000000;
      v10 -= 0x800000000000000;
      if (v15) {
        unsigned __int8 v14 = 0;
      }
      *(unsigned char *)(a2 + v6++) = v14;
      if (a3 == v6)
      {
        int64_t v16 = v12 - 1;
        goto LABEL_26;
      }
    }
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_25E65DDB4(uint64_t result, uint64_t a2, int64_t a3, int64_t a4, int64_t a5, int a6)
{
  if (!a2)
  {
LABEL_26:
    a3 = 0;
LABEL_27:
    int64_t v16 = a4;
LABEL_29:
    *(void *)uint64_t result = a4;
    *(void *)(result + 8) = a5;
    *(_WORD *)(result + 16) = a6;
    *(void *)(result + 24) = v16;
    return a3;
  }
  if (!a3) {
    goto LABEL_27;
  }
  if (a3 < 0) {
    goto LABEL_35;
  }
  uint64_t v6 = 0;
  int64_t v7 = ((unint64_t)(unsigned __int16)(32 - __clz((unsigned __int16)a6)) + 7) >> 3;
  if (a5 >= a4) {
    int64_t v8 = a4;
  }
  else {
    int64_t v8 = a5;
  }
  uint64_t v9 = 8 * a4 - 8;
  unint64_t v10 = (a4 << 51) - 0x18000000000001;
  unint64_t v11 = (a4 << 51) - 0x8000000000000;
  int64_t v12 = a4;
  while (!__OFSUB__(v12, a5))
  {
    if (v12 == a5)
    {
      int64_t v16 = a5;
      a3 = a4 - a5;
      goto LABEL_29;
    }
    int64_t v13 = v12;
    if (v8 == v12) {
      goto LABEL_31;
    }
    if ((unint64_t)(v12 - 0x1000000000000001) >> 61 != 7) {
      goto LABEL_32;
    }
    if (v9 < -32768) {
      goto LABEL_33;
    }
    if (v9 >= 0x8000) {
      goto LABEL_34;
    }
    if (v10 <= 0xFFDFFFFFFFFFFFFELL)
    {
LABEL_15:
      LOBYTE(v14) = 0;
      if (v7 < a4) {
        goto LABEL_25;
      }
      goto LABEL_20;
    }
    if ((v11 & 0x8000000000000000) != 0)
    {
      if (v11 <= 0xFFF0000000000000) {
        goto LABEL_15;
      }
      int v14 = a6 << (-BYTE6(v11) & 8);
      if (v7 < a4)
      {
LABEL_25:
        __break(1u);
        goto LABEL_26;
      }
    }
    else
    {
      if (v11 >> 52) {
        goto LABEL_15;
      }
      int v14 = (unsigned __int16)a6 >> (v9 & 8);
      if (v7 < a4) {
        goto LABEL_25;
      }
    }
LABEL_20:
    BOOL v15 = __OFSUB__(v12--, 1);
    if (v13 - 1 < 0 != v15) {
      goto LABEL_25;
    }
    *(unsigned char *)(a2 + v6) = v14;
    v9 -= 8;
    v10 -= 0x8000000000000;
    v11 -= 0x8000000000000;
    if (a3 == ++v6)
    {
      int64_t v16 = v13 - 1;
      goto LABEL_29;
    }
  }
  __break(1u);
LABEL_31:
  __break(1u);
LABEL_32:
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
  return result;
}

uint64_t sub_25E65DF44(uint64_t result, uint64_t a2, int64_t a3, int64_t a4, int64_t a5, unsigned int a6)
{
  if (!a2)
  {
    a3 = 0;
LABEL_30:
    int64_t v15 = a4;
LABEL_32:
    *(void *)uint64_t result = a4;
    *(void *)(result + 8) = a5;
    *(_DWORD *)(result + 16) = a6;
    *(void *)(result + 24) = v15;
    return a3;
  }
  if (!a3) {
    goto LABEL_30;
  }
  if (a3 < 0) {
    goto LABEL_39;
  }
  uint64_t v6 = 0;
  int64_t v7 = ((unint64_t)(32 - __clz(a6)) + 7) >> 3;
  if (a5 >= a4) {
    int64_t v8 = a4;
  }
  else {
    int64_t v8 = a5;
  }
  uint64_t v9 = 8 * a4 - 8;
  int64_t v10 = a4;
  uint64_t v11 = (a4 << 35) - 0x800000000;
  while (!__OFSUB__(v10, a5))
  {
    if (v10 == a5)
    {
      int64_t v15 = a5;
      a3 = a4 - a5;
      goto LABEL_32;
    }
    int64_t v12 = v10;
    if (v8 == v10) {
      goto LABEL_34;
    }
    if ((unint64_t)(v10 - 0x1000000000000001) >> 61 != 7) {
      goto LABEL_35;
    }
    if (v9 < (uint64_t)0xFFFFFFFF80000000) {
      goto LABEL_36;
    }
    if (v9 > 0x7FFFFFFF) {
      goto LABEL_37;
    }
    if (v11 < (uint64_t)0xFFFFFFE000000000)
    {
LABEL_15:
      LOBYTE(v13) = 0;
      if (v7 < a4) {
        goto LABEL_38;
      }
      goto LABEL_24;
    }
    if (v11 > 0x2000000000)
    {
LABEL_18:
      LOBYTE(v13) = 0;
      if (v7 < a4) {
        goto LABEL_38;
      }
      goto LABEL_24;
    }
    if (v11 < 0)
    {
      if ((unint64_t)v11 <= 0xFFFFFFE000000000) {
        goto LABEL_15;
      }
      unsigned int v13 = a6 << (-BYTE4(v11) & 0x18);
    }
    else
    {
      if ((unint64_t)v11 >> 37) {
        goto LABEL_18;
      }
      unsigned int v13 = a6 >> (v9 & 0x18);
    }
    if (v7 < a4) {
      goto LABEL_38;
    }
LABEL_24:
    BOOL v14 = __OFSUB__(v10--, 1);
    if (v12 - 1 < 0 != v14) {
      goto LABEL_38;
    }
    *(unsigned char *)(a2 + v6) = v13;
    v9 -= 8;
    v11 -= 0x800000000;
    if (a3 == ++v6)
    {
      int64_t v15 = v12 - 1;
      goto LABEL_32;
    }
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
  return result;
}

int64_t *sub_25E65E0D4(int64_t *result, uint64_t a2, int64_t a3, int64_t a4, int64_t a5, unint64_t a6)
{
  if (!a2)
  {
    a3 = 0;
LABEL_28:
    int64_t v15 = a4;
LABEL_30:
    *uint64_t result = a4;
    result[1] = a5;
    result[2] = a6;
    result[3] = v15;
    return (int64_t *)a3;
  }
  if (!a3) {
    goto LABEL_28;
  }
  if (a3 < 0) {
    goto LABEL_35;
  }
  uint64_t v6 = 0;
  int64_t v7 = (71 - __clz(a6)) >> 3;
  if (a5 >= a4) {
    int64_t v8 = a4;
  }
  else {
    int64_t v8 = a5;
  }
  char v9 = 8 - 8 * a4;
  uint64_t v10 = 8 * a4 - 8;
  int64_t v11 = a4;
  while (!__OFSUB__(v11, a5))
  {
    if (v11 == a5)
    {
      int64_t v15 = a5;
      a3 = a4 - a5;
      goto LABEL_30;
    }
    int64_t v12 = v11;
    if (v8 == v11) {
      goto LABEL_32;
    }
    if ((unint64_t)(v11 - 0x1000000000000001) >> 61 != 7) {
      goto LABEL_33;
    }
    if (v10 < -64)
    {
LABEL_13:
      LOBYTE(v13) = 0;
      if (v7 < a4) {
        goto LABEL_34;
      }
      goto LABEL_22;
    }
    if (v10 > 64)
    {
LABEL_16:
      LOBYTE(v13) = 0;
      if (v7 < a4) {
        goto LABEL_34;
      }
      goto LABEL_22;
    }
    if (v10 < 0)
    {
      if ((unint64_t)v10 <= 0xFFFFFFFFFFFFFFC0) {
        goto LABEL_13;
      }
      unint64_t v13 = a6 << (v9 & 0x38);
    }
    else
    {
      if ((unint64_t)v10 >= 0x40) {
        goto LABEL_16;
      }
      unint64_t v13 = a6 >> (v10 & 0x38);
    }
    if (v7 < a4) {
      goto LABEL_34;
    }
LABEL_22:
    BOOL v14 = __OFSUB__(v11--, 1);
    if (v12 - 1 < 0 != v14) {
      goto LABEL_34;
    }
    *(unsigned char *)(a2 + v6) = v13;
    v9 += 8;
    v10 -= 8;
    if (a3 == ++v6)
    {
      int64_t v15 = v12 - 1;
      goto LABEL_30;
    }
  }
  __break(1u);
LABEL_32:
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
  return result;
}

uint64_t sub_25E65E21C(uint64_t result, uint64_t a2, int64_t a3, int64_t a4, int64_t a5, unsigned __int8 a6)
{
  if (!a2)
  {
    a3 = 0;
LABEL_22:
    uint64_t v12 = a4;
LABEL_24:
    *(void *)uint64_t result = a4;
    *(void *)(result + 8) = a5;
    *(unsigned char *)(result + 16) = a6;
    *(void *)(result + 24) = v12;
    return a3;
  }
  if (!a3) {
    goto LABEL_22;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    uint64_t v6 = 0;
    int64_t v7 = ((unint64_t)(32 - __clz(a6)) + 7) >> 3;
    if (a5 >= a4) {
      int64_t v8 = a4;
    }
    else {
      int64_t v8 = a5;
    }
    unint64_t v9 = 8 * a4;
    uint64_t v10 = a4;
    while (!__OFSUB__(v10, a5))
    {
      if (v10 == a5)
      {
        uint64_t v12 = a5;
        a3 = a4 - a5;
        goto LABEL_24;
      }
      if (v8 == v10) {
        goto LABEL_26;
      }
      if ((unint64_t)(v10 - 0x1000000000000001) >> 61 != 7) {
        goto LABEL_27;
      }
      v9 -= 8;
      if ((v9 & 0x8000000000000000) != 0) {
        goto LABEL_28;
      }
      if (v9 > 0xFF) {
        goto LABEL_29;
      }
      if (v7 < a4) {
        goto LABEL_30;
      }
      uint64_t v11 = v10 - 1;
      if (v10 < 1) {
        goto LABEL_30;
      }
      uint64_t v12 = v10 - 1;
      if (((v10 - 1) & 0x1F) != 0) {
        unsigned __int8 v13 = 0;
      }
      else {
        unsigned __int8 v13 = a6;
      }
      *(unsigned char *)(a2 + v6) = v13;
      uint64_t v10 = v11;
      if (a3 == ++v6) {
        goto LABEL_24;
      }
    }
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_25E65E31C(uint64_t result, uint64_t a2, int64_t a3, int64_t a4, int64_t a5, unsigned __int16 a6)
{
  if (!a2)
  {
    a3 = 0;
LABEL_21:
    uint64_t v12 = a4;
LABEL_23:
    *(void *)uint64_t result = a4;
    *(void *)(result + 8) = a5;
    *(_WORD *)(result + 16) = a6;
    *(void *)(result + 24) = v12;
    return a3;
  }
  if (!a3) {
    goto LABEL_21;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    uint64_t v6 = 0;
    int64_t v7 = ((unint64_t)(unsigned __int16)(32 - __clz(a6)) + 7) >> 3;
    if (a5 >= a4) {
      int64_t v8 = a4;
    }
    else {
      int64_t v8 = a5;
    }
    unint64_t v9 = 8 * a4 - 8;
    uint64_t v10 = a4;
    while (!__OFSUB__(v10, a5))
    {
      if (v10 == a5)
      {
        uint64_t v12 = a5;
        a3 = a4 - a5;
        goto LABEL_23;
      }
      if (v8 == v10) {
        goto LABEL_25;
      }
      if ((unint64_t)(v10 - 0x1000000000000001) >> 61 != 7) {
        goto LABEL_26;
      }
      if ((v9 & 0x8000000000000000) != 0) {
        goto LABEL_27;
      }
      if (v9 >> 16) {
        goto LABEL_28;
      }
      if (v7 < a4) {
        goto LABEL_29;
      }
      uint64_t v11 = v10 - 1;
      if (v10 < 1) {
        goto LABEL_29;
      }
      uint64_t v12 = v10 - 1;
      int v13 = a6 >> (v9 & 8);
      if ((v12 & 0x1FFE) != 0) {
        LOBYTE(v13) = 0;
      }
      *(unsigned char *)(a2 + v6) = v13;
      v9 -= 8;
      uint64_t v10 = v11;
      if (a3 == ++v6) {
        goto LABEL_23;
      }
    }
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_25E65E42C(uint64_t result, uint64_t a2, int64_t a3, int64_t a4, int64_t a5, unsigned int a6)
{
  if (!a2)
  {
    a3 = 0;
LABEL_21:
    uint64_t v12 = a4;
LABEL_23:
    *(void *)uint64_t result = a4;
    *(void *)(result + 8) = a5;
    *(_DWORD *)(result + 16) = a6;
    *(void *)(result + 24) = v12;
    return a3;
  }
  if (!a3) {
    goto LABEL_21;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    uint64_t v6 = 0;
    int64_t v7 = ((unint64_t)(32 - __clz(a6)) + 7) >> 3;
    if (a5 >= a4) {
      int64_t v8 = a4;
    }
    else {
      int64_t v8 = a5;
    }
    unint64_t v9 = 8 * a4 - 8;
    uint64_t v10 = a4;
    while (!__OFSUB__(v10, a5))
    {
      if (v10 == a5)
      {
        uint64_t v12 = a5;
        a3 = a4 - a5;
        goto LABEL_23;
      }
      if (v8 == v10) {
        goto LABEL_25;
      }
      if ((unint64_t)(v10 - 0x1000000000000001) >> 61 != 7) {
        goto LABEL_26;
      }
      if ((v9 & 0x8000000000000000) != 0) {
        goto LABEL_27;
      }
      if (HIDWORD(v9)) {
        goto LABEL_28;
      }
      if (v7 < a4) {
        goto LABEL_29;
      }
      uint64_t v11 = v10 - 1;
      if (v10 < 1) {
        goto LABEL_29;
      }
      uint64_t v12 = v10 - 1;
      unsigned int v13 = a6 >> (v9 & 0x18);
      if ((v12 & 0x1FFFFFFC) != 0) {
        LOBYTE(v13) = 0;
      }
      *(unsigned char *)(a2 + v6) = v13;
      v9 -= 8;
      uint64_t v10 = v11;
      if (a3 == ++v6) {
        goto LABEL_23;
      }
    }
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
  }
  __break(1u);
  return result;
}

int64_t *sub_25E65E530(int64_t *result, uint64_t a2, int64_t a3, int64_t a4, int64_t a5, unint64_t a6)
{
  if (!a2)
  {
    a3 = 0;
LABEL_20:
    int64_t v14 = a4;
LABEL_22:
    *uint64_t result = a4;
    result[1] = a5;
    result[2] = a6;
    result[3] = v14;
    return (int64_t *)a3;
  }
  if (!a3) {
    goto LABEL_20;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    uint64_t v6 = 0;
    int64_t v7 = (71 - __clz(a6)) >> 3;
    if (a5 >= a4) {
      int64_t v8 = a4;
    }
    else {
      int64_t v8 = a5;
    }
    unint64_t v9 = 8 * a4 - 8;
    int64_t v10 = a4;
    while (!__OFSUB__(v10, a5))
    {
      if (v10 == a5)
      {
        int64_t v14 = a5;
        a3 = a4 - a5;
        goto LABEL_22;
      }
      int64_t v11 = v10;
      if (v8 == v10) {
        goto LABEL_24;
      }
      if ((unint64_t)(v10 - 0x1000000000000001) >> 61 != 7) {
        goto LABEL_25;
      }
      if ((v9 & 0x8000000000000000) != 0) {
        goto LABEL_26;
      }
      if (v7 < a4) {
        goto LABEL_27;
      }
      BOOL v12 = __OFSUB__(v10--, 1);
      if (v11 - 1 < 0 != v12) {
        goto LABEL_27;
      }
      unint64_t v13 = a6 >> (v9 & 0x38);
      if (v9 >= 0x40) {
        LOBYTE(v13) = 0;
      }
      *(unsigned char *)(a2 + v6) = v13;
      v9 -= 8;
      if (a3 == ++v6)
      {
        int64_t v14 = v11 - 1;
        goto LABEL_22;
      }
    }
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_25E65E628(uint64_t result, uint64_t a2, uint64_t a3, unsigned int a4)
{
  if (a2 < result || a3 >= result)
  {
    __break(1u);
    goto LABEL_13;
  }
  if ((unint64_t)(result - 0x1000000000000001) >> 61 != 7)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v4 = 8 * (result - 1);
  if (v4 < -128)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (v4 > 127)
  {
LABEL_15:
    __break(1u);
    return result;
  }
  unint64_t v5 = (result - 1) << 59;
  if (v5) {
    a4 = 0;
  }
  if (v5 <= 0x800000000000000) {
    return a4;
  }
  else {
    return 0;
  }
}

unint64_t sub_25E65E690@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, int64_t a5@<X8>)
{
  if (a2 < a1 || a3 >= a1)
  {
    __break(1u);
    goto LABEL_12;
  }
  a5 = (unint64_t)(a1 - 0x1000000000000001) >> 61;
  if (a5 != 7)
  {
LABEL_12:
    __break(1u);
LABEL_13:
    uint64_t v7 = a4 << ((8 - v5) & 0x38);
    if ((unint64_t)a5 <= 0xFFFFFFFFFFFFFFC0) {
      return 0;
    }
    else {
      return v7;
    }
  }
  char v5 = 8 * a1;
  a5 = 8 * a1 - 8;
  if (a5 < -64) {
    return 0;
  }
  if (a5 > 64) {
    return 0;
  }
  if (a5 < 0) {
    goto LABEL_13;
  }
  if ((unint64_t)a5 >= 0x40) {
    return 0;
  }
  return a4 >> (a5 & 0x38);
}

uint64_t sub_25E65E718(uint64_t result, uint64_t a2, uint64_t a3, unsigned int a4)
{
  if (a2 < result || a3 >= result)
  {
    __break(1u);
    goto LABEL_10;
  }
  if ((unint64_t)(result - 0x1000000000000001) >> 61 != 7)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v4 = 8 * result - 8;
  if ((v4 & 0x8000000000000000) != 0)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (v4 > 0xFF)
  {
LABEL_12:
    __break(1u);
    return result;
  }
  if ((v4 & 0xF8) != 0) {
    return 0;
  }
  else {
    return a4;
  }
}

uint64_t sub_25E65E76C(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a2 < result || a3 >= result)
  {
    __break(1u);
    goto LABEL_9;
  }
  if ((unint64_t)(result - 0x1000000000000001) >> 61 != 7)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  unint64_t v4 = 8 * result - 8;
  if ((v4 & 0x8000000000000000) != 0)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  if (v4 >= 0x40) {
    return 0;
  }
  else {
    return (a4 >> (v4 & 0x38));
  }
}

void sub_25E65E7BC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v5 = a4 >> 1;
  uint64_t v6 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v7 = *v4;
  int64_t v8 = *((void *)*v4 + 2);
  int64_t v9 = v8 + v6;
  if (__OFADD__(v8, v6))
  {
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > *((void *)v7 + 3) >> 1) {
    goto LABEL_8;
  }
  if (v5 == a3)
  {
    while (v6 > 0)
    {
      __break(1u);
LABEL_8:
      if (v8 <= v9) {
        int64_t v13 = v8 + v6;
      }
      else {
        int64_t v13 = v8;
      }
      char isUniquelyReferenced_nonNull_native = sub_25E64ED68(isUniquelyReferenced_nonNull_native, v13, 1, v7);
      uint64_t v7 = isUniquelyReferenced_nonNull_native;
      if (v5 != a3) {
        goto LABEL_12;
      }
    }
    goto LABEL_16;
  }
LABEL_12:
  uint64_t v14 = *((void *)v7 + 2);
  if ((*((void *)v7 + 3) >> 1) - v14 < v6) {
    goto LABEL_19;
  }
  memcpy(&v7[8 * v14 + 32], (const void *)(a2 + 8 * a3), 8 * v6);
  if (v6 <= 0)
  {
LABEL_16:
    *unint64_t v4 = v7;
    return;
  }
  uint64_t v15 = *((void *)v7 + 2);
  BOOL v16 = __OFADD__(v15, v6);
  uint64_t v17 = v15 + v6;
  if (!v16)
  {
    *((void *)v7 + 2) = v17;
    goto LABEL_16;
  }
LABEL_20:
  __break(1u);
}

void sub_25E65E8B4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v5 = a4 >> 1;
  int64_t v6 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v7 = *v4;
  int64_t v8 = *((void *)*v4 + 2);
  int64_t v9 = v8 + v6;
  if (__OFADD__(v8, v6))
  {
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > *((void *)v7 + 3) >> 1) {
    goto LABEL_8;
  }
  if (v5 == a3)
  {
    while (v6 > 0)
    {
      __break(1u);
LABEL_8:
      if (v8 <= v9) {
        int64_t v13 = v8 + v6;
      }
      else {
        int64_t v13 = v8;
      }
      char isUniquelyReferenced_nonNull_native = sub_25E64EE6C(isUniquelyReferenced_nonNull_native, v13, 1, v7);
      uint64_t v7 = isUniquelyReferenced_nonNull_native;
      if (v5 != a3) {
        goto LABEL_12;
      }
    }
    goto LABEL_16;
  }
LABEL_12:
  uint64_t v14 = *((void *)v7 + 2);
  if ((*((void *)v7 + 3) >> 1) - v14 < v6) {
    goto LABEL_19;
  }
  memcpy(&v7[v14 + 32], (const void *)(a2 + a3), v6);
  if (v6 <= 0)
  {
LABEL_16:
    *unint64_t v4 = v7;
    return;
  }
  uint64_t v15 = *((void *)v7 + 2);
  BOOL v16 = __OFADD__(v15, v6);
  uint64_t v17 = v15 + v6;
  if (!v16)
  {
    *((void *)v7 + 2) = v17;
    goto LABEL_16;
  }
LABEL_20:
  __break(1u);
}

unint64_t sub_25E65E9B0()
{
  unint64_t result = qword_26A6FE6A8;
  if (!qword_26A6FE6A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6FE6A8);
  }
  return result;
}

ValueMetadata *type metadata accessor for ASN1Any()
{
  return &type metadata for ASN1Any;
}

void sub_25E65EA14()
{
  uint64_t v1 = v0[2];
  unint64_t v2 = v0[3];
  uint64_t v3 = v2 >> 1;
  if (v1 == v2 >> 1) {
    goto LABEL_2;
  }
  if (v1 >= (uint64_t)(v2 >> 1))
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v9 = v0[1];
  int v10 = *(char *)(v9 + v1);
  uint64_t v11 = v0[2];
  if (v10 < 0)
  {
    uint64_t v11 = v1 + 1;
    if (v1 + 1 == v3)
    {
LABEL_2:
      sub_25E64EBC8();
      swift_allocError();
      unint64_t v5 = v4;
      uint64_t v6 = 0xD000000000000026;
      uint64_t v7 = 0x800000025E66BFF0;
      uint64_t v8 = 275;
LABEL_17:
      static ASN1Error.invalidASN1Object(reason:file:line:)(v6, v7, (uint64_t)"SwiftASN1/ObjectIdentifier.swift", 32, 2, v8, v5);
      swift_willThrow();
      return;
    }
    while (v11 < v3)
    {
      if ((*(char *)(v9 + v11) & 0x80000000) == 0) {
        goto LABEL_5;
      }
      uint64_t v15 = v11 + 1;
      if (__OFADD__(v11, 1)) {
        goto LABEL_19;
      }
      ++v11;
      if (v15 == v3) {
        goto LABEL_2;
      }
    }
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
LABEL_5:
  uint64_t v12 = v11 + 1;
  if (v11 + 1 < v1)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if (v11 >= -1)
  {
    if (v10 != -128 && v1 != v12)
    {
      unint64_t v13 = v0[3] & 1 | (2 * v12);
      v0[2] = v12;
      uint64_t v14 = swift_unknownObjectRetain();
      sub_25E65FCA8(v14, v9, v1, v13);
      return;
    }
    sub_25E64EBC8();
    swift_allocError();
    uint64_t v6 = 0xD00000000000002DLL;
    unint64_t v5 = v16;
    uint64_t v7 = 0x800000025E66C020;
    uint64_t v8 = 283;
    goto LABEL_17;
  }
LABEL_22:
  __break(1u);
}

void static ASN1ObjectIdentifier.defaultIdentifier.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 6;
  *(unsigned char *)(a1 + 8) = 0;
}

uint64_t ASN1ObjectIdentifier.init(derEncoded:withIdentifier:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char **a3@<X8>)
{
  uint64_t v4 = *(void *)(result + 16);
  unint64_t v5 = *(void *)(result + 24);
  int64_t v6 = *(void *)(result + 32);
  unint64_t v7 = *(void *)(result + 40);
  unint64_t v8 = *(void *)(result + 48);
  unint64_t v9 = *(unsigned __int8 *)(result + 56);
  uint64_t v10 = *(void *)(result + 64);
  if (*(void *)result != *(void *)a2 || *(unsigned __int8 *)(result + 8) != *(unsigned __int8 *)(a2 + 8))
  {
    sub_25E64EBC8();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ObjectIdentifier.swift", 32, 2, 38, v18);
    j__swift_unknownObjectRelease(v4, v5, v6, v7, v8, v9);
    swift_unknownObjectRelease();
    return swift_willThrow();
  }
  if (!*(unsigned char *)(result + 56))
  {
    __break(1u);
    return result;
  }
  uint64_t v11 = v3;
  uint64_t v12 = swift_unknownObjectRetain();
  j__swift_unknownObjectRelease(v12, v5, v6, v7, v8, 1);
  swift_unknownObjectRelease();
  int64_t v28 = v6;
  unint64_t v29 = v7;
  uint64_t v13 = (v7 >> 1) - v6;
  if (!__OFSUB__(v7 >> 1, v6))
  {
    unint64_t v7 = MEMORY[0x263F8EE78];
    if (v13 < 1)
    {
      int64_t v6 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_17:
      unint64_t v19 = sub_25E64ED68(0, v6 + 1, 0, MEMORY[0x263F8EE78]);
      uint64_t v3 = v19;
      uint64_t v20 = *(void *)(v7 + 16);
      if (!v20)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        sub_25E64EBC8();
        swift_allocError();
        static ASN1Error.invalidASN1Object(reason:file:line:)(0xD000000000000016, 0x800000025E66BFD0, (uint64_t)"SwiftASN1/ObjectIdentifier.swift", 32, 2, 79, v23);
        swift_willThrow();
        swift_unknownObjectRelease();
        return swift_bridgeObjectRelease_n();
      }
      unint64_t v8 = *(void *)(v7 + 32);
      unint64_t v25 = (2 * v20) | 1;
      uint64_t v26 = v7 + 32;
      unint64_t v9 = v8 / 0x28;
      uint64_t v10 = 40;
      unint64_t v5 = *((void *)v19 + 2);
      unint64_t v24 = *((void *)v19 + 3);
      int64_t v21 = v24 >> 1;
      int64_t v6 = v5 + 1;
      swift_bridgeObjectRetain();
      if (v24 >> 1 > v5) {
        goto LABEL_19;
      }
      goto LABEL_25;
    }
    while (1)
    {
      uint64_t v3 = v11;
      sub_25E65EA14();
      if (v11)
      {
        swift_bridgeObjectRelease();
        return swift_unknownObjectRelease();
      }
      uint64_t v15 = v14;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v7 = (unint64_t)sub_25E64ED68(0, *(void *)(v7 + 16) + 1, 1, (char *)v7);
      }
      unint64_t v17 = *(void *)(v7 + 16);
      unint64_t v16 = *(void *)(v7 + 24);
      int64_t v6 = v17 + 1;
      if (v17 >= v16 >> 1) {
        unint64_t v7 = (unint64_t)sub_25E64ED68((char *)(v16 > 1), v17 + 1, 1, (char *)v7);
      }
      *(void *)(v7 + 16) = v6;
      *(void *)(v7 + 8 * v17 + 32) = v15;
      if (__OFSUB__(v29 >> 1, v28)) {
        break;
      }
      if ((uint64_t)((v29 >> 1) - v28) <= 0) {
        goto LABEL_17;
      }
    }
    __break(1u);
  }
  __break(1u);
LABEL_25:
  uint64_t v3 = sub_25E64ED68((char *)(v24 > 1), v6, 1, v3);
  unint64_t v24 = *((void *)v3 + 3);
  int64_t v21 = v24 >> 1;
LABEL_19:
  uint64_t v22 = v8 - v9 * v10;
  *((void *)v3 + 2) = v6;
  *(void *)&v3[8 * v5 + 32] = v9;
  if (v21 < (uint64_t)(v5 + 2)) {
    uint64_t v3 = sub_25E64ED68((char *)(v24 > 1), v5 + 2, 1, v3);
  }
  *((void *)v3 + 2) = v5 + 2;
  *(void *)&v3[8 * v6 + 32] = v22;
  sub_25E65E7BC(v7, v26, 1, v25);
  swift_unknownObjectRelease();
  unint64_t result = swift_bridgeObjectRelease_n();
  *a3 = v3;
  return result;
}

uint64_t ASN1ObjectIdentifier.serialize(into:withIdentifier:)(char **a1, uint64_t a2)
{
  char v2 = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void *)a2;
  char v5 = v2;
  return sub_25E6504FC(&v4, 0, a1, (uint64_t (*)(char **))sub_25E65295C);
}

uint64_t sub_25E65EFD8(uint64_t a1, void *a2)
{
  uint64_t v2 = a2[2];
  if (!v2)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (v2 == 1)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  unint64_t v4 = a2[4];
  if (!is_mul_ok(v4, 0x28uLL))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v5 = 40 * v4;
  uint64_t v6 = a2[5];
  unint64_t v7 = v5 + v6;
  if (!__CFADD__(v5, v6))
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_25E65F0B0(v7);
    uint64_t v9 = v2 - 2;
    if (!v9) {
      return swift_bridgeObjectRelease();
    }
    uint64_t v10 = 0;
    while (v9 != v10)
    {
      uint64_t result = sub_25E65F0B0(a2[v10++ + 6]);
      if (v9 == v10) {
        return swift_unknownObjectRelease();
      }
    }
    __break(1u);
    goto LABEL_12;
  }
LABEL_15:
  __break(1u);
  return result;
}

uint64_t sub_25E65F0B0(unint64_t a1)
{
  if (a1)
  {
    unint64_t v3 = __clz(a1);
    unint64_t v4 = *v1;
    if (v3 - 57 >= 7)
    {
      uint64_t v5 = (((37 * (70 - v3)) >> 8)
          + (((70 - v3 - ((unsigned __int16)(37 * (70 - v3)) >> 8)) & 0xFE) >> 1)) >> 2;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v4 = sub_25E64EE6C(0, *((void *)v4 + 2) + 1, 1, v4);
      }
      uint64_t v6 = 7 * v5 - 7;
      uint64_t v7 = v5;
      while (v7 <= v5)
      {
        unint64_t v9 = *((void *)v4 + 2);
        unint64_t v8 = *((void *)v4 + 3);
        if (v9 >= v8 >> 1) {
          unint64_t v4 = sub_25E64EE6C((char *)(v8 > 1), v9 + 1, 1, v4);
        }
        --v7;
        *((void *)v4 + 2) = v9 + 1;
        v4[v9 + 32] = (a1 >> v6) | 0x80;
        v6 -= 7;
        if (v7 == 1) {
          goto LABEL_17;
        }
      }
      __break(1u);
LABEL_17:
      *uint64_t v1 = v4;
    }
    char v14 = a1 & 0x7F;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_25E64EE6C(0, *((void *)v4 + 2) + 1, 1, v4);
      unint64_t v4 = (char *)result;
    }
    unint64_t v12 = *((void *)v4 + 2);
    unint64_t v15 = *((void *)v4 + 3);
    unint64_t v13 = v12 + 1;
    if (v12 >= v15 >> 1)
    {
      uint64_t result = (uint64_t)sub_25E64EE6C((char *)(v15 > 1), v12 + 1, 1, v4);
      unint64_t v4 = (char *)result;
    }
  }
  else
  {
    unint64_t v4 = *v1;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_25E64EE6C(0, *((void *)v4 + 2) + 1, 1, v4);
      unint64_t v4 = (char *)result;
    }
    unint64_t v12 = *((void *)v4 + 2);
    unint64_t v11 = *((void *)v4 + 3);
    unint64_t v13 = v12 + 1;
    if (v12 >= v11 >> 1)
    {
      uint64_t result = (uint64_t)sub_25E64EE6C((char *)(v11 > 1), v12 + 1, 1, v4);
      unint64_t v4 = (char *)result;
    }
    char v14 = 0;
  }
  *((void *)v4 + 2) = v13;
  v4[v12 + 32] = v14;
  *uint64_t v1 = v4;
  return result;
}

void sub_25E65F2A4(uint64_t a1@<X8>)
{
  *(void *)a1 = 6;
  *(unsigned char *)(a1 + 8) = 0;
}

uint64_t sub_25E65F2B4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, char **a3@<X8>)
{
  char v3 = *((unsigned char *)a2 + 8);
  uint64_t v5 = *a2;
  char v6 = v3;
  return ASN1ObjectIdentifier.init(derEncoded:withIdentifier:)(a1, (uint64_t)&v5, a3);
}

uint64_t sub_25E65F2E8(char **a1, uint64_t a2)
{
  char v2 = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void *)a2;
  char v5 = v2;
  return sub_25E6504FC(&v4, 0, a1, (uint64_t (*)(char **))sub_25E65FF94);
}

uint64_t ASN1ObjectIdentifier.hash(into:)()
{
  uint64_t v1 = *v0;
  uint64_t result = sub_25E6699D0();
  uint64_t v3 = *(void *)(v1 + 16);
  if (v3)
  {
    uint64_t v4 = v1 + 32;
    do
    {
      v4 += 8;
      uint64_t result = sub_25E6699D0();
      --v3;
    }
    while (v3);
  }
  return result;
}

BOOL static ASN1ObjectIdentifier.== infix(_:_:)(void **a1, void **a2)
{
  return sub_25E65F3A4(*a1, *a2);
}

BOOL sub_25E65F3A4(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  if (a1[4] != a2[4]) {
    return 0;
  }
  if (v2 == 1) {
    return 1;
  }
  uint64_t v4 = v2 - 2;
  char v5 = a1 + 5;
  char v6 = a2 + 5;
  do
  {
    uint64_t v8 = *v5++;
    uint64_t v7 = v8;
    uint64_t v10 = *v6++;
    uint64_t v9 = v10;
    BOOL v12 = v4-- != 0;
    BOOL result = v7 == v9;
  }
  while (v7 == v9 && v12);
  return result;
}

uint64_t ASN1ObjectIdentifier.hashValue.getter()
{
  uint64_t v1 = *v0;
  sub_25E6699C0();
  sub_25E6699D0();
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v3 = v1 + 32;
    do
    {
      v3 += 8;
      sub_25E6699D0();
      --v2;
    }
    while (v2);
  }
  return sub_25E669A00();
}

uint64_t sub_25E65F490()
{
  uint64_t v1 = *v0;
  sub_25E6699C0();
  uint64_t v2 = *(void *)(v1 + 16);
  sub_25E6699D0();
  if (v2)
  {
    uint64_t v3 = v1 + 32;
    do
    {
      v3 += 8;
      sub_25E6699D0();
      --v2;
    }
    while (v2);
  }
  return sub_25E669A00();
}

BOOL sub_25E65F4FC(void **a1, void **a2)
{
  return sub_25E65F3A4(*a1, *a2);
}

uint64_t ASN1ObjectIdentifier.init(arrayLiteral:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_25E65F510@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t ASN1ObjectIdentifier.description.getter()
{
  int64_t v1 = *(void *)(*(void *)v0 + 16);
  if (v1)
  {
    uint64_t v11 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_25E65FE50(0, v1, 0);
    uint64_t v2 = 0;
    do
    {
      uint64_t v3 = sub_25E669940();
      uint64_t v5 = v4;
      unint64_t v7 = *(void *)(v11 + 16);
      unint64_t v6 = *(void *)(v11 + 24);
      if (v7 >= v6 >> 1) {
        sub_25E65FE50((char *)(v6 > 1), v7 + 1, 1);
      }
      ++v2;
      *(void *)(v11 + 16) = v7 + 1;
      uint64_t v8 = v11 + 16 * v7;
      *(void *)(v8 + 32) = v3;
      *(void *)(v8 + 40) = v5;
    }
    while (v1 != v2);
    swift_bridgeObjectRelease();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B38DC60);
  sub_25E65FE90();
  uint64_t v9 = sub_25E6695A0();
  swift_bridgeObjectRelease();
  return v9;
}

void sub_25E65F66C()
{
  qword_26A6FE6B0 = (uint64_t)&unk_270B3CFE8;
}

uint64_t static ASN1ObjectIdentifier.NamedCurves.secp256r1.getter@<X0>(void *a1@<X8>)
{
  return sub_25E65FC54(&qword_26A6FE370, &qword_26A6FE6B0, a1);
}

void sub_25E65F6A4()
{
  qword_26A6FE6B8 = (uint64_t)&unk_270B3D040;
}

uint64_t static ASN1ObjectIdentifier.NamedCurves.secp384r1.getter@<X0>(void *a1@<X8>)
{
  return sub_25E65FC54(&qword_26A6FE378, &qword_26A6FE6B8, a1);
}

void sub_25E65F6DC()
{
  qword_26A6FE6C0 = (uint64_t)&unk_270B3D088;
}

uint64_t static ASN1ObjectIdentifier.NamedCurves.secp521r1.getter@<X0>(void *a1@<X8>)
{
  return sub_25E65FC54(&qword_26A6FE380, &qword_26A6FE6C0, a1);
}

void sub_25E65F714()
{
  qword_26A6FE6C8 = (uint64_t)&unk_270B3D0D0;
}

uint64_t static ASN1ObjectIdentifier.AlgorithmIdentifier.idEcPublicKey.getter@<X0>(void *a1@<X8>)
{
  return sub_25E65FC54(&qword_26A6FE388, &qword_26A6FE6C8, a1);
}

void sub_25E65F74C()
{
  qword_26A6FE6D0 = (uint64_t)&unk_270B3D120;
}

uint64_t static ASN1ObjectIdentifier.AlgorithmIdentifier.sha256WithRSAEncryption.getter@<X0>(void *a1@<X8>)
{
  return sub_25E65FC54(&qword_26A6FE390, &qword_26A6FE6D0, a1);
}

void sub_25E65F784()
{
  qword_26A6FE6D8 = (uint64_t)&unk_270B3D178;
}

uint64_t static ASN1ObjectIdentifier.AlgorithmIdentifier.sha384WithRSAEncryption.getter@<X0>(void *a1@<X8>)
{
  return sub_25E65FC54(&qword_26A6FE398, &qword_26A6FE6D8, a1);
}

void sub_25E65F7BC()
{
  qword_26A6FE6E0 = (uint64_t)&unk_270B3D1D0;
}

uint64_t static ASN1ObjectIdentifier.AlgorithmIdentifier.sha512WithRSAEncryption.getter@<X0>(void *a1@<X8>)
{
  return sub_25E65FC54(&qword_26A6FE3A0, &qword_26A6FE6E0, a1);
}

void sub_25E65F7F4()
{
  qword_26A6FE6E8 = (uint64_t)&unk_270B3D228;
}

uint64_t static ASN1ObjectIdentifier.AlgorithmIdentifier.rsaPSS.getter@<X0>(void *a1@<X8>)
{
  return sub_25E65FC54(&qword_26A6FE3A8, &qword_26A6FE6E8, a1);
}

void sub_25E65F82C()
{
  qword_26A6FE6F0 = (uint64_t)&unk_270B3D280;
}

uint64_t static ASN1ObjectIdentifier.AlgorithmIdentifier.rsaEncryption.getter@<X0>(void *a1@<X8>)
{
  return sub_25E65FC54(&qword_26A6FE3B0, &qword_26A6FE6F0, a1);
}

void sub_25E65F864()
{
  qword_26A6FE6F8 = (uint64_t)&unk_270B3D2D8;
}

uint64_t static ASN1ObjectIdentifier.NameAttributes.name.getter@<X0>(void *a1@<X8>)
{
  return sub_25E65FC54(&qword_26A6FE3B8, &qword_26A6FE6F8, a1);
}

void sub_25E65F89C()
{
  qword_26A6FE700 = (uint64_t)&unk_270B3D318;
}

uint64_t static ASN1ObjectIdentifier.NameAttributes.surname.getter@<X0>(void *a1@<X8>)
{
  return sub_25E65FC54(&qword_26A6FE3C0, &qword_26A6FE700, a1);
}

void sub_25E65F8D4()
{
  qword_26A6FE708 = (uint64_t)&unk_270B3D358;
}

uint64_t static ASN1ObjectIdentifier.NameAttributes.givenName.getter@<X0>(void *a1@<X8>)
{
  return sub_25E65FC54(&qword_26A6FE3C8, &qword_26A6FE708, a1);
}

void sub_25E65F90C()
{
  qword_26A6FE710 = (uint64_t)&unk_270B3D398;
}

uint64_t static ASN1ObjectIdentifier.NameAttributes.initials.getter@<X0>(void *a1@<X8>)
{
  return sub_25E65FC54(&qword_26A6FE3D0, &qword_26A6FE710, a1);
}

void sub_25E65F944()
{
  qword_26A6FE718 = (uint64_t)&unk_270B3D3D8;
}

uint64_t static ASN1ObjectIdentifier.NameAttributes.generationQualifier.getter@<X0>(void *a1@<X8>)
{
  return sub_25E65FC54(&qword_26A6FE3D8, &qword_26A6FE718, a1);
}

void sub_25E65F97C()
{
  qword_26A6FE720 = (uint64_t)&unk_270B3D418;
}

uint64_t static ASN1ObjectIdentifier.NameAttributes.commonName.getter@<X0>(void *a1@<X8>)
{
  return sub_25E65FC54(&qword_26A6FE3E0, &qword_26A6FE720, a1);
}

void sub_25E65F9B4()
{
  qword_26A6FE728 = (uint64_t)&unk_270B3D458;
}

uint64_t static ASN1ObjectIdentifier.NameAttributes.localityName.getter@<X0>(void *a1@<X8>)
{
  return sub_25E65FC54(&qword_26A6FE3E8, &qword_26A6FE728, a1);
}

void sub_25E65F9EC()
{
  qword_26A6FE730 = (uint64_t)&unk_270B3D498;
}

uint64_t static ASN1ObjectIdentifier.NameAttributes.stateOrProvinceName.getter@<X0>(void *a1@<X8>)
{
  return sub_25E65FC54(&qword_26A6FE3F0, &qword_26A6FE730, a1);
}

void sub_25E65FA24()
{
  qword_26A6FE738 = (uint64_t)&unk_270B3D4D8;
}

uint64_t static ASN1ObjectIdentifier.NameAttributes.organizationName.getter@<X0>(void *a1@<X8>)
{
  return sub_25E65FC54(&qword_26A6FE3F8, &qword_26A6FE738, a1);
}

void sub_25E65FA5C()
{
  qword_26A6FE740 = (uint64_t)&unk_270B3D518;
}

uint64_t static ASN1ObjectIdentifier.NameAttributes.organizationalUnitName.getter@<X0>(void *a1@<X8>)
{
  return sub_25E65FC54(&qword_26A6FE400, &qword_26A6FE740, a1);
}

void sub_25E65FA94()
{
  qword_26A6FE748 = (uint64_t)&unk_270B3D558;
}

uint64_t static ASN1ObjectIdentifier.NameAttributes.title.getter@<X0>(void *a1@<X8>)
{
  return sub_25E65FC54(&qword_26A6FE408, &qword_26A6FE748, a1);
}

void sub_25E65FACC()
{
  qword_26A6FE750 = (uint64_t)&unk_270B3D598;
}

uint64_t static ASN1ObjectIdentifier.NameAttributes.dnQualifier.getter@<X0>(void *a1@<X8>)
{
  return sub_25E65FC54(&qword_26A6FE410, &qword_26A6FE750, a1);
}

void sub_25E65FB04()
{
  qword_26A6FE758 = (uint64_t)&unk_270B3D5D8;
}

uint64_t static ASN1ObjectIdentifier.NameAttributes.countryName.getter@<X0>(void *a1@<X8>)
{
  return sub_25E65FC54(&qword_26A6FE418, &qword_26A6FE758, a1);
}

void sub_25E65FB3C()
{
  qword_26A6FE760 = (uint64_t)&unk_270B3D618;
}

uint64_t static ASN1ObjectIdentifier.NameAttributes.serialNumber.getter@<X0>(void *a1@<X8>)
{
  return sub_25E65FC54(&qword_26A6FE420, &qword_26A6FE760, a1);
}

void sub_25E65FB74()
{
  qword_26A6FE768 = (uint64_t)&unk_270B3D658;
}

uint64_t static ASN1ObjectIdentifier.NameAttributes.pseudonym.getter@<X0>(void *a1@<X8>)
{
  return sub_25E65FC54(&qword_26A6FE428, &qword_26A6FE768, a1);
}

void sub_25E65FBAC()
{
  qword_26A6FE770 = (uint64_t)&unk_270B3D698;
}

uint64_t static ASN1ObjectIdentifier.NameAttributes.domainComponent.getter@<X0>(void *a1@<X8>)
{
  return sub_25E65FC54(&qword_26A6FE430, &qword_26A6FE770, a1);
}

void sub_25E65FBE4()
{
  qword_26A6FE778 = (uint64_t)&unk_270B3D6F0;
}

uint64_t static ASN1ObjectIdentifier.NameAttributes.emailAddress.getter@<X0>(void *a1@<X8>)
{
  return sub_25E65FC54(&qword_26A6FE438, &qword_26A6FE778, a1);
}

void sub_25E65FC1C()
{
  qword_26A6FE780 = (uint64_t)&unk_270B3D748;
}

uint64_t static ASN1ObjectIdentifier.OCSP.basicResponse.getter@<X0>(void *a1@<X8>)
{
  return sub_25E65FC54(&qword_26A6FE440, &qword_26A6FE780, a1);
}

uint64_t sub_25E65FC54@<X0>(void *a1@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  *a3 = *a2;

  return swift_bridgeObjectRetain();
}

void sub_25E65FCA8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  int64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  int64_t v7 = 7 * v5;
  if ((unsigned __int128)(v5 * (__int128)7) >> 64 != (7 * v5) >> 63)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  if (!__OFADD__(v7, 7))
  {
    if (v7 + 7 > 71)
    {
      sub_25E64EBC8();
      swift_allocError();
      static ASN1Error.invalidASN1Object(reason:file:line:)(0xD000000000000021, 0x800000025E66C050, (uint64_t)"SwiftASN1/ObjectIdentifier.swift", 32, 2, 298, v8);
      swift_willThrow();
      swift_unknownObjectRelease();
      return;
    }
    uint64_t v10 = sub_25E653890(0, v7, 7);
    uint64_t v11 = *(void *)(v10 + 16);
    if (!v11)
    {
LABEL_22:
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      return;
    }
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    if (a3 <= v4) {
      uint64_t v14 = v4;
    }
    else {
      uint64_t v14 = a3;
    }
    unint64_t v15 = v14 - a3;
    while (v15 > v11 - 1)
    {
      unint64_t v17 = *(void *)(v10 + 8 * v13 + 32);
      if (v17 - 65 <= 0xFFFFFFFFFFFFFF7ELL)
      {
        unint64_t v16 = 0;
      }
      else
      {
        unint64_t v18 = *(unsigned char *)(a2 + a3 + v13) & 0x7F;
        if ((v17 & 0x8000000000000000) != 0)
        {
          unint64_t v20 = v18 >> -(char)v17;
          if (v17 <= 0xFFFFFFFFFFFFFFC0) {
            unint64_t v16 = 0;
          }
          else {
            unint64_t v16 = v20;
          }
        }
        else
        {
          uint64_t v19 = v18 << v17;
          if (v17 >= 0x40) {
            unint64_t v16 = 0;
          }
          else {
            unint64_t v16 = v19;
          }
        }
      }
      ++v13;
      v12 |= v16;
      if (v11 == v13) {
        goto LABEL_22;
      }
    }
    __break(1u);
    goto LABEL_24;
  }
LABEL_26:
  __break(1u);
}

char *sub_25E65FE50(char *a1, int64_t a2, char a3)
{
  BOOL result = sub_25E66606C(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_25E65FE70(char *a1, int64_t a2, char a3)
{
  BOOL result = sub_25E66626C(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

unint64_t sub_25E65FE90()
{
  unint64_t result = qword_26B38DC68;
  if (!qword_26B38DC68)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B38DC60);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B38DC68);
  }
  return result;
}

unint64_t sub_25E65FEF0()
{
  unint64_t result = qword_26A6FE788;
  if (!qword_26A6FE788)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6FE788);
  }
  return result;
}

ValueMetadata *type metadata accessor for ASN1ObjectIdentifier()
{
  return &type metadata for ASN1ObjectIdentifier;
}

ValueMetadata *type metadata accessor for ASN1ObjectIdentifier.NamedCurves()
{
  return &type metadata for ASN1ObjectIdentifier.NamedCurves;
}

ValueMetadata *type metadata accessor for ASN1ObjectIdentifier.AlgorithmIdentifier()
{
  return &type metadata for ASN1ObjectIdentifier.AlgorithmIdentifier;
}

ValueMetadata *type metadata accessor for ASN1ObjectIdentifier.NameAttributes()
{
  return &type metadata for ASN1ObjectIdentifier.NameAttributes;
}

ValueMetadata *type metadata accessor for ASN1ObjectIdentifier.OCSP()
{
  return &type metadata for ASN1ObjectIdentifier.OCSP;
}

uint64_t sub_25E65FF94(uint64_t a1)
{
  return sub_25E65295C(a1);
}

uint64_t static ASN1Error.unexpectedFieldType(_:file:line:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, char a3@<W3>, uint64_t a4@<X4>, uint64_t *a5@<X8>)
{
  type metadata accessor for ASN1Error.Backing();
  uint64_t result = swift_allocObject();
  *(unsigned char *)(result + 16) = 0;
  *(void *)(result + 24) = 0xD000000000000013;
  *(void *)(result + 32) = 0x800000025E66C080;
  *(void *)(result + 40) = a1;
  *(void *)(result + 48) = a2;
  *(unsigned char *)(result + 56) = a3;
  *(void *)(result + 64) = a4;
  *a5 = result;
  return result;
}

uint64_t type metadata accessor for ASN1Error.Backing()
{
  return self;
}

uint64_t static ASN1Error.invalidASN1Object(reason:file:line:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t *a7@<X8>)
{
  type metadata accessor for ASN1Error.Backing();
  uint64_t v14 = swift_allocObject();
  *(unsigned char *)(v14 + 16) = 1;
  *(void *)(v14 + 24) = a1;
  *(void *)(v14 + 32) = a2;
  *(void *)(v14 + 40) = a3;
  *(void *)(v14 + 48) = a4;
  *(unsigned char *)(v14 + 56) = a5;
  *(void *)(v14 + 64) = a6;
  *a7 = v14;

  return swift_bridgeObjectRetain();
}

uint64_t static ASN1Error.truncatedASN1Field(file:line:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  type metadata accessor for ASN1Error.Backing();
  uint64_t result = swift_allocObject();
  *(unsigned char *)(result + 16) = 3;
  *(void *)(result + 24) = 0;
  *(void *)(result + 32) = 0xE000000000000000;
  *(void *)(result + 40) = a1;
  *(void *)(result + 48) = a2;
  *(unsigned char *)(result + 56) = a3;
  *(void *)(result + 64) = a4;
  *a5 = result;
  return result;
}

uint64_t static ASN1Error.unsupportedFieldLength(reason:file:line:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t *a7@<X8>)
{
  type metadata accessor for ASN1Error.Backing();
  uint64_t v14 = swift_allocObject();
  *(unsigned char *)(v14 + 16) = 4;
  *(void *)(v14 + 24) = a1;
  *(void *)(v14 + 32) = a2;
  *(void *)(v14 + 40) = a3;
  *(void *)(v14 + 48) = a4;
  *(unsigned char *)(v14 + 56) = a5;
  *(void *)(v14 + 64) = a6;
  *a7 = v14;

  return swift_bridgeObjectRetain();
}

uint64_t static ASN1Error.invalidASN1IntegerEncoding(reason:file:line:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t *a7@<X8>)
{
  type metadata accessor for ASN1Error.Backing();
  uint64_t v14 = swift_allocObject();
  *(unsigned char *)(v14 + 16) = 2;
  *(void *)(v14 + 24) = a1;
  *(void *)(v14 + 32) = a2;
  *(void *)(v14 + 40) = a3;
  *(void *)(v14 + 48) = a4;
  *(unsigned char *)(v14 + 56) = a5;
  *(void *)(v14 + 64) = a6;
  *a7 = v14;

  return swift_bridgeObjectRetain();
}

void ASN1Error.code.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(*(void *)v1 + 16);
}

uint64_t static ASN1Error.invalidPEMDocument(reason:file:line:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t *a7@<X8>)
{
  type metadata accessor for ASN1Error.Backing();
  uint64_t v14 = swift_allocObject();
  *(unsigned char *)(v14 + 16) = 5;
  *(void *)(v14 + 24) = a1;
  *(void *)(v14 + 32) = a2;
  *(void *)(v14 + 40) = a3;
  *(void *)(v14 + 48) = a4;
  *(unsigned char *)(v14 + 56) = a5;
  *(void *)(v14 + 64) = a6;
  *a7 = v14;

  return swift_bridgeObjectRetain();
}

uint64_t static ASN1Error.invalidStringRepresentation(reason:file:line:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t *a7@<X8>)
{
  type metadata accessor for ASN1Error.Backing();
  uint64_t v14 = swift_allocObject();
  *(unsigned char *)(v14 + 16) = 6;
  *(void *)(v14 + 24) = a1;
  *(void *)(v14 + 32) = a2;
  *(void *)(v14 + 40) = a3;
  *(void *)(v14 + 48) = a4;
  *(unsigned char *)(v14 + 56) = a5;
  *(void *)(v14 + 64) = a6;
  *a7 = v14;

  return swift_bridgeObjectRetain();
}

uint64_t ASN1Error.hash(into:)()
{
  return sub_25E6699D0();
}

BOOL static ASN1Error.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return *(unsigned __int8 *)(*(void *)a1 + 16) == *(unsigned __int8 *)(*(void *)a2 + 16);
}

uint64_t ASN1Error.hashValue.getter()
{
  return sub_25E669A00();
}

uint64_t sub_25E660444()
{
  return sub_25E669A00();
}

uint64_t sub_25E66048C()
{
  return sub_25E6699D0();
}

uint64_t sub_25E6604BC()
{
  return sub_25E669A00();
}

BOOL sub_25E660500(uint64_t a1, uint64_t a2)
{
  return *(unsigned __int8 *)(*(void *)a1 + 16) == *(unsigned __int8 *)(*(void *)a2 + 16);
}

uint64_t ASN1Error.description.getter()
{
  return 0x6F727245314E5341;
}

BOOL sub_25E660660(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_25E660674()
{
  return sub_25E669A00();
}

uint64_t sub_25E6606BC()
{
  return sub_25E6699D0();
}

uint64_t sub_25E6606E8()
{
  return sub_25E669A00();
}

void static ASN1Error.ErrorCode.unexpectedFieldType.getter(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

void static ASN1Error.ErrorCode.invalidASN1Object.getter(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

void static ASN1Error.ErrorCode.invalidASN1IntegerEncoding.getter(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

void static ASN1Error.ErrorCode.truncatedASN1Field.getter(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

void static ASN1Error.ErrorCode.unsupportedFieldLength.getter(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

void static ASN1Error.ErrorCode.invalidPEMDocument.getter(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

void static ASN1Error.ErrorCode.invalidStringRepresentation.getter(unsigned char *a1@<X8>)
{
  *a1 = 6;
}

uint64_t ASN1Error.ErrorCode.hash(into:)()
{
  return sub_25E6699D0();
}

BOOL static ASN1Error.ErrorCode.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t ASN1Error.ErrorCode.hashValue.getter()
{
  return sub_25E669A00();
}

uint64_t ASN1Error.ErrorCode.description.getter()
{
  return sub_25E669600();
}

uint64_t sub_25E660838()
{
  return sub_25E669600();
}

uint64_t sub_25E66086C()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0228](v0, 72, 7);
}

unint64_t sub_25E6608A8()
{
  unint64_t result = qword_26A6FE790;
  if (!qword_26A6FE790)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6FE790);
  }
  return result;
}

unint64_t sub_25E660900()
{
  unint64_t result = qword_26A6FE798;
  if (!qword_26A6FE798)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6FE798);
  }
  return result;
}

ValueMetadata *type metadata accessor for ASN1Error()
{
  return &type metadata for ASN1Error;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for ASN1Error.ErrorCode()
{
  return &type metadata for ASN1Error.ErrorCode;
}

uint64_t _s9SwiftASN19ASN1ErrorV9ErrorCodeV11BackingCodeOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
  if (a2 + 6 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 6) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 6;
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
      return (*a1 | (v4 << 8)) - 6;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v8 = v6 - 7;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s9SwiftASN19ASN1ErrorV9ErrorCodeV11BackingCodeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *unint64_t result = a2 + 6;
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
        JUMPOUT(0x25E660AE8);
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
          *unint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

uint64_t sub_25E660B10(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25E660B18(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ASN1Error.ErrorCode.BackingCode()
{
  return &type metadata for ASN1Error.ErrorCode.BackingCode;
}

unint64_t sub_25E660B34()
{
  unint64_t result = qword_26A6FE7A0;
  if (!qword_26A6FE7A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6FE7A0);
  }
  return result;
}

unint64_t sub_25E660B8C()
{
  unint64_t result = qword_26A6FE7A8;
  if (!qword_26A6FE7A8)
  {
    type metadata accessor for ASN1Error.Backing();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6FE7A8);
  }
  return result;
}

void static Bool.defaultIdentifier.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 1;
  *(unsigned char *)(a1 + 8) = 0;
}

uint64_t Bool.init(derEncoded:withIdentifier:)(uint64_t a1, uint64_t a2)
{
  return sub_25E660E1C(a1, a2) & 1;
}

uint64_t Bool.serialize(into:withIdentifier:)(char **a1, uint64_t a2)
{
  char v2 = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void *)a2;
  char v5 = v2;
  return sub_25E6504FC(&v4, 0, a1, (uint64_t (*)(char **))sub_25E652940);
}

uint64_t sub_25E660C6C(uint64_t *a1, char a2)
{
  uint64_t v4 = *a1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (a2)
  {
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_25E64EE6C(0, *(void *)(v4 + 16) + 1, 1, (char *)v4);
      uint64_t v4 = result;
    }
    unint64_t v7 = *(void *)(v4 + 16);
    unint64_t v6 = *(void *)(v4 + 24);
    unint64_t v8 = v7 + 1;
    if (v7 >= v6 >> 1)
    {
      uint64_t result = (uint64_t)sub_25E64EE6C((char *)(v6 > 1), v7 + 1, 1, (char *)v4);
      uint64_t v4 = result;
    }
    char v9 = -1;
  }
  else
  {
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_25E64EE6C(0, *(void *)(v4 + 16) + 1, 1, (char *)v4);
      uint64_t v4 = result;
    }
    unint64_t v7 = *(void *)(v4 + 16);
    unint64_t v10 = *(void *)(v4 + 24);
    unint64_t v8 = v7 + 1;
    if (v7 >= v10 >> 1)
    {
      uint64_t result = (uint64_t)sub_25E64EE6C((char *)(v10 > 1), v7 + 1, 1, (char *)v4);
      uint64_t v4 = result;
    }
    char v9 = 0;
  }
  *(void *)(v4 + 16) = v8;
  *(unsigned char *)(v4 + v7 + 32) = v9;
  *a1 = v4;
  return result;
}

void sub_25E660D80(uint64_t a1@<X8>)
{
  *(void *)a1 = 1;
  *(unsigned char *)(a1 + 8) = 0;
}

uint64_t sub_25E660D90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25E660E1C(a1, a2);
  if (!v3) {
    *a3 = result & 1;
  }
  return result;
}

uint64_t sub_25E660DC0(char **a1, uint64_t a2)
{
  char v2 = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void *)a2;
  char v5 = v2;
  return sub_25E6504FC(&v4, 0, a1, (uint64_t (*)(char **))sub_25E6610D4);
}

uint64_t sub_25E660E1C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v2 = *(void *)(a1 + 24);
  uint64_t v5 = *(void *)(a1 + 32);
  unint64_t v4 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 64);
  if (*(void *)a1 != *(void *)a2 || *(unsigned __int8 *)(a1 + 8) != *(unsigned __int8 *)(a2 + 8))
  {
    sub_25E64EBC8();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1Boolean.swift", 27, 2, 22, v11);
    j__swift_unknownObjectRelease(v3, v2, v5, v4, v6, v7);
    swift_unknownObjectRelease();
LABEL_14:
    swift_willThrow();
    return v8 & 1;
  }
  if (!*(unsigned char *)(a1 + 56))
  {
    j__swift_unknownObjectRelease(*(void *)(a1 + 16), v2, v5, v4, v6, 0);
    swift_unknownObjectRelease();
LABEL_13:
    sub_25E64EBC8();
    swift_allocError();
    static ASN1Error.invalidASN1Object(reason:file:line:)(0xD00000000000001CLL, 0x800000025E66C100, (uint64_t)"SwiftASN1/ASN1Boolean.swift", 27, 2, 26, v12);
    goto LABEL_14;
  }
  uint64_t v9 = swift_unknownObjectRetain();
  j__swift_unknownObjectRelease(v9, v2, v5, v4, v6, 1);
  uint64_t result = swift_unknownObjectRelease();
  if (__OFSUB__(v4 >> 1, v5))
  {
    __break(1u);
    goto LABEL_19;
  }
  if ((v4 >> 1) - v5 != 1)
  {
    j__swift_unknownObjectRelease(v3, v2, v5, v4, v6, 1);
    goto LABEL_13;
  }
  if (v5 < (uint64_t)(v4 >> 1))
  {
    if (*(unsigned __int8 *)(v2 + v5) == 255)
    {
      LOBYTE(v8) = 1;
      j__swift_unknownObjectRelease(v3, v2, v5, v4, v6, 1);
    }
    else if (*(unsigned char *)(v2 + v5))
    {
      sub_25E64EBC8();
      swift_allocError();
      static ASN1Error.invalidASN1Object(reason:file:line:)(0xD000000000000019, 0x800000025E66C120, (uint64_t)"SwiftASN1/ASN1Boolean.swift", 27, 2, 38, v13);
      swift_willThrow();
      j__swift_unknownObjectRelease(v3, v2, v5, v4, v6, 1);
    }
    else
    {
      j__swift_unknownObjectRelease(v3, v2, v5, v4, v6, 1);
      LOBYTE(v8) = 0;
    }
    return v8 & 1;
  }
LABEL_19:
  __break(1u);
  return result;
}

uint64_t sub_25E6610D4(uint64_t *a1)
{
  return sub_25E652940(a1);
}

void static ASN1UTF8String.defaultIdentifier.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 12;
  *(unsigned char *)(a1 + 8) = 0;
}

uint64_t (*ASN1UTF8String.bytes.modify())()
{
  return nullsub_1;
}

unint64_t sub_25E661128(unint64_t result, int64_t a2, char a3)
{
  if (a3)
  {
    if (!HIDWORD(result))
    {
      if (result >> 11 == 27)
      {
LABEL_13:
        __break(1u);
        return result;
      }
      if (WORD1(result) <= 0x10u) {
        return (unint64_t)sub_25E662748(result);
      }
LABEL_12:
      __break(1u);
      goto LABEL_13;
    }
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (!result)
  {
    __break(1u);
    goto LABEL_11;
  }
  return (unint64_t)sub_25E662818((const void *)result, a2);
}

uint64_t ASN1UTF8String.init(derEncoded:withIdentifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  return sub_25E661B00(a1, a2, a3);
}

uint64_t ASN1UTF8String.serialize(into:withIdentifier:)(char **a1, uint64_t a2)
{
  char v2 = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void *)a2;
  char v5 = v2;
  return sub_25E6504FC(&v4, 0, a1, (uint64_t (*)(char **))sub_25E652920);
}

uint64_t ASN1UTF8String.withUnsafeBytes<A>(_:)()
{
  return sub_25E66230C();
}

void sub_25E66124C(uint64_t a1@<X8>)
{
  *(void *)a1 = 12;
  *(unsigned char *)(a1 + 8) = 0;
}

uint64_t sub_25E66125C(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_25E661410(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t *))ASN1UTF8String.init(derEncoded:withIdentifier:));
}

uint64_t sub_25E661288(char **a1, uint64_t a2)
{
  char v2 = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void *)a2;
  char v5 = v2;
  return sub_25E6504FC(&v4, 0, a1, (uint64_t (*)(char **))sub_25E652EB8);
}

uint64_t sub_25E6612F0(void *a1)
{
  return ASN1UTF8String.init(stringLiteral:)(*a1, a1[1]);
}

void static ASN1TeletexString.defaultIdentifier.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 20;
  *(unsigned char *)(a1 + 8) = 0;
}

uint64_t (*ASN1TeletexString.bytes.modify())()
{
  return nullsub_1;
}

uint64_t ASN1TeletexString.init(derEncoded:withIdentifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  return sub_25E661B00(a1, a2, a3);
}

uint64_t ASN1TeletexString.serialize(into:withIdentifier:)(char **a1, uint64_t a2)
{
  char v2 = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void *)a2;
  char v5 = v2;
  return sub_25E6504FC(&v4, 0, a1, (uint64_t (*)(char **))sub_25E652EB8);
}

uint64_t ASN1TeletexString.withUnsafeBytes<A>(_:)()
{
  return sub_25E66230C();
}

void sub_25E6613D4(uint64_t a1@<X8>)
{
  *(void *)a1 = 20;
  *(unsigned char *)(a1 + 8) = 0;
}

uint64_t sub_25E6613E4(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_25E661410(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t *))ASN1TeletexString.init(derEncoded:withIdentifier:));
}

uint64_t sub_25E661410(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t *))
{
  char v5 = *((unsigned char *)a2 + 8);
  uint64_t v7 = *a2;
  char v8 = v5;
  return a5(a1, &v7);
}

void static ASN1PrintableString.defaultIdentifier.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 19;
  *(unsigned char *)(a1 + 8) = 0;
}

uint64_t ASN1PrintableString.bytes.setter(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  sub_25E662A20(a1, a2, a3, a4);

  return swift_unknownObjectRelease();
}

uint64_t (*ASN1PrintableString.bytes.modify(void *a1))(uint64_t result, char a2)
{
  *a1 = v1;
  return sub_25E6614BC;
}

uint64_t sub_25E6614BC(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v2 = *(void *)(*(void *)result + 16);
    uint64_t v3 = *(void *)(*(void *)result + 24) >> 1;
    uint64_t v4 = v3 - v2;
    if (v3 != v2)
    {
      if (v2 > v3) {
        uint64_t v3 = *(void *)(*(void *)result + 16);
      }
      uint64_t v5 = v3 - v2;
      uint64_t v6 = (unsigned __int8 *)(*(void *)(*(void *)result + 8) + v2);
      while (v5)
      {
        unsigned int v7 = *v6;
        BOOL v8 = v7 - 58 > 0xFFFFFFF5 || (v7 & 0xFFFFFFDF) - 91 > 0xFFFFFFE5;
        if (!v8)
        {
          BOOL v8 = v7 > 0x3F;
          unint64_t v9 = (1 << v7) & 0xA400FB8100000000;
          if (v8 || v9 == 0)
          {
            __break(1u);
            break;
          }
        }
        --v5;
        ++v6;
        if (!--v4) {
          return result;
        }
      }
      __break(1u);
    }
  }
  return result;
}

uint64_t ASN1PrintableString.init(derEncoded:withIdentifier:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = *(void *)(result + 16);
  uint64_t v4 = *(void *)(result + 24);
  uint64_t v7 = *(void *)(result + 32);
  unint64_t v6 = *(void *)(result + 40);
  uint64_t v8 = *(void *)(result + 48);
  uint64_t v9 = *(unsigned __int8 *)(result + 56);
  if (*(void *)result == *(void *)a2 && *(unsigned __int8 *)(result + 8) == *(unsigned __int8 *)(a2 + 8))
  {
    if (*(unsigned char *)(result + 56))
    {
      uint64_t v10 = swift_unknownObjectRetain();
      j__swift_unknownObjectRelease(v10, v4, v7, v6, v8, 1);
      swift_unknownObjectRelease();
      uint64_t result = sub_25E6629AC(v4, v7, v6);
      if (result)
      {
        *a3 = v5;
        a3[1] = v4;
        a3[2] = v7;
        a3[3] = v6;
      }
      else
      {
        sub_25E64EBC8();
        swift_allocError();
        static ASN1Error.invalidStringRepresentation(reason:file:line:)(0xD000000000000025, 0x800000025E66C140, (uint64_t)"SwiftASN1/ASN1Strings.swift", 27, 2, 138, v12);
        swift_willThrow();
        return j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, 1);
      }
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    sub_25E64EBC8();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1OctetString.swift", 31, 2, 26, v11);
    j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, v9);
    swift_unknownObjectRelease();
    return swift_willThrow();
  }
  return result;
}

uint64_t ASN1PrintableString.init(contentBytes:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  int64_t v5 = a4 >> 1;
  if (a4 >> 1 == a3)
  {
LABEL_2:
    *a5 = result;
    a5[1] = a2;
    a5[2] = a3;
    a5[3] = a4;
  }
  else
  {
    uint64_t v6 = a3;
    while (v6 < v5)
    {
      unsigned int v7 = *(unsigned __int8 *)(a2 + v6);
      BOOL v8 = (v7 & 0xFFFFFFDF) - 91 > 0xFFFFFFE5 || v7 - 58 > 0xFFFFFFF5;
      if (!v8)
      {
        BOOL v8 = v7 > 0x3F;
        unint64_t v9 = (1 << v7) & 0xA400FB8100000000;
        if (v8 || v9 == 0)
        {
          sub_25E64EBC8();
          swift_allocError();
          static ASN1Error.invalidStringRepresentation(reason:file:line:)(0xD000000000000025, 0x800000025E66C140, (uint64_t)"SwiftASN1/ASN1Strings.swift", 27, 2, 146, v11);
          swift_willThrow();
          return swift_unknownObjectRelease();
        }
      }
      if (v5 == ++v6) {
        goto LABEL_2;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t ASN1PrintableString.serialize(into:withIdentifier:)(char **a1, uint64_t a2)
{
  char v2 = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void *)a2;
  char v5 = v2;
  return sub_25E6504FC(&v4, 0, a1, (uint64_t (*)(char **))sub_25E652EB8);
}

uint64_t ASN1PrintableString.withUnsafeBytes<A>(_:)()
{
  return sub_25E66230C();
}

void sub_25E661894(uint64_t a1@<X8>)
{
  *(void *)a1 = 19;
  *(unsigned char *)(a1 + 8) = 0;
}

uint64_t sub_25E6618A4(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_25E661410(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t *))ASN1PrintableString.init(derEncoded:withIdentifier:));
}

uint64_t ASN1PrintableString.init(stringLiteral:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_25E66248C(a1, a2, (uint64_t (*)(uint64_t, void, uint64_t))sub_25E6629AC, a3);
}

uint64_t ASN1PrintableString.init(_:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_25E662550(a1, a2, (uint64_t (*)(uint64_t, void, uint64_t))sub_25E6629AC, 0xD000000000000025, 0x800000025E66C140, 193, a3);
}

uint64_t sub_25E661930@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_25E66265C(a1, (uint64_t (*)(uint64_t, void, uint64_t))sub_25E6629AC, a2);
}

void static ASN1UniversalString.defaultIdentifier.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 28;
  *(unsigned char *)(a1 + 8) = 0;
}

uint64_t (*ASN1UniversalString.bytes.modify())()
{
  return nullsub_1;
}

uint64_t ASN1UniversalString.init(derEncoded:withIdentifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  return sub_25E661B00(a1, a2, a3);
}

uint64_t ASN1UniversalString.serialize(into:withIdentifier:)(char **a1, uint64_t a2)
{
  char v2 = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void *)a2;
  char v5 = v2;
  return sub_25E6504FC(&v4, 0, a1, (uint64_t (*)(char **))sub_25E652EB8);
}

uint64_t ASN1UniversalString.withUnsafeBytes<A>(_:)()
{
  return sub_25E66230C();
}

void sub_25E661A20(uint64_t a1@<X8>)
{
  *(void *)a1 = 28;
  *(unsigned char *)(a1 + 8) = 0;
}

uint64_t sub_25E661A30(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_25E661410(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t *))ASN1UniversalString.init(derEncoded:withIdentifier:));
}

void static ASN1BMPString.defaultIdentifier.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 30;
  *(unsigned char *)(a1 + 8) = 0;
}

uint64_t _s9SwiftASN10B10UTF8StringV5bytess10ArraySliceVys5UInt8VGvs_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = swift_unknownObjectRelease();
  *uint64_t v4 = a1;
  v4[1] = a2;
  _OWORD v4[2] = a3;
  v4[3] = a4;
  return result;
}

uint64_t (*ASN1BMPString.bytes.modify())()
{
  return nullsub_1;
}

uint64_t ASN1BMPString.init(derEncoded:withIdentifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  return sub_25E661B00(a1, a2, a3);
}

uint64_t sub_25E661B00@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = *(void *)(result + 16);
  uint64_t v4 = *(void *)(result + 24);
  uint64_t v7 = *(void *)(result + 32);
  uint64_t v6 = *(void *)(result + 40);
  uint64_t v8 = *(void *)(result + 48);
  uint64_t v9 = *(unsigned __int8 *)(result + 56);
  if (*(void *)result == *(void *)a2 && *(unsigned __int8 *)(result + 8) == *(unsigned __int8 *)(a2 + 8))
  {
    if (*(unsigned char *)(result + 56))
    {
      uint64_t v10 = swift_unknownObjectRetain();
      j__swift_unknownObjectRelease(v10, v4, v7, v6, v8, 1);
      uint64_t result = swift_unknownObjectRelease();
      *a3 = v5;
      a3[1] = v4;
      a3[2] = v7;
      a3[3] = v6;
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    sub_25E64EBC8();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1OctetString.swift", 31, 2, 26, v11);
    j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, v9);
    swift_unknownObjectRelease();
    return swift_willThrow();
  }
  return result;
}

uint64_t _s9SwiftASN10B10UTF8StringV12contentBytesACs10ArraySliceVys5UInt8VG_tcfC_0@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

uint64_t ASN1BMPString.serialize(into:withIdentifier:)(char **a1, uint64_t a2)
{
  char v2 = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void *)a2;
  char v5 = v2;
  return sub_25E6504FC(&v4, 0, a1, (uint64_t (*)(char **))sub_25E652EB8);
}

uint64_t ASN1BMPString.withUnsafeBytes<A>(_:)()
{
  return sub_25E66230C();
}

void sub_25E661CC0(uint64_t a1@<X8>)
{
  *(void *)a1 = 30;
  *(unsigned char *)(a1 + 8) = 0;
}

uint64_t sub_25E661CD0(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_25E661410(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t *))ASN1BMPString.init(derEncoded:withIdentifier:));
}

uint64_t _s9SwiftASN10B10UTF8StringV13stringLiteralACSS_tcfC_0@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, void *a3@<X8>)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_9;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v4 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v4 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v4)
  {
    while (1)
    {
      char v5 = sub_25E662944(v4, 0);
      uint64_t result = sub_25E669890();
      if (v7) {
        break;
      }
      if (result == v4) {
        goto LABEL_11;
      }
      __break(1u);
LABEL_9:
      uint64_t v4 = sub_25E669630();
      if (!v4) {
        goto LABEL_10;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_10:
    char v5 = (void *)MEMORY[0x263F8EE78];
LABEL_11:
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v8 = (2 * v5[2]) | 1;
    *a3 = v5;
    a3[1] = v5 + 4;
    a3[2] = 0;
    a3[3] = v8;
  }
  return result;
}

void static ASN1IA5String.defaultIdentifier.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 22;
  *(unsigned char *)(a1 + 8) = 0;
}

uint64_t _s9SwiftASN10B10UTF8StringV5bytess10ArraySliceVys5UInt8VGvg_0()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_25E661E14(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v6 = a1[1];
  uint64_t v7 = a1[2];
  uint64_t v8 = a1[3];
  uint64_t v9 = swift_unknownObjectRetain();
  a5(v9, v6, v7, v8);

  return swift_unknownObjectRelease();
}

uint64_t ASN1IA5String.bytes.setter(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  sub_25E662ADC(a1, a2, a3, a4);

  return swift_unknownObjectRelease();
}

uint64_t (*ASN1IA5String.bytes.modify(void *a1))(uint64_t result, char a2)
{
  *a1 = v1;
  return sub_25E661EDC;
}

uint64_t sub_25E661EDC(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v2 = *(void *)(*(void *)result + 16);
    uint64_t v3 = *(void *)(*(void *)result + 24) >> 1;
    if (v2 != v3)
    {
      if (v2 >= v3)
      {
LABEL_12:
        __break(1u);
        goto LABEL_13;
      }
      uint64_t v4 = *(void *)(*(void *)result + 8);
      if (*(char *)(v4 + v2) < 0)
      {
LABEL_13:
        __break(1u);
        goto LABEL_14;
      }
      uint64_t v5 = v2 + 1;
      if (v2 + 1 != v3)
      {
        if (v2 + 1 >= v3)
        {
LABEL_14:
          __break(1u);
          return result;
        }
        uint64_t v6 = ~v2 + v3;
        uint64_t v7 = (char *)(v4 + v5);
        while (1)
        {
          int v8 = *v7++;
          if (v8 < 0) {
            break;
          }
          if (!--v6) {
            return result;
          }
        }
        __break(1u);
        goto LABEL_12;
      }
    }
  }
  return result;
}

unint64_t _s9SwiftASN10B10UTF8StringVyACs06StaticD0VcfC_0@<X0>(unint64_t a1@<X0>, int64_t a2@<X1>, char a3@<W2>, unint64_t *a4@<X8>)
{
  unint64_t result = sub_25E661128(a1, a2, a3);
  uint64_t v6 = (2 * *(void *)(result + 16)) | 1;
  *a4 = result;
  a4[1] = result + 32;
  a4[2] = 0;
  a4[3] = v6;
  return result;
}

uint64_t ASN1IA5String.init(derEncoded:withIdentifier:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = *(void *)(result + 16);
  uint64_t v4 = *(void *)(result + 24);
  uint64_t v7 = *(void *)(result + 32);
  unint64_t v6 = *(void *)(result + 40);
  uint64_t v8 = *(void *)(result + 48);
  uint64_t v9 = *(unsigned __int8 *)(result + 56);
  if (*(void *)result != *(void *)a2 || *(unsigned __int8 *)(result + 8) != *(unsigned __int8 *)(a2 + 8))
  {
    sub_25E64EBC8();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1OctetString.swift", 31, 2, 26, v13);
    j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, v9);
    swift_unknownObjectRelease();
    return swift_willThrow();
  }
  if (!*(unsigned char *)(result + 56)) {
    goto LABEL_20;
  }
  uint64_t v10 = swift_unknownObjectRetain();
  j__swift_unknownObjectRelease(v10, v4, v7, v6, v8, 1);
  unint64_t result = swift_unknownObjectRelease();
  int64_t v11 = v6 >> 1;
  if (v7 == v6 >> 1) {
    goto LABEL_14;
  }
  if (v7 >= (uint64_t)(v6 >> 1))
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(char *)(v4 + v7) < 0)
  {
LABEL_16:
    sub_25E64EBC8();
    swift_allocError();
    static ASN1Error.invalidStringRepresentation(reason:file:line:)(0xD00000000000001FLL, 0x800000025E66C190, (uint64_t)"SwiftASN1/ASN1Strings.swift", 27, 2, 313, v14);
    swift_willThrow();
    return j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, 1);
  }
  if (v7 + 1 == v11) {
    goto LABEL_14;
  }
  if (v7 + 1 < v11)
  {
    if ((*(char *)(v4 + v7 + 1) & 0x80000000) == 0)
    {
      uint64_t v12 = v7 + 2;
      if (v7 + 2 != v11)
      {
        while (v12 < v11)
        {
          if (*(char *)(v4 + v12) < 0) {
            goto LABEL_16;
          }
          if (v11 == ++v12) {
            goto LABEL_14;
          }
        }
        __break(1u);
        goto LABEL_18;
      }
LABEL_14:
      *a3 = v5;
      a3[1] = v4;
      a3[2] = v7;
      a3[3] = v6;
      return result;
    }
    goto LABEL_16;
  }
LABEL_19:
  __break(1u);
LABEL_20:
  __break(1u);
  return result;
}

uint64_t ASN1IA5String.init(contentBytes:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  int64_t v5 = a4 >> 1;
  if (a4 >> 1 == a3) {
    goto LABEL_11;
  }
  if ((uint64_t)(a4 >> 1) <= a3)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (*(char *)(a2 + a3) < 0) {
    goto LABEL_12;
  }
  if (a3 + 1 == v5) {
    goto LABEL_11;
  }
  if (a3 + 1 < v5)
  {
    if ((*(char *)(a2 + a3 + 1) & 0x80000000) == 0)
    {
      uint64_t v6 = a3 + 2;
      if (a3 + 2 != v5)
      {
        while (v6 < v5)
        {
          if (*(char *)(a2 + v6) < 0) {
            goto LABEL_12;
          }
          if (v5 == ++v6) {
            goto LABEL_11;
          }
        }
        __break(1u);
        goto LABEL_14;
      }
LABEL_11:
      *a5 = result;
      a5[1] = a2;
      a5[2] = a3;
      a5[3] = a4;
      return result;
    }
LABEL_12:
    sub_25E64EBC8();
    swift_allocError();
    static ASN1Error.invalidStringRepresentation(reason:file:line:)(0xD00000000000001FLL, 0x800000025E66C190, (uint64_t)"SwiftASN1/ASN1Strings.swift", 27, 2, 321, v7);
    swift_willThrow();
    return swift_unknownObjectRelease();
  }
LABEL_15:
  __break(1u);
  return result;
}

uint64_t ASN1IA5String.serialize(into:withIdentifier:)(char **a1, uint64_t a2)
{
  char v2 = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void *)a2;
  char v5 = v2;
  return sub_25E6504FC(&v4, 0, a1, (uint64_t (*)(char **))sub_25E652EB8);
}

uint64_t ASN1IA5String.withUnsafeBytes<A>(_:)()
{
  return sub_25E66230C();
}

uint64_t sub_25E66230C()
{
  return sub_25E669870();
}

uint64_t _s9SwiftASN10B10UTF8StringV4hash4intoys6HasherVz_tF_0()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3] >> 1;
  uint64_t result = v2 - v1;
  if (__OFSUB__(v2, v1))
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v4 = v0[1];
  uint64_t result = sub_25E6699D0();
  BOOL v5 = __OFSUB__(v2, v1);
  uint64_t v6 = v2 - v1;
  if (!v6) {
    return result;
  }
  if ((v6 < 0) ^ v5 | (v6 == 0))
  {
LABEL_8:
    __break(1u);
    return result;
  }
  uint64_t v7 = v4 + v1;
  do
  {
    ++v7;
    uint64_t result = sub_25E6699E0();
    --v6;
  }
  while (v6);
  return result;
}

uint64_t _s9SwiftASN10B10UTF8StringV9hashValueSivg_0()
{
  uint64_t v1 = v0[1];
  uint64_t v2 = v0[2];
  unint64_t v3 = v0[3];
  sub_25E6699C0();
  unint64_t v4 = v3 >> 1;
  uint64_t result = v4 - v2;
  if (__OFSUB__(v4, v2))
  {
    __break(1u);
  }
  else
  {
    uint64_t result = sub_25E6699D0();
    BOOL v6 = __OFSUB__(v4, v2);
    uint64_t v7 = v4 - v2;
    if (!v7) {
      return sub_25E669A00();
    }
    if (!((v7 < 0) ^ v6 | (v7 == 0)))
    {
      uint64_t v8 = v1 + v2;
      do
      {
        ++v8;
        sub_25E6699E0();
        --v7;
      }
      while (v7);
      return sub_25E669A00();
    }
  }
  __break(1u);
  return result;
}

void sub_25E662438(uint64_t a1@<X8>)
{
  *(void *)a1 = 22;
  *(unsigned char *)(a1 + 8) = 0;
}

uint64_t sub_25E662448(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_25E661410(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t *))ASN1IA5String.init(derEncoded:withIdentifier:));
}

uint64_t ASN1IA5String.init(stringLiteral:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_25E66248C(a1, a2, (uint64_t (*)(uint64_t, void, uint64_t))sub_25E662B84, a3);
}

uint64_t sub_25E66248C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t (*a3)(uint64_t, void, uint64_t)@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v6 = sub_25E6628A8(a1, a2);
  swift_bridgeObjectRelease();
  uint64_t v7 = (2 * *(void *)(v6 + 16)) | 1;
  uint64_t result = a3(v6 + 32, 0, v7);
  if (result)
  {
    *a4 = v6;
    a4[1] = v6 + 32;
    a4[2] = 0;
    a4[3] = v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t ASN1IA5String.init(_:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_25E662550(a1, a2, (uint64_t (*)(uint64_t, void, uint64_t))sub_25E662B84, 0xD00000000000001FLL, 0x800000025E66C190, 354, a3);
}

uint64_t sub_25E662550@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t (*a3)(uint64_t, void, uint64_t)@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t *a7@<X8>)
{
  uint64_t v12 = sub_25E6628A8(a1, a2);
  swift_bridgeObjectRelease();
  uint64_t v13 = (2 * *(void *)(v12 + 16)) | 1;
  uint64_t result = a3(v12 + 32, 0, v13);
  if (result)
  {
    *a7 = v12;
    a7[1] = v12 + 32;
    a7[2] = 0;
    a7[3] = v13;
  }
  else
  {
    sub_25E64EBC8();
    swift_allocError();
    static ASN1Error.invalidStringRepresentation(reason:file:line:)(a4, a5, (uint64_t)"SwiftASN1/ASN1Strings.swift", 27, 2, a6, v15);
    swift_willThrow();
    return swift_release();
  }
  return result;
}

uint64_t sub_25E662644@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_25E66265C(a1, (uint64_t (*)(uint64_t, void, uint64_t))sub_25E662B84, a2);
}

uint64_t sub_25E66265C@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, void, uint64_t)@<X3>, uint64_t *a3@<X8>)
{
  uint64_t v5 = sub_25E6628A8(*(void *)a1, *(void *)(a1 + 8));
  swift_bridgeObjectRelease();
  uint64_t v6 = (2 * *(void *)(v5 + 16)) | 1;
  uint64_t result = a2(v5 + 32, 0, v6);
  if (result)
  {
    *a3 = v5;
    a3[1] = v5 + 32;
    a3[2] = 0;
    a3[3] = v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t _sSS9SwiftASN1EySSAA0B10UTF8StringVcfC_0(uint64_t result)
{
  if (__OFSUB__(*(void *)(result + 24) >> 1, *(void *)(result + 16)))
  {
    __break(1u);
  }
  else
  {
    uint64_t v1 = sub_25E669610();
    swift_unknownObjectRelease();
    return v1;
  }
  return result;
}

void *sub_25E662748(unsigned int a1)
{
  if (a1 > 0x7F)
  {
    int v4 = (a1 & 0x3F) << 8;
    if (a1 >= 0x800)
    {
      int v5 = (v4 | (a1 >> 6) & 0x3F) << 8;
      int v6 = (((v5 | (a1 >> 12) & 0x3F) << 8) | (a1 >> 18)) - 2122219023;
      unsigned int v1 = (v5 | (a1 >> 12)) + 8487393;
      if (HIWORD(a1)) {
        unsigned int v1 = v6;
      }
    }
    else
    {
      unsigned int v1 = (v4 | (a1 >> 6)) + 33217;
    }
  }
  else
  {
    unsigned int v1 = a1 + 1;
  }
  unsigned int v2 = __clz(v1);
  uint64_t v7 = (v1 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << (8 * (4 - (v2 >> 3))));
  return sub_25E662818(&v7, 4 - (v2 >> 3));
}

void *sub_25E662818(const void *a1, int64_t a2)
{
  if (!a2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  if (a2 <= 0)
  {
    int v4 = (void *)MEMORY[0x263F8EE78];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B38DC98);
    int v4 = (void *)swift_allocObject();
    size_t v5 = _swift_stdlib_malloc_size(v4);
    _OWORD v4[2] = a2;
    v4[3] = 2 * v5 - 64;
  }
  memcpy(v4 + 4, a1, a2);
  return v4;
}

uint64_t sub_25E6628A8(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_9;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_25E662944(v2, 0);
      uint64_t result = sub_25E669890();
      if (v5) {
        break;
      }
      if (result == v2) {
        return (uint64_t)v3;
      }
      __break(1u);
LABEL_9:
      uint64_t v2 = sub_25E669630();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_25E662944(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B38DC98);
  int v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  _OWORD v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_25E6629AC(uint64_t result, uint64_t a2, unint64_t a3)
{
  int64_t v3 = a3 >> 1;
  if (a3 >> 1 == a2) {
    return 1;
  }
  while (a2 < v3)
  {
    unsigned int v4 = *(unsigned __int8 *)(result + a2);
    BOOL v5 = (v4 & 0xFFFFFFDF) - 91 > 0xFFFFFFE5 || v4 - 58 > 0xFFFFFFF5;
    if (!v5)
    {
      BOOL v5 = v4 > 0x3F;
      unint64_t v6 = (1 << v4) & 0xA400FB8100000000;
      if (v5 || v6 == 0) {
        return 0;
      }
    }
    if (v3 == ++a2) {
      return 1;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_25E662A20(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  swift_unknownObjectRetain();
  uint64_t result = swift_unknownObjectRelease();
  *unsigned int v4 = a1;
  v4[1] = a2;
  _OWORD v4[2] = a3;
  v4[3] = a4;
  int64_t v10 = a4 >> 1;
  if (a4 >> 1 != a3)
  {
    while (a3 < v10)
    {
      unsigned int v11 = *(unsigned __int8 *)(a2 + a3);
      BOOL v12 = (v11 & 0xFFFFFFDF) - 91 > 0xFFFFFFE5 || v11 - 58 > 0xFFFFFFF5;
      if (!v12)
      {
        BOOL v12 = v11 > 0x3F;
        unint64_t v13 = (1 << v11) & 0xA400FB8100000000;
        if (v12 || v13 == 0)
        {
          __break(1u);
          break;
        }
      }
      if (v10 == ++a3) {
        return result;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_25E662ADC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  swift_unknownObjectRetain();
  uint64_t result = swift_unknownObjectRelease();
  *unsigned int v4 = a1;
  v4[1] = a2;
  _OWORD v4[2] = a3;
  v4[3] = a4;
  int64_t v10 = a4 >> 1;
  if (a4 >> 1 != a3)
  {
    if ((uint64_t)(a4 >> 1) <= a3)
    {
LABEL_11:
      __break(1u);
      goto LABEL_12;
    }
    if (*(char *)(a2 + a3) < 0)
    {
LABEL_12:
      __break(1u);
      goto LABEL_13;
    }
    if (a3 + 1 != v10)
    {
      if (a3 + 1 >= v10)
      {
LABEL_13:
        __break(1u);
        return result;
      }
      uint64_t v11 = ~a3 + v10;
      BOOL v12 = (char *)(a2 + a3 + 1);
      while (1)
      {
        int v13 = *v12++;
        if (v13 < 0) {
          break;
        }
        if (!--v11) {
          return result;
        }
      }
      __break(1u);
      goto LABEL_11;
    }
  }
  return result;
}

uint64_t sub_25E662B84(uint64_t result, uint64_t a2, unint64_t a3)
{
  int64_t v3 = a3 >> 1;
  if (a3 >> 1 != a2)
  {
    if ((uint64_t)(a3 >> 1) > a2)
    {
      if (*(char *)(result + a2) < 0) {
        return 0;
      }
      if (a2 + 1 == v3) {
        return 1;
      }
      uint64_t v4 = result + 1;
      while (a2 + 1 < v3)
      {
        int v5 = *(char *)(v4 + a2);
        uint64_t result = v5 >= 0;
        if ((v5 & 0x80000000) == 0 && v3 - 2 != a2++) {
          continue;
        }
        return result;
      }
      __break(1u);
    }
    __break(1u);
    return result;
  }
  return 1;
}

unint64_t sub_25E662BF8()
{
  unint64_t result = qword_26A6FE7B0;
  if (!qword_26A6FE7B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6FE7B0);
  }
  return result;
}

unint64_t sub_25E662C50()
{
  unint64_t result = qword_26A6FE7B8;
  if (!qword_26A6FE7B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6FE7B8);
  }
  return result;
}

uint64_t sub_25E662CA4()
{
  return MEMORY[0x263F8D388];
}

unint64_t sub_25E662CB4()
{
  unint64_t result = qword_26A6FE7C0;
  if (!qword_26A6FE7C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6FE7C0);
  }
  return result;
}

uint64_t sub_25E662D08()
{
  return MEMORY[0x263F8D398];
}

uint64_t sub_25E662D14()
{
  return MEMORY[0x263F8D390];
}

unint64_t sub_25E662D24()
{
  unint64_t result = qword_26A6FE7C8;
  if (!qword_26A6FE7C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6FE7C8);
  }
  return result;
}

unint64_t sub_25E662D7C()
{
  unint64_t result = qword_26A6FE7D0;
  if (!qword_26A6FE7D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6FE7D0);
  }
  return result;
}

unint64_t sub_25E662DD4()
{
  unint64_t result = qword_26A6FE7D8;
  if (!qword_26A6FE7D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6FE7D8);
  }
  return result;
}

unint64_t sub_25E662E2C()
{
  unint64_t result = qword_26A6FE7E0;
  if (!qword_26A6FE7E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6FE7E0);
  }
  return result;
}

unint64_t sub_25E662E84()
{
  unint64_t result = qword_26A6FE7E8;
  if (!qword_26A6FE7E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6FE7E8);
  }
  return result;
}

unint64_t sub_25E662EDC()
{
  unint64_t result = qword_26A6FE7F0;
  if (!qword_26A6FE7F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6FE7F0);
  }
  return result;
}

unint64_t sub_25E662F34()
{
  unint64_t result = qword_26A6FE7F8;
  if (!qword_26A6FE7F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6FE7F8);
  }
  return result;
}

unint64_t sub_25E662F8C()
{
  unint64_t result = qword_26A6FE800;
  if (!qword_26A6FE800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6FE800);
  }
  return result;
}

unint64_t sub_25E662FE4()
{
  unint64_t result = qword_26A6FE808;
  if (!qword_26A6FE808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6FE808);
  }
  return result;
}

unint64_t sub_25E66303C()
{
  unint64_t result = qword_26A6FE810;
  if (!qword_26A6FE810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6FE810);
  }
  return result;
}

unint64_t sub_25E663094()
{
  unint64_t result = qword_26A6FE818;
  if (!qword_26A6FE818)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6FE818);
  }
  return result;
}

unint64_t sub_25E6630EC()
{
  unint64_t result = qword_26A6FE820;
  if (!qword_26A6FE820)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6FE820);
  }
  return result;
}

unint64_t sub_25E663144()
{
  unint64_t result = qword_26A6FE828;
  if (!qword_26A6FE828)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6FE828);
  }
  return result;
}

unint64_t sub_25E66319C()
{
  unint64_t result = qword_26A6FE830;
  if (!qword_26A6FE830)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6FE830);
  }
  return result;
}

unint64_t sub_25E6631F4()
{
  unint64_t result = qword_26A6FE838;
  if (!qword_26A6FE838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6FE838);
  }
  return result;
}

uint64_t sub_25E66324C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25E661E14(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_25E662A20);
}

uint64_t keypath_getTm@<X0>(_OWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return swift_unknownObjectRetain();
}

uint64_t sub_25E66328C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25E661E14(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_25E662ADC);
}

uint64_t dispatch thunk of ASN1String.bytes.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of ASN1String.init(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

ValueMetadata *type metadata accessor for ASN1UTF8String()
{
  return &type metadata for ASN1UTF8String;
}

ValueMetadata *type metadata accessor for ASN1TeletexString()
{
  return &type metadata for ASN1TeletexString;
}

ValueMetadata *type metadata accessor for ASN1PrintableString()
{
  return &type metadata for ASN1PrintableString;
}

ValueMetadata *type metadata accessor for ASN1UniversalString()
{
  return &type metadata for ASN1UniversalString;
}

ValueMetadata *type metadata accessor for ASN1BMPString()
{
  return &type metadata for ASN1BMPString;
}

ValueMetadata *type metadata accessor for ASN1IA5String()
{
  return &type metadata for ASN1IA5String;
}

uint64_t ASN1OctetString.init(derEncoded:withIdentifier:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = *(void *)(result + 16);
  uint64_t v4 = *(void *)(result + 24);
  uint64_t v7 = *(void *)(result + 32);
  uint64_t v6 = *(void *)(result + 40);
  uint64_t v8 = *(void *)(result + 48);
  uint64_t v9 = *(unsigned __int8 *)(result + 56);
  if (*(void *)result == *(void *)a2 && *(unsigned __int8 *)(result + 8) == *(unsigned __int8 *)(a2 + 8))
  {
    if (*(unsigned char *)(result + 56))
    {
      uint64_t v10 = swift_unknownObjectRetain();
      j__swift_unknownObjectRelease(v10, v4, v7, v6, v8, 1);
      unint64_t result = swift_unknownObjectRelease();
      *a3 = v5;
      a3[1] = v4;
      a3[2] = v7;
      a3[3] = v6;
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    sub_25E64EBC8();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1OctetString.swift", 31, 2, 26, v11);
    j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, v9);
    swift_unknownObjectRelease();
    return swift_willThrow();
  }
  return result;
}

uint64_t ASN1OctetString.init(contentBytes:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

uint64_t ASN1OctetString.serialize(into:withIdentifier:)(char **a1, uint64_t a2)
{
  char v2 = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void *)a2;
  char v5 = v2;
  return sub_25E6504FC(&v4, 0, a1, (uint64_t (*)(char **))sub_25E6637FC);
}

void static ASN1OctetString.defaultIdentifier.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 4;
  *(unsigned char *)(a1 + 8) = 0;
}

uint64_t ASN1OctetString.bytes.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t ASN1OctetString.bytes.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = swift_unknownObjectRelease();
  *uint64_t v4 = a1;
  v4[1] = a2;
  _OWORD v4[2] = a3;
  v4[3] = a4;
  return result;
}

uint64_t (*ASN1OctetString.bytes.modify())()
{
  return nullsub_1;
}

uint64_t sub_25E6635A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  return swift_unknownObjectRelease();
}

void sub_25E663618(uint64_t a1@<X8>)
{
  *(void *)a1 = 4;
  *(unsigned char *)(a1 + 8) = 0;
}

uint64_t sub_25E663628@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, void *a3@<X8>)
{
  char v3 = *((unsigned char *)a2 + 8);
  uint64_t v5 = *a2;
  char v6 = v3;
  return ASN1OctetString.init(derEncoded:withIdentifier:)(a1, (uint64_t)&v5, a3);
}

uint64_t sub_25E66365C(char **a1, uint64_t a2)
{
  char v2 = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void *)a2;
  char v5 = v2;
  return sub_25E6504FC(&v4, 0, a1, (uint64_t (*)(char **))sub_25E6637FC);
}

uint64_t ASN1OctetString.hash(into:)()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3] >> 1;
  uint64_t result = v2 - v1;
  if (__OFSUB__(v2, v1))
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v4 = v0[1];
  uint64_t result = sub_25E6699D0();
  BOOL v5 = __OFSUB__(v2, v1);
  uint64_t v6 = v2 - v1;
  if (!v6) {
    return result;
  }
  if ((v6 < 0) ^ v5 | (v6 == 0))
  {
LABEL_8:
    __break(1u);
    return result;
  }
  uint64_t v7 = v4 + v1;
  do
  {
    ++v7;
    uint64_t result = sub_25E6699E0();
    --v6;
  }
  while (v6);
  return result;
}

uint64_t static ASN1OctetString.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return sub_25E64F2A4(*(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a2 + 8), *(void *)(a2 + 16), *(void *)(a2 + 24));
}

uint64_t ASN1OctetString.hashValue.getter()
{
  uint64_t v1 = v0[1];
  uint64_t v2 = v0[2];
  unint64_t v3 = v0[3];
  sub_25E6699C0();
  unint64_t v4 = v3 >> 1;
  uint64_t result = v4 - v2;
  if (__OFSUB__(v4, v2))
  {
    __break(1u);
  }
  else
  {
    uint64_t result = sub_25E6699D0();
    BOOL v6 = __OFSUB__(v4, v2);
    uint64_t v7 = v4 - v2;
    if (!v7) {
      return sub_25E669A00();
    }
    if (!((v7 < 0) ^ v6 | (v7 == 0)))
    {
      uint64_t v8 = v1 + v2;
      do
      {
        ++v8;
        sub_25E6699E0();
        --v7;
      }
      while (v7);
      return sub_25E669A00();
    }
  }
  __break(1u);
  return result;
}

uint64_t ASN1OctetString.withUnsafeBytes<A>(_:)()
{
  return sub_25E669870();
}

uint64_t sub_25E6637FC()
{
  return sub_25E66387C();
}

unint64_t sub_25E663818()
{
  unint64_t result = qword_26B38DC48;
  if (!qword_26B38DC48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B38DC48);
  }
  return result;
}

ValueMetadata *type metadata accessor for ASN1OctetString()
{
  return &type metadata for ASN1OctetString;
}

uint64_t sub_25E66387C()
{
  uint64_t v1 = v0[3];
  uint64_t v3 = v0[4];
  unint64_t v2 = v0[5];
  uint64_t v4 = swift_unknownObjectRetain();
  sub_25E65E8B4(v4, v1, v3, v2);
  return swift_unknownObjectRelease();
}

void static UTCTime.defaultIdentifier.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 23;
  *(unsigned char *)(a1 + 8) = 0;
}

uint64_t UTCTime.year.getter()
{
  return *(void *)v0;
}

uint64_t sub_25E6638F8(void *a1, void *a2)
{
  *a2 = *a1;
  return sub_25E6639F4();
}

uint64_t UTCTime.year.setter(uint64_t a1)
{
  *uint64_t v1 = a1;
  return sub_25E6639F4();
}

uint64_t sub_25E6639F4()
{
  if ((unint64_t)(*v0 - 1950) > 0x63)
  {
    sub_25E64EBC8();
    swift_allocError();
    uint64_t v10 = v13;
    uint64_t v8 = 0xD000000000000018;
    uint64_t v11 = 0x800000025E66C1D0;
    uint64_t v12 = 143;
    goto LABEL_11;
  }
  unint64_t v2 = v0[3];
  unint64_t v1 = v0[4];
  unint64_t v3 = v0[5];
  uint64_t v4 = v0[2];
  uint64_t result = sub_25E666380(v0[1], *v0);
  if (v6)
  {
    sub_25E64EBC8();
    swift_allocError();
    uint64_t v8 = 0xD000000000000021;
    uint64_t v10 = v14;
    uint64_t v11 = 0x800000025E66C1F0;
    uint64_t v12 = 148;
    goto LABEL_11;
  }
  if (v4 < 1 || result < v4)
  {
    sub_25E64EBC8();
    swift_allocError();
    uint64_t v8 = 0xD000000000000020;
    uint64_t v10 = v9;
    uint64_t v11 = 0x800000025E66C280;
    uint64_t v12 = 152;
LABEL_11:
    static ASN1Error.invalidASN1Object(reason:file:line:)(v8, v11, (uint64_t)"SwiftASN1/UTCTime.swift", 23, 2, v12, v10);
    return swift_willThrow();
  }
  if (v2 > 0x17)
  {
    sub_25E64EBC8();
    swift_allocError();
    uint64_t v10 = v16;
    uint64_t v8 = 0xD000000000000018;
    uint64_t v11 = 0x800000025E66C220;
    uint64_t v12 = 156;
    goto LABEL_11;
  }
  if (v1 > 0x3B)
  {
    sub_25E64EBC8();
    swift_allocError();
    uint64_t v8 = 0xD00000000000001ALL;
    uint64_t v10 = v17;
    uint64_t v11 = 0x800000025E66C240;
    uint64_t v12 = 160;
    goto LABEL_11;
  }
  if (v3 > 0x3D)
  {
    sub_25E64EBC8();
    swift_allocError();
    uint64_t v8 = 0xD00000000000001BLL;
    uint64_t v10 = v15;
    uint64_t v11 = 0x800000025E66C260;
    uint64_t v12 = 168;
    goto LABEL_11;
  }
  return result;
}

uint64_t (*UTCTime.year.modify(void *a1))(uint64_t a1)
{
  *a1 = *v1;
  a1[1] = v1;
  return sub_25E663CC0;
}

uint64_t sub_25E663CC0(uint64_t a1)
{
  **(void **)(a1 + 8) = *(void *)a1;
  return sub_25E6639F4();
}

uint64_t UTCTime.month.getter()
{
  return *(void *)(v0 + 8);
}

uint64_t sub_25E663D44(void *a1, uint64_t a2)
{
  *(void *)(a2 + 8) = *a1;
  return sub_25E6639F4();
}

uint64_t UTCTime.month.setter(uint64_t a1)
{
  *(void *)(v1 + 8) = a1;
  return sub_25E6639F4();
}

uint64_t (*UTCTime.month.modify(void *a1))(void *a1)
{
  *a1 = *(void *)(v1 + 8);
  a1[1] = v1;
  return sub_25E663E50;
}

uint64_t sub_25E663E50(void *a1)
{
  *(void *)(a1[1] + 8) = *a1;
  return sub_25E6639F4();
}

uint64_t UTCTime.day.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t sub_25E663ED4(void *a1, uint64_t a2)
{
  *(void *)(a2 + 16) = *a1;
  return sub_25E6639F4();
}

uint64_t UTCTime.day.setter(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return sub_25E6639F4();
}

uint64_t (*UTCTime.day.modify(void *a1))(void *a1)
{
  *a1 = *(void *)(v1 + 16);
  a1[1] = v1;
  return sub_25E663FF8;
}

uint64_t sub_25E663FF8(void *a1)
{
  *(void *)(a1[1] + 16) = *a1;
  return sub_25E6639F4();
}

uint64_t UTCTime.hours.getter()
{
  return *(void *)(v0 + 24);
}

uint64_t sub_25E66407C(void *a1, uint64_t a2)
{
  *(void *)(a2 + 24) = *a1;
  return sub_25E6639F4();
}

uint64_t UTCTime.hours.setter(uint64_t a1)
{
  *(void *)(v1 + 24) = a1;
  return sub_25E6639F4();
}

uint64_t (*UTCTime.hours.modify(void *a1))(void *a1)
{
  *a1 = *(void *)(v1 + 24);
  a1[1] = v1;
  return sub_25E664198;
}

uint64_t sub_25E664198(void *a1)
{
  *(void *)(a1[1] + 24) = *a1;
  return sub_25E6639F4();
}

uint64_t UTCTime.minutes.getter()
{
  return *(void *)(v0 + 32);
}

uint64_t sub_25E66421C(void *a1, uint64_t a2)
{
  *(void *)(a2 + 32) = *a1;
  return sub_25E6639F4();
}

uint64_t UTCTime.minutes.setter(uint64_t a1)
{
  *(void *)(v1 + 32) = a1;
  return sub_25E6639F4();
}

uint64_t (*UTCTime.minutes.modify(void *a1))(void *a1)
{
  *a1 = *(void *)(v1 + 32);
  a1[1] = v1;
  return sub_25E664328;
}

uint64_t sub_25E664328(void *a1)
{
  *(void *)(a1[1] + 32) = *a1;
  return sub_25E6639F4();
}

uint64_t UTCTime.seconds.getter()
{
  return *(void *)(v0 + 40);
}

uint64_t sub_25E6643AC(void *a1, uint64_t a2)
{
  *(void *)(a2 + 40) = *a1;
  return sub_25E6639F4();
}

uint64_t UTCTime.seconds.setter(uint64_t a1)
{
  *(void *)(v1 + 40) = a1;
  return sub_25E6639F4();
}

uint64_t (*UTCTime.seconds.modify(void *a1))(void *a1)
{
  *a1 = *(void *)(v1 + 40);
  a1[1] = v1;
  return sub_25E6644B8;
}

uint64_t sub_25E6644B8(void *a1)
{
  *(void *)(a1[1] + 40) = *a1;
  return sub_25E6639F4();
}

void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> UTCTime.init(year:month:day:hours:minutes:seconds:)(SwiftASN1::UTCTime *__return_ptr retstr, Swift::Int year, Swift::Int month, Swift::Int day, Swift::Int hours, Swift::Int minutes, Swift::Int seconds)
{
  sub_25E6639F4();
  if (!v7)
  {
    retstr->_year = year;
    retstr->_month = month;
    retstr->_day = day;
    retstr->_hours = hours;
    retstr->_minutes = minutes;
    retstr->_seconds = seconds;
  }
}

uint64_t UTCTime.init(derEncoded:withIdentifier:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v5 = *(void *)(result + 16);
  uint64_t v6 = *(void *)(result + 24);
  uint64_t v7 = *(void *)(result + 32);
  unint64_t v8 = *(void *)(result + 40);
  uint64_t v9 = *(void *)(result + 48);
  uint64_t v10 = *(unsigned __int8 *)(result + 56);
  if (*(void *)result == *(void *)a2 && *(unsigned __int8 *)(result + 8) == *(unsigned __int8 *)(a2 + 8))
  {
    if (*(unsigned char *)(result + 56))
    {
      uint64_t v11 = swift_unknownObjectRetain();
      j__swift_unknownObjectRelease(v11, v6, v7, v8, v9, 1);
      swift_unknownObjectRelease();
      sub_25E664ECC(v6, v7, v8, (uint64_t *)v15);
      uint64_t result = j__swift_unknownObjectRelease(v5, v6, v7, v8, v9, 1);
      if (!v3)
      {
        long long v12 = v15[1];
        long long v13 = v15[2];
        *a3 = v15[0];
        a3[1] = v12;
        a3[2] = v13;
      }
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    sub_25E64EBC8();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/UTCTime.swift", 23, 2, 123, v14);
    j__swift_unknownObjectRelease(v5, v6, v7, v8, v9, v10);
    swift_unknownObjectRelease();
    return swift_willThrow();
  }
  return result;
}

uint64_t UTCTime.serialize(into:withIdentifier:)(char **a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  long long v5 = v2[1];
  long long v9 = *v2;
  long long v10 = v5;
  long long v11 = v2[2];
  uint64_t v7 = v3;
  char v8 = v4;
  return sub_25E6504FC(&v7, 0, a1, (uint64_t (*)(char **))sub_25E664B64);
}

uint64_t sub_25E664794(uint64_t a1, _OWORD *a2)
{
  long long v2 = a2[1];
  v4[0] = *a2;
  v4[1] = v2;
  _OWORD v4[2] = a2[2];
  return sub_25E6651CC((unint64_t *)v4);
}

uint64_t UTCTime.hash(into:)()
{
  return sub_25E6699D0();
}

uint64_t UTCTime.hashValue.getter()
{
  return sub_25E669A00();
}

void sub_25E6648F8(uint64_t a1@<X8>)
{
  *(void *)a1 = 23;
  *(unsigned char *)(a1 + 8) = 0;
}

uint64_t sub_25E664908@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, _OWORD *a3@<X8>)
{
  char v3 = *((unsigned char *)a2 + 8);
  uint64_t v5 = *a2;
  char v6 = v3;
  return UTCTime.init(derEncoded:withIdentifier:)(a1, (uint64_t)&v5, a3);
}

uint64_t sub_25E66493C(char **a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  long long v5 = v2[1];
  long long v9 = *v2;
  long long v10 = v5;
  long long v11 = v2[2];
  uint64_t v7 = v3;
  char v8 = v4;
  return sub_25E6504FC(&v7, 0, a1, (uint64_t (*)(char **))sub_25E664D40);
}

uint64_t sub_25E6649A8()
{
  return sub_25E669A00();
}

uint64_t sub_25E664A4C()
{
  return sub_25E6699D0();
}

uint64_t sub_25E664AC0()
{
  return sub_25E669A00();
}

uint64_t sub_25E664B64()
{
  uint64_t v1 = *(_OWORD **)(v0 + 16);
  long long v2 = v1[1];
  v4[0] = *v1;
  v4[1] = v2;
  _OWORD v4[2] = v1[2];
  return sub_25E6651CC((unint64_t *)v4);
}

BOOL _s9SwiftASN17UTCTimeV2eeoiySbAC_ACtFZ_0(int64x2_t *a1, int64x2_t *a2)
{
  BOOL result = 0;
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(*a1, *a2), (int32x4_t)vceqq_s64(a1[1], a2[1]))), 0xFuLL))) & 1) != 0&& a1[2].i64[0] == a2[2].i64[0])
  {
    return a1[2].i64[1] == a2[2].i64[1];
  }
  return result;
}

unint64_t sub_25E664C10()
{
  unint64_t result = qword_26A6FE840;
  if (!qword_26A6FE840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6FE840);
  }
  return result;
}

void *sub_25E664C64@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_25E664C74@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(result + 8);
  return result;
}

uint64_t sub_25E664C84@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(result + 16);
  return result;
}

uint64_t sub_25E664C94@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(result + 24);
  return result;
}

uint64_t sub_25E664CA4@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(result + 32);
  return result;
}

uint64_t sub_25E664CB4@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(result + 40);
  return result;
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

uint64_t getEnumTagSinglePayload for UTCTime(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 48)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for UTCTime(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 48) = v3;
  return result;
}

ValueMetadata *type metadata accessor for UTCTime()
{
  return &type metadata for UTCTime;
}

uint64_t sub_25E664D40()
{
  return sub_25E664B64();
}

uint64_t static ArraySlice<A>.isSigned.getter()
{
  return 0;
}

uint64_t ArraySlice<A>.withBigEndianIntegerBytes<A>(_:)(uint64_t (*a1)(uint64_t, uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return a1(a3, a4, a5, a6);
}

unint64_t sub_25E664DA4()
{
  unint64_t result = qword_26A6FE848;
  if (!qword_26A6FE848)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6FE498);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6FE848);
  }
  return result;
}

uint64_t sub_25E664E00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5[2] = a3;
  v5[3] = a1;
  v5[4] = a2;
  return ArraySlice<A>.withBigEndianIntegerBytes<A>(_:)(sub_25E664E48, (uint64_t)v5, *v3, v3[1], v3[2], v3[3]);
}

uint64_t sub_25E664E48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v7[3] = a4;
  long long v5 = *(uint64_t (**)(void *))(v4 + 24);
  v7[0] = a1;
  v7[1] = a2;
  uint64_t v7[2] = a3;
  return v5(v7);
}

uint64_t sub_25E664E84()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3] >> 1;
  if (v1 == v2)
  {
    int v3 = 0;
  }
  else
  {
    if (v1 >= v2)
    {
      __break(1u);
      return result;
    }
    int v3 = *(unsigned __int8 *)(v0[1] + v1);
    v0[2] = v1 + 1;
  }
  return v3 | ((v1 == v2) << 8);
}

void sub_25E664ECC(uint64_t a1@<X1>, uint64_t a2@<X2>, unint64_t a3@<X3>, uint64_t *a4@<X8>)
{
  sub_25E665630();
  if (v7 & 1) != 0 || (uint64_t v8 = v6, sub_25E665630(), (v10) || (v11 = v9, sub_25E665630(), (v13))
  {
    sub_25E64EBC8();
    swift_allocError();
    uint64_t v30 = 0xD00000000000002FLL;
    unint64_t v29 = v25;
    uint64_t v31 = 0x800000025E66C420;
    uint64_t v32 = 69;
    goto LABEL_19;
  }
  uint64_t v14 = v12;
  sub_25E665630();
  if (v16 & 1) != 0 || (uint64_t v17 = v15, sub_25E665630(), (v19) || (v20 = v18, sub_25E665630(), (v22))
  {
    sub_25E64EBC8();
    swift_allocError();
    uint64_t v30 = 0xD000000000000035;
    unint64_t v29 = v26;
    uint64_t v31 = 0x800000025E66C450;
    uint64_t v32 = 77;
    goto LABEL_19;
  }
  unint64_t v23 = a3 >> 1;
  if (a2 == a3 >> 1) {
    goto LABEL_22;
  }
  if (a2 >= (uint64_t)(a3 >> 1))
  {
    __break(1u);
LABEL_23:
    __break(1u);
    return;
  }
  if (*(unsigned char *)(a1 + a2) != 90)
  {
LABEL_22:
    sub_25E64EBC8();
    swift_allocError();
    uint64_t v30 = 0xD00000000000001CLL;
    unint64_t v29 = v27;
    uint64_t v31 = 0x800000025E66C490;
    uint64_t v32 = 82;
    goto LABEL_19;
  }
  if (__OFSUB__(v23, a2 + 1)) {
    goto LABEL_23;
  }
  if (v23 != a2 + 1)
  {
    sub_25E64EBC8();
    swift_allocError();
    unint64_t v29 = v28;
    uint64_t v30 = 0xD000000000000019;
    uint64_t v31 = 0x800000025E66C4B0;
    uint64_t v32 = 87;
LABEL_19:
    static ASN1Error.invalidASN1Object(reason:file:line:)(v30, v31, (uint64_t)"SwiftASN1/TimeUtilities.swift", 29, 2, v32, v29);
    swift_unknownObjectRetain();
    swift_willThrow();
    swift_unknownObjectRelease();
    return;
  }
  uint64_t v24 = 1900;
  if (v8 < 50) {
    uint64_t v24 = 2000;
  }
  uint64_t v37 = v24 + v8;
  uint64_t v33 = v21;
  swift_unknownObjectRetain();
  sub_25E6639F4();
  swift_unknownObjectRelease();
  if (!v4)
  {
    *a4 = v37;
    a4[1] = v11;
    a4[2] = v14;
    a4[3] = v17;
    a4[4] = v20;
    a4[5] = v33;
  }
}

uint64_t sub_25E6651CC(unint64_t *a1)
{
  unint64_t v3 = *a1;
  if (*a1 - 2050 < 0xFFFFFFFFFFFFFF9CLL)
  {
    __break(1u);
LABEL_9:
    uint64_t result = (uint64_t)sub_25E64EE6C(0, *(void *)(v1 + 16) + 1, 1, (char *)v1);
    uint64_t v1 = result;
    goto LABEL_5;
  }
  uint64_t v5 = a1[4];
  uint64_t v4 = a1[5];
  uint64_t v7 = a1[2];
  uint64_t v6 = a1[3];
  uint64_t v8 = a1[1];
  uint64_t v9 = -2000;
  if (v3 < 0x7D0) {
    uint64_t v9 = -1900;
  }
  sub_25E665F4C(v3 + v9);
  sub_25E665F4C(v8);
  sub_25E665F4C(v7);
  sub_25E665F4C(v6);
  sub_25E665F4C(v5);
  sub_25E665F4C(v4);
  uint64_t v1 = *v2;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  unint64_t v12 = *(void *)(v1 + 16);
  unint64_t v11 = *(void *)(v1 + 24);
  if (v12 >= v11 >> 1)
  {
    uint64_t result = (uint64_t)sub_25E64EE6C((char *)(v11 > 1), v12 + 1, 1, (char *)v1);
    uint64_t v1 = result;
  }
  *(void *)(v1 + 16) = v12 + 1;
  *(unsigned char *)(v1 + v12 + 32) = 90;
  *uint64_t v2 = v1;
  return result;
}

void sub_25E6652CC(uint64_t a1@<X1>, uint64_t a2@<X2>, unint64_t a3@<X3>, void *a4@<X8>)
{
  uint64_t v5 = v4;
  sub_25E665630();
  if ((v8 & 1) != 0
    || (uint64_t v9 = v7, sub_25E665630(), (v11 & 1) != 0)
    || (uint64_t v12 = v10, sub_25E665630(), (v14 & 1) != 0)
    || (uint64_t v15 = v13, sub_25E665630(), (v17 & 1) != 0))
  {
    sub_25E64EBC8();
    swift_allocError();
    uint64_t v29 = 0xD000000000000037;
    uint64_t v31 = v30;
    uint64_t v32 = 0x800000025E66C2B0;
    uint64_t v33 = 24;
LABEL_11:
    static ASN1Error.invalidASN1Object(reason:file:line:)(v29, v32, (uint64_t)"SwiftASN1/TimeUtilities.swift", 29, 2, v33, v31);
    swift_unknownObjectRetain();
    swift_willThrow();
    goto LABEL_12;
  }
  uint64_t v18 = v16;
  sub_25E665630();
  if (v20 & 1) != 0 || (uint64_t v21 = v19, sub_25E665630(), v44 = v22, (v23) || (sub_25E665630(), (v25))
  {
    sub_25E64EBC8();
    swift_allocError();
    uint64_t v29 = 0xD00000000000003DLL;
    uint64_t v31 = v34;
    uint64_t v32 = 0x800000025E66C310;
    uint64_t v33 = 33;
    goto LABEL_11;
  }
  uint64_t v43 = v24;
  uint64_t v26 = a2;
  int64_t v27 = a3 >> 1;
  if (a2 == a3 >> 1)
  {
    swift_unknownObjectRetain();
    uint64_t v28 = 0;
    goto LABEL_20;
  }
  if (a2 >= (uint64_t)(a3 >> 1))
  {
    __break(1u);
    goto LABEL_30;
  }
  int v42 = *(unsigned __int8 *)(a1 + a2);
  swift_unknownObjectRetain();
  uint64_t v28 = 0;
  if (v42 == 46)
  {
    sub_25E6656B8();
    if (!v5)
    {
      uint64_t v28 = v35;
      uint64_t v26 = a2;
      int64_t v27 = a3 >> 1;
      goto LABEL_20;
    }
LABEL_12:
    swift_unknownObjectRelease();
    return;
  }
LABEL_20:
  if (v26 == v27)
  {
LABEL_28:
    sub_25E64EBC8();
    swift_allocError();
    uint64_t v39 = 0xD000000000000024;
    uint64_t v38 = v36;
    uint64_t v40 = 0x800000025E66C350;
    uint64_t v41 = 44;
    goto LABEL_29;
  }
  if (v26 >= v27)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  if (*(unsigned char *)(a1 + v26) != 90) {
    goto LABEL_28;
  }
  if (__OFSUB__(v27, v26 + 1))
  {
LABEL_31:
    __break(1u);
    return;
  }
  if (v27 != v26 + 1)
  {
    sub_25E64EBC8();
    swift_allocError();
    uint64_t v38 = v37;
    uint64_t v39 = 0xD000000000000021;
    uint64_t v40 = 0x800000025E66C380;
    uint64_t v41 = 49;
LABEL_29:
    static ASN1Error.invalidASN1Object(reason:file:line:)(v39, v40, (uint64_t)"SwiftASN1/TimeUtilities.swift", 29, 2, v41, v38);
    swift_willThrow();
    goto LABEL_12;
  }
  sub_25E66666C();
  swift_unknownObjectRelease();
  if (!v5)
  {
    *a4 = v12 + 100 * v9;
    a4[1] = v15;
    a4[2] = v18;
    a4[3] = v21;
    a4[4] = v44;
    a4[5] = v43;
    a4[6] = v28;
  }
}

void sub_25E665630()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24) >> 1;
  if (v1 != v2)
  {
    if (v1 < v2)
    {
      *(void *)(v0 + 16) = v1 + 1;
      sub_25E664E84();
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t sub_25E6656B8()
{
  uint64_t result = sub_25E664E84();
  if ((result & 0x100) != 0) {
    goto LABEL_32;
  }
  if (result != 46)
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
    return result;
  }
  int64_t v3 = v0[2];
  unint64_t v2 = v0[3];
  unint64_t v4 = v2 >> 1;
  if (v3 == v2 >> 1) {
    goto LABEL_6;
  }
  if (v3 >= (uint64_t)(v2 >> 1)) {
    goto LABEL_31;
  }
  uint64_t v5 = v0[1];
  unsigned int v6 = *(unsigned __int8 *)(v5 + v3);
  if (v6 - 58 < 0xFFFFFFF6)
  {
LABEL_6:
    sub_25E64EBC8();
    swift_allocError();
    char v8 = v7;
    uint64_t v9 = 0xD000000000000024;
    uint64_t v10 = 0x800000025E66C3B0;
    uint64_t v11 = 194;
LABEL_7:
    static ASN1Error.invalidASN1Object(reason:file:line:)(v9, v10, (uint64_t)"SwiftASN1/TimeUtilities.swift", 29, 2, v11, v8);
    return swift_willThrow();
  }
  uint64_t v12 = 0;
  unint64_t v13 = v2 & 0xFFFFFFFFFFFFFFFELL;
  int64_t v14 = v3 + 1;
  uint64_t v15 = 1;
  while (1)
  {
    uint64_t v16 = v6 - 48;
    if (__OFSUB__(v4, v14 - 1))
    {
      __break(1u);
LABEL_27:
      __break(1u);
LABEL_28:
      __break(1u);
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
    if ((uint64_t)v4 <= v14 - 1) {
      goto LABEL_27;
    }
    if ((uint64_t)(v2 >> 1) <= v14 - 1) {
      goto LABEL_28;
    }
    if (v2 >> 1 < v4) {
      goto LABEL_29;
    }
    unint64_t v17 = v2 & 1;
    uint64_t v18 = (unsigned __int128)(v12 * (__int128)10) >> 64;
    uint64_t v19 = 10 * v12;
    BOOL v20 = v18 != v19 >> 63;
    uint64_t result = 10 * v15;
    BOOL v21 = __OFADD__(v19, v16);
    uint64_t v12 = v19 + v16;
    char v22 = v21;
    if ((unsigned __int128)(v15 * (__int128)10) >> 64 == result >> 63) {
      v15 *= 10;
    }
    unint64_t v2 = v17 | v13;
    if (v20 || (v22 & 1) != 0)
    {
      v0[2] = v14;
      v0[3] = v2;
      sub_25E64EBC8();
      swift_allocError();
      uint64_t v9 = 0xD000000000000036;
      char v8 = v23;
      uint64_t v10 = 0x800000025E66C3E0;
      uint64_t v11 = 185;
      goto LABEL_7;
    }
    if (v4 == v14) {
      break;
    }
    unsigned int v6 = *(unsigned __int8 *)(v5 + v14++);
    if (v6 - 58 < 0xFFFFFFF6)
    {
      unint64_t v4 = v14 - 1;
      break;
    }
  }
  v0[2] = v4;
  v0[3] = v2;
  if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * v12 + 0x1999999999999998, 1) <= 0x1999999999999998uLL) {
    goto LABEL_6;
  }
  return result;
}

uint64_t sub_25E6658CC(uint64_t a1)
{
  unint64_t v2 = *(char **)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  double v7 = *(double *)(a1 + 48);
  sub_25E665D40(*(void *)a1);
  sub_25E665F4C((uint64_t)v2);
  sub_25E665F4C(v3);
  sub_25E665F4C(v4);
  sub_25E665F4C(v5);
  sub_25E665F4C(v6);
  if (v7 == 0.0) {
    goto LABEL_46;
  }
  double v8 = v7 * 1.0e18;
  if ((~COERCE__INT64(v7 * 1.0e18) & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_56;
  }
  if (v8 <= -9.22337204e18)
  {
LABEL_56:
    __break(1u);
    goto LABEL_57;
  }
  if (v8 < 9.22337204e18)
  {
    unint64_t v9 = (uint64_t)v8;
    if ((uint64_t)v8 < 1)
    {
      unint64_t v2 = (char *)MEMORY[0x263F8EE78];
    }
    else
    {
      unint64_t v2 = sub_25E64EE6C(0, 1, 1, MEMORY[0x263F8EE78]);
      unint64_t v10 = *((void *)v2 + 2);
      do
      {
        unint64_t v11 = *((void *)v2 + 3);
        if (v10 >= v11 >> 1) {
          unint64_t v2 = sub_25E64EE6C((char *)(v11 > 1), v10 + 1, 1, v2);
        }
        *((void *)v2 + 2) = v10 + 1;
        v2[v10++ + 32] = (v9 % 0xA) | 0x30;
        BOOL v12 = v9 > 9;
        v9 /= 0xAuLL;
      }
      while (v12);
    }
    if (swift_isUniquelyReferenced_nonNull_native()) {
      goto LABEL_13;
    }
    goto LABEL_58;
  }
LABEL_57:
  __break(1u);
LABEL_58:
  unint64_t v2 = sub_25E64EE6C(0, *((void *)v2 + 2) + 1, 1, v2);
LABEL_13:
  unint64_t v14 = *((void *)v2 + 2);
  unint64_t v13 = *((void *)v2 + 3);
  uint64_t v15 = v14 + 1;
  if (v14 >= v13 >> 1) {
    unint64_t v2 = sub_25E64EE6C((char *)(v13 > 1), v14 + 1, 1, v2);
  }
  uint64_t v16 = v2 + 32;
  *((void *)v2 + 2) = v15;
  v2[v14 + 32] = 46;
  uint64_t v36 = (void *)v1;
  if (v14)
  {
    int64_t v17 = 0;
    do
    {
      unint64_t v18 = *((void *)v2 + 2);
      if (v17 >= v18)
      {
LABEL_51:
        __break(1u);
LABEL_52:
        __break(1u);
LABEL_53:
        __break(1u);
        goto LABEL_54;
      }
      if (v14 >= v18) {
        goto LABEL_52;
      }
      char v19 = v16[v17];
      v16[v17] = v16[v14];
      v16[v14] = v19;
      ++v17;
      --v14;
    }
    while (v17 < (uint64_t)v14);
    uint64_t v20 = *((void *)v2 + 2);
    if (v20) {
      goto LABEL_23;
    }
  }
  else
  {
    uint64_t v20 = 1;
LABEL_23:
    if (v16[v20 - 1] == 48)
    {
      uint64_t v15 = (uint64_t)v2;
      do
      {
        unint64_t v21 = 0;
        char v22 = (char *)MEMORY[0x263F8EE78];
        unint64_t v2 = (char *)MEMORY[0x263F8EE78];
        do
        {
          while (1)
          {
            if (v21 >= *(void *)(v15 + 16))
            {
              __break(1u);
              goto LABEL_51;
            }
            char v23 = *(unsigned char *)(v15 + 32 + v21);
            unint64_t v24 = v21 + 1;
            if (*((void *)v22 + 2)) {
              break;
            }
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            uint64_t v37 = v22;
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            {
              unint64_t v1 = (unint64_t)&v37;
              sub_25E65FE70(0, 1, 1);
              char v22 = v37;
            }
            unint64_t v27 = *((void *)v22 + 2);
            unint64_t v26 = *((void *)v22 + 3);
            if (v27 >= v26 >> 1)
            {
              unint64_t v1 = (unint64_t)&v37;
              sub_25E65FE70((char *)(v26 > 1), v27 + 1, 1);
              char v22 = v37;
            }
            *((void *)v22 + 2) = v27 + 1;
            v22[v27 + 32] = v23;
            unint64_t v21 = v24;
            if (v20 == v24) {
              goto LABEL_43;
            }
          }
          unint64_t v1 = v22[32];
          char v28 = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v38 = v2;
          if ((v28 & 1) == 0)
          {
            sub_25E65FE70(0, *((void *)v2 + 2) + 1, 1);
            unint64_t v2 = v38;
          }
          unint64_t v30 = *((void *)v2 + 2);
          unint64_t v29 = *((void *)v2 + 3);
          unint64_t v31 = v30 + 1;
          if (v30 >= v29 >> 1)
          {
            sub_25E65FE70((char *)(v29 > 1), v30 + 1, 1);
            unint64_t v31 = v30 + 1;
            unint64_t v1 = v1;
            unint64_t v2 = v38;
          }
          *((void *)v2 + 2) = v31;
          v2[v30 + 32] = v1;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            char v22 = sub_25E66636C((uint64_t)v22);
          }
          if (!*((void *)v22 + 2)) {
            goto LABEL_53;
          }
          v22[32] = v23;
        }
        while (v20 - 1 != v21++);
LABEL_43:
        swift_bridgeObjectRelease();
        swift_release();
        uint64_t v20 = *((void *)v2 + 2);
        if (!v20) {
          break;
        }
        uint64_t v15 = (uint64_t)v2;
      }
      while (v2[v20 + 31] == 48);
    }
  }
  unint64_t v1 = (unint64_t)v36;
  sub_25E65BBE4((uint64_t)v2);
LABEL_46:
  uint64_t v15 = *(void *)v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
LABEL_54:
    uint64_t result = (uint64_t)sub_25E64EE6C(0, *(void *)(v15 + 16) + 1, 1, (char *)v15);
    uint64_t v15 = result;
  }
  unint64_t v35 = *(void *)(v15 + 16);
  unint64_t v34 = *(void *)(v15 + 24);
  if (v35 >= v34 >> 1)
  {
    uint64_t result = (uint64_t)sub_25E64EE6C((char *)(v34 > 1), v35 + 1, 1, (char *)v15);
    uint64_t v15 = result;
  }
  *(void *)(v15 + 16) = v35 + 1;
  *(unsigned char *)(v15 + v35 + 32) = 90;
  *(void *)unint64_t v1 = v15;
  return result;
}

uint64_t sub_25E665D40(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_25E64EE6C(0, *(void *)(v3 + 16) + 1, 1, (char *)v3);
    uint64_t v3 = result;
  }
  unint64_t v6 = *(void *)(v3 + 16);
  unint64_t v5 = *(void *)(v3 + 24);
  int64_t v7 = v5 >> 1;
  unint64_t v8 = v6 + 1;
  if (v5 >> 1 <= v6)
  {
    uint64_t result = (uint64_t)sub_25E64EE6C((char *)(v5 > 1), v6 + 1, 1, (char *)v3);
    uint64_t v3 = result;
    unint64_t v5 = *(void *)(result + 24);
    int64_t v7 = v5 >> 1;
  }
  uint64_t v9 = (unsigned __int128)(a1 / 1000 * (__int128)0x6666666666666667) >> 64;
  *(void *)(v3 + 16) = v8;
  *(unsigned char *)(v3 + v6 + 32) = a1 / 1000 - 10 * ((v9 < 0) + (v9 >> 2)) + 48;
  unint64_t v10 = v6 + 2;
  if (v7 < (uint64_t)(v6 + 2))
  {
    uint64_t result = (uint64_t)sub_25E64EE6C((char *)(v5 > 1), v6 + 2, 1, (char *)v3);
    uint64_t v3 = result;
    unint64_t v5 = *(void *)(result + 24);
    int64_t v7 = v5 >> 1;
  }
  uint64_t v11 = (unsigned __int128)(a1 / 100 * (__int128)0x6666666666666667) >> 64;
  *(void *)(v3 + 16) = v10;
  *(unsigned char *)(v3 + v8 + 32) = a1 / 100 - 10 * ((v11 < 0) + (v11 >> 2)) + 48;
  unint64_t v12 = v6 + 3;
  if (v7 < (uint64_t)(v6 + 3))
  {
    uint64_t result = (uint64_t)sub_25E64EE6C((char *)(v5 > 1), v6 + 3, 1, (char *)v3);
    uint64_t v3 = result;
    unint64_t v5 = *(void *)(result + 24);
    int64_t v7 = v5 >> 1;
  }
  uint64_t v13 = (unsigned __int128)(a1 / 10 * (__int128)0x6666666666666667) >> 64;
  *(void *)(v3 + 16) = v12;
  *(unsigned char *)(v3 + v10 + 32) = a1 / 10 - 10 * ((v13 < 0) + (v13 >> 2)) + 48;
  if (v7 < (uint64_t)(v6 + 4))
  {
    uint64_t result = (uint64_t)sub_25E64EE6C((char *)(v5 > 1), v6 + 4, 1, (char *)v3);
    uint64_t v3 = result;
  }
  *(void *)(v3 + 16) = v6 + 4;
  *(unsigned char *)(v3 + v12 + 32) = a1 % 10 + 48;
  *unint64_t v1 = v3;
  return result;
}

uint64_t sub_25E665F4C(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_25E64EE6C(0, *(void *)(v3 + 16) + 1, 1, (char *)v3);
    uint64_t v3 = result;
  }
  unint64_t v6 = *(void *)(v3 + 16);
  unint64_t v5 = *(void *)(v3 + 24);
  int64_t v7 = v5 >> 1;
  unint64_t v8 = v6 + 1;
  if (v5 >> 1 <= v6)
  {
    uint64_t result = (uint64_t)sub_25E64EE6C((char *)(v5 > 1), v6 + 1, 1, (char *)v3);
    uint64_t v3 = result;
    unint64_t v5 = *(void *)(result + 24);
    int64_t v7 = v5 >> 1;
  }
  uint64_t v9 = (unsigned __int128)(a1 / 10 * (__int128)0x6666666666666667) >> 64;
  *(void *)(v3 + 16) = v8;
  *(unsigned char *)(v3 + v6 + 32) = a1 / 10 - 10 * ((v9 < 0) + (v9 >> 2)) + 48;
  int64_t v10 = v6 + 2;
  if (v7 < v10)
  {
    uint64_t result = (uint64_t)sub_25E64EE6C((char *)(v5 > 1), v10, 1, (char *)v3);
    uint64_t v3 = result;
  }
  *(void *)(v3 + 16) = v10;
  *(unsigned char *)(v3 + v8 + 32) = a1 % 10 + 48;
  *unint64_t v1 = v3;
  return result;
}

char *sub_25E66606C(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B38DC40);
    int64_t v10 = (char *)swift_allocObject();
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
    int64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
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
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_25E666170(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B38DC90);
    int64_t v10 = (char *)swift_allocObject();
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
    int64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
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

char *sub_25E66626C(char *result, int64_t a2, char a3, char *a4)
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
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B38DC98);
    int64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    int64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_release();
  return v10;
}

char *sub_25E666358(uint64_t a1)
{
  return sub_25E666170(0, *(void *)(a1 + 16), 0, (char *)a1);
}

char *sub_25E66636C(uint64_t a1)
{
  return sub_25E66626C(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_25E666380(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 - 1;
  uint64_t result = 31;
  switch(v2)
  {
    case 0:
    case 2:
    case 4:
    case 6:
    case 7:
    case 9:
    case 11:
      return result;
    case 1:
      if ((a2 & 3) == 0
        && (__ROR8__(0x8F5C28F5C28F5C29 * a2 + 0x51EB851EB851EB8, 2) <= 0x28F5C28F5C28F5CuLL
          ? (BOOL v4 = a2 % 400 == 0)
          : (BOOL v4 = 1),
            v4))
      {
        uint64_t result = 29;
      }
      else
      {
        uint64_t result = 28;
      }
      break;
    case 3:
    case 5:
    case 8:
    case 10:
      uint64_t result = 30;
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> GeneralizedTime.init(year:month:day:hours:minutes:seconds:fractionalSeconds:)(SwiftASN1::GeneralizedTime *__return_ptr retstr, Swift::Int year, Swift::Int month, Swift::Int day, Swift::Int hours, Swift::Int minutes, Swift::Int seconds, Swift::Double fractionalSeconds)
{
  sub_25E66666C();
  if (!v8)
  {
    retstr->_year = year;
    retstr->_month = month;
    retstr->_day = day;
    retstr->_hours = hours;
    retstr->_minutes = minutes;
    retstr->_seconds = seconds;
    retstr->_fractionalSeconds = fractionalSeconds;
  }
}

uint64_t GeneralizedTime.year.getter()
{
  return *(void *)v0;
}

uint64_t GeneralizedTime.month.getter()
{
  return *(void *)(v0 + 8);
}

uint64_t GeneralizedTime.day.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t GeneralizedTime.hours.getter()
{
  return *(void *)(v0 + 24);
}

uint64_t GeneralizedTime.minutes.getter()
{
  return *(void *)(v0 + 32);
}

uint64_t GeneralizedTime.seconds.getter()
{
  return *(void *)(v0 + 40);
}

double GeneralizedTime.fractionalSeconds.getter()
{
  return *(double *)(v0 + 48);
}

void static GeneralizedTime.defaultIdentifier.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 24;
  *(unsigned char *)(a1 + 8) = 0;
}

uint64_t sub_25E666568(void *a1, void *a2)
{
  *a2 = *a1;
  return sub_25E66666C();
}

uint64_t GeneralizedTime.year.setter(uint64_t a1)
{
  *unint64_t v1 = a1;
  return sub_25E66666C();
}

uint64_t sub_25E66666C()
{
  if (*(void *)v0 >> 4 > 0x270uLL)
  {
    sub_25E64EBC8();
    swift_allocError();
    uint64_t v2 = v1;
    uint64_t v3 = 0xD000000000000020;
    uint64_t v4 = 0x800000025E66C600;
    uint64_t v5 = 153;
LABEL_11:
    static ASN1Error.invalidASN1Object(reason:file:line:)(v3, v4, (uint64_t)"SwiftASN1/GeneralizedTime.swift", 31, 2, v5, v2);
    return swift_willThrow();
  }
  unint64_t v7 = *(void *)(v0 + 24);
  unint64_t v6 = *(void *)(v0 + 32);
  unint64_t v8 = *(void *)(v0 + 40);
  double v9 = *(double *)(v0 + 48);
  uint64_t v10 = *(void *)(v0 + 16);
  uint64_t result = sub_25E666380(*(void *)(v0 + 8), *(void *)v0);
  if (v12)
  {
    sub_25E64EBC8();
    swift_allocError();
    uint64_t v3 = 0xD000000000000029;
    uint64_t v2 = v15;
    uint64_t v4 = 0x800000025E66C4F0;
    uint64_t v5 = 158;
    goto LABEL_11;
  }
  if (v10 < 1 || result < v10)
  {
    sub_25E64EBC8();
    swift_allocError();
    uint64_t v3 = 0xD000000000000028;
    uint64_t v2 = v14;
    uint64_t v4 = 0x800000025E66C5D0;
    uint64_t v5 = 162;
    goto LABEL_11;
  }
  if (v7 > 0x17)
  {
    sub_25E64EBC8();
    swift_allocError();
    uint64_t v2 = v17;
    uint64_t v3 = 0xD000000000000020;
    uint64_t v4 = 0x800000025E66C520;
    uint64_t v5 = 166;
    goto LABEL_11;
  }
  if (v6 > 0x3B)
  {
    sub_25E64EBC8();
    swift_allocError();
    uint64_t v3 = 0xD000000000000022;
    uint64_t v2 = v18;
    uint64_t v4 = 0x800000025E66C550;
    uint64_t v5 = 170;
    goto LABEL_11;
  }
  if (v8 > 0x3D)
  {
    sub_25E64EBC8();
    swift_allocError();
    uint64_t v3 = 0xD00000000000001FLL;
    uint64_t v2 = v16;
    uint64_t v4 = 0x800000025E66C5B0;
    uint64_t v5 = 178;
    goto LABEL_11;
  }
  if (v9 < 0.0 || v9 >= 1.0)
  {
    sub_25E64EBC8();
    swift_allocError();
    uint64_t v3 = 0xD00000000000002ELL;
    uint64_t v2 = v19;
    uint64_t v4 = 0x800000025E66C580;
    uint64_t v5 = 183;
    goto LABEL_11;
  }
  return result;
}

uint64_t (*GeneralizedTime.year.modify(void *a1))(uint64_t a1)
{
  *a1 = *v1;
  a1[1] = v1;
  return sub_25E6669B8;
}

uint64_t sub_25E6669B8(uint64_t a1)
{
  **(void **)(a1 + 8) = *(void *)a1;
  return sub_25E66666C();
}

uint64_t sub_25E666A3C(void *a1, uint64_t a2)
{
  *(void *)(a2 + 8) = *a1;
  return sub_25E66666C();
}

uint64_t GeneralizedTime.month.setter(uint64_t a1)
{
  *(void *)(v1 + 8) = a1;
  return sub_25E66666C();
}

uint64_t (*GeneralizedTime.month.modify(void *a1))(void *a1)
{
  *a1 = *(void *)(v1 + 8);
  a1[1] = v1;
  return sub_25E666B60;
}

uint64_t sub_25E666B60(void *a1)
{
  *(void *)(a1[1] + 8) = *a1;
  return sub_25E66666C();
}

uint64_t sub_25E666BE4(void *a1, uint64_t a2)
{
  *(void *)(a2 + 16) = *a1;
  return sub_25E66666C();
}

uint64_t GeneralizedTime.day.setter(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return sub_25E66666C();
}

uint64_t (*GeneralizedTime.day.modify(void *a1))(void *a1)
{
  *a1 = *(void *)(v1 + 16);
  a1[1] = v1;
  return sub_25E666D18;
}

uint64_t sub_25E666D18(void *a1)
{
  *(void *)(a1[1] + 16) = *a1;
  return sub_25E66666C();
}

uint64_t sub_25E666D9C(void *a1, uint64_t a2)
{
  *(void *)(a2 + 24) = *a1;
  return sub_25E66666C();
}

uint64_t GeneralizedTime.hours.setter(uint64_t a1)
{
  *(void *)(v1 + 24) = a1;
  return sub_25E66666C();
}

uint64_t (*GeneralizedTime.hours.modify(void *a1))(void *a1)
{
  *a1 = *(void *)(v1 + 24);
  a1[1] = v1;
  return sub_25E666EC8;
}

uint64_t sub_25E666EC8(void *a1)
{
  *(void *)(a1[1] + 24) = *a1;
  return sub_25E66666C();
}

uint64_t sub_25E666F4C(void *a1, uint64_t a2)
{
  *(void *)(a2 + 32) = *a1;
  return sub_25E66666C();
}

uint64_t GeneralizedTime.minutes.setter(uint64_t a1)
{
  *(void *)(v1 + 32) = a1;
  return sub_25E66666C();
}

uint64_t (*GeneralizedTime.minutes.modify(void *a1))(void *a1)
{
  *a1 = *(void *)(v1 + 32);
  a1[1] = v1;
  return sub_25E667068;
}

uint64_t sub_25E667068(void *a1)
{
  *(void *)(a1[1] + 32) = *a1;
  return sub_25E66666C();
}

uint64_t sub_25E6670EC(void *a1, uint64_t a2)
{
  *(void *)(a2 + 40) = *a1;
  return sub_25E66666C();
}

uint64_t GeneralizedTime.seconds.setter(uint64_t a1)
{
  *(void *)(v1 + 40) = a1;
  return sub_25E66666C();
}

uint64_t (*GeneralizedTime.seconds.modify(void *a1))(void *a1)
{
  *a1 = *(void *)(v1 + 40);
  a1[1] = v1;
  return sub_25E667208;
}

uint64_t sub_25E667208(void *a1)
{
  *(void *)(a1[1] + 40) = *a1;
  return sub_25E66666C();
}

uint64_t sub_25E66728C(void *a1, uint64_t a2)
{
  *(void *)(a2 + 48) = *a1;
  return sub_25E66666C();
}

uint64_t GeneralizedTime.fractionalSeconds.setter(double a1)
{
  *(double *)(v1 + 48) = a1;
  return sub_25E66666C();
}

uint64_t (*GeneralizedTime.fractionalSeconds.modify(void *a1))(void *a1)
{
  a1[1] = v1;
  *a1 = *(void *)(v1 + 48);
  return sub_25E6673A4;
}

uint64_t sub_25E6673A4(void *a1)
{
  *(void *)(a1[1] + 48) = *a1;
  return sub_25E66666C();
}

uint64_t GeneralizedTime.init(derEncoded:withIdentifier:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = *(void *)(result + 16);
  uint64_t v6 = *(void *)(result + 24);
  uint64_t v7 = *(void *)(result + 32);
  unint64_t v8 = *(void *)(result + 40);
  uint64_t v9 = *(void *)(result + 48);
  uint64_t v10 = *(unsigned __int8 *)(result + 56);
  if (*(void *)result == *(void *)a2 && *(unsigned __int8 *)(result + 8) == *(unsigned __int8 *)(a2 + 8))
  {
    if (*(unsigned char *)(result + 56))
    {
      uint64_t v11 = swift_unknownObjectRetain();
      j__swift_unknownObjectRelease(v11, v6, v7, v8, v9, 1);
      swift_unknownObjectRelease();
      sub_25E6652CC(v6, v7, v8, v16);
      uint64_t result = j__swift_unknownObjectRelease(v5, v6, v7, v8, v9, 1);
      if (!v3)
      {
        uint64_t v12 = v17;
        long long v13 = v16[1];
        long long v14 = v16[2];
        *(_OWORD *)a3 = v16[0];
        *(_OWORD *)(a3 + 16) = v13;
        *(_OWORD *)(a3 + 32) = v14;
        *(void *)(a3 + 48) = v12;
      }
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    sub_25E64EBC8();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/GeneralizedTime.swift", 31, 2, 134, v15);
    j__swift_unknownObjectRelease(v5, v6, v7, v8, v9, v10);
    swift_unknownObjectRelease();
    return swift_willThrow();
  }
  return result;
}

uint64_t GeneralizedTime.serialize(into:withIdentifier:)(char **a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  long long v5 = v2[1];
  long long v9 = *v2;
  long long v10 = v5;
  long long v11 = v2[2];
  uint64_t v12 = *((void *)v2 + 6);
  uint64_t v7 = v3;
  char v8 = v4;
  return sub_25E6504FC(&v7, 0, a1, (uint64_t (*)(char **))sub_25E667924);
}

uint64_t sub_25E66761C(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  v4[0] = *(_OWORD *)a2;
  v4[1] = v2;
  _OWORD v4[2] = *(_OWORD *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 48);
  return sub_25E6658CC((uint64_t)v4);
}

uint64_t GeneralizedTime.hash(into:)()
{
  return sub_25E6699F0();
}

uint64_t GeneralizedTime.hashValue.getter()
{
  return sub_25E669A00();
}

void sub_25E6677AC(uint64_t a1@<X8>)
{
  *(void *)a1 = 24;
  *(unsigned char *)(a1 + 8) = 0;
}

uint64_t sub_25E6677BC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  char v3 = *((unsigned char *)a2 + 8);
  uint64_t v5 = *a2;
  char v6 = v3;
  return GeneralizedTime.init(derEncoded:withIdentifier:)(a1, (uint64_t)&v5, a3);
}

uint64_t sub_25E6677F0(char **a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  long long v5 = v2[1];
  long long v9 = *v2;
  long long v10 = v5;
  long long v11 = v2[2];
  uint64_t v12 = *((void *)v2 + 6);
  uint64_t v7 = v3;
  char v8 = v4;
  return sub_25E6504FC(&v7, 0, a1, (uint64_t (*)(char **))sub_25E667B34);
}

uint64_t sub_25E66786C()
{
  return sub_25E669A00();
}

uint64_t sub_25E667924()
{
  uint64_t v1 = *(void *)(v0 + 16);
  long long v2 = *(_OWORD *)(v1 + 16);
  v4[0] = *(_OWORD *)v1;
  v4[1] = v2;
  _OWORD v4[2] = *(_OWORD *)(v1 + 32);
  uint64_t v5 = *(void *)(v1 + 48);
  return sub_25E6658CC((uint64_t)v4);
}

BOOL _s9SwiftASN115GeneralizedTimeV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  BOOL result = 0;
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(*(int64x2_t *)a1, *(int64x2_t *)a2), (int32x4_t)vceqq_s64(*(int64x2_t *)(a1 + 16), *(int64x2_t *)(a2 + 16)))), 0xFuLL))) & 1) != 0&& *(void *)(a1 + 32) == *(void *)(a2 + 32)&& *(void *)(a1 + 40) == *(void *)(a2 + 40))
  {
    return *(double *)(a1 + 48) == *(double *)(a2 + 48);
  }
  return result;
}

unint64_t sub_25E6679EC()
{
  unint64_t result = qword_26A6FE850;
  if (!qword_26A6FE850)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6FE850);
  }
  return result;
}

void *sub_25E667A40@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_25E667A50@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(result + 8);
  return result;
}

uint64_t sub_25E667A60@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(result + 16);
  return result;
}

uint64_t sub_25E667A70@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(result + 24);
  return result;
}

uint64_t sub_25E667A80@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(result + 32);
  return result;
}

uint64_t sub_25E667A90@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(result + 40);
  return result;
}

double sub_25E667AA0@<D0>(uint64_t a1@<X0>, double *a2@<X8>)
{
  double result = *(double *)(a1 + 48);
  *a2 = result;
  return result;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for GeneralizedTime(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 56)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for GeneralizedTime(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 56) = v3;
  return result;
}

ValueMetadata *type metadata accessor for GeneralizedTime()
{
  return &type metadata for GeneralizedTime;
}

uint64_t sub_25E667B34()
{
  return sub_25E667924();
}

void static ASN1Null.defaultIdentifier.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 5;
  *(unsigned char *)(a1 + 8) = 0;
}

uint64_t ASN1Null.init(derEncoded:withIdentifier:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v2 = *(void *)(a1 + 24);
  uint64_t v5 = *(void *)(a1 + 32);
  unint64_t v4 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 56);
  if (*(void *)a1 == *(void *)a2
    && *(unsigned __int8 *)(a1 + 8) == *(unsigned __int8 *)(a2 + 8)
    && *(unsigned char *)(a1 + 56))
  {
    uint64_t v8 = swift_unknownObjectRetain();
    j__swift_unknownObjectRelease(v8, v2, v5, v4, v6, 1);
    uint64_t result = swift_unknownObjectRelease();
    if (__OFSUB__(v4 >> 1, v5))
    {
      __break(1u);
    }
    else
    {
      if (v4 >> 1 != v5)
      {
        sub_25E64EBC8();
        swift_allocError();
        static ASN1Error.invalidASN1Object(reason:file:line:)(0xD000000000000026, 0x800000025E66C650, (uint64_t)"SwiftASN1/ASN1Null.swift", 24, 2, 30, v10);
        swift_willThrow();
      }
      return j__swift_unknownObjectRelease(v3, v2, v5, v4, v6, 1);
    }
  }
  else
  {
    sub_25E64EBC8();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1Null.swift", 24, 2, 26, v11);
    j__swift_unknownObjectRelease(v3, v2, v5, v4, v6, v7);
    swift_unknownObjectRelease();
    return swift_willThrow();
  }
  return result;
}

uint64_t ASN1Null.serialize(into:withIdentifier:)(uint64_t *a1, uint64_t a2)
{
  char v2 = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void *)a2;
  char v5 = v2;
  return sub_25E64B12C(&v4, 0, a1);
}

uint64_t static ASN1Null.== infix(_:_:)()
{
  return 1;
}

uint64_t ASN1Null.hashValue.getter()
{
  return sub_25E669A00();
}

void sub_25E667D88(uint64_t a1@<X8>)
{
  *(void *)a1 = 5;
  *(unsigned char *)(a1 + 8) = 0;
}

uint64_t sub_25E667D98(uint64_t a1, uint64_t *a2)
{
  char v2 = *((unsigned char *)a2 + 8);
  uint64_t v4 = *a2;
  char v5 = v2;
  return ASN1Null.init(derEncoded:withIdentifier:)(a1, (uint64_t)&v4);
}

uint64_t sub_25E667DCC(uint64_t *a1, uint64_t a2)
{
  char v2 = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void *)a2;
  char v5 = v2;
  return sub_25E64B12C(&v4, 0, a1);
}

uint64_t sub_25E667E08()
{
  return sub_25E669A00();
}

uint64_t sub_25E667E40()
{
  return sub_25E669A00();
}

unint64_t sub_25E667E78()
{
  unint64_t result = qword_26A6FE858;
  if (!qword_26A6FE858)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6FE858);
  }
  return result;
}

ValueMetadata *type metadata accessor for ASN1Null()
{
  return &type metadata for ASN1Null;
}

void static ASN1BitString.defaultIdentifier.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 3;
  *(unsigned char *)(a1 + 8) = 0;
}

uint64_t ASN1BitString.bytes.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_25E667F28(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  uint64_t v5 = a1[2];
  uint64_t v6 = a1[3];
  swift_unknownObjectRetain_n();
  swift_unknownObjectRelease();
  *a2 = v3;
  a2[1] = v4;
  a2[2] = v5;
  a2[3] = v6;
  sub_25E66808C();

  return swift_unknownObjectRelease();
}

uint64_t ASN1BitString.bytes.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  *uint64_t v4 = a1;
  v4[1] = a2;
  _OWORD v4[2] = a3;
  _OWORD v4[3] = a4;
  sub_25E66808C();

  return swift_unknownObjectRelease();
}

void sub_25E66808C()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[3] >> 1;
  if (v1 == v3)
  {
    if (!v2) {
      return;
    }
    sub_25E64EBC8();
    swift_allocError();
    uint64_t v5 = v4;
    uint64_t v6 = 0xD000000000000030;
    uint64_t v7 = 0x800000025E66C730;
    uint64_t v8 = 93;
    goto LABEL_16;
  }
  if (v3 <= v1)
  {
    __break(1u);
    return;
  }
  int v9 = *(unsigned __int8 *)(v3 + v0[1] - 1);
  unint64_t v10 = v2 - 9;
  int v11 = -1 << v2;
  if ((unint64_t)v2 >= 8) {
    int v11 = 0;
  }
  unsigned int v12 = 0xFFu >> -(char)v2;
  if ((unint64_t)v2 <= 0xFFFFFFFFFFFFFFF8) {
    unsigned int v12 = 0;
  }
  if (v2 < 0) {
    unsigned int v13 = v12;
  }
  else {
    unsigned int v13 = v11;
  }
  if (v10 < 0xFFFFFFFFFFFFFFEFLL) {
    unsigned int v13 = 0;
  }
  if ((v9 & ~v13) != 0)
  {
    sub_25E64EBC8();
    swift_allocError();
    uint64_t v6 = 0xD00000000000003CLL;
    uint64_t v5 = v14;
    uint64_t v7 = 0x800000025E66C6F0;
    uint64_t v8 = 104;
LABEL_16:
    static ASN1Error.invalidASN1Object(reason:file:line:)(v6, v7, (uint64_t)"SwiftASN1/ASN1BitString.swift", 29, 2, v8, v5);
    swift_willThrow();
  }
}

void (*ASN1BitString.bytes.modify(void *a1))(uint64_t a1, char a2)
{
  *a1 = v1;
  return sub_25E668200;
}

void sub_25E668200(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    sub_25E66808C();
  }
}

uint64_t ASN1BitString.paddingBits.getter()
{
  return *(void *)(v0 + 32);
}

void sub_25E66827C(unint64_t *a1, uint64_t a2)
{
  unint64_t v2 = *a1;
  *(void *)(a2 + 32) = *a1;
  if (v2 > 7)
  {
    __break(1u);
    swift_unexpectedError();
    __break(1u);
  }
  else
  {
    sub_25E66808C();
  }
}

void ASN1BitString.paddingBits.setter(unint64_t a1)
{
  *(void *)(v1 + 32) = a1;
  if (a1 > 7)
  {
    __break(1u);
    swift_unexpectedError();
    __break(1u);
  }
  else
  {
    sub_25E66808C();
  }
}

void (*ASN1BitString.paddingBits.modify(void *a1))(uint64_t a1, char a2)
{
  *a1 = v1;
  return sub_25E668394;
}

void sub_25E668394(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    if (*(void *)(*(void *)a1 + 32) > 7uLL)
    {
      __break(1u);
      swift_unexpectedError();
      __break(1u);
    }
    else
    {
      sub_25E66808C();
    }
  }
}

void ASN1BitString.init(derEncoded:withIdentifier:)(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v5 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  unint64_t v7 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v10 = *(unsigned __int8 *)(a1 + 56);
  if (*(void *)a1 != *(void *)a2 || *(unsigned __int8 *)(a1 + 8) != *(unsigned __int8 *)(a2 + 8))
  {
    sub_25E64EBC8();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1BitString.swift", 29, 2, 53, v13);
    j__swift_unknownObjectRelease(v6, v5, v8, v7, v9, v10);
    swift_unknownObjectRelease();
    swift_willThrow();
    return;
  }
  if (!*(unsigned char *)(a1 + 56)) {
    goto LABEL_15;
  }
  uint64_t v11 = swift_unknownObjectRetain();
  j__swift_unknownObjectRelease(v11, v5, v8, v7, v9, 1);
  swift_unknownObjectRelease();
  if (v8 == v7 >> 1) {
    goto LABEL_12;
  }
  if (v8 < (uint64_t)(v7 >> 1))
  {
    unint64_t v12 = *(unsigned __int8 *)(v5 + v8);
    if (v12 <= 7)
    {
      if (__OFSUB__(v7 >> 1, v8)) {
        goto LABEL_14;
      }
      sub_25E66808C();
      if (!v3)
      {
        *a3 = v6;
        a3[1] = v5;
        a3[2] = v8 + 1;
        a3[3] = v7;
        a3[4] = v12;
        return;
      }
LABEL_13:
      j__swift_unknownObjectRelease(v6, v5, v8, v7, v9, 1);
      return;
    }
LABEL_12:
    sub_25E64EBC8();
    swift_allocError();
    static ASN1Error.invalidASN1Object(reason:file:line:)(0xD000000000000044, 0x800000025E66C6A0, (uint64_t)"SwiftASN1/ASN1BitString.swift", 29, 2, 62, v14);
    swift_willThrow();
    goto LABEL_13;
  }
  __break(1u);
LABEL_14:
  __break(1u);
LABEL_15:
  __break(1u);
}

uint64_t ASN1BitString.init(bytes:paddingBits:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  swift_unknownObjectRetain();
  sub_25E66808C();
  uint64_t result = swift_unknownObjectRelease();
  *a6 = a1;
  a6[1] = a2;
  a6[2] = a3;
  a6[3] = a4;
  a6[4] = a5;
  return result;
}

uint64_t ASN1BitString.serialize(into:withIdentifier:)(char **a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  long long v5 = v2[1];
  long long v9 = *v2;
  long long v10 = v5;
  uint64_t v11 = *((void *)v2 + 4);
  uint64_t v7 = v3;
  char v8 = v4;
  return sub_25E6504FC(&v7, 0, a1, sub_25E6528B0);
}

uint64_t sub_25E668734(char **a1, uint64_t *a2)
{
  char v4 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    char v4 = sub_25E64EE6C(0, *((void *)v4 + 2) + 1, 1, v4);
  }
  unint64_t v6 = *((void *)v4 + 2);
  unint64_t v5 = *((void *)v4 + 3);
  if (v6 >= v5 >> 1) {
    char v4 = sub_25E64EE6C((char *)(v5 > 1), v6 + 1, 1, v4);
  }
  uint64_t v7 = a2[4];
  *((void *)v4 + 2) = v6 + 1;
  v4[v6 + 32] = v7;
  *a1 = v4;
  uint64_t v8 = *a2;
  uint64_t v9 = a2[1];
  uint64_t v10 = a2[2];
  unint64_t v11 = a2[3];
  sub_25E64ED30((uint64_t)a2);
  sub_25E65E8B4(v8, v9, v10, v11);
  return sub_25E652A9C((uint64_t)a2);
}

void sub_25E668818(uint64_t a1@<X8>)
{
  *(void *)a1 = 3;
  *(unsigned char *)(a1 + 8) = 0;
}

void sub_25E668828(uint64_t a1@<X0>, uint64_t *a2@<X1>, void *a3@<X8>)
{
  char v3 = *((unsigned char *)a2 + 8);
  uint64_t v4 = *a2;
  char v5 = v3;
  ASN1BitString.init(derEncoded:withIdentifier:)(a1, (uint64_t)&v4, a3);
}

uint64_t sub_25E66885C(char **a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  long long v5 = v2[1];
  long long v9 = *v2;
  long long v10 = v5;
  uint64_t v11 = *((void *)v2 + 4);
  uint64_t v7 = v3;
  char v8 = v4;
  return sub_25E6504FC(&v7, 0, a1, sub_25E668BC4);
}

uint64_t ASN1BitString.hash(into:)()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3] >> 1;
  uint64_t result = v2 - v1;
  if (__OFSUB__(v2, v1))
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = v0[1];
    uint64_t result = sub_25E6699D0();
    BOOL v5 = __OFSUB__(v2, v1);
    uint64_t v6 = v2 - v1;
    if (!v6) {
      return sub_25E6699D0();
    }
    if (!((v6 < 0) ^ v5 | (v6 == 0)))
    {
      uint64_t v7 = v4 + v1;
      do
      {
        ++v7;
        sub_25E6699E0();
        --v6;
      }
      while (v6);
      return sub_25E6699D0();
    }
  }
  __break(1u);
  return result;
}

uint64_t static ASN1BitString.== infix(_:_:)(void *a1, void *a2)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a2[4];
  return sub_25E64F2A4(a1[1], a1[2], a1[3], a2[1], a2[2], a2[3]) & (v2 == v3);
}

uint64_t ASN1BitString.hashValue.getter()
{
  uint64_t v1 = v0[1];
  uint64_t v2 = v0[2];
  unint64_t v3 = v0[3];
  sub_25E6699C0();
  unint64_t v4 = v3 >> 1;
  uint64_t result = v4 - v2;
  if (__OFSUB__(v4, v2))
  {
    __break(1u);
  }
  else
  {
    uint64_t result = sub_25E6699D0();
    BOOL v6 = __OFSUB__(v4, v2);
    uint64_t v7 = v4 - v2;
    if (!v7)
    {
LABEL_6:
      sub_25E6699D0();
      return sub_25E669A00();
    }
    if (!((v7 < 0) ^ v6 | (v7 == 0)))
    {
      uint64_t v8 = v1 + v2;
      do
      {
        ++v8;
        sub_25E6699E0();
        --v7;
      }
      while (v7);
      goto LABEL_6;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_25E668A30()
{
  uint64_t v1 = v0[1];
  uint64_t v2 = v0[2];
  unint64_t v3 = v0[3];
  sub_25E6699C0();
  unint64_t v4 = v3 >> 1;
  uint64_t result = v4 - v2;
  if (__OFSUB__(v4, v2))
  {
    __break(1u);
  }
  else
  {
    uint64_t result = sub_25E6699D0();
    BOOL v6 = __OFSUB__(v4, v2);
    uint64_t v7 = v4 - v2;
    if (!v7)
    {
LABEL_6:
      sub_25E6699D0();
      return sub_25E669A00();
    }
    if (!((v7 < 0) ^ v6 | (v7 == 0)))
    {
      uint64_t v8 = v1 + v2;
      do
      {
        ++v8;
        sub_25E6699E0();
        --v7;
      }
      while (v7);
      goto LABEL_6;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_25E668AC8(void *a1, void *a2)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a2[4];
  return sub_25E64F2A4(a1[1], a1[2], a1[3], a2[1], a2[2], a2[3]) & (v2 == v3);
}

uint64_t ASN1BitString.withUnsafeBytes<A>(_:)()
{
  return sub_25E669870();
}

unint64_t sub_25E668B3C()
{
  unint64_t result = qword_26A6FE860;
  if (!qword_26A6FE860)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6FE860);
  }
  return result;
}

uint64_t sub_25E668B90@<X0>(_OWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return swift_unknownObjectRetain();
}

uint64_t sub_25E668BA4@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(result + 32);
  return result;
}

ValueMetadata *type metadata accessor for ASN1BitString()
{
  return &type metadata for ASN1BitString;
}

uint64_t sub_25E668BC4(char **a1)
{
  return sub_25E6528B0(a1);
}

BOOL static ASN1Identifier.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return *(void *)a1 == *(void *)a2 && *(unsigned __int8 *)(a1 + 8) == *(unsigned __int8 *)(a2 + 8);
}

SwiftASN1::ASN1Identifier __swiftcall ASN1Identifier.init(tagWithNumber:tagClass:)(Swift::UInt tagWithNumber, SwiftASN1::ASN1Identifier::TagClass tagClass)
{
  char v3 = *(unsigned char *)tagClass;
  *(void *)uint64_t v2 = tagWithNumber;
  *(unsigned char *)(v2 + 8) = v3;
  result.tagNumber = tagWithNumber;
  result.tagClass = tagClass;
  return result;
}

void static ASN1Identifier.sequence.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 16;
  *(unsigned char *)(a1 + 8) = 0;
}

void static ASN1Identifier.set.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 17;
  *(unsigned char *)(a1 + 8) = 0;
}

uint64_t sub_25E668C38(uint64_t a1, char a2)
{
  unint64_t v3 = *(void *)a1;
  char v4 = *(unsigned char *)(a1 + 8) << 6;
  if (*(void *)a1 > 0x1EuLL)
  {
    if (a2) {
      char v10 = 63;
    }
    else {
      char v10 = 31;
    }
    uint64_t v11 = *v2;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v11 = sub_25E64EE6C(0, *((void *)v11 + 2) + 1, 1, v11);
    }
    char v12 = v4 | v10;
    unint64_t v14 = *((void *)v11 + 2);
    unint64_t v13 = *((void *)v11 + 3);
    if (v14 >= v13 >> 1) {
      uint64_t v11 = sub_25E64EE6C((char *)(v13 > 1), v14 + 1, 1, v11);
    }
    *((void *)v11 + 2) = v14 + 1;
    v11[v14 + 32] = v12;
    *uint64_t v2 = v11;
    return sub_25E65F0B0(v3);
  }
  else
  {
    if (a2) {
      char v5 = v4 | v3 | 0x20;
    }
    else {
      char v5 = v4 | v3;
    }
    uint64_t v6 = (uint64_t)*v2;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_25E64EE6C(0, *(void *)(v6 + 16) + 1, 1, (char *)v6);
      uint64_t v6 = result;
    }
    unint64_t v9 = *(void *)(v6 + 16);
    unint64_t v8 = *(void *)(v6 + 24);
    if (v9 >= v8 >> 1)
    {
      uint64_t result = (uint64_t)sub_25E64EE6C((char *)(v8 > 1), v9 + 1, 1, (char *)v6);
      uint64_t v6 = result;
    }
    *(void *)(v6 + 16) = v9 + 1;
    *(unsigned char *)(v6 + v9 + 32) = v5;
    *uint64_t v2 = (char *)v6;
  }
  return result;
}

uint64_t ASN1Identifier.tagNumber.getter()
{
  return *(void *)v0;
}

uint64_t ASN1Identifier.tagNumber.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*ASN1Identifier.tagNumber.modify())()
{
  return nullsub_1;
}

void ASN1Identifier.tagClass.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 8);
}

unsigned char *ASN1Identifier.tagClass.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 8) = *result;
  return result;
}

uint64_t (*ASN1Identifier.tagClass.modify())()
{
  return nullsub_1;
}

BOOL static ASN1Identifier.TagClass.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t ASN1Identifier.TagClass.hash(into:)()
{
  return sub_25E6699D0();
}

uint64_t ASN1Identifier.TagClass.hashValue.getter()
{
  return sub_25E669A00();
}

void static ASN1Identifier.objectIdentifier.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 6;
  *(unsigned char *)(a1 + 8) = 0;
}

void static ASN1Identifier.bitString.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 3;
  *(unsigned char *)(a1 + 8) = 0;
}

void static ASN1Identifier.octetString.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 4;
  *(unsigned char *)(a1 + 8) = 0;
}

void static ASN1Identifier.integer.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 2;
  *(unsigned char *)(a1 + 8) = 0;
}

void static ASN1Identifier.null.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 5;
  *(unsigned char *)(a1 + 8) = 0;
}

void static ASN1Identifier.BOOLean.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 1;
  *(unsigned char *)(a1 + 8) = 0;
}

void static ASN1Identifier.enumerated.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 10;
  *(unsigned char *)(a1 + 8) = 0;
}

void static ASN1Identifier.utf8String.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 12;
  *(unsigned char *)(a1 + 8) = 0;
}

void static ASN1Identifier.numericString.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 18;
  *(unsigned char *)(a1 + 8) = 0;
}

void static ASN1Identifier.printableString.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 19;
  *(unsigned char *)(a1 + 8) = 0;
}

void static ASN1Identifier.teletexString.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 20;
  *(unsigned char *)(a1 + 8) = 0;
}

void static ASN1Identifier.videotexString.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 21;
  *(unsigned char *)(a1 + 8) = 0;
}

void static ASN1Identifier.ia5String.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 22;
  *(unsigned char *)(a1 + 8) = 0;
}

void static ASN1Identifier.graphicString.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 25;
  *(unsigned char *)(a1 + 8) = 0;
}

void static ASN1Identifier.visibleString.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 26;
  *(unsigned char *)(a1 + 8) = 0;
}

void static ASN1Identifier.generalString.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 27;
  *(unsigned char *)(a1 + 8) = 0;
}

void static ASN1Identifier.universalString.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 28;
  *(unsigned char *)(a1 + 8) = 0;
}

void static ASN1Identifier.bmpString.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 30;
  *(unsigned char *)(a1 + 8) = 0;
}

void static ASN1Identifier.generalizedTime.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 24;
  *(unsigned char *)(a1 + 8) = 0;
}

void static ASN1Identifier.utcTime.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 23;
  *(unsigned char *)(a1 + 8) = 0;
}

uint64_t ASN1Identifier.hash(into:)()
{
  return sub_25E6699D0();
}

uint64_t ASN1Identifier.hashValue.getter()
{
  return sub_25E669A00();
}

uint64_t sub_25E669074()
{
  return sub_25E669A00();
}

uint64_t sub_25E6690D4()
{
  return sub_25E6699D0();
}

uint64_t sub_25E669114()
{
  return sub_25E669A00();
}

BOOL sub_25E669170(uint64_t a1, uint64_t a2)
{
  return *(void *)a1 == *(void *)a2 && *(unsigned __int8 *)(a1 + 8) == *(unsigned __int8 *)(a2 + 8);
}

uint64_t ASN1Identifier.description.getter()
{
  return 0;
}

unint64_t sub_25E6692A0()
{
  unint64_t result = qword_26A6FE868;
  if (!qword_26A6FE868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6FE868);
  }
  return result;
}

unint64_t sub_25E6692F8()
{
  unint64_t result = qword_26A6FE870;
  if (!qword_26A6FE870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6FE870);
  }
  return result;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)unint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for ASN1Identifier(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  BOOL v4 = v3 >= 4;
  int v5 = v3 - 4;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ASN1Identifier(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)unint64_t result = a2 - 253;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = a2 + 3;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ASN1Identifier()
{
  return &type metadata for ASN1Identifier;
}

uint64_t getEnumTagSinglePayload for ASN1Identifier.TagClass(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
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
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ASN1Identifier.TagClass(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *unint64_t result = a2 + 3;
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
        JUMPOUT(0x25E669558);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ASN1Identifier.TagClass()
{
  return &type metadata for ASN1Identifier.TagClass;
}

uint64_t sub_25E669590()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_25E6695A0()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_25E6695B0()
{
  return MEMORY[0x270F9D480]();
}

uint64_t sub_25E6695C0()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_25E6695D0()
{
  return MEMORY[0x270F9D490]();
}

uint64_t sub_25E6695E0()
{
  return MEMORY[0x270F9D498]();
}

uint64_t sub_25E6695F0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_25E669600()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_25E669610()
{
  return MEMORY[0x270F9D6B0]();
}

uint64_t sub_25E669620()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25E669630()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25E669640()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_25E669650()
{
  return MEMORY[0x270F9D908]();
}

uint64_t sub_25E669660()
{
  return MEMORY[0x270F9D948]();
}

uint64_t sub_25E669670()
{
  return MEMORY[0x270F9D968]();
}

uint64_t sub_25E669680()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_25E669690()
{
  return MEMORY[0x270F9DC80]();
}

uint64_t sub_25E6696A0()
{
  return MEMORY[0x270F9E050]();
}

uint64_t sub_25E6696E0()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_25E6696F0()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_25E669700()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_25E669720()
{
  return MEMORY[0x270F9E140]();
}

uint64_t sub_25E669730()
{
  return MEMORY[0x270F9E178]();
}

uint64_t sub_25E669740()
{
  return MEMORY[0x270F9E190]();
}

uint64_t sub_25E669750()
{
  return MEMORY[0x270F9E1B0]();
}

uint64_t sub_25E669760()
{
  return MEMORY[0x270F9E1D0]();
}

uint64_t sub_25E669770()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_25E669780()
{
  return MEMORY[0x270F9E330]();
}

uint64_t sub_25E669790()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_25E6697A0()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_25E6697C0()
{
  return MEMORY[0x270F9E588]();
}

uint64_t sub_25E6697D0()
{
  return MEMORY[0x270F9E5B8]();
}

uint64_t sub_25E6697E0()
{
  return MEMORY[0x270F9E5C0]();
}

uint64_t sub_25E6697F0()
{
  return MEMORY[0x270F9E600]();
}

uint64_t sub_25E669800()
{
  return MEMORY[0x270F9E608]();
}

uint64_t sub_25E669810()
{
  return MEMORY[0x270F9E610]();
}

uint64_t sub_25E669820()
{
  return MEMORY[0x270F9E640]();
}

uint64_t sub_25E669830()
{
  return MEMORY[0x270F9E648]();
}

uint64_t sub_25E669840()
{
  return MEMORY[0x270F9E650]();
}

uint64_t sub_25E669850()
{
  return MEMORY[0x270F9E668]();
}

uint64_t sub_25E669860()
{
  return MEMORY[0x270F9E6C8]();
}

uint64_t sub_25E669870()
{
  return MEMORY[0x270F9E6D0]();
}

uint64_t sub_25E669880()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25E669890()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25E6698A0()
{
  return MEMORY[0x270F9E9E8]();
}

uint64_t sub_25E6698B0()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_25E6698C0()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_25E6698D0()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_25E6698E0()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t sub_25E6698F0()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_25E669900()
{
  return MEMORY[0x270F9ED90]();
}

uint64_t sub_25E669910()
{
  return MEMORY[0x270F9EE10]();
}

uint64_t sub_25E669920()
{
  return MEMORY[0x270F9EE40]();
}

uint64_t sub_25E669930()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_25E669940()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25E669950()
{
  return MEMORY[0x270F9F7B0]();
}

uint64_t sub_25E669960()
{
  return MEMORY[0x270F9FA60]();
}

uint64_t sub_25E669970()
{
  return MEMORY[0x270F9FA80]();
}

uint64_t sub_25E669980()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25E669990()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25E6699A0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25E6699B0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25E6699C0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25E6699D0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25E6699E0()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_25E6699F0()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_25E669A00()
{
  return MEMORY[0x270F9FC90]();
}

void bzero(void *a1, size_t a2)
{
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

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
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