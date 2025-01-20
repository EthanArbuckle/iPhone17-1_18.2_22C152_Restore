uint64_t sub_25E9EBE58()
{
  uint64_t v0;

  v0 = sub_25EA35F00();
  sub_25E9EBECC(v0, qword_26A728BC0);
  sub_25E9EBF30(v0, (uint64_t)qword_26A728BC0);
  return sub_25EA35EF0();
}

uint64_t *sub_25E9EBECC(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_25E9EBF30(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void type metadata accessor for os_unfair_lock_s()
{
  if (!qword_26A7274E8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_26A7274E8);
    }
  }
}

void View.register<A>(_:)()
{
  type metadata accessor for InstallRuleViewModifier();
  JUMPOUT(0x2611E6FC0);
}

uint64_t type metadata accessor for InstallRuleViewModifier()
{
  return sub_25E9ED2B4();
}

uint64_t View.editScope(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t KeyPath = swift_getKeyPath();
  v10[0] = a1;
  v10[1] = a2;
  v10[2] = KeyPath;
  long long v11 = 0u;
  long long v12 = 0u;
  char v13 = 0;
  swift_retain();
  MEMORY[0x2611E6FC0](v10, a3, &type metadata for EditScopeViewModifier, a4);
  swift_release();
  return sub_25E9EC670(KeyPath, 0, 0, 0, 0, 0);
}

uint64_t sub_25E9EC0F8@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, char *a3@<X8>)
{
  type metadata accessor for InstallRuleViewModifier();
  swift_getWitnessTable();
  uint64_t v6 = sub_25EA36000();
  uint64_t v7 = sub_25EA35FB0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  long long v11 = (char *)v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  char v13 = (char *)v20 - v12;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a1;
  *(void *)(v14 + 24) = a2;
  uint64_t WitnessTable = swift_getWitnessTable();
  View.editScope(_:)((uint64_t)sub_25E9ECBD8, v14, v6, WitnessTable);
  swift_release();
  unint64_t v16 = sub_25E9EC7CC();
  v20[0] = WitnessTable;
  v20[1] = v16;
  swift_getWitnessTable();
  v17 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  v17(v13, v11, v7);
  v18 = *(void (**)(char *, uint64_t))(v8 + 8);
  v18(v11, v7);
  v17(a3, v13, v7);
  return ((uint64_t (*)(char *, uint64_t))v18)(v13, v7);
}

uint64_t sub_25E9EC328@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(a3, a1, a2);
}

uint64_t sub_25E9EC368@<X0>(uint64_t a1@<X1>, char *a2@<X8>)
{
  return sub_25E9EC0F8(*(void *)(a1 + 16), *(void *)(a1 + 24), a2);
}

__n128 sub_25E9EC374@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v14 = *(void (**)(long long *))v2;
  uint64_t v3 = *(void *)(v2 + 16);
  uint64_t v4 = *(void *)(v2 + 24);
  uint64_t v5 = *(void *)(v2 + 32);
  uint64_t v6 = *(void *)(v2 + 40);
  uint64_t v7 = *(void *)(v2 + 48);
  char v8 = *(unsigned char *)(v2 + 56);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v24 = v3;
  uint64_t v25 = v4;
  uint64_t v26 = v5;
  uint64_t v27 = v6;
  uint64_t v28 = v7;
  char v29 = v8;
  swift_retain();
  sub_25E9EC854(v3, v4, v5, v6, v7, v8);
  sub_25E9EC854(v3, v4, v5, v6, v7, v8);
  sub_25E9ECC1C((uint64_t)&v22);
  sub_25E9EC670(v3, v4, v5, v6, v7, v8);
  long long v19 = v22;
  uint64_t v20 = *(void *)v23;
  long long v21 = *(_OWORD *)&v23[8];
  v14(&v19);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_25E9EC854(v3, v4, v5, v6, v7, v8);
  sub_25E9ECC1C((uint64_t)&v22);
  sub_25E9EC670(v3, v4, v5, v6, v7, v8);
  swift_release();
  sub_25E9EC670(v3, v4, v5, v6, v7, v8);
  __n128 v15 = *(__n128 *)v23;
  uint64_t v9 = *(void *)&v23[16];
  sub_25E9ECE88();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(a2, a1, v10);
  sub_25E9ECEE4();
  uint64_t v12 = a2 + *(int *)(v11 + 36);
  *(void *)uint64_t v12 = KeyPath;
  *(_OWORD *)(v12 + 8) = v22;
  __n128 result = v15;
  *(__n128 *)(v12 + 24) = v15;
  *(void *)(v12 + 40) = v9;
  return result;
}

double sub_25E9EC584@<D0>(uint64_t a1@<X8>)
{
  sub_25E9ED260();
  sub_25EA35FE0();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = v5;
  return result;
}

uint64_t sub_25E9EC5E0()
{
  return sub_25EA35FF0();
}

uint64_t sub_25E9EC670(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t result = swift_release();
  if (a6)
  {
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25E9EC6D4()
{
  return swift_getWitnessTable();
}

uint64_t sub_25E9EC768()
{
  return swift_getWitnessTable();
}

unint64_t sub_25E9EC7CC()
{
  unint64_t result = qword_26A7274F0[0];
  if (!qword_26A7274F0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A7274F0);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for DependencyGraph(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_25E9EC854(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  if (a6)
  {
    swift_bridgeObjectRetain();
    swift_retain();
  }
  return swift_retain();
}

uint64_t destroy for EditScopeViewModifier(uint64_t a1)
{
  swift_release();
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void *)(a1 + 24);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  char v7 = *(unsigned char *)(a1 + 56);
  return sub_25E9EC670(v2, v3, v4, v5, v6, v7);
}

uint64_t initializeWithCopy for EditScopeViewModifier(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 24);
  uint64_t v6 = *(void *)(a2 + 32);
  uint64_t v7 = *(void *)(a2 + 40);
  uint64_t v8 = *(void *)(a2 + 48);
  char v9 = *(unsigned char *)(a2 + 56);
  swift_retain();
  sub_25E9EC854(v4, v5, v6, v7, v8, v9);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v6;
  *(void *)(a1 + 40) = v7;
  *(void *)(a1 + 48) = v8;
  *(unsigned char *)(a1 + 56) = v9;
  return a1;
}

uint64_t assignWithCopy for EditScopeViewModifier(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  uint64_t v4 = a2[1];
  *(void *)a1 = *a2;
  *(void *)(a1 + 8) = v4;
  swift_retain();
  swift_release();
  uint64_t v5 = v2[2];
  uint64_t v6 = v2[3];
  uint64_t v7 = v2[4];
  uint64_t v8 = v2[5];
  uint64_t v9 = v2[6];
  LOBYTE(v2) = *((unsigned char *)v2 + 56);
  sub_25E9EC854(v5, v6, v7, v8, v9, (char)v2);
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = *(void *)(a1 + 24);
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 48);
  char v15 = *(unsigned char *)(a1 + 56);
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(unsigned char *)(a1 + 56) = (_BYTE)v2;
  sub_25E9EC670(v10, v11, v12, v13, v14, v15);
  return a1;
}

__n128 initializeWithTake for EditScopeViewModifier(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for EditScopeViewModifier(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  uint64_t v4 = *(void *)(a2 + 48);
  char v5 = *(unsigned char *)(a2 + 56);
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  char v11 = *(unsigned char *)(a1 + 56);
  long long v12 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v12;
  *(void *)(a1 + 48) = v4;
  *(unsigned char *)(a1 + 56) = v5;
  sub_25E9EC670(v6, v7, v8, v9, v10, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for EditScopeViewModifier(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 57)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EditScopeViewModifier(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 56) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 57) = 1;
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
    *(unsigned char *)(result + 57) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EditScopeViewModifier()
{
  return &type metadata for EditScopeViewModifier;
}

uint64_t sub_25E9ECB40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

uint64_t sub_25E9ECB48()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25E9ECB64()
{
  return sub_25EA35F70();
}

uint64_t sub_25E9ECB84()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25E9ECBC8()
{
  return swift_deallocObject();
}

uint64_t sub_25E9ECBD8()
{
  return Scope.register<A>(_:)(*(void *)(v0 + 16), *(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_25E9ECC1C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_25EA35FD0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)v1;
  if (*(unsigned char *)(v1 + 40) == 1)
  {
    uint64_t v8 = *(void *)(v1 + 32);
    uint64_t v9 = *(void *)(v1 + 8);
    *(void *)a1 = v7;
    *(void *)(a1 + 8) = v9;
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(v1 + 16);
    *(void *)(a1 + 32) = v8;
    return sub_25E9ECFA4(v1, (void (*)(void, void, void, void, void, void))sub_25E9EC854);
  }
  else
  {
    sub_25E9ECFA4(v1, (void (*)(void, void, void, void, void, void))sub_25E9EC854);
    os_log_type_t v11 = sub_25EA362D0();
    long long v12 = sub_25EA36020();
    os_log_type_t v13 = v11;
    if (os_log_type_enabled(v12, v11))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      v17[1] = v7;
      uint64_t v16 = v15;
      uint64_t v18 = v15;
      *(_DWORD *)uint64_t v14 = 136315138;
      v17[0] = v14 + 4;
      v17[2] = sub_25EA01DA0(0x65706F6353, 0xE500000000000000, &v18);
      sub_25EA362F0();
      _os_log_impl(&dword_25E9E9000, v12, v13, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611E7A60](v16, -1, -1);
      MEMORY[0x2611E7A60](v14, -1, -1);
    }

    sub_25EA35FC0();
    swift_getAtKeyPath();
    sub_25E9ECFA4(v1, (void (*)(void, void, void, void, void, void))sub_25E9EC670);
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
}

void sub_25E9ECE88()
{
  if (!qword_26A727578)
  {
    sub_25E9EC7CC();
    unint64_t v0 = sub_25EA36000();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A727578);
    }
  }
}

void sub_25E9ECEE4()
{
  if (!qword_26A727580)
  {
    sub_25E9ECE88();
    sub_25E9ECF4C();
    unint64_t v0 = sub_25EA35FB0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A727580);
    }
  }
}

void sub_25E9ECF4C()
{
  if (!qword_26A727588)
  {
    unint64_t v0 = sub_25EA36010();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A727588);
    }
  }
}

uint64_t sub_25E9ECFA4(uint64_t a1, void (*a2)(void, void, void, void, void, void))
{
  return a1;
}

uint64_t sub_25E9ECFE4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_25EA35FD0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25E9ED4CC();
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25E9ED524(v2, (uint64_t)v10);
  if (swift_getEnumCaseMultiPayload() == 1) {
    return sub_25E9ED588((uint64_t)v10, a1);
  }
  os_log_type_t v12 = sub_25EA362D0();
  os_log_type_t v13 = sub_25EA36020();
  os_log_type_t v14 = v12;
  if (os_log_type_enabled(v13, v12))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    v18[1] = a1;
    uint64_t v17 = v16;
    uint64_t v19 = v16;
    *(_DWORD *)uint64_t v15 = 136315138;
    v18[2] = sub_25EA01DA0(0xD000000000000032, 0x800000025EA39000, &v19);
    sub_25EA362F0();
    _os_log_impl(&dword_25E9E9000, v13, v14, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611E7A60](v17, -1, -1);
    MEMORY[0x2611E7A60](v15, -1, -1);
  }

  sub_25EA35FC0();
  swift_getAtKeyPath();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_25E9ED260()
{
  unint64_t result = qword_26A727590;
  if (!qword_26A727590)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A727590);
  }
  return result;
}

uint64_t sub_25E9ED2B4()
{
  return swift_getGenericMetadata();
}

uint64_t sub_25E9ED2E4()
{
  return swift_getWitnessTable();
}

unint64_t sub_25E9ED3AC()
{
  unint64_t result = qword_26A727598;
  if (!qword_26A727598)
  {
    sub_25E9ECEE4();
    sub_25E9ED484(&qword_26A7275A0, (void (*)(uint64_t))sub_25E9ECE88);
    sub_25E9ED484((unint64_t *)&qword_26A7275A8, (void (*)(uint64_t))sub_25E9ECF4C);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A727598);
  }
  return result;
}

uint64_t sub_25E9ED484(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_25E9ED4CC()
{
  if (!qword_26A7275B0[0])
  {
    _s11ValueReaderVMa();
    unint64_t v0 = sub_25EA35F20();
    if (!v1) {
      atomic_store(v0, qword_26A7275B0);
    }
  }
}

uint64_t sub_25E9ED524(uint64_t a1, uint64_t a2)
{
  sub_25E9ED4CC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25E9ED588(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s11ValueReaderVMa();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25E9ED5F0()
{
  return swift_getWitnessTable();
}

uint64_t sub_25E9ED638(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v7(v6, v1, v3);
  v10[0] = sub_25EA36130();
  v10[1] = v8;
  sub_25EA36150();
  v7(v6, v1 + *(int *)(a1 + 28), v3);
  sub_25EA36130();
  sub_25EA36150();
  swift_bridgeObjectRelease();
  return v10[0];
}

uint64_t sub_25E9ED768()
{
  if ((sub_25EA36120() & 1) == 0) {
    return 0;
  }
  type metadata accessor for Edge();
  return sub_25EA36120() & 1;
}

uint64_t sub_25E9ED7D4()
{
  return sub_25EA360F0();
}

uint64_t sub_25E9ED830()
{
  return sub_25EA36560();
}

uint64_t sub_25E9ED8A8()
{
  return sub_25E9ED768();
}

uint64_t sub_25E9ED8B4()
{
  return sub_25E9ED830();
}

uint64_t sub_25E9ED8BC()
{
  return sub_25E9ED7D4();
}

uint64_t sub_25E9ED8C4()
{
  return sub_25EA36560();
}

uint64_t type metadata accessor for Edge()
{
  return sub_25E9ED2B4();
}

uint64_t sub_25E9ED930()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_25E9ED9C0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = *(_DWORD *)(v6 + 80);
  uint64_t v9 = ~v8;
  uint64_t v10 = v7 + v8;
  unint64_t v11 = ((v7 + v8) & ~v8) + v7;
  if (v8 > 7 || (*(_DWORD *)(v6 + 80) & 0x100000) != 0 || v11 > 0x18)
  {
    uint64_t v14 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v14 + ((v8 + 16) & v9));
    swift_retain();
  }
  else
  {
    uint64_t v15 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16);
    v15(a1, a2, v5);
    v15((uint64_t *)(((unint64_t)v4 + v10) & v9), (uint64_t *)(((unint64_t)a2 + v10) & v9), v5);
  }
  return v4;
}

uint64_t sub_25E9EDACC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(v3 - 8) + 8;
  uint64_t v7 = *(uint64_t (**)(unint64_t, uint64_t))v6;
  (*(void (**)(uint64_t, uint64_t))v6)(a1, v3);
  unint64_t v4 = (*(void *)(v6 + 56) + a1 + *(unsigned __int8 *)(v6 + 72)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 72);
  return v7(v4, v3);
}

unint64_t sub_25E9EDB68(unint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 16);
  uint64_t v8 = v6 + 16;
  v7(a1, a2, v5);
  v7((*(void *)(v8 + 48) + *(unsigned __int8 *)(v8 + 64) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 64), (*(void *)(v8 + 48) + *(unsigned __int8 *)(v8 + 64) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 64), v5);
  return a1;
}

unint64_t sub_25E9EDBFC(unint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 24);
  uint64_t v8 = v6 + 24;
  v7(a1, a2, v5);
  v7((*(void *)(v8 + 40) + *(unsigned __int8 *)(v8 + 56) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 56), (*(void *)(v8 + 40) + *(unsigned __int8 *)(v8 + 56) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 56), v5);
  return a1;
}

unint64_t sub_25E9EDC90(unint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 32);
  uint64_t v8 = v6 + 32;
  v7(a1, a2, v5);
  v7((*(void *)(v8 + 32) + *(unsigned __int8 *)(v8 + 48) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 48), (*(void *)(v8 + 32) + *(unsigned __int8 *)(v8 + 48) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 48), v5);
  return a1;
}

unint64_t sub_25E9EDD24(unint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 40);
  uint64_t v8 = v6 + 40;
  v7(a1, a2, v5);
  v7((*(void *)(v8 + 24) + *(unsigned __int8 *)(v8 + 40) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 40), (*(void *)(v8 + 24) + *(unsigned __int8 *)(v8 + 40) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 40), v5);
  return a1;
}

uint64_t sub_25E9EDDB8(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  if (!a2) {
    return 0;
  }
  unsigned int v7 = a2 - v5;
  if (a2 <= v5) {
    goto LABEL_19;
  }
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  uint64_t v8 = ((v6 + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80)) + v6;
  char v9 = 8 * v8;
  if (v8 <= 3)
  {
    unsigned int v11 = ((v7 + ~(-1 << v9)) >> v9) + 1;
    if (HIWORD(v11))
    {
      int v10 = *(_DWORD *)((char *)a1 + v8);
      if (!v10) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v11 > 0xFF)
    {
      int v10 = *(unsigned __int16 *)((char *)a1 + v8);
      if (!*(unsigned __int16 *)((char *)a1 + v8)) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v11 < 2)
    {
LABEL_19:
      if (v5) {
        return (*(uint64_t (**)(void))(v4 + 48))();
      }
      return 0;
    }
  }
  int v10 = *((unsigned __int8 *)a1 + v8);
  if (!*((unsigned char *)a1 + v8)) {
    goto LABEL_19;
  }
LABEL_11:
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
  return v5 + (v8 | v12) + 1;
}

void sub_25E9EDF24(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  size_t v8 = ((*(void *)(v6 + 64) + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))
     + *(void *)(v6 + 64);
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
      JUMPOUT(0x25E9EE14CLL);
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

uint64_t ScopeGraphElement.description.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ScopeGraphElement.id.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ScopeGraphElement(0) + 20);
  return sub_25E9EE208(v3, a1);
}

uint64_t type metadata accessor for ScopeGraphElement(uint64_t a1)
{
  return sub_25E9EE28C(a1, (uint64_t *)&unk_26A727678);
}

uint64_t sub_25E9EE208(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ScopeGraphElement.ID(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for ScopeGraphElement.ID(uint64_t a1)
{
  return sub_25E9EE28C(a1, (uint64_t *)&unk_26A727688);
}

uint64_t sub_25E9EE28C(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25E9EE2C4@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for ScopeGraphElement(0) - 8;
  MEMORY[0x270FA5388]();
  size_t v8 = (uint64_t *)((char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_25E9EE208(a1, (uint64_t)v8 + *(int *)(v6 + 28));
  sub_25E9EFBCC((uint64_t)a2, (uint64_t)v8 + *(int *)(v6 + 32));
  uint64_t v12 = 0;
  unint64_t v13 = 0xE000000000000000;
  sub_25EA36370();
  swift_bridgeObjectRelease();
  uint64_t v12 = 4015177;
  unint64_t v13 = 0xE300000000000000;
  _s9TeaBreeze17ScopeGraphElementV2IDV11descriptionSSvg_0();
  sub_25EA36150();
  swift_bridgeObjectRelease();
  sub_25EA36150();
  sub_25E9EFC30(a2, a2[3]);
  sub_25EA36480();
  sub_25EA36150();
  swift_bridgeObjectRelease();
  sub_25EA36150();
  uint64_t v9 = v12;
  unint64_t v10 = v13;
  sub_25E9EFC74(a1);
  *size_t v8 = v9;
  v8[1] = v10;
  sub_25E9EFCD0((uint64_t)v8, a3);
  return sub_25E9EF02C((uint64_t)a2);
}

uint64_t sub_25E9EE434@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_25E9EE208(v2 + *(int *)(a1 + 20), a2);
}

uint64_t ScopeGraphElement.ID.customMirror.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25EA36590();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  unsigned int v5 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25E9EE69C(0, &qword_26A727638, MEMORY[0x263F8E818], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v6 - 8);
  size_t v8 = (char *)v13 - v7;
  uint64_t v9 = type metadata accessor for ScopeGraphElement.ID(0);
  MEMORY[0x270FA5388](v9);
  sub_25E9EE208(v1, (uint64_t)v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v13[1] = MEMORY[0x263F8EE78];
  uint64_t v11 = sub_25EA36580();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F8E830], v2);
  sub_25E9EE69C(0, &qword_26A727640, (uint64_t (*)(uint64_t))sub_25E9EE700, MEMORY[0x263F8D488]);
  sub_25E9EE7C8();
  return sub_25EA365A0();
}

void sub_25E9EE69C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

void sub_25E9EE700()
{
  if (!qword_26A727648)
  {
    sub_25E9EE770();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_26A727648);
    }
  }
}

void sub_25E9EE770()
{
  if (!qword_26A727650)
  {
    unint64_t v0 = sub_25EA362E0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A727650);
    }
  }
}

unint64_t sub_25E9EE7C8()
{
  unint64_t result = qword_26A727658;
  if (!qword_26A727658)
  {
    sub_25E9EE69C(255, &qword_26A727640, (uint64_t (*)(uint64_t))sub_25E9EE700, MEMORY[0x263F8D488]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A727658);
  }
  return result;
}

uint64_t sub_25E9EE850()
{
  uint64_t v1 = sub_25EA36590();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25E9EE69C(0, &qword_26A727638, MEMORY[0x263F8E818], MEMORY[0x263F8D8F0]);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  unint64_t v8 = (char *)v12 - v7;
  MEMORY[0x270FA5388](v6);
  sub_25E9EE208(v0, (uint64_t)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12[1] = MEMORY[0x263F8EE78];
  uint64_t v10 = sub_25EA36580();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 1, 1, v10);
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F8E830], v1);
  sub_25E9EE69C(0, &qword_26A727640, (uint64_t (*)(uint64_t))sub_25E9EE700, MEMORY[0x263F8D488]);
  sub_25E9EE7C8();
  return sub_25EA365A0();
}

uint64_t sub_25E9EEAA0()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ScopeGraphElement.ID.hash(into:)()
{
  sub_25EA35ED0();
  sub_25E9EEB5C(&qword_26A727660, MEMORY[0x263F07508]);
  return sub_25EA360F0();
}

uint64_t sub_25E9EEB5C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t ScopeGraphElement.ID.hashValue.getter()
{
  return sub_25EA36560();
}

uint64_t sub_25E9EEC30()
{
  return sub_25EA36560();
}

uint64_t sub_25E9EECB8()
{
  sub_25EA35ED0();
  sub_25E9EEB5C(&qword_26A727660, MEMORY[0x263F07508]);
  return sub_25EA360F0();
}

uint64_t sub_25E9EED3C()
{
  return sub_25EA36560();
}

uint64_t sub_25E9EEDC0()
{
  return sub_25E9EEB5C(&qword_26A727668, (void (*)(uint64_t))type metadata accessor for ScopeGraphElement.ID);
}

uint64_t sub_25E9EEE08()
{
  return sub_25E9EEB5C(&qword_26A727670, (void (*)(uint64_t))type metadata accessor for ScopeGraphElement.ID);
}

uint64_t *initializeBufferWithCopyOfBuffer for ScopeGraphElement(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_25EA35ED0();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = *(int *)(a3 + 24);
    long long v14 = *(_OWORD *)((char *)a2 + v13 + 24);
    *(_OWORD *)((char *)v4 + v13 + 24) = v14;
    (**(void (***)(void))(v14 - 8))();
  }
  return v4;
}

uint64_t destroy for ScopeGraphElement(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_25EA35ED0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 24);
  return sub_25E9EF02C(v6);
}

uint64_t sub_25E9EF02C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void *initializeWithCopy for ScopeGraphElement(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_25EA35ED0();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = *(int *)(a3 + 24);
  long long v13 = *(_OWORD *)((char *)a2 + v12 + 24);
  *(_OWORD *)((char *)a1 + v12 + 24) = v13;
  (**(void (***)(void))(v13 - 8))();
  return a1;
}

void *assignWithCopy for ScopeGraphElement(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25EA35ED0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  sub_25E9EF22C((void *)((char *)a1 + *(int *)(a3 + 24)), (void *)((char *)a2 + *(int *)(a3 + 24)));
  return a1;
}

uint64_t *sub_25E9EF22C(uint64_t *result, uint64_t *a2)
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

_OWORD *initializeWithTake for ScopeGraphElement(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25EA35ED0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  long long v13 = *((_OWORD *)v12 + 1);
  *(_OWORD *)uint64_t v11 = *(_OWORD *)v12;
  *((_OWORD *)v11 + 1) = v13;
  *((void *)v11 + 4) = *((void *)v12 + 4);
  return a1;
}

void *assignWithTake for ScopeGraphElement(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_25EA35ED0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (char *)a1 + v11;
  long long v13 = (char *)a2 + v11;
  sub_25E9EF02C((uint64_t)a1 + v11);
  long long v14 = *((_OWORD *)v13 + 1);
  *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
  *((_OWORD *)v12 + 1) = v14;
  *((void *)v12 + 4) = *((void *)v13 + 4);
  return a1;
}

uint64_t getEnumTagSinglePayload for ScopeGraphElement(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25E9EF5D0);
}

uint64_t sub_25E9EF5D0(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = type metadata accessor for ScopeGraphElement.ID(0);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for ScopeGraphElement(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25E9EF694);
}

uint64_t sub_25E9EF694(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for ScopeGraphElement.ID(0);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_25E9EF73C()
{
  uint64_t result = sub_25EA35ED0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for ScopeGraphElement.ID(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25EA35ED0();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  return v5(a1, a2, v4);
}

uint64_t destroy for ScopeGraphElement.ID(uint64_t a1)
{
  uint64_t v2 = sub_25EA35ED0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t initializeWithCopy for ScopeGraphElement.ID(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25EA35ED0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for ScopeGraphElement.ID(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25EA35ED0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for ScopeGraphElement.ID(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25EA35ED0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for ScopeGraphElement.ID(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25EA35ED0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for ScopeGraphElement.ID(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25E9EFA50);
}

uint64_t sub_25E9EFA50(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25EA35ED0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for ScopeGraphElement.ID(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25E9EFAD0);
}

uint64_t sub_25E9EFAD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25EA35ED0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t sub_25E9EFB40()
{
  uint64_t result = sub_25EA35ED0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_25E9EFBCC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_25E9EFC30(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_25E9EFC74(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ScopeGraphElement.ID(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25E9EFCD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ScopeGraphElement(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t static DependencyKey<>.defaultValue.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of static ViewTruth.preview.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t destroy for DependencyGraph()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for DependencyGraph(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  uint64_t v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  uint64_t v7 = a2[9];
  a1[8] = a2[8];
  a1[9] = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for DependencyGraph(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for DependencyGraph(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t assignWithTake for DependencyGraph(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DependencyGraph(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 80)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DependencyGraph(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 80) = 1;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 80) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DependencyGraph()
{
  return &type metadata for DependencyGraph;
}

uint64_t sub_25E9F013C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *(void *)(v2 + 48);
  if (!*(void *)(v3 + 16)) {
    return 0;
  }
  uint64_t v4 = *a2;
  unint64_t v5 = sub_25EA024DC(*a1);
  if ((v6 & 1) == 0) {
    return 0;
  }
  while (1)
  {
    uint64_t v7 = *(void *)(*(void *)(v3 + 56) + 8 * v5);
    if (v7 == v4) {
      break;
    }
    if (*(void *)(v3 + 16))
    {
      unint64_t v5 = sub_25EA024DC(v7);
      if (v8) {
        continue;
      }
    }
    return 0;
  }
  return 1;
}

uint64_t sub_25E9F01A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = type metadata accessor for ScopeGraphElement(0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25E9F0484(0);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  long long v13 = (char *)&v24 - v12;
  uint64_t v14 = *(void *)(v2 + 8);
  if (*(void *)(v14 + 16) && (unint64_t v15 = sub_25EA02548(a1), (v16 & 1) != 0))
  {
    unint64_t v17 = v15;
    uint64_t v18 = *(void *)(v14 + 56);
    sub_25E9F04B8(0);
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)(v19 - 8);
    sub_25E9FB3A0(v18 + *(void *)(v21 + 72) * v17, (uint64_t)v13, (uint64_t (*)(void))sub_25E9F04B8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(v13, 0, 1, v20);
  }
  else
  {
    sub_25E9F04B8(0);
    uint64_t v20 = v22;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v13, 1, 1, v22);
  }
  sub_25E9F8188((uint64_t)v13, (uint64_t)v11, (uint64_t (*)(void))sub_25E9F0484);
  sub_25E9F04B8(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v20 - 8) + 48))(v11, 1, v20) == 1)
  {
    uint64_t result = sub_25E9FAEE8((uint64_t)v11, (uint64_t (*)(void))sub_25E9F0484);
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    *(void *)(a2 + 32) = 0;
  }
  else
  {
    sub_25E9FB3A0((uint64_t)v11, (uint64_t)v7, type metadata accessor for ScopeGraphElement);
    sub_25E9FAEE8((uint64_t)v11, (uint64_t (*)(void))sub_25E9F04B8);
    sub_25E9EFBCC((uint64_t)&v7[*(int *)(v5 + 24)], a2);
    return sub_25E9FAEE8((uint64_t)v7, type metadata accessor for ScopeGraphElement);
  }
  return result;
}

void sub_25E9F0484(uint64_t a1)
{
}

void sub_25E9F04B8(uint64_t a1)
{
}

uint64_t sub_25E9F04EC(uint64_t a1)
{
  sub_25E9F8224(0);
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v66 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25E9F81F0(0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v66 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for ScopeGraphElement.ID(0);
  MEMORY[0x270FA5388](v11 - 8);
  v77 = (void (**)(char *, uint64_t, uint64_t, uint64_t))((char *)&v66 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_25E9F04B8(0);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13 - 8);
  uint64_t v74 = (uint64_t)&v66 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v73 = (uint64_t)&v66 - v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v66 - v20;
  uint64_t result = MEMORY[0x270FA5388](v19);
  uint64_t v24 = (char *)&v66 - v23;
  uint64_t v25 = *(void *)(v1 + 8);
  if (!*(void *)(v25 + 16)) {
    return result;
  }
  uint64_t v76 = *(void *)(v1 + 24);
  uint64_t result = sub_25EA02548(a1);
  if ((v26 & 1) == 0) {
    return result;
  }
  uint64_t v75 = a1;
  uint64_t v27 = *(void *)(v25 + 56);
  uint64_t v71 = *(void *)(v14 + 72);
  sub_25E9FB3A0(v27 + v71 * result, (uint64_t)v21, (uint64_t (*)(void))sub_25E9F04B8);
  sub_25E9F8188((uint64_t)v21, (uint64_t)v24, (uint64_t (*)(void))sub_25E9F04B8);
  uint64_t v70 = type metadata accessor for ScopeGraphElement(0);
  uint64_t v28 = &v24[*(int *)(v70 + 24)];
  uint64_t v29 = *((void *)v28 + 3);
  uint64_t v30 = *((void *)v28 + 4);
  sub_25E9EFC30(v28, v29);
  (*(void (**)(uint64_t, uint64_t))(v30 + 64))(v29, v30);
  uint64_t v31 = *((void *)v28 + 3);
  uint64_t v32 = *((void *)v28 + 4);
  v66 = v28;
  sub_25E9EFC30(v28, v31);
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v32 + 40))(v31, v32) & 1) == 0) {
    return sub_25E9FAEE8((uint64_t)v24, (uint64_t (*)(void))sub_25E9F04B8);
  }
  v33 = v77;
  sub_25E9FB3A0(v75, (uint64_t)v77, type metadata accessor for ScopeGraphElement.ID);
  uint64_t v34 = v76;
  uint64_t v35 = *(void *)(v76 + 16);
  v72 = v24;
  if (v35 && (unint64_t v36 = sub_25EA02548((uint64_t)v33), (v37 & 1) != 0))
  {
    uint64_t v38 = *(void *)(*(void *)(v34 + 56) + 8 * v36);
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v38 = MEMORY[0x263F8EE88];
  }
  uint64_t result = sub_25E9FAEE8((uint64_t)v33, type metadata accessor for ScopeGraphElement.ID);
  uint64_t v39 = 0;
  uint64_t v40 = v38 + 56;
  uint64_t v41 = 1 << *(unsigned char *)(v38 + 32);
  uint64_t v42 = -1;
  if (v41 < 64) {
    uint64_t v42 = ~(-1 << v41);
  }
  unint64_t v43 = v42 & *(void *)(v38 + 56);
  v77 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
  uint64_t v75 = (unint64_t)(v41 + 63) >> 6;
  uint64_t v76 = v5 + 48;
  uint64_t v68 = v25;
  v69 = v10;
  uint64_t v67 = v5;
  while (1)
  {
    if (v43)
    {
      unint64_t v44 = __clz(__rbit64(v43));
      v43 &= v43 - 1;
      unint64_t v45 = v44 | (v39 << 6);
      goto LABEL_28;
    }
    uint64_t v46 = v39 + 1;
    if (__OFADD__(v39, 1))
    {
      __break(1u);
      goto LABEL_38;
    }
    uint64_t v24 = v72;
    if (v46 >= v75) {
      goto LABEL_33;
    }
    unint64_t v47 = *(void *)(v40 + 8 * v46);
    ++v39;
    if (!v47)
    {
      uint64_t v39 = v46 + 1;
      if (v46 + 1 >= v75) {
        goto LABEL_33;
      }
      unint64_t v47 = *(void *)(v40 + 8 * v39);
      if (!v47)
      {
        uint64_t v39 = v46 + 2;
        if (v46 + 2 >= v75) {
          goto LABEL_33;
        }
        unint64_t v47 = *(void *)(v40 + 8 * v39);
        if (!v47) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v43 = (v47 - 1) & v47;
    unint64_t v45 = __clz(__rbit64(v47)) + (v39 << 6);
LABEL_28:
    sub_25E9F8258(*(void *)(v38 + 48) + *(void *)(v5 + 72) * v45, (uint64_t)v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v10, 0, 1, v4);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4) == 1)
    {
      swift_release();
      uint64_t v24 = v72;
LABEL_34:
      uint64_t v64 = *((void *)v66 + 3);
      uint64_t v65 = *((void *)v66 + 4);
      sub_25E9EFC30(v66, v64);
      (*(void (**)(uint64_t, uint64_t))(v65 + 56))(v64, v65);
      return sub_25E9FAEE8((uint64_t)v24, (uint64_t (*)(void))sub_25E9F04B8);
    }
    sub_25E9F8270((uint64_t)v10, (uint64_t)v7);
    if (*(void *)(v25 + 16))
    {
      unint64_t v49 = sub_25EA02548((uint64_t)&v7[*(int *)(v4 + 28)]);
      if (v50)
      {
        uint64_t v51 = v74;
        sub_25E9FB3A0(*(void *)(v25 + 56) + v49 * v71, v74, (uint64_t (*)(void))sub_25E9F04B8);
        v52 = v7;
        uint64_t v53 = v4;
        uint64_t v54 = v73;
        sub_25E9F8188(v51, v73, (uint64_t (*)(void))sub_25E9F04B8);
        v55 = (void *)(v54 + *(int *)(v70 + 24));
        uint64_t v56 = v38;
        uint64_t v57 = v40;
        uint64_t v58 = v55[3];
        uint64_t v59 = v55[4];
        sub_25E9EFC30(v55, v58);
        v60 = *(void (**)(uint64_t, uint64_t))(v59 + 48);
        uint64_t v61 = v58;
        uint64_t v38 = v56;
        uint64_t v62 = v59;
        uint64_t v40 = v57;
        v60(v61, v62);
        uint64_t v63 = v54;
        uint64_t v4 = v53;
        uint64_t v7 = v52;
        uint64_t v5 = v67;
        uint64_t v25 = v68;
        uint64_t v10 = v69;
        sub_25E9FAEE8(v63, (uint64_t (*)(void))sub_25E9F04B8);
      }
    }
    uint64_t result = sub_25E9FAEE8((uint64_t)v7, (uint64_t (*)(void))sub_25E9F8224);
  }
  uint64_t v48 = v46 + 3;
  if (v48 >= v75)
  {
LABEL_33:
    (*v77)(v10, 1, 1, v4);
    swift_release();
    goto LABEL_34;
  }
  unint64_t v47 = *(void *)(v40 + 8 * v48);
  if (v47)
  {
    uint64_t v39 = v48;
    goto LABEL_27;
  }
  while (1)
  {
    uint64_t v39 = v48 + 1;
    if (__OFADD__(v48, 1)) {
      break;
    }
    if (v39 >= v75) {
      goto LABEL_33;
    }
    unint64_t v47 = *(void *)(v40 + 8 * v39);
    ++v48;
    if (v47) {
      goto LABEL_27;
    }
  }
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_25E9F0B90()
{
  sub_25E9F04B8(0);
  uint64_t v83 = *(void *)(v1 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v1 - 8);
  uint64_t v82 = (uint64_t)&v79 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v92 = (uint64_t)&v79 - v4;
  uint64_t v5 = type metadata accessor for ScopeGraphElement.ID(0);
  uint64_t v98 = *(void *)(v5 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v81 = (uint64_t)&v79 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v79 - v8;
  sub_25E9FA380(0, &qword_26A7276F8, (uint64_t (*)(uint64_t))sub_25E9FA1AC, MEMORY[0x263F8D8F0]);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v13 = (char *)&v79 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v79 - v14;
  uint64_t v16 = *(void *)(v0 + 8);
  uint64_t v17 = *(void *)(v0 + 40);
  uint64_t v18 = *(void *)(v17 + 64);
  uint64_t v86 = v17 + 64;
  uint64_t v19 = 1 << *(unsigned char *)(v17 + 32);
  if (v19 < 64) {
    uint64_t v20 = ~(-1 << v19);
  }
  else {
    uint64_t v20 = -1;
  }
  unint64_t v21 = v20 & v18;
  int64_t v87 = (unint64_t)(v19 + 63) >> 6;
  uint64_t v91 = v17;
  swift_bridgeObjectRetain();
  uint64_t v84 = 0;
  int64_t v22 = 0;
  v85 = (void *)MEMORY[0x263F8EE80];
  while (1)
  {
    if (v21)
    {
      uint64_t v94 = (v21 - 1) & v21;
      int64_t v95 = v22;
      unint64_t v23 = __clz(__rbit64(v21)) | (v22 << 6);
    }
    else
    {
      int64_t v24 = v22 + 1;
      if (__OFADD__(v22, 1)) {
        goto LABEL_75;
      }
      if (v24 >= v87)
      {
LABEL_73:
        swift_release();
        sub_25E9FA2AC(v84);
        return (uint64_t)v85;
      }
      unint64_t v25 = *(void *)(v86 + 8 * v24);
      int64_t v26 = v22 + 1;
      if (!v25)
      {
        int64_t v26 = v22 + 2;
        if (v22 + 2 >= v87) {
          goto LABEL_73;
        }
        unint64_t v25 = *(void *)(v86 + 8 * v26);
        if (!v25)
        {
          int64_t v26 = v22 + 3;
          if (v22 + 3 >= v87) {
            goto LABEL_73;
          }
          unint64_t v25 = *(void *)(v86 + 8 * v26);
          if (!v25)
          {
            uint64_t v27 = v22 + 4;
            if (v22 + 4 >= v87) {
              goto LABEL_73;
            }
            unint64_t v25 = *(void *)(v86 + 8 * v27);
            if (!v25)
            {
              while (1)
              {
                int64_t v26 = v27 + 1;
                if (__OFADD__(v27, 1)) {
                  goto LABEL_78;
                }
                if (v26 >= v87) {
                  goto LABEL_73;
                }
                unint64_t v25 = *(void *)(v86 + 8 * v26);
                ++v27;
                if (v25) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v26 = v22 + 4;
          }
        }
      }
LABEL_21:
      uint64_t v94 = (v25 - 1) & v25;
      int64_t v95 = v26;
      unint64_t v23 = __clz(__rbit64(v25)) + (v26 << 6);
    }
    uint64_t v28 = 8 * v23;
    uint64_t v29 = *(void *)(v91 + 56);
    uint64_t v93 = *(void *)(*(void *)(v91 + 48) + v28);
    uint64_t v30 = *(void *)(v29 + v28);
    uint64_t v31 = *(void *)(v30 + 64);
    uint64_t v96 = v30 + 64;
    uint64_t v32 = 1 << *(unsigned char *)(v30 + 32);
    uint64_t v33 = v32 < 64 ? ~(-1 << v32) : -1;
    unint64_t v34 = v33 & v31;
    unint64_t v35 = (unint64_t)(v32 + 63) >> 6;
    unint64_t v88 = v35 - 1;
    swift_bridgeObjectRetain();
    unint64_t v36 = 0;
    int64_t v97 = v35;
    uint64_t v89 = v30 + 104;
    unint64_t v90 = v35 - 5;
    if (!v34) {
      break;
    }
    while (1)
    {
      unint64_t v37 = __clz(__rbit64(v34));
      v34 &= v34 - 1;
      unint64_t v38 = v37 | (v36 << 6);
LABEL_29:
      uint64_t v39 = *(void *)(v30 + 56);
      uint64_t v40 = *(void *)(v30 + 48) + 24 * v38;
      uint64_t v41 = *(void *)(v40 + 16);
      *(_OWORD *)uint64_t v13 = *(_OWORD *)v40;
      *((void *)v13 + 2) = v41;
      uint64_t v42 = v39 + *(void *)(v98 + 72) * v38;
      sub_25E9FA1AC();
      uint64_t v44 = v43;
      sub_25E9FB3A0(v42, (uint64_t)&v13[*(int *)(v43 + 48)], type metadata accessor for ScopeGraphElement.ID);
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56))(v13, 0, 1, v44);
      swift_bridgeObjectRetain();
LABEL_36:
      sub_25E9FA218((uint64_t)v13, (uint64_t)v15);
      sub_25E9FA1AC();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v44 - 8) + 48))(v15, 1, v44) == 1) {
        break;
      }
      swift_bridgeObjectRelease();
      sub_25E9F8188((uint64_t)&v15[*(int *)(v44 + 48)], (uint64_t)v9, type metadata accessor for ScopeGraphElement.ID);
      if (*(void *)(v16 + 16) && (unint64_t v49 = sub_25EA02548((uint64_t)v9), (v50 & 1) != 0))
      {
        uint64_t v51 = v82;
        sub_25E9FB3A0(*(void *)(v16 + 56) + *(void *)(v83 + 72) * v49, v82, (uint64_t (*)(void))sub_25E9F04B8);
        uint64_t v52 = v51;
        uint64_t v53 = v92;
        sub_25E9F8188(v52, v92, (uint64_t (*)(void))sub_25E9F04B8);
        uint64_t v54 = (void *)(v53 + *(int *)(type metadata accessor for ScopeGraphElement(0) + 24));
        uint64_t v55 = v54[3];
        uint64_t v56 = v54[4];
        sub_25E9EFC30(v54, v55);
        if ((*(uint64_t (**)(uint64_t, uint64_t))(v56 + 40))(v55, v56))
        {
          sub_25E9FB3A0((uint64_t)v9, v81, type metadata accessor for ScopeGraphElement.ID);
          sub_25E9FA2AC(v84);
          uint64_t v57 = v85;
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v99 = v57;
          unint64_t v59 = sub_25EA024DC(v93);
          uint64_t v60 = v57[2];
          LODWORD(v84) = v61;
          BOOL v62 = (v61 & 1) == 0;
          uint64_t v63 = v60 + v62;
          if (__OFADD__(v60, v62)) {
            goto LABEL_76;
          }
          if (v57[3] >= v63)
          {
            if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
              sub_25EA033C4();
            }
            unint64_t v67 = v59;
            char v66 = v84;
          }
          else
          {
            sub_25EA09940(v63, isUniquelyReferenced_nonNull_native);
            unint64_t v64 = sub_25EA024DC(v93);
            char v66 = v84;
            if ((v84 & 1) != (v65 & 1)) {
              goto LABEL_79;
            }
            unint64_t v67 = v64;
          }
          uint64_t v68 = v99;
          swift_bridgeObjectRelease();
          unint64_t v80 = v67;
          uint64_t v84 = 8 * v67;
          if (v66)
          {
            swift_bridgeObjectRetain();
          }
          else
          {
            v68[(v67 >> 6) + 8] |= 1 << v67;
            *(void *)(v68[6] + 8 * v67) = v93;
            *(void *)(v68[7] + 8 * v67) = MEMORY[0x263F8EE78];
            uint64_t v69 = v68[2];
            uint64_t v70 = v69 + 1;
            BOOL v71 = __OFADD__(v69, 1);
            swift_bridgeObjectRetain();
            if (v71) {
              goto LABEL_77;
            }
            v68[2] = v70;
          }
          uint64_t v72 = v68[7];
          v85 = v68;
          swift_bridgeObjectRelease();
          uint64_t v73 = v84;
          unint64_t v74 = *(void *)(v72 + v84);
          char v75 = swift_isUniquelyReferenced_nonNull_native();
          *(void *)(v72 + v73) = v74;
          uint64_t v79 = v72;
          if ((v75 & 1) == 0)
          {
            unint64_t v74 = sub_25EA082B4(0, *(void *)(v74 + 16) + 1, 1, v74);
            *(void *)(v72 + 8 * v80) = v74;
          }
          unint64_t v77 = *(void *)(v74 + 16);
          unint64_t v76 = *(void *)(v74 + 24);
          if (v77 >= v76 >> 1)
          {
            unint64_t v74 = sub_25EA082B4(v76 > 1, v77 + 1, 1, v74);
            *(void *)(v79 + 8 * v80) = v74;
          }
          *(void *)(v74 + 16) = v77 + 1;
          sub_25E9F8188(v81, v74+ ((*(unsigned __int8 *)(v98 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v98 + 80))+ *(void *)(v98 + 72) * v77, type metadata accessor for ScopeGraphElement.ID);
          uint64_t v84 = (uint64_t)sub_25E9F14F8;
        }
        sub_25E9FAEE8((uint64_t)v9, type metadata accessor for ScopeGraphElement.ID);
        sub_25E9FAEE8(v92, (uint64_t (*)(void))sub_25E9F04B8);
        if (!v34) {
          goto LABEL_30;
        }
      }
      else
      {
        sub_25E9FAEE8((uint64_t)v9, type metadata accessor for ScopeGraphElement.ID);
        if (!v34) {
          goto LABEL_30;
        }
      }
    }
    swift_release();
    unint64_t v21 = v94;
    int64_t v22 = v95;
  }
LABEL_30:
  int64_t v45 = v36 + 1;
  if (!__OFADD__(v36, 1))
  {
    if (v45 >= v97)
    {
      unint64_t v47 = v36;
    }
    else
    {
      unint64_t v46 = *(void *)(v96 + 8 * v45);
      if (v46)
      {
LABEL_33:
        unint64_t v34 = (v46 - 1) & v46;
        unint64_t v38 = __clz(__rbit64(v46)) + (v45 << 6);
        unint64_t v36 = v45;
        goto LABEL_29;
      }
      unint64_t v47 = v36 + 1;
      if ((uint64_t)(v36 + 2) < v97)
      {
        unint64_t v46 = *(void *)(v96 + 8 * (v36 + 2));
        if (v46)
        {
          int64_t v45 = v36 + 2;
          goto LABEL_33;
        }
        unint64_t v47 = v36 + 2;
        if ((uint64_t)(v36 + 3) < v97)
        {
          unint64_t v46 = *(void *)(v96 + 8 * (v36 + 3));
          if (v46)
          {
            int64_t v45 = v36 + 3;
            goto LABEL_33;
          }
          int64_t v45 = v36 + 4;
          unint64_t v47 = v36 + 3;
          if ((uint64_t)(v36 + 4) < v97)
          {
            unint64_t v46 = *(void *)(v96 + 8 * v45);
            if (v46) {
              goto LABEL_33;
            }
            while (v90 != v36)
            {
              unint64_t v46 = *(void *)(v89 + 8 * v36++);
              if (v46)
              {
                int64_t v45 = v36 + 4;
                goto LABEL_33;
              }
            }
            unint64_t v47 = v88;
          }
        }
      }
    }
    sub_25E9FA1AC();
    uint64_t v44 = v48;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v48 - 8) + 56))(v13, 1, 1, v48);
    unint64_t v34 = 0;
    unint64_t v36 = v47;
    goto LABEL_36;
  }
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
  uint64_t result = sub_25EA364D0();
  __break(1u);
  return result;
}

void sub_25E9F14F8(void *a1@<X8>)
{
  *a1 = MEMORY[0x263F8EE78];
}

unint64_t sub_25E9F1508(uint64_t *a1)
{
  unint64_t v2 = 0;
  uint64_t v3 = *a1;
  uint64_t v4 = *(void *)(v1 + 56);
  uint64_t v24 = *(void *)(v1 + 48);
  uint64_t v5 = (void *)MEMORY[0x263F8EE78];
  uint64_t v23 = v4;
  uint64_t v25 = -1;
  while (1)
  {
    sub_25E9FADA4();
    sub_25E9FADFC((unint64_t *)&qword_26A727768, (void (*)(uint64_t))sub_25E9FADA4);
    uint64_t v12 = sub_25EA36110();
    uint64_t v14 = v13;
    swift_bridgeObjectRelease();
    if (*(void *)(v4 + 16))
    {
      sub_25EA024DC(v3);
      if (v15)
      {
        swift_bridgeObjectRetain();
        sub_25EA36150();
        sub_25EA36150();
        swift_bridgeObjectRelease();
      }
    }
    sub_25E9FAE44();
    sub_25EA36310();
    sub_25EA36150();
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v5 = sub_25EA082EC(0, v5[2] + 1, 1, v5);
    }
    unint64_t v17 = v5[2];
    unint64_t v16 = v5[3];
    if (v17 >= v16 >> 1) {
      uint64_t v5 = sub_25EA082EC((void *)(v16 > 1), v17 + 1, 1, v5);
    }
    v5[2] = v17 + 1;
    uint64_t v18 = &v5[2 * v17];
    v18[4] = v12;
    v18[5] = v14;
    if (!*(void *)(v24 + 16) || (unint64_t result = sub_25EA024DC(v3), (v20 & 1) == 0))
    {
      uint64_t v22 = sub_25EA36110();
      swift_bridgeObjectRelease();
      return v22;
    }
    if (__OFADD__(v2, 1)) {
      break;
    }
    uint64_t v3 = *(void *)(*(void *)(v24 + 56) + 8 * result);
    ++v2;
    uint64_t v21 = v25 + 1;
    uint64_t v4 = v23;
    ++v25;
    if (v2)
    {
      uint64_t v6 = (void *)sub_25EA361C0();
      v6[2] = v2;
      v6[4] = 32;
      v6[5] = 0xE100000000000000;
      if (v2 != 1)
      {
        uint64_t v7 = v6 + 6;
        if (v2 < 5)
        {
          uint64_t v8 = 1;
          goto LABEL_8;
        }
        unint64_t v9 = v21 & 0xFFFFFFFFFFFFFFFCLL;
        unint64_t v10 = (v2 - 1) & 0xFFFFFFFFFFFFFFFCLL;
        uint64_t v8 = v10 | 1;
        v7 += 2 * v10;
        uint64_t v11 = v6 + 10;
        do
        {
          *(v11 - 2) = xmmword_25EA37000;
          *(v11 - 1) = xmmword_25EA37000;
          *uint64_t v11 = xmmword_25EA37000;
          v11[1] = xmmword_25EA37000;
          v11 += 4;
          v9 -= 4;
        }
        while (v9);
        if (v2 - 1 != v10)
        {
          do
          {
LABEL_8:
            ++v8;
            *uint64_t v7 = 32;
            v7[1] = 0xE100000000000000;
            v7 += 2;
          }
          while (v2 != v8);
        }
      }
    }
  }
  __break(1u);
  return result;
}

void *sub_25E9F17F4(uint64_t *a1)
{
  uint64_t v2 = *(void *)(v1 + 48);
  if (!*(void *)(v2 + 16)) {
    return (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v3 = sub_25EA024DC(*a1);
  uint64_t v4 = (void *)MEMORY[0x263F8EE78];
  if (v5)
  {
    do
    {
      uint64_t v6 = *(void *)(*(void *)(v2 + 56) + 8 * v3);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v4 = sub_25EA08408(0, v4[2] + 1, 1, v4);
      }
      unint64_t v8 = v4[2];
      unint64_t v7 = v4[3];
      if (v8 >= v7 >> 1) {
        uint64_t v4 = sub_25EA08408((void *)(v7 > 1), v8 + 1, 1, v4);
      }
      v4[2] = v8 + 1;
      v4[v8 + 4] = v6;
      if (!*(void *)(v2 + 16)) {
        break;
      }
      unint64_t v3 = sub_25EA024DC(v6);
    }
    while ((v9 & 1) != 0);
  }
  return v4;
}

uint64_t sub_25E9F18D4(int64_t *a1)
{
  int64_t v3 = (int64_t)v1;
  sub_25E9F0484(0);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  unint64_t v8 = (char *)v90 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v106 = (uint64_t)v90 - v9;
  sub_25E9F04B8(0);
  v102 = v10;
  uint64_t v99 = *(v10 - 1);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 1);
  uint64_t v95 = (uint64_t)v90 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v94 = (uint64_t)v90 - v13;
  uint64_t v14 = type metadata accessor for ScopeGraphElement.ID(0);
  unint64_t v98 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v97 = (uint64_t)v90 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25E9F7BF4(0);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v18 = (char *)v90 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v19 = *a1;
  uint64_t v20 = *(void *)(v3 + 40);
  if (*(void *)(v20 + 16) && (unint64_t v21 = sub_25EA024DC(v19), (v22 & 1) != 0))
  {
    uint64_t v23 = *(unint64_t **)(*(void *)(v20 + 56) + 8 * v21);
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v23 = 0;
  }
  unint64_t v24 = sub_25EA024DC(v19);
  uint64_t v96 = v8;
  if ((v25 & 1) == 0) {
    goto LABEL_8;
  }
  unint64_t v2 = v24;
  int64_t v26 = (unint64_t *)v14;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v28 = *(void *)(v3 + 40);
  v108[0] = v28;
  *(void *)(v3 + 40) = 0x8000000000000000;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    goto LABEL_78;
  }
  while (1)
  {
    sub_25EA04810(v2, v28);
    unint64_t v2 = *(void *)(v3 + 40);
    *(void *)(v3 + 40) = v28;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v14 = (uint64_t)v26;
LABEL_8:
    int64_t v26 = v102;
    if (!v23) {
      goto LABEL_43;
    }
    v90[0] = v19;
    int64_t v29 = v3;
    int64_t v3 = 0;
    unint64_t v30 = v23[8];
    v100 = v23 + 8;
    uint64_t v31 = 1 << *((unsigned char *)v23 + 32);
    uint64_t v32 = -1;
    if (v31 < 64) {
      uint64_t v32 = ~(-1 << v31);
    }
    int64_t v19 = v32 & v30;
    int64_t v101 = (unint64_t)(v31 + 63) >> 6;
    uint64_t v33 = v97;
    unint64_t v2 = v98;
    unint64_t v104 = v98 + 48;
    v105 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v98 + 56);
    v103 = (void (**)(uint64_t, uint64_t, uint64_t, unint64_t *))(v99 + 56);
    v107 = (uint64_t *)v29;
    v90[1] = v29 + 24;
    uint64_t v91 = v18;
    uint64_t v92 = v23;
    uint64_t v93 = v14;
    if ((v32 & v30) != 0)
    {
      while (1)
      {
        unint64_t v35 = __clz(__rbit64(v19));
        v19 &= v19 - 1;
        unint64_t v36 = v35 | (v3 << 6);
LABEL_31:
        uint64_t v40 = *(void *)(v2 + 72);
        sub_25E9FB3A0(v23[7] + v40 * v36, (uint64_t)v18, type metadata accessor for ScopeGraphElement.ID);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v2 + 56))(v18, 0, 1, v14);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v18, 1, v14) == 1) {
          goto LABEL_42;
        }
        sub_25E9F8188((uint64_t)v18, v33, type metadata accessor for ScopeGraphElement.ID);
        uint64_t v41 = v107[1];
        if (*(void *)(v41 + 16) && (unint64_t v42 = sub_25EA02548(v33), (v43 & 1) != 0))
        {
          uint64_t v44 = *(void *)(v99 + 72);
          uint64_t v45 = *(void *)(v41 + 56) + v44 * v42;
          uint64_t v46 = v95;
          sub_25E9FB3A0(v45, v95, (uint64_t (*)(void))sub_25E9F04B8);
          sub_25E9F8188(v46, v106, (uint64_t (*)(void))sub_25E9F04B8);
          unint64_t v47 = v107;
          swift_bridgeObjectRetain();
          unint64_t v48 = sub_25EA02548(v33);
          char v50 = v49;
          swift_bridgeObjectRelease();
          uint64_t v51 = v103;
          if (v50)
          {
            char v52 = swift_isUniquelyReferenced_nonNull_native();
            uint64_t v53 = v47[1];
            v108[0] = v53;
            v47[1] = 0x8000000000000000;
            if ((v52 & 1) == 0)
            {
              sub_25EA02B34();
              uint64_t v53 = v108[0];
            }
            sub_25E9FAEE8(*(void *)(v53 + 48) + v48 * v40, type metadata accessor for ScopeGraphElement.ID);
            uint64_t v54 = (uint64_t)v96;
            sub_25E9F8188(*(void *)(v53 + 56) + v48 * v44, (uint64_t)v96, (uint64_t (*)(void))sub_25E9F04B8);
            sub_25EA040B0(v48, v53);
            v47[1] = v53;
            swift_bridgeObjectRelease();
            uint64_t v55 = *v51;
            uint64_t v56 = v54;
            uint64_t v57 = 0;
          }
          else
          {
            uint64_t v55 = *v103;
            uint64_t v54 = (uint64_t)v96;
            uint64_t v56 = (uint64_t)v96;
            uint64_t v57 = 1;
          }
          uint64_t v58 = v102;
          v55(v56, v57, 1, v102);
          sub_25E9FAEE8(v54, (uint64_t (*)(void))sub_25E9F0484);
          uint64_t v59 = v97;
          sub_25E9F7470(v97);
          uint64_t v60 = v106;
          v55(v106, 0, 1, v58);
          uint64_t v61 = v94;
          sub_25E9F8188(v60, v94, (uint64_t (*)(void))sub_25E9F04B8);
          BOOL v62 = (void *)(v61 + *(int *)(type metadata accessor for ScopeGraphElement(0) + 24));
          uint64_t v63 = v62[3];
          uint64_t v64 = v62[4];
          sub_25E9EFC30(v62, v63);
          int64_t v26 = v102;
          (*(void (**)(uint64_t, uint64_t))(v64 + 80))(v63, v64);
          uint64_t v33 = v59;
          sub_25E9FAEE8(v59, type metadata accessor for ScopeGraphElement.ID);
          sub_25E9FAEE8(v61, (uint64_t (*)(void))sub_25E9F04B8);
          uint64_t v23 = v92;
          uint64_t v14 = v93;
          unint64_t v2 = v98;
          uint64_t v18 = v91;
          if (!v19) {
            break;
          }
        }
        else
        {
          uint64_t v34 = v106;
          (*v103)(v106, 1, 1, v26);
          sub_25E9FAEE8(v33, type metadata accessor for ScopeGraphElement.ID);
          sub_25E9FAEE8(v34, (uint64_t (*)(void))sub_25E9F0484);
          if (!v19) {
            break;
          }
        }
      }
    }
    int64_t v37 = v3 + 1;
    if (!__OFADD__(v3, 1)) {
      break;
    }
LABEL_77:
    __break(1u);
LABEL_78:
    sub_25EA03110();
    uint64_t v28 = v108[0];
  }
  if (v37 >= v101) {
    goto LABEL_41;
  }
  unint64_t v38 = v100[v37];
  ++v3;
  if (v38) {
    goto LABEL_30;
  }
  int64_t v3 = v37 + 1;
  if (v37 + 1 >= v101) {
    goto LABEL_41;
  }
  unint64_t v38 = v100[v3];
  if (v38) {
    goto LABEL_30;
  }
  int64_t v3 = v37 + 2;
  if (v37 + 2 >= v101) {
    goto LABEL_41;
  }
  unint64_t v38 = v100[v3];
  if (v38) {
    goto LABEL_30;
  }
  int64_t v3 = v37 + 3;
  if (v37 + 3 >= v101) {
    goto LABEL_41;
  }
  unint64_t v38 = v100[v3];
  if (v38)
  {
LABEL_30:
    int64_t v19 = (v38 - 1) & v38;
    unint64_t v36 = __clz(__rbit64(v38)) + (v3 << 6);
    goto LABEL_31;
  }
  int64_t v39 = v37 + 4;
  if (v39 < v101)
  {
    unint64_t v38 = v100[v39];
    if (v38)
    {
      int64_t v3 = v39;
      goto LABEL_30;
    }
    while (1)
    {
      int64_t v3 = v39 + 1;
      if (__OFADD__(v39, 1)) {
        break;
      }
      if (v3 >= v101) {
        goto LABEL_41;
      }
      unint64_t v38 = v100[v3];
      ++v39;
      if (v38) {
        goto LABEL_30;
      }
    }
    __break(1u);
LABEL_80:
    sub_25EA03740();
    uint64_t v68 = v108[0];
LABEL_45:
    sub_25EA04810((unint64_t)v26, v68);
    *(void *)(v3 + 48) = v68;
    swift_bridgeObjectRelease();
    goto LABEL_46;
  }
LABEL_41:
  (*v105)(v18, 1, 1, v14);
LABEL_42:
  swift_release();
  int64_t v19 = v90[0];
  int64_t v3 = (int64_t)v107;
LABEL_43:
  unint64_t v65 = sub_25EA024DC(v19);
  if (v66)
  {
    int64_t v26 = (unint64_t *)v65;
    char v67 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v68 = *(void *)(v3 + 48);
    v108[0] = v68;
    *(void *)(v3 + 48) = 0x8000000000000000;
    if ((v67 & 1) == 0) {
      goto LABEL_80;
    }
    goto LABEL_45;
  }
LABEL_46:
  unint64_t v69 = sub_25EA024DC(v19);
  if (v70)
  {
    unint64_t v71 = v69;
    char v72 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v73 = *(void *)(v3 + 64);
    v108[0] = v73;
    *(void *)(v3 + 64) = 0x8000000000000000;
    if ((v72 & 1) == 0)
    {
      sub_25EA02914();
      uint64_t v73 = v108[0];
    }
    sub_25EA049CC(v71, v73);
    *(void *)(v3 + 64) = v73;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  unint64_t v74 = sub_25EA024DC(v19);
  if (v75)
  {
    unint64_t v76 = v74;
    char v77 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v78 = *(void *)(v3 + 72);
    v108[0] = v78;
    *(void *)(v3 + 72) = 0x8000000000000000;
    if ((v77 & 1) == 0)
    {
      sub_25EA0295C();
      uint64_t v78 = v108[0];
    }
    sub_25EA049CC(v76, v78);
    *(void *)(v3 + 72) = v78;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  uint64_t v79 = swift_bridgeObjectRetain();
  int64_t v26 = sub_25E9F801C(v79, (unint64_t *)v19);
  swift_bridgeObjectRelease();
  int64_t v80 = 0;
  uint64_t v23 = v26 + 8;
  uint64_t v81 = 1 << *((unsigned char *)v26 + 32);
  uint64_t v82 = -1;
  if (v81 < 64) {
    uint64_t v82 = ~(-1 << v81);
  }
  unint64_t v83 = v82 & v26[8];
  int64_t v19 = (unint64_t)(v81 + 63) >> 6;
  while (1)
  {
    if (v83)
    {
      unint64_t v84 = __clz(__rbit64(v83));
      v83 &= v83 - 1;
      unint64_t v85 = v84 | (v80 << 6);
      goto LABEL_58;
    }
    int64_t v86 = v80 + 1;
    if (__OFADD__(v80, 1))
    {
      __break(1u);
LABEL_76:
      __break(1u);
      goto LABEL_77;
    }
    if (v86 >= v19) {
      return swift_release();
    }
    unint64_t v87 = v23[v86];
    ++v80;
    if (!v87)
    {
      int64_t v80 = v86 + 1;
      if (v86 + 1 >= v19) {
        return swift_release();
      }
      unint64_t v87 = v23[v80];
      if (!v87)
      {
        int64_t v80 = v86 + 2;
        if (v86 + 2 >= v19) {
          return swift_release();
        }
        unint64_t v87 = v23[v80];
        if (!v87) {
          break;
        }
      }
    }
LABEL_73:
    unint64_t v83 = (v87 - 1) & v87;
    unint64_t v85 = __clz(__rbit64(v87)) + (v80 << 6);
LABEL_58:
    v108[0] = *(void *)(v26[6] + 8 * v85);
    sub_25E9F18D4(v108);
  }
  int64_t v88 = v86 + 3;
  if (v88 < v19)
  {
    unint64_t v87 = v23[v88];
    if (!v87)
    {
      while (1)
      {
        int64_t v80 = v88 + 1;
        if (__OFADD__(v88, 1)) {
          goto LABEL_76;
        }
        if (v80 >= v19) {
          return swift_release();
        }
        unint64_t v87 = v23[v80];
        ++v88;
        if (v87) {
          goto LABEL_73;
        }
      }
    }
    int64_t v80 = v88;
    goto LABEL_73;
  }
  return swift_release();
}

uint64_t sub_25E9F22F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v9 = (uint64_t)v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *v10;
  uint64_t v12 = type metadata accessor for ExplicitCommandHandlerUpdate();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v9, a1, a3);
  uint64_t v13 = sub_25EA0C7E8(v9);
  v30[3] = v12;
  v30[4] = swift_getWitnessTable();
  v30[0] = v13;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v29[0] = *(void *)(v4 + 64);
  uint64_t v15 = v29[0];
  *(void *)(v4 + 64) = 0x8000000000000000;
  unint64_t v17 = sub_25EA024DC(v11);
  uint64_t v18 = *(void *)(v15 + 16);
  BOOL v19 = (v16 & 1) == 0;
  uint64_t v20 = v18 + v19;
  if (__OFADD__(v18, v19))
  {
    __break(1u);
    goto LABEL_10;
  }
  LOBYTE(v9) = v16;
  if (*(void *)(v15 + 24) >= v20)
  {
    if (isUniquelyReferenced_nonNull_native) {
      goto LABEL_6;
    }
LABEL_10:
    sub_25EA02914();
    uint64_t v15 = v29[0];
    goto LABEL_6;
  }
  sub_25EA08934(v20, isUniquelyReferenced_nonNull_native);
  uint64_t v15 = v29[0];
  unint64_t v21 = sub_25EA024DC(v11);
  if ((v9 & 1) != (v22 & 1))
  {
    uint64_t result = sub_25EA364D0();
    __break(1u);
    return result;
  }
  unint64_t v17 = v21;
LABEL_6:
  *(void *)(v4 + 64) = v15;
  swift_bridgeObjectRelease();
  if ((v9 & 1) == 0) {
    sub_25EA0B18C(v17, v11, MEMORY[0x263F8EE80], *(void **)(v4 + 64));
  }
  swift_getAssociatedTypeWitness();
  uint64_t v23 = sub_25EA0CEF8();
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  sub_25E9FA04C((uint64_t)v30, (uint64_t)v29);
  sub_25E9FFA44((uint64_t)v29, v23, v25, v27);
  return sub_25E9FAD34((uint64_t)v30, &qword_26A7276E0, &qword_26A7276E8, (uint64_t)&protocol descriptor for GraphUpdate);
}

uint64_t sub_25E9F2560(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = v3;
  uint64_t v6 = a3;
  uint64_t v8 = *(a3 - 1);
  MEMORY[0x270FA5388](a1);
  unint64_t v10 = (char *)&v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *v11;
  uint64_t v13 = type metadata accessor for ExplicitEventHandlerUpdate();
  (*(void (**)(char *, uint64_t, void *))(v8 + 16))(v10, a1, v6);
  uint64_t v14 = sub_25EA0C7E8((uint64_t)v10);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  char v50 = *(void **)(v5 + 72);
  uint64_t v16 = (uint64_t)v50;
  *(void *)(v5 + 72) = 0x8000000000000000;
  unint64_t v18 = sub_25EA024DC(v12);
  uint64_t v19 = *(void *)(v16 + 16);
  BOOL v20 = (v17 & 1) == 0;
  uint64_t v21 = v19 + v20;
  if (__OFADD__(v19, v20))
  {
    __break(1u);
    goto LABEL_25;
  }
  LOBYTE(v4) = v17;
  if (*(void *)(v16 + 24) >= v21)
  {
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      goto LABEL_27;
    }
  }
  else
  {
    sub_25EA0897C(v21, isUniquelyReferenced_nonNull_native);
    uint64_t v16 = (uint64_t)v50;
    unint64_t v22 = sub_25EA024DC(v12);
    if ((v4 & 1) != (v23 & 1))
    {
      sub_25EA364D0();
      __break(1u);
      goto LABEL_29;
    }
    unint64_t v18 = v22;
  }
  while (1)
  {
    *(void *)(v5 + 72) = v16;
    swift_bridgeObjectRelease();
    uint64_t v24 = *(void *)(v5 + 72);
    if ((v4 & 1) == 0) {
      sub_25EA0B18C(v18, v12, MEMORY[0x263F8EE80], *(void **)(v5 + 72));
    }
    uint64_t v4 = *(void *)(v24 + 56);
    uint64_t v25 = *(void *)(v4 + 8 * v18);
    swift_getAssociatedTypeWitness();
    sub_25EA0CEF8();
    uint64_t v5 = v27;
    if (*(void *)(v25 + 16) && (unint64_t v28 = sub_25EA06630(v26), (v29 & 1) != 0))
    {
      uint64_t v6 = *(void **)(*(void *)(v25 + 56) + 8 * v28);
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v6 = (void *)MEMORY[0x263F8EE78];
    }
    swift_bridgeObjectRelease();
    char v30 = swift_isUniquelyReferenced_nonNull_native();
    char v50 = v6;
    if ((v30 & 1) == 0)
    {
LABEL_25:
      uint64_t v6 = sub_25EA08178(0, v6[2] + 1, 1, v6);
      char v50 = v6;
    }
    unint64_t v32 = v6[2];
    unint64_t v31 = v6[3];
    if (v32 >= v31 >> 1)
    {
      uint64_t v6 = sub_25EA08178((void *)(v31 > 1), v32 + 1, 1, v6);
      char v50 = v6;
    }
    uint64_t v49 = v14;
    uint64_t WitnessTable = swift_getWitnessTable();
    sub_25E9F9C88(v32, (uint64_t)&v49, (uint64_t *)&v50, v13, WitnessTable);
    char v50 = v6;
    uint64_t v34 = sub_25EA0CEF8();
    uint64_t v13 = v35;
    uint64_t v14 = v36;
    uint64_t v37 = 8 * v18;
    uint64_t v12 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v49 = *(void *)(v4 + 8 * v18);
    uint64_t v38 = v49;
    *(void *)(v4 + 8 * v18) = 0x8000000000000000;
    unint64_t v18 = sub_25EA06630(v14);
    uint64_t v40 = *(void *)(v38 + 16);
    BOOL v41 = (v39 & 1) == 0;
    uint64_t v42 = v40 + v41;
    if (!__OFADD__(v40, v41)) {
      break;
    }
    __break(1u);
LABEL_27:
    sub_25EA0295C();
    uint64_t v16 = (uint64_t)v50;
  }
  char v43 = v39;
  if (*(void *)(v38 + 24) >= v42)
  {
    if ((v12 & 1) == 0) {
      sub_25EA02B1C();
    }
    goto LABEL_21;
  }
  sub_25EA08C70(v42, v12);
  unint64_t v44 = sub_25EA06630(v14);
  if ((v43 & 1) != (v45 & 1))
  {
LABEL_29:
    uint64_t result = sub_25EA364D0();
    __break(1u);
    return result;
  }
  unint64_t v18 = v44;
LABEL_21:
  *(void *)(v4 + v37) = v49;
  swift_bridgeObjectRelease();
  uint64_t v46 = *(void *)(v4 + v37);
  if ((v43 & 1) == 0)
  {
    sub_25EA0B1F0(v18, v34, v13, v14, MEMORY[0x263F8EE78], *(void **)(v4 + v37));
    swift_bridgeObjectRetain();
  }
  uint64_t v47 = *(void *)(v46 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v47 + 8 * v18) = v6;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25E9F2970(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = type metadata accessor for ScopeGraphElement.ID(0);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *a4;
  uint64_t v14 = nullsub_1(a1, a2);
  uint64_t v16 = v15;
  sub_25E9FB3A0(a3, (uint64_t)v12, type metadata accessor for ScopeGraphElement.ID);
  v34[0] = v14;
  v34[1] = v16;
  uint64_t v17 = type metadata accessor for MutatingFunction();
  swift_getWitnessTable();
  v35[3] = type metadata accessor for VertexUpdate();
  v35[4] = swift_getWitnessTable();
  unint64_t v18 = sub_25E9F9FE8(v35);
  sub_25EA2E6D4((uint64_t)v12, (uint64_t)v34, v17, (uint64_t)v18);
  swift_retain();
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v20 = *(void *)(v4 + 64);
  v34[0] = v20;
  *(void *)(v5 + 64) = 0x8000000000000000;
  unint64_t v22 = sub_25EA024DC(v13);
  uint64_t v23 = *(void *)(v20 + 16);
  BOOL v24 = (v21 & 1) == 0;
  uint64_t v25 = v23 + v24;
  if (__OFADD__(v23, v24))
  {
    __break(1u);
    goto LABEL_10;
  }
  LOBYTE(a2) = v21;
  if (*(void *)(v20 + 24) >= v25)
  {
    if (isUniquelyReferenced_nonNull_native) {
      goto LABEL_6;
    }
LABEL_10:
    sub_25EA02914();
    uint64_t v20 = v34[0];
    goto LABEL_6;
  }
  sub_25EA08934(v25, isUniquelyReferenced_nonNull_native);
  uint64_t v20 = v34[0];
  unint64_t v26 = sub_25EA024DC(v13);
  if ((a2 & 1) != (v27 & 1))
  {
    uint64_t result = sub_25EA364D0();
    __break(1u);
    return result;
  }
  unint64_t v22 = v26;
LABEL_6:
  *(void *)(v5 + 64) = v20;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    sub_25EA0B18C(v22, v13, MEMORY[0x263F8EE80], *(void **)(v5 + 64));
  }
  uint64_t v28 = sub_25EA0CEF8();
  uint64_t v30 = v29;
  uint64_t v32 = v31;
  sub_25E9FA04C((uint64_t)v35, (uint64_t)v34);
  sub_25E9FFA44((uint64_t)v34, v28, v30, v32);
  sub_25E9FAD34((uint64_t)v35, &qword_26A7276E0, &qword_26A7276E8, (uint64_t)&protocol descriptor for GraphUpdate);
  return swift_release();
}

uint64_t sub_25E9F2C34(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *a2;
  uint64_t v7 = *(void *)(v4 + 40);
  uint64_t v8 = *(void *)(v4 + 48);
  uint64_t v9 = *(void *)(v4 + 64);
  uint64_t v26 = *(void *)(v4 + 72);
  uint64_t v24 = *(void *)(v4 + 32);
  uint64_t v25 = *(void *)(v4 + 56);
  uint64_t v22 = *(void *)(v4 + 16);
  uint64_t v23 = *(void *)(v4 + 24);
  long long v21 = *(_OWORD *)v4;
  if (*(void *)(v9 + 16) && (unint64_t v11 = sub_25EA024DC(v6), (v12 & 1) != 0))
  {
    uint64_t v13 = *(void *)(*(void *)(v9 + 56) + 8 * v11);
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v13 = MEMORY[0x263F8EE80];
  }
  sub_25EA0CEF8();
  if (!*(void *)(v13 + 16) || (unint64_t v15 = sub_25EA06630(v14), (v16 & 1) == 0))
  {
    uint64_t v39 = 0;
    long long v37 = 0u;
    long long v38 = 0u;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  sub_25E9EFBCC(*(void *)(v13 + 56) + 40 * v15, (uint64_t)&v37);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((void *)&v38 + 1))
  {
LABEL_12:
    uint64_t result = sub_25E9FAD34((uint64_t)&v37, &qword_26A7276E0, &qword_26A7276E8, (uint64_t)&protocol descriptor for GraphUpdate);
    goto LABEL_13;
  }
  sub_25E9FAE98(0, &qword_26A7276E8);
  uint64_t v43 = a3;
  swift_getExtendedExistentialTypeMetadata_unique();
  uint64_t result = swift_dynamicCast();
  if ((result & 1) != 0 && v30)
  {
    sub_25E9F9FD0(&v28, (uint64_t)v40);
    uint64_t v19 = v41;
    uint64_t v18 = v42;
    sub_25E9EFC30(v40, v41);
    long long v28 = v21;
    uint64_t v29 = v22;
    uint64_t v30 = v23;
    uint64_t v31 = v24;
    uint64_t v32 = v7;
    uint64_t v33 = v8;
    uint64_t v34 = v25;
    uint64_t v35 = v9;
    uint64_t v36 = v26;
    (*(void (**)(long long *, uint64_t, uint64_t, uint64_t))(v18 + 16))(&v28, a1, v19, v18);
    return sub_25E9EF02C((uint64_t)v40);
  }
LABEL_13:
  if (*(void *)(v8 + 16))
  {
    uint64_t result = sub_25EA024DC(v6);
    if (v20)
    {
      v40[0] = *(void *)(*(void *)(v8 + 56) + 8 * result);
      return sub_25E9F2C34(a1, v40, a3, a4);
    }
  }
  return result;
}

uint64_t sub_25E9F2EC4(void (*a1)(void, void, void), uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, void (*a6)(void, void, void), char *a7)
{
  uint64_t v76 = a3;
  uint64_t v73 = a7;
  unint64_t v74 = a1;
  uint64_t v10 = type metadata accessor for ScopeGraphElement.ID(0);
  MEMORY[0x270FA5388](v10 - 8);
  char v12 = (char *)&v69 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for NonmutatingFunction();
  swift_getWitnessTable();
  uint64_t v14 = type metadata accessor for VertexUpdate();
  uint64_t v77 = *(void *)(v14 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  char v72 = (char *)&v69 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v69 - v18;
  MEMORY[0x270FA5388](v17);
  long long v21 = (char *)&v69 - v20;
  uint64_t v22 = *a4;
  uint64_t v23 = v74;
  unint64_t v74 = a6;
  uint64_t v24 = nullsub_1(v23, a2);
  uint64_t v26 = v25;
  sub_25E9FB3A0(v76, (uint64_t)v12, type metadata accessor for ScopeGraphElement.ID);
  v79[0] = v24;
  v79[1] = v26;
  uint64_t v27 = (uint64_t)v12;
  uint64_t v28 = v77;
  sub_25EA2E6D4(v27, (uint64_t)v79, v13, (uint64_t)v21);
  uint64_t v29 = *(void *)(v28 + 16);
  uint64_t v73 = v19;
  char v70 = v21;
  uint64_t v71 = v28 + 16;
  uint64_t v76 = v14;
  ((void (*)(char *, char *, uint64_t))v29)(v19, v21, v14);
  uint64_t v30 = v75;
  swift_retain();
  uint64_t v69 = v26;
  swift_retain();
  uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v79[0] = *(void *)(v30 + 72);
  uint64_t v32 = v79[0];
  *(void *)(v30 + 72) = 0x8000000000000000;
  unint64_t v34 = sub_25EA024DC(v22);
  uint64_t v35 = *(void *)(v32 + 16);
  BOOL v36 = (v33 & 1) == 0;
  uint64_t v37 = v35 + v36;
  if (__OFADD__(v35, v36))
  {
    __break(1u);
    goto LABEL_25;
  }
  LOBYTE(v38) = v33;
  if (*(void *)(v32 + 24) >= v37)
  {
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      goto LABEL_27;
    }
  }
  else
  {
    sub_25EA0897C(v37, isUniquelyReferenced_nonNull_native);
    uint64_t v32 = v79[0];
    unint64_t v39 = sub_25EA024DC(v22);
    if ((v38 & 1) != (v40 & 1))
    {
      sub_25EA364D0();
      __break(1u);
      goto LABEL_29;
    }
    unint64_t v34 = v39;
  }
  while (1)
  {
    unint64_t v74 = (void (*)(void, void, void))v29;
    *(void *)(v30 + 72) = v32;
    swift_bridgeObjectRelease();
    uint64_t v41 = *(void *)(v30 + 72);
    if ((v38 & 1) == 0) {
      sub_25EA0B18C(v34, v22, MEMORY[0x263F8EE80], *(void **)(v30 + 72));
    }
    uint64_t v22 = *(void *)(v41 + 56);
    uint64_t v42 = *(void *)(v22 + 8 * v34);
    sub_25EA0CEF8();
    if (*(void *)(v42 + 16) && (unint64_t v44 = sub_25EA06630(v43), (v45 & 1) != 0))
    {
      uint64_t isUniquelyReferenced_nonNull_native = *(void *)(*(void *)(v42 + 56) + 8 * v44);
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t isUniquelyReferenced_nonNull_native = MEMORY[0x263F8EE78];
    }
    swift_bridgeObjectRelease();
    char v46 = swift_isUniquelyReferenced_nonNull_native();
    v79[0] = isUniquelyReferenced_nonNull_native;
    if ((v46 & 1) == 0)
    {
LABEL_25:
      uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)sub_25EA08178(0, *(void *)(isUniquelyReferenced_nonNull_native + 16) + 1, 1, (void *)isUniquelyReferenced_nonNull_native);
      v79[0] = isUniquelyReferenced_nonNull_native;
    }
    unint64_t v48 = *(void *)(isUniquelyReferenced_nonNull_native + 16);
    unint64_t v47 = *(void *)(isUniquelyReferenced_nonNull_native + 24);
    if (v48 >= v47 >> 1) {
      v79[0] = (uint64_t)sub_25EA08178((void *)(v47 > 1), v48 + 1, 1, (void *)isUniquelyReferenced_nonNull_native);
    }
    uint64_t v50 = (uint64_t)v72;
    uint64_t v49 = v73;
    uint64_t v51 = v76;
    v74(v72, v73, v76);
    uint64_t WitnessTable = swift_getWitnessTable();
    sub_25E9F9C88(v48, v50, v79, v51, WitnessTable);
    uint64_t v30 = *(void *)(v28 + 8);
    uint64_t v77 = v28 + 8;
    ((void (*)(char *, uint64_t))v30)(v49, v51);
    uint64_t v53 = v79[0];
    uint64_t v75 = sub_25EA0CEF8();
    uint64_t v55 = v54;
    uint64_t v28 = v56;
    v34 *= 8;
    uint64_t v29 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v78 = *(void *)(v22 + v34);
    uint64_t v57 = v78;
    *(void *)(v22 + v34) = 0x8000000000000000;
    unint64_t v38 = sub_25EA06630(v28);
    uint64_t v59 = *(void *)(v57 + 16);
    BOOL v60 = (v58 & 1) == 0;
    uint64_t v61 = v59 + v60;
    if (!__OFADD__(v59, v60)) {
      break;
    }
    __break(1u);
LABEL_27:
    sub_25EA0295C();
    uint64_t v32 = v79[0];
  }
  char v62 = v58;
  if (*(void *)(v57 + 24) >= v61)
  {
    if ((v29 & 1) == 0) {
      sub_25EA02B1C();
    }
    goto LABEL_21;
  }
  sub_25EA08C70(v61, v29);
  unint64_t v63 = sub_25EA06630(v28);
  if ((v62 & 1) != (v64 & 1))
  {
LABEL_29:
    uint64_t result = sub_25EA364D0();
    __break(1u);
    return result;
  }
  unint64_t v38 = v63;
LABEL_21:
  unint64_t v65 = v70;
  *(void *)(v22 + v34) = v78;
  swift_bridgeObjectRelease();
  uint64_t v66 = *(void *)(v22 + v34);
  if ((v62 & 1) == 0)
  {
    sub_25EA0B1F0(v38, v75, v55, v28, MEMORY[0x263F8EE78], *(void **)(v22 + v34));
    swift_bridgeObjectRetain();
  }
  uint64_t v67 = *(void *)(v66 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v67 + 8 * v38) = v53;
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return ((uint64_t (*)(char *, uint64_t))v30)(v65, v76);
}

uint64_t sub_25E9F3464(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v43 = a4;
  uint64_t v45 = a1;
  uint64_t v6 = *a2;
  uint64_t v7 = *v4;
  uint64_t v8 = v4[2];
  uint64_t v9 = v4[3];
  uint64_t v10 = v4[4];
  uint64_t v11 = v4[5];
  uint64_t v12 = v4[6];
  uint64_t v13 = v4[7];
  uint64_t v14 = v4[8];
  uint64_t v15 = v4[9];
  uint64_t v53 = v4[1];
  uint64_t v54 = v7;
  uint64_t v60 = v7;
  uint64_t v61 = v53;
  uint64_t v52 = v8;
  uint64_t v62 = v8;
  uint64_t v63 = v9;
  uint64_t v51 = v9;
  uint64_t v50 = v10;
  uint64_t v64 = v10;
  uint64_t v65 = v11;
  uint64_t v49 = v11;
  uint64_t v48 = v12;
  uint64_t v66 = v12;
  uint64_t v67 = v13;
  uint64_t v47 = v13;
  uint64_t v46 = v14;
  uint64_t v68 = v14;
  uint64_t v69 = v15;
  v56[0] = v6;
  uint64_t v16 = (uint64_t)sub_25E9F17F4(v56);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    goto LABEL_24;
  }
  while (1)
  {
    unint64_t v18 = *(void *)(v16 + 16);
    unint64_t v17 = *(void *)(v16 + 24);
    if (v18 >= v17 >> 1) {
      uint64_t v16 = (uint64_t)sub_25EA08408((void *)(v17 > 1), v18 + 1, 1, (void *)v16);
    }
    *(void *)(v16 + 16) = v18 + 1;
    *(void *)(v16 + 8 * v18 + 32) = v6;
    uint64_t v70 = v16;
    uint64_t v60 = v54;
    uint64_t v61 = v53;
    uint64_t v62 = v52;
    uint64_t v63 = v51;
    uint64_t v64 = v50;
    uint64_t v65 = v49;
    uint64_t v66 = v48;
    uint64_t v67 = v47;
    uint64_t v68 = v46;
    uint64_t v69 = v15;
    v56[0] = v6;
    uint64_t v19 = sub_25E9F3AF0(v56);
    sub_25E9F3D3C(v19);
    uint64_t v60 = a3;
    uint64_t ExtendedExistentialTypeMetadata_unique = swift_getExtendedExistentialTypeMetadata_unique();
    uint64_t v21 = sub_25EA36070();
    uint64_t v59 = v21;
    uint64_t v22 = v70;
    uint64_t v23 = *(void *)(v70 + 16);
    uint64_t v55 = v15;
    if (v23)
    {
      swift_bridgeObjectRetain();
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)(v15 + 16))
        {
          unint64_t v25 = sub_25EA024DC(*(void *)(v22 + 8 * i + 32));
          if (v26)
          {
            uint64_t v27 = *(void *)(*(void *)(v15 + 56) + 8 * v25);
            swift_bridgeObjectRetain();
            sub_25EA0CEF8();
            if (*(void *)(v27 + 16) && (unint64_t v29 = sub_25EA06630(v28), (v30 & 1) != 0))
            {
              uint64_t v31 = *(void *)(*(void *)(v27 + 56) + 8 * v29);
              swift_bridgeObjectRetain();
              swift_bridgeObjectRelease();
              uint64_t v32 = swift_bridgeObjectRelease();
              *(void *)&long long v44 = &v42;
              uint64_t v60 = v31;
              MEMORY[0x270FA5388](v32);
              uint64_t v33 = v43;
              *(&v42 - 2) = a3;
              *(&v42 - 1) = v33;
              sub_25E9FA0DC(0, &qword_26A727728, &qword_26A7276E8, (uint64_t)&protocol descriptor for GraphUpdate, MEMORY[0x263F8D488]);
              sub_25E9FA440();
              uint64_t v34 = sub_25EA36170();
              swift_bridgeObjectRelease();
              uint64_t v60 = v34;
              sub_25EA36200();
              swift_getWitnessTable();
              uint64_t v15 = v55;
              sub_25EA361E0();
            }
            else
            {
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
            }
          }
        }
      }
      swift_bridgeObjectRelease();
      uint64_t v35 = v59;
    }
    else
    {
      uint64_t v35 = v21;
    }
    swift_bridgeObjectRelease();
    uint64_t v36 = MEMORY[0x2611E7170](v35, ExtendedExistentialTypeMetadata_unique);
    uint64_t v6 = v45;
    if (!v36) {
      return swift_bridgeObjectRelease();
    }
    uint64_t v15 = 0;
    a3 = v35 + 32;
    *(void *)&long long v37 = 138412290;
    long long v44 = v37;
    while (1)
    {
      uint64_t v16 = sub_25EA361D0();
      sub_25EA361A0();
      if ((v16 & 1) == 0) {
        break;
      }
      uint64_t v38 = v15 + 1;
      if (__OFADD__(v15, 1)) {
        goto LABEL_23;
      }
      sub_25E9EFBCC(a3, (uint64_t)v56);
      uint64_t v39 = v57;
      uint64_t v40 = v58;
      sub_25E9EFC30(v56, v57);
      uint64_t v60 = v54;
      uint64_t v61 = v53;
      uint64_t v62 = v52;
      uint64_t v63 = v51;
      uint64_t v64 = v50;
      uint64_t v65 = v49;
      uint64_t v66 = v48;
      uint64_t v67 = v47;
      uint64_t v68 = v46;
      uint64_t v69 = v55;
      (*(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(v40 + 16))(&v60, v6, v39, v40);
      sub_25E9EF02C((uint64_t)v56);
      ++v15;
      a3 += 40;
      if (v38 == MEMORY[0x2611E7170](v35, ExtendedExistentialTypeMetadata_unique)) {
        return swift_bridgeObjectRelease();
      }
    }
    sub_25EA36390();
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    uint64_t v16 = (uint64_t)sub_25EA08408(0, *(void *)(v16 + 16) + 1, 1, (void *)v16);
  }
}

uint64_t sub_25E9F3AF0(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v28 = *v1;
  long long v26 = *(_OWORD *)(v1 + 3);
  long long v27 = *(_OWORD *)(v1 + 1);
  uint64_t v25 = v1[5];
  long long v3 = *((_OWORD *)v1 + 3);
  long long v23 = *((_OWORD *)v1 + 4);
  uint64_t v35 = (void *)MEMORY[0x263F8EE78];
  long long v24 = v3;
  uint64_t v4 = v3;
  uint64_t v5 = v3 + 64;
  uint64_t v6 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(v3 + 64);
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v11 = 0;
  while (v8)
  {
    unint64_t v12 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    unint64_t v13 = v12 | (v11 << 6);
LABEL_20:
    uint64_t v17 = 8 * v13;
    if (v2 == *(void *)(*(void *)(v4 + 56) + v17))
    {
      uint64_t v18 = *(void *)(*(void *)(v4 + 48) + v17);
      uint64_t v19 = v35;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v19 = sub_25EA08408(0, v19[2] + 1, 1, v19);
      }
      unint64_t v21 = v19[2];
      unint64_t v20 = v19[3];
      if (v21 >= v20 >> 1) {
        uint64_t v19 = sub_25EA08408((void *)(v20 > 1), v21 + 1, 1, v19);
      }
      v19[2] = v21 + 1;
      v19[v21 + 4] = v18;
      uint64_t v35 = v19;
      v29[0] = v18;
      v29[1] = v28;
      long long v30 = v27;
      long long v31 = v26;
      uint64_t v32 = v25;
      long long v33 = v24;
      long long v34 = v23;
      uint64_t v22 = sub_25E9F3AF0(v29);
      uint64_t result = sub_25E9F3D3C(v22);
    }
  }
  int64_t v14 = v11 + 1;
  if (__OFADD__(v11, 1))
  {
    __break(1u);
    goto LABEL_28;
  }
  if (v14 >= v9) {
    goto LABEL_26;
  }
  unint64_t v15 = *(void *)(v5 + 8 * v14);
  ++v11;
  if (v15) {
    goto LABEL_19;
  }
  int64_t v11 = v14 + 1;
  if (v14 + 1 >= v9) {
    goto LABEL_26;
  }
  unint64_t v15 = *(void *)(v5 + 8 * v11);
  if (v15) {
    goto LABEL_19;
  }
  int64_t v11 = v14 + 2;
  if (v14 + 2 >= v9) {
    goto LABEL_26;
  }
  unint64_t v15 = *(void *)(v5 + 8 * v11);
  if (v15)
  {
LABEL_19:
    unint64_t v8 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v11 << 6);
    goto LABEL_20;
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v9)
  {
LABEL_26:
    swift_release();
    return (uint64_t)v35;
  }
  unint64_t v15 = *(void *)(v5 + 8 * v16);
  if (v15)
  {
    int64_t v11 = v16;
    goto LABEL_19;
  }
  while (1)
  {
    int64_t v11 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v11 >= v9) {
      goto LABEL_26;
    }
    unint64_t v15 = *(void *)(v5 + 8 * v11);
    ++v16;
    if (v15) {
      goto LABEL_19;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_25E9F3D3C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  long long v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v14 = v4 + v2;
  }
  else {
    int64_t v14 = v4;
  }
  long long v3 = sub_25EA08408(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  int64_t v9 = &v3[v8 + 4];
  if (a1 + 32 < (unint64_t)&v9[v2] && (unint64_t)v9 < a1 + 32 + 8 * v2) {
    goto LABEL_24;
  }
  memcpy(v9, (const void *)(a1 + 32), 8 * v2);
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v11 = v3[2];
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_25EA36470();
  __break(1u);
  return result;
}

double sub_25E9F3E84@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_25E9EFBCC(a1, (uint64_t)v4);
  sub_25E9FAE98(0, &qword_26A7276E8);
  swift_getExtendedExistentialTypeMetadata_unique();
  if ((swift_dynamicCast() & 1) == 0)
  {
    *(void *)(a2 + 32) = 0;
    double result = 0.0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  return result;
}

BOOL sub_25E9F3F2C(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  sub_25E9F7BF4(0);
  MEMORY[0x270FA5388]();
  int64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)(v4 + 40);
  if (*(void *)(v10 + 16) && (unint64_t v11 = sub_25EA024DC(*a2), (v12 & 1) != 0))
  {
    uint64_t v13 = *(void *)(*(void *)(v10 + 56) + 8 * v11);
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v13 = MEMORY[0x263F8EE80];
  }
  uint64_t v14 = sub_25EA17FA8(a3, a3, a4);
  if (*(void *)(v13 + 16) && (unint64_t v17 = sub_25EA02438(v14, v15, v16), (v18 & 1) != 0))
  {
    unint64_t v19 = v17;
    uint64_t v20 = *(void *)(v13 + 56);
    uint64_t v21 = type metadata accessor for ScopeGraphElement.ID(0);
    uint64_t v22 = *(void *)(v21 - 8);
    sub_25E9FB3A0(v20 + *(void *)(v22 + 72) * v19, (uint64_t)v9, type metadata accessor for ScopeGraphElement.ID);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v9, 0, 1, v21);
  }
  else
  {
    uint64_t v21 = type metadata accessor for ScopeGraphElement.ID(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v9, 1, 1, v21);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  type metadata accessor for ScopeGraphElement.ID(0);
  BOOL v23 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v21 - 8) + 48))(v9, 1, v21) != 1;
  sub_25E9FAEE8((uint64_t)v9, (uint64_t (*)(void))sub_25E9F7BF4);
  return v23;
}

uint64_t sub_25E9F4160(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = *a2;
  type metadata accessor for RuleVertex();
  uint64_t v10 = sub_25EA07C88(a1);
  uint64_t v11 = sub_25EA17FA8(a4, a4, a5);
  uint64_t v15 = v9;
  sub_25E9F4234(v10, v11, v12, v13, &v15, a3);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25E9F4234(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6)
{
  uint64_t v7 = v6;
  uint64_t v54 = a2;
  uint64_t v55 = a3;
  uint64_t v58 = *a1;
  uint64_t v56 = *(void *)(v58 + 80);
  uint64_t v61 = *(void *)(v56 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v60 = (char *)&v49 - v12;
  sub_25E9F0484(0);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v59 = (uint64_t)&v49 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for ScopeGraphElement.ID(0);
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  char v18 = (char *)&v49 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = type metadata accessor for ScopeGraphElement(0);
  MEMORY[0x270FA5388](v50);
  uint64_t v20 = (char *)&v49 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25E9F04B8(0);
  uint64_t v51 = *(void *)(v21 - 8);
  uint64_t v52 = v21;
  MEMORY[0x270FA5388](v21);
  uint64_t v53 = (uint64_t)&v49 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25E9F7BF4(0);
  MEMORY[0x270FA5388](v23 - 8);
  uint64_t v25 = (char *)&v49 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = *a5;
  uint64_t v62 = a6;
  sub_25E9FB3A0(a6, (uint64_t)v25, type metadata accessor for ScopeGraphElement.ID);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v25, 0, 1, v15);
  uint64_t v57 = a4;
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v65[0] = *(void *)(v7 + 40);
  uint64_t v28 = v65[0];
  *(void *)(v7 + 40) = 0x8000000000000000;
  uint64_t v63 = v26;
  unint64_t v30 = sub_25EA024DC(v26);
  uint64_t v31 = *(void *)(v28 + 16);
  BOOL v32 = (v29 & 1) == 0;
  uint64_t v33 = v31 + v32;
  if (__OFADD__(v31, v32))
  {
    __break(1u);
    goto LABEL_10;
  }
  LOBYTE(v26) = v29;
  if (*(void *)(v28 + 24) >= v33)
  {
    if (isUniquelyReferenced_nonNull_native) {
      goto LABEL_6;
    }
LABEL_10:
    sub_25EA03110();
    uint64_t v28 = v65[0];
    goto LABEL_6;
  }
  sub_25EA09540(v33, isUniquelyReferenced_nonNull_native);
  uint64_t v28 = v65[0];
  unint64_t v34 = sub_25EA024DC(v63);
  if ((v26 & 1) != (v35 & 1))
  {
    uint64_t result = sub_25EA364D0();
    __break(1u);
    return result;
  }
  unint64_t v30 = v34;
LABEL_6:
  uint64_t v36 = v59;
  *(void *)(v7 + 40) = v28;
  swift_bridgeObjectRelease();
  if ((v26 & 1) == 0) {
    sub_25EA0B1A8(v30, v63, MEMORY[0x263F8EE80], *(void **)(v7 + 40));
  }
  sub_25E9FFB50((uint64_t)v25, v54, v55, v57);
  uint64_t v37 = v62;
  sub_25E9FB3A0(v62, (uint64_t)v18, type metadata accessor for ScopeGraphElement.ID);
  uint64_t v59 = *(void *)(v58 + 88);
  uint64_t v38 = v56;
  v65[3] = type metadata accessor for RuleVertex();
  v65[4] = swift_getWitnessTable();
  v65[0] = a1;
  swift_retain();
  sub_25E9EE2C4((uint64_t)v18, v65, (uint64_t)v20);
  uint64_t v39 = v53;
  sub_25E9FB3A0((uint64_t)v20, v53, type metadata accessor for ScopeGraphElement);
  sub_25E9FB3A0((uint64_t)&v20[*(int *)(v50 + 20)], (uint64_t)v18, type metadata accessor for ScopeGraphElement.ID);
  sub_25E9FB3A0(v39, v36, (uint64_t (*)(void))sub_25E9F04B8);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v51 + 56))(v36, 0, 1, v52);
  sub_25E9FFD3C(v36, (uint64_t)v18);
  sub_25E9FAEE8((uint64_t)v20, type metadata accessor for ScopeGraphElement);
  sub_25E9FAEE8(v39, (uint64_t (*)(void))sub_25E9F04B8);
  uint64_t v40 = (uint64_t)a1 + *(void *)(*a1 + 104);
  swift_beginAccess();
  uint64_t v42 = (uint64_t)v60;
  uint64_t v41 = v61;
  uint64_t v43 = *(void (**)(char *, uint64_t, uint64_t))(v61 + 16);
  v43(v60, v40, v38);
  uint64_t v44 = v7;
  uint64_t v49 = v7;
  uint64_t v45 = v63;
  uint64_t v64 = v63;
  uint64_t v46 = v59;
  sub_25E9F9D20(v42, &v64, v37, v44, v38, v59);
  uint64_t v47 = *(void (**)(uint64_t, uint64_t))(v41 + 8);
  v47(v42, v38);
  v43((char *)v42, v40, v38);
  uint64_t v64 = v45;
  sub_25E9F9E78(v42, &v64, v37, v49, v38, v46);
  return ((uint64_t (*)(uint64_t, uint64_t))v47)(v42, v38);
}

uint64_t sub_25E9F4870(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6)
{
  uint64_t v11 = *a5;
  type metadata accessor for SourceVertex();
  uint64_t v12 = sub_25EA2E690(a1);
  uint64_t v14 = v11;
  sub_25E9F4234(v12, a2, a3, a4, &v14, a6);
  return swift_release();
}

uint64_t sub_25E9F4920(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6, uint64_t a7)
{
  uint64_t v13 = *a6;
  type metadata accessor for EquatableSourceVertex();
  uint64_t v14 = sub_25EA35E40(a1, a2);
  uint64_t v16 = v13;
  sub_25E9F4234(v14, a3, a4, a5, &v16, a7);
  return swift_release();
}

uint64_t sub_25E9F49D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v6 = v5;
  uint64_t v48 = a1;
  uint64_t v11 = type metadata accessor for ScopeGraphElement.ID(0);
  uint64_t v12 = *(void **)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v45 = (uint64_t)&v43 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25E9F7BF4(0);
  uint64_t v15 = MEMORY[0x270FA5388](v14 - 8);
  uint64_t v44 = (uint64_t)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v43 - v18;
  uint64_t v20 = MEMORY[0x270FA5388](v17);
  uint64_t v22 = (char *)&v43 - v21;
  MEMORY[0x270FA5388](v20);
  uint64_t v24 = (char *)&v43 - v23;
  uint64_t v25 = *a4;
  uint64_t v26 = *(void *)(v6 + 40);
  uint64_t v27 = *(void *)(v26 + 16);
  uint64_t v47 = v25;
  if (v27 && (unint64_t v28 = sub_25EA024DC(v25), (v29 & 1) != 0))
  {
    uint64_t v30 = *(void *)(*(void *)(v26 + 56) + 8 * v28);
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v30 = MEMORY[0x263F8EE80];
  }
  uint64_t v50 = v30;
  uint64_t v31 = *(void *)(v30 + 16);
  uint64_t v46 = a2;
  if (v31)
  {
    swift_bridgeObjectRetain();
    unint64_t v32 = sub_25EA02438(v48, a2, a3);
    if (v33)
    {
      sub_25E9FB3A0(*(void *)(v30 + 56) + v12[9] * v32, (uint64_t)v24, type metadata accessor for ScopeGraphElement.ID);
      unint64_t v34 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v12[7];
      v34(v24, 0, 1, v11);
    }
    else
    {
      unint64_t v34 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v12[7];
      v34(v24, 1, 1, v11);
    }
  }
  else
  {
    unint64_t v34 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v12[7];
    v34(v24, 1, 1, v11);
    swift_bridgeObjectRetain();
  }
  sub_25E9F8188((uint64_t)v24, (uint64_t)v22, (uint64_t (*)(void))sub_25E9F7BF4);
  char v35 = (unsigned int (*)(char *, uint64_t, uint64_t))v12[6];
  if (v35(v22, 1, v11) == 1)
  {
    sub_25EA35EC0();
    sub_25E9FAEE8((uint64_t)v22, (uint64_t (*)(void))sub_25E9F7BF4);
  }
  else
  {
    sub_25E9F8188((uint64_t)v22, a5, type metadata accessor for ScopeGraphElement.ID);
  }
  swift_bridgeObjectRelease();
  sub_25E9FB3A0(a5, (uint64_t)v19, type metadata accessor for ScopeGraphElement.ID);
  v34(v19, 0, 1, v11);
  if (v35(v19, 1, v11) == 1)
  {
    swift_bridgeObjectRetain();
    sub_25E9FAEE8((uint64_t)v19, (uint64_t (*)(void))sub_25E9F7BF4);
    uint64_t v36 = v44;
    sub_25E9F7C28(v48, v46, a3, v44);
    swift_bridgeObjectRelease();
    sub_25E9FAEE8(v36, (uint64_t (*)(void))sub_25E9F7BF4);
    uint64_t v37 = v50;
  }
  else
  {
    uint64_t v38 = v45;
    sub_25E9F8188((uint64_t)v19, v45, type metadata accessor for ScopeGraphElement.ID);
    swift_bridgeObjectRetain();
    uint64_t v39 = v50;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v49 = v39;
    sub_25EA053B8(v38, v48, v46, a3, isUniquelyReferenced_nonNull_native);
    uint64_t v37 = v49;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  char v41 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v49 = *(void *)(v6 + 40);
  *(void *)(v6 + 40) = 0x8000000000000000;
  sub_25EA05B88(v37, v47, v41);
  *(void *)(v6 + 40) = v49;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25E9F4E5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X4>, uint64_t a6@<X6>, uint64_t a7@<X8>)
{
  uint64_t v13 = *a5;
  type metadata accessor for SourceVertex();
  uint64_t v14 = sub_25EA2E690(a1);
  uint64_t v16 = v13;
  sub_25E9F4F1C((uint64_t)v14, a2, a3, a4, &v16, a6, a7);
  return swift_release();
}

uint64_t sub_25E9F4F1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v60 = a6;
  uint64_t v57 = a4;
  uint64_t v53 = a2;
  uint64_t v54 = a3;
  uint64_t v11 = *(void *)a1;
  sub_25E9F0484(0);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v52 = (uint64_t)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for ScopeGraphElement.ID(0);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v51 = (uint64_t)&v49 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = type metadata accessor for ScopeGraphElement(0);
  uint64_t v16 = MEMORY[0x270FA5388](v59);
  uint64_t v18 = (char *)&v49 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = *(void *)(v11 + 80);
  uint64_t v56 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v21 = (char *)&v49 - v20;
  sub_25E9F04B8(0);
  uint64_t v50 = v22;
  uint64_t v58 = *(void *)(v22 - 8);
  uint64_t v23 = MEMORY[0x270FA5388](v22);
  uint64_t v25 = (char *)&v49 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = MEMORY[0x270FA5388](v23);
  unint64_t v28 = (char *)&v49 - v27;
  MEMORY[0x270FA5388](v26);
  uint64_t v30 = (char *)&v49 - v29;
  uint64_t v55 = *a5;
  v62[0] = v55;
  uint64_t v31 = a7;
  sub_25E9F49D8(v53, v54, v57, v62, a7);
  uint64_t v57 = v7;
  uint64_t v32 = *(void *)(v7 + 8);
  if (!*(void *)(v32 + 16)) {
    goto LABEL_6;
  }
  unint64_t v33 = sub_25EA02548(a7);
  if ((v34 & 1) == 0) {
    goto LABEL_6;
  }
  sub_25E9FB3A0(*(void *)(v32 + 56) + *(void *)(v58 + 72) * v33, (uint64_t)v28, (uint64_t (*)(void))sub_25E9F04B8);
  sub_25E9F8188((uint64_t)v28, (uint64_t)v30, (uint64_t (*)(void))sub_25E9F04B8);
  sub_25E9EFBCC((uint64_t)&v30[*(int *)(v59 + 24)], (uint64_t)v62);
  sub_25E9FAE98(0, (unint64_t *)&qword_26A727778);
  uint64_t v35 = *(void *)(v60 + 8);
  type metadata accessor for RuleVertex();
  if ((swift_dynamicCast() & 1) == 0)
  {
    sub_25E9FAEE8((uint64_t)v30, (uint64_t (*)(void))sub_25E9F04B8);
LABEL_6:
    uint64_t v41 = v19;
    uint64_t v39 = (uint64_t)v21;
    uint64_t v42 = v51;
    sub_25E9FB3A0(a7, v51, type metadata accessor for ScopeGraphElement.ID);
    uint64_t v40 = *(void *)(v60 + 8);
    v62[3] = type metadata accessor for RuleVertex();
    v62[4] = swift_getWitnessTable();
    v62[0] = a1;
    swift_retain();
    sub_25E9EE2C4(v42, v62, (uint64_t)v18);
    sub_25E9FB3A0((uint64_t)v18, (uint64_t)v25, type metadata accessor for ScopeGraphElement);
    sub_25E9FB3A0((uint64_t)&v18[*(int *)(v59 + 20)], v42, type metadata accessor for ScopeGraphElement.ID);
    uint64_t v43 = v52;
    sub_25E9FB3A0((uint64_t)v25, v52, (uint64_t (*)(void))sub_25E9F04B8);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v58 + 56))(v43, 0, 1, v50);
    sub_25E9FFD3C(v43, v42);
    sub_25E9FAEE8((uint64_t)v18, type metadata accessor for ScopeGraphElement);
    uint64_t v30 = v25;
    uint64_t v37 = v56;
    goto LABEL_7;
  }
  uint64_t v36 = a1 + *(void *)(*(void *)a1 + 104);
  swift_beginAccess();
  uint64_t v37 = v56;
  (*(void (**)(char *, uint64_t, uint64_t))(v56 + 16))(v21, v36, v19);
  sub_25EA06DC8((uint64_t)v21);
  swift_release();
  uint64_t v38 = v19;
  uint64_t v39 = (uint64_t)v21;
  (*(void (**)(char *, uint64_t))(v37 + 8))(v21, v38);
  uint64_t v40 = v35;
  uint64_t v41 = v38;
LABEL_7:
  sub_25E9FAEE8((uint64_t)v30, (uint64_t (*)(void))sub_25E9F04B8);
  uint64_t v44 = a1 + *(void *)(*(void *)a1 + 104);
  swift_beginAccess();
  uint64_t v60 = *(void *)(v37 + 16);
  ((void (*)(uint64_t, uint64_t, uint64_t))v60)(v39, v44, v41);
  uint64_t v45 = v55;
  uint64_t v61 = v55;
  uint64_t v46 = v57;
  sub_25E9F9D20(v39, &v61, v31, v57, v41, v40);
  uint64_t v47 = *(void (**)(uint64_t, uint64_t))(v37 + 8);
  v47(v39, v41);
  ((void (*)(uint64_t, uint64_t, uint64_t))v60)(v39, v44, v41);
  uint64_t v61 = v45;
  sub_25E9F9E78(v39, &v61, v31, v46, v41, v40);
  return ((uint64_t (*)(uint64_t, uint64_t))v47)(v39, v41);
}

uint64_t sub_25E9F5568@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X5>, uint64_t a7@<X7>, uint64_t a8@<X8>)
{
  uint64_t v15 = *a6;
  type metadata accessor for EquatableSourceVertex();
  uint64_t v16 = sub_25EA35E40(a1, a5);
  uint64_t v18 = v15;
  sub_25E9F4F1C((uint64_t)v16, a2, a3, a4, &v18, a7, a8);
  return swift_release();
}

uint64_t sub_25E9F5634@<X0>(uint64_t *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v8 = *a1;
  uint64_t v9 = *(void *)(v4 + 72);
  v15[1] = *(void *)v4;
  long long v16 = *(_OWORD *)(v4 + 8);
  long long v17 = *(_OWORD *)(v4 + 24);
  long long v18 = *(_OWORD *)(v4 + 40);
  long long v19 = *(_OWORD *)(v4 + 56);
  uint64_t v20 = v9;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v11 = sub_25EA17FA8(a2, a2, a3);
  v15[0] = v8;
  sub_25E9F5720(v11, v12, v13, v15, AssociatedTypeWitness, a4);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25E9F5720@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t *a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  uint64_t v67 = a5;
  uint64_t v59 = a3;
  uint64_t v58 = a2;
  uint64_t v57 = a1;
  uint64_t v56 = a6;
  sub_25E9F04B8(0);
  uint64_t v64 = *(void *)(v8 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v63 = (uint64_t)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v62 = (uint64_t)&v54 - v11;
  uint64_t v12 = type metadata accessor for ScopeGraphElement.ID(0);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v54 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25E9F7BF4(0);
  uint64_t v17 = MEMORY[0x270FA5388](v16 - 8);
  long long v19 = (char *)&v54 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v54 - v20;
  uint64_t v22 = *a4;
  uint64_t v23 = v6[1];
  uint64_t v24 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56);
  uint64_t v55 = v13;
  uint64_t v25 = (unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
  uint64_t v26 = v6[5];
  uint64_t v27 = v6[6];
  uint64_t v66 = v24;
  uint64_t v70 = v26;
  uint64_t v65 = v12;
  uint64_t v69 = v15;
  uint64_t v61 = v23;
  uint64_t v60 = v25;
  while (1)
  {
    uint64_t v28 = v26;
    if (*(void *)(v26 + 16)
      && (unint64_t v29 = sub_25EA024DC(v22), (v30 & 1) != 0)
      && (uint64_t v31 = *(void *)(*(void *)(v28 + 56) + 8 * v29), swift_bridgeObjectRetain(), v31))
    {
      if (*(void *)(v31 + 16))
      {
        uint64_t v32 = v59;
        swift_bridgeObjectRetain();
        unint64_t v33 = sub_25EA02438(v57, v58, v32);
        if (v34)
        {
          uint64_t v35 = v23;
          uint64_t v36 = v55;
          sub_25E9FB3A0(*(void *)(v31 + 56) + *(void *)(v55 + 72) * v33, (uint64_t)v21, type metadata accessor for ScopeGraphElement.ID);
          uint64_t v37 = *(void (**)(char *, void, uint64_t, uint64_t))(v36 + 56);
          uint64_t v23 = v35;
          uint64_t v24 = v66;
          v37(v21, 0, 1, v12);
        }
        else
        {
          (*v24)(v21, 1, 1, v12);
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v15 = v69;
      }
      else
      {
        (*v24)(v21, 1, 1, v12);
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      (*v24)(v21, 1, 1, v12);
    }
    sub_25E9FB3A0((uint64_t)v21, (uint64_t)v19, (uint64_t (*)(void))sub_25E9F7BF4);
    if ((*v25)(v19, 1, v12) == 1)
    {
      uint64_t v38 = (uint64_t (*)(void))sub_25E9F7BF4;
      uint64_t v39 = (uint64_t)v19;
      goto LABEL_19;
    }
    sub_25E9F8188((uint64_t)v19, (uint64_t)v15, type metadata accessor for ScopeGraphElement.ID);
    if (!*(void *)(v23 + 16) || (unint64_t v40 = sub_25EA02548((uint64_t)v15), (v41 & 1) == 0))
    {
      uint64_t v38 = type metadata accessor for ScopeGraphElement.ID;
      uint64_t v39 = (uint64_t)v15;
LABEL_19:
      sub_25E9FAEE8(v39, v38);
      if (!*(void *)(v27 + 16)) {
        goto LABEL_25;
      }
      goto LABEL_20;
    }
    uint64_t v42 = v63;
    sub_25E9FB3A0(*(void *)(v23 + 56) + *(void *)(v64 + 72) * v40, v63, (uint64_t (*)(void))sub_25E9F04B8);
    uint64_t v43 = v62;
    sub_25E9F8188(v42, v62, (uint64_t (*)(void))sub_25E9F04B8);
    uint64_t v44 = (void *)(v43 + *(int *)(type metadata accessor for ScopeGraphElement(0) + 24));
    uint64_t v45 = v44[3];
    uint64_t v46 = v44[4];
    sub_25E9EFC30(v44, v45);
    uint64_t v68 = *(void (**)(uint64_t, uint64_t))(v46 + 32);
    v75[3] = swift_getAssociatedTypeWitness();
    v75[4] = swift_getAssociatedConformanceWitness();
    sub_25E9F9FE8(v75);
    v68(v45, v46);
    sub_25E9FAEE8(v43, (uint64_t (*)(void))sub_25E9F04B8);
    sub_25E9FAE98(0, &qword_26A727738);
    uint64_t v71 = v67;
    swift_getExtendedExistentialTypeMetadata();
    if (swift_dynamicCast()) {
      break;
    }
    uint64_t v74 = 0;
    long long v72 = 0u;
    long long v73 = 0u;
    uint64_t v15 = v69;
    sub_25E9FAEE8((uint64_t)v69, type metadata accessor for ScopeGraphElement.ID);
    uint64_t v12 = v65;
    if (*((void *)&v73 + 1)) {
      sub_25E9EF02C((uint64_t)&v72);
    }
    uint64_t v23 = v61;
    uint64_t v24 = v66;
    uint64_t v25 = v60;
    if (!*(void *)(v27 + 16))
    {
LABEL_25:
      sub_25E9FAEE8((uint64_t)v21, (uint64_t (*)(void))sub_25E9F7BF4);
      *(void *)&v76[0] = v67;
      swift_getExtendedExistentialTypeMetadata();
      TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(TupleTypeMetadata2 - 8) + 56))(v56, 1, 1, TupleTypeMetadata2);
    }
LABEL_20:
    unint64_t v47 = sub_25EA024DC(v22);
    if ((v48 & 1) == 0) {
      goto LABEL_25;
    }
    uint64_t v22 = *(void *)(*(void *)(v27 + 56) + 8 * v47);
    sub_25E9FAEE8((uint64_t)v21, (uint64_t (*)(void))sub_25E9F7BF4);
    uint64_t v26 = v70;
  }
  sub_25E9FAEE8((uint64_t)v21, (uint64_t (*)(void))sub_25E9F7BF4);
  sub_25E9F9FD0(&v72, (uint64_t)v76);
  uint64_t v51 = swift_getTupleTypeMetadata2();
  uint64_t v52 = v56;
  uint64_t v53 = v56 + *(int *)(v51 + 48);
  sub_25E9F9FD0(v76, v56);
  sub_25E9F8188((uint64_t)v69, v53, type metadata accessor for ScopeGraphElement.ID);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v51 - 8) + 56))(v52, 0, 1, v51);
}

uint64_t sub_25E9F5E94@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v8 = *a2;
  uint64_t v9 = *(void *)(v4 + 72);
  v15[1] = *(void *)v4;
  long long v16 = *(_OWORD *)(v4 + 8);
  long long v17 = *(_OWORD *)(v4 + 24);
  long long v18 = *(_OWORD *)(v4 + 40);
  long long v19 = *(_OWORD *)(v4 + 56);
  uint64_t v20 = v9;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v11 = sub_25EA18410(a3, a1);
  v15[0] = v8;
  sub_25E9F5720(v11, v12, v13, v15, AssociatedTypeWitness, a4);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25E9F5F94(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for ScopeGraphElement.ID(0);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v76 = (uint64_t)v59 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v71 = (uint64_t)v59 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v59 - v10;
  uint64_t v12 = sub_25EA35ED0();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v75 = (char *)v59 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  long long v18 = (char *)v59 - v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)v59 - v19;
  uint64_t updated = type metadata accessor for DependencyGraph.UpdateGraphVisitor();
  uint64_t v22 = updated - 8;
  MEMORY[0x270FA5388](updated);
  uint64_t v24 = (char *)v59 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = v2[1];
  uint64_t v68 = v2[2];
  uint64_t v69 = v25;
  uint64_t v26 = v2[3];
  uint64_t v66 = v2[4];
  uint64_t v67 = v26;
  sub_25E9FB3A0(a1, (uint64_t)v24, type metadata accessor for ScopeGraphElement.ID);
  *(void *)&v24[*(int *)(v22 + 28)] = a2;
  sub_25EA35EC0();
  if (qword_26A7274C0 != -1) {
    swift_once();
  }
  uint64_t v27 = sub_25EA35F00();
  uint64_t v28 = sub_25E9EBF30(v27, (uint64_t)qword_26A728BC0);
  uint64_t v65 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
  v65(v18, v20, v12);
  uint64_t v70 = a1;
  sub_25E9FB3A0(a1, (uint64_t)v11, type metadata accessor for ScopeGraphElement.ID);
  unint64_t v29 = sub_25EA35EE0();
  os_log_type_t v30 = sub_25EA362B0();
  uint64_t v64 = v29;
  int v62 = v30;
  BOOL v31 = os_log_type_enabled(v29, v30);
  long long v72 = v24;
  long long v73 = v20;
  if (v31)
  {
    uint64_t v32 = swift_slowAlloc();
    uint64_t v60 = swift_slowAlloc();
    v78[0] = v60;
    *(_DWORD *)uint64_t v32 = 136315394;
    uint64_t v61 = v28;
    sub_25E9FADFC(&qword_26A7276F0, MEMORY[0x263F07508]);
    uint64_t v33 = sub_25EA36480();
    uint64_t v77 = sub_25EA01DA0(v33, v34, v78);
    uint64_t v63 = v12;
    sub_25EA362F0();
    swift_bridgeObjectRelease();
    uint64_t v74 = *(void (**)(char *, uint64_t))(v13 + 8);
    v74(v18, v63);
    *(_WORD *)(v32 + 12) = 2080;
    v59[1] = v32 + 14;
    uint64_t v35 = v71;
    sub_25E9FB3A0((uint64_t)v11, v71, type metadata accessor for ScopeGraphElement.ID);
    uint64_t v36 = _s9TeaBreeze17ScopeGraphElementV2IDV11descriptionSSvg_0();
    unint64_t v38 = v37;
    sub_25E9FAEE8(v35, type metadata accessor for ScopeGraphElement.ID);
    uint64_t v77 = sub_25EA01DA0(v36, v38, v78);
    uint64_t v12 = v63;
    uint64_t v20 = v73;
    sub_25EA362F0();
    swift_bridgeObjectRelease();
    sub_25E9FAEE8((uint64_t)v11, type metadata accessor for ScopeGraphElement.ID);
    uint64_t v39 = v64;
    _os_log_impl(&dword_25E9E9000, v64, (os_log_type_t)v62, "About to perform a graph update. Update=%s, Node=%s", (uint8_t *)v32, 0x16u);
    uint64_t v40 = v60;
    swift_arrayDestroy();
    MEMORY[0x2611E7A60](v40, -1, -1);
    uint64_t v41 = v32;
    uint64_t v24 = v72;
    MEMORY[0x2611E7A60](v41, -1, -1);
  }
  else
  {
    uint64_t v74 = *(void (**)(char *, uint64_t))(v13 + 8);
    v74(v18, v12);
    sub_25E9FAEE8((uint64_t)v11, type metadata accessor for ScopeGraphElement.ID);
  }
  uint64_t v42 = v70;
  sub_25E9F6784(v24, v70, v69, v68, v67, v66);
  v65(v75, v20, v12);
  sub_25E9FB3A0(v42, v76, type metadata accessor for ScopeGraphElement.ID);
  uint64_t v43 = sub_25EA35EE0();
  os_log_type_t v44 = sub_25EA362B0();
  int v45 = v44;
  if (os_log_type_enabled(v43, v44))
  {
    uint64_t v46 = swift_slowAlloc();
    uint64_t v70 = swift_slowAlloc();
    v78[0] = v70;
    *(_DWORD *)uint64_t v46 = 136315394;
    sub_25E9FADFC(&qword_26A7276F0, MEMORY[0x263F07508]);
    LODWORD(v69) = v45;
    unint64_t v47 = v75;
    uint64_t v48 = sub_25EA36480();
    uint64_t v77 = sub_25EA01DA0(v48, v49, v78);
    sub_25EA362F0();
    swift_bridgeObjectRelease();
    uint64_t v68 = v13 + 8;
    v74(v47, v12);
    *(_WORD *)(v46 + 12) = 2080;
    uint64_t v50 = v76;
    uint64_t v51 = v71;
    sub_25E9FB3A0(v76, v71, type metadata accessor for ScopeGraphElement.ID);
    uint64_t v52 = _s9TeaBreeze17ScopeGraphElementV2IDV11descriptionSSvg_0();
    unint64_t v54 = v53;
    sub_25E9FAEE8(v51, type metadata accessor for ScopeGraphElement.ID);
    uint64_t v77 = sub_25EA01DA0(v52, v54, v78);
    sub_25EA362F0();
    swift_bridgeObjectRelease();
    sub_25E9FAEE8(v50, type metadata accessor for ScopeGraphElement.ID);
    _os_log_impl(&dword_25E9E9000, v43, (os_log_type_t)v69, "Concluded graph update. Update=%s, Node=%s", (uint8_t *)v46, 0x16u);
    uint64_t v55 = v70;
    swift_arrayDestroy();
    MEMORY[0x2611E7A60](v55, -1, -1);
    MEMORY[0x2611E7A60](v46, -1, -1);

    v74(v73, v12);
    uint64_t v56 = (uint64_t)v72;
  }
  else
  {

    sub_25E9FAEE8(v76, type metadata accessor for ScopeGraphElement.ID);
    uint64_t v57 = v74;
    v74(v75, v12);
    v57(v20, v12);
    uint64_t v56 = (uint64_t)v24;
  }
  return sub_25E9FAEE8(v56, (uint64_t (*)(void))type metadata accessor for DependencyGraph.UpdateGraphVisitor);
}

uint64_t sub_25E9F6784(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v50 = a4;
  uint64_t v51 = a6;
  uint64_t v48 = a5;
  uint64_t v52 = a1;
  sub_25E9F8224(0);
  uint64_t v9 = v8;
  uint64_t v49 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for ScopeGraphElement.ID(0);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  uint64_t v15 = (char *)&v46 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v46 - v16;
  sub_25E9F04B8(0);
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = MEMORY[0x270FA5388](v18 - 8);
  uint64_t v22 = (char *)&v46 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v20);
  uint64_t v25 = (char *)&v46 - v24;
  if (!*(void *)(a3 + 16)) {
    return result;
  }
  uint64_t result = sub_25EA02548(a2);
  if ((v26 & 1) == 0) {
    return result;
  }
  uint64_t v47 = a2;
  sub_25E9FB3A0(*(void *)(a3 + 56) + *(void *)(v19 + 72) * result, (uint64_t)v22, (uint64_t (*)(void))sub_25E9F04B8);
  sub_25E9F8188((uint64_t)v22, (uint64_t)v25, (uint64_t (*)(void))sub_25E9F04B8);
  uint64_t v27 = sub_25EA36230();
  MEMORY[0x270FA5388](v27);
  uint64_t v28 = v52;
  *(&v46 - 2) = v25;
  *(&v46 - 1) = v28;
  if ((sub_25E9FD628((uint64_t)sub_25E9FA190, (uint64_t)(&v46 - 4), (uint64_t)"TeaBreeze/DependencyGraph.swift", 31) & 1) == 0) {
    return sub_25E9FAEE8((uint64_t)v25, (uint64_t (*)(void))sub_25E9F04B8);
  }
  sub_25E9FB3A0(v47, (uint64_t)v17, type metadata accessor for ScopeGraphElement.ID);
  uint64_t v29 = v48;
  uint64_t v30 = *(void *)(v48 + 16);
  uint64_t v46 = v25;
  if (v30 && (unint64_t v31 = sub_25EA02548((uint64_t)v17), (v32 & 1) != 0))
  {
    uint64_t v33 = v29;
    uint64_t v34 = *(void *)(*(void *)(v29 + 56) + 8 * v31);
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v33 = v29;
    uint64_t v34 = MEMORY[0x263F8EE88];
  }
  uint64_t result = sub_25E9FAEE8((uint64_t)v17, type metadata accessor for ScopeGraphElement.ID);
  int64_t v35 = 0;
  uint64_t v36 = v34 + 56;
  uint64_t v37 = 1 << *(unsigned char *)(v34 + 32);
  uint64_t v38 = -1;
  if (v37 < 64) {
    uint64_t v38 = ~(-1 << v37);
  }
  unint64_t v39 = v38 & *(void *)(v34 + 56);
  int64_t v40 = (unint64_t)(v37 + 63) >> 6;
  while (1)
  {
    if (v39)
    {
      unint64_t v41 = __clz(__rbit64(v39));
      v39 &= v39 - 1;
      unint64_t v42 = v41 | (v35 << 6);
      goto LABEL_12;
    }
    int64_t v43 = v35 + 1;
    if (__OFADD__(v35, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v43 >= v40) {
      goto LABEL_28;
    }
    unint64_t v44 = *(void *)(v36 + 8 * v43);
    ++v35;
    if (!v44)
    {
      int64_t v35 = v43 + 1;
      if (v43 + 1 >= v40) {
        goto LABEL_28;
      }
      unint64_t v44 = *(void *)(v36 + 8 * v35);
      if (!v44)
      {
        int64_t v35 = v43 + 2;
        if (v43 + 2 >= v40) {
          goto LABEL_28;
        }
        unint64_t v44 = *(void *)(v36 + 8 * v35);
        if (!v44) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v39 = (v44 - 1) & v44;
    unint64_t v42 = __clz(__rbit64(v44)) + (v35 << 6);
LABEL_12:
    sub_25E9F8258(*(void *)(v34 + 48) + *(void *)(v49 + 72) * v42, (uint64_t)v11);
    sub_25E9FB3A0((uint64_t)&v11[*(int *)(v9 + 28)], (uint64_t)v15, type metadata accessor for ScopeGraphElement.ID);
    sub_25E9FAEE8((uint64_t)v11, (uint64_t (*)(void))sub_25E9F8224);
    sub_25E9F6784(v52, v15, a3, v50, v33, v51);
    uint64_t result = sub_25E9FAEE8((uint64_t)v15, type metadata accessor for ScopeGraphElement.ID);
  }
  int64_t v45 = v43 + 3;
  if (v45 >= v40)
  {
LABEL_28:
    swift_release();
    uint64_t v25 = v46;
    return sub_25E9FAEE8((uint64_t)v25, (uint64_t (*)(void))sub_25E9F04B8);
  }
  unint64_t v44 = *(void *)(v36 + 8 * v45);
  if (v44)
  {
    int64_t v35 = v45;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v35 = v45 + 1;
    if (__OFADD__(v45, 1)) {
      break;
    }
    if (v35 >= v40) {
      goto LABEL_28;
    }
    unint64_t v44 = *(void *)(v36 + 8 * v35);
    ++v45;
    if (v44) {
      goto LABEL_27;
    }
  }
LABEL_32:
  __break(1u);
  return result;
}

void sub_25E9F6C3C(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  sub_25E9F04B8(0);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v10 = (char *)v60 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  int v62 = (char *)v60 - v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)v60 - v13;
  uint64_t updated = type metadata accessor for DependencyGraph.UpdateGraphVisitor();
  MEMORY[0x270FA5388](updated);
  uint64_t v17 = (char *)v60 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = type metadata accessor for ScopeGraphElement(0);
  char v18 = _s9TeaBreeze17ScopeGraphElementV2IDV2eeoiySbAE_AEtFZ_0();
  sub_25E9FB3A0(a2, (uint64_t)v17, (uint64_t (*)(void))type metadata accessor for DependencyGraph.UpdateGraphVisitor);
  uint64_t v65 = v3;
  if (v18)
  {
    uint64_t v19 = *(void *)&v17[*(int *)(updated + 20)];
    sub_25E9FAEE8((uint64_t)v17, (uint64_t (*)(void))type metadata accessor for DependencyGraph.UpdateGraphVisitor);
    if ((v19 & 4) != 0)
    {
      uint64_t v20 = v64;
      uint64_t v21 = (void *)(a1 + *(int *)(v64 + 24));
      uint64_t v22 = v21[3];
      uint64_t v23 = v21[4];
      sub_25E9EFC30(v21, v22);
      char v24 = (*(uint64_t (**)(uint64_t, uint64_t))(v23 + 40))(v22, v23);
      if (qword_26A7274C0 != -1) {
        swift_once();
      }
      uint64_t v25 = sub_25EA35F00();
      sub_25E9EBF30(v25, (uint64_t)qword_26A728BC0);
      sub_25E9FB3A0(a1, (uint64_t)v10, (uint64_t (*)(void))sub_25E9F04B8);
      char v26 = sub_25EA35EE0();
      os_log_type_t v27 = sub_25EA362B0();
      if (os_log_type_enabled(v26, v27))
      {
        uint64_t v28 = swift_slowAlloc();
        uint64_t v63 = a3;
        uint64_t v29 = v28;
        uint64_t v30 = swift_slowAlloc();
        uint64_t v67 = v30;
        *(_DWORD *)uint64_t v29 = 136315394;
        sub_25E9EFC30(&v10[*(int *)(v20 + 24)], *(void *)&v10[*(int *)(v20 + 24) + 24]);
        uint64_t v31 = sub_25EA36480();
        uint64_t v66 = sub_25EA01DA0(v31, v32, &v67);
        sub_25EA362F0();
        swift_bridgeObjectRelease();
        sub_25E9FAEE8((uint64_t)v10, (uint64_t (*)(void))sub_25E9F04B8);
        *(_WORD *)(v29 + 12) = 2080;
        if (v24) {
          uint64_t v33 = 0xD000000000000015;
        }
        else {
          uint64_t v33 = 0xD000000000000013;
        }
        if (v24) {
          unint64_t v34 = 0x800000025EA390E0;
        }
        else {
          unint64_t v34 = 0x800000025EA390C0;
        }
        uint64_t v66 = sub_25EA01DA0(v33, v34, &v67);
        sub_25EA362F0();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25E9E9000, v26, v27, "Not requesting source update. Source=%s, Result=%s", (uint8_t *)v29, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x2611E7A60](v30, -1, -1);
        uint64_t v35 = v29;
        a3 = v63;
        MEMORY[0x2611E7A60](v35, -1, -1);
      }
      else
      {
        sub_25E9FAEE8((uint64_t)v10, (uint64_t (*)(void))sub_25E9F04B8);
      }

      goto LABEL_31;
    }
  }
  else
  {
    sub_25E9FAEE8((uint64_t)v17, (uint64_t (*)(void))type metadata accessor for DependencyGraph.UpdateGraphVisitor);
  }
  if (qword_26A7274C0 != -1) {
    swift_once();
  }
  uint64_t v36 = sub_25EA35F00();
  uint64_t v37 = sub_25E9EBF30(v36, (uint64_t)qword_26A728BC0);
  uint64_t v61 = a1;
  sub_25E9FB3A0(a1, (uint64_t)v14, (uint64_t (*)(void))sub_25E9F04B8);
  v60[1] = v37;
  uint64_t v38 = sub_25EA35EE0();
  os_log_type_t v39 = sub_25EA362B0();
  BOOL v40 = os_log_type_enabled(v38, v39);
  uint64_t v63 = a3;
  if (v40)
  {
    unint64_t v41 = (uint8_t *)swift_slowAlloc();
    uint64_t v42 = swift_slowAlloc();
    *(_DWORD *)unint64_t v41 = 136315138;
    uint64_t v67 = v42;
    v60[0] = v41 + 4;
    uint64_t v43 = v64;
    sub_25E9EFC30(&v14[*(int *)(v64 + 24)], *(void *)&v14[*(int *)(v64 + 24) + 24]);
    uint64_t v44 = sub_25EA36480();
    uint64_t v66 = sub_25EA01DA0(v44, v45, &v67);
    sub_25EA362F0();
    swift_bridgeObjectRelease();
    sub_25E9FAEE8((uint64_t)v14, (uint64_t (*)(void))sub_25E9F04B8);
    _os_log_impl(&dword_25E9E9000, v38, v39, "Requesting rule update. Source=%s", v41, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611E7A60](v42, -1, -1);
    MEMORY[0x2611E7A60](v41, -1, -1);
  }
  else
  {
    sub_25E9FAEE8((uint64_t)v14, (uint64_t (*)(void))sub_25E9F04B8);

    uint64_t v43 = v64;
  }
  uint64_t v47 = v61;
  uint64_t v46 = (uint64_t)v62;
  uint64_t v48 = (void *)(v61 + *(int *)(v43 + 24));
  uint64_t v49 = v48[3];
  uint64_t v50 = v48[4];
  sub_25E9EFC30(v48, v49);
  char v24 = (*(uint64_t (**)(uint64_t, uint64_t))(v50 + 72))(v49, v50);
  sub_25E9FB3A0(v47, v46, (uint64_t (*)(void))sub_25E9F04B8);
  uint64_t v51 = sub_25EA35EE0();
  os_log_type_t v52 = sub_25EA362B0();
  if (os_log_type_enabled(v51, v52))
  {
    uint64_t v53 = v43;
    uint64_t v54 = swift_slowAlloc();
    uint64_t v55 = swift_slowAlloc();
    uint64_t v67 = v55;
    *(_DWORD *)uint64_t v54 = 136315394;
    sub_25E9EFC30((void *)(v46 + *(int *)(v53 + 24)), *(void *)(v46 + *(int *)(v53 + 24) + 24));
    uint64_t v56 = sub_25EA36480();
    uint64_t v66 = sub_25EA01DA0(v56, v57, &v67);
    sub_25EA362F0();
    swift_bridgeObjectRelease();
    sub_25E9FAEE8(v46, (uint64_t (*)(void))sub_25E9F04B8);
    *(_WORD *)(v54 + 12) = 2080;
    if (v24) {
      uint64_t v58 = 0xD000000000000025;
    }
    else {
      uint64_t v58 = 0xD000000000000028;
    }
    if (v24) {
      unint64_t v59 = 0x800000025EA39090;
    }
    else {
      unint64_t v59 = 0x800000025EA39060;
    }
    uint64_t v66 = sub_25EA01DA0(v58, v59, &v67);
    sub_25EA362F0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25E9E9000, v51, v52, "Source update complete. Source=%s, Result=%s", (uint8_t *)v54, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2611E7A60](v55, -1, -1);
    MEMORY[0x2611E7A60](v54, -1, -1);
  }
  else
  {
    sub_25E9FAEE8(v46, (uint64_t (*)(void))sub_25E9F04B8);
  }

  a3 = v63;
LABEL_31:
  *a3 = v24 & 1;
}

uint64_t sub_25E9F7470(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for ScopeGraphElement.ID(0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25E9F81F0(0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25E9F8224(0);
  uint64_t v33 = v9;
  uint64_t v36 = *(void *)(v9 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v31 - v13;
  sub_25E9F7DD8(a1);
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v16 = *(void *)(v1 + 8);
  if (*(void *)(v16 + 16))
  {
    uint64_t result = sub_25EA02548(a1);
    if (v17)
    {
      uint64_t v18 = *(void *)(*(void *)(v16 + 56) + 8 * result);
      swift_bridgeObjectRetain();
      sub_25E9F7DD8(a1);
      uint64_t result = swift_bridgeObjectRelease();
      int64_t v19 = 0;
      uint64_t v20 = *(void *)(v18 + 56);
      uint64_t v34 = v18 + 56;
      uint64_t v21 = 1 << *(unsigned char *)(v18 + 32);
      uint64_t v22 = -1;
      if (v21 < 64) {
        uint64_t v22 = ~(-1 << v21);
      }
      unint64_t v23 = v22 & v20;
      int64_t v35 = (unint64_t)(v21 + 63) >> 6;
      unint64_t v32 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v36 + 56);
      if ((v22 & v20) != 0) {
        goto LABEL_8;
      }
LABEL_9:
      int64_t v26 = v19 + 1;
      if (__OFADD__(v19, 1))
      {
        __break(1u);
LABEL_29:
        __break(1u);
        return result;
      }
      if (v26 >= v35) {
        return swift_release();
      }
      unint64_t v27 = *(void *)(v34 + 8 * v26);
      ++v19;
      if (!v27)
      {
        int64_t v19 = v26 + 1;
        if (v26 + 1 >= v35) {
          return swift_release();
        }
        unint64_t v27 = *(void *)(v34 + 8 * v19);
        if (v27) {
          goto LABEL_22;
        }
        int64_t v19 = v26 + 2;
        if (v26 + 2 >= v35) {
          return swift_release();
        }
        unint64_t v27 = *(void *)(v34 + 8 * v19);
        if (!v27)
        {
          int64_t v28 = v26 + 3;
          if (v28 < v35)
          {
            unint64_t v27 = *(void *)(v34 + 8 * v28);
            if (v27)
            {
              int64_t v19 = v28;
              goto LABEL_22;
            }
            while (1)
            {
              int64_t v19 = v28 + 1;
              if (__OFADD__(v28, 1)) {
                goto LABEL_29;
              }
              if (v19 >= v35) {
                return swift_release();
              }
              unint64_t v27 = *(void *)(v34 + 8 * v19);
              ++v28;
              if (v27) {
                goto LABEL_22;
              }
            }
          }
          return swift_release();
        }
      }
LABEL_22:
      unint64_t v23 = (v27 - 1) & v27;
      for (unint64_t i = __clz(__rbit64(v27)) + (v19 << 6); ; unint64_t i = v24 | (v19 << 6))
      {
        sub_25E9F8258(*(void *)(v18 + 48) + *(void *)(v36 + 72) * i, (uint64_t)v14);
        sub_25E9F8270((uint64_t)v14, (uint64_t)v12);
        sub_25E9FB3A0((uint64_t)v12, (uint64_t)v5, type metadata accessor for ScopeGraphElement.ID);
        uint64_t v29 = sub_25E9F78C8(v37, (uint64_t)v5);
        if (*v30)
        {
          sub_25E9F8984((uint64_t)v8);
          sub_25E9FAEE8((uint64_t)v8, (uint64_t (*)(void))sub_25E9F81F0);
          ((void (*)(void *, void))v29)(v37, 0);
          sub_25E9FAEE8((uint64_t)v5, type metadata accessor for ScopeGraphElement.ID);
          uint64_t result = sub_25E9FAEE8((uint64_t)v12, (uint64_t (*)(void))sub_25E9F8224);
          if (!v23) {
            goto LABEL_9;
          }
        }
        else
        {
          ((void (*)(void *, void))v29)(v37, 0);
          sub_25E9FAEE8((uint64_t)v5, type metadata accessor for ScopeGraphElement.ID);
          sub_25E9FAEE8((uint64_t)v12, (uint64_t (*)(void))sub_25E9F8224);
          (*v32)(v8, 1, 1, v33);
          uint64_t result = sub_25E9FAEE8((uint64_t)v8, (uint64_t (*)(void))sub_25E9F81F0);
          if (!v23) {
            goto LABEL_9;
          }
        }
LABEL_8:
        unint64_t v24 = __clz(__rbit64(v23));
        v23 &= v23 - 1;
      }
    }
  }
  return result;
}

void (*sub_25E9F78C8(void *a1, uint64_t a2))(void *a1)
{
  uint64_t v4 = malloc(0x30uLL);
  *a1 = v4;
  uint64_t v5 = type metadata accessor for ScopeGraphElement.ID(0);
  uint64_t v6 = malloc(*(void *)(*(void *)(v5 - 8) + 64));
  v4[4] = v6;
  sub_25E9FB3A0(a2, (uint64_t)v6, type metadata accessor for ScopeGraphElement.ID);
  v4[5] = sub_25E9F9768(v4, (uint64_t)v6);
  return sub_25E9F797C;
}

void sub_25E9F797C(void *a1)
{
  uint64_t v1 = (void *)*a1;
  uint64_t v2 = *(void **)(*a1 + 32);
  (*(void (**)(void, void))(*a1 + 40))(*a1, 0);
  sub_25E9FAEE8((uint64_t)v2, type metadata accessor for ScopeGraphElement.ID);
  free(v2);
  free(v1);
}

double sub_25E9F79EC@<D0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  return sub_25E9F7F0C(a1, (void (*)(unint64_t, uint64_t))sub_25E9F9FD0, (void (*)(unint64_t, uint64_t))sub_25EA040AC, (void (*)(void))sub_25EA0292C, a2);
}

uint64_t sub_25E9F7A2C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_25EA02548(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v3;
    uint64_t v22 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_25EA02B34();
      uint64_t v9 = v22;
    }
    uint64_t v10 = *(void *)(v9 + 48);
    uint64_t v11 = type metadata accessor for ScopeGraphElement.ID(0);
    sub_25E9FAEE8(v10 + *(void *)(*(void *)(v11 - 8) + 72) * v6, type metadata accessor for ScopeGraphElement.ID);
    uint64_t v12 = *(void *)(v9 + 56);
    sub_25E9F04B8(0);
    uint64_t v14 = v13;
    uint64_t v21 = *(void *)(v13 - 8);
    sub_25E9F8188(v12 + *(void *)(v21 + 72) * v6, a2, (uint64_t (*)(void))sub_25E9F04B8);
    sub_25EA040B0(v6, v9);
    *uint64_t v3 = v9;
    swift_bridgeObjectRelease();
    uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v21 + 56);
    uint64_t v16 = a2;
    uint64_t v17 = 0;
    uint64_t v18 = v14;
  }
  else
  {
    sub_25E9F04B8(0);
    uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56);
    uint64_t v18 = v19;
    uint64_t v16 = a2;
    uint64_t v17 = 1;
  }
  return v15(v16, v17, 1, v18);
}

void sub_25E9F7BF4(uint64_t a1)
{
}

uint64_t sub_25E9F7C28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5 = v4;
  swift_bridgeObjectRetain();
  unint64_t v10 = sub_25EA02438(a1, a2, a3);
  LOBYTE(a3) = v11;
  swift_bridgeObjectRelease();
  if (a3)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v13 = *v5;
    uint64_t v23 = *v5;
    *uint64_t v5 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_25EA02E64();
      uint64_t v13 = v23;
    }
    swift_bridgeObjectRelease();
    uint64_t v14 = *(void *)(v13 + 56);
    uint64_t v15 = type metadata accessor for ScopeGraphElement.ID(0);
    uint64_t v22 = *(void *)(v15 - 8);
    sub_25E9F8188(v14 + *(void *)(v22 + 72) * v10, a4, type metadata accessor for ScopeGraphElement.ID);
    sub_25EA0441C(v10, v13);
    *uint64_t v5 = v13;
    swift_bridgeObjectRelease();
    uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v22 + 56);
    uint64_t v17 = a4;
    uint64_t v18 = 0;
    uint64_t v19 = v15;
  }
  else
  {
    uint64_t v20 = type metadata accessor for ScopeGraphElement.ID(0);
    uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56);
    uint64_t v19 = v20;
    uint64_t v17 = a4;
    uint64_t v18 = 1;
  }
  return v16(v17, v18, 1, v19);
}

uint64_t sub_25E9F7DD8(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_bridgeObjectRetain();
  unint64_t v4 = sub_25EA02548(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *v2;
  uint64_t v12 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_25EA03128();
    uint64_t v7 = v12;
  }
  uint64_t v8 = *(void *)(v7 + 48);
  uint64_t v9 = type metadata accessor for ScopeGraphElement.ID(0);
  sub_25E9FAEE8(v8 + *(void *)(*(void *)(v9 - 8) + 72) * v4, type metadata accessor for ScopeGraphElement.ID);
  uint64_t v10 = *(void *)(*(void *)(v7 + 56) + 8 * v4);
  sub_25EA049D0(v4, v7);
  *uint64_t v2 = v7;
  swift_bridgeObjectRelease();
  return v10;
}

double sub_25E9F7ECC@<D0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  return sub_25E9F7F0C(a1, (void (*)(unint64_t, uint64_t))sub_25E9F9FD0, (void (*)(unint64_t, uint64_t))sub_25EA040AC, (void (*)(void))sub_25EA03AA4, a2);
}

double sub_25E9F7F0C@<D0>(uint64_t a1@<X2>, void (*a2)(unint64_t, uint64_t)@<X3>, void (*a3)(unint64_t, uint64_t)@<X4>, void (*a4)(void)@<X5>, uint64_t a5@<X8>)
{
  uint64_t v9 = v5;
  unint64_t v11 = sub_25EA06630(a1);
  if (v12)
  {
    unint64_t v13 = v11;
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v15 = *v5;
    uint64_t v17 = *v9;
    *uint64_t v9 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      a4();
      uint64_t v15 = v17;
    }
    swift_bridgeObjectRelease();
    a2(*(void *)(v15 + 56) + 40 * v13, a5);
    a3(v13, v15);
    *uint64_t v9 = v15;
    swift_bridgeObjectRelease();
  }
  else
  {
    *(void *)(a5 + 32) = 0;
    double result = 0.0;
    *(_OWORD *)a5 = 0u;
    *(_OWORD *)(a5 + 16) = 0u;
  }
  return result;
}

unint64_t *sub_25E9F801C(uint64_t isStackAllocationSafe, unint64_t *a2)
{
  uint64_t v4 = isStackAllocationSafe;
  v11[1] = *MEMORY[0x263EF8340];
  char v5 = *(unsigned char *)(isStackAllocationSafe + 32);
  unint64_t v6 = (unint64_t)((1 << v5) + 63) >> 6;
  size_t v7 = 8 * v6;
  if ((v5 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    bzero((char *)v11 - ((v7 + 15) & 0x3FFFFFFFFFFFFFF0), v7);
    uint64_t v8 = sub_25E9F8288((void *)((char *)v11 - ((v7 + 15) & 0x3FFFFFFFFFFFFFF0)), v6, v4, (uint64_t)a2);
    if (v2) {
      swift_willThrow();
    }
    else {
      return v8;
    }
  }
  else
  {
    uint64_t v9 = (void *)swift_slowAlloc();
    bzero(v9, v7);
    a2 = sub_25E9F8288((unint64_t *)v9, v6, v4, (uint64_t)a2);
    MEMORY[0x2611E7A60](v9, -1, -1);
  }
  return a2;
}

uint64_t sub_25E9F8188(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void sub_25E9F81F0(uint64_t a1)
{
}

void sub_25E9F8224(uint64_t a1)
{
}

uint64_t sub_25E9F8258(uint64_t a1, uint64_t a2)
{
  return sub_25E9FB3A0(a1, a2, (uint64_t (*)(void))sub_25E9F8224);
}

uint64_t sub_25E9F8270(uint64_t a1, uint64_t a2)
{
  return sub_25E9F8188(a1, a2, (uint64_t (*)(void))sub_25E9F8224);
}

unint64_t *sub_25E9F8288(unint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = 0;
  int64_t v6 = 0;
  uint64_t v7 = a3 + 64;
  uint64_t v8 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & *(void *)(a3 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  while (1)
  {
    if (v10)
    {
      unint64_t v12 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v13 = v12 | (v6 << 6);
      goto LABEL_5;
    }
    int64_t v14 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v14 >= v11) {
      return (unint64_t *)sub_25E9F83DC(result, a2, v5, a3);
    }
    unint64_t v15 = *(void *)(v7 + 8 * v14);
    ++v6;
    if (!v15)
    {
      int64_t v6 = v14 + 1;
      if (v14 + 1 >= v11) {
        return (unint64_t *)sub_25E9F83DC(result, a2, v5, a3);
      }
      unint64_t v15 = *(void *)(v7 + 8 * v6);
      if (!v15)
      {
        int64_t v6 = v14 + 2;
        if (v14 + 2 >= v11) {
          return (unint64_t *)sub_25E9F83DC(result, a2, v5, a3);
        }
        unint64_t v15 = *(void *)(v7 + 8 * v6);
        if (!v15) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v10 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v6 << 6);
LABEL_5:
    if (*(void *)(*(void *)(a3 + 56) + 8 * v13) == a4)
    {
      *(unint64_t *)((char *)result + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      if (__OFADD__(v5++, 1))
      {
        __break(1u);
        return (unint64_t *)sub_25E9F83DC(result, a2, v5, a3);
      }
    }
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v11) {
    return (unint64_t *)sub_25E9F83DC(result, a2, v5, a3);
  }
  unint64_t v15 = *(void *)(v7 + 8 * v16);
  if (v15)
  {
    int64_t v6 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v6 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v6 >= v11) {
      return (unint64_t *)sub_25E9F83DC(result, a2, v5, a3);
    }
    unint64_t v15 = *(void *)(v7 + 8 * v6);
    ++v16;
    if (v15) {
      goto LABEL_20;
    }
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_25E9F83DC(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a3) {
    return MEMORY[0x263F8EE80];
  }
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3)
  {
    swift_retain();
    return v4;
  }
  sub_25E9F9BD4();
  uint64_t result = sub_25EA36450();
  uint64_t v9 = result;
  uint64_t v31 = a1;
  uint64_t v32 = a2;
  if (a2 < 1) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = *a1;
  }
  uint64_t v11 = 0;
  uint64_t v12 = result + 64;
  while (1)
  {
    if (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v14 = v13 | (v11 << 6);
    }
    else
    {
      uint64_t v15 = v11 + 1;
      if (__OFADD__(v11, 1)) {
        goto LABEL_40;
      }
      if (v15 >= v32) {
        return v9;
      }
      unint64_t v16 = v31[v15];
      ++v11;
      if (!v16)
      {
        uint64_t v11 = v15 + 1;
        if (v15 + 1 >= v32) {
          return v9;
        }
        unint64_t v16 = v31[v11];
        if (!v16)
        {
          uint64_t v11 = v15 + 2;
          if (v15 + 2 >= v32) {
            return v9;
          }
          unint64_t v16 = v31[v11];
          if (!v16)
          {
            uint64_t v17 = v15 + 3;
            if (v17 >= v32) {
              return v9;
            }
            unint64_t v16 = v31[v17];
            if (!v16)
            {
              while (1)
              {
                uint64_t v11 = v17 + 1;
                if (__OFADD__(v17, 1)) {
                  goto LABEL_41;
                }
                if (v11 >= v32) {
                  return v9;
                }
                unint64_t v16 = v31[v11];
                ++v17;
                if (v16) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v11 = v17;
          }
        }
      }
LABEL_24:
      unint64_t v10 = (v16 - 1) & v16;
      unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
    }
    uint64_t v18 = 8 * v14;
    uint64_t v19 = *(void *)(*(void *)(v4 + 48) + v18);
    uint64_t v20 = *(void *)(*(void *)(v4 + 56) + v18);
    sub_25EA36530();
    sub_25EA36540();
    uint64_t result = sub_25EA36560();
    uint64_t v21 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v22 = result & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v12 + 8 * (v22 >> 6))) != 0)
    {
      unint64_t v24 = __clz(__rbit64((-1 << v22) & ~*(void *)(v12 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v27 = v23 == v26;
        if (v23 == v26) {
          unint64_t v23 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v12 + 8 * v23);
      }
      while (v28 == -1);
      unint64_t v24 = __clz(__rbit64(~v28)) + (v23 << 6);
    }
    *(void *)(v12 + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v24;
    uint64_t v29 = 8 * v24;
    *(void *)(*(void *)(v9 + 48) + v29) = v19;
    *(void *)(*(void *)(v9 + 56) + v29) = v20;
    ++*(void *)(v9 + 16);
    if (__OFSUB__(v5--, 1)) {
      break;
    }
    if (!v5) {
      return v9;
    }
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

void *sub_25E9F8660()
{
  return sub_25E9F8708((uint64_t (*)(void))sub_25E9F8224, (void (*)(void))sub_25E9F9358, (void (*)(unint64_t, char *))sub_25E9F8258, (uint64_t (*)(char *, unint64_t))sub_25E9F8270);
}

void *sub_25E9F86B4()
{
  return sub_25E9F8708((uint64_t (*)(void))type metadata accessor for Storage.ExplicitUpdate, (void (*)(void))sub_25E9FA2EC, (void (*)(unint64_t, char *))sub_25E9FA2BC, (uint64_t (*)(char *, unint64_t))sub_25E9FA2D4);
}

void *sub_25E9F8708(uint64_t (*a1)(void), void (*a2)(void), void (*a3)(unint64_t, char *), uint64_t (*a4)(char *, unint64_t))
{
  uint64_t v8 = v4;
  uint64_t v9 = a1(0);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v12 = (char *)&v30 - v11;
  a2(0);
  uint64_t v13 = *v4;
  uint64_t v14 = sub_25EA36340();
  uint64_t v15 = v14;
  if (!*(void *)(v13 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_30:
    *uint64_t v8 = v15;
    return result;
  }
  uint64_t result = (void *)(v14 + 56);
  unint64_t v17 = (unint64_t)((1 << *(unsigned char *)(v15 + 32)) + 63) >> 6;
  uint64_t v30 = v8;
  uint64_t v31 = (const void *)(v13 + 56);
  if (v15 != v13 || (unint64_t)result >= v13 + 56 + 8 * v17) {
    uint64_t result = memmove(result, v31, 8 * v17);
  }
  int64_t v19 = 0;
  *(void *)(v15 + 16) = *(void *)(v13 + 16);
  uint64_t v20 = 1 << *(unsigned char *)(v13 + 32);
  uint64_t v21 = -1;
  if (v20 < 64) {
    uint64_t v21 = ~(-1 << v20);
  }
  unint64_t v22 = v21 & *(void *)(v13 + 56);
  int64_t v23 = (unint64_t)(v20 + 63) >> 6;
  while (1)
  {
    if (v22)
    {
      unint64_t v24 = __clz(__rbit64(v22));
      v22 &= v22 - 1;
      unint64_t v25 = v24 | (v19 << 6);
      goto LABEL_12;
    }
    int64_t v27 = v19 + 1;
    if (__OFADD__(v19, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v27 >= v23) {
      goto LABEL_28;
    }
    unint64_t v28 = *((void *)v31 + v27);
    ++v19;
    if (!v28)
    {
      int64_t v19 = v27 + 1;
      if (v27 + 1 >= v23) {
        goto LABEL_28;
      }
      unint64_t v28 = *((void *)v31 + v19);
      if (!v28)
      {
        int64_t v19 = v27 + 2;
        if (v27 + 2 >= v23) {
          goto LABEL_28;
        }
        unint64_t v28 = *((void *)v31 + v19);
        if (!v28) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v22 = (v28 - 1) & v28;
    unint64_t v25 = __clz(__rbit64(v28)) + (v19 << 6);
LABEL_12:
    unint64_t v26 = *(void *)(v10 + 72) * v25;
    a3(*(void *)(v13 + 48) + v26, v12);
    uint64_t result = (void *)a4(v12, *(void *)(v15 + 48) + v26);
  }
  int64_t v29 = v27 + 3;
  if (v29 >= v23)
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t v8 = v30;
    goto LABEL_30;
  }
  unint64_t v28 = *((void *)v31 + v29);
  if (v28)
  {
    int64_t v19 = v29;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v19 = v29 + 1;
    if (__OFADD__(v29, 1)) {
      break;
    }
    if (v19 >= v23) {
      goto LABEL_28;
    }
    unint64_t v28 = *((void *)v31 + v19);
    ++v29;
    if (v28) {
      goto LABEL_27;
    }
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_25E9F8984@<X0>(uint64_t a1@<X8>)
{
  sub_25E9F8224(0);
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = v1;
  uint64_t v8 = *v1;
  sub_25EA36530();
  sub_25EA35ED0();
  sub_25E9FADFC(&qword_26A727660, MEMORY[0x263F07508]);
  swift_bridgeObjectRetain();
  sub_25EA360F0();
  sub_25EA360F0();
  uint64_t v9 = sub_25EA36560();
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  unint64_t v11 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11))
  {
    uint64_t v12 = v5;
    uint64_t v13 = ~v10;
    uint64_t v22 = v12;
    uint64_t v23 = a1;
    uint64_t v14 = *(void *)(v12 + 72);
    while (1)
    {
      sub_25E9F8258(*(void *)(v8 + 48) + v14 * v11, (uint64_t)v7);
      if ((_s9TeaBreeze17ScopeGraphElementV2IDV2eeoiySbAE_AEtFZ_0() & 1) != 0
        && (_s9TeaBreeze17ScopeGraphElementV2IDV2eeoiySbAE_AEtFZ_0() & 1) != 0)
      {
        break;
      }
      sub_25E9FAEE8((uint64_t)v7, (uint64_t (*)(void))sub_25E9F8224);
      unint64_t v11 = (v11 + 1) & v13;
      if (((*(void *)(v8 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v5 = v22;
        a1 = v23;
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(a1, 1, 1, v4);
      }
    }
    sub_25E9FAEE8((uint64_t)v7, (uint64_t (*)(void))sub_25E9F8224);
    swift_bridgeObjectRelease();
    uint64_t v15 = v21;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v17 = *v15;
    uint64_t v24 = *v15;
    *uint64_t v15 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_25E9F8708((uint64_t (*)(void))sub_25E9F8224, (void (*)(void))sub_25E9F9358, (void (*)(unint64_t, char *))sub_25E9F8258, (uint64_t (*)(char *, unint64_t))sub_25E9F8270);
      uint64_t v17 = v24;
    }
    uint64_t v18 = *(void *)(v17 + 48) + v14 * v11;
    uint64_t v19 = v23;
    sub_25E9F8270(v18, v23);
    sub_25E9F9020(v11);
    *uint64_t v15 = v24;
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v4);
  }
  else
  {
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(a1, 1, 1, v4);
  }
}

uint64_t sub_25E9F8CC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = type metadata accessor for Storage.ExplicitUpdate();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  sub_25EA36530();
  sub_25EA35ED0();
  sub_25E9FADFC(&qword_26A727660, MEMORY[0x263F07508]);
  swift_bridgeObjectRetain();
  sub_25EA360F0();
  uint64_t v10 = (void *)(a1 + *(int *)(v5 + 20));
  swift_bridgeObjectRetain();
  sub_25EA36140();
  swift_bridgeObjectRelease();
  uint64_t v11 = sub_25EA36560();
  uint64_t v12 = -1 << *(unsigned char *)(v9 + 32);
  unint64_t v13 = v11 & ~v12;
  if ((*(void *)(v9 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    uint64_t v23 = v2;
    uint64_t v24 = v6;
    uint64_t v25 = a2;
    uint64_t v14 = ~v12;
    uint64_t v15 = *(void *)(v6 + 72);
    while (1)
    {
      sub_25E9FA2BC(*(void *)(v9 + 48) + v15 * v13, (uint64_t)v8);
      if (_s9TeaBreeze17ScopeGraphElementV2IDV2eeoiySbAE_AEtFZ_0())
      {
        unint64_t v16 = &v8[*(int *)(v5 + 20)];
        BOOL v17 = *(void *)v16 == *v10 && *((void *)v16 + 1) == v10[1];
        if (v17 || (sub_25EA364B0() & 1) != 0) {
          break;
        }
      }
      sub_25E9FAEE8((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for Storage.ExplicitUpdate);
      unint64_t v13 = (v13 + 1) & v14;
      if (((*(void *)(v9 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v6 = v24;
        a2 = v25;
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(a2, 1, 1, v5);
      }
    }
    sub_25E9FAEE8((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for Storage.ExplicitUpdate);
    swift_bridgeObjectRelease();
    uint64_t v18 = v23;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v20 = *v18;
    uint64_t v26 = *v18;
    *uint64_t v18 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_25E9F8708((uint64_t (*)(void))type metadata accessor for Storage.ExplicitUpdate, (void (*)(void))sub_25E9FA2EC, (void (*)(unint64_t, char *))sub_25E9FA2BC, (uint64_t (*)(char *, unint64_t))sub_25E9FA2D4);
      uint64_t v20 = v26;
    }
    uint64_t v21 = v25;
    sub_25E9FA2D4(*(void *)(v20 + 48) + v15 * v13, v25);
    sub_25E9F945C(v13);
    *uint64_t v18 = v26;
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v5);
  }
  else
  {
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(a2, 1, 1, v5);
  }
}

uint64_t sub_25E9F9020(unint64_t a1)
{
  sub_25E9F8224(0);
  uint64_t v31 = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t result = MEMORY[0x270FA5388](v3);
  uint64_t v30 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v1;
  uint64_t v8 = *v1 + 56;
  uint64_t v9 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(void *)(v8 + 8 * (v10 >> 6))) != 0)
  {
    int64_t v27 = v1;
    uint64_t v11 = ~v9;
    swift_retain();
    int64_t v12 = a1;
    uint64_t v13 = sub_25EA36330();
    if ((*(void *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      unint64_t v14 = (v13 + 1) & v11;
      uint64_t v15 = *(void *)(v4 + 72);
      uint64_t v28 = v15;
      uint64_t v29 = v8;
      uint64_t v16 = (uint64_t)v30;
      do
      {
        int64_t v17 = v15 * v10;
        sub_25E9F8258(*(void *)(v7 + 48) + v15 * v10, v16);
        uint64_t v18 = v7;
        sub_25EA36530();
        sub_25EA35ED0();
        sub_25E9FADFC(&qword_26A727660, MEMORY[0x263F07508]);
        unint64_t v19 = v14;
        sub_25EA360F0();
        sub_25EA360F0();
        uint64_t v20 = sub_25EA36560();
        sub_25E9FAEE8(v16, (uint64_t (*)(void))sub_25E9F8224);
        unint64_t v21 = v20 & v11;
        unint64_t v14 = v19;
        if (v12 >= (uint64_t)v19)
        {
          if (v21 < v19)
          {
            uint64_t v15 = v28;
            uint64_t v8 = v29;
            uint64_t v7 = v18;
            goto LABEL_6;
          }
          uint64_t v15 = v28;
          uint64_t v8 = v29;
          uint64_t v7 = v18;
          if (v12 < (uint64_t)v21) {
            goto LABEL_6;
          }
        }
        else
        {
          uint64_t v15 = v28;
          uint64_t v8 = v29;
          uint64_t v7 = v18;
          if (v21 < v14 && v12 < (uint64_t)v21) {
            goto LABEL_6;
          }
        }
        int64_t v22 = v15 * v12;
        if (v15 * v12 < v17 || *(void *)(v7 + 48) + v15 * v12 >= (unint64_t)(*(void *)(v7 + 48) + v17 + v15))
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          int64_t v12 = v10;
          if (v22 == v17) {
            goto LABEL_6;
          }
          swift_arrayInitWithTakeBackToFront();
        }
        int64_t v12 = v10;
LABEL_6:
        unint64_t v10 = (v10 + 1) & v11;
      }
      while (((*(void *)(v8 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    *(void *)(v8 + (((unint64_t)v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v12) - 1;
    uint64_t result = swift_release();
    uint64_t v1 = v27;
  }
  else
  {
    *(void *)(v8 + ((a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
  }
  uint64_t v23 = *v1;
  uint64_t v24 = *(void *)(*v1 + 16);
  BOOL v25 = __OFSUB__(v24, 1);
  uint64_t v26 = v24 - 1;
  if (v25)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v23 + 16) = v26;
    ++*(_DWORD *)(v23 + 36);
  }
  return result;
}

void sub_25E9F9358()
{
  if (!qword_26A7276C0)
  {
    sub_25E9F8224(255);
    sub_25E9F93BC();
    unint64_t v0 = sub_25EA36360();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A7276C0);
    }
  }
}

unint64_t sub_25E9F93BC()
{
  unint64_t result = qword_26A7276C8;
  if (!qword_26A7276C8)
  {
    sub_25E9F8224(255);
    sub_25E9FADFC(&qword_26A727668, (void (*)(uint64_t))type metadata accessor for ScopeGraphElement.ID);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7276C8);
  }
  return result;
}

uint64_t sub_25E9F945C(unint64_t a1)
{
  uint64_t v25 = type metadata accessor for Storage.ExplicitUpdate();
  uint64_t v3 = *(void *)(v25 - 8);
  uint64_t result = MEMORY[0x270FA5388](v25);
  uint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v1;
  uint64_t v8 = *v1 + 56;
  uint64_t v9 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(void *)(v8 + 8 * (v10 >> 6))) != 0)
  {
    uint64_t v23 = v1;
    uint64_t v11 = ~v9;
    swift_retain();
    uint64_t v12 = sub_25EA36330();
    uint64_t v24 = v8;
    if ((*(void *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      unint64_t v13 = (v12 + 1) & v11;
      uint64_t v14 = *(void *)(v3 + 72);
      while (1)
      {
        int64_t v15 = v14 * v10;
        sub_25E9FA2BC(*(void *)(v7 + 48) + v14 * v10, (uint64_t)v6);
        sub_25EA36530();
        sub_25EA35ED0();
        sub_25E9FADFC(&qword_26A727660, MEMORY[0x263F07508]);
        sub_25EA360F0();
        swift_bridgeObjectRetain();
        sub_25EA36140();
        swift_bridgeObjectRelease();
        uint64_t v16 = sub_25EA36560();
        sub_25E9FAEE8((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for Storage.ExplicitUpdate);
        unint64_t v17 = v16 & v11;
        if ((uint64_t)a1 >= (uint64_t)v13) {
          break;
        }
        if (v17 < v13) {
          goto LABEL_11;
        }
LABEL_12:
        unint64_t v18 = v14 * a1;
        if ((uint64_t)(v14 * a1) < v15 || *(void *)(v7 + 48) + v14 * a1 >= *(void *)(v7 + 48) + v15 + v14)
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          a1 = v10;
          if (v18 == v15) {
            goto LABEL_6;
          }
          swift_arrayInitWithTakeBackToFront();
        }
        a1 = v10;
LABEL_6:
        unint64_t v10 = (v10 + 1) & v11;
        if (((*(void *)(v24 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
          goto LABEL_16;
        }
      }
      if (v17 < v13) {
        goto LABEL_6;
      }
LABEL_11:
      if ((uint64_t)a1 < (uint64_t)v17) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
LABEL_16:
    *(void *)(v24 + ((a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
    uint64_t result = swift_release();
    uint64_t v1 = v23;
  }
  else
  {
    *(void *)(v8 + ((a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
  }
  uint64_t v19 = *v1;
  uint64_t v20 = *(void *)(*v1 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v19 + 16) = v22;
    ++*(_DWORD *)(v19 + 36);
  }
  return result;
}

void (*sub_25E9F9768(void *a1, uint64_t a2))(uint64_t a1)
{
  uint64_t v4 = malloc(0x58uLL);
  *a1 = v4;
  uint64_t v5 = type metadata accessor for ScopeGraphElement.ID(0);
  uint64_t v6 = malloc(*(void *)(*(void *)(v5 - 8) + 64));
  v4[8] = v6;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_25E9FB3A0(a2, (uint64_t)v6, type metadata accessor for ScopeGraphElement.ID);
  v4[9] = sub_25E9F9A58(v4);
  v4[10] = sub_25E9F98D8(v4 + 4, (uint64_t)v6, isUniquelyReferenced_nonNull_native);
  return sub_25E9F9848;
}

void sub_25E9F9848(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void (**)(void *, void))(*(void *)a1 + 72);
  uint64_t v3 = *(void **)(*(void *)a1 + 64);
  (*(void (**)(void))(*(void *)a1 + 80))();
  sub_25E9FAEE8((uint64_t)v3, type metadata accessor for ScopeGraphElement.ID);
  v2(v1, 0);
  free(v3);
  free(v1);
}

void (*sub_25E9F98D8(void *a1, uint64_t a2, char a3))(uint64_t **a1)
{
  uint64_t v4 = v3;
  uint64_t v8 = malloc(0x28uLL);
  *a1 = v8;
  v8[1] = a2;
  v8[2] = v3;
  uint64_t v9 = *v3;
  unint64_t v11 = sub_25EA02548(a2);
  *((unsigned char *)v8 + 32) = v10 & 1;
  uint64_t v12 = *(void *)(v9 + 16);
  BOOL v13 = (v10 & 1) == 0;
  uint64_t v14 = v12 + v13;
  if (__OFADD__(v12, v13))
  {
    __break(1u);
  }
  else
  {
    char v15 = v10;
    uint64_t v16 = *(void *)(v9 + 24);
    if (v16 >= v14 && (a3 & 1) != 0)
    {
LABEL_7:
      v8[3] = v11;
      if (v15)
      {
LABEL_8:
        uint64_t v17 = *(void *)(*(void *)(*v4 + 56) + 8 * v11);
LABEL_12:
        *uint64_t v8 = v17;
        return sub_25E9F9A08;
      }
LABEL_11:
      uint64_t v17 = 0;
      goto LABEL_12;
    }
    if (v16 >= v14 && (a3 & 1) == 0)
    {
      sub_25EA03128();
      goto LABEL_7;
    }
    sub_25EA09558(v14, a3 & 1);
    unint64_t v18 = sub_25EA02548(a2);
    if ((v15 & 1) == (v19 & 1))
    {
      unint64_t v11 = v18;
      v8[3] = v18;
      if (v15) {
        goto LABEL_8;
      }
      goto LABEL_11;
    }
  }
  type metadata accessor for ScopeGraphElement.ID(0);
  uint64_t result = (void (*)(uint64_t **))sub_25EA364D0();
  __break(1u);
  return result;
}

void sub_25E9F9A08(uint64_t **a1)
{
  uint64_t v1 = *a1;
  sub_25E9F9A94(*a1, *((unsigned char *)*a1 + 32), (uint64_t *)(*a1)[2], (*a1)[3], (*a1)[1]);
  swift_bridgeObjectRelease();
  free(v1);
}

uint64_t (*sub_25E9F9A58(void *a1))(uint64_t result)
{
  *a1 = *v1;
  a1[1] = v1;
  *uint64_t v1 = 0x8000000000000000;
  return sub_25E9F9A88;
}

uint64_t sub_25E9F9A88(uint64_t result)
{
  **(void **)(result + 8) = *(void *)result;
  return result;
}

uint64_t sub_25E9F9A94(uint64_t *a1, char a2, uint64_t *a3, unint64_t a4, uint64_t a5)
{
  uint64_t v10 = type metadata accessor for ScopeGraphElement.ID(0);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *a1;
  if (v13)
  {
    uint64_t v14 = (void *)*a3;
    if (a2)
    {
      *(void *)(v14[7] + 8 * a4) = v13;
    }
    else
    {
      sub_25E9FB3A0(a5, (uint64_t)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for ScopeGraphElement.ID);
      sub_25EA0B388(a4, (uint64_t)v12, v13, v14);
    }
  }
  else if (a2)
  {
    swift_arrayDestroy();
    sub_25EA049D0(a4, *a3);
  }
  return swift_bridgeObjectRetain();
}

void sub_25E9F9BD4()
{
  if (!qword_26A7276D0)
  {
    sub_25E9F9C34();
    unint64_t v0 = sub_25EA36460();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A7276D0);
    }
  }
}

unint64_t sub_25E9F9C34()
{
  unint64_t result = qword_26A7276D8;
  if (!qword_26A7276D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7276D8);
  }
  return result;
}

uint64_t sub_25E9F9C88(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v13 = a4;
  uint64_t v14 = a5;
  uint64_t v9 = sub_25E9F9FE8((uint64_t *)&v12);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32))(v9, a2, a4);
  uint64_t v10 = *a3;
  *(void *)(v10 + 16) = a1 + 1;
  return sub_25E9F9FD0(&v12, v10 + 40 * a1 + 32);
}

uint64_t sub_25E9F9D20(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void v18[3] = a5;
  v18[4] = a6;
  uint64_t v11 = sub_25E9F9FE8(v18);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a5 - 8) + 16))(v11, a1, a5);
  uint64_t v12 = *a2;
  sub_25E9EFBCC((uint64_t)v18, (uint64_t)v16);
  sub_25E9FAE98(0, &qword_26A727738);
  sub_25E9FAE98(0, &qword_26A727750);
  if (swift_dynamicCast())
  {
    sub_25E9F9FD0(v14, (uint64_t)v17);
    sub_25E9EFC30(v17, v17[3]);
    sub_25E9FA4C4(a3, a4, v12);
    sub_25E9EF02C((uint64_t)v17);
  }
  else
  {
    uint64_t v15 = 0;
    memset(v14, 0, sizeof(v14));
    sub_25E9FAD34((uint64_t)v14, &qword_26A727758, &qword_26A727750, (uint64_t)&protocol descriptor for CommandHandler);
  }
  return sub_25E9EF02C((uint64_t)v18);
}

uint64_t sub_25E9F9E78(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void v18[3] = a5;
  v18[4] = a6;
  uint64_t v11 = sub_25E9F9FE8(v18);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a5 - 8) + 16))(v11, a1, a5);
  uint64_t v12 = *a2;
  sub_25E9EFBCC((uint64_t)v18, (uint64_t)v16);
  sub_25E9FAE98(0, &qword_26A727738);
  sub_25E9FAE98(0, &qword_26A727740);
  if (swift_dynamicCast())
  {
    sub_25E9F9FD0(v14, (uint64_t)v17);
    sub_25E9EFC30(v17, v17[3]);
    sub_25E9FA7E8(a3, a4, v12);
    sub_25E9EF02C((uint64_t)v17);
  }
  else
  {
    uint64_t v15 = 0;
    memset(v14, 0, sizeof(v14));
    sub_25E9FAD34((uint64_t)v14, &qword_26A727748, &qword_26A727740, (uint64_t)&protocol descriptor for EventHandler);
  }
  return sub_25E9EF02C((uint64_t)v18);
}

uint64_t sub_25E9F9FD0(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t *sub_25E9F9FE8(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_25E9FA04C(uint64_t a1, uint64_t a2)
{
  sub_25E9FA0DC(0, &qword_26A7276E0, &qword_26A7276E8, (uint64_t)&protocol descriptor for GraphUpdate, MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_25E9FA0DC(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v8 = sub_25E9FAE98(255, a3);
    unint64_t v9 = a5(a1, v8);
    if (!v10) {
      atomic_store(v9, a2);
    }
  }
}

uint64_t type metadata accessor for DependencyGraph.UpdateGraphVisitor()
{
  uint64_t result = qword_26A727780;
  if (!qword_26A727780) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_25E9FA190(unsigned char *a1@<X8>)
{
  sub_25E9F6C3C(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

void sub_25E9FA1AC()
{
  if (!qword_26A727700)
  {
    type metadata accessor for ScopeGraphElement.ID(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_26A727700);
    }
  }
}

uint64_t sub_25E9FA218(uint64_t a1, uint64_t a2)
{
  sub_25E9FA380(0, &qword_26A7276F8, (uint64_t (*)(uint64_t))sub_25E9FA1AC, MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25E9FA2AC(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_25E9FA2BC(uint64_t a1, uint64_t a2)
{
  return sub_25E9FB3A0(a1, a2, (uint64_t (*)(void))type metadata accessor for Storage.ExplicitUpdate);
}

uint64_t sub_25E9FA2D4(uint64_t a1, uint64_t a2)
{
  return sub_25E9F8188(a1, a2, (uint64_t (*)(void))type metadata accessor for Storage.ExplicitUpdate);
}

void sub_25E9FA2EC()
{
  if (!qword_26A727708)
  {
    type metadata accessor for Storage.ExplicitUpdate();
    sub_25E9FADFC(&qword_26A727710, (void (*)(uint64_t))type metadata accessor for Storage.ExplicitUpdate);
    unint64_t v0 = sub_25EA36360();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A727708);
    }
  }
}

void sub_25E9FA380(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

unint64_t sub_25E9FA3E4()
{
  unint64_t result = qword_26A727720;
  if (!qword_26A727720)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A727720);
  }
  return result;
}

double sub_25E9FA424@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_25E9F3E84(a1, a2);
}

unint64_t sub_25E9FA440()
{
  unint64_t result = qword_26A727730;
  if (!qword_26A727730)
  {
    sub_25E9FA0DC(255, &qword_26A727728, &qword_26A7276E8, (uint64_t)&protocol descriptor for GraphUpdate, MEMORY[0x263F8D488]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A727730);
  }
  return result;
}

uint64_t sub_25E9FA4C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for ScopeGraphElement.ID(0);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (uint64_t)v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v8 = type metadata accessor for CommandHandlingRuleUpdate();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v11 = (char *)v28 - v10;
  sub_25E9FB3A0(a1, v7, type metadata accessor for ScopeGraphElement.ID);
  sub_25E9FCF04(v7, (uint64_t)v11);
  v29[3] = v8;
  v29[4] = swift_getWitnessTable();
  uint64_t v12 = sub_25E9F9FE8(v29);
  (*(void (**)(uint64_t *, char *, uint64_t))(v9 + 16))(v12, v11, v8);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v28[0] = *(void *)(a2 + 64);
  uint64_t v14 = v28[0];
  *(void *)(a2 + 64) = 0x8000000000000000;
  unint64_t v16 = sub_25EA024DC(a3);
  uint64_t v17 = *(void *)(v14 + 16);
  BOOL v18 = (v15 & 1) == 0;
  uint64_t v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
    goto LABEL_10;
  }
  LOBYTE(v7) = v15;
  if (*(void *)(v14 + 24) >= v19)
  {
    if (isUniquelyReferenced_nonNull_native) {
      goto LABEL_6;
    }
LABEL_10:
    sub_25EA02914();
    uint64_t v14 = v28[0];
    goto LABEL_6;
  }
  sub_25EA08934(v19, isUniquelyReferenced_nonNull_native);
  uint64_t v14 = v28[0];
  unint64_t v20 = sub_25EA024DC(a3);
  if ((v7 & 1) != (v21 & 1))
  {
    uint64_t result = sub_25EA364D0();
    __break(1u);
    return result;
  }
  unint64_t v16 = v20;
LABEL_6:
  *(void *)(a2 + 64) = v14;
  swift_bridgeObjectRelease();
  if ((v7 & 1) == 0) {
    sub_25EA0B18C(v16, a3, MEMORY[0x263F8EE80], *(void **)(a2 + 64));
  }
  uint64_t v22 = sub_25EA0CEF8();
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  sub_25E9FA04C((uint64_t)v29, (uint64_t)v28);
  sub_25E9FFA44((uint64_t)v28, v22, v24, v26);
  sub_25E9FAD34((uint64_t)v29, &qword_26A7276E0, &qword_26A7276E8, (uint64_t)&protocol descriptor for GraphUpdate);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_25E9FA7E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for ScopeGraphElement.ID(0);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v7 = (char *)&v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v8 = type metadata accessor for EventHandlingRuleUpdate();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v58 = (char *)&v56 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v56 - v13;
  MEMORY[0x270FA5388](v12);
  unint64_t v16 = (char *)&v56 - v15;
  sub_25E9FB3A0(a1, (uint64_t)v7, type metadata accessor for ScopeGraphElement.ID);
  sub_25E9FCF04((uint64_t)v7, (uint64_t)v16);
  uint64_t v59 = v9;
  uint64_t v17 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  uint64_t v56 = v16;
  unint64_t v57 = v17;
  v17(v14, v16, v8);
  uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v61 = *(void **)(a2 + 72);
  uint64_t v19 = v61;
  *(void *)(a2 + 72) = 0x8000000000000000;
  unint64_t v21 = sub_25EA024DC(a3);
  uint64_t v22 = v19[2];
  BOOL v23 = (v20 & 1) == 0;
  uint64_t v24 = v22 + v23;
  if (__OFADD__(v22, v23))
  {
    __break(1u);
    goto LABEL_26;
  }
  char v25 = v20;
  if (v19[3] >= v24)
  {
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      goto LABEL_28;
    }
  }
  else
  {
    sub_25EA0897C(v24, isUniquelyReferenced_nonNull_native);
    uint64_t v19 = v61;
    unint64_t v26 = sub_25EA024DC(a3);
    if ((v25 & 1) != (v27 & 1))
    {
      sub_25EA364D0();
      __break(1u);
      goto LABEL_30;
    }
    unint64_t v21 = v26;
  }
  while (1)
  {
    *(void *)(a2 + 72) = v19;
    swift_bridgeObjectRelease();
    uint64_t v28 = *(void *)(a2 + 72);
    if ((v25 & 1) == 0) {
      sub_25EA0B18C(v21, a3, MEMORY[0x263F8EE80], *(void **)(a2 + 72));
    }
    uint64_t isUniquelyReferenced_nonNull_native = *(void *)(v28 + 56);
    uint64_t v29 = *(void *)(isUniquelyReferenced_nonNull_native + 8 * v21);
    sub_25EA0CEF8();
    if (*(void *)(v29 + 16))
    {
      unint64_t v31 = sub_25EA06630(v30);
      a2 = v59;
      if (v32)
      {
        uint64_t v19 = *(void **)(*(void *)(v29 + 56) + 8 * v31);
        swift_bridgeObjectRetain();
      }
      else
      {
        uint64_t v19 = (void *)MEMORY[0x263F8EE78];
      }
    }
    else
    {
      uint64_t v19 = (void *)MEMORY[0x263F8EE78];
      a2 = v59;
    }
    swift_bridgeObjectRelease();
    char v33 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v61 = v19;
    if ((v33 & 1) == 0)
    {
LABEL_26:
      uint64_t v19 = sub_25EA08178(0, v19[2] + 1, 1, v19);
      uint64_t v61 = v19;
    }
    unint64_t v35 = v19[2];
    unint64_t v34 = v19[3];
    if (v35 >= v34 >> 1) {
      uint64_t v61 = sub_25EA08178((void *)(v34 > 1), v35 + 1, 1, v19);
    }
    uint64_t v36 = (uint64_t)v58;
    v57(v58, v14, v8);
    uint64_t WitnessTable = swift_getWitnessTable();
    sub_25E9F9C88(v35, v36, (uint64_t *)&v61, v8, WitnessTable);
    uint64_t v38 = *(char **)(a2 + 8);
    a2 += 8;
    uint64_t v58 = v38;
    uint64_t v59 = v8;
    uint64_t v39 = v8;
    uint64_t v8 = a2;
    ((void (*)(char *, uint64_t))v38)(v14, v39);
    uint64_t v14 = (char *)v61;
    unint64_t v57 = (void (*)(char *, char *, uint64_t))sub_25EA0CEF8();
    uint64_t v41 = v40;
    uint64_t v43 = v42;
    a3 = 8 * v21;
    char v25 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v60 = *(void *)(isUniquelyReferenced_nonNull_native + 8 * v21);
    uint64_t v44 = v60;
    *(void *)(isUniquelyReferenced_nonNull_native + 8 * v21) = 0x8000000000000000;
    unint64_t v21 = sub_25EA06630(v43);
    uint64_t v46 = *(void *)(v44 + 16);
    BOOL v47 = (v45 & 1) == 0;
    uint64_t v48 = v46 + v47;
    if (!__OFADD__(v46, v47)) {
      break;
    }
    __break(1u);
LABEL_28:
    sub_25EA0295C();
    uint64_t v19 = v61;
  }
  char v49 = v45;
  if (*(void *)(v44 + 24) >= v48)
  {
    if ((v25 & 1) == 0) {
      sub_25EA02B1C();
    }
    goto LABEL_22;
  }
  sub_25EA08C70(v48, v25);
  unint64_t v50 = sub_25EA06630(v43);
  if ((v49 & 1) != (v51 & 1))
  {
LABEL_30:
    uint64_t result = sub_25EA364D0();
    __break(1u);
    return result;
  }
  unint64_t v21 = v50;
LABEL_22:
  os_log_type_t v52 = v56;
  *(void *)(isUniquelyReferenced_nonNull_native + a3) = v60;
  swift_bridgeObjectRelease();
  uint64_t v53 = *(void *)(isUniquelyReferenced_nonNull_native + a3);
  if ((v49 & 1) == 0)
  {
    sub_25EA0B1F0(v21, (uint64_t)v57, v41, v43, MEMORY[0x263F8EE78], *(void **)(isUniquelyReferenced_nonNull_native + a3));
    swift_bridgeObjectRetain();
  }
  uint64_t v54 = *(void *)(v53 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v54 + 8 * v21) = v14;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return ((uint64_t (*)(char *, uint64_t))v58)(v52, v59);
}

uint64_t sub_25E9FAD34(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4)
{
  sub_25E9FA0DC(0, a2, a3, a4, MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  return a1;
}

void sub_25E9FADA4()
{
  if (!qword_26A727760)
  {
    unint64_t v0 = sub_25EA36200();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A727760);
    }
  }
}

uint64_t sub_25E9FADFC(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_25E9FAE44()
{
  unint64_t result = qword_26A727770;
  if (!qword_26A727770)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A727770);
  }
  return result;
}

uint64_t sub_25E9FAE98(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_25E9FAEE8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t *sub_25E9FAF48(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_25EA35ED0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t sub_25E9FB014(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25EA35ED0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_25E9FB090(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25EA35ED0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_25E9FB10C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25EA35ED0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_25E9FB188(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25EA35ED0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_25E9FB204(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25E9FB218);
}

uint64_t sub_25E9FB218(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ScopeGraphElement.ID(0);
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t sub_25E9FB284(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25E9FB298);
}

uint64_t sub_25E9FB298(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ScopeGraphElement.ID(0);
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t sub_25E9FB308()
{
  uint64_t result = sub_25EA35ED0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_25E9FB3A0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25E9FB408()
{
  return swift_getWitnessTable();
}

uint64_t sub_25E9FB450(uint64_t a1)
{
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *))(v2 + 16))((char *)&v4 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  return sub_25EA36130();
}

uint64_t sub_25E9FB508()
{
  return sub_25EA36120() & 1;
}

uint64_t sub_25E9FB530()
{
  return sub_25EA360F0();
}

uint64_t sub_25E9FB538()
{
  return sub_25EA36560();
}

uint64_t sub_25E9FB594()
{
  return sub_25E9FB508();
}

uint64_t sub_25E9FB5A0()
{
  return sub_25E9FB538();
}

uint64_t sub_25E9FB5A8()
{
  return sub_25E9FB530();
}

uint64_t sub_25E9FB5B0()
{
  return sub_25EA36560();
}

uint64_t sub_25E9FB604()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_25E9FB694(uint64_t *a1, uint64_t *a2, uint64_t a3)
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

uint64_t sub_25E9FB74C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
}

uint64_t sub_25E9FB778(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_25E9FB7C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_25E9FB818(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_25E9FB868(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_25E9FB8B8(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
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

void sub_25E9FBA14(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
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
      JUMPOUT(0x25E9FBC2CLL);
    case 4:
      *(_DWORD *)&a1[v8] = 0;
      goto LABEL_20;
    default:
LABEL_20:
      if (a2)
      {
LABEL_21:
        unint64_t v16 = *(void (**)(void))(v6 + 56);
        v16();
      }
      return;
  }
}

uint64_t type metadata accessor for Vertex()
{
  return sub_25E9ED2B4();
}

uint64_t DependencyEnvironment.dependencies.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for DependencyEnvironment() + 20);
  return sub_25E9FBCFC(v3, a1);
}

uint64_t type metadata accessor for DependencyEnvironment()
{
  uint64_t result = qword_26A727810;
  if (!qword_26A727810) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25E9FBCFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Dependencies();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t DependencyEnvironment.resolveDependency<A>(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2[3];
  uint64_t v5 = v2[4];
  sub_25E9EFC30(v2, v4);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 8))(a2, a2, v4, v5);
}

{
  void *v2;
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t AssociatedConformanceWitness;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  unsigned int v7 = (char *)&v13 - v6;
  size_t v8 = (char *)v2 + *(int *)(type metadata accessor for DependencyEnvironment() + 20);
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(char *, uint64_t, uint64_t))(AssociatedConformanceWitness + 24))(v8, AssociatedTypeWitness, AssociatedConformanceWitness);
  unsigned int v10 = v2[3];
  int v11 = v2[4];
  sub_25E9EFC30(v2, v10);
  (*(void (**)(uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 16))(a2, v7, a2, AssociatedTypeWitness, AssociatedConformanceWitness, v10, v11);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, AssociatedTypeWitness);
}

uint64_t DependencyEnvironment.resolveDependency<A, B>(_:disambiguation:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  uint64_t v11 = v6[3];
  uint64_t v12 = v6[4];
  sub_25E9EFC30(v6, v11);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 16))(a3, a2, a3, a4, a5, v11, v12);
}

void *initializeBufferWithCopyOfBuffer for DependencyEnvironment(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v20 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    long long v7 = *(_OWORD *)(a2 + 3);
    *(_OWORD *)(a1 + 24) = v7;
    (**(void (***)(uint64_t, uint64_t *))(v7 - 8))(a1, a2);
    uint64_t v8 = *(int *)(a3 + 20);
    BOOL v9 = (void *)((char *)v4 + v8);
    uint64_t v10 = (uint64_t)a2 + v8;
    uint64_t v12 = *(uint64_t *)((char *)a2 + v8);
    uint64_t v11 = *(uint64_t *)((char *)a2 + v8 + 8);
    *BOOL v9 = v12;
    v9[1] = v11;
    uint64_t v13 = type metadata accessor for Dependencies();
    uint64_t v14 = *(int *)(v13 + 24);
    __dst = (char *)v9 + v14;
    int v15 = (const void *)(v10 + v14);
    uint64_t v16 = type metadata accessor for ScopeGraphElement.ID(0);
    uint64_t v17 = *(void *)(v16 - 8);
    BOOL v18 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v17 + 48);
    swift_retain();
    if (v18(v15, 1, v16))
    {
      sub_25E9F7BF4(0);
      memcpy(__dst, v15, *(void *)(*(void *)(v19 - 8) + 64));
    }
    else
    {
      uint64_t v21 = sub_25EA35ED0();
      (*(void (**)(char *, const void *, uint64_t))(*(void *)(v21 - 8) + 16))(__dst, v15, v21);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(__dst, 0, 1, v16);
    }
    *(void *)((char *)v9 + *(int *)(v13 + 28)) = *(void *)(v10 + *(int *)(v13 + 28));
  }
  swift_retain();
  return v4;
}

uint64_t destroy for DependencyEnvironment(uint64_t a1, uint64_t a2)
{
  sub_25E9EF02C(a1);
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  swift_release();
  uint64_t v5 = v4 + *(int *)(type metadata accessor for Dependencies() + 24);
  uint64_t v6 = type metadata accessor for ScopeGraphElement.ID(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48))(v5, 1, v6))
  {
    uint64_t v7 = sub_25EA35ED0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v5, v7);
  }
  return swift_release();
}

uint64_t initializeWithCopy for DependencyEnvironment(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v6;
  (**(void (***)(void))(v6 - 8))();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  uint64_t v11 = *(void *)(a2 + v7);
  uint64_t v10 = *(void *)(a2 + v7 + 8);
  *uint64_t v8 = v11;
  v8[1] = v10;
  uint64_t v12 = type metadata accessor for Dependencies();
  uint64_t v13 = *(int *)(v12 + 24);
  __dst = (char *)v8 + v13;
  uint64_t v14 = (const void *)(v9 + v13);
  uint64_t v15 = type metadata accessor for ScopeGraphElement.ID(0);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v16 + 48);
  swift_retain();
  if (v17(v14, 1, v15))
  {
    sub_25E9F7BF4(0);
    memcpy(__dst, v14, *(void *)(*(void *)(v18 - 8) + 64));
  }
  else
  {
    uint64_t v19 = sub_25EA35ED0();
    (*(void (**)(char *, const void *, uint64_t))(*(void *)(v19 - 8) + 16))(__dst, v14, v19);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(__dst, 0, 1, v15);
  }
  *(void *)((char *)v8 + *(int *)(v12 + 28)) = *(void *)(v9 + *(int *)(v12 + 28));
  swift_retain();
  return a1;
}

uint64_t *assignWithCopy for DependencyEnvironment(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  sub_25E9EF22C(a1, a2);
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  *(uint64_t *)((char *)a1 + v6) = *(uint64_t *)((char *)a2 + v6);
  swift_retain();
  swift_release();
  *((void *)v7 + 1) = *((void *)v8 + 1);
  uint64_t v21 = type metadata accessor for Dependencies();
  uint64_t v9 = *(int *)(v21 + 24);
  uint64_t v10 = &v7[v9];
  uint64_t v11 = &v8[v9];
  uint64_t v12 = type metadata accessor for ScopeGraphElement.ID(0);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  int v15 = v14(v10, 1, v12);
  int v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (!v16)
    {
      uint64_t v20 = sub_25EA35ED0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 24))(v10, v11, v20);
      goto LABEL_7;
    }
    sub_25E9EFC74((uint64_t)v10);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    sub_25E9F7BF4(0);
    memcpy(v10, v11, *(void *)(*(void *)(v18 - 8) + 64));
    goto LABEL_7;
  }
  uint64_t v17 = sub_25EA35ED0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16))(v10, v11, v17);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
LABEL_7:
  *(void *)&v7[*(int *)(v21 + 28)] = *(void *)&v8[*(int *)(v21 + 28)];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for DependencyEnvironment(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (void *)(a1 + v5);
  uint64_t v7 = a2 + v5;
  uint64_t v8 = *(void *)(a2 + v5 + 8);
  *uint64_t v6 = *(void *)(a2 + v5);
  v6[1] = v8;
  uint64_t v9 = type metadata accessor for Dependencies();
  uint64_t v10 = *(int *)(v9 + 24);
  uint64_t v11 = (char *)v6 + v10;
  uint64_t v12 = (const void *)(v7 + v10);
  uint64_t v13 = type metadata accessor for ScopeGraphElement.ID(0);
  uint64_t v14 = *(void *)(v13 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
  {
    sub_25E9F7BF4(0);
    memcpy(v11, v12, *(void *)(*(void *)(v15 - 8) + 64));
  }
  else
  {
    uint64_t v16 = sub_25EA35ED0();
    (*(void (**)(char *, const void *, uint64_t))(*(void *)(v16 - 8) + 32))(v11, v12, v16);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
  }
  *(void *)((char *)v6 + *(int *)(v9 + 28)) = *(void *)(v7 + *(int *)(v9 + 28));
  return a1;
}

uint64_t assignWithTake for DependencyEnvironment(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25E9EF02C(a1);
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  swift_release();
  *(void *)(v8 + 8) = *(void *)(v9 + 8);
  uint64_t v22 = type metadata accessor for Dependencies();
  uint64_t v10 = *(int *)(v22 + 24);
  uint64_t v11 = (void *)(v8 + v10);
  uint64_t v12 = (void *)(v9 + v10);
  uint64_t v13 = type metadata accessor for ScopeGraphElement.ID(0);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v14 + 48);
  int v16 = v15(v11, 1, v13);
  int v17 = v15(v12, 1, v13);
  if (!v16)
  {
    if (!v17)
    {
      uint64_t v21 = sub_25EA35ED0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v21 - 8) + 40))(v11, v12, v21);
      goto LABEL_7;
    }
    sub_25E9EFC74((uint64_t)v11);
    goto LABEL_6;
  }
  if (v17)
  {
LABEL_6:
    sub_25E9F7BF4(0);
    memcpy(v11, v12, *(void *)(*(void *)(v19 - 8) + 64));
    goto LABEL_7;
  }
  uint64_t v18 = sub_25EA35ED0();
  (*(void (**)(void *, void *, uint64_t))(*(void *)(v18 - 8) + 32))(v11, v12, v18);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
LABEL_7:
  *(void *)(v8 + *(int *)(v22 + 28)) = *(void *)(v9 + *(int *)(v22 + 28));
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for DependencyEnvironment(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25E9FCA34);
}

uint64_t sub_25E9FCA34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for Dependencies();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for DependencyEnvironment(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25E9FCAF8);
}

uint64_t sub_25E9FCAF8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for Dependencies();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_25E9FCBA0()
{
  uint64_t result = type metadata accessor for Dependencies();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_25E9FCC3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = a3;
  v8[3] = a4;
  v8[4] = a1;
  v8[5] = a2;
  swift_retain();
  sub_25EA36230();
  swift_getFunctionTypeMetadataGlobalActor();
  return sub_25EA36130();
}

uint64_t sub_25E9FCCF4(uint64_t a1)
{
  return sub_25E9FCC3C(*v1, v1[1], *(void *)(a1 + 16), *(void *)(a1 + 24));
}

uint64_t sub_25E9FCD04(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t sub_25E9FCD2C(uint64_t a1, uint64_t a2)
{
  return sub_25E9FCD04(a1, a2, *v2);
}

uint64_t sub_25E9FCD48()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_25E9FCD80()
{
  return (*(uint64_t (**)(void))(v0 + 32))();
}

uint64_t sub_25E9FCDA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

void *sub_25E9FCDB0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t sub_25E9FCDE0()
{
  return swift_release();
}

void *sub_25E9FCDE8(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for KeyedDependencyContainer(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *sub_25E9FCE30(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for KeyedDependencyContainer(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for KeyedDependencyContainer(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
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
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for MutatingFunction()
{
  return sub_25E9ED2B4();
}

uint64_t sub_25E9FCF04@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_25E9FD284(a1, a2);
}

uint64_t sub_25E9FCF0C()
{
  return 0x3D646E616D6D6F43;
}

uint64_t sub_25E9FCFD8(uint64_t a1, uint64_t a2)
{
  sub_25E9F01A0(v2, (uint64_t)v7);
  if (!v8) {
    return sub_25E9FD128((uint64_t)v7);
  }
  sub_25E9FD1DC();
  swift_getExtendedExistentialTypeMetadata();
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    if (v10)
    {
      sub_25E9F9FD0(&v9, (uint64_t)v11);
      uint64_t v5 = v12;
      uint64_t v6 = v13;
      sub_25E9FD234((uint64_t)v11, v12);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 24))(a2, v5, v6);
      return sub_25E9EF02C((uint64_t)v11);
    }
  }
  return result;
}

uint64_t sub_25E9FD110(uint64_t a1, uint64_t a2)
{
  return sub_25E9FCFD8(a1, a2);
}

uint64_t sub_25E9FD128(uint64_t a1)
{
  sub_25E9FD184();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_25E9FD184()
{
  if (!qword_26A7278A0[0])
  {
    sub_25E9FD1DC();
    unint64_t v0 = sub_25EA362E0();
    if (!v1) {
      atomic_store(v0, qword_26A7278A0);
    }
  }
}

unint64_t sub_25E9FD1DC()
{
  unint64_t result = qword_26A727778;
  if (!qword_26A727778)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_26A727778);
  }
  return result;
}

uint64_t sub_25E9FD234(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_25E9FD284(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ScopeGraphElement.ID(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25E9FD2E8()
{
  uint64_t result = sub_25EA35ED0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_25E9FD374(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25E9FD388);
}

uint64_t sub_25E9FD388(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ScopeGraphElement.ID(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t sub_25E9FD3F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25E9FD408);
}

uint64_t sub_25E9FD408(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ScopeGraphElement.ID(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for CommandHandlingRuleUpdate()
{
  return sub_25E9ED2B4();
}

uint64_t sub_25E9FD490(uint64_t a1, uint64_t a2)
{
  sub_25EA36220();
  swift_release();
  swift_task_getMainExecutor();
  if (swift_task_isCurrentExecutor())
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = a1;
    *(void *)(v5 + 24) = a2;
    uint64_t v6 = v5;
    sub_25E9FF664(v9);
    if (v2)
    {
      swift_release();
      return v6;
    }
    uint64_t v6 = v9[0];
    char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    if ((isEscapingClosureAtFileLocation & 1) == 0) {
      return v6;
    }
    __break(1u);
  }
  v9[0] = 0;
  v9[1] = 0xE000000000000000;
  sub_25EA36370();
  sub_25EA36150();
  sub_25EA365C0();
  sub_25EA36150();
  swift_bridgeObjectRelease();
  sub_25EA36150();
  uint64_t result = sub_25EA36420();
  __break(1u);
  return result;
}

uint64_t sub_25E9FD628(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_25EA36220();
  swift_release();
  swift_task_getMainExecutor();
  if (swift_task_isCurrentExecutor())
  {
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = a1;
    *(void *)(v8 + 24) = a2;
    sub_25E9FF610(v11);
    if (v4)
    {
      swift_release();
      return a4;
    }
    a4 = LOBYTE(v11[0]);
    char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    if ((isEscapingClosureAtFileLocation & 1) == 0) {
      return a4;
    }
    __break(1u);
  }
  v11[0] = 0;
  v11[1] = 0xE000000000000000;
  sub_25EA36370();
  sub_25EA36150();
  sub_25EA365C0();
  sub_25EA36150();
  swift_bridgeObjectRelease();
  sub_25EA36150();
  uint64_t result = sub_25EA36420();
  __break(1u);
  return result;
}

uint64_t sub_25E9FD7B8(uint64_t a1, uint64_t a2)
{
  sub_25EA36220();
  swift_release();
  swift_task_getMainExecutor();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    goto LABEL_6;
  }
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  sub_25E9FF6B8();
  if (v2) {
    return swift_release();
  }
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation)
  {
    __break(1u);
LABEL_6:
    sub_25EA36370();
    sub_25EA36150();
    sub_25EA365C0();
    sub_25EA36150();
    swift_bridgeObjectRelease();
    sub_25EA36150();
    uint64_t result = sub_25EA36420();
    __break(1u);
  }
  return result;
}

uint64_t sub_25E9FD944()
{
  sub_25E9FF3E0(*(void *)(v0 + 16));
  swift_unknownObjectRelease();
  return v0;
}

uint64_t sub_25E9FD974()
{
  uint64_t v0 = sub_25E9FD944();
  return MEMORY[0x270FA0228](v0, 64, 7);
}

double sub_25E9FD9A4()
{
  uint64_t v0 = (_OWORD *)swift_allocObject();
  double result = 0.0;
  v0[1] = 0u;
  v0[2] = 0u;
  v0[3] = 0u;
  return result;
}

uint64_t sub_25E9FD9D4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25EA35F10();
  *a1 = result;
  return result;
}

uint64_t sub_25E9FDA24@<X0>(uint64_t a1@<X8>)
{
  long long v3 = v1[1];
  long long v5 = *v1;
  v6[0] = v3;
  *(_OWORD *)((char *)v6 + 9) = *(long long *)((char *)v1 + 25);
  sub_25E9ECFA4((uint64_t)&v5, (void (*)(void, void, void, void, void, void))sub_25E9EC854);
  sub_25E9ECC1C(a1);
  return sub_25E9ECFA4((uint64_t)&v5, (void (*)(void, void, void, void, void, void))sub_25E9EC670);
}

uint64_t sub_25E9FDAA0()
{
  return sub_25EA35F30();
}

uint64_t sub_25E9FDB14()
{
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v2 = *(void *)(v0 + 56);
  uint64_t v3 = *(unsigned __int8 *)(v0 + 64);
  uint64_t v4 = type metadata accessor for Truth.Storage();
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270EFF108](v1, v2, v3, v4, WitnessTable);
}

double Truth.init(_:)@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = *a1;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = *(void *)(*MEMORY[0x263F8EA20] + v6 + 8);
  *(void *)(v8 + 24) = a2;
  uint64_t v9 = sub_25E9FDAA0();
  *(void *)a3 = KeyPath;
  double result = 0.0;
  *(_OWORD *)(a3 + 8) = 0u;
  *(_OWORD *)(a3 + 24) = 0u;
  *(unsigned char *)(a3 + 40) = 0;
  *(void *)(a3 + 48) = v9;
  *(void *)(a3 + 56) = v11;
  *(unsigned char *)(a3 + 64) = v12 & 1;
  *(void *)(a3 + 72) = a1;
  return result;
}

uint64_t sub_25E9FDC78()
{
  return swift_deallocObject();
}

double sub_25E9FDC88()
{
  type metadata accessor for Truth.Storage();
  uint64_t v0 = (_OWORD *)swift_allocObject();
  double result = 0.0;
  v0[1] = 0u;
  v0[2] = 0u;
  v0[3] = 0u;
  return result;
}

uint64_t Truth.wrappedValue.getter()
{
  uint64_t v0 = *(void *)(sub_25E9FDB14() + 56);
  swift_unknownObjectRetain();
  swift_release();
  if (v0) {
    return v0;
  }
  uint64_t result = sub_25EA36420();
  __break(1u);
  return result;
}

uint64_t Truth.projectedValue.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = Truth.wrappedValue.getter();
  *a1 = result;
  return result;
}

uint64_t Truth.Wrapper.subscript.getter(uint64_t *a1, uint64_t a2)
{
  uint64_t v5 = *a1;
  uint64_t v6 = *v2;
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  uint64_t v8 = *(void *)(a2 + 24);
  v7[4] = v8;
  v7[5] = v6;
  v7[6] = a1;
  uint64_t v9 = (void *)swift_allocObject();
  void v9[2] = 0;
  v9[3] = 0;
  v9[4] = v8;
  v9[5] = v6;
  v9[6] = a1;
  uint64_t v10 = *(void *)(*MEMORY[0x263F8E100] + v5 + 8);
  swift_unknownObjectRetain_n();
  swift_retain_n();
  return MEMORY[0x270F04B80](sub_25E9FDFF8, v7, sub_25E9FE164, v9, v10);
}

uint64_t sub_25E9FDF18@<X0>(uint64_t a1@<X2>, uint64_t *a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v4 = *a2;
  uint64_t v8 = a1;
  swift_unknownObjectRetain();
  uint64_t v5 = (void (*)(unsigned char *, void))swift_readAtKeyPath();
  (*(void (**)(uint64_t))(*(void *)(*(void *)(*MEMORY[0x263F8E100] + v4 + 8) - 8) + 16))(a3);
  v5(v7, 0);
  return swift_unknownObjectRelease();
}

uint64_t sub_25E9FDFF8@<X0>(uint64_t a1@<X8>)
{
  return sub_25E9FDF18(*(void *)(v1 + 40), *(uint64_t **)(v1 + 48), a1);
}

uint64_t sub_25E9FE008(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *))(v6 + 16))((char *)v8 - v5);
  v8[1] = a4;
  swift_unknownObjectRetain();
  swift_setAtReferenceWritableKeyPath();
  return swift_unknownObjectRelease();
}

uint64_t sub_25E9FE11C()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_25E9FE164(uint64_t a1)
{
  return sub_25E9FE008(a1, v1[2], v1[3], v1[5]);
}

Swift::Void __swiftcall Truth.update()()
{
  uint64_t v2 = v0;
  sub_25E9FE3A0();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = &v24[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  long long v6 = v1[3];
  long long v27 = v1[2];
  long long v28 = v6;
  long long v29 = v1[4];
  long long v7 = v1[1];
  long long v25 = *v1;
  long long v26 = v7;
  if (objc_msgSend(self, sel_isMainThread))
  {
    sub_25EA36230();
    long long v8 = v1[2];
    long long v9 = v1[4];
    v30[3] = v1[3];
    v30[4] = v9;
    long long v10 = *v1;
    v30[1] = v1[1];
    v30[2] = v8;
    v30[0] = v10;
    uint64_t v11 = (_OWORD *)swift_allocObject();
    long long v12 = *(_OWORD *)(v2 + 16);
    long long v13 = v1[2];
    long long v14 = v1[3];
    long long v15 = *v1;
    v11[3] = v1[1];
    v11[4] = v13;
    long long v16 = v1[4];
    v11[5] = v14;
    v11[6] = v16;
    v11[1] = v12;
    void v11[2] = v15;
    uint64_t v17 = sub_25E9FE9D4((uint64_t)v30);
    MEMORY[0x270FA5388](v17);
    *(void *)&v24[-16] = sub_25E9FF738;
    *(void *)&v24[-8] = v11;
    sub_25E9FD7B8((uint64_t)sub_25E9FEA48, (uint64_t)&v24[-32]);
  }
  else
  {
    uint64_t v18 = sub_25EA36250();
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v5, 1, 1, v18);
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = 0;
    *(void *)(v19 + 24) = 0;
    long long v20 = v27;
    long long v21 = v28;
    long long v22 = v25;
    *(_OWORD *)(v19 + 64) = v26;
    *(_OWORD *)(v19 + 80) = v20;
    long long v23 = v29;
    *(_OWORD *)(v19 + 96) = v21;
    *(_OWORD *)(v19 + 112) = v23;
    *(_OWORD *)(v19 + 32) = *(_OWORD *)(v2 + 16);
    *(_OWORD *)(v19 + 48) = v22;
    sub_25E9FE9D4((uint64_t)&v25);
    sub_25E9FE81C((uint64_t)v5, (uint64_t)&unk_26A727938, v19);
  }
  swift_release();
}

void sub_25E9FE3A0()
{
  if (!qword_26A727928)
  {
    sub_25EA36250();
    unint64_t v0 = sub_25EA362E0();
    if (!v1) {
      atomic_store(v0, &qword_26A727928);
    }
  }
}

uint64_t sub_25E9FE3F8(uint64_t a1)
{
  uint64_t result = sub_25E9FEA70();
  if (result) {
    return sub_25E9FEBF0(a1);
  }
  return result;
}

uint64_t sub_25E9FE4AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[4] = a5;
  v6[5] = a6;
  _OWORD v6[2] = a1;
  v6[3] = a4;
  return MEMORY[0x270FA2498](sub_25E9FE4D0, 0, 0);
}

uint64_t sub_25E9FE4D0()
{
  sub_25EA36230();
  *(void *)(v0 + 48) = sub_25EA36220();
  uint64_t v2 = sub_25EA36210();
  return MEMORY[0x270FA2498](sub_25E9FE564, v2, v1);
}

uint64_t sub_25E9FE564()
{
  swift_release();
  uint64_t v1 = type metadata accessor for Truth();
  sub_25E9FE3F8(v1);
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_25E9FE600()
{
  swift_unknownObjectRelease();
  sub_25E9EC670(*(void *)(v0 + 48), *(void *)(v0 + 56), *(void *)(v0 + 64), *(void *)(v0 + 72), *(void *)(v0 + 80), *(unsigned char *)(v0 + 88));
  sub_25E9FE660();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_25E9FE660()
{
  return swift_release();
}

uint64_t sub_25E9FE668(uint64_t a1)
{
  uint64_t v4 = swift_task_alloc();
  long long v5 = *(_OWORD *)(v1 + 32);
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + 8) = sub_25E9FE728;
  *(_OWORD *)(v4 + 32) = v5;
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = v1 + 48;
  return MEMORY[0x270FA2498](sub_25E9FE4D0, 0, 0);
}

uint64_t sub_25E9FE728()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_25E9FE81C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25EA36250();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_25EA36240();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_25E9FF7D8(a1, (uint64_t (*)(void))sub_25E9FE3A0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_25EA36210();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_25E9FE9D4(uint64_t a1)
{
  return a1;
}

uint64_t sub_25E9FEA40()
{
  return swift_retain();
}

uint64_t sub_25E9FEA48()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

BOOL sub_25E9FEA70()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  uint64_t v4 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v5 = v0[4];
  char v6 = *((unsigned char *)v0 + 40);
  uint64_t v7 = v0[6];
  uint64_t v8 = v0[7];
  char v9 = *((unsigned char *)v0 + 64);
  uint64_t v10 = v0[9];
  uint64_t v25 = *v0;
  *(void *)&long long v26 = v2;
  *((void *)&v26 + 1) = v4;
  *(void *)&long long v27 = v3;
  *((void *)&v27 + 1) = v5;
  LOBYTE(v28) = v6;
  *((void *)&v28 + 1) = v7;
  *(void *)&long long v29 = v8;
  char v20 = v9;
  BYTE8(v29) = v9;
  uint64_t v19 = v10;
  uint64_t v30 = v10;
  uint64_t v11 = sub_25E9FDB14();
  uint64_t v12 = *(void *)(v11 + 16);
  uint64_t v21 = *(void *)(v11 + 48);
  sub_25E9FF788(v12);
  swift_release();
  if (!v12) {
    return 1;
  }
  uint64_t v25 = v1;
  *(void *)&long long v26 = v2;
  *((void *)&v26 + 1) = v4;
  *(void *)&long long v27 = v3;
  *((void *)&v27 + 1) = v5;
  LOBYTE(v28) = v6;
  *((void *)&v28 + 1) = v7;
  *(void *)&long long v29 = v8;
  BYTE8(v29) = v20;
  uint64_t v30 = v19;
  sub_25E9FDA24((uint64_t)v24);
  uint64_t v13 = v24[4];
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v14 = *(void *)(v12 + 128);
  uint64_t v25 = *(void *)(v12 + 56);
  long long v15 = *(_OWORD *)(v12 + 80);
  long long v26 = *(_OWORD *)(v12 + 64);
  long long v27 = v15;
  long long v16 = *(_OWORD *)(v12 + 112);
  long long v28 = *(_OWORD *)(v12 + 96);
  long long v29 = v16;
  uint64_t v30 = v14;
  uint64_t v22 = v13;
  uint64_t v23 = v21;
  char v17 = sub_25E9F013C(&v23, &v22);
  sub_25E9FF3E0(v12);
  return (v17 & 1) == 0;
}

uint64_t sub_25E9FEBF0(uint64_t a1)
{
  uint64_t v30 = type metadata accessor for Dependencies();
  MEMORY[0x270FA5388](v30);
  char v33 = (uint64_t *)((char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v4 = *(void *)(v1 + 8);
  uint64_t v35 = *(void *)v1;
  uint64_t v34 = v4;
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t v40 = *(void *)(v1 + 32);
  int v39 = *(unsigned __int8 *)(v1 + 40);
  uint64_t v7 = *(void *)(v1 + 56);
  uint64_t v38 = *(void *)(v1 + 48);
  uint64_t v37 = v7;
  int v36 = *(unsigned __int8 *)(v1 + 64);
  uint64_t v8 = *(void *)(v1 + 72);
  uint64_t v46 = v35;
  uint64_t v47 = v4;
  uint64_t v48 = v5;
  uint64_t v49 = v6;
  uint64_t v9 = v5;
  uint64_t v29 = v5;
  uint64_t v10 = v6;
  uint64_t v28 = v6;
  uint64_t v50 = v40;
  char v51 = v39;
  uint64_t v52 = v38;
  uint64_t v53 = v7;
  char v54 = v36;
  uint64_t v55 = v8;
  sub_25E9FDA24((uint64_t)v56);
  uint64_t v42 = v56[0];
  uint64_t v43 = v56[1];
  uint64_t v44 = v56[2];
  long long v31 = v57;
  long long v45 = v57;
  uint64_t v46 = 0;
  uint64_t v47 = 0xE000000000000000;
  sub_25EA365C0();
  sub_25EA36150();
  swift_bridgeObjectRelease();
  sub_25EA36150();
  uint64_t v27 = v8;
  uint64_t v41 = v8;
  uint64_t v32 = a1;
  sub_25EA365B0();
  sub_25EA364A0();
  Scope.subscope(tag:)(v46, v47, &v46);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v11 = v46;
  uint64_t v12 = v47;
  uint64_t v13 = v49;
  uint64_t v26 = v48;
  uint64_t v14 = v50;
  uint64_t v46 = v35;
  uint64_t v47 = v34;
  uint64_t v48 = v9;
  uint64_t v49 = v10;
  uint64_t v50 = v40;
  char v51 = v39;
  uint64_t v52 = v38;
  uint64_t v53 = v37;
  char v54 = v36;
  uint64_t v55 = v8;
  long long v15 = (void *)sub_25E9FDB14();
  uint64_t v16 = v15[2];
  uint64_t v15[2] = v11;
  v15[3] = v12;
  v15[4] = v26;
  v15[5] = v13;
  *(void *)&long long v31 = v13;
  v15[6] = v14;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_25E9FF3E0(v16);
  swift_release();
  uint64_t v17 = v30;
  uint64_t v18 = v33;
  uint64_t v19 = (char *)v33 + *(int *)(v30 + 24);
  uint64_t v20 = type metadata accessor for ScopeGraphElement.ID(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v19, 1, 1, v20);
  uint64_t v21 = *(int *)(v17 + 28);
  type metadata accessor for Dependencies.AmbiguousResolutionContext();
  uint64_t v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = 0u;
  *(_OWORD *)(v22 + 32) = 0u;
  *(void *)(v22 + 48) = 0;
  *(uint64_t *)((char *)v18 + v21) = v22;
  *uint64_t v18 = v11;
  v18[1] = v14;
  uint64_t v46 = v35;
  uint64_t v47 = v34;
  uint64_t v48 = v29;
  uint64_t v49 = v28;
  uint64_t v50 = v40;
  char v51 = v39;
  uint64_t v52 = v38;
  uint64_t v53 = v37;
  char v54 = v36;
  uint64_t v55 = v27;
  swift_retain();
  uint64_t v23 = sub_25E9FDB14();
  swift_getAtKeyPath();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  sub_25E9FF7D8((uint64_t)v18, (uint64_t (*)(void))type metadata accessor for Dependencies);
  *(void *)(v23 + 56) = v46;
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_25E9FF030(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return MEMORY[0x270EFFE88](a1, a2, a3, a4, a6, a5);
}

uint64_t sub_25E9FF048(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

uint64_t sub_25E9FF050(uint64_t a1)
{
  sub_25E9EC670(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  sub_25E9FE660();
  return swift_release();
}

uint64_t sub_25E9FF0A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  uint64_t v8 = *(void *)(a2 + 32);
  char v9 = *(unsigned char *)(a2 + 40);
  sub_25E9EC854(*(void *)a2, v5, v6, v7, v8, v9);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = v8;
  *(unsigned char *)(a1 + 40) = v9;
  uint64_t v10 = *(void *)(a2 + 48);
  uint64_t v11 = *(void *)(a2 + 56);
  LOBYTE(v6) = *(unsigned char *)(a2 + 64);
  sub_25E9FEA40();
  *(void *)(a1 + 48) = v10;
  *(void *)(a1 + 56) = v11;
  *(unsigned char *)(a1 + 64) = v6;
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_retain();
  return a1;
}

uint64_t sub_25E9FF14C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  uint64_t v8 = *(void *)(a2 + 32);
  char v9 = *(unsigned char *)(a2 + 40);
  sub_25E9EC854(*(void *)a2, v5, v6, v7, v8, v9);
  uint64_t v10 = *(void *)a1;
  uint64_t v11 = *(void *)(a1 + 8);
  uint64_t v12 = *(void *)(a1 + 16);
  uint64_t v13 = *(void *)(a1 + 24);
  uint64_t v14 = *(void *)(a1 + 32);
  char v15 = *(unsigned char *)(a1 + 40);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = v8;
  *(unsigned char *)(a1 + 40) = v9;
  sub_25E9EC670(v10, v11, v12, v13, v14, v15);
  uint64_t v16 = *(void *)(a2 + 48);
  uint64_t v17 = *(void *)(a2 + 56);
  LOBYTE(v6) = *(unsigned char *)(a2 + 64);
  sub_25E9FEA40();
  *(void *)(a1 + 48) = v16;
  *(void *)(a1 + 56) = v17;
  *(unsigned char *)(a1 + 64) = v6;
  sub_25E9FE660();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_25E9FF220(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  char v5 = *(unsigned char *)(a2 + 40);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v8 = *(void *)(a1 + 16);
  uint64_t v9 = *(void *)(a1 + 24);
  uint64_t v10 = *(void *)(a1 + 32);
  char v11 = *(unsigned char *)(a1 + 40);
  long long v12 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v12;
  *(void *)(a1 + 32) = v4;
  *(unsigned char *)(a1 + 40) = v5;
  sub_25E9EC670(v6, v7, v8, v9, v10, v11);
  char v13 = *(unsigned char *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 64) = v13;
  sub_25E9FE660();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_release();
  return a1;
}

uint64_t sub_25E9FF2A0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 80)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 72);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_25E9FF2E8(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 80) = 1;
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
      *(void *)(result + 72) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 80) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for Truth()
{
  return sub_25E9ED2B4();
}

uint64_t sub_25E9FF358()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for Truth.Storage()
{
  return sub_25E9ED2B4();
}

uint64_t type metadata accessor for Truth.Wrapper()
{
  return sub_25E9ED2B4();
}

uint64_t sub_25E9FF3D4()
{
  return MEMORY[0x263EFDDD8];
}

uint64_t sub_25E9FF3E0(uint64_t result)
{
  if (result)
  {
    swift_release();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25E9FF42C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_25E9FF508;
  return v6(a1);
}

uint64_t sub_25E9FF508()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_25E9FF600()
{
  return swift_deallocObject();
}

void *sub_25E9FF610@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = (*(void *(**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  if (!v2) {
    *a1 = v5;
  }
  return result;
}

uint64_t sub_25E9FF654()
{
  return swift_deallocObject();
}

void *sub_25E9FF664@<X0>(void *a1@<X8>)
{
  uint64_t result = (*(void *(**)(void *__return_ptr))(v1 + 16))(v6);
  if (!v2)
  {
    uint64_t v5 = v6[1];
    *a1 = v6[0];
    a1[1] = v5;
  }
  return result;
}

uint64_t sub_25E9FF6A8()
{
  return swift_deallocObject();
}

uint64_t sub_25E9FF6B8()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_25E9FF6E0()
{
  sub_25E9EC670(*(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56), *(void *)(v0 + 64), *(unsigned char *)(v0 + 72));
  sub_25E9FE660();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_25E9FF738()
{
  uint64_t v0 = type metadata accessor for Truth();
  return sub_25E9FE3F8(v0);
}

uint64_t sub_25E9FF788(uint64_t result)
{
  if (result)
  {
    swift_bridgeObjectRetain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_25E9FF7D8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25E9FF838()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_25E9FF870(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_25E9FE728;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26A727AC0 + dword_26A727AC0);
  return v6(a1, v4);
}

uint64_t ClosureValueConverter.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

uint64_t ClosureValueConverter.convert(value:)()
{
  return (*v0)();
}

uint64_t dispatch thunk of ValueConverter.convert(value:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t type metadata accessor for ClosureValueConverter()
{
  return sub_25E9ED2B4();
}

uint64_t dispatch thunk of CommandHandler.handle(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of Source.state.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_25E9FF9CC()
{
  return swift_getWitnessTable();
}

uint64_t Scope.register<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(v3 + 32);
  return sub_25EA230B0(a2, &v5, a2, a3);
}

{
  return sub_25EA01094(a1, a2, a3, sub_25EA2334C);
}

{
  return sub_25EA01094(a1, a2, a3, sub_25EA23364);
}

BOOL static Scope.ID.== infix(_:_:)(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_25E9FFA44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(void *)(a1 + 24))
  {
    sub_25E9F9FD0((long long *)a1, (uint64_t)v11);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v10 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    sub_25EA0507C(v11, a2, a3, a4, isUniquelyReferenced_nonNull_native);
    *uint64_t v4 = v10;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_25EA067A8(a1, &qword_26A7276E0, &qword_26A7276E8, (uint64_t)&protocol descriptor for GraphUpdate);
    sub_25E9F79EC(a4, (uint64_t)v11);
    swift_bridgeObjectRelease();
    return sub_25EA067A8((uint64_t)v11, &qword_26A7276E0, &qword_26A7276E8, (uint64_t)&protocol descriptor for GraphUpdate);
  }
}

uint64_t sub_25E9FFB50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  sub_25E9F7BF4(0);
  MEMORY[0x270FA5388](v10 - 8);
  long long v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for ScopeGraphElement.ID(0);
  MEMORY[0x270FA5388](v13);
  char v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v16 + 48))(a1, 1) == 1)
  {
    sub_25EA068DC(a1, (uint64_t (*)(void))sub_25E9F7BF4);
    sub_25E9F7C28(a2, a3, a4, (uint64_t)v12);
    swift_bridgeObjectRelease();
    return sub_25EA068DC((uint64_t)v12, (uint64_t (*)(void))sub_25E9F7BF4);
  }
  else
  {
    sub_25EA060DC(a1, (uint64_t)v15, type metadata accessor for ScopeGraphElement.ID);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v20 = *v5;
    *uint64_t v5 = 0x8000000000000000;
    sub_25EA053B8((uint64_t)v15, a2, a3, a4, isUniquelyReferenced_nonNull_native);
    *uint64_t v5 = v20;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_25E9FFD3C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  sub_25E9F0484(0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25E9F04B8(0);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v12 + 48))(a1, 1) == 1)
  {
    sub_25EA068DC(a1, (uint64_t (*)(void))sub_25E9F0484);
    sub_25E9F7A2C(a2, (uint64_t)v8);
    sub_25EA068DC(a2, type metadata accessor for ScopeGraphElement.ID);
    uint64_t v13 = (uint64_t)v8;
    uint64_t v14 = (uint64_t (*)(void))sub_25E9F0484;
  }
  else
  {
    sub_25EA060DC(a1, (uint64_t)v11, (uint64_t (*)(void))sub_25E9F04B8);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v18 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_25EA0520C((uint64_t)v11, a2, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v18;
    swift_bridgeObjectRelease();
    uint64_t v14 = type metadata accessor for ScopeGraphElement.ID;
    uint64_t v13 = a2;
  }
  return sub_25EA068DC(v13, v14);
}

unint64_t sub_25E9FFF28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v14 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_25EA05540(a1, a2, a3, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v14;
  }
  else
  {
    unint64_t result = sub_25EA024DC(a3);
    if ((v10 & 1) == 0) {
      return result;
    }
    unint64_t v11 = result;
    int v12 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v13 = *v3;
    uint64_t v15 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    if (!v12)
    {
      sub_25EA03584();
      uint64_t v13 = v15;
    }
    sub_25EA04654(v11, v13);
    *uint64_t v4 = v13;
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_25EA00020(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(void *)(a1 + 24))
  {
    sub_25E9F9FD0((long long *)a1, (uint64_t)v11);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v10 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    sub_25EA05CC4(v11, a2, a3, a4, isUniquelyReferenced_nonNull_native);
    *uint64_t v4 = v10;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_25EA067A8(a1, (unint64_t *)&qword_26A727BD8, (unint64_t *)&qword_26A727BC8, (uint64_t)&protocol descriptor for RegisteredDependency);
    sub_25E9F7ECC(a4, (uint64_t)v11);
    swift_bridgeObjectRelease();
    return sub_25EA067A8((uint64_t)v11, (unint64_t *)&qword_26A727BD8, (unint64_t *)&qword_26A727BC8, (uint64_t)&protocol descriptor for RegisteredDependency);
  }
}

uint64_t sub_25EA0012C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  if (*(void *)(a1 + 24))
  {
    sub_25E9F9FD0((long long *)a1, (uint64_t)v14);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v12 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    sub_25EA05E54(v14, a2, isUniquelyReferenced_nonNull_native);
    *uint64_t v2 = v12;
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_25EA067A8(a1, (unint64_t *)&qword_26A727BD8, (unint64_t *)&qword_26A727BC8, (uint64_t)&protocol descriptor for RegisteredDependency);
    unint64_t v7 = sub_25EA025FC(a2);
    if (v8)
    {
      unint64_t v9 = v7;
      char v10 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v11 = *v2;
      uint64_t v13 = *v3;
      *uint64_t v3 = 0x8000000000000000;
      if ((v10 & 1) == 0)
      {
        sub_25EA03CE8();
        uint64_t v11 = v13;
      }
      sub_25E9F9FD0((long long *)(*(void *)(v11 + 56) + 40 * v9), (uint64_t)v14);
      sub_25EA04ED0(v9, v11);
      *uint64_t v3 = v11;
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v15 = 0;
      memset(v14, 0, sizeof(v14));
    }
    return sub_25EA067A8((uint64_t)v14, (unint64_t *)&qword_26A727BD8, (unint64_t *)&qword_26A727BC8, (uint64_t)&protocol descriptor for RegisteredDependency);
  }
}

void Scope.subscope(tag:)(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v7 = *v3;
  uint64_t v8 = v3[4];
  uint64_t v9 = qword_26A7274C8;
  swift_retain_n();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v9 != -1) {
    swift_once();
  }
  char v10 = (void *)(qword_26A727B50 + 16);
  uint64_t v11 = (os_unfair_lock_s *)(qword_26A727B50 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(qword_26A727B50 + 24));
  sub_25EA019E8(v10, v25);
  os_unfair_lock_unlock(v11);
  uint64_t v12 = v25[0];
  swift_bridgeObjectRelease();
  swift_release();
  swift_beginAccess();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v24 = *(void *)(v7 + 104);
  *(void *)(v7 + 104) = 0x8000000000000000;
  sub_25EA05670(v8, v12, isUniquelyReferenced_nonNull_native);
  *(void *)(v7 + 104) = v24;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25E9FFF28(a1, a2, v12);
  swift_endAccess();
  type metadata accessor for StorageHandle();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v7;
  *(void *)(v14 + 24) = v12;
  if (qword_26A7274C0 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_25EA35F00();
  sub_25E9EBF30(v15, (uint64_t)qword_26A728BC0);
  swift_retain_n();
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v16 = sub_25EA35EE0();
  os_log_type_t v17 = sub_25EA362B0();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    v25[0] = v23;
    *(_DWORD *)uint64_t v18 = 136315394;
    sub_25E9FAE44();
    uint64_t v19 = sub_25EA36310();
    sub_25EA01DA0(v19, v20, v25);
    sub_25EA362F0();
    swift_bridgeObjectRelease_n();
    swift_release_n();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 12) = 2080;
    uint64_t v21 = sub_25EA36310();
    sub_25EA01DA0(v21, v22, v25);
    sub_25EA362F0();
    swift_bridgeObjectRelease_n();
    swift_release_n();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25E9E9000, v16, v17, "Prepared new subscope. ID=%s, Parent=%s", (uint8_t *)v18, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2611E7A60](v23, -1, -1);
    MEMORY[0x2611E7A60](v18, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release_n();
    swift_bridgeObjectRelease_n();
    swift_release_n();
    swift_release_n();
  }
  *a3 = v7;
  a3[1] = v14;
  a3[2] = a1;
  a3[3] = a2;
  a3[4] = v12;
}

uint64_t Scope.dependenciesContainer.getter@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[4];
  uint64_t v5 = type metadata accessor for Dependencies();
  uint64_t v6 = (char *)a1 + *(int *)(v5 + 24);
  uint64_t v7 = type metadata accessor for ScopeGraphElement.ID(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = *(int *)(v5 + 28);
  type metadata accessor for Dependencies.AmbiguousResolutionContext();
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = 0u;
  *(_OWORD *)(v9 + 32) = 0u;
  *(void *)(v9 + 48) = 0;
  *(void *)((char *)a1 + v8) = v9;
  *a1 = v3;
  a1[1] = v4;
  return swift_retain();
}

void Scope.id.getter(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 32);
}

double static Scope.root(dependencyContainer:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (qword_26A7274C8 != -1) {
    swift_once();
  }
  uint64_t v4 = qword_26A727B50 + 16;
  uint64_t v5 = (os_unfair_lock_s *)(qword_26A727B50 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(qword_26A727B50 + 24));
  sub_25EA019E8((void *)v4, v18);
  os_unfair_lock_unlock(v5);
  uint64_t v6 = *(void *)&v18[0];
  sub_25E9EFBCC(a1, (uint64_t)v18);
  type metadata accessor for Storage();
  uint64_t v7 = (void *)swift_allocObject();
  uint64_t v8 = MEMORY[0x263F8EE80];
  uint64_t v9 = MEMORY[0x263F8EE88];
  v7[18] = MEMORY[0x263F8EE78];
  v7[19] = v9;
  v7[8] = v8;
  v7[9] = v8;
  v7[10] = v8;
  v7[11] = v8;
  v7[12] = v8;
  v7[13] = v8;
  v7[14] = v8;
  v7[15] = v8;
  v7[16] = v8;
  v7[17] = v8;
  v7[7] = v6;
  sub_25E9F9FD0(v18, (uint64_t)(v7 + 2));
  swift_beginAccess();
  unint64_t v10 = sub_25EA024DC(v6);
  LOBYTE(v4) = v11;
  swift_retain();
  if (v4)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v13 = v7[13];
    v7[13] = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      sub_25EA03740();
    }
    sub_25EA04810(v10, v13);
    v7[13] = v13;
    swift_bridgeObjectRelease();
  }
  char v14 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v17 = v7[14];
  v7[14] = 0x8000000000000000;
  sub_25EA05540(1953460050, 0xE400000000000000, v6, v14);
  v7[14] = v17;
  swift_bridgeObjectRelease();
  swift_endAccess();
  type metadata accessor for StorageHandle();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v7;
  *(void *)(v15 + 24) = v6;
  *(void *)a2 = v7;
  *(void *)(a2 + 8) = v15;
  *(void *)&double result = 1953460050;
  *(_OWORD *)(a2 + 16) = xmmword_25EA37540;
  *(void *)(a2 + 32) = v6;
  return result;
}

uint64_t sub_25EA00954(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(*a1 + *MEMORY[0x263F8DE50] + 8);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](a1);
  uint64_t v8 = (char *)&v20 - v7;
  uint64_t v10 = *v9 - 8;
  MEMORY[0x270FA5388](v6);
  uint64_t v12 = (uint64_t *)((char *)&v20 - v11);
  uint64_t v13 = *v2;
  uint64_t v14 = v2[4];
  uint64_t v15 = (char *)&v20 + *(int *)(v10 + 32) - v11;
  uint64_t v16 = type metadata accessor for ScopeGraphElement.ID(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v15, 1, 1, v16);
  uint64_t v17 = *(int *)(v10 + 36);
  type metadata accessor for Dependencies.AmbiguousResolutionContext();
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = 0u;
  *(_OWORD *)(v18 + 32) = 0u;
  *(void *)(v18 + 48) = 0;
  *(void *)((char *)v12 + v17) = v18;
  *uint64_t v12 = v13;
  v12[1] = v14;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, a2, v4);
  swift_retain();
  swift_setAtWritableKeyPath();
  return sub_25EA068DC((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for Dependencies);
}

uint64_t sub_25EA00B44(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *(void *)(*a1 + *MEMORY[0x263F8DE50]) - 8;
  MEMORY[0x270FA5388](a1);
  uint64_t v9 = (uint64_t *)((char *)&v17 - v8);
  uint64_t v10 = *v3;
  uint64_t v11 = v3[4];
  uint64_t v12 = (char *)&v17 + *(int *)(v7 + 32) - v8;
  uint64_t v13 = type metadata accessor for ScopeGraphElement.ID(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);
  uint64_t v14 = *(int *)(v7 + 36);
  type metadata accessor for Dependencies.AmbiguousResolutionContext();
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = 0u;
  *(_OWORD *)(v15 + 32) = 0u;
  *(void *)(v15 + 48) = 0;
  *(void *)((char *)v9 + v14) = v15;
  *uint64_t v9 = v10;
  v9[1] = v11;
  swift_retain();
  sub_25EA1879C(a1, a2, a3);
  return sub_25EA068DC((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for Dependencies);
}

uint64_t sub_25EA00CB8(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *(void *)(*a1 + *MEMORY[0x263F8DE50]) - 8;
  MEMORY[0x270FA5388](a1);
  uint64_t v9 = (uint64_t *)((char *)&v17 - v8);
  uint64_t v10 = *v3;
  uint64_t v11 = v3[4];
  uint64_t v12 = (char *)&v17 + *(int *)(v7 + 32) - v8;
  uint64_t v13 = type metadata accessor for ScopeGraphElement.ID(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);
  uint64_t v14 = *(int *)(v7 + 36);
  type metadata accessor for Dependencies.AmbiguousResolutionContext();
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = 0u;
  *(_OWORD *)(v15 + 32) = 0u;
  *(void *)(v15 + 48) = 0;
  *(void *)((char *)v9 + v14) = v15;
  *uint64_t v9 = v10;
  v9[1] = v11;
  swift_retain();
  sub_25EA18978(a1, a2, a3);
  return sub_25EA068DC((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for Dependencies);
}

uint64_t Scope.register<A, B>(source:for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8 = *(void *)(v7 + 32);
  void v10[2] = a4;
  v10[4] = a6;
  v10[5] = a7;
  v10[6] = a1;
  v10[7] = a2;
  uint64_t v11 = v8;
  return sub_25EA22C14((uint64_t)sub_25EA06CE4, (uint64_t)v10, a5, &v11, a4, a5, a6, a7);
}

uint64_t Scope.register<A, B>(source:for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(v8 + 32);
  uint64_t v12 = a4;
  uint64_t v13 = a6;
  uint64_t v14 = a7;
  uint64_t v15 = a8;
  uint64_t v16 = a1;
  uint64_t v17 = a2;
  uint64_t v18 = v9;
  return sub_25EA22CBC((uint64_t)sub_25EA06CE8, (uint64_t)v11, a5, &v18, a4, a5, a6, a7, a8);
}

uint64_t Scope.register<A, B>(source:for:disambiguation:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(v8 + 32);
  uint64_t v12 = a5;
  uint64_t v13 = a7;
  uint64_t v14 = a8;
  uint64_t v15 = a1;
  uint64_t v16 = a2;
  uint64_t v17 = v9;
  return sub_25EA22E5C((uint64_t)sub_25EA0578C, (uint64_t)v11, a6, a4, &v17, a5, a6, a7, a8);
}

uint64_t Scope.register<A, B>(source:for:disambiguation:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10 = *(void *)(v9 + 32);
  uint64_t v13 = a5;
  uint64_t v14 = a7;
  uint64_t v15 = a8;
  uint64_t v16 = a9;
  uint64_t v17 = a1;
  uint64_t v18 = a2;
  uint64_t v19 = v10;
  return sub_25EA22F0C((uint64_t)sub_25EA057B4, (uint64_t)v12, a6, a4, &v19, a5, a6, a7, a8, a9);
}

uint64_t Scope.install(_:)(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v4 = *(void *)(v1 + 32);
  uint64_t v5 = v2;
  return sub_25EA23160(&v5, &v4);
}

uint64_t sub_25EA01094(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t *, uint64_t, uint64_t))
{
  uint64_t v6 = *(void *)(v4 + 32);
  return a4(a1, &v6, a2, a3);
}

uint64_t Scope.updateSource(id:)(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 32);
  return sub_25EA25758(a1, &v3, 0);
}

unint64_t Scope.Error.description.getter()
{
  return 0xD000000000000021;
}

BOOL static Scope.Error.== infix(_:_:)(void *a1, void *a2)
{
  return *a1 == *a2;
}

BOOL sub_25EA011CC(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t Scope.customMirror.getter()
{
  uint64_t v1 = sub_25EA36590();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25EA06AAC(0, &qword_26A727638, MEMORY[0x263F8E818], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v12 - v6;
  uint64_t v8 = v0[1];
  uint64_t v9 = v0[2];
  uint64_t v14 = *v0;
  uint64_t v15 = v8;
  uint64_t v16 = v9;
  long long v12 = *(_OWORD *)(v0 + 3);
  long long v17 = v12;
  uint64_t v13 = MEMORY[0x263F8EE78];
  uint64_t v10 = sub_25EA36580();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F8E830], v1);
  sub_25EA06AAC(0, &qword_26A727640, (uint64_t (*)(uint64_t))sub_25E9EE700, MEMORY[0x263F8D488]);
  sub_25E9EE7C8();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  return sub_25EA365A0();
}

uint64_t sub_25EA01420()
{
  uint64_t v1 = sub_25EA36590();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25EA06AAC(0, &qword_26A727638, MEMORY[0x263F8E818], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v12 - v6;
  uint64_t v8 = v0[1];
  uint64_t v9 = v0[2];
  uint64_t v14 = *v0;
  uint64_t v15 = v8;
  uint64_t v16 = v9;
  long long v12 = *(_OWORD *)(v0 + 3);
  long long v17 = v12;
  uint64_t v13 = MEMORY[0x263F8EE78];
  uint64_t v10 = sub_25EA36580();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F8E830], v1);
  sub_25EA06AAC(0, &qword_26A727640, (uint64_t (*)(uint64_t))sub_25E9EE700, MEMORY[0x263F8D488]);
  sub_25E9EE7C8();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  return sub_25EA365A0();
}

uint64_t Scope.debugDescription.getter()
{
  long long v1 = *(_OWORD *)(v0 + 16);
  v4[0] = *(_OWORD *)v0;
  v4[1] = v1;
  uint64_t v5 = *(void *)(v0 + 32);
  sub_25EA36230();
  v3[2] = v4;
  return sub_25E9FD490((uint64_t)sub_25EA057DC, (uint64_t)v3);
}

unint64_t sub_25EA016EC@<X0>(uint64_t *a1@<X0>, unint64_t *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[4];
  swift_beginAccess();
  uint64_t v5 = *(void *)(v3 + 56);
  uint64_t v6 = *(void *)(v3 + 128);
  v11[0] = v4;
  v11[1] = v5;
  long long v7 = *(_OWORD *)(v3 + 80);
  long long v12 = *(_OWORD *)(v3 + 64);
  long long v13 = v7;
  long long v8 = *(_OWORD *)(v3 + 112);
  long long v14 = *(_OWORD *)(v3 + 96);
  long long v15 = v8;
  uint64_t v16 = v6;
  unint64_t result = sub_25E9F1508(v11);
  *a2 = result;
  a2[1] = v10;
  return result;
}

uint64_t sub_25EA01770()
{
  long long v1 = *(_OWORD *)(v0 + 16);
  v4[0] = *(_OWORD *)v0;
  v4[1] = v1;
  uint64_t v5 = *(void *)(v0 + 32);
  sub_25EA36230();
  v3[2] = v4;
  return sub_25E9FD490((uint64_t)sub_25EA06CCC, (uint64_t)v3);
}

uint64_t Scope.description.getter()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v1 = *(void *)(v0 + 24);
  sub_25E9FAE44();
  uint64_t v3 = sub_25EA36310();
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_25EA36150();
    sub_25EA36150();
    swift_bridgeObjectRelease();
    return v2;
  }
  return v3;
}

uint64_t Scope.ID.description.getter()
{
  return sub_25EA36310();
}

uint64_t sub_25EA018E0()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v1 = *(void *)(v0 + 24);
  sub_25E9FAE44();
  uint64_t v3 = sub_25EA36310();
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_25EA36150();
    sub_25EA36150();
    swift_bridgeObjectRelease();
    return v2;
  }
  return v3;
}

BOOL static Scope.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) == *(void *)(a2 + 32);
}

BOOL sub_25EA0199C(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) == *(void *)(a2 + 32);
}

uint64_t sub_25EA019B0()
{
  sub_25EA06C6C();
  uint64_t result = swift_allocObject();
  *(_DWORD *)(result + 24) = 0;
  *(void *)(result + 16) = 0;
  qword_26A727B50 = result;
  return result;
}

void *sub_25EA019E8@<X0>(void *result@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *result;
  if (__OFADD__(*result, 1))
  {
    __break(1u);
  }
  else
  {
    ++*result;
    *a2 = v2;
  }
  return result;
}

void sub_25EA01A04(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 32);
}

uint64_t sub_25EA01A10()
{
  return sub_25EA36310();
}

uint64_t Scope.ID.hash(into:)()
{
  return sub_25EA36540();
}

uint64_t Scope.ID.hashValue.getter()
{
  return sub_25EA36560();
}

uint64_t sub_25EA01AC8()
{
  return sub_25EA36560();
}

uint64_t sub_25EA01B10()
{
  return sub_25EA36540();
}

uint64_t sub_25EA01B3C()
{
  return sub_25EA36560();
}

uint64_t Scope.definesScope<A>(of:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *(void *)(*a1 + *MEMORY[0x263F8EA20]) - 8;
  uint64_t v5 = MEMORY[0x270FA5388](a1);
  long long v7 = (uint64_t *)((char *)&v23 - v6);
  uint64_t v26 = *(void *)(v8 + 8);
  uint64_t v9 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v11 = (char *)&v23 - v10;
  uint64_t v12 = *v2;
  uint64_t v13 = v2[2];
  uint64_t v14 = v2[3];
  uint64_t v24 = v2[1];
  uint64_t v25 = v13;
  uint64_t v15 = v2[4];
  uint64_t v16 = (char *)v7 + *(int *)(v4 + 32);
  uint64_t v17 = type metadata accessor for ScopeGraphElement.ID(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v16, 1, 1, v17);
  uint64_t v18 = *(int *)(v4 + 36);
  type metadata accessor for Dependencies.AmbiguousResolutionContext();
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = 0u;
  *(_OWORD *)(v19 + 32) = 0u;
  *(void *)(v19 + 48) = 0;
  *(void *)((char *)v7 + v18) = v19;
  *long long v7 = v12;
  v7[1] = v15;
  swift_retain();
  sub_25EA18B54();
  sub_25EA068DC((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for Dependencies);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v26);
  uint64_t v21 = v24;
  uint64_t v20 = v25;
  *a2 = v12;
  a2[1] = v21;
  a2[2] = v20;
  a2[3] = v14;
  a2[4] = v15;
  swift_bridgeObjectRetain();
  swift_retain();
  return swift_retain();
}

uint64_t sub_25EA01DA0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_25EA01E74(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25EA06BC0((uint64_t)v12, *a3);
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
      sub_25EA06BC0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_25E9EF02C((uint64_t)v12);
  return v7;
}

uint64_t sub_25EA01E74(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_25EA36300();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_25EA02030(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_25EA363B0();
  if (!v8)
  {
    sub_25EA36410();
    __break(1u);
LABEL_17:
    uint64_t result = sub_25EA36470();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_25EA02030(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25EA020C8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_25EA022C8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_25EA022C8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25EA020C8(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
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
      unint64_t v3 = sub_25EA02240(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_25EA36380();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_25EA36410();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_25EA36160();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_25EA36470();
    __break(1u);
LABEL_14:
    uint64_t result = sub_25EA36410();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_25EA02240(uint64_t a1, uint64_t a2)
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
  sub_25EA06C1C(0, &qword_26A727C38, MEMORY[0x263F8E778], MEMORY[0x263F8E0F8]);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  _OWORD v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_25EA022C8(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
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
    sub_25EA06C1C(0, &qword_26A727C38, MEMORY[0x263F8E778], MEMORY[0x263F8E0F8]);
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
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_25EA36470();
  __break(1u);
  return result;
}

unint64_t sub_25EA02438(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25EA36530();
  sub_25EA36540();
  swift_bridgeObjectRetain();
  sub_25EA36140();
  swift_bridgeObjectRelease();
  uint64_t v6 = sub_25EA36560();
  return sub_25EA02640(a1, a2, a3, v6);
}

unint64_t sub_25EA024DC(uint64_t a1)
{
  sub_25EA36530();
  sub_25EA36540();
  uint64_t v2 = sub_25EA36560();
  return sub_25EA02718(a1, v2);
}

unint64_t sub_25EA02548(uint64_t a1)
{
  sub_25EA36530();
  sub_25EA35ED0();
  sub_25EA05B40(&qword_26A727660, MEMORY[0x263F07508]);
  sub_25EA360F0();
  uint64_t v2 = sub_25EA36560();
  return sub_25EA027B4(a1, v2);
}

unint64_t sub_25EA025FC(uint64_t a1)
{
  uint64_t v2 = sub_25EA36520();
  return sub_25EA02718(a1, v2);
}

unint64_t sub_25EA02640(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4 + 64;
  uint64_t v6 = -1 << *(unsigned char *)(v4 + 32);
  unint64_t v7 = a4 & ~v6;
  if ((*(void *)(v4 + 64 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7))
  {
    uint64_t v11 = ~v6;
    uint64_t v12 = *(void *)(v4 + 48);
    do
    {
      uint64_t v13 = (void *)(v12 + 24 * v7);
      if (*v13 == a1)
      {
        BOOL v14 = v13[1] == a2 && v13[2] == a3;
        if (v14 || (sub_25EA364B0() & 1) != 0) {
          break;
        }
      }
      unint64_t v7 = (v7 + 1) & v11;
    }
    while (((*(void *)(v5 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) != 0);
  }
  return v7;
}

unint64_t sub_25EA02718(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

unint64_t sub_25EA027B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ScopeGraphElement.ID(0) - 8;
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    uint64_t v11 = *(void *)(v5 + 72);
    do
    {
      sub_25EA06074(*(void *)(v2 + 48) + v11 * v9, (uint64_t)v7, type metadata accessor for ScopeGraphElement.ID);
      char v12 = _s9TeaBreeze17ScopeGraphElementV2IDV2eeoiySbAE_AEtFZ_0();
      sub_25EA068DC((uint64_t)v7, type metadata accessor for ScopeGraphElement.ID);
      if (v12) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
    }
    while (((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  return v9;
}

void *sub_25EA02914()
{
  return sub_25EA02974((void (*)(void))sub_25EA06284);
}

void *sub_25EA0292C()
{
  return sub_25EA03AD4(&qword_26A727BF8, &qword_26A7276E8, (uint64_t)&protocol descriptor for GraphUpdate, (void (*)(unsigned char *, uint64_t))sub_25E9F9FD0);
}

void *sub_25EA0295C()
{
  return sub_25EA02974(sub_25EA06384);
}

void *sub_25EA02974(void (*a1)(void))
{
  uint64_t v2 = v1;
  a1(0);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_25EA36430();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    *uint64_t v2 = v5;
    return result;
  }
  unint64_t result = (void *)(v4 + 64);
  uint64_t v7 = v3 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8) {
    unint64_t result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v14) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v7 + 8 * v19);
    ++v10;
    if (!v20)
    {
      int64_t v10 = v19 + 1;
      if (v19 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v20 = *(void *)(v7 + 8 * v10);
      if (!v20) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v20 - 1) & v20;
    unint64_t v16 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 8 * v16;
    uint64_t v18 = *(void *)(*(void *)(v3 + 56) + v17);
    *(void *)(*(void *)(v5 + 48) + v17) = *(void *)(*(void *)(v3 + 48) + v17);
    *(void *)(*(void *)(v5 + 56) + v17) = v18;
    unint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v14) {
    goto LABEL_26;
  }
  unint64_t v20 = *(void *)(v7 + 8 * v21);
  if (v20)
  {
    int64_t v10 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v7 + 8 * v10);
    ++v21;
    if (v20) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_25EA02B1C()
{
  return sub_25EA03EE0((void (*)(void))sub_25EA06710);
}

void *sub_25EA02B34()
{
  sub_25E9F04B8(0);
  uint64_t v28 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for ScopeGraphElement.ID(0);
  uint64_t v27 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25EA06144(0, (unint64_t *)&qword_26A727B80, sub_25E9F04B8);
  uint64_t v24 = v0;
  uint64_t v7 = *v0;
  uint64_t v8 = sub_25EA36430();
  uint64_t v9 = v8;
  if (!*(void *)(v7 + 16))
  {
LABEL_23:
    unint64_t result = (void *)swift_release();
    *uint64_t v24 = v9;
    return result;
  }
  unint64_t result = (void *)(v8 + 64);
  unint64_t v11 = (unint64_t)((1 << *(unsigned char *)(v9 + 32)) + 63) >> 6;
  if (v9 != v7 || (unint64_t)result >= v7 + 64 + 8 * v11) {
    unint64_t result = memmove(result, (const void *)(v7 + 64), 8 * v11);
  }
  int64_t v12 = 0;
  *(void *)(v9 + 16) = *(void *)(v7 + 16);
  uint64_t v13 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v14 = -1;
  if (v13 < 64) {
    uint64_t v14 = ~(-1 << v13);
  }
  unint64_t v15 = v14 & *(void *)(v7 + 64);
  uint64_t v25 = v7 + 64;
  int64_t v26 = (unint64_t)(v13 + 63) >> 6;
  while (1)
  {
    if (v15)
    {
      unint64_t v16 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      unint64_t v17 = v16 | (v12 << 6);
      goto LABEL_9;
    }
    int64_t v20 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v20 >= v26) {
      goto LABEL_23;
    }
    unint64_t v21 = *(void *)(v25 + 8 * v20);
    ++v12;
    if (!v21)
    {
      int64_t v12 = v20 + 1;
      if (v20 + 1 >= v26) {
        goto LABEL_23;
      }
      unint64_t v21 = *(void *)(v25 + 8 * v12);
      if (!v21) {
        break;
      }
    }
LABEL_22:
    unint64_t v15 = (v21 - 1) & v21;
    unint64_t v17 = __clz(__rbit64(v21)) + (v12 << 6);
LABEL_9:
    unint64_t v18 = *(void *)(v27 + 72) * v17;
    sub_25EA06074(*(void *)(v7 + 48) + v18, (uint64_t)v6, type metadata accessor for ScopeGraphElement.ID);
    unint64_t v19 = *(void *)(v28 + 72) * v17;
    sub_25EA06074(*(void *)(v7 + 56) + v19, (uint64_t)v3, (uint64_t (*)(void))sub_25E9F04B8);
    sub_25EA060DC((uint64_t)v6, *(void *)(v9 + 48) + v18, type metadata accessor for ScopeGraphElement.ID);
    unint64_t result = (void *)sub_25EA060DC((uint64_t)v3, *(void *)(v9 + 56) + v19, (uint64_t (*)(void))sub_25E9F04B8);
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v26) {
    goto LABEL_23;
  }
  unint64_t v21 = *(void *)(v25 + 8 * v22);
  if (v21)
  {
    int64_t v12 = v22;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v12 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v12 >= v26) {
      goto LABEL_23;
    }
    unint64_t v21 = *(void *)(v25 + 8 * v12);
    ++v22;
    if (v21) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

void *sub_25EA02E64()
{
  uint64_t v1 = type metadata accessor for ScopeGraphElement.ID(0);
  uint64_t v34 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25EA069A4();
  long long v31 = v0;
  uint64_t v4 = *v0;
  uint64_t v5 = sub_25EA36430();
  uint64_t v6 = *(void *)(v4 + 16);
  uint64_t v35 = v5;
  if (!v6)
  {
    unint64_t result = (void *)swift_release();
    uint64_t v29 = v35;
    uint64_t v28 = v31;
LABEL_28:
    *uint64_t v28 = v29;
    return result;
  }
  uint64_t v7 = v5;
  unint64_t result = (void *)(v5 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v4 || (unint64_t)result >= v4 + 64 + 8 * v9)
  {
    unint64_t result = memmove(result, (const void *)(v4 + 64), 8 * v9);
    uint64_t v7 = v35;
  }
  uint64_t v32 = v4 + 64;
  int64_t v11 = 0;
  *(void *)(v7 + 16) = *(void *)(v4 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v4 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v4 + 64);
  int64_t v33 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v11 << 6);
      goto LABEL_12;
    }
    int64_t v25 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v25 >= v33) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v32 + 8 * v25);
    ++v11;
    if (!v26)
    {
      int64_t v11 = v25 + 1;
      if (v25 + 1 >= v33) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v32 + 8 * v11);
      if (!v26) {
        break;
      }
    }
LABEL_25:
    unint64_t v14 = (v26 - 1) & v26;
    unint64_t v16 = __clz(__rbit64(v26)) + (v11 << 6);
LABEL_12:
    uint64_t v17 = 24 * v16;
    unint64_t v18 = (uint64_t *)(*(void *)(v4 + 48) + 24 * v16);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    uint64_t v21 = v18[2];
    unint64_t v22 = *(void *)(v34 + 72) * v16;
    sub_25EA06074(*(void *)(v4 + 56) + v22, (uint64_t)v3, type metadata accessor for ScopeGraphElement.ID);
    uint64_t v23 = v35;
    uint64_t v24 = (void *)(*(void *)(v35 + 48) + v17);
    *uint64_t v24 = v19;
    v24[1] = v20;
    v24[2] = v21;
    sub_25EA060DC((uint64_t)v3, *(void *)(v23 + 56) + v22, type metadata accessor for ScopeGraphElement.ID);
    unint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v27 = v25 + 2;
  if (v27 >= v33)
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    uint64_t v28 = v31;
    uint64_t v29 = v35;
    goto LABEL_28;
  }
  unint64_t v26 = *(void *)(v32 + 8 * v27);
  if (v26)
  {
    int64_t v11 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v11 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v11 >= v33) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v32 + 8 * v11);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_25EA03110()
{
  return sub_25EA033DC(sub_25EA05F94);
}

void *sub_25EA03128()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for ScopeGraphElement.ID(0);
  uint64_t v26 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25EA06144(0, (unint64_t *)&qword_26A727B88, (void (*)(uint64_t))sub_25EA061F0);
  uint64_t v5 = *v0;
  uint64_t v6 = sub_25EA36430();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
    unint64_t result = (void *)swift_release();
LABEL_25:
    *uint64_t v1 = v7;
    return result;
  }
  uint64_t v24 = v1;
  unint64_t result = (void *)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    unint64_t result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  uint64_t v25 = v5 + 64;
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v5 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v20 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v20 >= v14) {
      goto LABEL_23;
    }
    unint64_t v21 = *(void *)(v25 + 8 * v20);
    ++v10;
    if (!v21)
    {
      int64_t v10 = v20 + 1;
      if (v20 + 1 >= v14) {
        goto LABEL_23;
      }
      unint64_t v21 = *(void *)(v25 + 8 * v10);
      if (!v21) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v21 - 1) & v21;
    unint64_t v16 = __clz(__rbit64(v21)) + (v10 << 6);
LABEL_9:
    unint64_t v17 = *(void *)(v26 + 72) * v16;
    sub_25EA06074(*(void *)(v5 + 48) + v17, (uint64_t)v4, type metadata accessor for ScopeGraphElement.ID);
    uint64_t v18 = 8 * v16;
    uint64_t v19 = *(void *)(*(void *)(v5 + 56) + 8 * v16);
    sub_25EA060DC((uint64_t)v4, *(void *)(v7 + 48) + v17, type metadata accessor for ScopeGraphElement.ID);
    *(void *)(*(void *)(v7 + 56) + v18) = v19;
    unint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v14)
  {
LABEL_23:
    unint64_t result = (void *)swift_release();
    uint64_t v1 = v24;
    goto LABEL_25;
  }
  unint64_t v21 = *(void *)(v25 + 8 * v22);
  if (v21)
  {
    int64_t v10 = v22;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_23;
    }
    unint64_t v21 = *(void *)(v25 + 8 * v10);
    ++v22;
    if (v21) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_25EA033C4()
{
  return sub_25EA033DC(sub_25EA06818);
}

void *sub_25EA033DC(void (*a1)(void))
{
  uint64_t v2 = v1;
  a1(0);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_25EA36430();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    *uint64_t v2 = v5;
    return result;
  }
  unint64_t result = (void *)(v4 + 64);
  uint64_t v7 = v3 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8) {
    unint64_t result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v14) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v7 + 8 * v19);
    ++v10;
    if (!v20)
    {
      int64_t v10 = v19 + 1;
      if (v19 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v20 = *(void *)(v7 + 8 * v10);
      if (!v20) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v20 - 1) & v20;
    unint64_t v16 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 8 * v16;
    uint64_t v18 = *(void *)(*(void *)(v3 + 56) + v17);
    *(void *)(*(void *)(v5 + 48) + v17) = *(void *)(*(void *)(v3 + 48) + v17);
    *(void *)(*(void *)(v5 + 56) + v17) = v18;
    unint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v14) {
    goto LABEL_26;
  }
  unint64_t v20 = *(void *)(v7 + 8 * v21);
  if (v20)
  {
    int64_t v10 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v7 + 8 * v10);
    ++v21;
    if (v20) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_25EA03584()
{
  uint64_t v1 = v0;
  sub_25EA06B5C(0, &qword_26A727C30);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25EA36430();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      int64_t v9 = v23 + 1;
      if (v23 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v6 + 8 * v9);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v24 - 1) & v24;
    unint64_t v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t v18 = 16 * v15;
    int64_t v19 = (uint64_t *)(*(void *)(v2 + 56) + v18);
    uint64_t v21 = *v19;
    uint64_t v20 = v19[1];
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    int64_t v22 = (void *)(*(void *)(v4 + 56) + v18);
    *int64_t v22 = v21;
    v22[1] = v20;
    unint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v13) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v6 + 8 * v25);
  if (v24)
  {
    int64_t v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v9);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_25EA03740()
{
  uint64_t v1 = v0;
  sub_25EA06B5C(0, (unint64_t *)&qword_26A7276D0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25EA36430();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19) {
        break;
      }
    }
LABEL_25:
    unint64_t v21 = __clz(__rbit64(v19));
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = v21 + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v16) = v17;
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v13) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_25EA038DC()
{
  uint64_t v1 = v0;
  sub_25EA06B5C(0, &qword_26A727B60);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25EA36430();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v16) = v17;
    unint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v13) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_25EA03A8C()
{
  return sub_25EA03EE0((void (*)(void))sub_25EA06A10);
}

void *sub_25EA03AA4()
{
  return sub_25EA03AD4(&qword_26A727BE8, (unint64_t *)&qword_26A727BC8, (uint64_t)&protocol descriptor for RegisteredDependency, (void (*)(unsigned char *, uint64_t))sub_25E9F9FD0);
}

void *sub_25EA03AD4(unint64_t *a1, unint64_t *a2, uint64_t a3, void (*a4)(unsigned char *, uint64_t))
{
  uint64_t v6 = v4;
  sub_25EA0669C(0, a1, a2);
  uint64_t v7 = *v4;
  uint64_t v8 = sub_25EA36430();
  uint64_t v9 = v8;
  if (!*(void *)(v7 + 16))
  {
    unint64_t result = (void *)swift_release();
LABEL_28:
    *uint64_t v6 = v9;
    return result;
  }
  uint64_t v29 = v6;
  unint64_t result = (void *)(v8 + 64);
  uint64_t v11 = v7 + 64;
  unint64_t v12 = (unint64_t)((1 << *(unsigned char *)(v9 + 32)) + 63) >> 6;
  if (v9 != v7 || (unint64_t)result >= v7 + 64 + 8 * v12) {
    unint64_t result = memmove(result, (const void *)(v7 + 64), 8 * v12);
  }
  int64_t v14 = 0;
  *(void *)(v9 + 16) = *(void *)(v7 + 16);
  uint64_t v15 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v16 = -1;
  if (v15 < 64) {
    uint64_t v16 = ~(-1 << v15);
  }
  unint64_t v17 = v16 & *(void *)(v7 + 64);
  int64_t v18 = (unint64_t)(v15 + 63) >> 6;
  while (1)
  {
    if (v17)
    {
      unint64_t v19 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      unint64_t v20 = v19 | (v14 << 6);
      goto LABEL_12;
    }
    int64_t v26 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v26 >= v18) {
      goto LABEL_26;
    }
    unint64_t v27 = *(void *)(v11 + 8 * v26);
    ++v14;
    if (!v27)
    {
      int64_t v14 = v26 + 1;
      if (v26 + 1 >= v18) {
        goto LABEL_26;
      }
      unint64_t v27 = *(void *)(v11 + 8 * v14);
      if (!v27) {
        break;
      }
    }
LABEL_25:
    unint64_t v17 = (v27 - 1) & v27;
    unint64_t v20 = __clz(__rbit64(v27)) + (v14 << 6);
LABEL_12:
    uint64_t v21 = 24 * v20;
    uint64_t v22 = *(void *)(v7 + 48) + 24 * v20;
    uint64_t v23 = *(void *)v22;
    long long v30 = *(_OWORD *)(v22 + 8);
    uint64_t v24 = 40 * v20;
    sub_25E9EFBCC(*(void *)(v7 + 56) + 40 * v20, (uint64_t)v31);
    uint64_t v25 = *(void *)(v9 + 48) + v21;
    *(void *)uint64_t v25 = v23;
    *(_OWORD *)(v25 + 8) = v30;
    a4(v31, *(void *)(v9 + 56) + v24);
    unint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v28 = v26 + 2;
  if (v28 >= v18)
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    uint64_t v6 = v29;
    goto LABEL_28;
  }
  unint64_t v27 = *(void *)(v11 + 8 * v28);
  if (v27)
  {
    int64_t v14 = v28;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v14 = v28 + 1;
    if (__OFADD__(v28, 1)) {
      break;
    }
    if (v14 >= v18) {
      goto LABEL_26;
    }
    unint64_t v27 = *(void *)(v11 + 8 * v14);
    ++v28;
    if (v27) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_25EA03CE8()
{
  uint64_t v1 = v0;
  sub_25EA06504(0, (unint64_t *)&qword_26A727BE0, MEMORY[0x263F8DFB0]);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25EA36430();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v19 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v19);
    ++v9;
    if (!v20)
    {
      int64_t v9 = v19 + 1;
      if (v19 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v20 = *(void *)(v6 + 8 * v9);
      if (!v20) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t v18 = 40 * v15;
    sub_25E9EFBCC(*(void *)(v2 + 56) + 40 * v15, (uint64_t)v22);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    unint64_t result = (void *)sub_25E9F9FD0(v22, *(void *)(v4 + 56) + v18);
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v13) {
    goto LABEL_26;
  }
  unint64_t v20 = *(void *)(v6 + 8 * v21);
  if (v20)
  {
    int64_t v9 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v9);
    ++v21;
    if (v20) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_25EA03EC8()
{
  return sub_25EA03EE0((void (*)(void))sub_25EA06428);
}

void *sub_25EA03EE0(void (*a1)(void))
{
  uint64_t v2 = v1;
  a1(0);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_25EA36430();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    *uint64_t v2 = v5;
    return result;
  }
  unint64_t result = (void *)(v4 + 64);
  uint64_t v7 = v3 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8) {
    unint64_t result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v23);
    ++v10;
    if (!v24)
    {
      int64_t v10 = v23 + 1;
      if (v23 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v7 + 8 * v10);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 24 * v16;
    uint64_t v18 = *(void *)(v3 + 48) + 24 * v16;
    uint64_t v19 = 8 * v16;
    uint64_t v20 = *(void *)(*(void *)(v3 + 56) + v19);
    uint64_t v21 = *(void *)(v5 + 48) + v17;
    long long v22 = *(_OWORD *)(v18 + 8);
    *(void *)uint64_t v21 = *(void *)v18;
    *(_OWORD *)(v21 + 8) = v22;
    *(void *)(*(void *)(v5 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    unint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v14) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v7 + 8 * v25);
  if (v24)
  {
    int64_t v10 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v10);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

unint64_t sub_25EA040B0(int64_t a1, uint64_t a2)
{
  uint64_t v34 = type metadata accessor for ScopeGraphElement.ID(0);
  uint64_t v4 = *(void *)(v34 - 8);
  unint64_t result = MEMORY[0x270FA5388](v34);
  uint64_t v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = a2 + 64;
  uint64_t v9 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(void *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    uint64_t v11 = ~v9;
    unint64_t result = sub_25EA36330();
    if ((*(void *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      unint64_t v35 = (result + 1) & v11;
      uint64_t v12 = *(void *)(v4 + 72);
      uint64_t v13 = v11;
      do
      {
        uint64_t v14 = v12;
        int64_t v15 = v12 * v10;
        uint64_t v16 = v13;
        sub_25EA06074(*(void *)(a2 + 48) + v12 * v10, (uint64_t)v7, type metadata accessor for ScopeGraphElement.ID);
        sub_25EA36530();
        sub_25EA35ED0();
        sub_25EA05B40(&qword_26A727660, MEMORY[0x263F07508]);
        sub_25EA360F0();
        uint64_t v17 = sub_25EA36560();
        unint64_t result = sub_25EA068DC((uint64_t)v7, type metadata accessor for ScopeGraphElement.ID);
        uint64_t v13 = v16;
        unint64_t v18 = v17 & v16;
        if (a1 >= (uint64_t)v35)
        {
          if (v18 < v35)
          {
            uint64_t v12 = v14;
          }
          else
          {
            uint64_t v12 = v14;
            if (a1 >= (uint64_t)v18) {
              goto LABEL_12;
            }
          }
        }
        else
        {
          uint64_t v12 = v14;
          if (v18 >= v35 || a1 >= (uint64_t)v18)
          {
LABEL_12:
            if (v12 * a1 < v15
              || *(void *)(a2 + 48) + v12 * a1 >= (unint64_t)(*(void *)(a2 + 48) + v15 + v12))
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (v12 * a1 != v15)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            uint64_t v19 = *(void *)(a2 + 56);
            sub_25E9F04B8(0);
            uint64_t v21 = *(void *)(*(void *)(v20 - 8) + 72);
            int64_t v22 = v21 * a1;
            unint64_t result = v19 + v21 * a1;
            int64_t v23 = v21 * v10;
            unint64_t v24 = v19 + v21 * v10 + v21;
            if (v22 < v23 || result >= v24)
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
              a1 = v10;
              uint64_t v12 = v14;
              uint64_t v13 = v16;
            }
            else
            {
              a1 = v10;
              BOOL v26 = v22 == v23;
              uint64_t v12 = v14;
              uint64_t v13 = v16;
              if (!v26)
              {
                unint64_t result = swift_arrayInitWithTakeBackToFront();
                uint64_t v13 = v16;
                a1 = v10;
              }
            }
          }
        }
        unint64_t v10 = (v10 + 1) & v13;
      }
      while (((*(void *)(v8 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    unint64_t v27 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v28 = *v27;
    uint64_t v29 = (-1 << a1) - 1;
  }
  else
  {
    unint64_t v27 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v29 = *v27;
    uint64_t v28 = (-1 << a1) - 1;
  }
  *unint64_t v27 = v29 & v28;
  uint64_t v30 = *(void *)(a2 + 16);
  BOOL v31 = __OFSUB__(v30, 1);
  uint64_t v32 = v30 - 1;
  if (v31)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v32;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_25EA0441C(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    unint64_t result = sub_25EA36330();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      while (1)
      {
        sub_25EA36530();
        sub_25EA36540();
        swift_bridgeObjectRetain();
        sub_25EA36140();
        uint64_t v9 = sub_25EA36560();
        unint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8) {
          break;
        }
        if (v10 < v8) {
          goto LABEL_11;
        }
LABEL_12:
        uint64_t v11 = *(void *)(a2 + 48);
        unint64_t v12 = v11 + 24 * v3;
        uint64_t v13 = (long long *)(v11 + 24 * v6);
        if (v3 != v6 || v12 >= (unint64_t)v13 + 24)
        {
          long long v14 = *v13;
          *(void *)(v12 + 16) = *((void *)v13 + 2);
          *(_OWORD *)unint64_t v12 = v14;
        }
        uint64_t v15 = *(void *)(a2 + 56);
        uint64_t v16 = *(void *)(*(void *)(type metadata accessor for ScopeGraphElement.ID(0) - 8) + 72);
        int64_t v17 = v16 * v3;
        unint64_t result = v15 + v16 * v3;
        int64_t v18 = v16 * v6;
        unint64_t v19 = v15 + v16 * v6 + v16;
        if (v17 < v18 || result >= v19)
        {
          unint64_t result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          int64_t v3 = v6;
          if (v17 == v18) {
            goto LABEL_6;
          }
          unint64_t result = swift_arrayInitWithTakeBackToFront();
        }
        int64_t v3 = v6;
LABEL_6:
        unint64_t v6 = (v6 + 1) & v7;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          goto LABEL_21;
        }
      }
      if (v10 < v8) {
        goto LABEL_6;
      }
LABEL_11:
      if (v3 < (uint64_t)v10) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
LABEL_21:
    uint64_t v21 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v22 = *v21;
    uint64_t v23 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v21 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v23 = *v21;
    uint64_t v22 = (-1 << result) - 1;
  }
  *uint64_t v21 = v23 & v22;
  uint64_t v24 = *(void *)(a2 + 16);
  BOOL v25 = __OFSUB__(v24, 1);
  uint64_t v26 = v24 - 1;
  if (v25)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v26;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_25EA04654(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    unint64_t result = sub_25EA36330();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_25EA36530();
        sub_25EA36540();
        unint64_t result = sub_25EA36560();
        unint64_t v9 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v9 < v8) {
            goto LABEL_5;
          }
        }
        else if (v9 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v9)
        {
LABEL_11:
          uint64_t v10 = *(void *)(a2 + 48);
          uint64_t v11 = (void *)(v10 + 8 * v3);
          unint64_t v12 = (void *)(v10 + 8 * v6);
          if (v3 != v6 || v11 >= v12 + 1) {
            *uint64_t v11 = *v12;
          }
          uint64_t v13 = *(void *)(a2 + 56);
          long long v14 = (_OWORD *)(v13 + 16 * v3);
          uint64_t v15 = (_OWORD *)(v13 + 16 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v14 >= v15 + 1))
          {
            *long long v14 = *v15;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v16 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v17 = *v16;
    uint64_t v18 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v16 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v18 = *v16;
    uint64_t v17 = (-1 << result) - 1;
  }
  *uint64_t v16 = v18 & v17;
  uint64_t v19 = *(void *)(a2 + 16);
  BOOL v20 = __OFSUB__(v19, 1);
  uint64_t v21 = v19 - 1;
  if (v20)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v21;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_25EA04810(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    unint64_t result = sub_25EA36330();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_25EA36530();
        sub_25EA36540();
        unint64_t result = sub_25EA36560();
        unint64_t v9 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v9 < v8) {
            goto LABEL_5;
          }
        }
        else if (v9 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v9)
        {
LABEL_11:
          uint64_t v10 = *(void *)(a2 + 48);
          uint64_t v11 = (void *)(v10 + 8 * v3);
          unint64_t v12 = (void *)(v10 + 8 * v6);
          if (v3 != v6 || v11 >= v12 + 1) {
            *uint64_t v11 = *v12;
          }
          uint64_t v13 = *(void *)(a2 + 56);
          long long v14 = (void *)(v13 + 8 * v3);
          uint64_t v15 = (void *)(v13 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v14 >= v15 + 1))
          {
            *long long v14 = *v15;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v16 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v17 = *v16;
    uint64_t v18 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v16 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v18 = *v16;
    uint64_t v17 = (-1 << result) - 1;
  }
  *uint64_t v16 = v18 & v17;
  uint64_t v19 = *(void *)(a2 + 16);
  BOOL v20 = __OFSUB__(v19, 1);
  uint64_t v21 = v19 - 1;
  if (v20)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v21;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_25EA049D0(int64_t a1, uint64_t a2)
{
  uint64_t v30 = type metadata accessor for ScopeGraphElement.ID(0);
  uint64_t v4 = *(void *)(v30 - 8);
  unint64_t result = MEMORY[0x270FA5388](v30);
  uint64_t v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = a2 + 64;
  uint64_t v9 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(void *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    uint64_t v11 = ~v9;
    unint64_t result = sub_25EA36330();
    if ((*(void *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      unint64_t v31 = (result + 1) & v11;
      uint64_t v12 = *(void *)(v4 + 72);
      uint64_t v13 = v11;
      do
      {
        uint64_t v14 = v12;
        int64_t v15 = v12 * v10;
        uint64_t v16 = v13;
        sub_25EA06074(*(void *)(a2 + 48) + v12 * v10, (uint64_t)v7, type metadata accessor for ScopeGraphElement.ID);
        sub_25EA36530();
        sub_25EA35ED0();
        sub_25EA05B40(&qword_26A727660, MEMORY[0x263F07508]);
        sub_25EA360F0();
        uint64_t v17 = sub_25EA36560();
        unint64_t result = sub_25EA068DC((uint64_t)v7, type metadata accessor for ScopeGraphElement.ID);
        uint64_t v13 = v16;
        unint64_t v18 = v17 & v16;
        if (a1 >= (uint64_t)v31)
        {
          if (v18 < v31)
          {
            uint64_t v12 = v14;
          }
          else
          {
            uint64_t v12 = v14;
            if (a1 >= (uint64_t)v18) {
              goto LABEL_12;
            }
          }
        }
        else
        {
          uint64_t v12 = v14;
          if (v18 >= v31 || a1 >= (uint64_t)v18)
          {
LABEL_12:
            uint64_t v19 = *(void *)(a2 + 48);
            unint64_t result = v19 + v12 * a1;
            if (v12 * a1 < v15 || result >= v19 + v15 + v12)
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
LABEL_17:
              uint64_t v13 = v16;
            }
            else if (v12 * a1 != v15)
            {
              unint64_t result = swift_arrayInitWithTakeBackToFront();
              goto LABEL_17;
            }
            uint64_t v20 = *(void *)(a2 + 56);
            uint64_t v21 = (void *)(v20 + 8 * a1);
            uint64_t v22 = (void *)(v20 + 8 * v10);
            if (a1 != v10 || (a1 = v10, v21 >= v22 + 1))
            {
              *uint64_t v21 = *v22;
              a1 = v10;
            }
          }
        }
        unint64_t v10 = (v10 + 1) & v13;
      }
      while (((*(void *)(v8 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    uint64_t v23 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v24 = *v23;
    uint64_t v25 = (-1 << a1) - 1;
  }
  else
  {
    uint64_t v23 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v25 = *v23;
    uint64_t v24 = (-1 << a1) - 1;
  }
  *uint64_t v23 = v25 & v24;
  uint64_t v26 = *(void *)(a2 + 16);
  BOOL v27 = __OFSUB__(v26, 1);
  uint64_t v28 = v26 - 1;
  if (v27)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v28;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_25EA04CF0(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    unint64_t result = sub_25EA36330();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_25EA36530();
        sub_25EA36540();
        unint64_t result = sub_25EA36560();
        unint64_t v11 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8) {
            goto LABEL_5;
          }
        }
        else if (v11 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v11)
        {
LABEL_11:
          uint64_t v12 = *(void *)(a2 + 48);
          unint64_t v13 = v12 + 24 * v3;
          uint64_t v14 = (long long *)(v12 + 24 * v6);
          if (v3 != v6 || v13 >= (unint64_t)v14 + 24)
          {
            long long v15 = *v14;
            *(void *)(v13 + 16) = *((void *)v14 + 2);
            *(_OWORD *)unint64_t v13 = v15;
          }
          uint64_t v16 = *(void *)(a2 + 56);
          unint64_t v17 = v16 + 40 * v3;
          unint64_t v18 = (long long *)(v16 + 40 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v17 >= (unint64_t)v18 + 40))
          {
            long long v9 = *v18;
            long long v10 = v18[1];
            *(void *)(v17 + 32) = *((void *)v18 + 4);
            *(_OWORD *)unint64_t v17 = v9;
            *(_OWORD *)(v17 + 16) = v10;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v20 = *v19;
    uint64_t v21 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v21 = *v19;
    uint64_t v20 = (-1 << result) - 1;
  }
  *uint64_t v19 = v21 & v20;
  uint64_t v22 = *(void *)(a2 + 16);
  BOOL v23 = __OFSUB__(v22, 1);
  uint64_t v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v24;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_25EA04ED0(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    unint64_t result = sub_25EA36330();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        uint64_t v11 = *(void *)(a2 + 48);
        uint64_t v12 = (void *)(v11 + 8 * v6);
        unint64_t result = sub_25EA36520();
        unint64_t v13 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v13 >= v8 && v3 >= (uint64_t)v13)
          {
LABEL_16:
            uint64_t v16 = (void *)(v11 + 8 * v3);
            if (v3 != v6 || v16 >= v12 + 1) {
              *uint64_t v16 = *v12;
            }
            uint64_t v17 = *(void *)(a2 + 56);
            unint64_t v18 = v17 + 40 * v3;
            uint64_t v19 = (long long *)(v17 + 40 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v18 >= (unint64_t)v19 + 40))
            {
              long long v9 = *v19;
              long long v10 = v19[1];
              *(void *)(v18 + 32) = *((void *)v19 + 4);
              *(_OWORD *)unint64_t v18 = v9;
              *(_OWORD *)(v18 + 16) = v10;
              int64_t v3 = v6;
            }
          }
        }
        else if (v13 >= v8 || v3 >= (uint64_t)v13)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v21 = *v20;
    uint64_t v22 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v22 = *v20;
    uint64_t v21 = (-1 << result) - 1;
  }
  *uint64_t v20 = v22 & v21;
  uint64_t v23 = *(void *)(a2 + 16);
  BOOL v24 = __OFSUB__(v23, 1);
  uint64_t v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_25EA0507C(long long *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  unint64_t v6 = (void **)v5;
  uint64_t v12 = (void *)*v5;
  unint64_t v14 = sub_25EA06630(a4);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 < v17 || (a5 & 1) == 0)
  {
    if (v19 >= v17 && (a5 & 1) == 0)
    {
      sub_25EA03AD4(&qword_26A727BF8, &qword_26A7276E8, (uint64_t)&protocol descriptor for GraphUpdate, (void (*)(unsigned char *, uint64_t))sub_25E9F9FD0);
      goto LABEL_7;
    }
    sub_25EA0894C(v17, a5 & 1);
    unint64_t v23 = sub_25EA06630(a4);
    if ((v18 & 1) == (v24 & 1))
    {
      unint64_t v14 = v23;
      uint64_t v20 = *v6;
      if (v18) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_25EA364D0();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v20 = *v6;
  if (v18)
  {
LABEL_8:
    uint64_t v21 = v20[7] + 40 * v14;
    sub_25E9EF02C(v21);
    return sub_25E9F9FD0(a1, v21);
  }
LABEL_13:
  sub_25EA0B190(v14, a2, a3, a4, (uint64_t)a1, v20);
  return swift_bridgeObjectRetain();
}

uint64_t sub_25EA0520C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = type metadata accessor for ScopeGraphElement.ID(0);
  MEMORY[0x270FA5388](v8);
  long long v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (void *)*v3;
  unint64_t v13 = sub_25EA02548(a2);
  uint64_t v14 = v11[2];
  BOOL v15 = (v12 & 1) == 0;
  uint64_t v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v17 = v12;
  uint64_t v18 = v11[3];
  if (v18 >= v16 && (a3 & 1) != 0)
  {
LABEL_7:
    uint64_t v19 = *v4;
    if (v17)
    {
LABEL_8:
      uint64_t v20 = v19[7];
      sub_25E9F04B8(0);
      return sub_25EA0693C(a1, v20 + *(void *)(*(void *)(v21 - 8) + 72) * v13, (uint64_t (*)(void))sub_25E9F04B8);
    }
    goto LABEL_11;
  }
  if (v18 >= v16 && (a3 & 1) == 0)
  {
    sub_25EA02B34();
    goto LABEL_7;
  }
  sub_25EA08CAC(v16, a3 & 1);
  unint64_t v23 = sub_25EA02548(a2);
  if ((v17 & 1) != (v24 & 1))
  {
LABEL_14:
    uint64_t result = sub_25EA364D0();
    __break(1u);
    return result;
  }
  unint64_t v13 = v23;
  uint64_t v19 = *v4;
  if (v17) {
    goto LABEL_8;
  }
LABEL_11:
  sub_25EA06074(a2, (uint64_t)v10, type metadata accessor for ScopeGraphElement.ID);
  return sub_25EA0B1F4(v13, (uint64_t)v10, a1, v19);
}

uint64_t sub_25EA053B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  unint64_t v6 = (void **)v5;
  char v12 = (void *)*v5;
  unint64_t v14 = sub_25EA02438(a2, a3, a4);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 >= v17 && (a5 & 1) != 0)
  {
LABEL_7:
    uint64_t v20 = *v6;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = v20[7];
      uint64_t v22 = type metadata accessor for ScopeGraphElement.ID(0);
      return sub_25EA0693C(a1, v21 + *(void *)(*(void *)(v22 - 8) + 72) * v14, type metadata accessor for ScopeGraphElement.ID);
    }
    goto LABEL_11;
  }
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_25EA02E64();
    goto LABEL_7;
  }
  sub_25EA09150(v17, a5 & 1);
  unint64_t v24 = sub_25EA02438(a2, a3, a4);
  if ((v18 & 1) != (v25 & 1))
  {
LABEL_15:
    uint64_t result = sub_25EA364D0();
    __break(1u);
    return result;
  }
  unint64_t v14 = v24;
  uint64_t v20 = *v6;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  sub_25EA0B2E8(v14, a2, a3, a4, a1, v20);
  return swift_bridgeObjectRetain();
}

unint64_t sub_25EA05540(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  long long v10 = (void *)*v4;
  unint64_t v12 = sub_25EA024DC(a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 >= v15 && (a4 & 1) != 0)
  {
LABEL_7:
    char v18 = *v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = (uint64_t *)(v18[7] + 16 * v12);
      unint64_t result = swift_bridgeObjectRelease();
      *uint64_t v19 = a1;
      v19[1] = a2;
      return result;
    }
    goto LABEL_11;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_25EA03584();
    goto LABEL_7;
  }
  sub_25EA09C34(v15, a4 & 1);
  unint64_t v21 = sub_25EA024DC(a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_15:
    unint64_t result = sub_25EA364D0();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  char v18 = *v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  return sub_25EA0B428(v12, a3, a1, a2, v18);
}

uint64_t sub_25EA05670(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v10 = sub_25EA024DC(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = v8[3];
  if (v15 >= result && (a3 & 1) != 0)
  {
LABEL_7:
    char v16 = *v4;
    if (v14)
    {
LABEL_8:
      *(void *)(v16[7] + 8 * v10) = a1;
      return result;
    }
    goto LABEL_11;
  }
  if (v15 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_25EA03740();
    goto LABEL_7;
  }
  sub_25EA09F28(result, a3 & 1);
  uint64_t result = sub_25EA024DC(a2);
  if ((v14 & 1) != (v17 & 1))
  {
LABEL_15:
    uint64_t result = sub_25EA364D0();
    __break(1u);
    return result;
  }
  unint64_t v10 = result;
  char v16 = *v4;
  if (v14) {
    goto LABEL_8;
  }
LABEL_11:
  return sub_25EA0B1A8(v10, a2, a1, v16);
}

uint64_t sub_25EA0578C()
{
  return (*(uint64_t (**)(void))(v0 + 48))();
}

uint64_t sub_25EA057B4()
{
  return (*(uint64_t (**)(void))(v0 + 56))();
}

unint64_t sub_25EA057DC@<X0>(unint64_t *a1@<X8>)
{
  return sub_25EA016EC(*(uint64_t **)(v1 + 16), a1);
}

unint64_t sub_25EA05800()
{
  unint64_t result = qword_26A727B58;
  if (!qword_26A727B58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A727B58);
  }
  return result;
}

uint64_t destroy for Scope()
{
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for Scope(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for Scope(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  return a1;
}

__n128 initializeWithTake for Scope(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for Scope(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for Scope(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for Scope(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for Scope()
{
  return &type metadata for Scope;
}

void *initializeBufferWithCopyOfBuffer for Scope.Error(void *result, void *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for Scope.Error(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 8)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Scope.Error(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 8) = 1;
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
    *(unsigned char *)(result + 8) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_25EA05B18()
{
  return 0;
}

ValueMetadata *type metadata accessor for Scope.Error()
{
  return &type metadata for Scope.Error;
}

ValueMetadata *type metadata accessor for Scope.ID()
{
  return &type metadata for Scope.ID;
}

uint64_t sub_25EA05B40(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_25EA05B88(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v10 = sub_25EA024DC(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = v8[3];
  if (v15 >= v13 && (a3 & 1) != 0)
  {
LABEL_7:
    char v16 = *v4;
    if (v14)
    {
LABEL_8:
      uint64_t v17 = v16[7];
      unint64_t result = swift_bridgeObjectRelease();
      *(void *)(v17 + 8 * v10) = a1;
      return result;
    }
    goto LABEL_11;
  }
  if (v15 >= v13 && (a3 & 1) == 0)
  {
    sub_25EA033DC(sub_25EA05F94);
    goto LABEL_7;
  }
  sub_25EA09540(v13, a3 & 1);
  unint64_t v19 = sub_25EA024DC(a2);
  if ((v14 & 1) != (v20 & 1))
  {
LABEL_15:
    unint64_t result = sub_25EA364D0();
    __break(1u);
    return result;
  }
  unint64_t v10 = v19;
  char v16 = *v4;
  if (v14) {
    goto LABEL_8;
  }
LABEL_11:
  return sub_25EA0B1A8(v10, a2, a1, v16);
}

uint64_t sub_25EA05CC4(long long *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  unint64_t v6 = (void **)v5;
  BOOL v12 = (void *)*v5;
  unint64_t v14 = sub_25EA06630(a4);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 < v17 || (a5 & 1) == 0)
  {
    if (v19 >= v17 && (a5 & 1) == 0)
    {
      sub_25EA03AD4(&qword_26A727BE8, (unint64_t *)&qword_26A727BC8, (uint64_t)&protocol descriptor for RegisteredDependency, (void (*)(unsigned char *, uint64_t))sub_25E9F9FD0);
      goto LABEL_7;
    }
    sub_25EA0A7F4(v17, a5 & 1);
    unint64_t v23 = sub_25EA06630(a4);
    if ((v18 & 1) == (v24 & 1))
    {
      unint64_t v14 = v23;
      char v20 = *v6;
      if (v18) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_25EA364D0();
    __break(1u);
    return result;
  }
LABEL_7:
  char v20 = *v6;
  if (v18)
  {
LABEL_8:
    uint64_t v21 = v20[7] + 40 * v14;
    sub_25E9EF02C(v21);
    return sub_25E9F9FD0(a1, v21);
  }
LABEL_13:
  sub_25EA0B190(v14, a2, a3, a4, (uint64_t)a1, v20);
  return swift_bridgeObjectRetain();
}

uint64_t sub_25EA05E54(long long *a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v10 = sub_25EA025FC(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v14 = v9;
  uint64_t v15 = v8[3];
  if (v15 < v13 || (a3 & 1) == 0)
  {
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_25EA03CE8();
      goto LABEL_7;
    }
    sub_25EA0AB58(v13, a3 & 1);
    unint64_t v19 = sub_25EA025FC(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      unint64_t v10 = v19;
      BOOL v16 = *v4;
      if (v14) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_25EA364D0();
    __break(1u);
    return result;
  }
LABEL_7:
  BOOL v16 = *v4;
  if (v14)
  {
LABEL_8:
    uint64_t v17 = v16[7] + 40 * v10;
    sub_25E9EF02C(v17);
    return sub_25E9F9FD0(a1, v17);
  }
LABEL_13:
  return sub_25EA0B4EC(v10, a2, a1, v16);
}

void sub_25EA05F94(uint64_t a1)
{
}

void sub_25EA05FB4()
{
  if (!qword_26A727B70)
  {
    type metadata accessor for ScopeGraphElement.ID(255);
    sub_25EA06020();
    unint64_t v0 = sub_25EA360C0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A727B70);
    }
  }
}

unint64_t sub_25EA06020()
{
  unint64_t result = qword_26A727B78;
  if (!qword_26A727B78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A727B78);
  }
  return result;
}

uint64_t sub_25EA06074(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25EA060DC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void sub_25EA06144(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    type metadata accessor for ScopeGraphElement.ID(255);
    a3(255);
    sub_25EA05B40(&qword_26A727668, (void (*)(uint64_t))type metadata accessor for ScopeGraphElement.ID);
    unint64_t v5 = sub_25EA36460();
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

void sub_25EA061F0()
{
  if (!qword_26A727B90)
  {
    sub_25EA06AAC(255, &qword_26A7276B8, type metadata accessor for ScopeGraphElement.ID, (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for Edge);
    sub_25E9F93BC();
    unint64_t v0 = sub_25EA36260();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A727B90);
    }
  }
}

void sub_25EA06284()
{
  if (!qword_26A727B98)
  {
    sub_25EA0631C(255, &qword_26A727BA0, &qword_26A7276E8, (uint64_t)&protocol descriptor for GraphUpdate, (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for TypedDictionary);
    sub_25E9F9C34();
    unint64_t v0 = sub_25EA36460();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A727B98);
    }
  }
}

void sub_25EA0631C(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v8 = sub_25E9FAE98(255, a3);
    unint64_t v9 = a5(a1, v8);
    if (!v10) {
      atomic_store(v9, a2);
    }
  }
}

void sub_25EA06384(uint64_t a1)
{
}

void sub_25EA063A4()
{
  if (!qword_26A727BB0)
  {
    sub_25EA0631C(255, &qword_26A727728, &qword_26A7276E8, (uint64_t)&protocol descriptor for GraphUpdate, MEMORY[0x263F8D488]);
    unint64_t v0 = type metadata accessor for TypedDictionary();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A727BB0);
    }
  }
}

void sub_25EA06428()
{
  if (!qword_26A727BB8)
  {
    sub_25EA06504(255, &qword_26A727BC0, MEMORY[0x263F8D060]);
    sub_25EA064B0();
    unint64_t v0 = sub_25EA36460();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A727BB8);
    }
  }
}

unint64_t sub_25EA064B0()
{
  unint64_t result = qword_26A727BD0;
  if (!qword_26A727BD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A727BD0);
  }
  return result;
}

void sub_25EA06504(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, void, uint64_t, void))
{
  if (!*a2)
  {
    uint64_t v6 = sub_25E9FAE98(255, (unint64_t *)&qword_26A727BC8);
    unint64_t v7 = a3(a1, MEMORY[0x263F8D6C8], v6, MEMORY[0x263F8D6D8]);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

unint64_t sub_25EA06584(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 24 * result + 16) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 24 * result + 16) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

unint64_t sub_25EA06630(uint64_t a1)
{
  sub_25EA36530();
  sub_25EA36540();
  uint64_t v2 = sub_25EA36560();
  return sub_25EA06584(a1, v2);
}

void sub_25EA0669C(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  if (!*a2)
  {
    sub_25E9FAE98(255, a3);
    sub_25EA064B0();
    unint64_t v4 = sub_25EA36460();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void sub_25EA06710()
{
  if (!qword_26A727BF0)
  {
    sub_25EA0631C(255, &qword_26A727728, &qword_26A7276E8, (uint64_t)&protocol descriptor for GraphUpdate, MEMORY[0x263F8D488]);
    sub_25EA064B0();
    unint64_t v0 = sub_25EA36460();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A727BF0);
    }
  }
}

uint64_t sub_25EA067A8(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4)
{
  sub_25EA0631C(0, a2, a3, a4, MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  return a1;
}

void sub_25EA06818(uint64_t a1)
{
}

void sub_25EA06838(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    sub_25E9F9C34();
    unint64_t v4 = sub_25EA36460();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void sub_25EA068A8(uint64_t a1)
{
}

uint64_t sub_25EA068DC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25EA0693C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

void sub_25EA069A4()
{
  if (!qword_26A727C10)
  {
    type metadata accessor for ScopeGraphElement.ID(255);
    sub_25EA06020();
    unint64_t v0 = sub_25EA36460();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A727C10);
    }
  }
}

void sub_25EA06A10()
{
  if (!qword_26A727C18)
  {
    sub_25EA06AAC(255, &qword_26A727C20, (uint64_t (*)(uint64_t))sub_25EA06B10, MEMORY[0x263F8D488]);
    sub_25EA064B0();
    unint64_t v0 = sub_25EA36460();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A727C18);
    }
  }
}

void sub_25EA06AAC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

unint64_t sub_25EA06B10()
{
  unint64_t result = qword_26A727C28;
  if (!qword_26A727C28)
  {
    sub_25E9FAE98(255, &qword_26A727738);
    unint64_t result = swift_getExistentialMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_26A727C28);
  }
  return result;
}

void sub_25EA06B5C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    sub_25E9F9C34();
    unint64_t v3 = sub_25EA36460();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

uint64_t sub_25EA06BC0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_25EA06C1C(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

void sub_25EA06C6C()
{
  if (!qword_26A727C40[0])
  {
    type metadata accessor for os_unfair_lock_s();
    unint64_t v0 = sub_25EA363A0();
    if (!v1) {
      atomic_store(v0, qword_26A727C40);
    }
  }
}

unint64_t sub_25EA06CCC@<X0>(unint64_t *a1@<X8>)
{
  return sub_25EA057DC(a1);
}

uint64_t dispatch thunk of Rule.update()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of Rule.teardown()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_25EA06D18()
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

uint64_t sub_25EA06DC8(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = (uint64_t)v1 + *(void *)(*v1 + 104);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(*(void *)(v3 + 80) - 8) + 24))(v4, a1);
  return swift_endAccess();
}

void sub_25EA06E74()
{
  *(unsigned char *)(v0 + *(void *)(*(void *)v0 + 112)) = 1;
}

void sub_25EA06E94()
{
  *(unsigned char *)(v0 + *(void *)(*(void *)v0 + 112)) = 0;
}

uint64_t sub_25EA06EB0()
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)v0 + 232))();
  *(unsigned char *)(v0 + *(void *)(*(void *)v0 + 112)) = result & 1;
  return result;
}

uint64_t sub_25EA06F04()
{
  uint64_t v1 = *v0;
  if ((*((unsigned char *)v0 + *(void *)(*v0 + 136)) & 1) == 0)
  {
    *((unsigned char *)v0 + *(void *)(*v0 + 120)) = 1;
    sub_25EA06FF8(v0);
    *((unsigned char *)v0 + *(void *)(*v0 + 120)) = 0;
    uint64_t v1 = *v0;
    if (*((unsigned char *)v0 + *(void *)(*v0 + 128)) == 1)
    {
      sub_25EA07228();
      uint64_t v1 = *v0;
    }
  }
  *((unsigned char *)v0 + *(void *)(v1 + 112)) = 0;
  return 1;
}

uint64_t sub_25EA06FF8(uint64_t *a1)
{
  uint64_t v1 = *a1;
  swift_beginAccess();
  (*(void (**)(void))(*(void *)(v1 + 88) + 8))(*(void *)(v1 + 80));
  return swift_endAccess();
}

uint64_t sub_25EA070A8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if ((*(unsigned char *)(v4 + *(void *)(*(void *)v4 + 136)) & 1) == 0)
  {
    *(unsigned char *)(v4 + *(void *)(*(void *)v4 + 120)) = 1;
    uint64_t result = sub_25EA07178(result, v4, a2, a3, a4);
    *(unsigned char *)(v4 + *(void *)(*(void *)v4 + 120)) = 0;
    if (*(unsigned char *)(v4 + *(void *)(*(void *)v4 + 128)) == 1) {
      return sub_25EA07228();
    }
  }
  return result;
}

uint64_t sub_25EA07178(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = a2 + *(void *)(*(void *)a2 + 104);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a5 + 24))(v8, a3, a4, a5);
  return swift_endAccess();
}

uint64_t sub_25EA07228()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 128);
  if (*((unsigned char *)v0 + *(void *)(*v0 + 120)) == 1)
  {
    *((unsigned char *)v0 + v2) = 1;
  }
  else
  {
    *((unsigned char *)v0 + v2) = 0;
    *((unsigned char *)v0 + *(void *)(*v0 + 136)) = 1;
    swift_beginAccess();
    (*(void (**)(void))(*(void *)(v1 + 88) + 16))(*(void *)(v1 + 80));
    return swift_endAccess();
  }
  return result;
}

uint64_t sub_25EA07320(uint64_t result)
{
  if (*(unsigned char *)(result + *(void *)(*(void *)result + 128)) == 1) {
    return sub_25EA07228();
  }
  return result;
}

uint64_t *sub_25EA07364()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v1 + 80) - 8) + 8))((uint64_t)v0 + *(void *)(*v0 + 104));
  return v0;
}

uint64_t sub_25EA073E4()
{
  sub_25EA07364();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t type metadata accessor for RuleVertex()
{
  return sub_25E9ED2B4();
}

uint64_t sub_25EA07454()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t sub_25EA07478@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)v2 + *(void *)(**(void **)v2 + 104);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 80) - 8) + 16))(a2, v5);
}

uint64_t sub_25EA07510()
{
  return *(unsigned __int8 *)(*(void *)v0 + *(void *)(**(void **)v0 + 112));
}

void sub_25EA07530()
{
}

void sub_25EA07554()
{
}

uint64_t sub_25EA07578()
{
  return sub_25EA06EB0();
}

uint64_t sub_25EA0759C()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 240))() & 1;
}

uint64_t sub_25EA075E4()
{
  return sub_25EA07228();
}

uint64_t sub_25EA07608(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25EA070A8(a1, a2, a3, a4);
}

uint64_t sub_25EA0762C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_25EA07660(uint64_t result, uint64_t a2)
{
  uint64_t v4 = *v2;
  if (*((unsigned char *)v2 + *(void *)(*v2 + 136)))
  {
LABEL_2:
    *((unsigned char *)v2 + *(void *)(v4 + 112)) = 1;
    return result;
  }
  *((unsigned char *)v2 + *(void *)(*v2 + 120)) = 1;
  uint64_t result = sub_25EA07798(v2, result, a2);
  if (!v3)
  {
    *((unsigned char *)v2 + *(void *)(*v2 + 120)) = 0;
    uint64_t v4 = *v2;
    if (*((unsigned char *)v2 + *(void *)(*v2 + 128)) == 1)
    {
      uint64_t result = sub_25EA07228();
      uint64_t v4 = *v2;
    }
    goto LABEL_2;
  }
  *((unsigned char *)v2 + *(void *)(*v2 + 120)) = 0;
  if (*((unsigned char *)v2 + *(void *)(*v2 + 128)) == 1) {
    return sub_25EA07228();
  }
  return result;
}

uint64_t sub_25EA07798(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *a1;
  swift_beginAccess();
  (*(void (**)(uint64_t, void, uint64_t))(a3 + 24))(a2, *(void *)(v5 + 80), a3);
  return swift_endAccess();
}

uint64_t sub_25EA07854(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25EA07660(a1, *(void *)(a3 - 8));
}

uint64_t sub_25EA0787C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)v2;
  if ((*(unsigned char *)(v2 + *(void *)(*(void *)v2 + 136)) & 1) == 0)
  {
    *(unsigned char *)(v2 + *(void *)(*(void *)v2 + 120)) = 1;
    sub_25EA0799C(v2, a1, a2);
    *(unsigned char *)(v2 + *(void *)(*(void *)v2 + 120)) = 0;
    uint64_t v3 = *(void *)v2;
    if (*(unsigned char *)(v2 + *(void *)(*(void *)v2 + 128)) == 1)
    {
      sub_25EA07228();
      uint64_t v3 = *(void *)v2;
    }
  }
  uint64_t result = (*(uint64_t (**)(void))(v3 + 232))();
  *(unsigned char *)(v2 + *(void *)(*(void *)v2 + 112)) = result & 1;
  return result;
}

uint64_t sub_25EA0799C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)a1 + 80);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](a1);
  uint64_t v9 = (char *)&v13 - v8;
  uint64_t v11 = v7 + *(void *)(v10 + 104);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v11, v5);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(a3 + 24))(a2, v5, a3);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

uint64_t sub_25EA07AF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25EA0787C(a1, *(void *)(a3 - 8));
}

uint64_t sub_25EA07B18()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t sub_25EA07B3C(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 88);
}

uint64_t sub_25EA07B44(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

void *sub_25EA07B80(uint64_t a1)
{
  uint64_t v2 = *v1;
  *((unsigned char *)v1 + *(void *)(*v1 + 112)) = 1;
  *((unsigned char *)v1 + *(void *)(*v1 + 120)) = 0;
  *((unsigned char *)v1 + *(void *)(*v1 + 128)) = 0;
  *((unsigned char *)v1 + *(void *)(*v1 + 136)) = 0;
  (*(void (**)(char *, uint64_t, void))(*(void *)(*(void *)(v2 + 80) - 8) + 16))((char *)v1 + *(void *)(*v1 + 104), a1, *(void *)(v2 + 80));
  swift_getMetatypeMetadata();
  v1[2] = sub_25EA36130();
  v1[3] = v3;
  return v1;
}

void *sub_25EA07C88(uint64_t a1)
{
  return sub_25EA07B80(a1);
}

void sub_25EA07CCC()
{
  qword_26A727CC8 = MEMORY[0x263F8EE80];
}

void RuleSet.init()(void *a1@<X8>)
{
  *a1 = MEMORY[0x263F8EE80];
}

uint64_t static RuleSet.empty.getter@<X0>(void *a1@<X8>)
{
  if (qword_26A7274D0 != -1) {
    swift_once();
  }
  *a1 = qword_26A727CC8;
  return swift_bridgeObjectRetain();
}

uint64_t RuleSet.install<A, B>(_:followingResolutionOf:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = v4;
  uint64_t v9 = *v4;
  sub_25EA0CEF8();
  uint64_t v11 = MEMORY[0x263F8EE78];
  if (*(void *)(v9 + 16))
  {
    unint64_t v12 = sub_25EA06630(v10);
    if (v13)
    {
      char v14 = *(void **)(*(void *)(v9 + 56) + 8 * v12);
      swift_bridgeObjectRetain();
    }
    else
    {
      char v14 = (void *)MEMORY[0x263F8EE78];
    }
  }
  else
  {
    char v14 = (void *)MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRelease();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    char v14 = sub_25EA087F8(0, v14[2] + 1, 1, v14);
  }
  unint64_t v16 = v14[2];
  unint64_t v15 = v14[3];
  if (v16 >= v15 >> 1) {
    char v14 = sub_25EA087F8((void *)(v15 > 1), v16 + 1, 1, v14);
  }
  long long v14[2] = v16 + 1;
  uint64_t v17 = &v14[2 * v16];
  void v17[4] = a3;
  v17[5] = a4;
  uint64_t v18 = sub_25EA0CEF8();
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  char v24 = (void *)*v6;
  int v39 = (void *)*v6;
  *uint64_t v6 = 0x8000000000000000;
  unint64_t v26 = sub_25EA06630(v22);
  uint64_t v27 = v24[2];
  BOOL v28 = (v25 & 1) == 0;
  uint64_t v29 = v27 + v28;
  if (__OFADD__(v27, v28))
  {
    __break(1u);
LABEL_22:
    sub_25EA03A8C();
    char v24 = v39;
    goto LABEL_15;
  }
  char v5 = v25;
  if (v24[3] >= v29)
  {
    if (isUniquelyReferenced_nonNull_native) {
      goto LABEL_15;
    }
    goto LABEL_22;
  }
  sub_25EA0A4EC(v29, isUniquelyReferenced_nonNull_native);
  char v24 = v39;
  unint64_t v30 = sub_25EA06630(v22);
  if ((v5 & 1) != (v31 & 1)) {
    goto LABEL_24;
  }
  unint64_t v26 = v30;
LABEL_15:
  *uint64_t v6 = v24;
  swift_bridgeObjectRelease();
  uint64_t v32 = (void *)*v6;
  if ((v5 & 1) == 0)
  {
    v32[(v26 >> 6) + 8] |= 1 << v26;
    uint64_t v33 = (uint64_t *)(v32[6] + 24 * v26);
    *uint64_t v33 = v18;
    v33[1] = v20;
    v33[2] = v22;
    *(void *)(v32[7] + 8 * v26) = v11;
    uint64_t v34 = v32[2];
    BOOL v35 = __OFADD__(v34, 1);
    uint64_t v36 = v34 + 1;
    if (!v35)
    {
      v32[2] = v36;
      swift_bridgeObjectRetain();
      goto LABEL_18;
    }
    __break(1u);
LABEL_24:
    uint64_t result = sub_25EA364D0();
    __break(1u);
    return result;
  }
LABEL_18:
  uint64_t v37 = v32[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v37 + 8 * v26) = v14;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25EA08008()
{
  uint64_t v1 = *v0;
  sub_25EA0CEF8();
  if (*(void *)(v1 + 16) && (unint64_t v3 = sub_25EA06630(v2), (v4 & 1) != 0))
  {
    uint64_t v5 = *(void *)(*(void *)(v1 + 56) + 8 * v3);
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v5 = MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t RuleSet.description.getter()
{
  uint64_t v1 = *v0;
  sub_25EA0BE84(0, &qword_26A727C20, (uint64_t (*)(uint64_t))sub_25EA06B10, MEMORY[0x263F8D488]);
  uint64_t v3 = v2;
  unint64_t v4 = sub_25EA064B0();
  return MEMORY[0x270F9D060](v1, &type metadata for TypeIdentifier, v3, v4);
}

uint64_t sub_25EA080F4()
{
  uint64_t v1 = *v0;
  sub_25EA0BE84(0, &qword_26A727C20, (uint64_t (*)(uint64_t))sub_25EA06B10, MEMORY[0x263F8D488]);
  uint64_t v3 = v2;
  unint64_t v4 = sub_25EA064B0();
  return MEMORY[0x270F9D060](v1, &type metadata for TypeIdentifier, v3, v4);
}

void *sub_25EA08178(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_25EA0B868(0, &qword_26A727CD0, MEMORY[0x263F8E0F8]);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      void v10[2] = v8;
      void v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
      unint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[5 * v8 + 4]) {
          memmove(v12, a4 + 4, 40 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      unint64_t v12 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_25EA0B950(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_25EA082B4(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_25EA0855C(a1, a2, a3, a4, &qword_26A727CE8, type metadata accessor for ScopeGraphElement.ID, type metadata accessor for ScopeGraphElement.ID, type metadata accessor for ScopeGraphElement.ID);
}

void *sub_25EA082EC(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_25EA0BFD4(0, qword_26A727D00);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      void v10[2] = v8;
      void v10[3] = 2 * (v12 >> 4);
      char v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      char v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_25EA0BAD4(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_25EA08408(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_25EA0BFD4(0, &qword_26A727CF0);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      void v10[2] = v8;
      void v10[3] = 2 * (v12 >> 3);
      char v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      char v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4]) {
          memmove(v13, a4 + 4, 8 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_25EA0BBC8(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_25EA08524(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_25EA0855C(a1, a2, a3, a4, &qword_26A727CD8, (uint64_t (*)(uint64_t))sub_25EA0BA6C, (uint64_t (*)(void))sub_25EA0BA6C, (uint64_t (*)(void))sub_25EA0BA6C);
}

uint64_t sub_25EA0855C(char a1, int64_t a2, char a3, unint64_t a4, unint64_t *a5, uint64_t (*a6)(uint64_t), uint64_t (*a7)(void), uint64_t (*a8)(void))
{
  if (a3)
  {
    unint64_t v12 = *(void *)(a4 + 24);
    uint64_t v13 = v12 >> 1;
    if ((uint64_t)(v12 >> 1) < a2)
    {
      if (v13 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v13 = v12 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v12 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v13 = a2;
      }
    }
  }
  else
  {
    uint64_t v13 = a2;
  }
  uint64_t v14 = *(void *)(a4 + 16);
  if (v13 <= v14) {
    uint64_t v15 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v15 = v13;
  }
  if (!v15)
  {
    uint64_t v19 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  sub_25EA0BE84(0, a5, a6, MEMORY[0x263F8E0F8]);
  uint64_t v16 = *(void *)(a7(0) - 8);
  uint64_t v17 = *(void *)(v16 + 72);
  unint64_t v18 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v19 = (void *)swift_allocObject();
  size_t v20 = j__malloc_size(v19);
  if (!v17 || (v20 - v18 == 0x8000000000000000 ? (BOOL v21 = v17 == -1) : (BOOL v21 = 0), v21))
  {
LABEL_29:
    uint64_t result = sub_25EA36410();
    __break(1u);
    return result;
  }
  v19[2] = v14;
  v19[3] = 2 * ((uint64_t)(v20 - v18) / v17);
LABEL_19:
  uint64_t v22 = *(void *)(a7(0) - 8);
  unint64_t v23 = (*(unsigned __int8 *)(v22 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
  unint64_t v24 = (unint64_t)v19 + v23;
  if (a1)
  {
    if ((unint64_t)v19 < a4 || v24 >= a4 + v23 + *(void *)(v22 + 72) * v14)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v19 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25EA0BCB4(0, v14, v24, a4, a8);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v19;
}

void *sub_25EA087F8(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_25EA0BE84(0, &qword_26A727CF8, (uint64_t (*)(uint64_t))sub_25EA06B10, MEMORY[0x263F8E0F8]);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      void v10[2] = v8;
      void v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_25EA0BEE8(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_25EA08934(uint64_t a1, char a2)
{
  return sub_25EA08994(a1, a2, (void (*)(void))sub_25EA06284);
}

uint64_t sub_25EA0894C(uint64_t a1, char a2)
{
  return sub_25EA0A824(a1, a2, &qword_26A727BF8, &qword_26A7276E8, (uint64_t)&protocol descriptor for GraphUpdate, (void (*)(uint64_t, unsigned char *))sub_25E9F9FD0);
}

uint64_t sub_25EA0897C(uint64_t a1, char a2)
{
  return sub_25EA08994(a1, a2, sub_25EA06384);
}

uint64_t sub_25EA08994(uint64_t a1, char a2, void (*a3)(void))
{
  unint64_t v4 = v3;
  uint64_t v6 = *v3;
  a3(0);
  uint64_t result = sub_25EA36440();
  uint64_t v8 = result;
  if (*(void *)(v6 + 16))
  {
    int64_t v9 = 0;
    uint64_t v33 = (void *)(v6 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v6 + 32);
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & *(void *)(v6 + 64);
    int64_t v32 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v13 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v19 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v20 = v19 | (v9 << 6);
      }
      else
      {
        int64_t v21 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        uint64_t result = v6 + 64;
        if (v21 >= v32) {
          goto LABEL_33;
        }
        unint64_t v22 = v33[v21];
        ++v9;
        if (!v22)
        {
          int64_t v9 = v21 + 1;
          if (v21 + 1 >= v32) {
            goto LABEL_33;
          }
          unint64_t v22 = v33[v9];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v32)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                uint64_t result = swift_release();
                unint64_t v4 = v3;
                goto LABEL_40;
              }
              uint64_t v31 = 1 << *(unsigned char *)(v6 + 32);
              if (v31 >= 64) {
                bzero(v33, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *uint64_t v33 = -1 << v31;
              }
              unint64_t v4 = v3;
              *(void *)(v6 + 16) = 0;
              break;
            }
            unint64_t v22 = v33[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v9 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_42;
                }
                if (v9 >= v32) {
                  goto LABEL_33;
                }
                unint64_t v22 = v33[v9];
                ++v23;
                if (v22) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v9 = v23;
          }
        }
LABEL_30:
        unint64_t v12 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v9 << 6);
      }
      uint64_t v28 = 8 * v20;
      uint64_t v29 = *(void *)(*(void *)(v6 + 48) + v28);
      uint64_t v30 = *(void *)(*(void *)(v6 + 56) + v28);
      if ((a2 & 1) == 0) {
        swift_bridgeObjectRetain();
      }
      sub_25EA36530();
      sub_25EA36540();
      uint64_t result = sub_25EA36560();
      uint64_t v14 = -1 << *(unsigned char *)(v8 + 32);
      unint64_t v15 = result & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v26 = v16 == v25;
          if (v16 == v25) {
            unint64_t v16 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v13 + 8 * v16);
        }
        while (v27 == -1);
        unint64_t v17 = __clz(__rbit64(~v27)) + (v16 << 6);
      }
      *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      uint64_t v18 = 8 * v17;
      *(void *)(*(void *)(v8 + 48) + v18) = v29;
      *(void *)(*(void *)(v8 + 56) + v18) = v30;
      ++*(void *)(v8 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *unint64_t v4 = v8;
  return result;
}

uint64_t sub_25EA08C70(uint64_t a1, char a2)
{
  return sub_25EA0AE74(a1, a2, (unint64_t *)&qword_26A727BF0, (uint64_t)&qword_26A727728, MEMORY[0x263F8D488], (void (*)(uint64_t, uint64_t, uint64_t))sub_25EA0B868);
}

uint64_t sub_25EA08CAC(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  sub_25EA0BE84(0, &qword_26A7276A0, type metadata accessor for ScopeGraphElement, (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for Vertex);
  uint64_t v41 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v44 = (uint64_t)&v38 - v6;
  uint64_t v7 = type metadata accessor for ScopeGraphElement.ID(0);
  uint64_t v42 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7 - 8);
  int64_t v9 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  sub_25EA0B664();
  int v43 = a2;
  uint64_t v11 = sub_25EA36440();
  uint64_t v12 = v11;
  if (!*(void *)(v10 + 16)) {
    goto LABEL_41;
  }
  uint64_t v13 = 1 << *(unsigned char *)(v10 + 32);
  uint64_t v14 = *(void *)(v10 + 64);
  uint64_t v40 = (void *)(v10 + 64);
  if (v13 < 64) {
    uint64_t v15 = ~(-1 << v13);
  }
  else {
    uint64_t v15 = -1;
  }
  unint64_t v16 = v15 & v14;
  uint64_t v38 = v2;
  int64_t v39 = (unint64_t)(v13 + 63) >> 6;
  uint64_t v17 = v11 + 64;
  uint64_t result = swift_retain();
  int64_t v19 = 0;
  while (1)
  {
    if (v16)
    {
      unint64_t v21 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v22 = v21 | (v19 << 6);
      goto LABEL_22;
    }
    int64_t v23 = v19 + 1;
    if (__OFADD__(v19, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v23 >= v39) {
      break;
    }
    char v24 = v40;
    unint64_t v25 = v40[v23];
    ++v19;
    if (!v25)
    {
      int64_t v19 = v23 + 1;
      if (v23 + 1 >= v39) {
        goto LABEL_34;
      }
      unint64_t v25 = v40[v19];
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v39)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v38;
          if ((v43 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v25 = v40[v26];
        if (!v25)
        {
          while (1)
          {
            int64_t v19 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_43;
            }
            if (v19 >= v39) {
              goto LABEL_34;
            }
            unint64_t v25 = v40[v19];
            ++v26;
            if (v25) {
              goto LABEL_21;
            }
          }
        }
        int64_t v19 = v26;
      }
    }
LABEL_21:
    unint64_t v16 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v19 << 6);
LABEL_22:
    uint64_t v27 = *(void *)(v42 + 72);
    uint64_t v28 = *(void *)(v10 + 48) + v27 * v22;
    if (v43)
    {
      sub_25E9FD284(v28, (uint64_t)v9);
      uint64_t v29 = *(void *)(v41 + 72);
      sub_25EA0B7D4(*(void *)(v10 + 56) + v29 * v22, v44);
    }
    else
    {
      sub_25E9EE208(v28, (uint64_t)v9);
      uint64_t v29 = *(void *)(v41 + 72);
      sub_25EA0B740(*(void *)(v10 + 56) + v29 * v22, v44);
    }
    sub_25EA36530();
    sub_25EA35ED0();
    sub_25EA05B40(&qword_26A727660, MEMORY[0x263F07508]);
    sub_25EA360F0();
    uint64_t result = sub_25EA36560();
    uint64_t v30 = -1 << *(unsigned char *)(v12 + 32);
    unint64_t v31 = result & ~v30;
    unint64_t v32 = v31 >> 6;
    if (((-1 << v31) & ~*(void *)(v17 + 8 * (v31 >> 6))) != 0)
    {
      unint64_t v20 = __clz(__rbit64((-1 << v31) & ~*(void *)(v17 + 8 * (v31 >> 6)))) | v31 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v33 = 0;
      unint64_t v34 = (unint64_t)(63 - v30) >> 6;
      do
      {
        if (++v32 == v34 && (v33 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v35 = v32 == v34;
        if (v32 == v34) {
          unint64_t v32 = 0;
        }
        v33 |= v35;
        uint64_t v36 = *(void *)(v17 + 8 * v32);
      }
      while (v36 == -1);
      unint64_t v20 = __clz(__rbit64(~v36)) + (v32 << 6);
    }
    *(void *)(v17 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
    sub_25E9FD284((uint64_t)v9, *(void *)(v12 + 48) + v27 * v20);
    uint64_t result = sub_25EA0B7D4(v44, *(void *)(v12 + 56) + v29 * v20);
    ++*(void *)(v12 + 16);
  }
  swift_release();
  uint64_t v3 = v38;
  char v24 = v40;
  if ((v43 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v37 = 1 << *(unsigned char *)(v10 + 32);
  if (v37 >= 64) {
    bzero(v24, ((unint64_t)(v37 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *char v24 = -1 << v37;
  }
  *(void *)(v10 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v12;
  return result;
}

uint64_t sub_25EA09150(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for ScopeGraphElement.ID(0);
  uint64_t v45 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v47 = (uint64_t)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v2;
  sub_25EA0BE10(0, (unint64_t *)&qword_26A727C10, MEMORY[0x263F8DFB0]);
  int v46 = a2;
  uint64_t v8 = sub_25EA36440();
  uint64_t v9 = v8;
  if (!*(void *)(v7 + 16)) {
    goto LABEL_41;
  }
  uint64_t v10 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v11 = *(void *)(v7 + 64);
  uint64_t v44 = (void *)(v7 + 64);
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  else {
    uint64_t v12 = -1;
  }
  unint64_t v13 = v12 & v11;
  uint64_t v42 = v2;
  int64_t v43 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v14 = v8 + 64;
  uint64_t result = swift_retain();
  int64_t v16 = 0;
  while (1)
  {
    if (v13)
    {
      unint64_t v19 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v20 = v19 | (v16 << 6);
      goto LABEL_22;
    }
    int64_t v21 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v21 >= v43) {
      break;
    }
    unint64_t v22 = v44;
    unint64_t v23 = v44[v21];
    ++v16;
    if (!v23)
    {
      int64_t v16 = v21 + 1;
      if (v21 + 1 >= v43) {
        goto LABEL_34;
      }
      unint64_t v23 = v44[v16];
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v43)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v42;
          if ((v46 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v23 = v44[v24];
        if (!v23)
        {
          while (1)
          {
            int64_t v16 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_43;
            }
            if (v16 >= v43) {
              goto LABEL_34;
            }
            unint64_t v23 = v44[v16];
            ++v24;
            if (v23) {
              goto LABEL_21;
            }
          }
        }
        int64_t v16 = v24;
      }
    }
LABEL_21:
    unint64_t v13 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v16 << 6);
LABEL_22:
    uint64_t v25 = *(void *)(v7 + 56);
    uint64_t v26 = v7;
    uint64_t v27 = (uint64_t *)(*(void *)(v7 + 48) + 24 * v20);
    uint64_t v28 = *v27;
    uint64_t v29 = v27[1];
    uint64_t v30 = v27[2];
    uint64_t v31 = *(void *)(v45 + 72);
    uint64_t v32 = v25 + v31 * v20;
    if (v46)
    {
      sub_25E9FD284(v32, v47);
    }
    else
    {
      sub_25E9EE208(v32, v47);
      swift_bridgeObjectRetain();
    }
    sub_25EA36530();
    sub_25EA36540();
    swift_bridgeObjectRetain();
    sub_25EA36140();
    swift_bridgeObjectRelease();
    uint64_t result = sub_25EA36560();
    uint64_t v33 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v34 = result & ~v33;
    unint64_t v35 = v34 >> 6;
    if (((-1 << v34) & ~*(void *)(v14 + 8 * (v34 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v34) & ~*(void *)(v14 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v36 = 0;
      unint64_t v37 = (unint64_t)(63 - v33) >> 6;
      do
      {
        if (++v35 == v37 && (v36 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v38 = v35 == v37;
        if (v35 == v37) {
          unint64_t v35 = 0;
        }
        v36 |= v38;
        uint64_t v39 = *(void *)(v14 + 8 * v35);
      }
      while (v39 == -1);
      unint64_t v17 = __clz(__rbit64(~v39)) + (v35 << 6);
    }
    *(void *)(v14 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = (void *)(*(void *)(v9 + 48) + 24 * v17);
    *uint64_t v18 = v28;
    v18[1] = v29;
    v18[2] = v30;
    uint64_t result = sub_25E9FD284(v47, *(void *)(v9 + 56) + v31 * v17);
    ++*(void *)(v9 + 16);
    uint64_t v7 = v26;
  }
  swift_release();
  uint64_t v3 = v42;
  unint64_t v22 = v44;
  if ((v46 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v40 = 1 << *(unsigned char *)(v7 + 32);
  if (v40 >= 64) {
    bzero(v22, ((unint64_t)(v40 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v22 = -1 << v40;
  }
  *(void *)(v7 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v9;
  return result;
}

uint64_t sub_25EA09540(uint64_t a1, char a2)
{
  return sub_25EA09958(a1, a2, sub_25EA05F94);
}

uint64_t sub_25EA09558(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for ScopeGraphElement.ID(0);
  uint64_t v39 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v2;
  sub_25EA0B5B8();
  int v40 = a2;
  uint64_t v9 = sub_25EA36440();
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16)) {
    goto LABEL_41;
  }
  uint64_t v11 = 1 << *(unsigned char *)(v8 + 32);
  uint64_t v12 = *(void *)(v8 + 64);
  BOOL v38 = (void *)(v8 + 64);
  if (v11 < 64) {
    uint64_t v13 = ~(-1 << v11);
  }
  else {
    uint64_t v13 = -1;
  }
  unint64_t v14 = v13 & v12;
  char v36 = v2;
  int64_t v37 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v15 = v9 + 64;
  uint64_t result = swift_retain();
  int64_t v17 = 0;
  while (1)
  {
    if (v14)
    {
      unint64_t v19 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v20 = v19 | (v17 << 6);
      goto LABEL_22;
    }
    int64_t v21 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v21 >= v37) {
      break;
    }
    unint64_t v22 = v38;
    unint64_t v23 = v38[v21];
    ++v17;
    if (!v23)
    {
      int64_t v17 = v21 + 1;
      if (v21 + 1 >= v37) {
        goto LABEL_34;
      }
      unint64_t v23 = v38[v17];
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v37)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v36;
          if ((v40 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v23 = v38[v24];
        if (!v23)
        {
          while (1)
          {
            int64_t v17 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_43;
            }
            if (v17 >= v37) {
              goto LABEL_34;
            }
            unint64_t v23 = v38[v17];
            ++v24;
            if (v23) {
              goto LABEL_21;
            }
          }
        }
        int64_t v17 = v24;
      }
    }
LABEL_21:
    unint64_t v14 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v17 << 6);
LABEL_22:
    uint64_t v25 = *(void *)(v39 + 72);
    uint64_t v26 = *(void *)(v8 + 48) + v25 * v20;
    if (v40)
    {
      sub_25E9FD284(v26, (uint64_t)v7);
      uint64_t v27 = *(void *)(*(void *)(v8 + 56) + 8 * v20);
    }
    else
    {
      sub_25E9EE208(v26, (uint64_t)v7);
      uint64_t v27 = *(void *)(*(void *)(v8 + 56) + 8 * v20);
      swift_bridgeObjectRetain();
    }
    sub_25EA36530();
    sub_25EA35ED0();
    sub_25EA05B40(&qword_26A727660, MEMORY[0x263F07508]);
    sub_25EA360F0();
    uint64_t result = sub_25EA36560();
    uint64_t v28 = -1 << *(unsigned char *)(v10 + 32);
    unint64_t v29 = result & ~v28;
    unint64_t v30 = v29 >> 6;
    if (((-1 << v29) & ~*(void *)(v15 + 8 * (v29 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v29) & ~*(void *)(v15 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v31 = 0;
      unint64_t v32 = (unint64_t)(63 - v28) >> 6;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v33 = v30 == v32;
        if (v30 == v32) {
          unint64_t v30 = 0;
        }
        v31 |= v33;
        uint64_t v34 = *(void *)(v15 + 8 * v30);
      }
      while (v34 == -1);
      unint64_t v18 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t result = sub_25E9FD284((uint64_t)v7, *(void *)(v10 + 48) + v25 * v18);
    *(void *)(*(void *)(v10 + 56) + 8 * v18) = v27;
    ++*(void *)(v10 + 16);
  }
  swift_release();
  uint64_t v3 = v36;
  unint64_t v22 = v38;
  if ((v40 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v35 = 1 << *(unsigned char *)(v8 + 32);
  if (v35 >= 64) {
    bzero(v22, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v22 = -1 << v35;
  }
  *(void *)(v8 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v10;
  return result;
}

uint64_t sub_25EA09940(uint64_t a1, char a2)
{
  return sub_25EA09958(a1, a2, sub_25EA06818);
}

uint64_t sub_25EA09958(uint64_t a1, char a2, void (*a3)(void))
{
  unint64_t v4 = v3;
  uint64_t v6 = *v3;
  a3(0);
  uint64_t result = sub_25EA36440();
  uint64_t v8 = result;
  if (*(void *)(v6 + 16))
  {
    int64_t v9 = 0;
    BOOL v33 = (void *)(v6 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v6 + 32);
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & *(void *)(v6 + 64);
    int64_t v32 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v13 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v19 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v20 = v19 | (v9 << 6);
      }
      else
      {
        int64_t v21 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        uint64_t result = v6 + 64;
        if (v21 >= v32) {
          goto LABEL_33;
        }
        unint64_t v22 = v33[v21];
        ++v9;
        if (!v22)
        {
          int64_t v9 = v21 + 1;
          if (v21 + 1 >= v32) {
            goto LABEL_33;
          }
          unint64_t v22 = v33[v9];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v32)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                uint64_t result = swift_release();
                unint64_t v4 = v3;
                goto LABEL_40;
              }
              uint64_t v31 = 1 << *(unsigned char *)(v6 + 32);
              if (v31 >= 64) {
                bzero(v33, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *BOOL v33 = -1 << v31;
              }
              unint64_t v4 = v3;
              *(void *)(v6 + 16) = 0;
              break;
            }
            unint64_t v22 = v33[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v9 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_42;
                }
                if (v9 >= v32) {
                  goto LABEL_33;
                }
                unint64_t v22 = v33[v9];
                ++v23;
                if (v22) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v9 = v23;
          }
        }
LABEL_30:
        unint64_t v12 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v9 << 6);
      }
      uint64_t v28 = 8 * v20;
      uint64_t v29 = *(void *)(*(void *)(v6 + 48) + v28);
      uint64_t v30 = *(void *)(*(void *)(v6 + 56) + v28);
      if ((a2 & 1) == 0) {
        swift_bridgeObjectRetain();
      }
      sub_25EA36530();
      sub_25EA36540();
      uint64_t result = sub_25EA36560();
      uint64_t v14 = -1 << *(unsigned char *)(v8 + 32);
      unint64_t v15 = result & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v26 = v16 == v25;
          if (v16 == v25) {
            unint64_t v16 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v13 + 8 * v16);
        }
        while (v27 == -1);
        unint64_t v17 = __clz(__rbit64(~v27)) + (v16 << 6);
      }
      *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      uint64_t v18 = 8 * v17;
      *(void *)(*(void *)(v8 + 48) + v18) = v29;
      *(void *)(*(void *)(v8 + 56) + v18) = v30;
      ++*(void *)(v8 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *unint64_t v4 = v8;
  return result;
}

uint64_t sub_25EA09C34(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_25EA0C01C(0, &qword_26A727C30);
  char v34 = a2;
  uint64_t result = sub_25EA36440();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    BOOL v33 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v32 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v18 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v19 = v18 | (v8 << 6);
      }
      else
      {
        int64_t v20 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v20 >= v32) {
          goto LABEL_33;
        }
        unint64_t v21 = v33[v20];
        ++v8;
        if (!v21)
        {
          int64_t v8 = v20 + 1;
          if (v20 + 1 >= v32) {
            goto LABEL_33;
          }
          unint64_t v21 = v33[v8];
          if (!v21)
          {
            int64_t v22 = v20 + 2;
            if (v22 >= v32)
            {
LABEL_33:
              if ((v34 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v2;
                goto LABEL_40;
              }
              uint64_t v31 = 1 << *(unsigned char *)(v5 + 32);
              if (v31 >= 64) {
                bzero(v33, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *BOOL v33 = -1 << v31;
              }
              uint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v21 = v33[v22];
            if (!v21)
            {
              while (1)
              {
                int64_t v8 = v22 + 1;
                if (__OFADD__(v22, 1)) {
                  goto LABEL_42;
                }
                if (v8 >= v32) {
                  goto LABEL_33;
                }
                unint64_t v21 = v33[v8];
                ++v22;
                if (v21) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v22;
          }
        }
LABEL_30:
        unint64_t v11 = (v21 - 1) & v21;
        unint64_t v19 = __clz(__rbit64(v21)) + (v8 << 6);
      }
      uint64_t v27 = *(void *)(*(void *)(v5 + 48) + 8 * v19);
      uint64_t v28 = (uint64_t *)(*(void *)(v5 + 56) + 16 * v19);
      uint64_t v29 = *v28;
      uint64_t v30 = v28[1];
      if ((v34 & 1) == 0) {
        swift_bridgeObjectRetain();
      }
      sub_25EA36530();
      sub_25EA36540();
      uint64_t result = sub_25EA36560();
      uint64_t v13 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v14 = result & ~v13;
      unint64_t v15 = v14 >> 6;
      if (((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v25 = v15 == v24;
          if (v15 == v24) {
            unint64_t v15 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v12 + 8 * v15);
        }
        while (v26 == -1);
        unint64_t v16 = __clz(__rbit64(~v26)) + (v15 << 6);
      }
      *(void *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      *(void *)(*(void *)(v7 + 48) + 8 * v16) = v27;
      unint64_t v17 = (void *)(*(void *)(v7 + 56) + 16 * v16);
      *unint64_t v17 = v29;
      v17[1] = v30;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_25EA09F28(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_25EA0C01C(0, (unint64_t *)&qword_26A7276D0);
  uint64_t result = sub_25EA36440();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    char v32 = a2;
    int64_t v8 = 0;
    BOOL v33 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v12 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v13 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v16 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v17 = v16 | (v8 << 6);
      }
      else
      {
        int64_t v18 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v18 >= v12) {
          goto LABEL_31;
        }
        unint64_t v19 = v33[v18];
        ++v8;
        if (!v19)
        {
          int64_t v8 = v18 + 1;
          if (v18 + 1 >= v12) {
            goto LABEL_31;
          }
          unint64_t v19 = v33[v8];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v12)
            {
LABEL_31:
              if ((v32 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v2;
                goto LABEL_38;
              }
              uint64_t v31 = 1 << *(unsigned char *)(v5 + 32);
              if (v31 >= 64) {
                bzero(v33, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *BOOL v33 = -1 << v31;
              }
              uint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v19 = v33[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v8 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_40;
                }
                if (v8 >= v12) {
                  goto LABEL_31;
                }
                unint64_t v19 = v33[v8];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v8 = v20;
          }
        }
LABEL_21:
        unint64_t v11 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v8 << 6);
      }
      uint64_t v21 = 8 * v17;
      uint64_t v22 = *(void *)(*(void *)(v5 + 48) + v21);
      uint64_t v23 = *(void *)(*(void *)(v5 + 56) + v21);
      sub_25EA36530();
      sub_25EA36540();
      uint64_t result = sub_25EA36560();
      uint64_t v24 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v25 = result & ~v24;
      unint64_t v26 = v25 >> 6;
      if (((-1 << v25) & ~*(void *)(v13 + 8 * (v25 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v25) & ~*(void *)(v13 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v27 = 0;
        unint64_t v28 = (unint64_t)(63 - v24) >> 6;
        do
        {
          if (++v26 == v28 && (v27 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v29 = v26 == v28;
          if (v26 == v28) {
            unint64_t v26 = 0;
          }
          v27 |= v29;
          uint64_t v30 = *(void *)(v13 + 8 * v26);
        }
        while (v30 == -1);
        unint64_t v14 = __clz(__rbit64(~v30)) + (v26 << 6);
      }
      *(void *)(v13 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      uint64_t v15 = 8 * v14;
      *(void *)(*(void *)(v7 + 48) + v15) = v22;
      *(void *)(*(void *)(v7 + 56) + v15) = v23;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_38:
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_25EA0A204(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_25EA0C01C(0, &qword_26A727B60);
  uint64_t result = sub_25EA36440();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    char v32 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v31 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v18 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v19 = v18 | (v8 << 6);
      }
      else
      {
        int64_t v20 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v20 >= v31) {
          goto LABEL_33;
        }
        unint64_t v21 = v32[v20];
        ++v8;
        if (!v21)
        {
          int64_t v8 = v20 + 1;
          if (v20 + 1 >= v31) {
            goto LABEL_33;
          }
          unint64_t v21 = v32[v8];
          if (!v21)
          {
            int64_t v22 = v20 + 2;
            if (v22 >= v31)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v2;
                goto LABEL_40;
              }
              uint64_t v30 = 1 << *(unsigned char *)(v5 + 32);
              if (v30 >= 64) {
                bzero(v32, ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *char v32 = -1 << v30;
              }
              uint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v21 = v32[v22];
            if (!v21)
            {
              while (1)
              {
                int64_t v8 = v22 + 1;
                if (__OFADD__(v22, 1)) {
                  goto LABEL_42;
                }
                if (v8 >= v31) {
                  goto LABEL_33;
                }
                unint64_t v21 = v32[v8];
                ++v22;
                if (v21) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v22;
          }
        }
LABEL_30:
        unint64_t v11 = (v21 - 1) & v21;
        unint64_t v19 = __clz(__rbit64(v21)) + (v8 << 6);
      }
      uint64_t v27 = 8 * v19;
      uint64_t v28 = *(void *)(*(void *)(v5 + 48) + v27);
      uint64_t v29 = *(void *)(*(void *)(v5 + 56) + v27);
      if ((a2 & 1) == 0) {
        swift_bridgeObjectRetain();
      }
      sub_25EA36530();
      sub_25EA36540();
      uint64_t result = sub_25EA36560();
      uint64_t v13 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v14 = result & ~v13;
      unint64_t v15 = v14 >> 6;
      if (((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v25 = v15 == v24;
          if (v15 == v24) {
            unint64_t v15 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v12 + 8 * v15);
        }
        while (v26 == -1);
        unint64_t v16 = __clz(__rbit64(~v26)) + (v15 << 6);
      }
      *(void *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      uint64_t v17 = 8 * v16;
      *(void *)(*(void *)(v7 + 48) + v17) = v28;
      *(void *)(*(void *)(v7 + 56) + v17) = v29;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_25EA0A4EC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_25EA06A10();
  char v34 = a2;
  uint64_t result = sub_25EA36440();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    BOOL v33 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v32 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v19 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v20 = v19 | (v8 << 6);
      }
      else
      {
        int64_t v21 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v21 >= v32) {
          goto LABEL_33;
        }
        unint64_t v22 = v33[v21];
        ++v8;
        if (!v22)
        {
          int64_t v8 = v21 + 1;
          if (v21 + 1 >= v32) {
            goto LABEL_33;
          }
          unint64_t v22 = v33[v8];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v32)
            {
LABEL_33:
              if ((v34 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v2;
                goto LABEL_40;
              }
              uint64_t v31 = 1 << *(unsigned char *)(v5 + 32);
              if (v31 >= 64) {
                bzero(v33, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *BOOL v33 = -1 << v31;
              }
              uint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v22 = v33[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v8 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_42;
                }
                if (v8 >= v32) {
                  goto LABEL_33;
                }
                unint64_t v22 = v33[v8];
                ++v23;
                if (v22) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v23;
          }
        }
LABEL_30:
        unint64_t v11 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v8 << 6);
      }
      uint64_t v28 = *(void *)(v5 + 48) + 24 * v20;
      uint64_t v29 = *(void *)v28;
      long long v35 = *(_OWORD *)(v28 + 8);
      uint64_t v30 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
      if ((v34 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      sub_25EA36530();
      sub_25EA36540();
      uint64_t result = sub_25EA36560();
      uint64_t v13 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v14 = result & ~v13;
      unint64_t v15 = v14 >> 6;
      if (((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
        long long v17 = v35;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v13) >> 6;
        long long v17 = v35;
        do
        {
          if (++v15 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v26 = v15 == v25;
          if (v15 == v25) {
            unint64_t v15 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v12 + 8 * v15);
        }
        while (v27 == -1);
        unint64_t v16 = __clz(__rbit64(~v27)) + (v15 << 6);
      }
      *(void *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      uint64_t v18 = *(void *)(v7 + 48) + 24 * v16;
      *(void *)uint64_t v18 = v29;
      *(_OWORD *)(v18 + 8) = v17;
      *(void *)(*(void *)(v7 + 56) + 8 * v16) = v30;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_25EA0A7F4(uint64_t a1, char a2)
{
  return sub_25EA0A824(a1, a2, &qword_26A727BE8, (unint64_t *)&qword_26A727BC8, (uint64_t)&protocol descriptor for RegisteredDependency, (void (*)(uint64_t, unsigned char *))sub_25E9F9FD0);
}

uint64_t sub_25EA0A824(uint64_t a1, char a2, unint64_t *a3, unint64_t *a4, uint64_t a5, void (*a6)(uint64_t, unsigned char *))
{
  int64_t v8 = v6;
  uint64_t v10 = *v6;
  sub_25EA0669C(0, a3, a4);
  char v39 = a2;
  uint64_t result = sub_25EA36440();
  uint64_t v12 = result;
  if (*(void *)(v10 + 16))
  {
    int64_t v13 = 0;
    BOOL v38 = (void *)(v10 + 64);
    uint64_t v14 = 1 << *(unsigned char *)(v10 + 32);
    if (v14 < 64) {
      uint64_t v15 = ~(-1 << v14);
    }
    else {
      uint64_t v15 = -1;
    }
    unint64_t v16 = v15 & *(void *)(v10 + 64);
    int64_t v37 = (unint64_t)(v14 + 63) >> 6;
    uint64_t v17 = result + 64;
    while (1)
    {
      if (v16)
      {
        unint64_t v21 = __clz(__rbit64(v16));
        v16 &= v16 - 1;
        unint64_t v22 = v21 | (v13 << 6);
      }
      else
      {
        int64_t v23 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_42:
          __break(1u);
LABEL_43:
          __break(1u);
          return result;
        }
        uint64_t result = v10 + 64;
        if (v23 >= v37) {
          goto LABEL_34;
        }
        unint64_t v24 = v38[v23];
        ++v13;
        if (!v24)
        {
          int64_t v13 = v23 + 1;
          if (v23 + 1 >= v37) {
            goto LABEL_34;
          }
          unint64_t v24 = v38[v13];
          if (!v24)
          {
            int64_t v25 = v23 + 2;
            if (v25 >= v37)
            {
LABEL_34:
              if ((v39 & 1) == 0)
              {
                uint64_t result = swift_release();
                int64_t v8 = v6;
                goto LABEL_41;
              }
              uint64_t v36 = 1 << *(unsigned char *)(v10 + 32);
              if (v36 >= 64) {
                bzero(v38, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *BOOL v38 = -1 << v36;
              }
              int64_t v8 = v6;
              *(void *)(v10 + 16) = 0;
              break;
            }
            unint64_t v24 = v38[v25];
            if (!v24)
            {
              while (1)
              {
                int64_t v13 = v25 + 1;
                if (__OFADD__(v25, 1)) {
                  goto LABEL_43;
                }
                if (v13 >= v37) {
                  goto LABEL_34;
                }
                unint64_t v24 = v38[v13];
                ++v25;
                if (v24) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v13 = v25;
          }
        }
LABEL_21:
        unint64_t v16 = (v24 - 1) & v24;
        unint64_t v22 = __clz(__rbit64(v24)) + (v13 << 6);
      }
      uint64_t v26 = *(void *)(v10 + 48) + 24 * v22;
      uint64_t v27 = *(void *)v26;
      uint64_t v28 = *(void *)(v10 + 56) + 40 * v22;
      long long v40 = *(_OWORD *)(v26 + 8);
      if (v39)
      {
        a6(v28, v41);
      }
      else
      {
        sub_25E9EFBCC(v28, (uint64_t)v41);
        swift_bridgeObjectRetain();
      }
      sub_25EA36530();
      sub_25EA36540();
      uint64_t result = sub_25EA36560();
      uint64_t v29 = -1 << *(unsigned char *)(v12 + 32);
      unint64_t v30 = result & ~v29;
      unint64_t v31 = v30 >> 6;
      if (((-1 << v30) & ~*(void *)(v17 + 8 * (v30 >> 6))) != 0)
      {
        unint64_t v18 = __clz(__rbit64((-1 << v30) & ~*(void *)(v17 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
        long long v19 = v40;
      }
      else
      {
        char v32 = 0;
        unint64_t v33 = (unint64_t)(63 - v29) >> 6;
        long long v19 = v40;
        do
        {
          if (++v31 == v33 && (v32 & 1) != 0)
          {
            __break(1u);
            goto LABEL_42;
          }
          BOOL v34 = v31 == v33;
          if (v31 == v33) {
            unint64_t v31 = 0;
          }
          v32 |= v34;
          uint64_t v35 = *(void *)(v17 + 8 * v31);
        }
        while (v35 == -1);
        unint64_t v18 = __clz(__rbit64(~v35)) + (v31 << 6);
      }
      *(void *)(v17 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      uint64_t v20 = *(void *)(v12 + 48) + 24 * v18;
      *(void *)uint64_t v20 = v27;
      *(_OWORD *)(v20 + 8) = v19;
      uint64_t result = ((uint64_t (*)(unsigned char *, unint64_t))a6)(v41, *(void *)(v12 + 56) + 40 * v18);
      ++*(void *)(v12 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_41:
  *int64_t v8 = v12;
  return result;
}

uint64_t sub_25EA0AB58(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_25EA06504(0, (unint64_t *)&qword_26A727BE0, MEMORY[0x263F8DFB0]);
  uint64_t result = sub_25EA36440();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    unint64_t v30 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v12 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v13 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v15 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v16 = v15 | (v8 << 6);
      }
      else
      {
        int64_t v17 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v17 >= v12) {
          goto LABEL_34;
        }
        unint64_t v18 = v30[v17];
        ++v8;
        if (!v18)
        {
          int64_t v8 = v17 + 1;
          if (v17 + 1 >= v12) {
            goto LABEL_34;
          }
          unint64_t v18 = v30[v8];
          if (!v18)
          {
            int64_t v19 = v17 + 2;
            if (v19 >= v12)
            {
LABEL_34:
              if (a2)
              {
                uint64_t v29 = 1 << *(unsigned char *)(v5 + 32);
                if (v29 >= 64) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v30 = -1 << v29;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v18 = v30[v19];
            if (!v18)
            {
              while (1)
              {
                int64_t v8 = v19 + 1;
                if (__OFADD__(v19, 1)) {
                  goto LABEL_42;
                }
                if (v8 >= v12) {
                  goto LABEL_34;
                }
                unint64_t v18 = v30[v8];
                ++v19;
                if (v18) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v8 = v19;
          }
        }
LABEL_21:
        unint64_t v11 = (v18 - 1) & v18;
        unint64_t v16 = __clz(__rbit64(v18)) + (v8 << 6);
      }
      uint64_t v20 = *(void *)(*(void *)(v5 + 48) + 8 * v16);
      unint64_t v21 = (long long *)(*(void *)(v5 + 56) + 40 * v16);
      if (a2) {
        sub_25E9F9FD0(v21, (uint64_t)v31);
      }
      else {
        sub_25E9EFBCC((uint64_t)v21, (uint64_t)v31);
      }
      uint64_t result = sub_25EA36520();
      uint64_t v22 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v13 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v23) & ~*(void *)(v13 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v13 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v14 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v13 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      *(void *)(*(void *)(v7 + 48) + 8 * v14) = v20;
      uint64_t result = sub_25E9F9FD0(v31, *(void *)(v7 + 56) + 40 * v14);
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_25EA0AE38(uint64_t a1, char a2)
{
  return sub_25EA0AE74(a1, a2, (unint64_t *)&qword_26A727BB8, (uint64_t)&qword_26A727BC0, MEMORY[0x263F8D060], (void (*)(uint64_t, uint64_t, uint64_t))sub_25EA06504);
}

uint64_t sub_25EA0AE74(uint64_t a1, char a2, unint64_t *a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v7 = v6;
  uint64_t v9 = *v6;
  sub_25EA0B8D8(0, a3, a4, a5, a6);
  char v38 = a2;
  uint64_t result = sub_25EA36440();
  uint64_t v11 = result;
  if (*(void *)(v9 + 16))
  {
    int64_t v12 = 0;
    int64_t v37 = (void *)(v9 + 64);
    uint64_t v13 = 1 << *(unsigned char *)(v9 + 32);
    if (v13 < 64) {
      uint64_t v14 = ~(-1 << v13);
    }
    else {
      uint64_t v14 = -1;
    }
    unint64_t v15 = v14 & *(void *)(v9 + 64);
    int64_t v36 = (unint64_t)(v13 + 63) >> 6;
    uint64_t v16 = result + 64;
    while (1)
    {
      if (v15)
      {
        unint64_t v23 = __clz(__rbit64(v15));
        v15 &= v15 - 1;
        unint64_t v24 = v23 | (v12 << 6);
      }
      else
      {
        int64_t v25 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        uint64_t result = v9 + 64;
        if (v25 >= v36) {
          goto LABEL_33;
        }
        unint64_t v26 = v37[v25];
        ++v12;
        if (!v26)
        {
          int64_t v12 = v25 + 1;
          if (v25 + 1 >= v36) {
            goto LABEL_33;
          }
          unint64_t v26 = v37[v12];
          if (!v26)
          {
            int64_t v27 = v25 + 2;
            if (v27 >= v36)
            {
LABEL_33:
              if ((v38 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v7 = v6;
                goto LABEL_40;
              }
              uint64_t v35 = 1 << *(unsigned char *)(v9 + 32);
              if (v35 >= 64) {
                bzero(v37, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *int64_t v37 = -1 << v35;
              }
              uint64_t v7 = v6;
              *(void *)(v9 + 16) = 0;
              break;
            }
            unint64_t v26 = v37[v27];
            if (!v26)
            {
              while (1)
              {
                int64_t v12 = v27 + 1;
                if (__OFADD__(v27, 1)) {
                  goto LABEL_42;
                }
                if (v12 >= v36) {
                  goto LABEL_33;
                }
                unint64_t v26 = v37[v12];
                ++v27;
                if (v26) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v12 = v27;
          }
        }
LABEL_30:
        unint64_t v15 = (v26 - 1) & v26;
        unint64_t v24 = __clz(__rbit64(v26)) + (v12 << 6);
      }
      uint64_t v32 = *(void *)(v9 + 48) + 24 * v24;
      uint64_t v33 = *(void *)v32;
      long long v39 = *(_OWORD *)(v32 + 8);
      uint64_t v34 = *(void *)(*(void *)(v9 + 56) + 8 * v24);
      if ((v38 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      sub_25EA36530();
      sub_25EA36540();
      uint64_t result = sub_25EA36560();
      uint64_t v17 = -1 << *(unsigned char *)(v11 + 32);
      unint64_t v18 = result & ~v17;
      unint64_t v19 = v18 >> 6;
      if (((-1 << v18) & ~*(void *)(v16 + 8 * (v18 >> 6))) != 0)
      {
        unint64_t v20 = __clz(__rbit64((-1 << v18) & ~*(void *)(v16 + 8 * (v18 >> 6)))) | v18 & 0x7FFFFFFFFFFFFFC0;
        long long v21 = v39;
      }
      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v17) >> 6;
        long long v21 = v39;
        do
        {
          if (++v19 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v30 = v19 == v29;
          if (v19 == v29) {
            unint64_t v19 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v16 + 8 * v19);
        }
        while (v31 == -1);
        unint64_t v20 = __clz(__rbit64(~v31)) + (v19 << 6);
      }
      *(void *)(v16 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
      uint64_t v22 = *(void *)(v11 + 48) + 24 * v20;
      *(void *)uint64_t v22 = v33;
      *(_OWORD *)(v22 + 8) = v21;
      *(void *)(*(void *)(v11 + 56) + 8 * v20) = v34;
      ++*(void *)(v11 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *uint64_t v7 = v11;
  return result;
}

uint64_t sub_25EA0B190(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  return sub_25EA0B470(a1, a2, a3, a4, a5, a6, (uint64_t (*)(uint64_t, uint64_t))sub_25E9F9FD0);
}

unint64_t sub_25EA0B1A8(unint64_t result, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(result >> 6) + 8] |= 1 << result;
  uint64_t v4 = 8 * result;
  *(void *)(a4[6] + v4) = a2;
  *(void *)(a4[7] + v4) = a3;
  uint64_t v5 = a4[2];
  BOOL v6 = __OFADD__(v5, 1);
  uint64_t v7 = v5 + 1;
  if (v6) {
    __break(1u);
  }
  else {
    a4[2] = v7;
  }
  return result;
}

uint64_t sub_25EA0B1F4(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = type metadata accessor for ScopeGraphElement.ID(0);
  sub_25E9FD284(a2, v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1);
  uint64_t v10 = a4[7];
  sub_25EA0BE84(0, &qword_26A7276A0, type metadata accessor for ScopeGraphElement, (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for Vertex);
  uint64_t result = sub_25EA0B7D4(a3, v10 + *(void *)(*(void *)(v11 - 8) + 72) * a1);
  uint64_t v13 = a4[2];
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    a4[2] = v15;
  }
  return result;
}

uint64_t sub_25EA0B2E8(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  a6[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v9 = (void *)(a6[6] + 24 * a1);
  *uint64_t v9 = a2;
  v9[1] = a3;
  void v9[2] = a4;
  uint64_t v10 = a6[7];
  uint64_t v11 = type metadata accessor for ScopeGraphElement.ID(0);
  uint64_t result = sub_25E9FD284(a5, v10 + *(void *)(*(void *)(v11 - 8) + 72) * a1);
  uint64_t v13 = a6[2];
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    a6[2] = v15;
  }
  return result;
}

uint64_t sub_25EA0B388(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = type metadata accessor for ScopeGraphElement.ID(0);
  uint64_t result = sub_25E9FD284(a2, v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1);
  *(void *)(a4[7] + 8 * a1) = a3;
  uint64_t v11 = a4[2];
  BOOL v12 = __OFADD__(v11, 1);
  uint64_t v13 = v11 + 1;
  if (v12) {
    __break(1u);
  }
  else {
    a4[2] = v13;
  }
  return result;
}

unint64_t sub_25EA0B428(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  *(void *)(a5[6] + 8 * result) = a2;
  uint64_t v5 = (void *)(a5[7] + 16 * result);
  *uint64_t v5 = a3;
  v5[1] = a4;
  uint64_t v6 = a5[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a5[2] = v8;
  }
  return result;
}

uint64_t sub_25EA0B470(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t (*a7)(uint64_t, uint64_t))
{
  a6[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = (void *)(a6[6] + 24 * a1);
  *uint64_t v8 = a2;
  v8[1] = a3;
  void v8[2] = a4;
  uint64_t result = a7(a5, a6[7] + 40 * a1);
  uint64_t v10 = a6[2];
  BOOL v11 = __OFADD__(v10, 1);
  uint64_t v12 = v10 + 1;
  if (v11) {
    __break(1u);
  }
  else {
    a6[2] = v12;
  }
  return result;
}

uint64_t sub_25EA0B4EC(unint64_t a1, uint64_t a2, long long *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(void *)(a4[6] + 8 * a1) = a2;
  uint64_t result = sub_25E9F9FD0(a3, a4[7] + 40 * a1);
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

unint64_t sub_25EA0B558(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  a6[(result >> 6) + 8] |= 1 << result;
  uint64_t v6 = (void *)(a6[6] + 24 * result);
  *uint64_t v6 = a2;
  v6[1] = a3;
  void v6[2] = a4;
  *(void *)(a6[7] + 8 * result) = a5;
  uint64_t v7 = a6[2];
  BOOL v8 = __OFADD__(v7, 1);
  uint64_t v9 = v7 + 1;
  if (v8) {
    __break(1u);
  }
  else {
    a6[2] = v9;
  }
  return result;
}

ValueMetadata *type metadata accessor for RuleSet()
{
  return &type metadata for RuleSet;
}

void sub_25EA0B5B8()
{
  if (!qword_26A727B88)
  {
    type metadata accessor for ScopeGraphElement.ID(255);
    sub_25EA061F0();
    sub_25EA05B40(&qword_26A727668, (void (*)(uint64_t))type metadata accessor for ScopeGraphElement.ID);
    unint64_t v0 = sub_25EA36460();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A727B88);
    }
  }
}

void sub_25EA0B664()
{
  if (!qword_26A727B80)
  {
    type metadata accessor for ScopeGraphElement.ID(255);
    sub_25EA0BE84(255, &qword_26A7276A0, type metadata accessor for ScopeGraphElement, (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for Vertex);
    sub_25EA05B40(&qword_26A727668, (void (*)(uint64_t))type metadata accessor for ScopeGraphElement.ID);
    unint64_t v0 = sub_25EA36460();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A727B80);
    }
  }
}

uint64_t sub_25EA0B740(uint64_t a1, uint64_t a2)
{
  sub_25EA0BE84(0, &qword_26A7276A0, type metadata accessor for ScopeGraphElement, (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for Vertex);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25EA0B7D4(uint64_t a1, uint64_t a2)
{
  sub_25EA0BE84(0, &qword_26A7276A0, type metadata accessor for ScopeGraphElement, (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for Vertex);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_25EA0B868(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v6 = sub_25E9FAE98(255, &qword_26A7276E8);
    unint64_t v7 = a3(a1, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

void sub_25EA0B8D8(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    a5(255, a3, a4);
    sub_25EA064B0();
    unint64_t v6 = sub_25EA36460();
    if (!v7) {
      atomic_store(v6, a2);
    }
  }
}

uint64_t sub_25EA0B950(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 40 * a1 + 32;
    unint64_t v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      sub_25E9FAE98(0, &qword_26A7276E8);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_25EA36470();
  __break(1u);
  return result;
}

void sub_25EA0BA6C()
{
  if (!qword_26A727CE0)
  {
    type metadata accessor for ScopeGraphElement.ID(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_26A727CE0);
    }
  }
}

uint64_t sub_25EA0BAD4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_25EA36470();
  __break(1u);
  return result;
}

char *sub_25EA0BBC8(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_25EA36470();
  __break(1u);
  return result;
}

uint64_t sub_25EA0BCB4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = *(void *)(a5(0) - 8);
    uint64_t v10 = a4 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v11 = *(void *)(v9 + 72);
    unint64_t v12 = v10 + v11 * a1;
    unint64_t v13 = a3 + v11 * v5;
    if (v12 >= v13 || v12 + v11 * v5 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  uint64_t result = sub_25EA36470();
  __break(1u);
  return result;
}

void sub_25EA0BE10(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, uint64_t, unint64_t))
{
  if (!*a2)
  {
    uint64_t v6 = type metadata accessor for ScopeGraphElement.ID(255);
    unint64_t v7 = sub_25EA06020();
    unint64_t v8 = a3(a1, &type metadata for RuleIdentifier, v6, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

void sub_25EA0BE84(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

char *sub_25EA0BEE8(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + 16 * a1 + 32);
    size_t v6 = 16 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_25EA36470();
  __break(1u);
  return result;
}

void sub_25EA0BFD4(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_25EA36490();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

void sub_25EA0C01C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    sub_25E9F9C34();
    unint64_t v3 = sub_25EA36460();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

uint64_t type metadata accessor for TypedDictionary()
{
  return sub_25E9ED2B4();
}

uint64_t sub_25EA0C098()
{
  return swift_getWitnessTable();
}

uint64_t sub_25EA0C0E0(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_25EA064B0();
  return MEMORY[0x270F9D060](a1, &type metadata for TypeIdentifier, a2, v4);
}

uint64_t sub_25EA0C12C(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_25EA064B0();
  return MEMORY[0x270F9D078](a1, &type metadata for TypeIdentifier, a2, v4);
}

uint64_t sub_25EA0C188(uint64_t a1)
{
  return sub_25EA0C12C(*v1, *(void *)(a1 + 16));
}

uint64_t sub_25EA0C198(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_25EA064B0();
  return MEMORY[0x270F9D0A0](a1, &type metadata for TypeIdentifier, a2, v4);
}

uint64_t sub_25EA0C1E4(uint64_t a1)
{
  return sub_25EA0C198(*v1, *(void *)(a1 + 16));
}

uint64_t sub_25EA0C1F4()
{
  sub_25EA064B0();
  return sub_25EA360E0();
}

uint64_t sub_25EA0C258()
{
  sub_25EA064B0();
  swift_bridgeObjectRetain();
  sub_25EA360D0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25EA0C2D8()
{
  return sub_25EA36560();
}

uint64_t sub_25EA0C338(uint64_t a1)
{
  return sub_25EA0C0E0(*v1, *(void *)(a1 + 16));
}

uint64_t sub_25EA0C348()
{
  return sub_25EA0C1F4();
}

uint64_t sub_25EA0C35C()
{
  return sub_25EA0C2D8();
}

uint64_t sub_25EA0C370()
{
  return sub_25EA0C258();
}

uint64_t sub_25EA0C384()
{
  return sub_25EA36560();
}

uint64_t sub_25EA0C3DC()
{
  return 0x3D746E657645;
}

uint64_t sub_25EA0C4A4(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = a1[9];
  uint64_t v11 = *a1;
  long long v5 = *(_OWORD *)(a1 + 3);
  long long v12 = *(_OWORD *)(a1 + 1);
  long long v13 = v5;
  long long v14 = *(_OWORD *)(a1 + 5);
  long long v15 = *(_OWORD *)(a1 + 7);
  uint64_t v16 = v4;
  sub_25E9F01A0(v2, (uint64_t)&v17);
  if (!v18) {
    return sub_25E9FD128((uint64_t)&v17);
  }
  sub_25E9F9FD0(&v17, (uint64_t)&v11);
  sub_25E9EFBCC((uint64_t)&v11, (uint64_t)v10);
  sub_25E9FD1DC();
  swift_getExtendedExistentialTypeMetadata();
  if (!swift_dynamicCast()) {
    return sub_25E9EF02C((uint64_t)&v11);
  }
  sub_25E9F9FD0(&v9, (uint64_t)&v17);
  uint64_t v6 = v18;
  uint64_t v7 = v19;
  sub_25E9EFC30(&v17, v18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24))(a2, v6, v7);
  sub_25E9EF02C((uint64_t)&v11);
  return sub_25E9EF02C((uint64_t)&v17);
}

uint64_t sub_25EA0C610(uint64_t *a1, uint64_t a2)
{
  return sub_25EA0C4A4(a1, a2);
}

uint64_t sub_25EA0C638(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25EA0C64C);
}

uint64_t sub_25EA0C64C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ScopeGraphElement.ID(0);
  long long v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t sub_25EA0C6B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25EA0C6CC);
}

uint64_t sub_25EA0C6CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ScopeGraphElement.ID(0);
  long long v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for EventHandlingRuleUpdate()
{
  return sub_25E9ED2B4();
}

uint64_t sub_25EA0C754()
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

uint64_t sub_25EA0C7E8(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(*(void *)(*(void *)v2 + 80) - 8) + 32))(v2 + *(void *)(*(void *)v2 + 96), a1);
  return v2;
}

uint64_t sub_25EA0C87C()
{
  (*(void (**)(uint64_t))(*(void *)(*(void *)(*(void *)v0 + 80) - 8) + 8))(v0 + *(void *)(*(void *)v0 + 96));
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t type metadata accessor for ExplicitEventHandlerUpdate()
{
  return sub_25E9ED2B4();
}

uint64_t sub_25EA0C940()
{
  return sub_25EA0CAB4();
}

uint64_t sub_25EA0C94C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *(void *)(*v2 + 80);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v8 = (char *)v10 - v7;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)v10 - v7, (uint64_t)v2 + *(void *)(v4 + 96), v5);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 + 88) + 24))(a2, v5);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_25EA0CA90(uint64_t a1, uint64_t a2)
{
  return sub_25EA0C94C(a1, a2);
}

uint64_t sub_25EA0CAB4()
{
  return 0x3D746E657645;
}

uint64_t sub_25EA0CB98@<X0>(void *a1@<X8>)
{
  return static DependencyKey.ruleSet.getter(a1);
}

uint64_t static DependencyKey.ruleSet.getter@<X0>(void *a1@<X8>)
{
  if (qword_26A7274D0 != -1) {
    swift_once();
  }
  *a1 = qword_26A727CC8;
  return swift_bridgeObjectRetain();
}

uint64_t sub_25EA0CC1C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  return static DependencyKey.source(in:)(a1, a2, a3);
}

uint64_t static DependencyKey.source(in:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  unint64_t v8 = (char *)&v11 - v7;
  (*(void (**)(uint64_t, uint64_t))(a2 + 16))(a1, a2);
  a3[3] = type metadata accessor for StaticTruth();
  a3[4] = swift_getWitnessTable();
  long long v9 = sub_25E9F9FE8(a3);
  return StaticTruth.init(state:)((uint64_t)v8, AssociatedTypeWitness, (uint64_t)v9);
}

uint64_t dispatch thunk of static DependencyKey.defaultValue.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of static DependencyKey.ruleSet.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of static DependencyKey.source(in:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t destroy for TypeIdentifier()
{
  return swift_bridgeObjectRelease();
}

void *_s9TeaBreeze14TypeIdentifierVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for TypeIdentifier(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

__n128 initializeWithTake for RuleIdentifier(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for TypeIdentifier(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for TypeIdentifier(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TypeIdentifier(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TypeIdentifier()
{
  return &type metadata for TypeIdentifier;
}

uint64_t sub_25EA0CEF8()
{
  return sub_25EA365C0();
}

uint64_t sub_25EA0CF28()
{
  uint64_t v1 = sub_25EA36590();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25E9EE69C(0, &qword_26A727638, MEMORY[0x263F8E818], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v10 - v6;
  uint64_t v12 = *v0;
  long long v10 = *(_OWORD *)(v0 + 1);
  long long v13 = v10;
  uint64_t v11 = MEMORY[0x263F8EE78];
  uint64_t v8 = sub_25EA36580();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F8E830], v1);
  sub_25E9EE69C(0, &qword_26A727640, (uint64_t (*)(uint64_t))sub_25E9EE700, MEMORY[0x263F8D488]);
  sub_25E9EE7C8();
  swift_bridgeObjectRetain();
  return sub_25EA365A0();
}

BOOL sub_25EA0D14C(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 16) == *(void *)(a2 + 16);
}

unint64_t sub_25EA0D164()
{
  unint64_t result = qword_26A727E88;
  if (!qword_26A727E88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A727E88);
  }
  return result;
}

uint64_t sub_25EA0D1B8()
{
  return sub_25EA36560();
}

uint64_t sub_25EA0D200()
{
  return sub_25EA36540();
}

uint64_t sub_25EA0D22C()
{
  return sub_25EA36560();
}

uint64_t EnvironmentValues.scope.getter()
{
  sub_25E9ED260();
  return sub_25EA35FE0();
}

uint64_t EnvironmentValues.scope.setter()
{
  return sub_25EA35FF0();
}

void (*EnvironmentValues.scope.modify(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x60uLL);
  *a1 = v3;
  v3[10] = v1;
  v3[11] = sub_25E9ED260();
  sub_25EA35FE0();
  return sub_25EA0D37C;
}

void sub_25EA0D37C(void **a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (*a1)[1];
  v2[5] = **a1;
  uint64_t v4 = v2[2];
  v2[6] = v3;
  v2[7] = v4;
  *((_OWORD *)v2 + 4) = *(_OWORD *)(v2 + 3);
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    sub_25EA35FF0();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_25EA35FF0();
  }
  free(v2);
}

ValueMetadata *_s19ScopeEnvironmentKeyVMa()
{
  return &_s19ScopeEnvironmentKeyVN;
}

uint64_t sub_25EA0D464()
{
  v1[3] = &type metadata for KeyedDependencyContainer;
  v1[4] = &protocol witness table for KeyedDependencyContainer;
  v1[0] = MEMORY[0x263F8EE80];
  v1[1] = MEMORY[0x263F8EE80];
  static Scope.root(dependencyContainer:)((uint64_t)v1, (uint64_t)&qword_26A727E90);
  return sub_25E9EF02C((uint64_t)v1);
}

uint64_t sub_25EA0D4B8@<X0>(uint64_t a1@<X8>)
{
  if (qword_26A7274D8 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void *)algn_26A727E98;
  uint64_t v3 = qword_26A727EA0;
  *(void *)a1 = qword_26A727E90;
  *(void *)(a1 + 8) = v2;
  *(void *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 24) = unk_26A727EA8;
  swift_bridgeObjectRetain();
  swift_retain();
  return swift_retain();
}

uint64_t sub_25EA0D554(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8 = sub_25EA0D5B8();
  return MEMORY[0x270EFF9B8](a1, a2, a3, a4, v8);
}

unint64_t sub_25EA0D5B8()
{
  unint64_t result = qword_26A727EB8[0];
  if (!qword_26A727EB8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A727EB8);
  }
  return result;
}

uint64_t sub_25EA0D60C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 32);
  return v5(a2, a1, AssociatedTypeWitness);
}

uint64_t type metadata accessor for NonComparableDependencyKeyOperations()
{
  return sub_25E9ED2B4();
}

uint64_t sub_25EA0D704()
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for NonComparableAmbiguousDependencyKeyOperations()
{
  return sub_25E9ED2B4();
}

uint64_t type metadata accessor for EquatableDependencyKeyOperations()
{
  return sub_25E9ED2B4();
}

uint64_t sub_25EA0D848()
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_25EA0D93C(uint64_t *a1, uint64_t *a2)
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v6 = *(_DWORD *)(v5 + 80);
  if (v6 <= 7
    && *(void *)(*(void *)(AssociatedTypeWitness - 8) + 64) <= 0x18uLL
    && (*(_DWORD *)(v5 + 80) & 0x100000) == 0)
  {
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
  }
  else
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 + 16) & ~v6));
    swift_retain();
  }
  return a1;
}

uint64_t sub_25EA0DA74(uint64_t a1)
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 8);
  return v3(a1, AssociatedTypeWitness);
}

uint64_t sub_25EA0DB40(uint64_t a1, uint64_t a2)
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16))(a1, a2, AssociatedTypeWitness);
  return a1;
}

uint64_t sub_25EA0DC14(uint64_t a1, uint64_t a2)
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 24))(a1, a2, AssociatedTypeWitness);
  return a1;
}

uint64_t sub_25EA0DCE8(uint64_t a1, uint64_t a2)
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 32))(a1, a2, AssociatedTypeWitness);
  return a1;
}

uint64_t sub_25EA0DDBC(uint64_t a1, uint64_t a2)
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 40))(a1, a2, AssociatedTypeWitness);
  return a1;
}

uint64_t sub_25EA0DE90(unsigned __int16 *a1, unsigned int a2)
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v4 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(v4 + 64);
  if (!a2) {
    return 0;
  }
  if (a2 <= v5) {
    goto LABEL_19;
  }
  char v7 = 8 * v6;
  if (v6 <= 3)
  {
    unsigned int v9 = ((a2 - v5 + ~(-1 << v7)) >> v7) + 1;
    if (HIWORD(v9))
    {
      int v8 = *(_DWORD *)((char *)a1 + v6);
      if (!v8) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v9 > 0xFF)
    {
      int v8 = *(unsigned __int16 *)((char *)a1 + v6);
      if (!*(unsigned __int16 *)((char *)a1 + v6)) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v9 < 2)
    {
LABEL_19:
      if (v5)
      {
        uint64_t v11 = *(uint64_t (**)(unsigned __int16 *))(v4 + 48);
        return v11(a1);
      }
      return 0;
    }
  }
  int v8 = *((unsigned __int8 *)a1 + v6);
  if (!*((unsigned char *)a1 + v6)) {
    goto LABEL_19;
  }
LABEL_11:
  int v10 = (v8 - 1) << v7;
  if (v6 > 3) {
    int v10 = 0;
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
  return v5 + (v6 | v10) + 1;
}

void sub_25EA0E0A4(unsigned char *a1, uint64_t a2, unsigned int a3)
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v6 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  size_t v8 = *(void *)(v6 + 64);
  if (a3 <= v7)
  {
    int v9 = 0;
  }
  else if (v8 <= 3)
  {
    unsigned int v12 = ((a3 - v7 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
    if (HIWORD(v12))
    {
      int v9 = 4;
    }
    else if (v12 >= 0x100)
    {
      int v9 = 2;
    }
    else
    {
      int v9 = v12 > 1;
    }
  }
  else
  {
    int v9 = 1;
  }
  if (v7 < a2)
  {
    unsigned int v10 = ~v7 + a2;
    if (v8 < 4)
    {
      int v11 = (v10 >> (8 * v8)) + 1;
      if (v8)
      {
        int v13 = v10 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if (v8 == 3)
        {
          *(_WORD *)a1 = v13;
          a1[2] = BYTE2(v13);
        }
        else if (v8 == 2)
        {
          *(_WORD *)a1 = v13;
        }
        else
        {
          *a1 = v13;
        }
      }
    }
    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v10;
      int v11 = 1;
    }
    switch(v9)
    {
      case 1:
        a1[v8] = v11;
        return;
      case 2:
        *(_WORD *)&a1[v8] = v11;
        return;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v8] = v11;
        return;
      default:
        return;
    }
  }
  switch(v9)
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
      JUMPOUT(0x25EA0E32CLL);
    case 4:
      *(_DWORD *)&a1[v8] = 0;
      goto LABEL_20;
    default:
LABEL_20:
      if (a2)
      {
LABEL_21:
        long long v14 = *(void (**)(unsigned char *, uint64_t))(v6 + 56);
        v14(a1, a2);
      }
      return;
  }
}

uint64_t type metadata accessor for EquatableAmbiguousDependencyKeyOperations()
{
  return sub_25E9ED2B4();
}

uint64_t sub_25EA0E36C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 72);
  v8[0] = *a2;
  v8[1] = v5;
  long long v9 = *(_OWORD *)(a1 + 8);
  long long v10 = *(_OWORD *)(a1 + 24);
  long long v11 = *(_OWORD *)(a1 + 40);
  long long v12 = *(_OWORD *)(a1 + 56);
  uint64_t v13 = v6;
  return sub_25E9F5634(v8, a3, a4, a5);
}

uint64_t sub_25EA0E3D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t sub_25EA0E408@<X0>(uint64_t *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v5 = *a1;
  return sub_25EA23A08(&v5, a2, a3, a4);
}

uint64_t sub_25EA0E444@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return sub_25EA0E36C(a1, a2, *(void *)(a3 + 16), *(void *)(a3 + 24), a4);
}

uint64_t sub_25EA0E450(uint64_t a1, uint64_t a2)
{
  return sub_25EA0E3D4(a1, *(void *)(a2 + 16), *(void *)(a2 + 24));
}

uint64_t sub_25EA0E45C(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_25EA0E848(a1, a2, a3, a4, *(void *)(a7 + 16), a5, *(void *)(a7 + 24));
}

uint64_t sub_25EA0E46C@<X0>(uint64_t *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return sub_25EA0E408(a1, *(void *)(a2 + 16), *(void *)(a2 + 24), a3);
}

uint64_t sub_25EA0E478@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return sub_25EA0E520(a1, a2, a3, a4);
}

uint64_t sub_25EA0E490(uint64_t a1, uint64_t a2)
{
  return sub_25EA0E594(a1, a2);
}

uint64_t sub_25EA0E4A8(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_25EA0E5D0(a1, a2, a3, a4, a7);
}

uint64_t sub_25EA0E4D0@<X0>(uint64_t *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return sub_25EA0E680(a1, a2, a3);
}

uint64_t sub_25EA0E4E8(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_25EA0E6C8(a1, a2, a3, a4, *(void *)(a7 + 16), a5, *(void *)(a7 + 24));
}

uint64_t sub_25EA0E520@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 72);
  v8[0] = *a2;
  v8[1] = v5;
  long long v9 = *(_OWORD *)(a1 + 8);
  long long v10 = *(_OWORD *)(a1 + 24);
  long long v11 = *(_OWORD *)(a1 + 40);
  long long v12 = *(_OWORD *)(a1 + 56);
  uint64_t v13 = v6;
  return sub_25E9F5E94(v4, v8, *(void *)(a3 + 16), a4);
}

uint64_t sub_25EA0E594(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a2 + 24) + 24))(a1, v2);
}

uint64_t sub_25EA0E5D0(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = *a2;
  uint64_t v9 = sub_25EA18410(*(void *)(a5 + 16), v5);
  uint64_t v13 = v8;
  sub_25E9F4870(a1, v9, v10, v11, &v13, a3);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25EA0E680@<X0>(uint64_t *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v5 = *a1;
  return sub_25EA23C90(v3, &v5, *(void *)(a2 + 16), a3);
}

uint64_t sub_25EA0E6C8(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v21[1] = a4;
  v21[2] = a6;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v13 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  long long v15 = (char *)v21 - v14;
  uint64_t v16 = *a2;
  (*(void (**)(uint64_t, uint64_t))(a7 + 16))(a5, a7);
  uint64_t v17 = sub_25EA17FA8(a5, a5, a7);
  uint64_t v22 = v16;
  sub_25E9F4920(a1, (uint64_t)v15, v17, v18, v19, &v22, a3);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, AssociatedTypeWitness);
}

uint64_t sub_25EA0E848(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v9 = *a2;
  uint64_t v10 = sub_25EA17FA8(a5, a5, a7);
  uint64_t v14 = v9;
  sub_25E9F4870(a1, v10, v11, v12, &v14, a3);
  return swift_bridgeObjectRelease();
}

uint64_t View.truth<A>(_:_:definesNewScope:)(uint64_t *a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  uint64_t v19 = a5;
  uint64_t v18 = a4;
  uint64_t v8 = *(void *)(*MEMORY[0x263F8DE50] + *a1 + 8);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v11 = (char *)&v17 - v10;
  uint64_t v12 = type metadata accessor for TruthViewModifier();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  long long v15 = (char *)&v17 - v14;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  sub_25EA0EAEC(a1, (uint64_t)v11, a3, v15);
  swift_retain();
  MEMORY[0x2611E6FC0](v15, v18, v12, v19);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

uint64_t type metadata accessor for TruthViewModifier()
{
  return sub_25E9ED2B4();
}

double sub_25EA0EAEC@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, char *a4@<X8>)
{
  uint64_t v7 = *a1;
  *(void *)a4 = a1;
  uint64_t v8 = *(void *)(*MEMORY[0x263F8DE50] + v7 + 8);
  uint64_t v9 = (int *)type metadata accessor for TruthViewModifier();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(&a4[v9[7]], a2, v8);
  a4[v9[8]] = a3;
  uint64_t v10 = &a4[v9[9]];
  *(void *)uint64_t v10 = swift_getKeyPath();
  double result = 0.0;
  *(_OWORD *)(v10 + 8) = 0u;
  *(_OWORD *)(v10 + 24) = 0u;
  unsigned char v10[40] = 0;
  return result;
}

uint64_t View.truth<A>(_:_:disambiguation:definesNewScope:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v29 = a6;
  uint64_t v27 = a8;
  uint64_t v28 = a5;
  int v26 = a4;
  uint64_t v24 = a2;
  uint64_t v25 = a3;
  uint64_t v9 = *(void *)(*MEMORY[0x263F8DE50] + *a1 + 8);
  uint64_t v23 = a7;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v11 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v12 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v14 = (char *)&v23 - v13;
  uint64_t v15 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v17 = (char *)&v23 - v16;
  uint64_t v18 = type metadata accessor for AmbiguousTruthViewModifier();
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  long long v21 = (char *)&v23 - v20;
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, v24, v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v14, v25, AssociatedTypeWitness);
  sub_25EA0EE80(a1, (uint64_t)v17, (uint64_t)v14, v26, v21);
  swift_retain();
  MEMORY[0x2611E6FC0](v21, v28, v18, v29);
  return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v21, v18);
}

uint64_t type metadata accessor for AmbiguousTruthViewModifier()
{
  return sub_25E9ED2B4();
}

double sub_25EA0EE80@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, char *a5@<X8>)
{
  uint64_t v9 = *a1;
  *(void *)a5 = a1;
  uint64_t v10 = *(void *)(*MEMORY[0x263F8DE50] + v9 + 8);
  uint64_t v11 = (int *)type metadata accessor for AmbiguousTruthViewModifier();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(&a5[v11[9]], a2, v10);
  uint64_t v12 = &a5[v11[10]];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 32))(v12, a3, AssociatedTypeWitness);
  a5[v11[11]] = a4;
  uint64_t v14 = &a5[v11[12]];
  *(void *)uint64_t v14 = swift_getKeyPath();
  double result = 0.0;
  *(_OWORD *)(v14 + 8) = 0u;
  *(_OWORD *)(v14 + 24) = 0u;
  v14[40] = 0;
  return result;
}

uint64_t sub_25EA0EFDC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v15 = a1;
  swift_getWitnessTable();
  sub_25EA36000();
  sub_25E9ECF4C();
  uint64_t v2 = sub_25EA35FB0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v14 - v7;
  swift_getKeyPath();
  sub_25EA0F21C(v1, (uint64_t)v22);
  uint64_t v18 = v22[0];
  uint64_t v19 = v22[1];
  uint64_t v20 = v22[2];
  long long v14 = v23;
  long long v21 = v23;
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_25EA36030();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  unint64_t v10 = sub_25EA1453C();
  uint64_t v16 = WitnessTable;
  unint64_t v17 = v10;
  uint64_t v11 = swift_getWitnessTable();
  sub_25E9EC324(v6, v2, v11);
  uint64_t v12 = *(void (**)(char *, uint64_t))(v3 + 8);
  v12(v6, v2);
  sub_25E9EC324(v8, v2, v11);
  return ((uint64_t (*)(char *, uint64_t))v12)(v8, v2);
}

uint64_t sub_25EA0F21C@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = (int *)type metadata accessor for TruthViewModifier();
  uint64_t v5 = (long long *)((char *)a1 + v4[9]);
  long long v6 = v5[1];
  if (*((unsigned char *)a1 + v4[8]) == 1)
  {
    long long v19 = *v5;
    v20[0] = v6;
    *(_OWORD *)((char *)v20 + 9) = *(long long *)((char *)v5 + 25);
    sub_25E9ECFA4((uint64_t)&v19, (void (*)(void, void, void, void, void, void))sub_25E9EC854);
    sub_25E9ECC1C((uint64_t)v13);
    sub_25E9ECFA4((uint64_t)&v19, (void (*)(void, void, void, void, void, void))sub_25E9EC670);
    uint64_t v15 = 0;
    uint64_t v16 = 0xE000000000000000;
    sub_25EA365C0();
    sub_25EA36150();
    swift_bridgeObjectRelease();
    sub_25EA36150();
    uint64_t v7 = *a1;
    type metadata accessor for Dependencies();
    sub_25EA36400();
    sub_25EA364A0();
    Scope.subscope(tag:)(v15, v16, &v15);
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v8 = v15;
    uint64_t v9 = v16;
    uint64_t v10 = v17;
    long long v11 = v18;
    uint64_t result = sub_25EA00954(v7, (uint64_t)a1 + v4[7]);
    *(void *)a2 = v8;
    *(void *)(a2 + 8) = v9;
    *(void *)(a2 + 16) = v10;
    *(_OWORD *)(a2 + 24) = v11;
  }
  else
  {
    long long v19 = *v5;
    v20[0] = v6;
    *(_OWORD *)((char *)v20 + 9) = *(long long *)((char *)v5 + 25);
    sub_25E9ECFA4((uint64_t)&v19, (void (*)(void, void, void, void, void, void))sub_25E9EC854);
    sub_25E9ECC1C((uint64_t)&v15);
    sub_25E9ECFA4((uint64_t)&v19, (void (*)(void, void, void, void, void, void))sub_25E9EC670);
    v13[0] = v15;
    v13[1] = v16;
    void v13[2] = v17;
    long long v14 = v18;
    sub_25EA00954(*a1, (uint64_t)a1 + v4[7]);
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    sub_25E9ECFA4((uint64_t)&v19, (void (*)(void, void, void, void, void, void))sub_25E9EC854);
    sub_25E9ECC1C(a2);
    return sub_25E9ECFA4((uint64_t)&v19, (void (*)(void, void, void, void, void, void))sub_25E9EC670);
  }
  return result;
}

uint64_t sub_25EA0F4B8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v15 = a1;
  swift_getWitnessTable();
  sub_25EA36000();
  sub_25E9ECF4C();
  uint64_t v2 = sub_25EA35FB0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  long long v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v14 - v7;
  swift_getKeyPath();
  sub_25EA0F6F8(v1, (uint64_t)v22);
  uint64_t v18 = v22[0];
  uint64_t v19 = v22[1];
  uint64_t v20 = v22[2];
  long long v14 = v23;
  long long v21 = v23;
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_25EA36030();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  unint64_t v10 = sub_25EA1453C();
  uint64_t v16 = WitnessTable;
  unint64_t v17 = v10;
  uint64_t v11 = swift_getWitnessTable();
  sub_25E9EC324(v6, v2, v11);
  uint64_t v12 = *(void (**)(char *, uint64_t))(v3 + 8);
  v12(v6, v2);
  sub_25E9EC324(v8, v2, v11);
  return ((uint64_t (*)(char *, uint64_t))v12)(v8, v2);
}

uint64_t sub_25EA0F6F8@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = (int *)type metadata accessor for AmbiguousTruthViewModifier();
  uint64_t v5 = (long long *)((char *)a1 + v4[12]);
  long long v6 = v5[1];
  if (*((unsigned char *)a1 + v4[11]) == 1)
  {
    long long v20 = *v5;
    v21[0] = v6;
    *(_OWORD *)((char *)v21 + 9) = *(long long *)((char *)v5 + 25);
    sub_25E9ECFA4((uint64_t)&v20, (void (*)(void, void, void, void, void, void))sub_25E9EC854);
    sub_25E9ECC1C((uint64_t)v14);
    sub_25E9ECFA4((uint64_t)&v20, (void (*)(void, void, void, void, void, void))sub_25E9EC670);
    uint64_t v16 = 0;
    uint64_t v17 = 0xE000000000000000;
    sub_25EA365C0();
    sub_25EA36150();
    swift_bridgeObjectRelease();
    sub_25EA36150();
    uint64_t v13 = *a1;
    type metadata accessor for Dependencies();
    sub_25EA36400();
    sub_25EA364A0();
    sub_25EA36150();
    uint64_t v7 = (uint64_t)a1 + v4[9];
    sub_25EA364A0();
    Scope.subscope(tag:)(v16, v17, &v16);
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v8 = v16;
    uint64_t v9 = v17;
    uint64_t v10 = v18;
    long long v11 = v19;
    uint64_t result = sub_25EA00B44(v13, v7, (uint64_t)a1 + v4[10]);
    *(void *)a2 = v8;
    *(void *)(a2 + 8) = v9;
    *(void *)(a2 + 16) = v10;
    *(_OWORD *)(a2 + 24) = v11;
  }
  else
  {
    long long v20 = *v5;
    v21[0] = v6;
    *(_OWORD *)((char *)v21 + 9) = *(long long *)((char *)v5 + 25);
    sub_25E9ECFA4((uint64_t)&v20, (void (*)(void, void, void, void, void, void))sub_25E9EC854);
    sub_25E9ECC1C((uint64_t)&v16);
    sub_25E9ECFA4((uint64_t)&v20, (void (*)(void, void, void, void, void, void))sub_25E9EC670);
    v14[0] = v16;
    v14[1] = v17;
    long long v14[2] = v18;
    long long v15 = v19;
    sub_25EA00954(*a1, (uint64_t)a1 + v4[9]);
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    sub_25E9ECFA4((uint64_t)&v20, (void (*)(void, void, void, void, void, void))sub_25E9EC854);
    sub_25E9ECC1C(a2);
    return sub_25E9ECFA4((uint64_t)&v20, (void (*)(void, void, void, void, void, void))sub_25E9EC670);
  }
  return result;
}

uint64_t View.onChange<A>(of:updateDependency:initial:)(uint64_t *a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = *a1;
  uint64_t v13 = (void *)swift_allocObject();
  void v13[2] = a4;
  void v13[3] = *(void *)(*MEMORY[0x263F8EA20] + v12 + 8);
  v13[4] = a5;
  v13[5] = a6;
  View.onChange<A, B>(of:updateDependency:initial:transform:)((uint64_t)a1, a2, a3, (uint64_t)sub_25EA0FAE4, (uint64_t)v13, a4, a5);
  return swift_release();
}

uint64_t sub_25EA0FAD4()
{
  return swift_deallocObject();
}

uint64_t View.onChange<A, B>(of:updateDependency:initial:transform:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v17 = KeyPath;
  long long v18 = 0u;
  long long v19 = 0u;
  char v20 = 0;
  uint64_t v21 = a2;
  uint64_t v22 = a1;
  char v23 = a3;
  uint64_t v24 = a4;
  uint64_t v25 = a5;
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t updated = type metadata accessor for UpdateTruthFromEnvironmentViewModifier();
  MEMORY[0x2611E6FC0](&v17, a6, updated, a7);
  sub_25E9EC670(KeyPath, 0, 0, 0, 0, 0);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t View.onChange<A>(of:updateDependency:disambiguation:initial:)@<X0>(uint64_t *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v17 = *a1;
  long long v18 = (void *)swift_allocObject();
  v18[2] = a5;
  long long v18[3] = *(void *)(*MEMORY[0x263F8EA20] + v17 + 8);
  v18[4] = a6;
  uint64_t v18[5] = a7;
  v18[6] = a8;
  View.onChange<A, B>(of:updateDependency:disambiguation:initial:transform:)(a1, a2, a3, a4, (uint64_t)sub_25EA0FAE4, (uint64_t)v18, a5, a6, a9, a7, a8, a7);
  return swift_release();
}

uint64_t View.onChange<A, B>(of:updateDependency:disambiguation:initial:transform:)@<X0>(uint64_t *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v32 = a8;
  uint64_t v30 = a9;
  uint64_t v31 = a7;
  uint64_t v28 = a5;
  uint64_t v29 = a6;
  int v27 = a4;
  uint64_t v25 = a12;
  uint64_t v26 = a3;
  uint64_t v14 = *a1;
  uint64_t v15 = *(void *)(*MEMORY[0x263F8DE50] + *a2 + 8);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v17 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  long long v19 = (char *)&v25 - v18;
  uint64_t v33 = *(void *)(*MEMORY[0x263F8EA20] + v14 + 8);
  uint64_t v34 = v15;
  uint64_t v35 = a12;
  uint64_t v36 = a10;
  uint64_t v37 = a11;
  uint64_t updated = type metadata accessor for UpdateAmbiguousTruthFromEnvironmentViewModifier();
  uint64_t v21 = *(void *)(updated - 8);
  MEMORY[0x270FA5388](updated);
  char v23 = (char *)&v25 - v22;
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v19, v26, AssociatedTypeWitness);
  sub_25EA10080((uint64_t)a2, (uint64_t)a1, (uint64_t)v19, v27, v28, v29, (uint64_t)v23);
  swift_retain();
  swift_retain();
  swift_retain();
  MEMORY[0x2611E6FC0](v23, v31, updated, v32);
  return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v23, updated);
}

uint64_t type metadata accessor for UpdateTruthFromEnvironmentViewModifier()
{
  return swift_getGenericMetadata();
}

uint64_t sub_25EA10024()
{
  return swift_deallocObject();
}

uint64_t sub_25EA10034@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(v2 + 24) - 8) + 16))(a2, a1);
}

uint64_t type metadata accessor for UpdateAmbiguousTruthFromEnvironmentViewModifier()
{
  return swift_getGenericMetadata();
}

uint64_t sub_25EA10080@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  *(void *)a7 = swift_getKeyPath();
  *(_OWORD *)(a7 + 8) = 0u;
  *(_OWORD *)(a7 + 24) = 0u;
  *(unsigned char *)(a7 + 40) = 0;
  *(void *)(a7 + 48) = a1;
  *(void *)(a7 + 56) = a2;
  uint64_t updated = (int *)type metadata accessor for UpdateAmbiguousTruthFromEnvironmentViewModifier();
  uint64_t v13 = a7 + updated[17];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 32))(v13, a3, AssociatedTypeWitness);
  *(unsigned char *)(a7 + updated[18]) = a4;
  uint64_t v16 = (void *)(a7 + updated[19]);
  *uint64_t v16 = a5;
  v16[1] = a6;
  return result;
}

uint64_t sub_25EA10218()
{
  return swift_getWitnessTable();
}

uint64_t sub_25EA102AC()
{
  return swift_getWitnessTable();
}

uint64_t sub_25EA10340()
{
  return swift_getWitnessTable();
}

uint64_t sub_25EA103E0()
{
  return swift_getWitnessTable();
}

uint64_t sub_25EA10488()
{
  return swift_getWitnessTable();
}

uint64_t sub_25EA10534()
{
  return swift_getWitnessTable();
}

uint64_t sub_25EA105E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 64);
}

uint64_t sub_25EA105F0()
{
  uint64_t result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_25EA106C8(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v6 = *(_DWORD *)(v5 + 80);
  if (v6 > 7
    || (*(_DWORD *)(v5 + 80) & 0x100000) != 0
    || ((((v6 + 64) & ~v6) + *(void *)(*(void *)(AssociatedTypeWitness - 8) + 64)) & 0xFFFFFFFFFFFFFFF8) != 0
    && ((((v6 + 64) & ~v6) + *(void *)(*(void *)(AssociatedTypeWitness - 8) + 64)) & 0xFFFFFFFFFFFFFFF8) < 0xFFFFFFFFFFFFFFE8)
  {
    uint64_t v9 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = v9 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16));
  }
  else
  {
    uint64_t v25 = *(void *)(*(void *)(AssociatedTypeWitness - 8) + 64);
    uint64_t v10 = *(void *)a2;
    uint64_t v11 = *(void *)(a2 + 8);
    uint64_t v12 = *(void *)(a2 + 16);
    uint64_t v13 = *(void *)(a2 + 24);
    uint64_t v14 = *(void *)(a2 + 32);
    char v15 = *(unsigned char *)(a2 + 40);
    uint64_t v26 = AssociatedTypeWitness;
    sub_25E9EC854(*(void *)a2, v11, v12, v13, v14, v15);
    *(void *)a1 = v10;
    *(void *)(a1 + 8) = v11;
    *(void *)(a1 + 16) = v12;
    *(void *)(a1 + 24) = v13;
    *(void *)(a1 + 32) = v14;
    *(unsigned char *)(a1 + 40) = v15;
    *(void *)((a1 & 0xFFFFFFFFFFFFFFF8) + 48) = *(void *)((a2 & 0xFFFFFFFFFFFFFFF8) + 48);
    uint64_t v16 = (void *)(((a1 & 0xFFFFFFFFFFFFFFF8) + 63) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v17 = (void *)(((a2 & 0xFFFFFFFFFFFFFFF8) + 63) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v16 = *v17;
    uint64_t v18 = ((unint64_t)v16 + v6 + 8) & ~v6;
    uint64_t v19 = ((unint64_t)v17 + v6 + 8) & ~v6;
    char v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_retain();
    swift_retain();
    v20(v18, v19, v26);
    *(unsigned char *)(v18 + v25) = *(unsigned char *)(v19 + v25);
    unint64_t v21 = (v18 + v25) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v22 = (v19 + v25) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v23 = *(void *)(v22 + 16);
    *(void *)(v21 + 8) = *(void *)(v22 + 8);
    *(void *)(v21 + 16) = v23;
  }
  swift_retain();
  return a1;
}

uint64_t sub_25EA108A8(uint64_t a1)
{
  sub_25E9EC670(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_release();
  swift_release();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(unint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 8))(((((a1 & 0xFFFFFFFFFFFFFFF8) + 63) & 0xFFFFFFFFFFFFFFF8)+ *(unsigned __int8 *)(*(void *)(AssociatedTypeWitness - 8) + 80)+ 8) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(AssociatedTypeWitness - 8) + 80), AssociatedTypeWitness);
  return swift_release();
}

uint64_t sub_25EA10984(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  uint64_t v8 = *(void *)(a2 + 32);
  char v9 = *(unsigned char *)(a2 + 40);
  sub_25E9EC854(*(void *)a2, v5, v6, v7, v8, v9);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = v8;
  *(unsigned char *)(a1 + 40) = v9;
  *(void *)((a1 & 0xFFFFFFFFFFFFFFF8) + 48) = *(void *)((a2 & 0xFFFFFFFFFFFFFFF8) + 48);
  uint64_t v10 = (void *)(((a1 & 0xFFFFFFFFFFFFFFF8) + 63) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v11 = (void *)(((a2 & 0xFFFFFFFFFFFFFFF8) + 63) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v10 = *v11;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v13 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16);
  uint64_t v15 = v13 + 16;
  uint64_t v16 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v17 = ((unint64_t)v10 + v16 + 8) & ~v16;
  uint64_t v18 = ((unint64_t)v11 + v16 + 8) & ~v16;
  swift_retain();
  swift_retain();
  v14(v17, v18, AssociatedTypeWitness);
  uint64_t v19 = *(void *)(v15 + 48);
  uint64_t v20 = v19 + v17;
  uint64_t v21 = v19 + v18;
  *(unsigned char *)uint64_t v20 = *(unsigned char *)v21;
  v20 &= 0xFFFFFFFFFFFFFFF8;
  v21 &= 0xFFFFFFFFFFFFFFF8;
  uint64_t v22 = *(void *)(v21 + 16);
  *(void *)(v20 + 8) = *(void *)(v21 + 8);
  *(void *)(v20 + 16) = v22;
  swift_retain();
  return a1;
}

uint64_t sub_25EA10ADC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  uint64_t v8 = *(void *)(a2 + 32);
  char v9 = *(unsigned char *)(a2 + 40);
  sub_25E9EC854(*(void *)a2, v5, v6, v7, v8, v9);
  uint64_t v10 = *(void *)a1;
  uint64_t v11 = *(void *)(a1 + 8);
  uint64_t v12 = *(void *)(a1 + 16);
  uint64_t v13 = *(void *)(a1 + 24);
  uint64_t v14 = *(void *)(a1 + 32);
  char v15 = *(unsigned char *)(a1 + 40);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = v8;
  *(unsigned char *)(a1 + 40) = v9;
  sub_25E9EC670(v10, v11, v12, v13, v14, v15);
  *(void *)((a1 & 0xFFFFFFFFFFFFFFF8) + 48) = *(void *)((a2 & 0xFFFFFFFFFFFFFFF8) + 48);
  swift_retain();
  swift_release();
  uint64_t v16 = (void *)(((a1 & 0xFFFFFFFFFFFFFFF8) + 63) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v17 = (void *)(((a2 & 0xFFFFFFFFFFFFFFF8) + 63) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v16 = *v17;
  swift_retain();
  swift_release();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v19 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v20 = v19 + 24;
  uint64_t v21 = *(unsigned __int8 *)(v19 + 80);
  uint64_t v22 = ((unint64_t)v16 + v21 + 8) & ~v21;
  uint64_t v23 = ((unint64_t)v17 + v21 + 8) & ~v21;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 24))(v22, v23, AssociatedTypeWitness);
  uint64_t v24 = *(void *)(v20 + 40);
  uint64_t v25 = v24 + v22;
  uint64_t v26 = v24 + v23;
  *(unsigned char *)uint64_t v25 = *(unsigned char *)v26;
  v25 &= 0xFFFFFFFFFFFFFFF8;
  v26 &= 0xFFFFFFFFFFFFFFF8;
  uint64_t v27 = *(void *)(v26 + 16);
  *(void *)(v25 + 8) = *(void *)(v26 + 8);
  *(void *)(v25 + 16) = v27;
  swift_retain();
  swift_release();
  return a1;
}

unint64_t sub_25EA10C60(unint64_t a1, unint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(void *)((a1 & 0xFFFFFFFFFFFFFFF8) + 48) = *(void *)((a2 & 0xFFFFFFFFFFFFFFF8) + 48);
  uint64_t v4 = (void *)(((a1 & 0xFFFFFFFFFFFFFFF8) + 63) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v5 = (void *)(((a2 & 0xFFFFFFFFFFFFFFF8) + 63) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v4 = *v5;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v8 = v7 + 32;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = ((unint64_t)v4 + v9 + 8) & ~v9;
  uint64_t v11 = ((unint64_t)v5 + v9 + 8) & ~v9;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v10, v11, AssociatedTypeWitness);
  uint64_t v12 = *(void *)(v8 + 32);
  unint64_t v13 = v12 + v10;
  unint64_t v14 = v12 + v11;
  *(unsigned char *)unint64_t v13 = *(unsigned char *)v14;
  *(_OWORD *)((v13 & 0xFFFFFFFFFFFFFFF8) + 8) = *(_OWORD *)((v14 & 0xFFFFFFFFFFFFFFF8) + 8);
  return a1;
}

uint64_t sub_25EA10D54(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v4 = *(void *)(a2 + 32);
  char v5 = *(unsigned char *)(a2 + 40);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v8 = *(void *)(a1 + 16);
  uint64_t v9 = *(void *)(a1 + 24);
  uint64_t v10 = *(void *)(a1 + 32);
  char v11 = *(unsigned char *)(a1 + 40);
  long long v12 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v2;
  *(_OWORD *)(a1 + 16) = v12;
  *(void *)(a1 + 32) = v4;
  *(unsigned char *)(a1 + 40) = v5;
  sub_25E9EC670(v6, v7, v8, v9, v10, v11);
  v2 &= 0xFFFFFFFFFFFFFFF8;
  *(void *)((a1 & 0xFFFFFFFFFFFFFFF8) + 48) = *(void *)(v2 + 48);
  swift_release();
  unint64_t v13 = (void *)(((a1 & 0xFFFFFFFFFFFFFFF8) + 63) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v14 = (void *)((v2 + 63) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v13 = *v14;
  swift_release();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v16 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v17 = v16 + 40;
  uint64_t v18 = *(unsigned __int8 *)(v16 + 80);
  uint64_t v19 = ((unint64_t)v13 + v18 + 8) & ~v18;
  uint64_t v20 = ((unint64_t)v14 + v18 + 8) & ~v18;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 40))(v19, v20, AssociatedTypeWitness);
  uint64_t v21 = *(void *)(v17 + 24);
  unint64_t v22 = v21 + v19;
  unint64_t v23 = v21 + v20;
  *(unsigned char *)unint64_t v22 = *(unsigned char *)v23;
  *(_OWORD *)((v22 & 0xFFFFFFFFFFFFFFF8) + 8) = *(_OWORD *)((v23 & 0xFFFFFFFFFFFFFFF8) + 8);
  swift_release();
  return a1;
}

uint64_t sub_25EA10E8C(unint64_t a1, unsigned int a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v6 = v5;
  unsigned int v7 = *(_DWORD *)(v5 + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v5 + 84);
  }
  uint64_t v9 = *(unsigned __int8 *)(v5 + 80);
  if (!a2) {
    return 0;
  }
  if (v8 < a2)
  {
    unint64_t v10 = ((((v9 + 64) & ~v9) + *(void *)(*(void *)(AssociatedTypeWitness - 8) + 64)) & 0xFFFFFFFFFFFFFFF8) + 24;
    uint64_t v11 = v10 & 0xFFFFFFF8;
    if ((v10 & 0xFFFFFFF8) != 0) {
      unsigned int v12 = 2;
    }
    else {
      unsigned int v12 = a2 - v8 + 1;
    }
    if (v12 >= 0x10000) {
      unsigned int v13 = 4;
    }
    else {
      unsigned int v13 = 2;
    }
    if (v12 < 0x100) {
      unsigned int v13 = 1;
    }
    if (v12 >= 2) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 0;
    }
    switch(v14)
    {
      case 1:
        int v15 = *(unsigned __int8 *)(a1 + v10);
        if (!v15) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v15 = *(unsigned __int16 *)(a1 + v10);
        if (v15) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x25EA11040);
      case 4:
        int v15 = *(_DWORD *)(a1 + v10);
        if (!v15) {
          break;
        }
LABEL_22:
        int v17 = v15 - 1;
        if (v11)
        {
          int v17 = 0;
          LODWORD(v11) = *(_DWORD *)a1;
        }
        return v8 + (v11 | v17) + 1;
      default:
        break;
    }
  }
  unint64_t v18 = a1 & 0xFFFFFFFFFFFFFFF8;
  if ((v7 & 0x80000000) != 0)
  {
    uint64_t v20 = *(uint64_t (**)(unint64_t))(v6 + 48);
    return v20((((v18 + 63) & 0xFFFFFFFFFFFFFFF8) + v9 + 8) & ~v9);
  }
  else
  {
    unint64_t v19 = *(void *)(v18 + 48);
    if (v19 >= 0xFFFFFFFF) {
      LODWORD(v19) = -1;
    }
    return (v19 + 1);
  }
}

void sub_25EA11054(unint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v6 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v9 = 0x7FFFFFFF;
  }
  else {
    unsigned int v9 = *(_DWORD *)(v6 + 84);
  }
  size_t v10 = ((((v8 + 64) & ~v8) + *(void *)(v6 + 64)) & 0xFFFFFFFFFFFFFFF8) + 24;
  if (v9 >= a3)
  {
    int v13 = 0;
    int v14 = a2 - v9;
    if (a2 <= v9)
    {
LABEL_17:
      switch(v13)
      {
        case 1:
          *(unsigned char *)(a1 + v10) = 0;
          if (!a2) {
            return;
          }
          goto LABEL_30;
        case 2:
          *(_WORD *)(a1 + v10) = 0;
          if (!a2) {
            return;
          }
          goto LABEL_30;
        case 3:
          goto LABEL_43;
        case 4:
          *(_DWORD *)(a1 + v10) = 0;
          goto LABEL_29;
        default:
LABEL_29:
          if (a2)
          {
LABEL_30:
            unint64_t v17 = a1 & 0xFFFFFFFFFFFFFFF8;
            if ((v7 & 0x80000000) != 0)
            {
              unint64_t v19 = *(void (**)(unint64_t, uint64_t))(v6 + 56);
              v19((((v17 + 63) & 0xFFFFFFFFFFFFFFF8) + v8 + 8) & ~v8, a2);
            }
            else
            {
              if ((a2 & 0x80000000) != 0) {
                uint64_t v18 = a2 ^ 0x80000000;
              }
              else {
                uint64_t v18 = (a2 - 1);
              }
              *(void *)(v17 + 48) = v18;
            }
          }
          break;
      }
      return;
    }
  }
  else
  {
    if (((((v8 + 64) & ~v8) + *(_DWORD *)(v6 + 64)) & 0xFFFFFFF8) == 0xFFFFFFE8) {
      unsigned int v11 = a3 - v9 + 1;
    }
    else {
      unsigned int v11 = 2;
    }
    if (v11 >= 0x10000) {
      int v12 = 4;
    }
    else {
      int v12 = 2;
    }
    if (v11 < 0x100) {
      int v12 = 1;
    }
    if (v11 >= 2) {
      int v13 = v12;
    }
    else {
      int v13 = 0;
    }
    int v14 = a2 - v9;
    if (a2 <= v9) {
      goto LABEL_17;
    }
  }
  if (((((v8 + 64) & ~v8) + *(_DWORD *)(v6 + 64)) & 0xFFFFFFF8) == 0xFFFFFFE8) {
    int v15 = v14;
  }
  else {
    int v15 = 1;
  }
  if (((((v8 + 64) & ~v8) + *(_DWORD *)(v6 + 64)) & 0xFFFFFFF8) != 0xFFFFFFE8)
  {
    int v16 = ~v9 + a2;
    bzero((void *)a1, v10);
    *(_DWORD *)a1 = v16;
  }
  switch(v13)
  {
    case 1:
      *(unsigned char *)(a1 + v10) = v15;
      break;
    case 2:
      *(_WORD *)(a1 + v10) = v15;
      break;
    case 3:
LABEL_43:
      __break(1u);
      JUMPOUT(0x25EA11274);
    case 4:
      *(_DWORD *)(a1 + v10) = v15;
      break;
    default:
      return;
  }
}

uint64_t sub_25EA1129C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 56);
}

uint64_t sub_25EA112A4(uint64_t a1)
{
  sub_25E9EC670(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_25EA112FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  uint64_t v8 = *(void *)(a2 + 32);
  char v9 = *(unsigned char *)(a2 + 40);
  sub_25E9EC854(*(void *)a2, v5, v6, v7, v8, v9);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = v8;
  *(unsigned char *)(a1 + 40) = v9;
  uint64_t v10 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v10;
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  uint64_t v11 = *(void *)(a2 + 72);
  uint64_t v12 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = v11;
  *(void *)(a1 + 80) = v12;
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_25EA113A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  uint64_t v8 = *(void *)(a2 + 32);
  char v9 = *(unsigned char *)(a2 + 40);
  sub_25E9EC854(*(void *)a2, v5, v6, v7, v8, v9);
  uint64_t v10 = *(void *)a1;
  uint64_t v11 = *(void *)(a1 + 8);
  uint64_t v12 = *(void *)(a1 + 16);
  uint64_t v13 = *(void *)(a1 + 24);
  uint64_t v14 = *(void *)(a1 + 32);
  char v15 = *(unsigned char *)(a1 + 40);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = v8;
  *(unsigned char *)(a1 + 40) = v9;
  sub_25E9EC670(v10, v11, v12, v13, v14, v15);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_release();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  uint64_t v16 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v16;
  swift_retain();
  swift_release();
  return a1;
}

__n128 sub_25EA11484(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t sub_25EA114A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  char v5 = *(unsigned char *)(a2 + 40);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v8 = *(void *)(a1 + 16);
  uint64_t v9 = *(void *)(a1 + 24);
  uint64_t v10 = *(void *)(a1 + 32);
  char v11 = *(unsigned char *)(a1 + 40);
  long long v12 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v12;
  *(void *)(a1 + 32) = v4;
  *(unsigned char *)(a1 + 40) = v5;
  sub_25E9EC670(v6, v7, v8, v9, v10, v11);
  swift_release();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_release();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  swift_release();
  return a1;
}

uint64_t sub_25EA1152C(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 88)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 48);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_25EA11574(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 88) = 1;
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
      *(void *)(result + 48) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 88) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_25EA115C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 40);
}

uint64_t sub_25EA115D0()
{
  uint64_t AssociatedTypeWitness = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return AssociatedTypeWitness;
}

uint64_t *sub_25EA116E4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  int v7 = *(_DWORD *)(v6 + 80);
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)(v6 + 64);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v11 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v12 = *(_DWORD *)(v11 + 80);
  uint64_t v13 = v9 + v12;
  uint64_t v14 = *(void *)(v11 + 64);
  int v15 = (*(_DWORD *)(v11 + 80) | v7) & 0x100000;
  uint64_t v16 = *a2;
  *a1 = *a2;
  if ((v12 | (unint64_t)v7) > 7
    || v15 != 0
    || ((((v13 + ((v7 + 8) & ~(unint64_t)v7)) & ~v12) + v14) & 0xFFFFFFFFFFFFFFF8)
     + 49 > 0x18)
  {
    uint64_t v34 = v16 + (((v12 | v7) & 0xF8 ^ 0x1F8) & ((v12 | v7) + 16));
    swift_retain();
  }
  else
  {
    uint64_t v19 = ~v12;
    uint64_t v20 = (char *)a2 + v8;
    uint64_t v21 = ((unint64_t)a1 + v8 + 8) & ~v8;
    uint64_t v22 = (unint64_t)(v20 + 8) & ~v8;
    uint64_t v36 = a1;
    unint64_t v23 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
    swift_retain();
    v23(v21, v22, v5);
    uint64_t v24 = (v21 + v13) & v19;
    uint64_t v25 = (v22 + v13) & v19;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v24, v25, AssociatedTypeWitness);
    *(unsigned char *)(v24 + v14) = *(unsigned char *)(v25 + v14);
    unint64_t v26 = (v24 + v14) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v27 = (v25 + v14) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v28 = *(void *)(v27 + 8);
    uint64_t v29 = *(void *)(v27 + 16);
    uint64_t v30 = *(void *)(v27 + 24);
    uint64_t v31 = *(void *)(v27 + 32);
    uint64_t v32 = *(void *)(v27 + 40);
    char v33 = *(unsigned char *)(v27 + 48);
    sub_25E9EC854(v28, v29, v30, v31, v32, v33);
    *(void *)(v26 + 8) = v28;
    *(void *)(v26 + 16) = v29;
    *(void *)(v26 + 24) = v30;
    *(void *)(v26 + 32) = v31;
    *(void *)(v26 + 40) = v32;
    *(unsigned char *)(v26 + 48) = v33;
    return v36;
  }
  return (uint64_t *)v34;
}

uint64_t sub_25EA11918(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v5 = v4 + 8;
  unint64_t v6 = (a1 + *(unsigned __int8 *)(v4 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  (*(void (**)(unint64_t, void))(v4 + 8))(v6, *(void *)(a2 + 16));
  uint64_t v7 = *(void *)(v5 + 56);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v9 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v10 = v9 + 8;
  unint64_t v11 = (v6 + v7 + *(unsigned __int8 *)(v9 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  (*(void (**)(unint64_t, uint64_t))(v9 + 8))(v11, AssociatedTypeWitness);
  unint64_t v12 = (v11 + *(void *)(v10 + 56)) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v13 = *(void *)(v12 + 8);
  uint64_t v14 = *(void *)(v12 + 16);
  uint64_t v15 = *(void *)(v12 + 24);
  uint64_t v16 = *(void *)(v12 + 32);
  uint64_t v17 = *(void *)(v12 + 40);
  char v18 = *(unsigned char *)(v12 + 48);
  return sub_25E9EC670(v13, v14, v15, v16, v17, v18);
}

void *sub_25EA11A20(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  uint64_t v6 = *(void *)(v4 - 8) + 16;
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(v4 - 8) + 80);
  uint64_t v8 = ((unint64_t)a1 + v7 + 8) & ~v7;
  uint64_t v9 = ((unint64_t)a2 + v7 + 8) & ~v7;
  swift_retain();
  v5(v8, v9, v4);
  uint64_t v10 = *(void *)(v6 + 48);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v12 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v13 = v12 + 16;
  uint64_t v14 = *(unsigned __int8 *)(v12 + 80);
  uint64_t v15 = (v10 + v14 + v8) & ~v14;
  uint64_t v16 = (v10 + v14 + v9) & ~v14;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v15, v16, AssociatedTypeWitness);
  uint64_t v17 = *(void *)(v13 + 48);
  unint64_t v18 = v17 + v15;
  uint64_t v19 = v17 + v16;
  *(unsigned char *)unint64_t v18 = *(unsigned char *)v19;
  unint64_t v20 = v18 & 0xFFFFFFFFFFFFFFF8;
  v19 &= 0xFFFFFFFFFFFFFFF8;
  uint64_t v21 = *(void *)(v19 + 8);
  uint64_t v22 = *(void *)(v19 + 16);
  uint64_t v23 = *(void *)(v19 + 24);
  uint64_t v24 = *(void *)(v19 + 32);
  uint64_t v25 = *(void *)(v19 + 40);
  LOBYTE(v13) = *(unsigned char *)(v19 + 48);
  sub_25E9EC854(v21, v22, v23, v24, v25, v13);
  *(void *)(v20 + 8) = v21;
  *(void *)(v20 + 16) = v22;
  *(void *)(v20 + 24) = v23;
  *(void *)(v20 + 32) = v24;
  *(void *)(v20 + 40) = v25;
  *(unsigned char *)(v20 + 48) = v13;
  return a1;
}

void *sub_25EA11B84(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v7 = v6 + 24;
  uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v9 = ((unint64_t)a1 + v8 + 8) & ~v8;
  uint64_t v10 = ((unint64_t)a2 + v8 + 8) & ~v8;
  (*(void (**)(uint64_t, uint64_t, void))(v6 + 24))(v9, v10, *(void *)(a3 + 16));
  uint64_t v11 = *(void *)(v7 + 40);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v13 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v14 = v13 + 24;
  uint64_t v15 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v16 = (v11 + v15 + v9) & ~v15;
  uint64_t v17 = (v11 + v15 + v10) & ~v15;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 24))(v16, v17, AssociatedTypeWitness);
  uint64_t v18 = *(void *)(v14 + 40);
  unint64_t v19 = v18 + v16;
  uint64_t v20 = v18 + v17;
  *(unsigned char *)unint64_t v19 = *(unsigned char *)v20;
  unint64_t v21 = v19 & 0xFFFFFFFFFFFFFFF8;
  v20 &= 0xFFFFFFFFFFFFFFF8;
  uint64_t v22 = *(void *)(v20 + 8);
  uint64_t v23 = *(void *)(v20 + 16);
  uint64_t v24 = *(void *)(v20 + 24);
  uint64_t v25 = *(void *)(v20 + 32);
  uint64_t v26 = *(void *)(v20 + 40);
  char v27 = *(unsigned char *)(v20 + 48);
  sub_25E9EC854(v22, v23, v24, v25, v26, v27);
  uint64_t v28 = *(void *)(v21 + 8);
  uint64_t v29 = *(void *)(v21 + 16);
  uint64_t v30 = *(void *)(v21 + 24);
  uint64_t v31 = *(void *)(v21 + 32);
  uint64_t v32 = *(void *)(v21 + 40);
  char v33 = *(unsigned char *)(v21 + 48);
  *(void *)(v21 + 8) = v22;
  *(void *)(v21 + 16) = v23;
  *(void *)(v21 + 24) = v24;
  *(void *)(v21 + 32) = v25;
  *(void *)(v21 + 40) = v26;
  *(unsigned char *)(v21 + 48) = v27;
  sub_25E9EC670(v28, v29, v30, v31, v32, v33);
  return a1;
}

void *sub_25EA11D0C(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = v4 + 32;
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = ((unint64_t)a1 + v6 + 8) & ~v6;
  uint64_t v8 = ((unint64_t)a2 + v6 + 8) & ~v6;
  (*(void (**)(uint64_t, uint64_t, void))(v4 + 32))(v7, v8, *(void *)(a3 + 16));
  uint64_t v9 = *(void *)(v5 + 32);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v11 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v12 = v11 + 32;
  uint64_t v13 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v14 = (v9 + v13 + v7) & ~v13;
  uint64_t v15 = (v9 + v13 + v8) & ~v13;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 32))(v14, v15, AssociatedTypeWitness);
  uint64_t v16 = *(void *)(v12 + 32);
  uint64_t v17 = v16 + v14;
  uint64_t v18 = v16 + v15;
  *(unsigned char *)uint64_t v17 = *(unsigned char *)v18;
  v17 &= 0xFFFFFFFFFFFFFFF8;
  v18 &= 0xFFFFFFFFFFFFFFF8;
  long long v19 = *(_OWORD *)(v18 + 24);
  long long v20 = *(_OWORD *)(v18 + 33);
  *(_OWORD *)(v17 + 8) = *(_OWORD *)(v18 + 8);
  *(_OWORD *)(v17 + 33) = v20;
  *(_OWORD *)(v17 + 24) = v19;
  return a1;
}

void *sub_25EA11E48(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_release();
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v7 = v6 + 40;
  uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v9 = ((unint64_t)a1 + v8 + 8) & ~v8;
  uint64_t v10 = ((unint64_t)a2 + v8 + 8) & ~v8;
  (*(void (**)(uint64_t, uint64_t, void))(v6 + 40))(v9, v10, *(void *)(a3 + 16));
  uint64_t v11 = *(void *)(v7 + 24);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v13 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v14 = v13 + 40;
  uint64_t v15 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v16 = (v11 + v15 + v9) & ~v15;
  uint64_t v17 = (v11 + v15 + v10) & ~v15;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 40))(v16, v17, AssociatedTypeWitness);
  uint64_t v18 = *(void *)(v14 + 24);
  uint64_t v19 = v18 + v16;
  uint64_t v20 = v18 + v17;
  *(unsigned char *)uint64_t v19 = *(unsigned char *)v20;
  v19 &= 0xFFFFFFFFFFFFFFF8;
  v20 &= 0xFFFFFFFFFFFFFFF8;
  uint64_t v21 = *(void *)(v20 + 40);
  char v22 = *(unsigned char *)(v20 + 48);
  uint64_t v23 = *(void *)(v19 + 8);
  uint64_t v24 = *(void *)(v19 + 16);
  uint64_t v25 = *(void *)(v19 + 24);
  uint64_t v26 = *(void *)(v19 + 32);
  uint64_t v27 = *(void *)(v19 + 40);
  char v28 = *(unsigned char *)(v19 + 48);
  long long v29 = *(_OWORD *)(v20 + 24);
  *(_OWORD *)(v19 + 8) = *(_OWORD *)(v20 + 8);
  *(_OWORD *)(v19 + 24) = v29;
  *(void *)(v19 + 40) = v21;
  *(unsigned char *)(v19 + 48) = v22;
  sub_25E9EC670(v23, v24, v25, v26, v27, v28);
  return a1;
}

uint64_t sub_25EA11FA4(unsigned __int8 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned int *)(v6 + 84);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v9 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v10 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v11 = *(void *)(v6 + 64);
  uint64_t v12 = *(unsigned __int8 *)(v9 + 80);
  if (v7 <= *(_DWORD *)(v9 + 84)) {
    unsigned int v13 = *(_DWORD *)(v9 + 84);
  }
  else {
    unsigned int v13 = v7;
  }
  if (v13 <= 0x7FFFFFFF) {
    unsigned int v14 = 0x7FFFFFFF;
  }
  else {
    unsigned int v14 = v13;
  }
  if (!a2) {
    return 0;
  }
  if (v14 < a2)
  {
    unint64_t v15 = ((((v11 + v12 + ((v10 + 8) & ~v10)) & ~v12) + *(void *)(*(void *)(AssociatedTypeWitness - 8) + 64)) & 0xFFFFFFFFFFFFFFF8)
        + 49;
    if (v15 < 4) {
      unsigned int v16 = ((a2 - v14 + 255) >> (8 * v15)) + 1;
    }
    else {
      unsigned int v16 = 2;
    }
    if (v16 >= 0x10000) {
      LODWORD(v17) = 4;
    }
    else {
      LODWORD(v17) = 2;
    }
    if (v16 < 0x100) {
      LODWORD(v17) = 1;
    }
    if (v16 >= 2) {
      uint64_t v17 = v17;
    }
    else {
      uint64_t v17 = 0;
    }
    switch(v17)
    {
      case 1:
        int v18 = a1[v15];
        if (!a1[v15]) {
          break;
        }
        goto LABEL_25;
      case 2:
        int v18 = *(unsigned __int16 *)&a1[v15];
        if (*(_WORD *)&a1[v15]) {
          goto LABEL_25;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x25EA12244);
      case 4:
        int v18 = *(_DWORD *)&a1[v15];
        if (!v18) {
          break;
        }
LABEL_25:
        int v20 = (v18 - 1) << (8 * v15);
        if (v15 >= 4) {
          int v20 = 0;
        }
        if (v15 == 1) {
          int v21 = *a1;
        }
        else {
          int v21 = *(_DWORD *)a1;
        }
        return v14 + (v21 | v20) + 1;
      default:
        break;
    }
  }
  if ((v13 & 0x80000000) != 0)
  {
    uint64_t v23 = (unint64_t)&a1[v10 + 8] & ~v10;
    if (v7 == v14)
    {
      uint64_t v24 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
      return v24(v23, v7, v5);
    }
    else
    {
      uint64_t v25 = (v23 + v11 + v12) & ~v12;
      uint64_t v26 = *(uint64_t (**)(uint64_t))(v9 + 48);
      return v26(v25);
    }
  }
  else
  {
    uint64_t v22 = *(void *)a1;
    if (*(void *)a1 >= 0xFFFFFFFFuLL) {
      LODWORD(v22) = -1;
    }
    return (v22 + 1);
  }
}

void sub_25EA12258(void *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a4 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v30 = v8;
  uint64_t v9 = *(unsigned int *)(v8 + 84);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v11 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v12 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v13 = *(void *)(v8 + 64);
  uint64_t v14 = *(unsigned __int8 *)(v11 + 80);
  if (v9 <= *(_DWORD *)(v11 + 84)) {
    unsigned int v15 = *(_DWORD *)(v11 + 84);
  }
  else {
    unsigned int v15 = v9;
  }
  if (v15 <= 0x7FFFFFFF) {
    unsigned int v16 = 0x7FFFFFFF;
  }
  else {
    unsigned int v16 = v15;
  }
  size_t v17 = ((((v13 + v14 + ((v12 + 8) & ~v12)) & ~v14) + *(void *)(*(void *)(AssociatedTypeWitness - 8) + 64)) & 0xFFFFFFFFFFFFFFF8)
      + 49;
  char v18 = 8 * v17;
  if (v16 >= a3)
  {
    int v21 = 0;
    if (v16 >= a2)
    {
LABEL_20:
      switch(v21)
      {
        case 1:
          *((unsigned char *)a1 + v17) = 0;
          if (!a2) {
            return;
          }
          goto LABEL_37;
        case 2:
          *(_WORD *)((char *)a1 + v17) = 0;
          if (!a2) {
            return;
          }
          goto LABEL_37;
        case 3:
          goto LABEL_54;
        case 4:
          *(_DWORD *)((char *)a1 + v17) = 0;
          goto LABEL_36;
        default:
LABEL_36:
          if (a2)
          {
LABEL_37:
            if ((v15 & 0x80000000) != 0)
            {
              uint64_t v26 = ((unint64_t)a1 + v12 + 8) & ~v12;
              if (v9 == v16)
              {
                uint64_t v27 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v30 + 56);
                v27(v26, a2, v9, v7);
              }
              else
              {
                uint64_t v28 = (v26 + v13 + v14) & ~v14;
                long long v29 = *(void (**)(uint64_t, uint64_t))(v11 + 56);
                v29(v28, a2);
              }
            }
            else
            {
              if ((a2 & 0x80000000) != 0) {
                uint64_t v25 = a2 ^ 0x80000000;
              }
              else {
                uint64_t v25 = (a2 - 1);
              }
              *a1 = v25;
            }
          }
          break;
      }
      return;
    }
  }
  else
  {
    if (v17 <= 3) {
      unsigned int v19 = ((a3 - v16 + 255) >> v18) + 1;
    }
    else {
      unsigned int v19 = 2;
    }
    if (v19 >= 0x10000) {
      int v20 = 4;
    }
    else {
      int v20 = 2;
    }
    if (v19 < 0x100) {
      int v20 = 1;
    }
    if (v19 >= 2) {
      int v21 = v20;
    }
    else {
      int v21 = 0;
    }
    if (v16 >= a2) {
      goto LABEL_20;
    }
  }
  unsigned int v22 = ~v16 + a2;
  if (v17 < 4) {
    int v23 = (v22 >> v18) + 1;
  }
  else {
    int v23 = 1;
  }
  if (v17 >= 4) {
    unsigned int v24 = v22;
  }
  else {
    unsigned int v24 = v22;
  }
  bzero(a1, v17);
  if (v17 == 1) {
    *(unsigned char *)a1 = v24;
  }
  else {
    *(_DWORD *)a1 = v24;
  }
  switch(v21)
  {
    case 1:
      *((unsigned char *)a1 + v17) = v23;
      break;
    case 2:
      *(_WORD *)((char *)a1 + v17) = v23;
      break;
    case 3:
LABEL_54:
      __break(1u);
      JUMPOUT(0x25EA1256CLL);
    case 4:
      *(_DWORD *)((char *)a1 + v17) = v23;
      break;
    default:
      return;
  }
}

uint64_t sub_25EA12594()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_25EA12648(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(_DWORD *)(v5 + 80);
  uint64_t v7 = *(void *)(v5 + 64);
  int v8 = *(_DWORD *)(v5 + 80) & 0x100000;
  uint64_t v9 = *a2;
  *a1 = *a2;
  if (v6 > 7 || v8 != 0 || ((((v6 + 8) & ~v6) + v7) & 0xFFFFFFFFFFFFFFF8) + 49 > 0x18)
  {
    a1 = (uint64_t *)(v9 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16)));
    swift_retain();
  }
  else
  {
    uint64_t v12 = ((unint64_t)a1 + v6 + 8) & ~v6;
    uint64_t v13 = ((unint64_t)a2 + v6 + 8) & ~v6;
    uint64_t v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_retain();
    v14(v12, v13, v4);
    *(unsigned char *)(v12 + v7) = *(unsigned char *)(v13 + v7);
    unint64_t v15 = (v12 + v7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v16 = (v13 + v7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v17 = *(void *)(v16 + 8);
    uint64_t v18 = *(void *)(v16 + 16);
    uint64_t v19 = *(void *)(v16 + 24);
    uint64_t v20 = *(void *)(v16 + 32);
    uint64_t v21 = *(void *)(v16 + 40);
    LOBYTE(v14) = *(unsigned char *)(v16 + 48);
    sub_25E9EC854(v17, v18, v19, v20, v21, (char)v14);
    *(void *)(v15 + 8) = v17;
    *(void *)(v15 + 16) = v18;
    *(void *)(v15 + 24) = v19;
    *(void *)(v15 + 32) = v20;
    *(void *)(v15 + 40) = v21;
    *(unsigned char *)(v15 + 48) = (_BYTE)v14;
  }
  return a1;
}

uint64_t sub_25EA127B0(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v5 = v4 + 8;
  unint64_t v6 = (a1 + *(unsigned __int8 *)(v4 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  (*(void (**)(unint64_t))(v4 + 8))(v6);
  unint64_t v7 = (v6 + *(void *)(v5 + 56)) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v8 = *(void *)(v7 + 8);
  uint64_t v9 = *(void *)(v7 + 16);
  uint64_t v10 = *(void *)(v7 + 24);
  uint64_t v11 = *(void *)(v7 + 32);
  uint64_t v12 = *(void *)(v7 + 40);
  char v13 = *(unsigned char *)(v7 + 48);
  return sub_25E9EC670(v8, v9, v10, v11, v12, v13);
}

void *sub_25EA12850(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  uint64_t v6 = *(void *)(v4 - 8) + 16;
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(v4 - 8) + 80);
  uint64_t v8 = ((unint64_t)a1 + v7 + 8) & ~v7;
  uint64_t v9 = ((unint64_t)a2 + v7 + 8) & ~v7;
  swift_retain();
  v5(v8, v9, v4);
  uint64_t v10 = *(void *)(v6 + 48);
  unint64_t v11 = v10 + v8;
  uint64_t v12 = v10 + v9;
  *(unsigned char *)unint64_t v11 = *(unsigned char *)v12;
  unint64_t v13 = v11 & 0xFFFFFFFFFFFFFFF8;
  v12 &= 0xFFFFFFFFFFFFFFF8;
  uint64_t v14 = *(void *)(v12 + 8);
  uint64_t v15 = *(void *)(v12 + 16);
  uint64_t v16 = *(void *)(v12 + 24);
  uint64_t v17 = *(void *)(v12 + 32);
  uint64_t v18 = *(void *)(v12 + 40);
  char v19 = *(unsigned char *)(v12 + 48);
  sub_25E9EC854(v14, v15, v16, v17, v18, v19);
  *(void *)(v13 + 8) = v14;
  *(void *)(v13 + 16) = v15;
  *(void *)(v13 + 24) = v16;
  *(void *)(v13 + 32) = v17;
  *(void *)(v13 + 40) = v18;
  *(unsigned char *)(v13 + 48) = v19;
  return a1;
}

void *sub_25EA12940(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v7 = v6 + 24;
  uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v9 = ((unint64_t)a1 + v8 + 8) & ~v8;
  uint64_t v10 = ((unint64_t)a2 + v8 + 8) & ~v8;
  (*(void (**)(uint64_t, uint64_t))(v6 + 24))(v9, v10);
  uint64_t v11 = *(void *)(v7 + 40);
  unint64_t v12 = v11 + v9;
  uint64_t v13 = v11 + v10;
  *(unsigned char *)unint64_t v12 = *(unsigned char *)v13;
  unint64_t v14 = v12 & 0xFFFFFFFFFFFFFFF8;
  v13 &= 0xFFFFFFFFFFFFFFF8;
  uint64_t v15 = *(void *)(v13 + 8);
  uint64_t v16 = *(void *)(v13 + 16);
  uint64_t v17 = *(void *)(v13 + 24);
  uint64_t v18 = *(void *)(v13 + 32);
  uint64_t v19 = *(void *)(v13 + 40);
  char v20 = *(unsigned char *)(v13 + 48);
  sub_25E9EC854(v15, v16, v17, v18, v19, v20);
  uint64_t v21 = *(void *)(v14 + 8);
  uint64_t v22 = *(void *)(v14 + 16);
  uint64_t v23 = *(void *)(v14 + 24);
  uint64_t v24 = *(void *)(v14 + 32);
  uint64_t v25 = *(void *)(v14 + 40);
  char v26 = *(unsigned char *)(v14 + 48);
  *(void *)(v14 + 8) = v15;
  *(void *)(v14 + 16) = v16;
  *(void *)(v14 + 24) = v17;
  *(void *)(v14 + 32) = v18;
  *(void *)(v14 + 40) = v19;
  *(unsigned char *)(v14 + 48) = v20;
  sub_25E9EC670(v21, v22, v23, v24, v25, v26);
  return a1;
}

void *sub_25EA12A54(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = v4 + 32;
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = ((unint64_t)a1 + v6 + 8) & ~v6;
  uint64_t v8 = ((unint64_t)a2 + v6 + 8) & ~v6;
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v7, v8);
  uint64_t v9 = *(void *)(v5 + 32);
  uint64_t v10 = v9 + v7;
  uint64_t v11 = v9 + v8;
  *(unsigned char *)uint64_t v10 = *(unsigned char *)v11;
  v10 &= 0xFFFFFFFFFFFFFFF8;
  v11 &= 0xFFFFFFFFFFFFFFF8;
  long long v12 = *(_OWORD *)(v11 + 24);
  long long v13 = *(_OWORD *)(v11 + 33);
  *(_OWORD *)(v10 + 8) = *(_OWORD *)(v11 + 8);
  *(_OWORD *)(v10 + 33) = v13;
  *(_OWORD *)(v10 + 24) = v12;
  return a1;
}

void *sub_25EA12B08(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_release();
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v7 = v6 + 40;
  uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v9 = ((unint64_t)a1 + v8 + 8) & ~v8;
  uint64_t v10 = ((unint64_t)a2 + v8 + 8) & ~v8;
  (*(void (**)(uint64_t, uint64_t))(v6 + 40))(v9, v10);
  uint64_t v11 = *(void *)(v7 + 24);
  uint64_t v12 = v11 + v9;
  uint64_t v13 = v11 + v10;
  *(unsigned char *)uint64_t v12 = *(unsigned char *)v13;
  v12 &= 0xFFFFFFFFFFFFFFF8;
  v13 &= 0xFFFFFFFFFFFFFFF8;
  uint64_t v14 = *(void *)(v13 + 40);
  char v15 = *(unsigned char *)(v13 + 48);
  uint64_t v16 = *(void *)(v12 + 8);
  uint64_t v17 = *(void *)(v12 + 16);
  uint64_t v18 = *(void *)(v12 + 24);
  uint64_t v19 = *(void *)(v12 + 32);
  uint64_t v20 = *(void *)(v12 + 40);
  char v21 = *(unsigned char *)(v12 + 48);
  long long v22 = *(_OWORD *)(v13 + 24);
  *(_OWORD *)(v12 + 8) = *(_OWORD *)(v13 + 8);
  *(_OWORD *)(v12 + 24) = v22;
  *(void *)(v12 + 40) = v14;
  *(unsigned char *)(v12 + 48) = v15;
  sub_25E9EC670(v16, v17, v18, v19, v20, v21);
  return a1;
}

uint64_t sub_25EA12BE8(unsigned __int8 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  if (v7 < a2)
  {
    unint64_t v8 = ((((v6 + 8) & ~v6) + *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64)) & 0xFFFFFFFFFFFFFFF8) + 49;
    unsigned int v9 = (a2 - v7 + 255) >> (8 * v8);
    if (v8 < 4) {
      unsigned int v10 = v9 + 1;
    }
    else {
      unsigned int v10 = 2;
    }
    if (v10 >= 0x10000) {
      unsigned int v11 = 4;
    }
    else {
      unsigned int v11 = 2;
    }
    if (v10 < 0x100) {
      unsigned int v11 = 1;
    }
    if (v10 >= 2) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 0;
    }
    switch(v12)
    {
      case 1:
        int v13 = a1[v8];
        if (!a1[v8]) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v13 = *(unsigned __int16 *)&a1[v8];
        if (*(_WORD *)&a1[v8]) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x25EA12D58);
      case 4:
        int v13 = *(_DWORD *)&a1[v8];
        if (!v13) {
          break;
        }
LABEL_22:
        int v15 = (v13 - 1) << (8 * v8);
        if (v8 >= 4) {
          int v15 = 0;
        }
        if (((((v6 + 8) & ~v6) + *(_DWORD *)(*(void *)(*(void *)(a3 + 16) - 8) + 64)) & 0xFFFFFFF8) == 0xFFFFFFD0) {
          int v16 = *a1;
        }
        else {
          int v16 = *(_DWORD *)a1;
        }
        return v7 + (v16 | v15) + 1;
      default:
        break;
    }
  }
  if ((v5 & 0x80000000) != 0) {
    return (*(uint64_t (**)(unint64_t))(v4 + 48))((unint64_t)&a1[v6 + 8] & ~v6);
  }
  uint64_t v17 = *(void *)a1;
  if (*(void *)a1 >= 0xFFFFFFFFuLL) {
    LODWORD(v17) = -1;
  }
  return (v17 + 1);
}

void sub_25EA12D6C(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  size_t v10 = ((((v9 + 8) & ~v9) + *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64)) & 0xFFFFFFFFFFFFFFF8) + 49;
  char v11 = 8 * v10;
  if (v8 >= a3)
  {
    int v15 = 0;
    if (v8 >= a2)
    {
LABEL_17:
      switch(v15)
      {
        case 1:
          a1[v10] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_34;
        case 2:
          *(_WORD *)&a1[v10] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_34;
        case 3:
          goto LABEL_47;
        case 4:
          *(_DWORD *)&a1[v10] = 0;
          goto LABEL_33;
        default:
LABEL_33:
          if (a2)
          {
LABEL_34:
            if ((v7 & 0x80000000) != 0)
            {
              unint64_t v20 = (unint64_t)&a1[v9 + 8] & ~v9;
              char v21 = *(void (**)(unint64_t))(v6 + 56);
              v21(v20);
            }
            else
            {
              if ((a2 & 0x80000000) != 0) {
                uint64_t v19 = a2 ^ 0x80000000;
              }
              else {
                uint64_t v19 = a2 - 1;
              }
              *(void *)a1 = v19;
            }
          }
          break;
      }
      return;
    }
  }
  else
  {
    unsigned int v12 = (a3 - v8 + 255) >> v11;
    if (v10 <= 3) {
      unsigned int v13 = v12 + 1;
    }
    else {
      unsigned int v13 = 2;
    }
    if (v13 >= 0x10000) {
      int v14 = 4;
    }
    else {
      int v14 = 2;
    }
    if (v13 < 0x100) {
      int v14 = 1;
    }
    if (v13 >= 2) {
      int v15 = v14;
    }
    else {
      int v15 = 0;
    }
    if (v8 >= a2) {
      goto LABEL_17;
    }
  }
  unsigned int v16 = (~v8 + a2) >> v11;
  if (v10 < 4) {
    int v17 = v16 + 1;
  }
  else {
    int v17 = 1;
  }
  if (v10 >= 4) {
    unsigned int v18 = ~v8 + a2;
  }
  else {
    unsigned int v18 = (~(_BYTE)v8 + a2);
  }
  bzero(a1, v10);
  if (v10 == 1) {
    *a1 = v18;
  }
  else {
    *(_DWORD *)a1 = v18;
  }
  switch(v15)
  {
    case 1:
      a1[v10] = v17;
      break;
    case 2:
      *(_WORD *)&a1[v10] = v17;
      break;
    case 3:
LABEL_47:
      __break(1u);
      JUMPOUT(0x25EA12F80);
    case 4:
      *(_DWORD *)&a1[v10] = v17;
      break;
    default:
      return;
  }
}

uint64_t sub_25EA12FA8()
{
  return sub_25EA177D0();
}

uint64_t sub_25EA12FC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v40 = a1;
  uint64_t v41 = a3;
  uint64_t v37 = *(void *)(a2 + 32);
  uint64_t v36 = *(void *)(a2 + 40);
  long long v48 = *(_OWORD *)(a2 + 16);
  uint64_t v49 = v37;
  uint64_t v50 = v36;
  uint64_t updated = type metadata accessor for UpdateScopeWithEnvironmentTruthViewModifier();
  uint64_t v39 = *(void *)(updated - 8);
  MEMORY[0x270FA5388](updated);
  char v33 = (uint64_t *)((char *)&v28 - v4);
  swift_getWitnessTable();
  uint64_t v32 = sub_25EA36000();
  uint64_t v5 = sub_25EA35FB0();
  uint64_t v38 = *(void *)(v5 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v31 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v35 = (char *)&v28 - v8;
  uint64_t v9 = *(void *)v3;
  uint64_t v10 = *(void *)(v3 + 8);
  uint64_t v11 = *(void *)(v3 + 16);
  uint64_t v12 = *(void *)(v3 + 24);
  uint64_t v13 = *(void *)(v3 + 32);
  char v14 = *(unsigned char *)(v3 + 40);
  uint64_t v16 = *(void *)(v3 + 48);
  uint64_t v15 = *(void *)(v3 + 56);
  int v30 = *(unsigned __int8 *)(v3 + 64);
  uint64_t v28 = *(void *)(v3 + 72);
  uint64_t v29 = *(void *)(v3 + 80);
  *(void *)&long long v48 = v9;
  *((void *)&v48 + 1) = v10;
  uint64_t v49 = v11;
  uint64_t v50 = v12;
  uint64_t v51 = v13;
  char v52 = v14;
  swift_retain();
  swift_retain();
  sub_25E9EC854(v9, v10, v11, v12, v13, v14);
  sub_25E9ECC1C((uint64_t)v46);
  sub_25E9EC670(v9, v10, v11, v12, v13, v14);
  v44[0] = (__n128)v46[0];
  v44[1] = (__n128)v46[1];
  uint64_t v45 = v47;
  int v17 = v33;
  sub_25EA133D4(v16, v15, v30, v44, v28, v29, v33);
  swift_retain();
  uint64_t v18 = v32;
  uint64_t WitnessTable = swift_getWitnessTable();
  unint64_t v20 = v31;
  uint64_t v21 = v18;
  uint64_t v22 = updated;
  MEMORY[0x2611E6FC0](v17, v21, updated, WitnessTable);
  (*(void (**)(uint64_t *, uint64_t))(v39 + 8))(v17, v22);
  uint64_t v23 = swift_getWitnessTable();
  uint64_t v42 = WitnessTable;
  uint64_t v43 = v23;
  uint64_t v24 = swift_getWitnessTable();
  uint64_t v25 = v35;
  sub_25E9EC324(v20, v5, v24);
  char v26 = *(void (**)(char *, uint64_t))(v38 + 8);
  v26(v20, v5);
  sub_25E9EC324(v25, v5, v24);
  return ((uint64_t (*)(char *, uint64_t))v26)(v25, v5);
}

__n128 sub_25EA133D4@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, __n128 *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t *a7@<X8>)
{
  __n128 v18 = a4[1];
  unint64_t v12 = a4[2].n128_u64[0];
  *a7 = swift_getKeyPath();
  sub_25EA15AE8(0, qword_26A7275B0, MEMORY[0x263F185C8]);
  __n128 v17 = *a4;
  swift_storeEnumTagMultiPayload();
  uint64_t updated = (int *)type metadata accessor for UpdateScopeWithEnvironmentTruthViewModifier();
  *(uint64_t *)((char *)a7 + updated[13]) = a1;
  *(uint64_t *)((char *)a7 + updated[14]) = a2;
  *((unsigned char *)a7 + updated[15]) = a3;
  char v14 = (__n128 *)((char *)a7 + updated[16]);
  __n128 result = v18;
  *char v14 = v17;
  v14[1] = v18;
  v14[2].n128_u64[0] = v12;
  uint64_t v16 = (uint64_t *)((char *)a7 + updated[17]);
  *uint64_t v16 = a5;
  v16[1] = a6;
  return result;
}

uint64_t sub_25EA13564@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v64 = a1;
  uint64_t v68 = a3;
  uint64_t v66 = *(void *)(a2 - 8);
  uint64_t v67 = *(void *)(v66 + 64);
  uint64_t v5 = MEMORY[0x270FA5388](a1);
  uint64_t v65 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)(v7 + 16);
  uint64_t v69 = v8;
  uint64_t v70 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)&v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _s11ValueReaderVMa();
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  char v14 = (char *)&v48 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = *(void *)(a2 + 24);
  uint64_t v59 = *(void *)(v55 - 8);
  MEMORY[0x270FA5388](v12);
  char v54 = (char *)&v48 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getWitnessTable();
  uint64_t v16 = sub_25EA36000();
  type metadata accessor for TruthViewModifier();
  uint64_t v50 = v16;
  uint64_t v17 = sub_25EA35FB0();
  uint64_t v63 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v51 = (char *)&v48 - v18;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v48 = WitnessTable;
  uint64_t v20 = swift_getWitnessTable();
  uint64_t v75 = WitnessTable;
  uint64_t v76 = v20;
  uint64_t v56 = v17;
  uint64_t v57 = swift_getWitnessTable();
  uint64_t v53 = *(void *)(a2 + 32);
  uint64_t v71 = v17;
  uint64_t v72 = v8;
  uint64_t v73 = v57;
  uint64_t v74 = v53;
  uint64_t v60 = MEMORY[0x263F1B260];
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v22 = *(void *)(OpaqueTypeMetadata2 - 8);
  uint64_t v61 = OpaqueTypeMetadata2;
  uint64_t v62 = v22;
  uint64_t v23 = MEMORY[0x270FA5388](OpaqueTypeMetadata2);
  char v52 = (char *)&v48 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v23);
  uint64_t v58 = (char *)&v48 - v25;
  char v26 = *(uint64_t **)(v3 + *(int *)(a2 + 52));
  uint64_t v27 = *(void (**)(char *))(v3 + *(int *)(a2 + 68));
  sub_25E9ECFE4((uint64_t)v14);
  swift_getAtKeyPath();
  sub_25EA17858((uint64_t)v14);
  uint64_t v28 = (uint64_t)v54;
  v27(v10);
  uint64_t v29 = *(void (**)(char *, uint64_t))(v70 + 8);
  v70 += 8;
  uint64_t v49 = v29;
  v29(v10, v69);
  int v30 = v51;
  View.truth<A>(_:_:definesNewScope:)(v26, v28, 0, v50, v48);
  uint64_t v31 = v28;
  uint64_t v32 = v55;
  (*(void (**)(uint64_t, uint64_t))(v59 + 8))(v31, v55);
  sub_25E9ECFE4((uint64_t)v14);
  swift_getAtKeyPath();
  sub_25EA17858((uint64_t)v14);
  uint64_t v34 = v65;
  uint64_t v33 = v66;
  (*(void (**)(char *, uint64_t, uint64_t))(v66 + 16))(v65, v3, a2);
  unint64_t v35 = (*(unsigned __int8 *)(v33 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80);
  uint64_t v36 = (char *)swift_allocObject();
  uint64_t v37 = v69;
  *((void *)v36 + 2) = v69;
  *((void *)v36 + 3) = v32;
  uint64_t v38 = *(void *)(a2 + 40);
  uint64_t v39 = v53;
  *((void *)v36 + 4) = v53;
  *((void *)v36 + 5) = v38;
  (*(void (**)(char *, char *, uint64_t))(v33 + 32))(&v36[v35], v34, a2);
  uint64_t v40 = v52;
  uint64_t v42 = v56;
  uint64_t v41 = v57;
  sub_25EA36050();
  swift_release();
  v49(v10, v37);
  (*(void (**)(char *, uint64_t))(v63 + 8))(v30, v42);
  uint64_t v71 = v42;
  uint64_t v72 = v37;
  uint64_t v73 = v41;
  uint64_t v74 = v39;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v44 = v58;
  uint64_t v45 = v61;
  sub_25E9EC324(v40, v61, OpaqueTypeConformance2);
  int v46 = *(void (**)(char *, uint64_t))(v62 + 8);
  v46(v40, v45);
  sub_25E9EC324(v44, v45, OpaqueTypeConformance2);
  return ((uint64_t (*)(char *, uint64_t))v46)(v44, v45);
}

uint64_t sub_25EA13C00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = *(void *)(a5 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = v11;
  uint64_t v23 = v12;
  uint64_t v24 = v13;
  *(void *)&long long v25 = v14;
  uint64_t updated = (int *)type metadata accessor for UpdateScopeWithEnvironmentTruthViewModifier();
  (*(void (**)(uint64_t))(a3 + updated[17]))(a2);
  uint64_t v16 = (uint64_t *)(a3 + updated[16]);
  uint64_t v17 = v16[1];
  uint64_t v18 = v16[2];
  uint64_t v22 = *v16;
  uint64_t v23 = v17;
  uint64_t v24 = v18;
  long long v25 = *(_OWORD *)(v16 + 3);
  uint64_t v19 = *(void **)(a3 + updated[13]);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_25EA00954(v19, (uint64_t)v10);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, a5);
}

uint64_t sub_25EA13D7C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_25EA35FD0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t sub_25EA13DE8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  uint64_t v40 = a1;
  uint64_t v41 = a3;
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v35 = *(void *)(a2 + 48);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v31 = (char *)&v30 - v8;
  uint64_t v9 = *(void *)(a2 + 16);
  uint64_t v37 = *(void *)(a2 + 32);
  uint64_t v36 = *(void *)(a2 + 40);
  *(void *)&long long v48 = v9;
  *((void *)&v48 + 1) = v6;
  *(void *)uint64_t v49 = v37;
  *(void *)&v49[8] = v36;
  *(void *)&v49[16] = v35;
  uint64_t updated = type metadata accessor for UpdateScopeWithAmbiguousEnvironmentTruthViewModifier();
  uint64_t v39 = *(void *)(updated - 8);
  MEMORY[0x270FA5388](updated);
  uint64_t v34 = (uint64_t *)((char *)&v30 - v11);
  swift_getWitnessTable();
  uint64_t v33 = sub_25EA36000();
  uint64_t v12 = sub_25EA35FB0();
  uint64_t v38 = *(void *)(v12 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v30 - v16;
  uint64_t v19 = *((void *)v4 + 6);
  uint64_t v18 = *((void *)v4 + 7);
  uint64_t v20 = (uint64_t)v31;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v31, (uint64_t)v4 + *(int *)(a2 + 68), AssociatedTypeWitness);
  LODWORD(AssociatedTypeWitness) = *((unsigned __int8 *)v4 + *(int *)(a2 + 72));
  long long v21 = v4[1];
  long long v48 = *v4;
  *(_OWORD *)uint64_t v49 = v21;
  *(_OWORD *)&v49[9] = *(long long *)((char *)v4 + 25);
  swift_retain();
  swift_retain();
  sub_25E9ECFA4((uint64_t)&v48, (void (*)(void, void, void, void, void, void))sub_25E9EC854);
  sub_25E9ECC1C((uint64_t)v46);
  sub_25E9ECFA4((uint64_t)&v48, (void (*)(void, void, void, void, void, void))sub_25E9EC670);
  v44[0] = (__n128)v46[0];
  v44[1] = (__n128)v46[1];
  uint64_t v45 = v47;
  uint64_t v22 = (uint64_t *)((char *)v4 + *(int *)(a2 + 76));
  uint64_t v23 = v34;
  sub_25EA14298(v19, v18, v20, AssociatedTypeWitness, v44, *v22, v22[1], v34);
  swift_retain();
  uint64_t v24 = v33;
  uint64_t WitnessTable = swift_getWitnessTable();
  MEMORY[0x2611E6FC0](v23, v24, updated, WitnessTable);
  (*(void (**)(uint64_t *, uint64_t))(v39 + 8))(v23, updated);
  uint64_t v26 = swift_getWitnessTable();
  uint64_t v42 = WitnessTable;
  uint64_t v43 = v26;
  uint64_t v27 = swift_getWitnessTable();
  sub_25E9EC324(v15, v12, v27);
  uint64_t v28 = *(void (**)(char *, uint64_t))(v38 + 8);
  v28(v15, v12);
  sub_25E9EC324(v17, v12, v27);
  return ((uint64_t (*)(char *, uint64_t))v28)(v17, v12);
}

__n128 sub_25EA14298@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, __n128 *a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t *a8@<X8>)
{
  __n128 v20 = a5[1];
  unint64_t v12 = a5[2].n128_u64[0];
  *a8 = swift_getKeyPath();
  sub_25EA15AE8(0, qword_26A7275B0, MEMORY[0x263F185C8]);
  __n128 v19 = *a5;
  swift_storeEnumTagMultiPayload();
  uint64_t updated = (int *)type metadata accessor for UpdateScopeWithAmbiguousEnvironmentTruthViewModifier();
  *(uint64_t *)((char *)a8 + updated[15]) = a1;
  *(uint64_t *)((char *)a8 + updated[16]) = a2;
  uint64_t v14 = (char *)a8 + updated[17];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 32))(v14, a3, AssociatedTypeWitness);
  *((unsigned char *)a8 + updated[18]) = a4;
  uint64_t v16 = (__n128 *)((char *)a8 + updated[19]);
  __n128 result = v20;
  *uint64_t v16 = v19;
  v16[1] = v20;
  v16[2].n128_u64[0] = v12;
  uint64_t v18 = (uint64_t *)((char *)a8 + updated[20]);
  *uint64_t v18 = a6;
  v18[1] = a7;
  return result;
}

uint64_t sub_25EA14494()
{
  return sub_25EA17824();
}

uint64_t sub_25EA144AC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25EA144F0()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_25EA1453C()
{
  unint64_t result = qword_26A7275A8;
  if (!qword_26A7275A8)
  {
    sub_25E9ECF4C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7275A8);
  }
  return result;
}

uint64_t sub_25EA14594@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v41 = a1;
  uint64_t v42 = a3;
  uint64_t v5 = *(void *)(a2 - 8);
  uint64_t v39 = *(void *)(v5 + 64);
  uint64_t v6 = MEMORY[0x270FA5388](a1);
  uint64_t v36 = (char *)v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(v8 + 16);
  uint64_t v40 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v33 = (char *)v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _s11ValueReaderVMa();
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getWitnessTable();
  uint64_t v14 = sub_25EA36000();
  uint64_t v34 = v14;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v15 = *(void *)(a2 + 32);
  uint64_t v43 = v14;
  uint64_t v44 = v9;
  uint64_t v45 = WitnessTable;
  uint64_t v46 = v15;
  uint64_t v37 = MEMORY[0x263F1B260];
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v38 = *(void *)(OpaqueTypeMetadata2 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](OpaqueTypeMetadata2);
  __n128 v19 = (char *)v32 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  long long v21 = (char *)v32 - v20;
  sub_25E9ECFE4((uint64_t)v13);
  swift_getAtKeyPath();
  sub_25EA17858((uint64_t)v13);
  v32[3] = *(unsigned __int8 *)(v3 + *(int *)(a2 + 72));
  uint64_t v22 = v36;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v36, v3, a2);
  unint64_t v23 = (*(unsigned __int8 *)(v5 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v24 = swift_allocObject();
  uint64_t v25 = *(void *)(a2 + 24);
  *(void *)(v24 + 16) = v9;
  *(void *)(v24 + 24) = v25;
  *(void *)(v24 + 32) = v15;
  *(_OWORD *)(v24 + 40) = *(_OWORD *)(a2 + 40);
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v24 + v23, v22, a2);
  uint64_t v26 = swift_checkMetadataState();
  uint64_t v27 = v33;
  uint64_t v28 = WitnessTable;
  sub_25EA36050();
  swift_release();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v27, v9);
  uint64_t v43 = v26;
  uint64_t v44 = v9;
  uint64_t v45 = v28;
  uint64_t v46 = v15;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  sub_25E9EC324(v19, OpaqueTypeMetadata2, OpaqueTypeConformance2);
  uint64_t v30 = *(void (**)(char *, uint64_t))(v38 + 8);
  v30(v19, OpaqueTypeMetadata2);
  sub_25E9EC324(v21, OpaqueTypeMetadata2, OpaqueTypeConformance2);
  return ((uint64_t (*)(char *, uint64_t))v30)(v21, OpaqueTypeMetadata2);
}

uint64_t sub_25EA149BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v26 = a8;
  uint64_t v11 = *(void *)(a5 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = v14;
  uint64_t v28 = v15;
  uint64_t v29 = v16;
  *(void *)&long long v30 = v17;
  *((void *)&v30 + 1) = v18;
  uint64_t updated = (int *)type metadata accessor for UpdateScopeWithAmbiguousEnvironmentTruthViewModifier();
  (*(void (**)(uint64_t))(a3 + updated[20]))(a2);
  uint64_t v20 = (uint64_t *)(a3 + updated[19]);
  uint64_t v21 = v20[1];
  uint64_t v22 = v20[2];
  uint64_t v27 = *v20;
  uint64_t v28 = v21;
  uint64_t v29 = v22;
  long long v30 = *(_OWORD *)(v20 + 3);
  unint64_t v23 = *(void **)(a3 + updated[15]);
  uint64_t v24 = a3 + updated[17];
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_25EA00CB8(v23, (uint64_t)v13, v24);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, a5);
}

uint64_t type metadata accessor for UpdateScopeWithEnvironmentTruthViewModifier()
{
  return swift_getGenericMetadata();
}

uint64_t sub_25EA14B6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_25EA35FD0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a2, a1, v4);
}

uint64_t _s11ValueReaderVMa()
{
  uint64_t result = qword_26A7282C0;
  if (!qword_26A7282C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t type metadata accessor for UpdateScopeWithAmbiguousEnvironmentTruthViewModifier()
{
  return swift_getGenericMetadata();
}

uint64_t sub_25EA14C3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25EA35FD0();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  return v5(a1, a2, v4);
}

uint64_t sub_25EA14CA8(uint64_t a1)
{
  uint64_t v2 = sub_25EA35FD0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t sub_25EA14D0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25EA35FD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_25EA14D70(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25EA35FD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_25EA14DD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25EA35FD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_25EA14E38(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25EA35FD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_25EA14E9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25EA14EB0);
}

uint64_t sub_25EA14EB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25EA35FD0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t sub_25EA14F1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25EA14F30);
}

uint64_t sub_25EA14F30(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25EA35FD0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t sub_25EA14FA0()
{
  uint64_t result = sub_25EA35FD0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void sub_25EA1502C()
{
  sub_25EA15AE8(319, qword_26A7275B0, MEMORY[0x263F185C8]);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void *sub_25EA15104(void *a1, void *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    uint64_t v4 = (void *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    sub_25EA15AE8(0, qword_26A7275B0, MEMORY[0x263F185C8]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_25EA35FD0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(v4, a2, v7);
    }
    else
    {
      *uint64_t v4 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[14];
    *(void *)((char *)v4 + a3[13]) = *(void *)((char *)a2 + a3[13]);
    *(void *)((char *)v4 + v9) = *(void *)((char *)a2 + v9);
    uint64_t v10 = a3[16];
    *((unsigned char *)v4 + a3[15]) = *((unsigned char *)a2 + a3[15]);
    uint64_t v11 = (void *)((char *)v4 + v10);
    uint64_t v12 = (void *)((char *)a2 + v10);
    uint64_t v13 = v12[1];
    *uint64_t v11 = *v12;
    v11[1] = v13;
    uint64_t v14 = v12[3];
    uint64_t v11[2] = v12[2];
    v11[3] = v14;
    v11[4] = v12[4];
    uint64_t v15 = a3[17];
    uint64_t v16 = (void *)((char *)v4 + v15);
    uint64_t v17 = (void *)((char *)a2 + v15);
    uint64_t v18 = v17[1];
    *uint64_t v16 = *v17;
    v16[1] = v18;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_25EA152B8(uint64_t a1)
{
  sub_25EA15AE8(0, qword_26A7275B0, MEMORY[0x263F185C8]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = sub_25EA35FD0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_release();
}

void *sub_25EA153B4(void *a1, void *a2, int *a3)
{
  sub_25EA15AE8(0, qword_26A7275B0, MEMORY[0x263F185C8]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_25EA35FD0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[14];
  *(void *)((char *)a1 + a3[13]) = *(void *)((char *)a2 + a3[13]);
  *(void *)((char *)a1 + v7) = *(void *)((char *)a2 + v7);
  uint64_t v8 = a3[16];
  *((unsigned char *)a1 + a3[15]) = *((unsigned char *)a2 + a3[15]);
  uint64_t v9 = (void *)((char *)a1 + v8);
  uint64_t v10 = (void *)((char *)a2 + v8);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = v10[3];
  void v9[2] = v10[2];
  v9[3] = v12;
  v9[4] = v10[4];
  uint64_t v13 = a3[17];
  uint64_t v14 = (void *)((char *)a1 + v13);
  uint64_t v15 = (void *)((char *)a2 + v13);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *sub_25EA1551C(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_25EA156D8((uint64_t)a1);
    sub_25EA15AE8(0, qword_26A7275B0, MEMORY[0x263F185C8]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_25EA35FD0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  *(void *)((char *)a1 + a3[13]) = *(void *)((char *)a2 + a3[13]);
  swift_retain();
  swift_release();
  *(void *)((char *)a1 + a3[14]) = *(void *)((char *)a2 + a3[14]);
  swift_retain();
  swift_release();
  *((unsigned char *)a1 + a3[15]) = *((unsigned char *)a2 + a3[15]);
  uint64_t v7 = a3[16];
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  *(void *)((char *)a1 + v7) = *(void *)((char *)a2 + v7);
  swift_retain();
  swift_release();
  v8[1] = v9[1];
  swift_retain();
  swift_release();
  uint64_t v8[2] = v9[2];
  v8[3] = v9[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8[4] = v9[4];
  uint64_t v10 = a3[17];
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  uint64_t v13 = v12[1];
  *uint64_t v11 = *v12;
  v11[1] = v13;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_25EA156D8(uint64_t a1)
{
  sub_25EA15AE8(0, qword_26A7275B0, MEMORY[0x263F185C8]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

char *sub_25EA15750(char *a1, char *a2, int *a3)
{
  sub_25EA15AE8(0, qword_26A7275B0, MEMORY[0x263F185C8]);
  uint64_t v7 = v6;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_25EA35FD0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
  }
  uint64_t v9 = a3[14];
  *(void *)&a1[a3[13]] = *(void *)&a2[a3[13]];
  *(void *)&a1[v9] = *(void *)&a2[v9];
  uint64_t v10 = a3[16];
  a1[a3[15]] = a2[a3[15]];
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  long long v13 = *((_OWORD *)v12 + 1);
  *(_OWORD *)uint64_t v11 = *(_OWORD *)v12;
  *((_OWORD *)v11 + 1) = v13;
  *((void *)v11 + 4) = *((void *)v12 + 4);
  *(_OWORD *)&a1[a3[17]] = *(_OWORD *)&a2[a3[17]];
  return a1;
}

char *sub_25EA15874(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_25EA156D8((uint64_t)a1);
    sub_25EA15AE8(0, qword_26A7275B0, MEMORY[0x263F185C8]);
    uint64_t v7 = v6;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v8 = sub_25EA35FD0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
    }
  }
  *(void *)&a1[a3[13]] = *(void *)&a2[a3[13]];
  swift_release();
  *(void *)&a1[a3[14]] = *(void *)&a2[a3[14]];
  swift_release();
  uint64_t v9 = a3[16];
  a1[a3[15]] = a2[a3[15]];
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  *(void *)&a1[v9] = *(void *)&a2[v9];
  swift_release();
  *((void *)v10 + 1) = *((void *)v11 + 1);
  swift_release();
  uint64_t v12 = *((void *)v11 + 3);
  *((void *)v10 + 2) = *((void *)v11 + 2);
  *((void *)v10 + 3) = v12;
  swift_bridgeObjectRelease();
  *((void *)v10 + 4) = *((void *)v11 + 4);
  *(_OWORD *)&a1[a3[17]] = *(_OWORD *)&a2[a3[17]];
  swift_release();
  return a1;
}

uint64_t sub_25EA159F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25EA15A0C);
}

uint64_t sub_25EA15A0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25EA15AE8(0, qword_26A7282D0, MEMORY[0x263F185D0]);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 52));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

void sub_25EA15AE8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v6 = _s11ValueReaderVMa();
    unint64_t v7 = a3(a1, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t sub_25EA15B48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25EA15B5C);
}

void sub_25EA15B5C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_25EA15AE8(0, qword_26A7282D0, MEMORY[0x263F185D0]);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v10(a1, a2, a2, v8);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 52)) = (a2 - 1);
  }
}

uint64_t sub_25EA15C34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 72);
}

void sub_25EA15C3C()
{
  sub_25EA15AE8(319, qword_26A7275B0, MEMORY[0x263F185C8]);
  if (v0 <= 0x3F)
  {
    swift_getAssociatedTypeWitness();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void *sub_25EA15D68(void *a1, unsigned __int8 *a2)
{
  uint64_t v4 = sub_25EA35FD0();
  uint64_t v5 = *(void *)(v4 - 8);
  if (*(void *)(v5 + 64) <= 8uLL) {
    uint64_t v6 = 8;
  }
  else {
    uint64_t v6 = *(void *)(*(void *)(v4 - 8) + 64);
  }
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v9 = *(_DWORD *)(v8 + 80);
  uint64_t v10 = *(void *)(v8 + 64);
  unsigned int v11 = v9 | *(_DWORD *)(v5 + 80) & 0xF8;
  if (v11 > 7
    || ((*(_DWORD *)(v5 + 80) | *(_DWORD *)(v8 + 80)) & 0x100000) != 0
    || ((((((v9 + (((v6 & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8) & ~v9) + v10) & 0xFFFFFFFFFFFFFFF8)
       + 55) & 0xFFFFFFFFFFFFFFF8)
     + 16 > 0x18)
  {
    uint64_t v14 = *(void *)a2;
    *a1 = v14;
    a1 = (void *)(v14 + (((v11 | 7) + 16) & ~(unint64_t)(v11 | 7)));
  }
  else
  {
    unsigned int v15 = a2[v6];
    unsigned int v16 = v15 - 2;
    if (v15 >= 2)
    {
      if (v6 <= 3) {
        uint64_t v17 = v6;
      }
      else {
        uint64_t v17 = 4;
      }
      switch(v17)
      {
        case 1:
          int v18 = *a2;
          if (v6 < 4) {
            goto LABEL_23;
          }
          goto LABEL_25;
        case 2:
          int v18 = *(unsigned __int16 *)a2;
          if (v6 >= 4) {
            goto LABEL_25;
          }
          goto LABEL_23;
        case 3:
          int v18 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          if (v6 < 4) {
            goto LABEL_23;
          }
          goto LABEL_25;
        case 4:
          int v18 = *(_DWORD *)a2;
          if (v6 < 4) {
LABEL_23:
          }
            unsigned int v15 = (v18 | (v16 << (8 * v6))) + 2;
          else {
LABEL_25:
          }
            unsigned int v15 = v18 + 2;
          break;
        default:
          break;
      }
    }
    uint64_t v35 = AssociatedTypeWitness;
    uint64_t v19 = v6 + 1;
    uint64_t v20 = ~v9;
    if (v15 == 1)
    {
      (*(void (**)(void *, unsigned __int8 *, uint64_t))(v5 + 16))(a1, a2, v4);
      char v21 = 1;
    }
    else
    {
      *a1 = *(void *)a2;
      swift_retain();
      char v21 = 0;
    }
    *((unsigned char *)a1 + v6) = v21;
    uint64_t v22 = (void *)(((unint64_t)a1 + v19 + 7) & 0xFFFFFFFFFFFFFFF8);
    unint64_t v23 = (void *)((unint64_t)&a2[v19 + 7] & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v22 = *v23;
    uint64_t v24 = (void *)(((unint64_t)v22 + 15) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v25 = (void *)(((unint64_t)v23 + 15) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v24 = *v25;
    uint64_t v26 = ((unint64_t)v24 + v9 + 8) & v20;
    uint64_t v27 = ((unint64_t)v25 + v9 + 8) & v20;
    uint64_t v28 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
    swift_retain();
    swift_retain();
    v28(v26, v27, v35);
    *(unsigned char *)(v26 + v10) = *(unsigned char *)(v27 + v10);
    uint64_t v29 = (void *)((v26 + v10) & 0xFFFFFFFFFFFFFFF8);
    long long v30 = (void *)((v27 + v10) & 0xFFFFFFFFFFFFFFF8);
    v29[1] = v30[1];
    void v29[2] = v30[2];
    v29[3] = v30[3];
    v29[4] = v30[4];
    uint64_t v29[5] = v30[5];
    uint64_t v31 = (void *)(((unint64_t)v29 + 55) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v32 = (void *)(((unint64_t)v30 + 55) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v33 = v32[1];
    *uint64_t v31 = *v32;
    v31[1] = v33;
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
  }
  swift_retain();
  return a1;
}

uint64_t sub_25EA160C4(unsigned __int8 *a1)
{
  uint64_t v2 = sub_25EA35FD0();
  if (*(void *)(*(void *)(v2 - 8) + 64) <= 8uLL) {
    uint64_t v3 = 8;
  }
  else {
    uint64_t v3 = *(void *)(*(void *)(v2 - 8) + 64);
  }
  unsigned int v4 = a1[v3];
  unsigned int v5 = v4 - 2;
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
        goto LABEL_13;
      case 2:
        int v7 = *(unsigned __int16 *)a1;
        goto LABEL_13;
      case 3:
        int v7 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_13;
      case 4:
        int v7 = *(_DWORD *)a1;
LABEL_13:
        int v8 = (v7 | (v5 << (8 * v3))) + 2;
        unsigned int v4 = v7 + 2;
        if (v3 < 4) {
          unsigned int v4 = v8;
        }
        break;
      default:
        break;
    }
  }
  if (v4 == 1) {
    (*(void (**)(unsigned __int8 *, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  }
  else {
    swift_release();
  }
  swift_release();
  swift_release();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(unint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 8))((((((unint64_t)&a1[v3 + 8] & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)+ *(unsigned __int8 *)(*(void *)(AssociatedTypeWitness - 8) + 80)+ 8) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(AssociatedTypeWitness - 8) + 80), AssociatedTypeWitness);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_release();
}

void *sub_25EA162C0(void *a1, unsigned __int8 *a2)
{
  uint64_t v4 = sub_25EA35FD0();
  if (*(void *)(*(void *)(v4 - 8) + 64) <= 8uLL) {
    uint64_t v5 = 8;
  }
  else {
    uint64_t v5 = *(void *)(*(void *)(v4 - 8) + 64);
  }
  unsigned int v6 = a2[v5];
  unsigned int v7 = v6 - 2;
  if (v6 >= 2)
  {
    if (v5 <= 3) {
      uint64_t v8 = v5;
    }
    else {
      uint64_t v8 = 4;
    }
    switch(v8)
    {
      case 1:
        int v9 = *a2;
        if (v5 >= 4) {
          goto LABEL_18;
        }
        goto LABEL_14;
      case 2:
        int v9 = *(unsigned __int16 *)a2;
        if (v5 >= 4) {
          goto LABEL_18;
        }
        goto LABEL_14;
      case 3:
        int v9 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        if (v5 < 4) {
          goto LABEL_14;
        }
        goto LABEL_18;
      case 4:
        int v9 = *(_DWORD *)a2;
        if (v5 < 4)
        {
LABEL_14:
          unsigned int v6 = (v9 | (v7 << (8 * v5))) + 2;
          break;
        }
LABEL_18:
        if (v9 != -1) {
          goto LABEL_19;
        }
        goto LABEL_16;
      default:
        break;
    }
  }
  if (v6 == 1)
  {
LABEL_16:
    (*(void (**)(void *, unsigned __int8 *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
    char v10 = 1;
  }
  else
  {
LABEL_19:
    *a1 = *(void *)a2;
    swift_retain();
    char v10 = 0;
  }
  *((unsigned char *)a1 + v5) = v10;
  unsigned int v11 = (void *)(((unint64_t)a1 + v5 + 8) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v12 = (void *)((unint64_t)&a2[v5 + 8] & 0xFFFFFFFFFFFFFFF8);
  *unsigned int v11 = *v12;
  long long v13 = (void *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v14 = (void *)(((unint64_t)v12 + 15) & 0xFFFFFFFFFFFFFFF8);
  *long long v13 = *v14;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v16 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16);
  uint64_t v18 = v16 + 16;
  uint64_t v19 = *(unsigned __int8 *)(v16 + 80);
  uint64_t v20 = ((unint64_t)v13 + v19 + 8) & ~v19;
  uint64_t v21 = ((unint64_t)v14 + v19 + 8) & ~v19;
  swift_retain();
  swift_retain();
  v17(v20, v21, AssociatedTypeWitness);
  uint64_t v22 = *(void *)(v18 + 48);
  uint64_t v23 = v22 + v20;
  uint64_t v24 = v22 + v21;
  *(unsigned char *)uint64_t v23 = *(unsigned char *)v24;
  v23 &= 0xFFFFFFFFFFFFFFF8;
  v24 &= 0xFFFFFFFFFFFFFFF8;
  *(void *)(v23 + 8) = *(void *)(v24 + 8);
  *(void *)(v23 + 16) = *(void *)(v24 + 16);
  *(void *)(v23 + 24) = *(void *)(v24 + 24);
  *(void *)(v23 + 32) = *(void *)(v24 + 32);
  *(void *)(v23 + 40) = *(void *)(v24 + 40);
  uint64_t v25 = (void *)((v23 + 55) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v26 = (void *)((v24 + 55) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v27 = v26[1];
  *uint64_t v25 = *v26;
  v25[1] = v27;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

unsigned __int8 *sub_25EA16568(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (a1 != a2)
  {
    uint64_t v4 = sub_25EA35FD0();
    uint64_t v5 = *(void *)(v4 - 8);
    if (*(void *)(v5 + 64) <= 8uLL) {
      uint64_t v6 = 8;
    }
    else {
      uint64_t v6 = *(void *)(*(void *)(v4 - 8) + 64);
    }
    unsigned int v7 = a1[v6];
    unsigned int v8 = v7 - 2;
    if (v7 >= 2)
    {
      if (v6 <= 3) {
        uint64_t v9 = v6;
      }
      else {
        uint64_t v9 = 4;
      }
      switch(v9)
      {
        case 1:
          int v10 = *a1;
          if (v6 >= 4) {
            goto LABEL_19;
          }
          goto LABEL_15;
        case 2:
          int v10 = *(unsigned __int16 *)a1;
          if (v6 >= 4) {
            goto LABEL_19;
          }
          goto LABEL_15;
        case 3:
          int v10 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          if (v6 < 4) {
            goto LABEL_15;
          }
          goto LABEL_19;
        case 4:
          int v10 = *(_DWORD *)a1;
          if (v6 < 4)
          {
LABEL_15:
            unsigned int v7 = (v10 | (v8 << (8 * v6))) + 2;
            break;
          }
LABEL_19:
          if (v10 != -1) {
            goto LABEL_20;
          }
          goto LABEL_17;
        default:
          break;
      }
    }
    if (v7 == 1) {
LABEL_17:
    }
      (*(void (**)(unsigned __int8 *, uint64_t))(v5 + 8))(a1, v4);
    else {
LABEL_20:
    }
      swift_release();
    unsigned int v11 = a2[v6];
    unsigned int v12 = v11 - 2;
    if (v11 >= 2)
    {
      if (v6 <= 3) {
        uint64_t v13 = v6;
      }
      else {
        uint64_t v13 = 4;
      }
      switch(v13)
      {
        case 1:
          int v14 = *a2;
          if (v6 >= 4) {
            goto LABEL_35;
          }
          goto LABEL_31;
        case 2:
          int v14 = *(unsigned __int16 *)a2;
          if (v6 >= 4) {
            goto LABEL_35;
          }
          goto LABEL_31;
        case 3:
          int v14 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          if (v6 < 4) {
            goto LABEL_31;
          }
          goto LABEL_35;
        case 4:
          int v14 = *(_DWORD *)a2;
          if (v6 < 4)
          {
LABEL_31:
            unsigned int v11 = (v14 | (v12 << (8 * v6))) + 2;
            break;
          }
LABEL_35:
          if (v14 != -1) {
            goto LABEL_36;
          }
          goto LABEL_33;
        default:
          break;
      }
    }
    if (v11 == 1)
    {
LABEL_33:
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v5 + 16))(a1, a2, v4);
      a1[v6] = 1;
    }
    else
    {
LABEL_36:
      *(void *)a1 = *(void *)a2;
      a1[v6] = 0;
      swift_retain();
    }
  }
  unint64_t v15 = *(void *)(*(void *)(sub_25EA35FD0() - 8) + 64);
  if (v15 <= 8) {
    unint64_t v15 = 8;
  }
  unint64_t v16 = v15 + 8;
  uint64_t v17 = (void *)((unint64_t)&a1[v16] & 0xFFFFFFFFFFFFFFF8);
  unint64_t v18 = (unint64_t)&a2[v16];
  unint64_t v19 = (v18 & 0xFFFFFFFFFFFFFFF8) + 15;
  *uint64_t v17 = *(void *)(v18 & 0xFFFFFFFFFFFFFFF8);
  swift_retain();
  swift_release();
  uint64_t v20 = (void *)(((unint64_t)v17 + 15) & 0xFFFFFFFFFFFFFFF8);
  v19 &= 0xFFFFFFFFFFFFFFF8;
  *uint64_t v20 = *(void *)v19;
  swift_retain();
  swift_release();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v22 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v23 = v22 + 24;
  uint64_t v24 = *(unsigned __int8 *)(v22 + 80);
  uint64_t v25 = ((unint64_t)v20 + v24 + 8) & ~v24;
  uint64_t v26 = (v24 + 8 + v19) & ~v24;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 24))(v25, v26, AssociatedTypeWitness);
  uint64_t v27 = *(void *)(v23 + 40);
  unint64_t v28 = v27 + v25;
  unint64_t v29 = v27 + v26;
  *(unsigned char *)unint64_t v28 = *(unsigned char *)v29;
  long long v30 = (void *)(v28 & 0xFFFFFFFFFFFFFFF8);
  uint64_t v31 = (void *)(v29 & 0xFFFFFFFFFFFFFFF8);
  *(void *)((v28 & 0xFFFFFFFFFFFFFFF8) + 8) = *(void *)((v29 & 0xFFFFFFFFFFFFFFF8) + 8);
  swift_retain();
  swift_release();
  v30[2] = v31[2];
  swift_retain();
  swift_release();
  v30[3] = v31[3];
  v30[4] = v31[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  _OWORD v30[5] = v31[5];
  uint64_t v32 = (void *)(((unint64_t)v30 + 55) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v33 = (void *)(((unint64_t)v31 + 55) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v34 = v33[1];
  *uint64_t v32 = *v33;
  v32[1] = v34;
  swift_retain();
  swift_release();
  return a1;
}

void *sub_25EA16944(void *a1, unsigned __int8 *a2)
{
  uint64_t v4 = sub_25EA35FD0();
  if (*(void *)(*(void *)(v4 - 8) + 64) <= 8uLL) {
    uint64_t v5 = 8;
  }
  else {
    uint64_t v5 = *(void *)(*(void *)(v4 - 8) + 64);
  }
  unsigned int v6 = a2[v5];
  unsigned int v7 = v6 - 2;
  if (v6 >= 2)
  {
    if (v5 <= 3) {
      uint64_t v8 = v5;
    }
    else {
      uint64_t v8 = 4;
    }
    switch(v8)
    {
      case 1:
        int v9 = *a2;
        if (v5 >= 4) {
          goto LABEL_18;
        }
        goto LABEL_14;
      case 2:
        int v9 = *(unsigned __int16 *)a2;
        if (v5 >= 4) {
          goto LABEL_18;
        }
        goto LABEL_14;
      case 3:
        int v9 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        if (v5 < 4) {
          goto LABEL_14;
        }
        goto LABEL_18;
      case 4:
        int v9 = *(_DWORD *)a2;
        if (v5 < 4)
        {
LABEL_14:
          unsigned int v6 = (v9 | (v7 << (8 * v5))) + 2;
          break;
        }
LABEL_18:
        if (v9 != -1) {
          goto LABEL_19;
        }
        goto LABEL_16;
      default:
        break;
    }
  }
  if (v6 == 1)
  {
LABEL_16:
    (*(void (**)(void *, unsigned __int8 *, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
    char v10 = 1;
  }
  else
  {
LABEL_19:
    char v10 = 0;
    *a1 = *(void *)a2;
  }
  *((unsigned char *)a1 + v5) = v10;
  unsigned int v11 = (void *)(((unint64_t)a1 + v5 + 8) & 0xFFFFFFFFFFFFFFF8);
  unsigned int v12 = (void *)((unint64_t)&a2[v5 + 8] & 0xFFFFFFFFFFFFFFF8);
  *unsigned int v11 = *v12;
  uint64_t v13 = (void *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8);
  int v14 = (void *)(((unint64_t)v12 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v13 = *v14;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v16 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v17 = v16 + 32;
  uint64_t v18 = *(unsigned __int8 *)(v16 + 80);
  uint64_t v19 = ((unint64_t)v13 + v18 + 8) & ~v18;
  uint64_t v20 = ((unint64_t)v14 + v18 + 8) & ~v18;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 32))(v19, v20, AssociatedTypeWitness);
  uint64_t v21 = *(void *)(v17 + 32);
  uint64_t v22 = v21 + v19;
  uint64_t v23 = v21 + v20;
  *(unsigned char *)uint64_t v22 = *(unsigned char *)v23;
  v22 &= 0xFFFFFFFFFFFFFFF8;
  v23 &= 0xFFFFFFFFFFFFFFF8;
  long long v24 = *(_OWORD *)(v23 + 24);
  uint64_t v25 = *(void *)(v23 + 40);
  *(_OWORD *)(v22 + 8) = *(_OWORD *)(v23 + 8);
  *(void *)(v22 + 40) = v25;
  *(_OWORD *)(v22 + 24) = v24;
  *(_OWORD *)((v22 + 55) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((v23 + 55) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

unsigned __int8 *sub_25EA16BA0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (a1 != a2)
  {
    uint64_t v4 = sub_25EA35FD0();
    uint64_t v5 = *(void *)(v4 - 8);
    if (*(void *)(v5 + 64) <= 8uLL) {
      uint64_t v6 = 8;
    }
    else {
      uint64_t v6 = *(void *)(*(void *)(v4 - 8) + 64);
    }
    unsigned int v7 = a1[v6];
    unsigned int v8 = v7 - 2;
    if (v7 >= 2)
    {
      if (v6 <= 3) {
        uint64_t v9 = v6;
      }
      else {
        uint64_t v9 = 4;
      }
      switch(v9)
      {
        case 1:
          int v10 = *a1;
          if (v6 >= 4) {
            goto LABEL_19;
          }
          goto LABEL_15;
        case 2:
          int v10 = *(unsigned __int16 *)a1;
          if (v6 >= 4) {
            goto LABEL_19;
          }
          goto LABEL_15;
        case 3:
          int v10 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          if (v6 < 4) {
            goto LABEL_15;
          }
          goto LABEL_19;
        case 4:
          int v10 = *(_DWORD *)a1;
          if (v6 < 4)
          {
LABEL_15:
            unsigned int v7 = (v10 | (v8 << (8 * v6))) + 2;
            break;
          }
LABEL_19:
          if (v10 != -1) {
            goto LABEL_20;
          }
          goto LABEL_17;
        default:
          break;
      }
    }
    if (v7 == 1) {
LABEL_17:
    }
      (*(void (**)(unsigned __int8 *, uint64_t))(v5 + 8))(a1, v4);
    else {
LABEL_20:
    }
      swift_release();
    unsigned int v11 = a2[v6];
    unsigned int v12 = v11 - 2;
    if (v11 >= 2)
    {
      if (v6 <= 3) {
        uint64_t v13 = v6;
      }
      else {
        uint64_t v13 = 4;
      }
      switch(v13)
      {
        case 1:
          int v14 = *a2;
          if (v6 >= 4) {
            goto LABEL_35;
          }
          goto LABEL_31;
        case 2:
          int v14 = *(unsigned __int16 *)a2;
          if (v6 >= 4) {
            goto LABEL_35;
          }
          goto LABEL_31;
        case 3:
          int v14 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          if (v6 < 4) {
            goto LABEL_31;
          }
          goto LABEL_35;
        case 4:
          int v14 = *(_DWORD *)a2;
          if (v6 < 4)
          {
LABEL_31:
            unsigned int v11 = (v14 | (v12 << (8 * v6))) + 2;
            break;
          }
LABEL_35:
          if (v14 != -1) {
            goto LABEL_36;
          }
          goto LABEL_33;
        default:
          break;
      }
    }
    if (v11 == 1)
    {
LABEL_33:
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v5 + 32))(a1, a2, v4);
      char v15 = 1;
    }
    else
    {
LABEL_36:
      char v15 = 0;
      *(void *)a1 = *(void *)a2;
    }
    a1[v6] = v15;
  }
  unint64_t v16 = *(void *)(*(void *)(sub_25EA35FD0() - 8) + 64);
  if (v16 <= 8) {
    unint64_t v16 = 8;
  }
  unint64_t v17 = v16 + 8;
  uint64_t v18 = (void *)((unint64_t)&a1[v17] & 0xFFFFFFFFFFFFFFF8);
  uint64_t v19 = (void *)((unint64_t)&a2[v17] & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v18 = *v19;
  swift_release();
  uint64_t v20 = (void *)(((unint64_t)v18 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v21 = (void *)(((unint64_t)v19 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v20 = *v21;
  swift_release();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v23 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v24 = v23 + 40;
  uint64_t v25 = *(unsigned __int8 *)(v23 + 80);
  uint64_t v26 = ((unint64_t)v20 + v25 + 8) & ~v25;
  uint64_t v27 = ((unint64_t)v21 + v25 + 8) & ~v25;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 40))(v26, v27, AssociatedTypeWitness);
  uint64_t v28 = *(void *)(v24 + 24);
  unint64_t v29 = v28 + v26;
  unint64_t v30 = v28 + v27;
  *(unsigned char *)unint64_t v29 = *(unsigned char *)v30;
  uint64_t v31 = (void *)(v29 & 0xFFFFFFFFFFFFFFF8);
  uint64_t v32 = (void *)(v30 & 0xFFFFFFFFFFFFFFF8);
  *(void *)((v29 & 0xFFFFFFFFFFFFFFF8) + 8) = *(void *)((v30 & 0xFFFFFFFFFFFFFFF8) + 8);
  swift_release();
  long long v31[2] = v32[2];
  swift_release();
  v31[3] = v32[3];
  v31[4] = v32[4];
  swift_bridgeObjectRelease();
  v31[5] = v32[5];
  *(_OWORD *)(((unint64_t)v31 + 55) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)v32 + 55) & 0xFFFFFFFFFFFFFFF8);
  swift_release();
  return a1;
}

uint64_t sub_25EA16F48(_DWORD *a1, unsigned int a2)
{
  unint64_t v4 = *(void *)(*(void *)(sub_25EA35FD0() - 8) + 64);
  if (v4 <= 8) {
    uint64_t v5 = 8;
  }
  else {
    uint64_t v5 = v4;
  }
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v8 = v7;
  unsigned int v9 = *(_DWORD *)(v7 + 84);
  if (v9 <= 0x7FFFFFFF) {
    unsigned int v10 = 0x7FFFFFFF;
  }
  else {
    unsigned int v10 = *(_DWORD *)(v7 + 84);
  }
  uint64_t v11 = *(unsigned __int8 *)(v7 + 80);
  if (!a2) {
    return 0;
  }
  if (v10 < a2)
  {
    unint64_t v12 = ((((((v11 + (((v5 & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8) & ~v11)
            + *(void *)(*(void *)(AssociatedTypeWitness - 8) + 64)) & 0xFFFFFFFFFFFFFFF8)
          + 55) & 0xFFFFFFFFFFFFFFF8)
        + 16;
    uint64_t v13 = v12 & 0xFFFFFFF8;
    if ((v12 & 0xFFFFFFF8) != 0) {
      unsigned int v14 = 2;
    }
    else {
      unsigned int v14 = a2 - v10 + 1;
    }
    if (v14 >= 0x10000) {
      unsigned int v15 = 4;
    }
    else {
      unsigned int v15 = 2;
    }
    if (v14 < 0x100) {
      unsigned int v15 = 1;
    }
    if (v14 >= 2) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = 0;
    }
    switch(v16)
    {
      case 1:
        int v17 = *((unsigned __int8 *)a1 + v12);
        if (!v17) {
          break;
        }
        goto LABEL_25;
      case 2:
        int v17 = *(unsigned __int16 *)((char *)a1 + v12);
        if (v17) {
          goto LABEL_25;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x25EA17154);
      case 4:
        int v17 = *(_DWORD *)((char *)a1 + v12);
        if (!v17) {
          break;
        }
LABEL_25:
        int v19 = v17 - 1;
        if (v13)
        {
          int v19 = 0;
          LODWORD(v13) = *a1;
        }
        return v10 + (v13 | v19) + 1;
      default:
        break;
    }
  }
  uint64_t v20 = (unint64_t *)(((unint64_t)a1 + v5 + 8) & 0xFFFFFFFFFFFFFFF8);
  if ((v9 & 0x80000000) != 0)
  {
    uint64_t v22 = *(uint64_t (**)(unint64_t))(v8 + 48);
    return v22(((((unint64_t)v20 + 15) & 0xFFFFFFFFFFFFFFF8) + v11 + 8) & ~v11);
  }
  else
  {
    unint64_t v21 = *v20;
    if (v21 >= 0xFFFFFFFF) {
      LODWORD(v21) = -1;
    }
    return (v21 + 1);
  }
}

void sub_25EA17168(_DWORD *a1, uint64_t a2, unsigned int a3)
{
  unint64_t v6 = *(void *)(*(void *)(sub_25EA35FD0() - 8) + 64);
  if (v6 <= 8) {
    uint64_t v7 = 8;
  }
  else {
    uint64_t v7 = v6;
  }
  uint64_t v8 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unsigned int v9 = *(_DWORD *)(v8 + 84);
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  if (v9 <= 0x7FFFFFFF) {
    unsigned int v11 = 0x7FFFFFFF;
  }
  else {
    unsigned int v11 = *(_DWORD *)(v8 + 84);
  }
  size_t v12 = ((((((v10 + (((v7 & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8) & ~v10) + *(void *)(v8 + 64)) & 0xFFFFFFFFFFFFFFF8)
        + 55) & 0xFFFFFFFFFFFFFFF8)
      + 16;
  if (v11 >= a3)
  {
    int v15 = 0;
    int v16 = a2 - v11;
    if (a2 <= v11)
    {
LABEL_20:
      switch(v15)
      {
        case 1:
          *((unsigned char *)a1 + v12) = 0;
          if (!a2) {
            return;
          }
          goto LABEL_33;
        case 2:
          *(_WORD *)((char *)a1 + v12) = 0;
          if (!a2) {
            return;
          }
          goto LABEL_33;
        case 3:
          goto LABEL_46;
        case 4:
          *(_DWORD *)((char *)a1 + v12) = 0;
          goto LABEL_32;
        default:
LABEL_32:
          if (a2)
          {
LABEL_33:
            int v19 = (void *)(((unint64_t)a1 + v7 + 8) & 0xFFFFFFFFFFFFFFF8);
            if ((v9 & 0x80000000) != 0)
            {
              unint64_t v21 = *(void (**)(unint64_t, uint64_t))(v8 + 56);
              v21(((((unint64_t)v19 + 15) & 0xFFFFFFFFFFFFFFF8) + v10 + 8) & ~v10, a2);
            }
            else
            {
              if ((a2 & 0x80000000) != 0) {
                uint64_t v20 = a2 ^ 0x80000000;
              }
              else {
                uint64_t v20 = (a2 - 1);
              }
              *int v19 = v20;
            }
          }
          break;
      }
      return;
    }
  }
  else
  {
    if (((((((v10 + (((v7 & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) + 8) & ~v10)
           + *(_DWORD *)(v8 + 64)) & 0xFFFFFFF8)
         + 55) & 0xFFFFFFF8) == 0xFFFFFFF0)
      unsigned int v13 = a3 - v11 + 1;
    else {
      unsigned int v13 = 2;
    }
    if (v13 >= 0x10000) {
      int v14 = 4;
    }
    else {
      int v14 = 2;
    }
    if (v13 < 0x100) {
      int v14 = 1;
    }
    if (v13 >= 2) {
      int v15 = v14;
    }
    else {
      int v15 = 0;
    }
    int v16 = a2 - v11;
    if (a2 <= v11) {
      goto LABEL_20;
    }
  }
  if (((((((v10 + (((v7 & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) + 8) & ~v10)
         + *(_DWORD *)(v8 + 64)) & 0xFFFFFFF8)
       + 55) & 0xFFFFFFF8) == 0xFFFFFFF0)
    int v17 = v16;
  else {
    int v17 = 1;
  }
  if (v12)
  {
    int v18 = ~v11 + a2;
    bzero(a1, v12);
    *a1 = v18;
  }
  switch(v15)
  {
    case 1:
      *((unsigned char *)a1 + v12) = v17;
      break;
    case 2:
      *(_WORD *)((char *)a1 + v12) = v17;
      break;
    case 3:
LABEL_46:
      __break(1u);
      JUMPOUT(0x25EA173D4);
    case 4:
      *(_DWORD *)((char *)a1 + v12) = v17;
      break;
    default:
      return;
  }
}

uint64_t sub_25EA173FC()
{
  return swift_getWitnessTable();
}

uint64_t sub_25EA174C4()
{
  return swift_getWitnessTable();
}

uint64_t sub_25EA1758C()
{
  return swift_getWitnessTable();
}

uint64_t sub_25EA1769C()
{
  return swift_getWitnessTable();
}

uint64_t sub_25EA177B8()
{
  return sub_25EA177D0();
}

uint64_t sub_25EA177D0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25EA1780C()
{
  return sub_25EA17824();
}

uint64_t sub_25EA17824()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25EA17858(uint64_t a1)
{
  uint64_t v2 = _s11ValueReaderVMa();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25EA178B4()
{
  uint64_t v1 = *(void *)(type metadata accessor for UpdateScopeWithEnvironmentTruthViewModifier() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  sub_25EA15AE8(0, qword_26A7275B0, MEMORY[0x263F185C8]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v3 = sub_25EA35FD0();
    (*(void (**)(unint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v0 + v2, v3);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_25EA17A30(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(v2 + 16);
  uint64_t v6 = *(void *)(v2 + 24);
  uint64_t v7 = *(void *)(type metadata accessor for UpdateScopeWithEnvironmentTruthViewModifier() - 8);
  uint64_t v8 = v2 + ((*(unsigned __int8 *)(v7 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return sub_25EA13C00(a1, a2, v8, v5, v6);
}

uint64_t sub_25EA17AEC()
{
  uint64_t updated = type metadata accessor for UpdateScopeWithAmbiguousEnvironmentTruthViewModifier();
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)(updated - 8) + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(updated - 8) + 80);
  sub_25EA15AE8(0, qword_26A7275B0, MEMORY[0x263F185C8]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v3 = sub_25EA35FD0();
    (*(void (**)(unint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v0 + v2, v3);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  unint64_t v4 = v0 + v2 + *(int *)(updated + 68);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(unint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 8))(v4, AssociatedTypeWitness);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_25EA17CE0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = v2[2];
  uint64_t v6 = v2[3];
  uint64_t v7 = v2[4];
  uint64_t v8 = v2[5];
  uint64_t v9 = v2[6];
  uint64_t v10 = *(void *)(type metadata accessor for UpdateScopeWithAmbiguousEnvironmentTruthViewModifier() - 8);
  uint64_t v11 = (uint64_t)v2 + ((*(unsigned __int8 *)(v10 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80));
  return sub_25EA149BC(a1, a2, v11, v5, v6, v7, v8, v9);
}

uint64_t sub_25EA17DA8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25EA17EDC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25EA17FAC()
{
  sub_25EA36570();
  sub_25EA36540();
  uint64_t v0 = sub_25EA36550();
  sub_25EA365C0();
  return v0;
}

uint64_t sub_25EA18034()
{
  uint64_t v1 = sub_25EA36590();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  unint64_t v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25E9EE69C(0, &qword_26A727638, MEMORY[0x263F8E818], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v11 - v6;
  uint64_t v8 = *((void *)v0 + 2);
  long long v12 = *v0;
  uint64_t v13 = v8;
  v11[1] = MEMORY[0x263F8EE78];
  uint64_t v9 = sub_25EA36580();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F8E830], v1);
  sub_25E9EE69C(0, &qword_26A727640, (uint64_t (*)(uint64_t))sub_25E9EE700, MEMORY[0x263F8D488]);
  sub_25E9EE7C8();
  swift_bridgeObjectRetain();
  return sub_25EA365A0();
}

uint64_t sub_25EA18250()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_25EA18280()
{
  return sub_25EA36560();
}

uint64_t sub_25EA182F4()
{
  sub_25EA36540();
  swift_bridgeObjectRetain();
  sub_25EA36140();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25EA18358()
{
  return sub_25EA36560();
}

uint64_t sub_25EA183C8(void *a1, void *a2)
{
  if (*a1 != *a2) {
    return 0;
  }
  if (a1[1] == a2[1] && a1[2] == a2[2]) {
    return 1;
  }
  else {
    return sub_25EA364B0();
  }
}

uint64_t sub_25EA18410(uint64_t a1, uint64_t a2)
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v4 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v6 = &v9[-v5];
  sub_25EA36570();
  sub_25EA36540();
  swift_getAssociatedConformanceWitness();
  sub_25EA360F0();
  long long v16 = v11;
  long long v17 = v12;
  uint64_t v18 = v13;
  long long v14 = *(_OWORD *)&v9[8];
  long long v15 = v10;
  uint64_t v7 = sub_25EA36550();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v4 + 16))(v6, a2, AssociatedTypeWitness);
  sub_25EA36130();
  return v7;
}

uint64_t initializeBufferWithCopyOfBuffer for RuleIdentifier(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for RuleIdentifier()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for RuleIdentifier(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for RuleIdentifier(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for RuleIdentifier(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for RuleIdentifier(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RuleIdentifier()
{
  return &type metadata for RuleIdentifier;
}

unint64_t sub_25EA18744()
{
  unint64_t result = qword_26A7283D8;
  if (!qword_26A7283D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7283D8);
  }
  return result;
}

uint64_t sub_25EA1879C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v15 = a2;
  uint64_t v5 = *(void *)(*a1 + *MEMORY[0x263F8DE50] + 8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v8 = (char *)&v14 - v7;
  uint64_t v10 = *(void *)(v3 + *(int *)(*(void *)v9 + 28));
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v16[3] = AssociatedTypeWitness;
  v16[4] = swift_getAssociatedConformanceWitness();
  long long v12 = sub_25E9F9FE8(v16);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16))(v12, a3, AssociatedTypeWitness);
  swift_beginAccess();
  sub_25EA1BBC0((uint64_t)v16, v10 + 16);
  swift_endAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v15, v5);
  return swift_setAtWritableKeyPath();
}

uint64_t sub_25EA18978(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v15 = a2;
  uint64_t v5 = *(void *)(*a1 + *MEMORY[0x263F8DE50] + 8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v8 = (char *)&v14 - v7;
  uint64_t v10 = *(void *)(v3 + *(int *)(*(void *)v9 + 28));
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v16[3] = AssociatedTypeWitness;
  v16[4] = swift_getAssociatedConformanceWitness();
  long long v12 = sub_25E9F9FE8(v16);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16))(v12, a3, AssociatedTypeWitness);
  swift_beginAccess();
  sub_25EA1BBC0((uint64_t)v16, v10 + 16);
  swift_endAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v15, v5);
  return swift_setAtWritableKeyPath();
}

uint64_t sub_25EA18B54()
{
  return swift_getAtKeyPath();
}

uint64_t sub_25EA18B60@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v6 = sub_25EA362E0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = &v15[-v8];
  swift_beginAccess();
  sub_25EA1BD64(v2 + 16, (uint64_t)v15);
  sub_25EA1BC40(0, &qword_26A7283F0, (void (*)(uint64_t))sub_25EA1BC94);
  int v10 = swift_dynamicCast();
  long long v11 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 56);
  if (v10)
  {
    uint64_t v12 = *(void *)(AssociatedTypeWitness - 8);
    v11(v9, 0, 1, AssociatedTypeWitness);
    return (*(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(v12 + 32))(a2, v9, AssociatedTypeWitness);
  }
  else
  {
    v11(v9, 1, 1, AssociatedTypeWitness);
    (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
    uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 24))(a1, AssociatedTypeWitness, AssociatedConformanceWitness);
  }
}

uint64_t sub_25EA18DE4()
{
  sub_25EA1BCEC(v0 + 16);
  return MEMORY[0x270FA0228](v0, 56, 7);
}

uint64_t sub_25EA18E1C(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(v2 + *(int *)(*(void *)(*a1 + *MEMORY[0x263F8EA20]) + 28));
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8[3] = AssociatedTypeWitness;
  v8[4] = swift_getAssociatedConformanceWitness();
  uint64_t v6 = sub_25E9F9FE8(v8);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16))(v6, a2, AssociatedTypeWitness);
  swift_beginAccess();
  sub_25EA1BBC0((uint64_t)v8, v4 + 16);
  swift_endAccess();
  return swift_getAtKeyPath();
}

uint64_t Dependencies.subscript.getter@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v7 = v3 + *(int *)(type metadata accessor for Dependencies() + 24);
  uint64_t v9 = *(void *)(v3 + 8);
  return sub_25EA23400(v7, &v9, a1, a2, a3);
}

{
  uint64_t v3;
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  uint64_t v14 = a3;
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v9 = (char *)&v13 - v8;
  int v10 = type metadata accessor for Dependencies();
  sub_25EA18B60(v3, (uint64_t)v9);
  long long v11 = v3 + *(int *)(v10 + 24);
  uint64_t v15 = *(void *)(v3 + 8);
  sub_25EA23574((uint64_t)v9, v11, &v15, a1, a2, v14);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, AssociatedTypeWitness);
}

{
  uint64_t v3;
  uint64_t v7;
  uint64_t v9;

  uint64_t v7 = v3 + *(int *)(type metadata accessor for Dependencies() + 24);
  uint64_t v9 = *(void *)(v3 + 8);
  return sub_25EA234B4(v7, &v9, a1, a2, a3);
}

uint64_t type metadata accessor for Dependencies()
{
  uint64_t result = qword_26A7283E0;
  if (!qword_26A7283E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t Dependencies.subscript.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void v13[2] = a3;
  void v13[3] = a4;
  uint64_t v8 = *(void *)(v4 + 8);
  v13[4] = a1;
  uint64_t v14 = v8;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v10 = type metadata accessor for StaticTruth();
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_25EA22C14((uint64_t)sub_25EA19278, (uint64_t)v13, a3, &v14, v10, a3, WitnessTable, a4);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 8))(a1, AssociatedTypeWitness);
}

{
  uint64_t v4;
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned char *v12;
  uint64_t v13;
  uint64_t WitnessTable;
  unsigned char v16[16];
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v9 = swift_getAssociatedTypeWitness();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = &v16[-v11];
  long long v17 = a3;
  uint64_t v18 = a4;
  int v19 = a1;
  type metadata accessor for Dependencies();
  sub_25EA18B60(v4, (uint64_t)v12);
  uint64_t v20 = *(void *)(v4 + 8);
  uint64_t v13 = type metadata accessor for StaticTruth();
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_25EA22E5C((uint64_t)sub_25EA19AF8, (uint64_t)v16, a3, (uint64_t)v12, &v20, v13, a3, WitnessTable, a4);
  (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v12, v9);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 8))(a1, AssociatedTypeWitness);
}

uint64_t sub_25EA1918C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v6 = (char *)&v9 - v5;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v9 - v5, a1, AssociatedTypeWitness);
  return StaticTruth.init(state:)((uint64_t)v6, AssociatedTypeWitness, a2);
}

uint64_t sub_25EA19278@<X0>(uint64_t a1@<X8>)
{
  return sub_25EA1918C(*(void *)(v1 + 32), a1);
}

void (*Dependencies.subscript.modify(void *a1, uint64_t a2, uint64_t a3, uint64_t a4))(uint64_t **a1, char a2)
{
  uint64_t v8 = malloc(0x38uLL);
  *a1 = v8;
  v8[1] = a4;
  uint64_t v8[2] = v4;
  *uint64_t v8 = a3;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8[3] = AssociatedTypeWitness;
  uint64_t v10 = *(void *)(AssociatedTypeWitness - 8);
  v8[4] = v10;
  size_t v11 = *(void *)(v10 + 64);
  uint64_t v8[5] = malloc(v11);
  uint64_t v12 = malloc(v11);
  v8[6] = v12;
  uint64_t v13 = v4 + *(int *)(type metadata accessor for Dependencies() + 24);
  uint64_t v15 = *(void *)(v4 + 8);
  sub_25EA23400(v13, &v15, a3, a4, (uint64_t)v12);
  return sub_25EA193E4;
}

{
  uint64_t v4;
  uint64_t v5;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  size_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  size_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(void *, uint64_t);
  uint64_t AssociatedTypeWitness;
  uint64_t v23;

  uint64_t v5 = v4;
  uint64_t v9 = malloc(0x68uLL);
  *a1 = v9;
  v9[1] = a4;
  void v9[2] = v4;
  *uint64_t v9 = a3;
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v9[3] = AssociatedTypeWitness;
  uint64_t v10 = *(void *)(AssociatedTypeWitness - 8);
  size_t v11 = v10;
  v9[4] = v10;
  uint64_t v12 = *(void *)(v10 + 64);
  v9[5] = malloc(v12);
  uint64_t v13 = malloc(v12);
  v9[6] = v13;
  uint64_t v14 = swift_checkMetadataState();
  v9[7] = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  v9[8] = v15;
  long long v16 = *(void *)(v15 + 64);
  v9[9] = malloc(v16);
  long long v17 = malloc(v16);
  v9[10] = v17;
  uint64_t v18 = type metadata accessor for Dependencies();
  *((_DWORD *)v9 + 24) = *(_DWORD *)(v18 + 28);
  sub_25EA18B60(v5, (uint64_t)v13);
  int v19 = v5 + *(int *)(v18 + 24);
  uint64_t v23 = *(void *)(v5 + 8);
  sub_25EA23574((uint64_t)v13, v19, &v23, a3, a4, (uint64_t)v17);
  uint64_t v20 = *(void (**)(void *, uint64_t))(v11 + 8);
  v20(v13, AssociatedTypeWitness);
  v9[11] = v20;
  return sub_25EA19D88;
}

void sub_25EA193E4(uint64_t **a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a1)[5];
  uint64_t v4 = (void *)(*a1)[6];
  uint64_t v5 = (*a1)[3];
  uint64_t v6 = (*a1)[4];
  uint64_t v7 = (*a1)[1];
  uint64_t v8 = (*a1)[2];
  uint64_t v9 = **a1;
  if (a2)
  {
    uint64_t v10 = (*(uint64_t (**)(uint64_t, void *, uint64_t))(v6 + 16))((*a1)[5], v4, v5);
    uint64_t v20 = (uint64_t)&v20;
    MEMORY[0x270FA5388](v10);
    uint64_t v17 = v9;
    uint64_t v18 = v7;
    int v19 = v3;
    uint64_t v21 = *(void *)(v8 + 8);
    uint64_t v11 = type metadata accessor for StaticTruth();
    uint64_t WitnessTable = swift_getWitnessTable();
    sub_25EA22C14((uint64_t)sub_25EA1BDE4, (uint64_t)v16, v9, &v21, v11, v9, WitnessTable, v7);
    uint64_t v13 = *(void (**)(void *, uint64_t))(v6 + 8);
    v13(v3, v5);
    v13(v4, v5);
  }
  else
  {
    uint64_t v20 = (uint64_t)&v20;
    MEMORY[0x270FA5388](a1);
    uint64_t v17 = v9;
    uint64_t v18 = v7;
    int v19 = v4;
    uint64_t v21 = *(void *)(v8 + 8);
    uint64_t v14 = type metadata accessor for StaticTruth();
    uint64_t v15 = swift_getWitnessTable();
    sub_25EA22C14((uint64_t)sub_25EA1BDE4, (uint64_t)v16, v9, &v21, v14, v9, v15, v7);
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v5);
  }
  free(v4);
  free(v3);
  free(v2);
}

uint64_t sub_25EA19A0C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v6 = (char *)&v9 - v5;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v9 - v5, a1, AssociatedTypeWitness);
  return StaticTruth.init(state:)((uint64_t)v6, AssociatedTypeWitness, a2);
}

uint64_t sub_25EA19AF8@<X0>(uint64_t a1@<X8>)
{
  return sub_25EA19A0C(*(void *)(v1 + 32), a1);
}

void sub_25EA19D88(uint64_t **a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void (*)(void *, uint64_t))(*a1)[11];
  uint64_t v4 = (void *)(*a1)[9];
  uint64_t v32 = (void *)(*a1)[10];
  uint64_t v6 = v2[7];
  uint64_t v5 = v2[8];
  uint64_t v8 = (void *)v2[5];
  uint64_t v7 = (void *)v2[6];
  unint64_t v30 = v3;
  uint64_t v31 = v7;
  uint64_t v10 = (void *)v2[2];
  uint64_t v9 = v2[3];
  uint64_t v28 = v2[4];
  uint64_t v29 = v9;
  uint64_t v11 = *v2;
  uint64_t v12 = v2[1];
  if (a2)
  {
    uint64_t v13 = (*(uint64_t (**)(void *, void *, uint64_t))(v5 + 16))(v4, v32, v6);
    uint64_t v27 = v25;
    uint64_t v26 = (void *)*v10;
    MEMORY[0x270FA5388](v13);
    uint64_t v22 = v11;
    uint64_t v23 = v12;
    uint64_t v24 = v4;
    sub_25EA18B60((uint64_t)v10, (uint64_t)v8);
    uint64_t v33 = v10[1];
    uint64_t v14 = type metadata accessor for StaticTruth();
    uint64_t WitnessTable = swift_getWitnessTable();
    long long v16 = v4;
    sub_25EA22E5C((uint64_t)sub_25EA1BDE8, (uint64_t)v21, v11, (uint64_t)v8, &v33, v14, v11, WitnessTable, v12);
    v30(v8, v29);
    uint64_t v17 = *(void (**)(void *, uint64_t))(v5 + 8);
    v17(v4, v6);
    v17(v32, v6);
  }
  else
  {
    uint64_t v26 = v25;
    v25[1] = *v10;
    MEMORY[0x270FA5388](a1);
    uint64_t v27 = v4;
    uint64_t v22 = v11;
    uint64_t v23 = v12;
    uint64_t v18 = v32;
    uint64_t v24 = v32;
    sub_25EA18B60((uint64_t)v10, (uint64_t)v8);
    uint64_t v33 = v10[1];
    uint64_t v19 = type metadata accessor for StaticTruth();
    uint64_t v20 = swift_getWitnessTable();
    long long v16 = v27;
    sub_25EA22E5C((uint64_t)sub_25EA1BDE8, (uint64_t)v21, v11, (uint64_t)v8, &v33, v19, v11, v20, v12);
    v30(v8, v29);
    (*(void (**)(void *, uint64_t))(v5 + 8))(v18, v6);
  }
  free(v32);
  free(v16);
  free(v31);
  free(v8);
  free(v2);
}

uint64_t Dependencies.subscript.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v15 = a3;
  uint64_t v16 = a4;
  uint64_t v17 = a5;
  uint64_t v18 = a1;
  uint64_t v19 = *(void *)(v5 + 8);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v11 = type metadata accessor for StaticTruth();
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_25EA22CBC((uint64_t)sub_25EA1A264, (uint64_t)v14, a3, &v19, v11, a3, WitnessTable, a4, a5);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 8))(a1, AssociatedTypeWitness);
}

{
  uint64_t v5;
  uint64_t v6;
  uint64_t AssociatedTypeWitness;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t WitnessTable;
  uint64_t v19;
  uint64_t v20;
  unsigned char v21[16];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  uint64_t v6 = v5;
  uint64_t v20 = a1;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v12 = swift_getAssociatedTypeWitness();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v19 - v14;
  uint64_t v22 = a3;
  uint64_t v23 = a4;
  uint64_t v24 = a5;
  uint64_t v25 = a1;
  type metadata accessor for Dependencies();
  sub_25EA18B60(v6, (uint64_t)v15);
  uint64_t v26 = *(void *)(v6 + 8);
  uint64_t v16 = type metadata accessor for StaticTruth();
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_25EA22F0C((uint64_t)sub_25EA1AA30, (uint64_t)v21, a3, (uint64_t)v15, &v26, v16, a3, WitnessTable, a4, a5);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 8))(v20, AssociatedTypeWitness);
}

uint64_t sub_25EA1A264@<X0>(uint64_t a1@<X8>)
{
  return sub_25EA1918C(*(void *)(v1 + 40), a1);
}

void (*Dependencies.subscript.modify(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t **a1, char a2)
{
  uint64_t v10 = malloc(0x40uLL);
  *a1 = v10;
  void v10[2] = a5;
  void v10[3] = v5;
  *uint64_t v10 = a3;
  v10[1] = a4;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v10[4] = AssociatedTypeWitness;
  uint64_t v12 = *(void *)(AssociatedTypeWitness - 8);
  v10[5] = v12;
  size_t v13 = *(void *)(v12 + 64);
  v10[6] = malloc(v13);
  uint64_t v14 = malloc(v13);
  v10[7] = v14;
  uint64_t v15 = v5 + *(int *)(type metadata accessor for Dependencies() + 24);
  uint64_t v17 = *(void *)(v5 + 8);
  sub_25EA234B4(v15, &v17, a3, a4, (uint64_t)v14);
  return sub_25EA1A3E0;
}

{
  uint64_t v5;
  uint64_t v6;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  size_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  size_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(void *, uint64_t);
  uint64_t AssociatedTypeWitness;
  uint64_t v25;

  uint64_t v6 = v5;
  uint64_t v11 = malloc(0x70uLL);
  *a1 = v11;
  void v11[2] = a5;
  v11[3] = v6;
  *uint64_t v11 = a3;
  v11[1] = a4;
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v11[4] = AssociatedTypeWitness;
  uint64_t v12 = *(void *)(AssociatedTypeWitness - 8);
  size_t v13 = v12;
  v11[5] = v12;
  uint64_t v14 = *(void *)(v12 + 64);
  v11[6] = malloc(v14);
  uint64_t v15 = malloc(v14);
  v11[7] = v15;
  uint64_t v16 = swift_checkMetadataState();
  v11[8] = v16;
  uint64_t v17 = *(void *)(v16 - 8);
  v11[9] = v17;
  uint64_t v18 = *(void *)(v17 + 64);
  v11[10] = malloc(v18);
  uint64_t v19 = malloc(v18);
  v11[11] = v19;
  uint64_t v20 = type metadata accessor for Dependencies();
  *((_DWORD *)v11 + 26) = *(_DWORD *)(v20 + 28);
  sub_25EA18B60(v6, (uint64_t)v15);
  uint64_t v21 = v6 + *(int *)(v20 + 24);
  uint64_t v25 = *(void *)(v6 + 8);
  sub_25EA237B8((uint64_t)v15, v21, &v25, a3, a4, (uint64_t)v19);
  uint64_t v22 = *(void (**)(void *, uint64_t))(v13 + 8);
  v22(v15, AssociatedTypeWitness);
  v11[12] = v22;
  return sub_25EA1ACCC;
}

void sub_25EA1A3E0(uint64_t **a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v4 = (void *)(*a1)[6];
  uint64_t v3 = (void *)(*a1)[7];
  uint64_t v5 = (*a1)[4];
  uint64_t v6 = (*a1)[5];
  uint64_t v7 = (*a1)[2];
  uint64_t v8 = (uint64_t *)(*a1)[3];
  uint64_t v10 = **a1;
  uint64_t v9 = (*a1)[1];
  if (a2)
  {
    uint64_t v11 = (*(uint64_t (**)(uint64_t, void *, uint64_t))(v6 + 16))((*a1)[6], v3, v5);
    uint64_t v24 = &v22;
    uint64_t v23 = *v8;
    MEMORY[0x270FA5388](v11);
    uint64_t v18 = v10;
    uint64_t v19 = v9;
    uint64_t v20 = v7;
    uint64_t v21 = v4;
    uint64_t v25 = v8[1];
    uint64_t v12 = type metadata accessor for StaticTruth();
    uint64_t WitnessTable = swift_getWitnessTable();
    sub_25EA22CBC((uint64_t)sub_25EA1BDEC, (uint64_t)v17, v10, &v25, v12, v10, WitnessTable, v9, v7);
    uint64_t v14 = *(void (**)(void *, uint64_t))(v6 + 8);
    v14(v4, v5);
    v14(v3, v5);
  }
  else
  {
    uint64_t v24 = &v22;
    uint64_t v23 = *v8;
    MEMORY[0x270FA5388](a1);
    uint64_t v18 = v10;
    uint64_t v19 = v9;
    uint64_t v20 = v7;
    uint64_t v21 = v3;
    uint64_t v25 = v8[1];
    uint64_t v15 = type metadata accessor for StaticTruth();
    uint64_t v16 = swift_getWitnessTable();
    sub_25EA22CBC((uint64_t)sub_25EA1BDEC, (uint64_t)v17, v10, &v25, v15, v10, v16, v9, v7);
    (*(void (**)(void *, uint64_t))(v6 + 8))(v3, v5);
  }
  free(v3);
  free(v4);
  free(v2);
}

uint64_t Dependencies.subscript.getter@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  v14[0] = a4;
  v14[1] = a3;
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v10 = (char *)v14 - v9;
  uint64_t v11 = type metadata accessor for Dependencies();
  sub_25EA18B60(v4, (uint64_t)v10);
  uint64_t v12 = v4 + *(int *)(v11 + 24);
  uint64_t v15 = *(void *)(v4 + 8);
  sub_25EA237B8((uint64_t)v10, v12, &v15, a1, a2, v14[0]);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, AssociatedTypeWitness);
}

uint64_t sub_25EA1AA30@<X0>(uint64_t a1@<X8>)
{
  return sub_25EA19A0C(*(void *)(v1 + 40), a1);
}

void sub_25EA1ACCC(uint64_t **a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void (*)(void *, uint64_t))(*a1)[12];
  uint64_t v5 = (void *)(*a1)[10];
  uint64_t v4 = (void *)(*a1)[11];
  uint64_t v34 = v5;
  uint64_t v35 = v4;
  uint64_t v7 = v2[8];
  uint64_t v6 = v2[9];
  uint64_t v9 = (void *)v2[6];
  uint64_t v8 = (void *)v2[7];
  uint64_t v32 = v3;
  uint64_t v33 = v8;
  uint64_t v11 = (uint64_t *)v2[3];
  uint64_t v10 = v2[4];
  uint64_t v30 = v2[5];
  uint64_t v31 = v10;
  uint64_t v13 = v2[1];
  uint64_t v12 = v2[2];
  uint64_t v14 = *v2;
  if (a2)
  {
    uint64_t v15 = (*(uint64_t (**)(void *, void *, uint64_t))(v6 + 16))(v5, v35, v7);
    uint64_t v29 = &v27;
    uint64_t v28 = *v11;
    MEMORY[0x270FA5388](v15);
    uint64_t v23 = v14;
    uint64_t v24 = v13;
    uint64_t v25 = v12;
    uint64_t v26 = v34;
    sub_25EA18B60((uint64_t)v11, (uint64_t)v9);
    uint64_t v36 = v11[1];
    uint64_t v16 = type metadata accessor for StaticTruth();
    uint64_t WitnessTable = swift_getWitnessTable();
    uint64_t v18 = v34;
    sub_25EA22F0C((uint64_t)sub_25EA1BDF0, (uint64_t)v22, v14, (uint64_t)v9, &v36, v16, v14, WitnessTable, v13, v12);
    v32(v9, v31);
    uint64_t v19 = *(void (**)(void *, uint64_t))(v6 + 8);
    v19(v18, v7);
    v19(v35, v7);
  }
  else
  {
    uint64_t v29 = &v27;
    uint64_t v28 = *v11;
    MEMORY[0x270FA5388](a1);
    uint64_t v23 = v14;
    uint64_t v24 = v13;
    uint64_t v25 = v12;
    uint64_t v26 = v35;
    sub_25EA18B60((uint64_t)v11, (uint64_t)v9);
    uint64_t v36 = v11[1];
    uint64_t v20 = type metadata accessor for StaticTruth();
    uint64_t v21 = swift_getWitnessTable();
    uint64_t v18 = v34;
    sub_25EA22F0C((uint64_t)sub_25EA1BDF0, (uint64_t)v22, v14, (uint64_t)v9, &v36, v20, v14, v21, v13, v12);
    v32(v9, v31);
    (*(void (**)(void *, uint64_t))(v6 + 8))(v35, v7);
  }
  free(v35);
  free(v18);
  free(v33);
  free(v9);
  free(v2);
}

uint64_t *initializeBufferWithCopyOfBuffer for Dependencies(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
  }
  else
  {
    uint64_t v7 = a1;
    a1[1] = a2[1];
    uint64_t v8 = *(int *)(a3 + 24);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for ScopeGraphElement.ID(0);
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_retain();
    if (v13(v10, 1, v11))
    {
      sub_25EA1BC40(0, &qword_26A7276A8, (void (*)(uint64_t))type metadata accessor for ScopeGraphElement.ID);
      memcpy(v9, v10, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      uint64_t v15 = sub_25EA35ED0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v9, v10, v15);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    *(uint64_t *)((char *)v7 + *(int *)(a3 + 28)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 28));
  }
  swift_retain();
  return v7;
}

uint64_t destroy for Dependencies(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = type metadata accessor for ScopeGraphElement.ID(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v4, 1, v5))
  {
    uint64_t v6 = sub_25EA35ED0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v4, v6);
  }
  return swift_release();
}

void *initializeWithCopy for Dependencies(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for ScopeGraphElement.ID(0);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  swift_retain();
  if (v12(v9, 1, v10))
  {
    sub_25EA1BC40(0, &qword_26A7276A8, (void (*)(uint64_t))type metadata accessor for ScopeGraphElement.ID);
    memcpy(v8, v9, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    uint64_t v14 = sub_25EA35ED0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v8, v9, v14);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  *(void *)((char *)a1 + *(int *)(a3 + 28)) = *(void *)((char *)a2 + *(int *)(a3 + 28));
  swift_retain();
  return a1;
}

void *assignWithCopy for Dependencies(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for ScopeGraphElement.ID(0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      uint64_t v17 = sub_25EA35ED0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 24))(v7, v8, v17);
      goto LABEL_7;
    }
    sub_25E9EFC74((uint64_t)v7);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    sub_25EA1BC40(0, &qword_26A7276A8, (void (*)(uint64_t))type metadata accessor for ScopeGraphElement.ID);
    memcpy(v7, v8, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  uint64_t v14 = sub_25EA35ED0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v7, v8, v14);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  *(void *)((char *)a1 + *(int *)(a3 + 28)) = *(void *)((char *)a2 + *(int *)(a3 + 28));
  swift_retain();
  swift_release();
  return a1;
}

void *initializeWithTake for Dependencies(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for ScopeGraphElement.ID(0);
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    sub_25EA1BC40(0, &qword_26A7276A8, (void (*)(uint64_t))type metadata accessor for ScopeGraphElement.ID);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    uint64_t v13 = sub_25EA35ED0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v8, v9, v13);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  *(void *)((char *)a1 + *(int *)(a3 + 28)) = *(void *)((char *)a2 + *(int *)(a3 + 28));
  return a1;
}

void *assignWithTake for Dependencies(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for ScopeGraphElement.ID(0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      uint64_t v17 = sub_25EA35ED0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 40))(v7, v8, v17);
      goto LABEL_7;
    }
    sub_25E9EFC74((uint64_t)v7);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    sub_25EA1BC40(0, &qword_26A7276A8, (void (*)(uint64_t))type metadata accessor for ScopeGraphElement.ID);
    memcpy(v7, v8, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  uint64_t v14 = sub_25EA35ED0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v7, v8, v14);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  *(void *)((char *)a1 + *(int *)(a3 + 28)) = *(void *)((char *)a2 + *(int *)(a3 + 28));
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for Dependencies(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25EA1B934);
}

uint64_t sub_25EA1B934(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    sub_25EA1BC40(0, &qword_26A7276A8, (void (*)(uint64_t))type metadata accessor for ScopeGraphElement.ID);
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for Dependencies(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25EA1BA14);
}

void *sub_25EA1BA14(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    sub_25EA1BC40(0, &qword_26A7276A8, (void (*)(uint64_t))type metadata accessor for ScopeGraphElement.ID);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 24);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_25EA1BAD8()
{
  sub_25EA1BC40(319, &qword_26A7276A8, (void (*)(uint64_t))type metadata accessor for ScopeGraphElement.ID);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t type metadata accessor for Dependencies.AmbiguousResolutionContext()
{
  return self;
}

uint64_t sub_25EA1BBC0(uint64_t a1, uint64_t a2)
{
  sub_25EA1BC40(0, &qword_26A7283F0, (void (*)(uint64_t))sub_25EA1BC94);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_25EA1BC40(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_25EA362E0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

unint64_t sub_25EA1BC94()
{
  unint64_t result = qword_26A7283F8[0];
  if (!qword_26A7283F8[0])
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, qword_26A7283F8);
  }
  return result;
}

uint64_t sub_25EA1BCEC(uint64_t a1)
{
  sub_25EA1BC40(0, &qword_26A7283F0, (void (*)(uint64_t))sub_25EA1BC94);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25EA1BD64(uint64_t a1, uint64_t a2)
{
  sub_25EA1BC40(0, &qword_26A7283F0, (void (*)(uint64_t))sub_25EA1BC94);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25EA1BDF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)swift_allocObject();
  uint64_t v8[2] = a3;
  v8[3] = a4;
  v8[4] = a1;
  uint64_t v8[5] = a2;
  swift_retain();
  sub_25EA36230();
  swift_getFunctionTypeMetadataGlobalActor();
  return sub_25EA36130();
}

uint64_t sub_25EA1BEA8(uint64_t a1)
{
  return sub_25EA1BDF4(*v1, v1[1], *(void *)(a1 + 16), *(void *)(a1 + 24));
}

uint64_t sub_25EA1BEB8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t type metadata accessor for NonmutatingFunction()
{
  return sub_25E9ED2B4();
}

uint64_t sub_25EA1BF08@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t *a3@<X8>)
{
  return static AmbiguousDependencyKey.source(in:disambiguation:)(a1, a2, a3);
}

uint64_t static AmbiguousDependencyKey.source(in:disambiguation:)@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t *a3@<X8>)
{
  uint64_t v5 = *(void *)(a2 + 8);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v8 = (char *)&v11 - v7;
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a1, v5);
  a3[3] = type metadata accessor for StaticTruth();
  a3[4] = swift_getWitnessTable();
  uint64_t v9 = sub_25E9F9FE8(a3);
  return StaticTruth.init(state:)((uint64_t)v8, AssociatedTypeWitness, (uint64_t)v9);
}

uint64_t dispatch thunk of static AmbiguousDependencyKey.source(in:disambiguation:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t View.definesScope<A>(of:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t KeyPath = swift_getKeyPath();
  v9[0] = a1;
  v9[1] = KeyPath;
  long long v10 = 0u;
  long long v11 = 0u;
  char v12 = 0;
  uint64_t v7 = type metadata accessor for ScopedTruthViewModifier();
  swift_retain();
  MEMORY[0x2611E6FC0](v9, a2, v7, a3);
  swift_release();
  return sub_25E9EC670(KeyPath, 0, 0, 0, 0, 0);
}

uint64_t type metadata accessor for ScopedTruthViewModifier()
{
  return sub_25E9ED2B4();
}

uint64_t View.tagScope(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v10 = KeyPath;
  long long v11 = 0u;
  long long v12 = 0u;
  char v13 = 0;
  uint64_t v14 = a1;
  uint64_t v15 = a2;
  swift_bridgeObjectRetain();
  MEMORY[0x2611E6FC0](&v10, a3, &type metadata for TaggedScopeViewModifier, a4);
  sub_25E9EC670(KeyPath, 0, 0, 0, 0, 0);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25EA1C210()
{
  return swift_getWitnessTable();
}

uint64_t sub_25EA1C2A4()
{
  return swift_getWitnessTable();
}

unint64_t sub_25EA1C308()
{
  unint64_t result = qword_26A728480[0];
  if (!qword_26A728480[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A728480);
  }
  return result;
}

uint64_t destroy for TaggedScopeViewModifier(uint64_t a1)
{
  sub_25E9EC670(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for TaggedScopeViewModifier(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  uint64_t v8 = *(void *)(a2 + 32);
  char v9 = *(unsigned char *)(a2 + 40);
  sub_25E9EC854(*(void *)a2, v5, v6, v7, v8, v9);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = v8;
  *(unsigned char *)(a1 + 40) = v9;
  uint64_t v10 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v10;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TaggedScopeViewModifier(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  uint64_t v8 = *(void *)(a2 + 32);
  char v9 = *(unsigned char *)(a2 + 40);
  sub_25E9EC854(*(void *)a2, v5, v6, v7, v8, v9);
  uint64_t v10 = *(void *)a1;
  uint64_t v11 = *(void *)(a1 + 8);
  uint64_t v12 = *(void *)(a1 + 16);
  uint64_t v13 = *(void *)(a1 + 24);
  uint64_t v14 = *(void *)(a1 + 32);
  char v15 = *(unsigned char *)(a1 + 40);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = v8;
  *(unsigned char *)(a1 + 40) = v9;
  sub_25E9EC670(v10, v11, v12, v13, v14, v15);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for TaggedScopeViewModifier(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for TaggedScopeViewModifier(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  char v5 = *(unsigned char *)(a2 + 40);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v8 = *(void *)(a1 + 16);
  uint64_t v9 = *(void *)(a1 + 24);
  uint64_t v10 = *(void *)(a1 + 32);
  char v11 = *(unsigned char *)(a1 + 40);
  long long v12 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v12;
  *(void *)(a1 + 32) = v4;
  *(unsigned char *)(a1 + 40) = v5;
  sub_25E9EC670(v6, v7, v8, v9, v10, v11);
  uint64_t v13 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v13;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TaggedScopeViewModifier(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 56);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TaggedScopeViewModifier(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
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
      *(void *)(result + 56) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TaggedScopeViewModifier()
{
  return &type metadata for TaggedScopeViewModifier;
}

uint64_t sub_25EA1C5FC(uint64_t a1)
{
  swift_release();
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  char v7 = *(unsigned char *)(a1 + 48);
  return sub_25E9EC670(v2, v3, v4, v5, v6, v7);
}

uint64_t sub_25EA1C644(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 24);
  uint64_t v6 = *(void *)(a2 + 32);
  uint64_t v7 = *(void *)(a2 + 40);
  char v8 = *(unsigned char *)(a2 + 48);
  swift_retain();
  sub_25E9EC854(v3, v4, v5, v6, v7, v8);
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v6;
  *(void *)(a1 + 40) = v7;
  *(unsigned char *)(a1 + 48) = v8;
  return a1;
}

uint64_t sub_25EA1C6C4(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  *(void *)a1 = *a2;
  swift_retain();
  swift_release();
  uint64_t v4 = v2[1];
  uint64_t v5 = v2[2];
  uint64_t v6 = v2[3];
  uint64_t v7 = v2[4];
  uint64_t v8 = v2[5];
  LOBYTE(v2) = *((unsigned char *)v2 + 48);
  sub_25E9EC854(v4, v5, v6, v7, v8, (char)v2);
  uint64_t v9 = *(void *)(a1 + 8);
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = *(void *)(a1 + 24);
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 40);
  char v14 = *(unsigned char *)(a1 + 48);
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(unsigned char *)(a1 + 48) = (_BYTE)v2;
  sub_25E9EC670(v9, v10, v11, v12, v13, v14);
  return a1;
}

__n128 sub_25EA1C76C(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_25EA1C788(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  uint64_t v4 = *(void *)(a2 + 40);
  char v5 = *(unsigned char *)(a2 + 48);
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v7 = *(void *)(a1 + 16);
  uint64_t v8 = *(void *)(a1 + 24);
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  char v11 = *(unsigned char *)(a1 + 48);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = v4;
  *(unsigned char *)(a1 + 48) = v5;
  sub_25E9EC670(v6, v7, v8, v9, v10, v11);
  return a1;
}

uint64_t sub_25EA1C7F4(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 49)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_25EA1C83C(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 48) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 49) = 1;
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
    *(unsigned char *)(result + 49) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_25EA1C88C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25EA1C8A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v17 = a1;
  uint64_t v18 = a2;
  swift_getWitnessTable();
  sub_25EA36000();
  sub_25E9ECF4C();
  uint64_t v3 = sub_25EA35FB0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v16 - v8;
  long long v10 = *(_OWORD *)(v2 + 16);
  v27[0] = *(_OWORD *)v2;
  v27[1] = v10;
  v27[2] = *(_OWORD *)(v2 + 32);
  char v28 = *(unsigned char *)(v2 + 48);
  swift_getKeyPath();
  sub_25EA1CB34((uint64_t)v27, (uint64_t)v25);
  uint64_t v21 = v25[0];
  uint64_t v22 = v25[1];
  uint64_t v23 = v25[2];
  long long v16 = v26;
  long long v24 = v26;
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_25EA36030();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v12 = sub_25EA1D14C((unint64_t *)&qword_26A7275A8, (void (*)(uint64_t))sub_25E9ECF4C);
  uint64_t v19 = WitnessTable;
  uint64_t v20 = v12;
  uint64_t v13 = swift_getWitnessTable();
  sub_25E9EC324(v7, v3, v13);
  char v14 = *(void (**)(char *, uint64_t))(v4 + 8);
  v14(v7, v3);
  sub_25E9EC324(v9, v3, v13);
  return ((uint64_t (*)(char *, uint64_t))v14)(v9, v3);
}

uint64_t sub_25EA1CB34@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  long long v4 = *(_OWORD *)(a1 + 24);
  long long v17 = *(_OWORD *)(a1 + 8);
  v18[0] = v4;
  *(_OWORD *)((char *)v18 + 9) = *(_OWORD *)(a1 + 33);
  sub_25E9ECFA4((uint64_t)&v17, (void (*)(void, void, void, void, void, void))sub_25E9EC854);
  sub_25E9ECC1C((uint64_t)v11);
  sub_25E9ECFA4((uint64_t)&v17, (void (*)(void, void, void, void, void, void))sub_25E9EC670);
  uint64_t v13 = 0;
  uint64_t v14 = 0xE000000000000000;
  type metadata accessor for ScopedTruthViewModifier();
  sub_25EA365C0();
  sub_25EA36150();
  swift_bridgeObjectRelease();
  sub_25EA36150();
  long long v10 = *(void **)a1;
  type metadata accessor for Dependencies();
  sub_25EA365B0();
  sub_25EA364A0();
  Scope.subscope(tag:)(v13, v14, &v13);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = v13;
  uint64_t v6 = v14;
  uint64_t v7 = v15;
  long long v8 = v16;
  v11[0] = v13;
  v11[1] = v14;
  void v11[2] = v15;
  long long v12 = v16;
  Scope.definesScope<A>(of:)(v10, &v13);
  swift_release();
  swift_release();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a2 = v5;
  *(void *)(a2 + 8) = v6;
  *(void *)(a2 + 16) = v7;
  *(_OWORD *)(a2 + 24) = v8;
  return result;
}

__n128 sub_25EA1CCF4@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  long long v5 = v2[1];
  long long v19 = *v2;
  v20[0] = v5;
  *(_OWORD *)((char *)v20 + 9) = *(long long *)((char *)v2 + 25);
  uint64_t v6 = *((void *)v2 + 6);
  uint64_t v7 = *((void *)v2 + 7);
  uint64_t KeyPath = swift_getKeyPath();
  sub_25E9ECFA4((uint64_t)&v19, (void (*)(void, void, void, void, void, void))sub_25E9EC854);
  sub_25E9ECC1C((uint64_t)&v16);
  sub_25E9ECFA4((uint64_t)&v19, (void (*)(void, void, void, void, void, void))sub_25E9EC670);
  Scope.subscope(tag:)(v6, v7, v17);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  __n128 v15 = (__n128)v17[1];
  uint64_t v9 = v18;
  sub_25EA1CEB4();
  long long v14 = v17[0];
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(a2, a1, v10);
  sub_25EA1CF10();
  uint64_t v12 = a2 + *(int *)(v11 + 36);
  *(void *)uint64_t v12 = KeyPath;
  *(_OWORD *)(v12 + 8) = v14;
  __n128 result = v15;
  *(__n128 *)(v12 + 24) = v15;
  *(void *)(v12 + 40) = v9;
  return result;
}

uint64_t sub_25EA1CE70()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_25EA1CEB4()
{
  if (!qword_26A728508)
  {
    sub_25EA1C308();
    unint64_t v0 = sub_25EA36000();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A728508);
    }
  }
}

void sub_25EA1CF10()
{
  if (!qword_26A728510)
  {
    sub_25EA1CEB4();
    sub_25E9ECF4C();
    unint64_t v0 = sub_25EA35FB0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A728510);
    }
  }
}

uint64_t sub_25EA1CF78()
{
  return swift_getWitnessTable();
}

unint64_t sub_25EA1D074()
{
  unint64_t result = qword_26A728518;
  if (!qword_26A728518)
  {
    sub_25EA1CF10();
    sub_25EA1D14C(qword_26A728520, (void (*)(uint64_t))sub_25EA1CEB4);
    sub_25EA1D14C((unint64_t *)&qword_26A7275A8, (void (*)(uint64_t))sub_25E9ECF4C);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A728518);
  }
  return result;
}

uint64_t sub_25EA1D14C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t type metadata accessor for ExplicitCommandHandlerUpdate()
{
  return sub_25E9ED2B4();
}

uint64_t sub_25EA1D1B0()
{
  return sub_25EA1D2A4();
}

uint64_t sub_25EA1D1BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *v2;
  swift_beginAccess();
  (*(void (**)(uint64_t, void))(*(void *)(v4 + 88) + 24))(a2, *(void *)(v4 + 80));
  return swift_endAccess();
}

uint64_t sub_25EA1D280(uint64_t a1, uint64_t a2)
{
  return sub_25EA1D1BC(a1, a2);
}

uint64_t sub_25EA1D2A4()
{
  return 0x3D646E616D6D6F43;
}

uint64_t _s9TeaBreeze11ScopeReaderV7currentACyFZ_0@<X0>(uint64_t a1@<X8>)
{
  sub_25EA20314(0, &qword_26A7276A8, (void (*)(uint64_t))type metadata accessor for ScopeGraphElement.ID);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v26 - v3;
  uint64_t v5 = type metadata accessor for Dependencies();
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (void *)((char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_25EA20314(0, qword_26A7285E0, (void (*)(uint64_t))type metadata accessor for ScopeReader.CurrentScope);
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v26 - v10;
  uint64_t v12 = type metadata accessor for ScopeReader.CurrentScope(0);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (void *)((char *)v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)v26 - v17;
  if (qword_26A7274E0 != -1) {
    swift_once();
  }
  uint64_t v19 = sub_25E9EBF30(v9, (uint64_t)qword_26A7285A8);
  swift_beginAccess();
  sub_25EA20368(v19, (uint64_t)v11, qword_26A7285E0, (void (*)(uint64_t))type metadata accessor for ScopeReader.CurrentScope);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    sub_25EA203D4((uint64_t)v11, qword_26A7285E0, (void (*)(uint64_t))type metadata accessor for ScopeReader.CurrentScope);
    v26[1] = 0;
    v26[2] = 0xE000000000000000;
    sub_25EA36370();
    swift_bridgeObjectRelease();
    uint64_t result = sub_25EA36420();
    __break(1u);
  }
  else
  {
    sub_25EA20574((uint64_t)v11, (uint64_t)v18, type metadata accessor for ScopeReader.CurrentScope);
    sub_25EA20430((uint64_t)v18, a1);
    sub_25EA20430((uint64_t)v18, (uint64_t)v16);
    uint64_t v20 = *v16;
    uint64_t v21 = v16[1];
    sub_25EA20368((uint64_t)v16 + *(int *)(v12 + 24), (uint64_t)v4, &qword_26A7276A8, (void (*)(uint64_t))type metadata accessor for ScopeGraphElement.ID);
    swift_retain();
    sub_25EA20494((uint64_t)v16, type metadata accessor for ScopeReader.CurrentScope);
    uint64_t v22 = *(int *)(v5 + 28);
    type metadata accessor for Dependencies.AmbiguousResolutionContext();
    uint64_t v23 = swift_allocObject();
    *(_OWORD *)(v23 + 16) = 0u;
    *(_OWORD *)(v23 + 32) = 0u;
    *(void *)(v23 + 48) = 0;
    *(void *)((char *)v7 + v22) = v23;
    *uint64_t v7 = v20;
    v7[1] = v21;
    sub_25EA204F4((uint64_t)v4, (uint64_t)v7 + *(int *)(v5 + 24));
    sub_25EA20494((uint64_t)v18, type metadata accessor for ScopeReader.CurrentScope);
    uint64_t v24 = type metadata accessor for ScopeReader(0);
    return sub_25EA20574((uint64_t)v7, a1 + *(int *)(v24 + 20), (uint64_t (*)(void))type metadata accessor for Dependencies);
  }
  return result;
}

uint64_t sub_25EA1D7B0()
{
  sub_25EA20314(0, qword_26A7285E0, (void (*)(uint64_t))type metadata accessor for ScopeReader.CurrentScope);
  uint64_t v1 = v0;
  sub_25E9EBECC(v0, qword_26A7285A8);
  uint64_t v2 = sub_25E9EBF30(v1, (uint64_t)qword_26A7285A8);
  uint64_t v3 = type metadata accessor for ScopeReader.CurrentScope(0);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56);
  return v4(v2, 1, 1, v3);
}

uint64_t sub_25EA1D860@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, void (*a4)(void *)@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  v23[2] = a5;
  uint64_t v24 = a4;
  v23[1] = a6;
  uint64_t v9 = type metadata accessor for ScopeReader.CurrentScope(0);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (void *)((char *)v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_25EA20314(0, qword_26A7285E0, (void (*)(uint64_t))type metadata accessor for ScopeReader.CurrentScope);
  uint64_t v14 = v13;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)v23 - v18;
  uint64_t v20 = *a2;
  if (qword_26A7274E0 != -1) {
    swift_once();
  }
  uint64_t v21 = sub_25E9EBF30(v14, (uint64_t)qword_26A7285A8);
  swift_beginAccess();
  sub_25EA20368(v21, (uint64_t)v19, qword_26A7285E0, (void (*)(uint64_t))type metadata accessor for ScopeReader.CurrentScope);
  sub_25EA20368(a3, (uint64_t)v12 + *(int *)(v9 + 24), &qword_26A7276A8, (void (*)(uint64_t))type metadata accessor for ScopeGraphElement.ID);
  *uint64_t v12 = a1;
  v12[1] = v20;
  sub_25EA20430((uint64_t)v12, (uint64_t)v17);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v17, 0, 1, v9);
  swift_beginAccess();
  swift_retain();
  sub_25EA205DC((uint64_t)v17, v21);
  swift_endAccess();
  v24(v12);
  swift_beginAccess();
  sub_25EA2065C((uint64_t)v19, v21);
  swift_endAccess();
  sub_25EA20494((uint64_t)v12, type metadata accessor for ScopeReader.CurrentScope);
  return sub_25EA203D4((uint64_t)v19, qword_26A7285E0, (void (*)(uint64_t))type metadata accessor for ScopeReader.CurrentScope);
}

uint64_t ScopeReader.ruleIdentifier.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for ScopeReader.CurrentScope(0);
  return sub_25EA20368(v1 + *(int *)(v3 + 24), a1, &qword_26A7276A8, (void (*)(uint64_t))type metadata accessor for ScopeGraphElement.ID);
}

uint64_t type metadata accessor for ScopeReader.CurrentScope(uint64_t a1)
{
  return sub_25E9EE28C(a1, (uint64_t *)&unk_26A7285D0);
}

uint64_t ScopeReader.value<A>(for:)()
{
  type metadata accessor for ScopeReader(0);
  return swift_getAtKeyPath();
}

uint64_t type metadata accessor for ScopeReader(uint64_t a1)
{
  return sub_25E9EE28C(a1, (uint64_t *)&unk_26A7285C0);
}

uint64_t ScopeReader.recordAccess<A>(to:)(void *a1)
{
  uint64_t v1 = *(void *)(*MEMORY[0x263F8EA20] + *a1 + 8);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v4 = (char *)&v6 - v3;
  type metadata accessor for ScopeReader(0);
  sub_25EA18B54();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t ScopeReader.value<A>(for:disambiguation:)(void *a1, uint64_t a2)
{
  return sub_25EA18E1C(a1, a2);
}

uint64_t ScopeReader.signalChanged<A>(_:)()
{
  uint64_t v1 = v0;
  sub_25EA20314(0, &qword_26A7276A8, (void (*)(uint64_t))type metadata accessor for ScopeGraphElement.ID);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v23 - v3;
  uint64_t v5 = type metadata accessor for ScopeGraphElement.ID(0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A7274C0 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_25EA35F00();
  sub_25E9EBF30(v9, (uint64_t)qword_26A728BC0);
  uint64_t v10 = sub_25EA35EE0();
  os_log_type_t v11 = sub_25EA362B0();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v25 = v5;
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    uint64_t v26 = v13;
    *(_DWORD *)uint64_t v12 = 136315138;
    uint64_t v24 = v6;
    uint64_t v14 = sub_25EA365C0();
    uint64_t v32 = sub_25EA01DA0(v14, v15, &v26);
    uint64_t v6 = v24;
    sub_25EA362F0();
    uint64_t v5 = v25;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25E9E9000, v10, v11, "Notified of change from rule, requesting update of dependants. Rule=%s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611E7A60](v13, -1, -1);
    MEMORY[0x2611E7A60](v12, -1, -1);
  }

  uint64_t v16 = type metadata accessor for ScopeReader.CurrentScope(0);
  sub_25EA20368((uint64_t)v1 + *(int *)(v16 + 24), (uint64_t)v4, &qword_26A7276A8, (void (*)(uint64_t))type metadata accessor for ScopeGraphElement.ID);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1) {
    return sub_25EA203D4((uint64_t)v4, &qword_26A7276A8, (void (*)(uint64_t))type metadata accessor for ScopeGraphElement.ID);
  }
  sub_25EA20574((uint64_t)v4, (uint64_t)v8, type metadata accessor for ScopeGraphElement.ID);
  uint64_t v18 = *v1;
  uint64_t v19 = v1[1];
  swift_beginAccess();
  uint64_t v20 = *(void *)(v18 + 128);
  uint64_t v26 = *(void *)(v18 + 56);
  long long v21 = *(_OWORD *)(v18 + 80);
  long long v27 = *(_OWORD *)(v18 + 64);
  long long v28 = v21;
  long long v22 = *(_OWORD *)(v18 + 112);
  long long v29 = *(_OWORD *)(v18 + 96);
  long long v30 = v22;
  uint64_t v31 = v20;
  sub_25E9F04EC((uint64_t)v8);
  uint64_t v26 = v19;
  sub_25EA25758((uint64_t)v8, &v26, 4);
  return sub_25EA20494((uint64_t)v8, type metadata accessor for ScopeGraphElement.ID);
}

uint64_t ScopeReader.invoke<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  os_log_t v5 = *(os_log_t *)(v3 + 8);
  return sub_25EA21CCC(a1, &v5, a2, a3);
}

uint64_t ScopeReader.raise<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  os_log_t v5 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 8);
  return sub_25EA22500(a1, &v5, a2, a3);
}

uint64_t ScopeReader.registerCommandHandler<A, B>(handlerType:applier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_25EA1E1BC(a1, a2, a3, a4, a5, a6, a7, (void (*)(uint64_t, uint64_t, char *, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t))sub_25EA24244);
}

uint64_t ScopeReader.registerEventHandler<A, B>(handlerType:applier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_25EA1E1BC(a1, a2, a3, a4, a5, a6, a7, (void (*)(uint64_t, uint64_t, char *, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t))sub_25EA24278);
}

uint64_t sub_25EA1E1BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void (*a8)(uint64_t, uint64_t, char *, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v24 = a7;
  uint64_t v25 = a8;
  uint64_t v22 = a5;
  uint64_t v23 = a6;
  sub_25EA20314(0, &qword_26A7276A8, (void (*)(uint64_t))type metadata accessor for ScopeGraphElement.ID);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v21 - v13;
  uint64_t v15 = type metadata accessor for ScopeGraphElement.ID(0);
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v21 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = type metadata accessor for ScopeReader.CurrentScope(0);
  sub_25EA20368(v8 + *(int *)(v19 + 24), (uint64_t)v14, &qword_26A7276A8, (void (*)(uint64_t))type metadata accessor for ScopeGraphElement.ID);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1) {
    return sub_25EA203D4((uint64_t)v14, &qword_26A7276A8, (void (*)(uint64_t))type metadata accessor for ScopeGraphElement.ID);
  }
  sub_25EA20574((uint64_t)v14, (uint64_t)v18, type metadata accessor for ScopeGraphElement.ID);
  uint64_t v26 = *(void *)(v8 + 8);
  v25(a2, a3, v18, &v26, a4, v22, v23, v24);
  return sub_25EA20494((uint64_t)v18, type metadata accessor for ScopeGraphElement.ID);
}

uint64_t *initializeBufferWithCopyOfBuffer for ScopeReader(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
  }
  else
  {
    uint64_t v7 = a1;
    a1[1] = a2[1];
    uint64_t v8 = *(int *)(type metadata accessor for ScopeReader.CurrentScope(0) + 24);
    uint64_t v9 = (char *)v7 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for ScopeGraphElement.ID(0);
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_retain();
    uint64_t v28 = v12;
    if (v13(v10, 1, v11))
    {
      sub_25EA20314(0, &qword_26A7276A8, (void (*)(uint64_t))type metadata accessor for ScopeGraphElement.ID);
      memcpy(v9, v10, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      uint64_t v15 = sub_25EA35ED0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v9, v10, v15);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    uint64_t v16 = *(int *)(a3 + 20);
    uint64_t v17 = (uint64_t *)((char *)v7 + v16);
    uint64_t v18 = (char *)a2 + v16;
    uint64_t v20 = *(uint64_t *)((char *)a2 + v16);
    uint64_t v19 = *(uint64_t *)((char *)a2 + v16 + 8);
    *uint64_t v17 = v20;
    v17[1] = v19;
    uint64_t v21 = type metadata accessor for Dependencies();
    uint64_t v22 = *(int *)(v21 + 24);
    uint64_t v23 = (char *)v17 + v22;
    uint64_t v24 = &v18[v22];
    swift_retain();
    if (v13(v24, 1, v11))
    {
      sub_25EA20314(0, &qword_26A7276A8, (void (*)(uint64_t))type metadata accessor for ScopeGraphElement.ID);
      memcpy(v23, v24, *(void *)(*(void *)(v25 - 8) + 64));
    }
    else
    {
      uint64_t v26 = sub_25EA35ED0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 16))(v23, v24, v26);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v28 + 56))(v23, 0, 1, v11);
    }
    *(void *)((char *)v17 + *(int *)(v21 + 28)) = *(void *)&v18[*(int *)(v21 + 28)];
  }
  swift_retain();
  return v7;
}

uint64_t destroy for ScopeReader(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = a1 + *(int *)(type metadata accessor for ScopeReader.CurrentScope(0) + 24);
  uint64_t v5 = type metadata accessor for ScopeGraphElement.ID(0);
  uint64_t v6 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48);
  if (!v6(v4, 1, v5))
  {
    uint64_t v7 = sub_25EA35ED0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v4, v7);
  }
  uint64_t v8 = a1 + *(int *)(a2 + 20);
  swift_release();
  uint64_t v9 = v8 + *(int *)(type metadata accessor for Dependencies() + 24);
  if (!v6(v9, 1, v5))
  {
    uint64_t v10 = sub_25EA35ED0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  }
  return swift_release();
}

void *initializeWithCopy for ScopeReader(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(type metadata accessor for ScopeReader.CurrentScope(0) + 24);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for ScopeGraphElement.ID(0);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  swift_retain();
  uint64_t v27 = v11;
  if (v12(v9, 1, v10))
  {
    sub_25EA20314(0, &qword_26A7276A8, (void (*)(uint64_t))type metadata accessor for ScopeGraphElement.ID);
    memcpy(v8, v9, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    uint64_t v14 = sub_25EA35ED0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v8, v9, v14);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v15 = *(int *)(a3 + 20);
  uint64_t v16 = (void *)((char *)a1 + v15);
  uint64_t v17 = (char *)a2 + v15;
  uint64_t v19 = *(void *)((char *)a2 + v15);
  uint64_t v18 = *(void *)((char *)a2 + v15 + 8);
  *uint64_t v16 = v19;
  v16[1] = v18;
  uint64_t v20 = type metadata accessor for Dependencies();
  uint64_t v21 = *(int *)(v20 + 24);
  uint64_t v22 = (char *)v16 + v21;
  uint64_t v23 = &v17[v21];
  swift_retain();
  if (v12(v23, 1, v10))
  {
    sub_25EA20314(0, &qword_26A7276A8, (void (*)(uint64_t))type metadata accessor for ScopeGraphElement.ID);
    memcpy(v22, v23, *(void *)(*(void *)(v24 - 8) + 64));
  }
  else
  {
    uint64_t v25 = sub_25EA35ED0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 16))(v22, v23, v25);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v27 + 56))(v22, 0, 1, v10);
  }
  *(void *)((char *)v16 + *(int *)(v20 + 28)) = *(void *)&v17[*(int *)(v20 + 28)];
  swift_retain();
  return a1;
}

void *assignWithCopy for ScopeReader(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  uint64_t v6 = *(int *)(type metadata accessor for ScopeReader.CurrentScope(0) + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for ScopeGraphElement.ID(0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  uint64_t v30 = v10;
  if (v12)
  {
    if (v13) {
      goto LABEL_6;
    }
    uint64_t v15 = sub_25EA35ED0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v7, v8, v15);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  else
  {
    if (v13)
    {
      sub_25EA20494((uint64_t)v7, type metadata accessor for ScopeGraphElement.ID);
LABEL_6:
      sub_25EA20314(0, &qword_26A7276A8, (void (*)(uint64_t))type metadata accessor for ScopeGraphElement.ID);
      memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
      goto LABEL_9;
    }
    uint64_t v16 = sub_25EA35ED0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 24))(v7, v8, v16);
  }
LABEL_9:
  uint64_t v17 = *(int *)(a3 + 20);
  uint64_t v18 = (char *)a1 + v17;
  uint64_t v19 = (char *)a2 + v17;
  *(void *)((char *)a1 + v17) = *(void *)((char *)a2 + v17);
  swift_retain();
  swift_release();
  *((void *)v18 + 1) = *((void *)v19 + 1);
  uint64_t v20 = type metadata accessor for Dependencies();
  uint64_t v21 = *(int *)(v20 + 24);
  uint64_t v22 = &v18[v21];
  uint64_t v23 = &v19[v21];
  int v24 = v11(&v18[v21], 1, v9);
  int v25 = v11(v23, 1, v9);
  if (v24)
  {
    if (!v25)
    {
      uint64_t v27 = sub_25EA35ED0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 16))(v22, v23, v27);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v30 + 56))(v22, 0, 1, v9);
      goto LABEL_17;
    }
  }
  else
  {
    if (!v25)
    {
      uint64_t v28 = sub_25EA35ED0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 24))(v22, v23, v28);
      goto LABEL_17;
    }
    sub_25EA20494((uint64_t)v22, type metadata accessor for ScopeGraphElement.ID);
  }
  sub_25EA20314(0, &qword_26A7276A8, (void (*)(uint64_t))type metadata accessor for ScopeGraphElement.ID);
  memcpy(v22, v23, *(void *)(*(void *)(v26 - 8) + 64));
LABEL_17:
  *(void *)&v18[*(int *)(v20 + 28)] = *(void *)&v19[*(int *)(v20 + 28)];
  swift_retain();
  swift_release();
  return a1;
}

void *initializeWithTake for ScopeReader(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(type metadata accessor for ScopeReader.CurrentScope(0) + 24);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for ScopeGraphElement.ID(0);
  uint64_t v11 = *(void *)(v10 - 8);
  int v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  if (v12(v9, 1, v10))
  {
    sub_25EA20314(0, &qword_26A7276A8, (void (*)(uint64_t))type metadata accessor for ScopeGraphElement.ID);
    memcpy(v8, v9, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    uint64_t v14 = sub_25EA35ED0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v8, v9, v14);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v15 = *(int *)(a3 + 20);
  uint64_t v16 = (void *)((char *)a1 + v15);
  uint64_t v17 = (char *)a2 + v15;
  uint64_t v18 = *(void *)((char *)a2 + v15 + 8);
  *uint64_t v16 = *(void *)((char *)a2 + v15);
  v16[1] = v18;
  uint64_t v19 = type metadata accessor for Dependencies();
  uint64_t v20 = *(int *)(v19 + 24);
  uint64_t v21 = (char *)v16 + v20;
  uint64_t v22 = &v17[v20];
  if (v12(&v17[v20], 1, v10))
  {
    sub_25EA20314(0, &qword_26A7276A8, (void (*)(uint64_t))type metadata accessor for ScopeGraphElement.ID);
    memcpy(v21, v22, *(void *)(*(void *)(v23 - 8) + 64));
  }
  else
  {
    uint64_t v24 = sub_25EA35ED0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 32))(v21, v22, v24);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v21, 0, 1, v10);
  }
  *(void *)((char *)v16 + *(int *)(v19 + 28)) = *(void *)&v17[*(int *)(v19 + 28)];
  return a1;
}

void *assignWithTake for ScopeReader(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  uint64_t v6 = *(int *)(type metadata accessor for ScopeReader.CurrentScope(0) + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for ScopeGraphElement.ID(0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  uint64_t v30 = v10;
  if (v12)
  {
    if (v13) {
      goto LABEL_6;
    }
    uint64_t v15 = sub_25EA35ED0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(v7, v8, v15);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  else
  {
    if (v13)
    {
      sub_25EA20494((uint64_t)v7, type metadata accessor for ScopeGraphElement.ID);
LABEL_6:
      sub_25EA20314(0, &qword_26A7276A8, (void (*)(uint64_t))type metadata accessor for ScopeGraphElement.ID);
      memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
      goto LABEL_9;
    }
    uint64_t v16 = sub_25EA35ED0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 40))(v7, v8, v16);
  }
LABEL_9:
  uint64_t v17 = *(int *)(a3 + 20);
  uint64_t v18 = (char *)a1 + v17;
  uint64_t v19 = (char *)a2 + v17;
  *(void *)((char *)a1 + v17) = *(void *)((char *)a2 + v17);
  swift_release();
  *((void *)v18 + 1) = *((void *)v19 + 1);
  uint64_t v20 = type metadata accessor for Dependencies();
  uint64_t v21 = *(int *)(v20 + 24);
  uint64_t v22 = &v18[v21];
  uint64_t v23 = &v19[v21];
  int v24 = v11(&v18[v21], 1, v9);
  int v25 = v11(v23, 1, v9);
  if (v24)
  {
    if (!v25)
    {
      uint64_t v27 = sub_25EA35ED0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 32))(v22, v23, v27);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v30 + 56))(v22, 0, 1, v9);
      goto LABEL_17;
    }
  }
  else
  {
    if (!v25)
    {
      uint64_t v28 = sub_25EA35ED0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 40))(v22, v23, v28);
      goto LABEL_17;
    }
    sub_25EA20494((uint64_t)v22, type metadata accessor for ScopeGraphElement.ID);
  }
  sub_25EA20314(0, &qword_26A7276A8, (void (*)(uint64_t))type metadata accessor for ScopeGraphElement.ID);
  memcpy(v22, v23, *(void *)(*(void *)(v26 - 8) + 64));
LABEL_17:
  *(void *)&v18[*(int *)(v20 + 28)] = *(void *)&v19[*(int *)(v20 + 28)];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ScopeReader(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25EA1F4A8);
}

uint64_t sub_25EA1F4A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for ScopeReader.CurrentScope(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = type metadata accessor for Dependencies();
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t storeEnumTagSinglePayload for ScopeReader(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25EA1F5B4);
}

uint64_t sub_25EA1F5B4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for ScopeReader.CurrentScope(0);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = type metadata accessor for Dependencies();
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

uint64_t sub_25EA1F6B8()
{
  uint64_t result = type metadata accessor for ScopeReader.CurrentScope(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for Dependencies();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_25EA1F780(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v5 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a1;
    a1[1] = a2[1];
    uint64_t v6 = *(int *)(a3 + 24);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = type metadata accessor for ScopeGraphElement.ID(0);
    uint64_t v10 = *(void *)(v9 - 8);
    uint64_t v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
    swift_retain();
    if (v11(v8, 1, v9))
    {
      sub_25EA20314(0, &qword_26A7276A8, (void (*)(uint64_t))type metadata accessor for ScopeGraphElement.ID);
      memcpy(v7, v8, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      uint64_t v13 = sub_25EA35ED0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v7, v8, v13);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
    }
  }
  return v5;
}

uint64_t sub_25EA1F92C(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = type metadata accessor for ScopeGraphElement.ID(0);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v4, 1, v5);
  if (!result)
  {
    uint64_t v7 = sub_25EA35ED0();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
    return v8(v4, v7);
  }
  return result;
}

void *sub_25EA1F9F0(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 24);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = type metadata accessor for ScopeGraphElement.ID(0);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48);
  swift_retain();
  if (v10(v7, 1, v8))
  {
    sub_25EA20314(0, &qword_26A7276A8, (void (*)(uint64_t))type metadata accessor for ScopeGraphElement.ID);
    memcpy(v6, v7, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    uint64_t v12 = sub_25EA35ED0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v6, v7, v12);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  }
  return a1;
}

void *sub_25EA1FB48(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for ScopeGraphElement.ID(0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      uint64_t v15 = sub_25EA35ED0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v7, v8, v15);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      return a1;
    }
  }
  else
  {
    if (!v13)
    {
      uint64_t v16 = sub_25EA35ED0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 24))(v7, v8, v16);
      return a1;
    }
    sub_25EA20494((uint64_t)v7, type metadata accessor for ScopeGraphElement.ID);
  }
  sub_25EA20314(0, &qword_26A7276A8, (void (*)(uint64_t))type metadata accessor for ScopeGraphElement.ID);
  memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
  return a1;
}

void *sub_25EA1FD50(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 24);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = type metadata accessor for ScopeGraphElement.ID(0);
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8))
  {
    sub_25EA20314(0, &qword_26A7276A8, (void (*)(uint64_t))type metadata accessor for ScopeGraphElement.ID);
    memcpy(v6, v7, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    uint64_t v11 = sub_25EA35ED0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v6, v7, v11);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  }
  return a1;
}

void *sub_25EA1FE98(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for ScopeGraphElement.ID(0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      uint64_t v15 = sub_25EA35ED0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(v7, v8, v15);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      return a1;
    }
  }
  else
  {
    if (!v13)
    {
      uint64_t v16 = sub_25EA35ED0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 40))(v7, v8, v16);
      return a1;
    }
    sub_25EA20494((uint64_t)v7, type metadata accessor for ScopeGraphElement.ID);
  }
  sub_25EA20314(0, &qword_26A7276A8, (void (*)(uint64_t))type metadata accessor for ScopeGraphElement.ID);
  memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
  return a1;
}

uint64_t sub_25EA20098(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25EA200AC);
}

uint64_t sub_25EA200AC(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    sub_25EA20314(0, &qword_26A7276A8, (void (*)(uint64_t))type metadata accessor for ScopeGraphElement.ID);
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_25EA20178(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25EA2018C);
}

void *sub_25EA2018C(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    sub_25EA20314(0, &qword_26A7276A8, (void (*)(uint64_t))type metadata accessor for ScopeGraphElement.ID);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 24);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_25EA20250()
{
  sub_25EA20314(319, &qword_26A7276A8, (void (*)(uint64_t))type metadata accessor for ScopeGraphElement.ID);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_25EA20314(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_25EA362E0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_25EA20368(uint64_t a1, uint64_t a2, unint64_t *a3, void (*a4)(uint64_t))
{
  sub_25EA20314(0, a3, a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a2, a1, v6);
  return a2;
}

uint64_t sub_25EA203D4(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  sub_25EA20314(0, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_25EA20430(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ScopeReader.CurrentScope(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25EA20494(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25EA204F4(uint64_t a1, uint64_t a2)
{
  sub_25EA20314(0, &qword_26A7276A8, (void (*)(uint64_t))type metadata accessor for ScopeGraphElement.ID);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25EA20574(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_25EA205DC(uint64_t a1, uint64_t a2)
{
  sub_25EA20314(0, qword_26A7285E0, (void (*)(uint64_t))type metadata accessor for ScopeReader.CurrentScope);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_25EA2065C(uint64_t a1, uint64_t a2)
{
  sub_25EA20314(0, qword_26A7285E0, (void (*)(uint64_t))type metadata accessor for ScopeReader.CurrentScope);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

void KeyedDependencyContainer.init()(void *a1@<X8>)
{
  uint64_t v1 = MEMORY[0x263F8EE80];
  *a1 = MEMORY[0x263F8EE80];
  a1[1] = v1;
}

uint64_t KeyedDependencyContainer.registerDependency<A>(_:onResolve:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v16[3] = type metadata accessor for ControlledDependency();
  v16[4] = swift_getWitnessTable();
  uint64_t v8 = (void *)swift_allocObject();
  v16[0] = v8;
  uint64_t v8[2] = a1;
  v8[3] = a2;
  v8[4] = a3;
  uint64_t v8[5] = a4;
  swift_retain();
  sub_25EA20BDC(a3);
  uint64_t v9 = sub_25EA0CEF8();
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  sub_25EA21554((uint64_t)v16, (uint64_t)v15, (uint64_t (*)(void))sub_25EA20808);
  sub_25EA00020((uint64_t)v15, v9, v11, v13);
  return sub_25EA208B8((uint64_t)v16);
}

uint64_t type metadata accessor for ControlledDependency()
{
  return sub_25E9ED2B4();
}

void sub_25EA20808()
{
  if (!qword_26A727BD8)
  {
    sub_25EA20860();
    unint64_t v0 = sub_25EA362E0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A727BD8);
    }
  }
}

unint64_t sub_25EA20860()
{
  unint64_t result = qword_26A727BC8;
  if (!qword_26A727BC8)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_26A727BC8);
  }
  return result;
}

uint64_t sub_25EA208B8(uint64_t a1)
{
  sub_25EA20808();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t KeyedDependencyContainer.registerDependency<A, B>(_:disambiguation:onResolve:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  uint64_t v11 = sub_25EA36100();
  v37[3] = type metadata accessor for ControlledDependency();
  void v37[4] = swift_getWitnessTable();
  uint64_t v12 = (void *)swift_allocObject();
  v37[0] = v12;
  void v12[2] = a1;
  uint64_t v12[3] = a2;
  v12[4] = a4;
  v12[5] = a5;
  uint64_t v13 = *(void *)(v5 + 8);
  swift_retain();
  sub_25EA20BDC(a4);
  sub_25EA0CEF8();
  if (*(void *)(v13 + 16) && (unint64_t v15 = sub_25EA06630(v14), (v16 & 1) != 0))
  {
    unint64_t v17 = *(void *)(*(void *)(v13 + 56) + 8 * v15);
    swift_bridgeObjectRetain();
  }
  else
  {
    unint64_t v17 = sub_25EA2101C(MEMORY[0x263F8EE78]);
  }
  swift_bridgeObjectRelease();
  sub_25EA0012C((uint64_t)v37, v11);
  unint64_t v18 = v17;
  uint64_t v19 = sub_25EA0CEF8();
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v25 = *(void *)(v6 + 8);
  *(void *)(v6 + 8) = 0x8000000000000000;
  unint64_t v27 = sub_25EA06630(v23);
  uint64_t v28 = *(void *)(v25 + 16);
  BOOL v29 = (v26 & 1) == 0;
  uint64_t v30 = v28 + v29;
  if (__OFADD__(v28, v29))
  {
    __break(1u);
    goto LABEL_16;
  }
  LOBYTE(a1) = v26;
  if (*(void *)(v25 + 24) >= v30)
  {
    if (isUniquelyReferenced_nonNull_native) {
      goto LABEL_10;
    }
LABEL_16:
    sub_25EA03EC8();
    goto LABEL_10;
  }
  sub_25EA0AE38(v30, isUniquelyReferenced_nonNull_native);
  unint64_t v31 = sub_25EA06630(v23);
  if ((a1 & 1) != (v32 & 1))
  {
    uint64_t result = sub_25EA364D0();
    __break(1u);
    return result;
  }
  unint64_t v27 = v31;
LABEL_10:
  *(void *)(v6 + 8) = v25;
  swift_bridgeObjectRelease();
  uint64_t v33 = *(void **)(v6 + 8);
  if ((a1 & 1) == 0)
  {
    unint64_t v34 = sub_25EA2101C(MEMORY[0x263F8EE78]);
    sub_25EA0B1F0(v27, v19, v21, v23, v34, v33);
    swift_bridgeObjectRetain();
  }
  uint64_t v35 = v33[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v35 + 8 * v27) = v18;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25EA20B94()
{
  swift_release();
  if (*(void *)(v0 + 32)) {
    swift_release();
  }
  return swift_deallocObject();
}

uint64_t sub_25EA20BDC(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t KeyedDependencyContainer.resolveDependency<A>(_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v5 = *v2;
  sub_25EA0CEF8();
  if (!*(void *)(v5 + 16) || (unint64_t v7 = sub_25EA06630(v6), (v8 & 1) == 0))
  {
    uint64_t v14 = 0;
    long long v12 = 0u;
    long long v13 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  sub_25E9EFBCC(*(void *)(v5 + 56) + 40 * v7, (uint64_t)&v12);
  swift_bridgeObjectRelease();
  if (!*((void *)&v13 + 1))
  {
LABEL_8:
    sub_25EA208B8((uint64_t)&v12);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 - 8) + 56))(a2, 1, 1, a1);
  }
  sub_25EA20860();
  swift_getExtendedExistentialTypeMetadata_unique();
  if ((swift_dynamicCast() & 1) != 0 && v16)
  {
    sub_25E9F9FD0(&v15, (uint64_t)v17);
    uint64_t v9 = v18;
    uint64_t v10 = v19;
    sub_25E9EFC30(v17, v18);
    (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v9, v10);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(a1 - 8) + 56))(a2, 0, 1, a1);
    return sub_25E9EF02C((uint64_t)v17);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 - 8) + 56))(a2, 1, 1, a1);
}

uint64_t KeyedDependencyContainer.resolveDependency<A, B>(_:disambiguation:)@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(v2 + 8);
  sub_25EA0CEF8();
  if (!*(void *)(v5 + 16) || (unint64_t v7 = sub_25EA06630(v6), (v8 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    uint64_t v18 = 0;
    long long v16 = 0u;
    long long v17 = 0u;
    goto LABEL_11;
  }
  uint64_t v9 = *(void *)(*(void *)(v5 + 56) + 8 * v7);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = sub_25EA36100();
  if (!*(void *)(v9 + 16) || (unint64_t v11 = sub_25EA025FC(v10), (v12 & 1) == 0))
  {
    uint64_t v18 = 0;
    long long v16 = 0u;
    long long v17 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  sub_25E9EFBCC(*(void *)(v9 + 56) + 40 * v11, (uint64_t)&v16);
  swift_bridgeObjectRelease();
  if (!*((void *)&v17 + 1))
  {
LABEL_11:
    sub_25EA208B8((uint64_t)&v16);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 - 8) + 56))(a2, 1, 1, a1);
  }
  sub_25EA20860();
  swift_getExtendedExistentialTypeMetadata_unique();
  if ((swift_dynamicCast() & 1) != 0 && v20)
  {
    sub_25E9F9FD0(&v19, (uint64_t)v21);
    uint64_t v13 = v22;
    uint64_t v14 = v23;
    sub_25E9EFC30(v21, v22);
    (*(void (**)(uint64_t, uint64_t))(v14 + 16))(v13, v14);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(a1 - 8) + 56))(a2, 0, 1, a1);
    return sub_25E9EF02C((uint64_t)v21);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 - 8) + 56))(a2, 1, 1, a1);
}

uint64_t sub_25EA20FB8@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t (*a2)(uint64_t)@<X2>, uint64_t a3@<X8>)
{
  uint64_t result = a1();
  if (a2) {
    return a2(a3);
  }
  return result;
}

uint64_t sub_25EA21008@<X0>(uint64_t a1@<X8>)
{
  return sub_25EA20FB8(*(uint64_t (**)(void))v1, *(uint64_t (**)(uint64_t))(v1 + 16), a1);
}

unint64_t sub_25EA2101C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_25EA214EC();
    uint64_t v3 = (void *)sub_25EA36450();
    for (uint64_t i = a1 + 32; ; i += 48)
    {
      sub_25EA21554(i, (uint64_t)&v11, (uint64_t (*)(void))sub_25EA215BC);
      uint64_t v5 = v11;
      unint64_t result = sub_25EA025FC(v11);
      if (v7) {
        break;
      }
      *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(void *)(v3[6] + 8 * result) = v5;
      unint64_t result = sub_25E9F9FD0(&v12, v3[7] + 40 * result);
      uint64_t v8 = v3[2];
      BOOL v9 = __OFADD__(v8, 1);
      uint64_t v10 = v8 + 1;
      if (v9) {
        goto LABEL_10;
      }
      v3[2] = v10;
      if (!--v1) {
        return (unint64_t)v3;
      }
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE80];
  }
  return result;
}

uint64_t dispatch thunk of DependencyContainer.resolveDependency<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of DependencyContainer.resolveDependency<A, B>(_:disambiguation:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 16))();
}

uint64_t destroy for KeyedDependencyContainer()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *_s9TeaBreeze24KeyedDependencyContainerVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for KeyedDependencyContainer(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *assignWithTake for KeyedDependencyContainer(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for KeyedDependencyContainer()
{
  return &type metadata for KeyedDependencyContainer;
}

uint64_t sub_25EA21278(uint64_t a1)
{
  uint64_t result = swift_release();
  if (*(void *)(a1 + 16))
  {
    return swift_release();
  }
  return result;
}

void *sub_25EA212C8(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v6 = a2 + 2;
  uint64_t v5 = a2[2];
  swift_retain();
  if (v5)
  {
    uint64_t v7 = a2[3];
    a1[2] = v5;
    a1[3] = v7;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 1) = *v6;
  }
  return a1;
}

void *sub_25EA2132C(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  uint64_t v5 = a2[2];
  if (!a1[2])
  {
    if (v5)
    {
      uint64_t v7 = a2[3];
      a1[2] = v5;
      a1[3] = v7;
      swift_retain();
      return a1;
    }
LABEL_7:
    *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
    return a1;
  }
  if (!v5)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v6 = a2[3];
  a1[2] = v5;
  a1[3] = v6;
  swift_retain();
  swift_release();
  return a1;
}

__n128 sub_25EA213CC(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_25EA213D8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  uint64_t v4 = *(void *)(a2 + 16);
  if (!*(void *)(a1 + 16))
  {
    if (v4)
    {
      uint64_t v6 = *(void *)(a2 + 24);
      *(void *)(a1 + 16) = v4;
      *(void *)(a1 + 24) = v6;
      return a1;
    }
LABEL_7:
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
    return a1;
  }
  if (!v4)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  swift_release();
  return a1;
}

uint64_t sub_25EA21464(uint64_t *a1, int a2)
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

uint64_t sub_25EA214AC(uint64_t result, int a2, int a3)
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

void sub_25EA214EC()
{
  if (!qword_26A727BE0)
  {
    sub_25EA20860();
    unint64_t v0 = sub_25EA36460();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A727BE0);
    }
  }
}

uint64_t sub_25EA21554(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void sub_25EA215BC()
{
  if (!qword_26A728668[0])
  {
    sub_25EA20860();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, qword_26A728668);
    }
  }
}

uint64_t StaticTruth.init(state:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 32))(a3, a1, a2);
}

uint64_t StaticTruth.state.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t sub_25EA21694(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
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

void sub_25EA217F0(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
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
      JUMPOUT(0x25EA21A08);
    case 4:
      *(_DWORD *)&a1[v8] = 0;
      goto LABEL_20;
    default:
LABEL_20:
      if (a2)
      {
LABEL_21:
        long long v16 = *(void (**)(void))(v6 + 56);
        v16();
      }
      return;
  }
}

uint64_t type metadata accessor for StaticTruth()
{
  return sub_25E9ED2B4();
}

uint64_t sub_25EA21A48()
{
  if (qword_26A7274C0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_25EA35F00();
  sub_25E9EBF30(v1, (uint64_t)qword_26A728BC0);
  swift_retain_n();
  uint64_t v2 = sub_25EA35EE0();
  os_log_type_t v3 = sub_25EA362B0();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    v17[0] = v5;
    *(_DWORD *)uint64_t v4 = 136315138;
    int64_t v18 = *(void *)(v0 + 24);
    sub_25E9FAE44();
    uint64_t v6 = sub_25EA36310();
    int64_t v18 = sub_25EA01DA0(v6, v7, v17);
    sub_25EA362F0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25E9E9000, v2, v3, "Scope deallocated; cleaning references. ID=%s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611E7A60](v5, -1, -1);
    MEMORY[0x2611E7A60](v4, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  uint64_t v9 = *(void *)(v0 + 16);
  int64_t v18 = *(void *)(v0 + 24);
  uint64_t v8 = v18;
  swift_beginAccess();
  sub_25E9F18D4(&v18);
  swift_endAccess();
  unsigned int v10 = (uint64_t *)(v9 + 136);
  swift_beginAccess();
  unint64_t v11 = sub_25EA024DC(v8);
  if (v12)
  {
    unint64_t v13 = v11;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v15 = *v10;
    int64_t v18 = *v10;
    *unsigned int v10 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_25EA038DC();
      uint64_t v15 = v18;
    }
    sub_25EA04810(v13, v15);
    *unsigned int v10 = v15;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_endAccess();
}

uint64_t sub_25EA21CCC(uint64_t a1, os_log_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v73 = a4;
  uint64_t v5 = v4;
  uint64_t v9 = type metadata accessor for Storage.ExplicitUpdate();
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v71 = (uint64_t)&v65 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v72 = (uint64_t)&v65 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v79 = (uint64_t)&v65 - v15;
  uint64_t v16 = *(void *)(a3 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v77 = (char *)&v65 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v65 - v20;
  MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v65 - v22;
  os_log_t v78 = *a2;
  if (qword_26A7274C0 != -1) {
    swift_once();
  }
  uint64_t v24 = sub_25EA35F00();
  uint64_t v25 = sub_25E9EBF30(v24, (uint64_t)qword_26A728BC0);
  char v26 = *(void (**)(char *, char *, uint64_t))(v16 + 16);
  uint64_t v75 = a1;
  int64_t v80 = v26;
  v26(v23, (char *)a1, a3);
  uint64_t v70 = v25;
  unint64_t v27 = sub_25EA35EE0();
  os_log_type_t v28 = sub_25EA362B0();
  int v29 = v28;
  BOOL v30 = os_log_type_enabled(v27, v28);
  uint64_t v76 = v16;
  if (v30)
  {
    uint64_t v31 = swift_slowAlloc();
    uint64_t v32 = swift_slowAlloc();
    uint64_t v81 = v32;
    *(_DWORD *)uint64_t v31 = 136315394;
    int v67 = v29;
    os_log_t v87 = v78;
    sub_25E9FAE44();
    uint64_t v69 = v5;
    os_log_t v66 = v27;
    uint64_t v33 = sub_25EA36310();
    os_log_t v87 = (os_log_t)sub_25EA01DA0(v33, v34, &v81);
    sub_25EA362F0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v31 + 12) = 2080;
    v80(v21, v23, a3);
    uint64_t v35 = sub_25EA36130();
    os_log_t v87 = (os_log_t)sub_25EA01DA0(v35, v36, &v81);
    uint64_t v5 = v69;
    sub_25EA362F0();
    swift_bridgeObjectRelease();
    uint64_t v68 = *(void (**)(char *, uint64_t))(v76 + 8);
    v68(v23, a3);
    unint64_t v27 = v66;
    _os_log_impl(&dword_25E9E9000, v66, (os_log_type_t)v67, "Received request to invoke command. Scope=%s, Command=%s", (uint8_t *)v31, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2611E7A60](v32, -1, -1);
    MEMORY[0x2611E7A60](v31, -1, -1);
  }
  else
  {
    uint64_t v68 = *(void (**)(char *, uint64_t))(v16 + 8);
    v68(v23, a3);
  }

  uint64_t v37 = v75;
  v80(v21, (char *)v75, a3);
  uint64_t v38 = v79;
  uint64_t v39 = v73;
  sub_25EA24418((uint64_t)v21, a3, v79);
  uint64_t v40 = v71;
  sub_25EA2DE3C(v38, v71, (uint64_t (*)(void))type metadata accessor for Storage.ExplicitUpdate);
  swift_beginAccess();
  uint64_t v41 = v72;
  sub_25EA2C040(v72, v40);
  swift_endAccess();
  sub_25EA2DEA4(v41, (uint64_t (*)(void))type metadata accessor for Storage.ExplicitUpdate);
  swift_beginAccess();
  uint64_t v42 = *(void *)(v5 + 128);
  uint64_t v81 = *(void *)(v5 + 56);
  long long v43 = *(_OWORD *)(v5 + 80);
  long long v82 = *(_OWORD *)(v5 + 64);
  long long v83 = v43;
  long long v44 = *(_OWORD *)(v5 + 112);
  long long v84 = *(_OWORD *)(v5 + 96);
  long long v85 = v44;
  uint64_t v86 = v42;
  os_log_t v88 = v78;
  uint64_t v45 = v74;
  sub_25E9F2C34(v37, (uint64_t *)&v88, a3, v39);
  if (v45)
  {
    uint64_t v46 = v21;
    v80(v77, (char *)v37, a3);
    MEMORY[0x2611E7810](v45);
    MEMORY[0x2611E7810](v45);
    uint64_t v47 = sub_25EA35EE0();
    os_log_type_t v48 = sub_25EA362C0();
    uint64_t v49 = a3;
    int v50 = v48;
    if (os_log_type_enabled(v47, v48))
    {
      uint64_t v51 = swift_slowAlloc();
      LODWORD(v73) = v50;
      char v52 = v77;
      uint64_t v53 = v51;
      uint64_t v74 = (void *)swift_slowAlloc();
      uint64_t v75 = swift_slowAlloc();
      uint64_t v81 = v75;
      *(_DWORD *)uint64_t v53 = 136315650;
      uint64_t v69 = v5;
      os_log_t v88 = v78;
      sub_25E9FAE44();
      os_log_t v78 = v47;
      uint64_t v54 = sub_25EA36310();
      os_log_t v88 = (os_log_t)sub_25EA01DA0(v54, v55, &v81);
      sub_25EA362F0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v53 + 12) = 2080;
      v80(v46, v52, v49);
      uint64_t v56 = sub_25EA36130();
      os_log_t v88 = (os_log_t)sub_25EA01DA0(v56, v57, &v81);
      sub_25EA362F0();
      swift_bridgeObjectRelease();
      v68(v52, v49);
      *(_WORD *)(v53 + 22) = 2112;
      MEMORY[0x2611E7810](v45);
      os_log_t v58 = (os_log_t)_swift_stdlib_bridgeErrorToNSError();
      os_log_t v88 = v58;
      uint64_t v5 = v69;
      sub_25EA362F0();
      uint64_t v59 = v74;
      *uint64_t v74 = v58;
      MEMORY[0x2611E7800](v45);
      MEMORY[0x2611E7800](v45);
      os_log_t v60 = v78;
      _os_log_impl(&dword_25E9E9000, v78, (os_log_type_t)v73, "Error raised while processing command. Scope=%s, Command=%s, Error=%@", (uint8_t *)v53, 0x20u);
      sub_25EA2E1A8(0, &qword_26A727718, (uint64_t (*)(uint64_t))sub_25E9FA3E4, MEMORY[0x263F8D8F0]);
      swift_arrayDestroy();
      MEMORY[0x2611E7A60](v59, -1, -1);
      uint64_t v61 = v75;
      swift_arrayDestroy();
      MEMORY[0x2611E7A60](v61, -1, -1);
      MEMORY[0x2611E7A60](v53, -1, -1);
    }
    else
    {
      v68(v77, v49);
      MEMORY[0x2611E7800](v45);
      MEMORY[0x2611E7800](v45);
    }
    swift_willThrow();
  }
  uint64_t v62 = v5;
  uint64_t v63 = v79;
  sub_25EA26C08(v62, v79);
  return sub_25EA2DEA4(v63, (uint64_t (*)(void))type metadata accessor for Storage.ExplicitUpdate);
}

uint64_t sub_25EA22500(uint64_t a1, void (**a2)(char *, uint64_t, uint64_t), uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v65 = a4;
  uint64_t v9 = type metadata accessor for Storage.ExplicitUpdate();
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v63 = (uint64_t)&v58 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v64 = (uint64_t)&v58 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v58 - v15;
  uint64_t v72 = *(void *)(a3 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v70 = (char *)&v58 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v58 - v20;
  MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v58 - v22;
  uint64_t v69 = *a2;
  if (qword_26A7274C0 != -1) {
    swift_once();
  }
  uint64_t v24 = sub_25EA35F00();
  uint64_t v25 = sub_25E9EBF30(v24, (uint64_t)qword_26A728BC0);
  char v26 = *(void (**)(char *, uint64_t, uint64_t))(v72 + 16);
  uint64_t v66 = a1;
  v26(v23, a1, a3);
  uint64_t v62 = v25;
  unint64_t v27 = sub_25EA35EE0();
  os_log_type_t v28 = sub_25EA362B0();
  int v60 = v28;
  BOOL v29 = os_log_type_enabled(v27, v28);
  uint64_t v71 = a3;
  int v67 = v16;
  uint64_t v68 = v5;
  if (v29)
  {
    uint64_t v30 = swift_slowAlloc();
    uint64_t v59 = swift_slowAlloc();
    uint64_t v74 = v59;
    *(_DWORD *)uint64_t v30 = 136315394;
    uint64_t v80 = (uint64_t)v69;
    sub_25E9FAE44();
    uint64_t v31 = sub_25EA36310();
    uint64_t v80 = sub_25EA01DA0(v31, v32, &v74);
    sub_25EA362F0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v30 + 12) = 2080;
    v26(v21, (uint64_t)v23, v71);
    uint64_t v33 = sub_25EA36130();
    uint64_t v80 = sub_25EA01DA0(v33, v34, &v74);
    uint64_t v16 = v67;
    sub_25EA362F0();
    a3 = v71;
    swift_bridgeObjectRelease();
    uint64_t v61 = *(void (**)(char *, uint64_t))(v72 + 8);
    v61(v23, a3);
    _os_log_impl(&dword_25E9E9000, v27, (os_log_type_t)v60, "Received request to raise event. Scope=%s, Event=%s", (uint8_t *)v30, 0x16u);
    uint64_t v35 = v59;
    swift_arrayDestroy();
    MEMORY[0x2611E7A60](v35, -1, -1);
    uint64_t v36 = v30;
    uint64_t v5 = v68;
    MEMORY[0x2611E7A60](v36, -1, -1);
  }
  else
  {
    uint64_t v61 = *(void (**)(char *, uint64_t))(v72 + 8);
    v61(v23, a3);
  }

  uint64_t v37 = v66;
  v26(v21, v66, a3);
  uint64_t v38 = v65;
  sub_25EA24418((uint64_t)v21, a3, (uint64_t)v16);
  uint64_t v39 = v63;
  sub_25EA2DE3C((uint64_t)v16, v63, (uint64_t (*)(void))type metadata accessor for Storage.ExplicitUpdate);
  swift_beginAccess();
  uint64_t v40 = v64;
  sub_25EA2C040(v64, v39);
  swift_endAccess();
  uint64_t v41 = v71;
  sub_25EA2DEA4(v40, (uint64_t (*)(void))type metadata accessor for Storage.ExplicitUpdate);
  swift_beginAccess();
  uint64_t v42 = *(void *)(v5 + 56);
  uint64_t v43 = *(void *)(v5 + 128);
  long long v44 = *(_OWORD *)(v5 + 80);
  long long v75 = *(_OWORD *)(v5 + 64);
  long long v76 = v44;
  long long v45 = *(_OWORD *)(v5 + 112);
  long long v77 = *(_OWORD *)(v5 + 96);
  long long v78 = v45;
  uint64_t v79 = v43;
  uint64_t v46 = (uint64_t)v69;
  uint64_t v73 = (void (*)(void, void, void))v69;
  uint64_t v74 = v42;
  sub_25E9F3464(v37, (uint64_t *)&v73, v41, v38);
  v26(v70, v37, v41);
  uint64_t v47 = sub_25EA35EE0();
  os_log_type_t v48 = sub_25EA362B0();
  if (os_log_type_enabled(v47, v48))
  {
    uint64_t v49 = swift_slowAlloc();
    uint64_t v66 = swift_slowAlloc();
    uint64_t v73 = (void (*)(void, void, void))v46;
    uint64_t v74 = v66;
    *(_DWORD *)uint64_t v49 = 136315394;
    sub_25E9FAE44();
    uint64_t v69 = v26;
    int v50 = v70;
    uint64_t v51 = sub_25EA36310();
    uint64_t v73 = (void (*)(void, void, void))sub_25EA01DA0(v51, v52, &v74);
    sub_25EA362F0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v49 + 12) = 2080;
    v69(v21, (uint64_t)v50, v41);
    uint64_t v53 = sub_25EA36130();
    uint64_t v73 = (void (*)(void, void, void))sub_25EA01DA0(v53, v54, &v74);
    sub_25EA362F0();
    uint64_t v16 = v67;
    swift_bridgeObjectRelease();
    v61(v50, v41);
    _os_log_impl(&dword_25E9E9000, v47, v48, "Concluded broadcast of event. Scope=%s, Event=%s", (uint8_t *)v49, 0x16u);
    uint64_t v55 = v66;
    swift_arrayDestroy();
    MEMORY[0x2611E7A60](v55, -1, -1);
    uint64_t v56 = v49;
    uint64_t v5 = v68;
    MEMORY[0x2611E7A60](v56, -1, -1);
  }
  else
  {
    v61(v70, v41);
  }

  sub_25EA26C08(v5, (uint64_t)v16);
  return sub_25EA2DEA4((uint64_t)v16, (uint64_t (*)(void))type metadata accessor for Storage.ExplicitUpdate);
}

uint64_t sub_25EA22C14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = *a4;
  uint64_t v15[2] = a5;
  v15[3] = a6;
  v15[4] = a7;
  v15[5] = a8;
  v15[6] = a1;
  v15[7] = a2;
  uint64_t v11 = sub_25EA17FA8(a6, a6, a8);
  uint64_t v16 = v10;
  sub_25EA24A7C((uint64_t)sub_25EA06CE4, (uint64_t)v15, v11, v12, v13, &v16, a5, a7);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25EA22CBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v16 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v18 = &v25[-v17];
  uint64_t v19 = *a4;
  uint64_t v26 = a5;
  uint64_t v27 = a6;
  uint64_t v28 = a7;
  uint64_t v29 = a8;
  uint64_t v30 = a9;
  uint64_t v31 = a1;
  uint64_t v32 = a2;
  (*(void (**)(uint64_t, uint64_t))(a8 + 16))(a6, a8);
  uint64_t v20 = sub_25EA17FA8(a6, a6, a8);
  uint64_t v33 = v19;
  sub_25EA24CE4((uint64_t)sub_25EA06CE8, (uint64_t)v25, (uint64_t)v18, v20, v21, v22, &v33, a5, a7, a9);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, AssociatedTypeWitness);
}

uint64_t sub_25EA22E5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v11 = *a5;
  v16[2] = a6;
  v16[3] = a7;
  v16[4] = a8;
  void v16[5] = a9;
  v16[6] = a1;
  v16[7] = a2;
  uint64_t v12 = sub_25EA18410(a7, a4);
  uint64_t v17 = v11;
  sub_25EA24A7C((uint64_t)sub_25EA0578C, (uint64_t)v16, v12, v13, v14, &v17, a6, a8);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25EA22F0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v23 = a2;
  uint64_t v24 = a4;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v15 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v17 = (char *)&v23 - v16;
  uint64_t v18 = *a5;
  uint64_t v27 = a6;
  uint64_t v28 = a7;
  uint64_t v29 = a8;
  uint64_t v30 = a9;
  uint64_t v31 = a10;
  uint64_t v32 = a1;
  uint64_t v33 = v23;
  (*(void (**)(uint64_t))(*(void *)(a9 + 8) + 16))(a7);
  uint64_t v19 = sub_25EA18410(a7, v24);
  uint64_t v34 = v18;
  sub_25EA24CE4((uint64_t)sub_25EA057B4, (uint64_t)v26, (uint64_t)v17, v19, v20, v21, &v34, a6, a8, a10);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, AssociatedTypeWitness);
}

uint64_t sub_25EA230B0(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *a2;
  swift_beginAccess();
  uint64_t v8 = *(void *)(v4 + 56);
  uint64_t v9 = *(void *)(v4 + 128);
  uint64_t v13 = v7;
  uint64_t v14 = v8;
  long long v10 = *(_OWORD *)(v4 + 80);
  long long v15 = *(_OWORD *)(v4 + 64);
  long long v16 = v10;
  long long v11 = *(_OWORD *)(v4 + 112);
  long long v17 = *(_OWORD *)(v4 + 96);
  long long v18 = v11;
  uint64_t v19 = v9;
  uint64_t result = sub_25E9F3F2C(a3, &v13, a3, a4);
  if ((result & 1) == 0)
  {
    uint64_t v14 = v7;
    return sub_25EA24F78(a3, &v14, a3, a4);
  }
  return result;
}

uint64_t sub_25EA23160(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = v2;
  uint64_t v5 = *a1;
  uint64_t v6 = *a2;
  uint64_t v7 = (void *)(v2 + 136);
  swift_beginAccess();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *(void *)(v2 + 136);
  uint64_t v22 = v9;
  *(void *)(v4 + 136) = 0x8000000000000000;
  unint64_t v11 = sub_25EA024DC(v6);
  uint64_t v12 = *(void *)(v9 + 16);
  BOOL v13 = (v10 & 1) == 0;
  uint64_t v14 = v12 + v13;
  if (__OFADD__(v12, v13))
  {
    __break(1u);
    goto LABEL_12;
  }
  char v3 = v10;
  if (*(void *)(v9 + 24) >= v14)
  {
    if (isUniquelyReferenced_nonNull_native) {
      goto LABEL_6;
    }
LABEL_12:
    sub_25EA038DC();
    uint64_t v9 = v22;
    goto LABEL_6;
  }
  sub_25EA0A204(v14, isUniquelyReferenced_nonNull_native);
  uint64_t v9 = v22;
  unint64_t v15 = sub_25EA024DC(v6);
  if ((v3 & 1) != (v16 & 1))
  {
    uint64_t result = sub_25EA364D0();
    __break(1u);
    return result;
  }
  unint64_t v11 = v15;
LABEL_6:
  *uint64_t v7 = v9;
  swift_bridgeObjectRelease();
  long long v17 = (void *)*v7;
  if ((v3 & 1) == 0)
  {
    uint64_t v18 = qword_26A7274D0;
    swift_bridgeObjectRetain();
    if (v18 != -1) {
      swift_once();
    }
    sub_25EA0B1A8(v11, v6, qword_26A727CC8, v17);
  }
  swift_bridgeObjectRetain();
  uint64_t v19 = v17[7];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  char v20 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v22 = *(void *)(v19 + 8 * v11);
  *(void *)(v19 + 8 * v11) = 0x8000000000000000;
  sub_25EA2DADC(v5, (uint64_t)sub_25EA2E120, 0, v20, &v22);
  *(void *)(v19 + 8 * v11) = v22;
  swift_bridgeObjectRelease();
  return swift_endAccess();
}

uint64_t sub_25EA2334C(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_25EA2337C(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t *, uint64_t, uint64_t))sub_25E9F22F0);
}

uint64_t sub_25EA23364(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_25EA2337C(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t *, uint64_t, uint64_t))sub_25E9F2560);
}

uint64_t sub_25EA2337C(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t *, uint64_t, uint64_t))
{
  uint64_t v10 = *a2;
  swift_beginAccess();
  a5(a1, &v10, a3, a4);
  return swift_endAccess();
}

uint64_t sub_25EA23400@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t v13 = *a2;
  nullsub_1(a3, a4);
  uint64_t v9 = type metadata accessor for NonComparableDependencyKeyOperations();
  uint64_t WitnessTable = swift_getWitnessTable();
  return sub_25EA279C4(a1, &v13, v11, a3, v9, a4, WitnessTable, a5);
}

uint64_t sub_25EA234B4@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t v13 = *a2;
  nullsub_1(a3, a4);
  uint64_t v9 = type metadata accessor for EquatableDependencyKeyOperations();
  uint64_t WitnessTable = swift_getWitnessTable();
  return sub_25EA279C4(a1, &v13, v11, a3, v9, a4, WitnessTable, a5);
}

uint64_t sub_25EA23574@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t *a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  uint64_t v18 = a3;
  uint64_t v19 = a1;
  uint64_t v20 = a6;
  uint64_t v21 = a2;
  uint64_t v7 = *(void *)(a5 + 8);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v9 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v11 = (char *)&v18 - v10;
  uint64_t v12 = type metadata accessor for NonComparableAmbiguousDependencyKeyOperations();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  unint64_t v15 = (char *)&v18 - v14;
  uint64_t v22 = *v18;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v19, AssociatedTypeWitness);
  sub_25EA0D60C((uint64_t)v11, (uint64_t)v15);
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_25EA279C4(v21, &v22, (uint64_t)v15, a4, v12, v7, WitnessTable, v20);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

uint64_t sub_25EA237B8@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t *a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  uint64_t v18 = a3;
  uint64_t v19 = a1;
  uint64_t v21 = a6;
  uint64_t v22 = a2;
  uint64_t v20 = *(void *)(a5 + 8);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v10 = (char *)&v17 - v9;
  uint64_t v11 = type metadata accessor for EquatableAmbiguousDependencyKeyOperations();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v17 - v13;
  uint64_t v23 = *v18;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v19, AssociatedTypeWitness);
  sub_25EA0D60C((uint64_t)v10, (uint64_t)v14);
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_25EA279C4(v22, &v23, (uint64_t)v14, a4, v11, v20, WitnessTable, v21);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

uint64_t sub_25EA23A08@<X0>(uint64_t *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  swift_getExtendedExistentialTypeMetadata();
  type metadata accessor for ScopeGraphElement.ID(255);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v10 = sub_25EA362E0();
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (long long *)((char *)&v24 - v11);
  uint64_t v13 = *a1;
  swift_beginAccess();
  uint64_t v14 = *(void *)(v4 + 56);
  uint64_t v15 = *(void *)(v4 + 128);
  uint64_t v25 = v13;
  uint64_t AssociatedTypeWitness = v14;
  long long v16 = *(_OWORD *)(v4 + 80);
  long long v27 = *(_OWORD *)(v4 + 64);
  long long v28 = v16;
  long long v17 = *(_OWORD *)(v4 + 112);
  long long v29 = *(_OWORD *)(v4 + 96);
  long long v30 = v17;
  uint64_t v31 = v15;
  sub_25E9F5634(&v25, a2, a3, (uint64_t)v12);
  if ((*(unsigned int (**)(long long *, uint64_t, uint64_t))(*(void *)(TupleTypeMetadata2 - 8) + 48))(v12, 1, TupleTypeMetadata2) == 1)
  {
    uint64_t v18 = swift_checkMetadataState();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(a4, 1, 1, v18);
  }
  else
  {
    uint64_t v20 = (uint64_t)v12 + *(int *)(TupleTypeMetadata2 + 48);
    sub_25E9F9FD0(v12, (uint64_t)v32);
    sub_25EA2DEA4(v20, type metadata accessor for ScopeGraphElement.ID);
    uint64_t v21 = v33;
    uint64_t v22 = v34;
    sub_25E9EFC30(v32, v33);
    (*(void (**)(uint64_t, uint64_t))(v22 + 24))(v21, v22);
    uint64_t v23 = swift_checkMetadataState();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(a4, 0, 1, v23);
    return sub_25E9EF02C((uint64_t)v32);
  }
}

uint64_t sub_25EA23C90@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  swift_getExtendedExistentialTypeMetadata();
  type metadata accessor for ScopeGraphElement.ID(255);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v10 = sub_25EA362E0();
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (long long *)((char *)&v24 - v11);
  uint64_t v13 = *a2;
  swift_beginAccess();
  uint64_t v14 = *(void *)(v4 + 56);
  uint64_t v15 = *(void *)(v4 + 128);
  uint64_t v25 = v13;
  uint64_t AssociatedTypeWitness = v14;
  long long v16 = *(_OWORD *)(v4 + 80);
  long long v27 = *(_OWORD *)(v4 + 64);
  long long v28 = v16;
  long long v17 = *(_OWORD *)(v4 + 112);
  long long v29 = *(_OWORD *)(v4 + 96);
  long long v30 = v17;
  uint64_t v31 = v15;
  sub_25E9F5E94(a1, &v25, a3, (uint64_t)v12);
  if ((*(unsigned int (**)(long long *, uint64_t, uint64_t))(*(void *)(TupleTypeMetadata2 - 8) + 48))(v12, 1, TupleTypeMetadata2) == 1)
  {
    uint64_t v18 = swift_checkMetadataState();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(a4, 1, 1, v18);
  }
  else
  {
    uint64_t v20 = (uint64_t)v12 + *(int *)(TupleTypeMetadata2 + 48);
    sub_25E9F9FD0(v12, (uint64_t)v32);
    sub_25EA2DEA4(v20, type metadata accessor for ScopeGraphElement.ID);
    uint64_t v21 = v33;
    uint64_t v22 = v34;
    sub_25E9EFC30(v32, v33);
    (*(void (**)(uint64_t, uint64_t))(v22 + 24))(v21, v22);
    uint64_t v23 = swift_checkMetadataState();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(a4, 0, 1, v23);
    return sub_25E9EF02C((uint64_t)v32);
  }
}

uint64_t sub_25EA23F2C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void (*a4)(void *)@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  v23[2] = a5;
  uint64_t v24 = a4;
  v23[0] = a2;
  v23[1] = a6;
  uint64_t v8 = type metadata accessor for ScopeReader.CurrentScope(0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (void *)((char *)v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_25EA2E1A8(0, qword_26A7285E0, type metadata accessor for ScopeReader.CurrentScope, MEMORY[0x263F8D8F0]);
  uint64_t v13 = v12;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  long long v16 = (char *)v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)v23 - v17;
  if (qword_26A7274E0 != -1) {
    swift_once();
  }
  uint64_t v19 = sub_25E9EBF30(v13, (uint64_t)qword_26A7285A8);
  swift_beginAccess();
  uint64_t v20 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_25EA2DF04(v19, (uint64_t)v18, qword_26A7285E0, type metadata accessor for ScopeReader.CurrentScope, MEMORY[0x263F8D8F0]);
  sub_25EA2DF04(a3, (uint64_t)v11 + *(int *)(v8 + 24), &qword_26A7276A8, type metadata accessor for ScopeGraphElement.ID, v20);
  uint64_t v21 = v23[0];
  *uint64_t v11 = a1;
  v11[1] = v21;
  sub_25EA2DE3C((uint64_t)v11, (uint64_t)v16, type metadata accessor for ScopeReader.CurrentScope);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v16, 0, 1, v8);
  swift_beginAccess();
  swift_retain();
  sub_25EA205DC((uint64_t)v16, v19);
  swift_endAccess();
  v24(v11);
  swift_beginAccess();
  sub_25EA2065C((uint64_t)v18, v19);
  swift_endAccess();
  sub_25EA2DEA4((uint64_t)v11, type metadata accessor for ScopeReader.CurrentScope);
  return sub_25EA2DDE0((uint64_t)v18, qword_26A7285E0, type metadata accessor for ScopeReader.CurrentScope, v20);
}

uint64_t sub_25EA24244(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_25EA242AC(a1, a2, a3, a4, a5, a6, a7, a8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t))sub_25E9F2970);
}

uint64_t sub_25EA24278(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_25EA242AC(a1, a2, a3, a4, a5, a6, a7, a8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t))sub_25E9F2EC4);
}

uint64_t sub_25EA242AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void (*a9)(uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v17 = *a4;
  swift_beginAccess();
  a9(a1, a2, a3, &v17, a5, a6, a7, a8);
  return swift_endAccess();
}

uint64_t sub_25EA24360()
{
  sub_25EA36230();
  sub_25E9FD7B8((uint64_t)sub_25EA2BC20, v0);
  swift_release();
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t type metadata accessor for StorageHandle()
{
  return self;
}

uint64_t sub_25EA24418@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25EA35EC0();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, a2);
  uint64_t v9 = sub_25EA36130();
  uint64_t v11 = v10;
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, a2);
  uint64_t result = type metadata accessor for Storage.ExplicitUpdate();
  uint64_t v13 = (uint64_t *)(a3 + *(int *)(result + 20));
  *uint64_t v13 = v9;
  v13[1] = v11;
  return result;
}

uint64_t sub_25EA24528()
{
  uint64_t v1 = sub_25EA36590();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25EA2E1A8(0, &qword_26A727638, MEMORY[0x263F8E818], MEMORY[0x263F8D8F0]);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = (char *)v12 - v7;
  MEMORY[0x270FA5388](v6);
  sub_25EA2DE3C(v0, (uint64_t)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for Storage.ExplicitUpdate);
  v12[1] = MEMORY[0x263F8EE78];
  uint64_t v10 = sub_25EA36580();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 1, 1, v10);
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F8E830], v1);
  sub_25EA2E1A8(0, &qword_26A727640, (uint64_t (*)(uint64_t))sub_25E9EE700, MEMORY[0x263F8D488]);
  sub_25E9EE7C8();
  return sub_25EA365A0();
}

uint64_t sub_25EA2478C(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + *(int *)(a1 + 20));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_25EA247C4()
{
  return sub_25EA36560();
}

uint64_t sub_25EA24884()
{
  sub_25EA35ED0();
  sub_25EA27484(&qword_26A727660, MEMORY[0x263F07508]);
  sub_25EA360F0();
  swift_bridgeObjectRetain();
  sub_25EA36140();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25EA24938()
{
  return sub_25EA36560();
}

uint64_t sub_25EA249F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((_s9TeaBreeze17ScopeGraphElementV2IDV2eeoiySbAE_AEtFZ_0() & 1) == 0) {
    return 0;
  }
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = *(void *)(a1 + v6);
  uint64_t v8 = *(void *)(a1 + v6 + 8);
  uint64_t v9 = (void *)(a2 + v6);
  if (v7 == *v9 && v8 == v9[1]) {
    return 1;
  }
  return sub_25EA364B0();
}

uint64_t sub_25EA24A7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6, uint64_t a7, uint64_t a8)
{
  uint64_t v29 = a2;
  uint64_t v30 = a8;
  uint64_t v25 = a5;
  uint64_t v26 = a4;
  uint64_t v27 = a3;
  uint64_t v28 = a1;
  uint64_t v31 = *(void *)(a7 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for ScopeGraphElement.ID(0);
  uint64_t v15 = MEMORY[0x270FA5388](v14 - 8);
  uint64_t v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v24 - v18;
  uint64_t v38 = *a6;
  uint64_t v20 = v38;
  swift_beginAccess();
  uint64_t v21 = v27;
  sub_25E9F49D8(v27, a4, a5, &v38, (uint64_t)v19);
  swift_endAccess();
  uint64_t v22 = v30;
  uint64_t v33 = a7;
  uint64_t v34 = v30;
  uint64_t v35 = v28;
  uint64_t v36 = v29;
  v37[0] = v20;
  sub_25EA255E0(v37, (uint64_t)v19, (void (*)(void *))sub_25EA2E410, (uint64_t)v32, (uint64_t)v13);
  uint64_t v38 = v20;
  swift_beginAccess();
  sub_25E9F4E5C((uint64_t)v13, v21, v26, v25, &v38, v22, (uint64_t)v17);
  swift_endAccess();
  sub_25EA2DEA4((uint64_t)v17, type metadata accessor for ScopeGraphElement.ID);
  v37[0] = v20;
  sub_25EA25758((uint64_t)v19, v37, 0);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v13, a7);
  return sub_25EA2DEA4((uint64_t)v19, type metadata accessor for ScopeGraphElement.ID);
}

uint64_t sub_25EA24CE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t *a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v34 = a6;
  uint64_t v29 = a5;
  uint64_t v30 = a4;
  uint64_t v36 = a1;
  uint64_t v37 = a3;
  uint64_t v38 = *(void *)(a8 - 8);
  uint64_t v31 = a9;
  uint64_t v32 = a10;
  MEMORY[0x270FA5388](a1);
  uint64_t v33 = (uint64_t)&v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for ScopeGraphElement.ID(0);
  uint64_t v17 = MEMORY[0x270FA5388](v16 - 8);
  uint64_t v35 = (uint64_t)&v29 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v29 - v19;
  v46[0] = *a7;
  uint64_t v21 = v46[0];
  swift_beginAccess();
  uint64_t v22 = a5;
  uint64_t v23 = v34;
  sub_25E9F49D8(a4, v22, v34, v46, (uint64_t)v20);
  swift_endAccess();
  uint64_t v44 = a2;
  v45[0] = v21;
  uint64_t v24 = v31;
  uint64_t v40 = a8;
  uint64_t v41 = v31;
  uint64_t v25 = v33;
  uint64_t v42 = v32;
  uint64_t v43 = v36;
  uint64_t v26 = a8;
  sub_25EA255E0(v45, (uint64_t)v20, (void (*)(void *))sub_25EA2E3E8, (uint64_t)v39, v33);
  v46[0] = v21;
  swift_beginAccess();
  uint64_t v27 = v35;
  sub_25E9F5568(v25, v30, v29, v23, v37, v46, v24, v35);
  swift_endAccess();
  sub_25EA2DEA4(v27, type metadata accessor for ScopeGraphElement.ID);
  v45[0] = v21;
  sub_25EA25758((uint64_t)v20, v45, 0);
  (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v25, v26);
  return sub_25EA2DEA4((uint64_t)v20, type metadata accessor for ScopeGraphElement.ID);
}

uint64_t sub_25EA24F78(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  v52[1] = a1;
  sub_25EA2E1A8(0, &qword_26A7276A8, type metadata accessor for ScopeGraphElement.ID, MEMORY[0x263F8D8F0]);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v56 = (uint64_t)v52 - v11;
  uint64_t v12 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](v10);
  unint64_t v57 = (char *)v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_25EA362E0();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)v52 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)v52 - v19;
  uint64_t v21 = type metadata accessor for ScopeGraphElement.ID(0);
  uint64_t v53 = *(void *)(v21 - 8);
  uint64_t v54 = v21;
  MEMORY[0x270FA5388](v21);
  uint64_t v23 = (char *)v52 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = *a2;
  sub_25EA35EC0();
  v63[0] = v24;
  uint64_t v60 = a3;
  uint64_t v61 = a4;
  uint64_t v55 = a4;
  uint64_t v62 = v5;
  sub_25EA255E0(v63, (uint64_t)v23, (void (*)(void *))sub_25EA2E20C, (uint64_t)v59, (uint64_t)v20);
  uint64_t v25 = v20;
  uint64_t v26 = v12;
  (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v18, v25, v14);
  int v27 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48))(v18, 1, a3);
  uint64_t v58 = v25;
  if (v27 == 1)
  {
    uint64_t v28 = (uint64_t)v23;
    uint64_t v31 = *(void (**)(char *, uint64_t))(v15 + 8);
    uint64_t v30 = (char *)(v15 + 8);
    uint64_t v29 = v31;
    v31(v18, v14);
    uint64_t v32 = v14;
    if (qword_26A7274C0 != -1) {
      swift_once();
    }
    uint64_t v33 = sub_25EA35F00();
    sub_25E9EBF30(v33, (uint64_t)qword_26A728BC0);
    uint64_t v34 = sub_25EA35EE0();
    os_log_type_t v35 = sub_25EA362C0();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = swift_slowAlloc();
      uint64_t v37 = swift_slowAlloc();
      unint64_t v57 = v30;
      uint64_t v38 = v29;
      uint64_t v39 = v37;
      v63[0] = v37;
      *(_DWORD *)uint64_t v36 = 136315394;
      uint64_t v56 = v32;
      uint64_t v64 = v24;
      sub_25E9FAE44();
      uint64_t v40 = sub_25EA36310();
      uint64_t v64 = sub_25EA01DA0(v40, v41, v63);
      sub_25EA362F0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v36 + 12) = 2080;
      uint64_t v42 = sub_25EA365C0();
      uint64_t v64 = sub_25EA01DA0(v42, v43, v63);
      sub_25EA362F0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25E9E9000, v34, v35, "Dependency container did not provide value for Rule. Misconfiguration? Scope=%s, Rule=%s", (uint8_t *)v36, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2611E7A60](v39, -1, -1);
      MEMORY[0x2611E7A60](v36, -1, -1);

      v38(v58, v56);
    }
    else
    {

      v29(v58, v14);
    }
  }
  else
  {
    uint64_t v44 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
    long long v45 = v57;
    v44(v57, v18, a3);
    uint64_t v64 = v24;
    swift_beginAccess();
    uint64_t v46 = (uint64_t)v45;
    uint64_t v47 = v55;
    sub_25E9F4160(v46, &v64, (uint64_t)v23, a3, v55);
    uint64_t v48 = swift_endAccess();
    MEMORY[0x270FA5388](v48);
    v52[-6] = a3;
    v52[-5] = v47;
    v52[-4] = v5;
    v52[-3] = v23;
    v52[-2] = v24;
    uint64_t v49 = v56;
    sub_25EA2DE3C((uint64_t)v23, v56, type metadata accessor for ScopeGraphElement.ID);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v53 + 56))(v49, 0, 1, v54);
    sub_25EA23F2C(v5, v24, v49, (void (*)(void *))sub_25EA2E218, (uint64_t)&v52[-8], v50);
    sub_25EA2DDE0(v49, &qword_26A7276A8, type metadata accessor for ScopeGraphElement.ID, MEMORY[0x263F8D8F0]);
    (*(void (**)(char *, uint64_t))(v26 + 8))(v57, a3);
    (*(void (**)(char *, uint64_t))(v15 + 8))(v58, v14);
    uint64_t v28 = (uint64_t)v23;
  }
  return sub_25EA2DEA4(v28, type metadata accessor for ScopeGraphElement.ID);
}

uint64_t sub_25EA255E0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, void (*a3)(void *)@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v6 = v5;
  uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_25EA2E1A8(0, &qword_26A7276A8, type metadata accessor for ScopeGraphElement.ID, MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v18 - v14;
  uint64_t v19 = *a1;
  sub_25EA2DE3C(a2, (uint64_t)&v18 - v14, type metadata accessor for ScopeGraphElement.ID);
  uint64_t v16 = type metadata accessor for ScopeGraphElement.ID(0);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v15, 0, 1, v16);
  sub_25EA1D860(v6, &v19, (uint64_t)v15, a3, a4, a5);
  return sub_25EA2DDE0((uint64_t)v15, &qword_26A7276A8, type metadata accessor for ScopeGraphElement.ID, v12);
}

uint64_t sub_25EA25758(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  sub_25EA2E1A8(0, &qword_26A7276A0, type metadata accessor for ScopeGraphElement, (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for Vertex);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v28 - v12;
  uint64_t v14 = *a2;
  if (a3)
  {
    uint64_t v36 = v14;
    int v27 = &v36;
    return sub_25EA276C0(a1, v27, a3);
  }
  swift_beginAccess();
  if (!*(void *)(v3[19] + 16))
  {
    swift_beginAccess();
    if (!*(void *)(v3[18] + 16))
    {
      uint64_t v35 = v14;
      int v27 = &v35;
      return sub_25EA276C0(a1, v27, a3);
    }
  }
  uint64_t result = swift_beginAccess();
  uint64_t v16 = v3[8];
  if (*(void *)(v16 + 16))
  {
    uint64_t v28 = v8;
    uint64_t v29 = a1;
    uint64_t v18 = v3[9];
    uint64_t v17 = v3[10];
    uint64_t v34 = v3[11];
    uint64_t v19 = v3[14];
    uint64_t v20 = v3[15];
    uint64_t v21 = v16;
    swift_bridgeObjectRetain();
    uint64_t v32 = v18;
    swift_bridgeObjectRetain();
    uint64_t v33 = v17;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v31 = v19;
    swift_bridgeObjectRetain();
    uint64_t v30 = v20;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v22 = sub_25EA02548(v29);
    if (v23)
    {
      sub_25EA2DF04(*(void *)(v21 + 56) + *(void *)(v28 + 72) * v22, (uint64_t)v11, &qword_26A7276A0, type metadata accessor for ScopeGraphElement, (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for Vertex);
      sub_25EA2DF74((uint64_t)v11, (uint64_t)v13, &qword_26A7276A0, type metadata accessor for ScopeGraphElement, (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for Vertex);
      uint64_t v24 = &v13[*(int *)(type metadata accessor for ScopeGraphElement(0) + 24)];
      uint64_t v25 = *((void *)v24 + 3);
      uint64_t v26 = *((void *)v24 + 4);
      sub_25E9EFC30(v24, v25);
      (*(void (**)(uint64_t, uint64_t))(v26 + 48))(v25, v26);
      sub_25EA2DDE0((uint64_t)v13, &qword_26A7276A0, type metadata accessor for ScopeGraphElement, (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for Vertex);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25EA25A88@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = type metadata accessor for ScopeReader.CurrentScope(0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A7274C0 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_25EA35F00();
  sub_25E9EBF30(v11, (uint64_t)qword_26A728BC0);
  sub_25EA2DE3C(a1, (uint64_t)v10, type metadata accessor for ScopeReader.CurrentScope);
  uint64_t v12 = sub_25EA35EE0();
  os_log_type_t v13 = sub_25EA362B0();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    *(_DWORD *)uint64_t v14 = 136315394;
    uint64_t v25 = *((void *)v10 + 1);
    uint64_t v26 = v15;
    sub_25E9FAE44();
    v24[1] = a4;
    uint64_t v16 = sub_25EA36310();
    uint64_t v25 = sub_25EA01DA0(v16, v17, &v26);
    sub_25EA362F0();
    swift_bridgeObjectRelease();
    sub_25EA2DEA4((uint64_t)v10, type metadata accessor for ScopeReader.CurrentScope);
    *(_WORD *)(v14 + 12) = 2080;
    uint64_t v25 = a3;
    swift_getMetatypeMetadata();
    uint64_t v18 = sub_25EA36130();
    uint64_t v25 = sub_25EA01DA0(v18, v19, &v26);
    sub_25EA362F0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25E9E9000, v12, v13, "Scope is initializing Rule. Scope=%s, Rule=%s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2611E7A60](v15, -1, -1);
    MEMORY[0x2611E7A60](v14, -1, -1);
  }
  else
  {
    sub_25EA2DEA4((uint64_t)v10, type metadata accessor for ScopeReader.CurrentScope);
  }

  uint64_t v20 = a2 + 2;
  uint64_t v22 = a2[5];
  uint64_t v21 = a2[6];
  sub_25E9EFC30(v20, v22);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v21 + 8))(a3, a3, v22, v21);
}

uint64_t sub_25EA25D5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = type metadata accessor for ScopeReader.CurrentScope(0);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A7274C0 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_25EA35F00();
  sub_25E9EBF30(v13, (uint64_t)qword_26A728BC0);
  sub_25EA2DE3C(a1, (uint64_t)v12, type metadata accessor for ScopeReader.CurrentScope);
  uint64_t v14 = sub_25EA35EE0();
  os_log_type_t v15 = sub_25EA362B0();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    *(_DWORD *)uint64_t v16 = 136315394;
    v23[1] = a2;
    uint64_t v24 = *((void *)v12 + 1);
    uint64_t v25 = v17;
    sub_25E9FAE44();
    v23[0] = a4;
    uint64_t v18 = sub_25EA36310();
    uint64_t v24 = sub_25EA01DA0(v18, v19, &v25);
    sub_25EA362F0();
    swift_bridgeObjectRelease();
    sub_25EA2DEA4((uint64_t)v12, type metadata accessor for ScopeReader.CurrentScope);
    *(_WORD *)(v16 + 12) = 2080;
    uint64_t v24 = a5;
    swift_getMetatypeMetadata();
    uint64_t v20 = sub_25EA36130();
    uint64_t v24 = sub_25EA01DA0(v20, v21, &v25);
    a4 = v23[0];
    sub_25EA362F0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25E9E9000, v14, v15, "Scope is requesting initial Rule update. Scope=%s, Rule=%s", (uint8_t *)v16, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2611E7A60](v17, -1, -1);
    MEMORY[0x2611E7A60](v16, -1, -1);
  }
  else
  {
    sub_25EA2DEA4((uint64_t)v12, type metadata accessor for ScopeReader.CurrentScope);
  }

  uint64_t v25 = a4;
  return sub_25EA276C0(a3, &v25, 1);
}

uint64_t sub_25EA2601C()
{
  sub_25EA2E1A8(0, &qword_26A7276A0, type metadata accessor for ScopeGraphElement, (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for Vertex);
  uint64_t v101 = *(void *)(v1 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v1 - 8);
  uint64_t v4 = (char *)&v87 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v87 - v5;
  sub_25EA0BA6C();
  uint64_t v8 = v7;
  uint64_t v94 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v87 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v87 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v87 - v15;
  uint64_t v107 = type metadata accessor for ScopeGraphElement.ID(0);
  uint64_t v91 = *(void *)(v107 - 8);
  MEMORY[0x270FA5388](v107);
  uint64_t v18 = (char *)&v87 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25EA2E1A8(0, &qword_26A7276A8, type metadata accessor for ScopeGraphElement.ID, MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v19 - 8);
  unint64_t v21 = (char *)&v87 - v20;
  uint64_t result = swift_beginAccess();
  uint64_t v120 = v0;
  if (*(void *)(*(void *)(v0 + 144) + 16)) {
    return result;
  }
  v105 = (unint64_t *)(v0 + 144);
  v108 = v21;
  v103 = v16;
  uint64_t v93 = v11;
  v100 = v4;
  uint64_t v23 = v120;
  swift_beginAccess();
  uint64_t v24 = *(void *)(v23 + 128);
  uint64_t v121 = *(void *)(v23 + 56);
  long long v25 = *(_OWORD *)(v23 + 80);
  long long v122 = *(_OWORD *)(v23 + 64);
  long long v123 = v25;
  long long v26 = *(_OWORD *)(v23 + 112);
  long long v124 = *(_OWORD *)(v23 + 96);
  long long v125 = v26;
  uint64_t v126 = v24;
  uint64_t result = sub_25E9F0B90();
  int64_t v27 = 0;
  uint64_t v28 = *(void *)(result + 64);
  uint64_t v87 = result + 64;
  uint64_t v29 = 1 << *(unsigned char *)(result + 32);
  uint64_t v30 = -1;
  if (v29 < 64) {
    uint64_t v30 = ~(-1 << v29);
  }
  unint64_t v31 = v30 & v28;
  uint64_t v112 = v23 + 152;
  int64_t v88 = (unint64_t)(v29 + 63) >> 6;
  uint64_t v32 = v91;
  uint64_t v33 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v91 + 56);
  v109 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v91 + 48);
  uint64_t v92 = v14;
  uint64_t v34 = v107;
  uint64_t v90 = result;
  uint64_t v106 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v91 + 56);
  uint64_t v99 = v6;
  uint64_t v102 = v8;
  unint64_t v104 = v18;
  while (1)
  {
    if (v31)
    {
      unint64_t v36 = __clz(__rbit64(v31));
      uint64_t v37 = (v31 - 1) & v31;
      unint64_t v38 = v36 | (v27 << 6);
      goto LABEL_23;
    }
    int64_t v39 = v27 + 1;
    if (__OFADD__(v27, 1))
    {
LABEL_47:
      __break(1u);
      goto LABEL_48;
    }
    if (v39 >= v88) {
      return swift_release();
    }
    unint64_t v40 = *(void *)(v87 + 8 * v39);
    ++v27;
    if (!v40)
    {
      int64_t v27 = v39 + 1;
      if (v39 + 1 >= v88) {
        return swift_release();
      }
      unint64_t v40 = *(void *)(v87 + 8 * v27);
      if (!v40)
      {
        int64_t v27 = v39 + 2;
        if (v39 + 2 >= v88) {
          return swift_release();
        }
        unint64_t v40 = *(void *)(v87 + 8 * v27);
        if (!v40) {
          break;
        }
      }
    }
LABEL_22:
    uint64_t v37 = (v40 - 1) & v40;
    unint64_t v38 = __clz(__rbit64(v40)) + (v27 << 6);
LABEL_23:
    unint64_t v96 = v37;
    int64_t v97 = v27;
    uint64_t v42 = 8 * v38;
    uint64_t v43 = *(void *)(*(void *)(result + 56) + v42);
    uint64_t v44 = *(void *)(v43 + 16);
    uint64_t v95 = v43;
    if (v44)
    {
      unint64_t v89 = (unint64_t)v33 & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
      uint64_t v98 = *(void *)(*(void *)(result + 48) + v42);
      uint64_t v45 = v43 + ((*(unsigned __int8 *)(v32 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80));
      uint64_t v46 = v32;
      swift_bridgeObjectRetain();
      swift_beginAccess();
      uint64_t v111 = *(void *)(v46 + 72);
      uint64_t v47 = (uint64_t)v104;
      uint64_t v48 = (uint64_t)v108;
      while (1)
      {
        sub_25EA2DE3C(v45, v48, type metadata accessor for ScopeGraphElement.ID);
        v110 = *v33;
        v110((char *)v48, 0, 1, v34);
        if ((*v109)(v48, 1, v34) == 1) {
          break;
        }
        sub_25EA2DFE4(v48, v47, type metadata accessor for ScopeGraphElement.ID);
        if (*(void *)(*(void *)v112 + 16) || *(void *)(*v105 + 16))
        {
          uint64_t v49 = *(void *)(v120 + 64);
          if (*(void *)(v49 + 16))
          {
            uint64_t v113 = v45;
            uint64_t v114 = v44;
            uint64_t v50 = *(void *)(v120 + 72);
            uint64_t v51 = *(void *)(v120 + 80);
            uint64_t v52 = v47;
            uint64_t v54 = *(void *)(v120 + 88);
            uint64_t v53 = *(void *)(v120 + 96);
            uint64_t v55 = *(void *)(v120 + 104);
            swift_bridgeObjectRetain();
            uint64_t v119 = v50;
            swift_bridgeObjectRetain();
            uint64_t v118 = v51;
            swift_bridgeObjectRetain();
            uint64_t v117 = v54;
            swift_bridgeObjectRetain();
            uint64_t v116 = v53;
            uint64_t v47 = v52;
            swift_bridgeObjectRetain();
            uint64_t v115 = v55;
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            unint64_t v56 = sub_25EA02548(v52);
            if (v57)
            {
              uint64_t v58 = (uint64_t)v100;
              sub_25EA2DF04(*(void *)(v49 + 56) + *(void *)(v101 + 72) * v56, (uint64_t)v100, &qword_26A7276A0, type metadata accessor for ScopeGraphElement, (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for Vertex);
              uint64_t v59 = (uint64_t)v99;
              sub_25EA2DF74(v58, (uint64_t)v99, &qword_26A7276A0, type metadata accessor for ScopeGraphElement, (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for Vertex);
              uint64_t v60 = (void *)(v59 + *(int *)(type metadata accessor for ScopeGraphElement(0) + 24));
              uint64_t v61 = v60[3];
              uint64_t v62 = v60[4];
              sub_25E9EFC30(v60, v61);
              uint64_t v63 = *(void (**)(uint64_t, uint64_t))(v62 + 48);
              uint64_t v64 = v61;
              uint64_t v48 = (uint64_t)v108;
              uint64_t v65 = v62;
              uint64_t v34 = v107;
              v63(v64, v65);
              uint64_t v66 = v59;
              uint64_t v47 = (uint64_t)v104;
              sub_25EA2DDE0(v66, &qword_26A7276A0, type metadata accessor for ScopeGraphElement, (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for Vertex);
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              uint64_t v33 = v106;
              uint64_t v44 = v114;
              uint64_t v45 = v113;
            }
            else
            {
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              uint64_t v33 = v106;
              uint64_t v34 = v107;
              uint64_t v44 = v114;
              uint64_t v45 = v113;
              uint64_t v48 = (uint64_t)v108;
            }
          }
        }
        else
        {
          uint64_t v67 = (uint64_t)v103 + *(int *)(v102 + 48);
          void *v103 = v98;
          sub_25EA2DE3C(v47, v67, type metadata accessor for ScopeGraphElement.ID);
          uint64_t v68 = v105;
          swift_beginAccess();
          unint64_t v69 = *v68;
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          *uint64_t v68 = v69;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            unint64_t v69 = sub_25EA08524(0, *(void *)(v69 + 16) + 1, 1, v69);
            *uint64_t v68 = v69;
          }
          uint64_t v71 = (uint64_t)v103;
          unint64_t v73 = *(void *)(v69 + 16);
          unint64_t v72 = *(void *)(v69 + 24);
          if (v73 >= v72 >> 1)
          {
            unint64_t v69 = sub_25EA08524(v72 > 1, v73 + 1, 1, v69);
            uint64_t v71 = (uint64_t)v103;
            unint64_t *v105 = v69;
          }
          *(void *)(v69 + 16) = v73 + 1;
          unint64_t v74 = (*(unsigned __int8 *)(v94 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v94 + 80);
          uint64_t v75 = *(void *)(v94 + 72);
          sub_25EA2DFE4(v71, v69 + v74 + v75 * v73, (uint64_t (*)(void))sub_25EA0BA6C);
          swift_endAccess();
          uint64_t v76 = v120;
          uint64_t v77 = *(void *)(v120 + 128);
          uint64_t v121 = *(void *)(v120 + 56);
          long long v78 = *(_OWORD *)(v120 + 80);
          long long v122 = *(_OWORD *)(v120 + 64);
          long long v123 = v78;
          long long v79 = *(_OWORD *)(v120 + 112);
          long long v124 = *(_OWORD *)(v120 + 96);
          long long v125 = v79;
          uint64_t v126 = v77;
          sub_25E9F5F94((uint64_t)v104, 0);
          uint64_t result = swift_beginAccess();
          unint64_t v80 = *(void *)(v76 + 144);
          if (!*(void *)(v80 + 16))
          {
            __break(1u);
LABEL_46:
            __break(1u);
            goto LABEL_47;
          }
          uint64_t result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            uint64_t result = sub_25EA2E04C(v80);
            unint64_t v80 = result;
          }
          uint64_t v81 = *(void *)(v80 + 16);
          if (!v81) {
            goto LABEL_46;
          }
          uint64_t v82 = v81 - 1;
          uint64_t v83 = v80 + v74 + (v81 - 1) * v75;
          uint64_t v84 = (uint64_t)v93;
          sub_25EA2DFE4(v83, (uint64_t)v93, (uint64_t (*)(void))sub_25EA0BA6C);
          *(void *)(v80 + 16) = v82;
          *(void *)(v120 + 144) = v80;
          uint64_t v85 = (uint64_t)v92;
          sub_25EA2DFE4(v84, (uint64_t)v92, (uint64_t (*)(void))sub_25EA0BA6C);
          swift_endAccess();
          uint64_t v86 = sub_25EA2DEA4(v85 + *(int *)(v102 + 48), type metadata accessor for ScopeGraphElement.ID);
          sub_25EA2601C(v86);
          uint64_t v34 = v107;
          uint64_t v47 = (uint64_t)v104;
          uint64_t v48 = (uint64_t)v108;
          uint64_t v33 = v106;
        }
        sub_25EA2DEA4(v47, type metadata accessor for ScopeGraphElement.ID);
        v45 += v111;
        if (!--v44)
        {
          v110((char *)v48, 1, 1, v34);
          break;
        }
      }
    }
    else
    {
      uint64_t v35 = *v33;
      swift_bridgeObjectRetain();
      v35(v108, 1, 1, v34);
    }
    swift_bridgeObjectRelease();
    uint64_t v32 = v91;
    uint64_t result = v90;
    int64_t v27 = v97;
    unint64_t v31 = v96;
  }
  int64_t v41 = v39 + 3;
  if (v41 >= v88) {
    return swift_release();
  }
  unint64_t v40 = *(void *)(v87 + 8 * v41);
  if (v40)
  {
    int64_t v27 = v41;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v27 = v41 + 1;
    if (__OFADD__(v41, 1)) {
      break;
    }
    if (v27 >= v88) {
      return swift_release();
    }
    unint64_t v40 = *(void *)(v87 + 8 * v27);
    ++v41;
    if (v40) {
      goto LABEL_22;
    }
  }
LABEL_48:
  __break(1u);
  return result;
}

uint64_t sub_25EA26C08(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_25EA2E1A8(0, &qword_26A728708, (uint64_t (*)(uint64_t))type metadata accessor for Storage.ExplicitUpdate, MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v9 - v6;
  swift_beginAccess();
  sub_25E9F8CC0(a2, (uint64_t)v7);
  swift_endAccess();
  uint64_t result = sub_25EA2DDE0((uint64_t)v7, &qword_26A728708, (uint64_t (*)(uint64_t))type metadata accessor for Storage.ExplicitUpdate, v4);
  if (!*(void *)(*(void *)(a1 + 152) + 16))
  {
    uint64_t result = swift_beginAccess();
    if (!*(void *)(*(void *)(a1 + 144) + 16)) {
      return sub_25EA2601C();
    }
  }
  return result;
}

uint64_t sub_25EA26D40()
{
  sub_25E9EF02C(v0 + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 160, 7);
}

uint64_t type metadata accessor for Storage()
{
  return self;
}

uint64_t *sub_25EA26E34(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_25EA35ED0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    uint64_t v10 = (uint64_t *)((char *)a2 + v8);
    uint64_t v11 = v10[1];
    *uint64_t v9 = *v10;
    v9[1] = v11;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_25EA26F0C(uint64_t a1)
{
  uint64_t v2 = sub_25EA35ED0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25EA26F84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25EA35ED0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_25EA2700C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25EA35ED0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_25EA270A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25EA35ED0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_25EA27124(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25EA35ED0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_25EA271B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25EA271C4);
}

uint64_t sub_25EA271C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25EA35ED0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_25EA27288(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25EA2729C);
}

uint64_t sub_25EA2729C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_25EA35ED0();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata accessor for Storage.ExplicitUpdate()
{
  uint64_t result = qword_26A7286F0;
  if (!qword_26A7286F0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25EA273A8()
{
  uint64_t result = sub_25EA35ED0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_25EA2743C()
{
  return sub_25EA27484(&qword_26A728700, (void (*)(uint64_t))type metadata accessor for Storage.ExplicitUpdate);
}

uint64_t sub_25EA27484(unint64_t *a1, void (*a2)(uint64_t))
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

void *sub_25EA274CC@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_25EA274D8(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_25EA274E0@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_25EA274F4@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_25EA27508@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_25EA2751C(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_25EA2754C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_25EA27578@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_25EA2759C(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_25EA275B0(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_25EA275C4(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_25EA275D8@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_25EA275EC(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_25EA27600(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_25EA27614(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_25EA27628()
{
  return *v0 == 0;
}

uint64_t sub_25EA27638(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9E7D8](a1, a4, a2, a5, a3);
}

void *sub_25EA27650(void *result)
{
  *v1 &= ~*result;
  return result;
}

void *sub_25EA27664@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_25EA27674(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_25EA27680@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = sub_25EA2E5A8(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t sub_25EA276C0(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v37 = a3;
  sub_25EA0BA6C();
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)(v7 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v15 = (char *)&v35 - v14;
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v18 = (char *)&v35 - v17;
  uint64_t v19 = (char *)&v35 + *(int *)(v16 + 48) - v17;
  *(uint64_t *)((char *)&v35 - v17) = *a2;
  uint64_t v36 = a1;
  sub_25EA2DE3C(a1, (uint64_t)v19, type metadata accessor for ScopeGraphElement.ID);
  uint64_t v20 = (unint64_t *)(v4 + 144);
  swift_beginAccess();
  unint64_t v21 = *(void *)(v4 + 144);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v4 + 144) = v21;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    unint64_t v21 = sub_25EA08524(0, *(void *)(v21 + 16) + 1, 1, v21);
    *uint64_t v20 = v21;
  }
  unint64_t v24 = *(void *)(v21 + 16);
  unint64_t v23 = *(void *)(v21 + 24);
  if (v24 >= v23 >> 1)
  {
    unint64_t v21 = sub_25EA08524(v23 > 1, v24 + 1, 1, v21);
    *uint64_t v20 = v21;
  }
  *(void *)(v21 + 16) = v24 + 1;
  unint64_t v25 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  unint64_t v26 = v21 + v25;
  uint64_t v27 = *(void *)(v9 + 72);
  sub_25EA2DFE4((uint64_t)v18, v26 + v27 * v24, (uint64_t (*)(void))sub_25EA0BA6C);
  swift_endAccess();
  swift_beginAccess();
  uint64_t v28 = *(void *)(v4 + 128);
  uint64_t v38 = *(void *)(v4 + 56);
  long long v29 = *(_OWORD *)(v4 + 80);
  long long v39 = *(_OWORD *)(v4 + 64);
  long long v40 = v29;
  long long v30 = *(_OWORD *)(v4 + 112);
  long long v41 = *(_OWORD *)(v4 + 96);
  long long v42 = v30;
  uint64_t v43 = v28;
  sub_25E9F5F94(v36, v37);
  swift_beginAccess();
  unint64_t v31 = *(void *)(v4 + 144);
  if (!*(void *)(v31 + 16))
  {
    __break(1u);
LABEL_10:
    uint64_t result = sub_25EA2E04C(v31);
    unint64_t v31 = result;
    uint64_t v33 = *(void *)(result + 16);
    if (v33) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0) {
    goto LABEL_10;
  }
  uint64_t v33 = *(void *)(v31 + 16);
  if (v33)
  {
LABEL_8:
    uint64_t v34 = v33 - 1;
    sub_25EA2DFE4(v31 + v25 + (v33 - 1) * v27, (uint64_t)v12, (uint64_t (*)(void))sub_25EA0BA6C);
    *(void *)(v31 + 16) = v34;
    *(void *)(v4 + 144) = v31;
    sub_25EA2DFE4((uint64_t)v12, (uint64_t)v15, (uint64_t (*)(void))sub_25EA0BA6C);
    swift_endAccess();
    sub_25EA2DEA4((uint64_t)&v15[*(int *)(v8 + 48)], type metadata accessor for ScopeGraphElement.ID);
    return sub_25EA2601C();
  }
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_25EA279C4@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>)
{
  uint64_t v10 = v8;
  uint64_t v80 = a7;
  uint64_t v81 = a3;
  uint64_t v82 = a5;
  uint64_t v85 = a4;
  sub_25EA2E1A8(0, &qword_26A7276A8, type metadata accessor for ScopeGraphElement.ID, MEMORY[0x263F8D8F0]);
  uint64_t v16 = MEMORY[0x270FA5388](v15 - 8);
  uint64_t v74 = (uint64_t)v73 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v75 = (uint64_t)v73 - v19;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)v73 - v21;
  MEMORY[0x270FA5388](v20);
  unint64_t v24 = (char *)v73 - v23;
  uint64_t v84 = *a2;
  if (qword_26A7274C0 != -1) {
    swift_once();
  }
  uint64_t v25 = sub_25EA35F00();
  uint64_t v26 = sub_25E9EBF30(v25, (uint64_t)qword_26A728BC0);
  uint64_t v83 = a1;
  sub_25EA2DF04(a1, (uint64_t)v24, &qword_26A7276A8, type metadata accessor for ScopeGraphElement.ID, MEMORY[0x263F8D8F0]);
  uint64_t v79 = v26;
  uint64_t v27 = sub_25EA35EE0();
  os_log_type_t v28 = sub_25EA362B0();
  BOOL v29 = os_log_type_enabled(v27, v28);
  uint64_t v78 = a8;
  uint64_t v77 = a6;
  if (v29)
  {
    uint64_t v76 = v10;
    v73[1] = v9;
    uint64_t v30 = swift_slowAlloc();
    v73[0] = swift_slowAlloc();
    v91[0] = v73[0];
    *(_DWORD *)uint64_t v30 = 136315650;
    *(void *)&long long v88 = v84;
    sub_25E9FAE44();
    uint64_t v31 = sub_25EA36310();
    *(void *)&long long v88 = sub_25EA01DA0(v31, v32, v91);
    sub_25EA362F0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v30 + 12) = 2080;
    uint64_t v33 = sub_25EA365C0();
    *(void *)&long long v88 = sub_25EA01DA0(v33, v34, v91);
    sub_25EA362F0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v30 + 22) = 2080;
    sub_25EA2DF04((uint64_t)v24, (uint64_t)v22, &qword_26A7276A8, type metadata accessor for ScopeGraphElement.ID, MEMORY[0x263F8D8F0]);
    uint64_t v35 = type metadata accessor for ScopeGraphElement.ID(0);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v35 - 8) + 48))(v22, 1, v35) == 1)
    {
      uint64_t v36 = 7104878;
      sub_25EA2DDE0((uint64_t)v22, &qword_26A7276A8, type metadata accessor for ScopeGraphElement.ID, MEMORY[0x263F8D8F0]);
      unint64_t v37 = 0xE300000000000000;
    }
    else
    {
      uint64_t v36 = _s9TeaBreeze17ScopeGraphElementV2IDV11descriptionSSvg_0();
      unint64_t v37 = v38;
      sub_25EA2DEA4((uint64_t)v22, type metadata accessor for ScopeGraphElement.ID);
    }
    a6 = v77;
    uint64_t v10 = v76;
    *(void *)&long long v88 = sub_25EA01DA0(v36, v37, v91);
    sub_25EA362F0();
    swift_bridgeObjectRelease();
    sub_25EA2DDE0((uint64_t)v24, &qword_26A7276A8, type metadata accessor for ScopeGraphElement.ID, MEMORY[0x263F8D8F0]);
    _os_log_impl(&dword_25E9E9000, v27, v28, "Scope requested for dependency. Scope=%s, Key=%s, Access=%s", (uint8_t *)v30, 0x20u);
    uint64_t v39 = v73[0];
    swift_arrayDestroy();
    MEMORY[0x2611E7A60](v39, -1, -1);
    MEMORY[0x2611E7A60](v30, -1, -1);

    a8 = v78;
  }
  else
  {
    sub_25EA2DDE0((uint64_t)v24, &qword_26A7276A8, type metadata accessor for ScopeGraphElement.ID, MEMORY[0x263F8D8F0]);
  }
  v87[0] = v84;
  uint64_t v94 = v84;
  uint64_t v40 = v80;
  uint64_t v42 = v82;
  uint64_t v41 = v83;
  uint64_t v43 = v81;
  sub_25EA28558(v83, v87, &v94, v81, v85, v82, (uint64_t)&v88, v80);
  if (v89)
  {
    sub_25E9F9FD0(&v88, (uint64_t)v91);
    sub_25E9EFBCC((uint64_t)v91, (uint64_t)&v88);
    uint64_t v44 = sub_25EA35EE0();
    os_log_type_t v45 = sub_25EA362B0();
    if (os_log_type_enabled(v44, v45))
    {
      uint64_t v46 = swift_slowAlloc();
      uint64_t v83 = swift_slowAlloc();
      uint64_t v94 = v83;
      *(_DWORD *)uint64_t v46 = 136315650;
      v87[0] = v84;
      sub_25E9FAE44();
      uint64_t v47 = sub_25EA36310();
      v87[0] = sub_25EA01DA0(v47, v48, &v94);
      sub_25EA362F0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v46 + 12) = 2080;
      uint64_t v49 = sub_25EA365C0();
      v87[0] = sub_25EA01DA0(v49, v50, &v94);
      sub_25EA362F0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v46 + 22) = 2080;
      sub_25E9EFC30(&v88, v89);
      v87[0] = swift_getDynamicType();
      v87[1] = v90;
      uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
      swift_getExtendedExistentialTypeMetadata();
      uint64_t v51 = sub_25EA36130();
      v87[0] = sub_25EA01DA0(v51, v52, &v94);
      sub_25EA362F0();
      swift_bridgeObjectRelease();
      sub_25E9EF02C((uint64_t)&v88);
      _os_log_impl(&dword_25E9E9000, v44, v45, "Found existing dependency instance. Scope=%s, Key=%s, Source=%s", (uint8_t *)v46, 0x20u);
      uint64_t v53 = v83;
      swift_arrayDestroy();
      MEMORY[0x2611E7A60](v53, -1, -1);
      MEMORY[0x2611E7A60](v46, -1, -1);
    }
    else
    {
      sub_25E9EF02C((uint64_t)&v88);
    }

    uint64_t v69 = v92;
    uint64_t v70 = v93;
    sub_25E9EFC30(v91, v92);
    (*(void (**)(uint64_t, uint64_t))(v70 + 24))(v69, v70);
    return sub_25E9EF02C((uint64_t)v91);
  }
  else
  {
    uint64_t v76 = v10;
    uint64_t v54 = v41;
    uint64_t v55 = v75;
    sub_25EA2DF04(v54, v75, &qword_26A7276A8, type metadata accessor for ScopeGraphElement.ID, MEMORY[0x263F8D8F0]);
    unint64_t v56 = sub_25EA35EE0();
    int v57 = sub_25EA362B0();
    if (os_log_type_enabled(v56, (os_log_type_t)v57))
    {
      LODWORD(v79) = v57;
      uint64_t v58 = swift_slowAlloc();
      uint64_t v59 = swift_slowAlloc();
      v91[0] = v59;
      *(_DWORD *)uint64_t v58 = 136315650;
      *(void *)&long long v88 = v84;
      sub_25E9FAE44();
      uint64_t v60 = sub_25EA36310();
      *(void *)&long long v88 = sub_25EA01DA0(v60, v61, v91);
      sub_25EA362F0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v58 + 12) = 2080;
      uint64_t v62 = sub_25EA365C0();
      *(void *)&long long v88 = sub_25EA01DA0(v62, v63, v91);
      sub_25EA362F0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v58 + 22) = 2080;
      uint64_t v64 = v55;
      uint64_t v65 = v74;
      sub_25EA2DF04(v64, v74, &qword_26A7276A8, type metadata accessor for ScopeGraphElement.ID, MEMORY[0x263F8D8F0]);
      uint64_t v66 = type metadata accessor for ScopeGraphElement.ID(0);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v66 - 8) + 48))(v65, 1, v66) == 1)
      {
        uint64_t v67 = 7104878;
        sub_25EA2DDE0(v65, &qword_26A7276A8, type metadata accessor for ScopeGraphElement.ID, MEMORY[0x263F8D8F0]);
        unint64_t v68 = 0xE300000000000000;
      }
      else
      {
        uint64_t v67 = _s9TeaBreeze17ScopeGraphElementV2IDV11descriptionSSvg_0();
        unint64_t v68 = v72;
        sub_25EA2DEA4(v65, type metadata accessor for ScopeGraphElement.ID);
      }
      uint64_t v40 = v80;
      *(void *)&long long v88 = sub_25EA01DA0(v67, v68, v91);
      sub_25EA362F0();
      swift_bridgeObjectRelease();
      sub_25EA2DDE0(v75, &qword_26A7276A8, type metadata accessor for ScopeGraphElement.ID, MEMORY[0x263F8D8F0]);
      _os_log_impl(&dword_25E9E9000, v56, (os_log_type_t)v79, "Scope could not find dependency in tree; will instantiate dependency. Scope=%s, Key=%s, Access=%s",
        (uint8_t *)v58,
        0x20u);
      swift_arrayDestroy();
      MEMORY[0x2611E7A60](v59, -1, -1);
      MEMORY[0x2611E7A60](v58, -1, -1);

      a8 = v78;
      a6 = v77;
      uint64_t v43 = v81;
      uint64_t v42 = v82;
    }
    else
    {
      sub_25EA2DDE0(v55, &qword_26A7276A8, type metadata accessor for ScopeGraphElement.ID, MEMORY[0x263F8D8F0]);
    }
    v91[0] = v84;
    return sub_25EA29290(v83, v91, v43, v85, v42, a6, v40, a8);
  }
}

double sub_25EA28558@<D0>(uint64_t a1@<X1>, uint64_t *a2@<X2>, uint64_t *a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X8>, uint64_t a8)
{
  uint64_t v9 = v8;
  uint64_t v98 = a6;
  uint64_t v97 = a4;
  uint64_t v96 = a8;
  uint64_t v93 = a5;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  swift_getExtendedExistentialTypeMetadata();
  uint64_t v14 = type metadata accessor for ScopeGraphElement.ID(255);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v15 = sub_25EA362E0();
  uint64_t v16 = MEMORY[0x270FA5388](v15 - 8);
  uint64_t v94 = (long long *)((char *)v80 - v17);
  uint64_t v99 = *(void *)(v14 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v86 = (uint64_t)v80 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v90 = (uint64_t)v80 - v20;
  sub_25EA2E1A8(0, &qword_26A7276A8, type metadata accessor for ScopeGraphElement.ID, MEMORY[0x263F8D8F0]);
  uint64_t v22 = MEMORY[0x270FA5388](v21 - 8);
  uint64_t v87 = (uint64_t)v80 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  uint64_t v26 = (char *)v80 - v25;
  uint64_t v27 = MEMORY[0x270FA5388](v24);
  uint64_t v89 = (uint64_t)v80 - v28;
  uint64_t v29 = MEMORY[0x270FA5388](v27);
  uint64_t v31 = (char *)v80 - v30;
  MEMORY[0x270FA5388](v29);
  uint64_t v33 = (char *)v80 - v32;
  uint64_t v100 = *a2;
  uint64_t v34 = *a3;
  if (qword_26A7274C0 != -1) {
    swift_once();
  }
  uint64_t v35 = sub_25EA35F00();
  uint64_t v36 = sub_25E9EBF30(v35, (uint64_t)qword_26A728BC0);
  sub_25EA2DF04(a1, (uint64_t)v33, &qword_26A7276A8, type metadata accessor for ScopeGraphElement.ID, MEMORY[0x263F8D8F0]);
  uint64_t v88 = v36;
  unint64_t v37 = sub_25EA35EE0();
  int v38 = sub_25EA362B0();
  if (os_log_type_enabled(v37, (os_log_type_t)v38))
  {
    int v82 = v38;
    os_log_t v83 = v37;
    uint64_t v84 = a1;
    uint64_t v91 = v34;
    uint64_t v85 = v26;
    uint64_t v92 = a7;
    uint64_t v39 = swift_slowAlloc();
    uint64_t v81 = swift_slowAlloc();
    uint64_t AssociatedTypeWitness = v81;
    *(_DWORD *)uint64_t v39 = 136315906;
    *(void *)&long long v108 = v100;
    v80[1] = sub_25E9FAE44();
    uint64_t v40 = sub_25EA36310();
    *(void *)&long long v108 = sub_25EA01DA0(v40, v41, &AssociatedTypeWitness);
    sub_25EA362F0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v39 + 12) = 2080;
    uint64_t v42 = sub_25EA365C0();
    *(void *)&long long v108 = sub_25EA01DA0(v42, v43, &AssociatedTypeWitness);
    uint64_t v44 = v99;
    sub_25EA362F0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v39 + 22) = 2080;
    sub_25EA2DF04((uint64_t)v33, (uint64_t)v31, &qword_26A7276A8, type metadata accessor for ScopeGraphElement.ID, MEMORY[0x263F8D8F0]);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v44 + 48))(v31, 1, v14) == 1)
    {
      uint64_t v45 = 7104878;
      sub_25EA2DDE0((uint64_t)v31, &qword_26A7276A8, type metadata accessor for ScopeGraphElement.ID, MEMORY[0x263F8D8F0]);
      unint64_t v46 = 0xE300000000000000;
    }
    else
    {
      uint64_t v45 = _s9TeaBreeze17ScopeGraphElementV2IDV11descriptionSSvg_0();
      unint64_t v46 = v47;
      sub_25EA2DEA4((uint64_t)v31, type metadata accessor for ScopeGraphElement.ID);
    }
    uint64_t v34 = v91;
    *(void *)&long long v108 = sub_25EA01DA0(v45, v46, &AssociatedTypeWitness);
    sub_25EA362F0();
    swift_bridgeObjectRelease();
    sub_25EA2DDE0((uint64_t)v33, &qword_26A7276A8, type metadata accessor for ScopeGraphElement.ID, MEMORY[0x263F8D8F0]);
    *(_WORD *)(v39 + 32) = 2080;
    *(void *)&long long v108 = v34;
    uint64_t v48 = sub_25EA36310();
    *(void *)&long long v108 = sub_25EA01DA0(v48, v49, &AssociatedTypeWitness);
    sub_25EA362F0();
    swift_bridgeObjectRelease();
    os_log_t v50 = v83;
    _os_log_impl(&dword_25E9E9000, v83, (os_log_type_t)v82, "Attempting to resolve existing instance of dependency. Scope=%s, Key=%s, Access=%s, Origin=%s", (uint8_t *)v39, 0x2Au);
    uint64_t v51 = v81;
    swift_arrayDestroy();
    MEMORY[0x2611E7A60](v51, -1, -1);
    MEMORY[0x2611E7A60](v39, -1, -1);

    a7 = v92;
    uint64_t v26 = v85;
    a1 = v84;
  }
  else
  {
    sub_25EA2DDE0((uint64_t)v33, &qword_26A7276A8, type metadata accessor for ScopeGraphElement.ID, MEMORY[0x263F8D8F0]);
  }
  unint64_t v52 = v94;
  swift_beginAccess();
  uint64_t v53 = *(void *)(v9 + 56);
  uint64_t v54 = *(void *)(v9 + 128);
  long long v56 = *(_OWORD *)(v9 + 80);
  uint64_t v55 = v9 + 80;
  long long v103 = *(_OWORD *)(v55 - 16);
  long long v104 = v56;
  long long v57 = *(_OWORD *)(v55 + 32);
  long long v105 = *(_OWORD *)(v55 + 16);
  long long v106 = v57;
  uint64_t v107 = v54;
  uint64_t v101 = v100;
  uint64_t AssociatedTypeWitness = v53;
  (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v96 + 16))(&AssociatedTypeWitness, &v101, v98);
  uint64_t v58 = TupleTypeMetadata2;
  if ((*(unsigned int (**)(long long *, uint64_t, uint64_t))(*(void *)(TupleTypeMetadata2 - 8) + 48))(v52, 1, TupleTypeMetadata2) == 1)
  {
    sub_25EA2DF04(a1, (uint64_t)v26, &qword_26A7276A8, type metadata accessor for ScopeGraphElement.ID, MEMORY[0x263F8D8F0]);
    uint64_t v59 = sub_25EA35EE0();
    os_log_type_t v60 = sub_25EA362B0();
    if (os_log_type_enabled(v59, v60))
    {
      uint64_t v92 = a7;
      uint64_t v91 = v34;
      uint64_t v61 = swift_slowAlloc();
      uint64_t v62 = swift_slowAlloc();
      uint64_t v97 = v14;
      uint64_t v98 = v62;
      uint64_t AssociatedTypeWitness = v62;
      *(_DWORD *)uint64_t v61 = 136315906;
      uint64_t v63 = v99;
      *(void *)&long long v108 = v100;
      sub_25E9FAE44();
      uint64_t v64 = sub_25EA36310();
      *(void *)&long long v108 = sub_25EA01DA0(v64, v65, &AssociatedTypeWitness);
      sub_25EA362F0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v61 + 12) = 2080;
      uint64_t v66 = sub_25EA365C0();
      *(void *)&long long v108 = sub_25EA01DA0(v66, v67, &AssociatedTypeWitness);
      sub_25EA362F0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v61 + 22) = 2080;
      uint64_t v68 = v87;
      sub_25EA2DF04((uint64_t)v26, v87, &qword_26A7276A8, type metadata accessor for ScopeGraphElement.ID, MEMORY[0x263F8D8F0]);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v63 + 48))(v68, 1, v97) == 1)
      {
        uint64_t v69 = 7104878;
        sub_25EA2DDE0(v68, &qword_26A7276A8, type metadata accessor for ScopeGraphElement.ID, MEMORY[0x263F8D8F0]);
        unint64_t v70 = 0xE300000000000000;
      }
      else
      {
        uint64_t v69 = _s9TeaBreeze17ScopeGraphElementV2IDV11descriptionSSvg_0();
        unint64_t v70 = v76;
        sub_25EA2DEA4(v68, type metadata accessor for ScopeGraphElement.ID);
      }
      *(void *)&long long v108 = sub_25EA01DA0(v69, v70, &AssociatedTypeWitness);
      sub_25EA362F0();
      swift_bridgeObjectRelease();
      sub_25EA2DDE0((uint64_t)v26, &qword_26A7276A8, type metadata accessor for ScopeGraphElement.ID, MEMORY[0x263F8D8F0]);
      *(_WORD *)(v61 + 32) = 2080;
      *(void *)&long long v108 = v91;
      uint64_t v77 = sub_25EA36310();
      *(void *)&long long v108 = sub_25EA01DA0(v77, v78, &AssociatedTypeWitness);
      sub_25EA362F0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25E9E9000, v59, v60, "Did not find instance of dependency in scope, or any parent. Scope=%s, Key=%s, Access=%s, Origin=%s", (uint8_t *)v61, 0x2Au);
      uint64_t v79 = v98;
      swift_arrayDestroy();
      MEMORY[0x2611E7A60](v79, -1, -1);
      MEMORY[0x2611E7A60](v61, -1, -1);

      a7 = v92;
    }
    else
    {
      sub_25EA2DDE0((uint64_t)v26, &qword_26A7276A8, type metadata accessor for ScopeGraphElement.ID, MEMORY[0x263F8D8F0]);
    }
    *(void *)(a7 + 32) = 0;
    double result = 0.0;
    *(_OWORD *)a7 = 0u;
    *(_OWORD *)(a7 + 16) = 0u;
  }
  else
  {
    uint64_t v71 = (uint64_t)v52 + *(int *)(v58 + 48);
    sub_25E9F9FD0(v52, (uint64_t)&v108);
    uint64_t v72 = v90;
    sub_25EA2DFE4(v71, v90, type metadata accessor for ScopeGraphElement.ID);
    uint64_t v73 = v89;
    sub_25EA2DF04(a1, v89, &qword_26A7276A8, type metadata accessor for ScopeGraphElement.ID, MEMORY[0x263F8D8F0]);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v99 + 48))(v73, 1, v14) == 1)
    {
      sub_25EA2DEA4(v72, type metadata accessor for ScopeGraphElement.ID);
      sub_25EA2DDE0(v73, &qword_26A7276A8, type metadata accessor for ScopeGraphElement.ID, MEMORY[0x263F8D8F0]);
    }
    else
    {
      uint64_t v74 = v86;
      sub_25EA2DFE4(v73, v86, type metadata accessor for ScopeGraphElement.ID);
      swift_beginAccess();
      sub_25EA2B6AC(v72, v74);
      swift_endAccess();
      sub_25EA2DEA4(v74, type metadata accessor for ScopeGraphElement.ID);
      sub_25EA2DEA4(v72, type metadata accessor for ScopeGraphElement.ID);
    }
    sub_25E9F9FD0(&v108, a7);
  }
  return result;
}

uint64_t sub_25EA29290@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>)
{
  void (*v103)(long long *__return_ptr, uint64_t, uint64_t);
  uint64_t v104;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v106;
  uint64_t v107;
  long long v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t *v112;
  uint64_t v113;
  uint64_t v114;
  NSObject *v115;
  os_log_type_t v116;
  int v117;
  uint64_t v118;
  uint64_t v119;
  unint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  unint64_t v126;
  unint64_t v127;
  uint64_t v128;
  uint64_t v129;
  unint64_t v130;
  char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t (*v142)(uint64_t, uint64_t);
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  char *v148;
  uint64_t v149;
  void *v150;
  void v151[2];
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  long long v170;
  uint64_t v171;
  char *v172;
  uint64_t v173;
  uint64_t v174;
  os_log_t v175;
  char *v176;
  uint64_t v177;
  uint64_t v178;
  char v179[16];
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t DynamicType;
  uint64_t v189;
  uint64_t v190;
  long long v191;
  long long v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  long long v198;
  unint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;

  v155 = a8;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v154 = sub_25EA362E0();
  v153 = *(void *)(v154 - 8);
  MEMORY[0x270FA5388](v154);
  v159 = (char *)v151 - v16;
  sub_25EA2E1A8(0, &qword_26A7276A8, type metadata accessor for ScopeGraphElement.ID, MEMORY[0x263F8D8F0]);
  uint64_t v18 = MEMORY[0x270FA5388](v17 - 8);
  v158 = (uint64_t)v151 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  v157 = (uint64_t)v151 - v21;
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  *(void *)&v170 = (char *)v151 - v23;
  MEMORY[0x270FA5388](v22);
  v176 = (char *)v151 - v24;
  v162 = type metadata accessor for ScopeGraphElement.ID(0);
  v161 = *(void *)(v162 - 8);
  uint64_t v25 = MEMORY[0x270FA5388](v162);
  v152 = (uint64_t)v151 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  v178 = (uint64_t)v151 - v28;
  uint64_t v29 = MEMORY[0x270FA5388](v27);
  v171 = (uint64_t)v151 - v30;
  uint64_t v31 = MEMORY[0x270FA5388](v29);
  v174 = (uint64_t)v151 - v32;
  MEMORY[0x270FA5388](v31);
  uint64_t v34 = (char *)v151 - v33;
  uint64_t v35 = *a2;
  sub_25EA35EC0();
  v202 = v35;
  v197 = v35;
  v168 = a4;
  v180 = a4;
  v166 = a5;
  v181 = a5;
  v163 = a6;
  v182 = a6;
  v167 = a7;
  v183 = a7;
  v164 = a1;
  v184 = a1;
  uint64_t v36 = v173;
  v185 = v173;
  v165 = a3;
  v186 = a3;
  v194 = AssociatedTypeWitness;
  swift_getExtendedExistentialTypeMetadata();
  sub_25EA362E0();
  v172 = v34;
  sub_25EA255E0(&v197, (uint64_t)v34, (void (*)(void *))sub_25EA2E060, (uint64_t)v179, (uint64_t)&v198);
  if (v200)
  {
    sub_25E9EFBCC((uint64_t)&v198, (uint64_t)&v191);
  }
  else
  {
    v191 = v198;
    v192 = v199;
    v193 = v201;
  }
  uint64_t v37 = v202;
  uint64_t v38 = (uint64_t)v176;
  if (*((void *)&v192 + 1))
  {
    sub_25E9F9FD0(&v191, (uint64_t)&v194);
    if (qword_26A7274C0 != -1) {
      swift_once();
    }
    uint64_t v39 = sub_25EA35F00();
    uint64_t v40 = sub_25E9EBF30(v39, (uint64_t)qword_26A728BC0);
    sub_25EA2DF04(v164, v38, &qword_26A7276A8, type metadata accessor for ScopeGraphElement.ID, MEMORY[0x263F8D8F0]);
    sub_25E9EFBCC((uint64_t)&v194, (uint64_t)&v191);
    v177 = v40;
    unint64_t v41 = sub_25EA35EE0();
    int v42 = sub_25EA362B0();
    if (os_log_type_enabled(v41, (os_log_type_t)v42))
    {
      LODWORD(v169) = v42;
      uint64_t v43 = swift_slowAlloc();
      v160 = swift_slowAlloc();
      v190 = v160;
      *(_DWORD *)uint64_t v43 = 136315906;
      DynamicType = v37;
      sub_25E9FAE44();
      uint64_t v44 = sub_25EA36310();
      DynamicType = sub_25EA01DA0(v44, v45, &v190);
      sub_25EA362F0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v43 + 12) = 2080;
      uint64_t v46 = sub_25EA365C0();
      DynamicType = sub_25EA01DA0(v46, v47, &v190);
      sub_25EA362F0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v43 + 22) = 2080;
      uint64_t v48 = v170;
      sub_25EA2DF04(v38, v170, &qword_26A7276A8, type metadata accessor for ScopeGraphElement.ID, MEMORY[0x263F8D8F0]);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v161 + 48))(v48, 1, v162) == 1)
      {
        sub_25EA2DDE0(v48, &qword_26A7276A8, type metadata accessor for ScopeGraphElement.ID, MEMORY[0x263F8D8F0]);
        unint64_t v49 = 0xE300000000000000;
        uint64_t v50 = 7104878;
      }
      else
      {
        uint64_t v50 = _s9TeaBreeze17ScopeGraphElementV2IDV11descriptionSSvg_0();
        unint64_t v49 = v67;
        sub_25EA2DEA4(v48, type metadata accessor for ScopeGraphElement.ID);
      }
      DynamicType = sub_25EA01DA0(v50, v49, &v190);
      sub_25EA362F0();
      swift_bridgeObjectRelease();
      sub_25EA2DDE0(v38, &qword_26A7276A8, type metadata accessor for ScopeGraphElement.ID, MEMORY[0x263F8D8F0]);
      *(_WORD *)(v43 + 32) = 2080;
      sub_25E9EFC30(&v191, *((uint64_t *)&v192 + 1));
      DynamicType = swift_getDynamicType();
      v189 = v193;
      v187 = AssociatedTypeWitness;
      swift_getExtendedExistentialTypeMetadata();
      uint64_t v68 = sub_25EA36130();
      DynamicType = sub_25EA01DA0(v68, v69, &v190);
      sub_25EA362F0();
      swift_bridgeObjectRelease();
      sub_25E9EF02C((uint64_t)&v191);
      _os_log_impl(&dword_25E9E9000, v41, (os_log_type_t)v169, "Scope instantiated a dependency. Scope=%s, Key=%s, Access=%s, Dependency=%s", (uint8_t *)v43, 0x2Au);
      uint64_t v70 = v160;
      swift_arrayDestroy();
      MEMORY[0x2611E7A60](v70, -1, -1);
      MEMORY[0x2611E7A60](v43, -1, -1);
    }
    else
    {
      sub_25EA2DDE0(v38, &qword_26A7276A8, type metadata accessor for ScopeGraphElement.ID, MEMORY[0x263F8D8F0]);
      sub_25E9EF02C((uint64_t)&v191);
    }

    uint64_t v71 = v195;
    uint64_t v72 = v196;
    uint64_t v73 = sub_25E9EFC30(&v194, v195);
    DynamicType = v37;
    uint64_t v74 = v173 + 56;
    swift_beginAccess();
    uint64_t v75 = *(void (**)(void *, uint64_t *, char *, uint64_t, uint64_t, uint64_t, uint64_t))(v167 + 32);
    uint64_t v76 = (uint64_t)v172;
    v151[1] = v74;
    v75(v73, &DynamicType, v172, v74, v71, v72, v166);
    swift_endAccess();
    sub_25E9EFBCC((uint64_t)&v194, (uint64_t)&v191);
    uint64_t v77 = v174;
    sub_25EA2DE3C(v76, v174, type metadata accessor for ScopeGraphElement.ID);
    unint64_t v78 = sub_25EA35EE0();
    os_log_type_t v79 = sub_25EA362B0();
    int v80 = v79;
    BOOL v81 = os_log_type_enabled(v78, v79);
    v156 = AssociatedTypeWitness;
    if (v81)
    {
      uint64_t v82 = swift_slowAlloc();
      LODWORD(v176) = v80;
      uint64_t v83 = v82;
      *(void *)&v170 = swift_slowAlloc();
      v190 = v170;
      *(_DWORD *)uint64_t v83 = 136315650;
      DynamicType = v37;
      sub_25E9FAE44();
      uint64_t v84 = sub_25EA36310();
      DynamicType = sub_25EA01DA0(v84, v85, &v190);
      sub_25EA362F0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v83 + 12) = 2080;
      sub_25E9EFC30(&v191, *((uint64_t *)&v192 + 1));
      DynamicType = swift_getDynamicType();
      v189 = v193;
      v187 = AssociatedTypeWitness;
      swift_getExtendedExistentialTypeMetadata();
      uint64_t v86 = sub_25EA36130();
      DynamicType = sub_25EA01DA0(v86, v87, &v190);
      sub_25EA362F0();
      swift_bridgeObjectRelease();
      sub_25E9EF02C((uint64_t)&v191);
      *(_WORD *)(v83 + 22) = 2080;
      uint64_t v88 = v171;
      sub_25EA2DE3C(v77, v171, type metadata accessor for ScopeGraphElement.ID);
      uint64_t v89 = _s9TeaBreeze17ScopeGraphElementV2IDV11descriptionSSvg_0();
      unint64_t v91 = v90;
      sub_25EA2DEA4(v88, type metadata accessor for ScopeGraphElement.ID);
      DynamicType = sub_25EA01DA0(v89, v91, &v190);
      sub_25EA362F0();
      uint64_t v37 = v202;
      swift_bridgeObjectRelease();
      sub_25EA2DEA4(v77, type metadata accessor for ScopeGraphElement.ID);
      _os_log_impl(&dword_25E9E9000, v78, (os_log_type_t)v176, "Registered source into scope. Scope=%s, Source=%s, Vertex=%s", (uint8_t *)v83, 0x20u);
      uint64_t v92 = v170;
      swift_arrayDestroy();
      MEMORY[0x2611E7A60](v92, -1, -1);
      MEMORY[0x2611E7A60](v83, -1, -1);
    }
    else
    {
      sub_25E9EF02C((uint64_t)&v191);
      sub_25EA2DEA4(v77, type metadata accessor for ScopeGraphElement.ID);
    }

    uint64_t v93 = v173;
    swift_beginAccess();
    uint64_t v94 = *(void *)(v93 + 136);
    uint64_t v95 = (uint64_t)v172;
    if (*(void *)(v94 + 16) && (unint64_t v96 = sub_25EA024DC(v37), (v97 & 1) != 0))
    {
      uint64_t v98 = (uint64_t *)(*(void *)(v94 + 56) + 8 * v96);
    }
    else
    {
      if (qword_26A7274D0 != -1) {
        swift_once();
      }
      uint64_t v98 = &qword_26A727CC8;
    }
    uint64_t v99 = v168;
    os_log_t v100 = v175;
    uint64_t v101 = *v98;
    swift_endAccess();
    uint64_t v102 = v163;
    long long v103 = *(void (**)(long long *__return_ptr, uint64_t, uint64_t))(v163 + 24);
    swift_bridgeObjectRetain();
    v103(&v191, v99, v102);
    long long v104 = v191;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    DynamicType = v101;
    sub_25EA2DADC(v104, (uint64_t)sub_25EA2E120, 0, isUniquelyReferenced_nonNull_native, &DynamicType);
    v151[0] = v100;
    if (v100)
    {
      uint64_t result = swift_bridgeObjectRelease();
      __break(1u);
    }
    else
    {
      long long v106 = DynamicType;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *(void *)&v191 = v106;
      uint64_t v107 = sub_25EA08008();
      swift_bridgeObjectRelease();
      v160 = v107;
      v109 = *(void *)(v107 + 16);
      v110 = v173;
      uint64_t v111 = v178;
      if (v109)
      {
        uint64_t v112 = (uint64_t *)(v160 + 40);
        *(void *)&long long v108 = 136315650;
        v170 = v108;
        v169 = MEMORY[0x263F8EE58] + 8;
        do
        {
          uint64_t v114 = *(v112 - 1);
          uint64_t v113 = *v112;
          sub_25EA2DE3C(v95, v111, type metadata accessor for ScopeGraphElement.ID);
          uint64_t v115 = sub_25EA35EE0();
          uint64_t v116 = sub_25EA362B0();
          uint64_t v117 = v116;
          if (os_log_type_enabled(v115, v116))
          {
            uint64_t v118 = swift_slowAlloc();
            v176 = (char *)swift_slowAlloc();
            *(void *)&v191 = v176;
            *(_DWORD *)uint64_t v118 = v170;
            DynamicType = v202;
            sub_25E9FAE44();
            v175 = v115;
            uint64_t v119 = sub_25EA36310();
            *(void *)(v118 + 4) = sub_25EA01DA0(v119, v120, (uint64_t *)&v191);
            swift_bridgeObjectRelease();
            *(_WORD *)(v118 + 12) = 2080;
            uint64_t v121 = v171;
            sub_25EA2DE3C(v178, v171, type metadata accessor for ScopeGraphElement.ID);
            long long v122 = _s9TeaBreeze17ScopeGraphElementV2IDV11descriptionSSvg_0();
            LODWORD(v174) = v117;
            long long v123 = v113;
            long long v124 = v114;
            long long v125 = v122;
            v127 = v126;
            sub_25EA2DEA4(v121, type metadata accessor for ScopeGraphElement.ID);
            v128 = v125;
            uint64_t v114 = v124;
            uint64_t v113 = v123;
            *(void *)(v118 + 14) = sub_25EA01DA0(v128, v127, (uint64_t *)&v191);
            swift_bridgeObjectRelease();
            uint64_t v95 = (uint64_t)v172;
            sub_25EA2DEA4(v178, type metadata accessor for ScopeGraphElement.ID);
            *(_WORD *)(v118 + 22) = 2080;
            v129 = sub_25EA365C0();
            *(void *)(v118 + 24) = sub_25EA01DA0(v129, v130, (uint64_t *)&v191);
            swift_bridgeObjectRelease();
            uint64_t v115 = v175;
            _os_log_impl(&dword_25E9E9000, v175, (os_log_type_t)v174, "Autowiring rule following source resolution. Scope=%s, Source Vertex=%s, Rule=%s", (uint8_t *)v118, 0x20u);
            v131 = v176;
            swift_arrayDestroy();
            MEMORY[0x2611E7A60](v131, -1, -1);
            v132 = v118;
            uint64_t v111 = v178;
            v110 = v173;
            MEMORY[0x2611E7A60](v132, -1, -1);
          }
          else
          {
            sub_25EA2DEA4(v111, type metadata accessor for ScopeGraphElement.ID);
          }

          *(void *)&v191 = v202;
          sub_25EA24F78(v114, (uint64_t *)&v191, v114, v113);
          v112 += 2;
          --v109;
        }
        while (v109);
      }
      v133 = swift_bridgeObjectRelease();
      MEMORY[0x270FA5388](v133);
      v134 = v166;
      v151[-10] = v168;
      v151[-9] = v134;
      v135 = v167;
      v151[-8] = v163;
      v151[-7] = v135;
      v136 = v164;
      v151[-6] = v164;
      v151[-5] = &v194;
      v151[-4] = v110;
      v151[-3] = v95;
      v137 = v202;
      v151[-2] = v202;
      v138 = v157;
      sub_25EA2DE3C(v95, v157, type metadata accessor for ScopeGraphElement.ID);
      v139 = v161;
      v140 = v162;
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v161 + 56))(v138, 0, 1, v162);
      sub_25EA23F2C(v110, v137, v138, (void (*)(void *))sub_25EA2E170, (uint64_t)&v151[-12], v141);
      v142 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
      sub_25EA2DDE0(v138, &qword_26A7276A8, type metadata accessor for ScopeGraphElement.ID, MEMORY[0x263F8D8F0]);
      v143 = v158;
      sub_25EA2DF04(v136, v158, &qword_26A7276A8, type metadata accessor for ScopeGraphElement.ID, v142);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v139 + 48))(v143, 1, v140) == 1)
      {
        sub_25EA2DDE0(v143, &qword_26A7276A8, type metadata accessor for ScopeGraphElement.ID, MEMORY[0x263F8D8F0]);
        v144 = v173;
      }
      else
      {
        v145 = v152;
        sub_25EA2DFE4(v143, v152, type metadata accessor for ScopeGraphElement.ID);
        swift_beginAccess();
        v146 = v173;
        sub_25EA2B6AC(v95, v145);
        swift_endAccess();
        sub_25EA2DEA4(v145, type metadata accessor for ScopeGraphElement.ID);
        v144 = v146;
      }
      v147 = v156;
      v148 = v159;
      *(void *)&v191 = v202;
      (*(void (**)(uint64_t, long long *, uint64_t))(v167 + 40))(v144, &v191, v166);
      v149 = *(void *)(v147 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v149 + 48))(v148, 1, v147) == 1)
      {
        (*(void (**)(char *, uint64_t))(v153 + 8))(v148, v154);
        sub_25EA2E074();
        swift_allocError();
        *v150 = v168;
        swift_willThrow();
        if (v200) {
          sub_25E9EF02C((uint64_t)&v198);
        }
        sub_25EA2DEA4(v95, type metadata accessor for ScopeGraphElement.ID);
        return sub_25E9EF02C((uint64_t)&v194);
      }
      else
      {
        if (v200) {
          sub_25E9EF02C((uint64_t)&v198);
        }
        sub_25EA2DEA4(v95, type metadata accessor for ScopeGraphElement.ID);
        (*(void (**)(uint64_t, char *, uint64_t))(v149 + 32))(v155, v148, v147);
        return sub_25E9EF02C((uint64_t)&v194);
      }
    }
  }
  else
  {
    if (qword_26A7274C0 != -1) {
      swift_once();
    }
    uint64_t v51 = sub_25EA35F00();
    sub_25E9EBF30(v51, (uint64_t)qword_26A728BC0);
    swift_retain_n();
    unint64_t v52 = sub_25EA35EE0();
    uint64_t v53 = v36;
    os_log_type_t v54 = sub_25EA362B0();
    if (os_log_type_enabled(v52, v54))
    {
      uint64_t v55 = swift_slowAlloc();
      v178 = swift_slowAlloc();
      *(void *)&v191 = v178;
      *(_DWORD *)uint64_t v55 = 136315650;
      v194 = v37;
      sub_25E9FAE44();
      uint64_t v56 = sub_25EA36310();
      v194 = sub_25EA01DA0(v56, v57, (uint64_t *)&v191);
      sub_25EA362F0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v55 + 12) = 2080;
      uint64_t v58 = v168;
      uint64_t v59 = sub_25EA365C0();
      v194 = sub_25EA01DA0(v59, v60, (uint64_t *)&v191);
      sub_25EA362F0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v55 + 22) = 2080;
      sub_25E9EFBCC(v53 + 16, (uint64_t)&v194);
      sub_25EA2E0C8();
      uint64_t v61 = sub_25EA36130();
      v194 = sub_25EA01DA0(v61, v62, (uint64_t *)&v191);
      sub_25EA362F0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25E9E9000, v52, v54, "Scope could not load dependency from container. Misconfiguration? Scope=%s, Key=%s, Container=%s", (uint8_t *)v55, 0x20u);
      uint64_t v63 = v178;
      swift_arrayDestroy();
      MEMORY[0x2611E7A60](v63, -1, -1);
      MEMORY[0x2611E7A60](v55, -1, -1);

      uint64_t v64 = (uint64_t)v172;
    }
    else
    {

      swift_release_n();
      uint64_t v64 = (uint64_t)v172;
      uint64_t v58 = v168;
    }
    sub_25EA2E074();
    swift_allocError();
    *unint64_t v65 = v58;
    swift_willThrow();
    if (v200) {
      sub_25E9EF02C((uint64_t)&v198);
    }
    return sub_25EA2DEA4(v64, type metadata accessor for ScopeGraphElement.ID);
  }
  return result;
}

uint64_t sub_25EA2A928@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X7>, uint64_t a8@<X8>)
{
  uint64_t v62 = a4;
  uint64_t v63 = a6;
  uint64_t v54 = a5;
  uint64_t v59 = a3;
  uint64_t v61 = a8;
  uint64_t v58 = type metadata accessor for DependencyEnvironment();
  MEMORY[0x270FA5388](v58);
  uint64_t v60 = (uint64_t)&v50 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = type metadata accessor for Dependencies();
  MEMORY[0x270FA5388](v57);
  uint64_t v13 = (uint64_t *)((char *)&v50 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_25EA2E1A8(0, &qword_26A7276A8, type metadata accessor for ScopeGraphElement.ID, MEMORY[0x263F8D8F0]);
  uint64_t v15 = MEMORY[0x270FA5388](v14 - 8);
  uint64_t v56 = (uint64_t)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v50 - v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v50 - v20;
  uint64_t v55 = type metadata accessor for ScopeReader.CurrentScope(0);
  uint64_t v22 = MEMORY[0x270FA5388](v55);
  uint64_t v24 = (uint64_t *)((char *)&v50 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v22);
  uint64_t v26 = (char *)&v50 - v25;
  if (qword_26A7274C0 != -1) {
    swift_once();
  }
  uint64_t v27 = sub_25EA35F00();
  sub_25E9EBF30(v27, (uint64_t)qword_26A728BC0);
  sub_25EA2DE3C(a1, (uint64_t)v26, type metadata accessor for ScopeReader.CurrentScope);
  sub_25EA2DF04(a2, (uint64_t)v21, &qword_26A7276A8, type metadata accessor for ScopeGraphElement.ID, MEMORY[0x263F8D8F0]);
  uint64_t v28 = sub_25EA35EE0();
  int v29 = sub_25EA362B0();
  if (os_log_type_enabled(v28, (os_log_type_t)v29))
  {
    int v51 = v29;
    uint64_t v52 = a1;
    uint64_t v53 = a7;
    uint64_t v30 = swift_slowAlloc();
    uint64_t v31 = swift_slowAlloc();
    uint64_t v50 = v31;
    *(_DWORD *)uint64_t v30 = 136315650;
    uint64_t v64 = *((void *)v26 + 1);
    uint64_t v65 = v31;
    sub_25E9FAE44();
    uint64_t v32 = sub_25EA36310();
    uint64_t v64 = sub_25EA01DA0(v32, v33, &v65);
    sub_25EA362F0();
    swift_bridgeObjectRelease();
    sub_25EA2DEA4((uint64_t)v26, type metadata accessor for ScopeReader.CurrentScope);
    *(_WORD *)(v30 + 12) = 2080;
    uint64_t v34 = sub_25EA365C0();
    uint64_t v64 = sub_25EA01DA0(v34, v35, &v65);
    sub_25EA362F0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v30 + 22) = 2080;
    sub_25EA2DF04((uint64_t)v21, (uint64_t)v19, &qword_26A7276A8, type metadata accessor for ScopeGraphElement.ID, MEMORY[0x263F8D8F0]);
    uint64_t v36 = type metadata accessor for ScopeGraphElement.ID(0);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v36 - 8) + 48))(v19, 1, v36) == 1)
    {
      sub_25EA2DDE0((uint64_t)v19, &qword_26A7276A8, type metadata accessor for ScopeGraphElement.ID, MEMORY[0x263F8D8F0]);
      unint64_t v37 = 0xE300000000000000;
      uint64_t v38 = 7104878;
    }
    else
    {
      uint64_t v38 = _s9TeaBreeze17ScopeGraphElementV2IDV11descriptionSSvg_0();
      unint64_t v37 = v39;
      sub_25EA2DEA4((uint64_t)v19, type metadata accessor for ScopeGraphElement.ID);
    }
    a7 = v53;
    uint64_t v64 = sub_25EA01DA0(v38, v37, &v65);
    sub_25EA362F0();
    swift_bridgeObjectRelease();
    sub_25EA2DDE0((uint64_t)v21, &qword_26A7276A8, type metadata accessor for ScopeGraphElement.ID, MEMORY[0x263F8D8F0]);
    _os_log_impl(&dword_25E9E9000, v28, (os_log_type_t)v51, "Requesting dependency from container. Scope=%s, Key=%s, Access=%s", (uint8_t *)v30, 0x20u);
    uint64_t v40 = v50;
    swift_arrayDestroy();
    MEMORY[0x2611E7A60](v40, -1, -1);
    MEMORY[0x2611E7A60](v30, -1, -1);

    a1 = v52;
  }
  else
  {
    sub_25EA2DEA4((uint64_t)v26, type metadata accessor for ScopeReader.CurrentScope);
    sub_25EA2DDE0((uint64_t)v21, &qword_26A7276A8, type metadata accessor for ScopeGraphElement.ID, MEMORY[0x263F8D8F0]);
  }
  sub_25EA2DE3C(a1, (uint64_t)v24, type metadata accessor for ScopeReader.CurrentScope);
  uint64_t v41 = *v24;
  uint64_t v42 = v24[1];
  uint64_t v43 = v56;
  uint64_t v44 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_25EA2DF04((uint64_t)v24 + *(int *)(v55 + 24), v56, &qword_26A7276A8, type metadata accessor for ScopeGraphElement.ID, MEMORY[0x263F8D8F0]);
  swift_retain();
  sub_25EA2DEA4((uint64_t)v24, type metadata accessor for ScopeReader.CurrentScope);
  uint64_t v45 = v57;
  uint64_t v46 = *(int *)(v57 + 28);
  type metadata accessor for Dependencies.AmbiguousResolutionContext();
  uint64_t v47 = swift_allocObject();
  *(_OWORD *)(v47 + 16) = 0u;
  *(_OWORD *)(v47 + 32) = 0u;
  *(void *)(v47 + 48) = 0;
  *(void *)((char *)v13 + v46) = v47;
  *uint64_t v13 = v41;
  v13[1] = v42;
  sub_25EA2DF74(v43, (uint64_t)v13 + *(int *)(v45 + 24), &qword_26A7276A8, type metadata accessor for ScopeGraphElement.ID, v44);
  uint64_t v48 = v60;
  sub_25E9EFBCC(v59 + 16, v60);
  sub_25EA2DE3C((uint64_t)v13, v48 + *(int *)(v58 + 20), (uint64_t (*)(void))type metadata accessor for Dependencies);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(a7 + 24))(v48, v63, a7);
  sub_25EA2DEA4(v48, (uint64_t (*)(void))type metadata accessor for DependencyEnvironment);
  return sub_25EA2DEA4((uint64_t)v13, (uint64_t (*)(void))type metadata accessor for Dependencies);
}

uint64_t sub_25EA2B0A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v44 = a7;
  sub_25EA2E1A8(0, &qword_26A7276A8, type metadata accessor for ScopeGraphElement.ID, MEMORY[0x263F8D8F0]);
  uint64_t v16 = MEMORY[0x270FA5388](v15 - 8);
  uint64_t v18 = (char *)&v40 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v40 - v19;
  uint64_t v21 = type metadata accessor for ScopeReader.CurrentScope(0);
  MEMORY[0x270FA5388](v21 - 8);
  uint64_t v23 = (char *)&v40 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A7274C0 != -1) {
    swift_once();
  }
  uint64_t v24 = sub_25EA35F00();
  sub_25E9EBF30(v24, (uint64_t)qword_26A728BC0);
  sub_25EA2DE3C(a1, (uint64_t)v23, type metadata accessor for ScopeReader.CurrentScope);
  sub_25EA2DF04(a2, (uint64_t)v20, &qword_26A7276A8, type metadata accessor for ScopeGraphElement.ID, MEMORY[0x263F8D8F0]);
  sub_25E9EFBCC(a3, (uint64_t)v49);
  uint64_t v25 = sub_25EA35EE0();
  os_log_type_t v26 = sub_25EA362B0();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v41 = a6;
    uint64_t v42 = a5;
    uint64_t v43 = a4;
    uint64_t v40 = a9;
    uint64_t v27 = swift_slowAlloc();
    uint64_t v28 = swift_slowAlloc();
    uint64_t v48 = v28;
    *(_DWORD *)uint64_t v27 = 136315906;
    uint64_t DynamicType = *((void *)v23 + 1);
    sub_25E9FAE44();
    uint64_t v29 = sub_25EA36310();
    uint64_t DynamicType = sub_25EA01DA0(v29, v30, &v48);
    sub_25EA362F0();
    swift_bridgeObjectRelease();
    sub_25EA2DEA4((uint64_t)v23, type metadata accessor for ScopeReader.CurrentScope);
    *(_WORD *)(v27 + 12) = 2080;
    uint64_t v31 = sub_25EA365C0();
    uint64_t DynamicType = sub_25EA01DA0(v31, v32, &v48);
    sub_25EA362F0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v27 + 22) = 2080;
    sub_25EA2DF04((uint64_t)v20, (uint64_t)v18, &qword_26A7276A8, type metadata accessor for ScopeGraphElement.ID, MEMORY[0x263F8D8F0]);
    uint64_t v33 = type metadata accessor for ScopeGraphElement.ID(0);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v33 - 8) + 48))(v18, 1, v33) == 1)
    {
      sub_25EA2DDE0((uint64_t)v18, &qword_26A7276A8, type metadata accessor for ScopeGraphElement.ID, MEMORY[0x263F8D8F0]);
      unint64_t v34 = 0xE300000000000000;
      uint64_t v35 = 7104878;
    }
    else
    {
      uint64_t v35 = _s9TeaBreeze17ScopeGraphElementV2IDV11descriptionSSvg_0();
      unint64_t v34 = v36;
      sub_25EA2DEA4((uint64_t)v18, type metadata accessor for ScopeGraphElement.ID);
    }
    a5 = v42;
    uint64_t DynamicType = sub_25EA01DA0(v35, v34, &v48);
    sub_25EA362F0();
    swift_bridgeObjectRelease();
    sub_25EA2DDE0((uint64_t)v20, &qword_26A7276A8, type metadata accessor for ScopeGraphElement.ID, MEMORY[0x263F8D8F0]);
    *(_WORD *)(v27 + 32) = 2080;
    sub_25E9EFC30(v49, v49[3]);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t v47 = v49[4];
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    swift_getExtendedExistentialTypeMetadata();
    uint64_t v37 = sub_25EA36130();
    uint64_t DynamicType = sub_25EA01DA0(v37, v38, &v48);
    sub_25EA362F0();
    swift_bridgeObjectRelease();
    sub_25E9EF02C((uint64_t)v49);
    _os_log_impl(&dword_25E9E9000, v25, v26, "Scope is requesting initial dependency update. Scope=%s, Key=%s, Access=%s, Dependency=%s", (uint8_t *)v27, 0x2Au);
    swift_arrayDestroy();
    MEMORY[0x2611E7A60](v28, -1, -1);
    MEMORY[0x2611E7A60](v27, -1, -1);

    a6 = v41;
  }
  else
  {
    sub_25EA2DEA4((uint64_t)v23, type metadata accessor for ScopeReader.CurrentScope);
    sub_25EA2DDE0((uint64_t)v20, &qword_26A7276A8, type metadata accessor for ScopeGraphElement.ID, MEMORY[0x263F8D8F0]);
    sub_25E9EF02C((uint64_t)v49);
  }
  v49[0] = a6;
  return sub_25EA276C0(a5, v49, 1);
}

uint64_t sub_25EA2B6AC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v55 = type metadata accessor for ScopeGraphElement.ID(0);
  uint64_t v6 = MEMORY[0x270FA5388](v55);
  uint64_t v60 = (uint64_t)&v54 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v57 = (uint64_t)&v54 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v54 - v10;
  uint64_t v12 = (uint64_t)type metadata accessor for ScopeGraphElement.ID;
  sub_25EA2E1A8(0, &qword_26A7276B8, type metadata accessor for ScopeGraphElement.ID, (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for Edge);
  uint64_t v14 = v13 - 8;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v59 = (char *)&v54 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v56 = (char *)&v54 - v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v54 - v20;
  uint64_t v22 = MEMORY[0x270FA5388](v19);
  uint64_t v58 = (uint64_t)&v54 - v23;
  MEMORY[0x270FA5388](v22);
  uint64_t v25 = (char *)&v54 - v24;
  sub_25EA2DE3C(a1, (uint64_t)&v54 - v24, type metadata accessor for ScopeGraphElement.ID);
  uint64_t v26 = (uint64_t)&v25[*(int *)(v14 + 36)];
  uint64_t v27 = (unint64_t *)a2;
  sub_25EA2DE3C(a2, v26, type metadata accessor for ScopeGraphElement.ID);
  sub_25EA2DE3C(a1, (uint64_t)v11, type metadata accessor for ScopeGraphElement.ID);
  sub_25EA2DF04((uint64_t)v25, (uint64_t)v21, &qword_26A7276B8, type metadata accessor for ScopeGraphElement.ID, (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for Edge);
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v61 = (void *)*v3;
  uint64_t v29 = v61;
  *uint64_t v3 = 0x8000000000000000;
  unint64_t v31 = sub_25EA02548((uint64_t)v11);
  uint64_t v32 = v29[2];
  BOOL v33 = (v30 & 1) == 0;
  uint64_t v34 = v32 + v33;
  if (__OFADD__(v32, v33))
  {
    __break(1u);
    goto LABEL_18;
  }
  LOBYTE(v12) = v30;
  if (v29[3] >= v34)
  {
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      goto LABEL_19;
    }
  }
  else
  {
    sub_25EA09558(v34, isUniquelyReferenced_nonNull_native);
    uint64_t v29 = v61;
    unint64_t v35 = sub_25EA02548((uint64_t)v11);
    if ((v12 & 1) != (v36 & 1)) {
      goto LABEL_20;
    }
    unint64_t v31 = v35;
  }
  while (1)
  {
    uint64_t v37 = (uint64_t)v27;
    *uint64_t v3 = v29;
    swift_bridgeObjectRelease();
    unint64_t v38 = (void *)*v3;
    if ((v12 & 1) == 0)
    {
      uint64_t v39 = v57;
      sub_25EA2DE3C((uint64_t)v11, v57, type metadata accessor for ScopeGraphElement.ID);
      sub_25EA0B388(v31, v39, MEMORY[0x263F8EE88], v38);
    }
    uint64_t v12 = v58;
    sub_25EA2BC48(v58, (uint64_t)v21);
    uint64_t v27 = &qword_26A7276B8;
    sub_25EA2DDE0(v12, &qword_26A7276B8, type metadata accessor for ScopeGraphElement.ID, (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for Edge);
    sub_25EA2DEA4((uint64_t)v11, type metadata accessor for ScopeGraphElement.ID);
    uint64_t v40 = v60;
    sub_25EA2DE3C(v37, v60, type metadata accessor for ScopeGraphElement.ID);
    uint64_t v21 = v59;
    sub_25EA2DF04((uint64_t)v25, (uint64_t)v59, &qword_26A7276B8, type metadata accessor for ScopeGraphElement.ID, (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for Edge);
    int v41 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v61 = (void *)v3[1];
    uint64_t v42 = v61;
    v3[1] = 0x8000000000000000;
    unint64_t v31 = sub_25EA02548(v40);
    uint64_t v44 = v42[2];
    BOOL v45 = (v43 & 1) == 0;
    uint64_t v46 = v44 + v45;
    if (!__OFADD__(v44, v45)) {
      break;
    }
LABEL_18:
    __break(1u);
LABEL_19:
    sub_25EA03128();
    uint64_t v29 = v61;
  }
  char v47 = v43;
  if (v42[3] >= v46)
  {
    if ((v41 & 1) == 0)
    {
      sub_25EA03128();
      uint64_t v42 = v61;
    }
    goto LABEL_14;
  }
  sub_25EA09558(v46, v41);
  uint64_t v42 = v61;
  unint64_t v48 = sub_25EA02548(v40);
  if ((v47 & 1) != (v49 & 1))
  {
LABEL_20:
    uint64_t result = sub_25EA364D0();
    __break(1u);
    return result;
  }
  unint64_t v31 = v48;
LABEL_14:
  uint64_t v50 = (uint64_t)v56;
  v3[1] = v42;
  swift_bridgeObjectRelease();
  int v51 = (void *)v3[1];
  if ((v47 & 1) == 0)
  {
    uint64_t v52 = v57;
    sub_25EA2DE3C(v40, v57, type metadata accessor for ScopeGraphElement.ID);
    sub_25EA0B388(v31, v52, MEMORY[0x263F8EE88], v51);
  }
  sub_25EA2BC48(v50, (uint64_t)v21);
  sub_25EA2DDE0(v50, &qword_26A7276B8, type metadata accessor for ScopeGraphElement.ID, (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for Edge);
  sub_25EA2DEA4(v40, type metadata accessor for ScopeGraphElement.ID);
  return sub_25EA2DDE0((uint64_t)v25, &qword_26A7276B8, type metadata accessor for ScopeGraphElement.ID, (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for Edge);
}

uint64_t sub_25EA2BC20()
{
  return sub_25EA21A48();
}

uint64_t sub_25EA2BC48(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  sub_25EA2E1A8(0, &qword_26A7276B8, type metadata accessor for ScopeGraphElement.ID, (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for Edge);
  uint64_t v7 = v6;
  uint64_t v25 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v23 - v11;
  uint64_t v13 = *v2;
  sub_25EA36530();
  sub_25EA35ED0();
  sub_25EA27484(&qword_26A727660, MEMORY[0x263F07508]);
  swift_bridgeObjectRetain();
  sub_25EA360F0();
  uint64_t v27 = v7;
  sub_25EA360F0();
  uint64_t v14 = sub_25EA36560();
  uint64_t v15 = -1 << *(unsigned char *)(v13 + 32);
  unint64_t v16 = v14 & ~v15;
  uint64_t v17 = *(void *)(v13 + 56 + ((v16 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v16;
  uint64_t v26 = v12;
  if (v17)
  {
    uint64_t v23 = v2;
    uint64_t v24 = a1;
    uint64_t v18 = ~v15;
    uint64_t v19 = *(void *)(v25 + 72);
    do
    {
      sub_25EA2DF04(*(void *)(v13 + 48) + v19 * v16, (uint64_t)v10, &qword_26A7276B8, type metadata accessor for ScopeGraphElement.ID, (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for Edge);
      if ((_s9TeaBreeze17ScopeGraphElementV2IDV2eeoiySbAE_AEtFZ_0() & 1) != 0
        && (_s9TeaBreeze17ScopeGraphElementV2IDV2eeoiySbAE_AEtFZ_0() & 1) != 0)
      {
        sub_25EA2DDE0((uint64_t)v10, &qword_26A7276B8, type metadata accessor for ScopeGraphElement.ID, (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for Edge);
        swift_bridgeObjectRelease();
        sub_25EA2DDE0(a2, &qword_26A7276B8, type metadata accessor for ScopeGraphElement.ID, (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for Edge);
        sub_25EA2DF04(*(void *)(*v23 + 48) + v19 * v16, v24, &qword_26A7276B8, type metadata accessor for ScopeGraphElement.ID, (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for Edge);
        return 0;
      }
      sub_25EA2DDE0((uint64_t)v10, &qword_26A7276B8, type metadata accessor for ScopeGraphElement.ID, (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for Edge);
      unint64_t v16 = (v16 + 1) & v18;
    }
    while (((*(void *)(v13 + 56 + ((v16 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v16) & 1) != 0);
    swift_bridgeObjectRelease();
    uint64_t v3 = v23;
    a1 = v24;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v22 = (uint64_t)v26;
  sub_25EA2DF04(a2, (uint64_t)v26, &qword_26A7276B8, type metadata accessor for ScopeGraphElement.ID, (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for Edge);
  uint64_t v28 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  sub_25EA2CC48(v22, v16, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v28;
  swift_bridgeObjectRelease();
  sub_25EA2DF74(a2, a1, &qword_26A7276B8, type metadata accessor for ScopeGraphElement.ID, (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for Edge);
  return 1;
}

uint64_t sub_25EA2C040(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for Storage.ExplicitUpdate();
  uint64_t v26 = *(void *)(v6 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v27 = (uint64_t)&v23 - v10;
  uint64_t v11 = *v2;
  sub_25EA36530();
  sub_25EA35ED0();
  sub_25EA27484(&qword_26A727660, MEMORY[0x263F07508]);
  swift_bridgeObjectRetain();
  sub_25EA360F0();
  uint64_t v12 = (void *)(a2 + *(int *)(v6 + 20));
  swift_bridgeObjectRetain();
  sub_25EA36140();
  swift_bridgeObjectRelease();
  uint64_t v13 = sub_25EA36560();
  uint64_t v14 = -1 << *(unsigned char *)(v11 + 32);
  unint64_t v15 = v13 & ~v14;
  if ((*(void *)(v11 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
  {
    uint64_t v24 = v2;
    uint64_t v25 = a1;
    uint64_t v16 = ~v14;
    uint64_t v17 = *(void *)(v26 + 72);
    do
    {
      sub_25EA2DE3C(*(void *)(v11 + 48) + v17 * v15, (uint64_t)v9, (uint64_t (*)(void))type metadata accessor for Storage.ExplicitUpdate);
      if (_s9TeaBreeze17ScopeGraphElementV2IDV2eeoiySbAE_AEtFZ_0())
      {
        uint64_t v18 = &v9[*(int *)(v6 + 20)];
        BOOL v19 = *(void *)v18 == *v12 && *((void *)v18 + 1) == v12[1];
        if (v19 || (sub_25EA364B0() & 1) != 0)
        {
          sub_25EA2DEA4((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for Storage.ExplicitUpdate);
          swift_bridgeObjectRelease();
          sub_25EA2DEA4(a2, (uint64_t (*)(void))type metadata accessor for Storage.ExplicitUpdate);
          sub_25EA2DE3C(*(void *)(*v24 + 48) + v17 * v15, v25, (uint64_t (*)(void))type metadata accessor for Storage.ExplicitUpdate);
          return 0;
        }
      }
      sub_25EA2DEA4((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for Storage.ExplicitUpdate);
      unint64_t v15 = (v15 + 1) & v16;
    }
    while (((*(void *)(v11 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) != 0);
    swift_bridgeObjectRelease();
    uint64_t v3 = v24;
    a1 = v25;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v22 = v27;
  sub_25EA2DE3C(a2, v27, (uint64_t (*)(void))type metadata accessor for Storage.ExplicitUpdate);
  uint64_t v28 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  sub_25EA2CFB8(v22, v15, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v28;
  swift_bridgeObjectRelease();
  sub_25EA2DFE4(a2, a1, (uint64_t (*)(void))type metadata accessor for Storage.ExplicitUpdate);
  return 1;
}

uint64_t sub_25EA2C3A8()
{
  unint64_t v1 = v0;
  sub_25EA2E1A8(0, &qword_26A7276B8, type metadata accessor for ScopeGraphElement.ID, (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for Edge);
  uint64_t v36 = *(void *)(v2 - 8);
  uint64_t v37 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v31 - v3;
  uint64_t v5 = *v0;
  sub_25E9F9358();
  uint64_t v6 = sub_25EA36350();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v9 = *(void *)(v5 + 56);
    uint64_t v34 = (void *)(v5 + 56);
    if (v8 < 64) {
      uint64_t v10 = ~(-1 << v8);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & v9;
    uint64_t v32 = v0;
    int64_t v33 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v12 = v6 + 56;
    uint64_t result = swift_retain();
    int64_t v14 = 0;
    for (i = v5; ; uint64_t v5 = i)
    {
      if (v11)
      {
        unint64_t v16 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v17 = v16 | (v14 << 6);
      }
      else
      {
        int64_t v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v18 >= v33) {
          goto LABEL_33;
        }
        unint64_t v19 = v34[v18];
        ++v14;
        if (!v19)
        {
          int64_t v14 = v18 + 1;
          if (v18 + 1 >= v33) {
            goto LABEL_33;
          }
          unint64_t v19 = v34[v14];
          if (!v19)
          {
            int64_t v14 = v18 + 2;
            if (v18 + 2 >= v33) {
              goto LABEL_33;
            }
            unint64_t v19 = v34[v14];
            if (!v19)
            {
              int64_t v20 = v18 + 3;
              if (v20 >= v33)
              {
LABEL_33:
                swift_release();
                unint64_t v1 = v32;
                uint64_t v30 = 1 << *(unsigned char *)(v5 + 32);
                if (v30 > 63) {
                  bzero(v34, ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v34 = -1 << v30;
                }
                *(void *)(v5 + 16) = 0;
                break;
              }
              unint64_t v19 = v34[v20];
              if (!v19)
              {
                while (1)
                {
                  int64_t v14 = v20 + 1;
                  if (__OFADD__(v20, 1)) {
                    goto LABEL_39;
                  }
                  if (v14 >= v33) {
                    goto LABEL_33;
                  }
                  unint64_t v19 = v34[v14];
                  ++v20;
                  if (v19) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v14 = v20;
            }
          }
        }
LABEL_23:
        unint64_t v11 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      uint64_t v21 = *(void *)(v5 + 48);
      uint64_t v22 = *(void *)(v36 + 72);
      sub_25EA2DF74(v21 + v22 * v17, (uint64_t)v4, &qword_26A7276B8, type metadata accessor for ScopeGraphElement.ID, (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for Edge);
      sub_25EA36530();
      sub_25EA35ED0();
      sub_25EA27484(&qword_26A727660, MEMORY[0x263F07508]);
      sub_25EA360F0();
      sub_25EA360F0();
      uint64_t result = sub_25EA36560();
      uint64_t v23 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v24 = result & ~v23;
      unint64_t v25 = v24 >> 6;
      if (((-1 << v24) & ~*(void *)(v12 + 8 * (v24 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1 << v24) & ~*(void *)(v12 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v26 = 0;
        unint64_t v27 = (unint64_t)(63 - v23) >> 6;
        do
        {
          if (++v25 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v28 = v25 == v27;
          if (v25 == v27) {
            unint64_t v25 = 0;
          }
          v26 |= v28;
          uint64_t v29 = *(void *)(v12 + 8 * v25);
        }
        while (v29 == -1);
        unint64_t v15 = __clz(__rbit64(~v29)) + (v25 << 6);
      }
      *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      uint64_t result = sub_25EA2DF74((uint64_t)v4, *(void *)(v7 + 48) + v15 * v22, &qword_26A7276B8, type metadata accessor for ScopeGraphElement.ID, (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for Edge);
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *unint64_t v1 = v7;
  return result;
}

uint64_t sub_25EA2C82C()
{
  unint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Storage.ExplicitUpdate();
  uint64_t v33 = *(void *)(v2 - 8);
  uint64_t v34 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *v0;
  sub_25E9FA2EC();
  uint64_t v6 = sub_25EA36350();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v30 = v0;
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v9 = *(void *)(v5 + 56);
    uint64_t v32 = (void *)(v5 + 56);
    if (v8 < 64) {
      uint64_t v10 = ~(-1 << v8);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & v9;
    int64_t v31 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v12 = v6 + 56;
    uint64_t result = swift_retain();
    int64_t v14 = 0;
    while (1)
    {
      if (v11)
      {
        unint64_t v16 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v17 = v16 | (v14 << 6);
      }
      else
      {
        int64_t v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v18 >= v31) {
          goto LABEL_33;
        }
        unint64_t v19 = v32[v18];
        ++v14;
        if (!v19)
        {
          int64_t v14 = v18 + 1;
          if (v18 + 1 >= v31) {
            goto LABEL_33;
          }
          unint64_t v19 = v32[v14];
          if (!v19)
          {
            int64_t v14 = v18 + 2;
            if (v18 + 2 >= v31) {
              goto LABEL_33;
            }
            unint64_t v19 = v32[v14];
            if (!v19)
            {
              int64_t v20 = v18 + 3;
              if (v20 >= v31)
              {
LABEL_33:
                swift_release();
                unint64_t v1 = v30;
                uint64_t v29 = 1 << *(unsigned char *)(v5 + 32);
                if (v29 > 63) {
                  bzero(v32, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v32 = -1 << v29;
                }
                *(void *)(v5 + 16) = 0;
                break;
              }
              unint64_t v19 = v32[v20];
              if (!v19)
              {
                while (1)
                {
                  int64_t v14 = v20 + 1;
                  if (__OFADD__(v20, 1)) {
                    goto LABEL_39;
                  }
                  if (v14 >= v31) {
                    goto LABEL_33;
                  }
                  unint64_t v19 = v32[v14];
                  ++v20;
                  if (v19) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v14 = v20;
            }
          }
        }
LABEL_23:
        unint64_t v11 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      uint64_t v21 = *(void *)(v33 + 72);
      sub_25EA2DFE4(*(void *)(v5 + 48) + v21 * v17, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for Storage.ExplicitUpdate);
      sub_25EA36530();
      sub_25EA35ED0();
      sub_25EA27484(&qword_26A727660, MEMORY[0x263F07508]);
      sub_25EA360F0();
      swift_bridgeObjectRetain();
      sub_25EA36140();
      swift_bridgeObjectRelease();
      uint64_t result = sub_25EA36560();
      uint64_t v22 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v12 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v15 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      uint64_t result = sub_25EA2DFE4((uint64_t)v4, *(void *)(v7 + 48) + v15 * v21, (uint64_t (*)(void))type metadata accessor for Storage.ExplicitUpdate);
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *unint64_t v1 = v7;
  return result;
}

uint64_t sub_25EA2CC48(uint64_t a1, unint64_t a2, char a3)
{
  sub_25EA2E1A8(0, &qword_26A7276B8, type metadata accessor for ScopeGraphElement.ID, (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for Edge);
  uint64_t v24 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v22 - v8;
  unint64_t v10 = *(void *)(*v3 + 16);
  unint64_t v11 = *(void *)(*v3 + 24);
  unint64_t v23 = v3;
  if (v11 > v10 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_25EA2C3A8();
  }
  else
  {
    if (v11 > v10)
    {
      sub_25E9F8660();
      goto LABEL_14;
    }
    sub_25EA2D2B0();
  }
  uint64_t v12 = *v3;
  sub_25EA36530();
  sub_25EA35ED0();
  sub_25EA27484(&qword_26A727660, MEMORY[0x263F07508]);
  sub_25EA360F0();
  sub_25EA360F0();
  uint64_t v13 = sub_25EA36560();
  uint64_t v14 = -1 << *(unsigned char *)(v12 + 32);
  a2 = v13 & ~v14;
  if ((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v15 = ~v14;
    uint64_t v16 = *(void *)(v24 + 72);
    while (1)
    {
      sub_25EA2DF04(*(void *)(v12 + 48) + v16 * a2, (uint64_t)v9, &qword_26A7276B8, type metadata accessor for ScopeGraphElement.ID, (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for Edge);
      if ((_s9TeaBreeze17ScopeGraphElementV2IDV2eeoiySbAE_AEtFZ_0() & 1) != 0
        && (_s9TeaBreeze17ScopeGraphElementV2IDV2eeoiySbAE_AEtFZ_0() & 1) != 0)
      {
        break;
      }
      sub_25EA2DDE0((uint64_t)v9, &qword_26A7276B8, type metadata accessor for ScopeGraphElement.ID, (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for Edge);
      a2 = (a2 + 1) & v15;
      if (((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
        goto LABEL_14;
      }
    }
    sub_25EA2DDE0((uint64_t)v9, &qword_26A7276B8, type metadata accessor for ScopeGraphElement.ID, (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for Edge);
    sub_25EA364C0();
    __break(1u);
  }
LABEL_14:
  uint64_t v17 = *v23;
  *(void *)(*v23 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = sub_25EA2DF74(a1, *(void *)(v17 + 48) + *(void *)(v24 + 72) * a2, &qword_26A7276B8, type metadata accessor for ScopeGraphElement.ID, (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for Edge);
  uint64_t v19 = *(void *)(v17 + 16);
  BOOL v20 = __OFADD__(v19, 1);
  uint64_t v21 = v19 + 1;
  if (v20) {
    __break(1u);
  }
  else {
    *(void *)(v17 + 16) = v21;
  }
  return result;
}

uint64_t sub_25EA2CFB8(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v7 = type metadata accessor for Storage.ExplicitUpdate();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  unint64_t v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v11 = *(void *)(*v3 + 16);
  unint64_t v12 = *(void *)(*v3 + 24);
  unint64_t v26 = v3;
  if (v12 <= v11 || (a3 & 1) == 0)
  {
    if (a3)
    {
      sub_25EA2C82C();
    }
    else
    {
      if (v12 > v11)
      {
        uint64_t v13 = v8;
        sub_25E9F86B4();
        goto LABEL_19;
      }
      sub_25EA2D6FC();
    }
    uint64_t v14 = *v3;
    sub_25EA36530();
    sub_25EA35ED0();
    sub_25EA27484(&qword_26A727660, MEMORY[0x263F07508]);
    sub_25EA360F0();
    uint64_t v15 = (void *)(a1 + *(int *)(v7 + 20));
    swift_bridgeObjectRetain();
    sub_25EA36140();
    swift_bridgeObjectRelease();
    uint64_t v16 = sub_25EA36560();
    uint64_t v17 = -1 << *(unsigned char *)(v14 + 32);
    a2 = v16 & ~v17;
    if ((*(void *)(v14 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
    {
      uint64_t v18 = ~v17;
      uint64_t v13 = v8;
      uint64_t v8 = *(void *)(v8 + 72);
      while (1)
      {
        sub_25EA2DE3C(*(void *)(v14 + 48) + v8 * a2, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for Storage.ExplicitUpdate);
        if (_s9TeaBreeze17ScopeGraphElementV2IDV2eeoiySbAE_AEtFZ_0())
        {
          uint64_t v19 = &v10[*(int *)(v7 + 20)];
          BOOL v20 = *(void *)v19 == *v15 && *((void *)v19 + 1) == v15[1];
          if (v20 || (sub_25EA364B0() & 1) != 0) {
            break;
          }
        }
        sub_25EA2DEA4((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for Storage.ExplicitUpdate);
        a2 = (a2 + 1) & v18;
        if (((*(void *)(v14 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          goto LABEL_19;
        }
      }
      sub_25EA2DEA4((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for Storage.ExplicitUpdate);
      sub_25EA364C0();
      __break(1u);
    }
  }
  uint64_t v13 = v8;
LABEL_19:
  uint64_t v21 = *v26;
  *(void *)(*v26 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = sub_25EA2DFE4(a1, *(void *)(v21 + 48) + *(void *)(v13 + 72) * a2, (uint64_t (*)(void))type metadata accessor for Storage.ExplicitUpdate);
  uint64_t v23 = *(void *)(v21 + 16);
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (v24) {
    __break(1u);
  }
  else {
    *(void *)(v21 + 16) = v25;
  }
  return result;
}

uint64_t sub_25EA2D2B0()
{
  unint64_t v1 = v0;
  sub_25EA2E1A8(0, &qword_26A7276B8, type metadata accessor for ScopeGraphElement.ID, (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for Edge);
  uint64_t v34 = *(void *)(v2 - 8);
  uint64_t v35 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v29 - v3;
  uint64_t v5 = *v0;
  sub_25E9F9358();
  uint64_t v6 = sub_25EA36350();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *unint64_t v1 = v7;
    return result;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v9 = *(void *)(v5 + 56);
  uint64_t v30 = v0;
  uint64_t v31 = v5 + 56;
  if (v8 < 64) {
    uint64_t v10 = ~(-1 << v8);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & v9;
  int64_t v32 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 56;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  for (i = v5; ; uint64_t v5 = i)
  {
    if (v11)
    {
      unint64_t v16 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v17 = v16 | (v14 << 6);
      goto LABEL_24;
    }
    int64_t v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v18 >= v32) {
      goto LABEL_33;
    }
    unint64_t v19 = *(void *)(v31 + 8 * v18);
    ++v14;
    if (!v19)
    {
      int64_t v14 = v18 + 1;
      if (v18 + 1 >= v32) {
        goto LABEL_33;
      }
      unint64_t v19 = *(void *)(v31 + 8 * v14);
      if (!v19)
      {
        int64_t v14 = v18 + 2;
        if (v18 + 2 >= v32) {
          goto LABEL_33;
        }
        unint64_t v19 = *(void *)(v31 + 8 * v14);
        if (!v19) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v11 = (v19 - 1) & v19;
    unint64_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
LABEL_24:
    uint64_t v21 = *(void *)(v34 + 72);
    sub_25EA2DF04(*(void *)(v5 + 48) + v21 * v17, (uint64_t)v4, &qword_26A7276B8, type metadata accessor for ScopeGraphElement.ID, (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for Edge);
    sub_25EA36530();
    sub_25EA35ED0();
    sub_25EA27484(&qword_26A727660, MEMORY[0x263F07508]);
    sub_25EA360F0();
    sub_25EA360F0();
    uint64_t result = sub_25EA36560();
    uint64_t v22 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v12 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v15 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    uint64_t result = sub_25EA2DF74((uint64_t)v4, *(void *)(v7 + 48) + v15 * v21, &qword_26A7276B8, type metadata accessor for ScopeGraphElement.ID, (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for Edge);
    ++*(void *)(v7 + 16);
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v32)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    unint64_t v1 = v30;
    goto LABEL_35;
  }
  unint64_t v19 = *(void *)(v31 + 8 * v20);
  if (v19)
  {
    int64_t v14 = v20;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v14 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v14 >= v32) {
      goto LABEL_33;
    }
    unint64_t v19 = *(void *)(v31 + 8 * v14);
    ++v20;
    if (v19) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_25EA2D6FC()
{
  unint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Storage.ExplicitUpdate();
  uint64_t v32 = *(void *)(v2 - 8);
  uint64_t v33 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *v0;
  sub_25E9FA2EC();
  uint64_t v6 = sub_25EA36350();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *unint64_t v1 = v7;
    return result;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v9 = *(void *)(v5 + 56);
  uint64_t v29 = v0;
  uint64_t v30 = v5 + 56;
  if (v8 < 64) {
    uint64_t v10 = ~(-1 << v8);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & v9;
  int64_t v31 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 56;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v16 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v17 = v16 | (v14 << 6);
      goto LABEL_24;
    }
    int64_t v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v18 >= v31) {
      goto LABEL_33;
    }
    unint64_t v19 = *(void *)(v30 + 8 * v18);
    ++v14;
    if (!v19)
    {
      int64_t v14 = v18 + 1;
      if (v18 + 1 >= v31) {
        goto LABEL_33;
      }
      unint64_t v19 = *(void *)(v30 + 8 * v14);
      if (!v19)
      {
        int64_t v14 = v18 + 2;
        if (v18 + 2 >= v31) {
          goto LABEL_33;
        }
        unint64_t v19 = *(void *)(v30 + 8 * v14);
        if (!v19) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v11 = (v19 - 1) & v19;
    unint64_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
LABEL_24:
    uint64_t v21 = *(void *)(v32 + 72);
    sub_25EA2DE3C(*(void *)(v5 + 48) + v21 * v17, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for Storage.ExplicitUpdate);
    sub_25EA36530();
    sub_25EA35ED0();
    sub_25EA27484(&qword_26A727660, MEMORY[0x263F07508]);
    sub_25EA360F0();
    swift_bridgeObjectRetain();
    sub_25EA36140();
    swift_bridgeObjectRelease();
    uint64_t result = sub_25EA36560();
    uint64_t v22 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v12 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v15 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    uint64_t result = sub_25EA2DFE4((uint64_t)v4, *(void *)(v7 + 48) + v15 * v21, (uint64_t (*)(void))type metadata accessor for Storage.ExplicitUpdate);
    ++*(void *)(v7 + 16);
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v31)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    unint64_t v1 = v29;
    goto LABEL_35;
  }
  unint64_t v19 = *(void *)(v30 + 8 * v20);
  if (v19)
  {
    int64_t v14 = v20;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v14 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v14 >= v31) {
      goto LABEL_33;
    }
    unint64_t v19 = *(void *)(v30 + 8 * v14);
    ++v20;
    if (v19) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_25EA2DADC(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v7 = sub_25EA2E228();
  if (!v8) {
    goto LABEL_24;
  }
  uint64_t v11 = v7;
  uint64_t v12 = v8;
  uint64_t v13 = v9;
  uint64_t v14 = v10;
  unint64_t v15 = (void *)*a5;
  unint64_t v17 = sub_25EA06630(v9);
  uint64_t v18 = v15[2];
  BOOL v19 = (v16 & 1) == 0;
  uint64_t v20 = v18 + v19;
  if (__OFADD__(v18, v19))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  char v21 = v16;
  if (v15[3] >= v20)
  {
    if (a4)
    {
      unint64_t v24 = (void *)*a5;
      if (v16) {
        goto LABEL_9;
      }
    }
    else
    {
      sub_25EA03A8C();
      unint64_t v24 = (void *)*a5;
      if (v21) {
        goto LABEL_9;
      }
    }
LABEL_11:
    v24[(v17 >> 6) + 8] |= 1 << v17;
    unint64_t v26 = (uint64_t *)(v24[6] + 24 * v17);
    *unint64_t v26 = v11;
    v26[1] = v12;
    v26[2] = v13;
    *(void *)(v24[7] + 8 * v17) = v14;
    uint64_t v27 = v24[2];
    BOOL v28 = __OFADD__(v27, 1);
    uint64_t v29 = v27 + 1;
    if (v28)
    {
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
    void v24[2] = v29;
LABEL_13:
    uint64_t v30 = sub_25EA2E228();
    if (v31)
    {
      uint64_t v34 = v30;
      uint64_t v35 = v31;
      uint64_t v36 = v32;
      uint64_t v37 = v33;
      do
      {
        uint64_t v42 = (void *)*a5;
        unint64_t v44 = sub_25EA06630(v36);
        uint64_t v45 = v42[2];
        BOOL v46 = (v43 & 1) == 0;
        uint64_t v47 = v45 + v46;
        if (__OFADD__(v45, v46)) {
          goto LABEL_25;
        }
        char v48 = v43;
        if (v42[3] < v47)
        {
          sub_25EA0A4EC(v47, 1);
          unint64_t v49 = sub_25EA06630(v36);
          if ((v48 & 1) != (v50 & 1)) {
            goto LABEL_27;
          }
          unint64_t v44 = v49;
        }
        int v51 = (void *)*a5;
        if (v48)
        {
          swift_bridgeObjectRelease();
          uint64_t v38 = v51[7];
          swift_bridgeObjectRelease();
          *(void *)(v38 + 8 * v44) = v37;
        }
        else
        {
          v51[(v44 >> 6) + 8] |= 1 << v44;
          uint64_t v52 = (uint64_t *)(v51[6] + 24 * v44);
          uint64_t *v52 = v34;
          v52[1] = v35;
          void v52[2] = v36;
          *(void *)(v51[7] + 8 * v44) = v37;
          uint64_t v53 = v51[2];
          BOOL v28 = __OFADD__(v53, 1);
          uint64_t v54 = v53 + 1;
          if (v28) {
            goto LABEL_26;
          }
          v51[2] = v54;
        }
        uint64_t v34 = sub_25EA2E228();
        uint64_t v35 = v39;
        uint64_t v36 = v40;
        uint64_t v37 = v41;
      }
      while (v39);
    }
LABEL_24:
    swift_release();
    swift_bridgeObjectRelease();
    sub_25EA2E3E0();
    return swift_release();
  }
  sub_25EA0A4EC(v20, a4 & 1);
  unint64_t v22 = sub_25EA06630(v13);
  if ((v21 & 1) == (v23 & 1))
  {
    unint64_t v17 = v22;
    unint64_t v24 = (void *)*a5;
    if ((v21 & 1) == 0) {
      goto LABEL_11;
    }
LABEL_9:
    swift_bridgeObjectRelease();
    uint64_t v25 = v24[7];
    swift_bridgeObjectRelease();
    *(void *)(v25 + 8 * v17) = v14;
    goto LABEL_13;
  }
LABEL_27:
  uint64_t result = sub_25EA364D0();
  __break(1u);
  return result;
}

uint64_t sub_25EA2DDE0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  sub_25EA2E1A8(0, a2, a3, a4);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  return a1;
}

uint64_t sub_25EA2DE3C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25EA2DEA4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25EA2DF04(uint64_t a1, uint64_t a2, unint64_t *a3, uint64_t (*a4)(uint64_t), uint64_t (*a5)(uint64_t, uint64_t))
{
  sub_25EA2E1A8(0, a3, a4, a5);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(a2, a1, v7);
  return a2;
}

uint64_t sub_25EA2DF74(uint64_t a1, uint64_t a2, unint64_t *a3, uint64_t (*a4)(uint64_t), uint64_t (*a5)(uint64_t, uint64_t))
{
  sub_25EA2E1A8(0, a3, a4, a5);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(a2, a1, v7);
  return a2;
}

uint64_t sub_25EA2DFE4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_25EA2E04C(unint64_t a1)
{
  return sub_25EA08524(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t sub_25EA2E060@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_25EA2A928(a1, v2[6], v2[7], v2[8], v2[2], v2[3], v2[5], a2);
}

unint64_t sub_25EA2E074()
{
  unint64_t result = qword_26A728710;
  if (!qword_26A728710)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A728710);
  }
  return result;
}

unint64_t sub_25EA2E0C8()
{
  unint64_t result = qword_26A728718;
  if (!qword_26A728718)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_26A728718);
  }
  return result;
}

uint64_t sub_25EA2E120@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *(void *)(a1 + 24);
  *(void *)a2 = *(void *)a1;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(a1 + 8);
  *(void *)(a2 + 24) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_25EA2E170(uint64_t a1)
{
  return sub_25EA2B0A8(a1, v1[6], v1[7], v1[8], v1[9], v1[10], v1[2], v1[3], v1[4]);
}

void sub_25EA2E1A8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_25EA2E20C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_25EA25A88(a1, *(void **)(v2 + 32), *(void *)(v2 + 16), a2);
}

uint64_t sub_25EA2E218(uint64_t a1)
{
  return sub_25EA25D5C(a1, v1[4], v1[5], v1[6], v1[2]);
}

uint64_t sub_25EA2E228()
{
  void (*v9)(uint64_t *__return_ptr, uint64_t *);
  long long v10;
  uint64_t result;
  int64_t v12;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  int64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  long long v20;
  uint64_t v21;

  uint64_t v1 = *v0;
  int64_t v3 = v0[3];
  unint64_t v2 = v0[4];
  int64_t v4 = v3;
  if (v2)
  {
    uint64_t v5 = (v2 - 1) & v2;
    unint64_t v6 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_3:
    uint64_t v7 = *(void *)(v1 + 48) + 24 * v6;
    uint64_t v8 = *(void *)(*(void *)(v1 + 56) + 8 * v6);
    uint64_t v9 = (void (*)(uint64_t *__return_ptr, uint64_t *))v0[5];
    BOOL v19 = *(void *)v7;
    uint64_t v10 = *(_OWORD *)(v7 + 8);
    v0[3] = v4;
    v0[4] = v5;
    uint64_t v20 = v10;
    char v21 = v8;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v9(&v18, &v19);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v18;
  }
  uint64_t v12 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
  }
  else
  {
    uint64_t v13 = (unint64_t)(v0[2] + 64) >> 6;
    if (v12 < v13)
    {
      uint64_t v14 = v0[1];
      unint64_t v15 = *(void *)(v14 + 8 * v12);
      if (v15)
      {
LABEL_7:
        uint64_t v5 = (v15 - 1) & v15;
        unint64_t v6 = __clz(__rbit64(v15)) + (v12 << 6);
        int64_t v4 = v12;
        goto LABEL_3;
      }
      char v16 = v3 + 2;
      int64_t v4 = v3 + 1;
      if (v3 + 2 < v13)
      {
        unint64_t v15 = *(void *)(v14 + 8 * v16);
        if (v15)
        {
LABEL_10:
          uint64_t v12 = v16;
          goto LABEL_7;
        }
        int64_t v4 = v3 + 2;
        if (v3 + 3 < v13)
        {
          unint64_t v15 = *(void *)(v14 + 8 * (v3 + 3));
          if (v15)
          {
            uint64_t v12 = v3 + 3;
            goto LABEL_7;
          }
          char v16 = v3 + 4;
          int64_t v4 = v3 + 3;
          if (v3 + 4 < v13)
          {
            unint64_t v15 = *(void *)(v14 + 8 * v16);
            if (v15) {
              goto LABEL_10;
            }
            uint64_t v12 = v3 + 5;
            int64_t v4 = v3 + 4;
            if (v3 + 5 < v13)
            {
              unint64_t v15 = *(void *)(v14 + 8 * v12);
              if (v15) {
                goto LABEL_7;
              }
              int64_t v4 = v13 - 1;
              unint64_t v17 = v3 + 6;
              while (v13 != v17)
              {
                unint64_t v15 = *(void *)(v14 + 8 * v17++);
                if (v15)
                {
                  uint64_t v12 = v17 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }
    unint64_t result = 0;
    v0[3] = v4;
    v0[4] = 0;
  }
  return result;
}

uint64_t sub_25EA2E3E0()
{
  return swift_release();
}

uint64_t sub_25EA2E3E8()
{
  return (*(uint64_t (**)(void))(v0 + 40))();
}

uint64_t sub_25EA2E410()
{
  return (*(uint64_t (**)(void))(v0 + 32))();
}

ValueMetadata *type metadata accessor for GraphUpdateRequirements()
{
  return &type metadata for GraphUpdateRequirements;
}

unint64_t sub_25EA2E44C()
{
  unint64_t result = qword_26A728720;
  if (!qword_26A728720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A728720);
  }
  return result;
}

unint64_t sub_25EA2E4A4()
{
  unint64_t result = qword_26A728728;
  if (!qword_26A728728)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A728728);
  }
  return result;
}

unint64_t sub_25EA2E4FC()
{
  unint64_t result = qword_26A728730;
  if (!qword_26A728730)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A728730);
  }
  return result;
}

unint64_t sub_25EA2E554()
{
  unint64_t result = qword_26A728738[0];
  if (!qword_26A728738[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A728738);
  }
  return result;
}

uint64_t sub_25EA2E5A8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t result = 0;
  int64_t v4 = (uint64_t *)(a1 + 32);
  do
  {
    uint64_t v6 = *v4++;
    uint64_t v5 = v6;
    if ((v6 & ~result) == 0) {
      uint64_t v5 = 0;
    }
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

uint64_t sub_25EA2E5E4()
{
  return swift_initClassMetadata2();
}

uint64_t sub_25EA2E620()
{
  uint64_t v0 = sub_25EA07364();
  uint64_t v1 = *(unsigned int *)(*v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t type metadata accessor for SourceVertex()
{
  return sub_25E9ED2B4();
}

void *sub_25EA2E690(uint64_t a1)
{
  return sub_25EA07B80(a1);
}

uint64_t sub_25EA2E6D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  sub_25E9FD284(a1, a4);
  uint64_t v7 = a4 + *(int *)(type metadata accessor for VertexUpdate() + 44);
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 - 8) + 32);
  return v8(v7, a2, a3);
}

uint64_t sub_25EA2E774(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = 0;
  unint64_t v9 = 0xE000000000000000;
  sub_25EA36370();
  swift_bridgeObjectRelease();
  uint64_t v8 = 0x3D786574726556;
  unint64_t v9 = 0xE700000000000000;
  _s9TeaBreeze17ScopeGraphElementV2IDV11descriptionSSvg_0();
  sub_25EA36150();
  swift_bridgeObjectRelease();
  sub_25EA36150();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v1 + *(int *)(a1 + 44), v3);
  sub_25EA36130();
  sub_25EA36150();
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_25EA2E8D8(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = a1[9];
  uint64_t v19 = *a1;
  long long v8 = *(_OWORD *)(a1 + 3);
  long long v20 = *(_OWORD *)(a1 + 1);
  long long v21 = v8;
  long long v22 = *(_OWORD *)(a1 + 5);
  long long v23 = *(_OWORD *)(a1 + 7);
  uint64_t v24 = v7;
  sub_25E9F01A0(v3, (uint64_t)v25);
  sub_25EA2EAB8((uint64_t)v25, (uint64_t)v14);
  if (v15)
  {
    sub_25E9FD1DC();
    uint64_t v10 = *(void *)(a3 + 16);
    uint64_t v9 = *(void *)(a3 + 24);
    swift_getAssociatedTypeWitness();
    swift_getExtendedExistentialTypeMetadata_unique();
    if (swift_dynamicCast())
    {
      if (*((void *)&v17 + 1))
      {
        sub_25E9F9FD0(&v16, (uint64_t)&v19);
        long long v11 = v21;
        sub_25E9EFC30(&v19, v21);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, void, void))(*((void *)&v11 + 1) + 88))(v4 + *(int *)(a3 + 44), a2, v10, v9, v11, *((void *)&v11 + 1));
        sub_25E9FD128((uint64_t)v25);
        uint64_t v12 = (long long *)&v19;
        return sub_25E9EF02C((uint64_t)v12);
      }
    }
    else
    {
      uint64_t v18 = 0;
      long long v16 = 0u;
      long long v17 = 0u;
    }
  }
  else
  {
    sub_25E9FD128((uint64_t)v14);
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v18 = 0;
  }
  uint64_t result = sub_25E9FD128((uint64_t)v25);
  if (!*((void *)&v17 + 1)) {
    return result;
  }
  uint64_t v12 = &v16;
  return sub_25E9EF02C((uint64_t)v12);
}

uint64_t sub_25EA2EAA0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_25EA2E8D8(a1, a2, a3);
}

uint64_t sub_25EA2EAB8(uint64_t a1, uint64_t a2)
{
  sub_25E9FD184();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for VertexUpdate()
{
  return sub_25E9ED2B4();
}

uint64_t sub_25EA2EB34()
{
  uint64_t result = sub_25EA35ED0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_25EA2EC00(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = sub_25EA35ED0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v9 = *(void *)(a3 + 16);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(_DWORD *)(v10 + 80);
  uint64_t v12 = v8 + v11;
  unint64_t v13 = ((v8 + v11) & ~v11) + *(void *)(v10 + 64);
  uint64_t v14 = (*(unsigned char *)(v7 + 80) | *(unsigned char *)(v10 + 80));
  if (v14 > 7 || ((*(_DWORD *)(v7 + 80) | *(_DWORD *)(v10 + 80)) & 0x100000) != 0 || v13 > 0x18)
  {
    uint64_t v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + ((v14 + 16) & ~v14));
    swift_retain();
  }
  else
  {
    uint64_t v18 = ~v11;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v10 + 16))(((unint64_t)a1 + v12) & v18, ((unint64_t)a2 + v12) & v18, v9);
  }
  return a1;
}

uint64_t sub_25EA2ED64(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25EA35ED0();
  uint64_t v5 = *(void *)(v4 - 8) + 8;
  (*(void (**)(uint64_t, uint64_t))v5)(a1, v4);
  uint64_t v6 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v7 = *(uint64_t (**)(unint64_t))(v6 + 8);
  unint64_t v8 = (*(void *)(v5 + 56) + a1 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  return v7(v8);
}

uint64_t sub_25EA2EE14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25EA35ED0();
  uint64_t v7 = *(void *)(v6 - 8) + 16;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v7)(a1, a2, v6);
  uint64_t v8 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v8 + 16))((*(void *)(v7 + 48) + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (*(void *)(v7 + 48) + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
  return a1;
}

uint64_t sub_25EA2EECC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25EA35ED0();
  uint64_t v7 = *(void *)(v6 - 8) + 24;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v7)(a1, a2, v6);
  uint64_t v8 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v8 + 24))((*(void *)(v7 + 40) + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (*(void *)(v7 + 40) + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
  return a1;
}

uint64_t sub_25EA2EF84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25EA35ED0();
  uint64_t v7 = *(void *)(v6 - 8) + 32;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v7)(a1, a2, v6);
  uint64_t v8 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v8 + 32))((*(void *)(v7 + 32) + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (*(void *)(v7 + 32) + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
  return a1;
}

uint64_t sub_25EA2F03C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25EA35ED0();
  uint64_t v7 = *(void *)(v6 - 8) + 40;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v7)(a1, a2, v6);
  uint64_t v8 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v8 + 40))((*(void *)(v7 + 24) + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (*(void *)(v7 + 24) + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
  return a1;
}

uint64_t sub_25EA2F0F4(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6 = sub_25EA35ED0();
  uint64_t v7 = *(void *)(v6 - 8);
  unsigned int v8 = *(_DWORD *)(v7 + 84);
  uint64_t v9 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v10 = *(unsigned int *)(v9 + 84);
  uint64_t v11 = *(unsigned __int8 *)(v9 + 80);
  if (v10 <= v8) {
    unsigned int v12 = *(_DWORD *)(v7 + 84);
  }
  else {
    unsigned int v12 = *(_DWORD *)(v9 + 84);
  }
  if (!a2) {
    return 0;
  }
  uint64_t v13 = *(void *)(*(void *)(v6 - 8) + 64) + v11;
  if (a2 <= v12) {
    goto LABEL_24;
  }
  uint64_t v14 = (v13 & ~v11) + *(void *)(v9 + 64);
  char v15 = 8 * v14;
  if (v14 <= 3)
  {
    unsigned int v17 = ((a2 - v12 + ~(-1 << v15)) >> v15) + 1;
    if (HIWORD(v17))
    {
      int v16 = *(_DWORD *)((char *)a1 + v14);
      if (!v16) {
        goto LABEL_24;
      }
      goto LABEL_14;
    }
    if (v17 > 0xFF)
    {
      int v16 = *(unsigned __int16 *)((char *)a1 + v14);
      if (!*(unsigned __int16 *)((char *)a1 + v14)) {
        goto LABEL_24;
      }
      goto LABEL_14;
    }
    if (v17 < 2)
    {
LABEL_24:
      if (v12)
      {
        if (v8 >= v10)
        {
          long long v23 = *(uint64_t (**)(unsigned __int16 *))(v7 + 48);
          return v23(a1);
        }
        else
        {
          long long v21 = *(uint64_t (**)(unint64_t, uint64_t))(v9 + 48);
          return v21(((unint64_t)a1 + v13) & ~v11, v10);
        }
      }
      return 0;
    }
  }
  int v16 = *((unsigned __int8 *)a1 + v14);
  if (!*((unsigned char *)a1 + v14)) {
    goto LABEL_24;
  }
LABEL_14:
  int v18 = (v16 - 1) << v15;
  if (v14 > 3) {
    int v18 = 0;
  }
  if (v14)
  {
    if (v14 <= 3) {
      int v19 = (v13 & ~v11) + *(_DWORD *)(v9 + 64);
    }
    else {
      int v19 = 4;
    }
    switch(v19)
    {
      case 2:
        int v20 = *a1;
        break;
      case 3:
        int v20 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        int v20 = *(_DWORD *)a1;
        break;
      default:
        int v20 = *(unsigned __int8 *)a1;
        break;
    }
  }
  else
  {
    int v20 = 0;
  }
  return v12 + (v20 | v18) + 1;
}

void sub_25EA2F354(unsigned char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v8 = *(void *)(sub_25EA35ED0() - 8);
  unsigned int v9 = *(_DWORD *)(v8 + 84);
  uint64_t v10 = *(void *)(*(void *)(a4 + 16) - 8);
  uint64_t v11 = *(unsigned int *)(v10 + 84);
  size_t v12 = *(void *)(v8 + 64);
  uint64_t v13 = *(unsigned __int8 *)(v10 + 80);
  if (v11 <= v9) {
    unsigned int v14 = *(_DWORD *)(v8 + 84);
  }
  else {
    unsigned int v14 = *(_DWORD *)(v10 + 84);
  }
  size_t v15 = ((v12 + v13) & ~v13) + *(void *)(v10 + 64);
  if (a3 <= v14)
  {
    int v16 = 0;
  }
  else if (v15 <= 3)
  {
    unsigned int v19 = ((a3 - v14 + ~(-1 << (8 * v15))) >> (8 * v15)) + 1;
    if (HIWORD(v19))
    {
      int v16 = 4;
    }
    else if (v19 >= 0x100)
    {
      int v16 = 2;
    }
    else
    {
      int v16 = v19 > 1;
    }
  }
  else
  {
    int v16 = 1;
  }
  if (v14 < a2)
  {
    unsigned int v17 = ~v14 + a2;
    if (v15 < 4)
    {
      int v18 = (v17 >> (8 * v15)) + 1;
      if (v15)
      {
        int v20 = v17 & ~(-1 << (8 * v15));
        bzero(a1, v15);
        if (v15 == 3)
        {
          *(_WORD *)a1 = v20;
          a1[2] = BYTE2(v20);
        }
        else if (v15 == 2)
        {
          *(_WORD *)a1 = v20;
        }
        else
        {
          *a1 = v20;
        }
      }
    }
    else
    {
      bzero(a1, v15);
      *(_DWORD *)a1 = v17;
      int v18 = 1;
    }
    switch(v16)
    {
      case 1:
        a1[v15] = v18;
        return;
      case 2:
        *(_WORD *)&a1[v15] = v18;
        return;
      case 3:
        goto LABEL_54;
      case 4:
        *(_DWORD *)&a1[v15] = v18;
        return;
      default:
        return;
    }
  }
  switch(v16)
  {
    case 1:
      a1[v15] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 2:
      *(_WORD *)&a1[v15] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 3:
LABEL_54:
      __break(1u);
      JUMPOUT(0x25EA2F6C0);
    case 4:
      *(_DWORD *)&a1[v15] = 0;
      goto LABEL_23;
    default:
LABEL_23:
      if (a2)
      {
LABEL_24:
        if (v9 >= v11)
        {
          if (v9 >= a2)
          {
            uint64_t v25 = *(void (**)(unsigned char *, uint64_t))(v8 + 56);
            v25(a1, a2);
          }
          else
          {
            if (v12 <= 3) {
              int v22 = ~(-1 << (8 * v12));
            }
            else {
              int v22 = -1;
            }
            if (v12)
            {
              int v23 = v22 & (~v9 + a2);
              if (v12 <= 3) {
                int v24 = v12;
              }
              else {
                int v24 = 4;
              }
              bzero(a1, v12);
              switch(v24)
              {
                case 2:
                  *(_WORD *)a1 = v23;
                  break;
                case 3:
                  *(_WORD *)a1 = v23;
                  a1[2] = BYTE2(v23);
                  break;
                case 4:
                  *(_DWORD *)a1 = v23;
                  break;
                default:
                  *a1 = v23;
                  break;
              }
            }
          }
        }
        else
        {
          long long v21 = *(void (**)(unint64_t, uint64_t, uint64_t))(v10 + 56);
          v21((unint64_t)&a1[v12 + v13] & ~v13, a2, v11);
        }
      }
      return;
  }
}

uint64_t DependencyDisambiguation<>.stringValue.getter()
{
  sub_25EA36190();
  return v1;
}

uint64_t dispatch thunk of DependencyDisambiguation.stringValue.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of static DependencyDisambiguation.disambiguate(using:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t sub_25EA2F748(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v29 = a5;
  uint64_t v30 = a8;
  uint64_t v10 = v9;
  uint64_t v38 = a1;
  uint64_t v39 = a2;
  uint64_t v28 = *(void *)(a5 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v40 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v36 = *(void (***)(char *, uint64_t))(AssociatedTypeWitness - 8);
  uint64_t v13 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  size_t v15 = (char *)&v26 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v33 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = swift_getAssociatedTypeWitness();
  uint64_t v31 = *(void *)(v17 - 8);
  uint64_t v32 = v17;
  MEMORY[0x270FA5388](v17);
  unsigned int v19 = (char *)&v26 - v18;
  uint64_t v34 = v8;
  uint64_t v20 = sub_25EA36280();
  if (!v20) {
    return sub_25EA361B0();
  }
  uint64_t v21 = v20;
  uint64_t v27 = v15;
  uint64_t v43 = sub_25EA36070();
  uint64_t v35 = sub_25EA363F0();
  sub_25EA363C0();
  uint64_t v41 = v19;
  uint64_t result = sub_25EA36270();
  if (v21 < 0)
  {
    __break(1u);
  }
  else
  {
    int v23 = (void (**)(char *))(v36 + 2);
    ++v36;
    uint64_t v37 = v23;
    int v24 = v27;
    while (1)
    {
      uint64_t v25 = (void (*)(char *, void))sub_25EA362A0();
      (*v37)(v24);
      v25(v42, 0);
      v38(v24, v40);
      if (v10) {
        break;
      }
      uint64_t v10 = 0;
      (*v36)(v24, AssociatedTypeWitness);
      sub_25EA363D0();
      sub_25EA36290();
      if (!--v21)
      {
        (*(void (**)(char *, uint64_t))(v31 + 8))(v41, v32);
        return v43;
      }
    }
    (*v36)(v24, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v31 + 8))(v41, v32);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v28 + 32))(v30, v40, v29);
  }
  return result;
}

uint64_t sub_25EA2FB44()
{
  swift_getAssociatedTypeWitness();
  type metadata accessor for Vertex();
  swift_getAssociatedConformanceWitness();
  swift_getWitnessTable();
  if ((sub_25EA360E0() & 1) != 0
    && (type metadata accessor for Graph(), swift_getWitnessTable(), (sub_25EA360E0() & 1) != 0))
  {
    char v0 = sub_25EA302B0();
  }
  else
  {
    char v0 = 0;
  }
  return v0 & 1;
}

uint64_t sub_25EA2FCD4()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_25EA2FE84()
{
  return sub_25EA36560();
}

uint64_t sub_25EA2FF14()
{
  return sub_25EA2FB44() & 1;
}

uint64_t sub_25EA2FF64()
{
  return sub_25EA2FE84();
}

uint64_t sub_25EA2FF7C()
{
  return sub_25EA2FCD4();
}

uint64_t sub_25EA2FF94()
{
  return sub_25EA36560();
}

uint64_t sub_25EA2FFF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_getAssociatedTypeWitness();
  type metadata accessor for Edge();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  swift_getWitnessTable();
  sub_25EA36260();
  v13[10] = a3;
  v13[11] = a4;
  sub_25EA360B0();
  swift_bridgeObjectRetain();
  swift_getWitnessTable();
  swift_getWitnessTable();
  uint64_t v6 = sub_25EA36180();
  swift_bridgeObjectRelease();
  uint64_t v14 = v6;
  v13[6] = a3;
  v13[7] = a4;
  void v13[2] = a3;
  void v13[3] = a4;
  v13[4] = swift_getKeyPath();
  uint64_t v7 = sub_25EA36200();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v10 = sub_25EA2F748((void (*)(char *, char *))sub_25EA30A90, (uint64_t)v13, v7, MEMORY[0x263F8D310], MEMORY[0x263F8E628], WitnessTable, MEMORY[0x263F8E658], v9);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v14 = v10;
  sub_25E9FADA4();
  sub_25EA309FC();
  uint64_t v11 = sub_25EA36110();
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_25EA30258@<X0>(uint64_t *a1@<X8>)
{
  swift_getAssociatedTypeWitness();
  uint64_t v2 = type metadata accessor for Edge();
  uint64_t result = sub_25E9ED638(v2);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_25EA302B0()
{
  swift_getAssociatedTypeWitness();
  type metadata accessor for Edge();
  swift_getAssociatedConformanceWitness();
  swift_getWitnessTable();
  sub_25EA36260();
  swift_getWitnessTable();
  if (sub_25EA360E0()) {
    char v0 = sub_25EA360E0();
  }
  else {
    char v0 = 0;
  }
  return v0 & 1;
}

uint64_t sub_25EA30404()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_25EA3055C()
{
  return sub_25EA36560();
}

uint64_t sub_25EA305D4(uint64_t a1)
{
  return sub_25EA2FFF0(*v1, v1[1], *(void *)(a1 + 16), *(void *)(a1 + 24));
}

uint64_t sub_25EA305E4()
{
  return sub_25EA302B0();
}

uint64_t sub_25EA30604()
{
  return sub_25EA3055C();
}

uint64_t sub_25EA30618()
{
  return sub_25EA30404();
}

uint64_t sub_25EA3062C()
{
  return sub_25EA36560();
}

uint64_t sub_25EA30684(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  swift_getAssociatedTypeWitness();
  type metadata accessor for Vertex();
  swift_getAssociatedConformanceWitness();
  uint64_t v17 = a1;
  v16[2] = a5;
  v16[3] = a6;
  uint64_t v11 = sub_25EA360B0();
  swift_bridgeObjectRetain();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v14 = sub_25EA2F748((void (*)(char *, char *))sub_25EA309DC, (uint64_t)v16, v11, MEMORY[0x263F8D310], MEMORY[0x263F8E628], WitnessTable, MEMORY[0x263F8E658], v13);
  swift_bridgeObjectRelease();
  uint64_t v17 = v14;
  sub_25E9FADA4();
  sub_25EA309FC();
  sub_25EA36110();
  swift_bridgeObjectRelease();
  uint64_t v17 = 0;
  unint64_t v18 = 0xE000000000000000;
  sub_25EA36370();
  swift_bridgeObjectRelease();
  uint64_t v17 = 0x7365636974726556;
  unint64_t v18 = 0xEB000000000A5B3DLL;
  sub_25EA36150();
  swift_bridgeObjectRelease();
  sub_25EA36150();
  sub_25EA2FFF0(a3, a4, a5, a6);
  sub_25EA36150();
  swift_bridgeObjectRelease();
  sub_25EA36150();
  return v17;
}

uint64_t sub_25EA308B0@<X0>(void *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for Vertex();
  sub_25E9FB450(v2);
  sub_25EA36150();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 9;
  a1[1] = 0xE100000000000000;
  return result;
}

uint64_t sub_25EA30920(uint64_t a1, uint64_t a2)
{
  return sub_25EA30684(*v2, a2, v2[2], v2[3], *(void *)(a1 + 16), *(void *)(a1 + 24));
}

uint64_t sub_25EA30934()
{
  return swift_getWitnessTable();
}

uint64_t sub_25EA3097C()
{
  return swift_getWitnessTable();
}

uint64_t type metadata accessor for Graph()
{
  return sub_25E9ED2B4();
}

uint64_t sub_25EA309DC@<X0>(void *a1@<X8>)
{
  return sub_25EA308B0(a1);
}

unint64_t sub_25EA309FC()
{
  unint64_t result = qword_26A727768;
  if (!qword_26A727768)
  {
    sub_25E9FADA4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A727768);
  }
  return result;
}

uint64_t sub_25EA30A54@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_bridgeObjectRetain();
}

uint64_t sub_25EA30A78()
{
  return 16;
}

__n128 sub_25EA30A84(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_25EA30A90()
{
  return swift_getAtKeyPath();
}

uint64_t type metadata accessor for Graph.EdgeList()
{
  return sub_25E9ED2B4();
}

uint64_t sub_25EA30AD4()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *sub_25EA30B20(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_25EA30B78(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *sub_25EA30C08(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t Dependency.init(_:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = *(void *)(*MEMORY[0x263F8EA20] + *a1 + 8);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v7 = (char *)&v16 - v6;
  uint64_t v8 = type metadata accessor for ScopeReader(0);
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v16 - v12;
  _s9TeaBreeze11ScopeReaderV7currentACyFZ_0((uint64_t)&v16 - v12);
  sub_25EA30E58((uint64_t)v13, (uint64_t)v11);
  a2[3] = type metadata accessor for NonAmbiguousDependencyReader();
  a2[4] = swift_getWitnessTable();
  uint64_t v14 = sub_25E9F9FE8(a2);
  sub_25EA30EBC((uint64_t)v11, (uint64_t)a1, (uint64_t)v14);
  swift_retain();
  sub_25EA18B54();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  swift_release();
  return sub_25EA34BE4((uint64_t)v13, type metadata accessor for ScopeReader);
}

uint64_t sub_25EA30E58(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ScopeReader(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25EA30EBC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_25EA353C4(a1, a3);
  uint64_t result = type metadata accessor for NonAmbiguousDependencyReader();
  *(void *)(a3 + *(int *)(result + 28)) = a2;
  return result;
}

uint64_t type metadata accessor for NonAmbiguousDependencyReader()
{
  return sub_25E9ED2B4();
}

uint64_t Dependency.init<A>(_:_:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  v22[1] = a3;
  uint64_t v7 = *(void *)(*MEMORY[0x263F8EA20] + *a1 + 8);
  uint64_t v24 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](a1);
  int v23 = (char *)v22 - v8;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v22[0] = AssociatedTypeWitness;
  uint64_t v10 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v12 = (char *)v22 - v11;
  uint64_t v13 = type metadata accessor for ScopeReader(0);
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  unint64_t v18 = (char *)v22 - v17;
  _s9TeaBreeze11ScopeReaderV7currentACyFZ_0((uint64_t)v22 - v17);
  sub_25EA30E58((uint64_t)v18, (uint64_t)v16);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a2, AssociatedTypeWitness);
  a4[3] = type metadata accessor for AmbiguousDependencyReader();
  a4[4] = swift_getWitnessTable();
  unsigned int v19 = sub_25E9F9FE8(a4);
  sub_25EA31248((uint64_t)v16, (uint64_t)a1, (uint64_t)v12, (uint64_t)v19);
  swift_retain();
  uint64_t v20 = v23;
  sub_25EA18B54();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v20, v7);
  swift_release();
  (*(void (**)(uint64_t, void))(v10 + 8))(a2, v22[0]);
  return sub_25EA34BE4((uint64_t)v18, type metadata accessor for ScopeReader);
}

uint64_t sub_25EA31248@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  sub_25EA353C4(a1, a4);
  uint64_t v7 = type metadata accessor for AmbiguousDependencyReader();
  *(void *)(a4 + *(int *)(v7 + 36)) = a2;
  uint64_t v8 = a4 + *(int *)(v7 + 40);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 32);
  return v10(v8, a3, AssociatedTypeWitness);
}

uint64_t type metadata accessor for AmbiguousDependencyReader()
{
  return sub_25E9ED2B4();
}

uint64_t Dependency.wrappedValue.getter()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[4];
  sub_25E9EFC30(v0, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v1, v2);
}

uint64_t sub_25EA313BC()
{
  return ScopeReader.value<A>(for:)();
}

uint64_t sub_25EA313CC(uint64_t a1)
{
  uint64_t v2 = *(void **)(v1 + *(int *)(a1 + 36));
  uint64_t v3 = v1 + *(int *)(a1 + 40);
  type metadata accessor for ScopeReader(0);
  return sub_25EA18E1C(v2, v3);
}

uint64_t Dependency.description.getter(uint64_t a1)
{
  sub_25EA36230();
  _OWORD v4[2] = *(void *)(a1 + 16);
  uint64_t v5 = v1;
  return sub_25E9FD490((uint64_t)sub_25EA31578, (uint64_t)v4);
}

uint64_t sub_25EA314B0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = (void *)MEMORY[0x270FA5388](a1);
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  sub_25E9EFC30(v3, v4);
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v4, v5);
  uint64_t result = sub_25EA36130();
  *a2 = result;
  a2[1] = v7;
  return result;
}

uint64_t sub_25EA31578@<X0>(uint64_t *a1@<X8>)
{
  return sub_25EA314B0(*(void *)(v1 + 24), a1);
}

uint64_t sub_25EA3159C(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *sub_25EA315F4(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

uint64_t sub_25EA3161C(uint64_t a1, uint64_t a2)
{
  sub_25E9EF02C(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t sub_25EA31658(uint64_t a1, int a2)
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

uint64_t sub_25EA316A0(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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

uint64_t type metadata accessor for Dependency()
{
  return sub_25E9ED2B4();
}

uint64_t sub_25EA31700()
{
  uint64_t result = type metadata accessor for ScopeReader(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_getAssociatedTypeWitness();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

void *sub_25EA317E8(void *a1, void *a2)
{
  uint64_t v4 = sub_25EA35ED0();
  uint64_t v5 = *(void *)(v4 - 8);
  int v6 = *(_DWORD *)(v5 + 80);
  uint64_t v7 = *(unsigned int *)(v5 + 84);
  uint64_t v60 = v5;
  uint64_t v61 = v4;
  uint64_t v8 = v6;
  size_t v9 = *(void *)(v5 + 64);
  size_t v59 = v9;
  if (!v7) {
    ++v9;
  }
  size_t __n = v9;
  unint64_t v10 = ((*(_DWORD *)(v5 + 80) + 16) & ~(unint64_t)*(_DWORD *)(v5 + 80)) + v9;
  unint64_t v11 = v10 + (v6 | 7);
  unint64_t v12 = ((v10 + 7) & 0xFFFFFFFFFFFFFFF8) + (v11 & ~(v6 | 7)) + 8;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v14 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v15 = *(_DWORD *)(v14 + 80);
  unint64_t v58 = v12;
  unint64_t v16 = ((v15 + v12 + 8) & ~v15) + *(void *)(v14 + 64);
  uint64_t v17 = v6 | 7 | v15;
  int v18 = (*(_DWORD *)(v14 + 80) | v6) & 0x100000;
  uint64_t v19 = *a2;
  *a1 = *a2;
  if (v17 == 7 && v18 == 0 && v16 <= 0x18)
  {
    int v22 = a1;
    uint64_t v54 = AssociatedTypeWitness;
    uint64_t v55 = a2;
    unint64_t v23 = ~(unint64_t)v6;
    uint64_t v24 = ~(v8 | 7);
    uint64_t v25 = (void *)(((unint64_t)v22 + 15) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v26 = (void *)(((unint64_t)a2 + 15) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v25 = *v26;
    uint64_t v27 = ((unint64_t)v25 + v8 + 8) & ~v8;
    uint64_t v28 = (unsigned __int16 *)(((unint64_t)v26 + v8 + 8) & ~v8);
    swift_retain();
    int v56 = v7;
    if (v7)
    {
      int v29 = (*(uint64_t (**)(unsigned __int16 *, uint64_t, uint64_t))(v60 + 48))(v28, v7, v61);
      uint64_t v30 = (unsigned char *)v27;
      size_t v31 = __n;
      if (!v29)
      {
LABEL_30:
        (*(void (**)(unsigned char *, unsigned __int16 *, uint64_t))(v60 + 16))(v30, v28, v61);
        if (!v56) {
          v30[v59] = 0;
        }
LABEL_32:
        uint64_t v35 = ~v15;
        uint64_t v36 = (void *)(((unint64_t)v55 + v11) & v24);
        uint64_t v37 = (void *)(((unint64_t)v22 + v11) & v24);
        *uint64_t v37 = *v36;
        uint64_t v38 = (void *)(((unint64_t)v37 + 15) & 0xFFFFFFFFFFFFFFF8);
        uint64_t v39 = (void *)(((unint64_t)v36 + 15) & 0xFFFFFFFFFFFFFFF8);
        *uint64_t v38 = *v39;
        uint64_t v40 = v8 + 8;
        uint64_t v41 = (unsigned char *)(((unint64_t)v38 + v8 + 8) & v23);
        uint64_t v42 = (unsigned __int16 *)(((unint64_t)v39 + v40) & v23);
        swift_retain();
        if (v56)
        {
          unint64_t v43 = v58;
          uint64_t v44 = v14;
          if (!(*(unsigned int (**)(unsigned __int16 *))(v60 + 48))(v42))
          {
LABEL_50:
            (*(void (**)(unsigned char *, unsigned __int16 *, uint64_t))(v60 + 16))(v41, v42, v61);
            if (!v56) {
              v41[v59] = 0;
            }
            goto LABEL_52;
          }
        }
        else
        {
          unint64_t v43 = v58;
          uint64_t v44 = v14;
          if (!*((unsigned char *)v42 + v59)) {
            goto LABEL_50;
          }
          int v45 = (*((unsigned __int8 *)v42 + v59) - 1) << (8 * v59);
          if (v59 > 3) {
            int v45 = 0;
          }
          if (v59)
          {
            int v46 = v59 <= 3 ? v59 : 4;
            switch(v46)
            {
              case 2:
                int v47 = *v42;
                break;
              case 3:
                int v47 = *v42 | (*((unsigned __int8 *)v42 + 2) << 16);
                break;
              case 4:
                int v47 = *(_DWORD *)v42;
                break;
              default:
                int v47 = *(unsigned __int8 *)v42;
                break;
            }
          }
          else
          {
            int v47 = 0;
          }
          if ((v47 | v45) == 0xFFFFFFFF) {
            goto LABEL_50;
          }
        }
        memcpy(v41, v42, v31);
LABEL_52:
        *(void *)((unint64_t)&v41[v31 + 7] & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v42
                                                                                         + v31
                                                                                         + 7) & 0xFFFFFFFFFFFFFFF8);
        char v48 = (void *)(((unint64_t)v22 + v43 + 7) & 0xFFFFFFFFFFFFFFF8);
        unint64_t v49 = (void *)(((unint64_t)v55 + v43 + 7) & 0xFFFFFFFFFFFFFFF8);
        *char v48 = *v49;
        uint64_t v50 = ((unint64_t)v48 + v15 + 8) & v35;
        uint64_t v51 = ((unint64_t)v49 + v15 + 8) & v35;
        uint64_t v52 = *(void (**)(uint64_t, uint64_t, uint64_t))(v44 + 16);
        swift_retain();
        swift_retain();
        v52(v50, v51, v54);
        return v22;
      }
    }
    else
    {
      uint64_t v30 = (unsigned char *)v27;
      size_t v31 = __n;
      if (!*((unsigned char *)v28 + v59)) {
        goto LABEL_30;
      }
      int v32 = (*((unsigned __int8 *)v28 + v59) - 1) << (8 * v59);
      if (v59 > 3) {
        int v32 = 0;
      }
      if (v59)
      {
        int v33 = v59 <= 3 ? v59 : 4;
        switch(v33)
        {
          case 2:
            int v34 = *v28;
            break;
          case 3:
            int v34 = *v28 | (*((unsigned __int8 *)v28 + 2) << 16);
            break;
          case 4:
            int v34 = *(_DWORD *)v28;
            break;
          default:
            int v34 = *(unsigned __int8 *)v28;
            break;
        }
      }
      else
      {
        int v34 = 0;
      }
      if ((v34 | v32) == 0xFFFFFFFF) {
        goto LABEL_30;
      }
    }
    memcpy(v30, v28, v31);
    goto LABEL_32;
  }
  int v22 = (void *)(v19 + ((v17 + 16) & ~v17));
  swift_retain();
  return v22;
}

uint64_t sub_25EA31CCC(uint64_t a1)
{
  uint64_t v2 = a1 + 15;
  swift_release();
  uint64_t v30 = v2;
  unint64_t v3 = v2 & 0xFFFFFFFFFFFFFFF8;
  uint64_t v4 = sub_25EA35ED0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = v5;
  uint64_t v7 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = v7 + 8;
  uint64_t v9 = ~v7;
  unint64_t v10 = (unsigned __int16 *)((v7 + 8 + v3) & ~v7);
  uint64_t v11 = *(unsigned int *)(v5 + 84);
  uint64_t v12 = *(void *)(v5 + 64);
  if (v11)
  {
    if ((*(unsigned int (**)(unint64_t, void, uint64_t))(v5 + 48))((v7 + 8 + v3) & ~v7, *(unsigned int *)(v5 + 84), v4))
    {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (!*((unsigned char *)v10 + v12)) {
    goto LABEL_18;
  }
  int v13 = (*((unsigned __int8 *)v10 + v12) - 1) << (8 * v12);
  if (v12 > 3) {
    int v13 = 0;
  }
  if (v12)
  {
    int v14 = v12 <= 3 ? *(void *)(v5 + 64) : 4;
    switch(v14)
    {
      case 2:
        int v15 = *v10;
        break;
      case 3:
        int v15 = *v10 | (*(unsigned __int8 *)(((v7 + 8 + v3) & ~v7) + 2) << 16);
        break;
      case 4:
        int v15 = *(_DWORD *)v10;
        break;
      default:
        int v15 = *(unsigned __int8 *)v10;
        break;
    }
  }
  else
  {
    int v15 = 0;
  }
  if ((v15 | v13) == 0xFFFFFFFF) {
LABEL_18:
  }
    (*(void (**)(unint64_t, uint64_t))(v6 + 8))((v7 + 8 + v3) & ~v7, v4);
LABEL_19:
  uint64_t v16 = (v7 + 16) & v9;
  if (v11) {
    uint64_t v17 = v12;
  }
  else {
    uint64_t v17 = v12 + 1;
  }
  uint64_t v18 = v7 | 7;
  swift_release();
  uint64_t v19 = (unsigned __int16 *)((v8 + ((((v18 + a1 + v16 + v17) & ~v18) + 15) & 0xFFFFFFFFFFFFFFF8)) & v9);
  if (v11)
  {
    uint64_t v20 = v30;
    if ((*(unsigned int (**)(unsigned __int16 *, uint64_t, uint64_t))(v6 + 48))(v19, v11, v4)) {
      goto LABEL_40;
    }
    goto LABEL_39;
  }
  uint64_t v20 = v30;
  if (!*((unsigned char *)v19 + v12)) {
    goto LABEL_39;
  }
  int v21 = (*((unsigned __int8 *)v19 + v12) - 1) << (8 * v12);
  if (v12 > 3) {
    int v21 = 0;
  }
  if (v12)
  {
    int v22 = v12 <= 3 ? v12 : 4;
    switch(v22)
    {
      case 2:
        int v23 = *v19;
        break;
      case 3:
        int v23 = *v19 | (*((unsigned __int8 *)v19 + 2) << 16);
        break;
      case 4:
        int v23 = *(_DWORD *)v19;
        break;
      default:
        int v23 = *(unsigned __int8 *)v19;
        break;
    }
  }
  else
  {
    int v23 = 0;
  }
  if ((v23 | v21) == 0xFFFFFFFF) {
LABEL_39:
  }
    (*(void (**)(unsigned __int16 *, uint64_t))(v6 + 8))(v19, v4);
LABEL_40:
  swift_release();
  swift_release();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v25 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v26 = *(uint64_t (**)(unint64_t, uint64_t))(v25 + 8);
  uint64_t v27 = AssociatedTypeWitness;
  unint64_t v28 = (((v20 + ((v16 + v17 + 7) & 0xFFFFFFFFFFFFFFF8) + ((v16 + v18 + v17) & ~v18)) & 0xFFFFFFFFFFFFFFF8)
       + *(unsigned __int8 *)(v25 + 80)
       + 8) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80);
  return v26(v28, v27);
}

void *sub_25EA32058(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v2 = (void *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v3 = (void *)(((unint64_t)a2 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v2 = *v3;
  uint64_t v4 = sub_25EA35ED0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = v6 + 8;
  uint64_t v8 = ~v6;
  uint64_t v9 = (void *)(((unint64_t)v2 + v6 + 8) & ~v6);
  unint64_t v10 = (unsigned __int16 *)(((unint64_t)v3 + v6 + 8) & ~v6);
  uint64_t v11 = *(unsigned int *)(v5 + 84);
  size_t v12 = *(void *)(v5 + 64);
  swift_retain();
  uint64_t v42 = v4;
  if (!v11)
  {
    if (!*((unsigned char *)v10 + v12)) {
      goto LABEL_22;
    }
    int v13 = (*((unsigned __int8 *)v10 + v12) - 1) << (8 * v12);
    if (v12 > 3) {
      int v13 = 0;
    }
    if (v12)
    {
      int v14 = v12 <= 3 ? v12 : 4;
      switch(v14)
      {
        case 2:
          int v15 = *v10;
          break;
        case 3:
          int v15 = *v10 | (*((unsigned __int8 *)v10 + 2) << 16);
          break;
        case 4:
          int v15 = *(_DWORD *)v10;
          break;
        default:
          int v15 = *(unsigned __int8 *)v10;
          break;
      }
    }
    else
    {
      int v15 = 0;
    }
    if ((v15 | v13) == 0xFFFFFFFF) {
      goto LABEL_22;
    }
LABEL_18:
    if (v11) {
      size_t v16 = v12;
    }
    else {
      size_t v16 = v12 + 1;
    }
    memcpy(v9, v10, v16);
    goto LABEL_24;
  }
  if ((*(unsigned int (**)(unsigned __int16 *, uint64_t, uint64_t))(v5 + 48))(v10, v11, v4)) {
    goto LABEL_18;
  }
LABEL_22:
  (*(void (**)(void *, unsigned __int16 *, uint64_t))(v5 + 16))(v9, v10, v4);
  if (!v11) {
    *((unsigned char *)v9 + v12) = 0;
  }
LABEL_24:
  if (v11) {
    size_t v17 = v12;
  }
  else {
    size_t v17 = v12 + 1;
  }
  uint64_t v18 = v6 | 7;
  size_t v19 = ((v6 + 16) & v8) + v17;
  size_t v20 = v19 + (v6 | 7);
  uint64_t v41 = ~v18;
  int v21 = (void *)(((unint64_t)a1 + v20) & ~v18);
  int v22 = (void *)(((unint64_t)a2 + v20) & ~v18);
  *int v21 = *v22;
  int v23 = (void *)(((unint64_t)v21 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v24 = (void *)(((unint64_t)v22 + 15) & 0xFFFFFFFFFFFFFFF8);
  *int v23 = *v24;
  uint64_t v25 = (void *)(((unint64_t)v23 + v7) & v8);
  uint64_t v26 = (unsigned __int16 *)(((unint64_t)v24 + v7) & v8);
  swift_retain();
  if (!v11)
  {
    uint64_t v27 = v42;
    if (!*((unsigned char *)v26 + v12)) {
      goto LABEL_45;
    }
    int v28 = (*((unsigned __int8 *)v26 + v12) - 1) << (8 * v12);
    if (v12 > 3) {
      int v28 = 0;
    }
    if (v12)
    {
      int v29 = v12 <= 3 ? v12 : 4;
      switch(v29)
      {
        case 2:
          int v30 = *v26;
          break;
        case 3:
          int v30 = *v26 | (*((unsigned __int8 *)v26 + 2) << 16);
          break;
        case 4:
          int v30 = *(_DWORD *)v26;
          break;
        default:
          int v30 = *(unsigned __int8 *)v26;
          break;
      }
    }
    else
    {
      int v30 = 0;
    }
    if ((v30 | v28) == 0xFFFFFFFF) {
      goto LABEL_45;
    }
LABEL_44:
    memcpy(v25, v26, v17);
    goto LABEL_47;
  }
  uint64_t v27 = v42;
  if ((*(unsigned int (**)(unsigned __int16 *, uint64_t, uint64_t))(v5 + 48))(v26, v11, v42)) {
    goto LABEL_44;
  }
LABEL_45:
  (*(void (**)(void *, unsigned __int16 *, uint64_t))(v5 + 16))(v25, v26, v27);
  if (!v11) {
    *((unsigned char *)v25 + v12) = 0;
  }
LABEL_47:
  *(void *)(((unint64_t)v25 + v17 + 7) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v26 + v17 + 7) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v31 = ((v19 + 7) & 0xFFFFFFFFFFFFFFF8) + (v20 & v41) + 8;
  int v32 = (void *)(((unint64_t)a1 + v31 + 7) & 0xFFFFFFFFFFFFFFF8);
  int v33 = (void *)(((unint64_t)a2 + v31 + 7) & 0xFFFFFFFFFFFFFFF8);
  *int v32 = *v33;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v35 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v36 = *(void (**)(uint64_t, uint64_t, uint64_t))(v35 + 16);
  uint64_t v37 = *(unsigned __int8 *)(v35 + 80);
  uint64_t v38 = ((unint64_t)v32 + v37 + 8) & ~v37;
  uint64_t v39 = ((unint64_t)v33 + v37 + 8) & ~v37;
  swift_retain();
  swift_retain();
  v36(v38, v39, AssociatedTypeWitness);
  return a1;
}

void *sub_25EA32498(void *a1, void *a2)
{
  uint64_t v2 = a1;
  unint64_t v3 = (unint64_t)a2 + 15;
  *a1 = *a2;
  swift_retain();
  swift_release();
  uint64_t v4 = (void *)(((unint64_t)v2 + 15) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v5 = v3 & 0xFFFFFFFFFFFFFFF8;
  *uint64_t v4 = *(void *)(v3 & 0xFFFFFFFFFFFFFFF8);
  uint64_t v6 = sub_25EA35ED0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = v8 + 8;
  uint64_t v71 = ~v8;
  unint64_t v10 = (unsigned __int16 *)(((unint64_t)v4 + v8 + 8) & ~v8);
  uint64_t v11 = (unsigned __int8 *)((v8 + 8 + v5) & ~v8);
  uint64_t v12 = *(unsigned int *)(v7 + 84);
  size_t v13 = *(void *)(v7 + 64);
  uint64_t v73 = v6;
  uint64_t v75 = v7;
  if (v12)
  {
    int v14 = *(uint64_t (**)(unsigned __int16 *, uint64_t, uint64_t))(v7 + 48);
    int v15 = v10;
    int v16 = v14(v10, v12, v6);
    uint64_t v17 = v6;
    int v18 = v16;
    int v19 = v14((unsigned __int16 *)v11, v12, v17);
    unint64_t v10 = v15;
    uint64_t v9 = v8 + 8;
    if (v18)
    {
      if (v19)
      {
LABEL_4:
        if (v12) {
          size_t v20 = v13;
        }
        else {
          size_t v20 = v13 + 1;
        }
        int v21 = v10;
LABEL_51:
        memcpy(v21, v11, v20);
        goto LABEL_59;
      }
      goto LABEL_57;
    }
    goto LABEL_46;
  }
  if (!*((unsigned char *)v10 + v13)) {
    goto LABEL_31;
  }
  int v22 = (*((unsigned __int8 *)v10 + v13) - 1) << (8 * v13);
  if (v13 > 3) {
    int v22 = 0;
  }
  if (v13)
  {
    int v23 = v13 <= 3 ? *(void *)(v7 + 64) : 4;
    switch(v23)
    {
      case 2:
        int v24 = *v10;
        break;
      case 3:
        int v24 = *v10 | (*((unsigned __int8 *)v10 + 2) << 16);
        break;
      case 4:
        int v24 = *(_DWORD *)v10;
        break;
      default:
        int v24 = *(unsigned __int8 *)v10;
        break;
    }
  }
  else
  {
    int v24 = 0;
  }
  if ((v24 | v22) == 0xFFFFFFFF)
  {
LABEL_31:
    if (!v11[v13])
    {
LABEL_52:
      (*(void (**)(unsigned __int16 *, unsigned __int8 *, uint64_t))(v7 + 24))(v10, v11, v6);
      goto LABEL_59;
    }
    int v28 = (v11[v13] - 1) << (8 * v13);
    if (v13 > 3) {
      int v28 = 0;
    }
    if (v13)
    {
      if (v13 <= 3) {
        int v29 = *(void *)(v7 + 64);
      }
      else {
        int v29 = 4;
      }
      switch(v29)
      {
        case 2:
          int v30 = *(unsigned __int16 *)v11;
          break;
        case 3:
          int v30 = *(unsigned __int16 *)v11 | (v11[2] << 16);
          break;
        case 4:
          int v30 = *(_DWORD *)v11;
          break;
        default:
          int v30 = *v11;
          break;
      }
    }
    else
    {
      int v30 = 0;
    }
    int v19 = (v30 | v28) + 1;
LABEL_46:
    uint64_t v6 = v73;
    uint64_t v7 = v75;
    if (v19)
    {
      unint64_t v31 = v10;
      (*(void (**)(unsigned __int16 *, uint64_t))(v75 + 8))(v10, v73);
      if (v12) {
        size_t v20 = v13;
      }
      else {
        size_t v20 = v13 + 1;
      }
      int v21 = v31;
      goto LABEL_51;
    }
    goto LABEL_52;
  }
  if (v11[v13])
  {
    int v25 = (v11[v13] - 1) << (8 * v13);
    if (v13 > 3) {
      int v25 = 0;
    }
    if (v13)
    {
      int v26 = v13 <= 3 ? *(void *)(v7 + 64) : 4;
      switch(v26)
      {
        case 2:
          int v27 = *(unsigned __int16 *)v11;
          break;
        case 3:
          int v27 = *(unsigned __int16 *)v11 | (v11[2] << 16);
          break;
        case 4:
          int v27 = *(_DWORD *)v11;
          break;
        default:
          int v27 = *v11;
          break;
      }
    }
    else
    {
      int v27 = 0;
    }
    if ((v27 | v25) != 0xFFFFFFFF) {
      goto LABEL_4;
    }
  }
LABEL_57:
  int v32 = v10;
  (*(void (**)(unsigned __int16 *, unsigned __int8 *, uint64_t))(v75 + 16))(v10, v11, v73);
  if (!v12) {
    *((unsigned char *)v32 + v13) = 0;
  }
LABEL_59:
  if (v12) {
    size_t v33 = v13;
  }
  else {
    size_t v33 = v13 + 1;
  }
  size_t v68 = v33;
  uint64_t v34 = v8 | 7;
  size_t v69 = ((v8 + 16) & v71) + v33;
  size_t v35 = v69 + (v8 | 7);
  uint64_t v36 = ~v34;
  uint64_t v37 = ((unint64_t)v2 + v35) & ~v34;
  unint64_t v38 = ((unint64_t)a2 + v35) & ~v34;
  uint64_t v39 = *(void *)v38;
  v38 += 15;
  *(void *)uint64_t v37 = v39;
  v37 += 15;
  swift_retain();
  swift_release();
  *(void *)(v37 & 0xFFFFFFFFFFFFFFF8) = *(void *)(v38 & 0xFFFFFFFFFFFFFFF8);
  uint64_t v40 = (unsigned __int16 *)((v9 + (v37 & 0xFFFFFFFFFFFFFFF8)) & v71);
  uint64_t v41 = (unsigned __int8 *)((v9 + (v38 & 0xFFFFFFFFFFFFFFF8)) & v71);
  size_t v70 = v35;
  if (!v12)
  {
    int v49 = *((unsigned __int8 *)v40 + v13);
    char v50 = 8 * v13;
    uint64_t v51 = v75;
    uint64_t v48 = v36;
    size_t v52 = v13;
    size_t v47 = v68;
    size_t v46 = v69;
    if (v49)
    {
      int v53 = (v49 - 1) << v50;
      if (v52 > 3) {
        int v53 = 0;
      }
      if (v52)
      {
        int v54 = v52 <= 3 ? v52 : 4;
        switch(v54)
        {
          case 2:
            int v55 = *v40;
            break;
          case 3:
            int v55 = *v40 | (*((unsigned __int8 *)v40 + 2) << 16);
            break;
          case 4:
            int v55 = *(_DWORD *)v40;
            break;
          default:
            int v55 = *(unsigned __int8 *)v40;
            break;
        }
      }
      else
      {
        int v55 = 0;
      }
      if ((v55 | v53) != 0xFFFFFFFF)
      {
        size_t v72 = v52;
        if (!v41[v52]) {
          goto LABEL_112;
        }
        int v56 = (v41[v52] - 1) << v50;
        if (v52 > 3) {
          int v56 = 0;
        }
        if (v52)
        {
          int v57 = v52 <= 3 ? v52 : 4;
          switch(v57)
          {
            case 2:
              int v58 = *(unsigned __int16 *)v41;
              break;
            case 3:
              int v58 = *(unsigned __int16 *)v41 | (v41[2] << 16);
              break;
            case 4:
              int v58 = *(_DWORD *)v41;
              break;
            default:
              int v58 = *v41;
              break;
          }
        }
        else
        {
          int v58 = 0;
        }
        if ((v58 | v56) == 0xFFFFFFFF) {
          goto LABEL_112;
        }
LABEL_106:
        memcpy(v40, v41, v47);
        goto LABEL_114;
      }
    }
    if (!v41[v52])
    {
LABEL_107:
      (*(void (**)(unsigned __int16 *, unsigned __int8 *, uint64_t))(v51 + 24))(v40, v41, v73);
      goto LABEL_114;
    }
    int v59 = (v41[v52] - 1) << v50;
    if (v52 > 3) {
      int v59 = 0;
    }
    if (v52)
    {
      if (v52 <= 3) {
        int v60 = v52;
      }
      else {
        int v60 = 4;
      }
      switch(v60)
      {
        case 2:
          int v61 = *(unsigned __int16 *)v41;
          break;
        case 3:
          int v61 = *(unsigned __int16 *)v41 | (v41[2] << 16);
          break;
        case 4:
          int v61 = *(_DWORD *)v41;
          break;
        default:
          int v61 = *v41;
          break;
      }
    }
    else
    {
      int v61 = 0;
    }
    int v45 = (v61 | v59) + 1;
LABEL_104:
    uint64_t v51 = v75;
    if (v45)
    {
      (*(void (**)(unsigned __int16 *, uint64_t))(v75 + 8))(v40, v73);
      goto LABEL_106;
    }
    goto LABEL_107;
  }
  size_t v72 = v13;
  uint64_t v42 = v2;
  unint64_t v43 = *(uint64_t (**)(unsigned __int16 *, uint64_t, uint64_t))(v75 + 48);
  int v44 = v43(v40, v12, v73);
  int v45 = v43((unsigned __int16 *)v41, v12, v73);
  uint64_t v2 = v42;
  size_t v47 = v68;
  size_t v46 = v69;
  uint64_t v48 = v36;
  if (!v44) {
    goto LABEL_104;
  }
  if (v45) {
    goto LABEL_106;
  }
LABEL_112:
  (*(void (**)(unsigned __int16 *, unsigned __int8 *, uint64_t))(v75 + 16))(v40, v41, v73);
  if (!v12) {
    *((unsigned char *)v40 + v72) = 0;
  }
LABEL_114:
  *(void *)(((unint64_t)v40 + v47 + 7) & 0xFFFFFFFFFFFFFFF8) = *(void *)((unint64_t)&v41[v47 + 7] & 0xFFFFFFFFFFFFFFF8);
  swift_retain();
  swift_release();
  unint64_t v62 = ((v46 + 7) & 0xFFFFFFFFFFFFFFF8) + (v70 & v48) + 8;
  uint64_t v63 = (void *)(((unint64_t)v2 + v62 + 7) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v64 = (void *)(((unint64_t)a2 + v62 + 7) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v63 = *v64;
  swift_retain();
  swift_release();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v66 = *(void *)(AssociatedTypeWitness - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v66 + 24))(((unint64_t)v63 + *(unsigned __int8 *)(v66 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v66 + 80), ((unint64_t)v64 + *(unsigned __int8 *)(v66 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v66 + 80), AssociatedTypeWitness);
  return v2;
}

void *sub_25EA32C74(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v2 = (void *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v3 = (void *)(((unint64_t)a2 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v2 = *v3;
  uint64_t v4 = sub_25EA35ED0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = v5;
  uint64_t v7 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = v7 + 8;
  uint64_t v9 = ~v7;
  unint64_t v10 = (unsigned __int16 *)(((unint64_t)v3 + v7 + 8) & ~v7);
  uint64_t v11 = *(unsigned int *)(v5 + 84);
  size_t v12 = *(void *)(v5 + 64);
  if (!v11)
  {
    if (!*((unsigned char *)v10 + v12)) {
      goto LABEL_22;
    }
    int v13 = (*((unsigned __int8 *)v10 + v12) - 1) << (8 * v12);
    if (v12 > 3) {
      int v13 = 0;
    }
    if (v12)
    {
      int v14 = v12 <= 3 ? *(void *)(v5 + 64) : 4;
      switch(v14)
      {
        case 2:
          int v15 = *v10;
          break;
        case 3:
          int v15 = *v10 | (*((unsigned __int8 *)v10 + 2) << 16);
          break;
        case 4:
          int v15 = *(_DWORD *)v10;
          break;
        default:
          int v15 = *(unsigned __int8 *)v10;
          break;
      }
    }
    else
    {
      int v15 = 0;
    }
    if ((v15 | v13) == 0xFFFFFFFF) {
      goto LABEL_22;
    }
LABEL_18:
    if (v11) {
      size_t v16 = v12;
    }
    else {
      size_t v16 = v12 + 1;
    }
    memcpy((void *)(((unint64_t)v2 + v7 + 8) & ~v7), v10, v16);
    goto LABEL_24;
  }
  if ((*(unsigned int (**)(unsigned __int16 *, void, uint64_t))(v5 + 48))(v10, *(unsigned int *)(v5 + 84), v4))
  {
    goto LABEL_18;
  }
LABEL_22:
  (*(void (**)(unint64_t, unsigned __int16 *, uint64_t))(v6 + 32))(((unint64_t)v2 + v7 + 8) & ~v7, v10, v4);
  if (!v11) {
    *(unsigned char *)((((unint64_t)v2 + v7 + 8) & ~v7) + v12) = 0;
  }
LABEL_24:
  uint64_t v17 = (v7 + 16) & v9;
  if (v11) {
    size_t v18 = v12;
  }
  else {
    size_t v18 = v12 + 1;
  }
  size_t v19 = v17 + v18;
  uint64_t v20 = v7 | 7;
  size_t v21 = v17 + v18 + v20;
  int v22 = (void *)(((unint64_t)a1 + v21) & ~v20);
  int v23 = (void *)(((unint64_t)a2 + v21) & ~v20);
  *int v22 = *v23;
  int v24 = (void *)(((unint64_t)v22 + 15) & 0xFFFFFFFFFFFFFFF8);
  int v25 = (void *)(((unint64_t)v23 + 15) & 0xFFFFFFFFFFFFFFF8);
  *int v24 = *v25;
  int v26 = (void *)(((unint64_t)v24 + v8) & v9);
  int v27 = (unsigned __int16 *)(((unint64_t)v25 + v8) & v9);
  uint64_t v28 = v17;
  if (!v11)
  {
    if (*((unsigned char *)v27 + v12))
    {
      int v29 = (*((unsigned __int8 *)v27 + v12) - 1) << (8 * v12);
      if (v12 > 3) {
        int v29 = 0;
      }
      if (v12)
      {
        int v30 = v12 <= 3 ? v12 : 4;
        switch(v30)
        {
          case 2:
            int v31 = *v27;
            break;
          case 3:
            int v31 = *v27 | (*((unsigned __int8 *)v27 + 2) << 16);
            break;
          case 4:
            int v31 = *(_DWORD *)v27;
            break;
          default:
            int v31 = *(unsigned __int8 *)v27;
            break;
        }
      }
      else
      {
        int v31 = 0;
      }
      if ((v31 | v29) != 0xFFFFFFFF)
      {
        memcpy(v26, v27, v18);
        goto LABEL_48;
      }
    }
LABEL_45:
    (*(void (**)(void *, unsigned __int16 *, uint64_t))(v6 + 32))(v26, v27, v4);
    if (v11) {
      goto LABEL_46;
    }
    *((unsigned char *)v26 + v12) = 0;
LABEL_48:
    uint64_t v32 = 8;
    size_t v33 = v12 + 1;
    goto LABEL_49;
  }
  if (!(*(unsigned int (**)(unsigned __int16 *, uint64_t, uint64_t))(v6 + 48))(v27, v11, v4)) {
    goto LABEL_45;
  }
  memcpy(v26, v27, v12);
LABEL_46:
  uint64_t v32 = 7;
  size_t v33 = v12;
LABEL_49:
  *(void *)(((unint64_t)v26 + v12 + v32) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v27
                                                                                       + v12
                                                                                       + v32) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v34 = ((v19 + 7) & 0xFFFFFFFFFFFFFFF8) + ((v28 + v20 + v33) & ~v20) + 8;
  size_t v35 = (void *)(((unint64_t)a1 + v34 + 7) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v36 = (void *)(((unint64_t)a2 + v34 + 7) & 0xFFFFFFFFFFFFFFF8);
  *size_t v35 = *v36;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v38 = *(void *)(AssociatedTypeWitness - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v38 + 32))(((unint64_t)v35 + *(unsigned __int8 *)(v38 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80), ((unint64_t)v36 + *(unsigned __int8 *)(v38 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80), AssociatedTypeWitness);
  return a1;
}

void *sub_25EA330A4(void *a1, void *a2)
{
  unint64_t v3 = (unint64_t)a2 + 15;
  *a1 = *a2;
  swift_release();
  uint64_t v4 = (void *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v5 = v3 & 0xFFFFFFFFFFFFFFF8;
  *uint64_t v4 = *(void *)(v3 & 0xFFFFFFFFFFFFFFF8);
  uint64_t v6 = sub_25EA35ED0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = v8 + 8;
  uint64_t v10 = ~v8;
  uint64_t v11 = (unsigned __int16 *)(((unint64_t)v4 + v8 + 8) & ~v8);
  size_t v12 = (unsigned __int16 *)((v8 + 8 + v5) & ~v8);
  uint64_t v72 = v7;
  uint64_t v13 = *(unsigned int *)(v7 + 84);
  size_t v14 = *(void *)(v7 + 64);
  uint64_t v69 = v6;
  if (v13)
  {
    int v15 = *(uint64_t (**)(unsigned __int16 *, uint64_t, uint64_t))(v7 + 48);
    size_t v16 = v11;
    int v17 = v15(v11, v13, v6);
    uint64_t v18 = v6;
    int v19 = v17;
    int v20 = v15(v12, v13, v18);
    uint64_t v11 = v16;
    uint64_t v10 = ~v8;
    uint64_t v9 = v8 + 8;
    if (v19)
    {
      if (v20)
      {
LABEL_4:
        if (v13) {
          size_t v21 = v14;
        }
        else {
          size_t v21 = v14 + 1;
        }
        int v22 = v11;
LABEL_51:
        memcpy(v22, v12, v21);
        goto LABEL_59;
      }
      goto LABEL_57;
    }
    goto LABEL_46;
  }
  if (!*((unsigned char *)v11 + v14)) {
    goto LABEL_31;
  }
  int v23 = (*((unsigned __int8 *)v11 + v14) - 1) << (8 * v14);
  if (v14 > 3) {
    int v23 = 0;
  }
  if (v14)
  {
    int v24 = v14 <= 3 ? *(void *)(v7 + 64) : 4;
    switch(v24)
    {
      case 2:
        int v25 = *v11;
        break;
      case 3:
        int v25 = *v11 | (*((unsigned __int8 *)v11 + 2) << 16);
        break;
      case 4:
        int v25 = *(_DWORD *)v11;
        break;
      default:
        int v25 = *(unsigned __int8 *)v11;
        break;
    }
  }
  else
  {
    int v25 = 0;
  }
  if ((v25 | v23) == 0xFFFFFFFF)
  {
LABEL_31:
    if (!*((unsigned char *)v12 + v14))
    {
LABEL_52:
      (*(void (**)(unsigned __int16 *, unsigned __int16 *, uint64_t))(v72 + 40))(v11, v12, v6);
      goto LABEL_59;
    }
    int v29 = (*((unsigned __int8 *)v12 + v14) - 1) << (8 * v14);
    if (v14 > 3) {
      int v29 = 0;
    }
    if (v14)
    {
      if (v14 <= 3) {
        int v30 = *(void *)(v7 + 64);
      }
      else {
        int v30 = 4;
      }
      switch(v30)
      {
        case 2:
          int v31 = *v12;
          break;
        case 3:
          int v31 = *(unsigned __int16 *)((v8 + 8 + v5) & ~v8) | (*(unsigned __int8 *)(((v8 + 8 + v5) & ~v8) + 2) << 16);
          break;
        case 4:
          int v31 = *(_DWORD *)v12;
          break;
        default:
          int v31 = *(unsigned __int8 *)v12;
          break;
      }
    }
    else
    {
      int v31 = 0;
    }
    int v20 = (v31 | v29) + 1;
LABEL_46:
    uint64_t v6 = v69;
    if (v20)
    {
      uint64_t v32 = v11;
      (*(void (**)(unsigned __int16 *, uint64_t))(v72 + 8))(v11, v69);
      if (v13) {
        size_t v21 = v14;
      }
      else {
        size_t v21 = v14 + 1;
      }
      int v22 = v32;
      goto LABEL_51;
    }
    goto LABEL_52;
  }
  if (*((unsigned char *)v12 + v14))
  {
    int v26 = (*((unsigned __int8 *)v12 + v14) - 1) << (8 * v14);
    if (v14 > 3) {
      int v26 = 0;
    }
    if (v14)
    {
      int v27 = v14 <= 3 ? *(void *)(v7 + 64) : 4;
      switch(v27)
      {
        case 2:
          int v28 = *v12;
          break;
        case 3:
          int v28 = *(unsigned __int16 *)((v8 + 8 + v5) & ~v8) | (*(unsigned __int8 *)(((v8 + 8 + v5) & ~v8) + 2) << 16);
          break;
        case 4:
          int v28 = *(_DWORD *)v12;
          break;
        default:
          int v28 = *(unsigned __int8 *)v12;
          break;
      }
    }
    else
    {
      int v28 = 0;
    }
    if ((v28 | v26) != 0xFFFFFFFF) {
      goto LABEL_4;
    }
  }
LABEL_57:
  size_t v33 = v11;
  (*(void (**)(unsigned __int16 *, unsigned __int16 *, uint64_t))(v72 + 32))(v11, v12, v69);
  if (!v13) {
    *((unsigned char *)v33 + v14) = 0;
  }
LABEL_59:
  uint64_t v34 = v10;
  if (v13) {
    size_t v35 = v14;
  }
  else {
    size_t v35 = v14 + 1;
  }
  size_t v36 = v35;
  size_t v37 = ((v8 + 16) & v10) + v35;
  uint64_t v38 = v8 | 7;
  size_t v39 = v37 + (v8 | 7);
  uint64_t v68 = ~v38;
  unint64_t v40 = ((unint64_t)a1 + v39) & ~v38;
  uint64_t v41 = (void *)(((unint64_t)a2 + v39) & ~v38);
  *(void *)unint64_t v40 = *v41;
  v40 += 15;
  swift_release();
  uint64_t v42 = (void *)(((unint64_t)v41 + 15) & 0xFFFFFFFFFFFFFFF8);
  *(void *)(v40 & 0xFFFFFFFFFFFFFFF8) = *v42;
  unint64_t v43 = (unsigned __int16 *)((v9 + (v40 & 0xFFFFFFFFFFFFFFF8)) & v34);
  int v44 = (unsigned __int8 *)(((unint64_t)v42 + v9) & v34);
  if (!v13)
  {
    char v50 = 8 * v14;
    if (*((unsigned char *)v43 + v14))
    {
      int v51 = (*((unsigned __int8 *)v43 + v14) - 1) << v50;
      if (v14 > 3) {
        int v51 = 0;
      }
      if (v14)
      {
        int v52 = v14 <= 3 ? v14 : 4;
        switch(v52)
        {
          case 2:
            int v53 = *v43;
            break;
          case 3:
            int v53 = *v43 | (*((unsigned __int8 *)v43 + 2) << 16);
            break;
          case 4:
            int v53 = *(_DWORD *)v43;
            break;
          default:
            int v53 = *(unsigned __int8 *)v43;
            break;
        }
      }
      else
      {
        int v53 = 0;
      }
      if ((v53 | v51) != 0xFFFFFFFF)
      {
        size_t v66 = v14;
        if (!v44[v14]) {
          goto LABEL_113;
        }
        int v54 = (v44[v14] - 1) << v50;
        if (v14 > 3) {
          int v54 = 0;
        }
        if (v14)
        {
          int v55 = v14 <= 3 ? v14 : 4;
          switch(v55)
          {
            case 2:
              int v56 = *(unsigned __int16 *)v44;
              break;
            case 3:
              int v56 = *(unsigned __int16 *)v44 | (v44[2] << 16);
              break;
            case 4:
              int v56 = *(_DWORD *)v44;
              break;
            default:
              int v56 = *v44;
              break;
          }
        }
        else
        {
          int v56 = 0;
        }
        if ((v56 | v54) == 0xFFFFFFFF) {
          goto LABEL_113;
        }
LABEL_106:
        memcpy(v43, v44, v36);
        goto LABEL_108;
      }
    }
    if (!v44[v14])
    {
LABEL_107:
      (*(void (**)(unsigned __int16 *, unsigned __int8 *, uint64_t))(v72 + 40))(v43, v44, v69);
      goto LABEL_108;
    }
    int v57 = (v44[v14] - 1) << v50;
    if (v14 > 3) {
      int v57 = 0;
    }
    __src = v44;
    if (v14)
    {
      if (v14 <= 3) {
        int v58 = v14;
      }
      else {
        int v58 = 4;
      }
      switch(v58)
      {
        case 2:
          int v59 = *(unsigned __int16 *)v44;
          break;
        case 3:
          int v59 = *(unsigned __int16 *)v44 | (v44[2] << 16);
          break;
        case 4:
          int v59 = *(_DWORD *)v44;
          break;
        default:
          int v59 = *v44;
          break;
      }
    }
    else
    {
      int v59 = 0;
    }
    int v49 = (v59 | v57) + 1;
LABEL_104:
    int v44 = __src;
    if (v49)
    {
      (*(void (**)(unsigned __int16 *, uint64_t))(v72 + 8))(v43, v69);
      goto LABEL_106;
    }
    goto LABEL_107;
  }
  size_t v66 = v14;
  int v45 = *(uint64_t (**)(unsigned __int16 *, uint64_t, uint64_t))(v72 + 48);
  int v46 = v45(v43, v13, v69);
  size_t v47 = v44;
  int v48 = v46;
  __src = v47;
  int v49 = v45((unsigned __int16 *)v47, v13, v69);
  if (!v48) {
    goto LABEL_104;
  }
  int v44 = __src;
  if (v49) {
    goto LABEL_106;
  }
LABEL_113:
  (*(void (**)(unsigned __int16 *, unsigned __int8 *, uint64_t))(v72 + 32))(v43, v44, v69);
  if (!v13) {
    *((unsigned char *)v43 + v66) = 0;
  }
LABEL_108:
  *(void *)(((unint64_t)v43 + v36 + 7) & 0xFFFFFFFFFFFFFFF8) = *(void *)((unint64_t)&v44[v36 + 7] & 0xFFFFFFFFFFFFFFF8);
  swift_release();
  unint64_t v60 = ((v37 + 7) & 0xFFFFFFFFFFFFFFF8) + (v39 & v68) + 8;
  int v61 = (void *)(((unint64_t)a1 + v60 + 7) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v62 = (void *)(((unint64_t)a2 + v60 + 7) & 0xFFFFFFFFFFFFFFF8);
  *int v61 = *v62;
  swift_release();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v64 = *(void *)(AssociatedTypeWitness - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v64 + 40))(((unint64_t)v61 + *(unsigned __int8 *)(v64 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v64 + 80), ((unint64_t)v62 + *(unsigned __int8 *)(v64 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v64 + 80), AssociatedTypeWitness);
  return a1;
}

uint64_t sub_25EA33874(unsigned __int16 *a1, unsigned int a2)
{
  uint64_t v4 = sub_25EA35ED0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned int *)(v5 + 84);
  if (v6) {
    unsigned int v7 = v6 - 1;
  }
  else {
    unsigned int v7 = 0;
  }
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = v7;
  }
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v10 = *(void *)(AssociatedTypeWitness - 8);
  unsigned int v11 = *(_DWORD *)(v10 + 84);
  if (v11 <= v8) {
    unsigned int v12 = v8;
  }
  else {
    unsigned int v12 = *(_DWORD *)(v10 + 84);
  }
  uint64_t v13 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v14 = *(unsigned __int8 *)(v10 + 80);
  if (v6) {
    uint64_t v15 = *(void *)(v5 + 64);
  }
  else {
    uint64_t v15 = *(void *)(v5 + 64) + 1;
  }
  if (!a2) {
    return 0;
  }
  unint64_t v16 = ((v15 + ((v13 + 16) & ~v13) + 7) & 0xFFFFFFFFFFFFFFF8)
      + ((v15 + ((v13 + 16) & ~v13) + (v13 | 7)) & ~(v13 | 7))
      + 8;
  uint64_t v17 = v14 + 8;
  if (a2 <= v12) {
    goto LABEL_33;
  }
  unint64_t v18 = ((v17 + v16) & ~v14) + *(void *)(*(void *)(AssociatedTypeWitness - 8) + 64);
  char v19 = 8 * v18;
  if (v18 > 3) {
    goto LABEL_16;
  }
  unsigned int v21 = ((a2 - v12 + ~(-1 << v19)) >> v19) + 1;
  if (HIWORD(v21))
  {
    int v20 = *(_DWORD *)((char *)a1 + v18);
    if (!v20) {
      goto LABEL_33;
    }
    goto LABEL_23;
  }
  if (v21 > 0xFF)
  {
    int v20 = *(unsigned __int16 *)((char *)a1 + v18);
    if (!*(unsigned __int16 *)((char *)a1 + v18)) {
      goto LABEL_33;
    }
    goto LABEL_23;
  }
  if (v21 >= 2)
  {
LABEL_16:
    int v20 = *((unsigned __int8 *)a1 + v18);
    if (!*((unsigned char *)a1 + v18)) {
      goto LABEL_33;
    }
LABEL_23:
    int v22 = (v20 - 1) << v19;
    if (v18 > 3) {
      int v22 = 0;
    }
    if (v18)
    {
      if (v18 <= 3) {
        int v23 = v18;
      }
      else {
        int v23 = 4;
      }
      switch(v23)
      {
        case 2:
          int v24 = *a1;
          break;
        case 3:
          int v24 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
          break;
        case 4:
          int v24 = *(_DWORD *)a1;
          break;
        default:
          int v24 = *(unsigned __int8 *)a1;
          break;
      }
    }
    else
    {
      int v24 = 0;
    }
    return v12 + (v24 | v22) + 1;
  }
LABEL_33:
  if (v8 >= v11)
  {
    if ((v7 & 0x80000000) == 0)
    {
      unint64_t v26 = *(void *)a1;
      goto LABEL_38;
    }
    if (v6)
    {
      int v29 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v5 + 48))(((((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8) + v13 + 8) & ~v13, v6, v4);
      BOOL v30 = v29 != 0;
      uint64_t result = (v29 - 1);
      if (result != 0 && v30) {
        return result;
      }
    }
    return 0;
  }
  int v25 = (unint64_t *)(((unint64_t)a1 + v16 + 7) & 0xFFFFFFFFFFFFFFF8);
  if (v12 == 0x7FFFFFFF)
  {
    unint64_t v26 = *v25;
LABEL_38:
    if (v26 >= 0xFFFFFFFF) {
      LODWORD(v26) = -1;
    }
    return (v26 + 1);
  }
  int v28 = *(uint64_t (**)(unint64_t))(v10 + 48);
  return v28(((unint64_t)v25 + v17) & ~v14);
}

void sub_25EA33B9C(unsigned char *a1, uint64_t a2, unsigned int a3)
{
  uint64_t v6 = sub_25EA35ED0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v45 = v6;
  uint64_t v8 = *(unsigned int *)(v7 + 84);
  if (v8) {
    unsigned int v9 = v8 - 1;
  }
  else {
    unsigned int v9 = 0;
  }
  if (v9 <= 0x7FFFFFFF) {
    unsigned int v10 = 0x7FFFFFFF;
  }
  else {
    unsigned int v10 = v9;
  }
  int v11 = 0;
  uint64_t v12 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  uint64_t v13 = v12;
  unsigned int v14 = *(_DWORD *)(v12 + 84);
  if (v14 <= v10) {
    unsigned int v15 = v10;
  }
  else {
    unsigned int v15 = *(_DWORD *)(v12 + 84);
  }
  uint64_t v16 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v17 = (v16 + 16) & ~v16;
  size_t v18 = *(void *)(v7 + 64);
  if (v8) {
    size_t v19 = *(void *)(v7 + 64);
  }
  else {
    size_t v19 = v18 + 1;
  }
  size_t v20 = v17 + v19;
  uint64_t v21 = (v17 + v19 + (v16 | 7)) & ~(v16 | 7);
  size_t v22 = v20 + 7;
  unint64_t v23 = v21 + (v22 & 0xFFFFFFFFFFFFFFF8) + 8;
  uint64_t v24 = *(unsigned __int8 *)(v12 + 80);
  uint64_t v25 = v24 + 8;
  size_t v26 = ((v24 + 8 + v23) & ~v24) + *(void *)(v12 + 64);
  if (a3 <= v15) {
    goto LABEL_23;
  }
  if (v26 <= 3)
  {
    unsigned int v28 = ((a3 - v15 + ~(-1 << (8 * v26))) >> (8 * v26)) + 1;
    if (HIWORD(v28))
    {
      int v11 = 4;
      if (v15 < a2) {
        goto LABEL_24;
      }
      goto LABEL_16;
    }
    if (v28 >= 0x100) {
      int v11 = 2;
    }
    else {
      int v11 = v28 > 1;
    }
LABEL_23:
    if (v15 < a2) {
      goto LABEL_24;
    }
LABEL_16:
    uint64_t v27 = ~v24;
    switch(v11)
    {
      case 1:
        a1[v26] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_32;
      case 2:
        *(_WORD *)&a1[v26] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_32;
      case 3:
        goto LABEL_86;
      case 4:
        *(_DWORD *)&a1[v26] = 0;
        goto LABEL_31;
      default:
LABEL_31:
        if (a2)
        {
LABEL_32:
          if (v10 >= v14)
          {
            if (v10 >= a2)
            {
              if ((v9 & 0x80000000) != 0)
              {
                uint64_t v38 = (unsigned char *)((((unint64_t)(a1 + 15) & 0xFFFFFFFFFFFFFFF8) + v16 + 8) & ~v16);
                if (v9 >= a2)
                {
                  if ((int)a2 + 1 <= v8)
                  {
                    if (a2 != -1)
                    {
                      int v44 = *(void (**)(unsigned char *, void, uint64_t, uint64_t))(v7 + 56);
                      v44(v38, (a2 + 1), v8, v45);
                    }
                  }
                  else
                  {
                    if (v18 <= 3) {
                      int v42 = ~(-1 << (8 * v18));
                    }
                    else {
                      int v42 = -1;
                    }
                    if (v18)
                    {
                      int v40 = v42 & (a2 - v8);
                      if (v18 <= 3) {
                        int v43 = v18;
                      }
                      else {
                        int v43 = 4;
                      }
                      bzero(v38, v18);
                      switch(v43)
                      {
                        case 2:
LABEL_84:
                          *(_WORD *)uint64_t v38 = v40;
                          break;
                        case 3:
LABEL_83:
                          *(_WORD *)uint64_t v38 = v40;
                          v38[2] = BYTE2(v40);
                          break;
                        case 4:
LABEL_85:
                          *(_DWORD *)uint64_t v38 = v40;
                          break;
                        default:
LABEL_78:
                          *uint64_t v38 = v40;
                          break;
                      }
                    }
                  }
                }
                else
                {
                  if (v19 <= 3) {
                    int v39 = ~(-1 << (8 * v19));
                  }
                  else {
                    int v39 = -1;
                  }
                  if (v19)
                  {
                    int v40 = v39 & (~v9 + a2);
                    if (v19 <= 3) {
                      int v41 = v19;
                    }
                    else {
                      int v41 = 4;
                    }
                    bzero(v38, v19);
                    switch(v41)
                    {
                      case 2:
                        goto LABEL_84;
                      case 3:
                        goto LABEL_83;
                      case 4:
                        goto LABEL_85;
                      default:
                        goto LABEL_78;
                    }
                  }
                }
              }
              else
              {
                if ((a2 & 0x80000000) != 0) {
                  uint64_t v37 = a2 ^ 0x80000000;
                }
                else {
                  uint64_t v37 = (a2 - 1);
                }
                *(void *)a1 = v37;
              }
            }
            else
            {
              int v34 = (v22 & 0xFFFFFFF8) + v21;
              if (v34 != -8)
              {
                bzero(a1, (v34 + 8));
                *(_DWORD *)a1 = ~v10 + a2;
              }
            }
          }
          else
          {
            uint64_t v32 = (void *)((unint64_t)&a1[v23 + 7] & 0xFFFFFFFFFFFFFFF8);
            if (v15 == 0x7FFFFFFF)
            {
              if ((a2 & 0x80000000) != 0) {
                uint64_t v33 = a2 ^ 0x80000000;
              }
              else {
                uint64_t v33 = (a2 - 1);
              }
              *uint64_t v32 = v33;
            }
            else
            {
              unint64_t v35 = ((unint64_t)v32 + v25) & v27;
              size_t v36 = *(void (**)(unint64_t, uint64_t))(v13 + 56);
              v36(v35, a2);
            }
          }
        }
        break;
    }
    return;
  }
  int v11 = 1;
  if (v15 >= a2) {
    goto LABEL_16;
  }
LABEL_24:
  unsigned int v29 = ~v15 + a2;
  if (v26 < 4)
  {
    int v30 = (v29 >> (8 * v26)) + 1;
    if (v26)
    {
      int v31 = v29 & ~(-1 << (8 * v26));
      bzero(a1, v26);
      if (v26 == 3)
      {
        *(_WORD *)a1 = v31;
        a1[2] = BYTE2(v31);
      }
      else if (v26 == 2)
      {
        *(_WORD *)a1 = v31;
      }
      else
      {
        *a1 = v31;
      }
    }
  }
  else
  {
    bzero(a1, v26);
    *(_DWORD *)a1 = v29;
    int v30 = 1;
  }
  switch(v11)
  {
    case 1:
      a1[v26] = v30;
      break;
    case 2:
      *(_WORD *)&a1[v26] = v30;
      break;
    case 3:
LABEL_86:
      __break(1u);
      JUMPOUT(0x25EA340ACLL);
    case 4:
      *(_DWORD *)&a1[v26] = v30;
      break;
    default:
      return;
  }
}

uint64_t sub_25EA340F4()
{
  uint64_t result = type metadata accessor for ScopeReader(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_25EA3418C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v6 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
  }
  else
  {
    uint64_t v6 = a1;
    a1[1] = a2[1];
    uint64_t v7 = *(int *)(type metadata accessor for ScopeReader.CurrentScope(0) + 24);
    uint64_t v8 = (char *)v6 + v7;
    unsigned int v9 = (char *)a2 + v7;
    uint64_t v10 = type metadata accessor for ScopeGraphElement.ID(0);
    uint64_t v11 = *(void *)(v10 - 8);
    uint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
    swift_retain();
    unsigned int v28 = v12;
    uint64_t v27 = v11;
    if (v12(v9, 1, v10))
    {
      sub_25E9F7BF4(0);
      memcpy(v8, v9, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      uint64_t v14 = sub_25EA35ED0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v8, v9, v14);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
    }
    uint64_t v15 = *(int *)(type metadata accessor for ScopeReader(0) + 20);
    uint64_t v16 = (uint64_t *)((char *)v6 + v15);
    uint64_t v17 = (char *)a2 + v15;
    uint64_t v19 = *(uint64_t *)((char *)a2 + v15);
    uint64_t v18 = *(uint64_t *)((char *)a2 + v15 + 8);
    *uint64_t v16 = v19;
    v16[1] = v18;
    uint64_t v20 = type metadata accessor for Dependencies();
    uint64_t v21 = *(int *)(v20 + 24);
    size_t v22 = (char *)v16 + v21;
    unint64_t v23 = &v17[v21];
    swift_retain();
    if (v28(v23, 1, v10))
    {
      sub_25E9F7BF4(0);
      memcpy(v22, v23, *(void *)(*(void *)(v24 - 8) + 64));
    }
    else
    {
      uint64_t v25 = sub_25EA35ED0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 16))(v22, v23, v25);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v27 + 56))(v22, 0, 1, v10);
    }
    *(void *)((char *)v16 + *(int *)(v20 + 28)) = *(void *)&v17[*(int *)(v20 + 28)];
    *(uint64_t *)((char *)v6 + *(int *)(a3 + 28)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 28));
    swift_retain();
  }
  swift_retain();
  return v6;
}

uint64_t sub_25EA34450(uint64_t a1)
{
  swift_release();
  uint64_t v2 = a1 + *(int *)(type metadata accessor for ScopeReader.CurrentScope(0) + 24);
  uint64_t v3 = type metadata accessor for ScopeGraphElement.ID(0);
  uint64_t v4 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 48);
  if (!v4(v2, 1, v3))
  {
    uint64_t v5 = sub_25EA35ED0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v2, v5);
  }
  uint64_t v6 = a1 + *(int *)(type metadata accessor for ScopeReader(0) + 20);
  swift_release();
  uint64_t v7 = v6 + *(int *)(type metadata accessor for Dependencies() + 24);
  if (!v4(v7, 1, v3))
  {
    uint64_t v8 = sub_25EA35ED0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  }
  swift_release();
  return swift_release();
}

void *sub_25EA345C4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  uint64_t v6 = *(int *)(type metadata accessor for ScopeReader.CurrentScope(0) + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for ScopeGraphElement.ID(0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  swift_retain();
  uint64_t v27 = v11;
  uint64_t v26 = v10;
  if (v11(v8, 1, v9))
  {
    sub_25E9F7BF4(0);
    memcpy(v7, v8, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    uint64_t v13 = sub_25EA35ED0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v7, v8, v13);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v14 = *(int *)(type metadata accessor for ScopeReader(0) + 20);
  uint64_t v15 = (void *)((char *)a1 + v14);
  uint64_t v16 = (char *)a2 + v14;
  uint64_t v18 = *(void *)((char *)a2 + v14);
  uint64_t v17 = *(void *)((char *)a2 + v14 + 8);
  *uint64_t v15 = v18;
  v15[1] = v17;
  uint64_t v19 = type metadata accessor for Dependencies();
  uint64_t v20 = *(int *)(v19 + 24);
  uint64_t v21 = (char *)v15 + v20;
  size_t v22 = &v16[v20];
  swift_retain();
  if (v27(v22, 1, v9))
  {
    sub_25E9F7BF4(0);
    memcpy(v21, v22, *(void *)(*(void *)(v23 - 8) + 64));
  }
  else
  {
    uint64_t v24 = sub_25EA35ED0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 16))(v21, v22, v24);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56))(v21, 0, 1, v9);
  }
  *(void *)((char *)v15 + *(int *)(v19 + 28)) = *(void *)&v16[*(int *)(v19 + 28)];
  *(void *)((char *)a1 + *(int *)(a3 + 28)) = *(void *)((char *)a2 + *(int *)(a3 + 28));
  swift_retain();
  swift_retain();
  return a1;
}

void *sub_25EA3483C(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  uint64_t v5 = *(int *)(type metadata accessor for ScopeReader.CurrentScope(0) + 24);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = type metadata accessor for ScopeGraphElement.ID(0);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48);
  int v11 = v10(v6, 1, v8);
  int v12 = v10(v7, 1, v8);
  uint64_t v29 = v9;
  if (v11)
  {
    if (!v12)
    {
      uint64_t v13 = sub_25EA35ED0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v6, v7, v13);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v12)
  {
    sub_25EA34BE4((uint64_t)v6, type metadata accessor for ScopeGraphElement.ID);
LABEL_6:
    sub_25E9F7BF4(0);
    memcpy(v6, v7, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  uint64_t v27 = sub_25EA35ED0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 24))(v6, v7, v27);
LABEL_7:
  uint64_t v15 = *(int *)(type metadata accessor for ScopeReader(0) + 20);
  uint64_t v16 = (char *)a1 + v15;
  int v31 = a2;
  uint64_t v17 = (void *)((char *)a2 + v15);
  *(void *)((char *)a1 + v15) = *v17;
  swift_retain();
  swift_release();
  *((void *)v16 + 1) = v17[1];
  uint64_t v18 = type metadata accessor for Dependencies();
  uint64_t v19 = *(int *)(v18 + 24);
  uint64_t v20 = &v16[v19];
  uint64_t v21 = (char *)v17 + v19;
  int v22 = v10(&v16[v19], 1, v8);
  int v23 = v10(v21, 1, v8);
  if (!v22)
  {
    if (!v23)
    {
      uint64_t v28 = sub_25EA35ED0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 24))(v20, v21, v28);
      goto LABEL_13;
    }
    sub_25EA34BE4((uint64_t)v20, type metadata accessor for ScopeGraphElement.ID);
    goto LABEL_12;
  }
  if (v23)
  {
LABEL_12:
    sub_25E9F7BF4(0);
    memcpy(v20, v21, *(void *)(*(void *)(v25 - 8) + 64));
    goto LABEL_13;
  }
  uint64_t v24 = sub_25EA35ED0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 16))(v20, v21, v24);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v20, 0, 1, v8);
LABEL_13:
  *(void *)&v16[*(int *)(v18 + 28)] = *(void *)((char *)v17 + *(int *)(v18 + 28));
  swift_retain();
  swift_release();
  *(void *)((char *)a1 + *(int *)(a3 + 28)) = *(void *)((char *)v31 + *(int *)(a3 + 28));
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_25EA34BE4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void *sub_25EA34C44(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  uint64_t v6 = *(int *)(type metadata accessor for ScopeReader.CurrentScope(0) + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for ScopeGraphElement.ID(0);
  uint64_t v10 = *(void *)(v9 - 8);
  int v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  uint64_t v25 = v10;
  if (v11(v8, 1, v9))
  {
    sub_25E9F7BF4(0);
    memcpy(v7, v8, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    uint64_t v13 = sub_25EA35ED0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v7, v8, v13);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v14 = *(int *)(type metadata accessor for ScopeReader(0) + 20);
  uint64_t v15 = (void *)((char *)a1 + v14);
  uint64_t v16 = (char *)a2 + v14;
  uint64_t v17 = *(void *)((char *)a2 + v14 + 8);
  *uint64_t v15 = *(void *)((char *)a2 + v14);
  v15[1] = v17;
  uint64_t v18 = type metadata accessor for Dependencies();
  uint64_t v19 = *(int *)(v18 + 24);
  uint64_t v20 = (char *)v15 + v19;
  uint64_t v21 = &v16[v19];
  if (v11(&v16[v19], 1, v9))
  {
    sub_25E9F7BF4(0);
    memcpy(v20, v21, *(void *)(*(void *)(v22 - 8) + 64));
  }
  else
  {
    uint64_t v23 = sub_25EA35ED0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 32))(v20, v21, v23);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v20, 0, 1, v9);
  }
  *(void *)((char *)v15 + *(int *)(v18 + 28)) = *(void *)&v16[*(int *)(v18 + 28)];
  *(void *)((char *)a1 + *(int *)(a3 + 28)) = *(void *)((char *)a2 + *(int *)(a3 + 28));
  return a1;
}

void *sub_25EA34E98(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  uint64_t v5 = *(int *)(type metadata accessor for ScopeReader.CurrentScope(0) + 24);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = type metadata accessor for ScopeGraphElement.ID(0);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48);
  int v11 = v10(v6, 1, v8);
  int v12 = v10(v7, 1, v8);
  uint64_t v29 = v9;
  if (v11)
  {
    if (!v12)
    {
      uint64_t v13 = sub_25EA35ED0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v6, v7, v13);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v12)
  {
    sub_25EA34BE4((uint64_t)v6, type metadata accessor for ScopeGraphElement.ID);
LABEL_6:
    sub_25E9F7BF4(0);
    memcpy(v6, v7, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  uint64_t v27 = sub_25EA35ED0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 40))(v6, v7, v27);
LABEL_7:
  uint64_t v15 = *(int *)(type metadata accessor for ScopeReader(0) + 20);
  uint64_t v16 = (char *)a1 + v15;
  int v31 = a2;
  uint64_t v17 = (void *)((char *)a2 + v15);
  *(void *)((char *)a1 + v15) = *v17;
  swift_release();
  *((void *)v16 + 1) = v17[1];
  uint64_t v18 = type metadata accessor for Dependencies();
  uint64_t v19 = *(int *)(v18 + 24);
  uint64_t v20 = &v16[v19];
  uint64_t v21 = (char *)v17 + v19;
  int v22 = v10(&v16[v19], 1, v8);
  int v23 = v10(v21, 1, v8);
  if (!v22)
  {
    if (!v23)
    {
      uint64_t v28 = sub_25EA35ED0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 40))(v20, v21, v28);
      goto LABEL_13;
    }
    sub_25EA34BE4((uint64_t)v20, type metadata accessor for ScopeGraphElement.ID);
    goto LABEL_12;
  }
  if (v23)
  {
LABEL_12:
    sub_25E9F7BF4(0);
    memcpy(v20, v21, *(void *)(*(void *)(v25 - 8) + 64));
    goto LABEL_13;
  }
  uint64_t v24 = sub_25EA35ED0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 32))(v20, v21, v24);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v20, 0, 1, v8);
LABEL_13:
  *(void *)&v16[*(int *)(v18 + 28)] = *(void *)((char *)v17 + *(int *)(v18 + 28));
  swift_release();
  *(void *)((char *)a1 + *(int *)(a3 + 28)) = *(void *)((char *)v31 + *(int *)(a3 + 28));
  swift_release();
  return a1;
}

uint64_t sub_25EA35220(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25EA35234);
}

uint64_t sub_25EA35234(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for ScopeReader(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 28));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_25EA352F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25EA35308);
}

uint64_t sub_25EA35308(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for ScopeReader(0);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 28)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_25EA353C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ScopeReader(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25EA35428()
{
  return swift_initClassMetadata2();
}

uint64_t sub_25EA3546C()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for Weak()
{
  return sub_25E9ED2B4();
}

uint64_t sub_25EA354BC()
{
  uint64_t result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_25EA35560(uint64_t a1)
{
  uint64_t v21 = *(void **)v1;
  uint64_t v2 = v21;
  uint64_t v3 = v21[40];
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v6 = (char *)&v21 - v5;
  uint64_t v7 = v21[41];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v9 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v10 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  int v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v21 - v13;
  if (*(unsigned char *)(v1 + v2[15]))
  {
    char v15 = 0;
  }
  else
  {
    uint64_t v16 = v1 + v21[43];
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v14, v16, AssociatedTypeWitness);
    uint64_t v17 = v1 + *(void *)(*(void *)v1 + 104);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v17, v3);
    (*(void (**)(uint64_t, uint64_t))(v7 + 24))(v3, v7);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    swift_beginAccess();
    (*(void (**)(uint64_t, char *, uint64_t))(v9 + 24))(v16, v12, AssociatedTypeWitness);
    swift_endAccess();
    char v18 = sub_25EA36120();
    uint64_t v19 = *(void (**)(char *, uint64_t))(v9 + 8);
    v19(v12, AssociatedTypeWitness);
    v19(v14, AssociatedTypeWitness);
    char v15 = v18 ^ 1;
  }
  return v15 & 1;
}

BOOL sub_25EA3588C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = (void *)*v1;
  uint64_t v4 = v3[40];
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v7 = (char *)&v19 - v6;
  uint64_t v21 = v3;
  uint64_t v20 = v3[41];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v9 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v10 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  int v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v19 - v13;
  char v15 = (char *)v2 + v3[43];
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v14, v15, AssociatedTypeWitness);
  sub_25EA06F04();
  uint64_t v16 = (char *)v2 + *(void *)(*v2 + 104);
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v7, v16, v4);
  (*(void (**)(uint64_t))(v20 + 24))(v4);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v9 + 24))(v15, v12, AssociatedTypeWitness);
  swift_endAccess();
  LOBYTE(v2) = sub_25EA36120();
  uint64_t v17 = *(void (**)(char *, uint64_t))(v9 + 8);
  v17(v12, AssociatedTypeWitness);
  v17(v14, AssociatedTypeWitness);
  return (v2 & 1) == 0;
}

uint64_t sub_25EA35B94()
{
  uint64_t v1 = v0 + *(void *)(*(void *)v0 + 344);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 8);
  return v3(v1, AssociatedTypeWitness);
}

uint64_t *sub_25EA35C48()
{
  uint64_t v0 = sub_25EA2E61C();
  uint64_t v1 = (char *)v0 + *(void *)(*v0 + 344);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(char *, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 8))(v1, AssociatedTypeWitness);
  return v0;
}

uint64_t sub_25EA35D04()
{
  uint64_t v0 = sub_25EA35C48();
  uint64_t v1 = *(unsigned int *)(*v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t type metadata accessor for EquatableSourceVertex()
{
  return sub_25E9ED2B4();
}

void *sub_25EA35D70(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = v2 + *(void *)(*(void *)v2 + 344);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16))(v5, a2, AssociatedTypeWitness);
  return sub_25EA2E68C(a1);
}

void *sub_25EA35E40(uint64_t a1, uint64_t a2)
{
  return sub_25EA35D70(a1, a2);
}

uint64_t dispatch thunk of EventHandler.receive(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t _s9TeaBreeze17ScopeGraphElementV2IDV11descriptionSSvg_0()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t _s9TeaBreeze17ScopeGraphElementV2IDV2eeoiySbAE_AEtFZ_0()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_25EA35EC0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_25EA35ED0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_25EA35EE0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25EA35EF0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_25EA35F00()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25EA35F10()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_25EA35F20()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_25EA35F30()
{
  return MEMORY[0x270EFF100]();
}

uint64_t sub_25EA35F50()
{
  return MEMORY[0x270EFF510]();
}

uint64_t sub_25EA35F60()
{
  return MEMORY[0x270EFF520]();
}

uint64_t sub_25EA35F70()
{
  return MEMORY[0x270EFF538]();
}

uint64_t sub_25EA35FA0()
{
  return MEMORY[0x270EFFE90]();
}

uint64_t sub_25EA35FB0()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_25EA35FC0()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_25EA35FD0()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_25EA35FE0()
{
  return MEMORY[0x270F00F10]();
}

uint64_t sub_25EA35FF0()
{
  return MEMORY[0x270F00F20]();
}

uint64_t sub_25EA36000()
{
  return MEMORY[0x270F01C68]();
}

uint64_t sub_25EA36010()
{
  return MEMORY[0x270F02798]();
}

uint64_t sub_25EA36020()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_25EA36030()
{
  return MEMORY[0x270F034A0]();
}

uint64_t sub_25EA36040()
{
  return MEMORY[0x270F04170]();
}

uint64_t sub_25EA36050()
{
  return MEMORY[0x270F04188]();
}

uint64_t sub_25EA36070()
{
  return MEMORY[0x270F9CFC0]();
}

uint64_t sub_25EA360B0()
{
  return MEMORY[0x270F9D148]();
}

uint64_t sub_25EA360C0()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t sub_25EA360D0()
{
  return MEMORY[0x270F9D1E8]();
}

uint64_t sub_25EA360E0()
{
  return MEMORY[0x270F9D1F0]();
}

uint64_t sub_25EA360F0()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_25EA36100()
{
  return MEMORY[0x270F9D328]();
}

uint64_t sub_25EA36110()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_25EA36120()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_25EA36130()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_25EA36140()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25EA36150()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25EA36160()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25EA36170()
{
  return MEMORY[0x270F9D938]();
}

uint64_t sub_25EA36180()
{
  return MEMORY[0x270F9D9C0]();
}

uint64_t sub_25EA36190()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_25EA361A0()
{
  return MEMORY[0x270F9DBD0]();
}

uint64_t sub_25EA361B0()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_25EA361C0()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_25EA361D0()
{
  return MEMORY[0x270F9DC30]();
}

uint64_t sub_25EA361E0()
{
  return MEMORY[0x270F9DC80]();
}

uint64_t sub_25EA361F0()
{
  return MEMORY[0x270F9DCA8]();
}

uint64_t sub_25EA36200()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_25EA36210()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_25EA36220()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_25EA36230()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_25EA36240()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_25EA36250()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_25EA36260()
{
  return MEMORY[0x270F9DFD0]();
}

uint64_t sub_25EA36270()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_25EA36280()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_25EA36290()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_25EA362A0()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_25EA362B0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_25EA362C0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25EA362D0()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_25EA362E0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_25EA362F0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25EA36300()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25EA36310()
{
  return MEMORY[0x270F9E658]();
}

uint64_t sub_25EA36330()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_25EA36340()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_25EA36350()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_25EA36360()
{
  return MEMORY[0x270F9E978]();
}

uint64_t sub_25EA36370()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25EA36380()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25EA36390()
{
  return MEMORY[0x270F9EA38]();
}

uint64_t sub_25EA363A0()
{
  return MEMORY[0x270F9EAE0]();
}

uint64_t sub_25EA363B0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25EA363C0()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_25EA363D0()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_25EA363E0()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_25EA363F0()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t sub_25EA36400()
{
  return MEMORY[0x270F9ED10]();
}

uint64_t sub_25EA36410()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25EA36420()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_25EA36430()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_25EA36440()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_25EA36450()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25EA36460()
{
  return MEMORY[0x270F9F0B8]();
}

uint64_t sub_25EA36470()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25EA36480()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25EA36490()
{
  return MEMORY[0x270F9F4F8]();
}

uint64_t sub_25EA364A0()
{
  return MEMORY[0x270F9F770]();
}

uint64_t sub_25EA364B0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25EA364C0()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_25EA364D0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25EA364E0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25EA364F0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25EA36500()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25EA36510()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25EA36520()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_25EA36530()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25EA36540()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25EA36550()
{
  return MEMORY[0x270F9FC88]();
}

uint64_t sub_25EA36560()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25EA36570()
{
  return MEMORY[0x270F9FC98]();
}

uint64_t sub_25EA36580()
{
  return MEMORY[0x270F9FCB8]();
}

uint64_t sub_25EA36590()
{
  return MEMORY[0x270F9FCC8]();
}

uint64_t sub_25EA365A0()
{
  return MEMORY[0x270F9FCE8]();
}

uint64_t sub_25EA365B0()
{
  return MEMORY[0x270F9FDD0]();
}

uint64_t sub_25EA365C0()
{
  return MEMORY[0x270FA0128]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
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

uint64_t swift_deallocObject()
{
  return MEMORY[0x270FA0238]();
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

uint64_t swift_getExistentialMetatypeMetadata()
{
  return MEMORY[0x270FA0350]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x270FA0358]();
}

uint64_t swift_getExtendedExistentialTypeMetadata()
{
  return MEMORY[0x270FA0360]();
}

uint64_t swift_getExtendedExistentialTypeMetadata_unique()
{
  return MEMORY[0x270FA0368]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getFunctionTypeMetadataGlobalActor()
{
  return MEMORY[0x270FA03A8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x270FA03C8]();
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

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
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

uint64_t swift_readAtKeyPath()
{
  return MEMORY[0x270FA0500]();
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

uint64_t swift_setAtReferenceWritableKeyPath()
{
  return MEMORY[0x270FA0540]();
}

uint64_t swift_setAtWritableKeyPath()
{
  return MEMORY[0x270FA0548]();
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

uint64_t swift_task_getMainExecutor()
{
  return MEMORY[0x270FA2468]();
}

uint64_t swift_task_isCurrentExecutor()
{
  return MEMORY[0x270FA2478]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}