uint64_t sub_25A838804(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = swift_allocObject();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(*(void *)(v1 + 80) - 8) + 32))(v3 + *(void *)(*(void *)v3 + 88), a1);
  return v3;
}

uint64_t CopyOnWriteBox._Box.deinit()
{
  (*(void (**)(uint64_t))(*(void *)(*(void *)(*(void *)v0 + 80) - 8) + 8))(v0 + *(void *)(*(void *)v0 + 88));
  return v0;
}

uint64_t CopyOnWriteBox._Box.__deallocating_deinit()
{
  CopyOnWriteBox._Box.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_25A838954@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + *(void *)(*(void *)a1 + 88);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(a3, v5, a2);
}

uint64_t sub_25A8389E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5 = *(void *)(a3 + a2 - 8);
  uint64_t v6 = *(void *)a1 + *(void *)(**(void **)a1 + 88);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a4, v6, v5);
}

uint64_t sub_25A838A84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a4 + a3 - 8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](a1, a1);
  v8 = (char *)&v12 - v7;
  (*(void (**)(char *))(v6 + 16))((char *)&v12 - v7);
  type metadata accessor for CopyOnWriteBox._Box();
  if (sub_25A855CB0())
  {
    uint64_t v9 = *(void *)a2 + *(void *)(**(void **)a2 + 88);
    swift_beginAccess();
    (*(void (**)(uint64_t, char *, uint64_t))(v6 + 40))(v9, v8, v5);
    return swift_endAccess();
  }
  else
  {
    uint64_t v11 = swift_allocObject();
    (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v11 + *(void *)(*(void *)v11 + 88), v8, v5);
    uint64_t result = swift_release();
    *(void *)a2 = v11;
  }
  return result;
}

uint64_t static CopyOnWriteBox<A>.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25A839748();
  uint64_t v6 = v5;
  uint64_t v9 = MEMORY[0x270FA5388](v7, v8);
  uint64_t v11 = &v22[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = MEMORY[0x270FA5388](v9, v12);
  v15 = &v22[-v14];
  uint64_t v16 = v13 + *(void *)(*(void *)v13 + 88);
  sub_25A839760();
  v17 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v6 + 16);
  v17(v15, v16, a3);
  uint64_t v18 = a2 + *(void *)(*(void *)a2 + 88);
  sub_25A839760();
  v17(v11, v18, a3);
  char v19 = sub_25A855880();
  v20 = *(void (**)(unsigned char *, uint64_t))(v6 + 8);
  v20(v11, a3);
  v20(v15, a3);
  return v19 & 1;
}

uint64_t sub_25A838D94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a3 + 16);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](a1, a2);
  uint64_t v7 = &v20[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = MEMORY[0x270FA5388](v5, v8);
  uint64_t v11 = &v20[-v10];
  uint64_t v13 = *v12;
  uint64_t v14 = *(void *)v9 + *(void *)(**(void **)v9 + 88);
  swift_beginAccess();
  v15 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v4 + 16);
  v15(v11, v14, v3);
  uint64_t v16 = v13 + *(void *)(*(void *)v13 + 88);
  swift_beginAccess();
  v15(v7, v16, v3);
  char v17 = sub_25A855880();
  uint64_t v18 = *(void (**)(unsigned char *, uint64_t))(v4 + 8);
  v18(v7, v3);
  v18(v11, v3);
  return v17 & 1;
}

uint64_t CopyOnWriteBox<A>.hash(into:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25A839748();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6, v7);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = v10 + *(void *)(*(void *)v10 + 88);
  sub_25A839760();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v9, v11, a3);
  sub_25A855860();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v9, a3);
}

uint64_t CopyOnWriteBox<A>.hashValue.getter(uint64_t a1, uint64_t a2)
{
  sub_25A839748();
  uint64_t v4 = v3;
  uint64_t v7 = MEMORY[0x270FA5388](v5, v6);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = v7 + *(void *)(*(void *)v7 + 88);
  sub_25A839760();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v9, v10, a2);
  uint64_t v11 = sub_25A855870();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v9, a2);
  return v11;
}

uint64_t sub_25A839138()
{
  return swift_getWitnessTable();
}

uint64_t sub_25A839180(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](a1, a2);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)v2 + *(void *)(**(void **)v2 + 88);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v7, v3);
  uint64_t v8 = sub_25A855870();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v8;
}

uint64_t sub_25A8392A8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](a1, a2);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)v2 + *(void *)(**(void **)v2 + 88);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v7, v3);
  sub_25A855860();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_25A8393D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](a1, a2);
  uint64_t v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_25A855D80();
  uint64_t v7 = *(void *)v2 + *(void *)(**(void **)v2 + 88);
  swift_beginAccess();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v4 + 16))(v6, v7, v3);
  sub_25A855860();
  (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
  return sub_25A855DC0();
}

uint64_t sub_25A839504()
{
  return 8;
}

void *sub_25A839510(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_25A83951C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

uint64_t type metadata accessor for CopyOnWriteBox()
{
  return sub_25A839718();
}

uint64_t sub_25A839540()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for CopyOnWriteBox._Box()
{
  return sub_25A839718();
}

uint64_t method lookup function for CopyOnWriteBox._Box(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CopyOnWriteBox._Box);
}

uint64_t dispatch thunk of CopyOnWriteBox._Box.__allocating_init(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t initializeBufferWithCopyOfBuffer for AuditToken(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 initializeWithCopy for AuditToken(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for AuditToken(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for AuditToken(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
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
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for audit_token_t(uint64_t a1)
{
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

void sub_25A8396D0(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_25A839718()
{
  return swift_getGenericMetadata();
}

uint64_t sub_25A839760()
{
  return swift_beginAccess();
}

uint64_t sub_25A839778()
{
  return sub_25A855B00();
}

uint64_t sub_25A8397B0(void *a1, void *a2)
{
  if (*a1 == *a2) {
    JUMPOUT(0x261146A90);
  }
  return 0;
}

uint64_t sub_25A8397D4()
{
  return sub_25A855DC0();
}

uint64_t sub_25A839830()
{
  return sub_25A855DC0();
}

uint64_t sub_25A839884()
{
  swift_release();

  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t sub_25A8398BC()
{
  swift_unknownObjectWeakInit();
  sub_25A83CBC4();
  sub_25A839A24((uint64_t *)&unk_26B32BE68);
  uint64_t v1 = swift_allocObject();
  *(_DWORD *)(v1 + 24) = 0;
  sub_25A83CBD4();
  sub_25A83CBE4((uint64_t)v3);
  *(void *)(v0 + 16) = v1;
  return v0;
}

double ReferenceCountedCache.init()@<D0>(uint64_t a1@<X8>)
{
  type metadata accessor for ReferenceCountedCache.WeakHolder();
  sub_25A8399D8();
  uint64_t v2 = sub_25A855840();
  sub_25A839A24(&qword_26B32BE60);
  uint64_t v3 = swift_allocObject();
  *(_DWORD *)(v3 + 24) = 0;
  *(void *)(v3 + 16) = v2;
  *(void *)a1 = v3;
  double result = 0.0;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(void *)(a1 + 40) = 0;
  return result;
}

uint64_t type metadata accessor for ReferenceCountedCache.WeakHolder()
{
  return self;
}

unint64_t sub_25A8399D8()
{
  unint64_t result = qword_26B32BE28;
  if (!qword_26B32BE28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B32BE28);
  }
  return result;
}

uint64_t sub_25A839A24(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t ReferenceCountedCache.init(callbacks:)@<X0>(long long *a1@<X0>, uint64_t *a2@<X8>)
{
  type metadata accessor for ReferenceCountedCache.WeakHolder();
  sub_25A8399D8();
  uint64_t v4 = sub_25A855840();
  sub_25A839A24(&qword_26B32BE60);
  uint64_t v5 = swift_allocObject();
  *(_DWORD *)(v5 + 24) = 0;
  *(void *)(v5 + 16) = v4;
  *a2 = v5;

  return sub_25A839AFC(a1, (uint64_t)(a2 + 1));
}

uint64_t sub_25A839AFC(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

void _s22ProactiveDaemonSupport21ReferenceCountedCacheV11getInstance2of4with7prewarm9keepAlivexxm_24InitializationParametersQzSbs8DurationVt0N5ErrorQzYKAA0deF6MemberRzlF(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v83 = a8;
  uint64_t v81 = a5;
  uint64_t v86 = a4;
  int v76 = a3;
  uint64_t v88 = a1;
  swift_getAssociatedTypeWitness();
  sub_25A83CC2C();
  uint64_t v84 = v12;
  MEMORY[0x270FA5388](v13, v14);
  v82 = (char *)&v73 - v15;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  sub_25A83CC2C();
  uint64_t v79 = v17;
  uint64_t v77 = *(void *)(v18 + 64);
  MEMORY[0x270FA5388](v19, v20);
  v78 = (char *)&v73 - v21;
  uint64_t v22 = sub_25A839A24(&qword_26B32C3F0);
  MEMORY[0x270FA5388](v22 - 8, v23);
  uint64_t v85 = (uint64_t)&v73 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25A83B684((uint64_t)(v8 + 1), (uint64_t)v94, &qword_26B32BE38);
  swift_getAssociatedConformanceWitness();
  uint64_t v80 = AssociatedTypeWitness;
  sub_25A855C50();
  v93[0] = a6;
  v25 = *v8;
  v89 = v93;
  v26 = (uint64_t *)&v25[4];
  v27 = v25 + 6;
  os_unfair_lock_lock(v25 + 6);
  uint64_t v28 = v87;
  sub_25A83A4B0(v26, v90);
  if (v28)
  {
    os_unfair_lock_unlock(v27);
    __break(1u);
  }
  else
  {
    os_unfair_lock_unlock(v27);
    uint64_t v29 = v90[0];
    uint64_t v30 = *(void *)(v90[0] + 16);
    MEMORY[0x270FA5388](v31, v32);
    *(&v73 - 6) = a6;
    *(&v73 - 5) = a7;
    *(&v73 - 4) = (uint64_t)v94;
    *(&v73 - 3) = v88;
    *(&v73 - 2) = a2;
    swift_retain();
    sub_25A84FB4C((void (*)(uint64_t))sub_25A83A990, (uint64_t)(&v73 - 8), v30, (uint64_t)&unk_270860910, a6);
    uint64_t v33 = a2;
    uint64_t v75 = a7;
    uint64_t v87 = v29;
    uint64_t v34 = swift_release();
    uint64_t v36 = v95;
    uint64_t v37 = v86;
    uint64_t v84 = v95;
    uint64_t v74 = a6;
    if (v76)
    {
      sub_25A83CD98(v34, v35, &qword_26B32BE38);
      uint64_t v38 = v91;
      uint64_t v39 = v75;
      if (v91)
      {
        uint64_t v40 = v92;
        sub_25A83BA0C(v90, v91);
        uint64_t v41 = v33;
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v40 + 40))(v88, v33, a6, v39, v38, v40);
        sub_25A83B7E8((uint64_t)v90);
      }
      else
      {
        sub_25A83CB18((uint64_t)v90, &qword_26B32BE38);
        uint64_t v41 = v33;
      }
      uint64_t v42 = sub_25A855990();
      uint64_t v43 = sub_25A83CD74(v42);
      sub_25A83CD98(v43, v44, &qword_26B32BE38);
      uint64_t v45 = v79;
      v46 = v78;
      uint64_t v47 = v80;
      (*(void (**)(char *, uint64_t, uint64_t))(v79 + 16))(v78, v41, v80);
      sub_25A83CCFC();
      unint64_t v49 = v48 & 0xFFFFFFFFFFFFFFF8;
      v50 = (char *)swift_allocObject();
      *((void *)v50 + 2) = 0;
      *((void *)v50 + 3) = 0;
      uint64_t v51 = v74;
      uint64_t v52 = v75;
      *((void *)v50 + 4) = v74;
      *((void *)v50 + 5) = v52;
      sub_25A83B838((uint64_t)v90, (uint64_t)(v50 + 48));
      *((void *)v50 + 11) = v88;
      (*(void (**)(char *, char *, uint64_t))(v45 + 32))(&v50[a6], v46, v47);
      uint64_t v36 = v84;
      *(void *)&v50[v49] = v84;
      swift_unknownObjectRetain();
      sub_25A83ADB8(v85, (uint64_t)&unk_26A468D40, (uint64_t)v50);
      swift_release();
      a6 = v51;
      uint64_t v33 = v41;
      uint64_t v37 = v86;
    }
    sub_25A855E30();
    uint64_t v53 = v81;
    uint64_t v54 = sub_25A855E20();
    if (v54)
    {
      sub_25A83CD98(v54, v55, &qword_26B32BE38);
      uint64_t v56 = v91;
      if (v91)
      {
        uint64_t v57 = v92;
        sub_25A83BA0C(v90, v91);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v57 + 64))(v88, v33, v37, v53, a6, v75, v56, v57);
        sub_25A83B7E8((uint64_t)v90);
      }
      else
      {
        sub_25A83CB18((uint64_t)v90, &qword_26B32BE38);
      }
      uint64_t v91 = a6;
      v90[0] = v36;
      sub_25A839A24(&qword_26A468D20);
      uint64_t v58 = swift_allocObject();
      uint64_t v83 = v58;
      *(_DWORD *)(v58 + 48) = 0;
      sub_25A83B684((uint64_t)v90, v58 + 16, qword_26B32C348);
      swift_unknownObjectRetain();
      sub_25A83CB18((uint64_t)v90, qword_26B32C348);
      uint64_t v59 = sub_25A855990();
      uint64_t v60 = sub_25A83CD74(v59);
      sub_25A83CD98(v60, v61, &qword_26B32BE38);
      uint64_t v62 = v79;
      v63 = v78;
      uint64_t v64 = v80;
      (*(void (**)(char *, uint64_t, uint64_t))(v79 + 16))(v78, v33, v80);
      sub_25A83CCFC();
      unint64_t v66 = v65 & 0xFFFFFFFFFFFFFFF8;
      unint64_t v67 = ((v65 & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
      v68 = (char *)swift_allocObject();
      *((void *)v68 + 2) = 0;
      *((void *)v68 + 3) = 0;
      uint64_t v69 = v75;
      *((void *)v68 + 4) = v74;
      *((void *)v68 + 5) = v69;
      sub_25A83B838((uint64_t)v90, (uint64_t)(v68 + 48));
      *((void *)v68 + 11) = v88;
      (*(void (**)(char *, char *, uint64_t))(v62 + 32))(&v68[a6], v63, v64);
      uint64_t v70 = v84;
      v71 = &v68[v66];
      uint64_t v72 = v81;
      *(void *)v71 = v86;
      *((void *)v71 + 1) = v72;
      *(void *)&v68[v67] = v83;
      *(void *)&v68[(v67 + 15) & 0xFFFFFFFFFFFFFFF8] = v70;
      swift_unknownObjectRetain();
      sub_25A83ADB8(v85, (uint64_t)&unk_26A468D30, (uint64_t)v68);
      swift_release();
    }
    swift_release();
    sub_25A83B658((uint64_t)v93);
    sub_25A83CB18((uint64_t)v94, &qword_26B32BE38);
  }
}

uint64_t _s22ProactiveDaemonSupport21ReferenceCountedCacheV11getInstance2of7prewarm9keepAlivexxm_Sbs8DurationVt19InitializationErrorQzYKAA0deF6MemberRzAA14NullParametersV0nR0RtzlF(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v25[0] = a7;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  sub_25A83CC2C();
  uint64_t v15 = v14;
  MEMORY[0x270FA5388](v16, v17);
  uint64_t v19 = (char *)v25 - v18;
  uint64_t v20 = v25[3];
  _s22ProactiveDaemonSupport21ReferenceCountedCacheV11getInstance2of4with7prewarm9keepAlivexxm_24InitializationParametersQzSbs8DurationVt0N5ErrorQzYKAA0deF6MemberRzlF(a1, v21, a2, a3, a4, a5, a6, (uint64_t)v25 - v18);
  uint64_t v23 = v22;
  if (v20) {
    (*(void (**)(void, char *, uint64_t))(v15 + 32))(v25[0], v19, AssociatedTypeWitness);
  }
  return v23;
}

uint64_t sub_25A83A400@<X0>(uint64_t *a1@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  if (!*(void *)(*a1 + 16) || (uint64_t result = sub_25A843AC0(a2), (v7 & 1) == 0))
  {
    type metadata accessor for ReferenceCountedCache.WeakHolder();
    uint64_t v8 = swift_allocObject();
    sub_25A8398BC();
    uint64_t result = sub_25A847890(v8, a2);
  }
  uint64_t v9 = *a1;
  if (*(void *)(*a1 + 16))
  {
    uint64_t result = sub_25A843AC0(a2);
    if (v10)
    {
      *a3 = *(void *)(*(void *)(v9 + 56) + 8 * result);
      return swift_retain();
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_25A83A4B0@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_25A83A400(a1, *(void **)(v2 + 16), a2);
}

void sub_25A83A4CC(void (*a1)(uint64_t), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

uint64_t sub_25A83A4E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t *a7@<X8>)
{
  uint64_t v50 = a4;
  uint64_t v51 = a3;
  uint64_t v52 = a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v45 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v46 = AssociatedTypeWitness;
  uint64_t v14 = MEMORY[0x270FA5388](AssociatedTypeWitness, v13);
  unint64_t v49 = (char *)v43 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14, v16);
  uint64_t v48 = (char *)v43 - v17;
  uint64_t v18 = swift_getAssociatedTypeWitness();
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18, v20);
  uint64_t v22 = (char *)v43 - v21;
  v43[1] = a1;
  uint64_t v23 = MEMORY[0x261147510](a1);
  uint64_t v47 = a7;
  if (v23)
  {
    v53[0] = v23;
    if (swift_dynamicCast())
    {
      uint64_t v24 = v56;
      sub_25A83B684(v52, (uint64_t)v53, &qword_26B32BE38);
      uint64_t v25 = v54;
      if (v54)
      {
        uint64_t v26 = v55;
        sub_25A83BA0C(v53, v54);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v26 + 8))(v51, v50, a5, a6, v25, v26);
        uint64_t result = sub_25A83B7E8((uint64_t)v53);
      }
      else
      {
        uint64_t result = sub_25A83CB18((uint64_t)v53, &qword_26B32BE38);
      }
      goto LABEL_18;
    }
  }
  uint64_t v28 = v50;
  uint64_t v44 = v7;
  sub_25A83B684(v52, (uint64_t)v53, &qword_26B32BE38);
  uint64_t v29 = v54;
  if (v54)
  {
    uint64_t v30 = v55;
    sub_25A83BA0C(v53, v54);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v30 + 16))(v51, v28, a5, a6, v29, v30);
    sub_25A83B7E8((uint64_t)v53);
  }
  else
  {
    sub_25A83CB18((uint64_t)v53, &qword_26B32BE38);
  }
  sub_25A83B684(v52, (uint64_t)v53, &qword_26B32BE38);
  uint64_t v31 = v54;
  if (v54)
  {
    uint64_t v32 = v55;
    sub_25A83BA0C(v53, v54);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v32 + 24))(v51, v28, a5, a6, v31, v32);
    sub_25A83B7E8((uint64_t)v53);
  }
  else
  {
    sub_25A83CB18((uint64_t)v53, &qword_26B32BE38);
  }
  uint64_t v33 = v49;
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v22, v28, v18);
  uint64_t v34 = v22;
  uint64_t v35 = v44;
  uint64_t v36 = v48;
  uint64_t v37 = (*(uint64_t (**)(char *, char *, uint64_t, uint64_t))(a6 + 56))(v34, v48, a5, a6);
  if (!v35)
  {
    uint64_t v24 = v37;
    swift_unknownObjectRetain();
    sub_25A83A9B4(v52, v51, v28, a5, a6);
    swift_unknownObjectWeakAssign();
    uint64_t result = swift_unknownObjectRelease();
LABEL_18:
    *uint64_t v47 = v24;
    return result;
  }
  uint64_t v38 = v45;
  uint64_t v39 = *(void (**)(char *, char *, uint64_t))(v45 + 32);
  uint64_t v40 = v36;
  uint64_t v41 = v46;
  v39(v33, v40, v46);
  swift_getAssociatedConformanceWitness();
  if (sub_25A855CA0())
  {
    (*(void (**)(char *, uint64_t))(v38 + 8))(v33, v41);
  }
  else
  {
    swift_allocError();
    v39(v42, v33, v41);
  }
  return sub_25A83A9B4(v52, v51, v50, a5, a6);
}

uint64_t sub_25A83A990@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_25A83A4E4(a1, v2[4], v2[5], v2[6], v2[2], v2[3], a2);
}

uint64_t sub_25A83A9B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_25A83B684(a1, (uint64_t)v12, &qword_26B32BE38);
  uint64_t v9 = v13;
  if (!v13) {
    return sub_25A83CB18((uint64_t)v12, &qword_26B32BE38);
  }
  uint64_t v10 = v14;
  sub_25A83BA0C(v12, v13);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 32))(a2, a3, a4, a5, v9, v10);
  return sub_25A83B7E8((uint64_t)v12);
}

uint64_t sub_25A83AA70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[6] = a8;
  v8[7] = v12;
  v8[4] = a6;
  v8[5] = a7;
  v8[2] = a4;
  v8[3] = a5;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8[8] = AssociatedTypeWitness;
  v8[9] = *(void *)(AssociatedTypeWitness - 8);
  v8[10] = swift_task_alloc();
  v8[11] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25A83AB64, 0, 0);
}

uint64_t sub_25A83AB64()
{
  (*(void (**)(uint64_t, uint64_t))(v0[7] + 64))(v0[11], v0[6]);
  sub_25A83ACFC(v0[2], v0[3], v0[4], v0[6], v0[7]);
  swift_task_dealloc();
  swift_task_dealloc();
  sub_25A83CD64();
  return v1();
}

uint64_t sub_25A83ACFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_25A83B684(a1, (uint64_t)v12, &qword_26B32BE38);
  uint64_t v9 = v13;
  if (!v13) {
    return sub_25A83CB18((uint64_t)v12, &qword_26B32BE38);
  }
  uint64_t v10 = v14;
  sub_25A83BA0C(v12, v13);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 48))(a2, a3, a4, a5, v9, v10);
  return sub_25A83B7E8((uint64_t)v12);
}

uint64_t sub_25A83ADB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_25A855990();
  if (sub_25A83CAF0(a1, 1, v5) == 1)
  {
    sub_25A83CB18(a1, &qword_26B32C3F0);
  }
  else
  {
    sub_25A855980();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_25A855930();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_25A83AF00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 144) = v13;
  *(void *)(v8 + 152) = v14;
  *(_OWORD *)(v8 + 128) = v12;
  *(void *)(v8 + 112) = a7;
  *(void *)(v8 + 120) = a8;
  *(void *)(v8 + 96) = a5;
  *(void *)(v8 + 104) = a6;
  *(void *)(v8 + 88) = a4;
  uint64_t v9 = sub_25A855BA0();
  *(void *)(v8 + 160) = v9;
  *(void *)(v8 + 168) = *(void *)(v9 - 8);
  *(void *)(v8 + 176) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25A83AFDC, 0, 0);
}

uint64_t sub_25A83AFDC()
{
  sub_25A83B684(v0[11], (uint64_t)(v0 + 2), &qword_26B32BE38);
  uint64_t v1 = v0[5];
  if (v1)
  {
    uint64_t v3 = v0[18];
    uint64_t v2 = v0[19];
    uint64_t v5 = v0[14];
    uint64_t v4 = v0[15];
    uint64_t v7 = v0[12];
    uint64_t v6 = v0[13];
    uint64_t v8 = v0[6];
    sub_25A83BA0C(v0 + 2, v0[5]);
    uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56))(v7, v6, v5, v4, v3, v2, v1, v8);
    uint64_t v11 = v10;
    sub_25A83B7E8((uint64_t)(v0 + 2));
    if (v11) {
      goto LABEL_6;
    }
  }
  else
  {
    sub_25A83CB18((uint64_t)(v0 + 2), &qword_26B32BE38);
  }
  sub_25A855B10();
  swift_bridgeObjectRelease();
  sub_25A855E60();
  sub_25A8558F0();
  swift_bridgeObjectRelease();
  sub_25A8558F0();
  sub_25A855E10();
  sub_25A8558F0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v9 = 0xD000000000000011;
  uint64_t v11 = 0x800000025A8567B0;
LABEL_6:
  uint64_t v12 = v0[16];
  type metadata accessor for CancellableOSTransaction();
  v0[23] = swift_initStackObject();
  swift_retain();
  v0[24] = CancellableOSTransaction.init(_:onSIGTERM:)(v9, v11, (uint64_t)sub_25A83CB74, v12);
  sub_25A855B90();
  uint64_t v17 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_26A468D50 + dword_26A468D50);
  uint64_t v13 = (void *)swift_task_alloc();
  v0[25] = v13;
  *uint64_t v13 = v0;
  v13[1] = sub_25A83B258;
  uint64_t v15 = v0[14];
  uint64_t v14 = v0[15];
  return v17(v15, v14, 0, 0, 1);
}

uint64_t sub_25A83B258()
{
  sub_25A83CC48();
  uint64_t v3 = v2[22];
  uint64_t v4 = v2[21];
  uint64_t v5 = v2[20];
  uint64_t v6 = *v1;
  sub_25A83CD38();
  *uint64_t v7 = v6;
  *(void *)(v8 + 208) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  if (v0) {
    uint64_t v9 = sub_25A83B40C;
  }
  else {
    uint64_t v9 = sub_25A83B39C;
  }
  return MEMORY[0x270FA2498](v9, 0, 0);
}

uint64_t sub_25A83B39C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  sub_25A83CD48();
  sub_25A83CDB0();
  sub_25A83CC78(v12, v13, v14, v15, v16, v17, v18, v19);
  sub_25A83CCC8();
  swift_release();
  swift_task_dealloc();
  sub_25A83CD64();
  sub_25A83CCAC();
  return v21(v20, v21, v22, v23, v24, v25, v26, v27, a9, a10, a11, a12);
}

uint64_t sub_25A83B40C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  sub_25A83CD48();
  sub_25A83CDB0();
  sub_25A83CC78(v12, v13, v14, v15, v16, v17, v18, v19);
  sub_25A83CCC8();
  swift_release();
  swift_task_dealloc();
  sub_25A83CDBC();
  sub_25A83CCAC();
  return v21(v20, v21, v22, v23, v24, v25, v26, v27, a9, a10, a11, a12);
}

void sub_25A83B480(os_unfair_lock_s *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = a1 + 4;
  uint64_t v4 = a1 + 12;
  os_unfair_lock_lock(a1 + 12);
  sub_25A83B4DC(v3);
  os_unfair_lock_unlock(v4);
  *a2 = 0;
}

double sub_25A83B4DC(_OWORD *a1)
{
  sub_25A83CB18((uint64_t)a1, qword_26B32C348);
  double result = 0.0;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

uint64_t sub_25A83B518(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  sub_25A83B684(a1, (uint64_t)v16, &qword_26B32BE38);
  uint64_t v13 = v17;
  if (!v17) {
    return sub_25A83CB18((uint64_t)v16, &qword_26B32BE38);
  }
  uint64_t v14 = v18;
  sub_25A83BA0C(v16, v17);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 72))(a2, a3, a4, a5, a6, a7, v13, v14);
  return sub_25A83B7E8((uint64_t)v16);
}

uint64_t sub_25A83B5EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = a1;
  return sub_25A83C5A0((uint64_t)&v9, (uint64_t)nullsub_1, 0, a2, MEMORY[0x263F8E628], MEMORY[0x263F8EE60] + 8, MEMORY[0x263F8E658], a8);
}

uint64_t sub_25A83B658(uint64_t a1)
{
  return a1;
}

uint64_t sub_25A83B684(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_25A839A24(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25A83B6E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_25A83B710()
{
  swift_getAssociatedTypeWitness();
  sub_25A83CC2C();
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  swift_unknownObjectRelease();
  if (*(void *)(v0 + 72)) {
    sub_25A83B7E8(v0 + 48);
  }
  sub_25A83CDC8();
  unint64_t v4 = ((((v3 & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = sub_25A83CD1C(v5);
  v7(v6);
  swift_release();
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, v4 + 8, v2);
}

uint64_t sub_25A83B7E8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_25A83B838(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A839A24(&qword_26B32BE38);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25A83B8A0(uint64_t a1)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  sub_25A83CC60(AssociatedTypeWitness);
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 96) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v9 = (*(void *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v16 = v1[3];
  uint64_t v17 = v1[2];
  uint64_t v10 = v1[11];
  uint64_t v11 = (uint64_t)v1 + v8;
  uint64_t v12 = *(void *)((char *)v1 + v9);
  uint64_t v13 = *(void *)((char *)v1 + v9 + 8);
  uint64_t v14 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v14;
  *uint64_t v14 = v2;
  v14[1] = sub_25A83CC0C;
  return sub_25A83AF00(a1, v17, v16, (uint64_t)(v1 + 6), v10, v11, v12, v13);
}

void *sub_25A83BA0C(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_25A83BA50()
{
  swift_getAssociatedTypeWitness();
  sub_25A83CC2C();
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  swift_unknownObjectRelease();
  if (*(void *)(v0 + 72)) {
    sub_25A83B7E8(v0 + 48);
  }
  sub_25A83CDC8();
  unint64_t v4 = (v3 & 0xFFFFFFFFFFFFFFF8) + 8;
  uint64_t v6 = sub_25A83CD1C(v5);
  v7(v6);
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, v4, v2);
}

uint64_t sub_25A83BB08()
{
  sub_25A83CDB0();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  sub_25A83CC60(AssociatedTypeWitness);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_25A83BC3C;
  sub_25A83CCAC();
  return sub_25A83AA70(v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_25A83BC3C()
{
  sub_25A83CC48();
  uint64_t v1 = *v0;
  sub_25A83CD38();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_25A83CDBC();
  return v3();
}

Swift::Void __swiftcall ReferenceCountedCache.reset()()
{
  uint64_t v1 = *v0 + 6;
  os_unfair_lock_lock(v1);
  sub_25A83BD64();

  os_unfair_lock_unlock(v1);
}

uint64_t sub_25A83BD64()
{
  return sub_25A855850();
}

uint64_t static NullParameters.== infix(_:_:)()
{
  return 1;
}

uint64_t NullParameters.hashValue.getter()
{
  return sub_25A855DC0();
}

uint64_t sub_25A83BDF0()
{
  return NullParameters.hashValue.getter();
}

uint64_t sub_25A83BE08()
{
  return sub_25A855DC0();
}

uint64_t sub_25A83BE3C()
{
  return 1;
}

uint64_t sub_25A83BE48()
{
  return 0;
}

void ReferenceCountedCacheCallbacks.customSustainTransactionName<A>(instanceType:parameters:duration:)()
{
}

unint64_t sub_25A83BE64()
{
  unint64_t result = qword_26B32BE20;
  if (!qword_26B32BE20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B32BE20);
  }
  return result;
}

uint64_t destroy for ReferenceCountedCache(uint64_t a1)
{
  uint64_t result = swift_release();
  if (*(void *)(a1 + 32))
  {
    return sub_25A83B7E8(a1 + 8);
  }
  return result;
}

__n128 initializeWithTake for ReferenceCountedCache(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for ReferenceCountedCache(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  if (*(void *)(a1 + 32)) {
    sub_25A83B7E8(a1 + 8);
  }
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = v4;
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for ReferenceCountedCache(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 48))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ReferenceCountedCache(uint64_t result, int a2, int a3)
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

void type metadata accessor for ReferenceCountedCache()
{
}

uint64_t _s22ProactiveDaemonSupport27ReferenceCountedCacheMemberP10parametersx24InitializationParametersQz_t0I5ErrorQzYKcfCTj(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 56))();
}

uint64_t _s22ProactiveDaemonSupport27ReferenceCountedCacheMemberP7prewarmyy12PrewarmErrorQzYKFTj(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

void type metadata accessor for NullParameters()
{
}

uint64_t dispatch thunk of ReferenceCountedCacheCallbacks.cacheHit<A>(instanceType:parameters:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8))();
}

uint64_t dispatch thunk of ReferenceCountedCacheCallbacks.cacheMissed<A>(instanceType:parameters:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 16))();
}

uint64_t dispatch thunk of ReferenceCountedCacheCallbacks.instanceInitializationStarted<A>(instanceType:parameters:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 24))();
}

uint64_t dispatch thunk of ReferenceCountedCacheCallbacks.instanceInitializationEnded<A>(instanceType:parameters:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 32))();
}

uint64_t dispatch thunk of ReferenceCountedCacheCallbacks.instancePrewarmStarted<A>(instanceType:parameters:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 40))();
}

uint64_t dispatch thunk of ReferenceCountedCacheCallbacks.instancePrewarmEnded<A>(instanceType:parameters:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 48))();
}

uint64_t dispatch thunk of ReferenceCountedCacheCallbacks.customSustainTransactionName<A>(instanceType:parameters:duration:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8 + 56))();
}

uint64_t dispatch thunk of ReferenceCountedCacheCallbacks.instanceSustainStarted<A>(instanceType:parameters:duration:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8 + 64))();
}

uint64_t dispatch thunk of ReferenceCountedCacheCallbacks.instanceSustainEnded<A>(instanceType:parameters:duration:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8 + 72))();
}

uint64_t sub_25A83C13C(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_25A83C15C(uint64_t result, int a2, int a3)
{
  if (a2)
  {
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
  *(unsigned char *)(result + 8) = v3;
  return result;
}

void type metadata accessor for ReferenceCountedCache.WeakVar()
{
}

void type metadata accessor for ReferenceCountedCache.State()
{
}

uint64_t sub_25A83C19C(uint64_t a1)
{
  return sub_25A83B7E8(a1 + 8);
}

uint64_t sub_25A83C1A4(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 32) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a1 + 8, a2 + 8);
  return a1;
}

void *sub_25A83C20C(void *a1, void *a2)
{
  *a1 = *a2;
  sub_25A83C23C(a1 + 1, a2 + 1);
  return a1;
}

uint64_t *sub_25A83C23C(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    long long v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        __n128 result = (uint64_t *)swift_release();
        *long long v3 = v12;
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
          *__n128 result = *a2;
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
          *long long v3 = *a2;
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

uint64_t sub_25A83C46C(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  sub_25A83B7E8(a1 + 8);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  return a1;
}

uint64_t sub_25A83C4B8(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 48))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 32);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_25A83C4F8(uint64_t result, int a2, int a3)
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
      *(void *)(result + 32) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for ReferenceCountedCache.CacheKey()
{
}

unint64_t sub_25A83C554()
{
  unint64_t result = qword_26B32BE30;
  if (!qword_26B32BE30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B32BE30);
  }
  return result;
}

uint64_t sub_25A83C5A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = *(void *)(a5 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = v14(v13);
  if (v8) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 32))(a8, v13, a5);
  }
  return result;
}

uint64_t sub_25A83C678(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(void *)(v6 + 56) = v5;
  uint64_t v12 = sub_25A855B80();
  *(void *)(v6 + 64) = v12;
  *(void *)(v6 + 72) = *(void *)(v12 - 8);
  *(void *)(v6 + 80) = swift_task_alloc();
  *(void *)(v6 + 88) = swift_task_alloc();
  *(void *)(v6 + 40) = a1;
  *(void *)(v6 + 48) = a2;
  *(void *)(v6 + 16) = a3;
  *(void *)(v6 + 24) = a4;
  *(unsigned char *)(v6 + 32) = a5 & 1;
  return MEMORY[0x270FA2498](sub_25A83C77C, 0, 0);
}

uint64_t sub_25A83C77C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  sub_25A83CD48();
  sub_25A83CDB0();
  uint64_t v13 = v12[10];
  uint64_t v14 = v12[8];
  uint64_t v15 = v12[9];
  sub_25A855BA0();
  sub_25A83CB7C(&qword_26A468D58, MEMORY[0x263F8F710]);
  sub_25A855D20();
  sub_25A83CB7C(qword_26A468D60, MEMORY[0x263F8F6D8]);
  sub_25A855BB0();
  uint64_t v16 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
  v12[12] = v16;
  v12[13] = (v15 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v16(v13, v14);
  uint64_t v17 = (void *)swift_task_alloc();
  v12[14] = v17;
  *uint64_t v17 = v12;
  v17[1] = sub_25A83C900;
  sub_25A83CCAC();
  return MEMORY[0x270FA2380](v18, v19, v20, v21, v22, v23, v24, v25, a9, a10, a11, a12);
}

uint64_t sub_25A83C900()
{
  sub_25A83CC48();
  uint64_t v3 = v2;
  uint64_t v5 = (void (*)(uint64_t, uint64_t))v4[12];
  uint64_t v6 = v4[11];
  uint64_t v7 = v4[8];
  uint64_t v8 = *v1;
  sub_25A83CD38();
  *int v9 = v8;
  *(void *)(v3 + 120) = v0;
  swift_task_dealloc();
  v5(v6, v7);
  if (!v0)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    sub_25A83CD64();
    __asm { BRAA            X1, X16 }
  }
  return MEMORY[0x270FA2498](sub_25A83CA88, 0, 0);
}

uint64_t sub_25A83CA88()
{
  swift_task_dealloc();
  swift_task_dealloc();
  sub_25A83CDBC();
  return v0();
}

uint64_t sub_25A83CAF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_25A83CB18(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_25A839A24(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_25A83CB74(unsigned char *a1@<X8>)
{
  sub_25A83B480(v1, a1);
}

uint64_t sub_25A83CB7C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25A83CBC4()
{
  return swift_unknownObjectWeakTakeInit();
}

uint64_t sub_25A83CBD4()
{
  return swift_unknownObjectWeakCopyInit();
}

uint64_t sub_25A83CBE4(uint64_t a1)
{
  return a1;
}

uint64_t sub_25A83CC60(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_25A83CC78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = v8[17];
  uint64_t v11 = v8[18];
  uint64_t v12 = v8[19];
  return sub_25A83B5EC(v10, v11, v12, a4, a5, a6, a7, a8);
}

uint64_t sub_25A83CCC8()
{
  return sub_25A83B518(v6, v5, v4, v3, v2, v1, v0);
}

uint64_t sub_25A83CD1C@<X0>(uint64_t a1@<X8>)
{
  return v1 + a1;
}

uint64_t sub_25A83CD64()
{
  return v0 + 8;
}

uint64_t sub_25A83CD74(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 - 272);
  return sub_25A83B6E8(v4, 1, 1, a1);
}

uint64_t sub_25A83CD98(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_25A83B684(v3 - 128, v3 - 216, a3);
}

uint64_t sub_25A83CDBC()
{
  return v0 + 8;
}

uint64_t type metadata accessor for SendableLazy()
{
  return sub_25A839718();
}

uint64_t sub_25A83CDF8()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

void *sub_25A83CE94(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  if (*(void *)(v4 + 64) <= 0x10uLL) {
    uint64_t v5 = 16;
  }
  else {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  int v6 = *(_DWORD *)(v4 + 80);
  if ((v6 & 0x1000F8) != 0 || (unint64_t)(v5 + 1) > 0x18)
  {
    uint64_t v8 = *(void *)a2;
    *uint64_t v3 = *(void *)a2;
    uint64_t v3 = (void *)(v8 + ((unsigned __int16)((v6 & 0xF8) + 23) & (unsigned __int16)~(v6 & 0xF8) & 0x1F8));
LABEL_24:
    swift_retain();
    return v3;
  }
  unsigned int v9 = a2[v5];
  unsigned int v10 = v9 - 2;
  if (v9 >= 2)
  {
    if (v5 <= 3) {
      uint64_t v11 = v5;
    }
    else {
      uint64_t v11 = 4;
    }
    switch(v11)
    {
      case 1:
        int v12 = *a2;
        goto LABEL_19;
      case 2:
        int v12 = *(unsigned __int16 *)a2;
        goto LABEL_19;
      case 3:
        int v12 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_19;
      case 4:
        int v12 = *(_DWORD *)a2;
LABEL_19:
        int v13 = (v12 | (v10 << (8 * v5))) + 2;
        unsigned int v9 = v12 + 2;
        if (v5 < 4) {
          unsigned int v9 = v13;
        }
        break;
      default:
        break;
    }
  }
  if (v9 != 1)
  {
    uint64_t v14 = *((void *)a2 + 1);
    *uint64_t v3 = *(void *)a2;
    v3[1] = v14;
    *((unsigned char *)v3 + v5) = 0;
    goto LABEL_24;
  }
  (*(void (**)(void *))(v4 + 16))(a1);
  *((unsigned char *)v3 + v5) = 1;
  return v3;
}

uint64_t sub_25A83D00C(unsigned __int8 *a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(*(void *)(*(void *)(a2 + 16) - 8) + 64);
  if (v2 <= 0x10) {
    unint64_t v2 = 16;
  }
  unsigned int v3 = a1[v2];
  unsigned int v4 = v3 - 2;
  if (v3 >= 2)
  {
    if (v2 <= 3) {
      uint64_t v5 = v2;
    }
    else {
      uint64_t v5 = 4;
    }
    switch(v5)
    {
      case 1:
        int v6 = *a1;
        goto LABEL_12;
      case 2:
        int v6 = *(unsigned __int16 *)a1;
        goto LABEL_12;
      case 3:
        int v6 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_12;
      case 4:
        int v6 = *(_DWORD *)a1;
LABEL_12:
        int v7 = (v6 | (v4 << (8 * v2))) + 2;
        unsigned int v3 = v6 + 2;
        if (v2 < 4) {
          unsigned int v3 = v7;
        }
        break;
      default:
        break;
    }
  }
  if (v3 == 1) {
    return (*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
  }
  else {
    return swift_release();
  }
}

void *sub_25A83D10C(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 0x10uLL) {
    uint64_t v4 = 16;
  }
  else {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  unsigned int v5 = a2[v4];
  unsigned int v6 = v5 - 2;
  if (v5 >= 2)
  {
    if (v4 <= 3) {
      uint64_t v7 = v4;
    }
    else {
      uint64_t v7 = 4;
    }
    switch(v7)
    {
      case 1:
        int v8 = *a2;
        goto LABEL_13;
      case 2:
        int v8 = *(unsigned __int16 *)a2;
        goto LABEL_13;
      case 3:
        int v8 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_13;
      case 4:
        int v8 = *(_DWORD *)a2;
LABEL_13:
        int v9 = (v8 | (v6 << (8 * v4))) + 2;
        unsigned int v5 = v8 + 2;
        if (v4 < 4) {
          unsigned int v5 = v9;
        }
        break;
      default:
        break;
    }
  }
  if (v5 == 1)
  {
    (*(void (**)(void *))(*(void *)(*(void *)(a3 + 16) - 8) + 16))(a1);
    char v10 = 1;
  }
  else
  {
    uint64_t v11 = *((void *)a2 + 1);
    *a1 = *(void *)a2;
    a1[1] = v11;
    swift_retain();
    char v10 = 0;
  }
  *((unsigned char *)a1 + v4) = v10;
  return a1;
}

unsigned __int8 *sub_25A83D248(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    if (*(void *)(v6 + 64) <= 0x10uLL) {
      uint64_t v7 = 16;
    }
    else {
      uint64_t v7 = *(void *)(v6 + 64);
    }
    unsigned int v8 = a1[v7];
    unsigned int v9 = v8 - 2;
    if (v8 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v10 = v7;
      }
      else {
        uint64_t v10 = 4;
      }
      switch(v10)
      {
        case 1:
          int v11 = *a1;
          goto LABEL_14;
        case 2:
          int v11 = *(unsigned __int16 *)a1;
          goto LABEL_14;
        case 3:
          int v11 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          goto LABEL_14;
        case 4:
          int v11 = *(_DWORD *)a1;
LABEL_14:
          int v12 = (v11 | (v9 << (8 * v7))) + 2;
          unsigned int v8 = v11 + 2;
          if (v7 < 4) {
            unsigned int v8 = v12;
          }
          break;
        default:
          break;
      }
    }
    if (v8 == 1) {
      (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(a1, v5);
    }
    else {
      swift_release();
    }
    unsigned int v13 = a2[v7];
    unsigned int v14 = v13 - 2;
    if (v13 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v15 = v7;
      }
      else {
        uint64_t v15 = 4;
      }
      switch(v15)
      {
        case 1:
          int v16 = *a2;
          goto LABEL_28;
        case 2:
          int v16 = *(unsigned __int16 *)a2;
          goto LABEL_28;
        case 3:
          int v16 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_28;
        case 4:
          int v16 = *(_DWORD *)a2;
LABEL_28:
          int v17 = (v16 | (v14 << (8 * v7))) + 2;
          unsigned int v13 = v16 + 2;
          if (v7 < 4) {
            unsigned int v13 = v17;
          }
          break;
        default:
          break;
      }
    }
    if (v13 == 1)
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 16))(a1, a2, v5);
      a1[v7] = 1;
    }
    else
    {
      uint64_t v18 = *((void *)a2 + 1);
      *(void *)a1 = *(void *)a2;
      *((void *)a1 + 1) = v18;
      a1[v7] = 0;
      swift_retain();
    }
  }
  return a1;
}

_OWORD *sub_25A83D464(_OWORD *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 0x10uLL) {
    uint64_t v4 = 16;
  }
  else {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  unsigned int v5 = a2[v4];
  unsigned int v6 = v5 - 2;
  if (v5 >= 2)
  {
    if (v4 <= 3) {
      uint64_t v7 = v4;
    }
    else {
      uint64_t v7 = 4;
    }
    switch(v7)
    {
      case 1:
        int v8 = *a2;
        goto LABEL_13;
      case 2:
        int v8 = *(unsigned __int16 *)a2;
        goto LABEL_13;
      case 3:
        int v8 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_13;
      case 4:
        int v8 = *(_DWORD *)a2;
LABEL_13:
        int v9 = (v8 | (v6 << (8 * v4))) + 2;
        unsigned int v5 = v8 + 2;
        if (v4 < 4) {
          unsigned int v5 = v9;
        }
        break;
      default:
        break;
    }
  }
  if (v5 == 1)
  {
    (*(void (**)(_OWORD *))(*(void *)(*(void *)(a3 + 16) - 8) + 32))(a1);
    char v10 = 1;
  }
  else
  {
    char v10 = 0;
    *a1 = *(_OWORD *)a2;
  }
  *((unsigned char *)a1 + v4) = v10;
  return a1;
}

unsigned __int8 *sub_25A83D59C(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    if (*(void *)(v6 + 64) <= 0x10uLL) {
      uint64_t v7 = 16;
    }
    else {
      uint64_t v7 = *(void *)(v6 + 64);
    }
    unsigned int v8 = a1[v7];
    unsigned int v9 = v8 - 2;
    if (v8 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v10 = v7;
      }
      else {
        uint64_t v10 = 4;
      }
      switch(v10)
      {
        case 1:
          int v11 = *a1;
          goto LABEL_14;
        case 2:
          int v11 = *(unsigned __int16 *)a1;
          goto LABEL_14;
        case 3:
          int v11 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          goto LABEL_14;
        case 4:
          int v11 = *(_DWORD *)a1;
LABEL_14:
          int v12 = (v11 | (v9 << (8 * v7))) + 2;
          unsigned int v8 = v11 + 2;
          if (v7 < 4) {
            unsigned int v8 = v12;
          }
          break;
        default:
          break;
      }
    }
    if (v8 == 1) {
      (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(a1, v5);
    }
    else {
      swift_release();
    }
    unsigned int v13 = a2[v7];
    unsigned int v14 = v13 - 2;
    if (v13 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v15 = v7;
      }
      else {
        uint64_t v15 = 4;
      }
      switch(v15)
      {
        case 1:
          int v16 = *a2;
          goto LABEL_28;
        case 2:
          int v16 = *(unsigned __int16 *)a2;
          goto LABEL_28;
        case 3:
          int v16 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_28;
        case 4:
          int v16 = *(_DWORD *)a2;
LABEL_28:
          int v17 = (v16 | (v14 << (8 * v7))) + 2;
          unsigned int v13 = v16 + 2;
          if (v7 < 4) {
            unsigned int v13 = v17;
          }
          break;
        default:
          break;
      }
    }
    if (v13 == 1)
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 32))(a1, a2, v5);
      char v18 = 1;
    }
    else
    {
      char v18 = 0;
      *(_OWORD *)a1 = *(_OWORD *)a2;
    }
    a1[v7] = v18;
  }
  return a1;
}

uint64_t sub_25A83D7B4(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v4 = 16;
  if (*(void *)(v3 + 64) > 0x10uLL) {
    uint64_t v4 = *(void *)(v3 + 64);
  }
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_22;
  }
  uint64_t v5 = v4 + 1;
  char v6 = 8 * (v4 + 1);
  if ((v4 + 1) <= 3)
  {
    unsigned int v9 = ((a2 + ~(-1 << v6) - 254) >> v6) + 1;
    if (HIWORD(v9))
    {
      int v7 = *(_DWORD *)((char *)a1 + v5);
      if (!v7) {
        goto LABEL_22;
      }
      goto LABEL_14;
    }
    if (v9 > 0xFF)
    {
      int v7 = *(unsigned __int16 *)((char *)a1 + v5);
      if (!*(unsigned __int16 *)((char *)a1 + v5)) {
        goto LABEL_22;
      }
      goto LABEL_14;
    }
    if (v9 < 2)
    {
LABEL_22:
      unsigned int v11 = *((unsigned __int8 *)a1 + v4);
      if (v11 >= 2) {
        return (v11 ^ 0xFF) + 1;
      }
      else {
        return 0;
      }
    }
  }
  int v7 = *((unsigned __int8 *)a1 + v5);
  if (!*((unsigned char *)a1 + v5)) {
    goto LABEL_22;
  }
LABEL_14:
  int v10 = (v7 - 1) << v6;
  if (v5 > 3) {
    int v10 = 0;
  }
  if (v5)
  {
    if (v5 > 3) {
      LODWORD(v5) = 4;
    }
    switch((int)v5)
    {
      case 2:
        LODWORD(v5) = *a1;
        break;
      case 3:
        LODWORD(v5) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v5) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v5) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return (v5 | v10) + 255;
}

void sub_25A83D8E8(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  if (v5 <= 0x10) {
    unint64_t v5 = 16;
  }
  size_t v6 = v5 + 1;
  char v7 = 8 * (v5 + 1);
  if (a3 < 0xFF)
  {
    int v8 = 0;
  }
  else if (v6 <= 3)
  {
    unsigned int v11 = ((a3 + ~(-1 << v7) - 254) >> v7) + 1;
    if (HIWORD(v11))
    {
      int v8 = 4;
    }
    else if (v11 >= 0x100)
    {
      int v8 = 2;
    }
    else
    {
      int v8 = v11 > 1;
    }
  }
  else
  {
    int v8 = 1;
  }
  if (a2 > 0xFE)
  {
    unsigned int v9 = a2 - 255;
    if (v6 < 4)
    {
      int v10 = (v9 >> v7) + 1;
      if (v5 != -1)
      {
        int v12 = v9 & ~(-1 << v7);
        bzero(a1, v6);
        if (v6 == 3)
        {
          *(_WORD *)a1 = v12;
          a1[2] = BYTE2(v12);
        }
        else if (v6 == 2)
        {
          *(_WORD *)a1 = v12;
        }
        else
        {
          *a1 = v12;
        }
      }
    }
    else
    {
      bzero(a1, v5 + 1);
      *(_DWORD *)a1 = v9;
      int v10 = 1;
    }
    switch(v8)
    {
      case 1:
        a1[v6] = v10;
        break;
      case 2:
        *(_WORD *)&a1[v6] = v10;
        break;
      case 3:
LABEL_34:
        __break(1u);
        JUMPOUT(0x25A83DAACLL);
      case 4:
        *(_DWORD *)&a1[v6] = v10;
        break;
      default:
        return;
    }
  }
  else
  {
    switch(v8)
    {
      case 1:
        a1[v6] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_23;
      case 2:
        *(_WORD *)&a1[v6] = 0;
        goto LABEL_22;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v6] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_23;
      default:
LABEL_22:
        if (a2) {
LABEL_23:
        }
          a1[v5] = -(char)a2;
        break;
    }
  }
}

uint64_t sub_25A83DAD4(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v3 = 16;
  if (*(void *)(v2 + 64) > 0x10uLL) {
    uint64_t v3 = *(void *)(v2 + 64);
  }
  uint64_t v4 = a1[v3];
  int v5 = v4 - 2;
  if (v4 >= 2)
  {
    if (v3 <= 3) {
      uint64_t v6 = v3;
    }
    else {
      uint64_t v6 = 4;
    }
    switch(v6)
    {
      case 1:
        int v7 = *a1;
        goto LABEL_12;
      case 2:
        int v7 = *(unsigned __int16 *)a1;
        goto LABEL_12;
      case 3:
        int v7 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_12;
      case 4:
        int v7 = *(_DWORD *)a1;
LABEL_12:
        unsigned int v8 = (v7 | (v5 << (8 * v3))) + 2;
        LODWORD(v4) = v7 + 2;
        if (v3 >= 4) {
          uint64_t v4 = v4;
        }
        else {
          uint64_t v4 = v8;
        }
        break;
      default:
        return v4;
    }
  }
  return v4;
}

void sub_25A83DB8C(unsigned char *a1, unsigned int a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 0x10uLL) {
    size_t v4 = 16;
  }
  else {
    size_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  if (a2 > 1)
  {
    unsigned int v5 = a2 - 2;
    if (v4 < 4)
    {
      unsigned int v6 = v5 >> (8 * v4);
      int v7 = v5 & ~(-1 << (8 * v4));
      a1[v4] = v6 + 2;
      bzero(a1, v4);
      if (v4 == 3)
      {
        *(_WORD *)a1 = v7;
        a1[2] = BYTE2(v7);
      }
      else if (v4 == 2)
      {
        *(_WORD *)a1 = v7;
      }
      else
      {
        *a1 = v7;
      }
    }
    else
    {
      a1[v4] = 2;
      bzero(a1, v4);
      *(_DWORD *)a1 = v5;
    }
  }
  else
  {
    a1[v4] = a2;
  }
}

uint64_t type metadata accessor for SendableLazy.State()
{
  return sub_25A839718();
}

uint64_t sub_25A83DC7C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for WeakReference();
  uint64_t v5 = *(void *)(v4 - 8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 16))(v8, a1, v4);
  uint64_t v6 = MEMORY[0x261147510](v8);
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v8, v4);
  *a2 = v6;
  return result;
}

uint64_t sub_25A83DD3C()
{
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_25A83DD4C()
{
  return 8;
}

void *sub_25A83DD58(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

uint64_t type metadata accessor for WeakReference()
{
  return sub_25A839718();
}

uint64_t sub_25A83DD7C()
{
  return 0;
}

uint64_t static Daemon.enableSIGTERMHandling.getter()
{
  return 0;
}

void static Daemon.main()(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)MEMORY[0x261146E60]();
  sub_25A83DE28(v2, a1, a2);
  id v6 = objc_msgSend(self, sel_mainRunLoop);
  objc_msgSend(v6, sel_run);
}

uint64_t sub_25A83DE28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_25A855700();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7);
  unsigned int v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25A841FE0(a2, a3);
  if ((*(uint64_t (**)(uint64_t, uint64_t))(a3 + 32))(a2, a3))
  {
    (*(void (**)(uint64_t, uint64_t))(a3 + 8))(a2, a3);
    sub_25A83E0B4();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  }
  (*(void (**)(uint64_t, uint64_t))(a3 + 48))(a2, a3);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 40))(a2, a3);
  if (result)
  {
    (*(void (**)(uint64_t, uint64_t))(a3 + 8))(a2, a3);
    sub_25A83E1EC((uint64_t)v9);
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  }
  return result;
}

uint64_t dispatch thunk of static Daemon.logger.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of static Daemon.iOSSandboxProfileName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of static Daemon.macOSSandboxProfileName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of static Daemon.enableSIGTERMHandling.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of static Daemon.enableDistributedNotificationReposting.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of static Daemon.start()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t CancellableOSTransaction.__allocating_init(_:onSIGTERM:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_25A841030();
  uint64_t v8 = swift_allocObject();
  CancellableOSTransaction.init(_:onSIGTERM:)(a1, a2, a3, a4);
  return v8;
}

void sub_25A83E0B4()
{
  uint64_t v0 = sub_25A8556F0();
  os_log_type_t v1 = sub_25A8559E0();
  if (os_log_type_enabled(v0, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_25A837000, v0, v1, "DaemonEventHandlers: Disabling standard SIGTERM handler", v2, 2u);
    MEMORY[0x261147430](v2, -1, -1);
  }

  uint64_t v3 = (void (__cdecl *)(int))sub_25A8557D0();
  uint64_t v4 = (uint64_t)signal(15, v3);
  if (qword_26B32C1A0 != -1) {
    uint64_t v4 = swift_once();
  }
  MEMORY[0x270FA5388](v4, v5);
  uint64_t v7 = (uint64_t)&v6[4];
  uint64_t v8 = v6 + 7;
  os_unfair_lock_lock(v6 + 7);
  sub_25A840BBC(v7);
  os_unfair_lock_unlock(v8);
}

void sub_25A83E1EC(uint64_t a1)
{
  uint64_t v2 = sub_25A855700();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2, v5);
  uint64_t v6 = sub_25A8556F0();
  os_log_type_t v7 = sub_25A8559E0();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_25A837000, v6, v7, "DaemonEventHandlers: registerLaunchEvents called: registering for com.apple.distnoted.matching", v8, 2u);
    MEMORY[0x261147430](v8, -1, -1);
  }

  sub_25A840BEC(0, &qword_26B32BCB0);
  unsigned int v9 = sub_25A855A00();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  unint64_t v10 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v11 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v11 + v10, (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  aBlock[4] = sub_25A840CAC;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_25A83EE88;
  aBlock[3] = &unk_270860678;
  int v12 = _Block_copy(aBlock);
  swift_release();
  xpc_set_event_stream_handler("com.apple.distnoted.matching", v9, v12);
  _Block_release(v12);
}

uint64_t sub_25A83E424()
{
  sub_25A839A24(&qword_26B32C1A8);
  uint64_t result = swift_allocObject();
  *(_DWORD *)(result + 28) = 0;
  *(void *)(result + 16) = 0;
  *(unsigned char *)(result + 24) = -1;
  qword_26B32CA40 = result;
  return result;
}

void sub_25A83E468()
{
  uint64_t v0 = MEMORY[0x261147640]();
  if (v0 == sub_25A8557C0())
  {
    swift_getObjectType();
    sub_25A846860((uint64_t)v25);
    if (v26)
    {
      sub_25A839A24(&qword_26B32BCA0);
      if (swift_dynamicCast())
      {
        sub_25A8557B0();
        uint64_t v3 = sub_25A855890();
        if (v4)
        {
          sub_25A842FA4(v3, v4, v23, v25);
          swift_bridgeObjectRelease();
          if (!v26)
          {
            swift_bridgeObjectRelease();
            sub_25A840D1C((uint64_t)v25, qword_26B32C348);
LABEL_21:
            unint64_t v10 = sub_25A8556F0();
            os_log_type_t v11 = sub_25A8559C0();
            if (os_log_type_enabled(v10, v11))
            {
              int v12 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)int v12 = 0;
              unsigned int v13 = "DaemonEventHandlers: Received distributed event with invalid name";
              goto LABEL_23;
            }
            goto LABEL_24;
          }
          if (swift_dynamicCast())
          {
            sub_25A842FA4(0x6F666E4972657355, 0xE800000000000000, v23, v25);
            swift_bridgeObjectRelease();
            if (v26)
            {
              if (swift_dynamicCast())
              {
                swift_bridgeObjectRetain_n();
                swift_bridgeObjectRetain_n();
                uint64_t v5 = sub_25A8556F0();
                os_log_type_t v6 = sub_25A8559E0();
                if (os_log_type_enabled(v5, v6))
                {
                  uint64_t v7 = swift_slowAlloc();
                  os_log_t osloga = (os_log_t)swift_slowAlloc();
                  v25[0] = (uint64_t)osloga;
                  *(_DWORD *)uint64_t v7 = 136315394;
                  swift_bridgeObjectRetain();
                  sub_25A8415AC(v23, v24, v25);
                  sub_25A855AA0();
                  swift_bridgeObjectRelease_n();
                  *(_WORD *)(v7 + 12) = 2080;
                  uint64_t v8 = sub_25A855830();
                  sub_25A8415AC(v8, v9, v25);
                  sub_25A855AA0();
                  swift_bridgeObjectRelease_n();
                  swift_bridgeObjectRelease();
                  _os_log_impl(&dword_25A837000, v5, v6, "Posting notification %s userInfo: %s", (uint8_t *)v7, 0x16u);
                  swift_arrayDestroy();
                  MEMORY[0x261147430](osloga, -1, -1);
                  MEMORY[0x261147430](v7, -1, -1);
                }
                else
                {
                  swift_bridgeObjectRelease_n();
                  swift_bridgeObjectRelease_n();
                }

                id v18 = objc_msgSend(self, sel_defaultCenter);
                uint64_t v19 = (void *)sub_25A8558A0();
                swift_bridgeObjectRelease();
                uint64_t v20 = sub_25A83EAC4(v23);
                swift_bridgeObjectRelease();
                sub_25A840D6C((uint64_t)v19, 0, v20, v18);
LABEL_33:

                return;
              }
            }
            else
            {
              sub_25A840D1C((uint64_t)v25, qword_26B32C348);
            }
            swift_bridgeObjectRetain_n();
            unsigned int v14 = sub_25A8556F0();
            os_log_type_t v15 = sub_25A8559E0();
            if (os_log_type_enabled(v14, v15))
            {
              int v16 = (uint8_t *)swift_slowAlloc();
              uint64_t v17 = swift_slowAlloc();
              v25[0] = v17;
              *(_DWORD *)int v16 = 136315138;
              swift_bridgeObjectRetain();
              sub_25A8415AC(v23, v24, v25);
              sub_25A855AA0();
              swift_bridgeObjectRelease_n();
              _os_log_impl(&dword_25A837000, v14, v15, "Posting notification %s", v16, 0xCu);
              swift_arrayDestroy();
              MEMORY[0x261147430](v17, -1, -1);
              MEMORY[0x261147430](v16, -1, -1);
            }
            else
            {
              swift_bridgeObjectRelease_n();
            }

            id v18 = objc_msgSend(self, sel_defaultCenter);
            uint64_t v19 = (void *)sub_25A8558A0();
            swift_bridgeObjectRelease();
            objc_msgSend(v18, sel_postNotificationName_object_, v19, 0);
            goto LABEL_33;
          }
        }
        swift_bridgeObjectRelease();
        goto LABEL_21;
      }
    }
    else
    {
      sub_25A840D1C((uint64_t)v25, qword_26B32C348);
    }
    unint64_t v10 = sub_25A8556F0();
    os_log_type_t v11 = sub_25A8559C0();
    if (os_log_type_enabled(v10, v11))
    {
      int v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int v12 = 0;
      unsigned int v13 = "DaemonEventHandlers: Found invalid dictionary in distributed event";
LABEL_23:
      _os_log_impl(&dword_25A837000, v10, v11, v13, v12, 2u);
      MEMORY[0x261147430](v12, -1, -1);
    }
LABEL_24:

    return;
  }
  oslog = sub_25A8556F0();
  os_log_type_t v1 = sub_25A8559C0();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_25A837000, oslog, v1, "DaemonEventHandlers: Received distributed event with invalid type", v2, 2u);
    MEMORY[0x261147430](v2, -1, -1);
  }
}

uint64_t sub_25A83EAC4(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_25A839A24(&qword_26B32C0B8);
    uint64_t v2 = sub_25A855C30();
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE80];
  }
  uint64_t v28 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = v2 + 64;
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  if (!v5) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v9 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  unint64_t v10 = v9 | (v8 << 6);
  while (1)
  {
    os_log_type_t v15 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v10);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    sub_25A840E08(*(void *)(a1 + 56) + 32 * v10, (uint64_t)v40);
    *(void *)&long long v39 = v17;
    *((void *)&v39 + 1) = v16;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v17;
    *((void *)&v37[0] + 1) = v16;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_25A840E64(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_25A840E64(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_25A840E64(v36, v37);
    sub_25A840E64(v37, &v33);
    uint64_t result = sub_25A855AE0();
    uint64_t v18 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v19 = result & ~v18;
    unint64_t v20 = v19 >> 6;
    if (((-1 << v19) & ~*(void *)(v6 + 8 * (v19 >> 6))) == 0)
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v18) >> 6;
      while (++v20 != v23 || (v22 & 1) == 0)
      {
        BOOL v24 = v20 == v23;
        if (v20 == v23) {
          unint64_t v20 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v6 + 8 * v20);
        if (v25 != -1)
        {
          unint64_t v21 = __clz(__rbit64(~v25)) + (v20 << 6);
          goto LABEL_34;
        }
      }
      __break(1u);
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    unint64_t v21 = __clz(__rbit64((-1 << v19) & ~*(void *)(v6 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
LABEL_34:
    *(void *)(v6 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    uint64_t v26 = *(void *)(v2 + 48) + 40 * v21;
    *(_OWORD *)uint64_t v26 = v29;
    *(_OWORD *)(v26 + 16) = v30;
    *(void *)(v26 + 32) = v31;
    uint64_t result = (uint64_t)sub_25A840E64(&v33, (_OWORD *)(*(void *)(v2 + 56) + 32 * v21));
    ++*(void *)(v2 + 16);
    if (v5) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v11 = v8 + 1;
    if (__OFADD__(v8, 1)) {
      goto LABEL_38;
    }
    if (v11 >= v27) {
      goto LABEL_36;
    }
    unint64_t v12 = *(void *)(v28 + 8 * v11);
    int64_t v13 = v8 + 1;
    if (!v12)
    {
      int64_t v13 = v8 + 2;
      if (v8 + 2 >= v27) {
        goto LABEL_36;
      }
      unint64_t v12 = *(void *)(v28 + 8 * v13);
      if (!v12)
      {
        int64_t v13 = v8 + 3;
        if (v8 + 3 >= v27) {
          goto LABEL_36;
        }
        unint64_t v12 = *(void *)(v28 + 8 * v13);
        if (!v12)
        {
          int64_t v13 = v8 + 4;
          if (v8 + 4 >= v27) {
            goto LABEL_36;
          }
          unint64_t v12 = *(void *)(v28 + 8 * v13);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_24:
    unint64_t v5 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
    int64_t v8 = v13;
  }
  int64_t v14 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_36:
    swift_release();
    sub_25A840E74();
    return v2;
  }
  unint64_t v12 = *(void *)(v28 + 8 * v14);
  if (v12)
  {
    int64_t v13 = v8 + 5;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v13 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v13 >= v27) {
      goto LABEL_36;
    }
    unint64_t v12 = *(void *)(v28 + 8 * v13);
    ++v14;
    if (v12) {
      goto LABEL_24;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_25A83EE88(uint64_t a1)
{
  os_log_type_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();

  return swift_unknownObjectRelease();
}

uint64_t sub_25A83EEE8(uint64_t a1)
{
  uint64_t v27 = sub_25A8557E0();
  uint64_t v25 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27, v3);
  unint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25A855800();
  uint64_t v23 = *(void *)(v6 - 8);
  uint64_t v24 = v6;
  uint64_t result = MEMORY[0x270FA5388](v6, v7);
  unint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v11 = *(unsigned __int8 *)(a1 + 8);
  if (v11 != 255)
  {
    if (v11) {
      return result;
    }
    uint64_t v12 = *(void *)a1;
    int64_t v13 = sub_25A8556F0();
    os_log_type_t v14 = sub_25A8559E0();
    if (os_log_type_enabled(v13, v14))
    {
      os_log_type_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v22 = v1;
      uint64_t v16 = v15;
      *(_WORD *)os_log_type_t v15 = 0;
      _os_log_impl(&dword_25A837000, v13, v14, "DaemonEventHandlers: Upgrading existing SIGTERM DispatchSource", v15, 2u);
      MEMORY[0x261147430](v16, -1, -1);
    }

    swift_getObjectType();
    sub_25A855A30();
    sub_25A840BD8(v12, v11);
    *(void *)a1 = 0;
    *(unsigned char *)(a1 + 8) = -1;
  }
  uint64_t v17 = sub_25A8556F0();
  os_log_type_t v18 = sub_25A8559E0();
  if (os_log_type_enabled(v17, v18))
  {
    unint64_t v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v19 = 0;
    _os_log_impl(&dword_25A837000, v17, v18, "DaemonEventHandlers: Registering full SIGTERM DispatchSource", v19, 2u);
    MEMORY[0x261147430](v19, -1, -1);
  }

  sub_25A840BEC(0, qword_26B32C0D8);
  uint64_t v20 = sub_25A855A10();
  swift_getObjectType();
  aBlock[4] = sub_25A83F25C;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_25A8533A4;
  aBlock[3] = &unk_270860628;
  unint64_t v21 = _Block_copy(aBlock);
  sub_25A8557F0();
  sub_25A83F300();
  sub_25A855A20();
  _Block_release(v21);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v5, v27);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v10, v24);
  uint64_t result = sub_25A855A40();
  *(void *)a1 = v20;
  *(unsigned char *)(a1 + 8) = 1;
  return result;
}

uint64_t sub_25A83F25C()
{
  id v0 = objc_msgSend(self, sel_defaultCenter);
  if (qword_26B32BCE8 != -1) {
    swift_once();
  }
  objc_msgSend(v0, sel_postNotificationName_object_userInfo_, qword_26B32BE50, 0, 0);

  return MEMORY[0x270EDC418]();
}

uint64_t sub_25A83F300()
{
  return sub_25A855AD0();
}

uint64_t sub_25A83F3B0(uint64_t a1)
{
  uint64_t v3 = sub_25A8557E0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3, v5);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25A855800();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t result = MEMORY[0x270FA5388](v8, v10);
  int64_t v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(unsigned __int8 *)(a1 + 8) == 255)
  {
    sub_25A840BEC(0, qword_26B32C0D8);
    aBlock[7] = v1;
    uint64_t v14 = sub_25A855A10();
    swift_getObjectType();
    uint64_t v17 = v3;
    aBlock[4] = sub_25A83F610;
    aBlock[5] = 0;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_25A8533A4;
    aBlock[3] = &unk_2708604E8;
    os_log_type_t v15 = _Block_copy(aBlock);
    sub_25A8557F0();
    sub_25A83F300();
    sub_25A855A20();
    _Block_release(v15);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v17);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v13, v8);
    uint64_t result = sub_25A855A40();
    *(void *)a1 = v14;
    *(unsigned char *)(a1 + 8) = 0;
  }
  return result;
}

void sub_25A83F610()
{
  id v0 = objc_msgSend(self, sel_defaultCenter);
  id v1 = v0;
  if (qword_26B32BCE8 != -1)
  {
    swift_once();
    id v0 = v1;
  }
  objc_msgSend(v0, sel_postNotificationName_object_userInfo_, qword_26B32BE50, 0, 0);
}

BOOL static CancellableOSTransaction.ReleaseBehavior.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t CancellableOSTransaction.ReleaseBehavior.hash(into:)()
{
  return sub_25A855DA0();
}

uint64_t CancellableOSTransaction.ReleaseBehavior.hashValue.getter()
{
  return sub_25A855DC0();
}

uint64_t sub_25A83F74C()
{
  return sub_25A855DC0();
}

uint64_t sub_25A83F790()
{
  *(void *)(v0 + 112) = 0;
  return swift_unknownObjectRelease();
}

uint64_t sub_25A83F79C()
{
  swift_unknownObjectRelease();
  swift_defaultActor_destroy();

  return MEMORY[0x270FA2418](v0);
}

void sub_25A83F7D4()
{
}

void sub_25A83F7DC()
{
}

uint64_t CancellableOSTransaction.init(_:onSIGTERM:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v8 = sub_25A839A24(&qword_26B32C3F0);
  MEMORY[0x270FA5388](v8 - 8, v9);
  int v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B32C1A0 != -1) {
    swift_once();
  }
  uint64_t v12 = qword_26B32CA40 + 16;
  int64_t v13 = (os_unfair_lock_s *)(qword_26B32CA40 + 28);
  os_unfair_lock_lock((os_unfair_lock_t)(qword_26B32CA40 + 28));
  sub_25A83F3B0(v12);
  os_unfair_lock_unlock(v13);
  sub_25A8558C0();
  swift_bridgeObjectRelease();
  uint64_t v14 = os_transaction_create();
  uint64_t result = swift_release();
  if (v14)
  {
    type metadata accessor for CancellableOSTransaction.Holder();
    uint64_t v16 = swift_allocObject();
    swift_defaultActor_initialize();
    *(void *)(v16 + 112) = v14;
    *(void *)(v5 + 16) = v16;
    uint64_t v17 = sub_25A855990();
    sub_25A83B6E8((uint64_t)v11, 1, 1, v17);
    os_log_type_t v18 = (void *)swift_allocObject();
    v18[2] = 0;
    v18[3] = 0;
    v18[4] = a3;
    v18[5] = a4;
    v18[6] = v16;
    swift_retain();
    *(void *)(v5 + 24) = sub_25A840374((uint64_t)v11, (uint64_t)&unk_26A468E78, (uint64_t)v18);
    return v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for CancellableOSTransaction.Holder()
{
  return self;
}

uint64_t sub_25A83F9E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[4] = a5;
  v6[5] = a6;
  v6[3] = a4;
  sub_25A839A24(&qword_26B32BD88);
  v6[6] = swift_task_alloc();
  uint64_t v7 = sub_25A855A60();
  v6[7] = v7;
  v6[8] = *(void *)(v7 - 8);
  v6[9] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25A83FAD4, 0, 0);
}

uint64_t sub_25A83FAD4()
{
  id v1 = objc_msgSend(self, sel_defaultCenter);
  if (qword_26B32BCE8 != -1) {
    swift_once();
  }
  sub_25A855A70();

  sub_25A855A50();
  uint64_t v5 = (char *)&dword_26A468EA0 + dword_26A468EA0;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_25A83FC18;
  uint64_t v3 = *(void *)(v0 + 48);
  return ((uint64_t (*)(uint64_t, void, void, uint64_t))v5)(v3, 0, 0, v0 + 16);
}

uint64_t sub_25A83FC18()
{
  sub_25A841014();
  sub_25A83CC48();
  uint64_t v1 = *v0;
  sub_25A83CD38();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_25A83FCE4, 0, 0);
}

uint64_t sub_25A83FCE4()
{
  sub_25A841014();
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v2 = sub_25A855620();
  if (sub_25A83CAF0(v1, 1, v2) == 1)
  {
    sub_25A841020();
    v3();
    goto LABEL_5;
  }
  (*(void (**)(void))(v0 + 24))();
  if (*(unsigned char *)(v0 + 88))
  {
    uint64_t v4 = *(void *)(v0 + 48);
    sub_25A841020();
    v5();
    sub_25A840D1C(v4, &qword_26B32BD88);
LABEL_5:
    swift_task_dealloc();
    swift_task_dealloc();
    sub_25A83CDBC();
    __asm { BRAA            X1, X16 }
  }
  uint64_t v7 = *(void *)(v0 + 40);
  return MEMORY[0x270FA2498](sub_25A83FDF0, v7, 0);
}

uint64_t sub_25A83FDF0()
{
  sub_25A841014();
  sub_25A83F790();
  return MEMORY[0x270FA2498](sub_25A83FE54, 0, 0);
}

uint64_t sub_25A83FE54()
{
  sub_25A841014();
  uint64_t v1 = *(void *)(v0 + 48);
  sub_25A841020();
  v2();
  sub_25A840D1C(v1, &qword_26B32BD88);
  swift_task_dealloc();
  swift_task_dealloc();
  sub_25A83CDBC();
  return v3();
}

uint64_t sub_25A83FED8()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_25A83FF20(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_25A83FFE8;
  return sub_25A83F9E0(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_25A83FFE8()
{
  sub_25A841014();
  sub_25A83CC48();
  uint64_t v1 = *v0;
  sub_25A83CD38();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_25A83CDBC();
  return v3();
}

uint64_t sub_25A8400A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  uint64_t v5 = sub_25A855A60();
  uint64_t v6 = sub_25A840AD8(&qword_26B32BE58, MEMORY[0x263F07C88]);
  uint64_t v7 = (void *)swift_task_alloc();
  v3[5] = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_25A84019C;
  return MEMORY[0x270FA1E80](a1, v5, v6);
}

uint64_t sub_25A84019C()
{
  sub_25A83CC48();
  uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_25A83CD38();
  *uint64_t v5 = v4;
  *(void *)(v3 + 48) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    sub_25A83CDBC();
    __asm { BRAA            X1, X16 }
  }
  if (*(void *)(v3 + 24))
  {
    swift_getObjectType();
    uint64_t v6 = sub_25A855930();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  return MEMORY[0x270FA2498](sub_25A8402DC, v6, v8);
}

uint64_t sub_25A8402DC()
{
  sub_25A841014();
  *(void *)(v0 + 16) = *(void *)(v0 + 48);
  sub_25A839A24(&qword_26B32C3E0);
  swift_dynamicCast();
  swift_willThrowTypedImpl();
  sub_25A83CDBC();
  return v1();
}

uint64_t sub_25A840374(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A855990();
  if (sub_25A83CAF0(a1, 1, v6) == 1)
  {
    sub_25A840D1C(a1, &qword_26B32C3F0);
  }
  else
  {
    sub_25A855980();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_25A855930();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t CancellableOSTransaction.deinit()
{
  sub_25A8559A0();
  swift_release();
  swift_release();
  return v0;
}

uint64_t CancellableOSTransaction.__deallocating_deinit()
{
  CancellableOSTransaction.deinit();
  uint64_t v0 = sub_25A841030();

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_25A84055C()
{
  uint64_t result = sub_25A8558A0();
  qword_26B32BE50 = result;
  return result;
}

id static NSNotificationName.pds_SIGTERMReceived.getter()
{
  if (qword_26B32BCE8 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26B32BE50;

  return v0;
}

unint64_t sub_25A8405F4()
{
  unint64_t result = qword_26A468E80;
  if (!qword_26A468E80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A468E80);
  }
  return result;
}

uint64_t type metadata accessor for CancellableOSTransaction()
{
  return self;
}

uint64_t method lookup function for CancellableOSTransaction(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CancellableOSTransaction);
}

uint64_t dispatch thunk of CancellableOSTransaction.__allocating_init(_:onSIGTERM:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

unsigned char *initializeBufferWithCopyOfBuffer for CancellableOSTransaction.ReleaseBehavior(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CancellableOSTransaction.ReleaseBehavior(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFF)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v5 = v6 - 2;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for CancellableOSTransaction.ReleaseBehavior(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25A8407F0);
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

uint64_t sub_25A840818(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25A840820(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

void type metadata accessor for CancellableOSTransaction.ReleaseBehavior()
{
}

uint64_t sub_25A840838(uint64_t a1, int *a2)
{
  unsigned int v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  unsigned int v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *unsigned int v4 = v2;
  v4[1] = sub_25A840914;
  return v6(a1);
}

uint64_t sub_25A840914()
{
  sub_25A841014();
  sub_25A83CC48();
  uint64_t v1 = *v0;
  sub_25A83CD38();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_25A83CDBC();
  return v3();
}

uint64_t sub_25A8409D8()
{
  swift_release();
  uint64_t v0 = sub_25A841030();

  return MEMORY[0x270FA0238](v0, v1, v2);
}

uint64_t sub_25A840A08(uint64_t a1)
{
  unsigned int v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_25A83FFE8;
  unsigned int v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26A468E88 + dword_26A468E88);
  return v6(a1, v4);
}

uint64_t sub_25A840AC0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_25A840AD0()
{
  return swift_release();
}

uint64_t sub_25A840AD8(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_25A840B20()
{
  unint64_t result = qword_26B32C0D0;
  if (!qword_26B32C0D0)
  {
    sub_25A840B74(&qword_26B32C0C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B32C0D0);
  }
  return result;
}

uint64_t sub_25A840B74(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_25A840BBC(uint64_t a1)
{
  return sub_25A83EEE8(a1);
}

uint64_t sub_25A840BD8(uint64_t a1, char a2)
{
  if (a2 != -1) {
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_25A840BEC(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_25A840C28()
{
  sub_25A855700();
  sub_25A841040();
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);

  return MEMORY[0x270FA0238](v0, v4, v5);
}

void sub_25A840CAC()
{
  sub_25A855700();

  sub_25A83E468();
}

uint64_t sub_25A840D1C(uint64_t a1, uint64_t *a2)
{
  sub_25A839A24(a2);
  sub_25A841040();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

void sub_25A840D6C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = (id)sub_25A855810();
  swift_bridgeObjectRelease();
  objc_msgSend(a4, sel_postNotificationName_object_userInfo_, a1, a2, v7);
}

uint64_t sub_25A840E08(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_25A840E64(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_25A840E74()
{
  return swift_release();
}

void type metadata accessor for DaemonEventHandlers()
{
}

uint64_t sub_25A840E88(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;
  swift_unknownObjectRetain();
  return a1;
}

uint64_t sub_25A840EC0()
{
  return swift_unknownObjectRelease();
}

uint64_t sub_25A840EC8(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  return a1;
}

uint64_t initializeWithTake for InterprocessError(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t sub_25A840F20(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;
  swift_unknownObjectRelease();
  return a1;
}

uint64_t _s22ProactiveDaemonSupport17InterprocessErrorVwet_0(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFF && *(unsigned char *)(a1 + 9))
    {
      int v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
      if (v3 <= 1) {
        int v2 = -1;
      }
      else {
        int v2 = v3 ^ 0xFF;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t _s22ProactiveDaemonSupport17InterprocessErrorVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)uint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_25A840FE0(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_25A840FE8(uint64_t result, char a2)
{
  *(unsigned char *)(result + 8) = a2 & 1;
  return result;
}

void type metadata accessor for DaemonEventHandlers.SIGTERMDispatchSource()
{
}

uint64_t sub_25A841030()
{
  return v0;
}

unint64_t ExitReason.description.getter()
{
  unint64_t result = 0x73736563637573;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0xD000000000000020;
      break;
    case 2:
      unint64_t result = 0xD00000000000002CLL;
      break;
    case 3:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 4:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 5:
      unint64_t result = 0xD000000000000025;
      break;
    case 6:
      unint64_t result = 0xD000000000000018;
      break;
    case 7:
      unint64_t result = 0xD000000000000019;
      break;
    case 8:
      unint64_t result = 0xD00000000000001BLL;
      break;
    default:
      return result;
  }
  return result;
}

ProactiveDaemonSupport::ExitReason_optional __swiftcall ExitReason.init(rawValue:)(Swift::Int32 rawValue)
{
  if (rawValue >= 9) {
    char v2 = 9;
  }
  else {
    char v2 = rawValue;
  }
  *uint64_t v1 = v2;
  return (ProactiveDaemonSupport::ExitReason_optional)rawValue;
}

uint64_t ExitReason.rawValue.getter()
{
  return *v0;
}

BOOL sub_25A841198(char *a1, char *a2)
{
  return sub_25A844624(*a1, *a2);
}

uint64_t sub_25A8411A4()
{
  return sub_25A844684();
}

uint64_t sub_25A8411AC()
{
  return sub_25A8446CC();
}

uint64_t sub_25A8411B4()
{
  return sub_25A844754();
}

ProactiveDaemonSupport::ExitReason_optional sub_25A8411BC(Swift::Int32 *a1)
{
  return ExitReason.init(rawValue:)(*a1);
}

uint64_t sub_25A8411C4@<X0>(_DWORD *a1@<X8>)
{
  uint64_t result = ExitReason.rawValue.getter();
  *a1 = result;
  return result;
}

void static Exit.exit(_:logger:)(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v4 = sub_25A839A24(&qword_26B32C340);
  MEMORY[0x270FA5388](v4 - 8, v5);
  id v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *a1;
  sub_25A8414E4(a2, (uint64_t)v7);
  uint64_t v9 = sub_25A855700();
  if (sub_25A83CAF0((uint64_t)v7, 1, v9) == 1)
  {
    sub_25A84154C((uint64_t)v7);
  }
  else
  {
    uint64_t v10 = sub_25A8556F0();
    os_log_type_t v11 = sub_25A8559E0();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      uint64_t v18 = v13;
      *(_DWORD *)uint64_t v12 = 136315138;
      unint64_t v14 = 0xE700000000000000;
      uint64_t v15 = 0x73736563637573;
      switch(v8)
      {
        case 1:
          uint64_t v15 = 0xD000000000000020;
          uint64_t v16 = "cannot resolve library directory";
          goto LABEL_13;
        case 2:
          uint64_t v15 = 0xD00000000000002CLL;
          uint64_t v16 = "cannot resolve protected container directory";
          goto LABEL_13;
        case 3:
          uint64_t v15 = 0xD00000000000001CLL;
          uint64_t v16 = "cannot create base directory";
          goto LABEL_13;
        case 4:
          uint64_t v15 = 0xD00000000000001ALL;
          uint64_t v16 = "cannot read base directory";
          goto LABEL_13;
        case 5:
          uint64_t v15 = 0xD000000000000025;
          uint64_t v16 = "cannot read unsuffixed user directory";
          goto LABEL_13;
        case 6:
          unint64_t v14 = 0x800000025A856930;
          uint64_t v15 = 0xD000000000000018;
          break;
        case 7:
          uint64_t v15 = 0xD000000000000019;
          uint64_t v16 = "confstr cache dir failure";
          goto LABEL_13;
        case 8:
          uint64_t v15 = 0xD00000000000001BLL;
          uint64_t v16 = "set user dir suffix failure";
LABEL_13:
          unint64_t v14 = (unint64_t)(v16 - 32) | 0x8000000000000000;
          break;
        default:
          break;
      }
      uint64_t v17 = sub_25A8415AC(v15, v14, &v18);
      sub_25A855AA0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25A837000, v10, v11, "Exiting with reason: %s", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261147430](v13, -1, -1);
      MEMORY[0x261147430](v12, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(v7, v9);
  }
  _exit(v8);
}

uint64_t sub_25A8414E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A839A24(&qword_26B32C340);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25A84154C(uint64_t a1)
{
  uint64_t v2 = sub_25A839A24(&qword_26B32C340);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25A8415AC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_25A841680(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25A840E08((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_25A840E08((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_25A83B7E8((uint64_t)v12);
  return v7;
}

uint64_t sub_25A841680(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_25A8417D8((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_25A855AB0();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_25A8418B0(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_25A855B70();
    if (!v8)
    {
      uint64_t result = sub_25A855C00();
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

void *sub_25A8417D8(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_25A855C40();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_25A8418B0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25A841948(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_25A841B24(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_25A841B24((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25A841948(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_25A855910();
    if (v2) {
      goto LABEL_6;
    }
    return MEMORY[0x263F8EE78];
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return MEMORY[0x263F8EE78];
  }
LABEL_6:
  unint64_t v3 = sub_25A841ABC(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_25A855B20();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_25A855C40();
  __break(1u);
LABEL_14:
  uint64_t result = sub_25A855C00();
  __break(1u);
  return result;
}

void *sub_25A841ABC(uint64_t a1, uint64_t a2)
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
  sub_25A839A24(&qword_26A468EB0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_25A841B24(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_25A839A24(&qword_26A468EB0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_25A841CD4(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25A841BFC(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_25A841BFC(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_25A855C40();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_25A841CD4(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_25A855C40();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unint64_t sub_25A841D68()
{
  unint64_t result = qword_26A468EA8;
  if (!qword_26A468EA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A468EA8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ExitReason(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF8)
  {
    if (a2 + 8 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 8) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 9;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 9;
  int v5 = v6 - 9;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for ExitReason(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 8 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 8) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF8) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF7)
  {
    unsigned int v6 = ((a2 - 248) >> 8) + 1;
    *unint64_t result = a2 + 8;
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
        JUMPOUT(0x25A841F08);
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
          *unint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

unsigned char *sub_25A841F30(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ExitReason()
{
  return &type metadata for ExitReason;
}

ValueMetadata *type metadata accessor for Exit()
{
  return &type metadata for Exit;
}

uint64_t static OSVariant.osVariantAllowsInternalSecurityPolicies(subsystem:)(uint64_t a1, uint64_t a2)
{
  return sub_25A841F8C(a1, a2, (uint64_t (*)(uint64_t))_pds_os_variant_allows_internal_security_policies);
}

uint64_t static OSVariant.osVariantHasInternalContent(subsystem:)(uint64_t a1, uint64_t a2)
{
  return sub_25A841F8C(a1, a2, (uint64_t (*)(uint64_t))_pds_os_variant_has_internal_content);
}

uint64_t sub_25A841F8C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_25A8558C0();
  uint64_t v5 = a3(v4 + 32);
  swift_release();
  return v5;
}

ValueMetadata *type metadata accessor for OSVariant()
{
  return &type metadata for OSVariant;
}

uint64_t sub_25A841FE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A839A24(&qword_26B32C340);
  uint64_t v6 = MEMORY[0x270FA5388](v4 - 8, v5);
  int64_t v8 = &v41[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v6, v9);
  size_t v11 = &v41[-v10];
  uint64_t v12 = sub_25A855700();
  uint64_t v42 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12, v13);
  uint64_t v16 = &v41[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v14, v17);
  uint64_t v19 = &v41[-v18];
  (*(void (**)(uint64_t, uint64_t))(a2 + 16))(a1, a2);
  sub_25A8558C0();
  swift_bridgeObjectRelease();
  int v20 = _set_user_dir_suffix();
  swift_release();
  if (!v20)
  {
    uint64_t v34 = sub_25A8424F4();
    v35(v34);
    uint64_t v36 = sub_25A8556F0();
    os_log_type_t v37 = sub_25A8559C0();
    if (os_log_type_enabled(v36, v37))
    {
      uint64_t v38 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v38 = 0;
      _os_log_impl(&dword_25A837000, v36, v37, "Sandbox: _set_user_dir_suffix returned nil", v38, 2u);
      MEMORY[0x261147430](v38, -1, -1);
    }

    (*(void (**)(unsigned char *, uint64_t))(v42 + 8))(v16, v12);
    char v44 = 8;
    uint64_t v39 = sub_25A8424D8();
    v40(v39);
    sub_25A83B6E8((uint64_t)v8, 0, 1, v12);
    uint64_t v32 = &v44;
    uint64_t v33 = (uint64_t)v8;
LABEL_10:
    static Exit.exit(_:logger:)((unsigned __int8 *)v32, v33);
  }
  sub_25A842350(65537);
  if (!v21 || (sub_25A84245C(), v23 = v22, swift_bridgeObjectRelease(), uint64_t result = swift_bridgeObjectRelease(), !v23))
  {
    uint64_t v25 = sub_25A8424F4();
    v26(v25);
    uint64_t v27 = sub_25A8556F0();
    os_log_type_t v28 = sub_25A8559C0();
    if (os_log_type_enabled(v27, v28))
    {
      long long v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v29 = 0;
      _os_log_impl(&dword_25A837000, v27, v28, "Sandbox: confstr(_CS_DARWIN_USER_TEMP_DIR) failed", v29, 2u);
      MEMORY[0x261147430](v29, -1, -1);
    }

    (*(void (**)(unsigned char *, uint64_t))(v42 + 8))(v19, v12);
    char v43 = 6;
    uint64_t v30 = sub_25A8424D8();
    v31(v30);
    sub_25A83B6E8((uint64_t)v11, 0, 1, v12);
    uint64_t v32 = &v43;
    uint64_t v33 = (uint64_t)v11;
    goto LABEL_10;
  }
  return result;
}

uint64_t sub_25A842350(int a1)
{
  uint64_t v2 = sub_25A855920();
  *(void *)(v2 + 16) = 1024;
  bzero((void *)(v2 + 32), 0x400uLL);
  if ((uint64_t)confstr(a1, (char *)(v2 + 32), 0x400uLL) >= 1) {
    return sub_25A8423D8(v2);
  }
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_25A8423D8(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 16);
  if (v1)
  {
    uint64_t v2 = result;
    int v3 = *(unsigned __int8 *)(result + 32);
    result += 32;
    if (!v3)
    {
LABEL_6:
      uint64_t v7 = sub_25A8558D0();
      swift_bridgeObjectRelease();
      return v7;
    }
    uint64_t v4 = 0;
    uint64_t v5 = v1 - 1;
    while (v5 != v4)
    {
      if (!*(unsigned __int8 *)(v2 + 33 + v4++)) {
        goto LABEL_6;
      }
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_25A84245C()
{
  uint64_t v0 = sub_25A8558C0();
  uint64_t v1 = realpath_DARWIN_EXTSN((const char *)(v0 + 32), 0);
  swift_release();
  if (!v1) {
    return 0;
  }
  uint64_t v2 = sub_25A855900();
  MEMORY[0x261147430](v1, -1, -1);
  return v2;
}

uint64_t sub_25A8424D8()
{
  return v0;
}

uint64_t sub_25A8424F4()
{
  uint64_t result = v1;
  *(void *)(v2 - 104) = v0;
  return result;
}

void *sub_25A842520(void *a1)
{
  int v3 = sub_25A83BA0C(a1, a1[3]);
  sub_25A855DD0();
  if (!v1)
  {
    sub_25A83BA0C(v8, v8[3]);
    sub_25A842E50();
    sub_25A855CE0();
    sub_25A840BEC(0, &qword_26A468ED0);
    sub_25A840BEC(0, &qword_26A468ED8);
    uint64_t v4 = sub_25A8559F0();
    int v3 = (void *)v4;
    if (v4)
    {
      sub_25A842E9C(v6, v7);
      sub_25A83B7E8((uint64_t)v8);
      sub_25A83B7E8((uint64_t)a1);
      return v3;
    }
    sub_25A842EF4();
    swift_allocError();
    swift_willThrow();
    sub_25A842E9C(v6, v7);
    sub_25A83B7E8((uint64_t)v8);
  }
  sub_25A83B7E8((uint64_t)a1);
  return v3;
}

uint64_t sub_25A842698(void *a1, uint64_t a2)
{
  v10[5] = *(id *)MEMORY[0x263EF8340];
  v10[0] = 0;
  id v3 = objc_msgSend(self, sel_archivedDataWithRootObject_requiringSecureCoding_error_, a2, 1, v10);
  id v4 = v10[0];
  if (v3)
  {
    uint64_t v5 = sub_25A855690();
    unint64_t v7 = v6;

    sub_25A83BA0C(a1, a1[3]);
    sub_25A855DF0();
    sub_25A842B88((uint64_t)v10, (uint64_t)v10[3]);
    sub_25A842F40();
    sub_25A855CF0();
    sub_25A842E9C(v5, v7);
    return sub_25A83B7E8((uint64_t)v10);
  }
  else
  {
    uint64_t v9 = v4;
    sub_25A855640();

    return swift_willThrow();
  }
}

void *sub_25A8427F0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_25A842520(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_25A84281C(void *a1)
{
  return sub_25A842698(a1, *v1);
}

id InterprocessError.error.getter()
{
  id v1 = *v0;
  sub_25A842868(*v0);
  return v1;
}

id sub_25A842868(id a1)
{
  return a1;
}

id InterprocessError.nsError.getter()
{
  id v1 = *(void **)v0;
  if (*(unsigned char *)(v0 + 8))
  {
    return v1;
  }
  else
  {
    uint64_t v5 = *(void **)v0;
    id v3 = v1;
    uint64_t v4 = sub_25A855630();
    sub_25A8428E8(v5);
    return (id)v4;
  }
}

void sub_25A8428E8(id a1)
{
}

uint64_t InterprocessError.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

uint64_t InterprocessError.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_25A83BA0C(a1, a1[3]);
  sub_25A855DD0();
  if (!v2)
  {
    sub_25A83BA0C(v9, v9[3]);
    sub_25A842A04();
    sub_25A855CE0();
    id v5 = v8;
    uint64_t v6 = NSError.pds_unlaunderSimpleNSError()();

    if (v6)
    {

      id v5 = (id)v6;
    }
    sub_25A83B7E8((uint64_t)v9);
    *(void *)a2 = v5;
    *(unsigned char *)(a2 + 8) = v6 == 0;
  }
  return sub_25A83B7E8((uint64_t)a1);
}

unint64_t sub_25A842A04()
{
  unint64_t result = qword_26A468EB8;
  if (!qword_26A468EB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A468EB8);
  }
  return result;
}

uint64_t InterprocessError.encode(to:)(void *a1)
{
  uint64_t v2 = *(void **)v1;
  char v3 = *(unsigned char *)(v1 + 8);
  sub_25A83BA0C(a1, a1[3]);
  sub_25A855DF0();
  if (v3)
  {
    sub_25A842B88((uint64_t)v9, v10);
    sub_25A842BD8();
    sub_25A855CF0();
  }
  else
  {
    swift_getErrorValue();
    id v4 = v2;
    Error.pds_launderToSimpleNSError(discardUserInfo:)(v5, 0);
    unint64_t v7 = v6;
    sub_25A842B88((uint64_t)v9, v10);
    sub_25A842BD8();
    sub_25A855CF0();

    sub_25A8428E8(v2);
  }
  return sub_25A83B7E8((uint64_t)v9);
}

uint64_t sub_25A842B88(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

unint64_t sub_25A842BD8()
{
  unint64_t result = qword_26A468EC0;
  if (!qword_26A468EC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A468EC0);
  }
  return result;
}

uint64_t sub_25A842C24@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return InterprocessError.init(from:)(a1, a2);
}

uint64_t sub_25A842C3C(void *a1)
{
  return InterprocessError.encode(to:)(a1);
}

uint64_t static InterprocessError.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  char v3 = *(unsigned char *)(a1 + 8);
  id v4 = *(void **)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  uint64_t v6 = *(void **)a1;
  if (v3)
  {
    sub_25A842868(v6);
    unint64_t v7 = v2;
  }
  else
  {
    sub_25A842868(v6);
    unint64_t v7 = (void *)sub_25A855630();
    sub_25A8428E8(v2);
  }
  sub_25A842868(v4);
  if (v5)
  {
    int64_t v8 = v4;
  }
  else
  {
    int64_t v8 = (void *)sub_25A855630();
    sub_25A8428E8(v4);
  }
  sub_25A840BEC(0, &qword_26A468EC8);
  char v9 = sub_25A855A80();

  return v9 & 1;
}

void type metadata accessor for InterprocessError()
{
}

uint64_t _s22ProactiveDaemonSupport17InterprocessErrorVwCP_0(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  sub_25A842868(*(id *)a2);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  return a1;
}

void _s22ProactiveDaemonSupport17InterprocessErrorVwxx_0(id *a1)
{
}

uint64_t _s22ProactiveDaemonSupport17InterprocessErrorVwca_0(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  sub_25A842868(*(id *)a2);
  char v5 = *(void **)a1;
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  sub_25A8428E8(v5);
  return a1;
}

uint64_t _s22ProactiveDaemonSupport17InterprocessErrorVwta_0(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  char v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;
  sub_25A8428E8(v4);
  return a1;
}

void type metadata accessor for InterprocessError.Representation()
{
}

void type metadata accessor for InterprocessError.WrappedNSError()
{
}

unint64_t sub_25A842E50()
{
  unint64_t result = qword_26B32BD90;
  if (!qword_26B32BD90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B32BD90);
  }
  return result;
}

uint64_t sub_25A842E9C(uint64_t a1, unint64_t a2)
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

unint64_t sub_25A842EF4()
{
  unint64_t result = qword_26A468EE0;
  if (!qword_26A468EE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A468EE0);
  }
  return result;
}

unint64_t sub_25A842F40()
{
  unint64_t result = qword_26B32BD00;
  if (!qword_26B32BD00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B32BD00);
  }
  return result;
}

void type metadata accessor for InterprocessError.WrappedNSError.CouldNotUnarchiveNSError()
{
}

double sub_25A842FA4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  if (*(void *)(a3 + 16) && (unint64_t v6 = sub_25A843B3C(a1, a2), (v7 & 1) != 0))
  {
    uint64_t v8 = *(void *)(a3 + 56) + 32 * v6;
    sub_25A840E08(v8, (uint64_t)a4);
  }
  else
  {
    double result = 0.0;
    *a4 = 0u;
    a4[1] = 0u;
  }
  return result;
}

uint64_t NSError.pds_unlaunderSimpleNSError()()
{
  uint64_t v1 = v0;
  id v2 = objc_msgSend(v0, sel_userInfo);
  uint64_t v3 = sub_25A855820();

  sub_25A842FA4(0x657079745F736470, 0xEC000000746E6948, v3, &v18);
  swift_bridgeObjectRelease();
  if (!v19) {
    goto LABEL_11;
  }
  sub_25A840E64(&v18, v21);
  sub_25A840E08((uint64_t)v21, (uint64_t)&v18);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_15:
    sub_25A83B7E8((uint64_t)v21);
    return 0;
  }
  id v4 = objc_msgSend(v1, sel_userInfo);
  uint64_t v5 = sub_25A855820();

  sub_25A842FA4(0x6F7272655F736470, 0xED00006174614472, v5, &v18);
  swift_bridgeObjectRelease();
  if (!v19)
  {
    sub_25A83B7E8((uint64_t)v21);
    swift_bridgeObjectRelease();
LABEL_11:
    sub_25A83CB18((uint64_t)&v18, qword_26B32C348);
    return 0;
  }
  sub_25A840E64(&v18, v20);
  sub_25A840E08((uint64_t)v20, (uint64_t)&v18);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_14:
    sub_25A83B7E8((uint64_t)v20);
    goto LABEL_15;
  }
  long long v6 = v15;
  uint64_t v7 = sub_25A855B30();
  swift_bridgeObjectRelease();
  if (!v7 || (uint64_t v8 = sub_25A843354(v7)) == 0)
  {
    sub_25A842E9C(v15, *((unint64_t *)&v15 + 1));
    goto LABEL_14;
  }
  uint64_t v10 = v8;
  uint64_t v11 = v9;
  if (qword_26A468A90 != -1) {
    swift_once();
  }
  uint64_t v16 = v10;
  uint64_t v17 = v11;
  sub_25A84382C((uint64_t *)&v15);
  sub_25A8555F0();
  sub_25A842E9C(v6, *((unint64_t *)&v6 + 1));
  sub_25A83B7E8((uint64_t)v20);
  sub_25A83B7E8((uint64_t)v21);
  sub_25A839AFC(&v15, (uint64_t)&v18);
  sub_25A839AFC(&v18, (uint64_t)&v15);
  sub_25A839A24(&qword_26A468EF0);
  sub_25A839A24(&qword_26B32C3E0);
  char v13 = swift_dynamicCast();
  if ((v13 & 1) == 0) {
    return 0;
  }
  return v14;
}

uint64_t sub_25A843354(uint64_t a1)
{
  if (swift_conformsToProtocol2()) {
    return a1;
  }
  else {
    return 0;
  }
}

void __swiftcall Error.pds_launderToSimpleNSError(discardUserInfo:)(NSError *__return_ptr retstr, Swift::Bool discardUserInfo)
{
  uint64_t v3 = v2;
  HIDWORD(v31) = discardUserInfo;
  uint64_t v4 = *(void *)(v2 - 8);
  uint64_t v5 = ((uint64_t (*)(Swift::Bool))MEMORY[0x270FA5388])(discardUserInfo);
  MEMORY[0x270FA5388](v5, v6);
  uint64_t v8 = (char *)v32 - v7 + 128;
  swift_getDynamicType();
  uint64_t v9 = *(void (**)(void))(v4 + 16);
  sub_25A844610();
  v9();
  uint64_t v10 = sub_25A855CA0();
  if (v10)
  {
    uint64_t v11 = (void *)v10;
    (*(void (**)(char *, uint64_t))(v4 + 8))(v8, v3);
  }
  else
  {
    uint64_t v11 = (void *)swift_allocError();
    (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))(v12, v8, v3);
  }
  char v13 = (void *)sub_25A855630();

  sub_25A844610();
  v9();
  sub_25A839A24(&qword_26A468EF8);
  if (swift_dynamicCast())
  {
    sub_25A843AA8(v32, &v33);
    sub_25A83BA0C(&v33, v34);
    if (qword_26A468A98 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_25A855600();
    uint64_t v18 = v17;
    sub_25A839A24(&qword_26A468F08);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_25A8582F0;
    strcpy((char *)(inited + 32), "pds_typeHint");
    *(unsigned char *)(inited + 45) = 0;
    *(_WORD *)(inited + 46) = -5120;
    uint64_t v20 = sub_25A855BC0();
    *(void *)(inited + 72) = MEMORY[0x263F8D310];
    if (!v21) {
      uint64_t v20 = sub_25A855E60();
    }
    char v22 = BYTE4(v31);
    *(void *)(inited + 48) = v20;
    *(void *)(inited + 56) = v21;
    strcpy((char *)(inited + 80), "pds_errorData");
    *(_WORD *)(inited + 94) = -4864;
    *(void *)(inited + 120) = MEMORY[0x263F06F78];
    *(void *)(inited + 96) = v16;
    *(void *)(inited + 104) = v18;
    uint64_t v14 = sub_25A855840();
    sub_25A83B7E8((uint64_t)&v33);
    if ((v22 & 1) == 0) {
      goto LABEL_13;
    }
  }
  else
  {
    memset(v32, 0, sizeof(v32));
    sub_25A83CB18((uint64_t)v32, &qword_26A468F00);
    uint64_t v14 = sub_25A855840();
    if ((v31 & 0x100000000) == 0)
    {
LABEL_13:
      id v23 = objc_msgSend(v13, sel_userInfo);
      uint64_t v15 = sub_25A855820();

      goto LABEL_14;
    }
  }
  uint64_t v15 = sub_25A855840();
LABEL_14:
  id v24 = objc_msgSend(v13, sel_domain);
  uint64_t v25 = sub_25A8558B0();
  uint64_t v27 = v26;

  id v28 = objc_msgSend(v13, sel_code);
  uint64_t v29 = sub_25A84396C(v14, v15);
  id v30 = objc_allocWithZone(MEMORY[0x263F087E8]);
  sub_25A8439F8(v25, v27, (uint64_t)v28, v29);
}

uint64_t sub_25A8437F8(uint64_t a1)
{
  return sub_25A843918(a1, MEMORY[0x263F06128], MEMORY[0x263F06120], &qword_26A469E90);
}

uint64_t *sub_25A84382C(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_25A843890(uint64_t result)
{
  if ((*(_DWORD *)(*(void *)(*(void *)(result + 24) - 8) + 80) & 0x20000) != 0) {
    JUMPOUT(0x261147430);
  }
  return result;
}

uint64_t sub_25A8438E4(uint64_t a1)
{
  return sub_25A843918(a1, MEMORY[0x263F061E0], MEMORY[0x263F061D8], &qword_26A469E98);
}

uint64_t sub_25A843918(uint64_t a1, void (*a2)(void), uint64_t (*a3)(void), uint64_t *a4)
{
  a2(0);
  swift_allocObject();
  uint64_t result = a3();
  *a4 = result;
  return result;
}

uint64_t sub_25A84396C(uint64_t a1, uint64_t a2)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = a2;
  sub_25A844110(a1, (uint64_t)sub_25A8440D8, 0, isUniquelyReferenced_nonNull_native, &v8);
  uint64_t v6 = v8;
  swift_bridgeObjectRelease();
  if (v2) {
    swift_bridgeObjectRelease();
  }
  return v6;
}

id sub_25A8439F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = (void *)sub_25A8558A0();
  swift_bridgeObjectRelease();
  if (a4)
  {
    uint64_t v8 = (void *)sub_25A855810();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = objc_msgSend(v4, sel_initWithDomain_code_userInfo_, v7, a3, v8);

  return v9;
}

_OWORD *sub_25A843AA8(long long *a1, _OWORD *a2)
{
  long long v2 = *a1;
  long long v3 = a1[2];
  a2[1] = a1[1];
  a2[2] = v3;
  *a2 = v2;
  return a2;
}

unint64_t sub_25A843AC0(void *a1)
{
  sub_25A855D80();
  sub_25A855DA0();
  sub_25A855B00();
  uint64_t v2 = sub_25A855DC0();

  return sub_25A843BB4(a1, v2);
}

unint64_t sub_25A843B3C(uint64_t a1, uint64_t a2)
{
  sub_25A855D80();
  sub_25A8558E0();
  uint64_t v4 = sub_25A855DC0();

  return sub_25A843C9C(a1, a2, v4);
}

unint64_t sub_25A843BB4(void *a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    uint64_t v7 = a1 + 1;
    while (1)
    {
      sub_25A8445B4(*(void *)(v2 + 48) + 48 * v4, (uint64_t)&v9);
      if (v9 == *a1 && (MEMORY[0x261146A90](&v10, v7) & 1) != 0) {
        break;
      }
      sub_25A83B658((uint64_t)&v9);
      unint64_t v4 = (v4 + 1) & v6;
      if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) == 0) {
        return v4;
      }
    }
    sub_25A83B658((uint64_t)&v9);
  }
  return v4;
}

unint64_t sub_25A843C9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_25A855CD0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        char v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_25A855CD0() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_25A843D80(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_25A839A24(&qword_26A468F10);
  uint64_t v6 = sub_25A855C20();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v34 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    if (!v10) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v14 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    for (unint64_t i = v14 | (v13 << 6); ; unint64_t i = __clz(__rbit64(v17)) + (v13 << 6))
    {
      uint64_t v19 = (uint64_t *)(*(void *)(v5 + 48) + 16 * i);
      uint64_t v21 = *v19;
      uint64_t v20 = v19[1];
      char v22 = (_OWORD *)(*(void *)(v5 + 56) + 32 * i);
      if (a2)
      {
        sub_25A840E64(v22, v35);
      }
      else
      {
        sub_25A840E08((uint64_t)v22, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_25A855D80();
      sub_25A8558E0();
      uint64_t result = sub_25A855DC0();
      uint64_t v23 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v24 = result & ~v23;
      unint64_t v25 = v24 >> 6;
      if (((-1 << v24) & ~*(void *)(v11 + 8 * (v24 >> 6))) == 0)
      {
        char v27 = 0;
        unint64_t v28 = (unint64_t)(63 - v23) >> 6;
        while (++v25 != v28 || (v27 & 1) == 0)
        {
          BOOL v29 = v25 == v28;
          if (v25 == v28) {
            unint64_t v25 = 0;
          }
          v27 |= v29;
          uint64_t v30 = *(void *)(v11 + 8 * v25);
          if (v30 != -1)
          {
            unint64_t v26 = __clz(__rbit64(~v30)) + (v25 << 6);
            goto LABEL_31;
          }
        }
        __break(1u);
LABEL_40:
        __break(1u);
LABEL_41:
        __break(1u);
        return result;
      }
      unint64_t v26 = __clz(__rbit64((-1 << v24) & ~*(void *)(v11 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
LABEL_31:
      *(void *)(v11 + ((v26 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v26;
      uint64_t v31 = (void *)(*(void *)(v7 + 48) + 16 * v26);
      *uint64_t v31 = v21;
      v31[1] = v20;
      uint64_t result = (uint64_t)sub_25A840E64(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v26));
      ++*(void *)(v7 + 16);
      if (v10) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v16 = v13 + 1;
      if (__OFADD__(v13, 1)) {
        goto LABEL_40;
      }
      if (v16 >= v33) {
        goto LABEL_33;
      }
      unint64_t v17 = v34[v16];
      ++v13;
      if (!v17)
      {
        int64_t v13 = v16 + 1;
        if (v16 + 1 >= v33) {
          goto LABEL_33;
        }
        unint64_t v17 = v34[v13];
        if (!v17)
        {
          int64_t v18 = v16 + 2;
          if (v18 >= v33)
          {
LABEL_33:
            swift_release();
            uint64_t v3 = v2;
            if (a2)
            {
              uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
              if (v32 >= 64) {
                sub_25A84407C(0, (unint64_t)(v32 + 63) >> 6, v34);
              }
              else {
                *uint64_t v34 = -1 << v32;
              }
              *(void *)(v5 + 16) = 0;
            }
            break;
          }
          unint64_t v17 = v34[v18];
          if (!v17)
          {
            while (1)
            {
              int64_t v13 = v18 + 1;
              if (__OFADD__(v18, 1)) {
                goto LABEL_41;
              }
              if (v13 >= v33) {
                goto LABEL_33;
              }
              unint64_t v17 = v34[v13];
              ++v18;
              if (v17) {
                goto LABEL_18;
              }
            }
          }
          int64_t v13 = v18;
        }
      }
LABEL_18:
      unint64_t v10 = (v17 - 1) & v17;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_25A84407C(uint64_t result, uint64_t a2, void *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }
  return result;
}

uint64_t sub_25A844098(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a2;
}

uint64_t sub_25A8440D8@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_25A844098((uint64_t)(a2 + 2), *a1, a1[1], (uint64_t)(a1 + 2));
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_25A844110(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t *a5)
{
  sub_25A84432C(a1, a2, a3, &v29);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_25A844368(&v27);
  uint64_t v7 = *((void *)&v27 + 1);
  if (!*((void *)&v27 + 1))
  {
LABEL_14:
    swift_release();
    swift_bridgeObjectRelease();
    sub_25A840E74();
    return swift_release();
  }
  while (1)
  {
    uint64_t v8 = v27;
    sub_25A840E64(&v28, v26);
    uint64_t v9 = *a5;
    unint64_t v11 = sub_25A843B3C(v8, v7);
    uint64_t v12 = *(void *)(v9 + 16);
    BOOL v13 = (v10 & 1) == 0;
    uint64_t v14 = v12 + v13;
    if (__OFADD__(v12, v13)) {
      break;
    }
    char v15 = v10;
    if (*(void *)(v9 + 24) >= v14)
    {
      if (a4)
      {
        if (v10) {
          goto LABEL_9;
        }
      }
      else
      {
        sub_25A839A24(&qword_26B32BCA8);
        sub_25A855BE0();
        if (v15) {
          goto LABEL_9;
        }
      }
    }
    else
    {
      sub_25A843D80(v14, a4 & 1);
      unint64_t v16 = sub_25A843B3C(v8, v7);
      if ((v15 & 1) != (v17 & 1)) {
        goto LABEL_17;
      }
      unint64_t v11 = v16;
      if (v15)
      {
LABEL_9:
        sub_25A840E08((uint64_t)v26, (uint64_t)v25);
        sub_25A83B7E8((uint64_t)v26);
        swift_bridgeObjectRelease();
        int64_t v18 = (_OWORD *)(*(void *)(*a5 + 56) + 32 * v11);
        sub_25A83B7E8((uint64_t)v18);
        sub_25A840E64(v25, v18);
        goto LABEL_13;
      }
    }
    uint64_t v19 = (void *)*a5;
    *(void *)(*a5 + 8 * (v11 >> 6) + 64) |= 1 << v11;
    uint64_t v20 = (uint64_t *)(v19[6] + 16 * v11);
    *uint64_t v20 = v8;
    v20[1] = v7;
    sub_25A840E64(v26, (_OWORD *)(v19[7] + 32 * v11));
    uint64_t v21 = v19[2];
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22) {
      goto LABEL_16;
    }
    v19[2] = v23;
LABEL_13:
    sub_25A844368(&v27);
    uint64_t v7 = *((void *)&v27 + 1);
    a4 = 1;
    if (!*((void *)&v27 + 1)) {
      goto LABEL_14;
    }
  }
  __break(1u);
LABEL_16:
  __break(1u);
LABEL_17:
  uint64_t result = sub_25A855D10();
  __break(1u);
  return result;
}

uint64_t sub_25A84432C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v4 = -1 << *(unsigned char *)(a1 + 32);
  *a4 = a1;
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t result = a1 + 64;
  uint64_t v6 = v7;
  a4[1] = result;
  a4[2] = ~v4;
  if (-v4 < 64) {
    uint64_t v8 = ~(-1 << -(char)v4);
  }
  else {
    uint64_t v8 = -1;
  }
  a4[3] = 0;
  a4[4] = v8 & v6;
  a4[5] = a2;
  a4[6] = a3;
  return result;
}

uint64_t sub_25A844368@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = v1[2];
  int64_t v5 = v1[3];
  int64_t v7 = v5;
  unint64_t v8 = v1[4];
  if (v8)
  {
    uint64_t v9 = (v8 - 1) & v8;
    unint64_t v10 = __clz(__rbit64(v8)) | (v5 << 6);
LABEL_3:
    unint64_t v11 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v10);
    uint64_t v13 = *v11;
    uint64_t v12 = v11[1];
    sub_25A840E08(*(void *)(v3 + 56) + 32 * v10, (uint64_t)v24);
    *(void *)&long long v23 = v13;
    *((void *)&v23 + 1) = v12;
    swift_bridgeObjectRetain();
    goto LABEL_23;
  }
  int64_t v14 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
    __break(1u);
    return result;
  }
  int64_t v15 = (unint64_t)(v6 + 64) >> 6;
  if (v14 < v15)
  {
    unint64_t v16 = *(void *)(v4 + 8 * v14);
    if (v16)
    {
LABEL_7:
      uint64_t v9 = (v16 - 1) & v16;
      unint64_t v10 = __clz(__rbit64(v16)) + (v14 << 6);
      int64_t v7 = v14;
      goto LABEL_3;
    }
    int64_t v17 = v5 + 2;
    int64_t v7 = v5 + 1;
    if (v5 + 2 < v15)
    {
      unint64_t v16 = *(void *)(v4 + 8 * v17);
      if (v16)
      {
LABEL_10:
        int64_t v14 = v17;
        goto LABEL_7;
      }
      int64_t v7 = v5 + 2;
      if (v5 + 3 < v15)
      {
        unint64_t v16 = *(void *)(v4 + 8 * (v5 + 3));
        if (v16)
        {
          int64_t v14 = v5 + 3;
          goto LABEL_7;
        }
        int64_t v17 = v5 + 4;
        int64_t v7 = v5 + 3;
        if (v5 + 4 < v15)
        {
          unint64_t v16 = *(void *)(v4 + 8 * v17);
          if (v16) {
            goto LABEL_10;
          }
          int64_t v14 = v5 + 5;
          int64_t v7 = v5 + 4;
          if (v5 + 5 < v15)
          {
            unint64_t v16 = *(void *)(v4 + 8 * v14);
            if (v16) {
              goto LABEL_7;
            }
            int64_t v7 = v15 - 1;
            int64_t v18 = v5 + 6;
            while (v18 < v15)
            {
              unint64_t v16 = *(void *)(v4 + 8 * v18++);
              if (v16)
              {
                int64_t v14 = v18 - 1;
                goto LABEL_7;
              }
            }
          }
        }
      }
    }
  }
  uint64_t v9 = 0;
  memset(v24, 0, sizeof(v24));
  long long v23 = 0u;
LABEL_23:
  *uint64_t v1 = v3;
  v1[1] = v4;
  v1[2] = v6;
  v1[3] = v7;
  v1[4] = v9;
  uint64_t v19 = (void (*)(_OWORD *))v1[5];
  uint64_t result = sub_25A84454C((uint64_t)&v23, (uint64_t)v22);
  if (*((void *)&v22[0] + 1))
  {
    v21[0] = v22[0];
    v21[1] = v22[1];
    _OWORD v21[2] = v22[2];
    v19(v21);
    return sub_25A83CB18((uint64_t)v21, &qword_26A468F20);
  }
  else
  {
    a1[1] = 0u;
    a1[2] = 0u;
    *a1 = 0u;
  }
  return result;
}

uint64_t sub_25A84454C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A839A24(&qword_26A468F18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25A8445B4(uint64_t a1, uint64_t a2)
{
  return a2;
}

BOOL sub_25A844624(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_25A844634()
{
  return sub_25A855DC0();
}

uint64_t sub_25A844684()
{
  return sub_25A855DC0();
}

uint64_t sub_25A8446CC()
{
  return sub_25A855DB0();
}

uint64_t sub_25A8446F4()
{
  return sub_25A8558E0();
}

uint64_t sub_25A844708()
{
  return sub_25A855DC0();
}

uint64_t sub_25A844754()
{
  return sub_25A855DC0();
}

uint64_t sub_25A844798()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  *(_OWORD *)task_info_out = 0u;
  long long v2 = 0u;
  uint64_t result = sub_25A845654(task_info_out);
  if (result)
  {
    sub_25A855B10();
    sub_25A8558F0();
    sub_25A855C90();
    sub_25A8558F0();
    swift_bridgeObjectRelease();
    uint64_t result = sub_25A855C10();
    __break(1u);
  }
  else
  {
    xmmword_26B32C2D0 = *(_OWORD *)task_info_out;
    *(_OWORD *)&qword_26B32C2E0 = v2;
  }
  return result;
}

uint64_t static AuditToken.currentProcess.getter()
{
  if (qword_26B32C1B0 != -1) {
    swift_once();
  }
  return xmmword_26B32C2D0;
}

uint64_t AuditToken.auditUserIdentifier.getter(uint64_t a1)
{
  return sub_25A8449D4(a1);
}

uint64_t AuditToken.effectiveUserIdentifier.getter(uint64_t a1)
{
  return sub_25A8449D4(a1);
}

uint64_t AuditToken.effectiveGroupIdentifier.getter(uint64_t a1)
{
  return sub_25A8449D4(a1);
}

uint64_t AuditToken.realUserIdentifier.getter(uint64_t a1)
{
  return sub_25A8449D4(a1);
}

uint64_t AuditToken.realGroupIdentifier.getter(uint64_t a1)
{
  return sub_25A8449D4(a1);
}

uint64_t AuditToken.processIdentifier.getter(uint64_t a1)
{
  return sub_25A8449D4(a1);
}

uint64_t AuditToken.auditSessionIdentifier.getter(uint64_t a1)
{
  return sub_25A8449D4(a1);
}

uint64_t AuditToken.processIdentifierVersion.getter(uint64_t a1)
{
  return sub_25A8449D4(a1);
}

uint64_t sub_25A8449D4(uint64_t a1)
{
  uint64_t v5 = a1;
  sub_25A8456B4();
  int v6 = v1;
  int v7 = v2;
  return v3(&v5);
}

void sub_25A844A0C(ProactiveDaemonSupport::AuditToken **a1@<X0>, uint64_t a2@<X8>)
{
  AuditToken.init(rawValue:)(*a1, &(*a1)->rawValue);
  *(void *)a2 = v3;
  *(void *)(a2 + 8) = v4;
  *(void *)(a2 + 16) = v5;
  *(void *)(a2 + 24) = v6;
  *(unsigned char *)(a2 + 32) = 0;
}

__n128 sub_25A844A48@<Q0>(_OWORD *a1@<X8>)
{
  __n128 result = *(__n128 *)v1;
  long long v3 = *(_OWORD *)(v1 + 16);
  *a1 = *(_OWORD *)v1;
  a1[1] = v3;
  return result;
}

uint64_t AuditToken.hash(into:)()
{
  return sub_25A855D90();
}

uint64_t sub_25A844AC8(uint64_t a1)
{
  uint64_t v1 = sub_25A844C64(a1, a1 + 32);
  unint64_t v3 = v2;
  sub_25A839A24(qword_26B32BD08);
  sub_25A842F40();
  sub_25A855C80();
  return sub_25A842E9C(v1, v3);
}

uint64_t static AuditToken.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v17[0] = a1;
  v17[1] = a2;
  v17[2] = a3;
  v17[3] = a4;
  v16[0] = a5;
  v16[1] = a6;
  v16[2] = a7;
  void v16[3] = a8;
  uint64_t v8 = sub_25A844C64((uint64_t)v17, (uint64_t)&v18);
  unint64_t v10 = v9;
  uint64_t v11 = sub_25A844C64((uint64_t)v16, (uint64_t)v17);
  unint64_t v13 = v12;
  char v14 = MEMORY[0x261146620](v8, v10, v11, v12);
  sub_25A842E9C(v11, v13);
  sub_25A842E9C(v8, v10);
  return v14 & 1;
}

uint64_t sub_25A844C64(uint64_t a1, uint64_t a2)
{
  v8[3] = MEMORY[0x263F8D3E8];
  void v8[4] = MEMORY[0x263F07B80];
  v8[0] = a1;
  v8[1] = a2;
  unint64_t v2 = sub_25A83BA0C(v8, MEMORY[0x263F8D3E8]);
  uint64_t v3 = *v2;
  if (*v2 && (v4 = v2[1], uint64_t v5 = v4 - v3, v4 != v3))
  {
    if (v5 <= 14)
    {
      uint64_t v6 = sub_25A855650();
    }
    else if ((unint64_t)v5 >= 0x7FFFFFFF)
    {
      uint64_t v6 = MEMORY[0x261146600]();
    }
    else
    {
      uint64_t v6 = MEMORY[0x261146610]();
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  sub_25A83B7E8((uint64_t)v8);
  return v6;
}

uint64_t AuditToken.hashValue.getter()
{
  return sub_25A855DC0();
}

BOOL sub_25A844D88()
{
  uint64_t v0 = sub_25A855C60();
  swift_bridgeObjectRelease();
  return v0 != 0;
}

uint64_t sub_25A844DD4()
{
  return AuditToken.hashValue.getter();
}

uint64_t sub_25A844DE0()
{
  return AuditToken.hash(into:)();
}

uint64_t sub_25A844DEC()
{
  return sub_25A855DC0();
}

uint64_t sub_25A844E48(uint64_t *a1, uint64_t *a2)
{
  return static AuditToken.== infix(_:_:)(*a1, a1[1], a1[2], a1[3], *a2, a2[1], a2[2], a2[3]);
}

BOOL sub_25A844E74@<W0>(unsigned char *a1@<X8>)
{
  BOOL result = sub_25A844D88();
  *a1 = result;
  return result;
}

void sub_25A844EAC(void *a1@<X8>)
{
  *a1 = 0x6E656B6F74;
  a1[1] = 0xE500000000000000;
}

uint64_t sub_25A844EC4()
{
  return 0x6E656B6F74;
}

uint64_t sub_25A844ED8@<X0>(BOOL *a1@<X8>)
{
  uint64_t result = sub_25A844DD0();
  *a1 = result != 0;
  return result;
}

uint64_t sub_25A844F08()
{
  return 0;
}

void sub_25A844F14(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_25A844F20(uint64_t a1)
{
  unint64_t v2 = sub_25A845160();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25A844F5C(uint64_t a1)
{
  unint64_t v2 = sub_25A845160();

  return MEMORY[0x270FA00B8](a1, v2);
}

void *AuditToken.init(from:)(void *a1)
{
  sub_25A839A24(qword_26B32BE80);
  sub_25A845694();
  MEMORY[0x270FA5388](v3, v4);
  uint64_t v5 = sub_25A83BA0C(a1, a1[3]);
  sub_25A845160();
  sub_25A855DE0();
  if (!v1)
  {
    sub_25A842E50();
    sub_25A855C70();
    sub_25A8451AC();
    sub_25A855610();
    uint64_t v7 = sub_25A8456CC();
    v8(v7);
    sub_25A842E9C(v9, v10);
    uint64_t v5 = 0;
  }
  sub_25A83B7E8((uint64_t)a1);
  return v5;
}

unint64_t sub_25A845160()
{
  unint64_t result = qword_26B32C2B8;
  if (!qword_26B32C2B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B32C2B8);
  }
  return result;
}

unint64_t sub_25A8451AC()
{
  unint64_t result = qword_26B32BD98[0];
  if (!qword_26B32BD98[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26B32BD98);
  }
  return result;
}

uint64_t AuditToken.encode(to:)(void *a1, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5)
{
  unint64_t v21 = a5;
  int v6 = a4;
  int v7 = a3;
  int v8 = a2;
  unint64_t v18 = HIDWORD(a2);
  unint64_t v19 = HIDWORD(a3);
  uint64_t v24 = *MEMORY[0x263EF8340];
  unint64_t v20 = HIDWORD(a4);
  unint64_t v22 = HIDWORD(a5);
  sub_25A839A24(qword_26B32BD08);
  sub_25A845694();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12, v13);
  int64_t v15 = (char *)&v17 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25A83BA0C(a1, a1[3]);
  sub_25A845160();
  sub_25A855E00();
  v23[0] = v8;
  v23[1] = v18;
  v23[2] = v7;
  v23[3] = v19;
  v23[4] = v6;
  v23[5] = v20;
  v23[6] = v21;
  v23[7] = v22;
  sub_25A844AC8((uint64_t)v23);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v15, v5);
}

unint64_t sub_25A845378()
{
  unint64_t result = qword_26A468F28;
  if (!qword_26A468F28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A468F28);
  }
  return result;
}

void *sub_25A8453C4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  unint64_t result = AuditToken.init(from:)(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }
  return result;
}

uint64_t sub_25A84540C(void *a1)
{
  return AuditToken.encode(to:)(a1, *v1, v1[1], v1[2], v1[3]);
}

ValueMetadata *type metadata accessor for AuditToken()
{
  return &type metadata for AuditToken;
}

uint64_t getEnumTagSinglePayload for AuditToken.CodingKeys(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for AuditToken.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25A84552CLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for AuditToken.CodingKeys()
{
  return &type metadata for AuditToken.CodingKeys;
}

unint64_t sub_25A845568()
{
  unint64_t result = qword_26A468F30;
  if (!qword_26A468F30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A468F30);
  }
  return result;
}

unint64_t sub_25A8455B8()
{
  unint64_t result = qword_26B32C2C8;
  if (!qword_26B32C2C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B32C2C8);
  }
  return result;
}

unint64_t sub_25A845608()
{
  unint64_t result = qword_26B32C2C0;
  if (!qword_26B32C2C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B32C2C0);
  }
  return result;
}

uint64_t sub_25A845654(task_info_t task_info_out)
{
  mach_msg_type_number_t task_info_outCnt = 8;
  return task_info(*MEMORY[0x263EF8960], 0xFu, task_info_out, &task_info_outCnt);
}

uint64_t sub_25A8456CC()
{
  return v0;
}

uint64_t static MachIdentityToken.newTokenForCurrentProcess()()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  task_id_token_t token = 0;
  if (task_create_identity_token(*MEMORY[0x263EF8960], &token))
  {
    sub_25A855B10();
    swift_bridgeObjectRelease();
    sub_25A845DB8();
    sub_25A855C90();
    sub_25A845E30();
    swift_bridgeObjectRelease();
    sub_25A845E48();
    uint64_t result = sub_25A845DD0();
    __break(1u);
  }
  else
  {
    task_id_token_t v0 = token;
    uint64_t result = sub_25A845E14();
    if (!v0) {
      __break(1u);
    }
    *(_DWORD *)(result + 16) = v0;
  }
  return result;
}

uint64_t MachIdentityToken.__allocating_init(consumingToken:)(int a1)
{
  uint64_t result = sub_25A845E14();
  if (a1) {
    *(_DWORD *)(result + 16) = a1;
  }
  else {
    __break(1u);
  }
  return result;
}

uint64_t MachIdentityToken.__allocating_init(copyingToken:)(mach_port_name_t a1)
{
  uint64_t v2 = sub_25A845E14();
  MachIdentityToken.init(copyingToken:)(a1);
  return v2;
}

uint64_t MachIdentityToken.init(copyingToken:)(mach_port_name_t name)
{
  if (name)
  {
    if (!mach_port_mod_refs(*MEMORY[0x263EF8960], name, 0, 1))
    {
      *(_DWORD *)(v1 + 16) = name;
      return v1;
    }
  }
  else
  {
    __break(1u);
  }
  sub_25A845DF0();
  swift_bridgeObjectRelease();
  sub_25A845DB8();
  sub_25A855C90();
  sub_25A845E30();
  swift_bridgeObjectRelease();
  sub_25A845E48();
  uint64_t result = sub_25A845DD0();
  __break(1u);
  return result;
}

uint64_t MachIdentityToken.init(consumingToken:)(uint64_t result)
{
  if (result)
  {
    *(_DWORD *)(v1 + 16) = result;
    return v1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t MachIdentityToken.__allocating_init(xpcObject:)()
{
  return MachIdentityToken.init(xpcObject:)();
}

uint64_t MachIdentityToken.init(xpcObject:)()
{
  int v1 = xpc_mach_send_copy_right();
  swift_unknownObjectRelease();
  if (v1)
  {
    *(_DWORD *)(v0 + 16) = v1;
  }
  else
  {
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v0;
}

uint64_t MachIdentityToken.deinit()
{
  if (!mach_port_deallocate(*MEMORY[0x263EF8960], *(_DWORD *)(v0 + 16))) {
    return v0;
  }
  sub_25A845DF0();
  swift_bridgeObjectRelease();
  sub_25A845DB8();
  sub_25A855C90();
  sub_25A845E30();
  swift_bridgeObjectRelease();
  sub_25A845E48();
  uint64_t result = sub_25A845DD0();
  __break(1u);
  return result;
}

uint64_t MachIdentityToken.__deallocating_deinit()
{
  MachIdentityToken.deinit();

  return MEMORY[0x270FA0228](v0, 20, 7);
}

uint64_t MachIdentityToken.xpcObject()()
{
  uint64_t result = xpc_mach_send_create();
  if (!result) {
    __break(1u);
  }
  return result;
}

kern_return_t *_s22ProactiveDaemonSupport17MachIdentityTokenC05auditF0AA05AuditF0VyAA0deF5ErrorVYKF(kern_return_t *a1)
{
  kern_return_t v3;
  mach_port_t v4;
  kern_return_t v5;
  integer_t task_info_out[4];
  long long v8;
  mach_port_t task_port;
  uint64_t v10;

  uint64_t v10 = *MEMORY[0x263EF8340];
  task_port = 0;
  uint64_t v3 = task_identity_token_get_task_port(*(_DWORD *)(v1 + 16), 3u, &task_port);
  if (v3)
  {
    *a1 = v3;
    task_info_out[0] = v3;
    sub_25A845BEC();
    swift_willThrowTypedImpl();
  }
  else
  {
    *(_OWORD *)task_info_out = 0u;
    int v8 = 0u;
    unsigned int v4 = task_port;
    uint64_t v5 = sub_25A845C38(task_info_out, task_port);
    if (v5)
    {
      *a1 = v5;
      sub_25A845BEC();
      swift_willThrowTypedImpl();
    }
    else
    {
      a1 = *(kern_return_t **)task_info_out;
    }
    mach_port_deallocate(*MEMORY[0x263EF8960], v4);
  }
  return a1;
}

unint64_t sub_25A845BEC()
{
  unint64_t result = qword_26A468F38;
  if (!qword_26A468F38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_26A468F38);
  }
  return result;
}

uint64_t sub_25A845C38(task_info_t task_info_out, task_name_t target_task)
{
  mach_msg_type_number_t task_info_outCnt = 8;
  return task_info(target_task, 0xFu, task_info_out, &task_info_outCnt);
}

Swift::UInt32 __swiftcall MachIdentityToken.borrowToken()()
{
  return *(_DWORD *)(v0 + 16);
}

Swift::UInt32 __swiftcall MachIdentityToken.copyToken()()
{
  Swift::UInt32 v1 = *(_DWORD *)(v0 + 16);
  if (!mach_port_mod_refs(*MEMORY[0x263EF8960], v1, 0, 1)) {
    return v1;
  }
  sub_25A845DF0();
  swift_bridgeObjectRelease();
  sub_25A845DB8();
  sub_25A855C90();
  sub_25A845E30();
  swift_bridgeObjectRelease();
  sub_25A845E48();
  Swift::UInt32 result = sub_25A845DD0();
  __break(1u);
  return result;
}

uint64_t MachIdentityTokenError.kr.getter()
{
  return *v0;
}

uint64_t type metadata accessor for MachIdentityToken()
{
  return self;
}

uint64_t method lookup function for MachIdentityToken(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MachIdentityToken);
}

uint64_t dispatch thunk of MachIdentityToken.__allocating_init(copyingToken:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of MachIdentityToken.__allocating_init(consumingToken:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of MachIdentityToken.__allocating_init(xpcObject:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

ValueMetadata *type metadata accessor for MachIdentityTokenError()
{
  return &type metadata for MachIdentityTokenError;
}

uint64_t sub_25A845DD0()
{
  return sub_25A855C10();
}

uint64_t sub_25A845DF0()
{
  return sub_25A855B10();
}

uint64_t sub_25A845E14()
{
  return swift_allocObject();
}

uint64_t sub_25A845E30()
{
  return sub_25A8558F0();
}

uint64_t static Task<>.pds_xpcCallback<A>(priority:callback:body:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = sub_25A839A24(&qword_26B32C3F0);
  MEMORY[0x270FA5388](v12 - 8, v13);
  int64_t v15 = (char *)v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25A84604C(a1, (uint64_t)v15);
  unint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  void v16[3] = 0;
  void v16[4] = a6;
  v16[5] = a4;
  v16[6] = a5;
  v16[7] = a2;
  v16[8] = a3;
  uint64_t v17 = sub_25A855990();
  LODWORD(a4) = sub_25A83CAF0((uint64_t)v15, 1, v17);
  swift_retain();
  swift_retain();
  if (a4 == 1)
  {
    sub_25A84676C((uint64_t)v15);
    uint64_t v18 = 0;
    uint64_t v19 = 0;
  }
  else
  {
    sub_25A855980();
    (*(void (**)(char *, uint64_t))(*(void *)(v17 - 8) + 8))(v15, v17);
    if (v16[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v18 = sub_25A855930();
      uint64_t v19 = v20;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v18 = 0;
      uint64_t v19 = 0;
    }
  }
  if (v19 | v18)
  {
    v22[0] = 0;
    v22[1] = 0;
    v22[2] = v18;
    _OWORD v22[3] = v19;
  }
  return swift_task_create();
}

uint64_t sub_25A84604C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A839A24(&qword_26B32C3F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25A8460B4(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[7] = a7;
  unsigned char v8[8] = a8;
  v8[6] = a6;
  uint64_t v11 = sub_25A855A90();
  v8[9] = v11;
  v8[10] = *(void *)(v11 - 8);
  v8[11] = swift_task_alloc();
  v8[12] = *(void *)(a8 - 8);
  uint64_t v12 = swift_task_alloc();
  v8[13] = v12;
  int64_t v15 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  uint64_t v13 = (void *)swift_task_alloc();
  v8[14] = v13;
  *uint64_t v13 = v8;
  v13[1] = sub_25A846254;
  return v15(v12);
}

uint64_t sub_25A846254()
{
  sub_25A83CC48();
  *(void *)(v1 + 120) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_25A846450;
  }
  else {
    uint64_t v2 = sub_25A846344;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25A846344()
{
  uint64_t v2 = v0[12];
  uint64_t v1 = v0[13];
  uint64_t v4 = v0[10];
  uint64_t v3 = v0[11];
  uint64_t v6 = v0[8];
  uint64_t v5 = v0[9];
  uint64_t v7 = (void (*)(uint64_t, void))v0[6];
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v3, v1, v6);
  sub_25A83B6E8(v3, 0, 1, v6);
  v7(v3, 0);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v6);
  swift_task_dealloc();
  swift_task_dealloc();
  int v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_25A846450()
{
  uint64_t v1 = (void *)v0[15];
  uint64_t v3 = v0[10];
  uint64_t v2 = v0[11];
  uint64_t v4 = v0[9];
  uint64_t v5 = (void (*)(uint64_t, void *))v0[6];
  sub_25A83B6E8(v2, 1, 1, v0[8]);
  swift_getErrorValue();
  char v6 = sub_25A83DD7C();
  Error.pds_launderToSimpleNSError(discardUserInfo:)(v7, v6 & 1);
  uint64_t v9 = v8;
  v5(v2, v8);

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_25A846578()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_25A8465C0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (int *)v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_25A84669C;
  return sub_25A8460B4(a1, v4, v5, v7, v8, v9, v10, v6);
}

uint64_t sub_25A84669C()
{
  sub_25A83CC48();
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_25A84676C(uint64_t a1)
{
  uint64_t v2 = sub_25A839A24(&qword_26B32C3F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25A8467CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    sub_25A840E64((_OWORD *)a1, v6);
    sub_25A847910(v6, a2, a3);
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_25A83CB18(a1, qword_26B32C348);
    sub_25A847758(a2, a3, v6);
    swift_bridgeObjectRelease();
    return sub_25A83CB18((uint64_t)v6, qword_26B32C348);
  }
}

void sub_25A846860(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_25A839A24((uint64_t *)&unk_26B32BC90);
  MEMORY[0x270FA5388](v4 - 8, v5);
  uint64_t v7 = (char *)&v75 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25A855700();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v8, v10);
  uint64_t v13 = (char *)&v75 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v11, v14);
  uint64_t v17 = (char *)&v75 - v16;
  MEMORY[0x270FA5388](v15, v18);
  uint64_t v20 = (char *)&v75 - v19;
  uint64_t v21 = MEMORY[0x261147640](v2);
  if (sub_25A855740() == v21)
  {
    id v30 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
    unint64_t v31 = sub_25A8486DC();
LABEL_19:
    *(void *)(a1 + 24) = v31;
    *(void *)a1 = v30;
    return;
  }
  if (sub_25A855770() == v21)
  {
    uint64_t value = xpc_int64_get_value(v2);
    uint64_t v33 = MEMORY[0x263F8E5C0];
LABEL_22:
    *(void *)(a1 + 24) = v33;
    *(void *)a1 = value;
    return;
  }
  if (sub_25A8557A0() == v21)
  {
    uint64_t value = xpc_uint64_get_value(v2);
    uint64_t v33 = MEMORY[0x263F8E970];
    goto LABEL_22;
  }
  if (sub_25A855710() == v21)
  {
    BOOL v34 = xpc_BOOL_get_value(v2);
    *(void *)(a1 + 24) = MEMORY[0x263F8D4F8];
    *(unsigned char *)a1 = v34;
    return;
  }
  if (sub_25A855780() == v21)
  {
    double v35 = xpc_double_get_value(v2);
    *(void *)(a1 + 24) = MEMORY[0x263F8D538];
    *(double *)a1 = v35;
    return;
  }
  if (sub_25A855790() == v21)
  {
    if (!xpc_string_get_string_ptr(v2))
    {
      if (qword_26B32C188 != -1) {
        swift_once();
      }
      uint64_t v42 = sub_25A839A24(&qword_26B32C340);
      uint64_t v43 = sub_25A8474A0(v42, (uint64_t)qword_26B32C168);
      sub_25A8487D8();
      if (!sub_25A84882C(v43))
      {
        sub_25A8487C8();
        v44();
        swift_unknownObjectRetain_n();
        uint64_t v45 = sub_25A8556F0();
        os_log_type_t v46 = sub_25A8559C0();
        int v47 = v46;
        if (os_log_type_enabled(v45, v46))
        {
          LODWORD(v79) = v47;
          uint64_t v48 = (_DWORD *)swift_slowAlloc();
          uint64_t v78 = swift_slowAlloc();
          v81[0] = v78;
          *uint64_t v48 = 136315138;
          int v76 = v48 + 1;
          uint64_t v77 = v48;
          id v49 = objc_msgSend(v2, sel_description);
          uint64_t v50 = sub_25A8558B0();
          unint64_t v52 = v51;

          uint64_t v53 = sub_25A8415AC(v50, v52, v81);
          sub_25A848780(v53);
          sub_25A8487F4();
          swift_bridgeObjectRelease();
          sub_25A84880C(&dword_25A837000, v45, v54, "Failed to get string pointer of XPC object: %s");
          swift_arrayDestroy();
          sub_25A8487B0();
          sub_25A8487B0();
        }
        else
        {

          sub_25A8487F4();
        }
        (*(void (**)(char *, uint64_t))(v9 + 8))(v20, v8);
      }
      goto LABEL_51;
    }
    uint64_t v36 = sub_25A855900();
    uint64_t v38 = MEMORY[0x263F8D310];
    goto LABEL_27;
  }
  if (sub_25A855750() == v21)
  {
    id v39 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08C38]), sel_initWithUUIDBytes_, xpc_uuid_get_bytes(v2));
    id v40 = objc_msgSend(v39, sel_UUIDString);
    sub_25A8558B0();

    sub_25A8556D0();
    swift_bridgeObjectRelease();
    uint64_t v41 = sub_25A8556E0();
    if (sub_25A84882C((uint64_t)v7) != 1)
    {
      *(void *)(a1 + 24) = v41;
      uint64_t v55 = sub_25A84382C((uint64_t *)a1);
      (*(void (**)(uint64_t *, char *, uint64_t))(*(void *)(v41 - 8) + 32))(v55, v7, v41);

      return;
    }

    sub_25A83CB18((uint64_t)v7, (uint64_t *)&unk_26B32BC90);
    goto LABEL_51;
  }
  if (sub_25A855730() == v21)
  {
    xpc_date_get_value_absolute();
    *(void *)(a1 + 24) = sub_25A8556C0();
    sub_25A84382C((uint64_t *)a1);
    sub_25A8556B0();
    return;
  }
  if (sub_25A855720() == v21)
  {
    bytes_ptr = xpc_data_get_bytes_ptr(v2);
    if (!bytes_ptr)
    {
      if (qword_26B32C188 != -1) {
        swift_once();
      }
      uint64_t v62 = sub_25A839A24(&qword_26B32C340);
      uint64_t v63 = sub_25A8474A0(v62, (uint64_t)qword_26B32C168);
      sub_25A8487D8();
      if (!sub_25A84882C(v63))
      {
        sub_25A8487C8();
        v64();
        swift_unknownObjectRetain_n();
        uint64_t v65 = sub_25A8556F0();
        os_log_type_t v66 = sub_25A8559C0();
        int v67 = v66;
        if (os_log_type_enabled(v65, v66))
        {
          LODWORD(v79) = v67;
          v68 = (_DWORD *)swift_slowAlloc();
          uint64_t v78 = swift_slowAlloc();
          v81[0] = v78;
          _DWORD *v68 = 136315138;
          int v76 = v68 + 1;
          uint64_t v77 = v68;
          id v69 = objc_msgSend(v2, sel_description);
          uint64_t v70 = sub_25A8558B0();
          unint64_t v72 = v71;

          uint64_t v73 = sub_25A8415AC(v70, v72, v81);
          sub_25A848780(v73);
          sub_25A8487F4();
          swift_bridgeObjectRelease();
          sub_25A84880C(&dword_25A837000, v65, v74, "Failed to get data pointer of XPC object: %s");
          swift_arrayDestroy();
          sub_25A8487B0();
          sub_25A8487B0();
        }
        else
        {

          sub_25A8487F4();
        }
        (*(void (**)(char *, uint64_t))(v9 + 8))(v17, v8);
      }
      goto LABEL_51;
    }
    uint64_t v57 = bytes_ptr;
    size_t length = xpc_data_get_length(v2);
    uint64_t v36 = MEMORY[0x261146640](v57, length);
    uint64_t v38 = MEMORY[0x263F06F78];
LABEL_27:
    *(void *)(a1 + 24) = v38;
    *(void *)a1 = v36;
    *(void *)(a1 + 8) = v37;
    return;
  }
  if (sub_25A855760() == v21)
  {
    size_t v59 = sub_25A847CAC(v2);
    if (v59)
    {
      id v30 = (id)v59;
      uint64_t v60 = (uint64_t *)&unk_26A468F58;
LABEL_43:
      unint64_t v31 = sub_25A839A24(v60);
      goto LABEL_19;
    }
  }
  else
  {
    if (sub_25A8557C0() != v21)
    {
      if (qword_26B32C188 != -1) {
        swift_once();
      }
      uint64_t v22 = sub_25A839A24(&qword_26B32C340);
      uint64_t v23 = sub_25A8474A0(v22, (uint64_t)qword_26B32C168);
      sub_25A8487D8();
      if (!sub_25A84882C(v23))
      {
        sub_25A8487C8();
        v24();
        unint64_t v25 = sub_25A8556F0();
        os_log_type_t v26 = sub_25A8559C0();
        if (os_log_type_enabled(v25, v26))
        {
          long long v27 = (uint8_t *)swift_slowAlloc();
          v81[0] = swift_slowAlloc();
          *(_DWORD *)long long v27 = 136315138;
          uint64_t v79 = v27 + 4;
          uint64_t v28 = MEMORY[0x261146B00](v21);
          uint64_t v80 = sub_25A8415AC(v28, v29, v81);
          sub_25A855AA0();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_25A837000, v25, v26, "Unsupported XPC object type %s", v27, 0xCu);
          swift_arrayDestroy();
          sub_25A8487B0();
          sub_25A8487B0();
        }

        (*(void (**)(char *, uint64_t))(v9 + 8))(v13, v8);
      }
      goto LABEL_51;
    }
    uint64_t v61 = sub_25A8482D0(v2);
    if (v61)
    {
      id v30 = (id)v61;
      uint64_t v60 = (uint64_t *)&unk_26B32BCA0;
      goto LABEL_43;
    }
  }
LABEL_51:
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
}

BOOL sub_25A847130()
{
  uint64_t v0 = sub_25A855700();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0, v2);
  uint64_t v4 = (char *)v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_25A855900();
  unint64_t v7 = v6;
  uint64_t ObjectType = swift_getObjectType();
  sub_25A846860(v20, ObjectType);
  uint64_t v9 = v21;
  if (v21)
  {
    sub_25A840E64(v20, v22);
    sub_25A840E08((uint64_t)v22, (uint64_t)v20);
    sub_25A8467CC((uint64_t)v20, v5, v7);
    sub_25A83B7E8((uint64_t)v22);
  }
  else
  {
    sub_25A83CB18((uint64_t)v20, qword_26B32C348);
    if (qword_26B32C188 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_25A839A24(&qword_26B32C340);
    uint64_t v11 = sub_25A8474A0(v10, (uint64_t)qword_26B32C168);
    swift_beginAccess();
    if (sub_25A83CAF0(v11, 1, v0))
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v4, v11, v0);
      swift_bridgeObjectRetain();
      uint64_t v12 = sub_25A8556F0();
      os_log_type_t v13 = sub_25A8559C0();
      if (os_log_type_enabled(v12, v13))
      {
        uint64_t v14 = (uint8_t *)swift_slowAlloc();
        uint64_t v18 = swift_slowAlloc();
        v20[0] = v18;
        *(_DWORD *)uint64_t v14 = 136315138;
        v17[1] = v14 + 4;
        swift_bridgeObjectRetain();
        uint64_t v19 = sub_25A8415AC(v5, v7, v20);
        sub_25A855AA0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_25A837000, v12, v13, "Failed to get value in XPC dictionary for key: %s", v14, 0xCu);
        uint64_t v15 = v18;
        swift_arrayDestroy();
        MEMORY[0x261147430](v15, -1, -1);
        MEMORY[0x261147430](v14, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
    }
  }
  return v9 != 0;
}

uint64_t sub_25A847448(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  char v6 = v5(a2, a3);
  swift_unknownObjectRelease();
  return v6 & 1;
}

uint64_t sub_25A8474A0(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

char *sub_25A8474D8(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_25A839A24(&qword_26A468F70);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 32);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  if (v5)
  {
    sub_25A8476C4((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_25A8475C8(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

uint64_t sub_25A8475C8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 32 * a1 + 32;
    unint64_t v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_25A855C40();
  __break(1u);
  return result;
}

char *sub_25A8476C4(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_25A855C40();
    __break(1u);
  }
  else if (__dst != __src || &__src[32 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 32 * a2);
  }
  return __src;
}

double sub_25A847758@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_25A843B3C(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    sub_25A839A24(&qword_26B32BCA8);
    sub_25A855BD0();
    swift_bridgeObjectRelease();
    sub_25A840E64((_OWORD *)(*(void *)(v11 + 56) + 32 * v8), a3);
    sub_25A855BF0();
    *uint64_t v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_25A847890(uint64_t a1, void *a2)
{
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v6 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  sub_25A8479A0(a1, a2);
  *uint64_t v2 = v6;

  return swift_bridgeObjectRelease();
}

uint64_t sub_25A847910(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  sub_25A847AA8(a1, a2, a3);
  *uint64_t v3 = v8;

  return swift_bridgeObjectRelease();
}

unint64_t sub_25A8479A0(uint64_t a1, void *a2)
{
  uint64_t v3 = (void **)v2;
  uint64_t v6 = (void *)*v2;
  unint64_t v7 = sub_25A843AC0(a2);
  if (__OFADD__(v6[2], (v8 & 1) == 0))
  {
    __break(1u);
    goto LABEL_10;
  }
  unint64_t v9 = v7;
  char v10 = v8;
  sub_25A839A24(&qword_26B32BE78);
  if ((sub_25A855BD0() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v11 = sub_25A843AC0(a2);
  if ((v10 & 1) != (v12 & 1))
  {
LABEL_10:
    unint64_t result = sub_25A855D10();
    __break(1u);
    return result;
  }
  unint64_t v9 = v11;
LABEL_5:
  os_log_type_t v13 = *v3;
  if (v10)
  {
    uint64_t v14 = v13[7];
    unint64_t result = swift_release();
    *(void *)(v14 + 8 * v9) = a1;
  }
  else
  {
    sub_25A8445B4((uint64_t)a2, (uint64_t)v16);
    return sub_25A847BE8(v9, v16, a1, v13);
  }
  return result;
}

_OWORD *sub_25A847AA8(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (void **)v3;
  char v8 = (void *)*v3;
  unint64_t v9 = sub_25A843B3C(a2, a3);
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_13;
  }
  unint64_t v11 = v9;
  char v12 = v10;
  sub_25A839A24(&qword_26B32BCA8);
  if ((sub_25A855BD0() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v13 = sub_25A843B3C(a2, a3);
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_13:
    unint64_t result = (_OWORD *)sub_25A855D10();
    __break(1u);
    return result;
  }
  unint64_t v11 = v13;
LABEL_5:
  uint64_t v15 = *v4;
  if (v12)
  {
    uint64_t v16 = (_OWORD *)(v15[7] + 32 * v11);
    sub_25A83B7E8((uint64_t)v16);
    return sub_25A840E64(a1, v16);
  }
  else
  {
    sub_25A847C40(v11, a2, a3, a1, v15);
    return (_OWORD *)swift_bridgeObjectRetain();
  }
}

unint64_t sub_25A847BE8(unint64_t result, _OWORD *a2, uint64_t a3, void *a4)
{
  a4[(result >> 6) + 8] |= 1 << result;
  uint64_t v4 = (_OWORD *)(a4[6] + 48 * result);
  long long v5 = a2[1];
  *uint64_t v4 = *a2;
  v4[1] = v5;
  v4[2] = a2[2];
  *(void *)(a4[7] + 8 * result) = a3;
  uint64_t v6 = a4[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a4[2] = v8;
  }
  return result;
}

_OWORD *sub_25A847C40(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  *uint64_t v6 = a2;
  v6[1] = a3;
  unint64_t result = sub_25A840E64(a4, (_OWORD *)(a5[7] + 32 * a1));
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

size_t sub_25A847CAC(void *a1)
{
  uint64_t v2 = sub_25A855700();
  uint64_t v3 = *(uint64_t **)(v2 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v2, v4);
  BOOL v7 = (char *)v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5, v8);
  uint64_t v10 = (char *)v46 - v9;
  uint64_t v11 = MEMORY[0x261147640](a1);
  if (v11 != sub_25A855760())
  {
    if (qword_26B32C188 == -1) {
      goto LABEL_3;
    }
    goto LABEL_34;
  }
  size_t result = xpc_array_get_count(a1);
  if ((result & 0x8000000000000000) == 0)
  {
    size_t v26 = result;
    if (!result) {
      return MEMORY[0x263F8EE78];
    }
    size_t v27 = 0;
    id v49 = (void (**)(char *, uint64_t, uint64_t))(v3 + 2);
    char v14 = (char *)MEMORY[0x263F8EE78];
    uint64_t v28 = (void (**)(char *, uint64_t))(v3 + 1);
    uint64_t v3 = qword_26B32C348;
    *(void *)&long long v25 = 134217984;
    long long v47 = v25;
    uint64_t v48 = a1;
    while (v26 != v27)
    {
      id v29 = xpc_array_get_value(a1, v27);
      uint64_t ObjectType = swift_getObjectType();
      sub_25A846860(&v51, ObjectType);
      swift_unknownObjectRelease();
      if (v52)
      {
        sub_25A840E64(&v51, &v53);
        sub_25A840E08((uint64_t)&v53, (uint64_t)&v51);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          char v14 = sub_25A8474D8(0, *((void *)v14 + 2) + 1, 1, (uint64_t)v14);
        }
        unint64_t v32 = *((void *)v14 + 2);
        unint64_t v31 = *((void *)v14 + 3);
        BOOL v7 = (char *)(v32 + 1);
        if (v32 >= v31 >> 1) {
          char v14 = sub_25A8474D8((char *)(v31 > 1), v32 + 1, 1, (uint64_t)v14);
        }
        *((void *)v14 + 2) = v7;
        sub_25A840E64(&v51, &v14[32 * v32 + 32]);
        sub_25A83B7E8((uint64_t)&v53);
      }
      else
      {
        sub_25A83CB18((uint64_t)&v51, v3);
        if (qword_26B32C188 != -1) {
          swift_once();
        }
        uint64_t v33 = sub_25A839A24(&qword_26B32C340);
        uint64_t v34 = sub_25A8474A0(v33, (uint64_t)qword_26B32C168);
        swift_beginAccess();
        if (!sub_25A83CAF0(v34, 1, v2))
        {
          (*v49)(v10, v34, v2);
          double v35 = sub_25A8556F0();
          os_log_type_t v36 = sub_25A8559C0();
          if (os_log_type_enabled(v35, v36))
          {
            uint64_t v37 = v10;
            uint64_t v38 = v2;
            id v39 = v28;
            id v40 = v3;
            uint64_t v41 = swift_slowAlloc();
            *(_DWORD *)uint64_t v41 = v47;
            *(void *)(v41 + 4) = v27;
            _os_log_impl(&dword_25A837000, v35, v36, "Failed to get value in XPC array at index: %ld", (uint8_t *)v41, 0xCu);
            uint64_t v42 = v41;
            uint64_t v3 = v40;
            uint64_t v28 = v39;
            uint64_t v2 = v38;
            uint64_t v10 = v37;
            a1 = v48;
            MEMORY[0x261147430](v42, -1, -1);
          }

          (*v28)(v10, v2);
        }
        id v43 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
        unint64_t v54 = sub_25A8486DC();
        *(void *)&long long v53 = v43;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          char v14 = sub_25A8474D8(0, *((void *)v14 + 2) + 1, 1, (uint64_t)v14);
        }
        unint64_t v45 = *((void *)v14 + 2);
        unint64_t v44 = *((void *)v14 + 3);
        BOOL v7 = (char *)(v45 + 1);
        if (v45 >= v44 >> 1) {
          char v14 = sub_25A8474D8((char *)(v44 > 1), v45 + 1, 1, (uint64_t)v14);
        }
        *((void *)v14 + 2) = v7;
        sub_25A840E64(&v53, &v14[32 * v45 + 32]);
      }
      if (v26 == ++v27) {
        return (size_t)v14;
      }
    }
    __break(1u);
LABEL_34:
    swift_once();
LABEL_3:
    uint64_t v12 = sub_25A839A24(&qword_26B32C340);
    uint64_t v13 = sub_25A8474A0(v12, (uint64_t)qword_26B32C168);
    swift_beginAccess();
    char v14 = 0;
    if (!sub_25A83CAF0(v13, 1, v2))
    {
      ((void (*)(char *, uint64_t, uint64_t))v3[2])(v7, v13, v2);
      swift_unknownObjectRetain_n();
      uint64_t v15 = sub_25A8556F0();
      os_log_type_t v16 = sub_25A8559C0();
      if (os_log_type_enabled(v15, v16))
      {
        uint64_t v17 = (_DWORD *)swift_slowAlloc();
        id v49 = (void (**)(char *, uint64_t, uint64_t))swift_slowAlloc();
        *(void *)&long long v51 = v49;
        *uint64_t v17 = 136315138;
        v46[1] = v17 + 1;
        *(void *)&long long v47 = v17;
        id v18 = objc_msgSend(a1, sel_description);
        uint64_t v19 = sub_25A8558B0();
        unint64_t v21 = v20;

        uint64_t v50 = sub_25A8415AC(v19, v21, (uint64_t *)&v51);
        sub_25A855AA0();
        swift_unknownObjectRelease_n();
        swift_bridgeObjectRelease();
        uint64_t v22 = v47;
        _os_log_impl(&dword_25A837000, v15, v16, "XPC object %s is not of type array", (uint8_t *)v47, 0xCu);
        uint64_t v23 = v49;
        swift_arrayDestroy();
        MEMORY[0x261147430](v23, -1, -1);
        MEMORY[0x261147430](v22, -1, -1);
      }
      else
      {

        swift_unknownObjectRelease_n();
      }
      ((void (*)(char *, uint64_t))v3[1])(v7, v2);
      return 0;
    }
    return (size_t)v14;
  }
  __break(1u);
  return result;
}

uint64_t sub_25A8482D0(void *a1)
{
  uint64_t v2 = sub_25A855700();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  uint64_t v6 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x261147640](a1);
  if (v7 != sub_25A8557C0())
  {
    if (qword_26B32C188 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_25A839A24(&qword_26B32C340);
    uint64_t v9 = sub_25A8474A0(v8, (uint64_t)qword_26B32C168);
    swift_beginAccess();
    uint64_t v10 = 0;
    if (!sub_25A83CAF0(v9, 1, v2))
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v9, v2);
      swift_unknownObjectRetain_n();
      uint64_t v11 = sub_25A8556F0();
      os_log_type_t v12 = sub_25A8559C0();
      if (os_log_type_enabled(v11, v12))
      {
        uint64_t v13 = (uint8_t *)swift_slowAlloc();
        uint64_t v27 = swift_slowAlloc();
        uint64_t v29 = v27;
        size_t v26 = v13;
        *(_DWORD *)uint64_t v13 = 136315138;
        v25[1] = v13 + 4;
        id v14 = objc_msgSend(a1, sel_description);
        uint64_t v15 = sub_25A8558B0();
        unint64_t v17 = v16;

        void aBlock[6] = sub_25A8415AC(v15, v17, &v29);
        sub_25A855AA0();
        swift_unknownObjectRelease_n();
        swift_bridgeObjectRelease();
        id v18 = v26;
        _os_log_impl(&dword_25A837000, v11, v12, "XPC object %s is not of type dictionary", v26, 0xCu);
        uint64_t v19 = v27;
        swift_arrayDestroy();
        MEMORY[0x261147430](v19, -1, -1);
        MEMORY[0x261147430](v18, -1, -1);
      }
      else
      {

        swift_unknownObjectRelease_n();
      }
      (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
      return 0;
    }
    return v10;
  }
  uint64_t v29 = MEMORY[0x263F8EE80];
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = &v29;
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = sub_25A848728;
  *(void *)(v21 + 24) = v20;
  aBlock[4] = sub_25A84873C;
  aBlock[5] = v21;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_25A847448;
  aBlock[3] = &unk_270860510;
  uint64_t v22 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  xpc_dictionary_apply(a1, v22);
  _Block_release(v22);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) == 0)
  {
    uint64_t v10 = v29;
    swift_release();
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_25A8486DC()
{
  unint64_t result = qword_26A468F60;
  if (!qword_26A468F60)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A468F60);
  }
  return result;
}

uint64_t sub_25A84871C()
{
  return sub_25A8487A8(v0, 24);
}

BOOL sub_25A848728()
{
  return sub_25A847130();
}

uint64_t sub_25A848730()
{
  return sub_25A8487A8(v0, 32);
}

uint64_t sub_25A84873C()
{
  return (*(uint64_t (**)(void))(v0 + 16))() & 1;
}

uint64_t sub_25A848768(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_25A848778()
{
  return swift_release();
}

uint64_t sub_25A848780(uint64_t a1)
{
  *(void *)(v1 - 136) = a1;
  return sub_25A855AA0();
}

uint64_t sub_25A8487A8(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA0238](a1, a2, 7);
}

void sub_25A8487B0()
{
  JUMPOUT(0x261147430);
}

uint64_t sub_25A8487D8()
{
  return swift_beginAccess();
}

uint64_t sub_25A8487F4()
{
  return swift_unknownObjectRelease_n();
}

void sub_25A84880C(void *a1, NSObject *a2, uint64_t a3, const char *a4)
{
  int v6 = *(_DWORD *)(v4 - 144);
  uint64_t v7 = *(uint8_t **)(v4 - 160);
  _os_log_impl(a1, a2, (os_log_type_t)v6, a4, v7, 0xCu);
}

uint64_t sub_25A84882C(uint64_t a1)
{
  return sub_25A83CAF0(a1, 1, v1);
}

uint64_t sub_25A848844(uint64_t a1, uint64_t a2)
{
  type metadata accessor for os_unfair_lock_s(255);
  sub_25A855B50();
  uint64_t v4 = sub_25A855B40();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 8))(a1, a2);
  return v4;
}

uint64_t sub_25A8488F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1, a2);
  int v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, a2);
  uint64_t v7 = sub_25A848844((uint64_t)v6, a2);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, a2);
  return v7;
}

id static XPCService.xpcInterface()()
{
  sub_25A8504A4();
  uint64_t v3 = (void *)(*(uint64_t (**)(void))(v2 + 16))();
  id v4 = objc_msgSend(self, sel_interfaceWithProtocol_, v3);

  uint64_t v11 = v1;
  uint64_t v12 = (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 40))(v1, v0);
  uint64_t v5 = *(void *)(v12 + 16);
  if (v5)
  {
    uint64_t v6 = v12 + 48;
    do
    {
      uint64_t v7 = *(void *)(v6 - 16);
      uint64_t v8 = *(void *)(v6 - 8);
      v6 += 24;
      swift_bridgeObjectRetain();
      uint64_t v9 = (void *)sub_25A8559B0();
      swift_bridgeObjectRelease();
      objc_msgSend(v4, sel_setClasses_forSelector_argumentIndex_ofReply_, v9, v7, v8, 1);

      --v5;
    }
    while (v5);
  }
  swift_bridgeObjectRelease();
  (*(void (**)(id, uint64_t))(v0 + 56))(v4, v11);
  return v4;
}

uint64_t XPCServiceClientConnection.__allocating_init(delegate:)()
{
  sub_25A8504A4();
  uint64_t v0 = swift_allocObject();
  XPCServiceClientConnection.init(delegate:)();
  return v0;
}

void *XPCServiceClientConnection.init(delegate:)()
{
  sub_25A8504A4();
  v1[5] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v4 = 0;
  uint64_t v2 = type metadata accessor for XPCServiceClientConnection.State();
  v1[2] = sub_25A8488F4((uint64_t)&v4, v2);
  v1[5] = v0;
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRelease();
  v1[3] = 0;
  return v1;
}

uint64_t type metadata accessor for XPCServiceClientConnection.State()
{
  return sub_25A839718();
}

uint64_t XPCServiceClientConnection.__allocating_init(remoteService:delegate:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  XPCServiceClientConnection.init(remoteService:delegate:)(a1, a2, a3);
  return v6;
}

void *XPCServiceClientConnection.init(remoteService:delegate:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[5] = 0;
  swift_unknownObjectWeakInit();
  sub_25A850540();
  sub_25A850540();
  uint64_t v8 = 0;
  uint64_t v6 = type metadata accessor for XPCServiceClientConnection.State();
  v3[2] = sub_25A8488F4((uint64_t)&v8, v6);
  v3[5] = a3;
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRelease();
  v3[3] = a1;
  return v3;
}

uint64_t XPCServiceClientConnection.deinit()
{
  uint64_t v1 = *(void *)(v0 + 16);
  sub_25A85041C();
  v7[2] = *(void *)(v2 + 80);
  sub_25A85041C();
  v7[3] = *(void *)(v3 + 88);
  uint64_t v4 = type metadata accessor for XPCServiceClientConnection.State();
  uint64_t v5 = sub_25A839A24(&qword_26B32C3E8);
  sub_25A83A4CC((void (*)(uint64_t))sub_25A848E20, (uint64_t)v7, v1, v4, v5);
  swift_release();

  sub_25A83CBE4(v0 + 32);
  return v0;
}

id *sub_25A848E20@<X0>(id *result@<X0>, BOOL *a2@<X8>)
{
  id v3 = *result;
  if (*result) {
    unint64_t result = (id *)objc_msgSend(*result, sel_invalidate);
  }
  *a2 = v3 == 0;
  return result;
}

uint64_t XPCServiceClientConnection.__deallocating_deinit()
{
  XPCServiceClientConnection.deinit();
  uint64_t v0 = sub_25A850440();

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_25A848EA0(id *a1)
{
  id v3 = v1;
  uint64_t v5 = *v1;
  uint64_t v6 = sub_25A855700();
  uint64_t v61 = *(void *)(v6 - 8);
  uint64_t v62 = v6;
  uint64_t v8 = MEMORY[0x270FA5388](v6, v7);
  uint64_t v10 = (char *)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8, v11);
  uint64_t v13 = (char *)&v52 - v12;
  if (MEMORY[0x261147510](v1 + 4))
  {
    uint64_t v14 = v1[5];
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v14 + 32))(ObjectType, v14);
    if (v2 || *a1) {
      return swift_unknownObjectRelease();
    }
    uint64_t v16 = *(void *)(v5 + 80);
    uint64_t v17 = *(void *)(v5 + 88);
    uint64_t v56 = *(void (**)(uint64_t, uint64_t))(v17 + 48);
    uint64_t v57 = v17 + 48;
    v56(v16, v17);
    id v18 = sub_25A8556F0();
    os_log_type_t v19 = sub_25A8559E0();
    LODWORD(v58) = v19;
    BOOL v20 = os_log_type_enabled(v18, v19);
    uint64_t v59 = v17;
    uint64_t v60 = v16;
    if (v20)
    {
      os_log_t v55 = v18;
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      uint64_t v54 = v22;
      *(_DWORD *)uint64_t v21 = 136315138;
      uint64_t aBlock = v22;
      uint64_t v52 = v21 + 4;
      long long v53 = v21;
      uint64_t v23 = (*(uint64_t (**)(uint64_t))(v17 + 24))(v16);
      uint64_t v69 = sub_25A8415AC(v23, v24, &aBlock);
      sub_25A855AA0();
      swift_bridgeObjectRelease();
      id v18 = v55;
      long long v25 = v53;
      _os_log_impl(&dword_25A837000, v55, (os_log_type_t)v58, "%s: establishing connection.", v53, 0xCu);
      uint64_t v26 = v54;
      swift_arrayDestroy();
      MEMORY[0x261147430](v26, -1, -1);
      MEMORY[0x261147430](v25, -1, -1);
    }

    uint64_t v58 = *(void (**)(char *, uint64_t))(v61 + 8);
    v58(v13, v62);
    uint64_t v27 = (void *)v3[3];
    if (v27)
    {
      id v28 = objc_allocWithZone(MEMORY[0x263F08D68]);
      id v29 = v27;
      id v30 = objc_msgSend(v28, sel_init);
      os_log_t v55 = *(os_log_t *)(v59 + 24);
      ((void (*)(void))v55)();
      unint64_t v31 = (void *)sub_25A8558A0();
      swift_bridgeObjectRelease();
      id v32 = objc_msgSend(v30, sel__initWithRemoteService_name_options_, v29, v31, 0);
    }
    else
    {
      sub_25A849F10();
      os_log_t v55 = *(os_log_t *)(v59 + 24);
      uint64_t v33 = ((uint64_t (*)(void))v55)();
      id v32 = sub_25A8495F4(v33, v34, 0);
    }

    *a1 = v32;
    if (v32)
    {
      id v35 = v32;
      uint64_t v36 = v59;
      uint64_t v37 = v60;
      id v38 = static XPCService.xpcInterface()();
      objc_msgSend(v35, sel_setRemoteObjectInterface_, v38);

      uint64_t v39 = swift_allocObject();
      swift_weakInit();
      id v40 = (void *)swift_allocObject();
      _OWORD v40[2] = v37;
      v40[3] = v36;
      v40[4] = v39;
      int v67 = sub_25A84FFF4;
      v68 = v40;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v64 = 1107296256;
      uint64_t v65 = sub_25A8533A4;
      os_log_type_t v66 = &unk_270860790;
      uint64_t v41 = _Block_copy(&aBlock);
      swift_release();
      objc_msgSend(v35, sel_setInterruptionHandler_, v41);
      _Block_release(v41);
      uint64_t v42 = swift_allocObject();
      swift_weakInit();
      id v43 = (void *)swift_allocObject();
      void v43[2] = v37;
      v43[3] = v36;
      v43[4] = v42;
      int v67 = sub_25A850060;
      v68 = v43;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v64 = 1107296256;
      uint64_t v65 = sub_25A8533A4;
      os_log_type_t v66 = &unk_2708605D8;
      unint64_t v44 = _Block_copy(&aBlock);
      swift_release();
      objc_msgSend(v35, sel_setInvalidationHandler_, v44);
      _Block_release(v44);
      objc_msgSend(v35, sel_activate);

      return swift_unknownObjectRelease();
    }
    v56(v60, v59);
    os_log_type_t v46 = sub_25A8556F0();
    os_log_type_t v47 = sub_25A8559C0();
    if (os_log_type_enabled(v46, v47))
    {
      uint64_t v48 = (uint8_t *)swift_slowAlloc();
      uint64_t v57 = swift_slowAlloc();
      uint64_t aBlock = v57;
      *(_DWORD *)uint64_t v48 = 136315138;
      uint64_t v56 = (void (*)(uint64_t, uint64_t))(v48 + 4);
      uint64_t v49 = ((uint64_t (*)(void))v55)();
      uint64_t v69 = sub_25A8415AC(v49, v50, &aBlock);
      sub_25A855AA0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25A837000, v46, v47, "%s: did not create connection.", v48, 0xCu);
      uint64_t v51 = v57;
      swift_arrayDestroy();
      MEMORY[0x261147430](v51, -1, -1);
      MEMORY[0x261147430](v48, -1, -1);
      swift_unknownObjectRelease();
    }
    else
    {

      swift_unknownObjectRelease();
    }
    return ((uint64_t (*)(char *, uint64_t))v58)(v10, v62);
  }
  else
  {
    uint64_t result = sub_25A855C10();
    __break(1u);
  }
  return result;
}

id sub_25A8495F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v5 = (void *)sub_25A8558A0();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithMachServiceName_options_, v5, a3);

  return v6;
}

uint64_t sub_25A849670(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A855700();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8);
  uint64_t v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(uint64_t, uint64_t))(a3 + 48))(a2, a3);
  uint64_t v11 = sub_25A8556F0();
  os_log_type_t v12 = sub_25A8559C0();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v22 = v6;
    uint64_t v14 = (uint8_t *)v13;
    uint64_t v15 = swift_slowAlloc();
    uint64_t v23 = v3;
    uint64_t v16 = v15;
    uint64_t v21 = v7;
    *(_DWORD *)uint64_t v14 = 136315138;
    uint64_t v25 = v15;
    v20[1] = v14 + 4;
    uint64_t v17 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 24))(a2, a3);
    uint64_t v24 = sub_25A8415AC(v17, v18, &v25);
    sub_25A855AA0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25A837000, v11, v12, "%s: Connection to XPC Server interrupted.", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x261147430](v16, -1, -1);
    MEMORY[0x261147430](v14, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v10, v22);
  }
  else
  {

    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
}

uint64_t sub_25A8498BC(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v9 = result;
    uint64_t v10 = *(void *)(result + 16);
    MEMORY[0x270FA5388](result, v8);
    v13[2] = a2;
    v13[3] = a3;
    uint64_t v11 = type metadata accessor for XPCServiceClientConnection.State();
    swift_retain();
    sub_25A83A4CC(a4, (uint64_t)v13, v10, v11, MEMORY[0x263F8EE60] + 8);
    swift_release();
    if (MEMORY[0x261147510](v9 + 32))
    {
      swift_getObjectType();
      sub_25A8504B0();
      v12();
      swift_release();
      return swift_unknownObjectRelease();
    }
    else
    {
      return swift_release();
    }
  }
  return result;
}

void sub_25A8499E4(id *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_25A855700();
  uint64_t v24 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7, v8);
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(uint64_t, uint64_t))(a3 + 48))(a2, a3);
  uint64_t v11 = sub_25A8556F0();
  os_log_type_t v12 = sub_25A8559E0();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v22 = a1;
    uint64_t v14 = (uint8_t *)v13;
    uint64_t v15 = swift_slowAlloc();
    uint64_t v23 = v3;
    uint64_t v16 = v15;
    uint64_t v21 = v7;
    *(_DWORD *)uint64_t v14 = 136315138;
    uint64_t v26 = v15;
    BOOL v20 = v14 + 4;
    uint64_t v17 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 24))(a2, a3);
    uint64_t v25 = sub_25A8415AC(v17, v18, &v26);
    sub_25A855AA0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25A837000, v11, v12, "%s: Connection to XPC Server invalidated.", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x261147430](v16, -1, -1);
    os_log_type_t v19 = v14;
    a1 = v22;
    MEMORY[0x261147430](v19, -1, -1);

    (*(void (**)(char *, uint64_t))(v24 + 8))(v10, v21);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v24 + 8))(v10, v7);
  }

  *a1 = 0;
}

void XPCServiceClientConnection.call<A>(_:)()
{
  sub_25A8501F0();
  uint64_t v3 = v2;
  uint64_t v25 = v4;
  MEMORY[0x270FA5388](v4, v5);
  sub_25A850380();
  uint64_t v6 = *(void *)(v0 + 16);
  _OWORD v22[2] = v7;
  uint64_t v23 = v0;
  uint64_t v9 = *(void *)(v8 + 80);
  uint64_t v10 = *(void *)(v8 + 88);
  uint64_t v11 = type metadata accessor for XPCServiceClientConnection.State();
  unint64_t v12 = sub_25A849F10();
  sub_25A84FB4C((void (*)(uint64_t))sub_25A849EF4, (uint64_t)v22, v6, v11, v12);
  if (!v1)
  {
    uint64_t v13 = (void *)v24[0];
    uint64_t v14 = sub_25A850428();
    *(void *)(v14 + 16) = 0;
    uint64_t v15 = (void *)swift_allocObject();
    v15[2] = v9;
    v15[3] = v3;
    v15[4] = v10;
    v15[5] = v14;
    v24[4] = sub_25A849FB8;
    v24[5] = v15;
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 1107296256;
    _OWORD v24[2] = sub_25A849FD8;
    v24[3] = &unk_270860538;
    uint64_t v16 = _Block_copy(v24);
    swift_retain();
    swift_release();
    objc_msgSend(v13, sel_synchronousRemoteObjectProxyWithErrorHandler_, v16);
    _Block_release(v16);
    uint64_t v17 = swift_unknownObjectRetain();
    v25(v17);
    sub_25A839760();
    unint64_t v18 = *(void **)(v14 + 16);
    if (v18)
    {
      id v19 = v18;
      swift_willThrow();

      swift_unknownObjectRelease();
      sub_25A850410();
      v20();
      swift_release();
      swift_unknownObjectRelease();
    }
    else
    {

      swift_unknownObjectRelease_n();
      sub_25A850468();
      v21();
      swift_release();
    }
  }
  sub_25A850208();
}

{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(id, void (*)(uint64_t, void *), void *);
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void **v30;
  void *v31;
  void **v32;
  void *v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t);
  void *v41;
  id v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(uint64_t);
  uint64_t v49;
  void (*v50)(uint64_t);
  unsigned char *v51;
  uint64_t v52;
  uint64_t v53;
  void v54[2];
  uint64_t v55;
  uint64_t v56;
  char *v57;
  void **v58;
  uint64_t v59;
  id v60;
  id v61;
  void (*v62)(id, void (*)(uint64_t, void *), void *);
  uint64_t v63;
  uint64_t v64;
  void v65[11];
  void v66[7];

  sub_25A8501F0();
  uint64_t v2 = v0;
  id v4 = v3;
  uint64_t v61 = v6;
  uint64_t v62 = v5;
  uint64_t v8 = v7;
  uint64_t v9 = *v0;
  uint64_t v64 = sub_25A855A90();
  sub_25A83CC2C();
  uint64_t v11 = v10;
  sub_25A8503E8();
  MEMORY[0x270FA5388](v12, v13);
  uint64_t v15 = (char *)v54 - v14;
  uint64_t v16 = v2[2];
  uint64_t v63 = v4;
  v65[2] = v4;
  v65[3] = v2;
  uint64_t v17 = *(void *)(v9 + 80);
  unint64_t v18 = *(void *)(v9 + 88);
  id v19 = type metadata accessor for XPCServiceClientConnection.State();
  BOOL v20 = sub_25A849F10();
  sub_25A84FB4C((void (*)(uint64_t))sub_25A850168, (uint64_t)v65, v16, v19, v20);
  if (!v1)
  {
    uint64_t v56 = v11;
    uint64_t v57 = v15;
    v54[0] = v8;
    v54[1] = 0;
    uint64_t v21 = (void *)v66[0];
    uint64_t v22 = sub_25A850428();
    *(void *)(v22 + 16) = 0;
    uint64_t v58 = (void **)(v22 + 16);
    uint64_t v23 = (void *)swift_allocObject();
    uint64_t v24 = v63;
    v23[2] = v17;
    v23[3] = v24;
    v23[4] = v18;
    v23[5] = v22;
    v66[4] = sub_25A850130;
    v66[5] = v23;
    v66[0] = MEMORY[0x263EF8330];
    v66[1] = 1107296256;
    v66[2] = sub_25A849FD8;
    v66[3] = &unk_2708605B0;
    uint64_t v25 = _Block_copy(v66);
    uint64_t v59 = v22;
    swift_retain();
    swift_release();
    uint64_t v60 = v21;
    uint64_t v26 = objc_msgSend(v21, sel_synchronousRemoteObjectProxyWithErrorHandler_, v25);
    _Block_release(v25);
    uint64_t v27 = swift_allocBox();
    os_log_t v55 = v28;
    sub_25A83B6E8(v28, 1, 1, v24);
    id v29 = sub_25A850428();
    *(void *)(v29 + 16) = 0;
    id v30 = (void **)(v29 + 16);
    unint64_t v31 = (void *)swift_allocObject();
    v31[2] = v17;
    v31[3] = v24;
    v31[4] = v18;
    v31[5] = v27;
    v31[6] = v29;
    swift_unknownObjectRetain();
    swift_retain();
    swift_retain();
    v62(v26, sub_25A84AA50, v31);
    swift_release();
    id v32 = v58;
    sub_25A839760();
    uint64_t v33 = *v32;
    if (v33)
    {
      uint64_t v34 = v33;
      swift_willThrow();

      swift_release();
      swift_unknownObjectRelease_n();
LABEL_18:
      swift_release();
      swift_release();
      goto LABEL_19;
    }
    uint64_t v61 = v26;
    uint64_t v62 = (void (*)(id, void (*)(uint64_t, void *), void *))v27;
    id v35 = v60;
    uint64_t v36 = v55;
    sub_25A839760();
    uint64_t v37 = (uint64_t)v57;
    (*(void (**)(char *, uint64_t, uint64_t))(v56 + 16))(v57, v36, v64);
    id v38 = v63;
    if (sub_25A83CAF0(v37, 1, v63) == 1)
    {
      uint64_t v39 = sub_25A850480();
      v40(v39);
      sub_25A839760();
      uint64_t v41 = *v30;
      if (*v30)
      {
        uint64_t v42 = v41;
        id v43 = (void *)sub_25A855630();
        unint64_t v44 = NSError.pds_unlaunderSimpleNSError()();

        swift_willThrow();
        if (v44) {

        }
        swift_release();
        swift_unknownObjectRelease_n();
      }
      else
      {
        if (MEMORY[0x261147510](v2 + 4))
        {
          uint64_t v63 = v29;
          swift_getObjectType();
          sub_25A8503CC();
          swift_getAssociatedTypeWitness();
          uint64_t v58 = (void **)v54;
          sub_25A83CC2C();
          sub_25A8503E8();
          MEMORY[0x270FA5388](v45, v46);
          sub_25A850220();
          os_log_type_t v47 = sub_25A8503F4();
          v48(v47);
          swift_getAssociatedConformanceWitness();
          if (sub_25A855CA0())
          {
            uint64_t v49 = sub_25A850240();
          }
          else
          {
            uint64_t v52 = sub_25A8502C0();
            uint64_t v49 = sub_25A850294(v52, v53);
          }
          v50(v49);
          sub_25A8504FC();
        }
        else
        {
          sub_25A84AA60();
          sub_25A8502C0();
          *uint64_t v51 = 2;
        }
        swift_willThrow();

        swift_release();
        swift_unknownObjectRelease_n();
      }
      goto LABEL_18;
    }

    swift_unknownObjectRelease_n();
    (*(void (**)(void, uint64_t, uint64_t))(*(void *)(v38 - 8) + 32))(v54[0], v37, v38);
    swift_release();
    swift_release();
    swift_release();
  }
LABEL_19:
  sub_25A850208();
}

void sub_25A849EF4()
{
}

unint64_t sub_25A849F10()
{
  unint64_t result = qword_26B32C428[0];
  if (!qword_26B32C428[0])
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, qword_26B32C428);
  }
  return result;
}

uint64_t sub_25A849F50()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25A849F88()
{
  swift_release();
  uint64_t v0 = sub_25A850440();

  return MEMORY[0x270FA0238](v0, v1, v2);
}

id sub_25A849FB8(void *a1)
{
  return sub_25A84A67C(a1, v1[5], v1[2], v1[3], v1[4]);
}

void sub_25A849FD8(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_25A84A040(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_25A84A050()
{
  return swift_release();
}

id sub_25A84A67C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = sub_25A855700();
  sub_25A83CC2C();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12, v13);
  sub_25A850380();
  uint64_t v16 = v15 - v14;
  (*(void (**)(uint64_t, uint64_t))(a5 + 48))(a3, a5);
  id v17 = a1;
  id v18 = a1;
  id v19 = sub_25A8556F0();
  os_log_type_t v20 = sub_25A8559C0();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v29 = a2;
    uint64_t v21 = swift_slowAlloc();
    id v28 = (void *)swift_slowAlloc();
    v31[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v21 = 136315394;
    sub_25A850498();
    uint64_t v23 = v22();
    sub_25A8415AC(v23, v24, v31);
    sub_25A855AA0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v21 + 12) = 2112;
    id v25 = a1;
    uint64_t v30 = _swift_stdlib_bridgeErrorToNSError();
    sub_25A855AA0();
    *id v28 = v30;

    _os_log_impl(&dword_25A837000, v19, v20, "%s: error during call: %@.", (uint8_t *)v21, 0x16u);
    sub_25A839A24((uint64_t *)&unk_26B32BCF0);
    swift_arrayDestroy();
    sub_25A8487B0();
    swift_arrayDestroy();
    sub_25A8487B0();
    a2 = v29;
    sub_25A8487B0();

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v16, v9);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v16, v9);
  }
  swift_beginAccess();
  uint64_t v26 = *(void **)(a2 + 16);
  *(void *)(a2 + 16) = a1;

  return a1;
}

void sub_25A84A93C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = sub_25A855A90();
  uint64_t v8 = swift_projectBox();
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 24))(v8, a1, v7);
  swift_beginAccess();
  uint64_t v9 = *(void **)(a4 + 16);
  *(void *)(a4 + 16) = a2;
  id v10 = a2;
}

uint64_t sub_25A84AA10()
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

void sub_25A84AA50(uint64_t a1, void *a2)
{
  sub_25A84A93C(a1, a2, *(void *)(v2 + 40), *(void *)(v2 + 48));
}

unint64_t sub_25A84AA60()
{
  unint64_t result = qword_26A468FD8;
  if (!qword_26A468FD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A468FD8);
  }
  return result;
}

uint64_t XPCServiceClientConnection.call<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[6] = a4;
  v5[7] = v4;
  v5[4] = a2;
  v5[5] = a3;
  v5[3] = a1;
  sub_25A8501DC();
  v5[8] = v6;
  return sub_25A850374((uint64_t)sub_25A84AADC);
}

uint64_t sub_25A84AADC()
{
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v4 = swift_task_alloc();
  *(void *)(v4 + 16) = v2;
  *(void *)(v4 + 24) = v1;
  uint64_t v5 = type metadata accessor for XPCServiceClientConnection.State();
  unint64_t v6 = sub_25A849F10();
  sub_25A84FB4C((void (*)(uint64_t))sub_25A850168, v4, v3, v5, v6);
  uint64_t v8 = *(void *)(v0 + 48);
  uint64_t v7 = *(void *)(v0 + 56);
  long long v13 = *(_OWORD *)(v0 + 32);
  swift_task_dealloc();
  uint64_t v9 = *(void *)(v0 + 16);
  *(void *)(v0 + 72) = v9;
  uint64_t v10 = swift_task_alloc();
  *(void *)(v0 + 80) = v10;
  *(void *)(v10 + 16) = v8;
  *(void *)(v10 + 24) = v9;
  *(_OWORD *)(v10 + 32) = v13;
  *(void *)(v10 + 48) = v7;
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v11;
  *uint64_t v11 = v0;
  v11[1] = sub_25A84AC94;
  sub_25A850258();
  return MEMORY[0x270FA2360]();
}

uint64_t sub_25A84AC94()
{
  sub_25A841014();
  sub_25A83CC48();
  uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_25A83CD38();
  *uint64_t v5 = v4;
  *(void *)(v3 + 96) = v0;
  swift_task_dealloc();
  if (v0)
  {
    unint64_t v6 = sub_25A84ADE0;
  }
  else
  {
    swift_task_dealloc();
    unint64_t v6 = sub_25A84AD80;
  }
  return MEMORY[0x270FA2498](v6, 0, 0);
}

uint64_t sub_25A84AD80()
{
  sub_25A841014();

  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25A84ADE0()
{
  sub_25A841014();

  swift_task_dealloc();
  sub_25A83CDBC();
  return v1();
}

void sub_25A84AE44()
{
  sub_25A8501F0();
  sub_25A850514();
  sub_25A848EA0(v4);
  if (!v1)
  {
    uint64_t v5 = *v3;
    if (*v3)
    {
      *uint64_t v0 = v5;
      id v6 = v5;
    }
    else
    {
      if (MEMORY[0x261147510](v2 + 32))
      {
        uint64_t v7 = *(void *)(v2 + 40);
        swift_getObjectType();
        uint64_t v8 = *(void (**)(uint64_t))(v7 + 24);
        sub_25A8504C4();
        v17[1] = v17;
        sub_25A83CC2C();
        sub_25A8503E8();
        MEMORY[0x270FA5388](v9, v10);
        sub_25A850220();
        uint64_t v11 = sub_25A850450();
        v8(v11);
        sub_25A85054C();
        if (sub_25A85056C())
        {
          uint64_t v12 = sub_25A850240();
        }
        else
        {
          uint64_t v15 = sub_25A8502C0();
          uint64_t v12 = sub_25A850294(v15, v16);
        }
        v13(v12);
        sub_25A8504FC();
      }
      else
      {
        sub_25A84AA60();
        sub_25A8502C0();
        *uint64_t v14 = 0;
      }
      swift_willThrow();
    }
  }
  sub_25A850208();
}

uint64_t sub_25A84AF9C(uint64_t a1, void *a2, void (*a3)(id, void (*)(), char *), uint64_t a4, uint64_t *a5, uint64_t a6)
{
  uint64_t v34 = a4;
  id v35 = a3;
  uint64_t v32 = a1;
  id v33 = a2;
  uint64_t v9 = *a5;
  sub_25A840B74(&qword_26B32C3E0);
  uint64_t v29 = a6;
  uint64_t v10 = sub_25A855960();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  MEMORY[0x270FA5388](v10, v13);
  uint64_t v15 = (char *)&v26 - v14;
  unint64_t v31 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v31((char *)&v26 - v14, a1, v10);
  uint64_t v16 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v17 = (v16 + 40) & ~v16;
  uint64_t v27 = v17 + v12;
  uint64_t v30 = v16 | 7;
  id v18 = (char *)swift_allocObject();
  uint64_t v28 = *(void *)(v9 + 80);
  *((void *)v18 + 2) = v28;
  *((void *)v18 + 3) = a6;
  uint64_t v19 = *(void *)(v9 + 88);
  *((void *)v18 + 4) = v19;
  uint64_t v26 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
  v26(&v18[v17], v15, v10);
  aBlock[4] = sub_25A84FE44;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_25A849FD8;
  aBlock[3] = &unk_270860768;
  os_log_type_t v20 = _Block_copy(aBlock);
  swift_release();
  id v21 = objc_msgSend(v33, sel_remoteObjectProxyWithErrorHandler_, v20);
  _Block_release(v20);
  v31(v15, v32, v10);
  unint64_t v22 = (v27 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v23 = (char *)swift_allocObject();
  uint64_t v24 = v29;
  *((void *)v23 + 2) = v28;
  *((void *)v23 + 3) = v24;
  *((void *)v23 + 4) = v19;
  v26(&v23[v17], v15, v10);
  *(void *)&v23[v22] = a5;
  swift_unknownObjectRetain();
  swift_retain();
  v35(v21, sub_25A84FF68, v23);
  swift_release();
  return swift_unknownObjectRelease_n();
}

uint64_t sub_25A84B280(uint64_t a1)
{
  return sub_25A84EC44(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_25A84AF9C);
}

uint64_t sub_25A84B298(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = sub_25A855700();
  uint64_t v32 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9, v10);
  uint64_t v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(uint64_t, uint64_t))(a5 + 48))(a3, a5);
  id v13 = a1;
  id v14 = a1;
  uint64_t v15 = sub_25A8556F0();
  os_log_type_t v16 = sub_25A8559C0();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v31 = a2;
    uint64_t v18 = v17;
    uint64_t v28 = (void *)swift_slowAlloc();
    uint64_t v29 = swift_slowAlloc();
    uint64_t v34 = v29;
    *(_DWORD *)uint64_t v18 = 136315394;
    uint64_t v30 = v9;
    uint64_t v19 = (*(uint64_t (**)(uint64_t, uint64_t))(a5 + 24))(a3, a5);
    uint64_t v33 = sub_25A8415AC(v19, v20, &v34);
    sub_25A855AA0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 12) = 2112;
    id v21 = a1;
    uint64_t v22 = _swift_stdlib_bridgeErrorToNSError();
    uint64_t v33 = v22;
    sub_25A855AA0();
    uint64_t v23 = v28;
    *uint64_t v28 = v22;

    _os_log_impl(&dword_25A837000, v15, v16, "%s: error during call: %@.", (uint8_t *)v18, 0x16u);
    sub_25A839A24((uint64_t *)&unk_26B32BCF0);
    swift_arrayDestroy();
    MEMORY[0x261147430](v23, -1, -1);
    uint64_t v24 = v29;
    swift_arrayDestroy();
    MEMORY[0x261147430](v24, -1, -1);
    MEMORY[0x261147430](v18, -1, -1);

    (*(void (**)(char *, uint64_t))(v32 + 8))(v12, v30);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v32 + 8))(v12, v9);
  }
  uint64_t v34 = (uint64_t)a1;
  id v25 = a1;
  sub_25A840B74(&qword_26B32C3E0);
  sub_25A855960();
  return sub_25A855940();
}

void sub_25A84B5D0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v39[2] = a3;
  uint64_t v9 = sub_25A855A90();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v9, v11);
  id v14 = (char *)v39 - v13;
  uint64_t v15 = *(void *)(a5 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v12, v16);
  uint64_t v19 = (char *)v39 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17, v20);
  uint64_t v22 = (char *)v39 - v21;
  if (a2)
  {
    id v23 = a2;
    uint64_t v24 = (void *)sub_25A855630();
    id v25 = NSError.pds_unlaunderSimpleNSError()();

    if (v25)
    {
      uint64_t v40 = (uint64_t)v25;
      id v26 = v25;
      sub_25A840B74(&qword_26B32C3E0);
      sub_25A855960();
      sub_25A855940();

      return;
    }
    uint64_t v40 = (uint64_t)a2;
    sub_25A840B74(&qword_26B32C3E0);
    sub_25A855960();
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v14, a1, v9);
    if (sub_25A83CAF0((uint64_t)v14, 1, a5) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v22, v14, a5);
      (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v19, v22, a5);
      sub_25A840B74(&qword_26B32C3E0);
      sub_25A855960();
      sub_25A855950();
      (*(void (**)(char *, uint64_t))(v15 + 8))(v22, a5);
      return;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v14, v9);
    if (MEMORY[0x261147510](a4 + 32))
    {
      uint64_t v27 = *(void *)(a4 + 40);
      uint64_t ObjectType = swift_getObjectType();
      LOBYTE(v40) = 2;
      uint64_t v29 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v27 + 24);
      uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
      v39[1] = v39;
      uint64_t v31 = *(void *)(AssociatedTypeWitness - 8);
      MEMORY[0x270FA5388](AssociatedTypeWitness, v32);
      uint64_t v34 = (char *)v39 - v33;
      swift_unknownObjectRetain();
      v29(&v40, ObjectType, v27);
      swift_getAssociatedConformanceWitness();
      uint64_t v35 = sub_25A855CA0();
      if (v35)
      {
        uint64_t v36 = v35;
        (*(void (**)(char *, uint64_t))(v31 + 8))(v34, AssociatedTypeWitness);
      }
      else
      {
        uint64_t v36 = swift_allocError();
        (*(void (**)(uint64_t, char *, uint64_t))(v31 + 32))(v38, v34, AssociatedTypeWitness);
      }
      swift_unknownObjectRelease_n();
    }
    else
    {
      sub_25A84AA60();
      uint64_t v36 = swift_allocError();
      *uint64_t v37 = 2;
    }
    uint64_t v40 = v36;
    sub_25A840B74(&qword_26B32C3E0);
    sub_25A855960();
  }
  sub_25A855940();
}

void sub_25A84BAAC()
{
}

void sub_25A84BAD0()
{
}

uint64_t sub_25A84BAF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_25A83FFE8;
  return XPCServiceClientConnection.call<A>(_:)(a1, a2, a3, a4);
}

unsigned char *static XPCServiceClientConnectionDelegate.translateXPCServiceError(_:)@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_25A84BBCC@<X0>(unsigned char *a1@<X0>, unsigned char *a2@<X8>)
{
  *a2 = *a1;
  swift_unknownObjectWeakInit();

  return swift_unknownObjectRelease();
}

uint64_t BidirectionalXPCServiceClientConnection.__allocating_init(existingConnection:localObject:delegate:)()
{
  sub_25A850320();
  uint64_t v1 = (void *)sub_25A8503B0();
  BidirectionalXPCServiceClientConnection.init(existingConnection:localObject:delegate:)(v1, v2, v3, v4);
  return v0;
}

void *BidirectionalXPCServiceClientConnection.init(existingConnection:localObject:delegate:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = v5;
  sub_25A8501DC();
  uint64_t v10 = v9;
  v4[5] = 0;
  swift_unknownObjectWeakInit();
  v4[3] = a1;
  LOBYTE(v17[0]) = 1;
  id v11 = a1;
  swift_unknownObjectRetain();
  long long v15 = *(_OWORD *)(v10 + 96);
  long long v16 = *(_OWORD *)(v10 + 80);
  sub_25A84BBCC(v17, v18);
  v17[0] = v16;
  v17[1] = v15;
  uint64_t v12 = type metadata accessor for BidirectionalXPCServiceClientConnection.State();
  uint64_t v13 = sub_25A8488F4((uint64_t)v18, v12);
  v4[2] = v13;
  v4[5] = a4;
  swift_unknownObjectWeakAssign();
  swift_retain();
  sub_25A83A4CC((void (*)(uint64_t))sub_25A84BDB8, (uint64_t)v4, v13, v12, MEMORY[0x263F8EE60] + 8);
  if (v6) {
    swift_release();
  }
  swift_release();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v4;
}

uint64_t type metadata accessor for BidirectionalXPCServiceClientConnection.State()
{
  return swift_getGenericMetadata();
}

uint64_t sub_25A84BDB8(unsigned char *a1)
{
  return sub_25A84BDD0(a1);
}

uint64_t sub_25A84BDD0(unsigned char *a1)
{
  uint64_t v4 = (void *)*v1;
  if (MEMORY[0x261147510](v1 + 4))
  {
    uint64_t v5 = v1[5];
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v5 + 32))(ObjectType, v5);
    if (v2 || *a1 > 1u)
    {
      return swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v7 = (void *)v1[3];
      uint64_t v20 = v4[13];
      uint64_t v8 = v4[11];
      id v9 = static XPCService.xpcInterface()();
      objc_msgSend(v7, sel_setRemoteObjectInterface_, v9);

      uint64_t v10 = v4[10];
      uint64_t v19 = v4[12];
      id v11 = static XPCService.xpcInterface()();
      objc_msgSend(v7, sel_setExportedInterface_, v11);

      objc_msgSend(v7, sel_setExportedObject_, MEMORY[0x261147510](a1 + 8));
      swift_unknownObjectRelease();
      uint64_t v12 = swift_allocObject();
      swift_weakInit();
      uint64_t v13 = (void *)swift_allocObject();
      v13[2] = v10;
      v13[3] = v8;
      v13[4] = v19;
      void v13[5] = v20;
      v13[6] = v12;
      id v25 = sub_25A84FCD0;
      id v26 = v13;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v22 = 1107296256;
      id v23 = sub_25A8533A4;
      uint64_t v24 = &unk_270860718;
      id v14 = _Block_copy(&aBlock);
      swift_release();
      objc_msgSend(v7, sel_setInterruptionHandler_, v14);
      _Block_release(v14);
      uint64_t v15 = swift_allocObject();
      swift_weakInit();
      long long v16 = (void *)swift_allocObject();
      v16[2] = v10;
      _OWORD v16[3] = v8;
      void v16[4] = v19;
      v16[5] = v20;
      v16[6] = v15;
      id v25 = sub_25A84FCE8;
      id v26 = v16;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v22 = 1107296256;
      id v23 = sub_25A8533A4;
      uint64_t v24 = &unk_270860740;
      uint64_t v17 = _Block_copy(&aBlock);
      swift_release();
      objc_msgSend(v7, sel_setInvalidationHandler_, v17);
      _Block_release(v17);
      if (!*a1) {
        objc_msgSend(v7, sel_activate);
      }
      uint64_t result = swift_unknownObjectRelease();
      *a1 = 2;
    }
  }
  else
  {
    uint64_t result = sub_25A855C10();
    __break(1u);
  }
  return result;
}

uint64_t BidirectionalXPCServiceClientConnection.__allocating_init(localObject:delegate:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  BidirectionalXPCServiceClientConnection.init(localObject:delegate:)(a1, a2, a3);
  return v6;
}

uint64_t BidirectionalXPCServiceClientConnection.init(localObject:delegate:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (uint64_t)v3;
  uint64_t v5 = (void *)*v3;
  v3[5] = 0;
  swift_unknownObjectWeakInit();
  sub_25A849F10();
  uint64_t v6 = v5[11];
  uint64_t v7 = v5[13];
  sub_25A850498();
  uint64_t v9 = v8();
  v3[3] = sub_25A8495F4(v9, v10, 0);
  LOBYTE(v18[0]) = 0;
  uint64_t v11 = v5[10];
  uint64_t v12 = v5[12];
  swift_unknownObjectRetain();
  sub_25A84BBCC(v18, v19);
  v18[0] = v11;
  v18[1] = v6;
  v18[2] = v12;
  v18[3] = v7;
  uint64_t v13 = type metadata accessor for BidirectionalXPCServiceClientConnection.State();
  uint64_t v14 = sub_25A8488F4((uint64_t)v19, v13);
  *(void *)(v4 + 16) = v14;
  *(void *)(v4 + 40) = a3;
  swift_unknownObjectWeakAssign();
  swift_retain();
  uint64_t v15 = v20;
  sub_25A83A4CC((void (*)(uint64_t))sub_25A8500F4, v4, v14, v13, MEMORY[0x263F8EE60] + 8);
  if (v15) {
    swift_release();
  }
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v4;
}

uint64_t BidirectionalXPCServiceClientConnection.__allocating_init(remoteService:localObject:delegate:)()
{
  sub_25A850320();
  uint64_t v1 = (void *)sub_25A8503B0();
  BidirectionalXPCServiceClientConnection.init(remoteService:localObject:delegate:)(v1, v2, v3, v4);
  return v0;
}

void *BidirectionalXPCServiceClientConnection.init(remoteService:localObject:delegate:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v7 = (void *)*v4;
  v4[5] = 0;
  swift_unknownObjectWeakInit();
  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08D68]), sel_init);
  uint64_t v9 = v7[11];
  uint64_t v10 = v7[13];
  sub_25A850498();
  v11();
  uint64_t v12 = (void *)sub_25A8558A0();
  swift_bridgeObjectRelease();
  id v13 = objc_msgSend(v8, sel__initWithRemoteService_name_options_, a1, v12, 0);

  v5[3] = v13;
  LOBYTE(v21[0]) = 0;
  uint64_t v14 = v7[10];
  uint64_t v15 = v7[12];
  swift_unknownObjectRetain();
  sub_25A84BBCC(v21, v22);
  v21[0] = v14;
  v21[1] = v9;
  _OWORD v21[2] = v15;
  _OWORD v21[3] = v10;
  uint64_t v16 = type metadata accessor for BidirectionalXPCServiceClientConnection.State();
  uint64_t v17 = sub_25A8488F4((uint64_t)v22, v16);
  v5[2] = v17;
  v5[5] = a4;
  swift_unknownObjectWeakAssign();
  swift_retain();
  uint64_t v18 = v23;
  sub_25A83A4CC((void (*)(uint64_t))sub_25A8500F4, (uint64_t)v5, v17, v16, MEMORY[0x263F8EE60] + 8);
  if (v18) {
    swift_release();
  }
  swift_release();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v5;
}

uint64_t BidirectionalXPCServiceClientConnection.deinit()
{
  uint64_t v1 = *(void **)(v0 + 24);
  objc_msgSend(v1, sel_setInterruptionHandler_, 0);
  objc_msgSend(v1, sel_setInvalidationHandler_, 0);
  objc_msgSend(v1, sel_invalidate);
  swift_release();

  sub_25A83CBE4(v0 + 32);
  return v0;
}

uint64_t BidirectionalXPCServiceClientConnection.__deallocating_deinit()
{
  BidirectionalXPCServiceClientConnection.deinit();
  uint64_t v0 = sub_25A850440();

  return MEMORY[0x270FA0228](v0, v1, v2);
}

ProactiveDaemonSupport::ConnectionState __swiftcall BidirectionalXPCServiceClientConnection.getCurrentConnectionState()()
{
  uint64_t v1 = *(void *)(v0 + 16);
  sub_25A85041C();
  v11[2] = *(void *)(v2 + 80);
  sub_25A85041C();
  v11[3] = *(void *)(v3 + 88);
  sub_25A85041C();
  v11[4] = *(void *)(v4 + 96);
  sub_25A85041C();
  uint64_t v12 = *(void *)(v5 + 104);
  uint64_t v13 = v6;
  uint64_t v14 = v7;
  uint64_t v15 = v8;
  uint64_t v16 = v12;
  uint64_t v9 = type metadata accessor for BidirectionalXPCServiceClientConnection.State();
  sub_25A83A4CC((void (*)(uint64_t))sub_25A84EAE0, (uint64_t)v11, v1, v9, (uint64_t)&type metadata for ConnectionState);
  return result;
}

BOOL static ConnectionState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_25A84C734(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t))
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v13 = result;
    uint64_t v14 = *(void *)(result + 16);
    MEMORY[0x270FA5388](result, v12);
    _OWORD v21[2] = a2;
    _OWORD v21[3] = a3;
    void v21[4] = a4;
    v21[5] = a5;
    swift_retain();
    v21[6] = a2;
    v21[7] = a3;
    v21[8] = a4;
    v21[9] = a5;
    uint64_t v15 = type metadata accessor for BidirectionalXPCServiceClientConnection.State();
    sub_25A83A4CC(a6, (uint64_t)v21, v14, v15, MEMORY[0x263F8EE60] + 8);
    swift_release();
    if (MEMORY[0x261147510](v13 + 32))
    {
      swift_getObjectType();
      sub_25A8504B0();
      v20(v16, v17, v18, v19);
      swift_release();
      return swift_unknownObjectRelease();
    }
    else
    {
      return swift_release();
    }
  }
  return result;
}

void sub_25A84C870(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  sub_25A8501F0();
  a19 = v20;
  a20 = v21;
  id v43 = v22;
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  sub_25A855700();
  sub_25A83CC2C();
  MEMORY[0x270FA5388](v31, v32);
  sub_25A850380();
  (*(void (**)(uint64_t, uint64_t))(v26 + 48))(v28, v26);
  uint64_t v33 = sub_25A8556F0();
  os_log_type_t v34 = v24();
  if (os_log_type_enabled(v33, v34))
  {
    uint64_t v35 = (uint8_t *)swift_slowAlloc();
    uint64_t v42 = v30;
    uint64_t v36 = swift_slowAlloc();
    *(_DWORD *)uint64_t v35 = 136315138;
    a10 = v36;
    sub_25A850498();
    uint64_t v38 = v37();
    sub_25A8415AC(v38, v39, &a10);
    sub_25A855AA0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25A837000, v33, v34, v43, v35, 0xCu);
    swift_arrayDestroy();
    uint64_t v40 = v36;
    uint64_t v30 = v42;
    MEMORY[0x261147430](v40, -1, -1);
    MEMORY[0x261147430](v35, -1, -1);
  }

  sub_25A850410();
  v41();
  *uint64_t v30 = 3;
  sub_25A850208();
}

void BidirectionalXPCServiceClientConnection.call<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  sub_25A8501F0();
  uint64_t v13 = v12;
  uint64_t v31 = v14;
  sub_25A8501DC();
  MEMORY[0x270FA5388](v15, v16);
  uint64_t v17 = *(void *)(v10 + 16);
  _OWORD v32[2] = v18;
  uint64_t v33 = v10;
  long long v20 = *(_OWORD *)(v19 + 96);
  long long v34 = *(_OWORD *)(v19 + 80);
  long long v35 = v20;
  uint64_t v21 = type metadata accessor for BidirectionalXPCServiceClientConnection.State();
  unint64_t v22 = sub_25A849F10();
  sub_25A84FB4C((void (*)(uint64_t))sub_25A84EAEC, (uint64_t)v32, v17, v21, v22);
  if (!v11)
  {
    uint64_t v23 = sub_25A850428();
    *(void *)(v23 + 16) = 0;
    uint64_t v24 = (void *)swift_allocObject();
    _OWORD v24[2] = v13;
    v24[3] = v10;
    v24[4] = v23;
    uint64_t v36 = sub_25A84EB0C;
    uint64_t v37 = v24;
    *(void *)&long long v34 = MEMORY[0x263EF8330];
    *((void *)&v34 + 1) = 1107296256;
    *(void *)&long long v35 = sub_25A849FD8;
    *((void *)&v35 + 1) = &unk_270860600;
    uint64_t v25 = _Block_copy(&v34);
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(a10, sel_synchronousRemoteObjectProxyWithErrorHandler_, v25);
    _Block_release(v25);
    uint64_t v26 = swift_unknownObjectRetain();
    v31(v26);
    sub_25A839760();
    uint64_t v27 = *(void **)(v23 + 16);
    if (v27)
    {
      id v28 = v27;
      swift_willThrow();

      swift_unknownObjectRelease();
      sub_25A850410();
      v29();
      swift_release();
      swift_unknownObjectRelease();
    }
    else
    {

      swift_unknownObjectRelease_n();
      sub_25A850468();
      v30();
      swift_release();
    }
  }
  sub_25A850208();
}

void BidirectionalXPCServiceClientConnection.call<A>(_:)()
{
  sub_25A8501F0();
  uint64_t v2 = v0;
  uint64_t v4 = v3;
  uint64_t v68 = v6;
  uint64_t v69 = v5;
  uint64_t v8 = v7;
  uint64_t v9 = *v0;
  uint64_t v70 = sub_25A855A90();
  sub_25A83CC2C();
  uint64_t v11 = v10;
  sub_25A8503E8();
  MEMORY[0x270FA5388](v12, v13);
  uint64_t v15 = (char *)v58 - v14;
  uint64_t v16 = v0[2];
  v71[2] = v4;
  unint64_t v72 = v0;
  sub_25A850540();
  sub_25A850540();
  uint64_t v18 = *(void (**)(uint64_t, void *))(v17 + 96);
  uint64_t v19 = *(void **)(v9 + 104);
  int v67 = v20;
  uint64_t v74 = v20;
  uint64_t v75 = v21;
  uint64_t v66 = v21;
  uint64_t v65 = v18;
  int v76 = v18;
  uint64_t v77 = v19;
  uint64_t v22 = type metadata accessor for BidirectionalXPCServiceClientConnection.State();
  unint64_t v23 = sub_25A849F10();
  sub_25A84FB4C((void (*)(uint64_t))sub_25A850180, (uint64_t)v71, v16, v22, v23);
  if (!v1)
  {
    uint64_t v60 = v11;
    uint64_t v61 = v15;
    v58[0] = v8;
    v58[1] = 0;
    uint64_t v24 = v73;
    uint64_t v25 = sub_25A850428();
    *(void *)(v25 + 16) = 0;
    uint64_t v26 = (void **)(v25 + 16);
    uint64_t v27 = (void *)swift_allocObject();
    v27[2] = v4;
    v27[3] = v2;
    v27[4] = v25;
    uint64_t v78 = sub_25A84EB84;
    uint64_t v79 = v27;
    uint64_t v74 = (void *)MEMORY[0x263EF8330];
    uint64_t v75 = 1107296256;
    int v76 = sub_25A849FD8;
    uint64_t v77 = &unk_270860650;
    id v28 = _Block_copy(&v74);
    swift_retain();
    uint64_t v62 = v25;
    swift_retain();
    swift_release();
    id v63 = v24;
    id v64 = objc_msgSend(v24, sel_synchronousRemoteObjectProxyWithErrorHandler_, v28);
    _Block_release(v28);
    uint64_t v29 = swift_allocBox();
    uint64_t v59 = v30;
    sub_25A83B6E8(v30, 1, 1, v4);
    uint64_t v31 = sub_25A850428();
    *(void *)(v31 + 16) = 0;
    uint64_t v32 = (void *)swift_allocObject();
    uint64_t v33 = v66;
    _OWORD v32[2] = v67;
    void v32[3] = v33;
    long long v34 = v65;
    v32[4] = v4;
    v32[5] = v34;
    uint64_t v35 = v29;
    id v36 = v64;
    v32[6] = v19;
    v32[7] = v35;
    v32[8] = v31;
    swift_unknownObjectRetain();
    swift_retain();
    swift_retain();
    v69(v36, sub_25A84EBF8, v32);
    swift_release();
    sub_25A839760();
    uint64_t v37 = *v26;
    if (v37)
    {
      id v38 = v37;
      swift_willThrow();

      swift_release();
      sub_25A850528();
      swift_release();
    }
    else
    {
      unint64_t v39 = (void **)(v31 + 16);
      uint64_t v69 = (void (*)(id, void (*)(uint64_t, void *), void *))v31;
      id v40 = v63;
      uint64_t v41 = v59;
      sub_25A839760();
      uint64_t v42 = (uint64_t)v61;
      (*(void (**)(char *, uint64_t, uint64_t))(v60 + 16))(v61, v41, v70);
      if (sub_25A83CAF0(v42, 1, v4) != 1)
      {

        sub_25A850528();
        (*(void (**)(void, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(v58[0], v42, v4);
        swift_release();
        swift_release();
        swift_release();
        goto LABEL_10;
      }
      uint64_t v43 = sub_25A850480();
      v44(v43);
      sub_25A839760();
      unint64_t v45 = *v39;
      if (*v39)
      {
        id v46 = v45;
        os_log_type_t v47 = (void *)sub_25A855630();
        uint64_t v48 = NSError.pds_unlaunderSimpleNSError()();

        if (v48)
        {
          swift_willThrow();

          swift_release();
          sub_25A850528();
          swift_release();
          swift_release();
          goto LABEL_10;
        }
      }
      else if (MEMORY[0x261147510](v2 + 4))
      {
        uint64_t v68 = v35;
        swift_getObjectType();
        sub_25A8503CC();
        uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
        int v67 = v58;
        sub_25A83CC2C();
        uint64_t v51 = v50;
        sub_25A8503E8();
        MEMORY[0x270FA5388](v52, v53);
        sub_25A850220();
        uint64_t v54 = sub_25A8503F4();
        v55(v54);
        swift_getAssociatedConformanceWitness();
        if (sub_25A855CA0())
        {
          (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v35, AssociatedTypeWitness);
        }
        else
        {
          sub_25A8502C0();
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v51 + 32))(v57, v35, AssociatedTypeWitness);
        }
        sub_25A8504FC();
      }
      else
      {
        sub_25A84AA60();
        sub_25A8502C0();
        *uint64_t v56 = 2;
      }
      swift_willThrow();

      swift_release();
      sub_25A850528();
      swift_release();
    }
    swift_release();
  }
LABEL_10:
  sub_25A850208();
}

id sub_25A84D378(void *a1, void *a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t))
{
  unint64_t v45 = (void *)*a2;
  uint64_t v46 = a4;
  uint64_t v9 = sub_25A855700();
  sub_25A83CC2C();
  uint64_t v44 = v10;
  MEMORY[0x270FA5388](v11, v12);
  sub_25A850380();
  uint64_t v15 = v14 - v13;
  uint64_t v16 = v45[11];
  uint64_t v17 = v45[13];
  (*(void (**)(uint64_t, uint64_t))(v17 + 48))(v16, v17);
  id v18 = a1;
  id v19 = a1;
  long long v20 = sub_25A8556F0();
  os_log_type_t v21 = sub_25A8559C0();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v43 = a3;
    uint64_t v22 = swift_slowAlloc();
    unint64_t v39 = (void *)swift_slowAlloc();
    uint64_t v41 = swift_slowAlloc();
    v48[0] = v41;
    *(_DWORD *)uint64_t v22 = 136315394;
    uint64_t v42 = a5;
    os_log_t v38 = v20;
    sub_25A850498();
    uint64_t v24 = v23();
    sub_25A8415AC(v24, v25, v48);
    uint64_t v40 = v9;
    sub_25A855AA0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v22 + 12) = 2112;
    id v26 = a1;
    uint64_t v47 = _swift_stdlib_bridgeErrorToNSError();
    sub_25A855AA0();
    *unint64_t v39 = v47;
    a5 = v42;

    _os_log_impl(&dword_25A837000, v38, v21, "%s: error during call: %@.", (uint8_t *)v22, 0x16u);
    sub_25A839A24((uint64_t *)&unk_26B32BCF0);
    swift_arrayDestroy();
    sub_25A8487B0();
    swift_arrayDestroy();
    sub_25A8487B0();
    a3 = v43;
    sub_25A8487B0();

    uint64_t v27 = (*(uint64_t (**)(uint64_t, uint64_t))(v44 + 8))(v15, v40);
  }
  else
  {

    uint64_t v27 = (*(uint64_t (**)(uint64_t, uint64_t))(v44 + 8))(v15, v9);
  }
  uint64_t v29 = a2[2];
  MEMORY[0x270FA5388](v27, v28);
  uint64_t v30 = v45;
  uint64_t v31 = v46;
  uint64_t v32 = v45[10];
  *(&v37 - 6) = v32;
  *(&v37 - 5) = v16;
  uint64_t v33 = v30[12];
  *(&v37 - 4) = v31;
  *(&v37 - 3) = v33;
  *(&v37 - 2) = v17;
  v48[0] = v32;
  v48[1] = v16;
  v48[2] = v33;
  v48[3] = v17;
  uint64_t v34 = type metadata accessor for BidirectionalXPCServiceClientConnection.State();
  sub_25A83A4CC(a5, (uint64_t)(&v37 - 8), v29, v34, MEMORY[0x263F8EE60] + 8);
  swift_beginAccess();
  uint64_t v35 = *(void **)(a3 + 16);
  *(void *)(a3 + 16) = a1;

  return a1;
}

void sub_25A84D728(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = sub_25A855A90();
  uint64_t v8 = swift_projectBox();
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 24))(v8, a1, v7);
  swift_beginAccess();
  uint64_t v9 = *(void **)(a4 + 16);
  *(void *)(a4 + 16) = a2;
  id v10 = a2;
}

uint64_t BidirectionalXPCServiceClientConnection.call<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[10] = a4;
  v5[11] = v4;
  v5[8] = a2;
  v5[9] = a3;
  v5[7] = a1;
  sub_25A8501DC();
  v5[12] = v6;
  return sub_25A850374((uint64_t)sub_25A84D82C);
}

uint64_t sub_25A84D82C()
{
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v2 = *(void *)(v0 + 96);
  uint64_t v3 = *(void *)(v0 + 80);
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = swift_task_alloc();
  *(void *)(v5 + 16) = v3;
  *(void *)(v5 + 24) = v1;
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v2 + 80);
  *(_OWORD *)(v0 + 32) = *(_OWORD *)(v2 + 96);
  uint64_t v6 = type metadata accessor for BidirectionalXPCServiceClientConnection.State();
  unint64_t v7 = sub_25A849F10();
  sub_25A84FB4C((void (*)(uint64_t))sub_25A850180, v5, v4, v6, v7);
  uint64_t v9 = *(void *)(v0 + 80);
  uint64_t v8 = *(void *)(v0 + 88);
  long long v14 = *(_OWORD *)(v0 + 64);
  swift_task_dealloc();
  uint64_t v10 = *(void *)(v0 + 48);
  *(void *)(v0 + 104) = v10;
  uint64_t v11 = swift_task_alloc();
  *(void *)(v0 + 112) = v11;
  *(void *)(v11 + 16) = v9;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = v8;
  *(_OWORD *)(v11 + 40) = v14;
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v0 + 120) = v12;
  *uint64_t v12 = v0;
  v12[1] = sub_25A84D9E8;
  sub_25A850258();
  return MEMORY[0x270FA2360]();
}

uint64_t sub_25A84D9E8()
{
  sub_25A841014();
  sub_25A83CC48();
  uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_25A83CD38();
  *uint64_t v5 = v4;
  *(void *)(v3 + 128) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v6 = sub_25A84DB34;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v6 = sub_25A84DAD4;
  }
  return MEMORY[0x270FA2498](v6, 0, 0);
}

uint64_t sub_25A84DAD4()
{
  sub_25A841014();

  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25A84DB34()
{
  sub_25A841014();

  swift_task_dealloc();
  sub_25A83CDBC();
  return v1();
}

void sub_25A84DB98()
{
  sub_25A8501F0();
  sub_25A850514();
  sub_25A84BDD0(v4);
  if (!v1)
  {
    if (*v3 == 3)
    {
      if (MEMORY[0x261147510](v2 + 32))
      {
        uint64_t v5 = *(void *)(v2 + 40);
        swift_getObjectType();
        uint64_t v6 = *(void (**)(uint64_t))(v5 + 24);
        sub_25A8504C4();
        v17[1] = v17;
        sub_25A83CC2C();
        sub_25A8503E8();
        MEMORY[0x270FA5388](v7, v8);
        sub_25A850220();
        uint64_t v9 = sub_25A850450();
        v6(v9);
        sub_25A85054C();
        if (sub_25A85056C())
        {
          uint64_t v10 = sub_25A850240();
        }
        else
        {
          uint64_t v15 = sub_25A8502C0();
          uint64_t v10 = sub_25A850294(v15, v16);
        }
        v11(v10);
        sub_25A8504FC();
      }
      else
      {
        sub_25A84AA60();
        sub_25A8502C0();
        *long long v14 = 1;
      }
      swift_willThrow();
    }
    else
    {
      uint64_t v12 = *(void **)(v2 + 24);
      *uint64_t v0 = v12;
      id v13 = v12;
    }
  }
  sub_25A850208();
}

uint64_t sub_25A84DD00(uint64_t a1, void *a2, void *a3, void (*a4)(uint64_t, void (*)(), char *), uint64_t a5, uint64_t a6)
{
  uint64_t v37 = a5;
  os_log_t v38 = a4;
  uint64_t v35 = a1;
  id v36 = a2;
  uint64_t v9 = (void *)*a3;
  sub_25A840B74(&qword_26B32C3E0);
  uint64_t v31 = a6;
  uint64_t v27 = sub_25A855960();
  uint64_t v10 = *(void *)(v27 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v27, v12);
  long long v14 = (char *)&v27 - v13;
  uint64_t v34 = *(void (**)(char *, uint64_t))(v10 + 16);
  v34((char *)&v27 - v13, a1);
  uint64_t v15 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v33 = v15 | 7;
  uint64_t v16 = (char *)swift_allocObject();
  uint64_t v32 = v9[10];
  *((void *)v16 + 2) = v32;
  uint64_t v30 = v9[11];
  *((void *)v16 + 3) = v30;
  *((void *)v16 + 4) = a6;
  uint64_t v29 = v9[12];
  *((void *)v16 + 5) = v29;
  uint64_t v28 = v9[13];
  *((void *)v16 + 6) = v28;
  *((void *)v16 + 7) = a3;
  uint64_t v17 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
  uint64_t v18 = v27;
  v17(&v16[(v15 + 64) & ~v15], v14, v27);
  aBlock[4] = sub_25A84F918;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_25A849FD8;
  aBlock[3] = &unk_2708606A0;
  id v19 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  id v20 = objc_msgSend(v36, sel_remoteObjectProxyWithErrorHandler_, v19);
  _Block_release(v19);
  ((void (*)(char *, uint64_t, uint64_t))v34)(v14, v35, v18);
  uint64_t v21 = (v15 + 56) & ~v15;
  uint64_t v22 = (char *)swift_allocObject();
  uint64_t v23 = v30;
  *((void *)v22 + 2) = v32;
  *((void *)v22 + 3) = v23;
  uint64_t v24 = v29;
  *((void *)v22 + 4) = v31;
  *((void *)v22 + 5) = v24;
  *((void *)v22 + 6) = v28;
  v17(&v22[v21], v14, v18);
  *(void *)&v22[(v11 + v21 + 7) & 0xFFFFFFFFFFFFFFF8] = a3;
  swift_retain();
  uint64_t v25 = swift_unknownObjectRetain();
  v38(v25, sub_25A84FA2C, v22);
  swift_release();
  return swift_unknownObjectRelease_n();
}

uint64_t sub_25A84E038(void *a1, uint64_t *a2, uint64_t a3, NSObject *a4)
{
  uint64_t v41 = a4;
  uint64_t v42 = a3;
  uint64_t v6 = *a2;
  uint64_t v7 = *a2;
  uint64_t v8 = sub_25A855700();
  uint64_t v40 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8, v9);
  uint64_t v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(NSObject **)(v6 + 88);
  uint64_t v13 = *(void *)(v6 + 104);
  (*(void (**)(NSObject *, uint64_t))(v13 + 48))(v12, v13);
  id v14 = a1;
  id v15 = a1;
  uint64_t v16 = sub_25A8556F0();
  os_log_type_t v17 = sub_25A8559C0();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = swift_slowAlloc();
    uint64_t v38 = v8;
    uint64_t v19 = v18;
    id v36 = (void *)swift_slowAlloc();
    uint64_t v37 = swift_slowAlloc();
    v44[0] = v37;
    *(_DWORD *)uint64_t v19 = 136315394;
    uint64_t v39 = v7;
    uint64_t v20 = (*(uint64_t (**)(NSObject *, uint64_t))(v13 + 24))(v12, v13);
    uint64_t v43 = sub_25A8415AC(v20, v21, v44);
    os_log_t v35 = v16;
    sub_25A855AA0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 12) = 2112;
    id v22 = a1;
    uint64_t v23 = _swift_stdlib_bridgeErrorToNSError();
    uint64_t v43 = v23;
    sub_25A855AA0();
    uint64_t v24 = v36;
    *id v36 = v23;
    uint64_t v7 = v39;

    os_log_t v25 = v35;
    _os_log_impl(&dword_25A837000, v35, v17, "%s: error during call: %@.", (uint8_t *)v19, 0x16u);
    sub_25A839A24((uint64_t *)&unk_26B32BCF0);
    swift_arrayDestroy();
    MEMORY[0x261147430](v24, -1, -1);
    uint64_t v26 = v37;
    swift_arrayDestroy();
    MEMORY[0x261147430](v26, -1, -1);
    MEMORY[0x261147430](v19, -1, -1);

    uint64_t v27 = (*(uint64_t (**)(char *, uint64_t))(v40 + 8))(v11, v38);
  }
  else
  {

    uint64_t v27 = (*(uint64_t (**)(char *, uint64_t))(v40 + 8))(v11, v8);
  }
  uint64_t v29 = a2[2];
  MEMORY[0x270FA5388](v27, v28);
  uint64_t v30 = *(NSObject **)(v7 + 80);
  *(&v35 - 6) = v30;
  *(&v35 - 5) = v12;
  uint64_t v31 = *(NSObject **)(v7 + 96);
  *(&v35 - 4) = v41;
  *(&v35 - 3) = v31;
  *(&v35 - 2) = (os_log_t)v13;
  v44[0] = (uint64_t)v30;
  v44[1] = (uint64_t)v12;
  v44[2] = (uint64_t)v31;
  v44[3] = v13;
  uint64_t v32 = type metadata accessor for BidirectionalXPCServiceClientConnection.State();
  sub_25A83A4CC((void (*)(uint64_t))sub_25A8501C0, (uint64_t)&(&v35)[-8], v29, v32, MEMORY[0x263F8EE60] + 8);
  v44[0] = (uint64_t)a1;
  id v33 = a1;
  sub_25A840B74(&qword_26B32C3E0);
  sub_25A855960();
  return sub_25A855940();
}

void sub_25A84E448(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v39[2] = a3;
  uint64_t v9 = sub_25A855A90();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v9, v11);
  id v14 = (char *)v39 - v13;
  uint64_t v15 = *(void *)(a5 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v12, v16);
  uint64_t v19 = (char *)v39 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17, v20);
  id v22 = (char *)v39 - v21;
  if (a2)
  {
    id v23 = a2;
    uint64_t v24 = (void *)sub_25A855630();
    os_log_t v25 = NSError.pds_unlaunderSimpleNSError()();

    if (v25)
    {
      uint64_t v40 = (uint64_t)v25;
      id v26 = v25;
      sub_25A840B74(&qword_26B32C3E0);
      sub_25A855960();
      sub_25A855940();

      return;
    }
    uint64_t v40 = (uint64_t)a2;
    sub_25A840B74(&qword_26B32C3E0);
    sub_25A855960();
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v14, a1, v9);
    if (sub_25A83CAF0((uint64_t)v14, 1, a5) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v22, v14, a5);
      (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v19, v22, a5);
      sub_25A840B74(&qword_26B32C3E0);
      sub_25A855960();
      sub_25A855950();
      (*(void (**)(char *, uint64_t))(v15 + 8))(v22, a5);
      return;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v14, v9);
    if (MEMORY[0x261147510](a4 + 32))
    {
      uint64_t v27 = *(void *)(a4 + 40);
      uint64_t ObjectType = swift_getObjectType();
      LOBYTE(v40) = 2;
      uint64_t v29 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v27 + 24);
      uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
      v39[1] = v39;
      uint64_t v31 = *(void *)(AssociatedTypeWitness - 8);
      MEMORY[0x270FA5388](AssociatedTypeWitness, v32);
      uint64_t v34 = (char *)v39 - v33;
      swift_unknownObjectRetain();
      v29(&v40, ObjectType, v27);
      swift_getAssociatedConformanceWitness();
      uint64_t v35 = sub_25A855CA0();
      if (v35)
      {
        uint64_t v36 = v35;
        (*(void (**)(char *, uint64_t))(v31 + 8))(v34, AssociatedTypeWitness);
      }
      else
      {
        uint64_t v36 = swift_allocError();
        (*(void (**)(uint64_t, char *, uint64_t))(v31 + 32))(v38, v34, AssociatedTypeWitness);
      }
      swift_unknownObjectRelease_n();
    }
    else
    {
      sub_25A84AA60();
      uint64_t v36 = swift_allocError();
      *uint64_t v37 = 2;
    }
    uint64_t v40 = v36;
    sub_25A840B74(&qword_26B32C3E0);
    sub_25A855960();
  }
  sub_25A855940();
}

uint64_t sub_25A84E924()
{
  return BidirectionalXPCServiceClientConnection.getCurrentConnectionState()();
}

void sub_25A84E948(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  BidirectionalXPCServiceClientConnection.call<A>(_:)(a1, a2, a3, a4, a5, a6, a7, a8, v8, v9);
}

void sub_25A84E96C()
{
}

uint64_t sub_25A84E990(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_25A850128;
  return BidirectionalXPCServiceClientConnection.call<A>(_:)(a1, a2, a3, a4);
}

uint64_t ConnectionState.hash(into:)()
{
  return sub_25A855DA0();
}

uint64_t _s22ProactiveDaemonSupport15ConnectionStateO9hashValueSivg_0()
{
  return sub_25A855DC0();
}

unsigned char *sub_25A84EAE0@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_25A84EAEC()
{
}

id sub_25A84EB0C(void *a1)
{
  return sub_25A84D378(a1, *(void **)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 16), (void (*)(uint64_t))sub_25A84FDA0);
}

uint64_t sub_25A84EB44()
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

id sub_25A84EB84(void *a1)
{
  return sub_25A84D378(a1, *(void **)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 16), (void (*)(uint64_t))sub_25A8501C0);
}

uint64_t sub_25A84EBB8()
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 72, 7);
}

void sub_25A84EBF8(uint64_t a1, void *a2)
{
  sub_25A84D728(a1, a2, *(void *)(v2 + 56), *(void *)(v2 + 64));
}

uint64_t sub_25A84EC2C(uint64_t a1)
{
  return sub_25A84EC44(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_25A84DD00);
}

uint64_t sub_25A84EC44(uint64_t a1, uint64_t (*a2)(uint64_t, void, void, void, void, void))
{
  return a2(a1, v2[3], v2[4], v2[5], v2[6], v2[2]);
}

uint64_t sub_25A84EC5C(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 88);
}

uint64_t sub_25A84EC64(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 96);
}

uint64_t sub_25A84EC6C(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 104);
}

unint64_t sub_25A84EC78()
{
  unint64_t result = qword_26A469000;
  if (!qword_26A469000)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A469000);
  }
  return result;
}

unint64_t sub_25A84ECC8()
{
  unint64_t result = qword_26A469008;
  if (!qword_26A469008)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A469008);
  }
  return result;
}

uint64_t dispatch thunk of static XPCService.interface.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of static XPCService.entitlementName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of static XPCService.selectorClasses.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of static XPCService.logger.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of static XPCService.customize(serverInterface:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of ServiceConnectionProtocol.call<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

{
  return (*(uint64_t (**)(void))(a5 + 32))();
}

uint64_t dispatch thunk of ServiceConnectionProtocol.call<A>(_:)()
{
  sub_25A850390();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25A83FFE8;
  uint64_t v2 = sub_25A850350();
  return v3(v2);
}

uint64_t dispatch thunk of BidirectionalServiceConnectionProtocol.getCurrentConnectionState()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of BidirectionalServiceConnectionProtocol.call<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 48))();
}

{
  return (*(uint64_t (**)(void))(a5 + 56))();
}

uint64_t dispatch thunk of BidirectionalServiceConnectionProtocol.call<A>(_:)()
{
  sub_25A850390();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25A850128;
  uint64_t v2 = sub_25A850350();
  return v3(v2);
}

uint64_t sub_25A84F018()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for XPCServiceClientConnection()
{
  return sub_25A839718();
}

uint64_t method lookup function for XPCServiceClientConnection(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for XPCServiceClientConnection);
}

uint64_t dispatch thunk of XPCServiceClientConnection.__allocating_init(delegate:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of XPCServiceClientConnection.__allocating_init(remoteService:delegate:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of static XPCServiceClientConnectionDelegate.translateXPCServiceError(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of XPCServiceClientConnectionDelegate.xpcConnectionIsAllowed()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of XPCServiceClientConnectionDelegate.xpcConnectionWasInvalidated()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t sub_25A84F11C()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for BidirectionalXPCServiceClientConnection()
{
  return swift_getGenericMetadata();
}

uint64_t method lookup function for BidirectionalXPCServiceClientConnection(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for BidirectionalXPCServiceClientConnection);
}

uint64_t dispatch thunk of BidirectionalXPCServiceClientConnection.__allocating_init(existingConnection:localObject:delegate:)()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t dispatch thunk of BidirectionalXPCServiceClientConnection.__allocating_init(localObject:delegate:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of BidirectionalXPCServiceClientConnection.__allocating_init(remoteService:localObject:delegate:)()
{
  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of static BidirectionalXPCServiceClientConnectionDelegate.translateXPCServiceError(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of BidirectionalXPCServiceClientConnectionDelegate.xpcBidirectionalConnectionIsAllowed()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of BidirectionalXPCServiceClientConnectionDelegate.xpcBidirectionalConnectionWasInvalidated()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of InitializableFromExistingConnection.init(existingConnection:localObject:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t getEnumTagSinglePayload for ConnectionState(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFD)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v5 = v6 - 4;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for ConnectionState(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25A84F3F0);
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

ValueMetadata *type metadata accessor for ConnectionState()
{
  return &type metadata for ConnectionState;
}

uint64_t getEnumTagSinglePayload for XPCServiceError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFE)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v5 = v6 - 3;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for XPCServiceError(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 2;
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
        JUMPOUT(0x25A84F57CLL);
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
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for XPCServiceError()
{
  return &type metadata for XPCServiceError;
}

uint64_t sub_25A84F5B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 40);
}

uint64_t sub_25A84F5BC()
{
  return swift_unknownObjectWeakDestroy();
}

unsigned char *sub_25A84F5C4(unsigned char *a1, unsigned char *a2)
{
  *a1 = *a2;
  swift_unknownObjectWeakCopyInit();
  return a1;
}

unsigned char *sub_25A84F5F4(unsigned char *a1, unsigned char *a2)
{
  *a1 = *a2;
  swift_unknownObjectWeakCopyAssign();
  return a1;
}

unsigned char *sub_25A84F624(unsigned char *a1, unsigned char *a2)
{
  *a1 = *a2;
  swift_unknownObjectWeakTakeInit();
  return a1;
}

unsigned char *sub_25A84F654(unsigned char *a1, unsigned char *a2)
{
  *a1 = *a2;
  swift_unknownObjectWeakTakeAssign();
  return a1;
}

uint64_t sub_25A84F684(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFD && a1[16])
    {
      int v2 = *(_DWORD *)a1 + 252;
    }
    else
    {
      unsigned int v3 = *a1;
      BOOL v4 = v3 >= 4;
      int v2 = v3 - 4;
      if (!v4) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t sub_25A84F6C0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(void *)unint64_t result = a2 - 253;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(unsigned char *)unint64_t result = a2 + 3;
    }
  }
  return result;
}

uint64_t sub_25A84F700(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

void **sub_25A84F708(void **a1, void **a2)
{
  unsigned int v3 = *a2;
  *a1 = *a2;
  id v4 = v3;
  return a1;
}

void sub_25A84F738(id *a1)
{
}

void **sub_25A84F740(void **a1, void **a2)
{
  unsigned int v3 = *a1;
  id v4 = *a2;
  *a1 = *a2;
  id v5 = v4;

  return a1;
}

void *sub_25A84F778(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

void **sub_25A84F784(void **a1, void **a2)
{
  unsigned int v3 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t sub_25A84F7B8(uint64_t *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 8))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      uint64_t v3 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
        LODWORD(v3) = -1;
      }
      int v2 = v3 - 1;
      if (v2 < 0) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t sub_25A84F80C(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)unint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2;
    }
  }
  return result;
}

uint64_t sub_25A84F85C()
{
  sub_25A840B74(&qword_26B32C3E0);
  uint64_t v1 = sub_25A8504E4();
  sub_25A83CC2C();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (v6 + 64) & ~v6;
  uint64_t v8 = v7 + *(void *)(v5 + 64);
  uint64_t v9 = v6 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v7, v1);

  return MEMORY[0x270FA0238](v0, v8, v9);
}

uint64_t sub_25A84F918(void *a1)
{
  uint64_t v3 = *(NSObject **)(v1 + 32);
  sub_25A840B74(&qword_26B32C3E0);
  uint64_t v4 = sub_25A855960();
  sub_25A850280(v4);
  uint64_t v6 = *(uint64_t **)(v1 + 56);
  uint64_t v7 = v1 + ((*(unsigned __int8 *)(v5 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_25A84E038(a1, v6, v7, v3);
}

uint64_t sub_25A84F998()
{
  uint64_t v2 = *(void *)(v0 + 32);
  sub_25A840B74(&qword_26B32C3E0);
  sub_25A8504E4();
  sub_25A841040();
  uint64_t v3 = sub_25A8502FC();
  v4(v3);
  swift_release();

  return MEMORY[0x270FA0238](v0, v1, v2);
}

void sub_25A84FA2C()
{
  sub_25A8504A4();
  sub_25A840B74(&qword_26B32C3E0);
  uint64_t v0 = sub_25A855960();
  sub_25A83CC60(v0);
  uint64_t v1 = sub_25A8502D8();

  sub_25A84E448(v1, v2, v3, v4, v5);
}

uint64_t sub_25A84FAB8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *a1;
  *(_DWORD *)((char *)a1 + ((*(unsigned int *)(v2 + 48) + 3) & 0x1FFFFFFFCLL)) = 0;
  return (*(uint64_t (**)(uint64_t))(*(void *)(*(void *)(v2 + *MEMORY[0x263F8DD00]) - 8) + 16))(a2);
}

void sub_25A84FB4C(void (*a1)(uint64_t), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_25A84FBD8(a3 + *(void *)(*MEMORY[0x263F8DD00] + *(void *)a3 + 16), (os_unfair_lock_t)(a3 + ((*(unsigned int *)(*(void *)a3 + 48) + 3) & 0x1FFFFFFFCLL)), a1, a2, a4, a5, &v5);
}

void sub_25A84FBD8(uint64_t a1, os_unfair_lock_t lock, void (*a3)(uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  os_unfair_lock_lock(lock);
  a3(a1);
  os_unfair_lock_unlock(lock);
  if (v7) {
    *a7 = v7;
  }
}

uint64_t sub_25A84FC60()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25A84FC98()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_25A84FCD0()
{
  return sub_25A84FD00((void (*)(uint64_t))sub_25A84FD64);
}

uint64_t sub_25A84FCE8()
{
  return sub_25A84FD00((void (*)(uint64_t))sub_25A84FD28);
}

uint64_t sub_25A84FD00(void (*a1)(uint64_t))
{
  return sub_25A84C734(v1[6], v1[2], v1[3], v1[4], v1[5], a1);
}

#error "25A84FD58: call analysis failed (funcsize=14)"

#error "25A84FD94: call analysis failed (funcsize=14)"

unsigned char *sub_25A84FDA0(unsigned char *result)
{
  *unint64_t result = 3;
  return result;
}

uint64_t sub_25A84FDAC()
{
  sub_25A840B74(&qword_26B32C3E0);
  sub_25A8504E4();
  sub_25A841040();
  v1 += 8;
  uint64_t v2 = *(unsigned __int8 *)(v1 + 72);
  uint64_t v3 = ((v2 + 40) & ~v2) + *(void *)(v1 + 56);
  uint64_t v4 = v2 | 7;
  sub_25A850410();
  v5();

  return MEMORY[0x270FA0238](v0, v3, v4);
}

uint64_t sub_25A84FE44(void *a1)
{
  uint64_t v3 = v1[2];
  uint64_t v4 = v1[3];
  uint64_t v5 = v1[4];
  sub_25A840B74(&qword_26B32C3E0);
  uint64_t v6 = sub_25A855960();
  sub_25A850280(v6);
  uint64_t v8 = (uint64_t)v1 + ((*(unsigned __int8 *)(v7 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));

  return sub_25A84B298(a1, v8, v3, v4, v5);
}

uint64_t sub_25A84FED4()
{
  uint64_t v2 = *(void *)(v0 + 24);
  sub_25A840B74(&qword_26B32C3E0);
  sub_25A8504E4();
  sub_25A841040();
  uint64_t v3 = sub_25A8502FC();
  v4(v3);
  swift_release();

  return MEMORY[0x270FA0238](v0, v1, v2);
}

void sub_25A84FF68()
{
  sub_25A8504A4();
  sub_25A840B74(&qword_26B32C3E0);
  uint64_t v0 = sub_25A855960();
  sub_25A83CC60(v0);
  uint64_t v1 = sub_25A8502D8();

  sub_25A84B5D0(v1, v2, v3, v4, v5);
}

uint64_t sub_25A84FFF4()
{
  return sub_25A8498BC(v0[4], v0[2], v0[3], (void (*)(uint64_t))sub_25A8500B0);
}

uint64_t sub_25A850028()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_25A850060()
{
  return sub_25A8498BC(v0[4], v0[2], v0[3], (void (*)(uint64_t))sub_25A850094);
}

void sub_25A850094(id *a1)
{
  sub_25A8499E4(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_25A8500B0(uint64_t a1)
{
  return sub_25A849670(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_25A8500CC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_25A84FAB8(a1, a2);
}

uint64_t sub_25A8500F4(unsigned char *a1)
{
  return sub_25A84BDB8(a1);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> BidirectionalXPCServiceClientConnectionDelegate.xpcBidirectionalConnectionIsAllowed()()
{
}

void sub_25A850168()
{
}

void sub_25A850180()
{
}

unsigned char *sub_25A8501C0(unsigned char *a1)
{
  return sub_25A84FDA0(a1);
}

uint64_t sub_25A850220()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_25A850240()
{
  return v0;
}

uint64_t sub_25A850280(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_25A850294(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t _s22ProactiveDaemonSupport10XPCServicePAAE15entitlementNameSSvgZ_0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_25A8502C0()
{
  return swift_allocError();
}

uint64_t sub_25A8502D8()
{
  return v0;
}

uint64_t sub_25A8502FC()
{
  return v1 + v0;
}

uint64_t sub_25A850320()
{
  return swift_allocObject();
}

uint64_t sub_25A850350()
{
  return v0;
}

uint64_t sub_25A850374(uint64_t a1)
{
  return MEMORY[0x270FA2498](a1, 0, 0);
}

uint64_t sub_25A8503B0()
{
  return v0;
}

void sub_25A8503CC()
{
  *(unsigned char *)(v1 - 65) = 2;
  *(void *)(v1 - 232) = *(void *)(v0 + 24);
}

uint64_t sub_25A8503F4()
{
  return v0 - 65;
}

uint64_t sub_25A850428()
{
  return swift_allocObject();
}

uint64_t sub_25A850440()
{
  return v0;
}

uint64_t sub_25A850450()
{
  return v0 - 65;
}

uint64_t sub_25A850480()
{
  return v0;
}

uint64_t sub_25A8504C4()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t sub_25A8504E4()
{
  return sub_25A855960();
}

uint64_t sub_25A8504FC()
{
  return swift_unknownObjectRelease_n();
}

uint64_t sub_25A850528()
{
  return swift_unknownObjectRelease_n();
}

uint64_t sub_25A85054C()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t sub_25A85056C()
{
  return sub_25A855CA0();
}

void static XPCServiceBidirectionalServer.start()(uint64_t a1, uint64_t a2)
{
  sub_25A855700();
  sub_25A83CC2C();
  uint64_t v30 = v5;
  id v31 = v4;
  MEMORY[0x270FA5388](v4, v6);
  uint64_t v29 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25A852DE8();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v9 = sub_25A852E64();
  if (v10(v9, AssociatedConformanceWitness))
  {
    id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08D88]), sel_init);
    sub_25A852DE8();
    sub_25A852DA0();
    sub_25A852E3C();
    swift_getAssociatedConformanceWitness();
    sub_25A850498();
    v12();
    unint64_t v14 = v13;
    uint64_t v15 = (void *)sub_25A8558A0();
    swift_bridgeObjectRelease();
    objc_msgSend(v11, sel__initWithRemoteName_, v15);
  }
  else
  {
    unint64_t v16 = sub_25A850950();
    sub_25A852DE8();
    sub_25A852DA0();
    sub_25A852E3C();
    swift_getAssociatedConformanceWitness();
    sub_25A850498();
    v17();
    unint64_t v14 = v16;
    sub_25A850990();
  }
  sub_25A852EEC();
  v18();
  uint64_t v19 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a2 + 48))(a1, a2);
  if (v19)
  {
    id v31 = v19;
    type metadata accessor for BidirectionalDelegate();
    sub_25A850A04();
    sub_25A852EEC();
    v20();
    uint64_t v21 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 72))(a1, a2);
    objc_msgSend(v31, sel_setDelegate_, v21);
    swift_unknownObjectRelease();
    objc_msgSend(v31, sel_activate);
    id v22 = v31;
  }
  else
  {
    sub_25A852DE8();
    sub_25A852DA0();
    swift_getAssociatedConformanceWitness();
    uint64_t v23 = swift_getAssociatedConformanceWitness();
    uint64_t v24 = v29;
    (*(void (**)(unint64_t, uint64_t))(v23 + 48))(v14, v23);
    os_log_t v25 = sub_25A8556F0();
    os_log_type_t v26 = sub_25A8559D0();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v27 = 0;
      _os_log_impl(&dword_25A837000, v25, v26, "Failed to create Internal XPC service", v27, 2u);
      sub_25A8487B0();
    }

    (*(void (**)(char *, id))(v30 + 8))(v24, v31);
  }
}

unint64_t sub_25A850950()
{
  unint64_t result = qword_26B32C420;
  if (!qword_26B32C420)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B32C420);
  }
  return result;
}

id sub_25A850990()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v1 = (void *)sub_25A8558A0();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithMachServiceName_, v1);

  return v2;
}

id sub_25A850A04()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

uint64_t XPCServiceBidirectionalServerInstanceParameters.clientApplicationIdentifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t static XPCServiceBidirectionalServerInstance.serviceEntitlementRequired.getter()
{
  return 1;
}

uint64_t static XPCServiceBidirectionalServerInstance.useRemoteXPC.getter()
{
  return 0;
}

uint64_t sub_25A850A7C()
{
  sub_25A852E70();
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v2 = sub_25A852F14();
  sub_25A852F34();
  uint64_t v3 = sub_25A852E04();
  if (v4(v3)) {
    return 0;
  }
  else {
    return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 40))(v2, v1) & 1;
  }
}

uint64_t sub_25A850B2C()
{
  sub_25A852E70();
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v2 = sub_25A852F14();
  sub_25A852F34();
  uint64_t v3 = sub_25A852E04();
  if (v4(v3)) {
    return 0;
  }
  else {
    return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 32))(v2, v1) & 1;
  }
}

uint64_t sub_25A850BDC(uint64_t a1, void *a2)
{
  id v168 = a2;
  sub_25A852E70();
  uint64_t v4 = *(void *)(v3 + 88);
  uint64_t v162 = v2;
  uint64_t v6 = *(void *)(v5 + 80);
  swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v9 = sub_25A855A90();
  MEMORY[0x270FA5388](v9 - 8, v10);
  v152 = (char *)v147 - v11;
  uint64_t v12 = swift_checkMetadataState();
  sub_25A83CC2C();
  uint64_t v154 = v13;
  MEMORY[0x270FA5388](v14, v15);
  sub_25A852ED8();
  sub_25A852D90();
  MEMORY[0x270FA5388](v16, v17);
  v151 = (char *)v147 - v18;
  uint64_t v150 = sub_25A855A90();
  sub_25A83CC2C();
  uint64_t v149 = v19;
  MEMORY[0x270FA5388](v20, v21);
  uint64_t v23 = (char *)v147 - v22;
  uint64_t v24 = sub_25A855700();
  sub_25A83CC2C();
  uint64_t v169 = v25;
  MEMORY[0x270FA5388](v26, v27);
  sub_25A852ED8();
  sub_25A852D90();
  MEMORY[0x270FA5388](v28, v29);
  sub_25A852E90();
  sub_25A852D90();
  MEMORY[0x270FA5388](v30, v31);
  sub_25A852E90();
  sub_25A852D90();
  MEMORY[0x270FA5388](v32, v33);
  sub_25A852E90();
  sub_25A852D90();
  MEMORY[0x270FA5388](v34, v35);
  sub_25A852E90();
  sub_25A852D90();
  MEMORY[0x270FA5388](v36, v37);
  sub_25A852E90();
  sub_25A852D90();
  MEMORY[0x270FA5388](v38, v39);
  uint64_t v160 = v4;
  uint64_t v159 = v6;
  uint64_t v40 = swift_getAssociatedTypeWitness();
  uint64_t v161 = AssociatedConformanceWitness;
  uint64_t v163 = v12;
  uint64_t v148 = swift_getAssociatedConformanceWitness();
  uint64_t v153 = AssociatedTypeWitness;
  uint64_t v41 = swift_getAssociatedConformanceWitness();
  uint64_t v42 = *(void (**)(void, void))(v41 + 48);
  uint64_t v166 = v41 + 48;
  v165 = v42;
  v42(v40, v41);
  uint64_t v43 = sub_25A8556F0();
  os_log_type_t v44 = sub_25A8559E0();
  BOOL v45 = os_log_type_enabled(v43, v44);
  uint64_t v170 = v41;
  uint64_t v164 = v40;
  v156 = v23;
  if (v45)
  {
    uint64_t v46 = (uint8_t *)sub_25A852E9C();
    uint64_t v47 = sub_25A852F54();
    uint64_t v157 = v24;
    *(_DWORD *)uint64_t v46 = 136446210;
    *(void *)&long long aBlock = v47;
    sub_25A850498();
    uint64_t v49 = v48();
    uint64_t v51 = sub_25A852E24(v49, v50);
    sub_25A852F00(v51);
    uint64_t v52 = v157;
    sub_25A855AA0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25A837000, v43, v44, "%{public}s BidirectionalDelegate: Got connection request.", v46, 0xCu);
    swift_arrayDestroy();
    sub_25A8487B0();
    sub_25A8487B0();

    sub_25A852EB8();
    v53();
  }
  else
  {

    sub_25A852EB8();
    v54();
    uint64_t v52 = v24;
  }
  swift_beginAccess();
  os_log_t v55 = (uint64_t (*)(id, uint64_t, uint64_t))off_26B32C190;
  uint64_t v56 = v164;
  uint64_t v57 = v170;
  id v58 = v168;
  if (off_26B32C190)
  {
    swift_retain();
    char v59 = v55(v58, v56, v57);
    sub_25A852BB4((uint64_t)v55);
    if ((v59 & 1) == 0)
    {
      sub_25A852D74();
      v71();
      unint64_t v72 = sub_25A8556F0();
      os_log_type_t v73 = sub_25A8559E0();
      if (os_log_type_enabled(v72, v73))
      {
        uint64_t v74 = (uint8_t *)sub_25A852E9C();
        uint64_t v75 = sub_25A852F54();
        *(_DWORD *)uint64_t v74 = 136446210;
        *(void *)&long long aBlock = v75;
        sub_25A850498();
        uint64_t v77 = v76();
        uint64_t v79 = sub_25A852E24(v77, v78);
        sub_25A852F00(v79);
        sub_25A855AA0();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25A837000, v72, v73, "%{public}s BidirectionalDelegate: Failed global enablement check. Rejecting connection.", v74, 0xCu);
        swift_arrayDestroy();
        sub_25A8487B0();
        sub_25A8487B0();
      }

      sub_25A852DDC();
      sub_25A852DC8();
      v82();
      return 0;
    }
  }
  if (sub_25A850A7C())
  {
    sub_25A850498();
    uint64_t v61 = v60();
    unint64_t v63 = v62;
    uint64_t v64 = (*(uint64_t (**)(uint64_t, uint64_t))(v57 + 32))(v56, v57);
    unint64_t v66 = v65;
    sub_25A852D74();
    v67();
    LOBYTE(v61) = sub_25A8533E8(v61, v63, v64, v66);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_25A852DDC();
    sub_25A852DC8();
    v68();
    if ((v61 & 1) == 0) {
      return 0;
    }
  }
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  id v69 = static XPCService.xpcInterface()();
  objc_msgSend(v58, sel_setRemoteObjectInterface_, v69);

  id v70 = static XPCService.xpcInterface()();
  objc_msgSend(v58, sel_setExportedInterface_, v70);

  if ((*(uint64_t (**)(void))(v161 + 48))())
  {
    memset(v177, 0, sizeof(v177));
  }
  else
  {
    uint64_t v80 = (void *)sub_25A8558A0();
    id v81 = objc_msgSend(v58, sel_valueForEntitlement_, v80);

    if (v81)
    {
      sub_25A855AC0();
      swift_unknownObjectRelease();
    }
    else
    {
      long long aBlock = 0u;
      long long v174 = 0u;
    }
    sub_25A852BC4((uint64_t)&aBlock, (uint64_t)v177);
  }
  sub_25A852C2C((uint64_t)v177, (uint64_t)&aBlock);
  if (*((void *)&v174 + 1))
  {
    if (swift_dynamicCast())
    {
      uint64_t v83 = v52;
      uint64_t v85 = v171;
      unint64_t v84 = v172;
      uint64_t v86 = v155;
      sub_25A852E64();
      sub_25A852D74();
      v87();
      swift_bridgeObjectRetain_n();
      uint64_t v88 = sub_25A8556F0();
      os_log_type_t v89 = sub_25A8559E0();
      if (os_log_type_enabled(v88, v89))
      {
        uint64_t v90 = swift_slowAlloc();
        uint64_t v162 = swift_slowAlloc();
        *(void *)&long long aBlock = v162;
        *(_DWORD *)uint64_t v90 = 136446466;
        sub_25A850498();
        uint64_t v92 = v91();
        uint64_t v94 = sub_25A852E24(v92, v93);
        sub_25A852ECC(v94);
        sub_25A855AA0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v90 + 12) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v171 = sub_25A8415AC(v85, v84, (uint64_t *)&aBlock);
        uint64_t v95 = v167;
        sub_25A855AA0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_25A837000, v88, v89, "%{public}s BidirectionalDelegate: clientApplicationIdentifier: %s", (uint8_t *)v90, 0x16u);
        swift_arrayDestroy();
        sub_25A8487B0();
        sub_25A8487B0();

        uint64_t v52 = v83;
        sub_25A852DDC();
        v95(v155, v83);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        sub_25A852DDC();
        uint64_t v52 = v83;
        v167(v86, v83);
      }
      goto LABEL_27;
    }
  }
  else
  {
    sub_25A852C94((uint64_t)&aBlock);
  }
  if (sub_25A850B2C())
  {
    uint64_t v96 = v52;
    sub_25A852E64();
    sub_25A852D74();
    v97();
    v98 = sub_25A8556F0();
    os_log_type_t v99 = sub_25A8559C0();
    if (os_log_type_enabled(v98, v99))
    {
      uint64_t v100 = swift_slowAlloc();
      *(void *)&long long aBlock = swift_slowAlloc();
      *(_DWORD *)uint64_t v100 = 136446466;
      uint64_t v157 = v96;
      sub_25A852E64();
      sub_25A850498();
      uint64_t v102 = v101();
      uint64_t v104 = sub_25A852E24(v102, v103);
      sub_25A852ECC(v104);
      sub_25A855AA0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v100 + 12) = 2082;
      uint64_t v171 = sub_25A8415AC(0xD000000000000016, 0x800000025A856FC0, (uint64_t *)&aBlock);
      sub_25A855AA0();
      _os_log_impl(&dword_25A837000, v98, v99, "%{public}s BidirectionalDelegate: Client is missing '%{public}s' entitlement. This entitlement is required. Rejecting connection.", (uint8_t *)v100, 0x16u);
      swift_arrayDestroy();
      sub_25A8487B0();
      sub_25A8487B0();

      sub_25A852E80();
LABEL_31:
      sub_25A852DC8();
      v122();
      sub_25A852C94((uint64_t)v177);
      return 0;
    }
LABEL_30:

    sub_25A852E80();
    goto LABEL_31;
  }
  uint64_t v85 = 0;
  unint64_t v84 = 0;
LABEL_27:
  uint64_t v105 = v163;
  v106 = (void *)swift_allocBox();
  uint64_t v108 = v107;
  *(void *)&long long aBlock = v85;
  *((void *)&aBlock + 1) = v84;
  uint64_t v109 = v161;
  v110 = *(void (**)(long long *, id, uint64_t, uint64_t))(v161 + 24);
  id v111 = v168;
  uint64_t v112 = (uint64_t)v156;
  v110(&aBlock, v111, v105, v109);
  uint64_t v113 = v112;
  if (sub_25A83CAF0(v112, 1, v105) == 1)
  {
    (*(void (**)(uint64_t, uint64_t))(v149 + 8))(v112, v150);
    swift_deallocBox();
    sub_25A852D74();
    v114();
    v98 = sub_25A8556F0();
    os_log_type_t v115 = sub_25A8559C0();
    if (os_log_type_enabled(v98, v115))
    {
      v116 = (uint8_t *)sub_25A852E9C();
      uint64_t v117 = sub_25A852F54();
      *(_DWORD *)v116 = 136446210;
      *(void *)&long long aBlock = v117;
      sub_25A850498();
      uint64_t v119 = v118();
      uint64_t v121 = sub_25A852E24(v119, v120);
      sub_25A852ECC(v121);
      sub_25A855AA0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25A837000, v98, v115, "%{public}s BidirectionalDelegate: connection rejected by server instance.", v116, 0xCu);
      swift_arrayDestroy();
      sub_25A8487B0();
      sub_25A8487B0();

      sub_25A852E80();
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  id v168 = v106;
  uint64_t v157 = v52;
  uint64_t v123 = v154;
  uint64_t v124 = v113;
  uint64_t v125 = v163;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v154 + 32))(v108, v124, v163);
  v126 = *(void (**)(void, uint64_t, uint64_t))(v123 + 16);
  uint64_t v162 = v108;
  v158 = v126;
  v126(v151, v108, v125);
  swift_getAssociatedTypeWitness();
  if (swift_dynamicCast())
  {
    uint64_t v127 = aBlock;
    uint64_t v128 = v148;
    v129 = *(void (**)(id, uint64_t, uint64_t, uint64_t))(v148 + 24);
    id v130 = v111;
    swift_unknownObjectRetain();
    uint64_t v131 = (uint64_t)v152;
    uint64_t v132 = v153;
    v129(v130, v127, v153, v128);
    uint64_t v133 = 1;
    sub_25A83B6E8(v131, 0, 1, v132);
    v134 = v130;
    uint64_t v135 = v163;
    (*(void (**)(uint64_t, uint64_t))(v161 + 64))(v131, v163);
    v136 = (void *)swift_allocObject();
    uint64_t v137 = v159;
    uint64_t v138 = v160;
    v136[2] = v159;
    v136[3] = v138;
    id v139 = v168;
    v136[4] = v168;
    v175 = sub_25A852D2C;
    v176 = v136;
    *(void *)&long long aBlock = MEMORY[0x263EF8330];
    *((void *)&aBlock + 1) = 1107296256;
    uint64_t v170 = v127;
    *(void *)&long long v174 = sub_25A8533A4;
    *((void *)&v174 + 1) = &unk_270860560;
    v140 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v134, sel_setInterruptionHandler_, v140);
    _Block_release(v140);
    v141 = (void *)swift_allocObject();
    v141[2] = v137;
    v141[3] = v138;
    v141[4] = v139;
    v175 = sub_25A852D50;
    v176 = v141;
    *(void *)&long long aBlock = MEMORY[0x263EF8330];
    *((void *)&aBlock + 1) = 1107296256;
    *(void *)&long long v174 = sub_25A8533A4;
    *((void *)&v174 + 1) = &unk_2708606C8;
    v142 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v134, sel_setInvalidationHandler_, v142);
    _Block_release(v142);
    uint64_t v143 = v162;
    swift_beginAccess();
    uint64_t v144 = v147[0];
    v158(v147[0], v143, v135);
    uint64_t v145 = sub_25A855CC0();
    (*(void (**)(uint64_t, uint64_t))(v154 + 8))(v144, v135);
    objc_msgSend(v134, sel_setExportedObject_, v145);
    swift_unknownObjectRelease();
    objc_msgSend(v134, sel_activate);
    swift_unknownObjectRelease();
    sub_25A852C94((uint64_t)v177);
    swift_release();
    return v133;
  }
  uint64_t result = sub_25A855C10();
  __break(1u);
  return result;
}

uint64_t sub_25A85200C()
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v1 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness, v2);
  uint64_t v4 = (char *)v23 - v3;
  uint64_t v29 = sub_25A855700();
  uint64_t v27 = *(void *)(v29 - 8);
  MEMORY[0x270FA5388](v29, v5);
  uint64_t v7 = (char *)v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = swift_projectBox();
  uint64_t v8 = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v10 = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t, uint64_t))(v10 + 48))(v8, v10);
  uint64_t v11 = sub_25A8556F0();
  os_log_type_t v12 = sub_25A8559C0();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v24 = AssociatedConformanceWitness;
    uint64_t v14 = (uint8_t *)v13;
    uint64_t v15 = swift_slowAlloc();
    uint64_t v26 = v1;
    uint64_t v16 = v15;
    uint64_t v25 = v4;
    *(_DWORD *)uint64_t v14 = 136446210;
    v31[0] = v15;
    v23[1] = v14 + 4;
    uint64_t v17 = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 24))(v8, v10);
    uint64_t v30 = sub_25A8415AC(v17, v18, v31);
    uint64_t v4 = v25;
    sub_25A855AA0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25A837000, v11, v12, "%{public}s BidirectionalDelegate: connection interrupted.", v14, 0xCu);
    swift_arrayDestroy();
    uint64_t v19 = v16;
    uint64_t v1 = v26;
    MEMORY[0x261147430](v19, -1, -1);
    uint64_t v20 = v14;
    uint64_t AssociatedConformanceWitness = v24;
    MEMORY[0x261147430](v20, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v27 + 8))(v7, v29);
  uint64_t v21 = v28;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v4, v21, AssociatedTypeWitness);
  (*(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 80))(AssociatedTypeWitness, AssociatedConformanceWitness);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v4, AssociatedTypeWitness);
}

uint64_t sub_25A8523F0()
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v1 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness, v2);
  uint64_t v4 = (char *)v23 - v3;
  uint64_t v29 = sub_25A855700();
  uint64_t v27 = *(void *)(v29 - 8);
  MEMORY[0x270FA5388](v29, v5);
  uint64_t v7 = (char *)v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = swift_projectBox();
  uint64_t v8 = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v10 = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t, uint64_t))(v10 + 48))(v8, v10);
  uint64_t v11 = sub_25A8556F0();
  os_log_type_t v12 = sub_25A8559E0();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v24 = AssociatedConformanceWitness;
    uint64_t v14 = (uint8_t *)v13;
    uint64_t v15 = swift_slowAlloc();
    uint64_t v26 = v1;
    uint64_t v16 = v15;
    uint64_t v25 = v4;
    *(_DWORD *)uint64_t v14 = 136446210;
    v31[0] = v15;
    v23[1] = v14 + 4;
    uint64_t v17 = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 24))(v8, v10);
    uint64_t v30 = sub_25A8415AC(v17, v18, v31);
    uint64_t v4 = v25;
    sub_25A855AA0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25A837000, v11, v12, "%{public}s BidirectionalDelegate: connection invalidated.", v14, 0xCu);
    swift_arrayDestroy();
    uint64_t v19 = v16;
    uint64_t v1 = v26;
    MEMORY[0x261147430](v19, -1, -1);
    uint64_t v20 = v14;
    uint64_t AssociatedConformanceWitness = v24;
    MEMORY[0x261147430](v20, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v27 + 8))(v7, v29);
  uint64_t v21 = v28;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v4, v21, AssociatedTypeWitness);
  (*(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 88))(AssociatedTypeWitness, AssociatedConformanceWitness);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v4, AssociatedTypeWitness);
}

uint64_t sub_25A8527D4(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = a1;
  char v9 = sub_25A850BDC((uint64_t)v8, v7);

  return v9 & 1;
}

id sub_25A852834()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id sub_25A85286C()
{
  return sub_25A852834();
}

id sub_25A852890()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for BidirectionalDelegate()
{
  return sub_25A839718();
}

uint64_t dispatch thunk of static XPCServiceBidirectionalServer.listener.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of static XPCServiceBidirectionalServer.listener.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of static XPCServiceBidirectionalServer.listener.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of static XPCServiceBidirectionalServer.delegate.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of static XPCServiceBidirectionalServer.delegate.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 80))();
}

uint64_t dispatch thunk of static XPCServiceBidirectionalServer.delegate.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 88))();
}

void *initializeBufferWithCopyOfBuffer for XPCServiceBidirectionalServerInstanceParameters(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for XPCServiceBidirectionalServerInstanceParameters()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for XPCServiceBidirectionalServerInstanceParameters(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for XPCServiceBidirectionalServerInstanceParameters(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for XPCServiceBidirectionalServerInstanceParameters(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for XPCServiceBidirectionalServerInstanceParameters(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 16))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      unint64_t v3 = *(void *)(a1 + 8);
      if (v3 >= 0xFFFFFFFF) {
        LODWORD(v3) = -1;
      }
      int v2 = v3 - 1;
      if (v2 < 0) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for XPCServiceBidirectionalServerInstanceParameters(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for XPCServiceBidirectionalServerInstanceParameters()
{
  return &type metadata for XPCServiceBidirectionalServerInstanceParameters;
}

uint64_t dispatch thunk of XPCServiceBidirectionalServerInstance.init(parameters:connection:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of static XPCServiceBidirectionalServerInstance.clientApplicationIdentifierEntitlementRequired.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of static XPCServiceBidirectionalServerInstance.serviceEntitlementRequired.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of static XPCServiceBidirectionalServerInstance.useRemoteXPC.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of XPCServiceBidirectionalServerInstance.clientProxy.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of XPCServiceBidirectionalServerInstance.clientProxy.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of XPCServiceBidirectionalServerInstance.clientProxy.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t dispatch thunk of XPCServiceBidirectionalServerInstance.xpcConnectionWasInterrupted()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t dispatch thunk of XPCServiceBidirectionalServerInstance.xpcConnectionWasInvalidated()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 88))();
}

uint64_t sub_25A852B7C()
{
  return swift_initClassMetadata2();
}

uint64_t sub_25A852BB4(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_25A852BC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A839A24(qword_26B32C348);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25A852C2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A839A24(qword_26B32C348);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25A852C94(uint64_t a1)
{
  uint64_t v2 = sub_25A839A24(qword_26B32C348);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25A852CF4()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_25A852D2C()
{
  return sub_25A85200C();
}

uint64_t sub_25A852D38(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_25A852D48()
{
  return swift_release();
}

uint64_t sub_25A852D50()
{
  return sub_25A8523F0();
}

void sub_25A852D90()
{
  *(void *)(v1 - 256) = v0;
}

uint64_t sub_25A852DA0()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t sub_25A852DE8()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t sub_25A852E04()
{
  return v0;
}

uint64_t sub_25A852E24(uint64_t a1, unint64_t a2)
{
  return sub_25A8415AC(a1, a2, (uint64_t *)(v2 - 224));
}

uint64_t sub_25A852E3C()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t sub_25A852E64()
{
  return v0;
}

uint64_t sub_25A852E80()
{
  return v0;
}

uint64_t sub_25A852E9C()
{
  return swift_slowAlloc();
}

void sub_25A852EB8()
{
  *(void *)(v1 - 272) = v0;
}

uint64_t sub_25A852ECC(uint64_t result)
{
  *(void *)(v1 - 240) = result;
  return result;
}

uint64_t sub_25A852F00(uint64_t a1)
{
  *(void *)(v1 - 160) = a1;
  return v1 - 160;
}

uint64_t sub_25A852F14()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t sub_25A852F34()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t sub_25A852F54()
{
  return swift_slowAlloc();
}

uint64_t static XPCServiceFrameworkGlobals.globalConnectionPolicy.getter()
{
  swift_beginAccess();
  uint64_t v0 = sub_25A853398();
  sub_25A852FBC(v0);
  return sub_25A853398();
}

uint64_t sub_25A852FBC(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t static XPCServiceFrameworkGlobals.globalConnectionPolicy.setter(void *a1, uint64_t a2)
{
  swift_beginAccess();
  uint64_t v4 = off_26B32C190;
  off_26B32C190 = a1;
  qword_26B32C198 = a2;
  return sub_25A852BB4((uint64_t)v4);
}

uint64_t (*static XPCServiceFrameworkGlobals.globalConnectionPolicy.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_25A85307C()
{
  uint64_t v0 = sub_25A839A24(&qword_26B32C340);
  sub_25A853330(v0, qword_26B32C168);
  uint64_t v1 = sub_25A8474A0(v0, (uint64_t)qword_26B32C168);
  uint64_t v2 = sub_25A855700();

  return sub_25A83B6E8(v1, 1, 1, v2);
}

uint64_t static XPCServiceFrameworkGlobals.xpcObjectLogging.getter()
{
  if (qword_26B32C188 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_25A839A24(&qword_26B32C340);
  sub_25A8474A0(v0, (uint64_t)qword_26B32C168);
  swift_beginAccess();
  uint64_t v1 = sub_25A853398();
  return sub_25A8414E4(v1, v2);
}

uint64_t static XPCServiceFrameworkGlobals.xpcObjectLogging.setter(uint64_t a1)
{
  if (qword_26B32C188 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25A839A24(&qword_26B32C340);
  uint64_t v3 = sub_25A8474A0(v2, (uint64_t)qword_26B32C168);
  swift_beginAccess();
  sub_25A85321C(a1, v3);
  swift_endAccess();
  return sub_25A84154C(a1);
}

uint64_t sub_25A85321C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A839A24(&qword_26B32C340);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t (*static XPCServiceFrameworkGlobals.xpcObjectLogging.modify())()
{
  if (qword_26B32C188 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_25A839A24(&qword_26B32C340);
  sub_25A8474A0(v0, (uint64_t)qword_26B32C168);
  swift_beginAccess();
  return j__swift_endAccess;
}

ValueMetadata *type metadata accessor for XPCServiceFrameworkGlobals()
{
  return &type metadata for XPCServiceFrameworkGlobals;
}

uint64_t *sub_25A853330(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_25A853398()
{
  return v0;
}

uint64_t sub_25A8533A4(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_25A8533E8(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  char v9 = (void *)sub_25A8558A0();
  id v10 = objc_msgSend(v4, sel_valueForEntitlement_, v9);

  if (v10)
  {
    sub_25A855AC0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v25, 0, sizeof(v25));
  }
  sub_25A852BC4((uint64_t)v25, (uint64_t)v26);
  if (v26[3])
  {
    if swift_dynamicCast() && (v24)
    {
      swift_bridgeObjectRetain_n();
      id v11 = v4;
      os_log_type_t v12 = sub_25A8556F0();
      os_log_type_t v13 = sub_25A8559E0();
      if (os_log_type_enabled(v12, v13))
      {
        uint64_t v14 = swift_slowAlloc();
        v26[0] = sub_25A852F54();
        *(_DWORD *)uint64_t v14 = 136446466;
        swift_bridgeObjectRetain();
        *(void *)&v25[0] = sub_25A8415AC(a1, a2, v26);
        sub_25A855AA0();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v14 + 12) = 1026;
        unsigned int v15 = objc_msgSend(v11, sel_processIdentifier);

        LODWORD(v25[0]) = v15;
        sub_25A855AA0();

        _os_log_impl(&dword_25A837000, v12, v13, "%{public}s Delegate: XPC connection for service from %{public}d", (uint8_t *)v14, 0x12u);
        uint64_t v16 = 1;
        swift_arrayDestroy();
        sub_25A8487B0();
        sub_25A8487B0();
      }
      else
      {
        swift_bridgeObjectRelease_n();

        return 1;
      }
      return v16;
    }
  }
  else
  {
    sub_25A852C94((uint64_t)v26);
  }
  swift_bridgeObjectRetain_n();
  id v17 = v4;
  swift_bridgeObjectRetain_n();
  id v18 = v17;
  uint64_t v19 = sub_25A8556F0();
  os_log_type_t v20 = sub_25A8559C0();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = swift_slowAlloc();
    v26[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v21 = 136446722;
    swift_bridgeObjectRetain();
    *(void *)&v25[0] = sub_25A8415AC(a1, a2, v26);
    sub_25A855AA0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v21 + 12) = 1026;
    unsigned int v22 = objc_msgSend(v18, sel_processIdentifier);

    LODWORD(v25[0]) = v22;
    sub_25A855AA0();

    *(_WORD *)(v21 + 18) = 2082;
    swift_bridgeObjectRetain();
    *(void *)&v25[0] = sub_25A8415AC(a3, a4, v26);
    sub_25A855AA0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25A837000, v19, v20, "%{public}s Delegate: Rejecting connection from %{public}d: lacking entitlement '%{public}s'", (uint8_t *)v21, 0x1Cu);
    swift_arrayDestroy();
    sub_25A8487B0();
    sub_25A8487B0();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  return 0;
}

uint64_t XPCServiceServerInstanceParameters.clientApplicationIdentifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t static XPCServiceServerInstance.serviceEntitlementRequired.getter()
{
  return 1;
}

uint64_t static XPCServiceServerInstance.useRemoteXPC.getter()
{
  return 0;
}

void static XPCServiceServer.start()(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A855700();
  sub_25A839748();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7, v8);
  id v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_25A855580();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  if ((*(uint64_t (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 32))(v11, AssociatedConformanceWitness))
  {
    id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08D88]), sel_init);
    sub_25A855580();
    sub_25A855534();
    sub_25A850498();
    v14();
    unsigned int v15 = (void *)sub_25A8558A0();
    swift_bridgeObjectRelease();
    id v16 = objc_msgSend(v13, sel__initWithRemoteName_, v15);
  }
  else
  {
    sub_25A850950();
    sub_25A855580();
    sub_25A855534();
    sub_25A850498();
    v17();
    id v16 = sub_25A850990();
  }
  sub_25A852EEC();
  v18();
  uint64_t v19 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a2 + 40))(a1, a2);
  if (v19)
  {
    id v28 = v19;
    type metadata accessor for Delegate();
    sub_25A850A04();
    sub_25A852EEC();
    v20();
    uint64_t v21 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 64))(a1, a2);
    objc_msgSend(v28, sel_setDelegate_, v21);
    swift_unknownObjectRelease();
    objc_msgSend(v28, sel_activate);
    id v22 = v28;
  }
  else
  {
    sub_25A855580();
    uint64_t v23 = sub_25A855534();
    (*(void (**)(id, uint64_t))(v23 + 48))(v16, v23);
    char v24 = sub_25A8556F0();
    os_log_type_t v25 = sub_25A8559D0();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v26 = 0;
      _os_log_impl(&dword_25A837000, v24, v25, "Failed to create Internal XPC service", v26, 2u);
      sub_25A8487B0();
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v10, v4);
  }
}

uint64_t sub_25A853B8C()
{
  sub_25A852E70();
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v2 = sub_25A852F14();
  sub_25A852F34();
  uint64_t v3 = sub_25A85559C();
  if (v4(v3)) {
    return 0;
  }
  else {
    return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 24))(v2, v1) & 1;
  }
}

uint64_t sub_25A853C3C()
{
  sub_25A852E70();
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v2 = sub_25A852F14();
  sub_25A852F34();
  uint64_t v3 = sub_25A85559C();
  if (v4(v3)) {
    return 0;
  }
  else {
    return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 16))(v2, v1) & 1;
  }
}

uint64_t sub_25A853CEC(uint64_t a1, void (*a2)(char *, uint64_t, uint64_t))
{
  v142 = a2;
  sub_25A852E70();
  uint64_t v4 = *(void *)(v3 + 88);
  uint64_t v137 = v2;
  uint64_t v6 = *(void *)(v5 + 80);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v129 = sub_25A855A90();
  sub_25A839748();
  uint64_t v128 = v8;
  MEMORY[0x270FA5388](v9, v10);
  uint64_t v133 = (char *)v127 - v11;
  sub_25A839748();
  uint64_t v131 = v12;
  uint64_t v15 = MEMORY[0x270FA5388](v13, v14);
  id v130 = (char *)v127 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v127[2] = v16;
  MEMORY[0x270FA5388](v15, v17);
  uint64_t v132 = (char *)v127 - v18;
  uint64_t v143 = (void (*)(void, void, void))sub_25A855700();
  sub_25A839748();
  uint64_t v20 = v19;
  MEMORY[0x270FA5388](v21, v22);
  sub_25A852D90();
  MEMORY[0x270FA5388](v23, v24);
  sub_25A852E90();
  sub_25A852D90();
  MEMORY[0x270FA5388](v25, v26);
  sub_25A852E90();
  sub_25A852D90();
  MEMORY[0x270FA5388](v27, v28);
  sub_25A852E90();
  sub_25A852D90();
  MEMORY[0x270FA5388](v29, v30);
  sub_25A852E90();
  sub_25A852D90();
  MEMORY[0x270FA5388](v31, v32);
  uint64_t v34 = (char *)v127 - v33;
  uint64_t v35 = swift_getAssociatedTypeWitness();
  uint64_t v135 = v4;
  uint64_t v134 = v6;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v37 = *(void (**)(void, void))(AssociatedConformanceWitness + 48);
  uint64_t v140 = AssociatedConformanceWitness + 48;
  id v139 = v37;
  v37(v35, AssociatedConformanceWitness);
  uint64_t v38 = sub_25A8556F0();
  os_log_type_t v39 = sub_25A8559E0();
  BOOL v40 = os_log_type_enabled(v38, v39);
  uint64_t v136 = v20;
  uint64_t v141 = AssociatedTypeWitness;
  if (v40)
  {
    uint64_t v41 = (uint8_t *)sub_25A852E9C();
    uint64_t v42 = sub_25A852F54();
    *(_DWORD *)uint64_t v41 = 136446210;
    *(void *)&long long aBlock = v42;
    sub_25A850498();
    uint64_t v44 = v43();
    uint64_t v46 = sub_25A8555BC(v44, v45);
    sub_25A852F00(v46);
    uint64_t v47 = v143;
    uint64_t v48 = v136;
    sub_25A855AA0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25A837000, v38, v39, "%{public}s Delegate: Got connection request.", v41, 0xCu);
    swift_arrayDestroy();
    sub_25A8487B0();
    uint64_t AssociatedTypeWitness = v141;
    sub_25A8487B0();

    uint64_t v49 = *(void (**)(void, void))(v48 + 8);
    unint64_t v50 = v34;
    uint64_t v51 = v47;
  }
  else
  {

    uint64_t v49 = *(void (**)(void, void))(v20 + 8);
    unint64_t v50 = v34;
    uint64_t v51 = v143;
  }
  uint64_t v138 = v49;
  v49(v50, v51);
  uint64_t v52 = v142;
  swift_beginAccess();
  uint64_t v53 = (uint64_t (*)(id, uint64_t, uint64_t))off_26B32C190;
  if (off_26B32C190)
  {
    swift_retain();
    char v54 = v53(v52, v35, AssociatedConformanceWitness);
    sub_25A852BB4((uint64_t)v53);
    if ((v54 & 1) == 0)
    {
      sub_25A8554E4();
      v66();
      int v67 = sub_25A8556F0();
      os_log_type_t v68 = sub_25A8559E0();
      if (os_log_type_enabled(v67, v68))
      {
        id v69 = (uint8_t *)sub_25A852E9C();
        uint64_t v70 = sub_25A852F54();
        *(_DWORD *)id v69 = 136446210;
        *(void *)&long long aBlock = v70;
        uint64_t v71 = sub_25A855514();
        uint64_t v73 = v72(v71);
        uint64_t v75 = sub_25A8555BC(v73, v74);
        sub_25A852F00(v75);
        sub_25A855AA0();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25A837000, v67, v68, "%{public}s Delegate: Failed global enablement check. Rejecting connection.", v69, 0xCu);
        swift_arrayDestroy();
        sub_25A8487B0();
        sub_25A8487B0();

        sub_25A8555D4();
      }
      else
      {
      }
      sub_25A8554FC();
      v78();
      return 0;
    }
  }
  if ((sub_25A853B8C() & 1) == 0) {
    goto LABEL_8;
  }
  sub_25A850498();
  uint64_t v56 = v55();
  unint64_t v58 = v57;
  uint64_t v59 = (*(uint64_t (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 32))(v35, AssociatedConformanceWitness);
  unint64_t v61 = v60;
  sub_25A8554E4();
  v62();
  LOBYTE(v56) = sub_25A8533E8(v56, v58, v59, v61);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t AssociatedTypeWitness = v141;
  sub_25A8554FC();
  v63();
  if (v56)
  {
LABEL_8:
    id v64 = static XPCService.xpcInterface()();
    objc_msgSend(v52, sel_setExportedInterface_, v64);

    uint64_t v65 = swift_getAssociatedConformanceWitness();
    if ((*(uint64_t (**)(uint64_t, uint64_t))(v65 + 32))(AssociatedTypeWitness, v65))
    {
      memset(v150, 0, sizeof(v150));
    }
    else
    {
      int v76 = (void *)sub_25A8558A0();
      id v77 = objc_msgSend(v52, sel_valueForEntitlement_, v76);

      if (v77)
      {
        sub_25A855AC0();
        swift_unknownObjectRelease();
      }
      else
      {
        long long aBlock = 0u;
        long long v147 = 0u;
      }
      sub_25A852BC4((uint64_t)&aBlock, (uint64_t)v150);
    }
    sub_25A852C2C((uint64_t)v150, (uint64_t)&aBlock);
    if (*((void *)&v147 + 1))
    {
      if (swift_dynamicCast())
      {
        uint64_t v79 = v144;
        unint64_t v80 = v145;
        sub_25A8554E4();
        v81();
        swift_bridgeObjectRetain_n();
        uint64_t v82 = v35;
        uint64_t v83 = sub_25A8556F0();
        os_log_type_t v84 = sub_25A8559E0();
        BOOL v85 = os_log_type_enabled(v83, v84);
        v127[1] = v82;
        if (v85)
        {
          uint64_t v86 = swift_slowAlloc();
          uint64_t v137 = swift_slowAlloc();
          *(void *)&long long aBlock = v137;
          *(_DWORD *)uint64_t v86 = 136446466;
          sub_25A850498();
          uint64_t v88 = v87();
          uint64_t v144 = sub_25A8555BC(v88, v89);
          sub_25A855AA0();
          swift_bridgeObjectRelease();
          *(_WORD *)(v86 + 12) = 2082;
          swift_bridgeObjectRetain();
          uint64_t v144 = sub_25A8415AC(v79, v80, (uint64_t *)&aBlock);
          sub_25A855AA0();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_25A837000, v83, v84, "%{public}s Delegate: clientApplicationIdentifier: %{public}s", (uint8_t *)v86, 0x16u);
          swift_arrayDestroy();
          sub_25A8487B0();
          sub_25A8487B0();
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        sub_25A8554FC();
        v98();
        goto LABEL_30;
      }
    }
    else
    {
      sub_25A852C94((uint64_t)&aBlock);
    }
    if (sub_25A853C3C())
    {
      sub_25A8554E4();
      v90();
      uint64_t v91 = sub_25A8556F0();
      os_log_type_t v92 = sub_25A8559C0();
      if (os_log_type_enabled(v91, v92))
      {
        uint64_t v93 = swift_slowAlloc();
        *(void *)&long long aBlock = swift_slowAlloc();
        *(_DWORD *)uint64_t v93 = 136446466;
        uint64_t v94 = sub_25A855514();
        uint64_t v96 = v95(v94);
        uint64_t v144 = sub_25A8555BC(v96, v97);
        sub_25A855AA0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v93 + 12) = 2082;
        uint64_t v144 = sub_25A8415AC(0xD000000000000016, 0x800000025A856FC0, (uint64_t *)&aBlock);
        sub_25A855AA0();
        _os_log_impl(&dword_25A837000, v91, v92, "%{public}s Delegate: Client is missing '%{public}s' entitlement. This entitlement is required. Rejecting connection.", (uint8_t *)v93, 0x16u);
        swift_arrayDestroy();
        sub_25A8487B0();
        sub_25A8487B0();
      }

LABEL_36:
      sub_25A8554FC();
      v126();
      sub_25A852C94((uint64_t)v150);
      return 0;
    }
    uint64_t v79 = 0;
    unint64_t v80 = 0;
LABEL_30:
    *(void *)&long long aBlock = v79;
    *((void *)&aBlock + 1) = v80;
    os_log_type_t v99 = *(void (**)(long long *, id, uint64_t, uint64_t))(v65 + 8);
    uint64_t v100 = v142;
    uint64_t v101 = (uint64_t)v133;
    uint64_t v102 = v141;
    v99(&aBlock, v100, v141, v65);
    if (sub_25A83CAF0(v101, 1, v102) != 1)
    {
      uint64_t v112 = v131;
      uint64_t v113 = *(void (**)(char *, uint64_t, uint64_t))(v131 + 32);
      v114 = v132;
      v113(v132, v101, v102);
      os_log_type_t v115 = (void (*)(uint64_t))v113;
      v116 = *(void (**)(void, void, void))(v112 + 16);
      v142 = v113;
      uint64_t v143 = v116;
      uint64_t v117 = v130;
      v116(v130, v114, v102);
      uint64_t v140 = *(unsigned __int8 *)(v112 + 80) | 7;
      uint64_t v118 = swift_allocObject();
      uint64_t v119 = sub_25A85555C(v118);
      v115(v119);
      uint64_t v148 = sub_25A85533C;
      uint64_t v149 = v118;
      *(void *)&long long aBlock = MEMORY[0x263EF8330];
      *((void *)&aBlock + 1) = 1107296256;
      *(void *)&long long v147 = sub_25A8533A4;
      *((void *)&v147 + 1) = &unk_270860588;
      unint64_t v120 = _Block_copy(&aBlock);
      swift_release();
      objc_msgSend(v100, sel_setInterruptionHandler_, v120);
      _Block_release(v120);
      uint64_t v121 = v132;
      v143(v117, v132, v102);
      uint64_t v122 = swift_allocObject();
      uint64_t v123 = sub_25A85555C(v122);
      ((void (*)(uint64_t))v142)(v123);
      uint64_t v148 = sub_25A855414;
      uint64_t v149 = v122;
      *(void *)&long long aBlock = MEMORY[0x263EF8330];
      *((void *)&aBlock + 1) = 1107296256;
      *(void *)&long long v147 = sub_25A8533A4;
      *((void *)&v147 + 1) = &unk_2708606F0;
      uint64_t v124 = _Block_copy(&aBlock);
      swift_release();
      objc_msgSend(v100, sel_setInvalidationHandler_, v124);
      _Block_release(v124);
      objc_msgSend(v100, sel_setExportedObject_, sub_25A855CC0());
      swift_unknownObjectRelease();
      objc_msgSend(v100, sel_activate);
      (*(void (**)(char *, uint64_t))(v112 + 8))(v121, v102);
      sub_25A852C94((uint64_t)v150);
      return 1;
    }
    (*(void (**)(uint64_t, uint64_t))(v128 + 8))(v101, v129);
    sub_25A8554E4();
    v103();
    uint64_t v104 = sub_25A8556F0();
    os_log_type_t v105 = sub_25A8559C0();
    if (os_log_type_enabled(v104, v105))
    {
      v106 = (uint8_t *)sub_25A852E9C();
      uint64_t v107 = sub_25A852F54();
      *(_DWORD *)v106 = 136446210;
      *(void *)&long long aBlock = v107;
      uint64_t v108 = sub_25A855514();
      uint64_t v110 = v109(v108);
      uint64_t v144 = sub_25A8555BC(v110, v111);
      sub_25A855AA0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25A837000, v104, v105, "%{public}s Delegate: connection rejected by server instance.", v106, 0xCu);
      swift_arrayDestroy();
      sub_25A8487B0();
      sub_25A8487B0();
    }

    sub_25A8555D4();
    goto LABEL_36;
  }
  return 0;
}

uint64_t sub_25A854BE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A855700();
  uint64_t v22 = *(void *)(v4 - 8);
  uint64_t v23 = v4;
  MEMORY[0x270FA5388](v4, v5);
  uint64_t v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 48))(AssociatedTypeWitness, AssociatedConformanceWitness);
  uint64_t v10 = sub_25A8556F0();
  os_log_type_t v11 = sub_25A8559C0();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    _OWORD v21[2] = a2;
    uint64_t v13 = (uint8_t *)v12;
    uint64_t v14 = swift_slowAlloc();
    _OWORD v21[3] = a1;
    *(_DWORD *)uint64_t v13 = 136446210;
    uint64_t v25 = v14;
    v21[1] = v13 + 4;
    uint64_t v15 = (*(uint64_t (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 24))(AssociatedTypeWitness, AssociatedConformanceWitness);
    uint64_t v24 = sub_25A8415AC(v15, v16, &v25);
    sub_25A855AA0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25A837000, v10, v11, "%{public}s Delegate: connection interrupted.", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x261147430](v14, -1, -1);
    MEMORY[0x261147430](v13, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v22 + 8))(v7, v23);
  swift_getAssociatedTypeWitness();
  uint64_t v17 = swift_getAssociatedConformanceWitness();
  uint64_t v18 = *(uint64_t (**)(uint64_t, uint64_t))(v17 + 40);
  uint64_t v19 = swift_checkMetadataState();
  return v18(v19, v17);
}

uint64_t sub_25A854EC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A855700();
  uint64_t v22 = *(void *)(v4 - 8);
  uint64_t v23 = v4;
  MEMORY[0x270FA5388](v4, v5);
  uint64_t v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 48))(AssociatedTypeWitness, AssociatedConformanceWitness);
  uint64_t v10 = sub_25A8556F0();
  os_log_type_t v11 = sub_25A8559E0();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    _OWORD v21[2] = a2;
    uint64_t v13 = (uint8_t *)v12;
    uint64_t v14 = swift_slowAlloc();
    _OWORD v21[3] = a1;
    *(_DWORD *)uint64_t v13 = 136446210;
    uint64_t v25 = v14;
    v21[1] = v13 + 4;
    uint64_t v15 = (*(uint64_t (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 24))(AssociatedTypeWitness, AssociatedConformanceWitness);
    uint64_t v24 = sub_25A8415AC(v15, v16, &v25);
    sub_25A855AA0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25A837000, v10, v11, "%{public}s Delegate: connection invalidated.", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x261147430](v14, -1, -1);
    MEMORY[0x261147430](v13, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v22 + 8))(v7, v23);
  swift_getAssociatedTypeWitness();
  uint64_t v17 = swift_getAssociatedConformanceWitness();
  uint64_t v18 = *(uint64_t (**)(uint64_t, uint64_t))(v17 + 48);
  uint64_t v19 = swift_checkMetadataState();
  return v18(v19, v17);
}

uint64_t sub_25A85519C(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  uint64_t v7 = a4;
  id v8 = a1;
  char v9 = sub_25A853CEC((uint64_t)v8, v7);

  return v9 & 1;
}

id sub_25A8551FC()
{
  return sub_25A852834();
}

uint64_t type metadata accessor for Delegate()
{
  return sub_25A839718();
}

uint64_t dispatch thunk of static XPCServiceServer.listener.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of static XPCServiceServer.listener.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of static XPCServiceServer.listener.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of static XPCServiceServer.delegate.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of static XPCServiceServer.delegate.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t dispatch thunk of static XPCServiceServer.delegate.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 80))();
}

ValueMetadata *type metadata accessor for XPCServiceServerInstanceParameters()
{
  return &type metadata for XPCServiceServerInstanceParameters;
}

uint64_t dispatch thunk of XPCServiceServerInstance.init(parameters:connection:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of static XPCServiceServerInstance.clientApplicationIdentifierEntitlementRequired.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of static XPCServiceServerInstance.serviceEntitlementRequired.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of static XPCServiceServerInstance.useRemoteXPC.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of XPCServiceServerInstance.xpcConnectionWasInterrupted()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of XPCServiceServerInstance.xpcConnectionWasInvalidated()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t sub_25A85533C()
{
  return sub_25A85542C((uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_25A854BE4);
}

uint64_t sub_25A855354(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_25A855364()
{
  return swift_release();
}

uint64_t sub_25A855370()
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v2 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, AssociatedTypeWitness);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_25A855414()
{
  return sub_25A85542C((uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_25A854EC0);
}

uint64_t sub_25A85542C(uint64_t (*a1)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = *(void *)(v1 + 24);
  uint64_t v4 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));

  return a1(v5, v2, v3);
}

uint64_t sub_25A855514()
{
  return v0;
}

uint64_t sub_25A855534()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t sub_25A85555C(uint64_t a1)
{
  uint64_t v3 = *(void *)(v2 - 296);
  *(void *)(a1 + 16) = *(void *)(v2 - 304);
  *(void *)(a1 + 24) = v3;
  return a1 + v1;
}

uint64_t sub_25A855580()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t sub_25A85559C()
{
  return v0;
}

uint64_t sub_25A8555BC(uint64_t a1, unint64_t a2)
{
  return sub_25A8415AC(a1, a2, (uint64_t *)(v2 - 208));
}

uint64_t sub_25A8555D4()
{
  return v0;
}

uint64_t _pds_os_variant_allows_internal_security_policies()
{
  return MEMORY[0x270EDAB10]();
}

uint64_t _pds_os_variant_has_internal_content()
{
  return MEMORY[0x270EDAB30]();
}

uint64_t sub_25A8555F0()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_25A855600()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_25A855610()
{
  return MEMORY[0x270EEE298]();
}

uint64_t sub_25A855620()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_25A855630()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_25A855640()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_25A855650()
{
  return MEMORY[0x270EEFF98]();
}

uint64_t sub_25A855660()
{
  return MEMORY[0x270EEFFB8]();
}

uint64_t sub_25A855670()
{
  return MEMORY[0x270EF0008]();
}

uint64_t sub_25A855680()
{
  return MEMORY[0x270EF0158]();
}

uint64_t sub_25A855690()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_25A8556A0()
{
  return MEMORY[0x270EF0198]();
}

uint64_t sub_25A8556B0()
{
  return MEMORY[0x270EF02B0]();
}

uint64_t sub_25A8556C0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_25A8556D0()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t sub_25A8556E0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_25A8556F0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25A855700()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25A855710()
{
  return MEMORY[0x270FA1978]();
}

uint64_t sub_25A855720()
{
  return MEMORY[0x270FA1988]();
}

uint64_t sub_25A855730()
{
  return MEMORY[0x270FA1998]();
}

uint64_t sub_25A855740()
{
  return MEMORY[0x270FA19A0]();
}

uint64_t sub_25A855750()
{
  return MEMORY[0x270FA19B8]();
}

uint64_t sub_25A855760()
{
  return MEMORY[0x270FA19C0]();
}

uint64_t sub_25A855770()
{
  return MEMORY[0x270FA19E0]();
}

uint64_t sub_25A855780()
{
  return MEMORY[0x270FA19F0]();
}

uint64_t sub_25A855790()
{
  return MEMORY[0x270FA1A00]();
}

uint64_t sub_25A8557A0()
{
  return MEMORY[0x270FA1A08]();
}

uint64_t sub_25A8557B0()
{
  return MEMORY[0x270FA1A28]();
}

uint64_t sub_25A8557C0()
{
  return MEMORY[0x270FA1A48]();
}

uint64_t sub_25A8557D0()
{
  return MEMORY[0x270FA2C50]();
}

uint64_t sub_25A8557E0()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_25A8557F0()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_25A855800()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_25A855810()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_25A855820()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_25A855830()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_25A855840()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_25A855850()
{
  return MEMORY[0x270F9D190]();
}

uint64_t sub_25A855860()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_25A855870()
{
  return MEMORY[0x270F9D328]();
}

uint64_t sub_25A855880()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_25A855890()
{
  return MEMORY[0x270EF1890]();
}

uint64_t sub_25A8558A0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25A8558B0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25A8558C0()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_25A8558D0()
{
  return MEMORY[0x270F9D6B0]();
}

uint64_t sub_25A8558E0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25A8558F0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25A855900()
{
  return MEMORY[0x270F9D7C0]();
}

uint64_t sub_25A855910()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25A855920()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_25A855930()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_25A855940()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_25A855950()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_25A855960()
{
  return MEMORY[0x270FA1E28]();
}

uint64_t sub_25A855980()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_25A855990()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_25A8559A0()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_25A8559B0()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_25A8559C0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25A8559D0()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_25A8559E0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_25A8559F0()
{
  return MEMORY[0x270EF1F60]();
}

uint64_t sub_25A855A00()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_25A855A10()
{
  return MEMORY[0x270FA0E38]();
}

uint64_t sub_25A855A20()
{
  return MEMORY[0x270FA0EA0]();
}

uint64_t sub_25A855A30()
{
  return MEMORY[0x270FA0EC0]();
}

uint64_t sub_25A855A40()
{
  return MEMORY[0x270FA0EC8]();
}

uint64_t sub_25A855A50()
{
  return MEMORY[0x270EF1FD8]();
}

uint64_t sub_25A855A60()
{
  return MEMORY[0x270EF1FE8]();
}

uint64_t sub_25A855A70()
{
  return MEMORY[0x270EF1FF8]();
}

uint64_t sub_25A855A80()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_25A855A90()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_25A855AA0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25A855AB0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25A855AC0()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_25A855AD0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_25A855AE0()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_25A855AF0()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_25A855B00()
{
  return MEMORY[0x270F9E8D8]();
}

uint64_t sub_25A855B10()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25A855B20()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25A855B30()
{
  return MEMORY[0x270F9E9B8]();
}

uint64_t sub_25A855B40()
{
  return MEMORY[0x270F9EAD0]();
}

uint64_t sub_25A855B50()
{
  return MEMORY[0x270F9EAE0]();
}

uint64_t sub_25A855B60()
{
  return MEMORY[0x270F9EAF0]();
}

uint64_t sub_25A855B70()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25A855B80()
{
  return MEMORY[0x270FA21A0]();
}

uint64_t sub_25A855B90()
{
  return MEMORY[0x270FA21A8]();
}

uint64_t sub_25A855BA0()
{
  return MEMORY[0x270FA21B0]();
}

uint64_t sub_25A855BB0()
{
  return MEMORY[0x270F9ECD8]();
}

uint64_t sub_25A855BC0()
{
  return MEMORY[0x270F9EDD8]();
}

uint64_t sub_25A855BD0()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_25A855BE0()
{
  return MEMORY[0x270F9EF18]();
}

uint64_t sub_25A855BF0()
{
  return MEMORY[0x270F9EF20]();
}

uint64_t sub_25A855C00()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25A855C10()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_25A855C20()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_25A855C30()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25A855C40()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25A855C50()
{
  return MEMORY[0x270F9F228]();
}

uint64_t sub_25A855C60()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_25A855C70()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_25A855C80()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_25A855C90()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25A855CA0()
{
  return MEMORY[0x270F9F730]();
}

uint64_t sub_25A855CB0()
{
  return MEMORY[0x270F9F768]();
}

uint64_t sub_25A855CC0()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_25A855CD0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25A855CE0()
{
  return MEMORY[0x270F9F818]();
}

uint64_t sub_25A855CF0()
{
  return MEMORY[0x270F9F8A8]();
}

uint64_t sub_25A855D10()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25A855D20()
{
  return MEMORY[0x270FA2378]();
}

uint64_t sub_25A855D40()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25A855D50()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25A855D60()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25A855D70()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25A855D80()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25A855D90()
{
  return MEMORY[0x270F9FC50]();
}

uint64_t sub_25A855DA0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25A855DB0()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_25A855DC0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25A855DD0()
{
  return MEMORY[0x270F9FD60]();
}

uint64_t sub_25A855DE0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_25A855DF0()
{
  return MEMORY[0x270F9FD88]();
}

uint64_t sub_25A855E00()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_25A855E10()
{
  return MEMORY[0x270F9FF78]();
}

uint64_t sub_25A855E20()
{
  return MEMORY[0x270F9FFA8]();
}

uint64_t sub_25A855E30()
{
  return MEMORY[0x270F9FFE0]();
}

uint64_t sub_25A855E60()
{
  return MEMORY[0x270FA0128]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _exit(int a1)
{
}

{
  return MEMORY[0x270F9A3C0]();
}

{
  return MEMORY[0x270F9A3C8]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return MEMORY[0x270ED8150]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

void bzero(void *a1, size_t a2)
{
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return MEMORY[0x270ED8F50](*(void *)&a1, a2, a3);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x270EDA1C8](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x270EDA210](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x270EDB170](a1, a2);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x270EDB4D0](*(void *)&a1, a2);
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

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
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

uint64_t swift_deallocBox()
{
  return MEMORY[0x270FA0220]();
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

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
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

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x270FA0678]();
}

kern_return_t task_create_identity_token(task_t task, task_id_token_t *token)
{
  return MEMORY[0x270EDB830](*(void *)&task, token);
}

kern_return_t task_identity_token_get_task_port(task_id_token_t token, task_flavor_t flavor, mach_port_t *task_port)
{
  return MEMORY[0x270EDB858](*(void *)&token, *(void *)&flavor, task_port);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x270EDB868](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x270EDBD38](xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x270EDBD88](xarray, index);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x270EDBDE0](xBOOL);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x270EDBFA8](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x270EDBFB8](xdata);
}

uint64_t xpc_date_get_value_absolute()
{
  return MEMORY[0x270EDBFE0]();
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x270EDBFE8](xdict, applier);
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  MEMORY[0x270EDC170](xdouble);
  return result;
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x270EDC218](xint);
}

uint64_t xpc_mach_send_copy_right()
{
  return MEMORY[0x270EDC260]();
}

uint64_t xpc_mach_send_create()
{
  return MEMORY[0x270EDC268]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x270EDC3F8](xstring);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x270EDC440](xuint);
}

const uint8_t *__cdecl xpc_uuid_get_bytes(xpc_object_t xuuid)
{
  return (const uint8_t *)MEMORY[0x270EDC460](xuuid);
}