uint64_t sub_1000B648C()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);
  uint64_t v6;

  v1 = v0[37];
  v2 = v0[34];
  v3 = v0[35];
  (*(void (**)(void, void))(v0[32] + 8))(v0[33], v0[31]);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
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
  v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_1000B65CC(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 392) = a1;
  *(void *)(v3 + 400) = v1;
  swift_task_dealloc();
  if (v1)
  {
    v4 = sub_1000B6B48;
  }
  else
  {
    swift_bridgeObjectRelease();
    v4 = sub_1000B66E8;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_1000B66E8()
{
  int64_t v1 = *(void *)(v0[49] + 16);
  v2 = _swiftEmptyArrayStorage;
  if (v1)
  {
    v0[6] = _swiftEmptyArrayStorage;
    sub_100054824(0, v1, 0);
    uint64_t v3 = 0;
    v2 = (void *)v0[6];
    do
    {
      StoredPhoto.localIdentifier.getter();
      v0[6] = v2;
      unint64_t v5 = v2[2];
      unint64_t v4 = v2[3];
      if (v5 >= v4 >> 1)
      {
        sub_100054824(v4 > 1, v5 + 1, 1);
        v2 = (void *)v0[6];
      }
      ++v3;
      uint64_t v7 = v0[17];
      uint64_t v6 = v0[18];
      uint64_t v8 = v0[16];
      v2[2] = v5 + 1;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v7 + 32))((unint64_t)v2+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(void *)(v7 + 72) * v5, v6, v8);
    }
    while (v1 != v3);
  }
  v0[51] = v2;
  sub_1000CD730(&qword_1000F26F8, (void (*)(uint64_t))&type metadata accessor for AlbumID);
  dispatch thunk of PhotosFaceID.id.getter();
  uint64_t v9 = static TestProperties.fixedDay.getter();
  if ((v10 & 1) == 0)
  {
    uint64_t v11 = v9;
    goto LABEL_12;
  }
  uint64_t v13 = v0[14];
  uint64_t v12 = v0[15];
  uint64_t v14 = v0[13];
  Date.init()();
  Date.timeIntervalSinceReferenceDate.getter();
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  static Duration.seconds(_:)();
  static TestProperties.albumRotationEpoch.getter();
  uint64_t v15 = static Duration./ infix(_:_:)();
  if ((~*(void *)&v20 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_16;
  }
  if (v20 <= -9.22337204e18)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (v20 >= 9.22337204e18)
  {
LABEL_17:
    __break(1u);
    return dispatch thunk of PhotosFaceIDDatabase.relate(photos:to:on:)(v15, v16, v17, v18, v19);
  }
  uint64_t v11 = (uint64_t)v20;
LABEL_12:
  uint64_t v21 = type metadata accessor for AlbumDatabase();
  uint64_t v22 = sub_1000CD730(&qword_1000F2B20, (void (*)(uint64_t))&type metadata accessor for AlbumDatabase);
  v23 = (void *)swift_task_alloc();
  v0[52] = v23;
  void *v23 = v0;
  v23[1] = sub_1000B69C4;
  uint64_t v16 = v0[19];
  uint64_t v15 = (uint64_t)v2;
  uint64_t v17 = v11;
  uint64_t v18 = v21;
  uint64_t v19 = v22;
  return dispatch thunk of PhotosFaceIDDatabase.relate(photos:to:on:)(v15, v16, v17, v18, v19);
}

uint64_t sub_1000B69C4()
{
  v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 424) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = v2[19];
    uint64_t v6 = v2 + 16;
    uint64_t v4 = v2[16];
    uint64_t v5 = v6[1];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
    uint64_t v7 = sub_1000B6FA4;
  }
  else
  {
    uint64_t v8 = v2[19];
    uint64_t v9 = v2[16];
    uint64_t v10 = v2[17];
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
    uint64_t v7 = sub_1000B6CB8;
  }
  return _swift_task_switch(v7, 0, 0);
}

uint64_t sub_1000B6B48()
{
  uint64_t v1 = v0[37];
  uint64_t v2 = v0[34];
  uint64_t v3 = v0[35];
  uint64_t v5 = v0[32];
  uint64_t v4 = v0[33];
  uint64_t v6 = v0[31];
  uint64_t v7 = v0[29];
  uint64_t v8 = v0[26];
  uint64_t v9 = v0[27];
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
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
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_1000B6CB8()
{
  uint64_t v1 = *(void *)(v0 + 392);
  uint64_t v2 = *(void *)(v1 + 16);
  *(void *)(v0 + 432) = v2;
  if (!v2)
  {
    uint64_t v26 = *(void *)(v0 + 216);
    swift_bridgeObjectRelease();
    (*(void (**)(void, void))(v26 + 8))(*(void *)(v0 + 232), *(void *)(v0 + 208));
    uint64_t v27 = sub_100005F48(&qword_1000F3208, &qword_1000F31F0);
    v28 = (void *)swift_task_alloc();
    *(void *)(v0 + 344) = v28;
    void *v28 = v0;
    v28[1] = sub_1000B5E00;
    uint64_t v10 = *(void *)(v0 + 240);
    uint64_t v14 = *(void *)(v0 + 248);
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = v0 + 16;
    uint64_t v15 = v27;
    return __sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v10, v11, v12, v13, v14, v15);
  }
  unint64_t v3 = (*(unsigned __int8 *)(v0 + 464) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 464);
  *(void *)(v0 + 440) = 0;
  (*(void (**)(void, unint64_t, void))(v0 + 368))(*(void *)(v0 + 224), v1 + v3, *(void *)(v0 + 208));
  sub_100005CB0(&qword_1000F2DE0);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1000D7AB0;
  uint64_t v5 = static TestProperties.fixedDay.getter();
  if (v6)
  {
    uint64_t v8 = *(void *)(v0 + 112);
    uint64_t v7 = *(void *)(v0 + 120);
    uint64_t v9 = *(void *)(v0 + 104);
    Date.init()();
    Date.timeIntervalSinceReferenceDate.getter();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
    static Duration.seconds(_:)();
    static TestProperties.albumRotationEpoch.getter();
    uint64_t v10 = static Duration./ infix(_:_:)();
    if ((~*(void *)&v16 & 0x7FF0000000000000) != 0)
    {
      if (v16 > -9.22337204e18)
      {
        if (v16 < 9.22337204e18)
        {
          uint64_t v5 = (uint64_t)v16;
          goto LABEL_7;
        }
        goto LABEL_15;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
LABEL_15:
    __break(1u);
    return __sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v10, v11, v12, v13, v14, v15);
  }
LABEL_7:
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v0 + 368);
  uint64_t v18 = *(void *)(v0 + 224);
  uint64_t v19 = *(void *)(v0 + 208);
  uint64_t v21 = *(void *)(v0 + 88);
  double v20 = *(uint64_t **)(v0 + 96);
  uint64_t v22 = *(int **)(v0 + 56);
  *(void *)(v4 + 32) = v5;
  *double v20 = v4;
  v17((char *)v20 + *(int *)(v21 + 48), v18, v19);
  v29 = (uint64_t (*)(uint64_t))((char *)v22 + *v22);
  v23 = (void *)swift_task_alloc();
  *(void *)(v0 + 448) = v23;
  void *v23 = v0;
  v23[1] = sub_1000B7104;
  uint64_t v24 = *(void *)(v0 + 96);
  return v29(v24);
}

uint64_t sub_1000B6FA4()
{
  uint64_t v1 = v0[37];
  uint64_t v2 = v0[34];
  uint64_t v3 = v0[35];
  uint64_t v5 = v0[32];
  uint64_t v4 = v0[33];
  uint64_t v6 = v0[31];
  (*(void (**)(void, void))(v0[27] + 8))(v0[29], v0[26]);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
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
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_1000B7104()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 456) = v0;
  swift_task_dealloc();
  sub_100016B90(*(void *)(v2 + 96), &qword_1000F2A28);
  if (v0)
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = sub_1000B7554;
  }
  else
  {
    uint64_t v3 = sub_1000B7244;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_1000B7244()
{
  uint64_t v1 = *(void *)(v0 + 432);
  uint64_t v2 = *(void *)(v0 + 440) + 1;
  uint64_t v3 = *(void (**)(void, void))(*(void *)(v0 + 216) + 8);
  v3(*(void *)(v0 + 224), *(void *)(v0 + 208));
  if (v2 == v1)
  {
    swift_bridgeObjectRelease();
    v3(*(void *)(v0 + 232), *(void *)(v0 + 208));
    uint64_t v4 = sub_100005F48(&qword_1000F3208, &qword_1000F31F0);
    uint64_t v5 = (void *)swift_task_alloc();
    *(void *)(v0 + 344) = v5;
    *uint64_t v5 = v0;
    v5[1] = sub_1000B5E00;
    uint64_t v6 = *(void *)(v0 + 240);
    uint64_t v7 = *(void *)(v0 + 248);
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = v0 + 16;
    uint64_t v11 = v4;
    return __sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v6, v8, v9, v10, v7, v11);
  }
  uint64_t v12 = *(void *)(v0 + 440) + 1;
  *(void *)(v0 + 440) = v12;
  (*(void (**)(void, unint64_t, void))(v0 + 368))(*(void *)(v0 + 224), *(void *)(v0 + 392)+ ((*(unsigned __int8 *)(v0 + 464) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 464))+ *(void *)(v0 + 352) * v12, *(void *)(v0 + 208));
  sub_100005CB0(&qword_1000F2DE0);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_1000D7AB0;
  uint64_t v14 = static TestProperties.fixedDay.getter();
  if (v15)
  {
    uint64_t v17 = *(void *)(v0 + 112);
    uint64_t v16 = *(void *)(v0 + 120);
    uint64_t v18 = *(void *)(v0 + 104);
    Date.init()();
    Date.timeIntervalSinceReferenceDate.getter();
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
    static Duration.seconds(_:)();
    static TestProperties.albumRotationEpoch.getter();
    uint64_t v6 = static Duration./ infix(_:_:)();
    if ((~*(void *)&v19 & 0x7FF0000000000000) != 0)
    {
      if (v19 > -9.22337204e18)
      {
        if (v19 < 9.22337204e18)
        {
          uint64_t v14 = (uint64_t)v19;
          goto LABEL_10;
        }
LABEL_15:
        __break(1u);
        return __sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v6, v8, v9, v10, v7, v11);
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_15;
  }
LABEL_10:
  double v20 = *(void (**)(char *, uint64_t, uint64_t))(v0 + 368);
  uint64_t v21 = *(void *)(v0 + 224);
  uint64_t v22 = *(void *)(v0 + 208);
  uint64_t v24 = *(void *)(v0 + 88);
  v23 = *(uint64_t **)(v0 + 96);
  uint64_t v25 = *(int **)(v0 + 56);
  *(void *)(v13 + 32) = v14;
  uint64_t *v23 = v13;
  v20((char *)v23 + *(int *)(v24 + 48), v21, v22);
  v29 = (uint64_t (*)(uint64_t))((char *)v25 + *v25);
  uint64_t v26 = (void *)swift_task_alloc();
  *(void *)(v0 + 448) = v26;
  *uint64_t v26 = v0;
  v26[1] = sub_1000B7104;
  uint64_t v27 = *(void *)(v0 + 96);
  return v29(v27);
}

uint64_t sub_1000B7554()
{
  uint64_t v11 = v0[37];
  uint64_t v1 = v0[34];
  uint64_t v2 = v0[35];
  uint64_t v4 = v0[32];
  uint64_t v3 = v0[33];
  uint64_t v5 = v0[31];
  uint64_t v6 = v0[29];
  uint64_t v7 = v0[26];
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v0[27] + 8);
  v8(v0[28], v7);
  v8(v6, v7);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v11, v1);
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
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_1000B76D0()
{
  return dispatch thunk of PhotosFaceID.id.getter();
}

uint64_t sub_1000B7730@<X0>(unsigned char *a1@<X8>)
{
  swift_getAssociatedConformanceWitness();
  type metadata accessor for SyncedPhotosFace();
  uint64_t result = SyncedPhotosFace.complete.getter();
  *a1 = result & 1;
  return result;
}

uint64_t sub_1000B779C()
{
  return SyncedPhotosFace.id.getter();
}

uint64_t sub_1000B7804(uint64_t a1, uint64_t a2, void (*a3)(void), unint64_t *a4, void (*a5)(uint64_t))
{
  type metadata accessor for CommunicationActor();
  static CommunicationActor.shared.getter();
  sub_1000CD730(&qword_1000F1F70, (void (*)(uint64_t))&type metadata accessor for CommunicationActor);
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  type metadata accessor for ShuffleID();
  sub_1000CD730(&qword_1000F2838, (void (*)(uint64_t))&type metadata accessor for ShuffleID);
  uint64_t v22 = dispatch thunk of CustomStringConvertible.description.getter();
  v9._countAndFlagsBits = 8250;
  v9._object = (void *)0xE200000000000000;
  String.append(_:)(v9);
  uint64_t v10 = sub_100005CB0(&qword_1000F3DB0);
  uint64_t v11 = *(void *)(a1 + *(int *)(v10 + 48));
  __chkstk_darwin(v10);
  type metadata accessor for ShuffleProvider();
  a3(0);
  sub_1000CD730(&qword_1000F3DC8, (void (*)(uint64_t))type metadata accessor for ShuffleProvider);
  sub_1000CD730(a4, a5);
  uint64_t KeyPath = swift_getKeyPath();
  swift_retain();
  uint64_t v13 = sub_1000C953C(v11, KeyPath, (uint64_t)v23, &qword_1000F2E30);
  swift_release_n();
  uint64_t v14 = v13[2];
  if (v14)
  {
    swift_bridgeObjectRetain();
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    while (1)
    {
      uint64_t v17 = v13[v15 + 4];
      static CommunicationActor.shared.getter();
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t result = swift_release();
      BOOL v19 = __OFADD__(v16, v17);
      v16 += v17;
      if (v19) {
        break;
      }
      if (v14 == ++v15)
      {
        swift_bridgeObjectRelease();
        goto LABEL_10;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_10:
    swift_bridgeObjectRelease();
    v20._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v20);
    swift_bridgeObjectRelease();
    v21._countAndFlagsBits = 0x736F746F687020;
    v21._object = (void *)0xE700000000000000;
    String.append(_:)(v21);
    swift_release();
    return v22;
  }
  return result;
}

uint64_t sub_1000B7B40(uint64_t a1)
{
  type metadata accessor for CommunicationActor();
  static CommunicationActor.shared.getter();
  sub_1000CD730(&qword_1000F1F70, (void (*)(uint64_t))&type metadata accessor for CommunicationActor);
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  type metadata accessor for AlbumID();
  sub_1000CD730(&qword_1000F2738, (void (*)(uint64_t))&type metadata accessor for AlbumID);
  uint64_t v15 = dispatch thunk of CustomStringConvertible.description.getter();
  v2._countAndFlagsBits = 8250;
  v2._object = (void *)0xE200000000000000;
  String.append(_:)(v2);
  uint64_t v3 = sub_100005CB0(&qword_1000F40E8);
  uint64_t v4 = *(void *)(a1 + *(int *)(v3 + 48));
  __chkstk_darwin(v3);
  type metadata accessor for AlbumProvider();
  type metadata accessor for AlbumDatabase();
  sub_1000CD730(&qword_1000F4100, (void (*)(uint64_t))type metadata accessor for AlbumProvider);
  sub_1000CD730(&qword_1000F2B20, (void (*)(uint64_t))&type metadata accessor for AlbumDatabase);
  uint64_t KeyPath = swift_getKeyPath();
  swift_retain();
  uint64_t v6 = sub_1000C953C(v4, KeyPath, (uint64_t)v16, (uint64_t *)&unk_1000F3A80);
  swift_release_n();
  uint64_t v7 = v6[2];
  if (v7)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    while (1)
    {
      uint64_t v10 = v6[v8 + 4];
      static CommunicationActor.shared.getter();
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t result = swift_release();
      BOOL v12 = __OFADD__(v9, v10);
      v9 += v10;
      if (v12) {
        break;
      }
      if (v7 == ++v8)
      {
        swift_bridgeObjectRelease();
        goto LABEL_10;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_10:
    swift_bridgeObjectRelease();
    v13._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v13);
    swift_bridgeObjectRelease();
    v14._countAndFlagsBits = 0x736F746F687020;
    v14._object = (void *)0xE700000000000000;
    String.append(_:)(v14);
    swift_release();
    return v15;
  }
  return result;
}

uint64_t sub_1000B7E90@<X0>(uint64_t *a1@<X8>)
{
  swift_getAssociatedConformanceWitness();
  type metadata accessor for SyncedPhotosFace();
  uint64_t result = SyncedPhotosFace.photos.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000B7EF8@<X0>(uint64_t *a1@<X8>)
{
  swift_getAssociatedConformanceWitness();
  type metadata accessor for SyncedPhotosFace();
  uint64_t result = SyncedPhotosFace.contentDescription.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000B7F60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[11] = a2;
  v3[12] = a3;
  v3[10] = a1;
  uint64_t v4 = sub_100005CB0(&qword_1000F2E30);
  v3[13] = v4;
  v3[14] = *(void *)(v4 - 8);
  v3[15] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for ShuffleID();
  v3[16] = v5;
  v3[17] = *(void *)(v5 - 8);
  v3[18] = swift_task_alloc();
  v3[19] = swift_task_alloc();
  v3[20] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for Logger();
  v3[21] = v6;
  v3[22] = *(void *)(v6 - 8);
  v3[23] = swift_task_alloc();
  v3[24] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for UUID();
  v3[25] = v7;
  v3[26] = *(void *)(v7 - 8);
  v3[27] = swift_task_alloc();
  return _swift_task_switch(sub_1000B8168, 0, 0);
}

uint64_t sub_1000B8168()
{
  sub_1000CD730(&qword_1000F2810, (void (*)(uint64_t))&type metadata accessor for ShuffleID);
  dispatch thunk of PhotosFaceID.id.getter();
  uint64_t v1 = type metadata accessor for GalleryDatabase();
  v0[28] = v1;
  uint64_t v2 = sub_1000CD730(&qword_1000F2978, (void (*)(uint64_t))&type metadata accessor for GalleryDatabase);
  v0[29] = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[30] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_1000B82B4;
  uint64_t v4 = v0[27];
  return dispatch thunk of PhotosFaceIDDatabase.queryByDay(id:)(v4, v1, v2);
}

uint64_t sub_1000B82B4(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *(void *)(*v2 + 216);
  uint64_t v5 = *(void *)(*v2 + 208);
  uint64_t v6 = *(void *)(*v2 + 200);
  *(void *)(v3 + 248) = a1;
  *(void *)(v3 + 256) = v1;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  if (v1) {
    uint64_t v7 = sub_1000CDF54;
  }
  else {
    uint64_t v7 = sub_1000B8428;
  }
  return _swift_task_switch(v7, 0, 0);
}

uint64_t sub_1000B8428()
{
  v37 = v0;
  uint64_t v1 = v0[5].i64[0];
  uint64_t v2 = v0[10].i64[0];
  uint64_t v3 = v0[8].i64[0];
  uint64_t v4 = v0[8].i64[1];
  static Log.photos.getter();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v0[16].i64[1] = (uint64_t)v5;
  v0[17].i64[0] = (v4 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v5(v2, v1, v3);
  swift_bridgeObjectRetain();
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v6, v7))
  {
    log = v6;
    uint64_t v8 = v0[15].i64[1];
    uint64_t v33 = v0[11].i64[0];
    uint64_t v34 = v0[10].i64[1];
    uint64_t v35 = v0[12].i64[0];
    uint64_t v29 = v0[10].i64[0];
    os_log_type_t type = v7;
    uint64_t v9 = v0[9].i64[1];
    uint64_t v10 = v0[8].i64[0];
    uint64_t v11 = v0[8].i64[1];
    uint64_t v12 = swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 134218242;
    v0[4].i64[0] = *(void *)(v8 + 16);
    uint64_t v36 = v30;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2080;
    v5(v9, v29, v10);
    Swift::String v13 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v13(v29, v10);
    sub_1000CD730(&qword_1000F2838, (void (*)(uint64_t))&type metadata accessor for ShuffleID);
    uint64_t v14 = dispatch thunk of CustomStringConvertible.description.getter();
    unint64_t v16 = v15;
    v13(v9, v10);
    v0[4].i64[1] = sub_100007E88(v14, v16, &v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, log, type, "Found %ld days for face %s", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v33 + 8);
    v17(v35, v34);
  }
  else
  {
    uint64_t v18 = v0[12].i64[0];
    uint64_t v20 = v0[10].i64[1];
    uint64_t v19 = v0[11].i64[0];
    Swift::String v13 = *(void (**)(uint64_t, uint64_t))(v0[8].i64[1] + 8);
    v13(v0[10].i64[0], v0[8].i64[0]);
    swift_bridgeObjectRelease();

    uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
    v17(v18, v20);
  }
  v0[17].i64[1] = (uint64_t)v17;
  v0[18].i64[0] = (uint64_t)v13;
  uint64_t v21 = v0[6].i64[0];
  v0[3].i64[0] = v0[15].i64[1];
  uint64_t v22 = (int8x16_t *)swift_task_alloc();
  v0[18].i64[1] = (uint64_t)v22;
  v22[1] = vextq_s8(v0[5], v0[5], 8uLL);
  v22[2].i64[0] = v21;
  uint64_t v23 = swift_task_alloc();
  v0[19].i64[0] = v23;
  *(void *)(v23 + 16) = &unk_1000F3E50;
  *(void *)(v23 + 24) = v22;
  uint64_t v24 = (void *)swift_task_alloc();
  v0[19].i64[1] = (uint64_t)v24;
  uint64_t v25 = sub_100005CB0(&qword_1000F2A10);
  uint64_t v26 = sub_100005F48(&qword_1000F2A18, &qword_1000F2A10);
  *uint64_t v24 = v0;
  v24[1] = sub_1000B8828;
  uint64_t v27 = v0[6].i64[1];
  return Sequence.asyncMap<A>(predicate:)(&unk_1000F3E60, v23, v25, v27, v26);
}

uint64_t sub_1000B8828(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 320) = a1;
  *(void *)(v3 + 328) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = sub_1000CDF28;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = sub_1000CDF58;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_1000B8960(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[11] = a2;
  v3[12] = a3;
  v3[10] = a1;
  uint64_t v4 = sub_100005CB0(&qword_1000F2E30);
  v3[13] = v4;
  v3[14] = *(void *)(v4 - 8);
  v3[15] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for ShuffleID();
  v3[16] = v5;
  v3[17] = *(void *)(v5 - 8);
  v3[18] = swift_task_alloc();
  v3[19] = swift_task_alloc();
  v3[20] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for Logger();
  v3[21] = v6;
  v3[22] = *(void *)(v6 - 8);
  v3[23] = swift_task_alloc();
  v3[24] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for UUID();
  v3[25] = v7;
  v3[26] = *(void *)(v7 - 8);
  v3[27] = swift_task_alloc();
  return _swift_task_switch(sub_1000B8B68, 0, 0);
}

uint64_t sub_1000B8B68()
{
  sub_1000CD730(&qword_1000F2810, (void (*)(uint64_t))&type metadata accessor for ShuffleID);
  dispatch thunk of PhotosFaceID.id.getter();
  uint64_t v1 = type metadata accessor for ShuffleDatabase();
  v0[28] = v1;
  uint64_t v2 = sub_1000CD730(&qword_1000F2AB8, (void (*)(uint64_t))&type metadata accessor for ShuffleDatabase);
  v0[29] = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[30] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_1000B8CB4;
  uint64_t v4 = v0[27];
  return dispatch thunk of PhotosFaceIDDatabase.queryByDay(id:)(v4, v1, v2);
}

uint64_t sub_1000B8CB4(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *(void *)(*v2 + 216);
  uint64_t v5 = *(void *)(*v2 + 208);
  uint64_t v6 = *(void *)(*v2 + 200);
  *(void *)(v3 + 248) = a1;
  *(void *)(v3 + 256) = v1;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  if (v1) {
    uint64_t v7 = sub_1000CDF54;
  }
  else {
    uint64_t v7 = sub_1000B8E28;
  }
  return _swift_task_switch(v7, 0, 0);
}

uint64_t sub_1000B8E28()
{
  v37 = v0;
  uint64_t v1 = v0[5].i64[0];
  uint64_t v2 = v0[10].i64[0];
  uint64_t v3 = v0[8].i64[0];
  uint64_t v4 = v0[8].i64[1];
  static Log.photos.getter();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v0[16].i64[1] = (uint64_t)v5;
  v0[17].i64[0] = (v4 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v5(v2, v1, v3);
  swift_bridgeObjectRetain();
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v6, v7))
  {
    log = v6;
    uint64_t v8 = v0[15].i64[1];
    uint64_t v33 = v0[11].i64[0];
    uint64_t v34 = v0[10].i64[1];
    uint64_t v35 = v0[12].i64[0];
    uint64_t v29 = v0[10].i64[0];
    os_log_type_t type = v7;
    uint64_t v9 = v0[9].i64[1];
    uint64_t v10 = v0[8].i64[0];
    uint64_t v11 = v0[8].i64[1];
    uint64_t v12 = swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 134218242;
    v0[4].i64[0] = *(void *)(v8 + 16);
    uint64_t v36 = v30;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2080;
    v5(v9, v29, v10);
    Swift::String v13 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v13(v29, v10);
    sub_1000CD730(&qword_1000F2838, (void (*)(uint64_t))&type metadata accessor for ShuffleID);
    uint64_t v14 = dispatch thunk of CustomStringConvertible.description.getter();
    unint64_t v16 = v15;
    v13(v9, v10);
    v0[4].i64[1] = sub_100007E88(v14, v16, &v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, log, type, "Found %ld days for face %s", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v33 + 8);
    v17(v35, v34);
  }
  else
  {
    uint64_t v18 = v0[12].i64[0];
    uint64_t v20 = v0[10].i64[1];
    uint64_t v19 = v0[11].i64[0];
    Swift::String v13 = *(void (**)(uint64_t, uint64_t))(v0[8].i64[1] + 8);
    v13(v0[10].i64[0], v0[8].i64[0]);
    swift_bridgeObjectRelease();

    uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
    v17(v18, v20);
  }
  v0[17].i64[1] = (uint64_t)v17;
  v0[18].i64[0] = (uint64_t)v13;
  uint64_t v21 = v0[6].i64[0];
  v0[3].i64[0] = v0[15].i64[1];
  uint64_t v22 = (int8x16_t *)swift_task_alloc();
  v0[18].i64[1] = (uint64_t)v22;
  v22[1] = vextq_s8(v0[5], v0[5], 8uLL);
  v22[2].i64[0] = v21;
  uint64_t v23 = swift_task_alloc();
  v0[19].i64[0] = v23;
  *(void *)(v23 + 16) = &unk_1000F3FB8;
  *(void *)(v23 + 24) = v22;
  uint64_t v24 = (void *)swift_task_alloc();
  v0[19].i64[1] = (uint64_t)v24;
  uint64_t v25 = sub_100005CB0(&qword_1000F2A10);
  uint64_t v26 = sub_100005F48(&qword_1000F2A18, &qword_1000F2A10);
  *uint64_t v24 = v0;
  v24[1] = sub_1000B9228;
  uint64_t v27 = v0[6].i64[1];
  return Sequence.asyncMap<A>(predicate:)(&unk_1000F3FC8, v23, v25, v27, v26);
}

uint64_t sub_1000B9228(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 320) = a1;
  *(void *)(v3 + 328) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = sub_1000CDF28;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = sub_1000B9360;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_1000B9360()
{
  v62 = v0;
  uint64_t v1 = (void (*)(uint64_t, uint64_t, uint64_t))v0[33];
  uint64_t v2 = v0[18];
  uint64_t v3 = v0[16];
  uint64_t v4 = v0[10];
  static Log.session.getter();
  v1(v2, v4, v3);
  swift_bridgeObjectRetain_n();
  swift_retain();
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    os_log_type_t v49 = v6;
    log = v5;
    v47 = (void (*)(uint64_t, uint64_t, uint64_t))v0[33];
    uint64_t v55 = v0[29];
    uint64_t v57 = v0[40];
    v52 = (void (*)(uint64_t, uint64_t))v0[36];
    uint64_t v54 = v0[28];
    uint64_t v8 = v0[18];
    uint64_t v7 = v0[19];
    uint64_t v9 = v0[16];
    uint64_t v10 = swift_slowAlloc();
    uint64_t v60 = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 136315650;
    uint64_t v11 = PhotosFaceType.description.getter();
    v0[4] = sub_100007E88(v11, v12, &v60);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_release();
    *(_WORD *)(v10 + 12) = 2080;
    v47(v7, v8, v9);
    v52(v8, v9);
    sub_1000CD730(&qword_1000F2838, (void (*)(uint64_t))&type metadata accessor for ShuffleID);
    uint64_t v13 = dispatch thunk of CustomStringConvertible.description.getter();
    unint64_t v15 = v14;
    v52(v7, v9);
    v0[5] = sub_100007E88(v13, v15, &v60);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v48 = (uint8_t *)v10;
    *(_WORD *)(v10 + 22) = 2080;
    unint64_t v16 = (void *)swift_task_alloc();
    *unint64_t v16 = v9;
    v16[1] = type metadata accessor for ShuffleProvider();
    v16[2] = v54;
    v16[3] = sub_1000CD730(&qword_1000F3DC8, (void (*)(uint64_t))type metadata accessor for ShuffleProvider);
    v16[4] = v55;
    uint64_t KeyPath = swift_getKeyPath();
    swift_task_dealloc();
    int64_t v18 = *(void *)(v57 + 16);
    uint64_t v19 = v0[40];
    if (v18)
    {
      v58 = v0;
      uint64_t v20 = v0[14];
      v61 = _swiftEmptyArrayStorage;
      sub_100054958(0, v18, 0);
      uint64_t v21 = *(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16);
      v20 += 16;
      uint64_t v22 = v19 + ((*(unsigned __int8 *)(v20 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 64));
      uint64_t v51 = *(void *)(v20 + 56);
      v53 = v21;
      uint64_t v23 = (void (**)(uint64_t, uint64_t))(v20 - 8);
      do
      {
        uint64_t v24 = v58[15];
        uint64_t v25 = v58[13];
        v53(v24, v22, v25);
        uint64_t v26 = KeyPath;
        swift_getAtKeyPath();
        uint64_t v28 = v58[2];
        uint64_t v27 = v58[3];
        (*v23)(v24, v25);
        uint64_t v29 = v61;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_100054958(0, v29[2] + 1, 1);
          uint64_t v29 = v61;
        }
        unint64_t v31 = v29[2];
        unint64_t v30 = v29[3];
        if (v31 >= v30 >> 1)
        {
          sub_100054958(v30 > 1, v31 + 1, 1);
          uint64_t v29 = v61;
        }
        v29[2] = v31 + 1;
        v32 = &v29[2 * v31];
        v32[4] = v28;
        v32[5] = v27;
        v22 += v51;
        --v18;
        uint64_t KeyPath = v26;
      }
      while (v18);
      uint64_t v0 = v58;
      swift_release();
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_release();
      swift_bridgeObjectRelease();
    }
    v59 = (void (*)(uint64_t, uint64_t))v0[35];
    uint64_t v39 = v0[23];
    uint64_t v40 = v0[21];
    uint64_t v41 = Array.description.getter();
    unint64_t v43 = v42;
    swift_bridgeObjectRelease();
    v0[7] = sub_100007E88(v41, v43, &v60);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, log, v49, "  %s %s: %s", v48, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v37 = v39;
    uint64_t v38 = v40;
  }
  else
  {
    uint64_t v33 = (void (*)(uint64_t, uint64_t))v0[36];
    uint64_t v56 = v0[23];
    v59 = (void (*)(uint64_t, uint64_t))v0[35];
    uint64_t v34 = v0[21];
    uint64_t v35 = v0[18];
    uint64_t v36 = v0[16];
    swift_bridgeObjectRelease();
    v33(v35, v36);
    swift_release();
    swift_bridgeObjectRelease();

    uint64_t v37 = v56;
    uint64_t v38 = v34;
  }
  v59(v37, v38);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v44 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v45 = v0[40];
  return v44(v45);
}

uint64_t sub_1000B9964(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[11] = a2;
  v3[12] = a3;
  v3[10] = a1;
  uint64_t v4 = sub_100005CB0((uint64_t *)&unk_1000F3A80);
  v3[13] = v4;
  v3[14] = *(void *)(v4 - 8);
  v3[15] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for AlbumID();
  v3[16] = v5;
  v3[17] = *(void *)(v5 - 8);
  v3[18] = swift_task_alloc();
  v3[19] = swift_task_alloc();
  v3[20] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for Logger();
  v3[21] = v6;
  v3[22] = *(void *)(v6 - 8);
  v3[23] = swift_task_alloc();
  v3[24] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for UUID();
  v3[25] = v7;
  v3[26] = *(void *)(v7 - 8);
  v3[27] = swift_task_alloc();
  return _swift_task_switch(sub_1000B9B6C, 0, 0);
}

uint64_t sub_1000B9B6C()
{
  sub_1000CD730(&qword_1000F26F8, (void (*)(uint64_t))&type metadata accessor for AlbumID);
  dispatch thunk of PhotosFaceID.id.getter();
  uint64_t v1 = type metadata accessor for AlbumDatabase();
  v0[28] = v1;
  uint64_t v2 = sub_1000CD730(&qword_1000F2B20, (void (*)(uint64_t))&type metadata accessor for AlbumDatabase);
  v0[29] = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[30] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_1000B9CB8;
  uint64_t v4 = v0[27];
  return dispatch thunk of PhotosFaceIDDatabase.queryByDay(id:)(v4, v1, v2);
}

uint64_t sub_1000B9CB8(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *(void *)(*v2 + 216);
  uint64_t v5 = *(void *)(*v2 + 208);
  uint64_t v6 = *(void *)(*v2 + 200);
  *(void *)(v3 + 248) = a1;
  *(void *)(v3 + 256) = v1;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  if (v1) {
    uint64_t v7 = sub_1000BA22C;
  }
  else {
    uint64_t v7 = sub_1000B9E2C;
  }
  return _swift_task_switch(v7, 0, 0);
}

uint64_t sub_1000B9E2C()
{
  uint64_t v37 = v0;
  uint64_t v1 = v0[5].i64[0];
  uint64_t v2 = v0[10].i64[0];
  uint64_t v3 = v0[8].i64[0];
  uint64_t v4 = v0[8].i64[1];
  static Log.photos.getter();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v0[16].i64[1] = (uint64_t)v5;
  v0[17].i64[0] = (v4 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v5(v2, v1, v3);
  swift_bridgeObjectRetain();
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v6, v7))
  {
    log = v6;
    uint64_t v8 = v0[15].i64[1];
    uint64_t v33 = v0[11].i64[0];
    uint64_t v34 = v0[10].i64[1];
    uint64_t v35 = v0[12].i64[0];
    uint64_t v29 = v0[10].i64[0];
    os_log_type_t type = v7;
    uint64_t v9 = v0[9].i64[1];
    uint64_t v10 = v0[8].i64[0];
    uint64_t v11 = v0[8].i64[1];
    uint64_t v12 = swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 134218242;
    v0[4].i64[0] = *(void *)(v8 + 16);
    uint64_t v36 = v30;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2080;
    v5(v9, v29, v10);
    uint64_t v13 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v13(v29, v10);
    sub_1000CD730(&qword_1000F2738, (void (*)(uint64_t))&type metadata accessor for AlbumID);
    uint64_t v14 = dispatch thunk of CustomStringConvertible.description.getter();
    unint64_t v16 = v15;
    v13(v9, v10);
    v0[4].i64[1] = sub_100007E88(v14, v16, &v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, log, type, "Found %ld days for face %s", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v33 + 8);
    v17(v35, v34);
  }
  else
  {
    uint64_t v18 = v0[12].i64[0];
    uint64_t v20 = v0[10].i64[1];
    uint64_t v19 = v0[11].i64[0];
    uint64_t v13 = *(void (**)(uint64_t, uint64_t))(v0[8].i64[1] + 8);
    v13(v0[10].i64[0], v0[8].i64[0]);
    swift_bridgeObjectRelease();

    uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
    v17(v18, v20);
  }
  v0[17].i64[1] = (uint64_t)v17;
  v0[18].i64[0] = (uint64_t)v13;
  uint64_t v21 = v0[6].i64[0];
  v0[3].i64[0] = v0[15].i64[1];
  uint64_t v22 = (int8x16_t *)swift_task_alloc();
  v0[18].i64[1] = (uint64_t)v22;
  v22[1] = vextq_s8(v0[5], v0[5], 8uLL);
  v22[2].i64[0] = v21;
  uint64_t v23 = swift_task_alloc();
  v0[19].i64[0] = v23;
  *(void *)(v23 + 16) = &unk_1000F4178;
  *(void *)(v23 + 24) = v22;
  uint64_t v24 = (void *)swift_task_alloc();
  v0[19].i64[1] = (uint64_t)v24;
  uint64_t v25 = sub_100005CB0(&qword_1000F2A10);
  uint64_t v26 = sub_100005F48(&qword_1000F2A18, &qword_1000F2A10);
  *uint64_t v24 = v0;
  v24[1] = sub_1000BA2E8;
  uint64_t v27 = v0[6].i64[1];
  return Sequence.asyncMap<A>(predicate:)(&unk_1000F4188, v23, v25, v27, v26);
}

uint64_t sub_1000BA22C()
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

uint64_t sub_1000BA2E8(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 320) = a1;
  *(void *)(v3 + 328) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = sub_1000BAA24;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = sub_1000BA420;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_1000BA420()
{
  v62 = v0;
  uint64_t v1 = (void (*)(uint64_t, uint64_t, uint64_t))v0[33];
  uint64_t v2 = v0[18];
  uint64_t v3 = v0[16];
  uint64_t v4 = v0[10];
  static Log.session.getter();
  v1(v2, v4, v3);
  swift_bridgeObjectRetain_n();
  swift_retain();
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    os_log_type_t v49 = v6;
    log = v5;
    v47 = (void (*)(uint64_t, uint64_t, uint64_t))v0[33];
    uint64_t v55 = v0[29];
    uint64_t v57 = v0[40];
    v52 = (void (*)(uint64_t, uint64_t))v0[36];
    uint64_t v54 = v0[28];
    uint64_t v8 = v0[18];
    uint64_t v7 = v0[19];
    uint64_t v9 = v0[16];
    uint64_t v10 = swift_slowAlloc();
    uint64_t v60 = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 136315650;
    uint64_t v11 = PhotosFaceType.description.getter();
    v0[4] = sub_100007E88(v11, v12, &v60);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_release();
    *(_WORD *)(v10 + 12) = 2080;
    v47(v7, v8, v9);
    v52(v8, v9);
    sub_1000CD730(&qword_1000F2738, (void (*)(uint64_t))&type metadata accessor for AlbumID);
    uint64_t v13 = dispatch thunk of CustomStringConvertible.description.getter();
    unint64_t v15 = v14;
    v52(v7, v9);
    v0[5] = sub_100007E88(v13, v15, &v60);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v48 = (uint8_t *)v10;
    *(_WORD *)(v10 + 22) = 2080;
    unint64_t v16 = (void *)swift_task_alloc();
    *unint64_t v16 = v9;
    v16[1] = type metadata accessor for AlbumProvider();
    v16[2] = v54;
    v16[3] = sub_1000CD730(&qword_1000F4100, (void (*)(uint64_t))type metadata accessor for AlbumProvider);
    v16[4] = v55;
    uint64_t KeyPath = swift_getKeyPath();
    swift_task_dealloc();
    int64_t v18 = *(void *)(v57 + 16);
    uint64_t v19 = v0[40];
    if (v18)
    {
      v58 = v0;
      uint64_t v20 = v0[14];
      v61 = _swiftEmptyArrayStorage;
      sub_100054958(0, v18, 0);
      uint64_t v21 = *(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16);
      v20 += 16;
      uint64_t v22 = v19 + ((*(unsigned __int8 *)(v20 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 64));
      uint64_t v51 = *(void *)(v20 + 56);
      v53 = v21;
      uint64_t v23 = (void (**)(uint64_t, uint64_t))(v20 - 8);
      do
      {
        uint64_t v24 = v58[15];
        uint64_t v25 = v58[13];
        v53(v24, v22, v25);
        uint64_t v26 = KeyPath;
        swift_getAtKeyPath();
        uint64_t v28 = v58[2];
        uint64_t v27 = v58[3];
        (*v23)(v24, v25);
        uint64_t v29 = v61;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_100054958(0, v29[2] + 1, 1);
          uint64_t v29 = v61;
        }
        unint64_t v31 = v29[2];
        unint64_t v30 = v29[3];
        if (v31 >= v30 >> 1)
        {
          sub_100054958(v30 > 1, v31 + 1, 1);
          uint64_t v29 = v61;
        }
        v29[2] = v31 + 1;
        v32 = &v29[2 * v31];
        v32[4] = v28;
        v32[5] = v27;
        v22 += v51;
        --v18;
        uint64_t KeyPath = v26;
      }
      while (v18);
      uint64_t v0 = v58;
      swift_release();
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_release();
      swift_bridgeObjectRelease();
    }
    v59 = (void (*)(uint64_t, uint64_t))v0[35];
    uint64_t v39 = v0[23];
    uint64_t v40 = v0[21];
    uint64_t v41 = Array.description.getter();
    unint64_t v43 = v42;
    swift_bridgeObjectRelease();
    v0[7] = sub_100007E88(v41, v43, &v60);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, log, v49, "  %s %s: %s", v48, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v37 = v39;
    uint64_t v38 = v40;
  }
  else
  {
    uint64_t v33 = (void (*)(uint64_t, uint64_t))v0[36];
    uint64_t v56 = v0[23];
    v59 = (void (*)(uint64_t, uint64_t))v0[35];
    uint64_t v34 = v0[21];
    uint64_t v35 = v0[18];
    uint64_t v36 = v0[16];
    swift_bridgeObjectRelease();
    v33(v35, v36);
    swift_release();
    swift_bridgeObjectRelease();

    uint64_t v37 = v56;
    uint64_t v38 = v34;
  }
  v59(v37, v38);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v44 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v45 = v0[40];
  return v44(v45);
}

uint64_t sub_1000BAA24()
{
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
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

uint64_t sub_1000BAAFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[16] = a5;
  v6[17] = a6;
  v6[14] = a3;
  v6[15] = a4;
  v6[12] = a1;
  v6[13] = a2;
  uint64_t v7 = type metadata accessor for ShuffleID();
  v6[18] = v7;
  v6[19] = *(void *)(v7 - 8);
  v6[20] = swift_task_alloc();
  v6[21] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for Logger();
  v6[22] = v8;
  v6[23] = *(void *)(v8 - 8);
  v6[24] = swift_task_alloc();
  return _swift_task_switch(sub_1000BAC30, 0, 0);
}

uint64_t sub_1000BAC30()
{
  uint64_t v1 = sub_100081090(v0[14]);
  v0[25] = (uint64_t)v1;
  uint64_t v2 = (void *)swift_task_alloc();
  v0[26] = (uint64_t)v2;
  void *v2 = v0;
  v2[1] = sub_1000BACE4;
  return sub_100057B88((uint64_t)v1);
}

uint64_t sub_1000BACE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)*v3;
  v4[2] = v3;
  v4[3] = a1;
  v4[4] = a2;
  v4[5] = v2;
  v4[27] = a2;
  v4[28] = v2;
  swift_task_dealloc();
  if (v2)
  {
    uint64_t v5 = sub_1000CDED4;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v5 = sub_1000CDF5C;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_1000BAE08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[16] = a5;
  v6[17] = a6;
  v6[14] = a3;
  v6[15] = a4;
  v6[12] = a1;
  v6[13] = a2;
  uint64_t v7 = type metadata accessor for ShuffleID();
  v6[18] = v7;
  v6[19] = *(void *)(v7 - 8);
  v6[20] = swift_task_alloc();
  v6[21] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for Logger();
  v6[22] = v8;
  v6[23] = *(void *)(v8 - 8);
  v6[24] = swift_task_alloc();
  return _swift_task_switch(sub_1000BAF3C, 0, 0);
}

uint64_t sub_1000BAF3C()
{
  uint64_t v1 = sub_100081090(v0[14]);
  v0[25] = (uint64_t)v1;
  uint64_t v2 = (void *)swift_task_alloc();
  v0[26] = (uint64_t)v2;
  void *v2 = v0;
  v2[1] = sub_1000BAFF0;
  return sub_100057B88((uint64_t)v1);
}

uint64_t sub_1000BAFF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)*v3;
  v4[2] = v3;
  v4[3] = a1;
  v4[4] = a2;
  v4[5] = v2;
  v4[27] = a2;
  v4[28] = v2;
  swift_task_dealloc();
  if (v2)
  {
    uint64_t v5 = sub_1000CDED4;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v5 = sub_1000BB114;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_1000BB114()
{
  unint64_t v43 = v0;
  uint64_t v1 = v0[27];
  if (*(void *)(v1 + 16))
  {
    uint64_t v2 = v0[21];
    uint64_t v3 = v0[18];
    uint64_t v4 = v0[19];
    uint64_t v5 = v0[16];
    static Log.photos.getter();
    uint64_t v41 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
    v41(v2, v5, v3);
    swift_bridgeObjectRetain_n();
    os_log_type_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = static os_log_type_t.error.getter();
    BOOL v8 = os_log_type_enabled(v6, v7);
    uint64_t v9 = v0[23];
    uint64_t v10 = v0[24];
    uint64_t v12 = v0[21];
    uint64_t v11 = v0[22];
    if (v8)
    {
      uint64_t v39 = v0[23];
      uint64_t v40 = v0[24];
      log = v6;
      uint64_t v14 = v0[19];
      uint64_t v13 = v0[20];
      os_log_type_t type = v7;
      uint64_t v15 = v0[18];
      uint64_t v35 = v0[13];
      uint64_t v38 = v0[22];
      uint64_t v16 = swift_slowAlloc();
      v42[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v16 = 134218754;
      v0[8] = *(void *)(v1 + 16);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v16 + 12) = 2048;
      v0[9] = v35;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v16 + 22) = 2080;
      v41(v13, v12, v15);
      uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
      v17(v12, v15);
      sub_1000CD730(&qword_1000F2838, (void (*)(uint64_t))&type metadata accessor for ShuffleID);
      uint64_t v18 = dispatch thunk of CustomStringConvertible.description.getter();
      unint64_t v20 = v19;
      v17(v13, v15);
      v0[10] = sub_100007E88(v18, v20, v42);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v16 + 32) = 2080;
      type metadata accessor for UUID();
      swift_bridgeObjectRetain();
      uint64_t v21 = Array.description.getter();
      unint64_t v23 = v22;
      swift_bridgeObjectRelease();
      v0[11] = sub_100007E88(v21, v23, v42);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, log, type, "Ignoring %ld uncached photos on %ld for face %s: %s", (uint8_t *)v16, 0x2Au);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v40, v38);
    }
    else
    {
      (*(void (**)(void, void))(v0[19] + 8))(v0[21], v0[18]);
      swift_bridgeObjectRelease_n();

      (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v10, v11);
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  uint64_t v24 = v0[3];
  uint64_t v25 = v0[20];
  uint64_t v26 = v0[18];
  uint64_t v27 = v0[19];
  uint64_t v29 = v0[16];
  uint64_t v28 = v0[17];
  swift_bridgeObjectRetain();
  uint64_t v30 = swift_bridgeObjectRetain();
  sub_1000C99A8(v30, v28);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v31 = sub_100081090(v24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v32 = sub_1000C66E4((uint64_t)v31, v28);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 16))(v25, v29, v26);
  sub_10005F660(v32);
  swift_release();
  sub_1000CD730(&qword_1000F2810, (void (*)(uint64_t))&type metadata accessor for ShuffleID);
  default argument 4 of SyncedPhotosFace.init(id:day:uncached:cached:complete:)();
  SyncedPhotosFace.init(id:day:uncached:cached:complete:)();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v33 = (uint64_t (*)(void))v0[1];
  return v33();
}

uint64_t sub_1000BB60C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[16] = a5;
  v6[17] = a6;
  v6[14] = a3;
  v6[15] = a4;
  v6[12] = a1;
  v6[13] = a2;
  uint64_t v7 = type metadata accessor for AlbumID();
  v6[18] = v7;
  v6[19] = *(void *)(v7 - 8);
  v6[20] = swift_task_alloc();
  v6[21] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for Logger();
  v6[22] = v8;
  v6[23] = *(void *)(v8 - 8);
  v6[24] = swift_task_alloc();
  return _swift_task_switch(sub_1000BB740, 0, 0);
}

uint64_t sub_1000BB740()
{
  uint64_t v1 = sub_100081090(v0[14]);
  v0[25] = (uint64_t)v1;
  uint64_t v2 = (void *)swift_task_alloc();
  v0[26] = (uint64_t)v2;
  void *v2 = v0;
  v2[1] = sub_1000BB7F4;
  return sub_100057B88((uint64_t)v1);
}

uint64_t sub_1000BB7F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)*v3;
  v4[2] = v3;
  v4[3] = a1;
  v4[4] = a2;
  v4[5] = v2;
  v4[27] = a2;
  v4[28] = v2;
  swift_task_dealloc();
  if (v2)
  {
    uint64_t v5 = sub_1000BBE10;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v5 = sub_1000BB918;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_1000BB918()
{
  unint64_t v43 = v0;
  uint64_t v1 = v0[27];
  if (*(void *)(v1 + 16))
  {
    uint64_t v2 = v0[21];
    uint64_t v3 = v0[18];
    uint64_t v4 = v0[19];
    uint64_t v5 = v0[16];
    static Log.photos.getter();
    uint64_t v41 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
    v41(v2, v5, v3);
    swift_bridgeObjectRetain_n();
    os_log_type_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = static os_log_type_t.error.getter();
    BOOL v8 = os_log_type_enabled(v6, v7);
    uint64_t v9 = v0[23];
    uint64_t v10 = v0[24];
    uint64_t v12 = v0[21];
    uint64_t v11 = v0[22];
    if (v8)
    {
      uint64_t v39 = v0[23];
      uint64_t v40 = v0[24];
      log = v6;
      uint64_t v14 = v0[19];
      uint64_t v13 = v0[20];
      os_log_type_t type = v7;
      uint64_t v15 = v0[18];
      uint64_t v35 = v0[13];
      uint64_t v38 = v0[22];
      uint64_t v16 = swift_slowAlloc();
      v42[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v16 = 134218754;
      v0[8] = *(void *)(v1 + 16);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v16 + 12) = 2048;
      v0[9] = v35;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v16 + 22) = 2080;
      v41(v13, v12, v15);
      uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
      v17(v12, v15);
      sub_1000CD730(&qword_1000F2738, (void (*)(uint64_t))&type metadata accessor for AlbumID);
      uint64_t v18 = dispatch thunk of CustomStringConvertible.description.getter();
      unint64_t v20 = v19;
      v17(v13, v15);
      v0[10] = sub_100007E88(v18, v20, v42);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v16 + 32) = 2080;
      type metadata accessor for UUID();
      swift_bridgeObjectRetain();
      uint64_t v21 = Array.description.getter();
      unint64_t v23 = v22;
      swift_bridgeObjectRelease();
      v0[11] = sub_100007E88(v21, v23, v42);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, log, type, "Ignoring %ld uncached photos on %ld for face %s: %s", (uint8_t *)v16, 0x2Au);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v40, v38);
    }
    else
    {
      (*(void (**)(void, void))(v0[19] + 8))(v0[21], v0[18]);
      swift_bridgeObjectRelease_n();

      (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v10, v11);
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  uint64_t v24 = v0[3];
  uint64_t v25 = v0[20];
  uint64_t v26 = v0[18];
  uint64_t v27 = v0[19];
  uint64_t v29 = v0[16];
  uint64_t v28 = v0[17];
  swift_bridgeObjectRetain();
  uint64_t v30 = swift_bridgeObjectRetain();
  sub_1000C99A8(v30, v28);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v31 = sub_100081090(v24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v32 = sub_1000C66E4((uint64_t)v31, v28);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 16))(v25, v29, v26);
  sub_10005F660(v32);
  swift_release();
  sub_1000CD730(&qword_1000F26F8, (void (*)(uint64_t))&type metadata accessor for AlbumID);
  default argument 4 of SyncedPhotosFace.init(id:day:uncached:cached:complete:)();
  SyncedPhotosFace.init(id:day:uncached:cached:complete:)();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v33 = (uint64_t (*)(void))v0[1];
  return v33();
}

uint64_t sub_1000BBE10()
{
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void *sub_1000BBE98()
{
  uint64_t v1 = (void *)v0;
  *(void *)(v0 + 32) = sub_1000554A8((uint64_t)&_swiftEmptyArrayStorage);
  *(void *)(v0 + 40) = sub_1000555B0((uint64_t)&_swiftEmptyArrayStorage);
  *(unsigned char *)(v0 + 48) = 0;
  uint64_t v2 = (void *)_emptyDequeStorage.unsafeMutableAddressor();
  v1[7] = *v2;
  type metadata accessor for OutgoingConnectionManager();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = 0;
  uint64_t v4 = v3 + OBJC_IVAR____TtC11photosfaced25OutgoingConnectionManager_lastOutgoingLocation;
  uint64_t v5 = sub_100005CB0((uint64_t *)&unk_1000F2518);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  swift_retain();
  if (((unint64_t)&_swiftEmptyArrayStorage & 0xC000000000000000) != 0 && _CocoaArrayWrapper.endIndex.getter()) {
    os_log_type_t v6 = (void *)sub_1000C7B94((unint64_t)&_swiftEmptyArrayStorage);
  }
  else {
    os_log_type_t v6 = &_swiftEmptySetSingleton;
  }
  *(void *)(v3 + OBJC_IVAR____TtC11photosfaced25OutgoingConnectionManager_outgoingConnections) = v6;
  *(void *)(v3 + OBJC_IVAR____TtC11photosfaced25OutgoingConnectionManager_waiters) = *v2;
  v1[2] = v3;
  type metadata accessor for IncomingConnectionManager();
  swift_allocObject();
  swift_retain();
  v1[3] = sub_10000A8FC();
  sub_100005CB0(&qword_1000F41E0);
  type metadata accessor for MessageBody();
  default argument 0 of MessageDemultiplexer.init(timeout:logTag:)();
  v1[8] = MessageDemultiplexer.__allocating_init(timeout:logTag:)();
  return v1;
}

void sub_1000BC03C()
{
  type metadata accessor for CommunicationActor();
  static CommunicationActor.shared.getter();
  sub_1000CD730(&qword_1000F1F70, (void (*)(uint64_t))&type metadata accessor for CommunicationActor);
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = swift_allocObject();
  swift_weakInit();
  swift_retain();
  static CommunicationActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_beginAccess();
  uint64_t v3 = *(void *)(v1 + 32);
  *(void *)(v1 + 32) = &unk_1000F3C58;
  *(void *)(v1 + 40) = v2;
  sub_10000CFD8(v3);
  swift_release();
  swift_release();
  static CommunicationActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = (void *)static CommunicationActor.sharedQueue.getter();
  NWListener.start(queue:)();
  swift_release();
  swift_release();
}

uint64_t sub_1000BC23C(uint64_t a1, uint64_t a2)
{
  v2[5] = a1;
  v2[6] = a2;
  type metadata accessor for CommunicationActor();
  v2[7] = static CommunicationActor.shared.getter();
  sub_1000CD730(&qword_1000F1F70, (void (*)(uint64_t))&type metadata accessor for CommunicationActor);
  uint64_t v4 = dispatch thunk of Actor.unownedExecutor.getter();
  v2[8] = v4;
  v2[9] = v3;
  return _swift_task_switch(sub_1000BC304, v4, v3);
}

uint64_t sub_1000BC304()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  v0[10] = Strong;
  if (Strong)
  {
    uint64_t v2 = (void *)swift_task_alloc();
    v0[11] = v2;
    void *v2 = v0;
    v2[1] = sub_1000BC400;
    uint64_t v3 = v0[5];
    return sub_1000BC5A4(v3);
  }
  else
  {
    swift_release();
    uint64_t v5 = (uint64_t (*)(void))v0[1];
    return v5();
  }
}

uint64_t sub_1000BC400()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 72);
  uint64_t v3 = *(void *)(v1 + 64);
  return _swift_task_switch(sub_1000BC544, v3, v2);
}

uint64_t sub_1000BC544()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000BC5A4(uint64_t a1)
{
  v2[21] = a1;
  v2[22] = v1;
  uint64_t v3 = type metadata accessor for Message.Operation();
  v2[23] = v3;
  v2[24] = *(void *)(v3 - 8);
  v2[25] = swift_task_alloc();
  v2[26] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for Logger();
  v2[27] = v4;
  v2[28] = *(void *)(v4 - 8);
  v2[29] = swift_task_alloc();
  v2[30] = swift_task_alloc();
  v2[31] = swift_task_alloc();
  v2[32] = swift_task_alloc();
  v2[33] = swift_task_alloc();
  v2[34] = swift_task_alloc();
  v2[35] = swift_task_alloc();
  v2[36] = swift_task_alloc();
  v2[37] = swift_task_alloc();
  v2[38] = swift_task_alloc();
  v2[39] = swift_task_alloc();
  v2[40] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for Message();
  v2[41] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v2[42] = v6;
  v2[43] = *(void *)(v6 + 64);
  v2[44] = swift_task_alloc();
  v2[45] = swift_task_alloc();
  v2[46] = swift_task_alloc();
  v2[47] = swift_task_alloc();
  v2[48] = swift_task_alloc();
  v2[49] = swift_task_alloc();
  v2[50] = swift_task_alloc();
  v2[51] = swift_task_alloc();
  v2[52] = swift_task_alloc();
  v2[53] = swift_task_alloc();
  v2[54] = swift_task_alloc();
  v2[55] = swift_task_alloc();
  v2[56] = swift_task_alloc();
  v2[57] = swift_task_alloc();
  v2[58] = swift_task_alloc();
  v2[59] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for ProtocolVersion();
  v2[60] = v7;
  v2[61] = *(void *)(v7 - 8);
  v2[62] = swift_task_alloc();
  v2[63] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for MessageBody();
  v2[64] = v8;
  v2[65] = *(void *)(v8 - 8);
  v2[66] = swift_task_alloc();
  v2[67] = swift_task_alloc();
  v2[68] = swift_task_alloc();
  v2[69] = swift_task_alloc();
  v2[70] = type metadata accessor for CommunicationActor();
  v2[71] = static CommunicationActor.shared.getter();
  v2[72] = sub_1000CD730(&qword_1000F1F70, (void (*)(uint64_t))&type metadata accessor for CommunicationActor);
  uint64_t v10 = dispatch thunk of Actor.unownedExecutor.getter();
  v2[73] = v10;
  v2[74] = v9;
  return _swift_task_switch(sub_1000BC9D4, v10, v9);
}

uint64_t sub_1000BC9D4()
{
  v332 = v0;
  uint64_t v1 = v0 + 21;
  uint64_t v288 = v0[21];
  uint64_t v2 = v0[69];
  uint64_t v3 = v0[64];
  uint64_t v4 = v0[65];
  uint64_t v6 = v0[62];
  uint64_t v5 = v0[63];
  uint64_t v7 = v0[60];
  uint64_t v8 = v1[40];
  uint64_t v306 = v1[38];
  uint64_t v9 = v1[21];
  uint64_t v296 = v1[20];
  Message.content.getter();
  MessageBody.version.getter();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v1[54] = v10;
  v1[55] = (v4 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v274 = v10;
  v10(v2, v3);
  v267 = *(void (**)(uint64_t, void, uint64_t))(v8 + 104);
  v267(v6, enum case for ProtocolVersion.V0(_:), v7);
  sub_1000CD730(&qword_1000F3C68, (void (*)(uint64_t))&type metadata accessor for ProtocolVersion);
  dispatch thunk of RawRepresentable.rawValue.getter();
  dispatch thunk of RawRepresentable.rawValue.getter();
  int logb = *((_DWORD *)v1 + 144);
  int v11 = *((_DWORD *)v1 + 143);
  uint64_t v12 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
  v12(v6, v7);
  v12(v5, v7);
  uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16);
  v1[56] = v13;
  v1[57] = (v9 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v13(v306, v288, v296);
  v317 = v13;
  if (logb == v11)
  {
    uint64_t v14 = (void *)v278;
    uint64_t v15 = *(void (**)(os_log_t, uint64_t))(*(void *)(v278 + 336) + 8);
    v15(*(os_log_t *)(v278 + 472), *(void *)(v278 + 328));
  }
  else
  {
    v307 = v12;
    static CommunicationActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    char isCurrentExecutor = swift_task_isCurrentExecutor();
    if ((isCurrentExecutor & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v17 = *(void *)(v278 + 552);
    uint64_t v18 = *(void *)(v278 + 504);
    uint64_t v263 = *(void *)(v278 + 512);
    uint64_t v19 = *(void *)(v278 + 496);
    uint64_t v20 = *(void *)(v278 + 480);
    os_log_t logc = *(os_log_t *)(v278 + 472);
    uint64_t v21 = *(void *)(v278 + 336);
    uint64_t v289 = *(void *)(v278 + 328);
    Message.content.getter();
    MessageBody.version.getter();
    v274(v17, v263);
    v267(v19, enum case for ProtocolVersion.V1(_:), v20);
    dispatch thunk of RawRepresentable.rawValue.getter();
    dispatch thunk of RawRepresentable.rawValue.getter();
    int v22 = *(_DWORD *)(v278 + 728);
    LODWORD(v17) = *(_DWORD *)(v278 + 724);
    v307(v19, v20);
    v307(v18, v20);
    uint64_t v15 = *(void (**)(os_log_t, uint64_t))(v21 + 8);
    v15(logc, v289);
    swift_release();
    if (v22 != v17)
    {
      int v75 = enum case for Message.Operation.event(_:);
      uint64_t v14 = (void *)v278;
      goto LABEL_31;
    }
    uint64_t v14 = (void *)v278;
    uint64_t v13 = v317;
  }
  uint64_t v24 = v14[57];
  uint64_t v23 = v14[58];
  uint64_t v25 = v14[41];
  uint64_t v26 = v14[21];
  static Log.network.getter();
  v13(v23, v26, v25);
  v13(v24, v26, v25);
  uint64_t v27 = Logger.logObject.getter();
  os_log_type_t v28 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v27, v28))
  {
    os_log_type_t log = v28;
    v290 = v27;
    v308 = (void (*)(uint64_t, uint64_t))v15;
    uint64_t v29 = swift_slowAlloc();
    v331[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v29 = 136315394;
    static CommunicationActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v30 = v14[58];
    uint64_t v31 = v14[41];
    uint64_t v32 = Message.shortDescription.getter();
    uint64_t v33 = v14;
    unint64_t v35 = v34;
    swift_release();
    v33[10] = sub_100007E88(v32, v35, v331);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v15(v30, v31);
    *(_WORD *)(v29 + 12) = 2080;
    static CommunicationActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v36 = v33[69];
    uint64_t v37 = v33[64];
    uint64_t v38 = v33[57];
    uint64_t v260 = v33[41];
    uint64_t v39 = v33[28];
    uint64_t v261 = v33[27];
    uint64_t v264 = v33[40];
    Message.content.getter();
    MessageBody.version.getter();
    v274(v36, v37);
    uint64_t v40 = String.init<A>(describing:)();
    unint64_t v42 = v41;
    swift_release();
    v33[7] = sub_100007E88(v40, v42, v331);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v308(v38, v260);
    _os_log_impl((void *)&_mh_execute_header, v290, log, "[NMC] Ignoring %s, as it's %s", (uint8_t *)v29, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    unint64_t v43 = *(void (**)(uint64_t, uint64_t))(v39 + 8);
    v43(v264, v261);
    uint64_t v14 = v33;
    uint64_t v15 = (void (*)(os_log_t, uint64_t))v308;
    uint64_t v13 = v317;
  }
  else
  {
    uint64_t v44 = v14[57];
    uint64_t v45 = v14[41];
    uint64_t v309 = v14[40];
    uint64_t v47 = v14[27];
    uint64_t v46 = v14[28];
    v15((os_log_t)v14[58], v45);
    v15(v44, v45);

    unint64_t v43 = *(void (**)(uint64_t, uint64_t))(v46 + 8);
    v43(v309, v47);
  }
  uint64_t v48 = v14[26];
  uint64_t v49 = v14[23];
  uint64_t v50 = v14[24];
  Message.operation.getter();
  int v51 = (*(uint64_t (**)(uint64_t, uint64_t))(v50 + 88))(v48, v49);
  if (v51 == enum case for Message.Operation.event(_:)) {
    goto LABEL_16;
  }
  int v54 = v51;
  if (v51 != enum case for Message.Operation.request(_:))
  {
    if (v51 == enum case for Message.Operation.response(_:)) {
      goto LABEL_16;
    }
    int v76 = enum case for Message.Operation.error(_:);
    swift_release();
    if (v54 == v76) {
      goto LABEL_17;
    }
    uint64_t v77 = v14[26];
LABEL_118:
    (*(void (**)(uint64_t, void))(v14[24] + 8))(v77, v14[23]);
    goto LABEL_17;
  }
  v265 = v43;
  int v291 = enum case for Message.Operation.event(_:);
  v310 = v15;
  uint64_t v55 = v14[55];
  uint64_t v56 = v14[56];
  uint64_t v57 = v13;
  v58 = v14;
  uint64_t v59 = v14[42];
  uint64_t v60 = v58[41];
  os_log_t logd = v55;
  uint64_t v61 = v58[26];
  uint64_t v62 = v58[21];
  uint64_t v266 = v62;
  (*(void (**)(uint64_t, void))(v58[24] + 96))(v61, v58[23]);
  int v63 = *(_DWORD *)(v61 + 4);
  static CommunicationActor.shared.getter();
  v57(v56, v62, v60);
  unint64_t v64 = (*(unsigned __int8 *)(v59 + 80) + 20) & ~(unint64_t)*(unsigned __int8 *)(v59 + 80);
  uint64_t v65 = swift_allocObject();
  *(_DWORD *)(v65 + 16) = v63;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v59 + 32))(v65 + v64, v56, v60);
  uint64_t v66 = swift_allocObject();
  *(void *)(v66 + 16) = &unk_1000F3C90;
  *(void *)(v66 + 24) = v65;
  uint64_t v67 = generateElements<A>(isolation:_:)();
  swift_release();
  static Log.network.getter();
  v57((uint64_t)logd, v266, v60);
  v68 = Logger.logObject.getter();
  os_log_type_t v69 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v68, v69))
  {
    v70 = (uint8_t *)swift_slowAlloc();
    v331[0] = swift_slowAlloc();
    *(_DWORD *)v70 = 136315138;
    static CommunicationActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    v71 = v58[55];
    uint64_t v262 = v58[41];
    uint64_t v279 = v58[39];
    uint64_t v268 = v58[27];
    uint64_t v72 = Message.shortDescription.getter();
    unint64_t v74 = v73;
    swift_release();
    v58[11] = sub_100007E88(v72, v74, v331);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    uint64_t v14 = v58;
    swift_bridgeObjectRelease();
    uint64_t v15 = v310;
    v310((os_log_t)v71, v262);
    _os_log_impl((void *)&_mh_execute_header, v68, v69, "[MSQ] Enqueue reply stream for: %s", v70, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v265(v279, v268);
  }
  else
  {
    uint64_t v78 = v58[39];
    uint64_t v79 = v58[27];
    uint64_t v15 = v310;
    v310((os_log_t)v58[55], v58[41]);

    v265(v78, v79);
    uint64_t v14 = v58;
  }
  sub_10006A670(v67);
  swift_release();
  int v75 = v291;
LABEL_31:
  v14[79] = v15;
  uint64_t v80 = v14[24];
  uint64_t v81 = v14[25];
  uint64_t v82 = v14[23];
  Message.operation.getter();
  int v83 = (*(uint64_t (**)(uint64_t, uint64_t))(v80 + 88))(v81, v82);
  if (v83 == v75)
  {
    v84 = (unsigned int *)v14[25];
    (*(void (**)(unsigned int *, void))(v14[24] + 96))(v84, v14[23]);
    uint64_t v85 = *v84;
    *((_DWORD *)v14 + 187) = v85;
    if (v85 < 3)
    {
      uint64_t v86 = v14[52];
      uint64_t v87 = v14[41];
      uint64_t v88 = v14[21];
      static Log.network.getter();
      v317(v86, v88, v87);
      v89 = Logger.logObject.getter();
      os_log_type_t v90 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v89, v90))
      {
        os_log_type_t v323 = v90;
        uint64_t v91 = swift_slowAlloc();
        v331[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v91 = 136315394;
        static CommunicationActor.shared.getter();
        dispatch thunk of Actor.unownedExecutor.getter();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        swift_release();
        v311 = (void (*)(uint64_t, uint64_t))v15;
        if ((_BYTE)v85)
        {
          if (v85 == 1) {
            v92 = "gallerySyncReady";
          }
          else {
            v92 = "shuffleSyncReady";
          }
          unint64_t v217 = (unint64_t)(v92 - 32) | 0x8000000000000000;
          uint64_t v218 = 0xD000000000000010;
        }
        else
        {
          unint64_t v217 = 0xEE00796461655263;
          uint64_t v218 = 0x6E79536D75626C61;
        }
        v219 = v14;
        v14[16] = sub_100007E88(v218, v217, v331);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        *(_WORD *)(v91 + 12) = 2080;
        static CommunicationActor.shared.getter();
        dispatch thunk of Actor.unownedExecutor.getter();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        uint64_t v220 = v14[52];
        uint64_t v221 = v14[41];
        uint64_t v294 = v14[36];
        uint64_t v222 = v14[28];
        uint64_t v281 = v219[27];
        swift_release();
        sub_1000CD730(&qword_1000F2618, (void (*)(uint64_t))&type metadata accessor for Message);
        uint64_t v223 = dispatch thunk of CustomStringConvertible.description.getter();
        v219[15] = sub_100007E88(v223, v224, v331);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        v311(v220, v221);
        _os_log_impl((void *)&_mh_execute_header, v89, v323, "[NMC] Received %s: %s", (uint8_t *)v91, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v139 = *(void (**)(uint64_t, uint64_t))(v222 + 8);
        v139(v294, v281);
        uint64_t v14 = v219;
      }
      else
      {
        uint64_t v136 = v14[36];
        uint64_t v137 = v14[27];
        uint64_t v138 = v14[28];
        v15((os_log_t)v14[52], v14[41]);

        v139 = *(void (**)(uint64_t, uint64_t))(v138 + 8);
        v139(v136, v137);
      }
      v14[80] = v139;
      static CommunicationActor.shared.getter();
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v225 = v14[22];
      swift_beginAccess();
      uint64_t v226 = *(void *)(v225 + 40);
      swift_bridgeObjectRetain();
      swift_release();
      if (*(void *)(v226 + 16) && (uint64_t v227 = sub_10005074C(v85), (v228 & 1) != 0))
      {
        v229 = *(void **)(*(void *)(v226 + 56) + 8 * v227);
        swift_bridgeObjectRetain();
      }
      else
      {
        static CommunicationActor.shared.getter();
        dispatch thunk of Actor.unownedExecutor.getter();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        swift_release();
        v229 = _swiftEmptyArrayStorage;
      }
      swift_bridgeObjectRelease();
      v14[81] = v229;
      uint64_t v230 = v229[2];
      v14[82] = v230;
      if (!v230)
      {
        swift_release();
        swift_bridgeObjectRelease();
        goto LABEL_17;
      }
      v14[83] = 0;
      v14[84] = v229[5];
      v231 = (int *)v229[4];
      swift_retain();
      Message.content.getter();
      v329 = (uint64_t (*)(void))((char *)v231 + *v231);
      v232 = (void *)swift_task_alloc();
      v14[85] = v232;
      void *v232 = v14;
      v232[1] = sub_1000BF7BC;
      return v329();
    }
    uint64_t v111 = v14[51];
    uint64_t v112 = v14[41];
    uint64_t v113 = v14[21];
    swift_release();
    static Log.network.getter();
    v317(v111, v113, v112);
    v114 = Logger.logObject.getter();
    os_log_type_t v115 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v114, v115))
    {
      os_log_type_t v319 = v115;
      v312 = (void (*)(uint64_t, uint64_t))v15;
      uint64_t v116 = swift_slowAlloc();
      v331[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v116 = 67109378;
      static CommunicationActor.shared.getter();
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      v325 = v114;
      swift_release();
      *((_DWORD *)v14 + 180) = v85;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v116 + 8) = 2080;
      static CommunicationActor.shared.getter();
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v117 = v14[51];
      uint64_t v118 = v14[41];
      uint64_t v293 = v14[35];
      uint64_t v119 = v14[28];
      os_log_t loge = (os_log_t)v14[27];
      uint64_t v120 = Message.shortDescription.getter();
      unint64_t v122 = v121;
      swift_release();
      v14[20] = sub_100007E88(v120, v122, v331);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v312(v117, v118);
      _os_log_impl((void *)&_mh_execute_header, v325, v319, "handleMessage: Invalid message type %u. Dropping message %s", (uint8_t *)v116, 0x12u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, os_log_t))(v119 + 8))(v293, loge);
      goto LABEL_17;
    }
    uint64_t v153 = v14[35];
    uint64_t v155 = v14[27];
    uint64_t v154 = v14[28];
    v15((os_log_t)v14[51], v14[41]);

LABEL_69:
    (*(void (**)(uint64_t, uint64_t))(v154 + 8))(v153, v155);
    goto LABEL_17;
  }
  int v93 = v83;
  if (v83 == enum case for Message.Operation.request(_:))
  {
    uint64_t v94 = v14[24];
    v95 = (unsigned int *)v14[25];
    uint64_t v96 = v14[23];
    swift_release();
    (*(void (**)(unsigned int *, uint64_t))(v94 + 96))(v95, v96);
    LODWORD(v96) = *v95;
    unsigned int v97 = v95[1];
    char v98 = sub_100005A1C(*v95);
    uint64_t v99 = v14[41];
    uint64_t v100 = v14[21];
    int v297 = v96;
    if (v98 == 11)
    {
      uint64_t v101 = v14[49];
      static Log.network.getter();
      v317(v101, v100, v99);
      v102 = Logger.logObject.getter();
      os_log_type_t v103 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v102, v103))
      {
        os_log_type_t v318 = v103;
        v324 = v102;
        uint64_t v104 = swift_slowAlloc();
        v331[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v104 = 67109378;
        static CommunicationActor.shared.getter();
        dispatch thunk of Actor.unownedExecutor.getter();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        swift_release();
        *((_DWORD *)v14 + 183) = v297;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *(_WORD *)(v104 + 8) = 2080;
        static CommunicationActor.shared.getter();
        dispatch thunk of Actor.unownedExecutor.getter();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        v105 = v14[49];
        uint64_t v106 = v14[41];
        uint64_t v107 = v14[28];
        uint64_t v292 = v14[27];
        uint64_t v298 = v14[32];
        uint64_t v108 = Message.shortDescription.getter();
        unint64_t v110 = v109;
        swift_release();
        v14[18] = sub_100007E88(v108, v110, v331);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        v15(v105, v106);
        _os_log_impl((void *)&_mh_execute_header, v324, v318, "handleMessage: Invalid request type %u. Dropping message %s", (uint8_t *)v104, 0x12u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(uint64_t, uint64_t))(v107 + 8))(v298, v292);
        goto LABEL_17;
      }
      uint64_t v153 = v14[32];
      uint64_t v155 = v14[27];
      uint64_t v154 = v14[28];
      v15((os_log_t)v14[49], v14[41]);

      goto LABEL_69;
    }
    char loga = v98;
    unsigned int v273 = v97;
    v313 = (void (*)(uint64_t, uint64_t))v15;
    uint64_t v140 = v14[50];
    static Log.network.getter();
    v317(v140, v100, v99);
    v141 = Logger.logObject.getter();
    os_log_type_t v142 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v141, v142))
    {
      uint64_t v143 = swift_slowAlloc();
      v331[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v143 = 136315394;
      static CommunicationActor.shared.getter();
      dispatch thunk of Actor.unownedExecutor.getter();
      v144 = v14;
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_release();
      uint64_t v145 = sub_100002E04(loga);
      v14[8] = sub_100007E88(v145, v146, v331);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v143 + 12) = 2080;
      static CommunicationActor.shared.getter();
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v147 = v14[50];
      uint64_t v148 = v14[41];
      uint64_t v275 = v144[33];
      uint64_t v149 = v144[28];
      uint64_t v269 = v144[27];
      swift_release();
      sub_1000CD730(&qword_1000F2618, (void (*)(uint64_t))&type metadata accessor for Message);
      uint64_t v150 = dispatch thunk of CustomStringConvertible.description.getter();
      v144[19] = sub_100007E88(v150, v151, v331);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v313(v147, v148);
      _os_log_impl((void *)&_mh_execute_header, v141, v142, "[NMC] Received %s: %s", (uint8_t *)v143, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v152 = v269;
      v270 = *(void (**)(uint64_t, uint64_t))(v149 + 8);
      v270(v275, v152);
      uint64_t v14 = v144;
    }
    else
    {
      uint64_t v182 = v14[33];
      uint64_t v184 = v14[27];
      uint64_t v183 = v14[28];
      v313(v14[50], v14[41]);

      v270 = *(void (**)(uint64_t, uint64_t))(v183 + 8);
      v270(v182, v184);
    }
    uint64_t v185 = v14[56];
    uint64_t v303 = v14[48];
    uint64_t v187 = v14[42];
    uint64_t v186 = v14[43];
    uint64_t v188 = v14[41];
    uint64_t v190 = v14[21];
    uint64_t v189 = v14[22];
    uint64_t v276 = v190;
    static CommunicationActor.shared.getter();
    v317(v185, v190, v188);
    unint64_t v191 = (*(unsigned __int8 *)(v187 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v187 + 80);
    unint64_t v192 = (v186 + v191 + 3) & 0xFFFFFFFFFFFFFFFCLL;
    uint64_t v193 = swift_allocObject();
    *(void *)(v193 + 16) = v189;
    *(unsigned char *)(v193 + 24) = loga;
    *(_DWORD *)(v193 + 28) = v297;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v187 + 32))(v193 + v191, v185, v188);
    *(_DWORD *)(v193 + v192) = v273;
    uint64_t v194 = swift_allocObject();
    *(void *)(v194 + 16) = &unk_1000F3C78;
    *(void *)(v194 + 24) = v193;
    swift_retain();
    uint64_t v195 = generateElements<A>(isolation:_:)();
    swift_release();
    static Log.network.getter();
    v317(v303, v276, v188);
    v196 = Logger.logObject.getter();
    os_log_type_t v197 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v196, v197))
    {
      uint64_t v327 = v195;
      v198 = (uint8_t *)swift_slowAlloc();
      v331[0] = swift_slowAlloc();
      *(_DWORD *)v198 = 136315138;
      static CommunicationActor.shared.getter();
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v199 = v14[48];
      uint64_t v280 = v14[41];
      uint64_t v304 = v14[31];
      uint64_t v301 = v14[27];
      uint64_t v200 = Message.shortDescription.getter();
      unint64_t v202 = v201;
      swift_release();
      v14[17] = sub_100007E88(v200, v202, v331);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v313(v199, v280);
      _os_log_impl((void *)&_mh_execute_header, v196, v197, "[MSQ] Enqueue reply stream for: %s", v198, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v270(v304, v301);
      uint64_t v195 = v327;
    }
    else
    {
      uint64_t v215 = v14[31];
      uint64_t v216 = v14[27];
      v313(v14[48], v14[41]);

      v270(v215, v216);
    }
    sub_10006A670(v195);
LABEL_16:
    swift_release();
LABEL_17:
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
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v52 = (uint64_t (*)(void))v14[1];
    return v52();
  }
  if (v83 != enum case for Message.Operation.response(_:))
  {
    int v156 = enum case for Message.Operation.error(_:);
    swift_release();
    uint64_t v157 = v14[21];
    if (v93 == v156)
    {
      v158 = (int *)v14[25];
      (*(void (**)(int *, void))(v14[24] + 96))(v158, v14[23]);
      int v299 = *v158;
      Message.content.getter();
      MessageBody.deserialized<A>()();
      uint64_t v237 = v14[5];
      unint64_t v236 = v14[6];
      uint64_t v238 = v14[45];
      uint64_t v239 = v14[41];
      uint64_t v240 = v14[21];
      v274(v14[68], v14[64]);
      static Log.network.getter();
      v317(v238, v240, v239);
      swift_bridgeObjectRetain();
      v241 = Logger.logObject.getter();
      os_log_type_t v242 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v241, v242))
      {
        uint64_t v295 = v237;
        os_log_type_t v277 = v242;
        v316 = (void (*)(uint64_t, uint64_t))v15;
        uint64_t v244 = swift_slowAlloc();
        v331[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v244 = 67109378;
        static CommunicationActor.shared.getter();
        dispatch thunk of Actor.unownedExecutor.getter();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        swift_release();
        *((_DWORD *)v14 + 184) = v299;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *(_WORD *)(v244 + 8) = 2080;
        static CommunicationActor.shared.getter();
        dispatch thunk of Actor.unownedExecutor.getter();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        v317(v14[44], v14[45], v14[41]);
        unint64_t v245 = v236;
        if (!v236)
        {
          static CommunicationActor.shared.getter();
          dispatch thunk of Actor.unownedExecutor.getter();
          if ((swift_task_isCurrentExecutor() & 1) == 0) {
            swift_task_reportUnexpectedExecutor();
          }
          uint64_t v295 = Message.description.getter();
          unint64_t v245 = v246;
          swift_release();
        }
        uint64_t v248 = v14[44];
        uint64_t v247 = v14[45];
        uint64_t v249 = v14[41];
        uint64_t v250 = v14[28];
        uint64_t v322 = v14[27];
        v330 = v14[29];
        swift_bridgeObjectRetain();
        v316(v248, v249);
        swift_release();
        v14[12] = sub_100007E88(v295, v245, v331);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        v316(v247, v249);
        _os_log_impl((void *)&_mh_execute_header, v241, v277, "[NMC] Error executing request %u: %s", (uint8_t *)v244, 0x12u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(NSObject *, uint64_t))(v250 + 8))(v330, v322);
      }
      else
      {
        v251 = v14[45];
        uint64_t v252 = v14[41];
        uint64_t v254 = v14[28];
        uint64_t v253 = v14[29];
        uint64_t v255 = v14[27];
        swift_bridgeObjectRelease_n();
        v15(v251, v252);

        (*(void (**)(uint64_t, uint64_t))(v254 + 8))(v253, v255);
      }
      static CommunicationActor.shared.getter();
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_retain();
      swift_release();
      sub_10007C860();
      swift_allocError();
      unsigned char *v256 = 0;
      dispatch thunk of MessageDemultiplexer.error(_:_:)();
      swift_errorRelease();
      goto LABEL_16;
    }
    uint64_t v203 = v14[53];
    uint64_t v204 = v14[41];
    static Log.network.getter();
    v317(v203, v157, v204);
    v205 = Logger.logObject.getter();
    os_log_type_t v206 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v205, v206))
    {
      v315 = (void (*)(uint64_t, uint64_t))v15;
      v207 = (uint8_t *)swift_slowAlloc();
      v331[0] = swift_slowAlloc();
      *(_DWORD *)v207 = 136315138;
      static CommunicationActor.shared.getter();
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v208 = v14[53];
      uint64_t v209 = v14[41];
      uint64_t v321 = v14[37];
      uint64_t v210 = v14[28];
      uint64_t v305 = v14[27];
      swift_release();
      sub_1000CD730(&qword_1000F2618, (void (*)(uint64_t))&type metadata accessor for Message);
      uint64_t v211 = dispatch thunk of CustomStringConvertible.description.getter();
      v14[9] = sub_100007E88(v211, v212, v331);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v315(v208, v209);
      _os_log_impl((void *)&_mh_execute_header, v205, v206, "[NMC] Unknown message type for message %s. Ignoring.", v207, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v210 + 8))(v321, v305);
    }
    else
    {
      uint64_t v233 = v14[37];
      uint64_t v235 = v14[27];
      uint64_t v234 = v14[28];
      v15((os_log_t)v14[53], v14[41]);

      (*(void (**)(uint64_t, uint64_t))(v234 + 8))(v233, v235);
    }
    uint64_t v77 = v14[25];
    goto LABEL_118;
  }
  uint64_t v123 = v14[54];
  uint64_t v124 = v14[41];
  v125 = (_DWORD *)v14[25];
  uint64_t v126 = v14[21];
  (*(void (**)(_DWORD *, void))(v14[24] + 96))(v125, v14[23]);
  LODWORD(v125) = *v125;
  *((_DWORD *)v14 + 188) = v125;
  static Log.network.getter();
  v317(v123, v126, v124);
  v127 = Logger.logObject.getter();
  os_log_type_t v128 = static os_log_type_t.info.getter();
  unsigned int v302 = v125;
  if (os_log_type_enabled(v127, v128))
  {
    v129 = (uint8_t *)swift_slowAlloc();
    v331[0] = swift_slowAlloc();
    *(_DWORD *)v129 = 136315138;
    static CommunicationActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    v130 = v14[54];
    uint64_t v131 = v14[41];
    uint64_t v132 = v14[28];
    uint64_t v271 = v14[27];
    uint64_t v272 = v14[38];
    swift_release();
    sub_1000CD730(&qword_1000F2618, (void (*)(uint64_t))&type metadata accessor for Message);
    uint64_t v133 = dispatch thunk of CustomStringConvertible.description.getter();
    v14[14] = sub_100007E88(v133, v134, v331);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v15(v130, v131);
    _os_log_impl((void *)&_mh_execute_header, v127, v128, "[NMC] Received response: %s", v129, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v135 = *(void (**)(uint64_t, uint64_t))(v132 + 8);
    v135(v272, v271);
  }
  else
  {
    uint64_t v159 = v14[38];
    uint64_t v161 = v14[27];
    uint64_t v160 = v14[28];
    v15((os_log_t)v14[54], v14[41]);

    v135 = *(void (**)(uint64_t, uint64_t))(v160 + 8);
    v135(v159, v161);
  }
  v14[87] = v135;
  uint64_t v162 = v14[66];
  uint64_t v163 = v14[64];
  uint64_t v164 = v14[47];
  uint64_t v165 = v14[41];
  uint64_t v166 = v14[21];
  Message.content.getter();
  char v167 = MessageBody.isEmpty.getter();
  v274(v162, v163);
  v317(v164, v166, v165);
  if (v167)
  {
    static CommunicationActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    v168 = v14[47];
    uint64_t v169 = v14[41];
    char v170 = Message.complete.getter();
    v15(v168, v169);
    swift_release();
    if (v170)
    {
      swift_release();
      if ((Message.complete.getter() & 1) == 0) {
        goto LABEL_17;
      }
      v171 = (void (*)(uint64_t, uint64_t, uint64_t))v14[77];
      uint64_t v172 = v14[46];
      uint64_t v173 = v14[41];
      uint64_t v174 = v14[21];
      static Log.network.getter();
      v171(v172, v174, v173);
      v175 = Logger.logObject.getter();
      os_log_type_t v176 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v175, v176))
      {
        v177 = (uint8_t *)swift_slowAlloc();
        v331[0] = swift_slowAlloc();
        *(_DWORD *)v177 = 136315138;
        static CommunicationActor.shared.getter();
        dispatch thunk of Actor.unownedExecutor.getter();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        uint64_t v178 = v14[46];
        uint64_t v179 = v14[41];
        uint64_t v320 = v14[30];
        v326 = v14[87];
        v300 = (void (*)(uint64_t, uint64_t))v14[79];
        uint64_t v314 = v14[27];
        swift_release();
        sub_1000CD730(&qword_1000F2618, (void (*)(uint64_t))&type metadata accessor for Message);
        uint64_t v180 = dispatch thunk of CustomStringConvertible.description.getter();
        v14[13] = sub_100007E88(v180, v181, v331);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        v300(v178, v179);
        _os_log_impl((void *)&_mh_execute_header, v175, v176, "[NMC] Finished receiving response: %s", v177, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        ((void (*)(uint64_t, uint64_t))v326)(v320, v314);
      }
      else
      {
        v257 = (void (*)(uint64_t, uint64_t))v14[87];
        uint64_t v258 = v14[30];
        uint64_t v259 = v14[27];
        ((void (*)(void, void))v14[79])(v14[46], v14[41]);

        v257(v258, v259);
      }
      static CommunicationActor.shared.getter();
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_retain();
      swift_release();
      dispatch thunk of MessageDemultiplexer.finish(_:)();
      goto LABEL_16;
    }
  }
  else
  {
    v15((os_log_t)v14[47], v14[41]);
  }
  static CommunicationActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v14[88] = *(void *)(v14[22] + 64);
  swift_retain();
  swift_release();
  Message.content.getter();
  v328 = ((char *)&async function pointer to dispatch thunk of MessageDemultiplexer.send(_:_:)
                    + async function pointer to dispatch thunk of MessageDemultiplexer.send(_:_:));
  v213 = (void *)swift_task_alloc();
  v14[89] = v213;
  void *v213 = v14;
  v213[1] = sub_1000C0248;
  uint64_t v214 = v14[69];
  return ((uint64_t (*)(void, uint64_t))v328)(v302, v214);
}

uint64_t sub_1000BF7BC()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 688) = v0;
  swift_task_dealloc();
  uint64_t v3 = (void (*)(uint64_t, uint64_t))v2[75];
  uint64_t v4 = v2[67];
  uint64_t v5 = v2[64];
  swift_release();
  v3(v4, v5);
  uint64_t v6 = v2[74];
  uint64_t v7 = v2[73];
  if (v0) {
    uint64_t v8 = sub_1000BFCDC;
  }
  else {
    uint64_t v8 = sub_1000BF97C;
  }
  return _swift_task_switch(v8, v7, v6);
}

uint64_t sub_1000BF97C()
{
  uint64_t v1 = v0[83] + 1;
  if (v1 == v0[82])
  {
    swift_release();
    swift_bridgeObjectRelease();
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
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v2 = (uint64_t (*)(void))v0[1];
    return v2();
  }
  else
  {
    v0[83] = v1;
    uint64_t v4 = v0[81] + 16 * v1;
    v0[84] = *(void *)(v4 + 40);
    uint64_t v5 = *(int **)(v4 + 32);
    swift_retain();
    Message.content.getter();
    uint64_t v7 = (uint64_t (*)(void))((char *)v5 + *v5);
    uint64_t v6 = (void *)swift_task_alloc();
    v0[85] = v6;
    *uint64_t v6 = v0;
    v6[1] = sub_1000BF7BC;
    return v7();
  }
}

uint64_t sub_1000BFCDC()
{
  static Log.network.getter();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = swift_slowAlloc();
    uint64_t v4 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 67109378;
    static CommunicationActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    int v5 = *(_DWORD *)(v0 + 748);
    swift_release();
    *(_DWORD *)(v3 + 4) = v5;
    *(_WORD *)(v3 + 8) = 2112;
    static CommunicationActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_errorRetain();
    swift_release();
    uint64_t v6 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v3 + 10) = v6;
    *uint64_t v4 = v6;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "handleMessage: Exception occurred while processing event %u. Error: %@", (uint8_t *)v3, 0x12u);
    sub_100005CB0(qword_1000F2278);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
  }
  (*(void (**)(void, void))(v0 + 640))(*(void *)(v0 + 272), *(void *)(v0 + 216));
  uint64_t v7 = *(void *)(v0 + 664) + 1;
  if (v7 == *(void *)(v0 + 656))
  {
    swift_release();
    swift_bridgeObjectRelease();
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
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
    return v8();
  }
  else
  {
    *(void *)(v0 + 664) = v7;
    uint64_t v10 = *(void *)(v0 + 648) + 16 * v7;
    *(void *)(v0 + 672) = *(void *)(v10 + 40);
    int v11 = *(int **)(v10 + 32);
    swift_retain();
    Message.content.getter();
    uint64_t v13 = (uint64_t (*)(void))((char *)v11 + *v11);
    uint64_t v12 = (void *)swift_task_alloc();
    *(void *)(v0 + 680) = v12;
    *uint64_t v12 = v0;
    v12[1] = sub_1000BF7BC;
    return v13();
  }
}

uint64_t sub_1000C0248()
{
  uint64_t v1 = *v0;
  os_log_type_t v2 = *(void (**)(uint64_t, uint64_t))(*v0 + 600);
  uint64_t v3 = *(void *)(*v0 + 552);
  uint64_t v4 = *(void *)(*v0 + 512);
  swift_task_dealloc();
  swift_release();
  v2(v3, v4);
  uint64_t v5 = *(void *)(v1 + 592);
  uint64_t v6 = *(void *)(v1 + 584);
  return _swift_task_switch(sub_1000C03F8, v6, v5);
}

uint64_t sub_1000C03F8()
{
  int v22 = v0;
  swift_release();
  if (Message.complete.getter())
  {
    uint64_t v1 = (void (*)(uint64_t, uint64_t, uint64_t))v0[77];
    uint64_t v2 = v0[46];
    uint64_t v3 = v0[41];
    uint64_t v4 = v0[21];
    static Log.network.getter();
    v1(v2, v4, v3);
    uint64_t v5 = Logger.logObject.getter();
    os_log_type_t v6 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      *(_DWORD *)uint64_t v7 = 136315138;
      static CommunicationActor.shared.getter();
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v8 = v0[46];
      uint64_t v9 = v0[41];
      uint64_t v19 = v0[30];
      uint64_t v20 = (void (*)(uint64_t, uint64_t))v0[87];
      uint64_t v17 = (void (*)(uint64_t, uint64_t))v0[79];
      uint64_t v18 = v0[27];
      swift_release();
      sub_1000CD730(&qword_1000F2618, (void (*)(uint64_t))&type metadata accessor for Message);
      uint64_t v10 = dispatch thunk of CustomStringConvertible.description.getter();
      v0[13] = sub_100007E88(v10, v11, &v21);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v17(v8, v9);
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "[NMC] Finished receiving response: %s", v7, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v20(v19, v18);
    }
    else
    {
      uint64_t v12 = (void (*)(uint64_t, uint64_t))v0[87];
      uint64_t v13 = v0[30];
      uint64_t v14 = v0[27];
      ((void (*)(void, void))v0[79])(v0[46], v0[41]);

      v12(v13, v14);
    }
    static CommunicationActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_retain();
    swift_release();
    dispatch thunk of MessageDemultiplexer.finish(_:)();
    swift_release();
  }
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v15 = (uint64_t (*)(void))v0[1];
  return v15();
}

uint64_t sub_1000C0938(int a1, uint64_t a2, uint64_t a3)
{
  return sub_1000C0958(a1, a2, a3, (uint64_t)&unk_1000EEFB8, (uint64_t)sub_1000CB038);
}

uint64_t sub_1000C0958(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v29 = a4;
  int v31 = a1;
  uint64_t v9 = type metadata accessor for Logger();
  uint64_t v27 = *(void *)(v9 - 8);
  uint64_t v28 = v9;
  __chkstk_darwin(v9);
  unint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for CommunicationActor();
  uint64_t v12 = static CommunicationActor.shared.getter();
  uint64_t v30 = sub_1000CD730(&qword_1000F1F70, (void (*)(uint64_t))&type metadata accessor for CommunicationActor);
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  static Log.network.getter();
  uint64_t v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v23 = a2;
    uint64_t v24 = a3;
    uint64_t v25 = v12;
    uint64_t v26 = a5;
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    v33[0] = v22;
    *(_DWORD *)uint64_t v15 = 136315138;
    static CommunicationActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v16 = sub_10004A3B8(v31);
    unint64_t v18 = v17;
    swift_release();
    uint64_t v32 = sub_100007E88(v16, v18, v33);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "Registry: Registering request for %s.", v15, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v28);
    a5 = v26;
    a2 = v23;
    a3 = v24;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v28);
  }
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = a2;
  *(void *)(v19 + 24) = a3;
  swift_retain();
  static CommunicationActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_beginAccess();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v32 = *(void *)(v5 + 32);
  *(void *)(v5 + 32) = 0x8000000000000000;
  sub_1000537B0(a5, v19, v31, isUniquelyReferenced_nonNull_native);
  *(void *)(v5 + 32) = v32;
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_release();
  return swift_release();
}

uint64_t sub_1000C0D30@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v8 = type metadata accessor for MessageBody();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  __chkstk_darwin(v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v8);
  unint64_t v11 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a2;
  *(void *)(v12 + 24) = a3;
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v12 + v11, (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  swift_retain();
  uint64_t v13 = generateElements<A>(isolation:_:)();
  a4[3] = sub_100005CB0(&qword_1000F2D80);
  uint64_t result = sub_100005F48(&qword_1000F2D88, &qword_1000F2D80);
  a4[4] = result;
  *a4 = v13;
  return result;
}

uint64_t sub_1000C0EC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[11] = a4;
  v5[12] = a5;
  v5[9] = a2;
  v5[10] = a3;
  v5[8] = a1;
  type metadata accessor for ProtocolVersion();
  v5[13] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for MessageBody();
  v5[14] = v6;
  v5[15] = *(void *)(v6 - 8);
  v5[16] = swift_task_alloc();
  return _swift_task_switch(sub_1000C0FB8, 0, 0);
}

uint64_t sub_1000C0FB8()
{
  MessageBody.deserialized<A>()();
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v0 + 80) + **(int **)(v0 + 80));
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 136) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1000C1110;
  return v3(v0 + 16, v0 + 32);
}

uint64_t sub_1000C1110()
{
  *(void *)(*(void *)v1 + 144) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v0) {
    uint64_t v2 = sub_1000C13D4;
  }
  else {
    uint64_t v2 = sub_1000C1234;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000C1234()
{
  v0[6] = v0[2];
  uint64_t v1 = v0[18];
  v0[7] = v0[3];
  swift_bridgeObjectRetain();
  MessageBody.version.getter();
  MessageBody.init<A>(serializable:version:)();
  if (v1)
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v2 = (uint64_t (*)(void))v0[1];
    return v2();
  }
  else
  {
    uint64_t v6 = (uint64_t (*)(uint64_t))(v0[8] + *(int *)v0[8]);
    uint64_t v4 = (void *)swift_task_alloc();
    v0[19] = v4;
    *uint64_t v4 = v0;
    v4[1] = sub_1000C1444;
    uint64_t v5 = v0[16];
    return v6(v5);
  }
}

uint64_t sub_1000C13D4()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000C1444()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 160) = v0;
  swift_task_dealloc();
  (*(void (**)(void, void))(v2[15] + 8))(v2[16], v2[14]);
  if (v0) {
    uint64_t v3 = sub_1000C1628;
  }
  else {
    uint64_t v3 = sub_1000C15AC;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_1000C15AC()
{
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000C1628()
{
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000C16A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[9] = a4;
  v5[10] = a5;
  v5[7] = a2;
  v5[8] = a3;
  v5[6] = a1;
  type metadata accessor for ProtocolVersion();
  v5[11] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for MessageBody();
  v5[12] = v6;
  v5[13] = *(void *)(v6 - 8);
  v5[14] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for UUID();
  v5[15] = v7;
  v5[16] = *(void *)(v7 - 8);
  v5[17] = swift_task_alloc();
  return _swift_task_switch(sub_1000C17F0, 0, 0);
}

uint64_t sub_1000C17F0()
{
  MessageBody.deserialized<A>()();
  uint64_t v4 = (uint64_t (*)(void *, uint64_t))(v0[8] + *(int *)v0[8]);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[18] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1000C194C;
  uint64_t v2 = v0[17];
  return v4(v0 + 2, v2);
}

uint64_t sub_1000C194C()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 152) = v0;
  swift_task_dealloc();
  (*(void (**)(void, void))(v2[16] + 8))(v2[17], v2[15]);
  if (v0) {
    uint64_t v3 = sub_1000C1C68;
  }
  else {
    uint64_t v3 = sub_1000C1AB4;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_1000C1AB4()
{
  uint64_t v1 = v0[2];
  v0[4] = v1;
  uint64_t v2 = v0[19];
  unint64_t v3 = v0[3];
  v0[5] = v3;
  sub_10003E840(v1, v3);
  MessageBody.version.getter();
  MessageBody.init<A>(serializable:version:)();
  if (v2)
  {
    sub_100005C58(v1, v3);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = (uint64_t (*)(void))v0[1];
    return v4();
  }
  else
  {
    uint64_t v8 = (uint64_t (*)(uint64_t))(v0[6] + *(int *)v0[6]);
    uint64_t v6 = (void *)swift_task_alloc();
    v0[20] = v6;
    *uint64_t v6 = v0;
    v6[1] = sub_1000C1CEC;
    uint64_t v7 = v0[14];
    return v8(v7);
  }
}

uint64_t sub_1000C1C68()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000C1CEC()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 168) = v0;
  swift_task_dealloc();
  (*(void (**)(void, void))(v2[13] + 8))(v2[14], v2[12]);
  if (v0) {
    uint64_t v3 = sub_1000C1EE4;
  }
  else {
    uint64_t v3 = sub_1000C1E54;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_1000C1E54()
{
  sub_100005C58(v0[2], v0[3]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_1000C1EE4()
{
  sub_100005C58(v0[2], v0[3]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_1000C1F70(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))((char *)a3 + *a3);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_1000043B4;
  return v8(a1, a2);
}

uint64_t sub_1000C2054(uint64_t a1, uint64_t a2, uint64_t a3, char a4, int a5, uint64_t a6, int a7)
{
  *(_DWORD *)(v7 + 620) = a7;
  *(_DWORD *)(v7 + 616) = a5;
  *(unsigned char *)(v7 + 628) = a4;
  *(void *)(v7 + 152) = a3;
  *(void *)(v7 + 160) = a6;
  *(void *)(v7 + 136) = a1;
  *(void *)(v7 + 144) = a2;
  uint64_t v8 = type metadata accessor for ProtocolVersion();
  *(void *)(v7 + 168) = v8;
  *(void *)(v7 + 176) = *(void *)(v8 - 8);
  *(void *)(v7 + 184) = swift_task_alloc();
  *(void *)(v7 + 192) = swift_task_alloc();
  uint64_t v9 = type metadata accessor for Message.Operation();
  *(void *)(v7 + 200) = v9;
  *(void *)(v7 + 208) = *(void *)(v9 - 8);
  *(void *)(v7 + 216) = swift_task_alloc();
  *(void *)(v7 + 224) = swift_task_alloc();
  uint64_t v10 = type metadata accessor for Message();
  *(void *)(v7 + 232) = v10;
  *(void *)(v7 + 240) = *(void *)(v10 - 8);
  *(void *)(v7 + 248) = swift_task_alloc();
  *(void *)(v7 + 256) = swift_task_alloc();
  *(void *)(v7 + 264) = swift_task_alloc();
  sub_100005CB0(&qword_1000F3CA8);
  *(void *)(v7 + 272) = swift_task_alloc();
  uint64_t v11 = sub_100005CB0(&qword_1000F3CB0);
  *(void *)(v7 + 280) = v11;
  *(void *)(v7 + 288) = *(void *)(v11 - 8);
  *(void *)(v7 + 296) = swift_task_alloc();
  uint64_t v12 = type metadata accessor for AsyncBufferSequencePolicy();
  *(void *)(v7 + 304) = v12;
  *(void *)(v7 + 312) = *(void *)(v12 - 8);
  *(void *)(v7 + 320) = swift_task_alloc();
  uint64_t v13 = sub_100005CB0(&qword_1000F3CB8);
  *(void *)(v7 + 328) = v13;
  *(void *)(v7 + 336) = *(void *)(v13 - 8);
  *(void *)(v7 + 344) = swift_task_alloc();
  uint64_t v14 = type metadata accessor for MessageBody();
  *(void *)(v7 + 352) = v14;
  *(void *)(v7 + 360) = *(void *)(v14 - 8);
  *(void *)(v7 + 368) = swift_task_alloc();
  *(void *)(v7 + 376) = swift_task_alloc();
  *(void *)(v7 + 384) = swift_task_alloc();
  *(void *)(v7 + 392) = swift_task_alloc();
  *(void *)(v7 + 400) = swift_task_alloc();
  uint64_t v15 = sub_100005CB0(&qword_1000F3CC0);
  *(void *)(v7 + 408) = v15;
  *(void *)(v7 + 416) = *(void *)(v15 - 8);
  *(void *)(v7 + 424) = swift_task_alloc();
  uint64_t v16 = type metadata accessor for Logger();
  *(void *)(v7 + 432) = v16;
  *(void *)(v7 + 440) = *(void *)(v16 - 8);
  *(void *)(v7 + 448) = swift_task_alloc();
  *(void *)(v7 + 456) = swift_task_alloc();
  return _swift_task_switch(sub_1000C24C0, 0, 0);
}

uint64_t sub_1000C24C0()
{
  v0[58] = type metadata accessor for CommunicationActor();
  v0[59] = static CommunicationActor.shared.getter();
  v0[60] = sub_1000CD730(&qword_1000F1F70, (void (*)(uint64_t))&type metadata accessor for CommunicationActor);
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_1000C258C, v2, v1);
}

uint64_t sub_1000C258C()
{
  swift_release();
  static CommunicationActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = *(void *)(v0 + 152);
  swift_beginAccess();
  *(void *)(v0 + 488) = *(void *)(v1 + 32);
  swift_bridgeObjectRetain();
  swift_release();
  return _swift_task_switch(sub_1000C2674, 0, 0);
}

uint64_t sub_1000C2674()
{
  if (*(void *)(*(void *)(v0 + 488) + 16) && (uint64_t v1 = sub_10005074C(*(unsigned __int8 *)(v0 + 628)), (v2 & 1) != 0))
  {
    uint64_t v3 = (void *)(v0 + 16);
    uint64_t v4 = *(void *)(*(void *)(v0 + 488) + 56) + 16 * v1;
    uint64_t v5 = *(void (**)(uint64_t))v4;
    *(void *)(v0 + 496) = *(void *)(v4 + 8);
    swift_retain();
    swift_bridgeObjectRelease();
    static Log.network.getter();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v6, v7))
    {
      int v8 = *(_DWORD *)(v0 + 616);
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v9 = 67109120;
      *(_DWORD *)(v0 + 612) = v8;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "handleMessage: Calling handler for: %u", v9, 8u);
      uint64_t v3 = (void *)(v0 + 16);
      swift_slowDealloc();
    }
    uint64_t v10 = *(void *)(v0 + 456);
    uint64_t v12 = *(void *)(v0 + 432);
    uint64_t v11 = *(void *)(v0 + 440);
    uint64_t v13 = *(void *)(v0 + 400);

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
    Message.content.getter();
    v5(v13);
    uint64_t v23 = *(void *)(v0 + 400);
    uint64_t v24 = *(void *)(v0 + 352);
    uint64_t v25 = *(void *)(v0 + 360);
    uint64_t v26 = *(void *)(v0 + 336);
    uint64_t v27 = *(void *)(v0 + 344);
    uint64_t v28 = v3;
    uint64_t v30 = *(void *)(v0 + 320);
    uint64_t v29 = *(void *)(v0 + 328);
    uint64_t v31 = *(void *)(v0 + 312);
    uint64_t v37 = *(void *)(v0 + 304);
    uint64_t v32 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
    *(void *)(v0 + 504) = v32;
    *(void *)(v0 + 512) = (v25 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v32(v23, v24);
    sub_10003EB84(v28, *(void *)(v0 + 40));
    AsyncSequence.generic.getter();
    static AsyncBufferSequencePolicy.bounded(_:)();
    sub_100005F48(&qword_1000F3CC8, &qword_1000F3CB8);
    AsyncSequence<>.buffer(policy:)();
    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v30, v37);
    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v27, v29);
    sub_100009090((uint64_t)v28);
    AsyncBufferSequence.makeAsyncIterator()();
    *(_DWORD *)(v0 + 624) = enum case for Message.Operation.response(_:);
    uint64_t v33 = sub_100005F48(&qword_1000F3CD0, &qword_1000F3CB0);
    unint64_t v34 = (void *)swift_task_alloc();
    *(void *)(v0 + 520) = v34;
    *unint64_t v34 = v0;
    v34[1] = sub_1000C2CC0;
    uint64_t v35 = *(void *)(v0 + 272);
    uint64_t v36 = *(void *)(v0 + 280);
    return dispatch thunk of AsyncIteratorProtocol.next()(v35, v36, v33);
  }
  else
  {
    swift_bridgeObjectRelease();
    static Log.network.getter();
    uint64_t v14 = Logger.logObject.getter();
    os_log_type_t v15 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v14, v15))
    {
      int v16 = *(_DWORD *)(v0 + 616);
      unint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)unint64_t v17 = 67109120;
      *(_DWORD *)(v0 + 608) = v16;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "handleMessage: No handler registered for request: %u", v17, 8u);
      swift_slowDealloc();
    }
    uint64_t v19 = *(void *)(v0 + 440);
    uint64_t v18 = *(void *)(v0 + 448);
    uint64_t v20 = *(void *)(v0 + 432);

    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v20);
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
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v21 = *(uint64_t (**)(void))(v0 + 8);
    return v21();
  }
}

uint64_t sub_1000C2CC0()
{
  *(void *)(*(void *)v1 + 528) = v0;
  swift_task_dealloc();
  if (v0) {
    char v2 = sub_1000C30BC;
  }
  else {
    char v2 = sub_1000C2DD4;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000C2DD4()
{
  uint64_t v1 = *(void *)(v0 + 352);
  uint64_t v2 = *(void *)(v0 + 360);
  uint64_t v3 = *(void *)(v0 + 272);
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1);
  uint64_t v5 = *(unsigned int *)(v0 + 624);
  if (v4 == 1)
  {
    uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v0 + 504);
    uint64_t v6 = *(void *)(v0 + 384);
    os_log_type_t v7 = *(_DWORD **)(v0 + 224);
    uint64_t v8 = *(void *)(v0 + 200);
    uint64_t v9 = *(void *)(v0 + 208);
    uint64_t v10 = *(void *)(v0 + 192);
    uint64_t v11 = *(void *)(v0 + 176);
    int v12 = *(_DWORD *)(v0 + 620);
    uint64_t v24 = *(void *)(v0 + 168);
    uint64_t v26 = *(int **)(v0 + 136);
    (*(void (**)(void, void))(*(void *)(v0 + 288) + 8))(*(void *)(v0 + 296), *(void *)(v0 + 280));
    *os_log_type_t v7 = v12;
    uint64_t v13 = *(void (**)(_DWORD *, uint64_t, uint64_t))(v9 + 104);
    *(void *)(v0 + 560) = v13;
    v13(v7, v5, v8);
    Message.content.getter();
    MessageBody.version.getter();
    v25(v6, v1);
    static MessageBody.empty(version:)();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v24);
    Message.init(operation:content:complete:)();
    uint64_t v27 = (uint64_t (*)(uint64_t))((char *)v26 + *v26);
    uint64_t v14 = (void *)swift_task_alloc();
    *(void *)(v0 + 568) = v14;
    *uint64_t v14 = v0;
    v14[1] = sub_1000C36F4;
    uint64_t v15 = *(void *)(v0 + 256);
  }
  else
  {
    uint64_t v16 = *(void *)(v0 + 392);
    unint64_t v17 = *(_DWORD **)(v0 + 224);
    uint64_t v18 = *(void *)(v0 + 200);
    uint64_t v19 = *(void *)(v0 + 208);
    uint64_t v20 = *(int **)(v0 + 136);
    *unint64_t v17 = *(_DWORD *)(v0 + 620);
    uint64_t v21 = *(void (**)(_DWORD *, uint64_t, uint64_t))(v19 + 104);
    *(void *)(v0 + 536) = v21;
    v21(v17, v5, v18);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v16, v3, v1);
    Message.init(operation:content:complete:)();
    uint64_t v27 = (uint64_t (*)(uint64_t))((char *)v20 + *v20);
    uint64_t v22 = (void *)swift_task_alloc();
    *(void *)(v0 + 544) = v22;
    *uint64_t v22 = v0;
    v22[1] = sub_1000C34E4;
    uint64_t v15 = *(void *)(v0 + 264);
  }
  return v27(v15);
}

uint64_t sub_1000C30BC()
{
  *(void *)(v0 + 128) = *(void *)(v0 + 528);
  sub_100005CB0(&qword_1000F2850);
  swift_willThrowTypedImpl();
  return _swift_task_switch(sub_1000C3148, 0, 0);
}

uint64_t sub_1000C3148()
{
  uint64_t v1 = *(void *)(v0 + 208);
  (*(void (**)(void, void))(*(void *)(v0 + 288) + 8))(*(void *)(v0 + 296), *(void *)(v0 + 280));
  uint64_t v2 = *(void (**)(void))(v1 + 104);
  *(void *)(v0 + 584) = *(void *)(v0 + 528);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(v0 + 504);
  uint64_t v4 = *(void *)(v0 + 368);
  uint64_t v5 = *(void *)(v0 + 352);
  **(_DWORD **)(v0 + 216) = *(_DWORD *)(v0 + 620);
  v2();
  v6._countAndFlagsBits = 0x203A726F727245;
  v6._object = (void *)0xE700000000000000;
  String.append(_:)(v6);
  swift_getErrorValue();
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  *(void *)(v0 + 104) = 0;
  *(void *)(v0 + 112) = 0xE000000000000000;
  Message.content.getter();
  MessageBody.version.getter();
  v3(v4, v5);
  MessageBody.init<A>(serializable:version:)();
  os_log_type_t v7 = *(int **)(v0 + 136);
  Message.init(operation:content:complete:)();
  uint64_t v11 = (uint64_t (*)(uint64_t))((char *)v7 + *v7);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v0 + 592) = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_1000C3BF4;
  uint64_t v9 = *(void *)(v0 + 248);
  return v11(v9);
}

uint64_t sub_1000C34E4()
{
  uint64_t v2 = (void *)*v1;
  uint64_t v3 = (void *)*v1;
  v2[69] = v0;
  swift_task_dealloc();
  uint64_t v4 = v2[33];
  uint64_t v5 = v2[29];
  Swift::String v6 = (void (**)(uint64_t, uint64_t))(v2[30] + 8);
  if (v0)
  {
    (*v6)(v4, v5);
    return _swift_task_switch(sub_1000C385C, 0, 0);
  }
  else
  {
    (*v6)(v4, v5);
    uint64_t v7 = sub_100005F48(&qword_1000F3CD0, &qword_1000F3CB0);
    uint64_t v8 = (void *)swift_task_alloc();
    v2[65] = v8;
    *uint64_t v8 = v3;
    v8[1] = sub_1000C2CC0;
    uint64_t v9 = v2[34];
    uint64_t v10 = v2[35];
    return dispatch thunk of AsyncIteratorProtocol.next()(v9, v10, v7);
  }
}

uint64_t sub_1000C36F4()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 576) = v0;
  swift_task_dealloc();
  (*(void (**)(void, void))(v2[30] + 8))(v2[32], v2[29]);
  if (v0) {
    uint64_t v3 = sub_1000C4210;
  }
  else {
    uint64_t v3 = sub_1000C408C;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_1000C385C()
{
  (*(void (**)(void, void))(*(void *)(v0 + 288) + 8))(*(void *)(v0 + 296), *(void *)(v0 + 280));
  uint64_t v1 = *(void (**)(void))(v0 + 536);
  *(void *)(v0 + 584) = *(void *)(v0 + 552);
  uint64_t v2 = *(void (**)(uint64_t, uint64_t))(v0 + 504);
  uint64_t v3 = *(void *)(v0 + 368);
  uint64_t v4 = *(void *)(v0 + 352);
  **(_DWORD **)(v0 + 216) = *(_DWORD *)(v0 + 620);
  v1();
  v5._countAndFlagsBits = 0x203A726F727245;
  v5._object = (void *)0xE700000000000000;
  String.append(_:)(v5);
  swift_getErrorValue();
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  *(void *)(v0 + 104) = 0;
  *(void *)(v0 + 112) = 0xE000000000000000;
  Message.content.getter();
  MessageBody.version.getter();
  v2(v3, v4);
  MessageBody.init<A>(serializable:version:)();
  Swift::String v6 = *(int **)(v0 + 136);
  Message.init(operation:content:complete:)();
  uint64_t v10 = (uint64_t (*)(uint64_t))((char *)v6 + *v6);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v0 + 592) = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_1000C3BF4;
  uint64_t v8 = *(void *)(v0 + 248);
  return v10(v8);
}

uint64_t sub_1000C3BF4()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 600) = v0;
  swift_task_dealloc();
  (*(void (**)(void, void))(v2[30] + 8))(v2[31], v2[29]);
  if (v0) {
    uint64_t v3 = sub_1000C3EEC;
  }
  else {
    uint64_t v3 = sub_1000C3D5C;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_1000C3D5C()
{
  swift_release();
  swift_errorRelease();
  (*(void (**)(void, void))(v0[52] + 8))(v0[53], v0[51]);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_1000C3EEC()
{
  uint64_t v2 = v0[52];
  uint64_t v1 = v0[53];
  uint64_t v3 = v0[51];
  swift_release();
  swift_errorRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_1000C408C()
{
  swift_release();
  (*(void (**)(void, void))(v0[52] + 8))(v0[53], v0[51]);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_1000C4210()
{
  uint64_t v1 = *(void (**)(void))(v0 + 560);
  *(void *)(v0 + 584) = *(void *)(v0 + 576);
  uint64_t v2 = *(void (**)(uint64_t, uint64_t))(v0 + 504);
  uint64_t v3 = *(void *)(v0 + 368);
  uint64_t v4 = *(void *)(v0 + 352);
  **(_DWORD **)(v0 + 216) = *(_DWORD *)(v0 + 620);
  v1();
  v5._countAndFlagsBits = 0x203A726F727245;
  v5._object = (void *)0xE700000000000000;
  String.append(_:)(v5);
  swift_getErrorValue();
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  *(void *)(v0 + 104) = 0;
  *(void *)(v0 + 112) = 0xE000000000000000;
  Message.content.getter();
  MessageBody.version.getter();
  v2(v3, v4);
  MessageBody.init<A>(serializable:version:)();
  uint64_t v6 = *(int **)(v0 + 136);
  Message.init(operation:content:complete:)();
  uint64_t v10 = (uint64_t (*)(uint64_t))((char *)v6 + *v6);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v0 + 592) = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_1000C3BF4;
  uint64_t v8 = *(void *)(v0 + 248);
  return v10(v8);
}

void *sub_1000C4590()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100005CB0(&qword_1000F1F98);
  __chkstk_darwin(v2 - 8);
  uint64_t v47 = (char *)v45 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for DatabaseConnection.Location();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Log.default.getter();
  uint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Daemon Init", v11, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  type metadata accessor for PhotosFaceNetworkMessageCenter();
  uint64_t v12 = swift_allocObject();
  sub_100005CB0(&qword_1000F3BE8);
  swift_allocObject();
  *(void *)(v12 + 16) = sub_1000BBE98();
  uint64_t v13 = v12;
  v1[3] = v12;
  type metadata accessor for PhotosXPCServer();
  sub_100005CB0(&qword_1000F3BF0);
  static XPCConstants.serviceName.getter();
  XPCMessageCenter.Server.__allocating_init(serviceName:)();
  uint64_t v14 = PhotosXPCServer.__allocating_init(messageCenter:)();
  v1[2] = v14;
  type metadata accessor for PhotosFaceDatabase();
  default argument 0 of PhotosFaceDatabase.init(location:)();
  uint64_t v15 = PhotosFaceDatabase.__allocating_init(location:)();
  v1[10] = v15;
  type metadata accessor for BackgroundTaskManager();
  swift_allocObject();
  uint64_t v16 = sub_1000CE0E0();
  v1[15] = v16;
  type metadata accessor for PhotoCache();
  uint64_t v17 = swift_allocObject();
  swift_retain();
  swift_retain();
  static SystemDirectory.photosFace.getter();
  *(void *)(v17 + OBJC_IVAR____TtC11photosfaced10PhotoCache_database) = v15;
  uint64_t v46 = v16;
  *(void *)(v17 + OBJC_IVAR____TtC11photosfaced10PhotoCache_background) = v16;
  v1[4] = v17;
  type metadata accessor for XPCEventStream();
  v1[16] = XPCEventStream.__allocating_init()();
  type metadata accessor for NetworkMonitor();
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 24) = 0;
  *(void *)(v18 + 16) = [objc_allocWithZone((Class)type metadata accessor for DeviceMonitor()) init];
  v1[17] = v18;
  if (static Platform.current.getter())
  {
    uint64_t v19 = type metadata accessor for WatchPhotoProcessor();
    uint64_t v20 = (void *)swift_allocObject();
    v20[2] = v17;
    v20[3] = v13;
    uint64_t v21 = &off_1000EE8D8;
  }
  else
  {
    uint64_t v19 = type metadata accessor for PhonePhotoProcessor();
    uint64_t v20 = (void *)swift_allocObject();
    v20[5] = 0;
    v20[2] = v17;
    v20[3] = v13;
    uint64_t v21 = &off_1000EE3C8;
  }
  v20[4] = v14;
  v1[8] = v19;
  v1[9] = v21;
  v1[5] = v20;
  uint64_t v48 = v1 + 5;
  type metadata accessor for AlbumProvider();
  uint64_t v22 = swift_allocObject();
  uint64_t v23 = v14;
  uint64_t v24 = v22;
  uint64_t v25 = v23;
  swift_retain_n();
  swift_retain();
  uint64_t v26 = v13;
  swift_retain();
  *(void *)(v24 + 16) = static TestProperties.watchFacePerDaySize.getter();
  sub_100070114((uint64_t)(v1 + 5), (uint64_t)v49);
  type metadata accessor for AlbumDatabase();
  swift_retain();
  uint64_t v27 = AlbumDatabase.__allocating_init(database:)();
  sub_100005CB0(&qword_1000F3BF8);
  swift_allocObject();
  uint64_t v28 = v46;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  v45[0] = v25;
  uint64_t v29 = sub_1000C7F50(0, v25, v24, (uint64_t)v49, v27, v28, v13, v17, v18);
  swift_release();
  v1[11] = v29;
  swift_retain();
  uint64_t v30 = static TestProperties.watchFacePerDaySize.getter();
  v45[1] = type metadata accessor for ShuffleProvider();
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = v30;
  sub_100070114((uint64_t)v48, (uint64_t)v49);
  type metadata accessor for ShuffleDatabase();
  swift_retain();
  uint64_t v32 = v1;
  uint64_t v33 = ShuffleDatabase.__allocating_init(database:)();
  sub_100005CB0(&qword_1000F3C00);
  swift_allocObject();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v34 = v45[0];
  uint64_t v35 = sub_1000C7F50(1, v45[0], v31, (uint64_t)v49, v33, v28, v26, v17, v18);
  swift_release();
  v32[12] = v35;
  type metadata accessor for GalleryDatabase();
  swift_retain();
  uint64_t v36 = GalleryDatabase.__allocating_init(database:)();
  swift_retain();
  uint64_t v37 = static TestProperties.gallerySize.getter();
  uint64_t v38 = swift_allocObject();
  *(void *)(v38 + 16) = v37;
  sub_100070114((uint64_t)v48, (uint64_t)v49);
  sub_100005CB0(&qword_1000F3C08);
  swift_allocObject();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v39 = sub_1000C7F50(2, v34, v38, (uint64_t)v49, v36, v28, v26, v17, v18);
  swift_release();
  v32[13] = v39;
  type metadata accessor for GalleryGeneratorSystem();
  uint64_t v40 = (void *)swift_allocObject();
  v40[2] = v28;
  v40[3] = v39;
  v40[4] = v36;
  v32[14] = v40;
  uint64_t v41 = type metadata accessor for TaskPriority();
  uint64_t v42 = (uint64_t)v47;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 56))(v47, 1, 1, v41);
  unint64_t v43 = (void *)swift_allocObject();
  v43[2] = 0;
  v43[3] = 0;
  v43[4] = v32;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_10006702C(v42, (uint64_t)&unk_1000F3C18, (uint64_t)v43);
  swift_release();
  return v32;
}

uint64_t sub_1000C4CB8()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100005F94;
  return sub_1000C4D48();
}

uint64_t sub_1000C4D48()
{
  v1[2] = v0;
  uint64_t v2 = type metadata accessor for Logger();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  return _swift_task_switch(sub_1000C4E08, 0, 0);
}

uint64_t sub_1000C4E08()
{
  static Log.default.getter();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Daemon Activate", v3, 2u);
    swift_slowDealloc();
  }
  uint64_t v5 = v0[4];
  uint64_t v4 = v0[5];
  uint64_t v7 = v0[2];
  uint64_t v6 = v0[3];

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  v0[6] = *(void *)(v7 + 80);
  type metadata accessor for PhotosFaceDatabase();
  sub_1000CD730(&qword_1000F2FF8, (void (*)(uint64_t))&type metadata accessor for PhotosFaceDatabase);
  uint64_t v9 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_1000C4F6C, v9, v8);
}

uint64_t sub_1000C4F6C()
{
  dispatch thunk of PhotosFaceDatabase.activate()();
  return _swift_task_switch(sub_1000C4FD4, 0, 0);
}

uint64_t sub_1000C4FD4()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1000C5068;
  return sub_10005812C();
}

uint64_t sub_1000C5068()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_1000C5164, 0, 0);
}

uint64_t sub_1000C5164()
{
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v2 = v1[8];
  uint64_t v3 = v1[9];
  sub_10003EB84(v1 + 5, v2);
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v3 + 8) + **(int **)(v3 + 8));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_1000C5268;
  return v6(v2, v3);
}

uint64_t sub_1000C5268()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_1000C5364, 0, 0);
}

uint64_t sub_1000C5364()
{
  v0[9] = *(void *)(v0[2] + 16);
  v0[10] = type metadata accessor for CommunicationActor();
  swift_retain();
  v0[11] = static CommunicationActor.shared.getter();
  v0[12] = sub_1000CD730(&qword_1000F1F70, (void (*)(uint64_t))&type metadata accessor for CommunicationActor);
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_1000C5444, v2, v1);
}

uint64_t sub_1000C5444()
{
  swift_release();
  PhotosXPCServer.registerSendMessage(callback:)();
  swift_release();
  return _swift_task_switch(sub_1000C54D8, 0, 0);
}

uint64_t sub_1000C54D8()
{
  v0[13] = *(void *)(v0[2] + 24);
  v0[14] = static CommunicationActor.shared.getter();
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_1000C5578, v2, v1);
}

uint64_t sub_1000C5578()
{
  swift_release();
  static CommunicationActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_1000C0958(0, (uint64_t)&unk_1000F1FF0, 0, (uint64_t)&unk_1000EF210, (uint64_t)sub_1000CDCC4);
  swift_release();
  return _swift_task_switch(sub_1000C5688, 0, 0);
}

uint64_t sub_1000C5688()
{
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_1000F3C38 + dword_1000F3C38);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 120) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1000C5730;
  return v3();
}

uint64_t sub_1000C5730()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_1000C582C, 0, 0);
}

uint64_t sub_1000C582C()
{
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_1000F3C40 + dword_1000F3C40);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 128) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1000C58D4;
  return v3();
}

uint64_t sub_1000C58D4()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_1000C59D0, 0, 0);
}

uint64_t sub_1000C59D0()
{
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_1000F3C48 + dword_1000F3C48);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 136) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1000C5A78;
  return v3();
}

uint64_t sub_1000C5A78()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_1000C5B74, 0, 0);
}

uint64_t sub_1000C5B74()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 144) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1000C5C08;
  return sub_10001BABC();
}

uint64_t sub_1000C5C08()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_1000C5D04, 0, 0);
}

uint64_t sub_1000C5D04()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) + 120);
  *(void *)(v0 + 152) = v1;
  return _swift_task_switch(sub_1000C5D28, v1, 0);
}

uint64_t sub_1000C5D28()
{
  sub_1000CE344();
  return _swift_task_switch(sub_1000C5D90, 0, 0);
}

uint64_t sub_1000C5D90()
{
  *(void *)(v0 + 160) = static CommunicationActor.shared.getter();
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_1000C5E24, v2, v1);
}

uint64_t sub_1000C5E24()
{
  swift_release();
  sub_1000BC03C();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 168) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1000C5ECC;
  return PhotosXPCServer.activate()();
}

uint64_t sub_1000C5ECC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000C5FDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return _swift_task_switch(sub_1000C6000, 0, 0);
}

uint64_t sub_1000C6000()
{
  v0[5] = *(void *)(v0[4] + 24);
  type metadata accessor for CommunicationActor();
  v0[6] = static CommunicationActor.shared.getter();
  sub_1000CD730(&qword_1000F1F70, (void (*)(uint64_t))&type metadata accessor for CommunicationActor);
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
  v0[7] = v2;
  v0[8] = v1;
  return _swift_task_switch(sub_1000C60D0, v2, v1);
}

uint64_t sub_1000C60D0()
{
  uint64_t v5 = (uint64_t (*)(char, uint64_t, uint64_t, char))((char *)&dword_1000F1FF8 + dword_1000F1FF8);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[9] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1000C6184;
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  return v5(0, v2, v3, 1);
}

uint64_t sub_1000C6184(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(void **)v3;
  *(void *)(*(void *)v3 + 80) = v2;
  swift_task_dealloc();
  if (v2)
  {
    uint64_t v7 = v6[7];
    uint64_t v8 = v6[8];
    uint64_t v9 = sub_1000047A0;
  }
  else
  {
    v6[11] = a2;
    v6[12] = a1;
    uint64_t v7 = v6[7];
    uint64_t v8 = v6[8];
    uint64_t v9 = sub_1000C62B8;
  }
  return _swift_task_switch(v9, v7, v8);
}

uint64_t sub_1000C62B8()
{
  swift_release();
  uint64_t v1 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
  uint64_t v3 = v0[11];
  uint64_t v2 = v0[12];
  return v1(v2, v3);
}

uint64_t sub_1000C6320(uint64_t a1, uint64_t a2)
{
  v2[3] = a1;
  v2[4] = a2;
  uint64_t v3 = type metadata accessor for Logger();
  v2[5] = v3;
  v2[6] = *(void *)(v3 - 8);
  v2[7] = swift_task_alloc();
  return _swift_task_switch(sub_1000C63E0, 0, 0);
}

uint64_t sub_1000C63E0()
{
  uint64_t v19 = v0;
  static Log.default.getter();
  swift_bridgeObjectRetain_n();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v14 = v0[6];
    unint64_t v3 = v0[4];
    uint64_t v15 = v0[5];
    uint64_t v16 = v0[7];
    uint64_t v4 = v0[3];
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315138;
    swift_bridgeObjectRetain();
    v0[2] = sub_100007E88(v4, v3, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Hello: %s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v16, v15);
  }
  else
  {
    uint64_t v7 = v0[6];
    uint64_t v6 = v0[7];
    uint64_t v8 = v0[5];
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  }
  Swift::String v9 = *(Swift::String *)(v0 + 3);
  uint64_t v17 = 0x203A6F6C6C6548;
  unint64_t v18 = 0xE700000000000000;
  String.append(_:)(v9);
  uint64_t v10 = v17;
  unint64_t v11 = v18;
  swift_task_dealloc();
  uint64_t v12 = (uint64_t (*)(uint64_t, unint64_t))v0[1];
  return v12(v10, v11);
}

uint64_t sub_1000C6614()
{
  swift_release();
  swift_release();
  swift_release();
  sub_100009090(v0 + 40);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_1000C668C()
{
  sub_1000C6614();

  return _swift_deallocClassInstance(v0, 144, 7);
}

uint64_t type metadata accessor for Daemon()
{
  return self;
}

uint64_t sub_1000C66E4(uint64_t isStackAllocationSafe, uint64_t a2)
{
  uint64_t v3 = isStackAllocationSafe;
  char v4 = *(unsigned char *)(a2 + 32);
  unint64_t v5 = (unint64_t)((1 << v4) + 63) >> 6;
  size_t v6 = 8 * v5;
  if ((v4 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe);
    bzero((char *)&v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v6);
    uint64_t v7 = sub_1000C686C((unint64_t *)((char *)&v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0)), v5, v3, a2);
    swift_release();
  }
  else
  {
    uint64_t v8 = (void *)swift_slowAlloc();
    bzero(v8, v6);
    uint64_t v7 = sub_1000C686C((unint64_t *)v8, v5, v3, a2);
    swift_release();
    swift_slowDealloc();
  }
  return v7;
}

uint64_t sub_1000C686C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v41 = a1;
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  int v54 = (char *)&v36 - v13;
  uint64_t v14 = sub_100005CB0(&qword_1000F2858);
  __chkstk_darwin(v14 - 8);
  uint64_t v16 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = *(void *)(a3 + 16);
  uint64_t v39 = a3;
  if (v49)
  {
    uint64_t v37 = a2;
    uint64_t v38 = v4;
    unint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
    uint64_t v17 = v9 + 16;
    uint64_t v48 = a3 + ((*(unsigned __int8 *)(v17 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 64));
    uint64_t v52 = *(void *)(v17 + 56);
    v53 = v18;
    uint64_t v45 = (void (**)(char *, char *, uint64_t))(v17 + 16);
    uint64_t v46 = (unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 32);
    uint64_t v51 = a4 + 56;
    uint64_t v19 = (void (**)(char *, uint64_t))(v17 - 8);
    swift_bridgeObjectRetain();
    uint64_t v40 = 0;
    uint64_t v20 = 0;
    uint64_t v47 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 40);
    unint64_t v36 = (v17 + 40) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    uint64_t v42 = v16;
    while (1)
    {
      v53(v16, v48 + v52 * v20, v8);
      uint64_t v44 = *v47;
      v44(v16, 0, 1, v8);
      if ((*v46)(v16, 1, v8) == 1)
      {
        a2 = v37;
        uint64_t v35 = v40;
        goto LABEL_21;
      }
      uint64_t v50 = v20;
      (*v45)(v54, v16, v8);
      sub_1000CD730(&qword_1000F2648, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v21 = dispatch thunk of Hashable._rawHashValue(seed:)();
      uint64_t v22 = -1 << *(unsigned char *)(a4 + 32);
      unint64_t v23 = v21 & ~v22;
      if (((*(void *)(v51 + ((v23 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v23) & 1) == 0) {
        break;
      }
      uint64_t v43 = (unint64_t)v19 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
      uint64_t v24 = v17;
      uint64_t v25 = a4;
      uint64_t v26 = ~v22;
      while (1)
      {
        v53(v12, *(void *)(v25 + 48) + v23 * v52, v8);
        sub_1000CD730(&qword_1000F2650, (void (*)(uint64_t))&type metadata accessor for UUID);
        char v27 = dispatch thunk of static Equatable.== infix(_:_:)();
        uint64_t v28 = *v19;
        (*v19)(v12, v8);
        if (v27) {
          break;
        }
        unint64_t v23 = (v23 + 1) & v26;
        if (((*(void *)(v51 + ((v23 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v23) & 1) == 0)
        {
          a4 = v25;
          uint64_t v17 = v24;
          uint64_t v16 = v42;
          goto LABEL_10;
        }
      }
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v28)(v54, v8);
      uint64_t v30 = (v23 >> 3) & 0x1FFFFFFFFFFFFFF8;
      uint64_t v31 = *(unint64_t *)((char *)v41 + v30);
      *(unint64_t *)((char *)v41 + v30) = v31 | (1 << v23);
      if ((v31 & (1 << v23)) != 0)
      {
        a4 = v25;
        uint64_t v17 = v24;
        uint64_t v16 = v42;
LABEL_13:
        uint64_t v32 = v50;
        goto LABEL_14;
      }
      BOOL v33 = __OFADD__(v40++, 1);
      uint64_t v32 = v50;
      if (v33)
      {
        __break(1u);
        return result;
      }
      a4 = v25;
      uint64_t v17 = v24;
      uint64_t v16 = v42;
LABEL_14:
      uint64_t v20 = v32 + 1;
      if (v20 == v49)
      {
        a2 = v37;
        uint64_t v35 = v40;
        v44(v16, 1, 1, v8);
        goto LABEL_21;
      }
    }
    uint64_t v28 = *v19;
LABEL_10:
    v28(v54, v8);
    goto LABEL_13;
  }
  uint64_t v34 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
  swift_bridgeObjectRetain();
  uint64_t v35 = 0;
  v34(v16, 1, 1, v8);
LABEL_21:
  swift_bridgeObjectRelease();
  swift_retain();
  return sub_1000616B0(v41, a2, v35, a4);
}

uint64_t sub_1000C6D0C(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, int a5, uint64_t a6, int a7)
{
  char v14 = *a4;
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v15;
  *uint64_t v15 = v7;
  v15[1] = sub_100005F94;
  return sub_1000C2054(a1, a2, a3, v14, a5, a6, a7);
}

uint64_t sub_1000C6DEC(uint64_t a1)
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

void *sub_1000C6E74(void *result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  if (a2 < 0 || 1 << *(unsigned char *)(a5 + 32) <= a2)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(void *)(a5 + 8 * ((unint64_t)a2 >> 6) + 64) >> a2) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a5 + 36) == a3)
  {
    uint64_t v5 = *(void *)(*(void *)(a5 + 48) + 8 * a2);
    *uint64_t result = *(void *)(*(void *)(a5 + 56) + 8 * a2);
    swift_bridgeObjectRetain();
    return (void *)v5;
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_1000C6EF4(uint64_t result, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(void))
{
  if (a2 < 0 || 1 << *(unsigned char *)(a5 + 32) <= a2)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (((*(void *)(a5 + 8 * ((unint64_t)a2 >> 6) + 64) >> a2) & 1) == 0)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (*(_DWORD *)(a5 + 36) != a3)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  uint64_t v7 = result;
  uint64_t v8 = *(void *)(a5 + 48);
  uint64_t v9 = a6(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8 + *(void *)(*(void *)(v9 - 8) + 72) * a2, v9);

  return swift_bridgeObjectRetain();
}

uint64_t sub_1000C6FC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a1;
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 24) = v8;
  *uint64_t v8 = v4;
  v8[1] = sub_1000CDED8;
  return sub_1000B7F60(a2, a3, a4);
}

uint64_t sub_1000C7078(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v5 = *a2;
  uint64_t v6 = a2[1];
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)a3 + *a3);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_100005F94;
  return v9(a1, v5, v6);
}

uint64_t sub_1000C7168(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  uint64_t FaceRequest = type metadata accessor for FetchFaceRequest();
  v3[5] = FaceRequest;
  uint64_t v5 = *(void *)(FaceRequest - 8);
  v3[6] = v5;
  v3[7] = *(void *)(v5 + 64);
  v3[8] = swift_task_alloc();
  v3[9] = type metadata accessor for CommunicationActor();
  v3[10] = static CommunicationActor.shared.getter();
  v3[11] = sub_1000CD730(&qword_1000F1F70, (void (*)(uint64_t))&type metadata accessor for CommunicationActor);
  uint64_t v7 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_1000C72A0, v7, v6);
}

uint64_t sub_1000C72A0()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = v0[6];
  uint64_t v4 = v0[4];
  uint64_t v3 = v0[5];
  uint64_t v5 = v0[3];
  uint64_t v11 = (uint64_t *)v0[2];
  swift_release();
  static CommunicationActor.shared.getter();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v5, v3);
  unint64_t v6 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v4;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v2 + 32))(v7 + v6, v1, v3);
  type metadata accessor for StoredPhoto();
  swift_retain();
  uint64_t v8 = generateElements<A>(isolation:_:)();
  swift_release();
  *uint64_t v11 = v8;
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_1000C73FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a1;
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 24) = v8;
  *uint64_t v8 = v4;
  v8[1] = sub_1000CDED8;
  return sub_1000B8960(a2, a3, a4);
}

uint64_t sub_1000C74AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  uint64_t FaceRequest = type metadata accessor for FetchFaceRequest();
  v3[5] = FaceRequest;
  uint64_t v5 = *(void *)(FaceRequest - 8);
  v3[6] = v5;
  v3[7] = *(void *)(v5 + 64);
  v3[8] = swift_task_alloc();
  v3[9] = type metadata accessor for CommunicationActor();
  v3[10] = static CommunicationActor.shared.getter();
  v3[11] = sub_1000CD730(&qword_1000F1F70, (void (*)(uint64_t))&type metadata accessor for CommunicationActor);
  uint64_t v7 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_1000C75E4, v7, v6);
}

uint64_t sub_1000C75E4()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = v0[6];
  uint64_t v4 = v0[4];
  uint64_t v3 = v0[5];
  uint64_t v5 = v0[3];
  uint64_t v11 = (uint64_t *)v0[2];
  swift_release();
  static CommunicationActor.shared.getter();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v5, v3);
  unint64_t v6 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v4;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v2 + 32))(v7 + v6, v1, v3);
  type metadata accessor for StoredPhoto();
  swift_retain();
  uint64_t v8 = generateElements<A>(isolation:_:)();
  swift_release();
  *uint64_t v11 = v8;
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_1000C7740(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a1;
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 24) = v8;
  *uint64_t v8 = v4;
  v8[1] = sub_1000C77F0;
  return sub_1000B9964(a2, a3, a4);
}

uint64_t sub_1000C77F0(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (!v1) {
    **(void **)(v4 + 16) = a1;
  }
  unint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
  return v6();
}

uint64_t sub_1000C7900(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  uint64_t FaceRequest = type metadata accessor for FetchFaceRequest();
  v3[5] = FaceRequest;
  uint64_t v5 = *(void *)(FaceRequest - 8);
  v3[6] = v5;
  v3[7] = *(void *)(v5 + 64);
  v3[8] = swift_task_alloc();
  v3[9] = type metadata accessor for CommunicationActor();
  v3[10] = static CommunicationActor.shared.getter();
  v3[11] = sub_1000CD730(&qword_1000F1F70, (void (*)(uint64_t))&type metadata accessor for CommunicationActor);
  uint64_t v7 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_1000C7A38, v7, v6);
}

uint64_t sub_1000C7A38()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = v0[6];
  uint64_t v4 = v0[4];
  uint64_t v3 = v0[5];
  uint64_t v5 = v0[3];
  uint64_t v11 = (uint64_t *)v0[2];
  swift_release();
  static CommunicationActor.shared.getter();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v5, v3);
  unint64_t v6 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v4;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v2 + 32))(v7 + v6, v1, v3);
  type metadata accessor for StoredPhoto();
  swift_retain();
  uint64_t v8 = generateElements<A>(isolation:_:)();
  swift_release();
  *uint64_t v11 = v8;
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

unint64_t sub_1000C7B94(unint64_t result)
{
  unint64_t v1 = result;
  unint64_t v2 = result >> 62;
  if (result >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = _CocoaArrayWrapper.endIndex.getter();
    uint64_t result = swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      sub_100005CB0(&qword_1000F3038);
      uint64_t result = static _SetStorage.allocate(capacity:)();
      uint64_t v3 = (unsigned char *)result;
      uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
      if (!v2) {
        goto LABEL_4;
      }
      goto LABEL_8;
    }
  }
  else if (*(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  uint64_t v3 = &_swiftEmptySetSingleton;
  uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
  if (!v2)
  {
LABEL_4:
    uint64_t v5 = *(void *)(v4 + 16);
    if (!v5) {
      return (unint64_t)v3;
    }
    goto LABEL_9;
  }
LABEL_8:
  swift_bridgeObjectRetain();
  uint64_t v5 = _CocoaArrayWrapper.endIndex.getter();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v5) {
    return (unint64_t)v3;
  }
LABEL_9:
  uint64_t v7 = v3 + 56;
  uint64_t v35 = v5;
  if ((v1 & 0xC000000000000001) != 0)
  {
    uint64_t v8 = 0;
    while (1)
    {
      uint64_t result = specialized _ArrayBuffer._getElementSlowPath(_:)();
      BOOL v9 = __OFADD__(v8++, 1);
      if (v9) {
        break;
      }
      unint64_t v10 = result;
      Hasher.init(_seed:)();
      swift_retain();
      Swift::UInt64 v11 = NWConnection.identifier.getter();
      swift_release();
      Hasher._combine(_:)(v11);
      uint64_t result = Hasher._finalize()();
      uint64_t v12 = ~(-1 << v3[32]);
      unint64_t v13 = result & v12;
      unint64_t v14 = (result & v12) >> 6;
      uint64_t v15 = *(void *)&v7[8 * v14];
      uint64_t v16 = 1 << (result & v12);
      if ((v16 & v15) != 0)
      {
        while (1)
        {
          swift_retain();
          swift_retain();
          uint64_t v17 = NWConnection.identifier.getter();
          swift_release();
          swift_retain();
          uint64_t v18 = NWConnection.identifier.getter();
          swift_release();
          uint64_t result = swift_release();
          if (v17 == v18) {
            break;
          }
          unint64_t v13 = (v13 + 1) & v12;
          unint64_t v14 = v13 >> 6;
          uint64_t v15 = *(void *)&v7[8 * (v13 >> 6)];
          uint64_t v16 = 1 << v13;
          if ((v15 & (1 << v13)) == 0)
          {
            uint64_t v5 = v35;
            goto LABEL_17;
          }
        }
        swift_unknownObjectRelease();
        uint64_t v5 = v35;
        if (v8 == v35) {
          return (unint64_t)v3;
        }
      }
      else
      {
LABEL_17:
        *(void *)&v7[8 * v14] = v16 | v15;
        *(void *)(*((void *)v3 + 6) + 8 * v13) = v10;
        uint64_t v19 = *((void *)v3 + 2);
        BOOL v9 = __OFADD__(v19, 1);
        uint64_t v20 = v19 + 1;
        if (v9) {
          goto LABEL_30;
        }
        *((void *)v3 + 2) = v20;
        if (v8 == v5) {
          return (unint64_t)v3;
        }
      }
    }
    __break(1u);
LABEL_30:
    __break(1u);
  }
  else
  {
    uint64_t v21 = 0;
    unint64_t v33 = v1 + 32;
    uint64_t v34 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    while (v21 != v34)
    {
      uint64_t v22 = *(void *)(v33 + 8 * v21);
      Hasher.init(_seed:)();
      swift_retain();
      swift_retain();
      Swift::UInt64 v23 = NWConnection.identifier.getter();
      swift_release();
      Hasher._combine(_:)(v23);
      uint64_t result = Hasher._finalize()();
      uint64_t v24 = ~(-1 << v3[32]);
      unint64_t v25 = result & v24;
      unint64_t v26 = (result & v24) >> 6;
      uint64_t v27 = *(void *)&v7[8 * v26];
      uint64_t v28 = 1 << (result & v24);
      if ((v28 & v27) != 0)
      {
        while (1)
        {
          swift_retain();
          swift_retain();
          uint64_t v29 = NWConnection.identifier.getter();
          swift_release();
          swift_retain();
          uint64_t v30 = NWConnection.identifier.getter();
          swift_release();
          uint64_t result = swift_release();
          if (v29 == v30) {
            break;
          }
          unint64_t v25 = (v25 + 1) & v24;
          unint64_t v26 = v25 >> 6;
          uint64_t v27 = *(void *)&v7[8 * (v25 >> 6)];
          uint64_t v28 = 1 << v25;
          if ((v27 & (1 << v25)) == 0) {
            goto LABEL_27;
          }
        }
        uint64_t result = swift_release();
      }
      else
      {
LABEL_27:
        *(void *)&v7[8 * v26] = v28 | v27;
        *(void *)(*((void *)v3 + 6) + 8 * v25) = v22;
        uint64_t v31 = *((void *)v3 + 2);
        BOOL v9 = __OFADD__(v31, 1);
        uint64_t v32 = v31 + 1;
        if (v9) {
          goto LABEL_32;
        }
        *((void *)v3 + 2) = v32;
      }
      if (++v21 == v35) {
        return (unint64_t)v3;
      }
    }
  }
  __break(1u);
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_1000C7F50(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(unsigned char *)(v9 + 16) = a1;
  *(void *)(v9 + 24) = a2;
  *(void *)(v9 + 32) = a3;
  sub_100070114(a4, v9 + 40);
  *(void *)(v9 + 80) = a5;
  *(void *)(v9 + 88) = a6;
  *(void *)(v9 + 96) = a7;
  *(void *)(v9 + 104) = a8;
  swift_retain();
  unint64_t v15 = sub_100040590((uint64_t)&_swiftEmptyArrayStorage);
  sub_100009090(a4);
  *(void *)(v9 + 112) = v15;
  *(void *)(v9 + 120) = a9;
  return v9;
}

uint64_t sub_1000C7FE4()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000C8024()
{
  unint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *unint64_t v1 = v0;
  v1[1] = sub_100005F94;
  unint64_t v2 = (void *)swift_task_alloc();
  v1[2] = v2;
  void *v2 = v1;
  v2[1] = sub_100005F94;
  return sub_1000C4D48();
}

uint64_t sub_1000C80F8(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *uint64_t v6 = v3;
  v6[3] = a2;
  v6[4] = v2;
  v6[1] = sub_100056100;
  v6[2] = a1;
  return _swift_task_switch(sub_1000C6000, 0, 0);
}

uint64_t sub_1000C81B0()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000C81E8(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1000043B4;
  return sub_1000BC23C(a1, v1);
}

uint64_t sub_1000C8280()
{
  uint64_t v1 = type metadata accessor for Message();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 3) & 0xFFFFFFFFFFFFFFFCLL) + 4;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v6, v5);
}

uint64_t sub_1000C8358(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(void *)(type metadata accessor for Message() - 8);
  unint64_t v7 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = *(void *)(v2 + 16);
  uint64_t v9 = (char *)(v2 + 24);
  int v10 = *(_DWORD *)(v2 + 28);
  uint64_t v11 = v2 + v7;
  int v12 = *(_DWORD *)(v2 + ((*(void *)(v6 + 64) + v7 + 3) & 0xFFFFFFFFFFFFFFFCLL));
  unint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v13;
  *unint64_t v13 = v3;
  v13[1] = sub_100005F94;
  unint64_t v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, char *, int, uint64_t, int))((char *)&dword_1000F3C70
                                                                                     + dword_1000F3C70);
  return v14(a1, a2, v8, v9, v10, v11, v12);
}

uint64_t sub_1000C84A0(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(int **)(v2 + 16);
  unint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *unint64_t v7 = v3;
  v7[1] = sub_100005F94;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1000F3C80 + dword_1000F3C80);
  return v8(a1, a2, v6);
}

uint64_t sub_1000C8564()
{
  uint64_t v1 = type metadata accessor for Message();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 20) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_1000C85F4(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(void *)(type metadata accessor for Message() - 8);
  int v7 = *(_DWORD *)(v2 + 16);
  uint64_t v8 = v2 + ((*(unsigned __int8 *)(v6 + 80) + 20) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v9;
  *uint64_t v9 = v3;
  v9[1] = sub_100005F94;
  return sub_10007D31C(a1, a2, v7, v8);
}

uint64_t sub_1000C86E0(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(int **)(v2 + 16);
  int v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *int v7 = v3;
  v7[1] = sub_1000043B4;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1000F3C80 + dword_1000F3C80);
  return v8(a1, a2, v6);
}

uint64_t sub_1000C87A4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100005F94;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_1000F3E80 + dword_1000F3E80);
  uint64_t v6 = (void *)swift_task_alloc();
  v5[2] = v6;
  *uint64_t v6 = v5;
  v6[1] = sub_100005F94;
  return v8(a1, a2);
}

uint64_t sub_1000C88A4(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100005F94;
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)&dword_1000F3E78 + dword_1000F3E78);
  uint64_t v4 = (void *)swift_task_alloc();
  v3[2] = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_100005F94;
  return v6(a1);
}

uint64_t sub_1000C8998()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1000CDF50;
  return sub_100087694();
}

uint64_t sub_1000C8A28(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_100005F94;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_1000F3D08 + dword_1000F3D08);
  return v7(a1, a2, v2);
}

uint64_t sub_1000C8AE0(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_1000CDF50;
  return sub_100087B88(a1);
}

uint64_t sub_1000C8B78(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1000CDF50;
  return sub_100088160(a1, v1);
}

uint64_t sub_1000C8C10()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100005F94;
  uint64_t v4 = (uint64_t (*)(void))((char *)&dword_1000F2968 + dword_1000F2968);
  uint64_t v2 = (void *)swift_task_alloc();
  v1[2] = v2;
  void *v2 = v1;
  v2[1] = sub_100005F94;
  return v4();
}

uint64_t sub_1000C8CF8()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100005F94;
  uint64_t v4 = (uint64_t (*)(void))((char *)&dword_1000F3DA0 + dword_1000F3DA0);
  uint64_t v2 = (void *)swift_task_alloc();
  v1[2] = v2;
  void *v2 = v1;
  v2[1] = sub_100005F94;
  return v4();
}

uint64_t sub_1000C8DE0()
{
  uint64_t v2 = *(int **)(v0 + 16);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100040458;
  return sub_1000CE788(v2);
}

uint64_t sub_1000C8E78(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100005F94;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_1000F3E80 + dword_1000F3E80);
  uint64_t v6 = (void *)swift_task_alloc();
  v5[2] = v6;
  *uint64_t v6 = v5;
  v6[1] = sub_100005F94;
  return v8(a1, a2);
}

uint64_t sub_1000C8F78(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100005F94;
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)&dword_1000F3E78 + dword_1000F3E78);
  uint64_t v4 = (void *)swift_task_alloc();
  v3[2] = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_100005F94;
  return v6(a1);
}

uint64_t sub_1000C906C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100005F94;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_1000F3DF8 + dword_1000F3DF8);
  uint64_t v6 = (void *)swift_task_alloc();
  v5[2] = v6;
  *uint64_t v6 = v5;
  v6[1] = sub_100005F94;
  return v8(a1, a2);
}

uint64_t sub_1000C916C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100005F94;
  uint64_t v4 = (uint64_t (*)(void))((char *)&dword_1000F3DA0 + dword_1000F3DA0);
  uint64_t v2 = (void *)swift_task_alloc();
  v1[2] = v2;
  void *v2 = v1;
  v2[1] = sub_100005F94;
  return v4();
}

uint64_t sub_1000C9258()
{
  return 40;
}

__n128 sub_1000C9264(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 16);
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

BOOL sub_1000C9278(uint64_t a1, uint64_t a2, int a3)
{
  return sub_10005B7F8(a1, a2, a3);
}

void *sub_1000C9280(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v21 = a2;
  uint64_t v20 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  uint64_t v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = _swiftEmptyArrayStorage;
  if (v10)
  {
    v18[1] = v4;
    uint64_t v22 = _swiftEmptyArrayStorage;
    sub_100054824(0, v10, 0);
    uint64_t v11 = v22;
    uint64_t v12 = *(void *)(a4(0) - 8);
    uint64_t v13 = a1 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
    type metadata accessor for CommunicationActor();
    uint64_t v19 = *(void *)(v12 + 72);
    v18[2] = v7 + 32;
    do
    {
      static CommunicationActor.shared.getter();
      sub_1000CD730(&qword_1000F1F70, (void (*)(uint64_t))&type metadata accessor for CommunicationActor);
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_getAtKeyPath();
      swift_release();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v22 = v11;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_100054824(0, v11[2] + 1, 1);
        uint64_t v11 = v22;
      }
      unint64_t v16 = v11[2];
      unint64_t v15 = v11[3];
      if (v16 >= v15 >> 1)
      {
        sub_100054824(v15 > 1, v16 + 1, 1);
        uint64_t v11 = v22;
      }
      v11[2] = v16 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))((unint64_t)v11+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(void *)(v7 + 72) * v16, v9, v20);
      uint64_t v22 = v11;
      v13 += v19;
      --v10;
    }
    while (v10);
  }
  return v11;
}

void *sub_1000C953C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  int64_t v4 = *(void *)(a1 + 16);
  if (v4)
  {
    sub_100054938(0, v4, 0);
    uint64_t v7 = *(void *)(sub_100005CB0(a4) - 8);
    uint64_t v8 = a1 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
    type metadata accessor for CommunicationActor();
    uint64_t v9 = *(void *)(v7 + 72);
    do
    {
      static CommunicationActor.shared.getter();
      sub_1000CD730(&qword_1000F1F70, (void (*)(uint64_t))&type metadata accessor for CommunicationActor);
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_getAtKeyPath();
      swift_release();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        sub_100054938(0, _swiftEmptyArrayStorage[2] + 1, 1);
      }
      unint64_t v11 = _swiftEmptyArrayStorage[2];
      unint64_t v10 = _swiftEmptyArrayStorage[3];
      if (v11 >= v10 >> 1) {
        sub_100054938(v10 > 1, v11 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v11 + 1;
      _swiftEmptyArrayStorage[v11 + 4] = v13;
      v8 += v9;
      --v4;
    }
    while (v4);
  }
  return _swiftEmptyArrayStorage;
}

unint64_t *sub_1000C9738(uint64_t a1, uint64_t (*a2)(void, void, void), uint64_t a3)
{
  uint64_t v7 = sub_100005CB0(&qword_1000F2E40);
  uint64_t v8 = __chkstk_darwin(v7);
  unint64_t v10 = (char *)v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v13 = (char *)v23 - v12;
  __n128 result = (unint64_t *)&_swiftEmptyArrayStorage;
  uint64_t v28 = (unint64_t *)&_swiftEmptyArrayStorage;
  uint64_t v15 = *(void *)(a1 + 16);
  if (v15)
  {
    v23[1] = v3;
    uint64_t v16 = *(void *)(v11 + 72);
    unint64_t v25 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
    uint64_t v17 = a1 + v25;
    uint64_t v18 = (unint64_t *)&_swiftEmptyArrayStorage;
    uint64_t v26 = a3;
    uint64_t v27 = a2;
    uint64_t v24 = v7;
    do
    {
      sub_1000CAD3C(v17, (uint64_t)v13);
      if (a2(v13, *(void *)&v13[*(int *)(v7 + 48)], v13[*(int *)(v7 + 64)]))
      {
        uint64_t v19 = (uint64_t)v10;
        sub_100055708((uint64_t)v13, (uint64_t)v10, &qword_1000F2E40);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_1000548D8(0, v18[2] + 1, 1);
        }
        uint64_t v18 = v28;
        unint64_t v21 = v28[2];
        unint64_t v20 = v28[3];
        if (v21 >= v20 >> 1)
        {
          sub_1000548D8(v20 > 1, v21 + 1, 1);
          uint64_t v18 = v28;
        }
        v18[2] = v21 + 1;
        uint64_t v22 = (uint64_t)v18 + v25 + v21 * v16;
        unint64_t v10 = (char *)v19;
        sub_100055708(v19, v22, &qword_1000F2E40);
        a2 = v27;
        uint64_t v7 = v24;
      }
      else
      {
        sub_100016B90((uint64_t)v13, &qword_1000F2E40);
      }
      v17 += v16;
      --v15;
    }
    while (v15);
    return v28;
  }
  return result;
}

uint64_t sub_1000C9968()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t sub_1000C9988()
{
  return 40;
}

__n128 sub_1000C9994(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 16);
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

char *sub_1000C99A8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for UUID();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v51 = (char *)&v34 - v10;
  uint64_t v11 = type metadata accessor for StoredPhoto();
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v44 = (char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v47 = (char *)&v34 - v15;
  __n128 result = (char *)_swiftEmptyArrayStorage;
  uint64_t v52 = (char *)_swiftEmptyArrayStorage;
  uint64_t v42 = *(void *)(a1 + 16);
  if (v42)
  {
    uint64_t v17 = 0;
    uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
    uint64_t v18 = v14 + 16;
    unint64_t v20 = (*(unsigned __int8 *)(v18 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 64);
    uint64_t v36 = v6;
    unint64_t v37 = v20;
    uint64_t v38 = a1 + v20;
    uint64_t v39 = v19;
    uint64_t v45 = *(void *)(v18 + 56);
    uint64_t v48 = v6 + 16;
    uint64_t v49 = a2 + 56;
    uint64_t v50 = (void (**)(char *, uint64_t))(v6 + 8);
    uint64_t v34 = v2;
    uint64_t v35 = (void (**)(char *, uint64_t))(v18 - 8);
    uint64_t v43 = (void (**)(char *, char *, uint64_t))(v18 + 16);
    uint64_t v40 = v18;
    uint64_t v41 = v11;
    do
    {
      uint64_t v46 = v17;
      v39(v47, v38 + v45 * v17, v11);
      StoredPhoto.localIdentifier.getter();
      if (*(void *)(a2 + 16)
        && (sub_1000CD730(&qword_1000F2648, (void (*)(uint64_t))&type metadata accessor for UUID),
            uint64_t v21 = dispatch thunk of Hashable._rawHashValue(seed:)(),
            uint64_t v22 = -1 << *(unsigned char *)(a2 + 32),
            unint64_t v23 = v21 & ~v22,
            ((*(void *)(v49 + ((v23 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v23) & 1) != 0))
      {
        uint64_t v24 = ~v22;
        uint64_t v25 = *(void *)(v36 + 72);
        uint64_t v26 = *(void (**)(char *, unint64_t, uint64_t))(v36 + 16);
        while (1)
        {
          uint64_t v27 = a2;
          v26(v9, *(void *)(a2 + 48) + v25 * v23, v5);
          sub_1000CD730(&qword_1000F2650, (void (*)(uint64_t))&type metadata accessor for UUID);
          char v28 = dispatch thunk of static Equatable.== infix(_:_:)();
          uint64_t v29 = *v50;
          (*v50)(v9, v5);
          if (v28) {
            break;
          }
          unint64_t v23 = (v23 + 1) & v24;
          a2 = v27;
          if (((*(void *)(v49 + ((v23 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v23) & 1) == 0) {
            goto LABEL_10;
          }
        }
        v29(v51, v5);
        uint64_t v11 = v41;
        (*v35)(v47, v41);
        a2 = v27;
      }
      else
      {
LABEL_10:
        (*v50)(v51, v5);
        uint64_t v30 = *v43;
        uint64_t v11 = v41;
        (*v43)(v44, v47, v41);
        uint64_t v31 = v52;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_10005489C(0, *((void *)v31 + 2) + 1, 1);
          uint64_t v31 = v52;
        }
        unint64_t v33 = *((void *)v31 + 2);
        unint64_t v32 = *((void *)v31 + 3);
        if (v33 >= v32 >> 1)
        {
          sub_10005489C(v32 > 1, v33 + 1, 1);
          uint64_t v31 = v52;
        }
        *((void *)v31 + 2) = v33 + 1;
        v30(&v31[v37 + v33 * v45], v44, v11);
        uint64_t v52 = v31;
      }
      uint64_t v17 = v46 + 1;
    }
    while (v46 + 1 != v42);
    return v52;
  }
  return result;
}

uint64_t sub_1000C9E3C()
{
  return 40;
}

__n128 sub_1000C9E48(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 16);
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

char *sub_1000C9E5C(uint64_t a1, uint64_t a2, uint64_t *a3, void (*a4)(BOOL, uint64_t, uint64_t))
{
  uint64_t v24 = (void (*)(BOOL, uint64_t, uint64_t))a4;
  uint64_t v31 = sub_100005CB0(a3);
  uint64_t v7 = __chkstk_darwin(v31);
  uint64_t v30 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v23 - v10;
  __n128 result = (char *)_swiftEmptyArrayStorage;
  unint64_t v33 = (char *)_swiftEmptyArrayStorage;
  uint64_t v13 = *(void *)(a1 + 16);
  if (v13)
  {
    uint64_t v23 = v4;
    uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
    uint64_t v14 = v9 + 16;
    uint64_t v16 = *(void *)(v14 + 56);
    unint64_t v26 = (*(unsigned __int8 *)(v14 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 64);
    uint64_t v27 = a2;
    uint64_t v17 = a1 + v26;
    uint64_t v25 = (void (**)(char *, uint64_t))(v14 - 8);
    char v28 = (void (**)(char *, char *, uint64_t))(v14 + 16);
    uint64_t v29 = v15;
    do
    {
      uint64_t v18 = v14;
      v29(v11, v17, v31);
      type metadata accessor for CommunicationActor();
      static CommunicationActor.shared.getter();
      sub_1000CD730(&qword_1000F1F70, (void (*)(uint64_t))&type metadata accessor for CommunicationActor);
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_getAtKeyPath();
      swift_release();
      if (v32 == 1)
      {
        uint64_t v19 = *v28;
        (*v28)(v30, v11, v31);
        unint64_t v20 = v33;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          v24(0, *((void *)v20 + 2) + 1, 1);
          unint64_t v20 = v33;
        }
        unint64_t v22 = *((void *)v20 + 2);
        unint64_t v21 = *((void *)v20 + 3);
        if (v22 >= v21 >> 1)
        {
          v24(v21 > 1, v22 + 1, 1);
          unint64_t v20 = v33;
        }
        *((void *)v20 + 2) = v22 + 1;
        v19(&v20[v26 + v22 * v16], v30, v31);
      }
      else
      {
        (*v25)(v11, v31);
      }
      v17 += v16;
      --v13;
      uint64_t v14 = v18;
    }
    while (v13);
    return v33;
  }
  return result;
}

char *sub_1000CA14C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for UUID();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v55 = (char *)v37 - v10;
  uint64_t v11 = type metadata accessor for ShuffleID();
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v41 = (char *)v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)v37 - v14;
  __n128 result = (char *)_swiftEmptyArrayStorage;
  uint64_t v56 = (char *)_swiftEmptyArrayStorage;
  uint64_t v48 = *(void *)(a1 + 16);
  if (v48)
  {
    uint64_t v18 = 0;
    unint64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
    uint64_t v19 = v15 + 16;
    uint64_t v21 = *(unsigned __int8 *)(v19 + 64);
    v37[1] = v2;
    uint64_t v38 = (v21 + 32) & ~v21;
    uint64_t v45 = a1 + v38;
    uint64_t v46 = v20;
    uint64_t v53 = a2 + 56;
    uint64_t v54 = a2;
    uint64_t v49 = *(void *)(v19 + 56);
    uint64_t v52 = v6 + 16;
    uint64_t v39 = v6;
    unint64_t v22 = (void (**)(char *, uint64_t))(v6 + 8);
    uint64_t v40 = (void (**)(char *, char *, uint64_t))(v19 + 16);
    uint64_t v42 = (void (**)(char *, uint64_t))(v19 - 8);
    uint64_t v43 = (char *)v37 - v14;
    uint64_t v44 = v11;
    uint64_t v47 = v19;
    do
    {
      uint64_t v51 = v18;
      v46(v16, v45 + v49 * v18, v11);
      type metadata accessor for CommunicationActor();
      uint64_t v23 = static CommunicationActor.shared.getter();
      sub_1000CD730(&qword_1000F1F70, (void (*)(uint64_t))&type metadata accessor for CommunicationActor);
      uint64_t v50 = v23;
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      sub_1000CD730(&qword_1000F2810, (void (*)(uint64_t))&type metadata accessor for ShuffleID);
      dispatch thunk of PhotosFaceID.id.getter();
      if (*(void *)(v54 + 16)
        && (sub_1000CD730(&qword_1000F2648, (void (*)(uint64_t))&type metadata accessor for UUID),
            uint64_t v24 = dispatch thunk of Hashable._rawHashValue(seed:)(),
            uint64_t v25 = v54,
            uint64_t v26 = -1 << *(unsigned char *)(v54 + 32),
            unint64_t v27 = v24 & ~v26,
            ((*(void *)(v53 + ((v27 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v27) & 1) != 0))
      {
        uint64_t v28 = ~v26;
        uint64_t v29 = *(void *)(v39 + 72);
        uint64_t v30 = *(void (**)(char *, unint64_t, uint64_t))(v39 + 16);
        while (1)
        {
          v30(v9, *(void *)(v25 + 48) + v29 * v27, v5);
          sub_1000CD730(&qword_1000F2650, (void (*)(uint64_t))&type metadata accessor for UUID);
          char v31 = dispatch thunk of static Equatable.== infix(_:_:)();
          char v32 = *v22;
          (*v22)(v9, v5);
          if (v31) {
            break;
          }
          unint64_t v27 = (v27 + 1) & v28;
          uint64_t v25 = v54;
          if (((*(void *)(v53 + ((v27 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v27) & 1) == 0) {
            goto LABEL_3;
          }
        }
        v32(v55, v5);
        swift_release();
        unint64_t v33 = *v40;
        uint64_t v16 = v43;
        uint64_t v11 = v44;
        (*v40)(v41, v43, v44);
        uint64_t v34 = v56;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_100054860(0, *((void *)v34 + 2) + 1, 1);
          uint64_t v34 = v56;
        }
        unint64_t v36 = *((void *)v34 + 2);
        unint64_t v35 = *((void *)v34 + 3);
        if (v36 >= v35 >> 1)
        {
          sub_100054860(v35 > 1, v36 + 1, 1);
          uint64_t v34 = v56;
        }
        *((void *)v34 + 2) = v36 + 1;
        v33(&v34[v38 + v36 * v49], v41, v11);
        uint64_t v56 = v34;
      }
      else
      {
LABEL_3:
        (*v22)(v55, v5);
        swift_release();
        uint64_t v16 = v43;
        uint64_t v11 = v44;
        (*v42)(v43, v44);
      }
      uint64_t v18 = v51 + 1;
    }
    while (v51 + 1 != v48);
    return v56;
  }
  return result;
}

char *sub_1000CA6AC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for UUID();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v55 = (char *)v37 - v10;
  uint64_t v11 = type metadata accessor for AlbumID();
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v41 = (char *)v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)v37 - v14;
  __n128 result = (char *)_swiftEmptyArrayStorage;
  uint64_t v56 = (char *)_swiftEmptyArrayStorage;
  uint64_t v48 = *(void *)(a1 + 16);
  if (v48)
  {
    uint64_t v18 = 0;
    unint64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
    uint64_t v19 = v15 + 16;
    uint64_t v21 = *(unsigned __int8 *)(v19 + 64);
    v37[1] = v2;
    uint64_t v38 = (v21 + 32) & ~v21;
    uint64_t v45 = a1 + v38;
    uint64_t v46 = v20;
    uint64_t v53 = a2 + 56;
    uint64_t v54 = a2;
    uint64_t v49 = *(void *)(v19 + 56);
    uint64_t v52 = v6 + 16;
    uint64_t v39 = v6;
    unint64_t v22 = (void (**)(char *, uint64_t))(v6 + 8);
    uint64_t v40 = (void (**)(char *, char *, uint64_t))(v19 + 16);
    uint64_t v42 = (void (**)(char *, uint64_t))(v19 - 8);
    uint64_t v43 = (char *)v37 - v14;
    uint64_t v44 = v11;
    uint64_t v47 = v19;
    do
    {
      uint64_t v51 = v18;
      v46(v16, v45 + v49 * v18, v11);
      type metadata accessor for CommunicationActor();
      uint64_t v23 = static CommunicationActor.shared.getter();
      sub_1000CD730(&qword_1000F1F70, (void (*)(uint64_t))&type metadata accessor for CommunicationActor);
      uint64_t v50 = v23;
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      sub_1000CD730(&qword_1000F26F8, (void (*)(uint64_t))&type metadata accessor for AlbumID);
      dispatch thunk of PhotosFaceID.id.getter();
      if (*(void *)(v54 + 16)
        && (sub_1000CD730(&qword_1000F2648, (void (*)(uint64_t))&type metadata accessor for UUID),
            uint64_t v24 = dispatch thunk of Hashable._rawHashValue(seed:)(),
            uint64_t v25 = v54,
            uint64_t v26 = -1 << *(unsigned char *)(v54 + 32),
            unint64_t v27 = v24 & ~v26,
            ((*(void *)(v53 + ((v27 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v27) & 1) != 0))
      {
        uint64_t v28 = ~v26;
        uint64_t v29 = *(void *)(v39 + 72);
        uint64_t v30 = *(void (**)(char *, unint64_t, uint64_t))(v39 + 16);
        while (1)
        {
          v30(v9, *(void *)(v25 + 48) + v29 * v27, v5);
          sub_1000CD730(&qword_1000F2650, (void (*)(uint64_t))&type metadata accessor for UUID);
          char v31 = dispatch thunk of static Equatable.== infix(_:_:)();
          char v32 = *v22;
          (*v22)(v9, v5);
          if (v31) {
            break;
          }
          unint64_t v27 = (v27 + 1) & v28;
          uint64_t v25 = v54;
          if (((*(void *)(v53 + ((v27 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v27) & 1) == 0) {
            goto LABEL_3;
          }
        }
        v32(v55, v5);
        swift_release();
        unint64_t v33 = *v40;
        uint64_t v16 = v43;
        uint64_t v11 = v44;
        (*v40)(v41, v43, v44);
        uint64_t v34 = v56;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1000549D8(0, *((void *)v34 + 2) + 1, 1);
          uint64_t v34 = v56;
        }
        unint64_t v36 = *((void *)v34 + 2);
        unint64_t v35 = *((void *)v34 + 3);
        if (v36 >= v35 >> 1)
        {
          sub_1000549D8(v35 > 1, v36 + 1, 1);
          uint64_t v34 = v56;
        }
        *((void *)v34 + 2) = v36 + 1;
        v33(&v34[v38 + v36 * v49], v41, v11);
        uint64_t v56 = v34;
      }
      else
      {
LABEL_3:
        (*v22)(v55, v5);
        swift_release();
        uint64_t v16 = v43;
        uint64_t v11 = v44;
        (*v42)(v43, v44);
      }
      uint64_t v18 = v51 + 1;
    }
    while (v51 + 1 != v48);
    return v56;
  }
  return result;
}

uint64_t sub_1000CAC10()
{
  return 40;
}

__n128 sub_1000CAC1C(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 16);
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

uint64_t sub_1000CAC30(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1000CAC3C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100005F94;
  return sub_10005B5B4(a1, a2);
}

uint64_t sub_1000CACEC()
{
  return 40;
}

__n128 sub_1000CACF8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 16);
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

uint64_t sub_1000CAD0C@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(*(void *)result + 16);
  return result;
}

uint64_t sub_1000CAD1C()
{
  return 40;
}

__n128 sub_1000CAD28(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 16);
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

uint64_t sub_1000CAD3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005CB0(&qword_1000F2E40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000CADA4(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *(void *)(v2 + 16);
  uint64_t v6 = *(void *)(v2 + 24);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v8;
  *uint64_t v8 = v3;
  v8[1] = sub_100005F94;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_1000F3E08 + dword_1000F3E08);
  return v9(a1, a2, v7, v6);
}

uint64_t sub_1000CAE6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = v3[2];
  uint64_t v9 = v3[3];
  uint64_t v10 = v3[4];
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v11;
  *uint64_t v11 = v4;
  v11[1] = sub_100005F94;
  return sub_1000BAAFC(a1, a2, a3, v8, v9, v10);
}

uint64_t sub_1000CAF38(uint64_t a1, uint64_t *a2)
{
  uint64_t v6 = *(int **)(v2 + 16);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_100005F94;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t *, int *))((char *)&dword_1000F3E58 + dword_1000F3E58);
  return v8(a1, a2, v6);
}

uint64_t sub_1000CB000()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000CB038@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1000C0D30(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), a2);
}

uint64_t sub_1000CB074(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(void *)(type metadata accessor for MessageBody() - 8);
  uint64_t v7 = *(void *)(v2 + 16);
  uint64_t v8 = *(void *)(v2 + 24);
  uint64_t v9 = v2 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v10;
  *uint64_t v10 = v3;
  v10[1] = sub_100005F94;
  return sub_1000C16A0(a1, a2, v7, v8, v9);
}

uint64_t sub_1000CB16C()
{
  return sub_1000CDBF0((uint64_t (*)(void))&type metadata accessor for ShuffleID);
}

uint64_t sub_1000CB184(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for ShuffleID() - 8);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_100005F94;
  return sub_1000B19D8(a1, v5, v6);
}

uint64_t sub_1000CB26C(uint64_t result)
{
  if ((*(_DWORD *)(*(void *)(*(void *)(result + 24) - 8) + 80) & 0x20000) != 0) {
    return swift_slowDealloc();
  }
  return result;
}

uint64_t sub_1000CB2C0()
{
  return sub_1000CDBF0((uint64_t (*)(void))&type metadata accessor for ShuffleID);
}

uint64_t sub_1000CB2D8(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(void *)(type metadata accessor for ShuffleID() - 8);
  uint64_t v7 = *(void *)(v2 + 16);
  uint64_t v8 = v2 + ((*(unsigned __int8 *)(v6 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v9;
  *uint64_t v9 = v3;
  v9[1] = sub_100005F94;
  return sub_1000B223C(a1, a2, v7, v8);
}

uint64_t sub_1000CB3C4()
{
  return sub_1000CDBF0((uint64_t (*)(void))&type metadata accessor for FetchFaceRequest);
}

uint64_t sub_1000CB3DC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100005F94;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_1000F3FD8 + dword_1000F3FD8);
  uint64_t v6 = (void *)swift_task_alloc();
  v5[2] = v6;
  *uint64_t v6 = v5;
  v6[1] = sub_100005F94;
  return v8(a1, a2);
}

uint64_t sub_1000CB4DC(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100005F94;
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)&dword_1000F3FD0 + dword_1000F3FD0);
  uint64_t v4 = (void *)swift_task_alloc();
  v3[2] = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_100005F94;
  return v6(a1);
}

uint64_t sub_1000CB5D0()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1000CDF50;
  return sub_100087980();
}

uint64_t sub_1000CB660(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_100005F94;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_1000F3EE0 + dword_1000F3EE0);
  return v7(a1, a2, v2);
}

uint64_t sub_1000CB718(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_1000CDF50;
  return sub_100087C94(a1);
}

uint64_t sub_1000CB7B0(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1000CDF50;
  return sub_100088230(a1, v1);
}

uint64_t sub_1000CB848()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100005F94;
  uint64_t v4 = (uint64_t (*)(void))((char *)&dword_1000F2AE0 + dword_1000F2AE0);
  uint64_t v2 = (void *)swift_task_alloc();
  v1[2] = v2;
  void *v2 = v1;
  v2[1] = sub_100005F94;
  return v4();
}

uint64_t sub_1000CB930()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100005F94;
  uint64_t v4 = (uint64_t (*)(void))((char *)&dword_1000F3F80 + dword_1000F3F80);
  uint64_t v2 = (void *)swift_task_alloc();
  v1[2] = v2;
  void *v2 = v1;
  v2[1] = sub_100005F94;
  return v4();
}

uint64_t sub_1000CBA18(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100005F94;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_1000F3FD8 + dword_1000F3FD8);
  uint64_t v6 = (void *)swift_task_alloc();
  v5[2] = v6;
  *uint64_t v6 = v5;
  v6[1] = sub_100005F94;
  return v8(a1, a2);
}

uint64_t sub_1000CBB18(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100005F94;
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)&dword_1000F3FD0 + dword_1000F3FD0);
  uint64_t v4 = (void *)swift_task_alloc();
  v3[2] = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_100005F94;
  return v6(a1);
}

uint64_t sub_1000CBC0C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100005F94;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_1000F3F90 + dword_1000F3F90);
  uint64_t v6 = (void *)swift_task_alloc();
  v5[2] = v6;
  *uint64_t v6 = v5;
  v6[1] = sub_100005F94;
  return v8(a1, a2);
}

uint64_t sub_1000CBD0C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100005F94;
  uint64_t v4 = (uint64_t (*)(void))((char *)&dword_1000F3F80 + dword_1000F3F80);
  uint64_t v2 = (void *)swift_task_alloc();
  v1[2] = v2;
  void *v2 = v1;
  v2[1] = sub_100005F94;
  return v4();
}

uint64_t sub_1000CBDF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ShuffleID();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v61 = (uint64_t)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = sub_100005CB0(&qword_1000F2E30);
  uint64_t v7 = *(void *)(v60 - 8);
  uint64_t v8 = __chkstk_darwin(v60);
  uint64_t v57 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v43 - v10;
  uint64_t v12 = &_swiftEmptyDictionarySingleton;
  uint64_t v62 = &_swiftEmptyDictionarySingleton;
  uint64_t v13 = *(void *)(a1 + 16);
  if (!v13) {
    return (uint64_t)v12;
  }
  uint64_t v14 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v15 = (v14 + 32) & ~v14;
  uint64_t v16 = a1 + v15;
  uint64_t v17 = type metadata accessor for CommunicationActor();
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  uint64_t v18 = v7 + 16;
  uint64_t v55 = v19;
  uint64_t v56 = v17;
  uint64_t v20 = *(void *)(v18 + 56);
  uint64_t v54 = v15;
  uint64_t v52 = v20;
  uint64_t v48 = v20 + v15;
  v58 = (void (**)(char *, char *, uint64_t))(v18 + 16);
  uint64_t v46 = v5 + 32;
  uint64_t v47 = v14 | 7;
  uint64_t v45 = (void (**)(uint64_t, uint64_t))(v5 + 8);
  uint64_t v12 = &_swiftEmptyDictionarySingleton;
  long long v44 = xmmword_1000D7AB0;
  uint64_t v50 = v4;
  uint64_t v51 = a2;
  uint64_t v49 = v5;
  uint64_t v53 = v18;
  uint64_t v59 = v11;
  v19(v11, v16, v60);
  while (1)
  {
    static CommunicationActor.shared.getter();
    sub_1000CD730(&qword_1000F1F70, (void (*)(uint64_t))&type metadata accessor for CommunicationActor);
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v23 = v61;
    unint64_t v22 = v59;
    swift_getAtKeyPath();
    swift_release();
    unint64_t v25 = sub_100050B34(v23);
    uint64_t v26 = v12[2];
    BOOL v27 = (v24 & 1) == 0;
    uint64_t v28 = v26 + v27;
    if (__OFADD__(v26, v27)) {
      break;
    }
    char v29 = v24;
    if (v12[3] < v28)
    {
      sub_100052F68(v28, 1);
      uint64_t v12 = v62;
      unint64_t v30 = sub_100050B34(v61);
      if ((v29 & 1) != (v31 & 1)) {
        goto LABEL_22;
      }
      unint64_t v25 = v30;
    }
    if (v29)
    {
      (*v45)(v61, v4);
      uint64_t v12 = v62;
      uint64_t v32 = v62[7];
      unint64_t v33 = *v58;
      (*v58)(v57, v22, v60);
      unint64_t v34 = *(void *)(v32 + 8 * v25);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(void *)(v32 + 8 * v25) = v34;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        unint64_t v34 = sub_1000D24C0(0, *(void *)(v34 + 16) + 1, 1, v34);
        *(void *)(v32 + 8 * v25) = v34;
      }
      unint64_t v37 = *(void *)(v34 + 16);
      unint64_t v36 = *(void *)(v34 + 24);
      if (v37 >= v36 >> 1)
      {
        unint64_t v34 = sub_1000D24C0(v36 > 1, v37 + 1, 1, v34);
        *(void *)(v32 + 8 * v25) = v34;
      }
      uint64_t v21 = v52;
      *(void *)(v34 + 16) = v37 + 1;
      v33((char *)(v34 + v54 + v37 * v21), v57, v60);
      uint64_t v5 = v49;
      uint64_t v4 = v50;
      unint64_t v22 = v59;
    }
    else
    {
      sub_100005CB0(&qword_1000F2E28);
      uint64_t v38 = swift_allocObject();
      *(_OWORD *)(v38 + 16) = v44;
      (*v58)((char *)(v38 + v54), v22, v60);
      v12[(v25 >> 6) + 8] |= 1 << v25;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v5 + 32))(v12[6] + *(void *)(v5 + 72) * v25, v61, v4);
      *(void *)(v12[7] + 8 * v25) = v38;
      uint64_t v39 = v12[2];
      BOOL v40 = __OFADD__(v39, 1);
      uint64_t v41 = v39 + 1;
      if (v40) {
        goto LABEL_21;
      }
      v12[2] = v41;
      uint64_t v21 = v52;
    }
    v16 += v21;
    if (!--v13) {
      return (uint64_t)v12;
    }
    v55(v22, v16, v60);
  }
  __break(1u);
LABEL_21:
  __break(1u);
LABEL_22:
  swift_release();
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t sub_1000CC2CC(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *(void *)(v2 + 16);
  uint64_t v6 = *(void *)(v2 + 24);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v8;
  *uint64_t v8 = v3;
  v8[1] = sub_100005F94;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_1000F3F98 + dword_1000F3F98);
  return v9(a1, a2, v7, v6);
}

uint64_t sub_1000CC394(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = v3[2];
  uint64_t v9 = v3[3];
  uint64_t v10 = v3[4];
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v11;
  *uint64_t v11 = v4;
  v11[1] = sub_100005F94;
  return sub_1000BAE08(a1, a2, a3, v8, v9, v10);
}

uint64_t sub_1000CC460(uint64_t a1, uint64_t *a2)
{
  uint64_t v6 = *(int **)(v2 + 16);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_100005F94;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t *, int *))((char *)&dword_1000F3FC0 + dword_1000F3FC0);
  return v8(a1, a2, v6);
}

uint64_t sub_1000CC528()
{
  return sub_1000CDBF0((uint64_t (*)(void))&type metadata accessor for ShuffleID);
}

uint64_t sub_1000CC540(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for ShuffleID() - 8);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_100005F94;
  return sub_1000B1CA4(a1, v5, v6);
}

uint64_t sub_1000CC628()
{
  return sub_1000CDBF0((uint64_t (*)(void))&type metadata accessor for ShuffleID);
}

uint64_t sub_1000CC640(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(void *)(type metadata accessor for ShuffleID() - 8);
  uint64_t v7 = *(void *)(v2 + 16);
  uint64_t v8 = v2 + ((*(unsigned __int8 *)(v6 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v9;
  *uint64_t v9 = v3;
  v9[1] = sub_100005F94;
  return sub_1000B3C3C(a1, a2, v7, v8);
}

uint64_t sub_1000CC72C()
{
  return sub_1000CDBF0((uint64_t (*)(void))&type metadata accessor for FetchFaceRequest);
}

uint64_t sub_1000CC744(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100005F94;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_1000F4198 + dword_1000F4198);
  uint64_t v6 = (void *)swift_task_alloc();
  v5[2] = v6;
  *uint64_t v6 = v5;
  v6[1] = sub_100005F94;
  return v8(a1, a2);
}

uint64_t sub_1000CC844(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100005F94;
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)&dword_1000F4190 + dword_1000F4190);
  uint64_t v4 = (void *)swift_task_alloc();
  v3[2] = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_100005F94;
  return v6(a1);
}

uint64_t sub_1000CC938()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1000CDF50;
  return sub_100087A84();
}

uint64_t sub_1000CC9C8(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_100005F94;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_1000F4038 + dword_1000F4038);
  return v7(a1, a2, v2);
}

uint64_t sub_1000CCA80(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_1000CCB18;
  return sub_100087DA0(a1);
}

uint64_t sub_1000CCB18(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_1000CCC14(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1000CDF50;
  return sub_10008843C(a1, v1);
}

uint64_t sub_1000CCCAC()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100005F94;
  uint64_t v4 = (uint64_t (*)(void))((char *)&dword_1000F2B48 + dword_1000F2B48);
  uint64_t v2 = (void *)swift_task_alloc();
  v1[2] = v2;
  void *v2 = v1;
  v2[1] = sub_100005F94;
  return v4();
}

uint64_t sub_1000CCD94()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100005F94;
  uint64_t v4 = (uint64_t (*)(void))((char *)&dword_1000F40D8 + dword_1000F40D8);
  uint64_t v2 = (void *)swift_task_alloc();
  v1[2] = v2;
  void *v2 = v1;
  v2[1] = sub_100005F94;
  return v4();
}

uint64_t sub_1000CCE7C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100005F94;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_1000F4198 + dword_1000F4198);
  uint64_t v6 = (void *)swift_task_alloc();
  v5[2] = v6;
  *uint64_t v6 = v5;
  v6[1] = sub_100005F94;
  return v8(a1, a2);
}

uint64_t sub_1000CCF7C(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100005F94;
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)&dword_1000F4190 + dword_1000F4190);
  uint64_t v4 = (void *)swift_task_alloc();
  v3[2] = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_100005F94;
  return v6(a1);
}

uint64_t sub_1000CD070(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100005F94;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_1000F4120 + dword_1000F4120);
  uint64_t v6 = (void *)swift_task_alloc();
  v5[2] = v6;
  *uint64_t v6 = v5;
  v6[1] = sub_100005F94;
  return v8(a1, a2);
}

uint64_t sub_1000CD170()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100005F94;
  uint64_t v4 = (uint64_t (*)(void))((char *)&dword_1000F40D8 + dword_1000F40D8);
  uint64_t v2 = (void *)swift_task_alloc();
  v1[2] = v2;
  void *v2 = v1;
  v2[1] = sub_100005F94;
  return v4();
}

uint64_t sub_1000CD258(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AlbumID();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v61 = (uint64_t)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = sub_100005CB0((uint64_t *)&unk_1000F3A80);
  uint64_t v7 = *(void *)(v60 - 8);
  uint64_t v8 = __chkstk_darwin(v60);
  uint64_t v57 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v43 - v10;
  uint64_t v12 = &_swiftEmptyDictionarySingleton;
  uint64_t v62 = &_swiftEmptyDictionarySingleton;
  uint64_t v13 = *(void *)(a1 + 16);
  if (!v13) {
    return (uint64_t)v12;
  }
  uint64_t v14 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v15 = (v14 + 32) & ~v14;
  uint64_t v16 = a1 + v15;
  uint64_t v17 = type metadata accessor for CommunicationActor();
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  uint64_t v18 = v7 + 16;
  uint64_t v55 = v19;
  uint64_t v56 = v17;
  uint64_t v20 = *(void *)(v18 + 56);
  uint64_t v54 = v15;
  uint64_t v52 = v20;
  uint64_t v48 = v20 + v15;
  v58 = (void (**)(char *, char *, uint64_t))(v18 + 16);
  uint64_t v46 = v5 + 32;
  uint64_t v47 = v14 | 7;
  uint64_t v45 = (void (**)(uint64_t, uint64_t))(v5 + 8);
  uint64_t v12 = &_swiftEmptyDictionarySingleton;
  long long v44 = xmmword_1000D7AB0;
  uint64_t v50 = v4;
  uint64_t v51 = a2;
  uint64_t v49 = v5;
  uint64_t v53 = v18;
  uint64_t v59 = v11;
  v19(v11, v16, v60);
  while (1)
  {
    static CommunicationActor.shared.getter();
    sub_1000CD730(&qword_1000F1F70, (void (*)(uint64_t))&type metadata accessor for CommunicationActor);
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v23 = v61;
    unint64_t v22 = v59;
    swift_getAtKeyPath();
    swift_release();
    unint64_t v25 = sub_100050C08(v23);
    uint64_t v26 = v12[2];
    BOOL v27 = (v24 & 1) == 0;
    uint64_t v28 = v26 + v27;
    if (__OFADD__(v26, v27)) {
      break;
    }
    char v29 = v24;
    if (v12[3] < v28)
    {
      sub_10005338C(v28, 1);
      uint64_t v12 = v62;
      unint64_t v30 = sub_100050C08(v61);
      if ((v29 & 1) != (v31 & 1)) {
        goto LABEL_22;
      }
      unint64_t v25 = v30;
    }
    if (v29)
    {
      (*v45)(v61, v4);
      uint64_t v12 = v62;
      uint64_t v32 = v62[7];
      unint64_t v33 = *v58;
      (*v58)(v57, v22, v60);
      unint64_t v34 = *(void *)(v32 + 8 * v25);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(void *)(v32 + 8 * v25) = v34;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        unint64_t v34 = sub_1000D24D4(0, *(void *)(v34 + 16) + 1, 1, v34);
        *(void *)(v32 + 8 * v25) = v34;
      }
      unint64_t v37 = *(void *)(v34 + 16);
      unint64_t v36 = *(void *)(v34 + 24);
      if (v37 >= v36 >> 1)
      {
        unint64_t v34 = sub_1000D24D4(v36 > 1, v37 + 1, 1, v34);
        *(void *)(v32 + 8 * v25) = v34;
      }
      uint64_t v21 = v52;
      *(void *)(v34 + 16) = v37 + 1;
      v33((char *)(v34 + v54 + v37 * v21), v57, v60);
      uint64_t v5 = v49;
      uint64_t v4 = v50;
      unint64_t v22 = v59;
    }
    else
    {
      sub_100005CB0(&qword_1000F2EB0);
      uint64_t v38 = swift_allocObject();
      *(_OWORD *)(v38 + 16) = v44;
      (*v58)((char *)(v38 + v54), v22, v60);
      v12[(v25 >> 6) + 8] |= 1 << v25;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v5 + 32))(v12[6] + *(void *)(v5 + 72) * v25, v61, v4);
      *(void *)(v12[7] + 8 * v25) = v38;
      uint64_t v39 = v12[2];
      BOOL v40 = __OFADD__(v39, 1);
      uint64_t v41 = v39 + 1;
      if (v40) {
        goto LABEL_21;
      }
      v12[2] = v41;
      uint64_t v21 = v52;
    }
    v16 += v21;
    if (!--v13) {
      return (uint64_t)v12;
    }
    v55(v22, v16, v60);
  }
  __break(1u);
LABEL_21:
  __break(1u);
LABEL_22:
  swift_release();
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t sub_1000CD730(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000CD778(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *(void *)(v2 + 16);
  uint64_t v6 = *(void *)(v2 + 24);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v8;
  *uint64_t v8 = v3;
  v8[1] = sub_100005F94;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_1000F4130 + dword_1000F4130);
  return v9(a1, a2, v7, v6);
}

uint64_t sub_1000CD840(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = v3[2];
  uint64_t v9 = v3[3];
  uint64_t v10 = v3[4];
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v11;
  *uint64_t v11 = v4;
  v11[1] = sub_100005F94;
  return sub_1000BB60C(a1, a2, a3, v8, v9, v10);
}

uint64_t sub_1000CD90C(uint64_t a1, uint64_t *a2)
{
  uint64_t v6 = *(int **)(v2 + 16);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_100005F94;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t *, int *))((char *)&dword_1000F4180 + dword_1000F4180);
  return v8(a1, a2, v6);
}

uint64_t sub_1000CD9D4()
{
  return sub_1000CDBF0((uint64_t (*)(void))&type metadata accessor for AlbumID);
}

uint64_t sub_1000CD9EC(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for AlbumID() - 8);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_100005F94;
  return sub_1000B1F70(a1, v5, v6);
}

uint64_t sub_1000CDAD4()
{
  return sub_1000CDBF0((uint64_t (*)(void))&type metadata accessor for AlbumID);
}

uint64_t sub_1000CDAEC(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(void *)(type metadata accessor for AlbumID() - 8);
  uint64_t v7 = *(void *)(v2 + 16);
  uint64_t v8 = v2 + ((*(unsigned __int8 *)(v6 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v9;
  *uint64_t v9 = v3;
  v9[1] = sub_100005F94;
  return sub_1000B563C(a1, a2, v7, v8);
}

uint64_t sub_1000CDBD8()
{
  return sub_1000CDBF0((uint64_t (*)(void))&type metadata accessor for FetchFaceRequest);
}

uint64_t sub_1000CDBF0(uint64_t (*a1)(void))
{
  uint64_t v2 = a1(0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 24) & ~v4;
  uint64_t v6 = v5 + *(void *)(v3 + 64);
  uint64_t v7 = v4 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);

  return _swift_deallocObject(v1, v6, v7);
}

uint64_t sub_1000CDCC4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1000C0D30(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), a2);
}

uint64_t sub_1000CDD00()
{
  uint64_t v1 = type metadata accessor for MessageBody();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_1000CDDCC(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(void *)(type metadata accessor for MessageBody() - 8);
  uint64_t v7 = *(void *)(v2 + 16);
  uint64_t v8 = *(void *)(v2 + 24);
  uint64_t v9 = v2 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v10;
  *uint64_t v10 = v3;
  v10[1] = sub_100005F94;
  return sub_1000C0EC4(a1, a2, v7, v8, v9);
}

uint64_t sub_1000CDF60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for TaskPriority();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_10006FEF4(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_1000CE0E0()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for OS_dispatch_queue_serial.Attributes();
  __chkstk_darwin(v6);
  uint64_t v7 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v7 - 8);
  swift_defaultActor_initialize();
  sub_1000D2D28();
  static DispatchQoS.unspecified.getter();
  v10[1] = &_swiftEmptyArrayStorage;
  sub_1000D2D68(&qword_1000F4360, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue_serial.Attributes);
  sub_100005CB0(&qword_1000F4368);
  sub_1000D2DB0();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:), v2);
  *(void *)(v0 + 112) = OS_dispatch_queue_serial.init(label:qos:attributes:autoreleaseFrequency:target:)();
  ContinuousClock.init()();
  uint64_t v8 = OBJC_IVAR____TtC11photosfaced21BackgroundTaskManager_registry;
  *(void *)(v1 + v8) = sub_10004048C((uint64_t)&_swiftEmptyArrayStorage);
  return v1;
}

void sub_1000CE344()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Log.default.getter();
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "BackgroundTaskManager Activate", v8, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v9 = self;
  uint64_t v10 = 0;
  uint64_t v11 = *(void *)(v1 + 112);
  v18[4] = "com.apple.photosface.refresh";
  v18[5] = 0xD000000000000019;
  v18[2] = "com.apple.photosface.cleanup";
  void v18[3] = "faced.warmup.FastPass";
  v18[1] = "@\"NSDictionary\"8@?0";
  do
  {
    char v16 = *((unsigned char *)&off_1000EDD30 + v10++ + 32);
    id v17 = [v9 sharedScheduler];
    NSString v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    uint64_t v13 = swift_allocObject();
    swift_weakInit();
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = v13;
    *(unsigned char *)(v14 + 24) = v16;
    aBlock[4] = sub_1000D2A6C;
    aBlock[5] = v14;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1000CE720;
    aBlock[3] = &unk_1000EF3D0;
    uint64_t v15 = _Block_copy(aBlock);
    swift_release();
    [v17 registerForTaskWithIdentifier:v12 usingQueue:v11 launchHandler:v15];
    _Block_release(v15);
  }
  while (v10 != 5);
}

uint64_t sub_1000CE6AC(void *a1, uint64_t a2, char a3)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_1000CED54(a3, a1);
    return swift_release();
  }
  return result;
}

void sub_1000CE720(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_1000CE788(int *a1)
{
  id v4 = (uint64_t (*)(void))((char *)a1 + *a1);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  void *v2 = v1;
  v2[1] = sub_1000CE854;
  return v4();
}

uint64_t sub_1000CE854()
{
  uint64_t v7 = *v1;
  uint64_t v2 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 8);
  if (!v0)
  {
    uint64_t v2 = 0;
    uint64_t v3 = 0;
    uint64_t v4 = 1;
  }
  return v5(v2, v3, v4);
}

uint64_t sub_1000CE958(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  uint64_t v8 = (void *)(v3 + OBJC_IVAR____TtC11photosfaced21BackgroundTaskManager_registry);
  swift_beginAccess();
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = (void *)*v8;
  unint64_t v25 = (void *)*v8;
  *uint64_t v8 = 0x8000000000000000;
  unint64_t v12 = sub_1000507B8(a1);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    uint64_t v10 = sub_1000D1EB8(0, v10[2] + 1, 1, v10, &qword_1000F4338);
    v8[v12] = v10;
    goto LABEL_10;
  }
  char v16 = v11;
  if (v10[3] >= v15)
  {
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_100054218();
      uint64_t v10 = v25;
    }
  }
  else
  {
    sub_100052090(v15, isUniquelyReferenced_nonNull_native);
    uint64_t v10 = v25;
    unint64_t v17 = sub_1000507B8(a1);
    if ((v16 & 1) != (v18 & 1))
    {
      uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
      __break(1u);
      return result;
    }
    unint64_t v12 = v17;
  }
  *uint64_t v8 = v10;
  swift_bridgeObjectRelease();
  uint64_t v19 = (void *)*v8;
  if ((v16 & 1) == 0) {
    sub_100053C08(v12, a1, _swiftEmptyArrayStorage, *v8);
  }
  uint64_t v8 = (void *)v19[7];
  uint64_t v10 = (void *)v8[v12];
  char v20 = swift_isUniquelyReferenced_nonNull_native();
  v8[v12] = v10;
  if ((v20 & 1) == 0) {
    goto LABEL_14;
  }
LABEL_10:
  unint64_t v22 = v10[2];
  unint64_t v21 = v10[3];
  if (v22 >= v21 >> 1)
  {
    uint64_t v10 = sub_1000D1EB8((void *)(v21 > 1), v22 + 1, 1, v10, &qword_1000F4338);
    v8[v12] = v10;
  }
  void v10[2] = v22 + 1;
  uint64_t v23 = &v10[2 * v22];
  v23[4] = &unk_1000F4330;
  v23[5] = v7;
  return swift_endAccess();
}

uint64_t sub_1000CEB5C(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v5 = (uint64_t (*)(void))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_1000CEC2C;
  return v5();
}

uint64_t sub_1000CEC2C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v8 = *v4;
  uint64_t v9 = *v4;
  swift_task_dealloc();
  if (!v3)
  {
    uint64_t v10 = *(void *)(v8 + 16);
    *(void *)uint64_t v10 = a1;
    *(void *)(v10 + 8) = a2;
    *(unsigned char *)(v10 + 16) = a3 & 1;
  }
  char v11 = *(uint64_t (**)(void))(v9 + 8);
  return v11();
}

uint64_t sub_1000CED54(char a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_100005CB0(&qword_1000F1F98);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for Analytics.BackgroundTask();
  uint64_t v9 = swift_allocObject();
  static ContinuousClock.Instant.now.getter();
  *(unsigned char *)(v9 + OBJC_IVAR____TtCC11photosfaced9Analytics14BackgroundTask_errored) = 0;
  uint64_t v10 = v9 + OBJC_IVAR____TtCC11photosfaced9Analytics14BackgroundTask_cancelTime;
  uint64_t v11 = type metadata accessor for ContinuousClock.Instant();
  unint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
  v12(v10, 1, 1, v11);
  v12(v9 + OBJC_IVAR____TtCC11photosfaced9Analytics14BackgroundTask_endTime, 1, 1, v11);
  uint64_t v13 = OBJC_IVAR____TtCC11photosfaced9Analytics14BackgroundTask_lock;
  sub_100005CB0(&qword_1000F4310);
  uint64_t v14 = swift_allocObject();
  *(_DWORD *)(v14 + 16) = 0;
  *(void *)(v9 + v13) = v14;
  *(unsigned char *)(v9 + 16) = a1;
  uint64_t v15 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v8, 1, 1, v15);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = 0;
  *(void *)(v16 + 24) = 0;
  *(void *)(v16 + 32) = v3;
  *(void *)(v16 + 40) = v9;
  *(unsigned char *)(v16 + 48) = a1;
  *(void *)(v16 + 56) = a2;
  swift_retain();
  swift_retain();
  id v17 = a2;
  uint64_t v18 = sub_1000CDF60((uint64_t)v8, (uint64_t)&unk_1000F4320, v16);
  uint64_t v19 = swift_allocObject();
  *(unsigned char *)(v19 + 16) = a1;
  *(void *)(v19 + 24) = v9;
  *(void *)(v19 + 32) = v18;
  aBlock[4] = sub_1000D2650;
  aBlock[5] = v19;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000D0EA0;
  aBlock[3] = &unk_1000EF330;
  char v20 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  [v17 setExpirationHandler:v20];
  _Block_release(v20);
  swift_release();
  return swift_release();
}

uint64_t sub_1000CF02C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7)
{
  *(void *)(v7 + 136) = a5;
  *(void *)(v7 + 144) = a7;
  *(unsigned char *)(v7 + 304) = a6;
  *(void *)(v7 + 128) = a4;
  uint64_t v8 = type metadata accessor for Logger();
  *(void *)(v7 + 152) = v8;
  *(void *)(v7 + 160) = *(void *)(v8 - 8);
  *(void *)(v7 + 168) = swift_task_alloc();
  *(void *)(v7 + 176) = swift_task_alloc();
  *(void *)(v7 + 184) = swift_task_alloc();
  uint64_t v9 = type metadata accessor for ContinuousClock.Instant();
  *(void *)(v7 + 192) = v9;
  *(void *)(v7 + 200) = *(void *)(v9 - 8);
  *(void *)(v7 + 208) = swift_task_alloc();
  *(void *)(v7 + 216) = swift_task_alloc();
  *(void *)(v7 + 224) = swift_task_alloc();
  *(void *)(v7 + 232) = swift_task_alloc();
  *(void *)(v7 + 240) = swift_task_alloc();
  *(void *)(v7 + 248) = swift_task_alloc();
  *(void *)(v7 + 256) = swift_task_alloc();
  return _swift_task_switch(sub_1000CF1E4, 0, 0);
}

uint64_t sub_1000CF1E4()
{
  uint64_t v1 = *(void *)(v0 + 256);
  uint64_t v2 = *(void *)(v0 + 136);
  *(void *)(v0 + 264) = OBJC_IVAR____TtC11photosfaced21BackgroundTaskManager_clock;
  ContinuousClock.now.getter();
  uint64_t v3 = *(os_unfair_lock_s **)(v2 + OBJC_IVAR____TtCC11photosfaced9Analytics14BackgroundTask_lock);
  *(void *)(v0 + 272) = v3;
  uint64_t v4 = swift_task_alloc();
  *(void *)(v4 + 16) = v2;
  *(void *)(v4 + 24) = v1;
  uint64_t v5 = swift_task_alloc();
  *(void *)(v5 + 16) = sub_1000D26B8;
  *(void *)(v5 + 24) = v4;
  os_unfair_lock_lock(v3 + 4);
  sub_1000D2E10();
  os_unfair_lock_unlock(v3 + 4);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 280) = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_1000CF378;
  char v7 = *(unsigned char *)(v0 + 304);
  return sub_1000D0EE4(v7);
}

uint64_t sub_1000CF378(uint64_t a1, char a2)
{
  uint64_t v5 = *v3;
  *(void *)(v5 + 288) = a1;
  *(void *)(v5 + 296) = v2;
  swift_task_dealloc();
  if (v2)
  {
    uint64_t v6 = sub_1000D03E4;
  }
  else
  {
    *(unsigned char *)(v5 + 305) = a2;
    uint64_t v6 = sub_1000CF4C8;
  }
  return _swift_task_switch(v6, 0, 0);
}

uint64_t sub_1000CF4C8()
{
  uint64_t v124 = v0;
  uint64_t v1 = v0 + 96;
  if (*(unsigned char *)(v0 + 305))
  {
    uint64_t v13 = *(void *)(v0 + 248);
    uint64_t v14 = *(void *)(v0 + 256);
    uint64_t v15 = *(void *)(v0 + 192);
    uint64_t v16 = *(void *)(v0 + 200);
    static Log.session.getter();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v13, v14, v15);
    swift_retain_n();
    id v17 = Logger.logObject.getter();
    os_log_type_t v18 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = *(unsigned __int8 *)(v0 + 304);
      uint64_t v20 = swift_slowAlloc();
      v123[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v20 = 136315394;
      unint64_t v21 = 0xE400000000000000;
      char loga = v17;
      uint64_t v22 = 1668184435;
      switch(v19)
      {
        case 1:
          unint64_t v21 = 0xE700000000000000;
          uint64_t v22 = 0x68736572666572;
          break;
        case 2:
          uint64_t v22 = 0x69737365636F7270;
          unint64_t v21 = 0xEA0000000000676ELL;
          break;
        case 3:
          unint64_t v21 = 0xE600000000000000;
          uint64_t v22 = 0x70756D726177;
          break;
        case 4:
          unint64_t v21 = 0xE700000000000000;
          uint64_t v22 = 0x70756E61656C63;
          break;
        default:
          break;
      }
      uint64_t v66 = *(void *)(v0 + 232);
      uint64_t v67 = *(void *)(v0 + 192);
      uint64_t v68 = *(void *)(v0 + 200);
      uint64_t v114 = *(void *)(v0 + 160);
      uint64_t v116 = *(void *)(v0 + 152);
      uint64_t v117 = *(void *)(v0 + 184);
      uint64_t v111 = *(void *)(v0 + 248);
      *(void *)(v0 + 80) = sub_100007E88(v22, v21, v123);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v20 + 12) = 2080;
      ContinuousClock.now.getter();
      ContinuousClock.Instant.duration(to:)();
      os_log_type_t v69 = *(void (**)(uint64_t, uint64_t))(v68 + 8);
      v69(v66, v67);
      uint64_t v70 = Duration.description.getter();
      *(void *)(v0 + 88) = sub_100007E88(v70, v71, v123);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      unint64_t v36 = v69;
      swift_release_n();
      v69(v111, v67);
      _os_log_impl((void *)&_mh_execute_header, loga, v18, "Marking %s as complete after %s", (uint8_t *)v20, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v114 + 8))(v117, v116);
    }
    else
    {
      uint64_t v30 = *(void *)(v0 + 248);
      uint64_t v31 = *(void *)(v0 + 192);
      uint64_t v32 = *(void *)(v0 + 200);
      uint64_t v33 = *(void *)(v0 + 184);
      uint64_t v34 = *(void *)(v0 + 152);
      uint64_t v35 = *(void *)(v0 + 160);
      swift_release_n();
      unint64_t v36 = *(void (**)(uint64_t, uint64_t))(v32 + 8);
      v36(v30, v31);

      (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v33, v34);
    }
    uint64_t v72 = *(void *)(v0 + 296);
    uint64_t v73 = *(void *)(v0 + 216);
    uint64_t v74 = *(void *)(v0 + 136);
    int v75 = (os_unfair_lock_s *)(*(void *)(v0 + 272) + 16);
    static ContinuousClock.Instant.now.getter();
    uint64_t v76 = swift_task_alloc();
    *(void *)(v76 + 16) = v74;
    *(void *)(v76 + 24) = v73;
    uint64_t v77 = swift_task_alloc();
    *(void *)(v77 + 16) = sub_1000D26F0;
    *(void *)(v77 + 24) = v76;
    os_unfair_lock_lock(v75);
    sub_1000D2E10();
    os_unfair_lock_unlock(v75);
    uint64_t result = swift_task_dealloc();
    if (!v72)
    {
      uint64_t v78 = *(void *)(v0 + 216);
      uint64_t v79 = *(void *)(v0 + 192);
      uint64_t v80 = *(void **)(v0 + 144);
      swift_task_dealloc();
      v36(v78, v79);
      [v80 setTaskCompleted];
      goto LABEL_27;
    }
  }
  else
  {
    double v2 = *(double *)(v0 + 288);
    uint64_t v3 = *(void *)(v0 + 256);
    uint64_t v4 = *(void *)(v0 + 240);
    uint64_t v5 = *(void *)(v0 + 192);
    uint64_t v6 = *(void *)(v0 + 200);
    static Log.session.getter();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v4, v3, v5);
    swift_retain_n();
    char v7 = Logger.logObject.getter();
    os_log_type_t v8 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v7, v8))
    {
      os_log_type_t log = v7;
      uint64_t v9 = *(unsigned __int8 *)(v0 + 304);
      uint64_t v10 = swift_slowAlloc();
      v123[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v10 = 136315650;
      unint64_t v11 = 0xE400000000000000;
      uint64_t v12 = 1668184435;
      switch(v9)
      {
        case 1:
          unint64_t v11 = 0xE700000000000000;
          uint64_t v12 = 0x68736572666572;
          break;
        case 2:
          uint64_t v12 = 0x69737365636F7270;
          unint64_t v11 = 0xEA0000000000676ELL;
          break;
        case 3:
          unint64_t v11 = 0xE600000000000000;
          uint64_t v12 = 0x70756D726177;
          break;
        case 4:
          unint64_t v11 = 0xE700000000000000;
          uint64_t v12 = 0x70756E61656C63;
          break;
        default:
          break;
      }
      uint64_t v38 = *(void *)(v0 + 232);
      uint64_t v37 = *(void *)(v0 + 240);
      uint64_t v39 = *(void *)(v0 + 200);
      uint64_t v107 = *(void *)(v0 + 192);
      uint64_t v112 = *(void *)(v0 + 160);
      uint64_t v113 = *(void *)(v0 + 152);
      uint64_t v115 = *(void *)(v0 + 176);
      uint64_t v109 = *(void *)(v0 + 288);
      *(void *)(v0 + 104) = sub_100007E88(v12, v11, v123);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v10 + 12) = 2080;
      ContinuousClock.now.getter();
      ContinuousClock.Instant.duration(to:)();
      char v29 = *(void (**)(uint64_t, uint64_t))(v39 + 8);
      v29(v38, v107);
      uint64_t v40 = Duration.description.getter();
      *(void *)(v0 + 112) = sub_100007E88(v40, v41, v123);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_release_n();
      v29(v37, v107);
      *(_WORD *)(v10 + 22) = 2048;
      *(void *)(v0 + 120) = v109;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, log, v8, "Asked to delay task %s after %s. Retrying in %f seconds.", (uint8_t *)v10, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v112 + 8))(v115, v113);
      uint64_t v1 = v0 + 96;
    }
    else
    {
      uint64_t v23 = *(void *)(v0 + 240);
      uint64_t v24 = *(void *)(v0 + 192);
      uint64_t v25 = *(void *)(v0 + 200);
      uint64_t v26 = *(void *)(v0 + 176);
      uint64_t v27 = *(void *)(v0 + 152);
      uint64_t v28 = *(void *)(v0 + 160);
      swift_release_n();
      char v29 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
      v29(v23, v24);

      (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v26, v27);
    }
    uint64_t v42 = *(void *)(v0 + 296);
    uint64_t v43 = *(void *)(v0 + 224);
    uint64_t v44 = *(void *)(v0 + 136);
    uint64_t v45 = (os_unfair_lock_s *)(*(void *)(v0 + 272) + 16);
    static ContinuousClock.Instant.now.getter();
    uint64_t v46 = swift_task_alloc();
    *(void *)(v46 + 16) = v44;
    *(void *)(v46 + 24) = v43;
    uint64_t v47 = swift_task_alloc();
    *(void *)(v47 + 16) = sub_1000D2E2C;
    *(void *)(v47 + 24) = v46;
    os_unfair_lock_lock(v45);
    sub_1000D2E10();
    os_unfair_lock_unlock(v45);
    uint64_t result = swift_task_dealloc();
    if (!v42)
    {
      uint64_t v49 = *(void *)(v0 + 224);
      uint64_t v50 = *(void *)(v0 + 192);
      uint64_t v51 = *(void **)(v0 + 144);
      swift_task_dealloc();
      v29(v49, v50);
      *(void *)(v0 + 96) = 0;
      unsigned int v52 = [v51 setTaskExpiredWithRetryAfter:v1 error:v2];
      uint64_t v53 = *(void **)(v0 + 96);
      if (v52)
      {
        id v54 = v53;
        unint64_t v36 = v29;
      }
      else
      {
        id v55 = v53;
        _convertNSErrorToError(_:)();

        swift_willThrow();
        uint64_t v56 = *(void *)(v0 + 256);
        uint64_t v58 = *(void *)(v0 + 200);
        uint64_t v57 = *(void *)(v0 + 208);
        uint64_t v59 = *(void *)(v0 + 192);
        static Log.session.getter();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v58 + 16))(v57, v56, v59);
        swift_retain();
        swift_errorRetain();
        swift_retain();
        swift_errorRetain();
        uint64_t v60 = Logger.logObject.getter();
        os_log_type_t v61 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v60, v61))
        {
          uint64_t v62 = *(unsigned __int8 *)(v0 + 304);
          uint64_t v63 = 1668184435;
          uint64_t v64 = swift_slowAlloc();
          v123[0] = swift_slowAlloc();
          *(_DWORD *)uint64_t v64 = 136315650;
          unint64_t v65 = 0xE400000000000000;
          switch(v62)
          {
            case 1:
              unint64_t v65 = 0xE700000000000000;
              uint64_t v63 = 0x68736572666572;
              break;
            case 2:
              uint64_t v63 = 0x69737365636F7270;
              unint64_t v65 = 0xEA0000000000676ELL;
              break;
            case 3:
              unint64_t v65 = 0xE600000000000000;
              uint64_t v63 = 0x70756D726177;
              break;
            case 4:
              unint64_t v65 = 0xE700000000000000;
              uint64_t v63 = 0x70756E61656C63;
              break;
            default:
              break;
          }
          uint64_t v90 = *(void *)(v0 + 232);
          uint64_t v91 = *(void *)(v0 + 208);
          uint64_t v108 = *(void *)(v0 + 200);
          uint64_t v110 = *(void *)(v0 + 192);
          uint64_t v118 = *(void *)(v0 + 160);
          uint64_t v119 = *(void *)(v0 + 152);
          uint64_t v120 = *(void *)(v0 + 168);
          *(void *)(v0 + 40) = sub_100007E88(v63, v65, v123);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          *(_WORD *)(v64 + 12) = 2080;
          swift_getErrorValue();
          uint64_t v92 = sub_10000988C(*(void *)(v0 + 24));
          *(void *)(v0 + 64) = sub_100007E88(v92, v93, v123);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          swift_errorRelease();
          swift_errorRelease();
          *(_WORD *)(v64 + 22) = 2080;
          ContinuousClock.now.getter();
          ContinuousClock.Instant.duration(to:)();
          uint64_t v94 = *(void (**)(uint64_t, uint64_t))(v108 + 8);
          v94(v90, v110);
          uint64_t v95 = Duration.description.getter();
          *(void *)(v0 + 72) = sub_100007E88(v95, v96, v123);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          swift_release_n();
          v94(v91, v110);
          unint64_t v36 = v94;
          _os_log_impl((void *)&_mh_execute_header, v60, v61, "Failed to complete task %s due to error %s after %s. Retrying.", (uint8_t *)v64, 0x20u);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          (*(void (**)(uint64_t, uint64_t))(v118 + 8))(v120, v119);
        }
        else
        {
          uint64_t v85 = *(void *)(v0 + 200);
          uint64_t v84 = *(void *)(v0 + 208);
          uint64_t v86 = *(void *)(v0 + 192);
          uint64_t v88 = *(void *)(v0 + 160);
          uint64_t v87 = *(void *)(v0 + 168);
          uint64_t v89 = *(void *)(v0 + 152);
          swift_errorRelease();
          swift_errorRelease();
          swift_release_n();
          unint64_t v36 = *(void (**)(uint64_t, uint64_t))(v85 + 8);
          v36(v84, v86);

          (*(void (**)(uint64_t, uint64_t))(v88 + 8))(v87, v89);
        }
        uint64_t v97 = *(void *)(v0 + 136);
        char v98 = (os_unfair_lock_s *)(*(void *)(v0 + 272) + 16);
        uint64_t v99 = swift_task_alloc();
        *(void *)(v99 + 16) = sub_1000D26D4;
        *(void *)(v99 + 24) = v97;
        os_unfair_lock_lock(v98);
        sub_1000D2E10();
        os_unfair_lock_unlock(v98);
        swift_task_dealloc();
        uint64_t v100 = *(void **)(v0 + 144);
        *(void *)(v0 + 56) = 0;
        unsigned int v101 = [v100 setTaskExpiredWithRetryAfter:v0 + 56 error:0.0];
        v102 = *(void **)(v0 + 56);
        if (!v101)
        {
          uint64_t v104 = *(void *)(v0 + 256);
          uint64_t v105 = *(void *)(v0 + 192);
          id v106 = v102;
          _convertNSErrorToError(_:)();

          swift_willThrow();
          swift_errorRelease();
          sub_100006208();
          v36(v104, v105);
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
          int v83 = *(uint64_t (**)(void))(v0 + 8);
          goto LABEL_28;
        }
        id v103 = v102;
        swift_errorRelease();
      }
LABEL_27:
      uint64_t v81 = *(void *)(v0 + 256);
      uint64_t v82 = *(void *)(v0 + 192);
      sub_100006208();
      v36(v81, v82);
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
      int v83 = *(uint64_t (**)(void))(v0 + 8);
LABEL_28:
      return v83();
    }
  }
  return result;
}

uint64_t sub_1000D03E4()
{
  uint64_t v45 = v0;
  uint64_t v1 = *(void *)(v0 + 256);
  uint64_t v3 = *(void *)(v0 + 200);
  uint64_t v2 = *(void *)(v0 + 208);
  uint64_t v4 = *(void *)(v0 + 192);
  static Log.session.getter();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v1, v4);
  swift_retain();
  swift_errorRetain();
  swift_retain();
  swift_errorRetain();
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = *(unsigned __int8 *)(v0 + 304);
    uint64_t v8 = swift_slowAlloc();
    v44[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136315650;
    unint64_t v9 = 0xE400000000000000;
    uint64_t v10 = 1668184435;
    switch(v7)
    {
      case 1:
        unint64_t v9 = 0xE700000000000000;
        uint64_t v10 = 0x68736572666572;
        break;
      case 2:
        unint64_t v9 = 0xEA0000000000676ELL;
        uint64_t v10 = 0x69737365636F7270;
        break;
      case 3:
        unint64_t v9 = 0xE600000000000000;
        uint64_t v10 = 0x70756D726177;
        break;
      case 4:
        unint64_t v9 = 0xE700000000000000;
        uint64_t v10 = 0x70756E61656C63;
        break;
      default:
        break;
    }
    uint64_t v18 = *(void *)(v0 + 232);
    uint64_t v20 = *(void *)(v0 + 200);
    uint64_t v19 = *(void *)(v0 + 208);
    uint64_t v41 = *(void *)(v0 + 160);
    uint64_t v42 = *(void *)(v0 + 152);
    uint64_t v43 = *(void *)(v0 + 168);
    uint64_t v40 = *(void *)(v0 + 192);
    *(void *)(v0 + 40) = sub_100007E88(v10, v9, v44);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v8 + 12) = 2080;
    swift_getErrorValue();
    uint64_t v21 = sub_10000988C(*(void *)(v0 + 24));
    *(void *)(v0 + 64) = sub_100007E88(v21, v22, v44);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    *(_WORD *)(v8 + 22) = 2080;
    ContinuousClock.now.getter();
    uint64_t v23 = v19;
    ContinuousClock.Instant.duration(to:)();
    id v17 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
    v17(v18, v40);
    uint64_t v24 = Duration.description.getter();
    *(void *)(v0 + 72) = sub_100007E88(v24, v25, v44);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_release_n();
    v17(v23, v40);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Failed to complete task %s due to error %s after %s. Retrying.", (uint8_t *)v8, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v43, v42);
  }
  else
  {
    uint64_t v12 = *(void *)(v0 + 200);
    uint64_t v11 = *(void *)(v0 + 208);
    uint64_t v13 = *(void *)(v0 + 192);
    uint64_t v15 = *(void *)(v0 + 160);
    uint64_t v14 = *(void *)(v0 + 168);
    uint64_t v16 = *(void *)(v0 + 152);
    swift_errorRelease();
    swift_errorRelease();
    swift_release_n();
    id v17 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    v17(v11, v13);

    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
  }
  uint64_t v26 = *(void *)(v0 + 136);
  uint64_t v27 = (os_unfair_lock_s *)(*(void *)(v0 + 272) + 16);
  uint64_t v28 = swift_task_alloc();
  *(void *)(v28 + 16) = sub_1000D26D4;
  *(void *)(v28 + 24) = v26;
  os_unfair_lock_lock(v27);
  sub_1000D2E10();
  os_unfair_lock_unlock(v27);
  swift_task_dealloc();
  char v29 = *(void **)(v0 + 144);
  *(void *)(v0 + 56) = 0;
  unsigned int v30 = [v29 setTaskExpiredWithRetryAfter:v0 + 56 error:0.0];
  uint64_t v31 = *(void **)(v0 + 56);
  if (v30)
  {
    id v32 = v31;
    swift_errorRelease();
    uint64_t v33 = *(void *)(v0 + 256);
    uint64_t v34 = *(void *)(v0 + 192);
    sub_100006208();
    v17(v33, v34);
  }
  else
  {
    uint64_t v36 = *(void *)(v0 + 256);
    uint64_t v37 = *(void *)(v0 + 192);
    id v38 = v31;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_errorRelease();
    sub_100006208();
    v17(v36, v37);
  }
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
  uint64_t v35 = *(uint64_t (**)(void))(v0 + 8);
  return v35();
}

void sub_1000D0AAC(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for ContinuousClock.Instant();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  unint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Logger();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((static TestProperties.ignoreDuetCancellations.getter() & 1) == 0)
  {
    uint64_t v28 = a2;
    uint64_t v29 = v6;
    static Log.session.getter();
    uint64_t v14 = Logger.logObject.getter();
    os_log_type_t v15 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v27 = a3;
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      uint64_t v31 = v26;
      *(_DWORD *)uint64_t v16 = 136315138;
      unint64_t v17 = 0xE400000000000000;
      uint64_t v18 = 1668184435;
      switch(a1)
      {
        case 1:
          unint64_t v17 = 0xE700000000000000;
          uint64_t v18 = 0x68736572666572;
          break;
        case 2:
          unint64_t v17 = 0xEA0000000000676ELL;
          uint64_t v18 = 0x69737365636F7270;
          break;
        case 3:
          unint64_t v17 = 0xE600000000000000;
          uint64_t v18 = 0x70756D726177;
          break;
        case 4:
          unint64_t v17 = 0xE700000000000000;
          uint64_t v18 = 0x70756E61656C63;
          break;
        default:
          break;
      }
      uint64_t v30 = sub_100007E88(v18, v17, &v31);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Duet asked us to cancel task %s", v16, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    }
    uint64_t v19 = static ContinuousClock.Instant.now.getter();
    uint64_t v20 = __chkstk_darwin(v19);
    *(&v25 - 2) = v21;
    *(&v25 - 1) = (uint64_t)v9;
    __chkstk_darwin(v20);
    *(&v25 - 2) = (uint64_t)sub_1000D2674;
    *(&v25 - 1) = v22;
    uint64_t v24 = v23 + 4;
    os_unfair_lock_lock(v23 + 4);
    sub_1000D2690();
    os_unfair_lock_unlock(v24);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v29);
    sub_100005CB0(&qword_1000F2850);
    Task.cancel()();
  }
}

uint64_t sub_1000D0EA0(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_1000D0EE4(char a1)
{
  *(void *)(v2 + 184) = v1;
  *(unsigned char *)(v2 + 105) = a1;
  uint64_t v3 = type metadata accessor for Logger();
  *(void *)(v2 + 192) = v3;
  *(void *)(v2 + 200) = *(void *)(v3 - 8);
  *(void *)(v2 + 208) = swift_task_alloc();
  *(void *)(v2 + 216) = swift_task_alloc();
  return _swift_task_switch(sub_1000D0FB8, v1, 0);
}

uint64_t sub_1000D0FB8()
{
  uint64_t v29 = v0;
  uint64_t v1 = (uint64_t *)(*(void *)(v0 + 184) + OBJC_IVAR____TtC11photosfaced21BackgroundTaskManager_registry);
  swift_beginAccess();
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(v2 + 16);
  swift_bridgeObjectRetain();
  if (v3 && (unint64_t v4 = sub_1000507B8(*(unsigned char *)(v0 + 105)), (v5 & 1) != 0))
  {
    uint64_t v6 = *(void **)(*(void *)(v2 + 56) + 8 * v4);
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v6 = _swiftEmptyArrayStorage;
  }
  *(void *)(v0 + 224) = v6;
  swift_bridgeObjectRelease();
  static Log.session.getter();
  swift_bridgeObjectRetain();
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = *(unsigned __int8 *)(v0 + 105);
    uint64_t v10 = swift_slowAlloc();
    uint64_t v28 = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 134218242;
    *(void *)(v0 + 168) = v6[2];
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2080;
    unint64_t v11 = 0xE400000000000000;
    uint64_t v12 = 1668184435;
    switch(v9)
    {
      case 1:
        unint64_t v11 = 0xE700000000000000;
        uint64_t v12 = 0x68736572666572;
        break;
      case 2:
        unint64_t v11 = 0xEA0000000000676ELL;
        uint64_t v12 = 0x69737365636F7270;
        break;
      case 3:
        unint64_t v11 = 0xE600000000000000;
        uint64_t v12 = 0x70756D726177;
        break;
      case 4:
        unint64_t v11 = 0xE700000000000000;
        uint64_t v12 = 0x70756E61656C63;
        break;
      default:
        break;
    }
    uint64_t v17 = *(void *)(v0 + 200);
    uint64_t v25 = *(void *)(v0 + 192);
    uint64_t v26 = *(void *)(v0 + 216);
    *(void *)(v0 + 176) = sub_100007E88(v12, v11, &v28);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Running %ld tasks for %s", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v16 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
    v16(v26, v25);
  }
  else
  {
    uint64_t v13 = *(void *)(v0 + 216);
    uint64_t v14 = *(void *)(v0 + 192);
    uint64_t v15 = *(void *)(v0 + 200);
    swift_bridgeObjectRelease();

    uint64_t v16 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
    v16(v13, v14);
  }
  *(void *)(v0 + 232) = v16;
  uint64_t v18 = v6[2];
  *(void *)(v0 + 240) = v18;
  if (v18)
  {
    uint64_t v20 = (int *)v6[4];
    uint64_t v19 = v6[5];
    swift_retain();
    if (static Task<>.isCancelled.getter())
    {
      swift_release();
      swift_bridgeObjectRelease();
      type metadata accessor for CancellationError();
      sub_1000D2D68(&qword_1000F4308, (void (*)(uint64_t))&type metadata accessor for CancellationError);
      swift_allocError();
      CancellationError.init()();
      swift_willThrow();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v21 = *(uint64_t (**)(void))(v0 + 8);
      return v21();
    }
    else
    {
      *(void *)(v0 + 248) = v19;
      *(void *)(v0 + 256) = 1;
      uint64_t v27 = (uint64_t (*)(uint64_t))((char *)v20 + *v20);
      uint64_t v24 = (void *)swift_task_alloc();
      *(void *)(v0 + 264) = v24;
      *uint64_t v24 = v0;
      v24[1] = sub_1000D149C;
      return v27(v0 + 88);
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v23 = *(uint64_t (**)(void, uint64_t))(v0 + 8);
    return v23(0, 1);
  }
}

uint64_t sub_1000D149C()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    swift_release();
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
  else
  {
    uint64_t v6 = *(void *)(v2 + 184);
    swift_release();
    *(_OWORD *)(v2 + 272) = *(_OWORD *)(v2 + 88);
    *(unsigned char *)(v2 + 106) = *(unsigned char *)(v2 + 104);
    return _swift_task_switch(sub_1000D1628, v6, 0);
  }
}

uint64_t sub_1000D1628()
{
  uint64_t v26 = v0;
  uint64_t v1 = *(unsigned __int8 *)(v0 + 106);
  if ((v1 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    Duration.timeInterval.getter();
    *(double *)(v0 + 152) = v2;
    if (v2 < 300.0 || v2 > 64000000.0)
    {
      static Log.session.getter();
      unint64_t v4 = Logger.logObject.getter();
      os_log_type_t v5 = static os_log_type_t.error.getter();
      BOOL v6 = os_log_type_enabled(v4, v5);
      uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v0 + 232);
      uint64_t v8 = *(void *)(v0 + 208);
      uint64_t v9 = *(void *)(v0 + 192);
      if (v6)
      {
        uint64_t v23 = *(void (**)(uint64_t, uint64_t))(v0 + 232);
        os_log_type_t type = v5;
        uint64_t v10 = swift_slowAlloc();
        uint64_t v22 = swift_slowAlloc();
        *(_DWORD *)uint64_t v10 = 134218242;
        uint64_t v25 = v22;
        swift_beginAccess();
        *(void *)(v0 + 128) = *(void *)(v0 + 152);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *(_WORD *)(v10 + 12) = 2080;
        *(_OWORD *)(v0 + 136) = xmmword_1000D84C0;
        *(void *)(v0 + 112) = 0;
        *(void *)(v0 + 120) = 0xE000000000000000;
        _print_unlocked<A, B>(_:_:)();
        v11._countAndFlagsBits = 3026478;
        v11._object = (void *)0xE300000000000000;
        String.append(_:)(v11);
        _print_unlocked<A, B>(_:_:)();
        *(void *)(v0 + 160) = sub_100007E88(*(void *)(v0 + 112), *(void *)(v0 + 120), &v25);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v4, type, "Invalid Delay Duration: %f, clamping to %s", (uint8_t *)v10, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v23(v8, v9);
      }
      else
      {

        v7(v8, v9);
      }
      swift_beginAccess();
      double v2 = fmax(*(double *)(v0 + 152), 300.0);
      if (v2 >= 64000000.0) {
        double v2 = 64000000.0;
      }
    }
    double v14 = v2;
    goto LABEL_17;
  }
  if (*(_OWORD *)(v0 + 272) != 0
    || (unint64_t v12 = *(void *)(v0 + 256), result = *(void *)(v0 + 224), v12 == *(void *)(v0 + 240)))
  {
    swift_bridgeObjectRelease();
    double v14 = 0.0;
LABEL_17:
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v15 = *(uint64_t (**)(void, uint64_t))(v0 + 8);
    return v15(*(void *)&v14, v1);
  }
  if (v12 >= *(void *)(result + 16))
  {
    __break(1u);
  }
  else
  {
    uint64_t v16 = result + 16 * v12;
    uint64_t v17 = *(int **)(v16 + 32);
    uint64_t v18 = *(void *)(v16 + 40);
    swift_retain();
    if (static Task<>.isCancelled.getter())
    {
      swift_release();
      swift_bridgeObjectRelease();
      type metadata accessor for CancellationError();
      sub_1000D2D68(&qword_1000F4308, (void (*)(uint64_t))&type metadata accessor for CancellationError);
      swift_allocError();
      CancellationError.init()();
      swift_willThrow();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v19 = *(uint64_t (**)(void))(v0 + 8);
      return v19();
    }
    else
    {
      *(void *)(v0 + 248) = v18;
      *(void *)(v0 + 256) = v12 + 1;
      uint64_t v24 = (uint64_t (*)(uint64_t))((char *)v17 + *v17);
      uint64_t v20 = (void *)swift_task_alloc();
      *(void *)(v0 + 264) = v20;
      *uint64_t v20 = v0;
      v20[1] = sub_1000D149C;
      return v24(v0 + 88);
    }
  }
  return result;
}

uint64_t sub_1000D1B50()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC11photosfaced21BackgroundTaskManager_clock;
  uint64_t v2 = type metadata accessor for ContinuousClock();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();

  return _swift_defaultActor_deallocate(v0);
}

uint64_t sub_1000D1BE4()
{
  return type metadata accessor for BackgroundTaskManager();
}

uint64_t type metadata accessor for BackgroundTaskManager()
{
  uint64_t result = qword_1000F4220;
  if (!qword_1000F4220) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000D1C38()
{
  uint64_t result = type metadata accessor for ContinuousClock();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

__n128 initializeBufferWithCopyOfBuffer for BackgroundTaskManager.Result(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for BackgroundTaskManager.Result(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for BackgroundTaskManager.Result(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = 0;
    *(void *)(result + 8) = 0;
    *(unsigned char *)(result + 16) = 0;
    *(_DWORD *)__n128 result = a2 - 1;
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
  *(unsigned char *)(result + 17) = v3;
  return result;
}

uint64_t sub_1000D1D50(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1000D1D6C(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    *(unsigned char *)(result + 16) = 1;
  }
  else
  {
    *(unsigned char *)(result + 16) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for BackgroundTaskManager.Result()
{
  return &type metadata for BackgroundTaskManager.Result;
}

void *sub_1000D1D9C(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_1000D1EB8(a1, a2, a3, a4, &qword_1000F4350);
}

char *sub_1000D1DA8(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
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
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_100005CB0(&qword_1000F36F0);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[16 * v8 + 32]) {
          memmove(v13, a4 + 32, 16 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_1000D27FC(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_1000D1EB8(void *result, int64_t a2, char a3, void *a4, uint64_t *a5)
{
  char v6 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v8 = a2;
    goto LABEL_8;
  }
  unint64_t v7 = a4[3];
  uint64_t v8 = v7 >> 1;
  if ((uint64_t)(v7 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v8 + 0x4000000000000000 >= 0)
  {
    uint64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v8 = a2;
    }
LABEL_8:
    uint64_t v9 = a4[2];
    if (v8 <= v9) {
      uint64_t v10 = a4[2];
    }
    else {
      uint64_t v10 = v8;
    }
    if (v10)
    {
      sub_100005CB0(a5);
      int64_t v11 = (void *)swift_allocObject();
      int64_t v12 = j__malloc_size(v11);
      uint64_t v13 = v12 - 32;
      if (v12 < 32) {
        uint64_t v13 = v12 - 17;
      }
      v11[2] = v9;
      v11[3] = 2 * (v13 >> 4);
      double v14 = v11 + 4;
      if (v6) {
        goto LABEL_15;
      }
    }
    else
    {
      int64_t v11 = _swiftEmptyArrayStorage;
      double v14 = &_swiftEmptyArrayStorage[4];
      if (result)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[2 * v9 + 4]) {
          memmove(v14, a4 + 4, 16 * v9);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_1000D28F0(0, v9, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v11;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000D1FC4(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_1000D1FEC(a1, a2, a3, a4, (uint64_t *)&unk_1000F3A60, &qword_1000F3A50);
}

uint64_t sub_1000D1FD8(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_1000D1FEC(a1, a2, a3, a4, &qword_1000F2A78, (uint64_t *)&unk_1000F3A70);
}

uint64_t sub_1000D1FEC(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t *a6)
{
  if (a3)
  {
    unint64_t v9 = *(void *)(a4 + 24);
    uint64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v10 = a2;
      }
    }
  }
  else
  {
    uint64_t v10 = a2;
  }
  uint64_t v11 = *(void *)(a4 + 16);
  if (v10 <= v11) {
    uint64_t v12 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v12 = v10;
  }
  if (!v12)
  {
    uint64_t v16 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100005CB0(a5);
  uint64_t v13 = *(void *)(sub_100005CB0(a6) - 8);
  uint64_t v14 = *(void *)(v13 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v16 = (void *)swift_allocObject();
  size_t v17 = j__malloc_size(v16);
  if (!v14 || (v17 - v15 == 0x8000000000000000 ? (BOOL v18 = v14 == -1) : (BOOL v18 = 0), v18))
  {
LABEL_29:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  uint64_t v19 = *(void *)(sub_100005CB0(a6) - 8);
  unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  unint64_t v21 = (unint64_t)v16 + v20;
  if (a1)
  {
    if ((unint64_t)v16 < a4 || v21 >= a4 + v20 + *(void *)(v19 + 72) * v11)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1000D2BD0(0, v11, v21, a4, a6);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v16;
}

uint64_t sub_1000D2258(char a1, int64_t a2, char a3, unint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
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
  if (!v9)
  {
    uint64_t v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100005CB0(&qword_1000F2A30);
  uint64_t v10 = *(void *)(type metadata accessor for UUID() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for UUID() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1000D2A78(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_1000D24C0(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_1000D1FEC(a1, a2, a3, a4, &qword_1000F2E28, &qword_1000F2E30);
}

uint64_t sub_1000D24D4(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_1000D1FEC(a1, a2, a3, a4, &qword_1000F2EB0, (uint64_t *)&unk_1000F3A80);
}

uint64_t sub_1000D24E8()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_1000D2538(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  uint64_t v8 = *(void *)(v1 + 56);
  char v9 = *(unsigned char *)(v1 + 48);
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_1000043B4;
  return sub_1000CF02C(a1, v4, v5, v6, v7, v9, v8);
}

uint64_t sub_1000D2610()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_1000D2650()
{
  sub_1000D0AAC(*(unsigned char *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_1000D265C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000D266C()
{
  return swift_release();
}

uint64_t sub_1000D2674()
{
  return sub_100006068(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_1000D2690()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1000D26B8()
{
  return sub_100005FCC(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_1000D26D4()
{
  return sub_1000061F4(v0);
}

uint64_t sub_1000D26F0()
{
  return sub_100005FAC(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_1000D270C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000D2744(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100005F94;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1000F4328 + dword_1000F4328);
  return v6(a1, v4);
}

uint64_t sub_1000D27FC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_1000D28F0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      sub_100005CB0(&qword_1000F4340);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_1000D29FC()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000D2A34()
{
  swift_release();

  return _swift_deallocObject(v0, 25, 7);
}

uint64_t sub_1000D2A6C(void *a1)
{
  return sub_1000CE6AC(a1, *(void *)(v1 + 16), *(unsigned char *)(v1 + 24));
}

uint64_t sub_1000D2A78(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(type metadata accessor for UUID() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_1000D2BD0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = *(void *)(sub_100005CB0(a5) - 8);
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
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

unint64_t sub_1000D2D28()
{
  unint64_t result = qword_1000F4358;
  if (!qword_1000F4358)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000F4358);
  }
  return result;
}

uint64_t sub_1000D2D68(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1000D2DB0()
{
  unint64_t result = qword_1000F4370;
  if (!qword_1000F4370)
  {
    sub_100005F00(&qword_1000F4368);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000F4370);
  }
  return result;
}

uint64_t sub_1000D2E10()
{
  return sub_1000D2690();
}

uint64_t sub_1000D2E2C()
{
  return sub_1000D26F0();
}

uint64_t getEnumTagSinglePayload for BackgroundTaskType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
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
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for BackgroundTaskType(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 4;
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
        JUMPOUT(0x1000D2FA0);
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
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BackgroundTaskType()
{
  return &type metadata for BackgroundTaskType;
}

unint64_t sub_1000D2FDC()
{
  unint64_t result = qword_1000F4378;
  if (!qword_1000F4378)
  {
    sub_100005F00(&qword_1000F4380);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000F4378);
  }
  return result;
}

uint64_t sub_1000D3038(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 1668184435;
  unint64_t v3 = 0xE400000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 1668184435;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE700000000000000;
      uint64_t v5 = 0x68736572666572;
      break;
    case 2:
      uint64_t v5 = 0x69737365636F7270;
      unint64_t v3 = 0xEA0000000000676ELL;
      break;
    case 3:
      unint64_t v3 = 0xE600000000000000;
      uint64_t v5 = 0x70756D726177;
      break;
    case 4:
      unint64_t v3 = 0xE700000000000000;
      uint64_t v5 = 0x70756E61656C63;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE400000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE700000000000000;
      if (v5 == 0x68736572666572) {
        goto LABEL_13;
      }
      goto LABEL_16;
    case 2:
      unint64_t v6 = 0xEA0000000000676ELL;
      if (v5 != 0x69737365636F7270) {
        goto LABEL_16;
      }
      goto LABEL_13;
    case 3:
      unint64_t v6 = 0xE600000000000000;
      uint64_t v2 = 0x70756D726177;
      goto LABEL_12;
    case 4:
      unint64_t v6 = 0xE700000000000000;
      if (v5 != 0x70756E61656C63) {
        goto LABEL_16;
      }
      goto LABEL_13;
    default:
LABEL_12:
      if (v5 != v2) {
        goto LABEL_16;
      }
LABEL_13:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_16:
      }
        char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_1000D31F4(unsigned __int8 *a1, char *a2)
{
  return sub_1000D3038(*a1, *a2);
}

unint64_t sub_1000D3200@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_1000D36A4(*a1);
  *a2 = result;
  return result;
}

void sub_1000D3230(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xE400000000000000;
  uint64_t v3 = 1668184435;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE700000000000000;
      uint64_t v3 = 0x68736572666572;
      goto LABEL_3;
    case 2:
      *a1 = 0x69737365636F7270;
      a1[1] = 0xEA0000000000676ELL;
      break;
    case 3:
      *a1 = 0x70756D726177;
      a1[1] = 0xE600000000000000;
      break;
    case 4:
      *a1 = 0x70756E61656C63;
      a1[1] = 0xE700000000000000;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

Swift::Int sub_1000D32E4()
{
  return Hasher._finalize()();
}

uint64_t sub_1000D33D4()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000D34AC()
{
  return Hasher._finalize()();
}

void sub_1000D3598(void *a1@<X8>)
{
  *a1 = &off_1000EDDF0;
}

unint64_t sub_1000D35AC()
{
  unint64_t result = qword_1000F4388;
  if (!qword_1000F4388)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000F4388);
  }
  return result;
}

uint64_t sub_1000D3600()
{
  uint64_t result = 1668184435;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x68736572666572;
      break;
    case 2:
      uint64_t result = 0x69737365636F7270;
      break;
    case 3:
      uint64_t result = 0x70756D726177;
      break;
    case 4:
      uint64_t result = 0x70756E61656C63;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_1000D36A4(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1000EDD58, v2);
  swift_bridgeObjectRelease();
  if (v3 >= 5) {
    return 5;
  }
  else {
    return v3;
  }
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t type metadata accessor for URL.DirectoryHint()
{
  return type metadata accessor for URL.DirectoryHint();
}

uint64_t URL.absoluteString.getter()
{
  return URL.absoluteString.getter();
}

uint64_t URL.init(fileURLWithPath:)()
{
  return URL.init(fileURLWithPath:)();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t URL.appendingPathComponent(_:)()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t URL.withUnsafeFileSystemRepresentation<A>(_:)()
{
  return URL.withUnsafeFileSystemRepresentation<A>(_:)();
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::String __swiftcall URL.path(percentEncoded:)(Swift::Bool percentEncoded)
{
  uint64_t v1 = URL.path(percentEncoded:)(percentEncoded);
  result._object = v2;
  result._countAndFlagsBits = v1;
  return result;
}

uint64_t URL.appending<A>(path:directoryHint:)()
{
  return URL.appending<A>(path:directoryHint:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t Data.init(contentsOf:options:)()
{
  return Data.init(contentsOf:options:)();
}

uint64_t Data.description.getter()
{
  return Data.description.getter();
}

uint64_t Date.timeIntervalSinceReferenceDate.getter()
{
  return Date.timeIntervalSinceReferenceDate.getter();
}

uint64_t Date.init()()
{
  return Date.init()();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t UUID.init(uuidString:)()
{
  return UUID.init(uuidString:)();
}

uint64_t UUID.uuidString.getter()
{
  return UUID.uuidString.getter();
}

NSUUID __swiftcall UUID._bridgeToObjectiveC()()
{
  return (NSUUID)UUID._bridgeToObjectiveC()();
}

uint64_t static UUID._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

NSLocale __swiftcall Locale._bridgeToObjectiveC()()
{
  return (NSLocale)Locale._bridgeToObjectiveC()();
}

uint64_t static Locale.current.getter()
{
  return static Locale.current.getter();
}

uint64_t type metadata accessor for Locale()
{
  return type metadata accessor for Locale();
}

uint64_t pickPhotos(totalCount:day:picking:)()
{
  return pickPhotos(totalCount:day:picking:)();
}

uint64_t FetchFaceRequest.id.getter()
{
  return FetchFaceRequest.id.getter();
}

uint64_t FetchFaceRequest.init(id:day:)()
{
  return FetchFaceRequest.init(id:day:)();
}

uint64_t FetchFaceRequest.day.getter()
{
  return FetchFaceRequest.day.getter();
}

uint64_t type metadata accessor for FetchFaceRequest()
{
  return type metadata accessor for FetchFaceRequest();
}

uint64_t static SyncedPhotosFace.destreamify(_:)()
{
  return static SyncedPhotosFace.destreamify(_:)();
}

uint64_t SyncedPhotosFace.contentDescription.getter()
{
  return SyncedPhotosFace.contentDescription.getter();
}

uint64_t SyncedPhotosFace.init(id:day:uncached:cached:complete:)()
{
  return SyncedPhotosFace.init(id:day:uncached:cached:complete:)();
}

uint64_t default argument 4 of SyncedPhotosFace.init(id:day:uncached:cached:complete:)()
{
  return default argument 4 of SyncedPhotosFace.init(id:day:uncached:cached:complete:)();
}

uint64_t SyncedPhotosFace.id.getter()
{
  return SyncedPhotosFace.id.getter();
}

uint64_t SyncedPhotosFace.day.getter()
{
  return SyncedPhotosFace.day.getter();
}

uint64_t SyncedPhotosFace.photos.getter()
{
  return SyncedPhotosFace.photos.getter();
}

uint64_t SyncedPhotosFace.complete.getter()
{
  return SyncedPhotosFace.complete.getter();
}

uint64_t SyncedPhotosFace.uncached.getter()
{
  return SyncedPhotosFace.uncached.getter();
}

uint64_t SyncedPhotosFace.streamify()()
{
  return SyncedPhotosFace.streamify()();
}

uint64_t type metadata accessor for SyncedPhotosFace()
{
  return type metadata accessor for SyncedPhotosFace();
}

uint64_t PhotosXPCServer.registerFetchFace<A>(type:callback:)()
{
  return PhotosXPCServer.registerFetchFace<A>(type:callback:)();
}

uint64_t PhotosXPCServer.registerFetchFaceList<A>(type:callback:)()
{
  return PhotosXPCServer.registerFetchFaceList<A>(type:callback:)();
}

uint64_t PhotosXPCServer.registerFetchFaceByDay(type:callback:)()
{
  return PhotosXPCServer.registerFetchFaceByDay(type:callback:)();
}

uint64_t PhotosXPCServer.registerTrackFace<A, B>(type:callback:)()
{
  return PhotosXPCServer.registerTrackFace<A, B>(type:callback:)();
}

uint64_t PhotosXPCServer.registerUntrackFace(type:callback:)()
{
  return PhotosXPCServer.registerUntrackFace(type:callback:)();
}

uint64_t PhotosXPCServer.__allocating_init(messageCenter:)()
{
  return PhotosXPCServer.__allocating_init(messageCenter:)();
}

uint64_t PhotosXPCServer.registerSendMessage(callback:)()
{
  return PhotosXPCServer.registerSendMessage(callback:)();
}

uint64_t PhotosXPCServer.registerGenerateMask(callback:)()
{
  return PhotosXPCServer.registerGenerateMask(callback:)();
}

uint64_t PhotosXPCServer.registerGeneratePhoto<A>(callback:)()
{
  return PhotosXPCServer.registerGeneratePhoto<A>(callback:)();
}

uint64_t PhotosXPCServer.registerProvideAssetList<A>(type:callback:)()
{
  return PhotosXPCServer.registerProvideAssetList<A>(type:callback:)();
}

uint64_t type metadata accessor for PhotosXPCServer()
{
  return type metadata accessor for PhotosXPCServer();
}

uint64_t dispatch thunk of PhotosFaceID.id.getter()
{
  return dispatch thunk of PhotosFaceID.id.getter();
}

uint64_t PhotosFaceType.description.getter()
{
  return PhotosFaceType.description.getter();
}

uint64_t PhotosFaceType.rawValue.getter()
{
  return PhotosFaceType.rawValue.getter();
}

uint64_t PhotosFaceDatabase.queryPhotos(identifiers:)()
{
  return PhotosFaceDatabase.queryPhotos(identifiers:)();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> PhotosFaceDatabase.delete(identifiers:)(Swift::OpaquePointer identifiers)
{
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> PhotosFaceDatabase.insert(storedPhotos:)(Swift::OpaquePointer storedPhotos)
{
}

uint64_t dispatch thunk of PhotosFaceDatabase.activate()()
{
  return dispatch thunk of PhotosFaceDatabase.activate()();
}

uint64_t PhotosFaceDatabase.__allocating_init(location:)()
{
  return PhotosFaceDatabase.__allocating_init(location:)();
}

uint64_t default argument 0 of PhotosFaceDatabase.init(location:)()
{
  return default argument 0 of PhotosFaceDatabase.init(location:)();
}

uint64_t type metadata accessor for PhotosFaceDatabase()
{
  return type metadata accessor for PhotosFaceDatabase();
}

uint64_t MessageBody.deserialized<A>()()
{
  return MessageBody.deserialized<A>()();
}

uint64_t MessageBody.init<A>(serializable:version:)()
{
  return MessageBody.init<A>(serializable:version:)();
}

uint64_t MessageBody.init(data:files:version:)()
{
  return MessageBody.init(data:files:version:)();
}

uint64_t static MessageBody.empty(version:)()
{
  return static MessageBody.empty(version:)();
}

uint64_t MessageBody.files.getter()
{
  return MessageBody.files.getter();
}

uint64_t MessageBody.getData()()
{
  return MessageBody.getData()();
}

uint64_t MessageBody.isEmpty.getter()
{
  return MessageBody.isEmpty.getter();
}

uint64_t MessageBody.version.getter()
{
  return MessageBody.version.getter();
}

uint64_t type metadata accessor for MessageBody()
{
  return type metadata accessor for MessageBody();
}

uint64_t StoredPhoto.init(pfcStoredPhoto:baseURL:)()
{
  return StoredPhoto.init(pfcStoredPhoto:baseURL:)();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> StoredPhoto.writeToCache()()
{
}

uint64_t StoredPhoto.localIdentifier.getter()
{
  return StoredPhoto.localIdentifier.getter();
}

uint64_t StoredPhoto.layouts.getter()
{
  return StoredPhoto.layouts.getter();
}

uint64_t type metadata accessor for StoredPhoto()
{
  return type metadata accessor for StoredPhoto();
}

uint64_t MessageProto.hasComplete.getter()
{
  return MessageProto.hasComplete.getter();
}

uint64_t MessageProto.messageContent.getter()
{
  return MessageProto.messageContent.getter();
}

uint64_t MessageProto.messageContent.setter()
{
  return MessageProto.messageContent.setter();
}

uint64_t MessageProto.version.getter()
{
  return MessageProto.version.getter();
}

uint64_t MessageProto.version.setter()
{
  return MessageProto.version.setter();
}

uint64_t MessageProto.complete.getter()
{
  return MessageProto.complete.getter();
}

uint64_t MessageProto.complete.setter()
{
  return MessageProto.complete.setter();
}

uint64_t MessageProto.fileCount.getter()
{
  return MessageProto.fileCount.getter();
}

uint64_t MessageProto.fileCount.setter()
{
  return MessageProto.fileCount.setter();
}

uint64_t type metadata accessor for MessageProto()
{
  return type metadata accessor for MessageProto();
}

uint64_t static XPCConstants.serviceName.getter()
{
  return static XPCConstants.serviceName.getter();
}

uint64_t AlbumDatabase.__allocating_init(database:)()
{
  return AlbumDatabase.__allocating_init(database:)();
}

uint64_t type metadata accessor for AlbumDatabase()
{
  return type metadata accessor for AlbumDatabase();
}

uint64_t static TestProperties.watchFacePerDaySize.getter()
{
  return static TestProperties.watchFacePerDaySize.getter();
}

uint64_t static TestProperties.bufferSize.getter()
{
  return static TestProperties.bufferSize.getter();
}

uint64_t static TestProperties.gallerySize.getter()
{
  return static TestProperties.gallerySize.getter();
}

uint64_t static TestProperties.quicTimeout.getter()
{
  return static TestProperties.quicTimeout.getter();
}

uint64_t static TestProperties.requestTimeout.getter()
{
  return static TestProperties.requestTimeout.getter();
}

uint64_t static TestProperties.ignoreSyncCache.getter()
{
  return static TestProperties.ignoreSyncCache.getter();
}

uint64_t static TestProperties.albumRotationEpoch.getter()
{
  return static TestProperties.albumRotationEpoch.getter();
}

uint64_t static TestProperties.ignoreDuetCancellations.getter()
{
  return static TestProperties.ignoreDuetCancellations.getter();
}

uint64_t static TestProperties.targetGalleryShuffleSize.getter()
{
  return static TestProperties.targetGalleryShuffleSize.getter();
}

uint64_t static TestProperties.fixedDay.getter()
{
  return static TestProperties.fixedDay.getter();
}

uint64_t XPCEventStream.__allocating_init()()
{
  return XPCEventStream.__allocating_init()();
}

uint64_t type metadata accessor for XPCEventStream()
{
  return type metadata accessor for XPCEventStream();
}

uint64_t FileHeaderProto.filename.getter()
{
  return FileHeaderProto.filename.getter();
}

uint64_t FileHeaderProto.filename.setter()
{
  return FileHeaderProto.filename.setter();
}

uint64_t type metadata accessor for FileHeaderProto()
{
  return type metadata accessor for FileHeaderProto();
}

uint64_t GalleryDatabase.__allocating_init(database:)()
{
  return GalleryDatabase.__allocating_init(database:)();
}

uint64_t type metadata accessor for GalleryDatabase()
{
  return type metadata accessor for GalleryDatabase();
}

uint64_t InFlightRequest.requestID.getter()
{
  return InFlightRequest.requestID.getter();
}

uint64_t static ProtocolVersion.current.getter()
{
  return static ProtocolVersion.current.getter();
}

uint64_t ProtocolVersion.init(rawValue:)()
{
  return ProtocolVersion.init(rawValue:)();
}

uint64_t ProtocolVersion.rawValue.getter()
{
  return ProtocolVersion.rawValue.getter();
}

uint64_t type metadata accessor for ProtocolVersion()
{
  return type metadata accessor for ProtocolVersion();
}

uint64_t ShuffleDatabase.__allocating_init(database:)()
{
  return ShuffleDatabase.__allocating_init(database:)();
}

uint64_t type metadata accessor for ShuffleDatabase()
{
  return type metadata accessor for ShuffleDatabase();
}

uint64_t static SystemDirectory.photosFace.getter()
{
  return static SystemDirectory.photosFace.getter();
}

uint64_t static SystemDirectory.tempFolder()()
{
  return static SystemDirectory.tempFolder()();
}

uint64_t static SystemDirectory.baseImageURL(timePosition:uuid:)()
{
  return static SystemDirectory.baseImageURL(timePosition:uuid:)();
}

uint64_t static SystemDirectory.maskImageURL(timePosition:uuid:)()
{
  return static SystemDirectory.maskImageURL(timePosition:uuid:)();
}

uint64_t static SystemDirectory.folderURL(for:)()
{
  return static SystemDirectory.folderURL(for:)();
}

uint64_t SyncFacesRequest.init(trackedFaces:cachedIdentifiers:)()
{
  return SyncFacesRequest.init(trackedFaces:cachedIdentifiers:)();
}

uint64_t SyncFacesRequest.trackedFaces.getter()
{
  return SyncFacesRequest.trackedFaces.getter();
}

uint64_t SyncFacesRequest.cachedIdentifiers.getter()
{
  return SyncFacesRequest.cachedIdentifiers.getter();
}

uint64_t type metadata accessor for SyncFacesRequest()
{
  return type metadata accessor for SyncFacesRequest();
}

uint64_t XPCMessageCenter.Server.__allocating_init(serviceName:)()
{
  return XPCMessageCenter.Server.__allocating_init(serviceName:)();
}

uint64_t generateElements<A>(isolation:_:)()
{
  return generateElements<A>(isolation:_:)();
}

uint64_t dispatch thunk of BroadcastSequence.yield(_:)()
{
  return dispatch thunk of BroadcastSequence.yield(_:)();
}

uint64_t dispatch thunk of BroadcastSequence.finish(throwing:)()
{
  return dispatch thunk of BroadcastSequence.finish(throwing:)();
}

uint64_t dispatch thunk of BroadcastSequence.listen()()
{
  return dispatch thunk of BroadcastSequence.listen()();
}

uint64_t BroadcastSequence.__allocating_init()()
{
  return BroadcastSequence.__allocating_init()();
}

uint64_t StoredPhotoLayout.timePosition.getter()
{
  return StoredPhotoLayout.timePosition.getter();
}

uint64_t type metadata accessor for StoredPhotoLayout.ImageLocation()
{
  return type metadata accessor for StoredPhotoLayout.ImageLocation();
}

uint64_t StoredPhotoLayout.maskImage.getter()
{
  return StoredPhotoLayout.maskImage.getter();
}

uint64_t type metadata accessor for StoredPhotoLayout()
{
  return type metadata accessor for StoredPhotoLayout();
}

uint64_t static CommunicationActor.sharedQueue.getter()
{
  return static CommunicationActor.sharedQueue.getter();
}

uint64_t static CommunicationActor.assumeOnQueue<A>(_:)()
{
  return static CommunicationActor.assumeOnQueue<A>(_:)();
}

uint64_t static CommunicationActor.shared.getter()
{
  return static CommunicationActor.shared.getter();
}

uint64_t type metadata accessor for CommunicationActor()
{
  return type metadata accessor for CommunicationActor();
}

uint64_t type metadata accessor for DatabaseConnection.Location()
{
  return type metadata accessor for DatabaseConnection.Location();
}

uint64_t AsyncBufferSequence.makeAsyncIterator()()
{
  return AsyncBufferSequence.makeAsyncIterator()();
}

uint64_t AsyncThrowingChannel.makeAsyncIterator()()
{
  return AsyncThrowingChannel.makeAsyncIterator()();
}

uint64_t AsyncThrowingChannel.init()()
{
  return AsyncThrowingChannel.init()();
}

uint64_t DestructableSequence.__allocating_init(_:_:)()
{
  return DestructableSequence.__allocating_init(_:_:)();
}

uint64_t GeneratePhotoRequest.photoIdentifiers.getter()
{
  return GeneratePhotoRequest.photoIdentifiers.getter();
}

uint64_t dispatch thunk of MessageDemultiplexer.sendRequest(_:)()
{
  return dispatch thunk of MessageDemultiplexer.sendRequest(_:)();
}

uint64_t dispatch thunk of MessageDemultiplexer.error(_:_:)()
{
  return dispatch thunk of MessageDemultiplexer.error(_:_:)();
}

uint64_t dispatch thunk of MessageDemultiplexer.finish(_:)()
{
  return dispatch thunk of MessageDemultiplexer.finish(_:)();
}

uint64_t MessageDemultiplexer.__allocating_init(timeout:logTag:)()
{
  return MessageDemultiplexer.__allocating_init(timeout:logTag:)();
}

uint64_t default argument 0 of MessageDemultiplexer.init(timeout:logTag:)()
{
  return default argument 0 of MessageDemultiplexer.init(timeout:logTag:)();
}

uint64_t GeneratePhotoResponse.init(results:)()
{
  return GeneratePhotoResponse.init(results:)();
}

uint64_t type metadata accessor for GeneratePhotoResponse()
{
  return type metadata accessor for GeneratePhotoResponse();
}

uint64_t static AsyncBufferSequencePolicy.bounded(_:)()
{
  return static AsyncBufferSequencePolicy.bounded(_:)();
}

uint64_t type metadata accessor for AsyncBufferSequencePolicy()
{
  return type metadata accessor for AsyncBufferSequencePolicy();
}

uint64_t static Log.album.getter()
{
  return static Log.album.getter();
}

uint64_t static Log.cache.getter()
{
  return static Log.cache.getter();
}

uint64_t static Log.photos.getter()
{
  return static Log.photos.getter();
}

uint64_t static Log.default.getter()
{
  return static Log.default.getter();
}

uint64_t static Log.network.getter()
{
  return static Log.network.getter();
}

uint64_t static Log.session.getter()
{
  return static Log.session.getter();
}

uint64_t static Log.shuffle.getter()
{
  return static Log.shuffle.getter();
}

uint64_t AlbumID.album.getter()
{
  return AlbumID.album.getter();
}

uint64_t type metadata accessor for AlbumID()
{
  return type metadata accessor for AlbumID();
}

uint64_t Message.description.getter()
{
  return Message.description.getter();
}

uint64_t Message.shortDescription.getter()
{
  return Message.shortDescription.getter();
}

uint64_t Message.content.getter()
{
  return Message.content.getter();
}

uint64_t Message.complete.getter()
{
  return Message.complete.getter();
}

uint64_t Message.Operation.protobuf(proto:)()
{
  return Message.Operation.protobuf(proto:)();
}

uint64_t Message.Operation.init(protobuf:)()
{
  return Message.Operation.init(protobuf:)();
}

uint64_t type metadata accessor for Message.Operation()
{
  return type metadata accessor for Message.Operation();
}

uint64_t Message.init(operation:content:complete:)()
{
  return Message.init(operation:content:complete:)();
}

uint64_t Message.operation.getter()
{
  return Message.operation.getter();
}

uint64_t type metadata accessor for Message()
{
  return type metadata accessor for Message();
}

uint64_t LazyData.getData()()
{
  return LazyData.getData()();
}

uint64_t LazyData.__allocating_init(data:)()
{
  return LazyData.__allocating_init(data:)();
}

uint64_t LazyData.__allocating_init(filename:isTempFile:)()
{
  return LazyData.__allocating_init(filename:isTempFile:)();
}

uint64_t type metadata accessor for LazyData()
{
  return type metadata accessor for LazyData();
}

uint64_t static Platform.current.getter()
{
  return static Platform.current.getter();
}

uint64_t Platform.rawValue.getter()
{
  return Platform.rawValue.getter();
}

uint64_t ShuffleID.pets.getter()
{
  return ShuffleID.pets.getter();
}

uint64_t ShuffleID.nature.getter()
{
  return ShuffleID.nature.getter();
}

uint64_t ShuffleID.init(people:pets:nature:cityscape:)()
{
  return ShuffleID.init(people:pets:nature:cityscape:)();
}

uint64_t ShuffleID.people.getter()
{
  return ShuffleID.people.getter();
}

uint64_t ShuffleID.cityscape.getter()
{
  return ShuffleID.cityscape.getter();
}

uint64_t type metadata accessor for ShuffleID()
{
  return type metadata accessor for ShuffleID();
}

uint64_t _emptyDequeStorage.unsafeMutableAddressor()
{
  return _emptyDequeStorage.unsafeMutableAddressor();
}

Swift::Int __swiftcall Deque._Storage._growCapacity(to:linearly:)(Swift::Int to, Swift::Bool linearly)
{
  return Deque._Storage._growCapacity(to:linearly:)(to, linearly);
}

uint64_t BinaryDecodingOptions.init()()
{
  return BinaryDecodingOptions.init()();
}

uint64_t type metadata accessor for BinaryDecodingOptions()
{
  return type metadata accessor for BinaryDecodingOptions();
}

uint64_t Message.serializedData(partial:)()
{
  return Message.serializedData(partial:)();
}

uint64_t Message.init<A>(serializedBytes:extensions:partial:options:)()
{
  return Message.init<A>(serializedBytes:extensions:partial:options:)();
}

uint64_t static Message.with(_:)()
{
  return static Message.with(_:)();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t NWEndpoint.deviceName.getter()
{
  return NWEndpoint.deviceName.getter();
}

uint64_t type metadata accessor for NWEndpoint.Host()
{
  return type metadata accessor for NWEndpoint.Host();
}

uint64_t type metadata accessor for NWEndpoint.Port()
{
  return type metadata accessor for NWEndpoint.Port();
}

uint64_t type metadata accessor for NWEndpoint()
{
  return type metadata accessor for NWEndpoint();
}

uint64_t NWListener.__allocating_init(applicationService:using:)()
{
  return NWListener.__allocating_init(applicationService:using:)();
}

uint64_t NWListener.stateUpdateHandler.setter()
{
  return NWListener.stateUpdateHandler.setter();
}

uint64_t NWListener.newConnectionHandler.setter()
{
  return NWListener.newConnectionHandler.setter();
}

uint64_t type metadata accessor for NWListener.State()
{
  return type metadata accessor for NWListener.State();
}

uint64_t NWListener.start(queue:)()
{
  return NWListener.start(queue:)();
}

uint64_t type metadata accessor for NWListener()
{
  return type metadata accessor for NWListener();
}

uint64_t NWConnection.identifier.getter()
{
  return NWConnection.identifier.getter();
}

uint64_t NWConnection.parameters.getter()
{
  return NWConnection.parameters.getter();
}

uint64_t NWConnection.receiveFile(at:maximumLength:handler:)()
{
  return NWConnection.receiveFile(at:maximumLength:handler:)();
}

uint64_t static NWConnection.ContentContext.defaultMessage.getter()
{
  return static NWConnection.ContentContext.defaultMessage.getter();
}

uint64_t type metadata accessor for NWConnection.ContentContext()
{
  return type metadata accessor for NWConnection.ContentContext();
}

uint64_t type metadata accessor for NWConnection.SendCompletion()
{
  return type metadata accessor for NWConnection.SendCompletion();
}

uint64_t NWConnection.stateUpdateHandler.setter()
{
  return NWConnection.stateUpdateHandler.setter();
}

uint64_t NWConnection.init(to:using:)()
{
  return NWConnection.init(to:using:)();
}

uint64_t NWConnection.send(content:contentContext:isComplete:completion:)()
{
  return NWConnection.send(content:contentContext:isComplete:completion:)();
}

uint64_t static NWConnection.State.== infix(_:_:)()
{
  return static NWConnection.State.== infix(_:_:)();
}

uint64_t type metadata accessor for NWConnection.State()
{
  return type metadata accessor for NWConnection.State();
}

uint64_t NWConnection.start(queue:)()
{
  return NWConnection.start(queue:)();
}

uint64_t NWConnection.state.getter()
{
  return NWConnection.state.getter();
}

Swift::Void __swiftcall NWConnection.cancel()()
{
}

uint64_t NWConnection.receive(minimumIncompleteLength:maximumLength:completion:)()
{
  return NWConnection.receive(minimumIncompleteLength:maximumLength:completion:)();
}

uint64_t NWConnection.endpoint.getter()
{
  return NWConnection.endpoint.getter();
}

uint64_t NWConnection.metadata(definition:)()
{
  return NWConnection.metadata(definition:)();
}

uint64_t type metadata accessor for NWConnection()
{
  return type metadata accessor for NWConnection();
}

uint64_t NWParameters.includePeerToPeer.setter()
{
  return NWParameters.includePeerToPeer.setter();
}

uint64_t NWParameters.preferredNetworkAgents.setter()
{
  return NWParameters.preferredNetworkAgents.setter();
}

uint64_t dispatch thunk of NWParameters.ProtocolStack.applicationProtocols.getter()
{
  return dispatch thunk of NWParameters.ProtocolStack.applicationProtocols.getter();
}

uint64_t NWParameters.acceptLocalOnly.setter()
{
  return NWParameters.acceptLocalOnly.setter();
}

uint64_t type metadata accessor for NWParameters.MultipathServiceType()
{
  return type metadata accessor for NWParameters.MultipathServiceType();
}

uint64_t NWParameters.defaultProtocolStack.getter()
{
  return NWParameters.defaultProtocolStack.getter();
}

uint64_t NWParameters.multipathServiceType.setter()
{
  return NWParameters.multipathServiceType.setter();
}

uint64_t static NWParameters.applicationServiceQUIC(identity:)()
{
  return static NWParameters.applicationServiceQUIC(identity:)();
}

uint64_t NWParameters.nw.getter()
{
  return NWParameters.nw.getter();
}

uint64_t type metadata accessor for NWParameters()
{
  return type metadata accessor for NWParameters();
}

uint64_t static NWProtocolQUIC.definition.getter()
{
  return static NWProtocolQUIC.definition.getter();
}

uint64_t dispatch thunk of NWProtocolQUIC.Options.idleTimeout.setter()
{
  return dispatch thunk of NWProtocolQUIC.Options.idleTimeout.setter();
}

uint64_t type metadata accessor for NWProtocolQUIC.Options()
{
  return type metadata accessor for NWProtocolQUIC.Options();
}

uint64_t type metadata accessor for NWProtocolQUIC.Metadata.KeepAliveBehavior()
{
  return type metadata accessor for NWProtocolQUIC.Metadata.KeepAliveBehavior();
}

uint64_t dispatch thunk of NWProtocolQUIC.Metadata.keepAlive.getter()
{
  return dispatch thunk of NWProtocolQUIC.Metadata.keepAlive.getter();
}

uint64_t dispatch thunk of NWProtocolQUIC.Metadata.keepAlive.setter()
{
  return dispatch thunk of NWProtocolQUIC.Metadata.keepAlive.setter();
}

uint64_t type metadata accessor for NWProtocolQUIC.Metadata()
{
  return type metadata accessor for NWProtocolQUIC.Metadata();
}

uint64_t type metadata accessor for NWProtocolQUIC()
{
  return type metadata accessor for NWProtocolQUIC();
}

uint64_t static NWError.== infix(_:_:)()
{
  return static NWError.== infix(_:_:)();
}

uint64_t type metadata accessor for NWError()
{
  return type metadata accessor for NWError();
}

uint64_t type metadata accessor for NWBrowser.Descriptor()
{
  return type metadata accessor for NWBrowser.Descriptor();
}

uint64_t NWBrowser.parameters.getter()
{
  return NWBrowser.parameters.getter();
}

uint64_t NWBrowser.browseResults.getter()
{
  return NWBrowser.browseResults.getter();
}

uint64_t NWBrowser.stateUpdateHandler.setter()
{
  return NWBrowser.stateUpdateHandler.setter();
}

uint64_t NWBrowser.browseResultsChangedHandler.setter()
{
  return NWBrowser.browseResultsChangedHandler.setter();
}

uint64_t NWBrowser.init(for:using:)()
{
  return NWBrowser.init(for:using:)();
}

uint64_t type metadata accessor for NWBrowser.State()
{
  return type metadata accessor for NWBrowser.State();
}

uint64_t NWBrowser.start(queue:)()
{
  return NWBrowser.start(queue:)();
}

uint64_t type metadata accessor for NWBrowser.Result.Change.Flags()
{
  return type metadata accessor for NWBrowser.Result.Change.Flags();
}

uint64_t type metadata accessor for NWBrowser.Result.Change()
{
  return type metadata accessor for NWBrowser.Result.Change();
}

uint64_t NWBrowser.Result.endpoint.getter()
{
  return NWBrowser.Result.endpoint.getter();
}

uint64_t type metadata accessor for NWBrowser.Result()
{
  return type metadata accessor for NWBrowser.Result();
}

Swift::Void __swiftcall NWBrowser.cancel()()
{
}

uint64_t type metadata accessor for NWBrowser()
{
  return type metadata accessor for NWBrowser();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t CancellationError.init()()
{
  return CancellationError.init()();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Dictionary.description.getter()
{
  return Dictionary.description.getter();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._forceBridgeFromObjectiveC(_:result:)()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t Sequence.async.getter()
{
  return Sequence.async.getter();
}

uint64_t Sequence.sorted<A>(_:)()
{
  return Sequence.sorted<A>(_:)();
}

uint64_t dispatch thunk of RawRepresentable.rawValue.getter()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Array.description.getter()
{
  return Array.description.getter();
}

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

NSNumber __swiftcall Bool._bridgeToObjectiveC()()
{
  return (NSNumber)Bool._bridgeToObjectiveC()();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t CheckedContinuation.resume<>(success:error:)()
{
  return CheckedContinuation.resume<>(success:error:)();
}

uint64_t CheckedContinuation.resume(throwing:)()
{
  return CheckedContinuation.resume(throwing:)();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t type metadata accessor for CancellationError()
{
  return type metadata accessor for CancellationError();
}

uint64_t static MainActor.shared.getter()
{
  return static MainActor.shared.getter();
}

uint64_t type metadata accessor for MainActor()
{
  return type metadata accessor for MainActor();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

Swift::Void __swiftcall Task.cancel()()
{
}

uint64_t static Task<>.isCancelled.getter()
{
  return static Task<>.isCancelled.getter();
}

uint64_t static Task<>.checkCancellation()()
{
  return static Task<>.checkCancellation()();
}

uint64_t AsyncSequence.generic.getter()
{
  return AsyncSequence.generic.getter();
}

uint64_t AsyncSequence<>.throwing.getter()
{
  return AsyncSequence<>.throwing.getter();
}

uint64_t AsyncSequence<>.buffer(policy:)()
{
  return AsyncSequence<>.buffer(policy:)();
}

uint64_t dispatch thunk of AsyncSequence.makeAsyncIterator()()
{
  return dispatch thunk of AsyncSequence.makeAsyncIterator()();
}

NSSet __swiftcall Set._bridgeToObjectiveC()()
{
  return (NSSet)Set._bridgeToObjectiveC()();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Set.description.getter()
{
  return Set.description.getter();
}

uint64_t Set.init(minimumCapacity:)()
{
  return Set.init(minimumCapacity:)();
}

uint64_t Set.Iterator.init(_cocoa:)()
{
  return Set.Iterator.init(_cocoa:)();
}

uint64_t dispatch thunk of RandomAccessCollection.index(_:offsetBy:)()
{
  return dispatch thunk of RandomAccessCollection.index(_:offsetBy:)();
}

uint64_t dispatch thunk of Collection.startIndex.getter()
{
  return dispatch thunk of Collection.startIndex.getter();
}

uint64_t dispatch thunk of Collection.count.getter()
{
  return dispatch thunk of Collection.count.getter();
}

uint64_t dispatch thunk of Collection.subscript.read()
{
  return dispatch thunk of Collection.subscript.read();
}

uint64_t NSPredicate.init(format:_:)()
{
  return NSPredicate.init(format:_:)();
}

uint64_t PHFetchResult<>.collection.getter()
{
  return PHFetchResult<>.collection.getter();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.fault.getter()
{
  return static os_log_type_t.fault.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)()
{
  return static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t type metadata accessor for OS_dispatch_queue_serial.Attributes()
{
  return type metadata accessor for OS_dispatch_queue_serial.Attributes();
}

uint64_t OS_dispatch_queue_serial.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return OS_dispatch_queue_serial.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t _HashTable.previousHole(before:)()
{
  return _HashTable.previousHole(before:)();
}

uint64_t _HashTable.occupiedBucket(after:)()
{
  return _HashTable.occupiedBucket(after:)();
}

uint64_t _HashTable.nextHole(atOrAfter:)()
{
  return _HashTable.nextHole(atOrAfter:)();
}

uint64_t __CocoaSet.makeIterator()()
{
  return __CocoaSet.makeIterator()();
}

uint64_t __CocoaSet.count.getter()
{
  return __CocoaSet.count.getter();
}

uint64_t __CocoaSet.member(for:)()
{
  return __CocoaSet.member(for:)();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t __CocoaSet.contains(_:)()
{
  return __CocoaSet.contains(_:)();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t static _SetStorage.copy(original:)()
{
  return static _SetStorage.copy(original:)();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t static _SetStorage.convert(_:capacity:)()
{
  return static _SetStorage.convert(_:capacity:)();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return static _SetStorage.allocate(capacity:)();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t ContinuousClock.now.getter()
{
  return ContinuousClock.now.getter();
}

uint64_t static ContinuousClock.Instant.now.getter()
{
  return static ContinuousClock.Instant.now.getter();
}

uint64_t ContinuousClock.Instant.duration(to:)()
{
  return ContinuousClock.Instant.duration(to:)();
}

uint64_t type metadata accessor for ContinuousClock.Instant()
{
  return type metadata accessor for ContinuousClock.Instant();
}

uint64_t ContinuousClock.init()()
{
  return ContinuousClock.init()();
}

uint64_t type metadata accessor for ContinuousClock()
{
  return type metadata accessor for ContinuousClock();
}

uint64_t dispatch thunk of InstantProtocol.advanced(by:)()
{
  return dispatch thunk of InstantProtocol.advanced(by:)();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t AsyncMapSequence.init(_:transform:)()
{
  return AsyncMapSequence.init(_:transform:)();
}

uint64_t static DurationProtocol.*= infix(_:_:)()
{
  return static DurationProtocol.*= infix(_:_:)();
}

uint64_t FixedWidthInteger.serialized(version:)()
{
  return FixedWidthInteger.serialized(version:)();
}

uint64_t FixedWidthInteger.init(serialized:version:)()
{
  return FixedWidthInteger.init(serialized:version:)();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t AsyncThrowingMapSequence.init(_:transform:)()
{
  return AsyncThrowingMapSequence.init(_:transform:)();
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:)()
{
  return DefaultStringInterpolation.appendInterpolation<A>(_:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t dispatch thunk of Clock.now.getter()
{
  return dispatch thunk of Clock.now.getter();
}

uint64_t Error._getEmbeddedNSError()()
{
  return Error._getEmbeddedNSError()();
}

uint64_t Error._code.getter()
{
  return Error._code.getter();
}

uint64_t Error._domain.getter()
{
  return Error._domain.getter();
}

uint64_t Error._userInfo.getter()
{
  return Error._userInfo.getter();
}

NSNumber __swiftcall Int64._bridgeToObjectiveC()()
{
  return (NSNumber)Int64._bridgeToObjectiveC()();
}

uint64_t static Hasher._hash(seed:_:)()
{
  return static Hasher._hash(seed:_:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt32 a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt64 a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t Duration.timeInterval.getter()
{
  return Duration.timeInterval.getter();
}

uint64_t Duration.components.getter()
{
  return Duration.components.getter();
}

uint64_t Duration.description.getter()
{
  return Duration.description.getter();
}

uint64_t static Duration./ infix(_:_:)()
{
  return static Duration./ infix(_:_:)();
}

uint64_t static Duration.seconds(_:)()
{
  return static Duration.seconds(_:)();
}

uint64_t AXRuntimeCheck_MediaAnalysisSupport()
{
  return _AXRuntimeCheck_MediaAnalysisSupport();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

IOReturn IOPMAssertionCreateWithDescription(CFStringRef AssertionType, CFStringRef Name, CFStringRef Details, CFStringRef HumanReadableReason, CFStringRef LocalizationBundlePath, CFTimeInterval Timeout, CFStringRef TimeoutAction, IOPMAssertionID *AssertionID)
{
  return _IOPMAssertionCreateWithDescription(AssertionType, Name, Details, HumanReadableReason, LocalizationBundlePath, Timeout, TimeoutAction, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return _IOPMAssertionRelease(AssertionID);
}

uint64_t UIAccessibilityMetadataDescriptionForImage()
{
  return _UIAccessibilityMetadataDescriptionForImage();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

void bzero(void *a1, size_t a2)
{
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return _fsctl(a1, a2, a3, a4);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint64_t nw_parameters_set_account_id()
{
  return _nw_parameters_set_account_id();
}

uint64_t nw_parameters_set_attach_protocol_listener()
{
  return _nw_parameters_set_attach_protocol_listener();
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return _swift_allocateGenericClassMetadata();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_checkMetadataState()
{
  return _swift_checkMetadataState();
}

uint64_t swift_defaultActor_destroy()
{
  return _swift_defaultActor_destroy();
}

uint64_t swift_defaultActor_initialize()
{
  return _swift_defaultActor_initialize();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return _swift_getAssociatedConformanceWitness();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return _swift_getAssociatedTypeWitness();
}

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return _swift_initEnumMetadataMultiPayload();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return _swift_initEnumMetadataSinglePayload();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStaticObject()
{
  return _swift_initStaticObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_makeBoxUnique()
{
  return _swift_makeBoxUnique();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
}

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return _swift_stdlib_isStackAllocationSafe();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_task_isCurrentExecutor()
{
  return _swift_task_isCurrentExecutor();
}

uint64_t swift_task_reportUnexpectedExecutor()
{
  return _swift_task_reportUnexpectedExecutor();
}

uint64_t swift_unexpectedError()
{
  return _swift_unexpectedError();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_weakDestroy()
{
  return _swift_weakDestroy();
}

uint64_t swift_weakInit()
{
  return _swift_weakInit();
}

uint64_t swift_weakLoadStrong()
{
  return _swift_weakLoadStrong();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

uint64_t swift_willThrowTypedImpl()
{
  return _swift_willThrowTypedImpl();
}