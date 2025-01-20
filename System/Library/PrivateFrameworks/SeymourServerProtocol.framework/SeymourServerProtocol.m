uint64_t FetchSyncChangesetRequestProtobuf.zoneRequests.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t FetchSyncChangesetRequestProtobuf.zoneRequests.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v1 = a1;
  return result;
}

uint64_t (*FetchSyncChangesetRequestProtobuf.zoneRequests.modify())()
{
  return nullsub_1;
}

uint64_t FetchSyncChangesetRequestProtobuf.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_226A1F798(type metadata accessor for FetchSyncChangesetRequestProtobuf, a1);
}

uint64_t type metadata accessor for FetchSyncChangesetRequestProtobuf(uint64_t a1)
{
  return sub_226A1FDB8(a1, (uint64_t *)&unk_26AD5A708);
}

uint64_t FetchSyncChangesetRequestProtobuf.unknownFields.setter(uint64_t a1)
{
  return sub_226A1F850(a1, type metadata accessor for FetchSyncChangesetRequestProtobuf);
}

uint64_t (*FetchSyncChangesetRequestProtobuf.unknownFields.modify())()
{
  return nullsub_1;
}

uint64_t FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf.zone.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf.zone.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf.zone.modify())()
{
  return nullsub_1;
}

uint64_t FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf.changeWindow.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  sub_226A1F594(v1, *(void *)(v0 + 24));
  return v1;
}

uint64_t sub_226A1F594(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

uint64_t sub_226A1F5F0(uint64_t a1, unint64_t a2)
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

uint64_t (*FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf.changeWindow.modify())()
{
  return nullsub_1;
}

uint64_t FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_226A2038C(type metadata accessor for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf, a1);
}

uint64_t type metadata accessor for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf(uint64_t a1)
{
  return sub_226A1FDB8(a1, (uint64_t *)&unk_26AD5A6F0);
}

uint64_t FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf.unknownFields.setter(uint64_t a1)
{
  return sub_226A20424(a1, type metadata accessor for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf);
}

uint64_t (*FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf.unknownFields.modify())()
{
  return nullsub_1;
}

uint64_t FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf.init()@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0xE000000000000000;
  *(_OWORD *)(a1 + 16) = xmmword_226A483C0;
  type metadata accessor for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf(0);
  return _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
}

uint64_t FetchSyncChangesetRequestProtobuf.init()@<X0>(void *a1@<X8>)
{
  return sub_226A205A0((void (*)(void))type metadata accessor for FetchSyncChangesetRequestProtobuf, a1);
}

uint64_t (*FetchSyncChangesetResponseProtobuf.zoneChangesets.modify())()
{
  return nullsub_1;
}

uint64_t FetchSyncChangesetResponseProtobuf.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_226A1F798(type metadata accessor for FetchSyncChangesetResponseProtobuf, a1);
}

uint64_t sub_226A1F798@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1(0) + 20);
  uint64_t v5 = sub_226A47DC0();
  v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a2, v4, v5);
}

uint64_t type metadata accessor for FetchSyncChangesetResponseProtobuf(uint64_t a1)
{
  return sub_226A1FDB8(a1, qword_26AD5A430);
}

uint64_t FetchSyncChangesetResponseProtobuf.unknownFields.setter(uint64_t a1)
{
  return sub_226A1F850(a1, type metadata accessor for FetchSyncChangesetResponseProtobuf);
}

uint64_t sub_226A1F850(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v4 = v2 + *(int *)(a2(0) + 20);
  uint64_t v5 = sub_226A47DC0();
  v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);

  return v6(v4, a1, v5);
}

uint64_t (*FetchSyncChangesetResponseProtobuf.unknownFields.modify())()
{
  return nullsub_1;
}

uint64_t (*FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.zone.modify())()
{
  return nullsub_1;
}

uint64_t _s21SeymourServerProtocol33FetchSyncChangesetRequestProtobufV04ZonefgH0V12changeWindow10Foundation4DataVvs_0(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_226A1F5F0(*(void *)(v2 + 16), *(void *)(v2 + 24));
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.changeWindow.modify())()
{
  return nullsub_1;
}

uint64_t FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.recordChangeset.getter@<X0>(void *a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD5A6D0);
  MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t SyncChangesetResponse = type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(0);
  sub_226A1FDF0(v1 + *(int *)(SyncChangesetResponse + 28), (uint64_t)v4);
  uint64_t v6 = type metadata accessor for SyncRecordChangesetProtobuf();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48))(v4, 1, v6) != 1) {
    return sub_226A1FE58((uint64_t)v4, (uint64_t)a1);
  }
  uint64_t v7 = MEMORY[0x263F8EE78];
  *a1 = 0;
  a1[1] = v7;
  a1[2] = v7;
  _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
  return sub_226A25428((uint64_t)v4, &qword_26AD5A6D0);
}

uint64_t sub_226A1FAA0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD5A6D0);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t SyncChangesetResponse = type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(0);
  sub_226A1FDF0(a1 + *(int *)(SyncChangesetResponse + 28), (uint64_t)v5);
  uint64_t v7 = type metadata accessor for SyncRecordChangesetProtobuf();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v5, 1, v7) != 1) {
    return sub_226A1FE58((uint64_t)v5, (uint64_t)a2);
  }
  uint64_t v8 = MEMORY[0x263F8EE78];
  *a2 = 0;
  a2[1] = v8;
  a2[2] = v8;
  _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
  return sub_226A25428((uint64_t)v5, &qword_26AD5A6D0);
}

uint64_t sub_226A1FBB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SyncRecordChangesetProtobuf();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_226A2014C(a1, (uint64_t)v7);
  uint64_t v8 = a2 + *(int *)(type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(0) + 28);
  sub_226A25428(v8, &qword_26AD5A6D0);
  sub_226A1FE58((uint64_t)v7, v8);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v5 + 56))(v8, 0, 1, v4);
}

uint64_t FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.recordChangeset.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(0) + 28);
  sub_226A25428(v3, &qword_26AD5A6D0);
  sub_226A1FE58(a1, v3);
  uint64_t v4 = type metadata accessor for SyncRecordChangesetProtobuf();
  uint64_t v5 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(v3, 0, 1, v4);
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

uint64_t type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(uint64_t a1)
{
  return sub_226A1FDB8(a1, (uint64_t *)&unk_26AD5A728);
}

uint64_t sub_226A1FDB8(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_226A1FDF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD5A6D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_226A1FE58(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SyncRecordChangesetProtobuf();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void (*FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.recordChangeset.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  *uint64_t v3 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD5A6D0);
  uint64_t v5 = malloc(*(void *)(*(void *)(v4 - 8) + 64));
  v3[1] = v5;
  uint64_t v6 = type metadata accessor for SyncRecordChangesetProtobuf();
  v3[2] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = v7;
  v3[3] = v7;
  size_t v9 = *(void *)(v7 + 64);
  v3[4] = malloc(v9);
  uint64_t v10 = malloc(v9);
  v3[5] = v10;
  uint64_t v11 = *(int *)(type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(0) + 28);
  *((_DWORD *)v3 + 12) = v11;
  sub_226A1FDF0(v1 + v11, (uint64_t)v5);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v6) == 1)
  {
    uint64_t v12 = MEMORY[0x263F8EE78];
    *uint64_t v10 = 0;
    v10[1] = v12;
    v10[2] = v12;
    _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
    sub_226A25428((uint64_t)v5, &qword_26AD5A6D0);
  }
  else
  {
    sub_226A1FE58((uint64_t)v5, (uint64_t)v10);
  }
  return sub_226A20040;
}

void sub_226A20040(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(int *)(*(void *)a1 + 48);
  uint64_t v4 = *(void **)(*(void *)a1 + 32);
  uint64_t v5 = *(void **)(*(void *)a1 + 40);
  uint64_t v6 = *(void *)(*(void *)a1 + 16);
  uint64_t v7 = *(void *)(*(void *)a1 + 24);
  uint64_t v8 = *(void **)(*(void *)a1 + 8);
  uint64_t v9 = **(void **)a1 + v3;
  if (a2)
  {
    sub_226A2014C(*(void *)(*(void *)a1 + 40), (uint64_t)v4);
    sub_226A25428(v9, &qword_26AD5A6D0);
    sub_226A1FE58((uint64_t)v4, v9);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56))(v9, 0, 1, v6);
    sub_226A201B0((uint64_t)v5);
  }
  else
  {
    sub_226A25428(**(void **)a1 + v3, &qword_26AD5A6D0);
    sub_226A1FE58((uint64_t)v5, v9);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56))(v9, 0, 1, v6);
  }
  free(v5);
  free(v4);
  free(v8);

  free(v2);
}

uint64_t sub_226A2014C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SyncRecordChangesetProtobuf();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_226A201B0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SyncRecordChangesetProtobuf();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

BOOL FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.hasRecordChangeset.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD5A6D0);
  MEMORY[0x270FA5388]();
  uint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t SyncChangesetResponse = type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(0);
  sub_226A1FDF0(v0 + *(int *)(SyncChangesetResponse + 28), (uint64_t)v2);
  uint64_t v4 = type metadata accessor for SyncRecordChangesetProtobuf();
  BOOL v5 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(v2, 1, v4) != 1;
  sub_226A25428((uint64_t)v2, &qword_26AD5A6D0);
  return v5;
}

Swift::Void __swiftcall FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.clearRecordChangeset()()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(0) + 28);
  sub_226A25428(v1, &qword_26AD5A6D0);
  uint64_t v2 = type metadata accessor for SyncRecordChangesetProtobuf();
  uint64_t v3 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  v3(v1, 1, 1, v2);
}

uint64_t FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_226A2038C(type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf, a1);
}

uint64_t sub_226A2038C@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1(0) + 24);
  uint64_t v5 = sub_226A47DC0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a2, v4, v5);
}

uint64_t FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.unknownFields.setter(uint64_t a1)
{
  return sub_226A20424(a1, type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);
}

uint64_t sub_226A20424(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v4 = v2 + *(int *)(a2(0) + 24);
  uint64_t v5 = sub_226A47DC0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);

  return v6(v4, a1, v5);
}

uint64_t (*FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.unknownFields.modify())()
{
  return nullsub_1;
}

uint64_t FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.init()@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0xE000000000000000;
  *(_OWORD *)(a1 + 16) = xmmword_226A483C0;
  uint64_t SyncChangesetResponse = type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(0);
  _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
  uint64_t v3 = a1 + *(int *)(SyncChangesetResponse + 28);
  uint64_t v4 = type metadata accessor for SyncRecordChangesetProtobuf();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(v3, 1, 1, v4);
}

uint64_t FetchSyncChangesetResponseProtobuf.init()@<X0>(void *a1@<X8>)
{
  return sub_226A205A0((void (*)(void))type metadata accessor for FetchSyncChangesetResponseProtobuf, a1);
}

uint64_t sub_226A205A0@<X0>(void (*a1)(void)@<X0>, void *a2@<X8>)
{
  *a2 = MEMORY[0x263F8EE78];
  a1(0);
  return _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
}

unint64_t static FetchSyncChangesetRequestProtobuf.protoMessageName.getter()
{
  return 0xD000000000000021;
}

uint64_t sub_226A20604(uint64_t a1)
{
  return sub_226A2114C(a1, qword_26814BDF8, (uint64_t)"zoneRequests", 12);
}

uint64_t static FetchSyncChangesetRequestProtobuf._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_226A21AE8(&qword_26814BDF0, (uint64_t)qword_26814BDF8, a1);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t FetchSyncChangesetRequestProtobuf.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_226A21328(a1, a2, a3, (void (*)(void))type metadata accessor for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf, &qword_26AD5A6E0, (void (*)(uint64_t))type metadata accessor for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf);
}

uint64_t FetchSyncChangesetRequestProtobuf.traverse<A>(visitor:)()
{
  if (!*(void *)(*(void *)v0 + 16)
    || (type metadata accessor for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf(0),
        sub_226A232BC(&qword_26AD5A6E0, (void (*)(uint64_t))type metadata accessor for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf), uint64_t result = sub_226A47F90(), !v1))
  {
    type metadata accessor for FetchSyncChangesetRequestProtobuf(0);
    return sub_226A47DA0();
  }
  return result;
}

uint64_t static FetchSyncChangesetRequestProtobuf.== infix(_:_:)(char *a1, char *a2)
{
  return sub_226A230F4(a1, a2, sub_226A41134, type metadata accessor for FetchSyncChangesetRequestProtobuf) & 1;
}

uint64_t FetchSyncChangesetRequestProtobuf.hashValue.getter()
{
  return sub_226A22060((void (*)(void))type metadata accessor for FetchSyncChangesetRequestProtobuf, &qword_26814BF30, (void (*)(uint64_t))type metadata accessor for FetchSyncChangesetRequestProtobuf);
}

uint64_t sub_226A2084C@<X0>(void *a1@<X8>)
{
  *a1 = MEMORY[0x263F8EE78];
  return _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
}

unint64_t sub_226A20878()
{
  return 0xD000000000000021;
}

uint64_t (*sub_226A208A0())()
{
  return nullsub_1;
}

uint64_t sub_226A208C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return FetchSyncChangesetRequestProtobuf.decodeMessage<A>(decoder:)(a1, a2, a3);
}

uint64_t sub_226A208DC()
{
  return FetchSyncChangesetRequestProtobuf.traverse<A>(visitor:)();
}

uint64_t sub_226A208F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_226A232BC(&qword_26814BF98, (void (*)(uint64_t))type metadata accessor for FetchSyncChangesetRequestProtobuf);

  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_226A20978@<X0>(uint64_t a1@<X8>)
{
  return sub_226A2234C(&qword_26814BDF0, (uint64_t)qword_26814BDF8, a1);
}

uint64_t sub_226A2099C(uint64_t a1)
{
  uint64_t v2 = sub_226A232BC(&qword_26814BF50, (void (*)(uint64_t))type metadata accessor for FetchSyncChangesetRequestProtobuf);

  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_226A20A0C()
{
  sub_226A232BC(&qword_26814BF50, (void (*)(uint64_t))type metadata accessor for FetchSyncChangesetRequestProtobuf);

  return sub_226A47EE0();
}

uint64_t sub_226A20A8C(char *a1, char *a2)
{
  return sub_226A230F4(a1, a2, sub_226A41134, type metadata accessor for FetchSyncChangesetRequestProtobuf) & 1;
}

unint64_t static FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf.protoMessageName.getter()
{
  return 0xD00000000000003ELL;
}

uint64_t sub_226A20AEC()
{
  uint64_t v0 = sub_226A47FE0();
  __swift_allocate_value_buffer(v0, qword_26814BE18);
  __swift_project_value_buffer(v0, (uint64_t)qword_26814BE18);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26814BFB0);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26814BFB8) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_226A483D0;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *uint64_t v5 = 1;
  *(void *)unint64_t v6 = "zone";
  *(void *)(v6 + 8) = 4;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_226A47FB0();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  uint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)uint64_t v10 = "changeWindow";
  *((void *)v10 + 1) = 12;
  v10[16] = 2;
  v9();
  return sub_226A47FC0();
}

uint64_t static FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_226A21AE8(&qword_26814BE10, (uint64_t)qword_26814BE18, a1);
}

uint64_t FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf.decodeMessage<A>(decoder:)()
{
  uint64_t result = sub_226A47E10();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (result == 2)
      {
        sub_226A47E30();
      }
      else if (result == 1)
      {
        sub_226A47E90();
      }
      uint64_t result = sub_226A47E10();
    }
  }
  return result;
}

uint64_t FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf.traverse<A>(visitor:)()
{
  unint64_t v2 = v0[1];
  uint64_t v3 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) == 0) {
    uint64_t v3 = *v0 & 0xFFFFFFFFFFFFLL;
  }
  if (!v3 || (uint64_t result = sub_226A47F80(), !v1))
  {
    uint64_t v5 = v0[2];
    unint64_t v6 = v0[3];
    switch(v6 >> 62)
    {
      case 1uLL:
        if ((int)v5 != v5 >> 32) {
          goto LABEL_11;
        }
        goto LABEL_12;
      case 2uLL:
        if (*(void *)(v5 + 16) != *(void *)(v5 + 24)) {
          goto LABEL_11;
        }
        goto LABEL_12;
      case 3uLL:
        goto LABEL_12;
      default:
        if ((v6 & 0xFF000000000000) == 0) {
          goto LABEL_12;
        }
LABEL_11:
        uint64_t result = sub_226A47F20();
        if (!v1)
        {
LABEL_12:
          type metadata accessor for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf(0);
          uint64_t result = sub_226A47DA0();
        }
        break;
    }
  }
  return result;
}

uint64_t FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf.hashValue.getter()
{
  return sub_226A22060((void (*)(void))type metadata accessor for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf, &qword_26814BF38, (void (*)(uint64_t))type metadata accessor for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf);
}

uint64_t sub_226A20EE0@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0xE000000000000000;
  *(_OWORD *)(a1 + 16) = xmmword_226A483C0;
  return _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
}

unint64_t sub_226A20F14()
{
  return 0xD00000000000003ELL;
}

uint64_t (*sub_226A20F38())()
{
  return nullsub_1;
}

uint64_t sub_226A20F5C()
{
  return FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf.decodeMessage<A>(decoder:)();
}

uint64_t sub_226A20F74()
{
  return FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf.traverse<A>(visitor:)();
}

uint64_t sub_226A20F8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_226A232BC(&qword_26814BF90, (void (*)(uint64_t))type metadata accessor for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf);

  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_226A21008@<X0>(uint64_t a1@<X8>)
{
  return sub_226A2234C(&qword_26814BE10, (uint64_t)qword_26814BE18, a1);
}

uint64_t sub_226A2102C(uint64_t a1)
{
  uint64_t v2 = sub_226A232BC(&qword_26AD5A6E0, (void (*)(uint64_t))type metadata accessor for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf);

  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_226A21098()
{
  sub_226A232BC(&qword_26AD5A6E0, (void (*)(uint64_t))type metadata accessor for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf);

  return sub_226A47EE0();
}

unint64_t static FetchSyncChangesetResponseProtobuf.protoMessageName.getter()
{
  return 0xD000000000000022;
}

uint64_t sub_226A21134(uint64_t a1)
{
  return sub_226A2114C(a1, qword_26814BE38, (uint64_t)"zoneChangesets", 14);
}

uint64_t sub_226A2114C(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = sub_226A47FE0();
  __swift_allocate_value_buffer(v7, a2);
  __swift_project_value_buffer(v7, (uint64_t)a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26814BFB0);
  uint64_t v8 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26814BFB8) - 8);
  unint64_t v9 = (*(unsigned __int8 *)(*(void *)v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v8 + 80);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_226A483E0;
  unint64_t v11 = v10 + v9 + v8[14];
  *(void *)(v10 + v9) = 1;
  *(void *)unint64_t v11 = a3;
  *(void *)(v11 + 8) = a4;
  *(unsigned char *)(v11 + 16) = 2;
  uint64_t v12 = *MEMORY[0x263F50718];
  uint64_t v13 = sub_226A47FB0();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 104))(v11, v12, v13);
  return sub_226A47FC0();
}

uint64_t static FetchSyncChangesetResponseProtobuf._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_226A21AE8(&qword_26814BE30, (uint64_t)qword_26814BE38, a1);
}

uint64_t FetchSyncChangesetResponseProtobuf.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_226A21328(a1, a2, a3, (void (*)(void))type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf, &qword_26AD5A718, (void (*)(uint64_t))type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);
}

uint64_t sub_226A21328(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void), unint64_t *a5, void (*a6)(uint64_t))
{
  uint64_t result = sub_226A47E10();
  if (!v6)
  {
    while ((v10 & 1) == 0)
    {
      if (result == 1)
      {
        a4(0);
        sub_226A232BC(a5, a6);
        sub_226A47EA0();
      }
      uint64_t result = sub_226A47E10();
    }
  }
  return result;
}

uint64_t FetchSyncChangesetResponseProtobuf.traverse<A>(visitor:)()
{
  if (!*(void *)(*(void *)v0 + 16)
    || (type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(0),
        sub_226A232BC(&qword_26AD5A718, (void (*)(uint64_t))type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf), uint64_t result = sub_226A47F90(), !v1))
  {
    type metadata accessor for FetchSyncChangesetResponseProtobuf(0);
    return sub_226A47DA0();
  }
  return result;
}

uint64_t static FetchSyncChangesetResponseProtobuf.== infix(_:_:)(char *a1, char *a2)
{
  return sub_226A230F4(a1, a2, sub_226A404D0, type metadata accessor for FetchSyncChangesetResponseProtobuf) & 1;
}

uint64_t FetchSyncChangesetResponseProtobuf.hashValue.getter()
{
  return sub_226A22060((void (*)(void))type metadata accessor for FetchSyncChangesetResponseProtobuf, &qword_26814BF40, (void (*)(uint64_t))type metadata accessor for FetchSyncChangesetResponseProtobuf);
}

unint64_t sub_226A215AC()
{
  return 0xD000000000000022;
}

uint64_t sub_226A215C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 20);
  uint64_t v5 = sub_226A47DC0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a2, v4, v5);
}

uint64_t sub_226A21638(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + *(int *)(a2 + 20);
  uint64_t v5 = sub_226A47DC0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);

  return v6(v4, a1, v5);
}

uint64_t sub_226A216A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return FetchSyncChangesetResponseProtobuf.decodeMessage<A>(decoder:)(a1, a2, a3);
}

uint64_t sub_226A216C0()
{
  return FetchSyncChangesetResponseProtobuf.traverse<A>(visitor:)();
}

uint64_t sub_226A216D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_226A232BC(&qword_26814BF88, (void (*)(uint64_t))type metadata accessor for FetchSyncChangesetResponseProtobuf);

  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_226A21754@<X0>(uint64_t a1@<X8>)
{
  return sub_226A2234C(&qword_26814BE30, (uint64_t)qword_26814BE38, a1);
}

uint64_t sub_226A21778(uint64_t a1)
{
  uint64_t v2 = sub_226A232BC(&qword_26814BF68, (void (*)(uint64_t))type metadata accessor for FetchSyncChangesetResponseProtobuf);

  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_226A217E4()
{
  sub_226A232BC(&qword_26814BF68, (void (*)(uint64_t))type metadata accessor for FetchSyncChangesetResponseProtobuf);

  return sub_226A47EE0();
}

uint64_t sub_226A21860(char *a1, char *a2)
{
  return sub_226A230F4(a1, a2, sub_226A404D0, type metadata accessor for FetchSyncChangesetResponseProtobuf) & 1;
}

unint64_t static FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.protoMessageName.getter()
{
  return 0xD000000000000038;
}

uint64_t sub_226A218C0()
{
  uint64_t v0 = sub_226A47FE0();
  __swift_allocate_value_buffer(v0, qword_26814BE58);
  __swift_project_value_buffer(v0, (uint64_t)qword_26814BE58);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26814BFB0);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26814BFB8) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_226A483F0;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *uint64_t v5 = 1;
  *(void *)unint64_t v6 = "zone";
  *(void *)(v6 + 8) = 4;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_226A47FB0();
  unint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  char v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)char v10 = "changeWindow";
  *((void *)v10 + 1) = 12;
  v10[16] = 2;
  v9();
  uint64_t v11 = (uint64_t)v5 + 2 * v2 + v1[14];
  *(void *)((char *)v5 + 2 * v2) = 3;
  *(void *)uint64_t v11 = "recordChangeset";
  *(void *)(v11 + 8) = 15;
  *(unsigned char *)(v11 + 16) = 2;
  v9();
  return sub_226A47FC0();
}

uint64_t static FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_226A21AE8(&qword_26814BE50, (uint64_t)qword_26814BE58, a1);
}

uint64_t sub_226A21AE8@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_226A47FE0();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v7(a3, v6, v5);
}

uint64_t FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.decodeMessage<A>(decoder:)()
{
  uint64_t result = sub_226A47E10();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 3:
          sub_226A21C48();
          break;
        case 2:
          sub_226A47E30();
          break;
        case 1:
          sub_226A47E90();
          break;
      }
      uint64_t result = sub_226A47E10();
    }
  }
  return result;
}

uint64_t sub_226A21C48()
{
  return sub_226A47EB0();
}

uint64_t FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.traverse<A>(visitor:)()
{
  unint64_t v2 = v0[1];
  uint64_t v3 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) == 0) {
    uint64_t v3 = *v0 & 0xFFFFFFFFFFFFLL;
  }
  if (!v3 || (uint64_t result = sub_226A47F80(), !v1))
  {
    uint64_t v5 = v0[2];
    unint64_t v6 = v0[3];
    switch(v6 >> 62)
    {
      case 1uLL:
        if ((int)v5 != v5 >> 32) {
          goto LABEL_11;
        }
        goto LABEL_12;
      case 2uLL:
        if (*(void *)(v5 + 16) != *(void *)(v5 + 24)) {
          goto LABEL_11;
        }
        goto LABEL_12;
      case 3uLL:
        goto LABEL_12;
      default:
        if ((v6 & 0xFF000000000000) == 0) {
          goto LABEL_12;
        }
LABEL_11:
        uint64_t result = sub_226A47F20();
        if (!v1)
        {
LABEL_12:
          uint64_t result = sub_226A21E40((uint64_t)v0);
          if (!v1)
          {
            type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(0);
            uint64_t result = sub_226A47DA0();
          }
        }
        break;
    }
  }
  return result;
}

uint64_t sub_226A21E40(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD5A6D0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for SyncRecordChangesetProtobuf();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t SyncChangesetResponse = type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(0);
  sub_226A1FDF0(a1 + *(int *)(SyncChangesetResponse + 28), (uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1) {
    return sub_226A25428((uint64_t)v4, &qword_26AD5A6D0);
  }
  sub_226A1FE58((uint64_t)v4, (uint64_t)v8);
  sub_226A232BC(&qword_26AD5A6B0, (void (*)(uint64_t))type metadata accessor for SyncRecordChangesetProtobuf);
  sub_226A47FA0();
  return sub_226A201B0((uint64_t)v8);
}

uint64_t FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.hashValue.getter()
{
  return sub_226A22060((void (*)(void))type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf, &qword_26814BF48, (void (*)(uint64_t))type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);
}

uint64_t sub_226A22060(void (*a1)(void), unint64_t *a2, void (*a3)(uint64_t))
{
  return sub_226A48130();
}

uint64_t sub_226A220E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0xE000000000000000;
  *(_OWORD *)(a2 + 16) = xmmword_226A483C0;
  _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
  uint64_t v4 = a2 + *(int *)(a1 + 28);
  uint64_t v5 = type metadata accessor for SyncRecordChangesetProtobuf();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);

  return v6(v4, 1, 1, v5);
}

unint64_t sub_226A22180()
{
  return 0xD000000000000038;
}

uint64_t sub_226A2219C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 24);
  uint64_t v5 = sub_226A47DC0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a2, v4, v5);
}

uint64_t sub_226A2220C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + *(int *)(a2 + 24);
  uint64_t v5 = sub_226A47DC0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);

  return v6(v4, a1, v5);
}

uint64_t sub_226A2227C()
{
  return FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.decodeMessage<A>(decoder:)();
}

uint64_t sub_226A22294()
{
  return FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.traverse<A>(visitor:)();
}

uint64_t sub_226A222AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_226A232BC(&qword_26814BF80, (void (*)(uint64_t))type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);

  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_226A22328@<X0>(uint64_t a1@<X8>)
{
  return sub_226A2234C(&qword_26814BE50, (uint64_t)qword_26814BE58, a1);
}

uint64_t sub_226A2234C@<X0>(void *a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_226A47FE0();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v7(a3, v6, v5);
}

uint64_t sub_226A223E8(uint64_t a1)
{
  uint64_t v2 = sub_226A232BC(&qword_26AD5A718, (void (*)(uint64_t))type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);

  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_226A22454()
{
  return sub_226A48130();
}

uint64_t sub_226A224AC()
{
  sub_226A232BC(&qword_26AD5A718, (void (*)(uint64_t))type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);

  return sub_226A47EE0();
}

uint64_t sub_226A22528()
{
  return sub_226A48130();
}

uint64_t sub_226A22580@<X0>(uint64_t __s1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, char *a4@<X8>)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v7 = (const void *)__s1;
  switch(a3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = (a2 >> 32) - (int)a2;
      if (a2 >> 32 < (int)a2)
      {
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
      sub_226A1F594(a2, a3);
      char v10 = (char *)sub_226A47C50();
      if (!v10) {
        goto LABEL_8;
      }
      uint64_t v11 = sub_226A47C70();
      if (__OFSUB__((int)a2, v11)) {
LABEL_33:
      }
        __break(1u);
      v10 += (int)a2 - v11;
LABEL_8:
      uint64_t v12 = sub_226A47C60();
      if (v12 >= v9) {
        size_t v13 = (a2 >> 32) - (int)a2;
      }
      else {
        size_t v13 = v12;
      }
      if (!v7)
      {
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
        JUMPOUT(0x226A227E4);
      }
      if (!v10) {
        goto LABEL_36;
      }
      int v14 = memcmp(v7, v10, v13);
      __s1 = sub_226A1F5F0(a2, a3);
      BOOL v8 = v14 == 0;
LABEL_24:
      char v24 = v8;
LABEL_29:
      *a4 = v24;
      return __s1;
    case 2uLL:
      uint64_t v15 = *(void *)(a2 + 16);
      uint64_t v16 = *(void *)(a2 + 24);
      swift_retain();
      swift_retain();
      v17 = (char *)sub_226A47C50();
      if (!v17) {
        goto LABEL_17;
      }
      uint64_t v18 = sub_226A47C70();
      if (__OFSUB__(v15, v18)) {
        goto LABEL_32;
      }
      v17 += v15 - v18;
LABEL_17:
      BOOL v19 = __OFSUB__(v16, v15);
      int64_t v20 = v16 - v15;
      if (v19) {
        goto LABEL_31;
      }
      uint64_t v21 = sub_226A47C60();
      if (v21 >= v20) {
        size_t v22 = v20;
      }
      else {
        size_t v22 = v21;
      }
      if (!v7) {
        goto LABEL_37;
      }
      if (!v17) {
        goto LABEL_38;
      }
      int v23 = memcmp(v7, v17, v22);
      swift_release();
      __s1 = swift_release();
      BOOL v8 = v23 == 0;
      goto LABEL_24;
    case 3uLL:
      if (!__s1) {
        goto LABEL_39;
      }
      char v24 = 1;
      goto LABEL_29;
    default:
      uint64_t __s2 = a2;
      __int16 v26 = a3;
      char v27 = BYTE2(a3);
      char v28 = BYTE3(a3);
      char v29 = BYTE4(a3);
      char v30 = BYTE5(a3);
      if (__s1)
      {
        __s1 = memcmp((const void *)__s1, &__s2, BYTE6(a3));
        BOOL v8 = __s1 == 0;
        goto LABEL_24;
      }
      __break(1u);
      goto LABEL_35;
  }
}

uint64_t sub_226A227F4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t __s1 = a1;
  __int16 v9 = a2;
  char v10 = BYTE2(a2);
  char v11 = BYTE3(a2);
  char v12 = BYTE4(a2);
  char v13 = BYTE5(a2);
  sub_226A22580((uint64_t)&__s1, a3, a4, &v7);
  if (!v4) {
    char v5 = v7;
  }
  return v5 & 1;
}

uint64_t sub_226A228CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t result = sub_226A47C50();
  uint64_t v11 = result;
  if (result)
  {
    uint64_t result = sub_226A47C70();
    if (__OFSUB__(a1, result))
    {
LABEL_9:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  sub_226A47C60();
  sub_226A22580(v11, a4, a5, &v13);
  if (!v5) {
    char v12 = v13;
  }
  return v12 & 1;
}

uint64_t sub_226A22984(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v8) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
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
        JUMPOUT(0x226A22BECLL);
      }
      uint64_t v8 = (int)v8;
LABEL_6:
      switch(a4 >> 62)
      {
        case 1uLL:
          LODWORD(v12) = HIDWORD(a3) - a3;
          if (__OFSUB__(HIDWORD(a3), a3)) {
            goto LABEL_27;
          }
          uint64_t v12 = (int)v12;
LABEL_11:
          if (v8 == v12)
          {
            if (v8 < 1)
            {
              char v17 = 1;
            }
            else
            {
              switch(a2 >> 62)
              {
                case 1uLL:
                  if (a1 >> 32 < (int)a1) {
                    goto LABEL_29;
                  }
                  sub_226A1F594(a3, a4);
                  sub_226A1F594(a1, a2);
                  char v17 = sub_226A228CC((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, a3, a4);
                  sub_226A1F5F0(a3, a4);
                  uint64_t v18 = a1;
                  unint64_t v19 = a2;
                  break;
                case 2uLL:
                  uint64_t v20 = a2 & 0x3FFFFFFFFFFFFFFFLL;
                  uint64_t v21 = *(void *)(a1 + 16);
                  uint64_t v22 = *(void *)(a1 + 24);
                  sub_226A1F594(a3, a4);
                  swift_retain();
                  swift_retain();
                  char v17 = sub_226A228CC(v21, v22, v20, a3, a4);
                  sub_226A1F5F0(a3, a4);
                  swift_release();
                  swift_release();
                  return v17 & 1;
                case 3uLL:
                  sub_226A1F594(a3, a4);
                  uint64_t v16 = 0;
                  uint64_t v15 = 0;
                  goto LABEL_22;
                default:
                  sub_226A1F594(a3, a4);
                  uint64_t v15 = a2 & 0xFFFFFFFFFFFFFFLL;
                  uint64_t v16 = a1;
LABEL_22:
                  char v17 = sub_226A227F4(v16, v15, a3, a4);
                  uint64_t v18 = a3;
                  unint64_t v19 = a4;
                  break;
              }
              sub_226A1F5F0(v18, v19);
            }
          }
          else
          {
            char v17 = 0;
          }
          return v17 & 1;
        case 2uLL:
          uint64_t v14 = *(void *)(a3 + 16);
          uint64_t v13 = *(void *)(a3 + 24);
          BOOL v11 = __OFSUB__(v13, v14);
          uint64_t v12 = v13 - v14;
          if (!v11) {
            goto LABEL_11;
          }
          goto LABEL_28;
        case 3uLL:
          char v17 = v8 == 0;
          return v17 & 1;
        default:
          uint64_t v12 = BYTE6(a4);
          goto LABEL_11;
      }
    case 2uLL:
      uint64_t v10 = *(void *)(a1 + 16);
      uint64_t v9 = *(void *)(a1 + 24);
      BOOL v11 = __OFSUB__(v9, v10);
      uint64_t v8 = v9 - v10;
      if (!v11) {
        goto LABEL_6;
      }
      goto LABEL_26;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v8 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t _s21SeymourServerProtocol34FetchSyncChangesetResponseProtobufV04ZonefH0V2eeoiySbAE_AEtFZ_0(void *a1, void *a2)
{
  uint64_t v4 = sub_226A47DC0();
  uint64_t v43 = *(void *)(v4 - 8);
  uint64_t v44 = v4;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  v42 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  v41 = (char *)&v39 - v7;
  uint64_t v8 = type metadata accessor for SyncRecordChangesetProtobuf();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v40 = (uint64_t)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26814BFA0);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD5A6D0);
  uint64_t v15 = MEMORY[0x270FA5388](v14 - 8);
  char v17 = (char *)&v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  uint64_t v20 = (char *)&v39 - v19;
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v39 - v21;
  if (*a1 == *a2 && a1[1] == a2[1] || (char v23 = 0, (sub_226A48090() & 1) != 0))
  {
    if (sub_226A22984(a1[2], a1[3], a2[2], a2[3]))
    {
      uint64_t SyncChangesetResponse = type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(0);
      sub_226A1FDF0((uint64_t)a1 + *(int *)(SyncChangesetResponse + 28), (uint64_t)v22);
      uint64_t v39 = SyncChangesetResponse;
      sub_226A1FDF0((uint64_t)a2 + *(int *)(SyncChangesetResponse + 28), (uint64_t)v20);
      uint64_t v25 = (uint64_t)&v13[*(int *)(v11 + 48)];
      sub_226A1FDF0((uint64_t)v22, (uint64_t)v13);
      sub_226A1FDF0((uint64_t)v20, v25);
      __int16 v26 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
      if (v26((uint64_t)v13, 1, v8) == 1)
      {
        sub_226A25428((uint64_t)v20, &qword_26AD5A6D0);
        sub_226A25428((uint64_t)v22, &qword_26AD5A6D0);
        if (v26(v25, 1, v8) == 1)
        {
          sub_226A25428((uint64_t)v13, &qword_26AD5A6D0);
LABEL_14:
          uint64_t v30 = v39;
          uint64_t v31 = (char *)a1 + *(int *)(v39 + 24);
          uint64_t v33 = v43;
          uint64_t v32 = v44;
          v34 = *(void (**)(char *, char *, uint64_t))(v43 + 16);
          v35 = v41;
          v34(v41, v31, v44);
          v36 = (char *)a2 + *(int *)(v30 + 24);
          v37 = v42;
          v34(v42, v36, v32);
          sub_226A232BC(&qword_26814BFA8, MEMORY[0x263F50560]);
          char v23 = sub_226A48010();
          v38 = *(void (**)(char *, uint64_t))(v33 + 8);
          v38(v37, v32);
          v38(v35, v32);
          return v23 & 1;
        }
      }
      else
      {
        sub_226A1FDF0((uint64_t)v13, (uint64_t)v17);
        if (v26(v25, 1, v8) != 1)
        {
          uint64_t v28 = v40;
          sub_226A1FE58(v25, v40);
          char v29 = static SyncRecordChangesetProtobuf.== infix(_:_:)(v17, v28);
          sub_226A201B0(v28);
          sub_226A25428((uint64_t)v20, &qword_26AD5A6D0);
          sub_226A25428((uint64_t)v22, &qword_26AD5A6D0);
          sub_226A201B0((uint64_t)v17);
          sub_226A25428((uint64_t)v13, &qword_26AD5A6D0);
          if (v29) {
            goto LABEL_14;
          }
          goto LABEL_11;
        }
        sub_226A25428((uint64_t)v20, &qword_26AD5A6D0);
        sub_226A25428((uint64_t)v22, &qword_26AD5A6D0);
        sub_226A201B0((uint64_t)v17);
      }
      sub_226A25428((uint64_t)v13, &qword_26814BFA0);
    }
LABEL_11:
    char v23 = 0;
  }
  return v23 & 1;
}

uint64_t sub_226A230F4(char *a1, char *a2, uint64_t (*a3)(void, void), uint64_t (*a4)(void))
{
  uint64_t v8 = sub_226A47DC0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v20 - v13;
  if (a3(*(void *)a1, *(void *)a2))
  {
    uint64_t v15 = a4(0);
    uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
    v16(v14, &a1[*(int *)(v15 + 20)], v8);
    v16(v12, &a2[*(int *)(v15 + 20)], v8);
    sub_226A232BC(&qword_26814BFA8, MEMORY[0x263F50560]);
    char v17 = sub_226A48010();
    uint64_t v18 = *(void (**)(char *, uint64_t))(v9 + 8);
    v18(v12, v8);
    v18(v14, v8);
  }
  else
  {
    char v17 = 0;
  }
  return v17 & 1;
}

uint64_t sub_226A232BC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t _s21SeymourServerProtocol33FetchSyncChangesetRequestProtobufV04ZonefgH0V2eeoiySbAE_AEtFZ_0(char *a1, char *a2)
{
  uint64_t v4 = sub_226A47DC0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v17 - v9;
  BOOL v11 = *(void *)a1 == *(void *)a2 && *((void *)a1 + 1) == *((void *)a2 + 1);
  if (v11 || (char v12 = 0, (sub_226A48090() & 1) != 0))
  {
    if (sub_226A22984(*((void *)a1 + 2), *((void *)a1 + 3), *((void *)a2 + 2), *((void *)a2 + 3)))
    {
      uint64_t SyncChangesetRequest = type metadata accessor for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf(0);
      uint64_t v14 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
      v14(v10, &a1[*(int *)(SyncChangesetRequest + 24)], v4);
      v14(v8, &a2[*(int *)(SyncChangesetRequest + 24)], v4);
      sub_226A232BC(&qword_26814BFA8, MEMORY[0x263F50560]);
      char v12 = sub_226A48010();
      uint64_t v15 = *(void (**)(char *, uint64_t))(v5 + 8);
      v15(v8, v4);
      v15(v10, v4);
    }
    else
    {
      char v12 = 0;
    }
  }
  return v12 & 1;
}

uint64_t sub_226A234E0()
{
  return sub_226A232BC(&qword_26AD5A700, (void (*)(uint64_t))type metadata accessor for FetchSyncChangesetRequestProtobuf);
}

uint64_t sub_226A23528()
{
  return sub_226A232BC(&qword_26814BF50, (void (*)(uint64_t))type metadata accessor for FetchSyncChangesetRequestProtobuf);
}

uint64_t sub_226A23570()
{
  return sub_226A232BC(&qword_26814BF30, (void (*)(uint64_t))type metadata accessor for FetchSyncChangesetRequestProtobuf);
}

uint64_t sub_226A235B8()
{
  return sub_226A232BC(&qword_26814BF58, (void (*)(uint64_t))type metadata accessor for FetchSyncChangesetRequestProtobuf);
}

uint64_t sub_226A23600()
{
  return sub_226A232BC(&qword_26AD5A6E8, (void (*)(uint64_t))type metadata accessor for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf);
}

uint64_t sub_226A23648()
{
  return sub_226A232BC(&qword_26AD5A6E0, (void (*)(uint64_t))type metadata accessor for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf);
}

uint64_t sub_226A23690()
{
  return sub_226A232BC(&qword_26814BF38, (void (*)(uint64_t))type metadata accessor for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf);
}

uint64_t sub_226A236D8()
{
  return sub_226A232BC(&qword_26814BF60, (void (*)(uint64_t))type metadata accessor for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf);
}

uint64_t sub_226A23720()
{
  return sub_226A232BC(&qword_26AD5A738, (void (*)(uint64_t))type metadata accessor for FetchSyncChangesetResponseProtobuf);
}

uint64_t sub_226A23768()
{
  return sub_226A232BC(&qword_26814BF68, (void (*)(uint64_t))type metadata accessor for FetchSyncChangesetResponseProtobuf);
}

uint64_t sub_226A237B0()
{
  return sub_226A232BC(&qword_26814BF40, (void (*)(uint64_t))type metadata accessor for FetchSyncChangesetResponseProtobuf);
}

uint64_t sub_226A237F8()
{
  return sub_226A232BC(&qword_26814BF70, (void (*)(uint64_t))type metadata accessor for FetchSyncChangesetResponseProtobuf);
}

uint64_t sub_226A23840()
{
  return sub_226A232BC(&qword_26AD5A720, (void (*)(uint64_t))type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);
}

uint64_t sub_226A23888()
{
  return sub_226A232BC(&qword_26AD5A718, (void (*)(uint64_t))type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);
}

uint64_t sub_226A238D0()
{
  return sub_226A232BC(&qword_26814BF48, (void (*)(uint64_t))type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);
}

uint64_t sub_226A23918()
{
  return sub_226A232BC(&qword_26814BF78, (void (*)(uint64_t))type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);
}

uint64_t getEnumTagSinglePayload for FetchSyncChangesetRequestProtobuf(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm);
}

uint64_t storeEnumTagSinglePayload for FetchSyncChangesetRequestProtobuf(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm);
}

uint64_t *initializeBufferWithCopyOfBuffer for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a2[2];
    unint64_t v9 = a2[3];
    swift_bridgeObjectRetain();
    sub_226A1F594(v8, v9);
    a1[2] = v8;
    a1[3] = v9;
    uint64_t v10 = *(int *)(a3 + 24);
    BOOL v11 = (char *)a1 + v10;
    char v12 = (char *)a2 + v10;
    uint64_t v13 = sub_226A47DC0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
  }
  return a1;
}

uint64_t destroy for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  sub_226A1F5F0(*(void *)(a1 + 16), *(void *)(a1 + 24));
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_226A47DC0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

void *initializeWithCopy for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a2[2];
  unint64_t v8 = a2[3];
  swift_bridgeObjectRetain();
  sub_226A1F594(v7, v8);
  a1[2] = v7;
  a1[3] = v8;
  uint64_t v9 = *(int *)(a3 + 24);
  uint64_t v10 = (char *)a1 + v9;
  BOOL v11 = (char *)a2 + v9;
  uint64_t v12 = sub_226A47DC0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
  return a1;
}

void *assignWithCopy for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[2];
  unint64_t v7 = a2[3];
  sub_226A1F594(v6, v7);
  uint64_t v8 = a1[2];
  unint64_t v9 = a1[3];
  a1[2] = v6;
  a1[3] = v7;
  sub_226A1F5F0(v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  BOOL v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_226A47DC0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  return a1;
}

_OWORD *initializeWithTake for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 24);
  uint64_t v6 = (char *)a1 + v5;
  unint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_226A47DC0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

void *assignWithTake for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a1[2];
  unint64_t v8 = a1[3];
  *((_OWORD *)a1 + 1) = *(_OWORD *)(a2 + 16);
  sub_226A1F5F0(v7, v8);
  uint64_t v9 = *(int *)(a3 + 24);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_226A47DC0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 40))(v10, v11, v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_226A23DB0);
}

uint64_t sub_226A23DB0(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_226A47DC0();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_226A23E74);
}

uint64_t sub_226A23E74(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_226A47DC0();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 24);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_226A23F1C()
{
  uint64_t result = sub_226A47DC0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for SubmitScoresRequestProtobuf(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = sub_226A47DC0();
    uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v5;
}

uint64_t destroy for SubmitScoresRequestProtobuf(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_226A47DC0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

void *initializeWithCopy for SubmitScoresRequestProtobuf(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_226A47DC0();
  uint64_t v8 = *(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16);
  swift_bridgeObjectRetain();
  v8(v5, v6, v7);
  return a1;
}

void *assignWithCopy for SubmitScoresRequestProtobuf(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_226A47DC0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

void *initializeWithTake for SubmitScoresRequestProtobuf(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_226A47DC0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void *assignWithTake for SubmitScoresRequestProtobuf(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_226A47DC0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for FetchSyncChangesetResponseProtobuf(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_226A24360);
}

uint64_t __swift_get_extra_inhabitant_indexTm(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_226A47DC0();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for FetchSyncChangesetResponseProtobuf(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_226A24428);
}

void *__swift_store_extra_inhabitant_indexTm(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_226A47DC0();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_226A244D4()
{
  uint64_t result = sub_226A47DC0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v21 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a2[2];
    unint64_t v9 = a2[3];
    swift_bridgeObjectRetain();
    sub_226A1F594(v8, v9);
    a1[2] = v8;
    a1[3] = v9;
    uint64_t v10 = *(int *)(a3 + 24);
    uint64_t v11 = (char *)a1 + v10;
    uint64_t v12 = (char *)a2 + v10;
    uint64_t v13 = sub_226A47DC0();
    uint64_t v14 = *(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16);
    v14(v11, v12, v13);
    uint64_t v15 = *(int *)(a3 + 28);
    uint64_t v16 = (uint64_t *)((char *)a1 + v15);
    uint64_t v17 = (uint64_t *)((char *)a2 + v15);
    uint64_t v18 = type metadata accessor for SyncRecordChangesetProtobuf();
    uint64_t v19 = *(void *)(v18 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18))
    {
      uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD5A6D0);
      memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
    }
    else
    {
      uint64_t v22 = v17[1];
      *uint64_t v16 = *v17;
      v16[1] = v22;
      v16[2] = v17[2];
      uint64_t v23 = *(int *)(v18 + 28);
      char v24 = (char *)v16 + v23;
      uint64_t v25 = (char *)v17 + v23;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v14(v24, v25, v13);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
    }
  }
  return a1;
}

uint64_t destroy for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  sub_226A1F5F0(*(void *)(a1 + 16), *(void *)(a1 + 24));
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_226A47DC0();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  v10(v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 28);
  uint64_t v7 = type metadata accessor for SyncRecordChangesetProtobuf();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v6, 1, v7);
  if (!result)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v9 = v6 + *(int *)(v7 + 28);
    return ((uint64_t (*)(uint64_t, uint64_t))v10)(v9, v5);
  }
  return result;
}

void *initializeWithCopy for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a2[2];
  unint64_t v8 = a2[3];
  swift_bridgeObjectRetain();
  sub_226A1F594(v7, v8);
  a1[2] = v7;
  a1[3] = v8;
  uint64_t v9 = *(int *)(a3 + 24);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_226A47DC0();
  uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
  v13(v10, v11, v12);
  uint64_t v14 = *(int *)(a3 + 28);
  uint64_t v15 = (void *)((char *)a1 + v14);
  uint64_t v16 = (void *)((char *)a2 + v14);
  uint64_t v17 = type metadata accessor for SyncRecordChangesetProtobuf();
  uint64_t v18 = *(void *)(v17 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
  {
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD5A6D0);
    memcpy(v15, v16, *(void *)(*(void *)(v19 - 8) + 64));
  }
  else
  {
    uint64_t v20 = v16[1];
    *uint64_t v15 = *v16;
    v15[1] = v20;
    v15[2] = v16[2];
    uint64_t v21 = *(int *)(v17 + 28);
    uint64_t v22 = (char *)v15 + v21;
    uint64_t v23 = (char *)v16 + v21;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(v22, v23, v12);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  }
  return a1;
}

void *assignWithCopy for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[2];
  unint64_t v7 = a2[3];
  sub_226A1F594(v6, v7);
  uint64_t v8 = a1[2];
  unint64_t v9 = a1[3];
  a1[2] = v6;
  a1[3] = v7;
  sub_226A1F5F0(v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_226A47DC0();
  uint64_t v28 = *(void *)(v13 - 8);
  uint64_t v29 = v13;
  uint64_t v14 = *(void (**)(char *, char *))(v28 + 24);
  v14(v11, v12);
  uint64_t v15 = *(int *)(a3 + 28);
  uint64_t v16 = (void *)((char *)a1 + v15);
  uint64_t v17 = (void *)((char *)a2 + v15);
  uint64_t v18 = type metadata accessor for SyncRecordChangesetProtobuf();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v19 + 48);
  LODWORD(v12) = v20(v16, 1, v18);
  int v21 = v20(v17, 1, v18);
  if (!v12)
  {
    if (!v21)
    {
      *uint64_t v16 = *v17;
      v16[1] = v17[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v16[2] = v17[2];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      ((void (*)(char *, char *, uint64_t))v14)((char *)v16 + *(int *)(v18 + 28), (char *)v17 + *(int *)(v18 + 28), v29);
      return a1;
    }
    sub_226A201B0((uint64_t)v16);
    goto LABEL_6;
  }
  if (v21)
  {
LABEL_6:
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD5A6D0);
    memcpy(v16, v17, *(void *)(*(void *)(v26 - 8) + 64));
    return a1;
  }
  *uint64_t v16 = *v17;
  v16[1] = v17[1];
  v16[2] = v17[2];
  uint64_t v22 = *(int *)(v18 + 28);
  uint64_t v23 = (char *)v16 + v22;
  char v24 = (char *)v17 + v22;
  uint64_t v25 = *(void (**)(char *, char *, uint64_t))(v28 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v25(v23, v24, v29);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
  return a1;
}

_OWORD *initializeWithTake for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = (char *)a1 + v7;
  unint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_226A47DC0();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32);
  v11(v8, v9, v10);
  uint64_t v12 = *(int *)(a3 + 28);
  uint64_t v13 = (void *)((char *)a1 + v12);
  uint64_t v14 = (void *)((char *)a2 + v12);
  uint64_t v15 = type metadata accessor for SyncRecordChangesetProtobuf();
  uint64_t v16 = *(void *)(v15 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
  {
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD5A6D0);
    memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    *(_OWORD *)uint64_t v13 = *(_OWORD *)v14;
    v13[2] = v14[2];
    v11((char *)v13 + *(int *)(v15 + 28), (char *)v14 + *(int *)(v15 + 28), v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  }
  return a1;
}

void *assignWithTake for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a1[2];
  unint64_t v8 = a1[3];
  *((_OWORD *)a1 + 1) = *(_OWORD *)(a2 + 16);
  sub_226A1F5F0(v7, v8);
  uint64_t v9 = *(int *)(a3 + 24);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_226A47DC0();
  uint64_t v23 = *(void *)(v12 - 8);
  uint64_t v24 = v12;
  uint64_t v13 = *(void (**)(char *, uint64_t))(v23 + 40);
  v13(v10, v11);
  uint64_t v14 = *(int *)(a3 + 28);
  uint64_t v15 = (void *)((char *)a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  uint64_t v17 = type metadata accessor for SyncRecordChangesetProtobuf();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v18 + 48);
  LODWORD(v11) = v19(v15, 1, v17);
  int v20 = v19(v16, 1, v17);
  if (!v11)
  {
    if (!v20)
    {
      *uint64_t v15 = *v16;
      v15[1] = v16[1];
      swift_bridgeObjectRelease();
      v15[2] = v16[2];
      swift_bridgeObjectRelease();
      ((void (*)(char *, char *, uint64_t))v13)((char *)v15 + *(int *)(v17 + 28), (char *)v16 + *(int *)(v17 + 28), v24);
      return a1;
    }
    sub_226A201B0((uint64_t)v15);
    goto LABEL_6;
  }
  if (v20)
  {
LABEL_6:
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD5A6D0);
    memcpy(v15, v16, *(void *)(*(void *)(v21 - 8) + 64));
    return a1;
  }
  *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
  v15[2] = v16[2];
  (*(void (**)(char *, char *, uint64_t))(v23 + 32))((char *)v15 + *(int *)(v17 + 28), (char *)v16 + *(int *)(v17 + 28), v24);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  return a1;
}

uint64_t getEnumTagSinglePayload for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_226A25080);
}

uint64_t sub_226A25080(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_226A47DC0();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = a1 + *(int *)(a3 + 24);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD5A6D0);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = a1 + *(int *)(a3 + 28);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t storeEnumTagSinglePayload for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_226A251C4);
}

uint64_t sub_226A251C4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v8 = sub_226A47DC0();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = v5 + *(int *)(a4 + 24);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD5A6D0);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 28);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

void sub_226A252F4()
{
  sub_226A47DC0();
  if (v0 <= 0x3F)
  {
    sub_226A253D0();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_226A253D0()
{
  if (!qword_26AD5A6D8)
  {
    type metadata accessor for SyncRecordChangesetProtobuf();
    unint64_t v0 = sub_226A48040();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26AD5A6D8);
    }
  }
}

uint64_t sub_226A25428(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t FetchScoresResponseProtobuf.communityScores.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26814BFD8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t ScoresResponseProtobuf = type metadata accessor for FetchScoresResponseProtobuf();
  sub_226A25670(v1 + *(int *)(ScoresResponseProtobuf + 20), (uint64_t)v5);
  uint64_t v7 = sub_226A47CD0();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v8 + 32))(a1, v5, v7);
  }
  sub_226A47CC0();
  return sub_226A25428((uint64_t)v5, &qword_26814BFD8);
}

uint64_t type metadata accessor for FetchScoresResponseProtobuf()
{
  uint64_t result = qword_26814C000;
  if (!qword_26814C000) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_226A25670(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26814BFD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_226A256D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26814BFD8);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t ScoresResponseProtobuf = type metadata accessor for FetchScoresResponseProtobuf();
  sub_226A25670(a1 + *(int *)(ScoresResponseProtobuf + 20), (uint64_t)v6);
  uint64_t v8 = sub_226A47CD0();
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(a2, v6, v8);
  }
  sub_226A47CC0();
  return sub_226A25428((uint64_t)v6, &qword_26814BFD8);
}

uint64_t sub_226A25800(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_226A47CD0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t v8 = a2 + *(int *)(type metadata accessor for FetchScoresResponseProtobuf() + 20);
  sub_226A25428(v8, &qword_26814BFD8);
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v8, v7, v4);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v5 + 56))(v8, 0, 1, v4);
}

uint64_t FetchScoresResponseProtobuf.communityScores.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for FetchScoresResponseProtobuf() + 20);
  sub_226A25428(v3, &qword_26814BFD8);
  uint64_t v4 = sub_226A47CD0();
  uint64_t v7 = *(void *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v3, a1, v4);
  uint64_t v5 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56);

  return v5(v3, 0, 1, v4);
}

void (*FetchScoresResponseProtobuf.communityScores.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  *uint64_t v3 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26814BFD8);
  uint64_t v5 = malloc(*(void *)(*(void *)(v4 - 8) + 64));
  v3[1] = v5;
  uint64_t v6 = sub_226A47CD0();
  v3[2] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = v7;
  v3[3] = v7;
  size_t v9 = *(void *)(v7 + 64);
  v3[4] = malloc(v9);
  uint64_t v10 = malloc(v9);
  v3[5] = v10;
  uint64_t v11 = *(int *)(type metadata accessor for FetchScoresResponseProtobuf() + 20);
  *((_DWORD *)v3 + 12) = v11;
  sub_226A25670(v1 + v11, (uint64_t)v5);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v6) == 1)
  {
    sub_226A47CC0();
    sub_226A25428((uint64_t)v5, &qword_26814BFD8);
  }
  else
  {
    (*(void (**)(void *, void *, uint64_t))(v8 + 32))(v10, v5, v6);
  }
  return sub_226A25B8C;
}

void sub_226A25B8C(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(int *)(*(void *)a1 + 48);
  uint64_t v4 = *(void **)(*(void *)a1 + 32);
  uint64_t v5 = *(void **)(*(void *)a1 + 40);
  uint64_t v6 = *(void *)(*(void *)a1 + 16);
  uint64_t v7 = *(void *)(*(void *)a1 + 24);
  uint64_t v8 = *(void **)(*(void *)a1 + 8);
  uint64_t v9 = **(void **)a1 + v3;
  if (a2)
  {
    (*(void (**)(void, void *, uint64_t))(v7 + 16))(*(void *)(*(void *)a1 + 32), v5, v6);
    sub_226A25428(v9, &qword_26814BFD8);
    (*(void (**)(uint64_t, void *, uint64_t))(v7 + 32))(v9, v4, v6);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56))(v9, 0, 1, v6);
    (*(void (**)(void *, uint64_t))(v7 + 8))(v5, v6);
  }
  else
  {
    sub_226A25428(**(void **)a1 + v3, &qword_26814BFD8);
    (*(void (**)(uint64_t, void *, uint64_t))(v7 + 32))(v9, v5, v6);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56))(v9, 0, 1, v6);
  }
  free(v5);
  free(v4);
  free(v8);

  free(v2);
}

BOOL FetchScoresResponseProtobuf.hasCommunityScores.getter()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26814BFD8);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t ScoresResponseProtobuf = type metadata accessor for FetchScoresResponseProtobuf();
  sub_226A25670(v0 + *(int *)(ScoresResponseProtobuf + 20), (uint64_t)v3);
  uint64_t v5 = sub_226A47CD0();
  BOOL v6 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v3, 1, v5) != 1;
  sub_226A25428((uint64_t)v3, &qword_26814BFD8);
  return v6;
}

Swift::Void __swiftcall FetchScoresResponseProtobuf.clearCommunityScores()()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for FetchScoresResponseProtobuf() + 20);
  sub_226A25428(v1, &qword_26814BFD8);
  uint64_t v2 = sub_226A47CD0();
  uint64_t v3 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  v3(v1, 1, 1, v2);
}

uint64_t FetchScoresResponseProtobuf.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_226A47DC0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t FetchScoresResponseProtobuf.unknownFields.setter(uint64_t a1)
{
  uint64_t v3 = sub_226A47DC0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 40);

  return v4(v1, a1, v3);
}

uint64_t (*FetchScoresResponseProtobuf.unknownFields.modify())()
{
  return nullsub_1;
}

uint64_t FetchScoresResponseProtobuf.init()@<X0>(uint64_t a1@<X8>)
{
  _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
  uint64_t v2 = a1 + *(int *)(type metadata accessor for FetchScoresResponseProtobuf() + 20);
  uint64_t v3 = sub_226A47CD0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56);

  return v4(v2, 1, 1, v3);
}

unint64_t static FetchScoresResponseProtobuf.protoMessageName.getter()
{
  return 0xD00000000000001BLL;
}

uint64_t sub_226A25FDC()
{
  uint64_t v0 = sub_226A47FE0();
  __swift_allocate_value_buffer(v0, qword_26814BFC0);
  __swift_project_value_buffer(v0, (uint64_t)qword_26814BFC0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26814BFB0);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26814BFB8) - 8);
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_226A483E0;
  unint64_t v4 = v3 + v2 + v1[14];
  *(void *)(v3 + v2) = 1;
  *(void *)unint64_t v4 = "communityScores";
  *(void *)(v4 + 8) = 15;
  *(unsigned char *)(v4 + 16) = 2;
  uint64_t v5 = *MEMORY[0x263F50718];
  uint64_t v6 = sub_226A47FB0();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 104))(v4, v5, v6);
  return sub_226A47FC0();
}

uint64_t static FetchScoresResponseProtobuf._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26814BE70 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_226A47FE0();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26814BFC0);
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t FetchScoresResponseProtobuf.decodeMessage<A>(decoder:)()
{
  while (1)
  {
    uint64_t result = sub_226A47E10();
    if (v0 || (v2 & 1) != 0) {
      break;
    }
    if (result == 1) {
      sub_226A26254();
    }
  }
  return result;
}

uint64_t sub_226A26254()
{
  return sub_226A47EB0();
}

uint64_t FetchScoresResponseProtobuf.traverse<A>(visitor:)()
{
  uint64_t result = sub_226A2635C(v0);
  if (!v1) {
    return sub_226A47DA0();
  }
  return result;
}

uint64_t sub_226A2635C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26814BFD8);
  MEMORY[0x270FA5388](v2 - 8);
  unint64_t v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_226A47CD0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t ScoresResponseProtobuf = type metadata accessor for FetchScoresResponseProtobuf();
  sub_226A25670(a1 + *(int *)(ScoresResponseProtobuf + 20), (uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1) {
    return sub_226A25428((uint64_t)v4, &qword_26814BFD8);
  }
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
  sub_226A27BE0(&qword_26814C030, MEMORY[0x263F6A890]);
  sub_226A47FA0();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t FetchScoresResponseProtobuf.hashValue.getter()
{
  return sub_226A48130();
}

uint64_t sub_226A265E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
  uint64_t v4 = a2 + *(int *)(a1 + 20);
  uint64_t v5 = sub_226A47CD0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);

  return v6(v4, 1, 1, v5);
}

unint64_t sub_226A26660()
{
  return 0xD00000000000001BLL;
}

uint64_t sub_226A2667C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_226A47DC0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t sub_226A266E4(uint64_t a1)
{
  uint64_t v3 = sub_226A47DC0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 40);

  return v4(v1, a1, v3);
}

uint64_t (*sub_226A2674C())()
{
  return nullsub_1;
}

uint64_t sub_226A2676C()
{
  return FetchScoresResponseProtobuf.decodeMessage<A>(decoder:)();
}

uint64_t sub_226A26784()
{
  return FetchScoresResponseProtobuf.traverse<A>(visitor:)();
}

uint64_t sub_226A2679C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_226A27BE0(&qword_26814C018, (void (*)(uint64_t))type metadata accessor for FetchScoresResponseProtobuf);

  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_226A26818@<X0>(uint64_t a1@<X8>)
{
  if (qword_26814BE70 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_226A47FE0();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26814BFC0);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_226A268C0(uint64_t a1)
{
  uint64_t v2 = sub_226A27BE0(&qword_26814BFF0, (void (*)(uint64_t))type metadata accessor for FetchScoresResponseProtobuf);

  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_226A2692C()
{
  sub_226A27BE0(&qword_26814BFF0, (void (*)(uint64_t))type metadata accessor for FetchScoresResponseProtobuf);

  return sub_226A47EE0();
}

uint64_t _s21SeymourServerProtocol27FetchScoresResponseProtobufV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_226A47DC0();
  uint64_t v46 = *(void *)(v4 - 8);
  uint64_t v47 = v4;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  v45 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v44 = (char *)&v40 - v7;
  uint64_t v8 = sub_226A47CD0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  v41 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26814C020);
  uint64_t v12 = v11 - 8;
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26814BFD8);
  uint64_t v16 = MEMORY[0x270FA5388](v15 - 8);
  uint64_t v18 = (char *)&v40 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  uint64_t v21 = (char *)&v40 - v20;
  MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v40 - v22;
  uint64_t ScoresResponseProtobuf = type metadata accessor for FetchScoresResponseProtobuf();
  uint64_t v25 = *(int *)(ScoresResponseProtobuf + 20);
  uint64_t v42 = a1;
  sub_226A25670(a1 + v25, (uint64_t)v23);
  uint64_t v26 = *(int *)(ScoresResponseProtobuf + 20);
  uint64_t v43 = a2;
  sub_226A25670(a2 + v26, (uint64_t)v21);
  uint64_t v27 = (uint64_t)&v14[*(int *)(v12 + 56)];
  sub_226A25670((uint64_t)v23, (uint64_t)v14);
  sub_226A25670((uint64_t)v21, v27);
  uint64_t v28 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
  if (v28((uint64_t)v14, 1, v8) != 1)
  {
    sub_226A25670((uint64_t)v14, (uint64_t)v18);
    if (v28(v27, 1, v8) != 1)
    {
      uint64_t v29 = v41;
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 32))(v41, v27, v8);
      sub_226A27BE0(&qword_26814C028, MEMORY[0x263F6A890]);
      char v30 = sub_226A48010();
      uint64_t v31 = *(void (**)(char *, uint64_t))(v9 + 8);
      v31(v29, v8);
      sub_226A25428((uint64_t)v21, &qword_26814BFD8);
      sub_226A25428((uint64_t)v23, &qword_26814BFD8);
      v31(v18, v8);
      sub_226A25428((uint64_t)v14, &qword_26814BFD8);
      if (v30) {
        goto LABEL_8;
      }
LABEL_9:
      char v37 = 0;
      return v37 & 1;
    }
    sub_226A25428((uint64_t)v21, &qword_26814BFD8);
    sub_226A25428((uint64_t)v23, &qword_26814BFD8);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v18, v8);
LABEL_6:
    sub_226A25428((uint64_t)v14, &qword_26814C020);
    goto LABEL_9;
  }
  sub_226A25428((uint64_t)v21, &qword_26814BFD8);
  sub_226A25428((uint64_t)v23, &qword_26814BFD8);
  if (v28(v27, 1, v8) != 1) {
    goto LABEL_6;
  }
  sub_226A25428((uint64_t)v14, &qword_26814BFD8);
LABEL_8:
  uint64_t v33 = v46;
  uint64_t v32 = v47;
  v34 = *(void (**)(char *, uint64_t, uint64_t))(v46 + 16);
  v35 = v44;
  v34(v44, v42, v47);
  v36 = v45;
  v34(v45, v43, v32);
  sub_226A27BE0(&qword_26814BFA8, MEMORY[0x263F50560]);
  char v37 = sub_226A48010();
  v38 = *(void (**)(char *, uint64_t))(v33 + 8);
  v38(v36, v32);
  v38(v35, v32);
  return v37 & 1;
}

uint64_t sub_226A26EC4()
{
  return sub_226A27BE0(&qword_26814BFE8, (void (*)(uint64_t))type metadata accessor for FetchScoresResponseProtobuf);
}

uint64_t sub_226A26F0C()
{
  return sub_226A27BE0(&qword_26814BFF0, (void (*)(uint64_t))type metadata accessor for FetchScoresResponseProtobuf);
}

uint64_t sub_226A26F54()
{
  return sub_226A27BE0(&qword_26814BFE0, (void (*)(uint64_t))type metadata accessor for FetchScoresResponseProtobuf);
}

uint64_t sub_226A26F9C()
{
  return sub_226A27BE0(&qword_26814BFF8, (void (*)(uint64_t))type metadata accessor for FetchScoresResponseProtobuf);
}

uint64_t *initializeBufferWithCopyOfBuffer for FetchScoresResponseProtobuf(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_226A47DC0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_226A47CD0();
    uint64_t v12 = *(void *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26814BFD8);
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

uint64_t destroy for FetchScoresResponseProtobuf(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_226A47DC0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_226A47CD0();
  uint64_t v9 = *(void *)(v6 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v5, 1, v6);
  if (!result)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v9 + 8);
    return v8(v5, v6);
  }
  return result;
}

uint64_t initializeWithCopy for FetchScoresResponseProtobuf(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_226A47DC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_226A47CD0();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26814BFD8);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  return a1;
}

uint64_t assignWithCopy for FetchScoresResponseProtobuf(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_226A47DC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = sub_226A47CD0();
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
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26814BFD8);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

uint64_t initializeWithTake for FetchScoresResponseProtobuf(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_226A47DC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_226A47CD0();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26814BFD8);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  return a1;
}

uint64_t assignWithTake for FetchScoresResponseProtobuf(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_226A47DC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = sub_226A47CD0();
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
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26814BFD8);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for FetchScoresResponseProtobuf(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_226A278A8);
}

uint64_t sub_226A278A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_226A47DC0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26814BFD8);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t storeEnumTagSinglePayload for FetchScoresResponseProtobuf(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_226A279B8);
}

uint64_t sub_226A279B8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_226A47DC0();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26814BFD8);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

void sub_226A27AC0()
{
  sub_226A47DC0();
  if (v0 <= 0x3F)
  {
    sub_226A27B88();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_226A27B88()
{
  if (!qword_26814C010)
  {
    sub_226A47CD0();
    unint64_t v0 = sub_226A48040();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26814C010);
    }
  }
}

uint64_t sub_226A27BE0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t FetchSyncableCountsRequestProtobuf.zones.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t FetchSyncableCountsRequestProtobuf.zones.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v1 = a1;
  return result;
}

uint64_t (*FetchSyncableCountsRequestProtobuf.zones.modify())()
{
  return nullsub_1;
}

uint64_t FetchSyncableCountsRequestProtobuf.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_226A27EA0(type metadata accessor for FetchSyncableCountsRequestProtobuf, a1);
}

uint64_t type metadata accessor for FetchSyncableCountsRequestProtobuf(uint64_t a1)
{
  return sub_226A1FDB8(a1, (uint64_t *)&unk_26814C0A8);
}

uint64_t FetchSyncableCountsRequestProtobuf.unknownFields.setter(uint64_t a1)
{
  return sub_226A27F58(a1, type metadata accessor for FetchSyncableCountsRequestProtobuf);
}

uint64_t (*FetchSyncableCountsRequestProtobuf.unknownFields.modify())()
{
  return nullsub_1;
}

uint64_t FetchSyncableCountsRequestProtobuf.init()@<X0>(void *a1@<X8>)
{
  *a1 = MEMORY[0x263F8EE78];
  type metadata accessor for FetchSyncableCountsRequestProtobuf(0);
  return _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
}

unint64_t sub_226A27D54(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26814C0D8);
  uint64_t v2 = (void *)sub_226A48070();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (_DWORD *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *((void *)v4 - 2);
    uint64_t v6 = *((void *)v4 - 1);
    int v7 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_226A31018(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v10 = v5;
    v10[1] = v6;
    *(_DWORD *)(v2[7] + 4 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 6;
    v2[2] = v13;
    if (!--v3)
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

uint64_t (*FetchSyncableCountsResponseProtobuf.countsByZone.modify())()
{
  return nullsub_1;
}

uint64_t FetchSyncableCountsResponseProtobuf.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_226A27EA0(type metadata accessor for FetchSyncableCountsResponseProtobuf, a1);
}

uint64_t sub_226A27EA0@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1(0) + 20);
  uint64_t v5 = sub_226A47DC0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a2, v4, v5);
}

uint64_t type metadata accessor for FetchSyncableCountsResponseProtobuf(uint64_t a1)
{
  return sub_226A1FDB8(a1, (uint64_t *)&unk_26814C0B8);
}

uint64_t FetchSyncableCountsResponseProtobuf.unknownFields.setter(uint64_t a1)
{
  return sub_226A27F58(a1, type metadata accessor for FetchSyncableCountsResponseProtobuf);
}

uint64_t sub_226A27F58(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v4 = v2 + *(int *)(a2(0) + 20);
  uint64_t v5 = sub_226A47DC0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);

  return v6(v4, a1, v5);
}

uint64_t (*FetchSyncableCountsResponseProtobuf.unknownFields.modify())()
{
  return nullsub_1;
}

uint64_t FetchSyncableCountsResponseProtobuf.init()@<X0>(unint64_t *a1@<X8>)
{
  *a1 = sub_226A27D54(MEMORY[0x263F8EE78]);
  type metadata accessor for FetchSyncableCountsResponseProtobuf(0);
  return _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
}

unint64_t static FetchSyncableCountsRequestProtobuf.protoMessageName.getter()
{
  return 0xD000000000000022;
}

uint64_t sub_226A2807C(uint64_t a1)
{
  return sub_226A2114C(a1, qword_26814C038, (uint64_t)"zones", 5);
}

uint64_t static FetchSyncableCountsRequestProtobuf._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_226A21AE8(&qword_26814BE78, (uint64_t)qword_26814C038, a1);
}

uint64_t FetchSyncableCountsRequestProtobuf.decodeMessage<A>(decoder:)()
{
  while (1)
  {
    uint64_t result = sub_226A47E10();
    if (v0 || (v2 & 1) != 0) {
      break;
    }
    if (result == 1) {
      sub_226A47E70();
    }
  }
  return result;
}

uint64_t FetchSyncableCountsRequestProtobuf.traverse<A>(visitor:)()
{
  if (!*(void *)(*(void *)v0 + 16) || (uint64_t result = sub_226A47F60(), !v1))
  {
    type metadata accessor for FetchSyncableCountsRequestProtobuf(0);
    return sub_226A47DA0();
  }
  return result;
}

uint64_t static FetchSyncableCountsRequestProtobuf.== infix(_:_:)(char *a1, char *a2)
{
  return sub_226A28B9C(a1, a2, (uint64_t (*)(void, void))sub_226A40408, type metadata accessor for FetchSyncableCountsRequestProtobuf) & 1;
}

uint64_t FetchSyncableCountsRequestProtobuf.hashValue.getter()
{
  return sub_226A28710((void (*)(void))type metadata accessor for FetchSyncableCountsRequestProtobuf, &qword_26814C068, (void (*)(uint64_t))type metadata accessor for FetchSyncableCountsRequestProtobuf);
}

unint64_t sub_226A2824C()
{
  return 0xD000000000000022;
}

uint64_t sub_226A28268()
{
  return FetchSyncableCountsRequestProtobuf.decodeMessage<A>(decoder:)();
}

uint64_t sub_226A28280()
{
  return FetchSyncableCountsRequestProtobuf.traverse<A>(visitor:)();
}

uint64_t sub_226A28298(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_226A28D64(&qword_26814C0D0, (void (*)(uint64_t))type metadata accessor for FetchSyncableCountsRequestProtobuf);

  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_226A28314@<X0>(uint64_t a1@<X8>)
{
  return sub_226A2234C(&qword_26814BE78, (uint64_t)qword_26814C038, a1);
}

uint64_t sub_226A28338(uint64_t a1)
{
  uint64_t v2 = sub_226A28D64(&qword_26814C080, (void (*)(uint64_t))type metadata accessor for FetchSyncableCountsRequestProtobuf);

  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_226A283A4()
{
  sub_226A28D64(&qword_26814C080, (void (*)(uint64_t))type metadata accessor for FetchSyncableCountsRequestProtobuf);

  return sub_226A47EE0();
}

uint64_t sub_226A28420(char *a1, char *a2)
{
  return sub_226A28B9C(a1, a2, (uint64_t (*)(void, void))sub_226A40408, type metadata accessor for FetchSyncableCountsRequestProtobuf) & 1;
}

unint64_t static FetchSyncableCountsResponseProtobuf.protoMessageName.getter()
{
  return 0xD000000000000023;
}

uint64_t sub_226A28480(uint64_t a1)
{
  return sub_226A2114C(a1, qword_26814C050, (uint64_t)"countsByZone", 12);
}

uint64_t static FetchSyncableCountsResponseProtobuf._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_226A21AE8(&qword_26814BE80, (uint64_t)qword_26814C050, a1);
}

uint64_t FetchSyncableCountsResponseProtobuf.decodeMessage<A>(decoder:)()
{
  while (1)
  {
    uint64_t result = sub_226A47E10();
    if (v0 || (v2 & 1) != 0) {
      break;
    }
    if (result == 1) {
      sub_226A28530();
    }
  }
  return result;
}

uint64_t sub_226A28530()
{
  return sub_226A47E00();
}

uint64_t FetchSyncableCountsResponseProtobuf.traverse<A>(visitor:)()
{
  if (!*(void *)(*(void *)v0 + 16) || (sub_226A47D80(), sub_226A47D90(), uint64_t result = sub_226A47F00(), !v1))
  {
    type metadata accessor for FetchSyncableCountsResponseProtobuf(0);
    return sub_226A47DA0();
  }
  return result;
}

uint64_t static FetchSyncableCountsResponseProtobuf.== infix(_:_:)(char *a1, char *a2)
{
  return sub_226A28B9C(a1, a2, sub_226A289F0, type metadata accessor for FetchSyncableCountsResponseProtobuf) & 1;
}

uint64_t FetchSyncableCountsResponseProtobuf.hashValue.getter()
{
  return sub_226A28710((void (*)(void))type metadata accessor for FetchSyncableCountsResponseProtobuf, &qword_26814C070, (void (*)(uint64_t))type metadata accessor for FetchSyncableCountsResponseProtobuf);
}

uint64_t sub_226A28710(void (*a1)(void), unint64_t *a2, void (*a3)(uint64_t))
{
  return sub_226A48130();
}

uint64_t sub_226A28798@<X0>(unint64_t *a1@<X8>)
{
  *a1 = sub_226A27D54(MEMORY[0x263F8EE78]);
  return _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
}

unint64_t sub_226A287D8()
{
  return 0xD000000000000023;
}

uint64_t sub_226A287F4()
{
  return FetchSyncableCountsResponseProtobuf.decodeMessage<A>(decoder:)();
}

uint64_t sub_226A2880C()
{
  return FetchSyncableCountsResponseProtobuf.traverse<A>(visitor:)();
}

uint64_t sub_226A28824(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_226A28D64(&qword_26814C0C8, (void (*)(uint64_t))type metadata accessor for FetchSyncableCountsResponseProtobuf);

  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_226A288A0@<X0>(uint64_t a1@<X8>)
{
  return sub_226A2234C(&qword_26814BE80, (uint64_t)qword_26814C050, a1);
}

uint64_t sub_226A288C4(uint64_t a1)
{
  uint64_t v2 = sub_226A28D64(&qword_26814C098, (void (*)(uint64_t))type metadata accessor for FetchSyncableCountsResponseProtobuf);

  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_226A28930()
{
  sub_226A28D64(&qword_26814C098, (void (*)(uint64_t))type metadata accessor for FetchSyncableCountsResponseProtobuf);

  return sub_226A47EE0();
}

uint64_t sub_226A289AC(char *a1, char *a2)
{
  return sub_226A28B9C(a1, a2, sub_226A289F0, type metadata accessor for FetchSyncableCountsResponseProtobuf) & 1;
}

uint64_t sub_226A289F0(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  uint64_t v3 = result;
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v4 = 0;
  uint64_t v5 = result + 64;
  uint64_t v6 = 1 << *(unsigned char *)(result + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(result + 64);
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  while (1)
  {
    if (v8)
    {
      unint64_t v10 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v11 = v10 | (v4 << 6);
      goto LABEL_24;
    }
    int64_t v12 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v12 >= v9) {
      return 1;
    }
    unint64_t v13 = *(void *)(v5 + 8 * v12);
    ++v4;
    if (!v13)
    {
      int64_t v4 = v12 + 1;
      if (v12 + 1 >= v9) {
        return 1;
      }
      unint64_t v13 = *(void *)(v5 + 8 * v4);
      if (!v13)
      {
        int64_t v4 = v12 + 2;
        if (v12 + 2 >= v9) {
          return 1;
        }
        unint64_t v13 = *(void *)(v5 + 8 * v4);
        if (!v13)
        {
          int64_t v4 = v12 + 3;
          if (v12 + 3 >= v9) {
            return 1;
          }
          unint64_t v13 = *(void *)(v5 + 8 * v4);
          if (!v13) {
            break;
          }
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v4 << 6);
LABEL_24:
    uint64_t v15 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v11);
    uint64_t v16 = *v15;
    uint64_t v17 = v15[1];
    int v18 = *(_DWORD *)(*(void *)(v3 + 56) + 4 * v11);
    swift_bridgeObjectRetain();
    unint64_t v19 = sub_226A31018(v16, v17);
    char v21 = v20;
    uint64_t result = swift_bridgeObjectRelease();
    if ((v21 & 1) == 0 || *(_DWORD *)(*(void *)(a2 + 56) + 4 * v19) != v18) {
      return 0;
    }
  }
  int64_t v14 = v12 + 4;
  if (v14 >= v9) {
    return 1;
  }
  unint64_t v13 = *(void *)(v5 + 8 * v14);
  if (v13)
  {
    int64_t v4 = v14;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v4 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v4 >= v9) {
      return 1;
    }
    unint64_t v13 = *(void *)(v5 + 8 * v4);
    ++v14;
    if (v13) {
      goto LABEL_23;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_226A28B9C(char *a1, char *a2, uint64_t (*a3)(void, void), uint64_t (*a4)(void))
{
  uint64_t v8 = sub_226A47DC0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  int64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  int64_t v14 = (char *)&v20 - v13;
  if (a3(*(void *)a1, *(void *)a2))
  {
    uint64_t v15 = a4(0);
    uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
    v16(v14, &a1[*(int *)(v15 + 20)], v8);
    v16(v12, &a2[*(int *)(v15 + 20)], v8);
    sub_226A28D64(&qword_26814BFA8, MEMORY[0x263F50560]);
    char v17 = sub_226A48010();
    int v18 = *(void (**)(char *, uint64_t))(v9 + 8);
    v18(v12, v8);
    v18(v14, v8);
  }
  else
  {
    char v17 = 0;
  }
  return v17 & 1;
}

uint64_t sub_226A28D64(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_226A28DAC()
{
  return sub_226A28D64(&qword_26814C078, (void (*)(uint64_t))type metadata accessor for FetchSyncableCountsRequestProtobuf);
}

uint64_t sub_226A28DF4()
{
  return sub_226A28D64(&qword_26814C080, (void (*)(uint64_t))type metadata accessor for FetchSyncableCountsRequestProtobuf);
}

uint64_t sub_226A28E3C()
{
  return sub_226A28D64(&qword_26814C068, (void (*)(uint64_t))type metadata accessor for FetchSyncableCountsRequestProtobuf);
}

uint64_t sub_226A28E84()
{
  return sub_226A28D64(&qword_26814C088, (void (*)(uint64_t))type metadata accessor for FetchSyncableCountsRequestProtobuf);
}

uint64_t sub_226A28ECC()
{
  return sub_226A28D64(&qword_26814C090, (void (*)(uint64_t))type metadata accessor for FetchSyncableCountsResponseProtobuf);
}

uint64_t sub_226A28F14()
{
  return sub_226A28D64(&qword_26814C098, (void (*)(uint64_t))type metadata accessor for FetchSyncableCountsResponseProtobuf);
}

uint64_t sub_226A28F5C()
{
  return sub_226A28D64(&qword_26814C070, (void (*)(uint64_t))type metadata accessor for FetchSyncableCountsResponseProtobuf);
}

uint64_t sub_226A28FA4()
{
  return sub_226A28D64(&qword_26814C0A0, (void (*)(uint64_t))type metadata accessor for FetchSyncableCountsResponseProtobuf);
}

uint64_t getEnumTagSinglePayload for FetchSyncableCountsRequestProtobuf(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm_0);
}

uint64_t storeEnumTagSinglePayload for FetchSyncableCountsRequestProtobuf(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm_0);
}

uint64_t getEnumTagSinglePayload for FetchSyncableCountsResponseProtobuf(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm_1);
}

uint64_t storeEnumTagSinglePayload for FetchSyncableCountsResponseProtobuf(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm_1);
}

void ServerErrorProtobuf.type.getter(uint64_t a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 8);
  *(void *)a1 = *(void *)v1;
  *(unsigned char *)(a1 + 8) = v2;
}

uint64_t ServerErrorProtobuf.type.setter(uint64_t result)
{
  char v2 = *(unsigned char *)(result + 8);
  *(void *)uint64_t v1 = *(void *)result;
  *(unsigned char *)(v1 + 8) = v2;
  return result;
}

uint64_t (*ServerErrorProtobuf.type.modify())()
{
  return nullsub_1;
}

uint64_t ServerErrorProtobuf.zone.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ServerErrorProtobuf.zone.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*ServerErrorProtobuf.zone.modify())()
{
  return nullsub_1;
}

uint64_t ServerErrorProtobuf.zones.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ServerErrorProtobuf.zones.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 32) = a1;
  return result;
}

uint64_t (*ServerErrorProtobuf.zones.modify())()
{
  return nullsub_1;
}

uint64_t ServerErrorProtobuf.argumentName.getter()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ServerErrorProtobuf.argumentName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 40) = a1;
  *(void *)(v2 + 48) = a2;
  return result;
}

uint64_t (*ServerErrorProtobuf.argumentName.modify())()
{
  return nullsub_1;
}

uint64_t ServerErrorProtobuf.errorDescription.getter()
{
  uint64_t v1 = *(void *)(v0 + 56);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ServerErrorProtobuf.errorDescription.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 56) = a1;
  *(void *)(v2 + 64) = a2;
  return result;
}

uint64_t (*ServerErrorProtobuf.errorDescription.modify())()
{
  return nullsub_1;
}

uint64_t ServerErrorProtobuf.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ServerErrorProtobuf() + 36);
  uint64_t v4 = sub_226A47DC0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for ServerErrorProtobuf()
{
  uint64_t result = qword_26814C168;
  if (!qword_26814C168) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t ServerErrorProtobuf.unknownFields.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ServerErrorProtobuf() + 36);
  uint64_t v4 = sub_226A47DC0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40);

  return v5(v3, a1, v4);
}

uint64_t (*ServerErrorProtobuf.unknownFields.modify())()
{
  return nullsub_1;
}

void ServerErrorProtobuf.ErrorType.init()(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 1;
}

unint64_t ServerErrorProtobuf.ErrorType.init(rawValue:)@<X0>(unint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = result < 0xD;
  *(unsigned char *)(a2 + 9) = 0;
  return result;
}

uint64_t ServerErrorProtobuf.ErrorType.rawValue.getter()
{
  return *(void *)v0;
}

void sub_226A2943C()
{
  qword_26814C0E0 = (uint64_t)&unk_26DA8A7F8;
}

uint64_t static ServerErrorProtobuf.ErrorType.allCases.getter()
{
  if (qword_26814BE88 != -1) {
    swift_once();
  }

  return swift_bridgeObjectRetain();
}

void sub_226A294AC(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 1;
}

uint64_t sub_226A294C0()
{
  return *(void *)v0;
}

uint64_t sub_226A294C8@<X0>(void *a1@<X8>)
{
  if (qword_26814BE88 != -1) {
    swift_once();
  }
  *a1 = qword_26814C0E0;

  return swift_bridgeObjectRetain();
}

unint64_t sub_226A29534@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return ServerErrorProtobuf.ErrorType.init(rawValue:)(*a1, a2);
}

void sub_226A2953C(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_226A29548()
{
  return sub_226A48130();
}

uint64_t sub_226A295B4(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_226A29DA4();

  return MEMORY[0x270F44AF0](a1, a2, v4);
}

uint64_t sub_226A29600()
{
  return sub_226A48130();
}

BOOL sub_226A29668(uint64_t a1, uint64_t *a2)
{
  return sub_226A297B8(*(void *)a1, *(unsigned __int8 *)(a1 + 8), *a2);
}

uint64_t sub_226A29684(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2 = 0xEE00736574794264;
  unint64_t v3 = 0x6574707972636E65;
  int v4 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v5 = 0xD000000000000010;
    }
    else {
      unint64_t v5 = 0x696669746E656469;
    }
    if (v4 == 1) {
      unint64_t v6 = 0x8000000226A4B380;
    }
    else {
      unint64_t v6 = 0xEA00000000007265;
    }
    int v7 = a2;
    if (!a2) {
      goto LABEL_15;
    }
    goto LABEL_9;
  }
  unint64_t v5 = 0x6574707972636E65;
  unint64_t v6 = 0xEE00736574794264;
  int v7 = a2;
  if (a2)
  {
LABEL_9:
    if (v7 == 1) {
      unint64_t v3 = 0xD000000000000010;
    }
    else {
      unint64_t v3 = 0x696669746E656469;
    }
    if (v7 == 1) {
      unint64_t v2 = 0x8000000226A4B380;
    }
    else {
      unint64_t v2 = 0xEA00000000007265;
    }
  }
LABEL_15:
  if (v5 == v3 && v6 == v2) {
    char v8 = 1;
  }
  else {
    char v8 = sub_226A48090();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

BOOL sub_226A297B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1 == a3;
}

uint64_t ServerErrorProtobuf.init()@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 1;
  uint64_t v1 = MEMORY[0x263F8EE78];
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0xE000000000000000;
  *(void *)(a1 + 32) = v1;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0xE000000000000000;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0xE000000000000000;
  type metadata accessor for ServerErrorProtobuf();
  return _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
}

unint64_t static ServerErrorProtobuf.protoMessageName.getter()
{
  return 0xD000000000000013;
}

uint64_t sub_226A2983C()
{
  uint64_t v0 = sub_226A47FE0();
  __swift_allocate_value_buffer(v0, qword_26814C0E8);
  __swift_project_value_buffer(v0, (uint64_t)qword_26814C0E8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26814BFB0);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26814BFB8) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_226A48F90;
  unint64_t v5 = v4 + v3;
  unint64_t v6 = v4 + v3 + v1[14];
  *(void *)(v4 + v3) = 1;
  *(void *)unint64_t v6 = "type";
  *(void *)(v6 + 8) = 4;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_226A47FB0();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = v5 + v2 + v1[14];
  *(void *)(v5 + v2) = 2;
  *(void *)unint64_t v10 = "zone";
  *(void *)(v10 + 8) = 4;
  *(unsigned char *)(v10 + 16) = 2;
  v9();
  uint64_t v11 = (void *)(v5 + 2 * v2);
  int64_t v12 = (char *)v11 + v1[14];
  *uint64_t v11 = 3;
  *(void *)int64_t v12 = "zones";
  *((void *)v12 + 1) = 5;
  v12[16] = 2;
  v9();
  uint64_t v13 = (void *)(v5 + 3 * v2);
  int64_t v14 = (char *)v13 + v1[14];
  *uint64_t v13 = 4;
  *(void *)int64_t v14 = "argumentName";
  *((void *)v14 + 1) = 12;
  v14[16] = 2;
  v9();
  uint64_t v15 = v5 + 4 * v2 + v1[14];
  *(void *)(v5 + 4 * v2) = 5;
  *(void *)uint64_t v15 = "errorDescription";
  *(void *)(v15 + 8) = 16;
  *(unsigned char *)(v15 + 16) = 2;
  v9();
  return sub_226A47FC0();
}

uint64_t static ServerErrorProtobuf._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_226A21AE8(&qword_26814BE90, (uint64_t)qword_26814C0E8, a1);
}

uint64_t ServerErrorProtobuf.decodeMessage<A>(decoder:)()
{
  uint64_t result = sub_226A47E10();
  uint64_t v3 = v0;
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 1:
          sub_226A29DA4();
          uint64_t v4 = v3;
          sub_226A47E20();
          goto LABEL_5;
        case 2:
        case 4:
        case 5:
          uint64_t v4 = v3;
          sub_226A47E90();
          goto LABEL_5;
        case 3:
          uint64_t v4 = v3;
          sub_226A47E70();
LABEL_5:
          uint64_t v3 = v4;
          break;
        default:
          break;
      }
      uint64_t result = sub_226A47E10();
    }
  }
  return result;
}

uint64_t ServerErrorProtobuf.traverse<A>(visitor:)()
{
  if (!*v0 || (sub_226A29DA4(), uint64_t result = sub_226A47F10(), !v1))
  {
    unint64_t v3 = v0[3];
    uint64_t v4 = HIBYTE(v3) & 0xF;
    if ((v3 & 0x2000000000000000) == 0) {
      uint64_t v4 = v0[2] & 0xFFFFFFFFFFFFLL;
    }
    if (!v4 || (uint64_t result = sub_226A47F80(), !v1))
    {
      if (!*(void *)(v0[4] + 16) || (uint64_t result = sub_226A47F60(), !v1))
      {
        unint64_t v5 = v0[6];
        uint64_t v6 = HIBYTE(v5) & 0xF;
        if ((v5 & 0x2000000000000000) == 0) {
          uint64_t v6 = v0[5] & 0xFFFFFFFFFFFFLL;
        }
        if (!v6 || (uint64_t result = sub_226A47F80(), !v1))
        {
          unint64_t v7 = v0[8];
          uint64_t v8 = HIBYTE(v7) & 0xF;
          if ((v7 & 0x2000000000000000) == 0) {
            uint64_t v8 = v0[7] & 0xFFFFFFFFFFFFLL;
          }
          if (!v8 || (uint64_t result = sub_226A47F80(), !v1))
          {
            type metadata accessor for ServerErrorProtobuf();
            return sub_226A47DA0();
          }
        }
      }
    }
  }
  return result;
}

unint64_t sub_226A29DA4()
{
  unint64_t result = qword_26814C118;
  if (!qword_26814C118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26814C118);
  }
  return result;
}

uint64_t ServerErrorProtobuf.hashValue.getter()
{
  return sub_226A48130();
}

uint64_t sub_226A29E84@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 1;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0xE000000000000000;
  *(void *)(a1 + 32) = MEMORY[0x263F8EE78];
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0xE000000000000000;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0xE000000000000000;
  return _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
}

unint64_t sub_226A29ECC()
{
  return 0xD000000000000013;
}

uint64_t sub_226A29EE8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 36);
  uint64_t v5 = sub_226A47DC0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a2, v4, v5);
}

uint64_t sub_226A29F58(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + *(int *)(a2 + 36);
  uint64_t v5 = sub_226A47DC0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);

  return v6(v4, a1, v5);
}

uint64_t (*sub_226A29FC8())()
{
  return nullsub_1;
}

uint64_t sub_226A29FEC()
{
  return ServerErrorProtobuf.decodeMessage<A>(decoder:)();
}

uint64_t sub_226A2A004()
{
  return ServerErrorProtobuf.traverse<A>(visitor:)();
}

uint64_t sub_226A2A01C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_226A2B444(&qword_26814C178, (void (*)(uint64_t))type metadata accessor for ServerErrorProtobuf);

  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_226A2A098@<X0>(uint64_t a1@<X8>)
{
  return sub_226A2234C(&qword_26814BE90, (uint64_t)qword_26814C0E8, a1);
}

uint64_t sub_226A2A0BC(uint64_t a1)
{
  uint64_t v2 = sub_226A2B444(&qword_26814C158, (void (*)(uint64_t))type metadata accessor for ServerErrorProtobuf);

  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_226A2A128()
{
  sub_226A2B444(&qword_26814C158, (void (*)(uint64_t))type metadata accessor for ServerErrorProtobuf);

  return sub_226A47EE0();
}

uint64_t sub_226A2A1A8()
{
  uint64_t v0 = sub_226A47FE0();
  __swift_allocate_value_buffer(v0, qword_26814C100);
  __swift_project_value_buffer(v0, (uint64_t)qword_26814C100);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26814BFB0);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26814BFB8) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v32 = swift_allocObject();
  *(_OWORD *)(v32 + 16) = xmmword_226A48FA0;
  unint64_t v4 = v32 + v3;
  unint64_t v5 = v32 + v3 + v1[14];
  *(void *)(v32 + v3) = 0;
  *(void *)unint64_t v5 = "bootstrapRequired";
  *(void *)(v5 + 8) = 17;
  *(unsigned char *)(v5 + 16) = 2;
  uint64_t v6 = *MEMORY[0x263F50718];
  uint64_t v7 = sub_226A47FB0();
  uint64_t v8 = *(void (**)(void))(*(void *)(v7 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v8)(v5, v6, v7);
  unint64_t v9 = v4 + v2 + v1[14];
  *(void *)(v4 + v2) = 1;
  *(void *)unint64_t v9 = "mismatchedZones";
  *(void *)(v9 + 8) = 15;
  *(unsigned char *)(v9 + 16) = 2;
  v8();
  unint64_t v10 = (void *)(v4 + 2 * v2);
  uint64_t v11 = (char *)v10 + v1[14];
  *unint64_t v10 = 2;
  *(void *)uint64_t v11 = "invalidZone";
  *((void *)v11 + 1) = 11;
  v11[16] = 2;
  v8();
  int64_t v12 = (void *)(v4 + 3 * v2);
  uint64_t v13 = (char *)v12 + v1[14];
  *int64_t v12 = 3;
  *(void *)uint64_t v13 = "invalidPayload";
  *((void *)v13 + 1) = 14;
  v13[16] = 2;
  v8();
  int64_t v14 = (void *)(v4 + 4 * v2);
  uint64_t v15 = (char *)v14 + v1[14];
  *int64_t v14 = 4;
  *(void *)uint64_t v15 = "invalidArgument";
  *((void *)v15 + 1) = 15;
  v15[16] = 2;
  v8();
  uint64_t v16 = (void *)(v4 + 5 * v2);
  char v17 = (char *)v16 + v1[14];
  *uint64_t v16 = 5;
  *(void *)char v17 = "transportFailed";
  *((void *)v17 + 1) = 15;
  v17[16] = 2;
  v8();
  int v18 = (void *)(v4 + 6 * v2);
  unint64_t v19 = (char *)v18 + v1[14];
  *int v18 = 6;
  *(void *)unint64_t v19 = "serverFailed";
  *((void *)v19 + 1) = 12;
  v19[16] = 2;
  v8();
  uint64_t v20 = (void *)(v4 + 7 * v2);
  char v21 = (char *)v20 + v1[14];
  *uint64_t v20 = 7;
  *(void *)char v21 = "fetchRequired";
  *((void *)v21 + 1) = 13;
  v21[16] = 2;
  v8();
  uint64_t v22 = v4 + 8 * v2 + v1[14];
  *(void *)(v4 + 8 * v2) = 8;
  *(void *)uint64_t v22 = "cacheFailed";
  *(void *)(v22 + 8) = 11;
  *(unsigned char *)(v22 + 16) = 2;
  v8();
  uint64_t v23 = (void *)(v4 + 9 * v2);
  uint64_t v24 = (char *)v23 + v1[14];
  *uint64_t v23 = 9;
  *(void *)uint64_t v24 = "zoneCreationRequired";
  *((void *)v24 + 1) = 20;
  v24[16] = 2;
  v8();
  uint64_t v25 = (void *)(v4 + 10 * v2);
  uint64_t v26 = (char *)v25 + v1[14];
  *uint64_t v25 = 10;
  *(void *)uint64_t v26 = "zoneDeletionRequired";
  *((void *)v26 + 1) = 20;
  v26[16] = 2;
  v8();
  uint64_t v27 = (void *)(v4 + 11 * v2);
  uint64_t v28 = (char *)v27 + v1[14];
  *uint64_t v27 = 11;
  *(void *)uint64_t v28 = "noEncryptionKey";
  *((void *)v28 + 1) = 15;
  v28[16] = 2;
  v8();
  uint64_t v29 = (void *)(v4 + 12 * v2);
  char v30 = (char *)v29 + v1[14];
  *uint64_t v29 = 12;
  *(void *)char v30 = "resetRequired";
  *((void *)v30 + 1) = 13;
  v30[16] = 2;
  v8();
  return sub_226A47FC0();
}

uint64_t static ServerErrorProtobuf.ErrorType._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_226A21AE8(&qword_26814BE98, (uint64_t)qword_26814C100, a1);
}

uint64_t sub_226A2A624@<X0>(uint64_t a1@<X8>)
{
  return sub_226A2234C(&qword_26814BE98, (uint64_t)qword_26814C100, a1);
}

uint64_t _s21SeymourServerProtocol0B13ErrorProtobufV2eeoiySbAC_ACtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = sub_226A47DC0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  unint64_t v10 = (char *)&v19 - v9;
  uint64_t v11 = *a1;
  uint64_t v12 = *a2;
  if (*((unsigned char *)a2 + 8) == 1)
  {
    switch(v12)
    {
      case 1:
        if (v11 == 1) {
          goto LABEL_6;
        }
        goto LABEL_42;
      case 2:
        if (v11 == 2) {
          goto LABEL_6;
        }
        goto LABEL_42;
      case 3:
        if (v11 == 3) {
          goto LABEL_6;
        }
        goto LABEL_42;
      case 4:
        if (v11 == 4) {
          goto LABEL_6;
        }
        goto LABEL_42;
      case 5:
        if (v11 == 5) {
          goto LABEL_6;
        }
        goto LABEL_42;
      case 6:
        if (v11 == 6) {
          goto LABEL_6;
        }
        goto LABEL_42;
      case 7:
        if (v11 == 7) {
          goto LABEL_6;
        }
        goto LABEL_42;
      case 8:
        if (v11 != 8) {
          goto LABEL_42;
        }
        goto LABEL_6;
      case 9:
        if (v11 == 9) {
          goto LABEL_6;
        }
        goto LABEL_42;
      case 10:
        if (v11 == 10) {
          goto LABEL_6;
        }
        goto LABEL_42;
      case 11:
        if (v11 == 11) {
          goto LABEL_6;
        }
        goto LABEL_42;
      case 12:
        if (v11 == 12) {
          goto LABEL_6;
        }
        goto LABEL_42;
      default:
        if (!v11) {
          goto LABEL_6;
        }
        goto LABEL_42;
    }
  }
  if (v11 != v12) {
    goto LABEL_42;
  }
LABEL_6:
  if (a1[2] != a2[2] || a1[3] != a2[3])
  {
    char v14 = 0;
    if ((sub_226A48090() & 1) == 0) {
      return v14 & 1;
    }
  }
  if ((sub_226A40408((void *)a1[4], (void *)a2[4]) & 1) == 0)
  {
LABEL_42:
    char v14 = 0;
    return v14 & 1;
  }
  if (a1[5] == a2[5] && a1[6] == a2[6] || (char v14 = 0, (sub_226A48090() & 1) != 0))
  {
    if (a1[7] == a2[7] && a1[8] == a2[8] || (char v14 = 0, (sub_226A48090() & 1) != 0))
    {
      uint64_t v15 = type metadata accessor for ServerErrorProtobuf();
      uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
      v16(v10, (char *)a1 + *(int *)(v15 + 36), v4);
      v16(v8, (char *)a2 + *(int *)(v15 + 36), v4);
      sub_226A2B444(&qword_26814BFA8, MEMORY[0x263F50560]);
      char v14 = sub_226A48010();
      char v17 = *(void (**)(char *, uint64_t))(v5 + 8);
      v17(v8, v4);
      v17(v10, v4);
    }
  }
  return v14 & 1;
}

unint64_t sub_226A2A97C()
{
  unint64_t result = qword_26814C128;
  if (!qword_26814C128)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26814C128);
  }
  return result;
}

unint64_t sub_226A2A9D4()
{
  unint64_t result = qword_26814C130;
  if (!qword_26814C130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26814C130);
  }
  return result;
}

unint64_t sub_226A2AA2C()
{
  unint64_t result = qword_26814C138;
  if (!qword_26814C138)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26814C140);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26814C138);
  }
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

unint64_t sub_226A2AAD4()
{
  unint64_t result = qword_26814C148;
  if (!qword_26814C148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26814C148);
  }
  return result;
}

uint64_t sub_226A2AB28()
{
  return sub_226A2B444(&qword_26814C150, (void (*)(uint64_t))type metadata accessor for ServerErrorProtobuf);
}

uint64_t sub_226A2AB70()
{
  return sub_226A2B444(&qword_26814C158, (void (*)(uint64_t))type metadata accessor for ServerErrorProtobuf);
}

uint64_t sub_226A2ABB8()
{
  return sub_226A2B444(&qword_26814C120, (void (*)(uint64_t))type metadata accessor for ServerErrorProtobuf);
}

uint64_t sub_226A2AC00()
{
  return sub_226A2B444(&qword_26814C160, (void (*)(uint64_t))type metadata accessor for ServerErrorProtobuf);
}

void *initializeBufferWithCopyOfBuffer for ServerErrorProtobuf(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v3 = (void *)a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *unint64_t v3 = *a2;
    unint64_t v3 = (void *)(v13 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(void *)a1 = *a2;
    *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
    uint64_t v5 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v5;
    uint64_t v6 = a2[5];
    *(void *)(a1 + 32) = a2[4];
    *(void *)(a1 + 40) = v6;
    uint64_t v7 = a2[7];
    *(void *)(a1 + 48) = a2[6];
    *(void *)(a1 + 56) = v7;
    uint64_t v8 = *(int *)(a3 + 36);
    uint64_t v9 = a1 + v8;
    uint64_t v10 = (uint64_t)a2 + v8;
    *(void *)(a1 + 64) = a2[8];
    uint64_t v11 = sub_226A47DC0();
    uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
  }
  return v3;
}

uint64_t destroy for ServerErrorProtobuf(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 36);
  uint64_t v5 = sub_226A47DC0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

uint64_t initializeWithCopy for ServerErrorProtobuf(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  uint64_t v7 = *(int *)(a3 + 36);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  uint64_t v10 = sub_226A47DC0();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  return a1;
}

uint64_t assignWithCopy for ServerErrorProtobuf(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
  *(void *)a1 = v6;
  *(void *)(a1 + 16) = a2[2];
  *(void *)(a1 + 24) = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = a2[5];
  *(void *)(a1 + 48) = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = a2[7];
  *(void *)(a1 + 64) = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 36);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (uint64_t)a2 + v7;
  uint64_t v10 = sub_226A47DC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t initializeWithTake for ServerErrorProtobuf(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  uint64_t v4 = *(int *)(a3 + 36);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  uint64_t v7 = sub_226A47DC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t assignWithTake for ServerErrorProtobuf(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(int *)(a3 + 36);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_226A47DC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 40))(v10, v11, v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for ServerErrorProtobuf(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_226A2B170);
}

uint64_t sub_226A2B170(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_226A47DC0();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 36);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for ServerErrorProtobuf(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_226A2B234);
}

uint64_t sub_226A2B234(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_226A47DC0();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 36);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_226A2B2DC()
{
  uint64_t result = sub_226A47DC0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for ServerErrorProtobuf.ErrorType(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for ServerErrorProtobuf.ErrorType(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)uint64_t result = 0;
    *(unsigned char *)(result + 8) = 0;
    *(_DWORD *)uint64_t result = a2 - 1;
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
  *(unsigned char *)(result + 9) = v3;
  return result;
}

uint64_t sub_226A2B3F8(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_226A2B414(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)uint64_t result = (a2 - 1);
    *(unsigned char *)(result + 8) = 1;
  }
  else
  {
    *(unsigned char *)(result + 8) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for ServerErrorProtobuf.ErrorType()
{
  return &type metadata for ServerErrorProtobuf.ErrorType;
}

uint64_t sub_226A2B444(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t ScoreEstimationMarkerProtobuf.position.getter()
{
  return *v0;
}

uint64_t ScoreEstimationMarkerProtobuf.position.setter(uint64_t result)
{
  _DWORD *v1 = result;
  return result;
}

uint64_t (*ScoreEstimationMarkerProtobuf.position.modify())()
{
  return nullsub_1;
}

float ScoreEstimationMarkerProtobuf.height.getter()
{
  return *(float *)(v0 + 4);
}

void ScoreEstimationMarkerProtobuf.height.setter(float a1)
{
  *(float *)(v1 + 4) = a1;
}

uint64_t (*ScoreEstimationMarkerProtobuf.height.modify())()
{
  return nullsub_1;
}

float ScoreEstimationMarkerProtobuf.increment.getter()
{
  return *(float *)(v0 + 8);
}

void ScoreEstimationMarkerProtobuf.increment.setter(float a1)
{
  *(float *)(v1 + 8) = a1;
}

uint64_t (*ScoreEstimationMarkerProtobuf.increment.modify())()
{
  return nullsub_1;
}

float ScoreEstimationMarkerProtobuf.desiredPosition.getter()
{
  return *(float *)(v0 + 12);
}

void ScoreEstimationMarkerProtobuf.desiredPosition.setter(float a1)
{
  *(float *)(v1 + 12) = a1;
}

uint64_t (*ScoreEstimationMarkerProtobuf.desiredPosition.modify())()
{
  return nullsub_1;
}

uint64_t ScoreEstimationMarkerProtobuf.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ScoreEstimationMarkerProtobuf() + 32);
  uint64_t v4 = sub_226A47DC0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for ScoreEstimationMarkerProtobuf()
{
  uint64_t result = qword_26814C1B8;
  if (!qword_26814C1B8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t ScoreEstimationMarkerProtobuf.unknownFields.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ScoreEstimationMarkerProtobuf() + 32);
  uint64_t v4 = sub_226A47DC0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40);

  return v5(v3, a1, v4);
}

uint64_t (*ScoreEstimationMarkerProtobuf.unknownFields.modify())()
{
  return nullsub_1;
}

uint64_t ScoreEstimationMarkerProtobuf.init()@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
  return _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
}

unint64_t static ScoreEstimationMarkerProtobuf.protoMessageName.getter()
{
  return 0xD00000000000001DLL;
}

uint64_t sub_226A2B724()
{
  uint64_t v0 = sub_226A47FE0();
  __swift_allocate_value_buffer(v0, qword_26814C180);
  __swift_project_value_buffer(v0, (uint64_t)qword_26814C180);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26814BFB0);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26814BFB8) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_226A49320;
  unint64_t v5 = v4 + v3;
  unint64_t v6 = v4 + v3 + v1[14];
  *(void *)(v4 + v3) = 1;
  *(void *)unint64_t v6 = "position";
  *(void *)(v6 + 8) = 8;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_226A47FB0();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = v5 + v2 + v1[14];
  *(void *)(v5 + v2) = 2;
  *(void *)unint64_t v10 = "height";
  *(void *)(v10 + 8) = 6;
  *(unsigned char *)(v10 + 16) = 2;
  v9();
  uint64_t v11 = (void *)(v5 + 2 * v2);
  uint64_t v12 = (char *)v11 + v1[14];
  *uint64_t v11 = 3;
  *(void *)uint64_t v12 = "increment";
  *((void *)v12 + 1) = 9;
  v12[16] = 2;
  v9();
  uint64_t v13 = (void *)(v5 + 3 * v2);
  char v14 = (char *)v13 + v1[14];
  *uint64_t v13 = 4;
  *(void *)char v14 = "desiredPosition";
  *((void *)v14 + 1) = 15;
  v14[16] = 2;
  v9();
  return sub_226A47FC0();
}

uint64_t static ScoreEstimationMarkerProtobuf._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26814BEA0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_226A47FE0();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26814C180);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t ScoreEstimationMarkerProtobuf.decodeMessage<A>(decoder:)()
{
  uint64_t result = sub_226A47E10();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 1:
          sub_226A47E50();
          break;
        case 2:
        case 3:
        case 4:
          sub_226A47E40();
          break;
        default:
          break;
      }
      uint64_t result = sub_226A47E10();
    }
  }
  return result;
}

uint64_t ScoreEstimationMarkerProtobuf.traverse<A>(visitor:)()
{
  if (!*v0 || (uint64_t result = sub_226A47F40(), !v1))
  {
    if (!v0[1] || (uint64_t result = sub_226A47F30(), !v1))
    {
      if (!v0[2] || (uint64_t result = sub_226A47F30(), !v1))
      {
        if (!v0[3] || (uint64_t result = sub_226A47F30(), !v1))
        {
          type metadata accessor for ScoreEstimationMarkerProtobuf();
          return sub_226A47DA0();
        }
      }
    }
  }
  return result;
}

uint64_t ScoreEstimationMarkerProtobuf.hashValue.getter()
{
  return sub_226A48130();
}

uint64_t sub_226A2BC8C@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
  return _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
}

unint64_t sub_226A2BCB0()
{
  return 0xD00000000000001DLL;
}

uint64_t sub_226A2BCCC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 32);
  uint64_t v5 = sub_226A47DC0();
  unint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a2, v4, v5);
}

uint64_t sub_226A2BD3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + *(int *)(a2 + 32);
  uint64_t v5 = sub_226A47DC0();
  unint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);

  return v6(v4, a1, v5);
}

uint64_t (*sub_226A2BDAC())()
{
  return nullsub_1;
}

uint64_t sub_226A2BDD0()
{
  return ScoreEstimationMarkerProtobuf.decodeMessage<A>(decoder:)();
}

uint64_t sub_226A2BDE8()
{
  return ScoreEstimationMarkerProtobuf.traverse<A>(visitor:)();
}

uint64_t sub_226A2BE00(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_226A2C810(&qword_26814C1C8, (void (*)(uint64_t))type metadata accessor for ScoreEstimationMarkerProtobuf);

  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_226A2BE7C@<X0>(uint64_t a1@<X8>)
{
  if (qword_26814BEA0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_226A47FE0();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26814C180);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_226A2BF24(uint64_t a1)
{
  uint64_t v2 = sub_226A2C810(&qword_26814C1A8, (void (*)(uint64_t))type metadata accessor for ScoreEstimationMarkerProtobuf);

  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_226A2BF90()
{
  sub_226A2C810(&qword_26814C1A8, (void (*)(uint64_t))type metadata accessor for ScoreEstimationMarkerProtobuf);

  return sub_226A47EE0();
}

uint64_t _s21SeymourServerProtocol29ScoreEstimationMarkerProtobufV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_226A47DC0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  unint64_t v10 = (char *)&v16 - v9;
  if (*(_DWORD *)a1 == *(_DWORD *)a2
    && *(float *)(a1 + 4) == *(float *)(a2 + 4)
    && *(float *)(a1 + 8) == *(float *)(a2 + 8)
    && *(float *)(a1 + 12) == *(float *)(a2 + 12))
  {
    uint64_t v11 = type metadata accessor for ScoreEstimationMarkerProtobuf();
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v12(v10, a1 + *(int *)(v11 + 32), v4);
    v12(v8, a2 + *(int *)(v11 + 32), v4);
    sub_226A2C810(&qword_26814BFA8, MEMORY[0x263F50560]);
    char v13 = sub_226A48010();
    char v14 = *(void (**)(char *, uint64_t))(v5 + 8);
    v14(v8, v4);
    v14(v10, v4);
  }
  else
  {
    char v13 = 0;
  }
  return v13 & 1;
}

uint64_t sub_226A2C1F8()
{
  return sub_226A2C810(&qword_26814C1A0, (void (*)(uint64_t))type metadata accessor for ScoreEstimationMarkerProtobuf);
}

uint64_t sub_226A2C240()
{
  return sub_226A2C810(&qword_26814C1A8, (void (*)(uint64_t))type metadata accessor for ScoreEstimationMarkerProtobuf);
}

uint64_t sub_226A2C288()
{
  return sub_226A2C810(&qword_26814C198, (void (*)(uint64_t))type metadata accessor for ScoreEstimationMarkerProtobuf);
}

uint64_t sub_226A2C2D0()
{
  return sub_226A2C810(&qword_26814C1B0, (void (*)(uint64_t))type metadata accessor for ScoreEstimationMarkerProtobuf);
}

uint64_t *initializeBufferWithCopyOfBuffer for ScoreEstimationMarkerProtobuf(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v9 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    uint64_t v5 = *(int *)(a3 + 32);
    uint64_t v6 = (char *)a1 + v5;
    uint64_t v7 = (char *)a2 + v5;
    uint64_t v8 = sub_226A47DC0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
  }
  return v3;
}

uint64_t destroy for ScoreEstimationMarkerProtobuf(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 32);
  uint64_t v3 = sub_226A47DC0();
  int v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);

  return v4(v2, v3);
}

_OWORD *initializeWithCopy for ScoreEstimationMarkerProtobuf(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 32);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_226A47DC0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16))(v5, v6, v7);
  return a1;
}

_DWORD *assignWithCopy for ScoreEstimationMarkerProtobuf(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  uint64_t v4 = *(int *)(a3 + 32);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_226A47DC0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 24))(v5, v6, v7);
  return a1;
}

_OWORD *initializeWithTake for ScoreEstimationMarkerProtobuf(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 32);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_226A47DC0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t assignWithTake for ScoreEstimationMarkerProtobuf(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 4) = *(void *)(a2 + 4);
  *(_DWORD *)(a1 + 12) = *(_DWORD *)(a2 + 12);
  uint64_t v4 = *(int *)(a3 + 32);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = sub_226A47DC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 40))(v5, v6, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for ScoreEstimationMarkerProtobuf(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_226A2C678);
}

uint64_t sub_226A2C678(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a1 + *(int *)(a3 + 32);
  uint64_t v5 = sub_226A47DC0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48);

  return v6(v4, a2, v5);
}

uint64_t storeEnumTagSinglePayload for ScoreEstimationMarkerProtobuf(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_226A2C6FC);
}

uint64_t sub_226A2C6FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a1 + *(int *)(a4 + 32);
  uint64_t v6 = sub_226A47DC0();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);

  return v7(v5, a2, a2, v6);
}

uint64_t sub_226A2C770()
{
  uint64_t result = sub_226A47DC0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_226A2C810(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_226A2C858()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for RuntimeLinker()
{
  return self;
}

uint64_t static SyncRecordType.encryptionKey.getter()
{
  return 0x6974707972636E45;
}

uint64_t static SyncRecordType.syncable.getter()
{
  return 0x656C6261636E7953;
}

ValueMetadata *type metadata accessor for SyncRecordType()
{
  return &type metadata for SyncRecordType;
}

uint64_t ScoreCacheProtobuf.lowerScores.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ScoreCacheProtobuf.lowerScores.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v1 = a1;
  return result;
}

uint64_t (*ScoreCacheProtobuf.lowerScores.modify())()
{
  return nullsub_1;
}

uint64_t ScoreCacheProtobuf.lowerMiddleScores.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ScoreCacheProtobuf.lowerMiddleScores.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 8) = a1;
  return result;
}

uint64_t (*ScoreCacheProtobuf.lowerMiddleScores.modify())()
{
  return nullsub_1;
}

uint64_t ScoreCacheProtobuf.upperMiddleScores.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ScoreCacheProtobuf.upperMiddleScores.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 16) = a1;
  return result;
}

uint64_t (*ScoreCacheProtobuf.upperMiddleScores.modify())()
{
  return nullsub_1;
}

uint64_t ScoreCacheProtobuf.upperScores.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ScoreCacheProtobuf.upperScores.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 24) = a1;
  return result;
}

uint64_t (*ScoreCacheProtobuf.upperScores.modify())()
{
  return nullsub_1;
}

uint64_t ScoreCacheProtobuf.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ScoreCacheProtobuf() + 32);
  uint64_t v4 = sub_226A47DC0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for ScoreCacheProtobuf()
{
  uint64_t result = qword_26814C210;
  if (!qword_26814C210) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t ScoreCacheProtobuf.unknownFields.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ScoreCacheProtobuf() + 32);
  uint64_t v4 = sub_226A47DC0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40);

  return v5(v3, a1, v4);
}

uint64_t (*ScoreCacheProtobuf.unknownFields.modify())()
{
  return nullsub_1;
}

uint64_t ScoreCacheProtobuf.init()@<X0>(void *a1@<X8>)
{
  uint64_t v2 = MEMORY[0x263F8EE78];
  *a1 = MEMORY[0x263F8EE78];
  a1[1] = v2;
  a1[2] = v2;
  a1[3] = v2;
  type metadata accessor for ScoreCacheProtobuf();
  return _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
}

unint64_t static ScoreCacheProtobuf.protoMessageName.getter()
{
  return 0xD000000000000012;
}

uint64_t sub_226A2CC0C()
{
  uint64_t v0 = sub_226A47FE0();
  __swift_allocate_value_buffer(v0, qword_26814C1D0);
  __swift_project_value_buffer(v0, (uint64_t)qword_26814C1D0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26814BFB0);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26814BFB8) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_226A49320;
  unint64_t v5 = v4 + v3;
  unint64_t v6 = v4 + v3 + v1[14];
  *(void *)(v4 + v3) = 1;
  *(void *)unint64_t v6 = "lowerScores";
  *(void *)(v6 + 8) = 11;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_226A47FB0();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = v5 + v2 + v1[14];
  *(void *)(v5 + v2) = 2;
  *(void *)unint64_t v10 = "lowerMiddleScores";
  *(void *)(v10 + 8) = 17;
  *(unsigned char *)(v10 + 16) = 2;
  v9();
  uint64_t v11 = (void *)(v5 + 2 * v2);
  uint64_t v12 = (char *)v11 + v1[14];
  *uint64_t v11 = 3;
  *(void *)uint64_t v12 = "upperMiddleScores";
  *((void *)v12 + 1) = 17;
  v12[16] = 2;
  v9();
  char v13 = (void *)(v5 + 3 * v2);
  char v14 = (char *)v13 + v1[14];
  *char v13 = 4;
  *(void *)char v14 = "upperScores";
  *((void *)v14 + 1) = 11;
  v14[16] = 2;
  v9();
  return sub_226A47FC0();
}

uint64_t static ScoreCacheProtobuf._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26814BEA8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_226A47FE0();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26814C1D0);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t ScoreCacheProtobuf.decodeMessage<A>(decoder:)()
{
  uint64_t result = sub_226A47E10();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 1:
        case 2:
        case 3:
        case 4:
          sub_226A47C80();
          sub_226A2E004(&qword_26814C1E8, MEMORY[0x263F69518]);
          sub_226A47EA0();
          break;
        default:
          break;
      }
      uint64_t result = sub_226A47E10();
    }
  }
  return result;
}

uint64_t ScoreCacheProtobuf.traverse<A>(visitor:)()
{
  if (!*(void *)(*v0 + 16)
    || (sub_226A47C80(), sub_226A2E004(&qword_26814C1E8, MEMORY[0x263F69518]), uint64_t result = sub_226A47F90(), !v1))
  {
    if (!*(void *)(v0[1] + 16)
      || (sub_226A47C80(), sub_226A2E004(&qword_26814C1E8, MEMORY[0x263F69518]), uint64_t result = sub_226A47F90(), !v1))
    {
      if (!*(void *)(v0[2] + 16)
        || (sub_226A47C80(), sub_226A2E004(&qword_26814C1E8, MEMORY[0x263F69518]), uint64_t result = sub_226A47F90(), !v1))
      {
        if (!*(void *)(v0[3] + 16)
          || (sub_226A47C80(), sub_226A2E004(&qword_26814C1E8, MEMORY[0x263F69518]), uint64_t result = sub_226A47F90(), !v1))
        {
          type metadata accessor for ScoreCacheProtobuf();
          return sub_226A47DA0();
        }
      }
    }
  }
  return result;
}

uint64_t ScoreCacheProtobuf.hashValue.getter()
{
  return sub_226A48130();
}

uint64_t sub_226A2D3D8@<X0>(void *a1@<X8>)
{
  uint64_t v1 = MEMORY[0x263F8EE78];
  *a1 = MEMORY[0x263F8EE78];
  a1[1] = v1;
  a1[2] = v1;
  a1[3] = v1;
  return _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
}

unint64_t sub_226A2D408()
{
  return 0xD000000000000012;
}

uint64_t sub_226A2D424()
{
  return ScoreCacheProtobuf.decodeMessage<A>(decoder:)();
}

uint64_t sub_226A2D43C()
{
  return ScoreCacheProtobuf.traverse<A>(visitor:)();
}

uint64_t sub_226A2D454(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_226A2E004(&qword_26814C220, (void (*)(uint64_t))type metadata accessor for ScoreCacheProtobuf);

  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_226A2D4D0@<X0>(uint64_t a1@<X8>)
{
  if (qword_26814BEA8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_226A47FE0();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26814C1D0);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_226A2D578(uint64_t a1)
{
  uint64_t v2 = sub_226A2E004(&qword_26814C200, (void (*)(uint64_t))type metadata accessor for ScoreCacheProtobuf);

  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_226A2D5E4()
{
  sub_226A2E004(&qword_26814C200, (void (*)(uint64_t))type metadata accessor for ScoreCacheProtobuf);

  return sub_226A47EE0();
}

uint64_t _s21SeymourServerProtocol18ScoreCacheProtobufV2eeoiySbAC_ACtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = sub_226A47DC0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  unint64_t v10 = (char *)&v16 - v9;
  if ((sub_226A422E4(*a1, *a2) & 1) != 0
    && (sub_226A422E4(a1[1], a2[1]) & 1) != 0
    && (sub_226A422E4(a1[2], a2[2]) & 1) != 0
    && (sub_226A422E4(a1[3], a2[3]) & 1) != 0)
  {
    uint64_t v11 = type metadata accessor for ScoreCacheProtobuf();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
    v12(v10, (char *)a1 + *(int *)(v11 + 32), v4);
    v12(v8, (char *)a2 + *(int *)(v11 + 32), v4);
    sub_226A2E004(&qword_26814BFA8, MEMORY[0x263F50560]);
    char v13 = sub_226A48010();
    char v14 = *(void (**)(char *, uint64_t))(v5 + 8);
    v14(v8, v4);
    v14(v10, v4);
  }
  else
  {
    char v13 = 0;
  }
  return v13 & 1;
}

uint64_t sub_226A2D84C()
{
  return sub_226A2E004(&qword_26814C1F8, (void (*)(uint64_t))type metadata accessor for ScoreCacheProtobuf);
}

uint64_t sub_226A2D894()
{
  return sub_226A2E004(&qword_26814C200, (void (*)(uint64_t))type metadata accessor for ScoreCacheProtobuf);
}

uint64_t sub_226A2D8DC()
{
  return sub_226A2E004(&qword_26814C1F0, (void (*)(uint64_t))type metadata accessor for ScoreCacheProtobuf);
}

uint64_t sub_226A2D924()
{
  return sub_226A2E004(&qword_26814C208, (void (*)(uint64_t))type metadata accessor for ScoreCacheProtobuf);
}

uint64_t *initializeBufferWithCopyOfBuffer for ScoreCacheProtobuf(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v6 = a2[2];
    a1[1] = a2[1];
    a1[2] = v6;
    a1[3] = a2[3];
    uint64_t v7 = *(int *)(a3 + 32);
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_226A47DC0();
    uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11(v8, v9, v10);
  }
  return v5;
}

uint64_t destroy for ScoreCacheProtobuf(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 32);
  uint64_t v5 = sub_226A47DC0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

void *initializeWithCopy for ScoreCacheProtobuf(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = *(int *)(a3 + 32);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_226A47DC0();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  return a1;
}

void *assignWithCopy for ScoreCacheProtobuf(void *a1, void *a2, uint64_t a3)
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
  uint64_t v6 = *(int *)(a3 + 32);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_226A47DC0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *initializeWithTake for ScoreCacheProtobuf(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 32);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_226A47DC0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

void *assignWithTake for ScoreCacheProtobuf(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 32);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_226A47DC0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for ScoreCacheProtobuf(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_226A2DDF8);
}

uint64_t sub_226A2DDF8(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_226A47DC0();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 32);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for ScoreCacheProtobuf(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_226A2DEBC);
}

void *sub_226A2DEBC(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_226A47DC0();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 32);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_226A2DF64()
{
  uint64_t result = sub_226A47DC0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_226A2E004(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t SubmitScoresRequestProtobuf.scores.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SubmitScoresRequestProtobuf.scores.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v1 = a1;
  return result;
}

uint64_t (*SubmitScoresRequestProtobuf.scores.modify())()
{
  return nullsub_1;
}

uint64_t SubmitScoresRequestProtobuf.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for SubmitScoresRequestProtobuf(0) + 20);
  uint64_t v4 = sub_226A47DC0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for SubmitScoresRequestProtobuf(uint64_t a1)
{
  return sub_226A1FDB8(a1, qword_26AD5A1C0);
}

uint64_t SubmitScoresRequestProtobuf.unknownFields.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for SubmitScoresRequestProtobuf(0) + 20);
  uint64_t v4 = sub_226A47DC0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40);

  return v5(v3, a1, v4);
}

uint64_t (*SubmitScoresRequestProtobuf.unknownFields.modify())()
{
  return nullsub_1;
}

uint64_t SubmitScoresRequestProtobuf.init()@<X0>(void *a1@<X8>)
{
  *a1 = MEMORY[0x263F8EE78];
  type metadata accessor for SubmitScoresRequestProtobuf(0);
  return _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
}

uint64_t (*SubmitScoresResponseProtobuf.accepted.modify())()
{
  return nullsub_1;
}

uint64_t SubmitScoresResponseProtobuf.rejected.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SubmitScoresResponseProtobuf.rejected.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 8) = a1;
  return result;
}

uint64_t (*SubmitScoresResponseProtobuf.rejected.modify())()
{
  return nullsub_1;
}

uint64_t SubmitScoresResponseProtobuf.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_226A2E46C(type metadata accessor for SubmitScoresResponseProtobuf, a1);
}

uint64_t type metadata accessor for SubmitScoresResponseProtobuf(uint64_t a1)
{
  return sub_226A1FDB8(a1, qword_26AD5A250);
}

uint64_t SubmitScoresResponseProtobuf.unknownFields.setter(uint64_t a1)
{
  return sub_226A2E524(a1, type metadata accessor for SubmitScoresResponseProtobuf);
}

uint64_t (*SubmitScoresResponseProtobuf.unknownFields.modify())()
{
  return nullsub_1;
}

uint64_t SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf.reason.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf.reason.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf.reason.modify())()
{
  return nullsub_1;
}

uint64_t SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf.score.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf.score.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf.score.modify())()
{
  return nullsub_1;
}

uint64_t SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_226A2E46C(type metadata accessor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf, a1);
}

uint64_t sub_226A2E46C@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1(0) + 24);
  uint64_t v5 = sub_226A47DC0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a2, v4, v5);
}

uint64_t type metadata accessor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf(uint64_t a1)
{
  return sub_226A1FDB8(a1, (uint64_t *)&unk_26814C2D8);
}

uint64_t SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf.unknownFields.setter(uint64_t a1)
{
  return sub_226A2E524(a1, type metadata accessor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf);
}

uint64_t sub_226A2E524(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v4 = v2 + *(int *)(a2(0) + 24);
  uint64_t v5 = sub_226A47DC0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);

  return v6(v4, a1, v5);
}

uint64_t (*SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf.unknownFields.modify())()
{
  return nullsub_1;
}

uint64_t SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf.init()@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0xE000000000000000;
  a1[2] = 0;
  a1[3] = 0xE000000000000000;
  type metadata accessor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf(0);
  return _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
}

uint64_t SubmitScoresResponseProtobuf.init()@<X0>(void *a1@<X8>)
{
  uint64_t v2 = MEMORY[0x263F8EE78];
  *a1 = MEMORY[0x263F8EE78];
  a1[1] = v2;
  type metadata accessor for SubmitScoresResponseProtobuf(0);
  return _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
}

unint64_t static SubmitScoresRequestProtobuf.protoMessageName.getter()
{
  return 0xD00000000000001BLL;
}

uint64_t sub_226A2E684()
{
  uint64_t v0 = sub_226A47FE0();
  __swift_allocate_value_buffer(v0, qword_26814C228);
  __swift_project_value_buffer(v0, (uint64_t)qword_26814C228);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26814BFB0);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26814BFB8) - 8);
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_226A483E0;
  unint64_t v4 = v3 + v2 + v1[14];
  *(void *)(v3 + v2) = 1;
  *(void *)unint64_t v4 = "scores";
  *(void *)(v4 + 8) = 6;
  *(unsigned char *)(v4 + 16) = 2;
  uint64_t v5 = *MEMORY[0x263F50718];
  uint64_t v6 = sub_226A47FB0();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 104))(v4, v5, v6);
  return sub_226A47FC0();
}

uint64_t static SubmitScoresRequestProtobuf._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_226A21AE8(&qword_26814BEB0, (uint64_t)qword_26814C228, a1);
}

uint64_t SubmitScoresRequestProtobuf.decodeMessage<A>(decoder:)()
{
  uint64_t result = sub_226A47E10();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (result == 1)
      {
        sub_226A47CB0();
        sub_226A2FE28(&qword_26814C270, MEMORY[0x263F6A588]);
        sub_226A47EA0();
      }
      uint64_t result = sub_226A47E10();
    }
  }
  return result;
}

uint64_t SubmitScoresRequestProtobuf.traverse<A>(visitor:)()
{
  if (!*(void *)(*(void *)v0 + 16)
    || (sub_226A47CB0(), sub_226A2FE28(&qword_26814C270, MEMORY[0x263F6A588]), uint64_t result = sub_226A47F90(), !v1))
  {
    type metadata accessor for SubmitScoresRequestProtobuf(0);
    return sub_226A47DA0();
  }
  return result;
}

uint64_t SubmitScoresRequestProtobuf.hashValue.getter()
{
  return sub_226A2F634((void (*)(void))type metadata accessor for SubmitScoresRequestProtobuf, &qword_26814C278, (void (*)(uint64_t))type metadata accessor for SubmitScoresRequestProtobuf);
}

unint64_t sub_226A2EA2C()
{
  return 0xD00000000000001BLL;
}

uint64_t sub_226A2EA48()
{
  return SubmitScoresRequestProtobuf.decodeMessage<A>(decoder:)();
}

uint64_t sub_226A2EA60()
{
  return SubmitScoresRequestProtobuf.traverse<A>(visitor:)();
}

uint64_t sub_226A2EA78(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_226A2FE28(&qword_26814C2F8, (void (*)(uint64_t))type metadata accessor for SubmitScoresRequestProtobuf);

  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_226A2EAF4@<X0>(uint64_t a1@<X8>)
{
  return sub_226A2234C(&qword_26814BEB0, (uint64_t)qword_26814C228, a1);
}

uint64_t sub_226A2EB18(uint64_t a1)
{
  uint64_t v2 = sub_226A2FE28(&qword_26814C2A0, (void (*)(uint64_t))type metadata accessor for SubmitScoresRequestProtobuf);

  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_226A2EB84()
{
  sub_226A2FE28(&qword_26814C2A0, (void (*)(uint64_t))type metadata accessor for SubmitScoresRequestProtobuf);

  return sub_226A47EE0();
}

unint64_t static SubmitScoresResponseProtobuf.protoMessageName.getter()
{
  return 0xD00000000000001CLL;
}

uint64_t sub_226A2EC20()
{
  uint64_t v0 = sub_226A47FE0();
  __swift_allocate_value_buffer(v0, qword_26814C240);
  __swift_project_value_buffer(v0, (uint64_t)qword_26814C240);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26814BFB0);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26814BFB8) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_226A483D0;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *uint64_t v5 = 1;
  *(void *)unint64_t v6 = "accepted";
  *(void *)(v6 + 8) = 8;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_226A47FB0();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  uint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)uint64_t v10 = "rejected";
  *((void *)v10 + 1) = 8;
  v10[16] = 2;
  v9();
  return sub_226A47FC0();
}

uint64_t static SubmitScoresResponseProtobuf._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_226A21AE8(&qword_26814BEB8, (uint64_t)qword_26814C240, a1);
}

uint64_t SubmitScoresResponseProtobuf.decodeMessage<A>(decoder:)()
{
  uint64_t result = sub_226A47E10();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (result == 2)
      {
        type metadata accessor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf(0);
        sub_226A2FE28(&qword_26814C280, (void (*)(uint64_t))type metadata accessor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf);
        sub_226A47EA0();
      }
      else if (result == 1)
      {
        sub_226A47E70();
      }
      uint64_t result = sub_226A47E10();
    }
  }
  return result;
}

uint64_t SubmitScoresResponseProtobuf.traverse<A>(visitor:)()
{
  if (!*(void *)(*v0 + 16) || (uint64_t result = sub_226A47F60(), !v1))
  {
    if (!*(void *)(v0[1] + 16)
      || (type metadata accessor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf(0),
          sub_226A2FE28(&qword_26814C280, (void (*)(uint64_t))type metadata accessor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf), uint64_t result = sub_226A47F90(), !v1))
    {
      type metadata accessor for SubmitScoresResponseProtobuf(0);
      return sub_226A47DA0();
    }
  }
  return result;
}

uint64_t SubmitScoresResponseProtobuf.hashValue.getter()
{
  return sub_226A2F634((void (*)(void))type metadata accessor for SubmitScoresResponseProtobuf, &qword_26814C288, (void (*)(uint64_t))type metadata accessor for SubmitScoresResponseProtobuf);
}

uint64_t sub_226A2F07C@<X0>(void *a1@<X8>)
{
  uint64_t v1 = MEMORY[0x263F8EE78];
  *a1 = MEMORY[0x263F8EE78];
  a1[1] = v1;
  return _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
}

unint64_t sub_226A2F0A8()
{
  return 0xD00000000000001CLL;
}

uint64_t sub_226A2F0C4()
{
  return SubmitScoresResponseProtobuf.decodeMessage<A>(decoder:)();
}

uint64_t sub_226A2F0DC()
{
  return SubmitScoresResponseProtobuf.traverse<A>(visitor:)();
}

uint64_t sub_226A2F0F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_226A2FE28(&qword_26814C2F0, (void (*)(uint64_t))type metadata accessor for SubmitScoresResponseProtobuf);

  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_226A2F170@<X0>(uint64_t a1@<X8>)
{
  return sub_226A2234C(&qword_26814BEB8, (uint64_t)qword_26814C240, a1);
}

uint64_t sub_226A2F194(uint64_t a1)
{
  uint64_t v2 = sub_226A2FE28(&qword_26814C2B8, (void (*)(uint64_t))type metadata accessor for SubmitScoresResponseProtobuf);

  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_226A2F200()
{
  sub_226A2FE28(&qword_26814C2B8, (void (*)(uint64_t))type metadata accessor for SubmitScoresResponseProtobuf);

  return sub_226A47EE0();
}

unint64_t static SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf.protoMessageName.getter()
{
  return 0xD00000000000003BLL;
}

uint64_t sub_226A2F29C()
{
  uint64_t v0 = sub_226A47FE0();
  __swift_allocate_value_buffer(v0, qword_26814C258);
  __swift_project_value_buffer(v0, (uint64_t)qword_26814C258);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26814BFB0);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26814BFB8) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_226A483D0;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *uint64_t v5 = 1;
  *(void *)unint64_t v6 = "reason";
  *(void *)(v6 + 8) = 6;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_226A47FB0();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  uint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)uint64_t v10 = "score";
  *((void *)v10 + 1) = 5;
  v10[16] = 2;
  v9();
  return sub_226A47FC0();
}

uint64_t static SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_226A21AE8(&qword_26814BEC0, (uint64_t)qword_26814C258, a1);
}

uint64_t SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf.decodeMessage<A>(decoder:)()
{
  uint64_t result = sub_226A47E10();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (result == 2 || result == 1) {
        sub_226A47E90();
      }
      uint64_t result = sub_226A47E10();
    }
  }
  return result;
}

uint64_t SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf.traverse<A>(visitor:)()
{
  unint64_t v2 = v0[1];
  uint64_t v3 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) == 0) {
    uint64_t v3 = *v0 & 0xFFFFFFFFFFFFLL;
  }
  if (!v3 || (uint64_t result = sub_226A47F80(), !v1))
  {
    unint64_t v5 = v0[3];
    uint64_t v6 = HIBYTE(v5) & 0xF;
    if ((v5 & 0x2000000000000000) == 0) {
      uint64_t v6 = v0[2] & 0xFFFFFFFFFFFFLL;
    }
    if (!v6 || (uint64_t result = sub_226A47F80(), !v1))
    {
      type metadata accessor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf(0);
      return sub_226A47DA0();
    }
  }
  return result;
}

uint64_t SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf.hashValue.getter()
{
  return sub_226A2F634((void (*)(void))type metadata accessor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf, &qword_26814C290, (void (*)(uint64_t))type metadata accessor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf);
}

uint64_t sub_226A2F634(void (*a1)(void), unint64_t *a2, void (*a3)(uint64_t))
{
  return sub_226A48130();
}

uint64_t sub_226A2F6BC@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0xE000000000000000;
  a1[2] = 0;
  a1[3] = 0xE000000000000000;
  return _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
}

unint64_t sub_226A2F6E8()
{
  return 0xD00000000000003BLL;
}

uint64_t sub_226A2F704()
{
  return SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf.decodeMessage<A>(decoder:)();
}

uint64_t sub_226A2F71C()
{
  return SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf.traverse<A>(visitor:)();
}

uint64_t sub_226A2F734(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_226A2FE28(&qword_26814C2E8, (void (*)(uint64_t))type metadata accessor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf);

  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_226A2F7B0@<X0>(uint64_t a1@<X8>)
{
  return sub_226A2234C(&qword_26814BEC0, (uint64_t)qword_26814C258, a1);
}

uint64_t sub_226A2F7D4(uint64_t a1)
{
  uint64_t v2 = sub_226A2FE28(&qword_26814C280, (void (*)(uint64_t))type metadata accessor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf);

  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_226A2F840()
{
  sub_226A2FE28(&qword_26814C280, (void (*)(uint64_t))type metadata accessor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf);

  return sub_226A47EE0();
}

uint64_t _s21SeymourServerProtocol28SubmitScoresResponseProtobufV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_226A47DC0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v16 - v9;
  if ((sub_226A40408(*(void **)a1, *(void **)a2) & 1) != 0
    && (sub_226A41BA8(*(void *)(a1 + 8), *(void *)(a2 + 8)) & 1) != 0)
  {
    uint64_t v11 = type metadata accessor for SubmitScoresResponseProtobuf(0);
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v12(v10, a1 + *(int *)(v11 + 24), v4);
    v12(v8, a2 + *(int *)(v11 + 24), v4);
    sub_226A2FE28(&qword_26814BFA8, MEMORY[0x263F50560]);
    char v13 = sub_226A48010();
    char v14 = *(void (**)(char *, uint64_t))(v5 + 8);
    v14(v8, v4);
    v14(v10, v4);
  }
  else
  {
    char v13 = 0;
  }
  return v13 & 1;
}

uint64_t _s21SeymourServerProtocol28SubmitScoresResponseProtobufV07Sessione9RejectionG0V2eeoiySbAE_AEtFZ_0(char *a1, char *a2)
{
  uint64_t v4 = sub_226A47DC0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v18 - v9;
  BOOL v11 = *(void *)a1 == *(void *)a2 && *((void *)a1 + 1) == *((void *)a2 + 1);
  if (v11 || (char v12 = 0, (sub_226A48090() & 1) != 0))
  {
    BOOL v13 = *((void *)a1 + 2) == *((void *)a2 + 2) && *((void *)a1 + 3) == *((void *)a2 + 3);
    if (v13 || (char v12 = 0, (sub_226A48090() & 1) != 0))
    {
      uint64_t v14 = type metadata accessor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf(0);
      uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
      v15(v10, &a1[*(int *)(v14 + 24)], v4);
      v15(v8, &a2[*(int *)(v14 + 24)], v4);
      sub_226A2FE28(&qword_26814BFA8, MEMORY[0x263F50560]);
      char v12 = sub_226A48010();
      uint64_t v16 = *(void (**)(char *, uint64_t))(v5 + 8);
      v16(v8, v4);
      v16(v10, v4);
    }
  }
  return v12 & 1;
}

uint64_t _s21SeymourServerProtocol27SubmitScoresRequestProtobufV2eeoiySbAC_ACtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = sub_226A47DC0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v16 - v9;
  if (sub_226A41E0C(*a1, *a2))
  {
    uint64_t v11 = type metadata accessor for SubmitScoresRequestProtobuf(0);
    char v12 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
    v12(v10, (char *)a1 + *(int *)(v11 + 20), v4);
    v12(v8, (char *)a2 + *(int *)(v11 + 20), v4);
    sub_226A2FE28(&qword_26814BFA8, MEMORY[0x263F50560]);
    char v13 = sub_226A48010();
    uint64_t v14 = *(void (**)(char *, uint64_t))(v5 + 8);
    v14(v8, v4);
    v14(v10, v4);
  }
  else
  {
    char v13 = 0;
  }
  return v13 & 1;
}

uint64_t sub_226A2FE28(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_226A2FE70()
{
  return sub_226A2FE28(&qword_26814C298, (void (*)(uint64_t))type metadata accessor for SubmitScoresRequestProtobuf);
}

uint64_t sub_226A2FEB8()
{
  return sub_226A2FE28(&qword_26814C2A0, (void (*)(uint64_t))type metadata accessor for SubmitScoresRequestProtobuf);
}

uint64_t sub_226A2FF00()
{
  return sub_226A2FE28(&qword_26814C278, (void (*)(uint64_t))type metadata accessor for SubmitScoresRequestProtobuf);
}

uint64_t sub_226A2FF48()
{
  return sub_226A2FE28(&qword_26814C2A8, (void (*)(uint64_t))type metadata accessor for SubmitScoresRequestProtobuf);
}

uint64_t sub_226A2FF90()
{
  return sub_226A2FE28(&qword_26814C2B0, (void (*)(uint64_t))type metadata accessor for SubmitScoresResponseProtobuf);
}

uint64_t sub_226A2FFD8()
{
  return sub_226A2FE28(&qword_26814C2B8, (void (*)(uint64_t))type metadata accessor for SubmitScoresResponseProtobuf);
}

uint64_t sub_226A30020()
{
  return sub_226A2FE28(&qword_26814C288, (void (*)(uint64_t))type metadata accessor for SubmitScoresResponseProtobuf);
}

uint64_t sub_226A30068()
{
  return sub_226A2FE28(&qword_26814C2C0, (void (*)(uint64_t))type metadata accessor for SubmitScoresResponseProtobuf);
}

uint64_t sub_226A300B0()
{
  return sub_226A2FE28(&qword_26814C2C8, (void (*)(uint64_t))type metadata accessor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf);
}

uint64_t sub_226A300F8()
{
  return sub_226A2FE28(&qword_26814C280, (void (*)(uint64_t))type metadata accessor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf);
}

uint64_t sub_226A30140()
{
  return sub_226A2FE28(&qword_26814C290, (void (*)(uint64_t))type metadata accessor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf);
}

uint64_t sub_226A30188()
{
  return sub_226A2FE28(&qword_26814C2D0, (void (*)(uint64_t))type metadata accessor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf);
}

uint64_t getEnumTagSinglePayload for SubmitScoresRequestProtobuf(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_226A301E4);
}

uint64_t sub_226A301E4(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_226A47DC0();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for SubmitScoresRequestProtobuf(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_226A302A8);
}

void *sub_226A302A8(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_226A47DC0();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for SubmitScoresResponseProtobuf(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v9 = sub_226A47DC0();
    uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v5;
}

uint64_t destroy for SubmitScoresResponseProtobuf(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_226A47DC0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

void *initializeWithCopy for SubmitScoresResponseProtobuf(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 24);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_226A47DC0();
  uint64_t v9 = *(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v9(v6, v7, v8);
  return a1;
}

void *assignWithCopy for SubmitScoresResponseProtobuf(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_226A47DC0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *initializeWithTake for SubmitScoresResponseProtobuf(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_226A47DC0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void *assignWithTake for SubmitScoresResponseProtobuf(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_226A47DC0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for SubmitScoresResponseProtobuf(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_226A3073C);
}

uint64_t sub_226A3073C(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_226A47DC0();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for SubmitScoresResponseProtobuf(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_226A30800);
}

void *sub_226A30800(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_226A47DC0();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 24);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_226A308A8()
{
  return sub_226A30DBC();
}

uint64_t *initializeBufferWithCopyOfBuffer for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *int v3 = *a2;
    int v3 = (uint64_t *)(v12 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    uint64_t v7 = *(int *)(a3 + 24);
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_226A47DC0();
    uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11(v8, v9, v10);
  }
  return v3;
}

uint64_t destroy for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_226A47DC0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

void *initializeWithCopy for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_226A47DC0();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  return a1;
}

void *assignWithCopy for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_226A47DC0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

void *assignWithTake for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_226A47DC0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_226A30C44);
}

uint64_t sub_226A30C44(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_226A47DC0();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_226A30D08);
}

uint64_t sub_226A30D08(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_226A47DC0();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 24);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_226A30DB0()
{
  return sub_226A30DBC();
}

uint64_t sub_226A30DBC()
{
  uint64_t result = sub_226A47DC0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t ServerError.init(wrapping:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  swift_getErrorValue();
  uint64_t v5 = sub_226A480C0();
  if (*(void *)(v5 + 16) && (unint64_t v6 = sub_226A31018(1635017060, 0xE400000000000000), (v7 & 1) != 0))
  {
    sub_226A31198(*(void *)(v5 + 56) + 32 * v6, (uint64_t)&v13);
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((void *)&v14 + 1))
  {
    if (swift_dynamicCast())
    {
      sub_226A1F594(v11, v12);
      sub_226A31144();
      sub_226A47D10();
      MEMORY[0x22A65F3D0](a1);
      uint64_t result = sub_226A1F5F0(v11, v12);
      if (v2) {
        return result;
      }
LABEL_12:
      char v9 = v14;
      *(_OWORD *)a2 = v13;
      *(unsigned char *)(a2 + 16) = v9;
      return result;
    }
  }
  else
  {
    sub_226A31090((uint64_t)&v13);
  }
  swift_getErrorValue();
  if (sub_226A480B0())
  {
    ServerError.init(wrapping:)(&v13);
    uint64_t result = MEMORY[0x22A65F3D0](a1);
    if (v2) {
      return result;
    }
    goto LABEL_12;
  }
  sub_226A310F0();
  swift_allocError();
  *(_OWORD *)uint64_t v10 = xmmword_226A49BA0;
  *(unsigned char *)(v10 + 16) = 10;
  swift_willThrow();
  return MEMORY[0x22A65F3D0](a1);
}

unint64_t sub_226A31018(uint64_t a1, uint64_t a2)
{
  sub_226A48110();
  sub_226A48020();
  uint64_t v4 = sub_226A48130();

  return sub_226A311F4(a1, a2, v4);
}

uint64_t sub_226A31090(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26814C300);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_226A310F0()
{
  unint64_t result = qword_26814C308;
  if (!qword_26814C308)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26814C308);
  }
  return result;
}

unint64_t sub_226A31144()
{
  unint64_t result = qword_26814C310;
  if (!qword_26814C310)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26814C310);
  }
  return result;
}

uint64_t sub_226A31198(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_226A311F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_226A48090() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        long long v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_226A48090() & 1) == 0);
    }
  }
  return v6;
}

uint64_t ServerError.hash(into:)(long long *a1)
{
  uint64_t v2 = *(void *)v1;
  switch(*(unsigned char *)(v1 + 16))
  {
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
      sub_226A48120();
      uint64_t result = sub_226A48020();
      break;
    case 0xA:
      uint64_t result = sub_226A48120();
      break;
    default:
      sub_226A48120();
      uint64_t result = sub_226A31964(a1, v2);
      break;
  }
  return result;
}

uint64_t sub_226A31444(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_226A47D60();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  v45 = (char *)&v34 - v10;
  uint64_t result = MEMORY[0x270FA5388](v9);
  long long v13 = (char *)&v34 - v12;
  if (a1 == a2) {
    return 1;
  }
  if (*(void *)(a1 + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v14 = 0;
  uint64_t v15 = *(void *)(a1 + 56);
  uint64_t v36 = a1;
  uint64_t v37 = a1 + 56;
  uint64_t v16 = 1 << *(unsigned char *)(a1 + 32);
  if (v16 < 64) {
    uint64_t v17 = ~(-1 << v16);
  }
  else {
    uint64_t v17 = -1;
  }
  unint64_t v18 = v17 & v15;
  int64_t v38 = (unint64_t)(v16 + 63) >> 6;
  uint64_t v42 = v5 + 32;
  uint64_t v43 = a2 + 56;
  uint64_t v44 = v5 + 16;
  uint64_t v19 = (void (**)(char *, uint64_t))(v5 + 8);
  v34 = v13;
  uint64_t v35 = v5;
  if (!v18) {
    goto LABEL_9;
  }
LABEL_7:
  uint64_t v40 = (v18 - 1) & v18;
  int64_t v41 = v14;
  for (unint64_t i = __clz(__rbit64(v18)) | (v14 << 6); ; unint64_t i = __clz(__rbit64(v22)) + (v23 << 6))
  {
    uint64_t v25 = *(void *)(v5 + 72);
    uint64_t v26 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    v26(v13, *(void *)(a1 + 48) + v25 * i, v4);
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v45, v13, v4);
    sub_226A32468(&qword_26814C320);
    uint64_t v27 = sub_226A47FF0();
    uint64_t v28 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v29 = v27 & ~v28;
    if (((*(void *)(v43 + ((v29 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v29) & 1) == 0)
    {
      (*v19)(v45, v4);
      return 0;
    }
    uint64_t v39 = (unint64_t)v19 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    uint64_t v30 = a2;
    uint64_t v31 = ~v28;
    while (1)
    {
      v26(v8, *(void *)(v30 + 48) + v29 * v25, v4);
      sub_226A32468(&qword_26814C328);
      char v32 = sub_226A48010();
      uint64_t v33 = *v19;
      (*v19)(v8, v4);
      if (v32) {
        break;
      }
      unint64_t v29 = (v29 + 1) & v31;
      if (((*(void *)(v43 + ((v29 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v29) & 1) == 0)
      {
        v33(v45, v4);
        return 0;
      }
    }
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v33)(v45, v4);
    a2 = v30;
    uint64_t v5 = v35;
    a1 = v36;
    long long v13 = v34;
    unint64_t v18 = v40;
    int64_t v14 = v41;
    if (v40) {
      goto LABEL_7;
    }
LABEL_9:
    int64_t v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
      __break(1u);
      goto LABEL_35;
    }
    if (v21 >= v38) {
      return 1;
    }
    unint64_t v22 = *(void *)(v37 + 8 * v21);
    int64_t v23 = v14 + 1;
    if (!v22)
    {
      int64_t v23 = v14 + 2;
      if (v14 + 2 >= v38) {
        return 1;
      }
      unint64_t v22 = *(void *)(v37 + 8 * v23);
      if (!v22)
      {
        int64_t v23 = v14 + 3;
        if (v14 + 3 >= v38) {
          return 1;
        }
        unint64_t v22 = *(void *)(v37 + 8 * v23);
        if (!v22)
        {
          int64_t v23 = v14 + 4;
          if (v14 + 4 >= v38) {
            return 1;
          }
          unint64_t v22 = *(void *)(v37 + 8 * v23);
          if (!v22) {
            break;
          }
        }
      }
    }
LABEL_24:
    uint64_t v40 = (v22 - 1) & v22;
    int64_t v41 = v23;
  }
  uint64_t v24 = v14 + 5;
  if (v14 + 5 >= v38) {
    return 1;
  }
  unint64_t v22 = *(void *)(v37 + 8 * v24);
  if (v22)
  {
    int64_t v23 = v14 + 5;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v23 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v23 >= v38) {
      return 1;
    }
    unint64_t v22 = *(void *)(v37 + 8 * v23);
    ++v24;
    if (v22) {
      goto LABEL_24;
    }
  }
LABEL_35:
  __break(1u);
  return result;
}

uint64_t ServerError.hashValue.getter()
{
  char v1 = *(unsigned char *)(v0 + 16);
  *(_OWORD *)&v3[9] = *(_OWORD *)v0;
  char v4 = v1;
  sub_226A48110();
  ServerError.hash(into:)((long long *)v3);
  return sub_226A48130();
}

uint64_t sub_226A318B4()
{
  char v1 = *(unsigned char *)(v0 + 16);
  *(_OWORD *)&v3[9] = *(_OWORD *)v0;
  char v4 = v1;
  sub_226A48110();
  ServerError.hash(into:)((long long *)v3);
  return sub_226A48130();
}

uint64_t sub_226A3190C()
{
  char v1 = *(unsigned char *)(v0 + 16);
  *(_OWORD *)&v3[9] = *(_OWORD *)v0;
  char v4 = v1;
  sub_226A48110();
  ServerError.hash(into:)((long long *)v3);
  return sub_226A48130();
}

uint64_t sub_226A31964(long long *a1, uint64_t a2)
{
  uint64_t v4 = sub_226A47D60();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *((void *)a1 + 8);
  long long v9 = a1[1];
  long long v29 = *a1;
  long long v30 = v9;
  long long v10 = a1[2];
  long long v11 = a1[3];
  v28[0] = a1;
  long long v31 = v10;
  long long v32 = v11;
  uint64_t v33 = v8;
  uint64_t v12 = sub_226A48130();
  uint64_t v13 = a2 + 56;
  uint64_t v14 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v15 = -1;
  if (v14 < 64) {
    uint64_t v15 = ~(-1 << v14);
  }
  unint64_t v16 = v15 & *(void *)(a2 + 56);
  int64_t v17 = (unint64_t)(v14 + 63) >> 6;
  v28[2] = v5 + 16;
  v28[3] = v12;
  v28[1] = v5 + 8;
  uint64_t v18 = a2;
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v20 = 0;
  int64_t v21 = 0;
  while (1)
  {
    if (v16)
    {
      unint64_t v22 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v23 = v22 | (v21 << 6);
      goto LABEL_5;
    }
    if (__OFADD__(v21++, 1)) {
      goto LABEL_19;
    }
    if (v21 >= v17)
    {
LABEL_17:
      swift_release();
      return sub_226A48120();
    }
    unint64_t v26 = *(void *)(v13 + 8 * v21);
    if (!v26) {
      break;
    }
LABEL_16:
    unint64_t v16 = (v26 - 1) & v26;
    unint64_t v23 = __clz(__rbit64(v26)) + (v21 << 6);
LABEL_5:
    (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v7, *(void *)(v18 + 48) + *(void *)(v5 + 72) * v23, v4);
    sub_226A32468(&qword_26814C320);
    uint64_t v24 = sub_226A47FF0();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    v20 ^= v24;
  }
  int64_t v27 = v21 + 1;
  if (v21 + 1 >= v17) {
    goto LABEL_17;
  }
  unint64_t v26 = *(void *)(v13 + 8 * v27);
  if (v26)
  {
    ++v21;
    goto LABEL_16;
  }
  while (1)
  {
    int64_t v21 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v21 >= v17) {
      goto LABEL_17;
    }
    unint64_t v26 = *(void *)(v13 + 8 * v21);
    ++v27;
    if (v26) {
      goto LABEL_16;
    }
  }
  __break(1u);
LABEL_19:
  __break(1u);
  return result;
}

uint64_t _s21SeymourServerProtocol0B5ErrorO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a1;
  uint64_t v2 = *(void *)(a1 + 8);
  char v4 = *(unsigned char *)(a1 + 16);
  uint64_t v6 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  int v7 = *(unsigned __int8 *)(a2 + 16);
  switch(v4)
  {
    case 1:
      if (v7 != 1) {
        goto LABEL_67;
      }
      sub_226A321C4(*(void *)a2, *(void *)(a2 + 8), 1);
      sub_226A321C4(v3, v2, 1);
      char v8 = sub_226A31444(v3, v6);
      sub_226A32238(v3, v2, 1);
      uint64_t v9 = v6;
      uint64_t v10 = v5;
      char v11 = 1;
      goto LABEL_12;
    case 2:
      if (v7 != 2) {
        goto LABEL_67;
      }
      sub_226A321C4(*(void *)a2, *(void *)(a2 + 8), 2);
      sub_226A321C4(v3, v2, 2);
      char v8 = sub_226A31444(v3, v6);
      sub_226A32238(v3, v2, 2);
      uint64_t v9 = v6;
      uint64_t v10 = v5;
      char v11 = 2;
      goto LABEL_12;
    case 3:
      if (v7 != 3) {
        goto LABEL_67;
      }
      sub_226A321C4(*(void *)a2, *(void *)(a2 + 8), 3);
      sub_226A321C4(v3, v2, 3);
      char v8 = sub_226A31444(v3, v6);
      sub_226A32238(v3, v2, 3);
      uint64_t v9 = v6;
      uint64_t v10 = v5;
      char v11 = 3;
      goto LABEL_12;
    case 4:
      if (v7 != 4) {
        goto LABEL_67;
      }
      sub_226A321C4(*(void *)a2, *(void *)(a2 + 8), 4);
      sub_226A321C4(v3, v2, 4);
      char v8 = sub_226A31444(v3, v6);
      sub_226A32238(v3, v2, 4);
      uint64_t v9 = v6;
      uint64_t v10 = v5;
      char v11 = 4;
      goto LABEL_12;
    case 5:
      if (v7 != 5) {
        goto LABEL_67;
      }
      if (v3 == v6 && v2 == v5) {
        char v14 = 1;
      }
      else {
        char v14 = sub_226A48090();
      }
      sub_226A321C4(v6, v5, 5);
      sub_226A321C4(v3, v2, 5);
      sub_226A32238(v3, v2, 5);
      sub_226A32238(v6, v5, 5);
      return v14 & 1;
    case 6:
      if (v7 != 6) {
        goto LABEL_67;
      }
      if (v3 == v6 && v2 == v5) {
        char v14 = 1;
      }
      else {
        char v14 = sub_226A48090();
      }
      sub_226A321C4(v6, v5, 6);
      sub_226A321C4(v3, v2, 6);
      sub_226A32238(v3, v2, 6);
      sub_226A32238(v6, v5, 6);
      return v14 & 1;
    case 7:
      if (v7 != 7) {
        goto LABEL_67;
      }
      if (v3 == v6 && v2 == v5) {
        char v14 = 1;
      }
      else {
        char v14 = sub_226A48090();
      }
      sub_226A321C4(v6, v5, 7);
      sub_226A321C4(v3, v2, 7);
      sub_226A32238(v3, v2, 7);
      sub_226A32238(v6, v5, 7);
      return v14 & 1;
    case 8:
      if (v7 != 8) {
        goto LABEL_67;
      }
      if (v3 == v6 && v2 == v5) {
        char v14 = 1;
      }
      else {
        char v14 = sub_226A48090();
      }
      sub_226A321C4(v6, v5, 8);
      sub_226A321C4(v3, v2, 8);
      sub_226A32238(v3, v2, 8);
      sub_226A32238(v6, v5, 8);
      return v14 & 1;
    case 9:
      if (v7 != 9) {
        goto LABEL_67;
      }
      if (v3 == v6 && v2 == v5) {
        char v14 = 1;
      }
      else {
        char v14 = sub_226A48090();
      }
      sub_226A321C4(v6, v5, 9);
      sub_226A321C4(v3, v2, 9);
      sub_226A32238(v3, v2, 9);
      sub_226A32238(v6, v5, 9);
      return v14 & 1;
    case 10:
      if (v3 | v2)
      {
        if (!(v3 ^ 1 | v2))
        {
          if (v7 == 10 && v6 == 1 && v5 == 0)
          {
            sub_226A32238(*(void *)a1, v2, 10);
            char v14 = 1;
            sub_226A32238(1, 0, 10);
            return v14 & 1;
          }
          goto LABEL_67;
        }
        if (v7 != 10 || v6 != 2 || v5 != 0)
        {
LABEL_67:
          sub_226A321C4(*(void *)a2, *(void *)(a2 + 8), v7);
          sub_226A321C4(v3, v2, v4);
          sub_226A32238(v3, v2, v4);
          sub_226A32238(v6, v5, v7);
          char v14 = 0;
          return v14 & 1;
        }
        sub_226A32238(*(void *)a1, v2, 10);
        uint64_t v22 = 2;
      }
      else
      {
        if (v7 != 10 || (v5 | v6) != 0) {
          goto LABEL_67;
        }
        sub_226A32238(*(void *)a1, v2, 10);
        uint64_t v22 = 0;
      }
      sub_226A32238(v22, 0, 10);
      char v14 = 1;
      return v14 & 1;
    default:
      if (*(unsigned char *)(a2 + 16)) {
        goto LABEL_67;
      }
      sub_226A321C4(*(void *)a2, *(void *)(a2 + 8), 0);
      sub_226A321C4(v3, v2, 0);
      char v8 = sub_226A31444(v3, v6);
      sub_226A32238(v3, v2, 0);
      uint64_t v9 = v6;
      uint64_t v10 = v5;
      char v11 = 0;
LABEL_12:
      sub_226A32238(v9, v10, v11);
      return v8 & 1;
  }
}

unint64_t sub_226A32168()
{
  unint64_t result = qword_26814C318;
  if (!qword_26814C318)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26814C318);
  }
  return result;
}

uint64_t sub_226A321C4(uint64_t a1, uint64_t a2, char a3)
{
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
      uint64_t result = swift_bridgeObjectRetain();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t destroy for ServerError(uint64_t a1)
{
  return sub_226A32238(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_226A32238(uint64_t a1, uint64_t a2, char a3)
{
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
      uint64_t result = swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t _s21SeymourServerProtocol11ServerErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_226A321C4(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for ServerError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_226A321C4(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_226A32238(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ServerError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_226A32238(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ServerError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xF6 && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 246);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 0xA) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ServerError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF5)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 246;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xF6) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xF6) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_226A32428(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 9u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 10);
  }
}

uint64_t sub_226A32440(uint64_t result, unsigned int a2)
{
  if (a2 >= 0xA)
  {
    *(void *)__n128 result = a2 - 10;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 10;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ServerError()
{
  return &type metadata for ServerError;
}

uint64_t sub_226A32468(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_226A47D60();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t SyncRecordChangesetProtobuf.init()@<X0>(void *a1@<X8>)
{
  uint64_t v2 = MEMORY[0x263F8EE78];
  *a1 = 0;
  a1[1] = v2;
  a1[2] = v2;
  type metadata accessor for SyncRecordChangesetProtobuf();
  return _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
}

uint64_t type metadata accessor for SyncRecordChangesetProtobuf()
{
  uint64_t result = qword_26AD5A6C0;
  if (!qword_26AD5A6C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

double SyncRecordChangesetProtobuf.timestamp.getter()
{
  return *(double *)v0;
}

void SyncRecordChangesetProtobuf.timestamp.setter(double a1)
{
  double *v1 = a1;
}

uint64_t (*SyncRecordChangesetProtobuf.timestamp.modify())()
{
  return nullsub_1;
}

uint64_t SyncRecordChangesetProtobuf.inserted.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SyncRecordChangesetProtobuf.inserted.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 8) = a1;
  return result;
}

uint64_t (*SyncRecordChangesetProtobuf.inserted.modify())()
{
  return nullsub_1;
}

uint64_t SyncRecordChangesetProtobuf.deleted.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SyncRecordChangesetProtobuf.deleted.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 16) = a1;
  return result;
}

uint64_t (*SyncRecordChangesetProtobuf.deleted.modify())()
{
  return nullsub_1;
}

uint64_t SyncRecordChangesetProtobuf.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for SyncRecordChangesetProtobuf() + 28);
  uint64_t v4 = sub_226A47DC0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t SyncRecordChangesetProtobuf.unknownFields.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for SyncRecordChangesetProtobuf() + 28);
  uint64_t v4 = sub_226A47DC0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40);

  return v5(v3, a1, v4);
}

uint64_t (*SyncRecordChangesetProtobuf.unknownFields.modify())()
{
  return nullsub_1;
}

unint64_t static SyncRecordChangesetProtobuf.protoMessageName.getter()
{
  return 0xD00000000000001BLL;
}

uint64_t sub_226A32768()
{
  uint64_t v0 = sub_226A47FE0();
  __swift_allocate_value_buffer(v0, qword_26814C330);
  __swift_project_value_buffer(v0, (uint64_t)qword_26814C330);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26814BFB0);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26814BFB8) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_226A483F0;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *uint64_t v5 = 2;
  *(void *)unint64_t v6 = "timestamp";
  *(void *)(v6 + 8) = 9;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_226A47FB0();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  uint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 4;
  *(void *)uint64_t v10 = "inserted";
  *((void *)v10 + 1) = 8;
  v10[16] = 2;
  v9();
  uint64_t v11 = (uint64_t)v5 + 2 * v2 + v1[14];
  *(void *)((char *)v5 + 2 * v2) = 5;
  *(void *)uint64_t v11 = "deleted";
  *(void *)(v11 + 8) = 7;
  *(unsigned char *)(v11 + 16) = 2;
  v9();
  return sub_226A47FC0();
}

uint64_t static SyncRecordChangesetProtobuf._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26814BEC8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_226A47FE0();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26814C330);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t SyncRecordChangesetProtobuf.decodeMessage<A>(decoder:)()
{
  uint64_t result = sub_226A47E10();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (result == 5 || result == 4)
      {
        sub_226A47D70();
        sub_226A33A54(&qword_26814C348, MEMORY[0x263F327D8]);
        sub_226A47EA0();
      }
      else if (result == 2)
      {
        sub_226A47E80();
      }
      uint64_t result = sub_226A47E10();
    }
  }
  return result;
}

uint64_t SyncRecordChangesetProtobuf.traverse<A>(visitor:)()
{
  if (!*v0 || (uint64_t result = sub_226A47F70(), !v1))
  {
    if (!*(void *)(v0[1] + 16)
      || (sub_226A47D70(), sub_226A33A54(&qword_26814C348, MEMORY[0x263F327D8]), uint64_t result = sub_226A47F90(), !v1))
    {
      if (!*(void *)(v0[2] + 16)
        || (sub_226A47D70(), sub_226A33A54(&qword_26814C348, MEMORY[0x263F327D8]), uint64_t result = sub_226A47F90(), !v1))
      {
        type metadata accessor for SyncRecordChangesetProtobuf();
        return sub_226A47DA0();
      }
    }
  }
  return result;
}

uint64_t SyncRecordChangesetProtobuf.hashValue.getter()
{
  return sub_226A48130();
}

uint64_t sub_226A32DA4@<X0>(void *a1@<X8>)
{
  uint64_t v1 = MEMORY[0x263F8EE78];
  *a1 = 0;
  a1[1] = v1;
  a1[2] = v1;
  return _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
}

unint64_t sub_226A32DD4()
{
  return 0xD00000000000001BLL;
}

uint64_t sub_226A32DF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 28);
  uint64_t v5 = sub_226A47DC0();
  unint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a2, v4, v5);
}

uint64_t sub_226A32E60(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + *(int *)(a2 + 28);
  uint64_t v5 = sub_226A47DC0();
  unint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);

  return v6(v4, a1, v5);
}

uint64_t (*sub_226A32ED0())()
{
  return nullsub_1;
}

uint64_t sub_226A32EF4()
{
  return SyncRecordChangesetProtobuf.decodeMessage<A>(decoder:)();
}

uint64_t sub_226A32F0C()
{
  return SyncRecordChangesetProtobuf.traverse<A>(visitor:)();
}

uint64_t sub_226A32F24(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_226A33A54(&qword_26814C360, (void (*)(uint64_t))type metadata accessor for SyncRecordChangesetProtobuf);

  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_226A32FA0@<X0>(uint64_t a1@<X8>)
{
  if (qword_26814BEC8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_226A47FE0();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26814C330);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_226A33048(uint64_t a1)
{
  uint64_t v2 = sub_226A33A54(&qword_26AD5A6B0, (void (*)(uint64_t))type metadata accessor for SyncRecordChangesetProtobuf);

  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_226A330B4()
{
  sub_226A33A54(&qword_26AD5A6B0, (void (*)(uint64_t))type metadata accessor for SyncRecordChangesetProtobuf);

  return sub_226A47EE0();
}

uint64_t _s21SeymourServerProtocol27SyncRecordChangesetProtobufV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_226A47DC0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v16 - v9;
  if (*(double *)a1 == *(double *)a2
    && (sub_226A3F91C(*(void *)(a1 + 8), *(void *)(a2 + 8)) & 1) != 0
    && (sub_226A3F91C(*(void *)(a1 + 16), *(void *)(a2 + 16)) & 1) != 0)
  {
    uint64_t v11 = type metadata accessor for SyncRecordChangesetProtobuf();
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v12(v10, a1 + *(int *)(v11 + 28), v4);
    v12(v8, a2 + *(int *)(v11 + 28), v4);
    sub_226A33A54(&qword_26814BFA8, MEMORY[0x263F50560]);
    char v13 = sub_226A48010();
    char v14 = *(void (**)(char *, uint64_t))(v5 + 8);
    v14(v8, v4);
    v14(v10, v4);
  }
  else
  {
    char v13 = 0;
  }
  return v13 & 1;
}

uint64_t sub_226A3330C()
{
  return sub_226A33A54(&qword_26AD5A6B8, (void (*)(uint64_t))type metadata accessor for SyncRecordChangesetProtobuf);
}

uint64_t sub_226A33354()
{
  return sub_226A33A54(&qword_26AD5A6B0, (void (*)(uint64_t))type metadata accessor for SyncRecordChangesetProtobuf);
}

uint64_t sub_226A3339C()
{
  return sub_226A33A54(&qword_26814C350, (void (*)(uint64_t))type metadata accessor for SyncRecordChangesetProtobuf);
}

uint64_t sub_226A333E4()
{
  return sub_226A33A54(&qword_26814C358, (void (*)(uint64_t))type metadata accessor for SyncRecordChangesetProtobuf);
}

uint64_t *initializeBufferWithCopyOfBuffer for SyncRecordChangesetProtobuf(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    a1[2] = a2[2];
    uint64_t v6 = *(int *)(a3 + 28);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = sub_226A47DC0();
    uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v3;
}

uint64_t destroy for SyncRecordChangesetProtobuf(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = sub_226A47DC0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

void *initializeWithCopy for SyncRecordChangesetProtobuf(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  uint64_t v5 = *(int *)(a3 + 28);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_226A47DC0();
  uint64_t v9 = *(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v9(v6, v7, v8);
  return a1;
}

void *assignWithCopy for SyncRecordChangesetProtobuf(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_226A47DC0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t initializeWithTake for SyncRecordChangesetProtobuf(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v4 = *(int *)(a3 + 28);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = sub_226A47DC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void *assignWithTake for SyncRecordChangesetProtobuf(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_226A47DC0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for SyncRecordChangesetProtobuf(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_226A3383C);
}

uint64_t sub_226A3383C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_226A47DC0();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for SyncRecordChangesetProtobuf(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_226A33900);
}

uint64_t sub_226A33900(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_226A47DC0();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_226A339A8()
{
  uint64_t result = sub_226A47DC0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_226A33A54(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t EncryptionKeyProofProtobuf.identifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t EncryptionKeyProofProtobuf.identifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*EncryptionKeyProofProtobuf.identifier.modify())()
{
  return nullsub_1;
}

uint64_t EncryptionKeyProofProtobuf.etag.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t EncryptionKeyProofProtobuf.etag.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*EncryptionKeyProofProtobuf.etag.modify())()
{
  return nullsub_1;
}

uint64_t EncryptionKeyProofProtobuf.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for EncryptionKeyProofProtobuf(0) + 24);
  uint64_t v4 = sub_226A47DC0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for EncryptionKeyProofProtobuf(uint64_t a1)
{
  return sub_226A1FDB8(a1, (uint64_t *)&unk_26814C488);
}

uint64_t EncryptionKeyProofProtobuf.unknownFields.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for EncryptionKeyProofProtobuf(0) + 24);
  uint64_t v4 = sub_226A47DC0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40);

  return v5(v3, a1, v4);
}

uint64_t (*EncryptionKeyProofProtobuf.unknownFields.modify())()
{
  return nullsub_1;
}

uint64_t EncryptionKeyProofProtobuf.init()@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0xE000000000000000;
  a1[2] = 0;
  a1[3] = 0xE000000000000000;
  type metadata accessor for EncryptionKeyProofProtobuf(0);
  return _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
}

uint64_t SubmitSyncChangesetRequestProtobuf.zoneChangesets.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SubmitSyncChangesetRequestProtobuf.zoneChangesets.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v1 = a1;
  return result;
}

uint64_t (*SubmitSyncChangesetRequestProtobuf.zoneChangesets.modify())()
{
  return nullsub_1;
}

uint64_t SubmitSyncChangesetRequestProtobuf.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_226A34C24(type metadata accessor for SubmitSyncChangesetRequestProtobuf, a1);
}

uint64_t type metadata accessor for SubmitSyncChangesetRequestProtobuf(uint64_t a1)
{
  return sub_226A1FDB8(a1, (uint64_t *)&unk_26814C498);
}

uint64_t SubmitSyncChangesetRequestProtobuf.unknownFields.setter(uint64_t a1)
{
  return sub_226A34CBC(a1, type metadata accessor for SubmitSyncChangesetRequestProtobuf);
}

uint64_t (*SubmitSyncChangesetRequestProtobuf.unknownFields.modify())()
{
  return nullsub_1;
}

uint64_t (*SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf.zone.modify())()
{
  return nullsub_1;
}

uint64_t SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf.key.getter@<X0>(void *a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26814C3E0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf(0);
  sub_226A3444C(v1 + *(int *)(v6 + 24), (uint64_t)v5, &qword_26814C3E0);
  uint64_t v7 = type metadata accessor for EncryptionKeyProofProtobuf(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v5, 1, v7) != 1) {
    return sub_226A344B0((uint64_t)v5, (uint64_t)a1, type metadata accessor for EncryptionKeyProofProtobuf);
  }
  *a1 = 0;
  a1[1] = 0xE000000000000000;
  a1[2] = 0;
  a1[3] = 0xE000000000000000;
  _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
  return sub_226A25428((uint64_t)v5, &qword_26814C3E0);
}

uint64_t type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf(uint64_t a1)
{
  return sub_226A1FDB8(a1, (uint64_t *)&unk_26814C4A8);
}

uint64_t sub_226A33F98@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26814C3E0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf(0);
  sub_226A3444C(a1 + *(int *)(v7 + 24), (uint64_t)v6, &qword_26814C3E0);
  uint64_t v8 = type metadata accessor for EncryptionKeyProofProtobuf(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v6, 1, v8) != 1) {
    return sub_226A344B0((uint64_t)v6, (uint64_t)a2, type metadata accessor for EncryptionKeyProofProtobuf);
  }
  *a2 = 0;
  a2[1] = 0xE000000000000000;
  a2[2] = 0;
  a2[3] = 0xE000000000000000;
  _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
  return sub_226A25428((uint64_t)v6, &qword_26814C3E0);
}

uint64_t SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf.key.setter(uint64_t a1)
{
  return sub_226A3532C(a1, type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf, &qword_26814C3E0, type metadata accessor for EncryptionKeyProofProtobuf, type metadata accessor for EncryptionKeyProofProtobuf);
}

void (*SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf.key.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  *uint64_t v3 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26814C3E0);
  uint64_t v5 = malloc(*(void *)(*(void *)(v4 - 8) + 64));
  v3[1] = v5;
  uint64_t v6 = type metadata accessor for EncryptionKeyProofProtobuf(0);
  v3[2] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = v7;
  v3[3] = v7;
  size_t v9 = *(void *)(v7 + 64);
  v3[4] = malloc(v9);
  uint64_t v10 = malloc(v9);
  v3[5] = v10;
  uint64_t v11 = *(int *)(type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf(0) + 24);
  *((_DWORD *)v3 + 12) = v11;
  sub_226A3444C(v1 + v11, (uint64_t)v5, &qword_26814C3E0);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v6) == 1)
  {
    *uint64_t v10 = 0;
    v10[1] = 0xE000000000000000;
    v10[2] = 0;
    v10[3] = 0xE000000000000000;
    _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
    sub_226A25428((uint64_t)v5, &qword_26814C3E0);
  }
  else
  {
    sub_226A344B0((uint64_t)v5, (uint64_t)v10, type metadata accessor for EncryptionKeyProofProtobuf);
  }
  return sub_226A34298;
}

void sub_226A34298(uint64_t a1, char a2)
{
}

BOOL SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf.hasKey.getter()
{
  return sub_226A356E0(&qword_26814C3E0, type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf, type metadata accessor for EncryptionKeyProofProtobuf);
}

Swift::Void __swiftcall SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf.clearKey()()
{
}

uint64_t SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf.recordChangeset.getter@<X0>(void *a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD5A6D0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf(0);
  sub_226A3444C(v1 + *(int *)(v6 + 28), (uint64_t)v5, &qword_26AD5A6D0);
  uint64_t v7 = type metadata accessor for SyncRecordChangesetProtobuf();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v5, 1, v7) != 1) {
    return sub_226A344B0((uint64_t)v5, (uint64_t)a1, (uint64_t (*)(void))type metadata accessor for SyncRecordChangesetProtobuf);
  }
  uint64_t v8 = MEMORY[0x263F8EE78];
  *a1 = 0;
  a1[1] = v8;
  a1[2] = v8;
  _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
  return sub_226A25428((uint64_t)v5, &qword_26AD5A6D0);
}

uint64_t sub_226A3444C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_226A344B0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_226A34518@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD5A6D0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf(0);
  sub_226A3444C(a1 + *(int *)(v7 + 28), (uint64_t)v6, &qword_26AD5A6D0);
  uint64_t v8 = type metadata accessor for SyncRecordChangesetProtobuf();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v6, 1, v8) != 1) {
    return sub_226A344B0((uint64_t)v6, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for SyncRecordChangesetProtobuf);
  }
  uint64_t v9 = MEMORY[0x263F8EE78];
  *a2 = 0;
  a2[1] = v9;
  a2[2] = v9;
  _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
  return sub_226A25428((uint64_t)v6, &qword_26AD5A6D0);
}

uint64_t sub_226A34648(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SyncRecordChangesetProtobuf();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_226A349D8(a1, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for SyncRecordChangesetProtobuf);
  uint64_t v8 = a2 + *(int *)(type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf(0) + 28);
  sub_226A25428(v8, &qword_26AD5A6D0);
  sub_226A344B0((uint64_t)v7, v8, (uint64_t (*)(void))type metadata accessor for SyncRecordChangesetProtobuf);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v5 + 56))(v8, 0, 1, v4);
}

uint64_t SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf.recordChangeset.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf(0) + 28);
  sub_226A25428(v3, &qword_26AD5A6D0);
  sub_226A344B0(a1, v3, (uint64_t (*)(void))type metadata accessor for SyncRecordChangesetProtobuf);
  uint64_t v4 = type metadata accessor for SyncRecordChangesetProtobuf();
  uint64_t v5 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(v3, 0, 1, v4);
}

void (*SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf.recordChangeset.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  *uint64_t v3 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD5A6D0);
  uint64_t v5 = malloc(*(void *)(*(void *)(v4 - 8) + 64));
  v3[1] = v5;
  uint64_t v6 = type metadata accessor for SyncRecordChangesetProtobuf();
  v3[2] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = v7;
  v3[3] = v7;
  size_t v9 = *(void *)(v7 + 64);
  v3[4] = malloc(v9);
  uint64_t v10 = malloc(v9);
  v3[5] = v10;
  uint64_t v11 = *(int *)(type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf(0) + 28);
  *((_DWORD *)v3 + 12) = v11;
  sub_226A3444C(v1 + v11, (uint64_t)v5, &qword_26AD5A6D0);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v6) == 1)
  {
    uint64_t v12 = MEMORY[0x263F8EE78];
    *uint64_t v10 = 0;
    v10[1] = v12;
    v10[2] = v12;
    _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
    sub_226A25428((uint64_t)v5, &qword_26AD5A6D0);
  }
  else
  {
    sub_226A344B0((uint64_t)v5, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for SyncRecordChangesetProtobuf);
  }
  return sub_226A349B8;
}

void sub_226A349B8(uint64_t a1, char a2)
{
}

uint64_t sub_226A349D8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_226A34A40(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

BOOL SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf.hasRecordChangeset.getter()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD5A6D0);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf(0);
  sub_226A3444C(v0 + *(int *)(v4 + 28), (uint64_t)v3, &qword_26AD5A6D0);
  uint64_t v5 = type metadata accessor for SyncRecordChangesetProtobuf();
  BOOL v6 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v3, 1, v5) != 1;
  sub_226A25428((uint64_t)v3, &qword_26AD5A6D0);
  return v6;
}

Swift::Void __swiftcall SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf.clearRecordChangeset()()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf(0) + 28);
  sub_226A25428(v1, &qword_26AD5A6D0);
  uint64_t v2 = type metadata accessor for SyncRecordChangesetProtobuf();
  uint64_t v3 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  v3(v1, 1, 1, v2);
}

uint64_t SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_226A34C24(type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf, a1);
}

uint64_t sub_226A34C24@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1(0) + 20);
  uint64_t v5 = sub_226A47DC0();
  BOOL v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a2, v4, v5);
}

uint64_t SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf.unknownFields.setter(uint64_t a1)
{
  return sub_226A34CBC(a1, type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf);
}

uint64_t sub_226A34CBC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v4 = v2 + *(int *)(a2(0) + 20);
  uint64_t v5 = sub_226A47DC0();
  BOOL v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);

  return v6(v4, a1, v5);
}

uint64_t (*SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf.unknownFields.modify())()
{
  return nullsub_1;
}

uint64_t SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf.init()@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0xE000000000000000;
  uint64_t v2 = type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf(0);
  _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
  uint64_t v3 = (char *)a1 + *(int *)(v2 + 24);
  uint64_t v4 = type metadata accessor for EncryptionKeyProofProtobuf(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  uint64_t v5 = (char *)a1 + *(int *)(v2 + 28);
  uint64_t v6 = type metadata accessor for SyncRecordChangesetProtobuf();
  uint64_t v7 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);

  return v7(v5, 1, 1, v6);
}

uint64_t SubmitSyncChangesetRequestProtobuf.init()@<X0>(void *a1@<X8>)
{
  return sub_226A359CC((void (*)(void))type metadata accessor for SubmitSyncChangesetRequestProtobuf, a1);
}

uint64_t (*SubmitSyncChangesetResponseProtobuf.zoneChangesets.modify())()
{
  return nullsub_1;
}

uint64_t SubmitSyncChangesetResponseProtobuf.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_226A34C24(type metadata accessor for SubmitSyncChangesetResponseProtobuf, a1);
}

uint64_t type metadata accessor for SubmitSyncChangesetResponseProtobuf(uint64_t a1)
{
  return sub_226A1FDB8(a1, (uint64_t *)&unk_26814C4C0);
}

uint64_t SubmitSyncChangesetResponseProtobuf.unknownFields.setter(uint64_t a1)
{
  return sub_226A34CBC(a1, type metadata accessor for SubmitSyncChangesetResponseProtobuf);
}

uint64_t (*SubmitSyncChangesetResponseProtobuf.unknownFields.modify())()
{
  return nullsub_1;
}

uint64_t (*SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.zone.modify())()
{
  return nullsub_1;
}

uint64_t SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.recordChangeset.getter@<X0>(void *a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD5A6D0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(0);
  sub_226A3444C(v1 + *(int *)(v6 + 24), (uint64_t)v5, &qword_26AD5A6D0);
  uint64_t v7 = type metadata accessor for SyncRecordChangesetProtobuf();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v5, 1, v7) != 1) {
    return sub_226A344B0((uint64_t)v5, (uint64_t)a1, (uint64_t (*)(void))type metadata accessor for SyncRecordChangesetProtobuf);
  }
  uint64_t v8 = MEMORY[0x263F8EE78];
  *a1 = 0;
  a1[1] = v8;
  a1[2] = v8;
  _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
  return sub_226A25428((uint64_t)v5, &qword_26AD5A6D0);
}

uint64_t type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(uint64_t a1)
{
  return sub_226A1FDB8(a1, (uint64_t *)&unk_26814C4D0);
}

uint64_t sub_226A350A0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD5A6D0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(0);
  sub_226A3444C(a1 + *(int *)(v7 + 24), (uint64_t)v6, &qword_26AD5A6D0);
  uint64_t v8 = type metadata accessor for SyncRecordChangesetProtobuf();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v6, 1, v8) != 1) {
    return sub_226A344B0((uint64_t)v6, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for SyncRecordChangesetProtobuf);
  }
  uint64_t v9 = MEMORY[0x263F8EE78];
  *a2 = 0;
  a2[1] = v9;
  a2[2] = v9;
  _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
  return sub_226A25428((uint64_t)v6, &qword_26AD5A6D0);
}

uint64_t sub_226A351D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void), uint64_t (*a6)(void), uint64_t (*a7)(void), uint64_t *a8)
{
  uint64_t v13 = a5(0);
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v19 - v15;
  sub_226A349D8(a1, (uint64_t)&v19 - v15, a6);
  uint64_t v17 = a2 + *(int *)(a7(0) + 24);
  sub_226A25428(v17, a8);
  sub_226A344B0((uint64_t)v16, v17, a6);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v14 + 56))(v17, 0, 1, v13);
}

uint64_t SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.recordChangeset.setter(uint64_t a1)
{
  return sub_226A3532C(a1, type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf, &qword_26AD5A6D0, (uint64_t (*)(void))type metadata accessor for SyncRecordChangesetProtobuf, (uint64_t (*)(void))type metadata accessor for SyncRecordChangesetProtobuf);
}

uint64_t sub_226A3532C(uint64_t a1, uint64_t (*a2)(void), uint64_t *a3, uint64_t (*a4)(void), uint64_t (*a5)(void))
{
  uint64_t v10 = v5 + *(int *)(a2(0) + 24);
  sub_226A25428(v10, a3);
  sub_226A344B0(a1, v10, a4);
  uint64_t v11 = a5(0);
  uint64_t v12 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);

  return v12(v10, 0, 1, v11);
}

void (*SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.recordChangeset.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  *uint64_t v3 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD5A6D0);
  uint64_t v5 = malloc(*(void *)(*(void *)(v4 - 8) + 64));
  v3[1] = v5;
  uint64_t v6 = type metadata accessor for SyncRecordChangesetProtobuf();
  v3[2] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = v7;
  v3[3] = v7;
  size_t v9 = *(void *)(v7 + 64);
  v3[4] = malloc(v9);
  uint64_t v10 = malloc(v9);
  v3[5] = v10;
  uint64_t v11 = *(int *)(type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(0) + 24);
  *((_DWORD *)v3 + 12) = v11;
  sub_226A3444C(v1 + v11, (uint64_t)v5, &qword_26AD5A6D0);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v6) == 1)
  {
    uint64_t v12 = MEMORY[0x263F8EE78];
    *uint64_t v10 = 0;
    v10[1] = v12;
    v10[2] = v12;
    _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
    sub_226A25428((uint64_t)v5, &qword_26AD5A6D0);
  }
  else
  {
    sub_226A344B0((uint64_t)v5, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for SyncRecordChangesetProtobuf);
  }
  return sub_226A349B8;
}

void sub_226A35588(uint64_t a1, char a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(int *)(*(void *)a1 + 48);
  uint64_t v8 = *(void **)(*(void *)a1 + 32);
  size_t v9 = *(void **)(*(void *)a1 + 40);
  uint64_t v10 = *(void *)(*(void *)a1 + 16);
  uint64_t v11 = *(void *)(*(void *)a1 + 24);
  uint64_t v12 = *(void **)(*(void *)a1 + 8);
  uint64_t v13 = **(void **)a1 + v7;
  if (a2)
  {
    sub_226A349D8(*(void *)(*(void *)a1 + 40), (uint64_t)v8, a4);
    sub_226A25428(v13, a3);
    sub_226A344B0((uint64_t)v8, v13, a4);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v11 + 56))(v13, 0, 1, v10);
    sub_226A34A40((uint64_t)v9, a4);
  }
  else
  {
    sub_226A25428(**(void **)a1 + v7, a3);
    sub_226A344B0((uint64_t)v9, v13, a4);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v11 + 56))(v13, 0, 1, v10);
  }
  free(v9);
  free(v8);
  free(v12);

  free(v6);
}

BOOL SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.hasRecordChangeset.getter()
{
  return sub_226A356E0(&qword_26AD5A6D0, type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf, (uint64_t (*)(void))type metadata accessor for SyncRecordChangesetProtobuf);
}

BOOL sub_226A356E0(uint64_t *a1, uint64_t (*a2)(void), uint64_t (*a3)(void))
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(a1);
  MEMORY[0x270FA5388](v7 - 8);
  size_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = a2(0);
  sub_226A3444C(v3 + *(int *)(v10 + 24), (uint64_t)v9, a1);
  uint64_t v11 = a3(0);
  BOOL v12 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48))(v9, 1, v11) != 1;
  sub_226A25428((uint64_t)v9, a1);
  return v12;
}

Swift::Void __swiftcall SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.clearRecordChangeset()()
{
}

uint64_t sub_226A35808(uint64_t (*a1)(void), uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t v6 = v3 + *(int *)(a1(0) + 24);
  sub_226A25428(v6, a2);
  uint64_t v7 = a3(0);
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);

  return v8(v6, 1, 1, v7);
}

uint64_t SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_226A34C24(type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf, a1);
}

uint64_t SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.unknownFields.setter(uint64_t a1)
{
  return sub_226A34CBC(a1, type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);
}

uint64_t (*SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.unknownFields.modify())()
{
  return nullsub_1;
}

uint64_t SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.init()@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0xE000000000000000;
  uint64_t v2 = type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(0);
  _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
  uint64_t v3 = (char *)a1 + *(int *)(v2 + 24);
  uint64_t v4 = type metadata accessor for SyncRecordChangesetProtobuf();
  uint64_t v5 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(v3, 1, 1, v4);
}

uint64_t SubmitSyncChangesetResponseProtobuf.init()@<X0>(void *a1@<X8>)
{
  return sub_226A359CC((void (*)(void))type metadata accessor for SubmitSyncChangesetResponseProtobuf, a1);
}

uint64_t sub_226A359CC@<X0>(void (*a1)(void)@<X0>, void *a2@<X8>)
{
  *a2 = MEMORY[0x263F8EE78];
  a1(0);
  return _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
}

unint64_t static EncryptionKeyProofProtobuf.protoMessageName.getter()
{
  return 0xD00000000000001ALL;
}

uint64_t sub_226A35A30()
{
  uint64_t v0 = sub_226A47FE0();
  __swift_allocate_value_buffer(v0, qword_26814C368);
  __swift_project_value_buffer(v0, (uint64_t)qword_26814C368);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26814BFB0);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26814BFB8) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_226A483D0;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *uint64_t v5 = 1;
  *(void *)unint64_t v6 = "identifier";
  *(void *)(v6 + 8) = 10;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_226A47FB0();
  size_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  uint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)uint64_t v10 = "etag";
  *((void *)v10 + 1) = 4;
  v10[16] = 2;
  v9();
  return sub_226A47FC0();
}

uint64_t static EncryptionKeyProofProtobuf._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_226A21AE8(&qword_26814BED0, (uint64_t)qword_26814C368, a1);
}

uint64_t EncryptionKeyProofProtobuf.decodeMessage<A>(decoder:)()
{
  uint64_t result = sub_226A47E10();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (result == 2 || result == 1) {
        sub_226A47E90();
      }
      uint64_t result = sub_226A47E10();
    }
  }
  return result;
}

uint64_t EncryptionKeyProofProtobuf.traverse<A>(visitor:)()
{
  unint64_t v2 = v0[1];
  uint64_t v3 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) == 0) {
    uint64_t v3 = *v0 & 0xFFFFFFFFFFFFLL;
  }
  if (!v3 || (uint64_t result = sub_226A47F80(), !v1))
  {
    unint64_t v5 = v0[3];
    uint64_t v6 = HIBYTE(v5) & 0xF;
    if ((v5 & 0x2000000000000000) == 0) {
      uint64_t v6 = v0[2] & 0xFFFFFFFFFFFFLL;
    }
    if (!v6 || (uint64_t result = sub_226A47F80(), !v1))
    {
      type metadata accessor for EncryptionKeyProofProtobuf(0);
      return sub_226A47DA0();
    }
  }
  return result;
}

uint64_t EncryptionKeyProofProtobuf.hashValue.getter()
{
  return sub_226A37CDC((void (*)(void))type metadata accessor for EncryptionKeyProofProtobuf, &qword_26814C3E8, (void (*)(uint64_t))type metadata accessor for EncryptionKeyProofProtobuf);
}

unint64_t sub_226A35DC8()
{
  return 0xD00000000000001ALL;
}

uint64_t sub_226A35DE4()
{
  return EncryptionKeyProofProtobuf.decodeMessage<A>(decoder:)();
}

uint64_t sub_226A35DFC()
{
  return EncryptionKeyProofProtobuf.traverse<A>(visitor:)();
}

uint64_t sub_226A35E14(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_226A39220(&qword_26814C500, (void (*)(uint64_t))type metadata accessor for EncryptionKeyProofProtobuf);

  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_226A35E90@<X0>(uint64_t a1@<X8>)
{
  return sub_226A2234C(&qword_26814BED0, (uint64_t)qword_26814C368, a1);
}

uint64_t sub_226A35EB4(uint64_t a1)
{
  uint64_t v2 = sub_226A39220(&qword_26814C428, (void (*)(uint64_t))type metadata accessor for EncryptionKeyProofProtobuf);

  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_226A35F20()
{
  sub_226A39220(&qword_26814C428, (void (*)(uint64_t))type metadata accessor for EncryptionKeyProofProtobuf);

  return sub_226A47EE0();
}

unint64_t static SubmitSyncChangesetRequestProtobuf.protoMessageName.getter()
{
  return 0xD000000000000022;
}

uint64_t sub_226A35FBC(uint64_t a1)
{
  return sub_226A37028(a1, qword_26814C380);
}

uint64_t static SubmitSyncChangesetRequestProtobuf._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_226A21AE8(&qword_26814BED8, (uint64_t)qword_26814C380, a1);
}

uint64_t SubmitSyncChangesetRequestProtobuf.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_226A37200(a1, a2, a3, (void (*)(void))type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf, &qword_26814C3F0, (void (*)(uint64_t))type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf);
}

uint64_t SubmitSyncChangesetRequestProtobuf.traverse<A>(visitor:)()
{
  if (!*(void *)(*(void *)v0 + 16)
    || (type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf(0),
        sub_226A39220(&qword_26814C3F0, (void (*)(uint64_t))type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf), uint64_t result = sub_226A47F90(), !v1))
  {
    type metadata accessor for SubmitSyncChangesetRequestProtobuf(0);
    return sub_226A47DA0();
  }
  return result;
}

uint64_t static SubmitSyncChangesetRequestProtobuf.== infix(_:_:)(char *a1, char *a2)
{
  return sub_226A384F4(a1, a2, sub_226A40268, type metadata accessor for SubmitSyncChangesetRequestProtobuf) & 1;
}

uint64_t SubmitSyncChangesetRequestProtobuf.hashValue.getter()
{
  return sub_226A37CDC((void (*)(void))type metadata accessor for SubmitSyncChangesetRequestProtobuf, &qword_26814C3F8, (void (*)(uint64_t))type metadata accessor for SubmitSyncChangesetRequestProtobuf);
}

unint64_t sub_226A361C0()
{
  return 0xD000000000000022;
}

uint64_t sub_226A361DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return SubmitSyncChangesetRequestProtobuf.decodeMessage<A>(decoder:)(a1, a2, a3);
}

uint64_t sub_226A361F4()
{
  return SubmitSyncChangesetRequestProtobuf.traverse<A>(visitor:)();
}

uint64_t sub_226A3620C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_226A39220(&qword_26814C4F8, (void (*)(uint64_t))type metadata accessor for SubmitSyncChangesetRequestProtobuf);

  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_226A36288@<X0>(uint64_t a1@<X8>)
{
  return sub_226A2234C(&qword_26814BED8, (uint64_t)qword_26814C380, a1);
}

uint64_t sub_226A362AC(uint64_t a1)
{
  uint64_t v2 = sub_226A39220(&qword_26814C440, (void (*)(uint64_t))type metadata accessor for SubmitSyncChangesetRequestProtobuf);

  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_226A36318()
{
  sub_226A39220(&qword_26814C440, (void (*)(uint64_t))type metadata accessor for SubmitSyncChangesetRequestProtobuf);

  return sub_226A47EE0();
}

uint64_t sub_226A36394(char *a1, char *a2)
{
  return sub_226A384F4(a1, a2, sub_226A40268, type metadata accessor for SubmitSyncChangesetRequestProtobuf) & 1;
}

unint64_t static SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf.protoMessageName.getter()
{
  return 0xD000000000000038;
}

uint64_t sub_226A363F4()
{
  uint64_t v0 = sub_226A47FE0();
  __swift_allocate_value_buffer(v0, qword_26814C398);
  __swift_project_value_buffer(v0, (uint64_t)qword_26814C398);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26814BFB0);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26814BFB8) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_226A483F0;
  unint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *unint64_t v5 = 1;
  *(void *)unint64_t v6 = "zone";
  *(void *)(v6 + 8) = 4;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_226A47FB0();
  size_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  uint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)uint64_t v10 = "key";
  *((void *)v10 + 1) = 3;
  v10[16] = 2;
  v9();
  uint64_t v11 = (uint64_t)v5 + 2 * v2 + v1[14];
  *(void *)((char *)v5 + 2 * v2) = 3;
  *(void *)uint64_t v11 = "recordChangeset";
  *(void *)(v11 + 8) = 15;
  *(unsigned char *)(v11 + 16) = 2;
  v9();
  return sub_226A47FC0();
}

uint64_t static SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_226A21AE8(&qword_26814BEE0, (uint64_t)qword_26814C398, a1);
}

uint64_t SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf.decodeMessage<A>(decoder:)()
{
  while (1)
  {
    uint64_t result = sub_226A47E10();
    if (v0 || (v2 & 1) != 0) {
      break;
    }
    switch(result)
    {
      case 3:
        sub_226A3677C();
        break;
      case 2:
        sub_226A366CC();
        break;
      case 1:
        sub_226A47E90();
        break;
    }
  }
  return result;
}

uint64_t sub_226A366CC()
{
  return sub_226A47EB0();
}

uint64_t sub_226A3677C()
{
  return sub_226A47EB0();
}

uint64_t SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v8 = v3[1];
  uint64_t v9 = HIBYTE(v8) & 0xF;
  if ((v8 & 0x2000000000000000) == 0) {
    uint64_t v9 = *v3 & 0xFFFFFFFFFFFFLL;
  }
  if (!v9 || (uint64_t result = sub_226A47F80(), !v4))
  {
    uint64_t result = sub_226A36910((uint64_t)v3, a1, a2, a3);
    if (!v4)
    {
      sub_226A36B08((uint64_t)v3, a1, a2, a3);
      type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf(0);
      return sub_226A47DA0();
    }
  }
  return result;
}

uint64_t sub_226A36910(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v14[1] = a4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26814C3E0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for EncryptionKeyProofProtobuf(0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf(0);
  sub_226A3444C(a1 + *(int *)(v12 + 24), (uint64_t)v7, &qword_26814C3E0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1) {
    return sub_226A25428((uint64_t)v7, &qword_26814C3E0);
  }
  sub_226A344B0((uint64_t)v7, (uint64_t)v11, type metadata accessor for EncryptionKeyProofProtobuf);
  sub_226A39220(&qword_26814C428, (void (*)(uint64_t))type metadata accessor for EncryptionKeyProofProtobuf);
  sub_226A47FA0();
  return sub_226A34A40((uint64_t)v11, type metadata accessor for EncryptionKeyProofProtobuf);
}

uint64_t sub_226A36B08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v14[1] = a4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD5A6D0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for SyncRecordChangesetProtobuf();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf(0);
  sub_226A3444C(a1 + *(int *)(v12 + 28), (uint64_t)v7, &qword_26AD5A6D0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1) {
    return sub_226A25428((uint64_t)v7, &qword_26AD5A6D0);
  }
  sub_226A344B0((uint64_t)v7, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for SyncRecordChangesetProtobuf);
  sub_226A39220(&qword_26AD5A6B0, (void (*)(uint64_t))type metadata accessor for SyncRecordChangesetProtobuf);
  sub_226A47FA0();
  return sub_226A34A40((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for SyncRecordChangesetProtobuf);
}

uint64_t SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf.hashValue.getter()
{
  return sub_226A37CDC((void (*)(void))type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf, &qword_26814C400, (void (*)(uint64_t))type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf);
}

uint64_t sub_226A36D4C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0xE000000000000000;
  _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
  uint64_t v4 = (char *)a2 + *(int *)(a1 + 24);
  uint64_t v5 = type metadata accessor for EncryptionKeyProofProtobuf(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  uint64_t v6 = (char *)a2 + *(int *)(a1 + 28);
  uint64_t v7 = type metadata accessor for SyncRecordChangesetProtobuf();
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);

  return v8(v6, 1, 1, v7);
}

unint64_t sub_226A36E28()
{
  return 0xD000000000000038;
}

uint64_t sub_226A36E44()
{
  return SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf.decodeMessage<A>(decoder:)();
}

uint64_t sub_226A36E5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t sub_226A36E74(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_226A39220(&qword_26814C4F0, (void (*)(uint64_t))type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf);

  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_226A36EF0@<X0>(uint64_t a1@<X8>)
{
  return sub_226A2234C(&qword_26814BEE0, (uint64_t)qword_26814C398, a1);
}

uint64_t sub_226A36F14(uint64_t a1)
{
  uint64_t v2 = sub_226A39220(&qword_26814C3F0, (void (*)(uint64_t))type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf);

  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_226A36F80()
{
  sub_226A39220(&qword_26814C3F0, (void (*)(uint64_t))type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf);

  return sub_226A47EE0();
}

unint64_t static SubmitSyncChangesetResponseProtobuf.protoMessageName.getter()
{
  return 0xD000000000000023;
}

uint64_t sub_226A3701C(uint64_t a1)
{
  return sub_226A37028(a1, qword_26814C3B0);
}

uint64_t sub_226A37028(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_226A47FE0();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26814BFB0);
  uint64_t v4 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26814BFB8) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(*(void *)v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v4 + 80);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_226A483E0;
  unint64_t v7 = v6 + v5 + v4[14];
  *(void *)(v6 + v5) = 1;
  *(void *)unint64_t v7 = "zoneChangesets";
  *(void *)(v7 + 8) = 14;
  *(unsigned char *)(v7 + 16) = 2;
  uint64_t v8 = *MEMORY[0x263F50718];
  uint64_t v9 = sub_226A47FB0();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 104))(v7, v8, v9);
  return sub_226A47FC0();
}

uint64_t static SubmitSyncChangesetResponseProtobuf._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_226A21AE8(&qword_26814BEE8, (uint64_t)qword_26814C3B0, a1);
}

uint64_t SubmitSyncChangesetResponseProtobuf.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_226A37200(a1, a2, a3, (void (*)(void))type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf, &qword_26814C408, (void (*)(uint64_t))type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);
}

uint64_t sub_226A37200(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void), unint64_t *a5, void (*a6)(uint64_t))
{
  uint64_t result = sub_226A47E10();
  if (!v6)
  {
    while ((v10 & 1) == 0)
    {
      if (result == 1)
      {
        a4(0);
        sub_226A39220(a5, a6);
        sub_226A47EA0();
      }
      uint64_t result = sub_226A47E10();
    }
  }
  return result;
}

uint64_t SubmitSyncChangesetResponseProtobuf.traverse<A>(visitor:)()
{
  if (!*(void *)(*(void *)v0 + 16)
    || (type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(0),
        sub_226A39220(&qword_26814C408, (void (*)(uint64_t))type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf), uint64_t result = sub_226A47F90(), !v1))
  {
    type metadata accessor for SubmitSyncChangesetResponseProtobuf(0);
    return sub_226A47DA0();
  }
  return result;
}

uint64_t static SubmitSyncChangesetResponseProtobuf.== infix(_:_:)(char *a1, char *a2)
{
  return sub_226A384F4(a1, a2, sub_226A3F964, type metadata accessor for SubmitSyncChangesetResponseProtobuf) & 1;
}

uint64_t SubmitSyncChangesetResponseProtobuf.hashValue.getter()
{
  return sub_226A37CDC((void (*)(void))type metadata accessor for SubmitSyncChangesetResponseProtobuf, &qword_26814C410, (void (*)(uint64_t))type metadata accessor for SubmitSyncChangesetResponseProtobuf);
}

unint64_t sub_226A37484()
{
  return 0xD000000000000023;
}

uint64_t sub_226A374A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return SubmitSyncChangesetResponseProtobuf.decodeMessage<A>(decoder:)(a1, a2, a3);
}

uint64_t sub_226A374B8()
{
  return SubmitSyncChangesetResponseProtobuf.traverse<A>(visitor:)();
}

uint64_t sub_226A374D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_226A39220(&qword_26814C4E8, (void (*)(uint64_t))type metadata accessor for SubmitSyncChangesetResponseProtobuf);

  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_226A3754C@<X0>(uint64_t a1@<X8>)
{
  return sub_226A2234C(&qword_26814BEE8, (uint64_t)qword_26814C3B0, a1);
}

uint64_t sub_226A37570(uint64_t a1)
{
  uint64_t v2 = sub_226A39220(&qword_26814C468, (void (*)(uint64_t))type metadata accessor for SubmitSyncChangesetResponseProtobuf);

  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_226A375DC()
{
  sub_226A39220(&qword_26814C468, (void (*)(uint64_t))type metadata accessor for SubmitSyncChangesetResponseProtobuf);

  return sub_226A47EE0();
}

uint64_t sub_226A37658(char *a1, char *a2)
{
  return sub_226A384F4(a1, a2, sub_226A3F964, type metadata accessor for SubmitSyncChangesetResponseProtobuf) & 1;
}

unint64_t static SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.protoMessageName.getter()
{
  return 0xD000000000000039;
}

uint64_t sub_226A376B8()
{
  uint64_t v0 = sub_226A47FE0();
  __swift_allocate_value_buffer(v0, qword_26814C3C8);
  __swift_project_value_buffer(v0, (uint64_t)qword_26814C3C8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26814BFB0);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26814BFB8) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_226A483D0;
  unint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *unint64_t v5 = 1;
  *(void *)unint64_t v6 = "zone";
  *(void *)(v6 + 8) = 4;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_226A47FB0();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  char v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)char v10 = "recordChangeset";
  *((void *)v10 + 1) = 15;
  v10[16] = 2;
  v9();
  return sub_226A47FC0();
}

uint64_t static SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_226A21AE8(&qword_26814BEF0, (uint64_t)qword_26814C3C8, a1);
}

uint64_t SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.decodeMessage<A>(decoder:)()
{
  while (1)
  {
    uint64_t result = sub_226A47E10();
    if (v0 || (v2 & 1) != 0) {
      break;
    }
    if (result == 2)
    {
      sub_226A37924();
    }
    else if (result == 1)
    {
      sub_226A47E90();
    }
  }
  return result;
}

uint64_t sub_226A37924()
{
  return sub_226A47EB0();
}

uint64_t SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v8 = v3[1];
  uint64_t v9 = HIBYTE(v8) & 0xF;
  if ((v8 & 0x2000000000000000) == 0) {
    uint64_t v9 = *v3 & 0xFFFFFFFFFFFFLL;
  }
  if (!v9 || (uint64_t result = sub_226A47F80(), !v4))
  {
    uint64_t result = sub_226A37A98((uint64_t)v3, a1, a2, a3);
    if (!v4)
    {
      type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(0);
      return sub_226A47DA0();
    }
  }
  return result;
}

uint64_t sub_226A37A98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v14[1] = a4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD5A6D0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for SyncRecordChangesetProtobuf();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(0);
  sub_226A3444C(a1 + *(int *)(v12 + 24), (uint64_t)v7, &qword_26AD5A6D0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1) {
    return sub_226A25428((uint64_t)v7, &qword_26AD5A6D0);
  }
  sub_226A344B0((uint64_t)v7, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for SyncRecordChangesetProtobuf);
  sub_226A39220(&qword_26AD5A6B0, (void (*)(uint64_t))type metadata accessor for SyncRecordChangesetProtobuf);
  sub_226A47FA0();
  return sub_226A34A40((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for SyncRecordChangesetProtobuf);
}

uint64_t SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.hashValue.getter()
{
  return sub_226A37CDC((void (*)(void))type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf, &qword_26814C418, (void (*)(uint64_t))type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);
}

uint64_t sub_226A37CDC(void (*a1)(void), unint64_t *a2, void (*a3)(uint64_t))
{
  return sub_226A48130();
}

uint64_t sub_226A37D64@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0xE000000000000000;
  _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
  uint64_t v4 = (char *)a2 + *(int *)(a1 + 24);
  uint64_t v5 = type metadata accessor for SyncRecordChangesetProtobuf();
  uint64_t v6 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);

  return v6(v4, 1, 1, v5);
}

unint64_t sub_226A37DF0()
{
  return 0xD000000000000039;
}

uint64_t sub_226A37E0C()
{
  return SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.decodeMessage<A>(decoder:)();
}

uint64_t sub_226A37E24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t sub_226A37E3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_226A39220(&qword_26814C4E0, (void (*)(uint64_t))type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);

  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_226A37EB8@<X0>(uint64_t a1@<X8>)
{
  return sub_226A2234C(&qword_26814BEF0, (uint64_t)qword_26814C3C8, a1);
}

uint64_t sub_226A37EDC(uint64_t a1)
{
  uint64_t v2 = sub_226A39220(&qword_26814C408, (void (*)(uint64_t))type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);

  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_226A37F48()
{
  sub_226A39220(&qword_26814C408, (void (*)(uint64_t))type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);

  return sub_226A47EE0();
}

uint64_t _s21SeymourServerProtocol35SubmitSyncChangesetResponseProtobufV04ZonefH0V2eeoiySbAE_AEtFZ_0(char *a1, char *a2)
{
  uint64_t v4 = sub_226A47DC0();
  uint64_t v43 = *(void *)(v4 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v42 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  int64_t v41 = (char *)&v38 - v7;
  uint64_t v8 = type metadata accessor for SyncRecordChangesetProtobuf();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v40 = (uint64_t)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26814BFA0);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD5A6D0);
  uint64_t v15 = MEMORY[0x270FA5388](v14 - 8);
  uint64_t v17 = (char *)&v38 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  uint64_t v20 = (char *)&v38 - v19;
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v38 - v21;
  uint64_t v23 = *(void *)a1;
  uint64_t v24 = *((void *)a1 + 1);
  uint64_t v44 = a1;
  v45 = a2;
  if (v23 == *(void *)a2 && v24 == *((void *)a2 + 1) || (char v25 = 0, (sub_226A48090() & 1) != 0))
  {
    uint64_t v39 = v4;
    uint64_t v26 = type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(0);
    sub_226A3444C((uint64_t)&v44[*(int *)(v26 + 24)], (uint64_t)v22, &qword_26AD5A6D0);
    sub_226A3444C((uint64_t)&v45[*(int *)(v26 + 24)], (uint64_t)v20, &qword_26AD5A6D0);
    uint64_t v27 = (uint64_t)&v13[*(int *)(v11 + 48)];
    sub_226A3444C((uint64_t)v22, (uint64_t)v13, &qword_26AD5A6D0);
    sub_226A3444C((uint64_t)v20, v27, &qword_26AD5A6D0);
    uint64_t v28 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
    if (v28((uint64_t)v13, 1, v8) == 1)
    {
      sub_226A25428((uint64_t)v20, &qword_26AD5A6D0);
      sub_226A25428((uint64_t)v22, &qword_26AD5A6D0);
      if (v28(v27, 1, v8) == 1)
      {
        sub_226A25428((uint64_t)v13, &qword_26AD5A6D0);
LABEL_11:
        uint64_t v31 = v43;
        long long v32 = *(void (**)(char *, char *, uint64_t))(v43 + 16);
        uint64_t v33 = v41;
        uint64_t v34 = v39;
        v32(v41, &v44[*(int *)(v26 + 20)], v39);
        uint64_t v35 = v42;
        v32(v42, &v45[*(int *)(v26 + 20)], v34);
        sub_226A39220(&qword_26814BFA8, MEMORY[0x263F50560]);
        char v25 = sub_226A48010();
        uint64_t v36 = *(void (**)(char *, uint64_t))(v31 + 8);
        v36(v35, v34);
        v36(v33, v34);
        return v25 & 1;
      }
    }
    else
    {
      sub_226A3444C((uint64_t)v13, (uint64_t)v17, &qword_26AD5A6D0);
      if (v28(v27, 1, v8) != 1)
      {
        uint64_t v29 = v40;
        sub_226A344B0(v27, v40, (uint64_t (*)(void))type metadata accessor for SyncRecordChangesetProtobuf);
        char v30 = static SyncRecordChangesetProtobuf.== infix(_:_:)(v17, v29);
        sub_226A34A40(v29, (uint64_t (*)(void))type metadata accessor for SyncRecordChangesetProtobuf);
        sub_226A25428((uint64_t)v20, &qword_26AD5A6D0);
        sub_226A25428((uint64_t)v22, &qword_26AD5A6D0);
        sub_226A34A40((uint64_t)v17, (uint64_t (*)(void))type metadata accessor for SyncRecordChangesetProtobuf);
        sub_226A25428((uint64_t)v13, &qword_26AD5A6D0);
        if (v30) {
          goto LABEL_11;
        }
LABEL_12:
        char v25 = 0;
        return v25 & 1;
      }
      sub_226A25428((uint64_t)v20, &qword_26AD5A6D0);
      sub_226A25428((uint64_t)v22, &qword_26AD5A6D0);
      sub_226A34A40((uint64_t)v17, (uint64_t (*)(void))type metadata accessor for SyncRecordChangesetProtobuf);
    }
    sub_226A25428((uint64_t)v13, &qword_26814BFA0);
    goto LABEL_12;
  }
  return v25 & 1;
}

uint64_t sub_226A384F4(char *a1, char *a2, uint64_t (*a3)(void, void), uint64_t (*a4)(void))
{
  uint64_t v8 = sub_226A47DC0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v20 - v13;
  if (a3(*(void *)a1, *(void *)a2))
  {
    uint64_t v15 = a4(0);
    uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
    v16(v14, &a1[*(int *)(v15 + 20)], v8);
    v16(v12, &a2[*(int *)(v15 + 20)], v8);
    sub_226A39220(&qword_26814BFA8, MEMORY[0x263F50560]);
    char v17 = sub_226A48010();
    uint64_t v18 = *(void (**)(char *, uint64_t))(v9 + 8);
    v18(v12, v8);
    v18(v14, v8);
  }
  else
  {
    char v17 = 0;
  }
  return v17 & 1;
}

uint64_t _s21SeymourServerProtocol34SubmitSyncChangesetRequestProtobufV04ZonefH0V2eeoiySbAE_AEtFZ_0(char *a1, char *a2)
{
  uint64_t v4 = sub_226A47DC0();
  uint64_t v63 = *(void *)(v4 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  v62 = (char *)&v58 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  v61 = (char *)&v58 - v7;
  uint64_t v8 = type metadata accessor for SyncRecordChangesetProtobuf();
  uint64_t v68 = *(void *)(v8 - 8);
  uint64_t v69 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v60 = (uint64_t)&v58 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_26814BFA0);
  MEMORY[0x270FA5388](v66);
  uint64_t v70 = (uint64_t)&v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD5A6D0);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v64 = (uint64_t)&v58 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v71 = (uint64_t)&v58 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v67 = (uint64_t)&v58 - v16;
  uint64_t v17 = type metadata accessor for EncryptionKeyProofProtobuf(0);
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  v65 = (uint64_t *)((char *)&v58 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26814C508);
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (char *)&v58 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26814C3E0);
  uint64_t v24 = MEMORY[0x270FA5388](v23 - 8);
  uint64_t v26 = (uint64_t *)((char *)&v58 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v27 = MEMORY[0x270FA5388](v24);
  uint64_t v29 = (char *)&v58 - v28;
  MEMORY[0x270FA5388](v27);
  uint64_t v31 = (char *)&v58 - v30;
  uint64_t v32 = *(void *)a1;
  uint64_t v33 = *((void *)a1 + 1);
  v72 = a1;
  v73 = a2;
  if (v32 == *(void *)a2 && v33 == *((void *)a2 + 1) || (char v34 = 0, (sub_226A48090() & 1) != 0))
  {
    uint64_t v59 = v4;
    uint64_t v35 = (int *)type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf(0);
    sub_226A3444C((uint64_t)&v72[v35[6]], (uint64_t)v31, &qword_26814C3E0);
    sub_226A3444C((uint64_t)&v73[v35[6]], (uint64_t)v29, &qword_26814C3E0);
    uint64_t v36 = (uint64_t)&v22[*(int *)(v20 + 48)];
    sub_226A3444C((uint64_t)v31, (uint64_t)v22, &qword_26814C3E0);
    sub_226A3444C((uint64_t)v29, v36, &qword_26814C3E0);
    uint64_t v37 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v18 + 48);
    if (v37((uint64_t)v22, 1, v17) == 1)
    {
      sub_226A25428((uint64_t)v29, &qword_26814C3E0);
      sub_226A25428((uint64_t)v31, &qword_26814C3E0);
      if (v37(v36, 1, v17) == 1)
      {
        sub_226A25428((uint64_t)v22, &qword_26814C3E0);
        uint64_t v38 = v59;
LABEL_17:
        uint64_t v43 = v67;
        sub_226A3444C((uint64_t)&v72[v35[7]], v67, &qword_26AD5A6D0);
        uint64_t v44 = v71;
        sub_226A3444C((uint64_t)&v73[v35[7]], v71, &qword_26AD5A6D0);
        uint64_t v45 = v70;
        uint64_t v46 = v70 + *(int *)(v66 + 48);
        sub_226A3444C(v43, v70, &qword_26AD5A6D0);
        sub_226A3444C(v44, v46, &qword_26AD5A6D0);
        uint64_t v47 = v69;
        v48 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v68 + 48);
        if (v48(v45, 1, v69) == 1)
        {
          sub_226A25428(v44, &qword_26AD5A6D0);
          sub_226A25428(v43, &qword_26AD5A6D0);
          if (v48(v46, 1, v47) == 1)
          {
            sub_226A25428(v45, &qword_26AD5A6D0);
LABEL_28:
            uint64_t v53 = v63;
            v54 = *(void (**)(char *, char *, uint64_t))(v63 + 16);
            v55 = v61;
            v54(v61, &v72[v35[5]], v38);
            v56 = v62;
            v54(v62, &v73[v35[5]], v38);
            sub_226A39220(&qword_26814BFA8, MEMORY[0x263F50560]);
            char v34 = sub_226A48010();
            v57 = *(void (**)(char *, uint64_t))(v53 + 8);
            v57(v56, v38);
            v57(v55, v38);
            return v34 & 1;
          }
        }
        else
        {
          uint64_t v49 = v64;
          sub_226A3444C(v45, v64, &qword_26AD5A6D0);
          if (v48(v46, 1, v47) != 1)
          {
            uint64_t v51 = v60;
            sub_226A344B0(v46, v60, (uint64_t (*)(void))type metadata accessor for SyncRecordChangesetProtobuf);
            char v52 = static SyncRecordChangesetProtobuf.== infix(_:_:)(v49, v51);
            sub_226A34A40(v51, (uint64_t (*)(void))type metadata accessor for SyncRecordChangesetProtobuf);
            sub_226A25428(v71, &qword_26AD5A6D0);
            sub_226A25428(v43, &qword_26AD5A6D0);
            sub_226A34A40(v49, (uint64_t (*)(void))type metadata accessor for SyncRecordChangesetProtobuf);
            sub_226A25428(v45, &qword_26AD5A6D0);
            if (v52) {
              goto LABEL_28;
            }
            goto LABEL_25;
          }
          sub_226A25428(v71, &qword_26AD5A6D0);
          sub_226A25428(v43, &qword_26AD5A6D0);
          sub_226A34A40(v49, (uint64_t (*)(void))type metadata accessor for SyncRecordChangesetProtobuf);
        }
        uint64_t v39 = &qword_26814BFA0;
        uint64_t v40 = v45;
        goto LABEL_24;
      }
    }
    else
    {
      sub_226A3444C((uint64_t)v22, (uint64_t)v26, &qword_26814C3E0);
      if (v37(v36, 1, v17) != 1)
      {
        int64_t v41 = v65;
        sub_226A344B0(v36, (uint64_t)v65, type metadata accessor for EncryptionKeyProofProtobuf);
        if (*v26 == *v41 && v26[1] == v41[1] || (sub_226A48090())
          && (v26[2] == v41[2] && v26[3] == v41[3] || (sub_226A48090() & 1) != 0))
        {
          sub_226A39220(&qword_26814BFA8, MEMORY[0x263F50560]);
          uint64_t v38 = v59;
          char v42 = sub_226A48010();
          sub_226A34A40((uint64_t)v41, type metadata accessor for EncryptionKeyProofProtobuf);
          sub_226A25428((uint64_t)v29, &qword_26814C3E0);
          sub_226A25428((uint64_t)v31, &qword_26814C3E0);
          sub_226A34A40((uint64_t)v26, type metadata accessor for EncryptionKeyProofProtobuf);
          sub_226A25428((uint64_t)v22, &qword_26814C3E0);
          if ((v42 & 1) == 0)
          {
LABEL_25:
            char v34 = 0;
            return v34 & 1;
          }
          goto LABEL_17;
        }
        sub_226A34A40((uint64_t)v41, type metadata accessor for EncryptionKeyProofProtobuf);
        sub_226A25428((uint64_t)v29, &qword_26814C3E0);
        sub_226A25428((uint64_t)v31, &qword_26814C3E0);
        sub_226A34A40((uint64_t)v26, type metadata accessor for EncryptionKeyProofProtobuf);
        uint64_t v40 = (uint64_t)v22;
        uint64_t v39 = &qword_26814C3E0;
LABEL_24:
        sub_226A25428(v40, v39);
        goto LABEL_25;
      }
      sub_226A25428((uint64_t)v29, &qword_26814C3E0);
      sub_226A25428((uint64_t)v31, &qword_26814C3E0);
      sub_226A34A40((uint64_t)v26, type metadata accessor for EncryptionKeyProofProtobuf);
    }
    uint64_t v39 = &qword_26814C508;
    uint64_t v40 = (uint64_t)v22;
    goto LABEL_24;
  }
  return v34 & 1;
}

uint64_t _s21SeymourServerProtocol26EncryptionKeyProofProtobufV2eeoiySbAC_ACtFZ_0(char *a1, char *a2)
{
  uint64_t v4 = sub_226A47DC0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v18 - v9;
  BOOL v11 = *(void *)a1 == *(void *)a2 && *((void *)a1 + 1) == *((void *)a2 + 1);
  if (v11 || (char v12 = 0, (sub_226A48090() & 1) != 0))
  {
    BOOL v13 = *((void *)a1 + 2) == *((void *)a2 + 2) && *((void *)a1 + 3) == *((void *)a2 + 3);
    if (v13 || (char v12 = 0, (sub_226A48090() & 1) != 0))
    {
      uint64_t v14 = type metadata accessor for EncryptionKeyProofProtobuf(0);
      uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
      v15(v10, &a1[*(int *)(v14 + 24)], v4);
      v15(v8, &a2[*(int *)(v14 + 24)], v4);
      sub_226A39220(&qword_26814BFA8, MEMORY[0x263F50560]);
      char v12 = sub_226A48010();
      uint64_t v16 = *(void (**)(char *, uint64_t))(v5 + 8);
      v16(v8, v4);
      v16(v10, v4);
    }
  }
  return v12 & 1;
}

uint64_t sub_226A39220(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_226A39268()
{
  return sub_226A39220(&qword_26814C420, (void (*)(uint64_t))type metadata accessor for EncryptionKeyProofProtobuf);
}

uint64_t sub_226A392B0()
{
  return sub_226A39220(&qword_26814C428, (void (*)(uint64_t))type metadata accessor for EncryptionKeyProofProtobuf);
}

uint64_t sub_226A392F8()
{
  return sub_226A39220(&qword_26814C3E8, (void (*)(uint64_t))type metadata accessor for EncryptionKeyProofProtobuf);
}

uint64_t sub_226A39340()
{
  return sub_226A39220(&qword_26814C430, (void (*)(uint64_t))type metadata accessor for EncryptionKeyProofProtobuf);
}

uint64_t sub_226A39388()
{
  return sub_226A39220(&qword_26814C438, (void (*)(uint64_t))type metadata accessor for SubmitSyncChangesetRequestProtobuf);
}

uint64_t sub_226A393D0()
{
  return sub_226A39220(&qword_26814C440, (void (*)(uint64_t))type metadata accessor for SubmitSyncChangesetRequestProtobuf);
}

uint64_t sub_226A39418()
{
  return sub_226A39220(&qword_26814C3F8, (void (*)(uint64_t))type metadata accessor for SubmitSyncChangesetRequestProtobuf);
}

uint64_t sub_226A39460()
{
  return sub_226A39220(&qword_26814C448, (void (*)(uint64_t))type metadata accessor for SubmitSyncChangesetRequestProtobuf);
}

uint64_t sub_226A394A8()
{
  return sub_226A39220(&qword_26814C450, (void (*)(uint64_t))type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf);
}

uint64_t sub_226A394F0()
{
  return sub_226A39220(&qword_26814C3F0, (void (*)(uint64_t))type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf);
}

uint64_t sub_226A39538()
{
  return sub_226A39220(&qword_26814C400, (void (*)(uint64_t))type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf);
}

uint64_t sub_226A39580()
{
  return sub_226A39220(&qword_26814C458, (void (*)(uint64_t))type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf);
}

uint64_t sub_226A395C8()
{
  return sub_226A39220(&qword_26814C460, (void (*)(uint64_t))type metadata accessor for SubmitSyncChangesetResponseProtobuf);
}

uint64_t sub_226A39610()
{
  return sub_226A39220(&qword_26814C468, (void (*)(uint64_t))type metadata accessor for SubmitSyncChangesetResponseProtobuf);
}

uint64_t sub_226A39658()
{
  return sub_226A39220(&qword_26814C410, (void (*)(uint64_t))type metadata accessor for SubmitSyncChangesetResponseProtobuf);
}

uint64_t sub_226A396A0()
{
  return sub_226A39220(&qword_26814C470, (void (*)(uint64_t))type metadata accessor for SubmitSyncChangesetResponseProtobuf);
}

uint64_t sub_226A396E8()
{
  return sub_226A39220(&qword_26814C478, (void (*)(uint64_t))type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);
}

uint64_t sub_226A39730()
{
  return sub_226A39220(&qword_26814C408, (void (*)(uint64_t))type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);
}

uint64_t sub_226A39778()
{
  return sub_226A39220(&qword_26814C418, (void (*)(uint64_t))type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);
}

uint64_t sub_226A397C0()
{
  return sub_226A39220(&qword_26814C480, (void (*)(uint64_t))type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);
}

uint64_t sub_226A3980C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_226A351D0(a1, a2, a3, a4, type metadata accessor for EncryptionKeyProofProtobuf, type metadata accessor for EncryptionKeyProofProtobuf, type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf, &qword_26814C3E0);
}

uint64_t sub_226A39864(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_226A351D0(a1, a2, a3, a4, (uint64_t (*)(void))type metadata accessor for SyncRecordChangesetProtobuf, (uint64_t (*)(void))type metadata accessor for SyncRecordChangesetProtobuf, type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf, &qword_26AD5A6D0);
}

uint64_t getEnumTagSinglePayload for EncryptionKeyProofProtobuf(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_226A398C4);
}

uint64_t sub_226A398C4(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_226A47DC0();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for EncryptionKeyProofProtobuf(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_226A39988);
}

uint64_t sub_226A39988(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_226A47DC0();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 24);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_226A39A30()
{
  uint64_t result = sub_226A47DC0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SubmitSyncChangesetRequestProtobuf(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm_2);
}

uint64_t storeEnumTagSinglePayload for SubmitSyncChangesetRequestProtobuf(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm_2);
}

uint64_t *initializeBufferWithCopyOfBuffer for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf(uint64_t *a1, uint64_t *a2, int *a3)
{
  unint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *a2;
    *unint64_t v4 = *a2;
    unint64_t v4 = (uint64_t *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_226A47DC0();
    char v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[6];
    uint64_t v14 = (uint64_t *)((char *)v4 + v13);
    uint64_t v15 = (uint64_t *)((char *)a2 + v13);
    uint64_t v16 = type metadata accessor for EncryptionKeyProofProtobuf(0);
    uint64_t v17 = *(void *)(v16 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
    {
      uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26814C3E0);
      memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
    }
    else
    {
      uint64_t v20 = v15[1];
      *uint64_t v14 = *v15;
      v14[1] = v20;
      uint64_t v21 = v15[3];
      void v14[2] = v15[2];
      v14[3] = v21;
      uint64_t v22 = *(int *)(v16 + 24);
      uint64_t v35 = (char *)v14 + v22;
      uint64_t v23 = (char *)v15 + v22;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v12(v35, v23, v11);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
    }
    uint64_t v24 = a3[7];
    uint64_t v25 = (uint64_t *)((char *)v4 + v24);
    uint64_t v26 = (uint64_t *)((char *)a2 + v24);
    uint64_t v27 = type metadata accessor for SyncRecordChangesetProtobuf();
    uint64_t v28 = *(void *)(v27 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v28 + 48))(v26, 1, v27))
    {
      uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD5A6D0);
      memcpy(v25, v26, *(void *)(*(void *)(v29 - 8) + 64));
    }
    else
    {
      uint64_t v30 = v26[1];
      *uint64_t v25 = *v26;
      v25[1] = v30;
      v25[2] = v26[2];
      uint64_t v31 = *(int *)(v27 + 28);
      uint64_t v32 = (char *)v25 + v31;
      uint64_t v33 = (char *)v26 + v31;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v12(v32, v33, v11);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
    }
  }
  return v4;
}

uint64_t destroy for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[5];
  uint64_t v5 = sub_226A47DC0();
  char v12 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  v12(v4, v5);
  uint64_t v6 = a1 + a2[6];
  uint64_t v7 = type metadata accessor for EncryptionKeyProofProtobuf(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v6, 1, v7))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v12(v6 + *(int *)(v7 + 24), v5);
  }
  uint64_t v8 = a1 + a2[7];
  uint64_t v9 = type metadata accessor for SyncRecordChangesetProtobuf();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48))(v8, 1, v9);
  if (!result)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v11 = v8 + *(int *)(v9 + 28);
    return ((uint64_t (*)(uint64_t, uint64_t))v12)(v11, v5);
  }
  return result;
}

void *initializeWithCopy for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_226A47DC0();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = a3[6];
  uint64_t v13 = (void *)((char *)a1 + v12);
  uint64_t v14 = (void *)((char *)a2 + v12);
  uint64_t v15 = type metadata accessor for EncryptionKeyProofProtobuf(0);
  uint64_t v16 = *(void *)(v15 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
  {
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26814C3E0);
    memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    uint64_t v18 = v14[1];
    *uint64_t v13 = *v14;
    v13[1] = v18;
    uint64_t v19 = v14[3];
    v13[2] = v14[2];
    v13[3] = v19;
    uint64_t v20 = *(int *)(v15 + 24);
    uint64_t v33 = (char *)v13 + v20;
    uint64_t v21 = (char *)v14 + v20;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11(v33, v21, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  }
  uint64_t v22 = a3[7];
  uint64_t v23 = (void *)((char *)a1 + v22);
  uint64_t v24 = (void *)((char *)a2 + v22);
  uint64_t v25 = type metadata accessor for SyncRecordChangesetProtobuf();
  uint64_t v26 = *(void *)(v25 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v26 + 48))(v24, 1, v25))
  {
    uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD5A6D0);
    memcpy(v23, v24, *(void *)(*(void *)(v27 - 8) + 64));
  }
  else
  {
    uint64_t v28 = v24[1];
    *uint64_t v23 = *v24;
    v23[1] = v28;
    v23[2] = v24[2];
    uint64_t v29 = *(int *)(v25 + 28);
    uint64_t v30 = (char *)v23 + v29;
    uint64_t v31 = (char *)v24 + v29;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11(v30, v31, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v26 + 56))(v23, 0, 1, v25);
  }
  return a1;
}

void *assignWithCopy for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_226A47DC0();
  uint64_t v38 = *(void *)(v9 - 8);
  uint64_t v39 = v9;
  uint64_t v37 = *(void (**)(char *, char *))(v38 + 24);
  v37(v7, v8);
  uint64_t v10 = a3[6];
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  uint64_t v13 = type metadata accessor for EncryptionKeyProofProtobuf(0);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v14 + 48);
  int v16 = v15(v11, 1, v13);
  int v17 = v15(v12, 1, v13);
  if (v16)
  {
    if (!v17)
    {
      *uint64_t v11 = *v12;
      v11[1] = v12[1];
      void v11[2] = v12[2];
      v11[3] = v12[3];
      uint64_t v18 = *(int *)(v13 + 24);
      uint64_t v36 = (char *)v11 + v18;
      uint64_t v19 = (char *)v12 + v18;
      uint64_t v20 = *(void (**)(char *, char *, uint64_t))(v38 + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v20(v36, v19, v39);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v17)
  {
    sub_226A34A40((uint64_t)v11, type metadata accessor for EncryptionKeyProofProtobuf);
LABEL_6:
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26814C3E0);
    memcpy(v11, v12, *(void *)(*(void *)(v21 - 8) + 64));
    goto LABEL_7;
  }
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  void v11[2] = v12[2];
  v11[3] = v12[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  ((void (*)(char *, char *, uint64_t))v37)((char *)v11 + *(int *)(v13 + 24), (char *)v12 + *(int *)(v13 + 24), v39);
LABEL_7:
  uint64_t v22 = a3[7];
  uint64_t v23 = (void *)((char *)a1 + v22);
  uint64_t v24 = (void *)((char *)a2 + v22);
  uint64_t v25 = type metadata accessor for SyncRecordChangesetProtobuf();
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v27 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v26 + 48);
  int v28 = v27(v23, 1, v25);
  int v29 = v27(v24, 1, v25);
  if (!v28)
  {
    if (!v29)
    {
      *uint64_t v23 = *v24;
      v23[1] = v24[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v23[2] = v24[2];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      ((void (*)(char *, char *, uint64_t))v37)((char *)v23 + *(int *)(v25 + 28), (char *)v24 + *(int *)(v25 + 28), v39);
      return a1;
    }
    sub_226A34A40((uint64_t)v23, (uint64_t (*)(void))type metadata accessor for SyncRecordChangesetProtobuf);
    goto LABEL_12;
  }
  if (v29)
  {
LABEL_12:
    uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD5A6D0);
    memcpy(v23, v24, *(void *)(*(void *)(v34 - 8) + 64));
    return a1;
  }
  *uint64_t v23 = *v24;
  v23[1] = v24[1];
  v23[2] = v24[2];
  uint64_t v30 = *(int *)(v25 + 28);
  uint64_t v31 = (char *)v23 + v30;
  uint64_t v32 = (char *)v24 + v30;
  uint64_t v33 = *(void (**)(char *, char *, uint64_t))(v38 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v33(v31, v32, v39);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v26 + 56))(v23, 0, 1, v25);
  return a1;
}

_OWORD *initializeWithTake for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_226A47DC0();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  uint64_t v11 = a3[6];
  uint64_t v12 = (_OWORD *)((char *)a1 + v11);
  uint64_t v13 = (_OWORD *)((char *)a2 + v11);
  uint64_t v14 = type metadata accessor for EncryptionKeyProofProtobuf(0);
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26814C3E0);
    memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    long long v17 = v13[1];
    *uint64_t v12 = *v13;
    v12[1] = v17;
    v10((char *)v12 + *(int *)(v14 + 24), (char *)v13 + *(int *)(v14 + 24), v9);
    (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  uint64_t v18 = a3[7];
  uint64_t v19 = (void *)((char *)a1 + v18);
  uint64_t v20 = (void *)((char *)a2 + v18);
  uint64_t v21 = type metadata accessor for SyncRecordChangesetProtobuf();
  uint64_t v22 = *(void *)(v21 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
  {
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD5A6D0);
    memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64));
  }
  else
  {
    *(_OWORD *)uint64_t v19 = *(_OWORD *)v20;
    v19[2] = v20[2];
    v10((char *)v19 + *(int *)(v21 + 28), (char *)v20 + *(int *)(v21 + 28), v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
  }
  return a1;
}

void *assignWithTake for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_226A47DC0();
  uint64_t v34 = *(void *)(v10 - 8);
  uint64_t v35 = v10;
  uint64_t v33 = *(void (**)(char *, char *))(v34 + 40);
  v33(v8, v9);
  uint64_t v11 = a3[6];
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  uint64_t v14 = type metadata accessor for EncryptionKeyProofProtobuf(0);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v15 + 48);
  int v17 = v16(v12, 1, v14);
  int v18 = v16(v13, 1, v14);
  if (v17)
  {
    if (!v18)
    {
      long long v19 = *((_OWORD *)v13 + 1);
      *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
      *((_OWORD *)v12 + 1) = v19;
      (*(void (**)(char *, char *, uint64_t))(v34 + 32))((char *)v12 + *(int *)(v14 + 24), (char *)v13 + *(int *)(v14 + 24), v35);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v18)
  {
    sub_226A34A40((uint64_t)v12, type metadata accessor for EncryptionKeyProofProtobuf);
LABEL_6:
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26814C3E0);
    memcpy(v12, v13, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_7;
  }
  uint64_t v31 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v31;
  swift_bridgeObjectRelease();
  uint64_t v32 = v13[3];
  v12[2] = v13[2];
  v12[3] = v32;
  swift_bridgeObjectRelease();
  ((void (*)(char *, char *, uint64_t))v33)((char *)v12 + *(int *)(v14 + 24), (char *)v13 + *(int *)(v14 + 24), v35);
LABEL_7:
  uint64_t v21 = a3[7];
  uint64_t v22 = (void *)((char *)a1 + v21);
  uint64_t v23 = (void *)((char *)a2 + v21);
  uint64_t v24 = type metadata accessor for SyncRecordChangesetProtobuf();
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v26 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v25 + 48);
  int v27 = v26(v22, 1, v24);
  int v28 = v26(v23, 1, v24);
  if (!v27)
  {
    if (!v28)
    {
      *uint64_t v22 = *v23;
      v22[1] = v23[1];
      swift_bridgeObjectRelease();
      v22[2] = v23[2];
      swift_bridgeObjectRelease();
      ((void (*)(char *, char *, uint64_t))v33)((char *)v22 + *(int *)(v24 + 28), (char *)v23 + *(int *)(v24 + 28), v35);
      return a1;
    }
    sub_226A34A40((uint64_t)v22, (uint64_t (*)(void))type metadata accessor for SyncRecordChangesetProtobuf);
    goto LABEL_12;
  }
  if (v28)
  {
LABEL_12:
    uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD5A6D0);
    memcpy(v22, v23, *(void *)(*(void *)(v29 - 8) + 64));
    return a1;
  }
  *(_OWORD *)uint64_t v22 = *(_OWORD *)v23;
  v22[2] = v23[2];
  (*(void (**)(char *, char *, uint64_t))(v34 + 32))((char *)v22 + *(int *)(v24 + 28), (char *)v23 + *(int *)(v24 + 28), v35);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
  return a1;
}

uint64_t getEnumTagSinglePayload for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_226A3AD04);
}

uint64_t sub_226A3AD04(uint64_t a1, uint64_t a2, int *a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  uint64_t v8 = sub_226A47DC0();
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a2)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a3[5];
LABEL_9:
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
    return v13(a1 + v11, a2, v9);
  }
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26814C3E0);
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a2)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a3[6];
    goto LABEL_9;
  }
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD5A6D0);
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
  uint64_t v16 = v14;
  uint64_t v17 = a1 + a3[7];

  return v15(v17, a2, v16);
}

uint64_t storeEnumTagSinglePayload for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_226A3AE98);
}

uint64_t sub_226A3AE98(uint64_t result, uint64_t a2, int a3, int *a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
    return result;
  }
  uint64_t v8 = sub_226A47DC0();
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a4[5];
LABEL_7:
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
    return v13(v5 + v11, a2, a2, v9);
  }
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26814C3E0);
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a3)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a4[6];
    goto LABEL_7;
  }
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD5A6D0);
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  uint64_t v16 = v14;
  uint64_t v17 = v5 + a4[7];

  return v15(v17, a2, a2, v16);
}

void sub_226A3B018()
{
  sub_226A47DC0();
  if (v0 <= 0x3F)
  {
    sub_226A3B160(319, &qword_26814C4B8, (void (*)(uint64_t))type metadata accessor for EncryptionKeyProofProtobuf);
    if (v1 <= 0x3F)
    {
      sub_226A3B160(319, (unint64_t *)&qword_26AD5A6D8, (void (*)(uint64_t))type metadata accessor for SyncRecordChangesetProtobuf);
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_226A3B160(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_226A48040();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t getEnumTagSinglePayload for SubmitSyncChangesetResponseProtobuf(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm_3);
}

uint64_t storeEnumTagSinglePayload for SubmitSyncChangesetResponseProtobuf(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm_3);
}

uint64_t *initializeBufferWithCopyOfBuffer for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *a2;
    *unint64_t v4 = *a2;
    unint64_t v4 = (uint64_t *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
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
    uint64_t v11 = sub_226A47DC0();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = *(int *)(a3 + 24);
    uint64_t v14 = (uint64_t *)((char *)v4 + v13);
    uint64_t v15 = (uint64_t *)((char *)a2 + v13);
    uint64_t v16 = type metadata accessor for SyncRecordChangesetProtobuf();
    uint64_t v17 = *(void *)(v16 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
    {
      uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD5A6D0);
      memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
    }
    else
    {
      uint64_t v20 = v15[1];
      *uint64_t v14 = *v15;
      v14[1] = v20;
      void v14[2] = v15[2];
      uint64_t v21 = *(int *)(v16 + 28);
      uint64_t v22 = (char *)v14 + v21;
      uint64_t v23 = (char *)v15 + v21;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v12(v22, v23, v11);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
    }
  }
  return v4;
}

uint64_t destroy for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_226A47DC0();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  v10(v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 24);
  uint64_t v7 = type metadata accessor for SyncRecordChangesetProtobuf();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v6, 1, v7);
  if (!result)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v9 = v6 + *(int *)(v7 + 28);
    return ((uint64_t (*)(uint64_t, uint64_t))v10)(v9, v5);
  }
  return result;
}

void *initializeWithCopy for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_226A47DC0();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = (void *)((char *)a1 + v12);
  uint64_t v14 = (void *)((char *)a2 + v12);
  uint64_t v15 = type metadata accessor for SyncRecordChangesetProtobuf();
  uint64_t v16 = *(void *)(v15 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
  {
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD5A6D0);
    memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    uint64_t v18 = v14[1];
    *uint64_t v13 = *v14;
    v13[1] = v18;
    v13[2] = v14[2];
    uint64_t v19 = *(int *)(v15 + 28);
    uint64_t v20 = (char *)v13 + v19;
    uint64_t v21 = (char *)v14 + v19;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11(v20, v21, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  }
  return a1;
}

void *assignWithCopy for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_226A47DC0();
  uint64_t v24 = *(void *)(v9 - 8);
  uint64_t v25 = v9;
  uint64_t v10 = *(void (**)(char *, char *))(v24 + 24);
  v10(v7, v8);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  uint64_t v14 = type metadata accessor for SyncRecordChangesetProtobuf();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v15 + 48);
  LODWORD(v8) = v16(v12, 1, v14);
  int v17 = v16(v13, 1, v14);
  if (!v8)
  {
    if (!v17)
    {
      *uint64_t v12 = *v13;
      v12[1] = v13[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v12[2] = v13[2];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      ((void (*)(char *, char *, uint64_t))v10)((char *)v12 + *(int *)(v14 + 28), (char *)v13 + *(int *)(v14 + 28), v25);
      return a1;
    }
    sub_226A34A40((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for SyncRecordChangesetProtobuf);
    goto LABEL_6;
  }
  if (v17)
  {
LABEL_6:
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD5A6D0);
    memcpy(v12, v13, *(void *)(*(void *)(v22 - 8) + 64));
    return a1;
  }
  *uint64_t v12 = *v13;
  v12[1] = v13[1];
  v12[2] = v13[2];
  uint64_t v18 = *(int *)(v14 + 28);
  uint64_t v19 = (char *)v12 + v18;
  uint64_t v20 = (char *)v13 + v18;
  uint64_t v21 = *(void (**)(char *, char *, uint64_t))(v24 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v21(v19, v20, v25);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  return a1;
}

_OWORD *initializeWithTake for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_226A47DC0();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  uint64_t v14 = type metadata accessor for SyncRecordChangesetProtobuf();
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD5A6D0);
    memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
    v12[2] = v13[2];
    v10((char *)v12 + *(int *)(v14 + 28), (char *)v13 + *(int *)(v14 + 28), v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  return a1;
}

void *assignWithTake for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_226A47DC0();
  uint64_t v21 = *(void *)(v10 - 8);
  uint64_t v22 = v10;
  uint64_t v11 = *(void (**)(char *, char *))(v21 + 40);
  v11(v8, v9);
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = (void *)((char *)a1 + v12);
  uint64_t v14 = (void *)((char *)a2 + v12);
  uint64_t v15 = type metadata accessor for SyncRecordChangesetProtobuf();
  uint64_t v16 = *(void *)(v15 - 8);
  int v17 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v16 + 48);
  LODWORD(v9) = v17(v13, 1, v15);
  int v18 = v17(v14, 1, v15);
  if (!v9)
  {
    if (!v18)
    {
      *uint64_t v13 = *v14;
      v13[1] = v14[1];
      swift_bridgeObjectRelease();
      v13[2] = v14[2];
      swift_bridgeObjectRelease();
      ((void (*)(char *, char *, uint64_t))v11)((char *)v13 + *(int *)(v15 + 28), (char *)v14 + *(int *)(v15 + 28), v22);
      return a1;
    }
    sub_226A34A40((uint64_t)v13, (uint64_t (*)(void))type metadata accessor for SyncRecordChangesetProtobuf);
    goto LABEL_6;
  }
  if (v18)
  {
LABEL_6:
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD5A6D0);
    memcpy(v13, v14, *(void *)(*(void *)(v19 - 8) + 64));
    return a1;
  }
  *(_OWORD *)uint64_t v13 = *(_OWORD *)v14;
  v13[2] = v14[2];
  (*(void (**)(char *, char *, uint64_t))(v21 + 32))((char *)v13 + *(int *)(v15 + 28), (char *)v14 + *(int *)(v15 + 28), v22);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  return a1;
}

uint64_t getEnumTagSinglePayload for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_226A3BCC8);
}

uint64_t sub_226A3BCC8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_226A47DC0();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = a1 + *(int *)(a3 + 20);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD5A6D0);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = a1 + *(int *)(a3 + 24);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t storeEnumTagSinglePayload for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_226A3BE0C);
}

uint64_t sub_226A3BE0C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v8 = sub_226A47DC0();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = v5 + *(int *)(a4 + 20);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD5A6D0);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 24);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

void sub_226A3BF3C()
{
  sub_226A47DC0();
  if (v0 <= 0x3F)
  {
    sub_226A3B160(319, (unint64_t *)&qword_26AD5A6D8, (void (*)(uint64_t))type metadata accessor for SyncRecordChangesetProtobuf);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t PingProtobuf.ping.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PingProtobuf.ping.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*PingProtobuf.ping.modify())()
{
  return nullsub_1;
}

uint64_t PingProtobuf.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_226A3C1B4(type metadata accessor for PingProtobuf, a1);
}

uint64_t type metadata accessor for PingProtobuf(uint64_t a1)
{
  return sub_226A1FDB8(a1, (uint64_t *)&unk_26814C580);
}

uint64_t PingProtobuf.unknownFields.setter(uint64_t a1)
{
  return sub_226A3C26C(a1, type metadata accessor for PingProtobuf);
}

uint64_t (*PingProtobuf.unknownFields.modify())()
{
  return nullsub_1;
}

uint64_t PingProtobuf.init()@<X0>(void *a1@<X8>)
{
  return sub_226A3C348((void (*)(void))type metadata accessor for PingProtobuf, a1);
}

uint64_t (*PongProtobuf.pong.modify())()
{
  return nullsub_1;
}

uint64_t PongProtobuf.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_226A3C1B4(type metadata accessor for PongProtobuf, a1);
}

uint64_t sub_226A3C1B4@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1(0) + 20);
  uint64_t v5 = sub_226A47DC0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a2, v4, v5);
}

uint64_t type metadata accessor for PongProtobuf(uint64_t a1)
{
  return sub_226A1FDB8(a1, (uint64_t *)&unk_26814C590);
}

uint64_t PongProtobuf.unknownFields.setter(uint64_t a1)
{
  return sub_226A3C26C(a1, type metadata accessor for PongProtobuf);
}

uint64_t sub_226A3C26C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v4 = v2 + *(int *)(a2(0) + 20);
  uint64_t v5 = sub_226A47DC0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);

  return v6(v4, a1, v5);
}

uint64_t (*PongProtobuf.unknownFields.modify())()
{
  return nullsub_1;
}

uint64_t PongProtobuf.init()@<X0>(void *a1@<X8>)
{
  return sub_226A3C348((void (*)(void))type metadata accessor for PongProtobuf, a1);
}

uint64_t sub_226A3C348@<X0>(void (*a1)(void)@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0xE000000000000000;
  a1(0);
  return _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
}

uint64_t static PingProtobuf.protoMessageName.getter()
{
  return 0x746F7250676E6950;
}

uint64_t sub_226A3C3AC(uint64_t a1)
{
  return sub_226A3C704(a1, qword_26814C510, (uint64_t)"ping");
}

uint64_t static PingProtobuf._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_226A21AE8(&qword_26814BEF8, (uint64_t)qword_26814C510, a1);
}

uint64_t PingProtobuf.decodeMessage<A>(decoder:)()
{
  return sub_226A3C89C();
}

uint64_t PingProtobuf.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_226A3C938(a1, a2, a3, (void (*)(void))type metadata accessor for PingProtobuf);
}

uint64_t static PingProtobuf.== infix(_:_:)(char *a1, char *a2)
{
  return sub_226A3CCDC(a1, a2, type metadata accessor for PingProtobuf) & 1;
}

uint64_t PingProtobuf.hashValue.getter()
{
  return sub_226A3CA64((void (*)(void))type metadata accessor for PingProtobuf, &qword_26814C540, (void (*)(uint64_t))type metadata accessor for PingProtobuf);
}

uint64_t sub_226A3C4A0@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0xE000000000000000;
  return _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
}

uint64_t sub_226A3C4C8()
{
  return 0x746F7250676E6950;
}

uint64_t sub_226A3C4E8()
{
  return PingProtobuf.decodeMessage<A>(decoder:)();
}

uint64_t sub_226A3C500(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return PingProtobuf.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t sub_226A3C518(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_226A3CEA8(&qword_26814C5A8, (void (*)(uint64_t))type metadata accessor for PingProtobuf);

  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_226A3C594@<X0>(uint64_t a1@<X8>)
{
  return sub_226A2234C(&qword_26814BEF8, (uint64_t)qword_26814C510, a1);
}

uint64_t sub_226A3C5B8(uint64_t a1)
{
  uint64_t v2 = sub_226A3CEA8(&qword_26814C558, (void (*)(uint64_t))type metadata accessor for PingProtobuf);

  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_226A3C624()
{
  sub_226A3CEA8(&qword_26814C558, (void (*)(uint64_t))type metadata accessor for PingProtobuf);

  return sub_226A47EE0();
}

uint64_t sub_226A3C6A0(char *a1, char *a2)
{
  return sub_226A3CCDC(a1, a2, type metadata accessor for PingProtobuf) & 1;
}

uint64_t static PongProtobuf.protoMessageName.getter()
{
  return 0x746F7250676E6F50;
}

uint64_t sub_226A3C6F0(uint64_t a1)
{
  return sub_226A3C704(a1, qword_26814C528, (uint64_t)"pong");
}

uint64_t sub_226A3C704(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = sub_226A47FE0();
  __swift_allocate_value_buffer(v5, a2);
  __swift_project_value_buffer(v5, (uint64_t)a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26814BFB0);
  uint64_t v6 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26814BFB8) - 8);
  unint64_t v7 = (*(unsigned __int8 *)(*(void *)v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v6 + 80);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_226A483E0;
  unint64_t v9 = v8 + v7 + v6[14];
  *(void *)(v8 + v7) = 1;
  *(void *)unint64_t v9 = a3;
  *(void *)(v9 + 8) = 4;
  *(unsigned char *)(v9 + 16) = 2;
  uint64_t v10 = *MEMORY[0x263F50718];
  uint64_t v11 = sub_226A47FB0();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 104))(v9, v10, v11);
  return sub_226A47FC0();
}

uint64_t static PongProtobuf._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_226A21AE8(&qword_26814BF00, (uint64_t)qword_26814C528, a1);
}

uint64_t PongProtobuf.decodeMessage<A>(decoder:)()
{
  return sub_226A3C89C();
}

uint64_t sub_226A3C89C()
{
  while (1)
  {
    uint64_t result = sub_226A47E10();
    if (v0 || (v2 & 1) != 0) {
      break;
    }
    if (result == 1) {
      sub_226A47E90();
    }
  }
  return result;
}

uint64_t PongProtobuf.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_226A3C938(a1, a2, a3, (void (*)(void))type metadata accessor for PongProtobuf);
}

uint64_t sub_226A3C938(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  unint64_t v7 = v4[1];
  uint64_t v8 = HIBYTE(v7) & 0xF;
  if ((v7 & 0x2000000000000000) == 0) {
    uint64_t v8 = *v4 & 0xFFFFFFFFFFFFLL;
  }
  if (!v8 || (uint64_t result = sub_226A47F80(), !v5))
  {
    a4(0);
    return sub_226A47DA0();
  }
  return result;
}

uint64_t static PongProtobuf.== infix(_:_:)(char *a1, char *a2)
{
  return sub_226A3CCDC(a1, a2, type metadata accessor for PongProtobuf) & 1;
}

uint64_t PongProtobuf.hashValue.getter()
{
  return sub_226A3CA64((void (*)(void))type metadata accessor for PongProtobuf, &qword_26814C548, (void (*)(uint64_t))type metadata accessor for PongProtobuf);
}

uint64_t sub_226A3CA64(void (*a1)(void), unint64_t *a2, void (*a3)(uint64_t))
{
  return sub_226A48130();
}

uint64_t sub_226A3CAEC()
{
  return 0x746F7250676E6F50;
}

uint64_t sub_226A3CB0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return PongProtobuf.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t sub_226A3CB24(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_226A3CEA8(&qword_26814C5A0, (void (*)(uint64_t))type metadata accessor for PongProtobuf);

  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_226A3CBA0@<X0>(uint64_t a1@<X8>)
{
  return sub_226A2234C(&qword_26814BF00, (uint64_t)qword_26814C528, a1);
}

uint64_t sub_226A3CBC4(uint64_t a1)
{
  uint64_t v2 = sub_226A3CEA8(&qword_26814C570, (void (*)(uint64_t))type metadata accessor for PongProtobuf);

  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_226A3CC30()
{
  sub_226A3CEA8(&qword_26814C570, (void (*)(uint64_t))type metadata accessor for PongProtobuf);

  return sub_226A47EE0();
}

uint64_t sub_226A3CCAC(char *a1, char *a2)
{
  return sub_226A3CCDC(a1, a2, type metadata accessor for PongProtobuf) & 1;
}

uint64_t sub_226A3CCDC(char *a1, char *a2, uint64_t (*a3)(void))
{
  uint64_t v6 = sub_226A47DC0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v19 - v11;
  BOOL v13 = *(void *)a1 == *(void *)a2 && *((void *)a1 + 1) == *((void *)a2 + 1);
  if (v13 || (char v14 = 0, (sub_226A48090() & 1) != 0))
  {
    uint64_t v15 = a3(0);
    uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
    v16(v12, &a1[*(int *)(v15 + 20)], v6);
    v16(v10, &a2[*(int *)(v15 + 20)], v6);
    sub_226A3CEA8(&qword_26814BFA8, MEMORY[0x263F50560]);
    char v14 = sub_226A48010();
    int v17 = *(void (**)(char *, uint64_t))(v7 + 8);
    v17(v10, v6);
    v17(v12, v6);
  }
  return v14 & 1;
}

uint64_t sub_226A3CEA8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_226A3CEF0()
{
  return sub_226A3CEA8(&qword_26814C550, (void (*)(uint64_t))type metadata accessor for PingProtobuf);
}

uint64_t sub_226A3CF38()
{
  return sub_226A3CEA8(&qword_26814C558, (void (*)(uint64_t))type metadata accessor for PingProtobuf);
}

uint64_t sub_226A3CF80()
{
  return sub_226A3CEA8(&qword_26814C540, (void (*)(uint64_t))type metadata accessor for PingProtobuf);
}

uint64_t sub_226A3CFC8()
{
  return sub_226A3CEA8(&qword_26814C560, (void (*)(uint64_t))type metadata accessor for PingProtobuf);
}

uint64_t sub_226A3D010()
{
  return sub_226A3CEA8(&qword_26814C568, (void (*)(uint64_t))type metadata accessor for PongProtobuf);
}

uint64_t sub_226A3D058()
{
  return sub_226A3CEA8(&qword_26814C570, (void (*)(uint64_t))type metadata accessor for PongProtobuf);
}

uint64_t sub_226A3D0A0()
{
  return sub_226A3CEA8(&qword_26814C548, (void (*)(uint64_t))type metadata accessor for PongProtobuf);
}

uint64_t sub_226A3D0E8()
{
  return sub_226A3CEA8(&qword_26814C578, (void (*)(uint64_t))type metadata accessor for PongProtobuf);
}

uint64_t getEnumTagSinglePayload for PingProtobuf(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm_0_0);
}

uint64_t storeEnumTagSinglePayload for PingProtobuf(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm_0_0);
}

uint64_t *_s21SeymourServerProtocol12PingProtobufVwCP_0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *unint64_t v3 = *a2;
    unint64_t v3 = (uint64_t *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = sub_226A47DC0();
    uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v3;
}

uint64_t _s21SeymourServerProtocol12PingProtobufVwxx_0(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_226A47DC0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

void *_s21SeymourServerProtocol12PingProtobufVwcp_0(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_226A47DC0();
  uint64_t v9 = *(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16);
  swift_bridgeObjectRetain();
  v9(v6, v7, v8);
  return a1;
}

void *_s21SeymourServerProtocol12PingProtobufVwca_0(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_226A47DC0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *_s21SeymourServerProtocol12PingProtobufVwtk_0(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_226A47DC0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void *_s21SeymourServerProtocol12PingProtobufVwta_0(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_226A47DC0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for PongProtobuf(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_226A3D52C);
}

uint64_t __swift_get_extra_inhabitant_indexTm_0(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_226A47DC0();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for PongProtobuf(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_226A3D5F4);
}

uint64_t __swift_store_extra_inhabitant_indexTm_0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_226A47DC0();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_226A3D6A0()
{
  uint64_t result = sub_226A47DC0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t ValidateEncryptionKeyRequestProtobuf.encryptionKeys.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ValidateEncryptionKeyRequestProtobuf.encryptionKeys.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v1 = a1;
  return result;
}

uint64_t (*ValidateEncryptionKeyRequestProtobuf.encryptionKeys.modify())()
{
  return nullsub_1;
}

uint64_t ValidateEncryptionKeyRequestProtobuf.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_226A3D880(type metadata accessor for ValidateEncryptionKeyRequestProtobuf, a1);
}

uint64_t type metadata accessor for ValidateEncryptionKeyRequestProtobuf(uint64_t a1)
{
  return sub_226A1FDB8(a1, qword_26AD5A2E8);
}

uint64_t ValidateEncryptionKeyRequestProtobuf.unknownFields.setter(uint64_t a1)
{
  return sub_226A3D938(a1, type metadata accessor for ValidateEncryptionKeyRequestProtobuf);
}

uint64_t (*ValidateEncryptionKeyRequestProtobuf.unknownFields.modify())()
{
  return nullsub_1;
}

uint64_t ValidateEncryptionKeyRequestProtobuf.init()@<X0>(void *a1@<X8>)
{
  return sub_226A3DA14((void (*)(void))type metadata accessor for ValidateEncryptionKeyRequestProtobuf, a1);
}

uint64_t (*ValidateEncryptionKeyResponseProtobuf.encryptionKeys.modify())()
{
  return nullsub_1;
}

uint64_t ValidateEncryptionKeyResponseProtobuf.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_226A3D880(type metadata accessor for ValidateEncryptionKeyResponseProtobuf, a1);
}

uint64_t sub_226A3D880@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1(0) + 20);
  uint64_t v5 = sub_226A47DC0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a2, v4, v5);
}

uint64_t type metadata accessor for ValidateEncryptionKeyResponseProtobuf(uint64_t a1)
{
  return sub_226A1FDB8(a1, qword_26AD5A378);
}

uint64_t ValidateEncryptionKeyResponseProtobuf.unknownFields.setter(uint64_t a1)
{
  return sub_226A3D938(a1, type metadata accessor for ValidateEncryptionKeyResponseProtobuf);
}

uint64_t sub_226A3D938(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v4 = v2 + *(int *)(a2(0) + 20);
  uint64_t v5 = sub_226A47DC0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);

  return v6(v4, a1, v5);
}

uint64_t (*ValidateEncryptionKeyResponseProtobuf.unknownFields.modify())()
{
  return nullsub_1;
}

uint64_t ValidateEncryptionKeyResponseProtobuf.init()@<X0>(void *a1@<X8>)
{
  return sub_226A3DA14((void (*)(void))type metadata accessor for ValidateEncryptionKeyResponseProtobuf, a1);
}

uint64_t sub_226A3DA14@<X0>(void (*a1)(void)@<X0>, void *a2@<X8>)
{
  *a2 = MEMORY[0x263F8EE78];
  a1(0);
  return _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
}

unint64_t static ValidateEncryptionKeyRequestProtobuf.protoMessageName.getter()
{
  return 0xD000000000000024;
}

uint64_t sub_226A3DA78(uint64_t a1)
{
  return sub_226A3DD90(a1, qword_26814C5B0);
}

uint64_t static ValidateEncryptionKeyRequestProtobuf._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_226A21AE8(&qword_26814BF08, (uint64_t)qword_26814C5B0, a1);
}

uint64_t ValidateEncryptionKeyRequestProtobuf.decodeMessage<A>(decoder:)()
{
  return sub_226A3DF24();
}

uint64_t ValidateEncryptionKeyRequestProtobuf.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_226A3E040(a1, a2, a3, (void (*)(void))type metadata accessor for ValidateEncryptionKeyRequestProtobuf);
}

uint64_t static ValidateEncryptionKeyRequestProtobuf.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  return sub_226A3E428(a1, a2, type metadata accessor for ValidateEncryptionKeyRequestProtobuf) & 1;
}

uint64_t ValidateEncryptionKeyRequestProtobuf.hashValue.getter()
{
  return sub_226A3E1B4((void (*)(void))type metadata accessor for ValidateEncryptionKeyRequestProtobuf, &qword_26814C5E0, (void (*)(uint64_t))type metadata accessor for ValidateEncryptionKeyRequestProtobuf);
}

unint64_t sub_226A3DB64()
{
  return 0xD000000000000024;
}

uint64_t sub_226A3DB80()
{
  return ValidateEncryptionKeyRequestProtobuf.decodeMessage<A>(decoder:)();
}

uint64_t sub_226A3DB98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return ValidateEncryptionKeyRequestProtobuf.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t sub_226A3DBB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_226A3E5E8(&qword_26814C628, (void (*)(uint64_t))type metadata accessor for ValidateEncryptionKeyRequestProtobuf);

  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_226A3DC2C@<X0>(uint64_t a1@<X8>)
{
  return sub_226A2234C(&qword_26814BF08, (uint64_t)qword_26814C5B0, a1);
}

uint64_t sub_226A3DC50(uint64_t a1)
{
  uint64_t v2 = sub_226A3E5E8(&qword_26814C5F8, (void (*)(uint64_t))type metadata accessor for ValidateEncryptionKeyRequestProtobuf);

  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_226A3DCBC()
{
  sub_226A3E5E8(&qword_26814C5F8, (void (*)(uint64_t))type metadata accessor for ValidateEncryptionKeyRequestProtobuf);

  return sub_226A47EE0();
}

uint64_t sub_226A3DD38(uint64_t *a1, uint64_t *a2)
{
  return sub_226A3E428(a1, a2, type metadata accessor for ValidateEncryptionKeyRequestProtobuf) & 1;
}

unint64_t static ValidateEncryptionKeyResponseProtobuf.protoMessageName.getter()
{
  return 0xD000000000000025;
}

uint64_t sub_226A3DD84(uint64_t a1)
{
  return sub_226A3DD90(a1, qword_26814C5C8);
}

uint64_t sub_226A3DD90(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_226A47FE0();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26814BFB0);
  uint64_t v4 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26814BFB8) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(*(void *)v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v4 + 80);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_226A483E0;
  unint64_t v7 = v6 + v5 + v4[14];
  *(void *)(v6 + v5) = 1;
  *(void *)unint64_t v7 = "encryptionKeys";
  *(void *)(v7 + 8) = 14;
  *(unsigned char *)(v7 + 16) = 2;
  uint64_t v8 = *MEMORY[0x263F50718];
  uint64_t v9 = sub_226A47FB0();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 104))(v7, v8, v9);
  return sub_226A47FC0();
}

uint64_t static ValidateEncryptionKeyResponseProtobuf._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_226A21AE8(&qword_26814BF10, (uint64_t)qword_26814C5C8, a1);
}

uint64_t ValidateEncryptionKeyResponseProtobuf.decodeMessage<A>(decoder:)()
{
  return sub_226A3DF24();
}

uint64_t sub_226A3DF24()
{
  uint64_t result = sub_226A47E10();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (result == 1)
      {
        sub_226A47D70();
        sub_226A3E5E8(&qword_26814C348, MEMORY[0x263F327D8]);
        sub_226A47EA0();
      }
      uint64_t result = sub_226A47E10();
    }
  }
  return result;
}

uint64_t ValidateEncryptionKeyResponseProtobuf.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_226A3E040(a1, a2, a3, (void (*)(void))type metadata accessor for ValidateEncryptionKeyResponseProtobuf);
}

uint64_t sub_226A3E040(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  if (!*(void *)(*(void *)v4 + 16)
    || (sub_226A47D70(), sub_226A3E5E8(&qword_26814C348, MEMORY[0x263F327D8]), uint64_t result = sub_226A47F90(), !v5))
  {
    a4(0);
    return sub_226A47DA0();
  }
  return result;
}

uint64_t static ValidateEncryptionKeyResponseProtobuf.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  return sub_226A3E428(a1, a2, type metadata accessor for ValidateEncryptionKeyResponseProtobuf) & 1;
}

uint64_t ValidateEncryptionKeyResponseProtobuf.hashValue.getter()
{
  return sub_226A3E1B4((void (*)(void))type metadata accessor for ValidateEncryptionKeyResponseProtobuf, &qword_26814C5E8, (void (*)(uint64_t))type metadata accessor for ValidateEncryptionKeyResponseProtobuf);
}

uint64_t sub_226A3E1B4(void (*a1)(void), unint64_t *a2, void (*a3)(uint64_t))
{
  return sub_226A48130();
}

unint64_t sub_226A3E23C()
{
  return 0xD000000000000025;
}

uint64_t sub_226A3E258(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return ValidateEncryptionKeyResponseProtobuf.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t sub_226A3E270(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_226A3E5E8(&qword_26814C620, (void (*)(uint64_t))type metadata accessor for ValidateEncryptionKeyResponseProtobuf);

  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_226A3E2EC@<X0>(uint64_t a1@<X8>)
{
  return sub_226A2234C(&qword_26814BF10, (uint64_t)qword_26814C5C8, a1);
}

uint64_t sub_226A3E310(uint64_t a1)
{
  uint64_t v2 = sub_226A3E5E8(&qword_26814C610, (void (*)(uint64_t))type metadata accessor for ValidateEncryptionKeyResponseProtobuf);

  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_226A3E37C()
{
  sub_226A3E5E8(&qword_26814C610, (void (*)(uint64_t))type metadata accessor for ValidateEncryptionKeyResponseProtobuf);

  return sub_226A47EE0();
}

uint64_t sub_226A3E3F8(uint64_t *a1, uint64_t *a2)
{
  return sub_226A3E428(a1, a2, type metadata accessor for ValidateEncryptionKeyResponseProtobuf) & 1;
}

uint64_t sub_226A3E428(uint64_t *a1, uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t v6 = sub_226A47DC0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v18 - v11;
  if (sub_226A3F91C(*a1, *a2))
  {
    uint64_t v13 = a3(0);
    char v14 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
    v14(v12, (char *)a1 + *(int *)(v13 + 20), v6);
    v14(v10, (char *)a2 + *(int *)(v13 + 20), v6);
    sub_226A3E5E8(&qword_26814BFA8, MEMORY[0x263F50560]);
    char v15 = sub_226A48010();
    uint64_t v16 = *(void (**)(char *, uint64_t))(v7 + 8);
    v16(v10, v6);
    v16(v12, v6);
  }
  else
  {
    char v15 = 0;
  }
  return v15 & 1;
}

uint64_t sub_226A3E5E8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_226A3E630()
{
  return sub_226A3E5E8(&qword_26814C5F0, (void (*)(uint64_t))type metadata accessor for ValidateEncryptionKeyRequestProtobuf);
}

uint64_t sub_226A3E678()
{
  return sub_226A3E5E8(&qword_26814C5F8, (void (*)(uint64_t))type metadata accessor for ValidateEncryptionKeyRequestProtobuf);
}

uint64_t sub_226A3E6C0()
{
  return sub_226A3E5E8(&qword_26814C5E0, (void (*)(uint64_t))type metadata accessor for ValidateEncryptionKeyRequestProtobuf);
}

uint64_t sub_226A3E708()
{
  return sub_226A3E5E8(&qword_26814C600, (void (*)(uint64_t))type metadata accessor for ValidateEncryptionKeyRequestProtobuf);
}

uint64_t sub_226A3E750()
{
  return sub_226A3E5E8(&qword_26814C608, (void (*)(uint64_t))type metadata accessor for ValidateEncryptionKeyResponseProtobuf);
}

uint64_t sub_226A3E798()
{
  return sub_226A3E5E8(&qword_26814C610, (void (*)(uint64_t))type metadata accessor for ValidateEncryptionKeyResponseProtobuf);
}

uint64_t sub_226A3E7E0()
{
  return sub_226A3E5E8(&qword_26814C5E8, (void (*)(uint64_t))type metadata accessor for ValidateEncryptionKeyResponseProtobuf);
}

uint64_t sub_226A3E828()
{
  return sub_226A3E5E8(&qword_26814C618, (void (*)(uint64_t))type metadata accessor for ValidateEncryptionKeyResponseProtobuf);
}

uint64_t getEnumTagSinglePayload for ValidateEncryptionKeyRequestProtobuf(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm_4);
}

uint64_t storeEnumTagSinglePayload for ValidateEncryptionKeyRequestProtobuf(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm_4);
}

uint64_t getEnumTagSinglePayload for ValidateEncryptionKeyResponseProtobuf(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm_5);
}

uint64_t storeEnumTagSinglePayload for ValidateEncryptionKeyResponseProtobuf(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm_5);
}

SeymourServerProtocol::RecordField_optional __swiftcall RecordField.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_226A48080();
  result.value = swift_bridgeObjectRelease();
  char v5 = 3;
  if (v3 < 3) {
    char v5 = v3;
  }
  char *v2 = v5;
  return result;
}

uint64_t RecordField.rawValue.getter()
{
  unint64_t v1 = 0xD000000000000010;
  if (*v0 != 1) {
    unint64_t v1 = 0x696669746E656469;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x6574707972636E65;
  }
}

uint64_t sub_226A3E9A4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_226A29684(*a1, *a2);
}

unint64_t sub_226A3E9B4()
{
  unint64_t result = qword_26814C630;
  if (!qword_26814C630)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26814C630);
  }
  return result;
}

uint64_t sub_226A3EA08()
{
  return sub_226A48130();
}

uint64_t sub_226A3EAC0()
{
  sub_226A48020();

  return swift_bridgeObjectRelease();
}

uint64_t sub_226A3EB64()
{
  return sub_226A48130();
}

SeymourServerProtocol::RecordField_optional sub_226A3EC18(Swift::String *a1)
{
  return RecordField.init(rawValue:)(*a1);
}

void sub_226A3EC24(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xEE00736574794264;
  unint64_t v4 = 0x8000000226A4B380;
  unint64_t v5 = 0xD000000000000010;
  if (v2 != 1)
  {
    unint64_t v5 = 0x696669746E656469;
    unint64_t v4 = 0xEA00000000007265;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0x6574707972636E65;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for RecordField(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for RecordField(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x226A3EE00);
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

uint64_t sub_226A3EE28(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_226A3EE30(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for RecordField()
{
  return &type metadata for RecordField;
}

uint64_t ScoreEstimationProtobuf.seconds.getter()
{
  return *v0;
}

uint64_t ScoreEstimationProtobuf.seconds.setter(uint64_t result)
{
  _DWORD *v1 = result;
  return result;
}

uint64_t (*ScoreEstimationProtobuf.seconds.modify())()
{
  return nullsub_1;
}

uint64_t ScoreEstimationProtobuf.markers.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ScoreEstimationProtobuf.markers.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 8) = a1;
  return result;
}

uint64_t (*ScoreEstimationProtobuf.markers.modify())()
{
  return nullsub_1;
}

uint64_t ScoreEstimationProtobuf.sampleCount.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t ScoreEstimationProtobuf.sampleCount.setter(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t (*ScoreEstimationProtobuf.sampleCount.modify())()
{
  return nullsub_1;
}

uint64_t ScoreEstimationProtobuf.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ScoreEstimationProtobuf() + 28);
  uint64_t v4 = sub_226A47DC0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for ScoreEstimationProtobuf()
{
  uint64_t result = qword_26814C670;
  if (!qword_26814C670) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t ScoreEstimationProtobuf.unknownFields.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ScoreEstimationProtobuf() + 28);
  uint64_t v4 = sub_226A47DC0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40);

  return v5(v3, a1, v4);
}

uint64_t (*ScoreEstimationProtobuf.unknownFields.modify())()
{
  return nullsub_1;
}

uint64_t ScoreEstimationProtobuf.init()@<X0>(uint64_t a1@<X8>)
{
  *(_DWORD *)a1 = 0;
  *(void *)(a1 + 8) = MEMORY[0x263F8EE78];
  *(void *)(a1 + 16) = 0;
  type metadata accessor for ScoreEstimationProtobuf();
  return _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
}

unint64_t static ScoreEstimationProtobuf.protoMessageName.getter()
{
  return 0xD000000000000017;
}

uint64_t sub_226A3F0E0()
{
  uint64_t v0 = sub_226A47FE0();
  __swift_allocate_value_buffer(v0, qword_26814C638);
  __swift_project_value_buffer(v0, (uint64_t)qword_26814C638);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26814BFB0);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26814BFB8) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_226A483F0;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *uint64_t v5 = 1;
  *(void *)unint64_t v6 = "seconds";
  *(void *)(v6 + 8) = 7;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_226A47FB0();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  uint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)uint64_t v10 = "markers";
  *((void *)v10 + 1) = 7;
  v10[16] = 2;
  v9();
  uint64_t v11 = (uint64_t)v5 + 2 * v2 + v1[14];
  *(void *)((char *)v5 + 2 * v2) = 3;
  *(void *)uint64_t v11 = "sampleCount";
  *(void *)(v11 + 8) = 11;
  *(unsigned char *)(v11 + 16) = 2;
  v9();
  return sub_226A47FC0();
}

uint64_t static ScoreEstimationProtobuf._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26814BF18 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_226A47FE0();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26814C638);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t ScoreEstimationProtobuf.decodeMessage<A>(decoder:)()
{
  uint64_t result = sub_226A47E10();
  uint64_t v3 = v0;
  if (!v0)
  {
    while (1)
    {
      if (v2) {
        return result;
      }
      if (result == 3) {
        break;
      }
      if (result == 2)
      {
        type metadata accessor for ScoreEstimationMarkerProtobuf();
        sub_226A42C28(&qword_26814C1A8, (void (*)(uint64_t))type metadata accessor for ScoreEstimationMarkerProtobuf);
        uint64_t v4 = v3;
        sub_226A47EA0();
        goto LABEL_5;
      }
      if (result == 1)
      {
        uint64_t v4 = v3;
        sub_226A47E50();
        goto LABEL_5;
      }
LABEL_6:
      uint64_t result = sub_226A47E10();
    }
    uint64_t v4 = v3;
    sub_226A47E60();
LABEL_5:
    uint64_t v3 = v4;
    goto LABEL_6;
  }
  return result;
}

uint64_t ScoreEstimationProtobuf.traverse<A>(visitor:)()
{
  if (!*(_DWORD *)v0 || (uint64_t result = sub_226A47F40(), !v1))
  {
    if (!*(void *)(*(void *)(v0 + 8) + 16)
      || (type metadata accessor for ScoreEstimationMarkerProtobuf(),
          sub_226A42C28(&qword_26814C1A8, (void (*)(uint64_t))type metadata accessor for ScoreEstimationMarkerProtobuf), uint64_t result = sub_226A47F90(), !v1))
    {
      if (!*(void *)(v0 + 16) || (uint64_t result = sub_226A47F50(), !v1))
      {
        type metadata accessor for ScoreEstimationProtobuf();
        return sub_226A47DA0();
      }
    }
  }
  return result;
}

uint64_t ScoreEstimationProtobuf.hashValue.getter()
{
  return sub_226A48130();
}

uint64_t sub_226A3F690@<X0>(uint64_t a1@<X8>)
{
  *(_DWORD *)a1 = 0;
  *(void *)(a1 + 8) = MEMORY[0x263F8EE78];
  *(void *)(a1 + 16) = 0;
  return _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
}

unint64_t sub_226A3F6C0()
{
  return 0xD000000000000017;
}

uint64_t sub_226A3F6DC()
{
  return ScoreEstimationProtobuf.decodeMessage<A>(decoder:)();
}

uint64_t sub_226A3F6F4()
{
  return ScoreEstimationProtobuf.traverse<A>(visitor:)();
}

uint64_t sub_226A3F70C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_226A42C28(&qword_26814C680, (void (*)(uint64_t))type metadata accessor for ScoreEstimationProtobuf);

  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_226A3F788@<X0>(uint64_t a1@<X8>)
{
  if (qword_26814BF18 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_226A47FE0();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26814C638);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_226A3F830(uint64_t a1)
{
  uint64_t v2 = sub_226A42C28(&qword_26814C660, (void (*)(uint64_t))type metadata accessor for ScoreEstimationProtobuf);

  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_226A3F89C()
{
  sub_226A42C28(&qword_26814C660, (void (*)(uint64_t))type metadata accessor for ScoreEstimationProtobuf);

  return sub_226A47EE0();
}

uint64_t sub_226A3F91C(uint64_t a1, uint64_t a2)
{
  return sub_226A41E54(a1, a2, MEMORY[0x263F327D8], &qword_26814C688, MEMORY[0x263F327D8], MEMORY[0x263F327E0]);
}

uint64_t sub_226A3F964(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_226A47D70();
  uint64_t v79 = *(void *)(v4 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v66 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v66 - v8;
  uint64_t v10 = type metadata accessor for SyncRecordChangesetProtobuf();
  v86 = *(char **)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (double *)((char *)&v66 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD5A6D0);
  MEMORY[0x270FA5388](v13 - 8);
  char v15 = (char *)&v66 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26814BFA0);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v66 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(0);
  uint64_t v20 = MEMORY[0x270FA5388](v19);
  uint64_t v21 = MEMORY[0x270FA5388](v20);
  uint64_t v25 = *(void *)(a1 + 16);
  if (v25 != *(void *)(a2 + 16))
  {
LABEL_38:
    char v64 = 0;
    return v64 & 1;
  }
  uint64_t v26 = (unint64_t *)v15;
  uint64_t v75 = v16;
  v80 = (uint64_t *)((char *)&v66 - v23);
  v78 = v24;
  v72 = v18;
  if (!v25 || a1 == a2)
  {
    char v64 = 1;
    return v64 & 1;
  }
  uint64_t v77 = v21;
  uint64_t v27 = 0;
  unint64_t v28 = (*(unsigned __int8 *)(v22 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
  uint64_t v70 = a2 + v28;
  uint64_t v71 = a1 + v28;
  uint64_t v29 = *(void *)(v22 + 72);
  uint64_t v68 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v86 + 48);
  uint64_t v69 = v29;
  v84 = v7;
  uint64_t v85 = v79 + 16;
  v83 = (void (**)(char *, uint64_t))(v79 + 8);
  v86 = v9;
  uint64_t v30 = (uint64_t)v72;
  uint64_t v31 = v78;
  uint64_t v32 = v12;
  uint64_t v33 = v10;
  uint64_t v34 = v26;
  uint64_t v66 = v33;
  uint64_t v67 = v25;
  v73 = v26;
  v74 = v32;
  while (1)
  {
    uint64_t v76 = v27;
    uint64_t v35 = v69 * v27;
    uint64_t v36 = v80;
    sub_226A42C70(v71 + v69 * v27, (uint64_t)v80, type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);
    sub_226A42C70(v70 + v35, (uint64_t)v31, type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);
    BOOL v37 = *v36 == *v31 && v36[1] == v31[1];
    if (!v37 && (sub_226A48090() & 1) == 0) {
      goto LABEL_37;
    }
    uint64_t v38 = *(int *)(v77 + 24);
    uint64_t v39 = (uint64_t)v36 + v38;
    uint64_t v40 = (uint64_t)v31 + v38;
    uint64_t v41 = v30 + *(int *)(v75 + 48);
    sub_226A1FDF0(v39, v30);
    sub_226A1FDF0(v40, v41);
    char v42 = *v68;
    if ((*v68)(v30, 1, v33) == 1)
    {
      if (v42(v41, 1, v33) == 1)
      {
        sub_226A25428(v30, &qword_26AD5A6D0);
        uint64_t v36 = v80;
        goto LABEL_30;
      }
      uint64_t v36 = v80;
      v65 = &qword_26814BFA0;
LABEL_36:
      sub_226A25428(v30, v65);
LABEL_37:
      sub_226A42CD8((uint64_t)v31, type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);
      sub_226A42CD8((uint64_t)v36, type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);
      goto LABEL_38;
    }
    sub_226A1FDF0(v30, (uint64_t)v34);
    if (v42(v41, 1, v33) == 1)
    {
      uint64_t v36 = v80;
      v65 = &qword_26814BFA0;
LABEL_35:
      sub_226A42CD8((uint64_t)v34, (uint64_t (*)(void))type metadata accessor for SyncRecordChangesetProtobuf);
      goto LABEL_36;
    }
    sub_226A1FE58(v41, (uint64_t)v32);
    v43.n128_u64[0] = *v34;
    if (*(double *)v34 != *v32
      || (uint64_t v44 = *((void *)v74 + 1), v82 = v73[1], v45 = *(void *)(v82 + 16), v45 != *(void *)(v44 + 16)))
    {
LABEL_34:
      sub_226A42CD8((uint64_t)v74, (uint64_t (*)(void))type metadata accessor for SyncRecordChangesetProtobuf);
      v65 = &qword_26AD5A6D0;
      uint64_t v30 = (uint64_t)v72;
      uint64_t v34 = v73;
      uint64_t v31 = v78;
      uint64_t v36 = v80;
      goto LABEL_35;
    }
    if (v45 && v82 != v44) {
      break;
    }
LABEL_22:
    uint64_t v54 = *((void *)v74 + 2);
    unint64_t v82 = v73[2];
    uint64_t v55 = *(void *)(v82 + 16);
    if (v55 != *(void *)(v54 + 16)) {
      goto LABEL_34;
    }
    if (v55 && v82 != v54)
    {
      unint64_t v56 = 0;
      unint64_t v57 = (*(unsigned __int8 *)(v79 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v79 + 80);
      uint64_t v81 = *(void *)(v79 + 72);
      uint64_t v58 = *(uint64_t (**)(char *, unint64_t, uint64_t, __n128))(v79 + 16);
      do
      {
        uint64_t result = v58(v9, v82 + v57, v4, v43);
        if (v56 >= *(void *)(v54 + 16)) {
          goto LABEL_43;
        }
        uint64_t v59 = v84;
        ((void (*)(char *, unint64_t, uint64_t))v58)(v84, v54 + v57, v4);
        sub_226A42C28(&qword_26814C688, MEMORY[0x263F327D8]);
        char v60 = sub_226A48010();
        v61 = *v83;
        v62 = v59;
        uint64_t v9 = v86;
        (*v83)(v62, v4);
        v61(v9, v4);
        if ((v60 & 1) == 0) {
          goto LABEL_34;
        }
        ++v56;
        v57 += v81;
      }
      while (v55 != v56);
    }
    uint64_t v33 = v66;
    uint64_t v34 = v73;
    uint64_t v32 = v74;
    sub_226A47DC0();
    sub_226A42C28(&qword_26814BFA8, MEMORY[0x263F50560]);
    char v63 = sub_226A48010();
    sub_226A42CD8((uint64_t)v32, (uint64_t (*)(void))type metadata accessor for SyncRecordChangesetProtobuf);
    sub_226A42CD8((uint64_t)v34, (uint64_t (*)(void))type metadata accessor for SyncRecordChangesetProtobuf);
    uint64_t v30 = (uint64_t)v72;
    sub_226A25428((uint64_t)v72, &qword_26AD5A6D0);
    uint64_t v31 = v78;
    uint64_t v36 = v80;
    if ((v63 & 1) == 0) {
      goto LABEL_37;
    }
LABEL_30:
    sub_226A47DC0();
    sub_226A42C28(&qword_26814BFA8, MEMORY[0x263F50560]);
    uint64_t v31 = v78;
    char v64 = sub_226A48010();
    sub_226A42CD8((uint64_t)v31, type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);
    sub_226A42CD8((uint64_t)v36, type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);
    if (v64)
    {
      uint64_t v27 = v76 + 1;
      if (v76 + 1 != v67) {
        continue;
      }
    }
    return v64 & 1;
  }
  unint64_t v46 = 0;
  unint64_t v47 = (*(unsigned __int8 *)(v79 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v79 + 80);
  uint64_t v81 = *(void *)(v79 + 72);
  v48 = *(uint64_t (**)(char *, unint64_t, uint64_t, __n128))(v79 + 16);
  while (1)
  {
    uint64_t result = v48(v9, v82 + v47, v4, v43);
    if (v46 >= *(void *)(v44 + 16)) {
      break;
    }
    v50 = v84;
    ((void (*)(char *, unint64_t, uint64_t))v48)(v84, v44 + v47, v4);
    sub_226A42C28(&qword_26814C688, MEMORY[0x263F327D8]);
    char v51 = sub_226A48010();
    char v52 = *v83;
    uint64_t v53 = v50;
    uint64_t v9 = v86;
    (*v83)(v53, v4);
    v52(v9, v4);
    if ((v51 & 1) == 0) {
      goto LABEL_34;
    }
    ++v46;
    v47 += v81;
    if (v45 == v46) {
      goto LABEL_22;
    }
  }
  __break(1u);
LABEL_43:
  __break(1u);
  return result;
}

uint64_t sub_226A40268(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf(0) - 8;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)&v19 - v9;
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11 == *(void *)(a2 + 16))
  {
    if (!v11 || a1 == a2)
    {
      char v15 = 1;
    }
    else
    {
      unint64_t v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      uint64_t v13 = *(void *)(v8 + 72);
      uint64_t v14 = v11 - 1;
      do
      {
        sub_226A42C70(a1 + v12, (uint64_t)v10, type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf);
        sub_226A42C70(a2 + v12, (uint64_t)v7, type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf);
        char v15 = static SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf.== infix(_:_:)(v10, v7);
        sub_226A42CD8((uint64_t)v7, type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf);
        sub_226A42CD8((uint64_t)v10, type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf);
        BOOL v17 = v14-- != 0;
        if ((v15 & 1) == 0) {
          break;
        }
        v12 += v13;
      }
      while (v17);
    }
  }
  else
  {
    char v15 = 0;
  }
  return v15 & 1;
}

uint64_t sub_226A40408(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  BOOL v5 = a1[4] == a2[4] && a1[5] == a2[5];
  if (v5 || (v6 = sub_226A48090(), uint64_t result = 0, (v6 & 1) != 0))
  {
    uint64_t v8 = v2 - 1;
    if (!v8) {
      return 1;
    }
    uint64_t v9 = a2 + 7;
    for (unint64_t i = a1 + 7; ; i += 2)
    {
      BOOL v11 = *(i - 1) == *(v9 - 1) && *i == *v9;
      if (!v11 && (sub_226A48090() & 1) == 0) {
        break;
      }
      v9 += 2;
      if (!--v8) {
        return 1;
      }
    }
    return 0;
  }
  return result;
}

uint64_t sub_226A404D0(uint64_t a1, uint64_t a2)
{
  __s1[3] = *MEMORY[0x263EF8340];
  uint64_t v4 = sub_226A47D70();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  v106 = (char *)&v87 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v87 - v8;
  uint64_t v10 = type metadata accessor for SyncRecordChangesetProtobuf();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (double *)((char *)&v87 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD5A6D0);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v87 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_26814BFA0);
  MEMORY[0x270FA5388](v99);
  uint64_t v18 = (char *)&v87 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t SyncChangesetResponse = type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(0);
  uint64_t v19 = MEMORY[0x270FA5388](SyncChangesetResponse);
  v100 = (char *)&v87 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  v105 = (uint64_t *)((char *)&v87 - v22);
  uint64_t v23 = *(void *)(a1 + 16);
  if (v23 != *(void *)(a2 + 16)) {
    goto LABEL_69;
  }
  if (!v23 || a1 == a2)
  {
    char v84 = 1;
    return v84 & 1;
  }
  v96 = v18;
  v98 = (unint64_t *)v16;
  uint64_t v24 = 0;
  uint64_t v90 = 0;
  unint64_t v25 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  uint64_t v93 = a2 + v25;
  uint64_t v94 = a1 + v25;
  uint64_t v92 = *(void *)(v21 + 72);
  v91 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48);
  uint64_t v104 = v5 + 16;
  uint64_t v88 = v5;
  v103 = (void (**)(char *, uint64_t))(v5 + 8);
  v107 = v9;
  uint64_t v108 = v4;
  uint64_t v26 = v100;
  uint64_t v87 = v10;
  v97 = v13;
  uint64_t v89 = v23;
  while (2)
  {
    uint64_t v27 = v24;
    uint64_t v28 = v92 * v24;
    uint64_t v29 = v105;
    sub_226A42C70(v94 + v92 * v24, (uint64_t)v105, type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);
    sub_226A42C70(v93 + v28, (uint64_t)v26, type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);
    BOOL v30 = *v29 == *v26 && v29[1] == v26[1];
    if (!v30 && (sub_226A48090() & 1) == 0) {
      goto LABEL_68;
    }
    uint64_t v31 = v27 + 1;
    uint64_t v33 = v105[2];
    unint64_t v32 = v105[3];
    uint64_t v34 = v26[2];
    unint64_t v35 = v26[3];
    uint64_t v36 = 0;
    switch(v32 >> 62)
    {
      case 1uLL:
        LODWORD(v36) = HIDWORD(v33) - v33;
        if (__OFSUB__(HIDWORD(v33), v33)) {
          goto LABEL_75;
        }
        uint64_t v36 = (int)v36;
LABEL_15:
        uint64_t v95 = v31;
        switch(v35 >> 62)
        {
          case 1uLL:
            LODWORD(v40) = HIDWORD(v34) - v34;
            if (__OFSUB__(HIDWORD(v34), v34)) {
              goto LABEL_77;
            }
            uint64_t v40 = (int)v40;
LABEL_20:
            if (v36 != v40) {
              goto LABEL_68;
            }
            if (v36 < 1) {
              goto LABEL_41;
            }
            break;
          case 2uLL:
            uint64_t v42 = *(void *)(v34 + 16);
            uint64_t v41 = *(void *)(v34 + 24);
            BOOL v39 = __OFSUB__(v41, v42);
            uint64_t v40 = v41 - v42;
            if (!v39) {
              goto LABEL_20;
            }
            goto LABEL_78;
          case 3uLL:
            if (v36) {
              goto LABEL_68;
            }
            goto LABEL_41;
          default:
            uint64_t v40 = BYTE6(v35);
            goto LABEL_20;
        }
        break;
      case 2uLL:
        uint64_t v38 = *(void *)(v33 + 16);
        uint64_t v37 = *(void *)(v33 + 24);
        BOOL v39 = __OFSUB__(v37, v38);
        uint64_t v36 = v37 - v38;
        if (!v39) {
          goto LABEL_15;
        }
        goto LABEL_76;
      case 3uLL:
        goto LABEL_15;
      default:
        uint64_t v36 = BYTE6(v32);
        goto LABEL_15;
    }
    switch(v32 >> 62)
    {
      case 1uLL:
        uint64_t v101 = v34;
        if (v33 >> 32 < (int)v33) {
          goto LABEL_79;
        }
        sub_226A1F594(v33, v32);
        uint64_t v43 = sub_226A47C50();
        if (!v43) {
          goto LABEL_30;
        }
        uint64_t v44 = sub_226A47C70();
        if (__OFSUB__((int)v33, v44)) {
          goto LABEL_81;
        }
        v43 += (int)v33 - v44;
LABEL_30:
        uint64_t v13 = v97;
        sub_226A47C60();
        uint64_t v45 = v43;
        uint64_t v46 = v90;
        sub_226A22580(v45, v101, v35, (char *)__s1);
        uint64_t v90 = v46;
        sub_226A1F5F0(v33, v32);
        char v47 = __s1[0];
        goto LABEL_40;
      case 2uLL:
        uint64_t v101 = v34;
        uint64_t v48 = *(void *)(v33 + 16);
        uint64_t v49 = *(void *)(v33 + 24);
        swift_retain();
        swift_retain();
        uint64_t v50 = sub_226A47C50();
        if (v50)
        {
          uint64_t v51 = v50;
          uint64_t v52 = sub_226A47C70();
          if (__OFSUB__(v48, v52)) {
            goto LABEL_82;
          }
          uint64_t v53 = v51 + v48 - v52;
        }
        else
        {
          uint64_t v53 = 0;
        }
        if (__OFSUB__(v49, v48)) {
          goto LABEL_80;
        }
        sub_226A47C60();
        uint64_t v55 = v90;
        sub_226A22580(v53, v101, v35, (char *)__s1);
        uint64_t v90 = v55;
        swift_release();
        swift_release();
        char v47 = __s1[0];
        uint64_t v13 = v97;
LABEL_40:
        uint64_t v26 = v100;
        if ((v47 & 1) == 0) {
          goto LABEL_68;
        }
LABEL_41:
        uint64_t v56 = *(int *)(SyncChangesetResponse + 28);
        uint64_t v57 = (uint64_t)v26 + v56;
        uint64_t v58 = (uint64_t)v96;
        uint64_t v59 = (uint64_t)&v96[*(int *)(v99 + 48)];
        sub_226A1FDF0((uint64_t)v105 + v56, (uint64_t)v96);
        sub_226A1FDF0(v57, v59);
        char v60 = *v91;
        if ((*v91)(v58, 1, v10) == 1)
        {
          if (v60(v59, 1, v10) != 1)
          {
            uint64_t v85 = &qword_26814BFA0;
            goto LABEL_67;
          }
          sub_226A25428(v58, &qword_26AD5A6D0);
LABEL_61:
          uint64_t v83 = (uint64_t)v105;
          sub_226A47DC0();
          sub_226A42C28(&qword_26814BFA8, MEMORY[0x263F50560]);
          char v84 = sub_226A48010();
          sub_226A42CD8((uint64_t)v26, type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);
          sub_226A42CD8(v83, type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);
          if ((v84 & 1) == 0) {
            return v84 & 1;
          }
          uint64_t v24 = v95;
          if (v95 == v89) {
            return v84 & 1;
          }
          continue;
        }
        v61 = v98;
        sub_226A1FDF0(v58, (uint64_t)v98);
        if (v60(v59, 1, v10) != 1)
        {
          sub_226A1FE58(v59, (uint64_t)v13);
          v62.n128_u64[0] = *v61;
          if (*(double *)v61 != *v13
            || (unint64_t v63 = v98[1], v64 = *((void *)v97 + 1), v65 = *(void *)(v63 + 16), v65 != *(void *)(v64 + 16)))
          {
LABEL_65:
            sub_226A42CD8((uint64_t)v97, (uint64_t (*)(void))type metadata accessor for SyncRecordChangesetProtobuf);
            uint64_t v85 = &qword_26AD5A6D0;
            v61 = v98;
            uint64_t v58 = (uint64_t)v96;
            goto LABEL_66;
          }
          if (v65 && v63 != v64)
          {
            unint64_t v66 = 0;
            unint64_t v67 = (*(unsigned __int8 *)(v88 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v88 + 80);
            uint64_t v101 = *(void *)(v88 + 72);
            uint64_t v68 = *(void (**)(char *, unint64_t, uint64_t, __n128))(v88 + 16);
            while (1)
            {
              v68(v9, v63 + v67, v4, v62);
              if (v66 >= *(void *)(v64 + 16)) {
                break;
              }
              uint64_t v69 = v106;
              ((void (*)(char *, unint64_t, uint64_t))v68)(v106, v64 + v67, v4);
              sub_226A42C28(&qword_26814C688, MEMORY[0x263F327D8]);
              char v70 = sub_226A48010();
              uint64_t v71 = *v103;
              (*v103)(v69, v108);
              v71(v107, v108);
              uint64_t v9 = v107;
              uint64_t v4 = v108;
              if ((v70 & 1) == 0) {
                goto LABEL_65;
              }
              ++v66;
              v67 += v101;
              if (v65 == v66) {
                goto LABEL_53;
              }
            }
            __break(1u);
            goto LABEL_74;
          }
LABEL_53:
          unint64_t v72 = v98[2];
          uint64_t v73 = *((void *)v97 + 2);
          uint64_t v74 = *(void *)(v72 + 16);
          if (v74 != *(void *)(v73 + 16)) {
            goto LABEL_65;
          }
          if (v74 && v72 != v73)
          {
            unint64_t v75 = 0;
            unint64_t v76 = (*(unsigned __int8 *)(v88 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v88 + 80);
            uint64_t v101 = *(void *)(v88 + 72);
            uint64_t v77 = *(void (**)(char *, unint64_t, uint64_t, __n128))(v88 + 16);
            while (1)
            {
              v77(v9, v72 + v76, v4, v62);
              if (v75 >= *(void *)(v73 + 16)) {
                break;
              }
              v78 = v106;
              ((void (*)(char *, unint64_t, uint64_t))v77)(v106, v73 + v76, v4);
              sub_226A42C28(&qword_26814C688, MEMORY[0x263F327D8]);
              char v79 = sub_226A48010();
              v80 = *v103;
              (*v103)(v78, v108);
              v80(v107, v108);
              uint64_t v9 = v107;
              uint64_t v4 = v108;
              if ((v79 & 1) == 0) {
                goto LABEL_65;
              }
              ++v75;
              v76 += v101;
              if (v74 == v75) {
                goto LABEL_60;
              }
            }
LABEL_74:
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
LABEL_80:
            __break(1u);
LABEL_81:
            __break(1u);
LABEL_82:
            __break(1u);
          }
LABEL_60:
          uint64_t v10 = v87;
          uint64_t v13 = v97;
          uint64_t v81 = (uint64_t)v98;
          sub_226A47DC0();
          sub_226A42C28(&qword_26814BFA8, MEMORY[0x263F50560]);
          char v82 = sub_226A48010();
          sub_226A42CD8((uint64_t)v13, (uint64_t (*)(void))type metadata accessor for SyncRecordChangesetProtobuf);
          sub_226A42CD8(v81, (uint64_t (*)(void))type metadata accessor for SyncRecordChangesetProtobuf);
          sub_226A25428((uint64_t)v96, &qword_26AD5A6D0);
          uint64_t v26 = v100;
          if ((v82 & 1) == 0) {
            goto LABEL_68;
          }
          goto LABEL_61;
        }
        uint64_t v85 = &qword_26814BFA0;
LABEL_66:
        sub_226A42CD8((uint64_t)v61, (uint64_t (*)(void))type metadata accessor for SyncRecordChangesetProtobuf);
        uint64_t v26 = v100;
LABEL_67:
        sub_226A25428(v58, v85);
LABEL_68:
        sub_226A42CD8((uint64_t)v26, type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);
        sub_226A42CD8((uint64_t)v105, type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);
LABEL_69:
        char v84 = 0;
        return v84 & 1;
      case 3uLL:
        memset(__s1, 0, 14);
        goto LABEL_35;
      default:
        __s1[0] = v33;
        LOWORD(__s1[1]) = v32;
        BYTE2(__s1[1]) = BYTE2(v32);
        BYTE3(__s1[1]) = BYTE3(v32);
        BYTE4(__s1[1]) = BYTE4(v32);
        BYTE5(__s1[1]) = BYTE5(v32);
LABEL_35:
        uint64_t v54 = v90;
        sub_226A22580((uint64_t)__s1, v34, v35, &v109);
        uint64_t v90 = v54;
        if ((v109 & 1) == 0) {
          goto LABEL_68;
        }
        goto LABEL_41;
    }
  }
}

uint64_t sub_226A41134(uint64_t a1, uint64_t a2)
{
  __s1[2] = *MEMORY[0x263EF8340];
  uint64_t SyncChangesetRequest = type metadata accessor for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf(0);
  uint64_t v4 = MEMORY[0x270FA5388](SyncChangesetRequest);
  uint64_t v6 = (uint64_t *)((char *)&v92 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v4);
  uint64_t v9 = (uint64_t *)((char *)&v92 - v8);
  uint64_t v100 = a1;
  uint64_t v10 = *(void *)(a1 + 16);
  if (v10 == *(void *)(a2 + 16))
  {
    if (!v10 || v100 == a2) {
      return 1;
    }
    unint64_t v11 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    uint64_t v98 = *(void *)(v7 + 72);
    uint64_t v95 = a2;
    while (2)
    {
      sub_226A42C70(v100 + v11, (uint64_t)v9, type metadata accessor for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf);
      sub_226A42C70(a2 + v11, (uint64_t)v6, type metadata accessor for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf);
      BOOL v12 = *v9 == *v6 && v9[1] == v6[1];
      if (v12 || (sub_226A48090() & 1) != 0)
      {
        uint64_t v14 = v9[2];
        unint64_t v13 = v9[3];
        uint64_t v15 = v6[2];
        unint64_t v16 = v6[3];
        uint64_t v17 = 0;
        switch(v13 >> 62)
        {
          case 1uLL:
            LODWORD(v17) = HIDWORD(v14) - v14;
            if (!__OFSUB__(HIDWORD(v14), v14))
            {
              uint64_t v17 = (int)v17;
LABEL_15:
              unint64_t v21 = v16 >> 62;
              switch(v16 >> 62)
              {
                case 1uLL:
                  LODWORD(v22) = HIDWORD(v15) - v15;
                  if (__OFSUB__(HIDWORD(v15), v15)) {
                    goto LABEL_128;
                  }
                  uint64_t v22 = (int)v22;
LABEL_20:
                  if (v17 != v22) {
                    goto LABEL_124;
                  }
                  if (v17 < 1) {
                    goto LABEL_121;
                  }
                  break;
                case 2uLL:
                  uint64_t v24 = *(void *)(v15 + 16);
                  uint64_t v23 = *(void *)(v15 + 24);
                  BOOL v20 = __OFSUB__(v23, v24);
                  uint64_t v22 = v23 - v24;
                  if (!v20) {
                    goto LABEL_20;
                  }
                  goto LABEL_129;
                case 3uLL:
                  if (v17) {
                    goto LABEL_124;
                  }
                  goto LABEL_121;
                default:
                  uint64_t v22 = BYTE6(v16);
                  goto LABEL_20;
              }
              uint64_t v97 = v6[2];
              switch(v13 >> 62)
              {
                case 1uLL:
                  unint64_t v96 = v16;
                  if ((int)v14 > v14 >> 32) {
                    goto LABEL_130;
                  }
                  sub_226A1F594(v14, v13);
                  unint64_t v32 = (char *)sub_226A47C50();
                  if (!v32) {
                    goto LABEL_36;
                  }
                  uint64_t v33 = sub_226A47C70();
                  if (__OFSUB__((int)v14, v33)) {
                    goto LABEL_132;
                  }
                  v32 += (int)v14 - v33;
LABEL_36:
                  a2 = v95;
                  sub_226A47C60();
                  if (v21)
                  {
                    uint64_t v94 = v32;
                    if (v21 == 1)
                    {
                      uint64_t v34 = (int)v97;
                      uint64_t v35 = (v97 >> 32) - (int)v97;
                      if (v97 >> 32 < (int)v97) {
                        goto LABEL_140;
                      }
                      swift_retain();
                      uint64_t v36 = (char *)sub_226A47C50();
                      if (v36)
                      {
                        uint64_t v37 = sub_226A47C70();
                        if (__OFSUB__(v34, v37)) {
                          goto LABEL_148;
                        }
                        v36 += v34 - v37;
                      }
                      a2 = v95;
                      uint64_t v38 = sub_226A47C60();
                      if (v38 >= v35) {
                        size_t v39 = v35;
                      }
                      else {
                        size_t v39 = v38;
                      }
                      if (!v94) {
                        goto LABEL_150;
                      }
                      if (!v36) {
                        goto LABEL_151;
                      }
                      int v40 = memcmp(v94, v36, v39);
                      sub_226A1F5F0(v97, v96);
                    }
                    else
                    {
                      uint64_t v76 = *(void *)(v97 + 16);
                      uint64_t v77 = *(void *)(v97 + 24);
                      swift_retain();
                      swift_retain();
                      uint64_t v78 = sub_226A47C50();
                      if (v78)
                      {
                        uint64_t v79 = v78;
                        uint64_t v80 = sub_226A47C70();
                        if (__OFSUB__(v76, v80)) {
                          goto LABEL_147;
                        }
                        uint64_t v81 = v76;
                        char v82 = (const void *)(v79 + v76 - v80);
                      }
                      else
                      {
                        uint64_t v81 = v76;
                        char v82 = 0;
                      }
                      int64_t v88 = v77 - v81;
                      if (__OFSUB__(v77, v81)) {
                        goto LABEL_142;
                      }
                      uint64_t v89 = sub_226A47C60();
                      if (v89 >= v88) {
                        size_t v90 = v88;
                      }
                      else {
                        size_t v90 = v89;
                      }
                      a2 = v95;
                      if (!v94) {
                        goto LABEL_160;
                      }
                      if (!v82) {
                        goto LABEL_161;
                      }
                      int v40 = memcmp(v94, v82, v90);
                      swift_release();
                      swift_release();
                    }
                  }
                  else
                  {
                    __s1[0] = v97;
                    LODWORD(__s1[1]) = v96;
                    WORD2(__s1[1]) = WORD2(v96);
                    if (!v32) {
                      goto LABEL_155;
                    }
                    int v40 = memcmp(v32, __s1, BYTE6(v96));
                  }
                  uint64_t v56 = v14;
                  unint64_t v57 = v13;
LABEL_120:
                  sub_226A1F5F0(v56, v57);
                  if (v40) {
                    goto LABEL_124;
                  }
LABEL_121:
                  sub_226A47DC0();
                  sub_226A42C28(&qword_26814BFA8, MEMORY[0x263F50560]);
                  if ((sub_226A48010() & 1) == 0) {
                    goto LABEL_124;
                  }
                  sub_226A42CD8((uint64_t)v6, type metadata accessor for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf);
                  sub_226A42CD8((uint64_t)v9, type metadata accessor for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf);
                  v11 += v98;
                  if (!--v10) {
                    return 1;
                  }
                  continue;
                case 2uLL:
                  unint64_t v96 = v16;
                  uint64_t v41 = (const void *)(v13 & 0x3FFFFFFFFFFFFFFFLL);
                  uint64_t v42 = *(void *)(v14 + 16);
                  swift_retain();
                  swift_retain();
                  uint64_t v43 = (char *)sub_226A47C50();
                  uint64_t v94 = v41;
                  if (!v43) {
                    goto LABEL_51;
                  }
                  uint64_t v44 = sub_226A47C70();
                  if (__OFSUB__(v42, v44)) {
                    goto LABEL_131;
                  }
                  v43 += v42 - v44;
LABEL_51:
                  sub_226A47C60();
                  if (v21)
                  {
                    uint64_t v93 = v43;
                    if (v21 == 1)
                    {
                      uint64_t v45 = (int)v97;
                      uint64_t v46 = (v97 >> 32) - (int)v97;
                      if (v97 >> 32 < (int)v97) {
                        goto LABEL_135;
                      }
                      swift_retain();
                      uint64_t v47 = sub_226A47C50();
                      if (v47)
                      {
                        uint64_t v48 = v47;
                        uint64_t v49 = sub_226A47C70();
                        if (__OFSUB__(v45, v49)) {
                          goto LABEL_146;
                        }
                        uint64_t v50 = (const void *)(v48 + v45 - v49);
                      }
                      else
                      {
                        uint64_t v50 = 0;
                      }
                      uint64_t v86 = sub_226A47C60();
                      if (v86 >= v46) {
                        size_t v87 = v46;
                      }
                      else {
                        size_t v87 = v86;
                      }
                      if (!v93) {
                        goto LABEL_162;
                      }
                      if (!v50) {
                        goto LABEL_159;
                      }
                      int v69 = memcmp(v93, v50, v87);
                      sub_226A1F5F0(v97, v96);
                    }
                    else
                    {
                      uint64_t v70 = *(void *)(v97 + 16);
                      uint64_t v71 = *(void *)(v97 + 24);
                      swift_retain();
                      swift_retain();
                      uint64_t v72 = sub_226A47C50();
                      if (v72)
                      {
                        uint64_t v73 = v72;
                        uint64_t v74 = sub_226A47C70();
                        if (__OFSUB__(v70, v74)) {
                          goto LABEL_145;
                        }
                        unint64_t v75 = (const void *)(v73 + v70 - v74);
                      }
                      else
                      {
                        unint64_t v75 = 0;
                      }
                      if (__OFSUB__(v71, v70)) {
                        goto LABEL_141;
                      }
                      uint64_t v84 = sub_226A47C60();
                      if (v84 >= v71 - v70) {
                        size_t v85 = v71 - v70;
                      }
                      else {
                        size_t v85 = v84;
                      }
                      a2 = v95;
                      if (!v93) {
                        goto LABEL_157;
                      }
                      if (!v75) {
                        goto LABEL_158;
                      }
                      int v69 = memcmp(v93, v75, v85);
                      swift_release();
                      swift_release();
                    }
                  }
                  else
                  {
                    __s1[0] = v97;
                    LODWORD(__s1[1]) = v96;
                    WORD2(__s1[1]) = WORD2(v96);
                    if (!v43) {
                      goto LABEL_154;
                    }
                    int v69 = memcmp(v43, __s1, BYTE6(v96));
                  }
LABEL_109:
                  swift_release();
                  swift_release();
                  if (v69) {
                    goto LABEL_124;
                  }
                  goto LABEL_121;
                case 3uLL:
                  memset(__s1, 0, 14);
                  if (!v21) {
                    goto LABEL_66;
                  }
                  if (v21 == 1)
                  {
                    uint64_t v51 = (int)v15;
                    uint64_t v26 = (v15 >> 32) - (int)v15;
                    if (v15 >> 32 < (int)v15) {
                      goto LABEL_134;
                    }
                    unint64_t v27 = v16;
                    swift_retain();
                    uint64_t v52 = sub_226A47C50();
                    if (!v52) {
                      goto LABEL_152;
                    }
                    uint64_t v29 = v52;
                    uint64_t v53 = sub_226A47C70();
                    BOOL v20 = __OFSUB__(v51, v53);
                    uint64_t v31 = v51 - v53;
                    if (v20) {
                      goto LABEL_139;
                    }
LABEL_62:
                    uint64_t v54 = sub_226A47C60();
                    if (v54 >= v26) {
                      size_t v55 = v26;
                    }
                    else {
                      size_t v55 = v54;
                    }
                    int v40 = memcmp(__s1, (const void *)(v29 + v31), v55);
                    uint64_t v56 = v97;
                    unint64_t v57 = v27;
                    goto LABEL_120;
                  }
                  uint64_t v64 = *(void *)(v15 + 16);
                  uint64_t v65 = *(void *)(v15 + 24);
                  swift_retain();
                  swift_retain();
                  unint64_t v63 = (char *)sub_226A47C50();
                  if (v63)
                  {
                    uint64_t v66 = sub_226A47C70();
                    if (__OFSUB__(v64, v66)) {
                      goto LABEL_144;
                    }
                    v63 += v64 - v66;
                  }
                  BOOL v20 = __OFSUB__(v65, v64);
                  int64_t v67 = v65 - v64;
                  if (v20) {
                    goto LABEL_136;
                  }
                  uint64_t v68 = sub_226A47C60();
                  if (!v63) {
                    goto LABEL_153;
                  }
LABEL_90:
                  if (v68 >= v67) {
                    size_t v83 = v67;
                  }
                  else {
                    size_t v83 = v68;
                  }
                  int v69 = memcmp(__s1, v63, v83);
                  goto LABEL_109;
                default:
                  __s1[0] = v14;
                  LOWORD(__s1[1]) = v13;
                  BYTE2(__s1[1]) = BYTE2(v13);
                  BYTE3(__s1[1]) = BYTE3(v13);
                  BYTE4(__s1[1]) = BYTE4(v13);
                  BYTE5(__s1[1]) = BYTE5(v13);
                  if (!v21)
                  {
LABEL_66:
                    uint64_t __s2 = v15;
                    __int16 v102 = v16;
                    char v103 = BYTE2(v16);
                    char v104 = BYTE3(v16);
                    char v105 = BYTE4(v16);
                    char v106 = BYTE5(v16);
                    if (memcmp(__s1, &__s2, BYTE6(v16))) {
                      goto LABEL_124;
                    }
                    goto LABEL_121;
                  }
                  if (v21 == 1)
                  {
                    uint64_t v25 = (int)v15;
                    uint64_t v26 = (v15 >> 32) - (int)v15;
                    if (v15 >> 32 < (int)v15) {
                      goto LABEL_133;
                    }
                    unint64_t v27 = v16;
                    swift_retain();
                    uint64_t v28 = sub_226A47C50();
                    if (!v28)
                    {
                      sub_226A47C60();
                      __break(1u);
LABEL_150:
                      __break(1u);
LABEL_151:
                      __break(1u);
LABEL_152:
                      sub_226A47C60();
                      __break(1u);
LABEL_153:
                      __break(1u);
LABEL_154:
                      __break(1u);
LABEL_155:
                      __break(1u);
LABEL_156:
                      __break(1u);
LABEL_157:
                      __break(1u);
LABEL_158:
                      __break(1u);
LABEL_159:
                      __break(1u);
LABEL_160:
                      __break(1u);
LABEL_161:
                      __break(1u);
LABEL_162:
                      __break(1u);
                      JUMPOUT(0x226A41B78);
                    }
                    uint64_t v29 = v28;
                    uint64_t v30 = sub_226A47C70();
                    BOOL v20 = __OFSUB__(v25, v30);
                    uint64_t v31 = v25 - v30;
                    if (v20) {
                      goto LABEL_138;
                    }
                    goto LABEL_62;
                  }
                  uint64_t v58 = *(void *)(v15 + 16);
                  uint64_t v59 = *(void *)(v15 + 24);
                  swift_retain();
                  swift_retain();
                  uint64_t v60 = sub_226A47C50();
                  if (v60)
                  {
                    uint64_t v61 = v60;
                    uint64_t v62 = sub_226A47C70();
                    if (__OFSUB__(v58, v62)) {
                      goto LABEL_143;
                    }
                    unint64_t v63 = (char *)(v61 + v58 - v62);
                  }
                  else
                  {
                    unint64_t v63 = 0;
                  }
                  int64_t v67 = v59 - v58;
                  if (__OFSUB__(v59, v58)) {
                    goto LABEL_137;
                  }
                  uint64_t v68 = sub_226A47C60();
                  a2 = v95;
                  if (!v63) {
                    goto LABEL_156;
                  }
                  goto LABEL_90;
              }
            }
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
            __break(1u);
LABEL_147:
            __break(1u);
LABEL_148:
            __break(1u);
            return result;
          case 2uLL:
            uint64_t v19 = *(void *)(v14 + 16);
            uint64_t v18 = *(void *)(v14 + 24);
            BOOL v20 = __OFSUB__(v18, v19);
            uint64_t v17 = v18 - v19;
            if (!v20) {
              goto LABEL_15;
            }
            goto LABEL_127;
          case 3uLL:
            goto LABEL_15;
          default:
            uint64_t v17 = BYTE6(v13);
            goto LABEL_15;
        }
      }
      break;
    }
LABEL_124:
    sub_226A42CD8((uint64_t)v6, type metadata accessor for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf);
    sub_226A42CD8((uint64_t)v9, type metadata accessor for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf);
  }
  return 0;
}

uint64_t sub_226A41BA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf(0);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (uint64_t *)((char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v5);
  uint64_t v10 = (uint64_t *)((char *)&v16 - v9);
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11 == *(void *)(a2 + 16))
  {
    if (!v11 || a1 == a2) {
      return 1;
    }
    unint64_t v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    uint64_t v17 = *(void *)(v8 + 72);
    while (1)
    {
      sub_226A42C70(a1 + v12, (uint64_t)v10, type metadata accessor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf);
      sub_226A42C70(a2 + v12, (uint64_t)v7, type metadata accessor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf);
      BOOL v13 = *v10 == *v7 && v10[1] == v7[1];
      if (!v13 && (sub_226A48090() & 1) == 0) {
        break;
      }
      BOOL v14 = v10[2] == v7[2] && v10[3] == v7[3];
      if (!v14 && (sub_226A48090() & 1) == 0) {
        break;
      }
      sub_226A47DC0();
      sub_226A42C28(&qword_26814BFA8, MEMORY[0x263F50560]);
      if ((sub_226A48010() & 1) == 0) {
        break;
      }
      sub_226A42CD8((uint64_t)v7, type metadata accessor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf);
      sub_226A42CD8((uint64_t)v10, type metadata accessor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf);
      v12 += v17;
      if (!--v11) {
        return 1;
      }
    }
    sub_226A42CD8((uint64_t)v7, type metadata accessor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf);
    sub_226A42CD8((uint64_t)v10, type metadata accessor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf);
  }
  return 0;
}

uint64_t sub_226A41E0C(uint64_t a1, uint64_t a2)
{
  return sub_226A41E54(a1, a2, MEMORY[0x263F6A588], &qword_26814C690, MEMORY[0x263F6A588], MEMORY[0x263F6A590]);
}

uint64_t sub_226A41E54(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), unint64_t *a4, void (*a5)(uint64_t), uint64_t a6)
{
  uint64_t v37 = a6;
  uint64_t v10 = a3(0);
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v30 - v14;
  uint64_t v16 = *(void *)(a1 + 16);
  if (v16 == *(void *)(a2 + 16))
  {
    if (!v16 || a1 == a2)
    {
      char v24 = 1;
    }
    else
    {
      unint64_t v17 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
      uint64_t v19 = *(void (**)(char *, unint64_t, uint64_t))(v12 + 16);
      uint64_t v18 = v12 + 16;
      uint64_t v34 = v19;
      uint64_t v35 = v13;
      uint64_t v30 = *(void *)(v18 + 56);
      uint64_t v31 = a2;
      uint64_t v36 = v18;
      uint64_t v32 = a1;
      uint64_t v33 = (void (**)(char *, uint64_t))(v18 - 8);
      uint64_t v20 = v16 - 1;
      do
      {
        unint64_t v21 = v34;
        v34(v15, a1 + v17, v10);
        uint64_t v22 = v15;
        uint64_t v23 = v35;
        v21(v35, a2 + v17, v10);
        sub_226A42C28(a4, a5);
        char v24 = sub_226A48010();
        uint64_t v25 = *v33;
        uint64_t v26 = v23;
        uint64_t v15 = v22;
        (*v33)(v26, v10);
        v25(v22, v10);
        BOOL v28 = v20-- != 0;
        if ((v24 & 1) == 0) {
          break;
        }
        v17 += v30;
        a2 = v31;
        a1 = v32;
      }
      while (v28);
    }
  }
  else
  {
    char v24 = 0;
  }
  return v24 & 1;
}

uint64_t sub_226A4206C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ScoreEstimationMarkerProtobuf();
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (float *)((char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v5);
  uint64_t v10 = (float *)((char *)&v18 - v9);
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11 != *(void *)(a2 + 16))
  {
LABEL_17:
    char v14 = 0;
    return v14 & 1;
  }
  if (v11 && a1 != a2)
  {
    unint64_t v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    uint64_t v19 = *(void *)(v8 + 72);
    uint64_t v13 = v11 - 1;
    while (1)
    {
      sub_226A42C70(a1 + v12, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for ScoreEstimationMarkerProtobuf);
      sub_226A42C70(a2 + v12, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for ScoreEstimationMarkerProtobuf);
      if (*(_DWORD *)v10 != *(_DWORD *)v7 || v10[1] != v7[1] || v10[2] != v7[2] || v10[3] != v7[3]) {
        break;
      }
      sub_226A47DC0();
      sub_226A42C28(&qword_26814BFA8, MEMORY[0x263F50560]);
      char v14 = sub_226A48010();
      sub_226A42CD8((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for ScoreEstimationMarkerProtobuf);
      sub_226A42CD8((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for ScoreEstimationMarkerProtobuf);
      BOOL v16 = v13-- != 0;
      if (v14)
      {
        v12 += v19;
        if (v16) {
          continue;
        }
      }
      return v14 & 1;
    }
    sub_226A42CD8((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for ScoreEstimationMarkerProtobuf);
    sub_226A42CD8((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for ScoreEstimationMarkerProtobuf);
    goto LABEL_17;
  }
  char v14 = 1;
  return v14 & 1;
}

uint64_t sub_226A422E4(uint64_t a1, uint64_t a2)
{
  return sub_226A41E54(a1, a2, MEMORY[0x263F69518], &qword_26814C698, MEMORY[0x263F69518], MEMORY[0x263F69520]);
}

uint64_t _s21SeymourServerProtocol23ScoreEstimationProtobufV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_226A47DC0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v16 - v9;
  if (*(_DWORD *)a1 == *(_DWORD *)a2
    && (sub_226A4206C(*(void *)(a1 + 8), *(void *)(a2 + 8)) & 1) != 0
    && *(void *)(a1 + 16) == *(void *)(a2 + 16))
  {
    uint64_t v11 = type metadata accessor for ScoreEstimationProtobuf();
    unint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v12(v10, a1 + *(int *)(v11 + 28), v4);
    v12(v8, a2 + *(int *)(v11 + 28), v4);
    sub_226A42C28(&qword_26814BFA8, MEMORY[0x263F50560]);
    char v13 = sub_226A48010();
    char v14 = *(void (**)(char *, uint64_t))(v5 + 8);
    v14(v8, v4);
    v14(v10, v4);
  }
  else
  {
    char v13 = 0;
  }
  return v13 & 1;
}

uint64_t sub_226A42504()
{
  return sub_226A42C28(&qword_26814C658, (void (*)(uint64_t))type metadata accessor for ScoreEstimationProtobuf);
}

uint64_t sub_226A4254C()
{
  return sub_226A42C28(&qword_26814C660, (void (*)(uint64_t))type metadata accessor for ScoreEstimationProtobuf);
}

uint64_t sub_226A42594()
{
  return sub_226A42C28(&qword_26814C650, (void (*)(uint64_t))type metadata accessor for ScoreEstimationProtobuf);
}

uint64_t sub_226A425DC()
{
  return sub_226A42C28(&qword_26814C668, (void (*)(uint64_t))type metadata accessor for ScoreEstimationProtobuf);
}

uint64_t *initializeBufferWithCopyOfBuffer for ScoreEstimationProtobuf(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_DWORD *)a1 = *(_DWORD *)a2;
    uint64_t v5 = a2[2];
    a1[1] = a2[1];
    a1[2] = v5;
    uint64_t v6 = *(int *)(a3 + 28);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = sub_226A47DC0();
    uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v3;
}

uint64_t destroy for ScoreEstimationProtobuf(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = sub_226A47DC0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

uint64_t initializeWithCopy for ScoreEstimationProtobuf(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  uint64_t v5 = *(int *)(a3 + 28);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  uint64_t v8 = sub_226A47DC0();
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16);
  swift_bridgeObjectRetain();
  v9(v6, v7, v8);
  return a1;
}

uint64_t assignWithCopy for ScoreEstimationProtobuf(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_226A47DC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t initializeWithTake for ScoreEstimationProtobuf(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v4 = *(int *)(a3 + 28);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = sub_226A47DC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t assignWithTake for ScoreEstimationProtobuf(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_226A47DC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for ScoreEstimationProtobuf(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_226A42A04);
}

uint64_t sub_226A42A04(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_226A47DC0();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for ScoreEstimationProtobuf(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_226A42AC8);
}

uint64_t sub_226A42AC8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_226A47DC0();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_226A42B70()
{
  uint64_t result = sub_226A47DC0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_226A42C28(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_226A42C70(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_226A42CD8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_226A42D38()
{
  return sub_226A47D00();
}

uint64_t sub_226A42D70()
{
  return sub_226A47D10();
}

uint64_t sub_226A42DD0()
{
  return sub_226A47CE0();
}

uint64_t sub_226A42E08()
{
  return sub_226A47CF0();
}

uint64_t sub_226A42E68()
{
  return sub_226A47D20();
}

uint64_t sub_226A42EA0()
{
  return sub_226A47D30();
}

uint64_t ServerError.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  v107 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26814C6A0);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = (char *)&v101 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  uint64_t v9 = (char *)&v101 - v8;
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  unint64_t v12 = (char *)&v101 - v11;
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v15 = (char *)&v101 - v14;
  MEMORY[0x270FA5388](v13);
  unint64_t v17 = (char *)&v101 - v16;
  uint64_t v18 = a1;
  uint64_t v19 = sub_226A47D60();
  uint64_t v108 = *(void *)(v19 - 8);
  uint64_t v20 = MEMORY[0x270FA5388](v19);
  uint64_t v21 = MEMORY[0x270FA5388](v20);
  uint64_t v22 = MEMORY[0x270FA5388](v21);
  MEMORY[0x270FA5388](v22);
  uint64_t v24 = MEMORY[0x270FA5388]((char *)&v101 - v23);
  uint64_t v25 = MEMORY[0x270FA5388](v24);
  uint64_t v26 = MEMORY[0x270FA5388](v25);
  uint64_t v27 = MEMORY[0x270FA5388](v26);
  uint64_t v29 = (char *)&v101 - v28;
  uint64_t v30 = MEMORY[0x270FA5388](v27);
  uint64_t v32 = (char *)&v101 - v31;
  uint64_t v33 = MEMORY[0x270FA5388](v30);
  uint64_t v41 = (char *)&v101 - v40;
  if (*(unsigned char *)(v18 + 8) == 1)
  {
    uint64_t v42 = *(void *)v18;
    char v43 = 10;
    uint64_t v106 = 0;
    uint64_t v44 = 0;
    switch(v42)
    {
      case 1:
        uint64_t v44 = 0;
        uint64_t v106 = 1;
        goto LABEL_78;
      case 2:
        uint64_t v106 = *(void *)(v18 + 16);
        uint64_t v44 = swift_bridgeObjectRetain();
        char v43 = 5;
        goto LABEL_78;
      case 3:
        uint64_t v44 = 0;
        uint64_t v106 = 2;
        goto LABEL_78;
      case 4:
        uint64_t v106 = *(void *)(v18 + 40);
        uint64_t v44 = swift_bridgeObjectRetain();
        char v43 = 6;
        goto LABEL_78;
      case 5:
        uint64_t v106 = *(void *)(v18 + 56);
        uint64_t v44 = swift_bridgeObjectRetain();
        char v43 = 7;
        goto LABEL_78;
      case 6:
        uint64_t v106 = *(void *)(v18 + 56);
        uint64_t v44 = swift_bridgeObjectRetain();
        char v43 = 8;
        goto LABEL_78;
      case 7:
        goto LABEL_78;
      case 8:
        uint64_t v106 = *(void *)(v18 + 56);
        uint64_t v44 = swift_bridgeObjectRetain();
        char v43 = 9;
        goto LABEL_78;
      case 9:
        uint64_t v103 = v18;
        uint64_t v57 = *(void *)(v18 + 32);
        uint64_t v58 = *(void *)(v57 + 16);
        if (v58)
        {
          uint64_t v106 = (uint64_t)v36;
          uint64_t v59 = (unsigned int (**)(char *, uint64_t, uint64_t))(v108 + 48);
          uint64_t v60 = (void (**)(char *, char *, uint64_t))(v108 + 32);
          swift_bridgeObjectRetain_n();
          uint64_t v102 = v57;
          uint64_t v61 = v57 + 40;
          uint64_t v62 = (void *)MEMORY[0x263F8EE78];
          char v104 = (unsigned int (**)(char *, uint64_t, uint64_t))v60;
          char v105 = v59;
          do
          {
            swift_bridgeObjectRetain();
            sub_226A47D40();
            if ((*v59)(v15, 1, v19) == 1)
            {
              sub_226A43C20((uint64_t)v15);
            }
            else
            {
              unint64_t v63 = *v60;
              (*v60)(v29, v15, v19);
              v63((char *)v106, v29, v19);
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                uint64_t v62 = (void *)sub_226A459B8(0, v62[2] + 1, 1, v62);
              }
              unint64_t v65 = v62[2];
              unint64_t v64 = v62[3];
              if (v65 >= v64 >> 1) {
                uint64_t v62 = (void *)sub_226A459B8(v64 > 1, v65 + 1, 1, v62);
              }
              v62[2] = v65 + 1;
              unint64_t v66 = (unint64_t)v62
                  + ((*(unsigned __int8 *)(v108 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v108 + 80))
                  + *(void *)(v108 + 72) * v65;
              uint64_t v60 = (void (**)(char *, char *, uint64_t))v104;
              ((void (*)(unint64_t))v63)(v66);
              uint64_t v59 = v105;
            }
            v61 += 16;
            --v58;
          }
          while (v58);
          swift_bridgeObjectRelease_n();
        }
        else
        {
          uint64_t v62 = (void *)MEMORY[0x263F8EE78];
        }
        uint64_t v106 = sub_226A45E34((uint64_t)v62);
        swift_bridgeObjectRelease();
        uint64_t v44 = 0;
        char v43 = 1;
        goto LABEL_77;
      case 10:
        uint64_t v103 = v18;
        uint64_t v67 = *(void *)(v18 + 32);
        uint64_t v68 = *(void *)(v67 + 16);
        if (v68)
        {
          char v105 = v35;
          uint64_t v106 = (uint64_t)v34;
          int v69 = (unsigned int (**)(char *, uint64_t, uint64_t))(v108 + 48);
          uint64_t v70 = (void (**)(unsigned int (**)(char *, uint64_t, uint64_t), char *, uint64_t))(v108 + 32);
          swift_bridgeObjectRetain_n();
          uint64_t v102 = v67;
          uint64_t v71 = v67 + 40;
          uint64_t v72 = (void *)MEMORY[0x263F8EE78];
          char v104 = v69;
          do
          {
            swift_bridgeObjectRetain();
            sub_226A47D40();
            if ((*v69)(v12, 1, v19) == 1)
            {
              sub_226A43C20((uint64_t)v12);
            }
            else
            {
              uint64_t v73 = *v70;
              uint64_t v74 = v105;
              (*v70)(v105, v12, v19);
              v73((unsigned int (**)(char *, uint64_t, uint64_t))v106, (char *)v74, v19);
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                uint64_t v72 = (void *)sub_226A459B8(0, v72[2] + 1, 1, v72);
              }
              unint64_t v76 = v72[2];
              unint64_t v75 = v72[3];
              if (v76 >= v75 >> 1) {
                uint64_t v72 = (void *)sub_226A459B8(v75 > 1, v76 + 1, 1, v72);
              }
              v72[2] = v76 + 1;
              ((void (*)(char *))v73)((char *)v72+ ((*(unsigned __int8 *)(v108 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v108 + 80))+ *(void *)(v108 + 72) * v76);
              int v69 = v104;
            }
            v71 += 16;
            --v68;
          }
          while (v68);
          swift_bridgeObjectRelease_n();
        }
        else
        {
          uint64_t v72 = (void *)MEMORY[0x263F8EE78];
        }
        uint64_t v106 = sub_226A45E34((uint64_t)v72);
        swift_bridgeObjectRelease();
        uint64_t v44 = 0;
        char v43 = 2;
        goto LABEL_77;
      case 11:
        uint64_t v103 = v18;
        uint64_t v77 = *(void *)(v18 + 32);
        uint64_t v78 = *(void *)(v77 + 16);
        if (v78)
        {
          char v105 = (unsigned int (**)(char *, uint64_t, uint64_t))v33;
          uint64_t v106 = (uint64_t)v39;
          uint64_t v79 = (unsigned int (**)(char *, uint64_t, uint64_t))(v108 + 48);
          uint64_t v80 = (void (**)(unsigned int (**)(char *, uint64_t, uint64_t), char *, uint64_t))(v108 + 32);
          swift_bridgeObjectRetain_n();
          uint64_t v102 = v77;
          uint64_t v81 = v77 + 40;
          char v82 = (void *)MEMORY[0x263F8EE78];
          char v104 = v79;
          do
          {
            swift_bridgeObjectRetain();
            sub_226A47D40();
            if ((*v79)(v9, 1, v19) == 1)
            {
              sub_226A43C20((uint64_t)v9);
            }
            else
            {
              size_t v83 = *v80;
              uint64_t v84 = v105;
              (*v80)(v105, v9, v19);
              v83((unsigned int (**)(char *, uint64_t, uint64_t))v106, (char *)v84, v19);
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                char v82 = (void *)sub_226A459B8(0, v82[2] + 1, 1, v82);
              }
              unint64_t v86 = v82[2];
              unint64_t v85 = v82[3];
              if (v86 >= v85 >> 1) {
                char v82 = (void *)sub_226A459B8(v85 > 1, v86 + 1, 1, v82);
              }
              v82[2] = v86 + 1;
              v83((unsigned int (**)(char *, uint64_t, uint64_t))((char *)v82+ ((*(unsigned __int8 *)(v108 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v108 + 80))+ *(void *)(v108 + 72) * v86), (char *)v106, v19);
              uint64_t v79 = v104;
            }
            v81 += 16;
            --v78;
          }
          while (v78);
          swift_bridgeObjectRelease_n();
        }
        else
        {
          char v82 = (void *)MEMORY[0x263F8EE78];
        }
        uint64_t v106 = sub_226A45E34((uint64_t)v82);
        swift_bridgeObjectRelease();
        uint64_t v44 = 0;
        char v43 = 3;
        goto LABEL_77;
      case 12:
        uint64_t v103 = v18;
        uint64_t v87 = *(void *)(v18 + 32);
        uint64_t v88 = *(void *)(v87 + 16);
        if (v88)
        {
          char v105 = v38;
          uint64_t v106 = (uint64_t)v37;
          uint64_t v89 = (unsigned int (**)(char *, uint64_t, uint64_t))(v108 + 48);
          size_t v90 = (void (**)(unsigned int (**)(char *, uint64_t, uint64_t), char *, uint64_t))(v108 + 32);
          swift_bridgeObjectRetain_n();
          uint64_t v102 = v87;
          uint64_t v91 = v87 + 40;
          uint64_t v92 = (void *)MEMORY[0x263F8EE78];
          char v104 = v89;
          do
          {
            swift_bridgeObjectRetain();
            sub_226A47D40();
            if ((*v89)(v6, 1, v19) == 1)
            {
              sub_226A43C20((uint64_t)v6);
            }
            else
            {
              uint64_t v93 = *v90;
              uint64_t v94 = v105;
              (*v90)(v105, v6, v19);
              v93((unsigned int (**)(char *, uint64_t, uint64_t))v106, (char *)v94, v19);
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                uint64_t v92 = (void *)sub_226A459B8(0, v92[2] + 1, 1, v92);
              }
              unint64_t v96 = v92[2];
              unint64_t v95 = v92[3];
              if (v96 >= v95 >> 1) {
                uint64_t v92 = (void *)sub_226A459B8(v95 > 1, v96 + 1, 1, v92);
              }
              v92[2] = v96 + 1;
              v93((unsigned int (**)(char *, uint64_t, uint64_t))((char *)v92+ ((*(unsigned __int8 *)(v108 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v108 + 80))+ *(void *)(v108 + 72) * v96), (char *)v106, v19);
              uint64_t v89 = v104;
            }
            v91 += 16;
            --v88;
          }
          while (v88);
          swift_bridgeObjectRelease_n();
        }
        else
        {
          uint64_t v92 = (void *)MEMORY[0x263F8EE78];
        }
        uint64_t v106 = sub_226A45E34((uint64_t)v92);
        swift_bridgeObjectRelease();
        uint64_t v44 = 0;
        char v43 = 4;
        goto LABEL_77;
      default:
        uint64_t v103 = v18;
        uint64_t v45 = *(void *)(v18 + 32);
        uint64_t v46 = *(void *)(v45 + 16);
        if (v46)
        {
          uint64_t v47 = (unsigned int (**)(char *, uint64_t, uint64_t))(v108 + 48);
          char v105 = (unsigned int (**)(char *, uint64_t, uint64_t))(v108 + 32);
          swift_bridgeObjectRetain_n();
          uint64_t v102 = v45;
          uint64_t v48 = v45 + 40;
          uint64_t v106 = MEMORY[0x263F8EE78];
          char v104 = v47;
          do
          {
            swift_bridgeObjectRetain();
            sub_226A47D40();
            if ((*v47)(v17, 1, v19) == 1)
            {
              sub_226A43C20((uint64_t)v17);
            }
            else
            {
              uint64_t v52 = *v105;
              (*v105)(v41, (uint64_t)v17, v19);
              v52(v32, (uint64_t)v41, v19);
              if (swift_isUniquelyReferenced_nonNull_native()) {
                uint64_t v53 = (char *)v106;
              }
              else {
                uint64_t v53 = (char *)sub_226A459B8(0, *(void *)(v106 + 16) + 1, 1, (void *)v106);
              }
              unint64_t v55 = *((void *)v53 + 2);
              unint64_t v54 = *((void *)v53 + 3);
              if (v55 >= v54 >> 1) {
                uint64_t v53 = (char *)sub_226A459B8(v54 > 1, v55 + 1, 1, v53);
              }
              *((void *)v53 + 2) = v55 + 1;
              unint64_t v56 = (*(unsigned __int8 *)(v108 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v108 + 80);
              uint64_t v106 = (uint64_t)v53;
              v52(&v53[v56 + *(void *)(v108 + 72) * v55], (uint64_t)v32, v19);
              uint64_t v47 = v104;
            }
            v48 += 16;
            --v46;
          }
          while (v46);
          swift_bridgeObjectRelease_n();
          uint64_t v97 = (void *)v106;
        }
        else
        {
          uint64_t v97 = (void *)MEMORY[0x263F8EE78];
        }
        uint64_t v106 = sub_226A45E34((uint64_t)v97);
        swift_bridgeObjectRelease();
        uint64_t v44 = 0;
        char v43 = 0;
LABEL_77:
        uint64_t v18 = v103;
LABEL_78:
        uint64_t v98 = v44;
        char v99 = v43;
        uint64_t result = sub_226A43BC4(v18);
        uint64_t v100 = v107;
        uint64_t *v107 = v106;
        v100[1] = v98;
        *((unsigned char *)v100 + 16) = v99;
        break;
    }
  }
  else
  {
    uint64_t v49 = sub_226A47C90();
    sub_226A46090(&qword_26814C6A8, MEMORY[0x263F69670]);
    swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v49 - 8) + 104))(v50, *MEMORY[0x263F69658], v49);
    swift_willThrow();
    return sub_226A43BC4(v18);
  }
  return result;
}

uint64_t sub_226A43BC4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ServerErrorProtobuf();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_226A43C20(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26814C6A0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t ServerError.protobuf()()
{
  return sub_226A47EF0();
}

uint64_t sub_226A43D38(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v108 = sub_226A47D60();
  uint64_t v110 = *(void *)(v108 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v108);
  v107 = (char *)&v99 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v9);
  uint64_t v106 = (char *)&v99 - v12;
  uint64_t v109 = a2;
  switch(a4)
  {
    case 1:
      *(void *)a1 = 9;
      *(unsigned char *)(a1 + 8) = 1;
      int64_t v33 = *(void *)(a2 + 16);
      uint64_t v14 = MEMORY[0x263F8EE78];
      if (!v33) {
        goto LABEL_62;
      }
      uint64_t v100 = a1;
      uint64_t v101 = v4;
      uint64_t v111 = MEMORY[0x263F8EE78];
      sub_226A45B8C(0, v33, 0);
      int64_t v15 = sub_226A45CB0(a2);
      LODWORD(v17) = v34;
      char v19 = v35 & 1;
      uint64_t v104 = v110 + 16;
      uint64_t v105 = a2 + 56;
      uint64_t v102 = v110 + 8;
      uint64_t v103 = v110 + 32;
      while ((v15 & 0x8000000000000000) == 0 && v15 < 1 << *(unsigned char *)(a2 + 32))
      {
        if (((*(void *)(v105 + (((unint64_t)v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
          goto LABEL_80;
        }
        if (*(_DWORD *)(a2 + 36) != v17) {
          goto LABEL_81;
        }
        uint64_t v36 = v110;
        int64_t v37 = *(void *)(a2 + 48) + *(void *)(v110 + 72) * v15;
        uint64_t v38 = v106;
        uint64_t v39 = v108;
        (*(void (**)(char *, int64_t, uint64_t))(v110 + 16))(v106, v37, v108);
        uint64_t v40 = v107;
        (*(void (**)(char *, char *, uint64_t))(v36 + 32))(v107, v38, v39);
        uint64_t v41 = sub_226A47D50();
        uint64_t v43 = v42;
        (*(void (**)(char *, uint64_t))(v36 + 8))(v40, v39);
        uint64_t v14 = v111;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_226A45B8C(0, *(void *)(v14 + 16) + 1, 1);
          uint64_t v14 = v111;
        }
        unint64_t v45 = *(void *)(v14 + 16);
        unint64_t v44 = *(void *)(v14 + 24);
        if (v45 >= v44 >> 1)
        {
          sub_226A45B8C((char *)(v44 > 1), v45 + 1, 1);
          uint64_t v14 = v111;
        }
        *(void *)(v14 + 16) = v45 + 1;
        uint64_t v46 = v14 + 16 * v45;
        *(void *)(v46 + 32) = v41;
        *(void *)(v46 + 40) = v43;
        a2 = v109;
        int64_t v15 = sub_226A45D50(v15, v17, v19 & 1, v109);
        uint64_t v17 = v47;
        char v19 = v48 & 1;
        if (!--v33) {
          goto LABEL_61;
        }
      }
      goto LABEL_79;
    case 2:
      *(void *)a1 = 10;
      *(unsigned char *)(a1 + 8) = 1;
      int64_t v49 = *(void *)(a2 + 16);
      uint64_t v14 = MEMORY[0x263F8EE78];
      if (!v49) {
        goto LABEL_62;
      }
      uint64_t v100 = a1;
      uint64_t v101 = v4;
      uint64_t v111 = MEMORY[0x263F8EE78];
      sub_226A45B8C(0, v49, 0);
      int64_t v15 = sub_226A45CB0(a2);
      LODWORD(v17) = v50;
      char v19 = v51 & 1;
      uint64_t v104 = v110 + 16;
      uint64_t v105 = a2 + 56;
      uint64_t v102 = v110 + 8;
      uint64_t v103 = v110 + 32;
      while ((v15 & 0x8000000000000000) == 0 && v15 < 1 << *(unsigned char *)(a2 + 32))
      {
        if (((*(void *)(v105 + (((unint64_t)v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
          goto LABEL_83;
        }
        if (*(_DWORD *)(a2 + 36) != v17) {
          goto LABEL_84;
        }
        uint64_t v52 = v110;
        int64_t v53 = *(void *)(a2 + 48) + *(void *)(v110 + 72) * v15;
        unint64_t v54 = v106;
        uint64_t v55 = v108;
        (*(void (**)(char *, int64_t, uint64_t))(v110 + 16))(v106, v53, v108);
        unint64_t v56 = v107;
        (*(void (**)(char *, char *, uint64_t))(v52 + 32))(v107, v54, v55);
        uint64_t v57 = sub_226A47D50();
        uint64_t v59 = v58;
        (*(void (**)(char *, uint64_t))(v52 + 8))(v56, v55);
        uint64_t v14 = v111;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_226A45B8C(0, *(void *)(v14 + 16) + 1, 1);
          uint64_t v14 = v111;
        }
        unint64_t v61 = *(void *)(v14 + 16);
        unint64_t v60 = *(void *)(v14 + 24);
        if (v61 >= v60 >> 1)
        {
          sub_226A45B8C((char *)(v60 > 1), v61 + 1, 1);
          uint64_t v14 = v111;
        }
        *(void *)(v14 + 16) = v61 + 1;
        uint64_t v62 = v14 + 16 * v61;
        *(void *)(v62 + 32) = v57;
        *(void *)(v62 + 40) = v59;
        a2 = v109;
        int64_t v15 = sub_226A45D50(v15, v17, v19 & 1, v109);
        uint64_t v17 = v63;
        char v19 = v64 & 1;
        if (!--v49) {
          goto LABEL_61;
        }
      }
      goto LABEL_82;
    case 3:
      *(void *)a1 = 11;
      *(unsigned char *)(a1 + 8) = 1;
      int64_t v65 = *(void *)(a2 + 16);
      uint64_t v14 = MEMORY[0x263F8EE78];
      if (!v65) {
        goto LABEL_62;
      }
      uint64_t v100 = a1;
      uint64_t v101 = v4;
      uint64_t v111 = MEMORY[0x263F8EE78];
      sub_226A45B8C(0, v65, 0);
      int64_t v15 = sub_226A45CB0(a2);
      LODWORD(v17) = v66;
      char v19 = v67 & 1;
      uint64_t v104 = v110 + 16;
      uint64_t v105 = a2 + 56;
      uint64_t v102 = v110 + 8;
      uint64_t v103 = v110 + 32;
      while ((v15 & 0x8000000000000000) == 0 && v15 < 1 << *(unsigned char *)(a2 + 32))
      {
        if (((*(void *)(v105 + (((unint64_t)v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
          goto LABEL_86;
        }
        if (*(_DWORD *)(a2 + 36) != v17) {
          goto LABEL_87;
        }
        uint64_t v68 = v110;
        int64_t v69 = *(void *)(a2 + 48) + *(void *)(v110 + 72) * v15;
        uint64_t v70 = v106;
        uint64_t v71 = v108;
        (*(void (**)(char *, int64_t, uint64_t))(v110 + 16))(v106, v69, v108);
        uint64_t v72 = v107;
        (*(void (**)(char *, char *, uint64_t))(v68 + 32))(v107, v70, v71);
        uint64_t v73 = sub_226A47D50();
        uint64_t v75 = v74;
        (*(void (**)(char *, uint64_t))(v68 + 8))(v72, v71);
        uint64_t v14 = v111;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_226A45B8C(0, *(void *)(v14 + 16) + 1, 1);
          uint64_t v14 = v111;
        }
        unint64_t v77 = *(void *)(v14 + 16);
        unint64_t v76 = *(void *)(v14 + 24);
        if (v77 >= v76 >> 1)
        {
          sub_226A45B8C((char *)(v76 > 1), v77 + 1, 1);
          uint64_t v14 = v111;
        }
        *(void *)(v14 + 16) = v77 + 1;
        uint64_t v78 = v14 + 16 * v77;
        *(void *)(v78 + 32) = v73;
        *(void *)(v78 + 40) = v75;
        a2 = v109;
        int64_t v15 = sub_226A45D50(v15, v17, v19 & 1, v109);
        uint64_t v17 = v79;
        char v19 = v80 & 1;
        if (!--v65) {
          goto LABEL_61;
        }
      }
      goto LABEL_85;
    case 4:
      *(void *)a1 = 12;
      *(unsigned char *)(a1 + 8) = 1;
      int64_t v81 = *(void *)(a2 + 16);
      uint64_t v14 = MEMORY[0x263F8EE78];
      if (!v81) {
        goto LABEL_62;
      }
      uint64_t v100 = a1;
      uint64_t v101 = v4;
      uint64_t v111 = MEMORY[0x263F8EE78];
      sub_226A45B8C(0, v81, 0);
      int64_t v15 = sub_226A45CB0(a2);
      LODWORD(v17) = v82;
      char v19 = v83 & 1;
      uint64_t v104 = v110 + 16;
      uint64_t v105 = a2 + 56;
      uint64_t v102 = v110 + 8;
      uint64_t v103 = v110 + 32;
      while ((v15 & 0x8000000000000000) == 0 && v15 < 1 << *(unsigned char *)(a2 + 32))
      {
        if (((*(void *)(v105 + (((unint64_t)v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
          goto LABEL_89;
        }
        if (*(_DWORD *)(a2 + 36) != v17) {
          goto LABEL_90;
        }
        uint64_t v84 = v110;
        int64_t v85 = *(void *)(a2 + 48) + *(void *)(v110 + 72) * v15;
        unint64_t v86 = v106;
        uint64_t v87 = v108;
        (*(void (**)(char *, int64_t, uint64_t))(v110 + 16))(v106, v85, v108);
        uint64_t v88 = v107;
        (*(void (**)(char *, char *, uint64_t))(v84 + 32))(v107, v86, v87);
        uint64_t v89 = sub_226A47D50();
        uint64_t v91 = v90;
        (*(void (**)(char *, uint64_t))(v84 + 8))(v88, v87);
        uint64_t v14 = v111;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_226A45B8C(0, *(void *)(v14 + 16) + 1, 1);
          uint64_t v14 = v111;
        }
        unint64_t v93 = *(void *)(v14 + 16);
        unint64_t v92 = *(void *)(v14 + 24);
        if (v93 >= v92 >> 1)
        {
          sub_226A45B8C((char *)(v92 > 1), v93 + 1, 1);
          uint64_t v14 = v111;
        }
        *(void *)(v14 + 16) = v93 + 1;
        uint64_t v94 = v14 + 16 * v93;
        *(void *)(v94 + 32) = v89;
        *(void *)(v94 + 40) = v91;
        a2 = v109;
        int64_t v15 = sub_226A45D50(v15, v17, v19 & 1, v109);
        uint64_t v17 = v95;
        char v19 = v96 & 1;
        if (!--v81) {
          goto LABEL_61;
        }
      }
      goto LABEL_88;
    case 5:
      *(void *)a1 = 2;
      *(unsigned char *)(a1 + 8) = 1;
      swift_bridgeObjectRetain();
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)(a1 + 16) = a2;
      *(void *)(a1 + 24) = a3;
      return result;
    case 6:
      *(void *)a1 = 4;
      *(unsigned char *)(a1 + 8) = 1;
      swift_bridgeObjectRetain();
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)(a1 + 40) = a2;
      *(void *)(a1 + 48) = a3;
      return result;
    case 7:
      uint64_t v97 = 5;
      goto LABEL_68;
    case 8:
      uint64_t v97 = 6;
      goto LABEL_68;
    case 9:
      uint64_t v97 = 8;
LABEL_68:
      *(void *)a1 = v97;
      *(unsigned char *)(a1 + 8) = 1;
      swift_bridgeObjectRetain();
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)(a1 + 56) = a2;
      *(void *)(a1 + 64) = a3;
      return result;
    case 10:
      if (a2 | a3)
      {
        if (!(a2 ^ 1 | a3))
        {
          *(void *)a1 = 1;
          *(unsigned char *)(a1 + 8) = 1;
          return result;
        }
        uint64_t v98 = 3;
      }
      else
      {
        uint64_t v98 = 7;
      }
      *(void *)a1 = v98;
      *(unsigned char *)(a1 + 8) = 1;
      return result;
    default:
      *(void *)a1 = 0;
      *(unsigned char *)(a1 + 8) = 1;
      int64_t v13 = *(void *)(a2 + 16);
      uint64_t v14 = MEMORY[0x263F8EE78];
      if (!v13) {
        goto LABEL_62;
      }
      uint64_t v100 = a1;
      uint64_t v101 = v4;
      uint64_t v111 = MEMORY[0x263F8EE78];
      sub_226A45B8C(0, v13, 0);
      int64_t v15 = sub_226A45CB0(a2);
      LODWORD(v17) = v16;
      char v19 = v18 & 1;
      uint64_t v104 = v110 + 16;
      uint64_t v105 = a2 + 56;
      uint64_t v102 = v110 + 8;
      uint64_t v103 = v110 + 32;
      break;
  }
  do
  {
    if (v15 < 0 || v15 >= 1 << *(unsigned char *)(a2 + 32))
    {
      __break(1u);
LABEL_77:
      __break(1u);
LABEL_78:
      __break(1u);
LABEL_79:
      __break(1u);
LABEL_80:
      __break(1u);
LABEL_81:
      __break(1u);
LABEL_82:
      __break(1u);
LABEL_83:
      __break(1u);
LABEL_84:
      __break(1u);
LABEL_85:
      __break(1u);
LABEL_86:
      __break(1u);
LABEL_87:
      __break(1u);
LABEL_88:
      __break(1u);
LABEL_89:
      __break(1u);
LABEL_90:
      __break(1u);
      JUMPOUT(0x226A44848);
    }
    if (((*(void *)(v105 + (((unint64_t)v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
      goto LABEL_77;
    }
    if (*(_DWORD *)(a2 + 36) != v17) {
      goto LABEL_78;
    }
    uint64_t v20 = v110;
    int64_t v21 = *(void *)(a2 + 48) + *(void *)(v110 + 72) * v15;
    uint64_t v22 = v106;
    uint64_t v23 = v108;
    (*(void (**)(char *, int64_t, uint64_t))(v110 + 16))(v106, v21, v108);
    uint64_t v24 = v107;
    (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v107, v22, v23);
    uint64_t v25 = sub_226A47D50();
    uint64_t v27 = v26;
    (*(void (**)(char *, uint64_t))(v20 + 8))(v24, v23);
    uint64_t v14 = v111;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_226A45B8C(0, *(void *)(v14 + 16) + 1, 1);
      uint64_t v14 = v111;
    }
    unint64_t v29 = *(void *)(v14 + 16);
    unint64_t v28 = *(void *)(v14 + 24);
    if (v29 >= v28 >> 1)
    {
      sub_226A45B8C((char *)(v28 > 1), v29 + 1, 1);
      uint64_t v14 = v111;
    }
    *(void *)(v14 + 16) = v29 + 1;
    uint64_t v30 = v14 + 16 * v29;
    *(void *)(v30 + 32) = v25;
    *(void *)(v30 + 40) = v27;
    a2 = v109;
    int64_t v15 = sub_226A45D50(v15, v17, v19 & 1, v109);
    uint64_t v17 = v31;
    char v19 = v32 & 1;
    --v13;
  }
  while (v13);
LABEL_61:
  sub_226A46080(v15, v17, v19);
  a1 = v100;
LABEL_62:
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = v14;
  return result;
}

uint64_t sub_226A44874@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return ServerError.init(_:)(a1, a2);
}

uint64_t sub_226A4488C()
{
  return sub_226A47EF0();
}

uint64_t sub_226A44944()
{
  return sub_226A47D30();
}

uint64_t sub_226A4495C()
{
  return sub_226A47D20();
}

uint64_t sub_226A44974()
{
  return sub_226A47CF0();
}

uint64_t sub_226A4498C()
{
  return sub_226A47CE0();
}

uint64_t sub_226A449A4(uint64_t a1, char *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_226A47D60();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  sub_226A46090(&qword_26814C320, MEMORY[0x263F6B2B8]);
  swift_bridgeObjectRetain();
  int64_t v33 = a2;
  uint64_t v11 = sub_226A47FF0();
  uint64_t v12 = -1 << *(unsigned char *)(v10 + 32);
  unint64_t v13 = v11 & ~v12;
  uint64_t v32 = v10 + 56;
  if ((*(void *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    unint64_t v28 = v2;
    uint64_t v29 = a1;
    uint64_t v30 = ~v12;
    uint64_t v27 = v7;
    int v16 = *(void (**)(void, void, void))(v7 + 16);
    uint64_t v15 = v7 + 16;
    uint64_t v14 = v16;
    uint64_t v31 = *(void *)(v15 + 56);
    uint64_t v17 = (void (**)(char *, uint64_t))(v15 - 8);
    v26[1] = v15 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    while (1)
    {
      uint64_t v18 = v10;
      unint64_t v19 = v31 * v13;
      uint64_t v20 = v14;
      v14(v9, *(void *)(v10 + 48) + v31 * v13, v6);
      sub_226A46090(&qword_26814C328, MEMORY[0x263F6B2B8]);
      char v21 = sub_226A48010();
      uint64_t v22 = *v17;
      (*v17)(v9, v6);
      if (v21) {
        break;
      }
      unint64_t v13 = (v13 + 1) & v30;
      uint64_t v10 = v18;
      uint64_t v14 = v20;
      if (((*(void *)(v32 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v3 = v28;
        a1 = v29;
        uint64_t v7 = v27;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v22(v33, v6);
    v20(v29, *(void *)(*v28 + 48) + v19, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v14 = *(void (**)(void, void, void))(v7 + 16);
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v24 = v33;
    v14(v9, v33, v6);
    uint64_t v34 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_226A450C4((uint64_t)v9, v13, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v34;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v24, v6);
    return 1;
  }
}

uint64_t sub_226A44CC8()
{
  unint64_t v1 = v0;
  uint64_t v42 = sub_226A47D60();
  uint64_t v2 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  uint64_t v41 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26814C6C0);
  uint64_t v5 = sub_226A48060();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    uint64_t v8 = *(void *)(v4 + 56);
    int64_t v37 = (void *)(v4 + 56);
    if (v7 < 64) {
      uint64_t v9 = ~(-1 << v7);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & v8;
    char v35 = v0;
    int64_t v36 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v39 = v2;
    uint64_t v11 = v5 + 56;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    uint64_t v38 = v6;
    uint64_t v14 = v41;
    uint64_t v15 = v42;
    while (1)
    {
      if (v10)
      {
        unint64_t v17 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        int64_t v40 = v13;
        unint64_t v18 = v17 | (v13 << 6);
      }
      else
      {
        int64_t v19 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v19 >= v36) {
          goto LABEL_33;
        }
        unint64_t v20 = v37[v19];
        int64_t v21 = v13 + 1;
        if (!v20)
        {
          int64_t v21 = v13 + 2;
          if (v13 + 2 >= v36) {
            goto LABEL_33;
          }
          unint64_t v20 = v37[v21];
          if (!v20)
          {
            int64_t v21 = v13 + 3;
            if (v13 + 3 >= v36) {
              goto LABEL_33;
            }
            unint64_t v20 = v37[v21];
            if (!v20)
            {
              uint64_t v22 = v13 + 4;
              if (v13 + 4 >= v36)
              {
LABEL_33:
                swift_release();
                unint64_t v1 = v35;
                uint64_t v34 = 1 << *(unsigned char *)(v4 + 32);
                if (v34 > 63) {
                  bzero(v37, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v37 = -1 << v34;
                }
                *(void *)(v4 + 16) = 0;
                break;
              }
              unint64_t v20 = v37[v22];
              if (!v20)
              {
                while (1)
                {
                  int64_t v21 = v22 + 1;
                  if (__OFADD__(v22, 1)) {
                    goto LABEL_39;
                  }
                  if (v21 >= v36) {
                    goto LABEL_33;
                  }
                  unint64_t v20 = v37[v21];
                  ++v22;
                  if (v20) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v21 = v13 + 4;
            }
          }
        }
LABEL_23:
        unint64_t v10 = (v20 - 1) & v20;
        int64_t v40 = v21;
        unint64_t v18 = __clz(__rbit64(v20)) + (v21 << 6);
      }
      uint64_t v23 = v4;
      uint64_t v24 = *(void *)(v4 + 48);
      uint64_t v25 = *(void *)(v39 + 72);
      uint64_t v26 = *(void (**)(char *, unint64_t, uint64_t))(v39 + 32);
      v26(v14, v24 + v25 * v18, v15);
      uint64_t v6 = v38;
      sub_226A46090(&qword_26814C320, MEMORY[0x263F6B2B8]);
      uint64_t result = sub_226A47FF0();
      uint64_t v27 = -1 << *(unsigned char *)(v6 + 32);
      unint64_t v28 = result & ~v27;
      unint64_t v29 = v28 >> 6;
      if (((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v30 = 0;
        unint64_t v31 = (unint64_t)(63 - v27) >> 6;
        do
        {
          if (++v29 == v31 && (v30 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v32 = v29 == v31;
          if (v29 == v31) {
            unint64_t v29 = 0;
          }
          v30 |= v32;
          uint64_t v33 = *(void *)(v11 + 8 * v29);
        }
        while (v33 == -1);
        unint64_t v16 = __clz(__rbit64(~v33)) + (v29 << 6);
      }
      *(void *)(v11 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v26)(*(void *)(v6 + 48) + v16 * v25, v41, v42);
      ++*(void *)(v6 + 16);
      uint64_t v4 = v23;
      int64_t v13 = v40;
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v6;
  return result;
}

uint64_t sub_226A450C4(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v31 = a1;
  uint64_t v6 = sub_226A47D60();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = *(void *)(*v3 + 16);
  unint64_t v11 = *(void *)(*v3 + 24);
  unint64_t v28 = v3;
  uint64_t v29 = v7;
  if (v11 > v10 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_226A44CC8();
  }
  else
  {
    if (v11 > v10)
    {
      sub_226A45364();
      goto LABEL_12;
    }
    sub_226A45608();
  }
  uint64_t v12 = *v3;
  sub_226A46090(&qword_26814C320, MEMORY[0x263F6B2B8]);
  uint64_t v13 = sub_226A47FF0();
  uint64_t v14 = -1 << *(unsigned char *)(v12 + 32);
  a2 = v13 & ~v14;
  uint64_t v30 = v12;
  uint64_t v15 = v12 + 56;
  if ((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v16 = ~v14;
    int64_t v19 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    uint64_t v18 = v7 + 16;
    unint64_t v17 = v19;
    uint64_t v20 = *(void *)(v18 + 56);
    do
    {
      v17(v9, *(void *)(v30 + 48) + v20 * a2, v6);
      sub_226A46090(&qword_26814C328, MEMORY[0x263F6B2B8]);
      char v21 = sub_226A48010();
      (*(void (**)(char *, uint64_t))(v18 - 8))(v9, v6);
      if (v21) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v16;
    }
    while (((*(void *)(v15 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  uint64_t v22 = v29;
  uint64_t v23 = *v28;
  *(void *)(v23 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v22 + 32))(*(void *)(v23 + 48) + *(void *)(v22 + 72) * a2, v31, v6);
  uint64_t v25 = *(void *)(v23 + 16);
  BOOL v26 = __OFADD__(v25, 1);
  uint64_t v27 = v25 + 1;
  if (!v26)
  {
    *(void *)(v23 + 16) = v27;
    return result;
  }
  __break(1u);
LABEL_15:
  uint64_t result = sub_226A480A0();
  __break(1u);
  return result;
}

void *sub_226A45364()
{
  unint64_t v1 = v0;
  uint64_t v2 = sub_226A47D60();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26814C6C0);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_226A48050();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_27:
    uint64_t *v1 = v8;
    return result;
  }
  uint64_t v22 = v1;
  uint64_t result = (void *)(v7 + 56);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v10) {
    uint64_t result = memmove(result, (const void *)(v6 + 56), 8 * v10);
  }
  uint64_t v23 = v6 + 56;
  int64_t v11 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v6 + 56);
  int64_t v24 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v18 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v18 >= v24) {
      goto LABEL_25;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v18);
    ++v11;
    if (!v19)
    {
      int64_t v11 = v18 + 1;
      if (v18 + 1 >= v24) {
        goto LABEL_25;
      }
      unint64_t v19 = *(void *)(v23 + 8 * v11);
      if (!v19)
      {
        int64_t v11 = v18 + 2;
        if (v18 + 2 >= v24) {
          goto LABEL_25;
        }
        unint64_t v19 = *(void *)(v23 + 8 * v11);
        if (!v19) {
          break;
        }
      }
    }
LABEL_24:
    unint64_t v14 = (v19 - 1) & v19;
    unint64_t v16 = __clz(__rbit64(v19)) + (v11 << 6);
LABEL_9:
    unint64_t v17 = *(void *)(v3 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(v6 + 48) + v17, v2);
    uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v8 + 48) + v17, v5, v2);
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v24)
  {
LABEL_25:
    uint64_t result = (void *)swift_release();
    unint64_t v1 = v22;
    goto LABEL_27;
  }
  unint64_t v19 = *(void *)(v23 + 8 * v20);
  if (v19)
  {
    int64_t v11 = v20;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v11 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v11 >= v24) {
      goto LABEL_25;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v11);
    ++v20;
    if (v19) {
      goto LABEL_24;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_226A45608()
{
  unint64_t v1 = v0;
  uint64_t v2 = sub_226A47D60();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26814C6C0);
  uint64_t v7 = sub_226A48060();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v8;
    return result;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v10 = *(void *)(v6 + 56);
  uint64_t v34 = v0;
  uint64_t v35 = v6 + 56;
  if (v9 < 64) {
    uint64_t v11 = ~(-1 << v9);
  }
  else {
    uint64_t v11 = -1;
  }
  unint64_t v12 = v11 & v10;
  int64_t v36 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v37 = v3 + 16;
  uint64_t v13 = v7 + 56;
  uint64_t v38 = v3;
  unint64_t v14 = (uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32);
  uint64_t result = swift_retain();
  int64_t v16 = 0;
  while (1)
  {
    if (v12)
    {
      unint64_t v18 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v19 = v18 | (v16 << 6);
      goto LABEL_24;
    }
    int64_t v20 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v20 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v20);
    ++v16;
    if (!v21)
    {
      int64_t v16 = v20 + 1;
      if (v20 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v21 = *(void *)(v35 + 8 * v16);
      if (!v21)
      {
        int64_t v16 = v20 + 2;
        if (v20 + 2 >= v36) {
          goto LABEL_33;
        }
        unint64_t v21 = *(void *)(v35 + 8 * v16);
        if (!v21) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v19 = __clz(__rbit64(v21)) + (v16 << 6);
LABEL_24:
    uint64_t v23 = v6;
    uint64_t v24 = *(void *)(v6 + 48);
    uint64_t v25 = *(void *)(v38 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v38 + 16))(v5, v24 + v25 * v19, v2);
    sub_226A46090(&qword_26814C320, MEMORY[0x263F6B2B8]);
    uint64_t result = sub_226A47FF0();
    uint64_t v26 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v29 = 0;
      unint64_t v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v31 = v28 == v30;
        if (v28 == v30) {
          unint64_t v28 = 0;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v13 + 8 * v28);
      }
      while (v32 == -1);
      unint64_t v17 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t result = (*v14)(*(void *)(v8 + 48) + v17 * v25, v5, v2);
    ++*(void *)(v8 + 16);
    uint64_t v6 = v23;
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v36)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    unint64_t v1 = v34;
    goto LABEL_35;
  }
  unint64_t v21 = *(void *)(v35 + 8 * v22);
  if (v21)
  {
    int64_t v16 = v22;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v16 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v16 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v16);
    ++v22;
    if (v21) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

size_t sub_226A459B8(size_t result, int64_t a2, char a3, void *a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26814C6B8);
  uint64_t v10 = *(void *)(sub_226A47D60() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  uint64_t result = _swift_stdlib_malloc_size(v13);
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
  uint64_t v15 = *(void *)(sub_226A47D60() - 8);
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

char *sub_226A45B8C(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_226A45BAC(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_226A45BAC(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26814C6B0);
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
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t sub_226A45CB0(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
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
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  if (v6 < 8) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3) {
    unint64_t v7 = 3;
  }
  unint64_t v8 = v7 - 3;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 128;
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

int64_t sub_226A45D50(int64_t result, int a2, char a3, uint64_t a4)
{
  if (a3) {
    goto LABEL_20;
  }
  unint64_t v4 = result;
  if (result < 0 || (uint64_t result = 1 << *(unsigned char *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  unint64_t v5 = v4 >> 6;
  uint64_t v6 = a4 + 56;
  unint64_t v7 = *(void *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  unint64_t v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8) {
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  }
  unint64_t v9 = v5 + 1;
  unint64_t v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    unint64_t v11 = *(void *)(v6 + 8 * v9);
    if (v11) {
      return __clz(__rbit64(v11)) + (v9 << 6);
    }
    unint64_t v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      unint64_t v11 = *(void *)(v6 + 8 * v9);
      if (v11) {
        return __clz(__rbit64(v11)) + (v9 << 6);
      }
      while (v10 - 3 != v5)
      {
        unint64_t v11 = *(void *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          unint64_t v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

uint64_t sub_226A45E34(uint64_t a1)
{
  uint64_t v2 = sub_226A47D60();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  unint64_t v8 = (char *)&v16 - v7;
  uint64_t v9 = *(void *)(a1 + 16);
  sub_226A46090(&qword_26814C320, MEMORY[0x263F6B2B8]);
  uint64_t result = sub_226A48030();
  uint64_t v17 = result;
  if (v9)
  {
    uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    uint64_t v12 = v13;
    uint64_t v14 = a1 + ((*(unsigned __int8 *)(v11 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 64));
    uint64_t v15 = *(void *)(v11 + 56);
    do
    {
      v12(v6, v14, v2);
      sub_226A449A4((uint64_t)v8, v6);
      (*(void (**)(char *, uint64_t))(v11 - 8))(v8, v2);
      v14 += v15;
      --v9;
    }
    while (v9);
    return v17;
  }
  return result;
}

uint64_t sub_226A45FD0(uint64_t a1)
{
  return sub_226A43D38(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(unsigned char *)(v1 + 32));
}

uint64_t sub_226A45FF0()
{
  return sub_226A46090(&qword_26814C158, (void (*)(uint64_t))type metadata accessor for ServerErrorProtobuf);
}

uint64_t sub_226A46038()
{
  return sub_226A46090(&qword_26814C160, (void (*)(uint64_t))type metadata accessor for ServerErrorProtobuf);
}

uint64_t sub_226A46080(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_226A46090(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_226A460D8(uint64_t a1)
{
  return sub_226A45FD0(a1);
}

uint64_t ExecuteTasksRequestProtobuf.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_226A47DC0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t ExecuteTasksRequestProtobuf.unknownFields.setter(uint64_t a1)
{
  uint64_t v3 = sub_226A47DC0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 40);

  return v4(v1, a1, v3);
}

uint64_t (*ExecuteTasksRequestProtobuf.unknownFields.modify())()
{
  return nullsub_1;
}

uint64_t ExecuteTasksResponseProtobuf.executedTasksCount.getter()
{
  return *v0;
}

uint64_t ExecuteTasksResponseProtobuf.executedTasksCount.setter(uint64_t result)
{
  _DWORD *v1 = result;
  return result;
}

uint64_t (*ExecuteTasksResponseProtobuf.executedTasksCount.modify())()
{
  return nullsub_1;
}

uint64_t ExecuteTasksResponseProtobuf.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ExecuteTasksResponseProtobuf(0) + 20);
  uint64_t v4 = sub_226A47DC0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for ExecuteTasksResponseProtobuf(uint64_t a1)
{
  return sub_226A1FDB8(a1, (uint64_t *)&unk_26814C748);
}

uint64_t ExecuteTasksResponseProtobuf.unknownFields.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ExecuteTasksResponseProtobuf(0) + 20);
  uint64_t v4 = sub_226A47DC0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40);

  return v5(v3, a1, v4);
}

uint64_t (*ExecuteTasksResponseProtobuf.unknownFields.modify())()
{
  return nullsub_1;
}

uint64_t ExecuteTasksResponseProtobuf.init()@<X0>(_DWORD *a1@<X8>)
{
  *a1 = 0;
  type metadata accessor for ExecuteTasksResponseProtobuf(0);
  return _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
}

unint64_t static ExecuteTasksRequestProtobuf.protoMessageName.getter()
{
  return 0xD00000000000001BLL;
}

uint64_t sub_226A463C0()
{
  uint64_t v0 = sub_226A47FE0();
  __swift_allocate_value_buffer(v0, qword_26814C6C8);
  __swift_project_value_buffer(v0, (uint64_t)qword_26814C6C8);
  return sub_226A47FD0();
}

uint64_t static ExecuteTasksRequestProtobuf._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_226A21AE8(&qword_26814BF20, (uint64_t)qword_26814C6C8, a1);
}

uint64_t ExecuteTasksRequestProtobuf.decodeMessage<A>(decoder:)()
{
  do
    uint64_t result = sub_226A47E10();
  while (!v0 && (v2 & 1) == 0);
  return result;
}

uint64_t ExecuteTasksRequestProtobuf.traverse<A>(visitor:)()
{
  return sub_226A47DA0();
}

uint64_t static ExecuteTasksRequestProtobuf.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_226A47DC0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  unint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  unint64_t v10 = (char *)&v14 - v9;
  uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v11((char *)&v14 - v9, a1, v4);
  v11(v8, a2, v4);
  sub_226A46858(&qword_26814BFA8, MEMORY[0x263F50560]);
  LOBYTE(a2) = sub_226A48010();
  uint64_t v12 = *(void (**)(char *, uint64_t))(v5 + 8);
  v12(v8, v4);
  v12(v10, v4);
  return a2 & 1;
}

uint64_t ExecuteTasksRequestProtobuf.hashValue.getter()
{
  return sub_226A46D18((void (*)(void))type metadata accessor for ExecuteTasksRequestProtobuf, &qword_26814C6F8, (void (*)(uint64_t))type metadata accessor for ExecuteTasksRequestProtobuf);
}

unint64_t sub_226A46664()
{
  return 0xD00000000000001BLL;
}

uint64_t sub_226A46680()
{
  return ExecuteTasksRequestProtobuf.decodeMessage<A>(decoder:)();
}

uint64_t sub_226A46698()
{
  return ExecuteTasksRequestProtobuf.traverse<A>(visitor:)();
}

uint64_t sub_226A466B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_226A46858((unint64_t *)&unk_26814C760, (void (*)(uint64_t))type metadata accessor for ExecuteTasksRequestProtobuf);

  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_226A4672C@<X0>(uint64_t a1@<X8>)
{
  return sub_226A2234C(&qword_26814BF20, (uint64_t)qword_26814C6C8, a1);
}

uint64_t sub_226A46750(uint64_t a1)
{
  uint64_t v2 = sub_226A46858(&qword_26814C710, (void (*)(uint64_t))type metadata accessor for ExecuteTasksRequestProtobuf);

  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_226A467BC()
{
  sub_226A46858(&qword_26814C710, (void (*)(uint64_t))type metadata accessor for ExecuteTasksRequestProtobuf);

  return sub_226A47EE0();
}

uint64_t type metadata accessor for ExecuteTasksRequestProtobuf(uint64_t a1)
{
  return sub_226A1FDB8(a1, (uint64_t *)&unk_26814C738);
}

uint64_t sub_226A46858(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_226A468A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_226A47DC0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  unint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  unint64_t v10 = (char *)&v14 - v9;
  uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v11((char *)&v14 - v9, a1, v4);
  v11(v8, a2, v4);
  sub_226A46858(&qword_26814BFA8, MEMORY[0x263F50560]);
  LOBYTE(a2) = sub_226A48010();
  uint64_t v12 = *(void (**)(char *, uint64_t))(v5 + 8);
  v12(v8, v4);
  v12(v10, v4);
  return a2 & 1;
}

unint64_t static ExecuteTasksResponseProtobuf.protoMessageName.getter()
{
  return 0xD00000000000001CLL;
}

uint64_t sub_226A46A48()
{
  uint64_t v0 = sub_226A47FE0();
  __swift_allocate_value_buffer(v0, qword_26814C6E0);
  __swift_project_value_buffer(v0, (uint64_t)qword_26814C6E0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26814BFB0);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26814BFB8) - 8);
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_226A483E0;
  unint64_t v4 = v3 + v2 + v1[14];
  *(void *)(v3 + v2) = 1;
  *(void *)unint64_t v4 = "executedTasksCount";
  *(void *)(v4 + 8) = 18;
  *(unsigned char *)(v4 + 16) = 2;
  uint64_t v5 = *MEMORY[0x263F50718];
  uint64_t v6 = sub_226A47FB0();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 104))(v4, v5, v6);
  return sub_226A47FC0();
}

uint64_t static ExecuteTasksResponseProtobuf._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_226A21AE8(&qword_26814BF28, (uint64_t)qword_26814C6E0, a1);
}

uint64_t ExecuteTasksResponseProtobuf.decodeMessage<A>(decoder:)()
{
  while (1)
  {
    uint64_t result = sub_226A47E10();
    if (v0 || (v2 & 1) != 0) {
      break;
    }
    if (result == 1) {
      sub_226A47E50();
    }
  }
  return result;
}

uint64_t ExecuteTasksResponseProtobuf.traverse<A>(visitor:)()
{
  if (!*v0 || (uint64_t result = sub_226A47F40(), !v1))
  {
    type metadata accessor for ExecuteTasksResponseProtobuf(0);
    return sub_226A47DA0();
  }
  return result;
}

uint64_t ExecuteTasksResponseProtobuf.hashValue.getter()
{
  return sub_226A46D18((void (*)(void))type metadata accessor for ExecuteTasksResponseProtobuf, &qword_26814C700, (void (*)(uint64_t))type metadata accessor for ExecuteTasksResponseProtobuf);
}

uint64_t sub_226A46D18(void (*a1)(void), unint64_t *a2, void (*a3)(uint64_t))
{
  return sub_226A48130();
}

uint64_t sub_226A46DA0@<X0>(_DWORD *a1@<X8>)
{
  *a1 = 0;
  return _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
}

unint64_t sub_226A46DC4()
{
  return 0xD00000000000001CLL;
}

uint64_t sub_226A46DE0()
{
  return ExecuteTasksResponseProtobuf.decodeMessage<A>(decoder:)();
}

uint64_t sub_226A46DF8()
{
  return ExecuteTasksResponseProtobuf.traverse<A>(visitor:)();
}

uint64_t sub_226A46E10(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_226A46858(&qword_26814C758, (void (*)(uint64_t))type metadata accessor for ExecuteTasksResponseProtobuf);

  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_226A46E8C@<X0>(uint64_t a1@<X8>)
{
  return sub_226A2234C(&qword_26814BF28, (uint64_t)qword_26814C6E0, a1);
}

uint64_t sub_226A46EB0(uint64_t a1)
{
  uint64_t v2 = sub_226A46858(&qword_26814C728, (void (*)(uint64_t))type metadata accessor for ExecuteTasksResponseProtobuf);

  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_226A46F1C()
{
  sub_226A46858(&qword_26814C728, (void (*)(uint64_t))type metadata accessor for ExecuteTasksResponseProtobuf);

  return sub_226A47EE0();
}

uint64_t _s21SeymourServerProtocol28ExecuteTasksResponseProtobufV2eeoiySbAC_ACtFZ_0(char *a1, char *a2)
{
  uint64_t v4 = sub_226A47DC0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  unint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  unint64_t v10 = (char *)&v16 - v9;
  if (*(_DWORD *)a1 == *(_DWORD *)a2)
  {
    uint64_t v11 = type metadata accessor for ExecuteTasksResponseProtobuf(0);
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
    v12(v10, &a1[*(int *)(v11 + 20)], v4);
    v12(v8, &a2[*(int *)(v11 + 20)], v4);
    sub_226A46858(&qword_26814BFA8, MEMORY[0x263F50560]);
    char v13 = sub_226A48010();
    uint64_t v14 = *(void (**)(char *, uint64_t))(v5 + 8);
    v14(v8, v4);
    v14(v10, v4);
  }
  else
  {
    char v13 = 0;
  }
  return v13 & 1;
}

uint64_t sub_226A47154()
{
  return sub_226A46858(&qword_26814C708, (void (*)(uint64_t))type metadata accessor for ExecuteTasksRequestProtobuf);
}

uint64_t sub_226A4719C()
{
  return sub_226A46858(&qword_26814C710, (void (*)(uint64_t))type metadata accessor for ExecuteTasksRequestProtobuf);
}

uint64_t sub_226A471E4()
{
  return sub_226A46858(&qword_26814C6F8, (void (*)(uint64_t))type metadata accessor for ExecuteTasksRequestProtobuf);
}

uint64_t sub_226A4722C()
{
  return sub_226A46858(&qword_26814C718, (void (*)(uint64_t))type metadata accessor for ExecuteTasksRequestProtobuf);
}

uint64_t sub_226A47274()
{
  return sub_226A46858(&qword_26814C720, (void (*)(uint64_t))type metadata accessor for ExecuteTasksResponseProtobuf);
}

uint64_t sub_226A472BC()
{
  return sub_226A46858(&qword_26814C728, (void (*)(uint64_t))type metadata accessor for ExecuteTasksResponseProtobuf);
}

uint64_t sub_226A47304()
{
  return sub_226A46858(&qword_26814C700, (void (*)(uint64_t))type metadata accessor for ExecuteTasksResponseProtobuf);
}

uint64_t sub_226A4734C()
{
  return sub_226A46858(&qword_26814C730, (void (*)(uint64_t))type metadata accessor for ExecuteTasksResponseProtobuf);
}

uint64_t initializeBufferWithCopyOfBuffer for ExecuteTasksRequestProtobuf(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_226A47DC0();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t destroy for ExecuteTasksRequestProtobuf(uint64_t a1)
{
  uint64_t v2 = sub_226A47DC0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t initializeWithCopy for ExecuteTasksRequestProtobuf(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_226A47DC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for ExecuteTasksRequestProtobuf(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_226A47DC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for ExecuteTasksRequestProtobuf(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_226A47DC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for ExecuteTasksRequestProtobuf(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_226A47DC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for ExecuteTasksRequestProtobuf(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_226A47608);
}

uint64_t sub_226A47608(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_226A47DC0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for ExecuteTasksRequestProtobuf(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_226A47688);
}

uint64_t sub_226A47688(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_226A47DC0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t sub_226A476F8()
{
  uint64_t result = sub_226A47DC0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for ExecuteTasksResponseProtobuf(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v9 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_DWORD *)a1 = *(_DWORD *)a2;
    uint64_t v5 = *(int *)(a3 + 20);
    uint64_t v6 = (char *)a1 + v5;
    uint64_t v7 = (char *)a2 + v5;
    uint64_t v8 = sub_226A47DC0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
  }
  return v3;
}

uint64_t destroy for ExecuteTasksResponseProtobuf(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  uint64_t v3 = sub_226A47DC0();
  int v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);

  return v4(v2, v3);
}

_DWORD *initializeWithCopy for ExecuteTasksResponseProtobuf(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_226A47DC0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16))(v5, v6, v7);
  return a1;
}

_DWORD *assignWithCopy for ExecuteTasksResponseProtobuf(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_226A47DC0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 24))(v5, v6, v7);
  return a1;
}

_DWORD *initializeWithTake for ExecuteTasksResponseProtobuf(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_226A47DC0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_DWORD *assignWithTake for ExecuteTasksResponseProtobuf(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_226A47DC0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 40))(v5, v6, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for ExecuteTasksResponseProtobuf(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_226A47ABC);
}

uint64_t sub_226A47ABC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a1 + *(int *)(a3 + 20);
  uint64_t v5 = sub_226A47DC0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48);

  return v6(v4, a2, v5);
}

uint64_t storeEnumTagSinglePayload for ExecuteTasksResponseProtobuf(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_226A47B40);
}

uint64_t sub_226A47B40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a1 + *(int *)(a4 + 20);
  uint64_t v6 = sub_226A47DC0();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);

  return v7(v5, a2, a2, v6);
}

uint64_t sub_226A47BB4()
{
  uint64_t result = sub_226A47DC0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_226A47C50()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_226A47C60()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_226A47C70()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_226A47C80()
{
  return MEMORY[0x270F5F598]();
}

uint64_t sub_226A47C90()
{
  return MEMORY[0x270F5F990]();
}

uint64_t sub_226A47CA0()
{
  return MEMORY[0x270F60818]();
}

uint64_t sub_226A47CB0()
{
  return MEMORY[0x270F60910]();
}

uint64_t sub_226A47CC0()
{
  return MEMORY[0x270F60C58]();
}

uint64_t sub_226A47CD0()
{
  return MEMORY[0x270F60C60]();
}

uint64_t sub_226A47CE0()
{
  return MEMORY[0x270F61850]();
}

uint64_t sub_226A47CF0()
{
  return MEMORY[0x270F61858]();
}

uint64_t sub_226A47D00()
{
  return MEMORY[0x270F61860]();
}

uint64_t sub_226A47D10()
{
  return MEMORY[0x270F61868]();
}

uint64_t sub_226A47D20()
{
  return MEMORY[0x270F61870]();
}

uint64_t sub_226A47D30()
{
  return MEMORY[0x270F61878]();
}

uint64_t sub_226A47D40()
{
  return MEMORY[0x270F62000]();
}

uint64_t sub_226A47D50()
{
  return MEMORY[0x270F62008]();
}

uint64_t sub_226A47D60()
{
  return MEMORY[0x270F62010]();
}

uint64_t sub_226A47D70()
{
  return MEMORY[0x270F16CB8]();
}

uint64_t sub_226A47D80()
{
  return MEMORY[0x270F44A00]();
}

uint64_t sub_226A47D90()
{
  return MEMORY[0x270F44A08]();
}

uint64_t sub_226A47DA0()
{
  return MEMORY[0x270F44A18]();
}

uint64_t _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0()
{
  return MEMORY[0x270F44A20]();
}

uint64_t sub_226A47DC0()
{
  return MEMORY[0x270F44A28]();
}

uint64_t sub_226A47DD0()
{
  return MEMORY[0x270F44AD8]();
}

uint64_t sub_226A47E00()
{
  return MEMORY[0x270F44B08]();
}

uint64_t sub_226A47E10()
{
  return MEMORY[0x270F44B10]();
}

uint64_t sub_226A47E20()
{
  return MEMORY[0x270F44B50]();
}

uint64_t sub_226A47E30()
{
  return MEMORY[0x270F44B80]();
}

uint64_t sub_226A47E40()
{
  return MEMORY[0x270F44B90]();
}

uint64_t sub_226A47E50()
{
  return MEMORY[0x270F44BA0]();
}

uint64_t sub_226A47E60()
{
  return MEMORY[0x270F44BB0]();
}

uint64_t sub_226A47E70()
{
  return MEMORY[0x270F44BC0]();
}

uint64_t sub_226A47E80()
{
  return MEMORY[0x270F44BE0]();
}

uint64_t sub_226A47E90()
{
  return MEMORY[0x270F44BF8]();
}

uint64_t sub_226A47EA0()
{
  return MEMORY[0x270F44C20]();
}

uint64_t sub_226A47EB0()
{
  return MEMORY[0x270F44C38]();
}

uint64_t sub_226A47EC0()
{
  return MEMORY[0x270F44C98]();
}

uint64_t sub_226A47EE0()
{
  return MEMORY[0x270F44CD8]();
}

uint64_t sub_226A47EF0()
{
  return MEMORY[0x270F44CE0]();
}

uint64_t sub_226A47F00()
{
  return MEMORY[0x270F44D08]();
}

uint64_t sub_226A47F10()
{
  return MEMORY[0x270F44D68]();
}

uint64_t sub_226A47F20()
{
  return MEMORY[0x270F44D88]();
}

uint64_t sub_226A47F30()
{
  return MEMORY[0x270F44D90]();
}

uint64_t sub_226A47F40()
{
  return MEMORY[0x270F44D98]();
}

uint64_t sub_226A47F50()
{
  return MEMORY[0x270F44DA0]();
}

uint64_t sub_226A47F60()
{
  return MEMORY[0x270F44DB0]();
}

uint64_t sub_226A47F70()
{
  return MEMORY[0x270F44DC8]();
}

uint64_t sub_226A47F80()
{
  return MEMORY[0x270F44DD8]();
}

uint64_t sub_226A47F90()
{
  return MEMORY[0x270F44DF0]();
}

uint64_t sub_226A47FA0()
{
  return MEMORY[0x270F44E00]();
}

uint64_t sub_226A47FB0()
{
  return MEMORY[0x270F44E10]();
}

uint64_t sub_226A47FC0()
{
  return MEMORY[0x270F44E18]();
}

uint64_t sub_226A47FD0()
{
  return MEMORY[0x270F44E20]();
}

uint64_t sub_226A47FE0()
{
  return MEMORY[0x270F44E28]();
}

uint64_t sub_226A47FF0()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_226A48000()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_226A48010()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_226A48020()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_226A48030()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_226A48040()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_226A48050()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_226A48060()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_226A48070()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_226A48080()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_226A48090()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_226A480A0()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_226A480B0()
{
  return MEMORY[0x270F62150]();
}

uint64_t sub_226A480C0()
{
  return MEMORY[0x270F62178]();
}

uint64_t sub_226A480D0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_226A480E0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_226A480F0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_226A48100()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_226A48110()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_226A48120()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_226A48130()
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
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

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}