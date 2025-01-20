uint64_t sub_25E868330@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t result;
  uint64_t v14;
  char v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  long long v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  long long v30;
  long long v31;
  uint64_t v32;
  long long v33;
  long long v34;
  long long v35;
  long long v36;
  long long v37;
  _OWORD v38[2];
  unsigned char v39[104];
  uint64_t v40;
  _OWORD v41[3];
  long long v42;
  long long v43;
  long long v44;
  long long v45;
  long long v46;
  uint64_t v47;
  long long v48;
  long long v49;
  long long v50;
  long long v51;
  long long v52;
  long long v53;
  long long v54;
  long long v55;
  uint64_t v56;
  unsigned char v57[120];
  uint64_t v58;
  uint64_t v59;
  long long v60;
  unsigned char v61[32];
  long long v62;
  long long v63;
  uint64_t v64;
  long long v65;

  sub_25E7E0E28(a1, (uint64_t)&v59);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A709540);
  if (swift_dynamicCast())
  {
    if (*((void *)&v33 + 1))
    {
      sub_25E7DE0DC(a2, (uint64_t)&v59, &qword_26A709C88);
      if (sub_25E8114E8((uint64_t)&v59) == 1)
      {
        v5 = 0;
        v6 = 0;
      }
      else
      {
        v5 = v59;
        v6 = swift_bridgeObjectRetain();
      }
      *(void *)&v35 = v5;
      *((void *)&v35 + 1) = v6;
      swift_bridgeObjectRelease();
      sub_25E7DE0DC(a2, (uint64_t)v57, &qword_26A709C88);
      if (sub_25E8114E8((uint64_t)v57) == 1)
      {
        v24 = 0;
        v25 = 0;
      }
      else
      {
        v24 = v58;
        v25 = swift_bridgeObjectRetain();
      }
      *(void *)&v37 = v24;
      *((void *)&v37 + 1) = v25;
      swift_bridgeObjectRelease();
      sub_25E7DE0DC(a2, (uint64_t)v41, &qword_26A709C88);
      if (sub_25E8114E8((uint64_t)v41) == 1)
      {
        v26 = 0;
        v27 = 0;
      }
      else
      {
        v54 = v45;
        v55 = v46;
        v56 = v47;
        v50 = v41[2];
        v51 = v42;
        v52 = v43;
        v53 = v44;
        v48 = v41[0];
        v49 = v41[1];
        *(_OWORD *)&v61[16] = v44;
        v62 = v45;
        v63 = v46;
        v64 = v47;
        v60 = v42;
        *(_OWORD *)v61 = v43;
        v65 = *(_OWORD *)&v61[8];
        v27 = v44;
        v26 = *((void *)&v43 + 1);
        sub_25E86A9B0((uint64_t)&v65);
      }
      *((void *)&v38[0] + 1) = v26;
      *(void *)&v38[1] = v27;
      swift_bridgeObjectRelease();
      sub_25E7DE0DC(a2, (uint64_t)v39, &qword_26A709C88);
      if (sub_25E8114E8((uint64_t)v39) == 1)
      {
        v28 = 0;
        v29 = 0;
      }
      else
      {
        v28 = v40;
        v29 = swift_bridgeObjectRetain();
      }
      *(void *)&v36 = v28;
      *((void *)&v36 + 1) = v29;
      swift_bridgeObjectRelease();
      LOBYTE(v38[0]) = 0;
    }
  }
  else
  {
    v37 = 0u;
    memset(v38, 0, 27);
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
  }
  v7 = sub_25E885458();
  v8 = sub_25E8858C8();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v32 = v10;
    *(_DWORD *)v9 = 136315138;
    swift_beginAccess();
    sub_25E86A940(v33, *((uint64_t *)&v33 + 1));
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A709C90);
    v11 = sub_25E8855F8();
    sub_25E879C4C(v11, v12, &v32);
    sub_25E885988();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25E7CC000, v7, v8, "%s was hydrated successfully", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611E4C00](v10, -1, -1);
    MEMORY[0x2611E4C00](v9, -1, -1);
  }

  result = swift_beginAccess();
  v14 = *((void *)&v33 + 1);
  if (*((void *)&v33 + 1))
  {
    v15 = BYTE10(v38[1]);
    v16 = WORD4(v38[1]);
    v18 = *((void *)&v38[0] + 1);
    v17 = *(void *)&v38[1];
    v20 = *((void *)&v37 + 1);
    v19 = v38[0];
    v21 = v37;
    v30 = v35;
    v31 = v36;
    v22 = v34;
    v23 = v33;
    *(void *)(a3 + 24) = &type metadata for TimedMetadata.SongEntity;
    *(void *)(a3 + 32) = &protocol witness table for TimedMetadata.SongEntity;
    result = swift_allocObject();
    *(void *)a3 = result;
    *(void *)(result + 16) = v23;
    *(void *)(result + 24) = v14;
    *(_OWORD *)(result + 32) = v22;
    *(_OWORD *)(result + 48) = v30;
    *(_OWORD *)(result + 64) = v31;
    *(void *)(result + 80) = v21;
    *(void *)(result + 88) = v20;
    *(unsigned char *)(result + 96) = v19;
    *(void *)(result + 104) = v18;
    *(void *)(result + 112) = v17;
    *(unsigned char *)(result + 120) = v16 & 1;
    *(unsigned char *)(result + 121) = HIBYTE(v16) & 1;
    *(unsigned char *)(result + 122) = v15 & 1;
  }
  else
  {
    *(void *)(a3 + 32) = 0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
  }
  return result;
}

uint64_t TimedMetadataFetcher.deinit()
{
  sub_25E8393A8(v0 + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC13TVAppServices20TimedMetadataFetcher_logger;
  uint64_t v2 = sub_25E885478();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t TimedMetadataFetcher.__deallocating_deinit()
{
  TimedMetadataFetcher.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_25E8688AC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (a4[2] && (uint64_t v7 = *(void *)(a5 + 16)) != 0)
  {
    unint64_t v8 = a4[4];
    unint64_t v9 = a4[5];
    long long v10 = *(_OWORD *)(a5 + 144);
    long long v30 = *(_OWORD *)(a5 + 128);
    long long v31 = v10;
    uint64_t v32 = *(void *)(a5 + 160);
    long long v11 = *(_OWORD *)(a5 + 48);
    long long v24 = *(_OWORD *)(a5 + 32);
    long long v25 = v11;
    long long v12 = *(_OWORD *)(a5 + 80);
    long long v26 = *(_OWORD *)(a5 + 64);
    long long v27 = v12;
    long long v13 = *(_OWORD *)(a5 + 112);
    long long v28 = *(_OWORD *)(a5 + 96);
    long long v29 = v13;
    if (v24 != __PAIR128__(v9, v8))
    {
      v14 = (long long *)(a5 + 168);
      while ((sub_25E885D48() & 1) == 0)
      {
        if (!--v7) {
          goto LABEL_10;
        }
        v15 = (long long *)((char *)v14 + 136);
        long long v16 = v14[7];
        long long v30 = v14[6];
        long long v31 = v16;
        uint64_t v32 = *((void *)v14 + 16);
        long long v17 = v14[1];
        long long v24 = *v14;
        long long v25 = v17;
        long long v18 = v14[3];
        long long v26 = v14[2];
        long long v27 = v18;
        long long v19 = v14[5];
        long long v28 = v14[4];
        long long v29 = v19;
        v14 = (long long *)((char *)v14 + 136);
        if ((void)v24 == v8)
        {
          v14 = v15;
          if (*((void *)&v24 + 1) == v9) {
            break;
          }
        }
      }
    }
    sub_25E8444C0((uint64_t)&v24);
    v22[6] = v30;
    v22[7] = v31;
    uint64_t v23 = v32;
    v22[2] = v26;
    v22[3] = v27;
    v22[4] = v28;
    v22[5] = v29;
    v22[0] = v24;
    v22[1] = v25;
    nullsub_1(v22);
    v20 = v22;
  }
  else
  {
LABEL_10:
    sub_25E86AACC((uint64_t)&v24);
    v20 = &v24;
  }
  sub_25E7DE0DC((uint64_t)v20, a1, &qword_26A709C88);
  swift_bridgeObjectRetain();
  return a2;
}

uint64_t sub_25E868A20(void (*a1)(void))
{
  a1();
  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_25E868A58(uint64_t (*a1)(void))
{
  return a1();
}

void sub_25E868A80(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_25E885988();
  *a1 = v7;
  unint64_t v8 = *a2;
  if (*a2)
  {
    *unint64_t v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

uint64_t sub_25E868B38(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25E8697B8(a1, a2, a3, (void *)*v3);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_25E868B58(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25E8699F8(a1, a2, a3, (void *)*v3);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_25E868B7C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  unint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *unint64_t v8 = v2;
  v8[1] = sub_25E82C6F4;
  return sub_25E86773C(a1, v4, v5, v7, v6);
}

unint64_t sub_25E868C40()
{
  unint64_t result = qword_26A709C60;
  if (!qword_26A709C60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A709C60);
  }
  return result;
}

uint64_t sub_25E868C94@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *a1 + 16;
  swift_beginAccess();
  uint64_t result = MEMORY[0x2611E4CF0](v4);
  uint64_t v6 = *(void *)(v3 + 24);
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t sub_25E868CF0(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *a2;
  swift_beginAccess();
  *(void *)(v3 + 24) = v2;
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_25E868D4C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 40);
  *a2 = *(void *)(v3 + 32);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_25E868D9C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 56);
  *a2 = *(void *)(v3 + 48);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_25E868DEC@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 72);
  *a2 = *(void *)(v3 + 64);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_25E868E3C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  *a2 = *(void *)(v3 + 104);
  return swift_retain();
}

uint64_t dispatch thunk of TimedMetadataFetcherDelegate.fetchSavedSongsPlaylistCompleted(playlistId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t sub_25E868EA0()
{
  return type metadata accessor for TimedMetadataFetcher();
}

uint64_t type metadata accessor for TimedMetadataFetcher()
{
  uint64_t result = qword_26A709C68;
  if (!qword_26A709C68) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25E868EF4()
{
  uint64_t result = sub_25E885478();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for TimedMetadataFetcher(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TimedMetadataFetcher);
}

uint64_t dispatch thunk of TimedMetadataFetcher.delegate.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of TimedMetadataFetcher.delegate.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of TimedMetadataFetcher.delegate.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of TimedMetadataFetcher.programID.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of TimedMetadataFetcher.programID.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of TimedMetadataFetcher.programID.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of TimedMetadataFetcher.adamID.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of TimedMetadataFetcher.adamID.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of TimedMetadataFetcher.adamID.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of TimedMetadataFetcher.contentID.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of TimedMetadataFetcher.contentID.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of TimedMetadataFetcher.contentID.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

uint64_t dispatch thunk of TimedMetadataFetcher.timedMetadata.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 264))();
}

uint64_t dispatch thunk of TimedMetadataFetcher.timedMetadata.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 272))();
}

uint64_t dispatch thunk of TimedMetadataFetcher.timedMetadata.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 280))();
}

uint64_t dispatch thunk of TimedMetadataFetcher.__allocating_init(programID:adamID:contentID:playablePassThrough:)()
{
  return (*(uint64_t (**)(void))(v0 + 296))();
}

uint64_t dispatch thunk of TimedMetadataFetcher.fetchTimedMetadata(startTimeOffset:existingData:)(uint64_t a1, uint64_t a2, double a3)
{
  long long v11 = (uint64_t (*)(uint64_t, uint64_t, __n128))(*(void *)(*(void *)v3 + 312)
                                                         + **(int **)(*(void *)v3 + 312));
  unint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  *unint64_t v8 = v4;
  v8[1] = sub_25E869330;
  v9.n128_f64[0] = a3;
  return v11(a1, a2, v9);
}

uint64_t sub_25E869330(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = *v3;
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 8);
  return v7(a1, a2, a3);
}

uint64_t dispatch thunk of TimedMetadataFetcher.hydrateMetadata(timedMetadata:)(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 320) + **(int **)(*(void *)v1 + 320));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_25E803444;
  return v6(a1);
}

uint64_t dispatch thunk of TimedMetadataFetcher.fetchSongsPlaylistState(for:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 328))();
}

unsigned char *storeEnumTagSinglePayload for TimedMetadataFetcher.FetcherError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25E869618);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for TimedMetadataFetcher.FetcherError()
{
  return &type metadata for TimedMetadataFetcher.FetcherError;
}

uint64_t sub_25E869650(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25E8696B4(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_25E869758(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25E869B9C(a1, a2, a3, (void *)*v3);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_25E869778(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25E869D38(a1, a2, a3, (void *)*v3);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_25E869798(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25E869EE0(a1, a2, a3, *v3);
  uint64_t *v3 = (char *)result;
  return result;
}

uint64_t sub_25E8697B8(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
    long long v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B390660);
  uint64_t v10 = *(void *)(sub_25E885068() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  long long v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_25E885068() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  long long v18 = (char *)v13 + v17;
  long long v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v20 = *(void *)(v16 + 72) * v8;
  v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_25E885BA8();
  __break(1u);
  return result;
}

uint64_t sub_25E8699F8(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A709560);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = (unint64_t)(v10 + 4);
  unint64_t v13 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v12 >= v13 + 40 * v8) {
      memmove(v10 + 4, a4 + 4, 40 * v8);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 40 * v8 || v12 >= v13 + 40 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A709540);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_25E885BA8();
  __break(1u);
  return result;
}

uint64_t sub_25E869B9C(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A708D18);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = v10 + 4;
  unint64_t v13 = a4 + 4;
  size_t v14 = 3 * v8;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v14]) {
      memmove(v10 + 4, a4 + 4, v14 * 8);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v14] || v12 >= &v13[v14])
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A709CD8);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_25E885BA8();
  __break(1u);
  return result;
}

uint64_t sub_25E869D38(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A709CA8);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 152);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = (unint64_t)(v10 + 4);
  unint64_t v13 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v12 >= v13 + 152 * v8) {
      memmove(v10 + 4, a4 + 4, 152 * v8);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 152 * v8 || v12 >= v13 + 152 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A709CB0);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_25E885BA8();
  __break(1u);
  return result;
}

uint64_t sub_25E869EE0(char a1, int64_t a2, char a3, char *a4)
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A709CE0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
  size_t v14 = 24 * v8;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v14]) {
      memmove(v12, v13, v14);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v14] || v12 >= &v13[v14])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_25E885BA8();
  __break(1u);
  return result;
}

void sub_25E86A05C(uint64_t a1, char a2, void *a3)
{
  v53 = a3;
  unint64_t v4 = *(void *)(a1 + 16);
  uint64_t v36 = a1 + 32;
  swift_bridgeObjectRetain();
  unint64_t v5 = 0;
  unint64_t v6 = (uint64_t *)&unk_26A709CA0;
  int64_t v7 = &qword_26A709C88;
  if (v4) {
    goto LABEL_3;
  }
LABEL_2:
  sub_25E86AAAC((uint64_t)v41);
  sub_25E7DE0DC((uint64_t)v41, (uint64_t)&v50, v6);
  unint64_t v8 = v4;
  while (1)
  {
    sub_25E7DE0DC((uint64_t)&v50, (uint64_t)v40, v6);
    sub_25E7DE0DC((uint64_t)v40, (uint64_t)v41, v6);
    if (sub_25E8114E8((uint64_t)v41) == 1)
    {
      swift_bridgeObjectRelease_n();
      return;
    }
    unint64_t v38 = v8;
    long long v18 = v6;
    long long v19 = v50;
    uint64_t v20 = v7;
    sub_25E7DE0DC((uint64_t)v51, (uint64_t)v39, v7);
    v21 = (void *)*v53;
    unint64_t v23 = sub_25E7DC4D4(v19, *((uint64_t *)&v19 + 1));
    uint64_t v24 = v21[2];
    BOOL v25 = (v22 & 1) == 0;
    uint64_t v26 = v24 + v25;
    if (__OFADD__(v24, v25))
    {
      __break(1u);
LABEL_21:
      __break(1u);
LABEL_22:
      __break(1u);
LABEL_23:
      sub_25E885D98();
      __break(1u);
      goto LABEL_24;
    }
    char v27 = v22;
    if (v21[3] < v26) {
      break;
    }
    if (a2)
    {
      if (v22) {
        goto LABEL_17;
      }
    }
    else
    {
      sub_25E87EBF0();
      if (v27) {
        goto LABEL_17;
      }
    }
LABEL_13:
    long long v30 = (void *)*v53;
    v30[(v23 >> 6) + 8] |= 1 << v23;
    *(_OWORD *)(v30[6] + 16 * v23) = v19;
    int64_t v7 = v20;
    sub_25E7DE0DC((uint64_t)v39, v30[7] + 136 * v23, v20);
    uint64_t v31 = v30[2];
    BOOL v32 = __OFADD__(v31, 1);
    uint64_t v33 = v31 + 1;
    if (v32) {
      goto LABEL_21;
    }
    v30[2] = v33;
    a2 = 1;
    unint64_t v6 = v18;
    unint64_t v5 = v38;
    if (v38 == v4) {
      goto LABEL_2;
    }
LABEL_3:
    if (v5 >= *(void *)(a1 + 16)) {
      goto LABEL_22;
    }
    uint64_t v9 = v36 + 152 * v5;
    long long v10 = *(_OWORD *)(v9 + 112);
    long long v11 = *(_OWORD *)(v9 + 80);
    long long v46 = *(_OWORD *)(v9 + 96);
    long long v47 = v10;
    long long v12 = *(_OWORD *)(v9 + 112);
    long long v48 = *(_OWORD *)(v9 + 128);
    long long v13 = *(_OWORD *)(v9 + 48);
    long long v14 = *(_OWORD *)(v9 + 16);
    long long v42 = *(_OWORD *)(v9 + 32);
    long long v43 = v13;
    long long v15 = *(_OWORD *)(v9 + 48);
    long long v16 = *(_OWORD *)(v9 + 80);
    long long v44 = *(_OWORD *)(v9 + 64);
    long long v45 = v16;
    long long v17 = *(_OWORD *)(v9 + 16);
    v41[0] = *(_OWORD *)v9;
    v41[1] = v17;
    v51[5] = v46;
    v51[6] = v12;
    v51[7] = *(_OWORD *)(v9 + 128);
    v51[1] = v42;
    v51[2] = v15;
    v51[3] = v44;
    v51[4] = v11;
    uint64_t v49 = *(void *)(v9 + 144);
    uint64_t v52 = *(void *)(v9 + 144);
    unint64_t v8 = v5 + 1;
    long long v50 = v41[0];
    v51[0] = v14;
    nullsub_1(&v50);
    sub_25E86A9E4((uint64_t)v41);
  }
  sub_25E87C2D8(v26, a2 & 1);
  unint64_t v28 = sub_25E7DC4D4(v19, *((uint64_t *)&v19 + 1));
  if ((v27 & 1) != (v29 & 1)) {
    goto LABEL_23;
  }
  unint64_t v23 = v28;
  if ((v27 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_17:
  v34 = (void *)swift_allocError();
  swift_willThrow();
  id v35 = v34;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B390BC0);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    sub_25E86A7E0(v39, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_25E86A844);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    return;
  }
LABEL_24:
  sub_25E885A78();
  sub_25E885678();
  sub_25E885B18();
  sub_25E885678();
  sub_25E885B58();
  __break(1u);
}

uint64_t sub_25E86A468(uint64_t a1)
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

uint64_t sub_25E86A4F0(uint64_t a1, uint64_t (*a2)(unsigned char *, uint64_t, uint64_t, uint64_t))
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = MEMORY[0x263F8EE78];
  if (!v2) {
    return v3;
  }
  uint64_t v4 = a1;
  uint64_t v47 = MEMORY[0x263F8EE78];
  sub_25E869778(0, v2, 0);
  uint64_t v3 = v47;
  uint64_t result = sub_25E86A468(v4);
  if (result < 0) {
    goto LABEL_31;
  }
  unint64_t v7 = result;
  if (result >= 1 << *(unsigned char *)(v4 + 32)) {
    goto LABEL_31;
  }
  uint64_t v8 = v4 + 64;
  uint64_t v35 = v4 + 80;
  int64_t v36 = v2;
  uint64_t v9 = 1;
  int v37 = v6;
  uint64_t v38 = v4 + 64;
  uint64_t v39 = v4;
  while (1)
  {
    unint64_t v10 = v7 >> 6;
    if ((*(void *)(v8 + 8 * (v7 >> 6)) & (1 << v7)) == 0) {
      break;
    }
    if (*(_DWORD *)(v4 + 36) != v6) {
      goto LABEL_27;
    }
    uint64_t v41 = v9;
    long long v11 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v7);
    uint64_t v12 = *v11;
    uint64_t v13 = v11[1];
    uint64_t v14 = *(void *)(*(void *)(v4 + 56) + 8 * v7);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v15 = a2(v45, v12, v13, v14);
    uint64_t v17 = v16;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_25E7DE0DC((uint64_t)v45, (uint64_t)v46, &qword_26A709C88);
    uint64_t v47 = v3;
    unint64_t v19 = *(void *)(v3 + 16);
    unint64_t v18 = *(void *)(v3 + 24);
    if (v19 >= v18 >> 1)
    {
      sub_25E869778(v18 > 1, v19 + 1, 1);
      uint64_t v3 = v47;
    }
    *(void *)&long long v42 = v15;
    *((void *)&v42 + 1) = v17;
    uint64_t result = sub_25E7DE0DC((uint64_t)v46, (uint64_t)v43, &qword_26A709C88);
    *(void *)(v3 + 16) = v19 + 1;
    uint64_t v20 = v3 + 152 * v19;
    long long v21 = v43[0];
    *(_OWORD *)(v20 + 32) = v42;
    *(_OWORD *)(v20 + 48) = v21;
    long long v22 = v43[4];
    long long v24 = v43[1];
    long long v23 = v43[2];
    *(_OWORD *)(v20 + 96) = v43[3];
    *(_OWORD *)(v20 + 112) = v22;
    *(_OWORD *)(v20 + 64) = v24;
    *(_OWORD *)(v20 + 80) = v23;
    long long v26 = v43[6];
    long long v25 = v43[7];
    long long v27 = v43[5];
    *(void *)(v20 + 176) = v44;
    *(_OWORD *)(v20 + 144) = v26;
    *(_OWORD *)(v20 + 160) = v25;
    *(_OWORD *)(v20 + 128) = v27;
    uint64_t v4 = v39;
    char v28 = *(unsigned char *)(v39 + 32);
    if ((uint64_t)v7 >= 1 << v28) {
      goto LABEL_28;
    }
    uint64_t v8 = v38;
    uint64_t v29 = *(void *)(v38 + 8 * v10);
    if ((v29 & (1 << v7)) == 0) {
      goto LABEL_29;
    }
    int v6 = v37;
    if (*(_DWORD *)(v39 + 36) != v37) {
      goto LABEL_30;
    }
    unint64_t v30 = v29 & (-2 << (v7 & 0x3F));
    if (v30)
    {
      unint64_t v7 = __clz(__rbit64(v30)) | v7 & 0xFFFFFFFFFFFFFFC0;
      int64_t v31 = v36;
    }
    else
    {
      unint64_t v32 = v10 + 1;
      unint64_t v33 = (unint64_t)((1 << v28) + 63) >> 6;
      int64_t v31 = v36;
      if (v10 + 1 >= v33) {
        goto LABEL_20;
      }
      unint64_t v34 = *(void *)(v38 + 8 * v32);
      if (!v34)
      {
        while (v33 - 2 != v10)
        {
          unint64_t v34 = *(void *)(v35 + 8 * v10++);
          if (v34)
          {
            unint64_t v32 = v10 + 1;
            goto LABEL_19;
          }
        }
LABEL_20:
        unint64_t v7 = 1 << v28;
        goto LABEL_21;
      }
LABEL_19:
      unint64_t v7 = __clz(__rbit64(v34)) + (v32 << 6);
    }
LABEL_21:
    if (v41 == v31) {
      return v3;
    }
    if ((v7 & 0x8000000000000000) == 0)
    {
      uint64_t v9 = v41 + 1;
      if ((uint64_t)v7 < 1 << v28) {
        continue;
      }
    }
    goto LABEL_31;
  }
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
  return result;
}

void *sub_25E86A7E0(void *a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))
{
  return a1;
}

uint64_t sub_25E86A844(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
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

uint64_t sub_25E86A8E8()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 123, 7);
}

uint64_t sub_25E86A940(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_25E86A9B0(uint64_t a1)
{
  return a1;
}

uint64_t sub_25E86A9DC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return sub_25E8688AC(a1, a2, a3, a4, *(void *)(v4 + 16));
}

uint64_t sub_25E86A9E4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void *)(a1 + 24);
  swift_bridgeObjectRetain();
  sub_25E8696B4(v2, v3);
  return a1;
}

double sub_25E86AAAC(uint64_t a1)
{
  *(void *)(a1 + 144) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  return result;
}

double sub_25E86AACC(uint64_t a1)
{
  *(void *)(a1 + 128) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t sub_25E86AAE8()
{
  swift_unknownObjectRelease();
  unint64_t v1 = *(void *)(v0 + 40);
  if (v1 >> 60 != 15) {
    sub_25E7DF934(*(void *)(v0 + 32), v1);
  }
  swift_release();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_25E86AB40(uint64_t a1)
{
  uint64_t v4 = *((void *)v1 + 2);
  uint64_t v5 = *((void *)v1 + 3);
  uint64_t v6 = *((void *)v1 + 4);
  uint64_t v7 = *((void *)v1 + 5);
  uint64_t v8 = *((void *)v1 + 6);
  double v9 = v1[7];
  unint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *unint64_t v10 = v2;
  v10[1] = sub_25E803444;
  return sub_25E864F48(a1, v9, v4, v5, v6, v7, v8);
}

unint64_t sub_25E86AC18()
{
  unint64_t result = qword_26A709CC8;
  if (!qword_26A709CC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A709CC8);
  }
  return result;
}

uint64_t objectdestroyTm()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

void sub_25E86ACB8()
{
  qword_26B390BF0 = (uint64_t)&type metadata for AMSAccountService;
  *(void *)algn_26B390BF8 = &off_270B607D8;
}

uint64_t static AccountUtility.hasActiveiTunesAccount.getter()
{
  return MEMORY[0x270FA2498](sub_25E86ACF4, 0, 0);
}

uint64_t sub_25E86ACF4()
{
  if (qword_26B38F778 != -1) {
    swift_once();
  }
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_26A709200 + dword_26A709200);
  unint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *unint64_t v1 = v0;
  v1[1] = sub_25E82D03C;
  return v3();
}

uint64_t sub_25E86ADC4(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 8) + **(int **)(a2 + 8));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_25E82F1FC;
  return v7(a1, a2);
}

ValueMetadata *type metadata accessor for AccountUtility()
{
  return &type metadata for AccountUtility;
}

uint64_t sub_25E86AEC4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))() & 1;
}

uint64_t sub_25E86AEF8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))() & 1;
}

uint64_t sub_25E86AF2C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_25E86AF40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a5 + 32) + **(int **)(a5 + 32));
  long long v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v11;
  *long long v11 = v5;
  v11[1] = sub_25E82C6F4;
  return v13(a1, a2, a3, a4, a5);
}

uint64_t sub_25E86B05C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t sub_25E86B070(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 48) + **(int **)(a2 + 48));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_25E803444;
  return v7(a1, a2);
}

uint64_t sub_25E86B160(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 56) + **(int **)(a3 + 56));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_25E82C6F4;
  return v9(a1, a2, a3);
}

uint64_t sub_25E86B268(char *a1, char *a2)
{
  return sub_25E86EBF4(*a1, *a2);
}

uint64_t sub_25E86B274()
{
  return sub_25E885E58();
}

uint64_t sub_25E86B2EC()
{
  sub_25E885648();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25E86B350()
{
  return sub_25E885E58();
}

uint64_t sub_25E86B3C4@<X0>(char *a1@<X8>)
{
  return sub_25E86B5B4(a1);
}

void sub_25E86B3D0(uint64_t *a1@<X8>)
{
  uint64_t v2 = 1684104562;
  if (*v1) {
    uint64_t v2 = 0x6574697277;
  }
  unint64_t v3 = 0xE400000000000000;
  if (*v1) {
    unint64_t v3 = 0xE500000000000000;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_25E86B404(char *a1, char *a2)
{
  return sub_25E86EB40(*a1, *a2);
}

uint64_t sub_25E86B410()
{
  return sub_25E885E58();
}

uint64_t sub_25E86B4A0()
{
  sub_25E885648();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25E86B51C()
{
  return sub_25E885E58();
}

uint64_t sub_25E86B5A8@<X0>(char *a1@<X8>)
{
  return sub_25E86B5B4(a1);
}

uint64_t sub_25E86B5B4@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_25E885BC8();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

void sub_25E86B610(uint64_t *a1@<X8>)
{
  uint64_t v2 = 0x736E6F4372657375;
  if (*v1) {
    uint64_t v2 = 0x657469726F766166;
  }
  unint64_t v3 = 0xEB00000000746E65;
  if (*v1) {
    unint64_t v3 = 0xE900000000000073;
  }
  *a1 = v2;
  a1[1] = v3;
}

unsigned char *_s10BaseActionO11ActionErrorOwst(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25E86B6F8);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *_s10BaseActionO11ActionErrorOMa()
{
  return &_s10BaseActionO11ActionErrorON;
}

ValueMetadata *_s10BaseActionOMa()
{
  return &_s10BaseActionON;
}

ValueMetadata *_s10BaseActionO5TopicOMa()
{
  return &_s10BaseActionO5TopicON;
}

unint64_t sub_25E86B758()
{
  unint64_t result = qword_26A709D10;
  if (!qword_26A709D10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A709D10);
  }
  return result;
}

unint64_t sub_25E86B7B0()
{
  unint64_t result = qword_26A709D18;
  if (!qword_26A709D18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A709D18);
  }
  return result;
}

uint64_t sub_25E86B804()
{
  return sub_25E86B83C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_25E86B83C(uint64_t (*a1)(void))
{
  return a1();
}

unsigned char *_s10BaseActionO5TopicOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25E86B914);
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

ValueMetadata *_s10BaseActionO4TypeOMa()
{
  return &_s10BaseActionO4TypeON;
}

unint64_t sub_25E86B950()
{
  unint64_t result = qword_26A709D28;
  if (!qword_26A709D28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_26A709D28);
  }
  return result;
}

uint64_t sub_25E86B9A4()
{
  uint64_t result = sub_25E885598();
  qword_26B38F7A8 = result;
  return result;
}

id static SportsFavoriteService.userConsentDidChange.getter()
{
  return sub_25E823674(&qword_26B38F7B0, (void **)&qword_26B38F7A8);
}

uint64_t sub_25E86BA00()
{
  uint64_t result = sub_25E885598();
  qword_26B38F7A0 = result;
  return result;
}

id static SportsFavoriteService.favoritesDidChange.getter()
{
  return sub_25E823674(&qword_26B38F640, (void **)&qword_26B38F7A0);
}

uint64_t sub_25E86BA5C()
{
  uint64_t result = sub_25E885598();
  qword_26B38FC28 = result;
  return result;
}

id static SportsFavoriteService.accountDidChange.getter()
{
  return sub_25E823674(&qword_26B38FC30, (void **)&qword_26B38FC28);
}

unint64_t sub_25E86BAB8(char a1)
{
  if (!a1) {
    return 0xD00000000000002CLL;
  }
  if (a1 == 1) {
    return 0xD00000000000002ALL;
  }
  return 0xD000000000000028;
}

void sub_25E86BB14(uint64_t a1, char a2)
{
  if (qword_26B38F7D0 != -1) {
    swift_once();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3909F8);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_25E8868B0;
  sub_25E885A78();
  swift_bridgeObjectRelease();
  if (a2)
  {
    if (a2 == 1)
    {
      if (qword_26B38F640 == -1) {
        goto LABEL_10;
      }
    }
    else if (qword_26B38FC30 == -1)
    {
      goto LABEL_10;
    }
LABEL_24:
    swift_once();
    goto LABEL_10;
  }
  if (qword_26B38F7B0 != -1) {
    goto LABEL_24;
  }
LABEL_10:
  sub_25E8855C8();
  sub_25E885678();
  swift_bridgeObjectRelease();
  *(void *)(v3 + 32) = 0xD00000000000001BLL;
  *(void *)(v3 + 40) = 0x800000025E890EC0;
  sub_25E885898();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B390A00);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_25E8868B0;
  *(void *)(v4 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_26B390B10);
  *(void *)(v4 + 64) = sub_25E7DF6AC();
  *(void *)(v4 + 32) = v3;
  swift_bridgeObjectRetain();
  sub_25E885408();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(self, sel_defaultCenter);
  if (a2)
  {
    if (a2 == 1)
    {
      if (qword_26B38F640 != -1) {
        swift_once();
      }
      unsigned int v6 = &qword_26B38F7A0;
    }
    else
    {
      if (qword_26B38FC30 != -1) {
        swift_once();
      }
      unsigned int v6 = &qword_26B38FC28;
    }
  }
  else
  {
    if (qword_26B38F7B0 != -1) {
      swift_once();
    }
    unsigned int v6 = &qword_26B38F7A8;
  }
  id v7 = (id)*v6;
  objc_msgSend(v5, sel_postNotificationName_object_, v7, 0);
}

uint64_t sub_25E86BE74(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t sub_25E86BEC8()
{
  if (qword_26B38F7D0 != -1) {
    swift_once();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3909F8);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_25E8868B0;
  sub_25E885A78();
  swift_bridgeObjectRelease();
  sub_25E885678();
  swift_bridgeObjectRelease();
  *(void *)(v0 + 32) = 0xD000000000000023;
  *(void *)(v0 + 40) = 0x800000025E890DF0;
  sub_25E885898();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B390A00);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_25E8868B0;
  *(void *)(v1 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_26B390B10);
  *(void *)(v1 + 64) = sub_25E7DF6AC();
  *(void *)(v1 + 32) = v0;
  swift_bridgeObjectRetain();
  sub_25E885408();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_25E885618();
  swift_bridgeObjectRelease();
  notify_post((const char *)(v2 + 32));
  return swift_release();
}

uint64_t sub_25E86C108()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

void sub_25E86C118(uint64_t a1)
{
  sub_25E86BB14(a1, *(unsigned char *)(v1 + 16));
}

ValueMetadata *_s8ExecutorVMa()
{
  return &_s8ExecutorVN;
}

uint64_t sub_25E86C130(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[20] = a4;
  v5[21] = a5;
  v5[18] = a2;
  v5[19] = a3;
  v5[17] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B38F798);
  v5[22] = swift_task_alloc();
  v5[23] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B38F7C8);
  v5[24] = swift_task_alloc();
  v5[25] = swift_task_alloc();
  uint64_t v6 = _s5CacheV5ValueOMa(0);
  v5[26] = v6;
  v5[27] = *(void *)(v6 - 8);
  v5[28] = swift_task_alloc();
  v5[29] = swift_task_alloc();
  uint64_t v7 = _s10NetworkingO12FetchedValueOMa(0);
  v5[30] = v7;
  v5[31] = *(void *)(v7 - 8);
  v5[32] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25E86C2E4, 0, 0);
}

uint64_t sub_25E86C2E4()
{
  if (qword_26B38F7D0 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[18];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3909F8);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_25E8868B0;
  sub_25E885A78();
  swift_bridgeObjectRelease();
  uint64_t v3 = v1[3];
  uint64_t v4 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v3);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v4);
  sub_25E885678();
  swift_bridgeObjectRelease();
  sub_25E885678();
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v5);
  (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v5, v6);
  sub_25E885678();
  swift_bridgeObjectRelease();
  *(void *)(v2 + 32) = 0xD000000000000017;
  *(void *)(v2 + 40) = 0x800000025E890F70;
  sub_25E885898();
  v0[33] = __swift_instantiateConcreteTypeFromMangledName(&qword_26B390A00);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_25E8868B0;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B390B10);
  v0[34] = v8;
  *(void *)(v7 + 56) = v8;
  unint64_t v9 = sub_25E7DF6AC();
  v0[35] = v9;
  *(void *)(v7 + 64) = v9;
  *(void *)(v7 + 32) = v2;
  swift_bridgeObjectRetain();
  sub_25E885408();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v10 = v1[3];
  uint64_t v11 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v10);
  uint64_t v17 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 + 32)
                                                                            + **(int **)(v11 + 32));
  uint64_t v12 = (void *)swift_task_alloc();
  v0[36] = v12;
  *uint64_t v12 = v0;
  v12[1] = sub_25E86C64C;
  uint64_t v13 = v0[20];
  uint64_t v14 = v0[21];
  uint64_t v15 = v0[19];
  return v17(v15, v13, v14, v10, v11);
}

uint64_t sub_25E86C64C()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
  else
  {
    return MEMORY[0x270FA2498](sub_25E86C7E4, 0, 0);
  }
}

uint64_t sub_25E86C7E4()
{
  if (qword_26B38F778 != -1) {
    swift_once();
  }
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_26A709200 + dword_26A709200);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 296) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25E86C8B4;
  return v3();
}

uint64_t sub_25E86C8B4(char a1)
{
  *(unsigned char *)(*(void *)v1 + 376) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_25E86C9B4, 0, 0);
}

uint64_t sub_25E86C9B4()
{
  if (*(unsigned char *)(v0 + 376) != 1)
  {
    long long v23 = *(_OWORD *)(v0 + 272);
    sub_25E8858B8();
    uint64_t v2 = swift_allocObject();
    *(_OWORD *)(v2 + 16) = xmmword_25E8868B0;
    *(_OWORD *)(v2 + 56) = v23;
    *(void *)(v2 + 32) = &unk_270B5E818;
    sub_25E885408();
    swift_bridgeObjectRelease();
    sub_25E86E054();
    goto LABEL_11;
  }
  if (qword_26B38FC20 != -1) {
    swift_once();
  }
  if (qword_26B38FC00) {
    BOOL v1 = qword_26B38FC18 == 0;
  }
  else {
    BOOL v1 = 1;
  }
  if (v1)
  {
    sub_25E7E4374();
LABEL_11:
    swift_allocError();
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
    return v3();
  }
  uint64_t v5 = *(void **)(v0 + 144);
  uint64_t v6 = v5[3];
  uint64_t v7 = v5[4];
  __swift_project_boxed_opaque_existential_1(v5, v6);
  char v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v6, v7);
  if (v8)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v9 = sub_25E885D48();
    swift_bridgeObjectRelease();
    if ((v9 & 1) == 0)
    {
      uint64_t v10 = *(void **)(v0 + 144);
      uint64_t v11 = v10[3];
      uint64_t v12 = v10[4];
      __swift_project_boxed_opaque_existential_1(v10, v11);
      uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 16))(v11, v12) & 1;
      uint64_t v14 = (void *)swift_task_alloc();
      *(void *)(v0 + 312) = v14;
      void *v14 = v0;
      v14[1] = sub_25E86CFE4;
      uint64_t v15 = *(void *)(v0 + 160);
      uint64_t v16 = *(void *)(v0 + 168);
      uint64_t v17 = *(void *)(v0 + 152);
      return sub_25E85F5CC(v13, v17, v15, v16);
    }
  }
  uint64_t v18 = *(void **)(v0 + 144);
  uint64_t v19 = v18[3];
  uint64_t v20 = v18[4];
  __swift_project_boxed_opaque_existential_1(v18, v19);
  long long v22 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v20 + 48) + **(int **)(v20 + 48));
  long long v21 = (void *)swift_task_alloc();
  *(void *)(v0 + 304) = v21;
  void *v21 = v0;
  v21[1] = sub_25E86CD78;
  return v22(v19, v20);
}

uint64_t sub_25E86CD78()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
  else
  {
    return MEMORY[0x270FA2498](sub_25E86CF10, 0, 0);
  }
}

uint64_t sub_25E86CF10()
{
  BOOL v1 = (void *)v0[18];
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v2, v3) & 1;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[39] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_25E86CFE4;
  uint64_t v6 = v0[20];
  uint64_t v7 = v0[21];
  uint64_t v8 = v0[19];
  return sub_25E85F5CC(v4, v8, v6, v7);
}

uint64_t sub_25E86CFE4(char a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (v1)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
  else
  {
    *(unsigned char *)(v4 + 377) = a1 & 1;
    return MEMORY[0x270FA2498](sub_25E86D188, 0, 0);
  }
}

uint64_t sub_25E86D188()
{
  int v1 = *(unsigned __int8 *)(v0 + 377);
  sub_25E7E0E28(*(void *)(v0 + 144), v0 + 16);
  if (v1 == 1)
  {
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
LABEL_9:
    uint64_t v19 = *(void **)(v0 + 144);
    uint64_t v20 = v19[3];
    uint64_t v21 = v19[4];
    __swift_project_boxed_opaque_existential_1(v19, v20);
    int v37 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v21 + 56) + **(int **)(v21 + 56));
    long long v22 = (void *)swift_task_alloc();
    *(void *)(v0 + 320) = v22;
    *long long v22 = v0;
    v22[1] = sub_25E86D518;
    uint64_t v23 = *(void *)(v0 + 256);
    return v37(v23, v20, v21);
  }
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v3 = *(void *)(v0 + 48);
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), v2);
  char v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 24))(v2, v3);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  if (v4) {
    goto LABEL_9;
  }
  uint64_t v5 = *(void **)(v0 + 144);
  uint64_t v6 = v5[3];
  uint64_t v7 = v5[4];
  __swift_project_boxed_opaque_existential_1(v5, v6);
  if ((*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v6, v7))
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v8 = sub_25E885D48();
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0)
    {
      char v9 = *(void **)(v0 + 144);
      uint64_t v10 = v9[3];
      uint64_t v11 = v9[4];
      __swift_project_boxed_opaque_existential_1(v9, v10);
      uint64_t v12 = (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 16))(v10, v11) & 1;
      uint64_t v13 = (void *)swift_task_alloc();
      *(void *)(v0 + 368) = v13;
      *uint64_t v13 = v0;
      v13[1] = sub_25E86DBDC;
      uint64_t v14 = *(void *)(v0 + 160);
      uint64_t v15 = *(void *)(v0 + 168);
      uint64_t v16 = *(void *)(v0 + 152);
      uint64_t v17 = *(void *)(v0 + 136);
      return sub_25E860004(v17, v12, v16, v14, v15);
    }
  }
  uint64_t v24 = *(void *)(v0 + 240);
  uint64_t v25 = *(void *)(v0 + 248);
  uint64_t v26 = *(void *)(v0 + 208);
  uint64_t v27 = *(void *)(v0 + 216);
  uint64_t v28 = *(void *)(v0 + 192);
  uint64_t v29 = *(void *)(v0 + 176);
  sub_25E7E0E28(*(void *)(v0 + 144), v0 + 56);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v27 + 56))(v28, 1, 1, v26);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v25 + 56))(v29, 1, 1, v24);
  unint64_t v30 = (void *)swift_task_alloc();
  *(void *)(v0 + 352) = v30;
  *unint64_t v30 = v0;
  v30[1] = sub_25E86D9A4;
  uint64_t v31 = *(void *)(v0 + 224);
  uint64_t v32 = *(void *)(v0 + 192);
  uint64_t v34 = *(void *)(v0 + 168);
  uint64_t v33 = *(void *)(v0 + 176);
  uint64_t v35 = *(void *)(v0 + 152);
  uint64_t v36 = *(void *)(v0 + 160);
  return sub_25E860BFC(v31, v0 + 56, v32, v33, v35, v36, v34);
}

uint64_t sub_25E86D518()
{
  *(void *)(*(void *)v1 + 328) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_25E86DE24;
  }
  else {
    uint64_t v2 = sub_25E86D62C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25E86D62C()
{
  uint64_t v2 = v0[31];
  uint64_t v1 = v0[32];
  uint64_t v3 = v0[30];
  uint64_t v4 = v0[26];
  uint64_t v5 = v0[27];
  uint64_t v6 = v0[25];
  uint64_t v7 = v0[23];
  sub_25E7E0E28(v0[18], (uint64_t)(v0 + 12));
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(v6, 1, 1, v4);
  sub_25E86E10C(v1, v7);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v2 + 56))(v7, 0, 1, v3);
  char v8 = (void *)swift_task_alloc();
  v0[42] = (uint64_t)v8;
  *char v8 = v0;
  v8[1] = sub_25E86D75C;
  uint64_t v9 = v0[29];
  uint64_t v10 = v0[25];
  uint64_t v11 = v0[23];
  uint64_t v12 = v0[20];
  uint64_t v13 = v0[21];
  uint64_t v14 = v0[19];
  return sub_25E860BFC(v9, (uint64_t)(v0 + 12), v10, v11, v14, v12, v13);
}

uint64_t sub_25E86D75C()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *v1 + 96;
  *(void *)(*v1 + 344) = v0;
  swift_task_dealloc();
  uint64_t v4 = *(void *)(v2 + 200);
  sub_25E7DC68C(*(void *)(v2 + 184), &qword_26B38F798);
  sub_25E7DC68C(v4, &qword_26B38F7C8);
  sub_25E7DC68C(v3, &qword_26A709BF0);
  if (v0) {
    uint64_t v5 = sub_25E86DEDC;
  }
  else {
    uint64_t v5 = sub_25E86D8D8;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_25E86D8D8()
{
  uint64_t v1 = v0[29];
  uint64_t v2 = v0[17];
  sub_25E86E170(v0[32]);
  sub_25E86E0A8(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_25E86D9A4()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *v1 + 56;
  *(void *)(*v1 + 360) = v0;
  swift_task_dealloc();
  uint64_t v4 = *(void *)(v2 + 192);
  sub_25E7DC68C(*(void *)(v2 + 176), &qword_26B38F798);
  sub_25E7DC68C(v4, &qword_26B38F7C8);
  sub_25E7DC68C(v3, &qword_26A709BF0);
  if (v0) {
    uint64_t v5 = sub_25E86DF9C;
  }
  else {
    uint64_t v5 = sub_25E86DB20;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_25E86DB20()
{
  sub_25E86E0A8(v0[28], v0[17]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_25E86DBDC()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
  else
  {
    return MEMORY[0x270FA2498](sub_25E86DD74, 0, 0);
  }
}

uint64_t sub_25E86DD74()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25E86DE24()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25E86DEDC()
{
  sub_25E86E170(*(void *)(v0 + 256));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25E86DF9C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

unint64_t sub_25E86E054()
{
  unint64_t result = qword_26A709D38;
  if (!qword_26A709D38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A709D38);
  }
  return result;
}

uint64_t sub_25E86E0A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s5CacheV5ValueOMa(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25E86E10C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s10NetworkingO12FetchedValueOMa(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25E86E170(uint64_t a1)
{
  uint64_t v2 = _s10NetworkingO12FetchedValueOMa(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unsigned char *_s8ExecutorV14ExecutionErrorOwst(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25E86E268);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *_s8ExecutorV14ExecutionErrorOMa()
{
  return &_s8ExecutorV14ExecutionErrorON;
}

unint64_t sub_25E86E2A4()
{
  unint64_t result = qword_26A709D40;
  if (!qword_26A709D40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A709D40);
  }
  return result;
}

uint64_t sub_25E86E2F8(char a1, char a2)
{
  unint64_t v3 = 0xD000000000000026;
  unint64_t v4 = 0x800000025E88E7F0;
  switch(a1)
  {
    case 1:
      unint64_t v3 = 0xD000000000000012;
      uint64_t v5 = "tv-app-jetpack-url";
      goto LABEL_10;
    case 2:
      unint64_t v3 = 0xD00000000000001CLL;
      uint64_t v5 = "tv-app-top-shelf-jetpack-url";
      goto LABEL_10;
    case 3:
      unint64_t v3 = 0xD000000000000016;
      uint64_t v5 = "get-watchlist-settings";
      goto LABEL_10;
    case 4:
      unint64_t v4 = 0xE800000000000000;
      unint64_t v3 = 0x65676175676E616CLL;
      break;
    case 5:
      unint64_t v3 = 0x65676175676E616CLL;
      unint64_t v4 = 0xEC0000006761742DLL;
      break;
    case 6:
      unint64_t v3 = 0xD000000000000027;
      uint64_t v5 = "uvSearch/max-local-settings-age-seconds";
      goto LABEL_10;
    case 7:
      unint64_t v3 = 0x6F724665726F7473;
      unint64_t v4 = 0xEC0000006449746ELL;
      break;
    case 8:
      uint64_t v6 = "update-watchlist-settings";
      goto LABEL_13;
    case 9:
      unint64_t v3 = 0xD00000000000001BLL;
      uint64_t v5 = "uvSearch/nowplaying-enabled";
LABEL_10:
      unint64_t v4 = (unint64_t)(v5 - 32) | 0x8000000000000000;
      break;
    case 10:
      uint64_t v6 = "uvSearch/uts-api-base-url";
LABEL_13:
      unint64_t v4 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      unint64_t v3 = 0xD000000000000019;
      break;
    default:
      break;
  }
  unint64_t v7 = 0xD000000000000026;
  unint64_t v8 = 0x800000025E88E7F0;
  switch(a2)
  {
    case 1:
      unint64_t v7 = 0xD000000000000012;
      uint64_t v9 = "tv-app-jetpack-url";
      goto LABEL_26;
    case 2:
      unint64_t v7 = 0xD00000000000001CLL;
      uint64_t v9 = "tv-app-top-shelf-jetpack-url";
      goto LABEL_26;
    case 3:
      unint64_t v7 = 0xD000000000000016;
      uint64_t v9 = "get-watchlist-settings";
      goto LABEL_26;
    case 4:
      unint64_t v8 = 0xE800000000000000;
      if (v3 != 0x65676175676E616CLL) {
        goto LABEL_33;
      }
      goto LABEL_28;
    case 5:
      uint64_t v10 = 0x65676175676E616CLL;
      uint64_t v11 = 1734439981;
      goto LABEL_23;
    case 6:
      unint64_t v7 = 0xD000000000000027;
      uint64_t v9 = "uvSearch/max-local-settings-age-seconds";
      goto LABEL_26;
    case 7:
      uint64_t v10 = 0x6F724665726F7473;
      uint64_t v11 = 1682535534;
LABEL_23:
      unint64_t v8 = v11 & 0xFFFFFFFFFFFFLL | 0xEC00000000000000;
      if (v3 != v10) {
        goto LABEL_33;
      }
      goto LABEL_28;
    case 8:
      uint64_t v13 = "update-watchlist-settings";
      goto LABEL_32;
    case 9:
      unint64_t v7 = 0xD00000000000001BLL;
      uint64_t v9 = "uvSearch/nowplaying-enabled";
LABEL_26:
      unint64_t v8 = (unint64_t)(v9 - 32) | 0x8000000000000000;
      goto LABEL_27;
    case 10:
      uint64_t v13 = "uvSearch/uts-api-base-url";
LABEL_32:
      unint64_t v8 = (unint64_t)(v13 - 32) | 0x8000000000000000;
      if (v3 != 0xD000000000000019) {
        goto LABEL_33;
      }
      goto LABEL_28;
    default:
LABEL_27:
      if (v3 != v7) {
        goto LABEL_33;
      }
LABEL_28:
      if (v4 == v8) {
        char v12 = 1;
      }
      else {
LABEL_33:
      }
        char v12 = sub_25E885D48();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v12 & 1;
  }
}

uint64_t sub_25E86E5E0(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0x747865746E6F63;
  unint64_t v3 = 0xE700000000000000;
  uint64_t v4 = a1;
  unint64_t v5 = 0x747865746E6F63;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0xD000000000000016;
      uint64_t v6 = "contextDotSeasonString";
      goto LABEL_5;
    case 2:
      unint64_t v5 = 0xD000000000000017;
      uint64_t v6 = "contextDotEpisodeNumber";
      goto LABEL_5;
    case 3:
      unint64_t v5 = 0xD000000000000015;
      uint64_t v6 = "contextDotReleaseDate";
LABEL_5:
      unint64_t v3 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      break;
    case 4:
      unint64_t v3 = 0x800000025E88D9F0;
      unint64_t v5 = 0xD000000000000010;
      break;
    default:
      break;
  }
  unint64_t v7 = 0xE700000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0xD000000000000016;
      unint64_t v8 = "contextDotSeasonString";
      goto LABEL_11;
    case 2:
      unint64_t v2 = 0xD000000000000017;
      unint64_t v8 = "contextDotEpisodeNumber";
      goto LABEL_11;
    case 3:
      unint64_t v2 = 0xD000000000000015;
      unint64_t v8 = "contextDotReleaseDate";
LABEL_11:
      unint64_t v7 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      goto LABEL_12;
    case 4:
      unint64_t v7 = 0x800000025E88D9F0;
      if (v5 != 0xD000000000000010) {
        goto LABEL_16;
      }
      goto LABEL_13;
    default:
LABEL_12:
      if (v5 != v2) {
        goto LABEL_16;
      }
LABEL_13:
      if (v3 == v7) {
        char v9 = 1;
      }
      else {
LABEL_16:
      }
        char v9 = sub_25E885D48();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v9 & 1;
  }
}

uint64_t sub_25E86E78C(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x65756761656CLL;
  }
  else {
    uint64_t v3 = 1835099508;
  }
  if (v2) {
    unint64_t v4 = 0xE400000000000000;
  }
  else {
    unint64_t v4 = 0xE600000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x65756761656CLL;
  }
  else {
    uint64_t v5 = 1835099508;
  }
  if (a2) {
    unint64_t v6 = 0xE600000000000000;
  }
  else {
    unint64_t v6 = 0xE400000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25E885D48();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25E86E828(char a1, unsigned __int8 a2)
{
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v2 = 0x64656E696C636564;
    }
    else {
      uint64_t v2 = 0x6465747065636361;
    }
    unint64_t v3 = 0xE800000000000000;
    int v4 = a2;
    if (a2)
    {
LABEL_6:
      if (v4 == 1) {
        uint64_t v5 = 0x64656E696C636564;
      }
      else {
        uint64_t v5 = 0x6465747065636361;
      }
      unint64_t v6 = 0xE800000000000000;
      if (v2 != v5) {
        goto LABEL_15;
      }
      goto LABEL_13;
    }
  }
  else
  {
    unint64_t v3 = 0xE700000000000000;
    uint64_t v2 = 0x6E776F6E6B6E75;
    int v4 = a2;
    if (a2) {
      goto LABEL_6;
    }
  }
  unint64_t v6 = 0xE700000000000000;
  if (v2 != 0x6E776F6E6B6E75)
  {
LABEL_15:
    char v7 = sub_25E885D48();
    goto LABEL_16;
  }
LABEL_13:
  if (v3 != v6) {
    goto LABEL_15;
  }
  char v7 = 1;
LABEL_16:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25E86E944(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2 = 0xD000000000000014;
  unint64_t v3 = 0x800000025E88E6E0;
  int v4 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v5 = 0xD000000000000022;
    }
    else {
      unint64_t v5 = 0xD000000000000025;
    }
    if (v4 == 1) {
      unint64_t v6 = 0x800000025E88E700;
    }
    else {
      unint64_t v6 = 0x800000025E88E730;
    }
    int v7 = a2;
    if (!a2) {
      goto LABEL_15;
    }
    goto LABEL_9;
  }
  unint64_t v5 = 0xD000000000000014;
  unint64_t v6 = 0x800000025E88E6E0;
  int v7 = a2;
  if (a2)
  {
LABEL_9:
    if (v7 == 1) {
      unint64_t v2 = 0xD000000000000022;
    }
    else {
      unint64_t v2 = 0xD000000000000025;
    }
    if (v7 == 1) {
      unint64_t v3 = 0x800000025E88E700;
    }
    else {
      unint64_t v3 = 0x800000025E88E730;
    }
  }
LABEL_15:
  if (v5 == v2 && v6 == v3) {
    char v8 = 1;
  }
  else {
    char v8 = sub_25E885D48();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_25E86EA44(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v3 = 0x736D616574;
    }
    else {
      uint64_t v3 = 0x7365756761656CLL;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xE500000000000000;
    }
    else {
      unint64_t v4 = 0xE700000000000000;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        uint64_t v6 = 0x736D616574;
      }
      else {
        uint64_t v6 = 0x7365756761656CLL;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xE500000000000000;
      }
      else {
        unint64_t v7 = 0xE700000000000000;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v4 = 0xE200000000000000;
    uint64_t v3 = 25705;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xE200000000000000;
  if (v3 != 25705)
  {
LABEL_21:
    char v8 = sub_25E885D48();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7) {
    goto LABEL_21;
  }
  char v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_25E86EB40(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x657469726F766166;
  }
  else {
    uint64_t v3 = 0x736E6F4372657375;
  }
  if (v2) {
    unint64_t v4 = 0xEB00000000746E65;
  }
  else {
    unint64_t v4 = 0xE900000000000073;
  }
  if (a2) {
    uint64_t v5 = 0x657469726F766166;
  }
  else {
    uint64_t v5 = 0x736E6F4372657375;
  }
  if (a2) {
    unint64_t v6 = 0xE900000000000073;
  }
  else {
    unint64_t v6 = 0xEB00000000746E65;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25E885D48();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25E86EBF4(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x6574697277;
  }
  else {
    uint64_t v3 = 1684104562;
  }
  if (v2) {
    unint64_t v4 = 0xE400000000000000;
  }
  else {
    unint64_t v4 = 0xE500000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x6574697277;
  }
  else {
    uint64_t v5 = 1684104562;
  }
  if (a2) {
    unint64_t v6 = 0xE500000000000000;
  }
  else {
    unint64_t v6 = 0xE400000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25E885D48();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25E86EC90(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v3 = 0x656B6F547478656ELL;
    }
    else {
      uint64_t v3 = 0x6F43726579616C70;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xE90000000000006ELL;
    }
    else {
      unint64_t v4 = 0xEF6449746E65746ELL;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        uint64_t v6 = 0x656B6F547478656ELL;
      }
      else {
        uint64_t v6 = 0x6F43726579616C70;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xE90000000000006ELL;
      }
      else {
        unint64_t v7 = 0xEF6449746E65746ELL;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v4 = 0xE200000000000000;
    uint64_t v3 = 25705;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xE200000000000000;
  if (v3 != 25705)
  {
LABEL_21:
    char v8 = sub_25E885D48();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7) {
    goto LABEL_21;
  }
  char v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_25E86EDB4(uint64_t a1, uint64_t a2)
{
  return sub_25E86EDE4(a1, a2, (uint64_t (*)(void))VideoItemType.rawValue.getter);
}

uint64_t sub_25E86EDCC(uint64_t a1, uint64_t a2)
{
  return sub_25E86EDE4(a1, a2, UpNextContext.rawValue.getter);
}

uint64_t sub_25E86EDE4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v4 = a3();
  uint64_t v6 = v5;
  if (v4 == a3() && v6 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = sub_25E885D48();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

uint64_t sub_25E86EE88(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v3 = 0x6D617A616873;
    }
    else {
      uint64_t v3 = 1701736302;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xE600000000000000;
    }
    else {
      unint64_t v4 = 0xE400000000000000;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        uint64_t v6 = 0x6D617A616873;
      }
      else {
        uint64_t v6 = 1701736302;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xE600000000000000;
      }
      else {
        unint64_t v7 = 0xE400000000000000;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v4 = 0xE600000000000000;
    uint64_t v3 = 0x73656E755469;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xE600000000000000;
  if (v3 != 0x73656E755469)
  {
LABEL_21:
    char v8 = sub_25E885D48();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7) {
    goto LABEL_21;
  }
  char v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_25E86EF84(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x746963696C707865;
  }
  else {
    uint64_t v3 = 0x6E61656C63;
  }
  if (v2) {
    unint64_t v4 = 0xE500000000000000;
  }
  else {
    unint64_t v4 = 0xE800000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x746963696C707865;
  }
  else {
    uint64_t v5 = 0x6E61656C63;
  }
  if (a2) {
    unint64_t v6 = 0xE800000000000000;
  }
  else {
    unint64_t v6 = 0xE500000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25E885D48();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25E86F028(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v3 = 1735290707;
    }
    else {
      uint64_t v3 = 0x7473696C79616C50;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xE400000000000000;
    }
    else {
      unint64_t v4 = 0xE800000000000000;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        uint64_t v6 = 1735290707;
      }
      else {
        uint64_t v6 = 0x7473696C79616C50;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xE400000000000000;
      }
      else {
        unint64_t v7 = 0xE800000000000000;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v4 = 0xE600000000000000;
    uint64_t v3 = 0x6E6F73726550;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xE600000000000000;
  if (v3 != 0x6E6F73726550)
  {
LABEL_21:
    char v8 = sub_25E885D48();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7) {
    goto LABEL_21;
  }
  char v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_25E86F12C(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0x4554454C4544;
  unint64_t v3 = 0xE600000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 0x4554454C4544;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE300000000000000;
      unsigned __int16 v6 = 17735;
      goto LABEL_6;
    case 2:
      unint64_t v3 = 0xE500000000000000;
      uint64_t v5 = 0x4843544150;
      break;
    case 3:
      unint64_t v3 = 0xE400000000000000;
      uint64_t v5 = 1414745936;
      break;
    case 4:
      unint64_t v3 = 0xE300000000000000;
      unsigned __int16 v6 = 21840;
LABEL_6:
      uint64_t v5 = v6 | 0x540000u;
      break;
    default:
      break;
  }
  unint64_t v7 = 0xE600000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v7 = 0xE300000000000000;
      unsigned __int16 v8 = 17735;
      goto LABEL_15;
    case 2:
      unint64_t v7 = 0xE500000000000000;
      if (v5 != 0x4843544150) {
        goto LABEL_18;
      }
      goto LABEL_16;
    case 3:
      unint64_t v7 = 0xE400000000000000;
      uint64_t v2 = 1414745936;
      goto LABEL_12;
    case 4:
      unint64_t v7 = 0xE300000000000000;
      unsigned __int16 v8 = 21840;
LABEL_15:
      if (v5 == (v8 | 0x540000)) {
        goto LABEL_16;
      }
      goto LABEL_18;
    default:
LABEL_12:
      if (v5 != v2) {
        goto LABEL_18;
      }
LABEL_16:
      if (v3 == v7) {
        char v9 = 1;
      }
      else {
LABEL_18:
      }
        char v9 = sub_25E885D48();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v9 & 1;
  }
}

uint64_t sub_25E86F2AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v5 + 72) = a3;
  *(void *)(v5 + 80) = a4;
  *(void *)(v5 + 56) = a1;
  *(void *)(v5 + 64) = a2;
  *(void *)(v5 + 88) = __swift_instantiateConcreteTypeFromMangledName(&qword_26B38F780);
  *(void *)(v5 + 96) = swift_task_alloc();
  *(void *)(v5 + 104) = _s5CacheV5ValueOMa(0);
  uint64_t v6 = swift_task_alloc();
  *(unsigned char *)(v5 + 144) = *(unsigned char *)v4;
  *(unsigned char *)(v5 + 145) = *(unsigned char *)(v4 + 1);
  uint64_t v7 = *(void *)(v4 + 8);
  *(void *)(v5 + 112) = v6;
  *(void *)(v5 + 120) = v7;
  *(unsigned char *)(v5 + 146) = *(unsigned char *)(v4 + 16);
  return MEMORY[0x270FA2498](sub_25E86F394, 0, 0);
}

uint64_t sub_25E86F394()
{
  char v1 = *(unsigned char *)(v0 + 146);
  uint64_t v2 = *(void *)(v0 + 120);
  char v3 = *(unsigned char *)(v0 + 145);
  *(unsigned char *)(v0 + 16) = *(unsigned char *)(v0 + 144);
  *(void *)(v0 + 40) = &_s11UserConsentO6ActionVN;
  *(void *)(v0 + 48) = &off_270B63FE8;
  *(unsigned char *)(v0 + 17) = v3;
  *(void *)(v0 + 24) = v2;
  *(unsigned char *)(v0 + 32) = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 128) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_25E86F46C;
  uint64_t v5 = *(void *)(v0 + 112);
  uint64_t v6 = *(void *)(v0 + 72);
  uint64_t v7 = *(void *)(v0 + 80);
  uint64_t v8 = *(void *)(v0 + 64);
  return sub_25E86C130(v5, v0 + 16, v8, v6, v7);
}

uint64_t sub_25E86F46C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 136) = v0;
  swift_task_dealloc();
  if (v0)
  {
    char v3 = sub_25E86F704;
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1(v2 + 16);
    char v3 = sub_25E86F588;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_25E86F588()
{
  char v1 = *(unsigned char *)(v0 + 145);
  uint64_t v2 = *(void *)(v0 + 112);
  char v3 = *(unsigned char **)(v0 + 96);
  uint64_t v4 = (uint64_t)&v3[*(int *)(*(void *)(v0 + 88) + 48)];
  unsigned char *v3 = v1;
  sub_25E7E0B3C(v2, v4, _s5CacheV5ValueOMa);
  if ((v1 & 1) != 0 || swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = *(void *)(v0 + 112);
    uint64_t v6 = *(void *)(v0 + 96);
    sub_25E872364();
    swift_allocError();
    swift_willThrow();
    sub_25E7E0A74(v5, _s5CacheV5ValueOMa);
    sub_25E7DC68C(v6, &qword_26B38F780);
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    uint64_t v8 = *(void *)(v0 + 56);
    sub_25E7E0A74(*(void *)(v0 + 112), _s5CacheV5ValueOMa);
    sub_25E8723B8(v4, v8);
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v7();
}

uint64_t sub_25E86F704()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  char v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t SportsFavoriteService.UserConsent.Status.rawValue.getter()
{
  uint64_t v1 = 0x64656E696C636564;
  if (*v0 != 1) {
    uint64_t v1 = 0x6465747065636361;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x6E776F6E6B6E75;
  }
}

uint64_t sub_25E86F7D8(char *a1, unsigned __int8 *a2)
{
  return sub_25E86E828(*a1, *a2);
}

uint64_t sub_25E86F7E4()
{
  return sub_25E885E58();
}

uint64_t sub_25E86F888()
{
  sub_25E885648();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25E86F918()
{
  return sub_25E885E58();
}

void sub_25E86F9B8(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xE700000000000000;
  uint64_t v4 = 0x64656E696C636564;
  if (v2 != 1) {
    uint64_t v4 = 0x6465747065636361;
  }
  BOOL v5 = v2 == 0;
  if (*v1) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = 0x6E776F6E6B6E75;
  }
  if (!v5) {
    unint64_t v3 = 0xE800000000000000;
  }
  *a1 = v6;
  a1[1] = v3;
}

uint64_t sub_25E86FA18()
{
  return sub_25E885738();
}

void SportsFavoriteService.UserConsent.State.status.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t SportsFavoriteService.UserConsent.State.lastModifiedDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for SportsFavoriteService.UserConsent.State();
  return sub_25E7DF8D0(v1 + *(int *)(v3 + 20), a1, &qword_26B390808);
}

uint64_t sub_25E86FAB4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25E87221C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25E86FADC(uint64_t a1)
{
  unint64_t v2 = sub_25E7E0D78();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25E86FB18(uint64_t a1)
{
  unint64_t v2 = sub_25E7E0D78();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SportsFavoriteService.UserConsent.State.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A709D48);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E7E0D78();
  sub_25E885E88();
  v10[15] = *v3;
  v10[14] = 0;
  sub_25E86FD40();
  sub_25E885CE8();
  if (!v2)
  {
    type metadata accessor for SportsFavoriteService.UserConsent.State();
    v10[13] = 1;
    sub_25E885368();
    sub_25E7CE610(&qword_26A709D58);
    sub_25E885C98();
    v10[12] = 2;
    sub_25E885CB8();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_25E86FD40()
{
  unint64_t result = qword_26A709D50;
  if (!qword_26A709D50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A709D50);
  }
  return result;
}

uint64_t sub_25E86FD94(void *a1)
{
  return SportsFavoriteService.UserConsent.State.encode(to:)(a1);
}

uint64_t SportsFavoriteService.UserConsent.Modification.init(status:)@<X0>(char *a1@<X0>, unsigned char *a2@<X8>)
{
  char v2 = *a1;
  if (*a1)
  {
    char v4 = sub_25E885D48();
    uint64_t result = swift_bridgeObjectRelease();
    if ((v4 & 1) == 0)
    {
      *a2 = v2;
      return result;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  sub_25E86FE74();
  swift_allocError();
  return swift_willThrow();
}

unint64_t sub_25E86FE74()
{
  unint64_t result = qword_26A709D60;
  if (!qword_26A709D60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A709D60);
  }
  return result;
}

uint64_t sub_25E86FEC8()
{
  if ((*(unsigned char *)(v0 + 16) & 1) != 0 || (*(unsigned char *)(v0 + 8) & 1) == 0) {
    return 0;
  }
  if (qword_26B38F7D0 != -1) {
    swift_once();
  }
  sub_25E885898();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B390A00);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_25E8868B0;
  *(void *)(v2 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_26B390B10);
  *(void *)(v2 + 64) = sub_25E7DF6AC();
  *(void *)(v2 + 32) = &unk_270B5E788;
  sub_25E885408();
  swift_bridgeObjectRelease();
  return 1;
}

uint64_t sub_25E86FFC4(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v5 = sub_25E885368();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v92 = (char *)&v81 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A709DB0);
  MEMORY[0x270FA5388](v8);
  uint64_t v93 = (uint64_t)&v81 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B38F798);
  MEMORY[0x270FA5388](v10 - 8);
  char v12 = (unsigned __int8 *)&v81 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B390808);
  uint64_t v14 = MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  uint64_t v19 = MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v81 - v20;
  uint64_t v22 = MEMORY[0x270FA5388](v19);
  uint64_t v24 = (char *)&v81 - v23;
  MEMORY[0x270FA5388](v22);
  uint64_t v26 = MEMORY[0x270FA5388]((char *)&v81 - v25);
  uint64_t v27 = MEMORY[0x270FA5388](v26);
  uint64_t v35 = (char *)&v81 - v34;
  if (*(unsigned char *)(v2 + 16) != 1)
  {
    uint64_t v85 = v30;
    uint64_t v86 = v28;
    uint64_t v90 = v27;
    uint64_t v91 = v29;
    uint64_t v87 = v33;
    uint64_t v88 = v32;
    uint64_t v89 = v31;
    uint64_t v40 = v6;
    sub_25E7DF8D0(a2, (uint64_t)v12, &qword_26B38F798);
    uint64_t v41 = _s10NetworkingO12FetchedValueOMa(0);
    if ((*(unsigned int (**)(unsigned __int8 *, uint64_t, uint64_t))(*(void *)(v41 - 8) + 48))(v12, 1, v41) == 1)return sub_25E7DC68C((uint64_t)v12, &qword_26B38F798); {
    if (swift_getEnumCaseMultiPayload() == 1)
    }
      return sub_25E7E0A74((uint64_t)v12, _s10NetworkingO12FetchedValueOMa);
    uint64_t v48 = 0x6E776F6E6B6E75;
    int v49 = *v12;
    uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A708D30);
    uint64_t v51 = (uint64_t)&v12[*(int *)(v50 + 48)];
    uint64_t v52 = (uint64_t)&v12[*(int *)(v50 + 64)];
    sub_25E7FA36C(v51, v91);
    sub_25E7FA36C(v52, v90);
    uint64_t v53 = 0x64656E696C636564;
    if (*a1 != 1) {
      uint64_t v53 = 0x6465747065636361;
    }
    if (*a1) {
      uint64_t v54 = v53;
    }
    else {
      uint64_t v54 = 0x6E776F6E6B6E75;
    }
    if (*a1) {
      unint64_t v55 = 0xE800000000000000;
    }
    else {
      unint64_t v55 = 0xE700000000000000;
    }
    if (v49)
    {
      unint64_t v56 = 0xE800000000000000;
      if (v49 == 1) {
        uint64_t v57 = 0x6E696C636564;
      }
      else {
        uint64_t v57 = 0x747065636361;
      }
      uint64_t v48 = v57 & 0xFFFFFFFFFFFFLL | 0x6465000000000000;
    }
    else
    {
      unint64_t v56 = 0xE700000000000000;
    }
    int v84 = v49;
    if (v54 == v48 && v55 == v56)
    {
      swift_bridgeObjectRelease_n();
      sub_25E7DF8D0(v91, (uint64_t)v24, &qword_26B390808);
    }
    else
    {
      char v58 = sub_25E885D48();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_25E7DF8D0(v91, (uint64_t)v24, &qword_26B390808);
      if ((v58 & 1) == 0)
      {
        sub_25E7DC68C((uint64_t)v24, &qword_26B390808);
        v60 = a1;
        goto LABEL_50;
      }
    }
    uint64_t v59 = type metadata accessor for SportsFavoriteService.UserConsent.State();
    v60 = a1;
    sub_25E7DF8D0((uint64_t)&a1[*(int *)(v59 + 20)], (uint64_t)v21, &qword_26B390808);
    uint64_t v61 = *(int *)(v8 + 48);
    uint64_t v62 = v93;
    uint64_t v63 = v93 + v61;
    sub_25E7DF8D0((uint64_t)v21, v93, &qword_26B390808);
    sub_25E7DF8D0((uint64_t)v24, v63, &qword_26B390808);
    v64 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v40 + 48);
    if (v64(v62, 1, v5) == 1)
    {
      sub_25E7DC68C((uint64_t)v21, &qword_26B390808);
      uint64_t v62 = v93;
      sub_25E7DC68C((uint64_t)v24, &qword_26B390808);
      if (v64(v63, 1, v5) == 1)
      {
        sub_25E7DC68C(v62, &qword_26B390808);
LABEL_53:
        unsigned __int8 *v60 = v84;
        uint64_t v70 = v86;
        sub_25E7FA36C(v91, v86);
        v71 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v40 + 48);
        if (v71(v70, 1, v5) == 1)
        {
          uint64_t v72 = type metadata accessor for SportsFavoriteService.UserConsent.State();
          uint64_t v73 = v87;
          sub_25E7DF8D0((uint64_t)&v60[*(int *)(v72 + 20)], v87, &qword_26B390808);
          sub_25E7DC68C(v70, &qword_26B390808);
        }
        else
        {
          uint64_t v73 = v87;
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v40 + 32))(v87, v70, v5);
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v40 + 56))(v73, 0, 1, v5);
        }
        uint64_t v74 = type metadata accessor for SportsFavoriteService.UserConsent.State();
        sub_25E7CEAD8(v73, (uint64_t)&v60[*(int *)(v74 + 20)]);
        uint64_t v75 = v88;
        sub_25E7FA36C(v90, v88);
        if (v71(v75, 1, v5) == 1)
        {
          v76 = &v60[*(int *)(_s5CacheV5ModelVMa(0) + 20)];
          uint64_t v77 = type metadata accessor for SportsFavoriteService.Favorites.State();
          uint64_t v78 = v89;
          sub_25E7DF8D0((uint64_t)&v76[*(int *)(v77 + 20)], v89, &qword_26B390808);
          sub_25E7DC68C(v75, &qword_26B390808);
        }
        else
        {
          uint64_t v78 = v89;
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v40 + 32))(v89, v75, v5);
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v40 + 56))(v78, 0, 1, v5);
        }
        v79 = &v60[*(int *)(_s5CacheV5ModelVMa(0) + 20)];
        uint64_t v80 = type metadata accessor for SportsFavoriteService.Favorites.State();
        uint64_t result = sub_25E7CEAD8(v78, (uint64_t)&v79[*(int *)(v80 + 20)]);
        v60[*(int *)(v74 + 24)] = 0;
        return result;
      }
    }
    else
    {
      sub_25E7DF8D0(v62, v85, &qword_26B390808);
      if (v64(v63, 1, v5) != 1)
      {
        uint64_t v65 = v40;
        uint64_t v82 = v40;
        v66 = *(void (**)(char *, uint64_t, uint64_t))(v40 + 32);
        v67 = v92;
        v66(v92, v63, v5);
        sub_25E7CE610(&qword_26A709DB8);
        uint64_t v68 = v85;
        int v83 = sub_25E885588();
        v69 = *(void (**)(char *, uint64_t))(v65 + 8);
        v69(v67, v5);
        sub_25E7DC68C((uint64_t)v21, &qword_26B390808);
        sub_25E7DC68C((uint64_t)v24, &qword_26B390808);
        v69((char *)v68, v5);
        v60 = a1;
        uint64_t v40 = v82;
        sub_25E7DC68C(v62, &qword_26B390808);
        if (v83) {
          goto LABEL_53;
        }
LABEL_50:
        if (qword_26B390858 != -1) {
          swift_once();
        }
        sub_25E86BEC8();
        goto LABEL_53;
      }
      sub_25E7DC68C((uint64_t)v21, &qword_26B390808);
      sub_25E7DC68C((uint64_t)v24, &qword_26B390808);
      (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v85, v5);
    }
    sub_25E7DC68C(v62, &qword_26A709DB0);
    goto LABEL_50;
  }
  unsigned __int8 v36 = *(unsigned char *)(v2 + 8);
  sub_25E885348();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v35, 0, 1, v5);
  uint64_t v37 = type metadata accessor for SportsFavoriteService.UserConsent.State();
  sub_25E7CEAD8((uint64_t)v35, (uint64_t)&a1[*(int *)(v37 + 20)]);
  if (!*a1)
  {
    unint64_t v38 = 0xE700000000000000;
    uint64_t v43 = 0x6E776F6E6B6E75;
    int v44 = v36;
    if (v36) {
      goto LABEL_14;
    }
LABEL_10:
    unint64_t v45 = 0xE700000000000000;
    if (v43 == 0x6E776F6E6B6E75) {
      goto LABEL_18;
    }
    goto LABEL_20;
  }
  unint64_t v38 = 0xE800000000000000;
  if (*a1 == 1) {
    uint64_t v39 = 0x6E696C636564;
  }
  else {
    uint64_t v39 = 0x747065636361;
  }
  uint64_t v43 = v39 & 0xFFFFFFFFFFFFLL | 0x6465000000000000;
  int v44 = v36;
  if (!v36) {
    goto LABEL_10;
  }
LABEL_14:
  unint64_t v45 = 0xE800000000000000;
  if (v44 == 1) {
    uint64_t v46 = 0x6E696C636564;
  }
  else {
    uint64_t v46 = 0x747065636361;
  }
  if (v43 == (v46 & 0xFFFFFFFFFFFFLL | 0x6465000000000000))
  {
LABEL_18:
    if (v38 == v45) {
      return swift_bridgeObjectRelease_n();
    }
  }
LABEL_20:
  char v47 = sub_25E885D48();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if ((v47 & 1) == 0)
  {
    *a1 = v36;
    if (qword_26B390858 != -1) {
      swift_once();
    }
    return sub_25E86BEC8();
  }
  return result;
}

uint64_t sub_25E870A50()
{
  *(unsigned char *)(v1 + 48) = *(unsigned char *)v0;
  *(void *)(v1 + 16) = *(void *)(v0 + 8);
  *(unsigned char *)(v1 + 49) = *(unsigned char *)(v0 + 16);
  return MEMORY[0x270FA2498](sub_25E870A84, 0, 0);
}

uint64_t sub_25E870A84()
{
  uint64_t v11 = v0;
  int v1 = *(unsigned __int8 *)(v0 + 49);
  if (*(unsigned char *)(v0 + 48) == 1)
  {
    swift_bridgeObjectRelease();
    if ((v1 & 1) == 0) {
      goto LABEL_3;
    }
  }
  else
  {
    int v3 = sub_25E885D48();
    swift_bridgeObjectRelease();
    if ((v3 & v1) != 1)
    {
LABEL_3:
      uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
      return v2();
    }
  }
  if (qword_26B3905C0 != -1) {
    swift_once();
  }
  uint64_t v9 = *(unsigned __int8 *)(v0 + 16);
  char v10 = 0;
  char v4 = sub_25E7F987C((uint64_t)&v9);
  *(void *)(v0 + 24) = v4;
  uint64_t v6 = (uint64_t)v4;
  uint64_t v8 = (uint64_t (*)(uint64_t))((char *)&dword_26A708B98 + dword_26A708B98);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_25E870C24;
  return v8(v6);
}

uint64_t sub_25E870C24(uint64_t a1, unint64_t a2, void *a3, void *a4)
{
  uint64_t v10 = *v5;
  *(void *)(v10 + 40) = v4;
  swift_task_dealloc();
  if (v4)
  {
    return MEMORY[0x270FA2498](sub_25E7F5FD4, 0, 0);
  }
  else
  {
    sub_25E7DF934(a1, a2);
    swift_release();

    uint64_t v11 = *(uint64_t (**)(void))(v10 + 8);
    return v11();
  }
}

uint64_t sub_25E870DA4()
{
  return *v0;
}

uint64_t sub_25E870DAC()
{
  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t sub_25E870DBC()
{
  uint64_t v2 = swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *(void *)uint64_t v2 = v1;
  *(unsigned char *)(v2 + 48) = *(unsigned char *)v0;
  uint64_t v3 = *(void *)(v0 + 8);
  *(void *)(v2 + 8) = sub_25E803444;
  *(void *)(v2 + 16) = v3;
  *(unsigned char *)(v2 + 49) = *(unsigned char *)(v0 + 16);
  return MEMORY[0x270FA2498](sub_25E870A84, 0, 0);
}

uint64_t sub_25E870E74(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_25E82C6F4;
  return sub_25E7F5C48(a1);
}

uint64_t SportsFavoriteService.UserConsent.State.debugDescription.getter()
{
  uint64_t v1 = sub_25E885318();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B390808);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = 0;
  unint64_t v13 = 0xE000000000000000;
  sub_25E885A78();
  swift_bridgeObjectRelease();
  uint64_t v12 = 0x3A73757461747328;
  unint64_t v13 = 0xE800000000000000;
  sub_25E885678();
  swift_bridgeObjectRelease();
  sub_25E885678();
  uint64_t v8 = type metadata accessor for SportsFavoriteService.UserConsent.State();
  sub_25E7DF8D0(v0 + *(int *)(v8 + 20), (uint64_t)v7, &qword_26B390808);
  uint64_t v9 = sub_25E885368();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v7, 1, v9) == 1)
  {
    sub_25E7DC68C((uint64_t)v7, &qword_26B390808);
  }
  else
  {
    sub_25E871244((uint64_t)v4);
    sub_25E8852A8();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
  }
  sub_25E885678();
  swift_bridgeObjectRelease();
  sub_25E885678();
  sub_25E885678();
  swift_bridgeObjectRelease();
  sub_25E885678();
  return v12;
}

uint64_t sub_25E871244@<X0>(uint64_t a1@<X8>)
{
  uint64_t v26 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A709D80);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v29 = (char *)&v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_25E8853E8();
  uint64_t v3 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  uint64_t v25 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_25E885308();
  uint64_t v5 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25E8852E8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_25E8852C8();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_25E8852D8();
  MEMORY[0x270FA5388](v16);
  (*(void (**)(char *, void))(v18 + 104))((char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x263F072A0]);
  uint64_t v19 = v12;
  uint64_t v20 = v28;
  (*(void (**)(char *, void, uint64_t))(v13 + 104))(v15, *MEMORY[0x263F07288], v19);
  uint64_t v21 = v7;
  uint64_t v22 = v29;
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x263F072B8], v8);
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v21, *MEMORY[0x263F072C8], v27);
  sub_25E8853D8();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 48))(v22, 1, v20);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v25, v22, v20);
    return sub_25E8852F8();
  }
  return result;
}

unint64_t sub_25E871648()
{
  unint64_t result = qword_26A709D68;
  if (!qword_26A709D68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A709D68);
  }
  return result;
}

ValueMetadata *type metadata accessor for SportsFavoriteService.UserConsent()
{
  return &type metadata for SportsFavoriteService.UserConsent;
}

ValueMetadata *type metadata accessor for SportsFavoriteService.UserConsent.Status()
{
  return &type metadata for SportsFavoriteService.UserConsent.Status;
}

void *_s11UserConsentO5StateVwCP(unsigned char *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *(unsigned char *)a2;
    uint64_t v7 = *(int *)(a3 + 20);
    uint64_t v8 = &a1[v7];
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_25E885368();
    uint64_t v11 = *(void *)(v10 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
    {
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B390808);
      memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(unsigned char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
    }
    *((unsigned char *)v4 + *(int *)(a3 + 24)) = *((unsigned char *)a2 + *(int *)(a3 + 24));
  }
  return v4;
}

uint64_t _s11UserConsentO5StateVwxx(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  uint64_t v3 = sub_25E885368();
  uint64_t v6 = *(void *)(v3 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v2, 1, v3);
  if (!result)
  {
    int v5 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
    return v5(v2, v3);
  }
  return result;
}

unsigned char *_s11UserConsentO5StateVwcp(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_25E885368();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B390808);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 16))(v7, v8, v9);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  a1[*(int *)(a3 + 24)] = a2[*(int *)(a3 + 24)];
  return a1;
}

unsigned char *_s11UserConsentO5StateVwca(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_25E885368();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 24))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B390808);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  a1[*(int *)(a3 + 24)] = a2[*(int *)(a3 + 24)];
  return a1;
}

unsigned char *_s11UserConsentO5StateVwtk(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_25E885368();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B390808);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  a1[*(int *)(a3 + 24)] = a2[*(int *)(a3 + 24)];
  return a1;
}

unsigned char *_s11UserConsentO5StateVwta(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_25E885368();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 40))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B390808);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 32))(v7, v8, v9);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  a1[*(int *)(a3 + 24)] = a2[*(int *)(a3 + 24)];
  return a1;
}

uint64_t _s11UserConsentO5StateVwet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25E871EB0);
}

uint64_t sub_25E871EB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B390808);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else
  {
    unsigned int v12 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 24));
    if (v12 >= 2) {
      return ((v12 + 2147483646) & 0x7FFFFFFF) + 1;
    }
    else {
      return 0;
    }
  }
}

uint64_t _s11UserConsentO5StateVwst(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25E871F9C);
}

uint64_t sub_25E871F9C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_26B390808);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
    unsigned int v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 24)) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for SportsFavoriteService.UserConsent.Modification()
{
  return &type metadata for SportsFavoriteService.UserConsent.Modification;
}

unsigned char *_s11UserConsentO12ModificationV17ModificationErrorOwst(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25E87210CLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *_s11UserConsentO12ModificationV17ModificationErrorOMa()
{
  return &_s11UserConsentO12ModificationV17ModificationErrorON;
}

unint64_t sub_25E872170()
{
  unint64_t result = qword_26A709D70;
  if (!qword_26A709D70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A709D70);
  }
  return result;
}

unint64_t sub_25E8721C8()
{
  unint64_t result = qword_26A709D78;
  if (!qword_26A709D78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A709D78);
  }
  return result;
}

uint64_t sub_25E87221C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x737574617473 && a2 == 0xE600000000000000;
  if (v2 || (sub_25E885D48() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000025E890FB0 || (sub_25E885D48() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x79747269447369 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_25E885D48();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

unint64_t sub_25E872364()
{
  unint64_t result = qword_26A709D90;
  if (!qword_26A709D90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A709D90);
  }
  return result;
}

uint64_t sub_25E8723B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SportsFavoriteService.UserConsent.State();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t _s11UserConsentO6ActionVwet(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && a1[17]) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 2;
  int v5 = v3 - 2;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t _s11UserConsentO6ActionVwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)unint64_t result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)unint64_t result = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *_s11UserConsentO6ActionVMa()
{
  return &_s11UserConsentO6ActionVN;
}

uint64_t _s11UserConsentO6ActionV9OperationOwet(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t _s11UserConsentO6ActionV9OperationOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)unint64_t result = a2 - 255;
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

uint64_t sub_25E872540(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_25E872548(uint64_t result, char a2)
{
  *(unsigned char *)(result + 8) = a2 & 1;
  return result;
}

ValueMetadata *_s11UserConsentO6ActionV9OperationOMa()
{
  return &_s11UserConsentO6ActionV9OperationON;
}

BOOL static VideoResourceRequestError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t VideoResourceRequestError.hash(into:)()
{
  return sub_25E885E38();
}

uint64_t VideoResourceRequestError.hashValue.getter()
{
  return sub_25E885E58();
}

unint64_t sub_25E8725F0()
{
  unint64_t result = qword_26A709DC0;
  if (!qword_26A709DC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A709DC0);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for VideoResourceRequestError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25E872710);
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

ValueMetadata *type metadata accessor for VideoResourceRequestError()
{
  return &type metadata for VideoResourceRequestError;
}

uint64_t sub_25E872748()
{
  swift_bridgeObjectRelease();
  sub_25E7DC68C(v0 + OBJC_IVAR____TtC13TVAppServices17TVAppCacheStorage____lazy_storage___cacheUrl, &qword_26B390AB8);
  return swift_deallocClassInstance();
}

uint64_t sub_25E8727BC()
{
  return type metadata accessor for TVAppCacheStorage();
}

uint64_t sub_25E8727C4()
{
  return sub_25E885E58();
}

uint64_t sub_25E8728CC()
{
  return sub_25E885E58();
}

uint64_t sub_25E872978()
{
  return sub_25E885E58();
}

uint64_t sub_25E8729D8()
{
  return sub_25E885E58();
}

uint64_t sub_25E872A34()
{
  return sub_25E885E58();
}

uint64_t sub_25E872ADC()
{
  return sub_25E885E58();
}

uint64_t sub_25E872BE0@<X0>(uint64_t result@<X0>, unsigned __int8 *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  if (!result) {
    goto LABEL_9;
  }
  uint64_t v8 = result;
  int v9 = *a2;
  unint64_t result = sub_25E859C18(77, result);
  if (!v10) {
    goto LABEL_9;
  }
  uint64_t v11 = result;
  uint64_t v12 = v10;
  uint64_t v13 = sub_25E859E80(80, v8);
  if ((v14 & 1) != 0
    || (v15 = *(double *)&v13, double v16 = COERCE_DOUBLE(sub_25E859E80(16, v8)), (v17 & 1) != 0)
    || v15 * v16 <= 0.0)
  {
    unint64_t result = swift_bridgeObjectRelease();
LABEL_9:
    *(void *)(a5 + 32) = 0;
    *(_OWORD *)a5 = 0u;
    *(_OWORD *)(a5 + 16) = 0u;
    return result;
  }
  if (v9 == 2)
  {
    double v18 = v15 / v16;
  }
  else
  {
    double v18 = 1.777777;
    if (v9) {
      double v18 = 1.0;
    }
  }
  *(void *)a5 = v11;
  *(void *)(a5 + 8) = v12;
  *(double *)(a5 + 16) = v18;
  *(void *)(a5 + 24) = a3;
  *(void *)(a5 + 32) = a4;
  return swift_bridgeObjectRetain();
}

uint64_t ImageTemplate.urlTemplate.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

double ImageTemplate.aspectRatio.getter()
{
  return *(double *)(v0 + 16);
}

uint64_t ImageTemplate.accessibilityText.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

void AspectRatio.init(rawValue:)(char *a1@<X8>, double a2@<D0>)
{
  if (a2 == 1.0) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (a2 == 1.777777) {
    char v2 = 0;
  }
  *a1 = v2;
}

double AspectRatio.rawValue.getter()
{
  double result = 1.777777;
  if (*v0) {
    return 1.0;
  }
  return result;
}

BOOL sub_25E872D98(unsigned char *a1, unsigned char *a2)
{
  double v2 = 1.777777;
  if (*a1) {
    double v3 = 1.0;
  }
  else {
    double v3 = 1.777777;
  }
  if (*a2) {
    double v2 = 1.0;
  }
  return v3 == v2;
}

unint64_t sub_25E872DCC()
{
  unint64_t result = qword_26A709DC8;
  if (!qword_26A709DC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A709DC8);
  }
  return result;
}

uint64_t sub_25E872E20()
{
  return sub_25E872978();
}

uint64_t sub_25E872E28()
{
  return sub_25E885E48();
}

uint64_t sub_25E872E70()
{
  return sub_25E8729D8();
}

double *sub_25E872E78@<X0>(double *result@<X0>, unsigned char *a2@<X8>)
{
  if (*result == 1.777777)
  {
    *a2 = 0;
  }
  else if (*result == 1.0)
  {
    *a2 = 1;
  }
  else
  {
    *a2 = 2;
  }
  return result;
}

void sub_25E872EB8(double *a1@<X8>)
{
  double v2 = 1.777777;
  if (*v1) {
    double v2 = 1.0;
  }
  *a1 = v2;
}

uint64_t destroy for ImageTemplate()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ImageTemplate(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for ImageTemplate(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for ImageTemplate(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  uint64_t v5 = a2[4];
  a1[3] = a2[3];
  a1[4] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for ImageTemplate()
{
  return &type metadata for ImageTemplate;
}

unsigned char *storeEnumTagSinglePayload for AspectRatio(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25E873100);
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

ValueMetadata *type metadata accessor for AspectRatio()
{
  return &type metadata for AspectRatio;
}

uint64_t sub_25E873138()
{
  type metadata accessor for MusicService();
  uint64_t v0 = swift_allocObject();
  type metadata accessor for MusicAPIRequestFactory();
  swift_allocObject();
  uint64_t result = sub_25E816ACC();
  *(void *)(v0 + 16) = result;
  qword_26A709DD0 = v0;
  return result;
}

uint64_t static MusicService.shared.getter()
{
  if (qword_26A708AC8 != -1) {
    swift_once();
  }
  return swift_retain();
}

uint64_t sub_25E8731EC(uint64_t a1)
{
  v2[4] = a1;
  v2[5] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A709C30);
  v2[6] = swift_task_alloc();
  v2[7] = swift_task_alloc();
  uint64_t v3 = sub_25E884F68();
  v2[8] = v3;
  v2[9] = *(void *)(v3 - 8);
  v2[10] = swift_task_alloc();
  v2[11] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25E8732FC, 0, 0);
}

uint64_t sub_25E8732FC()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = v0[9];
  uint64_t v3 = v0[7];
  sub_25E815248(v0[4], v3);
  unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 48);
  if (v4(v3, 1, v1) == 1)
  {
    sub_25E8643B4(v0[7]);
    sub_25E874188();
    swift_allocError();
    *uint64_t v5 = xmmword_25E887F20;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    unsigned int v6 = (uint64_t (*)(void))v0[1];
    return v6();
  }
  else
  {
    uint64_t v8 = v0[10];
    uint64_t v9 = v0[11];
    uint64_t v10 = v0[8];
    uint64_t v11 = v0[9];
    uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 32);
    v12(v9, v0[7], v10);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v8, v9, v10);
    type metadata accessor for AMSMediaRequestHandler();
    uint64_t v13 = swift_allocObject();
    v0[12] = v13;
    uint64_t v14 = v13 + OBJC_IVAR____TtC13TVAppServices22AMSMediaRequestHandler_urlRequest;
    v12(v13 + OBJC_IVAR____TtC13TVAppServices22AMSMediaRequestHandler_urlRequest, v8, v10);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v11 + 56))(v14, 0, 1, v10);
    if (qword_26B3905C0 != -1) {
      swift_once();
    }
    uint64_t v15 = v0[8];
    uint64_t v16 = v0[6];
    sub_25E8741DC(v13 + OBJC_IVAR____TtC13TVAppServices22AMSMediaRequestHandler_urlRequest, v16);
    uint64_t result = v4(v16, 1, v15);
    if (result == 1)
    {
      __break(1u);
    }
    else
    {
      uint64_t v19 = (uint64_t (*)(uint64_t))((char *)&dword_26A708E38 + dword_26A708E38);
      char v17 = (void *)swift_task_alloc();
      v0[13] = v17;
      *char v17 = v0;
      v17[1] = sub_25E8735C8;
      uint64_t v18 = v0[6];
      return v19(v18);
    }
  }
  return result;
}

uint64_t sub_25E8735C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unsigned int v6 = (void *)*v5;
  v6[14] = a1;
  v6[15] = a2;
  v6[16] = a3;
  v6[17] = a4;
  v6[18] = v4;
  swift_task_dealloc();
  if (v4)
  {
    uint64_t v7 = sub_25E873904;
  }
  else
  {
    uint64_t v8 = v6[8];
    uint64_t v9 = v6[9];
    uint64_t v10 = v6[6];
    uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
    v6[19] = v11;
    v6[20] = (v9 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v11(v10, v8);
    uint64_t v7 = sub_25E873708;
  }
  return MEMORY[0x270FA2498](v7, 0, 0);
}

uint64_t sub_25E873708()
{
  uint64_t v1 = v0[18];
  sub_25E884FC8();
  swift_allocObject();
  sub_25E884FB8();
  sub_25E875E48();
  sub_25E884F98();
  uint64_t v14 = (void (*)(uint64_t, uint64_t))v0[19];
  uint64_t v2 = (void *)v0[16];
  uint64_t v3 = (void *)v0[17];
  uint64_t v5 = v0[14];
  unint64_t v4 = v0[15];
  uint64_t v6 = v0[11];
  if (v1)
  {
    uint64_t v7 = v0[8];
    swift_release();
    sub_25E7DF934(v5, v4);
    swift_release();

    v14(v6, v7);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v8 = (uint64_t (*)(void))v0[1];
    return v8();
  }
  else
  {
    uint64_t v10 = v0[8];
    swift_release();
    sub_25E7DF934(v5, v4);
    swift_release();

    v14(v6, v10);
    uint64_t v11 = v0[2];
    uint64_t v12 = v0[3];
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
    return v13(v11, v12);
  }
}

uint64_t sub_25E873904()
{
  uint64_t v1 = v0[11];
  uint64_t v2 = v0[12];
  uint64_t v3 = v0[8];
  unint64_t v4 = *(void (**)(uint64_t, uint64_t))(v0[9] + 8);
  v4(v0[6], v3);
  swift_setDeallocating();
  sub_25E8643B4(v2 + OBJC_IVAR____TtC13TVAppServices22AMSMediaRequestHandler_urlRequest);
  swift_deallocClassInstance();
  v4(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_25E873A18(uint64_t a1, uint64_t a2)
{
  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A709C30);
  v3[6] = swift_task_alloc();
  v3[7] = swift_task_alloc();
  uint64_t v4 = sub_25E884F68();
  v3[8] = v4;
  v3[9] = *(void *)(v4 - 8);
  v3[10] = swift_task_alloc();
  v3[11] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25E873B2C, 0, 0);
}

uint64_t sub_25E873B2C()
{
  sub_25E8157D4(v0[4], v0[7]);
  uint64_t v1 = v0[8];
  uint64_t v2 = v0[9];
  uint64_t v3 = v0[7];
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 48);
  if (v4(v3, 1, v1) == 1)
  {
    sub_25E8643B4(v3);
    sub_25E874188();
    swift_allocError();
    *uint64_t v5 = xmmword_25E887F20;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = (uint64_t (*)(void))v0[1];
    return v6();
  }
  else
  {
    uint64_t v9 = v0[10];
    uint64_t v8 = v0[11];
    uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32);
    v10(v8, v3, v1);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v9, v8, v1);
    type metadata accessor for AMSMediaRequestHandler();
    uint64_t v11 = swift_allocObject();
    v0[12] = v11;
    uint64_t v12 = v11 + OBJC_IVAR____TtC13TVAppServices22AMSMediaRequestHandler_urlRequest;
    v10(v11 + OBJC_IVAR____TtC13TVAppServices22AMSMediaRequestHandler_urlRequest, v9, v1);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v2 + 56))(v12, 0, 1, v1);
    if (qword_26B3905C0 != -1) {
      swift_once();
    }
    uint64_t v13 = v0[8];
    uint64_t v14 = v0[6];
    sub_25E8741DC(v11 + OBJC_IVAR____TtC13TVAppServices22AMSMediaRequestHandler_urlRequest, v14);
    uint64_t result = v4(v14, 1, v13);
    if (result == 1)
    {
      __break(1u);
    }
    else
    {
      char v17 = (uint64_t (*)(uint64_t))((char *)&dword_26A708E38 + dword_26A708E38);
      uint64_t v15 = (void *)swift_task_alloc();
      v0[13] = v15;
      void *v15 = v0;
      v15[1] = sub_25E873DFC;
      uint64_t v16 = v0[6];
      return v17(v16);
    }
  }
  return result;
}

uint64_t sub_25E873DFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = (void *)*v5;
  v6[14] = a1;
  v6[15] = a2;
  v6[16] = a3;
  v6[17] = a4;
  v6[18] = v4;
  swift_task_dealloc();
  if (v4)
  {
    uint64_t v7 = sub_25E873904;
  }
  else
  {
    uint64_t v8 = v6[8];
    uint64_t v9 = v6[9];
    uint64_t v10 = v6[6];
    uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
    v6[19] = v11;
    v6[20] = (v9 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v11(v10, v8);
    uint64_t v7 = sub_25E873F3C;
  }
  return MEMORY[0x270FA2498](v7, 0, 0);
}

uint64_t sub_25E873F3C()
{
  uint64_t v1 = v0[18];
  sub_25E884FC8();
  swift_allocObject();
  sub_25E884FB8();
  sub_25E8757A4();
  sub_25E884F98();
  if (v1)
  {
    uint64_t v22 = (void (*)(uint64_t, uint64_t))v0[19];
    uint64_t v3 = (void *)v0[16];
    uint64_t v2 = (void *)v0[17];
    uint64_t v5 = v0[14];
    unint64_t v4 = v0[15];
    uint64_t v6 = v0[11];
    uint64_t v7 = v0[8];
    swift_release();
    sub_25E7DF934(v5, v4);
    swift_release();

    v22(v6, v7);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v8 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    swift_release();
    uint64_t v9 = (void *)v0[2];
    uint64_t v10 = (void *)v0[3];
    uint64_t v12 = (void *)v0[16];
    uint64_t v11 = (void *)v0[17];
    uint64_t v14 = v0[14];
    unint64_t v13 = v0[15];
    if (v9[2])
    {
      uint64_t v23 = (void *)v0[17];
      uint64_t v15 = v9[5];
      uint64_t v16 = v9[6];
      uint64_t v17 = v9[7];
      uint64_t v18 = v9[8];
      uint64_t v19 = v9[9];
      uint64_t v20 = v9[10];
      *uint64_t v10 = v9[4];
      v10[1] = v15;
      v10[2] = v16;
      v10[3] = v17;
      v10[4] = v18;
      v10[5] = v19;
      v10[6] = v20;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_25E7DF934(v14, v13);
      swift_bridgeObjectRelease();
      swift_release();
    }
    else
    {
      sub_25E7DF934(v0[14], v0[15]);
      swift_bridgeObjectRelease();
      swift_release();

      v10[6] = 0;
      *((_OWORD *)v10 + 1) = 0u;
      *((_OWORD *)v10 + 2) = 0u;
      *(_OWORD *)uint64_t v10 = 0u;
    }
    ((void (*)(void, void))v0[19])(v0[11], v0[8]);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v8 = (uint64_t (*)(void))v0[1];
  }
  return v8();
}

unint64_t sub_25E874188()
{
  unint64_t result = qword_26A709DE0;
  if (!qword_26A709DE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A709DE0);
  }
  return result;
}

uint64_t sub_25E8741DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A709C30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25E874244(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[5] = a3;
  v4[6] = v3;
  v4[3] = a1;
  v4[4] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A709C30);
  v4[7] = swift_task_alloc();
  v4[8] = swift_task_alloc();
  uint64_t v5 = sub_25E884F68();
  v4[9] = v5;
  v4[10] = *(void *)(v5 - 8);
  v4[11] = swift_task_alloc();
  v4[12] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25E874358, 0, 0);
}

uint64_t sub_25E874358()
{
  sub_25E815E58(v0[5], v0[8]);
  uint64_t v1 = v0[9];
  uint64_t v2 = v0[10];
  uint64_t v3 = v0[8];
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 48);
  if (v4(v3, 1, v1) == 1)
  {
    sub_25E8643B4(v3);
    sub_25E874188();
    swift_allocError();
    *uint64_t v5 = xmmword_25E887F20;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = (uint64_t (*)(void))v0[1];
    return v6();
  }
  else
  {
    uint64_t v9 = v0[11];
    uint64_t v8 = v0[12];
    uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32);
    v10(v8, v3, v1);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v9, v8, v1);
    type metadata accessor for AMSMediaRequestHandler();
    uint64_t v11 = swift_allocObject();
    v0[13] = v11;
    uint64_t v12 = v11 + OBJC_IVAR____TtC13TVAppServices22AMSMediaRequestHandler_urlRequest;
    v10(v11 + OBJC_IVAR____TtC13TVAppServices22AMSMediaRequestHandler_urlRequest, v9, v1);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v2 + 56))(v12, 0, 1, v1);
    if (qword_26B3905C0 != -1) {
      swift_once();
    }
    uint64_t v13 = v0[9];
    uint64_t v14 = v0[7];
    sub_25E8741DC(v11 + OBJC_IVAR____TtC13TVAppServices22AMSMediaRequestHandler_urlRequest, v14);
    uint64_t result = v4(v14, 1, v13);
    if (result == 1)
    {
      __break(1u);
    }
    else
    {
      uint64_t v17 = (uint64_t (*)(uint64_t))((char *)&dword_26A708E38 + dword_26A708E38);
      uint64_t v15 = (void *)swift_task_alloc();
      v0[14] = v15;
      void *v15 = v0;
      v15[1] = sub_25E87462C;
      uint64_t v16 = v0[7];
      return v17(v16);
    }
  }
  return result;
}

uint64_t sub_25E87462C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = (void *)*v5;
  v6[15] = a1;
  v6[16] = a2;
  v6[17] = a3;
  v6[18] = a4;
  v6[19] = v4;
  swift_task_dealloc();
  if (v4)
  {
    uint64_t v7 = sub_25E8749B8;
  }
  else
  {
    uint64_t v8 = v6[9];
    uint64_t v9 = v6[10];
    uint64_t v10 = v6[7];
    uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
    v6[20] = v11;
    v6[21] = (v9 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v11(v10, v8);
    uint64_t v7 = sub_25E87476C;
  }
  return MEMORY[0x270FA2498](v7, 0, 0);
}

uint64_t sub_25E87476C()
{
  uint64_t v1 = v0[19];
  sub_25E884FC8();
  swift_allocObject();
  sub_25E884FB8();
  sub_25E8757A4();
  sub_25E884F98();
  if (v1)
  {
    uint64_t v22 = (void (*)(uint64_t, uint64_t))v0[20];
    uint64_t v3 = (void *)v0[17];
    uint64_t v2 = (void *)v0[18];
    uint64_t v5 = v0[15];
    unint64_t v4 = v0[16];
    uint64_t v6 = v0[12];
    uint64_t v7 = v0[9];
    swift_release();
    sub_25E7DF934(v5, v4);
    swift_release();

    v22(v6, v7);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v8 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    swift_release();
    uint64_t v9 = (void *)v0[2];
    uint64_t v10 = (void *)v0[3];
    uint64_t v12 = (void *)v0[17];
    uint64_t v11 = (void *)v0[18];
    uint64_t v14 = v0[15];
    unint64_t v13 = v0[16];
    if (v9[2])
    {
      uint64_t v23 = (void *)v0[18];
      uint64_t v15 = v9[5];
      uint64_t v16 = v9[6];
      uint64_t v17 = v9[7];
      uint64_t v18 = v9[8];
      uint64_t v19 = v9[9];
      uint64_t v20 = v9[10];
      *uint64_t v10 = v9[4];
      v10[1] = v15;
      v10[2] = v16;
      v10[3] = v17;
      v10[4] = v18;
      v10[5] = v19;
      v10[6] = v20;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_25E7DF934(v14, v13);
      swift_bridgeObjectRelease();
      swift_release();
    }
    else
    {
      sub_25E7DF934(v0[15], v0[16]);
      swift_bridgeObjectRelease();
      swift_release();

      v10[6] = 0;
      *((_OWORD *)v10 + 1) = 0u;
      *((_OWORD *)v10 + 2) = 0u;
      *(_OWORD *)uint64_t v10 = 0u;
    }
    ((void (*)(void, void))v0[20])(v0[12], v0[9]);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v8 = (uint64_t (*)(void))v0[1];
  }
  return v8();
}

uint64_t sub_25E8749B8()
{
  uint64_t v1 = v0[12];
  uint64_t v2 = v0[13];
  uint64_t v3 = v0[9];
  unint64_t v4 = *(void (**)(uint64_t, uint64_t))(v0[10] + 8);
  v4(v0[7], v3);
  swift_setDeallocating();
  sub_25E8643B4(v2 + OBJC_IVAR____TtC13TVAppServices22AMSMediaRequestHandler_urlRequest);
  swift_deallocClassInstance();
  v4(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_25E874ACC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[5] = a3;
  v4[6] = v3;
  v4[3] = a1;
  v4[4] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A709C30);
  v4[7] = swift_task_alloc();
  v4[8] = swift_task_alloc();
  uint64_t v5 = sub_25E884F68();
  v4[9] = v5;
  v4[10] = *(void *)(v5 - 8);
  v4[11] = swift_task_alloc();
  v4[12] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25E874BE0, 0, 0);
}

uint64_t sub_25E874BE0()
{
  sub_25E816130(v0[4], v0[5], v0[8]);
  uint64_t v1 = v0[9];
  uint64_t v2 = v0[10];
  uint64_t v3 = v0[8];
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 48);
  if (v4(v3, 1, v1) == 1)
  {
    sub_25E8643B4(v3);
    sub_25E874188();
    swift_allocError();
    *uint64_t v5 = xmmword_25E887F20;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = (uint64_t (*)(void))v0[1];
    return v6();
  }
  else
  {
    uint64_t v9 = v0[11];
    uint64_t v8 = v0[12];
    uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32);
    v10(v8, v3, v1);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v9, v8, v1);
    type metadata accessor for AMSMediaRequestHandler();
    uint64_t v11 = swift_allocObject();
    v0[13] = v11;
    uint64_t v12 = v11 + OBJC_IVAR____TtC13TVAppServices22AMSMediaRequestHandler_urlRequest;
    v10(v11 + OBJC_IVAR____TtC13TVAppServices22AMSMediaRequestHandler_urlRequest, v9, v1);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v2 + 56))(v12, 0, 1, v1);
    if (qword_26B3905C0 != -1) {
      swift_once();
    }
    uint64_t v13 = v0[9];
    uint64_t v14 = v0[7];
    sub_25E8741DC(v11 + OBJC_IVAR____TtC13TVAppServices22AMSMediaRequestHandler_urlRequest, v14);
    uint64_t result = v4(v14, 1, v13);
    if (result == 1)
    {
      __break(1u);
    }
    else
    {
      uint64_t v17 = (uint64_t (*)(uint64_t))((char *)&dword_26A708E38 + dword_26A708E38);
      uint64_t v15 = (void *)swift_task_alloc();
      v0[14] = v15;
      void *v15 = v0;
      v15[1] = sub_25E874EB4;
      uint64_t v16 = v0[7];
      return v17(v16);
    }
  }
  return result;
}

uint64_t sub_25E874EB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = (void *)*v5;
  v6[15] = a1;
  v6[16] = a2;
  v6[17] = a3;
  v6[18] = a4;
  v6[19] = v4;
  swift_task_dealloc();
  if (v4)
  {
    uint64_t v7 = sub_25E875E9C;
  }
  else
  {
    uint64_t v8 = v6[9];
    uint64_t v9 = v6[10];
    uint64_t v10 = v6[7];
    uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
    v6[20] = v11;
    v6[21] = (v9 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v11(v10, v8);
    uint64_t v7 = sub_25E874FF4;
  }
  return MEMORY[0x270FA2498](v7, 0, 0);
}

uint64_t sub_25E874FF4()
{
  uint64_t v1 = v0[19];
  sub_25E884FC8();
  swift_allocObject();
  sub_25E884FB8();
  sub_25E8757A4();
  sub_25E884F98();
  if (v1)
  {
    uint64_t v31 = (void (*)(uint64_t, uint64_t))v0[20];
    uint64_t v3 = (void *)v0[17];
    uint64_t v2 = (void *)v0[18];
    uint64_t v4 = v0[15];
    unint64_t v5 = v0[16];
    uint64_t v6 = v0[12];
    uint64_t v7 = v0[9];
    swift_release();
    sub_25E7DF934(v4, v5);
    swift_release();

    v31(v6, v7);
LABEL_3:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v8 = (uint64_t (*)(void))v0[1];
    goto LABEL_6;
  }
  swift_release();
  uint64_t v9 = (void *)v0[2];
  uint64_t v10 = (void (*)(uint64_t, uint64_t))v0[20];
  uint64_t v11 = (void *)v0[18];
  uint64_t v32 = (void *)v0[17];
  uint64_t v12 = v0[15];
  unint64_t v30 = v0[16];
  uint64_t v14 = v0[12];
  uint64_t v13 = v0[13];
  if (!v9[2])
  {
    uint64_t v22 = v0[9];
    swift_bridgeObjectRelease();
    sub_25E874188();
    swift_allocError();
    *uint64_t v23 = xmmword_25E88CE20;
    swift_willThrow();
    sub_25E7DF934(v12, v30);

    swift_setDeallocating();
    sub_25E8643B4(v13 + OBJC_IVAR____TtC13TVAppServices22AMSMediaRequestHandler_urlRequest);
    swift_deallocClassInstance();
    v10(v14, v22);
    goto LABEL_3;
  }
  uint64_t v29 = v0[9];
  uint64_t v24 = (void *)v0[18];
  uint64_t v25 = (void (*)(uint64_t, uint64_t))v0[20];
  uint64_t v15 = v0[12];
  uint64_t v16 = (void *)v0[3];
  uint64_t v17 = v9[5];
  uint64_t v18 = v9[7];
  uint64_t v27 = v9[6];
  uint64_t v28 = v9[4];
  uint64_t v19 = v9[9];
  uint64_t v26 = v9[8];
  uint64_t v20 = v9[10];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_25E7DF934(v12, v30);
  swift_release();

  v25(v15, v29);
  *uint64_t v16 = v28;
  v16[1] = v17;
  v16[2] = v27;
  v16[3] = v18;
  v16[4] = v26;
  v16[5] = v19;
  v16[6] = v20;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
LABEL_6:
  return v8();
}

uint64_t sub_25E875308(uint64_t a1, uint64_t a2)
{
  v3[10] = a2;
  v3[11] = v2;
  v3[9] = a1;
  return MEMORY[0x270FA2498](sub_25E87532C, 0, 0);
}

uint64_t sub_25E87532C()
{
  uint64_t v2 = v0[9];
  uint64_t v1 = v0[10];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3909F8);
  uint64_t v3 = swift_allocObject();
  v0[12] = v3;
  *(_OWORD *)(v3 + 16) = xmmword_25E8868B0;
  *(void *)(v3 + 32) = v2;
  *(void *)(v3 + 40) = v1;
  swift_bridgeObjectRetain();
  uint64_t v4 = (void *)swift_task_alloc();
  v0[13] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_25E87541C;
  return sub_25E873A18((uint64_t)(v0 + 2), v3);
}

uint64_t sub_25E87541C()
{
  *(void *)(*(void *)v1 + 112) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_25E8756E4;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_25E875538;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25E875538()
{
  uint64_t v1 = v0[3];
  if (!v1)
  {
    uint64_t v8 = 0;
    goto LABEL_7;
  }
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[8];
  if (!v3)
  {
    uint64_t v11 = v0[2];
    uint64_t v12 = v0[3];
LABEL_10:
    sub_25E869650(v11, v12);
    goto LABEL_12;
  }
  if (!*(void *)(v3 + 16))
  {
    uint64_t v11 = v0[2];
    uint64_t v12 = v0[3];
    goto LABEL_10;
  }
  uint64_t v5 = v0[9];
  uint64_t v4 = v0[10];
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_25E7DC4D4(v5, v4);
  if (v7)
  {
    uint64_t v8 = *(unsigned __int8 *)(*(void *)(v3 + 56) + v6);
    sub_25E869650(v2, v1);
    swift_bridgeObjectRelease();
LABEL_7:
    uint64_t v9 = (uint64_t (*)(uint64_t))v0[1];
    uint64_t v10 = v8;
    goto LABEL_13;
  }
  sub_25E869650(v2, v1);
  swift_bridgeObjectRelease();
LABEL_12:
  sub_25E874188();
  swift_allocError();
  *uint64_t v13 = xmmword_25E88CE20;
  swift_willThrow();
  uint64_t v9 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v10 = 0;
LABEL_13:
  return v9(v10);
}

uint64_t sub_25E8756E4()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1(0);
}

uint64_t MusicService.deinit()
{
  swift_release();
  return v0;
}

uint64_t MusicService.__deallocating_deinit()
{
  swift_release();
  return swift_deallocClassInstance();
}

unint64_t sub_25E8757A4()
{
  unint64_t result = qword_26A709DE8[0];
  if (!qword_26A709DE8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A709DE8);
  }
  return result;
}

uint64_t type metadata accessor for MusicService()
{
  return self;
}

uint64_t method lookup function for MusicService(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MusicService);
}

uint64_t dispatch thunk of MusicService.fetchSavedSongsPlaylist(checkIfHasTracks:)(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 104) + **(int **)(*(void *)v2 + 104));
  unint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  void *v6 = v3;
  v6[1] = sub_25E82C6F4;
  return v8(a1, a2);
}

uint64_t dispatch thunk of MusicService.fetchPlaylist(withId:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)v3 + 112)
                                                          + **(int **)(*(void *)v3 + 112));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  *uint64_t v8 = v4;
  v8[1] = sub_25E803444;
  return v10(a1, a2, a3);
}

uint64_t dispatch thunk of MusicService.addToSavedSongsPlaylist(songId:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)v3 + 120)
                                                          + **(int **)(*(void *)v3 + 120));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  *uint64_t v8 = v4;
  v8[1] = sub_25E82C6F4;
  return v10(a1, a2, a3);
}

uint64_t dispatch thunk of MusicService.isSongAddedToSavedSongPlaylist(songId:)(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 128) + **(int **)(*(void *)v2 + 128));
  unint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  void *v6 = v3;
  v6[1] = sub_25E875C90;
  return v8(a1, a2);
}

uint64_t sub_25E875C90(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t getEnumTagSinglePayload for MusicService.MusicServiceError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFD && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483645);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 2;
  if (v4 >= 4) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for MusicService.MusicServiceError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFD)
  {
    *(void *)unint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483645;
    if (a3 >= 0x7FFFFFFD) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFD) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MusicService.MusicServiceError()
{
  return &type metadata for MusicService.MusicServiceError;
}

unint64_t sub_25E875E48()
{
  unint64_t result = qword_26A709E30[0];
  if (!qword_26A709E30[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A709E30);
  }
  return result;
}

uint64_t sub_25E875EA4()
{
  return swift_initClassMetadata2();
}

uint64_t sub_25E875F04(uint64_t a1, uint64_t a2, unsigned __int8 *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3909B8);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for UTSEndpoint();
  uint64_t v10 = v9 - 8;
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_25E885238();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v29 = (char *)v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  unint64_t v30 = (char *)v28 - v17;
  uint64_t v18 = *a3;
  uint64_t v19 = *(void *)(v33 + 576);
  v28[0] = *(void *)(v33 + 584);
  v28[1] = v19;
  uint64_t v40 = _s14VideoItemRouteVMa();
  uint64_t v41 = &off_270B64418;
  uint64_t v31 = v18;
  uint64_t v32 = a1;
  v37[0] = v18;
  uint64_t v38 = a1;
  uint64_t v39 = a2;
  uint64_t v20 = self;
  uint64_t v42 = a2;
  swift_bridgeObjectRetain();
  id v21 = [v20 app];
  v36[3] = type metadata accessor for TVAppBag(0);
  v36[4] = &protocol witness table for TVAppBag;
  v36[0] = v21;
  v34[0] = 0;
  v34[1] = 0;
  char v35 = 2;
  sub_25E84BEF4((uint64_t)v37, v36, v34, 0, 0, (uint64_t)v12);
  sub_25E7DF8D0((uint64_t)&v12[*(int *)(v10 + 32)], (uint64_t)v8, &qword_26B3909B8);
  sub_25E8089A4((uint64_t)v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v8, 1, v13) == 1)
  {
    swift_bridgeObjectRelease();
    sub_25E7DC68C((uint64_t)v8, &qword_26B3909B8);
    uint64_t v22 = _s17RequestBuildErrorOMa();
    swift_getWitnessTable();
    swift_allocError();
    swift_willThrow();
  }
  else
  {
    uint64_t v23 = v30;
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v30, v8, v13);
    uint64_t v24 = (uint64_t)v29;
    (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v29, v23, v13);
    swift_allocObject();
    uint64_t v22 = sub_25E876448(v24);
    (*(void (**)(char *, uint64_t))(v14 + 8))(v23, v13);
    uint64_t v25 = (void *)(v22 + qword_26A7155B0);
    uint64_t v26 = v32;
    *uint64_t v25 = v31;
    v25[1] = v26;
    v25[2] = v42;
    swift_bridgeObjectRelease();
  }
  return v22;
}

unint64_t sub_25E876298()
{
  int v1 = *v0;
  unint64_t v2 = 0xD000000000000019;
  if (v1 == 1) {
    unint64_t v3 = 0xD000000000000011;
  }
  else {
    unint64_t v3 = 0;
  }
  if (v1 != 12) {
    unint64_t v2 = v3;
  }
  if (*v0) {
    return v2;
  }
  else {
    return 0xD000000000000012;
  }
}

uint64_t sub_25E876304()
{
  if (*v0 != 1 && *v0) {
    return 0;
  }
  sub_25E7E00B0();
  return sub_25E8859B8();
}

unsigned char *sub_25E8763F8@<X0>(unsigned char *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  *(unsigned char *)a4 = *result;
  *(void *)(a4 + 8) = a2;
  *(void *)(a4 + 16) = a3;
  return result;
}

uint64_t sub_25E87640C(uint64_t a1)
{
  return sub_25E876448(a1);
}

uint64_t sub_25E876448(uint64_t a1)
{
  uint64_t v3 = sub_25E885238();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (void *)(v1 + qword_26A7155A8);
  *uint64_t v7 = 0;
  v7[1] = 0;
  uint64_t v8 = (void *)(v1 + qword_26A7155B0);
  *uint64_t v8 = 0;
  v8[1] = 0;
  v8[2] = 0;
  *(unsigned char *)(v1 + qword_26A7155B8) = 26;
  uint64_t v9 = (_OWORD *)(v1 + qword_26A7155C0);
  *uint64_t v9 = 0u;
  v9[1] = 0u;
  v9[2] = 0u;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
  uint64_t v10 = sub_25E7E13C4((uint64_t)v6);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return v10;
}

uint64_t sub_25E876588(uint64_t a1)
{
  v2[76] = v1;
  v2[75] = a1;
  v2[77] = *v1;
  uint64_t v3 = sub_25E885068();
  v2[78] = v3;
  v2[79] = *(void *)(v3 - 8);
  v2[80] = swift_task_alloc();
  v2[81] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B3905A0);
  v2[82] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for UTSEndpoint();
  v2[83] = v4;
  v2[84] = *(void *)(v4 - 8);
  v2[85] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25E876710, 0, 0);
}

uint64_t sub_25E876710()
{
  if (qword_26B3905F0 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_26B3905E8;
  *(void *)(v0 + 688) = qword_26B3905E8;
  return MEMORY[0x270FA2498](sub_25E8767A8, v1, 0);
}

uint64_t sub_25E8767A8()
{
  uint64_t v1 = *(void *)(v0 + 688) + 112;
  swift_beginAccess();
  sub_25E7DF8D0(v1, v0 + 16, &qword_26A708F30);
  return MEMORY[0x270FA2498](sub_25E87683C, 0, 0);
}

uint64_t sub_25E87683C()
{
  uint64_t v1 = *(void *)(v0 + 608);
  uint64_t v2 = v1 + qword_26A7155C0;
  swift_beginAccess();
  sub_25E877874(v0 + 16, v2);
  swift_endAccess();
  uint64_t v3 = (uint64_t *)(v1 + qword_26A7155B0);
  if (!*(void *)(v1 + qword_26A7155B0 + 16))
  {
LABEL_25:
    sub_25E7EDC88();
    swift_allocError();
    *uint64_t v24 = 5;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v25 = *(uint64_t (**)(void))(v0 + 8);
    return v25();
  }
  uint64_t v4 = *v3;
  sub_25E7DF8D0(v2, v0 + 160, &qword_26A708F30);
  if (!*(void *)(v0 + 160))
  {
    uint64_t v12 = *(void *)(v0 + 672);
    uint64_t v13 = *(void *)(v0 + 664);
    uint64_t v14 = *(void *)(v0 + 656);
    sub_25E7DC68C(v0 + 160, &qword_26A708F30);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56))(v14, 1, 1, v13);
LABEL_24:
    sub_25E7DC68C(*(void *)(v0 + 656), (uint64_t *)&unk_26B3905A0);
    goto LABEL_25;
  }
  uint64_t v5 = (uint64_t *)(v0 + 208);
  sub_25E8778DC(v0 + 160, v0 + 208);
  swift_bridgeObjectRetain();
  sub_25E7DC68C(v0 + 160, &qword_26A708F30);
  uint64_t v6 = _s14VideoItemRouteVMa();
  int v7 = v4;
  if ((_BYTE)v4)
  {
    unint64_t v8 = 0xE000000000000000;
    if (v4 == 1) {
      unint64_t v9 = 0xD000000000000011;
    }
    else {
      unint64_t v9 = 0;
    }
    if (v4 == 1) {
      unint64_t v8 = 0x800000025E891270;
    }
    if (v4 == 12) {
      uint64_t v10 = 0xD000000000000019;
    }
    else {
      uint64_t v10 = v9;
    }
    if (v7 == 12) {
      uint64_t v11 = 0x800000025E891250;
    }
    else {
      uint64_t v11 = v8;
    }
  }
  else
  {
    uint64_t v10 = 0xD000000000000012;
    uint64_t v11 = 0x800000025E891290;
  }
  swift_bridgeObjectRelease();
  uint64_t v15 = *v5;
  if (*(void *)(*v5 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v16 = sub_25E7DC4D4(v10, v11);
    uint64_t v17 = *(void *)(v0 + 672);
    uint64_t v18 = *(void *)(v0 + 664);
    uint64_t v19 = *(void *)(v0 + 656);
    if (v20)
    {
      sub_25E8110BC(*(void *)(v15 + 56) + *(void *)(v17 + 72) * v16, *(void *)(v0 + 656));
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v17 + 56))(v19, 0, 1, v18);
    }
    else
    {
      (*(void (**)(void, uint64_t, uint64_t, uint64_t))(v17 + 56))(*(void *)(v0 + 656), 1, 1, v18);
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(v0 + 672) + 56))(*(void *)(v0 + 656), 1, 1, *(void *)(v0 + 664));
  }
  uint64_t v21 = *(void *)(v0 + 672);
  uint64_t v22 = *(void *)(v0 + 664);
  uint64_t v23 = *(void *)(v0 + 656);
  swift_bridgeObjectRelease();
  sub_25E877938(v0 + 208);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v21 + 48))(v23, 1, v22) == 1) {
    goto LABEL_24;
  }
  uint64_t v27 = *(void *)(v0 + 680);
  uint64_t v28 = *(void *)(v0 + 664);
  sub_25E7E4140(*(void *)(v0 + 656), v27);
  uint64_t v29 = (uint64_t *)(v27 + *(int *)(v28 + 36));
  uint64_t v30 = v29[1];
  if (!v30)
  {
    sub_25E8089A4(*(void *)(v0 + 680));
    goto LABEL_25;
  }
  uint64_t v31 = *v29;
  sub_25E7DF8D0(v2, v0 + 304, &qword_26A708F30);
  if (!*(void *)(v0 + 304))
  {
    sub_25E7DC68C(v0 + 304, &qword_26A708F30);
LABEL_76:
    v66 = (void *)swift_task_alloc();
    *(void *)(v0 + 696) = v66;
    void *v66 = v0;
    v66[1] = sub_25E877390;
    uint64_t v67 = *(void *)(v0 + 600);
    return sub_25E7E16BC(v67);
  }
  sub_25E8778DC(v0 + 304, v0 + 256);
  swift_bridgeObjectRetain();
  sub_25E7DC68C(v0 + 304, &qword_26A708F30);
  sub_25E7E0E28(v0 + 264, v0 + 352);
  sub_25E877938(v0 + 256);
  uint64_t v32 = *(void *)(v0 + 376);
  if (!v32)
  {
    swift_bridgeObjectRelease();
    sub_25E7DC68C(v0 + 352, qword_26A709F40);
    goto LABEL_76;
  }
  uint64_t v33 = (_OWORD *)(v0 + 392);
  uint64_t v34 = __swift_project_boxed_opaque_existential_1((void *)(v0 + 352), v32);
  uint64_t v35 = *v34;
  if (!*(void *)(*v34 + 16))
  {
    *uint64_t v33 = 0u;
    *(_OWORD *)(v0 + 408) = 0u;
LABEL_74:
    sub_25E7DC68C(v0 + 392, &qword_26B390BD0);
    goto LABEL_75;
  }
  swift_bridgeObjectRetain();
  unint64_t v36 = sub_25E7DC4D4(v31, v30);
  if (v37)
  {
    sub_25E7DC630(*(void *)(v35 + 56) + 32 * v36, v0 + 392);
  }
  else
  {
    *uint64_t v33 = 0u;
    *(_OWORD *)(v0 + 408) = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*(void *)(v0 + 416)) {
    goto LABEL_74;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B390970);
  uint64_t v38 = MEMORY[0x263F8EE58] + 8;
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_75:
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1(v0 + 352);
    goto LABEL_76;
  }
  uint64_t v39 = (_OWORD *)(v0 + 424);
  uint64_t v40 = *(void *)(v0 + 632);
  uint64_t v41 = *(void *)(v0 + 592);
  swift_bridgeObjectRelease();
  uint64_t result = __swift_destroy_boxed_opaque_existential_1(v0 + 352);
  unint64_t v42 = 0;
  uint64_t v43 = *(void *)(v41 + 64);
  uint64_t v89 = v41 + 64;
  uint64_t v44 = -1;
  uint64_t v45 = -1 << *(unsigned char *)(v41 + 32);
  if (-v45 < 64) {
    uint64_t v44 = ~(-1 << -(char)v45);
  }
  unint64_t v46 = v44 & v43;
  unint64_t v47 = (unint64_t)(63 - v45) >> 6;
  uint64_t v94 = v40;
  uint64_t v92 = v41;
  unint64_t v86 = v47 - 1;
  uint64_t v87 = v41 + 104;
  uint64_t v48 = (_OWORD *)(v0 + 64);
  int64_t v90 = v47;
  unint64_t v88 = v47 - 5;
  uint64_t v91 = v6;
  if ((v44 & v43) == 0) {
    goto LABEL_48;
  }
LABEL_46:
  unint64_t v49 = __clz(__rbit64(v46));
  v46 &= v46 - 1;
  unint64_t v95 = v42;
  unint64_t v50 = v49 | (v42 << 6);
  uint64_t v51 = v0 + 112;
LABEL_47:
  uint64_t v52 = (void *)(*(void *)(v92 + 48) + 16 * v50);
  uint64_t v53 = v52[1];
  *(void *)(v0 + 64) = *v52;
  *(void *)(v0 + 72) = v53;
  sub_25E7DC630(*(void *)(v92 + 56) + 32 * v50, v0 + 80);
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_25E811054((uint64_t)v48, v51);
    if (!*(void *)(v0 + 120))
    {
      swift_release();
      uint64_t v68 = v3[2];
      if (v68)
      {
        uint64_t v69 = v3[1];
        *(unsigned char *)(v0 + 504) = *v3;
        *(void *)(v0 + 512) = v69;
        *(void *)(v0 + 520) = v68;
        uint64_t result = sub_25E84C3D8(v0 + 504, v6, (uint64_t)&off_270B64418);
        if (result)
        {
          int64_t v70 = 0;
          uint64_t v71 = *(void *)(result + 64);
          uint64_t v93 = result + 64;
          uint64_t v72 = -1;
          uint64_t v73 = -1 << *(unsigned char *)(result + 32);
          if (-v73 < 64) {
            uint64_t v72 = ~(-1 << -(char)v73);
          }
          uint64_t v74 = v72 & v71;
          int64_t v96 = (unint64_t)(63 - v73) >> 6;
          if ((v72 & v71) == 0) {
            goto LABEL_85;
          }
LABEL_84:
          for (v74 &= v74 - 1; ; uint64_t v74 = (v76 - 1) & v76)
          {
            uint64_t v78 = *(void *)(v0 + 608);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            sub_25E885038();
            v79 = (unint64_t *)(v78 + OBJC_IVAR____TtC13TVAppServices14RequestBuilder_queryParams);
            swift_beginAccess();
            unint64_t v80 = *v79;
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            unint64_t *v79 = v80;
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            {
              unint64_t v80 = sub_25E82797C(0, *(void *)(v80 + 16) + 1, 1, v80);
              unint64_t *v79 = v80;
            }
            unint64_t v83 = *(void *)(v80 + 16);
            unint64_t v82 = *(void *)(v80 + 24);
            if (v83 >= v82 >> 1)
            {
              unint64_t v80 = sub_25E82797C(v82 > 1, v83 + 1, 1, v80);
              unint64_t *v79 = v80;
            }
            uint64_t v84 = *(void *)(v0 + 640);
            uint64_t v85 = *(void *)(v0 + 624);
            *(void *)(v80 + 16) = v83 + 1;
            (*(void (**)(unint64_t, uint64_t, uint64_t))(v94 + 32))(v80+ ((*(unsigned __int8 *)(v94 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v94 + 80))+ *(void *)(v94 + 72) * v83, v84, v85);
            swift_endAccess();
            swift_bridgeObjectRelease();
            uint64_t result = swift_bridgeObjectRelease();
            if (v74) {
              goto LABEL_84;
            }
LABEL_85:
            int64_t v75 = v70 + 1;
            if (__OFADD__(v70, 1)) {
              goto LABEL_107;
            }
            if (v75 >= v96)
            {
LABEL_105:
              swift_release();
              goto LABEL_76;
            }
            uint64_t v76 = *(void *)(v93 + 8 * v75);
            ++v70;
            if (!v76)
            {
              int64_t v70 = v75 + 1;
              if (v75 + 1 >= v96) {
                goto LABEL_105;
              }
              uint64_t v76 = *(void *)(v93 + 8 * v70);
              if (!v76)
              {
                int64_t v70 = v75 + 2;
                if (v75 + 2 >= v96) {
                  goto LABEL_105;
                }
                uint64_t v76 = *(void *)(v93 + 8 * v70);
                if (!v76)
                {
                  int64_t v77 = v75 + 3;
                  if (v77 >= v96) {
                    goto LABEL_105;
                  }
                  uint64_t v76 = *(void *)(v93 + 8 * v77);
                  if (!v76)
                  {
                    while (1)
                    {
                      int64_t v70 = v77 + 1;
                      if (__OFADD__(v77, 1)) {
                        goto LABEL_108;
                      }
                      if (v70 >= v96) {
                        goto LABEL_105;
                      }
                      uint64_t v76 = *(void *)(v93 + 8 * v70);
                      ++v77;
                      if (v76) {
                        goto LABEL_98;
                      }
                    }
                  }
                  int64_t v70 = v77;
                }
              }
            }
LABEL_98:
            ;
          }
        }
      }
      goto LABEL_76;
    }
    sub_25E7DC9E8((_OWORD *)(v0 + 128), v39);
    if (swift_dynamicCast())
    {
      uint64_t v57 = v38;
      uint64_t v58 = *(void *)(v0 + 608);
      sub_25E885038();
      uint64_t v59 = (unint64_t *)(v58 + OBJC_IVAR____TtC13TVAppServices14RequestBuilder_queryParams);
      swift_beginAccess();
      unint64_t v60 = *v59;
      char v61 = swift_isUniquelyReferenced_nonNull_native();
      *uint64_t v59 = v60;
      if ((v61 & 1) == 0)
      {
        unint64_t v60 = sub_25E82797C(0, *(void *)(v60 + 16) + 1, 1, v60);
        *uint64_t v59 = v60;
      }
      unint64_t v63 = *(void *)(v60 + 16);
      unint64_t v62 = *(void *)(v60 + 24);
      if (v63 >= v62 >> 1)
      {
        unint64_t v60 = sub_25E82797C(v62 > 1, v63 + 1, 1, v60);
        *uint64_t v59 = v60;
      }
      uint64_t v48 = (_OWORD *)(v0 + 64);
      uint64_t v64 = *(void *)(v0 + 648);
      uint64_t v65 = *(void *)(v0 + 624);
      *(void *)(v60 + 16) = v63 + 1;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v94 + 32))(v60+ ((*(unsigned __int8 *)(v94 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v94 + 80))+ *(void *)(v94 + 72) * v63, v64, v65);
      swift_endAccess();
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v38 = v57;
      uint64_t v39 = (_OWORD *)(v0 + 424);
      uint64_t v6 = v91;
      unint64_t v42 = v95;
      if (v46) {
        goto LABEL_46;
      }
    }
    else
    {
      uint64_t result = swift_bridgeObjectRelease();
      unint64_t v42 = v95;
      if (v46) {
        goto LABEL_46;
      }
    }
LABEL_48:
    int64_t v54 = v42 + 1;
    uint64_t v51 = v0 + 112;
    if (__OFADD__(v42, 1)) {
      break;
    }
    if (v54 >= v90)
    {
      unint64_t v56 = v42;
    }
    else
    {
      unint64_t v55 = *(void *)(v89 + 8 * v54);
      if (v55) {
        goto LABEL_51;
      }
      unint64_t v56 = v42 + 1;
      if ((uint64_t)(v42 + 2) < v90)
      {
        unint64_t v55 = *(void *)(v89 + 8 * (v42 + 2));
        if (v55)
        {
          int64_t v54 = v42 + 2;
LABEL_51:
          unint64_t v46 = (v55 - 1) & v55;
          unint64_t v50 = __clz(__rbit64(v55)) + (v54 << 6);
          unint64_t v95 = v54;
          goto LABEL_47;
        }
        unint64_t v56 = v42 + 2;
        if ((uint64_t)(v42 + 3) < v90)
        {
          unint64_t v55 = *(void *)(v89 + 8 * (v42 + 3));
          if (v55)
          {
            int64_t v54 = v42 + 3;
            goto LABEL_51;
          }
          int64_t v54 = v42 + 4;
          unint64_t v56 = v42 + 3;
          if ((uint64_t)(v42 + 4) < v90)
          {
            unint64_t v55 = *(void *)(v89 + 8 * v54);
            if (v55) {
              goto LABEL_51;
            }
            while (v88 != v42)
            {
              unint64_t v55 = *(void *)(v87 + 8 * v42++);
              if (v55)
              {
                int64_t v54 = v42 + 4;
                goto LABEL_51;
              }
            }
            unint64_t v56 = v86;
          }
        }
      }
    }
    unint64_t v46 = 0;
    v48[1] = 0u;
    v48[2] = 0u;
    unint64_t v95 = v56;
    *uint64_t v48 = 0u;
  }
  __break(1u);
LABEL_107:
  __break(1u);
LABEL_108:
  __break(1u);
  return result;
}

uint64_t sub_25E877390()
{
  *(void *)(*(void *)v1 + 704) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_25E877540;
  }
  else {
    uint64_t v2 = sub_25E8774A4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25E8774A4()
{
  sub_25E8089A4(*(void *)(v0 + 680));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25E877540()
{
  sub_25E8089A4(*(void *)(v0 + 680));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25E8775D8()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return sub_25E7DC68C(v0 + qword_26A7155C0, &qword_26A708F30);
}

uint64_t sub_25E87762C()
{
  uint64_t v0 = sub_25E7E3610();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25E7DC68C(v0 + qword_26A7155C0, &qword_26A708F30);
  return v0;
}

uint64_t sub_25E877694()
{
  sub_25E87762C();
  return swift_deallocClassInstance();
}

uint64_t _s23VideoDataRequestBuilderCMa()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_25E877700(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t sub_25E87770C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_25E877714(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_25E87774C(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_25E877798(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_25E8777D4(uint64_t a1, int a2)
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

uint64_t sub_25E87781C(uint64_t result, int a2, int a3)
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

uint64_t _s14VideoItemRouteVMa()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_25E877874(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A708F30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_25E8778DC(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_25E877938(uint64_t a1)
{
  return a1;
}

uint64_t _s17RequestBuildErrorOMa()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_25E8779A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

unsigned char *sub_25E8779AC(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25E877A48);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25E877A70()
{
  return swift_getWitnessTable();
}

uint64_t TimedMetadataFetcherMock.__allocating_init(programID:adamID:contentID:playablePassThrough:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return TimedMetadataFetcher.init(programID:adamID:contentID:playablePassThrough:)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_25E877B64(uint64_t a1, uint64_t a2, double a3)
{
  *(void *)(v4 + 296) = a2;
  *(void *)(v4 + 304) = v3;
  *(void *)(v4 + 288) = a1;
  *(double *)(v4 + 280) = a3;
  uint64_t v5 = sub_25E885238();
  *(void *)(v4 + 312) = v5;
  *(void *)(v4 + 320) = *(void *)(v5 - 8);
  *(void *)(v4 + 328) = swift_task_alloc();
  *(void *)(v4 + 336) = swift_task_alloc();
  *(void *)(v4 + 344) = swift_task_alloc();
  *(void *)(v4 + 352) = swift_task_alloc();
  *(void *)(v4 + 360) = swift_task_alloc();
  *(void *)(v4 + 368) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3909B8);
  *(void *)(v4 + 376) = swift_task_alloc();
  *(void *)(v4 + 384) = swift_task_alloc();
  *(void *)(v4 + 392) = swift_task_alloc();
  *(void *)(v4 + 400) = swift_task_alloc();
  *(void *)(v4 + 408) = swift_task_alloc();
  *(void *)(v4 + 416) = swift_task_alloc();
  uint64_t v6 = sub_25E8854A8();
  *(void *)(v4 + 424) = v6;
  *(void *)(v4 + 432) = *(void *)(v6 - 8);
  *(void *)(v4 + 440) = swift_task_alloc();
  *(void *)(v4 + 448) = swift_task_alloc();
  *(void *)(v4 + 456) = swift_task_alloc();
  *(void *)(v4 + 464) = sub_25E8857C8();
  *(void *)(v4 + 472) = sub_25E8857B8();
  uint64_t v7 = sub_25E885788();
  *(void *)(v4 + 480) = v7;
  *(void *)(v4 + 488) = v8;
  return MEMORY[0x270FA2498](sub_25E877DC0, v7, v8);
}

uint64_t sub_25E877DC0()
{
  v159 = v0;
  uint64_t v158 = *MEMORY[0x263EF8340];
  unint64_t v1 = *((void *)v0 + 37);
  if (v1 >> 60 == 15)
  {
    uint64_t v2 = *((void *)v0 + 38);
    swift_beginAccess();
    unint64_t v3 = *(void *)(v2 + 40);
    if (!v3) {
      goto LABEL_16;
    }
    uint64_t v4 = HIBYTE(v3) & 0xF;
    uint64_t v152 = *(void *)(v2 + 32);
    if ((v3 & 0x2000000000000000) == 0) {
      uint64_t v4 = v152 & 0xFFFFFFFFFFFFLL;
    }
    if (!v4)
    {
LABEL_16:
      swift_release();
      uint64_t v22 = sub_25E885458();
      os_log_type_t v23 = sub_25E8858B8();
      if (os_log_type_enabled(v22, v23))
      {
        uint64_t v24 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v24 = 0;
        _os_log_impl(&dword_25E7CC000, v22, v23, "Unable to fetch timed metadata because program ID is empty", v24, 2u);
        MEMORY[0x2611E4C00](v24, -1, -1);
      }

      sub_25E86AC18();
      swift_allocError();
      swift_willThrow();
      goto LABEL_83;
    }
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_25E885458();
    os_log_type_t v6 = sub_25E8858C8();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_25E7CC000, v5, v6, "Attempting to retrieve data from test file", v7, 2u);
      MEMORY[0x2611E4C00](v7, -1, -1);
    }

    uint64_t v8 = (void *)CPSharedResourcesDirectory();
    if (v8)
    {
      id v9 = v8;
      uint64_t v156 = 0;
      unint64_t v157 = 0;
      sub_25E8855B8();
    }
    uint64_t v29 = (void *)MEMORY[0x263F8EE78];
    uint64_t v30 = sub_25E885598();
    id v31 = objc_msgSend(self, sel_bundleWithIdentifier_, v30);

    if (!v31) {
      goto LABEL_29;
    }
    uint64_t v32 = (void (**)(uint64_t, uint64_t))v3;
    uint64_t v33 = *((void *)v0 + 55);
    uint64_t v34 = v29;
    uint64_t v35 = *((void *)v0 + 53);
    uint64_t v36 = *((void *)v0 + 54);
    id v37 = objc_msgSend(v31, sel_bundlePath);

    sub_25E8855C8();
    sub_25E8854B8();
    sub_25E885498();
    uint64_t v38 = sub_25E885488();
    uint64_t v30 = v39;
    (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v33, v35);
    uint64_t v29 = v34;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      goto LABEL_87;
    }
    while (1)
    {
      unint64_t v41 = v29[2];
      unint64_t v40 = v29[3];
      unint64_t v3 = (unint64_t)v32;
      if (v41 >= v40 >> 1) {
        uint64_t v29 = sub_25E827C44((void *)(v40 > 1), v41 + 1, 1, v29);
      }
      v29[2] = v41 + 1;
      unint64_t v42 = &v29[2 * v41];
      v42[4] = v38;
      v42[5] = v30;
LABEL_29:
      v154 = *(void (**)(void, uint64_t, uint64_t, void))(*((void *)v0 + 40) + 56);
      v154(*((void *)v0 + 52), 1, 1, *((void *)v0 + 39));
      uint64_t v146 = v29[2];
      if (!v146) {
        break;
      }
      uint64_t v38 = *((void *)v0 + 40);
      uint64_t v147 = *((void *)v0 + 38);
      unint64_t v43 = 0;
      id v145 = self;
      v155 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v38 + 48);
      v153 = (void (**)(void, void, void))(v38 + 32);
      uint64_t v143 = v38;
      uint64_t v32 = (void (**)(uint64_t, uint64_t))(v38 + 8);
      unint64_t v142 = v3;
      v144 = v29;
      while (v43 < v29[2])
      {
        swift_bridgeObjectRetain();
        sub_25E885168();
        swift_bridgeObjectRelease();
        id v52 = objc_msgSend(v145, sel_defaultManager);
        uint64_t v53 = (void *)sub_25E885198();
        type metadata accessor for URLResourceKey(0);
        int64_t v54 = (void *)sub_25E885758();
        v0[32] = 0.0;
        id v55 = objc_msgSend(v52, sel_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_, v53, v54, 0, v0 + 32);

        unint64_t v56 = (void *)*((void *)v0 + 32);
        if (v55)
        {
          unint64_t v148 = v43;
          uint64_t v57 = sub_25E885768();
          id v58 = v56;

          uint64_t v59 = *(void *)(v57 + 16);
          uint64_t v149 = v57;
          if (v59)
          {
            unint64_t v60 = v57 + ((*(unsigned __int8 *)(v143 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v143 + 80));
            uint64_t v61 = *(void *)(v143 + 72);
            unint64_t v62 = *(void (**)(uint64_t, unint64_t, uint64_t))(v143 + 16);
            swift_bridgeObjectRetain();
            uint64_t v63 = v59;
            while (1)
            {
              uint64_t v64 = *((void *)v0 + 51);
              uint64_t v65 = *((void *)v0 + 39);
              v62(v64, v60, v65);
              v154(v64, 0, 1, v65);
              if ((*v155)(v64, 1, v65) == 1) {
                break;
              }
              (*v153)(*((void *)v0 + 45), *((void *)v0 + 51), *((void *)v0 + 39));
              *((void *)v0 + 21) = sub_25E885188();
              *((void *)v0 + 22) = v66;
              *((void *)v0 + 15) = v152;
              *((void *)v0 + 16) = v3;
              sub_25E7E00B0();
              char v67 = sub_25E8859C8();
              swift_bridgeObjectRelease();
              if (v67)
              {
                uint64_t v69 = *((void *)v0 + 52);
                uint64_t v71 = *((void *)v0 + 44);
                unint64_t v70 = *((void *)v0 + 45);
                uint64_t v72 = *((void *)v0 + 39);
                swift_bridgeObjectRelease();
                sub_25E7F2CD8(v69);
                v62(v69, v70, v72);
                v154(v69, 0, 1, v72);
                v62(v71, v70, v72);
                swift_bridgeObjectRetain_n();
                uint64_t v73 = sub_25E885458();
                os_log_type_t v74 = sub_25E8858C8();
                BOOL v75 = os_log_type_enabled(v73, v74);
                uint64_t v76 = *((void *)v0 + 44);
                uint64_t v77 = *((void *)v0 + 45);
                uint64_t v78 = *((void *)v0 + 39);
                unint64_t v43 = v148;
                if (v75)
                {
                  log = v73;
                  uint64_t v79 = swift_slowAlloc();
                  uint64_t v141 = swift_slowAlloc();
                  uint64_t v156 = v141;
                  *(_DWORD *)uint64_t v79 = 136315394;
                  swift_bridgeObjectRetain();
                  *((void *)v0 + 33) = sub_25E879C4C(v152, v3, &v156);
                  os_log_type_t type = v74;
                  sub_25E885988();
                  swift_bridgeObjectRelease_n();
                  *(_WORD *)(v79 + 12) = 2080;
                  sub_25E7DF9F4();
                  uint64_t v80 = sub_25E885D08();
                  *((void *)v0 + 34) = sub_25E879C4C(v80, v81, &v156);
                  sub_25E885988();
                  swift_bridgeObjectRelease();
                  unint64_t v82 = *v32;
                  (*v32)(v76, v78);
                  _os_log_impl(&dword_25E7CC000, log, type, "Using test data file for program ID %s: %s", (uint8_t *)v79, 0x16u);
                  swift_arrayDestroy();
                  MEMORY[0x2611E4C00](v141, -1, -1);
                  MEMORY[0x2611E4C00](v79, -1, -1);
                }
                else
                {
                  swift_bridgeObjectRelease_n();
                  unint64_t v82 = *v32;
                  (*v32)(v76, v78);
                }
                v82(v77, v78);
                uint64_t v68 = v149;
                goto LABEL_48;
              }
              (*v32)(*((void *)v0 + 45), *((void *)v0 + 39));
              v60 += v61;
              if (!--v63) {
                goto LABEL_42;
              }
            }
          }
          else
          {
            swift_bridgeObjectRetain();
LABEL_42:
            v154(*((void *)v0 + 51), 1, 1, *((void *)v0 + 39));
          }
          uint64_t v68 = v149;
          swift_bridgeObjectRelease();
          unint64_t v43 = v148;
LABEL_48:
          uint64_t v83 = *((void *)v0 + 50);
          uint64_t v30 = *((void *)v0 + 39);
          sub_25E7FA230(*((void *)v0 + 52), v83);
          v151 = *v155;
          unsigned int v84 = (*v155)(v83, 1, v30);
          uint64_t v85 = *((void *)v0 + 50);
          if (v84 == 1)
          {
            sub_25E7F2CD8(*((void *)v0 + 50));
            uint64_t v86 = v147;
            if (v59)
            {
              unint64_t v87 = v68
                  + ((*(unsigned __int8 *)(v143 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v143 + 80));
              swift_beginAccess();
              uint64_t v88 = *(void *)(v143 + 72);
              uint64_t v89 = *(void (**)(uint64_t, unint64_t, uint64_t))(v143 + 16);
              while (1)
              {
                uint64_t v90 = *((void *)v0 + 49);
                uint64_t v30 = *((void *)v0 + 39);
                v89(v90, v87, v30);
                v154(v90, 0, 1, v30);
                if (v151(v90, 1, v30) == 1) {
                  break;
                }
                (*v153)(*((void *)v0 + 43), *((void *)v0 + 49), *((void *)v0 + 39));
                unint64_t v91 = *(void *)(v86 + 56);
                if (!v91) {
                  goto LABEL_51;
                }
                uint64_t v30 = *(void *)(v86 + 48);
                uint64_t v92 = HIBYTE(v91) & 0xF;
                if ((v91 & 0x2000000000000000) == 0) {
                  uint64_t v92 = v30 & 0xFFFFFFFFFFFFLL;
                }
                if (v92)
                {
                  swift_bridgeObjectRetain();
                  *((void *)v0 + 19) = sub_25E885188();
                  *((void *)v0 + 20) = v93;
                  *((void *)v0 + 23) = v30;
                  *((void *)v0 + 24) = v91;
                  sub_25E7E00B0();
                  char v94 = sub_25E8859C8();
                  swift_bridgeObjectRelease();
                  if (v94)
                  {
                    uint64_t v99 = *((void *)v0 + 52);
                    uint64_t v101 = *((void *)v0 + 42);
                    unint64_t v100 = *((void *)v0 + 43);
                    uint64_t v102 = *((void *)v0 + 39);
                    swift_bridgeObjectRelease();
                    sub_25E7F2CD8(v99);
                    v89(v99, v100, v102);
                    v154(v99, 0, 1, v102);
                    v89(v101, v100, v102);
                    swift_bridgeObjectRetain();
                    v103 = sub_25E885458();
                    os_log_type_t v104 = sub_25E8858C8();
                    BOOL v105 = os_log_type_enabled(v103, v104);
                    uint64_t v106 = *((void *)v0 + 46);
                    uint64_t v107 = *((void *)v0 + 42);
                    uint64_t v108 = *((void *)v0 + 43);
                    uint64_t v109 = *((void *)v0 + 39);
                    if (v105)
                    {
                      uint64_t v150 = *((void *)v0 + 46);
                      uint64_t v110 = swift_slowAlloc();
                      os_log_t loga = (os_log_t)swift_slowAlloc();
                      uint64_t v156 = (uint64_t)loga;
                      *(_DWORD *)uint64_t v110 = 136315394;
                      os_log_type_t typea = v104;
                      swift_bridgeObjectRetain();
                      *((void *)v0 + 29) = sub_25E879C4C(v30, v91, &v156);
                      sub_25E885988();
                      swift_bridgeObjectRelease_n();
                      *(_WORD *)(v110 + 12) = 2080;
                      sub_25E7DF9F4();
                      uint64_t v111 = sub_25E885D08();
                      *((void *)v0 + 30) = sub_25E879C4C(v111, v112, &v156);
                      sub_25E885988();
                      swift_bridgeObjectRelease();
                      v113 = *v32;
                      (*v32)(v107, v109);
                      _os_log_impl(&dword_25E7CC000, v103, typea, "Using test data file for adam ID %s: %s", (uint8_t *)v110, 0x16u);
                      uint64_t v30 = (uint64_t)loga;
                      swift_arrayDestroy();
                      MEMORY[0x2611E4C00](loga, -1, -1);
                      MEMORY[0x2611E4C00](v110, -1, -1);

                      v113(v108, v109);
                      uint64_t v114 = v150;
                    }
                    else
                    {

                      v113 = *v32;
                      (*v32)(v107, v109);
                      swift_bridgeObjectRelease_n();
                      v113(v108, v109);
                      uint64_t v114 = v106;
                    }
                    v113(v114, v109);
                    goto LABEL_64;
                  }
                  (*v32)(*((void *)v0 + 43), *((void *)v0 + 39));
                  swift_bridgeObjectRelease();
                  uint64_t v86 = v147;
                }
                else
                {
LABEL_51:
                  (*v32)(*((void *)v0 + 43), *((void *)v0 + 39));
                }
                v87 += v88;
                if (!--v59) {
                  goto LABEL_62;
                }
              }
            }
            else
            {
LABEL_62:
              v154(*((void *)v0 + 49), 1, 1, *((void *)v0 + 39));
            }
            uint64_t v96 = *((void *)v0 + 46);
            uint64_t v97 = *((void *)v0 + 39);
            swift_bridgeObjectRelease();
            (*v32)(v96, v97);
LABEL_64:
            unint64_t v3 = v142;
            uint64_t v29 = v144;
            unint64_t v43 = v148;
          }
          else
          {
            uint64_t v95 = *((void *)v0 + 46);
            uint64_t v30 = *((void *)v0 + 39);
            swift_bridgeObjectRelease();
            sub_25E7F2CD8(v85);
            (*v32)(v95, v30);
            uint64_t v29 = v144;
          }
          uint64_t v38 = *((void *)v0 + 48);
          uint64_t v98 = *((void *)v0 + 39);
          sub_25E7FA230(*((void *)v0 + 52), v38);
          LODWORD(v98) = v151(v38, 1, v98);
          sub_25E7F2CD8(v38);
          if (v98 != 1) {
            goto LABEL_71;
          }
        }
        else
        {
          uint64_t v44 = *((void *)v0 + 46);
          uint64_t v45 = *((void *)v0 + 39);
          id v46 = v56;
          unint64_t v47 = (void *)sub_25E885138();

          uint64_t v30 = (uint64_t)v47;
          swift_willThrow();
          (*v32)(v44, v45);
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A709FD8);
          uint64_t v48 = swift_allocObject();
          *(_OWORD *)(v48 + 16) = xmmword_25E8868B0;
          uint64_t v156 = 0;
          unint64_t v157 = 0xE000000000000000;
          sub_25E885A78();
          unint64_t v49 = v157;
          *((void *)v0 + 17) = v156;
          *((void *)v0 + 18) = v49;
          uint64_t v38 = (uint64_t)(v0 + 17);
          sub_25E885678();
          *((void *)v0 + 31) = v47;
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B390BC0);
          sub_25E885B18();
          uint64_t v50 = *((void *)v0 + 17);
          uint64_t v51 = *((void *)v0 + 18);
          *(void *)(v48 + 56) = MEMORY[0x263F8D310];
          *(void *)(v48 + 32) = v50;
          *(void *)(v48 + 40) = v51;
          sub_25E885E18();
          swift_bridgeObjectRelease();
        }
        if (++v43 == v146) {
          goto LABEL_71;
        }
      }
      __break(1u);
LABEL_87:
      uint64_t v29 = sub_25E827C44(0, v29[2] + 1, 1, v29);
    }
LABEL_71:
    swift_bridgeObjectRelease();
    uint64_t v115 = *((void *)v0 + 47);
    uint64_t v116 = *((void *)v0 + 39);
    uint64_t v117 = *((void *)v0 + 40);
    sub_25E7FA230(*((void *)v0 + 52), v115);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v117 + 48))(v115, 1, v116) == 1)
    {
      uint64_t v118 = *((void *)v0 + 47);
      swift_release();
      sub_25E7F2CD8(v118);
      swift_retain_n();
      swift_bridgeObjectRetain();
      v119 = sub_25E885458();
      os_log_type_t v120 = sub_25E8858B8();
      BOOL v121 = os_log_type_enabled(v119, v120);
      uint64_t v122 = *((void *)v0 + 38);
      if (v121)
      {
        uint64_t v123 = swift_slowAlloc();
        uint64_t v124 = swift_slowAlloc();
        uint64_t v156 = v124;
        *(_DWORD *)uint64_t v123 = 136315394;
        swift_bridgeObjectRetain();
        *((void *)v0 + 28) = sub_25E879C4C(v152, v3, &v156);
        sub_25E885988();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v123 + 12) = 2080;
        swift_beginAccess();
        unint64_t v125 = *(void *)(v122 + 56);
        if (v125)
        {
          uint64_t v126 = *(void *)(v122 + 48);
          unint64_t v127 = v125;
        }
        else
        {
          uint64_t v126 = 0;
          unint64_t v127 = 0xE000000000000000;
        }
        swift_bridgeObjectRetain();
        *((void *)v0 + 27) = sub_25E879C4C(v126, v127, &v156);
        sub_25E885988();
        swift_bridgeObjectRelease();
        swift_release_n();
        _os_log_impl(&dword_25E7CC000, v119, v120, "Unable to locate test file URL for metadata with program ID %s, or adamId: %s", (uint8_t *)v123, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x2611E4C00](v124, -1, -1);
        MEMORY[0x2611E4C00](v123, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_release_n();
      }
      uint64_t v134 = *((void *)v0 + 52);
      sub_25E86AC18();
      swift_allocError();
      swift_willThrow();
      sub_25E7F2CD8(v134);
      goto LABEL_83;
    }
    uint64_t v128 = *((void *)v0 + 47);
    uint64_t v130 = *((void *)v0 + 40);
    uint64_t v129 = *((void *)v0 + 41);
    uint64_t v131 = *((void *)v0 + 39);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v130 + 32))(v129, v128, v131);
    uint64_t v14 = sub_25E885248();
    unint64_t v13 = v132;
    uint64_t v133 = *((void *)v0 + 52);
    (*(void (**)(void, void))(v130 + 8))(*((void *)v0 + 41), *((void *)v0 + 39));
    sub_25E7F2CD8(v133);
  }
  else
  {
    sub_25E7E4074(*((void *)v0 + 36), v1);
    uint64_t v10 = sub_25E885458();
    os_log_type_t v11 = sub_25E8858C8();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_25E7CC000, v10, v11, "Parsing provided existing data; not retrieving", v12, 2u);
      MEMORY[0x2611E4C00](v12, -1, -1);
    }

    uint64_t v14 = *((void *)v0 + 36);
    unint64_t v13 = *((void *)v0 + 37);
  }
  *((void *)v0 + 62) = v14;
  *((void *)v0 + 63) = v13;
  uint64_t v15 = self;
  unint64_t v16 = (void *)sub_25E885258();
  v0[26] = 0.0;
  id v17 = objc_msgSend(v15, sel_JSONObjectWithData_options_error_, v16, 2, v0 + 26);

  uint64_t v18 = (void *)*((void *)v0 + 26);
  if (!v17)
  {
    id v25 = v18;
    swift_release();
    sub_25E885138();

LABEL_23:
    swift_willThrow();
    sub_25E7DF934(v14, v13);
LABEL_83:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v135 = (uint64_t (*)(void))*((void *)v0 + 1);
    return v135();
  }
  id v19 = v18;
  sub_25E8859D8();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A709B78);
  if (!swift_dynamicCast())
  {
    swift_release();
    uint64_t v26 = sub_25E885458();
    os_log_type_t v27 = sub_25E8858B8();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v28 = 0;
      _os_log_impl(&dword_25E7CC000, v26, v27, "JSON file is not of type [String: AnyObject]", v28, 2u);
      MEMORY[0x2611E4C00](v28, -1, -1);
    }

    sub_25E86AC18();
    swift_allocError();
    goto LABEL_23;
  }
  double v20 = v0[35];
  uint64_t v21 = *((void *)v0 + 25);
  type metadata accessor for TimedMetadataParser();
  *((void *)v0 + 64) = sub_25E8548F0(v21, v20);
  v0[65] = 0.0;
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_25E8794A0, 0, 0);
}

uint64_t sub_25E8794A0()
{
  *(void *)(v0 + 528) = sub_25E8857B8();
  uint64_t v2 = sub_25E885788();
  return MEMORY[0x270FA2498](sub_25E879560, v2, v1);
}

uint64_t sub_25E879560()
{
  uint64_t v1 = v0[64];
  uint64_t v2 = v0[38];
  swift_release();
  sub_25E879778(v2, v1);
  uint64_t v3 = v0[60];
  uint64_t v4 = v0[61];
  return MEMORY[0x270FA2498](sub_25E879610, v3, v4);
}

uint64_t sub_25E879610()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v0[1];
  uint64_t v3 = v0[63];
  uint64_t v2 = v0[64];
  uint64_t v4 = v0[62];
  return v1(v2, v4, v3);
}

uint64_t sub_25E879778(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B38FB98);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  *(void *)(a1 + 104) = a2;
  swift_retain();
  swift_release();
  uint64_t v7 = sub_25E885458();
  os_log_type_t v8 = sub_25E8858C8();
  if (os_log_type_enabled(v7, v8))
  {
    id v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_25E7CC000, v7, v8, "Fetching songs playlist state", v9, 2u);
    MEMORY[0x2611E4C00](v9, -1, -1);
  }

  uint64_t v10 = sub_25E8857E8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v6, 1, 1, v10);
  sub_25E8857C8();
  swift_retain();
  swift_retain();
  uint64_t v11 = sub_25E8857B8();
  uint64_t v12 = (void *)swift_allocObject();
  uint64_t v13 = MEMORY[0x263F8F500];
  v12[2] = v11;
  v12[3] = v13;
  v12[4] = a2;
  v12[5] = a1;
  sub_25E8381A4((uint64_t)v6, (uint64_t)&unk_26A709C58, (uint64_t)v12);
  return swift_release();
}

uint64_t TimedMetadataFetcherMock.init(programID:adamID:contentID:playablePassThrough:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_25E885468();
  return TimedMetadataFetcher.init(programID:adamID:contentID:playablePassThrough:)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_25E879A2C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC13TVAppServices24TimedMetadataFetcherMock_logger;
  uint64_t v2 = sub_25E885478();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(v1, v2);
}

uint64_t TimedMetadataFetcherMock.deinit()
{
  uint64_t v0 = TimedMetadataFetcher.deinit();
  uint64_t v1 = v0 + OBJC_IVAR____TtC13TVAppServices24TimedMetadataFetcherMock_logger;
  uint64_t v2 = sub_25E885478();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t TimedMetadataFetcherMock.__deallocating_deinit()
{
  uint64_t v0 = TimedMetadataFetcher.deinit() + OBJC_IVAR____TtC13TVAppServices24TimedMetadataFetcherMock_logger;
  uint64_t v1 = sub_25E885478();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v0, v1);
  return swift_deallocClassInstance();
}

uint64_t sub_25E879BAC(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_25E879BD4(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_25E879C4C(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_25E885988();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_25E879C4C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_25E879F0C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25E7DC630((uint64_t)v12, *a3);
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
      sub_25E7DC630((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_25E879D20()
{
  return type metadata accessor for TimedMetadataFetcherMock();
}

uint64_t type metadata accessor for TimedMetadataFetcherMock()
{
  uint64_t result = qword_26A709FE0;
  if (!qword_26A709FE0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25E879D74()
{
  uint64_t result = sub_25E885478();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_25E879E04()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_25E879E4C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_25E803444;
  return sub_25E86773C(a1, v4, v5, v7, v6);
}

uint64_t sub_25E879F0C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_25E885998();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_25E87A0C8(a5, a6);
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
  uint64_t v8 = sub_25E885AC8();
  if (!v8)
  {
    sub_25E885B48();
    __break(1u);
LABEL_17:
    uint64_t result = sub_25E885BA8();
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

uint64_t sub_25E87A0C8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25E87A160(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_25E87A3BC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_25E87A3BC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25E87A160(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_25E87A2D8(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_25E885A88();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_25E885B48();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_25E885688();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_25E885BA8();
    __break(1u);
LABEL_14:
    uint64_t result = sub_25E885B48();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_25E87A2D8(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A709FF0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_25E87A340(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_25E8856D8();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = MEMORY[0x2611E3CF0](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_25E87A3BC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A709FF0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
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
  uint64_t result = sub_25E885BA8();
  __break(1u);
  return result;
}

uint64_t URL.queryParameters.getter()
{
  uint64_t v0 = sub_25E885068();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v50 = (char *)&v45 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A709208);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25E8850D8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  int64_t v9 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25E8850A8();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_25E87D120((uint64_t)v5);
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v5, v6);
  uint64_t v10 = sub_25E885088();
  if (!v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    return 0;
  }
  id v46 = v9;
  uint64_t v47 = v7;
  uint64_t v48 = v6;
  uint64_t v11 = *(void *)(v10 + 16);
  uint64_t v45 = v10;
  if (!v11)
  {
    uint64_t v15 = (void *)MEMORY[0x263F8EE80];
LABEL_30:
    (*(void (**)(char *, uint64_t))(v47 + 8))(v46, v48);
    swift_bridgeObjectRelease();
    return (uint64_t)v15;
  }
  unint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v1 + 16);
  uint64_t v12 = v1 + 16;
  unint64_t v14 = v10 + ((*(unsigned __int8 *)(v12 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 64));
  id v52 = (void (**)(char *, uint64_t))(v12 - 8);
  uint64_t v53 = v13;
  uint64_t v54 = v12;
  uint64_t v51 = *(void *)(v12 + 56);
  uint64_t v15 = (void *)MEMORY[0x263F8EE80];
  unint64_t v16 = v50;
  uint64_t v49 = v0;
  v13(v50, v14, v0);
  while (1)
  {
    uint64_t v18 = sub_25E885048();
    uint64_t v20 = v19;
    uint64_t v21 = sub_25E885058();
    if (v22) {
      break;
    }
    swift_bridgeObjectRetain();
    unint64_t v35 = sub_25E7DC4D4(v18, v20);
    char v37 = v36;
    swift_bridgeObjectRelease();
    if (v37)
    {
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v56 = v15;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_25E87D914();
        uint64_t v15 = v56;
      }
      swift_bridgeObjectRelease();
      sub_25E87C628(v35, (uint64_t)v15);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
LABEL_8:
    (*v52)(v16, v0);
    v14 += v51;
    if (!--v11) {
      goto LABEL_30;
    }
    v53(v16, v14, v0);
  }
  uint64_t v23 = v22;
  uint64_t v55 = v11;
  uint64_t v24 = v21;
  char v25 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v56 = v15;
  uint64_t v26 = v20;
  unint64_t v28 = sub_25E7DC4D4(v18, v20);
  uint64_t v29 = v15[2];
  BOOL v30 = (v27 & 1) == 0;
  uint64_t v31 = v29 + v30;
  if (!__OFADD__(v29, v30))
  {
    char v32 = v27;
    if (v15[3] < v31)
    {
      sub_25E87A9E4(v31, v25);
      unint64_t v33 = sub_25E7DC4D4(v18, v26);
      if ((v32 & 1) != (v34 & 1)) {
        goto LABEL_34;
      }
      unint64_t v28 = v33;
      uint64_t v15 = v56;
      if ((v32 & 1) == 0) {
        goto LABEL_22;
      }
LABEL_6:
      id v17 = (uint64_t *)(v15[7] + 16 * v28);
      swift_bridgeObjectRelease();
      *id v17 = v24;
      v17[1] = v23;
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v0 = v49;
      unint64_t v16 = v50;
      uint64_t v11 = v55;
      goto LABEL_8;
    }
    if (v25)
    {
      uint64_t v15 = v56;
      if (v27) {
        goto LABEL_6;
      }
    }
    else
    {
      sub_25E87D914();
      uint64_t v15 = v56;
      if (v32) {
        goto LABEL_6;
      }
    }
LABEL_22:
    v15[(v28 >> 6) + 8] |= 1 << v28;
    uint64_t v39 = (uint64_t *)(v15[6] + 16 * v28);
    *uint64_t v39 = v18;
    v39[1] = v26;
    unint64_t v40 = (uint64_t *)(v15[7] + 16 * v28);
    *unint64_t v40 = v24;
    v40[1] = v23;
    uint64_t v41 = v15[2];
    BOOL v42 = __OFADD__(v41, 1);
    uint64_t v43 = v41 + 1;
    if (v42) {
      goto LABEL_33;
    }
    v15[2] = v43;
    swift_bridgeObjectRetain();
    goto LABEL_7;
  }
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  uint64_t result = sub_25E885D98();
  __break(1u);
  return result;
}

uint64_t sub_25E87A9E4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B390658);
  char v42 = a2;
  uint64_t v6 = sub_25E885B88();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v41 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v39 = v2;
  int64_t v40 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40) {
      break;
    }
    uint64_t v24 = (void *)(v5 + 64);
    unint64_t v25 = *(void *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      int64_t v13 = v23 + 1;
      if (v23 + 1 >= v40) {
        goto LABEL_33;
      }
      unint64_t v25 = *(void *)(v41 + 8 * v13);
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v39;
          if ((v42 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v25 = *(void *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            int64_t v13 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v40) {
              goto LABEL_33;
            }
            unint64_t v25 = *(void *)(v41 + 8 * v13);
            ++v26;
            if (v25) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v26;
      }
    }
LABEL_30:
    unint64_t v10 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    uint64_t v31 = 16 * v22;
    char v32 = (uint64_t *)(*(void *)(v5 + 48) + v31);
    uint64_t v34 = *v32;
    uint64_t v33 = v32[1];
    unint64_t v35 = (uint64_t *)(*(void *)(v5 + 56) + v31);
    uint64_t v36 = *v35;
    uint64_t v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_25E885E28();
    sub_25E885648();
    uint64_t result = sub_25E885E58();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v29 = v16 == v28;
        if (v16 == v28) {
          unint64_t v16 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      unint64_t v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = 16 * v17;
    uint64_t v19 = (void *)(*(void *)(v7 + 48) + v18);
    *uint64_t v19 = v34;
    v19[1] = v33;
    uint64_t v20 = (void *)(*(void *)(v7 + 56) + v18);
    void *v20 = v36;
    v20[1] = v37;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  uint64_t v24 = (void *)(v5 + 64);
  if ((v42 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v38 = 1 << *(unsigned char *)(v5 + 32);
  if (v38 >= 64) {
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v24 = -1 << v38;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_25E87AD0C(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for UTSEndpoint();
  uint64_t v42 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A709FF8);
  int v43 = a2;
  uint64_t v9 = sub_25E885B88();
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16)) {
    goto LABEL_41;
  }
  uint64_t v11 = 1 << *(unsigned char *)(v8 + 32);
  uint64_t v12 = *(void *)(v8 + 64);
  uint64_t v41 = (void *)(v8 + 64);
  if (v11 < 64) {
    uint64_t v13 = ~(-1 << v11);
  }
  else {
    uint64_t v13 = -1;
  }
  unint64_t v14 = v13 & v12;
  uint64_t v39 = v2;
  int64_t v40 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v15 = v9 + 64;
  uint64_t result = swift_retain();
  int64_t v17 = 0;
  while (1)
  {
    if (v14)
    {
      unint64_t v20 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v21 = v20 | (v17 << 6);
      goto LABEL_22;
    }
    int64_t v22 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v40) {
      break;
    }
    int64_t v23 = v41;
    unint64_t v24 = v41[v22];
    ++v17;
    if (!v24)
    {
      int64_t v17 = v22 + 1;
      if (v22 + 1 >= v40) {
        goto LABEL_34;
      }
      unint64_t v24 = v41[v17];
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v40)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v39;
          if ((v43 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v24 = v41[v25];
        if (!v24)
        {
          while (1)
          {
            int64_t v17 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_43;
            }
            if (v17 >= v40) {
              goto LABEL_34;
            }
            unint64_t v24 = v41[v17];
            ++v25;
            if (v24) {
              goto LABEL_21;
            }
          }
        }
        int64_t v17 = v25;
      }
    }
LABEL_21:
    unint64_t v14 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v17 << 6);
LABEL_22:
    int64_t v26 = (uint64_t *)(*(void *)(v8 + 48) + 16 * v21);
    uint64_t v28 = *v26;
    uint64_t v27 = v26[1];
    uint64_t v29 = *(void *)(v42 + 72);
    uint64_t v30 = *(void *)(v8 + 56) + v29 * v21;
    if (v43)
    {
      sub_25E7E4140(v30, (uint64_t)v7);
    }
    else
    {
      sub_25E8110BC(v30, (uint64_t)v7);
      swift_bridgeObjectRetain();
    }
    sub_25E885E28();
    sub_25E885648();
    uint64_t result = sub_25E885E58();
    uint64_t v31 = -1 << *(unsigned char *)(v10 + 32);
    unint64_t v32 = result & ~v31;
    unint64_t v33 = v32 >> 6;
    if (((-1 << v32) & ~*(void *)(v15 + 8 * (v32 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v32) & ~*(void *)(v15 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v34 = 0;
      unint64_t v35 = (unint64_t)(63 - v31) >> 6;
      do
      {
        if (++v33 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v36 = v33 == v35;
        if (v33 == v35) {
          unint64_t v33 = 0;
        }
        v34 |= v36;
        uint64_t v37 = *(void *)(v15 + 8 * v33);
      }
      while (v37 == -1);
      unint64_t v18 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = (void *)(*(void *)(v10 + 48) + 16 * v18);
    *uint64_t v19 = v28;
    v19[1] = v27;
    uint64_t result = sub_25E7E4140((uint64_t)v7, *(void *)(v10 + 56) + v29 * v18);
    ++*(void *)(v10 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  int64_t v23 = v41;
  if ((v43 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v38 = 1 << *(unsigned char *)(v8 + 32);
  if (v38 >= 64) {
    bzero(v23, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v23 = -1 << v38;
  }
  *(void *)(v8 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  uint64_t *v3 = v10;
  return result;
}

uint64_t sub_25E87B0B0(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v44 = sub_25E885B38();
  uint64_t v5 = *(void *)(v44 - 8);
  MEMORY[0x270FA5388](v44);
  uint64_t v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A70A008);
  int v45 = a2;
  uint64_t v9 = sub_25E885B88();
  uint64_t v10 = v9;
  if (*(void *)(v8 + 16))
  {
    uint64_t v38 = v2;
    uint64_t v11 = 1 << *(unsigned char *)(v8 + 32);
    uint64_t v12 = *(void *)(v8 + 64);
    int64_t v40 = (void *)(v8 + 64);
    if (v11 < 64) {
      uint64_t v13 = ~(-1 << v11);
    }
    else {
      uint64_t v13 = -1;
    }
    unint64_t v14 = v13 & v12;
    int64_t v39 = (unint64_t)(v11 + 63) >> 6;
    uint64_t v41 = (void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    id v46 = (void (**)(char *, unint64_t, uint64_t))(v5 + 32);
    uint64_t v15 = v9 + 64;
    uint64_t result = swift_retain();
    int64_t v17 = 0;
    uint64_t v42 = v8;
    int v43 = v7;
    while (1)
    {
      if (v14)
      {
        unint64_t v19 = __clz(__rbit64(v14));
        v14 &= v14 - 1;
        unint64_t v20 = v19 | (v17 << 6);
      }
      else
      {
        int64_t v21 = v17 + 1;
        if (__OFADD__(v17, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v21 >= v39) {
          goto LABEL_34;
        }
        unint64_t v22 = v40[v21];
        ++v17;
        if (!v22)
        {
          int64_t v17 = v21 + 1;
          if (v21 + 1 >= v39) {
            goto LABEL_34;
          }
          unint64_t v22 = v40[v17];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v39)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v38;
              if (v45)
              {
                uint64_t v36 = 1 << *(unsigned char *)(v8 + 32);
                if (v36 >= 64) {
                  bzero(v40, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *int64_t v40 = -1 << v36;
                }
                *(void *)(v8 + 16) = 0;
              }
              break;
            }
            unint64_t v22 = v40[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v17 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_41;
                }
                if (v17 >= v39) {
                  goto LABEL_34;
                }
                unint64_t v22 = v40[v17];
                ++v23;
                if (v22) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v17 = v23;
          }
        }
LABEL_21:
        unint64_t v14 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v17 << 6);
      }
      uint64_t v24 = v5;
      uint64_t v25 = *(void *)(v5 + 72);
      unint64_t v26 = *(void *)(v8 + 48) + v25 * v20;
      uint64_t v27 = v43;
      uint64_t v28 = v44;
      if (v45)
      {
        (*v46)(v43, v26, v44);
        sub_25E7DC9E8((_OWORD *)(*(void *)(v8 + 56) + 32 * v20), v47);
      }
      else
      {
        (*v41)(v43, v26, v44);
        sub_25E7DC630(*(void *)(v8 + 56) + 32 * v20, (uint64_t)v47);
      }
      uint64_t result = sub_25E885568();
      uint64_t v29 = -1 << *(unsigned char *)(v10 + 32);
      unint64_t v30 = result & ~v29;
      unint64_t v31 = v30 >> 6;
      if (((-1 << v30) & ~*(void *)(v15 + 8 * (v30 >> 6))) != 0)
      {
        unint64_t v18 = __clz(__rbit64((-1 << v30) & ~*(void *)(v15 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v32 = 0;
        unint64_t v33 = (unint64_t)(63 - v29) >> 6;
        do
        {
          if (++v31 == v33 && (v32 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v34 = v31 == v33;
          if (v31 == v33) {
            unint64_t v31 = 0;
          }
          v32 |= v34;
          uint64_t v35 = *(void *)(v15 + 8 * v31);
        }
        while (v35 == -1);
        unint64_t v18 = __clz(__rbit64(~v35)) + (v31 << 6);
      }
      *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      (*v46)((char *)(*(void *)(v10 + 48) + v25 * v18), (unint64_t)v27, v28);
      uint64_t result = (uint64_t)sub_25E7DC9E8(v47, (_OWORD *)(*(void *)(v10 + 56) + 32 * v18));
      ++*(void *)(v10 + 16);
      uint64_t v5 = v24;
      uint64_t v8 = v42;
    }
  }
  uint64_t result = swift_release();
  uint64_t *v3 = v10;
  return result;
}

uint64_t sub_25E87B4AC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A70A000);
  char v37 = a2;
  uint64_t v6 = sub_25E885B88();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  BOOL v34 = v2;
  int64_t v35 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v17 = v16 | (v13 << 6);
      goto LABEL_22;
    }
    int64_t v18 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v18 >= v35) {
      break;
    }
    unint64_t v19 = (void *)(v5 + 64);
    unint64_t v20 = *(void *)(v36 + 8 * v18);
    ++v13;
    if (!v20)
    {
      int64_t v13 = v18 + 1;
      if (v18 + 1 >= v35) {
        goto LABEL_34;
      }
      unint64_t v20 = *(void *)(v36 + 8 * v13);
      if (!v20)
      {
        int64_t v21 = v18 + 2;
        if (v21 >= v35)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v34;
          if ((v37 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v20 = *(void *)(v36 + 8 * v21);
        if (!v20)
        {
          while (1)
          {
            int64_t v13 = v21 + 1;
            if (__OFADD__(v21, 1)) {
              goto LABEL_43;
            }
            if (v13 >= v35) {
              goto LABEL_34;
            }
            unint64_t v20 = *(void *)(v36 + 8 * v13);
            ++v21;
            if (v20) {
              goto LABEL_21;
            }
          }
        }
        int64_t v13 = v21;
      }
    }
LABEL_21:
    unint64_t v10 = (v20 - 1) & v20;
    unint64_t v17 = __clz(__rbit64(v20)) + (v13 << 6);
LABEL_22:
    unint64_t v22 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
    uint64_t v24 = *v22;
    uint64_t v23 = v22[1];
    uint64_t v25 = (long long *)(*(void *)(v5 + 56) + 40 * v17);
    if (v37)
    {
      sub_25E7FB98C(v25, (uint64_t)v38);
    }
    else
    {
      sub_25E7E0E28((uint64_t)v25, (uint64_t)v38);
      swift_bridgeObjectRetain();
    }
    sub_25E885E28();
    sub_25E885648();
    uint64_t result = sub_25E885E58();
    uint64_t v26 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v11 + 8 * (v27 >> 6))) != 0)
    {
      unint64_t v14 = __clz(__rbit64((-1 << v27) & ~*(void *)(v11 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_42;
        }
        BOOL v31 = v28 == v30;
        if (v28 == v30) {
          unint64_t v28 = 0;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v11 + 8 * v28);
      }
      while (v32 == -1);
      unint64_t v14 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    uint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
    void *v15 = v24;
    v15[1] = v23;
    uint64_t result = sub_25E7FB98C(v38, *(void *)(v7 + 56) + 40 * v14);
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v34;
  unint64_t v19 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v19, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v19 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_25E87B7D4(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B38FBB0);
  uint64_t v5 = *(void *)(v55 - 8);
  MEMORY[0x270FA5388](v55);
  uint64_t v54 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25E885388();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  unint64_t v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B38FBE0);
  int v51 = a2;
  uint64_t v12 = sub_25E885B88();
  uint64_t v13 = v12;
  if (!*(void *)(v11 + 16)) {
    goto LABEL_41;
  }
  uint64_t v53 = v7;
  uint64_t v14 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v15 = *(void *)(v11 + 64);
  int v45 = (void *)(v11 + 64);
  if (v14 < 64) {
    uint64_t v16 = ~(-1 << v14);
  }
  else {
    uint64_t v16 = -1;
  }
  unint64_t v17 = v16 & v15;
  int v43 = v2;
  int64_t v44 = (unint64_t)(v14 + 63) >> 6;
  uint64_t v46 = v5 + 16;
  uint64_t v47 = (void (**)(char *, unint64_t, uint64_t))(v8 + 16);
  int64_t v18 = (void (**)(char *, unint64_t, uint64_t))(v8 + 32);
  uint64_t v50 = v5;
  id v52 = (uint64_t (**)(unint64_t, char *, uint64_t))(v5 + 32);
  uint64_t v19 = v12 + 64;
  uint64_t result = swift_retain();
  int64_t v21 = 0;
  uint64_t v48 = v11;
  uint64_t v49 = v8;
  while (1)
  {
    if (v17)
    {
      unint64_t v23 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      unint64_t v24 = v23 | (v21 << 6);
      goto LABEL_22;
    }
    int64_t v25 = v21 + 1;
    if (__OFADD__(v21, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v25 >= v44) {
      break;
    }
    uint64_t v26 = v45;
    unint64_t v27 = v45[v25];
    ++v21;
    if (!v27)
    {
      int64_t v21 = v25 + 1;
      if (v25 + 1 >= v44) {
        goto LABEL_34;
      }
      unint64_t v27 = v45[v21];
      if (!v27)
      {
        int64_t v28 = v25 + 2;
        if (v28 >= v44)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v43;
          if ((v51 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v27 = v45[v28];
        if (!v27)
        {
          while (1)
          {
            int64_t v21 = v28 + 1;
            if (__OFADD__(v28, 1)) {
              goto LABEL_43;
            }
            if (v21 >= v44) {
              goto LABEL_34;
            }
            unint64_t v27 = v45[v21];
            ++v28;
            if (v27) {
              goto LABEL_21;
            }
          }
        }
        int64_t v21 = v28;
      }
    }
LABEL_21:
    unint64_t v17 = (v27 - 1) & v27;
    unint64_t v24 = __clz(__rbit64(v27)) + (v21 << 6);
LABEL_22:
    uint64_t v29 = *(void *)(v8 + 72);
    unint64_t v30 = *(void *)(v11 + 48) + v29 * v24;
    if (v51)
    {
      (*v18)(v10, v30, v53);
      uint64_t v31 = *(void *)(v11 + 56);
      uint64_t v32 = *(void *)(v50 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v50 + 32))(v54, v31 + v32 * v24, v55);
    }
    else
    {
      (*v47)(v10, v30, v53);
      uint64_t v33 = *(void *)(v11 + 56);
      uint64_t v32 = *(void *)(v50 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v50 + 16))(v54, v33 + v32 * v24, v55);
    }
    sub_25E87EDE4();
    uint64_t result = sub_25E885568();
    uint64_t v34 = -1 << *(unsigned char *)(v13 + 32);
    unint64_t v35 = result & ~v34;
    unint64_t v36 = v35 >> 6;
    if (((-1 << v35) & ~*(void *)(v19 + 8 * (v35 >> 6))) != 0)
    {
      unint64_t v22 = __clz(__rbit64((-1 << v35) & ~*(void *)(v19 + 8 * (v35 >> 6)))) | v35 & 0x7FFFFFFFFFFFFFC0;
      uint64_t v8 = v49;
    }
    else
    {
      char v37 = 0;
      unint64_t v38 = (unint64_t)(63 - v34) >> 6;
      uint64_t v8 = v49;
      do
      {
        if (++v36 == v38 && (v37 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v39 = v36 == v38;
        if (v36 == v38) {
          unint64_t v36 = 0;
        }
        v37 |= v39;
        uint64_t v40 = *(void *)(v19 + 8 * v36);
      }
      while (v40 == -1);
      unint64_t v22 = __clz(__rbit64(~v40)) + (v36 << 6);
    }
    *(void *)(v19 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    (*v18)((char *)(*(void *)(v13 + 48) + v29 * v22), (unint64_t)v10, v53);
    uint64_t result = (*v52)(*(void *)(v13 + 56) + v32 * v22, v54, v55);
    ++*(void *)(v13 + 16);
    uint64_t v11 = v48;
  }
  swift_release();
  uint64_t v3 = v43;
  uint64_t v26 = v45;
  if ((v51 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v41 = 1 << *(unsigned char *)(v11 + 32);
  if (v41 >= 64) {
    bzero(v26, ((unint64_t)(v41 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v26 = -1 << v41;
  }
  *(void *)(v11 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  uint64_t *v3 = v13;
  return result;
}

uint64_t sub_25E87BCB4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A708CB8);
  char v36 = a2;
  uint64_t v6 = sub_25E885B88();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34) {
      break;
    }
    unint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_25E885E28();
    sub_25E885648();
    uint64_t result = sub_25E885E58();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    int64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *int64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  unint64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_25E87BFCC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A708CB0);
  char v37 = a2;
  uint64_t v6 = sub_25E885B88();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = v2;
  int64_t v35 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v35) {
      break;
    }
    unint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v35) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v34;
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v35) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    char v32 = *(unsigned char *)(*(void *)(v5 + 56) + v20);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_25E885E28();
    sub_25E885648();
    uint64_t result = sub_25E885E58();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    int64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *int64_t v18 = v31;
    v18[1] = v30;
    *(unsigned char *)(*(void *)(v7 + 56) + v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v34;
  unint64_t v22 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_25E87C2D8(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A709C98);
  char v37 = a2;
  uint64_t v6 = sub_25E885B88();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = v2;
  int64_t v35 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v17 = v16 | (v13 << 6);
      if (v37) {
        goto LABEL_10;
      }
      goto LABEL_23;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v35) {
      break;
    }
    unint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v35) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v34;
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v35) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_22;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_22:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v17 = __clz(__rbit64(v23)) + (v13 << 6);
    if (v37)
    {
LABEL_10:
      int64_t v18 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v19 = *v18;
      uint64_t v20 = v18[1];
      sub_25E87E798(*(void *)(v5 + 56) + 136 * v17, (uint64_t)v38);
      goto LABEL_24;
    }
LABEL_23:
    char v25 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
    uint64_t v19 = *v25;
    uint64_t v20 = v25[1];
    sub_25E87E798(*(void *)(v5 + 56) + 136 * v17, (uint64_t)v38);
    swift_bridgeObjectRetain();
    sub_25E87E800(v38);
LABEL_24:
    sub_25E87E798((uint64_t)v38, (uint64_t)v39);
    sub_25E885E28();
    sub_25E885648();
    uint64_t result = sub_25E885E58();
    uint64_t v26 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v11 + 8 * (v27 >> 6))) != 0)
    {
      unint64_t v14 = __clz(__rbit64((-1 << v27) & ~*(void *)(v11 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_41;
        }
        BOOL v31 = v28 == v30;
        if (v28 == v30) {
          unint64_t v28 = 0;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v11 + 8 * v28);
      }
      while (v32 == -1);
      unint64_t v14 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    unint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
    void *v15 = v19;
    v15[1] = v20;
    uint64_t result = sub_25E87E798((uint64_t)v39, *(void *)(v7 + 56) + 136 * v14);
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v34;
  unint64_t v22 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

unint64_t sub_25E87C628(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_25E885A08();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_25E885E28();
        swift_bridgeObjectRetain();
        sub_25E885648();
        uint64_t v9 = sub_25E885E58();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          int64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *uint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          unint64_t v15 = (_OWORD *)(v14 + 16 * v3);
          unint64_t v16 = (_OWORD *)(v14 + 16 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            _OWORD *v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *unint64_t v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_25E87C800(int64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25E885B38();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = MEMORY[0x270FA5388](v4);
  unint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(void *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    uint64_t v11 = ~v9;
    uint64_t v38 = a2 + 64;
    unint64_t result = sub_25E885A08();
    uint64_t v12 = v38;
    if ((*(void *)(v38 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      unint64_t v36 = (result + 1) & v11;
      uint64_t v14 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      uint64_t v13 = v5 + 16;
      int64_t v35 = v14;
      uint64_t v15 = *(void *)(v13 + 56);
      uint64_t v37 = v13;
      unint64_t v16 = (uint64_t (**)(char *, uint64_t))(v13 - 8);
      do
      {
        int64_t v17 = v15 * v10;
        v35(v8, *(void *)(a2 + 48) + v15 * v10, v4);
        uint64_t v18 = sub_25E885568();
        unint64_t result = (*v16)(v8, v4);
        unint64_t v19 = v18 & v11;
        if (a1 >= (uint64_t)v36)
        {
          if (v19 >= v36 && a1 >= (uint64_t)v19)
          {
LABEL_17:
            uint64_t v22 = *(void *)(a2 + 48);
            unint64_t result = v22 + v15 * a1;
            unint64_t v23 = v22 + v17 + v15;
            if (v15 * a1 < v17 || result >= v23)
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
            }
            else if (v15 * a1 != v17)
            {
              unint64_t result = swift_arrayInitWithTakeBackToFront();
            }
            uint64_t v25 = *(void *)(a2 + 56);
            uint64_t v26 = (_OWORD *)(v25 + 32 * a1);
            unint64_t v27 = (_OWORD *)(v25 + 32 * v10);
            uint64_t v12 = v38;
            if (a1 != v10 || (a1 = v10, v26 >= v27 + 2))
            {
              long long v28 = v27[1];
              *uint64_t v26 = *v27;
              v26[1] = v28;
              a1 = v10;
            }
            goto LABEL_5;
          }
        }
        else if (v19 >= v36 || a1 >= (uint64_t)v19)
        {
          goto LABEL_17;
        }
        uint64_t v12 = v38;
LABEL_5:
        unint64_t v10 = (v10 + 1) & v11;
      }
      while (((*(void *)(v12 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    char v29 = (uint64_t *)(v12 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v30 = *v29;
    uint64_t v31 = (-1 << a1) - 1;
  }
  else
  {
    char v29 = (uint64_t *)(a2 + 64 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v31 = *v29;
    uint64_t v30 = (-1 << a1) - 1;
  }
  *char v29 = v31 & v30;
  uint64_t v32 = *(void *)(a2 + 16);
  BOOL v33 = __OFSUB__(v32, 1);
  uint64_t v34 = v32 - 1;
  if (v33)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v34;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_25E87CAB8(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    unint64_t result = sub_25E885A08();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_25E885E28();
        swift_bridgeObjectRetain();
        sub_25E885648();
        uint64_t v11 = sub_25E885E58();
        unint64_t result = swift_bridgeObjectRelease();
        unint64_t v12 = v11 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v12 < v8) {
            goto LABEL_5;
          }
        }
        else if (v12 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v12)
        {
LABEL_11:
          uint64_t v13 = *(void *)(a2 + 48);
          uint64_t v14 = (_OWORD *)(v13 + 16 * v3);
          uint64_t v15 = (_OWORD *)(v13 + 16 * v6);
          if (v3 != v6 || v14 >= v15 + 1) {
            _OWORD *v14 = *v15;
          }
          uint64_t v16 = *(void *)(a2 + 56);
          unint64_t v17 = v16 + 40 * v3;
          uint64_t v18 = (long long *)(v16 + 40 * v6);
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
    unint64_t v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v20 = *v19;
    uint64_t v21 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v21 = *v19;
    uint64_t v20 = (-1 << result) - 1;
  }
  *unint64_t v19 = v21 & v20;
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

unint64_t sub_25E87CCA4(int64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25E885388();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = MEMORY[0x270FA5388](v4);
  unint64_t v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(void *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    uint64_t v11 = ~v9;
    uint64_t v41 = a2 + 64;
    unint64_t result = sub_25E885A08();
    uint64_t v12 = v41;
    if ((*(void *)(v41 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      unint64_t v39 = (result + 1) & v11;
      uint64_t v14 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      uint64_t v13 = v5 + 16;
      uint64_t v38 = v14;
      uint64_t v15 = *(void *)(v13 + 56);
      uint64_t v40 = v13;
      uint64_t v16 = (uint64_t (**)(char *, uint64_t))(v13 - 8);
      do
      {
        int64_t v17 = v15 * v10;
        v38(v8, *(void *)(a2 + 48) + v15 * v10, v4);
        sub_25E87EDE4();
        uint64_t v18 = sub_25E885568();
        unint64_t result = (*v16)(v8, v4);
        unint64_t v19 = v18 & v11;
        if (a1 >= (uint64_t)v39)
        {
          if (v19 < v39 || a1 < (uint64_t)v19) {
            goto LABEL_6;
          }
        }
        else if (v19 < v39 && a1 < (uint64_t)v19)
        {
          goto LABEL_6;
        }
        uint64_t v22 = *(void *)(a2 + 48);
        unint64_t v23 = v22 + v15 * a1;
        unint64_t v24 = v22 + v17 + v15;
        if (v15 * a1 < v17 || v23 >= v24)
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else if (v15 * a1 != v17)
        {
          swift_arrayInitWithTakeBackToFront();
        }
        uint64_t v26 = *(void *)(a2 + 56);
        uint64_t v27 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B38FBB0) - 8) + 72);
        int64_t v28 = v27 * a1;
        unint64_t result = v26 + v27 * a1;
        int64_t v29 = v27 * v10;
        unint64_t v30 = v26 + v27 * v10 + v27;
        if (v28 < v29 || result >= v30)
        {
          unint64_t result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          a1 = v10;
          if (v28 == v29) {
            goto LABEL_6;
          }
          unint64_t result = swift_arrayInitWithTakeBackToFront();
        }
        a1 = v10;
LABEL_6:
        unint64_t v10 = (v10 + 1) & v11;
        uint64_t v12 = v41;
      }
      while (((*(void *)(v41 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    uint64_t v32 = (uint64_t *)(v12 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v33 = *v32;
    uint64_t v34 = (-1 << a1) - 1;
  }
  else
  {
    uint64_t v32 = (uint64_t *)(a2 + 64 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v34 = *v32;
    uint64_t v33 = (-1 << a1) - 1;
  }
  *uint64_t v32 = v34 & v33;
  uint64_t v35 = *(void *)(a2 + 16);
  BOOL v36 = __OFSUB__(v35, 1);
  uint64_t v37 = v35 - 1;
  if (v36)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v37;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_25E87CF98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  unint64_t v6 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_25E7DC4D4(a3, a4);
  uint64_t v15 = *(void *)(v12 + 16);
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v18 = v13;
  uint64_t v19 = *(void *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0) {
    goto LABEL_7;
  }
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_25E87D914();
LABEL_7:
    uint64_t v20 = (void *)*v6;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = (void *)(v20[7] + 16 * v14);
      uint64_t result = swift_bridgeObjectRelease();
      void *v21 = a1;
      v21[1] = a2;
      return result;
    }
    goto LABEL_11;
  }
  sub_25E87A9E4(v17, a5 & 1);
  unint64_t v23 = sub_25E7DC4D4(a3, a4);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_17:
    uint64_t result = sub_25E885D98();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  uint64_t v20 = (void *)*v6;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  v20[(v14 >> 6) + 8] |= 1 << v14;
  uint64_t v25 = (uint64_t *)(v20[6] + 16 * v14);
  *uint64_t v25 = a3;
  v25[1] = a4;
  uint64_t v26 = (void *)(v20[7] + 16 * v14);
  *uint64_t v26 = a1;
  v26[1] = a2;
  uint64_t v27 = v20[2];
  BOOL v28 = __OFADD__(v27, 1);
  uint64_t v29 = v27 + 1;
  if (v28)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v20[2] = v29;
  return swift_bridgeObjectRetain();
}

uint64_t sub_25E87D120(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A709208);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25E87D180(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  unint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_25E7DC4D4(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_25E87DAD0();
      goto LABEL_7;
    }
    sub_25E87AD0C(v15, a4 & 1);
    unint64_t v22 = sub_25E7DC4D4(a2, a3);
    if ((v16 & 1) == (v23 & 1))
    {
      unint64_t v12 = v22;
      char v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_25E885D98();
    __break(1u);
    return result;
  }
LABEL_7:
  char v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = v18[7];
    uint64_t v20 = v19 + *(void *)(*(void *)(type metadata accessor for UTSEndpoint() - 8) + 72) * v12;
    return sub_25E87DD3C(a1, v20);
  }
LABEL_13:
  sub_25E87D6C4(v12, a2, a3, a1, v18);
  return swift_bridgeObjectRetain();
}

_OWORD *sub_25E87D2E4(_OWORD *a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = sub_25E885B38();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  char v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v12 = (void *)*v3;
  unint64_t v14 = sub_25E85C77C(a2);
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
  if (v19 < v17 || (a3 & 1) == 0)
  {
    if (v19 >= v17 && (a3 & 1) == 0)
    {
      sub_25E87DDA0();
      goto LABEL_7;
    }
    sub_25E87B0B0(v17, a3 & 1);
    unint64_t v23 = sub_25E85C77C(a2);
    if ((v18 & 1) == (v24 & 1))
    {
      unint64_t v14 = v23;
      uint64_t v20 = *v4;
      if (v18) {
        goto LABEL_8;
      }
LABEL_13:
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
      return sub_25E87D75C(v14, (uint64_t)v11, a1, v20);
    }
LABEL_15:
    uint64_t result = (_OWORD *)sub_25E885D98();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v20 = *v4;
  if ((v18 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v21 = (_OWORD *)(v20[7] + 32 * v14);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
  return sub_25E7DC9E8(a1, v21);
}

uint64_t sub_25E87D4BC(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = sub_25E885388();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  char v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v12 = (void *)*v3;
  unint64_t v14 = sub_25E85C8AC(a2);
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
  if (v19 < v17 || (a3 & 1) == 0)
  {
    if (v19 >= v17 && (a3 & 1) == 0)
    {
      sub_25E87E234();
      goto LABEL_7;
    }
    sub_25E87B7D4(v17, a3 & 1);
    unint64_t v28 = sub_25E85C8AC(a2);
    if ((v18 & 1) == (v29 & 1))
    {
      unint64_t v14 = v28;
      uint64_t v20 = *v4;
      if (v18) {
        goto LABEL_8;
      }
LABEL_13:
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
      return sub_25E87D81C(v14, (uint64_t)v11, a1, v20);
    }
LABEL_15:
    uint64_t result = sub_25E885D98();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v20 = *v4;
  if ((v18 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v21 = v20[7];
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B38FBB0);
  uint64_t v23 = *(void *)(v22 - 8);
  char v24 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v23 + 40);
  uint64_t v25 = v22;
  uint64_t v26 = v21 + *(void *)(v23 + 72) * v14;
  return v24(v26, a1, v25);
}

uint64_t sub_25E87D6C4(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = (void *)(a5[6] + 16 * a1);
  *uint64_t v8 = a2;
  v8[1] = a3;
  uint64_t v9 = a5[7];
  uint64_t v10 = type metadata accessor for UTSEndpoint();
  uint64_t result = sub_25E7E4140(a4, v9 + *(void *)(*(void *)(v10 - 8) + 72) * a1);
  uint64_t v12 = a5[2];
  BOOL v13 = __OFADD__(v12, 1);
  uint64_t v14 = v12 + 1;
  if (v13) {
    __break(1u);
  }
  else {
    a5[2] = v14;
  }
  return result;
}

_OWORD *sub_25E87D75C(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_25E885B38();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  uint64_t result = sub_25E7DC9E8(a3, (_OWORD *)(a4[7] + 32 * a1));
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

uint64_t sub_25E87D81C(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_25E885388();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  uint64_t v10 = a4[7];
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B38FBB0);
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v10 + *(void *)(*(void *)(v11 - 8) + 72) * a1, a3, v11);
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

void *sub_25E87D914()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B390658);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25E885B78();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      int64_t v9 = v25 + 1;
      if (v25 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v6 + 8 * v9);
      if (!v26) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v26 - 1) & v26;
    unint64_t v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = (uint64_t *)(*(void *)(v2 + 56) + v16);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    uint64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v23 = v19;
    v23[1] = v18;
    char v24 = (void *)(*(void *)(v4 + 56) + v16);
    *char v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v27 = v25 + 2;
  if (v27 >= v13) {
    goto LABEL_26;
  }
  unint64_t v26 = *(void *)(v6 + 8 * v27);
  if (v26)
  {
    int64_t v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v9);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_25E87DAD0()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for UTSEndpoint();
  uint64_t v29 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A709FF8);
  uint64_t v5 = *v0;
  uint64_t v6 = sub_25E885B78();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_25:
    *uint64_t v1 = v7;
    return result;
  }
  int64_t v27 = v1;
  uint64_t result = (void *)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    uint64_t result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  uint64_t v28 = v5 + 64;
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
    int64_t v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v23 >= v14) {
      goto LABEL_23;
    }
    unint64_t v24 = *(void *)(v28 + 8 * v23);
    ++v10;
    if (!v24)
    {
      int64_t v10 = v23 + 1;
      if (v23 + 1 >= v14) {
        goto LABEL_23;
      }
      unint64_t v24 = *(void *)(v28 + 8 * v10);
      if (!v24) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_9:
    uint64_t v17 = 16 * v16;
    uint64_t v18 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v16);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    unint64_t v21 = *(void *)(v29 + 72) * v16;
    sub_25E8110BC(*(void *)(v5 + 56) + v21, (uint64_t)v4);
    uint64_t v22 = (void *)(*(void *)(v7 + 48) + v17);
    *uint64_t v22 = v19;
    v22[1] = v20;
    sub_25E7E4140((uint64_t)v4, *(void *)(v7 + 56) + v21);
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v14)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v27;
    goto LABEL_25;
  }
  unint64_t v24 = *(void *)(v28 + 8 * v25);
  if (v24)
  {
    int64_t v10 = v25;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_23;
    }
    unint64_t v24 = *(void *)(v28 + 8 * v10);
    ++v25;
    if (v24) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_25E87DD3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UTSEndpoint();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void *sub_25E87DDA0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25E885B38();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A70A008);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_25E885B78();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_25:
    *uint64_t v1 = v8;
    return result;
  }
  uint64_t v22 = v1;
  uint64_t result = (void *)(v7 + 64);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 64 + 8 * v10) {
    uint64_t result = memmove(result, (const void *)(v6 + 64), 8 * v10);
  }
  uint64_t v23 = v6 + 64;
  int64_t v11 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v6 + 64);
  int64_t v24 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v25 = v3 + 16;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v19 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v19 >= v24) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v23 + 8 * v19);
    ++v11;
    if (!v20)
    {
      int64_t v11 = v19 + 1;
      if (v19 + 1 >= v24) {
        goto LABEL_23;
      }
      unint64_t v20 = *(void *)(v23 + 8 * v11);
      if (!v20) {
        break;
      }
    }
LABEL_22:
    unint64_t v14 = (v20 - 1) & v20;
    unint64_t v16 = __clz(__rbit64(v20)) + (v11 << 6);
LABEL_9:
    unint64_t v17 = *(void *)(v3 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(v6 + 48) + v17, v2);
    uint64_t v18 = 32 * v16;
    sub_25E7DC630(*(void *)(v6 + 56) + v18, (uint64_t)v26);
    (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v8 + 48) + v17, v5, v2);
    uint64_t result = sub_25E7DC9E8(v26, (_OWORD *)(*(void *)(v8 + 56) + v18));
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v24)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v22;
    goto LABEL_25;
  }
  unint64_t v20 = *(void *)(v23 + 8 * v21);
  if (v20)
  {
    int64_t v11 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v11 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v11 >= v24) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v23 + 8 * v11);
    ++v21;
    if (v20) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_25E87E048()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A70A000);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25E885B78();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v25 = v1;
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 40 * v15;
    sub_25E7E0E28(*(void *)(v2 + 56) + 40 * v15, (uint64_t)v26);
    int64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = v19;
    v21[1] = v18;
    sub_25E7FB98C(v26, *(void *)(v4 + 56) + v20);
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v25;
    goto LABEL_28;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_25E87E234()
{
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B38FBB0);
  uint64_t v45 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  uint64_t v41 = (char *)&v32 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_25E885388();
  uint64_t v44 = *(void *)(v40 - 8);
  MEMORY[0x270FA5388](v40);
  unint64_t v39 = (char *)&v32 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B38FBE0);
  uint64_t v32 = v0;
  uint64_t v3 = *v0;
  uint64_t v4 = sub_25E885B78();
  uint64_t v5 = *(void *)(v3 + 16);
  uint64_t v46 = v4;
  if (!v5)
  {
    uint64_t result = (void *)swift_release();
    uint64_t v31 = v46;
    uint64_t v30 = v32;
LABEL_25:
    *uint64_t v30 = v31;
    return result;
  }
  uint64_t v6 = v4;
  uint64_t result = (void *)(v4 + 64);
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v6 + 32)) + 63) >> 6;
  if (v6 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
  {
    uint64_t result = memmove(result, (const void *)(v3 + 64), 8 * v8);
    uint64_t v6 = v46;
  }
  int64_t v9 = 0;
  *(void *)(v6 + 16) = *(void *)(v3 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v11 = -1;
  uint64_t v43 = v3;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v3 + 64);
  uint64_t v33 = v3 + 64;
  int64_t v34 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v13 = v45;
  uint64_t v14 = v44;
  uint64_t v37 = v45 + 16;
  uint64_t v38 = v44 + 16;
  uint64_t v35 = v45 + 32;
  uint64_t v36 = v44 + 32;
  unint64_t v15 = v39;
  uint64_t v16 = v40;
  uint64_t v17 = v42;
  uint64_t v18 = v46;
  while (1)
  {
    if (v12)
    {
      unint64_t v19 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      int64_t v47 = v9;
      unint64_t v20 = v19 | (v9 << 6);
      uint64_t v21 = v43;
      goto LABEL_9;
    }
    int64_t v26 = v9 + 1;
    uint64_t v21 = v43;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v26 >= v34) {
      goto LABEL_23;
    }
    unint64_t v27 = *(void *)(v33 + 8 * v26);
    int64_t v28 = v9 + 1;
    if (!v27)
    {
      int64_t v28 = v26 + 1;
      if (v26 + 1 >= v34) {
        goto LABEL_23;
      }
      unint64_t v27 = *(void *)(v33 + 8 * v28);
      if (!v27) {
        break;
      }
    }
LABEL_22:
    unint64_t v12 = (v27 - 1) & v27;
    int64_t v47 = v28;
    unint64_t v20 = __clz(__rbit64(v27)) + (v28 << 6);
LABEL_9:
    unint64_t v22 = *(void *)(v14 + 72) * v20;
    (*(void (**)(char *, unint64_t, uint64_t))(v14 + 16))(v15, *(void *)(v21 + 48) + v22, v16);
    unint64_t v23 = *(void *)(v13 + 72) * v20;
    unint64_t v24 = *(void *)(v21 + 56) + v23;
    uint64_t v25 = v41;
    (*(void (**)(char *, unint64_t, uint64_t))(v13 + 16))(v41, v24, v17);
    (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(*(void *)(v18 + 48) + v22, v15, v16);
    uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v13 + 32))(*(void *)(v18 + 56) + v23, v25, v17);
    int64_t v9 = v47;
  }
  int64_t v29 = v26 + 2;
  if (v29 >= v34)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    uint64_t v30 = v32;
    uint64_t v31 = v46;
    goto LABEL_25;
  }
  unint64_t v27 = *(void *)(v33 + 8 * v29);
  if (v27)
  {
    int64_t v28 = v29;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v28 = v29 + 1;
    if (__OFADD__(v29, 1)) {
      break;
    }
    if (v28 >= v34) {
      goto LABEL_23;
    }
    unint64_t v27 = *(void *)(v33 + 8 * v28);
    ++v29;
    if (v27) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_25E87E5E0()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A708CB8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25E885B78();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_25E87E798(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A709C88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t *sub_25E87E800(uint64_t *a1)
{
  return a1;
}

void *sub_25E87E85C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B390BA8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25E885B78();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v25 = v1;
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    sub_25E7DC630(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = v19;
    v21[1] = v18;
    sub_25E7DC9E8(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v25;
    goto LABEL_28;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_25E87EA44()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A708CB0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25E885B78();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = *v16;
    uint64_t v17 = v16[1];
    LOBYTE(v16) = *(unsigned char *)(*(void *)(v2 + 56) + v15);
    uint64_t v19 = (void *)(*(void *)(v4 + 48) + 16 * v15);
    *uint64_t v19 = v18;
    v19[1] = v17;
    *(unsigned char *)(*(void *)(v4 + 56) + v15) = (_BYTE)v16;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_25E87EBF0()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A709C98);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25E885B78();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v25 = v1;
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 136 * v15;
    sub_25E87E798(*(void *)(v2 + 56) + 136 * v15, (uint64_t)v26);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = v19;
    v21[1] = v18;
    sub_25E87E798((uint64_t)v26, *(void *)(v4 + 56) + v20);
    swift_bridgeObjectRetain();
    uint64_t result = sub_25E87E800(v26);
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v25;
    goto LABEL_28;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

unint64_t sub_25E87EDE4()
{
  unint64_t result = qword_26B38FB18;
  if (!qword_26B38FB18)
  {
    sub_25E885388();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B38FB18);
  }
  return result;
}

uint64_t sub_25E87EE3C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_25E87EE50(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_25E87EE64(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_25E87EE78(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_25E87EE8C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t sub_25E87EEA0()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for UTSConfigurationResponse()
{
  return self;
}

uint64_t sub_25E87EEFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v5 + 72) = a3;
  *(void *)(v5 + 80) = a4;
  *(void *)(v5 + 56) = a1;
  *(void *)(v5 + 64) = a2;
  *(void *)(v5 + 88) = __swift_instantiateConcreteTypeFromMangledName(&qword_26B38F780);
  *(void *)(v5 + 96) = swift_task_alloc();
  *(void *)(v5 + 104) = _s5CacheV5ValueOMa(0);
  uint64_t v6 = swift_task_alloc();
  *(unsigned char *)(v5 + 144) = *(unsigned char *)v4;
  *(unsigned char *)(v5 + 145) = *(unsigned char *)(v4 + 1);
  uint64_t v7 = *(void *)(v4 + 8);
  *(void *)(v5 + 112) = v6;
  *(void *)(v5 + 120) = v7;
  *(unsigned char *)(v5 + 146) = *(unsigned char *)(v4 + 16);
  return MEMORY[0x270FA2498](sub_25E87EFE4, 0, 0);
}

uint64_t sub_25E87EFE4()
{
  uint64_t v1 = *(void *)(v0 + 120);
  char v2 = *(unsigned char *)(v0 + 145);
  char v3 = *(unsigned char *)(v0 + 144);
  *(void *)(v0 + 40) = &_s9FavoritesO6ActionVN;
  *(void *)(v0 + 48) = &off_270B64900;
  *(unsigned char *)(v0 + 16) = v3;
  *(unsigned char *)(v0 + 17) = v2;
  *(void *)(v0 + 24) = v1;
  unsigned __int8 v4 = *(unsigned char *)(v0 + 146);
  *(unsigned char *)(v0 + 32) = v4;
  sub_25E884AC0(v1, v4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 128) = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_25E87F0C0;
  uint64_t v6 = *(void *)(v0 + 112);
  uint64_t v7 = *(void *)(v0 + 72);
  uint64_t v8 = *(void *)(v0 + 80);
  uint64_t v9 = *(void *)(v0 + 64);
  return sub_25E86C130(v6, v0 + 16, v9, v7, v8);
}

uint64_t sub_25E87F0C0()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 136) = v0;
  swift_task_dealloc();
  if (v0)
  {
    char v3 = sub_25E86F704;
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1(v2 + 16);
    char v3 = sub_25E87F1DC;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_25E87F1DC()
{
  int v1 = *(unsigned __int8 *)(v0 + 145);
  uint64_t v2 = *(void *)(v0 + 112);
  char v3 = *(unsigned char **)(v0 + 96);
  uint64_t v4 = (uint64_t)&v3[*(int *)(*(void *)(v0 + 88) + 48)];
  unsigned char *v3 = v1;
  sub_25E7E01B0(v2, v4, _s5CacheV5ValueOMa);
  if (v1 == 1 && swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = *(void *)(v0 + 56);
    sub_25E7CEB40(*(void *)(v0 + 112), _s5CacheV5ValueOMa);
    sub_25E7CF28C(v4, v5, (uint64_t (*)(void))type metadata accessor for SportsFavoriteService.Favorites.State);
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    uint64_t v7 = *(void *)(v0 + 112);
    uint64_t v8 = *(void *)(v0 + 96);
    sub_25E872364();
    swift_allocError();
    swift_willThrow();
    sub_25E7CEB40(v7, _s5CacheV5ValueOMa);
    sub_25E7DC68C(v8, &qword_26B38F780);
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v6();
}

uint64_t SportsFavoriteService.Favorites.Favorite.Type.init(rawValue:)@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_25E885BC8();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

uint64_t SportsFavoriteService.Favorites.Favorite.Type.rawValue.getter()
{
  if (*v0) {
    return 0x65756761656CLL;
  }
  else {
    return 1835099508;
  }
}

uint64_t sub_25E87F404(char *a1, char *a2)
{
  return sub_25E86E78C(*a1, *a2);
}

uint64_t sub_25E87F410()
{
  return sub_25E885E58();
}

uint64_t sub_25E87F488()
{
  sub_25E885648();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25E87F4EC()
{
  return sub_25E885E58();
}

uint64_t sub_25E87F560@<X0>(char *a1@<X8>)
{
  return SportsFavoriteService.Favorites.Favorite.Type.init(rawValue:)(a1);
}

void sub_25E87F56C(uint64_t *a1@<X8>)
{
  uint64_t v2 = 1835099508;
  if (*v1) {
    uint64_t v2 = 0x65756761656CLL;
  }
  unint64_t v3 = 0xE400000000000000;
  if (*v1) {
    unint64_t v3 = 0xE600000000000000;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_25E87F5A0()
{
  return sub_25E885748();
}

uint64_t sub_25E87F600()
{
  return sub_25E885738();
}

uint64_t SportsFavoriteService.Favorites.Favorite.id.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

void SportsFavoriteService.Favorites.Favorite.type.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 16);
}

uint64_t SportsFavoriteService.Favorites.Favorite.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_25E885648();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25E87F6E8(uint64_t a1)
{
  unint64_t v2 = sub_25E8839C8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25E87F724(uint64_t a1)
{
  unint64_t v2 = sub_25E8839C8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SportsFavoriteService.Favorites.Favorite.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A70A010);
  uint64_t v9 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v10 = *(unsigned __int8 *)(v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E8839C8();
  sub_25E885E88();
  char v13 = 0;
  sub_25E885CA8();
  if (!v2)
  {
    char v12 = v10;
    char v11 = 1;
    sub_25E883A1C();
    sub_25E885CE8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v6, v4);
}

uint64_t SportsFavoriteService.Favorites.Favorite.hashValue.getter()
{
  return sub_25E885E58();
}

uint64_t SportsFavoriteService.Favorites.Favorite.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A70A028);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E8839C8();
  sub_25E885E78();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  char v17 = 0;
  uint64_t v9 = sub_25E885C28();
  uint64_t v11 = v10;
  char v15 = 1;
  sub_25E883A70();
  swift_bridgeObjectRetain();
  sub_25E885C68();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  char v12 = v16;
  *(void *)a2 = v9;
  *(void *)(a2 + 8) = v11;
  *(unsigned char *)(a2 + 16) = v12;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25E87FB48@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return SportsFavoriteService.Favorites.Favorite.init(from:)(a1, a2);
}

uint64_t sub_25E87FB60(void *a1)
{
  return SportsFavoriteService.Favorites.Favorite.encode(to:)(a1);
}

uint64_t sub_25E87FB78()
{
  return sub_25E885E58();
}

uint64_t sub_25E87FBD4()
{
  swift_bridgeObjectRetain();
  sub_25E885648();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25E87FC2C()
{
  return sub_25E885E58();
}

uint64_t sub_25E87FC88()
{
  uint64_t v1 = *(void *)v0;
  char v2 = v0[8];
  int64_t v3 = *(void *)(*(void *)v0 + 16);
  uint64_t v4 = MEMORY[0x263F8EE78];
  if (v2)
  {
    if (v3)
    {
      uint64_t v19 = MEMORY[0x263F8EE78];
      sub_25E869798(0, v3, 0);
      uint64_t v4 = v19;
      uint64_t v5 = (uint64_t *)(v1 + 40);
      do
      {
        uint64_t v7 = *(v5 - 1);
        uint64_t v6 = *v5;
        unint64_t v8 = *(void *)(v19 + 16);
        unint64_t v9 = *(void *)(v19 + 24);
        swift_bridgeObjectRetain();
        if (v8 >= v9 >> 1) {
          sub_25E869798(v9 > 1, v8 + 1, 1);
        }
        v5 += 2;
        *(void *)(v19 + 16) = v8 + 1;
        unint64_t v10 = v19 + 24 * v8;
        *(void *)(v10 + 32) = v7;
        *(void *)(v10 + 40) = v6;
        *(unsigned char *)(v10 + 48) = 1;
        --v3;
      }
      while (v3);
    }
  }
  else if (v3)
  {
    uint64_t v20 = MEMORY[0x263F8EE78];
    sub_25E869798(0, v3, 0);
    uint64_t v4 = v20;
    uint64_t v11 = (uint64_t *)(v1 + 40);
    do
    {
      uint64_t v13 = *(v11 - 1);
      uint64_t v12 = *v11;
      unint64_t v14 = *(void *)(v20 + 16);
      unint64_t v15 = *(void *)(v20 + 24);
      swift_bridgeObjectRetain();
      if (v14 >= v15 >> 1) {
        sub_25E869798(v15 > 1, v14 + 1, 1);
      }
      v11 += 2;
      *(void *)(v20 + 16) = v14 + 1;
      unint64_t v16 = v20 + 24 * v14;
      *(void *)(v16 + 32) = v13;
      *(void *)(v16 + 40) = v12;
      *(unsigned char *)(v16 + 48) = 0;
      --v3;
    }
    while (v3);
  }
  uint64_t v17 = sub_25E82C118(v4);
  swift_bridgeObjectRelease();
  return v17;
}

uint64_t static SportsFavoriteService.Favorites.Modification.FailureReason.== infix(_:_:)()
{
  return 1;
}

uint64_t SportsFavoriteService.Favorites.Modification.FailureReason.hash(into:)()
{
  return sub_25E885E38();
}

uint64_t SportsFavoriteService.Favorites.Modification.FailureReason.hashValue.getter()
{
  return sub_25E885E58();
}

uint64_t SportsFavoriteService.Favorites.State.favorites.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SportsFavoriteService.Favorites.State.lastModifiedDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for SportsFavoriteService.Favorites.State();
  return sub_25E7DF8D0(v1 + *(int *)(v3 + 20), a1, &qword_26B390808);
}

uint64_t sub_25E87FECC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v25 = a2;
  uint64_t v5 = type metadata accessor for SportsFavoriteService.Favorites.State();
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (uint64_t *)((char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B390808);
  MEMORY[0x270FA5388](v8 - 8);
  unint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11)
  {
    swift_bridgeObjectRetain();
    uint64_t v12 = (unsigned char *)(a1 + 40);
    uint64_t v13 = MEMORY[0x263F8EE88];
    do
    {
      uint64_t v14 = *((void *)v12 - 1);
      char v15 = *v12;
      v12 += 16;
      uint64_t v26 = v14;
      char v27 = v15;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v16 = sub_25E87FC88();
      uint64_t v13 = sub_25E880158(v16, v13);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      --v11;
    }
    while (v11);
    swift_bridgeObjectRelease();
    if (*(void *)(v13 + 16)) {
      goto LABEL_5;
    }
  }
  else
  {
    uint64_t v13 = MEMORY[0x263F8EE88];
    if (*(void *)(MEMORY[0x263F8EE88] + 16))
    {
LABEL_5:
      uint64_t v17 = *v3;
      swift_bridgeObjectRetain();
      uint64_t v18 = sub_25E880158(v13, v17);
      sub_25E885348();
      uint64_t v19 = sub_25E885368();
      uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56);
      v20(v10, 0, 1, v19);
      char v21 = *((unsigned char *)v3 + *(int *)(v5 + 24));
      uint64_t v22 = (uint64_t)v7 + *(int *)(v5 + 20);
      v20((char *)v22, 1, 1, v19);
      *uint64_t v7 = v18;
      sub_25E7CEAD8((uint64_t)v10, v22);
      *((unsigned char *)v7 + *(int *)(v5 + 24)) = v21;
      return sub_25E7CF28C((uint64_t)v7, v25, (uint64_t (*)(void))type metadata accessor for SportsFavoriteService.Favorites.State);
    }
  }
  sub_25E7E01B0((uint64_t)v3, v25, (uint64_t (*)(void))type metadata accessor for SportsFavoriteService.Favorites.State);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25E880158(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result;
  int64_t v3 = 0;
  uint64_t v5 = result + 56;
  uint64_t v4 = *(void *)(result + 56);
  uint64_t v20 = a2;
  uint64_t v6 = 1 << *(unsigned char *)(result + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & v4;
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  while (1)
  {
    if (v8)
    {
      unint64_t v10 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v11 = v10 | (v3 << 6);
      goto LABEL_5;
    }
    int64_t v16 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v16 >= v9) {
      goto LABEL_23;
    }
    unint64_t v17 = *(void *)(v5 + 8 * v16);
    ++v3;
    if (!v17)
    {
      int64_t v3 = v16 + 1;
      if (v16 + 1 >= v9) {
        goto LABEL_23;
      }
      unint64_t v17 = *(void *)(v5 + 8 * v3);
      if (!v17)
      {
        int64_t v3 = v16 + 2;
        if (v16 + 2 >= v9) {
          goto LABEL_23;
        }
        unint64_t v17 = *(void *)(v5 + 8 * v3);
        if (!v17)
        {
          int64_t v3 = v16 + 3;
          if (v16 + 3 >= v9) {
            goto LABEL_23;
          }
          unint64_t v17 = *(void *)(v5 + 8 * v3);
          if (!v17) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v11 = __clz(__rbit64(v17)) + (v3 << 6);
LABEL_5:
    uint64_t v12 = *(void *)(v2 + 48) + 24 * v11;
    uint64_t v13 = *(void *)v12;
    uint64_t v14 = *(void *)(v12 + 8);
    char v15 = *(unsigned char *)(v12 + 16);
    swift_bridgeObjectRetain();
    sub_25E83C21C((uint64_t)&v19, v13, v14, v15);
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v18 = v16 + 4;
  if (v18 >= v9)
  {
LABEL_23:
    swift_release();
    return v20;
  }
  unint64_t v17 = *(void *)(v5 + 8 * v18);
  if (v17)
  {
    int64_t v3 = v18;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v3 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v3 >= v9) {
      goto LABEL_23;
    }
    unint64_t v17 = *(void *)(v5 + 8 * v3);
    ++v18;
    if (v17) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_25E8802EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for SportsFavoriteService.Favorites.State();
  MEMORY[0x270FA5388](v6);
  unint64_t v8 = (uint64_t *)((char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B390808);
  MEMORY[0x270FA5388](v9 - 8);
  unint64_t v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(void *)(a1 + 16);
  if (v12)
  {
    uint64_t v26 = v2;
    uint64_t v27 = a2;
    swift_bridgeObjectRetain();
    uint64_t v13 = (unsigned char *)(a1 + 40);
    uint64_t v14 = MEMORY[0x263F8EE88];
    do
    {
      uint64_t v15 = *((void *)v13 - 1);
      char v16 = *v13;
      v13 += 16;
      uint64_t v28 = v15;
      char v29 = v16;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v17 = sub_25E87FC88();
      uint64_t v14 = sub_25E880158(v17, v14);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      --v12;
    }
    while (v12);
    swift_bridgeObjectRelease();
    uint64_t v3 = v26;
    a2 = v27;
    unint64_t v18 = *(void *)(v14 + 16);
    if (v18)
    {
LABEL_5:
      uint64_t v19 = *(void *)v3;
      if (v18 <= *(void *)(*(void *)v3 + 16) >> 3)
      {
        uint64_t v28 = *(void *)v3;
        swift_bridgeObjectRetain();
        sub_25E882D38(v14);
        swift_bridgeObjectRelease();
        uint64_t v20 = v28;
      }
      else
      {
        swift_bridgeObjectRetain();
        uint64_t v20 = sub_25E882F08(v14, v19);
        swift_bridgeObjectRelease();
      }
      sub_25E885348();
      uint64_t v22 = sub_25E885368();
      unint64_t v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56);
      v23(v11, 0, 1, v22);
      char v24 = *(unsigned char *)(v3 + *(int *)(v6 + 24));
      uint64_t v25 = (uint64_t)v8 + *(int *)(v6 + 20);
      v23((char *)v25, 1, 1, v22);
      *unint64_t v8 = v20;
      sub_25E7CEAD8((uint64_t)v11, v25);
      *((unsigned char *)v8 + *(int *)(v6 + 24)) = v24;
      return sub_25E7CF28C((uint64_t)v8, a2, (uint64_t (*)(void))type metadata accessor for SportsFavoriteService.Favorites.State);
    }
  }
  else
  {
    uint64_t v14 = MEMORY[0x263F8EE88];
    unint64_t v18 = *(void *)(MEMORY[0x263F8EE88] + 16);
    if (v18) {
      goto LABEL_5;
    }
  }
  sub_25E7E01B0(v3, a2, (uint64_t (*)(void))type metadata accessor for SportsFavoriteService.Favorites.State);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25E8805BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25E884910(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25E8805E4(uint64_t a1)
{
  unint64_t v2 = sub_25E7E04C4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25E880620(uint64_t a1)
{
  unint64_t v2 = sub_25E7E04C4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SportsFavoriteService.Favorites.State.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A70A038);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E7E04C4();
  sub_25E885E88();
  uint64_t v11 = *v3;
  v10[7] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3908F8);
  sub_25E7E0040(&qword_26A70A040, (void (*)(void))sub_25E883AC4);
  sub_25E885CE8();
  if (!v2)
  {
    type metadata accessor for SportsFavoriteService.Favorites.State();
    v10[6] = 1;
    sub_25E885368();
    sub_25E7CE610(&qword_26A709D58);
    sub_25E885C98();
    v10[5] = 2;
    sub_25E885CB8();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_25E880884(void *a1)
{
  return SportsFavoriteService.Favorites.State.encode(to:)(a1);
}

uint64_t sub_25E88089C()
{
  if (*(unsigned char *)(v0 + 16) || (*(unsigned char *)(v0 + 8) & 1) == 0) {
    return 0;
  }
  if (qword_26B38F7D0 != -1) {
    swift_once();
  }
  sub_25E885898();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B390A00);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_25E8868B0;
  *(void *)(v2 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_26B390B10);
  *(void *)(v2 + 64) = sub_25E884C84((unint64_t *)&qword_26B390B18);
  *(void *)(v2 + 32) = &unk_270B5E7B8;
  sub_25E885408();
  swift_bridgeObjectRelease();
  return 1;
}

uint64_t sub_25E8809B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v4 + 64) = a2;
  *(void *)(v4 + 72) = a3;
  *(void *)(v4 + 56) = a1;
  type metadata accessor for SportsFavoriteService.UserConsent.State();
  *(void *)(v4 + 80) = swift_task_alloc();
  *(void *)(v4 + 88) = _s5CacheV5ValueOMa(0);
  *(void *)(v4 + 96) = swift_task_alloc();
  *(void *)(v4 + 104) = swift_task_alloc();
  *(unsigned char *)(v4 + 128) = *(unsigned char *)(v3 + 16);
  return MEMORY[0x270FA2498](sub_25E880A90, 0, 0);
}

uint64_t sub_25E880A90()
{
  if (*(unsigned char *)(v0 + 128) == 1)
  {
    *(void *)(v0 + 40) = &_s11UserConsentO6ActionVN;
    *(void *)(v0 + 48) = &off_270B63FE8;
    *(_WORD *)(v0 + 16) = 0;
    *(void *)(v0 + 24) = 0;
    *(unsigned char *)(v0 + 32) = 0;
    uint64_t v1 = (void *)swift_task_alloc();
    *(void *)(v0 + 112) = v1;
    *uint64_t v1 = v0;
    v1[1] = sub_25E880BB0;
    uint64_t v2 = *(void *)(v0 + 104);
    uint64_t v3 = *(void *)(v0 + 64);
    uint64_t v4 = *(void *)(v0 + 72);
    uint64_t v5 = *(void *)(v0 + 56);
    return sub_25E86C130(v2, v0 + 16, v5, v3, v4);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
    return v7();
  }
}

uint64_t sub_25E880BB0()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 120) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = sub_25E880FEC;
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1(v2 + 16);
    uint64_t v3 = sub_25E880CCC;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_25E880CCC()
{
  sub_25E7E01B0(v0[13], v0[12], _s5CacheV5ValueOMa);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t v3 = v0[12];
  uint64_t v2 = v0[13];
  if (EnumCaseMultiPayload == 1)
  {
    sub_25E7F2D38();
    swift_allocError();
    *uint64_t v4 = 1;
    swift_willThrow();
    sub_25E7CEB40(v3, _s5CacheV5ValueOMa);
    sub_25E7CEB40(v2, _s5CacheV5ValueOMa);
  }
  else
  {
    uint64_t v5 = (unsigned __int8 *)v0[10];
    sub_25E7CF28C(v0[12], (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for SportsFavoriteService.UserConsent.State);
    sub_25E7CEB40(v2, _s5CacheV5ValueOMa);
    unsigned int v6 = *v5;
    sub_25E7CEB40((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for SportsFavoriteService.UserConsent.State);
    if (v6 > 1)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v7 = sub_25E885D48();
      swift_bridgeObjectRelease();
      if ((v7 & 1) == 0)
      {
        if (qword_26B38F7D0 != -1) {
          swift_once();
        }
        sub_25E8858B8();
        __swift_instantiateConcreteTypeFromMangledName(&qword_26B390A00);
        uint64_t v8 = swift_allocObject();
        *(_OWORD *)(v8 + 16) = xmmword_25E8868B0;
        *(void *)(v8 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_26B390B10);
        *(void *)(v8 + 64) = sub_25E884C84((unint64_t *)&qword_26B390B18);
        *(void *)(v8 + 32) = &unk_270B5E7E8;
        sub_25E885408();
        swift_bridgeObjectRelease();
        sub_25E884CCC();
        swift_allocError();
        swift_willThrow();
      }
    }
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_25E880FEC()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25E881074()
{
  *(void *)(v1 + 16) = *(void *)(v0 + 8);
  *(unsigned char *)(v1 + 152) = *(unsigned char *)(v0 + 16);
  return MEMORY[0x270FA2498](sub_25E8810A0, 0, 0);
}

uint64_t sub_25E8810A0()
{
  uint64_t v37 = v0;
  if (*(unsigned char *)(v0 + 152))
  {
    if (*(unsigned char *)(v0 + 152) == 1)
    {
      uint64_t v1 = *(void *)(v0 + 16);
      uint64_t v2 = swift_bridgeObjectRetain();
      uint64_t v3 = sub_25E882124(v2);
      swift_bridgeObjectRelease();
      uint64_t v4 = *(void *)(v3 + 16);
      swift_bridgeObjectRelease();
      if (v4)
      {
        uint64_t v5 = sub_25E882124(v1);
        *(void *)(v0 + 24) = v5;
        swift_bridgeObjectRelease();
        if (qword_26B3905C0 != -1) {
          swift_once();
        }
        uint64_t v35 = v5;
        char v36 = 1;
        swift_bridgeObjectRetain();
        unsigned int v6 = sub_25E7F987C((uint64_t)&v35);
        *(void *)(v0 + 32) = v6;
        uint64_t v29 = (uint64_t)v6;
        int64_t v34 = (uint64_t (*)(uint64_t))((char *)&dword_26A708B98 + dword_26A708B98);
        uint64_t v30 = (void *)swift_task_alloc();
        *(void *)(v0 + 40) = v30;
        *uint64_t v30 = v0;
        uint64_t v31 = sub_25E8815B8;
LABEL_26:
        v30[1] = v31;
        return v34(v29);
      }
      sub_25E882124(*(void *)(v0 + 16));
      uint64_t v14 = v13;
      swift_bridgeObjectRelease();
      uint64_t v15 = *(void *)(v14 + 16);
      swift_bridgeObjectRelease();
      uint64_t v16 = *(void *)(v0 + 16);
      if (v15)
      {
        sub_25E882124(*(void *)(v0 + 16));
        uint64_t v18 = v17;
        *(void *)(v0 + 56) = v17;
        sub_25E884AEC(v16, 1u);
        swift_bridgeObjectRelease();
        if (qword_26B3905C0 != -1) {
          swift_once();
        }
        uint64_t v35 = v18;
        char v36 = 2;
        swift_bridgeObjectRetain();
        uint64_t v19 = sub_25E7F987C((uint64_t)&v35);
        *(void *)(v0 + 64) = v19;
        uint64_t v29 = (uint64_t)v19;
        int64_t v34 = (uint64_t (*)(uint64_t))((char *)&dword_26A708B98 + dword_26A708B98);
        uint64_t v30 = (void *)swift_task_alloc();
        *(void *)(v0 + 72) = v30;
        *uint64_t v30 = v0;
        uint64_t v31 = sub_25E881948;
        goto LABEL_26;
      }
      uint64_t v32 = *(void *)(v0 + 16);
      unsigned __int8 v33 = 1;
    }
    else
    {
      uint64_t v7 = *(void *)(v0 + 16);
      uint64_t v8 = swift_bridgeObjectRetain();
      uint64_t v9 = sub_25E882124(v8);
      swift_bridgeObjectRelease();
      uint64_t v10 = *(void *)(v9 + 16);
      swift_bridgeObjectRelease();
      if (v10)
      {
        uint64_t v11 = sub_25E882124(v7);
        *(void *)(v0 + 88) = v11;
        swift_bridgeObjectRelease();
        if (qword_26B3905C0 != -1) {
          swift_once();
        }
        uint64_t v35 = v11;
        char v36 = 3;
        swift_bridgeObjectRetain();
        uint64_t v12 = sub_25E7F987C((uint64_t)&v35);
        *(void *)(v0 + 96) = v12;
        uint64_t v29 = (uint64_t)v12;
        int64_t v34 = (uint64_t (*)(uint64_t))((char *)&dword_26A708B98 + dword_26A708B98);
        uint64_t v30 = (void *)swift_task_alloc();
        *(void *)(v0 + 104) = v30;
        *uint64_t v30 = v0;
        uint64_t v31 = sub_25E881B6C;
        goto LABEL_26;
      }
      sub_25E882124(*(void *)(v0 + 16));
      uint64_t v21 = v20;
      swift_bridgeObjectRelease();
      uint64_t v22 = *(void *)(v21 + 16);
      swift_bridgeObjectRelease();
      uint64_t v23 = *(void *)(v0 + 16);
      if (v22)
      {
        sub_25E882124(*(void *)(v0 + 16));
        uint64_t v25 = v24;
        *(void *)(v0 + 120) = v24;
        sub_25E884AEC(v23, 2u);
        swift_bridgeObjectRelease();
        if (qword_26B3905C0 != -1) {
          swift_once();
        }
        uint64_t v35 = v25;
        char v36 = 4;
        swift_bridgeObjectRetain();
        uint64_t v26 = sub_25E7F987C((uint64_t)&v35);
        *(void *)(v0 + 128) = v26;
        uint64_t v29 = (uint64_t)v26;
        int64_t v34 = (uint64_t (*)(uint64_t))((char *)&dword_26A708B98 + dword_26A708B98);
        uint64_t v30 = (void *)swift_task_alloc();
        *(void *)(v0 + 136) = v30;
        *uint64_t v30 = v0;
        uint64_t v31 = sub_25E881F00;
        goto LABEL_26;
      }
      uint64_t v32 = *(void *)(v0 + 16);
      unsigned __int8 v33 = 2;
    }
    sub_25E884AEC(v32, v33);
    uint64_t v27 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    sub_25E872364();
    swift_allocError();
    swift_willThrow();
    uint64_t v27 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v27();
}

uint64_t sub_25E8815B8(uint64_t a1, unint64_t a2, void *a3, void *a4)
{
  *(void *)(*(void *)v5 + 48) = v4;
  swift_task_dealloc();
  if (v4)
  {
    uint64_t v10 = sub_25E8818D0;
  }
  else
  {
    sub_25E7DF934(a1, a2);
    swift_release();

    uint64_t v10 = sub_25E88170C;
  }
  return MEMORY[0x270FA2498](v10, 0, 0);
}

uint64_t sub_25E88170C()
{
  uint64_t v16 = v0;
  swift_bridgeObjectRelease();
  uint64_t v1 = v0[6];
  sub_25E882124(v0[2]);
  uint64_t v3 = v2;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(v3 + 16);
  swift_bridgeObjectRelease();
  uint64_t v5 = v0[2];
  if (!v4)
  {
    sub_25E884AEC(v0[2], 1u);
    uint64_t v9 = (uint64_t (*)(void))v0[1];
    goto LABEL_7;
  }
  sub_25E882124(v0[2]);
  uint64_t v7 = v6;
  v0[7] = v6;
  sub_25E884AEC(v5, 1u);
  swift_bridgeObjectRelease();
  if (qword_26B3905C0 != -1) {
    swift_once();
  }
  uint64_t v14 = v7;
  char v15 = 2;
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_25E7F987C((uint64_t)&v14);
  v0[8] = v8;
  if (v1)
  {
    swift_bridgeObjectRelease();
    uint64_t v9 = (uint64_t (*)(void))v0[1];
LABEL_7:
    return v9();
  }
  uint64_t v11 = (uint64_t)v8;
  uint64_t v13 = (uint64_t (*)(uint64_t))((char *)&dword_26A708B98 + dword_26A708B98);
  uint64_t v12 = (void *)swift_task_alloc();
  v0[9] = v12;
  *uint64_t v12 = v0;
  v12[1] = sub_25E881948;
  return v13(v11);
}

uint64_t sub_25E8818D0()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRelease();
  sub_25E884AEC(v1, 1u);
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_25E881948(uint64_t a1, unint64_t a2, void *a3, void *a4)
{
  *(void *)(*(void *)v5 + 80) = v4;
  swift_task_dealloc();
  if (v4)
  {
    uint64_t v10 = sub_25E881B00;
  }
  else
  {
    sub_25E7DF934(a1, a2);
    swift_release();

    uint64_t v10 = sub_25E881A9C;
  }
  return MEMORY[0x270FA2498](v10, 0, 0);
}

uint64_t sub_25E881A9C()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25E881B00()
{
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25E881B6C(uint64_t a1, unint64_t a2, void *a3, void *a4)
{
  *(void *)(*(void *)v5 + 112) = v4;
  swift_task_dealloc();
  if (v4)
  {
    uint64_t v10 = sub_25E881E84;
  }
  else
  {
    sub_25E7DF934(a1, a2);
    swift_release();

    uint64_t v10 = sub_25E881CC0;
  }
  return MEMORY[0x270FA2498](v10, 0, 0);
}

uint64_t sub_25E881CC0()
{
  uint64_t v16 = v0;
  swift_bridgeObjectRelease();
  uint64_t v1 = v0[14];
  sub_25E882124(v0[2]);
  uint64_t v3 = v2;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(v3 + 16);
  swift_bridgeObjectRelease();
  uint64_t v5 = v0[2];
  if (!v4)
  {
    sub_25E884AEC(v0[2], 2u);
    uint64_t v9 = (uint64_t (*)(void))v0[1];
    goto LABEL_7;
  }
  sub_25E882124(v0[2]);
  uint64_t v7 = v6;
  v0[15] = v6;
  sub_25E884AEC(v5, 2u);
  swift_bridgeObjectRelease();
  if (qword_26B3905C0 != -1) {
    swift_once();
  }
  uint64_t v14 = v7;
  char v15 = 4;
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_25E7F987C((uint64_t)&v14);
  v0[16] = v8;
  if (v1)
  {
    swift_bridgeObjectRelease();
    uint64_t v9 = (uint64_t (*)(void))v0[1];
LABEL_7:
    return v9();
  }
  uint64_t v11 = (uint64_t)v8;
  uint64_t v13 = (uint64_t (*)(uint64_t))((char *)&dword_26A708B98 + dword_26A708B98);
  uint64_t v12 = (void *)swift_task_alloc();
  v0[17] = v12;
  *uint64_t v12 = v0;
  v12[1] = sub_25E881F00;
  return v13(v11);
}

uint64_t sub_25E881E84()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRelease();
  sub_25E884AEC(v1, 2u);
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_25E881F00(uint64_t a1, unint64_t a2, void *a3, void *a4)
{
  *(void *)(*(void *)v5 + 144) = v4;
  swift_task_dealloc();
  if (v4)
  {
    uint64_t v10 = sub_25E8820B8;
  }
  else
  {
    sub_25E7DF934(a1, a2);
    swift_release();

    uint64_t v10 = sub_25E882054;
  }
  return MEMORY[0x270FA2498](v10, 0, 0);
}

uint64_t sub_25E882054()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25E8820B8()
{
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25E882124(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return MEMORY[0x263F8EE88];
  }
  uint64_t v17 = a1 + 32;
  swift_bridgeObjectRetain();
  uint64_t v2 = 0;
  uint64_t v3 = MEMORY[0x263F8EE88];
  uint64_t v4 = MEMORY[0x263F8EE88];
  do
  {
    uint64_t v6 = (uint64_t *)(v17 + 16 * v2);
    uint64_t v7 = *v6;
    if (v6[1])
    {
      uint64_t v19 = v3;
      uint64_t v8 = *(void *)(v7 + 16);
      if (v8)
      {
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v9 = (uint64_t *)(v7 + 40);
        do
        {
          uint64_t v10 = *(v9 - 1);
          uint64_t v11 = *v9;
          swift_bridgeObjectRetain();
          sub_25E7D5D88(&v18, v10, v11);
          swift_bridgeObjectRelease();
          v9 += 2;
          --v8;
        }
        while (v8);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        uint64_t v3 = v19;
      }
    }
    else
    {
      uint64_t v19 = v4;
      uint64_t v12 = *(void *)(v7 + 16);
      if (v12)
      {
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        uint64_t v13 = (uint64_t *)(v7 + 40);
        do
        {
          uint64_t v14 = *(v13 - 1);
          uint64_t v15 = *v13;
          swift_bridgeObjectRetain();
          sub_25E7D5D88(&v18, v14, v15);
          swift_bridgeObjectRelease();
          v13 += 2;
          --v12;
        }
        while (v12);
        swift_bridgeObjectRelease();
        uint64_t v5 = v19;
      }
      else
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v5 = v4;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v4 = v5;
    }
    ++v2;
  }
  while (v2 != v1);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_25E8822E4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B390808);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B38F798);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (uint64_t *)((char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = type metadata accessor for SportsFavoriteService.Favorites.State();
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (uint64_t *)((char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v14 = *(void *)(v2 + 8);
  int v15 = *(unsigned __int8 *)(v2 + 16);
  if (v15 == 2)
  {
    if (qword_26B390858 != -1) {
      swift_once();
    }
    sub_25E86BEC8();
    uint64_t v16 = a1 + *(int *)(_s5CacheV5ModelVMa(0) + 20);
    sub_25E8802EC(v14, (uint64_t)v13);
    return sub_25E884C20((uint64_t)v13, v16);
  }
  if (v15 == 1)
  {
    if (qword_26B390858 != -1) {
      swift_once();
    }
    sub_25E86BEC8();
    uint64_t v16 = a1 + *(int *)(_s5CacheV5ModelVMa(0) + 20);
    sub_25E87FECC(v14, (uint64_t)v13);
    return sub_25E884C20((uint64_t)v13, v16);
  }
  sub_25E7DF8D0(a2, (uint64_t)v10, &qword_26B38F798);
  uint64_t v18 = _s10NetworkingO12FetchedValueOMa(0);
  if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v18 - 8) + 48))(v10, 1, v18) == 1) {
    return sub_25E7DC68C((uint64_t)v10, &qword_26B38F798);
  }
  if (swift_getEnumCaseMultiPayload() != 1) {
    return sub_25E7CEB40((uint64_t)v10, _s10NetworkingO12FetchedValueOMa);
  }
  uint64_t v19 = *v10;
  uint64_t v20 = (uint64_t *)(a1 + *(int *)(_s5CacheV5ModelVMa(0) + 20));
  if ((sub_25E83BA18(*v20, v19) & 1) == 0)
  {
    if (qword_26B390858 != -1) {
      swift_once();
    }
    sub_25E86BEC8();
  }
  sub_25E7DF8D0((uint64_t)v20 + *(int *)(v11 + 20), (uint64_t)v7, &qword_26B390808);
  uint64_t v21 = (uint64_t)v13 + *(int *)(v11 + 20);
  uint64_t v22 = sub_25E885368();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v21, 1, 1, v22);
  *uint64_t v13 = v19;
  swift_bridgeObjectRetain();
  sub_25E7CEAD8((uint64_t)v7, v21);
  *((unsigned char *)v13 + *(int *)(v11 + 24)) = 0;
  sub_25E7CEB40((uint64_t)v20, (uint64_t (*)(void))type metadata accessor for SportsFavoriteService.Favorites.State);
  sub_25E7CF28C((uint64_t)v13, (uint64_t)v20, (uint64_t (*)(void))type metadata accessor for SportsFavoriteService.Favorites.State);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25E88269C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_25E82C6F4;
  return sub_25E8809B4(a1, a2, a3);
}

uint64_t sub_25E88274C()
{
  uint64_t v2 = swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *(void *)uint64_t v2 = v1;
  uint64_t v3 = *(void *)(v0 + 8);
  *(void *)(v2 + 8) = sub_25E803444;
  *(void *)(v2 + 16) = v3;
  *(unsigned char *)(v2 + 152) = *(unsigned char *)(v0 + 16);
  return MEMORY[0x270FA2498](sub_25E8810A0, 0, 0);
}

uint64_t sub_25E8827FC(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_25E82C6F4;
  return sub_25E7F6038(a1);
}

uint64_t SportsFavoriteService.Favorites.State.debugDescription.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25E885318();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v33 = (uint64_t)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B390808);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v34 = (uint64_t)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v0;
  int64_t v8 = *(void *)(*v0 + 16);
  uint64_t v9 = MEMORY[0x263F8EE78];
  if (v8)
  {
    uint64_t v30 = v3;
    uint64_t v31 = v2;
    uint64_t v32 = v0;
    v37[0] = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_25E7DFCF8(0, v8, 0);
    uint64_t v9 = v37[0];
    uint64_t result = sub_25E883770(v7);
    int64_t v11 = result;
    int v13 = v12;
    int v15 = v14 & 1;
    uint64_t v35 = v7 + 56;
    while ((v11 & 0x8000000000000000) == 0 && v11 < 1 << *(unsigned char *)(v7 + 32))
    {
      if (((*(void *)(v35 + (((unint64_t)v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
        goto LABEL_16;
      }
      if (*(_DWORD *)(v7 + 36) != v13) {
        goto LABEL_17;
      }
      int v36 = v15;
      uint64_t v16 = (uint64_t *)(*(void *)(v7 + 48) + 24 * v11);
      uint64_t v18 = *v16;
      uint64_t v17 = v16[1];
      v37[0] = v9;
      unint64_t v20 = *(void *)(v9 + 16);
      unint64_t v19 = *(void *)(v9 + 24);
      swift_bridgeObjectRetain();
      if (v20 >= v19 >> 1)
      {
        sub_25E7DFCF8(v19 > 1, v20 + 1, 1);
        uint64_t v9 = v37[0];
      }
      *(void *)(v9 + 16) = v20 + 1;
      uint64_t v21 = v9 + 16 * v20;
      *(void *)(v21 + 32) = v18;
      *(void *)(v21 + 40) = v17;
      uint64_t result = sub_25E883814(v11, v13, v36 & 1, v7);
      int64_t v11 = result;
      int v13 = v22;
      int v15 = v23 & 1;
      if (!--v8)
      {
        sub_25E7FA224(result, v22, v15);
        swift_bridgeObjectRelease();
        uint64_t v2 = v31;
        uint64_t v1 = v32;
        uint64_t v3 = v30;
        goto LABEL_11;
      }
    }
    __break(1u);
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
  }
  else
  {
LABEL_11:
    v37[0] = v9;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B390B10);
    sub_25E884C84((unint64_t *)&qword_26A708D50);
    sub_25E885578();
    swift_bridgeObjectRelease();
    v37[0] = 0;
    v37[1] = 0xE000000000000000;
    sub_25E885A78();
    swift_bridgeObjectRelease();
    strcpy((char *)v37, "(favorites:[");
    BYTE5(v37[1]) = 0;
    HIWORD(v37[1]) = -5120;
    sub_25E885678();
    swift_bridgeObjectRelease();
    sub_25E885678();
    uint64_t v24 = type metadata accessor for SportsFavoriteService.Favorites.State();
    uint64_t v25 = v34;
    sub_25E7DF8D0((uint64_t)v1 + *(int *)(v24 + 20), v34, &qword_26B390808);
    uint64_t v26 = sub_25E885368();
    uint64_t v27 = *(void *)(v26 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v27 + 48))(v25, 1, v26) == 1)
    {
      sub_25E7DC68C(v25, &qword_26B390808);
    }
    else
    {
      uint64_t v28 = v33;
      sub_25E871244(v33);
      sub_25E8852A8();
      (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v28, v2);
      (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v25, v26);
    }
    sub_25E885678();
    swift_bridgeObjectRelease();
    sub_25E885678();
    sub_25E885678();
    swift_bridgeObjectRelease();
    sub_25E885678();
    return v37[0];
  }
  return result;
}

uint64_t sub_25E882D38(uint64_t result)
{
  if (!*(void *)(*(void *)v1 + 16)) {
    return result;
  }
  uint64_t v2 = result;
  uint64_t v3 = result + 56;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  while (1)
  {
    if (v6)
    {
      unint64_t v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v10 = v9 | (v8 << 6);
      goto LABEL_6;
    }
    int64_t v15 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
LABEL_29:
      __break(1u);
      return result;
    }
    if (v15 >= v7) {
      goto LABEL_24;
    }
    unint64_t v16 = *(void *)(v3 + 8 * v15);
    ++v8;
    if (!v16)
    {
      int64_t v8 = v15 + 1;
      if (v15 + 1 >= v7) {
        goto LABEL_24;
      }
      unint64_t v16 = *(void *)(v3 + 8 * v8);
      if (!v16)
      {
        int64_t v8 = v15 + 2;
        if (v15 + 2 >= v7) {
          goto LABEL_24;
        }
        unint64_t v16 = *(void *)(v3 + 8 * v8);
        if (!v16)
        {
          int64_t v8 = v15 + 3;
          if (v15 + 3 >= v7) {
            goto LABEL_24;
          }
          unint64_t v16 = *(void *)(v3 + 8 * v8);
          if (!v16) {
            break;
          }
        }
      }
    }
LABEL_23:
    unint64_t v6 = (v16 - 1) & v16;
    unint64_t v10 = __clz(__rbit64(v16)) + (v8 << 6);
LABEL_6:
    uint64_t v11 = *(void *)(v2 + 48) + 24 * v10;
    uint64_t v12 = *(void *)v11;
    uint64_t v13 = *(void *)(v11 + 8);
    char v14 = *(unsigned char *)(v11 + 16);
    swift_bridgeObjectRetain();
    sub_25E8404DC(v12, v13, v14, (uint64_t)v18);
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v17 = v15 + 4;
  if (v17 < v7)
  {
    unint64_t v16 = *(void *)(v3 + 8 * v17);
    if (!v16)
    {
      while (1)
      {
        int64_t v8 = v17 + 1;
        if (__OFADD__(v17, 1)) {
          goto LABEL_29;
        }
        if (v8 >= v7) {
          goto LABEL_24;
        }
        unint64_t v16 = *(void *)(v3 + 8 * v8);
        ++v17;
        if (v16) {
          goto LABEL_23;
        }
      }
    }
    int64_t v8 = v17;
    goto LABEL_23;
  }
LABEL_24:
  return swift_release();
}

uint64_t sub_25E882F08(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  v46[5] = *MEMORY[0x263EF8340];
  if (!*(void *)(a2 + 16))
  {
    swift_release();
    return MEMORY[0x263F8EE88];
  }
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v43 = a1 + 56;
  uint64_t v4 = -1 << *(unsigned char *)(a1 + 32);
  uint64_t v40 = ~v4;
  if (-v4 < 64) {
    uint64_t v5 = ~(-1 << -(char)v4);
  }
  else {
    uint64_t v5 = -1;
  }
  unint64_t v6 = v5 & v3;
  int64_t v41 = (unint64_t)(63 - v4) >> 6;
  uint64_t v7 = a2 + 56;
  uint64_t v8 = swift_bridgeObjectRetain();
  int64_t v9 = 0;
  uint64_t v42 = v8;
  while (1)
  {
    if (v6)
    {
      uint64_t v44 = (v6 - 1) & v6;
      int64_t v45 = v9;
      unint64_t v10 = __clz(__rbit64(v6)) | (v9 << 6);
    }
    else
    {
      int64_t v11 = v9 + 1;
      if (__OFADD__(v9, 1))
      {
        __break(1u);
        goto LABEL_60;
      }
      if (v11 >= v41) {
        goto LABEL_58;
      }
      unint64_t v12 = *(void *)(v43 + 8 * v11);
      int64_t v13 = v9 + 1;
      if (!v12)
      {
        int64_t v13 = v9 + 2;
        if (v9 + 2 >= v41) {
          goto LABEL_58;
        }
        unint64_t v12 = *(void *)(v43 + 8 * v13);
        if (!v12)
        {
          int64_t v13 = v9 + 3;
          if (v9 + 3 >= v41) {
            goto LABEL_58;
          }
          unint64_t v12 = *(void *)(v43 + 8 * v13);
          if (!v12)
          {
            int64_t v13 = v9 + 4;
            if (v9 + 4 >= v41) {
              goto LABEL_58;
            }
            unint64_t v12 = *(void *)(v43 + 8 * v13);
            if (!v12)
            {
              uint64_t v14 = v9 + 5;
              if (v9 + 5 >= v41)
              {
LABEL_58:
                sub_25E81117C();
                return v2;
              }
              unint64_t v12 = *(void *)(v43 + 8 * v14);
              if (!v12)
              {
                while (1)
                {
                  int64_t v13 = v14 + 1;
                  if (__OFADD__(v14, 1)) {
                    break;
                  }
                  if (v13 >= v41) {
                    goto LABEL_58;
                  }
                  unint64_t v12 = *(void *)(v43 + 8 * v13);
                  ++v14;
                  if (v12) {
                    goto LABEL_24;
                  }
                }
LABEL_60:
                __break(1u);
              }
              int64_t v13 = v9 + 5;
            }
          }
        }
      }
LABEL_24:
      uint64_t v44 = (v12 - 1) & v12;
      int64_t v45 = v13;
      unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
    }
    uint64_t v15 = *(void *)(v8 + 48) + 24 * v10;
    uint64_t v17 = *(void *)v15;
    uint64_t v16 = *(void *)(v15 + 8);
    int v18 = *(unsigned __int8 *)(v15 + 16);
    sub_25E885E28();
    swift_bridgeObjectRetain_n();
    sub_25E885648();
    swift_bridgeObjectRelease();
    uint64_t v19 = sub_25E885E58();
    uint64_t v20 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v21 = v19 & ~v20;
    if ((*(void *)(v7 + ((v21 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v21)) {
      break;
    }
LABEL_6:
    swift_bridgeObjectRelease();
    uint64_t v8 = v42;
    unint64_t v6 = v44;
    int64_t v9 = v45;
  }
  uint64_t v22 = ~v20;
  if (v18) {
    uint64_t v23 = 0x65756761656CLL;
  }
  else {
    uint64_t v23 = 1835099508;
  }
  if (v18) {
    unint64_t v24 = 0xE600000000000000;
  }
  else {
    unint64_t v24 = 0xE400000000000000;
  }
  while (1)
  {
    uint64_t v25 = *(void *)(v2 + 48) + 24 * v21;
    int v26 = *(unsigned __int8 *)(v25 + 16);
    BOOL v27 = *(void *)v25 == v17 && *(void *)(v25 + 8) == v16;
    if (!v27 && (sub_25E885D48() & 1) == 0) {
      goto LABEL_32;
    }
    uint64_t v28 = v26 ? 0x65756761656CLL : 1835099508;
    unint64_t v29 = v26 ? 0xE600000000000000 : 0xE400000000000000;
    if (v28 == v23 && v29 == v24) {
      break;
    }
    char v31 = sub_25E885D48();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v31) {
      goto LABEL_52;
    }
LABEL_32:
    unint64_t v21 = (v21 + 1) & v22;
    if (((*(void *)(v7 + ((v21 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v21) & 1) == 0) {
      goto LABEL_6;
    }
  }
  swift_bridgeObjectRelease_n();
LABEL_52:
  uint64_t isStackAllocationSafe = swift_bridgeObjectRelease();
  v46[0] = v42;
  v46[1] = v43;
  v46[2] = v40;
  v46[3] = v45;
  v46[4] = v44;
  char v33 = *(unsigned char *)(v2 + 32);
  unint64_t v34 = (unint64_t)((1 << v33) + 63) >> 6;
  size_t v35 = 8 * v34;
  if ((v33 & 0x3Fu) <= 0xD
    || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), isStackAllocationSafe))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    memcpy((char *)&v39 - ((v35 + 15) & 0x3FFFFFFFFFFFFFF0), (const void *)(v2 + 56), v35);
    uint64_t v36 = sub_25E883404((uint64_t)&v39 - ((v35 + 15) & 0x3FFFFFFFFFFFFFF0), v34, v2, v21, v46);
    swift_release();
    sub_25E81117C();
  }
  else
  {
    uint64_t v37 = (void *)swift_slowAlloc();
    memcpy(v37, (const void *)(v2 + 56), v35);
    uint64_t v36 = sub_25E883404((uint64_t)v37, v34, v2, v21, v46);
    swift_release();
    sub_25E81117C();
    MEMORY[0x2611E4C00](v37, -1, -1);
  }
  return v36;
}

uint64_t sub_25E883404(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  uint64_t v6 = *(void *)(a3 + 16);
  uint64_t v40 = (unint64_t *)result;
  *(void *)(result + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  uint64_t v7 = v6 - 1;
  uint64_t v42 = a3 + 56;
  int64_t v41 = a5;
LABEL_2:
  uint64_t v39 = v7;
LABEL_4:
  while (2)
  {
    int64_t v9 = a5[3];
    unint64_t v8 = a5[4];
    if (v8)
    {
      uint64_t v10 = (v8 - 1) & v8;
      unint64_t v11 = __clz(__rbit64(v8)) | (v9 << 6);
LABEL_16:
      uint64_t v17 = *(void *)(*a5 + 48) + 24 * v11;
      uint64_t v19 = *(void *)v17;
      uint64_t v18 = *(void *)(v17 + 8);
      int v20 = *(unsigned __int8 *)(v17 + 16);
      a5[3] = v9;
      a5[4] = v10;
      sub_25E885E28();
      swift_bridgeObjectRetain();
      sub_25E885648();
      uint64_t v21 = sub_25E885E58();
      uint64_t v22 = -1 << *(unsigned char *)(a3 + 32);
      unint64_t v23 = v21 & ~v22;
      if (((*(void *)(v42 + ((v23 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v23) & 1) == 0)
      {
LABEL_3:
        uint64_t result = swift_bridgeObjectRelease();
        a5 = v41;
        continue;
      }
      uint64_t v24 = ~v22;
      BOOL v25 = v20 == 0;
      if (v20) {
        uint64_t v26 = 0x65756761656CLL;
      }
      else {
        uint64_t v26 = 1835099508;
      }
      if (v25) {
        unint64_t v27 = 0xE400000000000000;
      }
      else {
        unint64_t v27 = 0xE600000000000000;
      }
      while (1)
      {
        uint64_t v28 = *(void *)(a3 + 48) + 24 * v23;
        int v29 = *(unsigned __int8 *)(v28 + 16);
        BOOL v30 = *(void *)v28 == v19 && *(void *)(v28 + 8) == v18;
        if (v30 || (sub_25E885D48() & 1) != 0)
        {
          if (v29) {
            uint64_t v31 = 0x65756761656CLL;
          }
          else {
            uint64_t v31 = 1835099508;
          }
          if (v29) {
            unint64_t v32 = 0xE600000000000000;
          }
          else {
            unint64_t v32 = 0xE400000000000000;
          }
          if (v31 == v26 && v32 == v27)
          {
            swift_bridgeObjectRelease_n();
LABEL_42:
            uint64_t result = swift_bridgeObjectRelease();
            uint64_t v35 = (v23 >> 3) & 0x1FFFFFFFFFFFFFF8;
            a5 = v41;
            uint64_t v36 = *(unint64_t *)((char *)v40 + v35);
            *(unint64_t *)((char *)v40 + v35) = v36 & ~(1 << v23);
            if ((v36 & (1 << v23)) != 0)
            {
              uint64_t v7 = v39 - 1;
              if (__OFSUB__(v39, 1)) {
                goto LABEL_60;
              }
              if (v39 == 1) {
                return MEMORY[0x263F8EE88];
              }
              goto LABEL_2;
            }
            goto LABEL_4;
          }
          char v34 = sub_25E885D48();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v34) {
            goto LABEL_42;
          }
        }
        unint64_t v23 = (v23 + 1) & v24;
        if (((*(void *)(v42 + ((v23 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v23) & 1) == 0) {
          goto LABEL_3;
        }
      }
    }
    break;
  }
  int64_t v12 = v9 + 1;
  if (!__OFADD__(v9, 1))
  {
    int64_t v13 = (unint64_t)(a5[2] + 64) >> 6;
    if (v12 >= v13)
    {
      int64_t v12 = a5[3];
LABEL_56:
      a5[3] = v12;
      a5[4] = 0;
      swift_retain();
      return sub_25E8296C8(v40, a2, v39, a3);
    }
    uint64_t v14 = a5[1];
    unint64_t v15 = *(void *)(v14 + 8 * v12);
    if (v15) {
      goto LABEL_15;
    }
    int64_t v16 = v9 + 2;
    if (v9 + 2 >= v13) {
      goto LABEL_56;
    }
    unint64_t v15 = *(void *)(v14 + 8 * v16);
    if (!v15)
    {
      if (v9 + 3 >= v13) {
        goto LABEL_57;
      }
      unint64_t v15 = *(void *)(v14 + 8 * (v9 + 3));
      if (v15)
      {
        int64_t v12 = v9 + 3;
        goto LABEL_15;
      }
      int64_t v16 = v9 + 4;
      if (v9 + 4 >= v13)
      {
        int64_t v12 = v9 + 3;
        goto LABEL_56;
      }
      unint64_t v15 = *(void *)(v14 + 8 * v16);
      if (!v15)
      {
        int64_t v12 = v9 + 5;
        if (v9 + 5 >= v13)
        {
LABEL_57:
          int64_t v12 = v16;
          goto LABEL_56;
        }
        unint64_t v15 = *(void *)(v14 + 8 * v12);
        if (!v15)
        {
          int64_t v12 = v13 - 1;
          int64_t v37 = v9 + 6;
          while (v13 != v37)
          {
            unint64_t v15 = *(void *)(v14 + 8 * v37++);
            if (v15)
            {
              int64_t v12 = v37 - 1;
              goto LABEL_15;
            }
          }
          goto LABEL_56;
        }
        goto LABEL_15;
      }
    }
    int64_t v12 = v16;
LABEL_15:
    uint64_t v10 = (v15 - 1) & v15;
    unint64_t v11 = __clz(__rbit64(v15)) + (v12 << 6);
    int64_t v9 = v12;
    goto LABEL_16;
  }
  __break(1u);
LABEL_60:
  __break(1u);
  return result;
}

uint64_t sub_25E883770(uint64_t a1)
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
  int64_t v9 = (unint64_t *)(a1 + 80);
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

int64_t sub_25E883814(int64_t result, int a2, char a3, uint64_t a4)
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

uint64_t _s13TVAppServices21SportsFavoriteServiceV9FavoritesO0D0V2eeoiySbAG_AGtFZ_0(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 16);
  int v3 = *(unsigned __int8 *)(a2 + 16);
  BOOL v4 = *(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8);
  if (v4 || (char v5 = 0, (sub_25E885D48() & 1) != 0))
  {
    if (v2) {
      uint64_t v6 = 0x65756761656CLL;
    }
    else {
      uint64_t v6 = 1835099508;
    }
    if (v2) {
      unint64_t v7 = 0xE600000000000000;
    }
    else {
      unint64_t v7 = 0xE400000000000000;
    }
    if (v3) {
      uint64_t v8 = 0x65756761656CLL;
    }
    else {
      uint64_t v8 = 1835099508;
    }
    if (v3) {
      unint64_t v9 = 0xE600000000000000;
    }
    else {
      unint64_t v9 = 0xE400000000000000;
    }
    if (v6 == v8 && v7 == v9) {
      char v5 = 1;
    }
    else {
      char v5 = sub_25E885D48();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v5 & 1;
}

unint64_t sub_25E8839C8()
{
  unint64_t result = qword_26A70A018;
  if (!qword_26A70A018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A70A018);
  }
  return result;
}

unint64_t sub_25E883A1C()
{
  unint64_t result = qword_26A70A020;
  if (!qword_26A70A020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A70A020);
  }
  return result;
}

unint64_t sub_25E883A70()
{
  unint64_t result = qword_26A70A030;
  if (!qword_26A70A030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A70A030);
  }
  return result;
}

unint64_t sub_25E883AC4()
{
  unint64_t result = qword_26A70A048;
  if (!qword_26A70A048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A70A048);
  }
  return result;
}

unint64_t sub_25E883B1C()
{
  unint64_t result = qword_26A70A050;
  if (!qword_26A70A050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A70A050);
  }
  return result;
}

unint64_t sub_25E883B74()
{
  unint64_t result = qword_26A70A058;
  if (!qword_26A70A058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A70A058);
  }
  return result;
}

ValueMetadata *type metadata accessor for SportsFavoriteService.Favorites()
{
  return &type metadata for SportsFavoriteService.Favorites;
}

uint64_t sub_25E883BDC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s9FavoritesO8FavoriteVwca(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t _s9FavoritesO8FavoriteVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t _s9FavoritesO8FavoriteVwet(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 17)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s9FavoritesO8FavoriteVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 17) = 1;
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
    *(unsigned char *)(result + 17) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SportsFavoriteService.Favorites.Favorite.Type()
{
  return &type metadata for SportsFavoriteService.Favorites.Favorite.Type;
}

uint64_t _s9FavoritesO12ModificationOwCP(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s9FavoritesO12ModificationOwxx()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s9FavoritesO12ModificationOwca(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s9FavoritesO12ModificationOwta(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for SportsFavoriteService.Favorites.Modification()
{
  return &type metadata for SportsFavoriteService.Favorites.Modification;
}

unsigned char *_s9FavoritesO12ModificationO13FailureReasonOwst(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25E883EB4);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for SportsFavoriteService.Favorites.Modification.FailureReason()
{
  return &type metadata for SportsFavoriteService.Favorites.Modification.FailureReason;
}

void *_s9FavoritesO5StateVwCP(void *a1, void *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    unint64_t v7 = (void *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    unint64_t v7 = a1;
    uint64_t v8 = *(int *)(a3 + 20);
    unint64_t v9 = (char *)a1 + v8;
    unint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_25E885368();
    uint64_t v12 = *(void *)(v11 - 8);
    int64_t v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B390808);
      memcpy(v9, v10, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    *((unsigned char *)v7 + *(int *)(a3 + 24)) = *((unsigned char *)a2 + *(int *)(a3 + 24));
  }
  return v7;
}

void *_s9FavoritesO5StateVwca(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  unint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25E885368();
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
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B390808);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  *((unsigned char *)a1 + *(int *)(a3 + 24)) = *((unsigned char *)a2 + *(int *)(a3 + 24));
  return a1;
}

void *_s9FavoritesO5StateVwtk(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  unint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25E885368();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B390808);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  *((unsigned char *)a1 + *(int *)(a3 + 24)) = *((unsigned char *)a2 + *(int *)(a3 + 24));
  return a1;
}

void *_s9FavoritesO5StateVwta(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  unint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25E885368();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 40))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B390808);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  *((unsigned char *)a1 + *(int *)(a3 + 24)) = *((unsigned char *)a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t _s9FavoritesO5StateVwet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25E884510);
}

uint64_t sub_25E884510(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B390808);
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t _s9FavoritesO5StateVwst(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25E8845D8);
}

void *sub_25E8845D8(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *unint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B390808);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

unsigned char *_s9FavoritesO8FavoriteV4TypeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25E884778);
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

ValueMetadata *_s9FavoritesO8FavoriteV10CodingKeysOMa()
{
  return &_s9FavoritesO8FavoriteV10CodingKeysON;
}

unint64_t sub_25E8847B4()
{
  unint64_t result = qword_26A70A060;
  if (!qword_26A70A060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A70A060);
  }
  return result;
}

unint64_t sub_25E88480C()
{
  unint64_t result = qword_26A70A068;
  if (!qword_26A70A068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A70A068);
  }
  return result;
}

unint64_t sub_25E884864()
{
  unint64_t result = qword_26A70A070;
  if (!qword_26A70A070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A70A070);
  }
  return result;
}

unint64_t sub_25E8848BC()
{
  unint64_t result = qword_26A70A078;
  if (!qword_26A70A078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A70A078);
  }
  return result;
}

uint64_t sub_25E884910(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x657469726F766166 && a2 == 0xE900000000000073;
  if (v2 || (sub_25E885D48() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000025E890FB0 || (sub_25E885D48() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x79747269447369 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_25E885D48();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

unint64_t sub_25E884A6C()
{
  unint64_t result = qword_26A70A080;
  if (!qword_26A70A080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_26A70A080);
  }
  return result;
}

uint64_t sub_25E884AC0(uint64_t a1, unsigned __int8 a2)
{
  if (a2 - 1 <= 1) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t _s9FavoritesO6ActionVwxx(uint64_t a1)
{
  return sub_25E884AEC(*(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_25E884AEC(uint64_t a1, unsigned __int8 a2)
{
  if (a2 - 1 <= 1) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s9FavoritesO6ActionVwCP_0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  uint64_t v3 = *(void *)(a2 + 8);
  unsigned __int8 v4 = *(unsigned char *)(a2 + 16);
  sub_25E884AC0(v3, v4);
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4;
  return a1;
}

uint64_t _s9FavoritesO6ActionVwca(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  uint64_t v3 = *(void *)(a2 + 8);
  unsigned __int8 v4 = *(unsigned char *)(a2 + 16);
  sub_25E884AC0(v3, v4);
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = v3;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v4;
  sub_25E884AEC(v5, v6);
  return a1;
}

uint64_t _s9FavoritesO6ActionVwta(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_25E884AEC(v4, v5);
  return a1;
}

ValueMetadata *_s9FavoritesO6ActionVMa()
{
  return &_s9FavoritesO6ActionVN;
}

uint64_t sub_25E884C20(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SportsFavoriteService.Favorites.State();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_25E884C84(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B390B10);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_25E884CCC()
{
  unint64_t result = qword_26A70A0B8;
  if (!qword_26A70A0B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A70A0B8);
  }
  return result;
}

uint64_t _s9FavoritesO6ActionV9OperationOwCP(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  unsigned __int8 v4 = *(unsigned char *)(a2 + 8);
  sub_25E884AC0(*(void *)a2, v4);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  return a1;
}

uint64_t _s9FavoritesO6ActionV9OperationOwxx(uint64_t a1)
{
  return sub_25E884AEC(*(void *)a1, *(unsigned char *)(a1 + 8));
}

uint64_t _s9FavoritesO6ActionV9OperationOwca(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  unsigned __int8 v4 = *(unsigned char *)(a2 + 8);
  sub_25E884AC0(*(void *)a2, v4);
  uint64_t v5 = *(void *)a1;
  *(void *)a1 = v3;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 8);
  *(unsigned char *)(a1 + 8) = v4;
  sub_25E884AEC(v5, v6);
  return a1;
}

uint64_t _s9FavoritesO6ActionV9OperationOwta(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void *)a1;
  *(void *)a1 = *(void *)a2;
  unsigned __int8 v5 = *(unsigned char *)(a1 + 8);
  *(unsigned char *)(a1 + 8) = v3;
  sub_25E884AEC(v4, v5);
  return a1;
}

uint64_t _s9FavoritesO6ActionV9OperationOwet(uint64_t a1, unsigned int a2)
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

uint64_t _s9FavoritesO6ActionV9OperationOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)unint64_t result = a2 - 254;
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

uint64_t sub_25E884E98(uint64_t result, char a2)
{
  *(unsigned char *)(result + 8) = a2;
  return result;
}

ValueMetadata *_s9FavoritesO6ActionV9OperationOMa()
{
  return &_s9FavoritesO6ActionV9OperationON;
}

uint64_t sub_25E884EB8()
{
  return MEMORY[0x270EEDBA0]();
}

uint64_t sub_25E884EC8()
{
  return MEMORY[0x270EEDBB0]();
}

uint64_t sub_25E884ED8()
{
  return MEMORY[0x270EEDBD0]();
}

uint64_t sub_25E884EE8()
{
  return MEMORY[0x270EEDBE8]();
}

uint64_t sub_25E884EF8()
{
  return MEMORY[0x270EEDBF8]();
}

uint64_t sub_25E884F08()
{
  return MEMORY[0x270EEDC08]();
}

uint64_t sub_25E884F18()
{
  return MEMORY[0x270EEDC50]();
}

uint64_t sub_25E884F28()
{
  return MEMORY[0x270EEDC60]();
}

uint64_t sub_25E884F38()
{
  return MEMORY[0x270EEDC68]();
}

uint64_t sub_25E884F48()
{
  return MEMORY[0x270EEDC80]();
}

uint64_t sub_25E884F58()
{
  return MEMORY[0x270EEDC90]();
}

uint64_t sub_25E884F68()
{
  return MEMORY[0x270EEDCB8]();
}

uint64_t sub_25E884F78()
{
  return MEMORY[0x270EEDD88]();
}

uint64_t sub_25E884F88()
{
  return MEMORY[0x270EEDDA0]();
}

uint64_t sub_25E884F98()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_25E884FA8()
{
  return MEMORY[0x270EEDDE8]();
}

uint64_t sub_25E884FB8()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_25E884FC8()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_25E884FD8()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_25E884FE8()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_25E884FF8()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_25E885008()
{
  return MEMORY[0x270EEE378]();
}

uint64_t sub_25E885018()
{
  return MEMORY[0x270EEE3B8]();
}

uint64_t sub_25E885028()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_25E885038()
{
  return MEMORY[0x270EEE3E0]();
}

uint64_t sub_25E885048()
{
  return MEMORY[0x270EEE3F0]();
}

uint64_t sub_25E885058()
{
  return MEMORY[0x270EEE408]();
}

uint64_t sub_25E885068()
{
  return MEMORY[0x270EEE410]();
}

uint64_t sub_25E885078()
{
  return MEMORY[0x270EEE4A0]();
}

uint64_t sub_25E885088()
{
  return MEMORY[0x270EEE4B0]();
}

uint64_t sub_25E885098()
{
  return MEMORY[0x270EEE4C0]();
}

uint64_t sub_25E8850A8()
{
  return MEMORY[0x270EEE518]();
}

uint64_t sub_25E8850B8()
{
  return MEMORY[0x270EEE520]();
}

uint64_t sub_25E8850C8()
{
  return MEMORY[0x270EEE5C0]();
}

uint64_t sub_25E8850D8()
{
  return MEMORY[0x270EEE610]();
}

uint64_t sub_25E8850E8()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_25E8850F8()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_25E885108()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_25E885118()
{
  return MEMORY[0x270EEE7B8]();
}

uint64_t sub_25E885128()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_25E885138()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_25E885148()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_25E885158()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_25E885168()
{
  return MEMORY[0x270EEFCA0]();
}

uint64_t sub_25E885178()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_25E885188()
{
  return MEMORY[0x270EEFCE0]();
}

uint64_t sub_25E885198()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_25E8851A8()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t sub_25E8851B8()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_25E8851C8()
{
  return MEMORY[0x270EEFE68]();
}

uint64_t sub_25E8851D8()
{
  return MEMORY[0x270EEFEB8]();
}

uint64_t sub_25E8851E8()
{
  return MEMORY[0x270EEFEC0]();
}

uint64_t sub_25E8851F8()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_25E885208()
{
  return MEMORY[0x270EEFF30]();
}

uint64_t sub_25E885218()
{
  return MEMORY[0x270EEFF38]();
}

uint64_t sub_25E885228()
{
  return MEMORY[0x270EEFF40]();
}

uint64_t sub_25E885238()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_25E885248()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_25E885258()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_25E885268()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_25E885278()
{
  return MEMORY[0x270EF01C0]();
}

uint64_t sub_25E885288()
{
  return MEMORY[0x270EF02C8]();
}

uint64_t sub_25E885298()
{
  return MEMORY[0x270EF02D8]();
}

uint64_t sub_25E8852A8()
{
  return MEMORY[0x270EF0790]();
}

uint64_t sub_25E8852B8()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_25E8852C8()
{
  return MEMORY[0x270EF07E8]();
}

uint64_t sub_25E8852D8()
{
  return MEMORY[0x270EF07F8]();
}

uint64_t sub_25E8852E8()
{
  return MEMORY[0x270EF0808]();
}

uint64_t sub_25E8852F8()
{
  return MEMORY[0x270EF0820]();
}

uint64_t sub_25E885308()
{
  return MEMORY[0x270EF0840]();
}

uint64_t sub_25E885318()
{
  return MEMORY[0x270EF0890]();
}

uint64_t sub_25E885328()
{
  return MEMORY[0x270EF0AF0]();
}

uint64_t sub_25E885338()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_25E885348()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_25E885358()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_25E885368()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_25E885378()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_25E885388()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_25E885398()
{
  return MEMORY[0x270EF1248]();
}

uint64_t sub_25E8853A8()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_25E8853B8()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_25E8853C8()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_25E8853D8()
{
  return MEMORY[0x270EF15A8]();
}

uint64_t sub_25E8853E8()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_25E8853F8()
{
  return MEMORY[0x270FA2C68]();
}

uint64_t sub_25E885408()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_25E885418()
{
  return MEMORY[0x270FA2C90]();
}

uint64_t sub_25E885428()
{
  return MEMORY[0x270FA2C98]();
}

uint64_t sub_25E885438()
{
  return MEMORY[0x270FA2CC0]();
}

uint64_t sub_25E885448()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_25E885458()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25E885468()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_25E885478()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25E885488()
{
  return MEMORY[0x270FA15C0]();
}

uint64_t sub_25E885498()
{
  return MEMORY[0x270FA1600]();
}

uint64_t sub_25E8854A8()
{
  return MEMORY[0x270FA1618]();
}

uint64_t sub_25E8854B8()
{
  return MEMORY[0x270FA1620]();
}

uint64_t sub_25E8854C8()
{
  return MEMORY[0x270EE3B98]();
}

uint64_t sub_25E8854D8()
{
  return MEMORY[0x270EE3BB0]();
}

uint64_t sub_25E8854E8()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_25E8854F8()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_25E885508()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_25E885518()
{
  return MEMORY[0x270FA0A28]();
}

uint64_t sub_25E885528()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_25E885538()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_25E885548()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_25E885558()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_25E885568()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_25E885578()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_25E885588()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_25E885598()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25E8855A8()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_25E8855B8()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_25E8855C8()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25E8855D8()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_25E8855E8()
{
  return MEMORY[0x270EF1B18]();
}

uint64_t sub_25E8855F8()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_25E885608()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_25E885618()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_25E885628()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_25E885638()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_25E885648()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25E885658()
{
  return MEMORY[0x270F9D748]();
}

uint64_t sub_25E885668()
{
  return MEMORY[0x270F9D788]();
}

uint64_t sub_25E885678()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25E885688()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25E885698()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_25E8856A8()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_25E8856B8()
{
  return MEMORY[0x270F9D808]();
}

uint64_t sub_25E8856C8()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_25E8856D8()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_25E8856E8()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_25E8856F8()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_25E885708()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_25E885718()
{
  return MEMORY[0x270F9DA28]();
}

uint64_t sub_25E885728()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_25E885738()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_25E885748()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_25E885758()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_25E885768()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_25E885778()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_25E885788()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_25E885798()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_25E8857A8()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_25E8857B8()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_25E8857C8()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_25E8857D8()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_25E8857E8()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_25E8857F8()
{
  return MEMORY[0x270FA1F18]();
}

uint64_t sub_25E885808()
{
  return MEMORY[0x270FA1F30]();
}

uint64_t sub_25E885818()
{
  return MEMORY[0x270FA1F48]();
}

uint64_t sub_25E885828()
{
  return MEMORY[0x270FA1F60]();
}

uint64_t sub_25E885858()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_25E885868()
{
  return MEMORY[0x270FA1FD8]();
}

uint64_t sub_25E885878()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_25E885888()
{
  return MEMORY[0x270FA2BA8]();
}

uint64_t sub_25E885898()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_25E8858A8()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_25E8858B8()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25E8858C8()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_25E8858D8()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_25E8858E8()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_25E8858F8()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_25E885908()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_25E885918()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_25E885928()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_25E885938()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_25E885948()
{
  return MEMORY[0x270EF2010]();
}

uint64_t sub_25E885958()
{
  return MEMORY[0x270EF2020]();
}

uint64_t sub_25E885968()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_25E885978()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_25E885988()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25E885998()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25E8859A8()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_25E8859B8()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_25E8859C8()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_25E8859D8()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_25E8859F8()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_25E885A08()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_25E885A18()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_25E885A28()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_25E885A38()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_25E885A48()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_25E885A58()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_25E885A68()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_25E885A78()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25E885A88()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25E885A98()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_25E885AA8()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_25E885AB8()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_25E885AC8()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25E885AD8()
{
  return MEMORY[0x270FA21A0]();
}

uint64_t sub_25E885AE8()
{
  return MEMORY[0x270FA21A8]();
}

uint64_t sub_25E885AF8()
{
  return MEMORY[0x270FA21B0]();
}

uint64_t sub_25E885B08()
{
  return MEMORY[0x270F9ECD8]();
}

uint64_t sub_25E885B18()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_25E885B28()
{
  return MEMORY[0x270F9EDE8]();
}

uint64_t sub_25E885B38()
{
  return MEMORY[0x270F9EDF8]();
}

uint64_t sub_25E885B48()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25E885B58()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_25E885B68()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_25E885B78()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_25E885B88()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_25E885B98()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25E885BA8()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25E885BC8()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_25E885BD8()
{
  return MEMORY[0x270F9F248]();
}

uint64_t sub_25E885BE8()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_25E885BF8()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_25E885C08()
{
  return MEMORY[0x270F9F278]();
}

uint64_t sub_25E885C18()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_25E885C28()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_25E885C38()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_25E885C48()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_25E885C58()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_25E885C68()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_25E885C78()
{
  return MEMORY[0x270F9F358]();
}

uint64_t sub_25E885C88()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_25E885C98()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_25E885CA8()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_25E885CB8()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_25E885CC8()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_25E885CD8()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_25E885CE8()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_25E885CF8()
{
  return MEMORY[0x270F9F498]();
}

uint64_t sub_25E885D08()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25E885D28()
{
  return MEMORY[0x270F9F508]();
}

uint64_t sub_25E885D38()
{
  return MEMORY[0x270F9F5A0]();
}

uint64_t sub_25E885D48()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25E885D58()
{
  return MEMORY[0x270F9FA40]();
}

uint64_t sub_25E885D78()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_25E885D88()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_25E885D98()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25E885DA8()
{
  return MEMORY[0x270FA2378]();
}

uint64_t sub_25E885DC8()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_25E885DD8()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25E885DE8()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25E885DF8()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25E885E08()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25E885E18()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t sub_25E885E28()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25E885E38()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25E885E48()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_25E885E58()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25E885E68()
{
  return MEMORY[0x270F9FD68]();
}

uint64_t sub_25E885E78()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_25E885E88()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_25E885E98()
{
  return MEMORY[0x270F9FFE8]();
}

uint64_t sub_25E885EC8()
{
  return MEMORY[0x270FA0128]();
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x270F0CDD0]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x270EF2BD8](directory, domainMask, expandTilde);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
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

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
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

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
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

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
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

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x270FA0418]();
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

uint64_t swift_initStaticObject()
{
  return MEMORY[0x270FA0480]();
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

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
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

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
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