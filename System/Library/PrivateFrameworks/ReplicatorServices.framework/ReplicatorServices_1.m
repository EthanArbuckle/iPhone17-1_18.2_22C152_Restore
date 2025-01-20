uint64_t sub_25B3634D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;

  v1 = v0;
  v2 = sub_25B37F640();
  v3 = *(void *)(v2 - 8);
  v4 = MEMORY[0x270FA5388](v2);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25B380250();
  sub_25B366670(v1, (uint64_t)v8, type metadata accessor for ReplicatorRecord.ID.Ownership);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2) == 1)
  {
    sub_25B380260();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v6, v8, v2);
    sub_25B380260();
    sub_25B366904(&qword_26B340FA0, MEMORY[0x263F07508]);
    sub_25B37F950();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
  return sub_25B380290();
}

uint64_t ReplicatorRecord.ID.id.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ReplicatorRecord.ID.id.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*ReplicatorRecord.ID.id.modify())()
{
  return nullsub_1;
}

uint64_t ReplicatorRecord.ID.zone.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ReplicatorRecord.ID.zone.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*ReplicatorRecord.ID.zone.modify())()
{
  return nullsub_1;
}

uint64_t ReplicatorRecord.ID.clientID.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ReplicatorRecord.ID.clientID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return result;
}

uint64_t (*ReplicatorRecord.ID.clientID.modify())()
{
  return nullsub_1;
}

uint64_t ReplicatorRecord.ID.ownership.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25B3638A4(type metadata accessor for ReplicatorRecord.ID, (uint64_t)type metadata accessor for ReplicatorRecord.ID.Ownership, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_25B366670, a1);
}

uint64_t sub_25B3638A4@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = a1(0);
  return a3(v4 + *(int *)(v8 + 28), a4, a2);
}

uint64_t ReplicatorRecord.ID.ownership.setter(uint64_t a1)
{
  return sub_25B36393C(a1, type metadata accessor for ReplicatorRecord.ID, (uint64_t)type metadata accessor for ReplicatorRecord.ID.Ownership, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_25B3669F4);
}

uint64_t sub_25B36393C(uint64_t a1, uint64_t (*a2)(void), uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v8 = a2(0);
  return a4(a1, v4 + *(int *)(v8 + 28), a3);
}

uint64_t (*ReplicatorRecord.ID.ownership.modify())()
{
  return nullsub_1;
}

uint64_t ReplicatorRecord.ID.logIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for ReplicatorRecord.ID(0) + 32));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ReplicatorRecord.ID.description.getter()
{
  return 0;
}

uint64_t ReplicatorRecord.ID.hash(into:)()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25B37F640();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for ReplicatorRecord.ID.Ownership(0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  sub_25B37FA10();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25B37FA10();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25B37FA10();
  swift_bridgeObjectRelease();
  uint64_t v9 = type metadata accessor for ReplicatorRecord.ID(0);
  sub_25B366670(v1 + *(int *)(v9 + 28), (uint64_t)v8, type metadata accessor for ReplicatorRecord.ID.Ownership);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2) == 1)
  {
    sub_25B380260();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v8, v2);
    sub_25B380260();
    sub_25B366904(&qword_26B340FA0, MEMORY[0x263F07508]);
    sub_25B37F950();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  swift_bridgeObjectRetain();
  sub_25B37FA10();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25B363E24()
{
  uint64_t result = 25705;
  switch(*v0)
  {
    case 1:
      uint64_t result = 1701736314;
      break;
    case 2:
      uint64_t result = 0x4449746E65696C63;
      break;
    case 3:
      uint64_t result = 0x69687372656E776FLL;
      break;
    case 4:
      uint64_t result = 0x746E656449676F6CLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25B363ECC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25B36A79C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25B363EF4(uint64_t a1)
{
  unint64_t v2 = sub_25B3669A0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B363F30(uint64_t a1)
{
  unint64_t v2 = sub_25B3669A0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ReplicatorRecord.ID.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B341320);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25B3669A0();
  sub_25B3802C0();
  v8[15] = 0;
  sub_25B380140();
  if (!v1)
  {
    v8[14] = 1;
    sub_25B380140();
    v8[13] = 2;
    sub_25B380140();
    type metadata accessor for ReplicatorRecord.ID(0);
    v8[12] = 3;
    type metadata accessor for ReplicatorRecord.ID.Ownership(0);
    sub_25B366904(&qword_26B341318, (void (*)(uint64_t))type metadata accessor for ReplicatorRecord.ID.Ownership);
    sub_25B380160();
    v8[11] = 4;
    sub_25B380140();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t ReplicatorRecord.ID.hashValue.getter()
{
  return sub_25B380290();
}

uint64_t ReplicatorRecord.ID.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v25 = a2;
  uint64_t v23 = type metadata accessor for ReplicatorRecord.ID.Ownership(0);
  MEMORY[0x270FA5388](v23);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B341270);
  uint64_t v24 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388](v26);
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for ReplicatorRecord.ID(0);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (uint64_t *)((char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25B3669A0();
  uint64_t v10 = (uint64_t)v27;
  sub_25B3802B0();
  if (v10) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  v27 = a1;
  v22 = v4;
  uint64_t v11 = v24;
  uint64_t v12 = v25;
  char v32 = 0;
  *uint64_t v9 = sub_25B380090();
  v9[1] = v13;
  char v31 = 1;
  v9[2] = sub_25B380090();
  v9[3] = v14;
  char v30 = 2;
  v9[4] = sub_25B380090();
  v9[5] = v15;
  char v29 = 3;
  sub_25B366904(&qword_26B341098, (void (*)(uint64_t))type metadata accessor for ReplicatorRecord.ID.Ownership);
  uint64_t v16 = (uint64_t)v22;
  sub_25B3800B0();
  sub_25B3666D8(v16, (uint64_t)v9 + *(int *)(v7 + 28), type metadata accessor for ReplicatorRecord.ID.Ownership);
  char v28 = 4;
  uint64_t v18 = sub_25B380090();
  uint64_t v20 = v19;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v6, v26);
  v21 = (uint64_t *)((char *)v9 + *(int *)(v7 + 32));
  uint64_t *v21 = v18;
  v21[1] = v20;
  sub_25B366670((uint64_t)v9, v12, type metadata accessor for ReplicatorRecord.ID);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
  return sub_25B366740((uint64_t)v9, type metadata accessor for ReplicatorRecord.ID);
}

uint64_t sub_25B364638@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ReplicatorRecord.ID.init(from:)(a1, a2);
}

uint64_t sub_25B364650(void *a1)
{
  return ReplicatorRecord.ID.encode(to:)(a1);
}

uint64_t sub_25B364668()
{
  return sub_25B380290();
}

uint64_t sub_25B3646AC()
{
  return sub_25B380290();
}

uint64_t ReplicatorRecord.Value.data.getter()
{
  uint64_t v1 = *(void *)v0;
  sub_25B2E2B14(*(void *)v0, *(void *)(v0 + 8));
  return v1;
}

uint64_t ReplicatorRecord.Value.data.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_25B2CA2D8(*(void *)v2, *(void *)(v2 + 8));
  *(void *)uint64_t v2 = a1;
  *(void *)(v2 + 8) = a2;
  return result;
}

uint64_t (*ReplicatorRecord.Value.data.modify())()
{
  return nullsub_1;
}

uint64_t ReplicatorRecord.Value.url.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for ReplicatorRecord.Value(0);
  return sub_25B2E2FE0(v1 + *(int *)(v3 + 20), a1, &qword_26B340CE0);
}

uint64_t ReplicatorRecord.Value.url.setter(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for ReplicatorRecord.Value(0);
  return sub_25B31964C(a1, v1 + *(int *)(v3 + 20), &qword_26B340CE0);
}

uint64_t (*ReplicatorRecord.Value.url.modify())()
{
  return nullsub_1;
}

uint64_t ReplicatorRecord.id.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25B366670(v1, a1, type metadata accessor for ReplicatorRecord.ID);
}

uint64_t ReplicatorRecord.id.setter(uint64_t a1)
{
  return sub_25B3669F4(a1, v1, type metadata accessor for ReplicatorRecord.ID);
}

uint64_t (*ReplicatorRecord.id.modify())()
{
  return nullsub_1;
}

uint64_t ReplicatorRecord.version.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ReplicatorRecord(0) + 20);
  uint64_t v4 = sub_25B37F640();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t ReplicatorRecord.version.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ReplicatorRecord(0) + 20);
  uint64_t v4 = sub_25B37F640();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40);
  return v5(v3, a1, v4);
}

uint64_t (*ReplicatorRecord.version.modify())()
{
  return nullsub_1;
}

uint64_t ReplicatorRecord.values.getter()
{
  type metadata accessor for ReplicatorRecord(0);
  return swift_bridgeObjectRetain();
}

uint64_t ReplicatorRecord.expiration.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25B3638A4(type metadata accessor for ReplicatorRecord, (uint64_t)&qword_26B340F80, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_25B2E2FE0, a1);
}

uint64_t ReplicatorRecord.expiration.setter(uint64_t a1)
{
  return sub_25B36393C(a1, type metadata accessor for ReplicatorRecord, (uint64_t)&qword_26B340F80, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_25B31964C);
}

uint64_t (*ReplicatorRecord.expiration.modify())()
{
  return nullsub_1;
}

uint64_t ReplicatorRecord.options.getter@<X0>(void *a1@<X8>)
{
  uint64_t result = type metadata accessor for ReplicatorRecord(0);
  *a1 = *(void *)(v1 + *(int *)(result + 32));
  return result;
}

uint64_t ReplicatorRecord.options.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t result = type metadata accessor for ReplicatorRecord(0);
  *(void *)(v1 + *(int *)(result + 32)) = v2;
  return result;
}

uint64_t (*ReplicatorRecord.options.modify())()
{
  return nullsub_1;
}

uint64_t ReplicatorRecord.init(id:version:values:expiration:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v28 = a4;
  uint64_t v29 = a3;
  uint64_t v26 = a2;
  uint64_t v27 = a1;
  uint64_t v30 = a5;
  uint64_t v7 = type metadata accessor for ReplicatorRecord(0);
  uint64_t v8 = (int *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B340F80);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_25B37F640();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = type metadata accessor for ReplicatorRecord.ID(0);
  MEMORY[0x270FA5388](v18 - 8);
  uint64_t v20 = (char *)&v25 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25B366670(a1, (uint64_t)v20, type metadata accessor for ReplicatorRecord.ID);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, a2, v14);
  uint64_t v21 = v28;
  sub_25B2E2FE0(v28, (uint64_t)v13, &qword_26B340F80);
  uint64_t v22 = (uint64_t)&v10[v8[9]];
  uint64_t v23 = sub_25B37F5D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v22, 1, 1, v23);
  sub_25B3666D8((uint64_t)v20, (uint64_t)v10, type metadata accessor for ReplicatorRecord.ID);
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(&v10[v8[7]], v17, v14);
  *(void *)&v10[v8[8]] = v29;
  sub_25B31964C((uint64_t)v13, v22, &qword_26B340F80);
  *(void *)&v10[v8[10]] = 0;
  sub_25B3666D8((uint64_t)v10, v30, type metadata accessor for ReplicatorRecord);
  sub_25B2E344C(v21, &qword_26B340F80);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v26, v14);
  return sub_25B366740(v27, type metadata accessor for ReplicatorRecord.ID);
}

uint64_t ReplicatorRecord.description.getter()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B340F80);
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = 0;
  unint64_t v8 = 0xE000000000000000;
  sub_25B37FE70();
  swift_bridgeObjectRelease();
  uint64_t v7 = 540697705;
  unint64_t v8 = 0xE400000000000000;
  ReplicatorRecord.ID.description.getter();
  sub_25B37FA40();
  swift_bridgeObjectRelease();
  sub_25B37FA40();
  uint64_t v4 = type metadata accessor for ReplicatorRecord(0);
  sub_25B37F640();
  sub_25B366904((unint64_t *)&qword_26A4EC110, MEMORY[0x263F07508]);
  sub_25B380190();
  sub_25B37FA40();
  swift_bridgeObjectRelease();
  sub_25B37FA40();
  sub_25B2E2FE0(v0 + *(int *)(v4 + 28), (uint64_t)v3, &qword_26B340F80);
  sub_25B37F9E0();
  sub_25B37FA40();
  swift_bridgeObjectRelease();
  sub_25B37FA40();
  v6[1] = *(void *)(v0 + *(int *)(v4 + 32));
  sub_25B37F9E0();
  sub_25B37FA40();
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t ReplicatorRecord.highestCompatibleValue(for:)@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  long long v20 = *a1;
  uint64_t v4 = ReplicatorRecord.highestCompatibleValueVersion(for:)((unint64_t *)&v20);
  if ((v5 & 1) == 0
    && (uint64_t v6 = v4,
        uint64_t v7 = *(void *)(v2 + *(int *)(type metadata accessor for ReplicatorRecord(0) + 24)),
        *(void *)(v7 + 16))
    && (unint64_t v8 = sub_25B2D5F28(v6), (v9 & 1) != 0))
  {
    unint64_t v10 = v8;
    uint64_t v11 = *(void *)(v7 + 56);
    uint64_t v12 = type metadata accessor for ReplicatorRecord.Value(0);
    uint64_t v19 = *(void *)(v12 - 8);
    sub_25B366670(v11 + *(void *)(v19 + 72) * v10, a2, type metadata accessor for ReplicatorRecord.Value);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 56);
    uint64_t v14 = a2;
    uint64_t v15 = 0;
    uint64_t v16 = v12;
  }
  else
  {
    uint64_t v17 = type metadata accessor for ReplicatorRecord.Value(0);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56);
    uint64_t v16 = v17;
    uint64_t v14 = a2;
    uint64_t v15 = 1;
  }
  return v13(v14, v15, 1, v16);
}

uint64_t ReplicatorRecord.highestCompatibleValueVersion(for:)(unint64_t *a1)
{
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B340D98);
  uint64_t v3 = MEMORY[0x270FA5388](v60);
  v59 = (uint64_t *)((char *)&v49 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  v58 = (uint64_t *)((char *)&v49 - v6);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  v57 = (uint64_t *)((char *)&v49 - v8);
  MEMORY[0x270FA5388](v7);
  v56 = (char *)&v49 - v9;
  unint64_t v10 = *a1;
  unint64_t v50 = a1[1];
  unint64_t v51 = v10;
  uint64_t v11 = *(void *)(v1 + *(int *)(type metadata accessor for ReplicatorRecord(0) + 24));
  int64_t v12 = *(void *)(v11 + 16);
  uint64_t v13 = MEMORY[0x263F8EE78];
  if (!v12)
  {
LABEL_26:
    uint64_t v61 = v13;
    swift_bridgeObjectRetain();
    sub_25B3656A0(&v61);
    swift_bridgeObjectRelease();
    uint64_t v42 = *(void *)(v61 + 16);
    if (v42)
    {
      v43 = (unint64_t *)(v61 + 32);
      while (1)
      {
        unint64_t v45 = *v43++;
        unint64_t v44 = v45;
        if (v45 >= v50 && v51 >= v44) {
          break;
        }
        if (!--v42)
        {
          unint64_t v44 = 0;
          break;
        }
      }
    }
    else
    {
      unint64_t v44 = 0;
    }
    swift_release();
    return v44;
  }
  uint64_t v61 = MEMORY[0x263F8EE78];
  swift_bridgeObjectRetain();
  sub_25B310BC4(0, v12, 0);
  uint64_t v15 = sub_25B3661D8(v11);
  uint64_t v16 = 0;
  uint64_t v17 = v11 + 64;
  char v18 = *(unsigned char *)(v11 + 32);
  uint64_t v49 = v11 + 88;
  uint64_t v54 = v11 + 64;
  uint64_t v55 = v11;
  int64_t v52 = v12;
  uint64_t v53 = v14;
  while ((v15 & 0x8000000000000000) == 0 && v15 < 1 << v18)
  {
    unint64_t v21 = (unint64_t)v15 >> 6;
    if ((*(void *)(v17 + 8 * ((unint64_t)v15 >> 6)) & (1 << v15)) == 0) {
      goto LABEL_40;
    }
    if (*(_DWORD *)(v11 + 36) != v14) {
      goto LABEL_41;
    }
    uint64_t v22 = v60;
    uint64_t v23 = v56;
    uint64_t v24 = (uint64_t)&v56[*(int *)(v60 + 48)];
    uint64_t v25 = *(void *)(v11 + 48);
    uint64_t v26 = *(void *)(v11 + 56);
    uint64_t v27 = *(void *)(v25 + 8 * v15);
    uint64_t v28 = type metadata accessor for ReplicatorRecord.Value(0);
    sub_25B366670(v26 + *(void *)(*(void *)(v28 - 8) + 72) * v15, v24, type metadata accessor for ReplicatorRecord.Value);
    *uint64_t v23 = v27;
    uint64_t v29 = (uint64_t)v57;
    void *v57 = v27;
    sub_25B366670(v24, v29 + *(int *)(v22 + 48), type metadata accessor for ReplicatorRecord.Value);
    uint64_t v30 = v58;
    sub_25B361938(v29, (uint64_t)v58);
    sub_25B2E344C((uint64_t)v23, &qword_26B340D98);
    uint64_t v31 = *(int *)(v22 + 48);
    char v32 = v59;
    uint64_t v33 = (uint64_t)v59 + v31;
    uint64_t v34 = *v30;
    uint64_t *v59 = *v30;
    sub_25B366670((uint64_t)v30 + v31, (uint64_t)v32 + v31, type metadata accessor for ReplicatorRecord.Value);
    sub_25B366740(v33, type metadata accessor for ReplicatorRecord.Value);
    sub_25B2E344C((uint64_t)v30, &qword_26B340D98);
    uint64_t v13 = v61;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_25B310BC4(0, *(void *)(v13 + 16) + 1, 1);
      uint64_t v13 = v61;
    }
    unint64_t v36 = *(void *)(v13 + 16);
    unint64_t v35 = *(void *)(v13 + 24);
    if (v36 >= v35 >> 1)
    {
      sub_25B310BC4(v35 > 1, v36 + 1, 1);
      uint64_t v13 = v61;
    }
    *(void *)(v13 + 16) = v36 + 1;
    *(void *)(v13 + 8 * v36 + 32) = v34;
    uint64_t v11 = v55;
    char v18 = *(unsigned char *)(v55 + 32);
    unint64_t v19 = 1 << v18;
    if (v15 >= 1 << v18) {
      goto LABEL_42;
    }
    uint64_t v17 = v54;
    uint64_t v37 = *(void *)(v54 + 8 * v21);
    if ((v37 & (1 << v15)) == 0) {
      goto LABEL_43;
    }
    LODWORD(v14) = v53;
    if (*(_DWORD *)(v55 + 36) != v53) {
      goto LABEL_44;
    }
    unint64_t v38 = v37 & (-2 << (v15 & 0x3F));
    if (v38)
    {
      unint64_t v19 = __clz(__rbit64(v38)) | v15 & 0xFFFFFFFFFFFFFFC0;
      int64_t v20 = v52;
    }
    else
    {
      unint64_t v39 = v21 + 1;
      unint64_t v40 = (v19 + 63) >> 6;
      int64_t v20 = v52;
      if (v21 + 1 < v40)
      {
        unint64_t v41 = *(void *)(v54 + 8 * v39);
        if (!v41)
        {
          unint64_t v39 = v21 + 2;
          if (v21 + 2 >= v40) {
            goto LABEL_4;
          }
          unint64_t v41 = *(void *)(v54 + 8 * v39);
          if (!v41)
          {
            while (v40 - 3 != v21)
            {
              unint64_t v41 = *(void *)(v49 + 8 * v21++);
              if (v41)
              {
                unint64_t v39 = v21 + 2;
                goto LABEL_19;
              }
            }
            goto LABEL_4;
          }
        }
LABEL_19:
        unint64_t v19 = __clz(__rbit64(v41)) + (v39 << 6);
      }
    }
LABEL_4:
    ++v16;
    uint64_t v15 = v19;
    if (v16 == v20)
    {
      swift_bridgeObjectRelease();
      goto LABEL_26;
    }
  }
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
LABEL_44:
  __break(1u);
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

uint64_t sub_25B365668@<X0>(uint64_t a1@<X8>)
{
  return sub_25B366670(v1, a1, type metadata accessor for ReplicatorRecord.ID);
}

uint64_t sub_25B3656A0(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_25B366260(v2);
  }
  uint64_t v3 = *(void *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  uint64_t result = sub_25B36570C(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_25B36570C(void *a1)
{
  uint64_t v2 = a1;
  uint64_t v3 = a1[1];
  uint64_t result = sub_25B380180();
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_137;
    }
    if ((unint64_t)v3 >= 2)
    {
      uint64_t v78 = 0;
      uint64_t v79 = *v2;
      for (uint64_t i = 1; i != v3; ++i)
      {
        unint64_t v81 = *(void *)(v79 + 8 * i);
        uint64_t v82 = v78;
        do
        {
          unint64_t v83 = *(void *)(v79 + v82);
          if (v83 >= v81) {
            break;
          }
          if (!v79) {
            goto LABEL_141;
          }
          *(void *)(v79 + v82 + 8) = v83;
          *(void *)(v79 + v82) = v81;
          v82 -= 8;
        }
        while (v82 != -8);
        v78 += 8;
      }
    }
    return result;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_146;
  }
  uint64_t v95 = result;
  uint64_t v96 = v3;
  if (v3 < 2)
  {
    uint64_t v8 = MEMORY[0x263F8EE78];
    __dst = (char *)(MEMORY[0x263F8EE78] + 32);
    if (v3 != 1)
    {
      unint64_t v12 = *(void *)(MEMORY[0x263F8EE78] + 16);
      uint64_t v11 = (char *)MEMORY[0x263F8EE78];
LABEL_103:
      uint64_t v94 = v8;
      if (v12 >= 2)
      {
        uint64_t v84 = *v2;
        do
        {
          unint64_t v85 = v12 - 2;
          if (v12 < 2) {
            goto LABEL_132;
          }
          if (!v84) {
            goto LABEL_145;
          }
          v86 = v11;
          v87 = v11 + 32;
          uint64_t v88 = *(void *)&v11[16 * v85 + 32];
          uint64_t v89 = *(void *)&v11[16 * v12 + 24];
          sub_25B365D98((char *)(v84 + 8 * v88), (char *)(v84 + 8 * *(void *)&v87[16 * v12 - 16]), v84 + 8 * v89, __dst);
          if (v1) {
            break;
          }
          if (v89 < v88) {
            goto LABEL_133;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            v86 = sub_25B3661C0((uint64_t)v86);
          }
          if (v85 >= *((void *)v86 + 2)) {
            goto LABEL_134;
          }
          v90 = &v86[16 * v85 + 32];
          *(void *)v90 = v88;
          *((void *)v90 + 1) = v89;
          unint64_t v91 = *((void *)v86 + 2);
          if (v12 > v91) {
            goto LABEL_135;
          }
          memmove(&v86[16 * v12 + 16], &v86[16 * v12 + 32], 16 * (v91 - v12));
          uint64_t v11 = v86;
          *((void *)v86 + 2) = v91 - 1;
          unint64_t v12 = v91 - 1;
        }
        while (v91 > 2);
      }
LABEL_114:
      swift_bridgeObjectRelease();
      *(void *)(v94 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v94 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    uint64_t v7 = sub_25B37FB40();
    *(void *)(v7 + 16) = v6;
    uint64_t v3 = v96;
    uint64_t v94 = v7;
    __dst = (char *)(v7 + 32);
  }
  uint64_t v9 = 0;
  uint64_t v10 = *v2;
  v92 = v2;
  uint64_t v93 = *v2 - 8;
  uint64_t v11 = (char *)MEMORY[0x263F8EE78];
  uint64_t v97 = *v2;
  while (1)
  {
    uint64_t v13 = v9++;
    if (v9 < v3)
    {
      unint64_t v14 = *(void *)(v10 + 8 * v9);
      unint64_t v15 = *(void *)(v10 + 8 * v13);
      uint64_t v9 = v13 + 2;
      if (v13 + 2 < v3)
      {
        unint64_t v16 = v14;
        while (1)
        {
          unint64_t v17 = *(void *)(v10 + 8 * v9);
          if (v15 < v14 == v16 >= v17) {
            break;
          }
          ++v9;
          unint64_t v16 = v17;
          if (v3 == v9)
          {
            uint64_t v9 = v3;
            break;
          }
        }
      }
      if (v15 < v14)
      {
        if (v9 < v13) {
          goto LABEL_138;
        }
        if (v13 < v9)
        {
          uint64_t v18 = v9 - 1;
          uint64_t v19 = v13;
          do
          {
            if (v19 != v18)
            {
              if (!v10) {
                goto LABEL_144;
              }
              uint64_t v20 = *(void *)(v10 + 8 * v19);
              *(void *)(v10 + 8 * v19) = *(void *)(v10 + 8 * v18);
              *(void *)(v10 + 8 * v18) = v20;
            }
            BOOL v59 = ++v19 < v18--;
          }
          while (v59);
        }
      }
    }
    if (v9 >= v3) {
      goto LABEL_47;
    }
    if (__OFSUB__(v9, v13)) {
      goto LABEL_136;
    }
    if (v9 - v13 >= v95) {
      goto LABEL_47;
    }
    uint64_t v21 = v13 + v95;
    if (__OFADD__(v13, v95)) {
      goto LABEL_139;
    }
    if (v21 >= v3) {
      uint64_t v21 = v3;
    }
    if (v21 < v13) {
      break;
    }
    if (v9 != v21)
    {
      uint64_t v22 = (unint64_t *)(v93 + 8 * v9);
      do
      {
        unint64_t v23 = *(void *)(v10 + 8 * v9);
        uint64_t v24 = v13;
        uint64_t v25 = v22;
        do
        {
          unint64_t v26 = *v25;
          if (*v25 >= v23) {
            break;
          }
          if (!v10) {
            goto LABEL_142;
          }
          *uint64_t v25 = v23;
          v25[1] = v26;
          --v25;
          ++v24;
        }
        while (v9 != v24);
        ++v9;
        ++v22;
      }
      while (v9 != v21);
      uint64_t v9 = v21;
    }
LABEL_47:
    if (v9 < v13) {
      goto LABEL_131;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v11 = sub_25B366008(0, *((void *)v11 + 2) + 1, 1, v11);
    }
    unint64_t v28 = *((void *)v11 + 2);
    unint64_t v27 = *((void *)v11 + 3);
    unint64_t v12 = v28 + 1;
    uint64_t v10 = v97;
    if (v28 >= v27 >> 1)
    {
      v77 = sub_25B366008((char *)(v27 > 1), v28 + 1, 1, v11);
      uint64_t v10 = v97;
      uint64_t v11 = v77;
    }
    *((void *)v11 + 2) = v12;
    uint64_t v29 = v11 + 32;
    uint64_t v30 = &v11[16 * v28 + 32];
    *(void *)uint64_t v30 = v13;
    *((void *)v30 + 1) = v9;
    if (v28)
    {
      while (1)
      {
        unint64_t v31 = v12 - 1;
        if (v12 >= 4)
        {
          unint64_t v36 = &v29[16 * v12];
          uint64_t v37 = *((void *)v36 - 8);
          uint64_t v38 = *((void *)v36 - 7);
          BOOL v42 = __OFSUB__(v38, v37);
          uint64_t v39 = v38 - v37;
          if (v42) {
            goto LABEL_120;
          }
          uint64_t v41 = *((void *)v36 - 6);
          uint64_t v40 = *((void *)v36 - 5);
          BOOL v42 = __OFSUB__(v40, v41);
          uint64_t v34 = v40 - v41;
          char v35 = v42;
          if (v42) {
            goto LABEL_121;
          }
          unint64_t v43 = v12 - 2;
          unint64_t v44 = &v29[16 * v12 - 32];
          uint64_t v46 = *(void *)v44;
          uint64_t v45 = *((void *)v44 + 1);
          BOOL v42 = __OFSUB__(v45, v46);
          uint64_t v47 = v45 - v46;
          if (v42) {
            goto LABEL_123;
          }
          BOOL v42 = __OFADD__(v34, v47);
          uint64_t v48 = v34 + v47;
          if (v42) {
            goto LABEL_126;
          }
          if (v48 >= v39)
          {
            v66 = &v29[16 * v31];
            uint64_t v68 = *(void *)v66;
            uint64_t v67 = *((void *)v66 + 1);
            BOOL v42 = __OFSUB__(v67, v68);
            uint64_t v69 = v67 - v68;
            if (v42) {
              goto LABEL_130;
            }
            BOOL v59 = v34 < v69;
            goto LABEL_84;
          }
        }
        else
        {
          if (v12 != 3)
          {
            uint64_t v60 = *((void *)v11 + 4);
            uint64_t v61 = *((void *)v11 + 5);
            BOOL v42 = __OFSUB__(v61, v60);
            uint64_t v53 = v61 - v60;
            char v54 = v42;
            goto LABEL_78;
          }
          uint64_t v33 = *((void *)v11 + 4);
          uint64_t v32 = *((void *)v11 + 5);
          BOOL v42 = __OFSUB__(v32, v33);
          uint64_t v34 = v32 - v33;
          char v35 = v42;
        }
        if (v35) {
          goto LABEL_122;
        }
        unint64_t v43 = v12 - 2;
        uint64_t v49 = &v29[16 * v12 - 32];
        uint64_t v51 = *(void *)v49;
        uint64_t v50 = *((void *)v49 + 1);
        BOOL v52 = __OFSUB__(v50, v51);
        uint64_t v53 = v50 - v51;
        char v54 = v52;
        if (v52) {
          goto LABEL_125;
        }
        uint64_t v55 = &v29[16 * v31];
        uint64_t v57 = *(void *)v55;
        uint64_t v56 = *((void *)v55 + 1);
        BOOL v42 = __OFSUB__(v56, v57);
        uint64_t v58 = v56 - v57;
        if (v42) {
          goto LABEL_128;
        }
        if (__OFADD__(v53, v58)) {
          goto LABEL_129;
        }
        if (v53 + v58 >= v34)
        {
          BOOL v59 = v34 < v58;
LABEL_84:
          if (v59) {
            unint64_t v31 = v43;
          }
          goto LABEL_86;
        }
LABEL_78:
        if (v54) {
          goto LABEL_124;
        }
        v62 = &v29[16 * v31];
        uint64_t v64 = *(void *)v62;
        uint64_t v63 = *((void *)v62 + 1);
        BOOL v42 = __OFSUB__(v63, v64);
        uint64_t v65 = v63 - v64;
        if (v42) {
          goto LABEL_127;
        }
        if (v65 < v53) {
          goto LABEL_15;
        }
LABEL_86:
        unint64_t v70 = v31 - 1;
        if (v31 - 1 >= v12)
        {
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
          goto LABEL_140;
        }
        if (!v10) {
          goto LABEL_143;
        }
        v71 = &v29[16 * v70];
        uint64_t v72 = *(void *)v71;
        v73 = v29;
        v74 = &v29[16 * v31];
        uint64_t v75 = *((void *)v74 + 1);
        sub_25B365D98((char *)(v10 + 8 * *(void *)v71), (char *)(v10 + 8 * *(void *)v74), v10 + 8 * v75, __dst);
        if (v1) {
          goto LABEL_114;
        }
        if (v75 < v72) {
          goto LABEL_117;
        }
        if (v31 > *((void *)v11 + 2)) {
          goto LABEL_118;
        }
        *(void *)v71 = v72;
        *(void *)&v73[16 * v70 + 8] = v75;
        unint64_t v76 = *((void *)v11 + 2);
        if (v31 >= v76) {
          goto LABEL_119;
        }
        unint64_t v12 = v76 - 1;
        memmove(v74, v74 + 16, 16 * (v76 - 1 - v31));
        uint64_t v29 = v73;
        *((void *)v11 + 2) = v76 - 1;
        uint64_t v10 = v97;
        if (v76 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v12 = 1;
LABEL_15:
    uint64_t v3 = v96;
    if (v9 >= v96)
    {
      uint64_t v8 = v94;
      uint64_t v2 = v92;
      goto LABEL_103;
    }
  }
LABEL_140:
  __break(1u);
LABEL_141:
  __break(1u);
LABEL_142:
  __break(1u);
LABEL_143:
  __break(1u);
LABEL_144:
  __break(1u);
LABEL_145:
  __break(1u);
LABEL_146:
  uint64_t result = sub_25B37FF80();
  __break(1u);
  return result;
}

uint64_t sub_25B365D98(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = a2 - __src + 7;
  if (a2 - __src >= 0) {
    int64_t v9 = a2 - __src;
  }
  uint64_t v10 = v9 >> 3;
  uint64_t v11 = a3 - (void)a2;
  uint64_t v12 = a3 - (void)a2 + 7;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v12 = a3 - (void)a2;
  }
  uint64_t v13 = v12 >> 3;
  uint64_t v24 = __src;
  unint64_t v23 = __dst;
  if (v10 >= v12 >> 3)
  {
    if (v11 >= -7)
    {
      if (__dst != a2 || &a2[8 * v13] <= __dst) {
        memmove(__dst, a2, 8 * v13);
      }
      unint64_t v16 = &v4[8 * v13];
      uint64_t v22 = v16;
      uint64_t v24 = v6;
      if (v7 < v6 && v11 >= 8)
      {
        unint64_t v17 = (unint64_t *)(a3 - 8);
        while (1)
        {
          uint64_t v18 = (char *)(v17 + 1);
          uint64_t v19 = v6 - 8;
          unint64_t v20 = *((void *)v6 - 1);
          if (v20 >= *((void *)v16 - 1))
          {
            uint64_t v22 = v16 - 8;
            if (v18 < v16 || v17 >= (unint64_t *)v16 || v18 != v16) {
              unint64_t *v17 = *((void *)v16 - 1);
            }
            v16 -= 8;
            if (v6 <= v7) {
              goto LABEL_42;
            }
          }
          else
          {
            if (v18 != v6 || v17 >= (unint64_t *)v6) {
              unint64_t *v17 = v20;
            }
            uint64_t v24 = v6 - 8;
            v6 -= 8;
            if (v19 <= v7) {
              goto LABEL_42;
            }
          }
          --v17;
          if (v16 <= v4) {
            goto LABEL_42;
          }
        }
      }
      goto LABEL_42;
    }
  }
  else if (v8 >= -7)
  {
    if (__dst != __src || &__src[8 * v10] <= __dst) {
      memmove(__dst, __src, 8 * v10);
    }
    unint64_t v14 = &v4[8 * v10];
    uint64_t v22 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 8)
    {
      do
      {
        if (*(void *)v4 >= *(void *)v6)
        {
          if (v7 != v4) {
            *(void *)uint64_t v7 = *(void *)v4;
          }
          v4 += 8;
          unint64_t v23 = v4;
          unint64_t v15 = v6;
        }
        else
        {
          unint64_t v15 = v6 + 8;
          if (v7 < v6 || v7 >= v15 || v7 != v6) {
            *(void *)uint64_t v7 = *(void *)v6;
          }
        }
        v7 += 8;
        if (v4 >= v14) {
          break;
        }
        uint64_t v6 = v15;
      }
      while ((unint64_t)v15 < a3);
      uint64_t v24 = v7;
    }
LABEL_42:
    sub_25B366104((void **)&v24, (const void **)&v23, &v22);
    return 1;
  }
  uint64_t result = sub_25B37FFD0();
  __break(1u);
  return result;
}

char *sub_25B366008(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ECA00);
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
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_25B366104(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 7;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -8)
  {
    uint64_t result = (char *)sub_25B37FFD0();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
    {
      return (char *)memmove(result, v3, 8 * v7);
    }
  }
  return result;
}

char *sub_25B3661C0(uint64_t a1)
{
  return sub_25B366008(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_25B3661D8(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t sub_25B366260(uint64_t a1)
{
  return sub_25B311144(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t _s18ReplicatorServices0A6RecordV2IDV9OwnershipO2eeoiySbAG_AGtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25B37F640();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for ReplicatorRecord.ID.Ownership(0);
  MEMORY[0x270FA5388](v8 - 8);
  unint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B341530);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  unint64_t v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = (uint64_t)&v14[*(int *)(v12 + 56)];
  sub_25B366670(a1, (uint64_t)v14, type metadata accessor for ReplicatorRecord.ID.Ownership);
  sub_25B366670(a2, v15, type metadata accessor for ReplicatorRecord.ID.Ownership);
  unint64_t v16 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (v16((uint64_t)v14, 1, v4) != 1)
  {
    sub_25B366670((uint64_t)v14, (uint64_t)v10, type metadata accessor for ReplicatorRecord.ID.Ownership);
    if (v16(v15, 1, v4) != 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v7, v15, v4);
      char v17 = sub_25B37F610();
      uint64_t v18 = *(void (**)(char *, uint64_t))(v5 + 8);
      v18(v7, v4);
      v18(v10, v4);
      sub_25B366740((uint64_t)v14, type metadata accessor for ReplicatorRecord.ID.Ownership);
      return v17 & 1;
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    goto LABEL_6;
  }
  if (v16(v15, 1, v4) != 1)
  {
LABEL_6:
    sub_25B2E344C((uint64_t)v14, &qword_26B341530);
    char v17 = 0;
    return v17 & 1;
  }
  sub_25B366740((uint64_t)v14, type metadata accessor for ReplicatorRecord.ID.Ownership);
  char v17 = 1;
  return v17 & 1;
}

uint64_t _s18ReplicatorServices0A6RecordV2IDV2eeoiySbAE_AEtFZ_0(void *a1, void *a2)
{
  BOOL v4 = *a1 == *a2 && a1[1] == a2[1];
  if (v4 || (v5 = sub_25B3801A0(), uint64_t result = 0, (v5 & 1) != 0))
  {
    BOOL v7 = a1[2] == a2[2] && a1[3] == a2[3];
    if (v7 || (v8 = sub_25B3801A0(), uint64_t result = 0, (v8 & 1) != 0))
    {
      if (a1[4] == a2[4] && a1[5] == a2[5] || (v9 = sub_25B3801A0(), uint64_t result = 0, (v9 & 1) != 0))
      {
        uint64_t v10 = type metadata accessor for ReplicatorRecord.ID(0);
        if (_s18ReplicatorServices0A6RecordV2IDV9OwnershipO2eeoiySbAG_AGtFZ_0((uint64_t)a1 + *(int *)(v10 + 28), (uint64_t)a2 + *(int *)(v10 + 28)))
        {
          uint64_t v11 = *(int *)(v10 + 32);
          uint64_t v12 = *(void *)((char *)a1 + v11);
          uint64_t v13 = *(void *)((char *)a1 + v11 + 8);
          unint64_t v14 = (void *)((char *)a2 + v11);
          if (v12 == *v14 && v13 == v14[1])
          {
            return 1;
          }
          else
          {
            return sub_25B3801A0();
          }
        }
        else
        {
          return 0;
        }
      }
    }
  }
  return result;
}

uint64_t sub_25B366670(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25B3666D8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_25B366740(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t type metadata accessor for ReplicatorRecord.ID.Ownership(uint64_t a1)
{
  return sub_25B31FF48(a1, (uint64_t *)&unk_26B341520);
}

uint64_t sub_25B3667C0(uint64_t result)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    sub_25B37FA30();
    return sub_25B37FA60();
  }
  return result;
}

unint64_t sub_25B36685C()
{
  unint64_t result = qword_26B341058;
  if (!qword_26B341058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B341058);
  }
  return result;
}

unint64_t sub_25B3668B0()
{
  unint64_t result = qword_26A4EC9B8;
  if (!qword_26A4EC9B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4EC9B8);
  }
  return result;
}

uint64_t sub_25B366904(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_25B36694C()
{
  unint64_t result = qword_26B341070;
  if (!qword_26B341070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B341070);
  }
  return result;
}

unint64_t sub_25B3669A0()
{
  unint64_t result = qword_26B341038;
  if (!qword_26B341038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B341038);
  }
  return result;
}

uint64_t sub_25B3669F4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

unint64_t sub_25B366A60()
{
  unint64_t result = qword_26A4EC9C0;
  if (!qword_26A4EC9C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4EC9C0);
  }
  return result;
}

unint64_t sub_25B366AB8()
{
  unint64_t result = qword_26A4EC9C8;
  if (!qword_26A4EC9C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4EC9C8);
  }
  return result;
}

unint64_t sub_25B366B10()
{
  unint64_t result = qword_26A4EC9D0;
  if (!qword_26A4EC9D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4EC9D0);
  }
  return result;
}

unint64_t sub_25B366B68()
{
  unint64_t result = qword_26A4EC9D8;
  if (!qword_26A4EC9D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4EC9D8);
  }
  return result;
}

uint64_t sub_25B366BBC()
{
  return sub_25B366904(&qword_26A4EC9E0, (void (*)(uint64_t))type metadata accessor for ReplicatorRecord.ID.Ownership);
}

uint64_t sub_25B366C04()
{
  return sub_25B366904(&qword_26B341538, (void (*)(uint64_t))type metadata accessor for ReplicatorRecord.ID);
}

uint64_t sub_25B366C4C()
{
  return sub_25B366904(&qword_26B341368, (void (*)(uint64_t))type metadata accessor for ReplicatorRecord.ID);
}

uint64_t *initializeBufferWithCopyOfBuffer for ReplicatorRecord(uint64_t *a1, uint64_t *a2, int *a3)
{
  BOOL v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *BOOL v4 = *a2;
    BOOL v4 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = a2[1];
    *a1 = *a2;
    a1[1] = v6;
    uint64_t v7 = a2[3];
    a1[2] = a2[2];
    a1[3] = v7;
    uint64_t v8 = a2[5];
    a1[4] = a2[4];
    a1[5] = v8;
    uint64_t v9 = type metadata accessor for ReplicatorRecord.ID(0);
    uint64_t v10 = *(int *)(v9 + 28);
    __dst = (char *)v4 + v10;
    uint64_t v34 = v9;
    uint64_t v11 = (char *)a2 + v10;
    uint64_t v12 = sub_25B37F640();
    uint64_t v13 = *(void *)(v12 - 8);
    unint64_t v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v14(v11, 1, v12))
    {
      uint64_t v15 = type metadata accessor for ReplicatorRecord.ID.Ownership(0);
      memcpy(__dst, v11, *(void *)(*(void *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(__dst, v11, v12);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(__dst, 0, 1, v12);
    }
    uint64_t v17 = *(int *)(v34 + 32);
    uint64_t v18 = (uint64_t *)((char *)v4 + v17);
    uint64_t v19 = (uint64_t *)((char *)a2 + v17);
    uint64_t v20 = v19[1];
    *uint64_t v18 = *v19;
    v18[1] = v20;
    uint64_t v21 = a3[5];
    uint64_t v22 = (char *)v4 + v21;
    unint64_t v23 = (char *)a2 + v21;
    uint64_t v24 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
    swift_bridgeObjectRetain();
    v24(v22, v23, v12);
    uint64_t v25 = a3[7];
    *(uint64_t *)((char *)v4 + a3[6]) = *(uint64_t *)((char *)a2 + a3[6]);
    unint64_t v26 = (char *)v4 + v25;
    unint64_t v27 = (char *)a2 + v25;
    uint64_t v28 = sub_25B37F5D0();
    uint64_t v29 = *(void *)(v28 - 8);
    uint64_t v30 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48);
    swift_bridgeObjectRetain();
    if (v30(v27, 1, v28))
    {
      uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B340F80);
      memcpy(v26, v27, *(void *)(*(void *)(v31 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v26, v27, v28);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v26, 0, 1, v28);
    }
    *(uint64_t *)((char *)v4 + a3[8]) = *(uint64_t *)((char *)a2 + a3[8]);
  }
  return v4;
}

uint64_t destroy for ReplicatorRecord(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(type metadata accessor for ReplicatorRecord.ID(0) + 28);
  uint64_t v5 = sub_25B37F640();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1 + *(int *)(a2 + 20), v5);
  swift_bridgeObjectRelease();
  uint64_t v7 = a1 + *(int *)(a2 + 28);
  uint64_t v8 = sub_25B37F5D0();
  uint64_t v11 = *(void *)(v8 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v7, 1, v8);
  if (!result)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(v11 + 8);
    return v10(v7, v8);
  }
  return result;
}

void *initializeWithCopy for ReplicatorRecord(void *a1, void *a2, int *a3)
{
  uint64_t v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  uint64_t v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  uint64_t v7 = a2[5];
  a1[4] = a2[4];
  a1[5] = v7;
  uint64_t v8 = type metadata accessor for ReplicatorRecord.ID(0);
  uint64_t v9 = *(int *)(v8 + 28);
  __dst = (char *)a1 + v9;
  uint64_t v32 = v8;
  uint64_t v10 = (char *)a2 + v9;
  uint64_t v11 = sub_25B37F640();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v13(v10, 1, v11))
  {
    uint64_t v14 = type metadata accessor for ReplicatorRecord.ID.Ownership(0);
    memcpy(__dst, v10, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(__dst, v10, v11);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(__dst, 0, 1, v11);
  }
  uint64_t v15 = *(int *)(v32 + 32);
  uint64_t v16 = (void *)((char *)a1 + v15);
  uint64_t v17 = (void *)((char *)a2 + v15);
  uint64_t v18 = v17[1];
  *uint64_t v16 = *v17;
  v16[1] = v18;
  uint64_t v19 = a3[5];
  uint64_t v20 = (char *)a1 + v19;
  uint64_t v21 = (char *)a2 + v19;
  uint64_t v22 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
  swift_bridgeObjectRetain();
  v22(v20, v21, v11);
  uint64_t v23 = a3[7];
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  uint64_t v24 = (char *)a1 + v23;
  uint64_t v25 = (char *)a2 + v23;
  uint64_t v26 = sub_25B37F5D0();
  uint64_t v27 = *(void *)(v26 - 8);
  uint64_t v28 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48);
  swift_bridgeObjectRetain();
  if (v28(v25, 1, v26))
  {
    uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B340F80);
    memcpy(v24, v25, *(void *)(*(void *)(v29 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v24, v25, v26);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v27 + 56))(v24, 0, 1, v26);
  }
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  return a1;
}

char *assignWithCopy for ReplicatorRecord(char *a1, char *a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = *((void *)a2 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)a1 + 2) = *((void *)a2 + 2);
  *((void *)a1 + 3) = *((void *)a2 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)a1 + 4) = *((void *)a2 + 4);
  *((void *)a1 + 5) = *((void *)a2 + 5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v5 = type metadata accessor for ReplicatorRecord.ID(0);
  uint64_t v6 = *(int *)(v5 + 28);
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_25B37F640();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    uint64_t v14 = type metadata accessor for ReplicatorRecord.ID.Ownership(0);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  uint64_t v15 = *(int *)(v5 + 32);
  uint64_t v16 = &a1[v15];
  uint64_t v17 = &a2[v15];
  *(void *)uint64_t v16 = *(void *)v17;
  *((void *)v16 + 1) = *((void *)v17 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, char *, uint64_t))(v10 + 24))(&a1[a3[5]], &a2[a3[5]], v9);
  *(void *)&a1[a3[6]] = *(void *)&a2[a3[6]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v18 = a3[7];
  uint64_t v19 = &a1[v18];
  uint64_t v20 = &a2[v18];
  uint64_t v21 = sub_25B37F5D0();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v22 + 48);
  int v24 = v23(v19, 1, v21);
  int v25 = v23(v20, 1, v21);
  if (!v24)
  {
    if (!v25)
    {
      (*(void (**)(char *, char *, uint64_t))(v22 + 24))(v19, v20, v21);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v22 + 8))(v19, v21);
    goto LABEL_12;
  }
  if (v25)
  {
LABEL_12:
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B340F80);
    memcpy(v19, v20, *(void *)(*(void *)(v26 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v19, v20, v21);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
LABEL_13:
  *(void *)&a1[a3[8]] = *(void *)&a2[a3[8]];
  return a1;
}

char *initializeWithTake for ReplicatorRecord(char *a1, char *a2, int *a3)
{
  long long v6 = *((_OWORD *)a2 + 1);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v6;
  *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
  uint64_t v7 = type metadata accessor for ReplicatorRecord.ID(0);
  uint64_t v8 = *(int *)(v7 + 28);
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = sub_25B37F640();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    uint64_t v13 = type metadata accessor for ReplicatorRecord.ID.Ownership(0);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
    uint64_t v14 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
  }
  else
  {
    uint64_t v14 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
    v14(v9, v10, v11);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  *(_OWORD *)&a1[*(int *)(v7 + 32)] = *(_OWORD *)&a2[*(int *)(v7 + 32)];
  v14(&a1[a3[5]], &a2[a3[5]], v11);
  uint64_t v15 = a3[7];
  *(void *)&a1[a3[6]] = *(void *)&a2[a3[6]];
  uint64_t v16 = &a1[v15];
  uint64_t v17 = &a2[v15];
  uint64_t v18 = sub_25B37F5D0();
  uint64_t v19 = *(void *)(v18 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18))
  {
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B340F80);
    memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v16, v17, v18);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
  }
  *(void *)&a1[a3[8]] = *(void *)&a2[a3[8]];
  return a1;
}

char *assignWithTake for ReplicatorRecord(char *a1, char *a2, int *a3)
{
  uint64_t v5 = *((void *)a2 + 1);
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *((void *)a2 + 3);
  *((void *)a1 + 2) = *((void *)a2 + 2);
  *((void *)a1 + 3) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *((void *)a2 + 5);
  *((void *)a1 + 4) = *((void *)a2 + 4);
  *((void *)a1 + 5) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = type metadata accessor for ReplicatorRecord.ID(0);
  uint64_t v9 = *(int *)(v8 + 28);
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  uint64_t v12 = sub_25B37F640();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  int v15 = v14(v10, 1, v12);
  int v16 = v14(v11, 1, v12);
  if (v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v10, v11, v12);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v16)
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v10, v12);
LABEL_6:
    uint64_t v17 = type metadata accessor for ReplicatorRecord.ID.Ownership(0);
    memcpy(v10, v11, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 40))(v10, v11, v12);
LABEL_7:
  uint64_t v18 = *(int *)(v8 + 32);
  uint64_t v19 = &a1[v18];
  uint64_t v20 = &a2[v18];
  uint64_t v22 = *(void *)v20;
  uint64_t v21 = *((void *)v20 + 1);
  *(void *)uint64_t v19 = v22;
  *((void *)v19 + 1) = v21;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, char *, uint64_t))(v13 + 40))(&a1[a3[5]], &a2[a3[5]], v12);
  *(void *)&a1[a3[6]] = *(void *)&a2[a3[6]];
  swift_bridgeObjectRelease();
  uint64_t v23 = a3[7];
  int v24 = &a1[v23];
  int v25 = &a2[v23];
  uint64_t v26 = sub_25B37F5D0();
  uint64_t v27 = *(void *)(v26 - 8);
  uint64_t v28 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v27 + 48);
  int v29 = v28(v24, 1, v26);
  int v30 = v28(v25, 1, v26);
  if (!v29)
  {
    if (!v30)
    {
      (*(void (**)(char *, char *, uint64_t))(v27 + 40))(v24, v25, v26);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v27 + 8))(v24, v26);
    goto LABEL_12;
  }
  if (v30)
  {
LABEL_12:
    uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B340F80);
    memcpy(v24, v25, *(void *)(*(void *)(v31 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v24, v25, v26);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v27 + 56))(v24, 0, 1, v26);
LABEL_13:
  *(void *)&a1[a3[8]] = *(void *)&a2[a3[8]];
  return a1;
}

uint64_t getEnumTagSinglePayload for ReplicatorRecord(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25B367D58);
}

uint64_t sub_25B367D58(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for ReplicatorRecord.ID(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_25B37F640();
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + a3[5];
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v14 = *(void *)(a1 + a3[6]);
    if (v14 >= 0xFFFFFFFF) {
      LODWORD(v14) = -1;
    }
    return (v14 + 1);
  }
  else
  {
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B340F80);
    int v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48);
    uint64_t v17 = v15;
    uint64_t v18 = a1 + a3[7];
    return v16(v18, a2, v17);
  }
}

uint64_t storeEnumTagSinglePayload for ReplicatorRecord(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25B367EF0);
}

uint64_t sub_25B367EF0(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = type metadata accessor for ReplicatorRecord.ID(0);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_5:
    return v11(v12, a2, a2, v10);
  }
  uint64_t result = sub_25B37F640();
  uint64_t v14 = *(void *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v12 = a1 + a4[5];
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_5;
  }
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + a4[6]) = (a2 - 1);
  }
  else
  {
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B340F80);
    int v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
    uint64_t v17 = v15;
    uint64_t v18 = a1 + a4[7];
    return v16(v18, a2, a2, v17);
  }
  return result;
}

void sub_25B368074()
{
  type metadata accessor for ReplicatorRecord.ID(319);
  if (v0 <= 0x3F)
  {
    sub_25B37F640();
    if (v1 <= 0x3F)
    {
      sub_25B369FB0(319, &qword_26B340F88, MEMORY[0x263F07490]);
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

ValueMetadata *type metadata accessor for ReplicatorRecord.Options()
{
  return &type metadata for ReplicatorRecord.Options;
}

uint64_t *initializeBufferWithCopyOfBuffer for ReplicatorRecord.ID(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v6 = a2[1];
    *a1 = *a2;
    a1[1] = v6;
    uint64_t v7 = a2[3];
    a1[2] = a2[2];
    a1[3] = v7;
    uint64_t v8 = a2[5];
    uint64_t v9 = *(int *)(a3 + 28);
    __dst = (char *)a1 + v9;
    uint64_t v10 = (char *)a2 + v9;
    a1[4] = a2[4];
    a1[5] = v8;
    uint64_t v11 = sub_25B37F640();
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      uint64_t v14 = type metadata accessor for ReplicatorRecord.ID.Ownership(0);
      memcpy(__dst, v10, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(__dst, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(__dst, 0, 1, v11);
    }
    uint64_t v16 = *(int *)(a3 + 32);
    uint64_t v17 = (uint64_t *)((char *)v4 + v16);
    uint64_t v18 = (uint64_t *)((char *)a2 + v16);
    uint64_t v19 = v18[1];
    void *v17 = *v18;
    v17[1] = v19;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for ReplicatorRecord.ID(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = sub_25B37F640();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for ReplicatorRecord.ID(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  uint64_t v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  uint64_t v7 = a2[5];
  uint64_t v8 = *(int *)(a3 + 28);
  __dst = (char *)a1 + v8;
  uint64_t v9 = (char *)a2 + v8;
  a1[4] = a2[4];
  a1[5] = v7;
  uint64_t v10 = sub_25B37F640();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v12(v9, 1, v10))
  {
    uint64_t v13 = type metadata accessor for ReplicatorRecord.ID.Ownership(0);
    memcpy(__dst, v9, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(__dst, v9, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(__dst, 0, 1, v10);
  }
  uint64_t v14 = *(int *)(a3 + 32);
  uint64_t v15 = (void *)((char *)a1 + v14);
  uint64_t v16 = (void *)((char *)a2 + v14);
  uint64_t v17 = v16[1];
  *uint64_t v15 = *v16;
  v15[1] = v17;
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for ReplicatorRecord.ID(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25B37F640();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v14 = type metadata accessor for ReplicatorRecord.ID.Ownership(0);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  uint64_t v15 = *(int *)(a3 + 32);
  uint64_t v16 = (void *)((char *)a1 + v15);
  uint64_t v17 = (void *)((char *)a2 + v15);
  *uint64_t v16 = *v17;
  v16[1] = v17[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *initializeWithTake for ReplicatorRecord.ID(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  a1[2] = a2[2];
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_25B37F640();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = type metadata accessor for ReplicatorRecord.ID.Ownership(0);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 32)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 32));
  return a1;
}

void *assignWithTake for ReplicatorRecord.ID(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(int *)(a3 + 28);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_25B37F640();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  int v15 = v14(v10, 1, v12);
  int v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 40))(v10, v11, v12);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v13 + 8))(v10, v12);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    uint64_t v17 = type metadata accessor for ReplicatorRecord.ID.Ownership(0);
    memcpy(v10, v11, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v10, v11, v12);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
LABEL_7:
  uint64_t v18 = *(int *)(a3 + 32);
  uint64_t v19 = (void *)((char *)a1 + v18);
  uint64_t v20 = (void *)((char *)a2 + v18);
  uint64_t v22 = *v20;
  uint64_t v21 = v20[1];
  *uint64_t v19 = v22;
  v19[1] = v21;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ReplicatorRecord.ID(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25B368AF8);
}

uint64_t sub_25B368AF8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = type metadata accessor for ReplicatorRecord.ID.Ownership(0);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for ReplicatorRecord.ID(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25B368BBC);
}

uint64_t sub_25B368BBC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for ReplicatorRecord.ID.Ownership(0);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_25B368C64()
{
  uint64_t result = type metadata accessor for ReplicatorRecord.ID.Ownership(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for ReplicatorRecord.ID.Ownership(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v6 = *(void *)(a3 - 8);
    uint64_t v7 = sub_25B37F640();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
  }
  return a1;
}

void *initializeWithCopy for ReplicatorRecord.ID.Ownership(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = sub_25B37F640();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

void *assignWithCopy for ReplicatorRecord.ID.Ownership(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_25B37F640();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 24))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v7 + 16))(a1, a2, v6);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  return a1;
}

void *initializeWithTake for ReplicatorRecord.ID.Ownership(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = sub_25B37F640();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

void *assignWithTake for ReplicatorRecord.ID.Ownership(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_25B37F640();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 40))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v7 + 32))(a1, a2, v6);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ReplicatorRecord.ID.Ownership(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25B369368);
}

uint64_t sub_25B369368(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25B37F640();
  unsigned int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 2) {
    return v5 - 1;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for ReplicatorRecord.ID.Ownership(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25B3693E8);
}

uint64_t sub_25B3693E8(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 1);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = sub_25B37F640();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  return v7(a1, v5, a3, v6);
}

uint64_t sub_25B369468(uint64_t a1)
{
  uint64_t v2 = sub_25B37F640();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48);
  return v3(a1, 1, v2);
}

uint64_t sub_25B3694D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25B37F640();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, 1, v4);
}

uint64_t sub_25B369540()
{
  uint64_t result = sub_25B37F640();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for ReplicatorRecord.Value(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = *a2;
    unint64_t v8 = a2[1];
    sub_25B2E2B14(*a2, v8);
    *a1 = v7;
    a1[1] = v8;
    uint64_t v9 = *(int *)(a3 + 20);
    int v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = sub_25B37F500();
    uint64_t v13 = *(void *)(v12 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B340CE0);
      memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
    }
  }
  return a1;
}

uint64_t destroy for ReplicatorRecord.Value(uint64_t a1, uint64_t a2)
{
  sub_25B2CA2D8(*(void *)a1, *(void *)(a1 + 8));
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_25B37F500();
  uint64_t v8 = *(void *)(v5 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v4, 1, v5);
  if (!result)
  {
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8);
    return v7(v4, v5);
  }
  return result;
}

uint64_t *initializeWithCopy for ReplicatorRecord.Value(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  unint64_t v7 = a2[1];
  sub_25B2E2B14(*a2, v7);
  *a1 = v6;
  a1[1] = v7;
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (char *)a1 + v8;
  int v10 = (char *)a2 + v8;
  uint64_t v11 = sub_25B37F500();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B340CE0);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  return a1;
}

uint64_t *assignWithCopy for ReplicatorRecord.Value(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  unint64_t v7 = a2[1];
  sub_25B2E2B14(*a2, v7);
  uint64_t v8 = *a1;
  unint64_t v9 = a1[1];
  *a1 = v6;
  a1[1] = v7;
  sub_25B2CA2D8(v8, v9);
  uint64_t v10 = *(int *)(a3 + 20);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_25B37F500();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48);
  LODWORD(v7) = v15(v11, 1, v13);
  int v16 = v15(v12, 1, v13);
  if (!v7)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 24))(v11, v12, v13);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v14 + 8))(v11, v13);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B340CE0);
    memcpy(v11, v12, *(void *)(*(void *)(v17 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v11, v12, v13);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
  return a1;
}

_OWORD *initializeWithTake for ReplicatorRecord.Value(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_25B37F500();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B340CE0);
    memcpy(v5, v6, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v5, v6, v7);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  }
  return a1;
}

uint64_t *assignWithTake for ReplicatorRecord.Value(uint64_t *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  unint64_t v7 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_25B2CA2D8(v6, v7);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_25B37F500();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48);
  int v14 = v13(v9, 1, v11);
  int v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 40))(v9, v10, v11);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v12 + 8))(v9, v11);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B340CE0);
    memcpy(v9, v10, *(void *)(*(void *)(v16 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for ReplicatorRecord.Value(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25B369D74);
}

uint64_t sub_25B369D74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 12)
  {
    uint64_t v4 = *(void *)(a1 + 8) >> 60;
    if (((4 * v4) & 0xC) != 0) {
      return 16 - ((4 * v4) & 0xC | (v4 >> 2));
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B340CE0);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for ReplicatorRecord.Value(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25B369E48);
}

void *sub_25B369E48(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 12)
  {
    *uint64_t result = 0;
    result[1] = (unint64_t)(((-(int)a2 >> 2) & 3) - 4 * a2) << 60;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B340CE0);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_25B369EFC()
{
  sub_25B369FB0(319, (unint64_t *)&qword_26B340CE8, MEMORY[0x263F06EA8]);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_25B369FB0(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_25B37FD60();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

unsigned char *storeEnumTagSinglePayload for ReplicatorRecord.ID.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *uint64_t result = a2 + 4;
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
        JUMPOUT(0x25B36A0D0);
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
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ReplicatorRecord.ID.CodingKeys()
{
  return &type metadata for ReplicatorRecord.ID.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for ReplicatorRecord.ID.Ownership.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25B36A1D4);
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

ValueMetadata *type metadata accessor for ReplicatorRecord.ID.Ownership.CodingKeys()
{
  return &type metadata for ReplicatorRecord.ID.Ownership.CodingKeys;
}

ValueMetadata *type metadata accessor for ReplicatorRecord.ID.Ownership.LocalCodingKeys()
{
  return &type metadata for ReplicatorRecord.ID.Ownership.LocalCodingKeys;
}

unsigned char *storeEnumTagSinglePayload for ReplicatorRecord.ID.Ownership.RemoteCodingKeys(unsigned char *result, int a2, int a3)
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
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x25B36A2B8);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for ReplicatorRecord.ID.Ownership.RemoteCodingKeys()
{
  return &type metadata for ReplicatorRecord.ID.Ownership.RemoteCodingKeys;
}

unint64_t sub_25B36A2F4()
{
  unint64_t result = qword_26A4EC9E8;
  if (!qword_26A4EC9E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4EC9E8);
  }
  return result;
}

unint64_t sub_25B36A34C()
{
  unint64_t result = qword_26A4EC9F0;
  if (!qword_26A4EC9F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4EC9F0);
  }
  return result;
}

unint64_t sub_25B36A3A4()
{
  unint64_t result = qword_26A4EC9F8;
  if (!qword_26A4EC9F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4EC9F8);
  }
  return result;
}

unint64_t sub_25B36A3FC()
{
  unint64_t result = qword_26B341048;
  if (!qword_26B341048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B341048);
  }
  return result;
}

unint64_t sub_25B36A454()
{
  unint64_t result = qword_26B341040;
  if (!qword_26B341040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B341040);
  }
  return result;
}

unint64_t sub_25B36A4AC()
{
  unint64_t result = qword_26B341080;
  if (!qword_26B341080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B341080);
  }
  return result;
}

unint64_t sub_25B36A504()
{
  unint64_t result = qword_26B341078;
  if (!qword_26B341078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B341078);
  }
  return result;
}

unint64_t sub_25B36A55C()
{
  unint64_t result = qword_26B341090;
  if (!qword_26B341090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B341090);
  }
  return result;
}

unint64_t sub_25B36A5B4()
{
  unint64_t result = qword_26B341088;
  if (!qword_26B341088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B341088);
  }
  return result;
}

unint64_t sub_25B36A60C()
{
  unint64_t result = qword_26B341068;
  if (!qword_26B341068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B341068);
  }
  return result;
}

unint64_t sub_25B36A664()
{
  unint64_t result = qword_26B341060;
  if (!qword_26B341060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B341060);
  }
  return result;
}

uint64_t sub_25B36A6B8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6C61636F6CLL && a2 == 0xE500000000000000;
  if (v2 || (sub_25B3801A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65746F6D6572 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_25B3801A0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_25B36A79C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_25B3801A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701736314 && a2 == 0xE400000000000000 || (sub_25B3801A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x4449746E65696C63 && a2 == 0xE800000000000000 || (sub_25B3801A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x69687372656E776FLL && a2 == 0xE900000000000070 || (sub_25B3801A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x746E656449676F6CLL && a2 == 0xED00007265696669)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_25B3801A0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

unint64_t sub_25B36A9C4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3410A8);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (void *)((char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B340D48);
  uint64_t v6 = sub_25B37FFC0();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = (char *)v5 + *(int *)(v2 + 48);
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v24[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_25B2E2FE0(v12, (uint64_t)v5, &qword_26B3410A8);
    unint64_t result = sub_25B2D5F6C(v5);
    if (v15) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = type metadata accessor for ReplicatorRecord.ID(0);
    sub_25B2C555C((uint64_t)v5, v17 + *(void *)(*(void *)(v18 - 8) + 72) * v16);
    uint64_t v19 = v7[7];
    uint64_t v20 = sub_25B37F640();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v20 - 8) + 32))(v19 + *(void *)(*(void *)(v20 - 8) + 72) * v16, v9, v20);
    uint64_t v21 = v7[2];
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22) {
      goto LABEL_11;
    }
    v7[2] = v23;
    v12 += v13;
    if (!--v8)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_25B36ABE0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4EB6E8);
  uint64_t v2 = sub_25B37FFC0();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_25B2E2FE0(v6, (uint64_t)&v13, &qword_26A4EB6E0);
    uint64_t v7 = v13;
    unint64_t result = sub_25B2D5FD8(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_25B36C0F0(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_25B36AD10(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ECA08);
  uint64_t v2 = sub_25B37FFC0();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_25B2E2FE0(v6, (uint64_t)&v15, &qword_26A4ECA10);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_25B2D5EB0(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    BOOL v11 = (uint64_t *)(v3[6] + 16 * result);
    *BOOL v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_25B36C0F0(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t NSFileHandle.decompressFile(to:extendedAttributes:)()
{
  return sub_25B36BCD8();
}

uint64_t NSFileHandle.copyFile(to:extendedAttributes:)(uint64_t a1, uint64_t a2)
{
  uint64_t v85 = a2;
  uint64_t v94 = *MEMORY[0x263EF8340];
  uint64_t v3 = sub_25B37F500();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v76 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  char v10 = (char *)&v76 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v76 - v11;
  sub_25B37F4B0();
  uint64_t v86 = a1;
  sub_25B37F480();
  BOOL v13 = self;
  id v14 = objc_msgSend(v13, sel_defaultManager);
  uint64_t v15 = (void *)sub_25B37F4A0();
  id v91 = 0;
  unsigned int v16 = objc_msgSend(v14, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v15, 1, 0, &v91);

  if (!v16)
  {
    id v24 = v91;
    sub_25B37F470();

    swift_willThrow();
    int v25 = *(void (**)(char *, uint64_t))(v4 + 8);
    v25(v10, v3);
    return ((uint64_t (*)(char *, uint64_t))v25)(v12, v3);
  }
  id v17 = v91;
  id v18 = objc_msgSend(v13, sel_defaultManager);
  sub_25B37F4D0();
  uint64_t v19 = (void *)sub_25B37F970();
  swift_bridgeObjectRelease();
  objc_msgSend(v18, sel_createFileAtPath_contents_attributes_, v19, 0, 0);

  sub_25B36BF9C();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v10, v3);
  id v20 = v87;
  id v21 = sub_25B36B8BC((uint64_t)v7);
  if (v20)
  {
    BOOL v22 = *(void (**)(char *, uint64_t))(v4 + 8);
    v22(v10, v3);
    return ((uint64_t (*)(char *, uint64_t))v22)(v12, v3);
  }
  uint64_t v82 = v3;
  uint64_t v84 = v13;
  id v87 = v21;
  unint64_t v83 = v12;
  uint64_t v26 = (void *)MEMORY[0x261161A50]();
  uint64_t v27 = sub_25B37FC80();
  unint64_t v29 = v28;
  uint64_t v80 = v4;
  uint64_t v30 = 0;
  unint64_t v31 = 0xF000000000000000;
  while (1)
  {
    uint64_t v33 = v30;
    uint64_t v30 = v27;
    sub_25B2CA2C4(v33, v31);
    if (v29 >> 60 == 15) {
      break;
    }
    id v91 = (id)v27;
    unint64_t v92 = v29;
    sub_25B2E2B14(v27, v29);
    sub_25B36C09C();
    sub_25B37FC90();
    sub_25B2CA2C4(v27, v29);
    switch(v29 >> 62)
    {
      case 1uLL:
        uint64_t v34 = (int)v27;
        uint64_t v35 = v27 >> 32;
        goto LABEL_12;
      case 2uLL:
        uint64_t v34 = *(void *)(v27 + 16);
        uint64_t v35 = *(void *)(v27 + 24);
LABEL_12:
        if (v34 == v35) {
          goto LABEL_15;
        }
        goto LABEL_7;
      case 3uLL:
        goto LABEL_15;
      default:
        if ((v29 & 0xFF000000000000) == 0) {
          goto LABEL_15;
        }
LABEL_7:
        uint64_t v26 = (void *)MEMORY[0x261161A50]();
        unint64_t v31 = v29;
        uint64_t v27 = sub_25B37FC80();
        unint64_t v29 = v32;
        break;
    }
  }
LABEL_15:
  unint64_t v78 = v29;
  id v91 = 0;
  id v36 = v87;
  if (!objc_msgSend(v87, sel_closeAndReturnError_, &v91))
  {
    id v56 = v91;
    sub_25B37F470();

    swift_willThrow();
    uint64_t v57 = *(void (**)(char *, uint64_t))(v80 + 8);
    uint64_t v58 = v82;
    v57(v10, v82);
    v57(v83, v58);
    return sub_25B2CA2C4(v30, v78);
  }
  v77 = v10;
  uint64_t v37 = *(void *)(v85 + 64);
  uint64_t v79 = v85 + 64;
  uint64_t v38 = 1 << *(unsigned char *)(v85 + 32);
  uint64_t v39 = -1;
  if (v38 < 64) {
    uint64_t v39 = ~(-1 << v38);
  }
  unint64_t v40 = v39 & v37;
  unint64_t v81 = v90;
  uint64_t v88 = (long long *)&v93;
  int64_t v41 = (unint64_t)(v38 + 63) >> 6;
  int64_t v76 = v41 - 1;
  id v42 = v91;
  swift_bridgeObjectRetain();
  for (int64_t i = 0; ; int64_t i = v46)
  {
    unint64_t v44 = v84;
    if (v40)
    {
      unint64_t v45 = __clz(__rbit64(v40));
      v40 &= v40 - 1;
      int64_t v46 = i;
      unint64_t v47 = v45 | (i << 6);
LABEL_21:
      uint64_t v48 = *(void *)(v85 + 56);
      uint64_t v49 = (void *)(*(void *)(v85 + 48) + 16 * v47);
      uint64_t v50 = v49[1];
      *(void *)&long long v89 = *v49;
      *((void *)&v89 + 1) = v50;
      sub_25B2E2B6C(v48 + 48 * v47, (uint64_t)v81);
      swift_bridgeObjectRetain();
      goto LABEL_28;
    }
    int64_t v51 = i + 1;
    if (__OFADD__(i, 1))
    {
      __break(1u);
LABEL_52:
      __break(1u);
    }
    if (v51 >= v41)
    {
      int64_t v46 = i;
    }
    else
    {
      unint64_t v52 = *(void *)(v79 + 8 * v51);
      if (v52) {
        goto LABEL_25;
      }
      int64_t v46 = i + 2;
      if (i + 2 >= v41)
      {
        int64_t v46 = i + 1;
      }
      else
      {
        unint64_t v52 = *(void *)(v79 + 8 * v46);
        if (v52)
        {
          int64_t v51 = i + 2;
LABEL_25:
          unint64_t v40 = (v52 - 1) & v52;
          unint64_t v47 = __clz(__rbit64(v52)) + (v51 << 6);
          int64_t v46 = v51;
          goto LABEL_21;
        }
        if (i + 3 < v41)
        {
          unint64_t v52 = *(void *)(v79 + 8 * (i + 3));
          if (v52)
          {
            int64_t v51 = i + 3;
            goto LABEL_25;
          }
          int64_t v55 = i + 4;
          if (v51 + 3 >= v41)
          {
            int64_t v46 = v51 + 2;
          }
          else
          {
            unint64_t v52 = *(void *)(v79 + 8 * v55);
            if (v52)
            {
              int64_t v51 = v55;
              goto LABEL_25;
            }
            while (1)
            {
              int64_t v51 = v55 + 1;
              if (__OFADD__(v55, 1)) {
                goto LABEL_52;
              }
              if (v51 >= v41) {
                break;
              }
              unint64_t v52 = *(void *)(v79 + 8 * v51);
              ++v55;
              if (v52) {
                goto LABEL_25;
              }
            }
            int64_t v46 = v76;
          }
        }
      }
    }
    unint64_t v40 = 0;
    long long v89 = 0u;
    memset(v90, 0, sizeof(v90));
LABEL_28:
    sub_25B36BFDC((uint64_t)&v89, (uint64_t)&v91);
    uint64_t v53 = v92;
    if (!v92) {
      break;
    }
    uint64_t v54 = (uint64_t)v91;
    sub_25B2DCE7C(v88, &v89);
    __swift_project_boxed_opaque_existential_1(&v89, *((uint64_t *)&v90[0] + 1));
    sub_25B3755DC(v54, v53);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v89);
  }
  swift_release();
  id v59 = objc_msgSend(v44, sel_defaultManager);
  __swift_instantiateConcreteTypeFromMangledName(qword_26A4EB710);
  uint64_t inited = swift_initStackObject();
  uint64_t v61 = (void **)MEMORY[0x263F080A8];
  *(_OWORD *)(inited + 16) = xmmword_25B3819A0;
  v62 = *v61;
  *(void *)(inited + 32) = *v61;
  uint64_t v63 = (void *)*MEMORY[0x263F08098];
  type metadata accessor for FileProtectionType(0);
  *(void *)(inited + 64) = v64;
  *(void *)(inited + 40) = v63;
  id v65 = v62;
  id v66 = v63;
  sub_25B36ABE0(inited);
  type metadata accessor for FileAttributeKey(0);
  sub_25B36C044();
  uint64_t v67 = (void *)sub_25B37F8E0();
  swift_bridgeObjectRelease();
  uint64_t v68 = v77;
  sub_25B37F4D0();
  uint64_t v69 = (void *)sub_25B37F970();
  swift_bridgeObjectRelease();
  id v91 = 0;
  LOBYTE(inited) = objc_msgSend(v59, sel_setAttributes_ofItemAtPath_error_, v67, v69, &v91);

  if (inited)
  {
    id v70 = v91;

    v71 = *(void (**)(char *, uint64_t))(v80 + 8);
    uint64_t v72 = v82;
    v71(v68, v82);
    v71(v83, v72);
    return sub_25B2CA2C4(v30, v78);
  }
  id v73 = v91;
  sub_25B37F470();

  swift_willThrow();
  v74 = *(void (**)(char *, uint64_t))(v80 + 8);
  uint64_t v75 = v82;
  v74(v68, v82);
  v74(v83, v75);
  return sub_25B2CA2C4(v30, v78);
}

id sub_25B36B8BC(uint64_t a1)
{
  v11[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v2 = (void *)sub_25B37F4A0();
  v11[0] = 0;
  id v3 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_fileHandleForWritingToURL_error_, v2, v11);

  id v4 = v11[0];
  if (v3)
  {
    uint64_t v5 = sub_25B37F500();
    uint64_t v6 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    id v7 = v4;
    v6(a1, v5);
  }
  else
  {
    id v8 = v11[0];
    sub_25B37F470();

    swift_willThrow();
    uint64_t v9 = sub_25B37F500();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(a1, v9);
  }
  return v3;
}

uint64_t NSFileHandle.compressFile(to:extendedAttributes:)()
{
  v24[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v0 = sub_25B37F500();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  id v4 = (char *)v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v2);
  id v7 = (char *)v23 - v6;
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v23 - v8;
  sub_25B37F4B0();
  sub_25B37F480();
  char v10 = self;
  id v11 = objc_msgSend(v10, sel_defaultManager);
  uint64_t v12 = (void *)sub_25B37F4A0();
  v24[0] = 0;
  unsigned int v13 = objc_msgSend(v11, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v12, 1, 0, v24);

  if (v13)
  {
    id v14 = v24[0];
    id v15 = objc_msgSend(v10, sel_defaultManager);
    sub_25B37F4D0();
    unsigned int v16 = (void *)sub_25B37F970();
    swift_bridgeObjectRelease();
    objc_msgSend(v15, sel_createFileAtPath_contents_attributes_, v16, 0, 0);

    sub_25B36BF9C();
    (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v4, v7, v0);
    uint64_t v17 = v23[1];
    id v18 = sub_25B36B8BC((uint64_t)v4);
    if (!v17)
    {
      uint64_t v19 = v18;
      sub_25B379BF8(0, v23[0], v18);
    }
  }
  else
  {
    id v20 = v24[0];
    sub_25B37F470();

    swift_willThrow();
  }
  id v21 = *(void (**)(char *, uint64_t))(v1 + 8);
  v21(v7, v0);
  return ((uint64_t (*)(char *, uint64_t))v21)(v9, v0);
}

uint64_t sub_25B36BCD8()
{
  v24[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v0 = sub_25B37F500();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  id v4 = (char *)v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v2);
  id v7 = (char *)v23 - v6;
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v23 - v8;
  sub_25B37F4B0();
  sub_25B37F480();
  char v10 = self;
  id v11 = objc_msgSend(v10, sel_defaultManager);
  uint64_t v12 = (void *)sub_25B37F4A0();
  v24[0] = 0;
  unsigned int v13 = objc_msgSend(v11, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v12, 1, 0, v24);

  if (v13)
  {
    id v14 = v24[0];
    id v15 = objc_msgSend(v10, sel_defaultManager);
    sub_25B37F4D0();
    unsigned int v16 = (void *)sub_25B37F970();
    swift_bridgeObjectRelease();
    objc_msgSend(v15, sel_createFileAtPath_contents_attributes_, v16, 0, 0);

    sub_25B36BF9C();
    (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v4, v7, v0);
    uint64_t v17 = v23[1];
    id v18 = sub_25B36B8BC((uint64_t)v4);
    if (!v17)
    {
      uint64_t v19 = v18;
      sub_25B379BF8(1, v23[0], v18);
    }
  }
  else
  {
    id v20 = v24[0];
    sub_25B37F470();

    swift_willThrow();
  }
  id v21 = *(void (**)(char *, uint64_t))(v1 + 8);
  v21(v7, v0);
  return ((uint64_t (*)(char *, uint64_t))v21)(v9, v0);
}

unint64_t sub_25B36BF9C()
{
  unint64_t result = qword_26B340B80;
  if (!qword_26B340B80)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B340B80);
  }
  return result;
}

uint64_t sub_25B36BFDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4EB6D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_25B36C044()
{
  unint64_t result = qword_26B340BE8;
  if (!qword_26B340BE8)
  {
    type metadata accessor for FileAttributeKey(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B340BE8);
  }
  return result;
}

unint64_t sub_25B36C09C()
{
  unint64_t result = qword_26A4EB650;
  if (!qword_26A4EB650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4EB650);
  }
  return result;
}

_OWORD *sub_25B36C0F0(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_25B36C100@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v19 = a2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4EB540);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  id v11 = (char *)&v18 - v10;
  MEMORY[0x270FA5388](v9);
  unsigned int v13 = (char *)&v18 - v12;
  uint64_t LocalDeviceID = type metadata accessor for ReplicationXPCServerResponse.GetLocalDeviceID(0);
  uint64_t v15 = *(void *)(LocalDeviceID - 8);
  id v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v20(v13, 1, 1, LocalDeviceID);
  if (a1)
  {
    sub_25B37F400();
    swift_allocObject();
    sub_25B37F3F0();
    uint64_t v3 = sub_25B37F570();
    unint64_t v2 = v16;
    sub_25B374E0C(&qword_26B340BD0, (void (*)(uint64_t))type metadata accessor for ReplicationXPCServerResponse.GetLocalDeviceID);
    sub_25B37F3E0();
    sub_25B2E344C((uint64_t)v13, &qword_26A4EB540);
    sub_25B2CA2D8(v3, v2);
    swift_release();
    v20(v11, 0, 1, LocalDeviceID);
    sub_25B2E31F0((uint64_t)v11, (uint64_t)v13, &qword_26A4EB540);
    sub_25B2E2FE0((uint64_t)v13, (uint64_t)v8, &qword_26A4EB540);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v8, 1, LocalDeviceID) != 1)
    {
      sub_25B2E344C((uint64_t)v13, &qword_26A4EB540);
      return sub_25B374E54((uint64_t)v8, v19, type metadata accessor for ReplicationXPCServerResponse.GetLocalDeviceID);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  sub_25B2CA2D8(v3, v2);
  uint64_t result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_25B36C3B0@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v18 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4EC0D0);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)&v17 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v17 - v11;
  uint64_t v13 = type metadata accessor for ReplicatorControlXPCServerParameters.Pair(0);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56);
  v19(v12, 1, 1, v13);
  if (a1)
  {
    sub_25B37F400();
    swift_allocObject();
    sub_25B37F3F0();
    uint64_t v2 = sub_25B37F570();
    a1 = v15;
    sub_25B374E0C((unint64_t *)&unk_26A4ECCC0, (void (*)(uint64_t))type metadata accessor for ReplicatorControlXPCServerParameters.Pair);
    sub_25B37F3E0();
    sub_25B2E344C((uint64_t)v12, &qword_26A4EC0D0);
    sub_25B2CA2D8(v2, a1);
    swift_release();
    v19(v10, 0, 1, v13);
    sub_25B2E31F0((uint64_t)v10, (uint64_t)v12, &qword_26A4EC0D0);
    sub_25B2E2FE0((uint64_t)v12, (uint64_t)v7, &qword_26A4EC0D0);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v7, 1, v13) != 1)
    {
      sub_25B2E344C((uint64_t)v12, &qword_26A4EC0D0);
      return sub_25B374E54((uint64_t)v7, v18, type metadata accessor for ReplicatorControlXPCServerParameters.Pair);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  sub_25B2CA2D8(v2, a1);
  uint64_t result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_25B36C664@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v18 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4EC0C8);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)&v17 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v17 - v11;
  uint64_t v13 = type metadata accessor for ReplicatorControlXPCServerParameters.Unpair(0);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56);
  v19(v12, 1, 1, v13);
  if (a1)
  {
    sub_25B37F400();
    swift_allocObject();
    sub_25B37F3F0();
    uint64_t v2 = sub_25B37F570();
    a1 = v15;
    sub_25B374E0C((unint64_t *)&unk_26A4ECCB0, (void (*)(uint64_t))type metadata accessor for ReplicatorControlXPCServerParameters.Unpair);
    sub_25B37F3E0();
    sub_25B2E344C((uint64_t)v12, &qword_26A4EC0C8);
    sub_25B2CA2D8(v2, a1);
    swift_release();
    v19(v10, 0, 1, v13);
    sub_25B2E31F0((uint64_t)v10, (uint64_t)v12, &qword_26A4EC0C8);
    sub_25B2E2FE0((uint64_t)v12, (uint64_t)v7, &qword_26A4EC0C8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v7, 1, v13) != 1)
    {
      sub_25B2E344C((uint64_t)v12, &qword_26A4EC0C8);
      return sub_25B374E54((uint64_t)v7, v18, type metadata accessor for ReplicatorControlXPCServerParameters.Unpair);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  sub_25B2CA2D8(v2, a1);
  uint64_t result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_25B36C918@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v18 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4EC0C0);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)&v17 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v17 - v11;
  uint64_t v13 = type metadata accessor for ReplicatorControlXPCServerParameters.Unavailable(0);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56);
  v19(v12, 1, 1, v13);
  if (a1)
  {
    sub_25B37F400();
    swift_allocObject();
    sub_25B37F3F0();
    uint64_t v2 = sub_25B37F570();
    a1 = v15;
    sub_25B374E0C((unint64_t *)&unk_26A4ECCA0, (void (*)(uint64_t))type metadata accessor for ReplicatorControlXPCServerParameters.Unavailable);
    sub_25B37F3E0();
    sub_25B2E344C((uint64_t)v12, &qword_26A4EC0C0);
    sub_25B2CA2D8(v2, a1);
    swift_release();
    v19(v10, 0, 1, v13);
    sub_25B2E31F0((uint64_t)v10, (uint64_t)v12, &qword_26A4EC0C0);
    sub_25B2E2FE0((uint64_t)v12, (uint64_t)v7, &qword_26A4EC0C0);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v7, 1, v13) != 1)
    {
      sub_25B2E344C((uint64_t)v12, &qword_26A4EC0C0);
      return sub_25B374E54((uint64_t)v7, v18, type metadata accessor for ReplicatorControlXPCServerParameters.Unavailable);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  sub_25B2CA2D8(v2, a1);
  uint64_t result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_25B36CBCC@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_25B36E5C4(a1, (void (*)(void))sub_25B3219DC, a2);
}

uint64_t sub_25B36CBEC@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_25B36E5C4(a1, (void (*)(void))sub_25B321B18, a2);
}

uint64_t sub_25B36CC0C@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v18 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4EC0B8);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)&v17 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v17 - v11;
  uint64_t v13 = type metadata accessor for ReplicatorControlXPCServerParameters.AllowListID(0);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56);
  v19(v12, 1, 1, v13);
  if (a1)
  {
    sub_25B37F400();
    swift_allocObject();
    sub_25B37F3F0();
    uint64_t v2 = sub_25B37F570();
    a1 = v15;
    sub_25B374E0C((unint64_t *)&unk_26A4ECC90, (void (*)(uint64_t))type metadata accessor for ReplicatorControlXPCServerParameters.AllowListID);
    sub_25B37F3E0();
    sub_25B2E344C((uint64_t)v12, &qword_26A4EC0B8);
    sub_25B2CA2D8(v2, a1);
    swift_release();
    v19(v10, 0, 1, v13);
    sub_25B2E31F0((uint64_t)v10, (uint64_t)v12, &qword_26A4EC0B8);
    sub_25B2E2FE0((uint64_t)v12, (uint64_t)v7, &qword_26A4EC0B8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v7, 1, v13) != 1)
    {
      sub_25B2E344C((uint64_t)v12, &qword_26A4EC0B8);
      return sub_25B374E54((uint64_t)v7, v18, type metadata accessor for ReplicatorControlXPCServerParameters.AllowListID);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  sub_25B2CA2D8(v2, a1);
  uint64_t result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_25B36CEC0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_25B36EC28(a1, (void (*)(void))sub_25B321D00, a2);
}

uint64_t sub_25B36CEE0@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v18 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A4ECC70);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)&v17 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v17 - v11;
  uint64_t PushToken = type metadata accessor for ReplicatorControlXPCServerParameters.GetPushToken(0);
  uint64_t v14 = *(void *)(PushToken - 8);
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56);
  v19(v12, 1, 1, PushToken);
  if (a1)
  {
    sub_25B37F400();
    swift_allocObject();
    sub_25B37F3F0();
    uint64_t v2 = sub_25B37F570();
    a1 = v15;
    sub_25B374E0C(&qword_26A4EBEC8, (void (*)(uint64_t))type metadata accessor for ReplicatorControlXPCServerParameters.GetPushToken);
    sub_25B37F3E0();
    sub_25B2E344C((uint64_t)v12, (uint64_t *)&unk_26A4ECC70);
    sub_25B2CA2D8(v2, a1);
    swift_release();
    v19(v10, 0, 1, PushToken);
    sub_25B2E31F0((uint64_t)v10, (uint64_t)v12, (uint64_t *)&unk_26A4ECC70);
    sub_25B2E2FE0((uint64_t)v12, (uint64_t)v7, (uint64_t *)&unk_26A4ECC70);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v7, 1, PushToken) != 1)
    {
      sub_25B2E344C((uint64_t)v12, (uint64_t *)&unk_26A4ECC70);
      return sub_25B374E54((uint64_t)v7, v18, type metadata accessor for ReplicatorControlXPCServerParameters.GetPushToken);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  sub_25B2CA2D8(v2, a1);
  uint64_t result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_25B36D194@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_25B36E5C4(a1, (void (*)(void))sub_25B321EE8, a2);
}

uint64_t sub_25B36D1B4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_25B36EC28(a1, (void (*)(void))sub_25B322024, a2);
}

uint64_t sub_25B36D1D4@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v18 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A4ECC60);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)&v17 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v17 - v11;
  uint64_t LocalDevice = type metadata accessor for ReplicatorControlXPCServerResponse.GetLocalDevice(0);
  uint64_t v14 = *(void *)(LocalDevice - 8);
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56);
  v19(v12, 1, 1, LocalDevice);
  if (a1)
  {
    sub_25B37F400();
    swift_allocObject();
    sub_25B37F3F0();
    uint64_t v2 = sub_25B37F570();
    a1 = v15;
    sub_25B374E0C(&qword_26A4EBEE0, (void (*)(uint64_t))type metadata accessor for ReplicatorControlXPCServerResponse.GetLocalDevice);
    sub_25B37F3E0();
    sub_25B2E344C((uint64_t)v12, (uint64_t *)&unk_26A4ECC60);
    sub_25B2CA2D8(v2, a1);
    swift_release();
    v19(v10, 0, 1, LocalDevice);
    sub_25B2E31F0((uint64_t)v10, (uint64_t)v12, (uint64_t *)&unk_26A4ECC60);
    sub_25B2E2FE0((uint64_t)v12, (uint64_t)v7, (uint64_t *)&unk_26A4ECC60);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v7, 1, LocalDevice) != 1)
    {
      sub_25B2E344C((uint64_t)v12, (uint64_t *)&unk_26A4ECC60);
      return sub_25B374E54((uint64_t)v7, v18, type metadata accessor for ReplicatorControlXPCServerResponse.GetLocalDevice);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  sub_25B2CA2D8(v2, a1);
  uint64_t result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_25B36D488@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_25B36E5C4(a1, (void (*)(void))sub_25B32220C, a2);
}

uint64_t sub_25B36D4A8@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_25B36EC28(a1, (void (*)(void))sub_25B322348, a2);
}

uint64_t sub_25B36D4C8@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  if (a1)
  {
    sub_25B37F400();
    swift_allocObject();
    sub_25B37F3F0();
    uint64_t v3 = sub_25B37F570();
    unint64_t v5 = v4;
    sub_25B322508();
    sub_25B37F3E0();
    sub_25B2CA2D8(v3, v5);
    uint64_t result = swift_release();
    if (v8 >> 60 != 15)
    {
      *a2 = v7;
      a2[1] = v8;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  uint64_t result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_25B36D5BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_25B36DDE4(a1, (void (*)(void))sub_25B332824, a2);
}

uint64_t sub_25B36D5DC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_25B36D67C(a1, (void (*)(void))sub_25B33290C, a2);
}

uint64_t sub_25B36D5FC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_25B36D67C(a1, (void (*)(void))sub_25B3329F4, a2);
}

uint64_t sub_25B36D61C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_25B36D67C(a1, (void (*)(void))sub_25B332ADC, a2);
}

uint64_t sub_25B36D63C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_25B36D67C(a1, (void (*)(void))sub_25B332BC4, a2);
}

uint64_t sub_25B36D65C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_25B36D67C(a1, (void (*)(void))sub_25B332CAC, a2);
}

uint64_t sub_25B36D67C@<X0>(uint64_t a1@<X0>, void (*a2)(void)@<X1>, void *a3@<X8>)
{
  if (a1)
  {
    sub_25B37F400();
    swift_allocObject();
    sub_25B37F3F0();
    uint64_t v5 = sub_25B37F570();
    unint64_t v7 = v6;
    a2();
    sub_25B37F3E0();
    sub_25B2CA2D8(v5, v7);
    uint64_t result = swift_release();
    if (v10)
    {
      *a3 = v9;
      a3[1] = v10;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  uint64_t result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_25B36D778@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (a1)
  {
    sub_25B37F400();
    swift_allocObject();
    sub_25B37F3F0();
    uint64_t v3 = sub_25B37F570();
    unint64_t v5 = v4;
    sub_25B332D94();
    sub_25B37F3E0();
    sub_25B2CA2D8(v3, v5);
    uint64_t result = swift_release();
    if (v7 != 1)
    {
      *(void *)a2 = v7;
      *(unsigned char *)(a2 + 8) = v8 & 1;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  uint64_t result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_25B36D870@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (a1)
  {
    sub_25B37F400();
    swift_allocObject();
    sub_25B37F3F0();
    uint64_t v3 = sub_25B37F570();
    unint64_t v5 = v4;
    sub_25B332E7C();
    sub_25B37F3E0();
    sub_25B2CA2D8(v3, v5);
    uint64_t result = swift_release();
    if (v7)
    {
      *(void *)a2 = v7;
      *(unsigned char *)(a2 + 8) = v8 & 1;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  uint64_t result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_25B36D964@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (a1)
  {
    sub_25B37F400();
    swift_allocObject();
    sub_25B37F3F0();
    uint64_t v3 = sub_25B37F570();
    unint64_t v5 = v4;
    sub_25B332F64();
    sub_25B37F3E0();
    sub_25B2CA2D8(v3, v5);
    uint64_t result = swift_release();
    if (v7)
    {
      *(void *)a2 = v7;
      *(unsigned char *)(a2 + 8) = v8 & 1;
      *(unsigned char *)(a2 + 9) = v9 & 1;
      *(void *)(a2 + 16) = v10;
      *(unsigned char *)(a2 + 24) = v11 & 1;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  uint64_t result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_25B36DA70@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_25B36EC28(a1, (void (*)(void))sub_25B33304C, a2);
}

uint64_t sub_25B36DA90@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v18 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A4EC420);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)&v17 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v17 - v11;
  uint64_t v13 = type metadata accessor for ReplicationXPCServerParameters.SendMessage(0);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56);
  v19(v12, 1, 1, v13);
  if (a1)
  {
    sub_25B37F400();
    swift_allocObject();
    sub_25B37F3F0();
    uint64_t v2 = sub_25B37F570();
    a1 = v15;
    sub_25B374E0C((unint64_t *)&unk_26A4ECC40, (void (*)(uint64_t))type metadata accessor for ReplicationXPCServerParameters.SendMessage);
    sub_25B37F3E0();
    sub_25B2E344C((uint64_t)v12, (uint64_t *)&unk_26A4EC420);
    sub_25B2CA2D8(v2, a1);
    swift_release();
    v19(v10, 0, 1, v13);
    sub_25B2E31F0((uint64_t)v10, (uint64_t)v12, (uint64_t *)&unk_26A4EC420);
    sub_25B2E2FE0((uint64_t)v12, (uint64_t)v7, (uint64_t *)&unk_26A4EC420);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v7, 1, v13) != 1)
    {
      sub_25B2E344C((uint64_t)v12, (uint64_t *)&unk_26A4EC420);
      return sub_25B374E54((uint64_t)v7, v18, type metadata accessor for ReplicationXPCServerParameters.SendMessage);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  sub_25B2CA2D8(v2, a1);
  uint64_t result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_25B36DD44@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_25B36EC28(a1, (void (*)(void))sub_25B3331E0, a2);
}

uint64_t sub_25B36DD64@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_25B36EC28(a1, (void (*)(void))sub_25B3332C8, a2);
}

uint64_t sub_25B36DD84@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_25B36EC28(a1, (void (*)(void))sub_25B318614, a2);
}

uint64_t sub_25B36DDA4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_25B36EC28(a1, (void (*)(void))sub_25B3187A8, a2);
}

uint64_t sub_25B36DDC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_25B36DDE4(a1, (void (*)(void))sub_25B319110, a2);
}

uint64_t sub_25B36DDE4@<X0>(uint64_t a1@<X0>, void (*a2)(void)@<X1>, uint64_t a3@<X8>)
{
  if (a1)
  {
    sub_25B37F400();
    swift_allocObject();
    sub_25B37F3F0();
    uint64_t v5 = sub_25B37F570();
    unint64_t v7 = v6;
    a2();
    sub_25B37F3E0();
    sub_25B2CA2D8(v5, v7);
    uint64_t result = swift_release();
    if (v10)
    {
      *(void *)a3 = v9;
      *(void *)(a3 + 8) = v10;
      *(void *)(a3 + 16) = v11;
      *(void *)(a3 + 24) = v12;
      *(void *)(a3 + 32) = v13;
      *(void *)(a3 + 40) = v14;
      *(void *)(a3 + 48) = v15;
      *(_OWORD *)(a3 + 56) = v16;
      *(void *)(a3 + 72) = v17;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  uint64_t result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_25B36DF08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (a1)
  {
    sub_25B37F400();
    swift_allocObject();
    sub_25B37F3F0();
    uint64_t v3 = sub_25B37F570();
    unint64_t v5 = v4;
    sub_25B3186BC();
    sub_25B37F3E0();
    sub_25B2CA2D8(v3, v5);
    uint64_t result = swift_release();
    if ((void)v7)
    {
      *(_OWORD *)a2 = v7;
      *(void *)(a2 + 16) = v8;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  uint64_t result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_25B36DFFC@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v18 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4EBC40);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  long long v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)&v17 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v17 - v11;
  uint64_t v13 = type metadata accessor for ReplicationXPCServerResponse.ReceiveMessage(0);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56);
  v19(v12, 1, 1, v13);
  if (a1)
  {
    sub_25B37F400();
    swift_allocObject();
    sub_25B37F3F0();
    uint64_t v2 = sub_25B37F570();
    a1 = v15;
    sub_25B374E0C(&qword_26A4EC290, (void (*)(uint64_t))type metadata accessor for ReplicationXPCServerResponse.ReceiveMessage);
    sub_25B37F3E0();
    sub_25B2E344C((uint64_t)v12, &qword_26A4EBC40);
    sub_25B2CA2D8(v2, a1);
    swift_release();
    v19(v10, 0, 1, v13);
    sub_25B2E31F0((uint64_t)v10, (uint64_t)v12, &qword_26A4EBC40);
    sub_25B2E2FE0((uint64_t)v12, (uint64_t)v7, &qword_26A4EBC40);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v7, 1, v13) != 1)
    {
      sub_25B2E344C((uint64_t)v12, &qword_26A4EBC40);
      return sub_25B374E54((uint64_t)v7, v18, type metadata accessor for ReplicationXPCServerResponse.ReceiveMessage);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  sub_25B2CA2D8(v2, a1);
  uint64_t result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_25B36E2B0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_25B36EC28(a1, (void (*)(void))sub_25B319030, a2);
}

uint64_t sub_25B36E2D0@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v18 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4EB540);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  long long v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)&v17 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v17 - v11;
  uint64_t LocalDeviceID = type metadata accessor for ReplicationXPCServerResponse.GetLocalDeviceID(0);
  uint64_t v14 = *(void *)(LocalDeviceID - 8);
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56);
  v19(v12, 1, 1, LocalDeviceID);
  if (a1)
  {
    sub_25B37F400();
    swift_allocObject();
    sub_25B37F3F0();
    uint64_t v2 = sub_25B37F570();
    a1 = v15;
    sub_25B374E0C(&qword_26B340BD0, (void (*)(uint64_t))type metadata accessor for ReplicationXPCServerResponse.GetLocalDeviceID);
    sub_25B37F3E0();
    sub_25B2E344C((uint64_t)v12, &qword_26A4EB540);
    sub_25B2CA2D8(v2, a1);
    swift_release();
    v19(v10, 0, 1, LocalDeviceID);
    sub_25B2E31F0((uint64_t)v10, (uint64_t)v12, &qword_26A4EB540);
    sub_25B2E2FE0((uint64_t)v12, (uint64_t)v7, &qword_26A4EB540);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v7, 1, LocalDeviceID) != 1)
    {
      sub_25B2E344C((uint64_t)v12, &qword_26A4EB540);
      return sub_25B374E54((uint64_t)v7, v18, type metadata accessor for ReplicationXPCServerResponse.GetLocalDeviceID);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  sub_25B2CA2D8(v2, a1);
  uint64_t result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_25B36E584@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_25B36EC28(a1, (void (*)(void))sub_25B333990, a2);
}

uint64_t sub_25B36E5A4@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_25B36E5C4(a1, (void (*)(void))sub_25B319550, a2);
}

uint64_t sub_25B36E5C4@<X0>(uint64_t a1@<X0>, void (*a2)(void)@<X1>, unsigned char *a3@<X8>)
{
  if (a1)
  {
    sub_25B37F400();
    swift_allocObject();
    sub_25B37F3F0();
    uint64_t v5 = sub_25B37F570();
    unint64_t v7 = v6;
    a2();
    sub_25B37F3E0();
    sub_25B2CA2D8(v5, v7);
    uint64_t result = swift_release();
    if (v9 != 2)
    {
      *a3 = v9 & 1;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  uint64_t result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_25B36E6C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v19 = a2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A4ECC60);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v11 = (char *)&v18 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v18 - v12;
  uint64_t LocalDevice = type metadata accessor for ReplicatorControlXPCServerResponse.GetLocalDevice(0);
  uint64_t v15 = *(void *)(LocalDevice - 8);
  id v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v20(v13, 1, 1, LocalDevice);
  if (a1)
  {
    sub_25B37F400();
    swift_allocObject();
    sub_25B37F3F0();
    uint64_t v3 = sub_25B37F570();
    unint64_t v2 = v16;
    sub_25B374E0C(&qword_26A4EBEE0, (void (*)(uint64_t))type metadata accessor for ReplicatorControlXPCServerResponse.GetLocalDevice);
    sub_25B37F3E0();
    sub_25B2E344C((uint64_t)v13, (uint64_t *)&unk_26A4ECC60);
    sub_25B2CA2D8(v3, v2);
    swift_release();
    v20(v11, 0, 1, LocalDevice);
    sub_25B2E31F0((uint64_t)v11, (uint64_t)v13, (uint64_t *)&unk_26A4ECC60);
    sub_25B2E2FE0((uint64_t)v13, (uint64_t)v8, (uint64_t *)&unk_26A4ECC60);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v8, 1, LocalDevice) != 1)
    {
      sub_25B2E344C((uint64_t)v13, (uint64_t *)&unk_26A4ECC60);
      return sub_25B374E54((uint64_t)v8, v19, type metadata accessor for ReplicatorControlXPCServerResponse.GetLocalDevice);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  sub_25B2CA2D8(v3, v2);
  uint64_t result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_25B36E974@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v18 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ECC20);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)&v17 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v17 - v11;
  uint64_t LocalDeviceID = type metadata accessor for MigrationXPCServerResponse.GetLocalDeviceID();
  uint64_t v14 = *(void *)(LocalDeviceID - 8);
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56);
  v19(v12, 1, 1, LocalDeviceID);
  if (a1)
  {
    sub_25B37F400();
    swift_allocObject();
    sub_25B37F3F0();
    uint64_t v2 = sub_25B37F570();
    a1 = v15;
    sub_25B374E0C((unint64_t *)&unk_26A4ECAE8, (void (*)(uint64_t))type metadata accessor for MigrationXPCServerResponse.GetLocalDeviceID);
    sub_25B37F3E0();
    sub_25B2E344C((uint64_t)v12, &qword_26A4ECC20);
    sub_25B2CA2D8(v2, a1);
    swift_release();
    v19(v10, 0, 1, LocalDeviceID);
    sub_25B2E31F0((uint64_t)v10, (uint64_t)v12, &qword_26A4ECC20);
    sub_25B2E2FE0((uint64_t)v12, (uint64_t)v7, &qword_26A4ECC20);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v7, 1, LocalDeviceID) != 1)
    {
      sub_25B2E344C((uint64_t)v12, &qword_26A4ECC20);
      return sub_25B374E54((uint64_t)v7, v18, (uint64_t (*)(void))type metadata accessor for MigrationXPCServerResponse.GetLocalDeviceID);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  sub_25B2CA2D8(v2, a1);
  uint64_t result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_25B36EC28@<X0>(uint64_t a1@<X0>, void (*a2)(void)@<X1>, void *a3@<X8>)
{
  if (a1)
  {
    sub_25B37F400();
    swift_allocObject();
    sub_25B37F3F0();
    uint64_t v5 = sub_25B37F570();
    unint64_t v7 = v6;
    a2();
    sub_25B37F3E0();
    sub_25B2CA2D8(v5, v7);
    uint64_t result = swift_release();
    if (v9)
    {
      *a3 = v9;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  uint64_t result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_25B36ED20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v19 = a2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4EBC40);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v11 = (char *)&v18 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v18 - v12;
  uint64_t v14 = type metadata accessor for ReplicationXPCServerResponse.ReceiveMessage(0);
  uint64_t v15 = *(void *)(v14 - 8);
  id v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v20(v13, 1, 1, v14);
  if (a1)
  {
    sub_25B37F400();
    swift_allocObject();
    sub_25B37F3F0();
    uint64_t v3 = sub_25B37F570();
    unint64_t v2 = v16;
    sub_25B374E0C(&qword_26A4EC290, (void (*)(uint64_t))type metadata accessor for ReplicationXPCServerResponse.ReceiveMessage);
    sub_25B37F3E0();
    sub_25B2E344C((uint64_t)v13, &qword_26A4EBC40);
    sub_25B2CA2D8(v3, v2);
    swift_release();
    v20(v11, 0, 1, v14);
    sub_25B2E31F0((uint64_t)v11, (uint64_t)v13, &qword_26A4EBC40);
    sub_25B2E2FE0((uint64_t)v13, (uint64_t)v8, &qword_26A4EBC40);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v8, 1, v14) != 1)
    {
      sub_25B2E344C((uint64_t)v13, &qword_26A4EBC40);
      return sub_25B374E54((uint64_t)v8, v19, type metadata accessor for ReplicationXPCServerResponse.ReceiveMessage);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  sub_25B2CA2D8(v3, v2);
  uint64_t result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_25B36EFD0(uint64_t a1, void *a2)
{
  return sub_25B36F8AC(a1, a2, (void (*)(void))sub_25B322024);
}

uint64_t sub_25B36EFF0(uint64_t a1, void *a2)
{
  return sub_25B36F8AC(a1, a2, (void (*)(void))sub_25B322348);
}

double sub_25B36F010(uint64_t a1, uint64_t a2)
{
  sub_25B37F400();
  swift_allocObject();
  sub_25B37F3F0();
  uint64_t v3 = sub_25B37F570();
  unint64_t v5 = v4;
  sub_25B322508();
  sub_25B37F3E0();
  sub_25B2CA2C4(*(void *)a2, *(void *)(a2 + 8));
  sub_25B2CA2D8(v3, v5);
  swift_release();
  double result = *(double *)&v7;
  *(_OWORD *)a2 = v7;
  return result;
}

uint64_t sub_25B36F0F8(uint64_t a1, void *a2)
{
  return sub_25B36F8AC(a1, a2, (void (*)(void))sub_25B321D00);
}

uint64_t sub_25B36F118(uint64_t a1, void *a2)
{
  return sub_25B36F8AC(a1, a2, (void (*)(void))sub_25B3187A8);
}

uint64_t sub_25B36F138(uint64_t a1, void *a2)
{
  return sub_25B36F8AC(a1, a2, (void (*)(void))sub_25B319030);
}

uint64_t sub_25B36F158(uint64_t a1, void *a2)
{
  return sub_25B36F8AC(a1, a2, (void (*)(void))sub_25B318614);
}

double sub_25B36F178(uint64_t a1, uint64_t a2)
{
  return sub_25B36F608(a1, a2, (void (*)(void))sub_25B319110);
}

double sub_25B36F198(uint64_t a1, uint64_t *a2)
{
  sub_25B37F400();
  swift_allocObject();
  sub_25B37F3F0();
  uint64_t v3 = sub_25B37F570();
  unint64_t v5 = v4;
  sub_25B3186BC();
  sub_25B37F3E0();
  sub_25B31875C(*a2);
  sub_25B2CA2D8(v3, v5);
  swift_release();
  double result = *(double *)&v7;
  *(_OWORD *)a2 = v7;
  a2[2] = v8;
  return result;
}

uint64_t sub_25B36F28C(uint64_t a1, void *a2)
{
  return sub_25B36F8AC(a1, a2, (void (*)(void))sub_25B333990);
}

uint64_t sub_25B36F2AC(uint64_t a1, uint64_t a2)
{
  sub_25B37F400();
  swift_allocObject();
  sub_25B37F3F0();
  uint64_t v3 = sub_25B37F570();
  unint64_t v5 = v4;
  sub_25B332D94();
  sub_25B37F3E0();
  sub_25B374DFC(*(void *)a2);
  sub_25B2CA2D8(v3, v5);
  uint64_t result = swift_release();
  *(void *)a2 = v7;
  *(unsigned char *)(a2 + 8) = v8;
  return result;
}

double sub_25B36F3A0(uint64_t a1, uint64_t a2)
{
  sub_25B37F400();
  swift_allocObject();
  sub_25B37F3F0();
  uint64_t v3 = sub_25B37F570();
  unint64_t v5 = v4;
  sub_25B332F64();
  sub_25B37F3E0();
  swift_bridgeObjectRelease();
  sub_25B2CA2D8(v3, v5);
  swift_release();
  double result = *(double *)&v7;
  *(_OWORD *)a2 = v7;
  *(void *)(a2 + 16) = v8;
  *(unsigned char *)(a2 + 24) = v9;
  return result;
}

uint64_t sub_25B36F498(uint64_t a1, void *a2)
{
  return sub_25B36F8AC(a1, a2, (void (*)(void))sub_25B3331E0);
}

double sub_25B36F4B8(uint64_t a1, _OWORD *a2)
{
  return sub_25B36F79C(a1, a2, (void (*)(void))sub_25B332ADC);
}

double sub_25B36F4D8(uint64_t a1, _OWORD *a2)
{
  return sub_25B36F79C(a1, a2, (void (*)(void))sub_25B332BC4);
}

uint64_t sub_25B36F4F8(uint64_t a1, uint64_t a2)
{
  sub_25B37F400();
  swift_allocObject();
  sub_25B37F3F0();
  uint64_t v3 = sub_25B37F570();
  unint64_t v5 = v4;
  sub_25B332E7C();
  sub_25B37F3E0();
  swift_bridgeObjectRelease();
  sub_25B2CA2D8(v3, v5);
  uint64_t result = swift_release();
  *(void *)a2 = v7;
  *(unsigned char *)(a2 + 8) = v8;
  return result;
}

double sub_25B36F5E8(uint64_t a1, uint64_t a2)
{
  return sub_25B36F608(a1, a2, (void (*)(void))sub_25B332824);
}

double sub_25B36F608(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  sub_25B37F400();
  swift_allocObject();
  sub_25B37F3F0();
  uint64_t v5 = sub_25B37F570();
  unint64_t v7 = v6;
  a3();
  sub_25B37F3E0();
  sub_25B310A8C(*(void *)a2, *(void *)(a2 + 8));
  sub_25B2CA2D8(v5, v7);
  swift_release();
  *(_OWORD *)a2 = v9;
  *(_OWORD *)(a2 + 16) = v10;
  *(_OWORD *)(a2 + 32) = v11;
  *(_OWORD *)(a2 + 48) = v12;
  double result = *(double *)&v13;
  *(_OWORD *)(a2 + 64) = v13;
  return result;
}

double sub_25B36F71C(uint64_t a1, _OWORD *a2)
{
  return sub_25B36F79C(a1, a2, (void (*)(void))sub_25B3329F4);
}

double sub_25B36F73C(uint64_t a1, _OWORD *a2)
{
  return sub_25B36F79C(a1, a2, (void (*)(void))sub_25B33290C);
}

uint64_t sub_25B36F75C(uint64_t a1, void *a2)
{
  return sub_25B36F8AC(a1, a2, (void (*)(void))sub_25B33304C);
}

double sub_25B36F77C(uint64_t a1, _OWORD *a2)
{
  return sub_25B36F79C(a1, a2, (void (*)(void))sub_25B332CAC);
}

double sub_25B36F79C(uint64_t a1, _OWORD *a2, void (*a3)(void))
{
  sub_25B37F400();
  swift_allocObject();
  sub_25B37F3F0();
  uint64_t v5 = sub_25B37F570();
  unint64_t v7 = v6;
  a3();
  sub_25B37F3E0();
  swift_bridgeObjectRelease();
  sub_25B2CA2D8(v5, v7);
  swift_release();
  double result = *(double *)&v9;
  *a2 = v9;
  return result;
}

uint64_t sub_25B36F88C(uint64_t a1, void *a2)
{
  return sub_25B36F8AC(a1, a2, (void (*)(void))sub_25B3332C8);
}

uint64_t sub_25B36F8AC(uint64_t a1, void *a2, void (*a3)(void))
{
  sub_25B37F400();
  swift_allocObject();
  sub_25B37F3F0();
  uint64_t v5 = sub_25B37F570();
  unint64_t v7 = v6;
  a3();
  sub_25B37F3E0();
  swift_bridgeObjectRelease();
  sub_25B2CA2D8(v5, v7);
  uint64_t result = swift_release();
  *a2 = v9;
  return result;
}

BOOL sub_25B36F99C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4EC0D0);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  unint64_t v6 = &v16[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v4);
  char v8 = &v16[-v7];
  sub_25B2E344C(a2, &qword_26A4EC0D0);
  sub_25B37F400();
  swift_allocObject();
  sub_25B37F3F0();
  uint64_t v9 = type metadata accessor for ReplicatorControlXPCServerParameters.Pair(0);
  uint64_t v10 = sub_25B37F570();
  unint64_t v12 = v11;
  sub_25B374E0C((unint64_t *)&unk_26A4ECCC0, (void (*)(uint64_t))type metadata accessor for ReplicatorControlXPCServerParameters.Pair);
  sub_25B37F3E0();
  swift_release();
  sub_25B2CA2D8(v10, v12);
  uint64_t v13 = *(void *)(v9 - 8);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v13 + 56))(v8, 0, 1, v9);
  sub_25B2E31F0((uint64_t)v8, a2, &qword_26A4EC0D0);
  sub_25B2E2FE0(a2, (uint64_t)v6, &qword_26A4EC0D0);
  BOOL v14 = (*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v13 + 48))(v6, 1, v9) != 1;
  sub_25B2E344C((uint64_t)v6, &qword_26A4EC0D0);
  return v14;
}

BOOL sub_25B36FBB8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4EC0C8);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  unint64_t v6 = &v16[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v4);
  char v8 = &v16[-v7];
  sub_25B2E344C(a2, &qword_26A4EC0C8);
  sub_25B37F400();
  swift_allocObject();
  sub_25B37F3F0();
  uint64_t v9 = type metadata accessor for ReplicatorControlXPCServerParameters.Unpair(0);
  uint64_t v10 = sub_25B37F570();
  unint64_t v12 = v11;
  sub_25B374E0C((unint64_t *)&unk_26A4ECCB0, (void (*)(uint64_t))type metadata accessor for ReplicatorControlXPCServerParameters.Unpair);
  sub_25B37F3E0();
  swift_release();
  sub_25B2CA2D8(v10, v12);
  uint64_t v13 = *(void *)(v9 - 8);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v13 + 56))(v8, 0, 1, v9);
  sub_25B2E31F0((uint64_t)v8, a2, &qword_26A4EC0C8);
  sub_25B2E2FE0(a2, (uint64_t)v6, &qword_26A4EC0C8);
  BOOL v14 = (*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v13 + 48))(v6, 1, v9) != 1;
  sub_25B2E344C((uint64_t)v6, &qword_26A4EC0C8);
  return v14;
}

BOOL sub_25B36FDD4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4EC0C0);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  unint64_t v6 = &v16[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v4);
  char v8 = &v16[-v7];
  sub_25B2E344C(a2, &qword_26A4EC0C0);
  sub_25B37F400();
  swift_allocObject();
  sub_25B37F3F0();
  uint64_t v9 = type metadata accessor for ReplicatorControlXPCServerParameters.Unavailable(0);
  uint64_t v10 = sub_25B37F570();
  unint64_t v12 = v11;
  sub_25B374E0C((unint64_t *)&unk_26A4ECCA0, (void (*)(uint64_t))type metadata accessor for ReplicatorControlXPCServerParameters.Unavailable);
  sub_25B37F3E0();
  swift_release();
  sub_25B2CA2D8(v10, v12);
  uint64_t v13 = *(void *)(v9 - 8);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v13 + 56))(v8, 0, 1, v9);
  sub_25B2E31F0((uint64_t)v8, a2, &qword_26A4EC0C0);
  sub_25B2E2FE0(a2, (uint64_t)v6, &qword_26A4EC0C0);
  BOOL v14 = (*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v13 + 48))(v6, 1, v9) != 1;
  sub_25B2E344C((uint64_t)v6, &qword_26A4EC0C0);
  return v14;
}

BOOL sub_25B36FFF0(uint64_t a1, unsigned char *a2)
{
  return sub_25B37166C(a1, a2, (void (*)(void))sub_25B3219DC);
}

BOOL sub_25B370010(uint64_t a1, unsigned char *a2)
{
  return sub_25B37166C(a1, a2, (void (*)(void))sub_25B321B18);
}

BOOL sub_25B370030(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4EC0B8);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  unint64_t v6 = &v16[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v4);
  char v8 = &v16[-v7];
  sub_25B2E344C(a2, &qword_26A4EC0B8);
  sub_25B37F400();
  swift_allocObject();
  sub_25B37F3F0();
  uint64_t v9 = type metadata accessor for ReplicatorControlXPCServerParameters.AllowListID(0);
  uint64_t v10 = sub_25B37F570();
  unint64_t v12 = v11;
  sub_25B374E0C((unint64_t *)&unk_26A4ECC90, (void (*)(uint64_t))type metadata accessor for ReplicatorControlXPCServerParameters.AllowListID);
  sub_25B37F3E0();
  swift_release();
  sub_25B2CA2D8(v10, v12);
  uint64_t v13 = *(void *)(v9 - 8);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v13 + 56))(v8, 0, 1, v9);
  sub_25B2E31F0((uint64_t)v8, a2, &qword_26A4EC0B8);
  sub_25B2E2FE0(a2, (uint64_t)v6, &qword_26A4EC0B8);
  BOOL v14 = (*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v13 + 48))(v6, 1, v9) != 1;
  sub_25B2E344C((uint64_t)v6, &qword_26A4EC0B8);
  return v14;
}

BOOL sub_25B37024C(uint64_t a1, void *a2)
{
  return sub_25B371970(a1, a2, (void (*)(void))sub_25B321D00);
}

BOOL sub_25B37026C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A4ECC70);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  unint64_t v6 = &v16[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v4);
  char v8 = &v16[-v7];
  sub_25B2E344C(a2, (uint64_t *)&unk_26A4ECC70);
  sub_25B37F400();
  swift_allocObject();
  sub_25B37F3F0();
  uint64_t PushToken = type metadata accessor for ReplicatorControlXPCServerParameters.GetPushToken(0);
  uint64_t v10 = sub_25B37F570();
  unint64_t v12 = v11;
  sub_25B374E0C(&qword_26A4EBEC8, (void (*)(uint64_t))type metadata accessor for ReplicatorControlXPCServerParameters.GetPushToken);
  sub_25B37F3E0();
  swift_release();
  sub_25B2CA2D8(v10, v12);
  uint64_t v13 = *(void *)(PushToken - 8);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v13 + 56))(v8, 0, 1, PushToken);
  sub_25B2E31F0((uint64_t)v8, a2, (uint64_t *)&unk_26A4ECC70);
  sub_25B2E2FE0(a2, (uint64_t)v6, (uint64_t *)&unk_26A4ECC70);
  BOOL v14 = (*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v13 + 48))(v6, 1, PushToken) != 1;
  sub_25B2E344C((uint64_t)v6, (uint64_t *)&unk_26A4ECC70);
  return v14;
}

BOOL sub_25B370488(uint64_t a1, unsigned char *a2)
{
  return sub_25B37166C(a1, a2, (void (*)(void))sub_25B321EE8);
}

BOOL sub_25B3704A8(uint64_t a1, void *a2)
{
  return sub_25B371970(a1, a2, (void (*)(void))sub_25B322024);
}

BOOL sub_25B3704C8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A4ECC60);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  unint64_t v6 = &v16[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v4);
  char v8 = &v16[-v7];
  sub_25B2E344C(a2, (uint64_t *)&unk_26A4ECC60);
  sub_25B37F400();
  swift_allocObject();
  sub_25B37F3F0();
  uint64_t LocalDevice = type metadata accessor for ReplicatorControlXPCServerResponse.GetLocalDevice(0);
  uint64_t v10 = sub_25B37F570();
  unint64_t v12 = v11;
  sub_25B374E0C(&qword_26A4EBEE0, (void (*)(uint64_t))type metadata accessor for ReplicatorControlXPCServerResponse.GetLocalDevice);
  sub_25B37F3E0();
  swift_release();
  sub_25B2CA2D8(v10, v12);
  uint64_t v13 = *(void *)(LocalDevice - 8);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v13 + 56))(v8, 0, 1, LocalDevice);
  sub_25B2E31F0((uint64_t)v8, a2, (uint64_t *)&unk_26A4ECC60);
  sub_25B2E2FE0(a2, (uint64_t)v6, (uint64_t *)&unk_26A4ECC60);
  BOOL v14 = (*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v13 + 48))(v6, 1, LocalDevice) != 1;
  sub_25B2E344C((uint64_t)v6, (uint64_t *)&unk_26A4ECC60);
  return v14;
}

BOOL sub_25B3706E4(uint64_t a1, unsigned char *a2)
{
  return sub_25B37166C(a1, a2, (void (*)(void))sub_25B32220C);
}

BOOL sub_25B370704(uint64_t a1, void *a2)
{
  return sub_25B371970(a1, a2, (void (*)(void))sub_25B322348);
}

BOOL sub_25B370724(uint64_t a1, uint64_t a2)
{
  sub_25B2CA2C4(*(void *)a2, *(void *)(a2 + 8));
  sub_25B37F400();
  swift_allocObject();
  sub_25B37F3F0();
  uint64_t v3 = sub_25B37F570();
  unint64_t v5 = v4;
  sub_25B322508();
  sub_25B37F3E0();
  swift_release();
  sub_25B2CA2D8(v3, v5);
  *(void *)a2 = v7;
  *(void *)(a2 + 8) = v8;
  return v8 >> 60 != 15;
}

BOOL sub_25B370814(uint64_t a1, uint64_t a2)
{
  return sub_25B370F94(a1, a2, (void (*)(uint64_t, unint64_t))sub_25B332824);
}

BOOL sub_25B370834(uint64_t a1, void *a2)
{
  return sub_25B3708D4(a1, a2, (void (*)(void))sub_25B33290C);
}

BOOL sub_25B370854(uint64_t a1, void *a2)
{
  return sub_25B3708D4(a1, a2, (void (*)(void))sub_25B3329F4);
}

BOOL sub_25B370874(uint64_t a1, void *a2)
{
  return sub_25B3708D4(a1, a2, (void (*)(void))sub_25B332ADC);
}

BOOL sub_25B370894(uint64_t a1, void *a2)
{
  return sub_25B3708D4(a1, a2, (void (*)(void))sub_25B332BC4);
}

BOOL sub_25B3708B4(uint64_t a1, void *a2)
{
  return sub_25B3708D4(a1, a2, (void (*)(void))sub_25B332CAC);
}

BOOL sub_25B3708D4(uint64_t a1, void *a2, void (*a3)(void))
{
  swift_bridgeObjectRelease();
  sub_25B37F400();
  swift_allocObject();
  sub_25B37F3F0();
  uint64_t v5 = sub_25B37F570();
  unint64_t v7 = v6;
  a3();
  sub_25B37F3E0();
  swift_release();
  sub_25B2CA2D8(v5, v7);
  *a2 = v9;
  a2[1] = v10;
  return v10 != 0;
}

BOOL sub_25B3709C8(uint64_t a1, uint64_t a2)
{
  sub_25B374DFC(*(void *)a2);
  sub_25B37F400();
  swift_allocObject();
  sub_25B37F3F0();
  uint64_t v3 = sub_25B37F570();
  unint64_t v5 = v4;
  sub_25B332D94();
  sub_25B37F3E0();
  swift_release();
  sub_25B2CA2D8(v3, v5);
  *(void *)a2 = v7;
  *(unsigned char *)(a2 + 8) = v8;
  return v7 != 1;
}

BOOL sub_25B370AC0(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  sub_25B37F400();
  swift_allocObject();
  sub_25B37F3F0();
  uint64_t v3 = sub_25B37F570();
  unint64_t v5 = v4;
  sub_25B332E7C();
  sub_25B37F3E0();
  swift_release();
  sub_25B2CA2D8(v3, v5);
  *(void *)a2 = v7;
  *(unsigned char *)(a2 + 8) = v8;
  return v7 != 0;
}

BOOL sub_25B370BB4(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  sub_25B37F400();
  swift_allocObject();
  sub_25B37F3F0();
  uint64_t v3 = sub_25B37F570();
  unint64_t v5 = v4;
  sub_25B332F64();
  sub_25B37F3E0();
  swift_release();
  sub_25B2CA2D8(v3, v5);
  *(_OWORD *)a2 = v7;
  *(void *)(a2 + 16) = v8;
  *(unsigned char *)(a2 + 24) = v9;
  return (void)v7 != 0;
}

BOOL sub_25B370CB8(uint64_t a1, void *a2)
{
  return sub_25B371970(a1, a2, (void (*)(void))sub_25B33304C);
}

BOOL sub_25B370CD8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A4EC420);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  unint64_t v6 = &v16[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = &v16[-v7];
  sub_25B2E344C(a2, (uint64_t *)&unk_26A4EC420);
  sub_25B37F400();
  swift_allocObject();
  sub_25B37F3F0();
  uint64_t v9 = type metadata accessor for ReplicationXPCServerParameters.SendMessage(0);
  uint64_t v10 = sub_25B37F570();
  unint64_t v12 = v11;
  sub_25B374E0C((unint64_t *)&unk_26A4ECC40, (void (*)(uint64_t))type metadata accessor for ReplicationXPCServerParameters.SendMessage);
  sub_25B37F3E0();
  swift_release();
  sub_25B2CA2D8(v10, v12);
  uint64_t v13 = *(void *)(v9 - 8);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v13 + 56))(v8, 0, 1, v9);
  sub_25B2E31F0((uint64_t)v8, a2, (uint64_t *)&unk_26A4EC420);
  sub_25B2E2FE0(a2, (uint64_t)v6, (uint64_t *)&unk_26A4EC420);
  BOOL v14 = (*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v13 + 48))(v6, 1, v9) != 1;
  sub_25B2E344C((uint64_t)v6, (uint64_t *)&unk_26A4EC420);
  return v14;
}

BOOL sub_25B370EF4(uint64_t a1, void *a2)
{
  return sub_25B371970(a1, a2, (void (*)(void))sub_25B3331E0);
}

BOOL sub_25B370F14(uint64_t a1, void *a2)
{
  return sub_25B371970(a1, a2, (void (*)(void))sub_25B3332C8);
}

BOOL sub_25B370F34(uint64_t a1, void *a2)
{
  return sub_25B371970(a1, a2, (void (*)(void))sub_25B318614);
}

BOOL sub_25B370F54(uint64_t a1, void *a2)
{
  return sub_25B371970(a1, a2, (void (*)(void))sub_25B3187A8);
}

BOOL sub_25B370F74(uint64_t a1, uint64_t a2)
{
  return sub_25B370F94(a1, a2, (void (*)(uint64_t, unint64_t))sub_25B319110);
}

BOOL sub_25B370F94(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, unint64_t))
{
  sub_25B310A8C(*(void *)a2, *(void *)(a2 + 8));
  sub_25B37F400();
  swift_allocObject();
  sub_25B37F3F0();
  uint64_t v5 = sub_25B37F570();
  unint64_t v7 = v6;
  a3(v5, v6);
  sub_25B37F3E0();
  swift_release();
  sub_25B2CA2D8(v5, v7);
  *(void *)a2 = v9;
  *(_OWORD *)(a2 + 8) = v10;
  *(_OWORD *)(a2 + 24) = v11;
  *(_OWORD *)(a2 + 40) = v12;
  *(_OWORD *)(a2 + 56) = v13;
  *(void *)(a2 + 72) = v14;
  return (void)v10 != 0;
}

BOOL sub_25B3710D8(uint64_t a1, uint64_t *a2)
{
  sub_25B31875C(*a2);
  sub_25B37F400();
  swift_allocObject();
  sub_25B37F3F0();
  uint64_t v3 = sub_25B37F570();
  unint64_t v5 = v4;
  sub_25B3186BC();
  sub_25B37F3E0();
  swift_release();
  sub_25B2CA2D8(v3, v5);
  *(_OWORD *)a2 = v7;
  a2[2] = v8;
  return (void)v7 != 0;
}

BOOL sub_25B3711D4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4EBC40);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  unint64_t v6 = &v16[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = &v16[-v7];
  sub_25B2E344C(a2, &qword_26A4EBC40);
  sub_25B37F400();
  swift_allocObject();
  sub_25B37F3F0();
  uint64_t v9 = type metadata accessor for ReplicationXPCServerResponse.ReceiveMessage(0);
  uint64_t v10 = sub_25B37F570();
  unint64_t v12 = v11;
  sub_25B374E0C(&qword_26A4EC290, (void (*)(uint64_t))type metadata accessor for ReplicationXPCServerResponse.ReceiveMessage);
  sub_25B37F3E0();
  swift_release();
  sub_25B2CA2D8(v10, v12);
  uint64_t v13 = *(void *)(v9 - 8);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v13 + 56))(v8, 0, 1, v9);
  sub_25B2E31F0((uint64_t)v8, a2, &qword_26A4EBC40);
  sub_25B2E2FE0(a2, (uint64_t)v6, &qword_26A4EBC40);
  BOOL v14 = (*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v13 + 48))(v6, 1, v9) != 1;
  sub_25B2E344C((uint64_t)v6, &qword_26A4EBC40);
  return v14;
}

BOOL sub_25B3713F0(uint64_t a1, void *a2)
{
  return sub_25B371970(a1, a2, (void (*)(void))sub_25B319030);
}

BOOL sub_25B371410(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4EB540);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  unint64_t v6 = &v16[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = &v16[-v7];
  sub_25B2E344C(a2, &qword_26A4EB540);
  sub_25B37F400();
  swift_allocObject();
  sub_25B37F3F0();
  uint64_t LocalDeviceID = type metadata accessor for ReplicationXPCServerResponse.GetLocalDeviceID(0);
  uint64_t v10 = sub_25B37F570();
  unint64_t v12 = v11;
  sub_25B374E0C(&qword_26B340BD0, (void (*)(uint64_t))type metadata accessor for ReplicationXPCServerResponse.GetLocalDeviceID);
  sub_25B37F3E0();
  swift_release();
  sub_25B2CA2D8(v10, v12);
  uint64_t v13 = *(void *)(LocalDeviceID - 8);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v13 + 56))(v8, 0, 1, LocalDeviceID);
  sub_25B2E31F0((uint64_t)v8, a2, &qword_26A4EB540);
  sub_25B2E2FE0(a2, (uint64_t)v6, &qword_26A4EB540);
  BOOL v14 = (*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v13 + 48))(v6, 1, LocalDeviceID) != 1;
  sub_25B2E344C((uint64_t)v6, &qword_26A4EB540);
  return v14;
}

BOOL sub_25B37162C(uint64_t a1, void *a2)
{
  return sub_25B371970(a1, a2, (void (*)(void))sub_25B333990);
}

BOOL sub_25B37164C(uint64_t a1, unsigned char *a2)
{
  return sub_25B37166C(a1, a2, (void (*)(void))sub_25B319550);
}

BOOL sub_25B37166C(uint64_t a1, unsigned char *a2, void (*a3)(void))
{
  sub_25B37F400();
  swift_allocObject();
  sub_25B37F3F0();
  uint64_t v5 = sub_25B37F570();
  unint64_t v7 = v6;
  a3();
  sub_25B37F3E0();
  swift_release();
  sub_25B2CA2D8(v5, v7);
  *a2 = v9;
  return v9 != 2;
}

BOOL sub_25B371754(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ECC20);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  unint64_t v6 = &v16[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = &v16[-v7];
  sub_25B2E344C(a2, &qword_26A4ECC20);
  sub_25B37F400();
  swift_allocObject();
  sub_25B37F3F0();
  uint64_t LocalDeviceID = type metadata accessor for MigrationXPCServerResponse.GetLocalDeviceID();
  uint64_t v10 = sub_25B37F570();
  unint64_t v12 = v11;
  sub_25B374E0C((unint64_t *)&unk_26A4ECAE8, (void (*)(uint64_t))type metadata accessor for MigrationXPCServerResponse.GetLocalDeviceID);
  sub_25B37F3E0();
  swift_release();
  sub_25B2CA2D8(v10, v12);
  uint64_t v13 = *(void *)(LocalDeviceID - 8);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v13 + 56))(v8, 0, 1, LocalDeviceID);
  sub_25B2E31F0((uint64_t)v8, a2, &qword_26A4ECC20);
  sub_25B2E2FE0(a2, (uint64_t)v6, &qword_26A4ECC20);
  BOOL v14 = (*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v13 + 48))(v6, 1, LocalDeviceID) != 1;
  sub_25B2E344C((uint64_t)v6, &qword_26A4ECC20);
  return v14;
}

BOOL sub_25B371970(uint64_t a1, void *a2, void (*a3)(void))
{
  swift_bridgeObjectRelease();
  sub_25B37F400();
  swift_allocObject();
  sub_25B37F3F0();
  uint64_t v5 = sub_25B37F570();
  unint64_t v7 = v6;
  a3();
  sub_25B37F3E0();
  swift_release();
  sub_25B2CA2D8(v5, v7);
  *a2 = v9;
  return v9 != 0;
}

unsigned char *MigrationServiceError.init(code:underlyingError:)@<X0>(unsigned char *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(unsigned char *)a3 = *result;
  *(void *)(a3 + 8) = a2;
  return result;
}

uint64_t MigrationXPCServerResponse.GetLocalDeviceID.init(localDeviceID:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_25B2E31F0(a1, a2, &qword_26B3414D0);
}

id MigrationXPCServerResponseGetRecords.__allocating_init(records:)(uint64_t a1)
{
  uint64_t v3 = (char *)objc_allocWithZone(v1);
  *(void *)&v3[OBJC_IVAR____TtC18ReplicatorServices36MigrationXPCServerResponseGetRecords_records] = a1;
  v5.receiver = v3;
  v5.super_class = v1;
  return objc_msgSendSuper2(&v5, sel_init);
}

ReplicatorServices::MigrationXPCServerResponse::GetDevices __swiftcall MigrationXPCServerResponse.GetDevices.init(devices:)(ReplicatorServices::MigrationXPCServerResponse::GetDevices devices)
{
  v1->devices._rawValue = devices.devices._rawValue;
  return devices;
}

void static MigrationServiceDefinition.domain.getter(void *a1@<X8>)
{
  *a1 = 0xD000000000000026;
  a1[1] = 0x800000025B38BB10;
  a1[2] = 0xD00000000000001CLL;
  a1[3] = 0x800000025B38BB40;
}

unint64_t static MigrationServiceDefinition.serviceName.getter()
{
  return 0xD000000000000026;
}

void sub_25B371B40(void *a1@<X8>)
{
  *a1 = 0xD000000000000026;
  a1[1] = 0x800000025B38BB10;
  a1[2] = 0xD00000000000001CLL;
  a1[3] = 0x800000025B38BB40;
}

unint64_t sub_25B371B78()
{
  return 0xD000000000000026;
}

ReplicatorServices::MigrationServiceError::Code_optional __swiftcall MigrationServiceError.Code.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 3;
  if ((unint64_t)rawValue < 3) {
    char v2 = rawValue;
  }
  *uint64_t v1 = v2;
  return (ReplicatorServices::MigrationServiceError::Code_optional)rawValue;
}

uint64_t MigrationServiceError.Code.rawValue.getter()
{
  return *v0;
}

ReplicatorServices::MigrationServiceError::Code_optional sub_25B371BB0(Swift::Int *a1)
{
  return MigrationServiceError.Code.init(rawValue:)(*a1);
}

unint64_t static MigrationServiceError.errorDomain.getter()
{
  return 0xD00000000000002DLL;
}

uint64_t MigrationServiceError.errorCode.getter()
{
  return *v0;
}

unint64_t MigrationServiceError.errorUserInfo.getter()
{
  if (*(void *)(v0 + 8))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ECA20);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_25B3819A0;
    *(void *)(inited + 32) = sub_25B37F9A0();
    *(void *)(inited + 40) = v2;
    swift_getErrorValue();
    *(void *)(inited + 72) = v6;
    boxed_opaque_existential_2 = __swift_allocate_boxed_opaque_existential_2((uint64_t *)(inited + 48));
    (*(void (**)(uint64_t *))(*(void *)(v6 - 8) + 16))(boxed_opaque_existential_2);
    return sub_25B36AD10(inited);
  }
  else
  {
    uint64_t v5 = MEMORY[0x263F8EE78];
    return sub_25B36AD10(v5);
  }
}

unint64_t sub_25B371CD0()
{
  return 0xD00000000000002DLL;
}

uint64_t sub_25B371CEC(uint64_t a1)
{
  unint64_t v2 = sub_25B374DA8();
  return MEMORY[0x270EF2670](a1, v2);
}

uint64_t sub_25B371D28(uint64_t a1)
{
  unint64_t v2 = sub_25B374DA8();
  return MEMORY[0x270EF2668](a1, v2);
}

uint64_t MigrationXPCServerResponse.GetLocalDeviceID.localDeviceID.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25B2E2FE0(v1, a1, &qword_26B3414D0);
}

uint64_t sub_25B371D8C(uint64_t a1)
{
  unint64_t v2 = sub_25B3735F0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B371DC8(uint64_t a1)
{
  unint64_t v2 = sub_25B3735F0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t MigrationXPCServerResponse.GetLocalDeviceID.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ECA28);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25B3735F0();
  sub_25B3802C0();
  sub_25B37F640();
  sub_25B374E0C(&qword_26A4EB370, MEMORY[0x263F07508]);
  sub_25B380120();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t MigrationXPCServerResponse.GetLocalDeviceID.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v15 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3414D0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A4ECA40);
  uint64_t v16 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t LocalDeviceID = type metadata accessor for MigrationXPCServerResponse.GetLocalDeviceID();
  MEMORY[0x270FA5388](LocalDeviceID - 8);
  unint64_t v12 = (char *)&v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25B3735F0();
  sub_25B3802B0();
  if (!v2)
  {
    sub_25B37F640();
    sub_25B374E0C((unint64_t *)&unk_26B340D00, MEMORY[0x263F07508]);
    sub_25B380070();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v9, v7);
    sub_25B2E31F0((uint64_t)v6, (uint64_t)v12, &qword_26B3414D0);
    sub_25B374E54((uint64_t)v12, v15, (uint64_t (*)(void))type metadata accessor for MigrationXPCServerResponse.GetLocalDeviceID);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_25B3721D8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return MigrationXPCServerResponse.GetLocalDeviceID.init(from:)(a1, a2);
}

uint64_t sub_25B3721F0(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ECA28);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25B3735F0();
  sub_25B3802C0();
  sub_25B37F640();
  sub_25B374E0C(&qword_26A4EB370, MEMORY[0x263F07508]);
  sub_25B380120();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_25B372364()
{
  sub_25B37F440();
  swift_allocObject();
  sub_25B37F430();
  sub_25B374E0C((unint64_t *)&unk_26A4EC900, (void (*)(uint64_t))type metadata accessor for MigrationXPCServerResponse.GetLocalDeviceID);
  uint64_t v0 = sub_25B37F420();
  unint64_t v2 = v1;
  uint64_t v3 = sub_25B37F560();
  sub_25B2CA2D8(v0, v2);
  swift_release();
  return v3;
}

uint64_t sub_25B37244C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ECC20);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25B37F400();
  swift_allocObject();
  sub_25B37F3F0();
  uint64_t v8 = sub_25B37F570();
  unint64_t v10 = v9;
  sub_25B374E0C((unint64_t *)&unk_26A4ECAE8, (void (*)(uint64_t))type metadata accessor for MigrationXPCServerResponse.GetLocalDeviceID);
  sub_25B37F3E0();
  sub_25B2E344C(a2, &qword_26A4ECC20);
  sub_25B2CA2D8(v8, v10);
  swift_release();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(a3 - 8) + 56))(v7, 0, 1, a3);
  return sub_25B2E31F0((uint64_t)v7, a2, &qword_26A4ECC20);
}

uint64_t MigrationXPCServerResponse.GetDevices.devices.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_25B372614(uint64_t a1)
{
  unint64_t v2 = sub_25B373690();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B372650(uint64_t a1)
{
  unint64_t v2 = sub_25B373690();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t MigrationXPCServerResponse.GetDevices.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ECA50);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25B373690();
  sub_25B3802C0();
  v9[1] = v7;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B3416E0);
  sub_25B3736E4((unint64_t *)&qword_26A4EB4A0, &qword_26A4EB3C0);
  sub_25B380160();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t MigrationXPCServerResponse.GetDevices.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ECA68);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25B373690();
  sub_25B3802B0();
  if (!v2)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B3416E0);
    sub_25B3736E4((unint64_t *)&qword_26B3411C0, &qword_26B341030);
    sub_25B3800B0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10[1];
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_25B3729C4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return MigrationXPCServerResponse.GetDevices.init(from:)(a1, a2);
}

uint64_t sub_25B3729DC(void *a1)
{
  return MigrationXPCServerResponse.GetDevices.encode(to:)(a1);
}

uint64_t sub_25B3729F4(uint64_t a1, uint64_t a2)
{
  return sub_25B37340C(a1, a2, (void (*)(void))sub_25B35C77C);
}

uint64_t sub_25B372A0C(uint64_t a1, void *a2)
{
  return sub_25B36F8AC(a1, a2, (void (*)(void))sub_25B3742A8);
}

BOOL sub_25B372A40(uint64_t a1, void *a2)
{
  return sub_25B371970(a1, a2, (void (*)(void))sub_25B3742A8);
}

uint64_t sub_25B372A78@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_25B36EC28(a1, (void (*)(void))sub_25B3742A8, a2);
}

uint64_t sub_25B372AAC(uint64_t a1)
{
  unint64_t v2 = sub_25B373778();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B372AE8(uint64_t a1)
{
  unint64_t v2 = sub_25B373778();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t MigrationXPCServerResponse.GetClientDescriptors.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ECA70);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25B373778();
  sub_25B3802C0();
  v9[1] = v7;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B341700);
  sub_25B3737CC(&qword_26B3411D0, (uint64_t *)&unk_26B341700, (void (*)(void))sub_25B3316A4);
  sub_25B380160();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t MigrationXPCServerResponse.GetClientDescriptors.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ECA88);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25B373778();
  sub_25B3802B0();
  if (!v2)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B341700);
    sub_25B3737CC(&qword_26A4EB4B0, (uint64_t *)&unk_26B341700, (void (*)(void))sub_25B3316F8);
    sub_25B3800B0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10[1];
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_25B372E5C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return MigrationXPCServerResponse.GetClientDescriptors.init(from:)(a1, a2);
}

uint64_t sub_25B372E74(void *a1)
{
  return MigrationXPCServerResponse.GetClientDescriptors.encode(to:)(a1);
}

uint64_t sub_25B372E8C(uint64_t a1, uint64_t a2)
{
  return sub_25B37340C(a1, a2, (void (*)(void))sub_25B35C728);
}

uint64_t sub_25B372EA4(uint64_t a1, void *a2)
{
  return sub_25B36F8AC(a1, a2, (void (*)(void))sub_25B374390);
}

BOOL sub_25B372ED8(uint64_t a1, void *a2)
{
  return sub_25B371970(a1, a2, (void (*)(void))sub_25B374390);
}

uint64_t sub_25B372F10@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_25B36EC28(a1, (void (*)(void))sub_25B374390, a2);
}

uint64_t sub_25B372F44()
{
  return 0x74616E6974736564;
}

uint64_t sub_25B372F64@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x74616E6974736564 && a2 == 0xEC000000736E6F69)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_25B3801A0();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_25B373014(uint64_t a1)
{
  unint64_t v2 = sub_25B373838();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B373050(uint64_t a1)
{
  unint64_t v2 = sub_25B373838();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t MigrationXPCServerResponse.GetRecordDestinations.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ECA90);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25B373838();
  sub_25B3802C0();
  v9[1] = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ECAA0);
  sub_25B3737CC((unint64_t *)&unk_26A4ECAA8, &qword_26A4ECAA0, (void (*)(void))sub_25B331944);
  sub_25B380160();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t MigrationXPCServerResponse.GetRecordDestinations.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ECAB8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25B373838();
  sub_25B3802B0();
  if (!v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ECAA0);
    sub_25B3737CC((unint64_t *)&unk_26A4ECAC0, &qword_26A4ECAA0, (void (*)(void))sub_25B3319EC);
    sub_25B3800B0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10[1];
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_25B3733C4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return MigrationXPCServerResponse.GetRecordDestinations.init(from:)(a1, a2);
}

uint64_t sub_25B3733DC(void *a1)
{
  return MigrationXPCServerResponse.GetRecordDestinations.encode(to:)(a1);
}

uint64_t sub_25B3733F4(uint64_t a1, uint64_t a2)
{
  return sub_25B37340C(a1, a2, (void (*)(void))sub_25B3740B8);
}

uint64_t sub_25B37340C(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  sub_25B37F440();
  swift_allocObject();
  sub_25B37F430();
  a3();
  uint64_t v4 = sub_25B37F420();
  unint64_t v6 = v5;
  uint64_t v7 = sub_25B37F560();
  sub_25B2CA2D8(v4, v6);
  swift_release();
  return v7;
}

uint64_t sub_25B3734D0(uint64_t a1, void *a2)
{
  return sub_25B36F8AC(a1, a2, (void (*)(void))sub_25B374478);
}

BOOL sub_25B373504(uint64_t a1, void *a2)
{
  return sub_25B371970(a1, a2, (void (*)(void))sub_25B374478);
}

uint64_t sub_25B37353C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_25B36EC28(a1, (void (*)(void))sub_25B374478, a2);
}

uint64_t static MigrationXPCServerResponseGetRecords.supportsBSXPCSecureCoding()()
{
  return 1;
}

Swift::Bool __swiftcall MigrationXPCServerResponseGetRecords.supportsBSXPCSecureCoding()()
{
  return 1;
}

uint64_t MigrationXPCServerResponseGetRecords.records.getter()
{
  return swift_bridgeObjectRetain();
}

id MigrationXPCServerResponseGetRecords.init(records:)(uint64_t a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v1[OBJC_IVAR____TtC18ReplicatorServices36MigrationXPCServerResponseGetRecords_records] = a1;
  v5.receiver = v1;
  v5.super_class = ObjectType;
  return objc_msgSendSuper2(&v5, sel_init);
}

unint64_t sub_25B3735F0()
{
  unint64_t result = qword_26A4ECA30;
  if (!qword_26A4ECA30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ECA30);
  }
  return result;
}

uint64_t type metadata accessor for MigrationXPCServerResponse.GetLocalDeviceID()
{
  uint64_t result = qword_26A4ECB48;
  if (!qword_26A4ECB48) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_25B373690()
{
  unint64_t result = qword_26A4ECA58;
  if (!qword_26A4ECA58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ECA58);
  }
  return result;
}

uint64_t sub_25B3736E4(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_26B3416E0);
    sub_25B374E0C(a2, (void (*)(uint64_t))type metadata accessor for ReplicatorDevice);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_25B373778()
{
  unint64_t result = qword_26A4ECA78;
  if (!qword_26A4ECA78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ECA78);
  }
  return result;
}

uint64_t sub_25B3737CC(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_25B373838()
{
  unint64_t result = qword_26A4ECA98;
  if (!qword_26A4ECA98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ECA98);
  }
  return result;
}

void MigrationXPCServerResponseGetRecords.encode(withBSXPCCoder:)(void *a1)
{
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC18ReplicatorServices36MigrationXPCServerResponseGetRecords_records);
  uint64_t v4 = *(void *)(v3 + 16);
  if (v4)
  {
    swift_bridgeObjectRetain();
    sub_25B37FF10();
    uint64_t v5 = 32;
    do
    {
      id v6 = *(id *)(v3 + v5);
      sub_25B37FEE0();
      sub_25B37FF20();
      sub_25B37FF30();
      sub_25B37FEF0();
      v5 += 16;
      --v4;
    }
    while (v4);
    swift_bridgeObjectRelease();
    int64_t v7 = *(void *)(v3 + 16);
    if (v7)
    {
      uint64_t v19 = MEMORY[0x263F8EE78];
      swift_bridgeObjectRetain();
      sub_25B310BE4(0, v7, 0);
      uint64_t v8 = 40;
      do
      {
        uint64_t v9 = *(void *)(v3 + v8);
        unint64_t v11 = *(void *)(v19 + 16);
        unint64_t v10 = *(void *)(v19 + 24);
        swift_bridgeObjectRetain();
        if (v11 >= v10 >> 1) {
          sub_25B310BE4(v10 > 1, v11 + 1, 1);
        }
        *(void *)(v19 + 16) = v11 + 1;
        *(void *)(v19 + 8 * v11 + 32) = v9;
        v8 += 16;
        --v7;
      }
      while (v7);
      swift_bridgeObjectRelease();
    }
  }
  type metadata accessor for ReplicationXPCServerParametersRecord(0);
  uint64_t v12 = (void *)sub_25B37FAE0();
  swift_bridgeObjectRelease();
  uint64_t v13 = (void *)sub_25B37F970();
  objc_msgSend(a1, sel_encodeCollection_forKey_, v12, v13);

  sub_25B37F440();
  swift_allocObject();
  sub_25B37F430();
  sub_25B3740B8();
  uint64_t v14 = sub_25B37F420();
  unint64_t v16 = v15;
  uint64_t v17 = (void *)sub_25B37F560();
  sub_25B2CA2D8(v14, v16);
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v18 = (void *)sub_25B37F970();
  objc_msgSend(a1, sel_encodeObject_forKey_, v17, v18);
}

uint64_t MigrationXPCServerResponseGetRecords.__allocating_init(bsxpcCoder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return MigrationXPCServerResponseGetRecords.init(bsxpcCoder:)(a1);
}

uint64_t MigrationXPCServerResponseGetRecords.init(bsxpcCoder:)(void *a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_25B3393BC(0, &qword_26B3409B8);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  type metadata accessor for ReplicationXPCServerParametersRecord(0);
  uint64_t v5 = swift_getObjCClassFromMetadata();
  id v6 = v1;
  int64_t v7 = (void *)sub_25B37F970();
  id v8 = objc_msgSend(a1, sel_decodeCollectionOfClass_containingClass_forKey_, ObjCClassFromMetadata, v5, v7);

  if (!v8
    || (v29[0] = v8,
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B340B70),
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B340B58),
        (swift_dynamicCast() & 1) == 0))
  {
    swift_unknownObjectRelease();

LABEL_6:
    swift_deallocPartialClassInstance();
    return 0;
  }
  unint64_t v9 = *(void *)&v28[0];
  sub_25B3393BC(0, (unint64_t *)&unk_26B340B90);
  uint64_t v10 = swift_getObjCClassFromMetadata();
  unint64_t v11 = (void *)sub_25B37F970();
  id v12 = objc_msgSend(a1, sel_decodeObjectOfClass_forKey_, v10, v11);

  if (v12)
  {
    sub_25B37FDA0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v28, 0, sizeof(v28));
  }
  sub_25B2E31F0((uint64_t)v28, (uint64_t)v29, &qword_26B3413D8);
  if (!v29[3])
  {
    swift_unknownObjectRelease();

    swift_bridgeObjectRelease();
    sub_25B2E344C((uint64_t)v29, &qword_26B3413D8);
    goto LABEL_6;
  }
  uint64_t result = swift_dynamicCast();
  if ((result & 1) == 0)
  {
    swift_unknownObjectRelease();

    swift_bridgeObjectRelease();
    goto LABEL_6;
  }
  uint64_t v15 = v27;
  if (v9 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_25B37FF90();
    uint64_t result = swift_bridgeObjectRelease();
    if (v16 < 0)
    {
      __break(1u);
      goto LABEL_31;
    }
  }
  else
  {
    uint64_t v16 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (!v16)
  {
    swift_bridgeObjectRelease();
    uint64_t v18 = (void *)MEMORY[0x263F8EE78];
LABEL_28:
    swift_bridgeObjectRelease();
    *(void *)&v6[OBJC_IVAR____TtC18ReplicatorServices36MigrationXPCServerResponseGetRecords_records] = v18;

    v26.receiver = v6;
    v26.super_class = ObjectType;
    id v13 = objc_msgSendSuper2(&v26, sel_init);
    swift_unknownObjectRelease();
    return (uint64_t)v13;
  }
  int v25 = ObjectType;
  if ((unint64_t)(v16 - 1) < *(void *)(v27 + 16))
  {
    uint64_t v17 = 0;
    uint64_t v18 = (void *)MEMORY[0x263F8EE78];
    do
    {
      if ((v9 & 0xC000000000000001) != 0) {
        id v19 = (id)MEMORY[0x2611615C0](v17, v9);
      }
      else {
        id v19 = *(id *)(v9 + 8 * v17 + 32);
      }
      id v20 = v19;
      uint64_t v21 = *(void *)(v15 + 8 * v17 + 32);
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v18 = sub_25B310854(0, v18[2] + 1, 1, v18);
      }
      unint64_t v23 = v18[2];
      unint64_t v22 = v18[3];
      if (v23 >= v22 >> 1) {
        uint64_t v18 = sub_25B310854((void *)(v22 > 1), v23 + 1, 1, v18);
      }
      ++v17;
      v18[2] = v23 + 1;
      id v24 = &v18[2 * v23];
      v24[4] = v20;
      v24[5] = v21;
    }
    while (v16 != v17);
    swift_bridgeObjectRelease();
    ObjectType = v25;
    goto LABEL_28;
  }
LABEL_31:
  __break(1u);
  return result;
}

id MigrationXPCServerResponseGetRecords.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void MigrationXPCServerResponseGetRecords.init()()
{
}

id MigrationXPCServerResponseGetRecords.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_25B3740B8()
{
  unint64_t result = qword_26A4ECAD0;
  if (!qword_26A4ECAD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ECAD0);
  }
  return result;
}

unint64_t sub_25B374110()
{
  unint64_t result = qword_26A4ECAD8;
  if (!qword_26A4ECAD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ECAD8);
  }
  return result;
}

uint64_t sub_25B374168(void *a1)
{
  a1[1] = sub_25B374E0C((unint64_t *)&unk_26A4ECAE8, (void (*)(uint64_t))type metadata accessor for MigrationXPCServerResponse.GetLocalDeviceID);
  a1[2] = sub_25B374E0C((unint64_t *)&unk_26A4EC900, (void (*)(uint64_t))type metadata accessor for MigrationXPCServerResponse.GetLocalDeviceID);
  uint64_t result = sub_25B374E0C(&qword_26A4ECAF8, (void (*)(uint64_t))type metadata accessor for MigrationXPCServerResponse.GetLocalDeviceID);
  a1[3] = result;
  return result;
}

uint64_t sub_25B374214(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_25B374254(a1, a2, a3, (uint64_t (*)(void))sub_25B3742A8, (uint64_t (*)(void))sub_25B35C77C, (uint64_t (*)(void))sub_25B3742FC);
}

uint64_t sub_25B374254(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t (*a5)(void), uint64_t (*a6)(void))
{
  a1[1] = a4();
  a1[2] = a5();
  uint64_t result = a6();
  a1[3] = result;
  return result;
}

unint64_t sub_25B3742A8()
{
  unint64_t result = qword_26A4ECB00;
  if (!qword_26A4ECB00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ECB00);
  }
  return result;
}

unint64_t sub_25B3742FC()
{
  unint64_t result = qword_26A4ECB10;
  if (!qword_26A4ECB10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ECB10);
  }
  return result;
}

uint64_t sub_25B374350(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_25B374254(a1, a2, a3, (uint64_t (*)(void))sub_25B374390, (uint64_t (*)(void))sub_25B35C728, (uint64_t (*)(void))sub_25B3743E4);
}

unint64_t sub_25B374390()
{
  unint64_t result = qword_26A4ECB18;
  if (!qword_26A4ECB18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ECB18);
  }
  return result;
}

unint64_t sub_25B3743E4()
{
  unint64_t result = qword_26A4ECB28;
  if (!qword_26A4ECB28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ECB28);
  }
  return result;
}

uint64_t sub_25B374438(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_25B374254(a1, a2, a3, (uint64_t (*)(void))sub_25B374478, (uint64_t (*)(void))sub_25B3740B8, (uint64_t (*)(void))sub_25B3744CC);
}

unint64_t sub_25B374478()
{
  unint64_t result = qword_26A4ECB30;
  if (!qword_26A4ECB30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ECB30);
  }
  return result;
}

unint64_t sub_25B3744CC()
{
  unint64_t result = qword_26A4ECB38;
  if (!qword_26A4ECB38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ECB38);
  }
  return result;
}

ValueMetadata *type metadata accessor for MigrationServiceDefinition()
{
  return &type metadata for MigrationServiceDefinition;
}

ValueMetadata *type metadata accessor for MigrationServiceError()
{
  return &type metadata for MigrationServiceError;
}

unsigned char *storeEnumTagSinglePayload for MigrationServiceError.Code(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25B37460CLL);
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

ValueMetadata *type metadata accessor for MigrationServiceError.Code()
{
  return &type metadata for MigrationServiceError.Code;
}

ValueMetadata *type metadata accessor for MigrationXPCServerResponse()
{
  return &type metadata for MigrationXPCServerResponse;
}

uint64_t getEnumTagSinglePayload for MigrationXPCServerResponse.GetLocalDeviceID(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25B374668);
}

uint64_t sub_25B374668(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3414D0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for MigrationXPCServerResponse.GetLocalDeviceID(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25B3746EC);
}

uint64_t sub_25B3746EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3414D0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

void sub_25B374760()
{
  sub_25B316BC4();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

ValueMetadata *type metadata accessor for MigrationXPCServerResponse.GetDevices()
{
  return &type metadata for MigrationXPCServerResponse.GetDevices;
}

ValueMetadata *type metadata accessor for MigrationXPCServerResponse.GetClientDescriptors()
{
  return &type metadata for MigrationXPCServerResponse.GetClientDescriptors;
}

ValueMetadata *type metadata accessor for MigrationXPCServerResponse.GetRecordDestinations()
{
  return &type metadata for MigrationXPCServerResponse.GetRecordDestinations;
}

uint64_t type metadata accessor for MigrationXPCServerResponseGetRecords()
{
  return self;
}

uint64_t method lookup function for MigrationXPCServerResponseGetRecords(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MigrationXPCServerResponseGetRecords);
}

uint64_t dispatch thunk of MigrationXPCServerResponseGetRecords.__allocating_init(records:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of MigrationXPCServerResponseGetRecords.__allocating_init(bsxpcCoder:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

ValueMetadata *type metadata accessor for MigrationXPCServerResponse.GetRecordDestinations.CodingKeys()
{
  return &type metadata for MigrationXPCServerResponse.GetRecordDestinations.CodingKeys;
}

ValueMetadata *type metadata accessor for MigrationXPCServerResponse.GetClientDescriptors.CodingKeys()
{
  return &type metadata for MigrationXPCServerResponse.GetClientDescriptors.CodingKeys;
}

ValueMetadata *type metadata accessor for MigrationXPCServerResponse.GetDevices.CodingKeys()
{
  return &type metadata for MigrationXPCServerResponse.GetDevices.CodingKeys;
}

unsigned char *_s18ReplicatorServices26MigrationXPCServerResponseO21GetRecordDestinationsV10CodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25B374950);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for MigrationXPCServerResponse.GetLocalDeviceID.CodingKeys()
{
  return &type metadata for MigrationXPCServerResponse.GetLocalDeviceID.CodingKeys;
}

unint64_t sub_25B37498C()
{
  unint64_t result = qword_26A4ECBC0;
  if (!qword_26A4ECBC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ECBC0);
  }
  return result;
}

unint64_t sub_25B3749E4()
{
  unint64_t result = qword_26A4ECBC8;
  if (!qword_26A4ECBC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ECBC8);
  }
  return result;
}

unint64_t sub_25B374A3C()
{
  unint64_t result = qword_26A4ECBD0;
  if (!qword_26A4ECBD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ECBD0);
  }
  return result;
}

unint64_t sub_25B374A94()
{
  unint64_t result = qword_26A4ECBD8;
  if (!qword_26A4ECBD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ECBD8);
  }
  return result;
}

unint64_t sub_25B374AEC()
{
  unint64_t result = qword_26A4ECBE0;
  if (!qword_26A4ECBE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ECBE0);
  }
  return result;
}

unint64_t sub_25B374B44()
{
  unint64_t result = qword_26A4ECBE8;
  if (!qword_26A4ECBE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ECBE8);
  }
  return result;
}

unint64_t sub_25B374B9C()
{
  unint64_t result = qword_26A4ECBF0;
  if (!qword_26A4ECBF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ECBF0);
  }
  return result;
}

unint64_t sub_25B374BF4()
{
  unint64_t result = qword_26A4ECBF8;
  if (!qword_26A4ECBF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ECBF8);
  }
  return result;
}

unint64_t sub_25B374C4C()
{
  unint64_t result = qword_26A4ECC00;
  if (!qword_26A4ECC00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ECC00);
  }
  return result;
}

unint64_t sub_25B374CA4()
{
  unint64_t result = qword_26A4ECC08;
  if (!qword_26A4ECC08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ECC08);
  }
  return result;
}

unint64_t sub_25B374CFC()
{
  unint64_t result = qword_26A4ECC10;
  if (!qword_26A4ECC10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ECC10);
  }
  return result;
}

unint64_t sub_25B374D54()
{
  unint64_t result = qword_26A4ECC18;
  if (!qword_26A4ECC18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ECC18);
  }
  return result;
}

unint64_t sub_25B374DA8()
{
  unint64_t result = qword_26A4ECC28;
  if (!qword_26A4ECC28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ECC28);
  }
  return result;
}

uint64_t sub_25B374DFC(uint64_t result)
{
  if (result != 1) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25B374E0C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25B374E54(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void static StateCaptureServiceDefinition.domain.getter(void *a1@<X8>)
{
  *a1 = 0xD000000000000014;
  a1[1] = 0x800000025B38A580;
  a1[2] = 0xD00000000000001CLL;
  a1[3] = 0x800000025B38A5A0;
}

unint64_t static StateCaptureServiceDefinition.serviceName.getter()
{
  return 0xD00000000000001ALL;
}

unint64_t sub_25B374F20()
{
  return 0xD00000000000001ALL;
}

ReplicatorServices::StateCaptureServiceError::Code_optional __swiftcall StateCaptureServiceError.Code.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 3;
  if ((unint64_t)rawValue < 3) {
    char v2 = rawValue;
  }
  *id v1 = v2;
  return (ReplicatorServices::StateCaptureServiceError::Code_optional)rawValue;
}

uint64_t StateCaptureServiceError.Code.rawValue.getter()
{
  return *v0;
}

ReplicatorServices::StateCaptureServiceError::Code_optional sub_25B374F58(Swift::Int *a1)
{
  return StateCaptureServiceError.Code.init(rawValue:)(*a1);
}

unint64_t static StateCaptureServiceError.errorDomain.getter()
{
  return 0xD000000000000028;
}

unsigned char *StateCaptureServiceError.init(code:underlyingError:)@<X0>(unsigned char *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(unsigned char *)a3 = *result;
  *(void *)(a3 + 8) = a2;
  return result;
}

uint64_t StateCaptureServiceError.errorCode.getter()
{
  return *v0;
}

unint64_t StateCaptureServiceError.errorUserInfo.getter()
{
  if (*(void *)(v0 + 8))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ECA20);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_25B3819A0;
    *(void *)(inited + 32) = sub_25B37F9A0();
    *(void *)(inited + 40) = v2;
    swift_getErrorValue();
    *(void *)(inited + 72) = v6;
    boxed_opaque_existential_2 = __swift_allocate_boxed_opaque_existential_2((uint64_t *)(inited + 48));
    (*(void (**)(uint64_t *))(*(void *)(v6 - 8) + 16))(boxed_opaque_existential_2);
    return sub_25B36AD10(inited);
  }
  else
  {
    uint64_t v5 = MEMORY[0x263F8EE78];
    return sub_25B36AD10(v5);
  }
}

unint64_t sub_25B37508C()
{
  unint64_t result = qword_26A4ECCD0;
  if (!qword_26A4ECCD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ECCD0);
  }
  return result;
}

unint64_t sub_25B3750E4()
{
  unint64_t result = qword_26A4ECCD8;
  if (!qword_26A4ECCD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ECCD8);
  }
  return result;
}

unint64_t sub_25B375138()
{
  return 0xD000000000000028;
}

uint64_t sub_25B375154(uint64_t a1)
{
  unint64_t v2 = sub_25B3752F0();
  return MEMORY[0x270EF2670](a1, v2);
}

uint64_t sub_25B375190(uint64_t a1)
{
  unint64_t v2 = sub_25B3752F0();
  return MEMORY[0x270EF2668](a1, v2);
}

ValueMetadata *type metadata accessor for StateCaptureServiceDefinition()
{
  return &type metadata for StateCaptureServiceDefinition;
}

ValueMetadata *type metadata accessor for StateCaptureServiceError()
{
  return &type metadata for StateCaptureServiceError;
}

unsigned char *storeEnumTagSinglePayload for StateCaptureServiceError.Code(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25B3752B8);
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

ValueMetadata *type metadata accessor for StateCaptureServiceError.Code()
{
  return &type metadata for StateCaptureServiceError.Code;
}

unint64_t sub_25B3752F0()
{
  unint64_t result = qword_26A4ECCE0;
  if (!qword_26A4ECCE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ECCE0);
  }
  return result;
}

uint64_t URL.extendedAttributes()()
{
  sub_25B3757A8();
  if (v0) {
    return (uint64_t)v1;
  }
  uint64_t v4 = *(void *)(v2 + 16);
  if (!v4)
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE80];
  }
  uint64_t v5 = (uint64_t *)(v2 + 40);
  id v1 = (void *)MEMORY[0x263F8EE80];
  while (1)
  {
    int64_t v7 = v5;
    uint64_t v8 = *(v5 - 1);
    unint64_t v28 = v7;
    uint64_t v9 = *v7;
    MEMORY[0x270FA5388](v2);
    swift_bridgeObjectRetain();
    sub_25B37F4C0();
    uint64_t v25 = v4;
    uint64_t v10 = v26;
    sub_25B2E2B14(v26, v27);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v26 = (uint64_t)v1;
    unint64_t v13 = sub_25B2D5EB0(v8, v9);
    uint64_t v14 = v1[2];
    BOOL v15 = (v12 & 1) == 0;
    uint64_t v16 = v14 + v15;
    if (__OFADD__(v14, v15)) {
      break;
    }
    char v17 = v12;
    if (v1[3] >= v16)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        if (v12) {
          goto LABEL_5;
        }
      }
      else
      {
        sub_25B2DB5C4();
        if (v17) {
          goto LABEL_5;
        }
      }
    }
    else
    {
      sub_25B2D6F40(v16, isUniquelyReferenced_nonNull_native);
      unint64_t v18 = sub_25B2D5EB0(v8, v9);
      if ((v17 & 1) != (v19 & 1)) {
        goto LABEL_22;
      }
      unint64_t v13 = v18;
      if (v17)
      {
LABEL_5:
        uint64_t v6 = v1[7] + 16 * v13;
        sub_25B2CA2D8(*(void *)v6, *(void *)(v6 + 8));
        *(void *)uint64_t v6 = v10;
        *(void *)(v6 + 8) = v27;
        goto LABEL_6;
      }
    }
    v1[(v13 >> 6) + 8] |= 1 << v13;
    id v20 = (uint64_t *)(v1[6] + 16 * v13);
    *id v20 = v8;
    v20[1] = v9;
    uint64_t v21 = (uint64_t *)(v1[7] + 16 * v13);
    uint64_t *v21 = v10;
    v21[1] = v27;
    uint64_t v22 = v1[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (v23) {
      goto LABEL_21;
    }
    v1[2] = v24;
    swift_bridgeObjectRetain();
LABEL_6:
    uint64_t v5 = v28 + 2;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_25B2CA2D8(v10, v27);
    uint64_t v4 = v25 - 1;
    if (v25 == 1)
    {
      swift_bridgeObjectRelease();
      return (uint64_t)v1;
    }
  }
  __break(1u);
LABEL_21:
  __break(1u);
LABEL_22:
  uint64_t result = sub_25B3801C0();
  __break(1u);
  return result;
}

uint64_t sub_25B3755DC(uint64_t a1, uint64_t a2)
{
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v7, v8);
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    uint64_t v10 = v13[0];
    unint64_t v11 = v13[1];
  }
  else
  {
    sub_25B37F440();
    swift_allocObject();
    sub_25B37F430();
    sub_25B37F410();
    uint64_t v10 = sub_25B37F420();
    unint64_t v11 = v12;
    uint64_t result = swift_release();
    if (v2) {
      return result;
    }
  }
  MEMORY[0x270FA5388](result);
  v13[-4] = v10;
  v13[-3] = v11;
  v13[-2] = a1;
  v13[-1] = a2;
  sub_25B37F4C0();
  return sub_25B2CA2D8(v10, v11);
}

void sub_25B3757A8()
{
  id v1 = v0;
  uint64_t v2 = sub_25B37F9D0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25B37F4E0();
  uint64_t v6 = sub_25B37F9F0();
  swift_bridgeObjectRelease();
  ssize_t v7 = listxattr((const char *)(v6 + 32), 0, 0, 0);
  swift_release();
  if (v7 == -1)
  {
    type metadata accessor for ExtendedAttributeError();
    sub_25B376734(&qword_26A4ECCE8, (void (*)(uint64_t))type metadata accessor for ExtendedAttributeError);
    id v1 = (void *)swift_allocError();
    *unint64_t v18 = 0;
    v18[1] = 0xE000000000000000;
    v18[2] = -1;
    MEMORY[0x261160EC0]();
    uint64_t v19 = sub_25B37F790();
    if ((v19 & 0x100000000) == 0)
    {
      int v20 = v19;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ECCF0);
      sub_25B37F370();
      int v25 = v20;
      sub_25B3763DC(MEMORY[0x263F8EE78]);
      sub_25B376734(&qword_26A4ECCF8, MEMORY[0x263F06080]);
      sub_25B37F450();
      swift_storeEnumTagMultiPayload();
      swift_willThrow();
      return;
    }
    goto LABEL_16;
  }
  uint64_t v8 = (char *)swift_slowAlloc();
  sub_25B37F4E0();
  uint64_t v9 = sub_25B37F9F0();
  swift_bridgeObjectRelease();
  ssize_t v10 = listxattr((const char *)(v9 + 32), v8, v7, 0);
  swift_release();
  if (v10 == -1)
  {
    type metadata accessor for ExtendedAttributeError();
    sub_25B376734(&qword_26A4ECCE8, (void (*)(uint64_t))type metadata accessor for ExtendedAttributeError);
    id v1 = (void *)swift_allocError();
    void *v21 = 0;
    v21[1] = 0xE000000000000000;
    v21[2] = -1;
    MEMORY[0x261160EC0]();
    uint64_t v22 = sub_25B37F790();
    if ((v22 & 0x100000000) == 0)
    {
      int v23 = v22;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ECCF0);
      sub_25B37F370();
      int v26 = v23;
      sub_25B3763DC(MEMORY[0x263F8EE78]);
      sub_25B376734(&qword_26A4ECCF8, MEMORY[0x263F06080]);
      sub_25B37F450();
      swift_storeEnumTagMultiPayload();
      swift_willThrow();
      MEMORY[0x2611621B0](v8, -1, -1);
      return;
    }
    goto LABEL_17;
  }
  sub_25B37F9B0();
  uint64_t v11 = sub_25B37F9C0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  id v12 = objc_msgSend(objc_allocWithZone(NSString), sel_initWithBytes_length_encoding_, v8, v7, v11);
  if (!v12)
  {
LABEL_12:
    MEMORY[0x2611621B0](v8, -1, -1);
    return;
  }
  unint64_t v13 = v12;
  uint64_t v14 = (void *)sub_25B37F970();
  id v15 = objc_msgSend(v13, sel_componentsSeparatedByString_, v14);

  uint64_t v16 = (void *)sub_25B37FAF0();
  if (v16[2])
  {
    if (swift_isUniquelyReferenced_nonNull_native())
    {
      uint64_t v17 = v16[2];
      if (v17)
      {
LABEL_7:
        v16[2] = v17 - 1;
        swift_bridgeObjectRelease();
        goto LABEL_12;
      }
      goto LABEL_15;
    }
  }
  else
  {
    __break(1u);
  }
  uint64_t v16 = sub_25B376B74(v16);
  uint64_t v17 = v16[2];
  if (v17) {
    goto LABEL_7;
  }
LABEL_15:
  __break(1u);
LABEL_16:

  __break(1u);
LABEL_17:

  __break(1u);
}

uint64_t sub_25B375C6C@<X0>(const char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v9 = sub_25B37F9F0();
  ssize_t v10 = getxattr(a1, (const char *)(v9 + 32), 0, 0, 0, 0);
  swift_release();
  if (v10 < 1)
  {
    type metadata accessor for ExtendedAttributeError();
    sub_25B376734(&qword_26A4ECCE8, (void (*)(uint64_t))type metadata accessor for ExtendedAttributeError);
    swift_allocError();
    *uint64_t v14 = a2;
    v14[1] = a3;
    swift_storeEnumTagMultiPayload();
    swift_bridgeObjectRetain();
    return swift_willThrow();
  }
  else
  {
    uint64_t v15 = sub_25B376B88(v10);
    unint64_t v16 = v11;
    swift_bridgeObjectRetain();
    sub_25B3767E4(&v15, a1, a2, a3, v10);
    uint64_t result = v15;
    unint64_t v13 = v16;
    if (v4)
    {
      return sub_25B2CA2D8(v15, v16);
    }
    else
    {
      *a4 = v15;
      a4[1] = v13;
    }
  }
  return result;
}

uint64_t sub_25B375DC8@<X0>(const char *a1@<X0>, void *a2@<X8>)
{
  return sub_25B375C6C(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), a2);
}

void sub_25B375DE4(void *a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, size_t a6)
{
  uint64_t v11 = sub_25B37F9F0();
  ssize_t v12 = getxattr(a3, (const char *)(v11 + 32), a1, a6, 0, 0);
  swift_release();
  if (v12 < 1)
  {
    type metadata accessor for ExtendedAttributeError();
    sub_25B376734(&qword_26A4ECCE8, (void (*)(uint64_t))type metadata accessor for ExtendedAttributeError);
    unint64_t v13 = (void *)swift_allocError();
    *uint64_t v14 = a4;
    v14[1] = a5;
    v14[2] = v12;
    uint64_t v15 = swift_bridgeObjectRetain();
    MEMORY[0x261160EC0](v15);
    if ((sub_25B37F790() & 0x100000000) != 0)
    {

      __break(1u);
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ECCF0);
      sub_25B37F370();
      sub_25B3763DC(MEMORY[0x263F8EE78]);
      sub_25B376734(&qword_26A4ECCF8, MEMORY[0x263F06080]);
      sub_25B37F450();
      swift_storeEnumTagMultiPayload();
      swift_willThrow();
    }
  }
}

uint64_t sub_25B375F98(const char *a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  value[2] = *MEMORY[0x263EF8340];
  uint64_t v6 = a4;
  switch(a3 >> 62)
  {
    case 1uLL:
      uint64_t v13 = (a2 >> 32) - (int)a2;
      if (a2 >> 32 < (int)a2)
      {
        __break(1u);
LABEL_33:
        __break(1u);
LABEL_34:
        __break(1u);
        goto LABEL_35;
      }
      sub_25B2E2B14(a2, a3);
      uint64_t v14 = (char *)sub_25B37F390();
      if (!v14) {
        goto LABEL_8;
      }
      uint64_t v15 = sub_25B37F3C0();
      if (__OFSUB__((int)a2, v15)) {
LABEL_35:
      }
        __break(1u);
      v14 += (int)a2 - v15;
LABEL_8:
      uint64_t v16 = sub_25B37F3B0();
      if (v16 >= v13) {
        uint64_t v17 = (a2 >> 32) - (int)a2;
      }
      else {
        uint64_t v17 = v16;
      }
      if (v14) {
        size_t v18 = v17;
      }
      else {
        size_t v18 = 0;
      }
      uint64_t v6 = a4;
      uint64_t v19 = sub_25B37F9F0();
      int v11 = setxattr(a1, (const char *)(v19 + 32), v14, v18, 0, 0);
      swift_release();
      uint64_t result = sub_25B2CA2D8(a2, a3);
      if (v11 < 0)
      {
LABEL_29:
        type metadata accessor for ExtendedAttributeError();
        sub_25B376734(&qword_26A4ECCE8, (void (*)(uint64_t))type metadata accessor for ExtendedAttributeError);
        unint64_t v29 = (void *)swift_allocError();
        *uint64_t v30 = v6;
        v30[1] = a5;
        v30[2] = v11;
        uint64_t v31 = swift_bridgeObjectRetain();
        MEMORY[0x261160EC0](v31);
        uint64_t v32 = sub_25B37F790();
        if ((v32 & 0x100000000) != 0)
        {

          __break(1u);
          JUMPOUT(0x25B3763C4);
        }
        int v33 = v32;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ECCF0);
        sub_25B37F370();
        LODWORD(value[0]) = v33;
        sub_25B3763DC(MEMORY[0x263F8EE78]);
        sub_25B376734(&qword_26A4ECCF8, MEMORY[0x263F06080]);
        sub_25B37F450();
        swift_storeEnumTagMultiPayload();
        return swift_willThrow();
      }
      return result;
    case 2uLL:
      uint64_t v20 = *(void *)(a2 + 16);
      uint64_t v21 = *(void *)(a2 + 24);
      swift_retain();
      swift_retain();
      uint64_t v22 = (char *)sub_25B37F390();
      if (!v22) {
        goto LABEL_19;
      }
      uint64_t v23 = sub_25B37F3C0();
      if (__OFSUB__(v20, v23)) {
        goto LABEL_34;
      }
      v22 += v20 - v23;
LABEL_19:
      if (__OFSUB__(v21, v20)) {
        goto LABEL_33;
      }
      uint64_t v24 = sub_25B37F3B0();
      if (v24 >= v21 - v20) {
        size_t v25 = v21 - v20;
      }
      else {
        size_t v25 = v24;
      }
      if (v22) {
        size_t v26 = v25;
      }
      else {
        size_t v26 = 0;
      }
      uint64_t v27 = sub_25B37F9F0();
      int v11 = setxattr(a1, (const char *)(v27 + 32), v22, v26, 0, 0);
      swift_release();
      swift_release();
      uint64_t result = swift_release();
      if (v11 < 0) {
        goto LABEL_29;
      }
      return result;
    case 3uLL:
      memset(value, 0, 14);
      uint64_t v28 = sub_25B37F9F0();
      int v11 = setxattr(a1, (const char *)(v28 + 32), value, 0, 0, 0);
      uint64_t result = swift_release();
      if (v11 < 0) {
        goto LABEL_29;
      }
      return result;
    default:
      value[0] = a2;
      LOWORD(value[1]) = a3;
      BYTE2(value[1]) = BYTE2(a3);
      BYTE3(value[1]) = BYTE3(a3);
      BYTE4(value[1]) = BYTE4(a3);
      BYTE5(value[1]) = BYTE5(a3);
      uint64_t v10 = sub_25B37F9F0();
      int v11 = setxattr(a1, (const char *)(v10 + 32), value, BYTE6(a3), 0, 0);
      uint64_t result = swift_release();
      if (v11 < 0) {
        goto LABEL_29;
      }
      return result;
  }
}

unint64_t sub_25B3763DC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ECA08);
  uint64_t v2 = sub_25B37FFC0();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_25B37677C(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_25B376508(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    int v11 = (uint64_t *)(v3[6] + 16 * result);
    *int v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_25B36C0F0(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_25B376508(uint64_t a1, uint64_t a2)
{
  sub_25B380250();
  sub_25B37FA10();
  uint64_t v4 = sub_25B380290();
  return sub_25B376580(a1, a2, v4);
}

unint64_t sub_25B376580(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t i = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (sub_25B3801A0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      unint64_t i = (i + 1) & v12;
      if ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
      {
        BOOL v13 = (void *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_25B3801A0() & 1) == 0)
        {
          for (unint64_t i = (i + 1) & v12; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v12)
          {
            uint64_t v15 = (void *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2) {
              break;
            }
            if (sub_25B3801A0()) {
              break;
            }
          }
        }
      }
    }
  }
  return i;
}

uint64_t sub_25B3766C8(const char *a1)
{
  return sub_25B375F98(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40));
}

uint64_t type metadata accessor for ExtendedAttributeError()
{
  uint64_t result = qword_26A4ECD00;
  if (!qword_26A4ECD00) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25B376734(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25B37677C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ECA10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25B3767E4(void *a1, const char *a2, uint64_t a3, uint64_t a4, size_t a5)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  unint64_t v5 = a1[1];
  switch(v5 >> 62)
  {
    case 1uLL:
      *(void *)&long long v31 = *a1;
      *((void *)&v31 + 1) = v5 & 0x3FFFFFFFFFFFFFFFLL;
      swift_bridgeObjectRetain();
      sub_25B376A8C((int *)&v31, a2, a3, a4, a5);
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v17 = *((void *)&v31 + 1) | 0x4000000000000000;
      *a1 = v31;
      a1[1] = v17;
      return result;
    case 2uLL:
      *(void *)&long long v31 = *a1;
      *((void *)&v31 + 1) = v5 & 0x3FFFFFFFFFFFFFFFLL;
      sub_25B37F510();
      uint64_t v18 = *((void *)&v31 + 1);
      uint64_t v19 = *(void *)(v31 + 16);
      uint64_t v30 = *(void *)(v31 + 24);
      uint64_t v20 = sub_25B37F390();
      if (!v20)
      {
        __break(1u);
        JUMPOUT(0x25B376A7CLL);
      }
      uint64_t v21 = v20;
      uint64_t v22 = sub_25B37F3C0();
      uint64_t v23 = v19 - v22;
      if (__OFSUB__(v19, v22))
      {
        __break(1u);
LABEL_14:
        __break(1u);
      }
      BOOL v24 = __OFSUB__(v30, v19);
      uint64_t v25 = v30 - v19;
      if (v24) {
        goto LABEL_14;
      }
      uint64_t v26 = sub_25B37F3B0();
      if (v26 >= v25) {
        uint64_t v27 = v25;
      }
      else {
        uint64_t v27 = v26;
      }
      sub_25B375DE4((void *)(v21 + v23), v21 + v23 + v27, a2, a3, a4, a5);
      uint64_t result = swift_bridgeObjectRelease();
      *a1 = v31;
      a1[1] = v18 | 0x8000000000000000;
      return result;
    case 3uLL:
      *(void *)((char *)&v31 + 7) = 0;
      *(void *)&long long v31 = 0;
      sub_25B375DE4(&v31, (uint64_t)&v31, a2, a3, a4, a5);
      return swift_bridgeObjectRelease();
    default:
      *(void *)&long long v31 = *a1;
      WORD4(v31) = v5;
      BYTE10(v31) = BYTE2(v5);
      BYTE11(v31) = BYTE3(v5);
      BYTE12(v31) = BYTE4(v5);
      BYTE13(v31) = BYTE5(v5);
      BYTE14(v31) = BYTE6(v5);
      sub_25B375DE4(&v31, (uint64_t)&v31 + BYTE6(v5), a2, a3, a4, a5);
      uint64_t v11 = v31;
      uint64_t v12 = DWORD2(v31);
      uint64_t v13 = BYTE12(v31);
      uint64_t v14 = BYTE13(v31);
      uint64_t v15 = BYTE14(v31);
      uint64_t result = swift_bridgeObjectRelease();
      *a1 = v11;
      a1[1] = v12 | (v13 << 32) | (v14 << 40) | (v15 << 48);
      return result;
  }
}

uint64_t sub_25B376A8C(int *a1, const char *a2, uint64_t a3, uint64_t a4, size_t a5)
{
  uint64_t result = sub_25B37F540();
  uint64_t v12 = *a1;
  uint64_t v11 = a1[1];
  if ((int)v11 < (int)v12)
  {
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v18 = a4;
  uint64_t v19 = a2;
  uint64_t result = sub_25B37F390();
  if (!result)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  uint64_t v13 = result;
  uint64_t result = sub_25B37F3C0();
  uint64_t v14 = v12 - result;
  if (__OFSUB__(v12, result))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v15 = v11 - v12;
  uint64_t v16 = sub_25B37F3B0();
  if (v16 >= v15) {
    uint64_t v17 = v15;
  }
  else {
    uint64_t v17 = v16;
  }
  sub_25B375DE4((void *)(v13 + v14), v13 + v14 + v17, v19, a3, v18, a5);
  return swift_bridgeObjectRelease();
}

void *sub_25B376B74(void *a1)
{
  return sub_25B310634(0, a1[2], 0, a1);
}

uint64_t sub_25B376B88(uint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    if (result <= 14)
    {
      if (result < 0) {
        __break(1u);
      }
      else {
        return 0;
      }
    }
    else
    {
      sub_25B37F3D0();
      swift_allocObject();
      sub_25B37F3A0();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_25B37F550();
        uint64_t result = swift_allocObject();
        *(void *)(result + 16) = 0;
        *(void *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

uint64_t *sub_25B376C28(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    if (EnumCaseMultiPayload == 1)
    {
      a1[2] = a2[2];
      swift_bridgeObjectRetain();
      uint64_t v8 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A4ECCF0) + 64);
      uint64_t v9 = (char *)a1 + v8;
      char v10 = (char *)a2 + v8;
      uint64_t v11 = sub_25B37F370();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    }
    else
    {
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_25B376D50(uint64_t a1)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t result = swift_bridgeObjectRelease();
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v4 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A4ECCF0) + 64);
    uint64_t v5 = sub_25B37F370();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v6(v4, v5);
  }
  return result;
}

void *sub_25B376DEC(void *a1, void *a2)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  if (EnumCaseMultiPayload == 1)
  {
    a1[2] = a2[2];
    swift_bridgeObjectRetain();
    uint64_t v6 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A4ECCF0) + 64);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = sub_25B37F370();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *sub_25B376EBC(void *a1, void *a2)
{
  if (a1 != a2)
  {
    sub_25B376FA4((uint64_t)a1);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    *a1 = *a2;
    a1[1] = a2[1];
    if (EnumCaseMultiPayload == 1)
    {
      a1[2] = a2[2];
      swift_bridgeObjectRetain();
      uint64_t v5 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A4ECCF0) + 64);
      uint64_t v6 = (char *)a1 + v5;
      uint64_t v7 = (char *)a2 + v5;
      uint64_t v8 = sub_25B37F370();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
    }
    else
    {
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_25B376FA4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ExtendedAttributeError();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_25B377000(void *a1, void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    a1[2] = a2[2];
    uint64_t v6 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A4ECCF0) + 64);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = sub_25B37F370();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *sub_25B3770E0(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_25B376FA4((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *(_OWORD *)a1 = *(_OWORD *)a2;
      a1[2] = a2[2];
      uint64_t v6 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A4ECCF0) + 64);
      uint64_t v7 = (char *)a1 + v6;
      uint64_t v8 = (char *)a2 + v6;
      uint64_t v9 = sub_25B37F370();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for ReplicatorRecordChange(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for ReplicatorRecordChange(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_25B377224()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_25B377234()
{
  v2[4] = &unk_25B389688;
  uint64_t result = sub_25B37F370();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout3();
    v2[5] = v2;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t ReplicatorZone.identifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ReplicatorZone.identifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*ReplicatorZone.identifier.modify())()
{
  return nullsub_1;
}

uint64_t ReplicatorZone.clientIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ReplicatorZone.clientIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*ReplicatorZone.clientIdentifier.modify())()
{
  return nullsub_1;
}

__n128 ReplicatorZone.protocolVersion.getter@<Q0>(__n128 *a1@<X8>)
{
  __n128 result = v1[2];
  *a1 = result;
  return result;
}

__n128 ReplicatorZone.protocolVersion.setter(__n128 *a1)
{
  __n128 result = *a1;
  v1[2] = *a1;
  return result;
}

uint64_t (*ReplicatorZone.protocolVersion.modify())()
{
  return nullsub_1;
}

__n128 ReplicatorZone.init(identifier:clientIdentifier:protocolVersion:)@<Q0>(unint64_t a1@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, unint64_t a4@<X3>, __n128 *a5@<X4>, __n128 *a6@<X8>)
{
  a6->n128_u64[0] = a1;
  a6->n128_u64[1] = a2;
  a6[1].n128_u64[0] = a3;
  a6[1].n128_u64[1] = a4;
  __n128 result = *a5;
  a6[2] = *a5;
  return result;
}

uint64_t ReplicatorZone.hash(into:)()
{
  return sub_25B380280();
}

uint64_t sub_25B3774E0(uint64_t a1)
{
  unint64_t v2 = sub_25B377A9C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B37751C(uint64_t a1)
{
  unint64_t v2 = sub_25B377A9C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ReplicatorZone.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ECD10);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = v1[2];
  uint64_t v16 = v1[3];
  uint64_t v17 = v7;
  uint64_t v8 = v1[4];
  uint64_t v14 = v1[5];
  uint64_t v15 = v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25B377A9C();
  sub_25B3802C0();
  LOBYTE(v19) = 0;
  uint64_t v9 = v18;
  sub_25B380140();
  if (!v9)
  {
    uint64_t v11 = v14;
    uint64_t v10 = v15;
    LOBYTE(v19) = 1;
    sub_25B380140();
    uint64_t v19 = v10;
    uint64_t v20 = v11;
    char v21 = 2;
    sub_25B2C8780();
    sub_25B380160();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t ReplicatorZone.hashValue.getter()
{
  return sub_25B380290();
}

uint64_t ReplicatorZone.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ECD20);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25B377A9C();
  sub_25B3802B0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  LOBYTE(v22) = 0;
  uint64_t v9 = sub_25B380090();
  uint64_t v11 = v10;
  uint64_t v21 = v9;
  LOBYTE(v22) = 1;
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_25B380090();
  uint64_t v14 = v13;
  uint64_t v19 = v12;
  char v23 = 2;
  sub_25B2C8684();
  swift_bridgeObjectRetain();
  uint64_t v20 = v14;
  sub_25B3800B0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  long long v15 = v22;
  uint64_t v16 = v20;
  *(void *)a2 = v21;
  *(void *)(a2 + 8) = v11;
  *(void *)(a2 + 16) = v19;
  *(void *)(a2 + 24) = v16;
  *(_OWORD *)(a2 + 32) = v15;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25B377A6C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ReplicatorZone.init(from:)(a1, a2);
}

uint64_t sub_25B377A84(void *a1)
{
  return ReplicatorZone.encode(to:)(a1);
}

unint64_t sub_25B377A9C()
{
  unint64_t result = qword_26A4ECD18;
  if (!qword_26A4ECD18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ECD18);
  }
  return result;
}

unint64_t sub_25B377AF4()
{
  unint64_t result = qword_26A4ECD28;
  if (!qword_26A4ECD28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ECD28);
  }
  return result;
}

ValueMetadata *type metadata accessor for ReplicatorZone()
{
  return &type metadata for ReplicatorZone;
}

unsigned char *storeEnumTagSinglePayload for ReplicatorZone.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25B377C24);
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

ValueMetadata *type metadata accessor for ReplicatorZone.CodingKeys()
{
  return &type metadata for ReplicatorZone.CodingKeys;
}

unint64_t sub_25B377C60()
{
  unint64_t result = qword_26A4ECD30;
  if (!qword_26A4ECD30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ECD30);
  }
  return result;
}

unint64_t sub_25B377CB8()
{
  unint64_t result = qword_26A4ECD38;
  if (!qword_26A4ECD38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ECD38);
  }
  return result;
}

unint64_t sub_25B377D10()
{
  unint64_t result = qword_26A4ECD40;
  if (!qword_26A4ECD40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ECD40);
  }
  return result;
}

uint64_t OpaqueObjectiveCBridgable<>._bridgeToObjectiveC()()
{
  sub_25B37F440();
  swift_allocObject();
  sub_25B37F430();
  uint64_t v0 = sub_25B37F420();
  unint64_t v2 = v1;
  uint64_t v3 = sub_25B37F560();
  sub_25B2CA2D8(v0, v2);
  swift_release();
  return v3;
}

uint64_t static OpaqueObjectiveCBridgable<>._unconditionallyBridgeFromObjectiveC(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_25B37FD60();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v15 - v11;
  uint64_t v13 = *(void *)(a2 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))((char *)&v15 - v11, 1, 1, a2);
  if (a1)
  {
    sub_25B37FFF0();
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48))(v10, 1, a2);
    if (result != 1)
    {
      (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v13 + 32))(a3, v10, a2);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t static OpaqueObjectiveCBridgable<>._forceBridgeFromObjectiveC(_:result:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_25B37FD60();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v13 - v7;
  sub_25B37F400();
  swift_allocObject();
  sub_25B37F3F0();
  uint64_t v9 = sub_25B37F570();
  unint64_t v11 = v10;
  sub_25B37F3E0();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a2, v5);
  sub_25B2CA2D8(v9, v11);
  swift_release();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(a3 - 8) + 56))(v8, 0, 1, a3);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v6 + 32))(a2, v8, v5);
}

BOOL static OpaqueObjectiveCBridgable<>._conditionallyBridgeFromObjectiveC(_:result:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_25B37FD60();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  unint64_t v11 = (char *)&v19 - v10;
  uint64_t v20 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  uint64_t v21 = a2;
  v20(a2, v5);
  sub_25B37F400();
  swift_allocObject();
  sub_25B37F3F0();
  uint64_t v12 = sub_25B37F570();
  unint64_t v14 = v13;
  sub_25B37F3E0();
  swift_release();
  sub_25B2CA2D8(v12, v14);
  uint64_t v15 = *(void *)(a3 - 8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v11, 0, 1, a3);
  uint64_t v16 = v21;
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v21, v11, v5);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v16, v5);
  BOOL v17 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v9, 1, a3) != 1;
  v20((uint64_t)v9, v5);
  return v17;
}

uint64_t *initializeBufferWithCopyOfBuffer for ReplicatorRecordChange(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    uint64_t v6 = a2[1];
    *a1 = *a2;
    a1[1] = v6;
    uint64_t v7 = a2[3];
    a1[2] = a2[2];
    a1[3] = v7;
    uint64_t v8 = a2[5];
    a1[4] = a2[4];
    a1[5] = v8;
    uint64_t v9 = type metadata accessor for ReplicatorRecord.ID(0);
    uint64_t v10 = *(int *)(v9 + 28);
    __dst = (char *)a1 + v10;
    uint64_t v34 = v9;
    unint64_t v11 = (char *)a2 + v10;
    uint64_t v12 = sub_25B37F640();
    uint64_t v13 = *(void *)(v12 - 8);
    unint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    int v15 = v14(v11, 1, v12);
    if (EnumCaseMultiPayload == 1)
    {
      if (v15)
      {
        uint64_t v16 = type metadata accessor for ReplicatorRecord.ID.Ownership(0);
        memcpy(__dst, v11, *(void *)(*(void *)(v16 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v13 + 16))(__dst, v11, v12);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(__dst, 0, 1, v12);
      }
      uint64_t v19 = *(int *)(v34 + 32);
      uint64_t v20 = (uint64_t *)((char *)a1 + v19);
      uint64_t v21 = (uint64_t *)((char *)a2 + v19);
      uint64_t v22 = v21[1];
      *uint64_t v20 = *v21;
      v20[1] = v22;
      swift_bridgeObjectRetain();
    }
    else
    {
      if (v15)
      {
        uint64_t v18 = type metadata accessor for ReplicatorRecord.ID.Ownership(0);
        memcpy(__dst, v11, *(void *)(*(void *)(v18 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v13 + 16))(__dst, v11, v12);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(__dst, 0, 1, v12);
      }
      uint64_t v23 = *(int *)(v34 + 32);
      BOOL v24 = (uint64_t *)((char *)a1 + v23);
      uint64_t v25 = (uint64_t *)((char *)a2 + v23);
      uint64_t v26 = v25[1];
      *BOOL v24 = *v25;
      v24[1] = v26;
      uint64_t v27 = *(int *)(type metadata accessor for ReplicatorRecordVersion() + 20);
      uint64_t v28 = (char *)a1 + v27;
      unint64_t v29 = (char *)a2 + v27;
      uint64_t v30 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
      swift_bridgeObjectRetain();
      v30(v28, v29, v12);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for ReplicatorRecordChange(uint64_t a1)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = a1 + *(int *)(type metadata accessor for ReplicatorRecord.ID(0) + 28);
  uint64_t v4 = sub_25B37F640();
  uint64_t v9 = *(void *)(v4 - 8);
  int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v3, 1, v4);
  if (EnumCaseMultiPayload == 1)
  {
    if (!v5) {
      (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v3, v4);
    }
    return swift_bridgeObjectRelease();
  }
  else
  {
    if (!v5) {
      (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v3, v4);
    }
    swift_bridgeObjectRelease();
    uint64_t v7 = a1 + *(int *)(type metadata accessor for ReplicatorRecordVersion() + 20);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v9 + 8);
    return v8(v7, v4);
  }
}

void *initializeWithCopy for ReplicatorRecordChange(void *a1, void *a2)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  uint64_t v7 = type metadata accessor for ReplicatorRecord.ID(0);
  uint64_t v8 = *(int *)(v7 + 28);
  __dst = (char *)a1 + v8;
  uint64_t v31 = v7;
  uint64_t v9 = (char *)a2 + v8;
  uint64_t v10 = sub_25B37F640();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  int v13 = v12(v9, 1, v10);
  if (EnumCaseMultiPayload == 1)
  {
    if (v13)
    {
      uint64_t v14 = type metadata accessor for ReplicatorRecord.ID.Ownership(0);
      memcpy(__dst, v9, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(__dst, v9, v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(__dst, 0, 1, v10);
    }
    uint64_t v16 = *(int *)(v31 + 32);
    uint64_t v17 = (void *)((char *)a1 + v16);
    uint64_t v18 = (void *)((char *)a2 + v16);
    uint64_t v19 = v18[1];
    void *v17 = *v18;
    v17[1] = v19;
    swift_bridgeObjectRetain();
  }
  else
  {
    if (v13)
    {
      uint64_t v15 = type metadata accessor for ReplicatorRecord.ID.Ownership(0);
      memcpy(__dst, v9, *(void *)(*(void *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(__dst, v9, v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(__dst, 0, 1, v10);
    }
    uint64_t v20 = *(int *)(v31 + 32);
    uint64_t v21 = (void *)((char *)a1 + v20);
    uint64_t v22 = (void *)((char *)a2 + v20);
    uint64_t v23 = v22[1];
    void *v21 = *v22;
    v21[1] = v23;
    uint64_t v24 = *(int *)(type metadata accessor for ReplicatorRecordVersion() + 20);
    uint64_t v25 = (char *)a1 + v24;
    uint64_t v26 = (char *)a2 + v24;
    uint64_t v27 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
    swift_bridgeObjectRetain();
    v27(v25, v26, v10);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *assignWithCopy for ReplicatorRecordChange(void *a1, void *a2)
{
  if (a1 != a2)
  {
    sub_25B378DB0((uint64_t)a1);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    *a1 = *a2;
    a1[1] = a2[1];
    a1[2] = a2[2];
    a1[3] = a2[3];
    a1[4] = a2[4];
    a1[5] = a2[5];
    uint64_t v4 = type metadata accessor for ReplicatorRecord.ID(0);
    uint64_t v5 = *(int *)(v4 + 28);
    __dst = (char *)a1 + v5;
    uint64_t v26 = v4;
    uint64_t v6 = (char *)a2 + v5;
    uint64_t v7 = sub_25B37F640();
    uint64_t v8 = *(void *)(v7 - 8);
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    int v10 = v9(v6, 1, v7);
    if (EnumCaseMultiPayload == 1)
    {
      if (v10)
      {
        uint64_t v11 = type metadata accessor for ReplicatorRecord.ID.Ownership(0);
        memcpy(__dst, v6, *(void *)(*(void *)(v11 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v8 + 16))(__dst, v6, v7);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(__dst, 0, 1, v7);
      }
      uint64_t v13 = *(int *)(v26 + 32);
      uint64_t v14 = (void *)((char *)a1 + v13);
      uint64_t v15 = (void *)((char *)a2 + v13);
      *uint64_t v14 = *v15;
      v14[1] = v15[1];
      swift_bridgeObjectRetain();
    }
    else
    {
      if (v10)
      {
        uint64_t v12 = type metadata accessor for ReplicatorRecord.ID.Ownership(0);
        memcpy(__dst, v6, *(void *)(*(void *)(v12 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v8 + 16))(__dst, v6, v7);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(__dst, 0, 1, v7);
      }
      uint64_t v16 = *(int *)(v26 + 32);
      uint64_t v17 = (void *)((char *)a1 + v16);
      uint64_t v18 = (void *)((char *)a2 + v16);
      void *v17 = *v18;
      v17[1] = v18[1];
      uint64_t v19 = *(int *)(type metadata accessor for ReplicatorRecordVersion() + 20);
      uint64_t v20 = (char *)a1 + v19;
      uint64_t v21 = (char *)a2 + v19;
      uint64_t v22 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
      swift_bridgeObjectRetain();
      v22(v20, v21, v7);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_25B378DB0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ReplicatorRecordChange();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for ReplicatorRecordChange()
{
  uint64_t result = qword_26B340FA8;
  if (!qword_26B340FA8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

char *initializeWithTake for ReplicatorRecordChange(char *a1, char *a2)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  long long v5 = *((_OWORD *)a2 + 1);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v5;
  *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
  uint64_t v6 = type metadata accessor for ReplicatorRecord.ID(0);
  uint64_t v7 = *(int *)(v6 + 28);
  uint64_t v8 = &a1[v7];
  uint64_t v9 = &a2[v7];
  uint64_t v10 = sub_25B37F640();
  uint64_t v11 = *(void *)(v10 - 8);
  int v12 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10);
  if (EnumCaseMultiPayload == 1)
  {
    if (v12)
    {
      uint64_t v13 = type metadata accessor for ReplicatorRecord.ID.Ownership(0);
      memcpy(v8, v9, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
    }
    *(_OWORD *)&a1[*(int *)(v6 + 32)] = *(_OWORD *)&a2[*(int *)(v6 + 32)];
  }
  else
  {
    if (v12)
    {
      uint64_t v14 = type metadata accessor for ReplicatorRecord.ID.Ownership(0);
      memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
    }
    *(_OWORD *)&a1[*(int *)(v6 + 32)] = *(_OWORD *)&a2[*(int *)(v6 + 32)];
    uint64_t v15 = type metadata accessor for ReplicatorRecordVersion();
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&a1[*(int *)(v15 + 20)], &a2[*(int *)(v15 + 20)], v10);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

char *assignWithTake for ReplicatorRecordChange(char *a1, char *a2)
{
  if (a1 != a2)
  {
    sub_25B378DB0((uint64_t)a1);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    long long v5 = *((_OWORD *)a2 + 1);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *((_OWORD *)a1 + 1) = v5;
    *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
    uint64_t v6 = type metadata accessor for ReplicatorRecord.ID(0);
    uint64_t v7 = *(int *)(v6 + 28);
    uint64_t v8 = &a1[v7];
    uint64_t v9 = &a2[v7];
    uint64_t v10 = sub_25B37F640();
    uint64_t v11 = *(void *)(v10 - 8);
    int v12 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10);
    if (EnumCaseMultiPayload == 1)
    {
      if (v12)
      {
        uint64_t v13 = type metadata accessor for ReplicatorRecord.ID.Ownership(0);
        memcpy(v8, v9, *(void *)(*(void *)(v13 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      }
      *(_OWORD *)&a1[*(int *)(v6 + 32)] = *(_OWORD *)&a2[*(int *)(v6 + 32)];
    }
    else
    {
      if (v12)
      {
        uint64_t v14 = type metadata accessor for ReplicatorRecord.ID.Ownership(0);
        memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      }
      *(_OWORD *)&a1[*(int *)(v6 + 32)] = *(_OWORD *)&a2[*(int *)(v6 + 32)];
      uint64_t v15 = type metadata accessor for ReplicatorRecordVersion();
      (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&a1[*(int *)(v15 + 20)], &a2[*(int *)(v15 + 20)], v10);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_25B3792A8()
{
  uint64_t result = type metadata accessor for ReplicatorRecordVersion();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for ReplicatorRecord.ID(319);
    if (v2 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

uint64_t sub_25B37936C(compression_stream *a1, uint64_t *a2, uint64_t a3, uint64_t a4, compression_status *a5, uint8_t *a6, void *a7)
{
  int64_t v76 = a5;
  v77[2] = *MEMORY[0x263EF8340];
  uint64_t v14 = sub_25B37F530();
  uint64_t v74 = *(void *)(v14 - 8);
  uint64_t v75 = v14;
  uint64_t result = MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)v69 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  size_t src_size = a1->src_size;
  id v73 = a7;
  if (!src_size) {
    goto LABEL_8;
  }
  while (2)
  {
    a3 = 0;
LABEL_3:
    unint64_t v19 = a2[1];
    if (v19 >> 60 == 15) {
      goto LABEL_25;
    }
    uint64_t v20 = *a2;
    switch(v19 >> 62)
    {
      case 1uLL:
        uint64_t v72 = a6;
        if (__OFSUB__(HIDWORD(v20), v20))
        {
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
        uint64_t v70 = (HIDWORD(v20) - v20);
        uint64_t v71 = a4;
        if ((int)v20 > v20 >> 32) {
          goto LABEL_51;
        }
        sub_25B2E2B14(v20, v19);
        uint64_t v32 = sub_25B37F390();
        if (!v32) {
          goto LABEL_61;
        }
        uint64_t v33 = v32;
        v69[1] = v7;
        uint64_t v34 = sub_25B37F3C0();
        uint64_t v35 = (int)v20 - v34;
        if (__OFSUB__((int)v20, v34)) {
          goto LABEL_53;
        }
        uint64_t v36 = (int)v70;
        sub_25B37F3B0();
        size_t v37 = a1->src_size;
        BOOL v21 = __OFSUB__(v36, v37);
        size_t v38 = v36 - v37;
        if (v21) {
          goto LABEL_55;
        }
        a1->src_ptr = (const uint8_t *)(v33 + v35 + v38);
        compression_status v39 = compression_stream_process(a1, a3);
        *int64_t v76 = v39;
        uint64_t result = sub_25B2CA2C4(v20, v19);
LABEL_22:
        a4 = v71;
        a6 = v72;
LABEL_25:
        if (*v76 >= 2u)
        {
          if (*v76 != COMPRESSION_STATUS_ERROR) {
            return result;
          }
          if (qword_26B3417C0 == -1) {
            goto LABEL_31;
          }
        }
        else
        {
          size_t dst_size = a1->dst_size;
          uint64_t v51 = a4 - dst_size;
          if (!__OFSUB__(a4, dst_size))
          {
            (*(void (**)(char *, void, uint64_t))(v74 + 104))(v17, *MEMORY[0x263F06F00], v75);
            sub_25B37F520();
            if (v51)
            {
              sub_25B37F3D0();
              swift_allocObject();
              swift_retain();
              uint64_t v52 = sub_25B37F380();
              uint64_t v51 = sub_25B379B10(v52, v51);
              unint64_t v54 = v53;
              swift_release();
            }
            else
            {
              uint64_t v60 = (void (*)(uint8_t *, void))sub_25B37F520();
              v60(a6, 0);
              swift_release();
              swift_release();
              unint64_t v54 = 0xC000000000000000;
            }
            uint64_t v61 = v73;
            (*(void (**)(char *, uint64_t))(v74 + 8))(v17, v75);
            v62 = (void *)sub_25B37F560();
            objc_msgSend(v61, sel_writeData_, v62);

            a1->dst_ptr = a6;
            a1->size_t dst_size = a4;
            return sub_25B2CA2D8(v51, v54);
          }
          __break(1u);
        }
        swift_once();
LABEL_31:
        uint64_t v55 = sub_25B37F780();
        __swift_project_value_buffer(v55, (uint64_t)qword_26B3417A8);
        id v56 = sub_25B37F760();
        os_log_type_t v57 = sub_25B37FCB0();
        if (os_log_type_enabled(v56, v57))
        {
          uint64_t v58 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v58 = 0;
          _os_log_impl(&dword_25B2C1000, v56, v57, "Encountered error while compressing", v58, 2u);
          MEMORY[0x2611621B0](v58, -1, -1);
        }

        sub_25B379DF0();
        swift_allocError();
        unsigned char *v59 = 1;
        return swift_willThrow();
      case 2uLL:
        uint64_t v71 = a4;
        uint64_t v72 = a6;
        uint64_t v41 = *(void *)(v20 + 16);
        uint64_t v40 = *(void *)(v20 + 24);
        uint64_t v70 = v40 - v41;
        if (__OFSUB__(v40, v41)) {
          goto LABEL_49;
        }
        sub_25B318B74(v20, v19);
        swift_retain();
        swift_retain();
        uint64_t v42 = sub_25B37F390();
        if (!v42) {
          goto LABEL_60;
        }
        uint64_t v43 = v42;
        uint64_t v44 = sub_25B37F3C0();
        BOOL v21 = __OFSUB__(v41, v44);
        uint64_t v45 = v41 - v44;
        if (v21) {
          goto LABEL_52;
        }
        sub_25B37F3B0();
        size_t v46 = a1->src_size;
        BOOL v21 = __OFSUB__(v70, v46);
        size_t v47 = v70 - v46;
        if (v21) {
          goto LABEL_54;
        }
        a1->src_ptr = (const uint8_t *)(v43 + v45 + v47);
        compression_status v48 = compression_stream_process(a1, a3);
        *int64_t v76 = v48;
        swift_release();
        swift_release();
        uint64_t result = sub_25B2CA2C4(v20, v19);
        goto LABEL_22;
      case 3uLL:
        memset(v77, 0, 14);
        BOOL v21 = __OFSUB__(0, src_size);
        size_t v22 = -(uint64_t)src_size;
        if (!v21) {
          goto LABEL_24;
        }
        goto LABEL_50;
      default:
        v77[0] = *a2;
        LOWORD(v77[1]) = v19;
        BYTE2(v77[1]) = BYTE2(v19);
        BYTE3(v77[1]) = BYTE3(v19);
        BYTE4(v77[1]) = BYTE4(v19);
        BYTE5(v77[1]) = BYTE5(v19);
        BOOL v21 = __OFSUB__(BYTE6(v19), src_size);
        size_t v22 = BYTE6(v19) - src_size;
        if (!v21)
        {
LABEL_24:
          a1->src_ptr = (const uint8_t *)v77 + v22;
          compression_status v49 = compression_stream_process(a1, a3);
          *int64_t v76 = v49;
          uint64_t result = sub_25B2CA2C4(v20, v19);
          goto LABEL_25;
        }
        __break(1u);
LABEL_8:
        uint64_t v23 = a4;
        id v24 = objc_msgSend((id)a3, sel_readDataOfLength_, a4);
        uint64_t v25 = sub_25B37F570();
        uint64_t v27 = v26;

        uint64_t v28 = *a2;
        unint64_t v29 = a2[1];
        *a2 = v25;
        a2[1] = v27;
        uint64_t result = sub_25B2CA2C4(v28, v29);
        unint64_t v30 = a2[1];
        if (v30 >> 60 == 15)
        {
          __break(1u);
LABEL_60:
          sub_25B37F3B0();
          __break(1u);
LABEL_61:
          sub_25B37F3B0();
          __break(1u);
          JUMPOUT(0x25B3799F8);
        }
        uint64_t v31 = *a2;
        a4 = v23;
        switch(v30 >> 62)
        {
          case 1uLL:
            LODWORD(src_size) = HIDWORD(v31) - v31;
            if (__OFSUB__(HIDWORD(v31), v31)) {
              goto LABEL_56;
            }
            size_t src_size = (int)src_size;
LABEL_39:
            a1->size_t src_size = src_size;
            uint64_t v63 = src_size;
            goto LABEL_42;
          case 2uLL:
            uint64_t v65 = *(void *)(v31 + 16);
            uint64_t v64 = *(void *)(v31 + 24);
            BOOL v21 = __OFSUB__(v64, v65);
            size_t src_size = v64 - v65;
            if (v21) {
              goto LABEL_57;
            }
            a1->size_t src_size = src_size;
            uint64_t v68 = v31 + 16;
            uint64_t v66 = *(void *)(v31 + 16);
            uint64_t v67 = *(void *)(v68 + 8);
            BOOL v21 = __OFSUB__(v67, v66);
            uint64_t v63 = v67 - v66;
            if (v21) {
              goto LABEL_58;
            }
LABEL_42:
            if (v63 >= v23) {
              continue;
            }
LABEL_45:
            a3 = 1;
            break;
          case 3uLL:
            size_t src_size = 0;
            a1->size_t src_size = 0;
            if (v23 > 0) {
              goto LABEL_45;
            }
            continue;
          default:
            size_t src_size = BYTE6(v30);
            goto LABEL_39;
        }
        goto LABEL_3;
    }
  }
}

uint64_t sub_25B379A18()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for Compressor()
{
  return self;
}

uint64_t sub_25B379A4C(unsigned char *__src, unsigned char *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0;
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

uint64_t sub_25B379B10(uint64_t result, uint64_t a2)
{
  if (!a2)
  {
    swift_release();
    return 0;
  }
  if (a2 > 14)
  {
    if ((unint64_t)a2 < 0x7FFFFFFF) {
      return a2 << 32;
    }
    sub_25B37F550();
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = 0;
    *(void *)(v3 + 24) = a2;
    return v3;
  }
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = (unsigned char *)sub_25B37F390();
    if (!v4)
    {
LABEL_10:
      uint64_t v5 = sub_25B37F3B0();
      if (v5 >= a2) {
        uint64_t v6 = a2;
      }
      else {
        uint64_t v6 = v5;
      }
      uint64_t v7 = &v4[v6];
      if (v4) {
        uint64_t v8 = v7;
      }
      else {
        uint64_t v8 = 0;
      }
      uint64_t v3 = sub_25B379A4C(v4, v8);
      swift_release();
      return v3;
    }
    uint64_t result = sub_25B37F3C0();
    if (!__OFSUB__(0, result))
    {
      v4 -= result;
      goto LABEL_10;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_25B379BF8(char a1, uint64_t a2, void *a3)
{
  compression_stream_operation v6 = a1 & 1;
  uint64_t v7 = (uint8_t *)swift_slowAlloc();
  uint64_t v8 = (compression_stream *)swift_slowAlloc();
  compression_status v17 = compression_stream_init(v8, v6, COMPRESSION_LZFSE);
  if (v17 == COMPRESSION_STATUS_ERROR)
  {
    if (qword_26B3417C0 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_25B37F780();
    __swift_project_value_buffer(v10, (uint64_t)qword_26B3417A8);
    uint64_t v11 = sub_25B37F760();
    os_log_type_t v12 = sub_25B37FCB0();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_25B2C1000, v11, v12, "Unable to initialize the compression stream", v13, 2u);
      MEMORY[0x2611621B0](v13, -1, -1);
    }

    sub_25B379DF0();
    swift_allocError();
    *uint64_t v14 = 0;
    swift_willThrow();
  }
  else
  {
    v8->size_t src_size = 0;
    v8->dst_ptr = v7;
    v8->size_t dst_size = 0x8000;
    long long v16 = xmmword_25B381FA0;
    while (1)
    {
      uint64_t v9 = (void *)MEMORY[0x261161A50]();
      sub_25B37936C(v8, (uint64_t *)&v16, a2, 0x8000, &v17, v7, a3);
      if (v3) {
        break;
      }
      if (v17) {
        goto LABEL_12;
      }
    }
LABEL_12:
    sub_25B2CA2C4(v16, *((unint64_t *)&v16 + 1));
    compression_stream_destroy(v8);
    MEMORY[0x2611621B0](v8, -1, -1);
  }
  return MEMORY[0x2611621B0](v7, -1, -1);
}

unint64_t sub_25B379DF0()
{
  unint64_t result = qword_26A4ECD48;
  if (!qword_26A4ECD48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ECD48);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for Compressor.CompressorError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25B379F10);
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

ValueMetadata *type metadata accessor for Compressor.CompressorError()
{
  return &type metadata for Compressor.CompressorError;
}

unint64_t sub_25B379F4C()
{
  unint64_t result = qword_26A4ECD50;
  if (!qword_26A4ECD50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ECD50);
  }
  return result;
}

uint64_t static ReplicatorHasher.hash<A>(_:)()
{
  return sub_25B37F6C0();
}

{
  return sub_25B37F6D0();
}

uint64_t ReplicatorHasher.combine<A>(_:)()
{
  return sub_25B37F6E0();
}

{
  return sub_25B37F6F0();
}

uint64_t initializeBufferWithCopyOfBuffer for ReplicatorHasher(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25B37F720();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  return v5(a1, a2, v4);
}

uint64_t destroy for ReplicatorHasher(uint64_t a1)
{
  uint64_t v2 = sub_25B37F720();
  int v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t initializeWithCopy for ReplicatorHasher(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25B37F720();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for ReplicatorHasher(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25B37F720();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for ReplicatorHasher(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25B37F720();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for ReplicatorHasher(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25B37F720();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for ReplicatorHasher(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25B37A27C);
}

uint64_t sub_25B37A27C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25B37F720();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for ReplicatorHasher(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25B37A2FC);
}

uint64_t sub_25B37A2FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25B37F720();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for ReplicatorHasher()
{
  uint64_t result = qword_26A4EB2C8;
  if (!qword_26A4EB2C8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25B37A3B8()
{
  uint64_t result = sub_25B37F720();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t dispatch thunk of ReplicatorMessageProviding.messageUpdates.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of ReplicatorMessageProviding.send(message:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of ReplicatorMessageProviding.sendExpectingResponse(message:timeout:retries:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 24))();
}

uint64_t dispatch thunk of ReplicatorRecordProviding.recordUpdates.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of ReplicatorRecordProviding.zoneUpdates(zone:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of ReplicatorRecordProviding.add(records:destination:schedule:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

uint64_t dispatch thunk of ReplicatorRecordProviding.delete(recordIDs:schedule:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of ReplicatorRecordProviding.records(recordIDs:url:protocolVersion:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(a6 + 40))(a1, a2, a3, a4 & 1);
}

uint64_t dispatch thunk of ReplicatorRecordProviding.urls(recordIDs:url:protocolVersion:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(a6 + 48))(a1, a2, a3, a4 & 1);
}

uint64_t dispatch thunk of ReplicatorRecordProviding.recordVersions()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of ReplicatorRecordSyncing.sync()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of ReplicatorClientDescribing.descriptor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t MessageDescriptor.messageType.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MessageDescriptor.messageType.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*MessageDescriptor.messageType.modify())()
{
  return nullsub_1;
}

__n128 MessageDescriptor.protocolVersion.getter@<Q0>(__n128 *a1@<X8>)
{
  __n128 result = v1[1];
  *a1 = result;
  return result;
}

__n128 MessageDescriptor.init(messageType:protocolVersion:)@<Q0>(unint64_t a1@<X0>, unint64_t a2@<X1>, __n128 *a3@<X2>, __n128 *a4@<X8>)
{
  a4->n128_u64[0] = a1;
  a4->n128_u64[1] = a2;
  __n128 result = *a3;
  a4[1] = *a3;
  return result;
}

uint64_t MessageDescriptor.hash(into:)()
{
  return sub_25B380280();
}

uint64_t sub_25B37A6F0()
{
  if (*v0) {
    return 0x6C6F636F746F7270;
  }
  else {
    return 0x546567617373656DLL;
  }
}

uint64_t sub_25B37A740@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25B37B1B8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25B37A768(uint64_t a1)
{
  unint64_t v2 = sub_25B37AE18();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B37A7A4(uint64_t a1)
{
  unint64_t v2 = sub_25B37AE18();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t MessageDescriptor.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B340D70);
  uint64_t v12 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unsigned int v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(v1 + 16);
  uint64_t v10 = *(void *)(v1 + 24);
  uint64_t v11 = v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25B37AE18();
  sub_25B3802C0();
  LOBYTE(v13) = 0;
  sub_25B380140();
  if (!v2)
  {
    uint64_t v13 = v11;
    uint64_t v14 = v10;
    char v15 = 1;
    sub_25B2C8780();
    sub_25B380160();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v6, v4);
}

uint64_t MessageDescriptor.hashValue.getter()
{
  return sub_25B380290();
}

uint64_t MessageDescriptor.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B340DA8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25B37AE18();
  sub_25B3802B0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  LOBYTE(v14) = 0;
  uint64_t v9 = sub_25B380090();
  uint64_t v11 = v10;
  char v15 = 1;
  sub_25B2C8684();
  swift_bridgeObjectRetain();
  sub_25B3800B0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  long long v12 = v14;
  *(void *)a2 = v9;
  *(void *)(a2 + 8) = v11;
  *(_OWORD *)(a2 + 16) = v12;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25B37AC00@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return MessageDescriptor.init(from:)(a1, a2);
}

uint64_t sub_25B37AC18(void *a1)
{
  return MessageDescriptor.encode(to:)(a1);
}

uint64_t sub_25B37AC34()
{
  return sub_25B380290();
}

uint64_t sub_25B37ACBC()
{
  return sub_25B380280();
}

uint64_t sub_25B37AD28()
{
  return sub_25B380290();
}

BOOL _s18ReplicatorServices17MessageDescriptorV2eeoiySbAC_ACtFZ_0(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a1[3];
  uint64_t v4 = a2[2];
  uint64_t v5 = a2[3];
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return v2 == v4 && v3 == v5;
  }
  char v7 = sub_25B3801A0();
  BOOL result = 0;
  if (v7) {
    return v2 == v4 && v3 == v5;
  }
  return result;
}

unint64_t sub_25B37AE18()
{
  unint64_t result = qword_26B340D28;
  if (!qword_26B340D28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B340D28);
  }
  return result;
}

unint64_t sub_25B37AE70()
{
  unint64_t result = qword_26A4ECD58;
  if (!qword_26A4ECD58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ECD58);
  }
  return result;
}

uint64_t initializeWithCopy for MessageDescriptor(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for MessageDescriptor(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  return a1;
}

uint64_t assignWithTake for MessageDescriptor(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  return a1;
}

ValueMetadata *type metadata accessor for MessageDescriptor()
{
  return &type metadata for MessageDescriptor;
}

unsigned char *storeEnumTagSinglePayload for MessageDescriptor.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25B37B078);
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

ValueMetadata *type metadata accessor for MessageDescriptor.CodingKeys()
{
  return &type metadata for MessageDescriptor.CodingKeys;
}

unint64_t sub_25B37B0B4()
{
  unint64_t result = qword_26A4ECD60;
  if (!qword_26A4ECD60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ECD60);
  }
  return result;
}

unint64_t sub_25B37B10C()
{
  unint64_t result = qword_26B340D38;
  if (!qword_26B340D38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B340D38);
  }
  return result;
}

unint64_t sub_25B37B164()
{
  unint64_t result = qword_26B340D30;
  if (!qword_26B340D30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B340D30);
  }
  return result;
}

uint64_t sub_25B37B1B8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x546567617373656DLL && a2 == 0xEB00000000657079;
  if (v2 || (sub_25B3801A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6C6F636F746F7270 && a2 == 0xEF6E6F6973726556)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_25B3801A0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t dispatch thunk of ReplicatorDecoding.decode<A>(_:from:version:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return (*(uint64_t (**)(uint64_t))(a9 + 8))(a1);
}

uint64_t dispatch thunk of ReplicatorEncoding.encode<A>(_:version:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 8))();
}

uint64_t dispatch thunk of ReplicatorMessageEncoding.encode<A>(_:messageType:relationshipID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return (*(uint64_t (**)(uint64_t))(a9 + 8))(a1);
}

uint64_t dispatch thunk of ReplicatorRecordEncoding.encode<A>(_:zone:relationshipID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return (*(uint64_t (**)(uint64_t))(a9 + 8))(a1);
}

id sub_25B37B3B8()
{
  return sub_25B37B3F0();
}

id sub_25B37B3D4()
{
  return sub_25B37B3F0();
}

id sub_25B37B3F0()
{
  swift_bridgeObjectRelease();
  uint64_t v0 = self;
  uint64_t v1 = (void *)sub_25B37F970();
  BOOL v2 = (void *)sub_25B37F970();
  id v3 = objc_msgSend(v0, sel_endpointForMachName_service_instance_, v1, v2, 0);

  if (v3)
  {
    id v4 = objc_msgSend(self, sel_connectionWithEndpoint_, v3);

    if (v4) {
  }
    }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4EBB08);
    uint64_t v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_25B3819A0;
    sub_25B37FE70();
    swift_bridgeObjectRelease();
    sub_25B37FA40();
    *(void *)(v5 + 56) = MEMORY[0x263F8D310];
    *(void *)(v5 + 32) = 0xD000000000000025;
    *(void *)(v5 + 40) = 0x800000025B38A5C0;
    sub_25B380230();
    swift_bridgeObjectRelease();
    return 0;
  }
  return v4;
}

uint64_t sub_25B37B59C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_25B37B5C4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

void sub_25B37B5EC(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_25B37B654(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

id StateCaptureClient.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

uint64_t StateCaptureClient.init()()
{
  id v1 = v0;
  uint64_t v20 = sub_25B37FD00();
  uint64_t v2 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  id v4 = (char *)v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_25B37FCE0();
  MEMORY[0x270FA5388](v5);
  uint64_t v6 = sub_25B37F860();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v7 = OBJC_IVAR____TtC18ReplicatorServices18StateCaptureClient_connection;
  *(void *)&v0[OBJC_IVAR____TtC18ReplicatorServices18StateCaptureClient_connection] = 0;
  uint64_t v19 = OBJC_IVAR____TtC18ReplicatorServices18StateCaptureClient_queue;
  v18[1] = sub_25B2E3070();
  uint64_t v8 = v0;
  sub_25B37F850();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_25B37BA30();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B3411F0);
  sub_25B35388C();
  sub_25B37FDC0();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F8F138], v20);
  *(void *)&v0[v19] = sub_25B37FD30();
  uint64_t v9 = *(void **)&v0[v7];
  *(void *)&v1[v7] = 0;

  uint64_t v10 = (objc_class *)type metadata accessor for StateCaptureClient();
  v22.receiver = v8;
  v22.super_class = v10;
  uint64_t v11 = (char *)objc_msgSendSuper2(&v22, sel_init);
  long long v12 = *(NSObject **)&v11[OBJC_IVAR____TtC18ReplicatorServices18StateCaptureClient_queue];
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v11;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = sub_25B37BAE4;
  *(void *)(v14 + 24) = v13;
  aBlock[4] = sub_25B37BB18;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_25B37B5C4;
  aBlock[3] = &block_descriptor_3;
  char v15 = _Block_copy(aBlock);
  long long v16 = v11;
  swift_retain();
  swift_release();
  dispatch_sync(v12, v15);

  _Block_release(v15);
  LOBYTE(v12) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if ((v12 & 1) == 0) {
    return (uint64_t)v16;
  }
  __break(1u);
  return result;
}

unint64_t sub_25B37BA30()
{
  unint64_t result = qword_26B341230;
  if (!qword_26B341230)
  {
    sub_25B37FCE0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B341230);
  }
  return result;
}

uint64_t type metadata accessor for StateCaptureClient()
{
  return self;
}

uint64_t sub_25B37BAAC()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_25B37BAE4()
{
}

uint64_t sub_25B37BB08()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25B37BB18()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

void *sub_25B37BB7C()
{
  uint64_t v1 = sub_25B37F8A0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  id v4 = (void *)((char *)aBlock - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = *(void **)&v0[OBJC_IVAR____TtC18ReplicatorServices18StateCaptureClient_queue];
  *id v4 = v5;
  (*(void (**)(void *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F8F0E0], v1);
  id v6 = v5;
  LOBYTE(v5) = sub_25B37F8B0();
  unint64_t result = (void *)(*(uint64_t (**)(void *, uint64_t))(v2 + 8))(v4, v1);
  if ((v5 & 1) == 0)
  {
    __break(1u);
LABEL_7:
    __break(1u);
    return result;
  }
  uint64_t v8 = OBJC_IVAR____TtC18ReplicatorServices18StateCaptureClient_connection;
  if (!*(void *)&v0[OBJC_IVAR____TtC18ReplicatorServices18StateCaptureClient_connection])
  {
    unint64_t result = sub_25B37B3F0();
    if (result)
    {
      uint64_t v9 = *(void **)&v0[v8];
      *(void *)&v0[v8] = result;
      id v10 = result;

      uint64_t v11 = swift_allocObject();
      *(void *)(v11 + 16) = v0;
      uint64_t v12 = swift_allocObject();
      *(void *)(v12 + 16) = sub_25B37CB68;
      *(void *)(v12 + 24) = v11;
      aBlock[4] = sub_25B3539E8;
      aBlock[5] = v12;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_25B353A10;
      aBlock[3] = &block_descriptor_16;
      uint64_t v13 = _Block_copy(aBlock);
      uint64_t v14 = v0;
      swift_retain();
      swift_release();
      objc_msgSend(v10, sel_configureConnection_, v13);

      _Block_release(v13);
      char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
      swift_release();
      unint64_t result = (void *)swift_release();
      if (isEscapingClosureAtFileLocation) {
        goto LABEL_7;
      }
    }
  }
  return result;
}

void sub_25B37BDFC(void *a1, uint64_t a2)
{
  id v4 = (void *)sub_25B37F970();
  id v5 = objc_msgSend(self, sel_interfaceWithIdentifier_, v4);

  id v6 = self;
  id v7 = objc_msgSend(v6, sel_protocolForProtocol_, &unk_2708EFF10);
  objc_msgSend(v5, sel_setClient_, v7);

  id v8 = objc_msgSend(v6, sel_protocolForProtocol_, &unk_2708EFE78);
  objc_msgSend(v5, sel_setServer_, v8);

  id v9 = objc_msgSend(self, sel_utility);
  objc_msgSend(a1, sel_setServiceQuality_, v9);

  objc_msgSend(a1, sel_setInterface_, v5);
  objc_msgSend(a1, sel_setInterfaceTarget_, a2);
  objc_msgSend(a1, sel_setTargetQueue_, *(void *)(a2 + OBJC_IVAR____TtC18ReplicatorServices18StateCaptureClient_queue));
  compression_status v17 = sub_25B37C0F4;
  uint64_t v18 = 0;
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 1107296256;
  char v15 = sub_25B37B5EC;
  long long v16 = &block_descriptor_19;
  id v10 = _Block_copy(&v13);
  objc_msgSend(a1, sel_setActivationHandler_, v10);
  _Block_release(v10);
  compression_status v17 = sub_25B37C100;
  uint64_t v18 = 0;
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 1107296256;
  char v15 = sub_25B37B5EC;
  long long v16 = &block_descriptor_22;
  uint64_t v11 = _Block_copy(&v13);
  objc_msgSend(a1, sel_setInterruptionHandler_, v11);
  _Block_release(v11);
  compression_status v17 = sub_25B37C10C;
  uint64_t v18 = 0;
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 1107296256;
  char v15 = sub_25B37B5EC;
  long long v16 = &block_descriptor_25;
  uint64_t v12 = _Block_copy(&v13);
  objc_msgSend(a1, sel_setInvalidationHandler_, v12);
  _Block_release(v12);
}

void sub_25B37C0F4(uint64_t a1)
{
}

void sub_25B37C100(uint64_t a1)
{
}

void sub_25B37C10C(uint64_t a1)
{
}

void sub_25B37C118(uint64_t a1, const char *a2)
{
  if (qword_26A4EB550 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_25B37F780();
  __swift_project_value_buffer(v3, (uint64_t)qword_26A4EB6C0);
  oslog = sub_25B37F760();
  os_log_type_t v4 = sub_25B37FCA0();
  if (os_log_type_enabled(oslog, v4))
  {
    id v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_25B2C1000, oslog, v4, a2, v5, 2u);
    MEMORY[0x2611621B0](v5, -1, -1);
  }
}

void sub_25B37C208()
{
  uint64_t v1 = sub_25B37F8A0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  os_log_type_t v4 = (void *)((char *)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  id v5 = *(void **)(v0 + OBJC_IVAR____TtC18ReplicatorServices18StateCaptureClient_queue);
  *os_log_type_t v4 = v5;
  (*(void (**)(void *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F8F0E0], v1);
  id v6 = v5;
  LOBYTE(v5) = sub_25B37F8B0();
  (*(void (**)(void *, uint64_t))(v2 + 8))(v4, v1);
  if (v5)
  {
    sub_25B37BB7C();
    id v7 = *(void **)(v0 + OBJC_IVAR____TtC18ReplicatorServices18StateCaptureClient_connection);
    if (v7)
    {
      id v8 = v7;
      if (objc_msgSend(v8, sel_remoteTarget))
      {
        sub_25B37FDA0();

        swift_unknownObjectRelease();
        sub_25B37CB08((uint64_t)v9);
      }
      else
      {
        memset(v9, 0, sizeof(v9));
        sub_25B37CB08((uint64_t)v9);
        objc_msgSend(v8, sel_activate);
      }
    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_25B37C398()
{
  uint64_t v1 = sub_25B37F8A0();
  Class isa = v1[-1].isa;
  MEMORY[0x270FA5388](v1);
  os_log_type_t v4 = (void *)((char *)v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  id v5 = *(void **)(v0 + OBJC_IVAR____TtC18ReplicatorServices18StateCaptureClient_queue);
  *os_log_type_t v4 = v5;
  (*((void (**)(void *, void, NSObject *))isa + 13))(v4, *MEMORY[0x263F8F0E0], v1);
  id v6 = v5;
  LOBYTE(v5) = sub_25B37F8B0();
  (*((void (**)(void *, NSObject *))isa + 1))(v4, v1);
  if ((v5 & 1) == 0)
  {
    __break(1u);
LABEL_20:
    swift_once();
    goto LABEL_15;
  }
  sub_25B37C208();
  id v7 = *(void **)(v0 + OBJC_IVAR____TtC18ReplicatorServices18StateCaptureClient_connection);
  if (!v7)
  {
    if (qword_26A4EB550 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_25B37F780();
    __swift_project_value_buffer(v8, (uint64_t)qword_26A4EB6C0);
    uint64_t v1 = sub_25B37F760();
    os_log_type_t v9 = sub_25B37FCC0();
    if (os_log_type_enabled(v1, v9))
    {
      id v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_25B2C1000, v1, v9, "StateCaptureClient: Failed to establish a connection", v10, 2u);
      MEMORY[0x2611621B0](v10, -1, -1);
    }
    goto LABEL_18;
  }
  uint64_t v1 = v7;
  if ([v1 remoteTarget])
  {
    sub_25B37FDA0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v17, 0, sizeof(v17));
  }
  sub_25B37CAA0((uint64_t)v17, (uint64_t)v18);
  if (v19)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4ECD78);
    if (swift_dynamicCast())
    {

      return v16[1];
    }
  }
  else
  {
    sub_25B37CB08((uint64_t)v18);
  }
  if (qword_26A4EB550 != -1) {
    goto LABEL_20;
  }
LABEL_15:
  uint64_t v12 = sub_25B37F780();
  __swift_project_value_buffer(v12, (uint64_t)qword_26A4EB6C0);
  uint64_t v13 = sub_25B37F760();
  os_log_type_t v14 = sub_25B37FCC0();
  if (os_log_type_enabled(v13, v14))
  {
    char v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v15 = 0;
    _os_log_impl(&dword_25B2C1000, v13, v14, "StateCaptureClient: Failed to cast connection to server interface protocol", v15, 2u);
    MEMORY[0x2611621B0](v15, -1, -1);
  }

LABEL_18:
  return 0;
}

id StateCaptureClient.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StateCaptureClient();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

Swift::String __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> StateCaptureClient.state(identifier:)(Swift::String_optional identifier)
{
  uint64_t v2 = sub_25B37FD10();
  if (!v1)
  {
    uint64_t v2 = v5;
    uint64_t v3 = v6;
  }
  result._object = v3;
  result._countAndFlagsBits = v2;
  return result;
}

void sub_25B37C7B8(void *a1@<X2>, uint64_t *a2@<X8>)
{
  v13[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v4 = sub_25B37C398();
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    if (a1) {
      a1 = (void *)sub_25B37F970();
    }
    v13[0] = 0;
    id v6 = objc_msgSend(v5, sel_stateFor_error_, a1, v13);
    swift_unknownObjectRelease();

    id v7 = v13[0];
    if (v6)
    {
      uint64_t v8 = sub_25B37F9A0();
      uint64_t v10 = v9;
      id v11 = v7;

      *a2 = v8;
      a2[1] = v10;
    }
    else
    {
      id v12 = v13[0];
      sub_25B37F470();

      swift_willThrow();
    }
  }
  else
  {
    *a2 = 0;
    a2[1] = 0xE000000000000000;
  }
}

void sub_25B37C8D8(uint64_t *a1@<X8>)
{
  sub_25B37C7B8(*(void **)(v1 + 32), a1);
}

Swift::String __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> StateCaptureClient.dataPath()()
{
  uint64_t v1 = sub_25B37FD10();
  if (!v0)
  {
    uint64_t v1 = v4;
    uint64_t v2 = v5;
  }
  result._object = v2;
  result._countAndFlagsBits = v1;
  return result;
}

void sub_25B37C964(uint64_t *a1@<X8>)
{
  v10[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v2 = (void *)sub_25B37C398();
  if (v2)
  {
    v10[0] = 0;
    id v3 = objc_msgSend(v2, sel_dataPathAndReturnError_, v10);
    swift_unknownObjectRelease();
    id v4 = v10[0];
    if (v3)
    {
      uint64_t v5 = sub_25B37F9A0();
      uint64_t v7 = v6;
      id v8 = v4;

      *a1 = v5;
      a1[1] = v7;
    }
    else
    {
      id v9 = v10[0];
      sub_25B37F470();

      swift_willThrow();
    }
  }
  else
  {
    *a1 = 0x6E776F6E6B6E55;
    a1[1] = 0xE700000000000000;
  }
}

void sub_25B37CA6C(uint64_t *a1@<X8>)
{
}

uint64_t method lookup function for StateCaptureClient(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for StateCaptureClient);
}

uint64_t sub_25B37CAA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3413D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25B37CB08(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3413D8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_25B37CB68(void *a1)
{
  sub_25B37BDFC(a1, *(void *)(v1 + 16));
}

uint64_t sub_25B37CB70()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t dispatch thunk of ReplicatorControlling.deviceUpdates.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of ReplicatorControlling.devices.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of ReplicatorControlling.pair(relationshipID:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

uint64_t dispatch thunk of ReplicatorControlling.unpair(relationshipID:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of ReplicatorControlling.retryStuckRelationships()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of ReplicatorControlling.setEnabled(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

void __swiftcall ClientDescriptor.init(id:entitlement:messageNotificationName:recordNotificationName:zoneDescriptors:messageDescriptors:)(ReplicatorServices::ClientDescriptor *__return_ptr retstr, Swift::String id, Swift::String entitlement, Swift::String messageNotificationName, Swift::String recordNotificationName, Swift::OpaquePointer zoneDescriptors, Swift::OpaquePointer messageDescriptors)
{
  object = messageNotificationName._object;
  uint64_t countAndFlagsBits = messageNotificationName._countAndFlagsBits;
  rawValue = zoneDescriptors._rawValue;
  uint64_t v8 = *((void *)zoneDescriptors._rawValue + 2);
  if (!v8)
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE80];
LABEL_18:
    v62 = v10;
    swift_bridgeObjectRelease();
    uint64_t v32 = *((void *)messageDescriptors._rawValue + 2);
    if (!v32)
    {
      uint64_t v34 = (void *)MEMORY[0x263F8EE80];
LABEL_35:
      swift_bridgeObjectRelease();
      retstr->id = id;
      retstr->entitlement = entitlement;
      retstr->messageNotificationName._uint64_t countAndFlagsBits = countAndFlagsBits;
      retstr->messageNotificationName._object = object;
      retstr->recordNotificationName = recordNotificationName;
      retstr->zoneDescriptors._rawValue = v62;
      retstr->messageDescriptors._rawValue = v34;
      return;
    }
    swift_bridgeObjectRetain();
    uint64_t v33 = (uint64_t *)((char *)messageDescriptors._rawValue + 56);
    uint64_t v34 = (void *)MEMORY[0x263F8EE80];
    while (1)
    {
      uint64_t v37 = *(v33 - 3);
      uint64_t v36 = *(v33 - 2);
      uint64_t v39 = *(v33 - 1);
      uint64_t v38 = *v33;
      swift_bridgeObjectRetain_n();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v42 = sub_25B2D5EB0(v37, v36);
      uint64_t v43 = v34[2];
      BOOL v44 = (v41 & 1) == 0;
      uint64_t v45 = v43 + v44;
      if (__OFADD__(v43, v44)) {
        goto LABEL_37;
      }
      char v46 = v41;
      if (v34[3] >= v45)
      {
        if (isUniquelyReferenced_nonNull_native)
        {
          if ((v41 & 1) == 0) {
            goto LABEL_29;
          }
        }
        else
        {
          sub_25B2DAF44();
          if ((v46 & 1) == 0) {
            goto LABEL_29;
          }
        }
      }
      else
      {
        sub_25B2D6490(v45, isUniquelyReferenced_nonNull_native);
        unint64_t v47 = sub_25B2D5EB0(v37, v36);
        if ((v46 & 1) != (v48 & 1)) {
          goto LABEL_40;
        }
        unint64_t v42 = v47;
        if ((v46 & 1) == 0)
        {
LABEL_29:
          v34[(v42 >> 6) + 8] |= 1 << v42;
          compression_status v49 = (uint64_t *)(v34[6] + 16 * v42);
          *compression_status v49 = v37;
          v49[1] = v36;
          uint64_t v50 = (uint64_t *)(v34[7] + 32 * v42);
          *uint64_t v50 = v37;
          v50[1] = v36;
          v50[2] = v39;
          v50[3] = v38;
          uint64_t v51 = v34[2];
          BOOL v30 = __OFADD__(v51, 1);
          uint64_t v52 = v51 + 1;
          if (v30) {
            goto LABEL_39;
          }
          v34[2] = v52;
          swift_bridgeObjectRetain();
          goto LABEL_21;
        }
      }
      uint64_t v35 = (uint64_t *)(v34[7] + 32 * v42);
      swift_bridgeObjectRelease();
      *uint64_t v35 = v37;
      v35[1] = v36;
      v35[2] = v39;
      v35[3] = v38;
LABEL_21:
      v33 += 4;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (!--v32)
      {
        swift_bridgeObjectRelease();
        goto LABEL_35;
      }
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v9 = 0;
  uint64_t v10 = (void *)MEMORY[0x263F8EE80];
  while (1)
  {
    uint64_t v13 = &rawValue[v9];
    uint64_t v15 = *(void *)&rawValue[v9 + 32];
    uint64_t v14 = *(void *)&rawValue[v9 + 40];
    char v16 = rawValue[v9 + 48];
    char v17 = rawValue[v9 + 49];
    uint64_t v59 = *((void *)v13 + 7);
    uint64_t v60 = *((void *)v13 + 8);
    char v61 = v13[72];
    swift_bridgeObjectRetain_n();
    char v18 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v20 = sub_25B2D5EB0(v15, v14);
    uint64_t v21 = v10[2];
    BOOL v22 = (v19 & 1) == 0;
    uint64_t v23 = v21 + v22;
    if (__OFADD__(v21, v22)) {
      break;
    }
    char v24 = v19;
    if (v10[3] >= v23)
    {
      if (v18)
      {
        if ((v19 & 1) == 0) {
          goto LABEL_12;
        }
      }
      else
      {
        sub_25B2DB10C();
        if ((v24 & 1) == 0) {
          goto LABEL_12;
        }
      }
    }
    else
    {
      sub_25B2D67C0(v23, v18);
      unint64_t v25 = sub_25B2D5EB0(v15, v14);
      if ((v24 & 1) != (v26 & 1)) {
        goto LABEL_40;
      }
      unint64_t v20 = v25;
      if ((v24 & 1) == 0)
      {
LABEL_12:
        v10[(v20 >> 6) + 8] |= 1 << v20;
        uint64_t v27 = (uint64_t *)(v10[6] + 16 * v20);
        uint64_t *v27 = v15;
        v27[1] = v14;
        uint64_t v28 = v10[7] + 48 * v20;
        *(void *)uint64_t v28 = v15;
        *(void *)(v28 + 8) = v14;
        *(unsigned char *)(v28 + 16) = v16;
        *(unsigned char *)(v28 + 17) = v17;
        *(void *)(v28 + 24) = v59;
        *(void *)(v28 + 32) = v60;
        *(unsigned char *)(v28 + 40) = v61;
        uint64_t v29 = v10[2];
        BOOL v30 = __OFADD__(v29, 1);
        uint64_t v31 = v29 + 1;
        if (v30) {
          goto LABEL_38;
        }
        id v10[2] = v31;
        swift_bridgeObjectRetain();
        goto LABEL_4;
      }
    }
    id v11 = v10;
    uint64_t v12 = v10[7] + 48 * v20;
    swift_bridgeObjectRelease();
    *(void *)uint64_t v12 = v15;
    *(void *)(v12 + 8) = v14;
    *(unsigned char *)(v12 + 16) = v16;
    *(unsigned char *)(v12 + 17) = v17;
    *(void *)(v12 + 24) = v59;
    *(void *)(v12 + 32) = v60;
    *(unsigned char *)(v12 + 40) = v61;
    uint64_t v10 = v11;
LABEL_4:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v9 += 48;
    --v8;
    rawValue = zoneDescriptors._rawValue;
    if (!v8)
    {
      swift_bridgeObjectRelease();
      goto LABEL_18;
    }
  }
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  sub_25B3801C0();
  __break(1u);
}

uint64_t ClientDescriptor.id.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ClientDescriptor.id.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*ClientDescriptor.id.modify())()
{
  return nullsub_1;
}

uint64_t ClientDescriptor.entitlement.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ClientDescriptor.entitlement.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*ClientDescriptor.entitlement.modify())()
{
  return nullsub_1;
}

uint64_t ClientDescriptor.messageNotificationName.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ClientDescriptor.messageNotificationName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return result;
}

uint64_t (*ClientDescriptor.messageNotificationName.modify())()
{
  return nullsub_1;
}

uint64_t ClientDescriptor.recordNotificationName.getter()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ClientDescriptor.recordNotificationName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 48) = a1;
  *(void *)(v2 + 56) = a2;
  return result;
}

uint64_t (*ClientDescriptor.recordNotificationName.modify())()
{
  return nullsub_1;
}

uint64_t ClientDescriptor.zoneDescriptors.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ClientDescriptor.zoneDescriptors.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 64) = a1;
  return result;
}

uint64_t (*ClientDescriptor.zoneDescriptors.modify())()
{
  return nullsub_1;
}

uint64_t ClientDescriptor.messageDescriptors.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ClientDescriptor.messageDescriptors.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 72) = a1;
  return result;
}

uint64_t (*ClientDescriptor.messageDescriptors.modify())()
{
  return nullsub_1;
}

uint64_t ClientDescriptor.hash.getter()
{
  return sub_25B37FD90();
}

uint64_t ClientDescriptor.hash(into:)(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 64);
  uint64_t v3 = *(void *)(v1 + 72);
  swift_bridgeObjectRetain();
  sub_25B37FA10();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25B37FA10();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25B37FA10();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25B37FA10();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25B37E81C(a1, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25B37E628(a1, v3);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25B37D4A8(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  uint64_t v2 = a2;
  uint64_t v3 = result;
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v4 = 0;
  uint64_t v34 = result + 64;
  uint64_t v5 = 1 << *(unsigned char *)(result + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(result + 64);
  int64_t v35 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v36 = result;
  while (1)
  {
    if (v7)
    {
      uint64_t v38 = (v7 - 1) & v7;
      int64_t v39 = v4;
      unint64_t v8 = __clz(__rbit64(v7)) | (v4 << 6);
      goto LABEL_24;
    }
    int64_t v9 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_47;
    }
    if (v9 >= v35) {
      return 1;
    }
    unint64_t v10 = *(void *)(v34 + 8 * v9);
    int64_t v11 = v4 + 1;
    if (!v10)
    {
      int64_t v11 = v4 + 2;
      if (v4 + 2 >= v35) {
        return 1;
      }
      unint64_t v10 = *(void *)(v34 + 8 * v11);
      if (!v10)
      {
        int64_t v11 = v4 + 3;
        if (v4 + 3 >= v35) {
          return 1;
        }
        unint64_t v10 = *(void *)(v34 + 8 * v11);
        if (!v10)
        {
          int64_t v11 = v4 + 4;
          if (v4 + 4 >= v35) {
            return 1;
          }
          unint64_t v10 = *(void *)(v34 + 8 * v11);
          if (!v10) {
            break;
          }
        }
      }
    }
LABEL_23:
    uint64_t v38 = (v10 - 1) & v10;
    int64_t v39 = v11;
    unint64_t v8 = __clz(__rbit64(v10)) + (v11 << 6);
LABEL_24:
    uint64_t v13 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v8);
    uint64_t v14 = *v13;
    uint64_t v15 = v13[1];
    uint64_t v16 = *(void *)(v3 + 56) + 48 * v8;
    uint64_t v18 = *(void *)v16;
    uint64_t v17 = *(void *)(v16 + 8);
    int v19 = *(unsigned __int8 *)(v16 + 16);
    uint64_t v21 = *(void *)(v16 + 24);
    uint64_t v20 = *(void *)(v16 + 32);
    int v40 = *(unsigned __int8 *)(v16 + 40);
    int v41 = *(unsigned __int8 *)(v16 + 17);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v22 = v2;
    unint64_t v23 = sub_25B2D5EB0(v14, v15);
    char v25 = v24;
    swift_bridgeObjectRelease();
    if ((v25 & 1) == 0) {
      goto LABEL_44;
    }
    uint64_t v26 = *(void *)(v2 + 56) + 48 * v23;
    int v27 = *(unsigned __int8 *)(v26 + 16);
    int v28 = *(unsigned __int8 *)(v26 + 17);
    uint64_t v30 = *(void *)(v26 + 24);
    uint64_t v29 = *(void *)(v26 + 32);
    int v37 = *(unsigned __int8 *)(v26 + 40);
    if (*(void *)v26 == v18 && *(void *)(v26 + 8) == v17)
    {
      if (v19 != v27) {
        goto LABEL_44;
      }
    }
    else if (sub_25B3801A0() & 1) == 0 || ((v19 ^ v27))
    {
LABEL_44:
      swift_bridgeObjectRelease();
      return 0;
    }
    swift_bridgeObjectRelease();
    uint64_t result = 0;
    if (v28 == v41 && v30 == v21 && v29 == v20)
    {
      uint64_t v2 = v22;
      uint64_t v3 = v36;
      unint64_t v7 = v38;
      int64_t v4 = v39;
      if (((v40 ^ v37) & 1) == 0) {
        continue;
      }
    }
    return result;
  }
  uint64_t v12 = v4 + 5;
  if (v4 + 5 >= v35) {
    return 1;
  }
  unint64_t v10 = *(void *)(v34 + 8 * v12);
  if (v10)
  {
    int64_t v11 = v4 + 5;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      break;
    }
    if (v11 >= v35) {
      return 1;
    }
    unint64_t v10 = *(void *)(v34 + 8 * v11);
    ++v12;
    if (v10) {
      goto LABEL_23;
    }
  }
LABEL_47:
  __break(1u);
  return result;
}

uint64_t sub_25B37D754(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  uint64_t v3 = result;
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v4 = 0;
  uint64_t v33 = result + 64;
  uint64_t v5 = 1 << *(unsigned char *)(result + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(result + 64);
  int64_t v34 = (unint64_t)(v5 + 63) >> 6;
  while (1)
  {
    if (v7)
    {
      unint64_t v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      int64_t v35 = v4;
      unint64_t v10 = v9 | (v4 << 6);
      goto LABEL_29;
    }
    int64_t v11 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_45;
    }
    if (v11 >= v34) {
      return 1;
    }
    unint64_t v12 = *(void *)(v33 + 8 * v11);
    int64_t v13 = v4 + 1;
    if (!v12)
    {
      int64_t v13 = v4 + 2;
      if (v4 + 2 >= v34) {
        return 1;
      }
      unint64_t v12 = *(void *)(v33 + 8 * v13);
      if (!v12)
      {
        int64_t v13 = v4 + 3;
        if (v4 + 3 >= v34) {
          return 1;
        }
        unint64_t v12 = *(void *)(v33 + 8 * v13);
        if (!v12)
        {
          int64_t v13 = v4 + 4;
          if (v4 + 4 >= v34) {
            return 1;
          }
          unint64_t v12 = *(void *)(v33 + 8 * v13);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_28:
    unint64_t v7 = (v12 - 1) & v12;
    int64_t v35 = v13;
    unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
LABEL_29:
    uint64_t v15 = v3;
    uint64_t v16 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v10);
    uint64_t v17 = *v16;
    uint64_t v18 = v16[1];
    int v19 = (uint64_t *)(*(void *)(v3 + 56) + 32 * v10);
    uint64_t v21 = *v19;
    uint64_t v20 = v19[1];
    uint64_t v22 = v19[2];
    uint64_t v23 = v19[3];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v24 = sub_25B2D5EB0(v17, v18);
    char v26 = v25;
    swift_bridgeObjectRelease();
    if ((v26 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
    int v27 = (void *)(*(void *)(a2 + 56) + 32 * v24);
    uint64_t v29 = v27[2];
    uint64_t v28 = v27[3];
    if (*v27 == v21 && v27[1] == v20)
    {
      uint64_t result = swift_bridgeObjectRelease();
      BOOL v8 = v29 == v22 && v28 == v23;
      uint64_t v3 = v15;
      int64_t v4 = v35;
      if (!v8) {
        return 0;
      }
    }
    else
    {
      char v31 = sub_25B3801A0();
      swift_bridgeObjectRelease();
      uint64_t result = 0;
      if ((v31 & 1) == 0) {
        return result;
      }
      BOOL v32 = v29 == v22 && v28 == v23;
      uint64_t v3 = v15;
      int64_t v4 = v35;
      if (!v32) {
        return result;
      }
    }
  }
  uint64_t v14 = v4 + 5;
  if (v4 + 5 >= v34) {
    return 1;
  }
  unint64_t v12 = *(void *)(v33 + 8 * v14);
  if (v12)
  {
    int64_t v13 = v4 + 5;
    goto LABEL_28;
  }
  while (1)
  {
    int64_t v13 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v13 >= v34) {
      return 1;
    }
    unint64_t v12 = *(void *)(v33 + 8 * v13);
    ++v14;
    if (v12) {
      goto LABEL_28;
    }
  }
LABEL_45:
  __break(1u);
  return result;
}

unint64_t sub_25B37D9CC(char a1)
{
  unint64_t result = 25705;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6D656C7469746E65;
      break;
    case 2:
      unint64_t result = 0xD000000000000017;
      break;
    case 3:
      unint64_t result = 0xD000000000000016;
      break;
    case 4:
      unint64_t result = 0x63736544656E6F7ALL;
      break;
    case 5:
      unint64_t result = 0xD000000000000012;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_25B37DAB0()
{
  return sub_25B37D9CC(*v0);
}

uint64_t sub_25B37DAB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25B37F0DC(a1, a2);
  *a3 = result;
  return result;
}

void sub_25B37DAE0(unsigned char *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_25B37DAEC(uint64_t a1)
{
  unint64_t v2 = sub_25B37EBC4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B37DB28(uint64_t a1)
{
  unint64_t v2 = sub_25B37EBC4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ClientDescriptor.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B341720);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = v1[2];
  uint64_t v19 = v1[3];
  uint64_t v20 = v7;
  uint64_t v8 = v1[4];
  uint64_t v17 = v1[5];
  uint64_t v18 = v8;
  uint64_t v9 = v1[6];
  uint64_t v15 = v1[7];
  uint64_t v16 = v9;
  uint64_t v10 = v1[8];
  uint64_t v13 = v1[9];
  uint64_t v14 = v10;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25B37EBC4();
  sub_25B3802C0();
  LOBYTE(v23) = 0;
  uint64_t v11 = v21;
  sub_25B380140();
  if (!v11)
  {
    LOBYTE(v23) = 1;
    sub_25B380140();
    LOBYTE(v23) = 2;
    sub_25B380140();
    LOBYTE(v23) = 3;
    sub_25B380140();
    uint64_t v23 = v14;
    char v22 = 4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B3416B0);
    sub_25B37EC6C(&qword_26B3416B8, &qword_26B3416B0, (void (*)(void))sub_25B37EC18);
    sub_25B380160();
    uint64_t v23 = v13;
    char v22 = 5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B3416C0);
    sub_25B37EC6C((unint64_t *)&unk_26B3416C8, &qword_26B3416C0, (void (*)(void))sub_25B37ECEC);
    sub_25B380160();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t ClientDescriptor.hashValue.getter()
{
  uint64_t v2 = *(void *)(v0 + 64);
  uint64_t v1 = *(void *)(v0 + 72);
  sub_25B380250();
  swift_bridgeObjectRetain();
  sub_25B37FA10();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25B37FA10();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25B37FA10();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25B37FA10();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25B37E81C((uint64_t)v4, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25B37E628((uint64_t)v4, v1);
  swift_bridgeObjectRelease();
  return sub_25B380290();
}

uint64_t ClientDescriptor.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B341780);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25B37EBC4();
  sub_25B3802B0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  LOBYTE(v35) = 0;
  uint64_t v9 = sub_25B380090();
  uint64_t v11 = v10;
  LOBYTE(v35) = 1;
  swift_bridgeObjectRetain();
  uint64_t v31 = sub_25B380090();
  uint64_t v32 = v9;
  LOBYTE(v35) = 2;
  uint64_t v13 = v12;
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_25B380090();
  uint64_t v33 = v15;
  uint64_t v27 = v14;
  uint64_t v29 = v13;
  LOBYTE(v35) = 3;
  swift_bridgeObjectRetain();
  uint64_t v28 = 0;
  uint64_t v26 = sub_25B380090();
  uint64_t v17 = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3416B0);
  char v34 = 4;
  sub_25B37ED40(&qword_26B341768, &qword_26B3416B0, (void (*)(void))sub_25B37EDC0);
  uint64_t v30 = v17;
  swift_bridgeObjectRetain();
  sub_25B3800B0();
  uint64_t v19 = v35;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3416C0);
  char v34 = 5;
  sub_25B37ED40(&qword_26B341770, &qword_26B3416C0, (void (*)(void))sub_25B37EE14);
  uint64_t v25 = v19;
  swift_bridgeObjectRetain();
  sub_25B3800B0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v20 = v35;
  swift_bridgeObjectRetain();
  uint64_t v21 = v29;
  swift_bridgeObjectRetain();
  uint64_t v22 = v33;
  swift_bridgeObjectRetain();
  uint64_t v23 = v30;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *a2 = v32;
  a2[1] = v11;
  a2[2] = v31;
  a2[3] = v21;
  a2[4] = v27;
  a2[5] = v22;
  uint64_t v24 = v25;
  a2[6] = v26;
  a2[7] = v23;
  a2[8] = v24;
  a2[9] = v20;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25B37E4C8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return ClientDescriptor.init(from:)(a1, a2);
}

uint64_t sub_25B37E4E0(void *a1)
{
  return ClientDescriptor.encode(to:)(a1);
}

uint64_t sub_25B37E500()
{
  uint64_t v2 = *(void *)(v0 + 64);
  uint64_t v1 = *(void *)(v0 + 72);
  sub_25B380250();
  swift_bridgeObjectRetain();
  sub_25B37FA10();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25B37FA10();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25B37FA10();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25B37FA10();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25B37E81C((uint64_t)v4, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25B37E628((uint64_t)v4, v1);
  swift_bridgeObjectRelease();
  return sub_25B380290();
}

uint64_t sub_25B37E628(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = a2 + 64;
  uint64_t v2 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v3 = -1;
  if (v2 < 64) {
    uint64_t v3 = ~(-1 << v2);
  }
  uint64_t v4 = v3 & *(void *)(a2 + 64);
  int64_t v11 = (unint64_t)(v2 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v6 = 0;
  int64_t v7 = 0;
  while (1)
  {
    if (v4)
    {
      v4 &= v4 - 1;
      goto LABEL_5;
    }
    int64_t v8 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_21;
    }
    if (v8 >= v11) {
      goto LABEL_19;
    }
    uint64_t v9 = *(void *)(v12 + 8 * v8);
    ++v7;
    if (!v9)
    {
      int64_t v7 = v8 + 1;
      if (v8 + 1 >= v11) {
        goto LABEL_19;
      }
      uint64_t v9 = *(void *)(v12 + 8 * v7);
      if (!v9) {
        break;
      }
    }
LABEL_18:
    uint64_t v4 = (v9 - 1) & v9;
LABEL_5:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_25B37FA10();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_25B37FA10();
    swift_bridgeObjectRelease();
    sub_25B380280();
    sub_25B380280();
    swift_bridgeObjectRelease();
    uint64_t result = sub_25B380290();
    v6 ^= result;
  }
  int64_t v10 = v8 + 2;
  if (v10 >= v11)
  {
LABEL_19:
    swift_release();
    return sub_25B380260();
  }
  uint64_t v9 = *(void *)(v12 + 8 * v10);
  if (v9)
  {
    int64_t v7 = v10;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v7 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      break;
    }
    if (v7 >= v11) {
      goto LABEL_19;
    }
    uint64_t v9 = *(void *)(v12 + 8 * v7);
    ++v10;
    if (v9) {
      goto LABEL_18;
    }
  }
LABEL_21:
  __break(1u);
  return result;
}

uint64_t sub_25B37E81C(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = a2 + 64;
  uint64_t v2 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v3 = -1;
  if (v2 < 64) {
    uint64_t v3 = ~(-1 << v2);
  }
  uint64_t v4 = v3 & *(void *)(a2 + 64);
  int64_t v12 = (unint64_t)(v2 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v6 = 0;
  int64_t v7 = 0;
  while (1)
  {
    if (v4)
    {
      v4 &= v4 - 1;
      int64_t v14 = v7;
      goto LABEL_5;
    }
    int64_t v8 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_21;
    }
    if (v8 >= v12) {
      goto LABEL_19;
    }
    uint64_t v9 = *(void *)(v13 + 8 * v8);
    int64_t v10 = v7 + 1;
    if (!v9)
    {
      int64_t v10 = v7 + 2;
      if (v7 + 2 >= v12) {
        goto LABEL_19;
      }
      uint64_t v9 = *(void *)(v13 + 8 * v10);
      if (!v9) {
        break;
      }
    }
LABEL_18:
    uint64_t v4 = (v9 - 1) & v9;
    int64_t v14 = v10;
LABEL_5:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_25B37FA10();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_25B37FA10();
    swift_bridgeObjectRelease();
    sub_25B380280();
    sub_25B380280();
    sub_25B380280();
    sub_25B380280();
    sub_25B380270();
    swift_bridgeObjectRelease();
    uint64_t result = sub_25B380290();
    int64_t v7 = v14;
    v6 ^= result;
  }
  uint64_t v11 = v7 + 3;
  if (v7 + 3 >= v12)
  {
LABEL_19:
    swift_release();
    return sub_25B380260();
  }
  uint64_t v9 = *(void *)(v13 + 8 * v11);
  if (v9)
  {
    int64_t v10 = v7 + 3;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v10 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      break;
    }
    if (v10 >= v12) {
      goto LABEL_19;
    }
    uint64_t v9 = *(void *)(v13 + 8 * v10);
    ++v11;
    if (v9) {
      goto LABEL_18;
    }
  }
LABEL_21:
  __break(1u);
  return result;
}

uint64_t _s18ReplicatorServices16ClientDescriptorV2eeoiySbAC_ACtFZ_0(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a1[3];
  uint64_t v4 = a1[4];
  uint64_t v5 = a1[5];
  uint64_t v17 = a1[7];
  uint64_t v18 = a1[6];
  uint64_t v7 = a2[2];
  uint64_t v6 = a2[3];
  uint64_t v8 = a2[4];
  uint64_t v9 = a2[5];
  uint64_t v10 = a2[6];
  uint64_t v11 = a2[7];
  uint64_t v15 = a2[8];
  uint64_t v16 = a1[8];
  uint64_t v13 = a2[9];
  uint64_t v14 = a1[9];
  if ((*a1 != *a2 || a1[1] != a2[1]) && (sub_25B3801A0() & 1) == 0
    || (v2 != v7 || v3 != v6) && (sub_25B3801A0() & 1) == 0
    || (v4 != v8 || v5 != v9) && (sub_25B3801A0() & 1) == 0
    || (v18 != v10 || v17 != v11) && (sub_25B3801A0() & 1) == 0
    || (sub_25B37D4A8(v16, v15) & 1) == 0)
  {
    return 0;
  }
  return sub_25B37D754(v14, v13);
}

unint64_t sub_25B37EBC4()
{
  unint64_t result = qword_26B341570;
  if (!qword_26B341570)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B341570);
  }
  return result;
}

unint64_t sub_25B37EC18()
{
  unint64_t result = qword_26B341568;
  if (!qword_26B341568)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B341568);
  }
  return result;
}

uint64_t sub_25B37EC6C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_25B37ECEC()
{
  unint64_t result = qword_26B3415A0;
  if (!qword_26B3415A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3415A0);
  }
  return result;
}

uint64_t sub_25B37ED40(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_25B37EDC0()
{
  unint64_t result = qword_26B341738;
  if (!qword_26B341738)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B341738);
  }
  return result;
}

unint64_t sub_25B37EE14()
{
  unint64_t result = qword_26B341750;
  if (!qword_26B341750)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B341750);
  }
  return result;
}

unint64_t sub_25B37EE6C()
{
  unint64_t result = qword_26B341598;
  if (!qword_26B341598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B341598);
  }
  return result;
}

ValueMetadata *type metadata accessor for ClientDescriptor()
{
  return &type metadata for ClientDescriptor;
}

unsigned char *storeEnumTagSinglePayload for ClientDescriptor.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *unint64_t result = a2 + 5;
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
        JUMPOUT(0x25B37EF9CLL);
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
          *unint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ClientDescriptor.CodingKeys()
{
  return &type metadata for ClientDescriptor.CodingKeys;
}

unint64_t sub_25B37EFD8()
{
  unint64_t result = qword_26A4ECD80;
  if (!qword_26A4ECD80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4ECD80);
  }
  return result;
}

unint64_t sub_25B37F030()
{
  unint64_t result = qword_26B341580;
  if (!qword_26B341580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B341580);
  }
  return result;
}

unint64_t sub_25B37F088()
{
  unint64_t result = qword_26B341578;
  if (!qword_26B341578)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B341578);
  }
  return result;
}

uint64_t sub_25B37F0DC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_25B3801A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6D656C7469746E65 && a2 == 0xEB00000000746E65 || (sub_25B3801A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x800000025B38BE20 || (sub_25B3801A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x800000025B38BE40 || (sub_25B3801A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x63736544656E6F7ALL && a2 == 0xEF73726F74706972 || (sub_25B3801A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000025B38BE60)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    char v6 = sub_25B3801A0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 5;
    }
    else {
      return 6;
    }
  }
}

uint64_t sub_25B37F370()
{
  return MEMORY[0x270EEDB90]();
}

uint64_t sub_25B37F380()
{
  return MEMORY[0x270EEE618]();
}

uint64_t sub_25B37F390()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_25B37F3A0()
{
  return MEMORY[0x270EEE648]();
}

uint64_t sub_25B37F3B0()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_25B37F3C0()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_25B37F3D0()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_25B37F3E0()
{
  return MEMORY[0x270EEF238]();
}

uint64_t sub_25B37F3F0()
{
  return MEMORY[0x270EEF250]();
}

uint64_t sub_25B37F400()
{
  return MEMORY[0x270EEF268]();
}

uint64_t sub_25B37F410()
{
  return MEMORY[0x270EEF278]();
}

uint64_t sub_25B37F420()
{
  return MEMORY[0x270EEF288]();
}

uint64_t sub_25B37F430()
{
  return MEMORY[0x270EEF2A8]();
}

uint64_t sub_25B37F440()
{
  return MEMORY[0x270EEF2B8]();
}

uint64_t sub_25B37F450()
{
  return MEMORY[0x270EEF800]();
}

uint64_t sub_25B37F460()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_25B37F470()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_25B37F480()
{
  return MEMORY[0x270EEFBD0]();
}

uint64_t sub_25B37F490()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_25B37F4A0()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_25B37F4B0()
{
  return MEMORY[0x270EEFDC0]();
}

uint64_t sub_25B37F4C0()
{
  return MEMORY[0x270EEFE00]();
}

uint64_t sub_25B37F4D0()
{
  return MEMORY[0x270EEFE68]();
}

uint64_t sub_25B37F4E0()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_25B37F4F0()
{
  return MEMORY[0x270EEFF40]();
}

uint64_t sub_25B37F500()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_25B37F510()
{
  return MEMORY[0x270EEFFB0]();
}

uint64_t sub_25B37F520()
{
  return MEMORY[0x270EEFFE0]();
}

uint64_t sub_25B37F530()
{
  return MEMORY[0x270EEFFE8]();
}

uint64_t sub_25B37F540()
{
  return MEMORY[0x270EF0000]();
}

uint64_t sub_25B37F550()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_25B37F560()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_25B37F570()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_25B37F580()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_25B37F590()
{
  return MEMORY[0x270EF09B8]();
}

uint64_t sub_25B37F5A0()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t sub_25B37F5B0()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_25B37F5C0()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_25B37F5D0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_25B37F5E0()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t sub_25B37F5F0()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_25B37F600()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_25B37F610()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_25B37F620()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_25B37F630()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_25B37F640()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_25B37F650()
{
  return MEMORY[0x270F5AE58]();
}

uint64_t sub_25B37F660()
{
  return MEMORY[0x270F5AE68]();
}

uint64_t sub_25B37F670()
{
  return MEMORY[0x270F5AE88]();
}

uint64_t sub_25B37F680()
{
  return MEMORY[0x270F5AE90]();
}

uint64_t sub_25B37F690()
{
  return MEMORY[0x270F5AE98]();
}

uint64_t sub_25B37F6A0()
{
  return MEMORY[0x270F5AEA0]();
}

uint64_t sub_25B37F6B0()
{
  return MEMORY[0x270F5AEA8]();
}

uint64_t sub_25B37F6C0()
{
  return MEMORY[0x270F5AFA0]();
}

uint64_t sub_25B37F6D0()
{
  return MEMORY[0x270F5AFA8]();
}

uint64_t sub_25B37F6E0()
{
  return MEMORY[0x270F5AFB0]();
}

uint64_t sub_25B37F6F0()
{
  return MEMORY[0x270F5AFB8]();
}

uint64_t _s18ReplicatorServices0A6HasherV8finalize10Foundation4UUIDVyF_0()
{
  return MEMORY[0x270F5AFC0]();
}

uint64_t sub_25B37F710()
{
  return MEMORY[0x270F5AFC8]();
}

uint64_t sub_25B37F720()
{
  return MEMORY[0x270F5AFD0]();
}

uint64_t sub_25B37F730()
{
  return MEMORY[0x270F5B040]();
}

uint64_t sub_25B37F740()
{
  return MEMORY[0x270F5B048]();
}

uint64_t sub_25B37F750()
{
  return MEMORY[0x270F5B050]();
}

uint64_t sub_25B37F760()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25B37F770()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_25B37F780()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25B37F790()
{
  return MEMORY[0x270FA2C18]();
}

uint64_t sub_25B37F7A0()
{
  return MEMORY[0x270FA2C30]();
}

uint64_t sub_25B37F7B0()
{
  return MEMORY[0x270EE3B98]();
}

uint64_t sub_25B37F7C0()
{
  return MEMORY[0x270EE3C50]();
}

uint64_t sub_25B37F7D0()
{
  return MEMORY[0x270EE3C70]();
}

uint64_t sub_25B37F7E0()
{
  return MEMORY[0x270EE3C88]();
}

uint64_t sub_25B37F7F0()
{
  return MEMORY[0x270EE3CB8]();
}

uint64_t sub_25B37F800()
{
  return MEMORY[0x270EE3E08]();
}

uint64_t sub_25B37F810()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_25B37F820()
{
  return MEMORY[0x270FA0970]();
}

uint64_t sub_25B37F830()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_25B37F840()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_25B37F850()
{
  return MEMORY[0x270FA0A18]();
}

uint64_t sub_25B37F860()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_25B37F870()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_25B37F880()
{
  return MEMORY[0x270FA0AD0]();
}

uint64_t sub_25B37F890()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_25B37F8A0()
{
  return MEMORY[0x270FA0BA8]();
}

uint64_t sub_25B37F8B0()
{
  return MEMORY[0x270FA0BF0]();
}

uint64_t sub_25B37F8C0()
{
  return MEMORY[0x270F9CFB0]();
}

uint64_t sub_25B37F8D0()
{
  return MEMORY[0x270F9CFC0]();
}

uint64_t sub_25B37F8E0()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_25B37F8F0()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_25B37F900()
{
  return MEMORY[0x270F9D1C8]();
}

uint64_t sub_25B37F910()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t sub_25B37F920()
{
  return MEMORY[0x270F9D208]();
}

uint64_t sub_25B37F930()
{
  return MEMORY[0x270F9D210]();
}

uint64_t sub_25B37F940()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_25B37F950()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_25B37F960()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_25B37F970()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25B37F980()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_25B37F990()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_25B37F9A0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25B37F9B0()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_25B37F9C0()
{
  return MEMORY[0x270EF1AC8]();
}

uint64_t sub_25B37F9D0()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_25B37F9E0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_25B37F9F0()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_25B37FA00()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_25B37FA10()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25B37FA20()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_25B37FA30()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_25B37FA40()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25B37FA50()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25B37FA60()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_25B37FA70()
{
  return MEMORY[0x270F9D938]();
}

uint64_t sub_25B37FA80()
{
  return MEMORY[0x270F9D9A0]();
}

uint64_t sub_25B37FA90()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t sub_25B37FAA0()
{
  return MEMORY[0x270F9DAC0]();
}

uint64_t sub_25B37FAB0()
{
  return MEMORY[0x270F9DB18]();
}

uint64_t sub_25B37FAC0()
{
  return MEMORY[0x270F9DB40]();
}

uint64_t sub_25B37FAD0()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_25B37FAE0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_25B37FAF0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_25B37FB00()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_25B37FB10()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_25B37FB20()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_25B37FB30()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_25B37FB40()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_25B37FB50()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_25B37FB60()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_25B37FB70()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_25B37FB80()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_25B37FB90()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_25B37FBA0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_25B37FBB0()
{
  return MEMORY[0x270FA1F28]();
}

uint64_t sub_25B37FBC0()
{
  return MEMORY[0x270FA1F30]();
}

uint64_t sub_25B37FBD0()
{
  return MEMORY[0x270FA1F38]();
}

uint64_t sub_25B37FBE0()
{
  return MEMORY[0x270FA1F48]();
}

uint64_t sub_25B37FBF0()
{
  return MEMORY[0x270FA1F58]();
}

uint64_t sub_25B37FC00()
{
  return MEMORY[0x270FA1F60]();
}

uint64_t sub_25B37FC20()
{
  return MEMORY[0x270FA1F90]();
}

uint64_t sub_25B37FC30()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_25B37FC40()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_25B37FC50()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_25B37FC60()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_25B37FC70()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_25B37FC80()
{
  return MEMORY[0x270EF1E30]();
}

uint64_t sub_25B37FC90()
{
  return MEMORY[0x270EF1E40]();
}

uint64_t sub_25B37FCA0()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_25B37FCB0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25B37FCC0()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_25B37FCD0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_25B37FCE0()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_25B37FCF0()
{
  return MEMORY[0x270FA0C78]();
}

uint64_t sub_25B37FD00()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_25B37FD10()
{
  return MEMORY[0x270FA0D88]();
}

uint64_t sub_25B37FD20()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_25B37FD30()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_25B37FD40()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_25B37FD50()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_25B37FD60()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_25B37FD70()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25B37FD80()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25B37FD90()
{
  return MEMORY[0x270EF2550]();
}

uint64_t sub_25B37FDA0()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_25B37FDC0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_25B37FDD0()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_25B37FDE0()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_25B37FDF0()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_25B37FE00()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_25B37FE10()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_25B37FE20()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_25B37FE30()
{
  return MEMORY[0x270F9E878]();
}

uint64_t sub_25B37FE40()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_25B37FE50()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_25B37FE60()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_25B37FE70()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25B37FE80()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25B37FE90()
{
  return MEMORY[0x270F9E9D0]();
}

uint64_t sub_25B37FEA0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_25B37FEB0()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_25B37FEC0()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_25B37FED0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25B37FEE0()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_25B37FEF0()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_25B37FF00()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_25B37FF10()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_25B37FF20()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_25B37FF30()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_25B37FF40()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_25B37FF50()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_25B37FF60()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t sub_25B37FF70()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_25B37FF80()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25B37FF90()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_25B37FFA0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_25B37FFB0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_25B37FFC0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25B37FFD0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25B37FFF0()
{
  return MEMORY[0x270F9F208]();
}

uint64_t sub_25B380000()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_25B380010()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_25B380020()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_25B380030()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_25B380040()
{
  return MEMORY[0x270F9F278]();
}

uint64_t sub_25B380050()
{
  return MEMORY[0x270F9F280]();
}

uint64_t sub_25B380060()
{
  return MEMORY[0x270F9F290]();
}

uint64_t sub_25B380070()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_25B380080()
{
  return MEMORY[0x270F9F2E0]();
}

uint64_t sub_25B380090()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_25B3800A0()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_25B3800B0()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_25B3800C0()
{
  return MEMORY[0x270F9F358]();
}

uint64_t sub_25B3800D0()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_25B3800E0()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_25B3800F0()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_25B380100()
{
  return MEMORY[0x270F9F3C0]();
}

uint64_t sub_25B380110()
{
  return MEMORY[0x270F9F3D0]();
}

uint64_t sub_25B380120()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_25B380130()
{
  return MEMORY[0x270F9F418]();
}

uint64_t sub_25B380140()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_25B380150()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_25B380160()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_25B380170()
{
  return MEMORY[0x270F9F498]();
}

uint64_t sub_25B380180()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_25B380190()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25B3801A0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25B3801B0()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_25B3801C0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25B3801F0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25B380200()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25B380210()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25B380220()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25B380230()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t sub_25B380240()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_25B380250()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25B380260()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25B380270()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_25B380280()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_25B380290()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25B3802A0()
{
  return MEMORY[0x270EF27A0]();
}

uint64_t sub_25B3802B0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_25B3802C0()
{
  return MEMORY[0x270F9FD98]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
}

compression_status compression_stream_destroy(compression_stream *stream)
{
  return MEMORY[0x270F98F68](stream);
}

compression_status compression_stream_init(compression_stream *stream, compression_stream_operation operation, compression_algorithm algorithm)
{
  return MEMORY[0x270F98F78](stream, *(void *)&operation, *(void *)&algorithm);
}

compression_status compression_stream_process(compression_stream *stream, int flags)
{
  return MEMORY[0x270F98F80](stream, *(void *)&flags);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x270ED9DC0](path, name, value, size, *(void *)&position, *(void *)&options);
}

ssize_t listxattr(const char *path, char *namebuff, size_t size, int options)
{
  return MEMORY[0x270EDA080](path, namebuff, size, *(void *)&options);
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

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

void objc_storeStrong(id *location, id obj)
{
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

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x270EDB460](path, name, value, size, *(void *)&position, *(void *)&options);
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x270FA2420]();
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

uint64_t swift_getFunctionTypeMetadata1()
{
  return MEMORY[0x270FA0390]();
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

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x270FA0418]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x270FA0420]();
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

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x270FA0470]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
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

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
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

xpc_object_t xpc_fd_create(int fd)
{
  return (xpc_object_t)MEMORY[0x270EDC1C8](*(void *)&fd);
}

int xpc_fd_dup(xpc_object_t xfd)
{
  return MEMORY[0x270EDC1D0](xfd);
}